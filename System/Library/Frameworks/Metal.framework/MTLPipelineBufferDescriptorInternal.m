@interface MTLPipelineBufferDescriptorInternal
- (BOOL)isDefault;
- (BOOL)isEqual:(id)a3;
- (MTLPipelineBufferDescriptorInternal)init;
- (const)_descriptorPrivate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)mutability;
- (void)dealloc;
- (void)setMutability:(unint64_t)a3;
@end

@implementation MTLPipelineBufferDescriptorInternal

- (void)setMutability:(unint64_t)a3
{
  char v7 = a3;
  if (a3 >= 3) {
    MTLReportFailure(0, "validateMTLMutability", 27, @"%lu is not a valid MTLMutability.", v3, v4, v5, v6, a3);
  }
  *(unsigned char *)&self->_private.var0.var0 = *(unsigned char *)&self->_private.var0.var0 & 0xFC | v7 & 3;
}

- (MTLPipelineBufferDescriptorInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLPipelineBufferDescriptorInternal;
  result = [(MTLPipelineBufferDescriptorInternal *)&v3 init];
  if (result) {
    result->_private.var0.var1.var0 = 0;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MTLPipelineBufferDescriptorInternal;
  [(MTLPipelineBufferDescriptorInternal *)&v2 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  return Class == object_getClass(a3) && self->_private.var0.var1.var0 == *((void *)a3 + 1);
}

- (BOOL)isDefault
{
  return self->_private.var0.var1.var0 == 0;
}

- (unint64_t)hash
{
  return _MTLHashState((int *)&self->_private, 8uLL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result) {
    *((void *)result + 1) = self->_private.var0.var1.var0;
  }
  return result;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4 = a3 + 4;
  uint64_t v5 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTLPipelineBufferDescriptorInternal;
  id v6 = [(MTLPipelineBufferDescriptorInternal *)&v8 description];
  return (id)[v5 stringWithFormat:@"%@%@", v6, pipelineBufferFormattedDescription(v4, self)];
}

- (id)description
{
  return [(MTLPipelineBufferDescriptorInternal *)self formattedDescription:0];
}

- (unint64_t)mutability
{
  return *(unsigned char *)&self->_private.var0.var0 & 3;
}

- (const)_descriptorPrivate
{
  return &self->_private;
}

@end