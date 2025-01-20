@interface ACCPlatformDigitalAudioManager
+ (id)getManager;
+ (int)sampleRateEnumFromValue:(unsigned int)a3;
+ (unsigned)sampleRateMaskFromEnum:(int)a3;
+ (unsigned)sampleRateValueFromEnum:(int)a3;
- (ACCPlatformDigitalAudioManager)init;
- (BOOL)bDigAudIsActive;
- (BOOL)bDigAudSendNewProp;
- (BOOL)newAudioPropertyNotification;
- (BOOL)setDigitalAudioEndpointUUID:(id)a3 withSupportedSampleRates:(unsigned int)a4;
- (NSString)digAudEndpointUUID;
- (id)supportedSampleRatesList;
- (int)digAudSampleEnum;
- (unsigned)convertToSupportedSampleRate:(unsigned int)a3;
- (unsigned)currentSampleRate;
- (unsigned)digAudSampleMask;
- (unsigned)digAudSoundCheck;
- (unsigned)digAudVolumeLevel;
- (void)dealloc;
- (void)sendAudioStateChangedNotification;
- (void)setBDigAudIsActive:(BOOL)a3;
- (void)setBDigAudSendNewProp:(BOOL)a3;
- (void)setDigAudEndpointUUID:(id)a3;
- (void)setDigAudSampleEnum:(int)a3;
- (void)setDigAudSampleMask:(unsigned int)a3;
- (void)setDigAudSoundCheck:(unsigned int)a3;
- (void)setDigAudVolumeLevel:(unsigned int)a3;
- (void)startAudioPropertyNotifications;
- (void)stopAudioPropertyNotifications;
- (void)updateSampleRate:(unsigned int)a3;
- (void)updateSoundCheck:(unsigned int)a3;
- (void)updateVolumeLevel:(unsigned int)a3;
@end

@implementation ACCPlatformDigitalAudioManager

+ (id)getManager
{
  if (getManager_once != -1) {
    dispatch_once(&getManager_once, &__block_literal_global_39);
  }
  v2 = (void *)getManager_sharedInstance;

  return v2;
}

void __44__ACCPlatformDigitalAudioManager_getManager__block_invoke(id a1)
{
  getManager_sharedInstance = objc_alloc_init(ACCPlatformDigitalAudioManager);

  _objc_release_x1();
}

+ (unsigned)sampleRateValueFromEnum:(int)a3
{
  if (a3 < 9) {
    return dword_1001B8990[a3];
  }
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 7;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    v7 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    +[ACCPlatformDigitalAudioManager sampleRateValueFromEnum:](a3, v7);
  }

  return 0;
}

+ (int)sampleRateEnumFromValue:(unsigned int)a3
{
  if ((int)a3 <= 22049)
  {
    if ((int)a3 > 11999)
    {
      if (a3 == 12000) {
        return 2;
      }
      if (a3 == 16000) {
        return 3;
      }
    }
    else
    {
      if (a3 == 8000) {
        return 0;
      }
      if (a3 == 11025) {
        return 1;
      }
    }
  }
  else if ((int)a3 <= 31999)
  {
    if (a3 == 22050) {
      return 4;
    }
    if (a3 == 24000) {
      return 5;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x7D00u:
        return 6;
      case 0xAC44u:
        return 7;
      case 0xBB80u:
        return 8;
    }
  }
  if (gLogObjects && gNumLogObjects >= 8)
  {
    BOOL v5 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v5 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[ACCPlatformDigitalAudioManager sampleRateEnumFromValue:](a3, v5);
  }

  return 9;
}

+ (unsigned)sampleRateMaskFromEnum:(int)a3
{
  if (a3 >= 9) {
    return 0;
  }
  else {
    return 1 << a3;
  }
}

- (ACCPlatformDigitalAudioManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACCPlatformDigitalAudioManager;
  v2 = [(ACCPlatformDigitalAudioManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    digAudEndpointUUID = v2->_digAudEndpointUUID;
    v2->_digAudEndpointUUID = 0;

    *(_OWORD *)&v3->_digAudSampleEnum = xmmword_1001B8980;
    *(_WORD *)&v3->_bDigAudSendNewProp = 0;
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ACCPlatformDigitalAudioManager;
  [(ACCPlatformDigitalAudioManager *)&v2 dealloc];
}

- (BOOL)setDigitalAudioEndpointUUID:(id)a3 withSupportedSampleRates:(unsigned int)a4
{
  if (a3)
  {
    uint64_t v5 = *(void *)&a4;
    [(ACCPlatformDigitalAudioManager *)self setDigAudEndpointUUID:a3];
    [(ACCPlatformDigitalAudioManager *)self setDigAudSampleMask:v5];
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 8;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v9 = &_os_log_default;
      id v8 = &_os_log_default;
    }
    else
    {
      v9 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = [(ACCPlatformDigitalAudioManager *)self digAudEndpointUUID];
      int v12 = 138412546;
      v13 = v10;
      __int16 v14 = 1024;
      unsigned int v15 = [(ACCPlatformDigitalAudioManager *)self digAudSampleMask];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[#DigitalAudio] digAudEndpointUUID: %@, digAudSampleMask: %u", (uint8_t *)&v12, 0x12u);
    }
  }
  return a3 != 0;
}

- (void)sendAudioStateChangedNotification
{
}

- (void)startAudioPropertyNotifications
{
  [(ACCPlatformDigitalAudioManager *)self setBDigAudSendNewProp:1];
  [(ACCPlatformDigitalAudioManager *)self setBDigAudIsActive:1];

  [(ACCPlatformDigitalAudioManager *)self sendAudioStateChangedNotification];
}

- (void)stopAudioPropertyNotifications
{
  [(ACCPlatformDigitalAudioManager *)self setBDigAudIsActive:0];
  [(ACCPlatformDigitalAudioManager *)self setBDigAudSendNewProp:0];

  [(ACCPlatformDigitalAudioManager *)self sendAudioStateChangedNotification];
}

- (BOOL)newAudioPropertyNotification
{
  if ([(ACCPlatformDigitalAudioManager *)self bDigAudIsActive])
  {
    v17[0] = @"SampleRate";
    v3 = +[NSNumber numberWithUnsignedChar:[(ACCPlatformDigitalAudioManager *)self digAudSampleEnum]];
    v18[0] = v3;
    v17[1] = @"VolumeLevel";
    v4 = +[NSNumber numberWithUnsignedInt:[(ACCPlatformDigitalAudioManager *)self digAudVolumeLevel]];
    v18[1] = v4;
    v17[2] = @"SoundCheck";
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:[(ACCPlatformDigitalAudioManager *)self digAudSoundCheck]];
    v18[2] = v5;
    objc_super v6 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

    if (gLogObjects && gNumLogObjects >= 8)
    {
      BOOL v7 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v7 = &_os_log_default;
      id v9 = &_os_log_default;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = [(ACCPlatformDigitalAudioManager *)self digAudEndpointUUID];
      int v13 = 138412546;
      __int16 v14 = v10;
      __int16 v15 = 2112;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[#DigitalAudio] endpointUUID: %@: attributes: %@", (uint8_t *)&v13, 0x16u);
    }
    v11 = [(ACCPlatformDigitalAudioManager *)self digAudEndpointUUID];
    int v8 = accFeatureHandlers_invokeHandler(v11, 23, (uint64_t)v6);

    if (v8) {
      [(ACCPlatformDigitalAudioManager *)self setBDigAudSendNewProp:0];
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (unsigned)currentSampleRate
{
  if ([(ACCPlatformDigitalAudioManager *)self bDigAudIsActive]) {
    unsigned int v3 = +[ACCPlatformDigitalAudioManager sampleRateValueFromEnum:[(ACCPlatformDigitalAudioManager *)self digAudSampleEnum]];
  }
  else {
    unsigned int v3 = 0;
  }
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 8;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    objc_super v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    objc_super v6 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[#DigitalAudio] curSampleRate: %d", (uint8_t *)v8, 8u);
  }

  return v3;
}

- (unsigned)convertToSupportedSampleRate:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(ACCPlatformDigitalAudioManager *)self bDigAudIsActive])
  {
    unsigned int v5 = +[ACCPlatformDigitalAudioManager sampleRateMaskFromEnum:](ACCPlatformDigitalAudioManager, "sampleRateMaskFromEnum:", +[ACCPlatformDigitalAudioManager sampleRateEnumFromValue:v3]);
    unsigned int v6 = v3;
    if (([(ACCPlatformDigitalAudioManager *)self digAudSampleMask] & v5) == 0)
    {
      if (v5)
      {
        if ((v5 & 0x24) != 0) {
          int v7 = 48000;
        }
        else {
          int v7 = 0;
        }
        if ((v5 & 0x12) != 0) {
          int v8 = 44100;
        }
        else {
          int v8 = v7;
        }
        if ((v5 & 9) != 0) {
          unsigned int v6 = 32000;
        }
        else {
          unsigned int v6 = v8;
        }
      }
      else
      {
        uint64_t v13 = 0;
        do
        {
          unsigned int v6 = dword_1001B8990[v13];
          unsigned int v14 = +[ACCPlatformDigitalAudioManager sampleRateMaskFromEnum:v13];
          unsigned int v15 = [(ACCPlatformDigitalAudioManager *)self digAudSampleMask] & v14;
        }
        while ((v6 < v3 || v15 == 0) && v13++ != 8);
      }
    }
  }
  else
  {
    unsigned int v6 = 0;
  }
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 8;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v11 = &_os_log_default;
    id v10 = &_os_log_default;
  }
  else
  {
    v11 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v18[0] = 67109376;
    v18[1] = v3;
    __int16 v19 = 1024;
    unsigned int v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[#DigitalAudio] inputSampleRate: %d outputSampleRate: %d", (uint8_t *)v18, 0xEu);
  }

  return v6;
}

- (void)updateSampleRate:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(ACCPlatformDigitalAudioManager *)self bDigAudIsActive])
  {
    uint64_t v5 = +[ACCPlatformDigitalAudioManager sampleRateEnumFromValue:v3];
    if (v5 <= 8)
    {
      uint64_t v6 = v5;
      unsigned int v7 = [(ACCPlatformDigitalAudioManager *)self digAudSampleMask];
      if ((+[ACCPlatformDigitalAudioManager sampleRateMaskFromEnum:v6] & v7) != 0&& ([(ACCPlatformDigitalAudioManager *)self digAudSampleEnum] != v6|| [(ACCPlatformDigitalAudioManager *)self bDigAudSendNewProp]))
      {
        [(ACCPlatformDigitalAudioManager *)self setDigAudSampleEnum:v6];
        if (gLogObjects && gNumLogObjects >= 8)
        {
          int v8 = *(id *)(gLogObjects + 56);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          int v8 = &_os_log_default;
          id v9 = &_os_log_default;
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v10[0] = 67109120;
          v10[1] = [(ACCPlatformDigitalAudioManager *)self digAudSampleEnum];
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[#DigitalAudio] digAudSampleEnum: %d", (uint8_t *)v10, 8u);
        }

        [(ACCPlatformDigitalAudioManager *)self newAudioPropertyNotification];
      }
    }
  }
}

