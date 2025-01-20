@interface SPCarrierBundleAdapter
- (BOOL)getBoolean:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)isDualSimON;
- (BOOL)isLLPHSApplicationEnabled;
- (BOOL)isSlicingSetup;
- (BOOL)isSlicingTestApplicationEnabled;
- (CTBundle)carrierBundleType;
- (CTBundle)operatorBundleType;
- (CoreTelephonyClient)client;
- (NSMutableDictionary)slicingConfiguration;
- (NSMutableDictionary)validSubscriptions;
- (SPCarrierBundleAdapter)init;
- (SPCarrierBundleAdapterDelegate)delegate;
- (dispatch_queue_s)get_queue;
- (id)_getCarrierBundleKeyForDataContext:(id)a3;
- (id)_getCarrierBundleKeyValue:(id)a3 forContext:(id)a4;
- (id)getArray:(id)a3 defaultValue:(id)a4;
- (id)getCarrierBundleIdentifier;
- (id)getCarrierBundleVersion;
- (id)getData:(id)a3 defaultValue:(id)a4;
- (id)getDict:(id)a3 defaultValue:(id)a4;
- (id)getNRSlicingCBConfigCurrentDataContext;
- (id)getPhoneNumber;
- (id)getString:(id)a3 defaultValue:(id)a4;
- (int64_t)getInteger:(id)a3 defaultValue:(int64_t)a4;
- (void)_handleSubscriptionAndBundleChange:(id)a3;
- (void)_loadSlicingConfigForContext:(id)a3;
- (void)_loadSubscriptionInfo;
- (void)_loadSubscriptionInfoForContext:(id)a3;
- (void)carrierBundleChange:(id)a3;
- (void)defaultBundleChange;
- (void)operatorBundleChange:(id)a3;
- (void)setCarrierBundleType:(id)a3;
- (void)setClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOperatorBundleType:(id)a3;
- (void)setSlicingConfiguration:(id)a3;
- (void)setValidSubscriptions:(id)a3;
- (void)subscriptionInfoDidChange;
@end

@implementation SPCarrierBundleAdapter

- (SPCarrierBundleAdapter)init
{
  v14.receiver = self;
  v14.super_class = (Class)SPCarrierBundleAdapter;
  v2 = [(SPCarrierBundleAdapter *)&v14 init];
  if (v2)
  {
    +[SPLog bootstrap];
    v3 = (CTBundle *)[objc_alloc((Class)CTBundle) initWithBundleType:1];
    carrierBundleType = v2->_carrierBundleType;
    v2->_carrierBundleType = v3;

    v5 = (CTBundle *)[objc_alloc((Class)CTBundle) initWithBundleType:2];
    operatorBundleType = v2->_operatorBundleType;
    v2->_operatorBundleType = v5;

    v7 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:[v2 get_queue]];
    client = v2->_client;
    v2->_client = v7;

    [(CoreTelephonyClient *)v2->_client setDelegate:v2];
    uint64_t v9 = objc_opt_new();
    validSubscriptions = v2->_validSubscriptions;
    v2->_validSubscriptions = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    slicingConfiguration = v2->_slicingConfiguration;
    v2->_slicingConfiguration = (NSMutableDictionary *)v11;

    [(SPCarrierBundleAdapter *)v2 _loadSubscriptionInfo];
  }
  return v2;
}

