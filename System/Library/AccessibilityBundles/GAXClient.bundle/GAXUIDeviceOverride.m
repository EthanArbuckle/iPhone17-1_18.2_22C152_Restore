@interface GAXUIDeviceOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
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

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = +[GAXClient sharedInstance];
  if ([v7 isActive] && (objc_msgSend(v7, "allowsMotion") & 1) == 0)
  {
    v8 = GAXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Guided Access blocking setOrientation:", buf, 2u);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GAXUIDeviceOverride;
    [(GAXUIDeviceOverride *)&v9 setOrientation:a3 animated:v4];
  }
}

@end