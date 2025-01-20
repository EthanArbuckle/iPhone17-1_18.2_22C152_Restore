@interface LPAppleTVMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPAppleTVMetadata)initWithCoder:(id)a3;
- (LPImage)artwork;
- (NSString)subtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation LPAppleTVMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPAppleTVMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LPAppleTVMetadata;
  v5 = [(LPAppleTVMetadata *)&v14 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"title");
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"subtitle");
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"artwork");
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, @"title");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_subtitle, @"subtitle");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, @"artwork");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPAppleTVMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPAppleTVMetadata *)self title];
    [(LPAppleTVMetadata *)v4 setTitle:v5];

    uint64_t v6 = [(LPAppleTVMetadata *)self subtitle];
    [(LPAppleTVMetadata *)v4 setSubtitle:v6];

    v7 = [(LPAppleTVMetadata *)self artwork];
    [(LPAppleTVMetadata *)v4 setArtwork:v7];

    uint64_t v8 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPAppleTVMetadata;
  if ([(LPAppleTVMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_title) & 1) != 0 && objectsAreEqual_0(v6[3], self->_subtitle)) {
        char v5 = objectsAreEqual_0(v6[4], self->_artwork);
      }
      else {
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
  return [(NSString *)self->_title hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"title", @"subtitle", @"artwork", 0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (LPImage)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 unspecializedPresentationPropertiesForStyle:34];
  v7 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v6 setCaptionBar:v7];

  objc_super v8 = [(LPAppleTVMetadata *)self artwork];
  v9 = v8;
  if (!v8)
  {
    v3 = [v5 metadata];
    v9 = [v3 image];
  }
  [v5 _populateProperties:v6 withPrimaryImage:v9];
  if (!v8)
  {
  }
  uint64_t v10 = [(LPAppleTVMetadata *)self title];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    v13 = [v5 metadata];
    id v12 = [v13 title];
  }
  objc_super v14 = [(LPAppleTVMetadata *)self subtitle];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    v17 = [v5 metadata];
    v18 = [v17 appleSummary];
    v19 = v18;
    if (v18)
    {
      id v16 = v18;
    }
    else
    {
      v20 = [v5 metadata];
      id v16 = [v20 summary];
    }
  }

  v21 = LPLocalizedString(@" tv");
  uint64_t v22 = objc_msgSend(v5, "_rowConfigurationForStyle:", objc_msgSend(v6, "style"));
  if ((unint64_t)(v22 - 2) < 2)
  {
    v30 = [v6 captionBar];
    v31 = [v30 top];
    v32 = [v31 leading];
    [v32 setText:v12];

    v33 = [v6 captionBar];
    v34 = [v33 bottom];
    v35 = [v34 leading];
    [v35 setText:v16];

    v27 = [v6 captionBar];
    v28 = [v27 belowBottom];
    v29 = [v28 leading];
    [v29 setText:v21];
  }
  else if (v22)
  {
    if (v22 != 1) {
      goto LABEL_24;
    }
    v23 = [v6 captionBar];
    v24 = [v23 top];
    v25 = [v24 leading];
    [v25 setText:v12];

    if (v16) {
      id v26 = v16;
    }
    else {
      id v26 = v21;
    }
    v27 = [v6 captionBar];
    v28 = [v27 bottom];
    v29 = [v28 leading];
    [v29 setText:v26];
  }
  else
  {
    v27 = [v6 captionBar];
    v28 = [v27 top];
    v29 = [v28 leading];
    [v29 setText:v12];
  }

LABEL_24:

  return v6;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[LPPresentationSpecializations isAppleTVURL:v3]
    || +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:v3];

  return v4;
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v5 = a3;
  uint64_t v6 = NSString;
  v7 = LPLocalizedString(@" tv: %@");
  objc_super v8 = [(LPAppleTVMetadata *)self title];
  v9 = v8;
  if (!v8)
  {
    id v3 = [v5 metadata];
    v9 = [v3 title];
  }
  uint64_t v10 = objc_msgSend(v6, "stringWithFormat:", v7, v9);
  if (!v8)
  {
  }

  return v10;
}

- (id)previewImageForTransformer:(id)a3
{
  id v4 = a3;
  id v5 = [(LPAppleTVMetadata *)self artwork];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    objc_super v8 = [v4 metadata];
    id v7 = [v8 image];
  }

  return v7;
}

@end