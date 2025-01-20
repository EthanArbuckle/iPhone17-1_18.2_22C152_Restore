@interface GEOSharedNavState
- (id)_transportTypeStringForAnalytics;
@end

@implementation GEOSharedNavState

- (id)_transportTypeStringForAnalytics
{
  if ([(GEOSharedNavState *)self hasTransportType])
  {
    id v3 = [(GEOSharedNavState *)self transportType];
    if (v3 >= 7)
    {
      v4 = +[NSString stringWithFormat:@"(unknown: %i)", v3];
    }
    else
    {
      v4 = *(&off_100039888 + (int)v3);
    }
  }
  else
  {
    v4 = @"UNKNOWN_TRANSPORT_TYPE";
  }

  return v4;
}

@end