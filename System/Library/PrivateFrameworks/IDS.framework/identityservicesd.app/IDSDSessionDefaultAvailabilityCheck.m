@interface IDSDSessionDefaultAvailabilityCheck
- (IMNetworkAvailability)availability;
- (int64_t)networkCheckOverrideBehavior;
- (void)availabilityTimerCancel;
- (void)checkLocalConnectivityForSession:(id)a3 withCompletionBlock:(id)a4;
- (void)checkNetworkAvailabilityForSession:(id)a3 completionBlock:(id)a4;
- (void)setAvailability:(id)a3;
@end

@implementation IDSDSessionDefaultAvailabilityCheck

- (int64_t)networkCheckOverrideBehavior
{
  v2 = +[IMUserDefaults fixedInterface];
  if (v2)
  {
    v3 = +[IMUserDefaults fixedInterfaceDestination];
    int64_t v4 = v3 != 0;
  }
  else
  {
    int64_t v4 = 0;
  }

  int64_t result = +[IMUserDefaults sessionNetworkAvailabilityCheckOverrideBehavior];
  if (!result) {
    return v4;
  }
  return result;
}

- (void)checkNetworkAvailabilityForSession:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, BOOL))a4;
  v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 uniqueID];
    *(_DWORD *)buf = 138412290;
    double v47 = *(double *)&v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting outgoing network availability check for session %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v37 = [v6 uniqueID];
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        v37 = objc_msgSend(v6, "uniqueID", v37);
        _IDSLogV();
      }
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003366DC;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  if (qword_100A4C790 != -1) {
    dispatch_once(&qword_100A4C790, block);
  }
  if (qword_100A4C788)
  {
    v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v6 uniqueID];
      *(_DWORD *)buf = 138412546;
      double v47 = *(double *)&v11;
      __int16 v48 = 2048;
      uint64_t v49 = qword_100A4C788;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Overriding network availability check result! { session: %@, overrideBehavior: %ld }", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v38 = [v6 uniqueID];
        uint64_t v42 = qword_100A4C788;
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          v39 = objc_msgSend(v6, "uniqueID", v38, v42);
          _IDSLogV();
        }
      }
    }
    v7[2](v7, qword_100A4C788 != 2);
  }
  else if (([v6 isInitiator] & 1) != 0 {
         || ![v6 isWithDefaultPairedDevice])
  }
  {
    if (objc_msgSend(v6, "isInitiator", v37)) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = 5;
    }
    if ([v6 disallowWifiInterface])
    {
      uint64_t v15 = 0;
    }
    else
    {
      v16 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Network availability check: including WiFi availability", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
      if ([v6 clientType] == (id)4)
      {
        v17 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Network availability check: allowing WiFi hotspot", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport();
            if (_IDSShouldLog()) {
              _IDSLogV();
            }
          }
        }
        v14 |= 0x10uLL;
      }
      uint64_t v15 = 1;
    }
    if ([v6 enableQuickRelay]
      && ([v6 disallowCellularInterface] & 1) == 0)
    {
      v18 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Network availability check: including cellular availability", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
      v15 |= 2uLL;
    }
    else if ([v6 isInitiator] {
           && ([v6 clientType] == (id)1
    }
            || [v6 clientType] == (id)5
            || [v6 clientType] == (id)6))
    {
      v14 |= 2uLL;
    }
    unsigned int v19 = [v6 isInitiator];
    if (v19) {
      double v20 = 60.0;
    }
    else {
      double v20 = 30.0;
    }
    double v21 = 15.0;
    if (v19) {
      double v21 = 30.0;
    }
    double v22 = 2.0;
    if (v19) {
      double v22 = 7.0;
    }
    if ((v15 & 2) != 0) {
      double v23 = v22;
    }
    else {
      double v23 = v21;
    }
    v24 = +[IMSystemMonitor sharedInstance];
    unsigned int v25 = [v24 isScreenLit];

    if (v25)
    {
      id v26 = objc_alloc_init((Class)NSDate);
      v27 = +[IMSystemMonitor sharedInstance];
      v28 = [v27 dateScreenLightLastChanged];

      [v26 timeIntervalSinceDate:v28];
      double v30 = v29;
      v31 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v47 = v30;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Time since lights on: %f", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
      double v32 = v23 - v30;
      if (v30 >= v23) {
        double v32 = 0.0;
      }
      if (v30 > 0.0) {
        double v23 = v32;
      }
    }
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100336700;
    v43[3] = &unk_1009893E0;
    v43[4] = self;
    v44 = v7;
    v33 = objc_retainBlock(v43);
    v34 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218752;
      double v47 = v20;
      __int16 v48 = 2048;
      uint64_t v49 = *(void *)&v23;
      __int16 v50 = 2048;
      uint64_t v51 = v15;
      __int16 v52 = 2048;
      uint64_t v53 = v14;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Starting availability check with network timeout: %fs   wifi timeout: %fs   flags: %lu   options: %lu", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    id v35 = [objc_alloc((Class)IMNetworkAvailability) initWithFlags:v15 options:v14 timeout:v33 wifiTimeout:v20 completionBlock:v23];
    [(IDSDSessionDefaultAvailabilityCheck *)self setAvailability:v35];

    v36 = [(IDSDSessionDefaultAvailabilityCheck *)self availability];
    [v36 start];
  }
  else
  {
    v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v6 uniqueID];
      *(_DWORD *)buf = 138412290;
      double v47 = *(double *)&v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Bypassing network availability check for incoming session from default paired device { session: %@ }", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v40 = [v6 uniqueID];
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          v41 = objc_msgSend(v6, "uniqueID", v40);
          _IDSLogV();
        }
      }
    }
    v7[2](v7, 1);
  }
}

- (void)availabilityTimerCancel
{
  v3 = [(IDSDSessionDefaultAvailabilityCheck *)self availability];
  [v3 cancel];

  [(IDSDSessionDefaultAvailabilityCheck *)self setAvailability:0];
}

- (void)checkLocalConnectivityForSession:(id)a3 withCompletionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isScreenSharingSession] & 1) == 0
    && ![v5 isWithDefaultPairedDevice])
  {
    if (![v5 enableQuickRelay])
    {
      v8 = +[IDSUTunController sharedInstance];
      v9 = [v5 uniqueID];
      v10 = [v5 participantID];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1003369AC;
      v11[3] = &unk_100989430;
      id v12 = v5;
      id v13 = v6;
      [v8 createConnectionDataForDevice:v9 localPartyID:v10 dataReadyHandler:v11];

      goto LABEL_4;
    }
    v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "QuickRelay is enabled, skip connection check.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
  (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1, 0);
LABEL_4:
}

- (IMNetworkAvailability)availability
{
  return self->_availability;
}

- (void)setAvailability:(id)a3
{
}

- (void).cxx_destruct
{
}

@end