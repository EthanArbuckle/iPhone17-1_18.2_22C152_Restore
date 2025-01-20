@interface MPMediaPickerConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsPickingMultipleItems;
- (BOOL)alwaysShowSearchBarInLibrary;
- (BOOL)automaticallyDrillsToLibrary;
- (BOOL)pickingForExternalPlayer;
- (BOOL)picksSingleCollectionEntity;
- (BOOL)showsCatalogContent;
- (BOOL)showsCloudItems;
- (BOOL)showsItemsWithProtectedAssets;
- (BOOL)showsLibraryContent;
- (BOOL)supportsUnavailableContent;
- (MPMediaPickerConfiguration)init;
- (MPMediaPickerConfiguration)initWithCoder:(id)a3;
- (MPPlaybackArchiveConfiguration)playbackArchiveConfiguration;
- (NSArray)typeIdentifiers;
- (NSString)prompt;
- (id)description;
- (int64_t)selectionMode;
- (int64_t)supportedContentOptions;
- (unint64_t)mediaTypes;
- (unsigned)watchCompatibilityVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsPickingMultipleItems:(BOOL)a3;
- (void)setAlwaysShowSearchBarInLibrary:(BOOL)a3;
- (void)setAutomaticallyDrillsToLibrary:(BOOL)a3;
- (void)setMediaTypes:(unint64_t)a3;
- (void)setPickingForExternalPlayer:(BOOL)a3;
- (void)setPicksSingleCollectionEntity:(BOOL)a3;
- (void)setPlaybackArchiveConfiguration:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setSelectionMode:(int64_t)a3;
- (void)setShowsCatalogContent:(BOOL)a3;
- (void)setShowsCloudItems:(BOOL)a3;
- (void)setShowsItemsWithProtectedAssets:(BOOL)a3;
- (void)setShowsLibraryContent:(BOOL)a3;
- (void)setSupportedContentOptions:(int64_t)a3;
- (void)setSupportsUnavailableContent:(BOOL)a3;
- (void)setTypeIdentifiers:(id)a3;
- (void)setWatchCompatibilityVersion:(unsigned int)a3;
@end

@implementation MPMediaPickerConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackArchiveConfiguration, 0);
  objc_storeStrong((id *)&self->_typeIdentifiers, 0);

  objc_storeStrong((id *)&self->_prompt, 0);
}

- (void)setSupportedContentOptions:(int64_t)a3
{
  self->_supportedContentOptions = a3;
}

- (int64_t)supportedContentOptions
{
  return self->_supportedContentOptions;
}

- (void)setPlaybackArchiveConfiguration:(id)a3
{
}

- (MPPlaybackArchiveConfiguration)playbackArchiveConfiguration
{
  return self->_playbackArchiveConfiguration;
}

- (void)setPickingForExternalPlayer:(BOOL)a3
{
  self->_pickingForExternalPlayer = a3;
}

- (BOOL)pickingForExternalPlayer
{
  return self->_pickingForExternalPlayer;
}

- (void)setSelectionMode:(int64_t)a3
{
  self->_selectionMode = a3;
}

- (int64_t)selectionMode
{
  return self->_selectionMode;
}

- (void)setTypeIdentifiers:(id)a3
{
}

- (NSArray)typeIdentifiers
{
  return self->_typeIdentifiers;
}

- (void)setWatchCompatibilityVersion:(unsigned int)a3
{
  self->_watchCompatibilityVersion = a3;
}

- (unsigned)watchCompatibilityVersion
{
  return self->_watchCompatibilityVersion;
}

- (void)setPicksSingleCollectionEntity:(BOOL)a3
{
  self->_picksSingleCollectionEntity = a3;
}

- (BOOL)picksSingleCollectionEntity
{
  return self->_picksSingleCollectionEntity;
}

