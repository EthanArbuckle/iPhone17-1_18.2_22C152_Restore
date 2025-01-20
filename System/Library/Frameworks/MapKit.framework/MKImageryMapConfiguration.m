@interface MKImageryMapConfiguration
- (MKImageryMapConfiguration)init;
- (MKImageryMapConfiguration)initWithElevationStyle:(MKMapElevationStyle)elevationStyle;
@end

@implementation MKImageryMapConfiguration

- (MKImageryMapConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)MKImageryMapConfiguration;
  return [(MKMapConfiguration *)&v3 initWithElevationStyle:0];
}

- (MKImageryMapConfiguration)initWithElevationStyle:(MKMapElevationStyle)elevationStyle
{
  v4 = [(MKImageryMapConfiguration *)self init];
  v5 = v4;
  if (v4) {
    [(MKMapConfiguration *)v4 setElevationStyle:elevationStyle];
  }
  return v5;
}

@end