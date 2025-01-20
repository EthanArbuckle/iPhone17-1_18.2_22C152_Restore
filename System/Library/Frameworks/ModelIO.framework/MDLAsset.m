@interface MDLAsset
+ (BOOL)canExportFileExtension:(NSString *)extension;
+ (BOOL)canImportFileExtension:(NSString *)extension;
+ (NSArray)placeLightProbesWithDensity:(float)value heuristic:(MDLProbePlacement)type usingIrradianceDataSource:(id)dataSource;
- (BOOL)exportAssetToURL:(NSURL *)URL;
- (BOOL)exportAssetToURL:(NSURL *)URL error:(NSError *)error;
- (MDLAnimatedVector3Array)extents;
- (MDLAsset)init;
- (MDLAsset)initWithBufferAllocator:(id)bufferAllocator;
- (MDLAsset)initWithData:(id)a3 name:(id)a4 vertexDescriptor:(id)a5 bufferAllocator:(id)a6 preserveTopology:(BOOL)a7 error:(id *)a8;
- (MDLAsset)initWithURL:(NSURL *)URL;
- (MDLAsset)initWithURL:(NSURL *)URL vertexDescriptor:(MDLVertexDescriptor *)vertexDescriptor bufferAllocator:(id)bufferAllocator;
- (MDLAsset)initWithURL:(NSURL *)URL vertexDescriptor:(MDLVertexDescriptor *)vertexDescriptor bufferAllocator:(id)bufferAllocator preserveTopology:(BOOL)preserveTopology error:(NSError *)error;
- (MDLAsset)initWithURL:(id)a3 bufferAllocator:(id)a4 preserveIndexing:(BOOL)a5 error:(id *)a6;
- (MDLAsset)initWithURL:(id)a3 bufferAllocator:(id)a4 preserveIndexing:(BOOL)a5 options:(id)a6 error:(id *)a7;
- (MDLAsset)initWithURL:(id)a3 options:(id)a4 error:(id *)a5;
- (MDLAxisAlignedBoundingBox)boundingBox;
- (MDLAxisAlignedBoundingBox)boundingBoxAtTime:(SEL)a3;
- (MDLObject)objectAtIndex:(NSUInteger)index;
- (MDLObject)objectAtIndexedSubscript:(NSUInteger)index;
- (MDLObject)objectAtPath:(NSString *)path;
- (MDLVertexDescriptor)vertexDescriptor;
- (NSArray)childObjectsOfClass:(Class)objectClass;
- (NSTimeInterval)endTime;
- (NSTimeInterval)frameInterval;
- (NSTimeInterval)startTime;
- (NSUInteger)count;
- (NSURL)URL;
- (NSURL)_temporaryFolderURL;
- (NSUnitLength)unitLength;
- (double)_timeCodesPerSecond;
- (float)metersPerUnit;
- (id)animations;
- (id)bufferAllocator;
- (id)componentConformingToProtocol:(id)a3;
- (id)components;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initThroughSCNKitBridgeWithURL:(id)a3 options:(id)a4 error:(id)a5;
- (id)initThroughSCNKitBridgeWithURL:(id)a3 preserveTopology:(BOOL)a4 error:(id)a5;
- (id)masters;
- (id)objectForKeyedSubscript:(id)a3;
- (id)objects;
- (id)resolver;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (vector_float3)upAxis;
- (void)_bounds;
- (void)_commonInit;
- (void)_conformVertexBuffers:(id)a3 error:(id *)a4;
- (void)addObject:(MDLObject *)object;
- (void)dealloc;
- (void)enumerateChildObjectsOfClass:(Class)a3 usingBlock:(id)a4 stopPointer:(BOOL *)a5;
- (void)loadTextures;
- (void)removeObject:(MDLObject *)object;
- (void)resolveTextures;
- (void)setAnimations:(id)animations;
- (void)setComponent:(id)a3 forProtocol:(id)a4;
- (void)setEndTime:(NSTimeInterval)endTime;
- (void)setExtents:(id)a3;
- (void)setFrameInterval:(NSTimeInterval)frameInterval;
- (void)setMasters:(id)masters;
- (void)setMetersPerUnit:(float)a3;
- (void)setOriginals:(id)originals;
- (void)setResolver:(id)resolver;
- (void)setStartTime:(NSTimeInterval)startTime;
- (void)setUnitLength:(id)a3;
- (void)setUpAxis:(vector_float3)upAxis;
- (void)set_temporaryFolderURL:(id)a3;
- (void)set_timeCodesPerSecond:(double)a3;
@end

@implementation MDLAsset

- (NSURL)URL
{
  return self->_URL;
}

- (void)setOriginals:(id)originals
{
}

- (void)_bounds
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  a2[1].i64[0] = 0;
  a2[1].i64[1] = 0;
  __asm { FMOV            V0.4S, #-1.0 }
  *a2 = _Q0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = *(id *)(a1 + 16);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v32, v36, 16);
  if (v12)
  {
    uint64_t v13 = *(void *)v33;
    v14 = (long long *)MEMORY[0x263EF89A8];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v8);
        }
        v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v17 = objc_msgSend_transform(v16, v10, v11, v27, v28, v29, v30);
        v20 = v17;
        if (v17)
        {
          objc_msgSend_matrix(v17, v18, v19);
          long long v27 = v21;
          long long v28 = v22;
          long long v29 = v23;
          long long v30 = v24;
        }
        else
        {
          long long v25 = v14[1];
          long long v27 = *v14;
          long long v28 = v25;
          long long v26 = v14[3];
          long long v29 = v14[2];
          long long v30 = v26;
        }
        sub_20B09C2C8(v16, (uint64_t)&v27, v31);
        sub_20B0A2540(a2, v31);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v32, v36, 16);
    }
    while (v12);
  }
}

- (void)setComponent:(id)a3 forProtocol:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  components = self->_components;
  if (!components)
  {
    v9 = (NSMapTable *)objc_opt_new();
    v10 = self->_components;
    self->_components = v9;

    components = self->_components;
  }
  objc_msgSend_setObject_forKey_(components, v6, (uint64_t)v11, v7);
}

- (id)componentConformingToProtocol:(id)a3
{
  v3 = objc_msgSend_objectForKey_(self->_components, a2, (uint64_t)a3);

  return v3;
}

- (id)objectForKeyedSubscript:(id)a3
{
  v3 = objc_msgSend_componentConformingToProtocol_(self, a2, (uint64_t)a3);

  return v3;
}

- (id)components
{
  v3 = objc_msgSend_objectEnumerator(self->_components, a2, v2);
  v6 = objc_msgSend_allObjects(v3, v4, v5);

  return v6;
}

- (NSArray)childObjectsOfClass:(Class)objectClass
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_opt_class();
  if ((objc_msgSend_isSubclassOfClass_(objectClass, v7, v6) & 1) == 0)
  {
    id v8 = (void *)MEMORY[0x263EFF940];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    id v11 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v8, v12, @"ModelIOException", @"[%@ %@]: Requested class must be an MDLObject or a subclass of MDLObject", v10, v11);
  }
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v14 = self;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v21, v25, 16);
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        sub_20B09C8A0((uint64_t)objectClass, *(void **)(*((void *)&v21 + 1) + 8 * i), v13);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v19, (uint64_t)&v21, v25, 16);
    }
    while (v16);
  }

  return (NSArray *)v13;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v7 = objc_msgSend_initWithString_(v3, v4, @"MDLAsset:\n");
  for (unint64_t i = 0; i < objc_msgSend_count(self, v5, v6); ++i)
  {
    v10 = objc_msgSend_objectAtIndexedSubscript_(self, v9, i);
    id v13 = objc_msgSend_recursiveDescription(v10, v11, v12);
    objc_msgSend_appendString_(v7, v14, (uint64_t)v13);
  }

  return v7;
}

- (void)enumerateChildObjectsOfClass:(Class)a3 usingBlock:(id)a4 stopPointer:(BOOL *)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, void *, BOOL *))a4;
  char v35 = 0;
  if (a5) {
    v9 = a5;
  }
  else {
    v9 = (BOOL *)&v35;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v10 = self;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v31, v37, 16);
  if (v12)
  {
    uint64_t v13 = *(void *)v32;
LABEL_6:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v32 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v31 + 1) + 8 * v14);
      if (objc_opt_isKindOfClass()) {
        v8[2](v8, v15, v9);
      }
      if (*v9) {
        break;
      }
      objc_msgSend_enumerateChildObjectsOfClass_root_usingBlock_stopPointer_(v15, v16, (uint64_t)a3, v15, v8, v9);
      if (*v9) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v17, (uint64_t)&v31, v37, 16);
        if (v12) {
          goto LABEL_6;
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    objc_msgSend_masters(v10, v18, v19, 0);
    v10 = (MDLAsset *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v20, (uint64_t)&v27, v36, 16);
    if (v21)
    {
      uint64_t v22 = *(void *)v28;
LABEL_17:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v10);
        }
        long long v24 = *(void **)(*((void *)&v27 + 1) + 8 * v23);
        if (objc_opt_isKindOfClass()) {
          v8[2](v8, v24, v9);
        }
        if (*v9) {
          break;
        }
        objc_msgSend_enumerateChildObjectsOfClass_root_usingBlock_stopPointer_(v24, v25, (uint64_t)a3, v24, v8, v9);
        if (*v9) {
          break;
        }
        if (v21 == ++v23)
        {
          uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v26, (uint64_t)&v27, v36, 16);
          if (v21) {
            goto LABEL_17;
          }
          break;
        }
      }
    }
  }
}

- (void)resolveTextures
{
  char v6 = 0;
  uint64_t v3 = objc_opt_class();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_20B09CE60;
  v5[3] = &unk_263FFDA80;
  v5[4] = self;
  objc_msgSend_enumerateChildObjectsOfClass_usingBlock_stopPointer_(self, v4, v3, v5, &v6);
}

- (void)loadTextures
{
  char v9 = 0;
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v4 = objc_opt_class();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_20B09D088;
  v7[3] = &unk_263FFDAA8;
  v7[4] = self;
  id v5 = v3;
  id v8 = v5;
  objc_msgSend_enumerateChildObjectsOfClass_usingBlock_stopPointer_(self, v6, v4, v7, &v9);
}

- (MDLAxisAlignedBoundingBox)boundingBox
{
  return (MDLAxisAlignedBoundingBox *)objc_msgSend__bounds(self, a3, v3);
}

- (MDLAxisAlignedBoundingBox)boundingBoxAtTime:(SEL)a3
{
  return (MDLAxisAlignedBoundingBox *)objc_msgSend__bounds(self, a3, v4, time);
}

- (NSTimeInterval)startTime
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_class();
  id v5 = objc_msgSend_childObjectsOfClass_(self, v4, v3);
  double startTime = self->_startTime;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v5;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v30, v34, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v31;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = objc_msgSend_transform(*(void **)(*((void *)&v30 + 1) + 8 * v13), v9, v10, (void)v30);
        uint64_t v17 = v14;
        if (v14)
        {
          objc_msgSend_minimumTime(v14, v15, v16);
          double v19 = v18;
          objc_msgSend_maximumTime(v17, v20, v21);
          if (v19 != v24)
          {
            objc_msgSend_minimumTime(v17, v22, v23);
            if (v27 < startTime)
            {
              objc_msgSend_minimumTime(v17, v25, v26);
              double startTime = v28;
            }
          }
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v30, v34, 16);
    }
    while (v11);
  }

  if (startTime == 1.79769313e308) {
    double startTime = 0.0;
  }

  return startTime;
}

