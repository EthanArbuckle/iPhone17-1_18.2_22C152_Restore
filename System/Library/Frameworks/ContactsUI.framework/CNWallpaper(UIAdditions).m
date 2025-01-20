@interface CNWallpaper(UIAdditions)
+ (double)fontWeightFromFont:()UIAdditions;
+ (id)backgroundColorDescriptionFromConfiguration:()UIAdditions;
+ (id)colorDescriptionFromColor:()UIAdditions;
+ (id)colorFromDescription:()UIAdditions;
+ (id)fontDescriptionFromFont:()UIAdditions;
+ (id)fontFromDescription:()UIAdditions;
+ (id)reducedSizePosterArchiveDataFromData:()UIAdditions posterConfiguration:;
+ (id)wallpaperTypeFromConfiguration:()UIAdditions;
+ (id)wallpaperTypeFromExtensionBundleID:()UIAdditions;
+ (id)wallpaperWithPosterArchiveData:()UIAdditions metadataFromConfiguration:visualFingerprint:contentIsSensitive:;
- (id)backgroundColor;
- (id)font;
- (id)fontColor;
- (id)posterAttributes;
- (id)wallpaperType;
@end

@implementation CNWallpaper(UIAdditions)

- (id)wallpaperType
{
  v2 = objc_opt_class();
  v3 = [a1 extensionBundleID];
  v4 = [v2 wallpaperTypeFromExtensionBundleID:v3];

  return v4;
}

- (id)backgroundColor
{
  v2 = objc_opt_class();
  v3 = [a1 backgroundColorDescription];
  v4 = [v2 colorFromDescription:v3];

  return v4;
}

- (id)fontColor
{
  uint64_t v2 = *MEMORY[0x1E4F5A270];
  v3 = [a1 fontColorDescription];
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  if (v2)
  {
    v4 = [a1 posterAttributes];
    [v4 titleColor];
  }
  else
  {
    v5 = objc_opt_class();
    v4 = [a1 fontColorDescription];
    [v5 colorFromDescription:v4];
  v6 = };

  return v6;
}

- (id)font
{
  uint64_t v2 = *MEMORY[0x1E4F5A270];
  v3 = [a1 fontDescription];
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  if (v2)
  {
    v4 = [a1 posterAttributes];
    [v4 titleFont];
  }
  else
  {
    v5 = objc_opt_class();
    v4 = [a1 fontDescription];
    [v5 fontFromDescription:v4];
  v6 = };

  return v6;
}

- (id)posterAttributes
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F5A268];
  v3 = [a1 posterArchiveData];
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  if (v2)
  {
    v4 = 0;
  }
  else
  {
    v5 = [a1 posterArchiveData];
    id v9 = 0;
    v4 = +[CNPRUISPosterTitleStyleAttributes attributesFromData:v5 error:&v9];
    id v6 = v9;

    if (!v4)
    {
      v7 = CNUILogPosters();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v6;
        _os_log_error_impl(&dword_18B625000, v7, OS_LOG_TYPE_ERROR, "Error getting title style attributes from poster data: %@", buf, 0xCu);
      }
    }
  }

  return v4;
}

+ (id)colorDescriptionFromColor:()UIAdditions
{
  v14[4] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    double v11 = 0.0;
    double v12 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    [a3 getRed:&v12 green:&v11 blue:&v10 alpha:&v9];
    v13[0] = *MEMORY[0x1E4F1B848];
    v3 = [NSNumber numberWithDouble:v12];
    v14[0] = v3;
    v13[1] = *MEMORY[0x1E4F1B838];
    v4 = [NSNumber numberWithDouble:v11];
    v14[1] = v4;
    v13[2] = *MEMORY[0x1E4F1B828];
    v5 = [NSNumber numberWithDouble:v10];
    v14[2] = v5;
    v13[3] = *MEMORY[0x1E4F1B820];
    id v6 = [NSNumber numberWithDouble:v9];
    v14[3] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v7;
}

