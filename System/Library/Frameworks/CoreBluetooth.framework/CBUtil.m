@interface CBUtil
+ (BOOL)isAppleVID:(unsigned __int16)a3 forVIDSrc:(unsigned __int8)a4;
+ (BOOL)isDeviceSupported:(id)a3;
+ (BOOL)isDeviceSupportedOnWatchOS:(id)a3;
+ (BOOL)isDeviceSupportedOnXROS:(id)a3;
+ (BOOL)isDeviceSupportedWithType:(unsigned __int8)a3 VIDsrc:(unsigned __int8)a4 VID:(unsigned __int16)a5 PID:(unsigned __int16)a6;
+ (BOOL)isInternalBuild;
+ (BOOL)isWatchOS;
+ (BOOL)isXROS;
+ (id)decodeApplePayloadByteStream:(id)a3;
+ (id)encodeApplePayloadByteStream:(id)a3;
+ (id)getBluetoothDebugSettingString:(__CFString *)a3 InKey:(__CFString *)a4;
+ (id)preSSPPairingCodeToString:(int64_t)a3;
+ (int64_t)preSSPStringToPairingCode:(id)a3;
+ (void)setBluetoothDebugSetting:(__CFString *)a3 InKey:(__CFString *)a4 InValue:(void *)a5;
@end

@implementation CBUtil

+ (BOOL)isAppleVID:(unsigned __int16)a3 forVIDSrc:(unsigned __int8)a4
{
  if (a4 == 2) {
    int v4 = 1452;
  }
  else {
    int v4 = 76;
  }
  return v4 == a3;
}

+ (BOOL)isWatchOS
{
  return 0;
}

+ (BOOL)isXROS
{
  return 0;
}

+ (BOOL)isDeviceSupportedOnXROS:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  int v4 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136315394;
    v26 = "+[CBUtil isDeviceSupportedOnXROS:]";
    __int16 v27 = 2112;
    *(void *)v28 = v3;
    _os_log_impl(&dword_1AB9F0000, v4, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v25, 0x16u);
  }
  v5 = [v3 valueForKey:@"DeviceType"];
  unsigned int v6 = [v5 unsignedCharValue];

  v7 = [v3 valueForKey:@"VendorIDSrc"];
  uint64_t v8 = [v7 unsignedCharValue];

  v9 = [v3 valueForKey:@"VendorID"];
  uint64_t v10 = [v9 unsignedShortValue];

  v11 = [v3 valueForKey:@"ProductID"];
  uint64_t v12 = [v11 unsignedShortValue];

  if (v8 >= 3)
  {
    if (CBLogInitOnce == -1)
    {
      v13 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
LABEL_22:
      +[CBUtil isDeviceSupportedOnXROS:](v8, v13);
      if (+[CBUtil isAppleVID:v10 forVIDSrc:v8]) {
        goto LABEL_9;
      }
LABEL_23:
      if (v6 - 16 < 5 && ((0x1Bu >> (v6 - 16)) & 1) != 0) {
        goto LABEL_29;
      }
      if (CBLogInitOnce == -1)
      {
        uint64_t v23 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_29;
        }
      }
      else
      {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        uint64_t v23 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_29;
        }
      }
      int v25 = 136446210;
      v26 = "+[CBUtil isDeviceSupportedOnXROS:]";
      v20 = "%{public}s - Third party non-audio device - APPROVED";
      v21 = v23;
      uint32_t v22 = 12;
      goto LABEL_28;
    }
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v13 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
  }
LABEL_8:
  if (!+[CBUtil isAppleVID:v10 forVIDSrc:v8]) {
    goto LABEL_23;
  }
LABEL_9:
  if (v6 > 0x31) {
    goto LABEL_18;
  }
  if (((1 << v6) & 0x1B0000) != 0) {
    goto LABEL_29;
  }
  if (((1 << v6) & 0x2000023000000) == 0)
  {
LABEL_18:
    if (CBLogInitOnce != -1)
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      uint64_t v19 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      goto LABEL_20;
    }
    uint64_t v19 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
