@interface RPCompanionLinkDevice
- (BOOL)checkIfHomeHubDeviceIsLookingForItsHubWithLocalDevice:(id)a3;
- (BOOL)checkIfHubIsLookingForAHomeHubDeviceItIsHostingWithLocalDevice:(id)a3;
- (BOOL)hasAnyDiscoveryFlags;
- (BOOL)hasIOS;
- (BOOL)hasValidDiscoveryTypeForLocalDevice:(id)a3;
- (BOOL)hasWatchOS;
- (BOOL)isCompanionLinkDeviceAProxyHost;
- (BOOL)isCompanionLinkDeviceAnAudioAccessory;
- (BOOL)isCompanionLinkHomeHubDevice;
- (BOOL)isDiscoveredOverBLE;
- (BOOL)isDiscoveredOverInfraWifi;
- (BOOL)isDiscoveredOverWifiP2P;
- (BOOL)isGuestDevice;
- (BOOL)isMeDevice;
- (BOOL)isOwner;
- (BOOL)willUseProxyCommunicationWithLocalDevice:(id)a3;
- (id)_ad_siriSharedData;
- (id)_ad_siriSharedDataProtobuf;
- (id)getAceDiscoveryType;
- (int)getHALDiscoveryType;
@end

@implementation RPCompanionLinkDevice

- (id)_ad_siriSharedData
{
  v2 = [(RPCompanionLinkDevice *)self _ad_siriSharedDataProtobuf];
  v3 = objc_msgSend(v2, "_ad_data");

  return v3;
}

- (id)_ad_siriSharedDataProtobuf
{
  v2 = [(RPCompanionLinkDevice *)self siriInfo];
  v3 = [v2 objectForKey:@"sharedDataProtoBuf"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = [[_ADPBDeviceSetDataRequest alloc] initWithData:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasAnyDiscoveryFlags
{
  id v3 = [(RPCompanionLinkDevice *)self statusFlags];
  if (v3)
  {
    if ([(RPCompanionLinkDevice *)self isDiscoveredOverInfraWifi]
      || [(RPCompanionLinkDevice *)self isDiscoveredOverWifiP2P])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = [(RPCompanionLinkDevice *)self isDiscoveredOverBLE];
    }
  }
  return (char)v3;
}

- (id)getAceDiscoveryType
{
  if ([(RPCompanionLinkDevice *)self isDiscoveredOverInfraWifi])
  {
    id v3 = (void **)&SARemoteDeviceDiscoveryModeInfraWifiValue;
  }
  else if ([(RPCompanionLinkDevice *)self isDiscoveredOverWifiP2P])
  {
    id v3 = (void **)&SARemoteDeviceDiscoveryModeWifiP2PValue;
  }
  else
  {
    unsigned int v4 = [(RPCompanionLinkDevice *)self isDiscoveredOverBLE];
    id v3 = (void **)&SARemoteDeviceDiscoveryModeUnknownValue;
    if (v4) {
      id v3 = (void **)&SARemoteDeviceDiscoveryModeBluetoothValue;
    }
  }
  v5 = *v3;
  return v5;
}

- (BOOL)willUseProxyCommunicationWithLocalDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(RPCompanionLinkDevice *)self checkIfHomeHubDeviceIsLookingForItsHubWithLocalDevice:v4];
  unsigned int v6 = [(RPCompanionLinkDevice *)self checkIfHubIsLookingForAHomeHubDeviceItIsHostingWithLocalDevice:v4];

  v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v9 = @"NO";
    v12 = "-[RPCompanionLinkDevice(AssistantAdditions) willUseProxyCommunicationWithLocalDevice:]";
    if (v5) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    int v11 = 136315650;
    CFStringRef v14 = v10;
    __int16 v13 = 2112;
    if (v6) {
      CFStringRef v9 = @"YES";
    }
    __int16 v15 = 2112;
    CFStringRef v16 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s isHomeHubDeviceLookingForItsHub: %@, isHubLookingForADeviceItIsHosting: %@", (uint8_t *)&v11, 0x20u);
  }
  return v5 | v6;
}

- (int)getHALDiscoveryType
{
  if ([(RPCompanionLinkDevice *)self isDiscoveredOverInfraWifi]) {
    return 1;
  }
  if ([(RPCompanionLinkDevice *)self isDiscoveredOverWifiP2P]) {
    return 2;
  }
  if ([(RPCompanionLinkDevice *)self isDiscoveredOverBLE]) {
    return 3;
  }
  return 0;
}

- (BOOL)hasWatchOS
{
  v2 = [(RPCompanionLinkDevice *)self model];
  unsigned __int8 v3 = [v2 hasPrefix:@"Watch"];

  return v3;
}

