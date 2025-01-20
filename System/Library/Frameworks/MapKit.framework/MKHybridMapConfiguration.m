@interface MKHybridMapConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHybridMapConfiguration:(id)a3;
- (MKHybridMapConfiguration)init;
- (MKHybridMapConfiguration)initWithElevationStyle:(MKMapElevationStyle)elevationStyle;
@end

@implementation MKHybridMapConfiguration

- (MKHybridMapConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)MKHybridMapConfiguration;
  return [(MKMapConfiguration *)&v3 initWithElevationStyle:0];
}

- (MKHybridMapConfiguration)initWithElevationStyle:(MKMapElevationStyle)elevationStyle
{
  v4 = [(MKHybridMapConfiguration *)self init];
  v5 = v4;
  if (v4) {
    [(MKMapConfiguration *)v4 setElevationStyle:elevationStyle];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(MKHybridMapConfiguration *)self isEqualToHybridMapConfiguration:v4];

  return v5;
}

- (BOOL)isEqualToHybridMapConfiguration:(id)a3
{
  id v4 = a3;
  if (v4
    && (v13.receiver = self,
        v13.super_class = (Class)MKHybridMapConfiguration,
        [(MKMapConfiguration *)&v13 isEqual:v4]))
  {
    BOOL v5 = [(MKHybridMapConfiguration *)self pointOfInterestFilter];
    v6 = [v4 pointOfInterestFilter];
    unint64_t v7 = v5;
    unint64_t v8 = v6;
    if (v7 | v8 && (int v9 = [(id)v7 isEqual:v8], (id)v8, (id)v7, !v9))
    {
      LOBYTE(v11) = 0;
    }
    else
    {
      BOOL v10 = [(MKHybridMapConfiguration *)self showsTraffic];
      int v11 = v10 ^ [v4 showsTraffic] ^ 1;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

@end