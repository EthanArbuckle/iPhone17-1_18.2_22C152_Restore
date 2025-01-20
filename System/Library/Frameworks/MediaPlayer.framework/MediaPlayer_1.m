id ___ZL40_MPMLInitPropertyPodcastEpisodeAuthorMapv_block_invoke_5(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6;
  unsigned __int8 *v7;
  void *v8;
  void *__p[2];
  char v11;
  uint64_t vars8;

  v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "name");
  v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

void sub_1955C78AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL40_MPMLInitPropertyPodcastEpisodeAuthorMapv_block_invoke_4(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  std::string::basic_string[abi:ne180100]<0>(v12, "hasName");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)v12))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  mlcore::SortDescriptor::SortDescriptor();
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "nameOrder");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  objc_msgSend(v5, "_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering");
  }
  mlcore::SortDescriptor::SortDescriptor();
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v14 = a3;
  char v15 = 0;
  v6 = (char *)operator new(0x30uLL);
  uint64_t v7 = 0;
  *a3 = v6;
  a3[1] = v6;
  a3[2] = v6 + 48;
  do
  {
    v8 = &v6[v7];
    uint64_t v9 = *(void *)&v16[v7 + 8];
    *(void *)v8 = MEMORY[0x1E4F76A98] + 16;
    *((void *)v8 + 1) = v9;
    *((_DWORD *)v8 + 4) = *(_DWORD *)&v16[v7 + 16];
    v7 += 24;
  }
  while (v7 != 48);
  a3[1] = v6 + 48;
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }
}

void sub_1955C7A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void **a22)
{
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&a22);
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }

  _Unwind_Resume(a1);
}

void ___ZL40_MPMLInitPropertyPodcastEpisodeAuthorMapv_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  v10 = [v8 mediaLibrary];
  char v11 = [v10 uniqueIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___ZL40_MPMLInitPropertyPodcastEpisodeAuthorMapv_block_invoke_2;
  v13[3] = &__block_descriptor_48_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v13[4] = a3;
  v13[5] = a4;
  [v9 setLibraryIdentifiersWithDatabaseID:v11 block:v13];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___ZL40_MPMLInitPropertyPodcastEpisodeAuthorMapv_block_invoke_3;
  v12[3] = &__block_descriptor_48_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v12[4] = a3;
  v12[5] = a4;
  [v9 setUniversalStoreIdentifiersWithBlock:v12];
}

void sub_1955C7BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL40_MPMLInitPropertyPodcastEpisodeAuthorMapv_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "pid");
  id v5 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v4, (unsigned __int8 *)__p);
  if (!v5) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  v6 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v5 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v6, "longLongValue"));

  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955C7CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL40_MPMLInitPropertyPodcastEpisodeAuthorMapv_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "storeID");
  id v5 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v4, (unsigned __int8 *)__p);
  if (!v5) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  v6 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v5 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v6, "longLongValue"));

  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955C7D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL34_MPMLInitPropertyPodcastEpisodeMapv_block_invoke_11(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "datePlayed");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  id v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955C7E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL34_MPMLInitPropertyPodcastEpisodeMapv_block_invoke_10(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "userRating");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  id v9 = NSNumber;
  [v8 floatValue];
  char v11 = [v9 numberWithDouble:v10 / 100.0];

  return v11;
}

void sub_1955C7FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL34_MPMLInitPropertyPodcastEpisodeMapv_block_invoke_9(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "dateReleased");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  uint64_t v9 = [v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  float v10 = _MPMLDateComponentsFromStoredInt64(v9);

  return v10;
}

void sub_1955C80A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id _MPMLDateComponentsFromStoredInt64(uint64_t a1)
{
  if (a1)
  {
    v1 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)a1];
    v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v3 = [v2 components:3145982 fromDate:v1];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_1955C816C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___ZL34_MPMLInitPropertyPodcastEpisodeMapv_block_invoke_8(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "time");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithDouble:", (double)objc_msgSend(v8, "longLongValue") / 1000.0);

  return v9;
}

void sub_1955C8264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL34_MPMLInitPropertyPodcastEpisodeMapv_block_invoke_7(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "title");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

void sub_1955C8340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL34_MPMLInitPropertyPodcastEpisodeMapv_block_invoke_6(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "titleOrder");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  objc_msgSend(v5, "_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering");
  }
  mlcore::SortDescriptor::SortDescriptor();
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  float v10 = a3;
  char v11 = 0;
  id v6 = operator new(0x18uLL);
  a3[2] = v6 + 3;
  uint64_t v7 = v12;
  void *v6 = MEMORY[0x1E4F76A98] + 16;
  v6[1] = v7;
  *((_DWORD *)v6 + 4) = v13;
  *a3 = v6;
  a3[1] = v6 + 3;
  if (v9 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955C847C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void **a16)
{
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&a16);
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void ___ZL34_MPMLInitPropertyPodcastEpisodeMapv_block_invoke_5(void *a1@<X1>, void *a2@<X8>)
{
  id v6 = a1;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  id v3 = (mlcore *)mlcore::ItemPropertyStoreID(v6);
  v4 = (mlcore *)mlcore::ItemPropertyPersistentID(v3);
  uint64_t v5 = mlcore::ItemPropertySyncID(v4);
  _MPMLInsertPredicatesForIdentifierSet(a2, v6, (uint64_t)v3, 0, (uint64_t)v4, 0, 0, v5, 0, 0);
}

void sub_1955C854C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, uint64_t a12)
{
  _Unwind_Resume(a1);
}

void ___ZL34_MPMLInitPropertyPodcastEpisodeMapv_block_invoke_4(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  v89 = 0;
  v90 = 0;
  unint64_t v91 = 0;
  id v69 = a2;
  v68 = [v69 modelKind];
  v4 = [v68 identityKind];
  uint64_t v5 = +[MPModelPodcastEpisodeKind identityKind];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    v66 = [MEMORY[0x1E4F28B00] currentHandler];
    v67 = [NSString stringWithUTF8String:"void _MPMLInitPropertyPodcastEpisodeMap()_block_invoke_4"];
    [v66 handleFailureInFunction:v67 file:@"MPMediaLibraryTranslatorSchema.mm" lineNumber:3496 description:@"Must have Podcast Episode kind to generate Podcast Episode entity query."];
  }
  uint64_t v7 = (std::__shared_weak_count *)a3[1];
  uint64_t v87 = *a3;
  v88 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v68 applyToView:&v87 withContext:v69];
  if (v88) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v88);
  }
  char v8 = [v69 allowedEntityIdentifiers];
  char v9 = (mlcore *)mlcore::ItemPropertyStoreID(v8);
  float v10 = (mlcore *)mlcore::ItemPropertyPersistentID(v9);
  uint64_t v11 = mlcore::ItemPropertySyncID(v10);
  _MPMLInsertPredicatesForIdentifierSet(&v89, v8, (uint64_t)v9, 0, (uint64_t)v10, 0, 0, v11, 0, 0);

  v86[0] = 0;
  v86[1] = 0;
  v85 = (uint64_t *)v86;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  uint64_t v12 = [v69 scopedContainers];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v81 objects:v93 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v82 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = [*(id *)(*((void *)&v81 + 1) + 8 * i) identifiers];
        uint64_t v17 = [v16 library];
        uint64_t v18 = [v17 persistentID];

        v19 = [v16 universalStore];
        uint64_t v20 = [v19 adamID];

        v21 = (void **)objc_opt_class();
        v92[0] = v21;
        if (v21 == (void **)objc_opt_class())
        {
          if (v18)
          {
            v23 = std::__tree<std::__value_type<objc_class * {__strong},std::map<mlcore::ModelProperty<long long> *,std::vector<long long>,std::less<mlcore::ModelProperty<long long> *>,std::allocator<std::pair<mlcore::ModelProperty<long long> * const,std::vector<long long>>>>>,std::__map_value_compare<objc_class * {__strong},std::__value_type<objc_class * {__strong},std::map<mlcore::ModelProperty<long long> *,std::vector<long long>,std::less<mlcore::ModelProperty<long long> *>,std::allocator<std::pair<mlcore::ModelProperty<long long> * const,std::vector<long long>>>>>,std::less<objc_class * {__strong}>,true>,std::allocator<std::__value_type<objc_class * {__strong},std::map<mlcore::ModelProperty<long long> *,std::vector<long long>,std::less<mlcore::ModelProperty<long long> *>,std::allocator<std::pair<mlcore::ModelProperty<long long> * const,std::vector<long long>>>>>>>::__emplace_unique_key_args<objc_class * {__strong},std::piecewise_construct_t const&,std::tuple<objc_class * const {__strong}&>,std::tuple<>>(&v85, (unint64_t)v21, (id *)v92);
            id v79 = (id)mlcore::ItemPropertyAlbumPersistentID((mlcore *)v23);
            v24 = std::__tree<std::__value_type<mlcore::ModelProperty<long long> *,std::vector<long long>>,std::__map_value_compare<mlcore::ModelProperty<long long> *,std::__value_type<mlcore::ModelProperty<long long> *,std::vector<long long>>,std::less<mlcore::ModelProperty<long long> *>,true>,std::allocator<std::__value_type<mlcore::ModelProperty<long long> *,std::vector<long long>>>>::__emplace_unique_key_args<mlcore::ModelProperty<long long> *,std::piecewise_construct_t const&,std::tuple<mlcore::ModelProperty<long long> *&&>,std::tuple<>>(v23 + 5, (unint64_t)v79, (uint64_t *)&v79);
            v25 = v24;
            v27 = (uint64_t *)v24[6];
            unint64_t v26 = v24[7];
            if ((unint64_t)v27 >= v26)
            {
              v35 = (uint64_t *)v24[5];
              uint64_t v36 = v27 - v35;
              unint64_t v37 = v36 + 1;
              if ((unint64_t)(v36 + 1) >> 61) {
                std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v38 = v26 - (void)v35;
              if (v38 >> 2 > v37) {
                unint64_t v37 = v38 >> 2;
              }
              BOOL v39 = (unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8;
              unint64_t v40 = 0x1FFFFFFFFFFFFFFFLL;
              if (!v39) {
                unint64_t v40 = v37;
              }
              if (v40)
              {
                unint64_t v40 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v40);
                v35 = (uint64_t *)v25[5];
                v27 = (uint64_t *)v25[6];
              }
              else
              {
                uint64_t v41 = 0;
              }
              v48 = (uint64_t *)(v40 + 8 * v36);
              uint64_t *v48 = v18;
              v28 = v48 + 1;
              while (v27 != v35)
              {
                uint64_t v49 = *--v27;
                *--v48 = v49;
              }
              v25[5] = (uint64_t)v48;
              v25[6] = (uint64_t)v28;
              v25[7] = v40 + 8 * v41;
              if (v35) {
                operator delete(v35);
              }
            }
            else
            {
              uint64_t *v27 = v18;
              v28 = v27 + 1;
            }
            v25[6] = (uint64_t)v28;
          }
          else if (v20)
          {
            v29 = std::__tree<std::__value_type<objc_class * {__strong},std::map<mlcore::ModelProperty<long long> *,std::vector<long long>,std::less<mlcore::ModelProperty<long long> *>,std::allocator<std::pair<mlcore::ModelProperty<long long> * const,std::vector<long long>>>>>,std::__map_value_compare<objc_class * {__strong},std::__value_type<objc_class * {__strong},std::map<mlcore::ModelProperty<long long> *,std::vector<long long>,std::less<mlcore::ModelProperty<long long> *>,std::allocator<std::pair<mlcore::ModelProperty<long long> * const,std::vector<long long>>>>>,std::less<objc_class * {__strong}>,true>,std::allocator<std::__value_type<objc_class * {__strong},std::map<mlcore::ModelProperty<long long> *,std::vector<long long>,std::less<mlcore::ModelProperty<long long> *>,std::allocator<std::pair<mlcore::ModelProperty<long long> * const,std::vector<long long>>>>>>>::__emplace_unique_key_args<objc_class * {__strong},std::piecewise_construct_t const&,std::tuple<objc_class * const {__strong}&>,std::tuple<>>(&v85, (unint64_t)v21, (id *)v92);
            id v79 = (id)mlcore::ItemPropertyStorePlaylistID((mlcore *)v29);
            v30 = std::__tree<std::__value_type<mlcore::ModelProperty<long long> *,std::vector<long long>>,std::__map_value_compare<mlcore::ModelProperty<long long> *,std::__value_type<mlcore::ModelProperty<long long> *,std::vector<long long>>,std::less<mlcore::ModelProperty<long long> *>,true>,std::allocator<std::__value_type<mlcore::ModelProperty<long long> *,std::vector<long long>>>>::__emplace_unique_key_args<mlcore::ModelProperty<long long> *,std::piecewise_construct_t const&,std::tuple<mlcore::ModelProperty<long long> *&&>,std::tuple<>>(v29 + 5, (unint64_t)v79, (uint64_t *)&v79);
            v31 = v30;
            v33 = (uint64_t *)v30[6];
            unint64_t v32 = v30[7];
            if ((unint64_t)v33 >= v32)
            {
              v42 = (uint64_t *)v30[5];
              uint64_t v43 = v33 - v42;
              unint64_t v44 = v43 + 1;
              if ((unint64_t)(v43 + 1) >> 61) {
                std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v45 = v32 - (void)v42;
              if (v45 >> 2 > v44) {
                unint64_t v44 = v45 >> 2;
              }
              BOOL v39 = (unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8;
              unint64_t v46 = 0x1FFFFFFFFFFFFFFFLL;
              if (!v39) {
                unint64_t v46 = v44;
              }
              if (v46)
              {
                unint64_t v46 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v46);
                v42 = (uint64_t *)v31[5];
                v33 = (uint64_t *)v31[6];
              }
              else
              {
                uint64_t v47 = 0;
              }
              v50 = (uint64_t *)(v46 + 8 * v43);
              uint64_t *v50 = v20;
              v34 = v50 + 1;
              while (v33 != v42)
              {
                uint64_t v51 = *--v33;
                *--v50 = v51;
              }
              v31[5] = (uint64_t)v50;
              v31[6] = (uint64_t)v34;
              v31[7] = v46 + 8 * v47;
              if (v42) {
                operator delete(v42);
              }
            }
            else
            {
              uint64_t *v33 = v20;
              v34 = v33 + 1;
            }
            v31[6] = (uint64_t)v34;
          }
        }
        else
        {
          uint64_t v22 = objc_opt_class();
          if (v22 == objc_opt_class()) {
            __assert_rtn("_MPMLInitPropertyPodcastEpisodeMap_block_invoke_4", "MPMediaLibraryTranslatorSchema.mm", 3520, "0");
          }
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v81 objects:v93 count:16];
    }
    while (v13);
  }

  v52 = v85;
  if (v85 != (uint64_t *)v86)
  {
    do
    {
      std::pair<objc_class * const {__strong},std::map<mlcore::ModelProperty<long long> *,std::vector<long long>,std::less<mlcore::ModelProperty<long long>>,std::vector<std::pair<mlcore::ModelProperty<long long> const,std::allocator<long long>>>>>::pair[abi:ne180100](&v79, (id *)v52 + 4);
      std::map<mlcore::ModelProperty<long long> *,std::vector<long long>,std::less<mlcore::ModelProperty<long long> *>,std::allocator<std::pair<mlcore::ModelProperty<long long> * const,std::vector<long long>>>>::map[abi:ne180100]((uint64_t)&v77, v80);
      memset(v76, 0, sizeof(v76));
      if ((void **)v77 != &v78)
      {
        v53 = *(const void **)(v77 + 40);
        __p[0] = *(void **)(v77 + 32);
        uint64_t v74 = 0;
        uint64_t v75 = 0;
        __p[1] = 0;
        std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p[1], v53, *(void *)(v77 + 48), (uint64_t)(*(void *)(v77 + 48) - (void)v53) >> 3);
        if (v74 - (unint64_t)__p[1] == 8) {
          std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>();
        }
        std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>();
      }
      memset(v72, 0, sizeof(v72));
      std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v72, 0, 0, 0);
      mlcore::CreateOrPredicate();
      v54 = v90;
      if ((unint64_t)v90 >= v91)
      {
        int64_t v55 = (v90 - v89) >> 4;
        unint64_t v56 = v55 + 1;
        if ((unint64_t)(v55 + 1) >> 60) {
          std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v57 = v91 - (void)v89;
        if ((uint64_t)(v91 - (void)v89) >> 3 > v56) {
          unint64_t v56 = v57 >> 3;
        }
        if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v58 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v58 = v56;
        }
        v92[4] = (void **)&v91;
        v59 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v58);
        v60 = &v59[2 * v55];
        v92[0] = v59;
        v92[1] = v60;
        v92[3] = &v59[2 * v61];
        *(_OWORD *)v60 = *(_OWORD *)__p;
        __p[0] = 0;
        __p[1] = 0;
        v92[2] = v60 + 2;
        std::vector<std::shared_ptr<mlcore::Predicate>>::__swap_out_circular_buffer((uint64_t *)&v89, v92);
        v62 = v90;
        std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)v92);
        v90 = v62;
        if (__p[1]) {
          std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
        }
      }
      else
      {
        *(_OWORD *)v90 = *(_OWORD *)__p;
        __p[0] = 0;
        __p[1] = 0;
        v90 = v54 + 16;
      }
      v92[0] = v72;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](v92);
      v92[0] = (void **)v76;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](v92);
      std::__tree<std::__value_type<mlcore::ModelProperty<long long> *,std::vector<long long>>,std::__map_value_compare<mlcore::ModelProperty<long long> *,std::__value_type<mlcore::ModelProperty<long long> *,std::vector<long long>>,std::less<mlcore::ModelProperty<long long> *>,true>,std::allocator<std::__value_type<mlcore::ModelProperty<long long> *,std::vector<long long>>>>::destroy(v78);
      std::__tree<std::__value_type<mlcore::ModelProperty<long long> *,std::vector<long long>>,std::__map_value_compare<mlcore::ModelProperty<long long> *,std::__value_type<mlcore::ModelProperty<long long> *,std::vector<long long>>,std::less<mlcore::ModelProperty<long long> *>,true>,std::allocator<std::__value_type<mlcore::ModelProperty<long long> *,std::vector<long long>>>>::destroy((void *)v80[1]);

      v63 = (uint64_t *)v52[1];
      if (v63)
      {
        do
        {
          v64 = v63;
          v63 = (uint64_t *)*v63;
        }
        while (v63);
      }
      else
      {
        do
        {
          v64 = (uint64_t *)v52[2];
          BOOL v65 = *v64 == (void)v52;
          v52 = v64;
        }
        while (!v65);
      }
      v52 = v64;
    }
    while (v64 != (uint64_t *)v86);
  }
  memset(v70, 0, sizeof(v70));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v70, v89, v90, (v90 - v89) >> 4);
  mlcore::CreateAndPredicate();
  mlcore::EntityQuery::podcastEpisodesQuery();
  if (v71) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v71);
  }
  v92[0] = (void **)v70;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](v92);
  std::__tree<std::__value_type<objc_class * {__strong},std::map<mlcore::ModelProperty<long long> *,std::vector<long long>,std::less<mlcore::ModelProperty<long long> *>,std::allocator<std::pair<mlcore::ModelProperty<long long> * const,std::vector<long long>>>>>,std::__map_value_compare<objc_class * {__strong},std::__value_type<objc_class * {__strong},std::map<mlcore::ModelProperty<long long> *,std::vector<long long>,std::less<mlcore::ModelProperty<long long> *>,std::allocator<std::pair<mlcore::ModelProperty<long long> * const,std::vector<long long>>>>>,std::less<objc_class * {__strong}>,true>,std::allocator<std::__value_type<objc_class * {__strong},std::map<mlcore::ModelProperty<long long> *,std::vector<long long>,std::less<mlcore::ModelProperty<long long> *>,std::allocator<std::pair<mlcore::ModelProperty<long long> * const,std::vector<long long>>>>>>>::destroy(v86[0]);

  v92[0] = (void **)&v89;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](v92);
}

void sub_1955C8DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, long long a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  a36 = &a54;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a36);

  _Unwind_Resume(a1);
}

void ___ZL34_MPMLInitPropertyPodcastEpisodeMapv_block_invoke(uint64_t a1, void *a2, void *a3, int8x8_t *a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  float v10 = [v8 mediaLibrary];
  uint64_t v11 = [v10 uniqueIdentifier];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = ___ZL34_MPMLInitPropertyPodcastEpisodeMapv_block_invoke_2;
  v17[3] = &__block_descriptor_48_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v17[4] = a3;
  v17[5] = a4;
  [v9 setLibraryIdentifiersWithDatabaseID:v11 block:v17];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = ___ZL34_MPMLInitPropertyPodcastEpisodeMapv_block_invoke_3;
  v16[3] = &__block_descriptor_48_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v16[4] = a3;
  v16[5] = a4;
  [v9 setUniversalStoreIdentifiersWithBlock:v16];
  std::string::basic_string[abi:ne180100]<0>(__p, "externalGUID");
  uint64_t v12 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v12) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v13 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v12 + 5), a4);
  [v9 setVendorID:v13];

  if (v15 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955C9150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void ___ZL34_MPMLInitPropertyPodcastEpisodeMapv_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "pid");
  uint64_t v5 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v4, (unsigned __int8 *)__p);
  if (!v5) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v6 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v5 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v6, "longLongValue"));

  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955C924C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL34_MPMLInitPropertyPodcastEpisodeMapv_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "storeID");
  uint64_t v5 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v4, (unsigned __int8 *)__p);
  if (!v5) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v6 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v5 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v6, "longLongValue"));

  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955C932C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL33_MPMLInitPropertyPodcastAuthorMapv_block_invoke_5(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "name");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

void sub_1955C940C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL33_MPMLInitPropertyPodcastAuthorMapv_block_invoke_4(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  std::string::basic_string[abi:ne180100]<0>(v12, "hasName");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)v12))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  mlcore::SortDescriptor::SortDescriptor();
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "nameOrder");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  objc_msgSend(v5, "_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering");
  }
  mlcore::SortDescriptor::SortDescriptor();
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v14 = a3;
  char v15 = 0;
  id v6 = (char *)operator new(0x30uLL);
  uint64_t v7 = 0;
  *a3 = v6;
  a3[1] = v6;
  a3[2] = v6 + 48;
  do
  {
    char v8 = &v6[v7];
    uint64_t v9 = *(void *)&v16[v7 + 8];
    *(void *)char v8 = MEMORY[0x1E4F76A98] + 16;
    *((void *)v8 + 1) = v9;
    *((_DWORD *)v8 + 4) = *(_DWORD *)&v16[v7 + 16];
    v7 += 24;
  }
  while (v7 != 48);
  a3[1] = v6 + 48;
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }
}

void sub_1955C95C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void **a22)
{
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&a22);
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }

  _Unwind_Resume(a1);
}

void ___ZL33_MPMLInitPropertyPodcastAuthorMapv_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  float v10 = [v8 mediaLibrary];
  char v11 = [v10 uniqueIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___ZL33_MPMLInitPropertyPodcastAuthorMapv_block_invoke_2;
  v13[3] = &__block_descriptor_48_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v13[4] = a3;
  v13[5] = a4;
  [v9 setLibraryIdentifiersWithDatabaseID:v11 block:v13];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___ZL33_MPMLInitPropertyPodcastAuthorMapv_block_invoke_3;
  v12[3] = &__block_descriptor_48_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v12[4] = a3;
  v12[5] = a4;
  [v9 setUniversalStoreIdentifiersWithBlock:v12];
}

void sub_1955C9744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL33_MPMLInitPropertyPodcastAuthorMapv_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "pid");
  id v5 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v4, (unsigned __int8 *)__p);
  if (!v5) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v6 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v5 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v6, "longLongValue"));

  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955C9818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL33_MPMLInitPropertyPodcastAuthorMapv_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "storeID");
  id v5 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v4, (unsigned __int8 *)__p);
  if (!v5) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v6 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v5 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v6, "longLongValue"));

  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955C98F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL27_MPMLInitPropertyPodcastMapv_block_invoke_8(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "itemPID");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  uint64_t v9 = [v8 longLongValue];

  if (v24 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "mediaType");
  float v10 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v10) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v11 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v10 + 5), a4);
  unsigned int v12 = [v11 unsignedIntValue];

  if (v24 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v13 = MPMediaTypeForMLMediaType(v12);
  std::string::basic_string[abi:ne180100]<0>(__p, "availableArtworkToken");
  uint64_t v14 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v14) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v15 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v14 + 5), a4);
  if (v24 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "fetchableArtworkToken");
  v16 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v16) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v17 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v16 + 5), a4);
  if (v24 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "fetchableArtworkSourceType");
  uint64_t v18 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v18) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  v19 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v18 + 5), a4);
  if (v24 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v20 = [v6 mediaLibrary];
  v21 = _MPMLTranslatorCreateArtworkCatalogBlock(v9, v13, 0, 1, v15, v17, v19, v20);

  return v21;
}

void sub_1955C9BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v20 = v17;

  _Unwind_Resume(a1);
}

id ___ZL27_MPMLInitPropertyPodcastMapv_block_invoke_7(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "feedURL");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  uint64_t v9 = (void *)v8;
  if (v13 < 0)
  {
    operator delete(__p[0]);
    if (v9) {
      goto LABEL_4;
    }
  }
  else if (v8)
  {
LABEL_4:
    float v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
    goto LABEL_7;
  }
  float v10 = 0;
LABEL_7:

  return v10;
}

void sub_1955C9D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL27_MPMLInitPropertyPodcastMapv_block_invoke_6(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "title");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

void sub_1955C9E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL27_MPMLInitPropertyPodcastMapv_block_invoke_5(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  std::string::basic_string[abi:ne180100]<0>(v12, "hasTitle");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)v12))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  mlcore::SortDescriptor::SortDescriptor();
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "titleOrder");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  objc_msgSend(v5, "_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering");
  }
  mlcore::SortDescriptor::SortDescriptor();
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v14 = a3;
  char v15 = 0;
  id v6 = (char *)operator new(0x30uLL);
  uint64_t v7 = 0;
  *a3 = v6;
  a3[1] = v6;
  a3[2] = v6 + 48;
  do
  {
    uint64_t v8 = &v6[v7];
    uint64_t v9 = *(void *)&v16[v7 + 8];
    *(void *)uint64_t v8 = MEMORY[0x1E4F76A98] + 16;
    *((void *)v8 + 1) = v9;
    *((_DWORD *)v8 + 4) = *(_DWORD *)&v16[v7 + 16];
    v7 += 24;
  }
  while (v7 != 48);
  a3[1] = v6 + 48;
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }
}

void sub_1955C9FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void **a22)
{
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&a22);
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }

  _Unwind_Resume(a1);
}

void ___ZL27_MPMLInitPropertyPodcastMapv_block_invoke_4(void *a1@<X1>, void *a2@<X8>)
{
  id v5 = a1;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  id v3 = (mlcore *)mlcore::AlbumPropertyPersistentID(v5);
  uint64_t v4 = mlcore::AlbumPropertySyncID(v3);
  _MPMLInsertPredicatesForIdentifierSet(a2, v5, 0, 0, (uint64_t)v3, 0, 0, v4, 0, 0);
}

void sub_1955CA094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, uint64_t a12)
{
  _Unwind_Resume(a1);
}

void ___ZL27_MPMLInitPropertyPodcastMapv_block_invoke_3(uint64_t a1, void *a2, uint64_t *a3)
{
  id v4 = a2;
  v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  id v5 = [v4 modelKind];
  id v6 = [v5 identityKind];
  uint64_t v7 = +[MPModelPodcastKind identityKind];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"void _MPMLInitPropertyPodcastMap()_block_invoke_3"];
    [v13 handleFailureInFunction:v14 file:@"MPMediaLibraryTranslatorSchema.mm" lineNumber:3371 description:@"Must have podcast kind to generate podcast entity query."];
  }
  uint64_t v9 = (std::__shared_weak_count *)a3[1];
  uint64_t v17 = *a3;
  uint64_t v18 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v5 applyToView:&v17 withContext:v4];
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  float v10 = [v4 allowedEntityIdentifiers];
  char v11 = (mlcore *)mlcore::AlbumPropertyPersistentID(v10);
  uint64_t v12 = mlcore::AlbumPropertySyncID(v11);
  _MPMLInsertPredicatesForIdentifierSet(&v19, v10, 0, 0, (uint64_t)v11, 0, 0, v12, 0, 0);

  memset(v15, 0, sizeof(v15));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v15, v19, v20, (v20 - v19) >> 4);
  mlcore::CreateAndPredicate();
  mlcore::EntityQuery::podcastsQuery();
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  uint64_t v22 = (char **)v15;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v22);

  uint64_t v22 = &v19;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v22);
}

void sub_1955CA290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  *(void *)(v23 - 72) = &a19;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v23 - 72));

  _Unwind_Resume(a1);
}

void ___ZL27_MPMLInitPropertyPodcastMapv_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = a5;
  uint64_t v9 = [a2 mediaLibrary];
  float v10 = [v9 uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___ZL27_MPMLInitPropertyPodcastMapv_block_invoke_2;
  v11[3] = &__block_descriptor_48_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v11[4] = a3;
  v11[5] = a4;
  [v8 setLibraryIdentifiersWithDatabaseID:v10 block:v11];
}

void sub_1955CA3F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL27_MPMLInitPropertyPodcastMapv_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "pid");
  id v5 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v4, (unsigned __int8 *)__p);
  if (!v5) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v6 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v5 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v6, "longLongValue"));

  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955CA4C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL36_MPMLInitPropertyPlaybackPositionMapv_block_invoke_8(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "cloudKVSPlayCount");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

void sub_1955CA5A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL36_MPMLInitPropertyPlaybackPositionMapv_block_invoke_7(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "cloudKVSHasBeenPlayed");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

void sub_1955CA670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL33_MPMLInitPropertyPlaylistEntryMapv_block_invoke_12(uint64_t a1, void *a2, uint64_t a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "itemPID");
  char v15 = __p;
  uint64_t v7 = (ModelPropertyBase **)std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(a3, (unsigned __int8 *)__p, (long long **)&v15);
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(v7[5], a4);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "mediaType");
  char v15 = __p;
  uint64_t v9 = (ModelPropertyBase **)std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(a3, (unsigned __int8 *)__p, (long long **)&v15);
  float v10 = MPMediaLibraryPropertyCacheValueForProperty(v9[5], a4);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if ([v8 longLongValue]) {
    uint64_t v11 = ([v10 intValue] >> 11) & 1;
  }
  else {
    uint64_t v11 = 0;
  }

  return v11;
}

void sub_1955CA7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _Unwind_Resume(a1);
}

void sub_1955CA7E4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  JUMPOUT(0x1955CA7D8);
}

uint64_t ___ZL33_MPMLInitPropertyPlaylistEntryMapv_block_invoke_11(uint64_t a1, void *a2, uint64_t a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "itemPID");
  char v15 = __p;
  uint64_t v7 = (ModelPropertyBase **)std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(a3, (unsigned __int8 *)__p, (long long **)&v15);
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(v7[5], a4);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "mediaType");
  char v15 = __p;
  uint64_t v9 = (ModelPropertyBase **)std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(a3, (unsigned __int8 *)__p, (long long **)&v15);
  float v10 = MPMediaLibraryPropertyCacheValueForProperty(v9[5], a4);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if ([v8 longLongValue]) {
    uint64_t v11 = ([v10 intValue] >> 9) & 1;
  }
  else {
    uint64_t v11 = 0;
  }

  return v11;
}

void sub_1955CA908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _Unwind_Resume(a1);
}

void sub_1955CA948(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  JUMPOUT(0x1955CA93CLL);
}

BOOL ___ZL33_MPMLInitPropertyPlaylistEntryMapv_block_invoke_10(uint64_t a1, void *a2, uint64_t a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "itemPID");
  char v15 = __p;
  uint64_t v7 = (ModelPropertyBase **)std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(a3, (unsigned __int8 *)__p, (long long **)&v15);
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(v7[5], a4);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "mediaType");
  char v15 = __p;
  uint64_t v9 = (ModelPropertyBase **)std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(a3, (unsigned __int8 *)__p, (long long **)&v15);
  float v10 = MPMediaLibraryPropertyCacheValueForProperty(v9[5], a4);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if ([v8 longLongValue]) {
    BOOL v11 = ([v10 intValue] & 0x408) != 0;
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

void sub_1955CAA74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _Unwind_Resume(a1);
}

void sub_1955CAAB4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  JUMPOUT(0x1955CAAA8);
}

id ___ZL33_MPMLInitPropertyPlaylistEntryMapv_block_invoke_9(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "position");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v15 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "positionUUID");
  uint64_t v9 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v9) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  float v10 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v9 + 5), a4);
  if (v15 < 0) {
    operator delete(__p[0]);
  }
  if ([v10 length])
  {
    id v11 = v10;
  }
  else
  {
    id v11 = [v8 stringValue];
  }
  uint64_t v12 = v11;

  return v12;
}

void sub_1955CABF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_1955CAC34(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  JUMPOUT(0x1955CAC28);
}

id ___ZL33_MPMLInitPropertyPlaylistEntryMapv_block_invoke_8(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "persistentID");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v15 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "UUID");
  uint64_t v9 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v9) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  float v10 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v9 + 5), a4);
  if (v15 < 0) {
    operator delete(__p[0]);
  }
  if ([v10 length])
  {
    id v11 = v10;
  }
  else
  {
    id v11 = [v8 stringValue];
  }
  uint64_t v12 = v11;

  return v12;
}

void sub_1955CAD74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_1955CADB4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  JUMPOUT(0x1955CADA8);
}

id ___ZL33_MPMLInitPropertyPlaylistEntryMapv_block_invoke_7(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "position");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

void sub_1955CAE74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL33_MPMLInitPropertyPlaylistEntryMapv_block_invoke_6()
{
  return 0;
}

