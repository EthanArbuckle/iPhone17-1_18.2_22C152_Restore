@interface __HMFMobileGestaltDataSource
- (BOOL)shouldFetchProtectedKey:(id)a3;
- (BOOL)shouldFetchUserAssignedDeviceName;
- (BOOL)supportsBLE;
- (HMFMACAddress)WiFiInterfaceMACAddress;
- (HMFSoftwareVersion)softwareVersion;
- (HMFSystemInfoNameDataSourceDelegate)delegate;
- (MGNotificationTokenStruct)notificationToken;
- (NSString)model;
- (NSString)modelIdentifier;
- (NSString)name;
- (NSString)regionInfo;
- (NSString)serialNumber;
- (OS_dispatch_queue)queue;
- (__HMFMobileGestaltDataSource)init;
- (int64_t)productClass;
- (int64_t)productColor;
- (int64_t)productPlatform;
- (int64_t)productVariant;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation __HMFMobileGestaltDataSource

- (void)setDelegate:(id)a3
{
}

- (int64_t)productVariant
{
  return self->_productVariant;
}

- (__HMFMobileGestaltDataSource)init
{
  v115[5] = *(id *)MEMORY[0x1E4F143B8];
  v106.receiver = self;
  v106.super_class = (Class)__HMFMobileGestaltDataSource;
  v2 = [(__HMFMobileGestaltDataSource *)&v106 init];
  v3 = v2;
  if (v2)
  {
    v4 = (const char *)HMFDispatchQueueName(v2, 0);
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    v8 = v3;
    v108 = @"UserAssignedDeviceName";
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
    objc_initWeak(&location, v8);
    v10 = [(__HMFMobileGestaltDataSource *)v8 queue];
    v111 = (__CFString *)MEMORY[0x1E4F143A8];
    uint64_t v112 = 3221225472;
    v113 = ____registerForUpdates_block_invoke;
    v114 = (__CFString *)&unk_1E5958238;
    objc_copyWeak(v115, &location);
    v8->_notificationToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();

    objc_destroyWeak(v115);
    objc_destroyWeak(&location);

    v11 = v8;
    v12 = (void *)MEMORY[0x1E4F1CA48];
    v111 = @"ProductType";
    uint64_t v112 = @"ModelNumber";
    v113 = (uint64_t (*)(uint64_t, const __CFString *))@"RegionInfo";
    v114 = @"ProductName";
    v115[0] = @"DeviceClass";
    v115[1] = @"ReleaseType";
    v115[2] = @"BuildVersion";
    v115[3] = @"bluetooth-le";
    v115[4] = @"DeviceColor";
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:9];
    v14 = [v12 arrayWithArray:v13];

    BOOL v15 = [(__HMFMobileGestaltDataSource *)v11 shouldFetchUserAssignedDeviceName];
    if (v15) {
      [v14 addObject:@"UserAssignedDeviceName"];
    }
    BOOL v16 = [(__HMFMobileGestaltDataSource *)v11 shouldFetchProtectedKey:@"SerialNumber"];
    if (v16) {
      [v14 addObject:@"SerialNumber"];
    }
    BOOL v17 = [(__HMFMobileGestaltDataSource *)v11 shouldFetchProtectedKey:@"WifiAddress"];
    if (v17) {
      [v14 addObject:@"WifiAddress"];
    }
    CFDictionaryRef v18 = (const __CFDictionary *)MGCopyMultipleAnswers();
    CFDictionaryRef v19 = v18;
    if (!v18) {
      goto LABEL_115;
    }
    if (v15)
    {
      Value = (void *)CFDictionaryGetValue(v18, @"UserAssignedDeviceName");
      v21 = Value;
      if (Value)
      {
        CFTypeID v22 = CFGetTypeID(Value);
        if (v22 == CFStringGetTypeID()) {
          v23 = v21;
        }
        else {
          v23 = 0;
        }
      }
      else
      {
        v23 = 0;
      }
      objc_storeStrong((id *)&v11->_name, v23);
    }
    if (v16)
    {
      v24 = (void *)CFDictionaryGetValue(v19, @"SerialNumber");
      v25 = v24;
      if (v24)
      {
        CFTypeID v26 = CFGetTypeID(v24);
        if (v26 == CFStringGetTypeID()) {
          v27 = v25;
        }
        else {
          v27 = 0;
        }
      }
      else
      {
        v27 = 0;
      }
      objc_storeStrong((id *)&v11->_serialNumber, v27);
    }
    v28 = (void *)CFDictionaryGetValue(v19, @"ProductType");
    v29 = v28;
    if (v28)
    {
      CFTypeID v30 = CFGetTypeID(v28);
      if (v30 == CFStringGetTypeID()) {
        v31 = v29;
      }
      else {
        v31 = 0;
      }
    }
    else
    {
      v31 = 0;
    }
    objc_storeStrong((id *)&v11->_modelIdentifier, v31);
    v32 = (void *)CFDictionaryGetValue(v19, @"ModelNumber");
    v33 = v32;
    if (v32)
    {
      CFTypeID v34 = CFGetTypeID(v32);
      if (v34 == CFStringGetTypeID()) {
        v35 = v33;
      }
      else {
        v35 = 0;
      }
    }
    else
    {
      v35 = 0;
    }
    objc_storeStrong((id *)&v11->_model, v35);
    v36 = (void *)CFDictionaryGetValue(v19, @"RegionInfo");
    v37 = v36;
    if (v36)
    {
      CFTypeID v38 = CFGetTypeID(v36);
      if (v38 == CFStringGetTypeID()) {
        v39 = v37;
      }
      else {
        v39 = 0;
      }
    }
    else
    {
      v39 = 0;
    }
    objc_storeStrong((id *)&v11->_regionInfo, v39);
    v40 = (void *)CFDictionaryGetValue(v19, @"ProductName");
    v41 = v40;
    if (v40)
    {
      CFTypeID v42 = CFGetTypeID(v40);
      if (v42 == CFStringGetTypeID()) {
        v43 = v41;
      }
      else {
        v43 = 0;
      }
    }
    else
    {
      v43 = 0;
    }
    v11->_productPlatform = HMFProductPlatformFromString(v43);
    v44 = (void *)CFDictionaryGetValue(v19, @"DeviceClass");
    v45 = v44;
    if (v44)
    {
      CFTypeID v46 = CFGetTypeID(v44);
      if (v46 == CFStringGetTypeID()) {
        v47 = v45;
      }
      else {
        v47 = 0;
      }
    }
    else
    {
      v47 = 0;
    }
    v48 = [v47 lowercaseString];
    v49 = [@"iPhone" lowercaseString];
    char v50 = [v48 containsString:v49];

    if (v50)
    {
      uint64_t v51 = 1;
    }
    else
    {
      v52 = [@"iPod" lowercaseString];
      char v53 = [v48 containsString:v52];

      if (v53)
      {
        uint64_t v51 = 2;
      }
      else
      {
        v54 = [@"iPad" lowercaseString];
        char v55 = [v48 containsString:v54];

        if (v55)
        {
          uint64_t v51 = 3;
        }
        else
        {
          v56 = [@"AppleTV" lowercaseString];
          char v57 = [v48 containsString:v56];

          if (v57)
          {
            uint64_t v51 = 4;
          }
          else
          {
            v58 = [@"Watch" lowercaseString];
            char v59 = [v48 containsString:v58];

            if (v59)
            {
              uint64_t v51 = 5;
            }
            else
            {
              v60 = [@"AudioAccessory" lowercaseString];
              char v61 = [v48 containsString:v60];

              if (v61)
              {
                uint64_t v51 = 6;
              }
              else
              {
                v62 = [@"RealityDevice" lowercaseString];
                int v63 = [v48 containsString:v62];

                if (v63) {
                  uint64_t v51 = 11;
                }
                else {
                  uint64_t v51 = 0;
                }
              }
            }
          }
        }
      }
    }

    v11->_productClass = v51;
    v64 = (void *)CFDictionaryGetValue(v19, @"ReleaseType");
    v65 = v64;
    if (v64)
    {
      CFTypeID v66 = CFGetTypeID(v64);
      if (v66 == CFStringGetTypeID()) {
        v67 = v65;
      }
      else {
        v67 = 0;
      }
    }
    else
    {
      v67 = 0;
    }
    v68 = [v67 lowercaseString];
    v69 = [@"Beta" lowercaseString];
    char v70 = [v68 containsString:v69];

    if (v70)
    {
      uint64_t v71 = 1;
    }
    else
    {
      v72 = [@"Carrier" lowercaseString];
      char v73 = [v68 containsString:v72];

      if (v73)
      {
        uint64_t v71 = 2;
      }
      else
      {
        v74 = [@"Internal" lowercaseString];
        int v75 = [v68 containsString:v74];

        if (v75) {
          uint64_t v71 = 3;
        }
        else {
          uint64_t v71 = 0;
        }
      }
    }

    v11->_productVariant = v71;
    v76 = (void *)CFDictionaryGetValue(v19, @"BuildVersion");
    v77 = v76;
    if (v76)
    {
      CFTypeID v78 = CFGetTypeID(v76);
      if (v78 == CFStringGetTypeID()) {
        v79 = v77;
      }
      else {
        v79 = 0;
      }
    }
    else
    {
      v79 = 0;
    }
    v108 = 0;
    uint64_t v109 = 0;
    uint64_t v110 = 0;
    v80 = (void *)MEMORY[0x1E4F28F80];
    id v81 = v79;
    v82 = [v80 processInfo];
    v83 = v82;
    if (v82)
    {
      [v82 operatingSystemVersion];
    }
    else
    {
      v108 = 0;
      uint64_t v109 = 0;
      uint64_t v110 = 0;
    }

    v84 = [HMFSoftwareVersion alloc];
    v85 = [(HMFSoftwareVersion *)v84 initWithMajorVersion:v108 minorVersion:v109 updateVersion:v110 buildVersion:v81];

    if (v85) {
      objc_storeStrong((id *)&v11->_softwareVersion, v85);
    }

    if (v17)
    {
      v86 = (void *)CFDictionaryGetValue(v19, @"WifiAddress");
      v87 = v86;
      if (v86)
      {
        CFTypeID v88 = CFGetTypeID(v86);
        if (v88 == CFStringGetTypeID())
        {
          id v89 = v87;
          v90 = [[HMFMACAddress alloc] initWithMACAddressString:v89];
          WiFiInterfaceMACAddress = v11->_WiFiInterfaceMACAddress;
          v11->_WiFiInterfaceMACAddress = v90;
        }
      }
    }
    CFBooleanRef v92 = (const __CFBoolean *)CFDictionaryGetValue(v19, @"bluetooth-le");
    CFBooleanRef v93 = v92;
    if (v92)
    {
      CFTypeID v94 = CFGetTypeID(v92);
      if (v94 == CFBooleanGetTypeID()) {
        v11->_supportsBLE = CFBooleanGetValue(v93) != 0;
      }
    }
    v95 = (void *)CFDictionaryGetValue(v19, @"DeviceColor");
    v96 = v95;
    if (v95)
    {
      CFTypeID v97 = CFGetTypeID(v95);
      if (v97 == CFStringGetTypeID()) {
        v98 = v96;
      }
      else {
        v98 = 0;
      }
    }
    else
    {
      v98 = 0;
    }
    id v99 = v98;
    uint64_t v100 = MGGetProductType();
    id v101 = v99;
    v102 = v101;
    uint64_t v103 = 0;
    if (v100 > 3348380075)
    {
      if (v100 == 4240173202) {
        goto LABEL_103;
      }
      uint64_t v104 = 3348380076;
    }
    else
    {
      if (v100 == 1540760353) {
        goto LABEL_103;
      }
      uint64_t v104 = 2702125347;
    }
    if (v100 != v104)
    {
LABEL_114:

      v11->_productColor = v103;
      CFRelease(v19);

LABEL_115:
      return v3;
    }
LABEL_103:
    if (HMFEqualObjects(v101, @"1"))
    {
      uint64_t v103 = 1;
    }
    else if (HMFEqualObjects(v102, @"2"))
    {
      uint64_t v103 = 2;
    }
    else if (HMFEqualObjects(v102, @"7"))
    {
      uint64_t v103 = 3;
    }
    else if (HMFEqualObjects(v102, @"8"))
    {
      uint64_t v103 = 4;
    }
    else if (HMFEqualObjects(v102, @"9"))
    {
      uint64_t v103 = 5;
    }
    else
    {
      uint64_t v103 = 0;
    }
    goto LABEL_114;
  }
  return v3;
}

