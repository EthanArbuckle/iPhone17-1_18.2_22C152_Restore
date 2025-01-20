@interface LPiTunesMediaPlaylistMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
+ (id)transcriptBoldTextFont;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPArtworkMetadata)artworkMetadata;
- (LPImage)artwork;
- (LPiTunesMediaPlaylistMetadata)initWithCoder:(id)a3;
- (NSString)curator;
- (NSString)curatorHandle;
- (NSString)name;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (NSURL)curatorProfileURL;
- (id)_activeUserStateHandle;
- (id)actionURLForTransformer:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (id)statusForTransformer:(id)a3;
- (id)storeIdentifierForTransformer:(id)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setArtworkMetadata:(id)a3;
- (void)setCurator:(id)a3;
- (void)setCuratorHandle:(id)a3;
- (void)setCuratorProfileURL:(id)a3;
- (void)setName:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation LPiTunesMediaPlaylistMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaPlaylistMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)LPiTunesMediaPlaylistMetadata;
  v5 = [(LPiTunesMediaPlaylistMetadata *)&v24 init];
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

    uint64_t v12 = decodeStringForKey(v4, @"curator");
    curator = v5->_curator;
    v5->_curator = (NSString *)v12;

    uint64_t v14 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"curatorProfileURL");
    curatorProfileURL = v5->_curatorProfileURL;
    v5->_curatorProfileURL = (NSURL *)v14;

    uint64_t v16 = decodeStringForKey(v4, @"curatorHandle");
    curatorHandle = v5->_curatorHandle;
    v5->_curatorHandle = (NSString *)v16;

    uint64_t v18 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"artwork");
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v18;

    uint64_t v20 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"artworkMetadata");
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (LPArtworkMetadata *)v20;

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
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_curator, @"curator");
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_curatorProfileURL, @"curatorProfileURL");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_curatorHandle, @"curatorHandle");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, @"artwork");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, @"artworkMetadata");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPiTunesMediaPlaylistMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPiTunesMediaPlaylistMetadata *)self storeFrontIdentifier];
    [(LPiTunesMediaPlaylistMetadata *)v4 setStoreFrontIdentifier:v5];

    uint64_t v6 = [(LPiTunesMediaPlaylistMetadata *)self storeIdentifier];
    [(LPiTunesMediaPlaylistMetadata *)v4 setStoreIdentifier:v6];

    v7 = [(LPiTunesMediaPlaylistMetadata *)self name];
    [(LPiTunesMediaPlaylistMetadata *)v4 setName:v7];

    uint64_t v8 = [(LPiTunesMediaPlaylistMetadata *)self curator];
    [(LPiTunesMediaPlaylistMetadata *)v4 setCurator:v8];

    v9 = [(LPiTunesMediaPlaylistMetadata *)self curatorProfileURL];
    [(LPiTunesMediaPlaylistMetadata *)v4 setCuratorProfileURL:v9];

    uint64_t v10 = [(LPiTunesMediaPlaylistMetadata *)self curatorHandle];
    [(LPiTunesMediaPlaylistMetadata *)v4 setCuratorHandle:v10];

    v11 = [(LPiTunesMediaPlaylistMetadata *)self artwork];
    [(LPiTunesMediaPlaylistMetadata *)v4 setArtwork:v11];

    uint64_t v12 = [(LPiTunesMediaPlaylistMetadata *)self artworkMetadata];
    [(LPiTunesMediaPlaylistMetadata *)v4 setArtworkMetadata:v12];

    v13 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiTunesMediaPlaylistMetadata;
  if ([(LPiTunesMediaPlaylistMetadata *)&v8 isEqual:v4])
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
        && objectsAreEqual_0(v6[5], self->_curator)
        && objectsAreEqual_0(v6[8], self->_artwork)
        && objectsAreEqual_0(v6[9], self->_artworkMetadata)
        && objectsAreEqual_0(v6[6], self->_curatorProfileURL))
      {
        char v5 = objectsAreEqual_0(v6[7], self->_curatorProfileURL);
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
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeFrontIdentifier", @"storeIdentifier", @"name", @"curator", @"curatorProfileURL", @"curatorHandle", @"artwork", @"artworkMetadata", 0);
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

- (NSString)curator
{
  return self->_curator;
}

- (void)setCurator:(id)a3
{
}

- (NSURL)curatorProfileURL
{
  return self->_curatorProfileURL;
}

- (void)setCuratorProfileURL:(id)a3
{
}

- (NSString)curatorHandle
{
  return self->_curatorHandle;
}

- (void)setCuratorHandle:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_curatorHandle, 0);
  objc_storeStrong((id *)&self->_curatorProfileURL, 0);
  objc_storeStrong((id *)&self->_curator, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 URL];
  uint64_t v6 = objc_msgSend(v5, "_lp_valueForQueryKey:", @"a");
  int v7 = objc_msgSend(v6, "_lp_isEqualIgnoringCase:", @"join");

  if (v7) {
    uint64_t v8 = 56;
  }
  else {
    uint64_t v8 = 9;
  }
  v9 = [v4 commonPresentationPropertiesForStyle:v8];
  uint64_t v10 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v9 setCaptionBar:v10];

  v11 = [(LPiTunesMediaPlaylistMetadata *)self name];
  uint64_t v12 = [(LPiTunesMediaPlaylistMetadata *)self curator];
  v13 = appleMusicWordmark(v4);
  populateCaptionBar(v9, v11, v12, v13, 1, v4);

  uint64_t v14 = [(LPiTunesMediaPlaylistMetadata *)self artwork];
  [v4 _populateProperties:v9 withPrimaryImage:v14];

  if (v7)
  {
    if (sizeClassAllowsAppleMusicCollaborationFooter([v4 effectiveSizeClass]))
    {
      if ([v4 isInComposeContext])
      {
        v15 = objc_alloc_init(LPCollaborationFooterPresentationProperties);
        uint64_t v16 = (void *)MEMORY[0x1E4FB1830];
        v17 = [MEMORY[0x1E4FB1618] labelColor];
        v38[0] = v17;
        uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
        v19 = [v16 configurationWithPaletteColors:v18];

        uint64_t v20 = objc_msgSend(MEMORY[0x1E4FB1818], "_lp_systemImageNamed:", @"person.2.fill");
        v21 = objc_msgSend(v20, "_lp_imageByApplyingSymbolConfiguration:", v19);
        [(LPCollaborationFooterPresentationProperties *)v15 setGlyphAttachmentImage:v21];

        v22 = LPLocalizedString(@"Collaborate");
        [(LPCollaborationFooterPresentationProperties *)v15 setTitle:v22];

        v23 = LPLocalizedString(@"Anyone with the link will be able to add, delete, and reorder songs.");
        [(LPCollaborationFooterPresentationProperties *)v15 setSubtitle:v23];

        objc_super v24 = [v9 captionBar];
        [v24 setCollaborationFooter:v15];
      }
      else
      {
        v30 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28D8] scale:2];
        v31 = +[LPImage _systemImageNamed:@"person.2.fill" withSymbolConfiguration:v30];
        v32 = objc_alloc_init(LPCaptionButtonPresentationProperties);
        v33 = LPLocalizedString(@"Join Playlist");
        v34 = +[LPButtonAction actionWithTitle:v33 image:v31 handler:0];
        v37 = v34;
        v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
        [(LPCaptionButtonPresentationProperties *)v32 setActions:v35];

        [(LPCaptionButtonPresentationProperties *)v32 setShape:2];
        v36 = [v9 captionBar];
        [v36 setButton:v32];
      }
    }
  }
  else
  {
    v25 = [(LPiTunesMediaPlaylistMetadata *)self storeIdentifier];
    v26 = [(LPiTunesMediaPlaylistMetadata *)self storeFrontIdentifier];
    v27 = v26;
    if (!v26)
    {
      uint64_t v12 = [v4 canonicalURL];
      v27 = storefrontIdentifierFromURL(v12);
    }
    v28 = +[LPInlineMediaPlaybackInformation playlistPlaybackInformationWithStoreIdentifier:v25 storefrontIdentifier:v27];
    if (!v26)
    {
    }
    [v9 setInlinePlaybackInformation:v28];
  }

  return v9;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = [(LPiTunesMediaPlaylistMetadata *)self curator];

  char v5 = NSString;
  if (v4)
  {
    uint64_t v6 = LPLocalizedString(@"Playlist: %@ – %@");
    int v7 = [(LPiTunesMediaPlaylistMetadata *)self name];
    uint64_t v8 = [(LPiTunesMediaPlaylistMetadata *)self curator];
    v9 = objc_msgSend(v5, "stringWithFormat:", v6, v7, v8);
  }
  else
  {
    uint64_t v6 = LPLocalizedString(@"Playlist: %@");
    int v7 = [(LPiTunesMediaPlaylistMetadata *)self name];
    v9 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  }

  return v9;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v8 = a3;
  id v4 = [(LPiTunesMediaPlaylistMetadata *)self name];
  char v5 = [(LPiTunesMediaPlaylistMetadata *)self curator];
  uint64_t v6 = joinedByEmDash(v4, v5);
  [v8 setTitle:v6];

  int v7 = [(LPiTunesMediaPlaylistMetadata *)self artwork];
  [v8 setImage:v7];
}

