@interface HSTContactStabilizerStats
+ (const)hsClassName;
- (BOOL)hsDecode:(void *)a3;
- (BOOL)hsEncode:(void *)a3;
- (id).cxx_construct;
@end

@implementation HSTContactStabilizerStats

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)67,(char)111,(char)110,(char)116,(char)97,(char)99,(char)116,(char)83,(char)116,(char)97,(char)98,(char)105,(char)108,(char)105,(char)122,(char)101,(char)114,(char)83,(char)116,(char)97,(char)116,(char)115>::Key;
}

- (BOOL)hsEncode:(void *)a3
{
  if (!*(_DWORD *)a3)
  {
    HSUtil::Encoder::_encodeArrayStart(a3, 2u);
    if (!*(_DWORD *)a3) {
      HSUtil::Encoder::_encodeUInt((HSUtil::Encoder *)a3, self->hysteresisRadius);
    }
  }
  begin = self->contacts.__begin_;
  end = self->contacts.__end_;
  while (begin != end)
  {
    if (!*(_DWORD *)a3) {
      StatContact::encode(begin, (HSUtil::Encoder *)a3);
    }
    begin = (StatContact *)((char *)begin + 28);
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
  long long v29 = v5;
  long long v30 = v5;
  long long v27 = v5;
  long long v28 = v5;
  long long v26 = v5;
  HSUtil::Decoder::decodeArray((HSUtil::Decoder *)a3, (uint64_t)&v26);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTContactStabilizerStats hsDecode:]();
    }
  }
  else
  {
    self->hysteresisRadius = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v26);
    if (v26)
    {
      memset(__b, 170, sizeof(__b));
      basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[HSTContactStabilizerStats hsDecode:]();
      }
    }
    else
    {
      p_contacts = &self->contacts;
      for (self->contacts.__end_ = self->contacts.__begin_; ; self->contacts.__end_ = v10)
      {
        *(_DWORD *)v25 = -1431655936;
        memset(&v25[4], 0, 24);
        HSUtil::Decoder::decodeCodable<StatContact>((int *)&v26, (StatContact *)v25);
        if (v26) {
          break;
        }
        end = self->contacts.__end_;
        value = self->contacts.__end_cap_.__value_;
        if (end >= value)
        {
          uint64_t v11 = 0x6DB6DB6DB6DB6DB7 * ((end - p_contacts->__begin_) >> 2);
          unint64_t v12 = v11 + 1;
          if ((unint64_t)(v11 + 1) > 0x924924924924924) {
            std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v13 = 0x6DB6DB6DB6DB6DB7 * ((value - p_contacts->__begin_) >> 2);
          if (2 * v13 > v12) {
            unint64_t v12 = 2 * v13;
          }
          if (v13 >= 0x492492492492492) {
            unint64_t v14 = 0x924924924924924;
          }
          else {
            unint64_t v14 = v12;
          }
          if (v14) {
            v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<StatContact>>((uint64_t)&self->contacts.__end_cap_, v14);
          }
          else {
            v15 = 0;
          }
          v16 = &v15[28 * v11];
          long long v17 = *(_OWORD *)v25;
          *(_OWORD *)(v16 + 12) = *(_OWORD *)&v25[12];
          *(_OWORD *)v16 = v17;
          begin = self->contacts.__begin_;
          v18 = self->contacts.__end_;
          v20 = (StatContact *)v16;
          if (v18 != begin)
          {
            do
            {
              long long v21 = *(_OWORD *)((char *)v18 - 28);
              *((_OWORD *)v20 - 1) = *((_OWORD *)v18 - 1);
              *(_OWORD *)((char *)v20 - 28) = v21;
              v20 = (StatContact *)((char *)v20 - 28);
              v18 = (StatContact *)((char *)v18 - 28);
            }
            while (v18 != begin);
            v18 = p_contacts->__begin_;
          }
          v10 = (StatContact *)(v16 + 28);
          self->contacts.__begin_ = v20;
          self->contacts.__end_ = (StatContact *)(v16 + 28);
          self->contacts.__end_cap_.__value_ = (StatContact *)&v15[28 * v14];
          if (v18) {
            operator delete(v18);
          }
        }
        else
        {
          long long v9 = *(_OWORD *)v25;
          *(_OWORD *)((char *)end + 12) = *(_OWORD *)&v25[12];
          *(_OWORD *)end = v9;
          v10 = (StatContact *)((char *)end + 28);
        }
      }
      if (v26 == 3)
      {
        BOOL v22 = 1;
        goto LABEL_31;
      }
      memset(__b, 170, sizeof(__b));
      basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[HSTContactStabilizerStats hsDecode:]();
      }
    }
  }
  BOOL v22 = 0;
LABEL_31:
  if ((void)v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v28);
  }
  v23 = (void *)v27;
  *(void *)&long long v27 = 0;
  if (v23)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v23);
    operator delete();
  }
  return v22;
}

- (void).cxx_destruct
{
  begin = self->contacts.__begin_;
  if (begin)
  {
    self->contacts.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (void)hsDecode:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)hsDecode:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)hsDecode:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

@end