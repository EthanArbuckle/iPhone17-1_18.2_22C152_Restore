@interface FMFMapImageRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)cachingEnabled;
- (BOOL)isShifted;
- (CLLocation)location;
- (FMFMapImageRequest)initWithCoder:(id)a3;
- (FMFMapImageRequest)initWithLocation:(id)a3 altitude:(double)a4 pitch:(double)a5 width:(double)a6 height:(double)a7 andCachingEnabled:(BOOL)a8;
- (FMFMapImageRequest)initWithLocation:(id)a3 isShifted:(BOOL)a4 altitude:(double)a5 pitch:(double)a6 width:(double)a7 height:(double)a8 andCachingEnabled:(BOOL)a9;
- (FMFMapImageRequest)initWithLocation:(id)a3 isShifted:(BOOL)a4 radius:(double)a5 width:(double)a6 height:(double)a7 andCachingEnabled:(BOOL)a8;
- (FMFMapImageRequest)initWithLocation:(id)a3 radius:(double)a4 width:(double)a5 height:(double)a6 andCachingEnabled:(BOOL)a7;
- (NSString)key;
- (double)altitude;
- (double)height;
- (double)pitch;
- (double)radius;
- (double)width;
- (int64_t)priority;
- (void)encodeWithCoder:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setCachingEnabled:(BOOL)a3;
- (void)setHeight:(double)a3;
- (void)setIsShifted:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setPitch:(double)a3;
- (void)setPriority:(int64_t)a3;
- (void)setRadius:(double)a3;
- (void)setWidth:(double)a3;
@end

@implementation FMFMapImageRequest

- (FMFMapImageRequest)initWithLocation:(id)a3 altitude:(double)a4 pitch:(double)a5 width:(double)a6 height:(double)a7 andCachingEnabled:(BOOL)a8
{
  return [(FMFMapImageRequest *)self initWithLocation:a3 isShifted:0 altitude:a8 pitch:a4 width:a5 height:a6 andCachingEnabled:a7];
}

- (FMFMapImageRequest)initWithLocation:(id)a3 isShifted:(BOOL)a4 altitude:(double)a5 pitch:(double)a6 width:(double)a7 height:(double)a8 andCachingEnabled:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v14 = a4;
  id v16 = a3;
  v17 = [(FMFMapImageRequest *)self init];
  v18 = v17;
  if (v17)
  {
    [(FMFMapImageRequest *)v17 setLocation:v16];
    [(FMFMapImageRequest *)v18 setIsShifted:v14];
    [(FMFMapImageRequest *)v18 setAltitude:a5];
    [(FMFMapImageRequest *)v18 setPitch:a6];
    [(FMFMapImageRequest *)v18 setWidth:a7];
    [(FMFMapImageRequest *)v18 setHeight:a8];
    [(FMFMapImageRequest *)v18 setCachingEnabled:v9];
    [(FMFMapImageRequest *)v18 setRadius:0.0];
  }

  return v18;
}

- (FMFMapImageRequest)initWithLocation:(id)a3 radius:(double)a4 width:(double)a5 height:(double)a6 andCachingEnabled:(BOOL)a7
{
  return [(FMFMapImageRequest *)self initWithLocation:a3 isShifted:0 radius:a7 width:a4 height:a5 andCachingEnabled:a6];
}

- (FMFMapImageRequest)initWithLocation:(id)a3 isShifted:(BOOL)a4 radius:(double)a5 width:(double)a6 height:(double)a7 andCachingEnabled:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v12 = a4;
  id v14 = a3;
  v15 = [(FMFMapImageRequest *)self init];
  id v16 = v15;
  if (v15)
  {
    [(FMFMapImageRequest *)v15 setLocation:v14];
    [(FMFMapImageRequest *)v16 setIsShifted:v12];
    [(FMFMapImageRequest *)v16 setAltitude:0.0];
    [(FMFMapImageRequest *)v16 setPitch:0.0];
    [(FMFMapImageRequest *)v16 setWidth:a6];
    [(FMFMapImageRequest *)v16 setHeight:a7];
    [(FMFMapImageRequest *)v16 setCachingEnabled:v8];
    [(FMFMapImageRequest *)v16 setRadius:a5];
  }

  return v16;
}

