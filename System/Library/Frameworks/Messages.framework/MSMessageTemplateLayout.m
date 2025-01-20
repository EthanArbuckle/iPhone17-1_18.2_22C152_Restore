@interface MSMessageTemplateLayout
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MSMessageTemplateLayout)init;
- (MSMessageTemplateLayout)initWithCoder:(id)a3;
- (NSData)mediaData;
- (NSString)caption;
- (NSString)imageSubtitle;
- (NSString)imageTitle;
- (NSString)mediaType;
- (NSString)subcaption;
- (NSString)trailingCaption;
- (NSString)trailingSubcaption;
- (NSURL)mediaFileURL;
- (UIImage)image;
- (id)_sanitizedCopy;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCaption:(NSString *)caption;
- (void)setImage:(UIImage *)image;
- (void)setImageSubtitle:(NSString *)imageSubtitle;
- (void)setImageTitle:(NSString *)imageTitle;
- (void)setMediaData:(id)a3;
- (void)setMediaFileURL:(NSURL *)mediaFileURL;
- (void)setMediaType:(id)a3;
- (void)setSubcaption:(NSString *)subcaption;
- (void)setTrailingCaption:(NSString *)trailingCaption;
- (void)setTrailingSubcaption:(NSString *)trailingSubcaption;
@end

@implementation MSMessageTemplateLayout

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSMessageTemplateLayout)init
{
  v11.receiver = self;
  v11.super_class = (Class)MSMessageTemplateLayout;
  v2 = [(MSMessageLayout *)&v11 _init];
  v3 = v2;
  if (v2)
  {
    caption = v2->_caption;
    v2->_caption = (NSString *)&stru_1F4067188;

    subcaption = v3->_subcaption;
    v3->_subcaption = (NSString *)&stru_1F4067188;

    trailingCaption = v3->_trailingCaption;
    v3->_trailingCaption = (NSString *)&stru_1F4067188;

    trailingSubcaption = v3->_trailingSubcaption;
    v3->_trailingSubcaption = (NSString *)&stru_1F4067188;

    imageTitle = v3->_imageTitle;
    v3->_imageTitle = (NSString *)&stru_1F4067188;

    imageSubtitle = v3->_imageSubtitle;
    v3->_imageSubtitle = (NSString *)&stru_1F4067188;
  }
  return v3;
}

- (MSMessageTemplateLayout)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MSMessageTemplateLayout;
  v5 = [(MSMessageLayout *)&v23 _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"caption"];
    caption = v5->_caption;
    v5->_caption = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subcaption"];
    subcaption = v5->_subcaption;
    v5->_subcaption = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trailingCaption"];
    trailingCaption = v5->_trailingCaption;
    v5->_trailingCaption = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trailingSubcaption"];
    trailingSubcaption = v5->_trailingSubcaption;
    v5->_trailingSubcaption = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageTitle"];
    imageTitle = v5->_imageTitle;
    v5->_imageTitle = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageSubitle"];
    imageSubtitle = v5->_imageSubtitle;
    v5->_imageSubtitle = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaType"];
    mediaType = v5->_mediaType;
    v5->_mediaType = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaData"];
    mediaData = v5->_mediaData;
    v5->_mediaData = (NSData *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  [v13 encodeObject:self->_caption forKey:@"caption"];
  [v13 encodeObject:self->_subcaption forKey:@"subcaption"];
  [v13 encodeObject:self->_trailingCaption forKey:@"trailingCaption"];
  [v13 encodeObject:self->_trailingSubcaption forKey:@"trailingSubcaption"];
  id v4 = self->_mediaData;
  v5 = self->_mediaType;
  uint64_t v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    image = self->_image;
    if (image)
    {
      uint64_t v9 = [(UIImage *)image __ms_PNGData];

      uint64_t v10 = (NSString *)(id)*MEMORY[0x1E4F22678];
    }
    else
    {
      mediaFileURL = self->_mediaFileURL;
      if (!mediaFileURL) {
        goto LABEL_11;
      }
      uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:mediaFileURL options:8 error:0];

      uint64_t v10 = [(NSURL *)self->_mediaFileURL __ms_UTI];
    }
    uint64_t v12 = v10;
    id v4 = (NSData *)v9;

    uint64_t v6 = v12;
  }
