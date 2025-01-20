@interface IMNicknameAvatarImage
+ (BOOL)supportsSecureCoding;
- (BOOL)_writeImageData:(id)a3 path:(id)a4 error:(id *)a5;
- (BOOL)contentIsSensitive;
- (BOOL)hasImage;
- (BOOL)imageExists;
- (IMNicknameAvatarImage)init;
- (IMNicknameAvatarImage)initWithCoder:(id)a3;
- (IMNicknameAvatarImage)initWithDictionaryRepresentation:(id)a3;
- (IMNicknameAvatarImage)initWithImageName:(id)a3 imageData:(id)a4 imageFilePath:(id)a5 contentIsSensitive:(BOOL)a6;
- (IMNicknameAvatarImage)initWithImageName:(id)a3 imageData:(id)a4 imageFilePath:(id)a5 contentIsSensitive:(BOOL)a6 error:(id *)a7;
- (IMNicknameAvatarImage)initWithImageName:(id)a3 imageFilePath:(id)a4 contentIsSensitive:(BOOL)a5;
- (IMNicknameAvatarImage)initWithPublicDictionaryMetadataRepresentation:(id)a3;
- (IMNicknameAvatarImage)initWithPublicDictionaryMetadataRepresentation:(id)a3 imageData:(id)a4 imageFilePath:(id)a5 contentIsSensitive:(BOOL)a6 error:(id *)a7;
- (NSString)imageFilePath;
- (NSString)imageName;
- (id)description;
- (id)dictionaryRepresentation;
- (id)imageData;
- (id)loadAndReturnImageData;
- (id)publicDictionaryMetadataRepresentation;
- (id)publicDictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMNicknameAvatarImage

- (IMNicknameAvatarImage)init
{
  return [(IMNicknameAvatarImage *)self initWithImageName:0 imageFilePath:0 contentIsSensitive:0];
}

- (IMNicknameAvatarImage)initWithImageName:(id)a3 imageFilePath:(id)a4 contentIsSensitive:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IMNicknameAvatarImage;
  v10 = [(IMNicknameAvatarImage *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    imageName = v10->_imageName;
    v10->_imageName = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    imageFilePath = v10->_imageFilePath;
    v10->_imageFilePath = (NSString *)v13;

    v10->_contentIsSensitive = a5;
  }

  return v10;
}

- (IMNicknameAvatarImage)initWithImageName:(id)a3 imageData:(id)a4 imageFilePath:(id)a5 contentIsSensitive:(BOOL)a6
{
  return (IMNicknameAvatarImage *)MEMORY[0x1F4181798](self, sel_initWithImageName_imageData_imageFilePath_contentIsSensitive_error_);
}

- (IMNicknameAvatarImage)initWithImageName:(id)a3 imageData:(id)a4 imageFilePath:(id)a5 contentIsSensitive:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a3;
  [(IMNicknameAvatarImage *)self _writeImageData:a4 path:v12 error:a7];
  v14 = [(IMNicknameAvatarImage *)self initWithImageName:v13 imageFilePath:v12 contentIsSensitive:v8];

  return v14;
}

- (IMNicknameAvatarImage)initWithPublicDictionaryMetadataRepresentation:(id)a3
{
  v4 = [a3 objectForKey:@"imageName"];
  v5 = [(IMNicknameAvatarImage *)self initWithImageName:v4 imageFilePath:0 contentIsSensitive:0];

  return v5;
}

- (IMNicknameAvatarImage)initWithPublicDictionaryMetadataRepresentation:(id)a3 imageData:(id)a4 imageFilePath:(id)a5 contentIsSensitive:(BOOL)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a3;
  [(IMNicknameAvatarImage *)self _writeImageData:a4 path:v12 error:a7];
  self->_contentIsSensitive = a6;
  v14 = [(IMNicknameAvatarImage *)self initWithPublicDictionaryMetadataRepresentation:v13];

  if (v14)
  {
    uint64_t v15 = [v12 copy];
    imageFilePath = v14->_imageFilePath;
    v14->_imageFilePath = (NSString *)v15;
  }
  return v14;
}