- (BOOL)hasIOS
{
  unsigned __int8 v3 = [(RPCompanionLinkDevice *)self model];
  if ([v3 hasPrefix:@"iPhone"])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned int v5 = [(RPCompanionLinkDevice *)self model];
    unsigned __int8 v4 = [v5 hasPrefix:@"iPad"];
  }
  return v4;
}

- (BOOL)isOwner
{
  return ((unint64_t)[(RPCompanionLinkDevice *)self statusFlags] >> 19) & 1;
}

- (BOOL)isMeDevice
{
  LODWORD(v3) = [(RPCompanionLinkDevice *)self isOwner];
  if (v3) {
    return ((unint64_t)[(RPCompanionLinkDevice *)self statusFlags] >> 7) & 1;
  }
  return v3;
}

- (BOOL)checkIfHubIsLookingForAHomeHubDeviceItIsHostingWithLocalDevice:(id)a3
{
  id v4 = a3;
  if ([(RPCompanionLinkDevice *)self isCompanionLinkDeviceAProxyHost])
  {
    unsigned int v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315138;
      CFStringRef v16 = "-[RPCompanionLinkDevice(AssistantAdditions) checkIfHubIsLookingForAHomeHubDeviceItIsHostingWithLocalDevice:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Target Device has ProxyHost status flag. Return true if local device is HomePod/HHDevice and target device is Sidekick.", (uint8_t *)&v15, 0xCu);
    }
    unsigned int v6 = [v4 isCompanionLinkDeviceAnAudioAccessory];
    unsigned int v7 = [v4 isCompanionLinkHomeHubDevice];
    unsigned int v8 = [(RPCompanionLinkDevice *)self isCompanionLinkHomeHubDevice];
    CFStringRef v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v12 = @"NO";
      if (v6) {
        CFStringRef v13 = @"YES";
      }
      else {
        CFStringRef v13 = @"NO";
      }
      int v15 = 136315906;
      CFStringRef v16 = "-[RPCompanionLinkDevice(AssistantAdditions) checkIfHubIsLookingForAHomeHubDeviceItIsHostingWithLocalDevice:]";
      if (v7) {
        CFStringRef v14 = @"YES";
      }
      else {
        CFStringRef v14 = @"NO";
      }
      CFStringRef v18 = v13;
      __int16 v17 = 2112;
      __int16 v19 = 2112;
      CFStringRef v20 = v14;
      if (v8) {
        CFStringRef v12 = @"YES";
      }
      __int16 v21 = 2112;
      CFStringRef v22 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s isLocalDeviceAnAudioAccessory: %@, isLocalDeviceHomeHubDevice: %@, isTargetDeviceHomeHubDevice: %@", (uint8_t *)&v15, 0x2Au);
    }
    char v10 = (v6 | v7) & v8;
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)checkIfHomeHubDeviceIsLookingForItsHubWithLocalDevice:(id)a3
{
  id v4 = a3;
  if ([(RPCompanionLinkDevice *)self hasAnyDiscoveryFlags])
  {
    char v5 = 0;
  }
  else
  {
    unsigned int v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315138;
      CFStringRef v14 = "-[RPCompanionLinkDevice(AssistantAdditions) checkIfHomeHubDeviceIsLookingForItsHubWithLocalDevice:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s Device does not have any discovery status flags. Return true if local device is sidekick and target device is homehub. ", (uint8_t *)&v13, 0xCu);
    }
    unsigned int v7 = [v4 isCompanionLinkHomeHubDevice];
    unsigned int v8 = [(RPCompanionLinkDevice *)self isCompanionLinkDeviceAnAudioAccessory];
    CFStringRef v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v11 = @"NO";
      CFStringRef v14 = "-[RPCompanionLinkDevice(AssistantAdditions) checkIfHomeHubDeviceIsLookingForItsHubWithLocalDevice:]";
      if (v7) {
        CFStringRef v12 = @"YES";
      }
      else {
        CFStringRef v12 = @"NO";
      }
      int v13 = 136315650;
      CFStringRef v16 = v12;
      __int16 v15 = 2112;
      if (v8) {
        CFStringRef v11 = @"YES";
      }
      __int16 v17 = 2112;
      CFStringRef v18 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s isLocalDeviceHomeHubDevice: %@, isTargetDeviceAnAudioAccessory: %@.", (uint8_t *)&v13, 0x20u);
    }
    char v5 = v7 & v8;
  }

  return v5;
}

