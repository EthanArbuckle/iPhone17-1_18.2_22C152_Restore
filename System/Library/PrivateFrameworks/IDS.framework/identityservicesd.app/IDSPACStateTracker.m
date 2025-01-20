@interface IDSPACStateTracker
+ (id)sharedInstance;
- (id)_pacRemovalReasonToString:(int64_t)a3;
- (id)_simTypeString:(unint64_t)a3;
- (id)fetchCurrentPACState;
- (id)underlyingErrorForPACState:(id)a3;
- (void)noteAuthenticationFinished;
- (void)noteAuthenticationStarted;
- (void)notePNRError:(int64_t)a3;
- (void)notePNRSuccess;
- (void)notePhoneAuthCertGained;
- (void)notePhoneAuthCertLost:(int64_t)a3;
@end

@implementation IDSPACStateTracker

+ (id)sharedInstance
{
  if (qword_100A4A808 != -1) {
    dispatch_once(&qword_100A4A808, &stru_100983B80);
  }
  if (qword_100A4A810 != -1) {
    dispatch_once(&qword_100A4A810, &stru_100983BA0);
  }
  if (qword_100A4A818 != -1) {
    dispatch_once(&qword_100A4A818, &stru_100983BC0);
  }
  v2 = (void *)qword_100A4A820;

  return v2;
}

- (id)fetchCurrentPACState
{
  v2 = +[IMRGLog sms];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Fetching PAC state", buf, 2u);
  }

  v3 = objc_alloc_init(IDSPACState);
  v4 = &IDSRegistrationPropertySupportsAVLess_ptr;
  v5 = +[IDSCTAdapter sharedInstance];
  -[IDSPACState setIsAnySIMInserted:](v3, "setIsAnySIMInserted:", [v5 isAnySIMInserted]);

  v6 = +[IDSCTAdapter sharedInstance];
  -[IDSPACState setIsAnySIMUsable:](v3, "setIsAnySIMUsable:", [v6 isAnySIMUsable]);

  v7 = +[IDSCTAdapter sharedInstance];
  -[IDSPACState setIsDualSIM:](v3, "setIsDualSIM:", [v7 hasMultipleSIMs]);

  v8 = +[IDSCTAdapter sharedInstance];
  id v50 = 0;
  v9 = [v8 currentSIMsWithError:&v50];
  v10 = (IDSPACState *)v50;

  if (v10)
  {
    v11 = +[IMRGLog sms];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Error while attempting to fetch state of SIMs for PAC state: %@", buf, 0xCu);
    }

    v12 = v3;
  }
  else
  {
    v13 = +[IDSDaemon sharedInstance];
    v14 = [v13 registrationConductor];
    v43 = [v14 userStore];

    v15 = +[IMRGLog sms];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (IDSPACState *)[v9 count];
      *(_DWORD *)buf = 134217984;
      v52 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Fetching state of %lu sim(s)", buf, 0xCu);
    }

    -[IDSPACState setSimCount:](v3, "setSimCount:", [v9 count]);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v38 = v9;
    id obj = v9;
    id v44 = [obj countByEnumeratingWithState:&v46 objects:v61 count:16];
    if (v44)
    {
      uint64_t v42 = *(void *)v47;
      v39 = v3;
      do
      {
        for (i = 0; i != v44; i = (char *)i + 1)
        {
          if (*(void *)v47 != v42) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v19 = [v4[256] sharedInstance];
          v20 = [v19 CTPNRForSIM:v18];

          unsigned int v21 = [v20 isPNRSupported];
          if (v21) {
            [(IDSPACState *)v3 setIsAnySIMPNRCapable:1];
          }
          unsigned int v45 = [v20 isSIMReady];
          if (v45) {
            [(IDSPACState *)v3 setIsAnySIMPNRReady:1];
          }
          v22 = [v18 SIMIdentifier];
          v23 = [v43 userWithUniqueIdentifier:v22];

          v24 = +[IDSSMSRegistrationCenter sharedInstance];
          v25 = [v24 stateMachineByUserID];

          v26 = [v23 uniqueIdentifier];
          v27 = [v25 objectForKeyedSubscript:v26];

          if (v27 && [v27 status])
          {
            [(IDSPACState *)v3 setIsAnyPNRInFlight:1];
            CFStringRef v28 = @"YES";
          }
          else
          {
            CFStringRef v28 = @"NO";
          }
          v29 = +[IMRGLog sms];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = [v18 SIMIdentifier];
            uint64_t v31 = -[IDSPACStateTracker _simTypeString:](self, "_simTypeString:", [v18 hardwareType]);
            v32 = (void *)v31;
            *(_DWORD *)buf = 138413314;
            CFStringRef v33 = @"NO";
            if (v21) {
              CFStringRef v34 = @"YES";
            }
            else {
              CFStringRef v34 = @"NO";
            }
            v52 = v30;
            if (v45) {
              CFStringRef v33 = @"YES";
            }
            __int16 v53 = 2112;
            uint64_t v54 = v31;
            __int16 v55 = 2112;
            CFStringRef v56 = v34;
            __int16 v57 = 2112;
            CFStringRef v58 = v33;
            __int16 v59 = 2112;
            CFStringRef v60 = v28;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Sim status %@ | simType: %@ isPNRCapable: %@ isPNRReady: %@ isPNRInFlight: %@ ", buf, 0x34u);

            v3 = v39;
          }

          v4 = &IDSRegistrationPropertySupportsAVLess_ptr;
        }
        id v44 = [obj countByEnumeratingWithState:&v46 objects:v61 count:16];
      }
      while (v44);
    }

    [(IDSPACState *)v3 setIsAuthenticationInFlight:byte_100A4A830];
    v35 = +[IMRGLog sms];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v3;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Current PAC state: %@", buf, 0xCu);
    }

    v36 = v3;
    v10 = 0;
    v9 = v38;
  }

  return v3;
}

