@interface IDSKTRegistrationDataManager
- (BOOL)_isKTRegistrationData:(id)a3 forServiceIndex:(unsigned __int16)a4 inTrustedDevices:(id)a5;
- (BOOL)doesSignatureDSID:(id)a3 matchAccountDSID:(id)a4;
- (BOOL)handleTransparencySignatureResponse:(id)a3 error:(id)a4;
- (BOOL)hasReportedManateeBuddyTime;
- (BOOL)hasReportediCloudBuddyTime;
- (BOOL)hasReportediCloudManateeTime;
- (BOOL)hasUnregisteredKTData;
- (BOOL)needsPublicDataUpdatedForKeyIndex:(unsigned __int16)a3;
- (BOOL)notePublicIdentityDidRegisterKTData:(id)a3 forKeyIndex:(unsigned __int16)a4;
- (BOOL)registrationNeedKTDataUpdated;
- (BOOL)requestGenerationOfUnregisteredKTRegDataWithPublicIdentityData:(id)a3 applicationKeyManager:(id)a4;
- (BOOL)serializeAndPersistKTDatasDeleteIfNull:(BOOL)a3;
- (IDSKTRegistrationDataManager)initWithIdentityDataSource:(id)a3 transparencyDaemon:(id)a4;
- (IDSRegistrationKeyManagerIdentityDataSource)identityDataSource;
- (NSDate)buddyFinishDate;
- (NSDate)iCloudSignInDate;
- (NSDate)manateeAvailableDate;
- (NSMutableDictionary)serviceIndexToKTRegDataConfigs;
- (TransparencyDaemon)transparencyDaemon;
- (id)_createKTTrustedDeviceForKVSisRegistered:(BOOL)a3;
- (id)_ktApplicationForKTRegistrationIndex:(unsigned __int16)a3;
- (id)accountController;
- (id)copyKTRegistrationDataToRegisterForKeyIndex:(unsigned __int16)a3 isRegistered:(BOOL)a4 withError:(id *)a5;
- (id)createKTRegistrationDataForServiceTypes:(id)a3 usingPublicIdentityData:(id)a4 withApplicationKeyManager:(id)a5;
- (id)createRegistrationStatusProvider;
- (id)keyManager;
- (id)keyTransparencyVersionNumberToRegisterForServiceType:(id)a3;
- (id)ktVerifier;
- (id)serviceController;
- (id)systemMonitor;
- (unsigned)_ktRegistrationDataIndexForKTApplication:(id)a3;
- (void)clearKTDatas;
- (void)fetchKTSignatureDataForServiceTypes:(id)a3 publicIdentityData:(id)a4 applicationKeyManager:(id)a5 withCompletion:(id)a6;
- (void)loadKTRegistrationDatasWithShouldGenerateKTData:(BOOL *)a3;
- (void)logIDSKTRegMetrics:(id)a3 expectedRegisteredData:(id)a4 forKeyIndex:(unsigned __int16)a5;
- (void)logKTRegistrationTimeMetricsForLatestRegisteredKTData:(id)a3 lastRegisteredKTData:(id)a4 forKeyIndex:(unsigned __int16)a5;
- (void)noteBuddyFinishTime;
- (void)noteManateeAvailableTime;
- (void)noteSuccessfulKVSSyncOfTrustedDevices:(id)a3;
- (void)noteiCloudSignInTime;
- (void)scheduleNextKVSSync;
- (void)setBuddyFinishDate:(id)a3;
- (void)setHasReportedManateeBuddyTime:(BOOL)a3;
- (void)setHasReportediCloudBuddyTime:(BOOL)a3;
- (void)setHasReportediCloudManateeTime:(BOOL)a3;
- (void)setICloudSignInDate:(id)a3;
- (void)setIdentityDataSource:(id)a3;
- (void)setManateeAvailableDate:(id)a3;
- (void)setServiceIndexToKTRegDataConfigs:(id)a3;
- (void)setTransparencyDaemon:(id)a3;
- (void)updateKVSWithCurrentKTRegistrationData;
@end

@implementation IDSKTRegistrationDataManager

- (IDSKTRegistrationDataManager)initWithIdentityDataSource:(id)a3 transparencyDaemon:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)IDSKTRegistrationDataManager;
  v9 = [(IDSKTRegistrationDataManager *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identityDataSource, a3);
    objc_storeStrong((id *)&v10->_transparencyDaemon, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    serviceIndexToKTRegDataConfigs = v10->_serviceIndexToKTRegDataConfigs;
    v10->_serviceIndexToKTRegDataConfigs = v11;

    iCloudSignInDate = v10->_iCloudSignInDate;
    v10->_iCloudSignInDate = 0;

    buddyFinishDate = v10->_buddyFinishDate;
    v10->_buddyFinishDate = 0;

    manateeAvailableDate = v10->_manateeAvailableDate;
    v10->_manateeAvailableDate = 0;

    *(_WORD *)&v10->_hasReportediCloudBuddyTime = 0;
    v10->_hasReportedManateeBuddyTime = 0;
  }

  return v10;
}

- (id)serviceController
{
  return +[IDSDServiceController sharedInstance];
}

- (id)ktVerifier
{
  return +[IDSKeyTransparencyVerifier sharedInstance];
}

- (id)keyManager
{
  return +[IDSRegistrationKeyManager sharedInstance];
}

- (id)accountController
{
  return +[IDSDAccountController sharedInstance];
}

- (id)systemMonitor
{
  return +[IMSystemMonitor sharedInstance];
}

- (void)clearKTDatas
{
  v3 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing KT Registration Data.", v9, 2u);
  }

  [(NSMutableDictionary *)self->_serviceIndexToKTRegDataConfigs removeAllObjects];
  int v4 = 0;
  do
  {
    v5 = objc_alloc_init(IDSKTRegistrationDataConfig);
    serviceIndexToKTRegDataConfigs = self->_serviceIndexToKTRegDataConfigs;
    unsigned int v7 = (unsigned __int16)v4;
    id v8 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)v4];
    [(NSMutableDictionary *)serviceIndexToKTRegDataConfigs setObject:v5 forKeyedSubscript:v8];

    ++v4;
  }
  while (v7 < 3);
  [(IDSKTRegistrationDataManager *)self serializeAndPersistKTDatasDeleteIfNull:1];
}

- (BOOL)hasUnregisteredKTData
{
  v3 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking for unregisterd KT Data.", buf, 2u);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v4 = [(IDSKTRegistrationDataManager *)self serviceIndexToKTRegDataConfigs];
  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_serviceIndexToKTRegDataConfigs objectForKeyedSubscript:v9];
        v11 = [v10 unregisteredKTData];

        if (v11)
        {
          v12 = [(NSMutableDictionary *)self->_serviceIndexToKTRegDataConfigs objectForKeyedSubscript:v9];
          v13 = [v12 unregisteredKTData];

          uint64_t v14 = [v13 ktDataForRegistration];
          if (v14)
          {
            v15 = (void *)v14;
            uint64_t v16 = [v13 ktPublicAccountKey];
            if (v16)
            {
              objc_super v17 = (void *)v16;
              v18 = [v13 ktDataSignature];

              if (v18)
              {
                v20 = +[IDSFoundationLog KeyTransparency];
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v28 = v9;
                  __int16 v29 = 2112;
                  v30 = v13;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found unregistered KT Data for keyIndex. { keyIndex: %@, ktRegistrationData: %@ }", buf, 0x16u);
                }

                BOOL v19 = 1;
                goto LABEL_23;
              }
            }
            else
            {
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  int v4 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Did not find any unregistered KT Data.", buf, 2u);
  }
  BOOL v19 = 0;
LABEL_23:

  return v19;
}

- (BOOL)registrationNeedKTDataUpdated
{
  v3 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking if we need to reregister to update KT data.", buf, 2u);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v4 = [(IDSKTRegistrationDataManager *)self serviceIndexToKTRegDataConfigs];
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
    long long v24 = v4;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_serviceIndexToKTRegDataConfigs objectForKeyedSubscript:v9];
        v11 = [v10 unregisteredKTData];

        v12 = [(NSMutableDictionary *)self->_serviceIndexToKTRegDataConfigs objectForKeyedSubscript:v9];
        v13 = [v12 registeredKTData];

        if (v11)
        {
          uint64_t v14 = [v11 ktPublicAccountKey];
          if (v14)
          {
            v15 = (void *)v14;
            uint64_t v16 = [v11 ktDataSignature];

            if (v16)
            {
              if (!v13) {
                goto LABEL_19;
              }
              uint64_t v17 = [v13 ktPublicAccountKey];
              if (!v17) {
                goto LABEL_19;
              }
              v18 = (void *)v17;
              BOOL v19 = [v13 ktPublicAccountKey];
              v20 = [v11 ktPublicAccountKey];
              if (([v19 isEqualToData:v20] & 1) == 0)
              {

                int v4 = v24;
LABEL_19:

                BOOL v22 = 1;
                goto LABEL_20;
              }
              v21 = [v13 ktDataSignature];

              int v4 = v24;
              if (!v21) {
                goto LABEL_19;
              }
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v22 = 0;
LABEL_20:

  return v22;
}

- (id)copyKTRegistrationDataToRegisterForKeyIndex:(unsigned __int16)a3 isRegistered:(BOOL)a4 withError:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v6 = a3;
  id v8 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"NO";
    if (v5) {
      CFStringRef v9 = @"YES";
    }
    v38[0] = 67109378;
    v38[1] = v6;
    __int16 v39 = 2112;
    CFStringRef v40 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requesting copy of KTRegistrationData for keyIndex { keyIndex: %u, isRegistered: %@ }", (uint8_t *)v38, 0x12u);
  }

  serviceIndexToKTRegDataConfigs = self->_serviceIndexToKTRegDataConfigs;
  p_serviceIndexToKTRegDataConfigs = &self->_serviceIndexToKTRegDataConfigs;
  v12 = +[NSNumber numberWithUnsignedShort:v6];
  v13 = [(NSMutableDictionary *)serviceIndexToKTRegDataConfigs objectForKeyedSubscript:v12];

  if (!v13)
  {
    long long v26 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100720074(v6, p_serviceIndexToKTRegDataConfigs, v26);
    }
    goto LABEL_18;
  }
  if (!v5)
  {
    long long v27 = [v13 unregisteredKTData];

    if (v27)
    {
      id v15 = objc_alloc_init((Class)IDSKTRegistrationData);
      long long v28 = [v13 unregisteredKTData];
      __int16 v29 = [v28 ktDataForRegistration];
      id v30 = [v29 copy];
      [v15 setKtDataForRegistration:v30];

      v31 = [v13 unregisteredKTData];
      v32 = [v31 ktPublicAccountKey];
      id v33 = [v32 copy];
      [v15 setKtPublicAccountKey:v33];

      v34 = [v13 unregisteredKTData];
      v35 = [v34 ktDataSignature];
      id v36 = [v35 copy];
      [v15 setKtDataSignature:v36];

      long long v25 = [v13 unregisteredKTData];
      goto LABEL_13;
    }
    long long v26 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10072015C();
    }
LABEL_18:
    id v15 = 0;
    goto LABEL_19;
  }
  uint64_t v14 = [v13 registeredKTData];

  if (!v14)
  {
    long long v26 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1007200F4();
    }
    goto LABEL_18;
  }
  id v15 = objc_alloc_init((Class)IDSKTRegistrationData);
  uint64_t v16 = [v13 registeredKTData];
  uint64_t v17 = [v16 ktDataForRegistration];
  id v18 = [v17 copy];
  [v15 setKtDataForRegistration:v18];

  BOOL v19 = [v13 registeredKTData];
  v20 = [v19 ktPublicAccountKey];
  id v21 = [v20 copy];
  [v15 setKtPublicAccountKey:v21];

  BOOL v22 = [v13 registeredKTData];
  long long v23 = [v22 ktDataSignature];
  id v24 = [v23 copy];
  [v15 setKtDataSignature:v24];

  long long v25 = [v13 registeredKTData];
LABEL_13:
  long long v26 = v25;
  objc_msgSend(v15, "setUploadedToKVS:", -[NSObject uploadedToKVS](v25, "uploadedToKVS"));
LABEL_19:

  return v15;
}

- (void)loadKTRegistrationDatasWithShouldGenerateKTData:(BOOL *)a3
{
  int v4 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trying to load KT Registration Data from keychain.", buf, 2u);
  }

  int v5 = 0;
  char v34 = 0;
  v35 = self;
  do
  {
    uint64_t v6 = objc_alloc_init(IDSKTRegistrationDataConfig);
    identityDataSource = self->_identityDataSource;
    id v39 = 0;
    uint64_t v8 = [(IDSRegistrationKeyManagerIdentityDataSource *)identityDataSource loadKTRegistrationDataForKeyIndex:(unsigned __int16)v5 isRegistered:0 error:&v39];
    id v9 = v39;
    v10 = v9;
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 0;
    }
    if (!v11)
    {
      v12 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        int v41 = v5;
        __int16 v42 = 2112;
        id v43 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No unregistered KT data stored in keychain for keyIndex. { keyIndex: %u, error: %@ }", buf, 0x12u);
      }
    }
    v13 = self->_identityDataSource;
    id v38 = 0;
    uint64_t v14 = [(IDSRegistrationKeyManagerIdentityDataSource *)v13 loadKTRegistrationDataForKeyIndex:(unsigned __int16)v5 isRegistered:1 error:&v38];
    id v15 = v38;
    uint64_t v16 = v15;
    if (v14 && !v15)
    {
      if (v8)
      {
        BOOL v17 = 1;
        goto LABEL_19;
      }
      goto LABEL_32;
    }
    id v18 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v41 = v5;
      __int16 v42 = 2112;
      id v43 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No registered KT data stored in keychain for keyIndex. { keyIndex: %u, error: %@ }", buf, 0x12u);
    }

    BOOL v17 = v14 != 0;
    if (v8 | v14)
    {
      if (v8)
      {
LABEL_19:
        id v19 = objc_alloc((Class)IDSKTRegistrationData);
        id v37 = 0;
        id v20 = [v19 initWithDataRepresentation:v8 error:&v37];
        id v21 = v37;
        BOOL v22 = +[IDSFoundationLog KeyTransparency];
        long long v23 = v22;
        if (v20)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v41 = v5;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Successfully deserialized unregistered KT Data from keychain for keyIndex, saving to config. { keyIndex: %u }", buf, 8u);
          }

          [(IDSKTRegistrationDataConfig *)v6 setUnregisteredKTData:v20];
        }
        else
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109378;
            int v41 = v5;
            __int16 v42 = 2112;
            id v43 = v21;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to deserialize unregisterd KT Data from keychain for keyIndex, need to generate new KT Data. { keyIndex: %u, error: %@ }", buf, 0x12u);
          }

          char v34 = 1;
        }

        if (!v17) {
          goto LABEL_40;
        }
        goto LABEL_32;
      }
      if (!v14)
      {
LABEL_40:
        self = v35;
        serviceIndexToKTRegDataConfigs = v35->_serviceIndexToKTRegDataConfigs;
        long long v26 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)v5];
        [(NSMutableDictionary *)serviceIndexToKTRegDataConfigs setObject:v6 forKeyedSubscript:v26];
        goto LABEL_41;
      }
