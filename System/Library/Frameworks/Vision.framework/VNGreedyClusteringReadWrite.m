@interface VNGreedyClusteringReadWrite
- (VNGreedyClusteringReadWrite)initWithOptions:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)getClustersWithOptions:(id)a3 error:(id *)a4;
- (int64_t)_cancellableUpdate:(void *)a3 facesToMove:(void *)a4 requestRevision:(unint64_t)a5;
@end

@implementation VNGreedyClusteringReadWrite

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->m_ClusteringImpl.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id)getClustersWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v77 = a3;
  [(VNClusteringLogger *)self->super._clusteringLogger resetFileNameURLWithCurentDateTime];
  [(VNClusteringLogger *)self->super._clusteringLogger logString:@"Clustering with greedy algorithm"];
  v125 = 0;
  v124 = 0;
  uint64_t v126 = 0;
  v76 = [v77 objectForKeyedSubscript:@"VNClusterOptionRemoveObjectsFromClustering"];
  v80 = self;
  if (!v76) {
    goto LABEL_72;
  }
  v5 = [v76 objectAtIndexedSubscript:0];
  v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x4812000000;
  v94 = __Block_byref_object_copy__364;
  v95 = __Block_byref_object_dispose__365;
  v96 = "";
  v98 = 0;
  uint64_t v99 = 0;
  v97 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id v6 = v76;
    v74 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v120 objects:v130 count:16];
    if (v7)
    {
      v8 = 0;
      v9 = 0;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v121;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v121 != v11) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = [*(id *)(*((void *)&v120 + 1) + 8 * i) faceId];
          uint64_t v14 = v13;
          if ((unint64_t)v9 >= v10)
          {
            uint64_t v15 = v9 - v8;
            unint64_t v16 = v15 + 1;
            if ((unint64_t)(v15 + 1) >> 61) {
              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
            }
            if ((uint64_t)(v10 - (void)v8) >> 2 > v16) {
              unint64_t v16 = (uint64_t)(v10 - (void)v8) >> 2;
            }
            if (v10 - (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v17 = v16;
            }
            if (v17) {
              unint64_t v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v17);
            }
            else {
              uint64_t v18 = 0;
            }
            v19 = (uint64_t *)(v17 + 8 * v15);
            uint64_t *v19 = v14;
            v20 = v19 + 1;
            while (v9 != v8)
            {
              uint64_t v21 = *--v9;
              *--v19 = v21;
            }
            unint64_t v10 = v17 + 8 * v18;
            if (v8) {
              operator delete(v8);
            }
            v8 = v19;
            v9 = v20;
          }
          else
          {
            *v9++ = v13;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v120 objects:v130 count:16];
      }
      while (v7);
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id v22 = v76;
    v74 = v5;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v116 objects:v129 count:16];
    if (v23)
    {
      v8 = 0;
      v9 = 0;
      unint64_t v24 = 0;
      uint64_t v25 = *(void *)v117;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v117 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = [*(id *)(*((void *)&v116 + 1) + 8 * j) personId];
          uint64_t v28 = v27;
          if ((unint64_t)v9 >= v24)
          {
            uint64_t v29 = v9 - v8;
            unint64_t v30 = v29 + 1;
            if ((unint64_t)(v29 + 1) >> 61) {
              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
            }
            if ((uint64_t)(v24 - (void)v8) >> 2 > v30) {
              unint64_t v30 = (uint64_t)(v24 - (void)v8) >> 2;
            }
            if (v24 - (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v31 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v31 = v30;
            }
            if (v31) {
              unint64_t v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v31);
            }
            else {
              uint64_t v32 = 0;
            }
            v33 = (uint64_t *)(v31 + 8 * v29);
            uint64_t *v33 = v28;
            v34 = v33 + 1;
            while (v9 != v8)
            {
              uint64_t v35 = *--v9;
              *--v33 = v35;
            }
            unint64_t v24 = v31 + 8 * v32;
            if (v8) {
              operator delete(v8);
            }
            v8 = v33;
            v9 = v34;
          }
          else
          {
            *v9++ = v27;
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v116 objects:v129 count:16];
      }
      while (v23);