- (void)updateVolumeLevel:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(ACCPlatformDigitalAudioManager *)self bDigAudIsActive]
    && ([(ACCPlatformDigitalAudioManager *)self digAudVolumeLevel] != v3
     || [(ACCPlatformDigitalAudioManager *)self bDigAudSendNewProp]))
  {
    [(ACCPlatformDigitalAudioManager *)self setDigAudVolumeLevel:v3];
    if (gLogObjects && gNumLogObjects >= 8)
    {
      uint64_t v5 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v5 = &_os_log_default;
      id v6 = &_os_log_default;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = [(ACCPlatformDigitalAudioManager *)self digAudVolumeLevel];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[#DigitalAudio] digAudVolumeLevel: %d", (uint8_t *)v7, 8u);
    }

    [(ACCPlatformDigitalAudioManager *)self newAudioPropertyNotification];
  }
}

- (void)updateSoundCheck:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(ACCPlatformDigitalAudioManager *)self bDigAudIsActive]
    && ([(ACCPlatformDigitalAudioManager *)self digAudSoundCheck] != v3
     || [(ACCPlatformDigitalAudioManager *)self bDigAudSendNewProp]))
  {
    [(ACCPlatformDigitalAudioManager *)self setDigAudSoundCheck:v3];
    if (gLogObjects && gNumLogObjects >= 8)
    {
      uint64_t v5 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v5 = &_os_log_default;
      id v6 = &_os_log_default;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = [(ACCPlatformDigitalAudioManager *)self digAudSoundCheck];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[#DigitalAudio] digAudSoundCheck: %d", (uint8_t *)v7, 8u);
    }

    [(ACCPlatformDigitalAudioManager *)self newAudioPropertyNotification];
  }
}

