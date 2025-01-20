@interface ARBufferPopulationRegistry
- (ARBufferPopulationRegistry)init;
- (double)timestampForSurfaceID:(id)a3;
- (id)description;
- (id)labelForBufferWithSurfaceID:(id)a3;
- (id)surfaceIDsForBuffersWithLabel:(id)a3;
- (int)signpostTypeForLabel:(id)a3;
- (unint64_t)count;
- (unint64_t)countWithLabel:(id)a3;
- (void)registerBufferWithSurfaceID:(id)a3 label:(id)a4 signpostType:(id)a5 timestamp:(double)a6;
- (void)unregisterBufferWithSurfaceID:(id)a3;
@end

@implementation ARBufferPopulationRegistry

- (ARBufferPopulationRegistry)init
{
  v12.receiver = self;
  v12.super_class = (Class)ARBufferPopulationRegistry;
  v2 = [(ARBufferPopulationRegistry *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    bufferToLabelLUT = v2->_bufferToLabelLUT;
    v2->_bufferToLabelLUT = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    labelToBuffersLUT = v2->_labelToBuffersLUT;
    v2->_labelToBuffersLUT = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    labelToSignpostTypeLUT = v2->_labelToSignpostTypeLUT;
    v2->_labelToSignpostTypeLUT = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    bufferToTimestampLUT = v2->_bufferToTimestampLUT;
    v2->_bufferToTimestampLUT = (NSMutableDictionary *)v9;
  }
  return v2;
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_bufferToLabelLUT count];
}

- (unint64_t)countWithLabel:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_labelToBuffersLUT objectForKey:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)description
{
  uint64_t v3 = objc_opt_new();
  labelToBuffersLUT = self->_labelToBuffersLUT;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__ARBufferPopulationRegistry_description__block_invoke;
  v8[3] = &unk_1E6187D88;
  id v5 = v3;
  id v9 = v5;
  v10 = self;
  [(NSMutableDictionary *)labelToBuffersLUT enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = v5;

  return v6;
}

void __41__ARBufferPopulationRegistry_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v30 = a1;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v6 count];
  uint64_t v9 = [v6 count];
  v10 = @"]";
  if (v9) {
    v10 = &stru_1F120C8F0;
  }
  v28 = v5;
  [v7 appendFormat:@"%@ (%ld): [%@\n", v5, v8, v10];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v6;
  uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v34 != v31) {
          objc_enumerationMutation(obj);
        }
        objc_super v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v13 = [v12 unsignedIntValue];
        IOSurfaceRef v14 = IOSurfaceLookup(v13);
        if (v14)
        {
          v15 = v14;
          [*(id *)(v30 + 40) timestampForSurfaceID:v12];
          uint64_t v17 = v16;
          IOSurfaceLock(v15, 1u, 0);
          BaseAddress = IOSurfaceGetBaseAddress(v15);
          uint64_t UseCount = IOSurfaceGetUseCount(v15);
          size_t Width = IOSurfaceGetWidth(v15);
          size_t Height = IOSurfaceGetHeight(v15);
          OSType PixelFormat = IOSurfaceGetPixelFormat(v15);
          v23 = AROSTypeToString(PixelFormat);
          IOSurfaceGetAllocSize(v15);
          v24 = NSLocalizedFileSizeDescription();
          IOSurfaceUnlock(v15, 1u, 0);
          CFRelease(v15);
          [*(id *)(v30 + 32) appendFormat:@"\tIOSurface [%p] - id: %d (0x%x), rc: %ld, dims: %ldx%ld, format: %@, size: %@, timestamp: %f\n", BaseAddress, v13, v13, UseCount, Width, Height, v23, v24, v17];
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v32);
  }

  v25 = *(void **)(v30 + 32);
  uint64_t v26 = [obj count];
  v27 = @"]\n";
  if (!v26) {
    v27 = &stru_1F120C8F0;
  }
  [v25 appendFormat:@"%@", v27];
}

- (id)labelForBufferWithSurfaceID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_bufferToLabelLUT objectForKey:a3];
}

- (void)registerBufferWithSurfaceID:(id)a3 label:(id)a4 signpostType:(id)a5 timestamp:(double)a6
{
  id v16 = a3;
  id v10 = a4;
  bufferToLabelLUT = self->_bufferToLabelLUT;
  id v12 = a5;
  [(NSMutableDictionary *)bufferToLabelLUT setObject:v10 forKey:v16];
  [(NSMutableDictionary *)self->_labelToSignpostTypeLUT setObject:v12 forKey:v10];

  bufferToTimestampLUT = self->_bufferToTimestampLUT;
  IOSurfaceRef v14 = [NSNumber numberWithDouble:a6];
  [(NSMutableDictionary *)bufferToTimestampLUT setObject:v14 forKey:v16];

  v15 = [(NSMutableDictionary *)self->_labelToBuffersLUT objectForKey:v10];
  if (!v15)
  {
    v15 = objc_opt_new();
    [(NSMutableDictionary *)self->_labelToBuffersLUT setObject:v15 forKey:v10];
  }
  [v15 addObject:v16];
}

- (int)signpostTypeForLabel:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_labelToSignpostTypeLUT objectForKey:a3];
  unint64_t v4 = v3;
  if (v3) {
    int v5 = [v3 unsignedIntegerValue];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (double)timestampForSurfaceID:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_bufferToTimestampLUT objectForKey:a3];
  unint64_t v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (id)surfaceIDsForBuffersWithLabel:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_labelToBuffersLUT objectForKey:a3];
}

- (void)unregisterBufferWithSurfaceID:(id)a3
{
  bufferToLabelLUT = self->_bufferToLabelLUT;
  id v5 = a3;
  id v7 = [(NSMutableDictionary *)bufferToLabelLUT objectForKey:v5];
  [(NSMutableDictionary *)self->_bufferToLabelLUT removeObjectForKey:v5];
  [(NSMutableDictionary *)self->_bufferToTimestampLUT removeObjectForKey:v5];
  double v6 = [(NSMutableDictionary *)self->_labelToBuffersLUT objectForKey:v7];
  [v6 removeObject:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferToTimestampLUT, 0);
  objc_storeStrong((id *)&self->_labelToBuffersLUT, 0);
  objc_storeStrong((id *)&self->_labelToSignpostTypeLUT, 0);
  objc_storeStrong((id *)&self->_bufferToLabelLUT, 0);
}

@end