@interface IMNickname
+ (BOOL)supportsSecureCoding;
+ (id)nameHashWithFirstName:(id)a3 lastName:(id)a4;
+ (id)processSetOfUnknownSenderRecords:(id)a3;
+ (id)uniqueFilePathForWritingImageData;
+ (id)uniqueFilePathForWritingWallpaperData;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUpdateFromNickname:(id)a3 withOptions:(unint64_t)a4;
- (IMNickname)init;
- (IMNickname)initWithCoder:(id)a3;
- (IMNickname)initWithDictionaryRepresentation:(id)a3;
- (IMNickname)initWithFirstName:(id)a3 lastName:(id)a4 avatar:(id)a5 pronouns:(id)a6;
- (IMNickname)initWithFirstName:(id)a3 lastName:(id)a4 avatar:(id)a5 pronouns:(id)a6 wallpaper:(id)a7;
- (IMNickname)initWithMeContact:(id)a3;
- (IMNickname)initWithPublicDictionaryRepresentationWithoutAvatar:(id)a3;
- (IMNicknameAvatarImage)avatar;
- (IMWallpaper)wallpaper;
- (NSData)imageHash;
- (NSData)wallpaperImageHash;
- (NSData)wallpaperLowResImageHash;
- (NSDate)archivedDate;
- (NSDictionary)preBlastDoorPayloadData;
- (NSString)concatenatedImageHash;
- (NSString)displayName;
- (NSString)firstName;
- (NSString)handle;
- (NSString)lastName;
- (NSString)nameHash;
- (NSString)recordID;
- (_NSAttributedStringGrammarInflection)pronouns;
- (id)_imageHashCreatedInChunks:(id)a3;
- (id)_sharingState;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentation;
- (id)description;
- (id)dictionaryRepresentation;
- (id)persistedDictionaryRepresentation;
- (id)publicDictionaryRepresentation;
- (id)publicDictionaryRepresentationWithoutAvatar;
- (void)encodeWithCoder:(id)a3;
- (void)setArchivedDate:(id)a3;
- (void)setAvatar:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setHandle:(id)a3;
- (void)setLastName:(id)a3;
- (void)setPreBlastDoorPayloadData:(id)a3;
- (void)setPronouns:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setWallpaper:(id)a3;
- (void)updateNameFromContact:(id)a3;
@end

@implementation IMNickname

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(IMNickname *)self firstName];
  v6 = [v4 firstName];
  if ([v5 isEqual:v6])
  {
    BOOL v7 = 1;
  }
  else
  {
    v8 = [(IMNickname *)self firstName];
    if (v8)
    {
      BOOL v7 = 0;
    }
    else
    {
      v9 = [v4 firstName];
      BOOL v7 = v9 == 0;
    }
  }

  v10 = [(IMNickname *)self lastName];
  v11 = [v4 lastName];
  if ([v10 isEqual:v11])
  {
    BOOL v12 = 1;
  }
  else
  {
    v13 = [(IMNickname *)self lastName];
    if (v13)
    {
      BOOL v12 = 0;
    }
    else
    {
      v14 = [v4 lastName];
      BOOL v12 = v14 == 0;
    }
  }

  v15 = [(IMNickname *)self avatar];
  v16 = [v15 imageFilePath];
  v17 = [v4 avatar];
  v18 = [v17 imageFilePath];
  if ([v16 isEqual:v18])
  {
    BOOL v46 = 1;
  }
  else
  {
    v19 = [(IMNickname *)self avatar];
    v20 = [v19 imageFilePath];
    if (v20)
    {
      BOOL v46 = 0;
    }
    else
    {
      [v4 avatar];
      BOOL v45 = v12;
      v22 = BOOL v21 = v7;
      v23 = [v22 imageFilePath];
      BOOL v46 = v23 == 0;

      BOOL v7 = v21;
      BOOL v12 = v45;
    }
  }
  v24 = [(IMNickname *)self handle];
  v25 = [v4 handle];
  if ([v24 isEqual:v25])
  {
    BOOL v26 = 1;
  }
  else
  {
    v27 = [(IMNickname *)self handle];
    if (v27)
    {
      BOOL v26 = 0;
    }
    else
    {
      v28 = [v4 handle];
      BOOL v26 = v28 == 0;
    }
  }

  v29 = [(IMNickname *)self recordID];
  v30 = [v4 recordID];
  if ([v29 isEqual:v30])
  {
    BOOL v31 = 1;
  }
  else
  {
    v32 = [(IMNickname *)self recordID];
    if (v32)
    {
      BOOL v31 = 0;
    }
    else
    {
      v33 = [v4 recordID];
      BOOL v31 = v33 == 0;
    }
  }

  v34 = [(IMNickname *)self wallpaper];
  v35 = [v4 wallpaper];
  if ([v34 isEqual:v35])
  {
    BOOL v36 = 1;
  }
  else
  {
    v37 = [(IMNickname *)self wallpaper];
    if (v37)
    {
      BOOL v36 = 0;
    }
    else
    {
      v38 = [v4 wallpaper];
      BOOL v36 = v38 == 0;
    }
  }

  v39 = [(IMNickname *)self pronouns];
  v40 = [v4 pronouns];
  if ([v39 isEqual:v40])
  {
    BOOL v41 = 1;
  }
  else
  {
    v42 = [(IMNickname *)self pronouns];
    if (v42)
    {
      BOOL v41 = 0;
    }
    else
    {
      v43 = [v4 pronouns];
      BOOL v41 = v43 == 0;
    }
  }

  return v7 && v12 && v46 && v26 && v31 && v36 && v41;
}

