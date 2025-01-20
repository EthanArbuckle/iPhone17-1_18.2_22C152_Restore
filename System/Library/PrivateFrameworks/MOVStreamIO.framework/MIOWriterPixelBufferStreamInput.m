@interface MIOWriterPixelBufferStreamInput
- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 pts:(id *)a4 error:(id *)a5;
- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 pts:(id *)a4 timeCode:(CVSMPTETime *)a5 error:(id *)a6;
- (BOOL)encoder:(id)a3 configureSessionOverride:(OpaqueVTCompressionSession *)a4 streamId:(id)a5;
- (BOOL)sampleReorderingEnabled;
- (BOOL)shouldEnableInProcessEncoding;
- (BOOL)strictlyEnforceBufferCapacity;
- (BOOL)trackEnabled;
- (CGAffineTransform)transform;
- (MIOFrameProcessor)processor;
- (MIOWriterPixelBufferStreamInput)init;
- (MIOWriterPixelBufferStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4 recordingConfig:(id)a5;
- (MIOWriterPixelBufferStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4 recordingConfig:(id)a5 timeCodeFormat:(opaqueCMFormatDescription *)a6;
- (MIOWriterTimeCodeSingleStreamInput)timeCodeStreamInput;
- (MOVStreamVideoEncoderInterface)videoEncoderInterface;
- (NSArray)attachmentsToEncode;
- (NSDictionary)config;
- (id)avMediaType;
- (id)encoder:(id)a3 overrideVideoEncoderSpecificationForStreamId:(id)a4;
- (id)inputSpecificTrackMetadataItems;
- (id)sampleInputOutputSettings;
- (id)stats;
- (id)underlyingInputs;
- (opaqueCMFormatDescription)formatDescription;
- (opaqueCMFormatDescription)timeCodeFormatDescription;
- (unsigned)encoder:(id)a3 codecTypeOverrideForstreamId:(id)a4;
- (void)customizeSampleInput:(id)a3;
- (void)dealloc;
- (void)encoder:(id)a3 encodedSampleBuffer:(opaqueCMSampleBuffer *)a4 metadata:(id)a5 presentationTime:(id *)a6 streamId:(id)a7;
- (void)encoder:(id)a3 encodingFailedForStream:(id)a4;
- (void)finishProcessing;
- (void)invalidate;
- (void)prepareInputFinished;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation MIOWriterPixelBufferStreamInput

- (MIOWriterPixelBufferStreamInput)init
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  NSLog(&cfstr_ErrorDoNotCall_0.isa, v4);

  return 0;
}

- (MIOWriterPixelBufferStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4 recordingConfig:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MIOWriterPixelBufferStreamInput;
  v10 = [(MIOWriterBufferStreamInput *)&v21 init];
  v11 = v10;
  if (v10)
  {
    [(MIOWriterStreamInput *)v10 setStreamId:v8];
    [(MIOWriterStreamInput *)v11 setMediaType:0];
    CFRetain(a4);
    v11->_inputFormatDesc = a4;
    timeCodeStreamInput = v11->_timeCodeStreamInput;
    v11->_timeCodeStreamInput = 0;

    objc_storeStrong((id *)&v11->_config, a5);
    uint64_t v13 = [v9 objectForKey:@"EncodeAttachments"];
    attachmentsToEncode = v11->_attachmentsToEncode;
    v11->_attachmentsToEncode = (NSArray *)v13;

    v15 = [v9 objectForKey:@"DoNotRecordAttachments"];
    -[MIOWriterBufferStreamInput setDoNotRecordAttachments:](v11, "setDoNotRecordAttachments:", [v15 BOOLValue]);

    uint64_t v16 = +[MIOFrameProcessorFactory processorForConfig:v9 formatDescription:a4];
    processor = v11->_processor;
    v11->_processor = (MIOFrameProcessor *)v16;

    long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v20[0] = *MEMORY[0x263F000D0];
    v20[1] = v18;
    v20[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [(MIOWriterPixelBufferStreamInput *)v11 setTransform:v20];
  }

  return v11;
}

- (MIOWriterPixelBufferStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4 recordingConfig:(id)a5 timeCodeFormat:(opaqueCMFormatDescription *)a6
{
  id v10 = a3;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MIOWriterPixelBufferStreamInput;
  v12 = [(MIOWriterBufferStreamInput *)&v25 init];
  uint64_t v13 = v12;
  if (v12)
  {
    [(MIOWriterStreamInput *)v12 setStreamId:v10];
    [(MIOWriterStreamInput *)v13 setMediaType:0];
    CFRetain(a4);
    v13->_inputFormatDesc = a4;
    v14 = [MIOWriterTimeCodeSingleStreamInput alloc];
    v15 = [NSString stringWithFormat:@"%@-time-code", v10];
    uint64_t v16 = [(MIOWriterTimeCodeSingleStreamInput *)v14 initWithStreamId:v15 format:a6];
    timeCodeStreamInput = v13->_timeCodeStreamInput;
    v13->_timeCodeStreamInput = (MIOWriterTimeCodeSingleStreamInput *)v16;

    [(MIOWriterStreamInput *)v13->_timeCodeStreamInput registerForAssociating:v13 trackRelation:*MEMORY[0x263EFA1B8]];
    objc_storeStrong((id *)&v13->_config, a5);
    uint64_t v18 = [v11 objectForKey:@"EncodeAttachments"];
    attachmentsToEncode = v13->_attachmentsToEncode;
    v13->_attachmentsToEncode = (NSArray *)v18;

    uint64_t v20 = +[MIOFrameProcessorFactory processorForConfig:v11 formatDescription:a4];
    processor = v13->_processor;
    v13->_processor = (MIOFrameProcessor *)v20;

    long long v22 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v24[0] = *MEMORY[0x263F000D0];
    v24[1] = v22;
    v24[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [(MIOWriterPixelBufferStreamInput *)v13 setTransform:v24];
  }

  return v13;
}

- (void)dealloc
{
  videoEncoderInterface = self->_videoEncoderInterface;
  if (videoEncoderInterface) {
    [(MOVStreamVideoEncoderInterface *)videoEncoderInterface awaitEncoderClosed];
  }
  inputFormatDesc = self->_inputFormatDesc;
  if (inputFormatDesc)
  {
    CFRelease(inputFormatDesc);
    self->_inputFormatDesc = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)MIOWriterPixelBufferStreamInput;
  [(MIOWriterPixelBufferStreamInput *)&v5 dealloc];
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)MIOWriterPixelBufferStreamInput;
  [(MIOWriterStreamInput *)&v7 invalidate];
  if (self->_videoEncoderInterface)
  {
    v3 = dispatch_group_create();
    [(MOVStreamVideoEncoderInterface *)self->_videoEncoderInterface closeEncoderInDispatchGroup:v3];
    dispatch_time_t v4 = dispatch_time(0, 1000000000);
    if (dispatch_group_wait(v3, v4))
    {
      objc_super v5 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = [(MIOWriterStreamInput *)self streamId];
        *(_DWORD *)buf = 138543362;
        id v9 = v6;
        _os_log_impl(&dword_21B5ED000, v5, OS_LOG_TYPE_ERROR, "Timeout closing encoder: %{public}@.", buf, 0xCu);
      }
    }
  }
}

- (id)stats
{
  v3 = NSString;
  dispatch_time_t v4 = [(MIOWriterStreamInput *)self uuid];
  int64_t v5 = [(MIOWriterStreamInput *)self pendingSamples];
  v6 = [(MIOWriterStreamInput *)self fifoBuffer];
  uint64_t v7 = [v6 usage];
  id v8 = [(MIOWriterPixelBufferStreamInput *)self videoEncoderInterface];
  uint64_t v9 = [v8 encodingQueueDepth];
  uint64_t v10 = [(MIOWriterPixelBufferStreamInput *)self videoEncoderInterface];
  id v11 = [v3 stringWithFormat:@"%@: PEND: %lld (FIFO: %zu ECDQ: %lld ENC: %lld) REDY: %d", v4, v5, v7, v9, objc_msgSend(v10, "pendingFrames"), -[MIOWriterBufferStreamInput areAllInputsReady](self, "areAllInputsReady")];

  return v11;
}

- (id)underlyingInputs
{
  v4[1] = *MEMORY[0x263EF8340];
  if (self->_timeCodeStreamInput)
  {
    v4[0] = self->_timeCodeStreamInput;
    v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x263EFFA68];
  }

  return v2;
}

- (id)avMediaType
{
  return (id)*MEMORY[0x263EF9D48];
}

- (id)sampleInputOutputSettings
{
  v3 = [(MIOWriterPixelBufferStreamInput *)self processor];
  uint64_t v4 = [v3 formatDescriptionForEncoding];

  config = self->_config;
  v6 = [(MIOWriterStreamInput *)self writer];
  [v6 defaultFrameRate];
  double v8 = v7;
  uint64_t v9 = [(MIOWriterStreamInput *)self writer];
  uint64_t v10 = [v9 preferCustomCompression];
  id v11 = [(MIOWriterStreamInput *)self writer];
  v12 = +[MIOOutputSettingsFactory outputSettingsWithConfig:formatDescription:defaultFrameRate:preferEncoderConfig:enableAVEHighPerformanceProfile:](MIOOutputSettingsFactory, "outputSettingsWithConfig:formatDescription:defaultFrameRate:preferEncoderConfig:enableAVEHighPerformanceProfile:", config, v4, v10, [v11 enableAVEHighPerformanceProfile], v8);

  uint64_t v13 = [v12 config];

  if (v13)
  {
    v14 = [MOVStreamVideoEncoderInterface alloc];
    v15 = [(MIOWriterStreamInput *)self streamId];
    uint64_t v16 = [v12 config];
    v17 = [(MOVStreamVideoEncoderInterface *)v14 initForStream:v15 configuration:v16 delegate:self];
    videoEncoderInterface = self->_videoEncoderInterface;
    self->_videoEncoderInterface = v17;

    [(MOVStreamVideoEncoderInterface *)self->_videoEncoderInterface setUseLegacyVTController:0];
    if (![(MOVStreamVideoEncoderInterface *)self->_videoEncoderInterface preSetupWithFormatDescription:v4])
    {
      v19 = [NSString stringWithFormat:@"Orig fd: %@  Used fd: %@", self->_inputFormatDesc, v4];
      uint64_t v20 = NSString;
      objc_super v21 = [(MIOWriterStreamInput *)self streamId];
      long long v22 = [v20 stringWithFormat:@"Pre-initialize VTCompressionSession for stream '%@' failed (%@)! Will try again after first pixel buffer is appended...", v21, v19];

      v23 = [(MIOWriterStreamInput *)self writer];
      [v23 reportWarning:v22];
    }
    v24 = 0;
  }
  else
  {
    objc_super v25 = [v12 settings];
    if (v25)
    {
      v26 = [(MIOWriterStreamInput *)self writer];
      int v27 = [v26 inProcessRecording];

      if (v27)
      {
        v28 = NSString;
        v29 = [(MIOWriterStreamInput *)self streamId];
        v30 = [v28 stringWithFormat:@"MIOWriter.inProcessRecording requires custom or none encoder settings. Encoding for stream %@ will not performed in process!", v29];

        v31 = [(MIOWriterStreamInput *)self writer];
        [v31 reportWarning:v30];
      }
    }
    v24 = [v12 settings];
  }

  return v24;
}

- (opaqueCMFormatDescription)formatDescription
{
  v2 = [(MIOWriterPixelBufferStreamInput *)self processor];
  v3 = (opaqueCMFormatDescription *)[v2 formatDescriptionForEncoding];

  return v3;
}

- (opaqueCMFormatDescription)timeCodeFormatDescription
{
  return [(MIOWriterTimeCodeSingleStreamInput *)self->_timeCodeStreamInput formatDescription];
}

- (BOOL)sampleReorderingEnabled
{
  videoEncoderInterface = self->_videoEncoderInterface;
  if (videoEncoderInterface) {
    LOBYTE(videoEncoderInterface) = [(MOVStreamVideoEncoderInterface *)videoEncoderInterface frameReorderingEnabled];
  }
  return (char)videoEncoderInterface;
}

- (BOOL)strictlyEnforceBufferCapacity
{
  return self->_videoEncoderInterface != 0;
}

- (BOOL)trackEnabled
{
  v3 = [(NSDictionary *)self->_config objectForKey:@"MarksOutputTrackAsEnabled"];
  uint64_t v4 = v3;
  if (v3)
  {
    char v5 = [v3 BOOLValue];
  }
  else
  {
    v6 = [(MIOWriterStreamInput *)self writer];
    double v7 = [v6 writerInputsWithMediaType:0];
    uint64_t v8 = [v7 count];

    if (v8 == 1) {
      goto LABEL_4;
    }
    signed int MediaSubType = CMFormatDescriptionGetMediaSubType(self->_inputFormatDesc);
    char v5 = 0;
    if (MediaSubType > 1650943795)
    {
      if (MediaSubType > 1735549491)
      {
        BOOL v10 = MediaSubType == 1735549492;
        int v11 = 1919379252;
      }
      else
      {
        BOOL v10 = MediaSubType == 1650943796;
        int v11 = 1734505012;
      }
    }
    else if (MediaSubType > 1278226735)
    {
      BOOL v10 = MediaSubType == 1278226736;
      int v11 = 1278226742;
    }
    else
    {
      BOOL v10 = MediaSubType == 825306677;
      int v11 = 825437747;
    }
    if (!v10 && MediaSubType != v11) {
LABEL_4:
    }
      char v5 = 1;
  }

  return v5;
}

- (void)prepareInputFinished
{
  id v5 = [(MIOWriterStreamInput *)self writer];
  uint64_t v3 = [v5 bufferCacheMode];
  uint64_t v4 = [(MIOWriterPixelBufferStreamInput *)self processor];
  [v4 setBufferCacheMode:v3];
}

- (id)inputSpecificTrackMetadataItems
{
  uint64_t v3 = objc_opt_new();
  uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(self->_inputFormatDesc);
  id v5 = [MEMORY[0x263EFA748] trackMetadataItemWithInputPixelFormat:MediaSubType];
  if (v5) {
    [v3 addObject:v5];
  }
  if (+[MIOPixelBufferUtility isPixelFormatRawBayer:MediaSubType])
  {
    v6 = [(NSDictionary *)self->_config objectForKey:@"RawBayerRearrangeTypeKey"];
    double v7 = [MEMORY[0x263EFA748] trackMetadataItemWithRawBayerRearrangeType:v6];

    if (v7) {
      [v3 addObject:v7];
    }
  }
  else
  {
    double v7 = v5;
  }
  uint64_t v8 = [(NSDictionary *)self->_config objectForKey:@"OutputPixelFormatOverride"];
  uint64_t v9 = v8;
  if (v8)
  {
    BOOL v10 = objc_msgSend(MEMORY[0x263EFA748], "trackMetadataItemWithOutputPixelFormatOverride:", objc_msgSend(v8, "intValue"));
    if (v10) {
      [v3 addObject:v10];
    }
  }
  int v11 = [(MIOWriterPixelBufferStreamInput *)self processor];
  uint64_t v12 = [v11 encodedPixelFormat];

  uint64_t v13 = [MEMORY[0x263EFA748] trackMetadataItemWithEncodedPixelFormat:v12];

  if (v13) {
    [v3 addObject:v13];
  }
  v14 = [(NSDictionary *)self->_config objectForKey:@"StereoVideoEncoding"];

  if (v14)
  {
    v15 = [(NSDictionary *)self->_config objectForKey:@"StereoVideoEncoding"];
    v14 = (void *)[v15 BOOLValue];
  }
  uint64_t v16 = [MEMORY[0x263EFA748] trackMetadataItemWithStereoViewEncoding:v14];

  if (v16) {
    [v3 addObject:v16];
  }
  v17 = [(NSDictionary *)self->_config objectForKey:@"AdditionalCompressionProperties"];

  if (v17)
  {
    uint64_t v18 = [(NSDictionary *)self->_config objectForKey:@"AdditionalCompressionProperties"];
    id v26 = 0;
    v19 = [MEMORY[0x263EFA748] trackMetadataItemWithAdditionalCompressionProperties:v18 error:&v26];
    id v20 = v26;

    if (v20)
    {
      objc_super v21 = NSString;
      long long v22 = [(MIOWriterStreamInput *)self streamId];
      v23 = [v21 stringWithFormat:@"Cannot create track metadata item for additional encoder settings of stream %@. Error: %@", v22, v20];

      v24 = [(MIOWriterStreamInput *)self writer];
      [v24 reportWarning:v23];
    }
    else if (v19)
    {
      [v3 addObject:v19];
    }
  }
  else
  {
    v19 = v16;
  }

  return v3;
}

- (void)customizeSampleInput:(id)a3
{
  id v4 = a3;
  [(MIOWriterPixelBufferStreamInput *)self transform];
  v5[0] = v5[3];
  v5[1] = v5[4];
  v5[2] = v5[5];
  [v4 setTransform:v5];
  objc_msgSend(v4, "setMarksOutputTrackAsEnabled:", -[MIOWriterPixelBufferStreamInput trackEnabled](self, "trackEnabled"));
}

- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 pts:(id *)a4 error:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a4;
  memset(v6, 0, sizeof(v6));
  return [(MIOWriterPixelBufferStreamInput *)self appendPixelBuffer:a3 pts:&v7 timeCode:v6 error:a5];
}

- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 pts:(id *)a4 timeCode:(CVSMPTETime *)a5 error:(id *)a6
{
  uint64_t v9 = (uint64_t)self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = *a4;
  if ([(MIOWriterStreamInput *)self prepareForAppendWithTimeStamp:&v22 error:a6])
  {
    CVPixelBufferRetain(a3);
    objc_initWeak(&location, (id)v9);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __72__MIOWriterPixelBufferStreamInput_appendPixelBuffer_pts_timeCode_error___block_invoke;
    v15[3] = &unk_2643AFAE0;
    objc_copyWeak(v16, &location);
    long long v17 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    long long v19 = *(_OWORD *)&a5->subframes;
    uint64_t v20 = *(void *)&a5->hours;
    v16[1] = a3;
    v15[4] = v9;
    BOOL v10 = (uint64_t (**)(void))MEMORY[0x21D492700](v15);
    uint64_t v11 = [(id)v9 threadingOption];
    if (v11)
    {
      if (v11 == 1) {
        LOBYTE(v9) = v10[2](v10);
      }
    }
    else
    {
      uint64_t v9 = [(id)v9 processingQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __72__MIOWriterPixelBufferStreamInput_appendPixelBuffer_pts_timeCode_error___block_invoke_243;
      block[3] = &unk_2643AF5D0;
      v14 = v10;
      dispatch_async((dispatch_queue_t)v9, block);

      LOBYTE(v9) = 1;
    }

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9 & 1;
}

uint64_t __72__MIOWriterPixelBufferStreamInput_appendPixelBuffer_pts_timeCode_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained perfLogHandle];
    os_signpost_id_t v5 = [v3 processingSignPostID];
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      LOWORD(buf.duration.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_21B5ED000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "mio.processing", (const char *)&unk_21B668A56, (uint8_t *)&buf, 2u);
    }

    v6 = (void *)MEMORY[0x21D4924B0]();
    if ([v3 doNotRecordAttachments])
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = 0;
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 48);
      long long v82 = *(_OWORD *)(a1 + 56);
      uint64_t v83 = *(void *)(a1 + 72);
      id v81 = 0;
      $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = [MEMORY[0x263EFA8C0] attachmentsMIOTimedMetadataGroupForPixelBuffer:v9 pts:&v82 error:&v81];
      id v10 = v81;
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = NSString;
        uint64_t v13 = [v3 streamId];
        v14 = [v12 stringWithFormat:@"Cannot append frame, invalid pixel buffer attachments %@ for stream %@.", v11, v13];

        v15 = [MEMORY[0x263F087E8] streamErrorWithMessage:v14 code:21];
        uint64_t v16 = [v3 writer];
        [v16 reportError:v15];

        CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
        long long v17 = [v3 perfLogHandle];
        os_signpost_id_t v18 = [v3 processingSignPostID];
        if (v18 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v17)) {
          goto LABEL_38;
        }
        LOWORD(buf.duration.value) = 0;
        goto LABEL_37;
      }
    }
    long long v19 = [v3 timeCodeStreamInput];
    if (!v19 || (int v20 = *(_DWORD *)(a1 + 92), v19, (v20 & 1) == 0))
    {
      objc_super v21 = 0;
LABEL_15:
      $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = [v3 processor];
      uint64_t v23 = *(void *)(a1 + 48);
      v24 = [v3 attachmentsToEncode];
      id v75 = v21;
      objc_super v25 = (__CVBuffer *)[v22 processPixelBuffer:v23 preserveAttachments:v24 error:&v75];
      id v11 = v75;

      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
      if (v25)
      {
        id v26 = [v3 videoEncoderInterface];

        if (v26)
        {
          int v27 = objc_opt_new();
          [v27 setMetadata:v7];
          v28 = [v3 pendingAttachments];
          uint64_t v8 = [v28 enqueue:v27];

          if (v8)
          {
            v29 = [v3 videoEncoderInterface];
            long long v73 = *(_OWORD *)(a1 + 56);
            uint64_t v74 = *(void *)(a1 + 72);
            [v29 encodeFrame:v25 pts:&v73 frameProperties:0 metadata:0];

            CVPixelBufferRelease(v25);
          }
          else
          {
            v52 = NSString;
            v53 = [v3 streamId];
            v54 = [v52 stringWithFormat:@"Attempted to enqueue metadata in full Fifo for stream %@.  Indicates leak in overall pending sample metadata tracking.", v53];

            v55 = [MEMORY[0x263F087E8] streamErrorWithMessage:v54 code:21];
            v56 = [v3 writer];
            [v56 reportError:v55];

            CFRelease(v25);
            v57 = [v3 perfLogHandle];
            os_signpost_id_t v58 = [v3 processingSignPostID];
            if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
            {
              LOWORD(buf.duration.value) = 0;
              _os_signpost_emit_with_name_impl(&dword_21B5ED000, v57, OS_SIGNPOST_INTERVAL_END, v58, "mio.processing", (const char *)&unk_21B668A56, (uint8_t *)&buf, 2u);
            }
          }
          goto LABEL_40;
        }
        long long v39 = *(_OWORD *)(MEMORY[0x263F01110] + 48);
        *(_OWORD *)&buf.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x263F01110] + 32);
        *(_OWORD *)&buf.decodeTimeStamp.value = v39;
        CMTimeEpoch v40 = *(void *)(MEMORY[0x263F01110] + 64);
        long long v41 = *(_OWORD *)(MEMORY[0x263F01110] + 16);
        *(_OWORD *)&buf.duration.value = *MEMORY[0x263F01110];
        *(_OWORD *)&buf.duration.epoch = v41;
        *(_OWORD *)&buf.presentationTimeStamp.value = *(_OWORD *)(a1 + 56);
        CMTimeEpoch v42 = *(void *)(a1 + 72);
        buf.decodeTimeStamp.epoch = v40;
        buf.presentationTimeStamp.epoch = v42;
        CMSampleBufferRef sampleBufferOut = 0;
        v43 = (const opaqueCMFormatDescription *)[*(id *)(a1 + 32) formatDescription];
        uint64_t v44 = CMSampleBufferCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], v25, 1u, 0, 0, v43, &buf, &sampleBufferOut);
        CVPixelBufferRelease(v25);
        if (v44)
        {
          v45 = NSString;
          v46 = [v3 streamId];
          v47 = [v45 stringWithFormat:@"Cannot append frame, CMSampleBufferCreateForImageBuffer failed (err:%d) for stream %@.", v44, v46];

          v48 = [MEMORY[0x263F087E8] streamErrorWithMessage:v47 code:21];
          v49 = [v3 writer];
          [v49 reportError:v48];

          v50 = [v3 perfLogHandle];
          os_signpost_id_t v51 = [v3 processingSignPostID];
          if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
          {
            *(_WORD *)v70 = 0;
            _os_signpost_emit_with_name_impl(&dword_21B5ED000, v50, OS_SIGNPOST_INTERVAL_END, v51, "mio.processing", (const char *)&unk_21B668A56, v70, 2u);
          }
        }
        else
        {
          v47 = objc_opt_new();
          [v47 setSampleBuffer:sampleBufferOut];
          [v47 setMetadata:v7];
          v63 = [v3 fifoBuffer];
          char v64 = [v63 enqueue:v47];

          if (v64)
          {
            uint64_t v8 = [v3 finalizeProcessing];
LABEL_49:

            goto LABEL_40;
          }
          v65 = NSString;
          v66 = [v3 streamId];
          v48 = [v65 stringWithFormat:@"Attempted to enqueue sample in full Fifo for stream %@.  Indicates leak in overall pending sample tracking.", v66];

          v50 = [MEMORY[0x263F087E8] streamErrorWithMessage:v48 code:21];
          v67 = [v3 writer];
          [v67 reportError:v50];

          CFRelease(sampleBufferOut);
          v68 = [v3 perfLogHandle];
          os_signpost_id_t v69 = [v3 processingSignPostID];
          if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
          {
            *(_WORD *)v70 = 0;
            _os_signpost_emit_with_name_impl(&dword_21B5ED000, v68, OS_SIGNPOST_INTERVAL_END, v69, "mio.processing", (const char *)&unk_21B668A56, v70, 2u);
          }
        }
        uint64_t v8 = 0;
        goto LABEL_49;
      }
      v30 = NSString;
      v31 = [v3 streamId];
      v32 = [v30 stringWithFormat:@"Process pixel buffer failed %@ for stream %@.", v11, v31];

      v33 = [MEMORY[0x263F087E8] streamErrorWithMessage:v32 code:21];
      v34 = [v3 writer];
      [v34 reportError:v33];

      v35 = [v3 perfLogHandle];
      os_signpost_id_t v36 = [v3 processingSignPostID];
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        LOWORD(buf.duration.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v35, OS_SIGNPOST_INTERVAL_END, v36, "mio.processing", (const char *)&unk_21B668A56, (uint8_t *)&buf, 2u);
      }