void ___ZL33_MPMLInitPropertyPlaylistEntryMapv_block_invoke_5(void *a1@<X1>, void *a2@<X2>, mlcore::Query **a3@<X8>)
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  id v128 = a1;
  id v4 = [v128 scopedContainers];
  id v5 = [v4 reverseObjectEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v159 objects:v170 count:16];
  if (!v6)
  {
LABEL_9:

    goto LABEL_32;
  }
  uint64_t v7 = *(void *)v160;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v160 != v7) {
      objc_enumerationMutation(v5);
    }
    uint64_t v9 = *(void **)(*((void *)&v159 + 1) + 8 * v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v5 countByEnumeratingWithState:&v159 objects:v170 count:16];
      if (!v6) {
        goto LABEL_9;
      }
      goto LABEL_3;
    }
  }
  id v126 = v9;

  if (!v126)
  {
LABEL_32:
    memset(&__v, 0, 24);
    memset(&__p, 0, sizeof(__p));
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    BOOL v39 = [v128 allowedEntityIdentifiers];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v129 objects:v163 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v130;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v130 != v41) {
            objc_enumerationMutation(v39);
          }
          uint64_t v43 = *(void **)(*((void *)&v129 + 1) + 8 * i);
          unint64_t v44 = [v43 library];
          BOOL v45 = [v44 containedPersistentID] == 0;

          if (!v45)
          {
            unint64_t v46 = [v43 library];
            uint64_t v47 = [v46 persistentID];
            uint64_t v48 = v47;
            std::string::size_type size = __p.__r_.__value_.__l.__size_;
            if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
            {
              uint64_t v51 = (void *)__p.__r_.__value_.__r.__words[0];
              uint64_t v52 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
              unint64_t v53 = v52 + 1;
              if ((unint64_t)(v52 + 1) >> 61) {
                std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
              }
              int64_t v54 = __p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0];
              if ((uint64_t)(__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0]) >> 2 > v53) {
                unint64_t v53 = v54 >> 2;
              }
              if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v55 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v55 = v53;
              }
              if (v55)
              {
                unint64_t v55 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v55);
                std::string::size_type size = __p.__r_.__value_.__l.__size_;
                uint64_t v51 = (void *)__p.__r_.__value_.__r.__words[0];
              }
              else
              {
                uint64_t v56 = 0;
              }
              uint64_t v57 = (uint64_t *)(v55 + 8 * v52);
              *uint64_t v57 = v48;
              std::string::size_type v50 = (std::string::size_type)(v57 + 1);
              while ((void *)size != v51)
              {
                uint64_t v58 = *(void *)(size - 8);
                size -= 8;
                *--uint64_t v57 = v58;
              }
              __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v57;
              __p.__r_.__value_.__l.__size_ = v50;
              __p.__r_.__value_.__r.__words[2] = v55 + 8 * v56;
              if (v51) {
                operator delete(v51);
              }
            }
            else
            {
              *(void *)__p.__r_.__value_.__l.__size_ = v47;
              std::string::size_type v50 = size + 8;
            }
            __p.__r_.__value_.__l.__size_ = v50;
          }
        }
        uint64_t v40 = [v39 countByEnumeratingWithState:&v129 objects:v163 count:16];
      }
      while (v40);
    }

    if (__p.__r_.__value_.__l.__size_ == __p.__r_.__value_.__r.__words[0])
    {
      v121 = [MEMORY[0x1E4F28B00] currentHandler];
      v122 = [NSString stringWithUTF8String:"void _MPMLInitPropertyPlaylistEntryMap()_block_invoke_5"];
      [v121 handleFailureInFunction:v122 file:@"MPMediaLibraryTranslatorSchema.mm" lineNumber:2278 description:@"Attempted to query playlist entries without scoping to a playlist or allowed identifiers"];
    }
    mlcore::PlaylistItemPropertyPersistentID(v59);
    std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>();
  }
  v125 = [v128 modelKind];
  float v10 = [v125 identityKind];
  char v11 = +[MPModelPlaylistEntryKind identityKind];
  char v12 = [v10 isEqual:v11];

  if ((v12 & 1) == 0)
  {
    v123 = [MEMORY[0x1E4F28B00] currentHandler];
    v124 = [NSString stringWithUTF8String:"void _MPMLInitPropertyPlaylistEntryMap()_block_invoke_5"];
    [v123 handleFailureInFunction:v124 file:@"MPMediaLibraryTranslatorSchema.mm" lineNumber:2199 description:@"Must have PlaylistEntry kind to generate PlaylistEntry entity query."];
  }
  char v13 = (std::__shared_weak_count *)a2[1];
  v157 = (void (***)(void, uint64_t *, uint64_t *, void *))*a2;
  v158 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v125 applyToView:&v157 withContext:v128];
  if (v158) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v158);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  char v14 = [v128 filterText];
  BOOL v15 = [v14 length] == 0;

  if (!v15)
  {
    id v16 = [v128 filterText];
    std::string::basic_string[abi:ne180100]<0>(&__v, (char *)[v16 UTF8String]);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)&__v.__first_;
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)__v.__end_;
    HIBYTE(__v.__end_) = 0;
    LOBYTE(__v.__first_) = 0;
  }
  id v155 = [v126 identifiers];
  uint64_t v17 = [v155 library];
  [v17 persistentID];

  std::allocate_shared[abi:ne180100]<mlcore::Playlist,std::allocator<mlcore::Playlist>,long long &,void>(&v153);
  if (v155)
  {
    +[MPMediaLibrary logDatabaseAccess];
    memset(&__v, 0, 24);
    id v169 = v155;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v169 count:1];
    v19 = (mlcore *)mlcore::PlaylistPropertyPersistentID(v18);
    uint64_t v20 = (mlcore *)mlcore::PlaylistPropertyStoreCloudID(v19);
    uint64_t v21 = (mlcore *)mlcore::PlaylistPropertyCloudGlobalID(v20);
    uint64_t v22 = (mlcore *)mlcore::PlaylistPropertySyncID(v21);
    uint64_t v23 = mlcore::PlaylistPropertyCloudUniversalLibraryID(v22);
    _MPMLInsertPredicatesForIdentifierSet(&__v, v18, 0, 0, (uint64_t)v19, (uint64_t)v20, (uint64_t)v21, (uint64_t)v22, v23, 0);

    uint64_t v24 = MEMORY[0x19971D610]();
    memset(v152, 0, sizeof(v152));
    std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v152, __v.__first_->__r_.__value_.__r.__words, __v.__begin_->__r_.__value_.__r.__words, ((char *)__v.__begin_ - (char *)__v.__first_) >> 4);
    mlcore::CreateAndPredicate();
    std::allocate_shared[abi:ne180100]<mlcore::EntityQuery,std::allocator<mlcore::EntityQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&p_v, v24, (long long *)&dsema);
    if (dsema.__end_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)dsema.__end_);
    }
    v133[0] = v152;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)v133);
    v25 = p_v;
    IsSmart = (mlcore *)mlcore::PlaylistPropertyIsSmart(v26);
    IsDynamic = (mlcore *)mlcore::PlaylistPropertySmartIsDynamic(IsSmart);
    uint64_t IsSourceRemote = mlcore::PlaylistPropertyIsSourceRemote(IsDynamic);
    v150 = 0;
    v149 = 0;
    v151 = 0;
    v30 = operator new(0x18uLL);
    v151 = v30 + 3;
    void *v30 = IsSmart;
    v30[1] = IsDynamic;
    v30[2] = IsSourceRemote;
    v149 = v30;
    v150 = v30 + 3;
    mlcore::PropertiesQuery::setPropertiesToFetch();
    if (v149)
    {
      v150 = v149;
      operator delete(v149);
    }
    dsema.__begin_ = (std::vector<std::string>::pointer)dispatch_semaphore_create(0);
    v31 = (void (***)(void, uint64_t *, uint64_t *, void *))*a2;
    unint64_t v32 = v144;
    if (v144) {
      atomic_fetch_add_explicit(&v144->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v168 = 0;
    v33 = operator new(0x20uLL);
    void *v33 = &unk_1EE672BE0;
    v33[1] = &v155;
    v33[2] = &v153;
    v33[3] = &dsema;
    v168 = v33;
    mlcore::LibraryView::performQuery<mlcore::EntityQuery>(v31, (uint64_t)v25, v32, (uint64_t)v167);
    std::__function::__value_func<void ()(std::shared_ptr<mlcore::EntityQueryResult>)>::~__value_func[abi:ne180100](v167);
    if (v32) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v32);
    }
    v34 = (mlcore *)dispatch_semaphore_wait((dispatch_semaphore_t)dsema.__begin_, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v35 = v153;
    uint64_t v36 = (ModelPropertyBase *)mlcore::PlaylistPropertySmartIsDynamic(v34);
    unint64_t v37 = (mlcore *)mlcore::Entity::valueForProperty<int>(v35, v36);
    if (v37)
    {
      BOOL v38 = 1;
    }
    else
    {
      uint64_t v60 = v153;
      uint64_t v61 = (ModelPropertyBase *)mlcore::PlaylistPropertyIsSmart(v37);
      v62 = (mlcore *)mlcore::Entity::valueForProperty<int>(v60, v61);
      if (v62)
      {
        uint64_t v63 = v153;
        v64 = (ModelPropertyBase *)mlcore::PlaylistPropertyIsSourceRemote(v62);
        BOOL v38 = mlcore::Entity::valueForProperty<int>(v63, v64) == 2;
      }
      else
      {
        BOOL v38 = 0;
      }
    }

    if (v32) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v32);
    }
    p_v = &__v;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_v);
  }
  else
  {
    BOOL v38 = 0;
  }
  uint64_t v147 = v153;
  v148 = v154;
  if (v154) {
    atomic_fetch_add_explicit(&v154->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v146, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v146 = __p;
  }
  mlcore::EntityQuery::playlistItemsQuery();
  if (SHIBYTE(v146.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v146.__r_.__value_.__l.__data_);
  }
  if (v148) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v148);
  }
  if (v38)
  {
    p_v = 0;
    v144 = 0;
    unint64_t v145 = 0;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    BOOL v65 = [v128 allowedEntityIdentifiers];
    uint64_t v66 = [v65 countByEnumeratingWithState:&v139 objects:v166 count:16];
    if (v66)
    {
      uint64_t v67 = *(void *)v140;
      do
      {
        for (uint64_t j = 0; j != v66; ++j)
        {
          if (*(void *)v140 != v67) {
            objc_enumerationMutation(v65);
          }
          id v69 = *(void **)(*((void *)&v139 + 1) + 8 * j);
          v70 = [v69 library];
          BOOL v71 = [v70 persistentID] == 0;

          if (!v71)
          {
            v72 = [v69 library];
            uint64_t v73 = [v72 persistentID];

            uint64_t v74 = v73 & 0x7FFFFFFFFFFFFFFFLL;
            uint64_t v75 = &v144->__vftable;
            if ((unint64_t)v144 >= v145)
            {
              uint64_t v77 = p_v;
              uint64_t v78 = ((char *)v144 - (unsigned char *)p_v) >> 3;
              unint64_t v79 = v78 + 1;
              if ((unint64_t)(v78 + 1) >> 61) {
                std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v80 = v145 - (void)p_v;
              if ((uint64_t)(v145 - (void)p_v) >> 2 > v79) {
                unint64_t v79 = v80 >> 2;
              }
              if ((unint64_t)v80 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v81 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v81 = v79;
              }
              if (v81)
              {
                unint64_t v81 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v81);
                uint64_t v77 = p_v;
                uint64_t v75 = &v144->__vftable;
              }
              else
              {
                uint64_t v82 = 0;
              }
              long long v83 = (uint64_t *)(v81 + 8 * v78);
              *long long v83 = v74;
              v76 = (std::__shared_weak_count *)(v83 + 1);
              while (v75 != v77)
              {
                uint64_t v84 = *--v75;
                *--long long v83 = v84;
              }
              p_v = v83;
              v144 = v76;
              unint64_t v145 = v81 + 8 * v82;
              if (v77) {
                operator delete(v77);
              }
            }
            else
            {
              v144->__vftable = (std::__shared_weak_count_vtbl *)v74;
              v76 = (std::__shared_weak_count *)(v75 + 1);
            }
            v144 = v76;
          }
        }
        uint64_t v66 = [v65 countByEnumeratingWithState:&v139 objects:v166 count:16];
      }
      while (v66);
    }

    v85 = v144;
    if (v144 != p_v)
    {
      v86 = (mlcore *)mlcore::Query::predicate((uint64_t *)&__v, *a3);
      mlcore::ItemPropertyPersistentID(v86);
      std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>();
    }
  }
  else
  {
    p_v = 0;
    v144 = 0;
    unint64_t v145 = 0;
    memset(&dsema, 0, sizeof(dsema));
    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    uint64_t v87 = [v128 allowedEntityIdentifiers];
    uint64_t v88 = [v87 countByEnumeratingWithState:&v135 objects:v164 count:16];
    if (v88)
    {
      uint64_t v89 = *(void *)v136;
      do
      {
        for (uint64_t k = 0; k != v88; ++k)
        {
          if (*(void *)v136 != v89) {
            objc_enumerationMutation(v87);
          }
          unint64_t v91 = *(void **)(*((void *)&v135 + 1) + 8 * k);
          v92 = [v91 library];
          BOOL v93 = [v92 persistentID] == 0;

          if (!v93)
          {
            uint64_t v94 = [v91 library];
            uint64_t v95 = [v94 persistentID];
            uint64_t v96 = v95;
            v97 = &v144->__vftable;
            if ((unint64_t)v144 >= v145)
            {
              v99 = p_v;
              uint64_t v100 = ((char *)v144 - (unsigned char *)p_v) >> 3;
              unint64_t v101 = v100 + 1;
              if ((unint64_t)(v100 + 1) >> 61) {
                std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v102 = v145 - (void)p_v;
              if ((uint64_t)(v145 - (void)p_v) >> 2 > v101) {
                unint64_t v101 = v102 >> 2;
              }
              BOOL v103 = (unint64_t)v102 >= 0x7FFFFFFFFFFFFFF8;
              unint64_t v104 = 0x1FFFFFFFFFFFFFFFLL;
              if (!v103) {
                unint64_t v104 = v101;
              }
              if (v104)
              {
                unint64_t v104 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v104);
                v99 = p_v;
                v97 = &v144->__vftable;
              }
              else
              {
                uint64_t v105 = 0;
              }
              v106 = (uint64_t *)(v104 + 8 * v100);
              uint64_t *v106 = v96;
              v98 = (std::__shared_weak_count *)(v106 + 1);
              while (v97 != v99)
              {
                uint64_t v107 = *--v97;
                *--v106 = v107;
              }
              p_v = v106;
              v144 = v98;
              unint64_t v145 = v104 + 8 * v105;
              if (v99) {
                operator delete(v99);
              }
            }
            else
            {
              v144->__vftable = (std::__shared_weak_count_vtbl *)v95;
              v98 = (std::__shared_weak_count *)(v97 + 1);
            }
            v144 = v98;
          }
          v108 = [v91 containerUniqueID];
          BOOL v109 = [v108 length] == 0;

          if (!v109)
          {
            id v110 = [v91 containerUniqueID];
            std::string::basic_string[abi:ne180100]<0>(v133, (char *)[v110 UTF8String]);
            std::vector<std::string>::pointer end = dsema.__end_;
            if (dsema.__end_ >= dsema.__end_cap_.__value_)
            {
              unint64_t v113 = 0xAAAAAAAAAAAAAAABLL * (((char *)dsema.__end_ - (char *)dsema.__begin_) >> 3);
              unint64_t v114 = v113 + 1;
              if (v113 + 1 > 0xAAAAAAAAAAAAAAALL) {
                std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
              }
              if (0x5555555555555556 * (((char *)dsema.__end_cap_.__value_ - (char *)dsema.__begin_) >> 3) > v114) {
                unint64_t v114 = 0x5555555555555556 * (((char *)dsema.__end_cap_.__value_ - (char *)dsema.__begin_) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * (((char *)dsema.__end_cap_.__value_ - (char *)dsema.__begin_) >> 3) >= 0x555555555555555) {
                unint64_t v115 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v115 = v114;
              }
              __v.__end_cap_.__value_ = (std::allocator<std::string> *)&dsema.__end_cap_;
              if (v115) {
                unint64_t v115 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v115);
              }
              else {
                uint64_t v116 = 0;
              }
              v117 = (std::string *)(v115 + 24 * v113);
              __v.__first_ = (std::__split_buffer<std::string>::pointer)v115;
              __v.__begin_ = v117;
              __v.__end_cap_.__value_ = (std::string *)(v115 + 24 * v116);
              long long v118 = *(_OWORD *)v133;
              v117->__r_.__value_.__r.__words[2] = v134;
              *(_OWORD *)&v117->__r_.__value_.__l.__data_ = v118;
              v133[1] = 0;
              std::string::size_type v134 = 0;
              v133[0] = 0;
              __v.__end_ = v117 + 1;
              std::vector<std::string>::__swap_out_circular_buffer(&dsema, &__v);
              v119 = dsema.__end_;
              std::__split_buffer<std::string>::~__split_buffer(&__v);
              dsema.__end_ = v119;
              if (SHIBYTE(v134) < 0) {
                operator delete(v133[0]);
              }
            }
            else
            {
              long long v112 = *(_OWORD *)v133;
              dsema.__end_->__r_.__value_.__r.__words[2] = v134;
              *(_OWORD *)&end->__r_.__value_.__l.__data_ = v112;
              v133[1] = 0;
              std::string::size_type v134 = 0;
              v133[0] = 0;
              dsema.__end_ = end + 1;
            }
          }
        }
        uint64_t v88 = [v87 countByEnumeratingWithState:&v135 objects:v164 count:16];
      }
      while (v88);
    }

    if (v144 != p_v || dsema.__end_ != dsema.__begin_)
    {
      mlcore::PlaylistItemPropertyPersistentID(v120);
      std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>();
    }
    __v.__first_ = (std::__split_buffer<std::string>::pointer)&dsema;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
    v85 = (std::__shared_weak_count *)p_v;
  }
  if (v85)
  {
    v144 = v85;
    operator delete(v85);
  }
  if (v154) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v154);
  }

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1955CBF04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void *_ZNKSt3__110__function6__funcIZZL33_MPMLInitPropertyPlaylistEntryMapvEUb_E3__5NS_9allocatorIS2_EEFvNS_10shared_ptrIN6mlcore17EntityQueryResultEEEEE11target_typeEv()
{
  return &_ZTIZZL33_MPMLInitPropertyPlaylistEntryMapvEUb_E3__5;
}

uint64_t _ZNKSt3__110__function6__funcIZZL33_MPMLInitPropertyPlaylistEntryMapvEUb_E3__5NS_9allocatorIS2_EEFvNS_10shared_ptrIN6mlcore17EntityQueryResultEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZZL33_MPMLInitPropertyPlaylistEntryMapvEUb_E3$_5"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void _ZNSt3__110__function6__funcIZZL33_MPMLInitPropertyPlaylistEntryMapvEUb_E3__5NS_9allocatorIS2_EEFvNS_10shared_ptrIN6mlcore17EntityQueryResultEEEEEclEOS8_(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = *(mlcore::EntityQueryResult **)a2;
  id v3 = *(std::__shared_weak_count **)(a2 + 8);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  if (mlcore::EntityQueryResult::entityCount(v4))
  {
    mlcore::EntityQueryResult::entityAtIndex(v4);
    id v5 = (void *)lpsrc;
    if ((void)lpsrc
      && (id v5 = __dynamic_cast((const void *)lpsrc, MEMORY[0x1E4F76A70], MEMORY[0x1E4F76A78], 0)) != 0)
    {
      uint64_t v6 = *((void *)&lpsrc + 1);
      if (*((void *)&lpsrc + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&lpsrc + 1) + 8), 1uLL, memory_order_relaxed);
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void **)(a1 + 16);
    uint64_t v8 = (std::__shared_weak_count *)v7[1];
    *uint64_t v7 = v5;
    v7[1] = v6;
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    if (*((void *)&lpsrc + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&lpsrc + 1));
    }
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = **(void **)(a1 + 8);
      LODWORD(lpsrc) = 138543362;
      *(void *)((char *)&lpsrc + 4) = v10;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_ERROR, "Did not find playlist for identifiers: %{public}@", (uint8_t *)&lpsrc, 0xCu);
    }
  }
  dispatch_semaphore_signal(**(dispatch_semaphore_t **)(a1 + 24));
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_1955CC5C4(_Unwind_Exception *exception_object)
{
}

__n128 _ZNKSt3__110__function6__funcIZZL33_MPMLInitPropertyPlaylistEntryMapvEUb_E3__5NS_9allocatorIS2_EEFvNS_10shared_ptrIN6mlcore17EntityQueryResultEEEEE7__cloneEPNS0_6__baseIS9_EE(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1EE672BE0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 _ZNKSt3__110__function6__funcIZZL33_MPMLInitPropertyPlaylistEntryMapvEUb_E3__5NS_9allocatorIS2_EEFvNS_10shared_ptrIN6mlcore17EntityQueryResultEEEEE7__cloneEv(uint64_t a1)
{
  v2 = (char *)operator new(0x20uLL);
  *(void *)v2 = &unk_1EE672BE0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

void _ZNSt3__110__function6__funcIZZL33_MPMLInitPropertyPlaylistEntryMapvEUb_E3__5NS_9allocatorIS2_EEFvNS_10shared_ptrIN6mlcore17EntityQueryResultEEEEED0Ev()
{
}

void ___ZL33_MPMLInitPropertyPlaylistEntryMapv_block_invoke(uint64_t a1, void *a2, void *a3, int8x8_t *a4, void *a5)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  uint64_t v10 = [v8 mediaLibrary];
  char v11 = [v10 uniqueIdentifier];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = ___ZL33_MPMLInitPropertyPlaylistEntryMapv_block_invoke_2;
  v30[3] = &__block_descriptor_48_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v30[4] = a3;
  v30[5] = a4;
  [v9 setLibraryIdentifiersWithDatabaseID:v11 block:v30];

  uint64_t v12 = [v8 personID];
  if ([v12 length])
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = ___ZL33_MPMLInitPropertyPlaylistEntryMapv_block_invoke_3;
    v29[3] = &__block_descriptor_48_e45_v16__0___MPMutablePersonalStoreIdentifiers__8l;
    v29[4] = a3;
    v29[5] = a4;
    [v9 setPersonalStoreIdentifiersWithPersonID:v12 block:v29];
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = ___ZL33_MPMLInitPropertyPlaylistEntryMapv_block_invoke_4;
  v28[3] = &__block_descriptor_48_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v28[4] = a3;
  v28[5] = a4;
  [v9 setUniversalStoreIdentifiersWithBlock:v28];
  std::string::basic_string[abi:ne180100]<0>(v31, "occurrenceID");
  char v13 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)v31);
  if (!v13) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v14 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v13 + 5), a4);
  [v9 setContainerUniqueID:v14];

  if (v32 < 0) {
    operator delete(v31[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(v31, "excludeFromShuffle");
  BOOL v15 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)v31);
  if (!v15) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v16 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v15 + 5), a4);
  objc_msgSend(v9, "setShouldExcludeFromShuffle:", objc_msgSend(v16, "BOOLValue"));

  if (v32 < 0) {
    operator delete(v31[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "pid");
  uint64_t v17 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v17) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v18 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v17 + 5), a4);
  uint64_t quot = [v18 longLongValue];
  uint64_t v20 = quot;
  uint64_t v21 = (char *)&v33 + 1;
  do
  {
    lldiv_t v22 = lldiv(quot, 10);
    uint64_t quot = v22.quot;
    if (v22.rem >= 0) {
      LOBYTE(v23) = v22.rem;
    }
    else {
      uint64_t v23 = -v22.rem;
    }
    *(v21 - 2) = v23 + 48;
    uint64_t v24 = (const UInt8 *)(v21 - 2);
    --v21;
  }
  while (v22.quot);
  if (v20 < 0)
  {
    *(v21 - 2) = 45;
    uint64_t v24 = (const UInt8 *)(v21 - 2);
  }
  v25 = (__CFString *)CFStringCreateWithBytes(0, v24, (char *)&v33 - (char *)v24, 0x8000100u, 0);
  [v9 setHandoffCorrelationID:v25];

  if (v27 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955CC9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void ___ZL33_MPMLInitPropertyPlaylistEntryMapv_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "pid");
  id v5 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v4, (unsigned __int8 *)__p);
  if (!v5) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v6 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v5 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v6, "longLongValue"));

  if (v11 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v7 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "itemPid");
  id v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v7, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v9 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v8 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setContainedPersistentID:", objc_msgSend(v9, "longLongValue"));

  if (v11 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955CCBB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL33_MPMLInitPropertyPlaylistEntryMapv_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "cloudID");
  id v5 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v4, (unsigned __int8 *)__p);
  if (!v5) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v6 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v5 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v6, "unsignedLongLongValue"));

  if (v11 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v7 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "storeCloudAlbumID");
  id v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v7, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v9 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v8 + 5), *(int8x8_t **)(a1 + 40));
  [v3 setCloudAlbumID:v9];

  if (v11 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955CCD00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void ___ZL33_MPMLInitPropertyPlaylistEntryMapv_block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "cloudUniversalLibraryID");
  id v5 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v4, (unsigned __int8 *)__p);
  if (!v5) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v6 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v5 + 5), *(int8x8_t **)(a1 + 40));
  [v3 setUniversalCloudLibraryID:v6];

  if (v20 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v7 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "subscriptionStoreID");
  id v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v7, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v9 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v8 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setSubscriptionAdamID:", objc_msgSend(v9, "longLongValue"));

  if (v20 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v10 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "storeID");
  char v11 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v10, (unsigned __int8 *)__p);
  if (!v11) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v12 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v11 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v12, "longLongValue"));

  if (v20 < 0) {
    operator delete(__p[0]);
  }
  objc_msgSend(v3, "setPurchasedAdamID:", objc_msgSend(v3, "adamID"));
  char v13 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "reportingStoreItemID");
  char v14 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v13, (unsigned __int8 *)__p);
  if (!v14) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  BOOL v15 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v14 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setReportingAdamID:", objc_msgSend(v15, "longLongValue"));

  if (v20 < 0) {
    operator delete(__p[0]);
  }
  id v16 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "assetStoreItemID");
  uint64_t v17 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v16, (unsigned __int8 *)__p);
  if (!v17) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v18 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v17 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setAssetAdamID:", objc_msgSend(v18, "longLongValue"));

  if (v20 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955CCFA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL25_MPMLInitPropertyGenreMapv_block_invoke_8(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "libraryAdded");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  id v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955CD0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL25_MPMLInitPropertyGenreMapv_block_invoke_6(void *a1@<X1>, void *a2@<X2>, uint64_t a3@<X3>, _OWORD *a4@<X8>)
{
  id v7 = a2;
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)[v7 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "name");
  id v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v9 = *((void *)v8 + 5);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)v9 + 80))(v9) != 3)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    char v11 = [NSString stringWithUTF8String:"void _MPMLInitPropertyGenreMap()_block_invoke_6"];
    [v10 handleFailureInFunction:v11 file:@"MPMediaLibraryTranslatorSchema.mm" lineNumber:2120 description:@"The base property key for Genre's property[name] is not a string and thus cannot be used to create a SearchPredicate"];
  }
  if (a3 == 1)
  {
    unsigned int v12 = 0;
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *&,std::string&,mediaplatform::UnicodeSearch::MatchType,void>(__p, v9, (uint64_t)v15, &v12);
  }
  else
  {
    if (a3) {
      goto LABEL_11;
    }
    unsigned int v12 = 4;
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *&,std::string&,mediaplatform::UnicodeSearch::MatchType,void>(__p, v9, (uint64_t)v15, &v12);
  }
  *a4 = *(_OWORD *)__p;
LABEL_11:
  if (v16 < 0) {
    operator delete(v15[0]);
  }
}

void sub_1955CD298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *&,std::string&,mediaplatform::UnicodeSearch::MatchType,void>(void *a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  id v8 = operator new(0x48uLL);
  v8[1] = 0;
  v8[2] = 0;
  void *v8 = &unk_1EE6732E8;
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string __p = *(std::string *)a3;
  }
  MEMORY[0x19971BFE0](v8 + 3, a2, &__p, *a4);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  *a1 = v8 + 3;
  a1[1] = v8;
}

void sub_1955CD3C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  std::__shared_weak_count::~__shared_weak_count(v14);
  operator delete(v16);
  _Unwind_Resume(a1);
}

void ___ZL25_MPMLInitPropertyGenreMapv_block_invoke_5(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  std::string::basic_string[abi:ne180100]<0>(v12, "hasName");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)v12))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  mlcore::SortDescriptor::SortDescriptor();
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "nameOrder");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  objc_msgSend(v5, "_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering");
  }
  mlcore::SortDescriptor::SortDescriptor();
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  char v14 = a3;
  char v15 = 0;
  id v6 = (char *)operator new(0x30uLL);
  uint64_t v7 = 0;
  *a3 = v6;
  a3[1] = v6;
  a3[2] = v6 + 48;
  do
  {
    id v8 = &v6[v7];
    uint64_t v9 = *(void *)&v16[v7 + 8];
    *(void *)id v8 = MEMORY[0x1E4F76A98] + 16;
    *((void *)v8 + 1) = v9;
    *((_DWORD *)v8 + 4) = *(_DWORD *)&v16[v7 + 16];
    v7 += 24;
  }
  while (v7 != 48);
  a3[1] = v6 + 48;
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }
}

void sub_1955CD57C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void **a22)
{
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&a22);
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }

  _Unwind_Resume(a1);
}

void ___ZL25_MPMLInitPropertyGenreMapv_block_invoke_4(void *a1@<X1>, void *a2@<X8>)
{
  id v4 = a1;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  uint64_t v3 = mlcore::GenrePropertyPersistentID(v4);
  _MPMLInsertPredicatesForIdentifierSet(a2, v4, 0, 0, v3, 0, 0, 0, 0, 0);
}

void sub_1955CD650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, uint64_t a12)
{
  _Unwind_Resume(a1);
}

void ___ZL25_MPMLInitPropertyGenreMapv_block_invoke_3(uint64_t a1, void *a2, uint64_t *a3)
{
  id v4 = a2;
  uint64_t v36 = 0;
  unint64_t v37 = 0;
  unint64_t v38 = 0;
  id v5 = [v4 modelKind];
  id v6 = [v5 identityKind];
  uint64_t v7 = +[MPModelGenreKind identityKind];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    unint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    char v27 = [NSString stringWithUTF8String:"void _MPMLInitPropertyGenreMap()_block_invoke_3"];
    [v26 handleFailureInFunction:v27 file:@"MPMediaLibraryTranslatorSchema.mm" lineNumber:2086 description:@"Must have Genre kind to generate Genre entity query."];
  }
  uint64_t v9 = (std::__shared_weak_count *)a3[1];
  uint64_t v34 = *a3;
  uint64_t v35 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v5 applyToView:&v34 withContext:v4];
  if (v35) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v35);
  }
  uint64_t v10 = [v4 allowedEntityIdentifiers];
  uint64_t v11 = mlcore::GenrePropertyPersistentID(v10);
  _MPMLInsertPredicatesForIdentifierSet(&v36, v10, 0, 0, v11, 0, 0, 0, 0, 0);

  unsigned int v12 = [v4 filterText];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    id v14 = [v4 filterText];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v14 UTF8String]);

    uint64_t v16 = mlcore::GenrePropertyName(v15);
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *,std::string&,void>(&v31, v16, (uint64_t)__p);
    long long v17 = v31;
    long long v31 = 0uLL;
    uint64_t v18 = v37;
    if ((unint64_t)v37 >= v38)
    {
      long long v28 = v17;
      int64_t v20 = (v37 - v36) >> 4;
      if ((unint64_t)(v20 + 1) >> 60) {
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v21 = (uint64_t)(v38 - (void)v36) >> 3;
      if (v21 <= v20 + 1) {
        unint64_t v21 = v20 + 1;
      }
      if (v38 - (unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v22 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v22 = v21;
      }
      v39[4] = (void **)&v38;
      uint64_t v23 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v22);
      uint64_t v24 = &v23[2 * v20];
      v39[0] = v23;
      v39[1] = v24;
      v39[3] = &v23[2 * v25];
      *(_OWORD *)uint64_t v24 = v28;
      v39[2] = v24 + 2;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__swap_out_circular_buffer((uint64_t *)&v36, v39);
      v19 = v37;
      std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)v39);
    }
    else
    {
      *(_OWORD *)unint64_t v37 = v17;
      v19 = v18 + 16;
    }
    unint64_t v37 = v19;
    if (v33 < 0) {
      operator delete(__p[0]);
    }
  }
  memset(v29, 0, sizeof(v29));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v29, v36, v37, (v37 - v36) >> 4);
  mlcore::CreateAndPredicate();
  mlcore::EntityQuery::genresQuery();
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  v39[0] = (void **)v29;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](v39);

  v39[0] = (void **)&v36;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](v39);
}

void sub_1955CD958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, long long a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28)
{
  std::string __p = (void *)(v32 - 128);
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyComposerMapv_block_invoke_7(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "libraryAdded");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  uint64_t v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955CDAFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyComposerMapv_block_invoke_6(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "name");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

void sub_1955CDBDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL28_MPMLInitPropertyComposerMapv_block_invoke_5(void *a1@<X1>, void *a2@<X2>, uint64_t a3@<X3>, _OWORD *a4@<X8>)
{
  id v7 = a2;
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)[v7 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "name");
  char v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v9 = *((void *)v8 + 5);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)v9 + 80))(v9) != 3)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    char v11 = [NSString stringWithUTF8String:"void _MPMLInitPropertyComposerMap()_block_invoke_5"];
    [v10 handleFailureInFunction:v11 file:@"MPMediaLibraryTranslatorSchema.mm" lineNumber:1981 description:@"The base property key for Composer's property[name] is not a string and thus cannot be used to create a SearchPredicate"];
  }
  if (a3 == 1)
  {
    unsigned int v12 = 0;
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *&,std::string&,mediaplatform::UnicodeSearch::MatchType,void>(__p, v9, (uint64_t)v15, &v12);
  }
  else
  {
    if (a3) {
      goto LABEL_11;
    }
    unsigned int v12 = 4;
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *&,std::string&,mediaplatform::UnicodeSearch::MatchType,void>(__p, v9, (uint64_t)v15, &v12);
  }
  *a4 = *(_OWORD *)__p;
LABEL_11:
  if (v16 < 0) {
    operator delete(v15[0]);
  }
}

void sub_1955CDD90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void ___ZL28_MPMLInitPropertyComposerMapv_block_invoke_4(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  std::string::basic_string[abi:ne180100]<0>(v12, "hasName");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)v12))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  mlcore::SortDescriptor::SortDescriptor();
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "nameOrder");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  objc_msgSend(v5, "_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering");
  }
  mlcore::SortDescriptor::SortDescriptor();
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  char v14 = a3;
  char v15 = 0;
  id v6 = (char *)operator new(0x30uLL);
  uint64_t v7 = 0;
  *a3 = v6;
  a3[1] = v6;
  a3[2] = v6 + 48;
  do
  {
    char v8 = &v6[v7];
    uint64_t v9 = *(void *)&v16[v7 + 8];
    *(void *)char v8 = MEMORY[0x1E4F76A98] + 16;
    *((void *)v8 + 1) = v9;
    *((_DWORD *)v8 + 4) = *(_DWORD *)&v16[v7 + 16];
    v7 += 24;
  }
  while (v7 != 48);
  a3[1] = v6 + 48;
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }
}

void sub_1955CDF80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void **a22)
{
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&a22);
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }

  _Unwind_Resume(a1);
}

void ___ZL28_MPMLInitPropertyComposerMapv_block_invoke_3(uint64_t a1, void *a2, uint64_t *a3)
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  BOOL v39 = 0;
  uint64_t v40 = 0;
  unint64_t v41 = 0;
  id v5 = [v4 modelKind];
  id v6 = [v5 identityKind];
  uint64_t v7 = +[MPModelComposerKind identityKind];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    unint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    char v27 = [NSString stringWithUTF8String:"void _MPMLInitPropertyComposerMap()_block_invoke_3"];
    [v26 handleFailureInFunction:v27 file:@"MPMediaLibraryTranslatorSchema.mm" lineNumber:1951 description:@"Must have composer kind to generate composer entity query."];
  }
  uint64_t v9 = (std::__shared_weak_count *)a3[1];
  uint64_t v37 = *a3;
  unint64_t v38 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v5 applyToView:&v37 withContext:v4];
  if (v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v38);
  }
  uint64_t v10 = [v4 allowedEntityIdentifiers];
  uint64_t v11 = mlcore::ComposerPropertyPersistentID(v10);
  _MPMLInsertPredicatesForIdentifierSet(&v39, v10, 0, 0, v11, 0, 0, 0, 0, 0);

  unsigned int v12 = [v4 filterText];
  BOOL v13 = [v12 length] == 0;

  if (!v13)
  {
    id v14 = [v4 filterText];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v14 UTF8String]);

    uint64_t v16 = mlcore::ComposerPropertyName(v15);
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *,std::string&,void>(&v30, v16, (uint64_t)__p);
    long long v47 = v30;
    uint64_t v32 = 0;
    char v33 = 0;
    long long v31 = 0;
    v42 = (char **)&v31;
    LOBYTE(v43) = 0;
    long long v31 = operator new(0x10uLL);
    uint64_t v32 = v31;
    char v33 = v31 + 2;
    uint64_t v32 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::Predicate>>,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate>*>((uint64_t)&v33, &v47, v48, v31);
    mlcore::CreateOrPredicate();
    uint64_t v17 = v40;
    if ((unint64_t)v40 >= v41)
    {
      int64_t v18 = (v40 - v39) >> 4;
      unint64_t v19 = v18 + 1;
      if ((unint64_t)(v18 + 1) >> 60) {
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v20 = v41 - (void)v39;
      if ((uint64_t)(v41 - (void)v39) >> 3 > v19) {
        unint64_t v19 = v20 >> 3;
      }
      if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v21 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v21 = v19;
      }
      unint64_t v46 = &v41;
      unint64_t v22 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v21);
      uint64_t v23 = &v22[2 * v18];
      v42 = (char **)v22;
      uint64_t v43 = v23;
      BOOL v45 = &v22[2 * v24];
      *(_OWORD *)uint64_t v23 = v34;
      long long v34 = 0uLL;
      unint64_t v44 = v23 + 2;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__swap_out_circular_buffer((uint64_t *)&v39, &v42);
      uint64_t v25 = v40;
      std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v42);
      uint64_t v40 = v25;
      if (*((void *)&v34 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v34 + 1));
      }
    }
    else
    {
      *(_OWORD *)uint64_t v40 = v34;
      long long v34 = 0uLL;
      uint64_t v40 = v17 + 16;
    }
    v42 = (char **)&v31;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v42);
    if (*((void *)&v47 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v47 + 1));
    }
    if (v36 < 0) {
      operator delete(__p[0]);
    }
  }
  memset(v28, 0, sizeof(v28));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v28, v39, v40, (v40 - v39) >> 4);
  mlcore::CreateAndPredicate();
  mlcore::EntityQuery::composersQuery();
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }
  v42 = (char **)v28;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v42);

  v42 = &v39;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v42);
}

void sub_1955CE378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,char a33)
{
  std::string __p = &a33;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  _Unwind_Resume(a1);
}

void ___ZL28_MPMLInitPropertyComposerMapv_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = a5;
  uint64_t v9 = [a2 mediaLibrary];
  uint64_t v10 = [v9 uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___ZL28_MPMLInitPropertyComposerMapv_block_invoke_2;
  v11[3] = &__block_descriptor_48_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v11[4] = a3;
  v11[5] = a4;
  [v8 setLibraryIdentifiersWithDatabaseID:v10 block:v11];
}

void sub_1955CE558(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL28_MPMLInitPropertyComposerMapv_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "pid");
  id v5 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v4, (unsigned __int8 *)__p);
  if (!v5) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v6 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v5 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v6, "longLongValue"));

  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955CE628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void *___ZL30_MPMLInitPropertyItemArtistMapv_block_invoke_11()
{
  return &unk_1EE6ED3B8;
}

void *___ZL30_MPMLInitPropertyItemArtistMapv_block_invoke_10()
{
  return &unk_1EE6ED3B8;
}

void *___ZL30_MPMLInitPropertyItemArtistMapv_block_invoke_9()
{
  return &unk_1EE6ED3B8;
}

void *___ZL30_MPMLInitPropertyItemArtistMapv_block_invoke_8()
{
  return &unk_1EE6ED3B8;
}

id ___ZL30_MPMLInitPropertyItemArtistMapv_block_invoke_7(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "artistPID");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  uint64_t v9 = [v8 longLongValue];

  if (v20 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "artistAvailableArtworkToken");
  uint64_t v10 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v10) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v11 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v10 + 5), a4);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "artistFetchableArtworkToken");
  unsigned int v12 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v12) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  BOOL v13 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v12 + 5), a4);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "artistFetchableArtworkSourceType");
  id v14 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v14) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v15 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v14 + 5), a4);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v16 = [v6 mediaLibrary];
  uint64_t v17 = _MPMLTranslatorCreateArtworkCatalogBlock(v9, 0, 7, 4, v11, v13, v15, v16);

  return v17;
}

void sub_1955CE894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  char v20 = v17;

  _Unwind_Resume(a1);
}

