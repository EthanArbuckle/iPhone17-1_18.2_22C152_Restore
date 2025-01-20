@interface _MTLIndirectTessellationFactorArguments
- (float)scale;
- (unint64_t)GPUVirtualAddress;
- (unint64_t)instanceStride;
- (void)setGPUVirtualAddress:(unint64_t)a3;
- (void)setInstanceStride:(unint64_t)a3;
- (void)setScale:(float)a3;
- (void)virtualAddress;
@end

@implementation _MTLIndirectTessellationFactorArguments

- (void)virtualAddress
{
  return (void *)self->_GPUVirtualAddress;
}

- (unint64_t)GPUVirtualAddress
{
  return self->_GPUVirtualAddress;
}

- (void)setGPUVirtualAddress:(unint64_t)a3
{
  self->_GPUVirtualAddress = a3;
}

- (unint64_t)instanceStride
{
  return self->_instanceStride;
}

- (void)setInstanceStride:(unint64_t)a3
{
  self->_instanceStride = a3;
}

- (float)scale
{
  return self->_scale;
}

- (void)setScale:(float)a3
{
  self->_scale = a3;
}

@end