LABEL_55:

      v5 = v74;
      v112 = 0;
      v113 = (long long *)&v112;
      uint64_t v114 = 0x2020000000;
      uint64_t v115 = 0;
      v108[0] = MEMORY[0x1E4F143A8];
      v108[1] = 3321888768;
      v108[2] = __60__VNGreedyClusteringReadWrite_getClustersWithOptions_error___block_invoke;
      v108[3] = &unk_1EF754258;
      v108[5] = &v112;
      v108[4] = v80;
      uint64_t v111 = 0;
      __p = 0;
      v110 = 0;
      std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, v8, (uint64_t)v9, v9 - v8);
      v108[6] = &v91;
      if (VNExecuteBlock(v108, (uint64_t)a4))
      {
        if (*((void *)v113 + 3) == 128)
        {
          std::vector<std::pair<long long,long long>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::pair<long long,long long>*>,std::__wrap_iter<std::pair<long long,long long>*>>((long long **)&v124, (uint64_t)v125, (long long *)v92[6], (long long *)v92[7], ((unsigned char *)v92[7] - (unsigned char *)v92[6]) >> 4);
          int v36 = 0;
LABEL_64:
          if (__p)
          {
            v110 = __p;
            operator delete(__p);
          }
          _Block_object_dispose(&v112, 8);
          if (v8) {
            operator delete(v8);
          }
          goto LABEL_68;
        }
        if (a4)
        {
          VNErrorForCVMLStatus(*((id *)v113 + 3));
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      int v36 = 1;
      goto LABEL_64;
    }
LABEL_54:
    v8 = 0;
    v9 = 0;
    goto LABEL_55;
  }
  if (a4)
  {
    *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Unexpected type of object for clustering"];
  }
  int v36 = 1;
LABEL_68:
  _Block_object_dispose(&v91, 8);
  if (v97)
  {
    v98 = v97;
    operator delete(v97);
  }

  self = v80;
  if (v36)
  {
    v37 = 0;
    goto LABEL_118;
  }
