@interface MPLazySectionedCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSameContentAsSectionedCollection:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MPLazySectionedCollection)initWithDataSource:(id)a3;
- (MPLazySectionedCollectionDataSource)dataSource;
- (id)_safeStateDumpObject;
- (id)allItems;
- (id)allSections;
- (id)copyWithZone:(_NSZone *)a3;
- (id)firstItem;
- (id)firstSection;
- (id)identifiersForItemAtIndexPath:(id)a3;
- (id)identifiersForSectionAtIndex:(int64_t)a3;
- (id)indexPathForItemWithIdentifiersIntersectingSet:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)itemsInSectionAtIndex:(int64_t)a3;
- (id)lastItem;
- (id)lastSection;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)sectionAtIndex:(int64_t)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (unint64_t)hash;
- (void)_disableMissingIdentifiersFaults;
- (void)dealloc;
- (void)enumerateItemsInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4;
- (void)enumerateItemsUsingBlock:(id)a3;
- (void)enumerateSectionsUsingBlock:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation MPLazySectionedCollection

- (id)firstSection
{
  if ([(MPLazySectionedCollection *)self numberOfSections] < 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(MPLazySectionedCollection *)self sectionAtIndex:0];
  }

  return v3;
}

- (id)sectionAtIndex:(int64_t)a3
{
  if (a3 < 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPLazySectionedCollection.mm", 186, @"Request for section out of bounds [negative index]: %lld", a3);
  }
  if ([(MPLazySectionedCollection *)self numberOfSections] <= a3)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPLazySectionedCollection.mm", 187, @"Request for section out of bounds: %lld", a3);
  }
  v6 = [NSNumber numberWithInteger:a3];
  os_unfair_recursive_lock_lock_with_options();
  v7 = [(NSCache *)self->_storage->_sectionsCache objectForKey:v6];
  if (!v7)
  {
    v8 = self->_dataSource;
    v7 = [(MPLazySectionedCollectionDataSource *)v8 sectionAtIndex:a3];
    if (v7) {
      [(NSCache *)self->_storage->_sectionsCache setObject:v7 forKey:v6];
    }
  }
  os_unfair_recursive_lock_unlock();

  return v7;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  if (a3 < 0)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPLazySectionedCollection.mm", 203, @"Request for number of items in section out of bounds [negative index]: %lld", a3);
  }
  if ([(MPLazySectionedCollection *)self numberOfSections] <= a3)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPLazySectionedCollection.mm", 204, @"Request for number of items in section out of bounds: %lld", a3);
  }
  os_unfair_recursive_lock_lock_with_options();
  begin = self->_storage->_cachedNumberOfItemsInSections.__begin_;
  int64_t v7 = self->_storage->_cachedNumberOfItemsInSections.__end_ - begin;
  if (v7 <= a3 || (int64_t v8 = begin[a3], v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v37 = self->_dataSource;
    int64_t v8 = [(MPLazySectionedCollectionDataSource *)v37 numberOfItemsInSection:a3];
    storage = self->_storage;
    unint64_t v10 = a3 + 1;
    v11 = storage->_cachedNumberOfItemsInSections.__begin_;
    if (a3 + 1 > (unint64_t)(storage->_cachedNumberOfItemsInSections.__end_cap_.__value_ - v11))
    {
      if (v10 >> 61) {
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      }
      end = storage->_cachedNumberOfItemsInSections.__end_;
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v10);
      v14 = (int64_t *)&v13[((char *)end - (char *)v11) & 0xFFFFFFFFFFFFFFF8];
      v16 = (int64_t *)&v13[8 * v15];
      v17 = storage->_cachedNumberOfItemsInSections.__begin_;
      v18 = storage->_cachedNumberOfItemsInSections.__end_;
      v19 = v14;
      if (v18 != v17)
      {
        v19 = v14;
        do
        {
          int64_t v20 = *--v18;
          *--v19 = v20;
        }
        while (v18 != v17);
      }
      storage->_cachedNumberOfItemsInSections.__begin_ = v19;
      storage->_cachedNumberOfItemsInSections.__end_ = v14;
      storage->_cachedNumberOfItemsInSections.__end_cap_.__value_ = v16;
      if (v17) {
        operator delete(v17);
      }
    }
    if (v7 <= a3)
    {
      do
      {
        v21 = self->_storage;
        v23 = v21->_cachedNumberOfItemsInSections.__end_;
        value = v21->_cachedNumberOfItemsInSections.__end_cap_.__value_;
        if (v23 >= value)
        {
          v25 = v21->_cachedNumberOfItemsInSections.__begin_;
          uint64_t v26 = v23 - v25;
          unint64_t v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 61) {
            std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v28 = (char *)value - (char *)v25;
          if (v28 >> 2 > v27) {
            unint64_t v27 = v28 >> 2;
          }
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v29 = v27;
          }
          if (v29)
          {
            unint64_t v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v29);
            v25 = v21->_cachedNumberOfItemsInSections.__begin_;
            v23 = v21->_cachedNumberOfItemsInSections.__end_;
          }
          else
          {
            uint64_t v30 = 0;
          }
          v31 = (int64_t *)(v29 + 8 * v26);
          int64_t *v31 = 0x7FFFFFFFFFFFFFFFLL;
          v24 = v31 + 1;
          while (v23 != v25)
          {
            int64_t v32 = *--v23;
            *--v31 = v32;
          }
          v21->_cachedNumberOfItemsInSections.__begin_ = v31;
          v21->_cachedNumberOfItemsInSections.__end_ = v24;
          v21->_cachedNumberOfItemsInSections.__end_cap_.__value_ = (int64_t *)(v29 + 8 * v30);
          if (v25) {
            operator delete(v25);
          }
        }
        else
        {
          int64_t *v23 = 0x7FFFFFFFFFFFFFFFLL;
          v24 = v23 + 1;
        }
        v21->_cachedNumberOfItemsInSections.__end_ = v24;
      }
      while (v7++ != a3);
    }
    self->_storage->_cachedNumberOfItemsInSections.__begin_[a3] = v8;
  }
  os_unfair_recursive_lock_unlock();
  return v8;
}