LABEL_39:
      uint64_t v8 = 0;
LABEL_40:

      goto LABEL_41;
    }
    v37 = [v3 timeCodeStreamInput];
    long long v79 = *(_OWORD *)(a1 + 80);
    uint64_t v80 = *(void *)(a1 + 96);
    long long v77 = *(_OWORD *)(a1 + 56);
    uint64_t v78 = *(void *)(a1 + 72);
    id v76 = 0;
    char v38 = [v37 appendTimeCode:&v79 pts:&v77 error:&v76];
    id v11 = v76;

    if (v38)
    {
      objc_super v21 = v11;
      goto LABEL_15;
    }
    v59 = NSString;
    v60 = [v3 streamId];
    v14 = [v59 stringWithFormat:@"Cannot append time code to underlying tmcd stream for video stream %@.", v60];

    v15 = [MEMORY[0x263F087E8] streamErrorWithMessage:v14 code:21];
    v61 = [v3 writer];
    [v61 reportError:v15];

    CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
    long long v17 = [v3 perfLogHandle];
    os_signpost_id_t v18 = [v3 processingSignPostID];
    if (v18 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v17))
    {
LABEL_38:

      goto LABEL_39;
    }
    LOWORD(buf.duration.value) = 0;
LABEL_37:
    _os_signpost_emit_with_name_impl(&dword_21B5ED000, v17, OS_SIGNPOST_INTERVAL_END, v18, "mio.processing", (const char *)&unk_21B668A56, (uint8_t *)&buf, 2u);
    goto LABEL_38;
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
  uint64_t v8 = 0;
