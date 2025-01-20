@interface CNVisualIdentity
+ (id)abbreviatedNameForGroupName:(id)a3;
+ (id)descriptorForImageKeys;
+ (id)descriptorForRequiredKeys;
+ (id)firstComposedCharacterFromString:(id)a3;
+ (id)log;
- (BOOL)canUpdateGroupName;
- (BOOL)hasImageDataAvailable;
- (BOOL)hasLinkedContacts;
- (BOOL)imageAllowsEditing;
- (CGRect)cropRect;
- (CNVisualIdentity)initWithContact:(id)a3;
- (CNVisualIdentity)initWithGroupIdentity:(id)a3;
- (CNWallpaper)wallpaper;
- (NSArray)contacts;
- (NSArray)linkedContacts;
- (NSData)fullscreenImageData;
- (NSData)imageData;
- (NSData)imageHash;
- (NSData)memojiMetadata;
- (NSData)thumbnailImageData;
- (NSString)abbreviatedName;
- (NSString)identifier;
- (NSString)imageType;
- (NSString)name;
- (NSString)shortenedDisplayName;
- (UIImage)avatarImage;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)wallpaperType;
- (int64_t)contactImageSource;
- (int64_t)identityType;
- (unint64_t)contactImageType;
- (void)clearImage;
- (void)clearImageAndWallpaper;
- (void)clearWallpaper;
- (void)setAbbreviatedName:(id)a3;
- (void)setAvatarImage:(id)a3;
- (void)setContacts:(id)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setFullscreenImageData:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentityType:(int64_t)a3;
- (void)setImageData:(id)a3;
- (void)setImageHash:(id)a3;
- (void)setImageType:(id)a3;
- (void)setLinkedContacts:(id)a3;
- (void)setMemojiMetadata:(id)a3;
- (void)setName:(id)a3;
- (void)setShortenedDisplayName:(id)a3;
- (void)setThumbnailImageData:(id)a3;
- (void)setWallpaper:(id)a3;
- (void)updateContactWithGivenName:(id)a3 familyName:(id)a4;
- (void)updateGroupName:(id)a3;
- (void)updateImageForContact:(id)a3;
- (void)updateImageType:(unint64_t)a3;
@end

