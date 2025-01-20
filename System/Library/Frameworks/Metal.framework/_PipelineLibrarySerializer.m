@interface _PipelineLibrarySerializer
- (_PipelineLibrarySerializer)init;
- (id)addComputePipelineDescriptor:(const void *)a3;
- (id)addMeshRenderPipelineDescriptor:(const void *)a3;
- (id)addRenderPipelineDescriptor:(const void *)a3;
- (id)addSpecializedFunction:(id)a3 descriptor:(const void *)a4;
- (id)addTileRenderPipelineDescriptor:(const void *)a3;
- (unint64_t)addLibrary:(void *)a3;
- (unint64_t)totalSize;
- (unint64_t)writeToMemory:(char *)a3 size:(unint64_t)a4;
- (void)dealloc;
@end

@implementation _PipelineLibrarySerializer

- (_PipelineLibrarySerializer)init
{
  v3.receiver = self;
  v3.super_class = (Class)_PipelineLibrarySerializer;
  if ([(_PipelineLibrarySerializer *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  binarySerializer = self->_binarySerializer;
  if (binarySerializer) {
    (*(void (**)(void *, SEL))(*(void *)binarySerializer + 88))(binarySerializer, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)_PipelineLibrarySerializer;
  [(_PipelineLibrarySerializer *)&v4 dealloc];
}

- (unint64_t)addLibrary:(void *)a3
{
  return (**(uint64_t (***)(void *, void *))self->_binarySerializer)(self->_binarySerializer, a3);
}

- (id)addSpecializedFunction:(id)a3 descriptor:(const void *)a4
{
  return self;
}

- (id)addRenderPipelineDescriptor:(const void *)a3
{
  return self;
}

- (id)addComputePipelineDescriptor:(const void *)a3
{
  return self;
}

- (id)addTileRenderPipelineDescriptor:(const void *)a3
{
  return self;
}

- (id)addMeshRenderPipelineDescriptor:(const void *)a3
{
  return self;
}

- (unint64_t)totalSize
{
  return MTLPipelineLibrarySerializer::PipelineLibraryBinarySerializer::getTotalSize((MTLPipelineLibrarySerializer::BinarySerializationContext **)self->_binarySerializer);
}

- (unint64_t)writeToMemory:(char *)a3 size:(unint64_t)a4
{
  return MTLPipelineLibrarySerializer::PipelineLibraryBinarySerializer::writeToMemory((MTLPipelineLibrarySerializer::BinarySerializationContext **)self->_binarySerializer, a3, a4);
}

@end