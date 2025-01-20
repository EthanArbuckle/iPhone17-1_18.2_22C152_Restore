@interface MIOWriterStereoPixelBufferStreamInput
- (BOOL)appendLeftPixelBuffer:(__CVBuffer *)a3 rightPixelBuffer:(__CVBuffer *)a4 pts:(id *)a5 error:(id *)a6;
- (BOOL)leftBufferPrimary;
- (BOOL)leftBufferUsesPrimaryLayer;
- (BOOL)sampleReorderingEnabled;
- (MIOWriterStereoPixelBufferStreamInput)init;
- (MIOWriterStereoPixelBufferStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4 recordingConfig:(id)a5;
- (id)taggedPixelBufferAttributes;
- (void)dealloc;
- (void)setLeftBufferPrimary:(BOOL)a3;
@end

@implementation MIOWriterStereoPixelBufferStreamInput

- (MIOWriterStereoPixelBufferStreamInput)init
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  NSLog(&cfstr_ErrorDoNotCall_0.isa, v4);

  return 0;
}

- (MIOWriterStereoPixelBufferStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4 recordingConfig:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v33.receiver = self;
  v33.super_class = (Class)MIOWriterStereoPixelBufferStreamInput;
  v10 = [(MIOWriterPixelBufferStreamInput *)&v33 initWithStreamId:v8 format:a4 recordingConfig:v9];
  v11 = v10;
  if (v10)
  {
    videoLayerIDs = v10->_videoLayerIDs;
    v10->_videoLayerIDs = (NSArray *)&unk_26CB7D530;

    uint64_t v13 = [(NSArray *)v11->_videoLayerIDs copy];
    viewIDs = v11->_viewIDs;
    v11->_viewIDs = (NSArray *)v13;

    uint64_t v15 = [(NSArray *)v11->_videoLayerIDs copy];
    leftAndRightViewIDs = v11->_leftAndRightViewIDs;
    v11->_leftAndRightViewIDs = (NSArray *)v15;

    [v9 objectForKey:@"CustomOutputSettings"];
    v17 = [(id)objc_claimAutoreleasedReturnValue() objectForKey:*MEMORY[0x263EFA3A0]];
    v18 = [v17 objectForKey:*MEMORY[0x263F1E5A0]];
    v19 = v18;
    if (v18)
    {
      uint64_t v20 = [v18 copy];
      v21 = v11->_videoLayerIDs;
      v11->_videoLayerIDs = (NSArray *)v20;
    }
    v22 = [v17 objectForKey:*MEMORY[0x263F1E5A8]];

    if (v22)
    {
      uint64_t v23 = [v22 copy];
      v24 = v11->_viewIDs;
      v11->_viewIDs = (NSArray *)v23;
    }
    v25 = [v17 objectForKey:*MEMORY[0x263F1E598]];

    if (v25)
    {
      uint64_t v26 = [v25 copy];
      v27 = v11->_leftAndRightViewIDs;
      v11->_leftAndRightViewIDs = (NSArray *)v26;
    }
    v28 = [(NSArray *)v11->_videoLayerIDs objectAtIndex:0];
    [v28 unsignedIntegerValue];

    v29 = [(NSArray *)v11->_videoLayerIDs objectAtIndex:1];
    [v29 unsignedIntegerValue];

    [(MIOWriterStereoPixelBufferStreamInput *)v11 setLeftBufferPrimary:[(MIOWriterStereoPixelBufferStreamInput *)v11 leftBufferUsesPrimaryLayer]];
    v11->_tagCollectionArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 2, MEMORY[0x263EFFF70]);
    FigTagMakeWithSInt64Value();
    FigTagCollectionCreate();
    tagCollectionArray = v11->_tagCollectionArray;
    if (tagCollectionArray) {
      CFRelease(tagCollectionArray);
    }
    id v32 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"FigTagCollectionCreate left failed." userInfo:0];
    objc_exception_throw(v32);
  }

  return v11;
}

- (void)dealloc
{
  tagCollectionArray = self->_tagCollectionArray;
  if (tagCollectionArray) {
    CFRelease(tagCollectionArray);
  }
  v4.receiver = self;
  v4.super_class = (Class)MIOWriterStereoPixelBufferStreamInput;
  [(MIOWriterPixelBufferStreamInput *)&v4 dealloc];
}

- (BOOL)sampleReorderingEnabled
{
  return 0;
}

- (id)taggedPixelBufferAttributes
{
  v2 = [(MIOWriterPixelBufferStreamInput *)self config];
  v3 = [v2 objectForKey:@"TaggedPixelBufferGroupAdaptorPixelBufferAttributes"];

  return v3;
}

- (BOOL)leftBufferUsesPrimaryLayer
{
  v3 = [(NSArray *)self->_leftAndRightViewIDs objectAtIndex:0];
  uint64_t v4 = [v3 unsignedIntegerValue];

  v5 = [(NSArray *)self->_viewIDs objectAtIndex:v4];
  uint64_t v6 = [v5 unsignedIntegerValue];

  v7 = [(NSArray *)self->_videoLayerIDs objectAtIndex:v6];
  uint64_t v8 = [v7 unsignedIntegerValue];

  return v8 == 0;
}

