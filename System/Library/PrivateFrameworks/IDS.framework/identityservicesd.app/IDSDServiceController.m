@interface IDSDServiceController
+ (BOOL)shouldLoadService:(id)a3;
+ (IDSDServiceController)sharedInstance;
- (BOOL)_anyDeviceUsingSubService:(id)a3 superService:(id)a4;
- (IDSDServiceController)init;
- (IDSServiceProperties)gameCenterService;
- (IDSServiceProperties)iCloudService;
- (IDSServiceProperties)iTunesService;
- (NSArray)allFamilyServices;
- (NSArray)allPinningEnforcedServices;
- (NSArray)allServices;
- (NSArray)allServicesStrings;
- (NSArray)allTinkerServices;
- (NSDictionary)serviceNameToControlCategoryMap;
- (NSSet)allAdHocServices;
- (NSSet)allPrimaryServices;
- (OS_dispatch_queue)queue;
- (id)_combinedServicesForAllDevices;
- (id)_currentSubServicesForDevice:(id)a3 superService:(id)a4;
- (id)adHocServicesForIdentifier:(id)a3;
- (id)allServicesWithAdHocServiceType:(unsigned int)a3;
- (id)linkedServicesForService:(id)a3;
- (id)primaryServiceForAdhocServiceType:(unsigned int)a3;
- (id)serviceLoader;
- (id)serviceWithIdentifier:(id)a3;
- (id)serviceWithName:(id)a3;
- (id)serviceWithPushTopic:(id)a3;
- (id)userDefaults;
- (void)_loadService:(id)a3;
- (void)_loadServices;
- (void)_loadSubServiceWithName:(id)a3 usingService:(id)a4 completionBlock:(id)a5;
- (void)_loadSubServices;
- (void)_saveSubServices;
- (void)_unloadServiceWithName:(id)a3;
- (void)_updateSubServicesForDevice:(id)a3 superService:(id)a4 newSubservices:(id)a5;
- (void)setQueue:(id)a3;
- (void)updateSubServices:(id)a3 forService:(id)a4 deviceUniqueID:(id)a5;
@end

@implementation IDSDServiceController

- (id)primaryServiceForAdhocServiceType:(unsigned int)a3
{
  v4 = 0;
  switch(a3)
  {
    case 1u:
    case 2u:
    case 5u:
      CFStringRef v5 = (const __CFString *)IDSRegistrationServiceTypeMultiplex1;
      goto LABEL_7;
    case 3u:
      CFStringRef v5 = @"com.apple.madrid";
      goto LABEL_7;
    case 6u:
      CFStringRef v5 = @"com.apple.private.ac";
      goto LABEL_7;
    case 7u:
      CFStringRef v5 = @"com.apple.ess";
      goto LABEL_7;
    case 8u:
      CFStringRef v5 = @"com.apple.private.alloy.itunes";
LABEL_7:
      v4 = [(IDSDServiceController *)self serviceWithIdentifier:v5];
      break;
    default:
      break;
  }

  return v4;
}

