@interface HSTSignedIntegerEvent
+ (const)hsClassName;
- (BOOL)decodeFromMap:(void *)a3;
- (void)encodeToMap:(void *)a3;
@end

@implementation HSTSignedIntegerEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)83,(char)105,(char)103,(char)110,(char)101,(char)100,(char)73,(char)110,(char)116,(char)101,(char)103,(char)101,(char)114,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (void)encodeToMap:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HSTSignedIntegerEvent;
  -[HSTEvent encodeToMap:](&v5, "encodeToMap:");
  HSUtil::Encoder::encodeInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)118,(char)97,(char)108,(char)117,(char)101>::Key, self->value);
}

- (BOOL)decodeFromMap:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HSTSignedIntegerEvent;
  if (!-[HSTEvent decodeFromMap:](&v6, "decodeFromMap:"))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTEvent.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTSignedIntegerEvent decodeFromMap:]();
    }
    return 0;
  }
  self->value = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)118,(char)97,(char)108,(char)117,(char)101>::Key);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTEvent.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTSignedIntegerEvent decodeFromMap:]();
    }
    return 0;
  }
  return 1;
}

- (void)decodeFromMap:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)decodeFromMap:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

@end