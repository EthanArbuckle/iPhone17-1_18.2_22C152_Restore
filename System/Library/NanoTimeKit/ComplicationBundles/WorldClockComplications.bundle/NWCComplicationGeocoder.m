@interface NWCComplicationGeocoder
+ (NWCComplicationGeocoder)sharedGeocoder;
- (NWCComplicationGeocoder)init;
- (id)cachedPlacemarkForLocation:(id)a3;
- (void)_handlePlacemarks:(id)a3 fromLocation:(id)a4 error:(id)a5;
- (void)placemarkForLocation:(id)a3 handler:(id)a4;
@end

@implementation NWCComplicationGeocoder

+ (NWCComplicationGeocoder)sharedGeocoder
{
  if (qword_268BA3C58 != -1) {
    dispatch_once(&qword_268BA3C58, &unk_26EFF5918);
  }
  v2 = (void *)qword_268BA3C50;

  return (NWCComplicationGeocoder *)v2;
}

- (NWCComplicationGeocoder)init
{
  v8.receiver = self;
  v8.super_class = (Class)NWCComplicationGeocoder;
  v2 = [(NWCComplicationGeocoder *)&v8 init];
  if (v2)
  {
    v3 = (CLGeocoder *)objc_alloc_init(MEMORY[0x263F00A40]);
    geocoder = v2->_geocoder;
    v2->_geocoder = v3;

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableArray *)v5;
  }
  return v2;
}

- (id)cachedPlacemarkForLocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_cachedLocation && self->_cachedPlacemark && objc_msgSend(v4, "isEqual:")) {
    v6 = self->_cachedPlacemark;
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (void)placemarkForLocation:(id)a3 handler:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = [(NWCComplicationGeocoder *)self cachedPlacemarkForLocation:v7];
  if (v9)
  {
    v10 = NTALogForCategory(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v7;
      __int16 v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_23C352000, v10, OS_LOG_TYPE_DEFAULT, "Hitting cached placemark for location: %@ %@", buf, 0x16u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23C359244;
    block[3] = &unk_264E3D960;
    id v26 = v8;
    id v25 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else if ([(CLLocation *)self->_cachedLocation isEqual:v7])
  {
    v11 = NTALogForCategory(6uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v7;
      _os_log_impl(&dword_23C352000, v11, OS_LOG_TYPE_DEFAULT, "Requesting the placemark for the same location. %@", buf, 0xCu);
    }

    handlers = self->_handlers;
    v13 = (void *)[v8 copy];
    v14 = (void *)MEMORY[0x23ECE2850]();
    [(NSMutableArray *)handlers addObject:v14];
  }
  else
  {
    if ([(CLGeocoder *)self->_geocoder isGeocoding])
    {
      v15 = NTALogForCategory(6uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v7;
        _os_log_impl(&dword_23C352000, v15, OS_LOG_TYPE_DEFAULT, "Canceling the previous geocode request. %@", buf, 0xCu);
      }

      [(CLGeocoder *)self->_geocoder cancelGeocode];
    }
    objc_storeStrong((id *)&self->_cachedLocation, a3);
    [(NSMutableArray *)self->_handlers removeAllObjects];
    v16 = self->_handlers;
    v17 = (void *)[v8 copy];
    v18 = (void *)MEMORY[0x23ECE2850]();
    [(NSMutableArray *)v16 addObject:v18];

    v19 = NTALogForCategory(6uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v7;
      _os_log_impl(&dword_23C352000, v19, OS_LOG_TYPE_DEFAULT, "Sending geocode request for location %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    geocoder = self->_geocoder;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_23C35925C;
    v21[3] = &unk_264E3D988;
    objc_copyWeak(&v23, (id *)buf);
    id v22 = v7;
    [(CLGeocoder *)geocoder reverseGeocodeLocation:v22 completionHandler:v21];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_handlePlacemarks:(id)a3 fromLocation:(id)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 code] != 10)
  {
    if (v10)
    {
      v12 = NTALogForCategory(6uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v9;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_impl(&dword_23C352000, v12, OS_LOG_TYPE_DEFAULT, "Reverse geocide with error: %@ %@.", buf, 0x16u);
      }
      v13 = 0;
    }
    else
    {
      v13 = [v8 firstObject];
      if (!v13) {
        goto LABEL_9;
      }
      objc_storeStrong((id *)&self->_cachedPlacemark, v13);
      v12 = NTALogForCategory(6uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v9;
        __int16 v22 = 2112;
        id v23 = v13;
        _os_log_impl(&dword_23C352000, v12, OS_LOG_TYPE_DEFAULT, "Updated the cached placemark for location %@-%@.", buf, 0x16u);
      }
    }

LABEL_9:
    v14 = (void *)[(NSMutableArray *)self->_handlers copy];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23C359560;
    block[3] = &unk_264E3D9B0;
    id v17 = v14;
    id v18 = v13;
    id v19 = v10;
    id v15 = v13;
    v11 = v14;
    dispatch_async(MEMORY[0x263EF83A0], block);
    [(NSMutableArray *)self->_handlers removeAllObjects];

    goto LABEL_10;
  }
  v11 = NTALogForCategory(6uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v9;
    _os_log_impl(&dword_23C352000, v11, OS_LOG_TYPE_DEFAULT, "Reverse geocode request is cancelled. %@", buf, 0xCu);
  }
LABEL_10:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_locationInUseAssertion, 0);
  objc_storeStrong((id *)&self->_cachedPlacemark, 0);
  objc_storeStrong((id *)&self->_cachedLocation, 0);

  objc_storeStrong((id *)&self->_geocoder, 0);
}

@end