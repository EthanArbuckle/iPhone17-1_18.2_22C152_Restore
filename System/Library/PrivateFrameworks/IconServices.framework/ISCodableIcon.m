@interface ISCodableIcon
+ (BOOL)supportsSecureCoding;
- (id)_init;
@end

@implementation ISCodableIcon

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)ISCodableIcon;
  return [(ISIcon *)&v3 _init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end