@implementation CNVisualIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_storeStrong((id *)&self->_memojiMetadata, 0);
  objc_storeStrong((id *)&self->_linkedContacts, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_imageHash, 0);
  objc_storeStrong((id *)&self->_shortenedDisplayName, 0);
  objc_storeStrong((id *)&self->_abbreviatedName, 0);
  objc_storeStrong((id *)&self->_avatarImage, 0);
  objc_storeStrong((id *)&self->_fullscreenImageData, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setWallpaper:(id)a3
{
}

- (CNWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (void)setMemojiMetadata:(id)a3
{
}

- (NSData)memojiMetadata
{
  return self->_memojiMetadata;
}

- (void)setIdentityType:(int64_t)a3
{
  self->_identityType = a3;
}

- (int64_t)identityType
{
  return self->_identityType;
}

- (void)setLinkedContacts:(id)a3
{
}

- (NSArray)linkedContacts
{
  return self->_linkedContacts;
}

- (void)setContacts:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setImageType:(id)a3
{
  self->_imageType = (NSString *)a3;
}

- (NSString)imageType
{
  return self->_imageType;
}

- (void)setImageHash:(id)a3
{
}

- (NSData)imageHash
{
  return self->_imageHash;
}

- (void)setShortenedDisplayName:(id)a3
{
}

- (void)setAbbreviatedName:(id)a3
{
}

- (void)setAvatarImage:(id)a3
{
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFullscreenImageData:(id)a3
{
}

- (NSData)fullscreenImageData
{
  return self->_fullscreenImageData;
}

- (NSData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setName:(id)a3
{
}

- (id)wallpaperType
{
  v3 = [(CNVisualIdentity *)self imageType];
  v4 = [MEMORY[0x1E4F1B8F8] stringIdentifierForImageType:2];
  char v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    v6 = (void **)MEMORY[0x1E4F1B880];
  }
  else
  {
    v7 = [(CNVisualIdentity *)self imageType];
    v8 = [MEMORY[0x1E4F1B8F8] stringIdentifierForImageType:3];
    int v9 = [v7 isEqualToString:v8];

    v6 = (void **)MEMORY[0x1E4F1B888];
    if (v9) {
      v6 = (void **)MEMORY[0x1E4F1B878];
    }
  }
  v10 = *v6;

  return v10;
}

- (BOOL)imageAllowsEditing
{
  return [(CNVisualIdentity *)self identityType] != 1;
}

- (BOOL)canUpdateGroupName
{
  return [(CNVisualIdentity *)self identityType] == 1;
}

- (UIImage)avatarImage
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  avatarImage = self->_avatarImage;
  if (avatarImage) {
    goto LABEL_5;
  }
  v4 = [(CNVisualIdentity *)self thumbnailImageData];

  if (v4)
  {
    char v5 = (void *)MEMORY[0x1E4FB1818];
    v6 = [(CNVisualIdentity *)self thumbnailImageData];
    v7 = [v5 imageWithData:v6];
    v8 = self->_avatarImage;
    self->_avatarImage = v7;
LABEL_4:

    avatarImage = self->_avatarImage;
LABEL_5:
    int v9 = avatarImage;
    goto LABEL_6;
  }
  v11 = [(CNVisualIdentity *)self imageData];

  if (v11)
  {
    [(CNVisualIdentity *)self cropRect];
    BOOL v12 = CGRectEqualToRect(v55, *MEMORY[0x1E4F1DB28]);
    v13 = (void *)MEMORY[0x1E4FB1818];
    v6 = [(CNVisualIdentity *)self imageData];
    v14 = [v13 imageWithData:v6];
    v15 = v14;
    if (v12)
    {
      v8 = self->_avatarImage;
      self->_avatarImage = v14;
      goto LABEL_4;
    }

    [(CNVisualIdentity *)self cropRect];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    [(UIImage *)v15 size];
    double v26 = v25;
    [(UIImage *)v15 size];
    double v28 = v27;
    if ((objc_msgSend(MEMORY[0x1E4F5A420], "cropRect:fitsWithinSize:", v18, v20, v22, v24, v26, v27) & 1) == 0)
    {
      v29 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        int v41 = 134219264;
        double v42 = v18;
        __int16 v43 = 2048;
        double v44 = v20;
        __int16 v45 = 2048;
        double v46 = v22;
        __int16 v47 = 2048;
        double v48 = v24;
        __int16 v49 = 2048;
        double v50 = v26;
        __int16 v51 = 2048;
        double v52 = v28;
        _os_log_error_impl(&dword_18B625000, v29, OS_LOG_TYPE_ERROR, "[Likeness] Attempting to crop image with cropRect (%.2f, %.2f, %.2f, %.2f) extending beyond image of size (%.2f x %.2f). Displaying with a centered square cropRect instead.", (uint8_t *)&v41, 0x3Eu);
      }

      objc_msgSend(MEMORY[0x1E4F5A420], "centeredSquareCropRectInRect:", 0.0, 0.0, v26, v28);
      double v18 = v30;
      double v20 = v31;
      double v22 = v32;
      double v24 = v33;
    }
    v34 = v15;
    v35 = [(UIImage *)v34 CGImage];
    v56.origin.double x = v18;
    v56.origin.double y = v20;
    v56.size.double width = v22;
    v56.size.double height = v24;
    v36 = CGImageCreateWithImageInRect(v35, v56);
    v37 = (void *)MEMORY[0x1E4FB1818];
    [(UIImage *)v34 scale];
    objc_msgSend(v37, "imageWithCGImage:scale:orientation:", v36, -[UIImage imageOrientation](v34, "imageOrientation"), v38);
    v39 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v40 = self->_avatarImage;
    self->_avatarImage = v39;

    CGImageRelease(v36);
    int v9 = self->_avatarImage;
  }
  else
  {
    v16 = self->_avatarImage;
    self->_avatarImage = 0;

    int v9 = 0;
  }
LABEL_6:

  return v9;
}

- (BOOL)hasImageDataAvailable
{
  v3 = [(CNVisualIdentity *)self thumbnailImageData];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    char v5 = [(CNVisualIdentity *)self imageData];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)updateGroupName:(id)a3
{
  id v5 = a3;
  if ([(CNVisualIdentity *)self canUpdateGroupName])
  {
    [(CNVisualIdentity *)self setName:v5];
    BOOL v4 = [(id)objc_opt_class() abbreviatedNameForGroupName:v5];
    [(CNVisualIdentity *)self setAbbreviatedName:v4];
  }
}

- (void)updateImageType:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F1B8F8] stringIdentifierForImageType:a3];
  [(CNVisualIdentity *)self setImageType:v4];
}

