@interface LPiTunesMediaSongMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
+ (id)statusForText:(id)a3;
+ (id)transcriptBoldTextFont;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPArtworkMetadata)artworkMetadata;
- (LPImage)artwork;
- (LPLyricExcerptMetadata)lyricExcerpt;
- (LPiTunesMediaSongMetadata)initWithCoder:(id)a3;
- (NSArray)offers;
- (NSString)album;
- (NSString)artist;
- (NSString)lyrics;
- (NSString)name;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (NSURL)previewURL;
- (id)actionURLForTransformer:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)inlinePlaybackInformationForURL:(id)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (id)sourceApplicationMetadataForTransformer:(id)a3;
- (id)statusForTransformer:(id)a3;
- (id)storeIdentifierForTransformer:(id)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)destroyForTransformer:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)initializeForTransformer:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setArtworkMetadata:(id)a3;
- (void)setLyricExcerpt:(id)a3;
- (void)setLyrics:(id)a3;
- (void)setName:(id)a3;
- (void)setOffers:(id)a3;
- (void)setPreviewURL:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation LPiTunesMediaSongMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaSongMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)LPiTunesMediaSongMetadata;
  v5 = [(LPiTunesMediaSongMetadata *)&v30 init];
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

    uint64_t v12 = decodeStringForKey(v4, @"artist");
    artist = v5->_artist;
    v5->_artist = (NSString *)v12;

    uint64_t v14 = decodeStringForKey(v4, @"album");
    album = v5->_album;
    v5->_album = (NSString *)v14;

    uint64_t v16 = decodeStringForKey(v4, @"lyrics");
    lyrics = v5->_lyrics;
    v5->_lyrics = (NSString *)v16;

    uint64_t v18 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"artwork");
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v18;

    uint64_t v20 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"artworkMetadata");
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (LPArtworkMetadata *)v20;

    uint64_t v22 = decodeURLForKey(v4, @"previewURL");
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v22;

    uint64_t v24 = decodeArrayOfStringsForKey(v4);
    offers = v5->_offers;
    v5->_offers = (NSArray *)v24;

    uint64_t v26 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"lyricExcerpt");
    lyricExcerpt = v5->_lyricExcerpt;
    v5->_lyricExcerpt = (LPLyricExcerptMetadata *)v26;

    v28 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeFrontIdentifier, @"storeFrontIdentifier");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeIdentifier, @"storeIdentifier");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_name, @"name");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_artist, @"artist");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_album, @"album");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_lyrics, @"lyrics");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, @"artwork");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, @"artworkMetadata");
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_previewURL, @"previewURL");
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_offers, @"offers");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_lyricExcerpt, @"lyricExcerpt");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPiTunesMediaSongMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPiTunesMediaSongMetadata *)self storeFrontIdentifier];
    [(LPiTunesMediaSongMetadata *)v4 setStoreFrontIdentifier:v5];

    uint64_t v6 = [(LPiTunesMediaSongMetadata *)self storeIdentifier];
    [(LPiTunesMediaSongMetadata *)v4 setStoreIdentifier:v6];

    v7 = [(LPiTunesMediaSongMetadata *)self name];
    [(LPiTunesMediaSongMetadata *)v4 setName:v7];

    uint64_t v8 = [(LPiTunesMediaSongMetadata *)self artist];
    [(LPiTunesMediaSongMetadata *)v4 setArtist:v8];

    v9 = [(LPiTunesMediaSongMetadata *)self album];
    [(LPiTunesMediaSongMetadata *)v4 setAlbum:v9];

    uint64_t v10 = [(LPiTunesMediaSongMetadata *)self artwork];
    [(LPiTunesMediaSongMetadata *)v4 setArtwork:v10];

    v11 = [(LPiTunesMediaSongMetadata *)self artworkMetadata];
    [(LPiTunesMediaSongMetadata *)v4 setArtworkMetadata:v11];

    uint64_t v12 = [(LPiTunesMediaSongMetadata *)self previewURL];
    [(LPiTunesMediaSongMetadata *)v4 setPreviewURL:v12];

    v13 = [(LPiTunesMediaSongMetadata *)self offers];
    [(LPiTunesMediaSongMetadata *)v4 setOffers:v13];

    uint64_t v14 = [(LPiTunesMediaSongMetadata *)self lyricExcerpt];
    [(LPiTunesMediaSongMetadata *)v4 setLyricExcerpt:v14];

    v15 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiTunesMediaSongMetadata;
  if ([(LPiTunesMediaSongMetadata *)&v8 isEqual:v4])
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
        && objectsAreEqual_0(v6[5], self->_artist)
        && objectsAreEqual_0(v6[6], self->_album)
        && objectsAreEqual_0(v6[8], self->_artwork)
        && objectsAreEqual_0(v6[9], self->_artworkMetadata)
        && objectsAreEqual_0(v6[10], self->_previewURL)
        && objectsAreEqual_0(v6[11], self->_offers))
      {
        char v5 = objectsAreEqual_0(v6[12], self->_lyricExcerpt);
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
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeFrontIdentifier", @"storeIdentifier", @"name", @"artist", @"album", @"artwork", @"artworkMetadata", @"previewURL", @"offers", @"lyricExcerpt", 0);
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

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
}