- (IMNicknameAvatarImage)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"imageName"];
  v6 = [v4 objectForKey:@"imageFilePath"];
  v7 = [v4 objectForKey:@"contentIsSensitive"];

  BOOL v8 = -[IMNicknameAvatarImage initWithImageName:imageFilePath:contentIsSensitive:](self, "initWithImageName:imageFilePath:contentIsSensitive:", v5, v6, [v7 BOOLValue]);
  return v8;
}

- (id)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  imageName = self->_imageName;
  if (imageName) {
    CFDictionarySetValue(v3, @"imageName", imageName);
  }
  imageFilePath = self->_imageFilePath;
  if (imageFilePath) {
    CFDictionarySetValue(v4, @"imageFilePath", imageFilePath);
  }
  v7 = [NSNumber numberWithBool:self->_contentIsSensitive];
  if (v7) {
    CFDictionarySetValue(v4, @"contentIsSensitive", v7);
  }

  return v4;
}

- (id)publicDictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  imageName = self->_imageName;
  if (imageName) {
    CFDictionarySetValue(v3, @"imageName", imageName);
  }

  return v4;
}

- (id)publicDictionaryMetadataRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  imageName = self->_imageName;
  if (imageName) {
    CFDictionarySetValue(v3, @"imageName", imageName);
  }

  return v4;
}

- (BOOL)_writeImageData:(id)a3 path:(id)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 stringByDeletingLastPathComponent];
  IMSharedHelperEnsureDirectoryExistsAtPath((uint64_t)v9);

  id v14 = 0;
  char v10 = [v7 writeToFile:v8 options:1073741825 error:&v14];
  id v11 = v14;
  if ((v10 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v16 = v8;
        __int16 v17 = 2112;
        id v18 = v11;
        _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Failed to write avatar image data to path %@ with error %@ (imageExists will be NO)", buf, 0x16u);
      }
    }
    if (a5) {
      *a5 = v11;
    }
  }

  return v10;
}

- (id)loadAndReturnImageData
{
  return 0;
}

- (BOOL)hasImage
{
  v3 = [(IMNicknameAvatarImage *)self imageFilePath];
  if ([v3 length])
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = [(IMNicknameAvatarImage *)self imageFilePath];
    char v6 = [v4 fileExistsAtPath:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)imageData
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_imageFilePath length])
  {
    imageFilePath = self->_imageFilePath;
    id v8 = 0;
    id v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:imageFilePath options:0 error:&v8];
    id v5 = v8;
    if (v5 && IMOSLoggingEnabled())
    {
      char v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v5;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Error reading nickname avatar image data: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)imageExists
{
  v2 = [(IMNicknameAvatarImage *)self imageFilePath];
  if ([v2 length])
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v4 = [v3 fileExistsAtPath:v2];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMNicknameAvatarImage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageName"];
  char v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageFilePath"];
  uint64_t v7 = [v4 decodeBoolForKey:@"contentIsSensitive"];

  id v8 = [(IMNicknameAvatarImage *)self initWithImageName:v5 imageFilePath:v6 contentIsSensitive:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(IMNicknameAvatarImage *)self imageName];
  [v6 encodeObject:v4 forKey:@"imageName"];

  id v5 = [(IMNicknameAvatarImage *)self imageFilePath];
  [v6 encodeObject:v5 forKey:@"imageFilePath"];

  objc_msgSend(v6, "encodeBool:forKey:", -[IMNicknameAvatarImage contentIsSensitive](self, "contentIsSensitive"), @"contentIsSensitive");
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p imageName: %@ imageFilePath: %@, contentIsSensitive: %d>", objc_opt_class(), self, self->_imageName, self->_imageFilePath, self->_contentIsSensitive];
}

- (NSString)imageName
{
  return self->_imageName;
}

- (NSString)imageFilePath
{
  return self->_imageFilePath;
}

- (BOOL)contentIsSensitive
{
  return self->_contentIsSensitive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageFilePath, 0);

  objc_storeStrong((id *)&self->_imageName, 0);
}

@end