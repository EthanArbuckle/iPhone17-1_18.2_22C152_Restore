@interface GAXSBExternalDisplayDefaultsOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)setMirroringEnabled:(BOOL)a3;
@end

@implementation GAXSBExternalDisplayDefaultsOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBExternalDisplayDefaults";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setMirroringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[GAXSpringboard sharedInstance];
  if ([v5 isActive])
  {
    if (!v3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (![v5 isInWorkspace] || v3)
  {
LABEL_6:
    v6.receiver = self;
    v6.super_class = (Class)GAXSBExternalDisplayDefaultsOverride;
    [(GAXSBExternalDisplayDefaultsOverride *)&v6 setMirroringEnabled:v3];
  }
LABEL_7:
}

@end