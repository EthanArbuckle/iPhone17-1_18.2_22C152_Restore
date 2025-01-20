@interface ECHTMLStringAndMIMECharset(MessageUIAdditions)
+ (uint64_t)supportsSecureCoding;
- (uint64_t)initWithCoder:()MessageUIAdditions;
- (void)encodeWithCoder:()MessageUIAdditions;
@end

@implementation ECHTMLStringAndMIMECharset(MessageUIAdditions)

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:()MessageUIAdditions
{
  id v6 = a3;
  v4 = [a1 string];
  [v6 encodeObject:v4 forKey:@"String"];

  v5 = [a1 charset];
  [v6 encodeObject:v5 forKey:@"Charset"];
}

- (uint64_t)initWithCoder:()MessageUIAdditions
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"String"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Charset"];
  uint64_t v7 = [a1 initWithString:v5 charset:v6];

  return v7;
}

@end