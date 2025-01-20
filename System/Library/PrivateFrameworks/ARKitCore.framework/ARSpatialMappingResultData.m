@interface ARSpatialMappingResultData
+ (id)emptyResultData;
- (ARSpatialMappingResultData)initWithMeshChunks:(id)a3;
- (ARSpatialMappingResultData)initWithMeshList:(CV3DReconMeshList *)a3 sceneReconstruction:(unint64_t)a4 timestamp:(double)a5;
- (BOOL)isEmpty;
- (BOOL)meshConfidenceEnabled;
- (CV3DReconMeshList)meshList;
- (MTLDevice)mtlDevice;
- (NSArray)meshChunks;
- (double)timestamp;
- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(double)a6;
- (id)anchorsFromMeshChunksForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(double)a6;
- (id)anchorsFromMeshListForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6;
- (unint64_t)sceneReconstruction;
- (void)dealloc;
- (void)setEmpty:(BOOL)a3;
- (void)setMeshChunks:(id)a3;
- (void)setMeshList:(CV3DReconMeshList *)a3;
- (void)setMtlDevice:(id)a3;
- (void)setSceneReconstruction:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
- (void)updateSemanticsFromSamplingData:(__CFData *)a3;
@end

@implementation ARSpatialMappingResultData

+ (id)emptyResultData
{
  v2 = objc_opt_new();
  [v2 setEmpty:1];
  return v2;
}

- (ARSpatialMappingResultData)initWithMeshChunks:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARSpatialMappingResultData;
  v6 = [(ARSpatialMappingResultData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_meshChunks, a3);
  }

  return v7;
}

- (ARSpatialMappingResultData)initWithMeshList:(CV3DReconMeshList *)a3 sceneReconstruction:(unint64_t)a4 timestamp:(double)a5
{
  v13.receiver = self;
  v13.super_class = (Class)ARSpatialMappingResultData;
  v8 = [(ARSpatialMappingResultData *)&v13 init];
  objc_super v9 = v8;
  if (v8)
  {
    v8->_meshList = a3;
    v8->_sceneReconstruction = a4;
    v8->_timestamp = a5;
    v10 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    mtlDevice = v9->_mtlDevice;
    v9->_mtlDevice = v10;

    v9->_meshConfidenceEnabled = 0;
  }
  return v9;
}

- (void)updateSemanticsFromSamplingData:(__CFData *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BytePtr = CFDataGetBytePtr(a3);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(ARSpatialMappingResultData *)self meshChunks];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        size_t v11 = [v10 faceCount];
        std::vector<unsigned char>::vector(&v16, v11);
        if (v11)
        {
          for (uint64_t j = 0; j != v11; ++j)
            *((unsigned char *)v16 + j) = ARMeshClassificationFromSemantic(BytePtr[v7 + j]);
          v7 += j;
        }
        __p = 0;
        v14 = 0;
        uint64_t v15 = 0;
        std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v16, (uint64_t)v17, v17 - (unsigned char *)v16);
        [v10 setSemanticsVector:&__p];
        if (__p)
        {
          v14 = __p;
          operator delete(__p);
        }
        if (v16)
        {
          v17 = v16;
          operator delete(v16);
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
}

- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(double)a6
{
  id v14 = a11;
  id v15 = a12;
  if ([a1 isEmpty])
  {
    v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"class == %@", objc_opt_class()];
    v17 = [v14 filteredArrayUsingPredicate:v16];
    [v15 addObjectsFromArray:v17];

    long long v18 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    if (a1[3]) {
      objc_msgSend(a1, "anchorsFromMeshListForCameraWithTransform:referenceOriginTransform:existingAnchors:anchorsToRemove:", v14, v15, a2, a3, a4, a5, a6, a7, a8, a9);
    }
    else {
    long long v18 = objc_msgSend(a1, "anchorsFromMeshChunksForCameraWithTransform:referenceOriginTransform:existingAnchors:anchorsToRemove:", v14, v15, a2, a3, a4, a5, a6, a7, a8, a9);
    }
  }

  return v18;
}

- (id)anchorsFromMeshChunksForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(double)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v14 = a11;
  id v15 = a12;
  v30 = v14;
  v31 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"class == %@", objc_opt_class()];
  v16 = objc_msgSend(v14, "filteredArrayUsingPredicate:");
  v17 = ARDictionaryFromAnchors(v16);

  long long v18 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v19 = [a1 meshChunks];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v24 = [v23 identifier];
        v25 = [v17 objectForKeyedSubscript:v24];

        uint64_t v26 = objc_msgSend(v23, "anchorForReferenceOriginTransform:", a6, a7, a8, a9);
        v27 = (void *)v26;
        if (v25) {
          BOOL v28 = v26 == 0;
        }
        else {
          BOOL v28 = 0;
        }
        if (v28)
        {
          [v15 addObject:v25];
        }
        else if (v26)
        {
          [v18 addObject:v26];
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v20);
  }

  return v18;
}

