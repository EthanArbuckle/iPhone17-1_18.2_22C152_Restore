@interface CRKBook
+ (BOOL)supportsSecureCoding;
- (BOOL)hasChapters;
- (CRKBook)init;
- (CRKBook)initWithCoder:(id)a3;
- (NSData)image;
- (NSString)author;
- (NSString)path;
- (NSString)title;
- (NSURL)webURL;
- (id)description;
- (id)imageDescription;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setHasChapters:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setPath:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setWebURL:(id)a3;
@end

@implementation CRKBook

- (CRKBook)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRKBook;
  result = [(CRKBook *)&v3 init];
  if (result) {
    result->_type = 3;
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CRKBook *)self title];
  v6 = [(CRKBook *)self author];
  v7 = [(CRKBook *)self path];
  v8 = [(CRKBook *)self imageDescription];
  v9 = [(CRKBook *)self webURL];
  v10 = [v9 absoluteString];
  v11 = NSStringFromCRKBookType([(CRKBook *)self type]);
  BOOL v12 = [(CRKBook *)self hasChapters];
  v13 = @"NO";
  if (v12) {
    v13 = @"YES";
  }
  v14 = [v3 stringWithFormat:@"<%@: %p { title = %@, author = %@, path = %@, image = %@, webURL = %@, type = %@, hasChapters = %@ }>", v4, self, v5, v6, v7, v8, v10, v11, v13];

  return v14;
}

- (id)imageDescription
{
  objc_super v3 = [(CRKBook *)self image];

  if (v3)
  {
    uint64_t v4 = NSString;
    v5 = [(CRKBook *)self image];
    objc_msgSend(v4, "stringWithFormat:", @"<Data with length %lu>", objc_msgSend(v5, "length"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = @"nil";
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKBook)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CRKBook;
  v5 = [(CRKBook *)&v23 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"author"];
    author = v5->_author;
    v5->_author = (NSString *)v10;

    BOOL v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"path"];
    path = v5->_path;
    v5->_path = (NSString *)v13;

    v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"image"];
    image = v5->_image;
    v5->_image = (NSData *)v16;

    v18 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"webURL"];
    webURL = v5->_webURL;
    v5->_webURL = (NSURL *)v19;

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasChapters"];
    v5->_hasChapters = [v21 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CRKBook *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  v6 = [(CRKBook *)self author];
  [v4 encodeObject:v6 forKey:@"author"];

  uint64_t v7 = [(CRKBook *)self path];
  [v4 encodeObject:v7 forKey:@"path"];

  v8 = [(CRKBook *)self image];
  [v4 encodeObject:v8 forKey:@"image"];

  v9 = [(CRKBook *)self webURL];
  [v4 encodeObject:v9 forKey:@"webURL"];

  objc_msgSend(NSNumber, "numberWithBool:", -[CRKBook hasChapters](self, "hasChapters"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"hasChapters"];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSURL)webURL
{
  return self->_webURL;
}

- (void)setWebURL:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)hasChapters
{
  return self->_hasChapters;
}

- (void)setHasChapters:(BOOL)a3
{
  self->_hasChapters = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webURL, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_author, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end