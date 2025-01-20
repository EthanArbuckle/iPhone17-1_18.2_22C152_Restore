@interface CITextFeature
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (CGRect)bounds;
- (CITextFeature)initWithBounds:(CGRect)a3 topLeft:(CGPoint)a4 topRight:(CGPoint)a5 bottomLeft:(CGPoint)a6 bottomRight:(CGPoint)a7 subFeatures:(id)a8 messageString:(id)a9;
- (NSArray)subFeatures;
- (NSString)messageString;
- (id)type;
- (void)dealloc;
@end

@implementation CITextFeature

- (id)type
{
  return @"Text";
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CITextFeature;
  [(CITextFeature *)&v3 dealloc];
}

- (CITextFeature)initWithBounds:(CGRect)a3 topLeft:(CGPoint)a4 topRight:(CGPoint)a5 bottomLeft:(CGPoint)a6 bottomRight:(CGPoint)a7 subFeatures:(id)a8 messageString:(id)a9
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v11 = a5.y;
  CGFloat v12 = a5.x;
  CGFloat v13 = a4.y;
  CGFloat v14 = a4.x;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v17 = a3.origin.y;
  CGFloat v18 = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)CITextFeature;
  v19 = [(CIFeature *)&v22 init];
  v20 = v19;
  if (v19)
  {
    v19->bounds.origin.CGFloat x = v18;
    v19->bounds.origin.CGFloat y = v17;
    v19->bounds.size.CGFloat width = width;
    v19->bounds.size.CGFloat height = height;
    v19->topLeft.CGFloat x = v14;
    v19->topLeft.CGFloat y = v13;
    v19->topRight.CGFloat x = v12;
    v19->topRight.CGFloat y = v11;
    v19->bottomLeft.CGFloat x = v23;
    v19->bottomLeft.CGFloat y = v24;
    v19->bottomRight.CGFloat x = v25;
    v19->bottomRight.CGFloat y = v26;
    v19->subFeatures = (NSArray *)[*(id *)&x copy];
    v20->messageString = (NSString *)[*(id *)&y copy];
  }
  return v20;
}

- (CGRect)bounds
{
  objc_copyStruct(v6, &self->bounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (CGPoint)topLeft
{
  objc_copyStruct(v4, &self->topLeft, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGPoint)topRight
{
  objc_copyStruct(v4, &self->topRight, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGPoint)bottomLeft
{
  objc_copyStruct(v4, &self->bottomLeft, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGPoint)bottomRight
{
  objc_copyStruct(v4, &self->bottomRight, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (NSArray)subFeatures
{
  return self->subFeatures;
}

- (NSString)messageString
{
  return self->messageString;
}

@end