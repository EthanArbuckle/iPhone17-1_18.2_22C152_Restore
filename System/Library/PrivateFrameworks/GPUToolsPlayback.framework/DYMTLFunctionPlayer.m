@interface DYMTLFunctionPlayer
+ (void)computeBytesKeyAtIndex:(unint64_t)a3;
+ (void)fragmentBytesKeyAtIndex:(unint64_t)a3;
+ (void)tileBytesKeyAtIndex:(unint64_t)a3;
+ (void)vertexBytesKeyAtIndex:(unint64_t)a3;
- (BOOL)_isCPUAccessibleStorageMode:(unint64_t)a3;
- (BOOL)_isDepthStencilFormat:(unint64_t)a3;
- (BOOL)isFrameBoundary;
- (DYMTLFunctionPlayer)initWithCaptureStore:(id)a3;
- (DYMTLIndirectArgumentBufferManager)indirectArgumentManager;
- (DYMTLIndirectCommandBufferManager)indirectCommandManager;
- (MTLDevice)device;
- (const)computeBytesForKey:(unint64_t)a3;
- (const)fragmentBytesForKey:(unint64_t)a3;
- (const)tileBytesForKey:(unint64_t)a3;
- (const)vertexBytesForKey:(unint64_t)a3;
- (id).cxx_construct;
- (id)_createPrivateBufferForFunctionWithDevice:(id)a3 bytes:(char *)a4 length:(unint64_t)a5 resourceOptions:(unint64_t)a6;
- (id)_getDeviceWithName:(id)a3;
- (id)commandQueue;
- (id)deviceForID:(unint64_t)a3 withDeviceName:(id)a4;
- (id)objectForKey:(unint64_t)a3;
- (unint64_t)keyForOriginalObject:(id)a3;
- (unint64_t)keyForOriginalObject:(id)a3 inverseObjectMap:(void *)a4;
- (void)_restoreTexture:(unint64_t)a3 commandBuffer:(unint64_t)a4 argumentOffset:(unint64_t)a5;
- (void)_saveBytes;
- (void)dealloc;
- (void)executeGraphicsFunction;
- (void)executePlatformFunction;
- (void)objectMap;
- (void)removeObjectForKey:(unint64_t)a3;
- (void)setDevice:(id)a3;
- (void)setIndirectArgumentManager:(id)a3;
- (void)setIndirectCommandManager:(id)a3;
- (void)setObject:(id)a3 forKey:(unint64_t)a4;
@end

@implementation DYMTLFunctionPlayer

- (id)commandQueue
{
  commandQueue = self->_commandQueue;
  if (!commandQueue)
  {
    v4 = [(DYMTLFunctionPlayer *)self device];
    v5 = (MTLCommandQueueSPI *)[v4 newCommandQueue];
    v6 = self->_commandQueue;
    self->_commandQueue = v5;

    commandQueue = self->_commandQueue;
  }
  return commandQueue;
}

- (DYMTLFunctionPlayer)initWithCaptureStore:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DYMTLFunctionPlayer;
  v5 = [(DYFunctionPlayer *)&v14 initWithCaptureStore:v4];
  v6 = v5;
  if (v5)
  {
    unint64_t v13 = 0;
    v15 = &v13;
    v7 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v5->_objectMap, &v13, (uint64_t)&std::piecewise_construct, &v15);
    v8 = (void *)v7[3];
    v7[3] = 0;

    std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&v6->_vertexBytesDataMap);
    std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&v6->_fragmentBytesDataMap);
    std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&v6->_tileBytesDataMap);
    std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&v6->_computeBytesDataMap);
    v9 = [[DYMTLIndirectArgumentBufferManager alloc] initWithFunctionPlayer:v6];
    [(DYMTLFunctionPlayer *)v6 setIndirectArgumentManager:v9];

    v10 = [[DYMTLIndirectCommandBufferManager alloc] initWithFunctionPlayer:v6];
    [(DYMTLFunctionPlayer *)v6 setIndirectCommandManager:v10];

    v11 = v6;
  }

  return v6;
}

- (void)dealloc
{
  [(MTLCommandQueueSPI *)self->_commandQueue finish];
  commandQueue = self->_commandQueue;
  self->_commandQueue = 0;

  std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&self->_vertexBytesDataMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&self->_fragmentBytesDataMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&self->_tileBytesDataMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&self->_computeBytesDataMap);
  v4.receiver = self;
  v4.super_class = (Class)DYMTLFunctionPlayer;
  [(DYFunctionPlayer *)&v4 dealloc];
}

- (id)_getDeviceWithName:(id)a3
{
  id v3 = MTLCreateSystemDefaultDevice();
  return v3;
}

- (id)deviceForID:(unint64_t)a3 withDeviceName:(id)a4
{
  unint64_t v18 = a3;
  id v5 = a4;
  p_objectMap = &self->_objectMap;
  v7 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_objectMap.__table_.__bucket_list_.__ptr_.__value_, &v18);
  if (v7)
  {
    id v8 = (id)v7[3];
  }
  else
  {
    v9 = [(DYMTLFunctionPlayer *)self device];

    if (v9)
    {
      id v8 = 0;
    }
    else
    {
      v10 = [(DYMTLFunctionPlayer *)self _getDeviceWithName:v5];
      [(DYMTLFunctionPlayer *)self setDevice:v10];
      unint64_t v16 = v18;
      id v11 = v10;
      id v17 = v11;
      v12 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,objc_object  {objcproto9MTLDevice}* {__strong}>>((uint64_t)p_objectMap, &v16, (uint64_t *)&v16);
      char v14 = v13;

      if (v14) {
        id v8 = (id)v12[3];
      }
      else {
        id v8 = 0;
      }
    }
  }

  return v8;
}

- (void)setObject:(id)a3 forKey:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v9 = a4;
  v10 = &v9;
  v7 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, &v9, (uint64_t)&std::piecewise_construct, &v10);
  id v8 = (void *)v7[3];
  v7[3] = v6;
}

- (id)objectForKey:(unint64_t)a3
{
  unint64_t v5 = a3;
  id v3 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_objectMap.__table_.__bucket_list_.__ptr_.__value_, &v5);
  if (v3) {
    id v3 = (void *)v3[3];
  }
  return v3;
}

- (void)removeObjectForKey:(unint64_t)a3
{
  unint64_t v3 = a3;
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__erase_unique<unsigned long long>(&self->_objectMap.__table_.__bucket_list_.__ptr_.__value_, &v3);
}

- (unint64_t)keyForOriginalObject:(id)a3
{
  id v4 = a3;
  p_p1 = &self->_objectMap.__table_.__p1_;
  while (1)
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, id>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, id>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1) {
      break;
    }
    unint64_t next = (unint64_t)p_p1[2].__value_.__next_;
    id v7 = p_p1[3].__value_.__next_;
    char v8 = [v7 isEqual:v4];

    if (v8) {
      goto LABEL_6;
    }
  }
  unint64_t next = 0;