- (int64_t)numberOfSections
{
  os_unfair_recursive_lock_lock_with_options();
  storage = self->_storage;
  if (!storage->_hasValidCachedNumberOfSections)
  {
    v4 = self->_dataSource;
    self->_storage->_int64_t cachedNumberOfSections = [(MPLazySectionedCollectionDataSource *)v4 numberOfSections];
    self->_storage->_hasValidCachedNumberOfSections = 1;

    storage = self->_storage;
  }
  int64_t cachedNumberOfSections = storage->_cachedNumberOfSections;
  os_unfair_recursive_lock_unlock();
  return cachedNumberOfSections;
}

void __36__MPLazySectionedCollection_dealloc__block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
}

- (id)identifiersForItemAtIndexPath:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 length] != 2)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"MPLazySectionedCollection.mm" lineNumber:339 description:@"Index path must have two components."];
  }
  uint64_t v6 = [v5 item];
  if (v6 >= -[MPLazySectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", [v5 section]))
  {
    int64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPLazySectionedCollection.mm", 340, @"Request for item identifiers out of bound in section (%lld): %lld", objc_msgSend(v5, "section"), objc_msgSend(v5, "item"));
  }
  uint64_t v7 = [(MPSectionedCollection *)self globalIndexForIndexPath:v5];
  uint64_t v22 = v7;
  os_unfair_recursive_lock_lock_with_options();
  storage = self->_storage;
  left = storage->_itemIdentifierSetMap.__tree_.__pair1_.__value_.__left_;
  if (!left)
  {
LABEL_11:
    v12 = [(MPLazySectionedCollection *)self dataSource];
    if (objc_opt_respondsToSelector())
    {
      id v13 = [v12 identifiersForItemAtIndexPath:v5];
      if (!v13)
      {
        v14 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218754;
          v24 = self;
          __int16 v25 = 2114;
          id v26 = (id)objc_opt_class();
          __int16 v27 = 2048;
          uint64_t v28 = v12;
          __int16 v29 = 2114;
          id v30 = v5;
          id v15 = v26;
          _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_ERROR, "MPLazySectionedCollection %p: identifiersForItemAtIndexPath dataSource failed to produce identifiers: dataSource=<%{public}@ %p> indexPath=%{public}@", buf, 0x2Au);
        }
        id v13 = +[MPIdentifierSet emptyIdentifierSet];
      }
    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)MPLazySectionedCollection;
      id v13 = [(MPSectionedCollection *)&v21 identifiersForItemAtIndexPath:v5];
      if (!v13)
      {
        v16 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v24 = self;
          __int16 v25 = 2114;
          id v26 = v5;
          _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_ERROR, "MPLazySectionedCollection %p: identifiersForItemAtIndexPath super failed to produce identifiers: indexPath=%{public}@", buf, 0x16u);
        }

        id v13 = 0;
      }
    }
    v17 = std::__tree<std::__value_type<long,MPIdentifierSet * {__strong}>,std::__map_value_compare<long,std::__value_type<long,MPIdentifierSet * {__strong}>,std::less<long>,true>,std::allocator<std::__value_type<long,MPIdentifierSet * {__strong}>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long const&>,std::tuple<>>((uint64_t **)&self->_storage->_itemIdentifierSetMap, v7, &v22);
    objc_storeStrong((id *)v17 + 5, v13);

    goto LABEL_21;
  }
  unint64_t v10 = storage->_itemIdentifierSetMap.__tree_.__pair1_.__value_.__left_;
  while (1)
  {
    uint64_t v11 = v10[4];
    if (v7 >= v11) {
      break;
    }
LABEL_10:
    unint64_t v10 = (void *)*v10;
    if (!v10) {
      goto LABEL_11;
    }
  }
  if (v11 < v7)
  {
    ++v10;
    goto LABEL_10;
  }
  id v13 = (id)*std::map<long,MPIdentifierSet * {__strong}>::at(left, v7);
  if (!v13) {
    goto LABEL_11;
  }
