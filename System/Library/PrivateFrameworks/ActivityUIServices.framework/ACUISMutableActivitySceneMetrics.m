@interface ACUISMutableActivitySceneMetrics
- (ACUISEdgeInsets)edgeInsets;
- (CGSize)size;
- (double)cornerRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCornerRadius:(double)a3;
- (void)setEdgeInsets:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation ACUISMutableActivitySceneMetrics

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [ACUISActivitySceneMetrics alloc];
  [(ACUISMutableActivitySceneMetrics *)self size];
  double v6 = v5;
  double v8 = v7;
  [(ACUISMutableActivitySceneMetrics *)self cornerRadius];
  double v10 = v9;
  v11 = [(ACUISMutableActivitySceneMetrics *)self edgeInsets];
  v12 = -[ACUISActivitySceneMetrics initWithSize:cornerRadius:edgeInsets:](v4, "initWithSize:cornerRadius:edgeInsets:", v11, v6, v8, v10);

  return v12;
}

- (CGSize)size
{
  double width = self->size.width;
  double height = self->size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->size = a3;
}

- (double)cornerRadius
{
  return self->cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->cornerRadius = a3;
}

- (ACUISEdgeInsets)edgeInsets
{
  return self->edgeInsets;
}

- (void)setEdgeInsets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end