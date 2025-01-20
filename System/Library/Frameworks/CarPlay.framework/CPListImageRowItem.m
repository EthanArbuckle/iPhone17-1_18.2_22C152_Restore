@interface CPListImageRowItem
+ (BOOL)supportsSecureCoding;
+ (CGSize)maximumImageSize;
- (BOOL)isEnabled;
- (CPListImageRowItem)initWithCoder:(id)a3;
- (CPListImageRowItem)initWithText:(NSString *)text images:(NSArray *)images;
- (CPListImageRowItem)initWithText:(id)a3 images:(id)a4 imageTitles:(id)a5;
- (CPListTemplate)listTemplate;
- (NSArray)gridImages;
- (NSArray)gridImagesSet;
- (NSArray)imageTitles;
- (NSString)text;
- (NSUUID)identifier;
- (id)userInfo;
- (void)_setNeedsUpdate;
- (void)encodeWithCoder:(id)a3;
- (void)handler;
- (void)listImageRowHandler;
- (void)setEnabled:(BOOL)enabled;
- (void)setGridImagesSet:(id)a3;
- (void)setHandler:(void *)handler;
- (void)setImageTitles:(id)a3;
- (void)setListImageRowHandler:(void *)listImageRowHandler;
- (void)setListTemplate:(id)a3;
- (void)setText:(NSString *)text;
- (void)setUserInfo:(id)userInfo;
- (void)updateImages:(NSArray *)gridImages;
@end

@implementation CPListImageRowItem

+ (CGSize)maximumImageSize
{
  double v2 = 95.0;
  double v3 = 95.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPListImageRowItem)initWithText:(NSString *)text images:(NSArray *)images
{
  return [(CPListImageRowItem *)self initWithText:text images:images imageTitles:MEMORY[0x263EFFA68]];
}

- (CPListImageRowItem)initWithText:(id)a3 images:(id)a4 imageTitles:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CPListImageRowItem;
  v12 = [(CPListImageRowItem *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263F08C38] UUID];
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_text, a3);
    v12->_enabled = 1;
    objc_storeStrong((id *)&v12->_imageTitles, a5);
    [(CPListImageRowItem *)v12 updateImages:v10];
  }

  return v12;
}

- (CPListImageRowItem)initWithCoder:(id)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CPListImageRowItem;
  v5 = [(CPListImageRowItem *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPListImageRowItemTextKey"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPListImageRowIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    id v10 = (void *)MEMORY[0x263EFFA08];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
    v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"kCPListImageRowItemGridImagesKey"];
    gridImagesSet = v5->_gridImagesSet;
    v5->_gridImagesSet = (NSArray *)v13;

    v5->_enabled = [v4 decodeBoolForKey:@"kCPListImageRowItemEnabledKey"];
    v15 = (void *)MEMORY[0x263EFFA08];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_super v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    v17 = [v15 setWithArray:v16];
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"kCPListImageRowItemImageTitlesKey"];
    imageTitles = v5->_imageTitles;
    v5->_imageTitles = (NSArray *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPListImageRowItem *)self text];
  [v4 encodeObject:v5 forKey:@"kCPListImageRowItemTextKey"];

  uint64_t v6 = [(CPListImageRowItem *)self identifier];
  [v4 encodeObject:v6 forKey:@"kCPListImageRowIdentifierKey"];

  v7 = [(CPListImageRowItem *)self gridImagesSet];
  [v4 encodeObject:v7 forKey:@"kCPListImageRowItemGridImagesKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[CPListImageRowItem isEnabled](self, "isEnabled"), @"kCPListImageRowItemEnabledKey");
  id v8 = [(CPListImageRowItem *)self imageTitles];
  [v4 encodeObject:v8 forKey:@"kCPListImageRowItemImageTitlesKey"];
}

- (NSArray)gridImages
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  double v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_gridImagesSet;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v17;
    *(void *)&long long v6 = 138412290;
    long long v15 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "image", v15, (void)v16);
        if (v11)
        {
          [v3 addObject:v11];
        }
        else
        {
          v12 = CarPlayFrameworkGeneralLogging();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v15;
            objc_super v21 = v10;
            _os_log_impl(&dword_2181A5000, v12, OS_LOG_TYPE_INFO, "Unable to identify a grid image for %@", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }

  uint64_t v13 = (void *)[v3 copy];

  return (NSArray *)v13;
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    [(CPListImageRowItem *)self _setNeedsUpdate];
  }
}

- (void)_setNeedsUpdate
{
  id v3 = [(CPListImageRowItem *)self listTemplate];
  [v3 _setItemNeedsUpdate:self];
}

- (void)setText:(NSString *)text
{
  uint64_t v5 = text;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_text, text);
    [(CPListImageRowItem *)self _setNeedsUpdate];
  }
}

- (void)updateImages:(NSArray *)gridImages
{
  id v4 = gridImages;
  unint64_t v5 = [(NSArray *)v4 count];
  if (v5 >= 8) {
    uint64_t v6 = 8;
  }
  else {
    uint64_t v6 = v5;
  }
  uint64_t v7 = [MEMORY[0x263EFF980] arrayWithCapacity:v6];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      id v9 = [CPImageSet alloc];
      id v10 = [(NSArray *)v4 objectAtIndexedSubscript:i];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __35__CPListImageRowItem_updateImages___block_invoke;
      v13[3] = &unk_26430A8C0;
      v13[4] = self;
      id v11 = [(CPImageSet *)v9 initWithImage:v10 treatmentBlock:v13];

      [(NSArray *)v7 addObject:v11];
    }
  }
  gridImagesSet = self->_gridImagesSet;
  self->_gridImagesSet = v7;

  [(CPListImageRowItem *)self _setNeedsUpdate];
}

id __35__CPListImageRowItem_updateImages___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [(id)objc_opt_class() maximumImageSize];
  unint64_t v5 = CPImageByScalingImageToSize(v2, v3, v4);

  return v5;
}

- (void)setImageTitles:(id)a3
{
  objc_storeStrong((id *)&self->_imageTitles, a3);

  [(CPListImageRowItem *)self _setNeedsUpdate];
}

- (NSString)text
{
  return self->_text;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)userInfo
{
}

- (void)handler
{
  return self->_handler;
}

- (void)setHandler:(void *)handler
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSArray)imageTitles
{
  return self->_imageTitles;
}

- (void)listImageRowHandler
{
  return self->_listImageRowHandler;
}

- (void)setListImageRowHandler:(void *)listImageRowHandler
{
}

- (NSArray)gridImagesSet
{
  return self->_gridImagesSet;
}

- (void)setGridImagesSet:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (CPListTemplate)listTemplate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listTemplate);

  return (CPListTemplate *)WeakRetained;
}

- (void)setListTemplate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listTemplate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_gridImagesSet, 0);
  objc_storeStrong(&self->_listImageRowHandler, 0);
  objc_storeStrong((id *)&self->_imageTitles, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong(&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end