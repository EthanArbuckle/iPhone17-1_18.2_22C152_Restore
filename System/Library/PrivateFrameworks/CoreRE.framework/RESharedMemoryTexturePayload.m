@interface RESharedMemoryTexturePayload
+ (BOOL)supportsSecureCoding;
- (OS_dispatch_data)data;
- (RESharedMemoryTexturePayload)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5;
- (RESharedMemoryTexturePayload)initWithCoder:(id)a3;
- (id)redactedDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RESharedMemoryTexturePayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RESharedMemoryTexturePayload)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)RESharedMemoryTexturePayload;
  v5 = [(RESharedResourcePayload *)&v11 init];
  v6 = v5;
  if (v5 && !v5->_data)
  {
    v8 = *re::assetTypesLogObjects((re *)v5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_fault_impl(&dword_233120000, v8, OS_LOG_TYPE_FAULT, "Expected data to be non-nil", v10, 2u);
    }
    v7 = 0;
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (RESharedMemoryTexturePayload)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RESharedMemoryTexturePayload;
  v5 = [(RESharedResourcePayload *)&v13 initWithCoder:v4];
  if (v5
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"],
        v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 _createDispatchData],
        data = v5->_data,
        v5->_data = (OS_dispatch_data *)v7,
        data,
        v6,
        !v5->_data))
  {
    objc_super v11 = *re::assetTypesLogObjects(v9);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_fault_impl(&dword_233120000, v11, OS_LOG_TYPE_FAULT, "Failed to decode data object for %@", buf, 0xCu);
    }
    v10 = 0;
  }
  else
  {
    v10 = v5;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)redactedDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<RESharedMemoryTexturePayload: %p>", self);
}

- (OS_dispatch_data)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end