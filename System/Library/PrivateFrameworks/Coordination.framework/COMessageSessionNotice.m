@interface COMessageSessionNotice
+ (BOOL)supportsSecureCoding;
- (COMessageSessionNotice)init;
@end

@implementation COMessageSessionNotice

- (COMessageSessionNotice)init
{
  v3.receiver = self;
  v3.super_class = (Class)COMessageSessionNotice;
  return [(COMessageSessionNotice *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end