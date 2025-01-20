@interface LNSymbolConfiguration
+ (BOOL)supportsSecureCoding;
- (LNSymbolConfiguration)initWithCoder:(id)a3;
- (LNSymbolConfiguration)initWithPointSize:(double)a3 scale:(int64_t)a4 weight:(int64_t)a5;
- (double)pointSize;
- (int64_t)scale;
- (int64_t)weight;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNSymbolConfiguration

- (int64_t)weight
{
  return self->_weight;
}

- (int64_t)scale
{
  return self->_scale;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [(LNSymbolConfiguration *)self pointSize];
  *(float *)&double v4 = v4;
  [v5 encodeFloat:@"pointSize" forKey:v4];
  objc_msgSend(v5, "encodeInteger:forKey:", -[LNSymbolConfiguration scale](self, "scale"), @"scale");
  objc_msgSend(v5, "encodeInteger:forKey:", -[LNSymbolConfiguration weight](self, "weight"), @"weight");
}

- (LNSymbolConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeFloatForKey:@"pointSize"];
  double v6 = v5;
  uint64_t v7 = [v4 decodeIntegerForKey:@"scale"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"weight"];

  return [(LNSymbolConfiguration *)self initWithPointSize:v7 scale:v8 weight:v6];
}

- (LNSymbolConfiguration)initWithPointSize:(double)a3 scale:(int64_t)a4 weight:(int64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)LNSymbolConfiguration;
  uint64_t v8 = [(LNSymbolConfiguration *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_pointSize = a3;
    v8->_scale = a4;
    v8->_weight = a5;
    v10 = v8;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end