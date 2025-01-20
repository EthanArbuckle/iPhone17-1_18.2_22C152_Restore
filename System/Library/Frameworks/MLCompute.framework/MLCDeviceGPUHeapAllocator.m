@interface MLCDeviceGPUHeapAllocator
+ (BOOL)supportsSecureCoding;
- (BOOL)isDebuggingEnabled;
- (MLCDeviceGPUHeapAllocator)initWithCoder:(id)a3;
- (MLCDeviceGPUHeapAllocator)initWithDevice:(id)a3 heapSize:(unint64_t)a4 resourceSize:(unint64_t)a5 numResources:(unint64_t)a6;
- (MTLHeap)heap;
- (id)allocateBuffer:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageBatchForCommandBuffer:(id)a3 imageDescriptor:(id)a4 kernel:(id)a5 count:(unint64_t)a6;
- (id)imageForCommandBuffer:(id)a3 imageDescriptor:(id)a4 kernel:(id)a5;
- (unint64_t)heapSize;
- (unint64_t)numResources;
- (unint64_t)resourceOffset;
- (unint64_t)resourceSize;
- (void)encodeWithCoder:(id)a3;
- (void)setIsDebuggingEnabled:(BOOL)a3;
- (void)setResourceOffset:(unint64_t)a3;
@end

@implementation MLCDeviceGPUHeapAllocator

- (id)imageForCommandBuffer:(id)a3 imageDescriptor:(id)a4 kernel:(id)a5
{
  id v7 = a4;
  unint64_t v8 = [(MLCDeviceGPUHeapAllocator *)self resourceOffset];
  uint64_t v9 = [v7 featureChannels];
  uint64_t v10 = 125;
  if (v9 == 2) {
    uint64_t v10 = 105;
  }
  if (v9 == 1) {
    uint64_t v11 = 55;
  }
  else {
    uint64_t v11 = v10;
  }
  v12 = objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v11, objc_msgSend(v7, "width"), objc_msgSend(v7, "height"), 0);
  if ((unint64_t)[v7 featureChannels] <= 4) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 3;
  }
  [v12 setTextureType:v13];
  objc_msgSend(v12, "setArrayLength:", (unint64_t)(objc_msgSend(v7, "featureChannels") + 3) >> 2);
  [v12 setStorageMode:2];
  [v12 setUsage:3];
  v14 = [(MLCDeviceGPUHeapAllocator *)self heap];
  v15 = (void *)[v14 newTextureWithDescriptor:v12 offset:v8];

  id v16 = objc_alloc(MEMORY[0x1E4F35530]);
  uint64_t v17 = [v7 featureChannels];

  v18 = (void *)[v16 initWithTexture:v15 featureChannels:v17];
  if (!v18)
  {
    v19 = +[MLCLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceGPUHeapAllocator imageForCommandBuffer:imageDescriptor:kernel:](a2, v19);
    }
  }
  unint64_t v20 = [(MLCDeviceGPUHeapAllocator *)self resourceOffset];
  unint64_t v21 = [(MLCDeviceGPUHeapAllocator *)self resourceSize];
  if (v20 == ([(MLCDeviceGPUHeapAllocator *)self numResources] - 1) * v21)
  {
    unint64_t v22 = 0;
  }
  else
  {
    unint64_t v23 = [(MLCDeviceGPUHeapAllocator *)self resourceSize];
    unint64_t v22 = [(MLCDeviceGPUHeapAllocator *)self resourceOffset] + v23;
  }
  [(MLCDeviceGPUHeapAllocator *)self setResourceOffset:v22];

  return v18;
}

- (id)imageBatchForCommandBuffer:(id)a3 imageDescriptor:(id)a4 kernel:(id)a5 count:(unint64_t)a6
{
  id v38 = a4;
  v37 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  unint64_t v8 = [(MLCDeviceGPUHeapAllocator *)self resourceOffset];
  unint64_t v36 = a6;
  if (a6)
  {
    unint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = 125;
    while (1)
    {
      uint64_t v12 = [v38 featureChannels];
      uint64_t v13 = 55;
      if (v12 != 1) {
        uint64_t v13 = v11;
      }
      uint64_t v14 = v12 == 2 ? 105 : v13;
      v15 = objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v14, objc_msgSend(v38, "width"), objc_msgSend(v38, "height"), 0);
      uint64_t v16 = (unint64_t)[v38 featureChannels] <= 4 ? 2 : 3;
      [v15 setTextureType:v16];
      objc_msgSend(v15, "setArrayLength:", (unint64_t)(objc_msgSend(v38, "featureChannels") + 3) >> 2);
      [v15 setStorageMode:2];
      [v15 setUsage:3];
      uint64_t v17 = [(MLCDeviceGPUHeapAllocator *)self heap];
      v18 = (void *)[v17 newTextureWithDescriptor:v15 offset:v9];

      uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F35530]), "initWithTexture:featureChannels:", v18, objc_msgSend(v38, "featureChannels"));
      if (!v19) {
        break;
      }
      unint64_t v20 = (void *)v19;
      [v37 addObject:v19];
      [(MLCDeviceGPUHeapAllocator *)self heap];
      unint64_t v21 = v39 = v9;
      [v21 device];
      v23 = uint64_t v22 = v14;
      uint64_t v24 = [v23 heapTextureSizeAndAlignWithDescriptor:v15];
      unint64_t v26 = v25;

      uint64_t v11 = v22;
      unint64_t v9 = v39 + (v24 + v26 - 1) / v26 * v26;

      if (v36 == ++v10) {
        goto LABEL_13;
      }
    }
    v33 = +[MLCLog framework];
    v31 = v37;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceGPUHeapAllocator imageBatchForCommandBuffer:imageDescriptor:kernel:count:](a2);
    }

    id v32 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