void ___ZL30_MPMLInitPropertyItemArtistMapv_block_invoke_5(void *a1@<X1>, void *a2@<X2>, uint64_t a3@<X3>, _OWORD *a4@<X8>)
{
  id v7 = a2;
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)[v7 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "name");
  char v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v9 = *((void *)v8 + 5);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)v9 + 80))(v9) != 3)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"void _MPMLInitPropertyItemArtistMap()_block_invoke_5"];
    [v10 handleFailureInFunction:v11 file:@"MPMediaLibraryTranslatorSchema.mm" lineNumber:1883 description:@"The base property key for Artist's property[name] is not a string and thus cannot be used to create a SearchPredicate"];
  }
  if (a3 == 1)
  {
    unsigned int v12 = 0;
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *&,std::string&,mediaplatform::UnicodeSearch::MatchType,void>(__p, v9, (uint64_t)v15, &v12);
  }
  else
  {
    if (a3) {
      goto LABEL_11;
    }
    unsigned int v12 = 4;
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *&,std::string&,mediaplatform::UnicodeSearch::MatchType,void>(__p, v9, (uint64_t)v15, &v12);
  }
  *a4 = *(_OWORD *)__p;
LABEL_11:
  if (v16 < 0) {
    operator delete(v15[0]);
  }
}

void sub_1955CEAC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void ___ZL30_MPMLInitPropertyItemArtistMapv_block_invoke_4(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  std::string::basic_string[abi:ne180100]<0>(v12, "hasName");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)v12))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  mlcore::SortDescriptor::SortDescriptor();
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "nameOrder");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  objc_msgSend(v5, "_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering");
  }
  mlcore::SortDescriptor::SortDescriptor();
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  char v14 = a3;
  char v15 = 0;
  id v6 = (char *)operator new(0x30uLL);
  uint64_t v7 = 0;
  *a3 = v6;
  a3[1] = v6;
  a3[2] = v6 + 48;
  do
  {
    char v8 = &v6[v7];
    uint64_t v9 = *(void *)&v16[v7 + 8];
    *(void *)char v8 = MEMORY[0x1E4F76A98] + 16;
    *((void *)v8 + 1) = v9;
    *((_DWORD *)v8 + 4) = *(_DWORD *)&v16[v7 + 16];
    v7 += 24;
  }
  while (v7 != 48);
  a3[1] = v6 + 48;
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }
}

void sub_1955CECB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void **a22)
{
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&a22);
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }

  _Unwind_Resume(a1);
}

id ___ZL26_MPMLInitPropertyArtistMapv_block_invoke_15(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "likedState");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  int v9 = [v8 intValue];

  if (v18 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "libraryItemCount");
  uint64_t v10 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v10) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v11 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v10 + 5), a4);
  uint64_t v12 = [v11 longLongValue];

  if (v18 < 0) {
    operator delete(__p[0]);
  }
  BOOL v14 = v9 == 2 || v12 > 0;
  char v15 = [NSNumber numberWithBool:v14];

  return v15;
}

void sub_1955CEE48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL26_MPMLInitPropertyArtistMapv_block_invoke_14(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "likedStateChangedDate");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  int v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955CEF58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL26_MPMLInitPropertyArtistMapv_block_invoke_13(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "likedState");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  int v9 = [v8 intValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v10 = [NSNumber numberWithBool:v9 == 3];

  return v10;
}

void sub_1955CF060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL26_MPMLInitPropertyArtistMapv_block_invoke_12(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "likedState");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  int v9 = [v8 intValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v10 = [NSNumber numberWithBool:v9 == 2];

  return v10;
}

void sub_1955CF168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL26_MPMLInitPropertyArtistMapv_block_invoke_11(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "libraryAdded");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  int v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955CF264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL26_MPMLInitPropertyArtistMapv_block_invoke_10(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "artistPID");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  uint64_t v9 = [v8 longLongValue];

  if (v20 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "artistAvailableArtworkToken");
  uint64_t v10 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v10) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v11 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v10 + 5), a4);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "artistFetchableArtworkToken");
  uint64_t v12 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v12) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v13 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v12 + 5), a4);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "artistFetchableArtworkSourceType");
  BOOL v14 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v14) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v15 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v14 + 5), a4);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  char v16 = [v6 mediaLibrary];
  uint64_t v17 = _MPMLTranslatorCreateArtworkCatalogBlock(v9, 0, 7, 4, v11, v13, v15, v16);

  return v17;
}

void sub_1955CF4A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  char v20 = v17;

  _Unwind_Resume(a1);
}

void ___ZL26_MPMLInitPropertyArtistMapv_block_invoke_8(void *a1@<X1>, void *a2@<X2>, uint64_t a3@<X3>, _OWORD *a4@<X8>)
{
  id v7 = a2;
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)[v7 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "name");
  char v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v9 = *((void *)v8 + 5);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)v9 + 80))(v9) != 3)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    char v11 = [NSString stringWithUTF8String:"void _MPMLInitPropertyArtistMap()_block_invoke_8"];
    [v10 handleFailureInFunction:v11 file:@"MPMediaLibraryTranslatorSchema.mm" lineNumber:1774 description:@"The base property key for Artist's property[name] is not a string and thus cannot be used to create a SearchPredicate"];
  }
  if (a3 == 1)
  {
    unsigned int v12 = 0;
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *&,std::string&,mediaplatform::UnicodeSearch::MatchType,void>(__p, v9, (uint64_t)v15, &v12);
  }
  else
  {
    if (a3) {
      goto LABEL_11;
    }
    unsigned int v12 = 4;
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *&,std::string&,mediaplatform::UnicodeSearch::MatchType,void>(__p, v9, (uint64_t)v15, &v12);
  }
  *a4 = *(_OWORD *)__p;
LABEL_11:
  if (v16 < 0) {
    operator delete(v15[0]);
  }
}

void sub_1955CF6CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void ___ZL26_MPMLInitPropertyArtistMapv_block_invoke_7(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  std::string::basic_string[abi:ne180100]<0>(v12, "hasName");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)v12))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  mlcore::SortDescriptor::SortDescriptor();
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "nameOrder");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  objc_msgSend(v5, "_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering");
  }
  mlcore::SortDescriptor::SortDescriptor();
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  char v14 = a3;
  char v15 = 0;
  id v6 = (char *)operator new(0x30uLL);
  uint64_t v7 = 0;
  *a3 = v6;
  a3[1] = v6;
  a3[2] = v6 + 48;
  do
  {
    char v8 = &v6[v7];
    uint64_t v9 = *(void *)&v16[v7 + 8];
    *(void *)char v8 = MEMORY[0x1E4F76A98] + 16;
    *((void *)v8 + 1) = v9;
    *((_DWORD *)v8 + 4) = *(_DWORD *)&v16[v7 + 16];
    v7 += 24;
  }
  while (v7 != 48);
  a3[1] = v6 + 48;
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }
}

void sub_1955CF8BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void **a22)
{
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&a22);
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }

  _Unwind_Resume(a1);
}

void ___ZL26_MPMLInitPropertyArtistMapv_block_invoke_6(void *a1@<X1>, void *a2@<X8>)
{
  id v5 = a1;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  id v3 = (mlcore *)mlcore::ArtistPropertyStoreID(v5);
  uint64_t v4 = mlcore::ArtistPropertyPersistentID(v3);
  _MPMLInsertPredicatesForIdentifierSet(a2, v5, (uint64_t)v3, 0, v4, 0, 0, 0, 0, 0);
}

void sub_1955CF998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, uint64_t a12)
{
  _Unwind_Resume(a1);
}

void ___ZL26_MPMLInitPropertyArtistMapv_block_invoke_5(uint64_t a1, void *a2, uint64_t *a3)
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  BOOL v39 = 0;
  uint64_t v40 = 0;
  unint64_t v41 = 0;
  id v5 = [v4 modelKind];
  id v6 = [v5 identityKind];
  uint64_t v7 = +[MPModelArtistKind identityKind];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    unint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    char v27 = [NSString stringWithUTF8String:"void _MPMLInitPropertyArtistMap()_block_invoke_5"];
    [v26 handleFailureInFunction:v27 file:@"MPMediaLibraryTranslatorSchema.mm" lineNumber:1737 description:@"Must have artist kind to generate artist entity query."];
  }
  uint64_t v9 = (std::__shared_weak_count *)a3[1];
  uint64_t v37 = *a3;
  unint64_t v38 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v5 applyToView:&v37 withContext:v4];
  if (v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v38);
  }
  uint64_t v10 = [v4 allowedEntityIdentifiers];
  uint64_t v11 = mlcore::ArtistPropertyStoreID(v10);
  uint64_t v12 = mlcore::ArtistPropertyPersistentID((mlcore *)v11);
  _MPMLInsertPredicatesForIdentifierSet(&v39, v10, v11, 0, v12, 0, 0, 0, 0, 0);

  char v13 = [v4 filterText];
  LOBYTE(v11) = [v13 length] == 0;

  if ((v11 & 1) == 0)
  {
    id v14 = [v4 filterText];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v14 UTF8String]);

    uint64_t v16 = mlcore::ArtistPropertyName(v15);
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *,std::string&,void>(&v30, v16, (uint64_t)__p);
    long long v47 = v30;
    uint64_t v32 = 0;
    char v33 = 0;
    long long v31 = 0;
    v42 = (char **)&v31;
    LOBYTE(v43) = 0;
    long long v31 = operator new(0x10uLL);
    uint64_t v32 = v31;
    char v33 = v31 + 2;
    uint64_t v32 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::Predicate>>,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate>*>((uint64_t)&v33, &v47, v48, v31);
    mlcore::CreateOrPredicate();
    uint64_t v17 = v40;
    if ((unint64_t)v40 >= v41)
    {
      int64_t v18 = (v40 - v39) >> 4;
      unint64_t v19 = v18 + 1;
      if ((unint64_t)(v18 + 1) >> 60) {
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v20 = v41 - (void)v39;
      if ((uint64_t)(v41 - (void)v39) >> 3 > v19) {
        unint64_t v19 = v20 >> 3;
      }
      if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v21 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v21 = v19;
      }
      unint64_t v46 = &v41;
      unint64_t v22 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v21);
      uint64_t v23 = &v22[2 * v18];
      v42 = (char **)v22;
      uint64_t v43 = v23;
      BOOL v45 = &v22[2 * v24];
      *(_OWORD *)uint64_t v23 = v34;
      long long v34 = 0uLL;
      unint64_t v44 = v23 + 2;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__swap_out_circular_buffer((uint64_t *)&v39, &v42);
      uint64_t v25 = v40;
      std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v42);
      uint64_t v40 = v25;
      if (*((void *)&v34 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v34 + 1));
      }
    }
    else
    {
      *(_OWORD *)uint64_t v40 = v34;
      long long v34 = 0uLL;
      uint64_t v40 = v17 + 16;
    }
    v42 = (char **)&v31;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v42);
    if (*((void *)&v47 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v47 + 1));
    }
    if (v36 < 0) {
      operator delete(__p[0]);
    }
  }
  memset(v28, 0, sizeof(v28));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v28, v39, v40, (v40 - v39) >> 4);
  mlcore::CreateAndPredicate();
  mlcore::EntityQuery::artistsQuery();
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }
  v42 = (char **)v28;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v42);

  v42 = &v39;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v42);
}

void sub_1955CFD5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,char a33)
{
  std::string __p = &a33;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  _Unwind_Resume(a1);
}

void *___ZL27_MPMLInitPropertyCuratorMapv_block_invoke_6()
{
  return &unk_1EE6ED3B8;
}

void *___ZL27_MPMLInitPropertyCuratorMapv_block_invoke_5()
{
  return &unk_1EE6ED3B8;
}

id ___ZL27_MPMLInitPropertyCuratorMapv_block_invoke_4(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "name");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  if (![v8 length])
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "externalVendorName");
    uint64_t v9 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
    if (!v9) {
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
    uint64_t v10 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v9 + 5), a4);

    if (v13 < 0) {
      operator delete(__p[0]);
    }
    char v8 = (void *)v10;
  }

  return v8;
}

void sub_1955CFF9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL27_MPMLInitPropertyCuratorMapv_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  uint64_t v10 = [v8 mediaLibrary];
  uint64_t v11 = [v10 uniqueIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___ZL27_MPMLInitPropertyCuratorMapv_block_invoke_2;
  v13[3] = &__block_descriptor_48_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v13[4] = a3;
  v13[5] = a4;
  [v9 setLibraryIdentifiersWithDatabaseID:v11 block:v13];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___ZL27_MPMLInitPropertyCuratorMapv_block_invoke_3;
  v12[3] = &__block_descriptor_48_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v12[4] = a3;
  v12[5] = a4;
  [v9 setUniversalStoreIdentifiersWithBlock:v12];
}

void sub_1955D0114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL27_MPMLInitPropertyCuratorMapv_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "pid");
  id v5 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v4, (unsigned __int8 *)__p);
  if (!v5) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v6 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v5 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setPersistentID:", -objc_msgSend(v6, "longLongValue"));

  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955D01E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL27_MPMLInitPropertyCuratorMapv_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "storeID");
  id v5 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v4, (unsigned __int8 *)__p);
  if (!v5) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v6 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v5 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v6, "longLongValue"));

  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955D02C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_29(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "collaborationInvitationURLExpirationDate");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  id v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955D03C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_28(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "invitationURL");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if ([v8 length])
  {
    id v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void sub_1955D04D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_27(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "favoriteSongsPlaylist");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  int v9 = [v8 intValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v10 = [NSNumber numberWithBool:v9 == 1];

  return v10;
}

void sub_1955D05D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_26(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "likedStateChangedDate");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  int v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955D06D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_25(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "likedState");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  int v9 = [v8 intValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v10 = [NSNumber numberWithBool:v9 == 3];

  return v10;
}

void sub_1955D07DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_24(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "likedState");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  int v9 = [v8 intValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v10 = [NSNumber numberWithBool:v9 == 2];

  return v10;
}

void sub_1955D08E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_23(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "traits");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  char v9 = [v8 intValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:(v9 & 1) << 8];

  return v10;
}

void sub_1955D09E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_22(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  uint64_t v7 = NSNumber;
  std::string::basic_string[abi:ne180100]<0>(__p, "keepLocalConstraints");
  char v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v9 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v8 + 5), a4);
  uint64_t v10 = objc_msgSend(v7, "numberWithUnsignedInteger:", (int)objc_msgSend(v9, "intValue"));

  if (v13 < 0) {
    operator delete(__p[0]);
  }

  return v10;
}

void sub_1955D0AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_21(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  uint64_t v7 = NSNumber;
  std::string::basic_string[abi:ne180100]<0>(__p, "keepLocalStatusReason");
  char v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v9 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v8 + 5), a4);
  uint64_t v10 = objc_msgSend(v7, "numberWithUnsignedInteger:", (int)objc_msgSend(v9, "intValue"));

  if (v13 < 0) {
    operator delete(__p[0]);
  }

  return v10;
}

void sub_1955D0BEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_20(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  uint64_t v7 = NSNumber;
  std::string::basic_string[abi:ne180100]<0>(__p, "keepLocalStatus");
  char v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v9 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v8 + 5), a4);
  uint64_t v10 = [v9 intValue] + 1;
  if (v10 >= 7) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10 - 1;
  }
  char v12 = [v7 numberWithInteger:v11];

  if (v15 < 0) {
    operator delete(__p[0]);
  }

  return v12;
}

void sub_1955D0CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_19(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  uint64_t v7 = NSNumber;
  std::string::basic_string[abi:ne180100]<0>(__p, "keepLocal");
  char v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v9 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v8 + 5), a4);
  unsigned int v10 = [v9 intValue] + 2;
  if (v10 > 4) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = qword_19568CFD8[v10];
  }
  char v12 = [v7 numberWithInteger:v11];

  if (v15 < 0) {
    operator delete(__p[0]);
  }

  return v12;
}

void sub_1955D0E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_18(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v50 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "isSmart");
  id v6 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v6) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v7 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v6 + 5), a4);
  int v8 = [v7 BOOLValue];

  if (v52 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "isGenius");
  char v9 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v9) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  unsigned int v10 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v9 + 5), a4);
  int v49 = [v10 BOOLValue];

  if (v52 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "isFolder");
  uint64_t v11 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v11) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v12 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v11 + 5), a4);
  int v48 = [v12 BOOLValue];

  if (v52 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "shouldDisplayIndex");
  char v13 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v13) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v14 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v13 + 5), a4);
  int v47 = [v14 BOOLValue];

  if (v52 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "isPersonalMix");
  char v15 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v15) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v16 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v15 + 5), a4);
  int v17 = [v16 BOOLValue];

  if (v52 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "isFavoriteSongsPlaylist");
  int64_t v18 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v18) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  unint64_t v19 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v18 + 5), a4);
  int v20 = [v19 BOOLValue];

  if (v52 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "isExternalVendorPlaylist");
  unint64_t v21 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v21) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  unint64_t v22 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v21 + 5), a4);
  char v23 = [v22 BOOLValue];

  if (v52 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "isOwner");
  uint64_t v24 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v24) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v25 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v24 + 5), a4);
  int v26 = [v25 BOOLValue];

  if (v52 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "isPublic");
  char v27 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v27) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  long long v28 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v27 + 5), a4);
  int v29 = [v28 BOOLValue];

  if (v52 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "isEditorial");
  long long v30 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v30) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  long long v31 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v30 + 5), a4);
  int v32 = [v31 BOOLValue];

  if (v52 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "isUserShared");
  char v33 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v33) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  long long v34 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v33 + 5), a4);
  int v35 = [v34 BOOLValue];

  if (v52 < 0) {
    operator delete(__p[0]);
  }
  int v36 = v48 | v49 | v20;
  uint64_t v37 = 9;
  if (v49) {
    uint64_t v37 = 2;
  }
  if (v48) {
    uint64_t v37 = 3;
  }
  int v38 = v36 | v8 | v47;
  uint64_t v39 = 8;
  if (v8) {
    uint64_t v39 = 1;
  }
  if (v36) {
    uint64_t v40 = v37;
  }
  else {
    uint64_t v40 = v39;
  }
  char v41 = v38 | v17 | v23;
  uint64_t v42 = 5;
  if (v17) {
    uint64_t v42 = 7;
  }
  if (!v38) {
    uint64_t v40 = v42;
  }
  uint64_t v43 = 6;
  if (!(v35 | v26 & v29)) {
    uint64_t v43 = 0;
  }
  if (v32) {
    uint64_t v43 = 4;
  }
  if (v41) {
    uint64_t v44 = v40;
  }
  else {
    uint64_t v44 = v43;
  }
  BOOL v45 = [NSNumber numberWithInteger:v44];

  return v45;
}

void sub_1955D1380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_17()
{
  return MEMORY[0x1E4F1CC28];
}

uint64_t ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_16()
{
  return MEMORY[0x1E4F1CC38];
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_15(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "datePlayedLocal");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  char v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  unsigned int v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955D1528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_14(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "dateModified");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  uint64_t v9 = [v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  unsigned int v10 = _MPMLDateComponentsFromStoredInt64(v9);

  return v10;
}

void sub_1955D1624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_13(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "downloadedDate");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  uint64_t v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  unsigned int v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955D1720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_12(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "libraryAdded");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  uint64_t v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  unsigned int v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955D181C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_11(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  uint64_t v7 = NSNumber;
  std::string::basic_string[abi:ne180100]<0>(__p, "isHidden");
  int v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v9 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v8 + 5), a4);
  unsigned int v10 = objc_msgSend(v7, "numberWithBool:", objc_msgSend(v9, "BOOLValue") ^ 1);

  if (v13 < 0) {
    operator delete(__p[0]);
  }

  return v10;
}

void sub_1955D1920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_10_416()
{
  return 0;
}

uint64_t ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_9_413()
{
  return 0;
}

uint64_t ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_8_410()
{
  return 0;
}

uint64_t ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_7_407()
{
  return 0;
}

uint64_t ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_6_404()
{
  return 0;
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_4_399(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 mediaLibrary];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_5_402;
  v7[3] = &unk_1E57F7CE8;
  id v8 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x19971E0F0](v7);

  return v5;
}

void sub_1955D1A38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_5_402(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [a2 identifiers];
  id v8 = [v7 library];
  uint64_t v9 = objc_msgSend(v6, "playlistWithPersistentID:", objc_msgSend(v8, "persistentID"));

  unsigned int v10 = [v9 tiledArtworkCatalogWithRows:a3 columns:a4];

  return v10;
}

void sub_1955D1AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_3_396(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "playlistPID");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  uint64_t v9 = [v8 longLongValue];

  if (v20 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "availableArtworkToken");
  unsigned int v10 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v10) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v11 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v10 + 5), a4);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "fetchableArtworkToken");
  char v12 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v12) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v13 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v12 + 5), a4);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "fetchableArtworkSourceType");
  id v14 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v14) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v15 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v14 + 5), a4);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v16 = [v6 mediaLibrary];
  int v17 = _MPMLTranslatorCreateArtworkCatalogBlock(v9, 1, 1, 5, v11, v13, v15, v16);

  return v17;
}

void sub_1955D1D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  char v20 = v17;

  _Unwind_Resume(a1);
}

uint64_t ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_2_392()
{
  return 0;
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_388(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "shareURL");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if ([v8 length])
  {
    uint64_t v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void sub_1955D1E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_10(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 mediaLibrary];
  char v8 = [v7 isHomeSharingLibrary];

  if (v8)
  {
    uint64_t v9 = &unk_1EE6ED3B8;
    goto LABEL_45;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "isFavoriteSongsPlaylist");
  unsigned int v10 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v10) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v11 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v10 + 5), a4);
  char v12 = [v11 BOOLValue];

  if (v38 < 0)
  {
    operator delete(__p[0]);
    if (v12) {
      goto LABEL_6;
    }
LABEL_8:
    std::string::basic_string[abi:ne180100]<0>(__p, "isSmart");
    id v14 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
    if (!v14) {
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
    char v15 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v14 + 5), a4);
    if ([v15 BOOLValue])
    {
      char v16 = 1;
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(v35, "isGenius");
      int v17 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)v35);
      if (!v17) {
        std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      }
      int64_t v18 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v17 + 5), a4);
      char v16 = [v18 BOOLValue];

      if (v36 < 0) {
        operator delete(v35[0]);
      }
    }

    if (v38 < 0)
    {
      operator delete(__p[0]);
      if (v16) {
        goto LABEL_16;
      }
    }
    else if (v16)
    {
LABEL_16:
      uint64_t v13 = 2;
      goto LABEL_44;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "isSubscribed");
    unint64_t v19 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
    if (!v19) {
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
    char v20 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v19 + 5), a4);
    int v21 = [v20 BOOLValue];

    if (v38 < 0) {
      operator delete(__p[0]);
    }
    if (v21) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = 2;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "isOwner");
    char v23 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
    if (!v23) {
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
    uint64_t v24 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v23 + 5), a4);
    if ([v24 BOOLValue])
    {
      std::string::basic_string[abi:ne180100]<0>(v35, "isCollaborative");
      uint64_t v25 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)v35);
      if (!v25) {
        std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      }
      int v26 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v25 + 5), a4);
      int v27 = [v26 BOOLValue];

      if (v36 < 0) {
        operator delete(v35[0]);
      }
    }
    else
    {
      int v27 = 0;
    }

    if (v38 < 0) {
      operator delete(__p[0]);
    }
    if (v27) {
      uint64_t v28 = 2;
    }
    else {
      uint64_t v28 = v22;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "isTracklistUserEditable");
    int v29 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
    if (!v29) {
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
    long long v30 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v29 + 5), a4);
    if ([v30 BOOLValue])
    {
      std::string::basic_string[abi:ne180100]<0>(v35, "isFolder");
      long long v31 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)v35);
      if (!v31) {
        std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      }
      int v32 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v31 + 5), a4);
      uint64_t v33 = [v32 BOOLValue] ^ 1;

      if (v36 < 0) {
        operator delete(v35[0]);
      }
    }
    else
    {
      uint64_t v33 = 0;
    }

    if (v38 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v13 = v33 | v28;
    goto LABEL_44;
  }
  if ((v12 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v13 = 0;
LABEL_44:
  uint64_t v9 = [NSNumber numberWithInteger:v13];
LABEL_45:

  return v9;
}

void sub_1955D22C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }

  if (a20 < 0) {
    operator delete(a15);
  }

  _Unwind_Resume(a1);
}

id ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_9(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "name");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

void sub_1955D2428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_8(void *a1@<X1>, void *a2@<X2>, uint64_t a3@<X3>, _OWORD *a4@<X8>)
{
  id v7 = a2;
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)[v7 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "name");
  char v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v9 = *((void *)v8 + 5);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)v9 + 80))(v9) != 3)
  {
    unsigned int v10 = [MEMORY[0x1E4F28B00] currentHandler];
    char v11 = [NSString stringWithUTF8String:"void _MPMLInitPropertyPlaylistMap()_block_invoke_8"];
    [v10 handleFailureInFunction:v11 file:@"MPMediaLibraryTranslatorSchema.mm" lineNumber:1353 description:@"The base property key for Playlist's property[name] is not a string and thus cannot be used to create a SearchPredicate"];
  }
  if (a3 == 1)
  {
    unsigned int v12 = 0;
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *&,std::string&,mediaplatform::UnicodeSearch::MatchType,void>(__p, v9, (uint64_t)v15, &v12);
  }
  else
  {
    if (a3) {
      goto LABEL_11;
    }
    unsigned int v12 = 4;
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *&,std::string&,mediaplatform::UnicodeSearch::MatchType,void>(__p, v9, (uint64_t)v15, &v12);
  }
  *a4 = *(_OWORD *)__p;
LABEL_11:
  if (v16 < 0) {
    operator delete(v15[0]);
  }
}

void sub_1955D25DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_7(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "nameOrder");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  objc_msgSend(v5, "_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering");
  }
  mlcore::SortDescriptor::SortDescriptor();
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  unsigned int v10 = a3;
  char v11 = 0;
  id v6 = operator new(0x18uLL);
  a3[2] = v6 + 3;
  uint64_t v7 = v12;
  void *v6 = MEMORY[0x1E4F76A98] + 16;
  v6[1] = v7;
  *((_DWORD *)v6 + 4) = v13;
  *a3 = v6;
  a3[1] = v6 + 3;
  if (v9 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955D2754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void **a16)
{
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&a16);
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_6(void *a1@<X1>, void *a2@<X8>)
{
  char v8 = a1;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  id v3 = (mlcore *)mlcore::PlaylistPropertyPersistentID(v8);
  id v4 = (mlcore *)mlcore::PlaylistPropertyStoreCloudID(v3);
  id v5 = (mlcore *)mlcore::PlaylistPropertyCloudGlobalID(v4);
  id v6 = (mlcore *)mlcore::PlaylistPropertySyncID(v5);
  uint64_t v7 = mlcore::PlaylistPropertyCloudUniversalLibraryID(v6);
  _MPMLInsertPredicatesForIdentifierSet(a2, v8, 0, 0, (uint64_t)v3, (uint64_t)v4, (uint64_t)v5, (uint64_t)v6, v7, 0);
}

void sub_1955D283C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, uint64_t a12)
{
  _Unwind_Resume(a1);
}

void ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_5(uint64_t a1, void *a2, uint64_t *a3)
{
  v102[1] = *MEMORY[0x1E4F143B8];
  uint64_t v89 = 0;
  v90 = 0;
  unint64_t v91 = 0;
  id v68 = a2;
  BOOL v65 = [v68 modelKind];
  id v4 = [v65 identityKind];
  id v5 = +[MPModelPlaylistKind identityKind];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    v62 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v63 = [NSString stringWithUTF8String:"void _MPMLInitPropertyPlaylistMap()_block_invoke_5"];
    [v62 handleFailureInFunction:v63 file:@"MPMediaLibraryTranslatorSchema.mm" lineNumber:1265 description:@"Must have playlist kind to generate playlist entity query."];
  }
  id v7 = v65;
  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if (([v8 variants] & 2) != 0 && (objc_msgSend(v8, "variants") & 0x80) == 0)
    {
      char v9 = (void *)MEMORY[0x1E4F77950];
      uint64_t v100 = @"playlistKind";
      unsigned int v10 = [v8 description];
      unint64_t v101 = v10;
      uint64_t v66 = v8;
      char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
      v102[0] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:1];
      [v9 snapshotWithDomain:*MEMORY[0x1E4F778C8] type:@"Bug" subType:@"MPModelLibraryRequestWithSmartPlaylistAndNoFavoriteSongs" context:@"-[MPModelLibraryRequest] Requesting playlist from an MPModelLibraryRequest with smart playlists but not the favorite songs playlist" triggerThresholdValues:0 events:v12 completion:0];

      uint64_t v13 = [v8 variants];
      uint64_t v14 = [v8 playlistEntryKind];
      char v15 = +[MPModelPlaylist kindWithVariants:playlistEntryKind:options:](MPModelPlaylist, "kindWithVariants:playlistEntryKind:options:", v13 | 0x80, v14, [v8 options]);

      id v8 = v15;
    }
  }
  char v16 = (std::__shared_weak_count *)a3[1];
  uint64_t v87 = *a3;
  uint64_t v88 = v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v67 = v8;
  [v8 applyToView:&v87 withContext:v68];
  if (v88) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v88);
  }
  int v17 = [v68 allowedEntityIdentifiers];
  int64_t v18 = (mlcore *)mlcore::PlaylistPropertyPersistentID(v17);
  unint64_t v19 = (mlcore *)mlcore::PlaylistPropertyStoreCloudID(v18);
  char v20 = (mlcore *)mlcore::PlaylistPropertyCloudGlobalID(v19);
  int v21 = (mlcore *)mlcore::PlaylistPropertySyncID(v20);
  uint64_t v22 = mlcore::PlaylistPropertyCloudUniversalLibraryID(v21);
  _MPMLInsertPredicatesForIdentifierSet(&v89, v17, 0, 0, (uint64_t)v18, (uint64_t)v19, (uint64_t)v20, (uint64_t)v21, v22, 0);

  char v23 = [v68 filterText];
  BOOL v24 = [v23 length] == 0;

  if (!v24)
  {
    id v25 = [v68 filterText];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v25 UTF8String]);

    uint64_t v27 = mlcore::PlaylistPropertyName(v26);
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *,std::string&,void>(&v80, v27, (uint64_t)__p);
    v98[0] = v80;
    uint64_t v29 = mlcore::PlaylistPropertyCloudAuthorName(v28);
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *,std::string&,void>(&v79, v29, (uint64_t)__p);
    v98[1] = v79;
    long long v79 = 0uLL;
    uint64_t v82 = 0;
    long long v83 = 0;
    unint64_t v81 = 0;
    v92 = (char **)&v81;
    LOBYTE(v93) = 0;
    unint64_t v81 = operator new(0x20uLL);
    uint64_t v82 = v81;
    long long v83 = v81 + 4;
    uint64_t v82 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::Predicate>>,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate>*>((uint64_t)&v83, v98, &v99, v81);
    mlcore::CreateOrPredicate();
    long long v30 = v90;
    if ((unint64_t)v90 >= v91)
    {
      int64_t v31 = (v90 - v89) >> 4;
      unint64_t v32 = v31 + 1;
      if ((unint64_t)(v31 + 1) >> 60) {
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v33 = v91 - (void)v89;
      if ((uint64_t)(v91 - (void)v89) >> 3 > v32) {
        unint64_t v32 = v33 >> 3;
      }
      if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v34 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v34 = v32;
      }
      uint64_t v96 = &v91;
      int v35 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v34);
      char v36 = (std::__shared_weak_count *)&v35[2 * v31];
      v92 = (char **)v35;
      BOOL v93 = v36;
      uint64_t v95 = &v35[2 * v37];
      v36->std::__shared_count = v84;
      std::__shared_count v84 = (std::__shared_count)0;
      p_shared_weak_owners = &v36->__shared_weak_owners_;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__swap_out_circular_buffer((uint64_t *)&v89, &v92);
      char v38 = v90;
      std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v92);
      v90 = v38;
      if (v84.__shared_owners_) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v84.__shared_owners_);
      }
    }
    else
    {
      *(std::__shared_count *)v90 = v84;
      std::__shared_count v84 = (std::__shared_count)0;
      v90 = v30 + 16;
    }
    v92 = (char **)&v81;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v92);
    for (uint64_t i = 24; i != -8; i -= 16)
    {
      uint64_t v40 = *(std::__shared_weak_count **)((char *)v98 + i);
      if (v40) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v40);
      }
    }
    if (v86 < 0) {
      operator delete(__p[0]);
    }
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  char v41 = [v68 scopedContainers];
  uint64_t v42 = [v41 reverseObjectEnumerator];

  uint64_t v43 = [v42 countByEnumeratingWithState:&v75 objects:v97 count:16];
  if (!v43)
  {

    id v45 = 0;
    goto LABEL_59;
  }
  id v64 = v7;
  id v44 = 0;
  id v45 = 0;
  uint64_t v46 = *(void *)v76;
  do
  {
    for (uint64_t j = 0; j != v43; ++j)
    {
      if (*(void *)v76 != v46) {
        objc_enumerationMutation(v42);
      }
      int v48 = *(void **)(*((void *)&v75 + 1) + 8 * j);
      if (v44)
      {
        if (v45) {
          continue;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v44 = v48;
          if (v45) {
            continue;
          }
        }
        else
        {
          id v44 = 0;
          if (v45) {
            continue;
          }
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v45 = v48;
      }
      else {
        id v45 = 0;
      }
    }
    uint64_t v43 = [v42 countByEnumeratingWithState:&v75 objects:v97 count:16];
  }
  while (v43);

  id v7 = v64;
  if (v45)
  {
    __p[0] = 0;
    int v49 = [v45 identifiers];
    id v50 = [v49 universalStore];
    uint64_t v51 = (void *)[v50 adamID];

    __p[0] = v51;
    if (v51)
    {
      mlcore::PlaylistPropertyCloudAuthorStoreID(v52);
      std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>();
    }
  }
  if (v44)
  {
    unint64_t v53 = [v44 identifiers];
    int64_t v54 = [v53 library];
    [v54 persistentID];

    std::allocate_shared[abi:ne180100]<mlcore::Playlist,std::allocator<mlcore::Playlist>,long long &,void>((uint64_t *)&v92);
    unint64_t v55 = v93;
    uint64_t v73 = (void **)v92;
    uint64_t v74 = v93;
    if (v93) {
      atomic_fetch_add_explicit(&v93->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    memset(v71, 0, sizeof(v71));
    std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v71, v89, v90, (v90 - v89) >> 4);
    mlcore::CreateAndPredicate();
    mlcore::EntityQuery::playlistsForFolderQuery();
    if (v72) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v72);
    }
    *(void *)&v98[0] = v71;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)v98);
    if (v74) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v74);
    }
    if (v55) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v55);
    }
    goto LABEL_70;
  }
LABEL_59:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v56 = v7;
  }
  else {
    uint64_t v56 = 0;
  }
  id v57 = v56;
  uint64_t v58 = (mlcore *)[v57 variants];
  if ((v58 & 8) == 0)
  {
    mlcore::PlaylistPropertySmartIsFolder(v58);
    std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>();
  }
  v59 = [v68 allowedEntityIdentifiers];
  BOOL v60 = [v59 count] == 0;

  if (v60)
  {
    mlcore::PlaylistPropertyParentPersistentID(v61);
    __p[0] = 0;
    std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>();
  }
  memset(v69, 0, sizeof(v69));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v69, v89, v90, (v90 - v89) >> 4);
  mlcore::CreateAndPredicate();
  mlcore::EntityQuery::playlistsQuery();
  if (v70) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v70);
  }
  v92 = (char **)v69;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v92);

  id v44 = 0;
LABEL_70:

  v92 = &v89;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v92);
}

void sub_1955D3280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, long long a11, long long a12, uint64_t a13, void *a14, uint64_t a15, void *a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,void *__p,uint64_t a48,int a49,__int16 a50,char a51,char a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59)
{
  *(void *)(v61 - 160) = &a55;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v61 - 160));

  _Unwind_Resume(a1);
}

void ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke(uint64_t a1, void *a2, void *a3, int8x8_t *a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  unsigned int v10 = [v8 mediaLibrary];
  char v11 = [v10 uniqueIdentifier];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_2;
  void v29[3] = &__block_descriptor_48_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v29[4] = a3;
  v29[5] = a4;
  [v9 setLibraryIdentifiersWithDatabaseID:v11 block:v29];

  uint64_t v12 = [v8 personID];
  if ([v12 length])
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_3;
    void v28[3] = &__block_descriptor_48_e45_v16__0___MPMutablePersonalStoreIdentifiers__8l;
    v28[4] = a3;
    v28[5] = a4;
    [v9 setPersonalStoreIdentifiersWithPersonID:v12 block:v28];
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_4;
  v27[3] = &__block_descriptor_48_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v27[4] = a3;
  v27[5] = a4;
  [v9 setUniversalStoreIdentifiersWithBlock:v27];
  uint64_t v13 = [v9 modelKind];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v15 = [v9 modelKind];
  }
  else
  {
    char v15 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "isFolder");
  char v16 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v16) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v17 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v16 + 5), a4);
  int v18 = [v17 BOOLValue];

  if (v26 < 0) {
    operator delete(__p[0]);
  }
  if (v15) {
    int v19 = v18;
  }
  else {
    int v19 = 0;
  }
  if (v19 == 1)
  {
    char v20 = [v15 playlistEntryKind];
    int v21 = +[MPModelPlaylist kindWithVariants:playlistEntryKind:options:](MPModelPlaylist, "kindWithVariants:playlistEntryKind:options:", 8, v20, [v15 options]);
    [v9 setModelKind:v21];
  }
  else
  {
    if (!v15) {
      goto LABEL_17;
    }
    uint64_t v22 = [v15 variants];
    char v20 = [v15 playlistEntryKind];
    int v21 = +[MPModelPlaylist kindWithVariants:playlistEntryKind:options:](MPModelPlaylist, "kindWithVariants:playlistEntryKind:options:", v22 & 0xFFFFFFFFFFFFFFF7, v20, [v15 options]);
    [v9 setModelKind:v21];
  }

