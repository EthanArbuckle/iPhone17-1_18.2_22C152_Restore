@interface LPWalletPassMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldDonateToSharedWithYouForTransformer:(id)a3;
- (LPWalletPassMetadata)initWithCoder:(id)a3;
- (NSDate)eventDate;
- (NSDate)expirationDate;
- (NSString)name;
- (id)_subtitle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fallbackIconForTransformer:(id)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (int64_t)style;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
- (void)setEventDate:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setName:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation LPWalletPassMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPWalletPassMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LPWalletPassMetadata;
  v5 = [(LPWalletPassMetadata *)&v14 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"name");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_style = [v4 decodeIntegerForKey:@"style"];
    uint64_t v8 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"eventDate");
    eventDate = v5->_eventDate;
    v5->_eventDate = (NSDate *)v8;

    uint64_t v10 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"expirationDate");
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_name, @"name");
  [v4 encodeInteger:self->_style forKey:@"style"];
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_eventDate, @"eventDate");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_expirationDate, @"expirationDate");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPWalletPassMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPWalletPassMetadata *)self name];
    [(LPWalletPassMetadata *)v4 setName:v5];

    [(LPWalletPassMetadata *)v4 setStyle:[(LPWalletPassMetadata *)self style]];
    uint64_t v6 = [(LPWalletPassMetadata *)self eventDate];
    [(LPWalletPassMetadata *)v4 setEventDate:v6];

    v7 = [(LPWalletPassMetadata *)self expirationDate];
    [(LPWalletPassMetadata *)v4 setExpirationDate:v7];

    uint64_t v8 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPWalletPassMetadata;
  if ([(LPWalletPassMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_name) & 1) != 0
        && v6[3] == (void *)self->_style
        && objectsAreEqual_0(v6[4], self->_eventDate))
      {
        char v5 = objectsAreEqual_0(v6[5], self->_expirationDate);
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
  return [(NSString *)self->_name hash];
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"name", @"style", @"eventDate", @"expirationDate", 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (void)setEventDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (id)_subtitle
{
  unint64_t v3 = [(LPWalletPassMetadata *)self style];
  if (v3 > 4) {
    id v4 = @"Wallet";
  }
  else {
    id v4 = off_1E5B07048[v3];
  }
  char v5 = LPLocalizedString(v4);
  uint64_t v6 = [(LPWalletPassMetadata *)self expirationDate];

  if (v6)
  {
    v7 = NSString;
    objc_super v8 = LPLocalizedString(@"Valid until %@");
    v9 = (void *)MEMORY[0x1E4F28C10];
    uint64_t v10 = [(LPWalletPassMetadata *)self expirationDate];
    v11 = [v9 localizedStringFromDate:v10 dateStyle:1 timeStyle:0];
    v12 = objc_msgSend(v7, "stringWithFormat:", v8, v11);

LABEL_8:
    goto LABEL_9;
  }
  v13 = [(LPWalletPassMetadata *)self eventDate];

  if (v13)
  {
    objc_super v14 = (void *)MEMORY[0x1E4F28C10];
    objc_super v8 = [(LPWalletPassMetadata *)self eventDate];
    v12 = [v14 localizedStringFromDate:v8 dateStyle:2 timeStyle:0];
    goto LABEL_8;
  }
  v12 = 0;
LABEL_9:
  v15 = joinedByDot(v5, v12);

  return v15;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  char v5 = [v4 commonPresentationPropertiesForStyle:33];
  uint64_t v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v5 setCaptionBar:v6];

  v7 = [v4 metadata];
  objc_super v8 = [v7 image];

  if (v8)
  {
    v9 = [v4 metadata];
    uint64_t v10 = [v9 image];
    [v4 _populateProperties:v5 withPrimaryImage:v10];
  }
  else
  {
    v11 = [v4 metadata];
    v9 = [v11 icon];

    if (!v9)
    {
      v9 = +[LPImage _systemImageNamed:@"creditcard"];
    }
    uint64_t v10 = [v5 captionBar];
    [v10 setLeadingIcon:v9];
  }

  uint64_t v12 = objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v5, "style"));
  if ((unint64_t)(v12 - 1) >= 3)
  {
    if (v12) {
      goto LABEL_11;
    }
    v17 = [(LPWalletPassMetadata *)self name];
    v18 = [v5 captionBar];
    v19 = [v18 top];
    v20 = [v19 leading];
    [v20 setText:v17];
  }
  else
  {
    v13 = [(LPWalletPassMetadata *)self name];
    objc_super v14 = [v5 captionBar];
    v15 = [v14 top];
    v16 = [v15 leading];
    [v16 setText:v13];

    v17 = [(LPWalletPassMetadata *)self _subtitle];
    v18 = [v5 captionBar];
    v19 = [v18 bottom];
    v20 = [v19 leading];
    [v20 setText:v17];
  }

LABEL_11:

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return [a3 isFileURL];
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = [(LPWalletPassMetadata *)self name];

  if (v4)
  {
    char v5 = NSString;
    uint64_t v6 = LPLocalizedString(@"Pass: %@");
    v7 = [(LPWalletPassMetadata *)self name];
    objc_super v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  }
  else
  {
    objc_super v8 = LPLocalizedString(@"Pass");
  }

  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (id)fallbackIconForTransformer:(id)a3
{
  unint64_t v3 = +[LPImage _systemImageNamed:@"creditcard"];

  return v3;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v5 = a3;
  id v4 = [(LPWalletPassMetadata *)self name];
  [v5 setTitle:v4];
}

- (BOOL)shouldDonateToSharedWithYouForTransformer:(id)a3
{
  return 0;
}

@end