@interface CKInputView
+ (CGSize)defaultContentSize;
+ (CGSize)defaultContentSizeLargerThanKeyboard:(BOOL *)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)lastContentSize;
- (int64_t)lastContentSizeInterfaceOrientation;
- (void)setLastContentSize:(CGSize)a3;
- (void)setLastContentSizeInterfaceOrientation:(int64_t)a3;
@end

@implementation CKInputView

- (CGSize)intrinsicContentSize
{
  [(CKInputView *)self lastContentSize];
  BOOL v5 = v4 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v5
    || (v6 = [(CKInputView *)self lastContentSizeInterfaceOrientation],
        v6 != CKNonFlatDeviceOrientation()))
  {
    [(CKInputView *)self invalidateIntrinsicContentSize];
    [(id)objc_opt_class() defaultContentSize];
    double v10 = v9;
    double v12 = v11;
    -[CKInputView setLastContentSize:](self, "setLastContentSize:");
    [(CKInputView *)self setLastContentSizeInterfaceOrientation:CKNonFlatDeviceOrientation()];
    double v7 = v10;
    double v8 = v12;
  }
  else
  {
    [(CKInputView *)self lastContentSize];
  }
  result.height = v8;
  result.width = v7;
  return result;
}

+ (CGSize)defaultContentSize
{
  [a1 defaultContentSizeLargerThanKeyboard:0];
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)defaultContentSizeLargerThanKeyboard:(BOOL *)a3
{
  double v4 = CKNonFlatDeviceOrientation();
  [MEMORY[0x1E4F42B08] sizeForInterfaceOrientation:v4 ignoreInputView:1];
  double v6 = v5;
  if ((unint64_t)v4 - 1 > 1
    || ([MEMORY[0x1E4F42948] currentDevice],
        double v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 userInterfaceIdiom],
        v7,
        (v8 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    if (a3)
    {
      BOOL v9 = 0;
LABEL_11:
      *a3 = v9;
    }
  }
  else
  {
    double v10 = [MEMORY[0x1E4F43058] keyWindow];
    [v10 safeAreaInsets];
    double v12 = v11 + 247.0;

    BOOL v13 = v12 <= v6;
    if (v12 >= v6) {
      double v6 = v12;
    }
    if (a3)
    {
      BOOL v9 = !v13;
      goto LABEL_11;
    }
  }
  double v14 = *MEMORY[0x1E4F43ED8];
  double v15 = v6;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)lastContentSize
{
  double width = self->_lastContentSize.width;
  double height = self->_lastContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastContentSize:(CGSize)a3
{
  self->_lastContentSize = a3;
}

- (int64_t)lastContentSizeInterfaceOrientation
{
  return self->_lastContentSizeInterfaceOrientation;
}

- (void)setLastContentSizeInterfaceOrientation:(int64_t)a3
{
  self->_lastContentSizeInterfaceOrientation = a3;
}

@end