@interface SKReachConstraints
+ (BOOL)supportsSecureCoding;
- (CGFloat)lowerAngleLimit;
- (CGFloat)upperAngleLimit;
- (SKReachConstraints)init;
- (SKReachConstraints)initWithCoder:(id)a3;
- (SKReachConstraints)initWithLowerAngleLimit:(CGFloat)lowerAngleLimit upperAngleLimit:(CGFloat)upperAngleLimit;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLowerAngleLimit:(CGFloat)lowerAngleLimit;
- (void)setUpperAngleLimit:(CGFloat)upperAngleLimit;
@end

@implementation SKReachConstraints

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKReachConstraints)initWithLowerAngleLimit:(CGFloat)lowerAngleLimit upperAngleLimit:(CGFloat)upperAngleLimit
{
  v7.receiver = self;
  v7.super_class = (Class)SKReachConstraints;
  result = [(SKReachConstraints *)&v7 init];
  if (result)
  {
    result->_lowerAngleLimit = lowerAngleLimit;
    result->_upperAngleLimit = upperAngleLimit;
  }
  return result;
}

- (SKReachConstraints)init
{
  return [(SKReachConstraints *)self initWithLowerAngleLimit:0.0 upperAngleLimit:6.28318531];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double lowerAngleLimit = self->_lowerAngleLimit;
  double upperAngleLimit = self->_upperAngleLimit;

  return (id)[v4 initWithLowerAngleLimit:lowerAngleLimit upperAngleLimit:upperAngleLimit];
}

- (void)encodeWithCoder:(id)a3
{
  double lowerAngleLimit = self->_lowerAngleLimit;
  id v5 = a3;
  [v5 encodeDouble:@"_lowerAngleLimit" forKey:lowerAngleLimit];
  [v5 encodeDouble:@"_upperAngleLimit" forKey:self->_upperAngleLimit];
}

- (SKReachConstraints)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"_lowerAngleLimit"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"_upperAngleLimit"];
  double v8 = v7;

  return [(SKReachConstraints *)self initWithLowerAngleLimit:v6 upperAngleLimit:v8];
}

- (CGFloat)lowerAngleLimit
{
  return self->_lowerAngleLimit;
}

- (void)setLowerAngleLimit:(CGFloat)lowerAngleLimit
{
  self->_double lowerAngleLimit = lowerAngleLimit;
}

- (CGFloat)upperAngleLimit
{
  return self->_upperAngleLimit;
}

- (void)setUpperAngleLimit:(CGFloat)upperAngleLimit
{
  self->_double upperAngleLimit = upperAngleLimit;
}

@end