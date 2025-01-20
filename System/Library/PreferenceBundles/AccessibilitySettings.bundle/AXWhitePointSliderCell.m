@interface AXWhitePointSliderCell
- (AXWhitePointSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (double)maximumValue;
- (double)minimumValue;
- (id)accessibilityLabel;
- (void)_updateRightLabelWithValue:(double)a3;
- (void)handleSliderBeingDragged:(id)a3;
- (void)handleSliderDidFinishDrag:(id)a3;
@end

@implementation AXWhitePointSliderCell

- (AXWhitePointSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)AXWhitePointSliderCell;
  v5 = [(AXWhitePointSliderCell *)&v10 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("setter-queue", 0);
    setterQueue = v5->_setterQueue;
    v5->_setterQueue = (OS_dispatch_queue *)v6;

    v8 = [(AXWhitePointSliderCell *)v5 slider];
    [v8 setContinuous:1];

    [(AXWhitePointSliderCell *)v5 initialValue];
    -[AXWhitePointSliderCell _updateRightLabelWithValue:](v5, "_updateRightLabelWithValue:");
  }
  return v5;
}

- (void)_updateRightLabelWithValue:(double)a3
{
  v4 = [(AXWhitePointSliderCell *)self slider];
  [v4 value];
  v5 = AXFormatFloatWithPercentage();
  [(AXWhitePointSliderCell *)self setLabelText:v5];

  id v6 = objc_initWeak(&location, self);
  v7 = [(AXWhitePointSliderCell *)self slider];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __53__AXWhitePointSliderCell__updateRightLabelWithValue___block_invoke;
  v8[3] = &unk_209258;
  objc_copyWeak(&v9, &location);
  [v7 _setAccessibilityValueBlock:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

id __53__AXWhitePointSliderCell__updateRightLabelWithValue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained slider];
  [v2 value];
  v3 = AXFormatFloatWithPercentage();

  return v3;
}

- (id)accessibilityLabel
{
  return settingsLocString(@"WhitePointSlider", @"Accessibility");
}

- (void)handleSliderBeingDragged:(id)a3
{
  id v4 = a3;
  setterQueue = self->_setterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __51__AXWhitePointSliderCell_handleSliderBeingDragged___block_invoke;
  block[3] = &unk_2087C0;
  id v9 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)setterQueue, block);
  [v6 value];
  [(AXWhitePointSliderCell *)self _updateRightLabelWithValue:v7];
}

uint64_t __51__AXWhitePointSliderCell_handleSliderBeingDragged___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) value];
  v2.n128_f64[0] = v2.n128_f32[0];

  return _MADisplayFilterPrefSetReduceWhitePointIntensity(v1, v2);
}

- (void)handleSliderDidFinishDrag:(id)a3
{
  id v3 = [a3 value];
  v4.n128_f64[0] = v4.n128_f32[0];

  _MADisplayFilterPrefSetReduceWhitePointIntensity(v3, v4);
}

- (double)maximumValue
{
  return kMADisplayFilterPrefReduceWhitePointIntensityMax;
}

- (double)minimumValue
{
  return kMADisplayFilterPrefReduceWhitePointIntensityMin;
}

- (void).cxx_destruct
{
}

@end