@interface FIUIChartBarAccessibilityElement
+ (id)accessibilityElementsForBarSeries:(id)a3;
- (CGPoint)barPoint;
- (CGRect)_accessibilityFrameStandardBar;
- (CGRect)_accessibilityFrameUniform;
- (CGRect)accessibilityFrame;
- (FIUIChartBarAccessibilityElement)initWithAccessibilityContainer:(id)a3 barSeries:(id)a4 index:(unint64_t)a5 plotPoint:(id)a6;
- (id)accessibilityLabel;
- (id)barSeries;
- (unint64_t)index;
- (void)setBarPoint:(CGPoint)a3;
- (void)setBarSeries:(id)a3;
- (void)setIndex:(unint64_t)a3;
@end

@implementation FIUIChartBarAccessibilityElement

- (FIUIChartBarAccessibilityElement)initWithAccessibilityContainer:(id)a3 barSeries:(id)a4 index:(unint64_t)a5 plotPoint:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)FIUIChartBarAccessibilityElement;
  v13 = [(FIUIChartBarAccessibilityElement *)&v16 initWithAccessibilityContainer:v10];
  [(FIUIChartBarAccessibilityElement *)v13 setBarSeries:v11];
  [(FIUIChartBarAccessibilityElement *)v13 setIndex:a5];
  objc_opt_class();
  v14 = __UIAccessibilityCastAsClass();
  [v14 CGPointValue];
  -[FIUIChartBarAccessibilityElement setBarPoint:](v13, "setBarPoint:");

  return v13;
}

- (CGRect)accessibilityFrame
{
  if (accessibilityFrame_onceToken != -1) {
    dispatch_once(&accessibilityFrame_onceToken, &__block_literal_global);
  }
  v3 = [(FIUIChartBarAccessibilityElement *)self barSeries];
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(FIUIChartBarAccessibilityElement *)self _accessibilityFrameUniform];
  }
  else {
    [(FIUIChartBarAccessibilityElement *)self _accessibilityFrameStandardBar];
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

void __54__FIUIChartBarAccessibilityElement_accessibilityFrame__block_invoke(id a1)
{
  accessibilityFrame_UniformBarClass = AXSafeClassFromString();
}

- (CGRect)_accessibilityFrameUniform
{
  [(FIUIChartBarAccessibilityElement *)self barPoint];
  objc_opt_class();
  v3 = [(FIUIChartBarAccessibilityElement *)self barSeries];
  v4 = __UIAccessibilityCastAsClass();

  [v4 safeDoubleForKey:@"_barWidth"];
  [v4 bounds];
  UIAccessibilityFrameForBounds();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_accessibilityFrameStandardBar
{
  objc_opt_class();
  v3 = [(FIUIChartBarAccessibilityElement *)self barSeries];
  v4 = __UIAccessibilityCastAsClass();

  [v4 safeDoubleForKey:@"_barWidth"];
  [v4 safeDoubleForKey:@"_barSpacing"];
  [(FIUIChartBarAccessibilityElement *)self index];
  [v4 bounds];
  UIAccessibilityFrameForBounds();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)accessibilityLabel
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  AXPerformSafeBlock();
  id v3 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  LOBYTE(v16) = 0;
  objc_opt_class();
  v4 = [v3 safeValueForKey:@"xValue"];
  double v5 = __UIAccessibilityCastAsClass();

  if ((_BYTE)v16) {
    abort();
  }
  [(FIUIChartBarAccessibilityElement *)self barPoint];
  double v6 = [(FIUIChartBarAccessibilityElement *)self accessibilityDelegate];
  UIRoundToViewScale();
  double v8 = v7;

  double v9 = AXClockTimeStringForDate();
  double v10 = +[AXAttributedString axAttributedStringWithString:v9];
  [v10 setAttribute:kCFBooleanTrue forKey:UIAccessibilityTokenClockTime];
  double v11 = [(FIUIChartBarAccessibilityElement *)self barSeries];
  double v12 = [v3 safeValueForKey:@"yValue"];
  double v15 = [v11 _accessibilityLabelForBarYPoint:v12 withValue:v8];
  double v13 = __AXStringForVariables();

  return v13;
}

void __54__FIUIChartBarAccessibilityElement_accessibilityLabel__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) barSeries];
  uint64_t v2 = objc_msgSend(v5, "_accessibilityChartPointForDataSetAtIndex:", objc_msgSend(*(id *)(a1 + 32), "index"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)accessibilityElementsForBarSeries:(id)a3
{
  id v3 = a3;
  objc_initWeak(&location, v3);
  v4 = +[NSMutableArray array];
  char v12 = 0;
  objc_opt_class();
  id v5 = [v3 safeValueForKey:@"_plotPoints"];
  double v6 = __UIAccessibilityCastAsClass();

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __70__FIUIChartBarAccessibilityElement_accessibilityElementsForBarSeries___block_invoke;
  v9[3] = &unk_8388;
  objc_copyWeak(&v11, &location);
  id v7 = v4;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __70__FIUIChartBarAccessibilityElement_accessibilityElementsForBarSeries___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v6 = [FIUIChartBarAccessibilityElement alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v8 = [(FIUIChartBarAccessibilityElement *)v6 initWithAccessibilityContainer:WeakRetained barSeries:WeakRetained index:a3 plotPoint:v5];

  [*(id *)(a1 + 32) addObject:v8];
}

- (CGPoint)barPoint
{
  double x = self->_barPoint.x;
  double y = self->_barPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBarPoint:(CGPoint)a3
{
  self->_barPoint = a3;
}

- (id)barSeries
{
  id WeakRetained = objc_loadWeakRetained(&self->_barSeries);

  return WeakRetained;
}

- (void)setBarSeries:(id)a3
{
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_indedouble x = a3;
}

- (void).cxx_destruct
{
}

@end