- (NSTimeInterval)endTime
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_class();
  id v5 = objc_msgSend_childObjectsOfClass_(self, v4, v3);
  double endTime = self->_endTime;
  long long v31 = 0u;
  long long v32 = 0u;
  if (endTime == 1.79769313e308) {
    double v7 = 0.0;
  }
  else {
    double v7 = endTime;
  }
  long long v33 = 0uLL;
  long long v34 = 0uLL;
  id v8 = v5;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v31, v35, 16);
  if (v12)
  {
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v8);
        }
        v15 = objc_msgSend_transform(*(void **)(*((void *)&v31 + 1) + 8 * i), v10, v11, (void)v31);
        double v18 = v15;
        if (v15)
        {
          objc_msgSend_minimumTime(v15, v16, v17);
          double v20 = v19;
          objc_msgSend_maximumTime(v18, v21, v22);
          if (v20 != v25)
          {
            objc_msgSend_maximumTime(v18, v23, v24);
            if (v28 > v7)
            {
              objc_msgSend_maximumTime(v18, v26, v27);
              double v7 = v29;
            }
          }
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v31, v35, 16);
    }
    while (v12);
  }

  return v7;
}

- (void)setStartTime:(NSTimeInterval)startTime
{
  self->_double startTime = startTime;
}

- (void)setEndTime:(NSTimeInterval)endTime
{
  self->_double endTime = endTime;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  char v6 = objc_msgSend_allocWithZone_(v4, v5, (uint64_t)a3);

  return (id)objc_msgSend_init(v6, v7, v8);
}

+ (BOOL)canExportFileExtension:(NSString *)extension
{
  uint64_t v3 = objc_msgSend_lowercaseString(extension, a2, (uint64_t)extension);
  if ((objc_msgSend_isEqualToString_(v3, v4, @"obj") & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v5, @"stl") & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v6, @"abc") & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v7, @"ply") & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v8, @"usd") & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v9, @"usda") & 1) != 0)
  {
    char isEqualToString = 1;
  }
  else
  {
    char isEqualToString = objc_msgSend_isEqualToString_(v3, v10, @"usdc");
  }

  return isEqualToString;
}

+ (BOOL)canImportFileExtension:(NSString *)extension
{
  uint64_t v3 = objc_msgSend_lowercaseString(extension, a2, (uint64_t)extension);
  if ((objc_msgSend_isEqualToString_(v3, v4, @"abc") & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v5, @"usd") & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v6, @"usda") & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v7, @"usdc") & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v8, @"usdz") & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v9, @"obj") & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v10, @"ply") & 1) != 0)
  {
    char isEqualToString = 1;
  }
  else
  {
    char isEqualToString = objc_msgSend_isEqualToString_(v3, v11, @"stl");
  }

  return isEqualToString;
}

- (void)_commonInit
{
  uint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  objects = self->_objects;
  self->_objects = v3;

  id v5 = objc_alloc_init(MDLObjectContainer);
  masters = self->_masters;
  self->_masters = (MDLObjectContainerComponent *)v5;

  double v7 = objc_alloc_init(MDLObjectContainer);
  animations = self->_animations;
  self->_animations = (MDLObjectContainerComponent *)v7;

  char v9 = [MDLRelativeAssetResolver alloc];
  uint64_t v11 = (MDLAssetResolver *)objc_msgSend_initWithAsset_(v9, v10, (uint64_t)self);
  resolver = self->_resolver;
  self->_resolver = v11;

  *(int64x2_t *)&self->_double startTime = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  self->__timeCodesPerSecond = 60.0;
  temporaryFolderURL = self->_temporaryFolderURL;
  self->_temporaryFolderURL = 0;

  objc_msgSend_meters(MEMORY[0x263F08CE8], v14, v15);
  uint64_t v16 = (NSUnitLength *)objc_claimAutoreleasedReturnValue();
  unitLength = self->_unitLength;
  self->_unitLength = v16;

  *(_OWORD *)self->_upAxis = xmmword_20B1E74C0;
  self->_metersPerUnit = 0.01;
  extents = self->_extents;
  self->_extents = 0;
}

- (MDLAsset)init
{
  v11.receiver = self;
  v11.super_class = (Class)MDLAsset;
  uint64_t v2 = [(MDLAsset *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(MDLMeshBufferDataAllocator);
    bufferAllocator = v2->_bufferAllocator;
    v2->_bufferAllocator = (MDLMeshBufferAllocator *)v3;

    objc_msgSend__commonInit(v2, v5, v6);
    sub_20B184490(0, v7, v8);
    char v9 = v2;
  }

  return v2;
}

- (void)dealloc
{
  if (self->_temporaryFolderURL)
  {
    uint64_t v4 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, v2);
    temporaryFolderURL = self->_temporaryFolderURL;
    id v13 = 0;
    char v7 = objc_msgSend_removeItemAtURL_error_(v4, v6, (uint64_t)temporaryFolderURL, &v13);
    id v8 = v13;

    if ((v7 & 1) == 0)
    {
      objc_super v11 = objc_msgSend_path(self->_temporaryFolderURL, v9, v10);
      NSLog(&cfstr_FailedToRemove.isa, v11);
    }
  }
  else
  {
    id v8 = 0;
  }

  v12.receiver = self;
  v12.super_class = (Class)MDLAsset;
  [(MDLAsset *)&v12 dealloc];
}

- (MDLAsset)initWithBufferAllocator:(id)bufferAllocator
{
  id v4 = bufferAllocator;
  v14.receiver = self;
  v14.super_class = (Class)MDLAsset;
  id v5 = [(MDLAsset *)&v14 init];
  if (v5)
  {
    if (v4) {
      uint64_t v6 = (MDLMeshBufferDataAllocator *)v4;
    }
    else {
      uint64_t v6 = objc_alloc_init(MDLMeshBufferDataAllocator);
    }
    char v7 = v5->_bufferAllocator;
    v5->_bufferAllocator = (MDLMeshBufferAllocator *)v6;

    objc_msgSend__commonInit(v5, v8, v9);
    sub_20B184490(v4 != 0, v10, v11);
    objc_super v12 = v5;
  }

  return v5;
}

- (void)_conformVertexBuffers:(id)a3 error:(id *)a4
{
  uint64_t v160 = *MEMORY[0x263EF8340];
  obunint64_t j = a3;
  id v4 = a3;
  char v7 = v4;
  if (v4)
  {
    long long v156 = 0u;
    long long v157 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    objc_msgSend_layouts(v4, v5, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v154, v159, 16);
    if (!v12)
    {
LABEL_40:

      goto LABEL_41;
    }
    int v13 = 0;
    uint64_t v14 = *(void *)v155;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v155 != v14) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend_stride(*(void **)(*((void *)&v154 + 1) + 8 * i), v10, v11, obj)) {
          ++v13;
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v154, v159, 16);
    }
    while (v12);

    if (v13)
    {
      if (!self->_bufferAllocator)
      {
        double v18 = objc_alloc_init(MDLMeshBufferDataAllocator);
        bufferAllocator = self->_bufferAllocator;
        self->_bufferAllocator = (MDLMeshBufferAllocator *)v18;
      }
      double v20 = objc_msgSend_layouts(v7, v16, v17);
      uint64_t v23 = objc_msgSend_count(v20, v21, v22);
      p_vertexDescriptor = (void **)&self->_vertexDescriptor;
      uint64_t v27 = objc_msgSend_layouts(self->_vertexDescriptor, v25, v26);
      int v30 = v23 != objc_msgSend_count(v27, v28, v29);

      for (unint64_t j = 0; ; ++j)
      {
        long long v34 = objc_msgSend_layouts(v7, v31, v32);
        BOOL v37 = objc_msgSend_count(v34, v35, v36) <= j;

        if ((v37 | v30)) {
          break;
        }
        v40 = objc_msgSend_layouts(v7, v38, v39);
        v42 = objc_msgSend_objectAtIndexedSubscript_(v40, v41, j);
        uint64_t v45 = objc_msgSend_stride(v42, v43, v44);
        v48 = objc_msgSend_layouts(*p_vertexDescriptor, v46, v47);
        v50 = objc_msgSend_objectAtIndexedSubscript_(v48, v49, j);
        int v30 = v45 != objc_msgSend_stride(v50, v51, v52);
      }
      for (unint64_t k = 0; ; ++k)
      {
        v54 = objc_msgSend_attributes(v7, v38, v39);
        BOOL v57 = objc_msgSend_count(v54, v55, v56) <= k;

        if ((v57 | v30)) {
          break;
        }
        v60 = objc_msgSend_attributes(v7, v58, v59);
        v62 = objc_msgSend_objectAtIndexedSubscript_(v60, v61, k);
        v65 = objc_msgSend_name(v62, v63, v64);
        v68 = objc_msgSend_attributes(*p_vertexDescriptor, v66, v67);
        v70 = objc_msgSend_objectAtIndexedSubscript_(v68, v69, k);
        v73 = objc_msgSend_name(v70, v71, v72);
        int isEqualToString = objc_msgSend_isEqualToString_(v65, v74, (uint64_t)v73);

        v78 = objc_msgSend_attributes(v7, v76, v77);
        v80 = objc_msgSend_objectAtIndexedSubscript_(v78, v79, k);
        uint64_t v83 = objc_msgSend_format(v80, v81, v82);
        v86 = objc_msgSend_attributes(*p_vertexDescriptor, v84, v85);
        v88 = objc_msgSend_objectAtIndexedSubscript_(v86, v87, k);
        if (v83 == objc_msgSend_format(v88, v89, v90)) {
          int v30 = isEqualToString ^ 1;
        }
        else {
          int v30 = 1;
        }

        v93 = objc_msgSend_attributes(v7, v91, v92);
        v95 = objc_msgSend_objectAtIndexedSubscript_(v93, v94, k);
        uint64_t v98 = objc_msgSend_offset(v95, v96, v97);
        v101 = objc_msgSend_attributes(*p_vertexDescriptor, v99, v100);
        v103 = objc_msgSend_objectAtIndexedSubscript_(v101, v102, k);
        if (v98 != objc_msgSend_offset(v103, v104, v105)) {
          int v30 = 1;
        }

        v108 = objc_msgSend_attributes(v7, v106, v107);
        v110 = objc_msgSend_objectAtIndexedSubscript_(v108, v109, k);
        uint64_t v113 = objc_msgSend_bufferIndex(v110, v111, v112);
        v116 = objc_msgSend_attributes(*p_vertexDescriptor, v114, v115);
        v118 = objc_msgSend_objectAtIndexedSubscript_(v116, v117, k);
        if (v113 != objc_msgSend_bufferIndex(v118, v119, v120)) {
          int v30 = 1;
        }

        v123 = objc_msgSend_attributes(v7, v121, v122);
        v125 = objc_msgSend_objectAtIndexedSubscript_(v123, v124, k);
        objc_msgSend_time(v125, v126, v127);
        double v129 = v128;
        v132 = objc_msgSend_attributes(*p_vertexDescriptor, v130, v131);
        v134 = objc_msgSend_objectAtIndexedSubscript_(v132, v133, k);
        objc_msgSend_time(v134, v135, v136);
        if (v129 != v137) {
          int v30 = 1;
        }
      }
      if (v30)
      {
        uint64_t v138 = objc_opt_class();
        objc_msgSend_childObjectsOfClass_(self, v139, v138);
        long long v152 = 0u;
        long long v153 = 0u;
        long long v150 = 0u;
        long long v151 = 0u;
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v140, (uint64_t)&v150, v158, 16);
        if (v141)
        {
          uint64_t v142 = *(void *)v151;
          do
          {
            for (uint64_t m = 0; m != v141; ++m)
            {
              if (*(void *)v151 != v142) {
                objc_enumerationMutation(v8);
              }
              id v144 = *(id *)(*((void *)&v150 + 1) + 8 * m);
              v146 = v144;
              if (v144) {
                objc_msgSend_setVertexDescriptor_(v144, v145, (uint64_t)v7);
              }
            }
            uint64_t v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v147, (uint64_t)&v150, v158, 16);
          }
          while (v141);
        }

        objc_storeStrong(p_vertexDescriptor, obj);
        goto LABEL_40;
      }
    }
  }
