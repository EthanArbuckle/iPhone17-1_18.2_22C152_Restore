@interface MTLFunctionReflectionInternal
- (MTLFunctionReflectionInternal)initWithArguments:(id *)a3 argumentCount:(unsigned int)a4 builtInArgumentCount:(unsigned int)a5 pluginReturnData:(id)a6 primitiveKind:(unint64_t)a7 tags:(id *)a8 tagCount:(unsigned int)a9;
- (MTLFunctionReflectionInternal)initWithDevice:(id)a3 reflectionData:(id)a4 functionType:(unint64_t)a5 options:(unint64_t)a6;
- (id)arguments;
- (id)bindings;
- (id)builtInArguments;
- (id)pluginReturnData;
- (id)tags;
- (unint64_t)primitiveKind;
- (void)dealloc;
@end

@implementation MTLFunctionReflectionInternal

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLFunctionReflectionInternal;
  [(MTLFunctionReflectionInternal *)&v3 dealloc];
}

- (id)arguments
{
  return self->_arguments;
}

- (MTLFunctionReflectionInternal)initWithDevice:(id)a3 reflectionData:(id)a4 functionType:(unint64_t)a5 options:(unint64_t)a6
{
  if ((a6 & 0x200008000) != 0) {
    dispatch_data_t v9 = MTLNewEmulationReflectionData(a4);
  }
  else {
    dispatch_data_t v9 = MTLNewReflectionData(a4);
  }
  v10 = v9;
  MTLNewReflectionPluginData(a4);
  v11 = (void *)MEMORY[0x18530C9F0]();
  switch(a5)
  {
    case 1uLL:
      ReflectionValidator<MTLVertexReflectionReader>::Validate();
      ReflectionReaderFactory<MTLVertexReflectionReader>::Create(a6, v10);
    case 2uLL:
      ReflectionValidator<MTLVertexReflectionReader>::Validate();
      ReflectionReaderFactory<MTLFragmentReflectionReader>::Create(a6, v10);
    case 3uLL:
      ReflectionValidator<MTLVertexReflectionReader>::Validate();
      ReflectionReaderFactory<MTLComputeReflectionReader>::Create(a6, v10);
    case 6uLL:
      ReflectionValidator<MTLVertexReflectionReader>::Validate();
      ReflectionReaderFactory<MTLIntersectionReflectionReader>::Create(a6, v10);
    case 7uLL:
      ReflectionValidator<MTLVertexReflectionReader>::Validate();
      ReflectionReaderFactory<MTLMeshReflectionReader>::Create(a6, v10);
    case 8uLL:
      ReflectionValidator<MTLVertexReflectionReader>::Validate();
      ReflectionReaderFactory<MTLObjectReflectionReader>::Create(a6, v10);
    default:
      return 0;
  }
}

- (MTLFunctionReflectionInternal)initWithArguments:(id *)a3 argumentCount:(unsigned int)a4 builtInArgumentCount:(unsigned int)a5 pluginReturnData:(id)a6 primitiveKind:(unint64_t)a7 tags:(id *)a8 tagCount:(unsigned int)a9
{
  v21.receiver = self;
  v21.super_class = (Class)MTLFunctionReflectionInternal;
  v15 = [(MTLFunctionReflectionInternal *)&v21 init];
  if (v15)
  {
    if (a4) {
      uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:a3 count:a4 - a5];
    }
    else {
      uint64_t v16 = 0;
    }
    v15->_arguments = (NSArray *)v16;
    if (a5) {
      uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&a3[a4] - a5 count:a5];
    }
    else {
      uint64_t v17 = 0;
    }
    v15->_builtInArguments = (NSArray *)v17;
    if (a4) {
      v18 = v15->_arguments;
    }
    else {
      v18 = 0;
    }
    v15->_bindings = v18;
    v15->_pluginReturnData = (NSData *)a6;
    v15->_primitiveKind = a7;
    if (a9) {
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:a8 count:a9];
    }
    else {
      uint64_t v19 = 0;
    }
    v15->_tags = (NSArray *)v19;
  }
  return v15;
}

- (id)builtInArguments
{
  return self->_builtInArguments;
}

- (id)bindings
{
  return self->_bindings;
}

- (id)pluginReturnData
{
  return self->_pluginReturnData;
}

- (unint64_t)primitiveKind
{
  return self->_primitiveKind;
}

- (id)tags
{
  return self->_tags;
}

@end