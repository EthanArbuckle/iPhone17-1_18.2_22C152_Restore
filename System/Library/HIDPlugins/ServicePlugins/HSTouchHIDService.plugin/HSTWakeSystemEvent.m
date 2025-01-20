@interface HSTWakeSystemEvent
+ (const)hsClassName;
- (BOOL)decodeFromMap:(void *)a3;
- (id).cxx_construct;
- (void)encodeToMap:(void *)a3;
@end

@implementation HSTWakeSystemEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)87,(char)97,(char)107,(char)101,(char)83,(char)121,(char)115,(char)116,(char)101,(char)109,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (void)encodeToMap:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HSTWakeSystemEvent;
  -[HSTEvent encodeToMap:](&v5, "encodeToMap:");
  if (self->tapPosition.__engaged_) {
    HSUtil::Encoder::encodeCodable<HSTPipeline::Position const>((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)97,(char)112,(char)80,(char)111,(char)115,(char)105,(char)116,(char)105,(char)111,(char)110>::Key, (HSTPipeline::Position *)&self->tapPosition);
  }
  if (self->swipeDirection.__engaged_) {
    HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)119,(char)105,(char)112,(char)101,(char)68,(char)105,(char)114,(char)101,(char)99,(char)116,(char)105,(char)111,(char)110>::Key, self->swipeDirection.var0.__val_);
  }
  if (self->longPressPosition.__engaged_) {
    HSUtil::Encoder::encodeCodable<HSTPipeline::Position const>((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)108,(char)111,(char)110,(char)103,(char)80,(char)114,(char)101,(char)115,(char)115,(char)80,(char)111,(char)115,(char)105,(char)116,(char)105,(char)111,(char)110>::Key, (HSTPipeline::Position *)&self->longPressPosition);
  }
}

- (BOOL)decodeFromMap:(void *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HSTWakeSystemEvent;
  if (-[HSTEvent decodeFromMap:](&v12, "decodeFromMap:"))
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
    HSUtil::Decoder::decodeCodable<HSTPipeline::Position>((const CoderKey *)a3, (CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)97,(char)112,(char)80,(char)111,(char)115,(char)105,(char)116,(char)105,(char)111,(char)110>::Key, (HSTPipeline::Position *)&v11);
    if (*(_DWORD *)a3)
    {
      if (self->tapPosition.__engaged_) {
        self->tapPosition.__engaged_ = 0;
      }
    }
    else
    {
      $EC55C1AE91AAB0FC8212E71E8EF24839 v6 = ($EC55C1AE91AAB0FC8212E71E8EF24839)v11;
      if (!self->tapPosition.__engaged_) {
        self->tapPosition.__engaged_ = 1;
      }
      self->tapPosition.var0 = v6;
    }
    unsigned __int8 v7 = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)119,(char)105,(char)112,(char)101,(char)68,(char)105,(char)114,(char)101,(char)99,(char)116,(char)105,(char)111,(char)110>::Key);
    if (*(_DWORD *)a3)
    {
      if (self->swipeDirection.__engaged_) {
        self->swipeDirection.__engaged_ = 0;
      }
    }
    else
    {
      self->swipeDirection = (optional<HSTPipeline::SwipeDirection>)(v7 | 0x100);
    }
    HSUtil::Decoder::decodeCodable<HSTPipeline::Position>((const CoderKey *)a3, (CoderKey *)HSUtil::CoderKey::Literal<(char)108,(char)111,(char)110,(char)103,(char)80,(char)114,(char)101,(char)115,(char)115,(char)80,(char)111,(char)115,(char)105,(char)116,(char)105,(char)111,(char)110>::Key, (HSTPipeline::Position *)&v11);
    int v8 = *(_DWORD *)a3;
    if (*(_DWORD *)a3)
    {
      if (self->longPressPosition.__engaged_) {
        self->longPressPosition.__engaged_ = 0;
      }
    }
    else
    {
      $EC55C1AE91AAB0FC8212E71E8EF24839 v9 = ($EC55C1AE91AAB0FC8212E71E8EF24839)v11;
      if (!self->longPressPosition.__engaged_) {
        self->longPressPosition.__engaged_ = 1;
      }
      self->longPressPosition.var0 = v9;
      int v8 = *(_DWORD *)a3;
    }
    BOOL v5 = v8 < 5;
    if (v8 >= 5)
    {
      memset(__b, 170, sizeof(__b));
      basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTEvent.mm", __b);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[HSTWakeSystemEvent decodeFromMap:]();
      }
    }
  }
  else
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTEvent.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTWakeSystemEvent decodeFromMap:]();
    }
    return 0;
  }
  return v5;
}

- (id).cxx_construct
{
  *((unsigned char *)self + 16) = 0;
  *((unsigned char *)self + 24) = 0;
  *((_WORD *)self + 14) = 0;
  *((unsigned char *)self + 32) = 0;
  *((unsigned char *)self + 40) = 0;
  *((unsigned char *)self + 44) = 0;
  *((unsigned char *)self + 52) = 0;
  return self;
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