@interface MPModelRequest
+ (BOOL)requiresNetwork;
+ (BOOL)supportsSecureCoding;
+ (NSOperationQueue)preferredQueue;
+ (id)sharedNetworkQueue;
+ (id)sharedQueue;
- (Class)itemClass;
- (Class)sectionClass;
- (MPModelKind)itemKind;
- (MPModelKind)sectionKind;
- (MPModelRequest)initWithCoder:(id)a3;
- (MPPropertySet)itemProperties;
- (MPPropertySet)sectionProperties;
- (NSArray)itemSortDescriptors;
- (NSArray)sectionSortDescriptors;
- (NSString)label;
- (id)_kindForClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)performWithResponseHandler:(id)a3;
- (void)responseWithCompletion:(id)a3;
- (void)setItemClass:(Class)a3;
- (void)setItemKind:(id)a3;
- (void)setItemProperties:(id)a3;
- (void)setItemSortDescriptors:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSectionClass:(Class)a3;
- (void)setSectionKind:(id)a3;
- (void)setSectionProperties:(id)a3;
- (void)setSectionSortDescriptors:(id)a3;
@end

@implementation MPModelRequest

- (MPPropertySet)itemProperties
{
  return self->_itemProperties;
}

- (MPPropertySet)sectionProperties
{
  return self->_sectionProperties;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSortDescriptors, 0);
  objc_storeStrong((id *)&self->_itemProperties, 0);
  objc_storeStrong((id *)&self->_itemKind, 0);
  objc_storeStrong((id *)&self->_sectionSortDescriptors, 0);
  objc_storeStrong((id *)&self->_sectionProperties, 0);
  objc_storeStrong((id *)&self->_sectionKind, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (void)performWithResponseHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(id)objc_opt_class() preferredQueue];
  id v5 = [(MPModelRequest *)self newOperationWithResponseHandler:v4];

  [v6 addOperation:v5];
}

+ (NSOperationQueue)preferredQueue
{
  if ([a1 requiresNetwork]) {
    [a1 sharedNetworkQueue];
  }
  else {
  v3 = [a1 sharedQueue];
  }

  return (NSOperationQueue *)v3;
}

+ (id)sharedQueue
{
  if (sharedQueue_onceToken != -1) {
    dispatch_once(&sharedQueue_onceToken, &__block_literal_global_15724);
  }
  v2 = (void *)sharedQueue___sharedQueue;

  return v2;
}

+ (BOOL)requiresNetwork
{
  return 0;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  if (self->_label) {
    [v6 appendFormat:@" label=“%@“", self->_label];
  }
  v7 = [(MPModelKind *)self->_itemKind humanDescription];
  sectionKind = self->_sectionKind;
  if (sectionKind)
  {
    v9 = [(MPModelKind *)sectionKind humanDescription];
    if ([v7 length])
    {
      uint64_t v10 = [v9 stringByReplacingOccurrencesOfString:v7 withString:@"itemKind"];

      v9 = (void *)v10;
    }
    [v6 appendFormat:@" sectionKind=“%@”", v9];
  }
  if (self->_itemKind) {
    [v6 appendFormat:@" itemKind=“%@”", v7];
  }
  [v6 appendString:@">"];

  return v6;
}

- (void)setItemProperties:(id)a3
{
}

- (void)setSectionProperties:(id)a3
{
}

- (MPModelKind)sectionKind
{
  return self->_sectionKind;
}

- (NSString)label
{
  return self->_label;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (id *)v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_label);
    objc_storeStrong(v5 + 6, self->_itemProperties);
    objc_storeStrong(v5 + 3, self->_sectionProperties);
    objc_storeStrong(v5 + 5, self->_itemKind);
    objc_storeStrong(v5 + 2, self->_sectionKind);
    objc_storeStrong(v5 + 7, self->_itemSortDescriptors);
    objc_storeStrong(v5 + 4, self->_sectionSortDescriptors);
  }
  return v5;
}

- (MPModelKind)itemKind
{
  return self->_itemKind;
}

- (void)setItemKind:(id)a3
{
}

- (void)setSectionKind:(id)a3
{
}

