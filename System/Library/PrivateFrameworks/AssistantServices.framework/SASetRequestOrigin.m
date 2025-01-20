@interface SASetRequestOrigin
- (id)ad_deferredMetricsContext;
- (void)setPropertiesWithCLLocation:(id)a3;
@end

@implementation SASetRequestOrigin

- (void)setPropertiesWithCLLocation:(id)a3
{
  id v4 = a3;
  [v4 horizontalAccuracy];
  -[SASetRequestOrigin setHorizontalAccuracy:](self, "setHorizontalAccuracy:");
  [v4 verticalAccuracy];
  -[SASetRequestOrigin setVerticalAccuracy:](self, "setVerticalAccuracy:");
  [v4 coordinate];
  -[SASetRequestOrigin setLatitude:](self, "setLatitude:");
  [v4 coordinate];
  [(SASetRequestOrigin *)self setLongitude:v5];
  [v4 altitude];
  -[SASetRequestOrigin setAltitude:](self, "setAltitude:");
  [v4 course];
  -[SASetRequestOrigin setDirection:](self, "setDirection:");
  [v4 speed];
  -[SASetRequestOrigin setSpeed:](self, "setSpeed:");
  objc_msgSend(v4, "_af_age");
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(SASetRequestOrigin *)self setAge:v6];
}

- (id)ad_deferredMetricsContext
{
  v7.receiver = self;
  v7.super_class = (Class)SASetRequestOrigin;
  v3 = [(SASetRequestOrigin *)&v7 ad_deferredMetricsContext];
  [(SASetRequestOrigin *)self latitude];
  id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v4 forKey:SASetRequestOriginLatitudePListKey];

  [(SASetRequestOrigin *)self longitude];
  double v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v5 forKey:SASetRequestOriginLongitudePListKey];

  return v3;
}

@end