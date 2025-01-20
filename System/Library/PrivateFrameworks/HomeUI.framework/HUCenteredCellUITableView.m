@interface HUCenteredCellUITableView
- (CGRect)keyboardFrame;
- (void)layoutSubviews;
- (void)setKeyboardFrame:(CGRect)a3;
@end

@implementation HUCenteredCellUITableView

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)HUCenteredCellUITableView;
  [(HUCenteredCellUITableView *)&v33 layoutSubviews];
  if (([MEMORY[0x1E4F69758] isProxHandOffV2Config] & 1) == 0)
  {
    [(HUCenteredCellUITableView *)self rowHeight];
    double v4 = v3;
    [(HUCenteredCellUITableView *)self sectionHeaderHeight];
    double v6 = v4 + v5;
    [(HUCenteredCellUITableView *)self sectionFooterHeight];
    double v8 = v6 + v7;
    v9 = [(HUCenteredCellUITableView *)self window];
    [(HUCenteredCellUITableView *)self bounds];
    objc_msgSend(v9, "convertRect:fromView:", self);
    v36.origin.CGFloat x = v10;
    v36.origin.CGFloat y = v11;
    v36.size.CGFloat width = v12;
    v36.size.double height = v13;
    CGRect v34 = CGRectIntersection(self->_keyboardFrame, v36);
    CGFloat x = v34.origin.x;
    CGFloat y = v34.origin.y;
    CGFloat width = v34.size.width;
    double height = v34.size.height;

    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.double height = height;
    IsEmptCGFloat y = CGRectIsEmpty(v35);
    double v19 = 20.0;
    if (!IsEmpty) {
      double v19 = height;
    }
    double v20 = v8 + v19;
    double v21 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v22 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v23 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    [(HUCenteredCellUITableView *)self bounds];
    float v25 = (v24 - v20) * 0.5;
    double v26 = floorf(v25);
    [(HUCenteredCellUITableView *)self contentInset];
    if (v21 != v30 || (v27 == v26 ? (BOOL v31 = v23 == v29) : (BOOL v31 = 0), v31 ? (v32 = v22 == v28) : (v32 = 0), !v32)) {
      -[HUCenteredCellUITableView setContentInset:](self, "setContentInset:", v26, v21, v22, v23);
    }
  }
}

- (CGRect)keyboardFrame
{
  double x = self->_keyboardFrame.origin.x;
  double y = self->_keyboardFrame.origin.y;
  double width = self->_keyboardFrame.size.width;
  double height = self->_keyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

@end