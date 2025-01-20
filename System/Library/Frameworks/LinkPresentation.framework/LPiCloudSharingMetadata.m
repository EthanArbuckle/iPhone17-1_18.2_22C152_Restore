@interface LPiCloudSharingMetadata
+ (BOOL)supportsSecureCoding;
+ (id)_applicationNameMap;
+ (id)_bundleIdentifierMap;
+ (id)extractApplicationFromURL:(id)a3;
+ (id)extractApplicationNameFromURL:(id)a3;
+ (id)extractKindFromURL:(id)a3;
+ (id)extractTitleFromURL:(id)a3;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFreeformBoardLinkWithURL:(id)a3;
- (BOOL)isSafariTabGroupLinkWithURL:(id)a3;
- (BOOL)sharedObjectPrefersIconAsImageForTransformer:(id)a3;
- (LPImage)icon;
- (LPImage)thumbnail;
- (LPiCloudSharingMetadata)initWithCoder:(id)a3;
- (NSDictionary)encodedTokens;
- (NSString)application;
- (NSString)applicationBundleIdenfier;
- (NSString)kind;
- (NSString)title;
- (id)_bottomLeadingCaptionStringWithApplicationName:(id)a3 originalURL:(id)a4;
- (id)_topLeadingCaptionStringWithApplicationName:(id)a3 originalURL:(id)a4;
- (id)computeIcon;
- (id)computeThumbnail;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fallbackIconForTransformer:(id)a3;
- (id)firstPartyAppIcon;
- (id)localizedApplicationNameWithURL:(id)a3;
- (id)localizedKind;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (id)sharedObjectIconForTransformer:(id)a3;
- (id)sharedObjectInformationForTransformer:(id)a3;
- (id)sharedObjectSubtitleForTransformer:(id)a3;
- (id)sharedObjectTitleForTransformer:(id)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
- (void)setApplication:(id)a3;
- (void)setApplicationBundleIdenfier:(id)a3;
- (void)setEncodedTokens:(id)a3;
- (void)setIcon:(id)a3;
- (void)setKind:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation LPiCloudSharingMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiCloudSharingMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)LPiCloudSharingMetadata;
  v5 = [(LPiCloudSharingMetadata *)&v21 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"application");
    application = v5->_application;
    v5->_application = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"kind");
    kind = v5->_kind;
    v5->_kind = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"title");
    title = v5->_title;
    v5->_title = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"icon");
    icon = v5->_icon;
    v5->_icon = (LPImage *)v12;

    uint64_t v14 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"thumbnail");
    thumbnail = v5->_thumbnail;
    v5->_thumbnail = (LPImage *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v4, "_lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass:andObjectsOfClass:forKey:", v16, objc_opt_class(), @"encodedTokens");
    encodedTokens = v5->_encodedTokens;
    v5->_encodedTokens = (NSDictionary *)v17;

    v19 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_application, @"application");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_kind, @"kind");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, @"title");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"icon");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_thumbnail, @"thumbnail");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_encodedTokens, @"encodedTokens");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPiCloudSharingMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPiCloudSharingMetadata *)self application];
    [(LPiCloudSharingMetadata *)v4 setApplication:v5];

    uint64_t v6 = [(LPiCloudSharingMetadata *)self kind];
    [(LPiCloudSharingMetadata *)v4 setKind:v6];

    v7 = [(LPiCloudSharingMetadata *)self title];
    [(LPiCloudSharingMetadata *)v4 setTitle:v7];

    uint64_t v8 = [(LPiCloudSharingMetadata *)self icon];
    [(LPiCloudSharingMetadata *)v4 setIcon:v8];

    v9 = [(LPiCloudSharingMetadata *)self thumbnail];
    [(LPiCloudSharingMetadata *)v4 setThumbnail:v9];

    uint64_t v10 = [(LPiCloudSharingMetadata *)self encodedTokens];
    [(LPiCloudSharingMetadata *)v4 setEncodedTokens:v10];

    v11 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiCloudSharingMetadata;
  if ([(LPiCloudSharingMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[3], self->_application) & 1) != 0
        && objectsAreEqual_0(v6[4], self->_kind)
        && objectsAreEqual_0(v6[5], self->_title)
        && objectsAreEqual_0(v6[6], self->_icon)
        && objectsAreEqual_0(v6[7], self->_thumbnail))
      {
        char v5 = objectsAreEqual_0(v6[8], self->_encodedTokens);
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
  return [(NSString *)self->_title hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  v3 = (void (**)(id, __CFString *))a3;
  v3[2](v3, @"icon");
  v3[2](v3, @"thumbnail");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"application", @"kind", @"title", @"icon", @"thumbnail", @"encodedTokens", 0);
}

