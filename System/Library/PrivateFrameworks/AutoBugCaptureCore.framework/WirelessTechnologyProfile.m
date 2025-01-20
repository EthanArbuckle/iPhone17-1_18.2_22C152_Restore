@interface WirelessTechnologyProfile
+ (id)fetchFormattedHomeCarrierNameForContext:(id)a3;
+ (id)fetchMCCMNCHomeCarrierNameForContext:(id)a3;
+ (id)fetchRegulatoryDomainCountry;
+ (id)sharedInstance;
- (CTXPCServiceSubscriptionContext)dataContext;
- (NSString)homeCarrier;
- (NSString)regulatoryDomainCountry;
- (WirelessTechnologyProfile)init;
- (id)fetchHomeCarrier;
- (void)carrierBundleChange:(id)a3;
- (void)currentDataSimChanged:(id)a3;
- (void)dealloc;
- (void)setDataContext:(id)a3;
- (void)setHomeCarrier:(id)a3;
- (void)setRegulatoryDomainCountry:(id)a3;
- (void)subscriptionInfoDidChange;
- (void)updateHomeCarrier;
@end

@implementation WirelessTechnologyProfile

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance_sharedProfile;

  return v2;
}

uint64_t __43__WirelessTechnologyProfile_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(WirelessTechnologyProfile);
  uint64_t v1 = sharedInstance_sharedProfile;
  sharedInstance_sharedProfile = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (WirelessTechnologyProfile)init
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)WirelessTechnologyProfile;
  v2 = [(WirelessTechnologyProfile *)&v22 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.autobugcapture.wirelesstechnologyprofile", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    regulatoryDomainCountry = v2->_regulatoryDomainCountry;
    v2->_regulatoryDomainCountry = (NSString *)@"Unknown";

    homeCarrier = v2->_homeCarrier;
    v2->_homeCarrier = (NSString *)@"Unknown";

    dataContext = v2->_dataContext;
    v2->_dataContext = 0;

    int out_token = -1;
    objc_initWeak(&location, v2);
    v9 = (const char *)[ (id) *MEMORY[0x263F62D28] UTF8String];
    v10 = v2->_queue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __33__WirelessTechnologyProfile_init__block_invoke;
    handler[3] = &unk_263FC38F8;
    objc_copyWeak(&v19, &location);
    uint32_t v11 = notify_register_dispatch(v9, &out_token, v10, handler);
    if (v11)
    {
      v12 = symptomsLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        uint32_t v24 = v11;
        _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_ERROR, "Failed to register for regulatory domain update notification: %u", buf, 8u);
      }
    }
    v2->_regulatoryDomainUpdateNotificationToken = out_token;
    v13 = +[WirelessTechnologyProfile fetchRegulatoryDomainCountry];
    [(WirelessTechnologyProfile *)v2 setRegulatoryDomainCountry:v13];

    v14 = +[CoreTelephonyShim sharedInstance];
    [v14 addDelegate:v2];

    v15 = [(WirelessTechnologyProfile *)v2 fetchHomeCarrier];
    [(WirelessTechnologyProfile *)v2 setHomeCarrier:v15];

    v16 = v2;
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __33__WirelessTechnologyProfile_init__block_invoke(uint64_t a1)
{
  v2 = symptomsLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "Received notification for regulatory domain country, updating value", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_queue_t v4 = +[WirelessTechnologyProfile fetchRegulatoryDomainCountry];
    [WeakRetained setRegulatoryDomainCountry:v4];
  }
}

- (void)dealloc
{
  int regulatoryDomainUpdateNotificationToken = self->_regulatoryDomainUpdateNotificationToken;
  if (regulatoryDomainUpdateNotificationToken != -1) {
    notify_cancel(regulatoryDomainUpdateNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)WirelessTechnologyProfile;
  [(WirelessTechnologyProfile *)&v4 dealloc];
}

+ (id)fetchRegulatoryDomainCountry
{
  if (!fetchRegulatoryDomainCountry_enUSLocale)
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US"];
    v3 = (void *)fetchRegulatoryDomainCountry_enUSLocale;
    fetchRegulatoryDomainCountry_enUSLocale = v2;
  }
  objc_super v4 = [MEMORY[0x263F62D20] lastKnownEstimates];
  if ([v4 count])
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    v6 = [v5 countryCode];

    if (v6)
    {
      v7 = [(id)fetchRegulatoryDomainCountry_enUSLocale localizedStringForCountryCode:v6];
      v8 = v7;
      if (v7)
      {
        v8 = v7;
        v9 = (__CFString *)v8;
LABEL_16:

        goto LABEL_17;
      }
      v10 = symptomsLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "Error while fetching regulatory domain country: no localized string", v12, 2u);
      }
    }
    else
    {
      v8 = symptomsLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_ERROR, "Error while fetching regulatory domain country: no ISO code", v13, 2u);
      }
    }
    v9 = @"Unknown";
    goto LABEL_16;
  }
  v6 = symptomsLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_ERROR, "Error while fetching regulatory domain country: no estimates", buf, 2u);
  }
  v9 = @"Unknown";