+ (id)wallpaperTypeFromExtensionBundleID:()UIAdditions
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.AvatarUI.AvatarPosterExtension"])
  {
    v4 = (id *)MEMORY[0x1E4F1B878];
  }
  else if ([v3 isEqualToString:@"com.apple.ContactsUI.MonogramPosterExtension"])
  {
    v4 = (id *)MEMORY[0x1E4F1B880];
  }
  else
  {
    [v3 isEqualToString:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"];
    v4 = (id *)MEMORY[0x1E4F1B888];
  }
  id v5 = *v4;

  return v5;
}

+ (id)wallpaperTypeFromConfiguration:()UIAdditions
{
  id v3 = a3;
  v4 = [[CNPRSPosterConfigurationAttributes alloc] initWithCNConfiguration:v3];

  id v5 = [(CNPRSPosterConfigurationAttributes *)v4 extensionIdentifier];
  id v6 = [(id)objc_opt_class() wallpaperTypeFromExtensionBundleID:v5];

  return v6;
}

+ (id)fontDescriptionFromFont:()UIAdditions
{
  v14[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v13[0] = *MEMORY[0x1E4F1B860];
    id v3 = a3;
    v4 = [v3 fontName];
    v14[0] = v4;
    v13[1] = *MEMORY[0x1E4F1B868];
    id v5 = NSNumber;
    [v3 pointSize];
    id v6 = objc_msgSend(v5, "numberWithDouble:");
    v14[1] = v6;
    v13[2] = *MEMORY[0x1E4F1B870];
    v7 = NSNumber;
    [(id)objc_opt_class() fontWeightFromFont:v3];
    double v9 = v8;

    double v10 = [v7 numberWithDouble:v9];
    v14[2] = v10;
    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  }
  else
  {
    double v11 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v11;
}

+ (id)backgroundColorDescriptionFromConfiguration:()UIAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v14 = 0;
  id v3 = a3;
  v4 = [v3 loadUserInfoWithError:&v14];
  id v5 = v14;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A270] + 16))())
  {
    id v6 = CNUILogPosters();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = [v5 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v16 = v13;
      _os_log_error_impl(&dword_18B625000, v6, OS_LOG_TYPE_ERROR, "Unable to read background color, failed to load user info from configuration: %@", buf, 0xCu);
    }
  }
  v7 = [(id)objc_opt_class() wallpaperTypeFromConfiguration:v3];

  if (([v7 isEqualToString:*MEMORY[0x1E4F1B880]]
     && (double v8 = &off_1E5495E20,
         +[CNMonogramPosterConfigurationReader canReadConfiguration](_TtC10ContactsUI35CNMonogramPosterConfigurationReader, "canReadConfiguration"))|| [v7 isEqualToString:*MEMORY[0x1E4F1B878]]&& (v8 = off_1E5495E18, +[CNMemojiPosterConfigurationReader canReadConfiguration](_TtC10ContactsUI33CNMemojiPosterConfigurationReader, "canReadConfiguration")))&& (double v9 = objc_msgSend(objc_alloc(*v8), "initWithPosterConfigurationUserInfo:", v4), objc_msgSend(v9, "backgroundColor"), v10 = objc_claimAutoreleasedReturnValue(), v9, v10))
  {
    double v11 = [(id)objc_opt_class() colorDescriptionFromColor:v10];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

+ (id)wallpaperWithPosterArchiveData:()UIAdditions metadataFromConfiguration:visualFingerprint:contentIsSensitive:
{
  id v8 = a4;
  id v9 = a5;
  id v26 = a3;
  double v10 = [[CNPRSPosterConfigurationAttributes alloc] initWithCNConfiguration:v8];
  double v11 = +[CNPRUISPosterTitleStyleAttributes attributesForCNConfiguration:v8];
  v27 = v9;
  if (v9)
  {
    double v12 = +[CNAvatarPosterCarouselLikenessFingerprint archiveWithFingerprint:v9];
  }
  else
  {
    double v12 = 0;
  }
  id v13 = objc_alloc(MEMORY[0x1E4F1BAE0]);
  id v14 = objc_opt_class();
  v15 = [v11 titleFont];
  v16 = [v14 fontDescriptionFromFont:v15];
  uint64_t v17 = objc_opt_class();
  v18 = [v11 titleColor];
  v19 = [v17 colorDescriptionFromColor:v18];
  v20 = [(id)objc_opt_class() backgroundColorDescriptionFromConfiguration:v8];
  [(CNPRSPosterConfigurationAttributes *)v10 extensionIdentifier];
  v21 = v25 = v10;
  LOBYTE(v24) = a6;
  v22 = objc_msgSend(v13, "initWithPosterArchiveData:fontDescription:fontColorDescription:backgroundColorDescription:extensionBundleID:vertical:visualFingerprintData:contentIsSensitive:", v26, v16, v19, v20, v21, objc_msgSend(v11, "preferredTitleLayout") == 1, v12, v24);

  return v22;
}

+ (id)colorFromDescription:()UIAdditions
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1B820]];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (void *)v4;
  }
  else {
    id v6 = &unk_1ED9155B0;
  }
  id v7 = v6;

  id v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1B858]];
  id v9 = v8;
  if (v8)
  {
    double v10 = (void *)MEMORY[0x1E4FB1618];
    [v8 floatValue];
    double v12 = v11;
    [v7 floatValue];
    id v14 = [v10 colorWithWhite:v12 alpha:v13];
  }
  else
  {
    v15 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1B840]];
    if (v15)
    {
      uint64_t v16 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1B850]];
      uint64_t v17 = (void *)v16;
      if (v16) {
        v18 = (void *)v16;
      }
      else {
        v18 = &unk_1ED9155B0;
      }
      id v19 = v18;

      uint64_t v20 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1B830]];
      v21 = (void *)v20;
      if (v20) {
        v22 = (void *)v20;
      }
      else {
        v22 = &unk_1ED9155B0;
      }
      id v23 = v22;

      uint64_t v24 = (void *)MEMORY[0x1E4FB1618];
      [v15 floatValue];
      double v26 = v25;
      [v19 floatValue];
      double v28 = v27;
      [v23 floatValue];
      double v30 = v29;
      [v7 floatValue];
      float v32 = v31;

      id v14 = [v24 colorWithHue:v26 saturation:v28 brightness:v30 alpha:v32];
    }
    else
    {
      uint64_t v33 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1B848]];
      v34 = (void *)v33;
      if (v33) {
        v35 = (void *)v33;
      }
      else {
        v35 = &unk_1ED9155B0;
      }
      id v19 = v35;

      uint64_t v36 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1B838]];
      v37 = (void *)v36;
      if (v36) {
        v38 = (void *)v36;
      }
      else {
        v38 = &unk_1ED9155B0;
      }
      id v39 = v38;

      uint64_t v40 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1B828]];
      v41 = (void *)v40;
      if (v40) {
        v42 = (void *)v40;
      }
      else {
        v42 = &unk_1ED9155B0;
      }
      id v43 = v42;

      v44 = (void *)MEMORY[0x1E4FB1618];
      [v19 floatValue];
      double v46 = v45;
      [v39 floatValue];
      double v48 = v47;
      [v43 floatValue];
      double v50 = v49;
      [v7 floatValue];
      float v52 = v51;

      id v14 = [v44 colorWithRed:v46 green:v48 blue:v50 alpha:v52];
    }
  }

  return v14;
}

