@interface MIOWriterTimeRangeMetadataStreamInput
- (BOOL)appendTimeCode:(CVSMPTETime *)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5 withTimeStamp:(id *)a6 error:(id *)a7;
- (MIOWriterTimeRangeMetadataStreamInput)init;
- (MIOWriterTimeRangeMetadataStreamInput)initWithStreamId:(id)a3;
- (id)inputSpecificTrackMetadataItems;
@end

@implementation MIOWriterTimeRangeMetadataStreamInput

- (MIOWriterTimeRangeMetadataStreamInput)init
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  NSLog(&cfstr_ErrorDoNotCall_0.isa, v4);

  return 0;
}

- (MIOWriterTimeRangeMetadataStreamInput)initWithStreamId:(id)a3
{
  id v4 = a3;
  v5 = (const void *)[MEMORY[0x263EFA748] createMIOTimeRangeMetadataStreamFormatDescription];
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MIOWriterTimeRangeMetadataStreamInput;
    v6 = [(MIOWriterMetadataStreamInput *)&v10 initWithStreamId:v4 format:v5];
    CFRelease(v5);
    self = v6;
    v7 = self;
  }
  else
  {
    v8 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, v8, OS_LOG_TYPE_ERROR, "Cannot create format description for time range metadata track.", buf, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)appendTimeCode:(CVSMPTETime *)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5 withTimeStamp:(id *)a6 error:(id *)a7
{
  uint64_t v11 = (uint64_t)self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v24 = *a6;
  if ([(MIOWriterStreamInput *)self prepareForAppendWithTimeStamp:&v24 error:a7])
  {
    objc_initWeak(&location, (id)v11);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __94__MIOWriterTimeRangeMetadataStreamInput_appendTimeCode_startTime_endTime_withTimeStamp_error___block_invoke;
    v17[3] = &unk_2643AF9A8;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a4;
    v18[2] = (id)a5;
    long long v19 = *(_OWORD *)&a3->subframes;
    uint64_t v20 = *(void *)&a3->hours;
    long long v21 = *(_OWORD *)&a6->var0;
    int64_t var3 = a6->var3;
    v17[4] = v11;
    v12 = (uint64_t (**)(void))MEMORY[0x21D492700](v17);
    uint64_t v13 = [(id)v11 threadingOption];
    if (v13)
    {
      if (v13 == 1) {
        LOBYTE(v11) = v12[2](v12);
      }
    }
    else
    {
      uint64_t v11 = [(id)v11 processingQueue];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __94__MIOWriterTimeRangeMetadataStreamInput_appendTimeCode_startTime_endTime_withTimeStamp_error___block_invoke_204;
      v15[3] = &unk_2643AF5D0;
      v16 = v12;
      dispatch_async((dispatch_queue_t)v11, v15);

      LOBYTE(v11) = 1;
    }

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11 & 1;
}

id __94__MIOWriterTimeRangeMetadataStreamInput_appendTimeCode_startTime_endTime_withTimeStamp_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained perfLogHandle];
    os_signpost_id_t v5 = [v3 processingSignPostID];
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21B5ED000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "mio.processing", (const char *)&unk_21B668A56, buf, 2u);
    }

    v6 = (void *)MEMORY[0x21D4924B0]();
    v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
    v8 = [MEMORY[0x263EFA748] metadataItemForTimeRangeMetadataStartTime:*(void *)(a1 + 48)];
    [v7 addObject:v8];

    v9 = [MEMORY[0x263EFA748] metadataItemForTimeRangeMetadataEndTime:*(void *)(a1 + 56)];
    [v7 addObject:v9];

    long long v24 = *(_OWORD *)(a1 + 64);
    uint64_t v25 = *(void *)(a1 + 80);
    objc_super v10 = [MEMORY[0x263EFA748] metadataItemForTimeCode:&v24];
    [v7 addObject:v10];

    if (*(unsigned char *)(a1 + 100))
    {
      id v17 = objc_alloc(MEMORY[0x263EFA8C0]);
      CMTime start = *(CMTime *)(a1 + 88);
      CMTime duration = *(CMTime *)*(void *)&MEMORY[0x263F01098];
      CMTimeRangeMake(&v23, &start, &duration);
      v18 = (void *)[v17 initWithItems:v7 timeRange:&v23];
      if (v18)
      {
        v20.receiver = *(id *)(a1 + 32);
        v20.super_class = (Class)MIOWriterTimeRangeMetadataStreamInput;
        id v16 = objc_msgSendSuper2(&v20, sel_appendMetadata_, v18);
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v13 = [MEMORY[0x263F087E8] writerWarningWithMessage:@"No metadata appended because the AVTimedMetadataGroup* is nil" code:0];
      v14 = [v3 writer];
      [v14 reportError:v13];
    }
    else
    {
      uint64_t v11 = NSString;
      v12 = [v3 streamId];
      uint64_t v13 = [v11 stringWithFormat:@"Invalid time stamp is not supported for metadata for stream '%@'.", v12];

      v14 = [MEMORY[0x263F087E8] streamErrorWithMessage:v13 code:16];
      v15 = [v3 writer];
      [v15 reportError:v14];
    }
    v18 = 0;
    id v16 = 0;
    goto LABEL_12;
  }
  id v16 = 0;
LABEL_13:

  return v16;
}

uint64_t __94__MIOWriterTimeRangeMetadataStreamInput_appendTimeCode_startTime_endTime_withTimeStamp_error___block_invoke_204(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)inputSpecificTrackMetadataItems
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFA748] trackMetadataItemWithTimeRangeMetadata:1];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

@end