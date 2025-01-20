@interface AVTSCNNodeModifications
+ (BOOL)supportsSecureCoding;
- (AVTSCNNodeModifications)initWithCoder:(id)a3;
- (AVTSCNNodeModifications)initWithProjectionDirection:(double)a3 fieldOfView:(double)a4 verticalLensShift:(float)a5 framingMode:(id)a6;
- (NSString)framingMode;
- (double)fieldOfView;
- (float)verticalLensShift;
- (unint64_t)projectionDirection;
- (void)encodeWithCoder:(id)a3;
- (void)setFieldOfView:(double)a3;
- (void)setFramingMode:(id)a3;
- (void)setProjectionDirection:(unint64_t)a3;
- (void)setVerticalLensShift:(float)a3;
@end

@implementation AVTSCNNodeModifications

- (AVTSCNNodeModifications)initWithProjectionDirection:(double)a3 fieldOfView:(double)a4 verticalLensShift:(float)a5 framingMode:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)AVTSCNNodeModifications;
  v12 = [(AVTSCNNodeModifications *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_projectionDirection = (unint64_t)a3;
    v12->_fieldOfView = a4;
    v12->_verticalLensShift = a5;
    objc_storeStrong((id *)&v12->_framingMode, a6);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVTSCNNodeModifications)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (int)[v4 decodeIntForKey:@"projectionDirection"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fieldOfView"];
  [v6 doubleValue];
  double v8 = v7;

  [v4 decodeFloatForKey:@"lensShift"];
  float v10 = v9;
  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"framingMode"];

  v12 = [(AVTSCNNodeModifications *)self initWithProjectionDirection:v11 fieldOfView:(double)v5 verticalLensShift:v8 framingMode:v10];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  uint64_t projectionDirection_low = LODWORD(self->_projectionDirection);
  id v10 = a3;
  v6 = [v4 numberWithInt:projectionDirection_low];
  [v10 encodeObject:v6 forKey:@"projectionDirection"];

  double fieldOfView = self->_fieldOfView;
  *(float *)&double fieldOfView = fieldOfView;
  double v8 = [NSNumber numberWithFloat:fieldOfView];
  [v10 encodeObject:v8 forKey:@"fieldOfView"];

  *(float *)&double v9 = self->_verticalLensShift;
  [v10 encodeFloat:@"lensShift" forKey:v9];
  [v10 encodeObject:self->_framingMode forKey:@"framingMode"];
}

- (unint64_t)projectionDirection
{
  return self->_projectionDirection;
}

- (void)setProjectionDirection:(unint64_t)a3
{
  self->_projectionDirection = a3;
}

- (double)fieldOfView
{
  return self->_fieldOfView;
}

- (void)setFieldOfView:(double)a3
{
  self->_double fieldOfView = a3;
}

- (float)verticalLensShift
{
  return self->_verticalLensShift;
}

- (void)setVerticalLensShift:(float)a3
{
  self->_verticalLensShift = a3;
}

- (NSString)framingMode
{
  return self->_framingMode;
}

- (void)setFramingMode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end