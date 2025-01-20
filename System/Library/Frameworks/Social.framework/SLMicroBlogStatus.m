@interface SLMicroBlogStatus
+ (BOOL)supportsSecureCoding;
- (NSArray)imageAssetURLs;
- (NSArray)imageData;
- (NSString)inReplyToStatusID;
- (NSString)maskedApplicationID;
- (NSString)statusText;
- (SLMicroBlogStatus)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)loadAssetDataIfNecessaryWithMaxByteSize:(unint64_t)a3 completion:(id)a4;
- (void)setImageAssetURLs:(id)a3;
- (void)setImageData:(id)a3;
- (void)setInReplyToStatusID:(id)a3;
- (void)setMaskedApplicationID:(id)a3;
- (void)setStatusText:(id)a3;
@end

@implementation SLMicroBlogStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  v4 = [(SLMicroBlogStatus *)self statusText];
  [v11 encodeObject:v4 forKey:@"statusText"];

  v5 = [(SLMicroBlogStatus *)self imageData];
  [v11 encodeObject:v5 forKey:@"imageData"];

  v6 = [(SLMicroBlogStatus *)self imageAssetURLs];
  [v11 encodeObject:v6 forKey:@"imageAssetURLs"];

  v7 = [(SLMicroBlogStatus *)self maskedApplicationID];

  if (v7)
  {
    v8 = [(SLMicroBlogStatus *)self maskedApplicationID];
    [v11 encodeObject:v8 forKey:@"maskedApplicationID"];
  }
  v9 = [(SLMicroBlogStatus *)self inReplyToStatusID];

  if (v9)
  {
    v10 = [(SLMicroBlogStatus *)self inReplyToStatusID];
    [v11 encodeObject:v10 forKey:@"inReplyToStatusID"];
  }
}

- (SLMicroBlogStatus)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SLMicroBlogStatus;
  v5 = [(SLMicroBlogStatus *)&v18 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusText"];
    [(SLMicroBlogStatus *)v5 setStatusText:v6];

    v7 = (void *)MEMORY[0x1E4F1CAD0];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    v9 = [v7 setWithArray:v8];
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"imageData"];
    [(SLMicroBlogStatus *)v5 setImageData:v10];

    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v13 = [v11 setWithArray:v12];
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"imageAssetURLs"];
    [(SLMicroBlogStatus *)v5 setImageAssetURLs:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maskedApplicationID"];
    [(SLMicroBlogStatus *)v5 setMaskedApplicationID:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inReplyToStatusID"];
    [(SLMicroBlogStatus *)v5 setInReplyToStatusID:v16];
  }
  return v5;
}

- (void)loadAssetDataIfNecessaryWithMaxByteSize:(unint64_t)a3 completion:(id)a4
{
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
{
}

- (NSArray)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (NSArray)imageAssetURLs
{
  return self->_imageAssetURLs;
}

- (void)setImageAssetURLs:(id)a3
{
}

- (NSString)maskedApplicationID
{
  return self->_maskedApplicationID;
}

- (void)setMaskedApplicationID:(id)a3
{
}

- (NSString)inReplyToStatusID
{
  return self->_inReplyToStatusID;
}

- (void)setInReplyToStatusID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inReplyToStatusID, 0);
  objc_storeStrong((id *)&self->_maskedApplicationID, 0);
  objc_storeStrong((id *)&self->_imageAssetURLs, 0);
  objc_storeStrong((id *)&self->_imageData, 0);

  objc_storeStrong((id *)&self->_statusText, 0);
}

@end