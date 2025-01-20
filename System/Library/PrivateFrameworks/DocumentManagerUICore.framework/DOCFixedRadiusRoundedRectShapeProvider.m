@interface DOCFixedRadiusRoundedRectShapeProvider
- (DOCFixedRadiusRoundedRectShapeProvider)initWithCornerRadius:(double)a3 insets:(UIEdgeInsets)a4;
- (UIEdgeInsets)insets;
- (double)cornerRadius;
- (id)resolvedShapeInContext:(id)a3;
@end

@implementation DOCFixedRadiusRoundedRectShapeProvider

- (DOCFixedRadiusRoundedRectShapeProvider)initWithCornerRadius:(double)a3 insets:(UIEdgeInsets)a4
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  v10.receiver = self;
  v10.super_class = (Class)DOCFixedRadiusRoundedRectShapeProvider;
  result = [(DOCFixedRadiusRoundedRectShapeProvider *)&v10 init];
  if (result)
  {
    result->_cornerRadius = a3;
    result->_insets.CGFloat top = top;
    result->_insets.CGFloat left = left;
    result->_insets.CGFloat bottom = bottom;
    result->_insets.CGFloat right = right;
  }
  return result;
}

- (id)resolvedShapeInContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 contentShape];
  [v5 boundingRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(DOCFixedRadiusRoundedRectShapeProvider *)self insets];
  double v15 = v7 + v14;
  double v17 = v9 + v16;
  double v19 = v11 - (v14 + v18);
  double v21 = v13 - (v16 + v20);

  v22 = (void *)MEMORY[0x263F1C978];
  [(DOCFixedRadiusRoundedRectShapeProvider *)self cornerRadius];
  v24 = objc_msgSend(v22, "fixedRectShapeWithRect:cornerRadius:", v15, v17, v19, v21, v23);
  v25 = [v24 resolvedShapeInContext:v4];

  return v25;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIEdgeInsets)insets
{
  objc_copyStruct(v6, &self->_insets, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.CGFloat right = v5;
  result.CGFloat bottom = v4;
  result.CGFloat left = v3;
  result.CGFloat top = v2;
  return result;
}

@end