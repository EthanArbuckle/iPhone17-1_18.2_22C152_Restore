@interface AXUISettingsTickMarkSlider
- (AXUISettingsTickMarkSlider)initWithFrame:(CGRect)a3;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (NSArray)ticks;
- (UIColor)postTickColor;
- (UIColor)trackFillColor;
- (double)tickHeight;
- (id)accessibilityLabel;
- (void)drawRect:(CGRect)a3;
- (void)setPostTickColor:(id)a3;
- (void)setTickHeight:(double)a3;
- (void)setTicks:(id)a3;
- (void)setTrackFillColor:(id)a3;
@end

@implementation AXUISettingsTickMarkSlider

- (AXUISettingsTickMarkSlider)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXUISettingsTickMarkSlider;
  v3 = -[PSSegmentableSlider initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(AXUISettingsTickMarkSlider *)v3 setContentMode:3];
    [(AXUISettingsTickMarkSlider *)v4 setSemanticContentAttribute:2];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  [(AXUISettingsTickMarkSlider *)self bounds];
  CGRect v59 = CGRectInset(v58, 2.0, 0.0);
  -[AXUISettingsTickMarkSlider trackRectForBounds:](self, "trackRectForBounds:", v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  UIGraphicsPushContext(CurrentContext);
  v13 = [(AXUISettingsTickMarkSlider *)self trackFillColor];

  if (v13) {
    [(AXUISettingsTickMarkSlider *)self trackFillColor];
  }
  else {
  v14 = [MEMORY[0x1E4FB1618] colorWithWhite:0.596078431 alpha:1.0];
  }
  [v14 set];

  v15 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v5, v7, v9, v11);
  [v15 setLineCapStyle:1];
  [v15 setLineJoinStyle:1];
  [v15 fill];
  UIGraphicsPopContext();
  UIGraphicsPushContext(CurrentContext);
  id v16 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
  [v16 setLineWidth:v11];
  [v16 setLineCapStyle:1];
  [v16 setLineJoinStyle:1];
  [(AXUISettingsTickMarkSlider *)self value];
  double v18 = v17;
  v19 = [(AXUISettingsTickMarkSlider *)self ticks];
  v20 = [v19 firstObject];
  [v20 doubleValue];
  if (v21 >= v18)
  {
  }
  else
  {
    v22 = [(AXUISettingsTickMarkSlider *)self postTickColor];

    if (!v22) {
      goto LABEL_9;
    }
    v19 = [(AXUISettingsTickMarkSlider *)self postTickColor];
    [v19 set];
  }

LABEL_9:
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v23 = [(AXUISettingsTickMarkSlider *)self ticks];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v53;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v53 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v52 + 1) + 8 * v27);
        [(AXUISettingsTickMarkSlider *)self tickHeight];
        if (v29 != 0.0) {
          [(AXUISettingsTickMarkSlider *)self tickHeight];
        }
        [v28 floatValue];
        v60.origin.x = v5;
        v60.origin.y = v7;
        v60.size.width = v9;
        v60.size.height = v11;
        CGRectGetMinX(v60);
        v61.origin.x = v5;
        v61.origin.y = v7;
        v61.size.width = v9;
        v61.size.height = v11;
        CGRectGetWidth(v61);
        PSRoundToPixel();
        double v31 = v30;
        PSRoundToPixel();
        objc_msgSend(v16, "moveToPoint:", v31, v32);
        PSRoundToPixel();
        objc_msgSend(v16, "addLineToPoint:", v31, v33);
        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v25);
  }

  [v16 closePath];
  [v16 stroke];
  UIGraphicsPopContext();
  UIGraphicsPushContext(CurrentContext);
  [(AXUISettingsTickMarkSlider *)self value];
  double v35 = v34;
  v36 = [(AXUISettingsTickMarkSlider *)self ticks];
  v37 = [v36 firstObject];
  [v37 doubleValue];
  if (v38 >= v35)
  {

    goto LABEL_22;
  }
  v39 = [(AXUISettingsTickMarkSlider *)self postTickColor];

  if (v39)
  {
    v40 = [(AXUISettingsTickMarkSlider *)self ticks];
    v41 = [v40 firstObject];
    [v41 doubleValue];
    double v43 = v9 * v42;

    double v44 = v5 + v43;
    [(AXUISettingsTickMarkSlider *)self value];
    double v46 = v45;
    v47 = [(AXUISettingsTickMarkSlider *)self ticks];
    v48 = [v47 firstObject];
    [v48 doubleValue];
    double v50 = v9 * (v46 - v49);

    v51 = [(AXUISettingsTickMarkSlider *)self postTickColor];
    [v51 set];

    v36 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v44, v7, v50, v11);
    [v36 setLineCapStyle:1];
    [v36 setLineJoinStyle:1];
    [v36 fill];
LABEL_22:
  }
  UIGraphicsPopContext();
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  v17.receiver = self;
  v17.super_class = (Class)AXUISettingsTickMarkSlider;
  -[PSSegmentableSlider thumbRectForBounds:trackRect:value:](&v17, sel_thumbRectForBounds_trackRect_value_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, LODWORD(a5));
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(AXUISettingsTickMarkSlider *)self minimumValue];
  [(AXUISettingsTickMarkSlider *)self maximumValue];
  [(AXUISettingsTickMarkSlider *)self minimumValue];
  PSRoundToPixel();
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)accessibilityLabel
{
  return AXUILocalizedStringForKey(@"LEFT_RIGHT_BALANCE_SPOKEN");
}

- (void)setTicks:(id)a3
{
  objc_storeStrong((id *)&self->_ticks, a3);
  [(AXUISettingsTickMarkSlider *)self setNeedsDisplay];
}

- (NSArray)ticks
{
  return self->_ticks;
}

- (UIColor)postTickColor
{
  return self->_postTickColor;
}

- (void)setPostTickColor:(id)a3
{
}

- (UIColor)trackFillColor
{
  return self->_trackFillColor;
}

- (void)setTrackFillColor:(id)a3
{
}

- (double)tickHeight
{
  return self->_tickHeight;
}

- (void)setTickHeight:(double)a3
{
  self->_tickHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackFillColor, 0);
  objc_storeStrong((id *)&self->_postTickColor, 0);
  objc_storeStrong((id *)&self->_ticks, 0);
}

@end