LABEL_21:
  os_unfair_recursive_lock_unlock();

  return v13;
}

- (MPLazySectionedCollectionDataSource)dataSource
{
  return self->_dataSource;
}

- (id)allItems
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[MPSectionedCollection totalItemCount](self, "totalItemCount"));
  for (int64_t i = 0; i < [(MPSectionedCollection *)self totalItemCount]; ++i)
  {
    id v5 = [(MPSectionedCollection *)self indexPathForGlobalIndex:i];
    uint64_t v6 = [(MPLazySectionedCollection *)self itemAtIndexPath:v5];

    if (v6) {
      [v3 addObject:v6];
    }
  }

  return v3;
}

- (id)itemAtIndexPath:(id)a3
{
  id v5 = a3;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v6 = [(NSCache *)self->_storage->_itemsCache objectForKey:v5];
  if (!v6)
  {
    uint64_t v7 = self->_dataSource;
    if ([v5 length] != 2)
    {
      __int16 v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2 object:self file:@"MPLazySectionedCollection.mm" lineNumber:232 description:@"Index path must have two components."];
    }
    uint64_t v8 = [v5 item];
    if (v8 >= -[MPLazySectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", [v5 section]))
    {
      id v26 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPLazySectionedCollection.mm", 233, @"Request for item out of bound in section (%lld): %lld", objc_msgSend(v5, "section"), objc_msgSend(v5, "item"));
    }
    uint64_t v6 = [(MPLazySectionedCollectionDataSource *)v7 itemAtIndexPath:v5];
    if (v6)
    {
      uint64_t v9 = [(MPSectionedCollection *)self globalIndexForIndexPath:v5];
      uint64_t v28 = v9;
      [(NSCache *)self->_storage->_itemsCache setObject:v6 forKey:v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v6;
        if ([v5 length] == 1)
        {
          uint64_t v27 = [v10 identifiers];
          storage = self->_storage;
          uint64_t v12 = [v5 section];
          uint64_t v13 = v12;
          left = (uint64_t *)storage->_sectionIdentifierSetMap.__tree_.__pair1_.__value_.__left_;
          p_pair1 = (uint64_t **)&storage->_sectionIdentifierSetMap.__tree_.__pair1_;
          v14 = left;
          if (left)
          {
            while (1)
            {
              while (1)
              {
                v17 = (uint64_t **)v14;
                uint64_t v18 = v14[4];
                if (v12 >= v18) {
                  break;
                }
                v14 = *v17;
                v19 = v17;
                if (!*v17) {
                  goto LABEL_18;
                }
              }
              if (v18 >= v12) {
                break;
              }
              v14 = v17[1];
              if (!v14)
              {
                v19 = v17 + 1;
                goto LABEL_18;
              }
            }
          }
          else
          {
            v19 = p_pair1;
            v17 = p_pair1;
LABEL_18:
            v23 = (uint64_t *)operator new(0x30uLL);
            v23[4] = v13;
            v23[5] = 0;
            std::__tree<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::__map_value_compare<long long,std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>>>::__insert_node_at(p_pair1 - 1, (uint64_t)v17, v19, v23);
            v17 = (uint64_t **)v23;
          }
          uint64_t v22 = v17[5];
          v17[5] = (uint64_t *)v27;
        }
        else
        {
          uint64_t v20 = [v10 identifiers];
          objc_super v21 = std::__tree<std::__value_type<long,MPIdentifierSet * {__strong}>,std::__map_value_compare<long,std::__value_type<long,MPIdentifierSet * {__strong}>,std::less<long>,true>,std::allocator<std::__value_type<long,MPIdentifierSet * {__strong}>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long const&>,std::tuple<>>((uint64_t **)&self->_storage->_itemIdentifierSetMap, v9, &v28);
          uint64_t v22 = (uint64_t *)v21[5];
          v21[5] = v20;
        }
      }
    }
  }
  os_unfair_recursive_lock_unlock();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)identifiersForSectionAtIndex:(int64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = a3;
  if ([(MPLazySectionedCollection *)self numberOfSections] <= a3)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPLazySectionedCollection.mm", 370, @"Request for identifiers for section out of bounds: %lld", a3);
  }
  os_unfair_recursive_lock_lock_with_options();
  storage = self->_storage;
  left = storage->_sectionIdentifierSetMap.__tree_.__pair1_.__value_.__left_;
  if (!left)
  {
LABEL_10:
    id v10 = [(MPLazySectionedCollection *)self dataSource];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v11 = [v10 identifiersForSectionAtIndex:a3];
      if (v11)
      {
LABEL_19:
        id v15 = std::__tree<std::__value_type<long,MPIdentifierSet * {__strong}>,std::__map_value_compare<long,std::__value_type<long,MPIdentifierSet * {__strong}>,std::less<long>,true>,std::allocator<std::__value_type<long,MPIdentifierSet * {__strong}>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long const&>,std::tuple<>>((uint64_t **)&self->_storage->_sectionIdentifierSetMap, a3, &v20);
        objc_storeStrong((id *)v15 + 5, v11);

        goto LABEL_20;
      }
      if (!self->_disableMissingIdentifiersFaults)
      {
        uint64_t v12 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218754;
          uint64_t v22 = self;
          __int16 v23 = 2114;
          id v24 = (id)objc_opt_class();
          __int16 v25 = 2048;
          id v26 = v10;
          __int16 v27 = 2048;
          int64_t v28 = a3;
          id v13 = v24;
          _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_FAULT, "MPLazySectionedCollection %p: identifiersForSectionAtIndex dataSource failed to produce identifiers: dataSource=<%{public}@ %p> sectionIndex=%ld", buf, 0x2Au);
        }
      }
      uint64_t v14 = +[MPIdentifierSet emptyIdentifierSet];
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)MPLazySectionedCollection;
      uint64_t v14 = [(MPSectionedCollection *)&v19 identifiersForSectionAtIndex:a3];
    }
    uint64_t v11 = (void *)v14;
    goto LABEL_19;
  }
  uint64_t v8 = storage->_sectionIdentifierSetMap.__tree_.__pair1_.__value_.__left_;
  while (1)
  {
    int64_t v9 = v8[4];
    if (v9 <= a3) {
      break;
    }
LABEL_9:
    uint64_t v8 = (void *)*v8;
    if (!v8) {
      goto LABEL_10;
    }
  }
  if (v9 < a3)
  {
    ++v8;
    goto LABEL_9;
  }
  id v17 = (id)*std::map<long,MPIdentifierSet * {__strong}>::at(left, a3);
  uint64_t v11 = v17;
  if (!v17) {
    goto LABEL_10;
  }