- (id)serviceWithIdentifier:(id)a3
{
  if (a3)
  {
    v4 = -[NSMapTable objectForKey:](self->_services, "objectForKey:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (IDSDServiceController)sharedInstance
{
  if (qword_100A4C928 != -1) {
    dispatch_once(&qword_100A4C928, &stru_10098B628);
  }
  v2 = (void *)qword_100A4C930;

  return (IDSDServiceController *)v2;
}

- (NSArray)allServices
{
  return NSAllMapTableValues(self->_services);
}

- (NSArray)allServicesStrings
{
  return NSAllMapTableKeys(self->_services);
}

- (IDSDServiceController)init
{
  v14.receiver = self;
  v14.super_class = (Class)IDSDServiceController;
  v2 = [(IDSDServiceController *)&v14 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable strongToStrongObjectsMapTable];
    services = v2->_services;
    v2->_services = (NSMapTable *)v3;

    uint64_t v5 = +[NSMapTable strongToStrongObjectsMapTable];
    servicesToTopicMap = v2->_servicesToTopicMap;
    v2->_servicesToTopicMap = (NSMapTable *)v5;

    uint64_t v7 = +[NSMapTable strongToStrongObjectsMapTable];
    servicesToNameMap = v2->_servicesToNameMap;
    v2->_servicesToNameMap = (NSMapTable *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deviceIDToSubServicesMap = v2->_deviceIDToSubServicesMap;
    v2->_deviceIDToSubServicesMap = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    serviceNameToControlCategoryMap = v2->_serviceNameToControlCategoryMap;
    v2->_serviceNameToControlCategoryMap = v11;

    [(IDSDServiceController *)v2 _loadServices];
    [(IDSDServiceController *)v2 _loadSubServices];
  }
  return v2;
}

- (id)serviceLoader
{
  return +[IDSDependencyProvider serviceLoader];
}

- (id)userDefaults
{
  return +[IDSDependencyProvider userDefaults];
}

- (IDSServiceProperties)iTunesService
{
  return (IDSServiceProperties *)[(IDSDServiceController *)self serviceWithIdentifier:@"com.apple.private.alloy.itunes"];
}

- (IDSServiceProperties)iCloudService
{
  return (IDSServiceProperties *)[(IDSDServiceController *)self serviceWithIdentifier:@"com.apple.private.alloy.multiplex1"];
}

- (IDSServiceProperties)gameCenterService
{
  return (IDSServiceProperties *)[(IDSDServiceController *)self serviceWithIdentifier:@"com.apple.private.alloy.arcade"];
}

+ (BOOL)shouldLoadService:(id)a3
{
  id v3 = a3;
  v4 = +[FTDeviceSupport sharedInstance];
  if ([v4 lowRAMDevice])
  {
    unsigned __int8 v5 = [v3 disableOnLowRAMDevice];

    if ((v5 & 1) == 0)
    {
LABEL_8:
      if ([v3 prototypingOnly])
      {
        v9 = +[IMLockdownManager sharedInstance];
        if (![v9 isInternalInstall])
        {
          BOOL v8 = 0;
LABEL_17:

          goto LABEL_18;
        }
        unsigned __int8 v10 = _os_feature_enabled_impl();
      }
      else
      {
        v11 = [v3 identifier];
        unsigned int v12 = [v11 isEqualToString:@"com.apple.private.alloy.keysharing"];

        if (v12)
        {
          v9 = +[FTDeviceSupport sharedInstance];
          unsigned __int8 v10 = [v9 supportsKeySharing];
        }
        else
        {
          v13 = [v3 identifier];
          unsigned int v14 = [v13 isEqualToString:@"com.apple.private.alloy.harmony.pushprovisioning"];

          if (!v14)
          {
            BOOL v8 = 1;
            goto LABEL_18;
          }
          v9 = +[FTDeviceSupport sharedInstance];
          unsigned __int8 v10 = [v9 supportsHarmony];
        }
      }
      BOOL v8 = v10;
      goto LABEL_17;
    }
  }
  else
  {
    v6 = +[FTDeviceSupport sharedInstance];
    if ([v6 deviceType] != (id)4)
    {

      goto LABEL_8;
    }
    unsigned __int8 v7 = [v3 disableOnLowRAMDevice];

    if ((v7 & 1) == 0) {
      goto LABEL_8;
    }
  }
  BOOL v8 = 0;
LABEL_18:

  return v8;
}

- (void)_loadServices
{
  id v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1007226AC();
  }

  id v25 = objc_alloc_init((Class)NSMutableArray);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v4 = [(IDSDServiceController *)self serviceLoader];
  unsigned __int8 v5 = [v4 loadServiceDictionaries];

  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v9);
        if ([v10 count])
        {
          unsigned int v12 = [objc_alloc((Class)IDSServiceProperties) initWithServiceDictionary:v10];
          v13 = [v12 identifier];
          id v14 = [v13 length];

          if (v14)
          {
            if (+[IDSDServiceController shouldLoadService:v12])
            {
              [v25 addObject:v12];
              goto LABEL_19;
            }
            v15 = +[IMRGLog warning];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v10;
              _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Not loading service %@", buf, 0xCu);
            }
          }
          else
          {
            v15 = +[IMRGLog warning];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v10;
              _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Not loading service, invalid dictionary %@ missing identifier", buf, 0xCu);
            }
          }
        }
        else
        {
          unsigned int v12 = +[IMRGLog warning];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
            sub_10072266C(&v30, v31, v12);
          }
        }