+ (double)fontWeightFromFont:()UIAdditions
{
  id v3 = [a3 fontDescriptor];
  uint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4F24670]];

  id v5 = [NSNumber numberWithDouble:2003265650.0];
  id v6 = [v4 objectForKey:v5];

  [v6 floatValue];
  double v8 = v7;

  return v8;
}

+ (id)fontFromDescription:()UIAdditions
{
  v28[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1B868];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  id v6 = (void *)v5;
  float v7 = &unk_1ED915680;
  if (v5) {
    float v7 = (void *)v5;
  }
  id v8 = v7;

  id v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1B860]];
  double v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1B870]];

  if (v9 && [(__CFString *)v9 length])
  {
    CTFontRef v11 = CTFontCreateWithNameAndOptions(v9, 12.0, 0, 0x20400uLL);
    uint64_t v27 = *MEMORY[0x1E4F24670];
    double v12 = [NSNumber numberWithDouble:2003265650.0];
    float v25 = v12;
    double v26 = v10;
    float v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v28[0] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];

    v15 = [(__CTFont *)v11 fontDescriptor];
    uint64_t v16 = [v15 fontDescriptorByAddingAttributes:v14];

    uint64_t v17 = (void *)MEMORY[0x1E4FB08E0];
    [v8 floatValue];
    id v19 = [v17 fontWithDescriptor:v16 size:v18];
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1E4FB08E0];
    [v8 floatValue];
    double v22 = v21;
    [v10 floatValue];
    id v19 = [v20 systemFontOfSize:v22 weight:v23];
  }

  return v19;
}

