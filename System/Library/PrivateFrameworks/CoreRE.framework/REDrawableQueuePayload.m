@interface REDrawableQueuePayload
+ (BOOL)supportsSecureCoding;
- (BOOL)allowPixelFormatConversion;
- (NSArray)textureHandles;
- (OS_xpc_object)queueStateShmem;
- (REDrawableQueuePayload)initWithCoder:(id)a3;
- (REDrawableQueuePayload)initWithWidth:(unsigned int)a3 height:(unsigned int)a4 pixelFormat:(unint64_t)a5 textureHandles:(id)a6 allowPixelFormatConversion:(BOOL)a7 machSemaphore:(unsigned int)a8 queueStateShmem:(void *)region queueStateLength:(unint64_t)length;
- (id)redactedDescription;
- (unint64_t)pixelFormat;
- (unsigned)height;
- (unsigned)machSemaphore;
- (unsigned)width;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REDrawableQueuePayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REDrawableQueuePayload)initWithWidth:(unsigned int)a3 height:(unsigned int)a4 pixelFormat:(unint64_t)a5 textureHandles:(id)a6 allowPixelFormatConversion:(BOOL)a7 machSemaphore:(unsigned int)a8 queueStateShmem:(void *)region queueStateLength:(unint64_t)length
{
  id v16 = a6;
  v29.receiver = self;
  v29.super_class = (Class)REDrawableQueuePayload;
  v17 = [(RESharedResourcePayload *)&v29 init];
  v18 = v17;
  if (!v17) {
    goto LABEL_8;
  }
  v17->_width = a3;
  v17->_height = a4;
  v17->_pixelFormat = a5;
  uint64_t v19 = [v16 copy];
  textureHandles = v18->_textureHandles;
  v18->_textureHandles = (NSArray *)v19;

  if (![(NSArray *)v18->_textureHandles count])
  {
    v25 = *re::assetTypesLogObjects(0);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_18;
    }
    v28[0] = 0;
    v26 = "Expected non-empty array of texture handles";
LABEL_17:
    _os_log_fault_impl(&dword_233120000, v25, OS_LOG_TYPE_FAULT, v26, (uint8_t *)v28, 2u);
    goto LABEL_18;
  }
  if (!region || !length)
  {
    v25 = *re::assetTypesLogObjects((re *)region);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_18;
    }
    v28[0] = 0;
    v26 = "Expected non-empty queue state shmem region";
    goto LABEL_17;
  }
  v21 = (OS_xpc_object *)xpc_shmem_create(region, length);
  queueStateShmem = v18->_queueStateShmem;
  v18->_queueStateShmem = v21;

  if (!v18->_queueStateShmem)
  {
    v25 = *re::assetTypesLogObjects(v23);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_18;
    }
    v28[0] = 0;
    v26 = "Failed to create xpc_shmem object";
    goto LABEL_17;
  }
  v18->_machSemaphore = a8;
  if (!a8)
  {
    v25 = *re::assetTypesLogObjects(v23);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      v28[0] = 0;
      v26 = "Expected non-empty machSemaphore object";
      goto LABEL_17;
    }
LABEL_18:
    v24 = 0;
    goto LABEL_19;
  }
  v18->_allowPixelFormatConversion = a7;
LABEL_8:
  v24 = v18;
LABEL_19:

  return v24;
}

- (REDrawableQueuePayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)REDrawableQueuePayload;
  v5 = [(RESharedResourcePayload *)&v25 initWithCoder:v4];
  if (!v5) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [v4 failWithError:v10];
LABEL_16:

    v20 = 0;
    goto LABEL_17;
  }
  unint64_t v7 = [v4 decodeIntegerForKey:@"width"];
  v5->_width = v7;
  unint64_t v8 = [v4 decodeIntegerForKey:@"height"];
  v5->_height = v8;
  v5->_pixelFormat = [v4 decodeIntegerForKey:@"pixelFormat"];
  if (HIDWORD(v8) || HIDWORD(v7))
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [v4 failWithError:v10];
    goto LABEL_16;
  }
  id v10 = v4;
  v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  uint64_t v14 = [v10 decodeObjectOfClasses:v13 forKey:@"textureHandles"];
  textureHandles = v5->_textureHandles;
  v5->_textureHandles = (NSArray *)v14;

  v5->_allowPixelFormatConversion = [v10 decodeBoolForKey:@"allowPixelFormatConversion"];
  id v16 = [v10 decodeXPCObjectOfType:MEMORY[0x263EF8748] forKey:@"drawableQueueMachSemaphore"];
  if (!v16)
  {
    v22 = *re::assetTypesLogObjects(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_233120000, v22, OS_LOG_TYPE_FAULT, "Unable to get decode a mach semaphore", buf, 2u);
    }
    goto LABEL_15;
  }
  v5->_machSemaphore = xpc_mach_send_copy_right();
  uint64_t v17 = [v10 decodeXPCObjectOfType:MEMORY[0x263EF8790] forKey:@"queueStateShmem"];
  queueStateShmem = v5->_queueStateShmem;
  v5->_queueStateShmem = (OS_xpc_object *)v17;

  if (!v5->_textureHandles || !v5->_queueStateShmem) {
    v21 = {;
  }
    [v10 failWithError:v21];

LABEL_15:
    goto LABEL_16;
  }

LABEL_9:
  v20 = v5;
LABEL_17:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v6 = v4;
    [v6 encodeInteger:self->_width forKey:@"width"];
    [v6 encodeInteger:self->_height forKey:@"height"];
    [v6 encodeInteger:self->_pixelFormat forKey:@"pixelFormat"];
    [v6 encodeObject:self->_textureHandles forKey:@"textureHandles"];
    [v6 encodeBool:self->_allowPixelFormatConversion forKey:@"allowPixelFormatConversion"];
    unint64_t v7 = (void *)xpc_mach_send_create();
    [v6 encodeXPCObject:v7 forKey:@"drawableQueueMachSemaphore"];
    [v6 encodeXPCObject:self->_queueStateShmem forKey:@"queueStateShmem"];
  }
  else
  {
    unint64_t v8 = *re::assetTypesLogObjects((re *)isKindOfClass);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_233120000, v8, OS_LOG_TYPE_FAULT, "Expected to encode an REDrawableQueuePayload into an NSXPCCoder", v9, 2u);
    }
  }
}

- (id)redactedDescription
{
  return (id)[NSString stringWithFormat:@"<REDrawableQueuePayload: %p, Texture handles: %@>", self, self->_textureHandles];
}

- (unsigned)width
{
  return self->_width;
}

- (unsigned)height
{
  return self->_height;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (NSArray)textureHandles
{
  return self->_textureHandles;
}

- (BOOL)allowPixelFormatConversion
{
  return self->_allowPixelFormatConversion;
}

- (unsigned)machSemaphore
{
  return self->_machSemaphore;
}

- (OS_xpc_object)queueStateShmem
{
  return self->_queueStateShmem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueStateShmem, 0);
  objc_storeStrong((id *)&self->_textureHandles, 0);
}

@end