@interface MPModelLibraryModelSectionedCollectionDataSource
- (BOOL)_allowedEntityIdentifiersContainsAllPersistentIDs;
- (BOOL)hasSameContentAsDataSource:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MPModelLibraryModelSectionedCollectionDataSource)initWithRequest:(id)a3 sectionQueryResults:(shared_ptr<mlcore:(void *)a5 :EntityQueryResult>)a4 itemQueryResults:;
- (MPModelLibraryRequest)request;
- (id).cxx_construct;
- (id)identifiersForItemAtIndexPath:(id)a3;
- (id)identifiersForSectionAtIndex:(int64_t)a3;
- (id)indexPathForItemWithIdentifiersIntersectingSet:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (shared_ptr<mlcore::EntityQueryResult>)sectionEntityQueryResult;
- (shared_ptr<std::map<long)itemEntityQueryResults;
- (unint64_t)_adjustedIndexForSectionIndex:(int64_t)a3;
- (unint64_t)hash;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)_populateIndexMap;
@end

@implementation MPModelLibraryModelSectionedCollectionDataSource

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = (char *)self + 56;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_sectionEntityQueryResult.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_itemEntityQueryResults.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
  objc_storeStrong((id *)&self->_request, 0);
  std::__tree<std::__value_type<long long,unsigned long>,std::__map_value_compare<long long,std::__value_type<long long,unsigned long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,unsigned long>>>::destroy((void *)self->_allowedSectionPersistentIDToSectionQueryResultsIndexMap.__tree_.__pair1_.__value_.__left_);
  begin = self->_allowedSectionPersistentIDs.__begin_;
  if (begin)
  {
    self->_allowedSectionPersistentIDs.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_sectionTranslationContext, 0);

  objc_storeStrong((id *)&self->_itemTranslationContext, 0);
}

- (MPModelLibraryRequest)request
{
  return self->_request;
}