- (IMNickname)init
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "IMNickname. Calling init directly is not supported", v5, 2u);
    }
  }
  return 0;
}

- (IMNickname)initWithFirstName:(id)a3 lastName:(id)a4 avatar:(id)a5 pronouns:(id)a6 wallpaper:(id)a7
{
  BOOL v12 = (IMWallpaper *)a7;
  v13 = [(IMNickname *)self initWithFirstName:a3 lastName:a4 avatar:a5 pronouns:a6];
  wallpaper = v13->_wallpaper;
  v13->_wallpaper = v12;

  return v13;
}

- (IMNickname)initWithFirstName:(id)a3 lastName:(id)a4 avatar:(id)a5 pronouns:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)IMNickname;
  v14 = [(IMNickname *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    firstName = v14->_firstName;
    v14->_firstName = (NSString *)v15;

    objc_storeStrong((id *)&v14->_avatar, a5);
    uint64_t v17 = [v11 copy];
    lastName = v14->_lastName;
    v14->_lastName = (NSString *)v17;

    objc_storeStrong((id *)&v14->_pronouns, a6);
    if ([(NSString *)v14->_firstName length] && [(NSString *)v14->_lastName length])
    {
      uint64_t v19 = [[NSString alloc] initWithFormat:@"%@ %@", v14->_firstName, v14->_lastName];
LABEL_7:
      displayName = v14->_displayName;
      v14->_displayName = (NSString *)v19;

      goto LABEL_8;
    }
    if ([(NSString *)v14->_firstName length])
    {
      uint64_t v19 = [v10 copy];
      goto LABEL_7;
    }
  }
LABEL_8:

  return v14;
}

- (IMNickname)initWithMeContact:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)IMNickname;
  v5 = [(IMNickname *)&v47 init];
  if (!v5) {
    goto LABEL_24;
  }
  v6 = [v4 givenName];
  uint64_t v7 = [v6 copy];
  firstName = v5->_firstName;
  v5->_firstName = (NSString *)v7;

  v9 = [v4 familyName];
  uint64_t v10 = [v9 copy];
  lastName = v5->_lastName;
  v5->_lastName = (NSString *)v10;

  if ([(NSString *)v5->_firstName length] && [(NSString *)v5->_lastName length])
  {
    uint64_t v12 = [[NSString alloc] initWithFormat:@"%@ %@", v5->_firstName, v5->_lastName];
LABEL_7:
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v12;

    goto LABEL_8;
  }
  if ([(NSString *)v5->_firstName length])
  {
    uint64_t v12 = [(NSString *)v5->_firstName copy];
    goto LABEL_7;
  }
LABEL_8:
  BOOL v45 = [v4 imageData];
  if (v45)
  {
    v14 = [(id)objc_opt_class() uniqueFilePathForWritingImageData];
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v14;
        _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Writing nickname image to path: %@", buf, 0xCu);
      }
    }
    v16 = [[IMNicknameAvatarImage alloc] initWithImageName:@"NickNameImage" imageData:v45 imageFilePath:v14 contentIsSensitive:0];
    avatar = v5->_avatar;
    v5->_avatar = v16;
  }
  v18 = [v4 wallpaper];
  if (v18)
  {
    v44 = [(id)objc_opt_class() uniqueFilePathForWritingWallpaperData];
    BOOL v41 = [(id)objc_opt_class() uniqueFilePathForWritingWallpaperData];
    v43 = [v18 posterArchiveData];
    v42 = [v4 watchWallpaperImageData];
    if (objc_opt_respondsToSelector())
    {
      v37 = [IMWallpaperMetadata alloc];
      v40 = [v18 fontDescription];
      v38 = [v40 objectForKeyedSubscript:@"name"];
      v39 = [v18 fontDescription];
      uint64_t v19 = [v39 objectForKeyedSubscript:@"point-size"];
      [v19 floatValue];
      float v21 = v20;
      objc_super v22 = [v18 fontDescription];
      v23 = [v22 objectForKeyedSubscript:@"weight"];
      [v23 floatValue];
      float v25 = v24;
      BOOL v26 = [v18 fontColorDescription];
      uint64_t v27 = [v18 isVertical];
      v28 = [v18 extensionBundleID];
      v29 = [v18 backgroundColorDescription];
      v30 = [(IMWallpaperMetadata *)v37 initWithFontName:v38 fontSize:v26 fontWeight:v27 fontColor:v28 isVertical:v29 type:v21 backgroundColor:v25];
    }
    else
    {
      v30 = 0;
    }
    id v46 = 0;
    LOBYTE(v36) = 0;
    BOOL v31 = [[IMWallpaper alloc] initWithFileName:@"Wallpaper" filePath:v44 data:v43 lowResFileName:@"Wallpaper" lowResFilePath:v41 lowResData:v42 metadata:v30 contentIsSensitive:v36 error:&v46];
    id v32 = v46;
    if (IMOSLoggingEnabled())
    {
      v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v49 = v31;
        __int16 v50 = 2112;
        id v51 = v32;
        _os_log_impl(&dword_1A0772000, v33, OS_LOG_TYPE_INFO, "Created wallpaper %@ with error: %@", buf, 0x16u);
      }
    }
    wallpaper = v5->_wallpaper;
    v5->_wallpaper = v31;
  }
