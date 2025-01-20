@interface DOCConcreteLocation
+ (BOOL)disableWorkaroundFor88096763;
+ (BOOL)supportsSecureCoding;
+ (DOCConcreteLocation)browseStartingPointsLocation;
+ (id)defaultLocation;
+ (id)defaultSaveLocation;
+ (id)emptyLocation;
+ (id)iCloudDriveLocation;
+ (id)recentDocumentsLocation;
+ (id)searchLocation;
+ (id)sharedItemsLocation;
+ (id)trashedItemsLocation;
- (BOOL)canBeRestored;
- (BOOL)isContainer;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFPV2;
- (BOOL)isRoot;
- (BOOL)isTaggedItemsSource;
- (BOOL)isTrash;
- (BOOL)needsToResolveHierarchy;
- (DOCConcreteLocation)init;
- (DOCConcreteLocation)initWithCoder:(id)a3;
- (DOCConcreteLocation)initWithSourceIdentifier:(id)a3 node:(id)a4;
- (DOCConcreteLocation)initWithSourceIdentifier:(id)a3 title:(id)a4;
- (DOCConcreteLocation)initWithTaggedItemsSourceRepresentedTag:(id)a3;
- (DOCNode)node;
- (DOCTag)representedTag;
- (FPItem)fileProviderItem;
- (NSSet)attachedTags;
- (NSString)composedTitleFormat;
- (NSString)displayName;
- (NSString)originalSourceIdentifier;
- (NSString)promptText;
- (NSString)shortDescription;
- (NSString)sourceIdentifier;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)displayNameComposedWithLocalizedAppName:(id)a3;
- (id)fileProviderSourceDisplayName;
- (id)placeholderLocation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCanBeRestored:(BOOL)a3;
- (void)setComposedTitleFormat:(id)a3;
- (void)setIsFPV2:(BOOL)a3;
- (void)setNeedsToResolveHierarchy:(BOOL)a3;
- (void)setNode:(id)a3;
- (void)setOriginalSourceIdentifier:(id)a3;
- (void)setPromptText:(id)a3;
- (void)setRepresentedTag:(id)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateUnderlyingNodeToNode:(id)a3;
@end

@implementation DOCConcreteLocation

- (NSString)originalSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

+ (id)defaultLocation
{
  v2 = objc_opt_new();
  [v2 setSourceIdentifier:@"com.apple.DocumentManager.defaultLocation"];
  [v2 setIsFPV2:1];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[DOCConcreteLocation allocWithZone:a3] init];
  v5 = [(DOCConcreteLocation *)self node];
  v6 = (void *)[v5 copy];
  [(DOCConcreteLocation *)v4 setNode:v6];

  v7 = [(DOCConcreteLocation *)self sourceIdentifier];
  v8 = (void *)[v7 copy];
  [(DOCConcreteLocation *)v4 setSourceIdentifier:v8];

  v9 = [(DOCConcreteLocation *)self title];
  v10 = (void *)[v9 copy];
  [(DOCConcreteLocation *)v4 setTitle:v10];

  v11 = [(DOCConcreteLocation *)self composedTitleFormat];
  v12 = (void *)[v11 copy];
  [(DOCConcreteLocation *)v4 setComposedTitleFormat:v12];

  v13 = [(DOCConcreteLocation *)self representedTag];
  v14 = (void *)[v13 copy];
  [(DOCConcreteLocation *)v4 setRepresentedTag:v14];

  v15 = [(DOCConcreteLocation *)self promptText];
  v16 = (void *)[v15 copy];
  [(DOCConcreteLocation *)v4 setPromptText:v16];

  [(DOCConcreteLocation *)v4 setIsFPV2:[(DOCConcreteLocation *)self isFPV2]];
  [(DOCConcreteLocation *)v4 setCanBeRestored:[(DOCConcreteLocation *)self canBeRestored]];
  return v4;
}

