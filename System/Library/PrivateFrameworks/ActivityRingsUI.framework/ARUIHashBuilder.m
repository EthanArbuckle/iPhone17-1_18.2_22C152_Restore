@interface ARUIHashBuilder
+ (id)builder;
- (ARUIHashBuilder)init;
- (uint64_t)appendFloat4x4:(double)a3;
- (unint64_t)hash;
- (unint64_t)hashForCGFloat:(double)a3;
- (unint64_t)hashForDouble:(double)a3;
- (unint64_t)hashForFloat:(float)a3;
- (unint64_t)hashForNSTimeInterval:(double)a3;
- (void)appendBool:(BOOL)a3;
- (void)appendCGFloat:(double)a3;
- (void)appendCGRect:(CGRect)a3;
- (void)appendDouble:(double)a3;
- (void)appendFloat2:(ARUIHashBuilder *)self;
- (void)appendFloat4:(ARUIHashBuilder *)self;
- (void)appendFloat:(float)a3;
- (void)appendInt:(int64_t)a3;
- (void)appendObject:(id)a3;
- (void)appendTimeInterval:(double)a3;
- (void)appendUnsignedInt:(unint64_t)a3;
@end

@implementation ARUIHashBuilder

- (void)appendFloat:(float)a3
{
  unint64_t hash = self->_hash;
  self->_unint64_t hash = -[ARUIHashBuilder hashForFloat:](self, "hashForFloat:") - hash + 32 * hash;
}

- (unint64_t)hashForFloat:(float)a3
{
  return LODWORD(a3);
}

- (void)appendObject:(id)a3
{
  unint64_t hash = self->_hash;
  self->_unint64_t hash = [a3 hash] - hash + 32 * hash;
}

- (unint64_t)hash
{
  return self->_hash;
}

+ (id)builder
{
  v2 = objc_alloc_init(ARUIHashBuilder);

  return v2;
}

- (ARUIHashBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)ARUIHashBuilder;
  result = [(ARUIHashBuilder *)&v3 init];
  if (result) {
    result->_unint64_t hash = 0;
  }
  return result;
}

- (void)appendBool:(BOOL)a3
{
  self->_unint64_t hash = 31 * self->_hash + a3;
}

- (void)appendFloat2:(ARUIHashBuilder *)self
{
  int v5 = HIDWORD(v2);
  -[ARUIHashBuilder appendFloat:](self, "appendFloat:");
  HIDWORD(v4) = v5;
  LODWORD(v4) = v5;

  [(ARUIHashBuilder *)self appendFloat:v4];
}

- (void)appendUnsignedInt:(unint64_t)a3
{
  self->_unint64_t hash = a3 - self->_hash + 32 * self->_hash;
}

- (void)appendInt:(int64_t)a3
{
  self->_unint64_t hash = a3 - self->_hash + 32 * self->_hash;
}

- (unint64_t)hashForCGFloat:(double)a3
{
  return *(void *)&a3;
}

- (unint64_t)hashForDouble:(double)a3
{
  return *(void *)&a3;
}

- (unint64_t)hashForNSTimeInterval:(double)a3
{
  return *(void *)&a3;
}

- (void)appendCGFloat:(double)a3
{
  unint64_t hash = self->_hash;
  self->_unint64_t hash = [(ARUIHashBuilder *)self hashForCGFloat:a3] - hash + 32 * hash;
}

- (void)appendTimeInterval:(double)a3
{
  unint64_t hash = self->_hash;
  self->_unint64_t hash = [(ARUIHashBuilder *)self hashForNSTimeInterval:a3] - hash + 32 * hash;
}

- (void)appendCGRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  [(ARUIHashBuilder *)self appendCGFloat:a3.origin.x];
  [(ARUIHashBuilder *)self appendCGFloat:y];
  [(ARUIHashBuilder *)self appendCGFloat:width];

  [(ARUIHashBuilder *)self appendCGFloat:height];
}

- (void)appendDouble:(double)a3
{
  unint64_t hash = self->_hash;
  self->_unint64_t hash = [(ARUIHashBuilder *)self hashForDouble:a3] - hash + 32 * hash;
}

- (void)appendFloat4:(ARUIHashBuilder *)self
{
  long long v5 = v2;
  -[ARUIHashBuilder appendFloat:](self, "appendFloat:");
  HIDWORD(v4) = DWORD1(v5);
  LODWORD(v4) = DWORD1(v5);
  [(ARUIHashBuilder *)self appendFloat:v4];
  [(ARUIHashBuilder *)self appendFloat:COERCE_DOUBLE(__PAIR64__(DWORD1(v5), DWORD2(v5)))];

  [(ARUIHashBuilder *)self appendFloat:COERCE_DOUBLE(__PAIR64__(DWORD1(v5), HIDWORD(v5)))];
}

- (uint64_t)appendFloat4x4:(double)a3
{
  objc_msgSend(a1, "appendFloat4:");
  [a1 appendFloat4:a3];
  [a1 appendFloat4:a4];

  return [a1 appendFloat4:a5];
}

@end