LABEL_6:

  return next;
}

- (unint64_t)keyForOriginalObject:(id)a3 inverseObjectMap:(void *)a4
{
  id v6 = (unint64_t *)a3;
  id v11 = v6;
  id v7 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(a4, (unint64_t *)&v11);
  if (v7)
  {
    unint64_t v8 = v7[3];
  }
  else
  {
    unint64_t v8 = [(DYMTLFunctionPlayer *)self keyForOriginalObject:v6];
    v10 = v6;
    id v11 = (unint64_t *)&v10;
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)a4, (unint64_t *)&v10, (uint64_t)&std::piecewise_construct, &v11)[3] = v8;
  }

  return v8;
}

- (void)objectMap
{
  return &self->_objectMap;
}

- (const)vertexBytesForKey:(unint64_t)a3
{
  unint64_t v4 = a3;
  result = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_vertexBytesDataMap.__table_.__bucket_list_.__ptr_.__value_, &v4);
  if (result)
  {
    result = (const void *)*((void *)result + 3);
    if (result) {
      return (const void *)[ (id) (id) result bytes];
    }
  }
  return result;
}

- (const)fragmentBytesForKey:(unint64_t)a3
{
  unint64_t v4 = a3;
  result = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_fragmentBytesDataMap.__table_.__bucket_list_.__ptr_.__value_, &v4);
  if (result)
  {
    result = (const void *)*((void *)result + 3);
    if (result) {
      return (const void *)[ (id) (id) result bytes];
    }
  }
  return result;
}

- (const)tileBytesForKey:(unint64_t)a3
{
  unint64_t v4 = a3;
  result = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_tileBytesDataMap.__table_.__bucket_list_.__ptr_.__value_, &v4);
  if (result)
  {
    result = (const void *)*((void *)result + 3);
    if (result) {
      return (const void *)[ (id) (id) result bytes];
    }
  }
  return result;
}

- (const)computeBytesForKey:(unint64_t)a3
{
  unint64_t v4 = a3;
  result = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_computeBytesDataMap.__table_.__bucket_list_.__ptr_.__value_, &v4);
  if (result)
  {
    result = (const void *)*((void *)result + 3);
    if (result) {
      return (const void *)[ (id) (id) result bytes];
    }
  }
  return result;
}

- (BOOL)_isCPUAccessibleStorageMode:(unint64_t)a3
{
  return a3 == 0;
}

- (BOOL)_isDepthStencilFormat:(unint64_t)a3
{
  return a3 == 260;
}

- (void)_restoreTexture:(unint64_t)a3 commandBuffer:(unint64_t)a4 argumentOffset:(unint64_t)a5
{
  id v6 = [(DYMTLFunctionPlayer *)self device];
  id v7 = [(DYMTLFunctionPlayer *)self commandQueue];
  v46 = (unint64_t *)(*(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x263F3F9A8]) + 16);
  id v8 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, v46, (uint64_t)&std::piecewise_construct, &v46)[3];
  unint64_t v9 = (char *)self + (int)*MEMORY[0x263F3F970];
  uint64_t v10 = **((void **)v9 + 3);
  id v11 = (GPUTools::MTL **)*((void *)v9 + 1);
  uint64_t v12 = **((void **)v9 + 2);
  memset(v57, 0, 48);
  GPUTools::MTL::MakeMTLRegion(*v11, (uint64_t)v57);
  uint64_t Data = DYHarvesterGetData();
  unint64_t v31 = **((void **)v9 + 5);
  uint64_t v32 = v10;
  unint64_t v30 = **((void **)v9 + 6);
  [v8 pixelFormat];
  MTLPixelFormatGetInfoForDevice();
  unint64_t v14 = (unsigned __int16)v47 & 0x2000;
  if (-[DYMTLFunctionPlayer _isCPUAccessibleStorageMode:](self, "_isCPUAccessibleStorageMode:", [v8 storageMode]))
  {
    char v15 = [v8 isDrawable];
    char v16 = v14 ? 1 : v15;
    if ((v16 & 1) == 0
      && !-[DYMTLFunctionPlayer _isDepthStencilFormat:](self, "_isDepthStencilFormat:", [v8 pixelFormat]))
    {
      v56[0] = v57[0];
      v56[1] = v57[1];
      v56[2] = v57[2];
      [v8 replaceRegion:v56 mipmapLevel:v12 slice:v32 withBytes:Data bytesPerRow:v31 bytesPerImage:v30];
      [(DYFunctionPlayer *)self releaseDataForArgument:4];
      goto LABEL_22;
    }
  }
  id v17 = [(DYMTLFunctionPlayer *)self commandQueue];
  AutoPerfStatSamplingControl::AutoPerfStatSamplingControl((uint64_t)v55, v17);

  unint64_t v18 = [v7 commandBuffer];
  uint64_t v28 = v12;
  DYHarvesterGetMetadata();
  unint64_t v27 = v14;
  uint64_t DataSize = DYHarvesterGetDataSize();
  v20 = (char *)self + (int)*MEMORY[0x263F3F978];
  if (*((void *)v20 + 12) != *((void *)v20 + 13))
  {
    uint64_t v21 = ~*MEMORY[0x263EF8AE8] & (*MEMORY[0x263EF8AE8] + **((void **)v9 + 7));
    if (v21)
    {
      v29 = v7;
      uint64_t v22 = **((void **)v9 + 4);
      uint64_t Offset = DYHarvesterGetOffset();
      v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x4812000000;
      v49 = __Block_byref_object_copy_;
      v50 = __Block_byref_object_dispose_;
      v51 = "";
      v53 = 0;
      uint64_t v54 = 0;
      __p = 0;
      std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(&__p, *((const void **)v20 + 12), *((void *)v20 + 13), (uint64_t)(*((void *)v20 + 13) - *((void *)v20 + 12)) >> 3);
      *((void *)v20 + 13) = *((void *)v20 + 12);
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __68__DYMTLFunctionPlayer__restoreTexture_commandBuffer_argumentOffset___block_invoke;
      v45[3] = &unk_265338F08;
      v45[4] = self;
      v45[5] = &v46;
      v24 = (void *)[v6 newBufferWithBytesNoCopy:v22 length:v21 options:0 deallocator:v45];
      _Block_object_dispose(&v46, 8);
      id v7 = v29;
      if (__p)
      {
        v53 = __p;
        operator delete(__p);
      }
      if (v24)
      {
        if (!v18) {
          goto LABEL_21;
        }
LABEL_15:
        if (v24 && v8)
        {
          [v18 setLabel:*MEMORY[0x263F3FA28]];
          v26 = [v18 blitCommandEncoder];
          if (-[DYMTLFunctionPlayer _isDepthStencilFormat:](self, "_isDepthStencilFormat:", [v8 pixelFormat]))
          {
            uint64_t v44 = *((void *)&v57[2] + 1);
            long long v43 = *(_OWORD *)((char *)&v57[1] + 8);
            long long v41 = v57[0];
            uint64_t v42 = *(void *)&v57[1];
            [v26 copyFromBuffer:v24 sourceOffset:Offset sourceBytesPerRow:4 * (v31 / 5) sourceBytesPerImage:4 * (v30 / 5) sourceSize:&v43 toTexture:v8 destinationSlice:v32 destinationLevel:v28 destinationOrigin:&v41 options:1];
            long long v39 = *(_OWORD *)((char *)&v57[1] + 8);
            uint64_t v40 = *((void *)&v57[2] + 1);
            long long v37 = v57[0];
            uint64_t v38 = *(void *)&v57[1];
            [v26 copyFromBuffer:v24 sourceOffset:Offset + 4 * (v30 / 5) sourceBytesPerRow:v31 / 5 sourceBytesPerImage:v30 / 5 sourceSize:&v39 toTexture:v8 destinationSlice:v32 destinationLevel:v28 destinationOrigin:&v37 options:2];
          }
          else
          {
            long long v35 = *(_OWORD *)((char *)&v57[1] + 8);
            uint64_t v36 = *((void *)&v57[2] + 1);
            long long v33 = v57[0];
            uint64_t v34 = *(void *)&v57[1];
            [v26 copyFromBuffer:v24 sourceOffset:Offset sourceBytesPerRow:v31 sourceBytesPerImage:v30 sourceSize:&v35 toTexture:v8 destinationSlice:v32 destinationLevel:v28 destinationOrigin:&v33 options:v27 >> 11];
          }
          [v26 endEncoding];
          [v18 commit];
        }
        goto LABEL_21;
      }
    }
  }
  uint64_t v25 = [v6 newBufferWithBytes:Data length:DataSize options:0];
  [(DYFunctionPlayer *)self releaseDataForArgument:4];
  uint64_t Offset = 0;
  v24 = (void *)v25;
  if (v18) {
    goto LABEL_15;
  }
