@interface CDRichComplicationCurvedProgressView
- (BOOL)clockwise;
- (CDRichComplicationCurvedProgressView)initWithFamily:(int64_t)a3 curveWidth:(double)a4 padding:(double)a5 beginAngle:(double)a6 endAngle:(double)a7 forDevice:(id)a8 withFilterStyle:(int64_t)a9 progressFillStyle:(int64_t)a10;
- (double)beginAngle;
- (double)endAngle;
- (id)colorForView:(id)a3 accented:(BOOL)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)filtersForView:(id)a3 style:(int64_t)a4;
- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3;
- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3 locations:(id)a4;
- (void)setBeginAngle:(double)a3;
- (void)setClockwise:(BOOL)a3;
- (void)setEndAngle:(double)a3;
- (void)setProgress:(double)a3;
@end

@implementation CDRichComplicationCurvedProgressView

- (CDRichComplicationCurvedProgressView)initWithFamily:(int64_t)a3 curveWidth:(double)a4 padding:(double)a5 beginAngle:(double)a6 endAngle:(double)a7 forDevice:(id)a8 withFilterStyle:(int64_t)a9 progressFillStyle:(int64_t)a10
{
  id v18 = a8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __138__CDRichComplicationCurvedProgressView_initWithFamily_curveWidth_padding_beginAngle_endAngle_forDevice_withFilterStyle_progressFillStyle___block_invoke;
  aBlock[3] = &unk_2644A52E8;
  double v30 = a4;
  double v31 = a5;
  double v32 = a6;
  double v33 = a7;
  id v19 = v18;
  id v29 = v19;
  int64_t v34 = a9;
  v20 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (unint64_t)a10 <= 7 && ((0xFDu >> a10)) {
    uint64_t v21 = objc_opt_class();
  }
  else {
    uint64_t v21 = 0;
  }
  self->_progressFillStyle = a10;
  v22 = v20[2](v20, v21);
  v23 = v20[2](v20, v21);
  v27.receiver = self;
  v27.super_class = (Class)CDRichComplicationCurvedProgressView;
  v24 = [(CDRichComplicationProgressView *)&v27 initForFamily:a3 device:v19 backgroundShapeView:v22 foregroundShapeView:v23];
  v25 = (CDRichComplicationCurvedProgressView *)v24;
  if (v24)
  {
    objc_storeStrong(v24 + 67, v22);
    objc_storeStrong((id *)&v25->_foregroundView, v23);
  }

  return v25;
}

id __138__CDRichComplicationCurvedProgressView_initWithFamily_curveWidth_padding_beginAngle_endAngle_forDevice_withFilterStyle_progressFillStyle___block_invoke(uint64_t a1, Class a2)
{
  v2 = (void *)[[a2 alloc] initWithCurveWidth:*(void *)(a1 + 32) padding:*(void *)(a1 + 72) beginAngle:*(double *)(a1 + 40) endAngle:*(double *)(a1 + 48) forDevice:*(double *)(a1 + 56) withFilterStyle:*(double *)(a1 + 64)];
  return v2;
}

- (void)setBeginAngle:(double)a3
{
  self->_beginAngle = a3;
  -[CDRichComplicationCurveView setBeginAngle:](self->_backgroundView, "setBeginAngle:");
  [(CDRichComplicationCurveView *)self->_foregroundView setBeginAngle:a3];
  [(CDRichComplicationCurvedProgressView *)self setNeedsLayout];
}

- (void)setEndAngle:(double)a3
{
  self->_endAngle = a3;
  -[CDRichComplicationCurveView setEndAngle:](self->_backgroundView, "setEndAngle:");
  [(CDRichComplicationCurveView *)self->_foregroundView setEndAngle:a3];
  [(CDRichComplicationCurvedProgressView *)self setNeedsLayout];
}

- (void)setClockwise:(BOOL)a3
{
  BOOL v3 = a3;
  self->_clockwise = a3;
  -[CDRichComplicationCurveView setClockwise:](self->_backgroundView, "setClockwise:");
  [(CDRichComplicationCurveView *)self->_foregroundView setClockwise:v3];
  [(CDRichComplicationCurvedProgressView *)self setNeedsLayout];
}

- (void)setProgress:(double)a3
{
  if (CDRichComplicationProgressFillStyleIsMetered(self->_progressFillStyle)) {
    [(CDRichComplicationShapeView *)self->_backgroundView setProgress:1.0];
  }
  v5.receiver = self;
  v5.super_class = (Class)CDRichComplicationCurvedProgressView;
  [(CDRichComplicationProgressView *)&v5 setProgress:a3];
}

- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3
{
  id v4 = a3;
  if (CDRichComplicationProgressFillStyleIsMetered(self->_progressFillStyle) && [v4 count])
  {
    uint64_t v5 = CDGenerateMeterBackgroundGradientColors([v4 count]);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CDRichComplicationCurvedProgressView;
    uint64_t v5 = [(CDRichComplicationProgressView *)&v8 overrideBackgroundGradientColorsForGradientColors:v4];
  }
  v6 = (void *)v5;

  return v6;
}

- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3 locations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (CDRichComplicationProgressFillStyleIsMetered(self->_progressFillStyle) && [v6 count])
  {
    uint64_t v8 = CDGenerateMeterBackgroundGradientColors([v6 count]);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CDRichComplicationCurvedProgressView;
    uint64_t v8 = [(CDRichComplicationProgressView *)&v11 overrideBackgroundGradientColorsForGradientColors:v6 locations:v7];
  }
  v9 = (void *)v8;

  return v9;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  id v6 = [(CDRichComplicationProgressView *)self filterProvider];
  id v7 = [v6 filtersForView:self style:a4];

  return v7;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  uint64_t v8 = [(CDRichComplicationProgressView *)self filterProvider];
  v9 = [v8 filtersForView:self style:a4 fraction:a5];

  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  uint64_t v8 = [(CDRichComplicationProgressView *)self filterProvider];
  v9 = [v8 filterForView:self style:a4 fraction:a5];

  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  id v6 = [(CDRichComplicationProgressView *)self filterProvider];
  id v7 = [v6 filterForView:self style:a4];

  return v7;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CDRichComplicationProgressView *)self filterProvider];
  uint64_t v8 = [v7 colorForView:v6 accented:v4];

  return v8;
}

- (double)beginAngle
{
  return self->_beginAngle;
}

- (double)endAngle
{
  return self->_endAngle;
}

- (BOOL)clockwise
{
  return self->_clockwise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end