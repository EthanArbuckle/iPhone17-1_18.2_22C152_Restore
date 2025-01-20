@interface HSTHIDEvents
+ (const)hsClassName;
- (BOOL)hsDecode:(void *)a3;
- (BOOL)hsEncode:(void *)a3;
- (HSTHIDEvents)init;
- (NSString)description;
- (id).cxx_construct;
- (int64_t)hsTimestamp;
- (void)hsSetTimestamp:(int64_t)a3;
@end

@implementation HSTHIDEvents

- (HSTHIDEvents)init
{
  v6.receiver = self;
  v6.super_class = (Class)HSTHIDEvents;
  v2 = [(HSTHIDEvents *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->timestamp = HSUtil::GetMonotonicTime((HSUtil *)v2);
    v4 = v3;
  }

  return v3;
}

- (NSString)description
{
  v3 = objc_opt_new();
  begin = self->events.__begin_;
  for (i = self->events.var0; begin != i; ++begin)
  {
    objc_super v6 = *begin;
    [v3 appendFormat:@"%@\n", v6];
  }
  v7 = +[NSString stringWithFormat:@"<HSTHIDEvents events: %@>", v3];

  return (NSString *)v7;
}

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)72,(char)73,(char)68,(char)69,(char)118,(char)101,(char)110,(char)116,(char)115>::Key;
}

- (BOOL)hsEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeArrayStart(a3, 2u);
  }
  begin = self->events.__begin_;
  var0 = self->events.var0;
  while (begin != var0)
  {
    v7 = *begin;
    Data = (NSData *)IOHIDEventCreateData();
    if (!Data)
    {

      return 0;
    }
    HSUtil::Encoder::encodeNSData((HSUtil::Encoder *)a3, Data);

    ++begin;
  }
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a3);
  }
  return 1;
}

- (BOOL)hsDecode:(void *)a3
{
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v16 = v5;
  long long v17 = v5;
  long long v14 = v5;
  long long v15 = v5;
  long long v13 = v5;
  HSUtil::Decoder::decodeArray((HSUtil::Decoder *)a3, (uint64_t)&v13);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTHIDEvents.mm", (char *)__b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTHIDEvents hsDecode:]();
    }
  }
  else
  {
    p_events = (char **)&self->events;
    while (1)
    {
      unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v11[2] = v7;
      v11[3] = v7;
      v11[0] = v7;
      v11[1] = v7;
      HSUtil::Decoder::decodeData((HSUtil::Decoder *)&v13, (uint64_t)v11);
      if (v13) {
        break;
      }
      __b[0] = (id)0xAAAAAAAAAAAAAAAALL;
      __b[0] = (id)IOHIDEventCreateWithBytes();
      if (!__b[0]) {
        goto LABEL_12;
      }
      std::vector<HIDEvent * {__strong}>::push_back[abi:ne180100](p_events, __b);

      HSUtil::Buffer::~Buffer((HSUtil::Buffer *)v11);
    }
    if (v13 == 3)
    {
      HSUtil::Buffer::~Buffer((HSUtil::Buffer *)v11);
      BOOL v8 = 1;
      goto LABEL_14;
    }
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTHIDEvents.mm", (char *)__b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTHIDEvents hsDecode:]();
    }
LABEL_12:
    HSUtil::Buffer::~Buffer((HSUtil::Buffer *)v11);
  }
  BOOL v8 = 0;
LABEL_14:
  if ((void)v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v15);
  }
  v9 = (void *)v14;
  *(void *)&long long v14 = 0;
  if (v9)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v9);
    operator delete();
  }
  return v8;
}

- (int64_t)hsTimestamp
{
  return self->timestamp;
}

- (void)hsSetTimestamp:(int64_t)a3
{
  self->timestamp = a3;
}

- (void).cxx_destruct
{
  p_events = &self->events;
  std::vector<HIDEvent * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_events);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void)hsDecode:.cold.1()
{
  v1[0] = 136315906;
  OUTLINED_FUNCTION_0();
  uint64_t v2 = 60;
  __int16 v3 = v0;
  v4 = "array";
  _os_log_error_impl(&def_411C8, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", (uint8_t *)v1, 0x2Au);
}

- (void)hsDecode:.cold.2()
{
  v1[0] = 136315906;
  OUTLINED_FUNCTION_0();
  uint64_t v2 = 53;
  __int16 v3 = v0;
  v4 = "coder";
  _os_log_error_impl(&def_411C8, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", (uint8_t *)v1, 0x2Au);
}

@end