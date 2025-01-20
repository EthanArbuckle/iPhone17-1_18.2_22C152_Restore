@interface GCDeviceLight
+ (BOOL)supportsSecureCoding;
- (GCColor)color;
- (GCDeviceLight)initWithCoder:(id)a3;
- (GCDeviceLight)initWithColor:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setColor:(GCColor *)color;
@end

@implementation GCDeviceLight

- (GCDeviceLight)initWithColor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCDeviceLight;
  v6 = [(GCDeviceLight *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_color, a3);
  }

  return v7;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ - color=%@>", objc_opt_class(), self->_color];
}

- (GCColor)color
{
  return self->_color;
}

- (void)setColor:(GCColor *)color
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDeviceLight)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCDeviceLight;
  id v5 = [(GCDeviceLight *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
    color = v5->_color;
    v5->_color = (GCColor *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

@end