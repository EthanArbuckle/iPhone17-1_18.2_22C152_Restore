@interface CRKChapter
+ (BOOL)supportsSecureCoding;
- (CRKChapter)init;
- (CRKChapter)initWithCoder:(id)a3;
- (NSArray)subchapters;
- (NSDictionary)JSONRepresentation;
- (NSString)title;
- (NSURL)webURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSubchapters:(id)a3;
- (void)setTitle:(id)a3;
- (void)setWebURL:(id)a3;
@end

@implementation CRKChapter

- (CRKChapter)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRKChapter;
  v2 = [(CRKChapter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    subchapters = v2->_subchapters;
    v2->_subchapters = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CRKChapter *)self title];
  objc_super v6 = [(CRKChapter *)self subchapters];
  v7 = [(CRKChapter *)self webURL];
  v8 = [v7 absoluteString];
  v9 = [v3 stringWithFormat:@"<%@: %p { title = %@, subchapters = %@, webURL = %@ }>", v4, self, v5, v6, v8];

  return v9;
}

- (NSDictionary)JSONRepresentation
{
  v3 = objc_opt_new();
  uint64_t v4 = [(CRKChapter *)self title];
  [v3 setObject:v4 forKeyedSubscript:@"Title"];

  v5 = [(CRKChapter *)self webURL];
  objc_super v6 = [v5 absoluteString];
  [v3 setObject:v6 forKeyedSubscript:@"Web URL"];

  v7 = [(CRKChapter *)self subchapters];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [(CRKChapter *)self subchapters];
    v10 = [v9 valueForKey:@"JSONRepresentation"];
    [v3 setObject:v10 forKeyedSubscript:@"Subchapters"];
  }

  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKChapter)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CRKChapter;
  v5 = [(CRKChapter *)&v18 init];
  if (v5)
  {
    objc_super v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v7;

    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"subchapters"];
    subchapters = v5->_subchapters;
    v5->_subchapters = (NSArray *)v12;

    v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"webURL"];
    webURL = v5->_webURL;
    v5->_webURL = (NSURL *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CRKChapter *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  objc_super v6 = [(CRKChapter *)self subchapters];
  [v4 encodeObject:v6 forKey:@"subchapters"];

  id v7 = [(CRKChapter *)self webURL];
  [v4 encodeObject:v7 forKey:@"webURL"];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)subchapters
{
  return self->_subchapters;
}

- (void)setSubchapters:(id)a3
{
}

- (NSURL)webURL
{
  return self->_webURL;
}

- (void)setWebURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webURL, 0);
  objc_storeStrong((id *)&self->_subchapters, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end