LABEL_32:
      id v27 = objc_alloc((Class)IDSKTRegistrationData);
      id v36 = 0;
      id v28 = [v27 initWithDataRepresentation:v14 error:&v36];
      id v29 = v36;
      id v30 = +[IDSFoundationLog KeyTransparency];
      v31 = v30;
      if (v28)
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v41 = v5;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Successfully deserialized registered KT Data from keychain for keyIndex, saving to config. { keyIndex: %u }", buf, 8u);
        }

        [(IDSKTRegistrationDataConfig *)v6 setRegisteredKTData:v28];
      }
      else
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          int v41 = v5;
          __int16 v42 = 2112;
          id v43 = v29;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to deserialize registerd KT Data from keychain for keyIndex, need to generate new KT Data. { keyIndex: %u, error: %@ }", buf, 0x12u);
        }

        char v34 = 1;
      }

      goto LABEL_40;
    }
    id v24 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v41 = v5;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No KT data found in keychain, we need to generate a new one for keyIndex. { keyIndex: %u }", buf, 8u);
    }

    long long v25 = self->_serviceIndexToKTRegDataConfigs;
    long long v26 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)v5];
    [(NSMutableDictionary *)v25 setObject:v6 forKeyedSubscript:v26];
    char v34 = 1;
LABEL_41:

    ++v5;
  }
  while (v5 != 4);
  if (a3) {
    *a3 = v34 & 1;
  }
}

- (BOOL)serializeAndPersistKTDatasDeleteIfNull:(BOOL)a3
{
  BOOL v4 = a3;
  int v6 = 0;
  *(void *)&long long v3 = 67109120;
  long long v32 = v3;
  do
  {
    serviceIndexToKTRegDataConfigs = self->_serviceIndexToKTRegDataConfigs;
    uint64_t v8 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", (unsigned __int16)v6, v32);
    id v9 = [(NSMutableDictionary *)serviceIndexToKTRegDataConfigs objectForKeyedSubscript:v8];

    v10 = [v9 registeredKTData];

    if (v10)
    {
      BOOL v11 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [v9 registeredKTData];
        *(_DWORD *)buf = 67109378;
        int v40 = v6;
        __int16 v41 = 2112;
        __int16 v42 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Saving registered KT Data for service key { keyIndex: %u, registeredKTData: %@ }", buf, 0x12u);
      }
      v13 = [v9 registeredKTData];
      id v38 = 0;
      uint64_t v14 = [v13 dataRepresentationWithError:&v38];
      id v15 = v38;

      if (v14)
      {
        identityDataSource = self->_identityDataSource;
        uint64_t v37 = 0;
        [(IDSRegistrationKeyManagerIdentityDataSource *)identityDataSource saveKTRegistrationData:v14 forKeyIndex:(unsigned __int16)v6 isRegistered:1 error:&v37];
      }
    }
    else
    {
      BOOL v17 = [v9 registeredKTData];

      if (v17) {
        BOOL v18 = 1;
      }
      else {
        BOOL v18 = !v4;
      }
      if (!v18)
      {
        id v19 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v32;
          int v40 = v6;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Removing registered KT Data from keychain because deleteIfNull == YES and no registered config present, {keyIndex: %u}", buf, 8u);
        }

        id v20 = self->_identityDataSource;
        uint64_t v36 = 0;
        [(IDSRegistrationKeyManagerIdentityDataSource *)v20 removeKTRegistrationDataForKeyIndex:(unsigned __int16)v6 isRegistered:1 error:&v36];
      }
    }
    id v21 = [v9 unregisteredKTData];

    if (v21)
    {
      BOOL v22 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        long long v23 = [v9 unregisteredKTData];
        *(_DWORD *)buf = 67109378;
        int v40 = v6;
        __int16 v41 = 2112;
        __int16 v42 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Saving unregistered KT Data for service key { keyIndex: %u, unregisteredKTData: %@ }", buf, 0x12u);
      }
      id v24 = [v9 unregisteredKTData];
      id v35 = 0;
      long long v25 = [v24 dataRepresentationWithError:&v35];
      id v26 = v35;

      if (v25)
      {
        id v27 = self->_identityDataSource;
        uint64_t v34 = 0;
        [(IDSRegistrationKeyManagerIdentityDataSource *)v27 saveKTRegistrationData:v25 forKeyIndex:(unsigned __int16)v6 isRegistered:0 error:&v34];
      }
    }
    else
    {
      id v28 = [v9 unregisteredKTData];

      if (!v28 && v4)
      {
        id v29 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v32;
          int v40 = v6;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Removing unregistered KT Data from keychain because deleteIfNull == YES and no registered config present, {keyIndex: %u}", buf, 8u);
        }

        id v30 = self->_identityDataSource;
        uint64_t v33 = 0;
        [(IDSRegistrationKeyManagerIdentityDataSource *)v30 removeKTRegistrationDataForKeyIndex:(unsigned __int16)v6 isRegistered:0 error:&v33];
      }
    }

    ++v6;
  }
  while (v6 != 4);
  return 1;
}

- (BOOL)notePublicIdentityDidRegisterKTData:(id)a3 forKeyIndex:(unsigned __int16)a4
{
  uint64_t v5 = a4;
  id v7 = a3;
  uint64_t v8 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 ktDataForRegistration];
    v10 = [v7 ktPublicAccountKey];
    BOOL v4 = [v7 ktDataSignature];
    *(_DWORD *)buf = 67109890;
    int v76 = v5;
    __int16 v77 = 2112;
    v78 = v9;
    __int16 v79 = 2112;
    v80 = v10;
    __int16 v81 = 2112;
    v82 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "KT registration manager noting registration of data { keyIndex: %u, ktDataForRegistration: %@, ktPublicAccountKey: %@, ktDataSignature: %@ }", buf, 0x26u);
  }
  serviceIndexToKTRegDataConfigs = self->_serviceIndexToKTRegDataConfigs;
  v12 = +[NSNumber numberWithUnsignedShort:v5];
  v13 = [(NSMutableDictionary *)serviceIndexToKTRegDataConfigs objectForKeyedSubscript:v12];

  if (!v13)
  {
    uint64_t v14 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1007201C4();
    }
    goto LABEL_48;
  }
  uint64_t v14 = [v13 unregisteredKTData];
  if (!v14)
  {
    id v15 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100720294();
    }

    uint64_t v14 = [v13 registeredKTData];
    if (!v14)
    {
      uint64_t v14 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10072022C();
      }
      goto LABEL_48;
    }
  }
  uint64_t v16 = [v14 registeredTime];

  if (!v16)
  {
    BOOL v17 = +[NSDate now];
    [v14 setRegisteredTime:v17];
  }
  if (v5 == 1) {
    [(IDSKTRegistrationDataManager *)self logIDSKTRegMetrics:v7 expectedRegisteredData:v14 forKeyIndex:1];
  }
  v73 = self;
  BOOL v18 = [v14 ktDataForRegistration];
  if (v18 || ([v7 ktDataForRegistration], (BOOL v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v19 = [v14 ktDataForRegistration];
    id v20 = [v7 ktDataForRegistration];
    unsigned int v21 = [v19 isEqualToData:v20];

    if (v18)
    {

      if (!v21) {
        goto LABEL_45;
      }
    }
    else
    {

      if ((v21 & 1) == 0) {
        goto LABEL_45;
      }
    }
  }
  BOOL v22 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [v7 ktDataForRegistration];
    *(_DWORD *)buf = 67109378;
    int v76 = v5;
    __int16 v77 = 2112;
    v78 = v4;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Expected KT Data for registration matches what was registered for keyIndex. { keyIndex: %u, expectedKTData: %@ }", buf, 0x12u);
  }
  long long v23 = [v14 ktPublicAccountKey];
  if (v23 || ([v7 ktPublicAccountKey], (BOOL v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v24 = [v14 ktPublicAccountKey];
    long long v25 = [v7 ktPublicAccountKey];
    unsigned int v26 = [v24 isEqualToData:v25];

    if (v23)
    {

      if (!v26) {
        goto LABEL_45;
      }
    }
    else
    {

      if ((v26 & 1) == 0) {
        goto LABEL_45;
      }
    }
  }
  id v27 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [v14 ktPublicAccountKey];
    *(_DWORD *)buf = 67109378;
    int v76 = v5;
    __int16 v77 = 2112;
    v78 = v4;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Expected KT public account key for registrations matches what we registered for keyIndex. { keyIndex: %u, expectedKTPublicAccountKey: %@ }", buf, 0x12u);
  }
  id v28 = [v14 ktDataSignature];
  if (v28 || ([v7 ktDataSignature], (BOOL v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v29 = [v14 ktDataSignature];
    id v30 = [v7 ktDataSignature];
    unsigned int v31 = [v29 isEqualToData:v30];

    if (v28)
    {

      if (v31) {
        goto LABEL_34;
      }
LABEL_45:
      v47 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v50 = [v14 ktDataForRegistration];
        v51 = [v14 ktPublicAccountKey];
        v52 = [v14 ktDataSignature];
        v74 = [v7 ktDataForRegistration];
        v53 = [v7 ktPublicAccountKey];
        v54 = [v7 ktDataSignature];
        *(_DWORD *)buf = 67110658;
        int v76 = v5;
        __int16 v77 = 2112;
        v78 = v50;
        __int16 v79 = 2112;
        v80 = v51;
        __int16 v81 = 2112;
        v82 = v52;
        __int16 v83 = 2112;
        v84 = v74;
        __int16 v85 = 2112;
        v86 = v53;
        __int16 v87 = 2112;
        v88 = v54;
        _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Completed registration does not match unregistered KT Data for key index { keyIndex: %u, expectedKTDataForRegistration: %@, expectedKTPublicAccountKey: %@, expectedKTDataSignature: %@, regKTDataForRegistration: %@, regKTPublicAccountKey: %@, regKTDataSignature: %@ }", buf, 0x44u);
      }
LABEL_48:
      BOOL v48 = 0;
      goto LABEL_49;
    }

    if ((v31 & 1) == 0) {
      goto LABEL_45;
    }
  }
LABEL_34:
  long long v32 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v33 = [v14 ktDataSignature];
    *(_DWORD *)buf = 67109378;
    int v76 = v5;
    __int16 v77 = 2112;
    v78 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Expected KT Data Signature for registrations matches what we registered for keyIndex. { keyIndex: %u, expectedKTDataSignature: %@ }", buf, 0x12u);
  }
  uint64_t v34 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    id v35 = [v14 ktDataForRegistration];
    uint64_t v36 = [v14 ktPublicAccountKey];
    uint64_t v37 = [v14 ktDataSignature];
    *(_DWORD *)buf = 67109890;
    int v76 = v5;
    __int16 v77 = 2112;
    v78 = v35;
    __int16 v79 = 2112;
    v80 = v36;
    __int16 v81 = 2112;
    v82 = v37;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Completed registration of previously unregistered KT Data for key index { keyIndex: %u, ktDataForRegistration: %@, ktPublicAccountKey: %@, ktDataSignature: %@ }", buf, 0x26u);
  }
  id v38 = [v13 registeredKTData];
  if (v38)
  {
    id v39 = [v13 registeredKTData];
    int v40 = [v39 ktDataForRegistration];
    if (v40)
    {
      __int16 v41 = [v13 registeredKTData];
      __int16 v42 = [v41 ktDataSignature];
      if (v42)
      {
        id v43 = [v13 registeredKTData];
        v44 = [v43 ktPublicAccountKey];
        v71 = v41;
        BOOL v45 = v44 != 0;

        BOOL v46 = v45;
        __int16 v41 = v71;
      }
      else
      {
        BOOL v46 = 0;
      }
    }
    else
    {
      BOOL v46 = 0;
    }
  }
  else
  {
    BOOL v46 = 0;
  }

  uint64_t v55 = [v13 unregisteredKTData];
  if (v55)
  {
    v56 = (void *)v55;
    v57 = [v13 unregisteredKTData];
    v58 = [v57 ktDataForRegistration];
    if (v58)
    {
      v72 = [v13 unregisteredKTData];
      v59 = [v72 ktDataSignature];
      if (v59)
      {
        [v13 unregisteredKTData];
        v60 = BOOL v70 = v46;
        v61 = [v60 ktPublicAccountKey];
        BOOL v62 = v61 != 0;

        BOOL v46 = v70;
      }
      else
      {
        BOOL v62 = 0;
      }
    }
    else
    {
      BOOL v62 = 0;
    }

    BOOL v63 = !v46;
    int v65 = !v62;
    if (v46 && (v65 & 1) == 0)
    {
      v66 = +[TransparencyAnalytics logger];
      [v66 logMetric:&off_1009D21D8 withName:@"kt-reg-state-change"];
      v64 = v73;
LABEL_74:

      goto LABEL_75;
    }
    v64 = v73;
    if (((v46 | v65) & 1) == 0)
    {
      v67 = +[TransparencyAnalytics logger];
      v66 = v67;
      v68 = &off_1009D21F0;
      goto LABEL_73;
    }
  }
  else
  {
    BOOL v62 = 0;
    BOOL v63 = !v46;
    v64 = v73;
  }
  if (!v63 && !v62)
  {
    v67 = +[TransparencyAnalytics logger];
    v66 = v67;
    v68 = &off_1009D2208;
LABEL_73:
    [v67 logMetric:v68 withName:@"kt-reg-state-change"];
    goto LABEL_74;
  }
  if (!v46 && !v62)
  {
    v67 = +[TransparencyAnalytics logger];
    v66 = v67;
    v68 = &off_1009D2220;
    goto LABEL_73;
  }
LABEL_75:
  if (v5 == 1)
  {
    v69 = [v13 registeredKTData];
    [(IDSKTRegistrationDataManager *)v64 logKTRegistrationTimeMetricsForLatestRegisteredKTData:v14 lastRegisteredKTData:v69 forKeyIndex:1];
  }
  [v13 setRegisteredKTData:v14];
  [v13 setUnregisteredKTData:0];
  BOOL v48 = 1;
LABEL_49:

  return v48;
}

