@interface MTLRenderPipelineReflectionInternal
- ($A51142D07271D8AEC4984BC318786978)usageFlags;
- (MTLRenderPipelineReflectionInternal)initWithObjectData:(id)a3 meshData:(id)a4 fragmentData:(id)a5 device:(id)a6 options:(unint64_t)a7 flags:(id)a8;
- (MTLRenderPipelineReflectionInternal)initWithObjectData:(id)a3 objectDynamicLibraries:(id)a4 meshData:(id)a5 meshDynamicLibraries:(id)a6 fragmentData:(id)a7 fragmentDynamicLibraries:(id)a8 device:(id)a9 options:(unint64_t)a10 flags:(id)a11;
- (MTLRenderPipelineReflectionInternal)initWithTileData:(id)a3 functionType:(unint64_t)a4 device:(id)a5 options:(unint64_t)a6 flags:(id)a7;
- (MTLRenderPipelineReflectionInternal)initWithTileData:(id)a3 tileDynamicLibraries:(id)a4 functionType:(unint64_t)a5 device:(id)a6 options:(unint64_t)a7 flags:(id)a8;
- (MTLRenderPipelineReflectionInternal)initWithVertexData:(id)a3 fragmentData:(id)a4 serializedVertexDescriptor:(id)a5 device:(id)a6 options:(unint64_t)a7 flags:(id)a8;
- (MTLRenderPipelineReflectionInternal)initWithVertexData:(id)a3 vertexDynamicLibraries:(id)a4 fragmentData:(id)a5 fragmentDynamicLibraries:(id)a6 serializedVertexDescriptor:(id)a7 device:(id)a8 options:(unint64_t)a9 flags:(id)a10;
- (id)constantSamplerDescriptors;
- (id)constantSamplerUniqueIdentifiers;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)fragmentArguments;
- (id)fragmentBindings;
- (id)fragmentPluginReturnData;
- (id)imageBlockDataReturn;
- (id)initWithTileData:(void *)a1 device:(NSObject *)a2 options:(uint64_t)a3 flags:(uint64_t)a4;
- (id)meshArguments;
- (id)meshBindings;
- (id)meshBuiltInArguments;
- (id)meshPluginReturnData;
- (id)objectArguments;
- (id)objectBindings;
- (id)objectBuiltInArguments;
- (id)objectPluginReturnData;
- (id)performanceStatistics;
- (id)postVertexDumpOutputs;
- (id)tileArguments;
- (id)tileBindings;
- (id)vertexArguments;
- (id)vertexBindings;
- (id)vertexBuiltInArguments;
- (id)vertexPluginReturnData;
- (unint64_t)postVertexDumpStride;
- (unsigned)traceBufferIndex;
- (void)dealloc;
- (void)initWithFragmentReader:(uint64_t)a3 dylibReaders:(unsigned int)a4 dylibReaderCount:(int)a5 dylibGlobalBindingCount:(void *)a6 device:(uint64_t)a7 flags:;
- (void)initWithFragmentReader:(void *)a3 device:(uint64_t)a4 flags:;
- (void)initWithReader:(uint64_t)a3 dylibReaders:(unsigned int)a4 dylibReaderCount:(int)a5 dylibGlobalBindingCount:(void *)a6 device:(uint64_t)a7 flags:;
- (void)initWithReader:(void *)a3 device:(uint64_t)a4 flags:;
- (void)setConstantSamplerDescriptorsFromBitmasks:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setConstantSamplerDescriptorsFromBitmasks:(unint64_t *)a3 stride:(unsigned int)a4 count:(unint64_t)a5;
- (void)setConstantSamplerUniqueIdentifiers:(id)a3;
- (void)setPerformanceStatistics:(id)a3;
@end

@implementation MTLRenderPipelineReflectionInternal