- (void)_loadSubscriptionInfo
{
  client = self->_client;
  id v15 = 0;
  v4 = [(CoreTelephonyClient *)client getSubscriptionInfoWithError:&v15];
  id v5 = v15;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [v4 subscriptionsValid];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(SPCarrierBundleAdapter *)self _loadSubscriptionInfoForContext:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_loadSubscriptionInfoForContext:(id)a3
{
  id v4 = a3;
  id v5 = [(SPCarrierBundleAdapter *)self validSubscriptions];
  v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 slotID]);
  id v7 = [v5 objectForKey:v6];

  id v8 = [(SPCarrierBundleAdapter *)self validSubscriptions];
  uint64_t v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 slotID]);
  v10 = [v8 objectForKey:v9];

  if (v10)
  {
    long long v11 = qword_1002E3100;
    if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      id v15 = [v4 slotID];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating context previously found associated to slotID=%ld", (uint8_t *)&v14, 0xCu);
    }
  }
  long long v12 = [(SPCarrierBundleAdapter *)self validSubscriptions];
  long long v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 slotID]);
  [v12 setObject:v4 forKey:v13];

  [(SPCarrierBundleAdapter *)self _loadSlicingConfigForContext:v4];
}

- (void)_loadSlicingConfigForContext:(id)a3
{
  id v4 = (__CFString *)a3;
  client = self->_client;
  v6 = [(SPCarrierBundleAdapter *)self carrierBundleType];
  id v15 = 0;
  id v7 = [(CoreTelephonyClient *)client copyCarrierBundleValue:v4 key:@"NRSlicing" bundleType:v6 error:&v15];
  id v8 = v15;

  if (v8)
  {
    uint64_t v9 = qword_1002E3100;
    if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_ERROR)) {
      sub_10020D060((uint64_t)v4, (uint64_t)v8, v9);
    }
  }
  else if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [(SPCarrierBundleAdapter *)self slicingConfiguration];
      long long v11 = +[NSNumber numberWithInteger:[(__CFString *)v4 slotID]];
      [v10 setObject:v7 forKey:v11];
    }
    else
    {
      long long v13 = qword_1002E3100;
      if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = [(id)objc_opt_class() description];
        *(_DWORD *)buf = 138412802;
        CFStringRef v17 = @"NRSlicing";
        __int16 v18 = 2112;
        v19 = v14;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "key %@ expected NSDictionary type but found %@ <%@>", buf, 0x20u);
      }
    }
  }
  else
  {
    long long v12 = qword_1002E3100;
    if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "no NRSlicing definitions in ctxt=%@", buf, 0xCu);
    }
  }
}

- (BOOL)isDualSimON
{
  v3 = [(SPCarrierBundleAdapter *)self client];
  uint64_t v8 = 0;
  id v4 = [v3 getDualSimCapability:&v8];

  if (v4 != (id)2) {
    return 0;
  }
  id v5 = [(SPCarrierBundleAdapter *)self validSubscriptions];
  BOOL v6 = (unint64_t)[v5 count] > 1;

  return v6;
}

- (id)getCarrierBundleVersion
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  client = self->_client;
  id v24 = 0;
  id v5 = [(CoreTelephonyClient *)client getSubscriptionInfoWithError:&v24];
  id v6 = v24;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  __int16 v18 = v5;
  id v7 = [v5 subscriptionsValid];
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      long long v11 = 0;
      long long v12 = v6;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v11);
        int v14 = [(SPCarrierBundleAdapter *)self client];
        id v19 = v12;
        id v15 = [v14 copyCarrierBundleVersion:v13 error:&v19];
        id v6 = v19;

        [v3 addObject:v15];
        long long v11 = (char *)v11 + 1;
        long long v12 = v6;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v9);
  }

  if (v6)
  {
    NSLog(@"Unable to determine current subscription context");
    id v16 = 0;
  }
  else
  {
    id v16 = v3;
  }

  return v16;
}

- (id)getCarrierBundleIdentifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  client = self->_client;
  id v25 = 0;
  id v5 = [(CoreTelephonyClient *)client getSubscriptionInfoWithError:&v25];
  id v6 = v25;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  __int16 v18 = v5;
  id obj = [v5 subscriptionsValid];
  id v7 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      long long v11 = v6;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v10);
        uint64_t v13 = [(SPCarrierBundleAdapter *)self client];
        int v14 = [(SPCarrierBundleAdapter *)self carrierBundleType];
        id v20 = v11;
        id v15 = [v13 copyBundleIdentifier:v12 bundleType:v14 error:&v20];
        id v6 = v20;

        [v3 addObject:v15];
        uint64_t v10 = (char *)v10 + 1;
        long long v11 = v6;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  if (v6)
  {
    NSLog(@"Unable to determine current subscription context");
    id v16 = 0;
  }
  else
  {
    id v16 = v3;
  }

  return v16;
}