LABEL_41:

  return v8;
}

uint64_t __72__MIOWriterPixelBufferStreamInput_appendPixelBuffer_pts_timeCode_error___block_invoke_243(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finishProcessing
{
  videoEncoderInterface = self->_videoEncoderInterface;
  if (videoEncoderInterface) {
    [(MOVStreamVideoEncoderInterface *)videoEncoderInterface awaitEncoderClosed];
  }
}

- (BOOL)shouldEnableInProcessEncoding
{
  v2 = [(MIOWriterStreamInput *)self writer];
  char v3 = [v2 inProcessRecording];

  return v3;
}

- (void)encoder:(id)a3 encodedSampleBuffer:(opaqueCMSampleBuffer *)a4 metadata:(id)a5 presentationTime:(id *)a6 streamId:(id)a7
{
  uint64_t v9 = [(MIOWriterBufferStreamInput *)self pendingAttachments];
  id v19 = [v9 dequeue];

  id v10 = objc_opt_new();
  [v10 setSampleBuffer:a4];
  id v11 = [v19 metadata];
  [v10 setMetadata:v11];

  uint64_t v12 = [(MIOWriterStreamInput *)self fifoBuffer];
  char v13 = [v12 enqueue:v10];

  if (v13)
  {
    [(MIOWriterStreamInput *)self finalizeProcessing];
  }
  else
  {
    v14 = NSString;
    v15 = [(MIOWriterStreamInput *)self streamId];
    uint64_t v16 = [v14 stringWithFormat:@"Attempted to enqueue sample in full Fifo for stream %@.  Indicates leak in overall pending sample tracking.", v15];

    long long v17 = [MEMORY[0x263F087E8] streamErrorWithMessage:v16 code:21];
    os_signpost_id_t v18 = [(MIOWriterStreamInput *)self writer];
    [v18 reportError:v17];
  }
}

- (void)encoder:(id)a3 encodingFailedForStream:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = [NSString stringWithFormat:@"Sample buffer encoding failed (encoder status: %i flags: %d) for stream '%@'. Dropping frame.", objc_msgSend(v10, "lastEncodingStatus"), objc_msgSend(v10, "lastEncodingInfoFlags"), v6];
  uint64_t v8 = [MEMORY[0x263F087E8] streamErrorWithMessage:v7 code:14];
  uint64_t v9 = [(MIOWriterStreamInput *)self writer];
  [v9 reportError:v8];

  [(MIOWriterStreamInput *)self resolveSample];
}

