@interface _MKOfflineRegionCustomFeature
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (GEOMapDataSubscription)subscription;
- (_MKOfflineRegionCustomFeature)init;
- (_MKOfflineRegionCustomFeature)initWithSubscription:(id)a3;
- (id)feature;
- (void)setCoordinate:(id)a3;
@end

@implementation _MKOfflineRegionCustomFeature

- (_MKOfflineRegionCustomFeature)init
{
  result = (_MKOfflineRegionCustomFeature *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (_MKOfflineRegionCustomFeature)initWithSubscription:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_MKOfflineRegionCustomFeature;
  v6 = [(_MKOfflineRegionCustomFeature *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscription, a3);
    v8 = [v5 region];
    [v8 centerLat];
    double v10 = v9;
    v11 = [v5 region];
    [v11 centerLng];
    v7->_coordinate.latitude = v10;
    v7->_coordinate.longitude = v12;

    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB39F8]), "initWithCoordinate:", v7->_coordinate.latitude, v7->_coordinate.longitude);
    feature = v7->_feature;
    v7->_feature = (VKCustomFeature *)v13;

    v15 = v7->_feature;
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645A0]), "initWithAttributes:", 5, 3, 6, 452, 0);
    [(VKCustomFeature *)v15 setStyleAttributes:v16];

    v17 = v7->_feature;
    v18 = [v5 displayName];
    [(VKCustomFeature *)v17 setText:v18 locale:0];

    v19 = v7->_feature;
    v20 = [v5 region];
    [(VKCustomFeature *)v19 setFeatureRegion:v20];

    v21 = v7;
  }

  return v7;
}

- (id)feature
{
  return self->_feature;
}

- (GEOMapDataSubscription)subscription
{
  return self->_subscription;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCoordinate:(id)a3
{
  self->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);

  objc_storeStrong((id *)&self->_subscription, 0);
}

@end