- (id)anchorsFromMeshListForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v41 = a11;
  id v40 = a12;
  v34 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"class == %@", objc_opt_class()];
  id v14 = objc_msgSend(v41, "filteredArrayUsingPredicate:");
  v42 = ARDictionaryFromAnchors(v14);

  id v39 = (id)objc_opt_new();
  v47 = 0;
  uint64_t Count = CV3DReconMeshListGetCount();
  uint64_t v17 = Count;
  if (Count)
  {
    for (uint64_t i = 0; v17 != i; ++i)
    {
      uint64_t MeshUUIDAtIndex = CV3DReconMeshListGetMeshUUIDAtIndex();
      if (v47)
      {
        uint64_t v20 = _ARLogGeneral();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = (objc_class *)objc_opt_class();
          v22 = NSStringFromClass(v21);
          uint64_t v23 = v47;
          *(_DWORD *)buf = 138544130;
          v49 = v22;
          __int16 v50 = 2048;
          uint64_t v51 = a1;
          __int16 v52 = 2048;
          uint64_t v53 = i;
          __int16 v54 = 2112;
          v55 = v47;
          _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error getting mesh at index %ld: %@", buf, 0x2Au);
        }
      }
      else
      {
        v24 = (const void *)MeshUUIDAtIndex;
        uint64_t v25 = CV3DReconMeshListCopyMeshAtIndex();
        if (!v47)
        {
          uint64_t v29 = v25;
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v44 = __129__ARSpatialMappingResultData_anchorsFromMeshListForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove___block_invoke;
          v45 = &__block_descriptor_40_e5_v8__0l;
          uint64_t v46 = v25;
          v30 = objc_msgSend(MEMORY[0x1E4F29128], "ar_UUIDWithCFUUIDRef:", v24);
          CFRelease(v24);
          v31 = [v42 objectForKeyedSubscript:v30];
          uint64_t v32 = ARMeshAnchorFromMesh(*(void **)(a1 + 48), v29, v30, v31, *(void *)(a1 + 32), *(unsigned char *)(a1 + 9), a6, a7, a8, a9, *(double *)(a1 + 40));
          v33 = (void *)v32;
          if (!v31 || v32)
          {
            if (v32) {
              [v39 addObject:v32];
            }
          }
          else
          {
            [v40 addObject:v31];
          }

          ((void (*)(void *))v44)(v43);
          continue;
        }
        uint64_t v20 = _ARLogGeneral();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          uint64_t v26 = (objc_class *)objc_opt_class();
          v27 = NSStringFromClass(v26);
          BOOL v28 = v47;
          *(_DWORD *)buf = 138544130;
          v49 = v27;
          __int16 v50 = 2048;
          uint64_t v51 = a1;
          __int16 v52 = 2048;
          uint64_t v53 = i;
          __int16 v54 = 2112;
          v55 = v47;
          _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error copying mesh at index %ld: %@", buf, 0x2Au);
        }
      }
    }
  }

  return v39;
}

uint64_t __129__ARSpatialMappingResultData_anchorsFromMeshListForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove___block_invoke()
{
  return CV3DReconMeshRelease();
}

- (void)dealloc
{
  if (self->_meshList) {
    CV3DReconMeshListRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)ARSpatialMappingResultData;
  [(ARSpatialMappingResultData *)&v3 dealloc];
}

- (NSArray)meshChunks
{
  return self->_meshChunks;
}

- (void)setMeshChunks:(id)a3
{
}

- (CV3DReconMeshList)meshList
{
  return self->_meshList;
}

- (void)setMeshList:(CV3DReconMeshList *)a3
{
  self->_meshList = a3;
}

- (unint64_t)sceneReconstruction
{
  return self->_sceneReconstruction;
}

- (void)setSceneReconstruction:(unint64_t)a3
{
  self->_sceneReconstruction = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (void)setEmpty:(BOOL)a3
{
  self->_empty = a3;
}

- (MTLDevice)mtlDevice
{
  return self->_mtlDevice;
}

- (void)setMtlDevice:(id)a3
{
}

- (BOOL)meshConfidenceEnabled
{
  return self->_meshConfidenceEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtlDevice, 0);
  objc_storeStrong((id *)&self->_meshChunks, 0);
}

@end