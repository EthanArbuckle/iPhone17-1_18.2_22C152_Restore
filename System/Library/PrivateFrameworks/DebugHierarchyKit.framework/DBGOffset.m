@interface DBGOffset
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withOffset:(CGPoint)a3;
- (CGPoint)offset;
- (DBGOffset)initWithOffset:(CGPoint)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setOffset:(CGPoint)a3;
@end

@implementation DBGOffset

+ (id)withOffset:(CGPoint)a3
{
  id v3 = objc_msgSend(objc_alloc((Class)a1), "initWithOffset:", a3.x, a3.y);

  return v3;
}

- (DBGOffset)initWithOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)DBGOffset;
  result = [(DBGOffset *)&v6 init];
  if (result)
  {
    result->_offset.CGFloat x = x;
    result->_offset.CGFloat y = y;
  }
  return result;
}

- (id)objectValue
{
  return 0;
}

- (NSString)description
{
  v2 = [(DBGOffset *)self objectValue];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(DBGOffset *)self description];
  objc_super v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (CGPoint)offset
{
  objc_copyStruct(v4, &self->_offset, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_offset, &v3, 16, 1, 0);
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
  v16 = objc_msgSend(a1, "withOffset:", x, y);

  return v16;
}

- (id)JSONCompatibleRepresentation
{
  [(DBGOffset *)self offset];
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