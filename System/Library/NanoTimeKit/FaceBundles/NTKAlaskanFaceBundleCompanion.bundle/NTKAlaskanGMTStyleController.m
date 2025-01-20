@interface NTKAlaskanGMTStyleController
- ($F24F406B2B787EFB06265DBA3D28CBD5)_geoLocationForCLLocation:(id)a3;
- (BOOL)containsCityIdentifier:(id)a3;
- (BOOL)crownInputHandlerCanChangeProgress:(id)a3;
- (BOOL)crownInputHandlerDidPressCrown:(id)a3;
- (BOOL)crownInputHandlerDidPressSideButton:(id)a3;
- (BOOL)tritiumAnimationInProgress;
- (BOOL)updateTimezoneLocations:(id)a3;
- (BOOL)updateWorldClockCitiesIfNeeded;
- (BOOL)wantsStatusBarHidden;
- (CLKClockTimerToken)clockTimerToken;
- (NSArray)currentTimezoneLocations;
- (NSMutableDictionary)transitInfoByCity;
- (NSSet)currentWorldClockCities;
- (NSSet)defaultCityIdentifiers;
- (NTKAlaskanGMTStyleController)initWithContentView:(id)a3 crownInputHandler:(id)a4 storage:(id)a5;
- (NTKAlaskanGMTStyleView)gmtView;
- (NTKAlaskanGMTTimezoneLocation)currentSelectedTimezoneLocation;
- (NTKAlaskanPersistenceStorage)storage;
- (NTKAnalogFaceView)faceView;
- (NTKCrownInputHandler)crownInputHandler;
- (double)previousProgress;
- (float)hourOffsetForTimezone:(id)a3;
- (id)almanacTransitInfoForCity:(id)a3;
- (id)currentDate;
- (id)currentTimezoneLocation;
- (id)timezoneLocationFromCLLocation:(id)a3;
- (id)timezoneLocationFromCity:(id)a3;
- (id)timezoneLocationFromCityIdentifier:(int)a3;
- (id)worldClockCities;
- (void)_saveReferenceTimezoneLocation;
- (void)_startClockUpdates;
- (void)_stopClockUpdates;
- (void)_updateDefaultLocations;
- (void)alaskanGMTStyleView:(id)a3 didSelectTimezoneLocation:(id)a4;
- (void)alaskanGMTStyleViewDidCancelEditing:(id)a3 animated:(BOOL)a4;
- (void)alaskanGMTStyleViewDidFinishEditing:(id)a3;
- (void)alaskanGMTStyleViewDidResetHourOffset:(id)a3;
- (void)alaskanGMTStyleViewDidStartEditing:(id)a3;
- (void)crownInputHandler:(id)a3 didChangeProgress:(double)a4;
- (void)crownInputHandlerDidBecomeIdle:(id)a3;
- (void)currentLocationChangeNotification;
- (void)dealloc;
- (void)handleExitingEditModeAnimated:(BOOL)a3;
- (void)handleLocalTimeZoneChangedNotification;
- (void)handleTimezoneChanged;
- (void)resetGMTSunsetSunriseInformation;
- (void)setClockTimerToken:(id)a3;
- (void)setCrownInputHandler:(id)a3;
- (void)setCurrentSelectedTimezoneLocation:(id)a3;
- (void)setCurrentTimezoneLocations:(id)a3;
- (void)setCurrentWorldClockCities:(id)a3;
- (void)setDatamode:(int64_t)a3;
- (void)setDefaultCityIdentifiers:(id)a3;
- (void)setFaceView:(id)a3;
- (void)setGmtView:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setPreviousProgress:(double)a3;
- (void)setStorage:(id)a3;
- (void)setTransitInfoByCity:(id)a3;
- (void)setTritiumAnimationInProgress:(BOOL)a3;
- (void)significantTimeChangeNotification;
- (void)startListeningForLocalTimeZoneChangeNotification;
- (void)startListeningForLocationChangeNotification;
- (void)startListeningForSignificantTimeChangeNotification;
- (void)startListeningTimezoneChangeNotification;
- (void)stopListeningForLocalTimeZoneChangeNotification;
- (void)stopListeningForLocationChangeNotification;
- (void)stopListeningForSignificantTimeChangeNotification;
- (void)stopListeningForTimezoneChangeNotification;
- (void)updateSelectionInViewAnimated:(BOOL)a3 saveSelection:(BOOL)a4 completionBlock:(id)a5;
- (void)updateSelectionInViewSavingSelection:(BOOL)a3;
- (void)updateWorldClockCities;
@end