LABEL_21:

  AutoPerfStatSamplingControl::~AutoPerfStatSamplingControl(v55);
LABEL_22:
}

uint64_t __68__DYMTLFunctionPlayer__restoreTexture_commandBuffer_argumentOffset___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(result + 40) + 8) + 48);
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 56) != v1)
  {
    uint64_t v2 = result;
    unint64_t v3 = 0;
    do
    {
      result = [*(id *)(v2 + 32) releaseDataForPosition:*(void *)(v1 + 8 * v3++)];
      uint64_t v1 = *(void *)(*(void *)(*(void *)(v2 + 40) + 8) + 48);
    }
    while (v3 < (*(void *)(*(void *)(*(void *)(v2 + 40) + 8) + 56) - v1) >> 3);
  }
  return result;
}

- (void)executePlatformFunction
{
  [(DYFunctionPlayer *)self processArguments];
  uint64_t v4 = (int)*MEMORY[0x263F3F9A8];
  unint64_t v5 = *(int **)((char *)&self->super.super.isa + v4);
  int v6 = *v5;
  if ((*v5 + 6143) > 0x30 || ((1 << (*v5 - 1)) & 0x1FFFFFFF77FFFLL) == 0)
  {
    switch(v6)
    {
      case -10240:
        *(void *)&long long v124 = 0;
        id v8 = (void **)((char *)self + (int)*MEMORY[0x263F3F970]);
        *(void *)&long long v124 = *v8[1];
        *(void *)v130 = &v124;
        id v9 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, (unint64_t *)&v124, (uint64_t)&std::piecewise_construct, (void **)v130)[3];
        uint64_t v10 = (const void *)*v8[2];
        id v11 = [(DYMTLFunctionPlayer *)self indirectArgumentManager];
        [v11 encodeIndirectArgumentsForBuffer:(void)v124 data:v10];

        uint64_t v12 = *v8[3];
        size_t v13 = *v8[4];
        if ([v9 storageMode]) {
          BOOL v14 = (v13 & 3) == 0;
        }
        else {
          BOOL v14 = 0;
        }
        if (!v14)
        {
          memcpy((void *)([v9 contents] + v12), v10, v13);
          [(DYFunctionPlayer *)self releaseDataForArgument:2];
          goto LABEL_110;
        }
        v75 = [(DYMTLFunctionPlayer *)self device];
        v74 = v75;
        if (!v75) {
          goto LABEL_60;
        }
        v76 = (char *)self + (int)*MEMORY[0x263F3F978];
        v77 = (const void *)*((void *)v76 + 6);
        uint64_t v78 = *((void *)v76 + 7);
        if (v77 == (const void *)v78)
        {
          id v80 = (id) [v75 newBufferWithLength:v13 options:0];
          memcpy((void *)[v80 contents], v10, v13);
          [(DYFunctionPlayer *)self releaseDataForArgument:2];
          uint64_t v81 = 0;
        }
        else
        {
          size_t v79 = ~*MEMORY[0x263EF8AE8] & (*MEMORY[0x263EF8AE8] + v13);
          if (!v79)
          {
            [(DYFunctionPlayer *)self releaseDataForArgument:2];
            goto LABEL_60;
          }
          *(void *)v130 = 0;
          *(void *)&v130[8] = v130;
          *(void *)&v130[16] = 0x4812000000;
          *(void *)&v130[24] = __Block_byref_object_copy_;
          *(void *)&v130[32] = __Block_byref_object_dispose_;
          *(void *)&v130[40] = "";
          long long v131 = 0uLL;
          *(void *)&v130[48] = 0;
          std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(&v130[48], v77, v78, (v78 - (uint64_t)v77) >> 3);
          *((void *)v76 + 7) = *((void *)v76 + 6);
          v137[0] = MEMORY[0x263EF8330];
          v137[1] = 3221225472;
          v137[2] = __46__DYMTLFunctionPlayer_executePlatformFunction__block_invoke;
          v137[3] = &unk_265338F08;
          v137[4] = self;
          v137[5] = v130;
          id v80 = (id)[v74 newBufferWithBytesNoCopy:v10 length:v79 options:0 deallocator:v137];
          _Block_object_dispose(v130, 8);
          if (*(void *)&v130[48])
          {
            *(void *)&long long v131 = *(void *)&v130[48];
            operator delete(*(void **)&v130[48]);
          }
          uint64_t v81 = v12;
        }
        if (v80)
        {
          v109 = [(DYMTLFunctionPlayer *)self commandQueue];
          AutoPerfStatSamplingControl::AutoPerfStatSamplingControl((uint64_t)v130, v109);

          v110 = [(DYMTLFunctionPlayer *)self commandQueue];
          v111 = [v110 commandBuffer];
          v112 = v111;
          if (v111)
          {
            [v111 setLabel:*MEMORY[0x263F3FA28]];
            v113 = [v112 blitCommandEncoder];
            [v113 copyFromBuffer:v80 sourceOffset:v81 toBuffer:v9 destinationOffset:v12 size:v13];
            [v113 endEncoding];
            [v112 commit];
          }
          AutoPerfStatSamplingControl::~AutoPerfStatSamplingControl((id *)v130);
        }
        goto LABEL_60;
      case -10239:
        if (*((_WORD *)v5 + 5) == 2)
        {
          uint64_t v134 = 0;
          uint64_t v135 = 0;
          uint64_t v136 = 0;
          memset(&v130[8], 0, 48);
          long long v131 = 0u;
          long long v132 = 0u;
          long long v133 = 0u;
          GPUTools::MTL::Utils::MakeDYMTLDeviceDescriptor(**(GPUTools::MTL::Utils ***)((char *)&self->super._executePlatform + (int)*MEMORY[0x263F3F970]), v130, v3);
          if (v130[31] >= 0) {
            v64 = &v130[8];
          }
          else {
            v64 = *(unsigned char **)&v130[8];
          }
          id v9 = [NSString stringWithUTF8String:v64];
          GPUTools::MTL::DispatchSetCaptureVersion(*(unsigned int *)v130);
          GPUTools::MTL::Utils::DYMTLDeviceDescriptor::~DYMTLDeviceDescriptor((GPUTools::MTL::Utils::DYMTLDeviceDescriptor *)v130);
          unint64_t v5 = *(int **)((char *)&self->super.super.isa + v4);
        }
        else
        {
          id v9 = 0;
        }
        [(DYMTLFunctionPlayer *)self deviceForID:*((void *)v5 + 2) withDeviceName:v9];

        goto LABEL_110;
      case -10238:
      case -10235:
      case -10234:
      case -10233:
      case -10231:
      case -10230:
      case -10227:
      case -10226:
      case -10225:
      case -10224:
      case -10223:
      case -10222:
      case -10221:
      case -10218:
      case -10217:
      case -10215:
        goto LABEL_15;
      case -10237:
        *(void *)v130 = v5 + 4;
        id v9 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, (unint64_t *)v5 + 2, (uint64_t)&std::piecewise_construct, (void **)v130)[3];
        if (v9)
        {
          uint64_t v54 = (void **)((char *)self + (int)*MEMORY[0x263F3F970]);
          [(DYMTLIndirectArgumentBufferManager *)self->_indirectArgumentManager encodeIndirectArgumentsForBuffer:*(*(void ***)((char *)&self->super.super.isa + v4))[3] data:*v54[1]];
          uint64_t v55 = *v54[2];
          uint64_t v56 = *v54[3];
          if ((v55 & 3) != 0 || (*v54[3] & 0xF0) == 0)
          {
            uint64_t v58 = [v9 newBufferWithBytes:*v54[1] length:*v54[2] options:0];
            *(void *)v130 = (*(void **)((char *)&self->super.super.isa + v4))[3];
            v59 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, *(unint64_t **)v130, (uint64_t)&std::piecewise_construct, (void **)v130);
            v60 = (void *)v59[3];
            v59[3] = v58;

            [(DYFunctionPlayer *)self releaseDataForArgument:1];
          }
          else
          {
            v92 = (char *)self + (int)*MEMORY[0x263F3F978];
            if (*((void *)v92 + 3) == *((void *)v92 + 4))
            {
              uint64_t v105 = *v54[1];
              v106 = [(DYMTLFunctionPlayer *)self device];
              v107 = [(DYMTLFunctionPlayer *)self _createPrivateBufferForFunctionWithDevice:v106 bytes:v105 length:v55 resourceOptions:v56];

              *(void *)v130 = (*(void **)((char *)&self->super.super.isa + v4))[3];
              v108 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, *(unint64_t **)v130, (uint64_t)&std::piecewise_construct, (void **)v130);
              objc_storeStrong(v108 + 3, v107);
              [(DYFunctionPlayer *)self releaseDataForArgument:1];
            }
            else
            {
              uint64_t v93 = [v9 newBufferWithLength:*v54[2] options:*v54[3]];
              if ((~*MEMORY[0x263EF8AE8] & (unint64_t)(*MEMORY[0x263EF8AE8] + v55)) != 0)
              {
                v94 = (void *)*((void *)v92 + 3);
                if (*((void *)v92 + 4) - (void)v94 != 8) {
                  __assert_rtn("-[DYMTLFunctionPlayer executePlatformFunction]", ", 0, "_argumentStorePositions[1].size() == 1"");
                }
                uint64_t v95 = *v54[1];
                *(void *)v130 = 0;
                *(void *)&v130[8] = v130;
                *(_OWORD *)&v130[16] = 0x2020000000uLL;
                *(void *)&v130[24] = *v94;
                *((void *)v92 + 4) = v94;
                v129[3] = (id)MEMORY[0x263EF8330];
                v129[4] = (id)3221225472;
                v129[5] = __46__DYMTLFunctionPlayer_executePlatformFunction__block_invoke_2;
                v129[6] = &unk_265338F30;
                v129[7] = self;
                v129[8] = v130;
                v96 = objc_msgSend(v9, "newBufferWithBytesNoCopy:length:options:deallocator:", v95);
                v97 = [(DYMTLFunctionPlayer *)self commandQueue];
                AutoPerfStatSamplingControl::AutoPerfStatSamplingControl((uint64_t)&v124, v97);
                v98 = [v97 commandBuffer];
                v99 = v98;
                if (v98)
                {
                  [v98 setLabel:*MEMORY[0x263F3FA28]];
                  v100 = [v99 blitCommandEncoder];
                  [v100 copyFromBuffer:v96 sourceOffset:0 toBuffer:v93 destinationOffset:0 size:v55];
                  [v100 endEncoding];
                  [v99 commit];
                }
                AutoPerfStatSamplingControl::~AutoPerfStatSamplingControl((id *)&v124);

                _Block_object_dispose(v130, 8);
              }
              else
              {
                [(DYFunctionPlayer *)self releaseDataForArgument:1];
              }
              *(void *)v130 = (*(void **)((char *)&self->super.super.isa + v4))[3];
              v114 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, *(unint64_t **)v130, (uint64_t)&std::piecewise_construct, (void **)v130);
              v107 = (void *)v114[3];
              v114[3] = v93;
            }
          }
        }
        goto LABEL_110;
      case -10236:
        uint64_t v28 = *((void *)v5 + 2);
        [(DYMTLFunctionPlayer *)self _restoreTexture:v28 commandBuffer:0 argumentOffset:0];
        return;
      case -10232:
        v29 = [(DYMTLFunctionPlayer *)self objectForKey:*((void *)v5 + 2)];
        unint64_t v30 = (void **)((char *)self + (int)*MEMORY[0x263F3F970]);
        unint64_t v31 = (const void *)*v30[1];
        size_t v32 = *v30[2];
        size_t v33 = *v30[3];
        id v115 = v29;
        char v34 = [v29 isDrawable];
        uint64_t Data = DYHarvesterGetData();
        uint64_t Metadata = DYHarvesterGetMetadata();
        if (Metadata)
        {
          if ((v34 & 1) == 0)
          {
            long long v37 = (__IOSurface *)[v115 iosurface];
            IOSurfaceLock(v37, 0, 0);
            DYIOSurfaceUtilsPlaneCount();
            uint64_t v38 = *(void *)(Metadata + 16);
            if (v38 <= 1) {
              size_t v39 = v33;
            }
            else {
              size_t v39 = 0;
            }
            if (v38)
            {
              uint64_t v40 = 0;
              uint64_t v41 = 0;
              uint64_t v116 = Metadata + 24;
              do
              {
                size_t HeightOfPlane = IOSurfaceGetHeightOfPlane(v37, v41 + v39);
                IOSurfaceGetWidthOfPlane(v37, v41 + v39);
                size_t BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(v37, v41 + v39);
                BaseAddressOfPlane = (char *)IOSurfaceGetBaseAddressOfPlane(v37, v41 + v39);
                if (HeightOfPlane)
                {
                  v45 = BaseAddressOfPlane;
                  uint64_t v46 = v116 + 48 * v41;
                  size_t v49 = *(void *)(v46 + 32);
                  uint64_t v48 = (size_t *)(v46 + 32);
                  size_t v47 = v49;
                  do
                  {
                    memcpy(v45, (const void *)(Data + v40), v47);
                    size_t v47 = *v48;
                    v40 += *v48;
                    v45 += BytesPerRowOfPlane;
                    --HeightOfPlane;
                  }
                  while (HeightOfPlane);
                }
                ++v41;
              }
              while (v41 != v38);
            }
            IOSurfaceUnlock(v37, 0, 0);
          }
        }
        else if (([v115 pixelFormat] & 0xFFFFFFFFFFFFFFFELL) == 0x226)
        {
          DecodeRGB10A8_2P_XR10(v115, (uint64_t)v31);
        }
        else if ((v34 & 1) == 0)
        {
          v101 = (__IOSurface *)[v115 iosurface];
          IOSurfaceLock(v101, 0, 0);
          v102 = IOSurfaceGetBaseAddressOfPlane(v101, v33);
          size_t AllocSize = IOSurfaceGetAllocSize(v101);
          if (v32 >= AllocSize) {
            size_t v104 = AllocSize;
          }
          else {
            size_t v104 = v32;
          }
          memcpy(v102, v31, v104);
          IOSurfaceUnlock(v101, 0, 0);
        }

        return;
      case -10229:
        if (*((_WORD *)v5 + 5) == 5)
        {
          v50 = *(GPUTools::MTL ***)((char *)&self->super._executeGraphicsSEL + (int)*MEMORY[0x263F3F970]);
          v51 = *v50;
          v52 = (char *)self + (int)*MEMORY[0x263F3F998];
          *(void *)v130 = v50;
          v53 = std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void * const&>,std::tuple<>>((uint64_t)v52, v50, (uint64_t)&std::piecewise_construct, (void **)v130);
          GPUTools::MTL::MakeDispatchDataT(v51, v53[3]);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v9 = 0;
        }
        v74 = [(DYMTLFunctionPlayer *)self indirectArgumentManager];
        [v74 processCommandBuffer:**(void **)((char *)&self->super.super.isa + (int)*MEMORY[0x263F3F970]) functionIndex:*(unsigned int *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F3F990]) ancestorMapData:**(void **)((char *)&self->super._executePlatform + (int)*MEMORY[0x263F3F970]) indirectArgumentBuffersData:**(void **)((char *)&self->super._executePlatformSEL + (int)*MEMORY[0x263F3F970]) resourceMapsData:**(void **)((char *)&self->super._executeGraphics + (int)*MEMORY[0x263F3F970]) driverDecodingData:v9];
