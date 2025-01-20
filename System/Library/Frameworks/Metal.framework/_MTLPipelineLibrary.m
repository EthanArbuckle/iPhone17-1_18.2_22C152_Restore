@interface _MTLPipelineLibrary
- (BOOL)disableRunTimeCompilation;
- (MTLDevice)device;
- (MTLPipelineCache)functionCache;
- (MTLPipelineCache)pipelineCache;
- (NSArray)metallibPaths;
- (NSArray)pipelineNames;
- (_MTLPipelineLibrary)initWithDevice:(id)a3 pipelineLibraryData:(void *)a4;
- (id)newComputePipelineDescriptorWithName:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineDescriptorWithName:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (void)dealloc;
- (void)setDisableRunTimeCompilation:(BOOL)a3;
@end

@implementation _MTLPipelineLibrary

- (MTLPipelineCache)pipelineCache
{
  return (MTLPipelineCache *)*((void *)self->_pipelineLibraryData + 2);
}

- (void)dealloc
{
  pipelineLibraryData = (PipelineLibraryData *)self->_pipelineLibraryData;
  if (pipelineLibraryData)
  {
    PipelineLibraryData::~PipelineLibraryData(pipelineLibraryData);
    MEMORY[0x18530C140]();
  }
  v4.receiver = self;
  v4.super_class = (Class)_MTLPipelineLibrary;
  [(_MTLObjectWithLabel *)&v4 dealloc];
}

- (BOOL)disableRunTimeCompilation
{
  return self->_disableRunTimeCompilation;
}

- (MTLPipelineCache)functionCache
{
  return (MTLPipelineCache *)*((void *)self->_pipelineLibraryData + 3);
}

- (_MTLPipelineLibrary)initWithDevice:(id)a3 pipelineLibraryData:(void *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_MTLPipelineLibrary;
  v6 = [(_MTLObjectWithLabel *)&v8 init];
  if (v6)
  {
    v6->_device = (MTLDevice *)a3;
    v6->_pipelineLibraryData = a4;
    v6->_disableRunTimeCompilation = 0;
  }
  return v6;
}

- (id)newRenderPipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  v10 = MTLPipelineDescriptions::newRenderPipelineDescriptor(*(MTLPipelineDescriptions **)self->_pipelineLibraryData, (char *)[a3 UTF8String], *((_MTLPipelineCache **)self->_pipelineLibraryData + 3), (NSError **)a6);
  [v10 setPipelineLibrary:self];
  if (!v10) {
    return 0;
  }
  v11 = (void *)[(MTLDevice *)self->_device newRenderPipelineStateWithDescriptor:v10 options:a4 reflection:a5 error:a6];

  return v11;
}

- (void)setDisableRunTimeCompilation:(BOOL)a3
{
  BOOL v3 = a3;
  self->_disableRunTimeCompilation = a3;
  objc_msgSend(*((id *)self->_pipelineLibraryData + 2), "setDisableRunTimeCompilation:");
  v5 = (void *)*((void *)self->_pipelineLibraryData + 3);

  [v5 setDisableRunTimeCompilation:v3];
}

- (id)newComputePipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  v10 = MTLPipelineDescriptions::newComputePipelineDescriptor(*(MTLPipelineDescriptions **)self->_pipelineLibraryData, (char *)[a3 UTF8String], *((_MTLPipelineCache **)self->_pipelineLibraryData + 3), (NSError **)a6);
  [v10 setPipelineLibrary:self];
  if (!v10) {
    return 0;
  }
  v11 = (void *)[(MTLDevice *)self->_device newComputePipelineStateWithDescriptor:v10 options:a4 reflection:a5 error:a6];

  return v11;
}

- (id)newComputePipelineDescriptorWithName:(id)a3 error:(id *)a4
{
  pipelineLibraryData = self->_pipelineLibraryData;
  v6 = (char *)[a3 UTF8String];
  v7 = *(MTLPipelineDescriptions **)pipelineLibraryData;
  objc_super v8 = (_MTLPipelineCache *)*((void *)pipelineLibraryData + 3);

  return MTLPipelineDescriptions::newComputePipelineDescriptor(v7, v6, v8, (NSError **)a4);
}

- (id)newRenderPipelineDescriptorWithName:(id)a3 error:(id *)a4
{
  pipelineLibraryData = self->_pipelineLibraryData;
  v6 = (char *)[a3 UTF8String];
  v7 = *(MTLPipelineDescriptions **)pipelineLibraryData;
  objc_super v8 = (_MTLPipelineCache *)*((void *)pipelineLibraryData + 3);

  return MTLPipelineDescriptions::newRenderPipelineDescriptor(v7, v6, v8, (NSError **)a4);
}

- (NSArray)metallibPaths
{
  MTLPipelineDescriptions::libraryPaths(*(MTLPipelineDescriptions **)self->_pipelineLibraryData, &v10);
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  BOOL v3 = (NSArray *)(id)[v2 initWithCapacity:0xAAAAAAAAAAAAAAABLL * ((v11 - v10) >> 3)];
  uint64_t v4 = v10;
  for (uint64_t i = v11; v4 != i; v4 += 24)
  {
    id v6 = [NSString alloc];
    uint64_t v7 = v4;
    if (*(char *)(v4 + 23) < 0) {
      uint64_t v7 = *(void *)v4;
    }
    objc_super v8 = (void *)[v6 initWithUTF8String:v7];
    [(NSArray *)v3 addObject:v8];
  }
  v12 = (void **)&v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v12);
  return v3;
}

- (MTLDevice)device
{
  return self->_device;
}

- (NSArray)pipelineNames
{
  return self->_pipelineNames;
}

@end