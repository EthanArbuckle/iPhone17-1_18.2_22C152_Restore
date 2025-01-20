@interface MIOWriterBufferStreamInput
- (AVAssetWriterInput)metadataInput;
- (AVAssetWriterInput)sampleInput;
- (AVAssetWriterInput)timeCodeInput;
- (AVAssetWriterInputMetadataAdaptor)metadataAdaptor;
- (AVAssetWriterInputMetadataAdaptor)timeCodeAdaptor;
- (AVAssetWriterInputTaggedPixelBufferGroupAdaptor)taggedPixelBufferGroupAdaptor;
- (BOOL)applyWriterTimeScaleToSampleInput;
- (BOOL)areAllInputsReady;
- (BOOL)doNotRecordAttachments;
- (BOOL)sampleReorderingEnabled;
- (BOOL)setupInputsWithWriter:(id)a3 error:(id *)a4;
- (BOOL)writeNextItemFromFifo;
- (MIOFifoBuffer)pendingAttachments;
- (MIOWriterBufferStreamInput)init;
- (id)allWriterInputs;
- (id)avMediaType;
- (id)commonTrackMetadataItems;
- (id)inputSpecificTrackMetadataItems;
- (id)mainAVInput;
- (id)sampleInputOutputSettings;
- (id)taggedPixelBufferAttributes;
- (opaqueCMFormatDescription)formatDescription;
- (opaqueCMFormatDescription)timeCodeFormatDescription;
- (void)customizeMetadataInput:(id)a3;
- (void)customizeSampleInput:(id)a3;
- (void)setDoNotRecordAttachments:(BOOL)a3;
- (void)setTaggedPixelBufferGroupAdaptor:(id)a3;
@end

@implementation MIOWriterBufferStreamInput

- (MIOWriterBufferStreamInput)init
{
  v3.receiver = self;
  v3.super_class = (Class)MIOWriterBufferStreamInput;
  return [(MIOWriterStreamInput *)&v3 init];
}

- (id)avMediaType
{
}

- (id)sampleInputOutputSettings
{
}

- (opaqueCMFormatDescription)formatDescription
{
}

- (opaqueCMFormatDescription)timeCodeFormatDescription
{
}

- (void)customizeSampleInput:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[MIOWriterBufferStreamInput customizeSampleInput:]", "MIOWriterBufferStreamInput.m", 80, "0");
}

- (void)customizeMetadataInput:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[MIOWriterBufferStreamInput customizeMetadataInput:]", "MIOWriterBufferStreamInput.m", 91, "0");
}

- (BOOL)sampleReorderingEnabled
{
}

- (BOOL)applyWriterTimeScaleToSampleInput
{
  return 1;
}

- (id)taggedPixelBufferAttributes
{
  return 0;
}

- (id)inputSpecificTrackMetadataItems
{
  return 0;
}

- (id)allWriterInputs
{
  v7[1] = *MEMORY[0x263EF8340];
  v7[0] = self->_sampleInput;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v4 = (void *)[v3 mutableCopy];

  if (self->_timeCodeInput) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_metadataInput) {
    objc_msgSend(v4, "addObject:");
  }
  v5 = (void *)[v4 copy];

  return v5;
}

- (BOOL)areAllInputsReady
{
  id v3 = [(MIOWriterBufferStreamInput *)self sampleInput];
  int v4 = [v3 isReadyForMoreMediaData];

  if (self->_timeCodeInput)
  {
    if (!v4) {
      return 0;
    }
    v5 = [(MIOWriterBufferStreamInput *)self timeCodeInput];
    int v4 = [v5 isReadyForMoreMediaData];
  }
  metadataInput = self->_metadataInput;
  if (metadataInput) {
    BOOL result = 0;
  }
  else {
    BOOL result = v4;
  }
  if (metadataInput) {
    BOOL v8 = v4 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    v9 = [(MIOWriterBufferStreamInput *)self metadataInput];
    char v10 = [v9 isReadyForMoreMediaData];

    return v10;
  }
  return result;
}

- (id)mainAVInput
{
  return self->_sampleInput;
}

