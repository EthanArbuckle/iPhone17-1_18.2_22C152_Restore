@interface AUAudioUnitViewConfiguration
+ (BOOL)supportsSecureCoding;
- (AUAudioUnitViewConfiguration)initWithCoder:(id)a3;
- (AUAudioUnitViewConfiguration)initWithWidth:(CGFloat)width height:(CGFloat)height hostHasController:(BOOL)hostHasController;
- (BOOL)hostHasController;
- (BOOL)isEqual:(id)a3;
- (CGFloat)height;
- (CGFloat)width;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AUAudioUnitViewConfiguration

- (AUAudioUnitViewConfiguration)initWithWidth:(CGFloat)width height:(CGFloat)height hostHasController:(BOOL)hostHasController
{
  v9.receiver = self;
  v9.super_class = (Class)AUAudioUnitViewConfiguration;
  result = [(AUAudioUnitViewConfiguration *)&v9 init];
  if (result)
  {
    result->_width = width;
    result->_height = height;
    result->_hostHasController = hostHasController;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AUAudioUnitViewConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(AUAudioUnitViewConfiguration *)self width];
      double v7 = v6;
      [(AUAudioUnitViewConfiguration *)v5 width];
      if (v7 == v8
        && ([(AUAudioUnitViewConfiguration *)self height],
            double v10 = v9,
            [(AUAudioUnitViewConfiguration *)v5 height],
            v10 == v11))
      {
        BOOL v12 = [(AUAudioUnitViewConfiguration *)self hostHasController];
        BOOL v13 = v12 ^ [(AUAudioUnitViewConfiguration *)v5 hostHasController] ^ 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  return (self->_height + self->_hostHasController) ^ self->_width;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double width = self->_width;
  id v5 = a3;
  [v5 encodeDouble:@"width" forKey:width];
  [v5 encodeDouble:@"height" forKey:self->_height];
  [v5 encodeBool:self->_hostHasController forKey:@"hostHasController"];
}

- (AUAudioUnitViewConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AUAudioUnitViewConfiguration;
  id v5 = [(AUAudioUnitViewConfiguration *)&v9 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"width"];
    v5->_double width = v6;
    [v4 decodeDoubleForKey:@"height"];
    v5->_height = v7;
    v5->_hostHasController = [v4 decodeBoolForKey:@"hostHasController"];
  }

  return v5;
}

- (CGFloat)width
{
  return self->_width;
}

- (CGFloat)height
{
  return self->_height;
}

- (BOOL)hostHasController
{
  return self->_hostHasController;
}

@end