- (id)getPhoneNumber
{
  v2 = [(SPCarrierBundleAdapter *)self client];
  id v15 = 0;
  id v3 = [v2 getCurrentDataSubscriptionContextSync:&v15];
  id v4 = v15;

  if (v4)
  {
    id v5 = qword_1002E3100;
    if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_ERROR)) {
      sub_10020D0F8(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = [v3 phoneNumber];
  }

  return v13;
}

- (id)getNRSlicingCBConfigCurrentDataContext
{
  id v3 = [(SPCarrierBundleAdapter *)self client];
  id v21 = 0;
  id v4 = [v3 getCurrentDataSubscriptionContextSync:&v21];
  id v5 = v21;

  if (v5)
  {
    uint64_t v6 = qword_1002E3100;
    if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_ERROR)) {
      sub_10020D0F8(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    int v14 = 0;
  }
  else
  {
    id v15 = [(SPCarrierBundleAdapter *)self slicingConfiguration];
    id v16 = [v15 allKeys];
    CFStringRef v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 slotID]);
    if ([v16 containsObject:v17])
    {
      __int16 v18 = [(SPCarrierBundleAdapter *)self slicingConfiguration];
      id v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 slotID]);
      int v14 = [v18 objectForKey:v19];
    }
    else
    {
      int v14 = 0;
    }
  }

  return v14;
}

- (BOOL)isSlicingSetup
{
  v2 = [(SPCarrierBundleAdapter *)self getNRSlicingCBConfigCurrentDataContext];
  id v3 = [v2 allValues];
  if ([v3 count])
  {
    id v4 = [v2 allValues];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isSlicingTestApplicationEnabled
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = [(SPCarrierBundleAdapter *)self slicingConfiguration];
  id v4 = [v3 allKeys];

  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v26;
    *(void *)&long long v6 = 138412290;
    long long v24 = v6;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v4);
        }
        CFStringRef v10 = *(const __CFString **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = [(SPCarrierBundleAdapter *)self slicingConfiguration];
        uint64_t v12 = [v11 objectForKey:v10];

        uint64_t v13 = [v12 objectForKey:@"__SlicingTestModule__"];
        if (v13)
        {
          CFStringRef v17 = (void *)v13;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            __int16 v18 = [v17 objectForKey:@"Enabled"];
            id v19 = qword_1002E3100;
            if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v20 = [v18 BOOLValue];
              CFStringRef v21 = @"Disabled";
              *(_DWORD *)buf = 134218498;
              CFStringRef v30 = v10;
              if (v20) {
                CFStringRef v21 = @"Enabled";
              }
              __int16 v31 = 2112;
              CFStringRef v32 = @"Enabled";
              __int16 v33 = 2112;
              CFStringRef v34 = v21;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Slicing Test Application for slot=%ld %@=%@", buf, 0x20u);
            }
            unsigned __int8 v16 = [v18 BOOLValue];
          }
          else
          {
            long long v22 = qword_1002E3100;
            if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_ERROR)) {
              sub_10020D130(v22);
            }
            unsigned __int8 v16 = 0;
          }

          return v16;
        }
        int v14 = qword_1002E3100;
        if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v24;
          CFStringRef v30 = @"__SlicingTestModule__";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Missing key %@. Defaulting to disabled", buf, 0xCu);
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v25 objects:v35 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v15 = qword_1002E3100;
  unsigned __int8 v16 = 0;
  if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Slicing Test Application enabled=NO", buf, 2u);
    return 0;
  }
  return v16;
}

