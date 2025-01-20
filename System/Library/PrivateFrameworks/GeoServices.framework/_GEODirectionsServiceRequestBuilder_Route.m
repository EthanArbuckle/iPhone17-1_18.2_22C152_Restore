@interface _GEODirectionsServiceRequestBuilder_Route
- (BOOL)shouldAllowTimepoint;
- (int)directionsRequestFeedbackPurpose;
@end

@implementation _GEODirectionsServiceRequestBuilder_Route

- (int)directionsRequestFeedbackPurpose
{
  return 4;
}

- (BOOL)shouldAllowTimepoint
{
  return 1;
}

@end