LABEL_24:

  return v5;
}

+ (id)uniqueFilePathForWritingImageData
{
  v2 = IMSafeTemporaryDirectory();
  v3 = [v2 URLByAppendingPathComponent:@"com.apple.messages"];
  id v4 = [v3 path];

  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [NSString stringGUID];
  uint64_t v7 = [v5 createUniqueDirectoryWithName:v6 atPath:v4 ofType:0];

  v8 = [v7 stringByAppendingPathComponent:@"NickNameImage"];

  return v8;
}

+ (id)uniqueFilePathForWritingWallpaperData
{
  v2 = IMSafeTemporaryDirectory();
  v3 = [v2 URLByAppendingPathComponent:@"com.apple.messages"];
  id v4 = [v3 path];

  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [NSString stringGUID];
  uint64_t v7 = [v5 createUniqueDirectoryWithName:v6 atPath:v4 ofType:0];

  v8 = [v7 stringByAppendingPathComponent:@"Wallpaper"];

  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p rid: %@ displayName: %@ firstName: %@ lastName: %@ avatar: %@ handle %@ pronouns %@ wallpaper:%@>", objc_opt_class(), self, self->_recordID, self->_displayName, self->_firstName, self->_lastName, self->_avatar, self->_handle, self->_pronouns, self->_wallpaper];
}

- (IMNickname)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {

    self = 0;
    goto LABEL_15;
  }
  v5 = [IMNicknameAvatarImage alloc];
  v6 = [v4 objectForKey:@"ai"];
  uint64_t v7 = [(IMNicknameAvatarImage *)v5 initWithDictionaryRepresentation:v6];

  uint64_t v8 = [v4 objectForKey:@"rid"];
  v9 = [v4 objectForKey:@"hid"];
  uint64_t v10 = [v4 objectForKey:@"fn"];
  id v11 = [v4 objectForKey:@"ln"];
  uint64_t v12 = [v4 objectForKey:@"pb"];
  uint64_t v13 = [v4 objectForKey:@"wp"];
  id v32 = (void *)v13;
  if (v13) {
    v14 = [[IMWallpaper alloc] initWithDictionaryRepresentation:v13];
  }
  else {
    v14 = 0;
  }
  uint64_t v30 = [v4 objectForKey:@"ad"];
  uint64_t v15 = [v4 objectForKey:@"pn"];

  BOOL v31 = (void *)v7;
  if (!v15)
  {
    uint64_t v24 = v7;
    float v21 = (void *)v8;
    v23 = 0;
    objc_super v22 = (void *)v30;
LABEL_13:
    self = [(IMNickname *)self initWithFirstName:v10 lastName:v11 avatar:v24 pronouns:v23];
    [(IMNickname *)self setRecordID:v21];
    [(IMNickname *)self setHandle:v9];
    [(IMNickname *)self setWallpaper:v14];
    [(IMNickname *)self setArchivedDate:v22];
    [(IMNickname *)self setPreBlastDoorPayloadData:v12];
    char v33 = 1;
    goto LABEL_14;
  }
  v29 = v10;
  v28 = (void *)v8;
  uint64_t v16 = v7;
  id v17 = objc_alloc(MEMORY[0x1E4F292A8]);
  v18 = [v4 objectForKey:@"pn"];
  id v34 = 0;
  uint64_t v27 = [v17 initWithExternalRepresentationDictionary:v18 error:&v34];
  id v19 = v34;

  if (!v19)
  {
    uint64_t v24 = v16;
    float v21 = v28;
    uint64_t v10 = v29;
    objc_super v22 = (void *)v30;
    v23 = (void *)v27;
    goto LABEL_13;
  }
  float v20 = IMLogHandleForCategory("Nicknames");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_1A09EF4B8(v20);
  }

  char v33 = 0;
  float v21 = v28;
  uint64_t v10 = v29;
  objc_super v22 = (void *)v30;
  v23 = (void *)v27;
