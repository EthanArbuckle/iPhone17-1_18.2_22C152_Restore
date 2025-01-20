@interface GAXSBNSObjectOverride
+ (BOOL)__accessibilityGuidedAccessStateEnabled;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation GAXSBNSObjectOverride

+ (id)safeCategoryTargetClassName
{
  return @"NSObject";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)__accessibilityGuidedAccessStateEnabled
{
  v2 = +[GAXSpringboard sharedInstance];
  unsigned __int8 v3 = [v2 isActive];

  return v3;
}

@end