LABEL_60:

        goto LABEL_110;
      case -10228:
        uint64_t v71 = **(void **)((char *)&self->super._executePlatform + (int)*MEMORY[0x263F3F970]);
        uint64_t v72 = *((void *)v5 + 2);
        indirectCommandManager = self->_indirectCommandManager;
        [(DYMTLIndirectCommandBufferManager *)indirectCommandManager addGPUVirtualAddress:v71 forObjectId:v72];
        return;
      case -10220:
        uint64_t v25 = **(void **)((char *)&self->super._executePlatform + (int)*MEMORY[0x263F3F970]);
        uint64_t v26 = *((void *)v5 + 2);
        unint64_t v27 = self->_indirectCommandManager;
        [(DYMTLIndirectCommandBufferManager *)v27 addRenderPipelineStateUniqueIdentifier:v25 forObjectId:v26];
        return;
      case -10219:
        v68 = self->_indirectCommandManager;
        *(void *)v130 = v5 + 4;
        uint64_t v69 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, (unint64_t *)v5 + 2, (uint64_t)&std::piecewise_construct, (void **)v130)[3];
        uint64_t v70 = **(void **)((char *)&self->super._executePlatform + (int)*MEMORY[0x263F3F970]);
        id v9 = [(DYMTLFunctionPlayer *)self commandQueue];
        [(DYMTLIndirectCommandBufferManager *)v68 restoreBuffer:v69 withData:v70 commandQueue:v9];
        goto LABEL_110;
      case -10216:
        v65 = self->_indirectCommandManager;
        *(void *)v130 = v5 + 4;
        uint64_t v66 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, (unint64_t *)v5 + 2, (uint64_t)&std::piecewise_construct, (void **)v130)[3];
        uint64_t v67 = **(void **)((char *)&self->super._executePlatform + (int)*MEMORY[0x263F3F970]);
        id v9 = [(DYMTLFunctionPlayer *)self commandQueue];
        [(DYMTLIndirectCommandBufferManager *)v65 restoreBuffer:v66 optimizedRanges:v67 commandQueue:v9];
        goto LABEL_110;
      case -10214:
        uint64_t v61 = **(void **)((char *)&self->super._executePlatform + (int)*MEMORY[0x263F3F970]);
        uint64_t v62 = *((void *)v5 + 2);
        v63 = self->_indirectCommandManager;
        [(DYMTLIndirectCommandBufferManager *)v63 addComputePipelineStateUniqueIdentifier:v61 forObjectId:v62];
        return;
      case -10213:
        char v15 = (void **)((char *)self + (int)*MEMORY[0x263F3F970]);
        *(void *)&long long v124 = *v15[1];
        *(void *)v130 = &v124;
        id v9 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&self->_objectMap, (unint64_t *)&v124, (uint64_t)&std::piecewise_construct, (void **)v130)[3];
        uint64_t v16 = *v15[2];
        id v17 = [(DYMTLFunctionPlayer *)self commandQueue];
        AutoPerfStatSamplingControl::AutoPerfStatSamplingControl((uint64_t)v129, v17);

        unint64_t v18 = [(DYMTLFunctionPlayer *)self commandQueue];
        v19 = [v18 commandBuffer];
        [v19 setLabel:*MEMORY[0x263F3FA28]];
        v20 = [v19 resourceStateCommandEncoder];
        long long v127 = 0uLL;
        uint64_t v128 = 0;
        uint64_t v21 = [(DYMTLFunctionPlayer *)self device];
        uint64_t v22 = [v9 textureType];
        uint64_t v23 = [v9 pixelFormat];
        uint64_t v24 = [v9 sampleCount];
        if (v21)
        {
          [v21 sparseTileSizeWithTextureType:v22 pixelFormat:v23 sampleCount:v24];
        }
        else
        {
          long long v127 = 0uLL;
          uint64_t v128 = 0;
        }

        if (v16 == 2)
        {
          for (unint64_t i = 0; i < [v9 arrayLength]; ++i)
          {
            for (unint64_t j = 0; j <= [v9 firstMipmapInTail]; ++j)
            {
              long long v125 = 0u;
              long long v126 = 0u;
              long long v124 = 0u;
              unint64_t v84 = (unint64_t)[v9 width] >> j;
              if (v84 <= 1) {
                unint64_t v84 = 1;
              }
              *((void *)&v125 + 1) = v84;
              unint64_t v85 = (unint64_t)[v9 height] >> j;
              if (v85 <= 1) {
                unint64_t v85 = 1;
              }
              *(void *)&long long v126 = v85;
              unint64_t v86 = (unint64_t)[v9 depth] >> j;
              if (v86 <= 1) {
                unint64_t v86 = 1;
              }
              *((void *)&v126 + 1) = v86;
              device = self->_device;
              long long v122 = v127;
              uint64_t v123 = v128;
              [(MTLDevice *)device convertSparsePixelRegions:&v124 toTileRegions:v130 withTileSize:&v122 alignmentMode:0 numRegions:1];
              v121[0] = *(_OWORD *)v130;
              v121[1] = *(_OWORD *)&v130[16];
              v121[2] = *(_OWORD *)&v130[32];
              [v20 updateTextureMapping:v9 mode:1 region:v121 mipLevel:j slice:i];
            }
          }
        }
        else
        {
          long long v125 = 0u;
          long long v126 = 0u;
          long long v124 = 0u;
          *(void *)&double v88 = GPUTools::MTL::MakeMTLRegion((GPUTools::MTL *)*v15[3], (uint64_t)&v124).n128_u64[0];
          uint64_t v89 = *v15[4];
          uint64_t v90 = *v15[5];
          v91 = [(DYMTLFunctionPlayer *)self device];
          long long v119 = v127;
          uint64_t v120 = v128;
          [v91 convertSparsePixelRegions:&v124 toTileRegions:v130 withTileSize:&v119 alignmentMode:0 numRegions:1];

          v118[0] = *(_OWORD *)v130;
          v118[1] = *(_OWORD *)&v130[16];
          v118[2] = *(_OWORD *)&v130[32];
          [v20 updateTextureMapping:v9 mode:v16 region:v118 mipLevel:v89 slice:v90];
        }
        [v20 endEncoding];
        [v19 commit];

        AutoPerfStatSamplingControl::~AutoPerfStatSamplingControl(v129);
