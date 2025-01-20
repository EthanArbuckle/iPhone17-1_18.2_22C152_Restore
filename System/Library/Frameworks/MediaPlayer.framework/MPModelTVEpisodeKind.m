@interface MPModelTVEpisodeKind
+ (BOOL)supportsSecureCoding;
+ (id)identityKind;
+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (MPModelTVEpisodeKind)initWithCoder:(id)a3;
- (id)humanDescription;
- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3;
- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate;
- (unint64_t)hash;
- (unint64_t)options;
- (unint64_t)variants;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPModelTVEpisodeKind

+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"TVEpisode:v%lu:o%lu", a3, a4);
  uint64_t v8 = objc_opt_class();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__MPModelTVEpisodeKind_kindWithVariants_options___block_invoke;
  v11[3] = &__block_descriptor_48_e30_v16__0__MPModelTVEpisodeKind_8l;
  v11[4] = a3;
  v11[5] = a4;
  v9 = [a1 kindWithModelClass:v8 cacheKey:v7 block:v11];

  return v9;
}

uint64_t __49__MPModelTVEpisodeKind_kindWithVariants_options___block_invoke(uint64_t result, uint64_t a2)
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
  v5.super_class = (Class)MPModelTVEpisodeKind;
  id v4 = a3;
  [(MPModelKind *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_variants, @"variants", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_options forKey:@"options"];
}

- (MPModelTVEpisodeKind)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"variants"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"options"];

  v7 = +[MPModelTVEpisodeKind kindWithVariants:v5 options:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPModelTVEpisodeKind;
  BOOL v5 = [(MPModelKind *)&v7 isEqual:v4] && self->_variants == v4[2] && self->_options == v4[3];

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)MPModelTVEpisodeKind;
  return self->_variants ^ [(MPModelKind *)&v3 hash] ^ self->_options;
}

- (id)humanDescription
{
  objc_super v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  BOOL v5 = v4;
  unint64_t variants = self->_variants;
  if (variants)
  {
    [v4 addObject:@"episodes"];
    unint64_t variants = self->_variants;
  }
  if ((variants & 2) != 0) {
    [v5 addObject:@"Apple Music episodes"];
  }
  objc_super v7 = [v5 componentsJoinedByString:@" or "];
  [v3 appendString:v7];

  if (self->_options) {
    [v3 insertString:@"shuffleable " atIndex:0];
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3
{
  id v4 = [(MPModelTVEpisodeKind *)self variants];
  if (v4)
  {
    id v4 = (mlcore *)operator new(4uLL);
    *(_DWORD *)id v4 = 512;
  }
  BOOL v5 = (ModelPropertyBase *)mlcore::ItemPropertyMediaType(v4);
  if (a3) {
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, v5);
  }
  std::allocate_shared[abi:ne180100]<mlcore::InPredicate<int>,std::allocator<mlcore::InPredicate<int>>,mlcore::ModelProperty<int> *&,std::vector<int> const&,void>();
}

- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate
{
  uint64_t v2 = (Predicate *)[(MPModelTVEpisodeKind *)self predicateWithBaseProperty:0];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

@end