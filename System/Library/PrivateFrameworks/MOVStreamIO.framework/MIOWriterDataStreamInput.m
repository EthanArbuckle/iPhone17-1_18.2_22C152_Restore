@interface MIOWriterDataStreamInput
- (BOOL)appendMetadata:(id)a3 withTimeStamp:(id *)a4 error:(id *)a5;
- (BOOL)copyData;
- (BOOL)superAppendMetadata:(id)a3;
- (MIOWriterDataStreamInput)init;
- (MIOWriterDataStreamInput)initWithStreamId:(id)a3;
- (MIOWriterDataStreamInput)initWithStreamId:(id)a3 copyData:(BOOL)a4;
- (void)setCopyData:(BOOL)a3;
@end

@implementation MIOWriterDataStreamInput

- (MIOWriterDataStreamInput)init
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  NSLog(&cfstr_ErrorDoNotCall_0.isa, v4);

  return 0;
}

- (MIOWriterDataStreamInput)initWithStreamId:(id)a3
{
  return [(MIOWriterDataStreamInput *)self initWithStreamId:a3 copyData:1];
}

- (MIOWriterDataStreamInput)initWithStreamId:(id)a3 copyData:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void *)MEMORY[0x263EFA748];
  id v7 = a3;
  v8 = (const void *)[v6 createMIOMetadataStreamFormatDescription];
  v11.receiver = self;
  v11.super_class = (Class)MIOWriterDataStreamInput;
  v9 = [(MIOWriterMetadataStreamInput *)&v11 initWithStreamId:v7 format:v8];

  if (v8) {
    CFRelease(v8);
  }
  if (v9) {
    [(MIOWriterDataStreamInput *)v9 setCopyData:v4];
  }
  return v9;
}

- (BOOL)superAppendMetadata:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MIOWriterDataStreamInput;
  return [(MIOWriterMetadataStreamInput *)&v4 appendMetadata:a3];
}

- (BOOL)appendMetadata:(id)a3 withTimeStamp:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE location = *a4;
  if ([(MIOWriterStreamInput *)self prepareForAppendWithTimeStamp:&location error:a5])
  {
    objc_initWeak((id *)&location, self);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __63__MIOWriterDataStreamInput_appendMetadata_withTimeStamp_error___block_invoke;
    v14[3] = &unk_2643AF820;
    objc_copyWeak(&v16, (id *)&location);
    id v15 = v8;
    long long v17 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
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
      v12[2] = __63__MIOWriterDataStreamInput_appendMetadata_withTimeStamp_error___block_invoke_5;
      v12[3] = &unk_2643AF558;
      v13 = v9;
      dispatch_async(&self->super.super.super, v12);

      LOBYTE(self) = 1;
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)&location);
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return self & 1;
}

uint64_t __63__MIOWriterDataStreamInput_appendMetadata_withTimeStamp_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v4 = [WeakRetained perfLogHandle];
    uint64_t v5 = [v3 processingSignPostID];
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        LOWORD(v14) = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "mio.processing", (const char *)&unk_21B668A56, (uint8_t *)&v14, 2u);
      }
    }

    id v7 = (void *)MEMORY[0x21D4924B0]();
    id v8 = (void *)MEMORY[0x263EFA8C0];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [v3 copyData];
    long long v14 = *(_OWORD *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 64);
    objc_super v11 = [v8 metadataGroupForMetadataStreamFromData:v9 timeStamp:&v14 copyData:v10];
    uint64_t v12 = [v3 superAppendMetadata:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t __63__MIOWriterDataStreamInput_appendMetadata_withTimeStamp_error___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)copyData
{
  return self->_copyData;
}

- (void)setCopyData:(BOOL)a3
{
  self->_copyData = a3;
}

@end