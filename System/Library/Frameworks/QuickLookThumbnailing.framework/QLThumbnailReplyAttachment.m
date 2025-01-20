@interface QLThumbnailReplyAttachment
+ (BOOL)supportsSecureCoding;
- (NSData)data;
- (QLThumbnailReplyAttachment)initWithCoder:(id)a3;
- (QLThumbnailReplyAttachment)initWithData:(id)a3 contentType:(id)a4;
- (UTType)contentType;
- (void)encodeWithCoder:(id)a3;
- (void)setContentType:(id)a3;
- (void)setData:(id)a3;
@end

@implementation QLThumbnailReplyAttachment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLThumbnailReplyAttachment)initWithData:(id)a3 contentType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)QLThumbnailReplyAttachment;
  v9 = [(QLThumbnailReplyAttachment *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_contentType, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(QLThumbnailReplyAttachment *)self data];
  [v4 encodeObject:v5 forKey:@"data"];

  id v6 = [(QLThumbnailReplyAttachment *)self contentType];
  [v4 encodeObject:v6 forKey:@"contentType"];
}

- (QLThumbnailReplyAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLThumbnailReplyAttachment;
  v5 = [(QLThumbnailReplyAttachment *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    [(QLThumbnailReplyAttachment *)v5 setData:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentType"];
    [(QLThumbnailReplyAttachment *)v5 setContentType:v7];
  }
  return v5;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
}

- (UTType)contentType
{
  return (UTType *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContentType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end