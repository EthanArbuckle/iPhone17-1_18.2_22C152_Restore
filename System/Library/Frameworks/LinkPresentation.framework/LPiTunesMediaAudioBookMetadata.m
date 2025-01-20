@interface LPiTunesMediaAudioBookMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPArtworkMetadata)artworkMetadata;
- (LPImage)artwork;
- (LPiTunesMediaAudioBookMetadata)initWithCoder:(id)a3;
- (NSString)author;
- (NSString)name;
- (NSString)narrator;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (NSURL)previewURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (id)storeIdentifierForTransformer:(id)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setArtworkMetadata:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setName:(id)a3;
- (void)setNarrator:(id)a3;
- (void)setPreviewURL:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation LPiTunesMediaAudioBookMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaAudioBookMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)LPiTunesMediaAudioBookMetadata;
  v5 = [(LPiTunesMediaAudioBookMetadata *)&v24 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"storeFrontIdentifier");
    storeFrontIdentifier = v5->_storeFrontIdentifier;
    v5->_storeFrontIdentifier = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"storeIdentifier");
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"name");
    name = v5->_name;
    v5->_name = (NSString *)v10;

    uint64_t v12 = decodeStringForKey(v4, @"author");
    author = v5->_author;
    v5->_author = (NSString *)v12;

    uint64_t v14 = decodeStringForKey(v4, @"narrator");
    narrator = v5->_narrator;
    v5->_narrator = (NSString *)v14;

    uint64_t v16 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"artwork");
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v16;

    uint64_t v18 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"artworkMetadata");
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (LPArtworkMetadata *)v18;

    uint64_t v20 = decodeURLForKey(v4, @"previewURL");
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v20;

    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeFrontIdentifier, @"storeFrontIdentifier");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeIdentifier, @"storeIdentifier");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_name, @"name");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_author, @"author");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_narrator, @"narrator");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, @"artwork");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, @"artworkMetadata");
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_previewURL, @"previewURL");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPiTunesMediaAudioBookMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPiTunesMediaAudioBookMetadata *)self storeFrontIdentifier];
    [(LPiTunesMediaAudioBookMetadata *)v4 setStoreFrontIdentifier:v5];

    uint64_t v6 = [(LPiTunesMediaAudioBookMetadata *)self storeIdentifier];
    [(LPiTunesMediaAudioBookMetadata *)v4 setStoreIdentifier:v6];

    v7 = [(LPiTunesMediaAudioBookMetadata *)self name];
    [(LPiTunesMediaAudioBookMetadata *)v4 setName:v7];

    uint64_t v8 = [(LPiTunesMediaAudioBookMetadata *)self author];
    [(LPiTunesMediaAudioBookMetadata *)v4 setAuthor:v8];

    v9 = [(LPiTunesMediaAudioBookMetadata *)self narrator];
    [(LPiTunesMediaAudioBookMetadata *)v4 setNarrator:v9];

    uint64_t v10 = [(LPiTunesMediaAudioBookMetadata *)self previewURL];
    [(LPiTunesMediaAudioBookMetadata *)v4 setPreviewURL:v10];

    v11 = [(LPiTunesMediaAudioBookMetadata *)self artwork];
    [(LPiTunesMediaAudioBookMetadata *)v4 setArtwork:v11];

    uint64_t v12 = [(LPiTunesMediaAudioBookMetadata *)self artworkMetadata];
    [(LPiTunesMediaAudioBookMetadata *)v4 setArtworkMetadata:v12];

    v13 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiTunesMediaAudioBookMetadata;
  if ([(LPiTunesMediaAudioBookMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_storeFrontIdentifier) & 1) != 0
        && objectsAreEqual_0(v6[3], self->_storeIdentifier)
        && objectsAreEqual_0(v6[4], self->_name)
        && objectsAreEqual_0(v6[5], self->_author)
        && objectsAreEqual_0(v6[6], self->_narrator)
        && objectsAreEqual_0(v6[7], self->_artwork)
        && objectsAreEqual_0(v6[8], self->_artworkMetadata))
      {
        char v5 = objectsAreEqual_0(v6[9], self->_previewURL);
      }
      else
      {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_storeIdentifier hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeFrontIdentifier", @"storeIdentifier", @"name", @"author", @"narrator", @"artwork", @"artworkMetadata", @"previewURL", 0);
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreFrontIdentifier:(id)a3
{
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)narrator
{
  return self->_narrator;
}

- (void)setNarrator:(id)a3
{
}

- (LPImage)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
}

- (LPArtworkMetadata)artworkMetadata
{
  return self->_artworkMetadata;
}

