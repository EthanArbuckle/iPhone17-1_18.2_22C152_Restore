@interface MIOWriterTimeCodeSingleStreamInput
- (BOOL)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (BOOL)appendTimeCode:(CVSMPTETime *)a3 pts:(id *)a4 error:(id *)a5;
- (MIOWriterTimeCodeSingleStreamInput)init;
- (MIOWriterTimeCodeSingleStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4;
- (id)avMediaType;
- (id)sampleInputOutputSettings;
- (opaqueCMFormatDescription)formatDescription;
- (opaqueCMFormatDescription)timeCodeFormatDescription;
- (void)customizeSampleInput:(id)a3;
@end

@implementation MIOWriterTimeCodeSingleStreamInput

- (MIOWriterTimeCodeSingleStreamInput)init
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  NSLog(&cfstr_ErrorDoNotCall_0.isa, v4);

  return 0;
}

- (MIOWriterTimeCodeSingleStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MIOWriterTimeCodeSingleStreamInput;
  v7 = [(MIOWriterBufferStreamInput *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(MIOWriterStreamInput *)v7 setStreamId:v6];
    v8->_inputFormatDesc = a4;
    CFRetain(a4);
    [(MIOWriterBufferStreamInput *)v8 setDoNotRecordAttachments:1];
    [(MIOWriterStreamInput *)v8 setMediaType:4];
  }

  return v8;
}

- (BOOL)appendTimeCode:(CVSMPTETime *)a3 pts:(id *)a4 error:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = *a4;
  if ([(MIOWriterStreamInput *)self prepareForAppendWithTimeStamp:&v22 error:a5])
  {
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __63__MIOWriterTimeCodeSingleStreamInput_appendTimeCode_pts_error___block_invoke;
    v15[3] = &unk_2643AF5A8;
    objc_copyWeak(&v16, &location);
    long long v17 = *(_OWORD *)&a3->subframes;
    uint64_t v18 = *(void *)&a3->hours;
    long long v19 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    v8 = (uint64_t (**)(void))MEMORY[0x21D492700](v15);
    int64_t v9 = [(MIOWriterStreamInput *)self threadingOption];
    if (v9)
    {
      if (v9 == 1)
      {
        char v10 = v8[2](v8);
LABEL_8:

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
        return v10;
      }
    }
    else
    {
      v11 = [(MIOWriterStreamInput *)self processingQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__MIOWriterTimeCodeSingleStreamInput_appendTimeCode_pts_error___block_invoke_14;
      block[3] = &unk_2643AF5D0;
      v14 = v8;
      dispatch_async(v11, block);
    }
    char v10 = 1;
    goto LABEL_8;
  }
  return 0;
}

uint64_t __63__MIOWriterTimeCodeSingleStreamInput_appendTimeCode_pts_error___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained perfLogHandle];
    os_signpost_id_t v5 = [v3 processingSignPostID];
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21B5ED000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "mio.processing", (const char *)&unk_21B668A56, buf, 2u);
    }

    id v6 = (void *)MEMORY[0x21D4924B0]();
    if (*(unsigned char *)(a1 + 52))
    {
      long long v36 = *(_OWORD *)(a1 + 40);
      uint64_t v37 = *(void *)(a1 + 56);
      uint64_t v15 = v3[32];
      long long v34 = *(_OWORD *)(a1 + 64);
      uint64_t v35 = *(void *)(a1 + 80);
      id v33 = 0;
      id v16 = +[MOVStreamIOUtility createTimecodeSampleBufferWithSMPTETime:&v36 formatDescription:v15 pts:&v34 error:&v33];
      id v9 = v33;
      if (v16)
      {
        char v10 = objc_opt_new();
        [v10 setSampleBuffer:v16];
        [v10 setMetadata:0];
        long long v17 = [v3 fifoBuffer];
        char v18 = [v17 enqueue:v10];

        if (v18)
        {
          long long v19 = [v3 perfLogHandle];
          os_signpost_id_t v20 = [v3 processingSignPostID];
          if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21B5ED000, v19, OS_SIGNPOST_INTERVAL_END, v20, "mio.processing", (const char *)&unk_21B668A56, buf, 2u);
          }

          uint64_t v14 = [v3 finalizeProcessing];
          goto LABEL_25;
        }
        v26 = NSString;
        v27 = [v3 streamId];
        v12 = [v26 stringWithFormat:@"Attempted to enqueue sample in full Fifo for stream %@.  Indicates leak in overall pending sample tracking.", v27];

        v28 = [MEMORY[0x263F087E8] streamErrorWithMessage:v12 code:21];
        v29 = [v3 writer];
        [v29 reportError:v28];

        CFRelease(v16);
        v30 = [v3 perfLogHandle];
        os_signpost_id_t v31 = [v3 processingSignPostID];
        if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21B5ED000, v30, OS_SIGNPOST_INTERVAL_END, v31, "mio.processing", (const char *)&unk_21B668A56, buf, 2u);
        }
      }
      else
      {
        v21 = NSString;
        $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = [v3 streamId];
        char v10 = [v21 stringWithFormat:@"Cannot create time code sample buffer for stream %@.", v22];

        v12 = [MEMORY[0x263F087E8] streamErrorWithMessage:v10 code:21];
        v23 = [v3 writer];
        [v23 reportError:v12];

        v24 = [v3 perfLogHandle];
        os_signpost_id_t v25 = [v3 processingSignPostID];
        if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21B5ED000, v24, OS_SIGNPOST_INTERVAL_END, v25, "mio.processing", (const char *)&unk_21B668A56, buf, 2u);
        }
      }
    }
    else
    {
      v7 = NSString;
      v8 = [v3 streamId];
      id v9 = [v7 stringWithFormat:@"Cannot write invalid time code sample to stream %@.", v8];

      char v10 = [MEMORY[0x263F087E8] streamErrorWithMessage:v9 code:21];
      v11 = [v3 writer];
      [v11 reportError:v10];

      v12 = [v3 perfLogHandle];
      os_signpost_id_t v13 = [v3 processingSignPostID];
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v12, OS_SIGNPOST_INTERVAL_END, v13, "mio.processing", (const char *)&unk_21B668A56, buf, 2u);
      }
    }

    uint64_t v14 = 0;
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v14 = 0;
LABEL_26:

  return v14;
}

