@interface MRUVolumeHUDRouteDescriptionProvider
- (MRUOutputDeviceAsset)outputDeviceAsset;
- (MRUOutputDeviceAsset)overrideOutputDeviceAsset;
- (MRUVolumeHUDRouteDescriptionProvider)init;
- (MRUVolumeHUDRouteDescriptionProviderDelegate)delegate;
- (id)packageStateForVolumeValue:(float)a3;
- (void)cycleOverridePackageDescriptions;
- (void)resetOverridePackageDescription;
- (void)setDelegate:(id)a3;
- (void)setOutputDeviceAsset:(id)a3;
- (void)setOverrideOutputDeviceAsset:(id)a3;
- (void)updateOutputDeviceAsset;
@end

@implementation MRUVolumeHUDRouteDescriptionProvider

- (void)cycleOverridePackageDescriptions
{
  v3 = [(MRUVolumeHUDRouteDescriptionProvider *)self outputDeviceAsset];
  uint64_t v4 = [v3 type];

  uint64_t v5 = (v4 + 1) % 23;
  if (v5 == 2)
  {
    uint64_t v6 = +[MRUOutputDeviceAsset sharingAsset];
  }
  else
  {
    if (v5 == 1) {
      +[MRUOutputDeviceAsset inCallAsset];
    }
    else {
    uint64_t v6 = +[MRUOutputDeviceAsset speakerAsset];
    }
  }
  id v7 = (id)v6;
  [(MRUVolumeHUDRouteDescriptionProvider *)self setOverrideOutputDeviceAsset:v6];
}

- (void)resetOverridePackageDescription
{
}

- (MRUVolumeHUDRouteDescriptionProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)MRUVolumeHUDRouteDescriptionProvider;
  v2 = [(MRUVolumeHUDRouteDescriptionProvider *)&v5 init];
  if (v2)
  {
    v3 = +[MRUSystemOutputDeviceRouteController sharedController];
    [v3 addObserver:v2];

    [(MRUVolumeHUDRouteDescriptionProvider *)v2 updateOutputDeviceAsset];
  }
  return v2;
}

- (id)packageStateForVolumeValue:(float)a3
{
  return +[MRUSystemVolumeController packageStateForVolumeValue:](MRUSystemVolumeController, "packageStateForVolumeValue:");
}

- (MRUOutputDeviceAsset)outputDeviceAsset
{
  overrideOutputDeviceAsset = self->_overrideOutputDeviceAsset;
  if (!overrideOutputDeviceAsset) {
    overrideOutputDeviceAsset = self->_outputDeviceAsset;
  }
  return overrideOutputDeviceAsset;
}

- (void)setOverrideOutputDeviceAsset:(id)a3
{
  objc_storeStrong((id *)&self->_overrideOutputDeviceAsset, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v4 = [(MRUVolumeHUDRouteDescriptionProvider *)self outputDeviceAsset];
  [WeakRetained volumeHUDRouteDescriptionProvider:self didChangeOutputDeviceAsset:v4];
}

- (void)updateOutputDeviceAsset
{
  v3 = +[MRUSystemOutputDeviceRouteController sharedController];
  id obj = [v3 systemOutputDeviceAssetWithInCall];

  if (![(MRUOutputDeviceAsset *)self->_outputDeviceAsset isEqual:obj])
  {
    objc_storeStrong((id *)&self->_outputDeviceAsset, obj);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_super v5 = [(MRUVolumeHUDRouteDescriptionProvider *)self outputDeviceAsset];
    [WeakRetained volumeHUDRouteDescriptionProvider:self didChangeOutputDeviceAsset:v5];
  }
}

- (MRUVolumeHUDRouteDescriptionProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUVolumeHUDRouteDescriptionProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setOutputDeviceAsset:(id)a3
{
}

- (MRUOutputDeviceAsset)overrideOutputDeviceAsset
{
  return self->_overrideOutputDeviceAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideOutputDeviceAsset, 0);
  objc_storeStrong((id *)&self->_outputDeviceAsset, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end