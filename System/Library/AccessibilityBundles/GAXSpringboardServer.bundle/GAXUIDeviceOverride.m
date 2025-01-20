@interface GAXUIDeviceOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)gax_forceSetOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation GAXUIDeviceOverride

+ (id)safeCategoryTargetClassName
{
  return @"UIDevice";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)gax_forceSetOrientation:(int64_t)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)GAXUIDeviceOverride;
  [(GAXUIDeviceOverride *)&v4 setOrientation:a3 animated:a4];
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = +[GAXSpringboard sharedInstance];
  if (![v7 isActive] || objc_msgSend(v7, "allowsMotion"))
  {
    v8.receiver = self;
    v8.super_class = (Class)GAXUIDeviceOverride;
    [(GAXUIDeviceOverride *)&v8 setOrientation:a3 animated:v4];
  }
}

@end