- (NSString)lyrics
{
  return self->_lyrics;
}

- (void)setLyrics:(id)a3
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

- (NSArray)offers
{
  return self->_offers;
}

- (void)setOffers:(id)a3
{
}

- (LPLyricExcerptMetadata)lyricExcerpt
{
  return self->_lyricExcerpt;
}

- (void)setLyricExcerpt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricExcerpt, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_lyrics, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

- (id)inlinePlaybackInformationForURL:(id)a3
{
  id v4 = a3;
  char v5 = [(LPiTunesMediaSongMetadata *)self storeIdentifier];
  uint64_t v6 = [(LPiTunesMediaSongMetadata *)self storeFrontIdentifier];
  v7 = v6;
  if (!v6)
  {
    v7 = storefrontIdentifierFromURL(v4);
  }
  objc_super v8 = [(LPiTunesMediaSongMetadata *)self offers];
  v9 = [(LPiTunesMediaSongMetadata *)self previewURL];
  uint64_t v10 = [(LPiTunesMediaSongMetadata *)self lyricExcerpt];
  v11 = +[LPInlineMediaPlaybackInformation songPlaybackInformationWithStoreIdentifier:v5 storefrontIdentifier:v7 offers:v8 previewURL:v9 lyricExcerpt:v10];

  if (!v6) {

  }
  return v11;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  char v5 = [(LPiTunesMediaSongMetadata *)self lyricExcerpt];
  if (v5 && [v4 _rowConfigurationForStyle:5] == 3)
  {
    int v6 = sizeClassAllowsMedia([v4 effectiveSizeClass]);

    if (v6) {
      uint64_t v7 = 42;
    }
    else {
      uint64_t v7 = 5;
    }
  }
  else
  {

    int v6 = 0;
    uint64_t v7 = 5;
  }
  objc_super v8 = [v4 commonPresentationPropertiesForStyle:v7];
  v9 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v8 setCaptionBar:v9];

  uint64_t v10 = [(LPiTunesMediaSongMetadata *)self name];
  v11 = [(LPiTunesMediaSongMetadata *)self artist];
  uint64_t v12 = appleMusicWordmark(v4);
  populateCaptionBar(v8, v10, v11, v12, 1, v4);

  v13 = [(LPiTunesMediaSongMetadata *)self artwork];
  [v4 _populateProperties:v8 withPrimaryImage:v13];

  uint64_t v14 = [v4 canonicalURL];
  v15 = [(LPiTunesMediaSongMetadata *)self inlinePlaybackInformationForURL:v14];
  [v8 setInlinePlaybackInformation:v15];

  if (v6)
  {
    uint64_t v16 = [(LPiTunesMediaSongMetadata *)self lyricExcerpt];
    v17 = [v16 lyrics];
    [v8 setQuotedText:v17];

    uint64_t v18 = [(LPiTunesMediaSongMetadata *)self artwork];
    v19 = lyricBackgroundImage(v18);
    [v8 setBackgroundImage:v19];

    uint64_t v20 = [v8 captionBar];
    [v20 setLeadingIcon:0];

    [v8 setImage:0];
    v21 = objc_alloc_init(LPCaptionBarPresentationProperties);
    [v8 setMediaBottomCaptionBar:v21];

    if ([v4 allowsPlaybackControls])
    {
      id v22 = objc_alloc_init(MEMORY[0x1E4F28C00]);
      [v22 setUnitsStyle:0];
      [v22 setAllowedUnits:192];
      [v22 setZeroFormattingBehavior:0];
      v34 = [(LPiTunesMediaSongMetadata *)self lyricExcerpt];
      v23 = [v34 endTime];
      [v23 doubleValue];
      double v25 = v24;
      uint64_t v26 = [(LPiTunesMediaSongMetadata *)self lyricExcerpt];
      v27 = [v26 startTime];
      [v27 doubleValue];
      v29 = [v22 stringFromTimeInterval:v25 - v28];
      objc_super v30 = [v8 mediaBottomCaptionBar];
      v31 = [v30 top];
      v32 = [v31 trailing];
      [v32 setText:v29];
    }
  }

  return v8;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = [(LPiTunesMediaSongMetadata *)self lyricExcerpt];

  char v5 = NSString;
  if (v4) {
    LPLocalizedString(@"Lyrics: %@ – %@");
  }
  else {
  int v6 = LPLocalizedString(@"Song: %@ – %@");
  }
  uint64_t v7 = [(LPiTunesMediaSongMetadata *)self name];
  objc_super v8 = [(LPiTunesMediaSongMetadata *)self artist];
  v9 = objc_msgSend(v5, "stringWithFormat:", v6, v7, v8);

  return v9;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v10 = a3;
  id v4 = [(LPiTunesMediaSongMetadata *)self name];
  char v5 = [(LPiTunesMediaSongMetadata *)self artist];
  int v6 = joinedByEmDash(v4, v5);
  [v10 setTitle:v6];

  uint64_t v7 = [(LPiTunesMediaSongMetadata *)self artwork];
  [v10 setIcon:v7];

  objc_super v8 = [(LPiTunesMediaSongMetadata *)self lyricExcerpt];
  v9 = [v8 lyrics];
  [v10 setSelectedText:v9];
}