LABEL_19:

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v7);
  }

  id v17 = [objc_alloc((Class)NSArray) initWithArray:v25 copyItems:1];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v18 = v17;
  id v19 = [v18 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        [(IDSDServiceController *)self _loadService:*(void *)(*((void *)&v26 + 1) + 8 * i)];
      }
      id v20 = [v18 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v20);
  }

  v23 = +[IMRGLog registration];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_100722638();
  }
}

- (void)_loadService:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1007226E0();
  }

  services = self->_services;
  id v7 = [v4 identifier];
  [(NSMapTable *)services setObject:v4 forKey:v7];

  uint64_t v8 = [v4 identifier];
  v9 = [v4 serviceName];
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    servicesToNameMap = self->_servicesToNameMap;
    unsigned int v12 = [v4 serviceName];
    [(NSMapTable *)servicesToNameMap setObject:v4 forKey:v12];
  }
  v13 = [v4 identifier];
  id v14 = [v4 pushTopic];
  unsigned __int8 v15 = [v13 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    servicesToTopicMap = self->_servicesToTopicMap;
    id v17 = [v4 pushTopic];
    [(NSMapTable *)servicesToTopicMap setObject:v4 forKey:v17];
  }
  if ([v4 controlCategory])
  {
    serviceNameToControlCategoryMap = self->_serviceNameToControlCategoryMap;
    id v19 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 controlCategory]);
    id v20 = [(NSMutableDictionary *)serviceNameToControlCategoryMap objectForKey:v19];

    if (!v20)
    {
      id v20 = objc_alloc_init((Class)NSMutableArray);
      uint64_t v21 = self->_serviceNameToControlCategoryMap;
      v22 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 controlCategory]);
      [(NSMutableDictionary *)v21 setObject:v20 forKey:v22];
    }
    v23 = [v4 identifier];
    [v20 addObject:v23];
  }
}

- (void)_unloadServiceWithName:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [(NSMapTable *)self->_services removeObjectForKey:v4];
    [(NSMapTable *)self->_servicesToNameMap removeObjectForKey:v4];
    [(NSMapTable *)self->_servicesToTopicMap removeObjectForKey:v4];
  }
  else
  {
    unsigned __int8 v5 = +[IMRGLog warning];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100722754();
    }
  }
}

- (void)_loadSubServiceWithName:(id)a3 usingService:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, BOOL))a5;
  v11 = [(IDSDServiceController *)self serviceWithPushTopic:v9];
  if (v11)
  {
    unsigned int v12 = [(IDSDServiceController *)self serviceWithPushTopic:v8];

    if (!v12)
    {
      id v13 = [v11 copy];
      [v13 setServiceName:v8];
      [v13 setDisplayName:v8];
      [v13 setIdentifier:v8];
      [v13 setPushTopic:v8];
      [v13 setSuperService:v9];
      [(IDSDServiceController *)self _loadService:v13];
      id v14 = +[IMRGLog registration];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "   %@", (uint8_t *)&v16, 0xCu);
      }
    }
    if (v10) {
      v10[2](v10, v12 == 0);
    }
  }
  else
  {
    unsigned __int8 v15 = +[IMRGLog warning];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_1007227BC();
    }
  }
}