- (BOOL)needsPublicDataUpdatedForKeyIndex:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking if we have unregistered KT Data that is ready to register.", (uint8_t *)v22, 2u);
  }

  serviceIndexToKTRegDataConfigs = self->_serviceIndexToKTRegDataConfigs;
  id v7 = +[NSNumber numberWithUnsignedShort:v3];
  uint64_t v8 = [(NSMutableDictionary *)serviceIndexToKTRegDataConfigs objectForKeyedSubscript:v7];

  id v9 = [v8 unregisteredKTData];

  if (v9)
  {
    v10 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [v8 unregisteredKTData];
      v22[0] = 67109378;
      v22[1] = v3;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Found key index has unregistered KT Data { keyIndex: %u, unregisteredKTData: %@ }", (uint8_t *)v22, 0x12u);
    }
    v12 = [v8 unregisteredKTData];
    uint64_t v13 = [v12 ktDataForRegistration];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      id v15 = [v8 unregisteredKTData];
      uint64_t v16 = [v15 ktPublicAccountKey];
      if (v16)
      {
        BOOL v17 = (void *)v16;
        BOOL v18 = [v8 unregisteredKTData];
        id v19 = [v18 ktDataSignature];

        if (v19)
        {
          id v20 = +[IDSFoundationLog KeyTransparency];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v22[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Unregistered KT Data has necessary fields to register.", (uint8_t *)v22, 2u);
          }
          LOBYTE(v9) = 1;
LABEL_17:

          goto LABEL_18;
        }
LABEL_14:
        id v20 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v22[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Unregistered KT Data does not yet have necessary fields to register.", (uint8_t *)v22, 2u);
        }
        LOBYTE(v9) = 0;
        goto LABEL_17;
      }
    }
    goto LABEL_14;
  }
LABEL_18:

  return (char)v9;
}

- (id)createKTRegistrationDataForServiceTypes:(id)a3 usingPublicIdentityData:(id)a4 withApplicationKeyManager:(id)a5
{
  id v75 = a3;
  id v70 = a4;
  id v8 = a5;
  id v9 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v94 = v70;
    *(_WORD *)&v94[8] = 2112;
    *(void *)&v94[10] = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating KT Registration Data objects without async enrollment. {publicIdentity: %@, applicationKeyManager: %@}", buf, 0x16u);
  }

  id v10 = objc_alloc_init((Class)NSMutableSet);
  theDict = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obj = [v75 allKeys];
  id v11 = [obj countByEnumeratingWithState:&v89 objects:v96 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v90;
    *(void *)&long long v12 = 138412290;
    long long v65 = v12;
    id v15 = (void **)IMRGLog_ptr;
    id v78 = v8;
    v68 = v10;
    v69 = self;
    uint64_t v67 = *(void *)v90;
    do
    {
      uint64_t v16 = 0;
      id v71 = v13;
      do
      {
        if (*(void *)v90 != v14) {
          objc_enumerationMutation(obj);
        }
        key = *(void **)(*((void *)&v89 + 1) + 8 * (void)v16);
        BOOL v17 = [v75 objectForKeyedSubscript:v65];
        BOOL v18 = [(IDSKTRegistrationDataManager *)self serviceController];
        int v76 = v17;
        id v19 = [v17 serviceIdentifier];
        id v20 = [v18 serviceWithIdentifier:v19];

        unsigned int v21 = v20;
        if ([v20 adHocServiceType])
        {
          BOOL v22 = [(IDSKTRegistrationDataManager *)self serviceController];
          unsigned int v21 = objc_msgSend(v22, "primaryServiceForAdhocServiceType:", objc_msgSend(v20, "adHocServiceType"));
        }
        if ([v10 containsObject:key])
        {
          __int16 v23 = +[IDSFoundationLog KeyTransparency];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            id v24 = [v21 identifier];
            *(_DWORD *)buf = v65;
            *(void *)v94 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Top level service already has relevant KT Data setup. { service: %@ }", buf, 0xCu);
          }
          goto LABEL_41;
        }
        v74 = v16;
        long long v25 = objc_alloc_init(IDSProtoKeyTransparencyLoggableData);
        unsigned int v26 = v21;
        id v27 = [v70 publicNGMIdentityData];
        [(IDSProtoKeyTransparencyLoggableData *)v25 setNgmPublicIdentity:v27];

        id v28 = [v70 NGMVersion];
        -[IDSProtoKeyTransparencyLoggableData setNgmVersion:](v25, "setNgmVersion:", [v28 unsignedIntValue]);

        id v29 = _IDSKeyTransparencyVersionNumber();
        __int16 v79 = v25;
        -[IDSProtoKeyTransparencyLoggableData setKtVersion:](v25, "setKtVersion:", [v29 unsignedIntValue]);

        id v30 = objc_alloc_init((Class)NSMutableSet);
        unsigned int v31 = self;
        long long v32 = v30;
        uint64_t v33 = [(IDSKTRegistrationDataManager *)v31 serviceController];
        uint64_t v34 = [v21 identifier];
        id v35 = [v33 adHocServicesForIdentifier:v34];
        v73 = v26;
        uint64_t v36 = [v35 arrayByAddingObject:v26];

        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        id v37 = v36;
        id v38 = [v37 countByEnumeratingWithState:&v85 objects:v95 count:16];
        if (!v38) {
          goto LABEL_38;
        }
        id v39 = v38;
        uint64_t v40 = *(void *)v86;
        v80 = v32;
        id v81 = v37;
        do
        {
          __int16 v41 = 0;
          do
          {
            if (*(void *)v86 != v40) {
              objc_enumerationMutation(v37);
            }
            __int16 v42 = *(void **)(*((void *)&v85 + 1) + 8 * (void)v41);
            if ([v42 applicationKeyIndex])
            {
              id v43 = objc_msgSend(v15[62], "numberWithUnsignedShort:", objc_msgSend(v42, "applicationKeyIndex"));
              unsigned __int8 v44 = [v32 containsObject:v43];

              if ((v44 & 1) == 0)
              {
                id v45 = [v42 applicationKeyIndex];
                id v84 = 0;
                BOOL v46 = (__SecKey *)[v8 copyPublicIdentityDataToRegisterForKeyIndex:v45 withError:&v84];
                id v47 = v84;
                BOOL v48 = v47;
                if (v46)
                {
                  id v82 = v47;
                  CFErrorRef error = 0;
                  v49 = v15;
                  CFDataRef v50 = SecKeyCopyExternalRepresentation(v46, &error);
                  v51 = +[IDSFoundationLog KeyTransparency];
                  v52 = v51;
                  if (v50)
                  {
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                    {
                      unsigned int v53 = [v42 applicationKeyIndex];
                      v54 = [v42 identifier];
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v94 = v53;
                      id v8 = v78;
                      *(_WORD *)&v94[4] = 2112;
                      *(void *)&v94[6] = v54;
                      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Adding application key %u to kt-loggable-data for service: %@", buf, 0x12u);
                    }
                    v52 = objc_alloc_init(IDSProtoApplicationKeyEntry);
                    -[NSObject setKeyIndex:](v52, "setKeyIndex:", sub_10030C080((int)[v42 applicationKeyIndex]));
                    [v52 setPublicIdentity:v50];

                    [v79 addApplicationPublicIdentity:v52];
                    id v15 = v49;
                    uint64_t v55 = objc_msgSend(v49[62], "numberWithUnsignedShort:", objc_msgSend(v42, "applicationKeyIndex"));
                    long long v32 = v80;
                    [v80 addObject:v55];
LABEL_25:
                  }
                  else
                  {
                    id v15 = v49;
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                    {
                      unsigned int v59 = [v42 applicationKeyIndex];
                      CFErrorRef v60 = error;
                      uint64_t v55 = [v42 identifier];
                      *(_DWORD *)buf = 67109634;
                      *(_DWORD *)v94 = v59;
                      long long v32 = v80;
                      *(_WORD *)&v94[4] = 2112;
                      *(void *)&v94[6] = v60;
                      id v8 = v78;
                      *(_WORD *)&v94[14] = 2112;
                      *(void *)&v94[16] = v55;
                      _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Failed to get representation of application key { keyType: %u, error: %@, service: %@ }", buf, 0x1Cu);
                      goto LABEL_25;
                    }
                  }
                  BOOL v48 = v82;

                  CFRelease(v46);
                  if (error) {
                    CFRelease(error);
                  }
                  id v37 = v81;
                }
                else
                {
                  v56 = +[IDSFoundationLog KeyTransparency];
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    unsigned int v57 = [v42 applicationKeyIndex];
                    v58 = [v42 identifier];
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v94 = v57;
                    long long v32 = v80;
                    *(_WORD *)&v94[4] = 2112;
                    *(void *)&v94[6] = v58;
                    _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Failed to get service application key { keyType: %u, service: %@ }", buf, 0x12u);
                  }
                }
              }
            }
            __int16 v41 = (char *)v41 + 1;
          }
          while (v39 != v41);
          id v61 = [v37 countByEnumeratingWithState:&v85 objects:v95 count:16];
          id v39 = v61;
        }
        while (v61);
LABEL_38:

        id v62 = objc_alloc_init((Class)IDSKTRegistrationData);
        __int16 v23 = v79;
        BOOL v63 = [v79 data];
        [v62 setKtDataForRegistration:v63];

        id v10 = v68;
        if (v62) {
          CFDictionarySetValue(theDict, key, v62);
        }
        [v68 addObject:key];

        self = v69;
        uint64_t v14 = v67;
        id v13 = v71;
        unsigned int v21 = v73;
        uint64_t v16 = v74;
LABEL_41:

        uint64_t v16 = (char *)v16 + 1;
      }
      while (v16 != v13);
      id v13 = [obj countByEnumeratingWithState:&v89 objects:v96 count:16];
    }
    while (v13);
  }

  return theDict;
}

