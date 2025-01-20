@interface VNGreedyClusteringReadOnly
+ (id)clustererModelFileNamesFromState:(id)a3 storedInPath:(id)a4 error:(id *)a5;
+ (id)getRepresentativenessForFaces:(id)a3 error:(id *)a4;
+ (id)nonGroupedGroupID;
+ (void)addFaceObservations:(id)a3 toFaceDescriptorBuffer:(void *)a4;
+ (void)addFaceObservations:(id)a3 withGroupingIdentifiers:(id)a4 toFaceDescriptorBuffer:(void *)a5;
+ (void)addPersonData:(id)a3 withGroupingIdentifiers:(id)a4 toFaceDescriptorBuffer:(void *)a5;
- (BOOL)_parseOptions:(id)a3 error:(id *)a4;
- (BOOL)cancelClustering:(id *)a3;
- (VNGreedyClusteringReadOnly)initWithOptions:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)convertUpdatePairsToClusters:(void *)a3;
- (id)getAllClustersFromStateAndReturnError:(id *)a3;
- (id)getClusterState:(id *)a3;
- (id)getClusteredIds:(id *)a3;
- (id)getClustersForClusterIds:(id)a3 options:(id)a4 error:(id *)a5;
- (id)getDistanceBetweenLevel0ClustersWithFaceId:(id)a3 andFaceId:(id)a4 error:(id *)a5;
- (id)getDistanceBetweenLevel1Clusters:(id)a3 error:(id *)a4;
- (id)getDistances:(id)a3 to:(id)a4 error:(id *)a5;
- (id)getLevel0ClusteredIdsForFaceId:(id)a3 error:(id *)a4;
- (id)getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId:(id)a3 error:(id *)a4;
- (id)maximumFaceIdInModelAndReturnError:(id *)a3;
- (id)suggestionsForClusterIdsWithFlags:(id)a3 affinityThreshold:(float)a4 error:(id *)a5;
- (void)initializeLogging;
- (void)setGreedyClustererFaces_const:(shared_ptr<const vision::mod::FaceClustering>)a3;
@end

@implementation VNGreedyClusteringReadOnly

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->m_ClusteringImpl_const.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_ageClassifierFilePath, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_algorithmType, 0);
  objc_storeStrong((id *)&self->_cacheFolderPath, 0);
  objc_storeStrong((id *)&self->_suggestionsLogger, 0);

  objc_storeStrong((id *)&self->_clusteringLogger, 0);
}

- (BOOL)cancelClustering:(id *)a3
{
  return 1;
}

- (id)maximumFaceIdInModelAndReturnError:(id *)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__VNGreedyClusteringReadOnly_maximumFaceIdInModelAndReturnError___block_invoke;
  v5[3] = &unk_1E5B1C060;
  v5[4] = self;
  v5[5] = &v6;
  if (VNExecuteBlock(v5, (uint64_t)a3))
  {
    v3 = [NSNumber numberWithLongLong:v7[3]];
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __65__VNGreedyClusteringReadOnly_maximumFaceIdInModelAndReturnError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 88)
                                                                                                  + 128))(*(void *)(*(void *)(a1 + 32) + 88));
  return 1;
}

- (id)getDistances:(id)a3 to:(id)a4 error:(id *)a5
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  id v70 = a4;
  uint64_t v8 = [v70 count];
  if (!v8)
  {
    id v13 = (id)MEMORY[0x1E4F1CC08];
    goto LABEL_88;
  }
  BOOL v9 = [(NSString *)self->_algorithmType isEqualToString:@"VNClusteringAlgorithm_GreedyWithTorso"];
  int v101 = 0;
  [v70 objectAtIndexedSubscript:0];
  long long v83 = 0uLL;
  v67 = uint64_t v84 = 0;
  v10 = [v67 faceprint];
  unint64_t v11 = [v10 lengthInBytes];
  vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v98, (void **)&v83, &v101, v11, 0, 0);
  int v99 = 1;
  v100 = 0;
  v98[0] = &unk_1EF752918;
  v98[12] = (void *)(v11 >> 2);

  int v99 = 2;
  +[VNGreedyClusteringReadOnly addFaceObservations:v70 toFaceDescriptorBuffer:v98];
  memset(v97, 0, sizeof(v97));
  uint64_t v93 = 0;
  v94 = (int *)&v93;
  uint64_t v95 = 0x2020000000;
  int v96 = 0;
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __52__VNGreedyClusteringReadOnly_getDistances_to_error___block_invoke;
  v92[3] = &unk_1E5B1C060;
  v92[5] = &v93;
  v92[4] = self;
  if (VNExecuteBlock(v92, (uint64_t)a5))
  {
    if (v9)
    {
      v66 = 0;
      uint64_t v12 = 0;
      v94[6] /= 2;
    }
    else
    {
      vision::mod::descriptorBufferUnpackedScores(&v83, v98, (uint64_t)v97, v94[6]);
      v66 = (std::__shared_weak_count *)*((void *)&v83 + 1);
      uint64_t v12 = v83;
      *(_DWORD *)(v83 + 104) = 2;
    }
    v69 = [MEMORY[0x1E4F1CA60] dictionary];
    memset(v91, 0, sizeof(v91));
    if (v68)
    {
      uint64_t v62 = v12;
      *(void *)&long long v83 = 0;
      *((void *)&v83 + 1) = &v83;
      uint64_t v84 = 0xA812000000;
      v85 = __Block_byref_object_copy__280;
      v86 = __Block_byref_object_dispose__281;
      v87 = "";
      v81 = 0;
      long long v82 = 0uLL;
      uint64_t v15 = v94[6];
      vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v88, (void **)&v81, &v101, 4 * v15, 0, 0);
      int v89 = 1;
      v90 = 0;
      v88[0] = &unk_1EF752918;
      v88[12] = (void *)(v15 & 0x3FFFFFFFFFFFFFFFLL);
      *(_DWORD *)(*((void *)&v83 + 1) + 152) = 2;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      obunint64_t j = v68;
      uint64_t v16 = [obj countByEnumeratingWithState:&v77 objects:v102 count:16];
      v63 = self;
      unint64_t v65 = v8;
      v17 = 0;
      v18 = 0;
      if (v16)
      {
        unint64_t v19 = 0;
        uint64_t v20 = *(void *)v78;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v78 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = [*(id *)(*((void *)&v77 + 1) + 8 * i) unsignedIntegerValue];
            uint64_t v23 = v22;
            if ((unint64_t)v18 >= v19)
            {
              uint64_t v24 = v18 - v17;
              unint64_t v25 = v24 + 1;
              if ((unint64_t)(v24 + 1) >> 61) {
                std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
              }
              if ((uint64_t)(v19 - (void)v17) >> 2 > v25) {
                unint64_t v25 = (uint64_t)(v19 - (void)v17) >> 2;
              }
              if (v19 - (unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v26 = v25;
              }
              if (v26) {
                unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v26);
              }
              else {
                uint64_t v27 = 0;
              }
              v28 = (uint64_t *)(v26 + 8 * v24);
              uint64_t *v28 = v23;
              v29 = v28 + 1;
              while (v18 != v17)
              {
                uint64_t v30 = *--v18;
                *--v28 = v30;
              }
              unint64_t v19 = v26 + 8 * v27;
              if (v17) {
                operator delete(v17);
              }
              v17 = v28;
              v18 = v29;
            }
            else
            {
              *v18++ = v22;
            }
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v77 objects:v102 count:16];
        }
        while (v16);
      }

      uint64_t v31 = v65;
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3321888768;
      v73[2] = __52__VNGreedyClusteringReadOnly_getDistances_to_error___block_invoke_283;
      v73[3] = &unk_1EF7541E8;
      v73[4] = v63;
      __p = 0;
      v75 = 0;
      uint64_t v76 = 0;
      std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, v17, (uint64_t)v18, v18 - v17);
      v73[5] = &v83;
      if ((VNExecuteBlock(v73, (uint64_t)a5) & 1) == 0)
      {
        if (__p)
        {
          v75 = __p;
          operator delete(__p);
        }
        if (v17) {
          operator delete(v17);
        }
        _Block_object_dispose(&v83, 8);
        v88[0] = &unk_1EF752918;
        free(v90);
        vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(v88);
        id v13 = 0;
        goto LABEL_80;
      }
      if (v62) {
        (*(void (**)(float **__return_ptr))(*(void *)v62 + 80))(&v81);
      }
      else {
        vision::mod::ImageDescriptorBufferFloat32::computeDistancesFrom((vision::mod::ImageDescriptorBufferFloat32 *)v98, (vDSP_Length *)(*((void *)&v83 + 1) + 48), &v81);
      }
      if (v91[0]) {
        operator delete(v91[0]);
      }
      v49 = v81;
      v91[0] = v81;
      uint64_t v64 = v82;
      *(_OWORD *)&v91[1] = v82;
      if ([obj count] * v65 == (v64 - (uint64_t)v49) >> 2)
      {
        uint64_t v50 = 0;
        if (v65 <= 1) {
          uint64_t v31 = 1;
        }
        do
        {
          v51 = [MEMORY[0x1E4F1CA60] dictionary];
          for (unint64_t j = 0; ; ++j)
          {
            unint64_t v53 = [obj count];
            v54 = NSNumber;
            if (v53 <= j) {
              break;
            }
            *(float *)&double v55 = v49[j + v50 * [obj count]];
            v56 = [v54 numberWithFloat:v55];
            v57 = [obj objectAtIndexedSubscript:j];
            [v51 setObject:v56 forKeyedSubscript:v57];
          }
          v58 = [v70 objectAtIndexedSubscript:v50];
          v59 = objc_msgSend(v54, "numberWithUnsignedInteger:", objc_msgSend(v58, "faceId"));
          [v69 setObject:v51 forKeyedSubscript:v59];

          ++v50;
        }
        while (v50 != v31);
      }
      if (__p)
      {
        v75 = __p;
        operator delete(__p);
      }
      if (v17) {
        operator delete(v17);
      }
      _Block_object_dispose(&v83, 8);
      v88[0] = &unk_1EF752918;
      free(v90);
      vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(v88);
    }
    else
    {
      if (v12) {
        (*(void (**)(long long *__return_ptr, uint64_t))(*(void *)v12 + 96))(&v83, v12);
      }
      else {
        vision::mod::ImageDescriptorBufferFloat32::computeSelfDistances((uint64_t)v98, &v83);
      }
      uint64_t v32 = v12;
      *(_OWORD *)v91 = v83;
      v91[2] = (void *)v84;
      uint64_t v33 = 0;
      obja = (_DWORD *)v83;
      do
      {
        v34 = [MEMORY[0x1E4F1CA60] dictionary];
        for (uint64_t k = 0; k != v8; ++k)
        {
          v36 = NSNumber;
          if (v33 == k)
          {
            v37 = [v70 objectAtIndexedSubscript:v33];
            v38 = objc_msgSend(v36, "numberWithUnsignedInteger:", objc_msgSend(v37, "faceId"));
            [v34 setObject:&unk_1EF7A6C80 forKeyedSubscript:v38];
          }
          else
          {
            double v39 = 0.0;
            if (v33 != k)
            {
              int v40 = *(_DWORD *)(v32 + 72);
              if (v40 <= (int)v33 || v40 <= (int)k)
              {
                exception = __cxa_allocate_exception(8uLL);
                void *exception = 3692;
                __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
              }
              if ((int)v33 <= (int)k) {
                int v42 = k;
              }
              else {
                int v42 = v33;
              }
              if ((int)v33 >= (int)k) {
                int v43 = k;
              }
              else {
                int v43 = v33;
              }
              LODWORD(v39) = obja[v43 + (v42 - 1) * v42 / 2];
            }
            v37 = [NSNumber numberWithFloat:v39];
            v44 = NSNumber;
            v38 = [v70 objectAtIndexedSubscript:k];
            v45 = objc_msgSend(v44, "numberWithUnsignedInteger:", objc_msgSend(v38, "faceId"));
            [v34 setObject:v37 forKeyedSubscript:v45];
          }
        }
        v46 = NSNumber;
        v47 = [v70 objectAtIndexedSubscript:v33];
        v48 = objc_msgSend(v46, "numberWithUnsignedInteger:", objc_msgSend(v47, "faceId"));
        [v69 setObject:v34 forKeyedSubscript:v48];

        ++v33;
      }
      while (v33 != v8);
    }
    id v13 = v69;