- (void)updateImageForContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNVisualIdentity *)self imageData];
  [v4 setImageData:v5];

  v6 = [(CNVisualIdentity *)self thumbnailImageData];
  [v4 setThumbnailImageData:v6];

  v7 = [(CNVisualIdentity *)self fullscreenImageData];
  [v4 setFullscreenImageData:v7];

  [(CNVisualIdentity *)self cropRect];
  objc_msgSend(v4, "setCropRect:");
  v8 = [(CNVisualIdentity *)self imageHash];
  [v4 setImageHash:v8];

  int v9 = [(CNVisualIdentity *)self imageType];
  [v4 setImageType:v9];

  v10 = [(CNVisualIdentity *)self memojiMetadata];
  [v4 setMemojiMetadata:v10];

  id v11 = [(CNVisualIdentity *)self wallpaper];
  [v4 setWallpaper:v11];
}

- (void)updateContactWithGivenName:(id)a3 familyName:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(CNVisualIdentity *)self contacts];
  int v9 = [v8 firstObject];
  v10 = (void *)[v9 mutableCopy];

  if (v10)
  {
    [v10 setGivenName:v6];
    [v10 setFamilyName:v7];
    id v11 = [v10 freeze];
    v20[0] = v11;
    BOOL v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    v13 = [(CNVisualIdentity *)self contacts];
    v14 = objc_msgSend(v13, "_cn_tail");
    v15 = [v12 arrayByAddingObjectsFromArray:v14];
    [(CNVisualIdentity *)self setContacts:v15];

    v16 = [MEMORY[0x1E4F1B910] stringFromContact:v10 style:0];
    name = self->_name;
    self->_name = v16;

    double v18 = [MEMORY[0x1E4F1B910] stringFromContact:v10 style:1002];
    abbreviatedName = self->_abbreviatedName;
    self->_abbreviatedName = v18;
  }
}

- (void)clearImageAndWallpaper
{
  [(CNVisualIdentity *)self clearImage];

  [(CNVisualIdentity *)self clearWallpaper];
}

- (void)clearWallpaper
{
}

- (void)clearImage
{
  [(CNVisualIdentity *)self setImageData:0];
  [(CNVisualIdentity *)self setThumbnailImageData:0];
  [(CNVisualIdentity *)self setFullscreenImageData:0];
  -[CNVisualIdentity setCropRect:](self, "setCropRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CNVisualIdentity *)self setImageHash:0];
  [(CNVisualIdentity *)self setImageType:0];

  [(CNVisualIdentity *)self setMemojiMetadata:0];
}

- (int64_t)contactImageSource
{
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  v3 = [(CNVisualIdentity *)self imageType];
  int64_t v4 = [v2 rawImageSourceForIdentifier:v3];

  return v4;
}

- (unint64_t)contactImageType
{
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  v3 = [(CNVisualIdentity *)self imageType];
  unint64_t v4 = [v2 rawImageTypeForIdentifier:v3];

  return v4;
}

- (BOOL)hasLinkedContacts
{
  uint64_t v2 = *MEMORY[0x1E4F5A258];
  v3 = [(CNVisualIdentity *)self linkedContacts];
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3) ^ 1;

  return v2;
}

- (NSString)abbreviatedName
{
  if ([(NSArray *)self->_contacts count] == 1)
  {
    p_abbreviatedName = &self->_abbreviatedName;
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
    {
      unint64_t v4 = [(NSArray *)self->_contacts firstObject];
      id v5 = [MEMORY[0x1E4F1B910] stringFromContact:v4 style:1002];
      abbreviatedName = self->_abbreviatedName;
      self->_abbreviatedName = v5;
    }
  }
  else
  {
    p_abbreviatedName = &self->_abbreviatedName;
  }
  id v7 = *p_abbreviatedName;

  return v7;
}

