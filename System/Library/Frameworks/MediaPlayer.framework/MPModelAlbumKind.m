@interface MPModelAlbumKind
+ (BOOL)supportsSecureCoding;
+ (MPModelAlbumKind)kindWithVariants:(unint64_t)a3 songKind:(id)a4 options:(unint64_t)a5;
+ (id)identityKind;
- (BOOL)isEqual:(id)a3;
- (MPModelAlbumKind)initWithCoder:(id)a3;
- (MPModelSongKind)songKind;
- (id)humanDescription;
- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3;
- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate;
- (unint64_t)hash;
- (unint64_t)options;
- (unint64_t)variants;
- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPModelAlbumKind

+ (MPModelAlbumKind)kindWithVariants:(unint64_t)a3 songKind:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"Album:v%lu:o%lu:s%p", a3, a5, v8);
  uint64_t v10 = objc_opt_class();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__MPModelAlbumKind_kindWithVariants_songKind_options___block_invoke;
  v14[3] = &unk_1E57FA430;
  id v15 = v8;
  unint64_t v16 = a3;
  unint64_t v17 = a5;
  id v11 = v8;
  v12 = [a1 kindWithModelClass:v10 cacheKey:v9 block:v14];

  return (MPModelAlbumKind *)v12;
}

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

void __54__MPModelAlbumKind_kindWithVariants_songKind_options___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 16) = *(void *)(a1 + 40);
  objc_storeStrong((id *)(a2 + 24), *(id *)(a1 + 32));
  v4 = (id)a2;
  v4[4] = *(void *)(a1 + 48);
}

- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3
{
  v4 = (ModelPropertyBase *)mlcore::AlbumPropertyAllCompilations((mlcore *)self);
  if (a3) {
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, v4);
  }
  std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>();
}

- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(MPModelAlbumKind *)self songKind];
  v4 = v3;
  if (v3)
  {
    [v3 predicateWithBaseProperty:0];
  }
  else
  {
    v14[0] = 0;
    v14[1] = 0;
  }
  [(MPModelAlbumKind *)self predicateWithBaseProperty:0];
  v9 = 0;
  uint64_t v10 = 0;
  id v11 = 0;
  v12 = (void **)&v9;
  char v13 = 0;
  v9 = operator new(0x20uLL);
  uint64_t v10 = v9;
  id v11 = v9 + 4;
  uint64_t v10 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::Predicate>>,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate>*>((uint64_t)&v11, v14, &v15, v9);
  mlcore::CreateAndPredicate();
  v12 = (void **)&v9;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v12);
  for (uint64_t i = 3; i != -1; i -= 2)
  {
    v6 = (std::__shared_weak_count *)v14[i];
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }

  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:
{
  var0 = a3.var0;
  v6 = a3.var1;
  v7 = (std::__shared_weak_count *)*((void *)var0 + 1);
  uint64_t v14 = *(void *)var0;
  uint64_t v15 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v13.receiver = self;
  v13.super_class = (Class)MPModelAlbumKind;
  [(MPModelKind *)&v13 applyToView:&v14 withContext:v6];
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  id v8 = [(MPModelAlbumKind *)self songKind];
  v9 = v8;
  uint64_t v10 = (std::__shared_weak_count *)*((void *)var0 + 1);
  uint64_t v11 = *(void *)var0;
  v12 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v8 applyToView:&v11 withContext:v6];
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
}

- (void).cxx_destruct
{
}

- (unint64_t)options
{
  return self->_options;
}

- (MPModelSongKind)songKind
{
  return self->_songKind;
}

- (unint64_t)variants
{
  return self->_variants;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelAlbumKind;
  id v4 = a3;
  [(MPModelKind *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_variants, @"variants", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_songKind forKey:@"songKind"];
  [v4 encodeInteger:self->_options forKey:@"options"];
}

- (MPModelAlbumKind)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"variants"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"options"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"songKind"];

  if (v7)
  {
    id v8 = +[MPModelAlbumKind kindWithVariants:v5 songKind:v7 options:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)humanDescription
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = v3;
  unint64_t variants = self->_variants;
  if (variants)
  {
    [v3 appendString:@"albums"];
    if ((self->_variants & 2) == 0) {
      goto LABEL_7;
    }
    [v4 appendString:@" or "];
    goto LABEL_6;
  }
  if ((variants & 2) != 0) {
LABEL_6:
  }
    [v4 appendString:@"compilations"];
LABEL_7:
  if (self->_options) {
    [v4 insertString:@"previously played " atIndex:0];
  }
  uint64_t v6 = [(MPModelSongKind *)self->_songKind humanDescription];
  [v4 appendFormat:@" containing %@", v6];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPModelAlbumKind;
  if ([(MPModelKind *)&v12 isEqual:v4])
  {
    id v5 = v4;
    unint64_t v6 = [(MPModelAlbumKind *)self variants];
    if (v6 == [v5 variants]
      && (unint64_t v7 = -[MPModelAlbumKind options](self, "options"), v7 == [v5 options]))
    {
      id v8 = [(MPModelAlbumKind *)self songKind];
      v9 = [v5 songKind];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)MPModelAlbumKind;
  unint64_t v3 = [(MPModelKind *)&v9 hash];
  unint64_t v4 = [(MPModelAlbumKind *)self variants];
  unint64_t v5 = v4 ^ [(MPModelAlbumKind *)self options];
  unint64_t v6 = [(MPModelAlbumKind *)self songKind];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end