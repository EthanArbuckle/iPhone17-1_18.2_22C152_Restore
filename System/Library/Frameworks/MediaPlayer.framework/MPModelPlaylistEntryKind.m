@interface MPModelPlaylistEntryKind
+ (BOOL)supportsSecureCoding;
+ (MPModelPlaylistEntryKind)kindWithKinds:(id)a3;
+ (id)identityKind;
- (BOOL)isEqual:(id)a3;
- (MPModelPlaylistEntryKind)initWithCoder:(id)a3;
- (NSArray)kinds;
- (id)humanDescription;
- (unint64_t)hash;
- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPModelPlaylistEntryKind

BOOL __42__MPModelPlaylistEntryKind_kindWithKinds___block_invoke(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return a2 < a3;
}

+ (MPModelPlaylistEntryKind)kindWithKinds:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28E78] stringWithString:@"PlaylistEntry:k"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = [v4 sortedArrayUsingComparator:&__block_literal_global_46822];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "appendFormat:", @"%p", *(void *)(*((void *)&v17 + 1) + 8 * i));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v11 = objc_opt_class();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__MPModelPlaylistEntryKind_kindWithKinds___block_invoke_2;
  v15[3] = &unk_1E57F7718;
  id v16 = v4;
  id v12 = v4;
  v13 = [a1 kindWithModelClass:v11 cacheKey:v5 block:v15];

  return (MPModelPlaylistEntryKind *)v13;
}

void __42__MPModelPlaylistEntryKind_kindWithKinds___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (void).cxx_destruct
{
}