LABEL_20:
  os_unfair_recursive_lock_unlock();

  return v11;
}

- (MPLazySectionedCollection)initWithDataSource:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MPLazySectionedCollection;
  uint64_t v6 = [(MPSectionedCollection *)&v17 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    uint64_t v8 = objc_alloc_init(_MPLazySectionedCollectionStorage);
    storage = v7->_storage;
    v7->_storage = v8;

    id v10 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    uint64_t v11 = v7->_storage;
    itemsCache = v11->_itemsCache;
    v11->_itemsCache = v10;

    [(NSCache *)v7->_storage->_itemsCache setCountLimit:1000];
    id v13 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    uint64_t v14 = v7->_storage;
    sectionsCache = v14->_sectionsCache;
    v14->_sectionsCache = v13;

    [(NSCache *)v7->_storage->_sectionsCache setCountLimit:50];
    v7->_lock = 0;
  }

  return v7;
}

- (void)dealloc
{
  v3 = self->_dataSource;
  v4 = self->_storage;
  id v5 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MPLazySectionedCollection_dealloc__block_invoke;
  block[3] = &unk_1E57F9F98;
  id v10 = v3;
  uint64_t v11 = v4;
  uint64_t v6 = v4;
  uint64_t v7 = v3;
  dispatch_async(v5, block);

  v8.receiver = self;
  v8.super_class = (Class)MPLazySectionedCollection;
  [(MPLazySectionedCollection *)&v8 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[objc_alloc((Class)objc_opt_class()) initWithDataSource:self->_dataSource];
  *((unsigned char *)result + 40) = self->_disableMissingIdentifiersFaults;
  return result;
}

- (id)indexPathForItemWithIdentifiersIntersectingSet:(id)a3
{
  id v4 = a3;
  id v5 = [(MPLazySectionedCollection *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    os_unfair_recursive_lock_lock_with_options();
    uint64_t v6 = [v5 indexPathForItemWithIdentifiersIntersectingSet:v4];
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MPLazySectionedCollection;
    uint64_t v6 = [(MPSectionedCollection *)&v8 indexPathForItemWithIdentifiersIntersectingSet:v4];
  }

  return v6;
}

- (void)setDataSource:(id)a3
{
}

- (unint64_t)hash
{
  v2 = [(MPLazySectionedCollection *)self dataSource];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MPLazySectionedCollection *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else if ([(MPLazySectionedCollection *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = [(MPLazySectionedCollection *)self hasSameContentAsSectionedCollection:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_disableMissingIdentifiersFaults
{
  self->_disableMissingIdentifiersFaults = 1;
}

- (id)allSections
{
  uint64_t v3 = [(MPLazySectionedCollection *)self numberOfSections];
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v6 = [(MPLazySectionedCollection *)self sectionAtIndex:i];
      if (v6) {
        [v4 addObject:v6];
      }
    }
  }

  return v4;
}

- (id)lastSection
{
  uint64_t v3 = [(MPLazySectionedCollection *)self numberOfSections];
  if (v3 < 1)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(MPLazySectionedCollection *)self sectionAtIndex:v3 - 1];
  }

  return v4;
}

- (id)itemsInSectionAtIndex:(int64_t)a3
{
  BOOL v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[MPLazySectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", a3));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__MPLazySectionedCollection_itemsInSectionAtIndex___block_invoke;
  v8[3] = &unk_1E57F0E78;
  id v6 = v5;
  id v9 = v6;
  [(MPLazySectionedCollection *)self enumerateItemsInSectionAtIndex:a3 usingBlock:v8];

  return v6;
}

void __51__MPLazySectionedCollection_itemsInSectionAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  unsigned __int8 v14 = 0;
  uint64_t v5 = [(MPLazySectionedCollection *)self numberOfSections];
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v13 = v5;
    do
    {
      uint64_t v7 = -[MPLazySectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", v6, v13);
      int v8 = v14;
      if (v7 >= 1 && !v14)
      {
        uint64_t v9 = 1;
        do
        {
          id v10 = (void *)MEMORY[0x19971DE60]();
          uint64_t v11 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 - 1 inSection:v6];
          uint64_t v12 = [(MPLazySectionedCollection *)self itemAtIndexPath:v11];
          v4[2](v4, v12, v11, &v14);

          int v8 = v14;
          if (v9 >= v7) {
            break;
          }
          ++v9;
        }
        while (!v14);
      }
      ++v6;
    }
    while (v6 < v13 && !v8);
  }
}

- (void)enumerateItemsInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4
{
  uint64_t v6 = (void (**)(id, void *, uint64_t, unsigned char *))a4;
  char v12 = 0;
  uint64_t v7 = [(MPLazySectionedCollection *)self numberOfItemsInSection:a3];
  if (v7 >= 1)
  {
    uint64_t v8 = 1;
    do
    {
      uint64_t v9 = (void *)MEMORY[0x19971DE60]();
      id v10 = [MEMORY[0x1E4F28D58] indexPathForItem:v8 - 1 inSection:a3];
      uint64_t v11 = [(MPLazySectionedCollection *)self itemAtIndexPath:v10];
      v6[2](v6, v11, v8 - 1, &v12);

      if (v8 >= v7) {
        break;
      }
      ++v8;
    }
    while (!v12);
  }
}

- (void)enumerateSectionsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, uint64_t, unsigned char *))a3;
  char v9 = 0;
  uint64_t v5 = [(MPLazySectionedCollection *)self numberOfSections];
  if (v5 >= 1)
  {
    uint64_t v6 = 1;
    do
    {
      uint64_t v7 = (void *)MEMORY[0x19971DE60]();
      uint64_t v8 = [(MPLazySectionedCollection *)self sectionAtIndex:v6 - 1];
      v4[2](v4, v8, v6 - 1, &v9);

      if (v6 >= v5) {
        break;
      }
      ++v6;
    }
    while (!v9);
  }
}

