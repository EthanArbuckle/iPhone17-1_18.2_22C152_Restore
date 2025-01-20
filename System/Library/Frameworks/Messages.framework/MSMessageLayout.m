@interface MSMessageLayout
- (MSMessageLayout)init;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MSMessageLayout

- (MSMessageLayout)init
{
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MSMessageLayout;
  return [(MSMessageLayout *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = [MSMessageLayout alloc];

  return [(MSMessageLayout *)v3 _init];
}

@end