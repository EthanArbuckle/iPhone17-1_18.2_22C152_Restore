@interface CLKUIDualTimeDigitalTicksView
+ (CGSize)_sizeFromFrame:(CGRect)a3;
- (BOOL)editing;
- (BOOL)hideActiveTicks;
- (BOOL)isFrozen;
- (CLKUIDualTimeDigitalTicksView)initWithConfiguration:(id *)a3 timer:(id)a4;
- (CLKUIDualTimeDigitalTicksView)initWithFrame:(CGRect)a3 configuration:(id *)a4 timer:(id)a5;
- (CLKUIDualTimeDigitalTicksViewPaletteDelegate)delegate;
- (NSDate)overrideDate;
- (UIColor)activeTickColor;
- (UIColor)inactiveTickColor;
- (void)_colorizeDigitalTicksWithActiveColor:(id)a3 inactiveColor:(id)a4 now:(id)a5 secondFraction:(double)a6;
- (void)_configureTicks;
- (void)_refreshDigitalTicksWithNow:(id)a3 secondFraction:(double)a4;
- (void)layoutSubviews;
- (void)refreshTicks;
- (void)setActiveTickColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setHideActiveTicks:(BOOL)a3;
- (void)setInactiveTickColor:(id)a3;
- (void)setOverrideDate:(id)a3;
- (void)startAnimation;
- (void)stopAnimation;
@end

@implementation CLKUIDualTimeDigitalTicksView

- (CLKUIDualTimeDigitalTicksView)initWithConfiguration:(id *)a3 timer:(id)a4
{
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  CGSize var1 = a3->var1;
  v10[0] = a3->var0;
  v10[1] = var1;
  v10[2] = *(_OWORD *)&a3->var2;
  return -[CLKUIDualTimeDigitalTicksView initWithFrame:configuration:timer:](self, "initWithFrame:configuration:timer:", v10, a4, v4, v5, v6, v7);
}

- (CLKUIDualTimeDigitalTicksView)initWithFrame:(CGRect)a3 configuration:(id *)a4 timer:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CLKUIDualTimeDigitalTicksView;
  v13 = -[CLKUIDualTimeDigitalTicksView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_hideActiveTicks = 0;
    CGSize var0 = a4->var0;
    long long v16 = *(_OWORD *)&a4->var2;
    v13->_configuration.cardinalTickSize = a4->var1;
    *(_OWORD *)&v13->_configuration.tickInset = v16;
    v13->_configuration.tickSize = var0;
    activeTickColor = v13->_activeTickColor;
    v13->_activeTickColor = 0;

    inactiveTickColor = v14->_inactiveTickColor;
    v14->_inactiveTickColor = 0;

    objc_storeStrong((id *)&v14->_timer, a5);
    uint64_t v19 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
    calendar = v14->_calendar;
    v14->_calendar = (NSCalendar *)v19;

    v21 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    [(NSCalendar *)v14->_calendar setTimeZone:v21];

    [(CLKUIDualTimeDigitalTicksView *)v14 _configureTicks];
    objc_msgSend((id)objc_opt_class(), "_sizeFromFrame:", x, y, width, height);
    v14->_lastSize.double width = v22;
    v14->_lastSize.double height = v23;
  }

  return v14;
}

- (void)setOverrideDate:(id)a3
{
  double v5 = (NSDate *)a3;
  p_overrideDate = &self->_overrideDate;
  if (self->_overrideDate != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_overrideDate, a3);
    p_overrideDate = (NSDate **)[(CLKUIDualTimeDigitalTicksView *)self refreshTicks];
    double v5 = v7;
  }
  MEMORY[0x1F41817F8](p_overrideDate, v5);
}

- (void)refreshTicks
{
}

- (void)startAnimation
{
  if (!self->_clockTimerToken)
  {
    objc_initWeak(&location, self);
    timer = self->_timer;
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    v8 = __47__CLKUIDualTimeDigitalTicksView_startAnimation__block_invoke;
    v9 = &unk_1E697BB18;
    objc_copyWeak(&v10, &location);
    double v4 = [(CLKClockTimer *)timer startUpdatesWithUpdateFrequency:2 withHandler:&v6 identificationLog:&__block_literal_global_2];
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = v4;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  [(CLKUIDualTimeDigitalTicksView *)self refreshTicks];
}

void __47__CLKUIDualTimeDigitalTicksView_startAnimation__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained && !WeakRetained[505] && !WeakRetained[504]) {
    [WeakRetained _refreshDigitalTicksWithNow:*a3 secondFraction:*((double *)a3 + 4)];
  }
}

