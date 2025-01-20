@interface AIRecognizedText
- (AIRecognizedText)initWithString:(id)a3;
- (AIRecognizedText)initWithString:(id)a3 center:(CGPoint)a4;
- (AIRecognizedText)initWithString:(id)a3 center:(CGPoint)a4 numericalValue:(id)a5;
- (AIRecognizedText)initWithString:(id)a3 center:(CGPoint)a4 width:(double)a5 numericalValue:(id)a6;
- (AIRecognizedText)initWithTextObservation:(id)a3;
- (AIRecognizedText)initWithTextObservation:(id)a3 regionOfInterest:(CGRect)a4;
- (CGPoint)_point:(CGPoint)a3 adjustedByRegionOfInterest:(CGRect)a4;
- (CGPoint)center;
- (CGRect)boundingBoxForRange:(_NSRange)a3 error:(id *)a4;
- (CGRect)regionOfInterest;
- (NSNumber)numericalValue;
- (NSString)string;
- (VNRecognizedText)recognizedText;
- (double)width;
- (id)description;
- (void)setCenter:(CGPoint)a3;
- (void)setNumericalValue:(id)a3;
- (void)setRecognizedText:(id)a3;
- (void)setRegionOfInterest:(CGRect)a3;
- (void)setString:(id)a3;
- (void)setWidth:(double)a3;
@end

@implementation AIRecognizedText

- (AIRecognizedText)initWithTextObservation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AIRecognizedText;
  v5 = [(AIRecognizedText *)&v13 init];
  if (v5)
  {
    v6 = [v4 topCandidates:1];
    v7 = [v6 firstObject];
    [(AIRecognizedText *)v5 setRecognizedText:v7];

    v8 = [(AIRecognizedText *)v5 recognizedText];
    v9 = [v8 string];
    [(AIRecognizedText *)v5 setString:v9];

    [v4 boundingBox];
    double MidX = CGRectGetMidX(v14);
    [v4 boundingBox];
    -[AIRecognizedText setCenter:](v5, "setCenter:", MidX, CGRectGetMidY(v15));
    [v4 boundingBox];
    [(AIRecognizedText *)v5 setWidth:v11];
  }

  return v5;
}

- (AIRecognizedText)initWithTextObservation:(id)a3 regionOfInterest:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v8 = [(AIRecognizedText *)self initWithTextObservation:a3];
  v9 = v8;
  if (v8)
  {
    -[AIRecognizedText setRegionOfInterest:](v8, "setRegionOfInterest:", x, y, width, height);
    [(AIRecognizedText *)v9 center];
    double v11 = v10;
    double v13 = v12;
    [(AIRecognizedText *)v9 regionOfInterest];
    -[AIRecognizedText _point:adjustedByRegionOfInterest:](v9, "_point:adjustedByRegionOfInterest:", v11, v13, v14, v15, v16, v17);
    -[AIRecognizedText setCenter:](v9, "setCenter:");
  }
  return v9;
}

- (AIRecognizedText)initWithString:(id)a3 center:(CGPoint)a4 width:(double)a5 numericalValue:(id)a6
{
  v7 = -[AIRecognizedText initWithString:center:numericalValue:](self, "initWithString:center:numericalValue:", a3, a6, a4.x, a4.y);
  v8 = v7;
  if (v7) {
    [(AIRecognizedText *)v7 setWidth:a5];
  }
  return v8;
}