- (BOOL)isLLPHSApplicationEnabled
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = [(SPCarrierBundleAdapter *)self slicingConfiguration];
  id v4 = [v3 allKeys];

  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v26;
    *(void *)&long long v6 = 138412290;
    long long v24 = v6;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v4);
        }
        CFStringRef v10 = *(const __CFString **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = [(SPCarrierBundleAdapter *)self slicingConfiguration];
        uint64_t v12 = [v11 objectForKey:v10];

        uint64_t v13 = [v12 objectForKey:@"__SlicingTestModule__"];
        if (v13)
        {
          CFStringRef v17 = (void *)v13;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            __int16 v18 = [v17 objectForKey:@"SupportsLLPHS"];
            id v19 = qword_1002E3100;
            if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v20 = [v18 BOOLValue];
              CFStringRef v21 = @"Disabled";
              *(_DWORD *)buf = 134218498;
              CFStringRef v30 = v10;
              __int16 v31 = 2112;
              if (v20) {
                CFStringRef v21 = @"Enabled";
              }
              CFStringRef v32 = @"SupportsLLPHS";
              __int16 v33 = 2112;
              CFStringRef v34 = v21;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "LLPHS for slot=%ld %@=%@", buf, 0x20u);
            }
            unsigned __int8 v16 = [v18 BOOLValue];
          }
          else
          {
            long long v22 = qword_1002E3100;
            if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_ERROR)) {
              sub_10020D1B4(v22);
            }
            unsigned __int8 v16 = 0;
          }

          return v16;
        }
        int v14 = qword_1002E3100;
        if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v24;
          CFStringRef v30 = @"SupportsLLPHS";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Missing key %@. Defaulting to disabled", buf, 0xCu);
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v25 objects:v35 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v15 = qword_1002E3100;
  unsigned __int8 v16 = 0;
  if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "LLPHS not enabled", buf, 2u);
    return 0;
  }
  return v16;
}

- (int64_t)getInteger:(id)a3 defaultValue:(int64_t)a4
{
  id v5 = [(SPCarrierBundleAdapter *)self _getCarrierBundleKeyForDataContext:a3];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      a4 = (int64_t)[v5 integerValue];
    }
  }

  return a4;
}

- (id)getString:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  id v7 = [(SPCarrierBundleAdapter *)self _getCarrierBundleKeyForDataContext:a3];
  if (!v7 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), uint64_t v9 = v7, (isKindOfClass & 1) == 0)) {
    uint64_t v9 = v6;
  }
  id v10 = v9;

  return v10;
}

- (id)getData:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  id v7 = [(SPCarrierBundleAdapter *)self _getCarrierBundleKeyForDataContext:a3];
  if (!v7 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), uint64_t v9 = v7, (isKindOfClass & 1) == 0)) {
    uint64_t v9 = v6;
  }
  id v10 = v9;

  return v10;
}

- (id)getArray:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  id v7 = [(SPCarrierBundleAdapter *)self _getCarrierBundleKeyForDataContext:a3];
  if (!v7 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), uint64_t v9 = v7, (isKindOfClass & 1) == 0)) {
    uint64_t v9 = v6;
  }
  id v10 = v9;

  return v10;
}

- (BOOL)getBoolean:(id)a3 defaultValue:(BOOL)a4
{
  id v5 = [(SPCarrierBundleAdapter *)self _getCarrierBundleKeyForDataContext:a3];
  id v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (id)getDict:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  id v7 = [(SPCarrierBundleAdapter *)self _getCarrierBundleKeyForDataContext:a3];
  if (!v7 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), uint64_t v9 = v7, (isKindOfClass & 1) == 0)) {
    uint64_t v9 = v6;
  }
  id v10 = v9;

  return v10;
}