- (void)updateSubServices:(id)a3 forService:(id)a4 deviceUniqueID:(id)a5
{
  id v49 = a3;
  id v8 = a4;
  id v51 = a5;
  v50 = [(IDSDServiceController *)self serviceWithPushTopic:v8];
  if (v50)
  {
    id v9 = +[IDSPairingManager sharedInstance];
    v48 = [v9 allTraditionallyPairedUniqueIDs];

    if ([v48 containsObject:v51])
    {
      v47 = [(IDSDServiceController *)self _currentSubServicesForDevice:v51 superService:v8];
      unsigned __int8 v10 = +[IMRGLog sub_services];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v51;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v47;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Current sub-services for device %@: %@", buf, 0x16u);
      }

      if (v47 && [v47 isEqualToArray:v49])
      {
        v11 = +[IMRGLog sub_services];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "New set of subservices are the same, ignoring update", buf, 2u);
        }
      }
      else
      {
        [(IDSDServiceController *)self _updateSubServicesForDevice:v51 superService:v8 newSubservices:v49];
        int v16 = +[IMRGLog sub_services];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          deviceIDToSubServicesMap = self->_deviceIDToSubServicesMap;
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = deviceIDToSubServicesMap;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Updated sub-services map %@", buf, 0xCu);
        }

        [(IDSDServiceController *)self _saveSubServices];
        id v18 = [objc_alloc((Class)NSMutableSet) initWithArray:v47];
        id v19 = +[NSSet setWithArray:v49];
        [v18 minusSet:v19];

        id v20 = [v18 allObjects];
        id v21 = [v20 _copyForEnumerating];

        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v22 = v21;
        id v23 = [v22 countByEnumeratingWithState:&v66 objects:v77 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v67;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v67 != v24) {
                objc_enumerationMutation(v22);
              }
              uint64_t v26 = *(void *)(*((void *)&v66 + 1) + 8 * i);
              if ([(IDSDServiceController *)self _anyDeviceUsingSubService:v26 superService:v8])
              {
                long long v27 = +[IMRGLog sub_services];
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v26;
                  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Told to remove %@ but another device still needs it", buf, 0xCu);
                }

                [v18 removeObject:v26];
              }
            }
            id v23 = [v22 countByEnumeratingWithState:&v66 objects:v77 count:16];
          }
          while (v23);
        }

        if ([v18 count])
        {
          id v28 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v18, @"RemovedServices", 0);
          long long v29 = +[IMRGLog sub_services];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v28;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Posting notification with userInfo %@", buf, 0xCu);
          }

          uint8_t v30 = +[NSNotificationCenter defaultCenter];
          [v30 postNotificationName:@"_kIDSDServiceControllerServicesRemovedNotification" object:self userInfo:v28];
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        char v76 = 0;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        obj = v18;
        id v31 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
        if (v31)
        {
          uint64_t v32 = *(void *)v63;
          do
          {
            for (j = 0; j != v31; j = (char *)j + 1)
            {
              if (*(void *)v63 != v32) {
                objc_enumerationMutation(obj);
              }
              uint64_t v34 = *(void *)(*((void *)&v62 + 1) + 8 * (void)j);
              long long v35 = +[IMRGLog sub_services];
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v72 = 138412290;
                uint64_t v73 = v34;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Unloading   %@", v72, 0xCu);
              }

              [(IDSDServiceController *)self _unloadServiceWithName:v34];
            }
            id v31 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
          }
          while (v31);
        }

        v36 = +[IMRGLog sub_services];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v72 = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Loaded sub-services:", v72, 2u);
        }

        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v37 = v49;
        id v38 = [v37 countByEnumeratingWithState:&v58 objects:v71 count:16];
        if (v38)
        {
          uint64_t v39 = *(void *)v59;
          do
          {
            for (k = 0; k != v38; k = (char *)k + 1)
            {
              if (*(void *)v59 != v39) {
                objc_enumerationMutation(v37);
              }
              uint64_t v41 = *(void *)(*((void *)&v58 + 1) + 8 * (void)k);
              v57[0] = _NSConcreteStackBlock;
              v57[1] = 3221225472;
              v57[2] = sub_1003DF3F0;
              v57[3] = &unk_10098B650;
              v57[4] = buf;
              [(IDSDServiceController *)self _loadSubServiceWithName:v41 usingService:v8 completionBlock:v57];
            }
            id v38 = [v37 countByEnumeratingWithState:&v58 objects:v71 count:16];
          }
          while (v38);
        }

        if ([obj count] || *(unsigned char *)(*(void *)&buf[8] + 24))
        {
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          v42 = NSAllMapTableValues(self->_services);
          id v43 = [v42 countByEnumeratingWithState:&v53 objects:v70 count:16];
          if (v43)
          {
            uint64_t v44 = *(void *)v54;
            do
            {
              for (m = 0; m != v43; m = (char *)m + 1)
              {
                if (*(void *)v54 != v44) {
                  objc_enumerationMutation(v42);
                }
                [*(id *)(*((void *)&v53 + 1) + 8 * (void)m) reloadAdHocServices];
              }
              id v43 = [v42 countByEnumeratingWithState:&v53 objects:v70 count:16];
            }
            while (v43);
          }

          if (*(unsigned char *)(*(void *)&buf[8] + 24))
          {
            v46 = +[NSNotificationCenter defaultCenter];
            [v46 postNotificationName:@"_kIDSDServiceControllerServicesChangedNotification" object:self userInfo:0];
          }
        }
        _Block_object_dispose(buf, 8);
        v11 = obj;
      }

      unsigned __int8 v15 = v47;
    }
    else
    {
      id v14 = +[IMRGLog warning];
      unsigned __int8 v15 = v14;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        sub_1007228A8();
        unsigned __int8 v15 = v14;
      }
    }

    id v13 = v48;
  }
  else
  {
    unsigned int v12 = +[IMRGLog warning];
    id v13 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      sub_100722840();
      id v13 = v12;
    }
  }
}

