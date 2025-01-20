@interface DirectionsStepTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axRoadDescriptionLabel;
- (id)_axStepView;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateRoadDescriptionListView;
- (void)setRoute:(id)a3 step:(id)a4 stepIndex:(unint64_t)a5 alignToLeftEdgeIfNoManeuverSign:(BOOL)a6 size:(int64_t)a7;
@end

@implementation DirectionsStepTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DirectionsStepTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"DirectionsStepTableViewCell" hasInstanceVariable:@"_stepView" withType:"DirectionsStepView"];
  [v3 validateClass:@"DirectionsStepView" hasInstanceVariable:@"_labelListView" withType:"RouteStepLabelListView"];
  [v3 validateClass:@"DirectionsStepView" hasInstanceVariable:@"_roadDescriptionLabel" withType:"MKMultiPartLabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DirectionsStepView", @"setRoute:step:stepIndex:alignToLeftEdgeIfNoManeuverSign:size:", "v", "@", "@", "Q", "B", "q", 0);
}

- (void)_axAnnotateRoadDescriptionListView
{
  id v2 = [(DirectionsStepTableViewCellAccessibility *)self safeUIViewForKey:@"_roadDescriptionLabel"];
  [v2 setAccessibilityElementsHidden:1];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)DirectionsStepTableViewCellAccessibility;
  [(DirectionsStepTableViewCellAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(DirectionsStepTableViewCellAccessibility *)self _axAnnotateRoadDescriptionListView];
}

- (id)_axStepView
{
  return (id)[(DirectionsStepTableViewCellAccessibility *)self safeValueForKey:@"_stepView"];
}

- (id)_axRoadDescriptionLabel
{
  id v2 = [(DirectionsStepTableViewCellAccessibility *)self safeUIViewForKey:@"_roadDescriptionLabel"];
  objc_super v3 = [v2 accessibilityLabel];

  return v3;
}

- (void)setRoute:(id)a3 step:(id)a4 stepIndex:(unint64_t)a5 alignToLeftEdgeIfNoManeuverSign:(BOOL)a6 size:(int64_t)a7
{
  v8.receiver = self;
  v8.super_class = (Class)DirectionsStepTableViewCellAccessibility;
  [(DirectionsStepTableViewCellAccessibility *)&v8 setRoute:a3 step:a4 stepIndex:a5 alignToLeftEdgeIfNoManeuverSign:a6 size:a7];
  [(DirectionsStepTableViewCellAccessibility *)self _axAnnotateRoadDescriptionListView];
}

- (id)accessibilityLabel
{
  objc_super v3 = [(DirectionsStepTableViewCellAccessibility *)self _axStepView];
  v4 = [v3 safeValueForKey:@"_labelListView"];
  v5 = [v4 accessibilityLabel];
  objc_super v8 = [(DirectionsStepTableViewCellAccessibility *)self _axRoadDescriptionLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

@end