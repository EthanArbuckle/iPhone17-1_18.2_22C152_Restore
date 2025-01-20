@interface MPModelLibraryDefaultSectionedCollectionDataSource
- (BOOL)_allowedEntityIdentifiersContainsAllPersistentIDs;
- (BOOL)_usesSections;
- (BOOL)hasSameContentAsDataSource:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MPModelLibraryDefaultSectionedCollectionDataSource)initWithRequest:(id)a3 itemQueryResults:(shared_ptr<mlcore::EntityQueryResult>)a4;
- (MPModelLibraryRequest)request;
- (NSDictionary)indexPathToContainerUniqueIDMap;
- (_NSRange)optionalSectionIndexTitlesRange;
- (id).cxx_construct;
- (id)_buildIndexPathToContainerUniqueIDMapFromItemQueryResults:(shared_ptr<mlcore::EntityQueryResult>)a3;
- (id)_stateDumpObject;
- (id)identifiersForItemAtIndexPath:(id)a3;
- (id)identifiersForSectionAtIndex:(int64_t)a3;
- (id)indexPathForItemWithIdentifiersIntersectingSet:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (id)sectionIndexTitles;
- (int64_t)indexOfSectionForSectionIndexTitleAtIndex:(int64_t)a3;
- (shared_ptr<mlcore::EntityQueryResult>)itemQueryResults;
- (unint64_t)_adjustedGlobalIndexForIndexPath:(id)a3;
- (unint64_t)hash;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)_populateIndexMap;
- (void)setIndexPathToContainerUniqueIDMap:(id)a3;
@end

@implementation MPModelLibraryDefaultSectionedCollectionDataSource

- (id)sectionAtIndex:(unint64_t)a3
{
  v5 = (void *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5[1] - *v5) >> 4) > a3
    && [(MPModelLibraryDefaultSectionedCollectionDataSource *)self _usesSections])
  {
    v6 = NSString;
    mlcore::Section::localizedTitle((uint64_t *)__p, (mlcore::Section *)(*v5 + 48 * a3));
    if (v11 >= 0) {
      v7 = __p;
    }
    else {
      v7 = (void **)__p[0];
    }
    v8 = [v6 stringWithUTF8String:v7];
    if (v11 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    v8 = &stru_1EE680640;
  }

  return v8;
}

- (unint64_t)numberOfSections
{
  if (!self->_itemQueryResults.__ptr_) {
    return 0;
  }
  if (![(MPModelLibraryDefaultSectionedCollectionDataSource *)self _usesSections]) {
    return 1;
  }
  v3 = (void *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v3[1] - *v3) >> 4) < 2) {
    return 1;
  }
  v4 = (void *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  return 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4[1] - *v4) >> 4);
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  unint64_t result = (unint64_t)self->_itemQueryResults.__ptr_;
  if (result)
  {
    v6 = (void *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)result);
    if (v6[1] == *v6 || ![(MPModelLibraryDefaultSectionedCollectionDataSource *)self _usesSections]) {
      return mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
    }
    else {
      return *(void *)(mlcore::Section::range((mlcore::Section *)(*v6 + 48 * a3)) + 8);
    }
  }
  return result;
}

- (id)identifiersForSectionAtIndex:(int64_t)a3
{
  return +[MPIdentifierSet emptyIdentifierSet];
}

- (MPModelLibraryDefaultSectionedCollectionDataSource)initWithRequest:(id)a3 itemQueryResults:(shared_ptr<mlcore::EntityQueryResult>)a4
{
  ptr = a4.__ptr_;
  id v7 = a3;
  v8 = [(MPModelLibraryDefaultSectionedCollectionDataSource *)self init];
  v9 = v8;
  if (!v8) {
    goto LABEL_19;
  }
  p_request = (id *)&v8->_request;
  objc_storeStrong((id *)&v8->_request, a3);
  v12 = *(EntityQueryResult **)ptr;
  uint64_t v11 = *((void *)ptr + 1);
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = (std::__shared_weak_count *)v9->_itemQueryResults.__cntrl_;
  v9->_itemQueryResults.__ptr_ = v12;
  v9->_itemQueryResults.__cntrl_ = (__shared_weak_count *)v11;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
  }
  uint64_t v14 = [*p_request itemTranslationContext];
  entityTranslationContext = v9->_entityTranslationContext;
  v9->_entityTranslationContext = (MPMediaLibraryEntityTranslationContext *)v14;

  v16 = [(MPMediaLibraryEntityTranslationContext *)v9->_entityTranslationContext allowedEntityIdentifiers];
  if ([v16 count])
  {
    v17 = [*p_request itemSortDescriptors];
    if (!v17 && [*p_request sortUsingAllowedItemIdentifiers])
    {
      BOOL v18 = [(MPModelLibraryDefaultSectionedCollectionDataSource *)v9 _allowedEntityIdentifiersContainsAllPersistentIDs];

      if (v18) {
        [(MPModelLibraryDefaultSectionedCollectionDataSource *)v9 _populateIndexMap];
      }
      goto LABEL_13;
    }
  }