- (void)_saveSubServices
{
  if ([(NSMutableDictionary *)self->_deviceIDToSubServicesMap count])
  {
    id v3 = objc_alloc((Class)NSMutableDictionary);
    id v4 = objc_msgSend(v3, "initWithObjectsAndKeys:", self->_deviceIDToSubServicesMap, off_100A44490, &off_1009D2388, off_100A44498, 0);
    unsigned __int8 v5 = +[IMRGLog sub_services];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Top level map %@", buf, 0xCu);
    }

    id v6 = [(IDSDServiceController *)self userDefaults];
    id v7 = v6;
    id v8 = off_100A444A0;
    id v9 = v4;
    unsigned __int8 v10 = 0;
  }
  else
  {
    id v4 = [(IDSDServiceController *)self userDefaults];
    id v14 = off_100A44490;
    id v7 = +[NSArray arrayWithObjects:&v14 count:1];
    id v8 = off_100A444A0;
    id v6 = v4;
    id v9 = 0;
    unsigned __int8 v10 = v7;
  }
  [v6 setMultiple:v9 remove:v10 appID:v8];

  v11 = [(IDSDServiceController *)self userDefaults];
  [v11 synchronizeAppID:off_100A444A0];
}

- (void)_loadSubServices
{
  id v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100722910();
  }

  id v4 = [(IDSDServiceController *)self userDefaults];
  v89[0] = off_100A44498;
  v89[1] = off_100A44490;
  unsigned __int8 v5 = +[NSArray arrayWithObjects:v89 count:2];
  id v6 = (NSMutableDictionary *)[v4 copyMultipleForCurrentKeys:v5 appID:off_100A444A0];

  id v7 = +[IMRGLog sub_services];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v88 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Loaded preferences from disk: %@", buf, 0xCu);
  }

  id v8 = +[IDSPairingManager sharedInstance];
  id v9 = [v8 pairedDeviceUniqueID];

  unsigned __int8 v10 = [(NSMutableDictionary *)v6 objectForKey:off_100A44498];
  unsigned int v11 = [v10 unsignedIntValue];

  long long v62 = v9;
  if (v11)
  {
    id v12 = objc_alloc((Class)NSMutableDictionary);
    id v13 = [(NSMutableDictionary *)v6 objectForKey:off_100A44490];
    id v14 = (NSMutableDictionary *)[v12 initWithDictionary:v13];
    deviceIDToSubServicesMap = self->_deviceIDToSubServicesMap;
    self->_deviceIDToSubServicesMap = v14;
  }
  else
  {
    if ([v9 length])
    {
      id v16 = objc_alloc((Class)NSMutableDictionary);
      id v17 = [(NSMutableDictionary *)v6 objectForKey:off_100A44490];
      id v18 = (NSMutableDictionary *)objc_msgSend(v16, "initWithObjectsAndKeys:", v17, v9, 0);
      id v19 = self->_deviceIDToSubServicesMap;
      self->_deviceIDToSubServicesMap = v18;
    }
    else
    {
      id v17 = self->_deviceIDToSubServicesMap;
      self->_deviceIDToSubServicesMap = 0;
    }

    [(IDSDServiceController *)self _saveSubServices];
  }
  id v20 = +[IMRGLog sub_services];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = self->_deviceIDToSubServicesMap;
    *(_DWORD *)buf = 138412290;
    v88 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Loaded sub services from disk: %@", buf, 0xCu);
  }

  long long v63 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableSet);
  id v22 = +[IDSPairingManager sharedInstance];
  long long v66 = [v22 allTraditionallyPairedUniqueIDs];

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v23 = [(NSMutableDictionary *)self->_deviceIDToSubServicesMap allKeys];
  id v24 = [v23 countByEnumeratingWithState:&v79 objects:v86 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v80;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v80 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v79 + 1) + 8 * i);
        if (([v66 containsObject:v28] & 1) == 0) {
          [(NSMutableDictionary *)v63 addObject:v28];
        }
      }
      id v25 = [v23 countByEnumeratingWithState:&v79 objects:v86 count:16];
    }
    while (v25);
  }

  long long v29 = +[IMRGLog sub_services];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v88 = v63;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Stale entries: %@", buf, 0xCu);
  }

  uint8_t v30 = v62;
  if ([(NSMutableDictionary *)v63 count])
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v31 = [(NSMutableDictionary *)v63 allObjects];
    id v32 = [v31 countByEnumeratingWithState:&v75 objects:v85 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v76;
      do
      {
        for (j = 0; j != v33; j = (char *)j + 1)
        {
          if (*(void *)v76 != v34) {
            objc_enumerationMutation(v31);
          }
          [(NSMutableDictionary *)self->_deviceIDToSubServicesMap removeObjectForKey:*(void *)(*((void *)&v75 + 1) + 8 * (void)j)];
        }
        id v33 = [v31 countByEnumeratingWithState:&v75 objects:v85 count:16];
      }
      while (v33);
    }

    v36 = +[IMRGLog sub_services];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = self->_deviceIDToSubServicesMap;
      *(_DWORD *)buf = 138412290;
      v88 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Cleaned up map: %@", buf, 0xCu);
    }

    [(IDSDServiceController *)self _saveSubServices];
  }
  if (!-[NSMutableDictionary count](self->_deviceIDToSubServicesMap, "count") && [v62 length])
  {
    id v38 = +[NSDictionary dictionary];
    uint64_t v39 = +[NSDictionary dictionaryWithObject:v38 forKey:off_100A44490];

    id v40 = objc_alloc((Class)NSMutableDictionary);
    uint64_t v41 = [v39 objectForKey:off_100A44490];
    v42 = (NSMutableDictionary *)objc_msgSend(v40, "initWithObjectsAndKeys:", v41, v62, 0);
    id v43 = self->_deviceIDToSubServicesMap;
    self->_deviceIDToSubServicesMap = v42;

    uint64_t v44 = +[IMRGLog sub_services];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = self->_deviceIDToSubServicesMap;
      *(_DWORD *)buf = 138412290;
      v88 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Fixed empty map %@", buf, 0xCu);
    }

    [(IDSDServiceController *)self _saveSubServices];
  }
  v46 = [(IDSDServiceController *)self _combinedServicesForAllDevices];
  v47 = +[IMRGLog sub_services];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v88 = v46;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Combined services %@", buf, 0xCu);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = [(NSMutableDictionary *)v46 allKeys];
  id v48 = [obj countByEnumeratingWithState:&v71 objects:v84 count:16];
  if (v48)
  {
    id v49 = v48;
    long long v61 = v6;
    v50 = 0;
    uint64_t v65 = *(void *)v72;
    do
    {
      id v51 = 0;
      v52 = v50;
      do
      {
        if (*(void *)v72 != v65) {
          objc_enumerationMutation(obj);
        }
        uint64_t v53 = *(void *)(*((void *)&v71 + 1) + 8 * (void)v51);
        v50 = [(IDSDServiceController *)self serviceWithPushTopic:v53];

        if (v50)
        {
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v54 = v46;
          long long v55 = [(NSMutableDictionary *)v46 objectForKey:v53];
          id v56 = [v55 countByEnumeratingWithState:&v67 objects:v83 count:16];
          if (v56)
          {
            id v57 = v56;
            uint64_t v58 = *(void *)v68;
            do
            {
              for (k = 0; k != v57; k = (char *)k + 1)
              {
                if (*(void *)v68 != v58) {
                  objc_enumerationMutation(v55);
                }
                [(IDSDServiceController *)self _loadSubServiceWithName:*(void *)(*((void *)&v67 + 1) + 8 * (void)k) usingService:v53 completionBlock:0];
              }
              id v57 = [v55 countByEnumeratingWithState:&v67 objects:v83 count:16];
            }
            while (v57);
          }

          v46 = v54;
        }
        id v51 = (char *)v51 + 1;
        v52 = v50;
      }
      while (v51 != v49);
      id v49 = [obj countByEnumeratingWithState:&v71 objects:v84 count:16];
    }
    while (v49);

    id v6 = v61;
    uint8_t v30 = v62;
  }

  long long v60 = +[IMRGLog registration];
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
    sub_100722638();
  }
}

