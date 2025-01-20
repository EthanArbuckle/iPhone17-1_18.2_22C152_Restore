@interface VNMPImageGrouping
+ (float)computeTimestampAdjustedDistanceForBaseDistance:(float)a3 andTimestampDiff:(int64_t)a4;
+ (float)computeTotalDistanceForDescriptorDistance:(float)result timestampDiff:(int64_t)a4 useTimestampAdjustment:(BOOL)a5;
+ (float)getDistanceForClusterNode:(MPClusteringTreeNode *)a3 splitDistanceType:(int)a4;
+ (int64_t)computeHierarchicalClusteringOfImageDescriptors:(id)a3 results:(MPClusteringTreeNode *)a4 context:(id)a5;
+ (vector<MPClusteringTreeNode)computeClusteringIntoKGroups:(id)a2 forHierarchicalTree:(SEL)a3 context:(int)a4;
+ (vector<MPClusteringTreeNode)computeClusteringIntoKGroups:(id)a2 orUsingDistanceThreshold:(SEL)a3 forHierarchicalTree:(int)a4 context:(float)a5;
+ (vector<MPClusteringTreeNode)computeClusteringUsingDistanceThreshold:(id)a2 forHierarchicalTree:(SEL)a3 context:(float)a4;
+ (vector<MPClusteringTreeNode)computeNaturalClusteringForHierarchicalTree:(id)a2 context:(SEL)a3;
@end

@implementation VNMPImageGrouping

+ (float)computeTotalDistanceForDescriptorDistance:(float)result timestampDiff:(int64_t)a4 useTimestampAdjustment:(BOOL)a5
{
  if (a5) {
    objc_msgSend(a1, "computeTimestampAdjustedDistanceForBaseDistance:andTimestampDiff:", a4);
  }
  return result;
}

+ (float)computeTimestampAdjustedDistanceForBaseDistance:(float)a3 andTimestampDiff:(int64_t)a4
{
  if (a4 >= 10)
  {
    if ((unint64_t)a4 >= 0x3C)
    {
      if ((unint64_t)a4 <= 0x15180)
      {
        if ((unint64_t)a4 <= 0x4650)
        {
          float v4 = 0.12;
          if ((unint64_t)a4 <= 0xE10) {
            float v4 = 0.0;
          }
        }
        else
        {
          float v4 = 0.24;
        }
      }
      else
      {
        float v4 = 0.4;
      }
    }
    else
    {
      float v4 = -0.03;
    }
  }
  else
  {
    float v4 = -0.06;
  }
  float v5 = v4 + a3;
  if (v5 < 0.0) {
    float v5 = 0.0;
  }
  return fminf(v5, 1.0);
}

+ (vector<MPClusteringTreeNode)computeNaturalClusteringForHierarchicalTree:(id)a2 context:(SEL)a3
{
  id v8 = a5;
  [v8 naturalClusteringDistanceThreshold];
  objc_msgSend(a2, "computeClusteringIntoKGroups:orUsingDistanceThreshold:forHierarchicalTree:context:", 0x7FFFFFFFLL, a4, v8);

  return result;
}

+ (vector<MPClusteringTreeNode)computeClusteringUsingDistanceThreshold:(id)a2 forHierarchicalTree:(SEL)a3 context:(float)a4
{
  return (vector<MPClusteringTreeNode *, std::allocator<MPClusteringTreeNode *>> *)objc_msgSend(a2, "computeClusteringIntoKGroups:orUsingDistanceThreshold:forHierarchicalTree:context:", 0x7FFFFFFFLL, a5, a6);
}

+ (vector<MPClusteringTreeNode)computeClusteringIntoKGroups:(id)a2 forHierarchicalTree:(SEL)a3 context:(int)a4
{
  return (vector<MPClusteringTreeNode *, std::allocator<MPClusteringTreeNode *>> *)[a2 computeClusteringIntoKGroups:*(void *)&a4 orUsingDistanceThreshold:a5 forHierarchicalTree:a6 context:0.0];
}