LABEL_17:
  std::string::basic_string[abi:ne180100]<0>(__p, "versionHash");
  char v23 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v23) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  BOOL v24 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v23 + 5), a4);
  [v9 setVersionHash:v24];

  if (v26 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955D38F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "pid");
  id v5 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v4, (unsigned __int8 *)__p);
  if (!v5) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v6 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v5 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v6, "longLongValue"));

  if (v11 < 0) {
    operator delete(__p[0]);
  }
  id v7 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "syncID");
  id v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v7, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v9 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v8 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setSyncID:", objc_msgSend(v9, "longLongValue"));

  if (v11 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955D3AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "cloudID");
  id v5 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v4, (unsigned __int8 *)__p);
  if (!v5) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v6 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v5 + 5), *(int8x8_t **)(a1 + 40));
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v6, "longLongValue"));

  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955D3B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL28_MPMLInitPropertyPlaylistMapv_block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "cloudUniversalLibraryID");
  id v5 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v4, (unsigned __int8 *)__p);
  if (!v5) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v6 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v5 + 5), *(int8x8_t **)(a1 + 40));
  [v3 setUniversalCloudLibraryID:v6];

  if (v11 < 0) {
    operator delete(__p[0]);
  }
  id v7 = *(void **)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "globalID");
  char v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(v7, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v9 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v8 + 5), *(int8x8_t **)(a1 + 40));
  [v3 setGlobalPlaylistID:v9];

  if (v11 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955D3CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_34(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "isStoreRedownloadable");
  id v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

void sub_1955D3DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_33(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "likedStateChangedDate");
  id v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  id v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  unsigned int v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955D3EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_32(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "likedState");
  id v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  int v9 = [v8 intValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  unsigned int v10 = [NSNumber numberWithBool:v9 == 3];

  return v10;
}

void sub_1955D3FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_31(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "likedState");
  id v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  int v9 = [v8 intValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  unsigned int v10 = [NSNumber numberWithBool:v9 == 2];

  return v10;
}

void sub_1955D40BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_30()
{
  return 0;
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_29(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  id v7 = +[MPCloudController sharedCloudController];
  int v8 = [v7 isEnhancedAudioAvailable];

  if (v8)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "hlsAudioCapability");
    int v9 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
    if (!v9) {
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
    unsigned int v10 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v9 + 5), a4);
    unint64_t v11 = [v10 integerValue];

    if (v19 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v12 = (v11 >> 2) & 8 | (16 * (v11 & 3)) | (v11 >> 1) & 2 | (v11 >> 2) & 4;
  }
  else
  {
    uint64_t v12 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "masteredForiTunes");
  char v13 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v13) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v14 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v13 + 5), a4);
  unsigned int v15 = [v14 BOOLValue];

  if (v19 < 0) {
    operator delete(__p[0]);
  }
  char v16 = [NSNumber numberWithUnsignedInteger:v12 | v15];

  return v16;
}

void sub_1955D4284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_27(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "appData");
  id v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v21 < 0) {
    operator delete(__p[0]);
  }
  int v9 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:0 format:0 error:0];
  if (v9) {
    unsigned int v10 = [[MPMediaLibraryAlbumAppData alloc] initWithAppDataDictionary:v9];
  }
  else {
    unsigned int v10 = 0;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_28;
  v18[3] = &unk_1E57F7C68;
  char v19 = v10;
  unint64_t v11 = v10;
  uint64_t v12 = (void *)MEMORY[0x19971E0F0](v18);
  char v16 = (void *)MEMORY[0x19971E0F0](v12, v13, v14, v15);

  return v16;
}

void sub_1955D444C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  _Unwind_Resume(a1);
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_28(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "songPopularityForIdentifiers:");

  return v1;
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_26(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  id v7 = NSNumber;
  std::string::basic_string[abi:ne180100]<0>(__p, "keepLocalConstraints");
  int v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v9 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v8 + 5), a4);
  unsigned int v10 = objc_msgSend(v7, "numberWithUnsignedInteger:", (int)objc_msgSend(v9, "intValue"));

  if (v13 < 0) {
    operator delete(__p[0]);
  }

  return v10;
}

void sub_1955D4588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_25(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  id v7 = NSNumber;
  std::string::basic_string[abi:ne180100]<0>(__p, "keepLocalStatusReason");
  int v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v9 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v8 + 5), a4);
  unsigned int v10 = objc_msgSend(v7, "numberWithUnsignedInteger:", (int)objc_msgSend(v9, "intValue"));

  if (v13 < 0) {
    operator delete(__p[0]);
  }

  return v10;
}

void sub_1955D4688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_24(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  id v7 = NSNumber;
  std::string::basic_string[abi:ne180100]<0>(__p, "keepLocalStatus");
  int v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v9 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v8 + 5), a4);
  uint64_t v10 = [v9 intValue] + 1;
  if (v10 >= 7) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10 - 1;
  }
  uint64_t v12 = [v7 numberWithInteger:v11];

  if (v15 < 0) {
    operator delete(__p[0]);
  }

  return v12;
}

void sub_1955D4794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_23(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  id v7 = NSNumber;
  std::string::basic_string[abi:ne180100]<0>(__p, "keepLocal");
  int v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v9 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v8 + 5), a4);
  unsigned int v10 = [v9 intValue] + 2;
  if (v10 > 4) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = qword_19568CFD8[v10];
  }
  uint64_t v12 = [v7 numberWithInteger:v11];

  if (v15 < 0) {
    operator delete(__p[0]);
  }

  return v12;
}

void sub_1955D48B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_22(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  id v7 = NSNumber;
  std::string::basic_string[abi:ne180100]<0>(__p, "representativeItemExplicit");
  int v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v9 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v8 + 5), a4);
  unsigned int v10 = objc_msgSend(v7, "numberWithBool:", objc_msgSend(v9, "BOOLValue") ^ 1);

  if (v13 < 0) {
    operator delete(__p[0]);
  }

  return v10;
}

void sub_1955D49B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_21(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "datePlayedLocal");
  id v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  int v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  unsigned int v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955D4AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_20()
{
  return MEMORY[0x1E4F1CC38];
}

uint64_t ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_19()
{
  return MEMORY[0x1E4F1CC28];
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_18(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "libraryTracksItemCount");
  id v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  uint64_t v9 = [v8 longLongValue];

  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if (v9 <= 0) {
    unsigned int v10 = (void *)MEMORY[0x1E4F1CC28];
  }
  else {
    unsigned int v10 = (void *)MEMORY[0x1E4F1CC38];
  }
  id v11 = v10;

  return v11;
}

void sub_1955D4BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_16(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "downloadedDate");
  id v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  uint64_t v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  unsigned int v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955D4CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_15(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "libraryAdded");
  id v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  uint64_t v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  unsigned int v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955D4DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_14(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "dateReleased");
  id v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  uint64_t v9 = [v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  unsigned int v10 = _MPMLDateComponentsFromStoredInt64(v9);

  return v10;
}

void sub_1955D4EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_13(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "itemPID");
  id v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  uint64_t v9 = [v8 longLongValue];

  if (v24 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "mediaType");
  unsigned int v10 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v10) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v11 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v10 + 5), a4);
  unsigned int v12 = [v11 unsignedIntValue];

  if (v24 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v13 = MPMediaTypeForMLMediaType(v12);
  std::string::basic_string[abi:ne180100]<0>(__p, "availableArtworkToken");
  char v14 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v14) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v15 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v14 + 5), a4);
  if (v24 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "fetchableArtworkToken");
  char v16 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v16) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v17 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v16 + 5), a4);
  if (v24 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "fetchableArtworkSourceType");
  int v18 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v18) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v19 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v18 + 5), a4);
  if (v24 < 0) {
    operator delete(__p[0]);
  }
  char v20 = [v6 mediaLibrary];
  char v21 = _MPMLTranslatorCreateArtworkCatalogBlock(v9, v13, 0, 1, v15, v17, v19, v20);

  return v21;
}

void sub_1955D515C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  char v20 = v17;

  _Unwind_Resume(a1);
}

uint64_t ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_12()
{
  return 0;
}

uint64_t ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_11()
{
  return 0;
}

id ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_10(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "isPreOrder");
  id v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

void sub_1955D52C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_8(void *a1@<X1>, void *a2@<X2>, uint64_t a3@<X3>, _OWORD *a4@<X8>)
{
  id v7 = a2;
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)[v7 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "title");
  int v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v9 = *((void *)v8 + 5);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)v9 + 80))(v9) != 3)
  {
    unsigned int v10 = [MEMORY[0x1E4F28B00] currentHandler];
    char v11 = [NSString stringWithUTF8String:"void _MPMLInitPropertyAlbumMap()_block_invoke_8"];
    [v10 handleFailureInFunction:v11 file:@"MPMediaLibraryTranslatorSchema.mm" lineNumber:997 description:@"The base property key for Album's property[name] is not a string and thus cannot be used to create a SearchPredicate"];
  }
  if (a3 == 1)
  {
    unsigned int v12 = 0;
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *&,std::string&,mediaplatform::UnicodeSearch::MatchType,void>(__p, v9, (uint64_t)v15, &v12);
  }
  else
  {
    if (a3) {
      goto LABEL_11;
    }
    unsigned int v12 = 4;
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *&,std::string&,mediaplatform::UnicodeSearch::MatchType,void>(__p, v9, (uint64_t)v15, &v12);
  }
  *a4 = *(_OWORD *)__p;
LABEL_11:
  if (v16 < 0) {
    operator delete(v15[0]);
  }
}

void sub_1955D5474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_7(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  std::string::basic_string[abi:ne180100]<0>(v12, "hasTitle");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)v12))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  mlcore::SortDescriptor::SortDescriptor();
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "titleOrder");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  objc_msgSend(v5, "_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering");
  }
  mlcore::SortDescriptor::SortDescriptor();
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  char v14 = a3;
  char v15 = 0;
  id v6 = (char *)operator new(0x30uLL);
  uint64_t v7 = 0;
  *a3 = v6;
  a3[1] = v6;
  a3[2] = v6 + 48;
  do
  {
    int v8 = &v6[v7];
    uint64_t v9 = *(void *)&v16[v7 + 8];
    *(void *)int v8 = MEMORY[0x1E4F76A98] + 16;
    *((void *)v8 + 1) = v9;
    *((_DWORD *)v8 + 4) = *(_DWORD *)&v16[v7 + 16];
    v7 += 24;
  }
  while (v7 != 48);
  a3[1] = v6 + 48;
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }
}

void sub_1955D5664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void **a22)
{
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&a22);
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }

  _Unwind_Resume(a1);
}

void ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_6(void *a1@<X1>, void *a2@<X8>)
{
  id v6 = a1;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  id v3 = (mlcore *)mlcore::AlbumPropertyStoreID(v6);
  id v4 = (mlcore *)mlcore::AlbumPropertyPersistentID(v3);
  uint64_t v5 = mlcore::AlbumPropertySyncID(v4);
  _MPMLInsertPredicatesForIdentifierSet(a2, v6, (uint64_t)v3, 0, (uint64_t)v4, 0, 0, v5, 0, 0);
}

void sub_1955D5750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, uint64_t a12)
{
  _Unwind_Resume(a1);
}

void ___ZL25_MPMLInitPropertyAlbumMapv_block_invoke_5(uint64_t a1, void *a2, uint64_t *a3)
{
  v76[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v67 = 0;
  id v68 = 0;
  unint64_t v69 = 0;
  uint64_t v5 = [v4 modelKind];
  id v6 = [v5 identityKind];
  uint64_t v7 = +[MPModelAlbumKind identityKind];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    id v50 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v51 = [NSString stringWithUTF8String:"void _MPMLInitPropertyAlbumMap()_block_invoke_5"];
    [v50 handleFailureInFunction:v51 file:@"MPMediaLibraryTranslatorSchema.mm" lineNumber:928 description:@"Must have album kind to generate album entity query."];
  }
  uint64_t v9 = (std::__shared_weak_count *)a3[1];
  uint64_t v65 = *a3;
  uint64_t v66 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v5 applyToView:&v65 withContext:v4];
  if (v66) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v66);
  }
  unsigned int v10 = [v4 allowedEntityIdentifiers];
  uint64_t v11 = mlcore::AlbumPropertyStoreID(v10);
  unsigned int v12 = (mlcore *)mlcore::AlbumPropertyPersistentID((mlcore *)v11);
  char v13 = (mlcore *)mlcore::AlbumPropertySyncID(v12);
  char v14 = (mlcore *)mlcore::AlbumPropertyCloudLibraryID(v13);
  uint64_t v15 = mlcore::AlbumPropertyCloudLibraryID(v14);
  _MPMLInsertPredicatesForIdentifierSet(&v67, v10, v11, 0, (uint64_t)v12, 0, 0, (uint64_t)v13, (uint64_t)v14, v15);

  char v16 = [v4 filterText];
  LOBYTE(v11) = [v16 length] == 0;

  if ((v11 & 1) == 0)
  {
    id v17 = [v4 filterText];
    std::string::basic_string[abi:ne180100]<0>(v63, (char *)[v17 UTF8String]);

    uint64_t v19 = mlcore::AlbumPropertyTitle(v18);
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *,std::string&,void>(&v58, v19, (uint64_t)v63);
    v75[0] = v58;
    uint64_t v21 = mlcore::AlbumPropertyArtistName(v20);
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *,std::string&,void>(&v57, v21, (uint64_t)v63);
    v75[1] = v57;
    long long v57 = 0uLL;
    BOOL v60 = 0;
    uint64_t v61 = 0;
    v59 = 0;
    v70 = (char **)&v59;
    LOBYTE(v71) = 0;
    v59 = operator new(0x20uLL);
    BOOL v60 = v59;
    uint64_t v61 = v59 + 4;
    BOOL v60 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::Predicate>>,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate>*>((uint64_t)&v61, v75, v76, v59);
    mlcore::CreateOrPredicate();
    uint64_t v22 = v68;
    if ((unint64_t)v68 >= v69)
    {
      int64_t v23 = (v68 - v67) >> 4;
      unint64_t v24 = v23 + 1;
      if ((unint64_t)(v23 + 1) >> 60) {
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v25 = v69 - (void)v67;
      if ((uint64_t)(v69 - (void)v67) >> 3 > v24) {
        unint64_t v24 = v25 >> 3;
      }
      if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v26 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v26 = v24;
      }
      uint64_t v74 = &v69;
      uint64_t v27 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v26);
      uint64_t v28 = (std::__shared_weak_count *)&v27[2 * v23];
      v70 = (char **)v27;
      BOOL v71 = v28;
      uint64_t v73 = &v27[2 * v29];
      v28->std::__shared_count = v62;
      std::__shared_count v62 = (std::__shared_count)0;
      p_shared_weak_owners = &v28->__shared_weak_owners_;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__swap_out_circular_buffer((uint64_t *)&v67, &v70);
      long long v30 = v68;
      std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v70);
      id v68 = v30;
      if (v62.__shared_owners_) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v62.__shared_owners_);
      }
    }
    else
    {
      *(std::__shared_count *)id v68 = v62;
      std::__shared_count v62 = (std::__shared_count)0;
      id v68 = v22 + 16;
    }
    v70 = (char **)&v59;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v70);
    for (uint64_t i = 24; i != -8; i -= 16)
    {
      unint64_t v32 = *(std::__shared_weak_count **)((char *)v75 + i);
      if (v32) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v32);
      }
    }
    if (v64 < 0) {
      operator delete(v63[0]);
    }
  }
  uint64_t v33 = [v4 scopedContainers];
  unint64_t v34 = [v33 firstObject];

  int v35 = [v34 identifiers];
  char v36 = [v35 library];
  uint64_t v37 = [v36 persistentID];

  v63[0] = 0;
  char v38 = [v35 universalStore];
  uint64_t v39 = (void *)[v38 adamID];

  v63[0] = v39;
  memset(v56, 0, sizeof(v56));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v56, v67, v68, (v68 - v67) >> 4);
  mlcore::CreateAndPredicate();
  *(void *)&v75[0] = v56;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)v75);
  uint64_t v40 = objc_opt_class();
  if (v40 == objc_opt_class()) {
    __assert_rtn("_MPMLInitPropertyAlbumMap_block_invoke_5", "MPMediaLibraryTranslatorSchema.mm", 949, "0");
  }
  uint64_t v41 = objc_opt_class();
  uint64_t v42 = (mlcore *)objc_opt_class();
  if ((mlcore *)v41 == v42)
  {
    if (v37)
    {
      uint64_t v46 = (std::__shared_weak_count *)operator new(0x100uLL);
      v46->__shared_owners_ = 0;
      v46->__shared_weak_owners_ = 0;
      v46->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE673588;
      mlcore::Artist::Artist((mlcore::Artist *)&v46[1]);
      unint64_t v55 = v71;
      if (v71) {
        atomic_fetch_add_explicit(&v71->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      mlcore::EntityQuery::albumsForArtistQuery();
      if (v55) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v55);
      }
      int v47 = v46;
      if (v46) {
        goto LABEL_55;
      }
      goto LABEL_56;
    }
    if (v63[0])
    {
      mlcore::ItemPropertyArtistStoreID(v42);
      std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>();
    }
  }
  else
  {
    uint64_t v43 = objc_opt_class();
    if (v43 == objc_opt_class())
    {
      int v48 = (std::__shared_weak_count *)operator new(0x100uLL);
      v48->__shared_owners_ = 0;
      v48->__shared_weak_owners_ = 0;
      v48->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE673518;
      mlcore::Genre::Genre((mlcore::Genre *)&v48[1]);
      int64_t v54 = v71;
      if (v71) {
        atomic_fetch_add_explicit(&v71->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      mlcore::EntityQuery::albumsForGenreQuery();
      if (v54) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v54);
      }
      int v47 = v48;
      if (v48) {
        goto LABEL_55;
      }
      goto LABEL_56;
    }
    uint64_t v44 = objc_opt_class();
    if (v44 == objc_opt_class())
    {
      int v49 = (std::__shared_weak_count *)operator new(0x100uLL);
      v49->__shared_owners_ = 0;
      v49->__shared_weak_owners_ = 0;
      v49->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE6735F8;
      mlcore::Composer::Composer((mlcore::Composer *)&v49[1]);
      unint64_t v53 = v71;
      if (v71) {
        atomic_fetch_add_explicit(&v71->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      mlcore::EntityQuery::albumsForComposerQuery();
      if (v53) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v53);
      }
      int v47 = v49;
      if (v49) {
        goto LABEL_55;
      }
      goto LABEL_56;
    }
  }
  id v45 = [v4 allowedEntityIdentifiers];
  if (![v45 count]) {
    [v4 isMultiQuery];
  }

  char v52 = v71;
  if (v71) {
    atomic_fetch_add_explicit(&v71->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  mlcore::EntityQuery::albumsQuery();
  int v47 = v52;
  if (v52) {
LABEL_55:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v47);
LABEL_56:
  if (v71) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v71);
  }

  v70 = &v67;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v70);
}

void sub_1955D5ECC(_Unwind_Exception *a1)
{
  *(void *)(v5 - 128) = v5 - 200;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v5 - 128));

  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<mlcore::Composer>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<mlcore::Composer>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE6735F8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x19971D860);
}

void std::__shared_ptr_emplace<mlcore::Composer>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE6735F8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t std::__shared_ptr_emplace<mlcore::Genre>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<mlcore::Genre>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE673518;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x19971D860);
}

void std::__shared_ptr_emplace<mlcore::Genre>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE673518;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t std::__shared_ptr_emplace<mlcore::Artist>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<mlcore::Artist>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE673588;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x19971D860);
}

void std::__shared_ptr_emplace<mlcore::Artist>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE673588;
  std::__shared_weak_count::~__shared_weak_count(this);
}

id ___ZL30_MPMLInitPropertyStoreAssetMapv_block_invoke_4(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "cloudAssetAvailable");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  int v9 = [v8 BOOLValue];

  if (v20 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "cloudStatus");
  unsigned int v10 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v10) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v11 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v10 + 5), a4);
  uint64_t v12 = [v11 integerValue];

  if (v20 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "storeCloudID");
  char v13 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v13) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v14 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v13 + 5), a4);
  uint64_t v15 = [v14 longLongValue];

  if (v20 < 0) {
    operator delete(__p[0]);
  }
  if (v15 > 0) {
    uint64_t v16 = (v12 == 0) & ~v9;
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = [NSNumber numberWithBool:v16];

  return v17;
}

void sub_1955D6498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL24_MPMLInitPropertySongMapv_block_invoke_32(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "likedStateChangedDate");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  int v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  unsigned int v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955D65BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL24_MPMLInitPropertySongMapv_block_invoke_28(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  uint64_t v7 = NSNumber;
  std::string::basic_string[abi:ne180100]<0>(__p, "keepLocalStatusReason");
  char v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v9 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v8 + 5), a4);
  unsigned int v10 = objc_msgSend(v7, "numberWithUnsignedInteger:", (int)objc_msgSend(v9, "intValue"));

  if (v13 < 0) {
    operator delete(__p[0]);
  }

  return v10;
}

void sub_1955D66C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL24_MPMLInitPropertySongMapv_block_invoke_24(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "datePlayed");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  int v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  unsigned int v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955D67B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL24_MPMLInitPropertySongMapv_block_invoke_23(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "downloadedDate");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  int v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  unsigned int v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955D68B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL24_MPMLInitPropertySongMapv_block_invoke_22(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "libraryAdded");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  int v9 = (void *)[v8 longLongValue];

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  unsigned int v10 = _MPMLDateFromStoredInt64(v9);

  return v10;
}

void sub_1955D69B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ___ZL24_MPMLInitPropertySongMapv_block_invoke_15(uint64_t a1, void *a2, void *a3, int8x8_t *a4)
{
  id v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "classicalMovement");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v8 = MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

void sub_1955D6A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL24_MPMLInitPropertySongMapv_block_invoke_14(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "classicalMovementNumber");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  objc_msgSend(v5, "_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering");
  }
  mlcore::SortDescriptor::SortDescriptor();
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  unsigned int v10 = a3;
  char v11 = 0;
  id v6 = operator new(0x18uLL);
  a3[2] = v6 + 3;
  uint64_t v7 = v12;
  void *v6 = MEMORY[0x1E4F76A98] + 16;
  v6[1] = v7;
  *((_DWORD *)v6 + 4) = v13;
  *a3 = v6;
  a3[1] = v6 + 3;
  if (v9 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955D6BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void **a16)
{
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&a16);
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void ___ZL24_MPMLInitPropertySongMapv_block_invoke_12(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  std::string::basic_string[abi:ne180100]<0>(v12, "hasTrackNumber");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)v12))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  mlcore::SortDescriptor::SortDescriptor();
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "trackNumber");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  objc_msgSend(v5, "_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering");
  }
  mlcore::SortDescriptor::SortDescriptor();
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v14 = a3;
  char v15 = 0;
  id v6 = (char *)operator new(0x30uLL);
  uint64_t v7 = 0;
  *a3 = v6;
  a3[1] = v6;
  a3[2] = v6 + 48;
  do
  {
    char v8 = &v6[v7];
    uint64_t v9 = *(void *)&v16[v7 + 8];
    *(void *)char v8 = MEMORY[0x1E4F76A98] + 16;
    *((void *)v8 + 1) = v9;
    *((_DWORD *)v8 + 4) = *(_DWORD *)&v16[v7 + 16];
    v7 += 24;
  }
  while (v7 != 48);
  a3[1] = v6 + 48;
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }
}

void sub_1955D6D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void **a22)
{
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&a22);
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }

  _Unwind_Resume(a1);
}

void ___ZL24_MPMLInitPropertySongMapv_block_invoke_10(void *a1@<X1>, void *a2@<X2>, uint64_t a3@<X3>, _OWORD *a4@<X8>)
{
  id v7 = a2;
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)[v7 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "title");
  char v8 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  uint64_t v9 = *((void *)v8 + 5);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)v9 + 80))(v9) != 3)
  {
    unsigned int v10 = [MEMORY[0x1E4F28B00] currentHandler];
    char v11 = [NSString stringWithUTF8String:"void _MPMLInitPropertySongMap()_block_invoke_10"];
    [v10 handleFailureInFunction:v11 file:@"MPMediaLibraryTranslatorSchema.mm" lineNumber:410 description:@"The base property key for Song's property[title] is not a string and thus cannot be used to create a SearchPredicate"];
  }
  if (a3 == 1)
  {
    unsigned int v12 = 0;
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *&,std::string&,mediaplatform::UnicodeSearch::MatchType,void>(__p, v9, (uint64_t)v15, &v12);
  }
  else
  {
    if (a3) {
      goto LABEL_11;
    }
    unsigned int v12 = 4;
    std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *&,std::string&,mediaplatform::UnicodeSearch::MatchType,void>(__p, v9, (uint64_t)v15, &v12);
  }
  *a4 = *(_OWORD *)__p;
LABEL_11:
  if (v16 < 0) {
    operator delete(v15[0]);
  }
}

void sub_1955D6F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void ___ZL24_MPMLInitPropertySongMapv_block_invoke_9(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "titleOrder");
  if (!std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a1, (unsigned __int8 *)__p))std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
  objc_msgSend(v5, "_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering");
  }
  mlcore::SortDescriptor::SortDescriptor();
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  unsigned int v10 = a3;
  char v11 = 0;
  id v6 = operator new(0x18uLL);
  a3[2] = v6 + 3;
  uint64_t v7 = v12;
  void *v6 = MEMORY[0x1E4F76A98] + 16;
  v6[1] = v7;
  *((_DWORD *)v6 + 4) = v13;
  *a3 = v6;
  a3[1] = v6 + 3;
  if (v9 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1955D70F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void **a16)
{
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&a16);
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t ___ZL24_MPMLInitPropertySongMapv_block_invoke_7()
{
  return MEMORY[0x1E4F1CC28];
}

void ___ZL24_MPMLInitPropertySongMapv_block_invoke_6(void *a1@<X1>, void *a2@<X8>)
{
  unsigned int v10 = a1;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  id v3 = (mlcore *)mlcore::ItemPropertyStoreID(v10);
  id v4 = (mlcore *)mlcore::ItemPropertySubscriptionStoreItemID(v3);
  id v5 = (mlcore *)mlcore::ItemPropertyPersistentID(v4);
  id v6 = (mlcore *)mlcore::ItemPropertyStoreCloudID(v5);
  uint64_t v7 = (mlcore *)mlcore::ItemPropertySyncID(v6);
  char v8 = (mlcore *)mlcore::ItemPropertyStoreCloudUniversalLibraryID(v7);
  uint64_t v9 = mlcore::ItemPropertyStoreCloudAlbumID(v8);
  _MPMLInsertPredicatesForIdentifierSet(a2, v10, (uint64_t)v3, (uint64_t)v4, (uint64_t)v5, (uint64_t)v6, 0, (uint64_t)v7, (uint64_t)v8, v9);
}

void sub_1955D7204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, uint64_t a12)
{
  _Unwind_Resume(a1);
}

__n128 ___ZL32_MPMLInitPropertyGenericModelMapv_block_invoke_2@<Q0>(__n128 *a1@<X8>)
{
  id v2 = operator new(0x150uLL);
  v2[1] = 0;
  v2[2] = 0;
  void *v2 = &unk_1EE673320;
  result.n128_u64[0] = MEMORY[0x19971C040](v2 + 3);
  result.n128_u64[1] = (unint64_t)v2;
  *a1 = result;
  return result;
}

void sub_1955D7280(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<mlcore::MultiEntityQuery>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<mlcore::MultiEntityQuery>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE673320;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x19971D860);
}

void std::__shared_ptr_emplace<mlcore::MultiEntityQuery>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE673320;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1955D9F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1955DA2F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1955DA534(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__49862(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__49863(uint64_t a1)
{
}

void sub_1955DF0A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 248));
  _Unwind_Resume(a1);
}

void sub_1955DFBAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1955DFF64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1955E01AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1955E0F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__50101(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__50102(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__50539(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__50540(uint64_t a1)
{
}

void sub_1955E50B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1955E51F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__50691(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__50692(uint64_t a1)
{
}

void sub_1955E712C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__50782(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__50783(uint64_t a1)
{
}

id MPStoreContentReporterURLOperation(void *a1, char a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4FB85A0]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __MPStoreContentReporterURLOperation_block_invoke;
  v12[3] = &unk_1E57F8C60;
  id v13 = 0;
  id v14 = v5;
  char v16 = a2;
  id v15 = v6;
  id v8 = v6;
  id v9 = v5;
  unsigned int v10 = (void *)[v7 initWithStartHandler:v12];

  return v10;
}

void __MPStoreContentReporterURLOperation_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(v4, "ic_URLByAppendingQueryParameters:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v4;
  }
  id v6 = v5;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v5];
  id v8 = v7;
  if (*(unsigned char *)(a1 + 56)) {
    id v9 = @"GET";
  }
  else {
    id v9 = @"POST";
  }
  [v7 setHTTPMethod:v9];
  id v10 = objc_alloc(MEMORY[0x1E4FB8758]);
  char v11 = [MEMORY[0x1E4FB87B8] activeAccount];
  uint64_t v12 = (void *)[v10 initWithIdentity:v11];

  id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB8760]) initWithURLRequest:v8 requestContext:v12];
  id v14 = [MEMORY[0x1E4FB87A8] defaultSession];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __MPStoreContentReporterURLOperation_block_invoke_2;
  v17[3] = &unk_1E57F8C38;
  id v15 = *(id *)(a1 + 48);
  id v18 = v3;
  id v19 = v15;
  id v16 = v3;
  [v14 enqueueDataRequest:v13 withCompletionHandler:v17];
}

void __MPStoreContentReporterURLOperation_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 parsedBodyDictionary];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) finishWithError:v5];
}

uint64_t __Block_byref_object_copy__51524(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__51525(uint64_t a1)
{
}

id _findSettingWithKeyPath(void *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = @"root.music.allowExplicitContent";
  id v3 = a1;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [v3 settings];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v10 = [v9 keyPath];
        char v11 = [v10 isEqualToString:@"root.music.allowExplicitContent"];

        if (v11)
        {
          id v16 = v9;
          goto LABEL_19;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = objc_msgSend(v3, "groups", 0);
  uint64_t v12 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
LABEL_11:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v20 != v14) {
        objc_enumerationMutation(v4);
      }
      _findSettingWithKeyPath(*(void *)(*((void *)&v19 + 1) + 8 * v15));
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v16) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_19:
    uint64_t v17 = v16;
  }
  else
  {
LABEL_17:
    uint64_t v17 = 0;
  }

  return v17;
}

uint64_t _isValidSetting(void *a1, __CFString *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = @"root.music.allowExplicitContent";
  if (!v3)
  {
    id v8 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      id v9 = "_isValidSetting() setting=nil";
      id v10 = v8;
      uint32_t v11 = 2;
LABEL_15:
      _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v15, v11);
    }
LABEL_16:
    uint64_t v7 = 0;
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v5 = [v3 keyPath];
  char v6 = [v5 isEqualToString:@"root.music.allowExplicitContent"];

  if ((v6 & 1) == 0)
  {
    id v8 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v3 keyPath];
      int v15 = 138543618;
      id v16 = @"root.music.allowExplicitContent";
      __int16 v17 = 2114;
      uint64_t v18 = (uint64_t)v12;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "_isValidSetting() invalid setting.keypath. Expected:%{public}@ Found:%{public}@", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_16;
  }
  if (![v3 valueClass])
  {
    id v8 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = [v3 keyPath];
      int v15 = 138543362;
      id v16 = v13;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEBUG, "_isValidSetting() setting with keypath=%{public}@ valueClass=nil. Returning isValid=YES", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v7 = 1;
    goto LABEL_17;
  }
  [v3 valueClass];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543618;
      id v16 = a2;
      __int16 v17 = 2114;
      uint64_t v18 = [v3 valueClass];
      id v9 = "_isValidSetting() invalid setting.valueClass. Expected:%{public}@ Found:%{public}@";
      id v10 = v8;
      uint32_t v11 = 22;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  uint64_t v7 = 1;
LABEL_18:

  return v7;
}

void sub_1955EEAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__51845(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__51846(uint64_t a1)
{
}

void sub_1955EEC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1955EF258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL MPPPersistentIDsPredicateReadFrom(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (int *)MEMORY[0x1E4F940E8];
  char v6 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v7 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v8 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v7]) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      uint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v5;
        unint64_t v13 = *(void *)&v4[v12];
        if (v13 == -1 || v13 >= *(void *)&v4[*v6]) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)&v4[*v8] + v13);
        *(void *)&v4[v12] = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v15 = v10++ >= 9;
        if (v15)
        {
          LODWORD(v11) = 0;
          int v16 = v4[*v7];
          goto LABEL_14;
        }
      }
      v4[*v7] = 1;
LABEL_12:
      int v16 = v4[*v7];
      if (v4[*v7]) {
        LODWORD(v11) = 0;
      }
LABEL_14:
      int v17 = v11 & 7;
      if (v16 || v17 == 4) {
        break;
      }
      int v19 = (unsigned __int16)(v11 >> 3);
      if (v19 == 2)
      {
        if (v17 == 2)
        {
          if (!PBReaderPlaceMark()) {
            goto LABEL_59;
          }
          while (*(void *)&v4[*v5] < *(void *)&v4[*v6] && !v4[*v7])
          {
            char v26 = 0;
            unsigned int v27 = 0;
            uint64_t v28 = 0;
            while (1)
            {
              uint64_t v29 = *v5;
              unint64_t v30 = *(void *)&v4[v29];
              if (v30 == -1 || v30 >= *(void *)&v4[*v6]) {
                break;
              }
              char v31 = *(unsigned char *)(*(void *)&v4[*v8] + v30);
              *(void *)&v4[v29] = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v15 = v27++ >= 9;
                if (!v15) {
                  continue;
                }
              }
              goto LABEL_39;
            }
            v4[*v7] = 1;
LABEL_39:
            PBRepeatedInt64Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          while (1)
          {
            uint64_t v35 = *v5;
            unint64_t v36 = *(void *)&v4[v35];
            if (v36 == -1 || v36 >= *(void *)&v4[*v6]) {
              break;
            }
            char v37 = *(unsigned char *)(*(void *)&v4[*v8] + v36);
            *(void *)&v4[v35] = v36 + 1;
            v34 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              BOOL v15 = v33++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_55;
          }
          v4[*v7] = 1;
LABEL_55:
          PBRepeatedInt64Add();
        }
      }
      else if (v19 == 1)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        v3[36] |= 1u;
        while (1)
        {
          uint64_t v23 = *v5;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 == -1 || v24 >= *(void *)&v4[*v6]) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)&v4[*v8] + v24);
          *(void *)&v4[v23] = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_43;
          }
          v20 += 7;
          BOOL v15 = v21++ >= 9;
          if (v15)
          {
            uint64_t v22 = 0;
            goto LABEL_45;
          }
        }
        v4[*v7] = 1;
LABEL_43:
        if (v4[*v7]) {
          uint64_t v22 = 0;
        }
LABEL_45:
        v3[32] = v22 != 0;
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
LABEL_59:
        BOOL v38 = 0;
        goto LABEL_58;
      }
    }
    while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
  }
  BOOL v38 = v4[*v7] == 0;
LABEL_58:

  return v38;
}

BOOL MPPMediaPredicateValueReadFrom(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (int *)MEMORY[0x1E4F940E8];
  char v6 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v7 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v8 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v7]) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      uint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v5;
        uint64_t v13 = *(void *)&v4[v12];
        unint64_t v14 = v13 + 1;
        if (v13 == -1 || v14 > *(void *)&v4[*v6]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v8] + v13);
        *(void *)&v4[v12] = v14;
        v11 |= (unint64_t)(v15 & 0x7F) << v9;
        if ((v15 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v16 = v10++ >= 9;
        if (v16)
        {
          LODWORD(v11) = 0;
          int v17 = v4[*v7];
          goto LABEL_14;
        }
      }
      v4[*v7] = 1;
LABEL_12:
      int v17 = v4[*v7];
      if (v4[*v7]) {
        LODWORD(v11) = 0;
      }
LABEL_14:
      if (v17 || (v11 & 7) == 4) {
        break;
      }
      switch((unsigned __int16)(v11 >> 3))
      {
        case 1u:
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          while (1)
          {
            uint64_t v22 = *v5;
            uint64_t v23 = *(void *)&v4[v22];
            unint64_t v24 = v23 + 1;
            if (v23 == -1 || v24 > *(void *)&v4[*v6]) {
              break;
            }
            char v25 = *(unsigned char *)(*(void *)&v4[*v8] + v23);
            *(void *)&v4[v22] = v24;
            v21 |= (unint64_t)(v25 & 0x7F) << v19;
            if ((v25 & 0x80) == 0) {
              goto LABEL_52;
            }
            v19 += 7;
            BOOL v16 = v20++ >= 9;
            if (v16)
            {
              LODWORD(v21) = 0;
              goto LABEL_54;
            }
          }
          v4[*v7] = 1;
LABEL_52:
          if (v4[*v7]) {
            LODWORD(v21) = 0;
          }
LABEL_54:
          v3[12] = v21;
          continue;
        case 2u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *((unsigned char *)v3 + 56) |= 2u;
          while (2)
          {
            uint64_t v29 = *v5;
            uint64_t v30 = *(void *)&v4[v29];
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)&v4[*v6])
            {
              v4[*v7] = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)&v4[*v8] + v30);
              *(void *)&v4[v29] = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                BOOL v16 = v27++ >= 9;
                if (v16)
                {
                  uint64_t v28 = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v7]) {
            uint64_t v28 = 0;
          }
