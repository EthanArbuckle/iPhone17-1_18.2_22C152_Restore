@interface MUPlaceDistanceRibbonViewModel
- (MUPlaceDistanceRibbonViewModel)initWithMapItem:(id)a3 etaProvider:(id)a4;
- (id)titleStringProvider;
- (id)typeStringForAX;
- (id)valueStringProvider;
- (void)ETAProviderUpdated:(id)a3;
- (void)dealloc;
@end

@implementation MUPlaceDistanceRibbonViewModel

- (MUPlaceDistanceRibbonViewModel)initWithMapItem:(id)a3 etaProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F30EF8] sharedLocationManager];
  if ([v9 isAuthorizedForPreciseLocation] && objc_msgSend(v9, "hasLocation"))
  {
    v28.receiver = self;
    v28.super_class = (Class)MUPlaceDistanceRibbonViewModel;
    v10 = [(MUPlaceDistanceRibbonViewModel *)&v28 init];
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_mapItem, a3);
      v12 = [v9 currentLocation];
      v13 = v12;
      if (v12)
      {
        v14 = [v12 latLng];
        [v14 lat];
        CLLocationDegrees v16 = v15;
        v17 = [v13 latLng];
        [v17 lng];
        CLLocationCoordinate2D v19 = CLLocationCoordinate2DMake(v16, v18);
        double latitude = v19.latitude;
        double longitude = v19.longitude;
      }
      else
      {
        double latitude = *MEMORY[0x1E4F1E750];
        double longitude = *(double *)(MEMORY[0x1E4F1E750] + 8);
      }
      uint64_t v23 = +[MUPlaceRibbonItemViewModel distanceFromCurrentLocationItemViewModelForMapItem:currentLocationCoordinate:](MUPlaceRibbonItemViewModel, "distanceFromCurrentLocationItemViewModelForMapItem:currentLocationCoordinate:", v11->_mapItem, latitude, longitude);
      crowsDistanceViewModel = v11->_crowsDistanceViewModel;
      v11->_crowsDistanceViewModel = (MUPlaceRibbonItemViewModel *)v23;

      v25 = [(MUPlaceRibbonItemViewModel *)v11->_crowsDistanceViewModel typeStringForAX];
      [(MUPlaceRibbonItemViewModel *)v11 setTypeStringForAX:v25];

      id v26 = objc_storeWeak((id *)&v11->_etaProvider, v8);
      [v8 addObserver:v11];
    }
    self = v11;
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_etaProvider);
  [WeakRetained removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MUPlaceDistanceRibbonViewModel;
  [(MUPlaceDistanceRibbonViewModel *)&v4 dealloc];
}

- (void)ETAProviderUpdated:(id)a3
{
  id v11 = a3;
  objc_super v4 = [v11 distanceString];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [v11 distanceString];
    id v7 = +[MUPlaceRibbonItemViewModel distanceFromCurrentLocationItemViewModelForDistanceString:v6];
    crowsDistanceViewModel = self->_crowsDistanceViewModel;
    self->_crowsDistanceViewModel = v7;

    v9 = [(MUPlaceRibbonItemViewModel *)self->_crowsDistanceViewModel typeStringForAX];
    [(MUPlaceRibbonItemViewModel *)self setTypeStringForAX:v9];

    v10 = [(MUPlaceRibbonItemViewModel *)self updateDelegate];
    [v10 ribbonItemViewModelDidUpdate:self];
  }
}

- (id)titleStringProvider
{
  return [(MUPlaceRibbonItemViewModel *)self->_crowsDistanceViewModel titleStringProvider];
}

- (id)valueStringProvider
{
  return [(MUPlaceRibbonItemViewModel *)self->_crowsDistanceViewModel valueStringProvider];
}

- (id)typeStringForAX
{
  return @"Distance";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crowsDistanceViewModel, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_etaProvider);
}

@end