- (BOOL)requestGenerationOfUnregisteredKTRegDataWithPublicIdentityData:(id)a3 applicationKeyManager:(id)a4
{
  id v77 = a3;
  id v6 = a4;
  id v7 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating request for KT registration data.", buf, 2u);
  }

  id v8 = [(IDSKTRegistrationDataManager *)self serviceController];
  id v9 = [v8 allPrimaryServices];

  id v10 = objc_alloc_init((Class)NSMutableSet);
  id v73 = objc_alloc_init((Class)NSMutableDictionary);
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id obj = v9;
  id v11 = [obj countByEnumeratingWithState:&v93 objects:v102 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v94;
    id v82 = v6;
    id v75 = v10;
    int v76 = self;
    uint64_t v74 = *(void *)v94;
    do
    {
      uint64_t v14 = 0;
      id v78 = v12;
      do
      {
        if (*(void *)v94 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v93 + 1) + 8 * (void)v14);
        uint64_t v16 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v15 ktRegistrationDataIndex]);
        unsigned __int8 v17 = [v10 containsObject:v16];

        if (v17)
        {
          BOOL v18 = +[IDSFoundationLog KeyTransparency];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = [v15 identifier];
            *(_DWORD *)buf = 138412290;
            *(void *)v98 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Top level service already has relevant KT Data setup. { service: %@ }", buf, 0xCu);
          }
        }
        else
        {
          v80 = v14;
          id v20 = objc_alloc_init(IDSProtoKeyTransparencyLoggableData);
          unsigned int v21 = [v77 publicNGMIdentityData];
          [(IDSProtoKeyTransparencyLoggableData *)v20 setNgmPublicIdentity:v21];

          BOOL v22 = [v77 NGMVersion];
          -[IDSProtoKeyTransparencyLoggableData setNgmVersion:](v20, "setNgmVersion:", [v22 unsignedIntValue]);

          __int16 v23 = _IDSKeyTransparencyVersionNumber();
          __int16 v83 = v20;
          -[IDSProtoKeyTransparencyLoggableData setKtVersion:](v20, "setKtVersion:", [v23 unsignedIntValue]);

          id v24 = objc_alloc_init((Class)NSMutableSet);
          long long v25 = [(IDSKTRegistrationDataManager *)self serviceController];
          [v15 identifier];
          v27 = unsigned int v26 = v15;
          id v28 = [v25 adHocServicesForIdentifier:v27];
          id v81 = v26;
          id v29 = [v28 arrayByAddingObject:v26];

          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          id v85 = v29;
          id v30 = [v85 countByEnumeratingWithState:&v89 objects:v101 count:16];
          unsigned int v31 = IMRGLog_ptr;
          id v84 = v24;
          if (v30)
          {
            id v32 = v30;
            uint64_t v33 = *(void *)v90;
            do
            {
              for (i = 0; i != v32; i = (char *)i + 1)
              {
                if (*(void *)v90 != v33) {
                  objc_enumerationMutation(v85);
                }
                id v35 = *(void **)(*((void *)&v89 + 1) + 8 * i);
                if ([v35 applicationKeyIndex])
                {
                  uint64_t v36 = objc_msgSend(v31[62], "numberWithUnsignedShort:", objc_msgSend(v35, "applicationKeyIndex"));
                  unsigned __int8 v37 = [v24 containsObject:v36];

                  if ((v37 & 1) == 0)
                  {
                    id v38 = [v35 applicationKeyIndex];
                    id v88 = 0;
                    id v39 = (__SecKey *)[v6 copyPublicIdentityDataToRegisterForKeyIndex:v38 withError:&v88];
                    id v40 = v88;
                    if (v39)
                    {
                      CFErrorRef error = 0;
                      CFDataRef v41 = SecKeyCopyExternalRepresentation(v39, &error);
                      __int16 v42 = +[IDSFoundationLog KeyTransparency];
                      id v43 = v42;
                      if (v41)
                      {
                        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                        {
                          unsigned int v44 = [v35 applicationKeyIndex];
                          id v45 = [v35 identifier];
                          *(_DWORD *)buf = 67109378;
                          *(_DWORD *)v98 = v44;
                          id v6 = v82;
                          *(_WORD *)&v98[4] = 2112;
                          *(void *)&v98[6] = v45;
                          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Adding application key %u to kt-loggable-data for service: %@", buf, 0x12u);
                        }
                        id v43 = objc_alloc_init(IDSProtoApplicationKeyEntry);
                        -[NSObject setKeyIndex:](v43, "setKeyIndex:", sub_10030C080((int)[v35 applicationKeyIndex]));
                        [v43 setPublicIdentity:v41];

                        [v83 addApplicationPublicIdentity:v43];
                        unsigned int v31 = IMRGLog_ptr;
                        BOOL v46 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v35 applicationKeyIndex]);
                        [v84 addObject:v46];
                      }
                      else
                      {
                        unsigned int v31 = IMRGLog_ptr;
                        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                        {
                          unsigned int v50 = [v35 applicationKeyIndex];
                          CFErrorRef v51 = error;
                          v52 = [v35 identifier];
                          *(_DWORD *)buf = 67109634;
                          *(_DWORD *)v98 = v50;
                          *(_WORD *)&v98[4] = 2112;
                          *(void *)&v98[6] = v51;
                          id v6 = v82;
                          __int16 v99 = 2112;
                          v100 = v52;
                          _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failed to get representation of application key { keyType: %u, error: %@, service: %@ }", buf, 0x1Cu);
                        }
                      }

                      CFRelease(v39);
                      if (error) {
                        CFRelease(error);
                      }
                      id v24 = v84;
                    }
                    else
                    {
                      id v47 = +[IDSFoundationLog KeyTransparency];
                      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                      {
                        unsigned int v48 = [v35 applicationKeyIndex];
                        v49 = [v35 identifier];
                        *(_DWORD *)buf = 67109378;
                        *(_DWORD *)v98 = v48;
                        id v24 = v84;
                        *(_WORD *)&v98[4] = 2112;
                        *(void *)&v98[6] = v49;
                        _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Failed to get service application key { keyType: %u, service: %@ }", buf, 0x12u);
                      }
                    }
                  }
                }
              }
              id v32 = [v85 countByEnumeratingWithState:&v89 objects:v101 count:16];
            }
            while (v32);
          }

          id v53 = objc_alloc_init((Class)IDSKTRegistrationData);
          v54 = [v83 data];
          [v53 setKtDataForRegistration:v54];

          uint64_t v55 = -[IDSKTRegistrationDataManager _ktApplicationForKTRegistrationIndex:](v76, "_ktApplicationForKTRegistrationIndex:", [v81 ktRegistrationDataIndex]);
          if (v55
            && ([v53 ktDataForRegistration],
                v56 = objc_claimAutoreleasedReturnValue(),
                v56,
                v56))
          {
            id v57 = objc_alloc((Class)TransparencyIDSRegistrationRequestData);
            v58 = [v53 ktDataForRegistration];
            unsigned int v59 = [v57 initWithApplication:v55 registrationData:v58];

            CFErrorRef v60 = +[IDSPushHandler sharedInstance];
            id v61 = [v60 pushToken];
            [v59 setPushToken:v61];

            id v6 = v82;
            [v73 setObject:v59 forKeyedSubscript:v55];
            id v10 = v75;
            uint64_t v14 = v80;
          }
          else
          {
            unsigned int v59 = +[IDSFoundationLog KeyTransparency];
            id v10 = v75;
            uint64_t v14 = v80;
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              unsigned int v66 = [v81 ktRegistrationDataIndex];
              uint64_t v67 = [v53 ktDataForRegistration];
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v98 = v66;
              *(_WORD *)&v98[4] = 2112;
              *(void *)&v98[6] = v67;
              _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "No KT Application found for key index or registration data is null. { keyIndex: %u, ktRegistrationData: %@ }", buf, 0x12u);

              id v6 = v82;
            }
          }

          serviceIndexToKTRegDataConfigs = v76->_serviceIndexToKTRegDataConfigs;
          BOOL v63 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v81 ktRegistrationDataIndex]);
          v64 = [(NSMutableDictionary *)serviceIndexToKTRegDataConfigs objectForKeyedSubscript:v63];

          [v64 setUnregisteredKTData:v53];
          self = v76;
          long long v65 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v81 ktRegistrationDataIndex]);
          [v10 addObject:v65];

          id v12 = v78;
          BOOL v18 = v83;
          uint64_t v13 = v74;
        }

        uint64_t v14 = (char *)v14 + 1;
      }
      while (v14 != v12);
      id v12 = [obj countByEnumeratingWithState:&v93 objects:v102 count:16];
    }
    while (v12);
  }

  if (+[IMUserDefaults shouldDropKTAccountKeySignatureRequestOnLaunch]&& CUTIsInternalInstall())
  {
    v68 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Default is set to drop account key signature generation request. This is not the path that's hit during registration.", buf, 2u);
    }

    [v73 removeAllObjects];
  }
  if (!+[IDSKeyTransparencyVerifier isKeyTransparencyEnabled])
  {
    v69 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      sub_100709BD4();
    }

    [v73 removeAllObjects];
  }
  if ([v73 count])
  {
    id v70 = [objc_alloc((Class)TransparencyIDSRegistrationRequest) initWithSignatureRequests:v73];
    [v70 setInitialTimeout:10.0];
    if (objc_opt_respondsToSelector()) {
      [v70 setDontWaitForKeySigning:1];
    }
    transparencyDaemon = self->_transparencyDaemon;
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_1003CBAB4;
    v86[3] = &unk_10098B330;
    v86[4] = self;
    [(TransparencyDaemon *)transparencyDaemon transparencyGetKTSignatures:v70 complete:v86];
  }
  else
  {
    id v70 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      sub_1007202FC();
    }
  }

  return 0;
}

- (void)fetchKTSignatureDataForServiceTypes:(id)a3 publicIdentityData:(id)a4 applicationKeyManager:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v99 = a4;
  id v11 = a5;
  id v91 = a6;
  id v12 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v129 = v99;
    *(_WORD *)&v129[8] = 2112;
    *(void *)&v129[10] = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Creating KT Registration Data objects. {publicIdentity: %@, applicationKeyManager: %@}", buf, 0x16u);
  }

  id v13 = objc_alloc_init((Class)NSMutableSet);
  theDict = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v98 = objc_alloc_init((Class)NSMutableSet);
  id v92 = objc_alloc_init((Class)NSMutableDictionary);
  [(IDSKTRegistrationDataManager *)self clearKTDatas];
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id obj = [v10 allKeys];
  id v14 = [obj countByEnumeratingWithState:&v123 objects:v131 count:16];
  v106 = v11;
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v124;
    unsigned __int8 v17 = (void **)IMRGLog_ptr;
    long long v96 = self;
    id v97 = v10;
    uint64_t v94 = *(void *)v124;
    long long v95 = v13;
    do
    {
      id v18 = 0;
      id v100 = v15;
      do
      {
        if (*(void *)v124 != v16) {
          objc_enumerationMutation(obj);
        }
        v104 = (char *)v18;
        id v19 = *(void **)(*((void *)&v123 + 1) + 8 * (void)v18);
        id v20 = [v10 objectForKeyedSubscript:v19];
        unsigned int v21 = [(IDSKTRegistrationDataManager *)self serviceController];
        v103 = v20;
        BOOL v22 = [v20 serviceIdentifier];
        __int16 v23 = [v21 serviceWithIdentifier:v22];

        if ([v23 adHocServiceType])
        {
          id v24 = [(IDSKTRegistrationDataManager *)self serviceController];
          uint64_t v25 = objc_msgSend(v24, "primaryServiceForAdhocServiceType:", objc_msgSend(v23, "adHocServiceType"));

          v105 = (void *)v25;
        }
        else
        {
          v105 = v23;
        }
        unsigned int v26 = v106;
        if (([v13 containsObject:v19] & 1) == 0)
        {
          key = v19;
          id v30 = objc_alloc_init(IDSProtoKeyTransparencyLoggableData);
          unsigned int v31 = [v99 publicNGMIdentityData];
          [(IDSProtoKeyTransparencyLoggableData *)v30 setNgmPublicIdentity:v31];

          id v32 = [v99 NGMVersion];
          -[IDSProtoKeyTransparencyLoggableData setNgmVersion:](v30, "setNgmVersion:", [v32 unsignedIntValue]);

          uint64_t v33 = _IDSKeyTransparencyVersionNumber();
          v107 = v30;
          -[IDSProtoKeyTransparencyLoggableData setKtVersion:](v30, "setKtVersion:", [v33 unsignedIntValue]);

          id v34 = objc_alloc_init((Class)NSMutableSet);
          id v35 = [(IDSKTRegistrationDataManager *)self serviceController];
          uint64_t v36 = [v105 identifier];
          unsigned __int8 v37 = [v35 adHocServicesForIdentifier:v36];
          id v38 = [v37 arrayByAddingObject:v105];

          long long v122 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          long long v119 = 0u;
          id v39 = v38;
          id v40 = [v39 countByEnumeratingWithState:&v119 objects:v130 count:16];
          v108 = v39;
          if (v40)
          {
            id v41 = v40;
            uint64_t v42 = *(void *)v120;
            v109 = v34;
            do
            {
              id v43 = 0;
              do
              {
                if (*(void *)v120 != v42) {
                  objc_enumerationMutation(v39);
                }
                unsigned int v44 = *(void **)(*((void *)&v119 + 1) + 8 * (void)v43);
                if ([v44 applicationKeyIndex])
                {
                  id v45 = objc_msgSend(v17[62], "numberWithUnsignedShort:", objc_msgSend(v44, "applicationKeyIndex"));
                  unsigned __int8 v46 = [v34 containsObject:v45];

                  if ((v46 & 1) == 0)
                  {
                    id v47 = [v44 applicationKeyIndex];
                    id v118 = 0;
                    unsigned int v48 = (__SecKey *)[v26 copyPublicIdentityDataToRegisterForKeyIndex:v47 withError:&v118];
                    id v49 = v118;
                    unsigned int v50 = v49;
                    if (v48)
                    {
                      id v110 = v49;
                      CFErrorRef v51 = v17;
                      CFErrorRef error = 0;
                      CFDataRef v52 = SecKeyCopyExternalRepresentation(v48, &error);
                      id v53 = +[IDSFoundationLog KeyTransparency];
                      v54 = v53;
                      if (v52)
                      {
                        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                        {
                          unsigned int v55 = [v44 applicationKeyIndex];
                          v56 = [v44 identifier];
                          *(_DWORD *)buf = 67109378;
                          *(_DWORD *)v129 = v55;
                          unsigned int v26 = v106;
                          *(_WORD *)&v129[4] = 2112;
                          *(void *)&v129[6] = v56;
                          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Adding application key %u to kt-loggable-data for service: %@", buf, 0x12u);
                        }
                        v54 = objc_alloc_init(IDSProtoApplicationKeyEntry);
                        -[NSObject setKeyIndex:](v54, "setKeyIndex:", sub_10030C080((int)[v44 applicationKeyIndex]));
                        [v54 setPublicIdentity:v52];

                        [v107 addApplicationPublicIdentity:v54];
                        unsigned __int8 v17 = v51;
                        id v57 = objc_msgSend(v51[62], "numberWithUnsignedShort:", objc_msgSend(v44, "applicationKeyIndex"));
                        [v109 addObject:v57];

                        id v39 = v108;
                      }
                      else if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                      {
                        unsigned int v61 = [v44 applicationKeyIndex];
                        CFErrorRef v62 = error;
                        BOOL v63 = [v44 identifier];
                        *(_DWORD *)buf = 67109634;
                        *(_DWORD *)v129 = v61;
                        id v39 = v108;
                        *(_WORD *)&v129[4] = 2112;
                        *(void *)&v129[6] = v62;
                        unsigned __int8 v17 = v51;
                        *(_WORD *)&v129[14] = 2112;
                        *(void *)&v129[16] = v63;
                        _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Failed to get representation of application key { keyType: %u, error: %@, service: %@ }", buf, 0x1Cu);

                        unsigned int v26 = v106;
                      }
                      else
                      {
                        unsigned __int8 v17 = v51;
                      }

                      CFRelease(v48);
                      unsigned int v50 = v110;
                      if (error) {
                        CFRelease(error);
                      }
                      id v34 = v109;
                    }
                    else
                    {
                      v58 = +[IDSFoundationLog KeyTransparency];
                      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                      {
                        unsigned int v59 = [v44 applicationKeyIndex];
                        CFErrorRef v60 = [v44 identifier];
                        *(_DWORD *)buf = 67109378;
                        *(_DWORD *)v129 = v59;
                        id v39 = v108;
                        *(_WORD *)&v129[4] = 2112;
                        *(void *)&v129[6] = v60;
                        _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Failed to get service application key { keyType: %u, service: %@ }", buf, 0x12u);

                        unsigned int v26 = v106;
                      }
                    }
                  }
                }
                id v43 = (char *)v43 + 1;
              }
              while (v41 != v43);
              id v64 = [v39 countByEnumeratingWithState:&v119 objects:v130 count:16];
              id v41 = v64;
            }
            while (v64);
          }

          id v65 = objc_alloc_init((Class)IDSKTRegistrationData);
          unsigned int v66 = [v107 data];
          [v65 setKtDataForRegistration:v66];

          if (v65) {
            CFDictionarySetValue(theDict, key, v65);
          }
          id v13 = v95;
          [v95 addObject:key];
          self = v96;
          uint64_t v67 = -[IDSKTRegistrationDataManager _ktApplicationForKTRegistrationIndex:](v96, "_ktApplicationForKTRegistrationIndex:", [v105 ktRegistrationDataIndex]);
          if (v67
            && ([v65 ktDataForRegistration],
                v68 = objc_claimAutoreleasedReturnValue(),
                v68,
                v68))
          {
            v69 = v34;
            id v70 = objc_alloc((Class)TransparencyIDSRegistrationRequestData);
            id v71 = [v65 ktDataForRegistration];
            v72 = [v70 initWithApplication:v67 registrationData:v71];

            id v73 = +[IDSPushHandler sharedInstance];
            uint64_t v74 = [v73 pushToken];
            [v72 setPushToken:v74];

            [v92 setObject:v72 forKeyedSubscript:v67];
          }
          else
          {
            v72 = +[IDSFoundationLog KeyTransparency];
            v69 = v34;
            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            {
              unsigned int v81 = [v105 ktRegistrationDataIndex];
              id v82 = [v65 ktDataForRegistration];
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v129 = v81;
              *(_WORD *)&v129[4] = 2112;
              *(void *)&v129[6] = v82;
              _os_log_error_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "No KT Application found for key index or registration data is null. { keyIndex: %u, ktRegistrationData: %@ }", buf, 0x12u);
            }
          }

          serviceIndexToKTRegDataConfigs = v96->_serviceIndexToKTRegDataConfigs;
          id v28 = v105;
          int v76 = objc_msgSend(v17[62], "numberWithUnsignedShort:", objc_msgSend(v105, "ktRegistrationDataIndex"));
          id v77 = [(NSMutableDictionary *)serviceIndexToKTRegDataConfigs objectForKeyedSubscript:v76];

          [v77 setUnregisteredKTData:v65];
          id v78 = objc_msgSend(v17[62], "numberWithUnsignedShort:", objc_msgSend(v105, "ktRegistrationDataIndex"));
          [v98 addObject:v78];

          id v10 = v97;
          uint64_t v16 = v94;
          id v15 = v100;
          goto LABEL_47;
        }
        id v27 = +[IDSFoundationLog KeyTransparency];
        v107 = v27;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          id v28 = v105;
          id v29 = [v105 identifier];
          *(_DWORD *)buf = 138412290;
          *(void *)v129 = v29;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Top level service already has relevant KT Data setup. { service: %@ }", buf, 0xCu);

LABEL_47:
          v80 = v103;
          __int16 v79 = v104;
          goto LABEL_49;
        }
        v80 = v103;
        __int16 v79 = v104;
        id v28 = v105;
