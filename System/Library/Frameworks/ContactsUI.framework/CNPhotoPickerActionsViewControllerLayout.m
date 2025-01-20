@interface CNPhotoPickerActionsViewControllerLayout
+ (double)buttonHeight;
+ (double)heightForButtonsViewWithButtonCount:(int64_t)a3;
- (CGRect)actionButtonsViewFrame;
- (CGRect)actionButtonsViewFrameForButtonCount:(int64_t)a3;
- (CGRect)imageContainerViewFrame;
- (CGSize)containerSize;
- (CNPhotoPickerActionsViewControllerLayout)initWithContainerSize:(CGSize)a3 insets:(UIEdgeInsets)a4 buttonCount:(int64_t)a5;
- (UIEdgeInsets)edgeInsets;
- (int64_t)buttonCount;
@end

@implementation CNPhotoPickerActionsViewControllerLayout

- (int64_t)buttonCount
{
  return self->_buttonCount;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)containerSize
{
  double width = self->_containerSize.width;
  double height = self->_containerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)imageContainerViewFrame
{
  [(CNPhotoPickerActionsViewControllerLayout *)self actionButtonsViewFrameForButtonCount:+[CNPhotoPickerActionsModel maximumNumberOfButtons]];
  double v4 = v3;
  double v6 = v5;
  [(CNPhotoPickerActionsViewControllerLayout *)self containerSize];
  double v8 = v7;
  [(CNPhotoPickerActionsViewControllerLayout *)self containerSize];
  if (v8 <= v9)
  {
    [(CNPhotoPickerActionsViewControllerLayout *)self containerSize];
  }
  else
  {
    [(CNPhotoPickerActionsViewControllerLayout *)self containerSize];
    double v11 = v10 - v6;
    [(CNPhotoPickerActionsViewControllerLayout *)self edgeInsets];
    double v13 = v11 - v12;
    [(CNPhotoPickerActionsViewControllerLayout *)self edgeInsets];
    double v15 = v13 - v14 + -15.0;
  }
  double v16 = fmin(v15, 212.0);
  [(CNPhotoPickerActionsViewControllerLayout *)self containerSize];
  double v18 = floor((v17 - v16) * 0.5);
  double v19 = v4 - v4 * 0.5 - v16 * 0.5 + 15.0;
  double v20 = v16;
  double v21 = v16;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)actionButtonsViewFrame
{
  int64_t v3 = [(CNPhotoPickerActionsViewControllerLayout *)self buttonCount];

  [(CNPhotoPickerActionsViewControllerLayout *)self actionButtonsViewFrameForButtonCount:v3];
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)actionButtonsViewFrameForButtonCount:(int64_t)a3
{
  [(id)objc_opt_class() heightForButtonsViewWithButtonCount:a3];
  double v5 = v4;
  [(CNPhotoPickerActionsViewControllerLayout *)self containerSize];
  double v7 = v6 + -20.0;
  [(CNPhotoPickerActionsViewControllerLayout *)self containerSize];
  double v9 = v8;
  [(CNPhotoPickerActionsViewControllerLayout *)self edgeInsets];
  double v11 = v9 - v10 - v5 + -10.0;
  double v12 = 10.0;
  double v13 = v7;
  double v14 = v5;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
}

- (CNPhotoPickerActionsViewControllerLayout)initWithContainerSize:(CGSize)a3 insets:(UIEdgeInsets)a4 buttonCount:(int64_t)a5
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)CNPhotoPickerActionsViewControllerLayout;
  double v12 = [(CNPhotoPickerActionsViewControllerLayout *)&v16 init];
  double v13 = v12;
  if (v12)
  {
    v12->_containerSize.CGFloat width = width;
    v12->_containerSize.CGFloat height = height;
    v12->_edgeInsets.CGFloat top = top;
    v12->_edgeInsets.CGFloat left = left;
    v12->_edgeInsets.CGFloat bottom = bottom;
    v12->_edgeInsets.CGFloat right = right;
    v12->_buttonCount = a5;
    double v14 = v12;
  }

  return v13;
}

+ (double)heightForButtonsViewWithButtonCount:(int64_t)a3
{
  double v4 = (double)a3;
  [a1 buttonHeight];
  return (double)(a3 - 1) * 10.0 + v4 * v5;
}

+ (double)buttonHeight
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];
  [v2 ascender];
  double v4 = v3;
  [v2 descender];
  double v6 = fmax(v4 - v5 + 28.0, 50.0);

  return v6;
}

@end