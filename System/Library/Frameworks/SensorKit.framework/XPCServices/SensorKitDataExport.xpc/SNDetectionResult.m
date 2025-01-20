@interface SNDetectionResult
- (id)sr_dictionaryRepresentation;
@end

@implementation SNDetectionResult

- (id)sr_dictionaryRepresentation
{
  [(SNDetectionResult *)self confidence];
  v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(SNDetectionResult *)self confidence];
  double v5 = v4;
  [(SNDetectionResult *)self confidence];
  if (self) {
    [(SNDetectionResult *)self timeRange];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  CFStringRef v6 = @"inf";
  if (fabs(v5) != INFINITY) {
    CFStringRef v6 = (const __CFString *)v3;
  }
  CFStringRef v7 = v6;
  CFStringRef v8 = CMTimeRangeCopyDescription(kCFAllocatorDefault, &v11);
  v12[0] = @"identifier";
  v13[0] = [(SNDetectionResult *)self identifier];
  v12[1] = @"detected";
  v13[1] = +[NSNumber numberWithBool:[(SNDetectionResult *)self detected]];
  v13[2] = v7;
  v12[2] = @"confidence";
  v12[3] = @"timeRange";
  v13[3] = v8;
  v12[4] = @"detectorIdentifier";
  v13[4] = [(SNDetectionResult *)self detectorIdentifier];
  v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];
  CFRelease(v8);
  return v9;
}

@end