LABEL_80:
    if (v91[0]) {
      operator delete(v91[0]);
    }

    v14 = (void *)v97[0];
    goto LABEL_83;
  }
  v14 = 0;
  v66 = 0;
  id v13 = 0;
LABEL_83:
  _Block_object_dispose(&v93, 8);
  if (v14) {
    operator delete(v14);
  }
  v98[0] = &unk_1EF752918;
  free(v100);
  vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(v98);
  if (v66) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v66);
  }

LABEL_88:

  return v13;
}

uint64_t __52__VNGreedyClusteringReadOnly_getDistances_to_error___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 88)
                                                                                                  + 168))(*(void *)(*(void *)(a1 + 32) + 88));
  return 1;
}

uint64_t __52__VNGreedyClusteringReadOnly_getDistances_to_error___block_invoke_283(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 88);
  v5 = 0;
  uint64_t v6 = 0;
  __p = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, *(const void **)(a1 + 48), *(void *)(a1 + 56), (uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 3);
  (*(void (**)(uint64_t, void **, uint64_t))(*(void *)v2 + 176))(v2, &__p, *(void *)(*(void *)(a1 + 40) + 8) + 48);
  if (__p)
  {
    v5 = __p;
    operator delete(__p);
  }
  return 1;
}

- (id)getClustersForClusterIds:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v9 = v8;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x4812000000;
  unint64_t v53 = __Block_byref_object_copy__273;
  v54 = __Block_byref_object_dispose__274;
  double v55 = "";
  memset(v56, 0, sizeof(v56));
  if (v6)
  {
    id v30 = v8;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v31 = v6;
    obunint64_t j = v6;
    uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v47 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = [*(id *)(*((void *)&v46 + 1) + 8 * i) unsignedIntegerValue];
          v37 = 0;
          v38 = &v37;
          uint64_t v39 = 0x4812000000;
          int v40 = __Block_byref_object_copy__224;
          v41 = __Block_byref_object_dispose__225;
          int v42 = "";
          v44 = 0;
          uint64_t v45 = 0;
          __p = 0;
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __69__VNGreedyClusteringReadOnly_getClustersForClusterIds_options_error___block_invoke;
          v36[3] = &unk_1E5B1FD40;
          v36[5] = &v37;
          v36[6] = v13;
          v36[4] = self;
          if ((VNExecuteBlock(v36, (uint64_t)a5) & 1) == 0)
          {
            _Block_object_dispose(&v37, 8);
            if (__p)
            {
              v44 = __p;
              operator delete(__p);
            }

            id v6 = v31;
            BOOL v9 = v30;
            goto LABEL_28;
          }
          v14 = v51;
          uint64_t v15 = v51 + 6;
          uint64_t v16 = (uint64_t)(v38 + 6);
          unint64_t v17 = v51[7];
          if (v17 >= v51[8])
          {
            uint64_t v18 = std::vector<std::vector<long long>>::__push_back_slow_path<std::vector<long long> const&>(v15, v16);
          }
          else
          {
            std::vector<std::vector<long long>>::__construct_one_at_end[abi:ne180100]<std::vector<long long> const&>((uint64_t)v15, v16);
            uint64_t v18 = v17 + 24;
          }
          v14[7] = v18;
          _Block_object_dispose(&v37, 8);
          if (__p)
          {
            v44 = __p;
            operator delete(__p);
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v6 = v31;
    BOOL v9 = v30;
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__VNGreedyClusteringReadOnly_getClustersForClusterIds_options_error___block_invoke_2;
    aBlock[3] = &unk_1E5B1C060;
    aBlock[5] = &v50;
    aBlock[4] = self;
    unint64_t v19 = _Block_copy(aBlock);
    int v20 = VNExecuteBlock(v19, (uint64_t)a5);

    if (!v20)
    {
LABEL_28:
      id v28 = 0;
      goto LABEL_29;
    }
  }
  v21 = v51;
  uint64_t v22 = (void *)v51[6];
  if (v22 != (void *)v51[7])
  {
    do
    {
      if (*v22 != v22[1])
      {
        uint64_t v23 = objc_alloc_init(VNCluster);
        id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        for (unint64_t j = (void *)*v22; j != (void *)v22[1]; ++j)
        {
          unint64_t v26 = [NSNumber numberWithLongLong:*j];
          [v24 addObject:v26];
        }
        [(VNCluster *)v23 setObjects:v24];
        -[VNCluster setTotalObjectCount:](v23, "setTotalObjectCount:", [v24 count]);
        uint64_t v27 = [v24 objectAtIndexedSubscript:0];
        -[VNCluster setClusterId:](v23, "setClusterId:", [v27 unsignedIntegerValue]);

        [v9 addObject:v23];
        v21 = v51;
      }
      v22 += 3;
    }
    while (v22 != (void *)v21[7]);
  }
  id v28 = v9;
LABEL_29:
  _Block_object_dispose(&v50, 8);
  v37 = (void **)v56;
  std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100](&v37);

  return v28;
}

uint64_t __69__VNGreedyClusteringReadOnly_getClustersForClusterIds_options_error___block_invoke(void *a1)
{
  return 1;
}

uint64_t __69__VNGreedyClusteringReadOnly_getClustersForClusterIds_options_error___block_invoke_2(uint64_t a1)
{
  (*(void (**)(long long *__return_ptr))(**(void **)(*(void *)(a1 + 32) + 88) + 144))(&v5);
  uint64_t v2 = *(uint64_t **)(*(void *)(a1 + 40) + 8);
  v3 = (void **)(v2 + 6);
  if (v2[6])
  {
    std::vector<std::vector<long long>>::__clear[abi:ne180100](v2 + 6);
    operator delete(*v3);
    void *v3 = 0;
    v2[7] = 0;
    v2[8] = 0;
  }
  *((_OWORD *)v2 + 3) = v5;
  v2[8] = v6;
  uint64_t v6 = 0;
  long long v5 = 0uLL;
  id v7 = (void **)&v5;
  std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100](&v7);
  return 1;
}

- (id)getAllClustersFromStateAndReturnError:(id *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  (*(void (**)(void **__return_ptr))(*(void *)self->m_ClusteringImpl_const.__ptr_ + 152))(&v13);
  uint64_t v6 = v13;
  for (uint64_t i = v14; v6 != i; v6 += 3)
  {
    if (*v6 != v6[1])
    {
      id v7 = objc_alloc_init(VNCluster);
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      for (unint64_t j = (void *)*v6; j != (void *)v6[1]; ++j)
      {
        uint64_t v10 = [NSNumber numberWithLongLong:*j];
        [v8 addObject:v10];
      }
      [(VNCluster *)v7 setObjects:v8];
      -[VNCluster setTotalObjectCount:](v7, "setTotalObjectCount:", [v8 count]);
      uint64_t v11 = [v8 objectAtIndexedSubscript:0];
      -[VNCluster setClusterId:](v7, "setClusterId:", [v11 unsignedIntegerValue]);

      [v4 addObject:v7];
      uint64_t i = v14;
    }
  }
  uint64_t v15 = (void **)&v13;
  std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100](&v15);

  return v4;
}

