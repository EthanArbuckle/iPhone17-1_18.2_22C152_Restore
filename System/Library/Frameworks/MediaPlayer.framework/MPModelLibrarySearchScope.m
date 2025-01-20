@interface MPModelLibrarySearchScope
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MPModelKind)itemKind;
- (MPModelLibrarySearchScope)initWithCoder:(id)a3;
- (MPModelLibrarySearchScope)initWithItemKind:(id)a3 name:(id)a4 properties:(id)a5;
- (MPPropertySet)itemProperties;
- (NSString)name;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (shared_ptr<mlcore::LocalizedSearchScope>)coreScope;
- (void)encodeWithCoder:(id)a3;
- (void)setItemKind:(id)a3;
@end

@implementation MPModelLibrarySearchScope

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemProperties, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_itemKind, 0);
  cntrl = self->_coreScope.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (MPPropertySet)itemProperties
{
  return self->_itemProperties;
}

- (NSString)name
{
  return self->_name;
}

- (void)setItemKind:(id)a3
{
}

- (MPModelKind)itemKind
{
  return self->_itemKind;
}

- (shared_ptr<mlcore::LocalizedSearchScope>)coreScope
{
  v3 = self;
  v4 = v2;
  ptr = self->_coreScope.__ptr_;
  if (!ptr)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v3->_itemKind;
      v19.__ptr_ = 0;
      v19.__cntrl_ = (__shared_weak_count *)&v19;
      uint64_t v20 = 0x4812000000;
      v21 = __Block_byref_object_copy__5445;
      v22 = __Block_byref_object_dispose__5446;
      v23 = &unk_1956C748F;
      memset(v24, 0, 24);
      v8 = [(MPModelKind *)v7 relationshipKinds];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __38__MPModelLibrarySearchScope_coreScope__block_invoke_28;
      v15[3] = &unk_1E57EEA68;
      v15[4] = v3;
      id v16 = &__block_literal_global_5448;
      v17 = &v19;
      SEL v18 = a2;
      [v8 enumerateKeysAndObjectsUsingBlock:v15];

      cntrl = v19.__cntrl_;
      v10 = (__shared_weak_count *)operator new(0x60uLL);
      *((void *)v10 + 1) = 0;
      *((void *)v10 + 2) = 0;
      *(void *)v10 = &unk_1EE673470;
      v11.__ptr_ = (LocalizedSearchScope *)MEMORY[0x19971C380]((char *)v10 + 24, (char *)cntrl + 48);
      v11.__cntrl_ = v10;
      v12 = (std::__shared_weak_count *)v3->_coreScope.__cntrl_;
      v3->_coreScope = v11;
      if (v12) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v12);
      }

      _Block_object_dispose(&v19, 8);
      v14 = (void **)v24;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v14);
    }
    else
    {
      __38__MPModelLibrarySearchScope_coreScope__block_invoke(v3->_itemKind, v3->_itemProperties, &v19);
      self = (MPModelLibrarySearchScope *)v3->_coreScope.__cntrl_;
      v3->_coreScope = v19;
      if (self) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)self);
      }
    }
    ptr = v3->_coreScope.__ptr_;
  }
  v13 = v3->_coreScope.__cntrl_;
  *v4 = ptr;
  v4[1] = (LocalizedSearchScope *)v13;
  if (v13) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v13 + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (LocalizedSearchScope *)self;
  return result;
}

void __38__MPModelLibrarySearchScope_coreScope__block_invoke_28(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[5];
  v8 = [*(id *)(a1[4] + 40) relationships];
  v9 = [v8 objectForKeyedSubscript:v5];
  (*(void (**)(long long *__return_ptr, uint64_t, id, void *))(v7 + 16))(&v11, v7, v6, v9);

  if (!(void)v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a1[7], a1[4], @"MPModelLibrarySearchScope.mm", 121, @"Couldn't create scope for modelKind: %@", v6 object file lineNumber description];
  }
  std::vector<std::shared_ptr<mlcore::LocalizedSearchScope>>::push_back[abi:ne180100]((char **)(*(void *)(a1[6] + 8) + 48), &v11);
  if (*((void *)&v11 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v11 + 1));
  }
}