LABEL_13:
  v19 = [*p_request legacyMediaQuery];
  if (v19)
  {
    v20 = [*p_request legacyMediaQuery];
    int v21 = [v20 _hasStaticEntities];

    if (v21)
    {
      v22 = (std::__shared_weak_count *)v9->_itemQueryResults.__cntrl_;
      v26 = v9->_itemQueryResults.__ptr_;
      v27 = v22;
      if (v22) {
        atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v23 = [(MPModelLibraryDefaultSectionedCollectionDataSource *)v9 _buildIndexPathToContainerUniqueIDMapFromItemQueryResults:&v26];
      indexPathToContainerUniqueIDMap = v9->_indexPathToContainerUniqueIDMap;
      v9->_indexPathToContainerUniqueIDMap = (NSDictionary *)v23;

      if (v27) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v27);
      }
    }
  }
LABEL_19:

  return v9;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = (char *)self + 48;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  return self;
}

- (id)indexPathForItemWithIdentifiersIntersectingSet:(id)a3
{
  id v38 = a3;
  if (!self->_allowedItemPersistentIDToItemQueryResultsIndexMap.__tree_.__pair3_.__value_)
  {
    v12 = [(MPModelLibraryRequest *)self->_request mediaLibrary];
    v13 = [v12 uniqueIdentifier];
    uint64_t v14 = [v38 library];
    v15 = [v14 databaseID];
    id v16 = v13;
    id v17 = v15;
    if (v16 == v17)
    {
    }
    else
    {
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
        uint64_t v19 = 0;
LABEL_20:

        int v21 = [(MPModelRequest *)self->_request itemKind];
        id v7 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", [v21 modelClass]);

        uint64_t v22 = 0;
        for (unint64_t i = 0; ; ++i)
        {
          if (i >= mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_)) {
            goto LABEL_42;
          }
          ptr = self->_itemQueryResults.__ptr_;
          if (v19)
          {
            if (v19 == mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)ptr)) {
              goto LABEL_28;
            }
          }
          else
          {
            v25 = (void *)mlcore::EntityQueryResult::propertyCaches((mlcore::EntityQueryResult *)ptr);
            if (0x84BDA12F684BDA13 * ((uint64_t)(v25[1] - *v25) >> 3) <= i) {
              std::vector<mlcore::PropertyCache>::__throw_out_of_range[abi:ne180100]();
            }
            v26 = [v7 identifiersForPropertyCache:*v25 + v22 context:self->_entityTranslationContext];
            char v27 = [v38 intersectsSet:v26];

            if (v27)
            {
LABEL_28:
              v28 = (uint64_t *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
              if (v28[1] == *v28
                || ![(MPModelLibraryDefaultSectionedCollectionDataSource *)self _usesSections])
              {
                v10 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:0];
              }
              else
              {
                uint64_t v29 = *v28;
                if (v28[1] == *v28)
                {
LABEL_42:
                  v10 = 0;
                  goto LABEL_44;
                }
                uint64_t v30 = 0;
                unint64_t v31 = 0;
                v10 = 0;
                do
                {
                  v32 = (long long *)(v29 + v30);
                  if (*(char *)(v29 + v30 + 23) < 0)
                  {
                    std::string::__init_copy_ctor_external(&v39, *(const std::string::value_type **)v32, *((void *)v32 + 1));
                  }
                  else
                  {
                    long long v33 = *v32;
                    v39.__r_.__value_.__r.__words[2] = *((void *)v32 + 2);
                    *(_OWORD *)&v39.__r_.__value_.__l.__data_ = v33;
                  }
                  long long v34 = *(_OWORD *)(v29 + v30 + 24);
                  int v41 = *(_DWORD *)(v29 + v30 + 40);
                  long long v40 = v34;
                  v35 = (void *)mlcore::Section::range((mlcore::Section *)&v39);
                  if (i >= *v35 && i < v35[1] + *v35)
                  {
                    uint64_t v36 = [MEMORY[0x1E4F28D58] indexPathForItem:i - *v35 inSection:v31];

                    v10 = (void *)v36;
                  }
                  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(v39.__r_.__value_.__l.__data_);
                  }
                  ++v31;
                  uint64_t v29 = *v28;
                  v30 += 48;
                }
                while (v31 < 0xAAAAAAAAAAAAAAABLL * ((v28[1] - *v28) >> 4));
              }
LABEL_44:

              goto LABEL_45;
            }
          }
          v22 += 216;
        }
      }
    }
    v20 = [v38 library];
    uint64_t v19 = [v20 persistentID];

    goto LABEL_20;
  }
  uint64_t v4 = [(MPModelLibraryDefaultSectionedCollectionDataSource *)self numberOfSections];
  if (v4 >= 1)
  {
    v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [(MPModelLibraryDefaultSectionedCollectionDataSource *)self identifiersForSectionAtIndex:v6];
      if ([v38 intersectsSet:v7]) {
        break;
      }
      uint64_t v8 = [(MPModelLibraryDefaultSectionedCollectionDataSource *)self numberOfItemsInSection:v6];
      if (v8 < 1)
      {
LABEL_9:
        v10 = v5;
      }
      else
      {
        uint64_t v9 = 0;
        while (1)
        {
          v10 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 inSection:v6];
          uint64_t v11 = [(MPModelLibraryDefaultSectionedCollectionDataSource *)self identifiersForItemAtIndexPath:v10];
          if ([v38 intersectsSet:v11]) {
            break;
          }

          if (v8 == ++v9) {
            goto LABEL_9;
          }
        }
      }
      ++v6;
      v5 = v10;
      if (v6 == v4) {
        goto LABEL_45;
      }
    }
    v10 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v6];

    goto LABEL_44;
  }
  v10 = 0;