- (BOOL)appendLeftPixelBuffer:(__CVBuffer *)a3 rightPixelBuffer:(__CVBuffer *)a4 pts:(id *)a5 error:(id *)a6
{
  uint64_t v9 = (uint64_t)self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = *a5;
  if ([(MIOWriterStreamInput *)self prepareForAppendWithTimeStamp:&v20 error:a6])
  {
    CVPixelBufferRetain(a3);
    CVPixelBufferRetain(a4);
    objc_initWeak(&location, (id)v9);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __90__MIOWriterStereoPixelBufferStreamInput_appendLeftPixelBuffer_rightPixelBuffer_pts_error___block_invoke;
    v15[3] = &unk_2643AFA90;
    objc_copyWeak(v16, &location);
    v16[1] = a3;
    v16[2] = a4;
    long long v17 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    v10 = (uint64_t (**)(void))MEMORY[0x21D492700](v15);
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
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __90__MIOWriterStereoPixelBufferStreamInput_appendLeftPixelBuffer_rightPixelBuffer_pts_error___block_invoke_220;
      v13[3] = &unk_2643AF5D0;
      v14 = v10;
      dispatch_async((dispatch_queue_t)v9, v13);

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

uint64_t __90__MIOWriterStereoPixelBufferStreamInput_appendLeftPixelBuffer_rightPixelBuffer_pts_error___block_invoke(uint64_t a1)
{
  v86[2] = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained perfLogHandle];
    os_signpost_id_t v5 = [v3 processingSignPostID];
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21B5ED000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "mio.processing", (const char *)&unk_21B668A56, buf, 2u);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    long long v84 = *(_OWORD *)(a1 + 56);
    uint64_t v85 = *(void *)(a1 + 72);
    id v83 = 0;
    v70 = [MEMORY[0x263EFA748] attachmentsMIOMetadataItemForPixelBuffer:v6 pts:&v84 error:&v83];
    id v7 = v83;
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = NSString;
      v10 = [v3 streamId];
      uint64_t v11 = [v9 stringWithFormat:@"Cannot append frame, invalid pixel buffer attachments %@ for stream %@.", v8, v10];

      v12 = [MEMORY[0x263F087E8] streamErrorWithMessage:v11 code:21];
      uint64_t v13 = [v3 writer];
      [v13 reportError:v12];

      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
      v14 = [v3 perfLogHandle];
      os_signpost_id_t v15 = [v3 processingSignPostID];
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v14, OS_SIGNPOST_INTERVAL_END, v15, "mio.processing", (const char *)&unk_21B668A56, buf, 2u);
      }

LABEL_16:
      uint64_t v16 = 0;