- (unsigned)encoder:(id)a3 codecTypeOverrideForstreamId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[MIOWriterPixelBufferStreamInput encoder:codecTypeOverrideForstreamId:]", "MIOWriterPixelBufferStreamInput.mm", 495, "0");
}

- (BOOL)encoder:(id)a3 configureSessionOverride:(OpaqueVTCompressionSession *)a4 streamId:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  __assert_rtn("-[MIOWriterPixelBufferStreamInput encoder:configureSessionOverride:streamId:]", "MIOWriterPixelBufferStreamInput.mm", 501, "0");
}

- (id)encoder:(id)a3 overrideVideoEncoderSpecificationForStreamId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[MIOWriterPixelBufferStreamInput encoder:overrideVideoEncoderSpecificationForStreamId:]", "MIOWriterPixelBufferStreamInput.mm", 507, "0");
}

- (CGAffineTransform)transform
{
  objc_copyStruct(retstr, &self->_transform, 48, 1, 0);
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
}

- (MOVStreamVideoEncoderInterface)videoEncoderInterface
{
  return (MOVStreamVideoEncoderInterface *)objc_getProperty(self, a2, 264, 1);
}

- (MIOWriterTimeCodeSingleStreamInput)timeCodeStreamInput
{
  return (MIOWriterTimeCodeSingleStreamInput *)objc_getProperty(self, a2, 272, 1);
}

- (NSDictionary)config
{
  return (NSDictionary *)objc_getProperty(self, a2, 280, 1);
}

- (NSArray)attachmentsToEncode
{
  return (NSArray *)objc_getProperty(self, a2, 288, 1);
}

- (MIOFrameProcessor)processor
{
  return (MIOFrameProcessor *)objc_getProperty(self, a2, 296, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_attachmentsToEncode, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_timeCodeStreamInput, 0);

  objc_storeStrong((id *)&self->_videoEncoderInterface, 0);
}

@end