- (MTLRenderPipelineReflectionInternal)initWithVertexData:(id)a3 vertexDynamicLibraries:(id)a4 fragmentData:(id)a5 fragmentDynamicLibraries:(id)a6 serializedVertexDescriptor:(id)a7 device:(id)a8 options:(unint64_t)a9 flags:(id)a10
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)MTLRenderPipelineReflectionInternal;
  v11 = [(MTLRenderPipelineReflectionInternal *)&v14 init];
  v11->_printStyle = 3;
  *(void *)&v11->_flags = *(void *)&a10;
  ReflectionValidator<MTLVertexReflectionReader>::Validate();
  v12 = MTLNewReflectionData(a3);
  MTLNewReflectionPluginData(a3);
  ReflectionReaderFactory<MTLVertexReflectionReader>::Create(a9, v12);
}

- (id)vertexArguments
{
  return self->_vertexArguments;
}

- (id)fragmentArguments
{
  return self->_fragmentArguments;
}

- (id)fragmentBindings
{
  if (self->_fragmentBindings) {
    return self->_fragmentBindings;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (id)vertexBindings
{
  if (self->_vertexBindings) {
    return self->_vertexBindings;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLRenderPipelineReflectionInternal;
  [(MTLRenderPipelineReflectionInternal *)&v3 dealloc];
}

- (MTLRenderPipelineReflectionInternal)initWithVertexData:(id)a3 fragmentData:(id)a4 serializedVertexDescriptor:(id)a5 device:(id)a6 options:(unint64_t)a7 flags:(id)a8
{
  return [(MTLRenderPipelineReflectionInternal *)self initWithVertexData:a3 vertexDynamicLibraries:0 fragmentData:a4 fragmentDynamicLibraries:0 serializedVertexDescriptor:a5 device:a6 options:a7 flags:*(void *)&a8];
}

- (void)initWithReader:(void *)a3 device:(uint64_t)a4 flags:
{
  if (result) {
    return -[MTLRenderPipelineReflectionInternal initWithReader:dylibReaders:dylibReaderCount:dylibGlobalBindingCount:device:flags:](result, a2, 0, 0, 0, a3, a4);
  }
  return result;
}

- (void)initWithReader:(uint64_t)a3 dylibReaders:(unsigned int)a4 dylibReaderCount:(int)a5 dylibGlobalBindingCount:(void *)a6 device:(uint64_t)a7 flags:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v45.receiver = a1;
  v45.super_class = (Class)MTLRenderPipelineReflectionInternal;
  v13 = objc_msgSendSuper2(&v45, sel_init);
  objc_super v14 = v13;
  if (v13)
  {
    v13[1] = a7;
    v13[27] = 4;
    uint64_t v15 = *(void *)(a2 + 8);
    *((_DWORD *)v13 + 22) = *(_DWORD *)(v15 + 40);
    int v16 = *(_DWORD *)(v15 + 16);
    uint64_t v38 = *(unsigned int *)(v15 + 36);
    uint64_t v40 = (v16 - v38);
    uint64_t v39 = *(void *)(v15 + 8);
    v17 = *(uint64_t **)(v15 + 24);
    if (v16 || *((_DWORD *)v13 + 22) != -1)
    {
      v13[7] = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:v39 count:v40];
      unsigned int v18 = *((_DWORD *)v14 + 22);
      if (v18 != -1)
      {
        TraceBufferBinding = CreateTraceBufferBinding(v18);
        [(id)v14[7] addObject:TraceBufferBinding];
      }
    }
    uint64_t v20 = *(unsigned int *)(*(void *)(a2 + 8) + 32);
    int v21 = [(id)v14[7] count];
    int v22 = v20 + a5;
    uint64_t v23 = (v20 + a5 + v21);
    if (v22 + v21)
    {
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v23];
      [v24 addObjectsFromArray:v14[7]];
      if (v20)
      {
        do
        {
          uint64_t v25 = *v17++;
          [v24 addObject:v25];
          --v20;
        }
        while (v20);
      }
      if (a4)
      {
        uint64_t v26 = 0;
        uint64_t v27 = a4;
        do
        {
          uint64_t v28 = *(void *)(a3 + 8 * v26);
          if (v28)
          {
            uint64_t v29 = *(unsigned int *)(*(void *)(v28 + 8) + 32);
            if (v29)
            {
              uint64_t v30 = 0;
              uint64_t v31 = 8 * v29;
              do
              {
                uint64_t v32 = *(void *)(*(void *)(*(void *)(v28 + 8) + 24) + v30);
                if (([v24 containsObject:v32] & 1) == 0) {
                  [v24 addObject:v32];
                }
                v30 += 8;
              }
              while (v31 != v30);
            }
          }
          ++v26;
        }
        while (v26 != v27);
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v33 = [v24 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v42 != v35) {
              objc_enumerationMutation(v24);
            }
            _MTLFixIABReflectionOffsets(*(void **)(*((void *)&v41 + 1) + 8 * i), a6);
          }
          uint64_t v34 = [v24 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v34);
      }
      v14[24] = v24;
    }
    if (v38) {
      v14[8] = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v39 + 8 * v40 count:v38];
    }
  }
  return v14;
}

