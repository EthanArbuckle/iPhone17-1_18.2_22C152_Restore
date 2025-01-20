@interface GEOLocationShifter
- (void)navdShiftLocation:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation GEOLocationShifter

- (void)navdShiftLocation:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void, double, double, double))a4;
  id v8 = [objc_alloc((Class)GEOLocation) initWithCLLocation:v6];
  v9 = [v8 latLng];
  [v9 coordinate];
  double v11 = v10;
  double v13 = v12;
  unsigned int v14 = +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:");
  v15 = GEOFindOrCreateLog();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (!v14)
  {
    if (v16)
    {
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Location shifting is disabled. Sending the original location coordinate back", v24, 2u);
    }

    goto LABEL_12;
  }
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Location shifting is enabled", buf, 2u);
  }

  uint64_t v17 = [v6 matchInfo];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [v6 matchInfo];
    unsigned __int8 v20 = [v19 isMatchShifted];

    if (v20)
    {
      v21 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Location shifting is enabled. Location already shifted. Sending back the original location coordinate.", v25, 2u);
      }

LABEL_12:
      [v6 horizontalAccuracy];
      v7[2](v7, v11, v13, v22);
      goto LABEL_16;
    }
  }
  v23 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Location shifting is enabled. Performing the shift.", v26, 2u);
  }

  [v6 horizontalAccuracy];
  -[GEOLocationShifter shiftLatLng:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](self, "shiftLatLng:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v9, v7, 0, 0, &_dispatch_main_q);
LABEL_16:
}

@end