LABEL_72:
  v75 = [v77 objectForKeyedSubscript:@"VNClusterOptionAddObjectsToClustering"];
  uint64_t v38 = [v75 count];
  v73 = [v77 objectForKeyedSubscript:@"VNClusterOptionAddObjectGroupIdsToClustering"];
  if (!v38)
  {
LABEL_81:
    v72 = [(VNGreedyClusteringReadOnly *)self convertUpdatePairsToClusters:&v124];
    [(VNClusteringLogger *)self->super._clusteringLogger logString:@"Clusters:"];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v43 = v72;
    uint64_t v51 = [v43 countByEnumeratingWithState:&v86 objects:v128 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v87;
      while (2)
      {
        for (uint64_t k = 0; k != v51; ++k)
        {
          if (*(void *)v87 != v52) {
            objc_enumerationMutation(v43);
          }
          uint64_t v54 = *(void *)(*((void *)&v86 + 1) + 8 * k);
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __60__VNGreedyClusteringReadWrite_getClustersWithOptions_error___block_invoke_384;
          aBlock[3] = &unk_1E5B1FCB8;
          aBlock[4] = v54;
          aBlock[5] = v80;
          v55 = _Block_copy(aBlock);
          int v56 = VNExecuteBlock(v55, (uint64_t)a4);

          if (!v56)
          {

            goto LABEL_116;
          }
        }
        uint64_t v51 = [v43 countByEnumeratingWithState:&v86 objects:v128 count:16];
        if (v51) {
          continue;
        }
        break;
      }
    }

    [(VNClusteringLogger *)v80->super._clusteringLogger logString:@"clusters:"];
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id obja = v43;
    uint64_t v57 = [obja countByEnumeratingWithState:&v81 objects:v127 count:16];
    if (v57)
    {
      uint64_t v58 = *(void *)v82;
      do
      {
        for (uint64_t m = 0; m != v57; ++m)
        {
          if (*(void *)v82 != v58) {
            objc_enumerationMutation(obja);
          }
          v60 = *(void **)(*((void *)&v81 + 1) + 8 * m);
          clusteringLogger = v80->super._clusteringLogger;
          v62 = NSString;
          uint64_t v63 = [v60 clusterId];
          v64 = [v60 objects];
          id v65 = [v64 description];
          v66 = [v62 stringWithFormat:@"  clusterId: %ld, %s", v63, objc_msgSend(v65, "UTF8String")];
          [(VNClusteringLogger *)clusteringLogger logString:v66];
        }
        uint64_t v57 = [obja countByEnumeratingWithState:&v81 objects:v127 count:16];
      }
      while (v57);
    }

    id v43 = obja;
    v37 = v43;
    goto LABEL_117;
  }
  v39 = self->super._clusteringLogger;
  v40 = NSString;
  id v41 = [v75 description];
  v42 = objc_msgSend(v40, "stringWithFormat:", @"adding faces (%lu): %s", v38, objc_msgSend(v41, "UTF8String"));
  [(VNClusteringLogger *)v39 logString:v42];

  id v43 = [v75 objectAtIndexedSubscript:0];
  int v107 = 0;
  v113 = 0;
  v112 = 0;
  uint64_t v114 = 0;
  v44 = [v77 objectForKeyedSubscript:@"VNClusterOptionFaceprintRevision"];
  uint64_t v45 = [v44 unsignedIntegerValue];

  if (![(NSString *)v80->super._algorithmType isEqualToString:@"VNClusteringAlgorithm_GreedyWithTorso"])
  {
    v48 = [v43 faceprint];
    unint64_t v49 = [v48 lengthInBytes];

    v104 = 0;
    v105 = 0;
    uint64_t v106 = 0;
    vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)&v91, (void **)&v104, &v107, v49, 0, 0);
    v102 = 0;
    v91 = &unk_1EF752918;
    unint64_t v100 = v49 >> 2;
    int v101 = 2;
    +[VNGreedyClusteringReadOnly addFaceObservations:v75 toFaceDescriptorBuffer:&v91];
    v50 = [(VNGreedyClusteringReadWrite *)v80 _cancellableUpdate:&v91 facesToMove:&v112 requestRevision:v45];
    v91 = &unk_1EF752918;
    free(v102);
    vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(&v91);
LABEL_77:
    if (v50 == 128)
    {
      std::vector<std::pair<long long,long long>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::pair<long long,long long>*>,std::__wrap_iter<std::pair<long long,long long>*>>((long long **)&v124, (uint64_t)v125, (long long *)v112, v113, ((char *)v113 - (unsigned char *)v112) >> 4);
      if (v112)
      {
        v113 = (long long *)v112;
        operator delete(v112);
      }

      self = v80;
      goto LABEL_81;
    }
    if (!a4) {
      goto LABEL_114;
    }
    v67 = VNErrorForCVMLStatus(v50);
LABEL_113:
    *a4 = v67;
    goto LABEL_114;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v46 = [v43 faceTorsoprint];
    unint64_t v47 = [v46 lengthInBytes];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4) {
        goto LABEL_114;
      }
      v67 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Unexpected type of object for clustering"];
      goto LABEL_113;
    }
    unint64_t v47 = [v43 lengthInBytes];
  }
  if (!v73)
  {
    if (!a4) {
      goto LABEL_114;
    }
    v68 = @"Faces to add must be accompanied by grouping identifiers when performing clustering in torso mode.";
    uint64_t v69 = 7;
    goto LABEL_112;
  }
  if ([v73 count] != v38)
  {
    if (!a4) {
      goto LABEL_114;
    }
    v68 = @"Faces to add array must be the same size as that of the grouping identifiers array.";
    uint64_t v69 = 5;
LABEL_112:
    v67 = +[VNError errorWithCode:v69 message:v68 underlyingError:0];
    goto LABEL_113;
  }
  v104 = 0;
  v105 = 0;
  uint64_t v106 = 0;
  memset(v103, 0, sizeof(v103));
  memset(v90, 0, sizeof(v90));
  vision::mod::ImageDescriptorBufferJoint::ImageDescriptorBufferJoint((uint64_t)&v91, v90, &v107, (uint64_t)v103, &v104, v47, 0, 0);
  int v101 = 3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[VNGreedyClusteringReadOnly addFaceObservations:v75 withGroupingIdentifiers:v73 toFaceDescriptorBuffer:&v91];