LABEL_41:
}

- (MDLAsset)initWithData:(id)a3 name:(id)a4 vertexDescriptor:(id)a5 bufferAllocator:(id)a6 preserveTopology:(BOOL)a7 error:(id *)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v68.receiver = self;
  v68.super_class = (Class)MDLAsset;
  double v19 = [(MDLAsset *)&v68 init];
  if (!v19) {
    goto LABEL_33;
  }
  id v56 = v15;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  *(_OWORD *)v65 = 0u;
  HIDWORD(v64) = 1070141403;
  LOBYTE(v65[0]) = 1;
  WORD1(v65[0]) = 256;
  HIDWORD(v65[0]) = 1078530011;
  *(_OWORD *)obunint64_t j = 0u;
  sub_20B07F8E0(&v65[1], "");
  long long v67 = 0uLL;
  if (v18) {
    objc_storeStrong((id *)&v64, a6);
  }
  if (v17) {
    objc_storeStrong(&obj[1], a5);
  }
  LOBYTE(obj[0]) = a7;
  if ((void)v64) {
    double v20 = (MDLMeshBufferAllocator *)(id)v64;
  }
  else {
    double v20 = (MDLMeshBufferAllocator *)objc_opt_new();
  }
  bufferAllocator = v19->_bufferAllocator;
  v19->_bufferAllocator = v20;

  *(_OWORD *)v19->_upAxis = xmmword_20B1E74C0;
  v19->_metersPerUnit = 0.01;
  objc_msgSend__commonInit(v19, v22, v23);
  uint64_t v26 = objc_msgSend_pathExtension(v16, v24, v25);
  uint64_t v29 = objc_msgSend_lowercaseString(v26, v27, v28);

  if (!objc_msgSend_isEqualToString_(v29, v30, @"usdz"))
  {
    if (a8)
    {
      uint64_t v35 = NSString;
      uint64_t v36 = (objc_class *)objc_opt_class();
      BOOL v37 = NSStringFromClass(v36);
      uint64_t v38 = NSStringFromSelector(a2);
      v40 = objc_msgSend_stringWithFormat_(v35, v39, @"[%@ %@]: only accepts usdz file", v37, v38);

      sub_20B09E1E4(v40);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v41 = 0;
    id v15 = v56;
    goto LABEL_30;
  }
  uint64_t v62 = 0;
  memset(v61, 0, sizeof(v61));
  sub_20B149490(v61, 0);
  if (obj[1])
  {
    if (sub_20B09E2D8(obj[1], v31, v32))
    {
      long long v33 = (MDLVertexDescriptor *)obj[1];
      vertexDescriptor = v19->_vertexDescriptor;
      v19->_vertexDescriptor = v33;
    }
    else
    {
      NSLog(&cfstr_WarningNoValid.isa);
      vertexDescriptor = v19->_vertexDescriptor;
      v19->_vertexDescriptor = 0;
    }
  }
  uint64_t v42 = objc_msgSend_centimeters(MEMORY[0x263F08CE8], v31, v32);
  unitLength = v19->_unitLength;
  v19->_unitLength = (NSUnitLength *)v42;

  __p = 0;
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  sub_20B149F80(v16, v15, (uint64_t)obj, v19, &__p);
  uint64_t v45 = HIBYTE(v60);
  if (v60 < 0) {
    uint64_t v45 = v59;
  }
  if (!v45)
  {
    v50 = 0;
    goto LABEL_35;
  }
  id v46 = [NSString alloc];
  if (v60 >= 0) {
    v48 = objc_msgSend_initWithUTF8String_(v46, v47, (uint64_t)&__p);
  }
  else {
    v48 = objc_msgSend_initWithUTF8String_(v46, v47, (uint64_t)__p);
  }
  v49 = v48;
  sub_20B09E1E4(v48);
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (!v41)
  {
LABEL_35:
    id v53 = obj[1];
    if (!obj[1])
    {
      objc_storeStrong(&obj[1], v19->_vertexDescriptor);
      id v53 = obj[1];
    }
    id v57 = 0;
    objc_msgSend__conformVertexBuffers_error_(v19, v44, (uint64_t)v53, &v57);
    id v41 = v57;
    objc_storeStrong((id *)&v19->_vertexDescriptor, obj[1]);
    if (!v41)
    {
      objc_msgSend_resolveTextures(v19, v54, v55);
      id v41 = 0;
    }
    v49 = v50;
    if (!a8) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (a8) {
LABEL_26:
  }
    *a8 = v41;
LABEL_27:

  if (SHIBYTE(v60) < 0) {
    operator delete(__p);
  }
  sub_20B149508(v61);
LABEL_30:
  v51 = v19;

  if (SHIBYTE(v66) < 0) {
    operator delete(v65[1]);
  }

LABEL_33:
  return v19;
}

- (MDLAsset)initWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v177.receiver = self;
  v177.super_class = (Class)MDLAsset;
  uint64_t v11 = [(MDLAsset *)&v177 init];
  if (!v11) {
    goto LABEL_129;
  }
  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  HIDWORD(v173) = 1070141403;
  LOBYTE(v174) = 1;
  WORD1(v174) = 256;
  DWORD1(v174) = 1078530011;
  long long v172 = 0u;
  sub_20B07F8E0((void *)&v174 + 1, "");
  long long v176 = 0uLL;
  sub_20B09E3F4(v10, (uint64_t)&v172);
  p_URL = (const __CFURL **)&v11->_URL;
  objc_storeStrong((id *)&v11->_URL, a3);
  if ((void)v173) {
    int v13 = (MDLMeshBufferAllocator *)(id)v173;
  }
  else {
    int v13 = (MDLMeshBufferAllocator *)objc_opt_new();
  }
  bufferAllocator = v11->_bufferAllocator;
  v11->_bufferAllocator = v13;

  objc_msgSend__commonInit(v11, v15, v16);
  CFURLRef v19 = *p_URL;
  if (!*p_URL) {
    goto LABEL_125;
  }
  memset(&__str, 0, sizeof(__str));
  uint64_t v136 = (uint64_t)v9;
  objc_msgSend_path(v19, v17, v18);
  id v20 = objc_claimAutoreleasedReturnValue();
  uint64_t v22 = (char *)objc_msgSend_cStringUsingEncoding_(v20, v21, 4);
  sub_20B07F8E0(&__str, v22);

  std::string::size_type v23 = std::string::rfind(&__str, 46, 0xFFFFFFFFFFFFFFFFLL);
  long long v169 = 0uLL;
  uint64_t v170 = 0;
  if (v23 == -1)
  {
    uint64_t v34 = *((void *)&v172 + 1);
    uint64_t v35 = v173;
    objc_msgSend_stringWithUTF8String_(NSString, v24, (uint64_t)&v169);
  }
  else
  {
    std::string::basic_string((std::string *)v139, &__str, v23 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v162);
    if (SHIBYTE(v170) < 0) {
      operator delete((void *)v169);
    }
    long long v169 = *(_OWORD *)v139;
    uint64_t v170 = *(void *)&v139[16];
    int v26 = v139[23];
    uint64_t v27 = *(void *)&v139[8];
    if (v139[23] >= 0) {
      uint64_t v27 = HIBYTE(v170);
    }
    if (v27)
    {
      unint64_t v28 = 0;
      unsigned int v29 = v139[23] >> 31;
      do
      {
        if (v29) {
          int v30 = (long long *)v169;
        }
        else {
          int v30 = &v169;
        }
        char v31 = __toupper(*((char *)v30 + v28));
        if (v170 >= 0) {
          uint64_t v32 = &v169;
        }
        else {
          uint64_t v32 = (long long *)v169;
        }
        *((unsigned char *)v32 + v28++) = v31;
        unsigned int v29 = SHIBYTE(v170) >> 31;
        unint64_t v33 = *((void *)&v169 + 1);
        if (v170 >= 0) {
          unint64_t v33 = HIBYTE(v170);
        }
      }
      while (v28 < v33);
      int v26 = SHIBYTE(v170);
    }
    uint64_t v34 = *((void *)&v172 + 1);
    uint64_t v35 = v173;
    if (v26 >= 0) {
      objc_msgSend_stringWithUTF8String_(NSString, v25, (uint64_t)&v169);
    }
    else {
      objc_msgSend_stringWithUTF8String_(NSString, v25, v169);
    }
  uint64_t v36 = };
  sub_20B18407C(v36, v35 != 0, v34 != 0, v11->_isSceneKitBridged);

  if ((SHIBYTE(v170) & 0x80000000) == 0)
  {
    if (SHIBYTE(v170) == 3)
    {
      BOOL v37 = (unsigned __int16 *)&v169;
      goto LABEL_32;
    }
LABEL_36:
    id v137 = 0;
    int v41 = 1;
    goto LABEL_37;
  }
  if (*((void *)&v169 + 1) != 3) {
    goto LABEL_36;
  }
  BOOL v37 = (unsigned __int16 *)v169;
LABEL_32:
  int v38 = *v37;
  int v39 = *((unsigned __int8 *)v37 + 2);
  if (v38 != 21587 || v39 != 76) {
    goto LABEL_36;
  }
  id v58 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v59 = (uint64_t)*p_URL;
  id v168 = 0;
  id v137 = (id)objc_msgSend_initWithContentsOfURL_options_error_(v58, v60, v59, 3, &v168);
  id v61 = v168;
  v63 = v61;
  if (v61)
  {
    NSLog(&stru_26BF52E70.isa, v61);
  }
  else
  {
    if (v137)
    {
      int v41 = 1;
      goto LABEL_82;
    }
    v111 = objc_msgSend_stringWithFormat_(NSString, v62, @"Could not load data from %@", *p_URL);
    NSLog(&stru_26BF52E70.isa, v111);
  }
  int v41 = 0;
LABEL_82:

LABEL_37:
  uint64_t v162 = 0;
  v163 = &v162;
  uint64_t v164 = 0x3032000000;
  v165 = sub_20B09FD00;
  v166 = sub_20B09FD10;
  id v167 = 0;
  if (sub_20B09ED34(*p_URL)) {
    byte_267691098 = 1;
  }
  uint64_t v44 = (void *)sandbox_extension_issue_file();
  uint64_t v45 = NSString;
  if (!v44)
  {
    id v53 = objc_msgSend_path(*p_URL, v42, v43);
    uint64_t v55 = objc_msgSend_stringWithFormat_(v45, v54, @"Unable to issue extension for path %@", v53);
    id v56 = (void *)v163[5];
    v163[5] = v55;

    sub_20B09E1E4((void *)v163[5]);
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    id v46 = 0;
    NSLog(&stru_26BF52E70.isa, v163[5]);
    goto LABEL_113;
  }
  id v46 = objc_msgSend_stringWithCString_encoding_(NSString, v42, (uint64_t)v44, 4);
  free(v44);
  if (v41)
  {
    v48 = (void *)MEMORY[0x210532AA0]();
    uint64_t v158 = 0;
    v159 = &v158;
    uint64_t v160 = *(void *)"";
    char v161 = 0;
    int v49 = HIBYTE(v170);
    if (v170 < 0)
    {
      if (*((void *)&v169 + 1) != 3)
      {
LABEL_72:
        if (SHIBYTE(v170) < 0)
        {
          if (*((void *)&v169 + 1) == 3)
          {
            v84 = (unsigned __int16 *)v169;
            if (*(_WORD *)v169 != 16975 || *(unsigned char *)(v169 + 2) != 74)
            {
LABEL_88:
              int v86 = *v84;
              int v87 = *((unsigned __int8 *)v84 + 2);
              if (v86 == 21333 && v87 == 68) {
                goto LABEL_96;
              }
              goto LABEL_92;
            }
LABEL_130:
            *(void *)&long long v141 = 0;
            long long v140 = 0u;
            memset(v139, 0, sizeof(v139));
            sub_20B074DB8((uint64_t)v139, 0);
            uint64_t v152 = 0;
            uint64_t v153 = 0;
            __p = 0;
            sub_20B074E9C((uint64_t)v139, v11->_URL, (unsigned __int8 *)&v172, v11, &__p);
            uint64_t v105 = HIBYTE(v153);
            char v106 = HIBYTE(v153);
            if (v153 < 0) {
              uint64_t v105 = v152;
            }
            if (v105)
            {
              id v107 = [NSString alloc];
              if (v153 >= 0) {
                uint64_t v109 = objc_msgSend_initWithUTF8String_(v107, v108, (uint64_t)&__p);
              }
              else {
                uint64_t v109 = objc_msgSend_initWithUTF8String_(v107, v108, (uint64_t)__p);
              }
              v110 = (void *)v163[5];
              v163[5] = v109;

              char v106 = HIBYTE(v153);
            }
            if (v106 < 0) {
              operator delete(__p);
            }
            sub_20B074E60((uint64_t)v139);
            goto LABEL_111;
          }
LABEL_92:
          if (sub_20B06DC90(&v169, "USDA")
            || sub_20B06DC90(&v169, "USDC")
            || sub_20B06DC90(&v169, "USDZ")
            || sub_20B06DC90(&v169, "ABC"))
          {
LABEL_96:
            *(void *)&long long v141 = 0;
            long long v140 = 0u;
            memset(v139, 0, sizeof(v139));
            sub_20B149490(v139, 0);
            if (*((void *)&v172 + 1))
            {
              if (sub_20B09E2D8(*((void **)&v172 + 1), v89, v90))
              {
                v91 = (MDLVertexDescriptor *)*((id *)&v172 + 1);
                vertexDescriptor = v11->_vertexDescriptor;
                v11->_vertexDescriptor = v91;
              }
              else
              {
                NSLog(&cfstr_WarningNoValid.isa);
                vertexDescriptor = v11->_vertexDescriptor;
                v11->_vertexDescriptor = 0;
              }
            }
            uint64_t v93 = objc_msgSend_centimeters(MEMORY[0x263F08CE8], v89, v90);
            unitLength = v11->_unitLength;
            v11->_unitLength = (NSUnitLength *)v93;

            uint64_t v152 = 0;
            uint64_t v153 = 0;
            __p = 0;
            sub_20B14B064(v11->_URL, (uint64_t)&v172, v11, &__p);
            uint64_t v95 = HIBYTE(v153);
            char v96 = HIBYTE(v153);
            if (v153 < 0) {
              uint64_t v95 = v152;
            }
            if (v95)
            {
              id v97 = [NSString alloc];
              if (v153 >= 0) {
                uint64_t v99 = objc_msgSend_initWithUTF8String_(v97, v98, (uint64_t)&__p);
              }
              else {
                uint64_t v99 = objc_msgSend_initWithUTF8String_(v97, v98, (uint64_t)__p);
              }
              uint64_t v100 = (void *)v163[5];
              v163[5] = v99;

              char v96 = HIBYTE(v153);
            }
            if (v96 < 0) {
              operator delete(__p);
            }
            sub_20B149508(v139);
            goto LABEL_111;
          }
          if (sub_20B06DC90(&v169, "PLY") && !*((unsigned char *)v159 + 24))
          {
            uint64_t v150 = 0;
            long long v148 = 0u;
            long long v149 = 0u;
            long long v146 = 0u;
            long long v147 = 0u;
            long long v144 = 0u;
            long long v145 = 0u;
            long long v142 = 0u;
            long long v143 = 0u;
            long long v140 = 0u;
            long long v141 = 0u;
            memset(v139, 0, sizeof(v139));
            sub_20B106500(v139, 0);
            uint64_t v152 = 0;
            uint64_t v153 = 0;
            __p = 0;
            sub_20B109D84((uint64_t *)v139, v11->_URL, v11, &__p);
            uint64_t v122 = HIBYTE(v153);
            char v123 = HIBYTE(v153);
            if (v153 < 0) {
              uint64_t v122 = v152;
            }
            if (v122)
            {
              id v124 = [NSString alloc];
              if (v153 >= 0) {
                uint64_t v126 = objc_msgSend_initWithUTF8String_(v124, v125, (uint64_t)&__p);
              }
              else {
                uint64_t v126 = objc_msgSend_initWithUTF8String_(v124, v125, (uint64_t)__p);
              }
              uint64_t v127 = (void *)v163[5];
              v163[5] = v126;

              char v123 = HIBYTE(v153);
            }
            if (v123 < 0) {
              operator delete(__p);
            }
            sub_20B1065E0(v139);
          }
          else if (sub_20B06DC90(&v169, "STL") && !*((unsigned char *)v159 + 24))
          {
            if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              p_str = &__str;
            }
            else {
              p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
            }
            id v129 = v137;
            unint64_t v132 = objc_msgSend_bytes(v129, v130, v131);
            unint64_t v135 = objc_msgSend_length(v129, v133, v134);
            sub_20B0A8F98((uint64_t)p_str, v132, v135, v11);
          }
          else if (sub_20B06DC90(&v169, "IES"))
          {
            uint64_t v112 = [MDLPhotometricLight alloc];
            v114 = objc_msgSend_initWithIESProfile_(v112, v113, v136);
            objc_msgSend_generateCubemapFromLight_(v114, v115, 128);
            objc_msgSend_generateSphericalHarmonicsFromLight_(v114, v116, 3);
            objc_msgSend_addObject_(v11, v117, (uint64_t)v114);
          }
          else
          {
            id v118 = [NSString alloc];
            uint64_t v120 = objc_msgSend_initWithFormat_(v118, v119, @"Could not load asset with unknown extension from %@", *p_URL);
            v121 = (void *)v163[5];
            v163[5] = v120;
          }
LABEL_111:
          _Block_object_dispose(&v158, 8);
          v101 = (void *)v163[5];
          if (v101)
          {
            sub_20B09E1E4(v101);
            id v57 = (id)objc_claimAutoreleasedReturnValue();
            NSLog(&stru_26BF52E70.isa, v163[5]);
LABEL_113:
            if (v57) {
              goto LABEL_117;
            }
            goto LABEL_114;
          }
          goto LABEL_114;
        }
        int v49 = HIBYTE(v170);
LABEL_74:
        if (v49 == 3)
        {
          if ((unsigned __int16)v169 != 16975 || BYTE2(v169) != 74)
          {
            v84 = (unsigned __int16 *)&v169;
            goto LABEL_88;
          }
          goto LABEL_130;
        }
        goto LABEL_92;
      }
      uint64_t v52 = (unsigned __int16 *)v169;
      BOOL v64 = *(_WORD *)v169 == 16975 && *(unsigned char *)(v169 + 2) == 74;
      if (v64 || (*(_WORD *)v169 == 19536 ? (BOOL v65 = *(unsigned char *)(v169 + 2) == 89) : (BOOL v65 = 0), v65))
      {
LABEL_70:
        if ((byte_267691098 & 1) == 0)
        {
          id v69 = objc_alloc(MEMORY[0x263F08D68]);
          v71 = objc_msgSend_initWithServiceName_(v69, v70, @"com.apple.ModelIO.AssetLoader");
          v73 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v72, (uint64_t)&unk_26BF67F78);
          objc_msgSend_setRemoteObjectInterface_(v71, v74, (uint64_t)v73);

          v157[0] = MEMORY[0x263EF8330];
          v157[1] = 3221225472;
          v157[2] = sub_20B09FD18;
          v157[3] = &unk_263FFDAD0;
          v157[4] = &v158;
          objc_msgSend_setInterruptionHandler_(v71, v75, (uint64_t)v157);
          v156[0] = MEMORY[0x263EF8330];
          v156[1] = 3221225472;
          v156[2] = sub_20B09FD54;
          v156[3] = &unk_263FFDAD0;
          v156[4] = &v158;
          objc_msgSend_setInvalidationHandler_(v71, v76, (uint64_t)v156);
          objc_msgSend_resume(v71, v77, v78);
          v155[0] = MEMORY[0x263EF8330];
          v155[1] = 3221225472;
          v155[2] = sub_20B09FD90;
          v155[3] = &unk_263FFDAF8;
          v155[4] = &v162;
          v155[5] = &v158;
          v80 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v71, v79, (uint64_t)v155);
          CFURLRef v81 = *p_URL;
          v154[0] = MEMORY[0x263EF8330];
          v154[1] = 3221225472;
          v154[2] = sub_20B09FE24;
          v154[3] = &unk_263FFDB20;
          v154[4] = &v162;
          v154[5] = &v158;
          objc_msgSend_loadURL_extensionToken_withReply_(v80, v82, (uint64_t)v81, v46, v154);

          if (*((unsigned char *)v159 + 24)) {
            goto LABEL_111;
          }
        }
        goto LABEL_72;
      }
    }
    else
    {
      if (HIBYTE(v170) != 3) {
        goto LABEL_74;
      }
      if ((unsigned __int16)v169 == 16975 && BYTE2(v169) == 74) {
        goto LABEL_70;
      }
      if ((unsigned __int16)v169 == 19536 && BYTE2(v169) == 89) {
        goto LABEL_70;
      }
      uint64_t v52 = (unsigned __int16 *)&v169;
    }
    int v66 = *v52;
    int v67 = *((unsigned __int8 *)v52 + 2);
    if (v66 != 21587 || v67 != 76) {
      goto LABEL_72;
    }
    goto LABEL_70;
  }
