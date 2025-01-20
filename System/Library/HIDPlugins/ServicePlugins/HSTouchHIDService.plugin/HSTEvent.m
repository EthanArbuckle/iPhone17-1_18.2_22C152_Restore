@interface HSTEvent
+ (const)hsClassName;
- (BOOL)decodeFromMap:(void *)a3;
- (BOOL)hsDecode:(void *)a3;
- (BOOL)hsEncode:(void *)a3;
- (HSTEvent)init;
- (int64_t)hsTimestamp;
- (void)encodeToMap:(void *)a3;
- (void)hsSetTimestamp:(int64_t)a3;
@end

@implementation HSTEvent

- (HSTEvent)init
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class()) {
    __assert_rtn("-[HSTEvent init]", "HSTEvent.mm", 15, "[self class] != [HSTEvent class]");
  }
  v8.receiver = self;
  v8.super_class = (Class)HSTEvent;
  v4 = [(HSTEvent *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->timestamp = HSUtil::GetMonotonicTime((HSUtil *)v4);
    v6 = v5;
  }

  return v5;
}

- (void)encodeToMap:(void *)a3
{
}

- (BOOL)decodeFromMap:(void *)a3
{
  self->timestamp = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key);
  int v4 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTEvent.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTEvent decodeFromMap:]();
    }
  }
  return v4 == 0;
}

+ (const)hsClassName
{
}

- (BOOL)hsEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 1);
  }
  [(HSTEvent *)self encodeToMap:a3];
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
      -[HSTEvent hsDecode:]();
    }
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = [(HSTEvent *)self decodeFromMap:&v9];
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

- (void)hsDecode:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

@end