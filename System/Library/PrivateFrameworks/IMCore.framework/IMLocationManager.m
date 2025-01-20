@interface IMLocationManager
+ (Class)__CLInUseAssertionClass;
+ (Class)__CLLocationManagerClass;
+ (id)locationShifter;
+ (id)sharedInstance;
- (BOOL)_shouldSendLocation:(id)a3 timeIntervalSinceStart:(double)a4;
- (BOOL)firstAuthorizationCallbackArrived;
- (BOOL)inRequestPreciseLocation;
- (BOOL)locationAuthorizationDenied;
- (BOOL)locationAuthorizationDetermined;
- (BOOL)preciseLocationAuthorized;
- (CLInUseAssertion)inUseAssertion;
- (CLLocation)currentLocation;
- (CLLocation)location;
- (CLLocationManager)locationManager;
- (IMLocationManager)init;
- (NSDate)locateStartTime;
- (NSError)error;
- (NSMutableArray)handlers;
- (NSTimer)locationUpdateTimer;
- (void)_errorHappend:(id)a3;
- (void)_fireCompletionHandlers;
- (void)_locationManagerTimedOut;
- (void)_locationUpdateTimerFired:(id)a3;
- (void)_startLocationUpdateTimerWithAuthorizedHandler:(id)a3 updateHandler:(id)a4;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setError:(id)a3;
- (void)setFirstAuthorizationCallbackArrived:(BOOL)a3;
- (void)setHandlers:(id)a3;
- (void)setInRequestPreciseLocation:(BOOL)a3;
- (void)setInUseAssertion:(id)a3;
- (void)setLocateStartTime:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationUpdateTimer:(id)a3;
- (void)shiftedLocationWithLocation:(id)a3 completion:(id)a4;
- (void)startUpdatingCurrentLocationWithAuthorizedHandler:(id)a3 updateHandler:(id)a4;
- (void)startUpdatingCurrentLocationWithForegroundAssertionForBundleIdentifier:(id)a3 withAuthorizedHandler:(id)a4 updateHandler:(id)a5;
@end

@implementation IMLocationManager

- (IMLocationManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)IMLocationManager;
  v2 = [(IMLocationManager *)&v18 init];
  if (v2)
  {
    if (qword_1E965EAD0 != -1) {
      dispatch_once(&qword_1E965EAD0, &unk_1EF8E57F8);
    }
    v3 = objc_opt_class();
    v7 = (CLLocationManager *)objc_alloc_init((Class)objc_msgSend___CLLocationManagerClass(v3, v4, v5, v6));
    objc_msgSend_setDelegate_(v7, v8, (uint64_t)v2, v9);
    objc_msgSend_setDesiredAccuracy_(v7, v10, v11, v12, *(double *)&qword_1E965EAC8);
    locationManager = v2->_locationManager;
    v2->_locationManager = v7;
    v14 = v7;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    handlers = v2->_handlers;
    v2->_handlers = v15;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1EB3F24F8 != -1) {
    dispatch_once(&qword_1EB3F24F8, &unk_1EF8E5DB8);
  }
  v2 = (void *)qword_1EB3F2558;

  return v2;
}

- (void)startUpdatingCurrentLocationWithAuthorizedHandler:(id)a3 updateHandler:(id)a4
{
}

