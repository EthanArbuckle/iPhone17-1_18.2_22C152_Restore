@interface MTRContentLauncherClusterStyleInformationStruct
- (MTRContentLauncherClusterDimensionStruct)size;
- (MTRContentLauncherClusterStyleInformationStruct)init;
- (NSString)color;
- (NSString)imageURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setColor:(NSString *)color;
- (void)setImageURL:(NSString *)imageURL;
- (void)setSize:(MTRContentLauncherClusterDimensionStruct *)size;
@end

@implementation MTRContentLauncherClusterStyleInformationStruct

- (MTRContentLauncherClusterStyleInformationStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRContentLauncherClusterStyleInformationStruct;
  v2 = [(MTRContentLauncherClusterStyleInformationStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    imageURL = v2->_imageURL;
    v2->_imageURL = 0;

    color = v3->_color;
    v3->_color = 0;

    size = v3->_size;
    v3->_size = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRContentLauncherClusterStyleInformationStruct);
  v7 = objc_msgSend_imageURL(self, v5, v6);
  objc_msgSend_setImageURL_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_color(self, v9, v10);
  objc_msgSend_setColor_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_size(self, v13, v14);
  objc_msgSend_setSize_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: imageURL:%@; color:%@; size:%@; >",
    v5,
    self->_imageURL,
    self->_color,
  v7 = self->_size);

  return v7;
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(NSString *)imageURL
{
}

- (NSString)color
{
  return self->_color;
}

- (void)setColor:(NSString *)color
{
}

- (MTRContentLauncherClusterDimensionStruct)size
{
  return self->_size;
}

- (void)setSize:(MTRContentLauncherClusterDimensionStruct *)size
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_imageURL, 0);
}

@end