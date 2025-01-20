@interface DBGRect
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withRect:(CGRect)a3;
- (CGRect)rect;
- (DBGRect)initWithCGRect:(CGRect)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setRect:(CGRect)a3;
@end

@implementation DBGRect

+ (id)withRect:(CGRect)a3
{
  id v3 = objc_msgSend(objc_alloc((Class)a1), "initWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return v3;
}

- (DBGRect)initWithCGRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)DBGRect;
  result = [(DBGRect *)&v8 init];
  if (result)
  {
    result->_rect.origin.CGFloat x = x;
    result->_rect.origin.CGFloat y = y;
    result->_rect.size.CGFloat width = width;
    result->_rect.size.CGFloat height = height;
  }
  return result;
}

- (id)objectValue
{
  return 0;
}

- (NSString)description
{
  v2 = [(DBGRect *)self objectValue];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(DBGRect *)self description];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (CGRect)rect
{
  objc_copyStruct(v6, &self->_rect, 32, 1, 0);
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

- (void)setRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_rect, &v3, 32, 1, 0);
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  v7 = DBGDecodeValueFromJSONCompatibleValue();
  id v8 = 0;
  v9 = v8;
  if (v8)
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    if (a5) {
      *a5 = v8;
    }
  }
  else
  {
    CFArrayRef v14 = v7;
    CFArrayRef v15 = v14;
    CGSize size = CGRectZero.size;
    CGPoint valuePtr = CGRectZero.origin;
    CGSize v24 = size;
    if (v14)
    {
      ValueAtIndedouble x = (const __CFNumber *)CFArrayGetValueAtIndex(v14, 0);
      CFNumberRef v18 = (const __CFNumber *)CFArrayGetValueAtIndex(v15, 1);
      CFNumberRef v19 = (const __CFNumber *)CFArrayGetValueAtIndex(v15, 2);
      CFNumberRef v20 = (const __CFNumber *)CFArrayGetValueAtIndex(v15, 3);
      CFNumberGetValue(ValueAtIndex, kCFNumberCGFloatType, &valuePtr);
      CFNumberGetValue(v18, kCFNumberCGFloatType, &valuePtr.y);
      CFNumberGetValue(v19, kCFNumberCGFloatType, &v24);
      CFNumberGetValue(v20, kCFNumberCGFloatType, &v24.height);
    }
    double y = valuePtr.y;
    double x = valuePtr.x;
    double height = v24.height;
    double width = v24.width;
  }
  v21 = objc_msgSend(a1, "withRect:", x, y, width, height);

  return v21;
}

- (id)JSONCompatibleRepresentation
{
  [(DBGRect *)self rect];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v6 = (const void **)malloc_type_malloc(0x20uLL, 0x6004044C4A2DFuLL);
  for (uint64_t i = 0; i != 4; ++i)
    v6[i] = CFNumberCreate(0, kCFNumberCGFloatType, &v11[i]);
  CFArrayRef v8 = CFArrayCreate(0, v6, 4, &kCFTypeArrayCallBacks);
  for (uint64_t j = 0; j != 4; ++j)
    CFRelease(v6[j]);
  free(v6);

  return v8;
}

@end