- (id)_combinedServicesForAllDevices
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v19 = self;
  id obj = [(NSMutableDictionary *)self->_deviceIDToSubServicesMap allKeys];
  id v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v28;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v4;
        unsigned __int8 v5 = [(NSMutableDictionary *)v19->_deviceIDToSubServicesMap _dictionaryForKey:*(void *)(*((void *)&v27 + 1) + 8 * v4)];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v22 = [v5 allKeys];
        id v6 = [v22 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = *(void *)v24;
          do
          {
            for (i = 0; i != v7; i = (char *)i + 1)
            {
              if (*(void *)v24 != v8) {
                objc_enumerationMutation(v22);
              }
              uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              unsigned int v11 = [v3 _arrayForKey:v10];
              id v12 = [v5 _arrayForKey:v10];
              id v13 = objc_alloc_init((Class)NSMutableSet);
              id v14 = v13;
              if (v11) {
                [v13 addObjectsFromArray:v11];
              }
              if (v12) {
                [v14 addObjectsFromArray:v12];
              }
              unsigned __int8 v15 = [v14 allObjects];
              [v3 setObject:v15 forKey:v10];
            }
            id v7 = [v22 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v7);
        }

        uint64_t v4 = v21 + 1;
      }
      while ((id)(v21 + 1) != v20);
      id v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v20);
  }

  return v3;
}