- (id)getDistanceBetweenLevel1Clusters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6 && [v6 count] == 2)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__VNGreedyClusteringReadOnly_getDistanceBetweenLevel1Clusters_error___block_invoke;
    aBlock[3] = &unk_1E5B1DFB0;
    aBlock[4] = self;
    id v14 = v7;
    id v9 = v8;
    id v15 = v9;
    uint64_t v10 = _Block_copy(aBlock);
    if (VNExecuteBlock(v10, (uint64_t)a4)) {
      id v11 = v9;
    }
    else {
      id v11 = 0;
    }
  }
  else if (a4)
  {
    +[VNError errorWithCode:1 message:@"Parameter validation failed for getDistanceBetweenLevel1Clusters"];
    id v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

uint64_t __69__VNGreedyClusteringReadOnly_getDistanceBetweenLevel1Clusters_error___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v36[0] = 0;
  v36[1] = 0;
  v35 = v36;
  (*(void (**)(void, void ***))(**(void **)(*(void *)(a1 + 32) + 88) + 112))(*(void *)(*(void *)(a1 + 32) + 88), &v35);
  id v14 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
  [*(id *)(a1 + 40) objectAtIndexedSubscript:1];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x4812000000;
  id v31 = __Block_byref_object_copy__224;
  uint64_t v32 = __Block_byref_object_dispose__225;
  id v15 = v33 = "";
  int v20 = 0;
  std::vector<long long>::vector(v34, [v15 count], &v20);
  *(void *)v29[6] = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __69__VNGreedyClusteringReadOnly_getDistanceBetweenLevel1Clusters_error___block_invoke_2;
  v27[3] = &unk_1E5B1AC98;
  v27[4] = &v28;
  [v15 enumerateObjectsUsingBlock:v27];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obunint64_t j = v14;
  uint64_t v2 = [obj countByEnumeratingWithState:&v23 objects:v37 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v24 != v3) {
          objc_enumerationMutation(obj);
        }
        long long v5 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        int v20 = 0;
        v21 = 0;
        uint64_t v22 = 0;
        uint64_t v6 = [v5 unsignedIntegerValue];
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 88);
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        __p = 0;
        std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, (const void *)v29[6], v29[7], (v29[7] - v29[6]) >> 3);
        (*(void (**)(uint64_t, uint64_t, void **, void ***, void **))(*(void *)v7 + 104))(v7, v6, &__p, &v35, &v20);
        if (__p)
        {
          uint64_t v18 = __p;
          operator delete(__p);
        }
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v10 = v20;
        id v11 = v21;
        while (v10 != v11)
        {
          LODWORD(v9) = *v10;
          uint64_t v12 = [NSNumber numberWithFloat:v9];
          [v8 addObject:v12];

          ++v10;
        }
        [*(id *)(a1 + 48) setObject:v8 forKey:v5];

        if (v20)
        {
          v21 = v20;
          operator delete(v20);
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v23 objects:v37 count:16];
    }
    while (v2);
  }

  _Block_object_dispose(&v28, 8);
  if (v34[0])
  {
    v34[1] = v34[0];
    operator delete(v34[0]);
  }

  std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v36[0]);
  return 1;
}

void __69__VNGreedyClusteringReadOnly_getDistanceBetweenLevel1Clusters_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) + 8 * a3) = [v5 unsignedIntegerValue];
}

- (id)getDistanceBetweenLevel0ClustersWithFaceId:(id)a3 andFaceId:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  id v11 = 0;
  if (v8 && v9)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__243;
    uint64_t v22 = __Block_byref_object_dispose__244;
    id v23 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __89__VNGreedyClusteringReadOnly_getDistanceBetweenLevel0ClustersWithFaceId_andFaceId_error___block_invoke;
    v14[3] = &unk_1E5B1AC70;
    v14[4] = self;
    id v15 = v8;
    id v16 = v10;
    unint64_t v17 = &v18;
    uint64_t v12 = _Block_copy(v14);
    if (VNExecuteBlock(v12, (uint64_t)a5)) {
      id v11 = (id)v19[5];
    }
    else {
      id v11 = 0;
    }

    _Block_object_dispose(&v18, 8);
  }

  return v11;
}

uint64_t __89__VNGreedyClusteringReadOnly_getDistanceBetweenLevel0ClustersWithFaceId_andFaceId_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) logEnabled])
  {
    [*(id *)(*(void *)(a1 + 32) + 16) resetFileNameURLWithCurentDateTime];
    v9[0] = 0;
    v9[1] = 0;
    id v8 = v9;
    (*(void (**)(void, void ***))(**(void **)(*(void *)(a1 + 32) + 88) + 112))(*(void *)(*(void *)(a1 + 32) + 88), &v8);
    [*(id *)(*(void *)(a1 + 32) + 16) logClusterMapL1:&v8];
    v7[0] = 0;
    v7[1] = 0;
    uint64_t v6 = v7;
    (*(void (**)(void, void ***))(**(void **)(*(void *)(a1 + 32) + 88) + 72))(*(void *)(*(void *)(a1 + 32) + 88), &v6);
    [*(id *)(*(void *)(a1 + 32) + 16) logClusterMapL0:&v6];
    std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v7[0]);
    std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v9[0]);
  }
  LODWORD(v8) = 0;
  uint64_t v2 = (*(uint64_t (**)(void, uint64_t, uint64_t, void ***))(**(void **)(*(void *)(a1 + 32) + 88)
                                                                       + 96))(*(void *)(*(void *)(a1 + 32) + 88), [*(id *)(a1 + 40) unsignedLongValue], objc_msgSend(*(id *)(a1 + 48), "unsignedLongValue"), &v8);
  if (v2 == 5248)
  {
    LODWORD(v3) = v8;
    id v4 = [NSNumber numberWithFloat:v3];
  }
  else
  {
    id v4 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v4);
  if (v2 == 5248) {

  }
  return 1;
}

- (id)getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v46 = 0;
    long long v47 = &v46;
    uint64_t v48 = 0x4812000000;
    long long v49 = __Block_byref_object_copy_;
    uint64_t v50 = __Block_byref_object_dispose_;
    v51 = "";
    v53[0] = 0;
    v53[1] = 0;
    uint64_t v52 = v53;
    uint64_t v42 = 0;
    int v43 = &v42;
    uint64_t v44 = 0x2020000000;
    uint64_t v45 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__VNGreedyClusteringReadOnly_getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId_error___block_invoke;
    aBlock[3] = &unk_1E5B1D1A0;
    aBlock[4] = self;
    int v40 = &v46;
    v41 = &v42;
    id v8 = v6;
    id v39 = v8;
    id v9 = _Block_copy(aBlock);
    if (VNExecuteBlock(v9, (uint64_t)a4))
    {
      uint64_t v10 = (void *)v47[7];
      if (!v10) {
LABEL_10:
      }
        std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      uint64_t v11 = v43[3];
      while (1)
      {
        while (1)
        {
          uint64_t v12 = v10[4];
          if (v11 >= v12) {
            break;
          }
          uint64_t v10 = (void *)*v10;
          if (!v10) {
            goto LABEL_10;
          }
        }
        if (v12 >= v11) {
          break;
        }
        uint64_t v10 = (void *)v10[1];
        if (!v10) {
          goto LABEL_10;
        }
      }
      uint64_t v15 = v10[6] - v10[5];
      if (v15)
      {
        id v16 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:v15 >> 3];
        unint64_t v17 = (void *)v10[5];
        for (uint64_t i = (void *)v10[6]; v17 != i; ++v17)
        {
          uint64_t v19 = [NSNumber numberWithLongLong:*v17];
          [v16 addObject:v19];
        }
        uint64_t v32 = 0;
        uint64_t v33 = &v32;
        uint64_t v34 = 0x3032000000;
        v35 = __Block_byref_object_copy__243;
        v36 = __Block_byref_object_dispose__244;
        id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __90__VNGreedyClusteringReadOnly_getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId_error___block_invoke_245;
        v31[3] = &unk_1E5B1AC48;
        v31[4] = self;
        v31[5] = &v32;
        uint64_t v20 = (uint64_t (**)(void *, void *, id, id *))_Block_copy(v31);
        if (v20[2](v20, v8, v16, a4))
        {
          while ([v16 count])
          {
            v21 = [v16 firstObject];
            char v22 = v20[2](v20, v21, v16, a4);

            if ((v22 & 1) == 0) {
              goto LABEL_21;
            }
          }
          id v14 = (id)v33[5];
        }
        else
        {
LABEL_21:
          id v14 = 0;
        }

        _Block_object_dispose(&v32, 8);
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId: Level-1 cluster size is zero for a valid clusterID descriptor (%lld)", v43[3]);
        id v16 = objc_claimAutoreleasedReturnValue();
        uint64_t v23 = [v16 UTF8String];
        VNValidatedLog(4, @"%s", v24, v25, v26, v27, v28, v29, v23);
        if (a4)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:v16];
          id v14 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v14 = 0;
        }
      }
    }
    else
    {
      id v14 = 0;
    }

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v46, 8);
    std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v53[0]);
  }
  else
  {
    uint64_t v13 = [NSString stringWithFormat:@"getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId: faceId (%@) is not initialized", 0];
    if (a4)
    {
      *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:v13];
    }

    id v14 = 0;
  }

  return v14;
}

BOOL __90__VNGreedyClusteringReadOnly_getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId_error___block_invoke(uint64_t a1, void *a2)
{
  (*(void (**)(void, uint64_t))(**(void **)(*(void *)(a1 + 32) + 88) + 112))(*(void *)(*(void *)(a1 + 32) + 88), *(void *)(*(void *)(a1 + 48) + 8) + 48);
  if ([*(id *)(*(void *)(a1 + 32) + 16) logEnabled])
  {
    [*(id *)(*(void *)(a1 + 32) + 16) resetFileNameURLWithCurentDateTime];
    [*(id *)(*(void *)(a1 + 32) + 16) logClusterMapL1:*(void *)(*(void *)(a1 + 48) + 8) + 48];
    v16[0] = 0;
    v16[1] = 0;
    uint64_t v15 = v16;
    (*(void (**)(void, void ***))(**(void **)(*(void *)(a1 + 32) + 88) + 72))(*(void *)(*(void *)(a1 + 32) + 88), &v15);
    [*(id *)(*(void *)(a1 + 32) + 16) logClusterMapL0:&v15];
    std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v16[0]);
  }
  uint64_t v4 = (*(uint64_t (**)(void, uint64_t))(**(void **)(*(void *)(a1 + 32) + 88) + 120))(*(void *)(*(void *)(a1 + 32) + 88), [*(id *)(a1 + 40) longLongValue]);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v4;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v4;
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v5 == -1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId: There is no level-1 cluster that contains faceId = %d", objc_msgSend(*(id *)(a1 + 40), "intValue"));
    id v6 = objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 UTF8String];
    VNValidatedLog(4, @"%s", v8, v9, v10, v11, v12, v13, v7);
    if (a2)
    {
      *a2 = +[VNError errorForInternalErrorWithLocalizedDescription:v6];
    }
  }
  return v5 != -1;
}

