@interface StockGraphViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)_accessibilityChildren;
- (id)_accessibilityChildrenWithmaxChildrenCount:(int)a3 frame:(CGRect)a4;
- (id)_accessibilityNanoChildren;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (int64_t)accessibilityElementCount;
- (int64_t)indexOfAccessibilityElement:(id)a3;
- (void)clearData;
- (void)dealloc;
@end

@implementation StockGraphViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"StockGraphView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"StockGraphView"];
  [v3 validateClass:@"StockGraphView" hasInstanceVariable:@"_chartData" withType:"StockChartData"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"StockGraphView", @"clearData", "v", 0);
}

- (CGRect)accessibilityFrame
{
  v8.receiver = self;
  v8.super_class = (Class)StockGraphViewAccessibility;
  [(StockGraphViewAccessibility *)&v8 accessibilityFrame];
  double v5 = v4 + 20.0;
  double v7 = v6 + -40.0;
  result.size.height = v3;
  result.size.width = v7;
  result.origin.y = v2;
  result.origin.x = v5;
  return result;
}

- (void)clearData
{
  v3.receiver = self;
  v3.super_class = (Class)StockGraphViewAccessibility;
  [(StockGraphViewAccessibility *)&v3 clearData];
  [(StockGraphViewAccessibility *)self _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
}

- (void)dealloc
{
  [(StockGraphViewAccessibility *)self _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
  v3.receiver = self;
  v3.super_class = (Class)StockGraphViewAccessibility;
  [(StockGraphViewAccessibility *)&v3 dealloc];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (int64_t)accessibilityElementCount
{
  objc_super v3 = [(StockGraphViewAccessibility *)self safeValueForKey:@"alpha"];
  [v3 floatValue];
  float v5 = v4;

  if (v5 == 0.0) {
    return 0;
  }
  double v7 = [(StockGraphViewAccessibility *)self _accessibilityChildren];
  int64_t v8 = [v7 count];

  return v8;
}

- (id)_accessibilityChildren
{
  [(StockGraphViewAccessibility *)self bounds];

  return -[StockGraphViewAccessibility _accessibilityChildrenWithmaxChildrenCount:frame:](self, "_accessibilityChildrenWithmaxChildrenCount:frame:", 10);
}

- (id)_accessibilityNanoChildren
{
  [(StockGraphViewAccessibility *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  v9 = [(StockGraphViewAccessibility *)self superview];
  [v9 size];
  double v11 = v10;

  return -[StockGraphViewAccessibility _accessibilityChildrenWithmaxChildrenCount:frame:](self, "_accessibilityChildrenWithmaxChildrenCount:frame:", 5, v4, v6, v8, v11);
}

- (id)_accessibilityChildrenWithmaxChildrenCount:(int)a3 frame:(CGRect)a4
{
  double v6 = (void *)MEMORY[0x263F81490];
  double v7 = [(StockGraphViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v7)
  {
    uint64_t v8 = [(StockGraphViewAccessibility *)self safeValueForKey:@"_chartData"];
    if (v8)
    {
      v9 = (void *)v8;
      double v7 = (void *)[objc_allocWithZone(MEMORY[0x263EFF980]) init];
      [(StockGraphViewAccessibility *)self _accessibilitySetRetainedValue:v7 forKey:*v6];
      uint64_t v10 = [v9 stockValues];
      double v11 = [v9 safeValueForKey:@"stockValueCount"];
      uint64_t v12 = [v11 unsignedIntegerValue];

      v13 = [(StockGraphViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Stockchartview.isa)];
      v29 = v13;
      if (v13) {
        uint64_t v31 = [v13 safeIntegerForKey:@"_selectedInterval"];
      }
      else {
        uint64_t v31 = 0;
      }
      v30 = v9;
      uint64_t v14 = [v9 safeValueForKey:@"marketTimeZone"];
      uint64_t v15 = a3;
      if (v12 < a3) {
        uint64_t v15 = v12;
      }
      uint64_t v32 = v15;
      v33 = (void *)v14;
      BOOL v16 = v15 < 1;
      unint64_t v17 = v15 - 1;
      if (!v16)
      {
        uint64_t v18 = 0;
        unint64_t v19 = (v12 - 1) / v17;
        do
        {
          v20 = (void *)[objc_allocWithZone(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
          v21 = (void *)MEMORY[0x263EFF910];
          double v22 = *(double *)(v10 + 24 * v19 * v18);
          id v23 = v33;
          v24 = [v21 dateWithTimeIntervalSince1970:v22];
          v25 = (void *)[objc_allocWithZone(MEMORY[0x263F08790]) init];
          [v25 setTimeZone:v23];

          if (v31) {
            [v25 setDateStyle:3];
          }
          else {
            [v25 setTimeStyle:1];
          }
          v26 = [v25 stringFromDate:v24];
          v27 = [NSString stringWithFormat:@"%@, %.02f", v26, *(void *)(v10 + 24 * v19 * v18 + 8)];

          [v20 setAccessibilityLabel:v27];
          UIAccessibilityFrameForBounds();
          objc_msgSend(v20, "setAccessibilityFrame:");
          if ([(id)*MEMORY[0x263F1D020] _accessibilityApplicationIsRTL]) {
            [v7 insertObject:v20 atIndex:0];
          }
          else {
            [v7 addObject:v20];
          }

          ++v18;
        }
        while (v32 != v18);
      }
    }
    else
    {
      double v7 = 0;
    }
  }

  return v7;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4 = a3;
  double v5 = [(StockGraphViewAccessibility *)self _accessibilityChildren];
  int64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  id v4 = [(StockGraphViewAccessibility *)self _accessibilityChildren];
  if ([v4 count] >= (unint64_t)a3)
  {
    double v5 = [v4 objectAtIndex:a3];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

@end