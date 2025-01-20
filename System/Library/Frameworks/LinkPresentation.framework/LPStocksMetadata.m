@interface LPStocksMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPImage)icon;
- (LPStocksMetadata)initWithCoder:(id)a3;
- (NSString)combinedTitle;
- (NSString)footnote;
- (NSString)subtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCombinedTitle:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setIcon:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation LPStocksMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPStocksMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)LPStocksMetadata;
  v5 = [(LPStocksMetadata *)&v18 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"combinedTitle");
    combinedTitle = v5->_combinedTitle;
    v5->_combinedTitle = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"title");
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"subtitle");
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    uint64_t v12 = decodeStringForKey(v4, @"footnote");
    footnote = v5->_footnote;
    v5->_footnote = (NSString *)v12;

    uint64_t v14 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"icon");
    icon = v5->_icon;
    v5->_icon = (LPImage *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_combinedTitle, @"combinedTitle");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, @"title");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_subtitle, @"subtitle");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_footnote, @"footnote");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"icon");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPStocksMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPStocksMetadata *)self combinedTitle];
    [(LPStocksMetadata *)v4 setCombinedTitle:v5];

    uint64_t v6 = [(LPStocksMetadata *)self title];
    [(LPStocksMetadata *)v4 setTitle:v6];

    v7 = [(LPStocksMetadata *)self subtitle];
    [(LPStocksMetadata *)v4 setSubtitle:v7];

    uint64_t v8 = [(LPStocksMetadata *)self footnote];
    [(LPStocksMetadata *)v4 setFootnote:v8];

    v9 = [(LPStocksMetadata *)self icon];
    [(LPStocksMetadata *)v4 setIcon:v9];

    uint64_t v10 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPStocksMetadata;
  if ([(LPStocksMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if ((objectsAreEqual_0(self->_combinedTitle, v6[2]) & 1) != 0
        && objectsAreEqual_0(self->_title, v6[3])
        && objectsAreEqual_0(self->_subtitle, v6[4])
        && objectsAreEqual_0(self->_footnote, v6[5]))
      {
        char v5 = objectsAreEqual_0(self->_icon, v6[6]);
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

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"combinedTitle", @"title", @"subtitle", @"footnote", @"icon", 0);
}

- (void)_enumerateAsynchronousFields:(id)a3
{
}

- (NSString)combinedTitle
{
  return self->_combinedTitle;
}

- (void)setCombinedTitle:(id)a3
{
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

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_combinedTitle, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  char v5 = [v4 commonPresentationPropertiesForStyle:51];
  uint64_t v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v5 setCaptionBar:v6];

  uint64_t v7 = objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v5, "style"));
  if ((unint64_t)(v7 - 2) < 2)
  {
    v17 = [(LPStocksMetadata *)self title];
    objc_super v18 = [v5 captionBar];
    v19 = [v18 top];
    v20 = [v19 leading];
    [v20 setText:v17];

    v21 = [(LPStocksMetadata *)self subtitle];
    v22 = [v5 captionBar];
    v23 = [v22 bottom];
    v24 = [v23 leading];
    [v24 setText:v21];

    uint64_t v12 = [(LPStocksMetadata *)self footnote];
    v13 = LPLocalizedString(v12);
    uint64_t v14 = [v5 captionBar];
    v15 = [v14 belowBottom];
    v16 = [v15 leading];
    [v16 setText:v13];
  }
  else
  {
    if (!v7)
    {
      uint64_t v12 = [(LPStocksMetadata *)self combinedTitle];
      v13 = [v5 captionBar];
      uint64_t v14 = [v13 top];
      v15 = [v14 leading];
      [v15 setText:v12];
      goto LABEL_8;
    }
    if (v7 != 1) {
      goto LABEL_9;
    }
    objc_super v8 = [(LPStocksMetadata *)self combinedTitle];
    v9 = [v5 captionBar];
    uint64_t v10 = [v9 top];
    v11 = [v10 leading];
    [v11 setText:v8];

    uint64_t v12 = [(LPStocksMetadata *)self footnote];
    v13 = LPLocalizedString(v12);
    uint64_t v14 = [v5 captionBar];
    v15 = [v14 bottom];
    v16 = [v15 leading];
    [v16 setText:v13];
  }

LABEL_8:
LABEL_9:
  v25 = [(LPStocksMetadata *)self icon];
  v26 = [v5 captionBar];
  [v26 setLeadingIcon:v25];

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isStockSymbolURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = NSString;
  char v5 = LPLocalizedString(@"%@: %@");
  uint64_t v6 = LPLocalizedString(@"Stocks");
  uint64_t v7 = [(LPStocksMetadata *)self combinedTitle];
  objc_super v8 = objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);

  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  v3 = [(LPStocksMetadata *)self icon];

  return v3;
}

@end