LABEL_14:

  if ((v33 & 1) == 0)
  {
    float v25 = 0;
    goto LABEL_17;
  }
LABEL_15:
  self = self;
  float v25 = self;
LABEL_17:

  return v25;
}

- (IMNickname)initWithPublicDictionaryRepresentationWithoutAvatar:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"fn"];
  v6 = [v4 objectForKey:@"ln"];
  uint64_t v7 = [v4 objectForKey:@"pn"];

  if (v7
    && (id v8 = objc_alloc(MEMORY[0x1E4F292A8]),
        [v4 objectForKey:@"pn"],
        v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = 0,
        uint64_t v7 = [v8 initWithExternalRepresentationDictionary:v9 error:&v12],
        v9,
        !v7))
  {
    uint64_t v7 = IMLogHandleForCategory("Nicknames");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1A09EF4B8(v7);
    }
    uint64_t v10 = 0;
  }
  else
  {
    self = [(IMNickname *)self initWithFirstName:v5 lastName:v6 avatar:0 pronouns:v7];
    uint64_t v10 = self;
  }

  return v10;
}

- (id)persistedDictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(IMNickname *)self displayName];
  if (v4) {
    CFDictionarySetValue(v3, @"dn", v4);
  }

  v5 = [(IMNicknameAvatarImage *)self->_avatar dictionaryRepresentation];
  if (v5) {
    CFDictionarySetValue(v3, @"ai", v5);
  }

  v6 = [(IMNickname *)self recordID];
  if (v6) {
    CFDictionarySetValue(v3, @"rid", v6);
  }

  uint64_t v7 = [(IMNickname *)self handle];
  if (v7) {
    CFDictionarySetValue(v3, @"hid", v7);
  }

  id v8 = [(IMNickname *)self firstName];
  if (v8) {
    CFDictionarySetValue(v3, @"fn", v8);
  }

  v9 = [(IMNickname *)self lastName];
  if (v9) {
    CFDictionarySetValue(v3, @"ln", v9);
  }

  uint64_t v10 = [(IMNickname *)self wallpaper];
  id v11 = [v10 dictionaryRepresentation];

  if (v11) {
    CFDictionarySetValue(v3, @"wp", v11);
  }

  uint64_t v12 = [(_NSAttributedStringGrammarInflection *)self->_pronouns externalRepresentationDictionary];
  if (v12) {
    CFDictionarySetValue(v3, @"pn", v12);
  }

  archivedDate = self->_archivedDate;
  if (archivedDate) {
    CFDictionarySetValue(v3, @"ad", archivedDate);
  }

  return v3;
}

- (id)dictionaryRepresentation
{
  v3 = [(IMNickname *)self persistedDictionaryRepresentation];
  id v4 = (__CFDictionary *)[v3 mutableCopy];

  v5 = [(IMNickname *)self preBlastDoorPayloadData];
  if (v5) {
    CFDictionarySetValue(v4, @"pb", v5);
  }

  return v4;
}

- (id)publicDictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  displayName = self->_displayName;
  if (displayName) {
    CFDictionarySetValue(v3, @"dn", displayName);
  }
  v6 = [(IMNicknameAvatarImage *)self->_avatar publicDictionaryRepresentation];
  if (v6) {
    CFDictionarySetValue(v4, @"ai", v6);
  }

  firstName = self->_firstName;
  if (firstName) {
    CFDictionarySetValue(v4, @"fn", firstName);
  }
  lastName = self->_lastName;
  if (lastName) {
    CFDictionarySetValue(v4, @"ln", lastName);
  }
  v9 = [(IMWallpaper *)self->_wallpaper publicDictionaryRepresentation];
  if (v9) {
    CFDictionarySetValue(v4, @"wp", v9);
  }

  uint64_t v10 = [(_NSAttributedStringGrammarInflection *)self->_pronouns externalRepresentationDictionary];
  if (v10) {
    CFDictionarySetValue(v4, @"pn", v10);
  }

  archivedDate = self->_archivedDate;
  if (archivedDate) {
    CFDictionarySetValue(v4, @"ad", archivedDate);
  }

  return v4;
}

- (id)publicDictionaryRepresentationWithoutAvatar
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  displayName = self->_displayName;
  if (displayName) {
    CFDictionarySetValue(v3, @"dn", displayName);
  }
  firstName = self->_firstName;
  if (firstName) {
    CFDictionarySetValue(v4, @"fn", firstName);
  }
  lastName = self->_lastName;
  if (lastName) {
    CFDictionarySetValue(v4, @"ln", lastName);
  }
  id v8 = [(_NSAttributedStringGrammarInflection *)self->_pronouns externalRepresentationDictionary];
  if (v8) {
    CFDictionarySetValue(v4, @"pn", v8);
  }

  archivedDate = self->_archivedDate;
  if (archivedDate) {
    CFDictionarySetValue(v4, @"ad", archivedDate);
  }

  return v4;
}