LABEL_58:
          *((void *)v3 + 2) = v28;
          continue;
        case 3u:
          *((unsigned char *)v3 + 56) |= 1u;
          uint64_t v33 = *v5;
          unint64_t v34 = *(void *)&v4[v33];
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(void *)&v4[*v6])
          {
            uint64_t v35 = *(void *)(*(void *)&v4[*v8] + v34);
            *(void *)&v4[v33] = v34 + 8;
          }
          else
          {
            v4[*v7] = 1;
            uint64_t v35 = 0;
          }
          *((void *)v3 + 1) = v35;
          continue;
        case 4u:
          *((unsigned char *)v3 + 56) |= 4u;
          uint64_t v36 = *v5;
          unint64_t v37 = *(void *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFFBLL && v37 + 4 <= *(void *)&v4[*v6])
          {
            int v38 = *(_DWORD *)(*(void *)&v4[*v8] + v37);
            *(void *)&v4[v36] = v37 + 4;
          }
          else
          {
            v4[*v7] = 1;
            int v38 = 0;
          }
          v3[8] = v38;
          continue;
        case 5u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0;
          *((unsigned char *)v3 + 56) |= 8u;
          break;
        case 6u:
          uint64_t v46 = PBReaderReadString();
          uint64_t v47 = 10;
          goto LABEL_50;
        case 7u:
          uint64_t v46 = PBReaderReadData();
          uint64_t v47 = 6;
LABEL_50:
          int v48 = *(void **)&v3[v47];
          *(void *)&v3[v47] = v46;

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
          BOOL v50 = 0;
          goto LABEL_69;
      }
      while (1)
      {
        uint64_t v42 = *v5;
        uint64_t v43 = *(void *)&v4[v42];
        unint64_t v44 = v43 + 1;
        if (v43 == -1 || v44 > *(void *)&v4[*v6]) {
          break;
        }
        char v45 = *(unsigned char *)(*(void *)&v4[*v8] + v43);
        *(void *)&v4[v42] = v44;
        v41 |= (unint64_t)(v45 & 0x7F) << v39;
        if ((v45 & 0x80) == 0) {
          goto LABEL_60;
        }
        v39 += 7;
        BOOL v16 = v40++ >= 9;
        if (v16)
        {
          uint64_t v41 = 0;
          goto LABEL_62;
        }
      }
      v4[*v7] = 1;
LABEL_60:
      if (v4[*v7]) {
        uint64_t v41 = 0;
      }
LABEL_62:
      *((unsigned char *)v3 + 52) = v41 != 0;
    }
    while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
  }
  BOOL v50 = v4[*v7] == 0;
LABEL_69:

  return v50;
}

void sub_1955F4520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v22 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__52681(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__52682(uint64_t a1)
{
}

void sub_1955F4AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__81(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x19971E0F0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__82(uint64_t a1)
{
}

void sub_1955F4F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak((id *)(v18 - 200));
  objc_destroyWeak((id *)(v18 - 192));
  _Block_object_dispose((const void *)(v18 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1955F58BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak((id *)(v18 - 200));
  objc_destroyWeak((id *)(v18 - 192));
  _Block_object_dispose((const void *)(v18 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__155(uint64_t result, void *a2)
{
  uint64_t v2 = a2[6];
  a2[6] = 0;
  *(void *)(result + 48) = v2;
  *(void *)(result + 56) = a2[7];
  a2[7] = 0;
  uint64_t v5 = a2[8];
  id v3 = a2 + 8;
  uint64_t v4 = v5;
  *(void *)(result + 64) = v5;
  uint64_t v6 = v3[1];
  *(void *)(result + 72) = v6;
  *(_DWORD *)(result + 80) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    unint64_t v7 = *(void *)(v4 + 8);
    unint64_t v8 = *(void *)(result + 56);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        v7 %= v8;
      }
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(void *)(v2 + 8 * v7) = result + 64;
    void *v3 = 0;
    v3[1] = 0;
  }
  return result;
}

uint64_t __Block_byref_object_dispose__156(uint64_t a1)
{
  return std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table(a1 + 48);
}

uint64_t __Block_byref_object_copy__151(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__152(uint64_t a1)
{
}

void std::__shared_ptr_emplace<std::unordered_map<std::string,mlcore::ModelPropertyBase *>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE673668;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x19971D860);
}

void std::__shared_ptr_emplace<std::unordered_map<std::string,mlcore::ModelPropertyBase *>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE673668;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1955F6B08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1955F6BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<std::shared_ptr<mlcore::Predicate>>::__move_range(uint64_t a1, uint64_t a2, unint64_t a3, char *a4)
{
  uint64_t v4 = *(char **)(a1 + 8);
  uint64_t v5 = (char *)(a2 + v4 - a4);
  uint64_t v6 = v4;
  while ((unint64_t)v5 < a3)
  {
    *(_OWORD *)uint64_t v6 = *(_OWORD *)v5;
    v6 += 16;
    *(void *)uint64_t v5 = 0;
    *((void *)v5 + 1) = 0;
    v5 += 16;
  }
  *(void *)(a1 + 8) = v6;
  if (v4 != a4)
  {
    unint64_t v7 = (std::__shared_weak_count **)(v4 - 8);
    uint64_t v8 = 16 * ((v4 - a4) >> 4);
    uint64_t v9 = a2 - 16;
    do
    {
      unsigned int v10 = (void *)(v9 + v8);
      long long v11 = *(_OWORD *)(v9 + v8);
      void *v10 = 0;
      v10[1] = 0;
      uint64_t v12 = *v7;
      *(_OWORD *)(v7 - 1) = v11;
      if (v12) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v12);
      }
      v7 -= 2;
      v8 -= 16;
    }
    while (v8);
  }
}

uint64_t std::vector<std::shared_ptr<mlcore::Predicate>>::__swap_out_circular_buffer(uint64_t *a1, void *a2, void *a3)
{
  id v3 = a3;
  uint64_t v6 = a2[1];
  unint64_t v7 = a1 + 2;
  a2[1] = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::Predicate>>,std::reverse_iterator<std::shared_ptr<mlcore::Predicate>*>,std::reverse_iterator<std::shared_ptr<mlcore::Predicate>*>,std::reverse_iterator<std::shared_ptr<mlcore::Predicate>*>>((uint64_t)(a1 + 2), (uint64_t)a3, a3, *a1, (void *)*a1, v6, v6);
  uint64_t v8 = a1[1];
  uint64_t v9 = (_OWORD *)a2[2];
  BOOL v16 = v9;
  int v17 = v9;
  v14[0] = v7;
  v14[1] = &v16;
  v14[2] = &v17;
  if ((void *)v8 != v3)
  {
    do
    {
      *v9++ = *(_OWORD *)v3;
      void *v3 = 0;
      v3[1] = 0;
      v3 += 2;
    }
    while (v3 != (void *)v8);
    int v17 = v9;
  }
  char v15 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::shared_ptr<mlcore::Predicate>>,std::shared_ptr<mlcore::Predicate>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v14);
  a2[2] = v9;
  uint64_t v10 = *a1;
  *a1 = a2[1];
  a2[1] = v10;
  uint64_t v11 = a1[1];
  a1[1] = a2[2];
  a2[2] = v11;
  uint64_t v12 = a1[2];
  a1[2] = a2[3];
  a2[3] = v12;
  *a2 = a2[1];
  return v6;
}

void sub_1955F7088(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29)
{
}

void sub_1955F72B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  __cxa_end_catch();

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__52932(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  return result;
}

void __Block_byref_object_dispose__52933(uint64_t a1)
{
  v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void sub_1955F764C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1955F7734(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
  if (__p) {
    operator delete(__p);
  }
  JUMPOUT(0x1955F770CLL);
}

__n128 __Block_byref_object_copy__121(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__122(uint64_t a1)
{
  v1 = (void **)(a1 + 48);
  std::vector<mlcore::MultiSortDescriptor>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void sub_1955F7C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void **a23)
{
  a23 = (void **)(v28 - 128);
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&a23);

  _Unwind_Resume(a1);
}

void std::vector<mlcore::MultiSortDescriptor>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      uint64_t v6 = v4 - 56;
      unint64_t v7 = v4 - 56;
      uint64_t v8 = v4 - 56;
      do
      {
        uint64_t v9 = *(void (***)(char *))v8;
        v8 -= 56;
        (*v9)(v7);
        v6 -= 56;
        BOOL v10 = v7 == v2;
        unint64_t v7 = v8;
      }
      while (!v10);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::MultiSortDescriptor>>(unint64_t a1)
{
  if (a1 >= 0x492492492492493) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(56 * a1);
}

uint64_t std::__split_buffer<mlcore::MultiSortDescriptor>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v4 = *(void (***)(void))(i - 56);
    *(void *)(a1 + 16) = i - 56;
    (*v4)();
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>>>::__hash_table(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a2 = 0;
  *(void *)__n128 result = v2;
  *(void *)(result + 8) = a2[1];
  a2[1] = 0;
  uint64_t v5 = a2[2];
  uint64_t v3 = a2 + 2;
  uint64_t v4 = v5;
  *(void *)(result + 16) = v5;
  uint64_t v6 = v3[1];
  *(void *)(result + 24) = v6;
  *(_DWORD *)(result + 32) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    unint64_t v7 = *(void *)(v4 + 8);
    unint64_t v8 = *(void *)(result + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        v7 %= v8;
      }
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(void *)(v2 + 8 * v7) = result + 16;
    void *v3 = 0;
    v3[1] = 0;
  }
  return result;
}

uint64_t std::unordered_map<mlcore::EntityClass *,mlcore::ModelPropertyBase *>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, *(void *)(a2 + 8));
  uint64_t v5 = *(void **)(a2 + 16);
  if (v5)
  {
    uint64_t v6 = (void *)(a1 + 16);
    unint64_t v7 = *(void *)(a1 + 8);
    do
    {
      unint64_t v8 = v5[2];
      unint64_t v9 = 0x9DDFEA08EB382D69 * (((8 * v8) + 8) ^ HIDWORD(v8));
      unint64_t v10 = 0x9DDFEA08EB382D69 * (HIDWORD(v8) ^ (v9 >> 47) ^ v9);
      unint64_t v11 = 0x9DDFEA08EB382D69 * (v10 ^ (v10 >> 47));
      if (v7)
      {
        uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
        v12.i16[0] = vaddlv_u8(v12);
        if (v12.u32[0] > 1uLL)
        {
          unint64_t v2 = 0x9DDFEA08EB382D69 * (v10 ^ (v10 >> 47));
          if (v11 >= v7) {
            unint64_t v2 = v11 % v7;
          }
        }
        else
        {
          unint64_t v2 = v11 & (v7 - 1);
        }
        uint64_t v13 = *(void **)(*(void *)a1 + 8 * v2);
        if (v13)
        {
          for (uint64_t i = (void *)*v13; i; uint64_t i = (void *)*i)
          {
            unint64_t v15 = i[1];
            if (v15 == v11)
            {
              if (i[2] == v8) {
                goto LABEL_41;
              }
            }
            else
            {
              if (v12.u32[0] > 1uLL)
              {
                if (v15 >= v7) {
                  v15 %= v7;
                }
              }
              else
              {
                v15 &= v7 - 1;
              }
              if (v15 != v2) {
                break;
              }
            }
          }
        }
      }
      BOOL v16 = operator new(0x20uLL);
      void *v16 = 0;
      v16[1] = v11;
      *((_OWORD *)v16 + 1) = *((_OWORD *)v5 + 1);
      float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
      float v18 = *(float *)(a1 + 32);
      if (!v7 || (float)(v18 * (float)v7) < v17)
      {
        BOOL v19 = (v7 & (v7 - 1)) != 0;
        if (v7 < 3) {
          BOOL v19 = 1;
        }
        unint64_t v20 = v19 | (2 * v7);
        unint64_t v21 = vcvtps_u32_f32(v17 / v18);
        if (v20 <= v21) {
          size_t v22 = v21;
        }
        else {
          size_t v22 = v20;
        }
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v22);
        unint64_t v7 = *(void *)(a1 + 8);
        if ((v7 & (v7 - 1)) != 0)
        {
          if (v11 >= v7) {
            unint64_t v2 = v11 % v7;
          }
          else {
            unint64_t v2 = v11;
          }
        }
        else
        {
          unint64_t v2 = (v7 - 1) & v11;
        }
      }
      uint64_t v23 = *(void *)a1;
      unint64_t v24 = *(void **)(*(void *)a1 + 8 * v2);
      if (v24)
      {
        void *v16 = *v24;
      }
      else
      {
        void *v16 = *v6;
        void *v6 = v16;
        *(void *)(v23 + 8 * v2) = v6;
        if (!*v16) {
          goto LABEL_40;
        }
        unint64_t v25 = *(void *)(*v16 + 8);
        if ((v7 & (v7 - 1)) != 0)
        {
          if (v25 >= v7) {
            v25 %= v7;
          }
        }
        else
        {
          v25 &= v7 - 1;
        }
        unint64_t v24 = (void *)(*(void *)a1 + 8 * v25);
      }
      void *v24 = v16;
LABEL_40:
      ++*(void *)(a1 + 24);
LABEL_41:
      uint64_t v5 = (void *)*v5;
    }
    while (v5);
  }
  return a1;
}

void sub_1955F8214(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>>>::__node_insert_multi(uint64_t a1, void *a2)
{
  unint64_t v4 = a2[2];
  unint64_t v5 = HIDWORD(v4);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (((8 * v4) + 8) ^ HIDWORD(v4));
  unint64_t v7 = 0x9DDFEA08EB382D69
     * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
  a2[1] = v7;
  unint64_t v8 = *(void *)(a1 + 8);
  float v9 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v10 = *(float *)(a1 + 32);
  if (!v8 || (float)(v10 * (float)v8) < v9)
  {
    BOOL v11 = 1;
    if (v8 >= 3) {
      BOOL v11 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v12 = v11 | (2 * v8);
    unint64_t v13 = vcvtps_u32_f32(v9 / v10);
    if (v12 <= v13) {
      int8x8_t prime = (int8x8_t)v13;
    }
    else {
      int8x8_t prime = (int8x8_t)v12;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v8 = *(void *)(a1 + 8);
    }
    if (*(void *)&prime > v8) {
      goto LABEL_92;
    }
    if (*(void *)&prime >= v8) {
      goto LABEL_43;
    }
    unint64_t v21 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (v8 < 3 || (uint8x8_t v22 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v22.i16[0] = vaddlv_u8(v22), v22.u32[0] > 1uLL))
    {
      unint64_t v21 = std::__next_prime(v21);
    }
    else
    {
      uint64_t v23 = 1 << -(char)__clz(v21 - 1);
      if (v21 >= 2) {
        unint64_t v21 = v23;
      }
    }
    if (*(void *)&prime <= v21) {
      int8x8_t prime = (int8x8_t)v21;
    }
    if (*(void *)&prime >= v8)
    {
      unint64_t v8 = *(void *)(a1 + 8);
      goto LABEL_43;
    }
    if (prime)
    {
LABEL_92:
      if (*(void *)&prime >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v15 = operator new(8 * *(void *)&prime);
      BOOL v16 = *(void **)a1;
      *(void *)a1 = v15;
      if (v16) {
        operator delete(v16);
      }
      uint64_t v17 = 0;
      *(int8x8_t *)(a1 + 8) = prime;
      do
        *(void *)(*(void *)a1 + 8 * v17++) = 0;
      while (*(void *)&prime != v17);
      float v18 = *(void **)(a1 + 16);
      if (v18)
      {
        unint64_t v19 = v18[1];
        uint8x8_t v20 = (uint8x8_t)vcnt_s8(prime);
        v20.i16[0] = vaddlv_u8(v20);
        if (v20.u32[0] > 1uLL)
        {
          if (v19 >= *(void *)&prime) {
            v19 %= *(void *)&prime;
          }
        }
        else
        {
          v19 &= *(void *)&prime - 1;
        }
        *(void *)(*(void *)a1 + 8 * v19) = a1 + 16;
        for (uint64_t i = (void *)*v18; *v18; uint64_t i = (void *)*v18)
        {
          unint64_t v25 = i[1];
          if (v20.u32[0] > 1uLL)
          {
            if (v25 >= *(void *)&prime) {
              v25 %= *(void *)&prime;
            }
          }
          else
          {
            v25 &= *(void *)&prime - 1;
          }
          if (v25 == v19)
          {
            float v18 = i;
          }
          else
          {
            char v26 = i;
            if (*(void *)(*(void *)a1 + 8 * v25))
            {
              do
              {
                unsigned int v27 = v26;
                char v26 = (void *)*v26;
              }
              while (v26 && i[2] == v26[2]);
              *float v18 = v26;
              void *v27 = **(void **)(*(void *)a1 + 8 * v25);
              **(void **)(*(void *)a1 + 8 * v25) = i;
            }
            else
            {
              *(void *)(*(void *)a1 + 8 * v25) = v18;
              float v18 = i;
              unint64_t v19 = v25;
            }
          }
        }
      }
      unint64_t v8 = (unint64_t)prime;
    }
    else
    {
      char v39 = *(void **)a1;
      *(void *)a1 = 0;
      if (v39) {
        operator delete(v39);
      }
      unint64_t v8 = 0;
      *(void *)(a1 + 8) = 0;
    }
  }
LABEL_43:
  uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
  v28.i16[0] = vaddlv_u8(v28);
  if (v28.u32[0] > 1uLL)
  {
    unint64_t v29 = v7;
    if (v8 <= v7) {
      unint64_t v29 = v7 % v8;
    }
  }
  else
  {
    unint64_t v29 = (v8 - 1) & v7;
  }
  uint64_t v30 = *(void **)(*(void *)a1 + 8 * v29);
  if (v30)
  {
    int v31 = 0;
    do
    {
      char v32 = v30;
      uint64_t v30 = (void *)*v30;
      if (!v30) {
        break;
      }
      unint64_t v33 = v30[1];
      if (v28.u32[0] > 1uLL)
      {
        unint64_t v34 = v30[1];
        if (v33 >= v8) {
          unint64_t v34 = v33 % v8;
        }
      }
      else
      {
        unint64_t v34 = v33 & (v8 - 1);
      }
      if (v34 != v29) {
        break;
      }
      BOOL v35 = v33 == v7 && v30[2] == a2[2];
      int v36 = v31 & !v35;
      v31 |= v35;
    }
    while (v36 != 1);
  }
  else
  {
    char v32 = 0;
  }
  unint64_t v37 = a2[1];
  if (v28.u32[0] > 1uLL)
  {
    if (v37 >= v8) {
      v37 %= v8;
    }
  }
  else
  {
    v37 &= v8 - 1;
  }
  if (!v32)
  {
    *a2 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = a2;
    *(void *)(*(void *)a1 + 8 * v37) = a1 + 16;
    if (!*a2) {
      goto LABEL_79;
    }
    unint64_t v38 = *(void *)(*a2 + 8);
    if (v28.u32[0] > 1uLL)
    {
      if (v38 >= v8) {
        v38 %= v8;
      }
    }
    else
    {
      v38 &= v8 - 1;
    }
LABEL_78:
    *(void *)(*(void *)a1 + 8 * v38) = a2;
    goto LABEL_79;
  }
  *a2 = *v32;
  *char v32 = a2;
  if (*a2)
  {
    unint64_t v38 = *(void *)(*a2 + 8);
    if (v28.u32[0] > 1uLL)
    {
      if (v38 >= v8) {
        v38 %= v8;
      }
    }
    else
    {
      v38 &= v8 - 1;
    }
    if (v38 != v37) {
      goto LABEL_78;
    }
  }
LABEL_79:
  ++*(void *)(a1 + 24);
}

uint64_t std::vector<mlcore::MultiSortDescriptor>::__construct_one_at_end[abi:ne180100]<mlcore::MultiSortDescriptor const&>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  *(void *)uint64_t v4 = MEMORY[0x1E4F76AA0] + 16;
  uint64_t result = std::unordered_map<mlcore::EntityClass *,mlcore::ModelPropertyBase *>::unordered_map(v4 + 8, a2 + 8);
  *(_DWORD *)(v4 + 48) = *(_DWORD *)(a2 + 48);
  *(void *)(a1 + 8) = v4 + 56;
  return result;
}

void sub_1955F8700(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<mlcore::MultiSortDescriptor>::__push_back_slow_path<mlcore::MultiSortDescriptor const&>(int64x2_t *a1, uint64_t a2)
{
  uint64_t v2 = 0x6DB6DB6DB6DB6DB7 * ((a1->i64[1] - a1->i64[0]) >> 3);
  unint64_t v3 = v2 + 1;
  if ((unint64_t)(v2 + 1) > 0x492492492492492) {
    std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
  }
  unint64_t v6 = a1 + 1;
  if (0xDB6DB6DB6DB6DB6ELL * ((a1[1].i64[0] - a1->i64[0]) >> 3) > v3) {
    unint64_t v3 = 0xDB6DB6DB6DB6DB6ELL * ((a1[1].i64[0] - a1->i64[0]) >> 3);
  }
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((a1[1].i64[0] - a1->i64[0]) >> 3)) >= 0x249249249249249) {
    unint64_t v7 = 0x492492492492492;
  }
  else {
    unint64_t v7 = v3;
  }
  uint64_t v23 = (uint64_t *)v6;
  if (v7)
  {
    float v9 = std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::MultiSortDescriptor>>(v7);
  }
  else
  {
    float v9 = 0;
    uint64_t v8 = 0;
  }
  float v10 = &v9[14 * v2];
  uint8x8_t v20 = v9;
  v21.i64[0] = (uint64_t)v10;
  v21.i64[1] = (uint64_t)v10;
  uint8x8_t v22 = (char *)&v9[14 * v8];
  void *v10 = MEMORY[0x1E4F76AA0] + 16;
  std::unordered_map<mlcore::EntityClass *,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)(v10 + 1), a2 + 8);
  v9[14 * v2 + 12] = *(_DWORD *)(a2 + 48);
  uint64_t v12 = a1->i64[0];
  unint64_t v11 = a1->u64[1];
  uint64_t v13 = v21.i64[1];
  uint64_t v14 = v21.i64[0];
  if (v11 == a1->i64[0])
  {
    int64x2_t v16 = vdupq_n_s64(v11);
  }
  else
  {
    uint64_t v15 = 0;
    do
    {
      *(void *)(v14 + v15 - 56) = MEMORY[0x1E4F76AA0] + 16;
      std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>>>::__hash_table(v14 + v15 - 48, (uint64_t *)(v11 + v15 - 48));
      *(_DWORD *)(v14 + v15 - 8) = *(_DWORD *)(v11 + v15 - 8);
      v15 -= 56;
    }
    while (v11 + v15 != v12);
    v14 += v15;
    int64x2_t v16 = *a1;
  }
  uint64_t v17 = v13 + 56;
  a1->i64[0] = v14;
  a1->i64[1] = v17;
  int64x2_t v21 = v16;
  float v18 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v22;
  uint8x8_t v22 = v18;
  uint8x8_t v20 = (_DWORD *)v16.i64[0];
  std::__split_buffer<mlcore::MultiSortDescriptor>::~__split_buffer((uint64_t)&v20);
  return v17;
}

void sub_1955F88D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<mlcore::MultiSortDescriptor>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1955F8A58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1955F8C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MPContainerUniqueIDPrefix(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 universalStore];
  uint64_t v3 = [v2 subscriptionAdamID];

  if (!v3)
  {
    uint64_t v4 = [v1 universalStore];
    [v4 adamID];
  }
  unint64_t v5 = [v1 universalStore];
  unint64_t v6 = [v5 universalCloudLibraryID];
  unint64_t v7 = [v1 universalStore];
  [v7 purchasedAdamID];
  uint64_t v8 = [v1 library];
  [v8 persistentID];
  float v9 = ML3ContainerItemOccurrencePrefix();

  return v9;
}

uint64_t __Block_byref_object_copy__54644(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__54645(uint64_t a1)
{
}

void sub_1956096E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSFRestrictionsPasscodeControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!SettingsFoundationLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __SettingsFoundationLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E57F99D0;
    uint64_t v8 = 0;
    SettingsFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SettingsFoundationLibraryCore_frameworkLibrary)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *SettingsFoundationLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"MPRestrictionsMonitor.m", 47, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("SFRestrictionsPasscodeController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v5 = [NSString stringWithUTF8String:"Class getSFRestrictionsPasscodeControllerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"MPRestrictionsMonitor.m", 48, @"Unable to find class %s", "SFRestrictionsPasscodeController");

LABEL_10:
    __break(1u);
  }
  getSFRestrictionsPasscodeControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SettingsFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SettingsFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_19560A678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__55910(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__55911(uint64_t a1)
{
}

void sub_19560E304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getSSDownloadExternalPropertyRentalInformation()
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v0 = (void **)getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr;
  uint64_t v9 = getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr;
  if (!getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr)
  {
    id v1 = StoreServicesLibrary();
    v7[3] = (uint64_t)dlsym(v1, "SSDownloadExternalPropertyRentalInformation");
    getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr = v7[3];
    v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v5 = [NSString stringWithUTF8String:"NSString *getSSDownloadExternalPropertyRentalInformation(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"MPStoreDownload.m", 30, @"%s", dlerror());

    __break(1u);
  }
}

void sub_19560ECBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSSDownloadExternalPropertyRentalInformationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadExternalPropertyRentalInformation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void *StoreServicesLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!StoreServicesLibraryCore_frameworkLibrary_55921)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __StoreServicesLibraryCore_block_invoke_55922;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E57F9E60;
    uint64_t v6 = 0;
    StoreServicesLibraryCore_frameworkLibrary_55921 = _sl_dlopen();
  }
  v0 = (void *)StoreServicesLibraryCore_frameworkLibrary_55921;
  if (!StoreServicesLibraryCore_frameworkLibrary_55921)
  {
    v0 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *StoreServicesLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPStoreDownload.m", 22, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __StoreServicesLibraryCore_block_invoke_55922()
{
  uint64_t result = _sl_dlopen();
  StoreServicesLibraryCore_frameworkLibrary_55921 = result;
  return result;
}

void getSSDownloadPropertyStoreItemIdentifier()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v0 = (void **)getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr;
  uint64_t v9 = getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr;
  if (!getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr)
  {
    id v1 = StoreServicesLibrary();
    v7[3] = (uint64_t)dlsym(v1, "SSDownloadPropertyStoreItemIdentifier");
    getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr = v7[3];
    v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyStoreItemIdentifier(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"MPStoreDownload.m", 46, @"%s", dlerror());

    __break(1u);
  }
}

void sub_19560F104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSSDownloadPropertyStoreItemIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyStoreItemIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void getSSDownloadPropertyReason()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v0 = (void **)getSSDownloadPropertyReasonSymbolLoc_ptr;
  uint64_t v9 = getSSDownloadPropertyReasonSymbolLoc_ptr;
  if (!getSSDownloadPropertyReasonSymbolLoc_ptr)
  {
    id v1 = StoreServicesLibrary();
    v7[3] = (uint64_t)dlsym(v1, "SSDownloadPropertyReason");
    getSSDownloadPropertyReasonSymbolLoc_ptr = v7[3];
    v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyReason(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"MPStoreDownload.m", 48, @"%s", dlerror());

    __break(1u);
  }
}

void sub_19560F394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSSDownloadPropertyReasonSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyReason");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyReasonSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19560FD40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSSDownloadPhaseCanceledSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPhaseCanceled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPhaseCanceledSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPhaseDataRestoreSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPhaseDataRestore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPhaseDataRestoreSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPhaseDownloadingSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPhaseDownloading");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPhaseDownloadingSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPhaseFailedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPhaseFailed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPhaseFailedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPhaseFinishedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPhaseFinished");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPhaseFinishedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPhaseInstallingSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPhaseInstalling");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPhaseInstallingSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void getSSDownloadPhasePaused()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v0 = (void **)getSSDownloadPhasePausedSymbolLoc_ptr;
  uint64_t v9 = getSSDownloadPhasePausedSymbolLoc_ptr;
  if (!getSSDownloadPhasePausedSymbolLoc_ptr)
  {
    id v1 = StoreServicesLibrary();
    v7[3] = (uint64_t)dlsym(v1, "SSDownloadPhasePaused");
    getSSDownloadPhasePausedSymbolLoc_ptr = v7[3];
    v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSString *getSSDownloadPhasePaused(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"MPStoreDownload.m", 37, @"%s", dlerror());

    __break(1u);
  }
}

void sub_19561009C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getSSDownloadPhasePreflight()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v0 = (void **)getSSDownloadPhasePreflightSymbolLoc_ptr;
  uint64_t v9 = getSSDownloadPhasePreflightSymbolLoc_ptr;
  if (!getSSDownloadPhasePreflightSymbolLoc_ptr)
  {
    id v1 = StoreServicesLibrary();
    v7[3] = (uint64_t)dlsym(v1, "SSDownloadPhasePreflight");
    getSSDownloadPhasePreflightSymbolLoc_ptr = v7[3];
    v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSString *getSSDownloadPhasePreflight(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"MPStoreDownload.m", 38, @"%s", dlerror());

    __break(1u);
  }
}

void sub_195610204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getSSDownloadPhaseProcessing()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v0 = (void **)getSSDownloadPhaseProcessingSymbolLoc_ptr;
  uint64_t v9 = getSSDownloadPhaseProcessingSymbolLoc_ptr;
  if (!getSSDownloadPhaseProcessingSymbolLoc_ptr)
  {
    id v1 = StoreServicesLibrary();
    v7[3] = (uint64_t)dlsym(v1, "SSDownloadPhaseProcessing");
    getSSDownloadPhaseProcessingSymbolLoc_ptr = v7[3];
    v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSString *getSSDownloadPhaseProcessing(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"MPStoreDownload.m", 39, @"%s", dlerror());

    __break(1u);
  }
}

void sub_19561036C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getSSDownloadPhaseWaiting()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v0 = (void **)getSSDownloadPhaseWaitingSymbolLoc_ptr;
  uint64_t v9 = getSSDownloadPhaseWaitingSymbolLoc_ptr;
  if (!getSSDownloadPhaseWaitingSymbolLoc_ptr)
  {
    id v1 = StoreServicesLibrary();
    v7[3] = (uint64_t)dlsym(v1, "SSDownloadPhaseWaiting");
    getSSDownloadPhaseWaitingSymbolLoc_ptr = v7[3];
    v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSString *getSSDownloadPhaseWaiting(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"MPStoreDownload.m", 40, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1956104D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSSDownloadPhaseWaitingSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPhaseWaiting");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPhaseWaitingSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPhaseProcessingSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPhaseProcessing");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPhaseProcessingSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPhasePreflightSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPhasePreflight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPhasePreflightSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPhasePausedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPhasePaused");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPhasePausedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void getSSDownloadPropertyLibraryItemIdentifier()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v0 = (void **)getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr;
  uint64_t v9 = getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr;
  if (!getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr)
  {
    id v1 = StoreServicesLibrary();
    v7[3] = (uint64_t)dlsym(v1, "SSDownloadPropertyLibraryItemIdentifier");
    getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr = v7[3];
    v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyLibraryItemIdentifier(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"MPStoreDownload.m", 47, @"%s", dlerror());

    __break(1u);
  }
}

void sub_195610818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyLibraryItemIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_195610A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSSDownloadPropertyIsRestoreSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyIsRestore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyIsRestoreSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_195612580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
}

void __getSSPurchaseClass_block_invoke(uint64_t a1)
{
  StoreServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SSPurchase");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSPurchaseClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getSSPurchaseClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPStoreDownload.m", 26, @"Unable to find class %s", "SSPurchase");

    __break(1u);
  }
}

void *__getSSDownloadPropertyTitleSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyTitle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyTitleSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyKindSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyKind");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyKindSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyHandlerIDSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyHandlerID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyHandlerIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyStoreSagaIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyStoreSagaIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyStoreSagaIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyClientBundleIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyClientBundleIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadKindMusicSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadKindMusic");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadKindMusicSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getSSDownloadPolicyClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSSDownloadPolicyClass_softClass;
  uint64_t v7 = getSSDownloadPolicyClass_softClass;
  if (!getSSDownloadPolicyClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSSDownloadPolicyClass_block_invoke;
    v3[3] = &unk_1E57FA300;
    v3[4] = &v4;
    __getSSDownloadPolicyClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_195612944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSSDownloadPolicyRuleClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSSDownloadPolicyRuleClass_softClass;
  uint64_t v7 = getSSDownloadPolicyRuleClass_softClass;
  if (!getSSDownloadPolicyRuleClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSSDownloadPolicyRuleClass_block_invoke;
    v3[3] = &unk_1E57FA300;
    v3[4] = &v4;
    __getSSDownloadPolicyRuleClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_195612A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSSDownloadSizeLimitNoLimitSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadSizeLimitNoLimit");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadSizeLimitNoLimitSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __getSSDownloadPolicyUserDefaultStateClass_block_invoke(uint64_t a1)
{
  StoreServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SSDownloadPolicyUserDefaultState");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSDownloadPolicyUserDefaultStateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getSSDownloadPolicyUserDefaultStateClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPStoreDownload.m", 28, @"Unable to find class %s", "SSDownloadPolicyUserDefaultState");

    __break(1u);
  }
}

void *__getSSDownloadSizeLimitDisabledSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadSizeLimitDisabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadSizeLimitDisabledSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyShouldCancelOnFailureSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyShouldCancelOnFailure");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyShouldCancelOnFailureSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyShouldSuppressErrorDialogsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyShouldSuppressErrorDialogs");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyShouldSuppressErrorDialogsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void __getSSMutableURLRequestPropertiesClass_block_invoke(uint64_t a1)
{
  StoreServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SSMutableURLRequestProperties");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSMutableURLRequestPropertiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getSSMutableURLRequestPropertiesClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPStoreDownload.m", 24, @"Unable to find class %s", "SSMutableURLRequestProperties");

    __break(1u);
  }
}

void __getSSDownloadPolicyRuleClass_block_invoke(uint64_t a1)
{
  StoreServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SSDownloadPolicyRule");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSDownloadPolicyRuleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getSSDownloadPolicyRuleClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPStoreDownload.m", 23, @"Unable to find class %s", "SSDownloadPolicyRule");

    __break(1u);
  }
}

void __getSSDownloadPolicyClass_block_invoke(uint64_t a1)
{
  StoreServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SSDownloadPolicy");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSDownloadPolicyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getSSDownloadPolicyClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPStoreDownload.m", 25, @"Unable to find class %s", "SSDownloadPolicy");

    __break(1u);
  }
}

void sub_195612FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSSDownloadClass_block_invoke(uint64_t a1)
{
  StoreServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SSDownload");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSDownloadClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getSSDownloadClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPStoreDownload.m", 27, @"Unable to find class %s", "SSDownload");

    __break(1u);
  }
}

__CFString *MPStoreDownloadSSDownloadKindFromMPMediaType(__int16 a1)
{
  id v1 = @"feature-movie";
  uint64_t v2 = @"tv-episode";
  id v3 = @"book";
  uint64_t v4 = @"podcast";
  long long v5 = @"videoPodcast";
  if ((a1 & 0x400) == 0) {
    long long v5 = @"song";
  }
  if ((a1 & 2) == 0) {
    uint64_t v4 = v5;
  }
  if ((a1 & 4) == 0) {
    id v3 = v4;
  }
  if ((a1 & 0x200) == 0) {
    uint64_t v2 = v3;
  }
  if ((a1 & 0x100) == 0) {
    id v1 = v2;
  }
  if ((a1 & 0x800) != 0) {
    return @"music-video";
  }
  else {
    return v1;
  }
}

uint64_t MPStoreDownloadAdditionalBuyParametersForOriginator(uint64_t a1)
{
  return [NSString stringWithFormat:@"&reporting=%@", a1];
}

id MPStoreDownloadOriginatorWithStationInformation(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = (void *)[a1 mutableCopy];
  uint64_t v7 = v6;
  if (v6)
  {
    if (a3) {
      objc_msgSend(v6, "appendFormat:", @";stationId:%llu", a3);
    }
    if (v5) {
      [v7 appendFormat:@";stationHash:%@", v5];
    }
    id v8 = v7;
  }

  return v7;
}