- (NSString)applicationBundleIdenfier
{
  return self->_applicationBundleIdenfier;
}

- (void)setApplicationBundleIdenfier:(id)a3
{
}

- (NSString)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (LPImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (NSDictionary)encodedTokens
{
  return self->_encodedTokens;
}

- (void)setEncodedTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedTokens, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_application, 0);

  objc_storeStrong((id *)&self->_applicationBundleIdenfier, 0);
}

+ (id)_applicationNameMap
{
  v7[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)_applicationNameMap_map;
  if (!_applicationNameMap_map)
  {
    v6[0] = @"notes";
    v6[1] = @"pages";
    v7[0] = @"Notes";
    v7[1] = @"Pages";
    v6[2] = @"numbers";
    v6[3] = @"keynote";
    v7[2] = @"Numbers";
    v7[3] = @"Keynote";
    v6[4] = @"freeform";
    v6[5] = @"freeform-copy";
    v7[4] = @"Freeform";
    v7[5] = @"Freeform";
    v6[6] = @"reminders";
    v6[7] = @"iclouddrive";
    v7[6] = @"Reminders";
    v7[7] = @"iCloud Drive";
    v6[8] = @"safari-tab-groups";
    v7[8] = @"Safari";
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:9];
    id v4 = (void *)_applicationNameMap_map;
    _applicationNameMap_map = v3;

    v2 = (void *)_applicationNameMap_map;
  }

  return v2;
}

+ (id)_bundleIdentifierMap
{
  return &unk_1EF712D48;
}

+ (id)extractApplicationFromURL:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "_lp_pathComponentAtIndex:", 1);

  return v3;
}

+ (id)extractApplicationNameFromURL:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() extractApplicationFromURL:v3];
  char v5 = +[LPiCloudSharingMetadata _applicationNameMap];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

+ (id)extractKindFromURL:(id)a3
{
  id v4 = a3;
  char v5 = [a1 extractApplicationFromURL:v4];
  char v6 = [v5 isEqual:@"freeform-copy"];

  if (v6)
  {
    v7 = @"copy";
  }
  else
  {
    objc_msgSend(v4, "_lp_pathComponentAtIndex:", 2);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)extractTitleFromURL:(id)a3
{
  id v3 = [a3 fragment];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"_" withString:@" "];
  char v5 = [v4 stringByRemovingPercentEncoding];

  return v5;
}

- (id)firstPartyAppIcon
{
  id v3 = [(LPiCloudSharingMetadata *)self application];
  int v4 = [v3 isEqualToString:@"Pages"];

  if (v4)
  {
    char v5 = +[LPResources pagesIcon];
  }
  else
  {
    char v6 = [(LPiCloudSharingMetadata *)self application];
    int v7 = [v6 isEqualToString:@"Notes"];

    if (v7)
    {
      char v5 = +[LPResources notesIcon];
    }
    else
    {
      objc_super v8 = [(LPiCloudSharingMetadata *)self application];
      int v9 = [v8 isEqualToString:@"Numbers"];

      if (v9)
      {
        char v5 = +[LPResources numbersIcon];
      }
      else
      {
        uint64_t v10 = [(LPiCloudSharingMetadata *)self application];
        int v11 = [v10 isEqualToString:@"Keynote"];

        if (v11)
        {
          char v5 = +[LPResources keynoteIcon];
        }
        else
        {
          uint64_t v12 = [(LPiCloudSharingMetadata *)self application];
          int v13 = [v12 isEqualToString:@"iCloud Drive"];

          if (v13)
          {
            char v5 = +[LPResources iCloudDriveIcon];
          }
          else
          {
            uint64_t v14 = [(LPiCloudSharingMetadata *)self application];
            int v15 = [v14 isEqualToString:@"Reminders"];

            if (v15)
            {
              char v5 = +[LPResources remindersIcon];
            }
            else
            {
              uint64_t v16 = [(LPiCloudSharingMetadata *)self application];
              int v17 = [v16 isEqualToString:@"Safari"];

              if (v17)
              {
                char v5 = +[LPResources safariAppIcon];
              }
              else
              {
                v18 = [(LPiCloudSharingMetadata *)self application];
                int v19 = [v18 isEqualToString:@"Freeform"];

                if (v19)
                {
                  char v5 = +[LPResources freeformIcon];
                }
                else
                {
                  char v5 = 0;
                }
              }
            }
          }
        }
      }
    }
  }

  return v5;
}