LABEL_114:
  uint64_t v102 = *((void *)&v172 + 1);
  if (!*((void *)&v172 + 1))
  {
    objc_storeStrong((id *)&v172 + 1, v11->_vertexDescriptor);
    uint64_t v102 = *((void *)&v172 + 1);
  }
  id v138 = 0;
  objc_msgSend__conformVertexBuffers_error_(v11, v47, v102, &v138);
  id v57 = v138;
  objc_storeStrong((id *)&v11->_vertexDescriptor, *((id *)&v172 + 1));
LABEL_117:
  if (a5) {
    *a5 = v57;
  }

  _Block_object_dispose(&v162, 8);
  if (SHIBYTE(v170) < 0) {
    operator delete((void *)v169);
  }
  id v9 = (id)v136;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__str.__r_.__value_.__l.__data_);
    if (!v57)
    {
LABEL_125:
      objc_msgSend_resolveTextures(v11, v17, v18);
      id v57 = 0;
    }
  }
  else if (!v57)
  {
    goto LABEL_125;
  }
  v103 = v11;

  if (SHIBYTE(v175) < 0) {
    operator delete(*((void **)&v174 + 1));
  }

LABEL_129:
  return v11;
}

- (MDLAsset)initWithURL:(NSURL *)URL vertexDescriptor:(MDLVertexDescriptor *)vertexDescriptor bufferAllocator:(id)bufferAllocator preserveTopology:(BOOL)preserveTopology error:(NSError *)error
{
  BOOL v8 = preserveTopology;
  uint64_t v12 = URL;
  int v13 = vertexDescriptor;
  id v14 = bufferAllocator;
  id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v17 = objc_msgSend_numberWithBool_(NSNumber, v16, v8);
  objc_msgSend_setObject_forKeyedSubscript_(v15, v18, (uint64_t)v17, @"kMDLAssetPreserveTopology");

  if (v14) {
    objc_msgSend_setObject_forKey_(v15, v19, (uint64_t)v14, @"kMDLAssetBufferAllocator");
  }
  if (v13) {
    objc_msgSend_setObject_forKey_(v15, v19, (uint64_t)v13, @"kMDLAssetVertexDescriptor");
  }
  id v20 = (MDLAsset *)objc_msgSend_initWithURL_options_error_(self, v19, (uint64_t)v12, v15, error);

  return v20;
}

