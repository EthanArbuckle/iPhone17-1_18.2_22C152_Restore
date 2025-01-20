@interface HSTActuationEvent
+ (const)hsClassName;
- (BOOL)decodeFromMap:(void *)a3;
- (BOOL)hsDecode:(void *)a3;
- (BOOL)hsEncode:(void *)a3;
- (HSTActuationEvent)init;
- (int64_t)hsTimestamp;
- (void)encodeToMap:(void *)a3;
- (void)hsSetTimestamp:(int64_t)a3;
@end

@implementation HSTActuationEvent

- (HSTActuationEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)HSTActuationEvent;
  v2 = [(HSTActuationEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->timestamp = HSUtil::GetMonotonicTime((HSUtil *)v2);
    v4 = v3;
  }

  return v3;
}

- (void)encodeToMap:(void *)a3
{
  HSUtil::Encoder::encodeInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)119,(char)97,(char)118,(char)101,(char)102,(char)111,(char)114,(char)109,(char)73,(char)68>::Key, self->waveformID);
  HSUtil::Encoder::encodeInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)116,(char)114,(char)101,(char)110,(char)103,(char)116,(char)104>::Key, self->strength);
  HSUtil::Encoder::encodeFloat((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)99,(char)97,(char)108,(char)101>::Key, self->scale);
  v5 = (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101,(char)68,(char)105,(char)108,(char)97,(char)116,(char)105,(char)111,(char)110>::Key;
  float timeDilation = self->timeDilation;

  HSUtil::Encoder::encodeFloat((HSUtil::Encoder *)a3, v5, timeDilation);
}

- (BOOL)decodeFromMap:(void *)a3
{
  self->waveformID = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)119,(char)97,(char)118,(char)101,(char)102,(char)111,(char)114,(char)109,(char)73,(char)68>::Key);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/HSTrackpadDefs.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTActuationEvent decodeFromMap:].cold.4();
    }
    return 0;
  }
  self->strength = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)116,(char)114,(char)101,(char)110,(char)103,(char)116,(char)104>::Key);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/HSTrackpadDefs.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTActuationEvent decodeFromMap:]();
    }
    return 0;
  }
  self->scale = HSUtil::Decoder::decodeFloat((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)99,(char)97,(char)108,(char)101>::Key);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/HSTrackpadDefs.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTActuationEvent decodeFromMap:]();
    }
    return 0;
  }
  self->float timeDilation = HSUtil::Decoder::decodeFloat((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101,(char)68,(char)105,(char)108,(char)97,(char)116,(char)105,(char)111,(char)110>::Key);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/HSTrackpadDefs.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTActuationEvent decodeFromMap:]();
    }
    return 0;
  }
  return 1;
}

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)65,(char)99,(char)116,(char)117,(char)97,(char)116,(char)105,(char)111,(char)110,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (BOOL)hsEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 2);
  }
  [(HSTActuationEvent *)self encodeToMap:a3];
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a3);
  }
  return 1;
}

- (BOOL)hsDecode:(void *)a3
{
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v12 = v5;
  long long v13 = v5;
  long long v10 = v5;
  long long v11 = v5;
  long long v9 = v5;
  HSUtil::Decoder::decodeMap((unint64_t *)a3, (uint64_t)&v9);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/HSTrackpadDefs.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTActuationEvent hsDecode:]();
    }
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = [(HSTActuationEvent *)self decodeFromMap:&v9];
  }
  if ((void)v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v11);
  }
  v7 = (void *)v10;
  *(void *)&long long v10 = 0;
  if (v7)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v7);
    operator delete();
  }
  return v6;
}

- (int64_t)hsTimestamp
{
  return self->timestamp;
}

- (void)hsSetTimestamp:(int64_t)a3
{
  self->timestamp = a3;
}

- (void)decodeFromMap:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)decodeFromMap:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)decodeFromMap:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)decodeFromMap:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)hsDecode:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

@end