__CFString *__47__CLKUIDualTimeDigitalTicksView_startAnimation__block_invoke_2()
{
  return @"CLKUIDualTimeView";
}

- (void)stopAnimation
{
  if (self->_clockTimerToken)
  {
    -[CLKClockTimer stopUpdatesForToken:](self->_timer, "stopUpdatesForToken:");
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;
  }
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CLKUIDualTimeDigitalTicksView;
  [(CLKUIDualTimeDigitalTicksView *)&v9 layoutSubviews];
  v3 = objc_opt_class();
  [(CLKUIDualTimeDigitalTicksView *)self frame];
  objc_msgSend(v3, "_sizeFromFrame:");
  CGFloat v6 = v5;
  CGFloat v7 = v4;
  if (self->_lastSize.width != v5 || self->_lastSize.height != v4)
  {
    [(CLKUIDualTimeDigitalTicksView *)self _configureTicks];
    self->_lastSize.double width = v6;
    self->_lastSize.double height = v7;
  }
}

+ (CGSize)_sizeFromFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v7 = CGRectGetWidth(a3);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v11);
  double v9 = v7;
  result.CGFloat height = v8;
  result.CGFloat width = v9;
  return result;
}

- (void)_configureTicks
{
  [(CLKUIDualTimeDigitalTicksView *)self bounds];
  double width = self->_configuration.tickSize.width;
  double v27 = v3;
  double v24 = self->_configuration.cardinalTickSize.width;
  double height = self->_configuration.tickSize.height;
  double v23 = self->_configuration.cardinalTickSize.height;
  double v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:60];
  unint64_t v5 = 0;
  double v6 = 0.0;
  do
  {
    if (v5 >= [(NSArray *)self->_digitalTicks count]) {
      [MEMORY[0x1E4F39BE8] layer];
    }
    else {
    CGFloat v7 = [(NSArray *)self->_digitalTicks objectAtIndexedSubscript:v5];
    }
    if (_disabledLayerActions_onceToken != -1) {
      dispatch_once(&_disabledLayerActions_onceToken, &__block_literal_global_85);
    }
    [v7 setActions:_disabledLayerActions__dictionary];
    id v8 = [MEMORY[0x1E4FB1618] whiteColor];
    objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

    int v9 = -15 * ((286331154 * (unint64_t)v5) >> 32) + v5;
    if (v9) {
      double v10 = height;
    }
    else {
      double v10 = v23;
    }
    if (v9) {
      double v11 = width;
    }
    else {
      double v11 = v24;
    }
    if (v9) {
      uint64_t v12 = 32;
    }
    else {
      uint64_t v12 = 40;
    }
    objc_msgSend(v7, "setBounds:", 0.0, 0.0, v11, v10);
    [v7 setCornerRadius:v11 * 0.5];
    double v13 = *(double *)((char *)&self->_configuration.tickSize.width + v12);
    [v7 bounds];
    double v15 = (v27 - v14 - v13) * 0.5;
    [(CLKUIDualTimeDigitalTicksView *)self bounds];
    double v17 = v16 * 0.5;
    __double2 v18 = __sincos_stret(v6 * 0.104719755 + -1.57079633);
    [(CLKUIDualTimeDigitalTicksView *)self bounds];
    objc_msgSend(v7, "setPosition:", v17 + v15 * v18.__cosval, v19 * 0.5 + v15 * v18.__sinval);
    CGAffineTransformMakeRotation(&v28, v6 * 0.104719755 + 3.14159265);
    [v7 setAffineTransform:&v28];
    [v4 addObject:v7];
    v20 = [(CLKUIDualTimeDigitalTicksView *)self layer];
    [v20 addSublayer:v7];

    double v6 = (double)++v5;
  }
  while (v5 != 60);
  v21 = (NSArray *)[v4 copy];
  digitalTicks = self->_digitalTicks;
  self->_digitalTicks = v21;
}

