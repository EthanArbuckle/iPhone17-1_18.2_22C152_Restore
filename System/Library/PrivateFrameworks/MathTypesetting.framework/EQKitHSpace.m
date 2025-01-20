@interface EQKitHSpace
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (EQKitHSpace)initWithWidth:(double)a3;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation EQKitHSpace

- (EQKitHSpace)initWithWidth:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EQKitHSpace;
  result = [(EQKitHSpace *)&v5 init];
  if (result) {
    result->_width = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(EQKitHSpace *)self width];

  return (id)objc_msgSend(v4, "initWithWidth:");
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EQKitHSpace *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else if ([(EQKitHSpace *)v4 isMemberOfClass:objc_opt_class()])
  {
    [(EQKitHSpace *)self width];
    double v6 = v5;
    [(EQKitHSpace *)v4 width];
    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitHSpace *)self width];
  return (id)[v3 stringWithFormat:@"<%@ %p>: width=%f", v4, self, v5];
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return 0;
}

- (double)width
{
  return self->_width;
}

@end