- (void)initWithFragmentReader:(void *)a3 device:(uint64_t)a4 flags:
{
  if (result) {
    return -[MTLRenderPipelineReflectionInternal initWithFragmentReader:dylibReaders:dylibReaderCount:dylibGlobalBindingCount:device:flags:](result, a2, 0, 0, 0, a3, a4);
  }
  return result;
}

- (void)initWithFragmentReader:(uint64_t)a3 dylibReaders:(unsigned int)a4 dylibReaderCount:(int)a5 dylibGlobalBindingCount:(void *)a6 device:(uint64_t)a7 flags:
{
  if (!a1) {
    return 0;
  }
  v8 = -[MTLRenderPipelineReflectionInternal initWithReader:dylibReaders:dylibReaderCount:dylibGlobalBindingCount:device:flags:](a1, a2, a3, a4, a5, a6, a7);
  v9 = v8;
  if (v8)
  {
    v8[27] = 4;
    uint64_t v10 = *(void *)(a2 + 16);
    if (*(unsigned char *)(v10 + 120)) {
      v8[9] = *(id *)(v10 + 112);
    }
  }
  return v9;
}

- (id)initWithTileData:(void *)a1 device:(NSObject *)a2 options:(uint64_t)a3 flags:(uint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)MTLRenderPipelineReflectionInternal;
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  if (v6)
  {
    MTLArgumentDeserializer::MTLArgumentDeserializer((MTLArgumentDeserializer *)&v9, a4);
    v9 = &unk_1ECAC6978;
    int v10 = 0;
    int v11 = 0;
    uint64_t v12 = 0;
    int v13 = 0;
    objc_super v14 = "stageInBuffer";
    ReflectionReaderFactory<MTLComputeReflectionReader>::Create(a4, a2);
  }
  return v6;
}

- (MTLRenderPipelineReflectionInternal)initWithTileData:(id)a3 functionType:(unint64_t)a4 device:(id)a5 options:(unint64_t)a6 flags:(id)a7
{
  return [(MTLRenderPipelineReflectionInternal *)self initWithTileData:a3 tileDynamicLibraries:0 functionType:a4 device:a5 options:a6 flags:*(void *)&a7];
}

- (MTLRenderPipelineReflectionInternal)initWithTileData:(id)a3 tileDynamicLibraries:(id)a4 functionType:(unint64_t)a5 device:(id)a6 options:(unint64_t)a7 flags:(id)a8
{
  v17.receiver = self;
  v17.super_class = (Class)MTLRenderPipelineReflectionInternal;
  if ([(MTLRenderPipelineReflectionInternal *)&v17 init])
  {
    memset(v16, 0, sizeof(v16));
    if (a4)
    {
      uint64_t v15 = 0;
      std::vector<MTLRasterizationRateLayerDescriptor *>::resize((uint64_t)v16, [a4 count], &v15);
      readDynamicLibraryReflectionData((uint64_t)a6, v16[0], a4, a7);
    }
    int v13 = MTLNewReflectionData(a3);
    if (a5 != 2)
    {
      if (a5 == 3)
      {
        ReflectionValidator<MTLVertexReflectionReader>::Validate();
        ReflectionReaderFactory<MTLComputeReflectionReader>::Create(a7, v13);
      }
      abort();
    }
    ReflectionValidator<MTLVertexReflectionReader>::Validate();
    ReflectionReaderFactory<MTLFragmentReflectionReader>::Create(a7, v13);
  }
  return 0;
}

