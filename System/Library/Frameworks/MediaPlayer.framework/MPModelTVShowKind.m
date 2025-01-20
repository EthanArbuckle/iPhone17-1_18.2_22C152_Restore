@interface MPModelTVShowKind
+ (BOOL)supportsSecureCoding;
+ (id)identityKind;
+ (id)kindWithSeasonKind:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MPModelTVSeasonKind)seasonKind;
- (MPModelTVShowKind)initWithCoder:(id)a3;
- (id)humanDescription;
- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate;
- (unint64_t)hash;
- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPModelTVShowKind

- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate
{
  v3 = v2;
  id v8 = [(MPModelTVShowKind *)self seasonKind];
  v4 = [v8 episodeKind];
  v5 = v4;
  if (v4)
  {
    [v4 predicateWithBaseProperty:0];
  }
  else
  {
    void *v3 = 0;
    v3[1] = 0;
  }

  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:
{
  var0 = a3.var0;
  v6 = a3.var1;
  v7 = [(MPModelTVShowKind *)self seasonKind];
  id v8 = v7;
  v9 = (std::__shared_weak_count *)*((void *)var0 + 1);
  uint64_t v10 = *(void *)var0;
  v11 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v7 applyToView:&v10 withContext:v6];
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

- (void).cxx_destruct
{
}

- (MPModelTVSeasonKind)seasonKind
{
  return self->_seasonKind;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelTVShowKind;
  id v4 = a3;
  [(MPModelKind *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_seasonKind, @"seasonKind", v5.receiver, v5.super_class);
}

- (MPModelTVShowKind)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seasonKind"];

  if (v5)
  {
    v6 = +[MPModelTVShowKind kindWithSeasonKind:v5];
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
  v7.super_class = (Class)MPModelTVShowKind;
  if ([(MPModelKind *)&v7 isEqual:v4]) {
    BOOL v5 = [(MPModelTVSeasonKind *)self->_seasonKind isEqual:v4[2]];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelTVShowKind;
  unint64_t v3 = [(MPModelKind *)&v5 hash];
  return [(MPModelTVSeasonKind *)self->_seasonKind hash] ^ v3;
}

- (id)humanDescription
{
  v2 = NSString;
  unint64_t v3 = [(MPModelTVSeasonKind *)self->_seasonKind humanDescription];
  id v4 = [v2 stringWithFormat:@"shows with %@", v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)kindWithSeasonKind:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_msgSend(NSString, "stringWithFormat:", @"TVShow:s%p", v4);
  uint64_t v6 = objc_opt_class();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__MPModelTVShowKind_kindWithSeasonKind___block_invoke;
  v10[3] = &unk_1E57F9000;
  id v11 = v4;
  id v7 = v4;
  id v8 = [a1 kindWithModelClass:v6 cacheKey:v5 block:v10];

  return v8;
}

void __40__MPModelTVShowKind_kindWithSeasonKind___block_invoke(uint64_t a1, uint64_t a2)
{
}

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

@end