- (id)underlyingErrorForPACState:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  if (qword_100A4A838)
  {
    v6 = +[IMRGLog sms];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "There is a recent tracked PAC removal, including in error chain", buf, 2u);
    }

    uint64_t v7 = qword_100A4A838;
    NSErrorUserInfoKey v17 = NSDebugDescriptionErrorKey;
    v8 = [(IDSPACStateTracker *)self _pacRemovalReasonToString:qword_100A4A838];
    v9 = +[NSString stringWithFormat:@"PAC was last removed due to %@", v8];
    v18 = v9;
    v10 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v11 = +[NSError errorWithDomain:@"IDSPACRemovedErrorDomain" code:v7 userInfo:v10];
    [v5 setObject:v11 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  if (([v4 isAnySIMInserted] & 1) == 0)
  {
    [v5 setObject:@"This device has no inserted SIM" forKeyedSubscript:NSDebugDescriptionErrorKey];
    uint64_t v12 = -5100;
    goto LABEL_19;
  }
  if (([v4 isAnySIMUsable] & 1) == 0)
  {
    [v5 setObject:@"This device has atleast one inserted SIM but none are usable" forKeyedSubscript:NSDebugDescriptionErrorKey];
    uint64_t v12 = -5200;
    goto LABEL_19;
  }
  if (([v4 isAnySIMPNRCapable] & 1) == 0)
  {
    [v5 setObject:@"This device has no SIM capable of PNR" forKeyedSubscript:NSDebugDescriptionErrorKey];
    uint64_t v12 = -5300;
    goto LABEL_19;
  }
  if (([v4 isAnySIMPNRReady] & 1) == 0)
  {
    [v5 setObject:@"This device has atleast one PNR capable SIM but none are ready for PNR" forKeyedSubscript:NSDebugDescriptionErrorKey];
    uint64_t v12 = -5400;
    goto LABEL_19;
  }
  if ([v4 isAnyPNRInFlight])
  {
    [v5 setObject:@"There is currently a PNR in flight" forKeyedSubscript:NSDebugDescriptionErrorKey];
    uint64_t v12 = -5500;
LABEL_19:
    uint64_t v13 = +[NSError errorWithDomain:@"IDSPhoneUserRegistryErrorDomain" code:v12 userInfo:v5];
    goto LABEL_20;
  }
  if ([v4 isAwaitingAuthentication])
  {
    [v5 setObject:@"PNR is complete, but we have not yet kicked off authentication", NSDebugDescriptionErrorKey forKeyedSubscript];
    uint64_t v12 = -5600;
    goto LABEL_19;
  }
  if ([v4 isAuthenticationInFlight])
  {
    [v5 setObject:@"PNR is complete, but authentication is still in flight", NSDebugDescriptionErrorKey forKeyedSubscript];
    uint64_t v12 = -5700;
    goto LABEL_19;
  }
  uint64_t v13 = [v5 objectForKey:NSUnderlyingErrorKey];
LABEL_20:
  v14 = (void *)v13;

  return v14;
}

- (void)notePhoneAuthCertLost:(int64_t)a3
{
  id v5 = +[IMRGLog sms];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(IDSPACStateTracker *)self _pacRemovalReasonToString:a3];
    int v9 = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Noting phone auth cert removal! Reason: %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = +[NSDate now];
  v8 = (void *)qword_100A4A828;
  qword_100A4A828 = v7;

  qword_100A4A838 = a3;
}

- (id)_pacRemovalReasonToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8) {
    return @"NoTrackedRemoval";
  }
  else {
    return off_100983BE0[a3 - 1];
  }
}

- (id)_simTypeString:(unint64_t)a3
{
  CFStringRef v3 = @"unknown";
  if (a3 == 1) {
    CFStringRef v3 = @"physical";
  }
  if (a3 == 2) {
    return @"eSIM";
  }
  else {
    return (id)v3;
  }
}

- (void)notePhoneAuthCertGained
{
  v2 = +[IMRGLog sms];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Gained a phone auth cert!", v4, 2u);
  }

  CFStringRef v3 = (void *)qword_100A4A828;
  qword_100A4A828 = 0;

  qword_100A4A838 = 0;
}

- (void)notePNRSuccess
{
  v2 = +[IMRGLog sms];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "PAC state tracker clearing last PNR failure", v3, 2u);
  }
}

- (void)notePNRError:(int64_t)a3
{
  CFStringRef v3 = +[IMRGLog sms];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PAC state tracker noting a PNR failure", v4, 2u);
  }
}

- (void)noteAuthenticationStarted
{
  v2 = +[IMRGLog sms];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "PAC state tracker noting authentication has begun", v3, 2u);
  }

  byte_100A4A830 = 1;
}

- (void)noteAuthenticationFinished
{
  v2 = +[IMRGLog sms];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "PAC state tracker noting authentication has finished", v3, 2u);
  }

  byte_100A4A830 = 0;
}

@end