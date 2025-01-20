@interface MusicKit_SoftLinking_MPMusicPlayerItem
+ (id)playerItemForMediaItem:(id)a3;
- (BOOL)isExplicit;
- (BOOL)isMusicVideo;
- (MusicKit_SoftLinking_CatalogID)underlyingItemCatalogID;
- (MusicKit_SoftLinking_MPArtworkCatalog)artworkCatalog;
- (NSDate)releaseDate;
- (NSDictionary)playParametersDictionary;
- (NSNumber)discNumber;
- (NSNumber)duration;
- (NSNumber)has4K;
- (NSNumber)hasHDR;
- (NSNumber)trackNumber;
- (NSString)albumTitle;
- (NSString)artistName;
- (NSString)genreIdentifier;
- (NSString)genreName;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (NSString)underlyingItemLibraryID;
- (id)_initWithMediaItem:(id)a3;
- (id)description;
- (void)_initializeAdditionalAttributesWithMediaItem:(id)a3;
- (void)_initializeArtworkCatalogWithMediaItem:(id)a3;
- (void)_initializeBasicPropertiesWithMediaItem:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPMusicPlayerItem

+ (id)playerItemForMediaItem:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = (void *)[objc_alloc((Class)a1) _initWithMediaItem:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_initWithMediaItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MusicKit_SoftLinking_MPMusicPlayerItem;
  v5 = [(MusicKit_SoftLinking_MPMusicPlayerItem *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(MusicKit_SoftLinking_MPMusicPlayerItem *)v5 _initializeBasicPropertiesWithMediaItem:v4];
    [(MusicKit_SoftLinking_MPMusicPlayerItem *)v6 _initializeArtworkCatalogWithMediaItem:v4];
    [(MusicKit_SoftLinking_MPMusicPlayerItem *)v6 _initializeAdditionalAttributesWithMediaItem:v4];
  }

  return v6;
}

- (void)_initializeBasicPropertiesWithMediaItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v6 = (void *)get_MPMusicPlayerMediaItemProxyClass_softClass;
  uint64_t v21 = get_MPMusicPlayerMediaItemProxyClass_softClass;
  if (!get_MPMusicPlayerMediaItemProxyClass_softClass)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __get_MPMusicPlayerMediaItemProxyClass_block_invoke;
    v17[3] = &unk_26443F950;
    v17[4] = &v18;
    __get_MPMusicPlayerMediaItemProxyClass_block_invoke((uint64_t)v17);
    v6 = (void *)v19[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v18, 8);
  if (v5 == objc_opt_class())
  {
    objc_super v8 = [v4 itemIdentifier];
  }
  else
  {
    objc_super v8 = 0;
  }
  v9 = (NSString *)[v8 copy];
  identifier = self->_identifier;
  self->_identifier = v9;

  v11 = [v4 title];
  v12 = (NSString *)[v11 copy];
  title = self->_title;
  self->_title = v12;

  v14 = [v4 artist];
  v15 = (NSString *)[v14 copy];
  subtitle = self->_subtitle;
  self->_subtitle = v15;
}

- (void)_initializeArtworkCatalogWithMediaItem:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = [v4 artworkCatalog];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  uint64_t v5 = (void *)getMPModelObjectMediaItemClass_softClass;
  uint64_t v32 = getMPModelObjectMediaItemClass_softClass;
  if (!getMPModelObjectMediaItemClass_softClass)
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __getMPModelObjectMediaItemClass_block_invoke;
    v27 = &unk_26443F950;
    v28 = &v29;
    __getMPModelObjectMediaItemClass_block_invoke((uint64_t)&v24);
    uint64_t v5 = (void *)v30[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v29, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v4;
    objc_super v8 = [v7 modelObject];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x2050000000;
      v9 = (void *)getMPModelObjectClass_softClass_0;
      uint64_t v32 = getMPModelObjectClass_softClass_0;
      if (!getMPModelObjectClass_softClass_0)
      {
        uint64_t v24 = MEMORY[0x263EF8330];
        uint64_t v25 = 3221225472;
        v26 = __getMPModelObjectClass_block_invoke_0;
        v27 = &unk_26443F950;
        v28 = &v29;
        __getMPModelObjectClass_block_invoke_0((uint64_t)&v24);
        v9 = (void *)v30[3];
      }
      id v10 = v9;
      _Block_object_dispose(&v29, 8);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __81__MusicKit_SoftLinking_MPMusicPlayerItem__initializeArtworkCatalogWithMediaItem___block_invoke;
      v15[3] = &unk_26443FFB8;
      v17 = &v18;
      id v16 = v8;
      [v10 performWithoutEnforcement:v15];
    }
    if (!v19[5])
    {
      uint64_t v11 = [v7 fallbackArtworkCatalogBlock];
      v12 = (void *)v11;
      if (v11)
      {
        uint64_t v13 = (*(void (**)(uint64_t))(v11 + 16))(v11);
        v14 = (void *)v19[5];
        v19[5] = v13;
      }
    }
  }
  objc_storeStrong((id *)&self->_artworkCatalog, (id)v19[5]);
  _Block_object_dispose(&v18, 8);
}