LABEL_49:

        id v18 = v79 + 1;
      }
      while (v18 != v15);
      id v15 = [obj countByEnumeratingWithState:&v123 objects:v131 count:16];
    }
    while (v15);
  }

  if (+[IMUserDefaults shouldDropKTAccountKeySignatureRequestDuringReg]&& CUTIsInternalInstall())
  {
    __int16 v83 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "Default is set to drop account key signature request during registration.", buf, 2u);
    }

    [v92 removeAllObjects];
  }
  if (!+[IDSKeyTransparencyVerifier isKeyTransparencyEnabled])
  {
    id v84 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
      sub_100709BD4();
    }

    [v92 removeAllObjects];
  }
  id v85 = [(IDSKTRegistrationDataManager *)self ktVerifier];
  uint64_t v127 = kKTApplicationIdentifierIDS;
  long long v86 = +[NSArray arrayWithObjects:&v127 count:1];
  v111[0] = _NSConcreteStackBlock;
  v111[1] = 3221225472;
  v111[2] = sub_1003CC874;
  v111[3] = &unk_10098B380;
  v112 = theDict;
  id v113 = v10;
  v114 = self;
  id v115 = v92;
  id v116 = v91;
  id v87 = v91;
  id v88 = v92;
  id v89 = v10;
  long long v90 = theDict;
  [v85 getOptInStatesForKTApplications:v86 withCompletion:v111];
}

- (BOOL)doesSignatureDSID:(id)a3 matchAccountDSID:(id)a4
{
  uint64_t v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    id v7 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = 0;
      __int16 v15 = 2112;
      id v16 = v6;
      id v8 = "Missing signature dsid. Falling back and using signature without dsid validation. { signatureDSID: %@, accountDSID: %@ }";
      goto LABEL_7;
    }
LABEL_8:
    LOBYTE(v9) = 1;
    goto LABEL_9;
  }
  if ([v5 containsString:@"-"])
  {
    id v7 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v6;
      id v8 = "Signature DSID appears to be malformed. Falling back and using signature without dsid validation. { signature"
           "DSID: %@, accountDSID: %@ }";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, 0x16u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v7 = v5;
  if (([v7 hasPrefix:@"D:"] & 1) == 0)
  {
    uint64_t v11 = [@"D:" stringByAppendingString:v7];

    id v7 = v11;
  }
  unsigned int v9 = [v6 isEqualToString:v7];
  if (v9)
  {
    id v12 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Signature DSID appears to match account dsid. { signatureDSID: %@, accountDSID: %@ }", (uint8_t *)&v13, 0x16u);
    }
  }
LABEL_9:

  return v9;
}

- (BOOL)handleTransparencySignatureResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling signature response from transparency.", buf, 2u);
  }

  unsigned int v9 = [(IDSKTRegistrationDataManager *)self accountController];
  unsigned int v10 = [v9 isiCloudSignedIn];

  uint64_t v11 = [(IDSKTRegistrationDataManager *)self systemMonitor];
  unsigned int v12 = [v11 isSetup];

  if (!v6)
  {
    int v68 = v12 ^ 1;
    if (((v10 ^ 1) & 1) != 0 || v68)
    {
      int v76 = v10 ^ 1 | v12;
      int v77 = v10 | v68;
      uint64_t v78 = -1004;
      uint64_t v79 = -1003;
      if (v10 | v12) {
        uint64_t v79 = -1000;
      }
      BOOL v80 = v77 == 1;
      if (v77 == 1) {
        unsigned int v81 = v10 | v12;
      }
      else {
        unsigned int v81 = 0;
      }
      if (v80) {
        uint64_t v78 = v79;
      }
      if (v76 == 1) {
        uint64_t v70 = v81;
      }
      else {
        uint64_t v70 = 1;
      }
      if (v76 == 1) {
        uint64_t v69 = v78;
      }
      else {
        uint64_t v69 = -1001;
      }
      if (v7) {
        goto LABEL_85;
      }
    }
    else
    {
      uint64_t v69 = -1002;
      uint64_t v70 = 1;
      if (v7)
      {
LABEL_85:
        NSErrorUserInfoKey v133 = NSUnderlyingErrorKey;
        id v134 = v7;
        uint64_t v71 = +[NSDictionary dictionaryWithObjects:&v134 forKeys:&v133 count:1];
LABEL_106:
        id obj = (id)v71;
        id v75 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"IDSKTRegistrationDataManagerErrorDomain", v69);
        id v82 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v83 = +[NSNumber numberWithInteger:v69];
          *(_DWORD *)buf = 138412802;
          *(void *)long long v125 = @"kt-sig-resp";
          *(_WORD *)&v125[8] = 2112;
          *(void *)&v125[10] = v83;
          *(_WORD *)&v125[18] = 2112;
          *(void *)&v125[20] = v75;
          _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Reporting KT metric { metricName: %@, errorCode: %@, error: %@ }", buf, 0x20u);
        }
        id v84 = +[TransparencyAnalytics logger];
        [v84 logResultForEvent:@"kt-sig-resp" hardFailure:v70 result:v75];

        id v85 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
          sub_100720330();
        }

        goto LABEL_140;
      }
    }
    uint64_t v71 = 0;
    goto LABEL_106;
  }
  int v13 = [v6 registrationData];
  id obj = v13;
  if (!v13)
  {
    int v72 = v12 ^ 1;
    if (((v10 ^ 1) & 1) != 0 || v72)
    {
      int v88 = v10 ^ 1 | v12;
      int v89 = v10 | v72;
      uint64_t v90 = -1014;
      uint64_t v91 = -1013;
      if (v10 | v12) {
        uint64_t v91 = -1000;
      }
      BOOL v92 = v89 == 1;
      if (v89 == 1) {
        unsigned int v93 = v10 | v12;
      }
      else {
        unsigned int v93 = 0;
      }
      if (v92) {
        uint64_t v90 = v91;
      }
      if (v88 == 1) {
        uint64_t v74 = v93;
      }
      else {
        uint64_t v74 = 1;
      }
      if (v88 == 1) {
        uint64_t v73 = v90;
      }
      else {
        uint64_t v73 = -1011;
      }
      if (v7) {
        goto LABEL_89;
      }
    }
    else
    {
      uint64_t v73 = -1012;
      uint64_t v74 = 1;
      if (v7)
      {
LABEL_89:
        NSErrorUserInfoKey v131 = NSUnderlyingErrorKey;
        id v132 = v7;
        id v75 = +[NSDictionary dictionaryWithObjects:&v132 forKeys:&v131 count:1];
LABEL_135:
        uint64_t v94 = +[NSError errorWithDomain:@"IDSKTRegistrationDataManagerErrorDomain" code:v73 userInfo:v75];
        long long v95 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          long long v96 = +[NSNumber numberWithInteger:v73];
          *(_DWORD *)buf = 138412802;
          *(void *)long long v125 = @"kt-sig-resp";
          *(_WORD *)&v125[8] = 2112;
          *(void *)&v125[10] = v96;
          *(_WORD *)&v125[18] = 2112;
          *(void *)&v125[20] = v94;
          _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "Reporting KT metric { metricName: %@, errorCode: %@, error: %@ }", buf, 0x20u);
        }
        id v97 = +[TransparencyAnalytics logger];
        [v97 logResultForEvent:@"kt-sig-resp" hardFailure:v74 result:v94];

        id v98 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR)) {
          sub_100720398();
        }

LABEL_140:
        BOOL v87 = 0;
        goto LABEL_141;
      }
    }
    id v75 = 0;
    goto LABEL_135;
  }
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v112 objects:v130 count:16];
  if (!v14)
  {
LABEL_118:
    BOOL v87 = 0;
    goto LABEL_142;
  }
  id v15 = v14;
  id v100 = v6;
  char v103 = 0;
  char log = 0;
  uint64_t v111 = *(void *)v113;
  id v109 = v7;
  do
  {
    id v16 = 0;
    do
    {
      if (*(void *)v113 != v111) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void *)(*((void *)&v112 + 1) + 8 * (void)v16);
      uint64_t v18 = [(IDSKTRegistrationDataManager *)self _ktRegistrationDataIndexForKTApplication:v17];
      serviceIndexToKTRegDataConfigs = self->_serviceIndexToKTRegDataConfigs;
      id v20 = +[NSNumber numberWithUnsignedShort:v18];
      unsigned int v21 = [(NSMutableDictionary *)serviceIndexToKTRegDataConfigs objectForKeyedSubscript:v20];

      if (!v21)
      {
        if (v7)
        {
          NSErrorUserInfoKey v128 = NSUnderlyingErrorKey;
          id v129 = v7;
          __int16 v23 = +[NSDictionary dictionaryWithObjects:&v129 forKeys:&v128 count:1];
        }
        else
        {
          __int16 v23 = 0;
        }
        uint64_t v25 = +[NSError errorWithDomain:@"IDSKTRegistrationDataManagerErrorDomain" code:-2000 userInfo:v23];
        id v41 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)long long v125 = @"kt-sig-resp";
          *(_WORD *)&v125[8] = 2112;
          *(void *)&v125[10] = &off_1009D2238;
          *(_WORD *)&v125[18] = 2112;
          *(void *)&v125[20] = v25;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Reporting KT metric { metricName: %@, errorCode: %@, error: %@ }", buf, 0x20u);
        }

        uint64_t v42 = +[TransparencyAnalytics logger];
        [v42 logResultForEvent:@"kt-sig-resp" hardFailure:1 result:v25];

        id v43 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          unsigned int v44 = [obj objectForKeyedSubscript:v17];
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)long long v125 = v18;
          *(_WORD *)&v125[4] = 2112;
          *(void *)&v125[6] = v17;
          *(_WORD *)&v125[14] = 2112;
          *(void *)&v125[16] = v44;
          *(_WORD *)&v125[24] = 2112;
          *(void *)&v125[26] = v25;
          __int16 v126 = 2112;
          id v127 = v109;
          _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "No config for key index and KT Application. { keyIndex: %u, KT Application: %@, transparencyResponse: %@, error: %@, underlyingError: %@ }", buf, 0x30u);

          id v7 = v109;
        }
        goto LABEL_45;
      }
      BOOL v22 = [v21 unregisteredKTData];

      if (!v22)
      {
        if (v7)
        {
          NSErrorUserInfoKey v122 = NSUnderlyingErrorKey;
          id v123 = v7;
          __int16 v23 = +[NSDictionary dictionaryWithObjects:&v123 forKeys:&v122 count:1];
        }
        else
        {
          __int16 v23 = 0;
        }
        uint64_t v25 = +[NSError errorWithDomain:@"IDSKTRegistrationDataManagerErrorDomain" code:-2001 userInfo:v23];
        id v45 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)long long v125 = @"kt-sig-resp";
          *(_WORD *)&v125[8] = 2112;
          *(void *)&v125[10] = &off_1009D2250;
          *(_WORD *)&v125[18] = 2112;
          *(void *)&v125[20] = v25;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Reporting KT metric { metricName: %@, errorCode: %@, error: %@ }", buf, 0x20u);
        }

        unsigned __int8 v46 = +[TransparencyAnalytics logger];
        [v46 logResultForEvent:@"kt-sig-resp" hardFailure:1 result:v25];

        id v43 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)long long v125 = v18;
          *(_WORD *)&v125[4] = 2112;
          *(void *)&v125[6] = v17;
          *(_WORD *)&v125[14] = 2112;
          *(void *)&v125[16] = v25;
          *(_WORD *)&v125[24] = 2112;
          *(void *)&v125[26] = v7;
          _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "No unregistered KT data for keyIndex. { keyIndex: %u, ktApplication: %@, error: %@, underlyingError: %@ }", buf, 0x26u);
        }