BOOL __90__VNGreedyClusteringReadOnly_getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId_error___block_invoke_245(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = [*(id *)(a1 + 32) getLevel0ClusteredIdsForFaceId:a2 error:a4];
  if (v8)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
    [v7 minusOrderedSet:v8];
  }

  return v8 != 0;
}

- (id)getLevel0ClusteredIdsForFaceId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x4812000000;
  uint64_t v29 = __Block_byref_object_copy__227;
  uint64_t v30 = __Block_byref_object_dispose__228;
  uint64_t v31 = 0;
  v32[0] = v32;
  v32[1] = v32;
  v32[2] = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __67__VNGreedyClusteringReadOnly_getLevel0ClusteredIdsForFaceId_error___block_invoke;
  unint64_t v17 = &unk_1E5B1D1A0;
  uint64_t v20 = &v22;
  uint64_t v18 = self;
  id v7 = v6;
  id v19 = v7;
  v21 = &v26;
  if ((VNExecuteBlock(&v14, (uint64_t)a4) & 1) == 0)
  {
LABEL_8:
    a4 = 0;
    goto LABEL_9;
  }
  if (v23[3] != 5248)
  {
    if (!a4) {
      goto LABEL_9;
    }
    id v11 = [NSString alloc];
    uint64_t v12 = objc_msgSend(v11, "initWithFormat:", @"getting clusters failed with error: %lld", v23[3], v14, v15, v16, v17, v18);
    *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:v12];

    goto LABEL_8;
  }
  a4 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:v27[8]];
  uint64_t v8 = v27 + 6;
  uint64_t v9 = (uint64_t *)v27[7];
  if (v9 != v27 + 6)
  {
    do
    {
      uint64_t v10 = [NSNumber numberWithLongLong:v9[2]];
      [a4 addObject:v10];

      uint64_t v9 = (uint64_t *)v9[1];
    }
    while (v9 != v8);
  }
LABEL_9:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  std::__list_imp<long long>::clear(v32);

  return a4;
}

uint64_t __67__VNGreedyClusteringReadOnly_getLevel0ClusteredIdsForFaceId_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void, void, uint64_t))(**(void **)(*(void *)(a1 + 32) + 88) + 88))(*(void *)(*(void *)(a1 + 32) + 88), [*(id *)(a1 + 40) unsignedIntValue], *(void *)(*(void *)(a1 + 56) + 8) + 48);
  return 1;
}

- (id)getClusteredIds:(id *)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x4812000000;
  uint64_t v14 = __Block_byref_object_copy__224;
  uint64_t v15 = __Block_byref_object_dispose__225;
  id v16 = "";
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  __p = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__VNGreedyClusteringReadOnly_getClusteredIds___block_invoke;
  v10[3] = &unk_1E5B1C060;
  v10[4] = self;
  v10[5] = &v11;
  if (VNExecuteBlock(v10, (uint64_t)a3))
  {
    for (uint64_t i = (void *)v12[6]; i != (void *)v12[7]; ++i)
    {
      id v7 = [NSNumber numberWithLongLong:*i];
      [v5 addObject:v7];
    }
    id v8 = v5;
  }
  else
  {
    id v8 = 0;
  }
  _Block_object_dispose(&v11, 8);
  if (__p)
  {
    uint64_t v18 = __p;
    operator delete(__p);
  }

  return v8;
}

uint64_t __46__VNGreedyClusteringReadOnly_getClusteredIds___block_invoke(uint64_t a1)
{
  return 1;
}

- (id)getClusterState:(id *)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x4012000000;
  uint64_t v10 = __Block_byref_object_copy__221;
  uint64_t v11 = __Block_byref_object_dispose__222;
  uint64_t v12 = "";
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__VNGreedyClusteringReadOnly_getClusterState___block_invoke;
  v6[3] = &unk_1E5B1C060;
  v6[4] = self;
  v6[5] = &v7;
  if ((VNExecuteBlock(v6, (uint64_t)a3) & 1) != 0 && (double v3 = (void *)v8[6]) != 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:*v3 length:v3[1] - *v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v14);
  }

  return v4;
}

uint64_t __46__VNGreedyClusteringReadOnly_getClusterState___block_invoke(uint64_t a1)
{
  (*(void (**)(long long *__return_ptr))(**(void **)(*(void *)(a1 + 32) + 88) + 48))(&v6);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v3 = v6;
  long long v6 = 0uLL;
  uint64_t v4 = *(std::__shared_weak_count **)(v2 + 56);
  *(_OWORD *)(v2 + 48) = v3;
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100](v4);
    if (*((void *)&v6 + 1)) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v6 + 1));
    }
  }
  return 1;
}