+ (vector<MPClusteringTreeNode)computeClusteringIntoKGroups:(id)a2 orUsingDistanceThreshold:(SEL)a3 forHierarchicalTree:(int)a4 context:(float)a5
{
  id v12 = a7;
  v40 = 0;
  uint64_t v41 = 0;
  v39 = (uint64_t *)&v40;
  objc_msgSend(a2, "getDistanceForClusterNode:splitDistanceType:", a6, objc_msgSend(v12, "clusterSplitDistanceType"));
  std::__tree<std::__value_type<float,MPClusteringTreeNode *>,std::__map_value_compare<float,std::__value_type<float,MPClusteringTreeNode *>,std::less<float>,true>,std::allocator<std::__value_type<float,MPClusteringTreeNode *>>>::__emplace_multi<std::pair<float,MPClusteringTreeNode *>>(&v39, (uint64_t)a6, v13);
  while ((int)v41 < a4)
  {
    v14 = v40;
    v15 = &v40;
    if (v40)
    {
      do
      {
        v16 = v14;
        v14 = (uint64_t *)v14[1];
      }
      while (v14);
    }
    else
    {
      do
      {
        v16 = v15[2];
        BOOL v17 = *v16 == (void)v15;
        v15 = (uint64_t **)v16;
      }
      while (v17);
    }
    if (*((float *)v16 + 8) < a5) {
      break;
    }
    uint64_t v18 = v16[5];
    if (*(_DWORD *)(v18 + 20) == 1) {
      break;
    }
    v19 = (uint64_t *)v16[1];
    v20 = v16;
    if (v19)
    {
      do
      {
        v21 = v19;
        v19 = (uint64_t *)*v19;
      }
      while (v19);
    }
    else
    {
      do
      {
        v21 = (uint64_t *)v20[2];
        BOOL v17 = *v21 == (void)v20;
        v20 = v21;
      }
      while (!v17);
    }
    if (v39 == v16) {
      v39 = v21;
    }
    --v41;
    std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v40, v16);
    operator delete(v16);
    objc_msgSend(a2, "getDistanceForClusterNode:splitDistanceType:", *(void *)(v18 + 24), objc_msgSend(v12, "clusterSplitDistanceType"));
    std::__tree<std::__value_type<float,MPClusteringTreeNode *>,std::__map_value_compare<float,std::__value_type<float,MPClusteringTreeNode *>,std::less<float>,true>,std::allocator<std::__value_type<float,MPClusteringTreeNode *>>>::__emplace_multi<std::pair<float,MPClusteringTreeNode *>>(&v39, *(void *)(v18 + 24), v22);
    objc_msgSend(a2, "getDistanceForClusterNode:splitDistanceType:", *(void *)(v18 + 32), objc_msgSend(v12, "clusterSplitDistanceType"));
    std::__tree<std::__value_type<float,MPClusteringTreeNode *>,std::__map_value_compare<float,std::__value_type<float,MPClusteringTreeNode *>,std::less<float>,true>,std::allocator<std::__value_type<float,MPClusteringTreeNode *>>>::__emplace_multi<std::pair<float,MPClusteringTreeNode *>>(&v39, *(void *)(v18 + 32), v23);
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  v24 = v39;
  if (v39 != (uint64_t *)&v40)
  {
    v25 = 0;
    do
    {
      var0 = retstr->var2.var0;
      if (v25 >= var0)
      {
        v27 = retstr->var0;
        uint64_t v28 = v25 - retstr->var0;
        unint64_t v29 = v28 + 1;
        if ((unint64_t)(v28 + 1) >> 61) {
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v30 = (char *)var0 - (char *)v27;
        if (v30 >> 2 > v29) {
          unint64_t v29 = v30 >> 2;
        }
        if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v31 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v31 = v29;
        }
        if (v31) {
          unint64_t v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v31);
        }
        else {
          uint64_t v32 = 0;
        }
        v33 = (MPClusteringTreeNode **)(v31 + 8 * v28);
        *v33 = (MPClusteringTreeNode *)v24[5];
        v34 = v33 + 1;
        if (v25 != v27)
        {
          do
          {
            v35 = *--v25;
            *--v33 = v35;
          }
          while (v25 != v27);
          v25 = retstr->var0;
        }
        retstr->var0 = v33;
        retstr->var1 = v34;
        retstr->var2.var0 = (MPClusteringTreeNode **)(v31 + 8 * v32);
        if (v25) {
          operator delete(v25);
        }
        v25 = v34;
      }
      else
      {
        *v25++ = (MPClusteringTreeNode *)v24[5];
      }
      retstr->var1 = v25;
      v36 = (uint64_t *)v24[1];
      if (v36)
      {
        do
        {
          v37 = (uint64_t **)v36;
          v36 = (uint64_t *)*v36;
        }
        while (v36);
      }
      else
      {
        do
        {
          v37 = (uint64_t **)v24[2];
          BOOL v17 = *v37 == v24;
          v24 = (uint64_t *)v37;
        }
        while (!v17);
      }
      v24 = (uint64_t *)v37;
    }
    while (v37 != &v40);
  }
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v40);

  return result;
}