- (id)computeThumbnail
{
  id v3 = [(LPiCloudSharingMetadata *)self icon];

  if (v3)
  {
    int v4 = [(LPiCloudSharingMetadata *)self icon];
  }
  else
  {
    char v5 = [(LPiCloudSharingMetadata *)self firstPartyAppIcon];
    char v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = +[LPResources iCloudDriveIcon];
    }
    int v4 = v7;
  }

  return v4;
}

- (id)computeIcon
{
  id v3 = [(LPiCloudSharingMetadata *)self firstPartyAppIcon];
  int v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    char v6 = [(LPiCloudSharingMetadata *)self icon];

    if (v6) {
      [(LPiCloudSharingMetadata *)self icon];
    }
    else {
    id v5 = +[LPResources iCloudDriveIcon];
    }
  }
  id v7 = v5;

  return v7;
}

- (BOOL)isSafariTabGroupLinkWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [(LPiCloudSharingMetadata *)self application];

  if (v5)
  {
    char v6 = [(LPiCloudSharingMetadata *)self application];
    char v7 = [v6 isEqualToString:@"Safari"];
  }
  else
  {
    char v6 = [(id)objc_opt_class() extractApplicationFromURL:v4];
    char v7 = [v6 isEqualToString:@"safari-tab-groups"];
  }
  BOOL v8 = v7;

  return v8;
}

- (BOOL)isFreeformBoardLinkWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [(LPiCloudSharingMetadata *)self application];
  if (!v5)
  {
    id v5 = [(id)objc_opt_class() extractApplicationNameFromURL:v4];
  }
  char v6 = [v5 isEqualToString:@"Freeform"];

  return v6;
}

- (id)localizedApplicationNameWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [(LPiCloudSharingMetadata *)self application];

  if (v5)
  {
    char v6 = [(LPiCloudSharingMetadata *)self application];
    int v7 = [v6 isEqualToString:@"iCloud Drive"];

    if (v7)
    {
      BOOL v8 = LPLocalizedString(@"iCloud Drive");
      goto LABEL_16;
    }
    int v11 = +[LPiCloudSharingMetadata _bundleIdentifierMap];
    uint64_t v12 = [(LPiCloudSharingMetadata *)self application];
    int v9 = [v11 objectForKeyedSubscript:v12];

    if (v9)
    {
      int v13 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v9 allowPlaceholder:1 error:0];
      uint64_t v14 = v13;
      if (v13)
      {
        int v15 = [v13 localizedName];
        uint64_t v16 = v15;
        if (v15)
        {
          id v17 = v15;
        }
        else
        {
          id v17 = [(LPiCloudSharingMetadata *)self application];
        }
        BOOL v8 = v17;
      }
      else
      {
        BOOL v8 = [(LPiCloudSharingMetadata *)self application];
      }

      goto LABEL_15;
    }
    uint64_t v10 = [(LPiCloudSharingMetadata *)self application];
  }
  else
  {
    int v9 = [(id)objc_opt_class() extractApplicationNameFromURL:v4];
    uint64_t v10 = LPLocalizedString(v9);
  }
  BOOL v8 = (void *)v10;
LABEL_15:

LABEL_16:

  return v8;
}

- (id)localizedKind
{
  id v3 = [(LPiCloudSharingMetadata *)self application];
  int v4 = [v3 isEqualToString:@"Reminders"];

  if (v4)
  {
    id v5 = [(LPiCloudSharingMetadata *)self kind];
    char v6 = [v5 isEqualToString:@"Shared List"];

    if (v6)
    {
      int v7 = @"Shared List";
LABEL_6:
      uint64_t v10 = LPLocalizedString(v7);
      goto LABEL_8;
    }
    BOOL v8 = [(LPiCloudSharingMetadata *)self kind];
    char v9 = [v8 isEqualToString:@"Template"];

    if (v9)
    {
      int v7 = @"Template";
      goto LABEL_6;
    }
  }
  uint64_t v10 = 0;
LABEL_8:

  return v10;
}

