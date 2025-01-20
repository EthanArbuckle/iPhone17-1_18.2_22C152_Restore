@interface GKImageKey
+ (id)fileNameWithIdentifierInImageSource:(id)a3;
+ (id)keyForImageIdentifier:(id)a3 withImageSource:(id)a4;
- (CGSize)size;
- (NSString)basename;
- (NSString)cacheKey;
- (NSString)filePath;
- (NSString)imageID;
- (void)setBasename:(id)a3;
- (void)setImageID:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation GKImageKey

+ (id)fileNameWithIdentifierInImageSource:(id)a3
{
  id v3 = a3;
  v4 = [v3 name];
  v5 = [v3 imageBrush];

  if ([v5 conformsToProtocol:&unk_26D9BEB20])
  {
    v6 = [v5 renderedImageIdentifier];
    uint64_t v7 = [v4 stringByAppendingFormat:@"-%@", v6];

    v4 = (void *)v7;
  }
  v8 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  v10 = @"~iphone";
  if (v9 == 1) {
    v10 = @"~ipad";
  }
  v11 = v10;
  [v5 scaleForInput:0];
  if (v12 >= 2.0) {
    [v4 stringByAppendingFormat:@"%@%@%@", @"@2x", v11, @".gkpix"];
  }
  else {
  v13 = [v4 stringByAppendingFormat:@"%@%@", v11, @".gkpix", v15];
  }

  return v13;
}

+ (id)keyForImageIdentifier:(id)a3 withImageSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(GKImageKey);
  uint64_t v9 = [a1 fileNameWithIdentifierInImageSource:v6];

  [(GKImageKey *)v8 setBasename:v9];
  [(GKImageKey *)v8 setImageID:v7];

  return v8;
}

- (NSString)filePath
{
  filePath = self->_filePath;
  if (!filePath)
  {
    v4 = [(id)objc_opt_class() cacheDirectoryForImageID:self->_imageID];
    v5 = [v4 stringByAppendingPathComponent:self->_basename];
    id v6 = self->_filePath;
    self->_filePath = v5;

    filePath = self->_filePath;
  }
  return filePath;
}

- (NSString)cacheKey
{
  cacheKey = self->_cacheKey;
  if (!cacheKey)
  {
    v4 = [(NSString *)self->_imageID stringByAppendingString:self->_basename];
    v5 = self->_cacheKey;
    self->_cacheKey = v4;

    cacheKey = self->_cacheKey;
  }
  return cacheKey;
}

- (NSString)basename
{
  return self->_basename;
}

- (void)setBasename:(id)a3
{
}

- (NSString)imageID
{
  return self->_imageID;
}

- (void)setImageID:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageID, 0);
  objc_storeStrong((id *)&self->_basename, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end