@implementation NTKAlaskanGMTStyleController

- (NTKAlaskanGMTStyleController)initWithContentView:(id)a3 crownInputHandler:(id)a4 storage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)NTKAlaskanGMTStyleController;
  v11 = [(NTKAlaskanGMTStyleController *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_crownInputHandler, a4);
    objc_storeStrong((id *)&v12->_storage, a5);
    id v13 = objc_storeWeak((id *)&v12->_gmtView, v8);
    [v8 setDelegate:v12];

    [(NTKCrownInputHandler *)v12->_crownInputHandler setDelegate:v12];
    [(NTKCrownInputHandler *)v12->_crownInputHandler setOffsetPerRevolution:NTKCrownInputHandlerDefaultOffsetPerRevolution];
    [(NTKCrownInputHandler *)v12->_crownInputHandler setUseWideIdleCheck:0];
    [(NTKCrownInputHandler *)v12->_crownInputHandler progress];
    v12->_previousProgress = v14;
    +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_3A660, &off_3A678, &off_3A690, &off_3A6A8, &off_3A6C0, &off_3A6D8, &off_3A6F0, &off_3A708, &off_3A720, &off_3A738, &off_3A750, &off_3A768, &off_3A780, &off_3A798, &off_3A7B0, &off_3A7C8, &off_3A7E0,
      &off_3A7F8,
      &off_3A810,
      &off_3A828,
      &off_3A840,
      &off_3A858,
      &off_3A870,
      &off_3A888,
      &off_3A8A0,
    uint64_t v15 = 0);
    defaultCityIdentifiers = v12->_defaultCityIdentifiers;
    v12->_defaultCityIdentifiers = (NSSet *)v15;

    [(NTKAlaskanGMTStyleController *)v12 _updateDefaultLocations];
    id WeakRetained = objc_loadWeakRetained((id *)&v12->_gmtView);
    [WeakRetained setAdditionalTimezoneLocations:&__NSArray0__struct];

    [(NTKAlaskanGMTStyleController *)v12 updateWorldClockCitiesIfNeeded];
    [(NTKAlaskanGMTStyleController *)v12 startListeningForSignificantTimeChangeNotification];
    [(NTKAlaskanGMTStyleController *)v12 startListeningForLocationChangeNotification];
    v18 = NTKIdealizedDate();
    id v19 = objc_loadWeakRetained((id *)&v12->_gmtView);
    [v19 setDate:v18];
  }
  return v12;
}

- (void)dealloc
{
  [(NTKAlaskanGMTStyleController *)self _stopClockUpdates];
  [(NTKAlaskanGMTStyleController *)self stopListeningForSignificantTimeChangeNotification];
  [(NTKAlaskanGMTStyleController *)self stopListeningForLocalTimeZoneChangeNotification];
  [(NTKAlaskanGMTStyleController *)self stopListeningForLocationChangeNotification];
  [(NTKAlaskanGMTStyleController *)self stopListeningForTimezoneChangeNotification];
  v3.receiver = self;
  v3.super_class = (Class)NTKAlaskanGMTStyleController;
  [(NTKAlaskanGMTStyleController *)&v3 dealloc];
}

- (BOOL)wantsStatusBarHidden
{
  return 0;
}

- (void)setTritiumAnimationInProgress:(BOOL)a3
{
  self->_tritiumAnimationInProgress = a3;
  BOOL v3 = !a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gmtView);
  [WeakRetained setUserInteractionEnabled:v3];
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);

  [(NTKAlaskanGMTStyleController *)self updateWorldClockCitiesIfNeeded];
}