- (void)setFirstName:(id)a3
{
  if (self->_firstName != a3)
  {
    id v4 = (NSString *)[a3 copy];
    firstName = self->_firstName;
    self->_firstName = v4;

    nameHash = self->_nameHash;
    self->_nameHash = 0;
  }
}

- (void)setLastName:(id)a3
{
  if (self->_lastName != a3)
  {
    id v4 = (NSString *)[a3 copy];
    lastName = self->_lastName;
    self->_lastName = v4;

    nameHash = self->_nameHash;
    self->_nameHash = 0;
  }
}

- (void)setAvatar:(id)a3
{
  v5 = (IMNicknameAvatarImage *)a3;
  p_avatar = &self->_avatar;
  if (self->_avatar != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)p_avatar, a3);
    imageHash = self->_imageHash;
    self->_imageHash = 0;

    concatenatedImageHash = self->_concatenatedImageHash;
    self->_concatenatedImageHash = 0;

    v5 = v9;
  }

  MEMORY[0x1F41817F8](p_avatar, v5);
}

- (void)setWallpaper:(id)a3
{
  v5 = (IMWallpaper *)a3;
  p_wallpaper = &self->_wallpaper;
  if (self->_wallpaper != v5)
  {
    uint64_t v10 = v5;
    objc_storeStrong((id *)p_wallpaper, a3);
    wallpaperImageHash = self->_wallpaperImageHash;
    self->_wallpaperImageHash = 0;

    wallpaperLowResImageHash = self->_wallpaperLowResImageHash;
    self->_wallpaperLowResImageHash = 0;

    concatenatedImageHash = self->_concatenatedImageHash;
    self->_concatenatedImageHash = 0;

    v5 = v10;
  }

  MEMORY[0x1F41817F8](p_wallpaper, v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [IMNickname alloc];
  v5 = [(IMNickname *)self firstName];
  v6 = [(IMNickname *)self lastName];
  uint64_t v7 = [(IMNickname *)self avatar];
  id v8 = [(IMNickname *)self pronouns];
  v9 = [(IMNickname *)v4 initWithFirstName:v5 lastName:v6 avatar:v7 pronouns:v8];

  uint64_t v10 = [(IMNickname *)self recordID];
  [(IMNickname *)v9 setRecordID:v10];

  id v11 = [(IMNickname *)self handle];
  [(IMNickname *)v9 setHandle:v11];

  uint64_t v12 = [(IMNickname *)self wallpaper];
  [(IMNickname *)v9 setWallpaper:v12];

  uint64_t v13 = [(IMNickname *)self archivedDate];
  [(IMNickname *)v9 setArchivedDate:v13];

  v14 = [(IMNickname *)self preBlastDoorPayloadData];
  [(IMNickname *)v9 setPreBlastDoorPayloadData:v14];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMNickname)initWithCoder:(id)a3
{
  id v4 = a3;
  id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"avatar"];
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordID"];
  float v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handleID"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstName"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastName"];
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"preBlastdoorData"];
  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wallpaper"];
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"archivedDate"];
  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pronouns"];

  float v21 = (void *)v6;
  uint64_t v16 = [(IMNickname *)self initWithFirstName:v6 lastName:v7 avatar:v19 pronouns:v15];
  id v17 = v16;
  if (v5) {
    [(IMNickname *)v16 setRecordID:v5];
  }
  if (v20) {
    [(IMNickname *)v17 setHandle:v20];
  }
  if (v13) {
    [(IMNickname *)v17 setWallpaper:v13];
  }
  if (v14) {
    [(IMNickname *)v17 setArchivedDate:v14];
  }
  if (v12) {
    [(IMNickname *)v17 setPreBlastDoorPayloadData:v12];
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(IMNickname *)self displayName];
  [v4 encodeObject:v5 forKey:@"displayName"];

  uint64_t v6 = [(IMNickname *)self avatar];
  [v4 encodeObject:v6 forKey:@"avatar"];

  uint64_t v7 = [(IMNickname *)self recordID];
  [v4 encodeObject:v7 forKey:@"recordID"];

  id v8 = [(IMNickname *)self handle];
  [v4 encodeObject:v8 forKey:@"handleID"];

  uint64_t v9 = [(IMNickname *)self firstName];
  [v4 encodeObject:v9 forKey:@"firstName"];

  uint64_t v10 = [(IMNickname *)self lastName];
  [v4 encodeObject:v10 forKey:@"lastName"];

  id v11 = [(IMNickname *)self wallpaper];
  [v4 encodeObject:v11 forKey:@"wallpaper"];

  uint64_t v12 = [(IMNickname *)self pronouns];
  [v4 encodeObject:v12 forKey:@"pronouns"];

  uint64_t v13 = [(IMNickname *)self archivedDate];
  [v4 encodeObject:v13 forKey:@"archivedDate"];

  id v14 = [(IMNickname *)self preBlastDoorPayloadData];
  [v4 encodeObject:v14 forKey:@"preBlastdoorData"];
}