- (NSString)shortenedDisplayName
{
  if ([(NSArray *)self->_contacts count] == 1)
  {
    p_shortenedDisplayName = &self->_shortenedDisplayName;
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
    {
      unint64_t v4 = [(NSArray *)self->_contacts firstObject];
      id v5 = [v4 givenName];
      shortenedDisplayName = self->_shortenedDisplayName;
      self->_shortenedDisplayName = v5;
    }
  }
  else
  {
    p_shortenedDisplayName = &self->_shortenedDisplayName;
  }
  id v7 = *p_shortenedDisplayName;

  return v7;
}

- (NSString)name
{
  if ([(NSArray *)self->_contacts count] == 1)
  {
    p_name = &self->_name;
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
    {
      unint64_t v4 = [(NSArray *)self->_contacts firstObject];
      id v5 = [MEMORY[0x1E4F1B910] stringFromContact:v4 style:0];
      name = self->_name;
      self->_name = v5;
    }
  }
  else
  {
    p_name = &self->_name;
  }
  id v7 = *p_name;

  return v7;
}

- (void)setCropRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_cropRect))
  {
    self->_cropRect.origin.CGFloat x = x;
    self->_cropRect.origin.CGFloat y = y;
    self->_cropRect.size.CGFloat width = width;
    self->_cropRect.size.CGFloat height = height;
    avatarImage = self->_avatarImage;
    self->_avatarImage = 0;
  }
}

- (void)setImageData:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToData:self->_imageData] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_imageData, a3);
    avatarImage = self->_avatarImage;
    self->_avatarImage = 0;
  }
}

- (void)setThumbnailImageData:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToData:self->_thumbnailImageData] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_thumbnailImageData, a3);
    avatarImage = self->_avatarImage;
    self->_avatarImage = 0;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_alloc_init(CNVisualIdentity);
  id v5 = [(CNVisualIdentity *)self imageData];
  [(CNVisualIdentity *)v4 setImageData:v5];

  id v6 = [(CNVisualIdentity *)self name];
  [(CNVisualIdentity *)v4 setName:v6];

  id v7 = [(CNVisualIdentity *)self abbreviatedName];
  [(CNVisualIdentity *)v4 setAbbreviatedName:v7];

  v8 = [(CNVisualIdentity *)self imageHash];
  [(CNVisualIdentity *)v4 setImageHash:v8];

  [(CNVisualIdentity *)self cropRect];
  -[CNVisualIdentity setCropRect:](v4, "setCropRect:");
  int v9 = [(CNVisualIdentity *)self imageType];
  [(CNVisualIdentity *)v4 setImageType:v9];

  v10 = [(CNVisualIdentity *)self identifier];
  [(CNVisualIdentity *)v4 setIdentifier:v10];

  id v11 = [(CNVisualIdentity *)self thumbnailImageData];
  [(CNVisualIdentity *)v4 setThumbnailImageData:v11];

  BOOL v12 = [(CNVisualIdentity *)self fullscreenImageData];
  [(CNVisualIdentity *)v4 setFullscreenImageData:v12];

  v13 = [(CNVisualIdentity *)self linkedContacts];
  [(CNVisualIdentity *)v4 setLinkedContacts:v13];

  v14 = [(CNVisualIdentity *)self contacts];
  [(CNVisualIdentity *)v4 setContacts:v14];

  [(CNVisualIdentity *)v4 setIdentityType:[(CNVisualIdentity *)self identityType]];
  v15 = [(CNVisualIdentity *)self memojiMetadata];
  [(CNVisualIdentity *)v4 setMemojiMetadata:v15];

  v16 = [(CNVisualIdentity *)self wallpaper];
  [(CNVisualIdentity *)v4 setWallpaper:v16];

  return v4;
}

