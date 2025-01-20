@interface SRPhotoplethysmogramAccelerometerSample
- (id)sr_dictionaryRepresentation;
@end

@implementation SRPhotoplethysmogramAccelerometerSample

- (id)sr_dictionaryRepresentation
{
  v16[0] = @"nanosecondsSinceStart";
  v17[0] = +[NSNumber numberWithLongLong:[(SRPhotoplethysmogramAccelerometerSample *)self nanosecondsSinceStart]];
  v16[1] = @"frequency";
  id v3 = [(SRPhotoplethysmogramAccelerometerSample *)self samplingFrequency];
  if (v3)
  {
    [v3 doubleValue];
    if (fabs(v4) == INFINITY) {
      CFStringRef v5 = @"INF";
    }
    else {
      CFStringRef v5 = +[NSString stringWithFormat:@"%f", *(void *)&v4];
    }
  }
  else
  {
    CFStringRef v5 = @"(null)";
  }
  v17[1] = v5;
  v16[2] = @"x";
  id v6 = [(SRPhotoplethysmogramAccelerometerSample *)self x];
  if (v6)
  {
    [v6 doubleValue];
    if (fabs(v7) == INFINITY) {
      CFStringRef v8 = @"INF";
    }
    else {
      CFStringRef v8 = +[NSString stringWithFormat:@"%f", *(void *)&v7];
    }
  }
  else
  {
    CFStringRef v8 = @"(null)";
  }
  v17[2] = v8;
  v16[3] = @"y";
  id v9 = [(SRPhotoplethysmogramAccelerometerSample *)self y];
  if (v9)
  {
    [v9 doubleValue];
    if (fabs(v10) == INFINITY) {
      CFStringRef v11 = @"INF";
    }
    else {
      CFStringRef v11 = +[NSString stringWithFormat:@"%f", *(void *)&v10];
    }
  }
  else
  {
    CFStringRef v11 = @"(null)";
  }
  v17[3] = v11;
  v16[4] = @"z";
  id v12 = [(SRPhotoplethysmogramAccelerometerSample *)self z];
  if (v12)
  {
    [v12 doubleValue];
    if (fabs(v13) == INFINITY) {
      CFStringRef v14 = @"INF";
    }
    else {
      CFStringRef v14 = +[NSString stringWithFormat:@"%f", *(void *)&v13];
    }
  }
  else
  {
    CFStringRef v14 = @"(null)";
  }
  v17[4] = v14;
  return +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];
}

@end