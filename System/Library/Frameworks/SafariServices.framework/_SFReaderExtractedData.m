@interface _SFReaderExtractedData
+ (BOOL)supportsSecureCoding;
- (NSData)body;
- (NSString)author;
- (NSString)publishedDate;
- (NSString)title;
- (NSURL)mainImageURL;
- (NSURL)url;
- (_SFReaderExtractedData)initWithCoder:(id)a3;
- (_SFReaderExtractedData)initWithReaderContent:(id)a3 url:(id)a4;
- (id)_initWithAuthor:(id)a3 body:(id)a4 publishedDate:(id)a5 title:(id)a6 mainImageURL:(id)a7 url:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFReaderExtractedData

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; author = %@; publishedDate = %@; title = %@; mainImageURL = %@; url = %@; body = %@;",
               objc_opt_class(),
               self,
               self->_author,
               self->_publishedDate,
               self->_title,
               self->_mainImageURL,
               self->_url,
               self->_body);
}

- (_SFReaderExtractedData)initWithReaderContent:(id)a3 url:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(v7, "safari_stringForKey:", @"imageURL");
  v9 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithDataAsString:", v8);
  v10 = objc_msgSend(v7, "safari_stringForKey:", @"body");
  v11 = [v10 dataUsingEncoding:4];

  v12 = objc_msgSend(v7, "safari_stringForKey:", @"author");
  v13 = objc_msgSend(v7, "safari_stringForKey:", @"publishedDate");
  v14 = objc_msgSend(v7, "safari_stringForKey:", @"title");

  v15 = [(_SFReaderExtractedData *)self _initWithAuthor:v12 body:v11 publishedDate:v13 title:v14 mainImageURL:v9 url:v6];
  return v15;
}

- (id)_initWithAuthor:(id)a3 body:(id)a4 publishedDate:(id)a5 title:(id)a6 mainImageURL:(id)a7 url:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v29.receiver = self;
  v29.super_class = (Class)_SFReaderExtractedData;
  v20 = [(_SFReaderExtractedData *)&v29 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    author = v20->_author;
    v20->_author = (NSString *)v21;

    objc_storeStrong((id *)&v20->_body, a4);
    uint64_t v23 = [v16 copy];
    publishedDate = v20->_publishedDate;
    v20->_publishedDate = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    title = v20->_title;
    v20->_title = (NSString *)v25;

    objc_storeStrong((id *)&v20->_mainImageURL, a7);
    objc_storeStrong((id *)&v20->_url, a8);
    v27 = v20;
  }

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  publishedDate = self->_publishedDate;
  body = self->_body;
  title = self->_title;
  author = self->_author;
  mainImageURL = self->_mainImageURL;
  url = self->_url;

  return (id)[v4 _initWithAuthor:author body:body publishedDate:publishedDate title:title mainImageURL:mainImageURL url:url];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  author = self->_author;
  id v5 = a3;
  [v5 encodeObject:author forKey:@"author"];
  [v5 encodeObject:self->_body forKey:@"body"];
  [v5 encodeObject:self->_publishedDate forKey:@"publishedDate"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_mainImageURL forKey:@"imageURL"];
  [v5 encodeObject:self->_url forKey:@"url"];
}

- (_SFReaderExtractedData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"author"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publishedDate"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageURL"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];

  v11 = [(_SFReaderExtractedData *)self _initWithAuthor:v5 body:v8 publishedDate:v6 title:v7 mainImageURL:v9 url:v10];
  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)author
{
  return self->_author;
}

- (NSString)publishedDate
{
  return self->_publishedDate;
}

- (NSData)body
{
  return self->_body;
}

- (NSURL)mainImageURL
{
  return self->_mainImageURL;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_mainImageURL, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_publishedDate, 0);
  objc_storeStrong((id *)&self->_author, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end