- (id)commonTrackMetadataItems
{
  id v3 = objc_opt_new();
  int v4 = (void *)MEMORY[0x263EFA748];
  v5 = [(MIOWriterStreamInput *)self streamId];
  v6 = [v4 trackMetadataItemWithStreamId:v5];

  if (v6) {
    [v3 addObject:v6];
  }
  v7 = (void *)MEMORY[0x263EFA748];
  BOOL v8 = [(MIOWriterStreamInput *)self streamId];
  v9 = [v7 qtTrackMetadataItemsForStreamId:v8];
  [v3 addObjectsFromArray:v9];

  char v10 = [MEMORY[0x263EFA748] trackMetadataItemWithSerializationMode:1];

  if (v10) {
    [v3 addObject:v10];
  }
  v11 = (void *)MEMORY[0x263EFA748];
  v12 = [(MIOWriterStreamInput *)self customMetadata];
  v13 = [v11 customTrackMetadataItems:v12];

  if ([v13 count]) {
    [v3 addObjectsFromArray:v13];
  }
  v14 = [(MIOWriterStreamInput *)self customMetadataItems];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    v16 = [(MIOWriterStreamInput *)self customMetadataItems];
    [v3 addObjectsFromArray:v16];
  }

  return v3;
}

- (BOOL)setupInputsWithWriter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MIOWriterBufferStreamInput *)self sampleInputOutputSettings];
  BOOL v8 = [(MIOWriterBufferStreamInput *)self avMediaType];
  v9 = [(MIOWriterBufferStreamInput *)self formatDescription];
  char v10 = [v6 avWriter];
  char v11 = [v10 canApplyOutputSettings:v7 forMediaType:v8];

  if (v11)
  {
    v57 = a4;
    v12 = (AVAssetWriterInput *)[objc_alloc(MEMORY[0x263EFA520]) initWithMediaType:v8 outputSettings:v7 sourceFormatHint:v9];
    sampleInput = self->_sampleInput;
    self->_sampleInput = v12;

    -[AVAssetWriterInput setExpectsMediaDataInRealTime:](self->_sampleInput, "setExpectsMediaDataInRealTime:", [v6 realTime]);
    if ([(MIOWriterBufferStreamInput *)self applyWriterTimeScaleToSampleInput])
    {
      if ([(MIOWriterStreamInput *)self mediaTimeScale] < 1)
      {
        v18 = [(MIOWriterStreamInput *)self writer];
        -[AVAssetWriterInput setMediaTimeScale:](self->_sampleInput, "setMediaTimeScale:", [v18 baseMediaTimeScale]);
      }
      else
      {
        [(AVAssetWriterInput *)self->_sampleInput setMediaTimeScale:[(MIOWriterStreamInput *)self mediaTimeScale]];
      }
    }
    v19 = [(MIOWriterBufferStreamInput *)self commonTrackMetadataItems];
    v20 = (void *)[v19 mutableCopy];

    v21 = [(MIOWriterBufferStreamInput *)self inputSpecificTrackMetadataItems];
    if ([v21 count]) {
      [v20 addObjectsFromArray:v21];
    }
    [(AVAssetWriterInput *)self->_sampleInput setMetadata:v20];
    [(MIOWriterBufferStreamInput *)self customizeSampleInput:self->_sampleInput];
    v22 = [(MIOWriterBufferStreamInput *)self taggedPixelBufferAttributes];
    if (v22)
    {
      v23 = (AVAssetWriterInputTaggedPixelBufferGroupAdaptor *)[objc_alloc(MEMORY[0x263EFA538]) initWithAssetWriterInput:self->_sampleInput sourcePixelBufferAttributes:v22];
      taggedPixelBufferGroupAdaptor = self->_taggedPixelBufferGroupAdaptor;
      self->_taggedPixelBufferGroupAdaptor = v23;
    }
    v25 = [v6 avWriter];
    int v26 = [v25 canAddInput:self->_sampleInput];

    if (v26)
    {
      v27 = [v6 avWriter];
      [v27 addInput:self->_sampleInput];

      if (self->_doNotRecordAttachments)
      {
LABEL_13:
        if (![(MIOWriterStreamInput *)self strictlyEnforceBufferCapacity])
        {
          BOOL v17 = 1;
          goto LABEL_19;
        }
        v28 = [[MIOFifoBuffer alloc] initWithCapacity:[(MIOWriterStreamInput *)self bufferingCapacity]];
        pendingAttachments = self->_pendingAttachments;
        self->_pendingAttachments = v28;
        BOOL v17 = 1;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      uint64_t v33 = [MEMORY[0x263EFA748] createMIOMetadataAttachmentsFormatDescription];
      if (v33)
      {
        v34 = (const void *)v33;
        id v35 = objc_alloc(MEMORY[0x263EFA520]);
        v36 = (AVAssetWriterInput *)[v35 initWithMediaType:*MEMORY[0x263EF9D08] outputSettings:0 sourceFormatHint:v34];
        metadataInput = self->_metadataInput;
        self->_metadataInput = v36;

        CFRelease(v34);
        v38 = [(MIOWriterStreamInput *)self streamId];
        pendingAttachments = +[MOVStreamIOUtility qtTrackNameForAssociatedAttachmentsTrack:v38];

        v56 = [MEMORY[0x263EFA748] qtTrackMetadataItemsForStreamId:pendingAttachments];
        -[AVAssetWriterInput setMetadata:](self->_metadataInput, "setMetadata:");
        -[AVAssetWriterInput setExpectsMediaDataInRealTime:](self->_metadataInput, "setExpectsMediaDataInRealTime:", [v6 realTime]);
        if ([(MIOWriterStreamInput *)self mediaTimeScale] < 1)
        {
          v40 = [(MIOWriterStreamInput *)self writer];
          -[AVAssetWriterInput setMediaTimeScale:](self->_metadataInput, "setMediaTimeScale:", [v40 baseMediaTimeScale]);
        }
        else
        {
          [(AVAssetWriterInput *)self->_metadataInput setMediaTimeScale:[(MIOWriterStreamInput *)self mediaTimeScale]];
        }
        [(MIOWriterBufferStreamInput *)self customizeMetadataInput:self->_metadataInput];
        uint64_t v41 = *MEMORY[0x263EFA1B0];
        if ([(AVAssetWriterInput *)self->_metadataInput canAddTrackAssociationWithTrackOfInput:self->_sampleInput type:*MEMORY[0x263EFA1B0]])
        {
          [(AVAssetWriterInput *)self->_metadataInput addTrackAssociationWithTrackOfInput:self->_sampleInput type:v41];
          v42 = [MEMORY[0x263EFA528] assetWriterInputMetadataAdaptorWithAssetWriterInput:self->_metadataInput];
          metadataAdaptor = self->_metadataAdaptor;
          self->_metadataAdaptor = v42;

          v44 = [v6 avWriter];
          char v45 = [v44 canAddInput:self->_metadataInput];

          if (v45)
          {
            v46 = [v6 avWriter];
            [v46 addInput:self->_metadataInput];

            goto LABEL_13;
          }
          v54 = NSString;
          v55 = [(MIOWriterStreamInput *)self streamId];
          v49 = [v54 stringWithFormat:@"Cannot add metadata input for stream '%@'.", v55];

          v50 = (void *)MEMORY[0x263F087E8];
          v51 = v57;
          v52 = v49;
          uint64_t v53 = 11;
        }
        else
        {
          v47 = NSString;
          v48 = [(MIOWriterStreamInput *)self streamId];
          v49 = [v47 stringWithFormat:@"Cannot associate attachment metadata input with %@.", v48];

          v50 = (void *)MEMORY[0x263F087E8];
          v51 = v57;
          v52 = v49;
          uint64_t v53 = 13;
        }
        [v50 populateStreamError:v51 message:v52 code:v53];

LABEL_17:
        BOOL v17 = 0;
        goto LABEL_18;
      }
      v39 = NSString;
      v31 = [(MIOWriterStreamInput *)self streamId];
      [v39 stringWithFormat:@"Cannot create metadata format description for stream '%@'.", v31];
    }
    else
    {
      v30 = NSString;
      v31 = [(MIOWriterStreamInput *)self streamId];
      [v30 stringWithFormat:@"Cannot add sample input for stream '%@'.", v31];
    pendingAttachments = };

    [MEMORY[0x263F087E8] populateStreamError:a4 message:pendingAttachments code:11];
    goto LABEL_17;
  }
  v14 = NSString;
  uint64_t v15 = [(MIOWriterStreamInput *)self streamId];
  v16 = [v14 stringWithFormat:@"Unable to use output settings (%@) for stream '%@'.", v7, v15];

  [MEMORY[0x263F087E8] populateStreamError:a4 message:v16 code:11];
  BOOL v17 = 0;
LABEL_20:

  return v17;
}

