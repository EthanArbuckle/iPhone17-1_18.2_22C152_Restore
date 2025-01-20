@interface NSFileSecurity
+ (BOOL)supportsSecureCoding;
+ (NSFileSecurity)allocWithZone:(_NSZone *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_cfTypeID;
@end

@implementation NSFileSecurity

+ (NSFileSecurity)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  if (NSFileSecurity == a1)
  {
    return (NSFileSecurity *)+[__NSPlaceholderFileSecurity immutablePlaceholder];
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___NSFileSecurity;
    return (NSFileSecurity *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
  }
}

- (unint64_t)_cfTypeID
{
  return 64;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end