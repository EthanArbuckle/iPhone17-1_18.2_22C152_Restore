@interface MPModelPlaylistKind
+ (BOOL)supportsSecureCoding;
+ (id)identityKind;
+ (id)kindWithVariants:(unint64_t)a3 playlistEntryKind:(id)a4 options:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (MPModelPlaylistEntryKind)playlistEntryKind;
- (MPModelPlaylistKind)initWithCoder:(id)a3;
- (id)humanDescription;
- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3;
- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate;
- (unint64_t)hash;
- (unint64_t)options;
- (unint64_t)variants;
- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPModelPlaylistKind

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

void __66__MPModelPlaylistKind_kindWithVariants_playlistEntryKind_options___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 16) = *(void *)(a1 + 40);
  objc_storeStrong((id *)(a2 + 24), *(id *)(a1 + 32));
  v4 = (id)a2;
  v4[4] = *(void *)(a1 + 48);
}

+ (id)kindWithVariants:(unint64_t)a3 playlistEntryKind:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"Playlist:v%lu:o%lu:pe%p", a3, a5, v8);
  uint64_t v10 = objc_opt_class();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__MPModelPlaylistKind_kindWithVariants_playlistEntryKind_options___block_invoke;
  v14[3] = &unk_1E57F61E8;
  id v15 = v8;
  unint64_t v16 = a3;
  unint64_t v17 = a5;
  id v11 = v8;
  v12 = [a1 kindWithModelClass:v10 cacheKey:v9 block:v14];

  return v12;
}

- (void).cxx_destruct
{
}

- (unint64_t)options
{
  return self->_options;
}

- (MPModelPlaylistEntryKind)playlistEntryKind
{
  return self->_playlistEntryKind;
}

- (unint64_t)variants
{
  return self->_variants;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelPlaylistKind;
  id v4 = a3;
  [(MPModelKind *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_variants, @"variants", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_playlistEntryKind forKey:@"playlistEntryKind"];
  [v4 encodeInteger:self->_options forKey:@"options"];
}

- (MPModelPlaylistKind)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"variants"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"options"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playlistEntryKind"];

  if (v7)
  {
    id v8 = +[MPModelPlaylistKind kindWithVariants:v5 playlistEntryKind:v7 options:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPModelPlaylistKind;
  if ([(MPModelKind *)&v8 isEqual:v4])
  {
    uint64_t v5 = v4;
    BOOL v6 = self->_variants == v5[2]
      && [(MPModelPlaylistEntryKind *)self->_playlistEntryKind isEqual:v5[3]]
      && self->_options == v5[4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelPlaylistKind;
  unint64_t v3 = self->_variants ^ [(MPModelKind *)&v5 hash] ^ self->_options;
  return v3 ^ [(MPModelPlaylistEntryKind *)self->_playlistEntryKind hash];
}

- (id)humanDescription
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] stringWithString:@"playlists"];
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:6];
  objc_super v5 = v4;
  unint64_t variants = self->_variants;
  if ((variants & 2) != 0)
  {
    [v4 addObject:@"smart"];
    unint64_t variants = self->_variants;
    if ((variants & 4) == 0)
    {
LABEL_3:
      if ((variants & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((variants & 4) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:@"genius"];
  unint64_t variants = self->_variants;
  if ((variants & 0x10) == 0)
  {
LABEL_4:
    if ((variants & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v5 addObject:@"subscribed"];
  unint64_t variants = self->_variants;
  if ((variants & 0x20) == 0)
  {
LABEL_5:
    if ((variants & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v5 addObject:@"administered"];
  unint64_t variants = self->_variants;
  if ((variants & 0x40) == 0)
  {
LABEL_6:
    if ((variants & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_23:
  [v5 addObject:@"personal mix"];
  if ((self->_variants & 0x80) != 0) {
LABEL_7:
  }
    [v5 addObject:@"favorite songs"];
LABEL_8:
  if ([v5 count])
  {
    [v3 insertString:@" " atIndex:0];
    v7 = [v5 componentsJoinedByString:@" or "];
    [v3 insertString:v7 atIndex:0];
  }
  if ((self->_variants & 8) != 0) {
    [v3 appendString:@" or folders"];
  }
  unint64_t options = self->_options;
  if (options)
  {
    [v3 insertString:@"previously played " atIndex:0];
    unint64_t options = self->_options;
    if ((options & 2) == 0)
    {
LABEL_14:
      if ((options & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((options & 2) == 0)
  {
    goto LABEL_14;
  }
  [v3 insertString:@"mutable " atIndex:0];
  if ((self->_options & 4) != 0) {
LABEL_15:
  }
    [v3 insertString:@"non-empty " atIndex:0];
LABEL_16:
  v9 = [(MPModelPlaylistEntryKind *)self->_playlistEntryKind humanDescription];
  [v3 appendFormat:@" containing %@", v9];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3
{
  IsSmart = (ModelPropertyBase *)mlcore::PlaylistPropertyIsSmart((mlcore *)self);
  if (a3) {
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, IsSmart);
  }
  std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>();
}

- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate
{
  uint64_t v2 = (Predicate *)[(MPModelPlaylistKind *)self predicateWithBaseProperty:0];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:
{
  var0 = a3.var0;
  BOOL v6 = a3.var1;
  v7 = (std::__shared_weak_count *)*((void *)var0 + 1);
  v14 = *(mlcore::LibraryView **)var0;
  id v15 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v13.receiver = self;
  v13.super_class = (Class)MPModelPlaylistKind;
  [(MPModelKind *)&v13 applyToView:&v14 withContext:v6];
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  if (([(MPModelPlaylistKind *)self options] & 4) != 0)
  {
    mlcore::LibraryView::filters(*(mlcore::LibraryView **)var0);
    mlcore::LibraryView::setFilters(*(mlcore::LibraryView **)var0);
  }
  objc_super v8 = [(MPModelPlaylistKind *)self playlistEntryKind];
  v9 = v8;
  uint64_t v10 = (std::__shared_weak_count *)*((void *)var0 + 1);
  id v11 = *(mlcore::LibraryView **)var0;
  v12 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v8 applyToView:&v11 withContext:v6];
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
}

@end