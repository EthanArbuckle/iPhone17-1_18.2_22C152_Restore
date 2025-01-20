@interface ARModifiedImageData
- (ARImageData)originalImage;
- (ARModifiedImageData)initWithImageData:(id)a3;
- (NSDictionary)metaData;
- (void)setMetaData:(id)a3;
@end

@implementation ARModifiedImageData

- (ARModifiedImageData)initWithImageData:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARModifiedImageData;
  v5 = [(ARImageData *)&v14 initWithImageData:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      uint64_t v7 = [v6 originalImage];
      originalImage = v5->_originalImage;
      v5->_originalImage = (ARImageData *)v7;

      v9 = [v6 metaData];
      uint64_t v10 = [v9 copy];
      metaData = v5->_metaData;
      v5->_metaData = (NSDictionary *)v10;
    }
    else
    {
      v12 = (ARImageData *)v4;
      v9 = v5->_originalImage;
      v5->_originalImage = v12;
    }

    [(ARImageData *)v5 setVisionData:0];
  }

  return v5;
}

- (ARImageData)originalImage
{
  return self->_originalImage;
}

- (NSDictionary)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_originalImage, 0);
}

@end