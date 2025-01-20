@interface NSAutoLocale
+ (BOOL)supportsSecureCoding;
- (Class)classForCoder;
- (NSAutoLocale)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSAutoLocale

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSAutoLocale)initWithCoder:(id)a3
{
  char v4 = [a3 allowsKeyedCoding];

  if ((v4 & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSLocales cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v5 = (void *)[MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];

  return (NSAutoLocale *)v5;
}

- (Class)classForCoder
{
  return (Class)self;
}

@end