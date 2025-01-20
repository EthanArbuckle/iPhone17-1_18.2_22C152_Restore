@interface MKLookAroundScene
- (BOOL)_wantsCloseUpView;
- (GEOCameraFrame)_cameraFrameOverride;
- (GEOMuninViewState)_muninViewState;
- (MKLookAroundScene)initWithMapItem:(id)a3;
- (MKLookAroundScene)initWithMapItem:(id)a3 cameraFrameOverride:(id)a4;
- (MKLookAroundScene)initWithMuninViewState:(id)a3;
- (MKMapItem)_mapItem;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_type;
- (void)_setWantsCloseUpView:(BOOL)a3;
@end

@implementation MKLookAroundScene

- (MKLookAroundScene)initWithMapItem:(id)a3
{
  return [(MKLookAroundScene *)self initWithMapItem:a3 cameraFrameOverride:0];
}

- (MKLookAroundScene)initWithMapItem:(id)a3 cameraFrameOverride:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MKLookAroundScene;
  v9 = [(MKLookAroundScene *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_type = 0;
    objc_storeStrong((id *)&v9->_mapItem, a3);
    uint64_t v11 = [v8 copy];
    cameraFrameOverride = v10->_cameraFrameOverride;
    v10->_cameraFrameOverride = (GEOCameraFrame *)v11;
  }
  return v10;
}

- (MKLookAroundScene)initWithMuninViewState:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MKLookAroundScene;
  v5 = [(MKLookAroundScene *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_type = 1;
    uint64_t v7 = [v4 copy];
    muninViewState = v6->_muninViewState;
    v6->_muninViewState = (GEOMuninViewState *)v7;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 16) = self->_type;
  objc_storeStrong((id *)(v4 + 40), self->_mapItem);
  uint64_t v5 = [(GEOCameraFrame *)self->_cameraFrameOverride copy];
  v6 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v5;

  uint64_t v7 = [(GEOMuninViewState *)self->_muninViewState copy];
  id v8 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v7;

  *(unsigned char *)(v4 + 8) = self->_wantsCloseUpView;
  return (id)v4;
}

- (unint64_t)_type
{
  return self->_type;
}

- (GEOCameraFrame)_cameraFrameOverride
{
  return self->_cameraFrameOverride;
}

- (GEOMuninViewState)_muninViewState
{
  return self->_muninViewState;
}

- (BOOL)_wantsCloseUpView
{
  return self->_wantsCloseUpView;
}

- (void)_setWantsCloseUpView:(BOOL)a3
{
  self->_wantsCloseUpView = a3;
}

- (MKMapItem)_mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_muninViewState, 0);

  objc_storeStrong((id *)&self->_cameraFrameOverride, 0);
}

@end