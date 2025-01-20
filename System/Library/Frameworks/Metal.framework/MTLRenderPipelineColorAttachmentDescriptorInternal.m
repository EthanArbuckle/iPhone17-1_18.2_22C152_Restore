@interface MTLRenderPipelineColorAttachmentDescriptorInternal
- (BOOL)isBlendingEnabled;
- (BOOL)isEqual:(id)a3;
- (MTLRenderPipelineColorAttachmentDescriptorInternal)init;
- (const)_descriptorPrivate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)alphaBlendOperation;
- (unint64_t)destinationAlphaBlendFactor;
- (unint64_t)destinationRGBBlendFactor;
- (unint64_t)hash;
- (unint64_t)pixelFormat;
- (unint64_t)rgbBlendOperation;
- (unint64_t)sourceAlphaBlendFactor;
- (unint64_t)sourceRGBBlendFactor;
- (unint64_t)writeMask;
- (void)dealloc;
- (void)setAlphaBlendOperation:(unint64_t)a3;
- (void)setBlendingEnabled:(BOOL)a3;
- (void)setDestinationAlphaBlendFactor:(unint64_t)a3;
- (void)setDestinationRGBBlendFactor:(unint64_t)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setRgbBlendOperation:(unint64_t)a3;
- (void)setSourceAlphaBlendFactor:(unint64_t)a3;
- (void)setSourceRGBBlendFactor:(unint64_t)a3;
- (void)setWriteMask:(unint64_t)a3;
@end

@implementation MTLRenderPipelineColorAttachmentDescriptorInternal

- (MTLRenderPipelineColorAttachmentDescriptorInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLRenderPipelineColorAttachmentDescriptorInternal;
  result = [(MTLRenderPipelineColorAttachmentDescriptorInternal *)&v3 init];
  if (result) {
    result->_private.var0.var1.var0 = 2013270144;
  }
  return result;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFFFLL | ((unint64_t)a3 << 36);
}

- (void)setBlendingEnabled:(BOOL)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (void)setSourceRGBBlendFactor:(unint64_t)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFFFFFFF07FLL | ((a3 & 0x1F) << 7);
}

- (void)setDestinationRGBBlendFactor:(unint64_t)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFFFFC1FFFFLL | ((a3 & 0x1F) << 17);
}

- (void)setDestinationAlphaBlendFactor:(unint64_t)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFFF83FFFFFLL | ((a3 & 0x1F) << 22);
}

- (void)setSourceAlphaBlendFactor:(unint64_t)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFFFFFE0FFFLL | ((a3 & 0x1F) << 12);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result) {
    *((void *)result + 1) = self->_private.var0.var1.var0;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MTLRenderPipelineColorAttachmentDescriptorInternal;
  [(MTLRenderPipelineColorAttachmentDescriptorInternal *)&v2 dealloc];
}

- (const)_descriptorPrivate
{
  return &self->_private;
}

- (void)setWriteMask:(unint64_t)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFF87FFFFFFLL | ((a3 & 0xF) << 27);
}

- (unint64_t)pixelFormat
{
  return self->_private.var0.var1.var0 >> 36;
}

- (unint64_t)writeMask
{
  return (self->_private.var0.var1.var0 >> 27) & 0xF;
}

- (BOOL)isBlendingEnabled
{
  return *(_DWORD *)&self->_private.var0.var0 & 1;
}

- (unint64_t)sourceRGBBlendFactor
{
  return (self->_private.var0.var1.var0 >> 7) & 0x1F;
}

- (unint64_t)sourceAlphaBlendFactor
{
  return (self->_private.var0.var1.var0 >> 12) & 0x1F;
}

- (unint64_t)rgbBlendOperation
{
  return (self->_private.var0.var1.var0 >> 1) & 7;
}

- (unint64_t)destinationRGBBlendFactor
{
  return (self->_private.var0.var1.var0 >> 17) & 0x1F;
}

- (unint64_t)destinationAlphaBlendFactor
{
  return (self->_private.var0.var1.var0 >> 22) & 0x1F;
}

- (unint64_t)alphaBlendOperation
{
  return (self->_private.var0.var1.var0 >> 4) & 7;
}

- (void)setAlphaBlendOperation:(unint64_t)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFFFFFFFF8FLL | (16 * (a3 & 7));
}

- (void)setRgbBlendOperation:(unint64_t)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFFFFFFFFF1 | (2 * (a3 & 7));
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  return Class == object_getClass(a3) && self->_private.var0.var1.var0 == *((void *)a3 + 1);
}

- (unint64_t)hash
{
  return _MTLHashState((int *)&self->_private, 8uLL);
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4 = a3 + 4;
  v5 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTLRenderPipelineColorAttachmentDescriptorInternal;
  id v6 = [(MTLRenderPipelineColorAttachmentDescriptorInternal *)&v8 description];
  return (id)[v5 stringWithFormat:@"%@%@", v6, pipelineColorAttachmentFormattedDescription(v4, self)];
}

- (id)description
{
  return [(MTLRenderPipelineColorAttachmentDescriptorInternal *)self formattedDescription:0];
}

@end