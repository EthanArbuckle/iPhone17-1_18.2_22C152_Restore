@interface _PHPickerAspectRatio
+ (BOOL)supportsSecureCoding;
+ (_PHPickerAspectRatio)deviceAspectRatio;
+ (id)aspectRatio:(double)a3;
- (_PHPickerAspectRatio)initWithCoder:(id)a3;
- (double)_aspectRatio;
- (id)_initWithAspectRatio:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _PHPickerAspectRatio

- (double)_aspectRatio
{
  return self->__aspectRatio;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_PHPickerAspectRatio)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PHPickerAspectRatio;
  v5 = [(_PHPickerAspectRatio *)&v8 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"PHPickerAspectRatioAspectRatioKey"];
    v5->__aspectRatio = v6;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_PHPickerAspectRatio alloc];
  double aspectRatio = self->__aspectRatio;

  return [(_PHPickerAspectRatio *)v4 _initWithAspectRatio:aspectRatio];
}

- (id)_initWithAspectRatio:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_PHPickerAspectRatio;
  id result = [(_PHPickerAspectRatio *)&v5 init];
  if (result) {
    *((double *)result + 1) = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)aspectRatio:(double)a3
{
  if (a3 <= 0.0)
  {
    objc_super v5 = (void *)_PFAssertFailHandler();
    return +[_PHPickerAspectRatio deviceAspectRatio];
  }
  else
  {
    id v3 = [[_PHPickerAspectRatio alloc] _initWithAspectRatio:a3];
    return v3;
  }
}

+ (_PHPickerAspectRatio)deviceAspectRatio
{
  id v2 = [[_PHPickerAspectRatio alloc] _initWithAspectRatio:0.0];

  return (_PHPickerAspectRatio *)v2;
}

@end