- (void)startUpdatingCurrentLocationWithForegroundAssertionForBundleIdentifier:(id)a3 withAuthorizedHandler:(id)a4 updateHandler:(id)a5
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14 = (void (**)(void, void, void))v10;
  if (!v9 || !v10) {
    goto LABEL_40;
  }
  if (objc_msgSend_length(v8, v11, v12, v13))
  {
    if (IMOSLoggingEnabled())
    {
      objc_super v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v8;
        _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "IMLocationManager taking CLInUseAssertion for %@", buf, 0xCu);
      }
    }
    v19 = objc_opt_class();
    v23 = objc_msgSend___CLInUseAssertionClass(v19, v20, v21, v22);
    v26 = objc_msgSend_stringWithFormat_(NSString, v24, @"Treating %@ as a foreground process for location sending.", v25, v8);
    v28 = objc_msgSend_newAssertionForBundleIdentifier_withReason_level_(v23, v27, (uint64_t)v8, (uint64_t)v26, 1);

    objc_msgSend_setInUseAssertion_(self, v29, (uint64_t)v28, v30);
  }
  v31 = objc_msgSend_locationManager(self, v15, v16, v17);
  int v35 = objc_msgSend_authorizationStatus(v31, v32, v33, v34);

  if (v35)
  {
    int v36 = IMOSLoggingEnabled();
    if ((v35 - 3) >= 2)
    {
      if (v36)
      {
        v108 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4AF7000, v108, OS_LOG_TYPE_INFO, "IMLocationManager denied when in use location authorization", buf, 2u);
        }
      }
      id v109 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v112 = objc_msgSend_initWithObjectsAndKeys_(v109, v110, @"IMLocationManager does not have location access", v111, *MEMORY[0x1E4F28568], 0);
      id v113 = objc_alloc(MEMORY[0x1E4F28C58]);
      v115 = objc_msgSend_initWithDomain_code_userInfo_(v113, v114, *MEMORY[0x1E4F6C158], 42, v112);
      ((void (**)(void, void, void *))v14)[2](v14, 0, v115);
    }
    else
    {
      if (v36)
      {
        v40 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v44 = objc_msgSend_locationManager(self, v41, v42, v43);
          int v48 = objc_msgSend__limitsPrecision(v44, v45, v46, v47);
          v49 = @"NO";
          if (v48) {
            v49 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v49;
          _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "Starting with _limitsPrecision %@", buf, 0xCu);
        }
      }
      v50 = objc_msgSend_locationUpdateTimer(self, v37, v38, v39);
      BOOL v51 = v50 == 0;

      if (!v51)
      {
        v55 = objc_msgSend_locationUpdateTimer(self, v52, v53, v54);
        objc_msgSend_invalidate(v55, v56, v57, v58);

        objc_msgSend_setLocationUpdateTimer_(self, v59, 0, v60);
      }
      if (!objc_msgSend_firstAuthorizationCallbackArrived(self, v52, v53, v54))
      {
        id v82 = (id)objc_msgSend_copy(v9, v61, v62, v63);

        id v81 = (id)objc_msgSend_copy(v14, v116, v117, v118);
        v122 = objc_msgSend_handlers(self, v119, v120, v121);
        v123 = _Block_copy(v82);
        v134[0] = v123;
        v124 = _Block_copy(v81);
        v134[1] = v124;
        v126 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v125, (uint64_t)v134, 2);
        objc_msgSend_addObject_(v122, v127, (uint64_t)v126, v128);

        goto LABEL_41;
      }
      v64 = objc_msgSend_locationManager(self, v61, v62, v63);
      if (objc_msgSend__limitsPrecision(v64, v65, v66, v67))
      {
        char v71 = objc_msgSend_inRequestPreciseLocation(self, v68, v69, v70);

        if ((v71 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            v76 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A4AF7000, v76, OS_LOG_TYPE_INFO, "Requesting temporary full precision.", buf, 2u);
            }
          }
          objc_msgSend_setInRequestPreciseLocation_(self, v74, 1, v75);
          *(void *)buf = 0;
          objc_initWeak((id *)buf, self);
          v80 = objc_msgSend_locationManager(self, v77, v78, v79);
          v130[0] = MEMORY[0x1E4F143A8];
          v130[1] = 3221225472;
          v130[2] = sub_1A4C4D2AC;
          v130[3] = &unk_1E5B7EE08;
          objc_copyWeak(&v133, (id *)buf);
          id v81 = v14;
          id v131 = v81;
          id v82 = v9;
          id v132 = v82;
          objc_msgSend_requestTemporaryFullAccuracyAuthorizationWithPurposeKey_completion_(v80, v83, @"SendLocationDescription", (uint64_t)v130);

          objc_destroyWeak(&v133);
          objc_destroyWeak((id *)buf);
          goto LABEL_41;
        }
      }
      else
      {
      }
      objc_msgSend_setInRequestPreciseLocation_(self, v72, 0, v73);
      objc_msgSend__startLocationUpdateTimerWithAuthorizedHandler_updateHandler_(self, v129, (uint64_t)v9, (uint64_t)v14);
    }