- (void)setDatamode:(int64_t)a3
{
  if ((unint64_t)a3 <= 5)
  {
    if (((1 << a3) & 0x35) != 0)
    {
      [(NTKAlaskanGMTStyleController *)self _stopClockUpdates];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_gmtView);
      [WeakRetained setIsEditing:0];

      id v5 = objc_loadWeakRetained((id *)&self->_gmtView);
      [v5 setUserInteractionEnabled:0];

      [(NTKAlaskanGMTStyleController *)self stopListeningForLocalTimeZoneChangeNotification];
      [(NTKAlaskanGMTStyleController *)self stopListeningForTimezoneChangeNotification];
      [(NTKAlaskanGMTStyleController *)self updateWorldClockCitiesIfNeeded];
    }
    else if (a3 == 1)
    {
      [(NTKAlaskanGMTStyleController *)self updateWorldClockCitiesIfNeeded];
      uint64_t v6 = [(NTKAlaskanGMTStyleController *)self tritiumAnimationInProgress] ^ 1;
      id v7 = objc_loadWeakRetained((id *)&self->_gmtView);
      [v7 setUserInteractionEnabled:v6];

      [(NTKAlaskanGMTStyleController *)self _startClockUpdates];
      [(NTKAlaskanGMTStyleController *)self startListeningForLocalTimeZoneChangeNotification];
      [(NTKAlaskanGMTStyleController *)self startListeningTimezoneChangeNotification];
    }
    else
    {
      [(NTKAlaskanGMTStyleController *)self _stopClockUpdates];
      id v8 = objc_loadWeakRetained((id *)&self->_gmtView);
      [v8 setIsEditing:0];

      id v9 = objc_loadWeakRetained((id *)&self->_gmtView);
      [v9 setUserInteractionEnabled:0];

      [(NTKAlaskanGMTStyleController *)self stopListeningForLocalTimeZoneChangeNotification];
      [(NTKAlaskanGMTStyleController *)self stopListeningForTimezoneChangeNotification];
    }
  }
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_FEA8;
  v8[3] = &unk_38F38;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  +[UIView animateWithDuration:v8 animations:a4];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)resetGMTSunsetSunriseInformation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gmtView);
  [WeakRetained selectHourOffset:0.0];
}

- (void)_startClockUpdates
{
  if (!self->_clockTimerToken)
  {
    objc_initWeak(&location, self);
    id v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    id v9 = sub_10060;
    id v10 = &unk_38A98;
    objc_copyWeak(&v11, &location);
    BOOL v3 = objc_retainBlock(&v7);
    v4 = +[CLKClockTimer sharedInstance];
    id v5 = [v4 startUpdatesWithUpdateFrequency:0 withHandler:v3 identificationLog:&stru_38F58];
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = v5;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_stopClockUpdates
{
  if (self->_clockTimerToken)
  {
    BOOL v3 = +[CLKClockTimer sharedInstance];
    [v3 stopUpdatesForToken:self->_clockTimerToken];

    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;
  }
}

- (void)crownInputHandler:(id)a3 didChangeProgress:(double)a4
{
  p_gmtView = &self->_gmtView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gmtView);
  unsigned __int8 v8 = [WeakRetained isEditing];

  if ((v8 & 1) == 0)
  {
    double v9 = 1.0 - a4;
    if (a4 < 0.5) {
      double v9 = a4;
    }
    if (vabdd_f64(self->_previousProgress, v9) > 0.04)
    {
      self->_previousProgress = a4;
      id v10 = objc_loadWeakRetained((id *)p_gmtView);
      [v10 setIsEditing:1];
    }
  }
}

- (BOOL)crownInputHandlerCanChangeProgress:(id)a3
{
  v4 = [(NTKAlaskanGMTStyleController *)self faceView];
  if ([v4 dataMode] == (char *)&dword_0 + 1) {
    unsigned int v5 = ![(NTKAlaskanGMTStyleController *)self tritiumAnimationInProgress];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)crownInputHandlerDidBecomeIdle:(id)a3
{
  self->_previousProgress = 0.0;
}

- (BOOL)crownInputHandlerDidPressCrown:(id)a3
{
  p_gmtView = &self->_gmtView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gmtView);
  unsigned int v5 = [WeakRetained isEditing];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_gmtView);
    [v6 setIsEditing:0];
  }
  return v5;
}

- (BOOL)crownInputHandlerDidPressSideButton:(id)a3
{
  return 0;
}