+ (id)reducedSizePosterArchiveDataFromData:()UIAdditions posterConfiguration:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!(*(unsigned int (**)(void))(*MEMORY[0x1E4F5A268] + 16))())
  {
    id v9 = v6;
    double v10 = v9;
    if (v9)
    {
      float v7 = 0;
      CTFontRef v11 = v9;
    }
    else
    {
      id v47 = 0;
      CTFontRef v11 = +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:v5 error:&v47];
      float v7 = v47;
      if (!v11)
      {
        CTFontRef v11 = CNUILogPosters();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          float v51 = v7;
          _os_log_error_impl(&dword_18B625000, v11, OS_LOG_TYPE_ERROR, "Failed to reduce posterArchiveDataSize: failed to unarchive configuration, %@", buf, 0xCu);
        }
        id v8 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    double v12 = [v11 providerBundleIdentifier];
    char v13 = [v12 isEqualToString:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"];

    if (v13)
    {
      uint64_t v33 = v10;
      v34 = v11;
      v35 = v7;
      id v36 = v6;
      id v37 = v5;
      uint64_t v14 = [v11 assetDirectory];
      v15 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v16 = *MEMORY[0x1E4F1C6E8];
      uint64_t v17 = *MEMORY[0x1E4F1C628];
      v49[0] = *MEMORY[0x1E4F1C6E8];
      v49[1] = v17;
      float v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
      float v31 = v15;
      float v32 = (void *)v14;
      id v19 = [v15 enumeratorAtURL:v14 includingPropertiesForKeys:v18 options:4 errorHandler:0];

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v44;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v44 != v23) {
              objc_enumerationMutation(v20);
            }
            float v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            id v42 = 0;
            [v25 getResourceValue:&v42 forKey:v17 error:0];
            id v26 = v42;
            if ([v26 BOOLValue])
            {
              id v41 = 0;
              [v25 getResourceValue:&v41 forKey:v16 error:0];
              id v27 = v41;
              if ([v27 isEqualToString:@"input.segmentation"])
              {
                [v38 addObject:v25];

                goto LABEL_24;
              }
              if ([v27 isEqualToString:@"supplements"]) {
                [v20 skipDescendants];
              }
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v43 objects:v48 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }
LABEL_24:

      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __85__CNWallpaper_UIAdditions__reducedSizePosterArchiveDataFromData_posterConfiguration___block_invoke;
      v39[3] = &unk_1E54978B8;
      id v28 = v31;
      id v40 = v28;
      [v38 enumerateObjectsUsingBlock:v39];
      CTFontRef v11 = v34;
      float v29 = +[CNPRSPosterArchiver archiveCNConfiguration:v34 error:0];
      id v8 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v29];
      [v28 removeItemAtURL:v29 error:0];
      float v7 = v35;
      if (!v33) {
        [v28 removeItemAtURL:v32 error:0];
      }

      id v6 = v36;
      id v5 = v37;
    }
    else
    {
      id v8 = v5;
    }
    goto LABEL_30;
  }
  float v7 = CNUILogPosters();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18B625000, v7, OS_LOG_TYPE_ERROR, "Failed to reduce posterArchiveDataSize: posterArchiveData is empty.", buf, 2u);
  }
  id v8 = 0;
LABEL_31:

  return v8;
}

@end