- (id)suggestionsForClusterIdsWithFlags:(id)a3 affinityThreshold:(float)a4 error:(id *)a5
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  id v100 = a3;
  context = (void *)MEMORY[0x1A6257080]();
  [(VNClusteringLogger *)self->_suggestionsLogger resetFileNameURLWithCurentDateTime];
  [(VNSuggestionsLogger *)self->_suggestionsLogger logInputFaceIdsWithFlags:v100];
  v179[0] = 0;
  v179[1] = v179;
  v179[2] = 0x4812000000;
  v179[3] = __Block_byref_object_copy_;
  v179[4] = __Block_byref_object_dispose_;
  v179[5] = "";
  v180[1] = 0;
  v180[0] = 0;
  v179[6] = v180;
  v178[0] = MEMORY[0x1E4F143A8];
  v178[1] = 3221225472;
  v178[2] = __88__VNGreedyClusteringReadOnly_suggestionsForClusterIdsWithFlags_affinityThreshold_error___block_invoke;
  v178[3] = &unk_1E5B1C060;
  v178[4] = self;
  v178[5] = v179;
  id v177 = 0;
  char v6 = VNExecuteBlock(v178, (uint64_t)&v177);
  uint64_t v7 = self;
  id v8 = v177;
  if ((v6 & 1) == 0)
  {
    uint64_t v30 = 0;
    goto LABEL_20;
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v10 = [v100 allKeys];
  uint64_t v103 = v7;
  v108 = objc_msgSend(v9, "dictionaryWithCapacity:", objc_msgSend(v10, "count"));

  uint64_t v11 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v12 = [v100 allKeys];
  v107 = objc_msgSend(v11, "dictionaryWithCapacity:", objc_msgSend(v12, "count"));

  id v96 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v176 = 0u;
  long long v175 = 0u;
  long long v174 = 0u;
  long long v173 = 0u;
  uint64_t v13 = [v100 allKeys];
  obuint64_t j = v13;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v173 objects:v191 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v174;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v174 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v173 + 1) + 8 * i);
        uint64_t v158 = 0;
        v159 = &v158;
        uint64_t v160 = 0x2020000000;
        uint64_t v161 = -1;
        v172[0] = MEMORY[0x1E4F143A8];
        v172[1] = 3221225472;
        v172[2] = __88__VNGreedyClusteringReadOnly_suggestionsForClusterIdsWithFlags_affinityThreshold_error___block_invoke_2;
        v172[3] = &unk_1E5B1ECB8;
        v172[6] = &v158;
        v172[4] = v103;
        v172[5] = v17;
        id v171 = v8;
        char v18 = VNExecuteBlock(v172, (uint64_t)&v171);
        id v19 = v171;

        id v8 = v19;
        if ((v18 & 1) == 0)
        {
          _Block_object_dispose(&v158, 8);
          uint64_t v13 = obj;
          goto LABEL_17;
        }
        if ((v159[3] & 0x8000000000000000) == 0)
        {
          uint64_t v20 = objc_msgSend(NSNumber, "numberWithLongLong:");
          v21 = [v108 objectForKey:v20];
          BOOL v22 = v21 == 0;

          if (v22)
          {
            id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            uint64_t v24 = [NSNumber numberWithLongLong:v159[3]];
            [v108 setObject:v23 forKeyedSubscript:v24];

            id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            uint64_t v26 = [NSNumber numberWithLongLong:v159[3]];
            [v107 setObject:v25 forKeyedSubscript:v26];

            uint64_t v27 = [v100 objectForKeyedSubscript:v17];
            int v28 = [v27 isEqual:MEMORY[0x1E4F1CC28]];

            if (v28)
            {
              uint64_t v29 = [NSNumber numberWithLongLong:v159[3]];
              [v96 addObject:v29];
            }
          }
        }
        _Block_object_dispose(&v158, 8);
      }
      uint64_t v13 = obj;
      uint64_t v14 = [obj countByEnumeratingWithState:&v173 objects:v191 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  if (v8) {
    goto LABEL_18;
  }
  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  uint64_t v33 = [v108 allKeys];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v167 objects:v190 count:16];
  if (!v34)
  {

LABEL_58:
    [(VNSuggestionsLogger *)v103->_suggestionsLogger logAllSuggestons:v108];
    [(VNSuggestionsLogger *)v103->_suggestionsLogger logFilteredByInputQuerySuggestons:v107];
    id v110 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v146 = 0u;
    long long v147 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    id v99 = [v107 allKeys];
    uint64_t v53 = [v99 countByEnumeratingWithState:&v144 objects:v188 count:16];
    if (v53)
    {
      uint64_t v101 = *(void *)v145;
      do
      {
        uint64_t v54 = 0;
        uint64_t v102 = v53;
        do
        {
          if (*(void *)v145 != v101) {
            objc_enumerationMutation(v99);
          }
          uint64_t v106 = v54;
          double v55 = *(void **)(*((void *)&v144 + 1) + 8 * v54);
          v104 = (void *)MEMORY[0x1A6257080]();
          v112 = [v107 objectForKeyedSubscript:v55];
          long long v142 = 0u;
          long long v143 = 0u;
          long long v140 = 0u;
          long long v141 = 0u;
          id objb = [v107 allKeys];
          uint64_t v56 = [objb countByEnumeratingWithState:&v140 objects:v187 count:16];
          if (v56)
          {
            uint64_t v57 = *(void *)v141;
            do
            {
              for (uint64_t j = 0; j != v56; ++j)
              {
                if (*(void *)v141 != v57) {
                  objc_enumerationMutation(objb);
                }
                v59 = *(void **)(*((void *)&v140 + 1) + 8 * j);
                uint64_t v60 = [v55 unsignedIntegerValue];
                if (v60 != [v59 unsignedIntegerValue]
                  && [v112 containsObject:v59])
                {
                  if ([v110 count])
                  {
                    long long v138 = 0u;
                    long long v139 = 0u;
                    long long v136 = 0u;
                    long long v137 = 0u;
                    id v61 = v110;
                    uint64_t v62 = [v61 countByEnumeratingWithState:&v136 objects:v186 count:16];
                    if (v62)
                    {
                      uint64_t v63 = *(void *)v137;
                      while (2)
                      {
                        for (uint64_t k = 0; k != v62; ++k)
                        {
                          if (*(void *)v137 != v63) {
                            objc_enumerationMutation(v61);
                          }
                          unint64_t v65 = *(void **)(*((void *)&v136 + 1) + 8 * k);
                          if ([v65 containsObject:v55])
                          {
                            [v65 addObject:v59];
                            goto LABEL_91;
                          }
                        }
                        uint64_t v62 = [v61 countByEnumeratingWithState:&v136 objects:v186 count:16];
                        if (v62) {
                          continue;
                        }
                        break;
                      }
                    }

                    long long v134 = 0u;
                    long long v135 = 0u;
                    long long v132 = 0u;
                    long long v133 = 0u;
                    id v61 = v61;
                    uint64_t v66 = [v61 countByEnumeratingWithState:&v132 objects:v185 count:16];
                    if (v66)
                    {
                      uint64_t v67 = *(void *)v133;
                      while (2)
                      {
                        for (uint64_t m = 0; m != v66; ++m)
                        {
                          if (*(void *)v133 != v67) {
                            objc_enumerationMutation(v61);
                          }
                          v69 = *(void **)(*((void *)&v132 + 1) + 8 * m);
                          if ([v69 containsObject:v59])
                          {
                            [v69 addObject:v55];
                            goto LABEL_91;
                          }
                        }
                        uint64_t v66 = [v61 countByEnumeratingWithState:&v132 objects:v185 count:16];
                        if (v66) {
                          continue;
                        }
                        break;
                      }
                    }

                    id v70 = [MEMORY[0x1E4F1CA80] setWithObject:v55];
                    [v70 addObject:v59];
                    [v61 addObject:v70];
                    id v61 = v70;
                  }
                  else
                  {
                    id v61 = [MEMORY[0x1E4F1CA80] setWithObject:v55];
                    [v61 addObject:v59];
                    [v110 addObject:v61];
                  }
LABEL_91:
                }
              }
              uint64_t v56 = [objb countByEnumeratingWithState:&v140 objects:v187 count:16];
            }
            while (v56);
          }

          uint64_t v54 = v106 + 1;
        }
        while (v106 + 1 != v102);
        uint64_t v53 = [v99 countByEnumeratingWithState:&v144 objects:v188 count:16];
      }
      while (v53);
    }

    [(VNSuggestionsLogger *)v103->_suggestionsLogger logConnectedGroups:v110];
    if ([v110 count])
    {
      id v71 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      id v72 = v110;
      uint64_t v73 = [v72 countByEnumeratingWithState:&v124 objects:v183 count:16];
      if (v73)
      {
        unint64_t v74 = 0;
        uint64_t v75 = *(void *)v125;
        do
        {
          for (uint64_t n = 0; n != v73; ++n)
          {
            if (*(void *)v125 != v75) {
              objc_enumerationMutation(v72);
            }
            long long v77 = *(void **)(*((void *)&v124 + 1) + 8 * n);
            if ([v77 count] <= v74)
            {
              if ([v77 count] == v74 && (objc_msgSend(v71, "isEqualToSet:", v77) & 1) == 0) {
                [v71 unionSet:v77];
              }
            }
            else
            {
              unint64_t v74 = [v77 count];
              uint64_t v78 = [v77 mutableCopy];

              id v71 = (id)v78;
            }
          }
          uint64_t v73 = [v72 countByEnumeratingWithState:&v124 objects:v183 count:16];
        }
        while (v73);
      }

      if ([v71 count])
      {
        id v79 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v118 = 0u;
        long long v119 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        id v80 = v71;
        uint64_t v81 = [v80 countByEnumeratingWithState:&v116 objects:v181 count:16];
        if (v81)
        {
          uint64_t v82 = *(void *)v117;
          do
          {
            for (iuint64_t i = 0; ii != v81; ++ii)
            {
              if (*(void *)v117 != v82) {
                objc_enumerationMutation(v80);
              }
              uint64_t v84 = [v108 objectForKeyedSubscript:*(void *)(*((void *)&v116 + 1) + 8 * ii)];
              [v79 unionSet:v84];
            }
            uint64_t v81 = [v80 countByEnumeratingWithState:&v116 objects:v181 count:16];
          }
          while (v81);
        }

        [v79 minusSet:v96];
        uint64_t v85 = [v79 allObjects];
      }
      else
      {
        id v79 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v122 = 0u;
        long long v123 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        v90 = [v108 allValues];
        uint64_t v91 = [v90 countByEnumeratingWithState:&v120 objects:v182 count:16];
        if (v91)
        {
          uint64_t v92 = *(void *)v121;
          do
          {
            for (juint64_t j = 0; jj != v91; ++jj)
            {
              if (*(void *)v121 != v92) {
                objc_enumerationMutation(v90);
              }
              [v79 unionSet:*(void *)(*((void *)&v120 + 1) + 8 * jj)];
            }
            uint64_t v91 = [v90 countByEnumeratingWithState:&v120 objects:v182 count:16];
          }
          while (v91);
        }

        [v79 minusSet:v96];
        uint64_t v85 = [v79 allObjects];
      }
      uint64_t v30 = (void *)v85;
    }
    else
    {
      id v71 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      v86 = [v108 allValues];
      uint64_t v87 = [v86 countByEnumeratingWithState:&v128 objects:v184 count:16];
      if (v87)
      {
        uint64_t v88 = *(void *)v129;
        do
        {
          for (kuint64_t k = 0; kk != v87; ++kk)
          {
            if (*(void *)v129 != v88) {
              objc_enumerationMutation(v86);
            }
            [v71 unionSet:*(void *)(*((void *)&v128 + 1) + 8 * kk)];
          }
          uint64_t v87 = [v86 countByEnumeratingWithState:&v128 objects:v184 count:16];
        }
        while (v87);
      }

      [v71 minusSet:v96];
      uint64_t v30 = [v71 allObjects];
    }

    [(VNSuggestionsLogger *)v103->_suggestionsLogger logFinalSuggestionsList:v30];
    id v8 = 0;
    goto LABEL_19;
  }
  id v97 = v33;
  uint64_t v98 = v34;
  id v8 = 0;
  uint64_t v105 = *(void *)v168;
LABEL_29:
  uint64_t v35 = 0;
  while (1)
  {
    if (*(void *)v168 != v105) {
      objc_enumerationMutation(v97);
    }
    uint64_t v36 = *(void *)(*((void *)&v167 + 1) + 8 * v35);
    v111 = (void *)MEMORY[0x1A6257080]();
    id v37 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v158 = 0;
    v159 = &v158;
    uint64_t v160 = 0x4812000000;
    uint64_t v161 = (uint64_t)__Block_byref_object_copy__214;
    v162 = __Block_byref_object_dispose__215;
    v163 = "";
    v165 = 0;
    uint64_t v166 = 0;
    __p = 0;
    uint64_t v154 = 0;
    v155 = &v154;
    uint64_t v156 = 0x2020000000;
    uint64_t v157 = 0;
    v153[0] = MEMORY[0x1E4F143A8];
    v153[1] = 3221225472;
    v153[2] = __88__VNGreedyClusteringReadOnly_suggestionsForClusterIdsWithFlags_affinityThreshold_error___block_invoke_217;
    v153[3] = &unk_1E5B1AC20;
    v153[4] = v103;
    v153[5] = v36;
    v153[6] = &v154;
    v153[7] = &v158;
    v153[8] = v179;
    id v152 = v8;
    char v38 = VNExecuteBlock(v153, (uint64_t)&v152);
    id obja = v152;

    if (v38)
    {
      BOOL v109 = v155[3] == 5248;
      if (v155[3] == 5248)
      {
        uint64_t v40 = v159[6];
        uint64_t v41 = v159[7];
        while (v40 != v41)
        {
          LODWORD(v39) = *(_DWORD *)(v40 + 8);
          uint64_t v42 = [NSNumber numberWithFloat:v39];
          int v43 = [NSNumber numberWithLongLong:*(void *)v40];
          [v37 setObject:v42 forKeyedSubscript:v43];

          v40 += 16;
        }
        long long v150 = 0u;
        long long v151 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        uint64_t v44 = [v37 allKeys];
        uint64_t v45 = [v44 countByEnumeratingWithState:&v148 objects:v189 count:16];
        if (v45)
        {
          uint64_t v46 = *(void *)v149;
          do
          {
            for (uint64_t mm = 0; mm != v45; ++mm)
            {
              if (*(void *)v149 != v46) {
                objc_enumerationMutation(v44);
              }
              uint64_t v48 = *(void *)(*((void *)&v148 + 1) + 8 * mm);
              long long v49 = [v108 objectForKeyedSubscript:v36];
              [v49 addObject:v48];

              uint64_t v50 = [v108 allKeys];
              int v51 = [v50 containsObject:v48];

              if (v51)
              {
                uint64_t v52 = [v107 objectForKeyedSubscript:v36];
                [v52 addObject:v48];
              }
            }
            uint64_t v45 = [v44 countByEnumeratingWithState:&v148 objects:v189 count:16];
          }
          while (v45);
        }
        id v8 = obja;
      }
      else
      {
        uint64_t v44 = [NSString stringWithFormat:@"Internal error querying similar faces"];
        id v8 = +[VNError errorForInternalErrorWithLocalizedDescription:v44];
      }
    }
    else
    {
      BOOL v109 = 0;
      id v8 = obja;
    }
    _Block_object_dispose(&v154, 8);
    _Block_object_dispose(&v158, 8);
    if (__p)
    {
      v165 = __p;
      operator delete(__p);
    }

    if (!v109) {
      break;
    }
    if (++v35 == v98)
    {
      uint64_t v98 = [v97 countByEnumeratingWithState:&v167 objects:v190 count:16];
      if (v98) {
        goto LABEL_29;
      }
      break;
    }
  }

  if (!v8) {
    goto LABEL_58;
  }
