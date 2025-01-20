@interface _GEODirectionsServiceRequestBuilder_DrivingToWalkingTransition
- (int)directionsRequestFeedbackPurpose;
@end

@implementation _GEODirectionsServiceRequestBuilder_DrivingToWalkingTransition

- (int)directionsRequestFeedbackPurpose
{
  v2 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  if ([v2 hasArrived]) {
    int v3 = 13;
  }
  else {
    int v3 = 14;
  }

  return v3;
}

@end