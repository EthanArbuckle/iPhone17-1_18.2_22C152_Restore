@interface ACCPlatformPluginWiFiSharing
- (BOOL)handleAccessoryWiFiInformationForWirelessCarPlay:(id)a3;
- (BOOL)hasWAPICapability;
- (BOOL)isDeviceConnectedToWiFi;
- (BOOL)isRunning;
- (NSString)pluginName;
- (id)copyDeviceWiFiNetworkInformation;
- (void)initPlugin;
- (void)setIsRunning:(BOOL)a3;
- (void)startPlugin;
- (void)stopPlugin;
@end

@implementation ACCPlatformPluginWiFiSharing

- (NSString)pluginName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)initPlugin
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22669B000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

- (void)startPlugin
{
}

- (void)stopPlugin
{
}

- (BOOL)isDeviceConnectedToWiFi
{
  uint64_t v2 = WiFiManagerClientCreate();
  if (!v2) {
    return 0;
  }
  uint64_t v3 = (const void *)v2;
  CFArrayRef v4 = (const __CFArray *)WiFiManagerClientCopyDevices();
  if (v4)
  {
    CFArrayRef v5 = v4;
    if (CFArrayGetCount(v4)
      && (CFArrayGetValueAtIndex(v5, 0), (v6 = (const void *)WiFiDeviceClientCopyCurrentNetwork()) != 0))
    {
      CFRelease(v6);
      BOOL v7 = 1;
    }
    else
    {
      BOOL v7 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    BOOL v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

- (BOOL)hasWAPICapability
{
  return self->_hasWAPICapability;
}

- (id)copyDeviceWiFiNetworkInformation
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v3 = WiFiManagerClientCreate();
  if (!v3)
  {
    v10 = 0;
    v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 1;
    goto LABEL_35;
  }
  CFArrayRef v4 = (const void *)v3;
  CFArrayRef v5 = (const __CFArray *)WiFiManagerClientCopyDevices();
  if (v5)
  {
    CFArrayRef v6 = v5;
    if (CFArrayGetCount(v5))
    {
      CFArrayGetValueAtIndex(v6, 0);
      uint64_t v7 = WiFiDeviceClientCopyCurrentNetwork();
      if (v7)
      {
        v8 = (const void *)v7;
        v9 = WiFiNetworkGetSSID();
        v27 = v9;
        if (v9) {
          v10 = (__CFString *)[v9 copy];
        }
        else {
          v10 = &stru_26DA3E8C0;
        }
        if (WiFiNetworkIsWEP())
        {
          uint64_t v13 = 0;
        }
        else
        {
          if (!WiFiNetworkIsWPA())
          {
            char v14 = 0;
            uint64_t v12 = 0;
            uint64_t v13 = 1;
LABEL_17:
            v15 = (void *)WiFiNetworkCopyPassword();
            v16 = v15;
            if (v15)
            {
              v11 = (__CFString *)[v15 copy];
            }
            else
            {
              v11 = &stru_26DA3E8C0;
              if (v14)
              {
LABEL_31:
                uint64_t v12 = 2;
LABEL_32:
                CFRelease(v8);

                goto LABEL_33;
              }
            }
            if (!WiFiNetworkRequiresUsername() && !WiFiNetworkRequiresIdentity()) {
              goto LABEL_32;
            }
            goto LABEL_31;
          }
          CFDictionaryRef v17 = (const __CFDictionary *)WiFiNetworkCopyRecord();
          uint64_t v12 = 2;
          if (!v17)
          {
            uint64_t v13 = 1;
            goto LABEL_16;
          }
          CFDictionaryRef v18 = v17;
          int v19 = CFDictionaryContainsKey(v17, @"WPA_IE");
          int v20 = CFDictionaryContainsKey(v18, @"RSN_IE");
          if (v19) {
            unsigned int v21 = 3;
          }
          else {
            unsigned int v21 = 2;
          }
          if (v20) {
            uint64_t v13 = v21;
          }
          else {
            uint64_t v13 = 1;
          }
          CFRelease(v18);
        }
        uint64_t v12 = 0;
LABEL_16:
        char v14 = 1;
        goto LABEL_17;
      }
      v10 = 0;
      v11 = 0;
      uint64_t v12 = 2;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      uint64_t v12 = 0;
    }
    uint64_t v13 = 1;
LABEL_33:
    CFRelease(v6);
    goto LABEL_34;
  }
  uint64_t v12 = 0;
  v11 = 0;
  v10 = 0;
  uint64_t v13 = 1;
LABEL_34:
  CFRelease(v4);
LABEL_35:
  v22 = [NSNumber numberWithUnsignedInt:v12];
  [v2 setObject:v22 forKey:@"WiFiStatus"];

  if (v12 != 2)
  {
    v23 = [NSNumber numberWithUnsignedInt:v13];
    [v2 setObject:v23 forKey:@"WiFiSecurityType"];

    if (v10) {
      [v2 setObject:v10 forKey:@"WiFiSSID"];
    }
    if (v11) {
      [v2 setObject:v11 forKey:@"WiFiPassphrase"];
    }
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v24 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginWiFiSharing initPlugin]();
    }
    v24 = MEMORY[0x263EF8438];
    id v25 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v2;
    _os_log_impl(&dword_22669B000, v24, OS_LOG_TYPE_INFO, "Returning deviceWiFiNetworkInformation %@", buf, 0xCu);
  }

  return v2;
}

