@interface APLocationManager
+ (BOOL)canReverseGeocodeLocation:(id)a3;
+ (BOOL)locationEnabledFor:(int)a3;
+ (id)_authorizationChangedBlocks;
+ (id)createReverseGeocoder;
+ (id)sharedInstance;
+ (void)addAuthorizationChangedBlock:(id)a3;
+ (void)removeAuthorizationChangedBlocks;
- (APLocationManager)init;
- (BOOL)isLocationInitialized;
- (BOOL)isLocationUpdating;
- (BOOL)locationEnabled;
- (BOOL)updatingPlacemark;
- (CLLocation)lastPlacemarkLocation;
- (CLLocation)location;
- (CLLocationManager)clLocationManager;
- (CLPlacemark)currentPlacemark;
- (id)locationInfo;
- (id)locationQueue;
- (int)callerStatus;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)setCallerStatus:(int)a3;
- (void)setClLocationManager:(id)a3;
- (void)setCurrentPlacemark:(id)a3;
- (void)setIsLocationInitialized:(BOOL)a3;
- (void)setIsLocationUpdating:(BOOL)a3;
- (void)setLastPlacemarkLocation:(id)a3;
- (void)setLocation:(id)a3;
- (void)setUpdatingPlacemark:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)updatePlacemark;
@end

@implementation APLocationManager

- (void)start
{
  locationQueue = self->_locationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D70B621C;
  block[3] = &unk_1E6A6B6D0;
  block[4] = self;
  dispatch_async(locationQueue, block);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  locationQueue = self->_locationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D70B5FEC;
  v7[3] = &unk_1E6A6B8A0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(locationQueue, v7);
}

- (id)locationInfo
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1D70D07D4;
  v10 = sub_1D70D07E4;
  id v11 = 0;
  locationQueue = self->_locationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1D70B46A4;
  v5[3] = &unk_1E6A6B830;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(locationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)_authorizationChangedBlocks
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (id)qword_1EB7897E0;
  objc_sync_exit(v2);

  return v3;
}

- (APLocationManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)APLocationManager;
  id v2 = [(APLocationManager *)&v9 init];
  id v3 = (APLocationManager *)v2;
  if (v2)
  {
    *(_WORD *)(v2 + 17) = 0;
    *((_DWORD *)v2 + 5) = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ap.locationQueue", 0);
    locationQueue = v3->_locationQueue;
    v3->_locationQueue = (OS_dispatch_queue *)v4;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D70B64C8;
    block[3] = &unk_1E6A6B6D0;
    uint64_t v8 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  return v3;
}

+ (void)addAuthorizationChangedBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    aBlock = v4;
    id v5 = a1;
    objc_sync_enter(v5);
    if (qword_1EB7897E0)
    {
      uint64_t v6 = [(id)qword_1EB7897E0 mutableCopy];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    }
    v7 = (void *)v6;
    uint64_t v8 = _Block_copy(aBlock);
    [v7 addObject:v8];

    uint64_t v9 = [v7 copy];
    v10 = (void *)qword_1EB7897E0;
    qword_1EB7897E0 = v9;

    objc_sync_exit(v5);
    id v4 = aBlock;
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  locationQueue = self->_locationQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D70B6890;
  v8[3] = &unk_1E6A6B8A0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(locationQueue, v8);
}

+ (id)sharedInstance
{
  if (qword_1EB789B10 != -1) {
    dispatch_once(&qword_1EB789B10, &unk_1F2E9CC70);
  }
  id v2 = (void *)qword_1EB789B00;
  return v2;
}

+ (BOOL)locationEnabledFor:(int)a3
{
  return (a3 - 3) < 2;
}

- (BOOL)locationEnabled
{
  uint64_t v2 = [(APLocationManager *)self callerStatus];
  return +[APLocationManager locationEnabledFor:v2];
}

- (int)callerStatus
{
  return self->_callerStatus;
}

- (CLLocationManager)clLocationManager
{
  return self->_clLocationManager;
}

