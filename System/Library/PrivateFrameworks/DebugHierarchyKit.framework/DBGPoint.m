@interface DBGPoint
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withPoint:(CGPoint)a3;
- (CGPoint)point;
- (DBGPoint)initWithCGPoint:(CGPoint)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setPoint:(CGPoint)a3;
@end

@implementation DBGPoint

+ (id)withPoint:(CGPoint)a3
{
  id v3 = objc_msgSend(objc_alloc((Class)a1), "initWithCGPoint:", a3.x, a3.y);

  return v3;
}

- (DBGPoint)initWithCGPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)DBGPoint;
  result = [(DBGPoint *)&v6 init];
  if (result)
  {
    result->_point.CGFloat x = x;
    result->_point.CGFloat y = y;
  }
  return result;
}

- (id)objectValue
{
  return 0;
}

- (NSString)description
{
  v2 = [(DBGPoint *)self objectValue];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(DBGPoint *)self description];
  objc_super v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (CGPoint)point
{
  objc_copyStruct(v4, &self->_point, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_point, &v3, 16, 1, 0);
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  v7 = DBGDecodeValueFromJSONCompatibleValue();
  id v8 = 0;
  v9 = v8;
  if (v8)
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
    if (a5) {
      *a5 = v8;
    }
  }
  else
  {
    CFArrayRef v12 = v7;
    CFArrayRef v13 = v12;
    CGPoint valuePtr = CGPointZero;
    if (v12)
    {
      ValueAtIndedouble x = (const __CFNumber *)CFArrayGetValueAtIndex(v12, 0);
      CFNumberRef v15 = (const __CFNumber *)CFArrayGetValueAtIndex(v13, 1);
      CFNumberGetValue(ValueAtIndex, kCFNumberCGFloatType, &valuePtr);
      CFNumberGetValue(v15, kCFNumberCGFloatType, &valuePtr.y);
    }
    double y = valuePtr.y;
    double x = valuePtr.x;
  }
  v16 = objc_msgSend(a1, "withPoint:", x, y);

  return v16;
}

- (id)JSONCompatibleRepresentation
{
  [(DBGPoint *)self point];
  uint64_t valuePtr = v2;
  uint64_t v8 = v3;
  v4 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
  void *v4 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  v4[1] = CFNumberCreate(0, kCFNumberCGFloatType, &v8);
  CFArrayRef v5 = CFArrayCreate(0, v4, 2, &kCFTypeArrayCallBacks);
  CFRelease(*v4);
  CFRelease(v4[1]);
  free(v4);

  return v5;
}

@end