LABEL_11:
  [v13 encodeObject:v6 forKey:@"mediaType"];
  [v13 encodeObject:v4 forKey:@"mediaData"];
  [v13 encodeObject:self->_imageTitle forKey:@"imageTitle"];
  [v13 encodeObject:self->_imageSubtitle forKey:@"imageSubitle"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[MSMessageTemplateLayout allocWithZone:](MSMessageTemplateLayout, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSString *)self->_caption copyWithZone:a3];
  [(MSMessageTemplateLayout *)v5 setCaption:v6];

  BOOL v7 = (void *)[(NSString *)self->_subcaption copyWithZone:a3];
  [(MSMessageTemplateLayout *)v5 setSubcaption:v7];

  uint64_t v8 = (void *)[(NSString *)self->_trailingCaption copyWithZone:a3];
  [(MSMessageTemplateLayout *)v5 setTrailingCaption:v8];

  uint64_t v9 = (void *)[(NSString *)self->_trailingSubcaption copyWithZone:a3];
  [(MSMessageTemplateLayout *)v5 setTrailingSubcaption:v9];

  [(MSMessageTemplateLayout *)v5 setImage:self->_image];
  uint64_t v10 = (void *)[(NSURL *)self->_mediaFileURL copy];
  [(MSMessageTemplateLayout *)v5 setMediaFileURL:v10];

  objc_super v11 = (void *)[(NSString *)self->_imageTitle copyWithZone:a3];
  [(MSMessageTemplateLayout *)v5 setImageTitle:v11];

  uint64_t v12 = (void *)[(NSString *)self->_imageSubtitle copyWithZone:a3];
  [(MSMessageTemplateLayout *)v5 setImageSubtitle:v12];

  id v13 = (void *)[(NSData *)self->_mediaData copyWithZone:a3];
  [(MSMessageTemplateLayout *)v5 setMediaData:v13];

  uint64_t v14 = (void *)[(NSString *)self->_mediaType copyWithZone:a3];
  [(MSMessageTemplateLayout *)v5 setMediaType:v14];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MSMessageTemplateLayout *)a3;
  if (v4 == self)
  {
    char v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      caption = self->_caption;
      BOOL v7 = [(MSMessageTemplateLayout *)v5 caption];
      if (caption == v7 || [(NSString *)caption isEqualToString:v7])
      {
        subcaption = self->_subcaption;
        uint64_t v9 = [(MSMessageTemplateLayout *)v5 subcaption];
        if (subcaption == v9 || [(NSString *)subcaption isEqualToString:v9])
        {
          trailingCaption = self->_trailingCaption;
          objc_super v11 = [(MSMessageTemplateLayout *)v5 trailingCaption];
          if (trailingCaption == v11 || [(NSString *)trailingCaption isEqualToString:v11])
          {
            trailingSubcaption = self->_trailingSubcaption;
            id v13 = [(MSMessageTemplateLayout *)v5 trailingSubcaption];
            if (trailingSubcaption == v13 || [(NSString *)trailingSubcaption isEqualToString:v13])
            {
              imageTitle = self->_imageTitle;
              v15 = [(MSMessageTemplateLayout *)v5 imageTitle];
              if (imageTitle == v15 || [(NSString *)imageTitle isEqualToString:v15])
              {
                imageSubtitle = self->_imageSubtitle;
                v17 = [(MSMessageTemplateLayout *)v5 imageSubtitle];
                if (imageSubtitle == v17) {
                  char v18 = 1;
                }
                else {
                  char v18 = [(NSString *)imageSubtitle isEqualToString:v17];
                }
              }
              else
              {
                char v18 = 0;
              }
            }
            else
            {
              char v18 = 0;
            }
          }
          else
          {
            char v18 = 0;
          }
        }
        else
        {
          char v18 = 0;
        }
      }
      else
      {
        char v18 = 0;
      }
    }
    else
    {
      char v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_caption hash];
  NSUInteger v4 = [(NSString *)self->_subcaption hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_trailingCaption hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_trailingSubcaption hash];
  NSUInteger v7 = [(NSString *)self->_imageTitle hash];
  return v6 ^ v7 ^ [(NSString *)self->_imageSubtitle hash];
}