LABEL_110:

        break;
      default:
        if ((v6 + 10201) >= 2)
        {
LABEL_15:
          v117.receiver = self;
          v117.super_class = (Class)DYMTLFunctionPlayer;
          [(DYFunctionPlayer *)&v117 executePlatformFunction];
        }
        break;
    }
  }
  else
  {
    DispatchMPSMethod();
  }
}

uint64_t __46__DYMTLFunctionPlayer_executePlatformFunction__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(result + 40) + 8) + 48);
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 56) != v1)
  {
    uint64_t v2 = result;
    unint64_t v3 = 0;
    do
    {
      result = [*(id *)(v2 + 32) releaseDataForPosition:*(void *)(v1 + 8 * v3++)];
      uint64_t v1 = *(void *)(*(void *)(*(void *)(v2 + 40) + 8) + 48);
    }
    while (v3 < (*(void *)(*(void *)(*(void *)(v2 + 40) + 8) + 56) - v1) >> 3);
  }
  return result;
}

uint64_t __46__DYMTLFunctionPlayer_executePlatformFunction__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) releaseDataForPosition:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

- (id)_createPrivateBufferForFunctionWithDevice:(id)a3 bytes:(char *)a4 length:(unint64_t)a5 resourceOptions:(unint64_t)a6
{
  id v10 = a3;
  id v11 = (void *)[v10 newBufferWithBytes:a4 length:a5 options:0];
  uint64_t v12 = (void *)[v10 newBufferWithLength:a5 options:a6];
  size_t v13 = [(DYMTLFunctionPlayer *)self commandQueue];
  AutoPerfStatSamplingControl::AutoPerfStatSamplingControl((uint64_t)v18, v13);
  BOOL v14 = [v13 commandBuffer];
  char v15 = v14;
  if (v14)
  {
    [v14 setLabel:*MEMORY[0x263F3FA28]];
    uint64_t v16 = [v15 blitCommandEncoder];
    [v16 copyFromBuffer:v11 sourceOffset:0 toBuffer:v12 destinationOffset:0 size:a5];
    [v16 endEncoding];
    [v15 commit];
  }
  AutoPerfStatSamplingControl::~AutoPerfStatSamplingControl(v18);

  return v12;
}