- (MDLAsset)initWithURL:(NSURL *)URL
{
  return (MDLAsset *)objc_msgSend_initWithURL_vertexDescriptor_bufferAllocator_preserveTopology_error_(self, a2, (uint64_t)URL, 0, 0, 0, 0);
}

- (MDLAsset)initWithURL:(NSURL *)URL vertexDescriptor:(MDLVertexDescriptor *)vertexDescriptor bufferAllocator:(id)bufferAllocator
{
  return (MDLAsset *)objc_msgSend_initWithURL_vertexDescriptor_bufferAllocator_preserveTopology_error_(self, a2, (uint64_t)URL, vertexDescriptor, bufferAllocator, 0, 0);
}

- (id)initThroughSCNKitBridgeWithURL:(id)a3 preserveTopology:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  v18[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v17 = @"kMDLAssetPreserveTopology";
  uint64_t v11 = objc_msgSend_numberWithBool_(NSNumber, v10, v6);
  v18[0] = v11;
  int v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)v18, &v17, 1);
  inited = objc_msgSend_initThroughSCNKitBridgeWithURL_options_error_(self, v14, (uint64_t)v8, v13, v9);

  return inited;
}

- (id)initThroughSCNKitBridgeWithURL:(id)a3 options:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  self->_isSceneKitBridged = 1;
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v9, v11, @"kMDLAssetPreserveTopology");
  int v15 = objc_msgSend_BOOLValue(v12, v13, v14);

  if (v15)
  {
    id v24 = v10;
    id v17 = &v24;
    uint64_t v18 = objc_msgSend_initWithURL_bufferAllocator_preserveIndexing_options_error_(self, v16, (uint64_t)v8, 0, 1, v9, &v24);
  }
  else
  {
    id v23 = v10;
    id v17 = &v23;
    uint64_t v18 = objc_msgSend_initWithURL_vertexDescriptor_bufferAllocator_preserveTopology_error_(self, v16, (uint64_t)v8, 0, 0, 0, &v23);
  }
  CFURLRef v19 = (void *)v18;
  id v20 = *v17;

  id v21 = v19;
  return v21;
}

- (MDLAsset)initWithURL:(id)a3 bufferAllocator:(id)a4 preserveIndexing:(BOOL)a5 error:(id *)a6
{
  return (MDLAsset *)objc_msgSend_initWithURL_bufferAllocator_preserveIndexing_options_error_(self, a2, (uint64_t)a3, a4, a5, 0, a6);
}

- (MDLAsset)initWithURL:(id)a3 bufferAllocator:(id)a4 preserveIndexing:(BOOL)a5 options:(id)a6 error:(id *)a7
{
  BOOL v8 = a5;
  id v12 = a3;
  id v55 = a4;
  id v54 = a6;
  memset(&v70, 0, sizeof(v70));
  sub_20B0A0000(v12, v13, v14, &v70);
  uint64_t v15 = 0;
  uint64_t v16 = HIBYTE(v70.__r_.__value_.__r.__words[2]);
  long long v17 = *(_OWORD *)&v70.__r_.__value_.__l.__data_;
  while (1)
  {
    size_t v18 = strlen(off_263FFDB40[v15]);
    size_t v20 = v18;
    if ((v16 & 0x80) != 0) {
      break;
    }
    if (v18 == v16)
    {
      id v21 = &v70;
      goto LABEL_7;
    }
LABEL_8:
    if (++v15 == 4)
    {
      id v23 = v54;
      uint64_t v22 = v55;
      id v24 = (MDLAsset *)(id)objc_msgSend_initWithURL_vertexDescriptor_bufferAllocator_preserveTopology_error_(self, v19, (uint64_t)v12, 0, v55, v8, a7);
LABEL_10:
      uint64_t v25 = 0;
      goto LABEL_11;
    }
  }
  if (v18 != *((void *)&v17 + 1)) {
    goto LABEL_8;
  }
  id v21 = (std::string *)v17;
  if (*((void *)&v17 + 1) == -1) {
    sub_20B07FA34();
  }
LABEL_7:
  if (memcmp(v21, off_263FFDB40[v15], v20)) {
    goto LABEL_8;
  }
  v69.receiver = self;
  v69.super_class = (Class)MDLAsset;
  id v23 = v54;
  uint64_t v22 = v55;
  uint64_t v27 = [(MDLAsset *)&v69 init];
  id v24 = v27;
  if (!v27) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v27->_URL, a3);
  if (v55) {
    unint64_t v28 = (MDLMeshBufferDataAllocator *)v55;
  }
  else {
    unint64_t v28 = objc_alloc_init(MDLMeshBufferDataAllocator);
  }
  bufferAllocator = v24->_bufferAllocator;
  v24->_bufferAllocator = (MDLMeshBufferAllocator *)v28;

  *(_OWORD *)v24->_upAxis = xmmword_20B1E74C0;
  v24->_metersPerUnit = 0.01;
  objc_msgSend__commonInit(v24, v30, v31);
  if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    objc_msgSend_stringWithUTF8String_(NSString, v32, (uint64_t)&v70);
  }
  else {
  unint64_t v33 = objc_msgSend_stringWithUTF8String_(NSString, v32, (uint64_t)v70.__r_.__value_.__l.__data_);
  }
  sub_20B18407C(v33, v55 == 0, 0, v24->_isSceneKitBridged);

  long long v67 = 0uLL;
  uint64_t v68 = 0;
  long long v63 = 0u;
  *(_OWORD *)__p = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v62 = 0u;
  HIDWORD(v63) = 1070141403;
  WORD1(__p[0]) = 256;
  HIDWORD(__p[0]) = 1078530011;
  LOBYTE(__p[0]) = 1;
  sub_20B07F8E0(&__p[1], "");
  long long v66 = 0uLL;
  LOBYTE(v62) = 1;
  BYTE1(v62) = v8;
  *((void *)&v66 + 1) = objc_msgSend_objectForKeyedSubscript_(v54, v34, @"kMDLAssetDefaultUSDColorSpace");

  uint64_t v35 = (void *)MEMORY[0x210532AA0]();
  if ((SHIBYTE(v70.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) == 3)
    {
      uint64_t v36 = &v70;
      goto LABEL_26;
    }
    goto LABEL_30;
  }
  if (v70.__r_.__value_.__l.__size_ != 3) {
    goto LABEL_30;
  }
  uint64_t v36 = (std::string *)v70.__r_.__value_.__r.__words[0];
LABEL_26:
  int data_low = LOWORD(v36->__r_.__value_.__l.__data_);
  int v38 = v36->__r_.__value_.__s.__data_[2];
  if (data_low == 16975 && v38 == 74)
  {
    uint64_t v61 = 0;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v58 = 0u;
    sub_20B074DB8((uint64_t)&v58, 0);
    sub_20B074E9C((uint64_t)&v58, v24->_URL, (unsigned __int8 *)&v62, v24, &v56);
    if (SHIBYTE(v68) < 0) {
      operator delete((void *)v67);
    }
    uint64_t v68 = v57;
    long long v67 = v56;
    unint64_t v48 = HIBYTE(v57);
    if ((v57 & 0x8000000000000000) != 0) {
      unint64_t v48 = *((void *)&v67 + 1);
    }
    if (v48)
    {
      id v49 = [NSString alloc];
      if (v68 >= 0) {
        v51 = objc_msgSend_initWithUTF8String_(v49, v50, (uint64_t)&v67);
      }
      else {
        v51 = objc_msgSend_initWithUTF8String_(v49, v50, v67);
      }
      uint64_t v52 = v51;
      uint64_t v25 = sub_20B09E1E4(v51);
    }
    else
    {
      uint64_t v25 = 0;
    }
    sub_20B074E60((uint64_t)&v58);
  }
  else
  {
LABEL_30:
    uint64_t v61 = 0;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v58 = 0u;
    sub_20B149490(&v58, 0);
    sub_20B14B064(v24->_URL, (uint64_t)&v62, v24, &v56);
    if (SHIBYTE(v68) < 0) {
      operator delete((void *)v67);
    }
    uint64_t v68 = v57;
    long long v67 = v56;
    unint64_t v40 = HIBYTE(v57);
    if ((v57 & 0x8000000000000000) != 0) {
      unint64_t v40 = *((void *)&v67 + 1);
    }
    if (v40)
    {
      id v41 = [NSString alloc];
      if (v68 >= 0) {
        uint64_t v43 = objc_msgSend_initWithUTF8String_(v41, v42, (uint64_t)&v67);
      }
      else {
        uint64_t v43 = objc_msgSend_initWithUTF8String_(v41, v42, v67);
      }
      uint64_t v44 = v43;
      uint64_t v25 = sub_20B09E1E4(v43);
    }
    else
    {
      uint64_t v25 = 0;
    }
    sub_20B149508(&v58);
  }
  if (v25) {
    *a7 = v25;
  }
  if (SHIBYTE(v68) < 0)
  {
    if (!*((void *)&v67 + 1)) {
      goto LABEL_49;
    }
    uint64_t v47 = (long long *)v67;
LABEL_48:
    NSLog(&cfstr_S.isa, v47);
  }
  else
  {
    if (HIBYTE(v68))
    {
      uint64_t v47 = &v67;
      goto LABEL_48;
    }
LABEL_49:
    objc_msgSend_resolveTextures(v24, v45, v46);
  }
  id v24 = v24;
  if (SHIBYTE(v65) < 0) {
    operator delete(__p[1]);
  }

  if (SHIBYTE(v68) < 0) {
    operator delete((void *)v67);
  }