- (IMNicknameAvatarImage)avatar
{
  return self->_avatar;
}

- (id)dataRepresentation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v6];
  id v3 = v6;
  if (v3 && IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Error creating nickname archive: %@", buf, 0xCu);
    }
  }

  return v2;
}

+ (id)nameHashWithFirstName:(id)a3 lastName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] || objc_msgSend(v6, "length"))
  {
    uint64_t v7 = NSString;
    id v8 = [v5 lowercaseString];
    uint64_t v9 = [v6 lowercaseString];
    uint64_t v10 = [v7 stringWithFormat:@"%@+%@", v8, v9];

    id v11 = [v10 dataUsingEncoding:10];
    IMSharedHelperMD5OfData(v11);
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = &stru_1EF2CAD28;
  }

  return v12;
}

- (NSString)nameHash
{
  nameHash = self->_nameHash;
  if (!nameHash)
  {
    id v4 = objc_opt_class();
    id v5 = [(IMNickname *)self firstName];
    id v6 = [(IMNickname *)self lastName];
    uint64_t v7 = [v4 nameHashWithFirstName:v5 lastName:v6];
    id v8 = self->_nameHash;
    self->_nameHash = v7;

    nameHash = self->_nameHash;
  }

  return nameHash;
}

- (NSData)imageHash
{
  imageHash = self->_imageHash;
  if (!imageHash)
  {
    id v4 = [(IMNickname *)self avatar];
    id v5 = [v4 imageFilePath];
    id v6 = [(IMNickname *)self _imageHashCreatedInChunks:v5];
    uint64_t v7 = self->_imageHash;
    self->_imageHash = v6;

    imageHash = self->_imageHash;
  }

  return imageHash;
}

- (NSData)wallpaperImageHash
{
  wallpaperImageHash = self->_wallpaperImageHash;
  if (!wallpaperImageHash)
  {
    id v4 = [(IMNickname *)self wallpaper];
    id v5 = [v4 filePath];
    id v6 = [(IMNickname *)self _imageHashCreatedInChunks:v5];
    uint64_t v7 = self->_wallpaperImageHash;
    self->_wallpaperImageHash = v6;

    wallpaperImageHash = self->_wallpaperImageHash;
  }

  return wallpaperImageHash;
}

- (NSData)wallpaperLowResImageHash
{
  wallpaperLowResImageHash = self->_wallpaperLowResImageHash;
  if (!wallpaperLowResImageHash)
  {
    id v4 = [(IMNickname *)self wallpaper];
    id v5 = [v4 lowResFilePath];
    id v6 = [(IMNickname *)self _imageHashCreatedInChunks:v5];
    uint64_t v7 = self->_wallpaperLowResImageHash;
    self->_wallpaperLowResImageHash = v6;

    wallpaperLowResImageHash = self->_wallpaperLowResImageHash;
  }

  return wallpaperLowResImageHash;
}

- (NSString)concatenatedImageHash
{
  concatenatedImageHash = self->_concatenatedImageHash;
  if (!concatenatedImageHash)
  {
    id v4 = [(IMNickname *)self imageHash];

    if (v4)
    {
      id v5 = [(IMNickname *)self imageHash];
      IMSharedHelperMd5ToString((unsigned __int8 *)[v5 bytes]);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = &stru_1EF2CAD28;
    }
    uint64_t v7 = [(IMNickname *)self wallpaperImageHash];

    if (v7)
    {
      id v8 = [(IMNickname *)self wallpaperImageHash];
      IMSharedHelperMd5ToString((unsigned __int8 *)[v8 bytes]);
      uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v9 = &stru_1EF2CAD28;
    }
    uint64_t v10 = [(__CFString *)v6 stringByAppendingString:v9];
    id v11 = self->_concatenatedImageHash;
    self->_concatenatedImageHash = v10;

    concatenatedImageHash = self->_concatenatedImageHash;
  }

  return concatenatedImageHash;
}

- (id)_imageHashCreatedInChunks:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = IMSharedHelperMD5DataHashOfFileAtPath((uint64_t)v3);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_sharingState
{
  return +[IMMeCardSharingStateController sharedInstance];
}