- (void)alaskanGMTStyleViewDidStartEditing:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(NTKAlaskanGMTStyleController *)self faceView];
  [v5 enableCrownEventReception];

  id v6 = [(NTKAlaskanGMTStyleController *)self faceView];
  [v6 enumerateComplicationDisplayWrappersWithBlock:&stru_38F78];

  objc_initWeak(&location, self);
  double v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_104C8;
  v12 = &unk_38B68;
  objc_copyWeak(&v13, &location);
  +[UIView animateWithDuration:&v9 animations:0.3 * 0.5];
  id v7 = [(NTKAlaskanGMTStyleController *)self faceView];
  unsigned __int8 v8 = [v7 delegate];
  [v8 faceViewWantsStatusBarHidden:1 animated:1];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)alaskanGMTStyleViewDidFinishEditing:(id)a3
{
  id v4 = [(NTKAlaskanGMTStyleController *)self faceView];
  [v4 disableCrownEventReception];

  [(NTKAlaskanGMTStyleController *)self handleExitingEditModeAnimated:1];
  unsigned int v5 = [(NTKAlaskanGMTTimezoneLocation *)self->_currentSelectedTimezoneLocation cityIdentifier];

  currentSelectedTimezoneLocation = self->_currentSelectedTimezoneLocation;
  if (v5)
  {
    id v7 = [(NTKAlaskanGMTTimezoneLocation *)currentSelectedTimezoneLocation cityIdentifier];
    unsigned __int8 v8 = [(NTKAlaskanGMTStyleController *)self storage];
    [v8 setGmtSelectedCityIdentifier:v7];

LABEL_5:
    goto LABEL_6;
  }
  double v9 = [(NTKAlaskanGMTTimezoneLocation *)currentSelectedTimezoneLocation locationName];

  if (v9)
  {
    uint64_t v10 = [(NTKAlaskanGMTStyleController *)self storage];
    [v10 setGmtOffsetHours:0];

    id v11 = [(NTKAlaskanGMTStyleController *)self storage];
    [v11 setGmtSelectedCityIdentifier:0];

    id v7 = [(NTKAlaskanGMTStyleController *)self storage];
    [v7 setGmtSelectedTimezone:0];
    goto LABEL_5;
  }
  [(NTKAlaskanGMTStyleController *)self _saveReferenceTimezoneLocation];
LABEL_6:

  [(NTKAlaskanGMTStyleController *)self updateSelectionInViewSavingSelection:1];
}

- (void)alaskanGMTStyleViewDidCancelEditing:(id)a3 animated:(BOOL)a4
{
}

- (void)handleExitingEditModeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(NTKAlaskanGMTStyleController *)self faceView];
  [v5 enumerateComplicationDisplayWrappersWithBlock:&stru_38F98];

  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1088C;
  v13[3] = &unk_38B68;
  objc_copyWeak(&v14, &location);
  id v6 = objc_retainBlock(v13);
  id v7 = v6;
  if (v3)
  {
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(0.3 * 0.5 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10958;
    block[3] = &unk_38FC0;
    id v12 = v7;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    ((void (*)(void *))v6[2])(v6);
  }
  double v9 = [(NTKAlaskanGMTStyleController *)self faceView];
  uint64_t v10 = [v9 delegate];
  [v10 faceViewWantsStatusBarHidden:0 animated:1];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)alaskanGMTStyleView:(id)a3 didSelectTimezoneLocation:(id)a4
{
  unsigned int v5 = (NTKAlaskanGMTTimezoneLocation *)a4;
  id v6 = [(NTKAlaskanGMTStyleController *)self faceView];
  id v7 = (char *)[v6 dataMode];

  if (v7 == (unsigned char *)&dword_0 + 1) {
    [(NTKCrownInputHandler *)self->_crownInputHandler generateMajorDetents];
  }
  currentSelectedTimezoneLocation = self->_currentSelectedTimezoneLocation;
  self->_currentSelectedTimezoneLocation = v5;
}

- (void)alaskanGMTStyleViewDidResetHourOffset:(id)a3
{
  self->_currentSelectedTimezoneLocation = 0;
  _objc_release_x1();
}

- (void)_updateDefaultLocations
{
  BOOL v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_defaultCityIdentifiers;
  id v5 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      dispatch_time_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = -[NTKAlaskanGMTStyleController timezoneLocationFromCityIdentifier:](self, "timezoneLocationFromCityIdentifier:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v8), "intValue", (void)v12));
        if (v9) {
          [v3 addObject:v9];
        }

        dispatch_time_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [v3 sortedArrayUsingComparator:&stru_39000];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gmtView);
  [WeakRetained setDefaultLocations:v10];
}