- (void)setMediaFileURL:(NSURL *)mediaFileURL
{
  uint64_t v10 = mediaFileURL;
  mediaType = self->_mediaType;
  self->_mediaType = 0;

  mediaData = self->_mediaData;
  self->_mediaData = 0;

  NSUInteger v6 = [MEMORY[0x1E4F1CA98] null];
  char v7 = [(NSURL *)v10 isEqual:v6];

  uint64_t v8 = 0;
  if ((v7 & 1) == 0) {
    uint64_t v8 = v10;
  }
  uint64_t v9 = self->_mediaFileURL;
  self->_mediaFileURL = v8;
}

- (NSURL)mediaFileURL
{
  mediaFileURL = self->_mediaFileURL;
  if (!mediaFileURL)
  {
    if (self->_mediaData && self->_mediaType)
    {
      NSUInteger v4 = +[_MSTempFileManager sharedInstance];
      NSUInteger v5 = [v4 writeTemporaryFileWithData:self->_mediaData type:self->_mediaType];
      NSUInteger v6 = self->_mediaFileURL;
      self->_mediaFileURL = v5;

      mediaFileURL = self->_mediaFileURL;
    }
    else
    {
      mediaFileURL = 0;
    }
  }

  return mediaFileURL;
}

- (void)setImage:(UIImage *)image
{
  NSUInteger v4 = image;
  mediaType = self->_mediaType;
  self->_mediaType = 0;

  mediaData = self->_mediaData;
  self->_mediaData = 0;

  char v7 = self->_image;
  self->_image = v4;
}

- (UIImage)image
{
  if (!self->_image)
  {
    if (!self->_mediaFileURL || self->_mediaData && self->_mediaType) {
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfURL:options:error:");
    NSUInteger v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    mediaData = self->_mediaData;
    self->_mediaData = v5;

    char v7 = [(NSURL *)self->_mediaFileURL __ms_UTI];
    mediaType = self->_mediaType;
    self->_mediaType = v7;

    if (!self->_image)
    {
LABEL_15:
      if (self->_mediaData)
      {
        CFStringRef v9 = (const __CFString *)self->_mediaType;
        if (v9)
        {
          if (UTTypeConformsTo(v9, (CFStringRef)*MEMORY[0x1E4F225F8]))
          {
            uint64_t v10 = [MEMORY[0x1E4F42A80] imageWithData:self->_mediaData];
            image = self->_image;
            self->_image = v10;
          }
        }
      }
    }
  }
  NSUInteger v3 = self->_image;

  return v3;
}

- (id)_sanitizedCopy
{
  v2 = (void *)[(MSMessageTemplateLayout *)self copy];
  [v2 setCaption:0];
  [v2 setSubcaption:0];
  [v2 setTrailingCaption:0];
  [v2 setTrailingSubcaption:0];
  [v2 setImageTitle:0];
  [v2 setImageSubtitle:0];

  return v2;
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(NSString *)caption
{
}

- (NSString)subcaption
{
  return self->_subcaption;
}

- (void)setSubcaption:(NSString *)subcaption
{
}

- (NSString)trailingCaption
{
  return self->_trailingCaption;
}

- (void)setTrailingCaption:(NSString *)trailingCaption
{
}

- (NSString)trailingSubcaption
{
  return self->_trailingSubcaption;
}

- (void)setTrailingSubcaption:(NSString *)trailingSubcaption
{
}

- (NSData)mediaData
{
  return self->_mediaData;
}

- (void)setMediaData:(id)a3
{
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
}

- (NSString)imageTitle
{
  return self->_imageTitle;
}

- (void)setImageTitle:(NSString *)imageTitle
{
}

- (NSString)imageSubtitle
{
  return self->_imageSubtitle;
}

- (void)setImageSubtitle:(NSString *)imageSubtitle
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSubtitle, 0);
  objc_storeStrong((id *)&self->_imageTitle, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_mediaData, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_mediaFileURL, 0);
  objc_storeStrong((id *)&self->_trailingSubcaption, 0);
  objc_storeStrong((id *)&self->_trailingCaption, 0);
  objc_storeStrong((id *)&self->_subcaption, 0);

  objc_storeStrong((id *)&self->_caption, 0);
}

@end