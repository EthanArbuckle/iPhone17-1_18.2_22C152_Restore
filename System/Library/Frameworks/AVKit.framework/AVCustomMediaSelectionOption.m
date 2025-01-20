@interface AVCustomMediaSelectionOption
- (id)description;
@end

@implementation AVCustomMediaSelectionOption

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(AVMediaSelectionOption *)self avkit_displayName];
  v7 = [v3 stringWithFormat:@"<%@: %p, AVKit, title = %@>", v5, self, v6];

  return v7;
}

@end