- (id)storeIdentifierForTransformer:(id)a3
{
  v3 = [(LPiTunesMediaPlaylistMetadata *)self storeIdentifier];

  return v3;
}

+ (id)transcriptBoldTextFont
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  v3 = [v2 preferredContentSizeCategory];

  if ((void *)transcriptBoldTextFont_contentSizeCategory_164 != v3)
  {
    uint64_t v4 = emphasizedPreferredFontForTextStyle(*MEMORY[0x1E4FB28E0]);
    char v5 = (void *)transcriptBoldTextFont_font_165;
    transcriptBoldTextFont_font_165 = v4;

    objc_storeStrong((id *)&transcriptBoldTextFont_contentSizeCategory_164, v3);
  }
  id v6 = (id)transcriptBoldTextFont_font_165;

  return v6;
}

- (id)_activeUserStateHandle
{
  v2 = [MEMORY[0x1E4FB8650] shared];
  v3 = [v2 activeUserState];

  if (v3)
  {
    uint64_t v4 = [v3 music];
    char v5 = [v4 userProfile];
    id v6 = [v5 handle];
  }
  else
  {
    int v7 = LPLogChannelUI();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A35DC000, v7, OS_LOG_TYPE_DEFAULT, "Failed to get active iTunes user state.", v9, 2u);
    }
    id v6 = 0;
  }

  return v6;
}