+ (float)getDistanceForClusterNode:(MPClusteringTreeNode *)a3 splitDistanceType:(int)a4
{
  if (!a4) {
    return a3->var2;
  }
  if (a4 == 1) {
    return a3->var3;
  }
  return result;
}

+ (int64_t)computeHierarchicalClusteringOfImageDescriptors:(id)a3 results:(MPClusteringTreeNode *)a4 context:(id)a5
{
  id v6 = a3;
  uint64_t v7 = 0;
  id v8 = 0;
  v9 = 0;
  v69[0] = 0;
  v69[1] = 0;
  uint64_t v67 = 0;
  v68 = v69;
  v66 = 0;
  id v64 = a5;
  v65 = &v66;
  while (v7 < (int)[v6 count])
  {
    v10 = [v6 objectAtIndexedSubscript:v7];
    v11 = malloc_type_malloc(0x38uLL, 0x10A00406DB9B953uLL);
    void *v11 = v10;
    v11[3] = 0;
    v11[4] = 0;
    v11[5] = v11;
    v11[6] = v11;
    *((_DWORD *)v11 + 4) = 0;
    *((_DWORD *)v11 + 5) = 1;
    *((_DWORD *)v11 + 2) = v7;
    *((_DWORD *)v11 + 3) = 0;
    if (v9)
    {
      uint64_t v12 = [v10 exifTimestamp];
      uint64_t v13 = [v8 exifTimestamp];
      [(id)*v11 distanceFromDescriptor:*v9];
      int v15 = v14;
      uint64_t v16 = [v64 useTimestampAdjustedDistances];
      uint64_t v17 = v12 - v13;
      LODWORD(v18) = v15;
      [a1 computeTotalDistanceForDescriptorDistance:v17 timestampDiff:v16 useTimestampAdjustment:v18];
      float v20 = v19;
      v21 = (uint64_t *)operator new(0x38uLL);
      float v22 = v21;
      *((float *)v21 + 8) = v20;
      v21[5] = (uint64_t)v9;
      v21[6] = (uint64_t)v11;
      float v23 = &v66;
      v24 = &v66;
      v25 = v66;
      if (v66)
      {
        do
        {
          while (1)
          {
            float v23 = (uint64_t **)v25;
            if (v20 >= *((float *)v25 + 8)) {
              break;
            }
            v25 = (uint64_t *)*v25;
            v24 = v23;
            if (!*v23) {
              goto LABEL_10;
            }
          }
          v25 = (uint64_t *)v25[1];
        }
        while (v25);
        v24 = v23 + 1;
      }
LABEL_10:
      uint64_t *v21 = 0;
      v21[1] = 0;
      v21[2] = (uint64_t)v23;
      uint64_t *v24 = v21;
      if (*v65)
      {
        v65 = (uint64_t **)*v65;
        float v22 = *v24;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v66, v22);
      ++v67;
      objc_msgSend(v10, "setPreviousLeafId:", objc_msgSend(v8, "descriptorId"));
      objc_msgSend(v8, "setNextLeafId:", objc_msgSend(v10, "descriptorId"));
      LODWORD(v26) = v15;
      [v10 setPreviousLeafDescriptorDistance:v26];
      LODWORD(v27) = v15;
      [v8 setNextLeafDescriptorDistance:v27];
      [v10 setPreviousLeafTimestampDistance:v17];
      [v8 setNextLeafTimestampDistance:v17];
      *(float *)&double v28 = v20;
      [v10 setPreviousLeafTotalDistance:v28];
      *(float *)&double v29 = v20;
      [v8 setNextLeafTotalDistance:v29];
    }
    ++v7;

    id v8 = v10;
    v9 = v11;
  }
  syslog(5, "starting clustering");
  if (v67)
  {
    int v30 = 0;
    do
    {
      unint64_t v31 = (uint64_t *)v65;
      float v32 = *((float *)v65 + 8);
      v34 = (MPClusteringTreeNode *)v65[5];
      v33 = (MPClusteringTreeNode *)v65[6];
      syslog(5, "merging leaf clusters [%d, %d] with score : %f", v34->var1, v33->var1, v32);
      v35 = v65[1];
      v36 = v65;
      if (v35)
      {
        do
        {
          v37 = (uint64_t **)v35;
          v35 = (uint64_t *)*v35;
        }
        while (v35);
      }
      else
      {
        do
        {
          v37 = (uint64_t **)v36[2];
          BOOL v38 = *v37 == (uint64_t *)v36;
          v36 = v37;
        }
        while (!v38);
      }
      v65 = v37;
      --v67;
      std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v66, v31);
      operator delete(v31);
      if (v69[0])
      {
        while (1)
        {
          int var1 = v34->var1;
          v40 = v69;
          uint64_t v41 = v69[0];
          do
          {
            v42 = v41;
            v43 = v40;
            int v44 = *((_DWORD *)v41 + 8);
            if (v44 >= var1) {
              v40 = (void **)v41;
            }
            else {
              ++v41;
            }
            uint64_t v41 = (void *)*v41;
          }
          while (v41);
          if (v40 == v69) {
            break;
          }
          v45 = v44 >= var1 ? v42 : v43;
          if (var1 < *((_DWORD *)v45 + 8)) {
            break;
          }
          if (v44 >= var1) {
            v46 = v42;
          }
          else {
            v46 = v43;
          }
          v34 = (MPClusteringTreeNode *)v46[5];
        }
        while (1)
        {
          int v48 = v33->var1;
          v49 = v69;
          v50 = v69[0];
          do
          {
            v51 = v50;
            v52 = v49;
            int v53 = *((_DWORD *)v50 + 8);
            if (v53 >= v48) {
              v49 = (void **)v50;
            }
            else {
              ++v50;
            }
            v50 = (void *)*v50;
          }
          while (v50);
          if (v49 == v69) {
            break;
          }
          v54 = v53 >= v48 ? v51 : v52;
          if (v48 < *((_DWORD *)v54 + 8)) {
            break;
          }
          if (v53 >= v48) {
            v47 = v51;
          }
          else {
            v47 = v52;
          }
          v33 = (MPClusteringTreeNode *)v47[5];
        }
      }
      else
      {
        int var1 = v34->var1;
        int v48 = v33->var1;
      }
      syslog(5, "found parent clusters to merge [%d, %d]", var1, v48);
      v55 = (MPClusteringTreeNode *)malloc_type_malloc(0x38uLL, 0x10A00406DB9B953uLL);
      v55->int var1 = v7;
      [v34->var0 quality];
      float v57 = v56;
      [v33->var0 quality];
      if (v57 <= v58) {
        p_var0 = &v33->var0;
      }
      else {
        p_var0 = &v34->var0;
      }
      v55->var0 = *p_var0;
      v55->var5 = v34;
      v55->var6 = v33;
      v55->var7 = v34->var7;
      v55->var8 = v33->var8;
      v55->var2 = v32;
      int v60 = v33->var4 + v34->var4;
      v55->var4 = v60;
      v55->var3 = (float)((float)((float)(v34->var3 * (float)(v34->var4 - 1))
                                + (float)(v33->var3 * (float)(v33->var4 - 1)))
                        + v32)
                / (float)(v60 - 1);
      std::__tree<std::__value_type<int,MPClusteringTreeNode *>,std::__map_value_compare<int,std::__value_type<int,MPClusteringTreeNode *>,std::less<int>,true>,std::allocator<std::__value_type<int,MPClusteringTreeNode *>>>::__emplace_unique_key_args<int,std::pair<int,MPClusteringTreeNode *>>((uint64_t *)&v68, v34->var1, v34->var1, (uint64_t)v55);
      std::__tree<std::__value_type<int,MPClusteringTreeNode *>,std::__map_value_compare<int,std::__value_type<int,MPClusteringTreeNode *>,std::less<int>,true>,std::allocator<std::__value_type<int,MPClusteringTreeNode *>>>::__emplace_unique_key_args<int,std::pair<int,MPClusteringTreeNode *>>((uint64_t *)&v68, v33->var1, v33->var1, (uint64_t)v55);
      ++v30;
      LODWORD(v7) = v7 + 1;
    }
    while (v67);
  }
  else
  {
    v55 = 0;
    int v30 = 0;
  }
  syslog(5, "end clustering, iterations : %d", v30);
  *a4 = v55;

  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v66);
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v69[0]);

  return 2432;
}

@end