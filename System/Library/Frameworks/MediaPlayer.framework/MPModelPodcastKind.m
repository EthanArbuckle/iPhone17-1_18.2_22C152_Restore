@interface MPModelPodcastKind
+ (BOOL)supportsSecureCoding;
+ (id)identityKind;
+ (id)kindWithEpisodeKind:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MPModelPodcastEpisodeKind)episodeKind;
- (MPModelPodcastKind)initWithCoder:(id)a3;
- (id)humanDescription;
- (unint64_t)hash;
- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPModelPodcastKind

- (void).cxx_destruct
{
}

- (MPModelPodcastEpisodeKind)episodeKind
{
  return self->_episodeKind;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelPodcastKind;
  id v4 = a3;
  [(MPModelKind *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_episodeKind, @"episodeKind", v5.receiver, v5.super_class);
}

- (MPModelPodcastKind)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"episodeKind"];

  if (v5)
  {
    v6 = +[MPModelPodcastKind kindWithEpisodeKind:v5];
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
  v7.super_class = (Class)MPModelPodcastKind;
  if ([(MPModelKind *)&v7 isEqual:v4]) {
    BOOL v5 = [(MPModelPodcastEpisodeKind *)self->_episodeKind isEqual:v4[2]];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelPodcastKind;
  unint64_t v3 = [(MPModelKind *)&v5 hash];
  return [(MPModelPodcastEpisodeKind *)self->_episodeKind hash] ^ v3;
}

- (id)humanDescription
{
  v2 = NSString;
  unint64_t v3 = [(MPModelPodcastEpisodeKind *)self->_episodeKind humanDescription];
  id v4 = [v2 stringWithFormat:@"podcasts containing %@", v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)kindWithEpisodeKind:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_msgSend(NSString, "stringWithFormat:", @"Podcast:e%p", v4);
  uint64_t v6 = objc_opt_class();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__MPModelPodcastKind_kindWithEpisodeKind___block_invoke;
  v10[3] = &unk_1E57F32C8;
  id v11 = v4;
  id v7 = v4;
  v8 = [a1 kindWithModelClass:v6 cacheKey:v5 block:v10];

  return v8;
}

void __42__MPModelPodcastKind_kindWithEpisodeKind___block_invoke(uint64_t a1, uint64_t a2)
{
}

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:
{
  var0 = a3.var0;
  uint64_t v6 = a3.var1;
  id v7 = [(MPModelPodcastKind *)self episodeKind];
  v8 = v7;
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