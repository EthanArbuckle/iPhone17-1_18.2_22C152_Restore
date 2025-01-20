@interface WFWebResource
+ (BOOL)supportsSecureCoding;
+ (WFWebResource)webResourceWithData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6;
+ (WFWebResource)webResourceWithFile:(id)a3;
+ (WFWebResource)webResourceWithHTMLString:(id)a3 baseURL:(id)a4;
+ (WFWebResource)webResourceWithURL:(id)a3;
- (NSData)data;
- (NSString)MIMEType;
- (NSString)frameName;
- (NSString)textEncodingName;
- (NSURL)URL;
- (WFWebResource)initWithCoder:(id)a3;
- (WFWebResource)initWithData:(id)a3 URL:(id)a4 MIMEType:(id)a5 textEncodingName:(id)a6 frameName:(id)a7;
- (WFWebResource)initWithSerializedRepresentation:(id)a3;
- (id)containedImageFile;
- (id)description;
- (id)loadInWKWebView:(id)a3;
- (id)serializedRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFWebResource

+ (WFWebResource)webResourceWithFile:(id)a3
{
  id v3 = a3;
  v4 = [[WFFileWebResource alloc] initWithFile:v3];

  return (WFWebResource *)v4;
}

+ (WFWebResource)webResourceWithHTMLString:(id)a3 baseURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[WFHTMLStringWebResource alloc] initWithHTMLString:v6 baseURL:v5];

  return (WFWebResource *)v7;
}

+ (WFWebResource)webResourceWithURL:(id)a3
{
  id v3 = a3;
  v4 = [[WFURLWebResource alloc] initWithURL:v3];

  return (WFWebResource *)v4;
}

+ (WFWebResource)webResourceWithData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[WFWebResource alloc] initWithData:v12 URL:v9 MIMEType:v11 textEncodingName:v10 frameName:0];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameName, 0);
  objc_storeStrong((id *)&self->_textEncodingName, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (NSString)frameName
{
  return self->_frameName;
}

- (NSString)textEncodingName
{
  return self->_textEncodingName;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSData)data
{
  return self->_data;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWebResource *)self data];
  [v4 encodeObject:v5 forKey:@"WebResourceData"];

  id v6 = [(WFWebResource *)self URL];
  [v4 encodeObject:v6 forKey:@"WebResourceURL"];

  v7 = [(WFWebResource *)self MIMEType];
  [v4 encodeObject:v7 forKey:@"WebResourceMIMEType"];

  v8 = [(WFWebResource *)self textEncodingName];
  [v4 encodeObject:v8 forKey:@"WebResourceTextEncodingName"];

  id v9 = [(WFWebResource *)self frameName];
  [v4 encodeObject:v9 forKey:@"WebResourceFrameName"];
}

- (WFWebResource)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWebResource *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WebResourceData"];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WebResourceURL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WebResourceURL"];
    MIMEType = v5->_MIMEType;
    v5->_MIMEType = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WebResourceURL"];
    textEncodingName = v5->_textEncodingName;
    v5->_textEncodingName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WebResourceURL"];
    frameName = v5->_frameName;
    v5->_frameName = (NSString *)v14;

    v16 = v5;
  }

  return v5;
}

- (id)serializedRepresentation
{
  id v3 = [(WFWebResource *)self data];
  id v4 = [(WFWebResource *)self URL];
  id v5 = [(WFWebResource *)self MIMEType];
  uint64_t v6 = [(WFWebResource *)self textEncodingName];
  v7 = [(WFWebResource *)self frameName];
  uint64_t v8 = objc_opt_new();
  id v9 = v8;
  if (v3) {
    [v8 setObject:v3 forKey:@"WebResourceData"];
  }
  if (v4)
  {
    uint64_t v10 = [v4 absoluteString];
    [v9 setObject:v10 forKey:@"WebResourceURL"];
  }
  if (v5) {
    [v9 setObject:v5 forKey:@"WebResourceMIMEType"];
  }
  if (v6) {
    [v9 setObject:v6 forKey:@"WebResourceTextEncodingName"];
  }
  if (v7) {
    [v9 setObject:v7 forKey:@"WebResourceFrameName"];
  }

  return v9;
}

- (WFWebResource)initWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"WebResourceData"];
  uint64_t v6 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"WebResourceURL"];
  v7 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"WebResourceMIMEType"];
  uint64_t v8 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"WebResourceTextEncodingName"];
  id v9 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"WebResourceFrameName"];

  uint64_t v10 = [(WFWebResource *)self initWithData:v5 URL:v6 MIMEType:v7 textEncodingName:v8 frameName:v9];
  return v10;
}

- (id)description
{
  id v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)WFWebResource;
  id v4 = [(WFWebResource *)&v10 description];
  uint64_t v5 = [(WFWebResource *)self URL];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    v7 = [v3 stringWithFormat:@"%@ %@", v4, v5];
  }
  else
  {
    uint64_t v8 = [(WFWebResource *)self MIMEType];
    v7 = [v3 stringWithFormat:@"%@ %@", v4, v8];
  }
  return v7;
}

- (WFWebResource)initWithData:(id)a3 URL:(id)a4 MIMEType:(id)a5 textEncodingName:(id)a6 frameName:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(WFWebResource *)self init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    data = v17->_data;
    v17->_data = (NSData *)v18;

    objc_storeStrong((id *)&v17->_URL, a4);
    uint64_t v20 = [v14 copy];
    MIMEType = v17->_MIMEType;
    v17->_MIMEType = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    textEncodingName = v17->_textEncodingName;
    v17->_textEncodingName = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    frameName = v17->_frameName;
    v17->_frameName = (NSString *)v24;

    v26 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)loadInWKWebView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFWebResource *)self data];
  uint64_t v6 = [(WFWebResource *)self MIMEType];
  v7 = [(WFWebResource *)self textEncodingName];
  uint64_t v8 = [(WFWebResource *)self URL];
  id v9 = [v4 loadData:v5 MIMEType:v6 characterEncodingName:v7 baseURL:v8];

  return v9;
}

- (id)containedImageFile
{
  id v3 = (void *)MEMORY[0x263F852B8];
  id v4 = [(WFWebResource *)self MIMEType];
  uint64_t v5 = [v3 typeFromMIMEType:v4];

  if ([v5 conformsToUTType:*MEMORY[0x263F1DB18]]
    && ([v5 conformsToUTType:*MEMORY[0x263F1DC90]] & 1) == 0)
  {
    v7 = [(WFWebResource *)self data];
    uint64_t v8 = [(WFWebResource *)self URL];
    id v9 = [v8 lastPathComponent];
    uint64_t v6 = +[WFFileRepresentation fileWithData:v7 ofType:v5 proposedFilename:v9];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end