LABEL_45:

        goto LABEL_66;
      }
      __int16 v23 = [obj objectForKeyedSubscript:v17];
      if (!v23)
      {
        if (v7)
        {
          NSErrorUserInfoKey v120 = NSUnderlyingErrorKey;
          id v121 = v7;
          uint64_t v25 = +[NSDictionary dictionaryWithObjects:&v121 forKeys:&v120 count:1];
        }
        else
        {
          uint64_t v25 = 0;
        }
        CFErrorRef v51 = +[NSError errorWithDomain:@"IDSKTRegistrationDataManagerErrorDomain" code:-2002 userInfo:v25];
        CFDataRef v52 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)long long v125 = @"kt-sig-resp";
          *(_WORD *)&v125[8] = 2112;
          *(void *)&v125[10] = &off_1009D2268;
          *(_WORD *)&v125[18] = 2112;
          *(void *)&v125[20] = v51;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Reporting KT metric { metricName: %@, errorCode: %@, error: %@ }", buf, 0x20u);
        }

        id v53 = +[TransparencyAnalytics logger];
        [v53 logResultForEvent:@"kt-sig-resp" hardFailure:1 result:v51];

        v54 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)long long v125 = v18;
          *(_WORD *)&v125[4] = 2112;
          *(void *)&v125[6] = v17;
          *(_WORD *)&v125[14] = 2112;
          *(void *)&v125[16] = v51;
          *(_WORD *)&v125[24] = 2112;
          *(void *)&v125[26] = v109;
          _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "No signature data from KT for KT Application. { keyIndex: %u, ktApplication: %@, error: %@, underlyingError: %@ }", buf, 0x26u);
        }

        goto LABEL_65;
      }
      id v24 = [v21 unregisteredKTData];
      uint64_t v25 = [v24 ktDataForRegistration];

      if (!v25
        || ([v23 tbsKTIDSRegistrationData],
            unsigned int v26 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v27 = [v25 isEqualToData:v26],
            v26,
            (v27 & 1) == 0))
      {
        if (v7)
        {
          NSErrorUserInfoKey v118 = NSUnderlyingErrorKey;
          id v119 = v7;
          id v40 = +[NSDictionary dictionaryWithObjects:&v119 forKeys:&v118 count:1];
        }
        else
        {
          id v40 = 0;
        }
        id v47 = +[NSError errorWithDomain:@"IDSKTRegistrationDataManagerErrorDomain" code:-2003 userInfo:v40];
        unsigned int v48 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)long long v125 = @"kt-sig-resp";
          *(_WORD *)&v125[8] = 2112;
          *(void *)&v125[10] = &off_1009D2280;
          *(_WORD *)&v125[18] = 2112;
          *(void *)&v125[20] = v47;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Reporting KT metric { metricName: %@, errorCode: %@, error: %@ }", buf, 0x20u);
        }

        id v49 = +[TransparencyAnalytics logger];
        [v49 logResultForEvent:@"kt-sig-resp" hardFailure:1 result:v47];

        unsigned int v50 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          v106 = [v23 tbsKTIDSRegistrationData];
          *(_DWORD *)buf = 138413314;
          *(void *)long long v125 = v25;
          *(_WORD *)&v125[8] = 2112;
          *(void *)&v125[10] = v106;
          *(_WORD *)&v125[18] = 1024;
          *(_DWORD *)&v125[20] = v18;
          *(_WORD *)&v125[24] = 2112;
          *(void *)&v125[26] = v47;
          __int16 v126 = 2112;
          id v127 = v109;
          _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "KT data requiring signature not matching between transparency and IDS. { IDSKTData: %@, TransparencyKTData: %@, keyIndex: %u, error: %@, underlyingError: %@ }", buf, 0x30u);
        }
        goto LABEL_64;
      }
      uint64_t v28 = [v23 signature];
      if (!v28
        || (id v29 = (void *)v28,
            [v23 publicKey],
            id v30 = objc_claimAutoreleasedReturnValue(),
            v30,
            v29,
            !v30))
      {
        if (v7)
        {
          NSErrorUserInfoKey v116 = NSUnderlyingErrorKey;
          id v117 = v7;
          id v40 = +[NSDictionary dictionaryWithObjects:&v117 forKeys:&v116 count:1];
        }
        else
        {
          id v40 = 0;
        }
        id v47 = +[NSError errorWithDomain:@"IDSKTRegistrationDataManagerErrorDomain" code:-2004 userInfo:v40];
        unsigned int v55 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)long long v125 = @"kt-sig-resp";
          *(_WORD *)&v125[8] = 2112;
          *(void *)&v125[10] = &off_1009D2298;
          *(_WORD *)&v125[18] = 2112;
          *(void *)&v125[20] = v47;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Reporting KT metric { metricName: %@, errorCode: %@, error: %@ }", buf, 0x20u);
        }

        v56 = +[TransparencyAnalytics logger];
        [v56 logResultForEvent:@"kt-sig-resp" hardFailure:1 result:v47];

        unsigned int v50 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)long long v125 = v18;
          *(_WORD *)&v125[4] = 2112;
          *(void *)&v125[6] = v47;
          *(_WORD *)&v125[14] = 2112;
          *(void *)&v125[16] = v109;
          _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "No signature or public key provided from transparency for key index. { keyIndex: %u, error: %@, underlyingError: %@ }", buf, 0x1Cu);
        }
LABEL_64:

LABEL_65:
        id v7 = v109;
        goto LABEL_66;
      }
      os_log_t loga = [v21 registeredKTData];
      if (!loga) {
        goto LABEL_70;
      }
      v105 = [v21 registeredKTData];
      unsigned int v31 = [v105 ktDataForRegistration];
      id v32 = [v23 tbsKTIDSRegistrationData];
      v104 = v31;
      if (![v31 isEqualToData:v32])
      {

LABEL_69:
LABEL_70:
        id v57 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)long long v125 = @"kt-sig-resp";
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Reporting KT metric success. { metricName: %@ }", buf, 0xCu);
        }

        v58 = +[TransparencyAnalytics logger];
        [v58 logSuccessForEventNamed:@"kt-sig-resp"];

        unsigned int v59 = [v23 publicKey];
        CFErrorRef v60 = [v21 unregisteredKTData];
        [v60 setKtPublicAccountKey:v59];

        unsigned int v61 = [v23 signature];
        CFErrorRef v62 = [v21 unregisteredKTData];
        [v62 setKtDataSignature:v61];

        BOOL v63 = [v23 dsid];
        id v64 = [v21 unregisteredKTData];
        [v64 setDsid:v63];

        char v103 = 1;
        goto LABEL_73;
      }
      v101 = [v21 registeredKTData];
      uint64_t v33 = [v101 ktPublicAccountKey];
      id v34 = [v23 publicKey];
      unsigned int v102 = [v33 isEqualToData:v34];

      id v7 = v109;
      if (!v102) {
        goto LABEL_70;
      }
      id v35 = [v21 registeredKTData];
      uint64_t v36 = [v35 ktDataSignature];
      if (v36)
      {
      }
      else
      {
        id v65 = [v23 signature];

        if (v65)
        {
          os_log_t loga = +[IDSFoundationLog KeyTransparency];
          if (os_log_type_enabled(loga, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "We previously registered without a signature, but we have one now.", buf, 2u);
          }
          goto LABEL_69;
        }
      }
      unsigned __int8 v37 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)long long v125 = @"kt-sig-resp";
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Reporting KT metric success. { metricName: %@ }", buf, 0xCu);
      }

      id v38 = +[TransparencyAnalytics logger];
      [v38 logSuccessForEventNamed:@"kt-sig-resp"];

      id v39 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)long long v125 = v18;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "KT data for registration and public account key are unchanged from what is registered. No update needed for key index. { keyIndex: %u }", buf, 8u);
      }

      [v21 setUnregisteredKTData:0];
LABEL_73:
      char log = 1;
LABEL_66:

      id v16 = (char *)v16 + 1;
    }
    while (v15 != v16);
    id v66 = [obj countByEnumeratingWithState:&v112 objects:v130 count:16];
    id v15 = v66;
  }
  while (v66);
  if (log)
  {
    uint64_t v67 = +[IDSFoundationLog KeyTransparency];
    id v6 = v100;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Persisting changes.", buf, 2u);
    }

    [(IDSKTRegistrationDataManager *)self serializeAndPersistKTDatasDeleteIfNull:1];
  }
  else
  {
    id v6 = v100;
  }
  if ((v103 & 1) == 0) {
    goto LABEL_118;
  }
  long long v86 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "Updated unregistered data. Need to upload to KVS.", buf, 2u);
  }

  [(IDSKTRegistrationDataManager *)self updateKVSWithCurrentKTRegistrationData];
  id v75 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Updated unregistered data. Need to reregister.", buf, 2u);
  }
  BOOL v87 = 1;
LABEL_141:

LABEL_142:
  return v87;
}

- (id)_ktApplicationForKTRegistrationIndex:(unsigned __int16)a3
{
  if ((a3 - 1) > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *(id *)*(&off_10098B3A0 + (__int16)(a3 - 1));
  }
  return v4;
}

- (unsigned)_ktRegistrationDataIndexForKTApplication:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kKTApplicationIdentifierIDS])
  {
    unsigned __int16 v4 = 1;
  }
  else if ([v3 isEqualToString:kKTApplicationIdentifierIDSFaceTime])
  {
    unsigned __int16 v4 = 2;
  }
  else if ([v3 isEqualToString:kKTApplicationIdentifierIDSMultiplex])
  {
    unsigned __int16 v4 = 3;
  }
  else
  {
    unsigned __int16 v4 = 0;
  }

  return v4;
}

- (id)keyTransparencyVersionNumberToRegisterForServiceType:(id)a3
{
  return +[IDSKeyTransparencyVerifier keyTransparencyVersionNumberForServiceType:a3];
}

- (void)updateKVSWithCurrentKTRegistrationData
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  unsigned __int16 v4 = [(IDSKTRegistrationDataManager *)self _createKTTrustedDeviceForKVSisRegistered:0];
  if (v4) {
    [v3 addObject:v4];
  }
  uint64_t v5 = [(IDSKTRegistrationDataManager *)self _createKTTrustedDeviceForKVSisRegistered:1];
  if (v5) {
    [v3 addObject:v5];
  }
  if ([v3 count])
  {
    id v6 = [(IDSKTRegistrationDataManager *)self ktVerifier];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1003CED04;
    v8[3] = &unk_100980D88;
    v8[4] = self;
    id v9 = v3;
    [v6 updateKVSWithTrustedDevices:v9 withCompletion:v8];
  }
  else
  {
    id v7 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No new trusted devices to insert into KVS.", buf, 2u);
    }
  }
}

- (id)createRegistrationStatusProvider
{
  id v3 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Asked to create KT Registration Status provider.", buf, 2u);
  }

  id v15 = objc_alloc_init((Class)IDSKTRegistrationStatusProvider);
  unsigned __int16 v4 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  int v5 = 1;
  *(void *)&long long v6 = 67109120;
  long long v14 = v6;
  do
  {
    id v7 = -[IDSKTRegistrationDataManager _ktApplicationForKTRegistrationIndex:](self, "_ktApplicationForKTRegistrationIndex:", (unsigned __int16)v5, v14);
    if (!v7)
    {
      id v8 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v14;
        int v19 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "No KTApplication found for keyIndex. { keyIndex: %u }", buf, 8u);
      }
    }
    id v17 = 0;
    id v9 = [(IDSKTRegistrationDataManager *)self copyKTRegistrationDataToRegisterForKeyIndex:(unsigned __int16)v5 isRegistered:0 withError:&v17];
    id v10 = v17;
    uint64_t v16 = 0;
    id v11 = [(IDSKTRegistrationDataManager *)self copyKTRegistrationDataToRegisterForKeyIndex:(unsigned __int16)v5 isRegistered:1 withError:&v16];
    id v12 = objc_alloc_init((Class)IDSKTRegistrationStatus);
    [v12 setUnregisteredKTData:v9];
    [v12 setRegisteredKTData:v11];
    if (v12) {
      CFDictionarySetValue(v4, v7, v12);
    }

    ++v5;
  }
  while (v5 != 4);
  [v15 setKtApplicationToKTRegStatus:v4];

  return v15;
}

- (id)_createKTTrustedDeviceForKVSisRegistered:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = +[IDSFoundationLog KeyTransparency];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  CFStringRef v7 = @"NO";
  if (v6)
  {
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v34 = v7;
    CFStringRef v38 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating KT Trusted Device for KVS upload. { isRegistered: %@ }", buf, 0xCu);
  }
  else
  {
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    CFStringRef v34 = v7;
  }

  id v8 = objc_alloc_init(IDSProtoKeyTransparencyTrustedDevice);
  id v9 = +[IDSPushHandler sharedInstance];
  id v10 = [v9 pushToken];
  [(IDSProtoKeyTransparencyTrustedDevice *)v8 setPushToken:v10];

  [(IDSProtoKeyTransparencyTrustedDevice *)v8 setTransparencyVersion:kTransparencyAnalyticsVersion];
  id v11 = +[IMDeviceSupport sharedInstance];
  id v12 = [v11 productBuildVersion];
  [(IDSProtoKeyTransparencyTrustedDevice *)v8 setBuildVersion:v12];

  int v13 = +[IMDeviceSupport sharedInstance];
  long long v14 = [v13 productName];
  id v35 = v8;
  [(IDSProtoKeyTransparencyTrustedDevice *)v8 setProductName:v14];

  id v36 = objc_alloc_init((Class)NSMutableArray);
  int v15 = 1;
  *(void *)&long long v16 = 138412802;
  long long v33 = v16;
  do
  {
    serviceIndexToKTRegDataConfigs = self->_serviceIndexToKTRegDataConfigs;
    uint64_t v18 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", (unsigned __int16)v15, v33);
    int v19 = [(NSMutableDictionary *)serviceIndexToKTRegDataConfigs objectForKeyedSubscript:v18];

    if (v19)
    {
      if (v3) {
        [(__CFString *)v19 registeredKTData];
      }
      else {
      id v20 = [(__CFString *)v19 unregisteredKTData];
      }
      if (v20)
      {
        unsigned int v21 = [IDSProtoKeyTransparencyLoggableData alloc];
        BOOL v22 = [v20 ktDataForRegistration];
        __int16 v23 = [(IDSProtoKeyTransparencyLoggableData *)v21 initWithData:v22];

        if (v23)
        {
          uint64_t v24 = [v20 ktDataForRegistration];
          if (v24)
          {
            uint64_t v25 = (void *)v24;
            unsigned int v26 = [v20 ktDataSignature];

            if (v26)
            {
              unsigned __int8 v27 = objc_alloc_init(IDSProtoKeyTransparencyTrustedService);
              uint64_t v28 = [v20 ktDataSignature];
              [(IDSProtoKeyTransparencyTrustedService *)v27 setDeviceSignature:v28];

              [(IDSProtoKeyTransparencyTrustedService *)v27 setKtLoggableData:v23];
              [(IDSProtoKeyTransparencyTrustedService *)v27 setKeyIndex:sub_10030C08C((unsigned __int16)v15)];
              [v36 addObject:v27];
            }
          }
        }
      }
      else
      {
        __int16 v23 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v33;
          CFStringRef v38 = v19;
          __int16 v39 = 1024;
          int v40 = v15;
          __int16 v41 = 2112;
          CFStringRef v42 = v34;
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "No kt registration data found for key index. { config: %@, keyIndex: %u, isRegistered: %@ }", buf, 0x1Cu);
        }
      }
    }
    else
    {
      id v20 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v38) = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "No config found for key index. { keyIndex: %u }", buf, 8u);
      }
    }

    ++v15;
  }
  while (v15 != 4);
  if ([v36 count])
  {
    id v29 = v35;
    [(IDSProtoKeyTransparencyTrustedDevice *)v35 setTrustedServices:v36];
    id v30 = v35;
  }
  else
  {
    unsigned int v31 = +[IDSFoundationLog KeyTransparency];
    id v29 = v35;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_100720400();
    }

    id v30 = 0;
  }

  return v30;
}