- (shared_ptr<mlcore::EntityQueryResult>)sectionEntityQueryResult
{
  cntrl = self->_sectionEntityQueryResult.__cntrl_;
  *v2 = self->_sectionEntityQueryResult.__ptr_;
  v2[1] = (EntityQueryResult *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (EntityQueryResult *)self;
  return result;
}

- (shared_ptr<std::map<long)itemEntityQueryResults
{
  cntrl = self->_itemEntityQueryResults.__cntrl_;
  *v2 = self->_itemEntityQueryResults.__ptr_;
  v2[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (unint64_t)hash
{
  uint64_t v2 = MSVHasherSharedSeed();
  unint64_t v75 = 0;
  unint64_t v81 = 0;
  uint64_t v77 = v2 ^ 0x736F6D6570736575;
  uint64_t v78 = v3 ^ 0x646F72616E646F6DLL;
  uint64_t v79 = v2 ^ 0x6C7967656E657261;
  uint64_t v80 = v3 ^ 0x7465646279746573;
  while (v75 < mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_))
  {
    uint64_t v4 = mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
    unint64_t v5 = v81;
    if ((v81 & 0x400000000000000) != 0)
    {
      if ((v81 & 0x300000000000000) != 0)
      {
        v42 = [MEMORY[0x1E4F28B00] currentHandler];
        v43 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
        objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v81);

        unint64_t v5 = v81;
      }
      uint64_t v12 = v5 & 0xFFFFFFFFFFFFFFLL | (v4 << 32);
      uint64_t v13 = (v77 + v78) ^ __ROR8__(v78, 51);
      uint64_t v14 = v79 + (v12 ^ v80);
      uint64_t v15 = __ROR8__(v12 ^ v80, 48);
      uint64_t v16 = (v14 ^ v15) + __ROR8__(v77 + v78, 32);
      uint64_t v17 = v16 ^ __ROR8__(v14 ^ v15, 43);
      uint64_t v18 = v14 + v13;
      uint64_t v79 = __ROR8__(v18, 32);
      uint64_t v80 = v17;
      uint64_t v77 = v16 ^ v12;
      uint64_t v78 = v18 ^ __ROR8__(v13, 47);
      unint64_t v5 = v5 & 0xFF00000000000000 | HIDWORD(v4);
    }
    else
    {
      if ((v81 & 0x7FFFFFFFFFFFFFFLL) != 0)
      {
        v40 = [MEMORY[0x1E4F28B00] currentHandler];
        v41 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
        [v40 handleFailureInFunction:v41, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v81 file lineNumber description];

        unint64_t v5 = v81;
      }
      uint64_t v6 = (v77 + v78) ^ __ROR8__(v78, 51);
      uint64_t v7 = v79 + (v80 ^ v4);
      uint64_t v8 = __ROR8__(v80 ^ v4, 48);
      uint64_t v9 = (v7 ^ v8) + __ROR8__(v77 + v78, 32);
      uint64_t v10 = v9 ^ __ROR8__(v7 ^ v8, 43);
      uint64_t v11 = v7 + v6;
      uint64_t v79 = __ROR8__(v11, 32);
      uint64_t v80 = v10;
      uint64_t v77 = v9 ^ v4;
      uint64_t v78 = v11 ^ __ROR8__(v6, 47);
    }
    unint64_t v81 = v5 + 0x800000000000000;
    v19 = (mlcore::EntityQueryResult **)std::map<long,MPIdentifierSet * {__strong}>::at(*((void **)self->_itemEntityQueryResults.__ptr_ + 1), v4);
    v21 = *v19;
    v20 = (std::__shared_weak_count *)v19[1];
    if (v20) {
      atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    for (unint64_t i = 0; i < mlcore::EntityQueryResult::entityCount(v21); ++i)
    {
      uint64_t v23 = mlcore::EntityQueryResult::persistentIDAtIndex(v21);
      unint64_t v24 = v81;
      if ((v81 & 0x400000000000000) != 0)
      {
        if ((v81 & 0x300000000000000) != 0)
        {
          v74 = [MEMORY[0x1E4F28B00] currentHandler];
          v39 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
          objc_msgSend(v74, "handleFailureInFunction:file:lineNumber:description:", v39, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v81);

          unint64_t v24 = v81;
        }
        uint64_t v31 = v24 & 0xFFFFFFFFFFFFFFLL | (v23 << 32);
        uint64_t v32 = (v77 + v78) ^ __ROR8__(v78, 51);
        uint64_t v33 = v79 + (v31 ^ v80);
        uint64_t v34 = __ROR8__(v31 ^ v80, 48);
        uint64_t v35 = (v33 ^ v34) + __ROR8__(v77 + v78, 32);
        uint64_t v36 = v35 ^ __ROR8__(v33 ^ v34, 43);
        uint64_t v37 = v33 + v32;
        uint64_t v79 = __ROR8__(v37, 32);
        uint64_t v80 = v36;
        uint64_t v77 = v35 ^ v31;
        uint64_t v78 = v37 ^ __ROR8__(v32, 47);
        unint64_t v24 = v24 & 0xFF00000000000000 | HIDWORD(v23);
      }
      else
      {
        if ((v81 & 0x7FFFFFFFFFFFFFFLL) != 0)
        {
          v73 = [MEMORY[0x1E4F28B00] currentHandler];
          v38 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
          [v73 handleFailureInFunction:v38, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v81 file lineNumber description];

          unint64_t v24 = v81;
        }
        uint64_t v25 = (v77 + v78) ^ __ROR8__(v78, 51);
        uint64_t v26 = v79 + (v80 ^ v23);
        uint64_t v27 = __ROR8__(v80 ^ v23, 48);
        uint64_t v28 = (v26 ^ v27) + __ROR8__(v77 + v78, 32);
        uint64_t v29 = v28 ^ __ROR8__(v26 ^ v27, 43);
        uint64_t v30 = v26 + v25;
        uint64_t v79 = __ROR8__(v30, 32);
        uint64_t v80 = v29;
        uint64_t v77 = v28 ^ v23;
        uint64_t v78 = v30 ^ __ROR8__(v25, 47);
      }
      unint64_t v81 = v24 + 0x800000000000000;
    }
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
    ++v75;
  }
  uint64_t v44 = (v77 + v78) ^ __ROR8__(v78, 51);
  uint64_t v45 = v79 + (v80 ^ v81);
  uint64_t v46 = __ROR8__(v80 ^ v81, 48);
  uint64_t v47 = (v45 ^ v46) + __ROR8__(v77 + v78, 32);
  uint64_t v48 = v47 ^ __ROR8__(v45 ^ v46, 43);
  uint64_t v49 = v45 + v44;
  uint64_t v50 = v49 ^ __ROR8__(v44, 47);
  unint64_t v51 = (v47 ^ v81) + v50;
  uint64_t v52 = v51 ^ __ROR8__(v50, 51);
  uint64_t v53 = (__ROR8__(v49, 32) ^ 0xFFLL) + v48;
  uint64_t v54 = __ROR8__(v48, 48);
  uint64_t v55 = __ROR8__(v51, 32) + (v53 ^ v54);
  uint64_t v56 = v55 ^ __ROR8__(v53 ^ v54, 43);
  uint64_t v57 = v52 + v53;
  uint64_t v58 = v57 ^ __ROR8__(v52, 47);
  uint64_t v59 = v58 + v55;
  uint64_t v60 = v59 ^ __ROR8__(v58, 51);
  uint64_t v61 = __ROR8__(v57, 32) + v56;
  uint64_t v62 = __ROR8__(v56, 48);
  uint64_t v63 = __ROR8__(v59, 32) + (v61 ^ v62);
  uint64_t v64 = v63 ^ __ROR8__(v61 ^ v62, 43);
  uint64_t v65 = v60 + v61;
  uint64_t v66 = v65 ^ __ROR8__(v60, 47);
  uint64_t v67 = v66 + v63;
  uint64_t v68 = v67 ^ __ROR8__(v66, 51);
  uint64_t v69 = __ROR8__(v65, 32) + v64;
  uint64_t v70 = __ROR8__(v64, 48);
  uint64_t v71 = __ROR8__(v67, 32) + (v69 ^ v70);
  return (v68 + v69) ^ __ROR8__(v68, 47) ^ v71 ^ __ROR8__(v68 + v69, 32) ^ v71 ^ __ROR8__(v69 ^ v70, 43);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MPModelLibraryModelSectionedCollectionDataSource *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else if ([(MPModelLibraryModelSectionedCollectionDataSource *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = [(MPModelLibraryModelSectionedCollectionDataSource *)self hasSameContentAsDataSource:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_allowedEntityIdentifiersContainsAllPersistentIDs
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(MPMediaLibraryEntityTranslationContext *)self->_sectionTranslationContext allowedEntityIdentifiers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [*(id *)(*((void *)&v10 + 1) + 8 * i) library];
        BOOL v7 = [v6 persistentID] == 0;

        if (v7)
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (unint64_t)_adjustedIndexForSectionIndex:(int64_t)a3
{
  if (self->_allowedSectionPersistentIDToSectionQueryResultsIndexMap.__tree_.__pair3_.__value_)
  {
    BOOL v5 = (uint64_t *)self->_allowedSectionPersistentIDs.__begin_[a3];
    long long v10 = v5;
    for (uint64_t i = self->_allowedSectionPersistentIDToSectionQueryResultsIndexMap.__tree_.__pair1_.__value_.__left_;
          i;
          uint64_t i = (void *)*i)
    {
      uint64_t v7 = i[4];
      if ((uint64_t)v5 >= v7)
      {
        if (v7 >= (uint64_t)v5) {
          return (unint64_t)std::__tree<std::__value_type<long long,unsigned long>,std::__map_value_compare<long long,std::__value_type<long long,unsigned long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,unsigned long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t **)&self->_allowedSectionPersistentIDToSectionQueryResultsIndexMap, (uint64_t)v5, &v10)[5];
        }
        ++i;
      }
    }
    BOOL v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v10);
    [v8 handleFailureInMethod:a2 object:self file:@"MPModelLibraryModelSectionedCollectionDataSource.mm" lineNumber:293 description:@"_allowedSectionPersistentIDToSectionQueryResultsIndexMap must contain an entry for every value in _allowedSectionIdentifiers"];

    return (unint64_t)std::__tree<std::__value_type<long long,unsigned long>,std::__map_value_compare<long long,std::__value_type<long long,unsigned long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,unsigned long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t **)&self->_allowedSectionPersistentIDToSectionQueryResultsIndexMap, (uint64_t)v5, &v10)[5];
  }
  return a3;
}

- (void)_populateIndexMap
{
  uint64_t v3 = 0;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  p_allowedSectionPersistentIDToSectionQueryResultsIndexMap = (uint64_t **)&self->_allowedSectionPersistentIDToSectionQueryResultsIndexMap;
  while ((unint64_t)v3 < mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_))
  {
    uint64_t v25 = (uint64_t *)mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
    std::__tree<std::__value_type<long long,unsigned long>,std::__map_value_compare<long long,std::__value_type<long long,unsigned long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,unsigned long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(p_allowedSectionPersistentIDToSectionQueryResultsIndexMap, (uint64_t)v25, &v25)[5] = v3;
    uint64_t v3 = (uint64_t *)((char *)v3 + 1);
  }
  BOOL v5 = [(MPMediaLibraryEntityTranslationContext *)self->_sectionTranslationContext allowedEntityIdentifiers];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = [*(id *)(*((void *)&v26 + 1) + 8 * i) library];
        uint64_t v11 = [v10 persistentID];

        for (j = self->_allowedSectionPersistentIDToSectionQueryResultsIndexMap.__tree_.__pair1_.__value_.__left_;
              j;
              j = (void *)*j)
        {
          uint64_t v13 = j[4];
          if (v11 >= v13)
          {
            if (v13 >= v11)
            {
              end = self->_allowedSectionPersistentIDs.__end_;
              value = self->_allowedSectionPersistentIDs.__end_cap_.__value_;
              if (end >= value)
              {
                begin = self->_allowedSectionPersistentIDs.__begin_;
                uint64_t v18 = end - begin;
                unint64_t v19 = v18 + 1;
                if ((unint64_t)(v18 + 1) >> 61) {
                  std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v20 = (char *)value - (char *)begin;
                if (v20 >> 2 > v19) {
                  unint64_t v19 = v20 >> 2;
                }
                if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v21 = v19;
                }
                if (v21)
                {
                  unint64_t v21 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v21);
                  begin = self->_allowedSectionPersistentIDs.__begin_;
                  end = self->_allowedSectionPersistentIDs.__end_;
                }
                else
                {
                  uint64_t v22 = 0;
                }
                uint64_t v23 = (int64_t *)(v21 + 8 * v18);
                *uint64_t v23 = v11;
                uint64_t v16 = v23 + 1;
                while (end != begin)
                {
                  int64_t v24 = *--end;
                  *--uint64_t v23 = v24;
                }
                self->_allowedSectionPersistentIDs.__begin_ = v23;
                self->_allowedSectionPersistentIDs.__end_ = v16;
                self->_allowedSectionPersistentIDs.__end_cap_.__value_ = (int64_t *)(v21 + 8 * v22);
                if (begin) {
                  operator delete(begin);
                }
              }
              else
              {
                int64_t *end = v11;
                uint64_t v16 = end + 1;
              }
              self->_allowedSectionPersistentIDs.__end_ = v16;
              break;
            }
            ++j;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }
}

- (id)indexPathForItemWithIdentifiersIntersectingSet:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v21 = v4;
  if (!self->_sectionEntityQueryResult.__ptr_
    || ([v4 library],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 persistentID],
        v5,
        !v6))
  {
LABEL_26:
    unint64_t v19 = 0;
    goto LABEL_27;
  }
  unint64_t v7 = 0;
  do
  {
    if (v7 >= mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_)) {
      goto LABEL_26;
    }
    uint64_t v8 = mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
    uint64_t v9 = v8;
    begin = self->_allowedSectionPersistentIDs.__begin_;
    end = self->_allowedSectionPersistentIDs.__end_;
    long long v12 = begin;
    if (begin != end)
    {
      while (*v12 != v8)
      {
        if (++v12 == end)
        {
          long long v12 = self->_allowedSectionPersistentIDs.__end_;
          break;
        }
      }
    }
    if (v12 == end)
    {
      uint64_t v14 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        uint64_t v23 = self;
        __int16 v24 = 2048;
        unint64_t v25 = v7;
        __int16 v26 = 2048;
        uint64_t v27 = v9;
        _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEBUG, "MPModelLibraryModelSectionedCollectionDataSource %p: indexPathForItemWithIdentifiersIntersectingSet: adjustedSectionIndex not translated [currentSectionPersistentID not found in _allowedSectionPersistentIDs] adjustedSectionIndex=%zu currentSectionPersistentID=%lld", buf, 0x20u);
      }

      uint64_t v13 = v7;
    }
    else
    {
      uint64_t v13 = v12 - begin;
    }
    uint64_t v15 = (mlcore::EntityQueryResult **)std::map<long,MPIdentifierSet * {__strong}>::at(*((void **)self->_itemEntityQueryResults.__ptr_ + 1), v9);
    uint64_t v16 = *v15;
    uint64_t v17 = (std::__shared_weak_count *)v15[1];
    if (v17) {
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    for (unint64_t i = 0; ; ++i)
    {
      if (i >= mlcore::EntityQueryResult::entityCount(v16))
      {
        unint64_t v19 = 0;
        if (!v17) {
          goto LABEL_22;
        }
LABEL_21:
        std::__shared_weak_count::__release_shared[abi:ne180100](v17);
        goto LABEL_22;
      }
      if (mlcore::EntityQueryResult::persistentIDAtIndex(v16) == v6) {
        break;
      }
    }
    unint64_t v19 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:v13];
    if (v17) {
      goto LABEL_21;
    }
