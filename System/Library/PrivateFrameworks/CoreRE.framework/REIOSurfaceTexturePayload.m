@interface REIOSurfaceTexturePayload
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSameUnderlyingIOSurface:(id)a3;
- (IOSurface)ioSurface;
- (REIOSurfaceTexturePayload)initWithCoder:(id)a3;
- (REIOSurfaceTexturePayload)initWithIOSurface:(id)a3 plane:(unint64_t)a4 pixelFormat:(unint64_t)a5;
- (id)redactedDescription;
- (unint64_t)pixelFormat;
- (unint64_t)planeIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REIOSurfaceTexturePayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REIOSurfaceTexturePayload)initWithIOSurface:(id)a3 plane:(unint64_t)a4 pixelFormat:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v23.receiver = self;
  v23.super_class = (Class)REIOSurfaceTexturePayload;
  v10 = [(RESharedResourcePayload *)&v23 init];
  v11 = v10;
  if (v10)
  {
    p_ioSurface = (id *)&v10->_ioSurface;
    objc_storeStrong((id *)&v10->_ioSurface, a3);
    v11->_unint64_t planeIndex = a4;
    v11->_pixelFormat = a5;
    if (*p_ioSurface)
    {
      v13 = (re *)[*p_ioSurface planeCount];
      BOOL v14 = a4 == 0;
      if (v13) {
        BOOL v14 = (unint64_t)v13 > a4;
      }
      if (v14) {
        goto LABEL_6;
      }
      v20 = *re::assetTypesLogObjects(v13);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
LABEL_10:
        v15 = 0;
        goto LABEL_11;
      }
      unint64_t planeIndex = v11->_planeIndex;
      *(_DWORD *)buf = 134217984;
      unint64_t v25 = planeIndex;
      v17 = "Invalid plane index %lu when decoding REIOSurfaceTexturePayload";
      v18 = v20;
      uint32_t v19 = 12;
    }
    else
    {
      v16 = *re::assetTypesLogObjects(0);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        goto LABEL_10;
      }
      *(_WORD *)buf = 0;
      v17 = "Expected IOSurface to be non-nil";
      v18 = v16;
      uint32_t v19 = 2;
    }
    _os_log_fault_impl(&dword_233120000, v18, OS_LOG_TYPE_FAULT, v17, buf, v19);
    goto LABEL_10;
  }
LABEL_6:
  v15 = v11;
LABEL_11:

  return v15;
}

- (REIOSurfaceTexturePayload)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)REIOSurfaceTexturePayload;
  v5 = [(RESharedResourcePayload *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ioSurface"];
    ioSurface = v5->_ioSurface;
    v5->_ioSurface = (IOSurface *)v6;

    v5->_unint64_t planeIndex = [v4 decodeIntegerForKey:@"planeIndex"];
    v5->_pixelFormat = [v4 decodeIntegerForKey:@"pixelFormat"];
    v8 = v5->_ioSurface;
    if (v8)
    {
      unint64_t planeIndex = v5->_planeIndex;
      v10 = [(IOSurface *)v8 planeCount];
      BOOL v11 = planeIndex == 0;
      if (v10) {
        BOOL v11 = (unint64_t)v10 > planeIndex;
      }
      if (v11) {
        goto LABEL_6;
      }
      v13 = *re::assetTypesLogObjects(v10);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
LABEL_10:
        v12 = 0;
        goto LABEL_11;
      }
      unint64_t v16 = v5->_planeIndex;
      *(_DWORD *)buf = 134217984;
      uint32_t v19 = (REIOSurfaceTexturePayload *)v16;
      BOOL v14 = "Invalid plane index %lu when decoding REIOSurfaceTexturePayload";
    }
    else
    {
      v13 = *re::assetTypesLogObjects(0);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 138412290;
      uint32_t v19 = v5;
      BOOL v14 = "Failed to decode IOSurface reference for %@";
    }
    _os_log_fault_impl(&dword_233120000, v13, OS_LOG_TYPE_FAULT, v14, buf, 0xCu);
    goto LABEL_10;
  }
LABEL_6:
  v12 = v5;
LABEL_11:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_ioSurface forKey:@"ioSurface"];
  [v4 encodeInteger:self->_planeIndex forKey:@"planeIndex"];
  [v4 encodeInteger:self->_pixelFormat forKey:@"pixelFormat"];
}

- (BOOL)hasSameUnderlyingIOSurface:(id)a3
{
  id v4 = (REIOSurfaceTexturePayload *)a3;
  v5 = v4;
  if (v4) {
    BOOL v8 = self == v4
  }
      || (ioSurface = self->_ioSurface, v7 = v5->_ioSurface, ioSurface == v7)
      || CFEqual(ioSurface, v7) != 0;
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)redactedDescription
{
  return (id)[NSString stringWithFormat:@"<REIOSurfaceTexturePayload: %p, IOSurface id: %u>", self, IOSurfaceGetID((IOSurfaceRef)self->_ioSurface)];
}

- (IOSurface)ioSurface
{
  return self->_ioSurface;
}

- (unint64_t)planeIndex
{
  return self->_planeIndex;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void).cxx_destruct
{
}

@end