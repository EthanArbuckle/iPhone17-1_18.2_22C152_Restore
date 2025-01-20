@interface MIOWriterMetadataGroupStreamInput
- (BOOL)appendMetadata:(id)a3 error:(id *)a4;
- (BOOL)superAppendMetadata:(id)a3;
- (MIOWriterBufferStreamInput)associateToInput;
- (MIOWriterMetadataGroupStreamInput)init;
- (MIOWriterMetadataGroupStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4;
- (MIOWriterMetadataGroupStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4 associateToInput:(id)a5;
- (id)uuid;
@end

@implementation MIOWriterMetadataGroupStreamInput

- (MIOWriterMetadataGroupStreamInput)init
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  NSLog(&cfstr_ErrorDoNotCall_0.isa, v4);

  return 0;
}

- (MIOWriterMetadataGroupStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4 associateToInput:(id)a5
{
  id v8 = a5;
  v9 = [(MIOWriterMetadataGroupStreamInput *)self initWithStreamId:a3 format:a4];
  if (v9)
  {
    if (![v8 registerForAssociating:v9 trackRelation:*MEMORY[0x263EFA1B0]])
    {
      v12 = 0;
      goto LABEL_6;
    }
    uint64_t v10 = [v8 uuid];
    associatedInputUUID = v9->_associatedInputUUID;
    v9->_associatedInputUUID = (NSString *)v10;
  }
  v12 = v9;
LABEL_6:

  return v12;
}

- (MIOWriterMetadataGroupStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MIOWriterMetadataGroupStreamInput;
  return [(MIOWriterMetadataStreamInput *)&v5 initWithStreamId:a3 format:a4];
}

- (BOOL)superAppendMetadata:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MIOWriterMetadataGroupStreamInput;
  return [(MIOWriterMetadataStreamInput *)&v4 appendMetadata:a3];
}

- (BOOL)appendMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    [v6 timeRange];
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
  }
  *(_OWORD *)location = v18;
  uint64_t v17 = v19;
  if ([(MIOWriterStreamInput *)self prepareForAppendWithTimeStamp:location error:a4])
  {
    objc_initWeak(location, self);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__MIOWriterMetadataGroupStreamInput_appendMetadata_error___block_invoke;
    v13[3] = &unk_2643AF7F8;
    objc_copyWeak(&v15, location);
    id v14 = v7;
    id v8 = (uint64_t (**)(void))MEMORY[0x21D492700](v13);
    int64_t v9 = [(MIOWriterStreamInput *)self threadingOption];
    if (v9)
    {
      if (v9 == 1) {
        LOBYTE(self) = v8[2](v8);
      }
    }
    else
    {
      self = [(MIOWriterStreamInput *)self processingQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__MIOWriterMetadataGroupStreamInput_appendMetadata_error___block_invoke_2;
      block[3] = &unk_2643AF558;
      v12 = v8;
      dispatch_async(&self->super.super.super, block);

      LOBYTE(self) = 1;
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return self & 1;
}

uint64_t __58__MIOWriterMetadataGroupStreamInput_appendMetadata_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x21D4924B0]();
    uint64_t v4 = [WeakRetained superAppendMetadata:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __58__MIOWriterMetadataGroupStreamInput_appendMetadata_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (MIOWriterBufferStreamInput)associateToInput
{
  v2 = [(MIOWriterStreamInput *)self associatedInputs];
  v3 = [v2 firstObject];
  uint64_t v4 = [v3 firstObject];
  objc_super v5 = [v4 nonretainedObjectValue];

  return (MIOWriterBufferStreamInput *)v5;
}

- (id)uuid
{
  uuid = self->_uuid;
  if (!uuid)
  {
    uint64_t v4 = NSString;
    objc_super v5 = [(MIOWriterStreamInput *)self streamId];
    id v6 = [v4 stringWithFormat:@"%@_%ld_%@", v5, -[MIOWriterStreamInput mediaType](self, "mediaType"), self->_associatedInputUUID];
    v7 = self->_uuid;
    self->_uuid = v6;

    uuid = self->_uuid;
  }

  return uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedInputUUID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end