LABEL_40:
    id v81 = v14;
    id v82 = v9;
    goto LABEL_41;
  }
  if (IMOSLoggingEnabled())
  {
    v87 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v87, OS_LOG_TYPE_INFO, "IMLocationManager location authorization not determined, requesting when in use authorization", buf, 2u);
    }
  }
  v88 = objc_msgSend_locationManager(self, v84, v85, v86);
  objc_msgSend_requestWhenInUseAuthorization(v88, v89, v90, v91);

  id v82 = (id)objc_msgSend_copy(v9, v92, v93, v94);
  id v81 = (id)objc_msgSend_copy(v14, v95, v96, v97);

  v101 = objc_msgSend_handlers(self, v98, v99, v100);
  v102 = _Block_copy(v82);
  v135[0] = v102;
  v103 = _Block_copy(v81);
  v135[1] = v103;
  v105 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v104, (uint64_t)v135, 2);
  objc_msgSend_addObject_(v101, v106, (uint64_t)v105, v107);

LABEL_41:
}

- (void)_startLocationUpdateTimerWithAuthorizedHandler:(id)a3 updateHandler:(id)a4
{
  v56[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (*)(void))*((void *)a3 + 2);
  id v7 = a4;
  id v8 = a3;
  v6();
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);

  uint64_t v16 = objc_msgSend_copy(v7, v13, v14, v15);
  uint64_t v20 = objc_msgSend_handlers(self, v17, v18, v19);
  uint64_t v21 = _Block_copy(v12);
  v56[0] = v21;
  uint64_t v22 = _Block_copy(v16);
  v56[1] = v22;
  v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v23, (uint64_t)v56, 2);
  objc_msgSend_addObject_((void *)v20, v25, (uint64_t)v24, v26);

  uint64_t v30 = objc_msgSend_locationUpdateTimer(self, v27, v28, v29);
  LOBYTE(v20) = v30 == 0;

  if ((v20 & 1) == 0)
  {
    uint64_t v34 = objc_msgSend_locationUpdateTimer(self, v31, v32, v33);
    objc_msgSend_invalidate(v34, v35, v36, v37);

    objc_msgSend_setLocationUpdateTimer_(self, v38, 0, v39);
  }
  v40 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v31, v32, v33);
  objc_msgSend_setLocateStartTime_(self, v41, (uint64_t)v40, v42);

  v44 = objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x1E4F1CB00], v43, (uint64_t)self, (uint64_t)sel__locationUpdateTimerFired_, 0, 1, 1.0);
  objc_msgSend_setLocationUpdateTimer_(self, v45, (uint64_t)v44, v46);
  v50 = objc_msgSend_locationManager(self, v47, v48, v49);
  objc_msgSend_startUpdatingLocation(v50, v51, v52, v53);

  if (IMOSLoggingEnabled())
  {
    uint64_t v54 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v55 = 0;
      _os_log_impl(&dword_1A4AF7000, v54, OS_LOG_TYPE_INFO, "Started location update", v55, 2u);
    }
  }
}

- (BOOL)locationAuthorizationDetermined
{
  v4 = objc_msgSend_locationManager(self, a2, v2, v3);
  int v8 = objc_msgSend_authorizationStatus(v4, v5, v6, v7);

  return v8 != 0;
}

- (BOOL)locationAuthorizationDenied
{
  v4 = objc_msgSend_locationManager(self, a2, v2, v3);
  int v8 = objc_msgSend_authorizationStatus(v4, v5, v6, v7);

  return (v8 - 1) < 2;
}

