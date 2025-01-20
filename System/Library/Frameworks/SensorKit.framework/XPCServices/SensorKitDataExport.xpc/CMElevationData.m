@interface CMElevationData
- (id)sr_dictionaryRepresentation;
@end

@implementation CMElevationData

- (id)sr_dictionaryRepresentation
{
  v6[0] = @"startTime";
  objc_msgSend(-[CMElevationData startDate](self, "startDate"), "timeIntervalSinceReferenceDate");
  v7[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v6[1] = @"endTime";
  objc_msgSend(-[CMElevationData endDate](self, "endDate"), "timeIntervalSinceReferenceDate");
  v7[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v6[2] = @"elevationAscended";
  v7[2] = +[NSNumber numberWithUnsignedInteger:[(CMElevationData *)self elevationAscended]];
  v6[3] = @"elevationDescended";
  v7[3] = +[NSNumber numberWithUnsignedInteger:[(CMElevationData *)self elevationDescended]];
  v6[4] = @"source";
  v7[4] = +[NSNumber numberWithInteger:[(CMElevationData *)self source]];
  v6[5] = @"sourceId";
  CFStringRef v3 = (const __CFString *)objc_msgSend(-[CMElevationData sourceId](self, "sourceId"), "UUIDString");
  CFStringRef v4 = &stru_1000106F8;
  if (v3) {
    CFStringRef v4 = v3;
  }
  v7[5] = v4;
  return +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:6];
}

@end