LABEL_45:

  return v10;
}

- (id)identifiersForItemAtIndexPath:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(MPModelLibraryDefaultSectionedCollectionDataSource *)self _adjustedGlobalIndexForIndexPath:v5];
  unint64_t v7 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  if (v6 >= v7)
  {
    int v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MPModelLibraryDefaultSectionedCollectionDataSource.mm", 280, @"Adjusted global index out of bounds: %ld (indexPath = %@ / entityCount = %ld)", v6, v5, v7 object file lineNumber description];
  }
  uint64_t v8 = (uint64_t *)mlcore::EntityQueryResult::propertyCaches((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  uint64_t v9 = *v8;
  if (0x84BDA12F684BDA13 * ((v8[1] - *v8) >> 3) <= v6) {
    std::vector<mlcore::PropertyCache>::__throw_out_of_range[abi:ne180100]();
  }
  v10 = [(MPModelRequest *)self->_request itemKind];
  uint64_t v11 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", [v10 modelClass]);

  v12 = [v11 identifiersForPropertyCache:v9 + 216 * v6 context:self->_entityTranslationContext];
  if (self->_indexPathToContainerUniqueIDMap)
  {
    v13 = [(MPMediaLibraryEntityTranslationContext *)self->_entityTranslationContext mediaLibrary];
    uint64_t v14 = [v13 uniqueIdentifier];
    v15 = [@"Library-DefaultSectionedCollection-" stringByAppendingString:v14];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __84__MPModelLibraryDefaultSectionedCollectionDataSource_identifiersForItemAtIndexPath___block_invoke;
    v19[3] = &unk_1E57F95D0;
    v19[4] = self;
    id v20 = v5;
    uint64_t v16 = [v12 copyWithSource:v15 block:v19];

    v12 = (void *)v16;
  }

  return v12;
}

- (id)itemAtIndexPath:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(MPModelLibraryDefaultSectionedCollectionDataSource *)self _adjustedGlobalIndexForIndexPath:v5];
  unint64_t v7 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  if (v6 >= v7)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"MPModelLibraryDefaultSectionedCollectionDataSource.mm", 186, @"Adjusted global index out of bounds: %ld (indexPath = %@ / entityCount = %ld)", v6, v5, v7 object file lineNumber description];
  }
  mlcore::EntityQueryResult::entityAtIndex((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  +[MPMediaLibrary logDatabaseAccess];
  if (v21)
  {
    uint64_t v8 = [(MPModelRequest *)self->_request itemKind];
    uint64_t v9 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", [v8 modelClass]);

    v10 = [(MPModelRequest *)self->_request itemProperties];
    uint64_t v11 = (*(uint64_t (**)())(*(void *)v21 + 48))();
    v12 = [v9 objectForPropertySet:v10 entityClass:v11 propertyCache:mlcore::Entity::propertyCache(v21) context:self->_entityTranslationContext];

    if (self->_indexPathToContainerUniqueIDMap)
    {
      v13 = [v12 identifiers];
      uint64_t v14 = [(MPMediaLibraryEntityTranslationContext *)self->_entityTranslationContext mediaLibrary];
      v15 = [v14 uniqueIdentifier];
      uint64_t v16 = [@"Library-DefaultSectionedCollection-" stringByAppendingString:v15];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __70__MPModelLibraryDefaultSectionedCollectionDataSource_itemAtIndexPath___block_invoke;
      v23[3] = &unk_1E57F95D0;
      v23[4] = self;
      id v24 = v5;
      id v17 = (void *)[v13 copyWithSource:v16 block:v23];
      uint64_t v18 = [v12 copyWithIdentifiers:v17 block:&__block_literal_global_8621];

      v12 = (void *)v18;
    }
  }
  else
  {
    v12 = 0;
  }
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }

  return v12;
}