- (MPModelRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MPModelRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPModelRequestLabel"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPModelRequestSectionProperties"];
    sectionProperties = v5->_sectionProperties;
    v5->_sectionProperties = (MPPropertySet *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPModelRequestItemProperties"];
    itemProperties = v5->_itemProperties;
    v5->_itemProperties = (MPPropertySet *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemKind"];
    itemKind = v5->_itemKind;
    v5->_itemKind = (MPModelKind *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionKind"];
    sectionKind = v5->_sectionKind;
    v5->_sectionKind = (MPModelKind *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"MPModelRequestSectionSortDescriptors"];
    sectionSortDescriptors = v5->_sectionSortDescriptors;
    v5->_sectionSortDescriptors = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"MPModelRequestItemSortDescriptors"];
    itemSortDescriptors = v5->_itemSortDescriptors;
    v5->_itemSortDescriptors = (NSArray *)v24;
  }
  return v5;
}

uint64_t __29__MPModelRequest_sharedQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)sharedQueue___sharedQueue;
  sharedQueue___sharedQueue = (uint64_t)v0;

  [(id)sharedQueue___sharedQueue setMaxConcurrentOperationCount:4];
  [(id)sharedQueue___sharedQueue setName:@"com.apple.MediaPlayer.MPModelRequest.sharedQueue"];
  v2 = (void *)sharedQueue___sharedQueue;

  return [v2 setQualityOfService:25];
}

- (void)setItemSortDescriptors:(id)a3
{
}

- (NSArray)itemSortDescriptors
{
  return self->_itemSortDescriptors;
}

- (void)setSectionSortDescriptors:(id)a3
{
}

- (NSArray)sectionSortDescriptors
{
  return self->_sectionSortDescriptors;
}

- (id)_kindForClass:(Class)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_10;
  }
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v6 = +[MPModelSong kindWithVariants:3];
    id v5 = +[MPModelAlbum kindWithSongKind:v6];

    goto LABEL_17;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v7 = MPModelArtist;
LABEL_15:
    uint64_t v8 = +[MPModelSong kindWithVariants:3];
    v9 = +[MPModelAlbum kindWithSongKind:v8];
    id v5 = [(__objc2_class *)v7 kindWithAlbumKind:v9];

LABEL_16:
    goto LABEL_17;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v7 = MPModelComposer;
    goto LABEL_15;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v7 = MPModelGenre;
    goto LABEL_15;
  }
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v8 = [(MPModelRequest *)self _kindForClass:objc_opt_class()];
    id v5 = +[MPModelPlaylist kindWithVariants:223 playlistEntryKind:v8 options:0];
    goto LABEL_16;
  }
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v8 = [(MPModelRequest *)self _kindForClass:objc_opt_class()];
    v16[0] = v8;
    v11 = +[MPModelTVEpisode kindWithVariants:3];
    v16[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    uint64_t v13 = +[MPModelPlaylistEntry kindWithKinds:v12];
LABEL_24:
    id v5 = (void *)v13;

    goto LABEL_16;
  }
  if ((Class)objc_opt_class() != a3)
  {
    if ((Class)objc_opt_class() != a3)
    {
LABEL_10:
      id v5 = 0;
      goto LABEL_17;
    }
    v14[0] = @"MPModelRelationshipGenericAlbum";
    uint64_t v8 = [(MPModelRequest *)self _kindForClass:objc_opt_class()];
    v14[1] = @"MPModelRelationshipGenericPlaylist";
    v15[0] = v8;
    v11 = [(MPModelRequest *)self _kindForClass:objc_opt_class()];
    v15[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    uint64_t v13 = +[MPModelGenericObject kindWithRelationshipKinds:v12];
    goto LABEL_24;
  }
  id v5 = +[MPModelSong kindWithVariants:3];
LABEL_17:

  return v5;
}

- (void)setItemClass:(Class)a3
{
  if (a3)
  {
    uint64_t v5 = -[MPModelRequest _kindForClass:](self, "_kindForClass:");
    if (!v5)
    {
      uint64_t v5 = +[MPModelKind kindWithModelClass:a3];
    }
    id v6 = (id)v5;
    [(MPModelRequest *)self setItemKind:v5];
  }
  else
  {
    -[MPModelRequest setItemKind:](self, "setItemKind:");
  }
}

