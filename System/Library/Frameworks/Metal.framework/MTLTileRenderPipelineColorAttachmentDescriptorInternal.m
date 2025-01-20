@interface MTLTileRenderPipelineColorAttachmentDescriptorInternal
- (BOOL)isEqual:(id)a3;
- (MTLTileRenderPipelineColorAttachmentDescriptorInternal)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (uint64_t)_descriptorPrivate;
- (unint64_t)hash;
- (unint64_t)pixelFormat;
- (void)dealloc;
- (void)setPixelFormat:(unint64_t)a3;
@end

@implementation MTLTileRenderPipelineColorAttachmentDescriptorInternal

- (void)setPixelFormat:(unint64_t)a3
{
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  MTLPixelFormatGetInfoForDevice(0, a3, (uint64_t)v9);
  if (a3 && (BYTE8(v9[0]) & 1) == 0) {
    MTLReportFailure(0, "validateMTLPixelFormat", 29, @"pixelFormat is not a valid MTLPixelFormat.", v5, v6, v7, v8, *(uint64_t *)&v9[0]);
  }
  self->_private.var0.var0.pixelFormat = a3;
}

- (MTLTileRenderPipelineColorAttachmentDescriptorInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLTileRenderPipelineColorAttachmentDescriptorInternal;
  result = [(MTLTileRenderPipelineColorAttachmentDescriptorInternal *)&v3 init];
  if (result) {
    result->_private.var0.var0.pixelFormat = 0;
  }
  return result;
}

- (unint64_t)pixelFormat
{
  return self->_private.var0.var0.pixelFormat;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MTLTileRenderPipelineColorAttachmentDescriptorInternal;
  [(MTLTileRenderPipelineColorAttachmentDescriptorInternal *)&v2 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  return Class == object_getClass(a3) && self->_private.var0.var0.pixelFormat == *((_DWORD *)a3 + 2);
}

- (unint64_t)hash
{
  return _MTLHashState((int *)&self->_private, 4uLL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result) {
    *((_DWORD *)result + 2) = self->_private.var0.var0.pixelFormat;
  }
  return result;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4 = a3 + 4;
  uint64_t v5 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTLTileRenderPipelineColorAttachmentDescriptorInternal;
  id v6 = [(MTLTileRenderPipelineColorAttachmentDescriptorInternal *)&v8 description];
  return (id)[v5 stringWithFormat:@"%@%@", v6, tileColorAttachmentFormattedDescription(v4, &self->super)];
}

- (id)description
{
  return [(MTLTileRenderPipelineColorAttachmentDescriptorInternal *)self formattedDescription:0];
}

- (uint64_t)_descriptorPrivate
{
  if (result) {
    result += 8;
  }
  return result;
}

@end