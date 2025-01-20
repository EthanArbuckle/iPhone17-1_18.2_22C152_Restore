@interface LPAppleNewsMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPAppleNewsMetadata)initWithCoder:(id)a3;
- (NSString)source;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)displayNameForOriginatingApp:(unint64_t)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSource:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation LPAppleNewsMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPAppleNewsMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPAppleNewsMetadata;
  v5 = [(LPAppleNewsMetadata *)&v12 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"source");
    source = v5->_source;
    v5->_source = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"title");
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)LPAppleNewsMetadata;
  [(LPSpecializationMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_source, @"source");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, @"title");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPAppleNewsMetadata allocWithZone:a3];
  if (v4)
  {
    objc_super v5 = [(LPAppleNewsMetadata *)self source];
    [(LPAppleNewsMetadata *)v4 setSource:v5];

    uint64_t v6 = [(LPAppleNewsMetadata *)self title];
    [(LPAppleNewsMetadata *)v4 setTitle:v6];

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPAppleNewsMetadata;
  if ([(LPAppleNewsMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if (objectsAreEqual_0(v6[2], self->_source)) {
        char v5 = objectsAreEqual_0(v6[3], self->_title);
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

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"source", @"title", 0);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 commonPresentationPropertiesForStyle:0];
  v7 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v6 setCaptionBar:v7];

  if (sizeClassAllowsMedia([v5 effectiveSizeClass])) {
    goto LABEL_2;
  }
  v11 = [v5 metadata];
  objc_super v12 = [v11 URL];
  if (objc_msgSend(v12, "_lp_isNewsSportsEventURL"))
  {
  }
  else
  {
    v3 = [v5 metadata];
    v13 = [v3 URL];
    char v14 = objc_msgSend(v13, "_lp_isNewsPuzzleURL");

    if ((v14 & 1) == 0)
    {
LABEL_2:
      objc_super v8 = [v5 metadata];
      v9 = [v8 image];
      v10 = v9;
      if (!v9)
      {
        v3 = [v5 metadata];
        v10 = [v3 icon];
      }
      [v5 _populateProperties:v6 withPrimaryImage:v10];
      goto LABEL_11;
    }
  }
  objc_super v8 = [v5 metadata];
  v9 = [v8 icon];
  v10 = v9;
  if (!v9)
  {
    v3 = [v5 metadata];
    v10 = [v3 image];
  }
  [v5 _populateProperties:v6 withPrimaryIcon:v10];
LABEL_11:
  if (!v9)
  {
  }
  v15 = [v5 metadata];
  v16 = [v15 URL];
  BOOL v17 = +[LPPresentationSpecializations isStocksNewsURL:v16];

  v18 = [v5 metadata];
  v19 = [v18 title];

  unint64_t v20 = [v19 rangeOfString:@" — " options:4];
  uint64_t v22 = v21;
  unint64_t v23 = [v19 rangeOfString:@" - " options:4];
  if (v22) {
    uint64_t v25 = v20;
  }
  else {
    uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v24 && (v23 > v20 || v22 == 0))
  {
    uint64_t v25 = v23;
    uint64_t v22 = v24;
  }
  v26 = 0;
  if (v22 && v25)
  {
    if (v22 + v25 == [v19 length])
    {
      v26 = 0;
    }
    else
    {
      uint64_t v27 = objc_msgSend(v19, "substringFromIndex:");
      uint64_t v28 = [v19 substringToIndex:v25];

      v19 = (void *)v28;
      v26 = (void *)v27;
    }
  }
  uint64_t v29 = objc_msgSend(v5, "_rowConfigurationForStyle:", objc_msgSend(v6, "style"));
  if ((unint64_t)(v29 - 2) < 2)
  {
    v33 = [v6 captionBar];
    v34 = [v33 top];
    v35 = [v34 leading];
    [v35 setText:v19];

    v36 = [v6 captionBar];
    v37 = [v36 bottom];
    v38 = [v37 leading];
    [v38 setText:v26];

    v30 = [(LPAppleNewsMetadata *)self displayNameForOriginatingApp:v17];
    v31 = [v6 captionBar];
    v32 = [v31 belowBottom];
    v39 = [v32 leading];
    [v39 setText:v30];
    goto LABEL_32;
  }
  if (v29 == 1)
  {
    v40 = [v6 captionBar];
    v41 = [v40 top];
    v42 = [v41 leading];
    [v42 setText:v19];

    if ([v5 effectiveSizeClass] == 2)
    {
      v30 = [v6 captionBar];
      v31 = [v30 bottom];
      v32 = [v31 leading];
      [v32 setText:v26];
      goto LABEL_33;
    }
    v30 = [(LPAppleNewsMetadata *)self displayNameForOriginatingApp:v17];
    v31 = joinedBySpace(v26, v30);
    v32 = [v6 captionBar];
    v39 = [v32 bottom];
    v43 = [v39 leading];
    [v43 setText:v31];

LABEL_32:
    goto LABEL_33;
  }
  if (v29) {
    goto LABEL_34;
  }
  v30 = [v6 captionBar];
  v31 = [v30 top];
  v32 = [v31 leading];
  [v32 setText:v19];
LABEL_33:

LABEL_34:

  return v6;
}

- (id)displayNameForOriginatingApp:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    id v4 = @"Stocks";
  }
  else
  {
    id v4 = @" News";
  }
  LPLocalizedString(v4);
  self = (LPAppleNewsMetadata *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  return self;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[LPPresentationSpecializations isAppleNewsURL:](LPPresentationSpecializations, "isAppleNewsURL:", v3)|| +[LPPresentationSpecializations isStocksNewsURL:v3];

  return v4;
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 metadata];
  id v5 = [v4 URL];
  BOOL v6 = +[LPPresentationSpecializations isStocksNewsURL:v5];

  v7 = NSString;
  if (v6) {
    LPLocalizedString(@"Stocks: %@");
  }
  else {
  objc_super v8 = LPLocalizedString(@"News: %@");
  }
  v9 = [v3 metadata];
  v10 = [v9 title];
  v11 = objc_msgSend(v7, "stringWithFormat:", v8, v10);

  return v11;
}

- (id)previewImageForTransformer:(id)a3
{
  id v3 = [a3 metadata];
  BOOL v4 = [v3 image];

  return v4;
}

@end