LABEL_18:
  uint64_t v30 = 0;
LABEL_19:

LABEL_20:
  _Block_object_dispose(v179, 8);
  std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v180[0]);
  if (v8)
  {
    id v31 = 0;
    if (a5) {
      *a5 = v8;
    }
  }
  else
  {
    id v31 = v30;
  }

  return v31;
}

uint64_t __88__VNGreedyClusteringReadOnly_suggestionsForClusterIdsWithFlags_affinityThreshold_error___block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __88__VNGreedyClusteringReadOnly_suggestionsForClusterIdsWithFlags_affinityThreshold_error___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void, uint64_t))(**(void **)(*(void *)(a1 + 32) + 88) + 120))(*(void *)(*(void *)(a1 + 32) + 88), [*(id *)(a1 + 40) unsignedIntegerValue]);
  return 1;
}

uint64_t __88__VNGreedyClusteringReadOnly_suggestionsForClusterIdsWithFlags_affinityThreshold_error___block_invoke_217(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(**(void **)(*(void *)(a1 + 32) + 88) + 40))(*(void *)(*(void *)(a1 + 32) + 88), [*(id *)(a1 + 40) unsignedIntegerValue], *(void *)(*(void *)(a1 + 56) + 8) + 48, *(void *)(*(void *)(a1 + 64) + 8) + 48);
  return 1;
}

- (id)convertUpdatePairsToClusters:(void *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  for (uint64_t i = *(void **)a3; i != *((void **)a3 + 1); i += 2)
  {
    uint64_t v7 = [NSNumber numberWithLongLong:i[1]];
    id v8 = [v5 objectForKeyedSubscript:v7];

    if (v8)
    {
      uint64_t v9 = [NSNumber numberWithLongLong:*i];
      [v8 addObject:v9];
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v11 = [NSNumber numberWithLongLong:*i];
      id v8 = [v10 arrayWithObject:v11];

      uint64_t v9 = [NSNumber numberWithLongLong:i[1]];
      [v5 setObject:v8 forKeyedSubscript:v9];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v12 = objc_msgSend(v5, "allKeys", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v20 + 1) + 8 * j);
        uint64_t v17 = objc_alloc_init(VNCluster);
        char v18 = [v5 objectForKeyedSubscript:v16];
        [(VNCluster *)v17 setObjects:v18];
        -[VNCluster setTotalObjectCount:](v17, "setTotalObjectCount:", [v18 count]);
        -[VNCluster setClusterId:](v17, "setClusterId:", (int)[v16 intValue]);
        [v4 addObject:v17];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  return v4;
}

- (void)setGreedyClustererFaces_const:(shared_ptr<const vision::mod::FaceClustering>)a3
{
  id v4 = *(FaceClustering **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->m_ClusteringImpl_const.__cntrl_;
  self->m_ClusteringImpl_const.__ptr_ = v4;
  self->m_ClusteringImpl_const.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (VNGreedyClusteringReadOnly)initWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)VNGreedyClusteringReadOnly;
  uint64_t v7 = [(VNGreedyClusteringReadOnly *)&v29 init];
  id v8 = v7;
  if (!v7)
  {
    if (a4)
    {
      +[VNError errorForMemoryAllocationFailure];
      char v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
LABEL_11:
    char v18 = 0;
    goto LABEL_38;
  }
  if (![(VNGreedyClusteringReadOnly *)v7 _parseOptions:v6 error:a4]) {
    goto LABEL_11;
  }
  faceprintRevisiouint64_t n = v8->_faceprintRevision;
  torsoprintRevisiouint64_t n = v8->_torsoprintRevision;
  uint64_t v11 = [(NSString *)v8->_algorithmType UTF8String];
  size_t v12 = strlen(v11);
  apple::vision::GreedyClusteringParamsWrapper::createClusteringHacksWrapper(&v27, faceprintRevision, torsoprintRevision, (uint64_t)v11, v12);
  if (!v27)
  {
    if (a4)
    {
      id v19 = (void *)[[NSString alloc] initWithFormat:@"Creating clustering parameters object failed for following face and torsoprint revisions: %lu and %lu and algorith type: %@", v8->_faceprintRevision, v8->_torsoprintRevision, v8->_algorithmType];
      *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:v19];
    }
    goto LABEL_35;
  }
  if (![(NSString *)v8->_algorithmType isEqualToString:@"VNClusteringAlgorithm_Greedy"])
  {
    if (![(NSString *)v8->_algorithmType isEqualToString:@"VNClusteringAlgorithm_GreedyWithTorso"])goto LABEL_31; {
    long long v20 = [(NSString *)v8->_cacheFolderPath UTF8String];
    }
    long long v21 = [(NSData *)v8->_state bytes];
    uint64_t v22 = [(NSData *)v8->_state length];
    if (!v20) {
      goto LABEL_28;
    }
    if (v22)
    {
      std::allocate_shared[abi:ne180100]<std::vector<unsigned char>,std::allocator<std::vector<unsigned char>>,unsigned char const* const&,unsigned char const*,void>(&v31, v21, (uint64_t)v21 + v22);
      std::allocate_shared[abi:ne180100]<vision::mod::GreedyClustererFacesWithTorso,std::allocator<vision::mod::GreedyClustererFacesWithTorso>,char const*&,std::shared_ptr<std::vector<unsigned char>> &,BOOL &,std::shared_ptr<apple::vision::GreedyClusteringParamsWrapper> const&,void>((uint64_t)&v30);
      shared_ptr<const vision::mod::FaceClustering> v17 = v30;
      if (v31.__cntrl_)
      {
        shared_ptr<const vision::mod::FaceClustering> v26 = v30;
        std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v31.__cntrl_);
        shared_ptr<const vision::mod::FaceClustering> v17 = v26;
      }
    }
    else
    {
      std::allocate_shared[abi:ne180100]<vision::mod::GreedyClustererFacesWithTorso,std::allocator<vision::mod::GreedyClustererFacesWithTorso>,char const*&,std::shared_ptr<apple::vision::GreedyClusteringParamsWrapper> const&,void>(&v31, v20, &v27);
      shared_ptr<const vision::mod::FaceClustering> v17 = v31;
    }
    if (!v17.__ptr_ || *((unsigned char *)v17.__ptr_ + 216)) {
      goto LABEL_29;
    }
    goto LABEL_26;
  }
  uint64_t v13 = [(NSString *)v8->_cacheFolderPath UTF8String];
  char vectorMapReadOnlyFlag = v8->_vectorMapReadOnlyFlag;
  uint64_t v15 = [(NSData *)v8->_state bytes];
  uint64_t v16 = [(NSData *)v8->_state length];
  if (v13)
  {
    if (v16)
    {
      std::allocate_shared[abi:ne180100]<std::vector<unsigned char>,std::allocator<std::vector<unsigned char>>,unsigned char const* const&,unsigned char const*,void>(&v31, v15, (uint64_t)v15 + v16);
      std::allocate_shared[abi:ne180100]<vision::mod::GreedyClustererFaces,std::allocator<vision::mod::GreedyClustererFaces>,char const*&,std::shared_ptr<std::vector<unsigned char>> &,BOOL &,std::shared_ptr<apple::vision::GreedyClusteringParamsWrapper> const&,void>(&v30, v13, (uint64_t **)&v31, vectorMapReadOnlyFlag, &v27);
      shared_ptr<const vision::mod::FaceClustering> v17 = v30;
      if (v31.__cntrl_)
      {
        shared_ptr<const vision::mod::FaceClustering> v25 = v30;
        std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v31.__cntrl_);
        shared_ptr<const vision::mod::FaceClustering> v17 = v25;
      }
    }
    else
    {
      std::allocate_shared[abi:ne180100]<vision::mod::GreedyClustererFaces,std::allocator<vision::mod::GreedyClustererFaces>,char const*&,std::shared_ptr<apple::vision::GreedyClusteringParamsWrapper> const&,void>(&v31, v13, &v27);
      shared_ptr<const vision::mod::FaceClustering> v17 = v31;
    }
    if (!v17.__ptr_ || *((unsigned char *)v17.__ptr_ + 208)) {
      goto LABEL_29;
    }
LABEL_26:
    if (v17.__cntrl_) {
      std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v17.__cntrl_);
    }
  }
LABEL_28:
  shared_ptr<const vision::mod::FaceClustering> v17 = (shared_ptr<const vision::mod::FaceClustering>)0;
LABEL_29:
  cntrl = (std::__shared_weak_count *)v8->m_ClusteringImpl_const.__cntrl_;
  v8->m_ClusteringImpl_const = v17;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100](cntrl);
  }
LABEL_31:
  if (v8->m_ClusteringImpl_const.__ptr_)
  {
    [(VNGreedyClusteringReadOnly *)v8 initializeLogging];
    char v18 = v8;
    goto LABEL_36;
  }
  if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"Error initializing cluster state"];
    char v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
LABEL_35:
  char v18 = 0;
LABEL_36:
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v28);
  }
LABEL_38:

  return v18;
}

