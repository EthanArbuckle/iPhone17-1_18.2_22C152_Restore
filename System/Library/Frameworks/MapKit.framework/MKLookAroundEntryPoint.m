@interface MKLookAroundEntryPoint
+ (id)entryPointWithMapItem:(id)a3;
+ (id)entryPointWithMapItem:(id)a3 isMarkedLocation:(BOOL)a4 wantsCloseUpView:(BOOL)a5 cameraFrameOverride:(id)a6 triggerAction:(int)a7;
+ (id)entryPointWithMapItem:(id)a3 triggerAction:(int)a4;
+ (id)entryPointWithMapItem:(id)a3 wantsCloseUpView:(BOOL)a4;
+ (id)entryPointWithMapItem:(id)a3 wantsCloseUpView:(BOOL)a4 cameraFrameOverride:(id)a5;
+ (id)entryPointWithMapItem:(id)a3 wantsCloseUpView:(BOOL)a4 triggerAction:(int)a5;
+ (id)entryPointWithMuninMarker:(id)a3 heading:(double)a4;
+ (id)entryPointWithMuninViewState:(id)a3;
+ (id)entryPointWithMuninViewState:(id)a3 triggerAction:(int)a4;
+ (id)entryPointWithScene:(id)a3 wantsCloseUpView:(BOOL)a4;
- (BOOL)isMarkedLocation;
- (BOOL)wantsCloseUpView;
- (GEOCameraFrame)cameraFrameOverride;
- (GEOMuninViewState)muninViewState;
- (MKLookAroundEntryPoint)init;
- (MKMapItem)mapItem;
- (VKMuninMarker)muninMarker;
- (double)heading;
- (int)triggerAction;
- (unint64_t)type;
- (void)setCameraFrameOverride:(id)a3;
- (void)setHeading:(double)a3;
- (void)setIsMarkedLocation:(BOOL)a3;
- (void)setMapItem:(id)a3;
- (void)setMuninMarker:(id)a3;
- (void)setMuninViewState:(id)a3;
- (void)setTriggerAction:(int)a3;
- (void)setType:(unint64_t)a3;
- (void)setWantsCloseUpView:(BOOL)a3;
@end

@implementation MKLookAroundEntryPoint

- (MKLookAroundEntryPoint)init
{
  v5.receiver = self;
  v5.super_class = (Class)MKLookAroundEntryPoint;
  v2 = [(MKLookAroundEntryPoint *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MKLookAroundEntryPoint *)v2 setTriggerAction:0];
  }
  return v3;
}

+ (id)entryPointWithMapItem:(id)a3
{
  return (id)[a1 entryPointWithMapItem:a3 wantsCloseUpView:0];
}

+ (id)entryPointWithMapItem:(id)a3 wantsCloseUpView:(BOOL)a4
{
  return (id)[a1 entryPointWithMapItem:a3 wantsCloseUpView:a4 cameraFrameOverride:0];
}

+ (id)entryPointWithMapItem:(id)a3 wantsCloseUpView:(BOOL)a4 cameraFrameOverride:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init((Class)objc_opt_class());
  v10 = v9;
  if (v9)
  {
    [v9 setType:0];
    [v10 setMapItem:v7];
    [v10 setWantsCloseUpView:v6];
    [v10 setCameraFrameOverride:v8];
  }

  return v10;
}

+ (id)entryPointWithMuninMarker:(id)a3 heading:(double)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)objc_opt_class());
  id v7 = v6;
  if (v6)
  {
    [v6 setType:1];
    [v7 setMuninMarker:v5];
    [v7 setHeading:a4];
  }

  return v7;
}

+ (id)entryPointWithMuninViewState:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = v4;
  if (v4)
  {
    [v4 setType:2];
    [v5 setMuninViewState:v3];
  }

  return v5;
}

+ (id)entryPointWithScene:(id)a3 wantsCloseUpView:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 _mapItem];
  id v7 = [a1 entryPointWithMapItem:v6 wantsCloseUpView:v4];

  return v7;
}

+ (id)entryPointWithMapItem:(id)a3 triggerAction:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = [a1 entryPointWithMapItem:a3];
  [v5 setTriggerAction:v4];

  return v5;
}

+ (id)entryPointWithMuninViewState:(id)a3 triggerAction:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = [a1 entryPointWithMuninViewState:a3];
  [v5 setTriggerAction:v4];

  return v5;
}

+ (id)entryPointWithMapItem:(id)a3 wantsCloseUpView:(BOOL)a4 triggerAction:(int)a5
{
  return (id)[a1 entryPointWithMapItem:a3 isMarkedLocation:0 wantsCloseUpView:0 cameraFrameOverride:0 triggerAction:*(void *)&a5];
}

+ (id)entryPointWithMapItem:(id)a3 isMarkedLocation:(BOOL)a4 wantsCloseUpView:(BOOL)a5 cameraFrameOverride:(id)a6 triggerAction:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a6;
  v13 = [a1 entryPointWithMapItem:a3 wantsCloseUpView:v8];
  [v13 setCameraFrameOverride:v12];

  [v13 setTriggerAction:v7];
  [v13 setIsMarkedLocation:v9];

  return v13;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (BOOL)isMarkedLocation
{
  return self->_isMarkedLocation;
}

- (void)setIsMarkedLocation:(BOOL)a3
{
  self->_isMarkedLocation = a3;
}

- (BOOL)wantsCloseUpView
{
  return self->_wantsCloseUpView;
}

- (void)setWantsCloseUpView:(BOOL)a3
{
  self->_wantsCloseUpView = a3;
}

- (VKMuninMarker)muninMarker
{
  return self->_muninMarker;
}

- (void)setMuninMarker:(id)a3
{
}

- (double)heading
{
  return self->_heading;
}

- (void)setHeading:(double)a3
{
  self->_heading = a3;
}

- (GEOMuninViewState)muninViewState
{
  return self->_muninViewState;
}

- (void)setMuninViewState:(id)a3
{
}

- (int)triggerAction
{
  return self->_triggerAction;
}

- (void)setTriggerAction:(int)a3
{
  self->_triggerAction = a3;
}

- (GEOCameraFrame)cameraFrameOverride
{
  return self->_cameraFrameOverride;
}

- (void)setCameraFrameOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraFrameOverride, 0);
  objc_storeStrong((id *)&self->_muninViewState, 0);
  objc_storeStrong((id *)&self->_muninMarker, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end