- (DOCTag)representedTag
{
  return (DOCTag *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)displayName
{
  v3 = [(DOCConcreteLocation *)self fileProviderSourceDisplayName];
  v4 = [(DOCConcreteLocation *)self title];

  if ([(DOCConcreteLocation *)self isRoot] && v3 || !v4)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(DOCConcreteLocation *)self title];
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (id)fileProviderSourceDisplayName
{
  v2 = [(DOCConcreteLocation *)self fileProviderItem];
  v3 = [v2 providerDomainID];

  if (v3)
  {
    v4 = [MEMORY[0x263F054C8] providerDomainWithID:v3 cachePolicy:3 error:0];
    id v5 = DOCLocalizedDisplayName();
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (void)setIsFPV2:(BOOL)a3
{
  self->_isFPV2 = a3;
}

- (DOCConcreteLocation)init
{
  v5.receiver = self;
  v5.super_class = (Class)DOCConcreteLocation;
  v2 = [(DOCConcreteLocation *)&v5 init];
  v3 = v2;
  if (v2) {
    [(DOCConcreteLocation *)v2 setCanBeRestored:1];
  }
  return v3;
}

- (void)setCanBeRestored:(BOOL)a3
{
  self->_canBeRestored = a3;
}

- (BOOL)canBeRestored
{
  return self->_canBeRestored;
}

- (void)setTitle:(id)a3
{
}

- (void)setNode:(id)a3
{
}

- (BOOL)isFPV2
{
  return self->_isFPV2;
}

- (void)setPromptText:(id)a3
{
}

- (void)setComposedTitleFormat:(id)a3
{
}

- (void)setRepresentedTag:(id)a3
{
}

- (NSString)composedTitleFormat
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)isEqual:(id)a3
{
  objc_super v5 = (DOCConcreteLocation *)a3;
  if (self != v5)
  {
    if ([(DOCConcreteLocation *)self isRoot]) {
      BOOL v6 = [(DOCConcreteLocation *)v5 isRoot];
    }
    else {
      BOOL v6 = 0;
    }
    v8 = [(DOCConcreteLocation *)self sourceIdentifier];
    v9 = [(DOCConcreteLocation *)v5 sourceIdentifier];
    int v10 = [v8 isEqual:v9];

    uint64_t v11 = [(DOCConcreteLocation *)self promptText];
    v12 = (void *)v11;
    if (v11) {
      v13 = (__CFString *)v11;
    }
    else {
      v13 = &stru_26C3FA950;
    }
    v14 = v13;

    uint64_t v15 = [(DOCConcreteLocation *)v5 promptText];
    v16 = (void *)v15;
    if (v15) {
      v17 = (__CFString *)v15;
    }
    else {
      v17 = &stru_26C3FA950;
    }
    v18 = v17;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LOBYTE(v7) = 0;
LABEL_45:

      goto LABEL_46;
    }
    v19 = [(DOCConcreteLocation *)self fileProviderItem];
    v20 = [(DOCConcreteLocation *)v5 fileProviderItem];
    if (v19 != v20)
    {
      int v21 = v6 & v10;
      v22 = [(DOCConcreteLocation *)self fileProviderItem];
      v3 = [(DOCConcreteLocation *)v5 fileProviderItem];
      if (([v22 isEqual:v3] | v21) != 1)
      {
        LOBYTE(v7) = 0;
        goto LABEL_43;
      }
      v54 = v3;
      v55 = v22;
    }
    v23 = [(DOCConcreteLocation *)self sourceIdentifier];
    v24 = [(DOCConcreteLocation *)v5 sourceIdentifier];
    if (v23 != v24)
    {
      v25 = [(DOCConcreteLocation *)self sourceIdentifier];
      v3 = [(DOCConcreteLocation *)v5 sourceIdentifier];
      if (![v25 isEqual:v3])
      {
        LOBYTE(v7) = 0;
LABEL_41:

LABEL_42:
        v22 = v55;
        v3 = v54;
        if (v19 == v20)
        {
LABEL_44:

          goto LABEL_45;
        }
LABEL_43:

        goto LABEL_44;
      }
      v51 = v25;
    }
    uint64_t v26 = [(DOCConcreteLocation *)self title];
    uint64_t v27 = [(DOCConcreteLocation *)v5 title];
    v52 = (void *)v26;
    v53 = v24;
    BOOL v28 = v26 == v27;
    uint64_t v29 = v27;
    if (v28)
    {
      v47 = v3;
      v48 = v23;
    }
    else
    {
      v45 = v20;
      v30 = v14;
      v31 = v19;
      v32 = (void *)v27;
      v33 = [(DOCConcreteLocation *)self title];
      v49 = [(DOCConcreteLocation *)v5 title];
      v50 = v33;
      if (!objc_msgSend(v33, "isEqual:"))
      {
        LOBYTE(v7) = 0;
        v37 = v32;
        v38 = v52;
        v19 = v31;
        v14 = v30;
        v20 = v45;
LABEL_39:

LABEL_40:
        v24 = v53;
        v25 = v51;
        if (v23 == v53) {
          goto LABEL_42;
        }
        goto LABEL_41;
      }
      v47 = v3;
      v48 = v23;
      uint64_t v29 = (uint64_t)v32;
      v19 = v31;
      v14 = v30;
      v20 = v45;
    }
    v34 = [(DOCConcreteLocation *)self representedTag];
    v35 = [(DOCConcreteLocation *)v5 representedTag];
    v46 = (void *)v29;
    if (v34 != v35)
    {
      v42 = v34;
      v36 = [(DOCConcreteLocation *)self representedTag];
      v44 = [(DOCConcreteLocation *)v5 representedTag];
      v45 = v36;
      if (!objc_msgSend(v36, "isEqual:"))
      {
        LOBYTE(v7) = 0;
        v34 = v42;
        goto LABEL_36;
      }
      v34 = v42;
    }
    if ([(__CFString *)v14 isEqualToString:v18]
      && (BOOL v43 = [(DOCConcreteLocation *)self isFPV2], v43 == [(DOCConcreteLocation *)v5 isFPV2]))
    {
      BOOL v40 = [(DOCConcreteLocation *)self canBeRestored];
      BOOL v7 = v40 ^ [(DOCConcreteLocation *)v5 canBeRestored] ^ 1;
      BOOL v39 = v7;
    }
    else
    {
      LOBYTE(v7) = 0;
      BOOL v39 = 0;
    }
    if (v34 == v35)
    {

      LOBYTE(v7) = v39;
LABEL_38:
      v38 = v52;
      v37 = v46;
      v3 = v47;
      v23 = v48;
      if (v52 == v46) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
LABEL_36:

    goto LABEL_38;
  }
  LOBYTE(v7) = 1;
LABEL_46:

  return v7;
}

- (NSString)sourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (FPItem)fileProviderItem
{
  v2 = [(DOCConcreteLocation *)self node];
  v3 = objc_msgSend(v2, "fpfs_fpItem");

  return (FPItem *)v3;
}

- (BOOL)isRoot
{
  v3 = [(DOCConcreteLocation *)self node];
  if ([v3 isRootItem])
  {
    BOOL v4 = 1;
  }
  else
  {
    objc_super v5 = [(DOCConcreteLocation *)self node];
    if (v5)
    {
      BOOL v4 = 0;
    }
    else
    {
      BOOL v6 = [(DOCConcreteLocation *)self sourceIdentifier];
      BOOL v4 = v6 != 0;
    }
  }

  return v4;
}

- (DOCNode)node
{
  return (DOCNode *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)promptText
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNeedsToResolveHierarchy:(BOOL)a3
{
  self->_needsToResolveHierarchy = a3;
}

+ (id)sharedItemsLocation
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__DOCConcreteLocation_sharedItemsLocation__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedItemsLocation_onceToken != -1) {
    dispatch_once(&sharedItemsLocation_onceToken, block);
  }
  v2 = (void *)sharedItemsLocation_location;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedTitleFormat, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_representedTag, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_promptText, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_originalSourceIdentifier, 0);
}