- (void)_saveBytes
{
  int v3 = **(_DWORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x263F3F9A8]);
  if (v3 > -16224)
  {
    if (v3 == -16223)
    {
      size_t v13 = objc_opt_class();
      BOOL v14 = (void **)((char *)self + (int)*MEMORY[0x263F3F970]);
      uint64_t v6 = [v13 fragmentBytesKeyAtIndex:*v14[3]];
      uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithBytes:*v14[1] length:*v14[2]];
      uint64_t v8 = 1448;
    }
    else
    {
      if (v3 != -16143) {
        return;
      }
      id v9 = objc_opt_class();
      id v10 = (void **)((char *)self + (int)*MEMORY[0x263F3F970]);
      uint64_t v6 = [v9 tileBytesKeyAtIndex:*v10[3]];
      uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithBytes:*v10[1] length:*v10[2]];
      uint64_t v8 = 1488;
    }
  }
  else if (v3 == -16227)
  {
    id v11 = objc_opt_class();
    uint64_t v12 = (void **)((char *)self + (int)*MEMORY[0x263F3F970]);
    uint64_t v6 = [v11 computeBytesKeyAtIndex:*v12[3]];
    uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithBytes:*v12[1] length:*v12[2]];
    uint64_t v8 = 1528;
  }
  else
  {
    if (v3 != -16225) {
      return;
    }
    uint64_t v4 = objc_opt_class();
    unint64_t v5 = (void **)((char *)self + (int)*MEMORY[0x263F3F970]);
    uint64_t v6 = [v4 vertexBytesKeyAtIndex:*v5[3]];
    uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithBytes:*v5[1] length:*v5[2]];
    uint64_t v8 = 1408;
  }
  unint64_t v17 = v6;
  unint64_t v18 = &v17;
  char v15 = std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)self + v8, &v17, (uint64_t)&std::piecewise_construct, &v18);
  uint64_t v16 = (void *)v15[3];
  v15[3] = v7;
}

