@interface BrowseImageManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_createImageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6 nightMode:(BOOL)a7;
@end

@implementation BrowseImageManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BrowseImageManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_createImageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6 nightMode:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  v15.receiver = self;
  v15.super_class = (Class)BrowseImageManagerAccessibility;
  id v11 = a3;
  v12 = [(BrowseImageManagerAccessibility *)&v15 _createImageForCategory:v11 scale:a5 traits:v8 isCarplay:v7 nightMode:a4];
  v13 = objc_msgSend(v11, "safeValueForKey:", @"name", v15.receiver, v15.super_class);

  [v12 setAccessibilityIdentifier:v13];

  return v12;
}

@end