- (unint64_t)_adjustedGlobalIndexForIndexPath:(id)a3
{
  id v5 = a3;
  unint64_t v6 = (uint64_t *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  unint64_t v7 = [v5 item];
  uint64_t v8 = v6[1];
  uint64_t v9 = v8 - *v6;
  if (v8 != *v6 && [(MPModelLibraryDefaultSectionedCollectionDataSource *)self _usesSections])
  {
    unint64_t v10 = [v5 section];
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (v9 >> 4);
    if (v10 >= v11)
    {
      uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPModelLibraryDefaultSectionedCollectionDataSource.mm", 428, @"Section index out of bounds: %ld (sectionCount = %ld)", v10, v11);
    }
    uint64_t v12 = *v6;
    v13 = (long long *)(v12 + 48 * v10);
    if (*((char *)v13 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v23, *(const std::string::value_type **)v13, *((void *)v13 + 1));
    }
    else
    {
      long long v14 = *v13;
      v23.__r_.__value_.__r.__words[2] = *((void *)v13 + 2);
      *(_OWORD *)&v23.__r_.__value_.__l.__data_ = v14;
    }
    uint64_t v15 = v12 + 48 * v10;
    long long v16 = *(_OWORD *)(v15 + 24);
    int v25 = *(_DWORD *)(v15 + 40);
    long long v24 = v16;
    v7 += *(void *)mlcore::Section::range((mlcore::Section *)&v23);
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v23.__r_.__value_.__l.__data_);
    }
  }
  if (self->_allowedItemPersistentIDToItemQueryResultsIndexMap.__tree_.__pair3_.__value_)
  {
    uint64_t v17 = self->_allowedItemPersistentIDs.__begin_[v7];
    v23.__r_.__value_.__r.__words[0] = v17;
    for (unint64_t i = self->_allowedItemPersistentIDToItemQueryResultsIndexMap.__tree_.__pair1_.__value_.__left_;
          i;
          unint64_t i = (void *)*i)
    {
      uint64_t v19 = i[4];
      if (v17 >= v19)
      {
        if (v19 >= v17) {
          goto LABEL_17;
        }
        ++i;
      }
    }
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"MPModelLibraryDefaultSectionedCollectionDataSource.mm" lineNumber:438 description:@"_allowedItemPersistentIDToItemQueryResultsIndexMap must contain an entry for every value in _allowedItemIdentifiers"];

LABEL_17:
    unint64_t v7 = (unint64_t)std::__tree<std::__value_type<long long,unsigned long>,std::__map_value_compare<long long,std::__value_type<long long,unsigned long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,unsigned long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t **)&self->_allowedItemPersistentIDToItemQueryResultsIndexMap, v17, (uint64_t **)&v23)[5];
  }

  return v7;
}

- (BOOL)_usesSections
{
  if ([(MPModelLibraryRequest *)self->_request disableImplicitSectioning])
  {
    LOBYTE(ptr) = 0;
  }
  else
  {
    ptr = self->_itemQueryResults.__ptr_;
    if (ptr) {
      LOBYTE(ptr) = (unint64_t)mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)ptr) > 0x31;
    }
  }
  return (char)ptr;
}