- (void)setArtworkMetadata:(id)a3
{
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (void)setPreviewURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_narrator, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 commonPresentationPropertiesForStyle:14];
  v7 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v6 setCaptionBar:v7];

  objc_super v8 = [(LPiTunesMediaAudioBookMetadata *)self name];
  v9 = [(LPiTunesMediaAudioBookMetadata *)self author];
  uint64_t v10 = LPLocalizedString(@" Books");
  populateCaptionBar(v6, v8, v9, v10, 1, v5);

  v11 = [(LPiTunesMediaAudioBookMetadata *)self artwork];
  [v5 _populateProperties:v6 withPrimaryImage:v11];

  uint64_t v12 = objc_alloc_init(LPImagePresentationProperties);
  [(LPImagePresentationProperties *)v12 setFilter:10];
  [v6 setImageProperties:v12];
  if (TCCAccessPreflight())
  {
    v13 = 0;
  }
  else
  {
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2050000000;
    uint64_t v14 = (void *)getMPMediaQueryClass_softClass;
    uint64_t v46 = getMPMediaQueryClass_softClass;
    if (!getMPMediaQueryClass_softClass)
    {
      uint64_t v38 = MEMORY[0x1E4F143A8];
      uint64_t v39 = 3221225472;
      v40 = __getMPMediaQueryClass_block_invoke;
      v41 = &unk_1E5B04EB8;
      v42 = &v43;
      __getMPMediaQueryClass_block_invoke((uint64_t)&v38);
      uint64_t v14 = (void *)v44[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v43, 8);
    uint64_t v16 = [v15 audiobooksQuery];
    v17 = (void *)MEMORY[0x1E4F28FE8];
    uint64_t v18 = [(LPiTunesMediaAudioBookMetadata *)self storeIdentifier];
    v19 = [v17 scannerWithString:v18];

    uint64_t v37 = 0;
    if ([v19 scanUnsignedLongLong:&v37])
    {
      uint64_t v43 = 0;
      v44 = &v43;
      uint64_t v45 = 0x2050000000;
      uint64_t v20 = (void *)getMPMediaPropertyPredicateClass_softClass;
      uint64_t v46 = getMPMediaPropertyPredicateClass_softClass;
      if (!getMPMediaPropertyPredicateClass_softClass)
      {
        uint64_t v38 = MEMORY[0x1E4F143A8];
        uint64_t v39 = 3221225472;
        v40 = __getMPMediaPropertyPredicateClass_block_invoke;
        v41 = &unk_1E5B04EB8;
        v42 = &v43;
        __getMPMediaPropertyPredicateClass_block_invoke((uint64_t)&v38);
        uint64_t v20 = (void *)v44[3];
      }
      id v21 = v20;
      _Block_object_dispose(&v43, 8);
      v22 = [NSNumber numberWithUnsignedLongLong:v37];
      uint64_t v43 = 0;
      v44 = &v43;
      uint64_t v45 = 0x2020000000;
      v23 = (void *)getMPMediaItemPropertyStorePlaylistIDSymbolLoc_ptr;
      uint64_t v46 = getMPMediaItemPropertyStorePlaylistIDSymbolLoc_ptr;
      if (!getMPMediaItemPropertyStorePlaylistIDSymbolLoc_ptr)
      {
        uint64_t v38 = MEMORY[0x1E4F143A8];
        uint64_t v39 = 3221225472;
        v40 = __getMPMediaItemPropertyStorePlaylistIDSymbolLoc_block_invoke;
        v41 = &unk_1E5B04EB8;
        v42 = &v43;
        objc_super v24 = MediaPlayerLibrary();
        v25 = dlsym(v24, "MPMediaItemPropertyStorePlaylistID");
        *(void *)(v42[1] + 24) = v25;
        getMPMediaItemPropertyStorePlaylistIDSymbolLoc_ptr = *(void *)(v42[1] + 24);
        v23 = (void *)v44[3];
      }
      _Block_object_dispose(&v43, 8);
      if (!v23)
      {
        v35 = [MEMORY[0x1E4F28B00] currentHandler];
        v36 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyStorePlaylistID(void)"];
        objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"LPiTunesMediaTransformers.m", 42, @"%s", dlerror());

        __break(1u);
        return result;
      }
      v26 = [v21 predicateWithValue:v22 forProperty:*v23];
      [v16 addFilterPredicate:v26];

      v27 = [v16 items];
      v3 = [v27 firstObject];

      if (v3)
      {
        v28 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "persistentID"));
        v13 = [v28 stringValue];
      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
  }
  v29 = [(LPiTunesMediaAudioBookMetadata *)self storeIdentifier];
  v30 = [(LPiTunesMediaAudioBookMetadata *)self storeFrontIdentifier];
  v31 = v30;
  if (!v30)
  {
    v3 = [v5 canonicalURL];
    v31 = storefrontIdentifierFromURL(v3);
  }
  v32 = [(LPiTunesMediaAudioBookMetadata *)self previewURL];
  v33 = +[LPInlineMediaPlaybackInformation audioBookPlaybackInformationWithStoreIdentifier:v29 storefrontIdentifier:v31 previewURL:v32 persistentIdentifier:v13];

  if (!v30)
  {
  }
  [v6 setInlinePlaybackInformation:v33];

  return v6;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = NSString;
  id v5 = LPLocalizedString(@"Audiobook: %@ – %@");
  uint64_t v6 = [(LPiTunesMediaAudioBookMetadata *)self name];
  v7 = [(LPiTunesMediaAudioBookMetadata *)self author];
  objc_super v8 = objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);

  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v8 = a3;
  id v4 = [(LPiTunesMediaAudioBookMetadata *)self name];
  id v5 = [(LPiTunesMediaAudioBookMetadata *)self author];
  uint64_t v6 = joinedByEmDash(v4, v5);
  [v8 setTitle:v6];

  v7 = [(LPiTunesMediaAudioBookMetadata *)self artwork];
  [v8 setImage:v7];
}

- (id)storeIdentifierForTransformer:(id)a3
{
  v3 = [(LPiTunesMediaAudioBookMetadata *)self storeIdentifier];

  return v3;
}

@end