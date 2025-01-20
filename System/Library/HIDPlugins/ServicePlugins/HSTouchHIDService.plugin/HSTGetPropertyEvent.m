@interface HSTGetPropertyEvent
+ (const)hsClassName;
- (BOOL)decodeFromMap:(void *)a3;
- (BOOL)hsDecode:(void *)a3;
- (BOOL)hsEncode:(void *)a3;
- (id).cxx_construct;
- (void)encodeToMap:(void *)a3;
@end

@implementation HSTGetPropertyEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)71,(char)101,(char)116,(char)80,(char)114,(char)111,(char)112,(char)101,(char)114,(char)116,(char)121,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (void)encodeToMap:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HSTGetPropertyEvent;
  -[HSTEvent encodeToMap:](&v6, "encodeToMap:");
  p_key = &self->key;
  if (*((char *)&self->key.__r_.__value_.var0.__l + 23) < 0) {
    p_key = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_key->__r_.__value_.var0.__l.__data_;
  }
  HSUtil::Encoder::encodeString((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)107,(char)101,(char)121>::Key, p_key->__r_.__value_.var0.__s.__data_);
  HSUtil::Encoder::encodeObject((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)118,(char)97,(char)108,(char)117,(char)101>::Key, *(id *)&self->key.__r_.var0);
}

- (BOOL)decodeFromMap:(void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HSTGetPropertyEvent;
  if (-[HSTEvent decodeFromMap:](&v8, "decodeFromMap:"))
  {
    HSUtil::Decoder::decodeString((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)107,(char)101,(char)121>::Key, (uint64_t)__b);
    std::string::assign((std::string *)&self->key, __b[5]);
    HSUtil::Buffer::~Buffer((HSUtil::Buffer *)__b);
    if (*(_DWORD *)a3)
    {
      memset(__b, 170, sizeof(__b));
      basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTEvent.mm", (char *)__b);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[HSTGetPropertyEvent decodeFromMap:]();
      }
    }
    else
    {
      uint64_t v6 = HSUtil::Decoder::decodeObject((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)118,(char)97,(char)108,(char)117,(char)101>::Key);
      v7 = *(void **)&self->key.__r_.var0;
      *(void *)&self->key.__r_.var0 = v6;

      if (!*(_DWORD *)a3) {
        return 1;
      }
      memset(__b, 170, sizeof(__b));
      basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTEvent.mm", (char *)__b);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[HSTGetPropertyEvent decodeFromMap:]();
      }
    }
  }
  else
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTEvent.mm", (char *)__b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTGetPropertyEvent decodeFromMap:]();
    }
  }
  return 0;
}

- (BOOL)hsEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 2);
  }
  [(HSTGetPropertyEvent *)self encodeToMap:a3];
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
      -[HSTGetPropertyEvent hsDecode:]();
    }
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = [(HSTGetPropertyEvent *)self decodeFromMap:&v9];
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
  objc_storeStrong((id *)&self->key.__r_.var0, 0);
  if (*((char *)&self->key.__r_.__value_.var0.__l + 23) < 0)
  {
    data = self->key.__r_.__value_.var0.__l.__data_;
    operator delete(data);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0uLL;
  *((void *)self + 2) = 0;
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

- (void)decodeFromMap:.cold.3()
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