LABEL_17:

  return v9;
}

+ (id)fetchFormattedHomeCarrierNameForContext:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!fetchFormattedHomeCarrierNameForContext__sInvalidCarrierNames)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_26BDF5ED0];
    v5 = (void *)fetchFormattedHomeCarrierNameForContext__sInvalidCarrierNames;
    fetchFormattedHomeCarrierNameForContext__sInvalidCarrierNames = v4;
  }
  v6 = +[CoreTelephonyShim sharedInstance];
  v7 = (void *)[objc_alloc(MEMORY[0x263F02C20]) initWithBundleType:1];
  id v24 = 0;
  v8 = (void *)[v6 copyCarrierBundleValue:v3 key:@"CarrierName" bundleType:v7 error:&v24];
  v9 = v24;

  if (!v9)
  {
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = +[CoreTelephonyShim sharedInstance];
        id v23 = 0;
        uint32_t v11 = [v10 getEnglishCarrierNameFor:v8 error:&v23];
        v9 = v23;

        if (v9 || !v11)
        {
          v12 = symptomsLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v9;
            _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_ERROR, "Error fetching english carrier name: %@", buf, 0xCu);
          }
        }
        else if ([(id)fetchFormattedHomeCarrierNameForContext__sInvalidCarrierNames containsObject:v11])
        {
          v12 = symptomsLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v11;
            _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_INFO, "Carrier name invalid: %@", buf, 0xCu);
          }
          v9 = 0;
        }
        else
        {
          v14 = +[CoreTelephonyShim sharedInstance];
          v15 = (void *)[objc_alloc(MEMORY[0x263F02C20]) initWithBundleType:5];
          id v22 = 0;
          v12 = [v14 copyCarrierBundleValue:v3 key:@"ISOAlpha2CountryCode" bundleType:v15 error:&v22];
          v9 = v22;

          if (!v9)
          {
            if (v12)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v12 = v12;
                if ([v12 count])
                {
                  v16 = [v12 objectAtIndexedSubscript:0];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v17 = v16;
                    if ([v17 length] == 2)
                    {
                      id v18 = [NSString alloc];
                      id v19 = [v17 uppercaseString];
                      v13 = (void *)[v18 initWithFormat:@"%@ %@", v11, v19];
                    }
                    else
                    {
                      id v19 = symptomsLogHandle();
                      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_ERROR, "Country code has unexpected length", buf, 2u);
                      }
                      v13 = 0;
                    }
                  }
                  else
                  {
                    v17 = symptomsLogHandle();
                    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_ERROR, "Country code is not a string", buf, 2u);
                    }
                    v13 = 0;
                  }
                }
                else
                {
                  v16 = symptomsLogHandle();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_ERROR, "Country codes from bundle are empty", buf, 2u);
                  }
                  v13 = 0;
                }

                goto LABEL_28;
              }
            }
          }
          v20 = symptomsLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v9;
            _os_log_impl(&dword_209DBA000, v20, OS_LOG_TYPE_ERROR, "Error fetching country code from bundle: %@", buf, 0xCu);
          }
        }
        v13 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
  }
  uint32_t v11 = symptomsLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v9;
    _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_ERROR, "Error fetching carrier name from bundle: %@", buf, 0xCu);
  }
  v13 = 0;
LABEL_29:

  return v13;
}

+ (id)fetchMCCMNCHomeCarrierNameForContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = +[CoreTelephonyShim sharedInstance];
  id v14 = 0;
  v5 = (void *)[v4 copyMobileCountryCode:v3 error:&v14];
  id v6 = v14;

  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (v7)
  {
    v9 = symptomsLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch MCC: %@", buf, 0xCu);
    }
  }
  else
  {
    v8 = +[CoreTelephonyShim sharedInstance];
    id v13 = 0;
    v9 = [v8 copyMobileNetworkCode:v3 error:&v13];
    id v6 = v13;

    if (!v6 && v9)
    {
      v10 = (void *)[[NSString alloc] initWithFormat:@"Unknown (mcc=%@, mnc=%@)", v5, v9];
      goto LABEL_15;
    }
    uint32_t v11 = symptomsLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch MNC: %@", buf, 0xCu);
    }
  }
  v10 = 0;