- (void)noteSuccessfulKVSSyncOfTrustedDevices:(id)a3
{
  id v4 = a3;
  char v5 = 0;
  int v6 = 1;
  *(void *)&long long v7 = 67109120;
  long long v15 = v7;
  do
  {
    serviceIndexToKTRegDataConfigs = self->_serviceIndexToKTRegDataConfigs;
    id v9 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", (unsigned __int16)v6, v15);
    id v10 = [(NSMutableDictionary *)serviceIndexToKTRegDataConfigs objectForKeyedSubscript:v9];

    if (v10)
    {
      id v11 = [v10 unregisteredKTData];
      id v12 = v11;
      if (v11
        && ([v11 uploadedToKVS] & 1) == 0
        && [(IDSKTRegistrationDataManager *)self _isKTRegistrationData:v12 forServiceIndex:(unsigned __int16)v6 inTrustedDevices:v4])
      {
        char v5 = 1;
        [v12 setUploadedToKVS:1];
      }
      int v13 = [v10 registeredKTData];
      long long v14 = v13;
      if (v13
        && ([v13 uploadedToKVS] & 1) == 0
        && [(IDSKTRegistrationDataManager *)self _isKTRegistrationData:v14 forServiceIndex:(unsigned __int16)v6 inTrustedDevices:v4])
      {
        char v5 = 1;
        [v14 setUploadedToKVS:1];
      }
    }
    else
    {
      id v12 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v15;
        int v17 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "No config for keyIndex. { keyIndex: %u }", buf, 8u);
      }
    }

    ++v6;
  }
  while (v6 != 4);
  if (v5) {
    [(IDSKTRegistrationDataManager *)self serializeAndPersistKTDatasDeleteIfNull:1];
  }
}

- (void)scheduleNextKVSSync
{
  v2 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100720434();
  }
}

- (BOOL)_isKTRegistrationData:(id)a3 forServiceIndex:(unsigned __int16)a4 inTrustedDevices:(id)a5
{
  uint64_t v6 = a4;
  id v7 = a3;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v8 = a5;
  id v32 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v32)
  {
    uint64_t v9 = *(void *)v42;
    CFStringRef v34 = v8;
    uint64_t v31 = *(void *)v42;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(v8);
        }
        uint64_t v33 = v10;
        id v11 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * v10), "trustedServices", v31);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v12 = v11;
        id v13 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v38;
          uint64_t v35 = *(void *)v38;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v38 != v15) {
                objc_enumerationMutation(v12);
              }
              int v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              unsigned int v18 = [v17 keyIndex];
              if (v18 == sub_10030C08C(v6))
              {
                int v19 = [v17 ktLoggableData];
                uint64_t v20 = [v17 deviceSignature];
                unsigned int v21 = (void *)v20;
                if (v19) {
                  BOOL v22 = v20 == 0;
                }
                else {
                  BOOL v22 = 1;
                }
                if (!v22)
                {
                  __int16 v23 = [v19 data];
                  uint64_t v24 = [v7 ktDataForRegistration];
                  if ([v23 isEqualToData:v24])
                  {
                    [v7 ktDataSignature];
                    id v25 = v12;
                    uint64_t v26 = v6;
                    uint64_t v28 = v27 = v7;
                    unsigned __int8 v36 = [v21 isEqualToData:v28];

                    id v7 = v27;
                    uint64_t v6 = v26;
                    id v12 = v25;
                    uint64_t v15 = v35;

                    if (v36)
                    {

                      BOOL v29 = 1;
                      id v8 = v34;
                      goto LABEL_27;
                    }
                  }
                  else
                  {
                  }
                }
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v14);
        }

        uint64_t v10 = v33 + 1;
        id v8 = v34;
        uint64_t v9 = v31;
      }
      while ((id)(v33 + 1) != v32);
      BOOL v29 = 0;
      id v32 = [v34 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v32);
  }
  else
  {
    BOOL v29 = 0;
  }
LABEL_27:

  return v29;
}

- (void)logIDSKTRegMetrics:(id)a3 expectedRegisteredData:(id)a4 forKeyIndex:(unsigned __int16)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 ktDataForRegistration];

  if (!v8)
  {
    uint64_t v15 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 138412546;
      CFStringRef v39 = @"kt-reg-data-status";
      __int16 v40 = 2112;
      long long v41 = &off_1009D22B0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Logging KT Metric {metricName: %@, errorCode: %@}", (uint8_t *)&v38, 0x16u);
    }

    id v14 = +[TransparencyAnalytics logger];
    uint64_t v16 = -3001;
    goto LABEL_12;
  }
  uint64_t v9 = [v6 ktDataForRegistration];
  uint64_t v10 = [v7 ktDataForRegistration];
  unsigned __int8 v11 = [v9 isEqualToData:v10];

  id v12 = +[IDSFoundationLog KeyTransparency];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if ((v11 & 1) == 0)
  {
    if (v13)
    {
      int v38 = 138412546;
      CFStringRef v39 = @"kt-reg-data-status";
      __int16 v40 = 2112;
      long long v41 = &off_1009D22C8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Logging KT Metric {metricName: %@, errorCode: %@}", (uint8_t *)&v38, 0x16u);
    }

    id v14 = +[TransparencyAnalytics logger];
    uint64_t v16 = -3002;
LABEL_12:
    int v17 = +[NSError errorWithDomain:@"IDSKTRegistrationDataManagerErrorDomain" code:v16 userInfo:0];
    [v14 logResultForEvent:@"kt-reg-data-status" hardFailure:1 result:v17];

    goto LABEL_13;
  }
  if (v13)
  {
    int v38 = 138412290;
    CFStringRef v39 = @"kt-reg-data-status";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Logging KT Metric Success {metricName: %@}", (uint8_t *)&v38, 0xCu);
  }

  id v14 = +[TransparencyAnalytics logger];
  [v14 logSuccessForEventNamed:@"kt-reg-data-status"];
LABEL_13:

  unsigned int v18 = [v6 ktPublicAccountKey];

  if (!v18)
  {
    id v25 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 138412546;
      CFStringRef v39 = @"kt-reg-publicAccountKey-status";
      __int16 v40 = 2112;
      long long v41 = &off_1009D22E0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Logging KT Metric {metricName: %@, errorCode: %@}", (uint8_t *)&v38, 0x16u);
    }

    uint64_t v24 = +[TransparencyAnalytics logger];
    uint64_t v26 = -3003;
    goto LABEL_24;
  }
  int v19 = [v6 ktPublicAccountKey];
  uint64_t v20 = [v7 ktPublicAccountKey];
  unsigned __int8 v21 = [v19 isEqualToData:v20];

  BOOL v22 = +[IDSFoundationLog KeyTransparency];
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if ((v21 & 1) == 0)
  {
    if (v23)
    {
      int v38 = 138412546;
      CFStringRef v39 = @"kt-reg-publicAccountKey-status";
      __int16 v40 = 2112;
      long long v41 = &off_1009D22F8;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Logging KT Metric {metricName: %@, errorCode: %@}", (uint8_t *)&v38, 0x16u);
    }

    uint64_t v24 = +[TransparencyAnalytics logger];
    uint64_t v26 = -3004;
LABEL_24:
    id v27 = +[NSError errorWithDomain:@"IDSKTRegistrationDataManagerErrorDomain" code:v26 userInfo:0];
    [v24 logResultForEvent:@"kt-reg-publicAccountKey-status" hardFailure:1 result:v27];

    goto LABEL_25;
  }
  if (v23)
  {
    int v38 = 138412290;
    CFStringRef v39 = @"kt-reg-publicAccountKey-status";
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Logging KT Metric Success {metricName: %@}", (uint8_t *)&v38, 0xCu);
  }

  uint64_t v24 = +[TransparencyAnalytics logger];
  [v24 logSuccessForEventNamed:@"kt-reg-publicAccountKey-status"];
LABEL_25:

  uint64_t v28 = [v6 ktDataSignature];

  if (!v28)
  {
    uint64_t v35 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 138412546;
      CFStringRef v39 = @"kt-reg-dataSignature-status";
      __int16 v40 = 2112;
      long long v41 = &off_1009D2310;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Logging KT Metric {metricName: %@, errorCode: %@}", (uint8_t *)&v38, 0x16u);
    }

    CFStringRef v34 = +[TransparencyAnalytics logger];
    uint64_t v36 = -3005;
    goto LABEL_36;
  }
  BOOL v29 = [v6 ktDataSignature];
  id v30 = [v7 ktDataSignature];
  unsigned __int8 v31 = [v29 isEqualToData:v30];

  id v32 = +[IDSFoundationLog KeyTransparency];
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
  if ((v31 & 1) == 0)
  {
    if (v33)
    {
      int v38 = 138412546;
      CFStringRef v39 = @"kt-reg-dataSignature-status";
      __int16 v40 = 2112;
      long long v41 = &off_1009D2328;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Logging KT Metric {metricName: %@, errorCode: %@}", (uint8_t *)&v38, 0x16u);
    }

    CFStringRef v34 = +[TransparencyAnalytics logger];
    uint64_t v36 = -3006;
LABEL_36:
    long long v37 = +[NSError errorWithDomain:@"IDSKTRegistrationDataManagerErrorDomain" code:v36 userInfo:0];
    [v34 logResultForEvent:@"kt-reg-dataSignature-status" hardFailure:1 result:v37];

    goto LABEL_37;
  }
  if (v33)
  {
    int v38 = 138412290;
    CFStringRef v39 = @"kt-reg-dataSignature-status";
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Logging KT Metric Success {metricName: %@}", (uint8_t *)&v38, 0xCu);
  }

  CFStringRef v34 = +[TransparencyAnalytics logger];
  [v34 logSuccessForEventNamed:@"kt-reg-dataSignature-status"];
LABEL_37:
}

