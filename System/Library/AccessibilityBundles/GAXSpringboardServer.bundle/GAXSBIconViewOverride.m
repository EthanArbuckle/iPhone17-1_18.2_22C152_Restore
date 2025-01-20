@interface GAXSBIconViewOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
@end

@implementation GAXSBIconViewOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBIconView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v8 = +[GAXSpringboard sharedInstance];
  if ([v8 isActive])
  {
    v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)GAXSBIconViewOverride;
    v9 = -[GAXSBIconViewOverride contextMenuInteraction:configurationForMenuAtLocation:](&v11, "contextMenuInteraction:configurationForMenuAtLocation:", v7, x, y);
  }

  return v9;
}

@end