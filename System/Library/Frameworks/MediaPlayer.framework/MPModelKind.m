@interface MPModelKind
+ (BOOL)supportsSecureCoding;
+ (MPModelKind)identityKind;
+ (MPModelKind)kindWithModelClass:(Class)a3;
+ (MPModelKind)unknownKind;
+ (id)_kindWithModelClass:(Class)a3 cacheKey:(id)a4 block:(id)a5;
- (BOOL)isEqual:(id)a3;
- (Class)modelClass;
- (MPModelKind)identityKind;
- (MPModelKind)initWithCoder:(id)a3;
- (NSString)humanDescription;
- (id)_initWithModelClass:(Class)a3;
- (id)description;
- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3;
- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate;
- (unint64_t)hash;
- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPModelKind

- (MPModelKind)identityKind
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = self;
  }
  else
  {
    v4 = [(id)objc_opt_class() identityKind];
  }

  return v4;
}

+ (id)_kindWithModelClass:(Class)a3 cacheKey:(id)a4 block:(id)a5
{
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  os_unfair_lock_lock((os_unfair_lock_t)&_kindWithModelClass_cacheKey_block____lock);
  uint64_t v11 = [(id)_kindWithModelClass_cacheKey_block____kinds objectForKeyedSubscript:v9];
  if (v11)
  {
    v12 = (void *)v11;
    os_unfair_lock_unlock((os_unfair_lock_t)&_kindWithModelClass_cacheKey_block____lock);
  }
  else
  {
    if (!_kindWithModelClass_cacheKey_block____kinds)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:50];
      v14 = (void *)_kindWithModelClass_cacheKey_block____kinds;
      _kindWithModelClass_cacheKey_block____kinds = v13;
    }
    v12 = (void *)[objc_alloc((Class)a1) _initWithModelClass:a3];
    v10[2](v10, v12);
    [(id)_kindWithModelClass_cacheKey_block____kinds setObject:v12 forKeyedSubscript:v9];
    os_unfair_lock_unlock((os_unfair_lock_t)&_kindWithModelClass_cacheKey_block____lock);
    if (!v12)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:a1 file:@"MPModelObject.m" lineNumber:669 description:@"Must have produced a model kind!"];
    }
  }

  return v12;
}

+ (MPModelKind)kindWithModelClass:(Class)a3
{
  return (MPModelKind *)[a1 _kindWithModelClass:a3 cacheKey:a3 block:&__block_literal_global_217_33037];
}

- (id)_initWithModelClass:(Class)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPModelKind;
  v4 = [(MPModelKind *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeStrong((id *)&v4->_modelClass, a3);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MPModelKind *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else if ([(MPModelKind *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    v6 = [(MPModelKind *)self modelClass];
    uint64_t v7 = [(MPModelKind *)v5 modelClass];

    BOOL v8 = v6 == (objc_class *)v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (Class)modelClass
{
  return self->_modelClass;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MPModelKind)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPModelKind;
  v5 = [(MPModelKind *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelClass"];
    uint64_t v7 = NSClassFromString(v6);
    Class modelClass = v5->_modelClass;
    v5->_Class modelClass = (Class)v7;
  }
  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPModelKind *)self humanDescription];
  v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (NSString)humanDescription
{
  return NSStringFromClass(self->_modelClass);
}

- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v5 = a3.var1;
  v6 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:[(MPModelKind *)self modelClass]];
  [(MPModelKind *)self predicateWithBaseProperty:0];
  [v6 entityClass];
  mlcore::LibraryView::filterPredicateForEntityClass();
  [v6 entityClass];
  v19[0] = v17;
  v19[1] = v18;
  if (v18) {
    atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v19[2] = v15;
  v19[3] = v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v11 = 0;
  v12 = 0;
  uint64_t v13 = 0;
  id v9 = (void **)&v11;
  char v10 = 0;
  uint64_t v11 = operator new(0x20uLL);
  v12 = v11;
  uint64_t v13 = v11 + 4;
  v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::Predicate>>,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate>*>((uint64_t)&v13, v19, v20, v11);
  mlcore::CreateAndPredicate();
  mlcore::LibraryView::setFilterPredicateForEntityClass();
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  id v9 = (void **)&v11;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v9);
  for (uint64_t i = 3; i != -1; i -= 2)
  {
    BOOL v8 = (std::__shared_weak_count *)v19[i];
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
}

- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3
{
  *uint64_t v3 = 0;
  v3[1] = 0;
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (Predicate *)self;
  return result;
}

+ (MPModelKind)unknownKind
{
  id v2 = [[MPModelKind alloc] _initWithModelClass:objc_opt_class()];

  return (MPModelKind *)v2;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  Class modelClass = self->_modelClass;
  id v4 = a3;
  NSStringFromClass(modelClass);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"modelClass"];
}

- (unint64_t)hash
{
  return [(objc_class *)self->_modelClass hash] ^ 0x8542043BLL;
}

+ (MPModelKind)identityKind
{
  uint64_t v4 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v4 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    char v10 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, a1, @"MPModelObject.m", 587, @"Subclass %@ must implement -%@ defined in %@.", v9, v10, @"[MPModelKind class]" object file lineNumber description];
  }
  id v5 = [[MPModelKind alloc] _initWithModelClass:objc_opt_class()];

  return (MPModelKind *)v5;
}

- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate
{
  *id v2 = 0;
  v2[1] = 0;
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (Predicate *)self;
  return result;
}

@end