- (void)logKTRegistrationTimeMetricsForLatestRegisteredKTData:(id)a3 lastRegisteredKTData:(id)a4 forKeyIndex:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 ktPublicAccountKey];
  if (v10)
  {
    uint64_t v11 = [v8 ktDataSignature];
    id v12 = (void *)v11;
    BOOL v146 = v11 != 0;
    if (v9 && v11)
    {
      BOOL v13 = [v9 ktPublicAccountKey];
      if (v13)
      {
        id v14 = [v9 ktDataSignature];
        BOOL v146 = v14 == 0;
      }
      else
      {
        BOOL v146 = 1;
      }
    }
  }
  else
  {
    BOOL v146 = 0;
  }

  uint64_t v15 = [v8 ktPublicAccountKey];
  if (v15)
  {
    uint64_t v16 = [v8 ktDataSignature];
    if (v16)
    {
      int v17 = [v9 ktPublicAccountKey];
      if (v17)
      {
        unsigned int v18 = [v9 ktDataSignature];
        BOOL v19 = v18 != 0;
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  uint64_t v20 = [v8 ktPublicAccountKey];
  if (v20)
  {
    unsigned __int8 v21 = [v8 ktDataSignature];
    BOOL v22 = v21 == 0;
  }
  else
  {
    BOOL v22 = 1;
  }

  if (v9) {
    BOOL v23 = v22;
  }
  else {
    BOOL v23 = 0;
  }
  int v24 = v23 || v19;
  id v25 = +[IDSFoundationLog KeyTransparency];
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (v24 == 1)
  {
    if (v26)
    {
      *(_WORD *)buf = 0;
      id v27 = "Not reporting KT time metrics.";
LABEL_137:
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
      goto LABEL_138;
    }
    goto LABEL_138;
  }
  if (v26)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Reporting KT time metrics.", buf, 2u);
  }

  BOOL v145 = v22;
  if (!self->_iCloudSignInDate)
  {
    BOOL v140 = 0;
    BOOL v31 = 0;
    int v32 = 1;
    BOOL v30 = 1;
    goto LABEL_42;
  }
  buddyFinishDate = self->_buddyFinishDate;
  if (buddyFinishDate)
  {
    -[NSDate timeIntervalSinceDate:](buddyFinishDate, "timeIntervalSinceDate:");
    BOOL v30 = v29 < 0.0;
    if (!self->_iCloudSignInDate)
    {
      BOOL v31 = 0;
      int v32 = 1;
      goto LABEL_37;
    }
  }
  else
  {
    BOOL v30 = 0;
  }
  int v32 = 0;
  BOOL v31 = self->_manateeAvailableDate != 0;
LABEL_37:
  if (v22)
  {
    if (v32)
    {
      BOOL v140 = 0;
      int v32 = 1;
    }
    else
    {
      BOOL v33 = [v8 registeredTime];
      BOOL v140 = v33 != 0;

      int v32 = 0;
    }
  }
  else
  {
    BOOL v140 = 0;
  }
LABEL_42:
  char v34 = !v22;
  if (v146 && self->_iCloudSignInDate)
  {
    uint64_t v35 = [v8 registeredTime];
    BOOL v36 = v35 != 0;
  }
  else
  {
    BOOL v36 = 0;
  }
  manateeAvailableDate = self->_manateeAvailableDate;
  if (manateeAvailableDate) {
    char v38 = v34;
  }
  else {
    char v38 = 1;
  }
  if (v38)
  {
    BOOL v141 = 0;
  }
  else
  {
    CFStringRef v39 = [v8 registeredTime];
    BOOL v141 = v39 != 0;
  }
  if (v146 && self->_manateeAvailableDate)
  {
    __int16 v40 = [v8 registeredTime];
    BOOL v142 = v40 != 0;
  }
  else
  {
    BOOL v142 = 0;
  }
  char v41 = !v145;
  if (v9) {
    char v41 = 1;
  }
  if (v41)
  {
    BOOL v143 = 0;
  }
  else
  {
    long long v42 = [v8 registeredTime];
    BOOL v143 = v42 != 0;
  }
  if (v146)
  {
    long long v43 = [v8 registeredTime];
    BOOL v144 = v43 != 0;
  }
  else
  {
    BOOL v144 = 0;
  }
  if (((v32 | v30) & 1) == 0 && !self->_hasReportediCloudBuddyTime)
  {
    BOOL v139 = v36;
    long long v44 = self->_buddyFinishDate;
    if (v44)
    {
      [(NSDate *)v44 timeIntervalSinceDate:self->_iCloudSignInDate];
      double v46 = v45;
      id v47 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        id v48 = +[NSString stringWithFormat:@"%@-%u", @"IDS_iCloudBuddyTime", v5];
        *(_DWORD *)buf = 138412546;
        id v148 = v48;
        __int16 v149 = 2048;
        double v150 = v46;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Reporting KT Metric {metricName: %@, timeInterval: %f}", buf, 0x16u);
      }
      id v49 = +[TransparencyAnalytics logger];
      unsigned int v50 = +[NSNumber numberWithDouble:v46];
      CFErrorRef v51 = +[NSString stringWithFormat:@"%@-%u", @"IDS_iCloudBuddyTime", v5];
      [v49 logMetric:v50 withName:v51];
    }
    else
    {
      CFDataRef v52 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        id v53 = +[NSString stringWithFormat:@"%@-%u", @"IDS_iCloudBuddyTime", v5];
        *(_DWORD *)buf = 138412290;
        id v148 = v53;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Reporting KT Metric success. {metricName: %@}", buf, 0xCu);
      }
      id v49 = +[TransparencyAnalytics logger];
      unsigned int v50 = +[NSString stringWithFormat:@"%@-%u", @"IDS_iCloudBuddyTime", v5];
      [v49 logSuccessForEventNamed:v50];
    }

    self->_hasReportediCloudBuddyTime = 1;
    BOOL v36 = v139;
  }
  if (v31 && !self->_hasReportediCloudManateeTime)
  {
    BOOL v54 = v36;
    [(NSDate *)self->_manateeAvailableDate timeIntervalSinceDate:self->_iCloudSignInDate];
    double v56 = v55;
    id v57 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      id v58 = +[NSString stringWithFormat:@"%@-%u", @"IDS_iCloudManateeTime", v5];
      *(_DWORD *)buf = 138412546;
      id v148 = v58;
      __int16 v149 = 2048;
      double v150 = v56;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Reporting KT Metric {metricName: %@, timeInterval: %f", buf, 0x16u);
    }
    unsigned int v59 = +[TransparencyAnalytics logger];
    CFErrorRef v60 = +[NSNumber numberWithDouble:v56];
    unsigned int v61 = +[NSString stringWithFormat:@"%@-%u", @"IDS_iCloudManateeTime", v5];
    [v59 logMetric:v60 withName:v61];

    self->_hasReportediCloudManateeTime = 1;
    BOOL v36 = v54;
  }
  if (v140)
  {
    BOOL v62 = v36;
    BOOL v63 = [v8 registeredTime];
    [v63 timeIntervalSinceDate:self->_iCloudSignInDate];
    double v65 = v64;

    id v66 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      id v67 = +[NSString stringWithFormat:@"%@-%u", @"IDS_iCloudIDSNoKTRegTime", v5];
      *(_DWORD *)buf = 138412546;
      id v148 = v67;
      __int16 v149 = 2048;
      double v150 = v65;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Reporting KT Metric {metricName: %@, timeInterval: %f", buf, 0x16u);
    }
    int v68 = +[TransparencyAnalytics logger];
    uint64_t v69 = +[NSNumber numberWithDouble:v65];
    uint64_t v70 = +[NSString stringWithFormat:@"%@-%u", @"IDS_iCloudIDSNoKTRegTime", v5];
    [v68 logMetric:v69 withName:v70];

    BOOL v36 = v62;
  }
  if (v36)
  {
    uint64_t v71 = [v8 registeredTime];
    [v71 timeIntervalSinceDate:self->_iCloudSignInDate];
    double v73 = v72;

    uint64_t v74 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      id v75 = +[NSString stringWithFormat:@"%@-%u", @"IDS_iCloudIDSKTRegTime", v5];
      *(_DWORD *)buf = 138412546;
      id v148 = v75;
      __int16 v149 = 2048;
      double v150 = v73;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Reporting KT Metric {metricName: %@, timeInterval: %f", buf, 0x16u);
    }
    int v76 = +[TransparencyAnalytics logger];
    int v77 = +[NSNumber numberWithDouble:v73];
    uint64_t v78 = +[NSString stringWithFormat:@"%@-%u", @"IDS_iCloudIDSKTRegTime", v5];
    [v76 logMetric:v77 withName:v78];
  }
  if (manateeAvailableDate) {
    char v79 = v30;
  }
  else {
    char v79 = 1;
  }
  if ((v79 & 1) == 0 && !self->_hasReportedManateeBuddyTime)
  {
    BOOL v80 = self->_buddyFinishDate;
    if (v80)
    {
      [(NSDate *)v80 timeIntervalSinceDate:self->_manateeAvailableDate];
      double v82 = v81;
      __int16 v83 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        id v84 = +[NSString stringWithFormat:@"%@-%u", @"IDS_manateeBuddyTime", v5];
        *(_DWORD *)buf = 138412546;
        id v148 = v84;
        __int16 v149 = 2048;
        double v150 = v82;
        _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "Reporting KT Metric {metricName: %@, timeInterval: %f", buf, 0x16u);
      }
      id v85 = +[TransparencyAnalytics logger];
      long long v86 = +[NSNumber numberWithDouble:v82];
      BOOL v87 = +[NSString stringWithFormat:@"%@-%u", @"IDS_manateeBuddyTime", v5];
      [v85 logMetric:v86 withName:v87];
    }
    else
    {
      int v88 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        id v89 = +[NSString stringWithFormat:@"%@-%u", @"IDS_manateeBuddyTime", v5];
        *(_DWORD *)buf = 138412290;
        id v148 = v89;
        _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "Reporting KT Metric success. {metricName: %@}", buf, 0xCu);
      }
      id v85 = +[TransparencyAnalytics logger];
      long long v86 = +[NSString stringWithFormat:@"%@-%u", @"IDS_manateeBuddyTime", v5];
      [v85 logSuccessForEventNamed:v86];
    }

    self->_hasReportedManateeBuddyTime = 1;
  }
  if (v141)
  {
    uint64_t v90 = [v8 registeredTime];
    [v90 timeIntervalSinceDate:self->_manateeAvailableDate];
    double v92 = v91;

    unsigned int v93 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      id v94 = +[NSString stringWithFormat:@"%@-%u", @"IDS_manateeIDSNoKTRegTime", v5];
      *(_DWORD *)buf = 138412546;
      id v148 = v94;
      __int16 v149 = 2048;
      double v150 = v92;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Reporting KT Metric {metricName: %@, timeInterval: %f", buf, 0x16u);
    }
    long long v95 = +[TransparencyAnalytics logger];
    long long v96 = +[NSNumber numberWithDouble:v92];
    id v97 = +[NSString stringWithFormat:@"%@-%u", @"IDS_manateeIDSNoKTRegTime", v5];
    [v95 logMetric:v96 withName:v97];
  }
  if (v142)
  {
    id v98 = [v8 registeredTime];
    [v98 timeIntervalSinceDate:self->_manateeAvailableDate];
    double v100 = v99;

    v101 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      id v102 = +[NSString stringWithFormat:@"%@-%u", @"IDS_manateeIDSKTRegTime", v5];
      *(_DWORD *)buf = 138412546;
      id v148 = v102;
      __int16 v149 = 2048;
      double v150 = v100;
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "Reporting KT Metric {metricName: %@, timeInterval: %f", buf, 0x16u);
    }
    char v103 = +[TransparencyAnalytics logger];
    v104 = +[NSNumber numberWithDouble:v100];
    v105 = +[NSString stringWithFormat:@"%@-%u", @"IDS_manateeIDSKTRegTime", v5];
    [v103 logMetric:v104 withName:v105];
  }
  if (v143 && !v30)
  {
    if (self->_buddyFinishDate)
    {
      v106 = [v8 registeredTime];
      [v106 timeIntervalSinceDate:self->_buddyFinishDate];
      double v108 = v107;

      id v109 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
      {
        id v110 = +[NSString stringWithFormat:@"%@-%u", @"IDS_buddyIDSNoKTRegTime", v5];
        *(_DWORD *)buf = 138412546;
        id v148 = v110;
        __int16 v149 = 2048;
        double v150 = v108;
        _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "Reporting KT Metric {metricName: %@, timeInterval: %f", buf, 0x16u);
      }
      uint64_t v111 = +[TransparencyAnalytics logger];
      long long v112 = +[NSNumber numberWithDouble:v108];
      long long v113 = +[NSString stringWithFormat:@"%@-%u", @"IDS_buddyIDSNoKTRegTime", v5];
      [v111 logMetric:v112 withName:v113];
    }
    else
    {
      long long v114 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
      {
        id v115 = +[NSString stringWithFormat:@"%@-%u", @"IDS_buddyIDSNoKTRegTime", v5];
        *(_DWORD *)buf = 138412290;
        id v148 = v115;
        _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "Reporting KT Metric success. {metricName: %@}", buf, 0xCu);
      }
      uint64_t v111 = +[TransparencyAnalytics logger];
      long long v112 = +[NSString stringWithFormat:@"%@-%u", @"IDS_buddyIDSNoKTRegTime", v5];
      [v111 logSuccessForEventNamed:v112];
    }
  }
  if (v144 && !v30)
  {
    if (self->_buddyFinishDate)
    {
      NSErrorUserInfoKey v116 = [v8 registeredTime];
      [v116 timeIntervalSinceDate:self->_buddyFinishDate];
      double v118 = v117;

      id v119 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
      {
        id v120 = +[NSString stringWithFormat:@"%@-%u", @"IDS_buddyIDSKTRegTime", v5];
        *(_DWORD *)buf = 138412546;
        id v148 = v120;
        __int16 v149 = 2048;
        double v150 = v118;
        _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "Reporting KT Metric {metricName: %@, timeInterval: %f", buf, 0x16u);
      }
      id v121 = +[TransparencyAnalytics logger];
      NSErrorUserInfoKey v122 = +[NSNumber numberWithDouble:v118];
      id v123 = +[NSString stringWithFormat:@"%@-%u", @"IDS_buddyIDSKTRegTime", v5];
      [v121 logMetric:v122 withName:v123];
    }
    else
    {
      long long v124 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      {
        id v125 = +[NSString stringWithFormat:@"%@-%u", @"IDS_buddyIDSKTRegTime", v5];
        *(_DWORD *)buf = 138412290;
        id v148 = v125;
        _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "Reporting KT Metric success. {metricName: %@}", buf, 0xCu);
      }
      id v121 = +[TransparencyAnalytics logger];
      NSErrorUserInfoKey v122 = +[NSString stringWithFormat:@"%@-%u", @"IDS_buddyIDSKTRegTime", v5];
      [v121 logSuccessForEventNamed:v122];
    }
  }
  if (v146)
  {
    __int16 v126 = [v9 registeredTime];
    if (v126)
    {
      id v127 = [v8 registeredTime];
      NSErrorUserInfoKey v128 = [v9 registeredTime];
      [v127 timeIntervalSinceDate:v128];
      double v130 = v129;
    }
    else
    {
      double v130 = 0.0;
    }

    NSErrorUserInfoKey v131 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
    {
      id v132 = +[NSString stringWithFormat:@"%@-%u", @"IDS_IDSNoKTRegIDSKTRegTime", v5];
      *(_DWORD *)buf = 138412546;
      id v148 = v132;
      __int16 v149 = 2048;
      double v150 = v130;
      _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEFAULT, "Reporting KT Metric {metricName: %@, timeInterval: %f", buf, 0x16u);
    }
    NSErrorUserInfoKey v133 = +[TransparencyAnalytics logger];
    id v134 = +[NSNumber numberWithDouble:v130];
    v135 = +[NSString stringWithFormat:@"%@-%u", @"IDS_IDSNoKTRegIDSKTRegTime", v5];
    [v133 logMetric:v134 withName:v135];
  }
  if (!v145)
  {
    iCloudSignInDate = self->_iCloudSignInDate;
    self->_iCloudSignInDate = 0;

    v137 = self->_buddyFinishDate;
    self->_buddyFinishDate = 0;

    v138 = self->_manateeAvailableDate;
    self->_manateeAvailableDate = 0;

    *(_WORD *)&self->_hasReportediCloudBuddyTime = 0;
    self->_hasReportedManateeBuddyTime = 0;
  }
  id v25 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v27 = "Finished reporting KT time metrics.";
    goto LABEL_137;
  }
LABEL_138:
}

- (void)noteiCloudSignInTime
{
  BOOL v3 = +[NSDate now];
  iCloudSignInDate = self->_iCloudSignInDate;
  self->_iCloudSignInDate = v3;

  _objc_release_x1(v3, iCloudSignInDate);
}

- (void)noteBuddyFinishTime
{
  BOOL v3 = +[NSDate now];
  buddyFinishDate = self->_buddyFinishDate;
  self->_buddyFinishDate = v3;

  _objc_release_x1(v3, buddyFinishDate);
}

- (void)noteManateeAvailableTime
{
  BOOL v3 = +[NSDate now];
  manateeAvailableDate = self->_manateeAvailableDate;
  self->_manateeAvailableDate = v3;

  _objc_release_x1(v3, manateeAvailableDate);
}

- (NSMutableDictionary)serviceIndexToKTRegDataConfigs
{
  return self->_serviceIndexToKTRegDataConfigs;
}

- (void)setServiceIndexToKTRegDataConfigs:(id)a3
{
}

- (IDSRegistrationKeyManagerIdentityDataSource)identityDataSource
{
  return self->_identityDataSource;
}

- (void)setIdentityDataSource:(id)a3
{
}

- (TransparencyDaemon)transparencyDaemon
{
  return self->_transparencyDaemon;
}

- (void)setTransparencyDaemon:(id)a3
{
}

- (NSDate)iCloudSignInDate
{
  return self->_iCloudSignInDate;
}

- (void)setICloudSignInDate:(id)a3
{
}

- (NSDate)buddyFinishDate
{
  return self->_buddyFinishDate;
}

- (void)setBuddyFinishDate:(id)a3
{
}

- (NSDate)manateeAvailableDate
{
  return self->_manateeAvailableDate;
}

- (void)setManateeAvailableDate:(id)a3
{
}

- (BOOL)hasReportediCloudBuddyTime
{
  return self->_hasReportediCloudBuddyTime;
}

- (void)setHasReportediCloudBuddyTime:(BOOL)a3
{
  self->_hasReportediCloudBuddyTime = a3;
}

- (BOOL)hasReportediCloudManateeTime
{
  return self->_hasReportediCloudManateeTime;
}

- (void)setHasReportediCloudManateeTime:(BOOL)a3
{
  self->_hasReportediCloudManateeTime = a3;
}

- (BOOL)hasReportedManateeBuddyTime
{
  return self->_hasReportedManateeBuddyTime;
}

- (void)setHasReportedManateeBuddyTime:(BOOL)a3
{
  self->_hasReportedManateeBuddyTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manateeAvailableDate, 0);
  objc_storeStrong((id *)&self->_buddyFinishDate, 0);
  objc_storeStrong((id *)&self->_iCloudSignInDate, 0);
  objc_storeStrong((id *)&self->_transparencyDaemon, 0);
  objc_storeStrong((id *)&self->_identityDataSource, 0);

  objc_storeStrong((id *)&self->_serviceIndexToKTRegDataConfigs, 0);
}

@end