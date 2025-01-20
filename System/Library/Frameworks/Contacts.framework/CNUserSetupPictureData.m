@interface CNUserSetupPictureData
+ (BOOL)supportsSecureCoding;
+ (id)log;
+ (id)userSetupPictureDataFromData:(id)a3;
- (CGRect)cropRect;
- (CNUserSetupPictureData)initWithCoder:(id)a3;
- (CNUserSetupPictureData)initWithImageData:(id)a3 thumbnailImageData:(id)a4 cropRect:(CGRect)a5 memojiMetadata:(id)a6;
- (NSData)imageData;
- (NSData)memojiMetadata;
- (NSData)thumbnailImageData;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setImageData:(id)a3;
- (void)setMemojiMetadata:(id)a3;
- (void)setThumbnailImageData:(id)a3;
@end

@implementation CNUserSetupPictureData

+ (id)log
{
  if (log_cn_once_token_0_2 != -1) {
    dispatch_once(&log_cn_once_token_0_2, &__block_literal_global_39);
  }
  v2 = (void *)log_cn_once_object_0_2;

  return v2;
}

uint64_t __29__CNUserSetupPictureData_log__block_invoke()
{
  log_cn_once_object_0_2 = (uint64_t)os_log_create("com.apple.contacts.ui", "CNUserSetupPictureData");

  return MEMORY[0x1F41817F8]();
}

+ (id)userSetupPictureDataFromData:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F28DC0];
    id v4 = a3;
    id v9 = 0;
    v5 = [v3 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v9];

    id v6 = v9;
    if (!v5)
    {
      v7 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[CNUserSetupPictureData userSetupPictureDataFromData:]((uint64_t)v6, v7);
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CNUserSetupPictureData)initWithImageData:(id)a3 thumbnailImageData:(id)a4 cropRect:(CGRect)a5 memojiMetadata:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CNUserSetupPictureData;
  v17 = [(CNUserSetupPictureData *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_imageData, a3);
    objc_storeStrong((id *)&v18->_thumbnailImageData, a4);
    v18->_cropRect.origin.CGFloat x = x;
    v18->_cropRect.origin.CGFloat y = y;
    v18->_cropRect.size.CGFloat width = width;
    v18->_cropRect.size.CGFloat height = height;
    objc_storeStrong((id *)&v18->_memojiMetadata, a6);
    v19 = v18;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNUserSetupPictureData)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeIntForKey:@"version"];
  if (v5 >= 2)
  {
    int v15 = v5;
    id v16 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CNUserSetupPictureData initWithCoder:](v15, v16);
    }

    id v14 = 0;
  }
  else
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thumbnailImageData"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cropRect"];
    NSRect v18 = NSRectFromString(v8);
    double x = v18.origin.x;
    double y = v18.origin.y;
    double width = v18.size.width;
    double height = v18.size.height;
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"memojiMetadata"];
    self = -[CNUserSetupPictureData initWithImageData:thumbnailImageData:cropRect:memojiMetadata:](self, "initWithImageData:thumbnailImageData:cropRect:memojiMetadata:", v6, v7, v13, x, y, width, height);

    id v14 = self;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:1 forKey:@"version"];
  int v5 = [(CNUserSetupPictureData *)self imageData];
  [v4 encodeObject:v5 forKey:@"imageData"];

  id v6 = [(CNUserSetupPictureData *)self thumbnailImageData];
  [v4 encodeObject:v6 forKey:@"thumbnailImageData"];

  [(CNUserSetupPictureData *)self cropRect];
  v7 = NSStringFromRect(v10);
  [v4 encodeObject:v7 forKey:@"cropRect"];

  id v8 = [(CNUserSetupPictureData *)self memojiMetadata];
  [v4 encodeObject:v8 forKey:@"memojiMetadata"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CNUserSetupPictureData alloc];
  int v5 = [(CNUserSetupPictureData *)self imageData];
  id v6 = [(CNUserSetupPictureData *)self thumbnailImageData];
  [(CNUserSetupPictureData *)self cropRect];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  int v15 = [(CNUserSetupPictureData *)self memojiMetadata];
  id v16 = -[CNUserSetupPictureData initWithImageData:thumbnailImageData:cropRect:memojiMetadata:](v4, "initWithImageData:thumbnailImageData:cropRect:memojiMetadata:", v5, v6, v15, v8, v10, v12, v14);

  return v16;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (NSData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (void)setThumbnailImageData:(id)a3
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

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (NSData)memojiMetadata
{
  return self->_memojiMetadata;
}

- (void)setMemojiMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memojiMetadata, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);

  objc_storeStrong((id *)&self->_imageData, 0);
}

+ (void)userSetupPictureDataFromData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Error unarchiving setup user picture data: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Unknown versions for Setup User picture data: %ld", (uint8_t *)&v2, 0xCu);
}

@end