@interface CKPopoverViewLayout
- (BOOL)isMutating;
- (CGPoint)anchorCenter;
- (CGRect)anchorFrameInContainer;
- (CGRect)popoverFrameInContainer;
- (CGSize)anchorSize;
- (CGSize)containerSize;
- (CGSize)preferredContentSize;
- (CKPopoverViewLayout)initWithConfiguration:(id)a3;
- (CKPopoverViewLayoutConfiguration)configuration;
- (id)description;
- (id)newLayoutMetricsWithCoordinateSpace:(id)a3;
- (unint64_t)state;
- (void)setAnchorCenter:(CGPoint)a3;
- (void)setAnchorSize:(CGSize)a3;
- (void)setConfiguration:(id)a3;
- (void)setContainerSize:(CGSize)a3;
- (void)setMutating:(BOOL)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setState:(unint64_t)a3;
- (void)updateProperties:(id)a3;
@end

@implementation CKPopoverViewLayout

- (CKPopoverViewLayout)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKPopoverViewLayout;
  v6 = [(CKPopoverViewLayout *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_mutating = 0;
    CGSize v8 = (CGSize)*MEMORY[0x1E4F1DB30];
    v6->_anchorCenter = (CGPoint)*MEMORY[0x1E4F1DAD8];
    v6->_anchorSize = v8;
    v6->_containerSize = v8;
    v6->_preferredContentSize = v8;
    v6->_state = 0;
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (id)description
{
  [(CKPopoverViewLayout *)self popoverFrameInContainer];
  return (id)[NSString stringWithFormat:@"<CKPopoverViewLayout: %p, size=%.02fpt%.02fpt, origin=%.02fpt%.02fpt>", self, v5, v6, v3, v4];
}

- (CGRect)anchorFrameInContainer
{
  double width = self->_anchorSize.width;
  double height = self->_anchorSize.height;
  double v4 = self->_anchorCenter.x - width * 0.5;
  double v5 = self->_anchorCenter.y - height * 0.5;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)updateProperties:(id)a3
{
  self->_mutating = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_mutating = 0;
}

- (CGRect)popoverFrameInContainer
{
  -[CKPopoverViewLayoutConfiguration optimalSizeForPreferredContentSize:state:](self->_configuration, "optimalSizeForPreferredContentSize:state:", self->_state, self->_preferredContentSize.width, self->_preferredContentSize.height);
  double v4 = v3;
  double v6 = v5;
  double height = self->_containerSize.height;
  [(CKPopoverViewLayoutConfiguration *)self->_configuration maximumHeight];
  double v9 = v8;
  double y = self->_anchorCenter.y;
  double v28 = self->_containerSize.height;
  double v10 = self->_anchorSize.height;
  [(CKPopoverViewLayoutConfiguration *)self->_configuration minimumTopSpacing];
  double v12 = v11;
  [(CKPopoverViewLayout *)self anchorFrameInContainer];
  double Width = CGRectGetWidth(v29);
  [(CKPopoverViewLayout *)self anchorFrameInContainer];
  double v14 = Width - CGRectGetMidX(v30);
  if (v14 >= -58.0) {
    double v15 = v14;
  }
  else {
    double v15 = -58.0;
  }
  [(CKPopoverViewLayout *)self anchorFrameInContainer];
  double v16 = CGRectGetMidX(v31) + v15;
  CGFloat v17 = self->_containerSize.width - (v4 + v16);
  [(CKPopoverViewLayoutConfiguration *)self->_configuration minimumTrailingSpacing];
  double v19 = v17 - v18;
  if (v19 >= 0.0) {
    double v19 = -0.0;
  }
  double v20 = v16 + v19;
  if (height >= v9) {
    double v21 = v9;
  }
  else {
    double v21 = height;
  }
  double v22 = v21 - (v12 + v28 - (y + v10 * 0.5));
  if (v22 < v6) {
    double v6 = v22;
  }
  [(CKPopoverViewLayout *)self anchorFrameInContainer];
  double v23 = CGRectGetMaxY(v32) - v6;
  double v24 = v20;
  double v25 = v4;
  double v26 = v6;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v23;
  result.origin.x = v24;
  return result;
}

- (id)newLayoutMetricsWithCoordinateSpace:(id)a3
{
  id v4 = a3;
  double v5 = [CKPopoverViewLayoutMetrics alloc];
  unint64_t v6 = [(CKPopoverViewLayout *)self state];
  [(CKPopoverViewLayout *)self popoverFrameInContainer];
  v7 = -[CKPopoverViewLayoutMetrics initWithState:frame:coordinateSpace:](v5, "initWithState:frame:coordinateSpace:", v6, v4);

  return v7;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (CGSize)containerSize
{
  double width = self->_containerSize.width;
  double height = self->_containerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContainerSize:(CGSize)a3
{
  self->_containerSize = a3;
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (CGPoint)anchorCenter
{
  double x = self->_anchorCenter.x;
  double y = self->_anchorCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAnchorCenter:(CGPoint)a3
{
  self->_anchorCenter = a3;
}

- (CGSize)anchorSize
{
  double width = self->_anchorSize.width;
  double height = self->_anchorSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAnchorSize:(CGSize)a3
{
  self->_anchorSize = a3;
}

- (BOOL)isMutating
{
  return self->_mutating;
}

- (void)setMutating:(BOOL)a3
{
  self->_mutating = a3;
}

- (CKPopoverViewLayoutConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end