- (id)_topLeadingCaptionStringWithApplicationName:(id)a3 originalURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(LPiCloudSharingMetadata *)self title];

  if (v8)
  {
    uint64_t v9 = [(LPiCloudSharingMetadata *)self title];
  }
  else
  {
    if ([(LPiCloudSharingMetadata *)self isFreeformBoardLinkWithURL:v7])
    {
      uint64_t v10 = @"Freeform Board";
    }
    else
    {
      if (v6)
      {
        int v11 = NSString;
        uint64_t v12 = LPLocalizedString(@"Shared from %@");
        int v13 = objc_msgSend(v11, "stringWithFormat:", v12, v6);

        goto LABEL_10;
      }
      uint64_t v10 = @"Shared using iCloud Sharing";
    }
    uint64_t v9 = LPLocalizedString(v10);
  }
  int v13 = (void *)v9;
LABEL_10:

  return v13;
}

- (id)_bottomLeadingCaptionStringWithApplicationName:(id)a3 originalURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(LPiCloudSharingMetadata *)self title];

  if (v8)
  {
    uint64_t v9 = [(LPiCloudSharingMetadata *)self application];
    int v10 = [v9 isEqualToString:@"Reminders"];

    if (v10)
    {
      int v11 = [(LPiCloudSharingMetadata *)self kind];
      char v12 = [v11 isEqualToString:@"Shared List"];

      if (v12)
      {
        int v13 = @"Reminders Shared List";
LABEL_14:
        LPLocalizedString(v13);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      int v15 = [(LPiCloudSharingMetadata *)self kind];
      char v16 = [v15 isEqualToString:@"Template"];

      if (v16)
      {
        int v13 = @"Reminders Template";
        goto LABEL_14;
      }
    }
    if ([(LPiCloudSharingMetadata *)self isSafariTabGroupLinkWithURL:v7])
    {
      int v13 = @"Safari Tab Group";
      goto LABEL_14;
    }
    if (!v6)
    {
      int v13 = @"Shared using iCloud Sharing";
      goto LABEL_14;
    }
  }
  else if (![(LPiCloudSharingMetadata *)self isFreeformBoardLinkWithURL:v7])
  {
    uint64_t v14 = 0;
    goto LABEL_16;
  }
  id v17 = v6;
LABEL_15:
  uint64_t v14 = v17;
LABEL_16:

  return v14;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v5 = a3;
  id v6 = [v5 commonPresentationPropertiesForStyle:16];
  id v7 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v6 setCaptionBar:v7];

  BOOL v8 = [(LPiCloudSharingMetadata *)self thumbnail];
  uint64_t v9 = v8;
  if (!v8)
  {
    id v3 = [v5 metadata];
    uint64_t v9 = [v3 image];
  }
  [v5 _populateProperties:v6 withPrimaryImage:v9];
  if (!v8)
  {
  }
  int v10 = [(LPiCloudSharingMetadata *)self computeIcon];
  [v5 _populateProperties:v6 withPrimaryIcon:v10 iconProperties:0 canBecomeImage:0];

  int v11 = [v5 originalURL];
  char v12 = [(LPiCloudSharingMetadata *)self localizedApplicationNameWithURL:v11];

  int v13 = [v5 originalURL];
  uint64_t v14 = [(LPiCloudSharingMetadata *)self _topLeadingCaptionStringWithApplicationName:v12 originalURL:v13];
  int v15 = [v6 captionBar];
  char v16 = [v15 top];
  id v17 = [v16 leading];
  [v17 setText:v14];

  v18 = [v5 originalURL];
  int v19 = [(LPiCloudSharingMetadata *)self _bottomLeadingCaptionStringWithApplicationName:v12 originalURL:v18];
  v20 = [v6 captionBar];
  objc_super v21 = [v20 bottom];
  v22 = [v21 leading];
  [v22 setText:v19];

  return v6;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiCloudURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  int v4 = [a3 URL];
  id v5 = [(LPiCloudSharingMetadata *)self localizedApplicationNameWithURL:v4];

  id v6 = [(LPiCloudSharingMetadata *)self title];

  if (v6 && v5)
  {
    id v7 = NSString;
    BOOL v8 = LPLocalizedString(@"Link: “%@” shared from %@");
    uint64_t v9 = [(LPiCloudSharingMetadata *)self title];
    uint64_t v10 = objc_msgSend(v7, "stringWithFormat:", v8, v9, v5);
LABEL_11:
    uint64_t v14 = (void *)v10;

    goto LABEL_12;
  }
  if (v5)
  {
    BOOL v8 = [(LPiCloudSharingMetadata *)self localizedKind];
    int v11 = NSString;
    if (v8)
    {
      uint64_t v9 = LPLocalizedString(@"Link: %@ shared from %@");
      objc_msgSend(v11, "stringWithFormat:", v9, v8, v5);
    }
    else
    {
      uint64_t v9 = LPLocalizedString(@"Link: Document shared from %@");
      objc_msgSend(v11, "stringWithFormat:", v9, v5);
    uint64_t v10 = };
    goto LABEL_11;
  }
  char v12 = [(LPiCloudSharingMetadata *)self title];

  if (v12)
  {
    int v13 = NSString;
    BOOL v8 = LPLocalizedString(@"Link: “%@” shared using iCloud Sharing");
    uint64_t v9 = [(LPiCloudSharingMetadata *)self title];
    uint64_t v10 = objc_msgSend(v13, "stringWithFormat:", v8, v9);
    goto LABEL_11;
  }
  uint64_t v14 = LPLocalizedString(@"Link: Document shared using iCloud Sharing");
