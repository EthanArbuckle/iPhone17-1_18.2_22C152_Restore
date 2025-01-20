@interface CNMutableActivityAlert
- (id)freeze;
@end

@implementation CNMutableActivityAlert

- (id)freeze
{
  v3 = (objc_class *)objc_opt_class();
  object_setClass(self, v3);
  v4 = self;

  return v4;
}

@end