LABEL_11:
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v70.__r_.__value_.__l.__data_);
  }

  return v24;
}

- (NSUInteger)count
{
  return objc_msgSend_count(self->_objects, a2, v2);
}

- (BOOL)exportAssetToURL:(NSURL *)URL error:(NSError *)error
{
  BOOL v6 = URL;
  v61[0] = 0;
  v61[1] = 0;
  uint64_t v62 = 0;
  objc_msgSend_path(v6, v7, v8);
  id v9 = objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (char *)objc_msgSend_cStringUsingEncoding_(v9, v10, 4);
  sub_20B07F8E0(v61, v11);

  uint64_t v14 = objc_msgSend_pathExtension(v6, v12, v13);
  long long v17 = objc_msgSend_lowercaseString(v14, v15, v16);

  sub_20B184310(v17);
  size_t v18 = &stru_26BF51EF0;
  if ((objc_msgSend_isEqualToString_(v17, v19, @"usd") & 1) == 0
    && (objc_msgSend_isEqualToString_(v17, v20, @"usda") & 1) == 0
    && !objc_msgSend_isEqualToString_(v17, v21, @"usdc"))
  {
    if (objc_msgSend_isEqualToString_(v17, v22, @"abc"))
    {
      if (v62 >= 0) {
        unsigned int v29 = (char *)v61;
      }
      else {
        unsigned int v29 = (char *)v61[0];
      }
      if (!sub_20B12FDA8(v29, self))
      {
        uint64_t v31 = v61;
        if (v62 < 0) {
          uint64_t v31 = (void **)v61[0];
        }
        objc_msgSend_stringWithFormat_(NSString, v30, @"Could not save file to %s", v31);
LABEL_50:
        BOOL v25 = 0;
        size_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      goto LABEL_31;
    }
    if (objc_msgSend_isEqualToString_(v17, v28, @"stl"))
    {
      if (v62 >= 0) {
        unint64_t v33 = (char *)v61;
      }
      else {
        unint64_t v33 = (char *)v61[0];
      }
      if (!sub_20B0AABE4(v33, self))
      {
        int v38 = v61;
        if (v62 < 0) {
          int v38 = (void **)v61[0];
        }
        objc_msgSend_stringWithFormat_(NSString, v34, @"Could not save STL file to %s", v38);
        goto LABEL_50;
      }
LABEL_31:
      BOOL v25 = 1;
      goto LABEL_15;
    }
    if (objc_msgSend_isEqualToString_(v17, v32, @"obj"))
    {
      *(void *)&long long v48 = 0;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v45 = 0u;
      sub_20B074DB8((uint64_t)&v45, 0);
      sub_20B077924((uint64_t)&v45, v6, self, &v58);
      if (v60 < 0)
      {
        uint64_t v43 = v59;
        operator delete(v58);
        if (v43) {
          goto LABEL_35;
        }
      }
      else if (v60)
      {
LABEL_35:
        BOOL v37 = v61;
        if (v62 < 0) {
          BOOL v37 = (void **)v61[0];
        }
        objc_msgSend_stringWithFormat_(NSString, v36, @"Could not save OBJ file to %s", v37);
        size_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        BOOL v25 = 0;
        goto LABEL_53;
      }
      BOOL v25 = 1;
LABEL_53:
      sub_20B074E60((uint64_t)&v45);
      goto LABEL_12;
    }
    if (!objc_msgSend_isEqualToString_(v17, v35, @"ply"))
    {
      uint64_t v42 = v61;
      if (v62 < 0) {
        uint64_t v42 = (void **)v61[0];
      }
      objc_msgSend_stringWithFormat_(NSString, v39, @"Unknown extension on URL: %s", v42);
      goto LABEL_50;
    }
    uint64_t v57 = 0;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    sub_20B106500(&v45, 0);
    sub_20B10A338((uint64_t)&v45, v6, self, &v58);
    if (v60 < 0)
    {
      uint64_t v44 = v59;
      operator delete(v58);
      if (v44) {
        goto LABEL_44;
      }
    }
    else if (v60)
    {
LABEL_44:
      id v41 = v61;
      if (v62 < 0) {
        id v41 = (void **)v61[0];
      }
      objc_msgSend_stringWithFormat_(NSString, v40, @"Could not save PLY file to %s", v41);
      size_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      BOOL v25 = 0;
      goto LABEL_56;
    }
    BOOL v25 = 1;
LABEL_56:
    sub_20B1065E0(&v45);
    goto LABEL_12;
  }
  *(void *)&long long v48 = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v45 = 0u;
  sub_20B149490(&v45, 0);
  sub_20B1932BC(v6, self, &v58);
  if (v60 < 0)
  {
    uint64_t v26 = v59;
    operator delete(v58);
    if (v26) {
      goto LABEL_6;
    }
  }
  else if (v60)
  {
LABEL_6:
    id v24 = v61;
    if (v62 < 0) {
      id v24 = (void **)v61[0];
    }
    objc_msgSend_stringWithFormat_(NSString, v23, @"Could not save file to %s", v24);
    size_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    BOOL v25 = 0;
    goto LABEL_11;
  }
  BOOL v25 = 1;
LABEL_11:
  sub_20B149508(&v45);
LABEL_12:
  if (error && !v25)
  {
    sub_20B09E1E4(v18);
    BOOL v25 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:

  if (SHIBYTE(v62) < 0) {
    operator delete(v61[0]);
  }

  return v25;
}

- (BOOL)exportAssetToURL:(NSURL *)URL
{
  return MEMORY[0x270F9A6D0](self, sel_exportAssetToURL_error_, URL);
}

- (MDLObject)objectAtPath:(NSString *)path
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = path;
  char v7 = v4;
  if (v4 && objc_msgSend_length(v4, v5, v6))
  {
    int v39 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x263F08708], v8, @"/");
    unint64_t v40 = objc_msgSend_stringByTrimmingCharactersInSet_(v7, v9, (uint64_t)v39);
    uint64_t v11 = objc_msgSend_componentsSeparatedByString_(v40, v10, @"/");
    uint64_t v14 = v11;
    if (v11 && objc_msgSend_count(v11, v12, v13))
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v15 = self->_objects;
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v41, v45, 16);
      if (v18)
      {
        uint64_t v19 = *(void *)v42;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v42 != v19) {
              objc_enumerationMutation(v15);
            }
            id v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(v14, v17, 0);
            BOOL v25 = objc_msgSend_name(v21, v23, v24);
            int isEqualToString = objc_msgSend_isEqualToString_(v22, v26, (uint64_t)v25);

            if (isEqualToString)
            {
              if ((unint64_t)objc_msgSend_count(v14, v17, v28) < 2)
              {
                id v29 = v21;
              }
              else
              {
                uint64_t v31 = objc_msgSend_objectAtIndexedSubscript_(v14, v30, 0);
                uint64_t v34 = objc_msgSend_length(v31, v32, v33);
                uint64_t v36 = objc_msgSend_substringFromIndex_(v40, v35, v34 + 1);
                objc_msgSend_objectAtPath_(v21, v37, (uint64_t)v36);
                id v29 = (id)objc_claimAutoreleasedReturnValue();
              }
              goto LABEL_19;
            }
          }
          uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v41, v45, 16);
          if (v18) {
            continue;
          }
          break;
        }
      }
      id v29 = 0;
LABEL_19:
    }
    else
    {
      id v29 = 0;
    }
  }
  else
  {
    id v29 = 0;
  }

  return (MDLObject *)v29;
}

- (void)addObject:(MDLObject *)object
{
}

- (void)removeObject:(MDLObject *)object
{
}

- (id)objects
{
  return self->_objects;
}

- (MDLObject)objectAtIndexedSubscript:(NSUInteger)index
{
  if (objc_msgSend_count(self->_objects, a2, index) <= index)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(self->_objects, v5, index);
  }

  return (MDLObject *)v6;
}

- (MDLObject)objectAtIndex:(NSUInteger)index
{
  if (objc_msgSend_count(self->_objects, a2, index) <= index)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(self->_objects, v5, index);
  }

  return (MDLObject *)v6;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return objc_msgSend_countByEnumeratingWithState_objects_count_(self->_objects, a2, (uint64_t)a3, a4, a5);
}

- (id)masters
{
  return self->_masters;
}

- (void)setMasters:(id)masters
{
}

- (id)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)animations
{
}

- (NSURL)_temporaryFolderURL
{
  return self->_temporaryFolderURL;
}

- (void)set_temporaryFolderURL:(id)a3
{
}

- (NSTimeInterval)frameInterval
{
  return self->_frameInterval;
}

- (void)setFrameInterval:(NSTimeInterval)frameInterval
{
  self->_frameInterval = frameInterval;
}

- (vector_float3)upAxis
{
  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (void)setUpAxis:(vector_float3)upAxis
{
  *(_OWORD *)self->_upAxis = v3;
}

- (id)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)resolver
{
}

- (id)bufferAllocator
{
  return self->_bufferAllocator;
}

- (MDLVertexDescriptor)vertexDescriptor
{
  return self->_vertexDescriptor;
}

- (double)_timeCodesPerSecond
{
  return self->__timeCodesPerSecond;
}

- (void)set_timeCodesPerSecond:(double)a3
{
  self->__timeCodesPerSecond = a3;
}

- (NSUnitLength)unitLength
{
  return self->_unitLength;
}

- (void)setUnitLength:(id)a3
{
}

- (float)metersPerUnit
{
  return self->_metersPerUnit;
}

- (void)setMetersPerUnit:(float)a3
{
  self->_metersPerUnit = a3;
}

- (MDLAnimatedVector3Array)extents
{
  return self->_extents;
}

