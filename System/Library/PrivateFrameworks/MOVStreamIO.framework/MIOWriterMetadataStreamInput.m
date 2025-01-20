@interface MIOWriterMetadataStreamInput
- (AVAssetWriterInput)metadataInput;
- (AVAssetWriterInputMetadataAdaptor)metadataAdaptor;
- (BOOL)appendMetadata:(id)a3;
- (BOOL)areAllInputsReady;
- (BOOL)setupInputsWithWriter:(id)a3 error:(id *)a4;
- (BOOL)writeNextItemFromFifo;
- (MIOWriterMetadataStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4;
- (id)allWriterInputs;
- (id)inputSpecificTrackMetadataItems;
- (id)mainAVInput;
- (void)customizeMetadataInput:(id)a3;
- (void)dealloc;
@end

@implementation MIOWriterMetadataStreamInput

- (MIOWriterMetadataStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MIOWriterMetadataStreamInput;
  v7 = [(MIOWriterStreamInput *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(MIOWriterStreamInput *)v7 setStreamId:v6];
    [(MIOWriterStreamInput *)v8 setMediaType:2];
    v8->_inputFormatDesc = a4;
    CFRetain(a4);
  }

  return v8;
}

- (void)dealloc
{
  inputFormatDesc = self->_inputFormatDesc;
  if (inputFormatDesc) {
    CFRelease(inputFormatDesc);
  }
  v4.receiver = self;
  v4.super_class = (Class)MIOWriterMetadataStreamInput;
  [(MIOWriterMetadataStreamInput *)&v4 dealloc];
}

- (AVAssetWriterInput)metadataInput
{
  return self->_metadataInput;
}

- (void)customizeMetadataInput:(id)a3
{
  id v20 = a3;
  if ([(MIOWriterStreamInput *)self mediaTimeScale] < 1)
  {
    objc_super v4 = [(MIOWriterStreamInput *)self writer];
    objc_msgSend(v20, "setMediaTimeScale:", objc_msgSend(v4, "baseMediaTimeScale"));
  }
  else
  {
    objc_msgSend(v20, "setMediaTimeScale:", -[MIOWriterStreamInput mediaTimeScale](self, "mediaTimeScale"));
  }
  v5 = [(MIOWriterStreamInput *)self writer];
  objc_msgSend(v20, "setExpectsMediaDataInRealTime:", objc_msgSend(v5, "realTime"));

  id v6 = objc_opt_new();
  v7 = (void *)MEMORY[0x263EFA748];
  v8 = [(MIOWriterStreamInput *)self streamId];
  v9 = [v7 trackMetadataItemWithStreamId:v8];

  if (v9) {
    [v6 addObject:v9];
  }
  objc_super v10 = (void *)MEMORY[0x263EFA748];
  v11 = [(MIOWriterStreamInput *)self streamId];
  v12 = [v10 qtTrackMetadataItemsForStreamId:v11];
  [v6 addObjectsFromArray:v12];

  v13 = (void *)MEMORY[0x263EFA748];
  v14 = [(MIOWriterStreamInput *)self customMetadata];
  v15 = [v13 customTrackMetadataItems:v14];

  if ([v15 count]) {
    [v6 addObjectsFromArray:v15];
  }
  v16 = [(MIOWriterStreamInput *)self customMetadataItems];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    v18 = [(MIOWriterStreamInput *)self customMetadataItems];
    [v6 addObjectsFromArray:v18];
  }
  v19 = [(MIOWriterMetadataStreamInput *)self inputSpecificTrackMetadataItems];
  if ([v19 count]) {
    [v6 addObjectsFromArray:v19];
  }
  if ([v6 count]) {
    [v20 setMetadata:v6];
  }
}

- (BOOL)appendMetadata:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 setMetadata:v4];

  id v6 = [(MIOWriterStreamInput *)self fifoBuffer];
  char v7 = [v6 enqueue:v5];

  if (v7)
  {
    BOOL v8 = [(MIOWriterStreamInput *)self finalizeProcessing];
  }
  else
  {
    v9 = NSString;
    objc_super v10 = [(MIOWriterStreamInput *)self streamId];
    v11 = [v9 stringWithFormat:@"Attempted to enqueue sample in full Fifo for stream %@.  Indicates leak in overall pending sample tracking.", v10];

    v12 = [MEMORY[0x263F087E8] streamErrorWithMessage:v11 code:21];
    v13 = [(MIOWriterStreamInput *)self writer];
    [v13 reportError:v12];

    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)setupInputsWithWriter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  inputFormatDesc = self->_inputFormatDesc;
  if (!inputFormatDesc)
  {
    uint64_t v17 = NSString;
    v18 = [(MIOWriterStreamInput *)self streamId];
    [v17 stringWithFormat:@"Cannot create metadata format description for stream '%@'.", v18];
    v15 = LABEL_6:;

    [MEMORY[0x263F087E8] populateStreamError:a4 message:v15 code:11];
    BOOL v16 = 0;
    goto LABEL_7;
  }
  id v8 = objc_alloc(MEMORY[0x263EFA520]);
  v9 = (AVAssetWriterInput *)[v8 initWithMediaType:*MEMORY[0x263EF9D08] outputSettings:0 sourceFormatHint:inputFormatDesc];
  metadataInput = self->_metadataInput;
  self->_metadataInput = v9;

  [(MIOWriterMetadataStreamInput *)self customizeMetadataInput:self->_metadataInput];
  v11 = [MEMORY[0x263EFA528] assetWriterInputMetadataAdaptorWithAssetWriterInput:self->_metadataInput];
  metadataAdaptor = self->_metadataAdaptor;
  self->_metadataAdaptor = v11;

  v13 = [v6 avWriter];
  int v14 = [v13 canAddInput:self->_metadataInput];

  if (!v14)
  {
    v19 = NSString;
    v18 = [(MIOWriterStreamInput *)self streamId];
    [v19 stringWithFormat:@"Cannot add AVAssetWriterInputs for stream '%@'.", v18];
    goto LABEL_6;
  }
  v15 = [v6 avWriter];
  [v15 addInput:self->_metadataInput];
  BOOL v16 = 1;
