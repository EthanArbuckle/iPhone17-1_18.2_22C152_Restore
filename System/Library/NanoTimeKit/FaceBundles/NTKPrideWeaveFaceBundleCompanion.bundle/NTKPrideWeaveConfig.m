@interface NTKPrideWeaveConfig
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NTKPrideWeaveConfig)initWithCoder:(id)a3;
- (float)idleRotation;
- (float)winding;
- (id)copy;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIdleRotation:(float)a3;
- (void)setWinding:(float)a3;
@end

@implementation NTKPrideWeaveConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  float winding = self->_winding;
  id v5 = a3;
  *(float *)&double v6 = winding;
  v7 = +[NSNumber numberWithFloat:v6];
  [v5 encodeObject:v7 forKey:@"winding"];

  *(float *)&double v8 = self->_idleRotation;
  id v9 = +[NSNumber numberWithFloat:v8];
  [v5 encodeObject:v9 forKey:@"idleRotation"];
}

- (NTKPrideWeaveConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKPrideWeaveConfig;
  id v5 = [(NTKPrideWeaveConfig *)&v11 init];
  if (v5)
  {
    double v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"winding"];
    [v6 floatValue];
    v5->_float winding = v7;

    double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idleRotation"];
    [v8 floatValue];
    v5->_idleRotation = v9;
  }
  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"NTKPrideWeaveConfig:%f,%f", self->_winding, self->_idleRotation];
}

- (id)copy
{
  v3 = objc_alloc_init(NTKPrideWeaveConfig);
  [(NTKPrideWeaveConfig *)self winding];
  -[NTKPrideWeaveConfig setWinding:](v3, "setWinding:");
  [(NTKPrideWeaveConfig *)self idleRotation];
  -[NTKPrideWeaveConfig setIdleRotation:](v3, "setIdleRotation:");
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  return 1;
}

- (float)winding
{
  return self->_winding;
}

- (void)setWinding:(float)a3
{
  self->_float winding = a3;
}

- (float)idleRotation
{
  return self->_idleRotation;
}

- (void)setIdleRotation:(float)a3
{
  self->_idleRotation = a3;
}

@end