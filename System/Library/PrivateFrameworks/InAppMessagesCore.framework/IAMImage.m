@interface IAMImage
- (IAMImage)initWithICImage:(id)a3;
- (IAMImage)initWithIdentifier:(id)a3 url:(id)a4;
- (IAMImage)initWithIdentifier:(id)a3 url:(id)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (NSString)identifier;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)height;
- (unsigned)width;
@end

@implementation IAMImage

- (IAMImage)initWithIdentifier:(id)a3 url:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IAMImage;
  v8 = [(IAMImage *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    url = v8->_url;
    v8->_url = (NSURL *)v11;
  }
  return v8;
}

- (IAMImage)initWithIdentifier:(id)a3 url:(id)a4 width:(unsigned int)a5 height:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IAMImage;
  v12 = [(IAMImage *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    uint64_t v15 = [v11 copy];
    url = v12->_url;
    v12->_url = (NSURL *)v15;

    v12->_width = a5;
    v12->_height = a6;
  }

  return v12;
}

- (IAMImage)initWithICImage:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IAMImage;
  v5 = [(IAMImage *)&v14 init];
  if (v5)
  {
    id v6 = [v4 identifier];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    uint64_t v9 = NSURL;
    id v10 = [v4 uRL];
    uint64_t v11 = [v9 URLWithString:v10];
    url = v5->_url;
    v5->_url = (NSURL *)v11;

    v5->_width = [v4 width];
    v5->_height = [v4 height];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  url = self->_url;
  uint64_t width = self->_width;
  uint64_t height = self->_height;
  return (id)[v4 initWithIdentifier:identifier url:url width:width height:height];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)url
{
  return self->_url;
}

- (unsigned)width
{
  return self->_width;
}

- (unsigned)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end