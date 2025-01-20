@interface AFLocationFetchRequest
+ (BOOL)supportsSecureCoding;
- (AFLocationFetchRequest)initWithCoder:(id)a3;
- (double)desiredAccuracy;
- (double)timeout;
- (unint64_t)style;
- (void)encodeWithCoder:(id)a3;
- (void)setDesiredAccuracy:(double)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTimeout:(double)a3;
@end

@implementation AFLocationFetchRequest

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setDesiredAccuracy:(double)a3
{
  self->_desiredAccuracy = a3;
}

- (double)desiredAccuracy
{
  return self->_desiredAccuracy;
}

- (AFLocationFetchRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFLocationFetchRequest;
  v5 = [(AFLocationFetchRequest *)&v9 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"desiredAccuracy"];
    v5->_desiredAccuracy = v6;
    v5->_style = [v4 decodeIntegerForKey:@"style"];
    [v4 decodeDoubleForKey:@"timeout"];
    v5->_timeout = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double desiredAccuracy = self->_desiredAccuracy;
  id v5 = a3;
  [v5 encodeDouble:@"desiredAccuracy" forKey:desiredAccuracy];
  [v5 encodeInteger:self->_style forKey:@"style"];
  [v5 encodeDouble:@"timeout" forKey:self->_timeout];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end