- (FMFMapImageRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMFMapImageRequest *)self init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"latitude"];
    double v7 = v6;
    [v4 decodeDoubleForKey:@"longtitude"];
    id v9 = [objc_alloc((Class)CLLocation) initWithLatitude:v7 longitude:v8];
    [(FMFMapImageRequest *)v5 setLocation:v9];

    -[FMFMapImageRequest setIsShifted:](v5, "setIsShifted:", [v4 decodeBoolForKey:@"isShifted"]);
    [v4 decodeDoubleForKey:@"altitude"];
    -[FMFMapImageRequest setAltitude:](v5, "setAltitude:");
    [v4 decodeDoubleForKey:@"pitch"];
    -[FMFMapImageRequest setPitch:](v5, "setPitch:");
    [v4 decodeDoubleForKey:@"width"];
    -[FMFMapImageRequest setWidth:](v5, "setWidth:");
    [v4 decodeDoubleForKey:@"height"];
    -[FMFMapImageRequest setHeight:](v5, "setHeight:");
    -[FMFMapImageRequest setCachingEnabled:](v5, "setCachingEnabled:", [v4 decodeBoolForKey:@"cachingEnabled"]);
    -[FMFMapImageRequest setPriority:](v5, "setPriority:", [v4 decodeIntegerForKey:@"priority"]);
    [v4 decodeDoubleForKey:@"radius"];
    -[FMFMapImageRequest setRadius:](v5, "setRadius:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(FMFMapImageRequest *)self location];
  [v4 coordinate];
  objc_msgSend(v7, "encodeDouble:forKey:", @"latitude");

  v5 = [(FMFMapImageRequest *)self location];
  [v5 coordinate];
  [v7 encodeDouble:@"longtitude" forKey:v6];

  objc_msgSend(v7, "encodeBool:forKey:", -[FMFMapImageRequest isShifted](self, "isShifted"), @"isShifted");
  [(FMFMapImageRequest *)self altitude];
  objc_msgSend(v7, "encodeDouble:forKey:", @"altitude");
  [(FMFMapImageRequest *)self pitch];
  objc_msgSend(v7, "encodeDouble:forKey:", @"pitch");
  [(FMFMapImageRequest *)self width];
  objc_msgSend(v7, "encodeDouble:forKey:", @"width");
  [(FMFMapImageRequest *)self height];
  objc_msgSend(v7, "encodeDouble:forKey:", @"height");
  objc_msgSend(v7, "encodeBool:forKey:", -[FMFMapImageRequest cachingEnabled](self, "cachingEnabled"), @"cachingEnabled");
  objc_msgSend(v7, "encodeInteger:forKey:", -[FMFMapImageRequest priority](self, "priority"), @"priority");
  [(FMFMapImageRequest *)self radius];
  objc_msgSend(v7, "encodeDouble:forKey:", @"radius");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)key
{
  v3 = [(FMFMapImageRequest *)self location];
  [v3 coordinate];
  double v5 = round(v4 * 1000.0) / 1000.0;

  double v6 = [(FMFMapImageRequest *)self location];
  [v6 coordinate];
  double v8 = round(v7 * 1000.0) / 1000.0;

  [(FMFMapImageRequest *)self radius];
  double v10 = round(v9);
  v11 = +[NSNumber numberWithDouble:v5];
  BOOL v12 = [v11 stringValue];

  v13 = +[NSNumber numberWithDouble:v8];
  id v14 = [v13 stringValue];

  [(FMFMapImageRequest *)self altitude];
  v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v16 = [v15 stringValue];

  [(FMFMapImageRequest *)self pitch];
  v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v18 = [v17 stringValue];

  [(FMFMapImageRequest *)self width];
  v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v20 = [v19 stringValue];

  [(FMFMapImageRequest *)self height];
  v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v22 = [v21 stringValue];

  v23 = +[NSNumber numberWithDouble:v10];
  v24 = [v23 stringValue];

  v25 = [@"mapImage" stringByAppendingFormat:@"%@%@%@%@%@%@%@", v12, v14, v16, v18, v20, v22, v24];

  return (NSString *)v25;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (BOOL)isShifted
{
  return self->_isShifted;
}

- (void)setIsShifted:(BOOL)a3
{
  self->_isShifted = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  self->_pitch = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (BOOL)cachingEnabled
{
  return self->_cachingEnabled;
}

- (void)setCachingEnabled:(BOOL)a3
{
  self->_cachingEnabled = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (void).cxx_destruct
{
}

@end