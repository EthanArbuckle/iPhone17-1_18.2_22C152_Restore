@interface NTKFaceColorEditOptionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilitySuppressKeylineAnnouncement;
@end

@implementation NTKFaceColorEditOptionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKFaceColorEditOption";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySuppressKeylineAnnouncement
{
  return 1;
}

@end