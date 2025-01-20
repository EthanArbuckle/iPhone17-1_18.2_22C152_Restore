@interface _MTLIndirectDrawIndexedPatchesArguments
- (unint64_t)baseInstance;
- (unint64_t)controlPointIndexBufferGPUVirtualAddress;
- (unint64_t)instanceCount;
- (unint64_t)numberOfPatchControlPoints;
- (unint64_t)patchCount;
- (unint64_t)patchIndexBufferGPUVirtualAddress;
- (unint64_t)patchStart;
- (void)controlPointIndexBufferVirtualAddress;
- (void)patchIndexBufferVirtualAddress;
- (void)setBaseInstance:(unint64_t)a3;
- (void)setControlPointIndexBufferGPUVirtualAddress:(unint64_t)a3;
- (void)setInstanceCount:(unint64_t)a3;
- (void)setNumberOfPatchControlPoints:(unint64_t)a3;
- (void)setPatchCount:(unint64_t)a3;
- (void)setPatchIndexBufferGPUVirtualAddress:(unint64_t)a3;
- (void)setPatchStart:(unint64_t)a3;
@end

@implementation _MTLIndirectDrawIndexedPatchesArguments

- (void)patchIndexBufferVirtualAddress
{
  return (void *)self->_patchIndexBufferGPUVirtualAddress;
}

- (void)controlPointIndexBufferVirtualAddress
{
  return (void *)self->_controlPointIndexBufferGPUVirtualAddress;
}

- (unint64_t)numberOfPatchControlPoints
{
  return self->_numberOfPatchControlPoints;
}

- (void)setNumberOfPatchControlPoints:(unint64_t)a3
{
  self->_numberOfPatchControlPoints = a3;
}

- (unint64_t)patchStart
{
  return self->_patchStart;
}

- (void)setPatchStart:(unint64_t)a3
{
  self->_patchStart = a3;
}

- (unint64_t)patchCount
{
  return self->_patchCount;
}

- (void)setPatchCount:(unint64_t)a3
{
  self->_patchCount = a3;
}

- (unint64_t)patchIndexBufferGPUVirtualAddress
{
  return self->_patchIndexBufferGPUVirtualAddress;
}

- (void)setPatchIndexBufferGPUVirtualAddress:(unint64_t)a3
{
  self->_patchIndexBufferGPUVirtualAddress = a3;
}

- (unint64_t)controlPointIndexBufferGPUVirtualAddress
{
  return self->_controlPointIndexBufferGPUVirtualAddress;
}

- (void)setControlPointIndexBufferGPUVirtualAddress:(unint64_t)a3
{
  self->_controlPointIndexBufferGPUVirtualAddress = a3;
}

- (unint64_t)instanceCount
{
  return self->_instanceCount;
}

- (void)setInstanceCount:(unint64_t)a3
{
  self->_instanceCount = a3;
}

- (unint64_t)baseInstance
{
  return self->_baseInstance;
}

- (void)setBaseInstance:(unint64_t)a3
{
  self->_baseInstance = a3;
}

@end