void sub_195613FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSSDownloadPhaseFinishedSymbolLoc_block_invoke_56184(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadPhaseFinished");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPhaseFinishedSymbolLoc_ptr_56183 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *StoreServicesLibrary_56185()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!StoreServicesLibraryCore_frameworkLibrary_56202)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __StoreServicesLibraryCore_block_invoke_56203;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E57FA1D0;
    uint64_t v6 = 0;
    StoreServicesLibraryCore_frameworkLibrary_56202 = _sl_dlopen();
  }
  v0 = (void *)StoreServicesLibraryCore_frameworkLibrary_56202;
  if (!StoreServicesLibraryCore_frameworkLibrary_56202)
  {
    v0 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *StoreServicesLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPStoreDownloadManager.m", 35, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void getSSDownloadPropertyLibraryItemIdentifier_56192()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v0 = (void **)getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr_56194;
  uint64_t v9 = getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr_56194;
  if (!getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr_56194)
  {
    id v1 = StoreServicesLibrary_56185();
    v7[3] = (uint64_t)dlsym(v1, "SSDownloadPropertyLibraryItemIdentifier");
    getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr_56194 = v7[3];
    v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyLibraryItemIdentifier(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"MPStoreDownloadManager.m", 53, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1956142C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_block_invoke_56195(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadPropertyLibraryItemIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyLibraryItemIdentifierSymbolLoc_ptr_56194 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

uint64_t __StoreServicesLibraryCore_block_invoke_56203()
{
  uint64_t result = _sl_dlopen();
  StoreServicesLibraryCore_frameworkLibrary_56202 = result;
  return result;
}

void sub_195614984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
}

id getSSPurchaseClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSSPurchaseClass_softClass_56215;
  uint64_t v7 = getSSPurchaseClass_softClass_56215;
  if (!getSSPurchaseClass_softClass_56215)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSSPurchaseClass_block_invoke_56216;
    v3[3] = &unk_1E57FA300;
    v3[4] = &v4;
    __getSSPurchaseClass_block_invoke_56216((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_195614A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSSDownloadClass_block_invoke_56209(uint64_t a1)
{
  StoreServicesLibrary_56185();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SSDownload");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSDownloadClass_softClass_56208 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getSSDownloadClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPStoreDownloadManager.m", 41, @"Unable to find class %s", "SSDownload");

    __break(1u);
  }
}

void __getSSPurchaseClass_block_invoke_56216(uint64_t a1)
{
  StoreServicesLibrary_56185();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SSPurchase");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSPurchaseClass_softClass_56215 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getSSPurchaseClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPStoreDownloadManager.m", 40, @"Unable to find class %s", "SSPurchase");

    __break(1u);
  }
}

void *__getSSDownloadPropertyClientBundleIdentifierSymbolLoc_block_invoke_56221(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadPropertyClientBundleIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr_56220 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

void *__getSSDownloadPropertyKindSymbolLoc_block_invoke_56225(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadPropertyKind");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyKindSymbolLoc_ptr_56224 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void getSSDownloadPropertyStoreItemIdentifier_56240()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v0 = (void **)getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr_56241;
  uint64_t v9 = getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr_56241;
  if (!getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr_56241)
  {
    id v1 = StoreServicesLibrary_56185();
    v7[3] = (uint64_t)dlsym(v1, "SSDownloadPropertyStoreItemIdentifier");
    getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr_56241 = v7[3];
    v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyStoreItemIdentifier(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"MPStoreDownloadManager.m", 56, @"%s", dlerror());

    __break(1u);
  }
}

void sub_195616074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSSDownloadPropertyStoreItemIdentifierSymbolLoc_block_invoke_56242(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadPropertyStoreItemIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr_56241 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t __Block_byref_object_copy__56245(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__56246(uint64_t a1)
{
}

void soft_SSDownloadPhaseIsFinishedPhase(void *a1)
{
  id v1 = a1;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v2 = (void (*)(id))getSSDownloadPhaseIsFinishedPhaseSymbolLoc_ptr;
  uint64_t v9 = getSSDownloadPhaseIsFinishedPhaseSymbolLoc_ptr;
  if (!getSSDownloadPhaseIsFinishedPhaseSymbolLoc_ptr)
  {
    id v3 = StoreServicesLibrary_56185();
    v7[3] = (uint64_t)dlsym(v3, "SSDownloadPhaseIsFinishedPhase");
    getSSDownloadPhaseIsFinishedPhaseSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    uint64_t v2 = (void (*)(id))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v2)
  {
    v2(v1);
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"BOOL soft_SSDownloadPhaseIsFinishedPhase(NSString *__strong)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"MPStoreDownloadManager.m", 72, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1956174E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getSSDownloadPhaseFailed()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v0 = (void **)getSSDownloadPhaseFailedSymbolLoc_ptr_56282;
  uint64_t v9 = getSSDownloadPhaseFailedSymbolLoc_ptr_56282;
  if (!getSSDownloadPhaseFailedSymbolLoc_ptr_56282)
  {
    id v1 = StoreServicesLibrary_56185();
    v7[3] = (uint64_t)dlsym(v1, "SSDownloadPhaseFailed");
    getSSDownloadPhaseFailedSymbolLoc_ptr_56282 = v7[3];
    v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSString *getSSDownloadPhaseFailed(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"MPStoreDownloadManager.m", 71, @"%s", dlerror());

    __break(1u);
  }
}

void sub_195617648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSSDownloadPhaseFailedSymbolLoc_block_invoke_56283(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadPhaseFailed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPhaseFailedSymbolLoc_ptr_56282 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPhaseIsFinishedPhaseSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadPhaseIsFinishedPhase");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPhaseIsFinishedPhaseSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19561AD54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19561AFA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_19561B588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSSDownloadKindMusicSymbolLoc_block_invoke_56320(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadKindMusic");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadKindMusicSymbolLoc_ptr_56319 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadKindMusicVideoSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadKindMusicVideo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadKindMusicVideoSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadExternalPropertyBytesDownloaded");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadExternalPropertyPercentCompleteSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadExternalPropertyPercentComplete");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadExternalPropertyPolicySizeLimit");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadExternalPropertyRentalInformationSymbolLoc_block_invoke_56330(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadExternalPropertyRentalInformation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr_56329 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);
  return result;
}

void *__getSSDownloadPropertyDownloadPhaseSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadPropertyDownloadPhase");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyEncodedErrorDataSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadPropertyEncodedErrorData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyIsRestoreSymbolLoc_block_invoke_56336(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadPropertyIsRestore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyIsRestoreSymbolLoc_ptr_56335 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyPreferredAssetFlavorSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadPropertyPreferredAssetFlavor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyPreferredAssetFlavorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyReasonSymbolLoc_block_invoke_56341(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadPropertyReason");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyReasonSymbolLoc_ptr_56340 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyThumbnailImageURLSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadPropertyThumbnailImageURL");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyThumbnailImageURLSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyTitleSymbolLoc_block_invoke_56346(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadPropertyTitle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyTitleSymbolLoc_ptr_56345 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyHandlerIDSymbolLoc_block_invoke_56350(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadPropertyHandlerID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyHandlerIDSymbolLoc_ptr_56349 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyCollectionNameSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadPropertyCollectionName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyCollectionNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadKindMovieSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadKindMovie");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadKindMovieSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadKindTelevisionEpisodeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = StoreServicesLibrary_56185();
  uint64_t result = dlsym(v2, "SSDownloadKindTelevisionEpisode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadKindTelevisionEpisodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *_MPStoreDownloadManagerInt64KeyPointerFunctionDescription(void *a1)
{
  if (a1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lli", *a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = @"0";
  }
  return v2;
}

uint64_t _MPStoreDownloadManagerInt64KeyPointerFunctionSize()
{
  return 8;
}

BOOL _MPStoreDownloadManagerInt64KeyPointerFunctionIsEqual(void *a1, void *a2)
{
  if (a1 == a2) {
    return 1;
  }
  BOOL result = 0;
  if (a1)
  {
    if (a2) {
      return *a1 == *a2;
    }
  }
  return result;
}

void _MPStoreDownloadManagerInt64KeyPointerFunctionRelinquish(void *a1)
{
  if (a1) {
    free(a1);
  }
}

void *_MPStoreDownloadManagerInt64KeyPointerFunctionAcquire(const void *a1, uint64_t (*a2)(void))
{
  if (!a1) {
    return 0;
  }
  size_t v3 = a2();
  uint64_t v4 = malloc_type_malloc(v3, 0xC2C006DuLL);
  memcpy(v4, a1, v3);
  return v4;
}

void sub_19561C900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,char a25)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__56494(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__56495(uint64_t a1)
{
}

uint64_t MPSubscriptionStatusCapabilitiesForSubscriptionStatus(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 hasCapability:1];
  int v3 = [v1 hasCapability:256];

  if (v3) {
    return v2 | 2;
  }
  else {
    return v2;
  }
}

BOOL MPPMediaPredicateReadFrom(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  long long v5 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v6 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v7 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_49:
    BOOL v25 = v4[*v7] == 0;
    goto LABEL_50;
  }
  uint64_t v8 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v7]) {
      goto LABEL_49;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = *v5;
      unint64_t v13 = *(void *)&v4[v12];
      if (v13 == -1 || v13 >= *(void *)&v4[*v6]) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)&v4[*v8] + v13);
      *(void *)&v4[v12] = v13 + 1;
      v11 |= (unint64_t)(v14 & 0x7F) << v9;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v9 += 7;
      BOOL v15 = v10++ >= 9;
      if (v15)
      {
        LODWORD(v11) = 0;
        int v16 = v4[*v7];
        goto LABEL_14;
      }
    }
    v4[*v7] = 1;
LABEL_12:
    int v16 = v4[*v7];
    if (v4[*v7]) {
      LODWORD(v11) = 0;
    }
LABEL_14:
    if (v16 || (v11 & 7) == 4) {
      goto LABEL_49;
    }
    switch((unsigned __int16)(v11 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *((unsigned char *)v3 + 52) |= 1u;
        while (1)
        {
          uint64_t v21 = *v5;
          unint64_t v22 = *(void *)&v4[v21];
          if (v22 == -1 || v22 >= *(void *)&v4[*v6]) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)&v4[*v8] + v22);
          *(void *)&v4[v21] = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_46;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_48;
          }
        }
        v4[*v7] = 1;
LABEL_46:
        if (v4[*v7]) {
          LODWORD(v20) = 0;
        }
LABEL_48:
        *((_DWORD *)v3 + 12) = v20;
        goto LABEL_43;
      case 2u:
        unint64_t v24 = objc_alloc_init(MPPPropertyPredicate);
        objc_storeStrong((id *)v3 + 4, v24);
        if (!PBReaderPlaceMark() || !MPPPropertyPredicateReadFrom(v24, v4)) {
          goto LABEL_51;
        }
        goto LABEL_42;
      case 3u:
        unint64_t v24 = objc_alloc_init(MPPCompoundPredicate);
        objc_storeStrong((id *)v3 + 1, v24);
        if (!PBReaderPlaceMark() || (MPPCompoundPredicateReadFrom(v24, v4) & 1) == 0) {
          goto LABEL_51;
        }
        goto LABEL_42;
      case 4u:
        unint64_t v24 = objc_alloc_init(MPPConditionalPredicate);
        objc_storeStrong((id *)v3 + 2, v24);
        if (!PBReaderPlaceMark() || !MPPConditionalPredicateReadFrom(v24, v4)) {
          goto LABEL_51;
        }
        goto LABEL_42;
      case 5u:
        unint64_t v24 = objc_alloc_init(MPPPersistentIDsPredicate);
        objc_storeStrong((id *)v3 + 3, v24);
        if (!PBReaderPlaceMark() || !MPPPersistentIDsPredicateReadFrom(v24, v4)) {
          goto LABEL_51;
        }
        goto LABEL_42;
      case 6u:
        unint64_t v24 = objc_alloc_init(MPPSearchStringPredicate);
        objc_storeStrong((id *)v3 + 5, v24);
        if (PBReaderPlaceMark() && MPPSearchStringPredicateReadFrom(v24, v4))
        {
LABEL_42:
          PBReaderRecallMark();

LABEL_43:
          if (*(void *)&v4[*v5] >= *(void *)&v4[*v6]) {
            goto LABEL_49;
          }
          continue;
        }
LABEL_51:

LABEL_52:
        BOOL v25 = 0;
LABEL_50:

        return v25;
      default:
        if (!PBReaderSkipValueWithTag()) {
          goto LABEL_52;
        }
        goto LABEL_43;
    }
  }
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1F40E6000]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x1F4183358]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1F4184640]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x1F4184DF0]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x1F41851A0](isUnique, capacity);
}

uint64_t type metadata accessor for _NativeDictionary()
{
  return MEMORY[0x1F41851E0]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x1F4185598]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1F4185EB0]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t dispatch thunk of Decoder.codingPath.getter()
{
  return MEMORY[0x1F4185FA8]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97B8](md, c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C97C8](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40D75D0](bundle, key);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1F40D9870](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1F40D9878](context);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGSize CGSizeFromString(NSString *string)
{
  MEMORY[0x1F4166A88](string);
  result.height = v2;
  result.width = v1;
  return result;
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC0E0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1F40DC190](range, time);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1F40DC1A8](allocator, range);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1F40DC1B0](range1, range2);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1C8](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D8](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t HSLibraryCacheDirectoryForIdentifier()
{
  return MEMORY[0x1F4122798]();
}

uint64_t HSLibraryCacheRootDirectory()
{
  return MEMORY[0x1F41227A0]();
}

uint64_t ICBundleIdentifierForSystemApplicationType()
{
  return MEMORY[0x1F4177BF8]();
}

uint64_t ICCloudClientMigrateAllowMatchOnCellularToAllowAutoDownloadOnCellular()
{
  return MEMORY[0x1F4177C00]();
}

uint64_t ICCreateLoggableValueForDSIDString()
{
  return MEMORY[0x1F4177C10]();
}

uint64_t ICEnvironmentNetworkTypeIsCellular()
{
  return MEMORY[0x1F4177C20]();
}

uint64_t ICFairPlayGetHardwareInfo()
{
  return MEMORY[0x1F4177C38]();
}

uint64_t ICStoreVideoArtworkInfoBestSizesForSize()
{
  return MEMORY[0x1F4177C50]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MIPMultiverseIdentifierReadFrom()
{
  return MEMORY[0x1F4130500]();
}

uint64_t ML3ArtworkPurgeabilityLevelCache()
{
  return MEMORY[0x1F4130508]();
}

uint64_t ML3ContainerItemOccurrenceID()
{
  return MEMORY[0x1F4130510]();
}

uint64_t ML3ContainerItemOccurrencePrefix()
{
  return MEMORY[0x1F4130518]();
}

uint64_t MRAVEndpointCopyLocalizedName()
{
  return MEMORY[0x1F412DAF8]();
}

uint64_t MRAVEndpointCopyOutputDevices()
{
  return MEMORY[0x1F412DB08]();
}

uint64_t MRAVEndpointGetClass()
{
  return MEMORY[0x1F412DB20]();
}

uint64_t MRAVEndpointGetDesignatedGroupLeader()
{
  return MEMORY[0x1F412DB28]();
}

uint64_t MRAVEndpointGetExternalDevice()
{
  return MEMORY[0x1F412DB30]();
}

uint64_t MRAVEndpointGetLocalEndpoint()
{
  return MEMORY[0x1F412DB38]();
}

uint64_t MRAVEndpointGetOutputDeviceVolume()
{
  return MEMORY[0x1F412DB58]();
}

uint64_t MRAVEndpointGetOutputDeviceVolumeControlCapabilities()
{
  return MEMORY[0x1F412DB60]();
}

uint64_t MRAVEndpointGetVolume()
{
  return MEMORY[0x1F412DB68]();
}

uint64_t MRAVEndpointGetVolumeControlCapabilities()
{
  return MEMORY[0x1F412DB70]();
}

uint64_t MRAVEndpointIsLocalEndpoint()
{
  return MEMORY[0x1F412DB78]();
}

uint64_t MRAVEndpointRemoveOutputDevicesWithInitiator()
{
  return MEMORY[0x1F412DBB0]();
}

uint64_t MRAVEndpointResolveActiveSystemEndpoint()
{
  return MEMORY[0x1F412DBB8]();
}

uint64_t MRAVEndpointResolveActiveSystemEndpointWithType()
{
  return MEMORY[0x1F412DBC0]();
}

uint64_t MRAVEndpointSetOutputDeviceVolume()
{
  return MEMORY[0x1F412DBD0]();
}

uint64_t MRAVEndpointSetVolume()
{
  return MEMORY[0x1F412DBD8]();
}

uint64_t MRAVEndpointUpdateActiveSystemEndpointWithReason()
{
  return MEMORY[0x1F412DBE0]();
}

uint64_t MRAVOutputContextCopyOutputDevices()
{
  return MEMORY[0x1F412DBE8]();
}

uint64_t MRAVOutputContextCopyPredictedOutputDevice()
{
  return MEMORY[0x1F412DBF0]();
}

uint64_t MRAVOutputContextCopyUniqueIdentifier()
{
  return MEMORY[0x1F412DBF8]();
}

uint64_t MRAVOutputContextCreateRoutingContext()
{
  return MEMORY[0x1F412DC00]();
}

uint64_t MRAVOutputContextGetSharedAudioPresentationContext()
{
  return MEMORY[0x1F412DC08]();
}

uint64_t MRAVOutputContextRemoveOutputDevices()
{
  return MEMORY[0x1F412DC10]();
}

uint64_t MRAVOutputContextResetPredictedOutputDevice()
{
  return MEMORY[0x1F412DC18]();
}

uint64_t MRAVOutputContextSetOutputDevicesWithInitiator()
{
  return MEMORY[0x1F412DC20]();
}

uint64_t MRAVOutputDeviceCopyDNSNames()
{
  return MEMORY[0x1F412DC48]();
}

uint64_t MRAVOutputDeviceCopyGroupIdentifier()
{
  return MEMORY[0x1F412DC50]();
}

uint64_t MRAVOutputDeviceCopyLocalDeviceLocalizedName()
{
  return MEMORY[0x1F412DC58]();
}

uint64_t MRAVOutputDeviceCopyModelID()
{
  return MEMORY[0x1F412DC60]();
}

uint64_t MRAVOutputDeviceCopyModelSpecificInformation()
{
  return MEMORY[0x1F412DC68]();
}

uint64_t MRAVOutputDeviceCopyName()
{
  return MEMORY[0x1F412DC70]();
}

uint64_t MRAVOutputDeviceCopyPlayingPairedDeviceName()
{
  return MEMORY[0x1F412DC78]();
}

uint64_t MRAVOutputDeviceCopySourceInfo()
{
  return MEMORY[0x1F412DC80]();
}

uint64_t MRAVOutputDeviceCopyUniqueIdentifier()
{
  return MEMORY[0x1F412DC88]();
}

uint64_t MRAVOutputDeviceCreateFromAVOutputDevice()
{
  return MEMORY[0x1F412DC90]();
}

uint64_t MRAVOutputDeviceGetBatteryLevel()
{
  return MEMORY[0x1F412DCA0]();
}

uint64_t MRAVOutputDeviceGetSubtype()
{
  return MEMORY[0x1F412DCA8]();
}

uint64_t MRAVOutputDeviceGetType()
{
  return MEMORY[0x1F412DCB0]();
}

uint64_t MRAVOutputDeviceHasBatteryLevel()
{
  return MEMORY[0x1F412DCB8]();
}

uint64_t MRAVOutputDeviceIsGroupLeader()
{
  return MEMORY[0x1F412DCC8]();
}

uint64_t MRAVOutputDeviceIsGroupable()
{
  return MEMORY[0x1F412DCD0]();
}

uint64_t MRAVOutputDeviceIsLocalDevice()
{
  return MEMORY[0x1F412DCD8]();
}

uint64_t MRAVOutputDeviceSourceInfoMultipleBuiltInDevices()
{
  return MEMORY[0x1F412DD00]();
}

uint64_t MRAVReconnaissanceSessionBeginSearch()
{
  return MEMORY[0x1F412DD40]();
}

uint64_t MRAVReconnaissanceSessionCreateWithEndpointFeatures()
{
  return MEMORY[0x1F412DD50]();
}

uint64_t MRAVRouteQueryCreate()
{
  return MEMORY[0x1F412DD58]();
}

uint64_t MRAVRouteQuerySetRouteUID()
{
  return MEMORY[0x1F412DD60]();
}

uint64_t MRApplicationActivityBegin()
{
  return MEMORY[0x1F412DDA8]();
}

uint64_t MRApplicationActivityCreate()
{
  return MEMORY[0x1F412DDB0]();
}

uint64_t MRApplicationActivityEnd()
{
  return MEMORY[0x1F412DDB8]();
}

uint64_t MRComputeBaseRouteUID()
{
  return MEMORY[0x1F412DDD8]();
}

uint64_t MRContentItemCopy()
{
  return MEMORY[0x1F412DDE0]();
}

uint64_t MRContentItemCopyAlbumYear()
{
  return MEMORY[0x1F412DDE8]();
}

uint64_t MRContentItemCopyAuxiliaryNowPlayingInfo()
{
  return MEMORY[0x1F412DDF0]();
}

uint64_t MRContentItemCopyCollectionInfo()
{
  return MEMORY[0x1F412DDF8]();
}

uint64_t MRContentItemCopyDeviceSpecificUserInfo()
{
  return MEMORY[0x1F412DE00]();
}

uint64_t MRContentItemCopyNowPlayingInfo()
{
  return MEMORY[0x1F412DE08]();
}

uint64_t MRContentItemCopyUserInfo()
{
  return MEMORY[0x1F412DE10]();
}

uint64_t MRContentItemCopyWithIdentifier()
{
  return MEMORY[0x1F412DE18]();
}

uint64_t MRContentItemCreate()
{
  return MEMORY[0x1F412DE20]();
}

uint64_t MRContentItemCreateExternalRepresentation()
{
  return MEMORY[0x1F412DE28]();
}

uint64_t MRContentItemCreateFromExternalRepresentation()
{
  return MEMORY[0x1F412DE30]();
}

uint64_t MRContentItemCreateSkeletonFrom()
{
  return MEMORY[0x1F412DE38]();
}

uint64_t MRContentItemGetAvailableLanguageOptions()
{
  return MEMORY[0x1F412DE68]();
}

uint64_t MRContentItemGetCurrentLanguageOptions()
{
  return MEMORY[0x1F412DE90]();
}

uint64_t MRContentItemGetEditingStyleFlags()
{
  return MEMORY[0x1F412DEC0]();
}

uint64_t MRContentItemGetElapsedTimeTimestamp()
{
  return MEMORY[0x1F412DED0]();
}

uint64_t MRContentItemGetEpisodeType()
{
  return MEMORY[0x1F412DEE0]();
}

uint64_t MRContentItemGetHasElapsedTime()
{
  return MEMORY[0x1F412DEF8]();
}

uint64_t MRContentItemGetHasMetadata()
{
  return MEMORY[0x1F412DF18]();
}

uint64_t MRContentItemGetIdentifier()
{
  return MEMORY[0x1F412DF50]();
}

uint64_t MRContentItemGetLyrics()
{
  return MEMORY[0x1F412DFC0]();
}

uint64_t MRContentItemGetMediaSubType()
{
  return MEMORY[0x1F412DFD0]();
}

uint64_t MRContentItemGetMediaType()
{
  return MEMORY[0x1F412DFD8]();
}

uint64_t MRContentItemGetPlaybackRate()
{
  return MEMORY[0x1F412DFF8]();
}

uint64_t MRContentItemGetPlaylistType()
{
  return MEMORY[0x1F412E000]();
}

uint64_t MRContentItemGetRadioStationType()
{
  return MEMORY[0x1F412E020]();
}

uint64_t MRContentItemGetSections()
{
  return MEMORY[0x1F412E040]();
}

uint64_t MRContentItemGetTranscriptAlignments()
{
  return MEMORY[0x1F412E090]();
}

uint64_t MRContentItemHasPlaybackRate()
{
  return MEMORY[0x1F412E098]();
}

uint64_t MRContentItemMerge()
{
  return MEMORY[0x1F412E0A0]();
}

uint64_t MRContentItemRepresentationForIdentity()
{
  return MEMORY[0x1F412E0A8]();
}

uint64_t MRContentItemSetAlbumArtistName()
{
  return MEMORY[0x1F412E0B0]();
}

uint64_t MRContentItemSetAlbumName()
{
  return MEMORY[0x1F412E0B8]();
}

uint64_t MRContentItemSetAlbumYear()
{
  return MEMORY[0x1F412E0C0]();
}

uint64_t MRContentItemSetArtworkData()
{
  return MEMORY[0x1F412E0C8]();
}

uint64_t MRContentItemSetArtworkDataSize()
{
  return MEMORY[0x1F412E0D0]();
}

uint64_t MRContentItemSetArtworkIdentifier()
{
  return MEMORY[0x1F412E0D8]();
}

uint64_t MRContentItemSetArtworkMIMEType()
{
  return MEMORY[0x1F412E0E0]();
}

uint64_t MRContentItemSetArtworkURL()
{
  return MEMORY[0x1F412E0E8]();
}

uint64_t MRContentItemSetArtworkURLTemplates()
{
  return MEMORY[0x1F412E0F0]();
}

uint64_t MRContentItemSetAvailableLanguageOptions()
{
  return MEMORY[0x1F412E0F8]();
}

uint64_t MRContentItemSetCollectionIdentifier()
{
  return MEMORY[0x1F412E100]();
}

uint64_t MRContentItemSetCollectionInfo()
{
  return MEMORY[0x1F412E108]();
}

uint64_t MRContentItemSetComposer()
{
  return MEMORY[0x1F412E110]();
}

uint64_t MRContentItemSetContentIdentifier()
{
  return MEMORY[0x1F412E118]();
}

uint64_t MRContentItemSetCurrentLanguageOptions()
{
  return MEMORY[0x1F412E120]();
}

uint64_t MRContentItemSetDefaultPlaybackRate()
{
  return MEMORY[0x1F412E128]();
}

uint64_t MRContentItemSetDeviceSpecificUserInfo()
{
  return MEMORY[0x1F412E130]();
}

uint64_t MRContentItemSetDirectorName()
{
  return MEMORY[0x1F412E138]();
}

uint64_t MRContentItemSetDiscNumber()
{
  return MEMORY[0x1F412E140]();
}

uint64_t MRContentItemSetDuration()
{
  return MEMORY[0x1F412E148]();
}

uint64_t MRContentItemSetDurationStringLocalizationKey()
{
  return MEMORY[0x1F412E150]();
}

uint64_t MRContentItemSetEditingStyleFlags()
{
  return MEMORY[0x1F412E158]();
}

uint64_t MRContentItemSetElapsedTime()
{
  return MEMORY[0x1F412E160]();
}

uint64_t MRContentItemSetEpisodeNumber()
{
  return MEMORY[0x1F412E170]();
}

uint64_t MRContentItemSetEpisodeType()
{
  return MEMORY[0x1F412E178]();
}

uint64_t MRContentItemSetExplicitItem()
{
  return MEMORY[0x1F412E180]();
}

uint64_t MRContentItemSetGenre()
{
  return MEMORY[0x1F412E188]();
}

uint64_t MRContentItemSetHasArtworkData()
{
  return MEMORY[0x1F412E190]();
}

uint64_t MRContentItemSetHasInfo()
{
  return MEMORY[0x1F412E198]();
}

uint64_t MRContentItemSetHasLanguageOptions()
{
  return MEMORY[0x1F412E1A0]();
}

uint64_t MRContentItemSetHasLyrics()
{
  return MEMORY[0x1F412E1A8]();
}

uint64_t MRContentItemSetHasTranscriptAlignments()
{
  return MEMORY[0x1F412E1B0]();
}

uint64_t MRContentItemSetITunesStoreAlbumArtistIdentifier()
{
  return MEMORY[0x1F412E1B8]();
}

uint64_t MRContentItemSetITunesStoreAlbumIdentifier()
{
  return MEMORY[0x1F412E1C0]();
}

uint64_t MRContentItemSetITunesStoreArtistIdentifier()
{
  return MEMORY[0x1F412E1C8]();
}

uint64_t MRContentItemSetITunesStoreIdentifier()
{
  return MEMORY[0x1F412E1D0]();
}

uint64_t MRContentItemSetITunesStoreSubscriptionIdentifier()
{
  return MEMORY[0x1F412E1D8]();
}

uint64_t MRContentItemSetInfo()
{
  return MEMORY[0x1F412E1E0]();
}

uint64_t MRContentItemSetIsAdvertisement()
{
  return MEMORY[0x1F412E1E8]();
}

uint64_t MRContentItemSetIsAlwaysLive()
{
  return MEMORY[0x1F412E1F0]();
}

uint64_t MRContentItemSetIsContainer()
{
  return MEMORY[0x1F412E1F8]();
}

uint64_t MRContentItemSetIsInTransition()
{
  return MEMORY[0x1F412E200]();
}

uint64_t MRContentItemSetIsLoading()
{
  return MEMORY[0x1F412E208]();
}

uint64_t MRContentItemSetIsSteerable()
{
  return MEMORY[0x1F412E210]();
}

uint64_t MRContentItemSetIsStreamingContent()
{
  return MEMORY[0x1F412E218]();
}

uint64_t MRContentItemSetLegacyUniqueIdentifier()
{
  return MEMORY[0x1F412E220]();
}

uint64_t MRContentItemSetLocalizedContentRating()
{
  return MEMORY[0x1F412E228]();
}

uint64_t MRContentItemSetLocalizedDurationString()
{
  return MEMORY[0x1F412E230]();
}

uint64_t MRContentItemSetLyrics()
{
  return MEMORY[0x1F412E238]();
}

uint64_t MRContentItemSetLyricsAdamID()
{
  return MEMORY[0x1F412E240]();
}

uint64_t MRContentItemSetMediaSubType()
{
  return MEMORY[0x1F412E248]();
}

uint64_t MRContentItemSetMediaType()
{
  return MEMORY[0x1F412E250]();
}

uint64_t MRContentItemSetNowPlayingInfo()
{
  return MEMORY[0x1F412E258]();
}

uint64_t MRContentItemSetNumberOfSections()
{
  return MEMORY[0x1F412E260]();
}

uint64_t MRContentItemSetPlayCount()
{
  return MEMORY[0x1F412E268]();
}

uint64_t MRContentItemSetPlayable()
{
  return MEMORY[0x1F412E270]();
}

uint64_t MRContentItemSetPlaybackProgress()
{
  return MEMORY[0x1F412E278]();
}

uint64_t MRContentItemSetPlaybackRate()
{
  return MEMORY[0x1F412E280]();
}

uint64_t MRContentItemSetPlaylistType()
{
  return MEMORY[0x1F412E288]();
}

uint64_t MRContentItemSetProfileIdentifier()
{
  return MEMORY[0x1F412E290]();
}

uint64_t MRContentItemSetRadioStationName()
{
  return MEMORY[0x1F412E298]();
}

uint64_t MRContentItemSetRadioStationString()
{
  return MEMORY[0x1F412E2A0]();
}

uint64_t MRContentItemSetRadioStationType()
{
  return MEMORY[0x1F412E2A8]();
}

uint64_t MRContentItemSetReleaseDate()
{
  return MEMORY[0x1F412E2B0]();
}

uint64_t MRContentItemSetReportingAdamID()
{
  return MEMORY[0x1F412E2B8]();
}

uint64_t MRContentItemSetSeasonNumber()
{
  return MEMORY[0x1F412E2C0]();
}

uint64_t MRContentItemSetSections()
{
  return MEMORY[0x1F412E2C8]();
}

uint64_t MRContentItemSetSeriesName()
{
  return MEMORY[0x1F412E2D0]();
}

uint64_t MRContentItemSetServiceIdentifier()
{
  return MEMORY[0x1F412E2D8]();
}

uint64_t MRContentItemSetStartTime()
{
  return MEMORY[0x1F412E2E0]();
}

uint64_t MRContentItemSetSubtitle()
{
  return MEMORY[0x1F412E2E8]();
}

uint64_t MRContentItemSetTitle()
{
  return MEMORY[0x1F412E2F0]();
}

uint64_t MRContentItemSetTotalDiscCount()
{
  return MEMORY[0x1F412E2F8]();
}

uint64_t MRContentItemSetTotalTrackCount()
{
  return MEMORY[0x1F412E300]();
}

uint64_t MRContentItemSetTrackArtistName()
{
  return MEMORY[0x1F412E308]();
}

uint64_t MRContentItemSetTrackNumber()
{
  return MEMORY[0x1F412E310]();
}

uint64_t MRContentItemSetTranscriptAlignments()
{
  return MEMORY[0x1F412E318]();
}

uint64_t MRContentItemSetUserInfo()
{
  return MEMORY[0x1F412E320]();
}

uint64_t MRExternalDeviceCopyName()
{
  return MEMORY[0x1F412E338]();
}

uint64_t MRExternalDeviceCopyUniqueIdentifier()
{
  return MEMORY[0x1F412E340]();
}

uint64_t MRIdentityRepresentationForParticipantItem()
{
  return MEMORY[0x1F412E388]();
}

uint64_t MRLanguageOptionCopyCharacteristics()
{
  return MEMORY[0x1F412E390]();
}

uint64_t MRLanguageOptionCopyDisplayName()
{
  return MEMORY[0x1F412E398]();
}

uint64_t MRLanguageOptionCopyIdentifier()
{
  return MEMORY[0x1F412E3A0]();
}

uint64_t MRLanguageOptionCopyLanguageTag()
{
  return MEMORY[0x1F412E3A8]();
}

uint64_t MRLanguageOptionCreate()
{
  return MEMORY[0x1F412E3B0]();
}

uint64_t MRLanguageOptionCreateFromExternalRepresentation()
{
  return MEMORY[0x1F412E3C8]();
}

uint64_t MRLanguageOptionGetType()
{
  return MEMORY[0x1F412E3D0]();
}

uint64_t MRLanguageOptionGroupCopyLanguageOptions()
{
  return MEMORY[0x1F412E3D8]();
}

uint64_t MRLanguageOptionGroupCreate()
{
  return MEMORY[0x1F412E3E0]();
}

uint64_t MRLanguageOptionGroupGetAllowEmptySelection()
{
  return MEMORY[0x1F412E3F0]();
}

uint64_t MRLanguageOptionGroupGetDefaultLanguageOption()
{
  return MEMORY[0x1F412E3F8]();
}

uint64_t MRLanguageOptionGroupsCreateExternalRepresentation()
{
  return MEMORY[0x1F412E400]();
}

uint64_t MRLanguageOptionsCreateExternalRepresentation()
{
  return MEMORY[0x1F412E420]();
}

uint64_t MRLyricsEventGetToken()
{
  return MEMORY[0x1F412E440]();
}

uint64_t MRLyricsItemCreate()
{
  return MEMORY[0x1F412E448]();
}

uint64_t MRLyricsItemGetToken()
{
  return MEMORY[0x1F412E458]();
}

uint64_t MRLyricsItemIsUserProvided()
{
  return MEMORY[0x1F412E460]();
}

uint64_t MRLyricsItemTokenCreate()
{
  return MEMORY[0x1F412E468]();
}

uint64_t MRMediaRemoteAddCommandHandlerForPlayer()
{
  return MEMORY[0x1F412E498]();
}

uint64_t MRMediaRemoteCanBecomeActivePlayer()
{
  return MEMORY[0x1F412E4B8]();
}

uint64_t MRMediaRemoteCopyBrowsableContentAPIMaskDescription()
{
  return MEMORY[0x1F412E500]();
}

uint64_t MRMediaRemoteCopyCommandDescription()
{
  return MEMORY[0x1F412E508]();
}

uint64_t MRMediaRemoteCopyCommandHandlerStatusDescription()
{
  return MEMORY[0x1F412E510]();
}

uint64_t MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID()
{
  return MEMORY[0x1F412E520]();
}

uint64_t MRMediaRemoteCopyPendingCommands()
{
  return MEMORY[0x1F412E530]();
}

uint64_t MRMediaRemoteCreateError()
{
  return MEMORY[0x1F412E548]();
}

uint64_t MRMediaRemoteDismissMediaControlsCommand()
{
  return MEMORY[0x1F412E550]();
}

uint64_t MRMediaRemoteErrorIsInformational()
{
  return MEMORY[0x1F412E558]();
}

uint64_t MRMediaRemoteFindAndPickRoute()
{
  return MEMORY[0x1F412E560]();
}

uint64_t MRMediaRemoteFinishedPlaybackInitialization()
{
  return MEMORY[0x1F412E568]();
}

uint64_t MRMediaRemoteGetExternalScreenType()
{
  return MEMORY[0x1F412E590]();
}

uint64_t MRMediaRemoteGetNowPlayingClient()
{
  return MEMORY[0x1F412E5C8]();
}

uint64_t MRMediaRemoteGetPickedRouteHasVolumeControl()
{
  return MEMORY[0x1F412E5E8]();
}

uint64_t MRMediaRemoteGetPictureInPictureStatusForPlayer()
{
  return MEMORY[0x1F412E5F0]();
}

uint64_t MRMediaRemoteInvalidateBrowsableContent()
{
  return MEMORY[0x1F412E630]();
}

uint64_t MRMediaRemoteIsMusicAppInstalled()
{
  return MEMORY[0x1F412E640]();
}

uint64_t MRMediaRemoteNowPlayingWakePlayerServiceProcess()
{
  return MEMORY[0x1F412E658]();
}

uint64_t MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription()
{
  return MEMORY[0x1F412E660]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddContentItemArtworkCallbackForPlayer()
{
  return MEMORY[0x1F412E668]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddContentItemFormattedArtworkCallbackForPlayer()
{
  return MEMORY[0x1F412E670]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddContentItemInfoCallbackForPlayer()
{
  return MEMORY[0x1F412E678]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddContentItemLanguageOptionsCallbackForPlayer()
{
  return MEMORY[0x1F412E680]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddContentItemLyricsCallbackForPlayer()
{
  return MEMORY[0x1F412E688]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddContentItemMetadataCallbackForPlayer()
{
  return MEMORY[0x1F412E690]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddContentItemTranscriptAlignmentsCallbackForPlayer()
{
  return MEMORY[0x1F412E698]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddCreateChildContentItemCallbackForPlayer()
{
  return MEMORY[0x1F412E6A0]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddCreateContentItemForIdentifierCallbackForPlayer()
{
  return MEMORY[0x1F412E6A8]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceAddCreatePlaybackQueueForRequestCallbackForPlayer()
{
  return MEMORY[0x1F412E6B0]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceContentItemChangedWithRequestForPlayer()
{
  return MEMORY[0x1F412E6B8]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceContentItemsChangedForPlayer()
{
  return MEMORY[0x1F412E6C0]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceInvalidateWithPlaybackQueueForPlayer()
{
  return MEMORY[0x1F412E6C8]();
}

uint64_t MRMediaRemotePlaybackQueueDataSourceRemoveCallbackForPlayer()
{
  return MEMORY[0x1F412E6D0]();
}

uint64_t MRMediaRemotePlaybackSessionSetMigrateBeginCallback()
{
  return MEMORY[0x1F412E6D8]();
}

uint64_t MRMediaRemotePlaybackSessionSetMigrateEndCallback()
{
  return MEMORY[0x1F412E6E0]();
}

uint64_t MRMediaRemotePlaybackSessionSetRequestCallback()
{
  return MEMORY[0x1F412E6E8]();
}

uint64_t MRMediaRemotePostDelayedNotification()
{
  return MEMORY[0x1F412E6F8]();
}

uint64_t MRMediaRemotePresentMediaControlsCommand()
{
  return MEMORY[0x1F412E700]();
}

uint64_t MRMediaRemotePrewarmMediaControlsCommand()
{
  return MEMORY[0x1F412E708]();
}

uint64_t MRMediaRemoteRemoveCommandHandlerBlockForPlayer()
{
  return MEMORY[0x1F412E730]();
}

uint64_t MRMediaRemoteRemovePlayer()
{
  return MEMORY[0x1F412E738]();
}

uint64_t MRMediaRemoteSendCommandToApp()
{
  return MEMORY[0x1F412E760]();
}

uint64_t MRMediaRemoteSetAVAudioSessionOpaqueSessionIDForPlayer()
{
  return MEMORY[0x1F412E778]();
}

uint64_t MRMediaRemoteSetBeginLyricsEventCallbackForPlayer()
{
  return MEMORY[0x1F412E788]();
}

uint64_t MRMediaRemoteSetBrowsableContentEndpoint()
{
  return MEMORY[0x1F412E790]();
}

uint64_t MRMediaRemoteSetCanBeNowPlayingForPlayer()
{
  return MEMORY[0x1F412E7A0]();
}

uint64_t MRMediaRemoteSetDefaultSupportedCommands()
{
  return MEMORY[0x1F412E7A8]();
}

uint64_t MRMediaRemoteSetEndLyricsEventCallbackForPlayer()
{
  return MEMORY[0x1F412E7B0]();
}

uint64_t MRMediaRemoteSetMXSessionIDForPlayer()
{
  return MEMORY[0x1F412E7B8]();
}

uint64_t MRMediaRemoteSetNowPlayingInfoForPlayer()
{
  return MEMORY[0x1F412E7C0]();
}

uint64_t MRMediaRemoteSetNowPlayingPlayer()
{
  return MEMORY[0x1F412E7D0]();
}

uint64_t MRMediaRemoteSetNowPlayingPlayerIfPossible()
{
  return MEMORY[0x1F412E7D8]();
}

uint64_t MRMediaRemoteSetPictureInPictureStatusForPlayer()
{
  return MEMORY[0x1F412E7E8]();
}

uint64_t MRMediaRemoteSetSupportedBrowsableContentAPIs()
{
  return MEMORY[0x1F412E7F8]();
}

uint64_t MRMediaRemoteSetSupportedCommandsForPlayer()
{
  return MEMORY[0x1F412E808]();
}

uint64_t MRMediaRemoteSetWantsExternalScreenTypeChangeNotifications()
{
  return MEMORY[0x1F412E810]();
}

uint64_t MRMediaRemoteSetWantsNowPlayingNotifications()
{
  return MEMORY[0x1F412E818]();
}

uint64_t MRMediaRemoteSetWantsVolumeControlNotifications()
{
  return MEMORY[0x1F412E830]();
}

uint64_t MRMediaRemoteSystemMediaApplicationIsRunning()
{
  return MEMORY[0x1F412E838]();
}

uint64_t MRMediaRemoteSystemMediaApplicationWake()
{
  return MEMORY[0x1F412E840]();
}

uint64_t MRMediaRemoteUnpickAirPlayAVRoutes()
{
  return MEMORY[0x1F412E848]();
}

uint64_t MRMediaRemoteUpdateBrowsableContentItems()
{
  return MEMORY[0x1F412E860]();
}

uint64_t MRMediaRemoteUpdateClientProperties()
{
  return MEMORY[0x1F412E868]();
}

uint64_t MRMediaRemoteUpdateNowPlayingIdentifiers()
{
  return MEMORY[0x1F412E870]();
}

uint64_t MRNowPlayingClientGetBundleIdentifier()
{
  return MEMORY[0x1F412E878]();
}

uint64_t MRNowPlayingClientSetParentAppBundleIdentifier()
{
  return MEMORY[0x1F412E888]();
}

uint64_t MRNowPlayingPlayerPathGetClient()
{
  return MEMORY[0x1F412E898]();
}

uint64_t MRNowPlayingPlayerPathGetOrigin()
{
  return MEMORY[0x1F412E8A0]();
}

uint64_t MRNowPlayingPlayerPathGetPlayer()
{
  return MEMORY[0x1F412E8A8]();
}

uint64_t MROriginIsLocalOrigin()
{
  return MEMORY[0x1F412E8B0]();
}

uint64_t MRPlaybackQueueRequestCreateWithIdentifiers()
{
  return MEMORY[0x1F412E918]();
}

uint64_t MRPlaybackQueueRequestGetArtworkHeight()
{
  return MEMORY[0x1F412E920]();
}

uint64_t MRPlaybackQueueRequestGetArtworkWidth()
{
  return MEMORY[0x1F412E928]();
}

uint64_t MRPlaybackQueueRequestGetRange()
{
  return MEMORY[0x1F412E930]();
}

uint64_t MRPlaybackQueueRequestMerge()
{
  return MEMORY[0x1F412E938]();
}

uint64_t MRPlaybackQueueRequestSetIncludeArtwork()
{
  return MEMORY[0x1F412E940]();
}

uint64_t MRPlaybackQueueRequestSetIncludeInfo()
{
  return MEMORY[0x1F412E948]();
}

uint64_t MRPlaybackQueueRequestSetIncludeLanguageOptions()
{
  return MEMORY[0x1F412E950]();
}

uint64_t MRPlaybackQueueRequestSetIncludeLyrics()
{
  return MEMORY[0x1F412E958]();
}

uint64_t MRPlaybackQueueRequestSetIncludeMetadata()
{
  return MEMORY[0x1F412E960]();
}

uint64_t MRPlaybackQueueRequestSetIncludeSections()
{
  return MEMORY[0x1F412E968]();
}

uint64_t MRPlaybackSessionCopyIdentifier()
{
  return MEMORY[0x1F412E970]();
}

uint64_t MRPlaybackSessionCopyPlaybackSessionData()
{
  return MEMORY[0x1F412E978]();
}

uint64_t MRPlaybackSessionCopyType()
{
  return MEMORY[0x1F412E980]();
}

uint64_t MRPlaybackSessionCreate()
{
  return MEMORY[0x1F412E988]();
}

uint64_t MRPlaybackSessionCreateFromExternalRepresentation()
{
  return MEMORY[0x1F412E990]();
}

uint64_t MRPlaybackSessionRequestCopyIdentifier()
{
  return MEMORY[0x1F412E998]();
}

uint64_t MRPlaybackSessionRequestCopyRequestID()
{
  return MEMORY[0x1F412E9A0]();
}

uint64_t MRPlaybackSessionRequestCopyType()
{
  return MEMORY[0x1F412E9A8]();
}

uint64_t MRSystemAppPlaybackQueueCopyCustomData()
{
  return MEMORY[0x1F412E9B0]();
}

uint64_t MRSystemAppPlaybackQueueCopyCustomDataIdentifier()
{
  return MEMORY[0x1F412E9B8]();
}

uint64_t MRSystemAppPlaybackQueueCopyFeatureName()
{
  return MEMORY[0x1F412E9C0]();
}

uint64_t MRSystemAppPlaybackQueueCopyGenericTrackIdentifiers()
{
  return MEMORY[0x1F412E9C8]();
}

uint64_t MRSystemAppPlaybackQueueCopyRadioStationStringIdentifier()
{
  return MEMORY[0x1F412E9D0]();
}

uint64_t MRSystemAppPlaybackQueueCreate()
{
  return MEMORY[0x1F412E9D8]();
}

uint64_t MRSystemAppPlaybackQueueCreateExternalRepresentation()
{
  return MEMORY[0x1F412E9E0]();
}

uint64_t MRSystemAppPlaybackQueueCreateFromExternalRepresentation()
{
  return MEMORY[0x1F412E9E8]();
}

uint64_t MRSystemAppPlaybackQueueDestroy()
{
  return MEMORY[0x1F412E9F0]();
}

uint64_t MRSystemAppPlaybackQueueGetFirstItemGenericTrackIdentifier()
{
  return MEMORY[0x1F412E9F8]();
}

uint64_t MRSystemAppPlaybackQueueGetLocalQueryData()
{
  return MEMORY[0x1F412EA00]();
}

uint64_t MRSystemAppPlaybackQueueGetLocalQueryEncodingType()
{
  return MEMORY[0x1F412EA08]();
}

uint64_t MRSystemAppPlaybackQueueGetLocalQueryFirstItemMultiverseIDData()
{
  return MEMORY[0x1F412EA10]();
}

uint64_t MRSystemAppPlaybackQueueGetLocalQueryFirstItemPID()
{
  return MEMORY[0x1F412EA18]();
}

uint64_t MRSystemAppPlaybackQueueGetLocalQueryRepeatMode()
{
  return MEMORY[0x1F412EA20]();
}

uint64_t MRSystemAppPlaybackQueueGetLocalQueryShuffleMode()
{
  return MEMORY[0x1F412EA28]();
}

uint64_t MRSystemAppPlaybackQueueGetRadioStationIDType()
{
  return MEMORY[0x1F412EA30]();
}

uint64_t MRSystemAppPlaybackQueueGetRadioStationIntegerPID()
{
  return MEMORY[0x1F412EA38]();
}

uint64_t MRSystemAppPlaybackQueueGetReplaceIntent()
{
  return MEMORY[0x1F412EA40]();
}

uint64_t MRSystemAppPlaybackQueueGetTracklistCollectionIdentifierSetData()
{
  return MEMORY[0x1F412EA60]();
}

uint64_t MRSystemAppPlaybackQueueGetTracklistRepeatMode()
{
  return MEMORY[0x1F412EA68]();
}

uint64_t MRSystemAppPlaybackQueueGetTracklistShuffleMode()
{
  return MEMORY[0x1F412EA70]();
}

uint64_t MRSystemAppPlaybackQueueGetType()
{
  return MEMORY[0x1F412EA78]();
}

uint64_t MRSystemAppPlaybackQueueSetCustomData()
{
  return MEMORY[0x1F412EA90]();
}

uint64_t MRSystemAppPlaybackQueueSetCustomDataIdentifier()
{
  return MEMORY[0x1F412EA98]();
}

uint64_t MRTelevisionControllerBeginDiscovery()
{
  return MEMORY[0x1F412EB10]();
}

uint64_t MRTelevisionControllerCreate()
{
  return MEMORY[0x1F412EB18]();
}

uint64_t MRTelevisionControllerEndDiscovery()
{
  return MEMORY[0x1F412EB20]();
}

uint64_t MRTelevisionControllerIsDiscoveringDevices()
{
  return MEMORY[0x1F412EB28]();
}

uint64_t MRTelevisionControllerSetDiscoveryCallback()
{
  return MEMORY[0x1F412EB30]();
}

uint64_t MRTelevisionControllerSetRemovalCallback()
{
  return MEMORY[0x1F412EB38]();
}

uint64_t MSVCopyLocalizedModelName()
{
  return MEMORY[0x1F412EB90]();
}

uint64_t MSVCurrentProcessIsNonUIPlaybackService()
{
  return MEMORY[0x1F412EBA8]();
}

uint64_t MSVDeviceIsAppleTV()
{
  return MEMORY[0x1F412EBB0]();
}

uint64_t MSVDeviceIsAudioAccessory()
{
  return MEMORY[0x1F412EBB8]();
}

uint64_t MSVDeviceIsHomePod()
{
  return MEMORY[0x1F412EBC0]();
}

uint64_t MSVDeviceIsWatch()
{
  return MEMORY[0x1F412EBC8]();
}

uint64_t MSVDeviceOSIsInternalInstall()
{
  return MEMORY[0x1F412EBD8]();
}

uint64_t MSVDeviceSupportsExtendedColorDisplay()
{
  return MEMORY[0x1F412EBE0]();
}

uint64_t MSVDeviceSupportsMultiChannelMusic()
{
  return MEMORY[0x1F412EBE8]();
}

uint64_t MSVGetMaximumScreenSize()
{
  return MEMORY[0x1F412EC20]();
}

uint64_t MSVGzipCompressData()
{
  return MEMORY[0x1F412EC28]();
}

uint64_t MSVGzipDecompressData()
{
  return MEMORY[0x1F412EC30]();
}

uint64_t MSVHasherSharedSeed()
{
  return MEMORY[0x1F412EC38]();
}

uint64_t MSVImageUtilitiesAddImageToDestination()
{
  return MEMORY[0x1F412EC48]();
}

uint64_t MSVImageUtilitiesAddJPEGToDestination()
{
  return MEMORY[0x1F412EC50]();
}

uint64_t MSVImageUtilitiesCreateFileImageDestination()
{
  return MEMORY[0x1F412EC68]();
}

uint64_t MSVLogAddStateHandler()
{
  return MEMORY[0x1F412EC78]();
}

uint64_t MSVLogRemoveStateHandler()
{
  return MEMORY[0x1F412EC80]();
}

uint64_t MSVNanoIDCreateTaggedPointer()
{
  return MEMORY[0x1F412EC98]();
}

uint64_t MSVPropertyListDataClasses()
{
  return MEMORY[0x1F412ECB0]();
}

uint64_t MSVReplacementRangeForRanges()
{
  return MEMORY[0x1F412ECB8]();
}

uint64_t MSVSignedIntersectionRange()
{
  return MEMORY[0x1F412ECC0]();
}

uint64_t MSVSignedSubtractedRange()
{
  return MEMORY[0x1F412ECC8]();
}

uint64_t MSVSignedUnionRange()
{
  return MEMORY[0x1F412ECD0]();
}

uint64_t MSVSystemRootDirectory()
{
  return MEMORY[0x1F412ECD8]();
}

uint64_t MSVTCCIdentityForCurrentProcess()
{
  return MEMORY[0x1F412ECE0]();
}

uint64_t MSVUnarchivedObjectOfClass()
{
  return MEMORY[0x1F412ECE8]();
}

uint64_t MSVUnarchivedObjectOfClasses()
{
  return MEMORY[0x1F412ECF0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1F40E7180](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapRemove(NSMapTable *table, const void *key)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4166AB0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t NSStringFromMSVSignedRange()
{
  return MEMORY[0x1F412ED08]();
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t PBRepeatedInt64Add()
{
  return MEMORY[0x1F4147398]();
}

uint64_t PBRepeatedInt64Clear()
{
  return MEMORY[0x1F41473A0]();
}

uint64_t PBRepeatedInt64Copy()
{
  return MEMORY[0x1F41473A8]();
}

uint64_t PBRepeatedInt64Hash()
{
  return MEMORY[0x1F41473B0]();
}

uint64_t PBRepeatedInt64IsEqual()
{
  return MEMORY[0x1F41473B8]();
}

uint64_t PBRepeatedInt64NSArray()
{
  return MEMORY[0x1F41473C0]();
}

uint64_t SBGetApplicationNetworkFlags()
{
  return MEMORY[0x1F415C048]();
}

uint64_t SBSIsSystemApplication()
{
  return MEMORY[0x1F415C3A8]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x1F415C450]();
}

uint64_t SBSetApplicationNetworkFlags()
{
  return MEMORY[0x1F415C478]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x1F4166BD8]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4166CB8](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1F4166E10]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1F4166E18]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1F4166E20]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1F4166E30]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1F4166E38]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1F4166E40]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1F4166E48]();
}

void UIRectClip(CGRect rect)
{
}

void UIRectFill(CGRect rect)
{
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4166E80]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1F4166E88]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1F4166E98]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4166EB8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4166EC8]();
}

uint64_t _AXSHapticMusicEnabled()
{
  return MEMORY[0x1F4178B40]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFURLCachePurgeMemoryCache()
{
  return MEMORY[0x1F40D5740]();
}

uint64_t _MRLogForCategory()
{
  return MEMORY[0x1F412EB48]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1F40D9490]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1F40D94B8]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1F40D94C0]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1F40D94E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t mediaplatform::ContentBundle::ContentBundle()
{
  return MEMORY[0x1F412CD18]();
}

uint64_t mediaplatform::FormatOptions::FormatOptions(mediaplatform::FormatOptions *this)
{
  return MEMORY[0x1F412CD20](this);
}

uint64_t mediaplatform::UTF8ToUTF16String()
{
  return MEMORY[0x1F412CD28]();
}

uint64_t mediaplatform::StringToUCharString()
{
  return MEMORY[0x1F412CD30]();
}

uint64_t mediaplatform::PlatformErrorCondition::PlatformErrorCondition()
{
  return MEMORY[0x1F412CD38]();
}

void mediaplatform::PlatformErrorCondition::~PlatformErrorCondition(mediaplatform::PlatformErrorCondition *this)
{
}

uint64_t mediaplatform::Data::Data()
{
  return MEMORY[0x1F412CD48]();
}

{
  return MEMORY[0x1F412CD50]();
}

uint64_t mediaplatform::Data::Data(mediaplatform::Data *this)
{
  return MEMORY[0x1F412CD58](this);
}

void mediaplatform::Data::~Data(mediaplatform::Data *this)
{
}

uint64_t mediaplatform::FilePath::FilePath()
{
  return MEMORY[0x1F412CD68]();
}

uint64_t mlcore::ItemArtist::EntityClass(mlcore::ItemArtist *this)
{
  return MEMORY[0x1F412CD70](this);
}

uint64_t mlcore::RangeQuery::setRange()
{
  return MEMORY[0x1F412CD78]();
}

uint64_t mlcore::EntityCache::setCacheDisabled(mlcore::EntityCache *this)
{
  return MEMORY[0x1F412CD80](this);
}

uint64_t mlcore::EntityCache::entityForClassAndPersistentID()
{
  return MEMORY[0x1F412CD88]();
}

uint64_t mlcore::EntityCache::propertiesToFetchForEntityClass()
{
  return MEMORY[0x1F412CD90]();
}

uint64_t mlcore::EntityCache::setPropertiesToFetchForEntityClass()
{
  return MEMORY[0x1F412CD98]();
}

uint64_t mlcore::EntityCache::EntityCache()
{
  return MEMORY[0x1F412CDA0]();
}

void mlcore::EntityCache::~EntityCache(mlcore::EntityCache *this)
{
}

uint64_t mlcore::EntityQuery::songsQuery()
{
  return MEMORY[0x1F412CDB0]();
}

uint64_t mlcore::EntityQuery::albumsQuery()
{
  return MEMORY[0x1F412CDB8]();
}

uint64_t mlcore::EntityQuery::genresQuery()
{
  return MEMORY[0x1F412CDC0]();
}

uint64_t mlcore::EntityQuery::moviesQuery()
{
  return MEMORY[0x1F412CDC8]();
}

uint64_t mlcore::EntityQuery::artistsQuery()
{
  return MEMORY[0x1F412CDD0]();
}

uint64_t mlcore::EntityQuery::tvShowsQuery()
{
  return MEMORY[0x1F412CDD8]();
}

uint64_t mlcore::EntityQuery::podcastsQuery()
{
  return MEMORY[0x1F412CDE0]();
}

uint64_t mlcore::EntityQuery::composersQuery()
{
  return MEMORY[0x1F412CDE8]();
}

uint64_t mlcore::EntityQuery::playlistsQuery()
{
  return MEMORY[0x1F412CDF0]();
}

uint64_t mlcore::EntityQuery::tvSeasonsQuery()
{
  return MEMORY[0x1F412CDF8]();
}

uint64_t mlcore::EntityQuery::tvEpisodesQuery()
{
  return MEMORY[0x1F412CE00]();
}

uint64_t mlcore::EntityQuery::playlistItemsQuery()
{
  return MEMORY[0x1F412CE08]();
}

uint64_t mlcore::EntityQuery::albumsForGenreQuery()
{
  return MEMORY[0x1F412CE10]();
}

uint64_t mlcore::EntityQuery::albumsForArtistQuery()
{
  return MEMORY[0x1F412CE18]();
}

uint64_t mlcore::EntityQuery::podcastEpisodesQuery()
{
  return MEMORY[0x1F412CE20]();
}

uint64_t mlcore::EntityQuery::tvSeasonsForShowQuery()
{
  return MEMORY[0x1F412CE28]();
}

uint64_t mlcore::EntityQuery::albumsForComposerQuery()
{
  return MEMORY[0x1F412CE30]();
}

uint64_t mlcore::EntityQuery::playlistsForFolderQuery()
{
  return MEMORY[0x1F412CE38]();
}

uint64_t mlcore::EntityQuery::setIdentityPropertiesToFetch()
{
  return MEMORY[0x1F412CE40]();
}

uint64_t mlcore::EntityQuery::albumsForArtistQueryWithPredicate()
{
  return MEMORY[0x1F412CE48]();
}

uint64_t mlcore::EntityQuery::EntityQuery()
{
  return MEMORY[0x1F412CE50]();
}

void mlcore::InPredicate<std::string>::InPredicate()
{
  while (1)
    ;
}

void mlcore::InPredicate<int>::InPredicate()
{
  while (1)
    ;
}

void mlcore::InPredicate<long long>::InPredicate()
{
  while (1)
    ;
}

uint64_t mlcore::LibraryView::setFilters(mlcore::LibraryView *this)
{
  return MEMORY[0x1F412CE58](this);
}

uint64_t mlcore::LibraryView::viewWithLibrary()
{
  return MEMORY[0x1F412CE60]();
}

uint64_t mlcore::LibraryView::setContentRestrictions()
{
  return MEMORY[0x1F412CE68]();
}

uint64_t mlcore::LibraryView::setFilterPredicateForEntityClass()
{
  return MEMORY[0x1F412CE70]();
}

uint64_t mlcore::PlaylistItem::EntityClass(mlcore::PlaylistItem *this)
{
  return MEMORY[0x1F412CE78](this);
}

uint64_t mlcore::PlaylistItem::PlaylistItem(mlcore::PlaylistItem *this)
{
  return MEMORY[0x1F412CE80](this);
}

uint64_t mlcore::DeviceLibrary::setExpectedEntityQuerySize()
{
  return MEMORY[0x1F412CE88]();
}

uint64_t mlcore::PropertyCache::PropertyCache()
{
  return MEMORY[0x1F412CE90]();
}

void mlcore::AnyInPredicate<long long>::AnyInPredicate()
{
  while (1)
    ;
}

uint64_t mlcore::PlaylistAuthor::EntityClass(mlcore::PlaylistAuthor *this)
{
  return MEMORY[0x1F412CE98](this);
}

uint64_t mlcore::PodcastEpisode::EntityClass(mlcore::PodcastEpisode *this)
{
  return MEMORY[0x1F412CEA0](this);
}

uint64_t mlcore::SortDescriptor::SortDescriptor()
{
  return MEMORY[0x1F412CEA8]();
}

void mlcore::UnaryPredicate<int>::UnaryPredicate()
{
  while (1)
    ;
}

void mlcore::UnaryPredicate<long long>::UnaryPredicate()
{
  while (1)
    ;
}

uint64_t mlcore::ExistsPredicate::ExistsPredicate()
{
  return MEMORY[0x1F412CEB0]();
}

uint64_t mlcore::ItemPropertyBPM(mlcore *this)
{
  return MEMORY[0x1F412CEB8](this);
}

uint64_t mlcore::PropertiesQuery::setSortDescriptors()
{
  return MEMORY[0x1F412CEC0]();
}

uint64_t mlcore::PropertiesQuery::setPropertiesToFetch()
{
  return MEMORY[0x1F412CEC8]();
}

uint64_t mlcore::PropertiesQuery::PropertiesQuery()
{
  return MEMORY[0x1F412CED0]();
}

uint64_t mlcore::SearchPredicate::SearchPredicate()
{
  return MEMORY[0x1F412CED8]();
}

uint64_t mlcore::ItemPropertyYear(mlcore *this)
{
  return MEMORY[0x1F412CEE0](this);
}

uint64_t mlcore::MultiEntityQuery::setViewForEntityClass()
{
  return MEMORY[0x1F412CEE8]();
}

uint64_t mlcore::MultiEntityQuery::setMultiSortDescriptors()
{
  return MEMORY[0x1F412CEF0]();
}

uint64_t mlcore::MultiEntityQuery::setPredicateForEntityClass()
{
  return MEMORY[0x1F412CEF8]();
}

uint64_t mlcore::MultiEntityQuery::setPropertiesToFetchForEntityClass()
{
  return MEMORY[0x1F412CF00]();
}

uint64_t mlcore::MultiEntityQuery::MultiEntityQuery(mlcore::MultiEntityQuery *this)
{
  return MEMORY[0x1F412CF08](this);
}

uint64_t mlcore::AlbumPropertyYear(mlcore *this)
{
  return MEMORY[0x1F412CF10](this);
}

uint64_t mlcore::CreateOrPredicate()
{
  return MEMORY[0x1F412CF18]();
}

uint64_t mlcore::EntityQueryResult::allEntities(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1F412CF20](this);
}

uint64_t mlcore::EntityQueryResult::entityAtIndex(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1F412CF28](this);
}

uint64_t mlcore::EntityQueryResult::propertyCaches(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1F412CF30](this);
}

uint64_t mlcore::EntityQueryResult::idEntityAtIndex(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1F412CF38](this);
}

