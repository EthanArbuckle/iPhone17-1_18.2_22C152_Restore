@interface HSTiOSFirmwareManager
- (void)setPowerState:(unsigned __int16)a3;
@end

@implementation HSTiOSFirmwareManager

- (void)setPowerState:(unsigned __int16)a3
{
  if (a3)
  {
    v3 = "on";
  }
  else if ((a3 & 0x10) != 0)
  {
    if (MTDevicePowerGetState())
    {
      memset(__b, 170, 0x400uLL);
      basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTouchHIDService/HSTFirmwareManager.mm", (char *)__b);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[HSTiOSFirmwareManager setPowerState:]();
      }
    }
    v3 = "sleep";
  }
  else
  {
    v3 = "off";
  }
  v4 = MTLoggingPlugin();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    __b[0] = 136446210;
    *(void *)&__b[1] = v3;
    _os_log_impl(&def_411C8, v4, OS_LOG_TYPE_DEFAULT, "Setting power state %{public}s", (uint8_t *)__b, 0xCu);
  }

  if (MTDevicePowerSetState())
  {
    memset(__b, 170, 0x400uLL);
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTouchHIDService/HSTFirmwareManager.mm", (char *)__b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTiOSFirmwareManager setPowerState:]();
    }
  }
}

- (void)setPowerState:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)setPowerState:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

@end