@interface _MKNanoAddressSnapshotViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation _MKNanoAddressSnapshotViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_MKNanoAddressSnapshotView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_MKNanoAddressSnapshotView" hasInstanceVariable:@"_mapItem" withType:"MKMapItem"];
  [v3 validateClass:@"_MKNanoAddressSnapshotView" hasInstanceVariable:@"_showsName" withType:"B"];
  [v3 validateClass:@"MKMapItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapItem", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapItem", @"_addressFormattedAsMultilineAddress", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(_MKNanoAddressSnapshotViewAccessibility *)self safeValueForKey:@"_mapItem"];
  v4 = [v3 safeValueForKey:@"name"];
  v5 = [v3 safeValueForKey:@"_addressFormattedAsMultilineAddress"];
  if ([(_MKNanoAddressSnapshotViewAccessibility *)self safeBoolForKey:@"_showsName"])
  {
    __UIAXStringForVariables();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = v5;
  }
  v7 = v6;

  return v7;
}

@end