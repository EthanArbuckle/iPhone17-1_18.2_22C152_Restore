@interface BCImage
- (BCImage)initWithImageData:(id)a3 identifier:(id)a4 description:(id)a5;
- (NSData)imageData;
- (NSDictionary)dictionaryValue;
- (NSString)identifier;
- (NSString)imageDescription;
- (UIImage)image;
@end

@implementation BCImage

- (BCImage)initWithImageData:(id)a3 identifier:(id)a4 description:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BCImage;
  v12 = [(BCImage *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageData, a3);
    objc_storeStrong((id *)&v13->_imageDescription, a5);
    objc_storeStrong((id *)&v13->_identifier, a4);
  }

  return v13;
}

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  [v3 setObject:self->_imageData forKeyedSubscript:@"data"];
  [v3 setObject:self->_imageDescription forKeyedSubscript:@"description"];
  v4 = (void *)[v3 copy];

  return (NSDictionary *)v4;
}

- (UIImage)image
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:self->_imageData];

  return (UIImage *)v2;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)imageDescription
{
  return self->_imageDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDescription, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_imageData, 0);
}

@end