- (void).cxx_destruct
{
  cntrl = self->_itemQueryResults.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_indexPathToContainerUniqueIDMap, 0);
  objc_storeStrong((id *)&self->_request, 0);
  std::__tree<std::__value_type<long long,unsigned long>,std::__map_value_compare<long long,std::__value_type<long long,unsigned long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,unsigned long>>>::destroy((void *)self->_allowedItemPersistentIDToItemQueryResultsIndexMap.__tree_.__pair1_.__value_.__left_);
  begin = self->_allowedItemPersistentIDs.__begin_;
  if (begin)
  {
    self->_allowedItemPersistentIDs.__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_entityTranslationContext, 0);
}

- (shared_ptr<mlcore::EntityQueryResult>)itemQueryResults
{
  cntrl = self->_itemQueryResults.__cntrl_;
  *v2 = self->_itemQueryResults.__ptr_;
  v2[1] = (EntityQueryResult *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (EntityQueryResult *)self;
  return result;
}

- (void)setIndexPathToContainerUniqueIDMap:(id)a3
{
}

- (NSDictionary)indexPathToContainerUniqueIDMap
{
  return self->_indexPathToContainerUniqueIDMap;
}

- (MPModelLibraryRequest)request
{
  return self->_request;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  unint64_t v4 = 0;
  unint64_t v58 = 0;
  uint64_t v54 = v3 ^ 0x736F6D6570736575;
  uint64_t v55 = v5 ^ 0x646F72616E646F6DLL;
  uint64_t v56 = v3 ^ 0x6C7967656E657261;
  uint64_t v57 = v5 ^ 0x7465646279746573;
  while (v4 < mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_))
  {
    uint64_t v6 = mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
    unint64_t v7 = v58;
    if ((v58 & 0x400000000000000) != 0)
    {
      if ((v58 & 0x300000000000000) != 0)
      {
        v53 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v22 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
        objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v22, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v58);

        unint64_t v7 = v58;
      }
      uint64_t v14 = v7 & 0xFFFFFFFFFFFFFFLL | (v6 << 32);
      uint64_t v15 = (v54 + v55) ^ __ROR8__(v55, 51);
      uint64_t v16 = v56 + (v14 ^ v57);
      uint64_t v17 = __ROR8__(v14 ^ v57, 48);
      uint64_t v18 = (v16 ^ v17) + __ROR8__(v54 + v55, 32);
      uint64_t v19 = v18 ^ __ROR8__(v16 ^ v17, 43);
      uint64_t v20 = v16 + v15;
      uint64_t v56 = __ROR8__(v20, 32);
      uint64_t v57 = v19;
      uint64_t v54 = v18 ^ v14;
      uint64_t v55 = v20 ^ __ROR8__(v15, 47);
      unint64_t v7 = v7 & 0xFF00000000000000 | HIDWORD(v6);
    }
    else
    {
      if ((v58 & 0x7FFFFFFFFFFFFFFLL) != 0)
      {
        v52 = [MEMORY[0x1E4F28B00] currentHandler];
        int v21 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
        [v52 handleFailureInFunction:v21, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v58 file lineNumber description];

        unint64_t v7 = v58;
      }
      uint64_t v8 = (v54 + v55) ^ __ROR8__(v55, 51);
      uint64_t v9 = v56 + (v57 ^ v6);
      uint64_t v10 = __ROR8__(v57 ^ v6, 48);
      uint64_t v11 = (v9 ^ v10) + __ROR8__(v54 + v55, 32);
      uint64_t v12 = v11 ^ __ROR8__(v9 ^ v10, 43);
      uint64_t v13 = v9 + v8;
      uint64_t v56 = __ROR8__(v13, 32);
      uint64_t v57 = v12;
      uint64_t v54 = v11 ^ v6;
      uint64_t v55 = v13 ^ __ROR8__(v8, 47);
    }
    unint64_t v58 = v7 + 0x800000000000000;
    ++v4;
  }
  uint64_t v23 = (v54 + v55) ^ __ROR8__(v55, 51);
  uint64_t v24 = v56 + (v57 ^ v58);
  uint64_t v25 = __ROR8__(v57 ^ v58, 48);
  uint64_t v26 = (v24 ^ v25) + __ROR8__(v54 + v55, 32);
  uint64_t v27 = v26 ^ __ROR8__(v24 ^ v25, 43);
  uint64_t v28 = v24 + v23;
  uint64_t v29 = v28 ^ __ROR8__(v23, 47);
  unint64_t v30 = (v26 ^ v58) + v29;
  uint64_t v31 = v30 ^ __ROR8__(v29, 51);
  uint64_t v32 = (__ROR8__(v28, 32) ^ 0xFFLL) + v27;
  uint64_t v33 = __ROR8__(v27, 48);
  uint64_t v34 = __ROR8__(v30, 32) + (v32 ^ v33);
  uint64_t v35 = v34 ^ __ROR8__(v32 ^ v33, 43);
  uint64_t v36 = v31 + v32;
  uint64_t v37 = v36 ^ __ROR8__(v31, 47);
  uint64_t v38 = v37 + v34;
  uint64_t v39 = v38 ^ __ROR8__(v37, 51);
  uint64_t v40 = __ROR8__(v36, 32) + v35;
  uint64_t v41 = __ROR8__(v35, 48);
  uint64_t v42 = __ROR8__(v38, 32) + (v40 ^ v41);
  uint64_t v43 = v42 ^ __ROR8__(v40 ^ v41, 43);
  uint64_t v44 = v39 + v40;
  uint64_t v45 = v44 ^ __ROR8__(v39, 47);
  uint64_t v46 = v45 + v42;
  uint64_t v47 = v46 ^ __ROR8__(v45, 51);
  uint64_t v48 = __ROR8__(v44, 32) + v43;
  uint64_t v49 = __ROR8__(v43, 48);
  uint64_t v50 = __ROR8__(v46, 32) + (v48 ^ v49);
  return (v47 + v48) ^ __ROR8__(v47, 47) ^ v50 ^ __ROR8__(v47 + v48, 32) ^ v50 ^ __ROR8__(v48 ^ v49, 43);
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (MPModelLibraryDefaultSectionedCollectionDataSource *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else if ([(MPModelLibraryDefaultSectionedCollectionDataSource *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = [(MPModelLibraryDefaultSectionedCollectionDataSource *)self hasSameContentAsDataSource:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_buildIndexPathToContainerUniqueIDMapFromItemQueryResults:(shared_ptr<mlcore::EntityQueryResult>)a3
{
  ptr = (mlcore::EntityQueryResult **)a3.__ptr_;
  BOOL v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:mlcore::EntityQueryResult::entityCount(*(mlcore::EntityQueryResult **)a3.__ptr_)];
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:mlcore::EntityQueryResult::entityCount(*ptr)];
  for (unint64_t i = 0;
        i < mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
        ++i)
  {
    uint64_t v8 = [NSNumber numberWithLongLong:mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_)];
    uint64_t v9 = [v5 objectForKey:v8];

    if (v9)
    {
      uint64_t v10 = [v5 objectForKey:v8];
      uint64_t v11 = [v10 integerValue] + 1;
    }
    else
    {
      uint64_t v11 = 1;
    }
    uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathForRow:i inSection:0];
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v11);
    [v6 setObject:v13 forKeyedSubscript:v12];
    uint64_t v14 = [NSNumber numberWithInteger:v11];
    [v5 setObject:v14 forKeyedSubscript:v8];
  }
  uint64_t v15 = (void *)[v6 copy];

  return v15;
}

