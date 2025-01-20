@interface MTLComputePipelineReflectionInternal
- ($CC87CEEC7FB96912C0F1D2377F1A8E9C)usageFlags;
- (MTLComputePipelineReflectionInternal)initWithSerializedData:(id)a3 device:(id)a4 options:(unint64_t)a5 flags:(id)a6;
- (MTLComputePipelineReflectionInternal)initWithSerializedData:(id)a3 dynamicLibraries:(id)a4 serializedStageInputDescriptor:(id)a5 device:(id)a6 options:(unint64_t)a7 flags:(id)a8;
- (MTLComputePipelineReflectionInternal)initWithSerializedData:(id)a3 serializedStageInputDescriptor:(id)a4 device:(id)a5 options:(unint64_t)a6 flags:(id)a7;
- (id)arguments;
- (id)bindings;
- (id)builtInArguments;
- (id)constantSamplerDescriptors;
- (id)constantSamplerUniqueIdentifiers;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)performanceStatistics;
- (id)pluginReturnData;
- (unsigned)traceBufferIndex;
- (void)dealloc;
- (void)setConstantSamplerDescriptorsFromBitmasks:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setConstantSamplerDescriptorsFromBitmasks:(unint64_t *)a3 stride:(unsigned int)a4 count:(unint64_t)a5;
- (void)setConstantSamplerUniqueIdentifiers:(id)a3;
- (void)setPerformanceStatistics:(id)a3;
@end

@implementation MTLComputePipelineReflectionInternal

- (MTLComputePipelineReflectionInternal)initWithSerializedData:(id)a3 dynamicLibraries:(id)a4 serializedStageInputDescriptor:(id)a5 device:(id)a6 options:(unint64_t)a7 flags:(id)a8
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)MTLComputePipelineReflectionInternal;
  *((void *)[(MTLComputePipelineReflectionInternal *)&v12 init] + 4) = *(void *)&a8;
  v10 = MTLNewReflectionData(a3);
  MTLNewReflectionPluginData(a3);
  ReflectionValidator<MTLVertexReflectionReader>::Validate();
  ReflectionReaderFactory<MTLComputeReflectionReader>::Create(a7, v10);
}

- (id)bindings
{
  if (self[1].super.super.isa) {
    return self[1].super.super.isa;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (MTLComputePipelineReflectionInternal)initWithSerializedData:(id)a3 serializedStageInputDescriptor:(id)a4 device:(id)a5 options:(unint64_t)a6 flags:(id)a7
{
  return [(MTLComputePipelineReflectionInternal *)self initWithSerializedData:a3 dynamicLibraries:0 serializedStageInputDescriptor:a4 device:a5 options:a6 flags:*(void *)&a7];
}

- (MTLComputePipelineReflectionInternal)initWithSerializedData:(id)a3 device:(id)a4 options:(unint64_t)a5 flags:(id)a6
{
  return [(MTLComputePipelineReflectionInternal *)self initWithSerializedData:a3 dynamicLibraries:0 serializedStageInputDescriptor:0 device:a4 options:a5 flags:*(void *)&a6];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLComputePipelineReflectionInternal;
  [(MTLComputePipelineReflectionInternal *)&v3 dealloc];
}

- (id)performanceStatistics
{
  return self->_performanceStatistics;
}

- (void)setPerformanceStatistics:(id)a3
{
  id v5 = a3;

  self->_performanceStatistics = (NSDictionary *)a3;
}

- ($CC87CEEC7FB96912C0F1D2377F1A8E9C)usageFlags
{
  return ($CC87CEEC7FB96912C0F1D2377F1A8E9C)*(void *)&self->_flags;
}

- (unsigned)traceBufferIndex
{
  return self->_pluginReturnData;
}

- (id)pluginReturnData
{
  return self->_constantSamplerUniqueIdentifiers;
}

- (id)constantSamplerUniqueIdentifiers
{
  return self->_constantSamplerDescriptors;
}

- (id)constantSamplerDescriptors
{
  return self->_bindings;
}

- (void)setConstantSamplerUniqueIdentifiers:(id)a3
{
  constantSamplerDescriptors = self->_constantSamplerDescriptors;
  if (constantSamplerDescriptors != a3)
  {

    self->_constantSamplerDescriptors = (NSArray *)a3;
  }
}

- (void)setConstantSamplerDescriptorsFromBitmasks:(unint64_t *)a3 count:(unint64_t)a4
{
  self->_bindings = (NSArray *)_MTLCreateConstantSamplerDescriptorsFromBitmasks(a4, a3);
}

- (void)setConstantSamplerDescriptorsFromBitmasks:(unint64_t *)a3 stride:(unsigned int)a4 count:(unint64_t)a5
{
  self->_bindings = (NSArray *)_MTLCreateConstantSamplerDescriptorsFromBitmasksStrided(a5, a4, a3);
}

- (id)arguments
{
  return self->_arguments;
}

- (id)builtInArguments
{
  return self->_builtInArguments;
}

- (id)formattedDescription:(unint64_t)a3
{
  v27[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  unint64_t v6 = a3 + 8;
  uint64_t v7 = [@"\n" stringByPaddingToLength:v6 withString:@" " startingAtIndex:0];
  v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:128];
  v27[0] = v5;
  v27[1] = @"Compute Bindings =";
  v27[2] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[objc_class count](self[1].super.super.isa, "count"));
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v27, 3));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v18 = self;
  Class obj = self[1].super.super.isa;
  uint64_t v9 = [(objc_class *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int v15 = [v14 isArgument];
        v16 = @"Global";
        if (v15) {
          v16 = @"Argument";
        }
        v25[0] = v7;
        v25[1] = [NSString stringWithFormat:@"%@ %u:", v16, v11 + i];
        v25[2] = [v14 formattedDescription:v6];
        objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v25, 3));
      }
      uint64_t v10 = [(objc_class *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      uint64_t v11 = (v11 + i);
    }
    while (v10);
  }
  v20.receiver = v18;
  v20.super_class = (Class)MTLComputePipelineReflectionInternal;
  return (id)[NSString stringWithFormat:@"%@%@", -[MTLComputePipelineReflectionInternal description](&v20, sel_description), objc_msgSend(v8, "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLComputePipelineReflectionInternal *)self formattedDescription:0];
}

@end