- (void)executeGraphicsFunction
{
  if (![(DYFunctionPlayer *)self shouldExecuteGraphicsFunction]) {
    return;
  }
  [(DYFunctionPlayer *)self processArguments];
  [(DYMTLFunctionPlayer *)self _saveBytes];
  uint64_t v3 = (int)*MEMORY[0x263F3F9A8];
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.isa + v3);
  int v5 = *(_DWORD *)v4;
  if (*(int *)v4 > -15910)
  {
    if (v5 > -15848)
    {
      if (v5 == -15847)
      {
        unint64_t v30 = (char *)self + (int)*MEMORY[0x263F3F970];
        unint64_t v31 = GPUTools::MTL::MakeMTLArray(**((void ***)v30 + 1), *(unsigned __int16 *)(v4 + 92), (uint64_t)&self->_objectMap);
        MTLImageFilterFunctionInfo = GPUTools::MTL::MakeMTLImageFilterFunctionInfo(**((GPUTools::MTL ***)v30 + 2), v32);
        char v34 = [(DYMTLFunctionPlayer *)self device];
        long long v35 = (void *)[v34 newLibraryWithImageFilterFunctionsSPI:v31 imageFilterFunctionInfo:MTLImageFilterFunctionInfo error:0];

        *(void *)&long long v57 = (*(void **)((char *)&self->super.super.isa + v3))[3];
        uint64_t v36 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, (unint64_t *)v57, (uint64_t)&std::piecewise_construct, (void **)&v57);
        objc_storeStrong(v36 + 3, v35);
        unint64_t v37 = 0;
        uint64_t v38 = 2;
        while (v37 < [v31 count])
        {
          free((void *)MTLImageFilterFunctionInfo[v38]);
          ++v37;
          v38 += 3;
        }
        free(MTLImageFilterFunctionInfo);

        goto LABEL_37;
      }
      if (v5 == -12544)
      {
        unint64_t v61 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v4 + 24, 0);
        unint64_t v60 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.isa + v3) + 48, 0);
        *(void *)&long long v57 = &v60;
        uint64_t v10 = objc_msgSend((id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, &v60, (uint64_t)&std::piecewise_construct, (void **)&v57)[3], "commandBuffer");
        *(void *)&long long v57 = &v61;
        id v11 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, &v61, (uint64_t)&std::piecewise_construct, (void **)&v57);
        uint64_t v12 = (void *)v11[3];
        v11[3] = v10;

        goto LABEL_37;
      }
    }
    else
    {
      if (v5 == -15909)
      {
        unint64_t v61 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v4 + 72, 0);
        unint64_t v60 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.isa + v3) + 24, 0);
        v20 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_objectMap.__table_.__bucket_list_.__ptr_.__value_, &v61);
        if (v20)
        {
          uint64_t v21 = v20;
          id v6 = [(DYMTLFunctionPlayer *)self device];
          uint64_t v22 = [v6 newSharedEventWithHandle:v21[3]];
        }
        else
        {
          id v6 = [(DYMTLFunctionPlayer *)self device];
          uint64_t v22 = [v6 newSharedEvent];
        }
        *(void *)&long long v57 = &v60;
        uint64_t v23 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, &v60, (uint64_t)&std::piecewise_construct, (void **)&v57);
        id v9 = (void *)v23[3];
        v23[3] = v22;
        goto LABEL_33;
      }
      if (v5 == -15908)
      {
        unint64_t v61 = **(void **)(v4 + 48);
        *(void *)&long long v57 = &v61;
        objc_msgSend((id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, &v61, (uint64_t)&std::piecewise_construct, (void **)&v57)[3], "commitAndWaitUntilSubmitted");
        goto LABEL_37;
      }
    }
LABEL_28:
    uint64_t v13 = (int)*MEMORY[0x263F3F970];
    goto LABEL_29;
  }
  if (v5 > -15980)
  {
    if (v5 == -15979)
    {
      unint64_t v61 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v4 + 24, 0);
      unint64_t v60 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.isa + v3) + 72, 0);
      uint64_t v24 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_objectMap.__table_.__bucket_list_.__ptr_.__value_, &v60);
      if (v24)
      {
        uint64_t v26 = v24;
        id v6 = [(DYMTLFunctionPlayer *)self device];
        uint64_t v27 = [v6 newSharedTextureWithHandle:v26[3]];
        *(void *)&long long v57 = &v61;
        uint64_t v28 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, &v61, (uint64_t)&std::piecewise_construct, (void **)&v57);
        v29 = (void *)v28[3];
        v28[3] = v27;
      }
      else
      {
        GPUTools::MTL::MakeMTLTextureDescriptor(*(*(GPUTools::MTL ****)((char *)&self->super.super.isa + v3))[12], v25);
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        v29 = [(DYMTLFunctionPlayer *)self device];
        uint64_t v39 = [v29 newSharedTextureWithDescriptor:v6];
        *(void *)&long long v57 = &v61;
        uint64_t v40 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, &v61, (uint64_t)&std::piecewise_construct, (void **)&v57);
        uint64_t v41 = (void *)v40[3];
        v40[3] = v39;
      }
      goto LABEL_36;
    }
    if (v5 == -15912)
    {
      unint64_t v61 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned int>(v4 + 24, 0);
      id v6 = [(DYMTLFunctionPlayer *)self device];
      uint64_t v7 = [v6 newSharedEvent];
      *(void *)&long long v57 = &v61;
      uint64_t v8 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, &v61, (uint64_t)&std::piecewise_construct, (void **)&v57);
      id v9 = (void *)v8[3];
      v8[3] = v7;