LABEL_125:
    v50 = [(VNGreedyClusteringReadWrite *)v80 _cancellableUpdate:&v91 facesToMove:&v112 requestRevision:v45];
    char v71 = 1;
    goto LABEL_126;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[VNGreedyClusteringReadOnly addPersonData:v75 withGroupingIdentifiers:v73 toFaceDescriptorBuffer:&v91];
    goto LABEL_125;
  }
  if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"Unexpected type of object for clustering"];
    v50 = 0;
    char v71 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = 0;
    char v71 = 0;
  }
LABEL_126:
  vision::mod::ImageDescriptorBufferJoint::~ImageDescriptorBufferJoint(&v91);
  if (v103[0]) {
    operator delete(v103[0]);
  }
  if (v104)
  {
    v105 = v104;
    operator delete(v104);
  }
  if (v71) {
    goto LABEL_77;
  }
LABEL_114:
  if (v112)
  {
    v113 = (long long *)v112;
    operator delete(v112);
  }
LABEL_116:
  v37 = 0;
LABEL_117:

LABEL_118:
  if (v124)
  {
    v125 = v124;
    operator delete(v124);
  }

  return v37;
}

uint64_t __60__VNGreedyClusteringReadWrite_getClustersWithOptions_error___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = (*(uint64_t (**)(void, void *, uint64_t))(**(void **)(a1[4] + 104) + 192))(*(void *)(a1[4] + 104), a1 + 7, *(void *)(a1[6] + 8) + 48);
  return 1;
}

uint64_t __60__VNGreedyClusteringReadWrite_getClustersWithOptions_error___block_invoke_384(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTotalObjectCount:", (*(uint64_t (**)(void, uint64_t))(**(void **)(*(void *)(a1 + 40) + 104) + 200))(*(void *)(*(void *)(a1 + 40) + 104), objc_msgSend(*(id *)(a1 + 32), "clusterId")));
  uint64_t v2 = [*(id *)(a1 + 32) totalObjectCount];
  v3 = [*(id *)(a1 + 32) objects];
  uint64_t v4 = [v3 count];

  unint64_t v5 = v2 - v4;
  [*(id *)(a1 + 32) setShouldUpdateRepresentative:v2 == v4];
  if (([*(id *)(a1 + 32) shouldUpdateRepresentative] & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "setShouldUpdateRepresentative:", ((COERCE_UNSIGNED_INT((float)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "totalObjectCount")) ^ COERCE_UNSIGNED_INT((float)v5)) & 0x7F800000) != 0);
  }
  id v6 = *(void **)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = [NSString stringWithFormat:@"  %d: prevcount=%d, curcount=%d, shouldUpdateRep = %d", objc_msgSend(*(id *)(a1 + 32), "clusterId"), v5, objc_msgSend(*(id *)(a1 + 32), "totalObjectCount"), objc_msgSend(*(id *)(a1 + 32), "shouldUpdateRepresentative")];
  [v6 logString:v7];

  if ([*(id *)(a1 + 32) shouldUpdateRepresentative])
  {
    __p = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    (*(void (**)(void, uint64_t, void **, void))(**(void **)(*(void *)(a1 + 40) + 104) + 160))(*(void *)(*(void *)(a1 + 40) + 104), [*(id *)(a1 + 32) clusterId], &__p, 0);
    v8 = [MEMORY[0x1E4F1CA80] set];
    unint64_t v10 = __p;
    v9 = v18;
    if (v18 != __p)
    {
      int v11 = 0;
      uint64_t v12 = 1374389535 * (int)((unint64_t)(v18 - (unsigned char *)__p) >> 3);
      int v13 = (v12 >> 37) + ((unint64_t)v12 >> 63);
      do
      {
        if (v11 >= v13)
        {
          uint64_t v14 = [NSNumber numberWithLongLong:*v10];
          [v8 addObject:v14];

          int v11 = 0;
          v9 = v18;
        }
        else
        {
          ++v11;
        }
        ++v10;
      }
      while (v10 != v9);
    }
    uint64_t v15 = [v8 allObjects];
    [*(id *)(a1 + 32) setSuggestedIdsForRepresentative:v15];

    if (__p)
    {
      uint64_t v18 = __p;
      operator delete(__p);
    }
  }
  return 1;
}

