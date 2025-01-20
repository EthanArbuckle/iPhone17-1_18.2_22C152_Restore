@interface NSHTTPCookie(NSSecureCoding_Temporary)
+ (uint64_t)classesForPropertyCoding;
+ (uint64_t)supportsSecureCoding;
- (id)initWithCoder:()NSSecureCoding_Temporary;
- (void)encodeWithCoder:()NSSecureCoding_Temporary;
@end

@implementation NSHTTPCookie(NSSecureCoding_Temporary)

+ (uint64_t)classesForPropertyCoding
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = [MEMORY[0x1E4F1C978] classForKeyedUnarchiver];
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] classForKeyedUnarchiver];
  uint64_t v3 = [NSString classForKeyedUnarchiver];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] classForKeyedUnarchiver];
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] classForKeyedUnarchiver];
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_msgSend(MEMORY[0x1E4F1CA98], "classForKeyedUnarchiver"), 0);
}

- (void)encodeWithCoder:()NSSecureCoding_Temporary
{
  id v4 = a3;
  id v6 = [a1 properties];
  uint64_t v5 = (void *)[v6 copy];
  [v4 encodeObject:v5 forKey:@"properties"];
}

- (id)initWithCoder:()NSSecureCoding_Temporary
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() classesForPropertyCoding];
  id v6 = [v4 decodeObjectOfClasses:v5 forKey:@"properties"];

  if (v6)
  {
    a1 = (id)[a1 initWithProperties:v6];
    id v7 = a1;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

@end