LABEL_22:
    ++v7;
  }
  while (!v19);
LABEL_27:

  return v19;
}

- (id)identifiersForSectionAtIndex:(int64_t)a3
{
  ptr = self->_sectionEntityQueryResult.__ptr_;
  if (ptr && mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)ptr))
  {
    unint64_t v7 = [(MPModelLibraryModelSectionedCollectionDataSource *)self _adjustedIndexForSectionIndex:a3];
    unint64_t v8 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
    if (v7 >= v8)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPModelLibraryModelSectionedCollectionDataSource.mm", 212, @"Adjusted section index out of bounds: %ld (sectionIndex = %ld / sectionEntityCount = %ld)", v7, a3, v8);
    }
    uint64_t v9 = (uint64_t *)mlcore::EntityQueryResult::propertyCaches((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
    uint64_t v10 = *v9;
    if (0x84BDA12F684BDA13 * ((v9[1] - *v9) >> 3) <= v7) {
      std::vector<mlcore::PropertyCache>::__throw_out_of_range[abi:ne180100]();
    }
    uint64_t v11 = [(MPMediaLibraryEntityTranslationContext *)self->_sectionTranslationContext modelKind];
    long long v12 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", [v11 modelClass]);

    uint64_t v13 = [v12 identifiersForPropertyCache:v10 + 216 * v7 context:self->_sectionTranslationContext];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)identifiersForItemAtIndexPath:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 section];
  unint64_t v7 = [(MPModelLibraryModelSectionedCollectionDataSource *)self _adjustedIndexForSectionIndex:v6];
  unint64_t v8 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
  if (v7 >= v8)
  {
    unint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPModelLibraryModelSectionedCollectionDataSource.mm", 183, @"Adjusted section index out of bounds: %ld (sectionIndex = %ld / sectionEntityCount = %ld)", v7, v6, v8);
  }
  uint64_t v9 = mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
  uint64_t v10 = (mlcore::EntityQueryResult **)std::map<long,MPIdentifierSet * {__strong}>::at(*((void **)self->_itemEntityQueryResults.__ptr_ + 1), v9);
  long long v12 = *v10;
  uint64_t v11 = (std::__shared_weak_count *)v10[1];
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v12)
  {
    mlcore::EntityQueryResult::entityCache(&v22, v12);
    int v13 = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 32))(v22);
    if (v23) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v23);
    }
    if (v13)
    {
      uint64_t v14 = [(MPModelLibraryModelSectionedCollectionDataSource *)self itemAtIndexPath:v5];
      uint64_t v15 = [v14 identifiers];
    }
    else
    {
      uint64_t v17 = [(MPModelRequest *)self->_request itemKind];
      uint64_t v14 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", [v17 modelClass]);

      uint64_t v18 = (void *)mlcore::EntityQueryResult::propertyCaches(v12);
      unint64_t v19 = [v5 item];
      if (0x84BDA12F684BDA13 * ((uint64_t)(v18[1] - *v18) >> 3) <= v19) {
        std::vector<mlcore::PropertyCache>::__throw_out_of_range[abi:ne180100]();
      }
      uint64_t v15 = [v14 identifiersForPropertyCache:*v18 + 216 * v19 context:self->_itemTranslationContext];
    }
    uint64_t v16 = (void *)v15;

    if (v11) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if (v11) {
LABEL_15:
    }
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }

  return v16;
}