- (MTLRenderPipelineReflectionInternal)initWithObjectData:(id)a3 meshData:(id)a4 fragmentData:(id)a5 device:(id)a6 options:(unint64_t)a7 flags:(id)a8
{
  return [(MTLRenderPipelineReflectionInternal *)self initWithObjectData:a3 objectDynamicLibraries:0 meshData:a4 meshDynamicLibraries:0 fragmentData:a5 fragmentDynamicLibraries:0 device:a6 options:a7 flags:*(void *)&a8];
}

- (MTLRenderPipelineReflectionInternal)initWithObjectData:(id)a3 objectDynamicLibraries:(id)a4 meshData:(id)a5 meshDynamicLibraries:(id)a6 fragmentData:(id)a7 fragmentDynamicLibraries:(id)a8 device:(id)a9 options:(unint64_t)a10 flags:(id)a11
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)MTLRenderPipelineReflectionInternal;
  uint64_t v12 = [(MTLRenderPipelineReflectionInternal *)&v15 init];
  *(void *)&v12->_flags = *(void *)&a11;
  v12->_printStyle = 26;
  if ((a10 & 0x200000000) != 0) {
    object = MTLNewEmulationReflectionData(a3);
  }
  else {
    object = MTLNewReflectionData(a3);
  }
  MTLNewReflectionPluginData(a3);
  ReflectionReaderFactory<MTLObjectReflectionReader>::Create(a10, object);
}

- (void)setPerformanceStatistics:(id)a3
{
  id v5 = a3;

  self->_performanceStatistics = (NSDictionary *)a3;
}

- (id)performanceStatistics
{
  return self->_performanceStatistics;
}

- (unsigned)traceBufferIndex
{
  return self->_traceBufferIndex;
}

- (id)vertexPluginReturnData
{
  return self->_vertexPluginReturnData;
}

- (id)fragmentPluginReturnData
{
  return self->_fragmentPluginReturnData;
}

- (id)constantSamplerUniqueIdentifiers
{
  return self->_constantSamplerUniqueIdentifiers;
}

- (id)constantSamplerDescriptors
{
  return self->_constantSamplerDescriptors;
}

- (void)setConstantSamplerUniqueIdentifiers:(id)a3
{
  constantSamplerUniqueIdentifiers = self->_constantSamplerUniqueIdentifiers;
  if (constantSamplerUniqueIdentifiers != a3)
  {

    self->_constantSamplerUniqueIdentifiers = (NSArray *)a3;
  }
}

- (void)setConstantSamplerDescriptorsFromBitmasks:(unint64_t *)a3 count:(unint64_t)a4
{
  self->_constantSamplerDescriptors = (NSArray *)_MTLCreateConstantSamplerDescriptorsFromBitmasks(a4, a3);
}

- (void)setConstantSamplerDescriptorsFromBitmasks:(unint64_t *)a3 stride:(unsigned int)a4 count:(unint64_t)a5
{
  self->_constantSamplerDescriptors = (NSArray *)_MTLCreateConstantSamplerDescriptorsFromBitmasksStrided(a5, a4, a3);
}

- ($A51142D07271D8AEC4984BC318786978)usageFlags
{
  return ($A51142D07271D8AEC4984BC318786978)*(void *)&self->_flags;
}

- (id)vertexBuiltInArguments
{
  return self->_vertexBuiltInArguments;
}

