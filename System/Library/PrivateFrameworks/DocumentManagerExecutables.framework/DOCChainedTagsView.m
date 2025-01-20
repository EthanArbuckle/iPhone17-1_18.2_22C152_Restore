@interface DOCChainedTagsView
- (CGPoint)alignmentOffset;
- (CGSize)intrinsicContentSize;
- (DOCChainedTagsView)init;
- (DOCChainedTagsView)initWithCoder:(id)a3;
- (DOCChainedTagsView)initWithFrame:(CGRect)a3;
- (DOCTagRenderingRequest)renderingRequest;
- (NSArray)tags;
- (UIColor)selectionOutlineColor;
- (double)knockOutBorderWidth;
- (double)tagDimension;
- (unint64_t)spacing;
- (void)_reloadRenderingRequest;
- (void)doc_commonInit;
- (void)drawRect:(CGRect)a3;
- (void)setAlignmentOffset:(CGPoint)a3;
- (void)setKnockOutBorderWidth:(double)a3;
- (void)setRenderingRequest:(id)a3;
- (void)setSelectionOutlineColor:(id)a3;
- (void)setSpacing:(unint64_t)a3;
- (void)setTagDimension:(double)a3;
- (void)setTags:(id)a3;
- (void)setknockOutBorderWidth:(double)a3;
- (void)sizeToFit;
@end

@implementation DOCChainedTagsView

- (DOCChainedTagsView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DOCChainedTagsView;
  v3 = -[DOCChainedTagsView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(DOCChainedTagsView *)v3 doc_commonInit];
  }
  return v4;
}

- (DOCChainedTagsView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DOCChainedTagsView;
  v3 = [(DOCChainedTagsView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(DOCChainedTagsView *)v3 doc_commonInit];
  }
  return v4;
}

- (DOCChainedTagsView)init
{
  v5.receiver = self;
  v5.super_class = (Class)DOCChainedTagsView;
  v2 = [(DOCChainedTagsView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(DOCChainedTagsView *)v2 doc_commonInit];
  }
  return v3;
}

- (void)doc_commonInit
{
  self->_knockOutBorderWidth = 1.0;
  self->_spacing = 0;
  [(DOCChainedTagsView *)self _reloadRenderingRequest];
}

- (void)setTags:(id)a3
{
  objc_storeStrong((id *)&self->_tags, a3);

  [(DOCChainedTagsView *)self _reloadRenderingRequest];
}

- (void)setknockOutBorderWidth:(double)a3
{
  if (self->_knockOutBorderWidth != a3)
  {
    self->_knockOutBorderWidth = a3;
    [(DOCChainedTagsView *)self _reloadRenderingRequest];
  }
}

- (void)setSpacing:(unint64_t)a3
{
  if (self->_spacing != a3)
  {
    self->_spacing = a3;
    [(DOCChainedTagsView *)self _reloadRenderingRequest];
  }
}

- (void)setTagDimension:(double)a3
{
  if (self->_tagDimension != a3)
  {
    self->_tagDimension = a3;
    [(DOCChainedTagsView *)self _reloadRenderingRequest];
  }
}

- (void)setSelectionOutlineColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  p_selectionOutlineColor = &self->_selectionOutlineColor;
  if (self->_selectionOutlineColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_selectionOutlineColor, a3);
    p_selectionOutlineColor = (UIColor **)[(DOCChainedTagsView *)self _reloadRenderingRequest];
    objc_super v5 = v7;
  }

  MEMORY[0x270F9A758](p_selectionOutlineColor, v5);
}

- (CGSize)intrinsicContentSize
{
  v2 = [(DOCChainedTagsView *)self renderingRequest];
  if (v2)
  {
    v3 = +[DOCTagRenderer shared];
    [v3 sizeOfTagContentForRenderingRequest:v2];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x263F001B0];
    double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)sizeToFit
{
  v3.receiver = self;
  v3.super_class = (Class)DOCChainedTagsView;
  [(DOCChainedTagsView *)&v3 sizeToFit];
  [(DOCChainedTagsView *)self intrinsicContentSize];
  [(DOCChainedTagsView *)self frame];
  -[DOCChainedTagsView setFrame:](self, "setFrame:");
}

- (void)drawRect:(CGRect)a3
{
  id v4 = [(DOCChainedTagsView *)self renderingRequest];
  if (v4)
  {
    objc_super v3 = +[DOCTagRenderer shared];
    [v3 renderInUncacheableContext:UIGraphicsGetCurrentContext() request:v4];
  }
}

- (void)_reloadRenderingRequest
{
  v22 = self->_renderingRequest;
  objc_super v3 = +[DOCTagRenderingRequest requestForChainedTags:self->_tags tagDimension:self->_tagDimension];
  [(DOCChainedTagsView *)self knockOutBorderWidth];
  -[DOCTagRenderingRequest setKnockOutBorderWidth:](v3, "setKnockOutBorderWidth:");
  [(DOCTagRenderingRequest *)v3 setLayoutDirection:[(DOCChainedTagsView *)self effectiveUserInterfaceLayoutDirection]];
  [(DOCTagRenderingRequest *)v3 setSpacingType:self->_spacing];
  id v4 = [(DOCChainedTagsView *)self selectionOutlineColor];
  [(DOCTagRenderingRequest *)v3 setSelectionOutlineColor:v4];

  double v5 = v22;
  if (v22)
  {
    double v6 = +[DOCTagRenderer shared];
    [v6 sizeOfTagContentForRenderingRequest:v22];
    double v8 = v7;
    double v10 = v9;

    double v5 = v22;
  }
  else
  {
    double v8 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  v11 = [(DOCTagRenderingRequest *)v5 fillColors];
  v12 = [(DOCTagRenderingRequest *)v22 selectionOutlineColor];
  if (v3)
  {
    v13 = +[DOCTagRenderer shared];
    [v13 sizeOfTagContentForRenderingRequest:v3];
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    double v15 = *MEMORY[0x263F001B0];
    double v17 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  v18 = [(DOCTagRenderingRequest *)v3 fillColors];
  v19 = [(DOCTagRenderingRequest *)v3 selectionOutlineColor];
  renderingRequest = self->_renderingRequest;
  self->_renderingRequest = v3;

  if (v8 != v15 || v10 != v17) {
    [(DOCChainedTagsView *)self invalidateIntrinsicContentSize];
  }
  if (([v11 isEqual:v18] & 1) == 0) {
    [(DOCChainedTagsView *)self setNeedsDisplay];
  }
  if (([v12 isEqual:v19] & 1) == 0) {
    [(DOCChainedTagsView *)self setNeedsDisplay];
  }
}

- (NSArray)tags
{
  return self->_tags;
}

- (double)knockOutBorderWidth
{
  return self->_knockOutBorderWidth;
}

- (void)setKnockOutBorderWidth:(double)a3
{
  self->_knockOutBorderWidth = a3;
}

- (unint64_t)spacing
{
  return self->_spacing;
}

- (double)tagDimension
{
  return self->_tagDimension;
}

- (CGPoint)alignmentOffset
{
  double x = self->_alignmentOffset.x;
  double y = self->_alignmentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAlignmentOffset:(CGPoint)a3
{
  self->_alignmentOffset = a3;
}

- (UIColor)selectionOutlineColor
{
  return self->_selectionOutlineColor;
}

- (DOCTagRenderingRequest)renderingRequest
{
  return self->_renderingRequest;
}

- (void)setRenderingRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingRequest, 0);
  objc_storeStrong((id *)&self->_selectionOutlineColor, 0);

  objc_storeStrong((id *)&self->_tags, 0);
}

@end