- (id)itemAtIndexPath:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 section];
  unint64_t v7 = [(MPModelLibraryModelSectionedCollectionDataSource *)self _adjustedIndexForSectionIndex:v6];
  unint64_t v8 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
  if (v7 >= v8)
  {
    unint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPModelLibraryModelSectionedCollectionDataSource.mm", 154, @"Adjusted section index out of bounds: %ld (sectionIndex = %ld / sectionEntityCount = %ld)", v7, v6, v8);
  }
  uint64_t v9 = mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
  uint64_t v10 = (mlcore::EntityQueryResult **)std::map<long,MPIdentifierSet * {__strong}>::at(*((void **)self->_itemEntityQueryResults.__ptr_ + 1), v9);
  long long v12 = *v10;
  uint64_t v11 = (std::__shared_weak_count *)v10[1];
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v12)
  {
    [v5 item];
    mlcore::EntityQueryResult::entityAtIndex(v12);
    +[MPMediaLibrary logDatabaseAccess];
    if (v20)
    {
      int v13 = [(MPModelRequest *)self->_request itemKind];
      uint64_t v14 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", [v13 modelClass]);

      uint64_t v15 = [(MPModelRequest *)self->_request itemProperties];
      uint64_t v16 = (*(uint64_t (**)())(*(void *)v20 + 48))();
      uint64_t v17 = [v14 objectForPropertySet:v15 entityClass:v16 propertyCache:mlcore::Entity::propertyCache(v20) context:self->_itemTranslationContext];
    }
    else
    {
      uint64_t v17 = 0;
    }
    if (v21) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v21);
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }

  return v17;
}