- (void)updateWorldClockCities
{
  currentTimezoneLocations = self->_currentTimezoneLocations;
  self->_currentTimezoneLocations = 0;

  currentWorldClockCities = self->_currentWorldClockCities;
  self->_currentWorldClockCities = 0;

  [(NTKAlaskanGMTStyleController *)self updateWorldClockCitiesIfNeeded];
}

- (BOOL)updateWorldClockCitiesIfNeeded
{
  BOOL v3 = self->_currentWorldClockCities;
  id v4 = [(NTKAlaskanGMTStyleController *)self worldClockCities];
  id v5 = +[NSSet setWithArray:v4];
  currentWorldClockCities = self->_currentWorldClockCities;
  self->_currentWorldClockCities = v5;

  unsigned __int8 v7 = [(NSSet *)self->_currentWorldClockCities isEqualToSet:v3];
  if ((v7 & 1) == 0)
  {
    v24 = v3;
    dispatch_time_t v8 = +[NSMutableArray arrayWithCapacity:[(NSSet *)self->_currentWorldClockCities count]];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    double v9 = self->_currentWorldClockCities;
    id v10 = [(NSSet *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          defaultCityIdentifiers = self->_defaultCityIdentifiers;
          v16 = [v14 alCityId];
          LOBYTE(defaultCityIdentifiers) = [(NSSet *)defaultCityIdentifiers containsObject:v16];

          if ((defaultCityIdentifiers & 1) == 0)
          {
            v17 = [(NTKAlaskanGMTStyleController *)self timezoneLocationFromCity:v14];
            [v8 addObject:v17];
          }
        }
        id v11 = [(NSSet *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v11);
    }

    BOOL v3 = v24;
    if (![(NTKAlaskanGMTStyleController *)self updateTimezoneLocations:v8]) {
      goto LABEL_18;
    }
    v18 = [(NTKAlaskanGMTStyleController *)self faceView];
    if ([v18 dataMode] == (char *)&dword_0 + 3)
    {
    }
    else
    {
      id v19 = [(NTKAlaskanGMTStyleController *)self storage];

      if (v19)
      {
        v20 = [(NTKAlaskanGMTStyleController *)self currentTimezoneLocation];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_gmtView);
        [WeakRetained setReferenceTimezoneLocation:v20];

LABEL_17:
        id v22 = objc_loadWeakRetained((id *)&self->_gmtView);
        [v22 setAdditionalTimezoneLocations:v8];

        [(NTKAlaskanGMTStyleController *)self updateSelectionInViewSavingSelection:0];
LABEL_18:

        goto LABEL_19;
      }
    }
    v20 = objc_loadWeakRetained((id *)&self->_gmtView);
    [v20 setReferenceTimezoneLocation:0];
    goto LABEL_17;
  }
LABEL_19:

  return v7 ^ 1;
}

- (BOOL)updateTimezoneLocations:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sortedArrayUsingComparator:&stru_39020];
  id v6 = [v5 mutableCopy];

  id v7 = [v4 count];
  currentTimezoneLocations = self->_currentTimezoneLocations;
  p_currentTimezoneLocations = &self->_currentTimezoneLocations;
  if (v7 != (id)[(NSArray *)currentTimezoneLocations count] || !*p_currentTimezoneLocations)
  {
LABEL_8:
    objc_storeStrong((id *)p_currentTimezoneLocations, v6);
    BOOL v14 = 1;
    goto LABEL_9;
  }
  if ([(NSArray *)*p_currentTimezoneLocations count])
  {
    uint64_t v10 = 0;
    do
    {
      id v11 = [v6 objectAtIndexedSubscript:v10];
      uint64_t v12 = [(NSArray *)*p_currentTimezoneLocations objectAtIndexedSubscript:v10];
      unsigned __int8 v13 = [v11 isEqual:v12];

      if ((v13 & 1) == 0) {
        goto LABEL_8;
      }
    }
    while (++v10 < [(NSArray *)*p_currentTimezoneLocations count]);
  }
  BOOL v14 = 0;
LABEL_9:

  return v14;
}

