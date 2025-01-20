@interface ARSessionMetricsFrameProperties
- (ARCamera)camera;
- (ARGeoTrackingStatus)geoTrackingStatus;
- (ARSessionMetricsFrameProperties)initWithFrame:(id)a3;
- (ARVLStateData)vlState;
- (ARWorldTrackingState)worldTrackingState;
- (CLLocation)location;
- (NSArray)anchors;
@end

@implementation ARSessionMetricsFrameProperties

- (ARSessionMetricsFrameProperties)initWithFrame:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ARSessionMetricsFrameProperties;
  v5 = [(ARSessionMetricsFrameProperties *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 camera];
    camera = v5->_camera;
    v5->_camera = (ARCamera *)v6;

    uint64_t v8 = [v4 worldTrackingState];
    worldTrackingState = v5->_worldTrackingState;
    v5->_worldTrackingState = (ARWorldTrackingState *)v8;

    uint64_t v10 = [v4 anchors];
    anchors = v5->_anchors;
    v5->_anchors = (NSArray *)v10;

    uint64_t v12 = [v4 geoTrackingStatus];
    geoTrackingStatus = v5->_geoTrackingStatus;
    v5->_geoTrackingStatus = (ARGeoTrackingStatus *)v12;

    uint64_t v14 = [v4 location];
    location = v5->_location;
    v5->_location = (CLLocation *)v14;

    uint64_t v16 = [v4 vlState];
    vlState = v5->_vlState;
    v5->_vlState = (ARVLStateData *)v16;
  }
  return v5;
}

- (ARCamera)camera
{
  return self->_camera;
}

- (ARWorldTrackingState)worldTrackingState
{
  return self->_worldTrackingState;
}

- (NSArray)anchors
{
  return self->_anchors;
}

- (ARGeoTrackingStatus)geoTrackingStatus
{
  return self->_geoTrackingStatus;
}

- (CLLocation)location
{
  return self->_location;
}

- (ARVLStateData)vlState
{
  return self->_vlState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vlState, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_geoTrackingStatus, 0);
  objc_storeStrong((id *)&self->_anchors, 0);
  objc_storeStrong((id *)&self->_worldTrackingState, 0);
  objc_storeStrong((id *)&self->_camera, 0);
}

@end