- (BOOL)_allowedEntityIdentifiersContainsAllPersistentIDs
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(MPMediaLibraryEntityTranslationContext *)self->_entityTranslationContext allowedEntityIdentifiers];
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

- (void)_populateIndexMap
{
  uint64_t v3 = 0;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  p_allowedItemPersistentIDToItemQueryResultsIndexMap = (uint64_t **)&self->_allowedItemPersistentIDToItemQueryResultsIndexMap;
  while ((unint64_t)v3 < mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_))
  {
    uint64_t v25 = (uint64_t *)mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
    std::__tree<std::__value_type<long long,unsigned long>,std::__map_value_compare<long long,std::__value_type<long long,unsigned long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,unsigned long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(p_allowedItemPersistentIDToItemQueryResultsIndexMap, (uint64_t)v25, &v25)[5] = v3;
    uint64_t v3 = (uint64_t *)((char *)v3 + 1);
  }
  BOOL v5 = [(MPMediaLibraryEntityTranslationContext *)self->_entityTranslationContext allowedEntityIdentifiers];
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

        for (j = self->_allowedItemPersistentIDToItemQueryResultsIndexMap.__tree_.__pair1_.__value_.__left_;
              j;
              j = (void *)*j)
        {
          uint64_t v13 = j[4];
          if (v11 >= v13)
          {
            if (v13 >= v11)
            {
              end = self->_allowedItemPersistentIDs.__end_;
              value = self->_allowedItemPersistentIDs.__end_cap_.__value_;
              if (end >= value)
              {
                begin = self->_allowedItemPersistentIDs.__begin_;
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
                  begin = self->_allowedItemPersistentIDs.__begin_;
                  end = self->_allowedItemPersistentIDs.__end_;
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
                self->_allowedItemPersistentIDs.__begin_ = v23;
                self->_allowedItemPersistentIDs.__end_ = v16;
                self->_allowedItemPersistentIDs.__end_cap_.__value_ = (int64_t *)(v21 + 8 * v22);
                if (begin) {
                  operator delete(begin);
                }
              }
              else
              {
                int64_t *end = v11;
                uint64_t v16 = end + 1;
              }
              self->_allowedItemPersistentIDs.__end_ = v16;
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

void __84__MPModelLibraryDefaultSectionedCollectionDataSource_identifiersForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v4 setContainerUniqueID:v3];
}

- (int64_t)indexOfSectionForSectionIndexTitleAtIndex:(int64_t)a3
{
  BOOL v5 = (uint64_t *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  if (v5[1] == *v5 || ![(MPModelLibraryDefaultSectionedCollectionDataSource *)self _usesSections]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v8 = [(MPModelLibraryDefaultSectionedCollectionDataSource *)self sectionIndexTitles];
  uint64_t v9 = [v8 count];
  uint64_t v10 = v6 - v7;
  uint64_t v11 = v10 / 48;

  if (v9 - 1 == a3) {
    return v11 - 1;
  }
  if (v10 < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v13 = 0;
  int64_t v14 = 0;
  if (v11 <= 1) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = v10 / 48;
  }
  uint64_t v16 = v15 - 1;
  int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    uint64_t v17 = *v5;
    uint64_t v18 = (long long *)(*v5 + v13);
    if (*((char *)v18 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v18, *((void *)v18 + 1));
    }
    else
    {
      long long v19 = *v18;
      __p.__r_.__value_.__r.__words[2] = *((void *)v18 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v19;
    }
    long long v20 = *(_OWORD *)(v17 + v13 + 24);
    int v28 = *(_DWORD *)(v17 + v13 + 40);
    long long v27 = v20;
    int v21 = mlcore::Section::sectionIndex((mlcore::Section *)&__p);
    int64_t v22 = v21;
    int64_t v23 = v14 - 1;
    if (v21 <= a3) {
      int64_t v23 = v12;
    }
    if (v21 == a3) {
      int64_t v12 = v14;
    }
    else {
      int64_t v12 = v23;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v22 >= a3) {
      break;
    }
    v13 += 48;
  }
  while (v16 != v14++);
  return v12;
}

- (_NSRange)optionalSectionIndexTitlesRange
{
  uint64_t v3 = (void *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  if (v3[1] == *v3 || ![(MPModelLibraryDefaultSectionedCollectionDataSource *)self _usesSections])
  {
    NSUInteger v4 = 0;
    NSUInteger v5 = 0;
  }
  else
  {
    NSUInteger v4 = mlcore::EntityQueryResult::optionalLocalizedSectionIndicesRange((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  }
  result.length = v5;
  result.location = v4;
  return result;
}

- (id)sectionIndexTitles
{
  uint64_t v3 = (void *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  if (v3[1] == *v3 || ![(MPModelLibraryDefaultSectionedCollectionDataSource *)self _usesSections])
  {
    uint64_t v10 = 0;
  }
  else
  {
    NSUInteger v4 = (uint64_t ***)mlcore::EntityQueryResult::localizedSectionIndices((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
    NSUInteger v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * ((*v4)[1] - **v4)];
    uint64_t v6 = **v4;
    for (uint64_t i = (*v4)[1]; v6 != i; v6 += 3)
    {
      uint64_t v8 = v6;
      if (*((char *)v6 + 23) < 0) {
        uint64_t v8 = (uint64_t *)*v6;
      }
      uint64_t v9 = [NSString stringWithUTF8String:v8];
      [v5 addObject:v9];
    }
    uint64_t v10 = (void *)[v5 copy];
  }

  return v10;
}

void __70__MPModelLibraryDefaultSectionedCollectionDataSource_itemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v4 setContainerUniqueID:v3];
}

- (BOOL)hasSameContentAsDataSource:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (ptr = self->_itemQueryResults.__ptr_) != 0
    && (uint64_t v6 = (mlcore::EntityQueryResult *)v4[10]) != 0)
  {
    uint64_t v7 = (std::__shared_weak_count *)v4[11];
    if (v7)
    {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      ptr = self->_itemQueryResults.__ptr_;
    }
    uint64_t v8 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)ptr);
    if (v8 == mlcore::EntityQueryResult::entityCount(v6))
    {
      unint64_t v9 = 0;
      while (1)
      {
        unint64_t v10 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
        BOOL v11 = v9 >= v10;
        if (v9 >= v10) {
          break;
        }
        uint64_t v12 = mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
        ++v9;
        if (v12 != mlcore::EntityQueryResult::persistentIDAtIndex(v6)) {
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      BOOL v11 = 0;
    }
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)_stateDumpObject
{
  v40[2] = *MEMORY[0x1E4F143B8];
  ptr = self->_itemQueryResults.__ptr_;
  uint64_t v31 = self;
  if (ptr)
  {
    id v4 = (uint64_t *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)ptr);
    uint64_t v6 = *v4;
    uint64_t v5 = v4[1];
    unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *v4) >> 4);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
    if (v5 != v6)
    {
      uint64_t v9 = 0;
      if (v7 <= 1) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = v7;
      }
      do
      {
        uint64_t v11 = *v4;
        uint64_t v12 = (long long *)(*v4 + v9);
        if (*((char *)v12 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v32, *(const std::string::value_type **)v12, *((void *)v12 + 1));
        }
        else
        {
          long long v13 = *v12;
          v32.__r_.__value_.__r.__words[2] = *((void *)v12 + 2);
          *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v13;
        }
        long long v14 = *(_OWORD *)(v11 + v9 + 24);
        int v34 = *(_DWORD *)(v11 + v9 + 40);
        long long v33 = v14;
        uint64_t v15 = NSString;
        mlcore::Section::localizedTitle((uint64_t *)__p, (mlcore::Section *)&v32);
        if (v36 >= 0) {
          uint64_t v16 = __p;
        }
        else {
          uint64_t v16 = (void **)__p[0];
        }
        uint64_t v17 = [v15 stringWithUTF8String:v16];
        uint64_t v18 = *(void *)mlcore::Section::range((mlcore::Section *)&v32);
        uint64_t v19 = *(void *)(mlcore::Section::range((mlcore::Section *)&v32) + 8);
        long long v20 = [v15 stringWithFormat:@"MLCore::Section(%@, {%zu, %zu}, %d)", v17, v18, v19, mlcore::Section::sectionIndex((mlcore::Section *)&v32)];

        if (v36 < 0) {
          operator delete(__p[0]);
        }
        [v8 addObject:v20];

        if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v32.__r_.__value_.__l.__data_);
        }
        v9 += 48;
        --v10;
      }
      while (v10);
    }
    v39[0] = @"entityCount";
    int v21 = [NSNumber numberWithUnsignedLong:mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)v31->_itemQueryResults.__ptr_)];
    v39[1] = @"sections";
    v40[0] = v21;
    v40[1] = v8;
    int64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
  }
  else
  {
    int64_t v22 = (void *)MEMORY[0x1E4F1CC08];
  }
  v37[0] = @"_obj";
  uint64_t v23 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), v31];
  int64_t v24 = (void *)v23;
  request = @"@";
  unint64_t value = v31->_allowedItemPersistentIDToItemQueryResultsIndexMap.__tree_.__pair3_.__value_;
  if (v31->_request) {
    request = (__CFString *)v31->_request;
  }
  v38[0] = v23;
  v38[1] = request;
  v37[1] = @"request";
  v37[2] = @"itemQueryResults";
  v38[2] = v22;
  v37[3] = @"allowedItemPersistentIDToItemQueryResultsIndexMap.size";
  long long v27 = [NSNumber numberWithUnsignedLong:value];
  v38[3] = v27;
  v37[4] = @"allowedItemPersistentIDs.size";
  int v28 = [NSNumber numberWithUnsignedLong:v31->_allowedItemPersistentIDs.__end_ - v31->_allowedItemPersistentIDs.__begin_];
  v38[4] = v28;
  long long v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:5];

  return v29;
}

@end