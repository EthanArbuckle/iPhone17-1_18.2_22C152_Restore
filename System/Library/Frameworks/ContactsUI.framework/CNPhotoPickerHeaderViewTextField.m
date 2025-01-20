@interface CNPhotoPickerHeaderViewTextField
- (CGRect)editingRectForBounds:(CGRect)a3;
- (double)maxWidth;
- (void)setMaxWidth:(double)a3;
@end

@implementation CNPhotoPickerHeaderViewTextField

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v27.receiver = self;
  v27.super_class = (Class)CNPhotoPickerHeaderViewTextField;
  double height = a3.size.height;
  -[CNPhotoPickerHeaderViewTextField editingRectForBounds:](&v27, sel_editingRectForBounds_);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if ([(CNPhotoPickerHeaderViewTextField *)self effectiveUserInterfaceLayoutDirection] == 1)double v15 = -10.0; {
  else
  }
    double v15 = 10.0;
  double v16 = v12 + 10.0;
  [(CNPhotoPickerHeaderViewTextField *)self maxWidth];
  if (v16 >= v17)
  {
    v26.receiver = self;
    v26.super_class = (Class)CNPhotoPickerHeaderViewTextField;
    -[CNPhotoPickerHeaderViewTextField editingRectForBounds:](&v26, sel_editingRectForBounds_, x, y, width, height);
    double v10 = v19;
    double v16 = v20;
    double v14 = v21;
  }
  else
  {
    double v18 = v8 - v15;
  }
  double v22 = v10;
  double v23 = v16;
  double v24 = v14;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v18;
  return result;
}

@end