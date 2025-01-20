@interface ARCoachingFrame
- (ARCamera)camera;
- (ARCoachingFrame)initWithFrame:(id)a3;
- (ARGeoTrackingStatus)geoTrackingStatus;
- (NSArray)anchors;
- (double)timestamp;
- (int64_t)interfaceOrientation;
- (void)setAnchors:(id)a3;
- (void)setCamera:(id)a3;
- (void)setGeoTrackingStatus:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARCoachingFrame

- (ARCoachingFrame)initWithFrame:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ARCoachingFrame;
  v5 = [(ARCoachingFrame *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 camera];
    camera = v5->_camera;
    v5->_camera = (ARCamera *)v6;

    [v4 timestamp];
    v5->_timestamp = v8;
    uint64_t v9 = [v4 geoTrackingStatus];
    geoTrackingStatus = v5->_geoTrackingStatus;
    v5->_geoTrackingStatus = (ARGeoTrackingStatus *)v9;

    uint64_t v11 = [v4 anchors];
    anchors = v5->_anchors;
    v5->_anchors = (NSArray *)v11;

    if ([v4 deviceOrientation])
    {
      if ([v4 deviceOrientation] == 3)
      {
        uint64_t v13 = 4;
      }
      else if ([v4 deviceOrientation] == 4)
      {
        uint64_t v13 = 3;
      }
      else if ([v4 deviceOrientation] == 2)
      {
        uint64_t v13 = 2;
      }
      else
      {
        uint64_t v13 = 1;
      }
      v5->_interfaceOrientation = v13;
    }
    else
    {
      v5->_interfaceOrientation = 0;
    }
  }

  return v5;
}

- (ARCamera)camera
{
  return self->_camera;
}

- (void)setCamera:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (ARGeoTrackingStatus)geoTrackingStatus
{
  return self->_geoTrackingStatus;
}

- (void)setGeoTrackingStatus:(id)a3
{
}

- (NSArray)anchors
{
  return self->_anchors;
}

- (void)setAnchors:(id)a3
{
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchors, 0);
  objc_storeStrong((id *)&self->_geoTrackingStatus, 0);

  objc_storeStrong((id *)&self->_camera, 0);
}

@end