LABEL_33:

      goto LABEL_36;
    }
    goto LABEL_28;
  }
  if (v5 != -16313)
  {
    if (v5 == -16236)
    {
      *(void *)&long long v57 = v4 + 16;
      id v6 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, (unint64_t *)(v4 + 16), (uint64_t)&std::piecewise_construct, (void **)&v57)[3];
      if ([v6 storageMode] != 3)
      {
        if ([v6 storageMode] == 2)
        {
          [(DYMTLFunctionPlayer *)self _restoreTexture:(*(void **)((char *)&self->super.super.isa + v3))[2] commandBuffer:0 argumentOffset:0];
        }
        else if (![v6 iosurface])
        {
          long long v58 = 0u;
          long long v59 = 0u;
          long long v57 = 0u;
          v50 = (GPUTools::MTL ***)((char *)self + (int)*MEMORY[0x263F3F970]);
          GPUTools::MTL::MakeMTLRegion(*v50[1], (uint64_t)&v57);
          uint64_t v51 = (uint64_t)*v50[2];
          uint64_t v52 = (uint64_t)*v50[3];
          uint64_t Data = DYHarvesterGetData();
          uint64_t v54 = (uint64_t)*v50[5];
          uint64_t v55 = (uint64_t)*v50[6];
          v56[0] = v57;
          v56[1] = v58;
          v56[2] = v59;
          [v6 replaceRegion:v56 mipmapLevel:v51 slice:v52 withBytes:Data bytesPerRow:v54 bytesPerImage:v55];
        }
      }
      goto LABEL_36;
    }
    goto LABEL_28;
  }
  uint64_t v13 = (int)*MEMORY[0x263F3F970];
  BOOL v14 = (char *)self + v13;
  uint64_t v15 = **(void **)((char *)&self->super._executeGraphics + v13);
  if ((v15 & 0xF0) != 0x20)
  {
LABEL_29:
    DYMTLDispatchFunc(&self->_objectMap.__table_.__bucket_list_.__ptr_.__value_, *(void *)(v4 + 16), v5, (uint64_t)self + v13, (uint64_t)self + (int)*MEMORY[0x263F3F998], *(unint64_t **)(v4 + 24), self->_indirectArgumentManager);
    goto LABEL_37;
  }
  uint64_t v16 = **((void **)v14 + 1);
  uint64_t v17 = **((void **)v14 + 2);
  unint64_t v18 = [(DYMTLFunctionPlayer *)self device];
  id v6 = [(DYMTLFunctionPlayer *)self _createPrivateBufferForFunctionWithDevice:v18 bytes:v16 length:v17 resourceOptions:v15];

  *(void *)&long long v57 = (*(void **)((char *)&self->super.super.isa + v3))[3];
  v19 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, (unint64_t *)v57, (uint64_t)&std::piecewise_construct, (void **)&v57);
  objc_storeStrong(v19 + 3, v6);
  [(DYFunctionPlayer *)self releaseDataForArgument:1];
LABEL_36:

LABEL_37:
  uint64_t v42 = *(Class *)((char *)&self->super.super.isa + v3);
  if ((*v42 + 16316) < 2 || *v42 == -16165)
  {
    unint64_t v61 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v42 + 6), 0);
    *(void *)&long long v57 = &v61;
    uint64_t v44 = (void *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&self->_objectMap, &v61, (uint64_t)&std::piecewise_construct, (void **)&v57)[3];
    id v45 = v44;
    unint64_t v46 = [v45 maxCommandBufferCount];
    p_commandQueue = &self->_commandQueue;
    if (v46 > [(MTLCommandQueueSPI *)self->_commandQueue maxCommandBufferCount])
    {
      [(MTLCommandQueueSPI *)*p_commandQueue finish];
      objc_storeStrong((id *)&self->_commandQueue, v44);
    }
    uint64_t v48 = *p_commandQueue;
    unint64_t v61 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.isa + v3) + 24, 0);
    *(void *)&long long v57 = &v61;
    size_t v49 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&self->_objectMap, &v61, (uint64_t)&std::piecewise_construct, (void **)&v57);
    objc_storeStrong(v49 + 3, v48);
  }
}

- (BOOL)isFrameBoundary
{
  return ((*(unsigned __int8 **)((char *)&self->super.super.isa + (int)*MEMORY[0x263F3F9A8]))[6] >> 2) & 1;
}

+ (void)vertexBytesKeyAtIndex:(unint64_t)a3
{
  return (char *)&kDYMTLVertexBytesKeys + a3;
}

+ (void)fragmentBytesKeyAtIndex:(unint64_t)a3
{
  return (char *)&kDYMTLFragmentBytesKeys + a3;
}

+ (void)computeBytesKeyAtIndex:(unint64_t)a3
{
  return (char *)&kDYMTLComputeBytesKeys + a3;
}

+ (void)tileBytesKeyAtIndex:(unint64_t)a3
{
  return (char *)&kDYMTLTileBytesKeys + a3;
}

- (DYMTLIndirectArgumentBufferManager)indirectArgumentManager
{
  return self->_indirectArgumentManager;
}

- (void)setIndirectArgumentManager:(id)a3
{
}

- (DYMTLIndirectCommandBufferManager)indirectCommandManager
{
  return self->_indirectCommandManager;
}

- (void)setIndirectCommandManager:(id)a3
{
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_indirectCommandManager, 0);
  objc_storeStrong((id *)&self->_indirectArgumentManager, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_computeBytesDataMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_tileBytesDataMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_fragmentBytesDataMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_vertexBytesDataMap);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_objectMap);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 85) = 0u;
  *((_OWORD *)self + 86) = 0u;
  *((_DWORD *)self + 348) = 1065353216;
  *((_OWORD *)self + 88) = 0u;
  *((_OWORD *)self + 89) = 0u;
  *((_DWORD *)self + 360) = 1065353216;
  *(_OWORD *)((char *)self + 1448) = 0u;
  *(_OWORD *)((char *)self + 1464) = 0u;
  *((_DWORD *)self + 370) = 1065353216;
  *((_OWORD *)self + 93) = 0u;
  *((_OWORD *)self + 94) = 0u;
  *((_DWORD *)self + 380) = 1065353216;
  *(_OWORD *)((char *)self + 1528) = 0u;
  *(_OWORD *)((char *)self + 1544) = 0u;
  *((_DWORD *)self + 390) = 1065353216;
  return self;
}

@end