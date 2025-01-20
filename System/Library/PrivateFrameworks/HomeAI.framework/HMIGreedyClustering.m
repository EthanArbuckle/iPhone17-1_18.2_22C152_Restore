@interface HMIGreedyClustering
+ (BOOL)addFaceObservations:(id)a3 toFaceDescriptorBuffer:(void *)a4 error:(id *)a5;
+ (float)faceDistanceFromDescriptor:(id)a3 toDescriptor:(id)a4;
+ (id)centermostFaceprintInCluster:(id)a3 faceObservations:(id)a4;
- (HMIGreedyClustering)initWithError:(id *)a3;
- (HMIGreedyClustering)initWithFaceThreshold:(id)a3 singleLinkThreshold:(id)a4 percentConnectionsThreshold:(id)a5 error:(id *)a6;
- (id).cxx_construct;
- (id)convertToClusters:(void *)a3;
- (id)getClustersWithFaces:(id)a3 error:(id *)a4;
@end

@implementation HMIGreedyClustering

+ (BOOL)addFaceObservations:(id)a3 toFaceDescriptorBuffer:(void *)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v20 = a3;
  v7 = [v20 objectAtIndex:0];
  v8 = [v7 faceprint];
  uint64_t __n = [v8 lengthInBytes];

  homeai::mod::ImageDescriptorBufferAbstract::resizeForDescriptorsCount((homeai::mod::ImageDescriptorBufferAbstract *)a4, [v20 count], 1);
  std::vector<long long>::resize((uint64_t)a4 + 8, [v20 count]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v20;
  uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    v19 = a5;
    int v10 = 0;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "faceprint", v19);
        v15 = [v14 descriptorData];

        DataForKthDescriptor = (void *)homeai::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor((homeai::mod::ImageDescriptorBufferAbstract *)a4, v10 + i);
        id v17 = v15;
        memcpy(DataForKthDescriptor, (const void *)[v17 bytes], __n);
        homeai::mod::ImageDescriptorBufferAbstract::setDescriptorIdForKthDescriptor((homeai::mod::ImageDescriptorBufferAbstract *)a4, v10 + i, [v13 faceId]);
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      v10 += i;
    }
    while (v9);
  }

  return 1;
}

- (HMIGreedyClustering)initWithError:(id *)a3
{
  return [(HMIGreedyClustering *)self initWithFaceThreshold:&unk_26D9A9D28 singleLinkThreshold:&unk_26D9A9D38 percentConnectionsThreshold:&unk_26D9A9D48 error:a3];
}

- (HMIGreedyClustering)initWithFaceThreshold:(id)a3 singleLinkThreshold:(id)a4 percentConnectionsThreshold:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v29.receiver = self;
  v29.super_class = (Class)HMIGreedyClustering;
  v13 = [(HMIGreedyClustering *)&v29 init];
  if (!v13)
  {
LABEL_10:
    v18 = v13;
    goto LABEL_11;
  }
  [v10 floatValue];
  if (v14 >= 0.0)
  {
    [v11 floatValue];
    if (v15 >= 0.0)
    {
      [v10 floatValue];
      int v27 = v19;
      [v11 floatValue];
      int v26 = v20;
      [v12 floatValue];
      int v25 = v21;
      std::allocate_shared[abi:ne180100]<homeai::clustering::GreedyClusterer,std::allocator<homeai::clustering::GreedyClusterer>,float,float,float,void>((float *)&v27, (float *)&v26, (float *)&v25, &v28);
      long long v22 = v28;
      long long v28 = 0uLL;
      long long v23 = (std::__shared_weak_count *)*((void *)v13 + 2);
      *(_OWORD *)(v13 + 8) = v22;
      if (v23)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v23);
        if (*((void *)&v28 + 1)) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v28 + 1));
        }
      }
      goto LABEL_10;
    }
  }
  v16 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1046];
  id v17 = v16;
  if (a6) {
    *a6 = v16;
  }
  HMIErrorLog(v13, v17);

  v18 = 0;
LABEL_11:

  return v18;
}

- (id)getClustersWithFaces:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 count])
  {
    v7 = [v6 objectAtIndexedSubscript:0];
    int v22 = 0;
    __p = 0;
    id v17 = 0;
    uint64_t v18 = 0;
    v8 = [v7 faceprint];
    unint64_t v9 = [v8 lengthInBytes];
    homeai::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v19, (void **)&__p, &v22, v9, 0, 0);
    int v20 = 1;
    int v21 = 0;
    v19[0] = &unk_26D987370;
    v19[12] = (void *)(v9 >> 2);

    if (__p)
    {
      id v17 = __p;
      operator delete(__p);
    }
    int v20 = 2;
    if ([(id)objc_opt_class() addFaceObservations:v6 toFaceDescriptorBuffer:v19 error:a4])
    {
      __p = 0;
      id v17 = 0;
      uint64_t v18 = 0;
      homeai::clustering::GreedyClusterer::performClustering((homeai::clustering::GreedyClusterer *)self->_greedyClusterer.__ptr_, v19, (uint64_t)&__p);
      id v10 = (void *)MEMORY[0x22A641C70]();
      id v11 = self;
      HMFGetOSLogHandle();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v24 = v13;
        _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Clustering successful", buf, 0xCu);
      }
      float v14 = [(HMIGreedyClustering *)v11 convertToClusters:&__p];
      if (__p)
      {
        id v17 = __p;
        operator delete(__p);
      }
    }
    else
    {
      float v14 = 0;
    }
    v19[0] = &unk_26D987370;
    free(v21);
    homeai::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(v19);
  }
  else
  {
    float v14 = [MEMORY[0x263EFF8C0] array];
  }

  return v14;
}