- (void)setExtents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extents, 0);
  objc_storeStrong((id *)&self->_unitLength, 0);
  objc_storeStrong((id *)&self->_vertexDescriptor, 0);
  objc_storeStrong((id *)&self->_bufferAllocator, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_temporaryFolderURL, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_masters, 0);
  objc_storeStrong((id *)&self->_objects, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

+ (NSArray)placeLightProbesWithDensity:(float)value heuristic:(MDLProbePlacement)type usingIrradianceDataSource:(id)dataSource
{
  uint64_t v324 = *MEMORY[0x263EF8340];
  id v8 = dataSource;
  if (value <= 0.0)
  {
    id v9 = (void *)MEMORY[0x263EFF940];
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    id v12 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v9, v13, @"ModelIOException", @"[%@ %@]: density must be greater than 0", v11, v12);
  }
  if (type == MDLProbePlacementIrradianceDistribution && (objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v14 = (void *)MEMORY[0x263EFF940];
    uint64_t v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    long long v17 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v14, v18, @"ModelIOException", @"[%@ %@]: must implement sphericalHarmonicsCoefficientsAtPosition: selector if using heuristic type MDLProbePlacementIrradianceDistribution", v16, v17);
  }
  id v261 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_msgSend_boundingBox(v8, v19, v20);
  float32x4_t v257 = v22;
  float32x4_t v265 = v21;
  if ((vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vcgeq_f32(v22, v21))).u8[0] & 1) == 0)
  {
    *((void *)&v23 + 1) = 0;
    LODWORD(v23) = v21.i32[0];
    __int16 v24 = vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vcgeq_f32(v257, v21))).i16[1];
    float v25 = 1.0 / value;
    do
    {
      DWORD1(v23) = v265.i32[1];
      if (v24)
      {
        long long v26 = v23;
      }
      else
      {
        *(void *)&long long v27 = v23;
        do
        {
          *((void *)&v27 + 1) = __PAIR64__(HIDWORD(v23), v265.u32[2]);
          while (1)
          {
            *(_OWORD *)v269 = v27;
            float v28 = *((float *)&v27 + 2);
            if (*((float *)&v27 + 2) > v257.f32[2]) {
              break;
            }
            id v29 = [MDLTransform alloc];
            uint64_t v32 = objc_msgSend_initWithIdentity(v29, v30, v31);
            objc_msgSend_setTranslation_(v32, v33, v34, *(double *)v269);
            uint64_t v35 = objc_alloc_init(MDLLightProbe);
            objc_msgSend_setTransform_(v35, v36, (uint64_t)v32);
            objc_msgSend_addObject_(v261, v37, (uint64_t)v35);
            *(id *)&long long v38 = v269[0];
            *((float *)&v38 + 2) = v28 + v25;
            HIDWORD(v38) = HIDWORD(v269[1]);
            *(_OWORD *)v270 = v38;

            long long v27 = *(_OWORD *)v270;
          }
          LODWORD(v26) = v27;
          *((float *)&v26 + 1) = *((float *)&v27 + 1) + v25;
          HIDWORD(v23) = HIDWORD(v27);
          DWORD2(v26) = DWORD2(v27);
          *(void *)&long long v27 = v26;
        }
        while ((float)(*((float *)v269 + 1) + v25) <= v257.f32[1]);
      }
      *(float *)&long long v39 = *(float *)&v26 + v25;
      DWORD1(v39) = DWORD1(v26);
      *((void *)&v39 + 1) = __PAIR64__(HIDWORD(v23), DWORD2(v26));
      long long v23 = v39;
    }
    while ((float)(*(float *)&v26 + v25) <= v257.f32[0]);
  }
  if (type == MDLProbePlacementIrradianceDistribution)
  {
    id v245 = v261;
    id v260 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    unsigned int v43 = 0;
    int8x16_t v44 = (int8x16_t)vsubq_f32(v257, v265);
    float v45 = fabsf(*(float *)v44.i32);
    *(int8x16_t *)v253 = v44;
    v44.i32[0] = vextq_s8(v44, v44, 8uLL).u32[0];
    float32x2_t v46 = vabs_f32(*(float32x2_t *)v44.i8);
    if (v46.f32[1] >= v46.f32[0]) {
      *(float *)&long long v42 = v46.f32[1];
    }
    else {
      *(float *)&long long v42 = v46.f32[0];
    }
    if (v45 >= *(float *)&v42) {
      *(float *)&long long v42 = v45;
    }
    long long v255 = v42;
    if (v46.f32[0] >= v46.f32[1]) {
      v46.f32[0] = v46.f32[1];
    }
    if (v46.f32[0] < v45) {
      float v45 = v46.f32[0];
    }
    float v47 = v45 * 0.05;
    do
    {
      long long v311 = 0u;
      long long v312 = 0u;
      long long v309 = 0u;
      long long v310 = 0u;
      obuint64_t j = v245;
      uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v309, v323, 16);
      if (v51)
      {
        uint64_t v52 = *(void *)v310;
        float32x4_t v262 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v255, 0);
        do
        {
          uint64_t v53 = 0;
          do
          {
            if (*(void *)v310 != v52) {
              objc_enumerationMutation(obj);
            }
            long long v54 = *(void **)(*((void *)&v309 + 1) + 8 * v53);
            objc_msgSend_position(v54, v49, v50);
            uint64_t v57 = objc_msgSend_sphericalHarmonicsCoefficientsAtPosition_(v8, v55, v56);
            uint64_t v60 = objc_msgSend_sphericalHarmonicsLevel(v8, v58, v59);
            objc_msgSend_calculateIrradianceGradientUsingSamples_ofSize_fromSH_withLevel_(MDLLightProbe, v61, (uint64_t)&unk_2676895B0, 26, v57, v60);
            float32x4_t v65 = v64;
            int32x4_t v66 = (int32x4_t)vmulq_f32(v64, v64);
            if (vaddq_f32(vaddq_f32((float32x4_t)v66, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v66.i8, 1)), (float32x4_t)vdupq_laneq_s32(v66, 2)).f32[0] == 0.0)
            {
              objc_msgSend_addObject_(v260, v62, (uint64_t)v54);
LABEL_39:
              v73 = v57;
              goto LABEL_40;
            }
            *(float32x4_t *)v271 = v65;
            objc_msgSend_position(v54, v62, v63);
            float32x4_t v272 = vmlaq_f32(v69, v262, *(float32x4_t *)v271);
            int16x4_t v70 = vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vcgeq_f32(v272, v265)));
            if (v70.i8[0]) {
              goto LABEL_39;
            }
            if (v70.i8[2]) {
              goto LABEL_39;
            }
            float32x4_t v71 = v272;
            v71.i32[3] = v265.i32[2];
            float32x4_t v72 = v257;
            v72.i32[3] = v272.i32[2];
            if (vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vcgeq_f32(v72, v71))), 0xFuLL))))goto LABEL_39; {
            v73 = objc_msgSend_sphericalHarmonicsCoefficientsAtPosition_(v8, v67, v68);
            }

            uint64_t v76 = objc_msgSend_sphericalHarmonicsLevel(v8, v74, v75);
            objc_msgSend_calculateIrradianceGradientUsingSamples_ofSize_fromSH_withLevel_(MDLLightProbe, v77, (uint64_t)&unk_2676895B0, 26, v73, v76);
            int32x4_t v79 = (int32x4_t)vmulq_f32(v78, v78);
            if (vaddq_f32(vaddq_f32((float32x4_t)v79, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v79.i8, 1)), (float32x4_t)vdupq_laneq_s32(v79, 2)).f32[0] != 0.0)
            {
              v80 = [MDLTransform alloc];
              uint64_t v83 = objc_msgSend_initWithIdentity(v80, v81, v82);
              objc_msgSend_setTranslation_(v83, v84, v85, *(double *)v272.i64);
              objc_msgSend_setTransform_(v54, v86, (uint64_t)v83);
            }
LABEL_40:

            ++v53;
          }
          while (v51 != v53);
          uint64_t v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v309, v323, 16);
          uint64_t v51 = v87;
        }
        while (v87);
      }

      long long v88 = v255;
      *(float *)&long long v88 = *(float *)&v255 * 0.5;
      long long v255 = v88;
    }
    while (*(float *)&v88 >= v47 || v43++ < 9);
    v90.i64[0] = 0x3F0000003F000000;
    v90.i64[1] = 0x3F0000003F000000;
    float32x4_t v91 = vmulq_f32(vaddq_f32(v257, v265), v90);
    long long v92 = *(_OWORD *)v253;
    float32x4_t v93 = vmulq_f32(*(float32x4_t *)v253, v90);
    float v94 = 0.5 * v93.f32[0];
    float v95 = vmuls_lane_f32(0.5, *(float32x2_t *)v93.f32, 1);
    v93.f32[0] = vmuls_lane_f32(0.5, v93, 2);
    *(float *)&long long v92 = v91.f32[0] - v94;
    long long v96 = v92;
    *((float *)&v96 + 1) = v91.f32[1] - v95;
    long long v97 = v96;
    *((float *)&v97 + 2) = v91.f32[2] - v93.f32[0];
    *((float *)&v96 + 2) = v93.f32[0] + v91.f32[2];
    v322[0] = v97;
    v322[1] = v96;
    float v98 = v95 + v91.f32[1];
    *((float *)&v92 + 1) = v98;
    long long v99 = v92;
    *((float *)&v99 + 2) = v91.f32[2] - v93.f32[0];
    *((float *)&v92 + 2) = v93.f32[0] + v91.f32[2];
    v322[2] = v99;
    v322[3] = v92;
    v91.f32[0] = v94 + v91.f32[0];
    float32x4_t v100 = v91;
    v100.i32[1] = DWORD1(v96);
    float32x4_t v101 = v100;
    v101.f32[2] = v91.f32[2] - v93.f32[0];
    v91.f32[1] = v98;
    float32x4_t v102 = v91;
    v102.f32[2] = v91.f32[2] - v93.f32[0];
    v91.f32[2] = v93.f32[0] + v91.f32[2];
    v100.f32[2] = v91.f32[2];
    v322[4] = v101;
    v322[5] = v100;
    v322[6] = v102;
    v322[7] = v91;
    memset(v321, 0, sizeof(v321));
    long long v305 = 0u;
    long long v306 = 0u;
    long long v307 = 0u;
    long long v308 = 0u;
    id v273 = v260;
    uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v273, v103, (uint64_t)&v305, v320, 16);
    if (v106)
    {
      uint64_t v107 = *(void *)v306;
      do
      {
        for (uint64_t i = 0; i != v106; ++i)
        {
          if (*(void *)v306 != v107) {
            objc_enumerationMutation(v273);
          }
          uint64_t v109 = *(void **)(*((void *)&v305 + 1) + 8 * i);
          objc_msgSend_position(v109, v104, v105);
          uint64_t v111 = 0;
          int v112 = -1;
          float v113 = 3.4028e38;
          do
          {
            float32x4_t v114 = vsubq_f32((float32x4_t)v322[v111], v110);
            int32x4_t v115 = (int32x4_t)vmulq_f32(v114, v114);
            float v116 = vaddq_f32(vaddq_f32((float32x4_t)v115, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v115.i8, 1)), (float32x4_t)vdupq_laneq_s32(v115, 2)).f32[0];
            if (v116 < v113)
            {
              float v113 = v116;
              int v112 = v111;
            }
            ++v111;
          }
          while (v111 != 8);
          v117 = (void *)*((void *)v321 + v112);
          if (v117)
          {
            id v118 = v117;
            objc_msgSend_position(v118, v119, v120);
            float32x4_t v122 = vsubq_f32((float32x4_t)v322[v112], v121);
            int32x4_t v123 = (int32x4_t)vmulq_f32(v122, v122);
            if (vaddq_f32(vaddq_f32((float32x4_t)v123, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v123.i8, 1)), (float32x4_t)vdupq_laneq_s32(v123, 2)).f32[0] >= v113)objc_storeStrong((id *)v321 + v112, v109); {
          }
            }
          else
          {
            objc_storeStrong((id *)v321 + v112, v109);
          }
        }
        uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v273, v104, (uint64_t)&v305, v320, 16);
      }
      while (v106);
    }

    id v251 = objc_alloc_init(MEMORY[0x263EFF980]);
    for (uint64_t j = 0; j != 64; j += 8)
    {
      id v125 = *(id *)((char *)v321 + j);
      double v128 = v125;
      if (v125)
      {
        objc_msgSend_position(v125, v126, v127);
        double v266 = v129;
        v130 = objc_alloc_init(_MDLProbeCluster);
        objc_msgSend_setCentroid_(v130, v131, v132, v266);
        id v133 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        objc_msgSend_setProbes_(v130, v134, (uint64_t)v133);

        id v137 = objc_msgSend_probes(v130, v135, v136);
        objc_msgSend_addObject_(v137, v138, (uint64_t)v128);

        objc_msgSend_addObject_(v251, v139, (uint64_t)v130);
      }
    }
    long long v303 = 0u;
    long long v304 = 0u;
    long long v301 = 0u;
    long long v302 = 0u;
    id v246 = v273;
    uint64_t v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v246, v140, (uint64_t)&v301, v319, 16);
    if (v143)
    {
      uint64_t v263 = *(void *)v302;
      do
      {
        for (uint64_t k = 0; k != v143; ++k)
        {
          if (*(void *)v302 != v263) {
            objc_enumerationMutation(v246);
          }
          long long v145 = *(void **)(*((void *)&v301 + 1) + 8 * k);
          objc_msgSend_position(v145, v141, v142);
          float32x4_t v267 = v146;
          long long v299 = 0u;
          long long v300 = 0u;
          long long v297 = 0u;
          long long v298 = 0u;
          id v147 = v251;
          uint64_t v151 = objc_msgSend_countByEnumeratingWithState_objects_count_(v147, v148, (uint64_t)&v297, v318, 16);
          if (v151)
          {
            uint64_t v152 = *(void *)v298;
            float v153 = 3.4028e38;
            uint64_t v154 = 8;
            do
            {
              for (uint64_t m = 0; m != v151; ++m)
              {
                if (*(void *)v298 != v152) {
                  objc_enumerationMutation(v147);
                }
                long long v156 = *(void **)(*((void *)&v297 + 1) + 8 * m);
                objc_msgSend_centroid(v156, v149, v150);
                float32x4_t v158 = vsubq_f32(v157, v267);
                int32x4_t v159 = (int32x4_t)vmulq_f32(v158, v158);
                float v274 = vaddq_f32(vaddq_f32((float32x4_t)v159, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v159.i8, 1)), (float32x4_t)vdupq_laneq_s32(v159, 2)).f32[0];
                if (v274 < v153)
                {
                  uint64_t v154 = objc_msgSend_indexOfObject_(v147, v149, (uint64_t)v156);
                  float v153 = v274;
                }
              }
              uint64_t v151 = objc_msgSend_countByEnumeratingWithState_objects_count_(v147, v149, (uint64_t)&v297, v318, 16);
            }
            while (v151);
          }
          else
          {
            uint64_t v154 = 8;
          }

          char v161 = objc_msgSend_objectAtIndexedSubscript_(v147, v160, v154);
          uint64_t v164 = objc_msgSend_probes(v161, v162, v163);
          objc_msgSend_addObject_(v164, v165, (uint64_t)v145);

          objc_msgSend_calculateCentroidNotIncludingSamplesinArray_(v161, v166, MEMORY[0x263EFFA68]);
        }
        uint64_t v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v246, v141, (uint64_t)&v301, v319, 16);
      }
      while (v143);
    }

    unsigned int v167 = 0;
