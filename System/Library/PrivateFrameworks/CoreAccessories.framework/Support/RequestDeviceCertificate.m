@interface RequestDeviceCertificate
@end

@implementation RequestDeviceCertificate

void __iap2_deviceAuthentication_RequestDeviceCertificate_block_invoke(uint64_t a1)
{
  CFDataRef DeviceDataCertificate = (const __CFData *)platform_auth_createDeviceDataCertificate();
  CFDataRef v3 = DeviceDataCertificate;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = v4 + 120;
  if (DeviceDataCertificate)
  {
    BytePtr = CFDataGetBytePtr(DeviceDataCertificate);
    CFIndex Length = CFDataGetLength(v3);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    BytePtr = 0;
    CFIndex Length = 0;
  }
  iAP2MsgInit(v5, 43537, *(void *)(v4 + 192), 0xFFFF, 0, 0);
  if (BytePtr && Length)
  {
    iAP2MsgAddDataParam(v5, 0, 0, BytePtr, (unsigned __int16)Length);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 49)
    {
      v8 = *(NSObject **)(gLogObjects + 384);
    }
    else
    {
      v8 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9[0] = 67109632;
      v9[1] = (unsigned __int16)v3;
      __int16 v10 = 1024;
      int v11 = (unsigned __int16)BytePtr;
      __int16 v12 = 2048;
      CFIndex v13 = Length;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "No device cert data parameter due to pCFDevCertData:%04X, pDevCertBytes:%04X, devCertLength:%02lX", (uint8_t *)v9, 0x18u);
    }
  }
  iap2_sessionControl_sendOutgoingMessage(*(uint64_t **)(a1 + 32), v5);
  if (v3) {
    CFRelease(v3);
  }
}

@end