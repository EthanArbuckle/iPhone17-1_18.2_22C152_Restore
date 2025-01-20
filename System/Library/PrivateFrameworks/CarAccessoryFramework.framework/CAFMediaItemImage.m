@interface CAFMediaItemImage
- (CAFMediaItemImage)initWithDictionary:(id)a3;
- (NSData)imageData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)identifier;
- (id)description;
@end

@implementation CAFMediaItemImage

- (CAFMediaItemImage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAFMediaItemImage;
  v5 = [(CAFMediaItemImage *)&v13 init];
  if (v5)
  {
    objc_opt_class();
    id v6 = [v4 objectForKey:@"identifier"];
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
      v7 = (NSString *)v6;
    }
    else {
      v7 = 0;
    }

    identifier = v5->_identifier;
    v5->_identifier = v7;

    objc_opt_class();
    id v9 = [v4 objectForKey:@"imageData"];
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
      v10 = (NSData *)v9;
    }
    else {
      v10 = 0;
    }

    imageData = v5->_imageData;
    v5->_imageData = v10;
  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"identifier";
  v3 = [(CAFMediaItemImage *)self identifier];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
  }
  v9[1] = @"imageData";
  v10[0] = v4;
  v5 = [(CAFMediaItemImage *)self imageData];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x263EFF9D0] null];
  }
  v10[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (!v5) {

  }
  if (!v3) {
  return (NSDictionary *)v7;
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CAFMediaItemImage *)self identifier];
  id v6 = [(CAFMediaItemImage *)self imageData];
  v7 = [v3 stringWithFormat:@"<%@: %p { %@: %@, %@: %@ }>", v4, self, @"identifier", v5, @"imageData", v6];

  return v7;
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