- (BOOL)_anyDeviceUsingSubService:(id)a3 superService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v8 = [(NSMutableDictionary *)self->_deviceIDToSubServicesMap allKeys];
  id v24 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v9 = *(void *)v31;
    uint64_t v22 = *(void *)v31;
    long long v23 = self;
    long long v25 = v8;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v8);
        }
        unsigned int v11 = -[NSMutableDictionary _dictionaryForKey:](self->_deviceIDToSubServicesMap, "_dictionaryForKey:", *(void *)(*((void *)&v30 + 1) + 8 * (void)v10), v22, v23);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v12 = [v11 allKeys];
        id v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v27;
          while (2)
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v27 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              if ([v17 isEqualToIgnoringCase:v7])
              {
                uint64_t v18 = [v11 _arrayForKey:v17];
                unsigned __int8 v19 = [v18 containsObject:v6];

                if (v19)
                {

                  BOOL v20 = 1;
                  uint64_t v8 = v25;
                  goto LABEL_20;
                }
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        uint64_t v10 = (char *)v10 + 1;
        self = v23;
        uint64_t v8 = v25;
        uint64_t v9 = v22;
      }
      while (v10 != v24);
      BOOL v20 = 0;
      id v24 = [v25 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v24);
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_20:

  return v20;
}

- (void)_updateSubServicesForDevice:(id)a3 superService:(id)a4 newSubservices:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 length])
  {
    id v11 = objc_alloc((Class)NSMutableDictionary);
    id v12 = [(NSMutableDictionary *)self->_deviceIDToSubServicesMap objectForKey:v8];
    id v13 = [v11 initWithDictionary:v12];

    if ([v10 count]) {
      [v13 setObject:v10 forKey:v9];
    }
    else {
      [v13 removeObjectForKey:v9];
    }
    [(NSMutableDictionary *)self->_deviceIDToSubServicesMap setObject:v13 forKey:v8];
  }
  else
  {
    id v14 = +[IMRGLog warning];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_100722944();
    }
  }
}

- (id)_currentSubServicesForDevice:(id)a3 superService:(id)a4
{
  deviceIDToSubServicesMap = self->_deviceIDToSubServicesMap;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)deviceIDToSubServicesMap _dictionaryForKey:a3];
  id v8 = [v7 _arrayForKey:v6];

  return v8;
}

- (id)allServicesWithAdHocServiceType:(unsigned int)a3
{
  id v6 = objc_alloc_init((Class)NSMutableSet);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = NSAllMapTableValues(self->_services);
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "adHocServiceType", (void)v14) == a3) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (NSSet)allPrimaryServices
{
  return (NSSet *)[(IDSDServiceController *)self allServicesWithAdHocServiceType:0];
}

- (NSArray)allTinkerServices
{
  v2 = NSAllMapTableValues(self->_services);
  id v3 = objc_msgSend(v2, "__imArrayByFilteringWithBlock:", &stru_10098B670);

  return (NSArray *)v3;
}