uint64_t mlcore::EntityQueryResult::localizedSectionIndices(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1F412CF40](this);
}

uint64_t mlcore::EntityQueryResult::optionalLocalizedSectionIndicesRange(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1F412CF48](this);
}

uint64_t mlcore::EntityQueryResult::sections(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1F412CF50](this);
}

uint64_t mlcore::EntityQueryResult::EntityQueryResult()
{
  return MEMORY[0x1F412CF58]();
}

uint64_t mlcore::GenrePropertyName(mlcore *this)
{
  return MEMORY[0x1F412CF60](this);
}

uint64_t mlcore::ItemPropertyTitle(mlcore *this)
{
  return MEMORY[0x1F412CF68](this);
}

uint64_t mlcore::LanguageResources::LanguageResources()
{
  return MEMORY[0x1F412CF70]();
}

uint64_t mlcore::MoviePropertyInfo(mlcore *this)
{
  return MEMORY[0x1F412CF78](this);
}

uint64_t mlcore::AlbumPropertyOrder(mlcore *this)
{
  return MEMORY[0x1F412CF80](this);
}

uint64_t mlcore::AlbumPropertyTitle(mlcore *this)
{
  return MEMORY[0x1F412CF88](this);
}

uint64_t mlcore::ArtistPropertyName(mlcore *this)
{
  return MEMORY[0x1F412CF90](this);
}

uint64_t mlcore::CreateAndPredicate()
{
  return MEMORY[0x1F412CF98]();
}

uint64_t mlcore::CreateNotPredicate()
{
  return MEMORY[0x1F412CFA0]();
}

uint64_t mlcore::GenrePropertyOrder(mlcore *this)
{
  return MEMORY[0x1F412CFA8](this);
}

uint64_t mlcore::ItemPropertyLyrics(mlcore *this)
{
  return MEMORY[0x1F412CFB0](this);
}

uint64_t mlcore::ItemPropertySyncID(mlcore *this)
{
  return MEMORY[0x1F412CFB8](this);
}

uint64_t mlcore::PersonPropertyName(mlcore *this)
{
  return MEMORY[0x1F412CFC0](this);
}

uint64_t mlcore::AlbumPropertySyncID(mlcore *this)
{
  return MEMORY[0x1F412CFC8](this);
}

uint64_t mlcore::ArtistPropertyOrder(mlcore *this)
{
  return MEMORY[0x1F412CFD0](this);
}

void mlcore::ComparisonPredicate<std::string>::ComparisonPredicate()
{
  while (1)
    ;
}

void mlcore::ComparisonPredicate<int>::ComparisonPredicate()
{
  while (1)
    ;
}

void mlcore::ComparisonPredicate<long long>::ComparisonPredicate()
{
  while (1)
    ;
}

uint64_t mlcore::ContentRestrictions::setRestrictMusicVideos(mlcore::ContentRestrictions *this)
{
  return MEMORY[0x1F412CFD8](this);
}

uint64_t mlcore::ContentRestrictions::setRestrictedMoviesRank(mlcore::ContentRestrictions *this)
{
  return MEMORY[0x1F412CFE0](this);
}

uint64_t mlcore::ContentRestrictions::setRestrictedTVShowsRank(mlcore::ContentRestrictions *this)
{
  return MEMORY[0x1F412CFE8](this);
}

uint64_t mlcore::ContentRestrictions::setRestrictExplicitLyrics(mlcore::ContentRestrictions *this)
{
  return MEMORY[0x1F412CFF0](this);
}

uint64_t mlcore::ContentRestrictions::ContentRestrictions(mlcore::ContentRestrictions *this)
{
  return MEMORY[0x1F412CFF8](this);
}

uint64_t mlcore::ItemPropertyIsVideo(mlcore *this)
{
  return MEMORY[0x1F412D000](this);
}

uint64_t mlcore::ItemPropertyStoreID(mlcore *this)
{
  return MEMORY[0x1F412D008](this);
}

uint64_t mlcore::MultiSortDescriptor::setPropertyForEntityClass()
{
  return MEMORY[0x1F412D010]();
}

uint64_t mlcore::MultiSortDescriptor::MultiSortDescriptor()
{
  return MEMORY[0x1F412D018]();
}

uint64_t mlcore::AlbumPropertyAppData(mlcore *this)
{
  return MEMORY[0x1F412D020](this);
}

uint64_t mlcore::AlbumPropertyFeedURL(mlcore *this)
{
  return MEMORY[0x1F412D028](this);
}

uint64_t mlcore::AlbumPropertyStoreID(mlcore *this)
{
  return MEMORY[0x1F412D030](this);
}

uint64_t mlcore::ComposerPropertyName(mlcore *this)
{
  return MEMORY[0x1F412D038](this);
}

uint64_t mlcore::GenrePropertyHasName(mlcore *this)
{
  return MEMORY[0x1F412D040](this);
}

uint64_t mlcore::ItemPropertyFileSize(mlcore *this)
{
  return MEMORY[0x1F412D048](this);
}

uint64_t mlcore::ItemPropertyGrouping(mlcore *this)
{
  return MEMORY[0x1F412D050](this);
}

uint64_t mlcore::ItemPropertyLocation(mlcore *this)
{
  return MEMORY[0x1F412D058](this);
}

uint64_t mlcore::ItemPropertyStopTime(mlcore *this)
{
  return MEMORY[0x1F412D060](this);
}

uint64_t mlcore::LocalizedSearchQuery::setPerScopeResultLimit(mlcore::LocalizedSearchQuery *this)
{
  return MEMORY[0x1F412D068](this);
}

uint64_t mlcore::LocalizedSearchQuery::cancel(mlcore::LocalizedSearchQuery *this)
{
  return MEMORY[0x1F412D070](this);
}

uint64_t mlcore::LocalizedSearchQuery::setScopes()
{
  return MEMORY[0x1F412D078]();
}

uint64_t mlcore::LocalizedSearchQuery::LocalizedSearchQuery()
{
  return MEMORY[0x1F412D080]();
}

uint64_t mlcore::LocalizedSearchScope::LocalizedSearchScope()
{
  return MEMORY[0x1F412D088]();
}

{
  return MEMORY[0x1F412D090]();
}

uint64_t mlcore::PersonPropertyHandle(mlcore *this)
{
  return MEMORY[0x1F412D098](this);
}

uint64_t mlcore::PlaylistItemReaction::EntityClass(mlcore::PlaylistItemReaction *this)
{
  return MEMORY[0x1F412D0A0](this);
}

uint64_t mlcore::PlaylistPropertyName(mlcore *this)
{
  return MEMORY[0x1F412D0A8](this);
}

uint64_t mlcore::AlbumPropertyHasTitle(mlcore *this)
{
  return MEMORY[0x1F412D0B0](this);
}

uint64_t mlcore::ArtistPropertyHasName(mlcore *this)
{
  return MEMORY[0x1F412D0B8](this);
}

uint64_t mlcore::ArtistPropertyStoreID(mlcore *this)
{
  return MEMORY[0x1F412D0C0](this);
}

uint64_t mlcore::ComposerPropertyOrder(mlcore *this)
{
  return MEMORY[0x1F412D0C8](this);
}

uint64_t mlcore::ItemPropertyCopyright(mlcore *this)
{
  return MEMORY[0x1F412D0D0](this);
}

uint64_t mlcore::ItemPropertyDateAdded(mlcore *this)
{
  return MEMORY[0x1F412D0D8](this);
}

uint64_t mlcore::ItemPropertyKeepLocal(mlcore *this)
{
  return MEMORY[0x1F412D0E8](this);
}

uint64_t mlcore::ItemPropertyMediaType(mlcore *this)
{
  return MEMORY[0x1F412D0F0](this);
}

uint64_t mlcore::ItemPropertyStartTime(mlcore *this)
{
  return MEMORY[0x1F412D0F8](this);
}

uint64_t mlcore::ItemPropertyTotalTime(mlcore *this)
{
  return MEMORY[0x1F412D100](this);
}

uint64_t mlcore::LocalizedSectionsInfo::LocalizedSectionsInfo()
{
  return MEMORY[0x1F412D108]();
}

uint64_t mlcore::MoviePropertyIsRental(mlcore *this)
{
  return MEMORY[0x1F412D110](this);
}

uint64_t mlcore::PropertiesQueryResult::enumerateResults()
{
  return MEMORY[0x1F412D118]();
}

uint64_t mlcore::AggregateFunctionQuery::AggregateFunctionQuery()
{
  return MEMORY[0x1F412D120]();
}

uint64_t mlcore::AlbumPropertyCopyright(mlcore *this)
{
  return MEMORY[0x1F412D128](this);
}

uint64_t mlcore::AlbumPropertyItemCount(mlcore *this)
{
  return MEMORY[0x1F412D130](this);
}

uint64_t mlcore::AlbumPropertyKeepLocal(mlcore *this)
{
  return MEMORY[0x1F412D138](this);
}

uint64_t mlcore::GetForeignPropertyBase()
{
  return MEMORY[0x1F412D140]();
}

uint64_t mlcore::ItemArtistPropertyName(mlcore *this)
{
  return MEMORY[0x1F412D148](this);
}

uint64_t mlcore::ItemPropertyDatePlayed(mlcore *this)
{
  return MEMORY[0x1F412D150](this);
}

uint64_t mlcore::ItemPropertyDiscNumber(mlcore *this)
{
  return MEMORY[0x1F412D158](this);
}

uint64_t mlcore::ItemPropertyIsExplicit(mlcore *this)
{
  return MEMORY[0x1F412D160](this);
}

uint64_t mlcore::ItemPropertyLikedState(mlcore *this)
{
  return MEMORY[0x1F412D168](this);
}

uint64_t mlcore::ItemPropertyTitleOrder(mlcore *this)
{
  return MEMORY[0x1F412D170](this);
}

uint64_t mlcore::ItemPropertyUserRating(mlcore *this)
{
  return MEMORY[0x1F412D178](this);
}

uint64_t mlcore::LocalizedSectionHeader::LocalizedSectionHeader()
{
  return MEMORY[0x1F412D180]();
}

uint64_t mlcore::PersonPropertyImageURL(mlcore *this)
{
  return MEMORY[0x1F412D188](this);
}

uint64_t mlcore::PlaylistPropertySyncID(mlcore *this)
{
  return MEMORY[0x1F412D190](this);
}

uint64_t mlcore::PlaylistPropertyTraits(mlcore *this)
{
  return MEMORY[0x1F412D198](this);
}

uint64_t mlcore::AlbumPropertyArtistName(mlcore *this)
{
  return MEMORY[0x1F412D1A0](this);
}

uint64_t mlcore::AlbumPropertyIsPreOrder(mlcore *this)
{
  return MEMORY[0x1F412D1A8](this);
}

uint64_t mlcore::AlbumPropertyLikedState(mlcore *this)
{
  return MEMORY[0x1F412D1B0](this);
}

uint64_t mlcore::ArtistPropertyItemCount(mlcore *this)
{
  return MEMORY[0x1F412D1B8](this);
}

uint64_t mlcore::ComposerPropertyHasName(mlcore *this)
{
  return MEMORY[0x1F412D1C0](this);
}

uint64_t mlcore::ItemArtistPropertyOrder(mlcore *this)
{
  return MEMORY[0x1F412D1C8](this);
}

uint64_t mlcore::ItemPropertyAlbumSyncID(mlcore *this)
{
  return MEMORY[0x1F412D1D0](this);
}

uint64_t mlcore::ItemPropertyCloudKVSKey(mlcore *this)
{
  return MEMORY[0x1F412D1E0](this);
}

uint64_t mlcore::ItemPropertyEpisodeType(mlcore *this)
{
  return MEMORY[0x1F412D1E8](this);
}

uint64_t mlcore::ItemPropertyInMyLibrary(mlcore *this)
{
  return MEMORY[0x1F412D1F0](this);
}

uint64_t mlcore::ItemPropertyIsMusicShow(mlcore *this)
{
  return MEMORY[0x1F412D1F8](this);
}

uint64_t mlcore::ItemPropertyIsProtected(mlcore *this)
{
  return MEMORY[0x1F412D200](this);
}

uint64_t mlcore::ItemPropertyTrackNumber(mlcore *this)
{
  return MEMORY[0x1F412D208](this);
}

uint64_t mlcore::LocalizedSortingDetails::LocalizedSortingDetails()
{
  return MEMORY[0x1F412D210]();
}

uint64_t mlcore::PlaylistPropertyIsOwner(mlcore *this)
{
  return MEMORY[0x1F412D218](this);
}

uint64_t mlcore::PlaylistPropertyIsSmart(mlcore *this)
{
  return MEMORY[0x1F412D220](this);
}

uint64_t mlcore::ArtistPropertyAlbumCount(mlcore *this)
{
  return MEMORY[0x1F412D228](this);
}

uint64_t mlcore::ArtistPropertyLikedState(mlcore *this)
{
  return MEMORY[0x1F412D230](this);
}

uint64_t mlcore::ItemPropertyAlbumStoreID(mlcore *this)
{
  return MEMORY[0x1F412D238](this);
}

uint64_t mlcore::ItemPropertyDateReleased(mlcore *this)
{
  return MEMORY[0x1F412D240](this);
}

uint64_t mlcore::ItemPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D248](this);
}

uint64_t mlcore::ItemPropertyStoreCloudID(mlcore *this)
{
  return MEMORY[0x1F412D250](this);
}

uint64_t mlcore::PlaylistItemPropertyUUID(mlcore *this)
{
  return MEMORY[0x1F412D258](this);
}

uint64_t mlcore::PlaylistPropertyIsHidden(mlcore *this)
{
  return MEMORY[0x1F412D260](this);
}

uint64_t mlcore::AlbumPropertyDateReleased(mlcore *this)
{
  return MEMORY[0x1F412D268](this);
}

