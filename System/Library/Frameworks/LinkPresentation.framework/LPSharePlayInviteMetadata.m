@interface LPSharePlayInviteMetadata
+ (BOOL)supportsSecureCoding;
+ (id)applicationNameToDisplayForBundleID:(id)a3 fallbackName:(id)a4;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPImage)icon;
- (LPSharePlayInviteMetadata)initWithCoder:(id)a3;
- (NSString)application;
- (NSString)applicationBundleIdentifier;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (id)sourceApplicationMetadataForTransformer:(id)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
- (void)setApplication:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setIcon:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation LPSharePlayInviteMetadata

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  v5 = [v4 commonPresentationPropertiesForStyle:49];
  v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v5 setCaptionBar:v6];

  v7 = LPLocalizedString(@"SharePlay");
  v8 = [v5 captionBar];
  v9 = [v8 top];
  v10 = [v9 leading];
  [v10 setText:v7];

  v11 = [(LPSharePlayInviteMetadata *)self title];
  v12 = [v5 captionBar];
  v13 = [v12 bottom];
  v14 = [v13 leading];
  [v14 setText:v11];

  v15 = [v5 captionBar];
  v16 = [v15 bottom];
  v17 = [v16 leading];
  [v17 setMaximumNumberOfLines:&unk_1EF712648];

  v18 = objc_opt_class();
  v19 = [(LPSharePlayInviteMetadata *)self applicationBundleIdentifier];
  v20 = [(LPSharePlayInviteMetadata *)self application];
  v21 = [v18 applicationNameToDisplayForBundleID:v19 fallbackName:v20];
  v22 = [v5 captionBar];
  v23 = [v22 belowBottom];
  v24 = [v23 leading];
  [v24 setText:v21];

  v25 = [v5 captionBar];
  v26 = [v25 belowBottom];
  v27 = [v26 leading];
  [v27 setMaximumNumberOfLines:&unk_1EF712648];

  v28 = [(LPSharePlayInviteMetadata *)self icon];
  [v4 _populateProperties:v5 withPrimaryImage:v28];

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return 0;
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = [(LPSharePlayInviteMetadata *)self title];

  if (v4)
  {
    v5 = NSString;
    v6 = LPLocalizedString(@"SharePlay Link: %@");
    v7 = [(LPSharePlayInviteMetadata *)self title];
    v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  }
  else
  {
    v8 = LPLocalizedString(@"SharePlay Link");
  }

  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v7 = a3;
  id v4 = [(LPSharePlayInviteMetadata *)self title];
  v5 = v4;
  if (!v4)
  {
    v5 = LPLocalizedString(@"SharePlay Link");
  }
  [v7 setTitle:v5];
  if (!v4) {

  }
  v6 = [(LPSharePlayInviteMetadata *)self icon];
  [v7 setIcon:v6];
}

- (id)sourceApplicationMetadataForTransformer:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(LPSourceApplicationMetadata);
  id v6 = objc_alloc(MEMORY[0x1E4F6F248]);
  id v7 = [(LPSharePlayInviteMetadata *)self applicationBundleIdentifier];
  v8 = (void *)[v6 initWithBundleIdentifier:v7];

  id v9 = objc_alloc(MEMORY[0x1E4F6F258]);
  [v4 scaleFactor];
  v11 = objc_msgSend(v9, "initWithSize:scale:", 8.0, 8.0, v10);
  [v11 setShouldApplyMask:0];
  v12 = [v8 prepareImageForDescriptor:v11];
  id v13 = -[LPImage _initWithCGImage:]([LPImage alloc], "_initWithCGImage:", [v12 CGImage]);
  [(LPSourceApplicationMetadata *)v5 setIcon:v13];

  return v5;
}

+ (id)applicationNameToDisplayForBundleID:(id)a3 fallbackName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"com.apple.podcasts"])
  {
    id v7 = @" Podcasts";
LABEL_11:
    LPLocalizedString(v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if ([v5 isEqualToString:@"com.apple.news"])
  {
    id v7 = @" News";
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "_lp_isEqualIgnoringCase:", @"com.apple.tv"))
  {
    id v7 = @" tv";
    goto LABEL_11;
  }
  if ([v5 isEqualToString:@"com.apple.Music"])
  {
    id v7 = @" Music";
    goto LABEL_11;
  }
  if ([v5 isEqualToString:@"com.apple.iBooks"])
  {
    id v7 = @" Books";
    goto LABEL_11;
  }
  id v8 = v6;
LABEL_12:
  id v9 = v8;

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPSharePlayInviteMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)LPSharePlayInviteMetadata;
  id v5 = [(LPSharePlayInviteMetadata *)&v16 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"title");
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"applicationBundleIdentifier");
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"application");
    application = v5->_application;
    v5->_application = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"icon");
    icon = v5->_icon;
    v5->_icon = (LPImage *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, @"title");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_applicationBundleIdentifier, @"applicationBundleIdentifier");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_application, @"application");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"icon");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPSharePlayInviteMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(LPSharePlayInviteMetadata *)self title];
    [(LPSharePlayInviteMetadata *)v4 setTitle:v5];

    uint64_t v6 = [(LPSharePlayInviteMetadata *)self applicationBundleIdentifier];
    [(LPSharePlayInviteMetadata *)v4 setApplicationBundleIdentifier:v6];

    id v7 = [(LPSharePlayInviteMetadata *)self application];
    [(LPSharePlayInviteMetadata *)v4 setApplication:v7];

    uint64_t v8 = [(LPSharePlayInviteMetadata *)self icon];
    [(LPSharePlayInviteMetadata *)v4 setIcon:v8];

    id v9 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPSharePlayInviteMetadata;
  if ([(LPSharePlayInviteMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_title) & 1) != 0
        && objectsAreEqual_0(v6[3], self->_applicationBundleIdentifier)
        && objectsAreEqual_0(v6[4], self->_application))
      {
        char v5 = objectsAreEqual_0(v6[5], self->_icon);
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
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_applicationBundleIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_application hash];
  return v4 ^ v5 ^ [(LPImage *)self->_icon hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"title", @"applicationBundleIdentifier", @"application", @"icon", 0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSString)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
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
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end