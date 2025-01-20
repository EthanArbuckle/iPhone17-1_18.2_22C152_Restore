@interface MPModelSongKind
+ (BOOL)supportsSecureCoding;
+ (id)identityKind;
+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (MPModelSongKind)initWithCoder:(id)a3;
- (id)humanDescription;
- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3;
- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate;
- (unint64_t)hash;
- (unint64_t)options;
- (unint64_t)variants;
- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPModelSongKind

+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"Song:v%lu:o%lu", a3, a4);
  uint64_t v8 = objc_opt_class();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__MPModelSongKind_kindWithVariants_options___block_invoke;
  v11[3] = &__block_descriptor_48_e25_v16__0__MPModelSongKind_8l;
  v11[4] = a3;
  v11[5] = a4;
  v9 = [a1 kindWithModelClass:v8 cacheKey:v7 block:v11];

  return v9;
}

uint64_t __44__MPModelSongKind_kindWithVariants_options___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 16) = *(void *)(result + 32);
  *(void *)(a2 + 24) = *(void *)(result + 40);
  return result;
}

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)variants
{
  return self->_variants;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelSongKind;
  id v4 = a3;
  [(MPModelKind *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_variants, @"variants", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_options forKey:@"options"];
}

- (MPModelSongKind)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"variants"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"options"];

  v7 = +[MPModelSongKind kindWithVariants:v5 options:v6];

  return v7;
}

- (id)humanDescription
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  id v4 = v3;
  unint64_t variants = self->_variants;
  if (variants)
  {
    [v3 addObject:@"songs"];
    unint64_t variants = self->_variants;
    if ((variants & 2) == 0)
    {
LABEL_3:
      if ((variants & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((variants & 2) == 0)
  {
    goto LABEL_3;
  }
  [v4 addObject:@"music videos"];
  if ((self->_variants & 4) != 0) {
LABEL_4:
  }
    [v4 addObject:@"artist uploaded content"];
LABEL_5:
  uint64_t v6 = (void *)MEMORY[0x1E4F28E78];
  v7 = [v4 componentsJoinedByString:@" or "];
  uint64_t v8 = [v6 stringWithString:v7];

  unint64_t options = self->_options;
  if (options)
  {
    [v8 insertString:@"shuffleable " atIndex:0];
    unint64_t options = self->_options;
  }
  if ((options & 2) != 0) {
    [v8 insertString:@"cloud library " atIndex:0];
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPModelSongKind;
  BOOL v5 = [(MPModelKind *)&v7 isEqual:v4] && self->_variants == v4[2] && self->_options == v4[3];

  return v5;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)MPModelSongKind;
  unint64_t v3 = [(MPModelKind *)&v6 hash];
  unint64_t v4 = [(MPModelSongKind *)self variants];
  return v4 ^ [(MPModelSongKind *)self options] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3
{
  __p = 0;
  v17 = 0;
  v18 = 0;
  if ([(MPModelSongKind *)self variants])
  {
    BOOL v5 = operator new(4uLL);
    *BOOL v5 = 8;
    v17 = (char *)(v5 + 1);
    v18 = (char *)(v5 + 1);
    __p = v5;
  }
  unint64_t v6 = [(MPModelSongKind *)self variants];
  if ((v6 & 2) != 0)
  {
    objc_super v7 = v17;
    if (v17 >= v18)
    {
      unint64_t v6 = (unint64_t)__p;
      uint64_t v8 = (v17 - __p) >> 2;
      unint64_t v9 = v8 + 1;
      if ((unint64_t)(v8 + 1) >> 62) {
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v10 = v18 - __p;
      if ((v18 - __p) >> 1 > v9) {
        unint64_t v9 = v10 >> 1;
      }
      BOOL v11 = (unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL;
      unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
      if (!v11) {
        unint64_t v12 = v9;
      }
      if (v12)
      {
        unint64_t v12 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v12);
        unint64_t v6 = (unint64_t)__p;
        objc_super v7 = v17;
      }
      v13 = (_DWORD *)(v12 + 4 * v8);
      _DWORD *v13 = 1032;
      while (v7 != (char *)v6)
      {
        int v14 = *((_DWORD *)v7 - 1);
        v7 -= 4;
        *--v13 = v14;
      }
      if (v6) {
        operator delete((void *)v6);
      }
    }
    else
    {
      *(_DWORD *)v17 = 1032;
    }
  }
  v15 = (ModelPropertyBase *)mlcore::ItemPropertyMediaType((mlcore *)v6);
  if (a3) {
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, v15);
  }
  std::allocate_shared[abi:ne180100]<mlcore::InPredicate<int>,std::allocator<mlcore::InPredicate<int>>,mlcore::ModelProperty<int> *&,std::vector<int> const&,void>();
}

- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate
{
  uint64_t v2 = (Predicate *)[(MPModelSongKind *)self predicateWithBaseProperty:0];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:
{
  var0 = a3.var0;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = a3.var1;
  objc_super v7 = (std::__shared_weak_count *)*((void *)var0 + 1);
  uint64_t v14 = *(void *)var0;
  v15 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v13.receiver = self;
  v13.super_class = (Class)MPModelSongKind;
  [(MPModelKind *)&v13 applyToView:&v14 withContext:v6];
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  if (([(MPModelSongKind *)self options] & 2) == 0)
  {
    uint64_t v8 = [(__shared_weak_count *)v6 mediaLibrary];
    unint64_t v9 = +[MPMediaLibrarySystemFilters filtersForLibrary:v8];
    int v10 = [v9 shouldExcludePurchaseHistoryContent];

    if (v10)
    {
      BOOL v11 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:[(MPModelKind *)self modelClass]];
      [v11 entityClass];
      [v11 entityClass];
      unint64_t v12 = (mlcore *)mlcore::LibraryView::filterPredicateForEntityClass();
      mlcore::ItemPropertyRemoteLocationID(v12);
      std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator &,long long const&,mlcore::ComparisonOptions &,void>();
    }
  }
}

@end