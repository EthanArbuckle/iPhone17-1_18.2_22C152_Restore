@interface AASetupAssistantConfigRequest
+ (Class)responseClass;
- (id)urlString;
@end

@implementation AASetupAssistantConfigRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v7.receiver = self;
  v7.super_class = (Class)AASetupAssistantConfigRequest;
  v2 = [(AAURLConfigurationRequest *)&v7 urlString];
  uint64_t v3 = [v2 rangeOfString:@"?"];
  v5 = objc_msgSend(v2, "stringByReplacingCharactersInRange:withString:", v3, objc_msgSend(v2, "length") + v4 + ~v3, @"?context=buddy");

  return v5;
}

@end