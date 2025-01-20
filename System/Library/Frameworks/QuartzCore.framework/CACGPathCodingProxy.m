@interface CACGPathCodingProxy
+ (BOOL)supportsSecureCoding;
- (CACGPathCodingProxy)initWithCoder:(id)a3;
- (CACGPathCodingProxy)initWithObject:(id)a3;
- (id)decodedObject;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CACGPathCodingProxy

- (id)decodedObject
{
  return self->_path;
}

- (CACGPathCodingProxy)initWithCoder:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)CACGPathCodingProxy;
  v4 = [(CACGPathCodingProxy *)&v12 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E4F28B90], "CA_supportedClasses"), @"LKCGPathSegments");
    if (v5)
    {
      v6 = (void *)v5;
      CGMutablePathRef Mutable = CGPathCreateMutable();
      uint64_t v8 = [v6 count];
      if (v8)
      {
        uint64_t v9 = v8;
        for (uint64_t i = 0; i != v9; ++i)
          objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", i), "addToCGPath:", Mutable);
      }
    }
    else
    {
      CGMutablePathRef Mutable = 0;
    }
    v4->_path = Mutable;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGPathRelease(self->_path);
  v3.receiver = self;
  v3.super_class = (Class)CACGPathCodingProxy;
  [(CACGPathCodingProxy *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  CGPathApply(self->_path, v5, (CGPathApplierFunction)encodePathSegment);
  [a3 encodeObject:v5 forKey:@"LKCGPathSegments"];
}

- (CACGPathCodingProxy)initWithObject:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CACGPathCodingProxy;
  uint64_t v4 = [(CACGPathCodingProxy *)&v6 init];
  if (v4) {
    v4->_path = (CGPath *)MEMORY[0x1853223C0](a3);
  }
  return v4;
}

@end