- (CNVisualIdentity)initWithGroupIdentity:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CNVisualIdentity;
  id v5 = [(CNVisualIdentity *)&v32 init];
  if (v5)
  {
    if ([v4 numberOfContacts] == 1)
    {
      id v6 = [v4 contacts];
      id v7 = [v6 firstObject];
      id v5 = [(CNVisualIdentity *)v5 initWithContact:v7];
    }
    else
    {
      uint64_t v8 = [v4 groupPhoto];
      imageData = v5->_imageData;
      v5->_imageData = (NSData *)v8;

      uint64_t v10 = [v4 groupName];
      name = v5->_name;
      v5->_name = (NSString *)v10;

      uint64_t v12 = *MEMORY[0x1E4F5A298];
      v13 = [v4 groupName];
      if ((*(unsigned int (**)(uint64_t, void *))(v12 + 16))(v12, v13))
      {
        abbreviatedName = v5->_abbreviatedName;
        v5->_abbreviatedName = 0;
      }
      else
      {
        v15 = objc_opt_class();
        abbreviatedName = [v4 groupName];
        uint64_t v16 = [v15 abbreviatedNameForGroupName:abbreviatedName];
        double v17 = v5->_abbreviatedName;
        v5->_abbreviatedName = (NSString *)v16;
      }
      imageHash = v5->_imageHash;
      v5->_imageHash = 0;

      CGSize v19 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      v5->_cropRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      v5->_cropRect.size = v19;
      v5->_imageType = 0;
      uint64_t v20 = [v4 identifier];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v20;

      uint64_t v22 = [v4 groupPhoto];
      thumbnailImageData = v5->_thumbnailImageData;
      v5->_thumbnailImageData = (NSData *)v22;

      fullscreenImageData = v5->_fullscreenImageData;
      v5->_fullscreenImageData = 0;

      linkedContacts = v5->_linkedContacts;
      v5->_linkedContacts = 0;

      uint64_t v26 = [v4 contacts];
      contacts = v5->_contacts;
      v5->_contacts = (NSArray *)v26;

      memojiMetadata = v5->_memojiMetadata;
      v5->_memojiMetadata = 0;

      if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
      {
        v29 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v31[0] = 0;
          _os_log_impl(&dword_18B625000, v29, OS_LOG_TYPE_DEFAULT, "[CNVisualIdentity] Attempting to create a group visual identity from a group containing 0 contacts.", (uint8_t *)v31, 2u);
        }
      }
      v5->_identityType = 1;
    }
  }

  return v5;
}

- (CNVisualIdentity)initWithContact:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CNVisualIdentity;
  id v5 = [(CNVisualIdentity *)&v35 init];
  if (v5)
  {
    id v6 = +[CNVisualIdentity descriptorForImageKeys];
    v37[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    int v8 = [v4 areKeysAvailable:v7];

    if (v8)
    {
      uint64_t v9 = [v4 imageData];
      imageData = v5->_imageData;
      v5->_imageData = (NSData *)v9;

      uint64_t v11 = [v4 imageHash];
      imageHash = v5->_imageHash;
      v5->_imageHash = (NSData *)v11;

      [v4 cropRect];
      v5->_cropRect.origin.CGFloat x = v13;
      v5->_cropRect.origin.CGFloat y = v14;
      v5->_cropRect.size.CGFloat width = v15;
      v5->_cropRect.size.CGFloat height = v16;
      v5->_imageType = (NSString *)(id)[v4 imageType];
      uint64_t v17 = [v4 thumbnailImageData];
      thumbnailImageData = v5->_thumbnailImageData;
      v5->_thumbnailImageData = (NSData *)v17;

      uint64_t v19 = [v4 fullscreenImageData];
      fullscreenImageData = v5->_fullscreenImageData;
      v5->_fullscreenImageData = (NSData *)v19;

      uint64_t v21 = [v4 memojiMetadata];
      memojiMetadata = v5->_memojiMetadata;
      v5->_memojiMetadata = (NSData *)v21;

      uint64_t v23 = [v4 wallpaper];
      wallpaper = v5->_wallpaper;
      v5->_wallpaper = (CNWallpaper *)v23;
    }
    uint64_t v25 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v25;

    uint64_t v27 = [v4 linkedContacts];
    linkedContacts = v5->_linkedContacts;
    v5->_linkedContacts = (NSArray *)v27;

    if (v4)
    {
      id v36 = v4;
      uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
      p_super = &v5->_contacts->super;
      v5->_contacts = (NSArray *)v29;
    }
    else
    {
      contacts = v5->_contacts;
      v5->_contacts = (NSArray *)MEMORY[0x1E4F1CBF0];

      p_super = [(id)objc_opt_class() log];
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        __int16 v34 = 0;
      }
    }

    v5->_identityType = 0;
    objc_super v32 = v5;
  }

  return v5;
}

