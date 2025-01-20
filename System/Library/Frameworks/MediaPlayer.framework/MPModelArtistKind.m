@interface MPModelArtistKind
+ (BOOL)supportsSecureCoding;
+ (id)identityKind;
+ (id)kindWithAlbumKind:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MPModelAlbumKind)albumKind;
- (MPModelArtistKind)initWithCoder:(id)a3;
- (id)humanDescription;
- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate;
- (unint64_t)hash;
- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPModelArtistKind

- (void).cxx_destruct
{
}

- (MPModelAlbumKind)albumKind
{
  return self->_albumKind;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelArtistKind;
  id v4 = a3;
  [(MPModelKind *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_albumKind, @"albumKind", v5.receiver, v5.super_class);
}

- (MPModelArtistKind)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"albumKind"];

  if (v5)
  {
    v6 = +[MPModelArtistKind kindWithAlbumKind:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPModelArtistKind;
  if ([(MPModelKind *)&v7 isEqual:v4]) {
    BOOL v5 = [(MPModelAlbumKind *)self->_albumKind isEqual:v4[2]];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelArtistKind;
  unint64_t v3 = [(MPModelKind *)&v5 hash];
  return [(MPModelAlbumKind *)self->_albumKind hash] ^ v3;
}

- (id)humanDescription
{
  v2 = NSString;
  unint64_t v3 = [(MPModelAlbumKind *)self->_albumKind humanDescription];
  id v4 = [v2 stringWithFormat:@"artists with %@", v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)kindWithAlbumKind:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_msgSend(NSString, "stringWithFormat:", @"Artist:a%p", v4);
  uint64_t v6 = objc_opt_class();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__MPModelArtistKind_kindWithAlbumKind___block_invoke;
  v10[3] = &unk_1E57EEF18;
  id v11 = v4;
  id v7 = v4;
  v8 = [a1 kindWithModelClass:v6 cacheKey:v5 block:v10];

  return v8;
}

void __39__MPModelArtistKind_kindWithAlbumKind___block_invoke(uint64_t a1, uint64_t a2)
{
}

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(MPModelArtistKind *)self albumKind];
  unint64_t v3 = [v2 songKind];
  id v4 = v3;
  if (v3)
  {
    [v3 predicateWithBaseProperty:0];
  }
  else
  {
    v19 = 0;
    v20 = 0;
  }

  uint64_t v6 = (mlcore *)mlcore::ArtistPropertyPersistentID(v5);
  mlcore::ItemPropertyAlbumArtistPersistentID(v6);
  id v7 = operator new(0x38uLL);
  v7[1] = 0;
  v7[2] = 0;
  *id v7 = &unk_1EE6734E0;
  uint64_t v8 = mlcore::ComparisonPropertyPredicate::ComparisonPropertyPredicate();
  MEMORY[0x19971D490](v8);
  v22 = v19;
  v23 = v20;
  if (v20) {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v24 = v7 + 3;
  v25 = v7;
  atomic_fetch_add_explicit(v7 + 1, 1uLL, memory_order_relaxed);
  v15 = 0;
  v16 = 0;
  v17 = 0;
  *(void *)&long long v21 = &v15;
  BYTE8(v21) = 0;
  v15 = operator new(0x20uLL);
  v16 = v15;
  v17 = v15 + 4;
  v16 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::Predicate>>,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate> const*,std::shared_ptr<mlcore::Predicate>*>((uint64_t)&v17, &v22, &v26, v15);
  mlcore::CreateAndPredicate();
  v9 = (std::__shared_weak_count *)operator new(0x38uLL);
  *(_OWORD *)&v9->__shared_owners_ = 0u;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE673550;
  long long v21 = v18;
  long long v18 = 0u;
  mlcore::Query::Query();
  if (*((void *)&v21 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v21 + 1));
  }
  if (*((void *)&v18 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v18 + 1));
  }
  *(void *)&long long v21 = &v15;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
  uint64_t v10 = 24;
  while (1)
  {
    id v11 = *(std::__shared_weak_count **)((char *)&v22 + v10);
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    v10 -= 16;
    if (v10 == -8)
    {
      v12 = operator new(0x30uLL);
      v12[1] = 0;
      v12[2] = 0;
      void *v12 = &unk_1EE673278;
      v22 = v9 + 1;
      v23 = v9;
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      mlcore::ExistsPredicate::ExistsPredicate();
      v13 = (mlcore *)v23;
      if (v23) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v23);
      }
      mlcore::ArtistPropertyLikedState(v13);
      LODWORD(v22) = 2;
      v14 = operator new(0x48uLL);
      v14[1] = 0;
      v14[2] = 0;
      void *v14 = &unk_1EE6733C8;
      mlcore::ComparisonPredicate<int>::ComparisonPredicate();
    }
  }
}

- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:
{
  var0 = a3.var0;
  uint64_t v6 = a3.var1;
  id v7 = [(MPModelArtistKind *)self albumKind];
  uint64_t v8 = v7;
  v9 = (std::__shared_weak_count *)*((void *)var0 + 1);
  uint64_t v10 = *(void *)var0;
  id v11 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v7 applyToView:&v10 withContext:v6];
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

@end