- (void)_initializeAdditionalAttributesWithMediaItem:(id)a3
{
  id v4 = a3;
  if (_initializeAdditionalAttributesWithMediaItem__sMediaItemPropertiesOnceToken != -1) {
    dispatch_once(&_initializeAdditionalAttributesWithMediaItem__sMediaItemPropertiesOnceToken, &__block_literal_global_3);
  }
  v107 = v4;
  uint64_t v5 = [v4 valuesForProperties:_initializeAdditionalAttributesWithMediaItem__sMediaItemProperties];
  id v6 = getMPMediaItemPropertyStoreID();
  id v7 = [v5 objectForKey:v6];

  v106 = v7;
  if (_NSIsNSNumber())
  {
    uint64_t v8 = [v7 unsignedLongLongValue];
    if (v8)
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", v8);
      id v10 = [[MusicKit_SoftLinking_CatalogID alloc] initWithValue:v9 kind:0];

      if (v10) {
        goto LABEL_9;
      }
    }
  }
  uint64_t v11 = getMPMediaItemPropertySubscriptionStoreItemID();
  v12 = [v5 objectForKey:v11];

  if (_NSIsNSNumber() && (uint64_t v13 = [v12 unsignedLongLongValue]) != 0)
  {
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", v13);
    id v10 = [[MusicKit_SoftLinking_CatalogID alloc] initWithValue:v14 kind:6];

    if (v10)
    {
LABEL_9:
      int v108 = 0;
      id v15 = 0;
      goto LABEL_18;
    }
  }
  else
  {
  }
  id v16 = getMPMediaItemPropertyStoreCloudUniversalLibraryID();
  v17 = [v5 objectForKey:v16];

  if (_NSIsNSString())
  {
    id v18 = v17;
    if ([v18 length]) {
      id v15 = v18;
    }
    else {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  id v10 = 0;
  int v108 = 1;
LABEL_18:
  objc_storeStrong((id *)&self->_underlyingItemCatalogID, v10);
  v19 = (NSString *)[v15 copy];
  underlyingItemLibraryID = self->_underlyingItemLibraryID;
  self->_underlyingItemLibraryID = v19;

  uint64_t v21 = getMPMediaItemPropertyAlbumTitle();
  v22 = [v5 objectForKey:v21];

  if (_NSIsNSString()) {
    id v23 = v22;
  }
  else {
    id v23 = 0;
  }
  v104 = v23;
  uint64_t v24 = (NSString *)[v23 copy];
  albumTitle = self->_albumTitle;
  self->_albumTitle = v24;

  v26 = getMPMediaItemPropertyArtist();
  v27 = [v5 objectForKey:v26];

  if (_NSIsNSString()) {
    id v28 = v27;
  }
  else {
    id v28 = 0;
  }
  v102 = v28;
  uint64_t v29 = (NSString *)[v28 copy];
  artistName = self->_artistName;
  self->_artistName = v29;

  uint64_t v31 = getMPMediaItemPropertyStoreGenreID();
  uint64_t v32 = [v5 objectForKey:v31];

  if (_NSIsNSNumber())
  {
    v33 = (void *)[v32 unsignedLongLongValue];
    if (v33)
    {
      v33 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", v33);
    }
  }
  else
  {
    v33 = 0;
  }
  v100 = v33;
  v34 = (NSString *)[v33 copy];
  genreIdentifier = self->_genreIdentifier;
  self->_genreIdentifier = v34;

  v36 = getMPMediaItemPropertyGenre();
  v37 = [v5 objectForKey:v36];

  v109 = v15;
  if (_NSIsNSString()) {
    id v38 = v37;
  }
  else {
    id v38 = 0;
  }
  v98 = v38;
  v39 = (NSString *)[v38 copy];
  genreName = self->_genreName;
  self->_genreName = v39;

  v41 = getMPMediaItemPropertyPlaybackDuration();
  v42 = [v5 objectForKey:v41];

  v97 = v42;
  if (_NSIsNSNumber()) {
    id v43 = v42;
  }
  else {
    id v43 = 0;
  }
  v96 = v43;
  v44 = (NSNumber *)[v43 copy];
  duration = self->_duration;
  self->_duration = v44;

  v46 = getMPMediaItemPropertyAlbumTrackNumber();
  v47 = [v5 objectForKey:v46];

  v103 = v27;
  if (_NSIsNSNumber()) {
    id v48 = v47;
  }
  else {
    id v48 = 0;
  }
  v94 = v48;
  v49 = (NSNumber *)[v48 copy];
  trackNumber = self->_trackNumber;
  self->_trackNumber = v49;

  v51 = getMPMediaItemPropertyDiscNumber();
  v52 = [v5 objectForKey:v51];

  v93 = v52;
  if (_NSIsNSNumber()) {
    id v53 = v52;
  }
  else {
    id v53 = 0;
  }
  v92 = v53;
  v54 = (NSNumber *)[v53 copy];
  discNumber = self->_discNumber;
  self->_discNumber = v54;

  v56 = getMPMediaItemPropertyReleaseDate();
  v57 = [v5 objectForKey:v56];

  if (_NSIsNSDate()) {
    id v58 = v57;
  }
  else {
    id v58 = 0;
  }
  v90 = v58;
  v59 = (NSDate *)[v58 copy];
  releaseDate = self->_releaseDate;
  self->_releaseDate = v59;

  v61 = getMPMediaItemPropertyIsExplicit();
  v62 = [v5 objectForKey:v61];

  int v63 = _NSIsNSNumber();
  v101 = v32;
  v89 = v62;
  if (v63) {
    LOBYTE(v63) = [v62 BOOLValue];
  }
  v99 = v37;
  self->_isExplicit = v63;
  v64 = getMPMediaItemPropertyIsMusicVideo();
  v65 = [v5 objectForKey:v64];

  v110 = v10;
  v91 = v57;
  if (_NSIsNSNumber()) {
    int v66 = [v65 BOOLValue];
  }
  else {
    int v66 = 0;
  }
  v95 = v47;
  self->_isMusicVideo = v66;
  v67 = getMPMediaItemPropertyVideoQuality();
  v68 = [v5 objectForKey:v67];

  v105 = v22;
  if (_NSIsNSNumber())
  {
    v69 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v68, "integerValue") == 3);
  }
  else
  {
    v69 = 0;
  }
  v70 = (NSNumber *)[v69 copy];
  has4K = self->_has4K;
  self->_has4K = v70;

  v72 = getMPMediaItemPropertyColorCapability();
  v73 = [v5 objectForKey:v72];

  if (_NSIsNSNumber())
  {
    char v74 = [v73 integerValue];
    v75 = [NSNumber numberWithBool:v74 & 1];
  }
  else
  {
    v75 = 0;
  }
  v76 = (NSNumber *)[v75 copy];
  hasHDR = self->_hasHDR;
  self->_hasHDR = v76;

  v78 = &v112;
  if (!v66) {
    goto LABEL_59;
  }
  uint64_t v112 = 0;
  v113 = &v112;
  uint64_t v114 = 0x2020000000;
  v79 = (id *)getMPStoreItemMetadataItemKindMusicVideoSymbolLoc_ptr;
  uint64_t v115 = getMPStoreItemMetadataItemKindMusicVideoSymbolLoc_ptr;
  if (!getMPStoreItemMetadataItemKindMusicVideoSymbolLoc_ptr)
  {
    v80 = (void *)MediaPlayerLibrary_3();
    v113[3] = (uint64_t)dlsym(v80, "MPStoreItemMetadataItemKindMusicVideo");
    getMPStoreItemMetadataItemKindMusicVideoSymbolLoc_ptr = v113[3];
    v79 = (id *)v113[3];
  }
  _Block_object_dispose(&v112, 8);
  if (!v79)
  {
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
LABEL_59:
    uint64_t v112 = 0;
    v113 = v78;
    uint64_t v114 = 0x2020000000;
    v79 = (id *)getMPStoreItemMetadataItemKindSongSymbolLoc_ptr;
    uint64_t v115 = getMPStoreItemMetadataItemKindSongSymbolLoc_ptr;
    if (!getMPStoreItemMetadataItemKindSongSymbolLoc_ptr)
    {
      v111 = v78;
      v81 = (void *)MediaPlayerLibrary_3();
      *(void *)(v111[1] + 24) = dlsym(v81, "MPStoreItemMetadataItemKindSong");
      getMPStoreItemMetadataItemKindSongSymbolLoc_ptr = *(void *)(v111[1] + 24);
      v79 = (id *)v113[3];
    }
    _Block_object_dispose(&v112, 8);
    if (!v79)
    {
      v88 = (_Unwind_Exception *)+[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
      _Block_object_dispose(&v112, 8);
      _Unwind_Resume(v88);
    }
  }
  id v82 = *v79;
  if (v108)
  {
    id v83 = v109;
  }
  else
  {
    id v83 = [(MusicKit_SoftLinking_CatalogID *)v110 value];
  }
  v84 = v83;
  id v85 = 0;
  if (v82)
  {
    if (v83)
    {
      id v85 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [v85 setObject:v82 forKey:@"kind"];
      [v85 setObject:v84 forKey:@"id"];
      if (v108) {
        [v85 setObject:MEMORY[0x263EFFA88] forKey:@"isLibrary"];
      }
    }
  }
  v86 = (NSDictionary *)[v85 copy];
  playParametersDictionary = self->_playParametersDictionary;
  self->_playParametersDictionary = v86;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  if (self->_identifier) {
    [v6 appendFormat:@"; identifier = \"%@\"", self->_identifier];
  }
  if (self->_title) {
    [v6 appendFormat:@"; title = \"%@\"", self->_title];
  }
  if (self->_subtitle) {
    [v6 appendFormat:@"; subtitle = \"%@\"", self->_subtitle];
  }
  if (self->_artworkCatalog) {
    [v6 appendFormat:@"; artworkCatalog = %@", self->_artworkCatalog];
  }
  if (self->_underlyingItemCatalogID) {
    [v6 appendFormat:@"; underlyingItemCatalogID = %@", self->_underlyingItemCatalogID];
  }
  if (self->_underlyingItemLibraryID) {
    [v6 appendFormat:@"; underlyingItemLibraryID = \"%@\"", self->_underlyingItemLibraryID];
  }
  if (self->_albumTitle) {
    [v6 appendFormat:@"; albumTitle = \"%@\"", self->_albumTitle];
  }
  if (self->_artistName) {
    [v6 appendFormat:@"; artistName = \"%@\"", self->_artistName];
  }
  if (self->_genreIdentifier) {
    [v6 appendFormat:@"; genreIdentifier = \"%@\"", self->_genreIdentifier];
  }
  if (self->_genreName) {
    [v6 appendFormat:@"; genreName = \"%@\"", self->_genreName];
  }
  if (self->_duration) {
    [v6 appendFormat:@"; duration = \"%@\"", self->_duration];
  }
  if (self->_trackNumber) {
    [v6 appendFormat:@"; trackNumber = %@", self->_trackNumber];
  }
  if (self->_discNumber) {
    [v6 appendFormat:@"; discNumber = %@", self->_discNumber];
  }
  if (self->_releaseDate) {
    [v6 appendFormat:@"; releaseDate = %@", self->_releaseDate];
  }
  if (self->_isExplicit) {
    [v6 appendString:@"; isExplicit = YES"];
  }
  if (self->_isMusicVideo)
  {
    [v6 appendString:@"; isMusicVideo = YES"];
    has4K = self->_has4K;
    if (has4K)
    {
      if ([(NSNumber *)has4K BOOLValue]) {
        uint64_t v8 = @"YES";
      }
      else {
        uint64_t v8 = @"NO";
      }
      [v6 appendFormat:@"; has4K = %@", v8];
    }
    hasHDR = self->_hasHDR;
    if (hasHDR)
    {
      if ([(NSNumber *)hasHDR BOOLValue]) {
        id v10 = @"YES";
      }
      else {
        id v10 = @"NO";
      }
      [v6 appendFormat:@"; hasHDR = %@", v10];
    }
  }
  [v6 appendString:@">"];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (MusicKit_SoftLinking_MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (MusicKit_SoftLinking_CatalogID)underlyingItemCatalogID
{
  return self->_underlyingItemCatalogID;
}

- (NSString)underlyingItemLibraryID
{
  return self->_underlyingItemLibraryID;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSString)genreIdentifier
{
  return self->_genreIdentifier;
}

- (NSString)genreName
{
  return self->_genreName;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (NSNumber)trackNumber
{
  return self->_trackNumber;
}

- (NSNumber)discNumber
{
  return self->_discNumber;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (BOOL)isMusicVideo
{
  return self->_isMusicVideo;
}

- (NSNumber)has4K
{
  return self->_has4K;
}

- (NSNumber)hasHDR
{
  return self->_hasHDR;
}

- (NSDictionary)playParametersDictionary
{
  return self->_playParametersDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playParametersDictionary, 0);
  objc_storeStrong((id *)&self->_hasHDR, 0);
  objc_storeStrong((id *)&self->_has4K, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_discNumber, 0);
  objc_storeStrong((id *)&self->_trackNumber, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_genreName, 0);
  objc_storeStrong((id *)&self->_genreIdentifier, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_underlyingItemLibraryID, 0);
  objc_storeStrong((id *)&self->_underlyingItemCatalogID, 0);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end