- (BOOL)preciseLocationAuthorized
{
  v4 = objc_msgSend_locationManager(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_accuracyAuthorization(v4, v5, v6, v7) == 0;

  return v8;
}

- (CLLocation)currentLocation
{
  v4 = objc_msgSend_locationManager(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_location(v4, v5, v6, v7);

  return (CLLocation *)v8;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_lastObject(v7, v8, v9, v10);
  if (v11)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Location manager got updated location", v17, 2u);
      }
    }
    objc_msgSend_setLocation_(self, v12, (uint64_t)v11, v13);
    objc_msgSend_setError_(self, v15, 0, v16);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_code(v7, v8, v9, v10))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v7;
        _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Location manager failed with error %@", (uint8_t *)&v14, 0xCu);
      }
    }
    objc_msgSend__errorHappend_(self, v11, (uint64_t)v7, v12);
  }
}

- (void)_errorHappend:(id)a3
{
  id v4 = a3;
  objc_msgSend_setLocation_(self, v5, 0, v6);
  objc_msgSend_setError_(self, v7, (uint64_t)v4, v8);

  objc_msgSend__fireCompletionHandlers(self, v9, v10, v11);
  objc_msgSend_locationManager(self, v12, v13, v14);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopUpdatingLocation(v18, v15, v16, v17);
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v13 = objc_msgSend__limitsPrecision(v6, v10, v11, v12);
      uint64_t v14 = @"NO";
      if (v13) {
        uint64_t v14 = @"YES";
      }
      *(_DWORD *)buf = 67109378;
      int v57 = a4;
      __int16 v58 = 2112;
      v59 = v14;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "authorization status did change %u, received Coarse Location %@", buf, 0x12u);
    }
  }
  objc_msgSend_setFirstAuthorizationCallbackArrived_(self, v7, 1, v8);
  id v18 = objc_msgSend_handlers(self, v15, v16, v17);
  BOOL v22 = objc_msgSend_count(v18, v19, v20, v21) == 0;

  if (!v22)
  {
    if ((a4 - 3) > 1)
    {
      if ((a4 - 1) <= 1) {
        objc_msgSend__locationManagerTimedOut(self, v23, v24, v25);
      }
    }
    else
    {
      uint64_t v26 = objc_msgSend_handlers(self, v23, v24, v25);
      uint64_t v30 = objc_msgSend_copy(v26, v27, v28, v29);

      uint64_t v34 = objc_msgSend_handlers(self, v31, v32, v33);
      objc_msgSend_removeAllObjects(v34, v35, v36, v37);

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v38 = v30;
      uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v51, (uint64_t)v55, 16);
      if (v42)
      {
        uint64_t v43 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v52 != v43) {
              objc_enumerationMutation(v38);
            }
            v45 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            uint64_t v46 = objc_msgSend_objectAtIndexedSubscript_(v45, v40, 0, v41, (void)v51);
            uint64_t v49 = objc_msgSend_objectAtIndexedSubscript_(v45, v47, 1, v48);
            objc_msgSend_startUpdatingCurrentLocationWithAuthorizedHandler_updateHandler_(self, v50, (uint64_t)v46, (uint64_t)v49);
          }
          uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v40, (uint64_t)&v51, (uint64_t)v55, 16);
        }
        while (v42);
      }
    }
  }
}