LABEL_15:

  return v10;
}

- (id)fetchHomeCarrier
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(WirelessTechnologyProfile *)self dataContext];
  if (v3)
  {
LABEL_5:
    id v6 = +[WirelessTechnologyProfile fetchFormattedHomeCarrierNameForContext:v3];
    v5 = v6;
    if (v6)
    {
      v5 = v6;
      BOOL v7 = v5;
    }
    else
    {
      uint64_t v8 = +[WirelessTechnologyProfile fetchMCCMNCHomeCarrierNameForContext:v3];
      v9 = (void *)v8;
      v10 = @"Unknown";
      if (v8) {
        v10 = (__CFString *)v8;
      }
      BOOL v7 = v10;
    }
    goto LABEL_13;
  }
  uint64_t v4 = +[CoreTelephonyShim sharedInstance];
  id v13 = 0;
  id v3 = [v4 getCurrentDataSubscriptionContextSync:&v13];
  v5 = (__CFString *)v13;

  if (!v5 && v3)
  {
    [(WirelessTechnologyProfile *)self setDataContext:v3];
    goto LABEL_5;
  }
  uint32_t v11 = symptomsLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_ERROR, "Error while fetching data context: %@", buf, 0xCu);
  }

  BOOL v7 = @"Unknown";
LABEL_13:

  return v7;
}

- (void)updateHomeCarrier
{
  id v3 = symptomsLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_INFO, "Received notification for home carrier, updating value", v5, 2u);
  }

  uint64_t v4 = [(WirelessTechnologyProfile *)self fetchHomeCarrier];
  [(WirelessTechnologyProfile *)self setHomeCarrier:v4];
}

- (void)subscriptionInfoDidChange
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = +[CoreTelephonyShim sharedInstance];
  id v15 = 0;
  uint64_t v4 = [v3 getCurrentDataSubscriptionContextSync:&v15];
  id v5 = v15;

  id v6 = symptomsLogHandle();
  BOOL v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "Error while fetching data context: %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [(WirelessTechnologyProfile *)self dataContext];
      v9 = [v8 uuid];
      v10 = [v4 uuid];
      *(_DWORD *)buf = 138412546;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "subscriptionInfoDidChange: %@ -> %@", buf, 0x16u);
    }
    if (v4)
    {
      uint32_t v11 = [v4 uuid];
      v12 = [(WirelessTechnologyProfile *)self dataContext];
      id v13 = [v12 uuid];
      char v14 = [v11 isEqual:v13];

      if ((v14 & 1) == 0)
      {
        [(WirelessTechnologyProfile *)self setDataContext:v4];
        [(WirelessTechnologyProfile *)self updateHomeCarrier];
      }
    }
    else
    {
      [(WirelessTechnologyProfile *)self setDataContext:0];
      [(WirelessTechnologyProfile *)self setHomeCarrier:@"Unknown"];
    }
  }
}

- (void)currentDataSimChanged:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = symptomsLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(WirelessTechnologyProfile *)self dataContext];
    BOOL v7 = [v6 uuid];
    uint64_t v8 = [v4 uuid];
    int v13 = 138412546;
    char v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_INFO, "currentDataSimChanged: %@ -> %@", (uint8_t *)&v13, 0x16u);
  }
  if (v4)
  {
    v9 = [v4 uuid];
    v10 = [(WirelessTechnologyProfile *)self dataContext];
    uint32_t v11 = [v10 uuid];
    char v12 = [v9 isEqual:v11];

    if ((v12 & 1) == 0)
    {
      [(WirelessTechnologyProfile *)self setDataContext:v4];
      [(WirelessTechnologyProfile *)self updateHomeCarrier];
    }
  }
}

- (void)carrierBundleChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = symptomsLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 uuid];
    int v11 = 138412290;
    char v12 = v6;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_INFO, "carrierBundleChange: %@", (uint8_t *)&v11, 0xCu);
  }
  BOOL v7 = [v4 uuid];
  uint64_t v8 = [(WirelessTechnologyProfile *)self dataContext];
  v9 = [v8 uuid];
  int v10 = [v7 isEqual:v9];

  if (v10) {
    [(WirelessTechnologyProfile *)self updateHomeCarrier];
  }
}

- (NSString)regulatoryDomainCountry
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRegulatoryDomainCountry:(id)a3
{
}

- (NSString)homeCarrier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHomeCarrier:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)dataContext
{
  return (CTXPCServiceSubscriptionContext *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDataContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataContext, 0);
  objc_storeStrong((id *)&self->_homeCarrier, 0);
  objc_storeStrong((id *)&self->_regulatoryDomainCountry, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end