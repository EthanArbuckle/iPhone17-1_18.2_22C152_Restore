@interface LKCGColorCodingProxy
+ (BOOL)supportsSecureCoding;
- (LKCGColorCodingProxy)initWithCoder:(id)a3;
- (LKCGColorCodingProxy)initWithObject:(id)a3;
- (id)decodedObject;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LKCGColorCodingProxy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)decodedObject
{
  return self->_color;
}

- (LKCGColorCodingProxy)initWithCoder:(id)a3
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)LKCGColorCodingProxy;
  v4 = [(LKCGColorCodingProxy *)&v15 init];
  if (v4)
  {
    v5 = (CGPattern *)objc_msgSend(a3, "CA_decodeObjectForKey:", @"CGColorPattern");
    if (!v5)
    {
      [a3 decodeFloatForKey:@"r"];
      components[0] = v9;
      [a3 decodeFloatForKey:@"g"];
      components[1] = v10;
      [a3 decodeFloatForKey:@"b"];
      components[2] = v11;
      [a3 decodeFloatForKey:@"a"];
      components[3] = v12;
      v13 = (CGColorSpace *)CAGetColorSpace(0x1Cu);
      CGColorRef v8 = CGColorCreate(v13, components);
      goto LABEL_6;
    }
    v6 = v5;
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == CGPatternGetTypeID())
    {
      CGColorRef v8 = CA_CGPatternColorCreate(v6);
LABEL_6:
      v4->_color = v8;
    }
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)LKCGColorCodingProxy;
  [(LKCGColorCodingProxy *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  CGPatternRef Pattern = CGColorGetPattern(self->_color);
  if (Pattern)
  {
    objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", Pattern, @"CGColorPattern", 0);
  }
  else
  {
    Components = CGColorGetComponents(self->_color);
    double v7 = *Components;
    *(float *)&double v7 = *Components;
    [a3 encodeFloat:@"r" forKey:v7];
    double v8 = Components[1];
    *(float *)&double v8 = v8;
    [a3 encodeFloat:@"g" forKey:v8];
    double v9 = Components[2];
    *(float *)&double v9 = v9;
    [a3 encodeFloat:@"b" forKey:v9];
    double v10 = Components[3];
    *(float *)&double v10 = v10;
    [a3 encodeFloat:@"a" forKey:v10];
  }
}

- (LKCGColorCodingProxy)initWithObject:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)LKCGColorCodingProxy;
  uint64_t v4 = [(LKCGColorCodingProxy *)&v8 init];
  if (v4)
  {
    if (!CGColorGetPattern((CGColorRef)a3))
    {
      double v7 = (CGColorSpace *)CAGetColorSpace(0x1Cu);
      CARetainColorTransform(v7);
      v4->_color = (CGColor *)CGColorTransformConvertColor();
      CGColorTransformRelease();
      if (v4->_color) {
        return v4;
      }
      goto LABEL_4;
    }
    CGColorRef v5 = CGColorRetain((CGColorRef)a3);
    v4->_color = v5;
    if (!v5)
    {
LABEL_4:

      return 0;
    }
  }
  return v4;
}

@end