- (BOOL)hasSameContentAsDataSource:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (ptr = self->_sectionEntityQueryResult.__ptr_) == 0
    || (uint64_t v6 = (mlcore::EntityQueryResult *)v4[12]) == 0)
  {
    BOOL v11 = 0;
    goto LABEL_32;
  }
  unint64_t v7 = (std::__shared_weak_count *)v4[13];
  if (v7)
  {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    ptr = self->_sectionEntityQueryResult.__ptr_;
  }
  uint64_t v8 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)ptr);
  if (v8 != mlcore::EntityQueryResult::entityCount(v6))
  {
    BOOL v11 = 0;
    if (!v7) {
      goto LABEL_32;
    }
LABEL_34:
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    goto LABEL_32;
  }
  __int16 v26 = v7;
  unint64_t v9 = 0;
  while (1)
  {
    unint64_t v10 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
    BOOL v11 = v9 >= v10;
    if (v9 >= v10) {
      break;
    }
    uint64_t v12 = mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
    if (v12 == mlcore::EntityQueryResult::persistentIDAtIndex(v6))
    {
      int v13 = (mlcore::EntityQueryResult **)std::map<long,MPIdentifierSet * {__strong}>::at(*((void **)self->_itemEntityQueryResults.__ptr_ + 1), v12);
      uint64_t v15 = *v13;
      uint64_t v14 = (std::__shared_weak_count *)v13[1];
      if (v14) {
        atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v16 = (mlcore::EntityQueryResult **)std::map<long,MPIdentifierSet * {__strong}>::at(*(void **)(v4[10] + 8), v12);
      uint64_t v18 = *v16;
      uint64_t v17 = (std::__shared_weak_count *)v16[1];
      if (v17) {
        atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      BOOL v19 = !v15 || v18 == 0;
      if (v19
        || (uint64_t v20 = mlcore::EntityQueryResult::entityCount(v15), v20 != mlcore::EntityQueryResult::entityCount(v18)))
      {
LABEL_22:
        BOOL v23 = 0;
      }
      else
      {
        unint64_t v21 = 0;
        while (1)
        {
          unint64_t v22 = mlcore::EntityQueryResult::entityCount(v15);
          BOOL v23 = v21 >= v22;
          if (v21 >= v22) {
            break;
          }
          uint64_t v24 = mlcore::EntityQueryResult::persistentIDAtIndex(v15);
          ++v21;
          if (v24 != mlcore::EntityQueryResult::persistentIDAtIndex(v18)) {
            goto LABEL_22;
          }
        }
      }
      if (v17) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v17);
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      ++v9;
      if (v23) {
        continue;
      }
    }
    BOOL v11 = 0;
    break;
  }
  unint64_t v7 = v26;
  if (v26) {
    goto LABEL_34;
  }
LABEL_32:

  return v11;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  ptr = self->_sectionEntityQueryResult.__ptr_;
  if (!ptr || !mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)ptr)) {
    return 0;
  }
  unint64_t v7 = [(MPModelLibraryModelSectionedCollectionDataSource *)self _adjustedIndexForSectionIndex:a3];
  unint64_t v8 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
  if (v7 >= v8)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPModelLibraryModelSectionedCollectionDataSource.mm", 92, @"Adjusted section index out of bounds: %ld (sectionIndex = %ld / sectionEntityCount = %ld)", v7, a3, v8);
  }
  uint64_t v9 = mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
  unint64_t v10 = (mlcore::EntityQueryResult **)std::map<long,MPIdentifierSet * {__strong}>::at(*((void **)self->_itemEntityQueryResults.__ptr_ + 1), v9);
  BOOL v11 = *v10;
  uint64_t v12 = (std::__shared_weak_count *)v10[1];
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v11)
  {
    unint64_t v13 = mlcore::EntityQueryResult::entityCount(v11);
    if (!v12) {
      return v13;
    }
    goto LABEL_12;
  }
  unint64_t v13 = 0;
  if (v12) {
LABEL_12:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  return v13;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  unint64_t v6 = -[MPModelLibraryModelSectionedCollectionDataSource _adjustedIndexForSectionIndex:](self, "_adjustedIndexForSectionIndex:");
  unint64_t v7 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
  if (v6 >= v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPModelLibraryModelSectionedCollectionDataSource.mm", 65, @"Adjusted section index out of bounds: %ld (sectionIndex = %ld / sectionEntityCount = %ld)", v6, a3, v7);
  }
  mlcore::EntityQueryResult::entityAtIndex((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
  +[MPMediaLibrary logDatabaseAccess];
  if (v15)
  {
    unint64_t v8 = [(MPModelRequest *)self->_request sectionKind];
    uint64_t v9 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", [v8 modelClass]);

    unint64_t v10 = [(MPModelRequest *)self->_request sectionProperties];
    uint64_t v11 = (*(uint64_t (**)())(*(void *)v15 + 48))();
    uint64_t v12 = [v9 objectForPropertySet:v10 entityClass:v11 propertyCache:mlcore::Entity::propertyCache(v15) context:self->_sectionTranslationContext];
  }
  else
  {
    uint64_t v12 = 0;
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }

  return v12;
}

- (unint64_t)numberOfSections
{
  unint64_t result = (unint64_t)self->_sectionEntityQueryResult.__ptr_;
  if (result) {
    return mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)result);
  }
  return result;
}