- (void)initializeLogging
{
  clusteringLogger = self->_clusteringLogger;
  self->_clusteringLogger = 0;

  suggestionsLogger = self->_suggestionsLogger;
  self->_suggestionsLogger = 0;

  if (+[VNClusteringLogger isLogEnabled])
  {
    id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_cacheFolderPath];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __47__VNGreedyClusteringReadOnly_initializeLogging__block_invoke;
    v19[3] = &unk_1E5B1ABA8;
    v19[4] = self;
    id v6 = v5;
    id v20 = v6;
    char v21 = 1;
    id v18 = 0;
    char v7 = VNExecuteBlock(v19, (uint64_t)&v18);
    id v8 = v18;
    uint64_t v9 = v8;
    if ((v7 & 1) == 0)
    {
      id v10 = [v8 localizedDescription];
      uint64_t v11 = [v10 UTF8String];
      VNValidatedLog(4, @"%s", v12, v13, v14, v15, v16, v17, v11);
    }
  }
}

uint64_t __47__VNGreedyClusteringReadOnly_initializeLogging__block_invoke(uint64_t a1)
{
  uint64_t v2 = [[VNClusteringLogger alloc] initWithOptions:*(void *)(a1 + 40) logEnabled:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  id v5 = [[VNSuggestionsLogger alloc] initWithOptions:*(void *)(a1 + 40) logEnabled:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v6 = *(void *)(a1 + 32);
  char v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v5;

  v16[0] = 0;
  v16[1] = 0;
  uint64_t v15 = v16;
  (*(void (**)(void, void ***))(**(void **)(*(void *)(a1 + 32) + 88) + 72))(*(void *)(*(void *)(a1 + 32) + 88), &v15);
  [*(id *)(*(void *)(a1 + 32) + 16) logClusterMapL0:&v15];
  v14[0] = 0;
  v14[1] = 0;
  uint64_t v13 = v14;
  (*(void (**)(void, void ***))(**(void **)(*(void *)(a1 + 32) + 88) + 64))(*(void *)(*(void *)(a1 + 32) + 88), &v13);
  [*(id *)(*(void *)(a1 + 32) + 16) logClusterLookupMapL0:&v13];
  v12[0] = 0;
  v12[1] = 0;
  uint64_t v11 = v12;
  (*(void (**)(void, void ***))(**(void **)(*(void *)(a1 + 32) + 88) + 112))(*(void *)(*(void *)(a1 + 32) + 88), &v11);
  [*(id *)(*(void *)(a1 + 32) + 16) logClusterMapL1:&v11];
  v10[0] = 0;
  v10[1] = 0;
  uint64_t v9 = v10;
  (*(void (**)(void, void ***))(**(void **)(*(void *)(a1 + 32) + 88) + 80))(*(void *)(*(void *)(a1 + 32) + 88), &v9);
  [*(id *)(*(void *)(a1 + 32) + 16) logClusterLookupMapL1:&v9];
  std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v10[0]);
  std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v12[0]);
  std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v14[0]);
  std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v16[0]);
  return 1;
}

- (BOOL)_parseOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = +[VNValidationUtilities requiredObjectOfClass:v7 forKey:@"VNClusterOptionCacheFolderPath" inOptions:v6 error:a4];
  if (v9)
  {
    char v27 = 0;
    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v11 = [v10 fileExistsAtPath:v9 isDirectory:&v27];

    if (v27) {
      char v12 = v11;
    }
    else {
      char v12 = 0;
    }
    if (v12)
    {
      uint64_t v13 = +[VNValidationUtilities requiredObjectOfClass:v8 forKey:@"VNClusterOptionFaceprintRevision" inOptions:v6 error:a4];
      if (v13)
      {
        uint64_t v14 = +[VNValidationUtilities requiredObjectOfClass:v8 forKey:@"VNClusterOptionTorsoprintRevision" inOptions:v6 error:a4];
        if (!v14)
        {
          BOOL v22 = 0;
LABEL_30:

          goto LABEL_31;
        }
        uint64_t v15 = +[VNValidationUtilities requiredObjectOfClass:v7 forKey:@"VNClusterOptionClusteringAlgorithm" inOptions:v6 error:a4];
        uint64_t v16 = v15;
        if (!v15) {
          goto LABEL_25;
        }
        if (([v15 isEqualToString:@"VNClusteringAlgorithm_Greedy"] & 1) != 0
          || ([v16 isEqualToString:@"VNClusteringAlgorithm_GreedyWithTorso"] & 1) != 0)
        {
          shared_ptr<const vision::mod::FaceClustering> v25 = v16;
          id v26 = 0;
          BOOL v17 = +[VNValidationUtilities getOptionalObject:&v26 ofClass:objc_opt_class() forKey:@"VNClusterOptionRestoreClusteringState" inOptions:v6 error:a4];
          id v18 = v26;
          id v19 = v26;
          if (v17)
          {
            obuint64_t j = v18;
            id v20 = v19;
            if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              char v21 = +[VNValidationUtilities requiredObjectOfClass:v8 forKey:@"VNClusterOptionVectorMapReadOnlyFlag" inOptions:v6 error:a4];
              BOOL v22 = v21 != 0;
              uint64_t v16 = v25;
              if (v21)
              {
                self->_faceprintRevisiouint64_t n = [v13 unsignedIntegerValue];
                self->_torsoprintRevisiouint64_t n = [v14 unsignedIntegerValue];
                objc_storeStrong((id *)&self->_algorithmType, v25);
                objc_storeStrong((id *)&self->_cacheFolderPath, v9);
                objc_storeStrong((id *)&self->_state, obj);
                self->_char vectorMapReadOnlyFlag = [v21 BOOLValue];
              }

              id v19 = v20;
              goto LABEL_28;
            }
            BOOL v22 = 0;
            id v19 = v20;
          }
          else
          {
            BOOL v22 = 0;
          }
          uint64_t v16 = v25;
LABEL_28:

          goto LABEL_29;
        }
        if (a4)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:@"VNClusterOptionClusteringAlgorithm must be set to either VNClusteringAlgorithm_Greedy or VNClusteringAlgorithm_GreedyWithTorso"];
          BOOL v22 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_25:
          BOOL v22 = 0;
        }
LABEL_29:

        goto LABEL_30;
      }
      BOOL v22 = 0;
LABEL_31:

      goto LABEL_32;
    }
    if (a4)
    {
      uint64_t v13 = [NSString stringWithFormat:@"Invalid cache file path: %@", v9];
      +[VNError errorForInternalErrorWithLocalizedDescription:v13];
      BOOL v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
  }
  BOOL v22 = 0;
LABEL_32:

  return v22;
}

+ (id)clustererModelFileNamesFromState:(id)a3 storedInPath:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    if (!a5) {
      goto LABEL_16;
    }
    id v26 = [NSString stringWithFormat:@"Cache file path is a required parameter"];
    char v27 = +[VNError errorForInternalErrorWithLocalizedDescription:v26];
LABEL_15:
    *a5 = v27;

    goto LABEL_16;
  }
  char v48 = 0;
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v10 = [v9 fileExistsAtPath:v8 isDirectory:&v48];

  if (v48) {
    char v11 = v10;
  }
  else {
    char v11 = 0;
  }
  if ((v11 & 1) == 0)
  {
    if (!a5) {
      goto LABEL_16;
    }
    id v26 = [NSString stringWithFormat:@"Invalid cache file path: %@", v8];
    char v27 = +[VNError errorForInternalErrorWithLocalizedDescription:v26];
    goto LABEL_15;
  }
  if (!v7)
  {
    if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"RestoreClusteringState is a required parameter"];
      id v28 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_16:
    id v28 = 0;
    goto LABEL_17;
  }
  memset(&v47, 0, sizeof(v47));
  memset(&v46, 0, sizeof(v46));
  id v12 = v8;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v12 UTF8String]);
  id v13 = v7;
  uint64_t v14 = (const void *)[v13 bytes];
  uint64_t v15 = [v13 length];
  if (v14 && v15)
  {
    std::allocate_shared[abi:ne180100]<std::vector<unsigned char>,std::allocator<std::vector<unsigned char>>,unsigned char const* const&,unsigned char const*,void>(&v50, v14, (uint64_t)v14 + v15);
    int v49 = -1;
    uint64_t v25 = vision::mod::GreedyClustererFaces::pasreAndVerifyClustererState((uint64_t)__p, *v50, &v47, &v46, &v49, v22, v23, v24);
    close(v49);
    if (v51) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v51);
    }
  }
  else
  {
    VNValidatedLog(4, @"Invalid parameter passed to extract Clusterer model file names\n", v16, v17, v18, v19, v20, v21, v43);
    uint64_t v25 = 5244;
  }
  if (v45 < 0) {
    operator delete(__p[0]);
  }
  if (v25 == 5248) {
    goto LABEL_34;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v12 UTF8String]);
  id v30 = v13;
  shared_ptr<const vision::mod::FaceClustering> v31 = (const void *)[v30 bytes];
  uint64_t v32 = [v30 length];
  if (v31 && v32)
  {
    std::allocate_shared[abi:ne180100]<std::vector<unsigned char>,std::allocator<std::vector<unsigned char>>,unsigned char const* const&,unsigned char const*,void>(&v50, v31, (uint64_t)v31 + v32);
    int v49 = -1;
    uint64_t v42 = vision::mod::GreedyClustererFacesWithTorso::pasreAndVerifyClustererState((uint64_t)__p, *v50, &v47, &v46, &v49, v39, v40, v41);
    close(v49);
    if (v51) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v51);
    }
  }
  else
  {
    VNValidatedLog(4, @"Invalid parameter passed to extract Clusterer model file names\n", v33, v34, v35, v36, v37, v38, v43);
    uint64_t v42 = 5244;
  }
  if (v45 < 0) {
    operator delete(__p[0]);
  }
  if (v42 == 5248)
  {
LABEL_34:
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    _addFileNameInStdStringPathToArray((uint64_t *)&v47, v28);
    _addFileNameInStdStringPathToArray((uint64_t *)&v46, v28);
  }
  else if (a5)
  {
    VNErrorForCVMLStatus((id)v42);
    id v28 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v28 = 0;
  }
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v46.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v47.__r_.__value_.__l.__data_);
  }
LABEL_17:

  return v28;
}

