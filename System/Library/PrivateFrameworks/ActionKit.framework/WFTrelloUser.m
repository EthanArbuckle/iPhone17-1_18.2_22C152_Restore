@interface WFTrelloUser
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
- (NSString)email;
- (NSString)username;
- (NSURL)URL;
@end

@implementation WFTrelloUser

+ (id)JSONKeyPathsByPropertyKey
{
  v8[4] = *MEMORY[0x263EF8340];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFTrelloUser;
  v2 = objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v3 = (void *)[v2 mutableCopy];

  v7[0] = @"name";
  v7[1] = @"email";
  v8[0] = @"fullName";
  v8[1] = @"email";
  v7[2] = @"username";
  v7[3] = @"URL";
  v8[2] = @"username";
  v8[3] = @"url";
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_email, 0);
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)email
{
  return self->_email;
}

@end