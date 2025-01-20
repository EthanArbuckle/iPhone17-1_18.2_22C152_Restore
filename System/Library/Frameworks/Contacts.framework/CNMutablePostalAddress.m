@interface CNMutablePostalAddress
- (id)copyWithZone:(_NSZone *)a3;
- (id)freeze;
@end

@implementation CNMutablePostalAddress

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CNPostalAddress alloc];

  return [(CNPostalAddress *)v4 initWithPostalAddress:self];
}

- (id)freeze
{
  v3 = (objc_class *)objc_opt_class();
  object_setClass(self, v3);
  v4 = self;

  return v4;
}

@end