- (id)currentTimezoneLocation
{
  BOOL v3 = +[NTKLocationManager sharedLocationManager];
  id v4 = [v3 anyLocation];

  id v5 = [(NTKAlaskanGMTStyleController *)self timezoneLocationFromCLLocation:v4];

  return v5;
}

- (id)worldClockCities
{
  v2 = +[NTKWorldClockManager sharedManager];
  uint64_t v3 = [v2 cities];
  if (!v3 || (v4 = (void *)v3, unsigned int v5 = [v2 checkIfCitiesModified], v4, v5)) {
    [v2 loadCities];
  }
  id v6 = [v2 cities];

  return v6;
}

- (id)timezoneLocationFromCityIdentifier:(int)a3
{
  id v4 = [objc_alloc((Class)WorldClockCity) initWithALCityIdentifier:*(void *)&a3];
  if (v4)
  {
    unsigned int v5 = [(NTKAlaskanGMTStyleController *)self timezoneLocationFromCity:v4];
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (id)timezoneLocationFromCity:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 timeZone];
  id v6 = +[NSTimeZone timeZoneWithName:v5];

  id v7 = objc_alloc_init(NTKAlaskanGMTTimezoneLocation);
  [(NTKAlaskanGMTStyleController *)self hourOffsetForTimezone:v6];
  -[NTKAlaskanGMTTimezoneLocation setHourOffset:](v7, "setHourOffset:");
  dispatch_time_t v8 = NTKWorldClockCityAbbreviation();
  [(NTKAlaskanGMTTimezoneLocation *)v7 setLocationName:v8];

  double v9 = [v6 name];
  [(NTKAlaskanGMTTimezoneLocation *)v7 setTimezone:v9];

  uint64_t v10 = [v4 alCityId];
  [(NTKAlaskanGMTTimezoneLocation *)v7 setCityIdentifier:v10];

  id v11 = [v4 countryCode];

  [v4 name];
  if (v11) {
    uint64_t v12 = {;
  }
    unsigned __int8 v13 = [v4 countryCode];
    BOOL v14 = +[NSString stringWithFormat:@"%@, %@", v12, v13];
    [(NTKAlaskanGMTTimezoneLocation *)v7 setCityName:v14];
  }
  else {
    uint64_t v12 = {;
  }
    [(NTKAlaskanGMTTimezoneLocation *)v7 setCityName:v12];
  }

  long long v15 = [v4 alCity];

  if (v15)
  {
    v16 = [(NTKAlaskanGMTStyleController *)self almanacTransitInfoForCity:v4];
    uint64_t v17 = [v16 rise];
    if (v17)
    {
      v18 = (void *)v17;
      id v19 = [v16 set];

      if (v19)
      {
        v20 = +[NSCalendar currentCalendar];
        objc_super v21 = [v16 rise];
        id v22 = [v20 componentsInTimeZone:v6 fromDate:v21];

        -[NTKAlaskanGMTTimezoneLocation setSunriseHourOfDay:](v7, "setSunriseHourOfDay:", (double)(uint64_t)[v22 minute] / 60.0 + (float)(uint64_t)objc_msgSend(v22, "hour"));
        v23 = [v16 set];
        v24 = [v20 componentsInTimeZone:v6 fromDate:v23];

        -[NTKAlaskanGMTTimezoneLocation setSunsetHourOfDay:](v7, "setSunsetHourOfDay:", (double)(uint64_t)[v24 minute] / 60.0 + (float)(uint64_t)objc_msgSend(v24, "hour"));
      }
    }
  }

  return v7;
}