+ (id)abbreviatedNameForGroupName:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F5A298];
  if ((*(uint64_t (**)(void, id))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v3))
  {
    id v5 = 0;
    goto LABEL_20;
  }
  id v19 = v3;
  id v6 = [v3 componentsSeparatedByString:@" "];
  id v7 = objc_msgSend(v6, "_cn_take:", 2);

  int v8 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v9)
  {
    id v5 = &stru_1ED8AC728;
    goto LABEL_19;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v22;
  uint64_t v12 = *MEMORY[0x1E4F5A2A0];
  id v5 = &stru_1ED8AC728;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v22 != v11) {
        objc_enumerationMutation(obj);
      }
      CGFloat v14 = [(id)objc_opt_class() firstComposedCharacterFromString:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      BOOL v15 = +[CNUIStringUtilities stringIsSingleEmoji:v14];
      int v16 = objc_msgSend(v14, "_cn_containsCharacterInSet:", v8);
      if (v15)
      {
        if ((((*(unsigned int (**)(uint64_t, __CFString *))(v4 + 16))(v4, v5) | v16) & 1) == 0) {
          goto LABEL_15;
        }
      }
      else if (!v16)
      {
        goto LABEL_15;
      }
      if (!(*(unsigned int (**)(uint64_t, __CFString *))(v12 + 16))(v12, v5)
        || +[CNUIStringUtilities stringContainsEmoji:v5] == v15)
      {
        uint64_t v17 = [(__CFString *)v5 stringByAppendingString:v14];

        id v5 = (__CFString *)v17;
      }
LABEL_15:
    }
    uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v10);
LABEL_19:

  id v3 = v19;
LABEL_20:

  return v5;
}

+ (id)firstComposedCharacterFromString:(id)a3
{
  id v3 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    uint64_t v4 = [v3 rangeOfComposedCharacterSequenceAtIndex:0];
    objc_msgSend(v3, "substringWithRange:", v4, v5);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = &stru_1ED8AC728;
  }

  return v6;
}

+ (id)descriptorForImageKeys
{
  if (descriptorForImageKeys_cn_once_token_3 != -1) {
    dispatch_once(&descriptorForImageKeys_cn_once_token_3, &__block_literal_global_9_31262);
  }
  uint64_t v2 = (void *)descriptorForImageKeys_cn_once_object_3;

  return v2;
}

void __42__CNVisualIdentity_descriptorForImageKeys__block_invoke()
{
  v9[8] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1B8F8];
  uint64_t v1 = *MEMORY[0x1E4F1AF98];
  v9[0] = *MEMORY[0x1E4F1AE28];
  v9[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1AE30];
  v9[2] = *MEMORY[0x1E4F1ADA8];
  v9[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1ADE8];
  v9[4] = *MEMORY[0x1E4F1AE48];
  v9[5] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AFB8];
  v9[6] = *MEMORY[0x1E4F1AE98];
  v9[7] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:8];
  id v6 = [NSString stringWithUTF8String:"+[CNVisualIdentity descriptorForImageKeys]_block_invoke"];
  uint64_t v7 = [v0 descriptorWithKeyDescriptors:v5 description:v6];
  int v8 = (void *)descriptorForImageKeys_cn_once_object_3;
  descriptorForImageKeys_cn_once_object_3 = v7;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_2_31265 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_2_31265, &__block_literal_global_4_31266);
  }
  uint64_t v2 = (void *)descriptorForRequiredKeys_cn_once_object_2_31267;

  return v2;
}

void __45__CNVisualIdentity_descriptorForRequiredKeys__block_invoke()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1B8F8];
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F1B910], "descriptorForRequiredKeysForStyle:", 0, *MEMORY[0x1E4F1AE08], *MEMORY[0x1E4F1AE88]);
  v6[2] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  uint64_t v3 = [NSString stringWithUTF8String:"+[CNVisualIdentity descriptorForRequiredKeys]_block_invoke"];
  uint64_t v4 = [v0 descriptorWithKeyDescriptors:v2 description:v3];
  uint64_t v5 = (void *)descriptorForRequiredKeys_cn_once_object_2_31267;
  descriptorForRequiredKeys_cn_once_object_2_31267 = v4;
}

+ (id)log
{
  if (log_cn_once_token_1_31269 != -1) {
    dispatch_once(&log_cn_once_token_1_31269, &__block_literal_global_31270);
  }
  uint64_t v2 = (void *)log_cn_once_object_1_31271;

  return v2;
}

void __23__CNVisualIdentity_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNVisualIdentity");
  uint64_t v1 = (void *)log_cn_once_object_1_31271;
  log_cn_once_object_1_31271 = (uint64_t)v0;
}

@end