+ (id)recentDocumentsLocation
{
  if (recentDocumentsLocation_onceToken != -1) {
    dispatch_once(&recentDocumentsLocation_onceToken, &__block_literal_global_21_0);
  }
  v2 = (void *)recentDocumentsLocation_location;
  return v2;
}

- (NSString)shortDescription
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  BOOL v6 = [v3 stringWithFormat:@"<%@: %p '%@'>", v5, self, self->_title];

  return (NSString *)v6;
}

+ (id)searchLocation
{
  if (searchLocation_onceToken != -1) {
    dispatch_once(&searchLocation_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)searchLocation_searchLocation;
  return v2;
}

- (id)placeholderLocation
{
  v3 = (void *)[(DOCConcreteLocation *)self copy];
  [v3 setSourceIdentifier:@"com.apple.DocumentManager.placeholderLocation"];
  [v3 setCanBeRestored:0];
  BOOL v4 = [(DOCConcreteLocation *)self sourceIdentifier];
  objc_super v5 = (void *)[v4 copy];
  [v3 setOriginalSourceIdentifier:v5];

  return v3;
}

- (void)setOriginalSourceIdentifier:(id)a3
{
}

- (DOCConcreteLocation)initWithSourceIdentifier:(id)a3 node:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(DOCConcreteLocation *)self init];
  v9 = v8;
  if (v8)
  {
    [(DOCConcreteLocation *)v8 setSourceIdentifier:v6];
    [(DOCConcreteLocation *)v9 setIsFPV2:1];
    [(DOCConcreteLocation *)v9 updateUnderlyingNodeToNode:v7];
  }

  return v9;
}