- (BOOL)isUpdateFromNickname:(id)a3 withOptions:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v36, OS_LOG_TYPE_INFO, "No other nickname to compare to, bailing!", buf, 2u);
      }
    }
    goto LABEL_57;
  }
  if ((v4 & 0xC) == 0) {
    goto LABEL_8;
  }
  uint64_t v7 = [(IMNickname *)self nameHash];
  id v8 = [v6 nameHash];
  int v9 = [v7 isEqualToString:v8];

  uint64_t v10 = [(IMNickname *)self firstName];
  id v11 = [v6 firstName];
  int v12 = [v10 isEqualToString:v11];

  uint64_t v13 = [(IMNickname *)self lastName];
  id v14 = [v6 lastName];
  int v15 = [v13 isEqualToString:v14];

  uint64_t v16 = [(IMNickname *)self firstName];
  uint64_t v17 = [v16 length];

  v18 = [(IMNickname *)self lastName];
  uint64_t v19 = [v18 length];

  if (IMOSLoggingEnabled())
  {
    float v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v74 = v9 ^ 1;
      *(_WORD *)&v74[4] = 1024;
      *(_DWORD *)&v74[6] = v12;
      *(_WORD *)v75 = 1024;
      *(_DWORD *)&v75[2] = v15;
      *(_WORD *)&v75[6] = 1024;
      *(_DWORD *)&v75[8] = v17 == 0;
      *(_WORD *)&v75[12] = 1024;
      *(_DWORD *)&v75[14] = v19 == 0;
      _os_log_impl(&dword_1A0772000, v20, OS_LOG_TYPE_INFO, "Name change detected: %d (FN: %d) (LN: %d) (FNE: %d) (LNE: %d)", buf, 0x20u);
    }
  }
  if ((v9 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v60 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        v72 = [(IMNickname *)self firstName];
        v61 = [v6 firstName];
        v62 = [(IMNickname *)self lastName];
        v63 = [v6 lastName];
        *(_DWORD *)buf = 138413314;
        *(void *)v74 = self;
        *(_WORD *)&v74[8] = 2112;
        *(void *)v75 = v72;
        *(_WORD *)&v75[8] = 2112;
        *(void *)&v75[10] = v61;
        *(_WORD *)&v75[18] = 2112;
        v76 = v62;
        __int16 v77 = 2112;
        v78 = v63;
        _os_log_impl(&dword_1A0772000, v60, OS_LOG_TYPE_INFO, "Name has changed for nickname: %@. Self first name: %@, other first name name: %@, self last name: %@, other last name: %@", buf, 0x34u);
      }
    }
    if (v15)
    {
      BOOL v64 = v17 == 0;
    }
    else if (v12)
    {
      BOOL v64 = v19 == 0;
    }
    else
    {
      BOOL v64 = (v17 | v19) == 0;
    }
    BOOL v58 = !v64;
  }
  else
  {
LABEL_8:
    if ((v4 & 0xA) != 0)
    {
      float v21 = [(IMNickname *)self avatar];
      int v22 = [v21 imageExists];

      v23 = [v6 avatar];
      int v24 = [v23 imageExists];

      id v25 = [(IMNickname *)self imageHash];
      BOOL v26 = IMSharedHelperMd5ToString((unsigned __int8 *)[v25 bytes]);

      id v27 = [v6 imageHash];
      v28 = IMSharedHelperMd5ToString((unsigned __int8 *)[v27 bytes]);

      if (IMOSLoggingEnabled())
      {
        v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v74 = v22;
          *(_WORD *)&v74[4] = 1024;
          *(_DWORD *)&v74[6] = v24;
          *(_WORD *)v75 = 2112;
          *(void *)&v75[2] = v26;
          *(_WORD *)&v75[10] = 2112;
          *(void *)&v75[12] = v28;
          _os_log_impl(&dword_1A0772000, v29, OS_LOG_TYPE_INFO, "Photo (LE: %d) (OE: %d) (LH: %@) (OH: %@)", buf, 0x22u);
        }
      }
      if (v22 && ([v26 isEqualToString:v28] & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          v59 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v74 = self;
            _os_log_impl(&dword_1A0772000, v59, OS_LOG_TYPE_INFO, "Photo has changed for nickname: %@", buf, 0xCu);
          }
        }
        goto LABEL_57;
      }
    }
    if ((v4 & 0x18) != 0)
    {
      uint64_t v30 = [(IMNickname *)self pronouns];
      BOOL v31 = [v6 pronouns];
      if (v30 == v31)
      {
      }
      else
      {
        id v32 = [(IMNickname *)self pronouns];
        char v33 = [v6 pronouns];
        char v34 = [v32 isEqual:v33];

        if ((v34 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            v35 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v74 = self;
              _os_log_impl(&dword_1A0772000, v35, OS_LOG_TYPE_INFO, "Pronouns have changed for nickname: %@", buf, 0xCu);
            }
          }
LABEL_57:
          BOOL v58 = 1;
          goto LABEL_70;
        }
      }
    }
    if ((v4 & 0x28) != 0)
    {
      v37 = [(IMNickname *)self wallpaper];
      int v69 = [v37 wallpaperExists];

      v38 = [v6 wallpaper];
      int v67 = [v38 wallpaperExists];

      id v39 = [(IMNickname *)self wallpaperImageHash];
      v71 = IMSharedHelperMd5ToString((unsigned __int8 *)[v39 bytes]);

      id v40 = [v6 wallpaperImageHash];
      BOOL v41 = IMSharedHelperMd5ToString((unsigned __int8 *)[v40 bytes]);

      v42 = [(IMNickname *)self wallpaper];
      int v68 = [v42 lowResWallpaperExists];

      v43 = [v6 wallpaper];
      int v66 = [v43 lowResWallpaperExists];

      id v44 = [(IMNickname *)self wallpaperLowResImageHash];
      v70 = IMSharedHelperMd5ToString((unsigned __int8 *)[v44 bytes]);

      id v45 = [v6 wallpaperLowResImageHash];
      id v46 = IMSharedHelperMd5ToString((unsigned __int8 *)[v45 bytes]);

      objc_super v47 = [(IMNickname *)self wallpaper];
      v48 = [v47 metadata];

      v49 = [(IMNickname *)self wallpaper];
      __int16 v50 = [v49 metadata];
      id v51 = [v6 wallpaper];
      uint64_t v52 = [v51 metadata];
      int v53 = [v50 isEqual:v52];

      if (IMOSLoggingEnabled())
      {
        v54 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v74 = v69;
          *(_WORD *)&v74[4] = 1024;
          *(_DWORD *)&v74[6] = v67;
          *(_WORD *)v75 = 2112;
          *(void *)&v75[2] = v71;
          *(_WORD *)&v75[10] = 2112;
          *(void *)&v75[12] = v41;
          _os_log_impl(&dword_1A0772000, v54, OS_LOG_TYPE_INFO, "Wallpaper (LE: %d) (OE: %d) (LH: %@) (OH: %@)", buf, 0x22u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v55 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v74 = v68;
          *(_WORD *)&v74[4] = 1024;
          *(_DWORD *)&v74[6] = v66;
          *(_WORD *)v75 = 2112;
          *(void *)&v75[2] = v71;
          *(_WORD *)&v75[10] = 2112;
          *(void *)&v75[12] = v41;
          _os_log_impl(&dword_1A0772000, v55, OS_LOG_TYPE_INFO, "Low Res Wallpaper (LE: %d) (OE: %d) (LH: %@) (OH: %@)", buf, 0x22u);
        }
      }
      if (v69 && ![v71 isEqualToString:v41]) {
        goto LABEL_41;
      }
      if (v68)
      {
        if (([v70 isEqualToString:v46] & ((v48 == 0) | v53) & 1) == 0)
        {
LABEL_41:
          if (IMOSLoggingEnabled())
          {
            v56 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v74 = self;
              _os_log_impl(&dword_1A0772000, v56, OS_LOG_TYPE_INFO, "Wallpaper has changed for nickname: %@", buf, 0xCu);
            }
          }
          goto LABEL_57;
        }
      }
      else
      {
        if (v48) {
          char v57 = v53;
        }
        else {
          char v57 = 1;
        }
        if ((v57 & 1) == 0) {
          goto LABEL_41;
        }
      }
    }
    BOOL v58 = 0;
  }