- (BOOL)writeNextItemFromFifo
{
  id v3 = [(MIOWriterStreamInput *)self writer];

  if (v3)
  {
    int v4 = [(MIOWriterStreamInput *)self writer];
    char v5 = [v4 canWrite];

    if (v5)
    {
      id v6 = [(MIOWriterStreamInput *)self fifoBuffer];
      uint64_t v7 = [v6 usage];

      if (v7)
      {
        BOOL v8 = (void *)MEMORY[0x21D4924B0]();
        if (![(MIOWriterBufferStreamInput *)self areAllInputsReady])
        {
          int v22 = 1;
LABEL_48:
          return v22 == 0;
        }
        v9 = [(MIOWriterStreamInput *)self fifoBuffer];
        char v10 = [v9 dequeue];

        if (!v10
          || ([(MIOWriterStreamInput *)self resolveSample],
              [(MIOWriterStreamInput *)self writer],
              char v11 = objc_claimAutoreleasedReturnValue(),
              int v12 = [v11 startSession],
              v11,
              !v12))
        {
          int v22 = 1;
LABEL_47:

          goto LABEL_48;
        }
        v13 = [(MIOWriterStreamInput *)self assignedWritingThread];
        if (v13)
        {
          v14 = [(MIOWriterStreamInput *)self assignedWritingThread];
          uint64_t v15 = [v14 perfLogHandle];
        }
        else
        {
          uint64_t v15 = [(MIOWriterStreamInput *)self perfLogHandle];
        }

        taggedPixelBufferGroupAdaptor = self->_taggedPixelBufferGroupAdaptor;
        v24 = v15;
        if (taggedPixelBufferGroupAdaptor)
        {
          os_signpost_id_t v25 = [(MIOWriterStreamInput *)self avfAppendSignPostID];
          if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21B5ED000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v25, "mio.append.stereo.sample.buffer", (const char *)&unk_21B668A56, buf, 2u);
          }

          int v26 = self->_taggedPixelBufferGroupAdaptor;
          uint64_t v27 = [v10 taggedBufferGroup];
          [v10 taggedBufferPts];
          char v28 = [(AVAssetWriterInputTaggedPixelBufferGroupAdaptor *)v26 appendTaggedPixelBufferGroup:v27 withPresentationTime:v58];
          v29 = v24;
          os_signpost_id_t v30 = [(MIOWriterStreamInput *)self avfAppendSignPostID];
          if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
          {
            *(_WORD *)buf = 0;
            v31 = "mio.append.stereo.sample.buffer";
LABEL_32:
            _os_signpost_emit_with_name_impl(&dword_21B5ED000, v29, OS_SIGNPOST_INTERVAL_END, v30, v31, (const char *)&unk_21B668A56, buf, 2u);
          }
        }
        else
        {
          os_signpost_id_t v32 = [(MIOWriterStreamInput *)self avfAppendSignPostID];
          if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21B5ED000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v32, "mio.append.sample.buffer", (const char *)&unk_21B668A56, buf, 2u);
          }

          uint64_t v33 = [(MIOWriterBufferStreamInput *)self sampleInput];
          char v28 = objc_msgSend(v33, "appendSampleBuffer:", objc_msgSend(v10, "sampleBuffer"));

          v29 = v24;
          os_signpost_id_t v30 = [(MIOWriterStreamInput *)self avfAppendSignPostID];
          if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
          {
            *(_WORD *)buf = 0;
            v31 = "mio.append.sample.buffer";
            goto LABEL_32;
          }
        }

        if (v28)
        {
          v34 = [(MIOWriterBufferStreamInput *)self metadataInput];

          if (!v34) {
            goto LABEL_42;
          }
          id v35 = v24;
          os_signpost_id_t v36 = [(MIOWriterStreamInput *)self avfAppendSignPostID];
          if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21B5ED000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v36, "mio.append.sample.buffer.attachments", (const char *)&unk_21B668A56, buf, 2u);
          }

          v37 = [(MIOWriterBufferStreamInput *)self metadataAdaptor];
          v38 = [v10 metadata];
          char v39 = [v37 appendTimedMetadataGroup:v38];

          v40 = v35;
          os_signpost_id_t v41 = [(MIOWriterStreamInput *)self avfAppendSignPostID];
          if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21B5ED000, v40, OS_SIGNPOST_INTERVAL_END, v41, "mio.append.sample.buffer.attachments", (const char *)&unk_21B668A56, buf, 2u);
          }

          if (v39)
          {
LABEL_42:
            int v22 = 0;
LABEL_46:

            goto LABEL_47;
          }
          v50 = NSString;
          v51 = [(MIOWriterStreamInput *)self writer];
          v52 = [v51 avWriter];
          uint64_t v53 = [v52 error];
          v54 = [(MIOWriterStreamInput *)self streamId];
          v55 = [v50 stringWithFormat:@"Error occurred during appendTimedMetadataGroup %@ for stream '%@'.", v53, v54];

          v56 = [MEMORY[0x263F087E8] streamErrorWithMessage:v55 code:21];
          v57 = [(MIOWriterStreamInput *)self writer];
          [v57 reportError:v56];
        }
        else
        {
          v42 = NSString;
          v43 = [(MIOWriterStreamInput *)self writer];
          v44 = [v43 avWriter];
          char v45 = [v44 error];
          v46 = [(MIOWriterStreamInput *)self streamId];
          v47 = [v42 stringWithFormat:@"Error occurred during AVWriter append %@ for stream '%@'.", v45, v46];

          v48 = [MEMORY[0x263F087E8] streamErrorWithMessage:v47 code:21];
          v49 = [(MIOWriterStreamInput *)self writer];
          [v49 reportError:v48];
        }
        int v22 = 1;
        goto LABEL_46;
      }
    }
    else
    {
      v18 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B5ED000, v18, OS_LOG_TYPE_INFO, "writeNextItemFromFifo dropped sample because writer does not allow writing anymore.", buf, 2u);
      }

      v19 = [(MIOWriterStreamInput *)self fifoBuffer];
      id v20 = (id)[v19 dequeue];

      [(MIOWriterStreamInput *)self resolveSample];
      v21 = [(MIOWriterStreamInput *)self writer];
      [v21 reportWarning:@"Frame was dropped because writer or AV input state does not allow writing."];
    }
    return 0;
  }
  v16 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v16, OS_LOG_TYPE_INFO, "writeNextItemFromFifo: writer done", buf, 2u);
  }

  return 1;
}