- (unint64_t)postVertexDumpStride
{
  return self->_postVertexDumpStride;
}

- (id)postVertexDumpOutputs
{
  return self->_postVertexDumpOutputs;
}

- (id)tileArguments
{
  return self->_tileArguments;
}

- (id)imageBlockDataReturn
{
  return self->_imageBlockDataReturn;
}

- (id)objectArguments
{
  return self->_objectArguments;
}

- (id)meshArguments
{
  return self->_meshArguments;
}

- (id)objectBuiltInArguments
{
  return self->_objectBuiltInArguments;
}

- (id)meshBuiltInArguments
{
  return self->_meshBuiltInArguments;
}

- (id)objectPluginReturnData
{
  return self->_objectPluginReturnData;
}

- (id)meshPluginReturnData
{
  return self->_meshPluginReturnData;
}

- (id)tileBindings
{
  if (self->_tileBindings) {
    return self->_tileBindings;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (id)objectBindings
{
  if (self->_objectBindings) {
    return self->_objectBindings;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (id)meshBindings
{
  if (self->_meshBindings) {
    return self->_meshBindings;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (id)formattedDescription:(unint64_t)a3
{
  v96[2] = *MEMORY[0x1E4F143B8];
  uint64_t v49 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  unint64_t v5 = a3 + 8;
  uint64_t v6 = [@"\n" stringByPaddingToLength:v5 withString:@" " startingAtIndex:0];
  v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:128];
  v50 = self;
  if ((self->_printStyle & 8) != 0)
  {
    v96[0] = v49;
    v96[1] = @"Object Bindings:";
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v96, 2));
    v95[0] = v6;
    v95[1] = @"bindingsCount =";
    v95[2] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_objectBindings, "count"));
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v95, 3));
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    obuint64_t j = self->_objectBindings;
    uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v73 objects:v94 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v74 != v11) {
            objc_enumerationMutation(obj);
          }
          int v13 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          int v14 = [v13 isArgument];
          objc_super v15 = @"Global";
          if (v14) {
            objc_super v15 = @"Argument";
          }
          v93[0] = v6;
          v93[1] = [NSString stringWithFormat:@"%@ %u:", v15, v10 + i];
          v93[2] = [v13 formattedDescription:v5];
          objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v93, 3));
        }
        uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v73 objects:v94 count:16];
        uint64_t v10 = (v10 + i);
      }
      while (v9);
    }
  }
  if ((v50->_printStyle & 0x10) != 0)
  {
    v92[0] = v49;
    v92[1] = @"Mesh Bindings:";
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v92, 2));
    v91[0] = v6;
    v91[1] = @"bindingsCount =";
    v91[2] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](v50->_meshBindings, "count"));
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v91, 3));
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    obja = v50->_meshBindings;
    uint64_t v16 = [(NSArray *)obja countByEnumeratingWithState:&v69 objects:v90 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v70;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v70 != v19) {
            objc_enumerationMutation(obja);
          }
          int v21 = *(void **)(*((void *)&v69 + 1) + 8 * j);
          int v22 = [v21 isArgument];
          uint64_t v23 = @"Global";
          if (v22) {
            uint64_t v23 = @"Argument";
          }
          v89[0] = v6;
          v89[1] = [NSString stringWithFormat:@"%@ %u:", v23, v18 + j];
          v89[2] = [v21 formattedDescription:v5];
          objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v89, 3));
        }
        uint64_t v17 = [(NSArray *)obja countByEnumeratingWithState:&v69 objects:v90 count:16];
        uint64_t v18 = (v18 + j);
      }
      while (v17);
    }
  }
  if (v50->_printStyle)
  {
    v88[0] = v49;
    v88[1] = @"Vertex Bindings:";
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v88, 2));
    v87[0] = v6;
    v87[1] = @"bindingsCount =";
    v87[2] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](v50->_vertexBindings, "count"));
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v87, 3));
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    objb = v50->_vertexBindings;
    uint64_t v24 = [(NSArray *)objb countByEnumeratingWithState:&v65 objects:v86 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = 0;
      uint64_t v27 = *(void *)v66;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v66 != v27) {
            objc_enumerationMutation(objb);
          }
          uint64_t v29 = *(void **)(*((void *)&v65 + 1) + 8 * k);
          int v30 = [v29 isArgument];
          uint64_t v31 = @"Global";
          if (v30) {
            uint64_t v31 = @"Argument";
          }
          v85[0] = v6;
          v85[1] = [NSString stringWithFormat:@"%@ %u:", v31, v26 + k];
          v85[2] = [v29 formattedDescription:v5];
          objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v85, 3));
        }
        uint64_t v25 = [(NSArray *)objb countByEnumeratingWithState:&v65 objects:v86 count:16];
        uint64_t v26 = (v26 + k);
      }
      while (v25);
    }
  }
  if ((v50->_printStyle & 2) != 0)
  {
    v84[0] = v49;
    v84[1] = @"Fragment Bindings:";
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v84, 2));
    v83[0] = v6;
    v83[1] = @"bindingsCount =";
    v83[2] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](v50->_fragmentBindings, "count"));
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v83, 3));
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    objc = v50->_fragmentBindings;
    uint64_t v32 = [(NSArray *)objc countByEnumeratingWithState:&v61 objects:v82 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = 0;
      uint64_t v35 = *(void *)v62;
      do
      {
        for (uint64_t m = 0; m != v33; ++m)
        {
          if (*(void *)v62 != v35) {
            objc_enumerationMutation(objc);
          }
          v37 = *(void **)(*((void *)&v61 + 1) + 8 * m);
          int v38 = [v37 isArgument];
          uint64_t v39 = @"Global";
          if (v38) {
            uint64_t v39 = @"Argument";
          }
          v81[0] = v6;
          v81[1] = [NSString stringWithFormat:@"%@ %u:", v39, v34 + m];
          v81[2] = [v37 formattedDescription:v5];
          objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v81, 3));
        }
        uint64_t v33 = [(NSArray *)objc countByEnumeratingWithState:&v61 objects:v82 count:16];
        uint64_t v34 = (v34 + m);
      }
      while (v33);
    }
  }
  if ((v50->_printStyle & 4) != 0)
  {
    v80[0] = v49;
    v80[1] = @"Tile Bindings:";
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v80, 2));
    v79[0] = v6;
    v79[1] = @"bindingsCount =";
    v79[2] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](v50->_tileBindings, "count"));
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v79, 3));
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    objd = v50->_tileBindings;
    uint64_t v40 = [(NSArray *)objd countByEnumeratingWithState:&v57 objects:v78 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = 0;
      uint64_t v43 = *(void *)v58;
      do
      {
        for (uint64_t n = 0; n != v41; ++n)
        {
          if (*(void *)v58 != v43) {
            objc_enumerationMutation(objd);
          }
          objc_super v45 = *(void **)(*((void *)&v57 + 1) + 8 * n);
          int v46 = [v45 isArgument];
          uint64_t v47 = @"Global";
          if (v46) {
            uint64_t v47 = @"Argument";
          }
          v77[0] = v6;
          v77[1] = [NSString stringWithFormat:@"%@ %u:", v47, v42 + n];
          v77[2] = [v45 formattedDescription:v5];
          objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v77, 3));
        }
        uint64_t v41 = [(NSArray *)objd countByEnumeratingWithState:&v57 objects:v78 count:16];
        uint64_t v42 = (v42 + n);
      }
      while (v41);
    }
  }
  v56.receiver = v50;
  v56.super_class = (Class)MTLRenderPipelineReflectionInternal;
  return (id)[NSString stringWithFormat:@"%@%@", -[MTLRenderPipelineReflectionInternal description](&v56, sel_description), objc_msgSend(v7, "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLRenderPipelineReflectionInternal *)self formattedDescription:0];
}

@end