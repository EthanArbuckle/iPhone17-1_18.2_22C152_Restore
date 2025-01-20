@interface CRSUIClusterThemeLinearGradient
+ (BOOL)supportsBSXPCSecureCoding;
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (CRSUIClusterThemeLinearGradient)initWithBSXPCCoder:(id)a3;
- (CRSUIClusterThemeLinearGradient)initWithLocations:(id)a3 colors:(id)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6;
- (NSArray)colors;
- (NSArray)locations;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CRSUIClusterThemeLinearGradient

- (CRSUIClusterThemeLinearGradient)initWithLocations:(id)a3 colors:(id)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v8 = a5.y;
  CGFloat v9 = a5.x;
  id v12 = a3;
  id v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CRSUIClusterThemeLinearGradient;
  v14 = [(CRSUIClusterThemeLinearGradient *)&v18 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    locations = v14->_locations;
    v14->_locations = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_themeColors, a4);
    v14->_startPoint.CGFloat x = v9;
    v14->_startPoint.CGFloat y = v8;
    v14->_endPoint.CGFloat x = x;
    v14->_endPoint.CGFloat y = y;
  }

  return v14;
}

- (NSArray)colors
{
  return (NSArray *)[(NSArray *)self->_themeColors bs_map:&__block_literal_global_8];
}

uint64_t __41__CRSUIClusterThemeLinearGradient_colors__block_invoke(uint64_t a1, void *a2)
{
  return [a2 color];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (CRSUIClusterThemeLinearGradient)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [v4 decodeCollectionOfClass:v5 containingClass:objc_opt_class() forKey:@"locations"];
  uint64_t v7 = objc_opt_class();
  CGFloat v8 = [v4 decodeCollectionOfClass:v7 containingClass:objc_opt_class() forKey:@"colors"];
  [v4 decodeCGPointForKey:@"startPoint"];
  double v10 = v9;
  double v12 = v11;
  [v4 decodeCGPointForKey:@"endPoint"];
  double v14 = v13;
  double v16 = v15;

  v17 = -[CRSUIClusterThemeLinearGradient initWithLocations:colors:startPoint:endPoint:](self, "initWithLocations:colors:startPoint:endPoint:", v6, v8, v10, v12, v14, v16);
  return v17;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  locations = self->_locations;
  id v5 = a3;
  [v5 encodeCollection:locations forKey:@"locations"];
  [v5 encodeCollection:self->_themeColors forKey:@"colors"];
  objc_msgSend(v5, "encodeCGPoint:forKey:", @"startPoint", self->_startPoint.x, self->_startPoint.y);
  objc_msgSend(v5, "encodeCGPoint:forKey:", @"endPoint", self->_endPoint.x, self->_endPoint.y);
}

- (NSArray)locations
{
  return self->_locations;
}

- (CGPoint)startPoint
{
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x = self->_endPoint.x;
  double y = self->_endPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_themeColors, 0);
}

@end