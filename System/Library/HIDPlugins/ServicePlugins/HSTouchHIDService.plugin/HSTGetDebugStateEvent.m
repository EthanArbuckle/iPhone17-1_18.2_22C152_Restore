@interface HSTGetDebugStateEvent
+ (const)hsClassName;
- (BOOL)decodeFromMap:(void *)a3;
- (BOOL)hsDecode:(void *)a3;
- (BOOL)hsEncode:(void *)a3;
- (void)encodeToMap:(void *)a3;
@end

@implementation HSTGetDebugStateEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)71,(char)101,(char)116,(char)68,(char)101,(char)98,(char)117,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (void)encodeToMap:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HSTGetDebugStateEvent;
  -[HSTGetStateEvent encodeToMap:](&v5, "encodeToMap:");
  HSUtil::Encoder::encodeObject((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)100,(char)101,(char)98,(char)117,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101,(char)115>::Key, self->debugStates);
}

- (BOOL)decodeFromMap:(void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HSTGetDebugStateEvent;
  if (!-[HSTGetStateEvent decodeFromMap:](&v8, "decodeFromMap:"))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTEvent.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTGetDebugStateEvent decodeFromMap:]();
    }
    return 0;
  }
  HSUtil::Decoder::decodeObject((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)100,(char)101,(char)98,(char)117,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101,(char)115>::Key);
  objc_super v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  debugStates = self->debugStates;
  self->debugStates = v5;

  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTEvent.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTGetDebugStateEvent decodeFromMap:]();
    }
    return 0;
  }
  return 1;
}

- (BOOL)hsEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 4);
  }
  [(HSTGetDebugStateEvent *)self encodeToMap:a3];
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
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTEvent.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTGetDebugStateEvent hsDecode:]();
    }
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = [(HSTGetDebugStateEvent *)self decodeFromMap:&v9];
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

- (void).cxx_destruct
{
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