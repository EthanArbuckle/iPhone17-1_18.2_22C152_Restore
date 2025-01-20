@interface AKCarrierBundleUtilities
+ (AKCarrierBundleUtilities)sharedInstance;
- (AKCarrierBundleUtilities)init;
- (id)_formattedValueForPhoneNumber:(id)a3 countryCode:(id)a4;
- (id)phoneBundleInfoWithAdditionalInfo:(id)a3 error:(id *)a4;
@end

@implementation AKCarrierBundleUtilities

- (AKCarrierBundleUtilities)init
{
  v9.receiver = self;
  v9.super_class = (Class)AKCarrierBundleUtilities;
  v2 = [(AKCarrierBundleUtilities *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.accounts.carrierUtilities.queue", v3);
    carrierUtilitiesQueue = v2->_carrierUtilitiesQueue;
    v2->_carrierUtilitiesQueue = (OS_dispatch_queue *)v4;

    v6 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:v2->_carrierUtilitiesQueue];
    telephonyClient = v2->_telephonyClient;
    v2->_telephonyClient = v6;

    [(CoreTelephonyClient *)v2->_telephonyClient setDelegate:v2];
  }
  return v2;
}

+ (AKCarrierBundleUtilities)sharedInstance
{
  if (qword_100272428 != -1) {
    dispatch_once(&qword_100272428, &stru_1002284B0);
  }
  v2 = (void *)qword_100272420;

  return (AKCarrierBundleUtilities *)v2;
}

- (id)phoneBundleInfoWithAdditionalInfo:(id)a3 error:(id *)a4
{
  id v47 = a3;
  telephonyClient = self->_telephonyClient;
  id v53 = 0;
  v7 = [(CoreTelephonyClient *)telephonyClient getSubscriptionInfoWithError:&v53];
  id v8 = v53;
  objc_super v9 = v8;
  if (v7)
  {
    id v38 = v8;
    id v45 = +[NSMutableArray array];
    v44 = [(CoreTelephonyClient *)self->_telephonyClient getCurrentDataSubscriptionContextSync:0];
    v43 = [(CoreTelephonyClient *)self->_telephonyClient getUserDefaultVoiceSubscriptionContext:0];
    v42 = [v7 subscriptionsInUse];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v39 = v7;
    id obj = [v7 subscriptions];
    id v46 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v46)
    {
      uint64_t v41 = *(void *)v50;
      do
      {
        for (i = 0; i != v46; i = (char *)i + 1)
        {
          if (*(void *)v50 != v41) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          v12 = [v44 uuid];
          v13 = [v11 uuid];
          BOOL v14 = v12 == v13;

          v15 = [v43 uuid];
          v16 = [v11 uuid];
          BOOL v17 = v15 == v16;

          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_100047A68;
          v48[3] = &unk_1002284D8;
          v48[4] = v11;
          id v18 = [v42 indexOfObjectPassingTest:v48];
          v56[0] = @"slotID";
          v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v11 slotID]);
          v57[0] = v19;
          v56[1] = @"dataPreferred";
          v20 = +[NSNumber numberWithBool:v14];
          v57[1] = v20;
          v56[2] = @"defaultVoice";
          v21 = +[NSNumber numberWithBool:v17];
          v57[2] = v21;
          v57[3] = &__kCFBooleanTrue;
          v56[3] = @"physicalSim";
          v56[4] = @"inUse";
          v22 = +[NSNumber numberWithInt:v18 != (id)0x7FFFFFFFFFFFFFFFLL];
          v57[4] = v22;
          v23 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:5];
          id v24 = [v23 mutableCopy];

          v25 = [(CoreTelephonyClient *)self->_telephonyClient getMobileSubscriberHomeCountryList:v11 error:0];
          v26 = [v25 firstObject];

          v27 = [v11 phoneNumber];
          v28 = [(AKCarrierBundleUtilities *)self _formattedValueForPhoneNumber:v27 countryCode:v26];

          if (v28) {
            [v24 setObject:v28 forKeyedSubscript:@"number"];
          }
          v29 = [v11 label];

          if (v29)
          {
            v30 = [v11 label];
            [v24 setObject:v30 forKeyedSubscript:@"label"];
          }
          if (v47)
          {
            v31 = [v47 objectForKeyedSubscript:@"PhoneCertificate"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v32 = [v31 slotID];
              if (v32 == [v11 slotID])
              {
                v33 = [v31 phoneCertificate];
                [v24 setObject:v33 forKeyedSubscript:@"PAC"];
              }
            }
          }
          v34 = _AKLogSystem();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v55 = v24;
            _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Populating results with bundle info: %@", buf, 0xCu);
          }

          id v35 = [v24 copy];
          [v45 addObject:v35];
        }
        id v46 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v46);
    }

    objc_super v9 = v38;
    v7 = v39;
  }
  else
  {
    v36 = _AKLogSystem();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_100182920((uint64_t)v9, v36);
    }

    id v45 = 0;
    if (a4) {
      *a4 = v9;
    }
  }

  return v45;
}

- (id)_formattedValueForPhoneNumber:(id)a3 countryCode:(id)a4
{
  id v4 = a4;
  v5 = (const char *)PNCopyBestGuessNormalizedNumberForCountry();
  if (v5)
  {
    v6 = (char *)v5;
    CFStringRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, v5, 0x8000100u);
    if (v7)
    {
      CFStringRef v8 = v7;
      uint64_t v9 = CFPhoneNumberCreate();
      if (v9)
      {
        v10 = (const void *)v9;
        String = (void *)CFPhoneNumberCreateString();
        CFRelease(v10);
      }
      else
      {
        String = 0;
      }
      CFRelease(v8);
    }
    else
    {
      String = 0;
    }
    free(v6);
  }
  else
  {
    String = 0;
  }

  return String;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierUtilitiesQueue, 0);

  objc_storeStrong((id *)&self->_telephonyClient, 0);
}

@end