- (id)storeIdentifierForTransformer:(id)a3
{
  v3 = [(LPiTunesMediaSongMetadata *)self storeIdentifier];

  return v3;
}

- (id)sourceApplicationMetadataForTransformer:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(LPSourceApplicationMetadata);
  [v3 scaleFactor];
  double v6 = v5;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:@"com.apple.Music"];
  objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", 16.0, 16.0, v6);
  [v8 setShouldApplyMask:0];
  v9 = [v7 prepareImageForDescriptor:v8];
  id v10 = -[LPImage _initWithCGImage:]([LPImage alloc], "_initWithCGImage:", [v9 CGImage]);

  [(LPSourceApplicationMetadata *)v4 setIcon:v10];

  return v4;
}

- (void)initializeForTransformer:(id)a3
{
  id v3 = a3;
  objc_initWeak(&location, v3);
  id v4 = +[LPiTunesStoreInformation shared];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__LPiTunesMediaSongMetadata_Transformer__initializeForTransformer___block_invoke;
  v5[3] = &unk_1E5B055A0;
  objc_copyWeak(&v6, &location);
  [v4 registerForStoreAvailablityChangesWithToken:v3 handler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __67__LPiTunesMediaSongMetadata_Transformer__initializeForTransformer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained delegate];

    id WeakRetained = v4;
    if (v2)
    {
      id v3 = [v4 delegate];
      [v3 statusTransformerDidUpdate:v4];

      id WeakRetained = v4;
    }
  }
}

- (void)destroyForTransformer:(id)a3
{
  id v4 = +[LPiTunesStoreInformation shared];
  [v4 unregisterForStoreAvailablityChangesWithToken:self];
}