- (MPModelLibraryModelSectionedCollectionDataSource)initWithRequest:(id)a3 sectionQueryResults:(shared_ptr<mlcore:(void *)a5 :EntityQueryResult>)a4 itemQueryResults:
{
  cntrl = a4.__cntrl_;
  ptr = a4.__ptr_;
  id v9 = a3;
  unint64_t v10 = [(MPModelLibraryModelSectionedCollectionDataSource *)self init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_47;
  }
  p_request = (id *)&v10->_request;
  objc_storeStrong((id *)&v10->_request, a3);
  uint64_t v14 = *(EntityQueryResult **)ptr;
  uint64_t v13 = *((void *)ptr + 1);
  if (v13) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v15 = (std::__shared_weak_count *)v11->_sectionEntityQueryResult.__cntrl_;
  v11->_sectionEntityQueryResult.__ptr_ = v14;
  v11->_sectionEntityQueryResult.__cntrl_ = (__shared_weak_count *)v13;
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  id v46 = v9;
  uint64_t v16 = (char *)operator new(0x30uLL);
  *(_OWORD *)(v16 + 8) = 0u;
  *(void *)uint64_t v16 = &unk_1EE6736A0;
  *((_OWORD *)v16 + 2) = 0u;
  uint64_t v17 = (uint64_t *)(v16 + 32);
  *((void *)v16 + 3) = v16 + 32;
  uint64_t v18 = (uint64_t **)(v16 + 24);
  unint64_t v21 = *(void **)cntrl;
  uint64_t v20 = (void *)((char *)cntrl + 8);
  BOOL v19 = v21;
  if (v21 != v20)
  {
    do
    {
      unint64_t v22 = (uint64_t *)*v17;
      BOOL v23 = (uint64_t **)(v16 + 32);
      if (*v18 == v17) {
        goto LABEL_13;
      }
      uint64_t v24 = (uint64_t **)*v17;
      unint64_t v25 = v16 + 32;
      if (v22)
      {
        do
        {
          BOOL v23 = v24;
          uint64_t v24 = (uint64_t **)v24[1];
        }
        while (v24);
      }
      else
      {
        do
        {
          BOOL v23 = (uint64_t **)*((void *)v25 + 2);
          BOOL v26 = *v23 == (uint64_t *)v25;
          unint64_t v25 = (char *)v23;
        }
        while (v26);
      }
      uint64_t v27 = v19[4];
      if ((uint64_t)v23[4] < v27)
      {
LABEL_13:
        if (v22) {
          uint64_t v28 = v23;
        }
        else {
          uint64_t v28 = (uint64_t **)(v16 + 32);
        }
        if (v22) {
          long long v29 = v23 + 1;
        }
        else {
          long long v29 = (uint64_t **)(v16 + 32);
        }
      }
      else
      {
        uint64_t v28 = (uint64_t **)(v16 + 32);
        long long v29 = (uint64_t **)(v16 + 32);
        if (v22)
        {
          long long v29 = (uint64_t **)(v16 + 32);
          while (1)
          {
            while (1)
            {
              uint64_t v28 = (uint64_t **)v22;
              uint64_t v35 = v22[4];
              if (v27 >= v35) {
                break;
              }
              unint64_t v22 = *v28;
              long long v29 = v28;
              if (!*v28) {
                goto LABEL_20;
              }
            }
            if (v35 >= v27) {
              break;
            }
            long long v29 = v28 + 1;
            unint64_t v22 = v28[1];
            if (!v22) {
              goto LABEL_20;
            }
          }
        }
      }
      if (!*v29)
      {
LABEL_20:
        uint64_t v30 = (uint64_t *)operator new(0x38uLL);
        uint64_t v31 = v19[5];
        v30[4] = v19[4];
        v30[5] = v31;
        uint64_t v32 = v19[6];
        v30[6] = v32;
        if (v32) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v32 + 8), 1uLL, memory_order_relaxed);
        }
        std::__tree<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::__map_value_compare<long long,std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>>>::__insert_node_at(v18, (uint64_t)v28, v29, v30);
      }
      uint64_t v33 = (void *)v19[1];
      if (v33)
      {
        do
        {
          uint64_t v34 = v33;
          uint64_t v33 = (void *)*v33;
        }
        while (v33);
      }
      else
      {
        do
        {
          uint64_t v34 = (void *)v19[2];
          BOOL v26 = *v34 == (void)v19;
          BOOL v19 = v34;
        }
        while (!v26);
      }
      BOOL v19 = v34;
    }
    while (v34 != v20);
  }
  v36.__ptr_ = v16 + 24;
  v36.__cntrl_ = (__shared_weak_count *)v16;
  uint64_t v37 = (std::__shared_weak_count *)v11->_itemEntityQueryResults.__cntrl_;
  v11->_itemEntityQueryResults = v36;
  if (v37) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v37);
  }
  id v9 = v46;
  uint64_t v38 = [*p_request itemTranslationContext];
  itemTranslationContext = v11->_itemTranslationContext;
  v11->_itemTranslationContext = (MPMediaLibraryEntityTranslationContext *)v38;

  uint64_t v40 = [(MPModelLibraryRequest *)v11->_request sectionTranslationContext];
  sectionTranslationContext = v11->_sectionTranslationContext;
  v11->_sectionTranslationContext = (MPMediaLibraryEntityTranslationContext *)v40;

  v42 = [(MPMediaLibraryEntityTranslationContext *)v11->_sectionTranslationContext allowedEntityIdentifiers];
  if (![v42 count])
  {
LABEL_46:

    goto LABEL_47;
  }
  v43 = [*p_request sectionSortDescriptors];
  if (v43 || ![*p_request sortUsingAllowedItemIdentifiers])
  {

    goto LABEL_46;
  }
  BOOL v44 = [(MPModelLibraryModelSectionedCollectionDataSource *)v11 _allowedEntityIdentifiersContainsAllPersistentIDs];

  if (v44) {
    [(MPModelLibraryModelSectionedCollectionDataSource *)v11 _populateIndexMap];
  }
LABEL_47:

  return v11;
}

@end