LABEL_17:

      goto LABEL_18;
    }
    long long v17 = (long long *)(a1 + 56);
    uint64_t v18 = *(void *)(a1 + 48);
    long long v81 = *(_OWORD *)(a1 + 56);
    uint64_t v82 = *(void *)(a1 + 72);
    id v80 = 0;
    uint64_t v11 = [MEMORY[0x263EFA748] attachmentsMIOMetadataItemForPixelBuffer:v18 pts:&v81 error:&v80];
    id v19 = v80;
    if (v19)
    {
      id v8 = v19;
      $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = NSString;
      v21 = [v3 streamId];
      v12 = [v20 stringWithFormat:@"Cannot append frame, invalid pixel buffer attachments %@ for stream %@.", v8, v21];

      v22 = [MEMORY[0x263F087E8] streamErrorWithMessage:v12 code:21];
      uint64_t v23 = [v3 writer];
      [v23 reportError:v22];

      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
      v24 = [v3 perfLogHandle];
      os_signpost_id_t v25 = [v3 processingSignPostID];
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v24, OS_SIGNPOST_INTERVAL_END, v25, "mio.processing", (const char *)&unk_21B668A56, buf, 2u);
      }

      goto LABEL_16;
    }
    id v27 = objc_alloc(MEMORY[0x263EFA8C0]);
    v86[0] = v70;
    v86[1] = v11;
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:2];
    *(_OWORD *)&start.value = *v17;
    start.epoch = *(void *)(a1 + 72);
    CMTime duration = *(CMTime *)*(void *)&MEMORY[0x263F01098];
    CMTimeRangeMake(&v79, &start, &duration);
    v12 = (void *)[v27 initWithItems:v28 timeRange:&v79];

    v29 = [v3 processor];
    uint64_t v30 = *(void *)(a1 + 40);
    v31 = [v3 attachmentsToEncode];
    id v76 = 0;
    id v32 = (__CVBuffer *)[v29 processPixelBuffer:v30 preserveAttachments:v31 error:&v76];
    id v8 = v76;

    CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
    if (!v32)
    {
      v40 = NSString;
      v41 = [v3 streamId];
      v42 = [v40 stringWithFormat:@"Process pixel buffer failed %@ for stream %@.", v8, v41];

      v43 = [MEMORY[0x263F087E8] streamErrorWithMessage:v42 code:21];
      v44 = [v3 writer];
      [v44 reportError:v43];

      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
      v45 = [v3 perfLogHandle];
      os_signpost_id_t v46 = [v3 processingSignPostID];
      if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v45, OS_SIGNPOST_INTERVAL_END, v46, "mio.processing", (const char *)&unk_21B668A56, buf, 2u);
      }

      goto LABEL_16;
    }
    objc_super v33 = [v3 processor];
    uint64_t v34 = *(void *)(a1 + 48);
    v35 = [v3 attachmentsToEncode];
    id v75 = v8;
    v36 = (__CVBuffer *)[v33 processPixelBuffer:v34 preserveAttachments:v35 error:&v75];
    id v69 = v75;

    CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
    if (!v36)
    {
      v47 = NSString;
      v48 = [v3 streamId];
      v49 = [v47 stringWithFormat:@"Process pixel buffer failed %@ for stream %@.", v69, v48];

      v50 = [MEMORY[0x263F087E8] streamErrorWithMessage:v49 code:21];
      v51 = [v3 writer];
      [v51 reportError:v50];

      CVPixelBufferRelease(v32);
      v52 = [v3 perfLogHandle];
      os_signpost_id_t v53 = [v3 processingSignPostID];
      if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v52, OS_SIGNPOST_INTERVAL_END, v53, "mio.processing", (const char *)&unk_21B668A56, buf, 2u);
      }

      uint64_t v16 = 0;
      goto LABEL_44;
    }
    uint64_t v37 = *MEMORY[0x263EFFB08];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 2, MEMORY[0x263EFFF70]);
    if ([v3 leftBufferPrimary])
    {
      CFArrayAppendValue(Mutable, v32);
      v39 = v36;
    }
    else
    {
      CFArrayAppendValue(Mutable, v36);
      v39 = v32;
    }
    CFArrayAppendValue(Mutable, v39);
    CVPixelBufferRelease(v32);
    CVPixelBufferRelease(v36);
    *(void *)buf = 0;
    if (MEMORY[0x21D491FC0](v37, v3[47], Mutable, buf))
    {
      v54 = NSString;
      v55 = [v3 streamId];
      v56 = [v54 stringWithFormat:@"FigTaggedBufferGroupCreate failed for stream %@.", v55];

      uint64_t v57 = [MEMORY[0x263F087E8] writerErrorWithMessage:v56 code:21];

      v58 = [v3 writer];
      [v58 reportError:v57];

      v59 = [v3 perfLogHandle];
      os_signpost_id_t v60 = [v3 processingSignPostID];
      if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
      {
        *(_WORD *)v73 = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v59, OS_SIGNPOST_INTERVAL_END, v60, "mio.processing", (const char *)&unk_21B668A56, v73, 2u);
      }
    }
    else
    {
      v56 = objc_opt_new();
      [v56 setTaggedBufferGroup:*(void *)buf];
      long long v71 = *v17;
      uint64_t v72 = *((void *)v17 + 2);
      [v56 setTaggedBufferPts:&v71];
      [v56 setMetadata:v12];
      v61 = [v3 fifoBuffer];
      char v62 = [v61 enqueue:v56];

      if (v62)
      {
        v63 = [v3 perfLogHandle];
        os_signpost_id_t v64 = [v3 processingSignPostID];
        if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
        {
          *(_WORD *)v73 = 0;
          _os_signpost_emit_with_name_impl(&dword_21B5ED000, v63, OS_SIGNPOST_INTERVAL_END, v64, "mio.processing", (const char *)&unk_21B668A56, v73, 2u);
        }

        uint64_t v16 = [v3 finalizeProcessing];
        goto LABEL_43;
      }
      v65 = NSString;
      v66 = [v3 streamId];
      v59 = [v65 stringWithFormat:@"Attempted to enqueue sample in full Fifo for stream %@.  Indicates leak in overall pending sample tracking.", v66];

      v67 = [MEMORY[0x263F087E8] streamErrorWithMessage:v59 code:21];
      v68 = [v3 writer];
      [v68 reportError:v67];

      uint64_t v57 = (uint64_t)v69;
    }

    uint64_t v16 = 0;
    id v69 = (id)v57;
LABEL_43:

LABEL_44:
    id v8 = v69;
    goto LABEL_17;
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
  uint64_t v16 = 0;
LABEL_18:

  return v16;
}

uint64_t __90__MIOWriterStereoPixelBufferStreamInput_appendLeftPixelBuffer_rightPixelBuffer_pts_error___block_invoke_220(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)leftBufferPrimary
{
  return self->_leftBufferPrimary;
}

- (void)setLeftBufferPrimary:(BOOL)a3
{
  self->_leftBufferPrimary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftAndRightViewIDs, 0);
  objc_storeStrong((id *)&self->_viewIDs, 0);

  objc_storeStrong((id *)&self->_videoLayerIDs, 0);
}

@end