- (Class)itemClass
{
  v2 = [(MPModelRequest *)self itemKind];
  id v3 = [v2 modelClass];

  return (Class)v3;
}

- (void)setSectionClass:(Class)a3
{
  if (a3)
  {
    uint64_t v5 = -[MPModelRequest _kindForClass:](self, "_kindForClass:");
    if (!v5)
    {
      uint64_t v5 = +[MPModelKind kindWithModelClass:a3];
    }
    id v6 = (id)v5;
    [(MPModelRequest *)self setSectionKind:v5];
  }
  else
  {
    -[MPModelRequest setSectionKind:](self, "setSectionKind:");
  }
}

- (Class)sectionClass
{
  v2 = [(MPModelRequest *)self sectionKind];
  id v3 = [v2 modelClass];

  return (Class)v3;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  uint64_t v5 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v5 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"MPModelRequest.m", 169, @"Subclass %@ must implement -%@ defined in %@.", v9, v10, @"[MPModelRequest class]" object file lineNumber description];
  }
  [MEMORY[0x1E4F28B48] blockOperationWithBlock:&__block_literal_global_78_15640];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)responseWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(id)objc_opt_class() preferredQueue];
  id v5 = [(MPModelRequest *)self newOperationWithResponseHandler:v4];

  [v6 addOperation:v5];
}

- (void)encodeWithCoder:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [v5 encodeObject:label forKey:@"MPModelRequestLabel"];
  [v5 encodeObject:self->_sectionProperties forKey:@"MPModelRequestSectionProperties"];
  [v5 encodeObject:self->_itemProperties forKey:@"MPModelRequestItemProperties"];
  [v5 encodeObject:self->_itemKind forKey:@"itemKind"];
  [v5 encodeObject:self->_sectionKind forKey:@"sectionKind"];
  [v5 encodeObject:self->_sectionSortDescriptors forKey:@"MPModelRequestSectionSortDescriptors"];
  [v5 encodeObject:self->_itemSortDescriptors forKey:@"MPModelRequestItemSortDescriptors"];
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  if (self->_label) {
    [v6 appendFormat:@"; label = %@", self->_label];
  }
  sectionKind = self->_sectionKind;
  if (sectionKind)
  {
    uint64_t v8 = [(MPModelKind *)sectionKind debugDescription];
    [v6 appendFormat:@"; sectionKind=%@", v8];
  }
  sectionProperties = self->_sectionProperties;
  if (sectionProperties)
  {
    uint64_t v10 = [(MPPropertySet *)sectionProperties debugDescription];
    [v6 appendFormat:@"; sectionProperties = %@", v10];
  }
  itemKind = self->_itemKind;
  if (itemKind)
  {
    uint64_t v12 = [(MPModelKind *)itemKind debugDescription];
    [v6 appendFormat:@"; itemKind=%@", v12];
  }
  itemProperties = self->_itemProperties;
  if (itemProperties)
  {
    uint64_t v14 = [(MPPropertySet *)itemProperties debugDescription];
    [v6 appendFormat:@"; itemProperties = %@", v14];
  }
  [v6 appendString:@">"];

  return v6;
}

+ (id)sharedNetworkQueue
{
  if (sharedNetworkQueue_onceToken != -1) {
    dispatch_once(&sharedNetworkQueue_onceToken, &__block_literal_global_61);
  }
  v2 = (void *)sharedNetworkQueue___sharedNetworkQueue;

  return v2;
}

uint64_t __36__MPModelRequest_sharedNetworkQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)sharedNetworkQueue___sharedNetworkQueue;
  sharedNetworkQueue___sharedNetworkQueue = (uint64_t)v0;

  [(id)sharedNetworkQueue___sharedNetworkQueue setMaxConcurrentOperationCount:4];
  [(id)sharedNetworkQueue___sharedNetworkQueue setName:@"com.apple.MediaPlayer.MPModelRequest.sharedNetworkQueue"];
  v2 = (void *)sharedNetworkQueue___sharedNetworkQueue;

  return [v2 setQualityOfService:25];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end