LABEL_12:

  return v14;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (id)fallbackIconForTransformer:(id)a3
{
  id v3 = +[LPResources iCloudIcon];

  return v3;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v16 = a3;
  int v4 = [v16 originalURL];
  id v5 = [(LPiCloudSharingMetadata *)self localizedApplicationNameWithURL:v4];

  id v6 = [(LPiCloudSharingMetadata *)self title];

  if (v6 && v5)
  {
    id v7 = NSString;
    BOOL v8 = LPLocalizedString(@"“%@” shared from %@");
    uint64_t v9 = [(LPiCloudSharingMetadata *)self title];
    uint64_t v10 = objc_msgSend(v7, "stringWithFormat:", v8, v9, v5);
    [v16 setTitle:v10];
LABEL_4:

LABEL_7:
    goto LABEL_8;
  }
  if (v5)
  {
    int v11 = NSString;
    BOOL v8 = LPLocalizedString(@"Document shared from %@");
    uint64_t v9 = objc_msgSend(v11, "stringWithFormat:", v8, v5);
    [v16 setTitle:v9];
    goto LABEL_7;
  }
  uint64_t v14 = [(LPiCloudSharingMetadata *)self title];

  if (v14)
  {
    int v15 = NSString;
    BOOL v8 = LPLocalizedString(@"“%@” shared using iCloud Sharing");
    uint64_t v9 = [(LPiCloudSharingMetadata *)self title];
    uint64_t v10 = objc_msgSend(v15, "stringWithFormat:", v8, v9);
    [v16 setTitle:v10];
    goto LABEL_4;
  }
  BOOL v8 = LPLocalizedString(@"Document shared using iCloud Sharing");
  [v16 setTitle:v8];
LABEL_8:

  char v12 = [(LPiCloudSharingMetadata *)self icon];
  [v16 setIcon:v12];

  int v13 = [(LPiCloudSharingMetadata *)self thumbnail];
  [v16 setImage:v13];
}

- (id)sharedObjectTitleForTransformer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 originalURL];
  id v6 = [(LPiCloudSharingMetadata *)self localizedApplicationNameWithURL:v5];

  id v7 = [v4 originalURL];
  BOOL v8 = [(LPiCloudSharingMetadata *)self _topLeadingCaptionStringWithApplicationName:v6 originalURL:v7];

  return v8;
}

- (id)sharedObjectSubtitleForTransformer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 originalURL];
  id v6 = [(LPiCloudSharingMetadata *)self localizedApplicationNameWithURL:v5];

  id v7 = [v4 originalURL];
  BOOL v8 = [(LPiCloudSharingMetadata *)self _bottomLeadingCaptionStringWithApplicationName:v6 originalURL:v7];

  return v8;
}

- (id)sharedObjectInformationForTransformer:(id)a3
{
  id v3 = [(LPiCloudSharingMetadata *)self localizedKind];

  return v3;
}

- (id)sharedObjectIconForTransformer:(id)a3
{
  id v3 = [(LPiCloudSharingMetadata *)self computeThumbnail];

  return v3;
}

- (BOOL)sharedObjectPrefersIconAsImageForTransformer:(id)a3
{
  return 0;
}

@end