LABEL_20:
      int v25 = 136446466;
      v26 = "+[CBUtil isDeviceSupportedOnXROS:]";
      __int16 v27 = 1024;
      *(_DWORD *)v28 = v6;
      v20 = "%{public}s - Apple device type=%d (not HID or audio) - APPROVED";
      v21 = v19;
      uint32_t v22 = 18;
LABEL_28:
      _os_log_impl(&dword_1AB9F0000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v25, v22);
    }
LABEL_29:
    char v18 = 1;
    goto LABEL_30;
  }
  v14 = [NSNumber numberWithUnsignedShort:v12];
  int v15 = [&unk_1F0302278 containsObject:v14];

  if (CBLogInitOnce == -1)
  {
    v16 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:
      v17 = "APPROVED";
      int v25 = 136447234;
      v26 = "+[CBUtil isDeviceSupportedOnXROS:]";
      *(_DWORD *)v28 = v6;
      __int16 v27 = 1024;
      if (v15) {
        v17 = "REJECTED";
      }
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v12;
      __int16 v29 = 2112;
      v30 = &unk_1F0302278;
      __int16 v31 = 2082;
      v32 = v17;
      _os_log_impl(&dword_1AB9F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s - Apple device type=%d (HID) - checking PID 0x%04X against rejected list %@ ->%{public}s", (uint8_t *)&v25, 0x2Cu);
    }
  }
  else
  {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v16 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
  }
  char v18 = v15 ^ 1;
LABEL_30:

  return v18;
}

+ (BOOL)isDeviceSupportedOnWatchOS:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  int v4 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315394;
    uint32_t v22 = "+[CBUtil isDeviceSupportedOnWatchOS:]";
    __int16 v23 = 2112;
    *(void *)v24 = v3;
    _os_log_impl(&dword_1AB9F0000, v4, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v21, 0x16u);
  }
  v5 = [v3 valueForKey:@"DeviceType"];
  int v6 = [v5 unsignedCharValue];

  v7 = [v3 valueForKey:@"VendorIDSrc"];
  uint64_t v8 = [v7 unsignedCharValue];

  v9 = [v3 valueForKey:@"VendorID"];
  uint64_t v10 = [v9 unsignedShortValue];

  v11 = [v3 valueForKey:@"ProductID"];
  uint64_t v12 = [v11 unsignedShortValue];

  if (v6 == 24)
  {
    if (+[CBUtil isAppleVID:v10 forVIDSrc:v8])
    {
      int v15 = [NSNumber numberWithUnsignedShort:v12];
      int v14 = [&unk_1F0302290 containsObject:v15];

      if (CBLogInitOnce == -1)
      {
        v16 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
      }
      else
      {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        v16 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
      }
      v17 = "REJECTED";
      uint32_t v22 = "+[CBUtil isDeviceSupportedOnWatchOS:]";
      __int16 v23 = 1024;
      int v21 = 136446978;
      *(_DWORD *)v24 = v12;
      if (v14) {
        v17 = "APPROVED";
      }
      *(_WORD *)&v24[4] = 2112;
      *(void *)&v24[6] = &unk_1F0302290;
      __int16 v25 = 2082;
      v26 = v17;
      _os_log_impl(&dword_1AB9F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s - Apple keyboard - checking PID 0x%04X against approved list %@ ->%{public}s", (uint8_t *)&v21, 0x26u);
      goto LABEL_24;
    }
    if (CBLogInitOnce == -1)
    {
      char v18 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      char v18 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
    }
    int v21 = 136446210;
    uint32_t v22 = "+[CBUtil isDeviceSupportedOnWatchOS:]";
    uint64_t v19 = "%{public}s - Third party keyboard - APPROVED";
    goto LABEL_22;
  }
  if (v6 != 25)
  {
    if (CBLogInitOnce != -1)
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      char v18 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      goto LABEL_18;
    }
    char v18 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:
      int v21 = 136446210;
      uint32_t v22 = "+[CBUtil isDeviceSupportedOnWatchOS:]";
      uint64_t v19 = "%{public}s - Not a mouse or a keyboard - APPROVED";
LABEL_22:
      _os_log_impl(&dword_1AB9F0000, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v21, 0xCu);
    }