- (void)setPrompt:(id)a3
{
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setShowsItemsWithProtectedAssets:(BOOL)a3
{
  self->_showsItemsWithProtectedAssets = a3;
}

- (BOOL)showsItemsWithProtectedAssets
{
  return self->_showsItemsWithProtectedAssets;
}

- (void)setShowsCloudItems:(BOOL)a3
{
  self->_showsCloudItems = a3;
}

- (BOOL)showsCloudItems
{
  return self->_showsCloudItems;
}

- (void)setAutomaticallyDrillsToLibrary:(BOOL)a3
{
  self->_automaticallyDrillsToLibrary = a3;
}

- (BOOL)automaticallyDrillsToLibrary
{
  return self->_automaticallyDrillsToLibrary;
}

- (void)setAlwaysShowSearchBarInLibrary:(BOOL)a3
{
  self->_alwaysShowSearchBarInLibrary = a3;
}

- (BOOL)alwaysShowSearchBarInLibrary
{
  return self->_alwaysShowSearchBarInLibrary;
}

- (void)setAllowsPickingMultipleItems:(BOOL)a3
{
  self->_allowsPickingMultipleItems = a3;
}

- (BOOL)allowsPickingMultipleItems
{
  return self->_allowsPickingMultipleItems;
}

- (void)setMediaTypes:(unint64_t)a3
{
  self->_mediaTypes = a3;
}

- (unint64_t)mediaTypes
{
  return self->_mediaTypes;
}

- (MPMediaPickerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MPMediaPickerConfiguration;
  v5 = [(MPMediaPickerConfiguration *)&v18 init];
  if (v5)
  {
    v5->_mediaTypes = [v4 decodeIntegerForKey:@"mediaTypes"];
    v5->_allowsPickingMultipleItems = [v4 decodeBoolForKey:@"allowsPickingMultipleItems"];
    v5->_alwaysShowSearchBarInLibrary = [v4 decodeBoolForKey:@"aslsb"];
    v5->_automaticallyDrillsToLibrary = [v4 decodeBoolForKey:@"adtl"];
    v5->_showsCloudItems = [v4 decodeBoolForKey:@"showsCloudItems"];
    v5->_showsItemsWithProtectedAssets = [v4 decodeBoolForKey:@"showsItemsWithProtectedAssets"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prompt"];
    uint64_t v7 = [v6 copy];
    prompt = v5->_prompt;
    v5->_prompt = (NSString *)v7;

    v5->_picksSingleCollectionEntity = [v4 decodeBoolForKey:@"picksSingleCollectionEntity"];
    v5->_watchCompatibilityVersion = [v4 decodeInt32ForKey:@"watchCompatibilityVersion"];
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"typeIdentifiers"];
    uint64_t v13 = [v12 copy];
    typeIdentifiers = v5->_typeIdentifiers;
    v5->_typeIdentifiers = (NSArray *)v13;

    v5->_selectionMode = [v4 decodeIntegerForKey:@"selectionMode"];
    v5->_pickingForExternalPlayer = [v4 decodeBoolForKey:@"pickingForExternalPlayer"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pac"];
    playbackArchiveConfiguration = v5->_playbackArchiveConfiguration;
    v5->_playbackArchiveConfiguration = (MPPlaybackArchiveConfiguration *)v15;

    v5->_supportedContentOptions = [v4 decodeIntegerForKey:@"sco"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t mediaTypes = self->_mediaTypes;
  id v5 = a3;
  [v5 encodeInteger:mediaTypes forKey:@"mediaTypes"];
  [v5 encodeBool:self->_allowsPickingMultipleItems forKey:@"allowsPickingMultipleItems"];
  [v5 encodeBool:self->_alwaysShowSearchBarInLibrary forKey:@"aslsb"];
  [v5 encodeBool:self->_automaticallyDrillsToLibrary forKey:@"adtl"];
  [v5 encodeBool:self->_showsCloudItems forKey:@"showsCloudItems"];
  [v5 encodeBool:self->_showsItemsWithProtectedAssets forKey:@"showsItemsWithProtectedAssets"];
  [v5 encodeObject:self->_prompt forKey:@"prompt"];
  [v5 encodeBool:self->_picksSingleCollectionEntity forKey:@"picksSingleCollectionEntity"];
  [v5 encodeInt32:self->_watchCompatibilityVersion forKey:@"watchCompatibilityVersion"];
  [v5 encodeObject:self->_typeIdentifiers forKey:@"typeIdentifiers"];
  [v5 encodeInteger:self->_selectionMode forKey:@"selectionMode"];
  [v5 encodeBool:self->_pickingForExternalPlayer forKey:@"pickingForExternalPlayer"];
  [v5 encodeObject:self->_playbackArchiveConfiguration forKey:@"pac"];
  [v5 encodeInteger:self->_supportedContentOptions forKey:@"sco"];
}

- (void)setSupportsUnavailableContent:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(MPMediaPickerConfiguration *)self supportedContentOptions] & 0xFFFFFFFFFFFFFFFBLL;
  uint64_t v6 = 4;
  if (!v3) {
    uint64_t v6 = 0;
  }

  [(MPMediaPickerConfiguration *)self setSupportedContentOptions:v5 | v6];
}

- (BOOL)supportsUnavailableContent
{
  return ((unint64_t)[(MPMediaPickerConfiguration *)self supportedContentOptions] >> 2) & 1;
}

- (void)setShowsLibraryContent:(BOOL)a3
{
  unint64_t v4 = [(MPMediaPickerConfiguration *)self supportedContentOptions] & 0xFFFFFFFFFFFFFFFELL | a3;

  [(MPMediaPickerConfiguration *)self setSupportedContentOptions:v4];
}

- (BOOL)showsLibraryContent
{
  return [(MPMediaPickerConfiguration *)self supportedContentOptions] & 1;
}

- (void)setShowsCatalogContent:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(MPMediaPickerConfiguration *)self supportedContentOptions] & 0xFFFFFFFFFFFFFFFDLL;
  uint64_t v6 = 2;
  if (!v3) {
    uint64_t v6 = 0;
  }

  [(MPMediaPickerConfiguration *)self setSupportedContentOptions:v5 | v6];
}