uint64_t __63__MIOWriterTimeCodeSingleStreamInput_appendTimeCode_pts_error___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  memset(&v22, 0, sizeof(v22));
  CMSampleBufferGetPresentationTimeStamp(&v22, a3);
  CMTime v21 = v22;
  if ([(MIOWriterStreamInput *)self prepareForAppendWithTimeStamp:&v21 error:a4])
  {
    if (a3)
    {
      objc_initWeak(&location, self);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __63__MIOWriterTimeCodeSingleStreamInput_appendSampleBuffer_error___block_invoke;
      v18[3] = &unk_2643AF5F8;
      objc_copyWeak(v19, &location);
      v19[1] = a3;
      v7 = (uint64_t (**)(void))MEMORY[0x21D492700](v18);
      int64_t v8 = [(MIOWriterStreamInput *)self threadingOption];
      if (v8)
      {
        if (v8 == 1)
        {
          char v9 = v7[2](v7);
LABEL_10:

          objc_destroyWeak(v19);
          objc_destroyWeak(&location);
          return v9;
        }
      }
      else
      {
        uint64_t v14 = [(MIOWriterStreamInput *)self processingQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __63__MIOWriterTimeCodeSingleStreamInput_appendSampleBuffer_error___block_invoke_19;
        block[3] = &unk_2643AF5D0;
        long long v17 = v7;
        dispatch_async(v14, block);
      }
      char v9 = 1;
      goto LABEL_10;
    }
    char v10 = [(MIOWriterStreamInput *)self writer];
    v11 = NSString;
    v12 = [(MIOWriterStreamInput *)self streamId];
    os_signpost_id_t v13 = [v11 stringWithFormat:@"Cannot append nil sample buffer to time code input: %@", v12];
    [v10 reportWarning:v13];
  }
  return 0;
}

uint64_t __63__MIOWriterTimeCodeSingleStreamInput_appendSampleBuffer_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained perfLogHandle];
    os_signpost_id_t v5 = [v3 processingSignPostID];
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21B5ED000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "mio.processing", (const char *)&unk_21B668A56, buf, 2u);
    }

    id v6 = (void *)MEMORY[0x21D4924B0]();
    v7 = objc_opt_new();
    [v7 setSampleBuffer:*(void *)(a1 + 40)];
    [v7 setMetadata:0];
    int64_t v8 = [v3 fifoBuffer];
    char v9 = [v8 enqueue:v7];

    if (v9)
    {
      char v10 = [v3 perfLogHandle];
      os_signpost_id_t v11 = [v3 processingSignPostID];
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_WORD *)CMTime v21 = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v10, OS_SIGNPOST_INTERVAL_END, v11, "mio.processing", (const char *)&unk_21B668A56, v21, 2u);
      }

      uint64_t v12 = [v3 finalizeProcessing];
    }
    else
    {
      os_signpost_id_t v13 = NSString;
      uint64_t v14 = [v3 streamId];
      uint64_t v15 = [v13 stringWithFormat:@"Attempted to enqueue sample in full Fifo for stream %@.  Indicates leak in overall pending sample tracking.", v14];

      id v16 = [MEMORY[0x263F087E8] streamErrorWithMessage:v15 code:21];
      long long v17 = [v3 writer];
      [v17 reportError:v16];

      CFRelease(*(CFTypeRef *)(a1 + 40));
      char v18 = [v3 perfLogHandle];
      os_signpost_id_t v19 = [v3 processingSignPostID];
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)CMTime v22 = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v18, OS_SIGNPOST_INTERVAL_END, v19, "mio.processing", (const char *)&unk_21B668A56, v22, 2u);
      }

      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t __63__MIOWriterTimeCodeSingleStreamInput_appendSampleBuffer_error___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)sampleInputOutputSettings
{
  return 0;
}

- (id)avMediaType
{
  return (id)*MEMORY[0x263EF9D40];
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_inputFormatDesc;
}

- (opaqueCMFormatDescription)timeCodeFormatDescription
{
  return self->_inputFormatDesc;
}

- (void)customizeSampleInput:(id)a3
{
  id v8 = a3;
  int v5 = [(MIOWriterStreamInput *)self mediaTimeScale];
  if (v5 < 1)
  {
    v3 = [(MIOWriterStreamInput *)self writer];
    uint64_t v6 = [v3 baseMediaTimeScale];
  }
  else
  {
    uint64_t v6 = [(MIOWriterStreamInput *)self mediaTimeScale];
  }
  [v8 setMediaTimeScale:v6];
  if (v5 <= 0) {

  }
  v7 = [(MIOWriterStreamInput *)self writer];
  objc_msgSend(v8, "setExpectsMediaDataInRealTime:", objc_msgSend(v7, "realTime"));

  [v8 setMediaDataLocation:*MEMORY[0x263EF95D8]];
  objc_msgSend(v8, "setNaturalSize:", 640.0, 16.0);
}

@end