LABEL_23:
    LOBYTE(v14) = 1;
    goto LABEL_24;
  }
  if (CBLogInitOnce != -1)
  {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v13 = CBLogComponent;
    LOBYTE(v14) = 0;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    goto LABEL_9;
  }
  v13 = CBLogComponent;
  LOBYTE(v14) = 0;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
LABEL_9:
    int v21 = 136446210;
    uint32_t v22 = "+[CBUtil isDeviceSupportedOnWatchOS:]";
    _os_log_impl(&dword_1AB9F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s - Mouse - REJECTED", (uint8_t *)&v21, 0xCu);
    LOBYTE(v14) = 0;
  }
LABEL_24:

  return v14;
}

+ (BOOL)isDeviceSupportedWithType:(unsigned __int8)a3 VIDsrc:(unsigned __int8)a4 VID:(unsigned __int16)a5 PID:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  v16[4] = *MEMORY[0x1E4F143B8];
  v15[0] = @"DeviceType";
  v9 = [NSNumber numberWithUnsignedChar:a3];
  v16[0] = v9;
  v15[1] = @"VendorIDSrc";
  uint64_t v10 = [NSNumber numberWithUnsignedChar:v8];
  v16[1] = v10;
  v15[2] = @"VendorID";
  v11 = [NSNumber numberWithUnsignedShort:v7];
  v16[2] = v11;
  v15[3] = @"ProductID";
  uint64_t v12 = [NSNumber numberWithUnsignedShort:v6];
  v16[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  LOBYTE(v6) = +[CBUtil isDeviceSupported:v13];

  return v6;
}

+ (BOOL)isDeviceSupported:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  int v4 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    v9 = "+[CBUtil isDeviceSupported:]";
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl(&dword_1AB9F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s - %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if (+[CBUtil isWatchOS])
  {
    BOOL v5 = +[CBUtil isDeviceSupportedOnWatchOS:v3];
  }
  else
  {
    if (!+[CBUtil isXROS])
    {
      BOOL v6 = 1;
      goto LABEL_11;
    }
    BOOL v5 = +[CBUtil isDeviceSupportedOnXROS:v3];
  }
  BOOL v6 = v5;
LABEL_11:

  return v6;
}

+ (int64_t)preSSPStringToPairingCode:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 dataUsingEncoding:4];
  [v4 bytes];
  [v4 length];
  __memcpy_chk();
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  BOOL v5 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v8 = "+[CBUtil preSSPStringToPairingCode:]";
    __int16 v9 = 2114;
    id v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    _os_log_impl(&dword_1AB9F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s - str:%{public}@ -> pairingcode:0x%016llX", buf, 0x20u);
  }

  return 0;
}

+ (id)preSSPPairingCodeToString:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int64_t v6 = a3;
  id v3 = [NSString stringWithUTF8String:&v6];
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  id v4 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v8 = "+[CBUtil preSSPPairingCodeToString:]";
    __int16 v9 = 2048;
    int64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1AB9F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s - pairingcode:0x%016llX -> str:%{public}@", buf, 0x20u);
  }

  return v3;
}

+ (BOOL)isInternalBuild
{
  return MEMORY[0x1F40CD650]("com.apple.bluetooth", a2);
}

