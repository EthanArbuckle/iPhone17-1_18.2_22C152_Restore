@interface RESharedTexturePayload
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSameUnderlyingIOSurface:(id)a3;
- (BOOL)isLimitedRenderAsset;
- (MTLSharedTextureHandle)handle;
- (NSString)colorSpace;
- (RESharedTexturePayload)initWithCoder:(id)a3;
- (RESharedTexturePayload)initWithTexture:(id)a3 isLimitedRenderAsset:(BOOL)a4 semantic:(unint64_t)a5 colorSpace:(id)a6;
- (id)description;
- (id)redactedDescription;
- (unint64_t)semantic;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RESharedTexturePayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RESharedTexturePayload)initWithTexture:(id)a3 isLimitedRenderAsset:(BOOL)a4 semantic:(unint64_t)a5 colorSpace:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)RESharedTexturePayload;
  v12 = [(RESharedResourcePayload *)&v19 init];
  if (v12
    && (uint64_t v13 = [v10 newSharedTextureHandle],
        handle = v12->_handle,
        v12->_handle = (MTLSharedTextureHandle *)v13,
        handle,
        v12->_isLimitedRenderAsset = a4,
        v12->_semantic = a5,
        objc_storeStrong((id *)&v12->_colorSpace, a6),
        !v12->_handle))
  {
    v17 = *re::assetTypesLogObjects(v15);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v10;
      _os_log_fault_impl(&dword_233120000, v17, OS_LOG_TYPE_FAULT, "Failed to create shared texture handle for %@", buf, 0xCu);
    }
    v16 = 0;
  }
  else
  {
    v16 = v12;
  }

  return v16;
}

- (RESharedTexturePayload)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RESharedTexturePayload;
  v5 = [(RESharedResourcePayload *)&v14 initWithCoder:v4];
  if (!v5) {
    goto LABEL_3;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
  handle = v5->_handle;
  v5->_handle = (MTLSharedTextureHandle *)v6;

  v5->_isLimitedRenderAsset = [v4 decodeBoolForKey:@"isLimitedRenderAsset"];
  v5->_semantic = [v4 decodeIntegerForKey:@"semantic"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colorSpace"];
  colorSpace = v5->_colorSpace;
  v5->_colorSpace = (NSString *)v8;

  if (!v5->_handle)
  {
    v12 = *re::assetTypesLogObjects(v10);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_fault_impl(&dword_233120000, v12, OS_LOG_TYPE_FAULT, "Failed to decode shared texture handle for %@", buf, 0xCu);
    }
    id v11 = 0;
  }
  else
  {
LABEL_3:
    id v11 = v5;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_handle forKey:@"handle"];
  [v4 encodeBool:self->_isLimitedRenderAsset forKey:@"isLimitedRenderAsset"];
  [v4 encodeInteger:self->_semantic forKey:@"semantic"];
  [v4 encodeObject:self->_colorSpace forKey:@"colorSpace"];
}

- (BOOL)hasSameUnderlyingIOSurface:(id)a3
{
  id v4 = (RESharedTexturePayload *)a3;
  p_isa = (id *)&v4->super.super.isa;
  if (v4) {
    BOOL v7 = self == v4
  }
      || (handle = self->_handle, handle == p_isa[3])
      || CFEqual((CFTypeRef)-[MTLSharedTextureHandle ioSurface](handle, "ioSurface"), (CFTypeRef)[p_isa[3] ioSurface]) != 0;
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t ID = IOSurfaceGetID((IOSurfaceRef)[(MTLSharedTextureHandle *)self->_handle ioSurface]);
  v5 = [(MTLSharedTextureHandle *)self->_handle label];
  uint64_t v6 = [v3 stringWithFormat:@"<RESharedTexturePayload: %p, IOSurface id: %u, label: '%@'>", self, ID, v5];

  return v6;
}

- (id)redactedDescription
{
  return (id)[NSString stringWithFormat:@"<RESharedTexturePayload: %p, IOSurface id: %u>", self, IOSurfaceGetID((IOSurfaceRef)-[MTLSharedTextureHandle ioSurface](self->_handle, "ioSurface"))];
}

- (MTLSharedTextureHandle)handle
{
  return self->_handle;
}

- (BOOL)isLimitedRenderAsset
{
  return self->_isLimitedRenderAsset;
}

- (unint64_t)semantic
{
  return self->_semantic;
}

- (NSString)colorSpace
{
  return self->_colorSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end