- (void)updatePlacemark
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!self->_updatingPlacemark)
  {
    id v3 = [(APLocationManager *)self location];
    lastPlacemarkLocation = self->_lastPlacemarkLocation;
    if (lastPlacemarkLocation
      && ([(CLLocation *)lastPlacemarkLocation distanceFromLocation:v3],
          double v7 = *MEMORY[0x1E4F1E6F8],
          v6 < *MEMORY[0x1E4F1E6F8]))
    {
      double v16 = v6;
      id v4 = APLogForCategory(0x19uLL);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v17 = objc_opt_class();
        v18 = NSNumber;
        id v19 = v17;
        v20 = [v18 numberWithDouble:v7];
        *(_DWORD *)buf = 138478339;
        id v23 = v17;
        __int16 v24 = 2048;
        v25 = *(NSObject **)&v16;
        __int16 v26 = 2114;
        v27 = v20;
        _os_log_impl(&dword_1D70B2000, v4, OS_LOG_TYPE_INFO, "[%{private}@] Distance traveled (%f meters) is less than %{public}@ meters. No need to update Reverse Geolocation.", buf, 0x20u);
      }
    }
    else
    {
      self->_updatingPlacemark = 1;
      id v4 = [(id)objc_opt_class() createReverseGeocoder];
      int v8 = [(id)objc_opt_class() canReverseGeocodeLocation:v4];
      id v9 = APLogForCategory(0x19uLL);
      v10 = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          id v11 = objc_opt_class();
          v12 = (void *)MEMORY[0x1E4F1CA20];
          id v13 = v11;
          v14 = [v12 localeWithLocaleIdentifier:@"en_US"];
          *(_DWORD *)buf = 138478339;
          id v23 = v11;
          __int16 v24 = 2117;
          v25 = v3;
          __int16 v26 = 2113;
          v27 = v14;
          _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_DEBUG, "[%{private}@ updatePlacemark]: calling reverseGeocodeLocation with parameters:\nlocation = %{sensitive}@\npreferredLocale = %{private}@\nheading = -1\nlocalResultsOnly = NO", buf, 0x20u);
        }
        v10 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = sub_1D70B52E0;
        v21[3] = &unk_1E6A6B858;
        v21[4] = self;
        [v4 reverseGeocodeLocation:v3 preferredLocale:v10 heading:0 localResultsOnly:v21 completionHandler:-1.0];
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        id v23 = (id)objc_opt_class();
        id v15 = v23;
        _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_ERROR, "[%{private}@] Error: localized reverse geolocation is not possible.", buf, 0xCu);
      }
    }
    goto LABEL_13;
  }
  id v3 = APLogForCategory(0x19uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v23 = (id)objc_opt_class();
    id v4 = v23;
    _os_log_impl(&dword_1D70B2000, v3, OS_LOG_TYPE_DEBUG, "[%{private}@] Reverse Geolocation update already in-flight.", buf, 0xCu);
LABEL_13:
  }
}

- (void)setLocation:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setUpdatingPlacemark:(BOOL)a3
{
  self->_updatingPlacemark = a3;
}

- (void)setLastPlacemarkLocation:(id)a3
{
}

- (void)setIsLocationUpdating:(BOOL)a3
{
  self->_isLocationUpdating = a3;
}

- (void)setIsLocationInitialized:(BOOL)a3
{
  self->_isLocationInitialized = a3;
}

- (void)setCurrentPlacemark:(id)a3
{
}

- (void)setClLocationManager:(id)a3
{
}

- (void)setCallerStatus:(int)a3
{
  self->_callerStatus = a3;
}

- (BOOL)isLocationUpdating
{
  return self->_isLocationUpdating;
}

- (BOOL)isLocationInitialized
{
  return self->_isLocationInitialized;
}

- (CLPlacemark)currentPlacemark
{
  return self->_currentPlacemark;
}

+ (id)createReverseGeocoder
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1E5C8]);
  return v2;
}

+ (BOOL)canReverseGeocodeLocation:(id)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (void)stop
{
  locationQueue = self->_locationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D70D0864;
  block[3] = &unk_1E6A6B6D0;
  void block[4] = self;
  dispatch_async(locationQueue, block);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v7 = APLogForCategory(0x19uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ didFailWithError %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)locationQueue
{
  return self->_locationQueue;
}

+ (void)removeAuthorizationChangedBlocks
{
  id obj = a1;
  objc_sync_enter(obj);
  id v2 = (void *)qword_1EB7897E0;
  qword_1EB7897E0 = 0;

  objc_sync_exit(obj);
}

- (BOOL)updatingPlacemark
{
  return self->_updatingPlacemark;
}

- (CLLocation)lastPlacemarkLocation
{
  return self->_lastPlacemarkLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPlacemarkLocation, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_clLocationManager, 0);
  objc_storeStrong((id *)&self->_currentPlacemark, 0);
  objc_storeStrong((id *)&self->_locationQueue, 0);
}

@end