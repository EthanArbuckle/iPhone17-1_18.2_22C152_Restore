@interface CRKDeviceDisplay
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGRect)frame;
- (CRKDeviceDisplay)initWithCoder:(id)a3;
- (CRKDeviceDisplay)initWithDictionary:(id)a3;
- (CRKDeviceDisplay)initWithScaleFactor:(double)a3 frame:(CGRect)a4 orientation:(unint64_t)a5;
- (CRKDeviceDisplay)initWithScaleFactor:(double)a3 width:(double)a4 height:(double)a5 orientation:(unint64_t)a6;
- (NSDictionary)dictionaryValue;
- (double)scaleFactor;
- (unint64_t)hash;
- (unint64_t)orientation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRKDeviceDisplay

- (CRKDeviceDisplay)initWithScaleFactor:(double)a3 frame:(CGRect)a4 orientation:(unint64_t)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)CRKDeviceDisplay;
  result = [(CRKDeviceDisplay *)&v12 init];
  if (result)
  {
    result->_scaleFactor = a3;
    result->_frame.origin.CGFloat x = x;
    result->_frame.origin.CGFloat y = y;
    result->_frame.size.CGFloat width = width;
    result->_frame.size.CGFloat height = height;
    result->_orientation = a5;
  }
  return result;
}

- (CRKDeviceDisplay)initWithScaleFactor:(double)a3 width:(double)a4 height:(double)a5 orientation:(unint64_t)a6
{
  return -[CRKDeviceDisplay initWithScaleFactor:frame:orientation:](self, "initWithScaleFactor:frame:orientation:", a6, a3, 0.0, 0.0, a4, a5);
}

- (CRKDeviceDisplay)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"scaleFactor"];
  [v5 floatValue];
  double v7 = v6;

  double v8 = CRKRectFromDictionary(v4);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [v4 objectForKeyedSubscript:@"orientation"];

  uint64_t v16 = [v15 unsignedIntegerValue];

  return -[CRKDeviceDisplay initWithScaleFactor:frame:orientation:](self, "initWithScaleFactor:frame:orientation:", v16, v7, v8, v10, v12, v14);
}

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  [(CRKDeviceDisplay *)self frame];
  double v8 = CRKDictionaryFromRect(v4, v5, v6, v7);
  [v3 addEntriesFromDictionary:v8];

  double v9 = NSNumber;
  [(CRKDeviceDisplay *)self scaleFactor];
  double v10 = objc_msgSend(v9, "numberWithDouble:");
  [v3 setObject:v10 forKeyedSubscript:@"scaleFactor"];

  double v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKDeviceDisplay orientation](self, "orientation"));
  [v3 setObject:v11 forKeyedSubscript:@"orientation"];

  double v12 = (void *)[v3 copy];

  return (NSDictionary *)v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKDeviceDisplay *)self dictionaryValue];
  [v4 encodeObject:v5 forKey:@"dictionaryValue"];
}

- (CRKDeviceDisplay)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = CRKFoundationClasses();
  CGFloat v6 = [v4 decodeObjectOfClasses:v5 forKey:@"dictionaryValue"];

  CGFloat v7 = [(CRKDeviceDisplay *)self initWithDictionary:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRKDeviceDisplay *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v22 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    CGFloat v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v25 = [MEMORY[0x263F08690] currentHandler];
      v26 = [NSString stringWithUTF8String:"-[CRKDeviceDisplay isEqual:]"];
      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      [v25 handleFailureInFunction:v26, @"CRKDeviceDisplay.m", 98, @"expected %@, got %@", v28, v30 file lineNumber description];
    }
    [(CRKDeviceDisplay *)self frame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [(CRKDeviceDisplay *)v6 frame];
    v32.origin.CGFloat x = v15;
    v32.origin.CGFloat y = v16;
    v32.size.CGFloat width = v17;
    v32.size.CGFloat height = v18;
    v31.origin.CGFloat x = v8;
    v31.origin.CGFloat y = v10;
    v31.size.CGFloat width = v12;
    v31.size.CGFloat height = v14;
    if (CGRectEqualToRect(v31, v32)
      && ([(CRKDeviceDisplay *)self scaleFactor],
          double v20 = v19,
          [(CRKDeviceDisplay *)v6 scaleFactor],
          vabdd_f64(v20, v21) <= 2.22044605e-16))
    {
      unint64_t v23 = [(CRKDeviceDisplay *)self orientation];
      BOOL v22 = v23 == [(CRKDeviceDisplay *)v6 orientation];
    }
    else
    {
      BOOL v22 = 0;
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (unint64_t)hash
{
  [(CRKDeviceDisplay *)self frame];
  unint64_t v7 = CRKRectHash(v3, v4, v5, v6);
  CGFloat v8 = NSNumber;
  [(CRKDeviceDisplay *)self scaleFactor];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  uint64_t v10 = [v9 hash] ^ v7;
  double v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKDeviceDisplay orientation](self, "orientation"));
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

@end