LABEL_13:
    unint64_t v27 = [(MLCDeviceGPUHeapAllocator *)self resourceOffset];
    unint64_t v28 = [(MLCDeviceGPUHeapAllocator *)self resourceSize];
    if (v27 == ([(MLCDeviceGPUHeapAllocator *)self numResources] - 1) * v28)
    {
      unint64_t v29 = 0;
    }
    else
    {
      unint64_t v30 = [(MLCDeviceGPUHeapAllocator *)self resourceSize];
      unint64_t v29 = [(MLCDeviceGPUHeapAllocator *)self resourceOffset] + v30;
    }
    v31 = v37;
    [(MLCDeviceGPUHeapAllocator *)self setResourceOffset:v29];
    id v32 = v37;
  }

  return v32;
}

- (id)allocateBuffer:(unint64_t)a3
{
  v6 = [(MLCDeviceGPUHeapAllocator *)self heap];
  id v7 = objc_msgSend(v6, "newBufferWithLength:options:offset:", a3, 544, -[MLCDeviceGPUHeapAllocator resourceOffset](self, "resourceOffset"));

  if (v7)
  {
    unint64_t v8 = [(MLCDeviceGPUHeapAllocator *)self resourceOffset];
    unint64_t v9 = [(MLCDeviceGPUHeapAllocator *)self resourceSize];
    if (v8 == ([(MLCDeviceGPUHeapAllocator *)self numResources] - 1) * v9)
    {
      unint64_t v10 = 0;
    }
    else
    {
      unint64_t v12 = [(MLCDeviceGPUHeapAllocator *)self resourceSize];
      unint64_t v10 = [(MLCDeviceGPUHeapAllocator *)self resourceOffset] + v12;
    }
    [(MLCDeviceGPUHeapAllocator *)self setResourceOffset:v10];
    id v13 = v7;
  }
  else
  {
    uint64_t v11 = +[MLCLog framework];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MLCDeviceGPUHeapAllocator allocateBuffer:](a2);
    }
  }

  return v7;
}

- (MLCDeviceGPUHeapAllocator)initWithDevice:(id)a3 heapSize:(unint64_t)a4 resourceSize:(unint64_t)a5 numResources:(unint64_t)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MLCDeviceGPUHeapAllocator;
  uint64_t v11 = [(MLCDeviceGPUHeapAllocator *)&v15 init];
  if (v11)
  {
    unint64_t v12 = objc_opt_new();
    [v12 setType:1];
    [v12 setCpuCacheMode:0];
    [v12 setStorageMode:2];
    [v12 setHazardTrackingMode:2];
    [v12 setSize:a4];
    id v13 = (void *)[v10 newHeapWithDescriptor:v12];
    if (v13) {
      objc_storeStrong((id *)&v11->_heap, v13);
    }
    v11->_heapSize = a4;
    v11->_resourceSize = a5;
    v11->_resourceOffset = 0;
    v11->_numResources = a6;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(MLCDeviceGPUHeapAllocator *)self heap];
  v6 = [v5 device];
  id v7 = objc_msgSend(v4, "initWithDevice:heapSize:resourceSize:numResources:", v6, -[MLCDeviceGPUHeapAllocator heapSize](self, "heapSize"), -[MLCDeviceGPUHeapAllocator resourceSize](self, "resourceSize"), -[MLCDeviceGPUHeapAllocator numResources](self, "numResources"));

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (MLCDeviceGPUHeapAllocator)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"heapSize"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"resourceSize"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"numResources"];

  return [(MLCDeviceGPUHeapAllocator *)self initWithDevice:0 heapSize:v5 resourceSize:v6 numResources:v7];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLCDeviceGPUHeapAllocator heapSize](self, "heapSize"), @"heapSize");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLCDeviceGPUHeapAllocator resourceSize](self, "resourceSize"), @"resourceSize");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLCDeviceGPUHeapAllocator numResources](self, "numResources"), @"numResources");
}

- (MTLHeap)heap
{
  return self->_heap;
}

- (unint64_t)heapSize
{
  return self->_heapSize;
}

- (unint64_t)resourceSize
{
  return self->_resourceSize;
}

- (unint64_t)resourceOffset
{
  return self->_resourceOffset;
}

- (void)setResourceOffset:(unint64_t)a3
{
  self->_resourceOffset = a3;
}

- (unint64_t)numResources
{
  return self->_numResources;
}

- (BOOL)isDebuggingEnabled
{
  return self->_isDebuggingEnabled;
}

- (void)setIsDebuggingEnabled:(BOOL)a3
{
  self->_isDebuggingEnabled = a3;
}

- (void).cxx_destruct
{
}

- (void)imageForCommandBuffer:(const char *)a1 imageDescriptor:(NSObject *)a2 kernel:.cold.1(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%@: Error allocating on MPSImage", (uint8_t *)&v4, 0xCu);
}

- (void)imageBatchForCommandBuffer:(const char *)a1 imageDescriptor:kernel:count:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: Error allocating on MPSImage %lu", v4, v5, v6, v7, v8);
}

- (void)allocateBuffer:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: Error allocating MTLBuffer from temporary heap of size %lu bytes", v4, v5, v6, v7, v8);
}

@end