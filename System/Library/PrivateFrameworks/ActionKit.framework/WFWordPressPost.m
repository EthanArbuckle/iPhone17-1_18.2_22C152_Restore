@interface WFWordPressPost
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)linkJSONTransformer;
+ (id)postIdJSONTransformer;
- (NSNumber)postId;
- (NSURL)link;
@end

@implementation WFWordPressPost

+ (id)linkJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x263F08D50], "mtl_URLValueTransformer");
}

+ (id)postIdJSONTransformer
{
  return +[WFWordPressBlog blogIdJSONTransformer];
}

+ (id)JSONKeyPathsByPropertyKey
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"postId";
  v4[1] = @"link";
  v5[0] = @"post_id";
  v5[1] = @"link";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_postId, 0);
}

- (NSURL)link
{
  return self->_link;
}

- (NSNumber)postId
{
  return self->_postId;
}

@end