@interface NSLocale(NSLocale)
+ (uint64_t)autoupdatingCurrentLocale;
- (NSString)debugDescription;
- (uint64_t)classForCoder;
- (uint64_t)encodeWithCoder:()NSLocale;
- (uint64_t)initWithCoder:()NSLocale;
@end

@implementation NSLocale(NSLocale)

- (uint64_t)initWithCoder:()NSLocale
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSLocales cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.identifier"];
  if (_NSIsNSString())
  {
    return [a1 initWithLocaleIdentifier:v5];
  }
  else
  {
    objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, 0));

    return 0;
  }
}

+ (uint64_t)autoupdatingCurrentLocale
{
  return [MEMORY[0x1E4F1CA20] _autoupdatingCurrent];
}

- (NSString)debugDescription
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = a1;
  v2.super_class = (Class)NSLocale_0;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ '%@'}", objc_msgSendSuper2(&v2, sel_debugDescription), [a1 localeIdentifier]);
}

- (uint64_t)encodeWithCoder:()NSLocale
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSLocales cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  uint64_t v5 = [a1 localeIdentifier];

  return [a3 encodeObject:v5 forKey:@"NS.identifier"];
}

- (uint64_t)classForCoder
{
  return self;
}

@end