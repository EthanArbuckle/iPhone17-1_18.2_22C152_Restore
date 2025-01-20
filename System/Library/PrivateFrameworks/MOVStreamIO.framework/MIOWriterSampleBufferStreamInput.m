@interface MIOWriterSampleBufferStreamInput
- (BOOL)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 attachments:(id)a4 error:(id *)a5;
- (BOOL)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 metadataGroup:(id)a4 error:(id *)a5;
- (BOOL)sampleReorderingEnabled;
- (MIOWriterSampleBufferStreamInput)init;
- (MIOWriterSampleBufferStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4;
- (id)avMediaType;
- (id)sampleInputOutputSettings;
- (opaqueCMFormatDescription)formatDescription;
- (opaqueCMFormatDescription)timeCodeFormatDescription;
- (void)dealloc;
@end

@implementation MIOWriterSampleBufferStreamInput

- (MIOWriterSampleBufferStreamInput)init
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  NSLog(&cfstr_ErrorDoNotCall_0.isa, v4);

  return 0;
}

- (MIOWriterSampleBufferStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MIOWriterSampleBufferStreamInput;
  v7 = [(MIOWriterBufferStreamInput *)&v14 init];
  v8 = v7;
  if (v7)
  {
    [(MIOWriterStreamInput *)v7 setStreamId:v6];
    v8->_inputFormatDesc = a4;
    CFRetain(a4);
    inputFormatDesc = v8->_inputFormatDesc;
    if (inputFormatDesc)
    {
      uint64_t MediaType = CMFormatDescriptionGetMediaType(inputFormatDesc);
      [(MIOWriterStreamInput *)v8 setMediaType:+[MIOMediaTypeUtility matchingMIOMediaTypeFromCMType:MediaType]];
      v11 = +[MIOMediaTypeUtility matchingAVMediaTypeFromCMType:MediaType];
    }
    else
    {
      [(MIOWriterStreamInput *)v8 setMediaType:0];
      v11 = (NSString *)(id)*MEMORY[0x263EF9D48];
    }
    avuint64_t MediaType = v8->_avMediaType;
    v8->_avuint64_t MediaType = v11;
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
  v4.super_class = (Class)MIOWriterSampleBufferStreamInput;
  [(MIOWriterSampleBufferStreamInput *)&v4 dealloc];
}

- (BOOL)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 metadataGroup:(id)a4 error:(id *)a5
{
  id v8 = a4;
  memset(&v18, 0, sizeof(v18));
  CMSampleBufferGetPresentationTimeStamp(&v18, a3);
  CMTime location = v18;
  if ([(MIOWriterStreamInput *)self prepareForAppendWithTimeStamp:&location error:a5])
  {
    CFRetain(a3);
    objc_initWeak((id *)&location, self);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __75__MIOWriterSampleBufferStreamInput_appendSampleBuffer_metadataGroup_error___block_invoke;
    v14[3] = &unk_2643AF530;
    objc_copyWeak(v16, (id *)&location);
    v16[1] = a3;
    id v15 = v8;
    v9 = (uint64_t (**)(void))MEMORY[0x21D492700](v14);
    int64_t v10 = [(MIOWriterStreamInput *)self threadingOption];
    if (v10)
    {
      if (v10 == 1) {
        LOBYTE(self) = v9[2](v9);
      }
    }
    else
    {
      self = [(MIOWriterStreamInput *)self processingQueue];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __75__MIOWriterSampleBufferStreamInput_appendSampleBuffer_metadataGroup_error___block_invoke_2;
      v12[3] = &unk_2643AF558;
      v13 = v9;
      dispatch_async(&self->super.super.super, v12);

      LOBYTE(self) = 1;
    }

    objc_destroyWeak(v16);
    objc_destroyWeak((id *)&location);
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return self & 1;
}

uint64_t __75__MIOWriterSampleBufferStreamInput_appendSampleBuffer_metadataGroup_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x21D4924B0]();
    objc_super v4 = objc_opt_new();
    [v4 setSampleBuffer:*(void *)(a1 + 48)];
    [v4 setMetadata:*(void *)(a1 + 32)];
    v5 = [WeakRetained fifoBuffer];
    char v6 = [v5 enqueue:v4];

    if (v6)
    {
      uint64_t v7 = [WeakRetained finalizeProcessing];
    }
    else
    {
      CFRelease(*(CFTypeRef *)(a1 + 48));
      id v8 = NSString;
      v9 = [WeakRetained streamId];
      int64_t v10 = [v8 stringWithFormat:@"Attempted to enqueue sample in full Fifo for stream %@.  Indicates leak in overall pending sample tracking.", v9];

      v11 = [MEMORY[0x263F087E8] streamErrorWithMessage:v10 code:21];
      v12 = [WeakRetained writer];
      [v12 reportError:v11];

      uint64_t v7 = 0;
    }
  }
  else
  {
    CFRelease(*(CFTypeRef *)(a1 + 48));
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __75__MIOWriterSampleBufferStreamInput_appendSampleBuffer_metadataGroup_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 attachments:(id)a4 error:(id *)a5
{
  id v8 = a4;
  memset(&v19, 0, sizeof(v19));
  CMSampleBufferGetPresentationTimeStamp(&v19, a3);
  CMTime location = v19;
  if ([(MIOWriterStreamInput *)self prepareForAppendWithTimeStamp:&location error:a5])
  {
    CFRetain(a3);
    objc_initWeak((id *)&location, self);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __73__MIOWriterSampleBufferStreamInput_appendSampleBuffer_attachments_error___block_invoke;
    v14[3] = &unk_2643AF580;
    objc_copyWeak(v16, (id *)&location);
    v16[1] = a3;
    id v15 = v8;
    CMTime v17 = v19;
    v9 = (uint64_t (**)(void))MEMORY[0x21D492700](v14);
    int64_t v10 = [(MIOWriterStreamInput *)self threadingOption];
    if (v10)
    {
      if (v10 == 1) {
        LOBYTE(self) = v9[2](v9);
      }
    }
    else
    {
      self = [(MIOWriterStreamInput *)self processingQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __73__MIOWriterSampleBufferStreamInput_appendSampleBuffer_attachments_error___block_invoke_2;
      block[3] = &unk_2643AF558;
      v13 = v9;
      dispatch_async(&self->super.super.super, block);

      LOBYTE(self) = 1;
    }

    objc_destroyWeak(v16);
    objc_destroyWeak((id *)&location);
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return self & 1;
}

uint64_t __73__MIOWriterSampleBufferStreamInput_appendSampleBuffer_attachments_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x21D4924B0]();
    uint64_t v4 = *(void *)(a1 + 32);
    long long v21 = *(_OWORD *)(a1 + 56);
    uint64_t v22 = *(void *)(a1 + 72);
    id v23 = 0;
    v5 = [MEMORY[0x263EFA8C0] attachmentsMIOTimedMetadataGroupForDictionary:v4 pts:&v21 error:&v23];
    id v6 = v23;
    if (v6)
    {
      uint64_t v7 = NSString;
      id v8 = [WeakRetained streamId];
      v9 = [v7 stringWithFormat:@"Cannot append frame, invalid buffer attachments %@ for stream %@.", v6, v8];

      int64_t v10 = [MEMORY[0x263F087E8] streamErrorWithMessage:v9 code:21];
      v11 = [WeakRetained writer];
      [v11 reportError:v10];

      CFRelease(*(CFTypeRef *)(a1 + 48));
    }
    else
    {
      v9 = objc_opt_new();
      [v9 setSampleBuffer:*(void *)(a1 + 48)];
      [v9 setMetadata:v5];
      v13 = [WeakRetained fifoBuffer];
      char v14 = [v13 enqueue:v9];

      if (v14)
      {
        uint64_t v12 = [WeakRetained finalizeProcessing];
LABEL_9:

        goto LABEL_10;
      }
      CFRelease(*(CFTypeRef *)(a1 + 48));
      id v15 = NSString;
      v16 = [WeakRetained streamId];
      CMTime v17 = [v15 stringWithFormat:@"Attempted to enqueue sample in full Fifo for stream %@.  Indicates leak in overall pending sample tracking.", v16];

      CMTime v18 = [MEMORY[0x263F087E8] streamErrorWithMessage:v17 code:21];
      CMTime v19 = [WeakRetained writer];
      [v19 reportError:v18];
    }
    uint64_t v12 = 0;
    goto LABEL_9;
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
  uint64_t v12 = 0;
LABEL_10:

  return v12;
}

uint64_t __73__MIOWriterSampleBufferStreamInput_appendSampleBuffer_attachments_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)sampleInputOutputSettings
{
  return 0;
}

- (id)avMediaType
{
  return self->_avMediaType;
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_inputFormatDesc;
}

- (opaqueCMFormatDescription)timeCodeFormatDescription
{
  return 0;
}

- (BOOL)sampleReorderingEnabled
{
  return 0;
}

- (void).cxx_destruct
{
}

@end