- (BOOL)shouldFetchProtectedKey:(id)a3
{
  id v3 = a3;
  v4 = +[HMFProcessInfo processInfo];
  v5 = [v4 valueForEntitlement:@"com.apple.private.MobileGestalt.AllowedProtectedKeys"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    dispatch_queue_t v6 = v5;
  }
  else {
    dispatch_queue_t v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 containsObject:v3];
  return v8;
}

- (BOOL)shouldFetchUserAssignedDeviceName
{
  v2 = +[HMFProcessInfo processInfo];
  id v3 = [v2 valueForEntitlement:@"com.apple.developer.device-information.user-assigned-device-name"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  char v6 = [v5 BOOLValue];
  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (int64_t)productColor
{
  return self->_productColor;
}

- (HMFSoftwareVersion)softwareVersion
{
  return self->_softwareVersion;
}

- (int64_t)productPlatform
{
  return self->_productPlatform;
}

- (int64_t)productClass
{
  return self->_productClass;
}

- (void)dealloc
{
  if (self->_notificationToken != (MGNotificationTokenStruct *)-1) {
    MGCancelNotifications();
  }
  v3.receiver = self;
  v3.super_class = (Class)__HMFMobileGestaltDataSource;
  [(__HMFMobileGestaltDataSource *)&v3 dealloc];
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMFSystemInfoNameDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMFSystemInfoNameDataSourceDelegate *)WeakRetained;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)regionInfo
{
  return self->_regionInfo;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (HMFMACAddress)WiFiInterfaceMACAddress
{
  return (HMFMACAddress *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)supportsBLE
{
  return self->_supportsBLE;
}

- (MGNotificationTokenStruct)notificationToken
{
  return self->_notificationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_WiFiInterfaceMACAddress, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_regionInfo, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end