void __38__MPModelLibrarySearchScope_coreScope__block_invoke(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", [v5 modelClass]);
  uint64_t v8 = [v7 entityClass];
  if (!v8)
  {
    *a3 = 0;
    a3[1] = 0;
    goto LABEL_14;
  }
  if (!v5)
  {
    long long v14 = 0uLL;
    if (v7) {
      goto LABEL_4;
    }
LABEL_7:
    __p = 0;
    v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_8;
  }
  [v5 representedSearchScopePredicate];
  if (!v7) {
    goto LABEL_7;
  }
LABEL_4:
  [v7 MLCorePropertiesForPropertySet:v6];
LABEL_8:
  v9 = (char *)operator new(0x60uLL);
  *(_OWORD *)(v9 + 8) = 0u;
  *(void *)v9 = &unk_1EE673470;
  long long v10 = v14;
  long long v14 = 0u;
  long long v15 = v10;
  MEMORY[0x19971C370](v9 + 24, v8, &v15, &__p);
  if (*((void *)&v15 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v15 + 1));
  }
  *a3 = v9 + 24;
  a3[1] = v9;
  if (__p)
  {
    v12 = __p;
    operator delete(__p);
  }
  if (*((void *)&v14 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v14 + 1));
  }
LABEL_14:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 24), self->_itemKind);
    objc_storeStrong((id *)(v5 + 32), self->_name);
    objc_storeStrong((id *)(v5 + 40), self->_itemProperties);
    ptr = self->_coreScope.__ptr_;
    cntrl = self->_coreScope.__cntrl_;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    uint64_t v8 = *(std::__shared_weak_count **)(v5 + 16);
    *(void *)(v5 + 8) = ptr;
    *(void *)(v5 + 16) = cntrl;
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_itemKind forKey:@"MPModelLibrarySearchScopeItemKind"];
  [v4 encodeObject:self->_name forKey:@"MPModelLibrarySearchScopeName"];
  [v4 encodeObject:self->_itemProperties forKey:@"MPModelLibrarySearchScopeItemProperties"];
}

- (MPModelLibrarySearchScope)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MPModelLibrarySearchScope *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPModelLibrarySearchScopeItemKind"];
    itemKind = v5->_itemKind;
    v5->_itemKind = (MPModelKind *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPModelLibrarySearchScopeName"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPModelLibrarySearchScopeItemProperties"];
    itemProperties = v5->_itemProperties;
    v5->_itemProperties = (MPPropertySet *)v10;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MPModelLibrarySearchScope *)a3;
  uint64_t v5 = v4;
  if (self != v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = [(MPModelLibrarySearchScope *)self itemKind];
    uint64_t v8 = [(MPModelLibrarySearchScope *)v6 itemKind];
    id v9 = v7;
    id v10 = v8;
    if (v9 == v10)
    {
    }
    else
    {
      long long v11 = v10;
      char v12 = [v9 isEqual:v10];

      if ((v12 & 1) == 0) {
        goto LABEL_9;
      }
    }
    long long v14 = [(MPModelLibrarySearchScope *)self name];
    long long v15 = [(MPModelLibrarySearchScope *)v6 name];
    id v16 = v14;
    id v17 = v15;
    if (v16 == v17)
    {
    }
    else
    {
      SEL v18 = v17;
      char v19 = [v16 isEqual:v17];

      if ((v19 & 1) == 0)
      {
LABEL_9:
        char v13 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    uint64_t v20 = [(MPModelLibrarySearchScope *)self itemProperties];
    v21 = [(MPModelLibrarySearchScope *)v6 itemProperties];
    id v22 = v20;
    id v23 = v21;
    if (v22 == v23) {
      char v13 = 1;
    }
    else {
      char v13 = [v22 isEqual:v23];
    }

    goto LABEL_15;
  }
  char v13 = 1;
LABEL_16:

  return v13;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  uint64_t v7 = [(MPModelKind *)self->_itemKind description];
  [v6 appendFormat:@"; itemKind = %@", v7];

  if (self->_name) {
    [v6 appendFormat:@"; name = %@", self->_name];
  }
  itemProperties = self->_itemProperties;
  if (itemProperties)
  {
    id v9 = [(MPPropertySet *)itemProperties description];
    [v6 appendFormat:@"; itemProperties = %@", v9];
  }
  [v6 appendString:@">"];

  return v6;
}

- (MPModelLibrarySearchScope)initWithItemKind:(id)a3 name:(id)a4 properties:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  char v12 = [(MPModelLibrarySearchScope *)self init];
  char v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_itemKind, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    uint64_t v14 = [v11 copy];
    itemProperties = v13->_itemProperties;
    v13->_itemProperties = (MPPropertySet *)v14;
  }
  return v13;
}

@end