- (void)_refreshDigitalTicksWithNow:(id)a3 secondFraction:(double)a4
{
  id v11 = a3;
  if (self->_activeTickColor && self->_inactiveTickColor)
  {
    -[CLKUIDualTimeDigitalTicksView _colorizeDigitalTicksWithActiveColor:inactiveColor:now:secondFraction:](self, "_colorizeDigitalTicksWithActiveColor:inactiveColor:now:secondFraction:", a4);
  }
  else
  {
    double v6 = [(CLKUIDualTimeDigitalTicksView *)self delegate];

    if (v6)
    {
      CGFloat v7 = [(CLKUIDualTimeDigitalTicksView *)self delegate];
      id v8 = [v7 activeColorForDualTimeDigitalTicksView:self];

      int v9 = [(CLKUIDualTimeDigitalTicksView *)self delegate];
      double v10 = [v9 inactiveColorForDualTimeDigitalTicksView:self];

      [(CLKUIDualTimeDigitalTicksView *)self _colorizeDigitalTicksWithActiveColor:v8 inactiveColor:v10 now:v11 secondFraction:a4];
    }
  }
}

- (void)_colorizeDigitalTicksWithActiveColor:(id)a3 inactiveColor:(id)a4 now:(id)a5 secondFraction:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (NSDate *)a5;
  double v13 = v12;
  if (self->_hideActiveTicks)
  {
    uint64_t v14 = -1;
  }
  else
  {
    overrideDate = self->_overrideDate;
    if (overrideDate || (overrideDate = v12) != 0)
    {
      double v16 = overrideDate;
    }
    else
    {
      double v16 = [MEMORY[0x1E4F196B0] now];
    }
    double v17 = v16;
    __double2 v18 = [(NSCalendar *)self->_calendar components:128 fromDate:v16];
    uint64_t v14 = [v18 second];

    if (self->_overrideDate) {
      a6 = 0.0;
    }
  }
  id v19 = v11;
  v20 = v19;
  v21 = v19;
  if (!self->_hideActiveTicks)
  {
    v21 = v19;
    if (!self->_frozen)
    {
      v21 = v19;
      if (!self->_editing)
      {
        v21 = v19;
        if (a6 >= 0.883333333)
        {
          CLKCompressFraction();
          v21 = CLKInterpolateBetweenColors();
        }
      }
    }
  }
  digitalTicks = self->_digitalTicks;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __103__CLKUIDualTimeDigitalTicksView__colorizeDigitalTicksWithActiveColor_inactiveColor_now_secondFraction___block_invoke;
  v26[3] = &unk_1E697BB60;
  id v27 = v21;
  id v28 = v10;
  id v29 = v20;
  uint64_t v30 = v14;
  id v23 = v20;
  id v24 = v10;
  id v25 = v21;
  [(NSArray *)digitalTicks enumerateObjectsUsingBlock:v26];
}

void __103__CLKUIDualTimeDigitalTicksView__colorizeDigitalTicksWithActiveColor_inactiveColor_now_secondFraction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = v5 + 1;
  BOOL v7 = v5 < a3;
  id v8 = (id *)(a1 + 48);
  if (!v7) {
    id v8 = (id *)(a1 + 40);
  }
  if (v6 == a3) {
    id v8 = (id *)(a1 + 32);
  }
  objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(*v8, "CGColor"));
}

- (void)setHideActiveTicks:(BOOL)a3
{
  self->_hideActiveTicks = a3;
  [(CLKUIDualTimeDigitalTicksView *)self refreshTicks];
}

- (CLKUIDualTimeDigitalTicksViewPaletteDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CLKUIDualTimeDigitalTicksViewPaletteDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (UIColor)activeTickColor
{
  return self->_activeTickColor;
}

- (void)setActiveTickColor:(id)a3
{
}

- (UIColor)inactiveTickColor
{
  return self->_inactiveTickColor;
}

- (void)setInactiveTickColor:(id)a3
{
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (BOOL)hideActiveTicks
{
  return self->_hideActiveTicks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_inactiveTickColor, 0);
  objc_storeStrong((id *)&self->_activeTickColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_digitalTicks, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end