@interface MPModelPodcastEpisodeKind
+ (BOOL)supportsSecureCoding;
+ (MPModelPodcastEpisodeKind)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4;
+ (id)identityKind;
- (BOOL)isEqual:(id)a3;
- (MPModelPodcastEpisodeKind)initWithCoder:(id)a3;
- (id)humanDescription;
- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3;
- (unint64_t)hash;
- (unint64_t)options;
- (unint64_t)variants;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPModelPodcastEpisodeKind

- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3
{
  __p = 0;
  v17 = 0;
  v18 = 0;
  if ([(MPModelPodcastEpisodeKind *)self variants])
  {
    v5 = operator new(4uLL);
    _DWORD *v5 = 4;
    v17 = (char *)(v5 + 1);
    v18 = (char *)(v5 + 1);
    __p = v5;
  }
  unint64_t v6 = [(MPModelPodcastEpisodeKind *)self variants];
  if ((v6 & 2) != 0)
  {
    v7 = v17;
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
        v7 = v17;
      }
      v13 = (_DWORD *)(v12 + 4 * v8);
      _DWORD *v13 = 256;
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
      *(_DWORD *)v17 = 256;
    }
  }
  v15 = (ModelPropertyBase *)mlcore::ItemPropertyMediaType((mlcore *)v6);
  if (a3) {
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, v15);
  }
  std::allocate_shared[abi:ne180100]<mlcore::InPredicate<int>,std::allocator<mlcore::InPredicate<int>>,mlcore::ModelProperty<int> *&,std::vector<int> const&,void>();
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
  v5.super_class = (Class)MPModelPodcastEpisodeKind;
  id v4 = a3;
  [(MPModelKind *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_variants, @"variants", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_options forKey:@"options"];
}

- (MPModelPodcastEpisodeKind)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"variants"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"options"];

  v7 = +[MPModelPodcastEpisodeKind kindWithVariants:v5 options:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPModelPodcastEpisodeKind;
  BOOL v5 = [(MPModelKind *)&v7 isEqual:v4] && self->_variants == v4[2] && self->_options == v4[3];

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)MPModelPodcastEpisodeKind;
  return self->_variants ^ [(MPModelKind *)&v3 hash] ^ self->_options;
}

- (id)humanDescription
{
  objc_super v3 = [MEMORY[0x1E4F28E78] stringWithString:@"podcasts"];
  id v4 = v3;
  unint64_t variants = self->_variants;
  if (variants)
  {
    [v3 insertString:@"audio " atIndex:0];
    if ((self->_variants & 2) == 0) {
      goto LABEL_7;
    }
    [v4 insertString:@" or " atIndex:0];
    goto LABEL_6;
  }
  if ((variants & 2) != 0) {
LABEL_6:
  }
    [v4 insertString:@"video " atIndex:0];
LABEL_7:
  if (self->_options) {
    [v4 insertString:@"unplayed " atIndex:0];
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MPModelPodcastEpisodeKind)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  objc_super v7 = objc_msgSend(NSString, "stringWithFormat:", @"PodcastEpisode:v%lu:o%lu", a3, a4);
  uint64_t v8 = objc_opt_class();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__MPModelPodcastEpisodeKind_kindWithVariants_options___block_invoke;
  v11[3] = &__block_descriptor_48_e35_v16__0__MPModelPodcastEpisodeKind_8l;
  v11[4] = a3;
  v11[5] = a4;
  unint64_t v9 = [a1 kindWithModelClass:v8 cacheKey:v7 block:v11];

  return (MPModelPodcastEpisodeKind *)v9;
}

uint64_t __54__MPModelPodcastEpisodeKind_kindWithVariants_options___block_invoke(uint64_t result, uint64_t a2)
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

@end