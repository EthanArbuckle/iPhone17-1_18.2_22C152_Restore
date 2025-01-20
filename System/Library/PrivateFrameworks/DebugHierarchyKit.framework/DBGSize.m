@interface DBGSize
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withSize:(CGSize)a3;
- (CGSize)size;
- (DBGSize)initWithCGSize:(CGSize)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setSize:(CGSize)a3;
@end

@implementation DBGSize

+ (id)withSize:(CGSize)a3
{
  id v3 = objc_msgSend(objc_alloc((Class)a1), "initWithCGSize:", a3.width, a3.height);

  return v3;
}

- (DBGSize)initWithCGSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)DBGSize;
  result = [(DBGSize *)&v6 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
  }
  return result;
}

- (id)objectValue
{
  return 0;
}

- (NSString)description
{
  v2 = [(DBGSize *)self objectValue];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(DBGSize *)self description];
  objc_super v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (CGSize)size
{
  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_size, &v3, 16, 1, 0);
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  v7 = DBGDecodeValueFromJSONCompatibleValue();
  id v8 = 0;
  v9 = v8;
  if (v8)
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
    if (a5) {
      *a5 = v8;
    }
  }
  else
  {
    CFArrayRef v12 = v7;
    CFArrayRef v13 = v12;
    CGSize valuePtr = CGSizeZero;
    if (v12)
    {
      CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v12, 0);
      CFNumberRef v15 = (const __CFNumber *)CFArrayGetValueAtIndex(v13, 1);
      CFNumberGetValue(ValueAtIndex, kCFNumberCGFloatType, &valuePtr);
      CFNumberGetValue(v15, kCFNumberCGFloatType, &valuePtr.height);
    }
    double height = valuePtr.height;
    double width = valuePtr.width;
  }
  v16 = objc_msgSend(a1, "withSize:", width, height);

  return v16;
}

- (id)JSONCompatibleRepresentation
{
  [(DBGSize *)self size];
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