LABEL_89:
    if (v167 > 4) {
      goto LABEL_132;
    }
    unsigned int v241 = v167;
    long long v295 = 0u;
    long long v296 = 0u;
    long long v293 = 0u;
    long long v294 = 0u;
    id v254 = v251;
    uint64_t v169 = objc_msgSend_countByEnumeratingWithState_objects_count_(v254, v168, (uint64_t)&v293, v317, 16);
    if (!v169)
    {

      goto LABEL_132;
    }
    uint64_t v242 = v169;
    uint64_t v243 = *(void *)v294;
    char v171 = 1;
LABEL_92:
    uint64_t v244 = 0;
    while (1)
    {
      if (*(void *)v294 != v243) {
        objc_enumerationMutation(v254);
      }
      long long v172 = *(void **)(*((void *)&v293 + 1) + 8 * v244);
      uint64_t v248 = objc_msgSend_indexOfObject_(v254, v170, (uint64_t)v172);
      id v249 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v291 = 0u;
      long long v292 = 0u;
      long long v289 = 0u;
      long long v290 = 0u;
      objc_msgSend_probes(v172, v173, v174);
      id v247 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(v247, v175, (uint64_t)&v289, v316, 16);
      if (v178) {
        break;
      }
LABEL_115:

      long long v283 = 0u;
      long long v284 = 0u;
      long long v281 = 0u;
      long long v282 = 0u;
      id v206 = v249;
      uint64_t v210 = objc_msgSend_countByEnumeratingWithState_objects_count_(v206, v207, (uint64_t)&v281, v314, 16);
      if (v210)
      {
        uint64_t v211 = *(void *)v282;
        do
        {
          for (uint64_t n = 0; n != v210; ++n)
          {
            if (*(void *)v282 != v211) {
              objc_enumerationMutation(v206);
            }
            uint64_t v213 = *(void *)(*((void *)&v281 + 1) + 8 * n);
            v214 = objc_msgSend_probes(v172, v208, v209);
            objc_msgSend_removeObject_(v214, v215, v213);
          }
          uint64_t v210 = objc_msgSend_countByEnumeratingWithState_objects_count_(v206, v208, (uint64_t)&v281, v314, 16);
        }
        while (v210);
      }

      if (++v244 == v242)
      {
        uint64_t v242 = objc_msgSend_countByEnumeratingWithState_objects_count_(v254, v170, (uint64_t)&v293, v317, 16);
        if (!v242)
        {

          unsigned int v167 = v241 + ((v171 & 1) == 0);
          if (v171)
          {
LABEL_132:
            long long v279 = 0u;
            long long v280 = 0u;
            long long v277 = 0u;
            long long v278 = 0u;
            id v217 = v251;
            uint64_t v221 = objc_msgSend_countByEnumeratingWithState_objects_count_(v217, v218, (uint64_t)&v277, v313, 16);
            if (v221)
            {
              uint64_t v222 = *(void *)v278;
              do
              {
                for (iuint64_t i = 0; ii != v221; ++ii)
                {
                  if (*(void *)v278 != v222) {
                    objc_enumerationMutation(v217);
                  }
                  v224 = *(void **)(*((void *)&v277 + 1) + 8 * ii);
                  if ((objc_msgSend_isEmpty(v224, v219, v220) & 1) == 0)
                  {
                    v225 = [MDLTransform alloc];
                    v228 = objc_msgSend_initWithIdentity(v225, v226, v227);
                    objc_msgSend_centroid(v224, v229, v230);
                    objc_msgSend_setTranslation_(v228, v231, v232);
                    v233 = objc_alloc_init(MDLLightProbe);
                    objc_msgSend_setTransform_(v233, v234, (uint64_t)v228);
                    objc_msgSend_addObject_(obj, v235, (uint64_t)v233);
                  }
                }
                uint64_t v221 = objc_msgSend_countByEnumeratingWithState_objects_count_(v217, v219, (uint64_t)&v277, v313, 16);
              }
              while (v221);
            }

            v238 = objc_msgSend_allObjects(v246, v236, v237);
            objc_msgSend_removeObjectsInArray_(obj, v239, (uint64_t)v238);

            id v41 = obj;
            for (juint64_t j = 56; jj != -8; jj -= 8)

LABEL_127:
            unint64_t v40 = v261;
            goto LABEL_128;
          }
          goto LABEL_89;
        }
        goto LABEL_92;
      }
    }
    uint64_t v252 = *(void *)v290;
LABEL_97:
    uint64_t v179 = 0;
    uint64_t v250 = v178;
    while (1)
    {
      if (*(void *)v290 != v252) {
        objc_enumerationMutation(v247);
      }
      v258 = *(void **)(*((void *)&v289 + 1) + 8 * v179);
      objc_msgSend_position(v258, v176, v177);
      float32x4_t v264 = v180;
      objc_msgSend_centroid(v172, v181, v182);
      *(_OWORD *)v275 = v183;
      long long v287 = 0u;
      long long v288 = 0u;
      long long v285 = 0u;
      long long v286 = 0u;
      id v184 = v254;
      uint64_t v187 = objc_msgSend_countByEnumeratingWithState_objects_count_(v184, v185, (uint64_t)&v285, v315, 16);
      if (v187)
      {
        uint64_t v256 = v179;
        char v188 = 0;
        float32x4_t v189 = vsubq_f32(*(float32x4_t *)v275, v264);
        int32x4_t v190 = (int32x4_t)vmulq_f32(v189, v189);
        LODWORD(v276) = vaddq_f32(vaddq_f32((float32x4_t)v190, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v190.i8, 1)), (float32x4_t)vdupq_laneq_s32(v190, 2)).u32[0];
        uint64_t v191 = *(void *)v286;
        uint64_t v192 = v248;
        do
        {
          for (kuint64_t k = 0; kk != v187; ++kk)
          {
            if (*(void *)v286 != v191) {
              objc_enumerationMutation(v184);
            }
            v194 = *(void **)(*((void *)&v285 + 1) + 8 * kk);
            if ((objc_msgSend_isEqual_(v172, v186, (uint64_t)v194) & 1) == 0)
            {
              objc_msgSend_centroid(v194, v186, v195);
              float32x4_t v197 = vsubq_f32(v196, v264);
              int32x4_t v198 = (int32x4_t)vmulq_f32(v197, v197);
              float v268 = vaddq_f32(vaddq_f32((float32x4_t)v198, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v198.i8, 1)), (float32x4_t)vdupq_laneq_s32(v198, 2)).f32[0];
              if (v268 < v276)
              {
                uint64_t v192 = objc_msgSend_indexOfObject_(v184, v186, (uint64_t)v194);
                char v171 = 0;
                char v188 = 1;
                float v276 = v268;
              }
            }
          }
          uint64_t v187 = objc_msgSend_countByEnumeratingWithState_objects_count_(v184, v186, (uint64_t)&v285, v315, 16);
        }
        while (v187);

        uint64_t v178 = v250;
        uint64_t v179 = v256;
        if ((v188 & 1) == 0) {
          goto LABEL_113;
        }
        objc_msgSend_objectAtIndex_(v184, v176, v192);
        id v184 = (id)objc_claimAutoreleasedReturnValue();
        v201 = objc_msgSend_probes(v184, v199, v200);
        objc_msgSend_addObject_(v201, v202, (uint64_t)v258);

        objc_msgSend_calculateCentroidNotIncludingSamplesinArray_(v184, v203, MEMORY[0x263EFFA68]);
        objc_msgSend_addObject_(v249, v204, (uint64_t)v258);
        objc_msgSend_calculateCentroidNotIncludingSamplesinArray_(v172, v205, (uint64_t)v249);
      }

LABEL_113:
      if (++v179 == v178)
      {
        uint64_t v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(v247, v176, (uint64_t)&v289, v316, 16);
        if (!v178) {
          goto LABEL_115;
        }
        goto LABEL_97;
      }
    }
  }
  if (type)
  {
    id v41 = 0;
    goto LABEL_127;
  }
  unint64_t v40 = v261;
  id v41 = v261;
LABEL_128:

  return (NSArray *)v41;
}

@end