- (id)timezoneLocationFromCLLocation:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_alloc_init(NTKAlaskanGMTTimezoneLocation);
  [(NTKAlaskanGMTTimezoneLocation *)v5 setHourOffset:0.0];
  id v6 = [(NTKAlaskanGMTStyleController *)self currentDate];
  [(NTKAlaskanGMTStyleController *)self _geoLocationForCLLocation:v4];
  double v8 = v7;
  double v10 = v9;

  id v11 = +[CLKUIAlmanacTransitInfo transitInfoForDate:location:](CLKUIAlmanacTransitInfo, "transitInfoForDate:location:", v6, v8, v10);

  uint64_t v12 = [v11 rise];
  if (v12)
  {
    unsigned __int8 v13 = (void *)v12;
    BOOL v14 = [v11 set];

    if (v14)
    {
      long long v15 = +[NSCalendar currentCalendar];
      v16 = +[NSTimeZone localTimeZone];
      uint64_t v17 = [v11 rise];
      v18 = [v15 componentsInTimeZone:v16 fromDate:v17];

      -[NTKAlaskanGMTTimezoneLocation setSunriseHourOfDay:](v5, "setSunriseHourOfDay:", (double)(uint64_t)[v18 minute] / 60.0 + (float)(uint64_t)objc_msgSend(v18, "hour"));
      id v19 = +[NSTimeZone localTimeZone];
      v20 = [v11 set];
      objc_super v21 = [v15 componentsInTimeZone:v19 fromDate:v20];

      -[NTKAlaskanGMTTimezoneLocation setSunsetHourOfDay:](v5, "setSunsetHourOfDay:", (double)(uint64_t)[v21 minute] / 60.0 + (float)(uint64_t)objc_msgSend(v21, "hour"));
    }
  }

  return v5;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_geoLocationForCLLocation:(id)a3
{
  id v3 = a3;
  [v3 coordinate];
  double v5 = v4;
  [v3 coordinate];
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (id)almanacTransitInfoForCity:(id)a3
{
  id v4 = a3;
  double v5 = [v4 alCity];

  if (v5)
  {
    transitInfoByCity = self->_transitInfoByCity;
    if (!transitInfoByCity)
    {
      double v7 = +[NSMutableDictionary dictionary];
      double v8 = self->_transitInfoByCity;
      self->_transitInfoByCity = v7;

      transitInfoByCity = self->_transitInfoByCity;
    }
    double v9 = [v4 alCity];
    double v10 = [v9 classicIdentifier];
    double v5 = [(NSMutableDictionary *)transitInfoByCity objectForKeyedSubscript:v10];

    if (!v5)
    {
      id v11 = [(NTKAlaskanGMTStyleController *)self currentDate];
      uint64_t v12 = [v4 alCity];
      double v5 = +[CLKUIAlmanacTransitInfo transitInfoForDate:v11 city:v12];

      unsigned __int8 v13 = self->_transitInfoByCity;
      BOOL v14 = [v4 alCity];
      long long v15 = [v14 classicIdentifier];
      [(NSMutableDictionary *)v13 setObject:v5 forKeyedSubscript:v15];
    }
  }

  return v5;
}

- (BOOL)containsCityIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    unsigned __int8 v14 = 0;
    unsigned __int8 v14 = [(NSSet *)self->_defaultCityIdentifiers containsObject:v4];
    if (*((unsigned char *)v12 + 24))
    {
      char v5 = 1;
    }
    else
    {
      currentWorldClockCities = self->_currentWorldClockCities;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_119DC;
      v8[3] = &unk_39048;
      id v9 = v4;
      double v10 = &v11;
      [(NSSet *)currentWorldClockCities enumerateObjectsUsingBlock:v8];

      char v5 = *((unsigned char *)v12 + 24) != 0;
    }
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)updateSelectionInViewSavingSelection:(BOOL)a3
{
}

- (void)updateSelectionInViewAnimated:(BOOL)a3 saveSelection:(BOOL)a4 completionBlock:(id)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gmtView);
  [WeakRetained selectHourOffset:0.0];
}

- (void)_saveReferenceTimezoneLocation
{
  id v3 = +[NSTimeZone localTimeZone];
  id v4 = [v3 name];
  char v5 = [(NTKAlaskanGMTStyleController *)self storage];
  [v5 setGmtSelectedTimezone:v4];

  double v6 = [(NTKAlaskanGMTStyleController *)self storage];
  [v6 setGmtOffsetHours:&off_3A8B8];

  id v7 = [(NTKAlaskanGMTStyleController *)self storage];
  [v7 setGmtSelectedCityIdentifier:0];
}

- (float)hourOffsetForTimezone:(id)a3
{
  id v3 = a3;
  id v4 = +[NSDate date];
  char v5 = +[NSTimeZone localTimeZone];
  double v6 = [v5 secondsFromGMTForDate:v4];
  id v7 = [v3 secondsFromGMTForDate:v4];

  return (double)(v7 - v6) / 60.0 / 60.0;
}

- (void)startListeningForSignificantTimeChangeNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"significantTimeChangeNotification" name:UIApplicationSignificantTimeChangeNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"significantTimeChangeNotification" name:NSCalendarDayChangedNotification object:0];
}

- (void)stopListeningForSignificantTimeChangeNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationSignificantTimeChangeNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:NSCalendarDayChangedNotification object:0];
}

- (void)startListeningForLocalTimeZoneChangeNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleLocalTimeZoneChangedNotification" name:NSSystemTimeZoneDidChangeNotification object:0];
}

- (void)stopListeningForLocalTimeZoneChangeNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSSystemTimeZoneDidChangeNotification object:0];
}

- (void)startListeningForLocationChangeNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"currentLocationChangeNotification" name:NTKLocationManagerSignificantLocationChangeNotification object:0];
}

- (void)startListeningTimezoneChangeNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleTimezoneChanged" name:NSSystemTimeZoneDidChangeNotification object:0];
}

- (void)stopListeningForTimezoneChangeNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSSystemTimeZoneDidChangeNotification object:0];
}

- (void)stopListeningForLocationChangeNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NTKLocationManagerSignificantLocationChangeNotification object:0];
}

- (void)handleLocalTimeZoneChangedNotification
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12048;
  block[3] = &unk_39070;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)significantTimeChangeNotification
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_120F8;
  block[3] = &unk_39070;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)currentLocationChangeNotification
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_121B4;
  block[3] = &unk_39070;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)handleTimezoneChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12264;
  block[3] = &unk_39070;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)currentDate
{
  v2 = [(NTKAlaskanGMTStyleController *)self faceView];
  id v3 = [v2 currentDisplayDate];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NTKDate faceDate];
  }
  double v6 = v5;

  return v6;
}

- (NTKAlaskanPersistenceStorage)storage
{
  return self->_storage;
}

- (NTKAnalogFaceView)faceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);

  return (NTKAnalogFaceView *)WeakRetained;
}

- (void)setFaceView:(id)a3
{
}

- (BOOL)tritiumAnimationInProgress
{
  return self->_tritiumAnimationInProgress;
}

- (NTKAlaskanGMTStyleView)gmtView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gmtView);

  return (NTKAlaskanGMTStyleView *)WeakRetained;
}

- (void)setGmtView:(id)a3
{
}

- (CLKClockTimerToken)clockTimerToken
{
  return self->_clockTimerToken;
}

- (void)setClockTimerToken:(id)a3
{
}

- (NSMutableDictionary)transitInfoByCity
{
  return self->_transitInfoByCity;
}

- (void)setTransitInfoByCity:(id)a3
{
}

- (NTKCrownInputHandler)crownInputHandler
{
  return self->_crownInputHandler;
}

- (void)setCrownInputHandler:(id)a3
{
}

- (double)previousProgress
{
  return self->_previousProgress;
}

- (void)setPreviousProgress:(double)a3
{
  self->_previousProgress = a3;
}

- (NTKAlaskanGMTTimezoneLocation)currentSelectedTimezoneLocation
{
  return self->_currentSelectedTimezoneLocation;
}

- (void)setCurrentSelectedTimezoneLocation:(id)a3
{
}

- (NSArray)currentTimezoneLocations
{
  return self->_currentTimezoneLocations;
}

- (void)setCurrentTimezoneLocations:(id)a3
{
}

- (NSSet)currentWorldClockCities
{
  return self->_currentWorldClockCities;
}

- (void)setCurrentWorldClockCities:(id)a3
{
}

- (NSSet)defaultCityIdentifiers
{
  return self->_defaultCityIdentifiers;
}

- (void)setDefaultCityIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultCityIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentWorldClockCities, 0);
  objc_storeStrong((id *)&self->_currentTimezoneLocations, 0);
  objc_storeStrong((id *)&self->_currentSelectedTimezoneLocation, 0);
  objc_storeStrong((id *)&self->_crownInputHandler, 0);
  objc_storeStrong((id *)&self->_transitInfoByCity, 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_destroyWeak((id *)&self->_gmtView);
  objc_destroyWeak((id *)&self->_faceView);

  objc_storeStrong((id *)&self->_storage, 0);
}

@end