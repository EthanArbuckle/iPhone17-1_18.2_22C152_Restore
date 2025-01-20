@interface CLPair
+ (BOOL)supportsSecureCoding;
- (CLPair)initWithCoder:(id)a3;
- (CLPair)initWithFirst:(int)a3 second:(int)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int)first;
- (int)second;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLPair

- (CLPair)initWithFirst:(int)a3 second:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CLPair;
  result = [(CLPair *)&v7 init];
  if (result)
  {
    result->_first = a3;
    result->_second = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CLPair alloc];
  uint64_t first = self->_first;
  uint64_t second = self->_second;

  return [(CLPair *)v4 initWithFirst:first second:second];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt:forKey:", -[CLPair first](self, "first"), @"first");
  uint64_t v5 = [(CLPair *)self second];

  [a3 encodeInt:v5 forKey:@"second"];
}

- (CLPair)initWithCoder:(id)a3
{
  v4 = [CLPair alloc];
  uint64_t v5 = [a3 decodeIntForKey:@"first"];
  uint64_t v6 = [a3 decodeIntForKey:@"second"];

  return [(CLPair *)v4 initWithFirst:v5 second:v6];
}

- (int)first
{
  return self->_first;
}

- (int)second
{
  return self->_second;
}

@end