uint64_t mlcore::AlbumPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D270](this);
}

uint64_t mlcore::AlbumPropertySeasonNumber(mlcore *this)
{
  return MEMORY[0x1F412D278](this);
}

uint64_t mlcore::ArtistPropertyGroupingKey(mlcore *this)
{
  return MEMORY[0x1F412D280](this);
}

uint64_t mlcore::GenrePropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D288](this);
}

uint64_t mlcore::ItemArtistPropertyHasName(mlcore *this)
{
  return MEMORY[0x1F412D290](this);
}

uint64_t mlcore::ItemArtistPropertyStoreID(mlcore *this)
{
  return MEMORY[0x1F412D298](this);
}

uint64_t mlcore::ItemPropertyArtistStoreID(mlcore *this)
{
  return MEMORY[0x1F412D2A0](this);
}

uint64_t mlcore::ItemPropertyClassicalWork(mlcore *this)
{
  return MEMORY[0x1F412D2A8](this);
}

uint64_t mlcore::ItemPropertyEpisodeSortID(mlcore *this)
{
  return MEMORY[0x1F412D2B0](this);
}

uint64_t mlcore::ItemPropertyHasBeenPlayed(mlcore *this)
{
  return MEMORY[0x1F412D2B8](this);
}

uint64_t mlcore::ItemPropertyHomeSharingID(mlcore *this)
{
  return MEMORY[0x1F412D2C0](this);
}

uint64_t mlcore::ItemPropertyPlayCountUser(mlcore *this)
{
  return MEMORY[0x1F412D2C8](this);
}

uint64_t mlcore::ItemPropertySkipCountUser(mlcore *this)
{
  return MEMORY[0x1F412D2D0](this);
}

uint64_t mlcore::PlaylistPropertyKeepLocal(mlcore *this)
{
  return MEMORY[0x1F412D2D8](this);
}

uint64_t mlcore::PlaylistPropertyNameOrder(mlcore *this)
{
  return MEMORY[0x1F412D2E0](this);
}

uint64_t mlcore::TVShowPropertySeriesOrder(mlcore *this)
{
  return MEMORY[0x1F412D2E8](this);
}

uint64_t mlcore::ArtistPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D2F0](this);
}

uint64_t mlcore::ItemPropertyAlbumLikeState(mlcore *this)
{
  return MEMORY[0x1F412D2F8](this);
}

uint64_t mlcore::ItemPropertyDateDownloaded(mlcore *this)
{
  return MEMORY[0x1F412D300](this);
}

uint64_t mlcore::ItemPropertyHLSAssetTraits(mlcore *this)
{
  return MEMORY[0x1F412D308](this);
}

uint64_t mlcore::ItemPropertyHasTrackNumber(mlcore *this)
{
  return MEMORY[0x1F412D310](this);
}

uint64_t mlcore::ItemPropertyItemArtistName(mlcore *this)
{
  return MEMORY[0x1F412D318](this);
}

uint64_t mlcore::ItemPropertyRelativeVolume(mlcore *this)
{
  return MEMORY[0x1F412D320](this);
}

uint64_t mlcore::ItemPropertyStoreAccountID(mlcore *this)
{
  return MEMORY[0x1F412D328](this);
}

uint64_t mlcore::LocalizedSearchQueryResult::resultForSearchScope()
{
  return MEMORY[0x1F412D330]();
}

uint64_t mlcore::PersonPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D338](this);
}

uint64_t mlcore::PlaylistAuthorPropertyRole(mlcore *this)
{
  return MEMORY[0x1F412D340](this);
}

uint64_t mlcore::PlaylistPropertyLikedState(mlcore *this)
{
  return MEMORY[0x1F412D348](this);
}

uint64_t mlcore::TVShowPropertyEpisodeCount(mlcore *this)
{
  return MEMORY[0x1F412D350](this);
}

uint64_t mlcore::AlbumPropertyCloudLibraryID(mlcore *this)
{
  return MEMORY[0x1F412D358](this);
}

uint64_t mlcore::AlbumPropertyDateDownloaded(mlcore *this)
{
  return MEMORY[0x1F412D360](this);
}

uint64_t mlcore::ComparisonPropertyPredicate::ComparisonPropertyPredicate()
{
  return MEMORY[0x1F412D368]();
}

uint64_t mlcore::ItemPropertyAlbumTrackCount(mlcore *this)
{
  return MEMORY[0x1F412D370](this);
}

uint64_t mlcore::ItemPropertyHLSKeyServerURL(mlcore *this)
{
  return MEMORY[0x1F412D378](this);
}

uint64_t mlcore::ItemPropertyKeepLocalStatus(mlcore *this)
{
  return MEMORY[0x1F412D380](this);
}

uint64_t mlcore::ItemPropertyLongDescription(mlcore *this)
{
  return MEMORY[0x1F412D388](this);
}

uint64_t mlcore::ItemPropertyStorePlaylistID(mlcore *this)
{
  return MEMORY[0x1F412D390](this);
}

uint64_t mlcore::PlaylistPropertyDateCreated(mlcore *this)
{
  return MEMORY[0x1F412D398](this);
}

uint64_t mlcore::PlaylistPropertyDescription(mlcore *this)
{
  return MEMORY[0x1F412D3A0](this);
}

uint64_t mlcore::TVShowPropertyHasSeriesName(mlcore *this)
{
  return MEMORY[0x1F412D3A8](this);
}

uint64_t mlcore::AlbumPropertyAllCompilations(mlcore *this)
{
  return MEMORY[0x1F412D3B0](this);
}

uint64_t mlcore::AlbumPropertyDatePlayedLocal(mlcore *this)
{
  return MEMORY[0x1F412D3B8](this);
}

uint64_t mlcore::AlbumPropertyKeepLocalStatus(mlcore *this)
{
  return MEMORY[0x1F412D3C0](this);
}

uint64_t mlcore::ComposerPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D3C8](this);
}

uint64_t mlcore::ItemArtistPropertySeriesName(mlcore *this)
{
  return MEMORY[0x1F412D3D0](this);
}

uint64_t mlcore::ItemPropertyAssetStoreItemID(mlcore *this)
{
  return MEMORY[0x1F412D3D8](this);
}

uint64_t mlcore::ItemPropertyBaseLocationPath(mlcore *this)
{
  return MEMORY[0x1F412D3E0](this);
}

uint64_t mlcore::ItemPropertyRemoteLocationID(mlcore *this)
{
  return MEMORY[0x1F412D3E8](this);
}

uint64_t mlcore::ItemPropertyStoreCloudStatus(mlcore *this)
{
  return MEMORY[0x1F412D3F0](this);
}

uint64_t mlcore::PlaylistItemPropertyPosition(mlcore *this)
{
  return MEMORY[0x1F412D3F8](this);
}

uint64_t mlcore::PlaylistPropertyDateModified(mlcore *this)
{
  return MEMORY[0x1F412D400](this);
}

uint64_t mlcore::PlaylistPropertyIsSubscribed(mlcore *this)
{
  return MEMORY[0x1F412D408](this);
}

uint64_t mlcore::PlaylistPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D410](this);
}

uint64_t mlcore::PlaylistPropertyStoreCloudID(mlcore *this)
{
  return MEMORY[0x1F412D418](this);
}

uint64_t mlcore::TVSeasonPropertyEpisodeCount(mlcore *this)
{
  return MEMORY[0x1F412D420](this);
}

uint64_t mlcore::ItemPropertyAlbumPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D428](this);
}

uint64_t mlcore::ItemPropertyClassicalMovement(mlcore *this)
{
  return MEMORY[0x1F412D430](this);
}

uint64_t mlcore::ItemPropertyDurationInSamples(mlcore *this)
{
  return MEMORY[0x1F412D438](this);
}

uint64_t mlcore::ItemPropertyGenrePersistentID(mlcore *this)
{
  return MEMORY[0x1F412D440](this);
}

uint64_t mlcore::ItemPropertyHasStreamingAsset(mlcore *this)
{
  return MEMORY[0x1F412D448](this);
}

uint64_t mlcore::ItemPropertyPurchaseHistoryID(mlcore *this)
{
  return MEMORY[0x1F412D450](this);
}

uint64_t mlcore::ItemPropertyStoreCloudAlbumID(mlcore *this)
{
  return MEMORY[0x1F412D458](this);
}

uint64_t mlcore::LocalizedSearchPropertyWeight(mlcore *this)
{
  return MEMORY[0x1F412D460](this);
}

uint64_t mlcore::PersonPropertyCloudIdentifier(mlcore *this)
{
  return MEMORY[0x1F412D468](this);
}

uint64_t mlcore::PlaylistAuthorSocialProfileID(mlcore *this)
{
  return MEMORY[0x1F412D470](this);
}

uint64_t mlcore::PlaylistPropertyCloudGlobalID(mlcore *this)
{
  return MEMORY[0x1F412D478](this);
}

uint64_t mlcore::PlaylistPropertyCloudIsPublic(mlcore *this)
{
  return MEMORY[0x1F412D480](this);
}

uint64_t mlcore::PlaylistPropertyCloudShareURL(mlcore *this)
{
  return MEMORY[0x1F412D488](this);
}

uint64_t mlcore::PlaylistPropertySmartIsFolder(mlcore *this)
{
  return MEMORY[0x1F412D490](this);
}

uint64_t mlcore::PlaylistPropertySmartIsGenius(mlcore *this)
{
  return MEMORY[0x1F412D498](this);
}

uint64_t mlcore::AlbumPropertyGenrePersistentID(mlcore *this)
{
  return MEMORY[0x1F412D4A0](this);
}

uint64_t mlcore::ArtistPropertyLibraryItemCount(mlcore *this)
{
  return MEMORY[0x1F412D4A8](this);
}

uint64_t mlcore::ItemArtistPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D4B0](this);
}

uint64_t mlcore::ItemPropertyContentRatingLevel(mlcore *this)
{
  return MEMORY[0x1F412D4B8](this);
}

uint64_t mlcore::ItemPropertyExcludeFromShuffle(mlcore *this)
{
  return MEMORY[0x1F412D4C0](this);
}

uint64_t mlcore::ItemPropertyHLSAudioCapability(mlcore *this)
{
  return MEMORY[0x1F412D4C8](this);
}

uint64_t mlcore::ItemPropertyHasCloudSyncSource(mlcore *this)
{
  return MEMORY[0x1F412D4D0](this);
}

uint64_t mlcore::PlaylistAuthorPropertyPosition(mlcore *this)
{
  return MEMORY[0x1F412D4D8](this);
}

uint64_t mlcore::PlaylistPropertyCloudIsVisible(mlcore *this)
{
  return MEMORY[0x1F412D4E0](this);
}

uint64_t mlcore::PlaylistPropertyDateDownloaded(mlcore *this)
{
  return MEMORY[0x1F412D4E8](this);
}

uint64_t mlcore::PlaylistPropertyIsCuratorOwned(mlcore *this)
{
  return MEMORY[0x1F412D4F0](this);
}

uint64_t mlcore::PlaylistPropertyIsSourceRemote(mlcore *this)
{
  return MEMORY[0x1F412D4F8](this);
}

uint64_t mlcore::PlaylistPropertySmartIsDynamic(mlcore *this)
{
  return MEMORY[0x1F412D500](this);
}

uint64_t mlcore::PlaylistPropertySmartIsLimited(mlcore *this)
{
  return MEMORY[0x1F412D508](this);
}

uint64_t mlcore::TVEpisodePropertyEpisodeSortID(mlcore *this)
{
  return MEMORY[0x1F412D510](this);
}

uint64_t mlcore::AlbumPropertyArtistPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D518](this);
}

uint64_t mlcore::CloudKVSEntityPropertyPlayCount(mlcore *this)
{
  return MEMORY[0x1F412D520](this);
}

uint64_t mlcore::ItemPropertyCloudAssetAvailable(mlcore *this)
{
  return MEMORY[0x1F412D528](this);
}

uint64_t mlcore::ItemPropertyEpisodeSubSortOrder(mlcore *this)
{
  return MEMORY[0x1F412D530](this);
}

uint64_t mlcore::ItemPropertyIsMasteredForiTunes(mlcore *this)
{
  return MEMORY[0x1F412D538](this);
}

uint64_t mlcore::ItemPropertyPodcastExternalGUID(mlcore *this)
{
  return MEMORY[0x1F412D540](this);
}

uint64_t mlcore::ItemPropertyStoreNeedsReporting(mlcore *this)
{
  return MEMORY[0x1F412D548](this);
}

uint64_t mlcore::ItemPropertyVolumeNormalization(mlcore *this)
{
  return MEMORY[0x1F412D550](this);
}

uint64_t mlcore::PlaylistAuthorPropertyIsPending(mlcore *this)
{
  return MEMORY[0x1F412D558](this);
}

uint64_t mlcore::PlaylistCategoryTypeIsEditorial(mlcore *this)
{
  return MEMORY[0x1F412D560](this);
}

uint64_t mlcore::PlaylistPropertyCloudAuthorName(mlcore *this)
{
  return MEMORY[0x1F412D568](this);
}

uint64_t mlcore::PlaylistPropertyDatePlayedLocal(mlcore *this)
{
  return MEMORY[0x1F412D570](this);
}

uint64_t mlcore::PlaylistPropertyIsCollaborative(mlcore *this)
{
  return MEMORY[0x1F412D578](this);
}

uint64_t mlcore::PlaylistPropertyKeepLocalStatus(mlcore *this)
{
  return MEMORY[0x1F412D580](this);
}

uint64_t mlcore::AlbumPropertyLatestItemDateAdded(mlcore *this)
{
  return MEMORY[0x1F412D588](this);
}

uint64_t mlcore::AlbumPropertyVolumeNormalization(mlcore *this)
{
  return MEMORY[0x1F412D590](this);
}

uint64_t mlcore::GenrePropertyLatestItemDateAdded(mlcore *this)
{
  return MEMORY[0x1F412D598](this);
}

uint64_t mlcore::ItemPropertyComposerPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D5A0](this);
}

uint64_t mlcore::ItemPropertyGaplessEncodingDelay(mlcore *this)
{
  return MEMORY[0x1F412D5A8](this);
}

uint64_t mlcore::ItemPropertyGaplessEncodingDrain(mlcore *this)
{
  return MEMORY[0x1F412D5B0](this);
}

uint64_t mlcore::ItemPropertyGaplessHeuristicInfo(mlcore *this)
{
  return MEMORY[0x1F412D5B8](this);
}

uint64_t mlcore::ItemPropertyHLSKeyCertificateURL(mlcore *this)
{
  return MEMORY[0x1F412D5C0](this);
}

uint64_t mlcore::ItemPropertyHLSKeyServerProtocol(mlcore *this)
{
  return MEMORY[0x1F412D5C8](this);
}

uint64_t mlcore::ItemPropertyHasNonPurgeableAsset(mlcore *this)
{
  return MEMORY[0x1F412D5D0](this);
}

uint64_t mlcore::ItemPropertyKeepLocalConstraints(mlcore *this)
{
  return MEMORY[0x1F412D5D8](this);
}

uint64_t mlcore::ItemPropertyRememberBookmarkTime(mlcore *this)
{
  return MEMORY[0x1F412D5E0](this);
}

uint64_t mlcore::ItemPropertyReportingStoreItemID(mlcore *this)
{
  return MEMORY[0x1F412D5E8](this);
}

uint64_t mlcore::ItemPropertyShowComposerAsArtist(mlcore *this)
{
  return MEMORY[0x1F412D5F0](this);
}

uint64_t mlcore::ItemPropertyStoreCanonicalItemId(mlcore *this)
{
  return MEMORY[0x1F412D5F8](this);
}

uint64_t mlcore::ItemPropertyStoreLyricsAvailable(mlcore *this)
{
  return MEMORY[0x1F412D600](this);
}

uint64_t mlcore::PlaylistCategoryTypeIsUserShared(mlcore *this)
{
  return MEMORY[0x1F412D608](this);
}

uint64_t mlcore::PlaylistItemPropertyOccurrenceID(mlcore *this)
{
  return MEMORY[0x1F412D610](this);
}

uint64_t mlcore::PlaylistItemPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D618](this);
}

uint64_t mlcore::PlaylistItemPropertyPositionUUID(mlcore *this)
{
  return MEMORY[0x1F412D620](this);
}

uint64_t mlcore::PlaylistItemReactionPropertyDate(mlcore *this)
{
  return MEMORY[0x1F412D628](this);
}

uint64_t mlcore::PlaylistPropertyCloudVersionHash(mlcore *this)
{
  return MEMORY[0x1F412D630](this);
}

uint64_t mlcore::PlaylistPropertyIsFavoritedSongs(mlcore *this)
{
  return MEMORY[0x1F412D638](this);
}

uint64_t mlcore::AlbumPropertyKeepLocalConstraints(mlcore *this)
{
  return MEMORY[0x1F412D640](this);
}

uint64_t mlcore::ArtistPropertyLatestItemDateAdded(mlcore *this)
{
  return MEMORY[0x1F412D648](this);
}

uint64_t mlcore::ItemPropertyAvailableArtworkToken(mlcore *this)
{
  return MEMORY[0x1F412D650](this);
}

uint64_t mlcore::ItemPropertyFetchableArtworkToken(mlcore *this)
{
  return MEMORY[0x1F412D658](this);
}

uint64_t mlcore::ItemPropertyHasLoFiStreamingAsset(mlcore *this)
{
  return MEMORY[0x1F412D660](this);
}

uint64_t mlcore::ItemPropertyIsStoreRedownloadable(mlcore *this)
{
  return MEMORY[0x1F412D668](this);
}

uint64_t mlcore::ItemPropertyKeepLocalStatusReason(mlcore *this)
{
  return MEMORY[0x1F412D670](this);
}

uint64_t mlcore::ItemPropertyLikedStateChangedDate(mlcore *this)
{
  return MEMORY[0x1F412D678](this);
}

uint64_t mlcore::PlaylistCategoryTypeIsPersonalMix(mlcore *this)
{
  return MEMORY[0x1F412D680](this);
}

uint64_t mlcore::PlaylistPropertyCloudAuthorHandle(mlcore *this)
{
  return MEMORY[0x1F412D688](this);
}

uint64_t mlcore::PlaylistPropertyCollaborationMode(mlcore *this)
{
  return MEMORY[0x1F412D690](this);
}

uint64_t mlcore::AlbumPropertyContainsClassicalWork(mlcore *this)
{
  return MEMORY[0x1F412D698](this);
}

uint64_t mlcore::AlbumPropertyIsStoreRedownloadable(mlcore *this)
{
  return MEMORY[0x1F412D6A0](this);
}

uint64_t mlcore::AlbumPropertyKeepLocalStatusReason(mlcore *this)
{
  return MEMORY[0x1F412D6A8](this);
}

uint64_t mlcore::AlbumPropertyLikedStateChangedDate(mlcore *this)
{
  return MEMORY[0x1F412D6B0](this);
}

uint64_t mlcore::CloudKVSEntityPropertyBookmarkTime(mlcore *this)
{
  return MEMORY[0x1F412D6B8](this);
}

uint64_t mlcore::ItemPropertyClassicalMovementCount(mlcore *this)
{
  return MEMORY[0x1F412D6C0](this);
}

uint64_t mlcore::ItemPropertyEpisodeTypeDisplayName(mlcore *this)
{
  return MEMORY[0x1F412D6C8](this);
}

uint64_t mlcore::ItemPropertyGaplessLastFrameResync(mlcore *this)
{
  return MEMORY[0x1F412D6D0](this);
}

uint64_t mlcore::ItemPropertyItemArtistPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D6D8](this);
}

uint64_t mlcore::ItemPropertyLibraryLyricsAvailable(mlcore *this)
{
  return MEMORY[0x1F412D6E0](this);
}

uint64_t mlcore::PlaylistAuthorPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D6E8](this);
}

uint64_t mlcore::PlaylistPropertyCloudAuthorStoreID(mlcore *this)
{
  return MEMORY[0x1F412D6F0](this);
}

uint64_t mlcore::PlaylistPropertyCollaboratorStatus(mlcore *this)
{
  return MEMORY[0x1F412D6F8](this);
}

uint64_t mlcore::PlaylistPropertyCoverArtworkRecipe(mlcore *this)
{
  return MEMORY[0x1F412D700](this);
}

uint64_t mlcore::PlaylistPropertyParentPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D708](this);
}

uint64_t mlcore::PlaylistPropertyShouldDisplayIndex(mlcore *this)
{
  return MEMORY[0x1F412D710](this);
}

uint64_t mlcore::AlbumPropertyLibraryTracksItemCount(mlcore *this)
{
  return MEMORY[0x1F412D718](this);
}

uint64_t mlcore::AlbumPropertyMaximumItemTrackNumber(mlcore *this)
{
  return MEMORY[0x1F412D720](this);
}

uint64_t mlcore::ArtistPropertyAvailableArtworkToken(mlcore *this)
{
  return MEMORY[0x1F412D728](this);
}

uint64_t mlcore::ArtistPropertyFetchableArtworkToken(mlcore *this)
{
  return MEMORY[0x1F412D730](this);
}

uint64_t mlcore::ArtistPropertyLikedStateChangedDate(mlcore *this)
{
  return MEMORY[0x1F412D738](this);
}

uint64_t mlcore::CloudKVSEntityPropertyHasBeenPlayed(mlcore *this)
{
  return MEMORY[0x1F412D740](this);
}

uint64_t mlcore::ComposerPropertyLatestItemDateAdded(mlcore *this)
{
  return MEMORY[0x1F412D748](this);
}

uint64_t mlcore::ItemPropertyAlbumArtistPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D750](this);
}

uint64_t mlcore::ItemPropertyClassicalMovementNumber(mlcore *this)
{
  return MEMORY[0x1F412D758](this);
}

uint64_t mlcore::ItemPropertyIsArtistUploadedContent(mlcore *this)
{
  return MEMORY[0x1F412D760](this);
}

uint64_t mlcore::ItemPropertySubscriptionStoreItemID(mlcore *this)
{
  return MEMORY[0x1F412D768](this);
}

uint64_t mlcore::PersonPropertyHasLightweightProfile(mlcore *this)
{
  return MEMORY[0x1F412D770](this);
}

uint64_t mlcore::TVSeasonPropertyLatestItemDateAdded(mlcore *this)
{
  return MEMORY[0x1F412D778](this);
}

uint64_t mlcore::PlaylistItemPropertyItemPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D780](this);
}

uint64_t mlcore::PlaylistPropertyKeepLocalConstraints(mlcore *this)
{
  return MEMORY[0x1F412D788](this);
}

uint64_t mlcore::ArtistPropertyCloudUniversalLibraryID(mlcore *this)
{
  return MEMORY[0x1F412D790](this);
}

uint64_t mlcore::ItemPropertyHomeSharingAssetAvailable(mlcore *this)
{
  return MEMORY[0x1F412D798](this);
}

uint64_t mlcore::ItemPropertyMatchRedownloadParameters(mlcore *this)
{
  return MEMORY[0x1F412D7A0](this);
}

uint64_t mlcore::ItemPropertyStorePlaybackEndpointType(mlcore *this)
{
  return MEMORY[0x1F412D7A8](this);
}

uint64_t mlcore::ItemPropertyTimeSyncedLyricsAvailable(mlcore *this)
{
  return MEMORY[0x1F412D7B0](this);
}

uint64_t mlcore::PlaylistPropertyAvailableArtworkToken(mlcore *this)
{
  return MEMORY[0x1F412D7B8](this);
}

uint64_t mlcore::PlaylistPropertyFetchableArtworkToken(mlcore *this)
{
  return MEMORY[0x1F412D7C0](this);
}

uint64_t mlcore::PlaylistPropertyKeepLocalStatusReason(mlcore *this)
{
  return MEMORY[0x1F412D7C8](this);
}

uint64_t mlcore::PlaylistPropertyLikedStateChangedDate(mlcore *this)
{
  return MEMORY[0x1F412D7D0](this);
}

uint64_t mlcore::ItemPropertyFetchableArtworkSourceType(mlcore *this)
{
  return MEMORY[0x1F412D7D8](this);
}

uint64_t mlcore::ItemPropertyStoreTVShowCanonicalItemId(mlcore *this)
{
  return MEMORY[0x1F412D7E0](this);
}

uint64_t mlcore::ItemArtistPropertyAvailableArtworkToken(mlcore *this)
{
  return MEMORY[0x1F412D7E8](this);
}

uint64_t mlcore::ItemArtistPropertyFetchableArtworkToken(mlcore *this)
{
  return MEMORY[0x1F412D7F0](this);
}

uint64_t mlcore::PlaylistPropertyCloudUniversalLibraryID(mlcore *this)
{
  return MEMORY[0x1F412D7F8](this);
}

uint64_t mlcore::PlaylistPropertyCollaboratorPermissions(mlcore *this)
{
  return MEMORY[0x1F412D800](this);
}

uint64_t mlcore::PlaylistPropertyIsTracklistUserEditable(mlcore *this)
{
  return MEMORY[0x1F412D808](this);
}

uint64_t mlcore::AlbumPropertyRepresentativeItemMediaType(mlcore *this)
{
  return MEMORY[0x1F412D810](this);
}

uint64_t mlcore::ArtistPropertyFetchableArtworkSourceType(mlcore *this)
{
  return MEMORY[0x1F412D818](this);
}

uint64_t mlcore::ItemPropertyStoreCloudUniversalLibraryID(mlcore *this)
{
  return MEMORY[0x1F412D820](this);
}

uint64_t mlcore::ItemPropertyStoreExtendedLyricsAttribute(mlcore *this)
{
  return MEMORY[0x1F412D828](this);
}

uint64_t mlcore::ItemPropertyStoreTVSeasonCanonicalItemId(mlcore *this)
{
  return MEMORY[0x1F412D830](this);
}

uint64_t mlcore::PlaylistAuthorPropertyPersonPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D838](this);
}

uint64_t mlcore::PlaylistItemReactionPropertyPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D840](this);
}

uint64_t mlcore::PlaylistItemReactionPropertyReactionText(mlcore *this)
{
  return MEMORY[0x1F412D848](this);
}

uint64_t mlcore::PlaylistPropertyIsExternalVendorPlaylist(mlcore *this)
{
  return MEMORY[0x1F412D850](this);
}

uint64_t mlcore::TVSeasonPropertyLatestItemDateDownloaded(mlcore *this)
{
  return MEMORY[0x1F412D858](this);
}

uint64_t mlcore::AlbumPropertyClassicalExperienceAvailable(mlcore *this)
{
  return MEMORY[0x1F412D860](this);
}

uint64_t mlcore::PlaylistItemPropertyAvailableArtworkToken(mlcore *this)
{
  return MEMORY[0x1F412D868](this);
}

uint64_t mlcore::PlaylistItemPropertyFetchableArtworkToken(mlcore *this)
{
  return MEMORY[0x1F412D870](this);
}

uint64_t mlcore::PlaylistPropertyExternalVendorDisplayName(mlcore *this)
{
  return MEMORY[0x1F412D878](this);
}

uint64_t mlcore::TVEpisodePropertyAvailableScreenshotToken(mlcore *this)
{
  return MEMORY[0x1F412D880](this);
}

uint64_t mlcore::TVEpisodePropertyFetchableScreenshotToken(mlcore *this)
{
  return MEMORY[0x1F412D888](this);
}

uint64_t mlcore::ArtistPropertyClassicalExperienceAvailable(mlcore *this)
{
  return MEMORY[0x1F412D890](this);
}

uint64_t mlcore::PlaylistPropertyCollaborationInvitationURL(mlcore *this)
{
  return MEMORY[0x1F412D898](this);
}

uint64_t mlcore::PlaylistPropertyFetchableArtworkSourceType(mlcore *this)
{
  return MEMORY[0x1F412D8A0](this);
}

uint64_t mlcore::AlbumPropertyRepresentativeItemPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D8A8](this);
}

uint64_t mlcore::AlbumPropertyRepresentativeItemShowSortType(mlcore *this)
{
  return MEMORY[0x1F412D8B0](this);
}

uint64_t mlcore::PlaylistAuthorPropertyContainerPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D8B8](this);
}

uint64_t mlcore::ArtistPropertyRepresentativeItemPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D8C0](this);
}

uint64_t mlcore::ItemArtistPropertyFetchableArtworkSourceType(mlcore *this)
{
  return MEMORY[0x1F412D8C8](this);
}

uint64_t mlcore::ContainerItemPersonPropertyPersonPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D8D0](this);
}

uint64_t mlcore::PlaylistPropertyIsSubscribedAndNotPersonalMix(mlcore *this)
{
  return MEMORY[0x1F412D8D8](this);
}

uint64_t mlcore::ItemArtistPropertyClassicalExperienceAvailable(mlcore *this)
{
  return MEMORY[0x1F412D8E0](this);
}

uint64_t mlcore::PlaylistItemPropertyFetchableArtworkSourceType(mlcore *this)
{
  return MEMORY[0x1F412D8E8](this);
}

uint64_t mlcore::PlaylistItemReactionPropertyPersonPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D8F0](this);
}

uint64_t mlcore::TVEpisodePropertyFetchableScreenshotSourceType(mlcore *this)
{
  return MEMORY[0x1F412D8F8](this);
}

uint64_t mlcore::ItemPropertyPurchaseHistoryRedownloadParameters(mlcore *this)
{
  return MEMORY[0x1F412D900](this);
}

uint64_t mlcore::PlaylistPropertyCollaborationJoinRequestPending(mlcore *this)
{
  return MEMORY[0x1F412D908](this);
}

uint64_t mlcore::ItemArtistPropertyRepresentativeItemPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D910](this);
}

uint64_t mlcore::Item::EntityClass(mlcore::Item *this)
{
  return MEMORY[0x1F412D918](this);
}

uint64_t mlcore::AlbumPropertyRepresentativeItemAvailableArtworkToken(mlcore *this)
{
  return MEMORY[0x1F412D920](this);
}

uint64_t mlcore::AlbumPropertyRepresentativeItemCollectionDescription(mlcore *this)
{
  return MEMORY[0x1F412D928](this);
}

uint64_t mlcore::AlbumPropertyRepresentativeItemFetchableArtworkToken(mlcore *this)
{
  return MEMORY[0x1F412D930](this);
}

uint64_t mlcore::PlaylistItemReactionPropertyContainerItemPersistentID(mlcore *this)
{
  return MEMORY[0x1F412D938](this);
}

uint64_t mlcore::PlaylistPropertyCollaborationInvitationURLExpirationDate(mlcore *this)
{
  return MEMORY[0x1F412D940](this);
}

uint64_t mlcore::AlbumPropertyRepresentativeItemFetchableArtworkSourceType(mlcore *this)
{
  return MEMORY[0x1F412D948](this);
}

uint64_t mlcore::Album::EntityClass(mlcore::Album *this)
{
  return MEMORY[0x1F412D950](this);
}

uint64_t mlcore::Genre::EntityClass(mlcore::Genre *this)
{
  return MEMORY[0x1F412D958](this);
}

uint64_t mlcore::Genre::Genre(mlcore::Genre *this)
{
  return MEMORY[0x1F412D960](this);
}

uint64_t mlcore::Movie::EntityClass(mlcore::Movie *this)
{
  return MEMORY[0x1F412D968](this);
}

uint64_t mlcore::Query::setPredicate()
{
  return MEMORY[0x1F412D970]();
}

uint64_t mlcore::Query::Query()
{
  return MEMORY[0x1F412D978]();
}

uint64_t mlcore::Artist::EntityClass(mlcore::Artist *this)
{
  return MEMORY[0x1F412D980](this);
}

uint64_t mlcore::Artist::Artist(mlcore::Artist *this)
{
  return MEMORY[0x1F412D988](this);
}

uint64_t mlcore::Entity::propertyCache(mlcore::Entity *this)
{
  return MEMORY[0x1F412D990](this);
}

uint64_t mlcore::Person::EntityClass(mlcore::Person *this)
{
  return MEMORY[0x1F412D998](this);
}

uint64_t mlcore::TVShow::EntityClass(mlcore::TVShow *this)
{
  return MEMORY[0x1F412D9A0](this);
}

uint64_t mlcore::TVShow::TVShow(mlcore::TVShow *this)
{
  return MEMORY[0x1F412D9A8](this);
}

uint64_t mlcore::Library::createLibrary()
{
  return MEMORY[0x1F412D9B0]();
}

uint64_t mlcore::Podcast::EntityClass(mlcore::Podcast *this)
{
  return MEMORY[0x1F412D9B8](this);
}

uint64_t mlcore::Section::Section()
{
  return MEMORY[0x1F412D9C0]();
}

uint64_t mlcore::Composer::EntityClass(mlcore::Composer *this)
{
  return MEMORY[0x1F412D9C8](this);
}

uint64_t mlcore::Composer::Composer(mlcore::Composer *this)
{
  return MEMORY[0x1F412D9D0](this);
}

uint64_t mlcore::Playlist::EntityClass(mlcore::Playlist *this)
{
  return MEMORY[0x1F412D9D8](this);
}

uint64_t mlcore::Playlist::Playlist(mlcore::Playlist *this)
{
  return MEMORY[0x1F412D9E0](this);
}

uint64_t mlcore::TVSeason::EntityClass(mlcore::TVSeason *this)
{
  return MEMORY[0x1F412D9E8](this);
}

uint64_t mlcore::TVEpisode::EntityClass(mlcore::TVEpisode *this)
{
  return MEMORY[0x1F412D9F0](this);
}

uint64_t mediaplatform::DatabaseTableBase::name(mediaplatform::DatabaseTableBase *this)
{
  return MEMORY[0x1F412D9F8](this);
}

uint64_t mediaplatform::Data::bytes(mediaplatform::Data *this)
{
  return MEMORY[0x1F412DA00](this);
}

uint64_t mediaplatform::Data::length(mediaplatform::Data *this)
{
  return MEMORY[0x1F412DA08](this);
}

uint64_t mlcore::MediaError::operator BOOL()
{
  return MEMORY[0x1F412DA10]();
}

uint64_t mlcore::EntityQuery::identityPropertiesToFetch(mlcore::EntityQuery *this)
{
  return MEMORY[0x1F412DA18](this);
}

uint64_t mlcore::LibraryView::filterPredicateForEntityClass()
{
  return MEMORY[0x1F412DA20]();
}

uint64_t mlcore::LibraryView::filters(mlcore::LibraryView *this)
{
  return MEMORY[0x1F412DA28](this);
}

uint64_t mlcore::QueryResult::error(mlcore::QueryResult *this)
{
  return MEMORY[0x1F412DA30](this);
}

uint64_t mlcore::PropertyCache::hasValueForProperty(mlcore::PropertyCache *this, ModelPropertyBase *a2)
{
  return MEMORY[0x1F412DA38](this, a2);
}

uint64_t mlcore::SortDescriptor::ordering(mlcore::SortDescriptor *this)
{
  return MEMORY[0x1F412DA40](this);
}

uint64_t mlcore::SortDescriptor::property(mlcore::SortDescriptor *this)
{
  return MEMORY[0x1F412DA48](this);
}

uint64_t mlcore::PropertiesQuery::propertiesToFetch(mlcore::PropertiesQuery *this)
{
  return MEMORY[0x1F412DA50](this);
}

uint64_t mlcore::EntityQueryResult::entityCache(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1F412DA58](this);
}

uint64_t mlcore::EntityQueryResult::entityCount(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1F412DA60](this);
}

uint64_t mlcore::EntityQueryResult::entityRevision(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1F412DA68](this);
}

uint64_t mlcore::EntityQueryResult::persistentIDAtIndex(mlcore::EntityQueryResult *this)
{
  return MEMORY[0x1F412DA70](this);
}

uint64_t mlcore::PropertiesQueryResult::allResults(mlcore::PropertiesQueryResult *this)
{
  return MEMORY[0x1F412DA78](this);
}

uint64_t mlcore::AggregateFunctionQueryResult::value(mlcore::AggregateFunctionQueryResult *this)
{
  return MEMORY[0x1F412DA80](this);
}

uint64_t mlcore::Query::entityClass(mlcore::Query *this)
{
  return MEMORY[0x1F412DA88](this);
}

uint64_t mlcore::Query::predicate(mlcore::Query *this)
{
  return MEMORY[0x1F412DA90](this);
}

uint64_t mlcore::Section::sectionIndex(mlcore::Section *this)
{
  return MEMORY[0x1F412DA98](this);
}

uint64_t mlcore::Section::localizedTitle(mlcore::Section *this)
{
  return MEMORY[0x1F412DAA0](this);
}

uint64_t mlcore::Section::range(mlcore::Section *this)
{
  return MEMORY[0x1F412DAA8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E450](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

uint64_t __UIApplicationLinkedOnOrAfter()
{
  return MEMORY[0x1F4167120]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1F417EFA8](lpsrc, lpstype, lpdtype, s2d);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1F41814E0](cls, protocol);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

objc_property_t class_getProperty(Class cls, const char *name)
{
  return (objc_property_t)MEMORY[0x1F4181550](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA20](data1, data2);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA0](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x1F40CC810](a1, a2);
  result.rem = v3;
  result.uint64_t quot = v2;
  return result;
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x1F40CC850](a1, a2);
  result.rem = v3;
  result.uint64_t quot = v2;
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

float log10f(float a1)
{
  MEMORY[0x1F40CC888](a1);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1F40CCD70]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

uint64_t msv_dispatch_async_on_queue()
{
  return MEMORY[0x1F412ED10]();
}

uint64_t msv_dispatch_on_main_queue()
{
  return MEMORY[0x1F412ED18]();
}

uint64_t msv_dispatch_sync_on_queue()
{
  return MEMORY[0x1F412ED20]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

char *__cdecl property_copyAttributeValue(objc_property_t property, const char *attributeName)
{
  return (char *)MEMORY[0x1F4181AC0](property, attributeName);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1F4181B00](proto, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  double v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x1F4181B30](str);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1F4181B38](lhs, rhs);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2C0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}