- (NSArray)kinds
{
  return self->_kinds;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelPlaylistEntryKind;
  id v4 = a3;
  [(MPModelKind *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_kinds, @"kinds", v5.receiver, v5.super_class);
}

- (MPModelPlaylistEntryKind)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"kinds"];

  if (v8)
  {
    uint64_t v9 = +[MPModelPlaylistEntryKind kindWithKinds:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPModelPlaylistEntryKind;
  if ([(MPModelKind *)&v7 isEqual:v4]) {
    char v5 = [(NSArray *)self->_kinds isEqual:v4[2]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelPlaylistEntryKind;
  unint64_t v3 = [(MPModelKind *)&v5 hash];
  return [(NSArray *)self->_kinds hash] ^ v3;
}

- (id)humanDescription
{
  v2 = NSString;
  unint64_t v3 = [(NSArray *)self->_kinds valueForKeyPath:@"humanDescription"];
  id v4 = [v3 componentsJoinedByString:@" or "];
  objc_super v5 = [v2 stringWithFormat:@"playlist entries of (%@)", v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v37 = a3.var1;
  v40 = 0;
  v41 = 0;
  unint64_t v42 = 0;
  v56 = 0;
  v57 = 0;
  unint64_t v58 = 0;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obj = [(MPModelPlaylistEntryKind *)self kinds];
  uint64_t isKindOfClass = [obj countByEnumeratingWithState:&v52 objects:v69 count:16];
  uint64_t v6 = isKindOfClass;
  if (isKindOfClass)
  {
    LOBYTE(v38) = 0;
    uint64_t v7 = *(void *)v53;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v53 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v52 + 1) + 8 * v8);
        uint64_t v10 = mlcore::PlaylistItemPropertyItemPersistentID((mlcore *)isKindOfClass);
        if (v9) {
          [v9 predicateWithBaseProperty:v10];
        }
        else {
          long long v50 = 0uLL;
        }
        uint64_t v11 = v41;
        if ((unint64_t)v41 >= v42)
        {
          int64_t v12 = (v41 - v40) >> 4;
          unint64_t v13 = v12 + 1;
          if ((unint64_t)(v12 + 1) >> 60) {
            std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v14 = v42 - (void)v40;
          if ((uint64_t)(v42 - (void)v40) >> 3 > v13) {
            unint64_t v13 = v14 >> 3;
          }
          if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v15 = v13;
          }
          v63 = &v42;
          id v16 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v15);
          long long v17 = &v16[2 * v12];
          v59 = (char **)v16;
          v60 = v17;
          v62 = &v16[2 * v18];
          *(_OWORD *)long long v17 = v50;
          long long v50 = 0uLL;
          v61 = v17 + 2;
          std::vector<std::shared_ptr<mlcore::Predicate>>::__swap_out_circular_buffer((uint64_t *)&v40, &v59);
          long long v19 = v41;
          std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v59);
          v41 = v19;
          if (*((void *)&v50 + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v50 + 1));
          }
        }
        else
        {
          *(_OWORD *)v41 = v50;
          v41 = v11 + 16;
        }
        if (v9) {
          [v9 predicateWithBaseProperty:0];
        }
        else {
          long long v50 = 0uLL;
        }
        long long v20 = v57;
        if ((unint64_t)v57 >= v58)
        {
          int64_t v21 = (v57 - v56) >> 4;
          unint64_t v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 60) {
            std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v23 = v58 - (void)v56;
          if ((uint64_t)(v58 - (void)v56) >> 3 > v22) {
            unint64_t v22 = v23 >> 3;
          }
          if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v24 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v24 = v22;
          }
          v63 = &v58;
          v25 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v24);
          v26 = &v25[2 * v21];
          v59 = (char **)v25;
          v60 = v26;
          v62 = &v25[2 * v27];
          *(_OWORD *)v26 = v50;
          long long v50 = 0uLL;
          v61 = v26 + 2;
          std::vector<std::shared_ptr<mlcore::Predicate>>::__swap_out_circular_buffer((uint64_t *)&v56, &v59);
          v28 = v57;
          std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v59);
          v57 = v28;
          if (*((void *)&v50 + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v50 + 1));
          }
        }
        else
        {
          *(_OWORD *)v57 = v50;
          v57 = v20 + 16;
        }
        objc_opt_class();
        uint64_t isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass)
        {
          id v29 = v9;
          unint64_t v30 = [v29 options];

          uint64_t v38 = (v30 >> 1) & 1;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t isKindOfClass = [obj countByEnumeratingWithState:&v52 objects:v69 count:16];
      uint64_t v6 = isKindOfClass;
    }
    while (isKindOfClass);
  }
  else
  {
    LOBYTE(v38) = 0;
  }

  memset(v49, 0, sizeof(v49));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v49, v40, v41, (v41 - v40) >> 4);
  mlcore::CreateOrPredicate();
  long long v50 = 0uLL;
  uint64_t v51 = 0;
  v59 = (char **)&v50;
  LOBYTE(v60) = 0;
  *(void *)&long long v50 = operator new(0x10uLL);
  *((void *)&v50 + 1) = v50;
  uint64_t v51 = v50 + 16;
  *((void *)&v50 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::Predicate>>,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate>*>((uint64_t)&v51, &v66, &p_shared_weak_owners, (void *)v50);
  if (v67) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v67);
  }
  v59 = (char **)v49;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
  memset(v48, 0, sizeof(v48));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v48, v56, v57, (v57 - v56) >> 4);
  mlcore::CreateOrPredicate();
  v66 = 0;
  v67 = 0;
  p_shared_weak_owners = 0;
  v59 = (char **)&v66;
  LOBYTE(v60) = 0;
  v66 = (std::__shared_weak_count *)operator new(0x10uLL);
  v67 = v66;
  p_shared_weak_owners = &v66->__shared_weak_owners_;
  v67 = (std::__shared_weak_count *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::Predicate>>,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate>*>((uint64_t)&p_shared_weak_owners, &v64, &v65, v66);
  if (*((void *)&v64 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v64 + 1));
  }
  v59 = (char **)v48;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
  if ((v38 & 1) == 0)
  {
    v31 = [(__shared_weak_count *)v37 mediaLibrary];
    v32 = +[MPMediaLibrarySystemFilters filtersForLibrary:v31];
    int v33 = [v32 shouldExcludePurchaseHistoryContent];

    if (v33)
    {
      v35 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v34);
      v36 = (ModelPropertyBase *)mlcore::ItemPropertyRemoteLocationID(v35);
      MPMediaLibraryGetProperty((ModelPropertyBase *)v35, v36);
      uint64_t v47 = 100;
      std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator &,long long const&,mlcore::ComparisonOptions &,void>();
    }
  }
  MEMORY[0x19971BEF0]();
  memset(v45, 0, sizeof(v45));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v45, (void *)v50, *((void **)&v50 + 1), (uint64_t)(*((void *)&v50 + 1) - v50) >> 4);
  mlcore::CreateAndPredicate();
  mlcore::LibraryView::setFilterPredicateForEntityClass();
  if (v46) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v46);
  }
  v59 = (char **)v45;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
  MEMORY[0x19971D490]();
  memset(v43, 0, sizeof(v43));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v43, v66, v67, ((char *)v67 - (char *)v66) >> 4);
  mlcore::CreateAndPredicate();
  mlcore::LibraryView::setFilterPredicateForEntityClass();
  if (v44) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v44);
  }
  v59 = (char **)v43;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
  v59 = (char **)&v66;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
  v59 = (char **)&v50;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
  v59 = &v56;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
  v59 = &v40;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
}

@end