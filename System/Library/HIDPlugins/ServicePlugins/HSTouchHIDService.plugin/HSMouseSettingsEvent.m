@interface HSMouseSettingsEvent
+ (const)hsClassName;
- (BOOL)decodeFromMap:(void *)a3;
- (BOOL)hsDecode:(void *)a3;
- (BOOL)hsEncode:(void *)a3;
- (HSMouseSettingsEvent)init;
- (int64_t)hsTimestamp;
- (void)encodeToMap:(void *)a3;
- (void)hsSetTimestamp:(int64_t)a3;
@end

@implementation HSMouseSettingsEvent

- (HSMouseSettingsEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)HSMouseSettingsEvent;
  v2 = [(HSMouseSettingsEvent *)&v6 init];
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
  HSUtil::Encoder::encodeCodable<mt_StandardMouseSettings>((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)83,(char)101,(char)116,(char)116,(char)105,(char)110,(char)103,(char)115>::Key, &self->mSettings);
  v5 = (const CoderKey *)HSUtil::CoderKey::Literal<(char)110,(char)101,(char)101,(char)100,(char)115,(char)70,(char)108,(char)117,(char)115,(char)104>::Key;
  BOOL needsFlush = self->needsFlush;

  HSUtil::Encoder::encodeBool((HSUtil::Encoder *)a3, v5, needsFlush);
}

- (BOOL)decodeFromMap:(void *)a3
{
  HSUtil::Decoder::decodeCodable<mt_StandardMouseSettings>((const CoderKey *)a3, (CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)83,(char)101,(char)116,(char)116,(char)105,(char)110,(char)103,(char)115>::Key, &self->mSettings);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/HSTrackpadDefs.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSMouseSettingsEvent decodeFromMap:]();
    }
  }
  else
  {
    self->BOOL needsFlush = HSUtil::Decoder::decodeBool((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)110,(char)101,(char)101,(char)100,(char)115,(char)70,(char)108,(char)117,(char)115,(char)104>::Key);
    if (*(_DWORD *)a3 < 2u) {
      return 1;
    }
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/HSTrackpadDefs.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSMouseSettingsEvent decodeFromMap:]();
    }
  }
  return 0;
}

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)77,(char)111,(char)117,(char)115,(char)101,(char)83,(char)101,(char)116,(char)116,(char)105,(char)110,(char)103,(char)115,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (BOOL)hsEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 2);
  }
  [(HSMouseSettingsEvent *)self encodeToMap:a3];
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
      -[HSMouseSettingsEvent hsDecode:]();
    }
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = [(HSMouseSettingsEvent *)self decodeFromMap:&v9];
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

- (void)hsDecode:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

@end