+ (id)transcriptBoldTextFont
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v3 = [v2 preferredContentSizeCategory];

  if ((void *)transcriptBoldTextFont_contentSizeCategory != v3)
  {
    uint64_t v4 = emphasizedPreferredFontForTextStyle(*MEMORY[0x1E4FB28E0]);
    double v5 = (void *)transcriptBoldTextFont_font;
    transcriptBoldTextFont_font = v4;

    objc_storeStrong((id *)&transcriptBoldTextFont_contentSizeCategory, v3);
  }
  id v6 = (id)transcriptBoldTextFont_font;

  return v6;
}

+ (id)statusForText:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4FB12B0];
  uint64_t v4 = v24;
  double v5 = [(id)objc_opt_class() transcriptBoldTextFont];
  v26[0] = v5;
  uint64_t v25 = *MEMORY[0x1E4FB12B8];
  uint64_t v6 = v25;
  uint64_t v7 = [MEMORY[0x1E4FB1618] systemGrayColor];
  v26[1] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v24 count:2];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v3 attributes:v8];
  v22[0] = v4;
  id v10 = [(id)objc_opt_class() transcriptBoldTextFont];
  v22[1] = v6;
  v23[0] = v10;
  v11 = [MEMORY[0x1E4FB1618] systemPinkColor];
  v23[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  v13 = [v9 string];
  uint64_t v14 = [v13 rangeOfString:@"<link>"];
  uint64_t v16 = v15;

  objc_msgSend(v9, "replaceCharactersInRange:withString:", v14, v16, &stru_1EF6D6D90);
  v17 = [v9 string];
  uint64_t v18 = [v17 rangeOfString:@"</link>"];
  uint64_t v20 = v19;

  objc_msgSend(v9, "replaceCharactersInRange:withString:", v18, v20, &stru_1EF6D6D90);
  objc_msgSend(v9, "addAttributes:range:", v12, v14, v18 - v14);

  return v9;
}

- (id)statusForTransformer:(id)a3
{
  uint64_t v4 = [a3 canonicalURL];
  double v5 = [(LPiTunesMediaSongMetadata *)self inlinePlaybackInformationForURL:v4];

  uint64_t v6 = +[LPiTunesStoreInformation shared];
  uint64_t v7 = [v5 storefrontIdentifier];
  uint64_t v8 = [v6 userStateForMediaStorefrontIdentifier:v7];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 0) {
    goto LABEL_8;
  }
  unint64_t v9 = [v5 availability];
  if (v9 >= 2)
  {
    if (v9 == 2)
    {
      id v10 = LPLocalizedString(@"Buy Song on <link>iTunes</link>");
      uint64_t v11 = +[LPiTunesMediaSongMetadata statusForText:v10];
      goto LABEL_7;
    }
LABEL_8:
    uint64_t v12 = 0;
    goto LABEL_11;
  }
  id v10 = subscribeToAppleMusicStatus(v8);
  if (!v10)
  {
    uint64_t v12 = 0;
    goto LABEL_10;
  }
  uint64_t v11 = +[LPiTunesMediaSongMetadata statusForText:v10];
LABEL_7:
  uint64_t v12 = (void *)v11;
LABEL_10:

LABEL_11:

  return v12;
}

- (id)actionURLForTransformer:(id)a3
{
  id v4 = a3;
  double v5 = [v4 canonicalURL];
  uint64_t v6 = [(LPiTunesMediaSongMetadata *)self inlinePlaybackInformationForURL:v5];

  uint64_t v7 = +[LPiTunesStoreInformation shared];
  uint64_t v8 = [v6 storefrontIdentifier];
  uint64_t v9 = [v7 userStateForMediaStorefrontIdentifier:v8];

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    unint64_t v10 = [v6 availability];
    if (v10 >= 2)
    {
      if (v10 == 2)
      {
        uint64_t v11 = [v4 canonicalURL];
        uint64_t v12 = replaceScheme(v11, @"itms");
        goto LABEL_7;
      }
    }
    else if (v9 != 1)
    {
      uint64_t v11 = [v4 canonicalURL];
      uint64_t v12 = replaceScheme(v11, @"music");
LABEL_7:
      v13 = (void *)v12;

      goto LABEL_9;
    }
  }
  v13 = 0;
LABEL_9:

  return v13;
}

@end