- (BOOL)_shouldSendLocation:(id)a3 timeIntervalSinceStart:(double)a4
{
  id v5 = a3;
  objc_msgSend_horizontalAccuracy(v5, v6, v7, v8);
  if (a4 <= 0.0) {
    double v13 = 15.0;
  }
  else {
    double v13 = a4;
  }
  if (v5)
  {
    BOOL v14 = v12 < 25.0 || v12 < 200.0 && v12 < v13 / 15.0 * 175.0 + 25.0;
    uint64_t v16 = objc_msgSend_timestamp(v5, v9, v10, v11);
    objc_msgSend_timeIntervalSinceNow(v16, v17, v18, v19);
    double v21 = v20;

    BOOL v22 = v21 >= 0.0;
    if (-v21 - v13 <= 300.0) {
      BOOL v22 = 1;
    }
    BOOL v15 = v22 && v14;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)_locationUpdateTimerFired:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_locationManager(self, v5, v6, v7);
  double v12 = objc_msgSend_location(self, v9, v10, v11);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v13, v14, v15);
  double v17 = v16;
  double v21 = objc_msgSend_locateStartTime(self, v18, v19, v20);
  objc_msgSend_timeIntervalSinceReferenceDate(v21, v22, v23, v24);
  double v26 = v17 - v25;

  if (objc_msgSend__shouldSendLocation_timeIntervalSinceStart_(self, v27, (uint64_t)v12, v28, v26))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v32, OS_LOG_TYPE_INFO, "Location update timer fired, got location with desired accuracy", buf, 2u);
      }
    }
    objc_msgSend__fireCompletionHandlers(self, v29, v30, v31);
    objc_msgSend_stopUpdatingLocation(v8, v33, v34, v35);
  }
  else
  {
    int v36 = IMOSLoggingEnabled();
    if (v26 >= 15.0)
    {
      if (v36)
      {
        uint64_t v41 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v43 = 0;
          _os_log_impl(&dword_1A4AF7000, v41, OS_LOG_TYPE_INFO, "Location update timer fired, did not get desired accuracy before timeout. Firing completion handlers", v43, 2u);
        }
      }
      objc_msgSend__locationManagerTimedOut(self, v37, v38, v39);
    }
    else if (v36)
    {
      v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v42 = 0;
        _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "Location update timer fired, desired accuracy not obtained but we have time left", v42, 2u);
      }
    }
  }
}

- (void)_locationManagerTimedOut
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int v5 = objc_msgSend_locationAuthorizationDenied(self, a2, v2, v3);
  uint64_t v6 = @"IMLocationManager Timed Out";
  if (v5) {
    uint64_t v6 = @"IMLocationManager does not have location authorization";
  }
  uint64_t v7 = v6;
  if (objc_msgSend_locationAuthorizationDenied(self, v8, v9, v10)) {
    uint64_t v11 = 42;
  }
  else {
    uint64_t v11 = 41;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v15 = objc_msgSend_initWithObjectsAndKeys_(v12, v13, (uint64_t)v7, v14, *MEMORY[0x1E4F28568], 0);
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v18 = objc_msgSend_initWithDomain_code_userInfo_(v16, v17, *MEMORY[0x1E4F6C158], v11, v15);
  objc_msgSend_setLocation_(self, v19, 0, v20);
  objc_msgSend_setError_(self, v21, (uint64_t)v18, v22);
  if (IMOSLoggingEnabled())
  {
    double v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = v7;
      _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, "Location manager timed out. Reason: %@", buf, 0xCu);
    }
  }
  objc_msgSend__fireCompletionHandlers(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_locationManager(self, v27, v28, v29);
  objc_msgSend_stopUpdatingLocation(v30, v31, v32, v33);
}