- (BOOL)hasValidDiscoveryTypeForLocalDevice:(id)a3
{
  id v4 = a3;
  char v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[RPCompanionLinkDevice(AssistantAdditions) hasValidDiscoveryTypeForLocalDevice:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  if (+[AFFeatureFlags isForceBLEDiscoveryForCompanionLinkEnabled])
  {
    unsigned int v6 = [(RPCompanionLinkDevice *)self willUseProxyCommunicationWithLocalDevice:v4];
    unsigned int v7 = [(RPCompanionLinkDevice *)self isDiscoveredOverInfraWifi];
    unsigned int v8 = +[AFFeatureFlags isAWDLFallbackForPersonalRequestsEnabled];
    if ([v4 isCompanionLinkHomeHubDevice]) {
      unsigned int v9 = 0;
    }
    else {
      unsigned int v9 = ![(RPCompanionLinkDevice *)self isCompanionLinkHomeHubDevice];
    }
    if ([(RPCompanionLinkDevice *)self hasIOS])
    {
      [(RPCompanionLinkDevice *)self operatingSystemVersion];
      if (v23)
      {
        [(RPCompanionLinkDevice *)self operatingSystemVersion];
        BOOL v12 = v22 > 17;
LABEL_16:
        unsigned int v14 = [(RPCompanionLinkDevice *)self isDiscoveredOverWifiP2P] & v9 & v12 & v8;
        __int16 v15 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          CFStringRef v17 = @"NO";
          if (v6) {
            CFStringRef v18 = @"YES";
          }
          else {
            CFStringRef v18 = @"NO";
          }
          *(_DWORD *)buf = 136316418;
          v25 = "-[RPCompanionLinkDevice(AssistantAdditions) hasValidDiscoveryTypeForLocalDevice:]";
          if (v7) {
            CFStringRef v19 = @"YES";
          }
          else {
            CFStringRef v19 = @"NO";
          }
          __int16 v26 = 2112;
          CFStringRef v27 = v18;
          if (v14) {
            CFStringRef v20 = @"YES";
          }
          else {
            CFStringRef v20 = @"NO";
          }
          __int16 v28 = 2112;
          CFStringRef v29 = v19;
          if (v8) {
            CFStringRef v21 = @"YES";
          }
          else {
            CFStringRef v21 = @"NO";
          }
          __int16 v30 = 2112;
          CFStringRef v31 = v20;
          if (v12) {
            CFStringRef v17 = @"YES";
          }
          __int16 v32 = 2112;
          CFStringRef v33 = v21;
          __int16 v34 = 2112;
          CFStringRef v35 = v17;
          _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s willUseProxyCommunicationWithLocalDevice: %@, isDeviceDiscoveredOverInfraWifi: %@, shouldAllowAWDLFallback: %@, isAWDLFallbackForPersonalRequestsEnabled: %@, meetMinIOSVersion: %@", buf, 0x3Eu);
        }
        char v11 = v6 | v7 | v14;
        goto LABEL_18;
      }
      int v13 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[RPCompanionLinkDevice(AssistantAdditions) hasValidDiscoveryTypeForLocalDevice:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s operating system is missing, likely a secondary user. Proceed the request to handle error later.", buf, 0xCu);
      }
    }
    BOOL v12 = 1;
    goto LABEL_16;
  }
  char v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[RPCompanionLinkDevice(AssistantAdditions) hasValidDiscoveryTypeForLocalDevice:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s BLE discovery is disabled, discovery type is valid.", buf, 0xCu);
  }
  char v11 = 1;
LABEL_18:

  return v11;
}

- (BOOL)isGuestDevice
{
  v2 = [(RPCompanionLinkDevice *)self idsDeviceIdentifier];
  BOOL v3 = [v2 length] == 0;

  return v3;
}

- (BOOL)isCompanionLinkDeviceAProxyHost
{
  return ((unint64_t)[(RPCompanionLinkDevice *)self statusFlags] >> 29) & 1;
}

- (BOOL)isCompanionLinkDeviceAnAudioAccessory
{
  v2 = [(RPCompanionLinkDevice *)self model];
  unsigned __int8 v3 = [v2 hasPrefix:@"AudioAccessory"];

  return v3;
}

- (BOOL)isCompanionLinkHomeHubDevice
{
  return ((unint64_t)[(RPCompanionLinkDevice *)self statusFlags] >> 28) & 1;
}

- (BOOL)isDiscoveredOverBLE
{
  return ((unint64_t)[(RPCompanionLinkDevice *)self statusFlags] >> 1) & 1;
}

- (BOOL)isDiscoveredOverWifiP2P
{
  return ((unint64_t)[(RPCompanionLinkDevice *)self statusFlags] >> 9) & 1;
}

- (BOOL)isDiscoveredOverInfraWifi
{
  return ((unint64_t)[(RPCompanionLinkDevice *)self statusFlags] >> 2) & 1;
}

@end