+ (void)setBluetoothDebugSetting:(__CFString *)a3 InKey:(__CFString *)a4 InValue:(void *)a5
{
  CFDictionaryRef v8 = (const __CFDictionary *)CFPreferencesCopyAppValue(a3, @"com.apple.MobileBluetooth.debug");
  if (v8)
  {
    CFDictionaryRef v9 = v8;
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v8);
    CFRelease(v9);
    Mutable = MutableCopy;
    uint64_t v12 = a4;
    if (a5)
    {
LABEL_3:
      CFDictionarySetValue(Mutable, v12, a5);
      goto LABEL_6;
    }
  }
  else
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFMutableDictionaryRef MutableCopy = Mutable;
    uint64_t v12 = a4;
    if (a5) {
      goto LABEL_3;
    }
  }
  CFDictionaryRemoveValue(Mutable, v12);
  if (CFDictionaryGetCount(MutableCopy))
  {
LABEL_6:
    CFPreferencesSetAppValue(a3, MutableCopy, @"com.apple.MobileBluetooth.debug");
    if (MutableCopy)
    {
      CFRelease(MutableCopy);
    }
    return;
  }
  CFRelease(MutableCopy);

  CFPreferencesSetAppValue(a3, 0, @"com.apple.MobileBluetooth.debug");
}

+ (id)getBluetoothDebugSettingString:(__CFString *)a3 InKey:(__CFString *)a4
{
  int64_t v6 = [NSString stringWithCString:"" encoding:1];
  CFDictionaryRef v7 = (const __CFDictionary *)CFPreferencesCopyAppValue(a3, @"com.apple.MobileBluetooth.debug");
  if (v7)
  {
    CFDictionaryRef v8 = v7;
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v7);
    if (a4)
    {
      Value = (void *)CFDictionaryGetValue(MutableCopy, a4);
      if (Value)
      {
        id v11 = Value;

        CFRelease(v11);
        int64_t v6 = v11;
      }
    }
    CFRelease(v8);
  }

  return v6;
}

+ (id)decodeApplePayloadByteStream:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = v3;
  uint64_t v6 = [v5 bytes];
  if ((unint64_t)[v5 length] < 3)
  {
LABEL_8:
    id v12 = v4;
    goto LABEL_19;
  }
  unint64_t v7 = 2;
  int v8 = 2;
  while (1)
  {
    if (*(unsigned char *)(v6 + v7) != 100) {
      goto LABEL_3;
    }
    if ([v5 length] - 1 <= v7) {
      break;
    }
    uint64_t v9 = v8 + v6;
    int v10 = *(unsigned __int8 *)(v9 + 1);
    if (!*(unsigned char *)(v9 + 1))
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      uint64_t v13 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int v14 = buf;
        goto LABEL_17;
      }
      goto LABEL_18;
    }
    id v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v9 + 2 length:*(unsigned __int8 *)(v9 + 1)];
    [v4 setObject:v11 forKeyedSubscript:&unk_1F0301BA0];

    v8 += v10;
LABEL_3:
    unint64_t v7 = ++v8;
    if ([v5 length] <= (unint64_t)v8) {
      goto LABEL_8;
    }
  }
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  uint64_t v13 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = 0;
    int v14 = (uint8_t *)&v16;
LABEL_17:
    _os_log_impl(&dword_1AB9F0000, v13, OS_LOG_TYPE_DEFAULT, "decodeApplePayloadByteStream failed to decode payload", v14, 2u);
  }
LABEL_18:
  id v12 = 0;
LABEL_19:

  return v12;
}

+ (id)encodeApplePayloadByteStream:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  __int16 v20 = 76;
  id v4 = [MEMORY[0x1E4F1CA58] dataWithBytes:&v20 length:2];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 == v8)
        {
          int v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v10 integerValue] != 100) {
            continue;
          }
        }
        else
        {
          objc_enumerationMutation(v5);
          int v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v10 integerValue] != 100) {
            continue;
          }
        }
        id v11 = [v5 objectForKeyedSubscript:v10];
        id v12 = v11;
        if (v11 && [v11 length])
        {
          char v15 = 100;
          char v14 = 0;
          char v14 = [v12 length];
          [v4 appendBytes:&v15 length:1];
          [v4 appendBytes:&v14 length:1];
          [v4 appendData:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (void)isDeviceSupportedOnXROS:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AB9F0000, a2, OS_LOG_TYPE_ERROR, "API MISUSE: CBUtil isDeviceSupported - invalid value provided for vendorIdSrc:%d (assuming CBVendorIDSourceBluetooth)", (uint8_t *)v2, 8u);
}

@end