- (void)updateUnderlyingNodeToNode:(id)a3
{
  id v6 = a3;
  [(DOCConcreteLocation *)self setNode:v6];
  BOOL v4 = [v6 domainDisplayName];
  if (v4 && [v6 isRootItem])
  {
    [(DOCConcreteLocation *)self setTitle:v4];
  }
  else
  {
    objc_super v5 = [v6 displayName];
    [(DOCConcreteLocation *)self setTitle:v5];
  }
}

+ (id)trashedItemsLocation
{
  if (trashedItemsLocation_onceToken != -1) {
    dispatch_once(&trashedItemsLocation_onceToken, &__block_literal_global_35);
  }
  v2 = (void *)trashedItemsLocation_trashedItemsLocation;
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  node = self->_node;
  id v11 = v4;
  if (node)
  {
    [(DOCNode *)node encodeNodeWithCoder:v4];
    id v4 = v11;
  }
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier)
  {
    [v4 encodeObject:sourceIdentifier forKey:@"_sourceIdentifier"];
    id v4 = v11;
  }
  title = self->_title;
  if (title)
  {
    [v4 encodeObject:title forKey:@"_title"];
    id v4 = v11;
  }
  representedTag = self->_representedTag;
  if (representedTag)
  {
    [v4 encodeObject:representedTag forKey:@"_representedTag"];
    id v4 = v11;
  }
  promptText = self->_promptText;
  if (promptText)
  {
    [v4 encodeObject:promptText forKey:@"_promptText"];
    id v4 = v11;
  }
  composedTitleFormat = self->_composedTitleFormat;
  if (composedTitleFormat)
  {
    [v4 encodeObject:composedTitleFormat forKey:@"_composedTitleFormat"];
    id v4 = v11;
  }
  [v4 encodeBool:self->_isFPV2 forKey:@"isFPV2"];
  [v11 encodeBool:self->_canBeRestored forKey:@"canBeRestored"];
}

- (BOOL)isContainer
{
  v3 = [(DOCConcreteLocation *)self node];

  if (!v3) {
    return 1;
  }
  id v4 = [(DOCConcreteLocation *)self node];
  char v5 = [v4 isFolder];

  return v5;
}

uint64_t __42__DOCConcreteLocation_sharedItemsLocation__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  v3 = (void *)sharedItemsLocation_location;
  sharedItemsLocation_location = v2;

  [(id)sharedItemsLocation_location setSourceIdentifier:@"com.apple.DocumentManager.SharedItems"];
  id v4 = _DocumentManagerBundle();
  char v5 = [v4 localizedStringForKey:@"Shared" value:@"Shared" table:@"Localizable"];
  [(id)sharedItemsLocation_location setTitle:v5];

  if ([*(id *)(a1 + 32) disableWorkaroundFor88096763])
  {
    id v6 = _DocumentManagerBundle();
    id v7 = [v6 localizedStringForKey:@"%@ Shared" value:@"%@ Shared" table:@"Localizable"];
    [(id)sharedItemsLocation_location setComposedTitleFormat:v7];
  }
  v8 = (void *)sharedItemsLocation_location;
  return [v8 setIsFPV2:1];
}

+ (BOOL)disableWorkaroundFor88096763
{
  uint64_t v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"DisableWorkaroundFor88096763"];

  return v3;
}

