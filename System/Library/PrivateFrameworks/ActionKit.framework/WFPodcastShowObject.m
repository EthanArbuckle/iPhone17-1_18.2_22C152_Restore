@interface WFPodcastShowObject
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)childrenJSONTransformer;
- (NSArray)children;
- (NSString)storeId;
- (NSString)title;
- (NSString)uuid;
- (NSURL)feedURL;
@end

@implementation WFPodcastShowObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_feedURL, 0);
  objc_storeStrong((id *)&self->_storeId, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSArray)children
{
  return self->_children;
}

- (NSURL)feedURL
{
  return self->_feedURL;
}

- (NSString)storeId
{
  return self->_storeId;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)title
{
  return self->_title;
}

+ (id)childrenJSONTransformer
{
  v2 = (void *)MEMORY[0x263F86840];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 arrayTransformerWithModelClass:v3];
}

+ (id)JSONKeyPathsByPropertyKey
{
  v5[5] = *MEMORY[0x263EF8340];
  v4[0] = @"title";
  v4[1] = @"uuid";
  v5[0] = @"title";
  v5[1] = @"uuid";
  v4[2] = @"storeId";
  v4[3] = @"feedURL";
  v5[2] = @"storeId";
  v5[3] = @"feedUrl";
  v4[4] = @"children";
  v5[4] = @"children";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end