- (id)supportedSampleRatesList
{
  if ([(ACCPlatformDigitalAudioManager *)self digAudSampleMask])
  {
    uint64_t v3 = +[NSMutableArray array];
    uint64_t v4 = 0;
    int v5 = 1;
    do
    {
      if (([(ACCPlatformDigitalAudioManager *)self digAudSampleMask] & v5) != 0)
      {
        id v6 = +[NSNumber numberWithInt:dword_1001B8990[v4]];
        [v3 addObject:v6];
      }
      v5 *= 2;
      ++v4;
    }
    while (v4 != 9);
  }
  else
  {
    uint64_t v3 = 0;
  }
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 8;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    int v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[#DigitalAudio] pSuppSampRates: %@", (uint8_t *)&v11, 0xCu);
  }

  return v3;
}

- (NSString)digAudEndpointUUID
{
  return self->_digAudEndpointUUID;
}

- (void)setDigAudEndpointUUID:(id)a3
{
}

- (int)digAudSampleEnum
{
  return self->_digAudSampleEnum;
}

- (void)setDigAudSampleEnum:(int)a3
{
  self->_digAudSampleEnum = a3;
}

- (unsigned)digAudSampleMask
{
  return self->_digAudSampleMask;
}

- (void)setDigAudSampleMask:(unsigned int)a3
{
  self->_digAudSampleMask = a3;
}

- (unsigned)digAudVolumeLevel
{
  return self->_digAudVolumeLevel;
}

- (void)setDigAudVolumeLevel:(unsigned int)a3
{
  self->_digAudVolumeLevel = a3;
}

- (unsigned)digAudSoundCheck
{
  return self->_digAudSoundCheck;
}

- (void)setDigAudSoundCheck:(unsigned int)a3
{
  self->_digAudSoundCheck = a3;
}

- (BOOL)bDigAudSendNewProp
{
  return self->_bDigAudSendNewProp;
}

- (void)setBDigAudSendNewProp:(BOOL)a3
{
  self->_bDigAudSendNewProp = a3;
}

- (BOOL)bDigAudIsActive
{
  return self->_bDigAudIsActive;
}

- (void)setBDigAudIsActive:(BOOL)a3
{
  self->_bDigAudIsActive = a3;
}

- (void).cxx_destruct
{
}

+ (void)sampleRateValueFromEnum:(int)a1 .cold.1(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[#DigitalAudio] Invalid Sample Rate Enum : %d", (uint8_t *)v2, 8u);
}

+ (void)sampleRateEnumFromValue:(int)a1 .cold.1(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[#DigitalAudio] Invalid Sample Rate Value : %d", (uint8_t *)v2, 8u);
}

@end