LABEL_7:

  return v16;
}

- (id)inputSpecificTrackMetadataItems
{
  return 0;
}

- (BOOL)writeNextItemFromFifo
{
  v3 = [(MIOWriterStreamInput *)self writer];

  if (v3)
  {
    id v4 = [(MIOWriterStreamInput *)self writer];
    char v5 = [v4 canWrite];

    if (v5)
    {
      id v6 = [(MIOWriterStreamInput *)self fifoBuffer];
      uint64_t v7 = [v6 usage];

      if (v7)
      {
        id v8 = (void *)MEMORY[0x21D4924B0]();
        if ([(MIOWriterMetadataStreamInput *)self areAllInputsReady])
        {
          v9 = [(MIOWriterStreamInput *)self fifoBuffer];
          objc_super v10 = [v9 dequeue];

          if (v10
            && ([(MIOWriterStreamInput *)self resolveSample],
                [(MIOWriterStreamInput *)self writer],
                v11 = objc_claimAutoreleasedReturnValue(),
                int v12 = [v11 startSession],
                v11,
                v12))
          {
            v13 = [(MIOWriterStreamInput *)self assignedWritingThread];
            if (v13)
            {
              int v14 = [(MIOWriterStreamInput *)self assignedWritingThread];
              v15 = [v14 perfLogHandle];
            }
            else
            {
              v15 = [(MIOWriterStreamInput *)self perfLogHandle];
            }

            id v20 = v15;
            os_signpost_id_t v21 = [(MIOWriterStreamInput *)self avfAppendSignPostID];
            if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
            {
              *(_WORD *)v36 = 0;
              _os_signpost_emit_with_name_impl(&dword_21B5ED000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v21, "mio.append.timed.metadata.group", (const char *)&unk_21B668A56, v36, 2u);
            }

            v22 = [(MIOWriterMetadataStreamInput *)self metadataAdaptor];
            v23 = [v10 metadata];
            char v24 = [v22 appendTimedMetadataGroup:v23];

            v25 = v20;
            os_signpost_id_t v26 = [(MIOWriterStreamInput *)self avfAppendSignPostID];
            if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
            {
              *(_WORD *)v35 = 0;
              _os_signpost_emit_with_name_impl(&dword_21B5ED000, v25, OS_SIGNPOST_INTERVAL_END, v26, "mio.append.timed.metadata.group", (const char *)&unk_21B668A56, v35, 2u);
            }

            if (v24)
            {
              int v19 = 0;
            }
            else
            {
              v27 = NSString;
              v28 = [(MIOWriterStreamInput *)self writer];
              v29 = [v28 avWriter];
              v30 = [v29 error];
              v31 = [(MIOWriterStreamInput *)self streamId];
              v32 = [v27 stringWithFormat:@"Error occurred during appendTimedMetadataGroup %@ for stream '%@'.", v30, v31];

              v33 = [MEMORY[0x263F087E8] streamErrorWithMessage:v32 code:21];
              v34 = [(MIOWriterStreamInput *)self writer];
              [v34 reportError:v33];

              int v19 = 1;
            }
          }
          else
          {
            int v19 = 1;
          }
        }
        else
        {
          int v19 = 1;
        }
        return v19 == 0;
      }
    }
    else
    {
      v18 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_21B5ED000, v18, OS_LOG_TYPE_INFO, "writeNextItemFromFifo canceled because writer does not allow writing anymore.", v37, 2u);
      }
    }
    return 0;
  }
  BOOL v16 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v16, OS_LOG_TYPE_INFO, "writeNextItemFromFifo: writer done", buf, 2u);
  }

  return 1;
}

- (id)allWriterInputs
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self->_metadataInput;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (BOOL)areAllInputsReady
{
  return [(AVAssetWriterInput *)self->_metadataInput isReadyForMoreMediaData];
}

- (id)mainAVInput
{
  return self->_metadataInput;
}

- (AVAssetWriterInputMetadataAdaptor)metadataAdaptor
{
  return (AVAssetWriterInputMetadataAdaptor *)objc_getProperty(self, a2, 208, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataAdaptor, 0);

  objc_storeStrong((id *)&self->_metadataInput, 0);
}

@end