@interface SemanticsTable
- (BOOL)getARMeshClassificationID:(id)a3 ARMeshClassificationID:(int64_t *)a4;
- (BOOL)getARMeshMaterialID:(id)a3 ARMeshMaterialID:(int64_t *)a4;
- (id).cxx_construct;
- (id)labelsForSemanticType:(id)a3 error:(id *)a4;
- (materialsForPair)getMaterialsForPair:(const semantic_pair *)a3;
- (unordered_map<NSString)MeshClassificationMap;
- (unordered_map<NSString)MeshMaterialMap;
- (unordered_map<semantic_pair,)SemanticsMap;
- (void)readTable:(id *)a3;
- (void)setMeshClassificationMap:(unordered_map<NSString *);
- (void)setMeshMaterialMap:(unordered_map<NSString *);
- (void)setSemanticsMap:()unordered_map<semantic_pair;
@end

@implementation SemanticsTable

- (void)readTable:(id *)a3
{
  v34 = [NSString stringWithFormat:@"SELECT * FROM [semantics]"];
  v38 = (uint64_t *)a3;
  DBIOFetchDatabaseResultsExt((sqlite3 **)_dbPtr, v34, a3);
  v5 = (AbsorptionTable *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = AbsorptionTable::get(v5);
    materialCachedTable<AMAbsorption>::getMaterial(v7, @"Default", (uint64_t *)a3);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v51 = obj;
    v8 = ScatteringTable::get((ScatteringTable *)obj);
    materialCachedTable<AMScattering>::getMaterial(v8, @"Default", (uint64_t *)a3);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    id v52 = v36;
    v9 = SoundReductionTable::get((SoundReductionTable *)v36);
    v10 = materialCachedTable<AMSoundReductionIndex>::getMaterial(v9, @"Default", (uint64_t *)a3);
    unint64_t v11 = 0;
    v53 = v10;
    p_MeshClassificationMap = &self->_MeshClassificationMap;
    p_MeshMaterialMap = &self->_MeshMaterialMap;
    p_SemanticsMap = &self->_SemanticsMap;
    v35 = v6;
    while (v11 < [(AbsorptionTable *)v6 count])
    {
      v12 = [(AbsorptionTable *)v6 objectAtIndexedSubscript:v11];
      v44 = [v12 objectAtIndexedSubscript:4];
      v43 = [v12 objectAtIndexedSubscript:5];
      v42 = [v12 objectAtIndexedSubscript:6];
      if ([v44 isEqualToString:@"Default"]
        && [v43 isEqualToString:@"Default"])
      {
        int v13 = [v42 isEqualToString:@"Default"];
      }
      else
      {
        int v13 = 0;
      }
      v14 = [v12 objectAtIndexedSubscript:0];
      v15 = (id *)[v14 longValue];
      v16 = [v12 objectAtIndexedSubscript:2];
      v17 = (id *)[v16 longLongValue];
      id v50 = [v12 objectAtIndexedSubscript:1];
      id v49 = [v12 objectAtIndexedSubscript:3];
      v48[0] = &v50;
      *((void *)std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__emplace_unique_key_args<NSString * {__strong},std::piecewise_construct_t const&,std::tuple<NSString * const {__strong}&>,std::tuple<>>((uint64_t)p_MeshMaterialMap, &v50, (uint64_t)&std::piecewise_construct, v48)+ 3) = v15;
      v48[0] = &v49;
      v18 = (AbsorptionTable *)std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__emplace_unique_key_args<NSString * {__strong},std::piecewise_construct_t const&,std::tuple<NSString * const {__strong}&>,std::tuple<>>((uint64_t)p_MeshClassificationMap, &v49, (uint64_t)&std::piecewise_construct, v48);
      *((void *)v18 + 3) = v17;
      v48[0] = v15;
      v48[1] = v17;
      if (v15 >= v17) {
        v19 = (id *)((char *)v15 + (void)v15 * (void)v15 + (void)v17);
      }
      else {
        v19 = (id *)((char *)v15 + (void)v17 * (void)v17);
      }
      v48[2] = v19;
      if (v13)
      {
        v45 = v48;
        v20 = (id *)std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__emplace_unique_key_args<semantic_pair,std::piecewise_construct_t const&,std::tuple<semantic_pair const&>,std::tuple<>>((uint64_t)p_SemanticsMap, v48, (uint64_t)&std::piecewise_construct, (_OWORD **)&v45);
        objc_storeStrong(v20 + 5, obj);
        objc_storeStrong(v20 + 6, v36);
        objc_storeStrong(v20 + 7, v10);
      }
      else
      {
        v45 = 0;
        v46 = 0;
        v47 = 0;
        v21 = AbsorptionTable::get(v18);
        materialCachedTable<AMAbsorption>::getMaterial(v21, v44, v38);
        v22 = (id **)objc_claimAutoreleasedReturnValue();
        v45 = v22;
        v23 = ScatteringTable::get((ScatteringTable *)v22);
        materialCachedTable<AMScattering>::getMaterial(v23, v43, v38);
        v24 = (SoundReductionTable *)objc_claimAutoreleasedReturnValue();
        v46 = v24;
        v25 = SoundReductionTable::get(v24);
        v26 = materialCachedTable<AMSoundReductionIndex>::getMaterial(v25, v42, v38);
        v47 = v26;
        v54 = v48;
        v27 = std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__emplace_unique_key_args<semantic_pair,std::piecewise_construct_t const&,std::tuple<semantic_pair const&>,std::tuple<>>((uint64_t)p_SemanticsMap, v48, (uint64_t)&std::piecewise_construct, (_OWORD **)&v54);
        v28 = (void *)v27[5];
        v27[5] = v22;
        v29 = v22;

        v30 = (void *)v27[6];
        v27[6] = v24;
        v31 = v24;

        v32 = (void *)v27[7];
        v27[7] = v26;
        id v33 = v26;

        v6 = v35;
      }

      ++v11;
    }
  }
}

