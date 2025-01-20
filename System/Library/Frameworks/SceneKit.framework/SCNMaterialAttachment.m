@interface SCNMaterialAttachment
+ (id)materialAttachmentWithGLKTextureInfo:(id)a3;
- (CGSize)size;
- (NSDictionary)options;
- (unsigned)glID;
- (unsigned)target;
- (void)context;
- (void)dealloc;
- (void)setContext:(void *)a3;
- (void)setGlID:(unsigned int)a3;
- (void)setOptions:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setTarget:(unsigned int)a3;
@end

@implementation SCNMaterialAttachment

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMaterialAttachment;
  [(SCNMaterialAttachment *)&v3 dealloc];
}

+ (id)materialAttachmentWithGLKTextureInfo:(id)a3
{
  double v4 = (double)[a3 width];
  double v5 = (double)[a3 height];
  uint64_t v6 = [a3 name];
  uint64_t v7 = [a3 target];

  return SCNTextureContentWithGLInfo(0, v6, v7, 0, v4, v5);
}

- (unsigned)glID
{
  return self->glID;
}

- (void)setGlID:(unsigned int)a3
{
  self->glID = a3;
}

- (unsigned)target
{
  return self->target;
}

- (void)setTarget:(unsigned int)a3
{
  self->target = a3;
}

- (void)context
{
  return self->context;
}

- (void)setContext:(void *)a3
{
  self->context = a3;
}

- (CGSize)size
{
  double width = self->size.width;
  double height = self->size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->size = a3;
}

- (NSDictionary)options
{
  return self->options;
}

- (void)setOptions:(id)a3
{
}

@end