@interface IMCommSafetySummaryImage
- (IMCommSafetySummaryImage)initWithIdentifier:(id)a3 imageData:(id)a4;
- (NSData)imageData;
- (NSString)identifier;
@end

@implementation IMCommSafetySummaryImage

- (IMCommSafetySummaryImage)initWithIdentifier:(id)a3 imageData:(id)a4
{
  v6 = (NSData *)a4;
  v16.receiver = self;
  v16.super_class = (Class)IMCommSafetySummaryImage;
  id v7 = a3;
  v8 = [(IMCommSafetySummaryImage *)&v16 init];
  uint64_t v12 = objc_msgSend_copy(v7, v9, v10, v11, v16.receiver, v16.super_class);

  identifier = v8->_identifier;
  v8->_identifier = (NSString *)v12;

  imageData = v8->_imageData;
  v8->_imageData = v6;

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end