- (NSArray)allFamilyServices
{
  v2 = NSAllMapTableValues(self->_services);
  id v3 = objc_msgSend(v2, "__imArrayByFilteringWithBlock:", &stru_10098B690);

  return (NSArray *)v3;
}

- (NSArray)allPinningEnforcedServices
{
  v2 = NSAllMapTableValues(self->_services);
  id v3 = objc_msgSend(v2, "__imArrayByFilteringWithBlock:", &stru_10098B6B0);

  return (NSArray *)v3;
}

- (NSDictionary)serviceNameToControlCategoryMap
{
  id v2 = [(NSMutableDictionary *)self->_serviceNameToControlCategoryMap copy];

  return (NSDictionary *)v2;
}

- (id)serviceWithName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = [(NSMapTable *)self->_services objectForKey:v4];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [(NSMapTable *)self->_servicesToNameMap objectForKey:v4];
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)serviceWithPushTopic:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = [(NSMapTable *)self->_services objectForKey:v4];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [(NSMapTable *)self->_servicesToTopicMap objectForKey:v4];
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)linkedServicesForService:(id)a3
{
  id v3 = [a3 linkedServiceNames];
  if ([v3 count])
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v11 = +[IDSDServiceController sharedInstance];
          id v12 = [v11 serviceWithIdentifier:v10];

          if (v12) {
            [v4 addObject:v12];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    if ([v4 count]) {
      id v13 = v4;
    }
    else {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)adHocServicesForIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToIgnoringCase:IDSRegistrationServiceTypeMultiplex1])
  {
    id v5 = +[IDSDServiceController sharedInstance];
    id v6 = [v5 allServicesWithAdHocServiceType:1];
    id v7 = [v6 allObjects];

    uint64_t v8 = +[IDSDServiceController sharedInstance];
    id v9 = [v8 allServicesWithAdHocServiceType:2];
    uint64_t v10 = [v9 allObjects];

    id v11 = +[IDSDServiceController sharedInstance];
    id v12 = [v11 allServicesWithAdHocServiceType:5];
    id v13 = [v12 allObjects];

    id v14 = objc_alloc_init((Class)NSMutableArray);
    long long v15 = v14;
    if (v7) {
      [v14 addObjectsFromArray:v7];
    }
    if (v10) {
      [v15 addObjectsFromArray:v10];
    }
    if (v13) {
      [v15 addObjectsFromArray:v13];
    }

LABEL_19:
    goto LABEL_20;
  }
  if ([v3 isEqualToIgnoringCase:@"com.apple.madrid"])
  {
    long long v16 = +[IDSDServiceController sharedInstance];
    long long v17 = v16;
    uint64_t v18 = 3;
    goto LABEL_17;
  }
  if ([v3 isEqualToIgnoringCase:@"com.apple.private.ac"])
  {
    long long v16 = +[IDSDServiceController sharedInstance];
    long long v17 = v16;
    uint64_t v18 = 6;
    goto LABEL_17;
  }
  if ([v3 isEqualToIgnoringCase:@"com.apple.ess"])
  {
    long long v16 = +[IDSDServiceController sharedInstance];
    long long v17 = v16;
    uint64_t v18 = 7;
    goto LABEL_17;
  }
  if ([v3 isEqualToIgnoringCase:@"com.apple.private.alloy.itunes"])
  {
    long long v16 = +[IDSDServiceController sharedInstance];
    long long v17 = v16;
    uint64_t v18 = 8;
LABEL_17:
    unsigned __int8 v19 = [v16 allServicesWithAdHocServiceType:v18];
    id v7 = [v19 allObjects];

    id v20 = objc_alloc_init((Class)NSMutableArray);
    long long v15 = v20;
    if (v7) {
      [v20 addObjectsFromArray:v7];
    }
    goto LABEL_19;
  }
  long long v15 = 0;
LABEL_20:
  if (![v15 count])
  {

    long long v15 = 0;
  }

  return v15;
}

- (NSSet)allAdHocServices
{
  return self->_allAdHocServices;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_allAdHocServices, 0);
  objc_storeStrong((id *)&self->_serviceNameToControlCategoryMap, 0);
  objc_storeStrong((id *)&self->_deviceIDToSubServicesMap, 0);
  objc_storeStrong((id *)&self->_servicesToTopicMap, 0);
  objc_storeStrong((id *)&self->_servicesToNameMap, 0);

  objc_storeStrong((id *)&self->_services, 0);
}

@end