- (BOOL)handleAccessoryWiFiInformationForWirelessCarPlay:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 objectForKey:@"WiFiBSSID"];
  CFArrayRef v5 = [v3 objectForKey:@"WiFiSSID"];
  CFArrayRef v6 = [v3 objectForKey:@"WiFiPassphrase"];
  uint64_t v7 = [v3 objectForKey:@"WiFiSecurityType"];
  v28 = [v3 objectForKey:@"WiFiChannel"];
  uint64_t v8 = [v3 objectForKey:@"LegacyAccessoryExternalAccessoryConnectionID"];
  if (v7) {
    unsigned int v9 = [v7 unsignedIntValue];
  }
  else {
    unsigned int v9 = 0;
  }
  if (!v5 || (v6 ? (BOOL v10 = v9 == 0) : (BOOL v10 = 0), v10))
  {
    v11 = (void *)v4;
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v13 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginWiFiSharing initPlugin]();
      }
      uint64_t v13 = MEMORY[0x263EF8438];
      id v14 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v5;
      _os_log_impl(&dword_22669B000, v13, OS_LOG_TYPE_DEFAULT, "ERROR: either SSID is nil (it's %@), or passphrase is present but securityType is none, not setting CarPlay WiFi params", buf, 0xCu);
    }

    int v12 = 0;
  }
  else
  {
    v11 = (void *)v4;
    int v12 = 1;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v15 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginWiFiSharing initPlugin]();
    }
    v15 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
  }
  CFDictionaryRef v17 = v11;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v3;
    _os_log_impl(&dword_22669B000, v15, OS_LOG_TYPE_DEFAULT, "accessory wifi info for CarPlay is %@", buf, 0xCu);
  }

  CFDictionaryRef v18 = (void *)v8;
  if (v12)
  {
    int v19 = [MEMORY[0x263EFF9A0] dictionary];
    int v20 = v19;
    if (v17) {
      [v19 setObject:v17 forKey:@"BSSID"];
    }
    if (v5) {
      [v20 setObject:v5 forKey:@"SSID_STR"];
    }
    if (v28) {
      [v20 setObject:v28 forKey:@"CHANNEL"];
    }
    if (v6) {
      [v20 setObject:v6 forKey:@"password"];
    }
    if (v9 >= 3)
    {
      v22 = v17;
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v23 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformPluginWiFiSharing initPlugin]();
        }
        v23 = MEMORY[0x263EF8438];
        id v24 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = v9;
        _os_log_impl(&dword_22669B000, v23, OS_LOG_TYPE_DEFAULT, "Invalid accessory security type %d", buf, 8u);
      }

      uint64_t v21 = 0;
      CFDictionaryRef v17 = v22;
      CFDictionaryRef v18 = (void *)v8;
    }
    else
    {
      uint64_t v21 = (uint64_t)*(&off_2647AB630 + (int)v9);
    }
    [v20 setObject:v21 forKey:@"securityType"];
    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v25 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginWiFiSharing initPlugin]();
      }
      id v25 = MEMORY[0x263EF8438];
      id v26 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      [(ACCPlatformPluginWiFiSharing *)(uint64_t)v20 handleAccessoryWiFiInformationForWirelessCarPlay:v25];
    }

    [v18 unsignedIntegerValue];
    CRSaveWiFiCredentialsForAccessoryConnectionIdentifier();
  }
  return 1;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (void)handleAccessoryWiFiInformationForWirelessCarPlay:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = 138412802;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = [a2 unsignedIntegerValue];
  __int16 v9 = 2048;
  uint64_t v10 = [a2 unsignedIntegerValue];
  _os_log_debug_impl(&dword_22669B000, a3, OS_LOG_TYPE_DEBUG, "Saving dictionary %@ to carPlay for EA connectionID %lu (0x%lX)", (uint8_t *)&v5, 0x20u);
}

@end