- (BOOL)showsCatalogContent
{
  return ((unint64_t)[(MPMediaPickerConfiguration *)self supportedContentOptions] >> 1) & 1;
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = _NSStringFromMPMediaType(self->_mediaTypes, @" | ");
  BOOL allowsPickingMultipleItems = self->_allowsPickingMultipleItems;
  BOOL alwaysShowSearchBarInLibrary = self->_alwaysShowSearchBarInLibrary;
  BOOL automaticallyDrillsToLibrary = self->_automaticallyDrillsToLibrary;
  BOOL showsCloudItems = self->_showsCloudItems;
  BOOL showsItemsWithProtectedAssets = self->_showsItemsWithProtectedAssets;
  if ([(NSString *)self->_prompt length]) {
    prompt = self->_prompt;
  }
  else {
    prompt = 0;
  }
  v12 = @"YES";
  if (showsItemsWithProtectedAssets) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  if (showsCloudItems) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  if (automaticallyDrillsToLibrary) {
    uint64_t v15 = @"YES";
  }
  else {
    uint64_t v15 = @"NO";
  }
  if (alwaysShowSearchBarInLibrary) {
    v16 = @"YES";
  }
  else {
    v16 = @"NO";
  }
  if (allowsPickingMultipleItems) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  if (self->_picksSingleCollectionEntity) {
    objc_super v18 = @"YES";
  }
  else {
    objc_super v18 = @"NO";
  }
  if (!self->_pickingForExternalPlayer) {
    v12 = @"NO";
  }
  v19 = [v3 stringWithFormat:@"<%@:%p mediaTypes=%@, allowsPickingMultipleItems=%@, alwaysShowsSearchBarInLibrary=%@, automaticallyDrillsToLibrary=%@, showsCloudItems=%@, showsItemsWithProtectedAssets=%@, prompt=%@, picksSingleCollectionEntity=%@, typeIdentifiers=%@, selectionMode=%lu, supportedContentOptions=%lu, pickingForExternalPlayer=%@, playbackArchiveConfiguration=%@>", v4, self, v5, v17, v16, v15, v14, v13, prompt, v18, *(_OWORD *)&self->_typeIdentifiers, self->_supportedContentOptions, v12, self->_playbackArchiveConfiguration];

  return v19;
}

- (MPMediaPickerConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)MPMediaPickerConfiguration;
  v2 = [(MPMediaPickerConfiguration *)&v5 init];
  BOOL v3 = v2;
  if (v2)
  {
    [(MPMediaPickerConfiguration *)v2 setShowsCloudItems:1];
    [(MPMediaPickerConfiguration *)v3 setShowsItemsWithProtectedAssets:1];
    [(MPMediaPickerConfiguration *)v3 setShowsLibraryContent:1];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end