LABEL_70:

  return v58;
}

- (void)updateNameFromContact:(id)a3
{
  id v10 = a3;
  char v4 = [(IMNickname *)self firstName];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
    id v6 = [v10 givenName];
    [(IMNickname *)self setFirstName:v6];
  }
  uint64_t v7 = [(IMNickname *)self lastName];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    int v9 = [v10 familyName];
    [(IMNickname *)self setLastName:v9];
  }
}

+ (id)processSetOfUnknownSenderRecords:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "mutableCopy", (void)v16);
        int v12 = [v10 objectForKey:@"date"];
        uint64_t v13 = NSNumber;
        [v12 timeIntervalSince1970];
        id v14 = objc_msgSend(v13, "numberWithDouble:");
        [v11 setObject:v14 forKey:@"date"];

        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSDate)archivedDate
{
  return self->_archivedDate;
}

- (void)setArchivedDate:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (IMWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (_NSAttributedStringGrammarInflection)pronouns
{
  return self->_pronouns;
}

- (void)setPronouns:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSDictionary)preBlastDoorPayloadData
{
  return self->_preBlastDoorPayloadData;
}

- (void)setPreBlastDoorPayloadData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preBlastDoorPayloadData, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_pronouns, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_archivedDate, 0);
  objc_storeStrong((id *)&self->_nameHash, 0);
  objc_storeStrong((id *)&self->_concatenatedImageHash, 0);
  objc_storeStrong((id *)&self->_wallpaperLowResImageHash, 0);
  objc_storeStrong((id *)&self->_wallpaperImageHash, 0);
  objc_storeStrong((id *)&self->_imageHash, 0);

  objc_storeStrong((id *)&self->_avatar, 0);
}

@end