uint64_t __37__DOCConcreteLocation_searchLocation__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)searchLocation_searchLocation;
  searchLocation_searchLocation = v0;

  uint64_t v2 = _DocumentManagerBundle();
  char v3 = [v2 localizedStringForKey:@"Search" value:@"Search" table:@"Localizable"];
  [(id)searchLocation_searchLocation setTitle:v3];

  [(id)searchLocation_searchLocation setSourceIdentifier:@"com.apple.DocumentManager.Search"];
  [(id)searchLocation_searchLocation setIsFPV2:1];
  id v4 = (void *)searchLocation_searchLocation;
  return [v4 setCanBeRestored:0];
}

uint64_t __46__DOCConcreteLocation_recentDocumentsLocation__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)recentDocumentsLocation_location;
  recentDocumentsLocation_location = v0;

  [(id)recentDocumentsLocation_location setSourceIdentifier:*MEMORY[0x263F3AB40]];
  uint64_t v2 = _DocumentManagerBundle();
  char v3 = [v2 localizedStringForKey:@"Recents" value:@"Recents" table:@"Localizable"];
  [(id)recentDocumentsLocation_location setTitle:v3];

  id v4 = _DocumentManagerBundle();
  char v5 = [v4 localizedStringForKey:@"%@ Recents" value:@"%@ Recents" table:@"Localizable"];
  [(id)recentDocumentsLocation_location setComposedTitleFormat:v5];

  id v6 = (void *)recentDocumentsLocation_location;
  return [v6 setIsFPV2:1];
}

uint64_t __43__DOCConcreteLocation_trashedItemsLocation__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)trashedItemsLocation_trashedItemsLocation;
  trashedItemsLocation_trashedItemsLocation = v0;

  uint64_t v2 = _DocumentManagerBundle();
  char v3 = [v2 localizedStringForKey:@"Recently Deleted [Sidebar]" value:@"Recently Deleted" table:@"Localizable"];
  [(id)trashedItemsLocation_trashedItemsLocation setTitle:v3];

  id v4 = _DocumentManagerBundle();
  char v5 = [v4 localizedStringForKey:@"Recently deleted items may be permanently deleted by your storage provider." value:@"Recently deleted items may be permanently deleted by your storage provider." table:@"Localizable"];
  [(id)trashedItemsLocation_trashedItemsLocation setPromptText:v5];

  [(id)trashedItemsLocation_trashedItemsLocation setSourceIdentifier:@"com.apple.DocumentManager.TrashedItems"];
  id v6 = (void *)trashedItemsLocation_trashedItemsLocation;
  return [v6 setIsFPV2:1];
}

- (DOCConcreteLocation)initWithSourceIdentifier:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(DOCConcreteLocation *)self init];
  v9 = v8;
  if (v8)
  {
    [(DOCConcreteLocation *)v8 setSourceIdentifier:v6];
    [(DOCConcreteLocation *)v9 setTitle:v7];
  }

  return v9;
}

- (DOCConcreteLocation)initWithTaggedItemsSourceRepresentedTag:(id)a3
{
  id v4 = a3;
  char v5 = [(DOCConcreteLocation *)self init];
  id v6 = v5;
  if (v5)
  {
    [(DOCConcreteLocation *)v5 setRepresentedTag:v4];
    [(DOCConcreteLocation *)v6 setSourceIdentifier:@"com.apple.DocumentManager.TaggedItems"];
    [(DOCConcreteLocation *)v6 setIsFPV2:1];
    id v7 = [v4 displayName];
    [(DOCConcreteLocation *)v6 setTitle:v7];
  }
  return v6;
}

- (BOOL)isTaggedItemsSource
{
  uint64_t v2 = [(DOCConcreteLocation *)self representedTag];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSSet)attachedTags
{
  BOOL v3 = [(DOCConcreteLocation *)self representedTag];
  if (v3)
  {
    id v4 = [MEMORY[0x263EFFA08] setWithObject:v3];
  }
  else
  {
    char v5 = [(DOCConcreteLocation *)self node];
    uint64_t v6 = [v5 tags];
    id v7 = (void *)v6;
    v8 = (void *)MEMORY[0x263EFFA68];
    if (v6) {
      v8 = (void *)v6;
    }
    id v9 = v8;

    int v10 = [MEMORY[0x263EFF9C0] set];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __35__DOCConcreteLocation_attachedTags__block_invoke;
    v12[3] = &unk_2641B2350;
    id v4 = v10;
    id v13 = v4;
    [v9 enumerateObjectsUsingBlock:v12];
  }
  return (NSSet *)v4;
}