- (id)_getCarrierBundleKeyForDataContext:(id)a3
{
  id v4 = a3;
  id v5 = [(SPCarrierBundleAdapter *)self client];
  id v18 = 0;
  id v6 = [v5 getCurrentDataSubscriptionContextSync:&v18];
  id v7 = v18;

  if (v7)
  {
    uint64_t v8 = qword_1002E3100;
    if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_ERROR)) {
      sub_10020D238(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    unsigned __int8 v16 = 0;
  }
  else
  {
    unsigned __int8 v16 = [(SPCarrierBundleAdapter *)self _getCarrierBundleKeyValue:v4 forContext:v6];
  }

  return v16;
}

- (id)_getCarrierBundleKeyValue:(id)a3 forContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SPCarrierBundleAdapter *)self client];
  uint64_t v9 = [(SPCarrierBundleAdapter *)self carrierBundleType];
  id v15 = 0;
  id v10 = [v8 copyCarrierBundleValue:v7 key:v6 bundleType:v9 error:&v15];
  id v11 = v15;

  if (v11)
  {
    uint64_t v12 = qword_1002E3100;
    if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to read key %@ from context=%@ with error=%@", buf, 0x20u);
    }
    id v13 = 0;
  }
  else
  {
    id v13 = v10;
  }

  return v13;
}

- (void)_handleSubscriptionAndBundleChange:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(SPCarrierBundleAdapter *)self _loadSubscriptionInfoForContext:v4];
  }
  else {
    [(SPCarrierBundleAdapter *)self _loadSubscriptionInfo];
  }
  uint64_t v5 = [(SPCarrierBundleAdapter *)self delegate];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(SPCarrierBundleAdapter *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v9 = qword_1002E3100;
      if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notifying carrier bundle update to delegate", (uint8_t *)buf, 2u);
      }
      objc_initWeak(buf, self);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100022B38;
      block[3] = &unk_100286F30;
      objc_copyWeak(&v11, buf);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
  }
}

- (dispatch_queue_s)get_queue
{
  if (qword_1002DC380 != -1) {
    dispatch_once(&qword_1002DC380, &stru_100286F70);
  }
  return (dispatch_queue_s *)qword_1002DC388;
}

- (void)subscriptionInfoDidChange
{
}

- (void)defaultBundleChange
{
  id v3 = qword_1002E3100;
  if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "default bundle changed. reloading configuration", v4, 2u);
  }
  [(SPCarrierBundleAdapter *)self _handleSubscriptionAndBundleChange:0];
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = qword_1002E3100;
  if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "carrier bundle changed for ctxt=%@. reloading configuration", (uint8_t *)&v6, 0xCu);
  }
  [(SPCarrierBundleAdapter *)self _handleSubscriptionAndBundleChange:v4];
}

- (void)operatorBundleChange:(id)a3
{
  id v4 = qword_1002E3100;
  if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "operator bundle changed for ctxt=%@. Ignoring update", (uint8_t *)&v5, 0xCu);
  }
}

- (SPCarrierBundleAdapterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SPCarrierBundleAdapterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSMutableDictionary)validSubscriptions
{
  return self->_validSubscriptions;
}

- (void)setValidSubscriptions:(id)a3
{
}

- (NSMutableDictionary)slicingConfiguration
{
  return self->_slicingConfiguration;
}

- (void)setSlicingConfiguration:(id)a3
{
}

- (CTBundle)carrierBundleType
{
  return self->_carrierBundleType;
}

- (void)setCarrierBundleType:(id)a3
{
}

- (CTBundle)operatorBundleType
{
  return self->_operatorBundleType;
}

- (void)setOperatorBundleType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operatorBundleType, 0);
  objc_storeStrong((id *)&self->_carrierBundleType, 0);
  objc_storeStrong((id *)&self->_slicingConfiguration, 0);
  objc_storeStrong((id *)&self->_validSubscriptions, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end