- (void)_fireCompletionHandlers
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = objc_msgSend_location(self, v7, v8, v9);
      uint64_t v14 = objc_msgSend_error(self, v11, v12, v13);
      uint64_t v15 = (void *)v14;
      id v16 = @"YES";
      if (!v10) {
        id v16 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      v64 = v16;
      __int16 v65 = 2112;
      uint64_t v66 = v14;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Location manager firing completion handlers. Has valid location %@ error %@", buf, 0x16u);
    }
  }
  double v17 = objc_msgSend_inUseAssertion(self, v3, v4, v5);

  if (v17)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "Invalidating CLInUseAssertion.", buf, 2u);
      }
    }
    uint64_t v25 = objc_msgSend_inUseAssertion(self, v21, v22, v23);
    objc_msgSend_invalidate(v25, v26, v27, v28);

    objc_msgSend_setInUseAssertion_(self, v29, 0, v30);
  }
  uint64_t v31 = objc_msgSend_location(self, v18, v19, v20);
  if (v31)
  {
  }
  else
  {
    uint64_t v38 = objc_msgSend_error(self, v32, v33, v34);
    BOOL v39 = v38 == 0;

    if (v39) {
      return;
    }
  }
  v40 = objc_msgSend_locationUpdateTimer(self, v35, v36, v37);
  BOOL v41 = v40 == 0;

  if (!v41)
  {
    v45 = objc_msgSend_locationUpdateTimer(self, v42, v43, v44);
    objc_msgSend_invalidate(v45, v46, v47, v48);

    objc_msgSend_setLocationUpdateTimer_(self, v49, 0, v50);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A4C4E624;
  aBlock[3] = &unk_1E5B7EE30;
  aBlock[4] = self;
  long long v51 = (void (**)(void *, void))_Block_copy(aBlock);
  v55 = objc_msgSend_location(self, v52, v53, v54);
  BOOL v56 = v55 == 0;

  if (v56)
  {
    v51[2](v51, 0);
  }
  else
  {
    uint64_t v60 = objc_msgSend_location(self, v57, v58, v59);
    objc_msgSend_shiftedLocationWithLocation_completion_(self, v61, (uint64_t)v60, (uint64_t)v51);
  }
}

+ (id)locationShifter
{
  if (qword_1E965EAE0 != -1) {
    dispatch_once(&qword_1E965EAE0, &unk_1EF8E6098);
  }
  uint64_t v2 = (void *)qword_1E965EAD8;

  return v2;
}

- (void)shiftedLocationWithLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  uint64_t v12 = objc_msgSend_locationShifter(v8, v9, v10, v11);
  if (!v12) {
    goto LABEL_4;
  }
  uint64_t v13 = (void *)v12;
  uint64_t v14 = objc_opt_class();
  uint64_t v18 = objc_msgSend_locationShifter(v14, v15, v16, v17);
  uint64_t v19 = objc_opt_class();
  int isLocationShiftRequiredForLocation = objc_msgSend_isLocationShiftRequiredForLocation_(v19, v20, (uint64_t)v6, v21);

  if (isLocationShiftRequiredForLocation)
  {
    uint64_t v23 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A4C4E984;
    block[3] = &unk_1E5B7B180;
    block[4] = self;
    id v25 = v6;
    id v26 = v7;
    dispatch_async(v23, block);
  }
  else
  {
LABEL_4:
    (*((void (**)(id, id))v7 + 2))(v7, v6);
  }
}

+ (Class)__CLLocationManagerClass
{
  if (qword_1E965EAF0 != -1) {
    dispatch_once(&qword_1E965EAF0, &unk_1EF8E5978);
  }
  uint64_t v2 = (void *)qword_1E965EAE8;

  return (Class)v2;
}

+ (Class)__CLInUseAssertionClass
{
  if (qword_1E965EB00 != -1) {
    dispatch_once(&qword_1E965EB00, &unk_1EF8E3B50);
  }
  uint64_t v2 = (void *)qword_1E965EAF8;

  return (Class)v2;
}

- (NSMutableArray)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSDate)locateStartTime
{
  return self->_locateStartTime;
}

- (void)setLocateStartTime:(id)a3
{
}

- (NSTimer)locationUpdateTimer
{
  return self->_locationUpdateTimer;
}

- (void)setLocationUpdateTimer:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (BOOL)inRequestPreciseLocation
{
  return self->_inRequestPreciseLocation;
}

- (void)setInRequestPreciseLocation:(BOOL)a3
{
  self->_inRequestPreciseLocation = a3;
}

- (BOOL)firstAuthorizationCallbackArrived
{
  return self->_firstAuthorizationCallbackArrived;
}

- (void)setFirstAuthorizationCallbackArrived:(BOOL)a3
{
  self->_firstAuthorizationCallbackArrived = a3;
}

- (CLInUseAssertion)inUseAssertion
{
  return self->_inUseAssertion;
}

- (void)setInUseAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_locationUpdateTimer, 0);
  objc_storeStrong((id *)&self->_locateStartTime, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_handlers, 0);
}

@end