- (id)lastItem
{
  uint64_t v3 = [(MPSectionedCollection *)self totalItemCount];
  if (v3 >= 1
    && ([(MPSectionedCollection *)self indexPathForGlobalIndex:v3 - 1],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [(MPLazySectionedCollection *)self itemAtIndexPath:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasSameContentAsSectionedCollection:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v5 = [v4 dataSource];
    uint64_t v6 = [(MPLazySectionedCollection *)self dataSource];
    if (objc_opt_respondsToSelector()) {
      char v7 = [v6 hasSameContentAsDataSource:v5];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)firstItem
{
  if ([(MPSectionedCollection *)self totalItemCount] >= 1
    && ([(MPSectionedCollection *)self indexPathForGlobalIndex:0],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = (void *)v3;
    uint64_t v5 = [(MPLazySectionedCollection *)self itemAtIndexPath:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MPMutableSectionedCollection);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__MPLazySectionedCollection_mutableCopyWithZone___block_invoke;
  v8[3] = &unk_1E57F0E50;
  uint64_t v5 = v4;
  char v9 = v5;
  id v10 = self;
  [(MPLazySectionedCollection *)self enumerateSectionsUsingBlock:v8];
  uint64_t v6 = v5;

  return v6;
}

void __49__MPLazySectionedCollection_mutableCopyWithZone___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "appendSection:");
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) itemsInSectionAtIndex:a3];
  [v5 appendItems:v6];
}

- (id)_safeStateDumpObject
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"_obj";
  uint64_t v3 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  id v4 = (void *)v3;
  dataSource = self->_dataSource;
  if (!dataSource) {
    dataSource = (MPLazySectionedCollectionDataSource *)@"@";
  }
  v9[0] = v3;
  v9[1] = dataSource;
  v8[1] = @"dataSource";
  v8[2] = @"storage";
  v9[2] = self->_storage;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

@end