- (AVAssetWriterInputTaggedPixelBufferGroupAdaptor)taggedPixelBufferGroupAdaptor
{
  return self->_taggedPixelBufferGroupAdaptor;
}

- (void)setTaggedPixelBufferGroupAdaptor:(id)a3
{
}

- (AVAssetWriterInput)sampleInput
{
  return (AVAssetWriterInput *)objc_getProperty(self, a2, 192, 1);
}

- (AVAssetWriterInput)metadataInput
{
  return (AVAssetWriterInput *)objc_getProperty(self, a2, 208, 1);
}

- (AVAssetWriterInputMetadataAdaptor)metadataAdaptor
{
  return (AVAssetWriterInputMetadataAdaptor *)objc_getProperty(self, a2, 216, 1);
}

- (AVAssetWriterInput)timeCodeInput
{
  return (AVAssetWriterInput *)objc_getProperty(self, a2, 200, 1);
}

- (AVAssetWriterInputMetadataAdaptor)timeCodeAdaptor
{
  return (AVAssetWriterInputMetadataAdaptor *)objc_getProperty(self, a2, 248, 1);
}

- (MIOFifoBuffer)pendingAttachments
{
  return (MIOFifoBuffer *)objc_getProperty(self, a2, 224, 1);
}

- (BOOL)doNotRecordAttachments
{
  return self->_doNotRecordAttachments;
}

- (void)setDoNotRecordAttachments:(BOOL)a3
{
  self->_doNotRecordAttachments = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeCodeAdaptor, 0);
  objc_storeStrong((id *)&self->_taggedPixelBufferGroupAdaptor, 0);
  objc_storeStrong((id *)&self->_pendingAttachments, 0);
  objc_storeStrong((id *)&self->_metadataAdaptor, 0);
  objc_storeStrong((id *)&self->_metadataInput, 0);
  objc_storeStrong((id *)&self->_timeCodeInput, 0);

  objc_storeStrong((id *)&self->_sampleInput, 0);
}

@end