- (id)convertToClusters:(void *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  for (uint64_t i = *(void **)a3; i != *((void **)a3 + 1); i += 2)
  {
    v7 = [NSNumber numberWithLongLong:i[1]];
    v8 = [v5 objectForKeyedSubscript:v7];

    if (v8)
    {
      unint64_t v9 = [NSNumber numberWithLongLong:*i];
      [v8 addObject:v9];
    }
    else
    {
      id v10 = (void *)MEMORY[0x263EFF980];
      id v11 = [NSNumber numberWithLongLong:*i];
      v8 = [v10 arrayWithObject:v11];

      unint64_t v9 = [NSNumber numberWithLongLong:i[1]];
      [v5 setObject:v8 forKeyedSubscript:v9];
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = objc_msgSend(v5, "allKeys", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        id v17 = objc_alloc_init(MEMORY[0x263F1EE18]);
        uint64_t v18 = [v5 objectForKeyedSubscript:v16];
        [v17 setObjects:v18];
        objc_msgSend(v17, "setClusterId:", (int)objc_msgSend(v16, "intValue"));
        int v19 = [v17 objects];
        objc_msgSend(v17, "setTotalObjectCount:", objc_msgSend(v19, "count"));

        [v17 setShouldUpdateRepresentative:0];
        [v4 addObject:v17];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  return v4;
}

+ (float)faceDistanceFromDescriptor:(id)a3 toDescriptor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 length];
  if (v7 == [v6 length])
  {
    id v8 = v5;
    unint64_t v9 = (const float *)[v8 bytes];
    id v10 = v6;
    float __C = 0.0;
    vDSP_dotpr(v9, 1, (const float *)[v10 bytes], 1, &__C, 0x80uLL);
    float v11 = 1.0 - __C;

    return v11;
  }
  else
  {
    _HMFPreconditionFailure();
    __break(1u);
  }
  return result;
}

+ (id)centermostFaceprintInCluster:(id)a3 faceObservations:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v53 = a4;
  id v49 = v5;
  id v6 = [v5 objects];
  uint64_t v7 = [v6 count];

  if (!v7
    || ![v53 count]
    || ([v53 firstObject],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 faceprint],
        unint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        !v9))
  {
    _HMFPreconditionFailure();
LABEL_33:
    __break(1u);
  }
  id v10 = [v53 firstObject];
  float v11 = [v10 faceprint];
  int v12 = [v11 lengthInBytes];
  unint64_t v13 = (unint64_t)v12 >> 2;

  uint64_t v14 = v13;
  unint64_t v51 = v13;
  v52 = (char *)v47 - ((4 * v13 + 15) & 0x7FFFFFFF0);
  bzero(v52, 4 * (int)v13);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  float v15 = [v49 objects];
  v47[1] = v47;
  uint64_t v48 = 4 * (int)v13;
  id v50 = v15;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (!v16) {
    goto LABEL_14;
  }
  uint64_t v17 = (uint64_t)v12 >> 2;
  uint64_t v18 = *(void *)v59;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v59 != v18) {
        objc_enumerationMutation(v50);
      }
      int v20 = [*(id *)(*((void *)&v58 + 1) + 8 * i) intValue];
      long long v21 = [v53 objectAtIndexedSubscript:v20];
      long long v22 = [v21 faceprint];
      id v23 = [v22 descriptorData];
      long long v24 = (float *)[v23 bytes];

      uint64_t v25 = [v21 faceprint];
      LODWORD(v23) = v17 == (unint64_t)[v25 lengthInBytes] >> 2;

      if (!v23)
      {
        _HMFPreconditionFailure();
        goto LABEL_33;
      }
      uint64_t v26 = v14;
      int v27 = (float *)v52;
      if ((int)v51 >= 1)
      {
        do
        {
          float v28 = *v24++;
          *int v27 = v28 + *v27;
          ++v27;
          --v26;
        }
        while (v26);
      }
    }
    uint64_t v16 = [v50 countByEnumeratingWithState:&v58 objects:v63 count:16];
  }
  while (v16);
LABEL_14:

  if ((int)v51 >= 1)
  {
    objc_super v29 = (float *)v52;
    do
    {
      float v30 = *v29;
      v31 = [v49 objects];
      *objc_super v29 = v30 / (float)(unint64_t)[v31 count];

      ++v29;
      --v14;
    }
    while (v14);
  }
  v32 = [MEMORY[0x263EFF8F8] dataWithBytes:v52 length:v48];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v52 = [v49 objects];
  uint64_t v33 = [v52 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v55;
    int v35 = -1;
    float v36 = 100000.0;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v55 != v34) {
          objc_enumerationMutation(v52);
        }
        v38 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        int v39 = [v38 intValue];
        v40 = [v53 objectAtIndexedSubscript:v39];
        v41 = [v40 faceprint];
        v42 = [v41 descriptorData];

        +[HMIGreedyClustering faceDistanceFromDescriptor:v42 toDescriptor:v32];
        float v44 = v43;
        if (v43 < v36)
        {
          int v35 = [v38 intValue];
          float v36 = v44;
        }
      }
      uint64_t v33 = [v52 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v33);
  }
  else
  {
    int v35 = -1;
  }

  v45 = [v53 objectAtIndexedSubscript:v35];

  return v45;
}

- (void).cxx_destruct
{
  cntrl = self->_greedyClusterer.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end