void __35__DOCConcreteLocation_attachedTags__block_invoke(uint64_t a1)
{
  DOCTagFromFPTag();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v2];
}

- (BOOL)isTrash
{
  BOOL v3 = [(DOCConcreteLocation *)self sourceIdentifier];
  id v4 = v3;
  if (v3)
  {
    char v5 = v3;
  }
  else
  {
    char v5 = [(DOCConcreteLocation *)self originalSourceIdentifier];
  }
  uint64_t v6 = v5;

  return v6 == @"com.apple.DocumentManager.TrashedItems";
}

+ (id)defaultSaveLocation
{
  id v2 = objc_opt_new();
  [v2 setSourceIdentifier:@"com.apple.DocumentManager.defaultSaveLocation"];
  [v2 setIsFPV2:1];
  return v2;
}

+ (id)iCloudDriveLocation
{
  id v2 = objc_opt_new();
  int v3 = FPIsCloudDocsWithFPFSEnabled();
  id v4 = (void *)MEMORY[0x263F3AB18];
  if (!v3) {
    id v4 = (void *)MEMORY[0x263F3AB28];
  }
  [v2 setSourceIdentifier:*v4];
  [v2 setIsFPV2:1];
  return v2;
}

+ (id)emptyLocation
{
  id v2 = objc_opt_new();
  [v2 setSourceIdentifier:@"com.apple.DocumentManager.emptyLocation"];
  [v2 setIsFPV2:1];
  return v2;
}

+ (DOCConcreteLocation)browseStartingPointsLocation
{
  id v2 = objc_opt_new();
  [v2 setSourceIdentifier:@"com.apple.DocumentManager.BrowseStartingPoints"];
  return (DOCConcreteLocation *)v2;
}

- (unint64_t)hash
{
  int v3 = [(DOCConcreteLocation *)self node];
  uint64_t v4 = [v3 hash];
  char v5 = [(DOCConcreteLocation *)self sourceIdentifier];
  uint64_t v6 = [v5 hash] + v4;
  id v7 = [(DOCConcreteLocation *)self representedTag];
  unint64_t v8 = v6 + [v7 hash];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCConcreteLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DOCConcreteLocation;
  char v5 = [(DOCConcreteLocation *)&v20 init];
  if (v5)
  {
    uint64_t v6 = DOCNodeFromCoder();
    node = v5->_node;
    v5->_node = (DOCNode *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sourceIdentifier"];
    sourceIdentifier = v5->_sourceIdentifier;
    v5->_sourceIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    v5->_isFPV2 = [v4 decodeBoolForKey:@"isFPV2"];
    v5->_canBeRestored = [v4 decodeBoolForKey:@"canBeRestored"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_representedTag"];
    representedTag = v5->_representedTag;
    v5->_representedTag = (DOCTag *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_promptText"];
    promptText = v5->_promptText;
    v5->_promptText = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_composedTitleFormat"];
    composedTitleFormat = v5->_composedTitleFormat;
    v5->_composedTitleFormat = (NSString *)v16;

    v18 = v5;
  }

  return v5;
}

- (id)description
{
  representedTag = self->_representedTag;
  if (representedTag)
  {
    [NSString stringWithFormat:@"representedTag=%@", representedTag];
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = &stru_26C3FA950;
  }
  char v5 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)DOCConcreteLocation;
  uint64_t v6 = [(DOCConcreteLocation *)&v9 description];
  id v7 = [v5 stringWithFormat:@"%@ title=\"%@\" [%@] DOCNode=%@%@", v6, self->_title, self->_sourceIdentifier, self->_node, v4];

  return v7;
}

- (id)displayNameComposedWithLocalizedAppName:(id)a3
{
  id v4 = a3;
  char v5 = [(DOCConcreteLocation *)self composedTitleFormat];
  if (v5 && [v4 length])
  {
    uint64_t v6 = [NSString localizedStringWithValidatedFormat:v5, @"%@", 0, v4 validFormatSpecifiers error];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)needsToResolveHierarchy
{
  return self->_needsToResolveHierarchy;
}

@end