+ (id)getRepresentativenessForFaces:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_255];
  id v7 = [v5 filteredArrayUsingPredicate:v6];

  if ([v7 count])
  {
    id v8 = [v7 objectAtIndexedSubscript:0];
    uint64_t v38 = 0;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x4812000000;
    uint64_t v41 = __Block_byref_object_copy__256;
    uint64_t v42 = __Block_byref_object_dispose__257;
    uint64_t v43 = "";
    char v45 = 0;
    uint64_t v46 = 0;
    __p = 0;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __66__VNGreedyClusteringReadOnly_getRepresentativenessForFaces_error___block_invoke_259;
    v34[3] = &unk_1E5B1ECB8;
    id v9 = v8;
    id v35 = v9;
    id v10 = v7;
    id v36 = v10;
    uint64_t v37 = &v38;
    if (VNExecuteBlock(v34, (uint64_t)a4))
    {
      id v33 = v5;
      char v11 = [MEMORY[0x1E4F1CA60] dictionary];
      id v12 = (_DWORD *)v39[6];
      if (v12 != (_DWORD *)v39[7])
      {
        uint64_t v13 = 0;
        do
        {
          uint64_t v14 = [v10 objectAtIndexedSubscript:v13];
          uint64_t v15 = [v14 faceId];
          VNValidatedLog(1, @"  face[%lu].representativeness = %.3f", v16, v17, v18, v19, v20, v21, v15);
          LODWORD(v22) = *v12;
          uint64_t v23 = [NSNumber numberWithFloat:v22];
          uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "faceId"));
          [v11 setObject:v23 forKeyedSubscript:v24];

          ++v12;
          ++v13;
        }
        while (v12 != (_DWORD *)v39[7]);
      }
      uint64_t v25 = [v9 faceId];
      VNValidatedLog(1, @"  best rep = %lu", v26, v27, v28, v29, v30, v31, v25);
      id v5 = v33;
    }
    else
    {
      char v11 = 0;
    }

    _Block_object_dispose(&v38, 8);
    if (__p)
    {
      char v45 = __p;
      operator delete(__p);
    }
  }
  else
  {
    char v11 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v11;
}

uint64_t __66__VNGreedyClusteringReadOnly_getRepresentativenessForFaces_error___block_invoke_259(uint64_t a1)
{
  int v20 = 0;
  long long v15 = 0uLL;
  uint64_t v16 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) faceprint];
  unint64_t v3 = [v2 lengthInBytes];
  vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v17, (void **)&v15, &v20, v3, 0, 0);
  int v18 = 1;
  uint64_t v19 = 0;
  v17[0] = &unk_1EF752918;
  v17[12] = (void *)(v3 >> 2);

  uint64_t v4 = *(void *)(a1 + 40);
  int v18 = 2;
  +[VNGreedyClusteringReadOnly addFaceObservations:v4 toFaceDescriptorBuffer:v17];
  uint64_t v5 = (*((uint64_t (**)(void **, uint64_t, void))v17[0] + 15))(v17, 1, 0);
  (*((void (**)(long long *__return_ptr, void **, uint64_t))v17[0] + 10))(&v15, v17, v5);
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  id v7 = (float *)*((void *)&v15 + 1);
  id v6 = (float *)v15;
  id v8 = std::__minmax_element_impl[abi:ne180100]<std::__wrap_iter<float *>,std::__wrap_iter<float *>,std::__identity,std::__less<void,void>>((float *)v15, *((float **)&v15 + 1));
  float v9 = *v8;
  float v11 = *v10 - *v8;
  if (v11 < 0.00000011921) {
    float v11 = 1.0;
  }
  while (v6 != v7)
  {
    *id v6 = 1.0 - (float)((float)(*v6 - v9) / v11);
    ++v6;
  }
  id v12 = *(void **)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = (void *)v12[6];
  if (v13)
  {
    v12[7] = v13;
    operator delete(v13);
    v12[6] = 0;
    v12[7] = 0;
    v12[8] = 0;
  }
  *((_OWORD *)v12 + 3) = v15;
  v12[8] = v16;
  v17[0] = &unk_1EF752918;
  free(v19);
  vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(v17);
  return 1;
}

BOOL __66__VNGreedyClusteringReadOnly_getRepresentativenessForFaces_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 faceprint];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (void)addPersonData:(id)a3 withGroupingIdentifiers:(id)a4 toFaceDescriptorBuffer:(void *)a5
{
  id v7 = a3;
  id v8 = a4;
  float v9 = [v7 objectAtIndexedSubscript:0];
  unint64_t v10 = [v9 lengthInBytes];

  unint64_t v11 = [v7 count];
  vision::mod::ImageDescriptorBufferJoint::resizeForDescriptorsCount((void **)a5, v11, v10 > 3);
  std::vector<long long>::resize((char **)a5 + 1, v11);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__VNGreedyClusteringReadOnly_addPersonData_withGroupingIdentifiers_toFaceDescriptorBuffer___block_invoke;
  v13[3] = &unk_1E5B1ABF8;
  long long v15 = a5;
  unint64_t v16 = v10;
  id v12 = v8;
  id v14 = v12;
  [v7 enumerateObjectsUsingBlock:v13];
}

void __91__VNGreedyClusteringReadOnly_addPersonData_withGroupingIdentifiers_toFaceDescriptorBuffer___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 descriptorData];
  DataForKthDescriptor = (void *)vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)(a1 + 40), a3);
  id v8 = v6;
  memcpy(DataForKthDescriptor, (const void *)[v8 bytes], *(void *)(a1 + 48));
  vision::mod::ImageDescriptorBufferJoint::setAvailableFlagsForKthDescriptor(*(void *)(a1 + 40), a3, [v5 isValidFaceprint], objc_msgSend(v5, "isValidTorsoprint"));
  __n128 v12 = 0uLL;
  float v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v9 getUUIDBytes:&v12];

  __n128 v11 = v12;
  *(void *)&double v10 = vision::mod::ImageDescriptorBufferJoint::setSideInfoForKthDescriptor(*(void *)(a1 + 40), a3, &v11).n128_u64[0];
  vision::mod::ImageDescriptorBufferAbstract::setDescriptorIdForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)(a1 + 40), a3, objc_msgSend(v5, "personId", v10));
}

+ (void)addFaceObservations:(id)a3 withGroupingIdentifiers:(id)a4 toFaceDescriptorBuffer:(void *)a5
{
  id v7 = a3;
  id v8 = a4;
  float v9 = [v7 objectAtIndexedSubscript:0];
  double v10 = [v9 faceTorsoprint];
  unint64_t v11 = [v10 lengthInBytes];

  unint64_t v12 = [v7 count];
  vision::mod::ImageDescriptorBufferJoint::resizeForDescriptorsCount((void **)a5, v12, v11 > 3);
  std::vector<long long>::resize((char **)a5 + 1, v12);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __97__VNGreedyClusteringReadOnly_addFaceObservations_withGroupingIdentifiers_toFaceDescriptorBuffer___block_invoke;
  v14[3] = &unk_1E5B1ABD0;
  unint64_t v16 = a5;
  unint64_t v17 = v11;
  id v13 = v8;
  id v15 = v13;
  [v7 enumerateObjectsUsingBlock:v14];
}

void __97__VNGreedyClusteringReadOnly_addFaceObservations_withGroupingIdentifiers_toFaceDescriptorBuffer___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 faceTorsoprint];
  id v7 = [v6 descriptorData];

  DataForKthDescriptor = (void *)vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)(a1 + 40), a3);
  id v9 = v7;
  memcpy(DataForKthDescriptor, (const void *)[v9 bytes], *(void *)(a1 + 48));
  uint64_t v10 = *(void *)(a1 + 40);
  unint64_t v11 = [v5 faceTorsoprint];
  int v12 = [v11 isValidFaceprint];
  id v13 = [v5 faceTorsoprint];
  vision::mod::ImageDescriptorBufferJoint::setAvailableFlagsForKthDescriptor(v10, a3, v12, [v13 isValidTorsoprint]);

  __n128 v17 = 0uLL;
  id v14 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v14 getUUIDBytes:&v17];

  __n128 v16 = v17;
  *(void *)&double v15 = vision::mod::ImageDescriptorBufferJoint::setSideInfoForKthDescriptor(*(void *)(a1 + 40), a3, &v16).n128_u64[0];
  vision::mod::ImageDescriptorBufferAbstract::setDescriptorIdForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)(a1 + 40), a3, objc_msgSend(v5, "faceId", v15));
}

+ (void)addFaceObservations:(id)a3 toFaceDescriptorBuffer:(void *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v5 = [v17 objectAtIndex:0];
  id v6 = [v5 faceprint];
  size_t v7 = [v6 lengthInBytes];

  vision::mod::ImageDescriptorBufferAbstract::resizeForDescriptorsCount((vision::mod::ImageDescriptorBufferAbstract *)a4, [v17 count], v7 > 3);
  std::vector<long long>::resize((char **)a4 + 1, [v17 count]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = v17;
  uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    int v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v13 = [v12 faceprint];
        id v14 = [v13 descriptorData];

        DataForKthDescriptor = (void *)vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor((vision::mod::ImageDescriptorBufferAbstract *)a4, v9 + i);
        id v16 = v14;
        memcpy(DataForKthDescriptor, (const void *)[v16 bytes], v7);
        vision::mod::ImageDescriptorBufferAbstract::setDescriptorIdForKthDescriptor((vision::mod::ImageDescriptorBufferAbstract *)a4, v9 + i, [v12 faceId]);
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      v9 += i;
    }
    while (v8);
  }
}

+ (id)nonGroupedGroupID
{
  if (+[VNGreedyClusteringReadOnly nonGroupedGroupID]::onceToken != -1) {
    dispatch_once(&+[VNGreedyClusteringReadOnly nonGroupedGroupID]::onceToken, &__block_literal_global_185);
  }
  uint64_t v2 = (void *)+[VNGreedyClusteringReadOnly nonGroupedGroupID]::uuid;

  return v2;
}

void __47__VNGreedyClusteringReadOnly_nonGroupedGroupID__block_invoke()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  v2[1] = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v2];
  v1 = (void *)+[VNGreedyClusteringReadOnly nonGroupedGroupID]::uuid;
  +[VNGreedyClusteringReadOnly nonGroupedGroupID]::uuid = v0;
}

@end