- (int64_t)_cancellableUpdate:(void *)a3 facesToMove:(void *)a4 requestRevision:(unint64_t)a5
{
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 5248;
  id v10 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__VNGreedyClusteringReadWrite__cancellableUpdate_facesToMove_requestRevision___block_invoke;
  v11[3] = &unk_1E5B1F788;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = a3;
  v11[7] = a4;
  int v5 = VNExecuteBlock(v11, (uint64_t)&v10);
  id v6 = v10;
  uint64_t v7 = v13 + 3;
  if (!v5) {
    uint64_t v7 = &CVML_status_internalError;
  }
  int64_t v8 = *v7;

  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __78__VNGreedyClusteringReadWrite__cancellableUpdate_facesToMove_requestRevision___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = (*(uint64_t (**)(void, void, void))(**(void **)(a1[4] + 104) + 16))(*(void *)(a1[4] + 104), a1[6], a1[7]);
  return 1;
}

- (VNGreedyClusteringReadWrite)initWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)VNGreedyClusteringReadWrite;
  uint64_t v7 = [(VNGreedyClusteringReadWrite *)&v33 init];
  int64_t v8 = v7;
  if (!v7 || ![(VNGreedyClusteringReadOnly *)v7 _parseOptions:v6 error:a4])
  {
    uint64_t v18 = 0;
    goto LABEL_41;
  }
  unint64_t faceprintRevision = v8->super._faceprintRevision;
  unint64_t torsoprintRevision = v8->super._torsoprintRevision;
  int v11 = [(NSString *)v8->super._algorithmType UTF8String];
  size_t v12 = strlen(v11);
  apple::vision::GreedyClusteringParamsWrapper::createClusteringHacksWrapper(&v31, faceprintRevision, torsoprintRevision, (uint64_t)v11, v12);
  if (!v31)
  {
    if (a4)
    {
      uint64_t v19 = (void *)[[NSString alloc] initWithFormat:@"Creating clustering parameters object failed for following face and torsoprint revisions: %lu and %lu and algorithm type: %@", v8->super._faceprintRevision, v8->super._torsoprintRevision, v8->super._algorithmType];
      *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:v19];
    }
    goto LABEL_38;
  }
  if (![(NSString *)v8->super._algorithmType isEqualToString:@"VNClusteringAlgorithm_Greedy"])
  {
    if (![(NSString *)v8->super._algorithmType isEqualToString:@"VNClusteringAlgorithm_GreedyWithTorso"])goto LABEL_30; {
    v20 = [(NSString *)v8->super._cacheFolderPath UTF8String];
    }
    uint64_t v21 = [(NSData *)v8->super._state bytes];
    uint64_t v22 = [(NSData *)v8->super._state length];
    if (!v20) {
      goto LABEL_27;
    }
    if (v22)
    {
      std::allocate_shared[abi:ne180100]<std::vector<unsigned char>,std::allocator<std::vector<unsigned char>>,unsigned char const* const&,unsigned char const*,void>(&v35, v21, (uint64_t)v21 + v22);
      std::allocate_shared[abi:ne180100]<vision::mod::GreedyClustererFacesWithTorso,std::allocator<vision::mod::GreedyClustererFacesWithTorso>,char const*&,std::shared_ptr<std::vector<unsigned char>> &,BOOL &,std::shared_ptr<apple::vision::GreedyClusteringParamsWrapper> const&,void>((uint64_t)&v34);
      shared_ptr<vision::mod::FaceClustering> v17 = v34;
      if (v35.__cntrl_)
      {
        shared_ptr<vision::mod::FaceClustering> v27 = v34;
        std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v35.__cntrl_);
        shared_ptr<vision::mod::FaceClustering> v17 = v27;
      }
    }
    else
    {
      std::allocate_shared[abi:ne180100]<vision::mod::GreedyClustererFacesWithTorso,std::allocator<vision::mod::GreedyClustererFacesWithTorso>,char const*&,std::shared_ptr<apple::vision::GreedyClusteringParamsWrapper> const&,void>(&v35, v20, &v31);
      shared_ptr<vision::mod::FaceClustering> v17 = v35;
    }
    if (!v17.__ptr_ || *((unsigned char *)v17.__ptr_ + 216)) {
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  int v13 = [(NSString *)v8->super._cacheFolderPath UTF8String];
  char vectorMapReadOnlyFlag = v8->super._vectorMapReadOnlyFlag;
  uint64_t v15 = [(NSData *)v8->super._state bytes];
  uint64_t v16 = [(NSData *)v8->super._state length];
  if (v13)
  {
    if (v16)
    {
      std::allocate_shared[abi:ne180100]<std::vector<unsigned char>,std::allocator<std::vector<unsigned char>>,unsigned char const* const&,unsigned char const*,void>(&v35, v15, (uint64_t)v15 + v16);
      std::allocate_shared[abi:ne180100]<vision::mod::GreedyClustererFaces,std::allocator<vision::mod::GreedyClustererFaces>,char const*&,std::shared_ptr<std::vector<unsigned char>> &,BOOL &,std::shared_ptr<apple::vision::GreedyClusteringParamsWrapper> const&,void>(&v34, v13, (uint64_t **)&v35, vectorMapReadOnlyFlag, &v31);
      shared_ptr<vision::mod::FaceClustering> v17 = v34;
      if (v35.__cntrl_)
      {
        shared_ptr<vision::mod::FaceClustering> v26 = v34;
        std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v35.__cntrl_);
        shared_ptr<vision::mod::FaceClustering> v17 = v26;
      }
    }
    else
    {
      std::allocate_shared[abi:ne180100]<vision::mod::GreedyClustererFaces,std::allocator<vision::mod::GreedyClustererFaces>,char const*&,std::shared_ptr<apple::vision::GreedyClusteringParamsWrapper> const&,void>(&v35, v13, &v31);
      shared_ptr<vision::mod::FaceClustering> v17 = v35;
    }
    if (!v17.__ptr_ || *((unsigned char *)v17.__ptr_ + 208)) {
      goto LABEL_28;
    }
LABEL_25:
    if (v17.__cntrl_) {
      std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v17.__cntrl_);
    }
  }
LABEL_27:
  shared_ptr<vision::mod::FaceClustering> v17 = (shared_ptr<vision::mod::FaceClustering>)0;
LABEL_28:
  cntrl = (std::__shared_weak_count *)v8->m_ClusteringImpl.__cntrl_;
  v8->m_ClusteringImpl = v17;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100](cntrl);
  }
LABEL_30:
  if (v8->m_ClusteringImpl.__ptr_)
  {
    ptr = v8->m_ClusteringImpl.__ptr_;
    unint64_t v24 = (std::__shared_weak_count *)v8->m_ClusteringImpl.__cntrl_;
    unint64_t v30 = v24;
    if (v24) {
      atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v28.receiver = v8;
    v28.super_class = (Class)VNGreedyClusteringReadWrite;
    [(VNGreedyClusteringReadOnly *)&v28 setGreedyClustererFaces_const:&ptr];
    if (v30) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v30);
    }
    [(VNGreedyClusteringReadOnly *)v8 initializeLogging];
    uint64_t v18 = v8;
    goto LABEL_39;
  }
  if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"Error initializing cluster state"];
    uint64_t v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v18 = 0;
LABEL_39:
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v32);
  }
LABEL_41:

  return v18;
}

@end