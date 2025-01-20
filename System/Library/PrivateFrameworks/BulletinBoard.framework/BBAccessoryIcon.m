@interface BBAccessoryIcon
+ (BOOL)supportsSecureCoding;
- (BBAccessoryIcon)init;
- (BBAccessoryIcon)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)imagesForContentSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageForContentSizeCategory:(id)a3;
- (unint64_t)hash;
- (void)addImage:(id)a3 forContentSizeCategory:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setImagesForContentSize:(id)a3;
@end

@implementation BBAccessoryIcon

- (BBAccessoryIcon)init
{
  v6.receiver = self;
  v6.super_class = (Class)BBAccessoryIcon;
  v2 = [(BBAccessoryIcon *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    imagesForContentSize = v2->_imagesForContentSize;
    v2->_imagesForContentSize = v3;
  }
  return v2;
}

- (void)setImagesForContentSize:(id)a3
{
  if (self->_imagesForContentSize != a3)
  {
    self->_imagesForContentSize = (NSMutableDictionary *)[a3 mutableCopy];
    MEMORY[0x270F9A758]();
  }
}

- (void)addImage:(id)a3 forContentSizeCategory:(id)a4
{
  if (a3)
  {
    if (a4) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_imagesForContentSize, "setObject:forKeyedSubscript:");
    }
  }
}

- (id)imageForContentSizeCategory:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_imagesForContentSize objectForKeyedSubscript:a3];
}

- (unint64_t)hash
{
  v2 = [(BBAccessoryIcon *)self imagesForContentSize];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BBAccessoryIcon *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v5 = v4;
      objc_super v6 = [(BBAccessoryIcon *)self imagesForContentSize];
      v7 = [(BBAccessoryIcon *)v5 imagesForContentSize];

      char v8 = BSEqualObjects();
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(BBAccessoryIcon *)self imagesForContentSize];
  [v4 setImagesForContentSize:v5];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBAccessoryIcon)initWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(BBAccessoryIcon *)self init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:3];
    char v8 = objc_msgSend(v6, "setWithArray:", v7, v11, v12);

    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"imagesForContentSize"];
    [(BBAccessoryIcon *)v5 setImagesForContentSize:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BBAccessoryIcon *)self imagesForContentSize];
  [v4 encodeObject:v5 forKey:@"imagesForContentSize"];
}

- (NSDictionary)imagesForContentSize
{
  return &self->_imagesForContentSize->super;
}

- (void).cxx_destruct
{
}

@end