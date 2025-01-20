@interface CEKSliderTickMarksView
- (CEKSliderTickMarksDelegate)delegate;
- (CEKSliderTickMarksView)initWithFrame:(CGRect)a3;
- (CGRect)_shadowFrameForTickMarkRect:(CGRect)a3;
- (CGRect)frameForTickMarkAtIndex:(unint64_t)a3;
- (UIEdgeInsets)alignmentRectInsets;
- (_TtC13CameraEditKit14TickMarksModel)tickMarksModel;
- (void)drawRect:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)tickMarksModelDidChangeWidthForTickMarkCountWithModel:(id)a3;
@end

@implementation CEKSliderTickMarksView

- (CEKSliderTickMarksView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CEKSliderTickMarksView;
  v3 = -[CEKSliderTickMarksView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CEKSliderTickMarksView *)v3 setOpaque:0];
    [(CEKSliderTickMarksView *)v4 setContentMode:3];
    v5 = objc_alloc_init(_TtC13CameraEditKit14TickMarksModel);
    tickMarksModel = v4->_tickMarksModel;
    v4->_tickMarksModel = v5;

    [(TickMarksModel *)v4->_tickMarksModel setDataSource:v4];
    [(TickMarksModel *)v4->_tickMarksModel setDelegate:v4];
  }
  return v4;
}

- (UIEdgeInsets)alignmentRectInsets
{
  [(CEKSliderTickMarksView *)self _shadowWidth];
  double v4 = v3;
  v5 = [(CEKSliderTickMarksView *)self tickMarksModel];
  if ([v5 useTickMarkLegibilityShadows])
  {
    double v6 = v4;
    double v7 = v4;
    double v8 = v4;
  }
  else
  {
    double v6 = *MEMORY[0x1E4FB2848];
    double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }

  double v9 = v6;
  double v10 = v4;
  double v11 = v7;
  double v12 = v8;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (CGRect)frameForTickMarkAtIndex:(unint64_t)a3
{
  [(CEKSliderTickMarksView *)self bounds];
  -[CEKSliderTickMarksView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  double v6 = v5;
  double v8 = v7;
  double v9 = [(CEKSliderTickMarksView *)self tickMarksModel];
  [v9 tickMarkWidth];
  double v11 = v10;

  double v12 = [(CEKSliderTickMarksView *)self tickMarksModel];
  [v12 xOffsetForTickMarkIndex:a3];
  double v14 = v13;

  double v15 = v14;
  double v16 = v6;
  double v17 = v11;
  double v18 = v8;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_shadowFrameForTickMarkRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(CEKSliderTickMarksView *)self _shadowWidth];
  double v8 = -v7;
  CGFloat v9 = x;
  CGFloat v10 = y;
  CGFloat v11 = width;
  CGFloat v12 = height;
  return CGRectInset(*(CGRect *)&v9, v8, v8);
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  double v5 = [(CEKSliderTickMarksView *)self tickMarksModel];
  int v6 = [v5 useTickMarkLegibilityShadows];

  double v7 = [(CEKSliderTickMarksView *)self tickMarksModel];
  id v26 = [v7 mainTickMarkColor];

  double v8 = [(CEKSliderTickMarksView *)self tickMarksModel];
  CGFloat v9 = [v8 secondaryTickMarkColor];

  if (v6)
  {
    CGFloat v10 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    CGFloat v11 = [v10 colorWithAlphaComponent:0.15];
  }
  else
  {
    CGFloat v11 = 0;
  }
  CGFloat v12 = [(CEKSliderTickMarksView *)self tickMarksModel];
  uint64_t v13 = [v12 tickMarksCount];

  if (v13)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      double v15 = [(CEKSliderTickMarksView *)self tickMarksModel];
      int v16 = [v15 isMainTickMarkAtIndex:i];

      [(CEKSliderTickMarksView *)self frameForTickMarkAtIndex:i];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      if (v6)
      {
        [v11 set];
        -[CEKSliderTickMarksView _shadowFrameForTickMarkRect:](self, "_shadowFrameForTickMarkRect:", v18, v20, v22, v24);
        CGContextFillRect(CurrentContext, v28);
      }
      v25 = v26;
      if (!v16) {
        v25 = v9;
      }
      [v25 set];
      v29.origin.CGFloat x = v18;
      v29.origin.CGFloat y = v20;
      v29.size.CGFloat width = v22;
      v29.size.CGFloat height = v24;
      CGContextFillRect(CurrentContext, v29);
    }
  }
}

- (void)tickMarksModelDidChangeWidthForTickMarkCountWithModel:(id)a3
{
  id v4 = [(CEKSliderTickMarksView *)self delegate];
  [v4 tickMarksViewDidChangeWidthForTickMarkCount:self];
}

- (CEKSliderTickMarksDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CEKSliderTickMarksDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC13CameraEditKit14TickMarksModel)tickMarksModel
{
  return self->_tickMarksModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tickMarksModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end