- (id)statusForTransformer:(id)a3
{
  v34[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[LPiTunesStoreInformation shared];
  char v5 = [(LPiTunesMediaPlaylistMetadata *)self storeFrontIdentifier];
  uint64_t v6 = [v4 userStateForMediaStorefrontIdentifier:v5];

  int v7 = subscribeToAppleMusicStatus(v6);
  if (v7)
  {
    id v8 = LPLogChannelUI();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A35DC000, v8, OS_LOG_TYPE_DEFAULT, "Failed to show playlist transformer status label; showing subscription status text instead.",
        buf,
        2u);
    }
    v9 = +[LPiTunesMediaSongMetadata statusForText:v7];
    goto LABEL_25;
  }
  if (!v6)
  {
    uint64_t v12 = LPLogChannelUI();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Failed to show playlist transformer status label; unknown iTunes Store user state.";
LABEL_18:
      _os_log_impl(&dword_1A35DC000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    }
LABEL_19:
    v9 = 0;
    goto LABEL_25;
  }
  uint64_t v10 = [(LPiTunesMediaPlaylistMetadata *)self curator];
  if (!v10) {
    goto LABEL_16;
  }
  v11 = [(LPiTunesMediaPlaylistMetadata *)self curatorProfileURL];
  if (!v11)
  {
    uint64_t v14 = [(LPiTunesMediaPlaylistMetadata *)self curatorHandle];

    if (v14) {
      goto LABEL_12;
    }
LABEL_16:
    uint64_t v12 = LPLogChannelUI();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Failed to show playlist transformer status label; no curator name and/or no profile url or handle.";
      goto LABEL_18;
    }
    goto LABEL_19;
  }

LABEL_12:
  v15 = [(LPiTunesMediaPlaylistMetadata *)self curatorHandle];
  if (v15)
  {
    uint64_t v16 = [(LPiTunesMediaPlaylistMetadata *)self _activeUserStateHandle];
    v17 = [(LPiTunesMediaPlaylistMetadata *)self curatorHandle];
    int v18 = [v16 isEqual:v17];

    if (v18)
    {
      uint64_t v12 = LPLogChannelUI();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Failed to show playlist transformer status label; user is sharing own playlist.";
        goto LABEL_18;
      }
      goto LABEL_19;
    }
  }
  v33[0] = *MEMORY[0x1E4FB12B0];
  v19 = [(id)objc_opt_class() transcriptBoldTextFont];
  v34[0] = v19;
  v33[1] = *MEMORY[0x1E4FB12B8];
  uint64_t v20 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v34[1] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

  id v22 = objc_alloc_init(MEMORY[0x1E4F28F38]);
  v23 = [(LPiTunesMediaPlaylistMetadata *)self curator];
  objc_super v24 = [v22 personNameComponentsFromString:v23];

  v25 = [v24 givenName];
  id v26 = objc_alloc(MEMORY[0x1E4F28E48]);
  v27 = NSString;
  v28 = LPLocalizedString(@"Follow %@ on Apple Music");
  v29 = v25;
  if (!v25)
  {
    v29 = [(LPiTunesMediaPlaylistMetadata *)self curator];
  }
  v30 = objc_msgSend(v27, "stringWithFormat:", v28, v29);
  v9 = (void *)[v26 initWithString:v30 attributes:v21];

  if (!v25) {
LABEL_25:
  }

  return v9;
}

- (id)actionURLForTransformer:(id)a3
{
  uint64_t v4 = [(LPiTunesMediaPlaylistMetadata *)self curatorProfileURL];

  if (v4)
  {
    char v5 = [(LPiTunesMediaPlaylistMetadata *)self curatorProfileURL];
  }
  else
  {
    uint64_t v6 = [(LPiTunesMediaPlaylistMetadata *)self curatorHandle];

    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F29088]);
      [v7 setScheme:@"https"];
      [v7 setHost:@"music.apple.com"];
      id v8 = NSString;
      v9 = [(LPiTunesMediaPlaylistMetadata *)self curatorHandle];
      uint64_t v10 = [v8 stringWithFormat:@"/profile/%@", v9];
      [v7 setPath:v10];

      char v5 = [v7 URL];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

@end