@interface _MTLIndirectDrawPatchesArguments
- (unint64_t)baseInstance;
- (unint64_t)instanceCount;
- (unint64_t)numberOfPatchControlPoints;
- (unint64_t)patchCount;
- (unint64_t)patchIndexBufferGPUVirtualAddress;
- (unint64_t)patchIndexBufferOffset;
- (unint64_t)patchStart;
- (void)patchIndexBufferVirtualAddress;
- (void)setBaseInstance:(unint64_t)a3;
- (void)setInstanceCount:(unint64_t)a3;
- (void)setNumberOfPatchControlPoints:(unint64_t)a3;
- (void)setPatchCount:(unint64_t)a3;
- (void)setPatchIndexBufferGPUVirtualAddress:(unint64_t)a3;
- (void)setPatchIndexBufferOffset:(unint64_t)a3;
- (void)setPatchStart:(unint64_t)a3;
@end

@implementation _MTLIndirectDrawPatchesArguments

- (void)patchIndexBufferVirtualAddress
{
  return (void *)self->_patchIndexBufferGPUVirtualAddress;
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

- (unint64_t)patchIndexBufferOffset
{
  return self->_patchIndexBufferOffset;
}

- (void)setPatchIndexBufferOffset:(unint64_t)a3
{
  self->_patchIndexBufferOffset = a3;
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