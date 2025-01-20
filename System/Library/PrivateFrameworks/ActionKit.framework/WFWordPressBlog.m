@interface WFWordPressBlog
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)blogIdJSONTransformer;
+ (id)blogWithEndpointURL:(id)a3;
+ (id)endpointURLJSONTransformer;
+ (id)isAdminJSONTransformer;
+ (id)urlJSONTransformer;
- (BOOL)isAdmin;
- (NSNumber)blogId;
- (NSString)blogName;
- (NSURL)endpointURL;
- (NSURL)url;
- (WFWordPressBlog)initWithEndpointURL:(id)a3;
@end

@implementation WFWordPressBlog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blogName, 0);
  objc_storeStrong((id *)&self->_blogId, 0);
  objc_storeStrong((id *)&self->_endpointURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (BOOL)isAdmin
{
  return self->_isAdmin;
}

- (NSString)blogName
{
  return self->_blogName;
}

- (NSNumber)blogId
{
  return self->_blogId;
}

- (NSURL)endpointURL
{
  return self->_endpointURL;
}

- (NSURL)url
{
  return self->_url;
}

- (WFWordPressBlog)initWithEndpointURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWordPressBlog;
  v5 = [(MTLModel *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    endpointURL = v5->_endpointURL;
    v5->_endpointURL = (NSURL *)v6;

    v8 = v5;
  }

  return v5;
}

+ (id)blogWithEndpointURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithEndpointURL:v4];

  return v5;
}

+ (id)isAdminJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x263F08D50], "mtl_BOOLeanValueTransformer");
}

+ (id)blogIdJSONTransformer
{
  return (id)[MEMORY[0x263F86848] transformerUsingForwardBlock:&__block_literal_global_3901 reverseBlock:&__block_literal_global_28];
}

id __40__WFWordPressBlog_blogIdJSONTransformer__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *a3 = 1;
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"%li", objc_msgSend(v4, "integerValue"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __40__WFWordPressBlog_blogIdJSONTransformer__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *a3 = 1;
    v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "integerValue"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)endpointURLJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x263F08D50], "mtl_URLValueTransformer");
}

+ (id)urlJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x263F08D50], "mtl_URLValueTransformer");
}

+ (id)JSONKeyPathsByPropertyKey
{
  v5[5] = *MEMORY[0x263EF8340];
  v4[0] = @"url";
  v4[1] = @"endpointURL";
  v5[0] = @"url";
  v5[1] = @"xmlrpc";
  v4[2] = @"blogId";
  v4[3] = @"blogName";
  v5[2] = @"blogid";
  v5[3] = @"blogName";
  v4[4] = @"isAdmin";
  v5[4] = @"isAdmin";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end