- (CGRect)boundingBoxForRange:(_NSRange)a3 error:(id *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v8 = [(AIRecognizedText *)self recognizedText];

  if (v8)
  {
    v9 = [(AIRecognizedText *)self recognizedText];
    double v10 = objc_msgSend(v9, "boundingBoxForRange:error:", location, length, a4);

    [v10 topLeft];
    double v12 = v11;
    double v14 = v13;
    [(AIRecognizedText *)self regionOfInterest];
    -[AIRecognizedText _point:adjustedByRegionOfInterest:](self, "_point:adjustedByRegionOfInterest:", v12, v14, v15, v16, v17, v18);
    double v20 = v19;
    double v22 = v21;
    [v10 topRight];
    double v24 = v23;
    double v26 = v25;
    [(AIRecognizedText *)self regionOfInterest];
    -[AIRecognizedText _point:adjustedByRegionOfInterest:](self, "_point:adjustedByRegionOfInterest:", v24, v26, v27, v28, v29, v30);
    double v32 = v31 - v20;
    double v34 = v33 - v22;
  }
  else
  {
    double v20 = *MEMORY[0x263F001A8];
    double v22 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v32 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v34 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v35 = v20;
  double v36 = v22;
  double v37 = v32;
  double v38 = v34;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.double y = v36;
  result.origin.double x = v35;
  return result;
}

- (CGPoint)_point:(CGPoint)a3 adjustedByRegionOfInterest:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v8 = a3.y;
  double v9 = a3.x;
  if (!CGRectIsEmpty(a4))
  {
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    double v10 = CGRectGetWidth(v15);
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    double v11 = CGRectGetHeight(v16);
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    double v9 = CGRectGetMinX(v17) + v10 * v9;
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    double v8 = CGRectGetMinY(v18) + v11 * v8;
  }
  double v12 = v9;
  double v13 = v8;
  result.CGFloat y = v13;
  result.CGFloat x = v12;
  return result;
}

- (id)description
{
  v3 = [(AIRecognizedText *)self numericalValue];

  id v4 = NSString;
  if (v3)
  {
    v14.receiver = self;
    v14.super_class = (Class)AIRecognizedText;
    v5 = [(AIRecognizedText *)&v14 description];
    v6 = [(AIRecognizedText *)self string];
    v7 = [(AIRecognizedText *)self numericalValue];
    [(AIRecognizedText *)self center];
    double v8 = NSStringFromCGPoint(v16);
    [(AIRecognizedText *)self width];
    double v10 = [v4 stringWithFormat:@"%@ '%@' (%@) at point %@ width %f", v5, v6, v7, v8, v9];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)AIRecognizedText;
    v5 = [(AIRecognizedText *)&v13 description];
    v6 = [(AIRecognizedText *)self string];
    [(AIRecognizedText *)self center];
    v7 = NSStringFromCGPoint(v17);
    [(AIRecognizedText *)self width];
    double v10 = [v4 stringWithFormat:@"%@ '%@' at point %@ width %f", v5, v6, v7, v11];
  }

  return v10;
}

- (AIRecognizedText)initWithString:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AIRecognizedText;
  v5 = [(AIRecognizedText *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AIRecognizedText *)v5 setString:v4];
  }

  return v6;
}

- (AIRecognizedText)initWithString:(id)a3 center:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v6 = [(AIRecognizedText *)self initWithString:a3];
  v7 = v6;
  if (v6) {
    -[AIRecognizedText setCenter:](v6, "setCenter:", x, y);
  }
  return v7;
}

- (AIRecognizedText)initWithString:(id)a3 center:(CGPoint)a4 numericalValue:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  double v10 = -[AIRecognizedText initWithString:center:](self, "initWithString:center:", a3, x, y);
  uint64_t v11 = v10;
  if (v10) {
    [(AIRecognizedText *)v10 setNumericalValue:v9];
  }

  return v11;
}

- (NSNumber)numericalValue
{
  return self->_numericalValue;
}

- (void)setNumericalValue:(id)a3
{
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_CGFloat width = a3;
}

- (CGRect)regionOfInterest
{
  double x = self->_regionOfInterest.origin.x;
  double y = self->_regionOfInterest.origin.y;
  double width = self->_regionOfInterest.size.width;
  double height = self->_regionOfInterest.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRegionOfInterest:(CGRect)a3
{
  self->_regionOfInterest = a3;
}

- (VNRecognizedText)recognizedText
{
  return self->_recognizedText;
}

- (void)setRecognizedText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizedText, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_numericalValue, 0);
}

@end