- (id)labelsForSemanticType:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x263EFF980] array];
  if ([v5 isEqualToString:@"visual material"])
  {
    for (i = (id *)self->_MeshMaterialMap.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
    {
      id v8 = i[2];
      [v6 addObject:v8];
    }
  }
  else if ([v5 isEqualToString:@"ARMeshMaterial"])
  {
    for (j = self->_MeshMaterialMap.__table_.__p1_.__value_.__next_; j; j = (void *)*j)
    {
      v10 = [NSNumber numberWithLongLong:j[3]];
      [v6 addObject:v10];
    }
  }
  else if ([v5 isEqualToString:@"object"])
  {
    for (k = (id *)self->_MeshClassificationMap.__table_.__p1_.__value_.__next_; k; k = (id *)*k)
    {
      id v12 = k[2];
      [v6 addObject:v12];
    }
  }
  else if ([v5 isEqualToString:@"ARMeshClassification"])
  {
    for (m = self->_MeshClassificationMap.__table_.__p1_.__value_.__next_; m; m = (void *)*m)
    {
      v14 = [NSNumber numberWithLongLong:m[3]];
      [v6 addObject:v14];
    }
  }

  return v6;
}

- (BOOL)getARMeshMaterialID:(id)a3 ARMeshMaterialID:(int64_t *)a4
{
  id v9 = a3;
  v6 = std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::find<NSString * {__strong}>(&self->_MeshMaterialMap.__table_.__bucket_list_.__ptr_.__value_, &v9);
  if (v6) {
    *a4 = (int64_t)v6[3];
  }
  BOOL v7 = v6 != 0;

  return v7;
}

- (BOOL)getARMeshClassificationID:(id)a3 ARMeshClassificationID:(int64_t *)a4
{
  id v9 = a3;
  v6 = std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::find<NSString * {__strong}>(&self->_MeshClassificationMap.__table_.__bucket_list_.__ptr_.__value_, &v9);
  if (v6) {
    *a4 = (int64_t)v6[3];
  }
  BOOL v7 = v6 != 0;

  return v7;
}

- (materialsForPair)getMaterialsForPair:(const semantic_pair *)a3
{
  v3 = std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::find<semantic_pair>(&self->_SemanticsMap.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v3) {
    return (materialsForPair *)(v3 + 5);
  }
  else {
    return (materialsForPair *)_defaultMaterial;
  }
}

- (unordered_map<semantic_pair,)SemanticsMap
{
  objc_copyCppObjectAtomic(retstr, &self->_SemanticsMap, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return result;
}

- (void)setSemanticsMap:()unordered_map<semantic_pair
{
}

- (unordered_map<NSString)MeshMaterialMap
{
  objc_copyCppObjectAtomic(retstr, &self->_MeshMaterialMap, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__44);
  return result;
}

- (void)setMeshMaterialMap:(unordered_map<NSString *)
{
}

- (unordered_map<NSString)MeshClassificationMap
{
  objc_copyCppObjectAtomic(retstr, &self->_MeshClassificationMap, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__46);
  return result;
}

- (void)setMeshClassificationMap:(unordered_map<NSString *)
{
}

- (void).cxx_destruct
{
  std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::~__hash_table((uint64_t)&self->_MeshClassificationMap);
  std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::~__hash_table((uint64_t)&self->_MeshMaterialMap);
  std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::~__hash_table((uint64_t)&self->_SemanticsMap);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 30) = 1065353216;
  return self;
}

@end