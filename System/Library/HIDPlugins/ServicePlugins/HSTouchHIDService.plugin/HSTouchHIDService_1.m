void sub_E1344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  HSUtil::Decoder::~Decoder((HSUtil::Decoder *)&a9);
  _Unwind_Resume(a1);
}

const CoderKey *HSUtil::Decoder::decodeCodable<HSTPipeline::Position>(const CoderKey *result, CoderKey *a2, HSTPipeline::Position *a3)
{
  if (SLODWORD(result->var0) <= 4)
  {
    uint64_t v4 = (uint64_t)result;
    unint64_t v5 = *(void *)&result[4].var1;
    result = HSUtil::Decoder::_findKey(result, &v5, a2);
    if (!*(_DWORD *)v4)
    {
      result = (const CoderKey *)HSUtil::Decoder::_readCodable<HSTPipeline::Position>(v4, &v5, a3);
      if (*(_DWORD *)v4 == 3) {
        *(_DWORD *)uint64_t v4 = 13;
      }
      else {
        *(void *)(v4 + 72) = v5;
      }
    }
  }
  return result;
}

const CoderKey *HSUtil::Decoder::decodeCodable<HSTPipeline::Velocity>(const CoderKey *result, CoderKey *a2, HSTPipeline::Velocity *a3)
{
  if (SLODWORD(result->var0) <= 4)
  {
    uint64_t v4 = (uint64_t)result;
    unint64_t v5 = *(void *)&result[4].var1;
    result = HSUtil::Decoder::_findKey(result, &v5, a2);
    if (!*(_DWORD *)v4)
    {
      result = (const CoderKey *)HSUtil::Decoder::_readCodable<HSTPipeline::Velocity>(v4, &v5, a3);
      if (*(_DWORD *)v4 == 3) {
        *(_DWORD *)uint64_t v4 = 13;
      }
      else {
        *(void *)(v4 + 72) = v5;
      }
    }
  }
  return result;
}

void *HSUtil::Decoder::_readCodable<HSTPipeline::Position>(uint64_t a1, unint64_t *a2, HSTPipeline::Position *a3)
{
  unint64_t v6 = *a2;
  result = (void *)HSUtil::Decoder::_skipElement((HSUtil::Decoder *)a1, a2);
  if (!*(_DWORD *)a1)
  {
    v8 = result;
    result = HSUtil::Decoder::_loadKeyTableIfNeeded((HSUtil::Decoder *)a1, a2);
    if (!*(_DWORD *)a1)
    {
      v11[1] = *(void *)(a1 + 8);
      v11[0] = 0xAAAAAAAA00000000;
      uint64_t v10 = *(void *)(a1 + 24);
      v9 = *(std::__shared_weak_count **)(a1 + 32);
      v12 = 0;
      uint64_t v13 = v10;
      v14 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v15 = *(_OWORD *)(a1 + 40);
      unint64_t v16 = *(void *)(a1 + 56) + v6;
      v17 = v8;
      uint64_t v18 = 0;
      if ((HSTPipeline::Position::decode(a3, (HSUtil::Decoder *)v11) & 1) == 0) {
        *(_DWORD *)a1 = 10;
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      result = v12;
      v12 = 0;
      if (result)
      {
        std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](result);
        operator delete();
      }
    }
  }
  return result;
}

void sub_E1598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *HSUtil::Decoder::_readCodable<HSTPipeline::Velocity>(uint64_t a1, unint64_t *a2, HSTPipeline::Velocity *a3)
{
  unint64_t v6 = *a2;
  result = (void *)HSUtil::Decoder::_skipElement((HSUtil::Decoder *)a1, a2);
  if (!*(_DWORD *)a1)
  {
    v8 = result;
    result = HSUtil::Decoder::_loadKeyTableIfNeeded((HSUtil::Decoder *)a1, a2);
    if (!*(_DWORD *)a1)
    {
      v11[1] = *(void *)(a1 + 8);
      v11[0] = 0xAAAAAAAA00000000;
      uint64_t v10 = *(void *)(a1 + 24);
      v9 = *(std::__shared_weak_count **)(a1 + 32);
      v12 = 0;
      uint64_t v13 = v10;
      v14 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v15 = *(_OWORD *)(a1 + 40);
      unint64_t v16 = *(void *)(a1 + 56) + v6;
      v17 = v8;
      uint64_t v18 = 0;
      if ((HSTPipeline::Velocity::decode(a3, (HSUtil::Decoder *)v11) & 1) == 0) {
        *(_DWORD *)a1 = 10;
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      result = v12;
      v12 = 0;
      if (result)
      {
        std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](result);
        operator delete();
      }
    }
  }
  return result;
}

void sub_E16A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void __cxx_global_var_init_71()
{
  {
    HSUtil::Coder::_ObjectType = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"com.apple.hid.HSCoder.ObjectType", v0);
  }
}

void __cxx_global_var_init_2_65(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)121,(char)112,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"type", a2);
  }
}

void __cxx_global_var_init_3_64(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"timestamp", a2);
  }
}

void __cxx_global_var_init_4_59(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)110,(char)105,(char)120,(char)84,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"unixTimestamp", a2);
  }
}

void __cxx_global_var_init_5_59(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)118,(char)101,(char)114,(char)115,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"version", a2);
  }
}

void __cxx_global_var_init_6_59(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)116,(char)99,(char)79,(char)102,(char)102,(char)115,(char)101,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"utcOffset", a2);
  }
}

void __cxx_global_var_init_7_59(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)116,(char)97,(char)116,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"state", a2);
  }
}

void __cxx_global_var_init_8_60(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)100,(char)97,(char)116,(char)97>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"data", a2);
  }
}

void __cxx_global_var_init_9_29(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)99,(char)111,(char)110,(char)116,(char)97,(char)99,(char)116,(char)73,(char)68>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"contactID", a2);
  }
}

void __cxx_global_var_init_10_27(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)116,(char)97,(char)103,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"stage", a2);
  }
}

void __cxx_global_var_init_11_21(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)102,(char)105,(char)110,(char)103,(char)101,(char)114>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"finger", a2);
  }
}

void __cxx_global_var_init_12_21(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)104,(char)97,(char)110,(char)100>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"hand", a2);
  }
}

void __cxx_global_var_init_13_21(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)102,(char)108,(char)97,(char)103,(char)115>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"flags", a2);
  }
}

void __cxx_global_var_init_14_21(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)112,(char)111,(char)115,(char)105,(char)116,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"position", a2);
  }
}

void __cxx_global_var_init_15_34(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)118,(char)101,(char)108,(char)111,(char)99,(char)105,(char)116,(char)121>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"velocity", a2);
  }
}

void __cxx_global_var_init_16_34(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)102,(char)111,(char)114,(char)99,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"force", a2);
  }
}

void __cxx_global_var_init_17_34(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)109,(char)97,(char)106,(char)111,(char)114,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"majorRadius", a2);
  }
}

void __cxx_global_var_init_18_33(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)109,(char)105,(char)110,(char)111,(char)114,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"minorRadius", a2);
  }
}

void __cxx_global_var_init_19_33(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)97,(char)122,(char)105,(char)109,(char)117,(char)116,(char)104>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"azimuth", a2);
  }
}

void __cxx_global_var_init_20_33(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)122,(char)115,(char)105,(char)103,(char)110,(char)97,(char)108>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"zsignal", a2);
  }
}

void __cxx_global_var_init_21_34(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)122,(char)100,(char)101,(char)110,(char)115,(char)105,(char)116,(char)121>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"zdensity", a2);
  }
}

void __cxx_global_var_init_22_34(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)105,(char)108,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"tilt", a2);
  }
}

uint64_t HSTContactStabilizerConfig::FloatRange::encode(HSTContactStabilizerConfig::FloatRange *this, HSUtil::Encoder *a2)
{
  if (!*(_DWORD *)a2)
  {
    HSUtil::Encoder::_encodeArrayStart(a2, 1u);
    if (!*(_DWORD *)a2)
    {
      HSUtil::Encoder::_writeTokenValue32((unint64_t *)a2, 0x88u, *(_DWORD *)this);
      if (!*(_DWORD *)a2)
      {
        HSUtil::Encoder::_writeTokenValue32((unint64_t *)a2, 0x88u, *((_DWORD *)this + 1));
        if (!*(_DWORD *)a2) {
          HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a2);
        }
      }
    }
  }
  return 1;
}

uint64_t HSTContactStabilizerConfig::FloatRange::decode(HSTContactStabilizerConfig::FloatRange *this, HSUtil::Decoder *a2)
{
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v10 = v3;
  long long v11 = v3;
  long long v8 = v3;
  long long v9 = v3;
  long long v7 = v3;
  HSUtil::Decoder::decodeArray(a2, (uint64_t)&v7);
  if (v7)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactStabilizerConfig::FloatRange::decode();
    }
LABEL_10:
    uint64_t v4 = 0;
    goto LABEL_11;
  }
  *(float *)this = HSUtil::Decoder::decodeFloat((HSUtil::Decoder *)&v7);
  if (v7)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactStabilizerConfig::FloatRange::decode();
    }
    goto LABEL_10;
  }
  *((float *)this + 1) = HSUtil::Decoder::decodeFloat((HSUtil::Decoder *)&v7);
  if (v7)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactStabilizerConfig::FloatRange::decode();
    }
    goto LABEL_10;
  }
  uint64_t v4 = 1;
LABEL_11:
  if ((void)v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v9);
  }
  unint64_t v5 = (void *)v8;
  *(void *)&long long v8 = 0;
  if (v5)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v5);
    operator delete();
  }
  return v4;
}

void sub_E1E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

float HSUtil::Decoder::decodeFloat(HSUtil::Decoder *this)
{
  float result = 0.0;
  if (*(int *)this <= 4)
  {
    unint64_t v4 = *((void *)this + 9);
    float v3 = HSUtil::Decoder::_readFloat(this, &v4);
    float result = 0.0;
    if (!*(_DWORD *)this)
    {
      *((void *)this + 9) = v4;
      return v3;
    }
  }
  return result;
}

uint64_t HSTContactStabilizerConfig::FloatRangeGain::encode(HSTContactStabilizerConfig::FloatRangeGain *this, HSUtil::Encoder *a2)
{
  if (!*(_DWORD *)a2) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a2, 1);
  }
  HSUtil::Encoder::encodeCodable<HSTContactStabilizerConfig::FloatRange const>(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)114,(char)97,(char)110,(char)103,(char)101>::Key, this);
  HSUtil::Encoder::encodeFloat(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)103,(char)97,(char)105,(char)110>::Key, *((float *)this + 2));
  if (!*(_DWORD *)a2) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a2);
  }
  return 1;
}

HSUtil::Encoder *HSUtil::Encoder::encodeCodable<HSTContactStabilizerConfig::FloatRange const>(HSUtil::Encoder *result, const CoderKey *a2, HSTContactStabilizerConfig::FloatRange *a3)
{
  if (!*(_DWORD *)result)
  {
    unint64_t v4 = result;
    float result = (HSUtil::Encoder *)HSUtil::Encoder::_encodeKey(result, a2);
    if (!*(_DWORD *)v4)
    {
      return (HSUtil::Encoder *)HSTContactStabilizerConfig::FloatRange::encode(a3, v4);
    }
  }
  return result;
}

uint64_t HSTContactStabilizerConfig::FloatRangeGain::decode(HSTContactStabilizerConfig::FloatRangeGain *this, HSUtil::Decoder *a2)
{
  v3.var0 = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&v3.var1 = 0xAAAAAAAAAAAAAAAALL;
  CoderKey v10 = v3;
  CoderKey v11 = v3;
  CoderKey v8 = v3;
  CoderKey v9 = v3;
  CoderKey v7 = v3;
  HSUtil::Decoder::decodeMap((unint64_t *)a2, (uint64_t)&v7);
  if (LODWORD(v7.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactStabilizerConfig::FloatRangeGain::decode();
    }
LABEL_10:
    uint64_t v4 = 0;
    goto LABEL_11;
  }
  HSUtil::Decoder::decodeCodable<HSTContactStabilizerConfig::FloatRange>(&v7, (CoderKey *)HSUtil::CoderKey::Literal<(char)114,(char)97,(char)110,(char)103,(char)101>::Key, this);
  if (LODWORD(v7.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactStabilizerConfig::FloatRangeGain::decode();
    }
    goto LABEL_10;
  }
  *((float *)this + 2) = HSUtil::Decoder::decodeFloat((HSUtil::Decoder *)&v7, (const CoderKey *)HSUtil::CoderKey::Literal<(char)103,(char)97,(char)105,(char)110>::Key);
  if (LODWORD(v7.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactStabilizerConfig::FloatRangeGain::decode();
    }
    goto LABEL_10;
  }
  uint64_t v4 = 1;
LABEL_11:
  if (v9.var0) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v9.var0);
  }
  var0 = v8.var0;
  v8.var0 = 0;
  if (var0)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](var0);
    operator delete();
  }
  return v4;
}

void sub_E2140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

const CoderKey *HSUtil::Decoder::decodeCodable<HSTContactStabilizerConfig::FloatRange>(const CoderKey *result, CoderKey *a2, HSTContactStabilizerConfig::FloatRange *a3)
{
  if (SLODWORD(result->var0) <= 4)
  {
    uint64_t v4 = (uint64_t)result;
    unint64_t v5 = *(void *)&result[4].var1;
    float result = HSUtil::Decoder::_findKey(result, &v5, a2);
    if (!*(_DWORD *)v4)
    {
      float result = (const CoderKey *)HSUtil::Decoder::_readCodable<HSTContactStabilizerConfig::FloatRange>(v4, &v5, a3);
      if (*(_DWORD *)v4 == 3) {
        *(_DWORD *)uint64_t v4 = 13;
      }
      else {
        *(void *)(v4 + 72) = v5;
      }
    }
  }
  return result;
}

uint64_t HSTContactStabilizerConfig::encode(HSTContactStabilizerConfig *this, HSUtil::Encoder *a2)
{
  if (!*(_DWORD *)a2) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a2, 4);
  }
  HSUtil::Encoder::encodeCodable<HSTContactStabilizerConfig::FloatRange const>(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)101,(char)120,(char)99,(char)101,(char)115,(char)115,(char)105,(char)118,(char)101,(char)69,(char)99,(char)99,(char)101,(char)110,(char)116,(char)114,(char)105,(char)99,(char)105,(char)116,(char)121>::Key, (HSTContactStabilizerConfig::FloatRange *)this);
  HSUtil::Encoder::encodeCodable<HSTContactStabilizerConfig::FloatRange const>(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)101,(char)120,(char)99,(char)101,(char)115,(char)115,(char)105,(char)118,(char)101,(char)77,(char)97,(char)106,(char)111,(char)114,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key, (HSTContactStabilizerConfig::FloatRange *)&this->excessiveMajorRadius);
  HSUtil::Encoder::encodeCodable<HSTContactStabilizerConfig::FloatRange const>(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)101,(char)120,(char)99,(char)101,(char)115,(char)115,(char)105,(char)118,(char)101,(char)77,(char)105,(char)110,(char)111,(char)114,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key, (HSTContactStabilizerConfig::FloatRange *)&this->excessiveMinorRadius);
  HSUtil::Encoder::encodeCodable<HSTContactStabilizerConfig::FloatRangeGain const>(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)117,(char)110,(char)115,(char)116,(char)97,(char)98,(char)108,(char)101,(char)68,(char)101,(char)108,(char)116,(char)97,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key, (HSTContactStabilizerConfig::FloatRangeGain *)&this->unstableDeltaRadius);
  HSUtil::Encoder::encodeCodable<HSTContactStabilizerConfig::FloatRangeGain const>(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)117,(char)110,(char)115,(char)116,(char)97,(char)98,(char)108,(char)101,(char)68,(char)101,(char)108,(char)116,(char)97,(char)90,(char)65,(char)114,(char)101,(char)97>::Key, (HSTContactStabilizerConfig::FloatRangeGain *)&this->unstableDeltaZArea);
  HSUtil::Encoder::encodeFloat(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)101,(char)110,(char)100,(char)76,(char)111,(char)110,(char)103,(char)116,(char)101,(char)114,(char)109,(char)90,(char)65,(char)114,(char)101,(char)97,(char)73,(char)110,(char)105,(char)116>::Key, this->endLongtermZAreaInit);
  HSUtil::Encoder::encodeFloat(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)101,(char)110,(char)100,(char)69,(char)97,(char)114,(char)108,(char)121,(char)68,(char)101,(char)97,(char)100,(char)122,(char)111,(char)110,(char)101>::Key, this->endEarlyDeadzone);
  HSUtil::Encoder::encodeFloat(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)101,(char)110,(char)100,(char)76,(char)97,(char)116,(char)101,(char)68,(char)101,(char)97,(char)100,(char)122,(char)111,(char)110,(char)101>::Key, this->endLateDeadzone);
  HSUtil::Encoder::encodeInt(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)97,(char)120,(char)68,(char)101,(char)108,(char)116,(char)97,(char)84,(char)111,(char)72,(char)105,(char)100,(char)101>::Key, this->maxDeltaToHide);
  HSUtil::Encoder::encodeInt(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)104,(char)121,(char)115,(char)116,(char)101,(char)114,(char)101,(char)115,(char)105,(char)115,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key, this->hysteresisRadius);
  if (!*(_DWORD *)a2) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a2);
  }
  return 1;
}

HSUtil::Encoder *HSUtil::Encoder::encodeCodable<HSTContactStabilizerConfig::FloatRangeGain const>(HSUtil::Encoder *result, const CoderKey *a2, HSTContactStabilizerConfig::FloatRangeGain *a3)
{
  if (!*(_DWORD *)result)
  {
    uint64_t v4 = result;
    float result = (HSUtil::Encoder *)HSUtil::Encoder::_encodeKey(result, a2);
    if (!*(_DWORD *)v4)
    {
      return (HSUtil::Encoder *)HSTContactStabilizerConfig::FloatRangeGain::encode(a3, v4);
    }
  }
  return result;
}

uint64_t HSTContactStabilizerConfig::decode(HSTContactStabilizerConfig *this, HSUtil::Decoder *a2)
{
  v3.var0 = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&v3.var1 = 0xAAAAAAAAAAAAAAAALL;
  CoderKey v10 = v3;
  CoderKey v11 = v3;
  CoderKey v8 = v3;
  CoderKey v9 = v3;
  CoderKey v7 = v3;
  HSUtil::Decoder::decodeMap((unint64_t *)a2, (uint64_t)&v7);
  HSUtil::Decoder::decodeCodable<HSTContactStabilizerConfig::FloatRange>(&v7, (CoderKey *)HSUtil::CoderKey::Literal<(char)101,(char)120,(char)99,(char)101,(char)115,(char)115,(char)105,(char)118,(char)101,(char)69,(char)99,(char)99,(char)101,(char)110,(char)116,(char)114,(char)105,(char)99,(char)105,(char)116,(char)121>::Key, (HSTContactStabilizerConfig::FloatRange *)this);
  if (LODWORD(v7.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactStabilizerConfig::decode();
    }
LABEL_31:
    uint64_t v4 = 0;
    goto LABEL_32;
  }
  HSUtil::Decoder::decodeCodable<HSTContactStabilizerConfig::FloatRange>(&v7, (CoderKey *)HSUtil::CoderKey::Literal<(char)101,(char)120,(char)99,(char)101,(char)115,(char)115,(char)105,(char)118,(char)101,(char)77,(char)97,(char)106,(char)111,(char)114,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key, (HSTContactStabilizerConfig::FloatRange *)&this->excessiveMajorRadius);
  if (LODWORD(v7.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactStabilizerConfig::decode();
    }
    goto LABEL_31;
  }
  HSUtil::Decoder::decodeCodable<HSTContactStabilizerConfig::FloatRange>(&v7, (CoderKey *)HSUtil::CoderKey::Literal<(char)101,(char)120,(char)99,(char)101,(char)115,(char)115,(char)105,(char)118,(char)101,(char)77,(char)105,(char)110,(char)111,(char)114,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key, (HSTContactStabilizerConfig::FloatRange *)&this->excessiveMinorRadius);
  if (LODWORD(v7.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactStabilizerConfig::decode();
    }
    goto LABEL_31;
  }
  HSUtil::Decoder::decodeCodable<HSTContactStabilizerConfig::FloatRangeGain>(&v7, (CoderKey *)HSUtil::CoderKey::Literal<(char)117,(char)110,(char)115,(char)116,(char)97,(char)98,(char)108,(char)101,(char)68,(char)101,(char)108,(char)116,(char)97,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key, (HSTContactStabilizerConfig::FloatRangeGain *)&this->unstableDeltaRadius);
  if (LODWORD(v7.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactStabilizerConfig::decode();
    }
    goto LABEL_31;
  }
  HSUtil::Decoder::decodeCodable<HSTContactStabilizerConfig::FloatRangeGain>(&v7, (CoderKey *)HSUtil::CoderKey::Literal<(char)117,(char)110,(char)115,(char)116,(char)97,(char)98,(char)108,(char)101,(char)68,(char)101,(char)108,(char)116,(char)97,(char)90,(char)65,(char)114,(char)101,(char)97>::Key, (HSTContactStabilizerConfig::FloatRangeGain *)&this->unstableDeltaZArea);
  if (LODWORD(v7.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactStabilizerConfig::decode();
    }
    goto LABEL_31;
  }
  this->endLongtermZAreaInit = HSUtil::Decoder::decodeFloat((HSUtil::Decoder *)&v7, (const CoderKey *)HSUtil::CoderKey::Literal<(char)101,(char)110,(char)100,(char)76,(char)111,(char)110,(char)103,(char)116,(char)101,(char)114,(char)109,(char)90,(char)65,(char)114,(char)101,(char)97,(char)73,(char)110,(char)105,(char)116>::Key);
  if (LODWORD(v7.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactStabilizerConfig::decode();
    }
    goto LABEL_31;
  }
  this->endEarlyDeadzone = HSUtil::Decoder::decodeFloat((HSUtil::Decoder *)&v7, (const CoderKey *)HSUtil::CoderKey::Literal<(char)101,(char)110,(char)100,(char)69,(char)97,(char)114,(char)108,(char)121,(char)68,(char)101,(char)97,(char)100,(char)122,(char)111,(char)110,(char)101>::Key);
  if (LODWORD(v7.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactStabilizerConfig::decode();
    }
    goto LABEL_31;
  }
  this->endLateDeadzone = HSUtil::Decoder::decodeFloat((HSUtil::Decoder *)&v7, (const CoderKey *)HSUtil::CoderKey::Literal<(char)101,(char)110,(char)100,(char)76,(char)97,(char)116,(char)101,(char)68,(char)101,(char)97,(char)100,(char)122,(char)111,(char)110,(char)101>::Key);
  if (LODWORD(v7.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactStabilizerConfig::decode();
    }
    goto LABEL_31;
  }
  this->maxDeltaToHide = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)&v7, (const CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)97,(char)120,(char)68,(char)101,(char)108,(char)116,(char)97,(char)84,(char)111,(char)72,(char)105,(char)100,(char)101>::Key);
  if (LODWORD(v7.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactStabilizerConfig::decode();
    }
    goto LABEL_31;
  }
  this->hysteresisRadius = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)&v7, (const CoderKey *)HSUtil::CoderKey::Literal<(char)104,(char)121,(char)115,(char)116,(char)101,(char)114,(char)101,(char)115,(char)105,(char)115,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key);
  if (LODWORD(v7.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactStabilizerConfig::decode();
    }
    goto LABEL_31;
  }
  uint64_t v4 = 1;
LABEL_32:
  if (v9.var0) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v9.var0);
  }
  var0 = v8.var0;
  v8.var0 = 0;
  if (var0)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](var0);
    operator delete();
  }
  return v4;
}

void sub_E27C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

const CoderKey *HSUtil::Decoder::decodeCodable<HSTContactStabilizerConfig::FloatRangeGain>(const CoderKey *result, CoderKey *a2, HSTContactStabilizerConfig::FloatRangeGain *a3)
{
  if (SLODWORD(result->var0) <= 4)
  {
    uint64_t v4 = (uint64_t)result;
    unint64_t v5 = *(void *)&result[4].var1;
    float result = HSUtil::Decoder::_findKey(result, &v5, a2);
    if (!*(_DWORD *)v4)
    {
      float result = (const CoderKey *)HSUtil::Decoder::_readCodable<HSTContactStabilizerConfig::FloatRangeGain>(v4, &v5, a3);
      if (*(_DWORD *)v4 == 3) {
        *(_DWORD *)uint64_t v4 = 13;
      }
      else {
        *(void *)(v4 + 72) = v5;
      }
    }
  }
  return result;
}

void sub_E2B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E2EA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ContactStabilizer::update(ContactStabilizer *this, uint64_t a2, const Contact *a3)
{
  unsigned int stage = a3->stage;
  if (stage > 2)
  {
    unsigned __int8 v6 = stage - 3;
    if (*((unsigned char *)this + 136))
    {
      if (v6 >= 2u)
      {
        int v8 = *((unsigned __int8 *)this + 137);
        *((unsigned char *)this + 136) = 0;
        if (v8) {
          goto LABEL_4;
        }
        BOOL v9 = 0;
LABEL_17:
        InstabilityFilter::update((InstabilityFilter *)((char *)this + 24), a2, a3, v9);
        p_position = &a3->position;
        *((void *)this + 1) = ContactStabilizer::_capDelta((ContactStabilizer *)((char *)this + 8), (const Position *)(int)(float)(*((float *)this + 6)* (float)*(int *)(*((void *)this + 2)+ 60)), (unsigned int *)p_position, v11);
        uint64_t v13 = ContactStabilizer::_applyHysteresis((ContactStabilizer *)((char *)this + 8), (const Position *)*(unsigned int *)(*((void *)this + 2) + 64), p_position, v12);
        if (*((_DWORD *)this + 2) == v13)
        {
          int v14 = *((_DWORD *)this + 3);
          *((void *)this + 1) = v13;
          *((unsigned char *)this + 137) = v14 != HIDWORD(v13);
          if (v14 == HIDWORD(v13)) {
            return;
          }
        }
        else
        {
          *((unsigned char *)this + 137) = 1;
          *((void *)this + 1) = v13;
        }
        *(void *)this = v13;
        return;
      }
    }
    else if (v6 < 2u)
    {
      goto LABEL_3;
    }
    *((unsigned char *)this + 136) = v6 < 2u;
    BOOL v9 = *((unsigned char *)this + 137) != 0;
    goto LABEL_17;
  }
  unsigned __int8 v6 = stage - 3;
LABEL_3:
  *((unsigned char *)this + 136) = v6 < 2u;
LABEL_4:
  *((void *)this + 1) = a3->position;
  *(Position *)this = a3->position;
  *((unsigned char *)this + 137) = 0;
  if (*((unsigned char *)this + 64)) {
    *((unsigned char *)this + 64) = 0;
  }
  CoderKey v7 = (InstabilityFilter *)((char *)this + 24);
  if (*((unsigned char *)this + 96)) {
    *((unsigned char *)this + 96) = 0;
  }
  *(_DWORD *)CoderKey v7 = 0;

  InstabilityFilter::update(v7, a2, a3, 0);
}

void sub_E30F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

HSUtil::Encoder *HSUtil::Encoder::encodeCodable<HSTContactStabilizerConfig>(HSUtil::Encoder *result, const CoderKey *a2, HSTContactStabilizerConfig *a3)
{
  if (!*(_DWORD *)result)
  {
    uint64_t v4 = result;
    float result = (HSUtil::Encoder *)HSUtil::Encoder::_encodeKey(result, a2);
    if (!*(_DWORD *)v4)
    {
      return (HSUtil::Encoder *)HSTContactStabilizerConfig::encode(a3, v4);
    }
  }
  return result;
}

HSUtil::Encoder *HSUtil::Encoder::encodeArrayStart(HSUtil::Encoder *result, const CoderKey *a2, unsigned __int32 a3)
{
  if (!*(_DWORD *)result)
  {
    uint64_t v4 = result;
    float result = (HSUtil::Encoder *)HSUtil::Encoder::_encodeKey(result, a2);
    if (!*(_DWORD *)v4)
    {
      return (HSUtil::Encoder *)HSUtil::Encoder::_encodeArrayStart(v4, a3);
    }
  }
  return result;
}

void sub_E3540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

const CoderKey *HSUtil::Decoder::decodeCodable<HSTContactStabilizerConfig>(const CoderKey *result, CoderKey *a2, HSTContactStabilizerConfig *a3)
{
  if (SLODWORD(result->var0) <= 4)
  {
    uint64_t v4 = (uint64_t)result;
    unint64_t v5 = *(void *)&result[4].var1;
    float result = HSUtil::Decoder::_findKey(result, &v5, a2);
    if (!*(_DWORD *)v4)
    {
      float result = (const CoderKey *)HSUtil::Decoder::_readCodable<HSTContactStabilizerConfig>(v4, &v5, a3);
      if (*(_DWORD *)v4 == 3) {
        *(_DWORD *)uint64_t v4 = 13;
      }
      else {
        *(void *)(v4 + 72) = v5;
      }
    }
  }
  return result;
}

CoderKey *HSUtil::Decoder::decodeArray@<X0>(CoderKey *this@<X0>, CoderKey *a2@<X1>, uint64_t a3@<X8>)
{
  if (SLODWORD(this->var0) >= 5
    || (uint64_t v4 = this,
        unint64_t v11 = *(void *)&this[4].var1,
        this = (CoderKey *)HSUtil::Decoder::_findKey(this, &v11, a2),
        LODWORD(v4->var0)))
  {
    *(_DWORD *)a3 = 5;
    *(void *)(a3 + 8) = a3;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
  }
  else
  {
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v9 = v5;
    long long v10 = v5;
    long long v7 = v5;
    long long v8 = v5;
    long long v6 = v5;
    HSUtil::Decoder::_readArray((HSUtil::Decoder *)v4, &v11, (HSUtil::Decoder *)&v6);
    if (LODWORD(v4->var0) == 3)
    {
      LODWORD(v4->var0) = 13;
      *(_DWORD *)a3 = 5;
      *(void *)(a3 + 8) = a3;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
    }
    else
    {
      *(void *)&v4[4].var1 = v11;
      HSUtil::Decoder::Decoder(a3, (uint64_t)&v6);
    }
    if ((void)v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v8);
    }
    this = (CoderKey *)v7;
    *(void *)&long long v7 = 0;
    if (this)
    {
      std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](this);
      operator delete();
    }
  }
  return this;
}

void sub_E3708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

int *HSUtil::Decoder::decodeCodable<ContactStabilizer>(int *result, ContactStabilizer *a2)
{
  if (*result <= 4)
  {
    v2 = result;
    unint64_t v3 = *((void *)result + 9);
    float result = (int *)HSUtil::Decoder::_readCodable<ContactStabilizer>((uint64_t)result, &v3, a2);
    if (!*v2) {
      *((void *)v2 + 9) = v3;
    }
  }
  return result;
}

void sub_E3BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  HSUtil::Decoder::~Decoder((HSUtil::Decoder *)va);
  _Unwind_Resume(a1);
}

int *HSUtil::Decoder::decodeCodable<StatContact>(int *result, StatContact *a2)
{
  if (*result <= 4)
  {
    v2 = result;
    unint64_t v3 = *((void *)result + 9);
    float result = (int *)HSUtil::Decoder::_readCodable<StatContact>((uint64_t)result, &v3, a2);
    if (!*v2) {
      *((void *)v2 + 9) = v3;
    }
  }
  return result;
}

uint64_t StatContact::encode(StatContact *this, HSUtil::Encoder *a2)
{
  if (!*(_DWORD *)a2)
  {
    HSUtil::Encoder::_encodeArrayStart(a2, 1u);
    if (!*(_DWORD *)a2)
    {
      HSUtil::Encoder::_encodeUInt(a2, *(unsigned char *)this);
      if (!*(_DWORD *)a2)
      {
        char v4 = HSTPipeline::Position::encode((HSTPipeline::Position *)((char *)this + 4), a2);
        if (!*(_DWORD *)a2 && (v4 & 1) == 0) {
          goto LABEL_6;
        }
        if (*(_DWORD *)a2) {
          return 1;
        }
        char v6 = HSTPipeline::Position::encode((HSTPipeline::Position *)((char *)this + 12), a2);
        if (!*(_DWORD *)a2 && (v6 & 1) == 0) {
          goto LABEL_6;
        }
        if (*(_DWORD *)a2) {
          return 1;
        }
        char v7 = HSTPipeline::Position::encode((HSTPipeline::Position *)((char *)this + 20), a2);
        if (*(_DWORD *)a2 || (v7 & 1) != 0)
        {
          if (!*(_DWORD *)a2) {
            HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a2);
          }
        }
        else
        {
LABEL_6:
          *(_DWORD *)a2 = 10;
        }
      }
    }
  }
  return 1;
}

uint64_t StatContact::decode(StatContact *this, HSUtil::Decoder *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v11 = v4;
  long long v12 = v4;
  long long v9 = v4;
  long long v10 = v4;
  long long v8 = v4;
  HSUtil::Decoder::decodeArray(a2, (uint64_t)&v8);
  if (*(_DWORD *)a2)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      StatContact::decode();
    }
LABEL_16:
    uint64_t v5 = 0;
    goto LABEL_17;
  }
  *(unsigned char *)this = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v8);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      StatContact::decode();
    }
    goto LABEL_16;
  }
  HSUtil::Decoder::decodeCodable<HSTPipeline::Position>((int *)&v8, (HSTPipeline::Position *)((char *)this + 4));
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      StatContact::decode();
    }
    goto LABEL_16;
  }
  HSUtil::Decoder::decodeCodable<HSTPipeline::Position>((int *)&v8, (HSTPipeline::Position *)((char *)this + 12));
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      StatContact::decode();
    }
    goto LABEL_16;
  }
  HSUtil::Decoder::decodeCodable<HSTPipeline::Position>((int *)&v8, (HSTPipeline::Position *)((char *)this + 20));
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      StatContact::decode();
    }
    goto LABEL_16;
  }
  uint64_t v5 = 1;
LABEL_17:
  if ((void)v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
  }
  char v6 = (void *)v9;
  *(void *)&long long v9 = 0;
  if (v6)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v6);
    operator delete();
  }
  return v5;
}

void sub_E3F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

int *HSUtil::Decoder::decodeCodable<HSTPipeline::Position>(int *result, HSTPipeline::Position *a2)
{
  if (*result <= 4)
  {
    v2 = result;
    unint64_t v3 = *((void *)result + 9);
    float result = (int *)HSUtil::Decoder::_readCodable<HSTPipeline::Position>((uint64_t)result, &v3, a2);
    if (!*v2) {
      *((void *)v2 + 9) = v3;
    }
  }
  return result;
}

void InstabilityFilter::update(InstabilityFilter *this, uint64_t a2, const Contact *a3, int a4)
{
  char v6 = (float *)((char *)this + 48);
  *((_OWORD *)this + 3) = *((_OWORD *)this + 1);
  *(_OWORD *)((char *)this + 57) = *(_OWORD *)((char *)this + 25);
  float32x2_t v7 = vdiv_f32(vcvt_f32_s32(*(int32x2_t *)&a3->majorRadius), (float32x2_t)vdup_n_s32(0x447A0000u));
  float zsignal = a3->zsignal;
  if (!*((unsigned char *)this + 40)) {
    *((unsigned char *)this + 40) = 1;
  }
  *((void *)this + 2) = a2;
  *((float32x2_t *)this + 3) = v7;
  *((float *)this + 8) = zsignal;
  int stage = a3->stage;
  if ((stage - 1) > 3)
  {
    if (!*((unsigned char *)this + 72)) {
      goto LABEL_10;
    }
LABEL_8:
    if (*(void *)v6 <= a2) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (*((unsigned char *)this + 72) && (stage - 3) < 2) {
    goto LABEL_8;
  }
LABEL_9:
  *(_OWORD *)char v6 = *((_OWORD *)this + 1);
  *(_OWORD *)((char *)this + 57) = *(_OWORD *)((char *)this + 25);
  *((void *)this + 10) = a2;
  *((unsigned char *)this + 88) = 1;
  *((float *)this + 24) = zsignal;
  *((_DWORD *)this + 25) = v7.i32[0];
  *((_DWORD *)this + 26) = 0;
  *(_DWORD *)this = 0;
LABEL_10:
  if (*((unsigned char *)this + 88))
  {
    float v10 = InstabilityFilter::_timeInRange(this);
    long long v11 = (float *)*((void *)this + 1);
    float v12 = (double)(uint64_t)(*((void *)this + 2) - *((void *)this + 6)) / 1000000.0;
    long double v13 = v12 / 0.00800000038;
    float v14 = pow(flt_113168[v10 > v11[12]], v13);
    float v15 = *((float *)this + 8);
    float v16 = 1.0;
    float v17 = (float)(v15 * (float)(1.0 - v14)) + (float)(v14 * *((float *)this + 24));
    *((float *)this + 24) = v17;
    float v18 = pow(0.949999988, v13);
    *((float *)this + 25) = (float)(*((float *)this + 6) * (float)(1.0 - v18)) + (float)(v18 * *((float *)this + 25));
    float v19 = *((float *)this + 16);
    if (v15 <= v19) {
      v20 = v6;
    }
    else {
      v20 = (float *)((char *)this + 16);
    }
    float v21 = v20[4];
    if (v21 > 0.0)
    {
      float v22 = fabsf((float)((float)(v15 - v19) * 100.0) / v21);
      float v23 = 1.0;
      if (a4) {
        float v23 = v11[11];
      }
      float v24 = v23 * v11[9];
      double v25 = 0.0;
      if (v22 > v24)
      {
        float v26 = v23 * v11[10];
        double v25 = 1.0;
        if (v22 < v26) {
          double v25 = (float)((float)(v22 - v24) / (float)(v26 - v24));
        }
      }
      float v27 = pow(v25, 1.5);
      if ((a4 & (v15 < v17)) != 0) {
        float v28 = 0.0;
      }
      else {
        float v28 = v27;
      }
      float v29 = v11[8] + -1.0;
      float v30 = InstabilityFilter::_timeInRange(this);
      float v31 = 1.0;
      if (v30 > 0.0)
      {
        float v31 = 0.0;
        if (v30 < 0.5) {
          float v31 = (float)(0.5 - v30) + (float)(0.5 - v30);
        }
      }
      float v32 = (float)(v29 * v31) + 1.0;
      float v33 = *((float *)this + 6);
      float v34 = *((float *)this + 7);
      float v35 = vabds_f32(v33, *((float *)this + 14));
      float v36 = vabds_f32(v34, *((float *)this + 15));
      if (v35 > v36) {
        float v36 = v35;
      }
      long long v11 = (float *)*((void *)this + 1);
      float v37 = v32 * v11[6];
      double v38 = 0.0;
      if (v36 > v37) {
        double v38 = (float)((float)(v36 - v37) / (float)((float)(v32 * v11[7]) - v37));
      }
      float v39 = pow(v38, 1.5);
      float v40 = *((float *)this + 26);
      long double v41 = 0.25;
      if (v40 >= v39)
      {
        long double v41 = 0.75;
        if (*((float *)this + 8) < *((float *)this + 24)) {
          long double v41 = 0.5;
        }
      }
      float v42 = (double)(uint64_t)(*((void *)this + 2) - *((void *)this + 6)) / 1000000.0;
      float v43 = pow(v41, v42 / 0.00800000038);
      float v44 = (float)((float)(1.0 - v43) * v39) + (float)(v43 * v40);
      *((float *)this + 26) = v44;
      float v46 = v11[2];
      float v45 = v11[3];
      float v47 = 0.0;
      float v48 = 0.0;
      if (v33 > v46) {
        float v48 = (float)(v33 - v46) / (float)(v45 - v46);
      }
      float v50 = v11[4];
      float v49 = v11[5];
      if (v34 > v50) {
        float v47 = (float)(v34 - v50) / (float)(v49 - v50);
      }
      if (v34 <= 6.0)
      {
        float v51 = 1.0;
        if (v33 > 6.0) {
          float v51 = v33 / 6.0;
        }
      }
      else
      {
        float v51 = v33 / v34;
      }
      float v52 = 0.0;
      if (v51 > *v11) {
        float v52 = (float)(v51 - *v11) / (float)(v11[1] - *v11);
      }
      float v53 = *((float *)this + 25);
      float v54 = (float)(v53 - v49) / (float)((float)(v45 + 0.5) - v49);
      if (v53 <= v49) {
        float v54 = 0.0;
      }
      if (v44 <= v52) {
        float v44 = v52;
      }
      if (v47 <= v48) {
        float v47 = v48;
      }
      if (v44 <= v47) {
        float v44 = v47;
      }
      if (v44 <= v54) {
        float v44 = v54;
      }
      if (v28 <= v44) {
        float v16 = v44;
      }
      else {
        float v16 = v28;
      }
    }
    float v55 = 0.0;
    if ((a4 & 1) == 0)
    {
      float v56 = InstabilityFilter::_timeInRange(this);
      if (v56 <= 0.0)
      {
        float v59 = 1.0;
        float v58 = 0.2;
      }
      else
      {
        float v57 = v11[13];
        float v58 = 0.0;
        float v59 = 0.0;
        if (v57 > v56) {
          float v59 = (float)(v57 - v56) / v57;
        }
        float v60 = v11[14];
        if (v60 > v56) {
          float v58 = (float)((float)(v60 - v56) / v60) * 0.2;
        }
      }
      if (v59 <= v58) {
        float v55 = v58;
      }
      else {
        float v55 = v59;
      }
    }
    if (v16 > v55) {
      float v55 = v16;
    }
    *(float *)this = v55;
  }
}

uint64_t ContactStabilizer::_capDelta(ContactStabilizer *this, const Position *a2, unsigned int *a3, const Position *a4)
{
  int v4 = *((_DWORD *)this + 1);
  unsigned int v5 = *a3;
  unsigned int v6 = a3[1];
  if ((int)(*(_DWORD *)this - *a3) > (int)a2) {
    unsigned int v5 = *(_DWORD *)this - a2;
  }
  LODWORD(v7) = *(_DWORD *)this + a2;
  if ((int)(*a3 - *(_DWORD *)this) > (int)a2) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = v5;
  }
  int v8 = v6 - v4;
  if ((int)(v4 - v6) > (int)a2) {
    unsigned int v6 = v4 - a2;
  }
  LODWORD(v9) = v4 + a2;
  if (v8 > (int)a2) {
    uint64_t v9 = v9;
  }
  else {
    uint64_t v9 = v6;
  }
  return v7 | (v9 << 32);
}

uint64_t ContactStabilizer::_applyHysteresis(ContactStabilizer *this, const Position *a2, _DWORD *a3, const Position *a4)
{
  LODWORD(v4) = *(_DWORD *)this;
  LODWORD(v5) = *((_DWORD *)this + 1);
  int v6 = a3[1];
  if (*(_DWORD *)this - *a3 > (int)a2) {
    LODWORD(v4) = *a3 + a2;
  }
  if (*a3 - *(_DWORD *)this > (int)a2) {
    uint64_t v4 = (*a3 - a2);
  }
  else {
    uint64_t v4 = v4;
  }
  int v7 = v6 - v5;
  if ((int)v5 - v6 > (int)a2) {
    LODWORD(v5) = v6 + a2;
  }
  unsigned int v8 = v6 - a2;
  if (v7 > (int)a2) {
    uint64_t v5 = v8;
  }
  else {
    uint64_t v5 = v5;
  }
  return v4 | (v5 << 32);
}

float InstabilityFilter::_timeInRange(InstabilityFilter *this)
{
  if (!*((unsigned char *)this + 88)) {
    InstabilityFilter::_timeInRange();
  }
  return (double)(uint64_t)(*((void *)this + 2) - *((void *)this + 10)) / 1000000.0;
}

void *HSUtil::Decoder::_readCodable<HSTContactStabilizerConfig::FloatRange>(uint64_t a1, unint64_t *a2, HSTContactStabilizerConfig::FloatRange *a3)
{
  unint64_t v6 = *a2;
  float result = (void *)HSUtil::Decoder::_skipElement((HSUtil::Decoder *)a1, a2);
  if (!*(_DWORD *)a1)
  {
    unsigned int v8 = result;
    float result = HSUtil::Decoder::_loadKeyTableIfNeeded((HSUtil::Decoder *)a1, a2);
    if (!*(_DWORD *)a1)
    {
      v11[1] = *(void *)(a1 + 8);
      v11[0] = 0xAAAAAAAA00000000;
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v9 = *(std::__shared_weak_count **)(a1 + 32);
      float v12 = 0;
      uint64_t v13 = v10;
      float v14 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v15 = *(_OWORD *)(a1 + 40);
      unint64_t v16 = *(void *)(a1 + 56) + v6;
      float v17 = v8;
      uint64_t v18 = 0;
      if ((HSTContactStabilizerConfig::FloatRange::decode(a3, (HSUtil::Decoder *)v11) & 1) == 0) {
        *(_DWORD *)a1 = 10;
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      float result = v12;
      float v12 = 0;
      if (result)
      {
        std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](result);
        operator delete();
      }
    }
  }
  return result;
}

void sub_E4684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *HSUtil::Decoder::_readCodable<HSTContactStabilizerConfig::FloatRangeGain>(uint64_t a1, unint64_t *a2, HSTContactStabilizerConfig::FloatRangeGain *a3)
{
  unint64_t v6 = *a2;
  float result = (void *)HSUtil::Decoder::_skipElement((HSUtil::Decoder *)a1, a2);
  if (!*(_DWORD *)a1)
  {
    unsigned int v8 = result;
    float result = HSUtil::Decoder::_loadKeyTableIfNeeded((HSUtil::Decoder *)a1, a2);
    if (!*(_DWORD *)a1)
    {
      v11[1] = *(void *)(a1 + 8);
      v11[0] = 0xAAAAAAAA00000000;
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v9 = *(std::__shared_weak_count **)(a1 + 32);
      float v12 = 0;
      uint64_t v13 = v10;
      float v14 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v15 = *(_OWORD *)(a1 + 40);
      unint64_t v16 = *(void *)(a1 + 56) + v6;
      float v17 = v8;
      uint64_t v18 = 0;
      if ((HSTContactStabilizerConfig::FloatRangeGain::decode(a3, (HSUtil::Decoder *)v11) & 1) == 0) {
        *(_DWORD *)a1 = 10;
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      float result = v12;
      float v12 = 0;
      if (result)
      {
        std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](result);
        operator delete();
      }
    }
  }
  return result;
}

void sub_E478C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<StatContact>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x924924924924925) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(28 * a2);
}

uint64_t ContactStabilizer::encode(ContactStabilizer *this, HSUtil::Encoder *a2)
{
  if (!*(_DWORD *)a2) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a2, 4);
  }
  HSUtil::Encoder::encodeCodable<HSTPipeline::Position const>(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)112,(char)111,(char)115,(char)105,(char)116,(char)105,(char)111,(char)110>::Key, (HSTPipeline::Position *)this);
  HSUtil::Encoder::encodeCodable<HSTPipeline::Position const>(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)104,(char)121,(char)115,(char)116,(char)101,(char)114,(char)101,(char)115,(char)105,(char)115,(char)67,(char)101,(char)110,(char)116,(char)101,(char)114>::Key, (HSTPipeline::Position *)((char *)this + 8));
  HSUtil::Encoder::encodeCodable<InstabilityFilter const>(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)105,(char)110,(char)115,(char)116,(char)97,(char)98,(char)105,(char)108,(char)105,(char)116,(char)121,(char)70,(char)105,(char)108,(char)116,(char)101,(char)114>::Key, (InstabilityFilter *)((char *)this + 24));
  HSUtil::Encoder::encodeBool(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)111,(char)117,(char)99,(char)104,(char)105,(char)110,(char)103>::Key, *((unsigned __int8 *)this + 136));
  HSUtil::Encoder::encodeBool(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)108,(char)105,(char)100,(char)87,(char)104,(char)105,(char)108,(char)101,(char)69,(char)110,(char)103,(char)97,(char)103,(char)101,(char)100>::Key, *((unsigned __int8 *)this + 137));
  if (!*(_DWORD *)a2) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a2);
  }
  return 1;
}

HSUtil::Encoder *HSUtil::Encoder::encodeCodable<InstabilityFilter const>(HSUtil::Encoder *result, const CoderKey *a2, InstabilityFilter *a3)
{
  if (!*(_DWORD *)result)
  {
    uint64_t v4 = result;
    float result = (HSUtil::Encoder *)HSUtil::Encoder::_encodeKey(result, a2);
    if (!*(_DWORD *)v4)
    {
      float result = (HSUtil::Encoder *)InstabilityFilter::encode(a3, v4);
      if (!*(_DWORD *)v4 && (result & 1) == 0) {
        *(_DWORD *)uint64_t v4 = 10;
      }
    }
  }
  return result;
}

uint64_t InstabilityFilter::encode(InstabilityFilter *this, HSUtil::Encoder *a2)
{
  if (!*(_DWORD *)a2) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a2, 4);
  }
  HSUtil::Encoder::encodeFloat(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)105,(char)110,(char)115,(char)116,(char)97,(char)98,(char)105,(char)108,(char)105,(char)116,(char)121>::Key, *(float *)this);
  if (*((unsigned char *)this + 40)) {
    HSUtil::Encoder::encodeCodable<InstabilityFilter::StabilizerContact const>(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)99,(char)117,(char)114,(char)114,(char)101,(char)110,(char)116>::Key, (InstabilityFilter *)((char *)this + 16));
  }
  else {
    HSUtil::Encoder::encodeNull(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)99,(char)117,(char)114,(char)114,(char)101,(char)110,(char)116>::Key);
  }
  if (*((unsigned char *)this + 72)) {
    HSUtil::Encoder::encodeCodable<InstabilityFilter::StabilizerContact const>(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)112,(char)114,(char)101,(char)118,(char)105,(char)111,(char)117,(char)115>::Key, (InstabilityFilter *)((char *)this + 48));
  }
  else {
    HSUtil::Encoder::encodeNull(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)112,(char)114,(char)101,(char)118,(char)105,(char)111,(char)117,(char)115>::Key);
  }
  if (*((unsigned char *)this + 88)) {
    HSUtil::Encoder::encodeInt(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)105,(char)110,(char)82,(char)97,(char)110,(char)103,(char)101,(char)84,(char)105,(char)109,(char)101>::Key, *((void *)this + 10));
  }
  else {
    HSUtil::Encoder::encodeNull(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)105,(char)110,(char)82,(char)97,(char)110,(char)103,(char)101,(char)84,(char)105,(char)109,(char)101>::Key);
  }
  HSUtil::Encoder::encodeFloat(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)108,(char)111,(char)110,(char)103,(char)84,(char)101,(char)114,(char)109,(char)90,(char)97,(char)114,(char)101,(char)97>::Key, *((float *)this + 24));
  HSUtil::Encoder::encodeFloat(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)108,(char)111,(char)110,(char)103,(char)84,(char)101,(char)114,(char)109,(char)77,(char)97,(char)106,(char)111,(char)114,(char)69,(char)108,(char)108,(char)105,(char)112,(char)115,(char)101,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key, *((float *)this + 25));
  HSUtil::Encoder::encodeFloat(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)112,(char)114,(char)101,(char)118,(char)105,(char)111,(char)117,(char)115,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115,(char)73,(char)110,(char)115,(char)116,(char)97,(char)98,(char)105,(char)108,(char)105,(char)116,(char)121>::Key, *((float *)this + 26));
  if (!*(_DWORD *)a2) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a2);
  }
  return 1;
}

HSUtil::Encoder *HSUtil::Encoder::encodeCodable<InstabilityFilter::StabilizerContact const>(HSUtil::Encoder *result, const CoderKey *a2, InstabilityFilter::StabilizerContact *a3)
{
  if (!*(_DWORD *)result)
  {
    uint64_t v4 = result;
    float result = (HSUtil::Encoder *)HSUtil::Encoder::_encodeKey(result, a2);
    if (!*(_DWORD *)v4)
    {
      float result = (HSUtil::Encoder *)InstabilityFilter::StabilizerContact::encode(a3, v4);
      if (!*(_DWORD *)v4 && (result & 1) == 0) {
        *(_DWORD *)uint64_t v4 = 10;
      }
    }
  }
  return result;
}

HSUtil::Encoder *HSUtil::Encoder::encodeNull(HSUtil::Encoder *this, const CoderKey *a2)
{
  if (!*(_DWORD *)this)
  {
    v2 = (unint64_t *)this;
    this = (HSUtil::Encoder *)HSUtil::Encoder::_encodeKey(this, a2);
    if (!*(_DWORD *)v2)
    {
      unsigned __int8 __src = -116;
      return (HSUtil::Encoder *)HSUtil::Encoder::_write((HSUtil::Encoder *)v2, v2 + 17, &__src, 1uLL);
    }
  }
  return this;
}

uint64_t InstabilityFilter::StabilizerContact::encode(InstabilityFilter::StabilizerContact *this, HSUtil::Encoder *a2)
{
  if (!*(_DWORD *)a2) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a2, 1);
  }
  HSUtil::Encoder::encodeInt(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101>::Key, *(void *)this);
  HSUtil::Encoder::encodeFloat(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)97,(char)106,(char)111,(char)114,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key, *((float *)this + 2));
  HSUtil::Encoder::encodeFloat(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)105,(char)110,(char)111,(char)114,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key, *((float *)this + 3));
  HSUtil::Encoder::encodeFloat(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)122,(char)115,(char)105,(char)103,(char)110,(char)97,(char)108>::Key, *((float *)this + 4));
  if (!*(_DWORD *)a2) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a2);
  }
  return 1;
}

void *HSUtil::Decoder::_readCodable<HSTContactStabilizerConfig>(uint64_t a1, unint64_t *a2, HSTContactStabilizerConfig *a3)
{
  unint64_t v6 = *a2;
  float result = (void *)HSUtil::Decoder::_skipElement((HSUtil::Decoder *)a1, a2);
  if (!*(_DWORD *)a1)
  {
    unsigned int v8 = result;
    float result = HSUtil::Decoder::_loadKeyTableIfNeeded((HSUtil::Decoder *)a1, a2);
    if (!*(_DWORD *)a1)
    {
      v11[1] = *(void *)(a1 + 8);
      v11[0] = 0xAAAAAAAA00000000;
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v9 = *(std::__shared_weak_count **)(a1 + 32);
      float v12 = 0;
      uint64_t v13 = v10;
      float v14 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v15 = *(_OWORD *)(a1 + 40);
      unint64_t v16 = *(void *)(a1 + 56) + v6;
      float v17 = v8;
      uint64_t v18 = 0;
      if ((HSTContactStabilizerConfig::decode(a3, (HSUtil::Decoder *)v11) & 1) == 0) {
        *(_DWORD *)a1 = 10;
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      float result = v12;
      float v12 = 0;
      if (result)
      {
        std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](result);
        operator delete();
      }
    }
  }
  return result;
}

void sub_E4C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *HSUtil::Decoder::_readCodable<ContactStabilizer>(uint64_t a1, unint64_t *a2, ContactStabilizer *a3)
{
  unint64_t v6 = *a2;
  float result = (void *)HSUtil::Decoder::_skipElement((HSUtil::Decoder *)a1, a2);
  if (!*(_DWORD *)a1)
  {
    unsigned int v8 = result;
    float result = HSUtil::Decoder::_loadKeyTableIfNeeded((HSUtil::Decoder *)a1, a2);
    if (!*(_DWORD *)a1)
    {
      v11[1] = *(void *)(a1 + 8);
      v11[0] = 0xAAAAAAAA00000000;
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v9 = *(std::__shared_weak_count **)(a1 + 32);
      float v12 = 0;
      uint64_t v13 = v10;
      float v14 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v15 = *(_OWORD *)(a1 + 40);
      unint64_t v16 = *(void *)(a1 + 56) + v6;
      float v17 = v8;
      uint64_t v18 = 0;
      if ((ContactStabilizer::decode(a3, (HSUtil::Decoder *)v11) & 1) == 0) {
        *(_DWORD *)a1 = 10;
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      float result = v12;
      float v12 = 0;
      if (result)
      {
        std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](result);
        operator delete();
      }
    }
  }
  return result;
}

void sub_E4D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t ContactStabilizer::decode(ContactStabilizer *this, HSUtil::Decoder *a2)
{
  v4.var0 = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&v4.var1 = 0xAAAAAAAAAAAAAAAALL;
  CoderKey v11 = v4;
  CoderKey v12 = v4;
  CoderKey v9 = v4;
  CoderKey v10 = v4;
  CoderKey v8 = v4;
  HSUtil::Decoder::decodeMap((unint64_t *)a2, (uint64_t)&v8);
  if (*(_DWORD *)a2)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      ContactStabilizer::decode();
    }
LABEL_19:
    uint64_t v5 = 0;
    goto LABEL_20;
  }
  HSUtil::Decoder::decodeCodable<HSTPipeline::Position>(&v8, (CoderKey *)HSUtil::CoderKey::Literal<(char)112,(char)111,(char)115,(char)105,(char)116,(char)105,(char)111,(char)110>::Key, (HSTPipeline::Position *)this);
  if (LODWORD(v8.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      ContactStabilizer::decode();
    }
    goto LABEL_19;
  }
  HSUtil::Decoder::decodeCodable<HSTPipeline::Position>(&v8, (CoderKey *)HSUtil::CoderKey::Literal<(char)104,(char)121,(char)115,(char)116,(char)101,(char)114,(char)101,(char)115,(char)105,(char)115,(char)67,(char)101,(char)110,(char)116,(char)101,(char)114>::Key, (HSTPipeline::Position *)((char *)this + 8));
  if (LODWORD(v8.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      ContactStabilizer::decode();
    }
    goto LABEL_19;
  }
  HSUtil::Decoder::decodeCodable<InstabilityFilter>(&v8, (CoderKey *)HSUtil::CoderKey::Literal<(char)105,(char)110,(char)115,(char)116,(char)97,(char)98,(char)105,(char)108,(char)105,(char)116,(char)121,(char)70,(char)105,(char)108,(char)116,(char)101,(char)114>::Key, (InstabilityFilter *)((char *)this + 24));
  if (LODWORD(v8.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      ContactStabilizer::decode();
    }
    goto LABEL_19;
  }
  *((unsigned char *)this + 136) = HSUtil::Decoder::decodeBool((HSUtil::Decoder *)&v8, (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)111,(char)117,(char)99,(char)104,(char)105,(char)110,(char)103>::Key);
  if (LODWORD(v8.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      ContactStabilizer::decode();
    }
    goto LABEL_19;
  }
  *((unsigned char *)this + 137) = HSUtil::Decoder::decodeBool((HSUtil::Decoder *)&v8, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)108,(char)105,(char)100,(char)87,(char)104,(char)105,(char)108,(char)101,(char)69,(char)110,(char)103,(char)97,(char)103,(char)101,(char)100>::Key);
  if (LODWORD(v8.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      ContactStabilizer::decode();
    }
    goto LABEL_19;
  }
  uint64_t v5 = 1;
LABEL_20:
  if (v10.var0) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10.var0);
  }
  var0 = v9.var0;
  v9.var0 = 0;
  if (var0)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](var0);
    operator delete();
  }
  return v5;
}

void sub_E5060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

const CoderKey *HSUtil::Decoder::decodeCodable<InstabilityFilter>(const CoderKey *result, CoderKey *a2, InstabilityFilter *a3)
{
  if (SLODWORD(result->var0) <= 4)
  {
    uint64_t v4 = (uint64_t)result;
    unint64_t v5 = *(void *)&result[4].var1;
    float result = HSUtil::Decoder::_findKey(result, &v5, a2);
    if (!*(_DWORD *)v4)
    {
      float result = (const CoderKey *)HSUtil::Decoder::_readCodable<InstabilityFilter>(v4, &v5, a3);
      if (*(_DWORD *)v4 == 3) {
        *(_DWORD *)uint64_t v4 = 13;
      }
      else {
        *(void *)(v4 + 72) = v5;
      }
    }
  }
  return result;
}

void *HSUtil::Decoder::_readCodable<InstabilityFilter>(uint64_t a1, unint64_t *a2, InstabilityFilter *a3)
{
  unint64_t v6 = *a2;
  float result = (void *)HSUtil::Decoder::_skipElement((HSUtil::Decoder *)a1, a2);
  if (!*(_DWORD *)a1)
  {
    CoderKey v8 = result;
    float result = HSUtil::Decoder::_loadKeyTableIfNeeded((HSUtil::Decoder *)a1, a2);
    if (!*(_DWORD *)a1)
    {
      v11[1] = *(void *)(a1 + 8);
      v11[0] = 0xAAAAAAAA00000000;
      uint64_t v10 = *(void *)(a1 + 24);
      CoderKey v9 = *(std::__shared_weak_count **)(a1 + 32);
      CoderKey v12 = 0;
      uint64_t v13 = v10;
      float v14 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v15 = *(_OWORD *)(a1 + 40);
      unint64_t v16 = *(void *)(a1 + 56) + v6;
      float v17 = v8;
      uint64_t v18 = 0;
      if ((InstabilityFilter::decode(a3, (HSUtil::Decoder *)v11) & 1) == 0) {
        *(_DWORD *)a1 = 10;
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      float result = v12;
      CoderKey v12 = 0;
      if (result)
      {
        std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](result);
        operator delete();
      }
    }
  }
  return result;
}

void sub_E520C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t InstabilityFilter::decode(InstabilityFilter *this, HSUtil::Decoder *a2)
{
  v4.var0 = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&v4.var1 = 0xAAAAAAAAAAAAAAAALL;
  CoderKey v11 = v4;
  CoderKey v12 = v4;
  CoderKey v9 = v4;
  CoderKey v10 = v4;
  CoderKey v8 = v4;
  HSUtil::Decoder::decodeMap((unint64_t *)a2, (uint64_t)&v8);
  if (*(_DWORD *)a2)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      InstabilityFilter::decode();
    }
LABEL_41:
    uint64_t v5 = 0;
    goto LABEL_42;
  }
  *(float *)this = HSUtil::Decoder::decodeFloat((HSUtil::Decoder *)&v8, (const CoderKey *)HSUtil::CoderKey::Literal<(char)105,(char)110,(char)115,(char)116,(char)97,(char)98,(char)105,(char)108,(char)105,(char)116,(char)121>::Key);
  if (LODWORD(v8.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      InstabilityFilter::decode();
    }
    goto LABEL_41;
  }
  if (!*((unsigned char *)this + 40)) {
    *((unsigned char *)this + 40) = 1;
  }
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 8) = 0;
  if (HSUtil::Decoder::getElementType((HSUtil::Decoder *)&v8, (const CoderKey *)HSUtil::CoderKey::Literal<(char)99,(char)117,(char)114,(char)114,(char)101,(char)110,(char)116>::Key) == 140)
  {
    if (*((unsigned char *)this + 40)) {
      *((unsigned char *)this + 40) = 0;
    }
  }
  else
  {
    HSUtil::Decoder::decodeCodable<InstabilityFilter::StabilizerContact>(&v8, (CoderKey *)HSUtil::CoderKey::Literal<(char)99,(char)117,(char)114,(char)114,(char)101,(char)110,(char)116>::Key, (InstabilityFilter *)((char *)this + 16));
  }
  if (LODWORD(v8.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      InstabilityFilter::decode();
    }
    goto LABEL_41;
  }
  if (!*((unsigned char *)this + 72)) {
    *((unsigned char *)this + 72) = 1;
  }
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  *((_DWORD *)this + 16) = 0;
  if (HSUtil::Decoder::getElementType((HSUtil::Decoder *)&v8, (const CoderKey *)HSUtil::CoderKey::Literal<(char)112,(char)114,(char)101,(char)118,(char)105,(char)111,(char)117,(char)115>::Key) == 140)
  {
    if (*((unsigned char *)this + 72)) {
      *((unsigned char *)this + 72) = 0;
    }
  }
  else
  {
    HSUtil::Decoder::decodeCodable<InstabilityFilter::StabilizerContact>(&v8, (CoderKey *)HSUtil::CoderKey::Literal<(char)112,(char)114,(char)101,(char)118,(char)105,(char)111,(char)117,(char)115>::Key, (InstabilityFilter *)((char *)this + 48));
  }
  if (LODWORD(v8.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      InstabilityFilter::decode();
    }
    goto LABEL_41;
  }
  if (HSUtil::Decoder::getElementType((HSUtil::Decoder *)&v8, (const CoderKey *)HSUtil::CoderKey::Literal<(char)105,(char)110,(char)82,(char)97,(char)110,(char)103,(char)101,(char)84,(char)105,(char)109,(char)101>::Key) == 140)
  {
    if (*((unsigned char *)this + 88)) {
      *((unsigned char *)this + 88) = 0;
    }
  }
  else
  {
    *((void *)this + 10) = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)&v8, (const CoderKey *)HSUtil::CoderKey::Literal<(char)105,(char)110,(char)82,(char)97,(char)110,(char)103,(char)101,(char)84,(char)105,(char)109,(char)101>::Key);
    *((unsigned char *)this + 88) = 1;
  }
  if (LODWORD(v8.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      InstabilityFilter::decode();
    }
    goto LABEL_41;
  }
  *((float *)this + 24) = HSUtil::Decoder::decodeFloat((HSUtil::Decoder *)&v8, (const CoderKey *)HSUtil::CoderKey::Literal<(char)108,(char)111,(char)110,(char)103,(char)84,(char)101,(char)114,(char)109,(char)90,(char)97,(char)114,(char)101,(char)97>::Key);
  if (LODWORD(v8.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      InstabilityFilter::decode();
    }
    goto LABEL_41;
  }
  *((float *)this + 25) = HSUtil::Decoder::decodeFloat((HSUtil::Decoder *)&v8, (const CoderKey *)HSUtil::CoderKey::Literal<(char)108,(char)111,(char)110,(char)103,(char)84,(char)101,(char)114,(char)109,(char)77,(char)97,(char)106,(char)111,(char)114,(char)69,(char)108,(char)108,(char)105,(char)112,(char)115,(char)101,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key);
  if (LODWORD(v8.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      InstabilityFilter::decode();
    }
    goto LABEL_41;
  }
  *((float *)this + 26) = HSUtil::Decoder::decodeFloat((HSUtil::Decoder *)&v8, (const CoderKey *)HSUtil::CoderKey::Literal<(char)112,(char)114,(char)101,(char)118,(char)105,(char)111,(char)117,(char)115,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115,(char)73,(char)110,(char)115,(char)116,(char)97,(char)98,(char)105,(char)108,(char)105,(char)116,(char)121>::Key);
  if (LODWORD(v8.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      InstabilityFilter::decode();
    }
    goto LABEL_41;
  }
  uint64_t v5 = 1;
LABEL_42:
  if (v10.var0) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10.var0);
  }
  var0 = v9.var0;
  v9.var0 = 0;
  if (var0)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](var0);
    operator delete();
  }
  return v5;
}

void sub_E5670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t HSUtil::Decoder::getElementType(HSUtil::Decoder *this, const CoderKey *a2)
{
  if (*(int *)this > 4) {
    return 0;
  }
  unint64_t v4 = *((void *)this + 9);
  HSUtil::Decoder::_findKey((const CoderKey *)this, &v4, a2);
  if (*(_DWORD *)this) {
    return 0;
  }
  uint64_t result = HSUtil::Decoder::_readType(this, &v4);
  if (*(_DWORD *)this == 3)
  {
    uint64_t result = 0;
    *(_DWORD *)this = 13;
  }
  return result;
}

const CoderKey *HSUtil::Decoder::decodeCodable<InstabilityFilter::StabilizerContact>(const CoderKey *result, CoderKey *a2, InstabilityFilter::StabilizerContact *a3)
{
  if (SLODWORD(result->var0) <= 4)
  {
    uint64_t v4 = (uint64_t)result;
    unint64_t v5 = *(void *)&result[4].var1;
    uint64_t result = HSUtil::Decoder::_findKey(result, &v5, a2);
    if (!*(_DWORD *)v4)
    {
      uint64_t result = (const CoderKey *)HSUtil::Decoder::_readCodable<InstabilityFilter::StabilizerContact>(v4, &v5, a3);
      if (*(_DWORD *)v4 == 3) {
        *(_DWORD *)uint64_t v4 = 13;
      }
      else {
        *(void *)(v4 + 72) = v5;
      }
    }
  }
  return result;
}

void *HSUtil::Decoder::_readCodable<InstabilityFilter::StabilizerContact>(uint64_t a1, unint64_t *a2, InstabilityFilter::StabilizerContact *a3)
{
  unint64_t v6 = *a2;
  uint64_t result = (void *)HSUtil::Decoder::_skipElement((HSUtil::Decoder *)a1, a2);
  if (!*(_DWORD *)a1)
  {
    CoderKey v8 = result;
    uint64_t result = HSUtil::Decoder::_loadKeyTableIfNeeded((HSUtil::Decoder *)a1, a2);
    if (!*(_DWORD *)a1)
    {
      v11[1] = *(void *)(a1 + 8);
      v11[0] = 0xAAAAAAAA00000000;
      uint64_t v10 = *(void *)(a1 + 24);
      CoderKey v9 = *(std::__shared_weak_count **)(a1 + 32);
      CoderKey v12 = 0;
      uint64_t v13 = v10;
      float v14 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v15 = *(_OWORD *)(a1 + 40);
      unint64_t v16 = *(void *)(a1 + 56) + v6;
      float v17 = v8;
      uint64_t v18 = 0;
      if ((InstabilityFilter::StabilizerContact::decode(a3, (HSUtil::Decoder *)v11) & 1) == 0) {
        *(_DWORD *)a1 = 10;
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      uint64_t result = v12;
      CoderKey v12 = 0;
      if (result)
      {
        std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](result);
        operator delete();
      }
    }
  }
  return result;
}

void sub_E58A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t InstabilityFilter::StabilizerContact::decode(InstabilityFilter::StabilizerContact *this, HSUtil::Decoder *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v11 = v4;
  long long v12 = v4;
  long long v9 = v4;
  long long v10 = v4;
  long long v8 = v4;
  HSUtil::Decoder::decodeMap((unint64_t *)a2, (uint64_t)&v8);
  if (*(_DWORD *)a2)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      InstabilityFilter::StabilizerContact::decode();
    }
LABEL_16:
    uint64_t v5 = 0;
    goto LABEL_17;
  }
  *(void *)this = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)&v8, (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101>::Key);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      InstabilityFilter::StabilizerContact::decode();
    }
    goto LABEL_16;
  }
  *((float *)this + 2) = HSUtil::Decoder::decodeFloat((HSUtil::Decoder *)&v8, (const CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)97,(char)106,(char)111,(char)114,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      InstabilityFilter::StabilizerContact::decode();
    }
    goto LABEL_16;
  }
  *((float *)this + 3) = HSUtil::Decoder::decodeFloat((HSUtil::Decoder *)&v8, (const CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)105,(char)110,(char)111,(char)114,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      InstabilityFilter::StabilizerContact::decode();
    }
    goto LABEL_16;
  }
  *((float *)this + 4) = HSUtil::Decoder::decodeFloat((HSUtil::Decoder *)&v8, (const CoderKey *)HSUtil::CoderKey::Literal<(char)122,(char)115,(char)105,(char)103,(char)110,(char)97,(char)108>::Key);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      InstabilityFilter::StabilizerContact::decode();
    }
    goto LABEL_16;
  }
  uint64_t v5 = 1;
LABEL_17:
  if ((void)v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
  }
  unint64_t v6 = (void *)v9;
  *(void *)&long long v9 = 0;
  if (v6)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v6);
    operator delete();
  }
  return v5;
}

void sub_E5B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *HSUtil::Decoder::_readCodable<StatContact>(uint64_t a1, unint64_t *a2, StatContact *a3)
{
  unint64_t v6 = *a2;
  uint64_t result = (void *)HSUtil::Decoder::_skipElement((HSUtil::Decoder *)a1, a2);
  if (!*(_DWORD *)a1)
  {
    long long v8 = result;
    uint64_t result = HSUtil::Decoder::_loadKeyTableIfNeeded((HSUtil::Decoder *)a1, a2);
    if (!*(_DWORD *)a1)
    {
      v11[1] = *(void *)(a1 + 8);
      v11[0] = 0xAAAAAAAA00000000;
      uint64_t v10 = *(void *)(a1 + 24);
      long long v9 = *(std::__shared_weak_count **)(a1 + 32);
      long long v12 = 0;
      uint64_t v13 = v10;
      float v14 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v15 = *(_OWORD *)(a1 + 40);
      unint64_t v16 = *(void *)(a1 + 56) + v6;
      float v17 = v8;
      uint64_t v18 = 0;
      if ((StatContact::decode(a3, (HSUtil::Decoder *)v11) & 1) == 0) {
        *(_DWORD *)a1 = 10;
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      uint64_t result = v12;
      long long v12 = 0;
      if (result)
      {
        std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](result);
        operator delete();
      }
    }
  }
  return result;
}

void sub_E5C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void __cxx_global_var_init_72()
{
  {
    HSUtil::Coder::_ObjectType = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"com.apple.hid.HSCoder.ObjectType", v0);
  }
}

void __cxx_global_var_init_2_66(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)121,(char)112,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"type", a2);
  }
}

void __cxx_global_var_init_3_65(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"timestamp", a2);
  }
}

void __cxx_global_var_init_4_60(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)110,(char)105,(char)120,(char)84,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"unixTimestamp", a2);
  }
}

void __cxx_global_var_init_5_60(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)118,(char)101,(char)114,(char)115,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"version", a2);
  }
}

void __cxx_global_var_init_6_60(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)116,(char)99,(char)79,(char)102,(char)102,(char)115,(char)101,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"utcOffset", a2);
  }
}

void __cxx_global_var_init_7_60(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)116,(char)97,(char)116,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"state", a2);
  }
}

void __cxx_global_var_init_8_61(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)100,(char)97,(char)116,(char)97>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"data", a2);
  }
}

void __cxx_global_var_init_15_35(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)105,(char)110,(char)115,(char)116,(char)97,(char)98,(char)105,(char)108,(char)105,(char)116,(char)121>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"instability", a2);
  }
}

void __cxx_global_var_init_16_35(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)99,(char)117,(char)114,(char)114,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"current", a2);
  }
}

void __cxx_global_var_init_17_35(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)112,(char)114,(char)101,(char)118,(char)105,(char)111,(char)117,(char)115>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"previous", a2);
  }
}

void __cxx_global_var_init_18_34(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)105,(char)110,(char)82,(char)97,(char)110,(char)103,(char)101,(char)84,(char)105,(char)109,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"inRangeTime", a2);
  }
}

void __cxx_global_var_init_19_34(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)108,(char)111,(char)110,(char)103,(char)84,(char)101,(char)114,(char)109,(char)90,(char)97,(char)114,(char)101,(char)97>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"longTermZarea", a2);
  }
}

void __cxx_global_var_init_20_34(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)108,(char)111,(char)110,(char)103,(char)84,(char)101,(char)114,(char)109,(char)77,(char)97,(char)106,(char)111,(char)114,(char)69,(char)108,(char)108,(char)105,(char)112,(char)115,(char)101,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"longTermMajorEllipseRadius", a2);
  }
}

void __cxx_global_var_init_21_35(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)112,(char)114,(char)101,(char)118,(char)105,(char)111,(char)117,(char)115,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115,(char)73,(char)110,(char)115,(char)116,(char)97,(char)98,(char)105,(char)108,(char)105,(char)116,(char)121>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"previousRadiusInstability", a2);
  }
}

void __cxx_global_var_init_22_35(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"time", a2);
  }
}

void __cxx_global_var_init_23_34(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)109,(char)97,(char)106,(char)111,(char)114,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"majorRadius", a2);
  }
}

void __cxx_global_var_init_24_33(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)109,(char)105,(char)110,(char)111,(char)114,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"minorRadius", a2);
  }
}

void __cxx_global_var_init_25_31(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)122,(char)115,(char)105,(char)103,(char)110,(char)97,(char)108>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"zsignal", a2);
  }
}

void __cxx_global_var_init_26_31(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)112,(char)111,(char)115,(char)105,(char)116,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"position", a2);
  }
}

void __cxx_global_var_init_27_30(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)104,(char)121,(char)115,(char)116,(char)101,(char)114,(char)101,(char)115,(char)105,(char)115,(char)67,(char)101,(char)110,(char)116,(char)101,(char)114>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"hysteresisCenter", a2);
  }
}

void __cxx_global_var_init_28_30(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)105,(char)110,(char)115,(char)116,(char)97,(char)98,(char)105,(char)108,(char)105,(char)116,(char)121,(char)70,(char)105,(char)108,(char)116,(char)101,(char)114>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"instabilityFilter", a2);
  }
}

void __cxx_global_var_init_29_30(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)111,(char)117,(char)99,(char)104,(char)105,(char)110,(char)103>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"touching", a2);
  }
}

void __cxx_global_var_init_30_30(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)108,(char)105,(char)100,(char)87,(char)104,(char)105,(char)108,(char)101,(char)69,(char)110,(char)103,(char)97,(char)103,(char)101,(char)100>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"slidWhileEngaged", a2);
  }
}

void __cxx_global_var_init_33_18(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)114,(char)97,(char)110,(char)103,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"range", a2);
  }
}

void __cxx_global_var_init_34_18(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)103,(char)97,(char)105,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"gain", a2);
  }
}

void __cxx_global_var_init_36_18(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)101,(char)120,(char)99,(char)101,(char)115,(char)115,(char)105,(char)118,(char)101,(char)69,(char)99,(char)99,(char)101,(char)110,(char)116,(char)114,(char)105,(char)99,(char)105,(char)116,(char)121>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"excessiveEccentricity", a2);
  }
}

void __cxx_global_var_init_37_18(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)101,(char)120,(char)99,(char)101,(char)115,(char)115,(char)105,(char)118,(char)101,(char)77,(char)97,(char)106,(char)111,(char)114,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"excessiveMajorRadius", a2);
  }
}

void __cxx_global_var_init_38_18(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)101,(char)120,(char)99,(char)101,(char)115,(char)115,(char)105,(char)118,(char)101,(char)77,(char)105,(char)110,(char)111,(char)114,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"excessiveMinorRadius", a2);
  }
}

void __cxx_global_var_init_39_18(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)110,(char)115,(char)116,(char)97,(char)98,(char)108,(char)101,(char)68,(char)101,(char)108,(char)116,(char)97,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"unstableDeltaRadius", a2);
  }
}

void __cxx_global_var_init_40_18(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)110,(char)115,(char)116,(char)97,(char)98,(char)108,(char)101,(char)68,(char)101,(char)108,(char)116,(char)97,(char)90,(char)65,(char)114,(char)101,(char)97>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"unstableDeltaZArea", a2);
  }
}

void __cxx_global_var_init_41_17(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)101,(char)110,(char)100,(char)76,(char)111,(char)110,(char)103,(char)116,(char)101,(char)114,(char)109,(char)90,(char)65,(char)114,(char)101,(char)97,(char)73,(char)110,(char)105,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"endLongtermZAreaInit", a2);
  }
}

void __cxx_global_var_init_42_17(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)101,(char)110,(char)100,(char)69,(char)97,(char)114,(char)108,(char)121,(char)68,(char)101,(char)97,(char)100,(char)122,(char)111,(char)110,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"endEarlyDeadzone", a2);
  }
}

void __cxx_global_var_init_43_17(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)101,(char)110,(char)100,(char)76,(char)97,(char)116,(char)101,(char)68,(char)101,(char)97,(char)100,(char)122,(char)111,(char)110,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"endLateDeadzone", a2);
  }
}

void __cxx_global_var_init_44_17(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)109,(char)97,(char)120,(char)68,(char)101,(char)108,(char)116,(char)97,(char)84,(char)111,(char)72,(char)105,(char)100,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"maxDeltaToHide", a2);
  }
}

void __cxx_global_var_init_45_17(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)104,(char)121,(char)115,(char)116,(char)101,(char)114,(char)101,(char)115,(char)105,(char)115,(char)82,(char)97,(char)100,(char)105,(char)117,(char)115>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"hysteresisRadius", a2);
  }
}

void __cxx_global_var_init_46_17(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)99,(char)111,(char)110,(char)102,(char)105,(char)103>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"config", a2);
  }
}

void __cxx_global_var_init_47_17(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)116,(char)97,(char)98,(char)105,(char)108,(char)105,(char)122,(char)101,(char)114,(char)115>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"stabilizers", a2);
  }
}

void __cxx_global_var_init_80_0(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)67,(char)111,(char)110,(char)116,(char)97,(char)99,(char)116,(char)83,(char)116,(char)97,(char)98,(char)105,(char)108,(char)105,(char)122,(char)101,(char)114,(char)83,(char)116,(char)97,(char)116,(char)115>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTContactStabilizerStats", a2);
  }
}

void __cxx_global_var_init_73()
{
  {
    HSUtil::Coder::_ObjectType = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"com.apple.hid.HSCoder.ObjectType", v0);
  }
}

void __cxx_global_var_init_2_67(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)121,(char)112,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"type", a2);
  }
}

void __cxx_global_var_init_3_66(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"timestamp", a2);
  }
}

void __cxx_global_var_init_4_61(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)110,(char)105,(char)120,(char)84,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"unixTimestamp", a2);
  }
}

void __cxx_global_var_init_5_61(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)118,(char)101,(char)114,(char)115,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"version", a2);
  }
}

void __cxx_global_var_init_6_61(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)116,(char)99,(char)79,(char)102,(char)102,(char)115,(char)101,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"utcOffset", a2);
  }
}

void __cxx_global_var_init_7_61(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)116,(char)97,(char)116,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"state", a2);
  }
}

void __cxx_global_var_init_8_62(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)100,(char)97,(char)116,(char)97>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"data", a2);
  }
}

void sub_E6EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_E7198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E7238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E735C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E7508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E7670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E77C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __cxx_global_var_init_74()
{
  {
    HSUtil::Coder::_ObjectType = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"com.apple.hid.HSCoder.ObjectType", v0);
  }
}

void __cxx_global_var_init_2_68(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)121,(char)112,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"type", a2);
  }
}

void __cxx_global_var_init_3_67(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"timestamp", a2);
  }
}

void __cxx_global_var_init_4_62(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)110,(char)105,(char)120,(char)84,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"unixTimestamp", a2);
  }
}

void __cxx_global_var_init_5_62(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)118,(char)101,(char)114,(char)115,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"version", a2);
  }
}

void __cxx_global_var_init_6_62(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)116,(char)99,(char)79,(char)102,(char)102,(char)115,(char)101,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"utcOffset", a2);
  }
}

void __cxx_global_var_init_7_62(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)116,(char)97,(char)116,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"state", a2);
  }
}

void __cxx_global_var_init_8_63(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)100,(char)97,(char)116,(char)97>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"data", a2);
  }
}

uint64_t HSTHIDEventGeneratorConfig::encode(HSTHIDEventGeneratorConfig *this, HSUtil::Encoder *a2)
{
  if (!*(_DWORD *)a2) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a2, 1);
  }
  HSUtil::Encoder::encodeCodable<HSTPipeline::Position const>(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)117,(char)114,(char)102,(char)97,(char)99,(char)101,(char)83,(char)105,(char)122,(char)101>::Key, (HSTPipeline::Position *)this);
  if (!*(_DWORD *)a2) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a2);
  }
  return 1;
}

uint64_t HSTHIDEventGeneratorConfig::decode(HSTHIDEventGeneratorConfig *this, HSUtil::Decoder *a2)
{
  v3.var0 = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&v3.var1 = 0xAAAAAAAAAAAAAAAALL;
  CoderKey v10 = v3;
  CoderKey v11 = v3;
  CoderKey v8 = v3;
  CoderKey v9 = v3;
  CoderKey v7 = v3;
  HSUtil::Decoder::decodeMap((unint64_t *)a2, (uint64_t)&v7);
  if (LODWORD(v7.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTHIDEventGenerator.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTHIDEventGeneratorConfig::decode();
    }
LABEL_7:
    uint64_t v4 = 0;
    goto LABEL_8;
  }
  HSUtil::Decoder::decodeCodable<HSTPipeline::SurfaceSize>(&v7, (CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)117,(char)114,(char)102,(char)97,(char)99,(char)101,(char)83,(char)105,(char)122,(char)101>::Key, (HSTPipeline::SurfaceSize *)this);
  if (LODWORD(v7.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTHIDEventGenerator.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTHIDEventGeneratorConfig::decode();
    }
    goto LABEL_7;
  }
  uint64_t v4 = 1;
LABEL_8:
  if (v9.var0) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v9.var0);
  }
  var0 = v8.var0;
  v8.var0 = 0;
  if (var0)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](var0);
    operator delete();
  }
  return v4;
}

void sub_E7BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

const CoderKey *HSUtil::Decoder::decodeCodable<HSTPipeline::SurfaceSize>(const CoderKey *result, CoderKey *a2, HSTPipeline::SurfaceSize *a3)
{
  if (SLODWORD(result->var0) <= 4)
  {
    uint64_t v4 = (uint64_t)result;
    unint64_t v5 = *(void *)&result[4].var1;
    uint64_t result = HSUtil::Decoder::_findKey(result, &v5, a2);
    if (!*(_DWORD *)v4)
    {
      uint64_t result = (const CoderKey *)HSUtil::Decoder::_readCodable<HSTPipeline::SurfaceSize>(v4, &v5, a3);
      if (*(_DWORD *)v4 == 3) {
        *(_DWORD *)uint64_t v4 = 13;
      }
      else {
        *(void *)(v4 + 72) = v5;
      }
    }
  }
  return result;
}

void sub_E7D38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E7ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E7F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E8288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E9058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29)
{
  _Unwind_Resume(a1);
}

unint64_t getAveragePositionFromContacts(const Contact *a1, uint64_t a2)
{
  unint64_t v2 = 0;
  if (!a2)
  {
    int32x2_t v4 = 0;
    goto LABEL_12;
  }
  unint64_t v3 = 0;
  int32x2_t v4 = 0;
  p_position = (int32x2_t *)&a1->position;
  int32x2_t v6 = 0;
  do
  {
    int v7 = p_position[-2].u8[1];
    if ((v7 - 3) > 1)
    {
      if ((v7 - 1) > 3) {
        goto LABEL_8;
      }
      int32x2_t v8 = *p_position;
    }
    else
    {
      int32x2_t v8 = *p_position;
      int32x2_t v6 = vadd_s32(*p_position, v6);
      ++v3;
    }
    int32x2_t v4 = vadd_s32(v8, v4);
    ++v2;
LABEL_8:
    p_position += 8;
    --a2;
  }
  while (a2);
  if (!v3)
  {
LABEL_12:
    unint64_t v3 = v2;
    int32x2_t v6 = v4;
  }
  return (v6.i32[0] / v3) | ((unint64_t)(v6.i32[1] / v3) << 32);
}

uint64_t eventFlagsFromContact(const Contact *a1)
{
  p_flags = &a1->flags;
  uint32x4_t v2 = (uint32x4_t)vld1q_dup_f32((const float *)p_flags);
  int8x16_t v3 = vorrq_s8(vandq_s8((int8x16_t)vshlq_u32(v2, (uint32x4_t)xmmword_113320), (int8x16_t)xmmword_113350), vandq_s8((int8x16_t)vshlq_u32(v2, (uint32x4_t)xmmword_113330), (int8x16_t)xmmword_113340));
  *(int8x8_t *)v3.i8 = vorr_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL));
  return (v3.i32[0] | v3.i32[1]);
}

void sub_E9978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E9B5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E9E30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E9F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E9F9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_EA220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_EA458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_EA5A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

HSUtil::Encoder *HSUtil::Encoder::encodeCodable<HSTHIDEventGeneratorConfig>(HSUtil::Encoder *result, const CoderKey *a2, HSTHIDEventGeneratorConfig *a3)
{
  if (!*(_DWORD *)result)
  {
    int32x2_t v4 = result;
    uint64_t result = (HSUtil::Encoder *)HSUtil::Encoder::_encodeKey(result, a2);
    if (!*(_DWORD *)v4)
    {
      return (HSUtil::Encoder *)HSTHIDEventGeneratorConfig::encode(a3, v4);
    }
  }
  return result;
}

HSUtil::Encoder *HSUtil::Encoder::encodeCodable<HSTContactFrameMetadata>(HSUtil::Encoder *result, const CoderKey *a2, HSTContactFrameMetadata *a3)
{
  if (!*(_DWORD *)result)
  {
    int32x2_t v4 = result;
    uint64_t result = (HSUtil::Encoder *)HSUtil::Encoder::_encodeKey(result, a2);
    if (!*(_DWORD *)v4)
    {
      uint64_t result = (HSUtil::Encoder *)HSTContactFrameMetadata::encode(a3, v4);
      if (!*(_DWORD *)v4 && (result & 1) == 0) {
        *(_DWORD *)int32x2_t v4 = 10;
      }
    }
  }
  return result;
}

void sub_EAC64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

const CoderKey *HSUtil::Decoder::decodeCodable<HSTHIDEventGeneratorConfig>(const CoderKey *result, CoderKey *a2, HSTHIDEventGeneratorConfig *a3)
{
  if (SLODWORD(result->var0) <= 4)
  {
    uint64_t v4 = (uint64_t)result;
    unint64_t v5 = *(void *)&result[4].var1;
    uint64_t result = HSUtil::Decoder::_findKey(result, &v5, a2);
    if (!*(_DWORD *)v4)
    {
      uint64_t result = (const CoderKey *)HSUtil::Decoder::_readCodable<HSTHIDEventGeneratorConfig>(v4, &v5, a3);
      if (*(_DWORD *)v4 == 3) {
        *(_DWORD *)uint64_t v4 = 13;
      }
      else {
        *(void *)(v4 + 72) = v5;
      }
    }
  }
  return result;
}

const CoderKey *HSUtil::Decoder::decodeCodable<HSTContactFrameMetadata>(const CoderKey *result, CoderKey *a2, HSTContactFrameMetadata *a3)
{
  if (SLODWORD(result->var0) <= 4)
  {
    uint64_t v4 = (uint64_t)result;
    unint64_t v5 = *(void *)&result[4].var1;
    uint64_t result = HSUtil::Decoder::_findKey(result, &v5, a2);
    if (!*(_DWORD *)v4)
    {
      uint64_t result = (const CoderKey *)HSUtil::Decoder::_readCodable<HSTContactFrameMetadata>(v4, &v5, a3);
      if (*(_DWORD *)v4 == 3) {
        *(_DWORD *)uint64_t v4 = 13;
      }
      else {
        *(void *)(v4 + 72) = v5;
      }
    }
  }
  return result;
}

int *HSUtil::Decoder::decodeCodable<HSTPipeline::Contact>(int *result, HSTPipeline::Contact *a2)
{
  if (*result <= 4)
  {
    uint32x4_t v2 = result;
    unint64_t v3 = *((void *)result + 9);
    uint64_t result = (int *)HSUtil::Decoder::_readCodable<HSTPipeline::Contact>((uint64_t)result, &v3, a2);
    if (!*v2) {
      *((void *)v2 + 9) = v3;
    }
  }
  return result;
}

BOOL std::operator!=[abi:ne180100]<HSTContactFrameMetadata::Tritium3,HSTContactFrameMetadata::Tritium3>(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1[8]) {
    BOOL v2 = a2[8] == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    return (a1[8] != 0) ^ (a2[8] != 0);
  }
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return *((_DWORD *)a1 + 1) != *((_DWORD *)a2 + 1);
  }
  return 1;
}

void *HSUtil::Decoder::_readCodable<HSTPipeline::SurfaceSize>(uint64_t a1, unint64_t *a2, HSTPipeline::SurfaceSize *a3)
{
  unint64_t v6 = *a2;
  uint64_t result = (void *)HSUtil::Decoder::_skipElement((HSUtil::Decoder *)a1, a2);
  if (!*(_DWORD *)a1)
  {
    int32x2_t v8 = result;
    uint64_t result = HSUtil::Decoder::_loadKeyTableIfNeeded((HSUtil::Decoder *)a1, a2);
    if (!*(_DWORD *)a1)
    {
      v11[1] = *(void *)(a1 + 8);
      v11[0] = 0xAAAAAAAA00000000;
      uint64_t v10 = *(void *)(a1 + 24);
      CoderKey v9 = *(std::__shared_weak_count **)(a1 + 32);
      long long v12 = 0;
      uint64_t v13 = v10;
      float v14 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v15 = *(_OWORD *)(a1 + 40);
      unint64_t v16 = *(void *)(a1 + 56) + v6;
      float v17 = v8;
      uint64_t v18 = 0;
      if ((HSTPipeline::SurfaceSize::decode(a3, (HSUtil::Decoder *)v11) & 1) == 0) {
        *(_DWORD *)a1 = 10;
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      uint64_t result = v12;
      long long v12 = 0;
      if (result)
      {
        std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](result);
        operator delete();
      }
    }
  }
  return result;
}

void sub_EB07C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *HSUtil::Decoder::_readCodable<HSTHIDEventGeneratorConfig>(uint64_t a1, unint64_t *a2, HSTHIDEventGeneratorConfig *a3)
{
  unint64_t v6 = *a2;
  uint64_t result = (void *)HSUtil::Decoder::_skipElement((HSUtil::Decoder *)a1, a2);
  if (!*(_DWORD *)a1)
  {
    int32x2_t v8 = result;
    uint64_t result = HSUtil::Decoder::_loadKeyTableIfNeeded((HSUtil::Decoder *)a1, a2);
    if (!*(_DWORD *)a1)
    {
      v11[1] = *(void *)(a1 + 8);
      v11[0] = 0xAAAAAAAA00000000;
      uint64_t v10 = *(void *)(a1 + 24);
      CoderKey v9 = *(std::__shared_weak_count **)(a1 + 32);
      long long v12 = 0;
      uint64_t v13 = v10;
      float v14 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v15 = *(_OWORD *)(a1 + 40);
      unint64_t v16 = *(void *)(a1 + 56) + v6;
      float v17 = v8;
      uint64_t v18 = 0;
      if ((HSTHIDEventGeneratorConfig::decode(a3, (HSUtil::Decoder *)v11) & 1) == 0) {
        *(_DWORD *)a1 = 10;
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      uint64_t result = v12;
      long long v12 = 0;
      if (result)
      {
        std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](result);
        operator delete();
      }
    }
  }
  return result;
}

void sub_EB184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *HSUtil::Decoder::_readCodable<HSTContactFrameMetadata>(uint64_t a1, unint64_t *a2, HSTContactFrameMetadata *a3)
{
  unint64_t v6 = *a2;
  uint64_t result = (void *)HSUtil::Decoder::_skipElement((HSUtil::Decoder *)a1, a2);
  if (!*(_DWORD *)a1)
  {
    int32x2_t v8 = result;
    uint64_t result = HSUtil::Decoder::_loadKeyTableIfNeeded((HSUtil::Decoder *)a1, a2);
    if (!*(_DWORD *)a1)
    {
      v11[1] = *(void *)(a1 + 8);
      v11[0] = 0xAAAAAAAA00000000;
      uint64_t v10 = *(void *)(a1 + 24);
      CoderKey v9 = *(std::__shared_weak_count **)(a1 + 32);
      long long v12 = 0;
      uint64_t v13 = v10;
      float v14 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v15 = *(_OWORD *)(a1 + 40);
      unint64_t v16 = *(void *)(a1 + 56) + v6;
      float v17 = v8;
      uint64_t v18 = 0;
      if ((HSTContactFrameMetadata::decode(a3, (HSUtil::Decoder *)v11) & 1) == 0) {
        *(_DWORD *)a1 = 10;
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      uint64_t result = v12;
      long long v12 = 0;
      if (result)
      {
        std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](result);
        operator delete();
      }
    }
  }
  return result;
}

void sub_EB28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *HSUtil::Decoder::_readCodable<HSTPipeline::Contact>(uint64_t a1, unint64_t *a2, HSTPipeline::Contact *a3)
{
  unint64_t v6 = *a2;
  uint64_t result = (void *)HSUtil::Decoder::_skipElement((HSUtil::Decoder *)a1, a2);
  if (!*(_DWORD *)a1)
  {
    int32x2_t v8 = result;
    uint64_t result = HSUtil::Decoder::_loadKeyTableIfNeeded((HSUtil::Decoder *)a1, a2);
    if (!*(_DWORD *)a1)
    {
      v11[1] = *(void *)(a1 + 8);
      v11[0] = 0xAAAAAAAA00000000;
      uint64_t v10 = *(void *)(a1 + 24);
      CoderKey v9 = *(std::__shared_weak_count **)(a1 + 32);
      long long v12 = 0;
      uint64_t v13 = v10;
      float v14 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v15 = *(_OWORD *)(a1 + 40);
      unint64_t v16 = *(void *)(a1 + 56) + v6;
      float v17 = v8;
      uint64_t v18 = 0;
      if ((HSTPipeline::Contact::decode(a3, (HSUtil::Decoder *)v11) & 1) == 0) {
        *(_DWORD *)a1 = 10;
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      uint64_t result = v12;
      long long v12 = 0;
      if (result)
      {
        std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](result);
        operator delete();
      }
    }
  }
  return result;
}

void sub_EB394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void __cxx_global_var_init_75()
{
  {
    HSUtil::Coder::_ObjectType = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"com.apple.hid.HSCoder.ObjectType", v0);
  }
}

void __cxx_global_var_init_2_69(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)121,(char)112,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"type", a2);
  }
}

void __cxx_global_var_init_3_68(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"timestamp", a2);
  }
}

void __cxx_global_var_init_4_63(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)110,(char)105,(char)120,(char)84,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"unixTimestamp", a2);
  }
}

void __cxx_global_var_init_5_63(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)118,(char)101,(char)114,(char)115,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"version", a2);
  }
}

void __cxx_global_var_init_6_63(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)116,(char)99,(char)79,(char)102,(char)102,(char)115,(char)101,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"utcOffset", a2);
  }
}

void __cxx_global_var_init_7_63(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)116,(char)97,(char)116,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"state", a2);
  }
}

void __cxx_global_var_init_8_64(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)100,(char)97,(char)116,(char)97>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"data", a2);
  }
}

void __cxx_global_var_init_15_36(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)117,(char)114,(char)102,(char)97,(char)99,(char)101,(char)83,(char)105,(char)122,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"surfaceSize", a2);
  }
}

void __cxx_global_var_init_18_35(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)99,(char)111,(char)110,(char)102,(char)105,(char)103>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"config", a2);
  }
}

void __cxx_global_var_init_19_35(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)102,(char)114,(char)97,(char)109,(char)101,(char)77,(char)101,(char)116,(char)97,(char)100,(char)97,(char)116,(char)97>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"frameMetadata", a2);
  }
}

void __cxx_global_var_init_20_35(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)108,(char)97,(char)114,(char)103,(char)101,(char)66,(char)111,(char)100,(char)121,(char)65,(char)99,(char)116,(char)105,(char)118,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"largeBodyActive", a2);
  }
}

void __cxx_global_var_init_21_36(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)100,(char)105,(char)115,(char)97,(char)98,(char)108,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116,(char)115>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"disableEvents", a2);
  }
}

void __cxx_global_var_init_22_36(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)111,(char)117,(char)99,(char)104,(char)77,(char)111,(char)100,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"touchMode", a2);
  }
}

void __cxx_global_var_init_23_35(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)99,(char)111,(char)110,(char)116,(char)97,(char)99,(char)116,(char)115>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"contacts", a2);
  }
}

void sub_EB9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_EBFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  HSUtil::Buffer::~Buffer((HSUtil::Buffer *)va);
  _Unwind_Resume(a1);
}

void HSUtil::Decoder::decodeString(HSUtil::Decoder *this@<X0>, const CoderKey *a2@<X1>, uint64_t a3@<X8>)
{
  if (*(int *)this >= 5
    || (unint64_t v8 = *((void *)this + 9), HSUtil::Decoder::_findKey((const CoderKey *)this, &v8, a2), *(_DWORD *)this))
  {
    *(void *)a3 = &off_1410A8;
    *(void *)(a3 + 8) = &off_141100;
    *(void *)(a3 + 16) = &off_141120;
    *(void *)(a3 + 24) = &off_141138;
    *(void *)(a3 + 32) = off_141150;
    *(void *)(a3 + 40) = 0;
    *(void *)(a3 + 48) = 0;
    *(void *)(a3 + 56) = 0;
    *(unsigned char *)(a3 + 64) &= 0xFCu;
  }
  else
  {
    unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v6[2] = v5;
    v6[3] = v5;
    v6[0] = v5;
    v6[1] = v5;
    HSUtil::Decoder::_readString(this, &v8, (uint64_t)v6);
    if (*(_DWORD *)this == 3)
    {
      *(_DWORD *)this = 13;
      *(void *)a3 = &off_1410A8;
      *(void *)(a3 + 8) = &off_141100;
      *(void *)(a3 + 16) = &off_141120;
      *(void *)(a3 + 24) = &off_141138;
      *(void *)(a3 + 32) = off_141150;
      *(void *)(a3 + 40) = 0;
      *(void *)(a3 + 48) = 0;
      *(void *)(a3 + 56) = 0;
      *(unsigned char *)(a3 + 64) &= 0xFCu;
    }
    else
    {
      *((void *)this + 9) = v8;
      HSUtil::Buffer::Buffer(a3, (uint64_t)v6);
    }
    HSUtil::Buffer::~Buffer((HSUtil::Buffer *)v6);
  }
}

void sub_EC1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_EC344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_EC5B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  HSUtil::Buffer::~Buffer((HSUtil::Buffer *)va);
  _Unwind_Resume(a1);
}

void sub_EC73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_EC87C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_ECA54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_ECB64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_ED7D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_ED8B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __cxx_global_var_init_76()
{
  {
    HSUtil::Coder::_ObjectType = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"com.apple.hid.HSCoder.ObjectType", v0);
  }
}

void __cxx_global_var_init_2_70(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)121,(char)112,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"type", a2);
  }
}

void __cxx_global_var_init_3_69(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"timestamp", a2);
  }
}

void __cxx_global_var_init_4_64(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)110,(char)105,(char)120,(char)84,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"unixTimestamp", a2);
  }
}

void __cxx_global_var_init_5_64(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)118,(char)101,(char)114,(char)115,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"version", a2);
  }
}

void __cxx_global_var_init_6_64(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)116,(char)99,(char)79,(char)102,(char)102,(char)115,(char)101,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"utcOffset", a2);
  }
}

void __cxx_global_var_init_7_64(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)116,(char)97,(char)116,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"state", a2);
  }
}

void __cxx_global_var_init_8_65(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)100,(char)97,(char)116,(char)97>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"data", a2);
  }
}

void __cxx_global_var_init_77_0(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)70,(char)101,(char)101,(char)100,(char)98,(char)97,(char)99,(char)107,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTFeedbackEvent", a2);
  }
}

void __cxx_global_var_init_86_0(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)73,(char)110,(char)116,(char)101,(char)103,(char)101,(char)114,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTIntegerEvent", a2);
  }
}

void __cxx_global_var_init_87_0(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)118,(char)97,(char)108,(char)117,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"value", a2);
  }
}

void __cxx_global_var_init_98(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)83,(char)105,(char)103,(char)110,(char)101,(char)100,(char)73,(char)110,(char)116,(char)101,(char)103,(char)101,(char)114,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTSignedIntegerEvent", a2);
  }
}

void __cxx_global_var_init_104(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)83,(char)101,(char)116,(char)80,(char)114,(char)111,(char)112,(char)101,(char)114,(char)116,(char)121,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTSetPropertyEvent", a2);
  }
}

void __cxx_global_var_init_105(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)107,(char)101,(char)121>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"key", a2);
  }
}

void __cxx_global_var_init_116(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)71,(char)101,(char)116,(char)80,(char)114,(char)111,(char)112,(char)101,(char)114,(char)116,(char)121,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTGetPropertyEvent", a2);
  }
}

void __cxx_global_var_init_123(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)67,(char)111,(char)112,(char)121,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTCopyEvent", a2);
  }
}

void __cxx_global_var_init_152_0(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)82,(char)101,(char)115,(char)101,(char)116,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTResetEvent", a2);
  }
}

void __cxx_global_var_init_157(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)65,(char)99,(char)116,(char)105,(char)118,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTActivateEvent", a2);
  }
}

void __cxx_global_var_init_162(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)67,(char)97,(char)110,(char)99,(char)101,(char)108,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTCancelEvent", a2);
  }
}

void __cxx_global_var_init_167_0(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)78,(char)111,(char)116,(char)105,(char)102,(char)105,(char)99,(char)97,(char)116,(char)105,(char)111,(char)110,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTNotificationEvent", a2);
  }
}

void __cxx_global_var_init_180(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)86,(char)101,(char)110,(char)100,(char)111,(char)114,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTVendorEvent", a2);
  }
}

void __cxx_global_var_init_197(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)83,(char)101,(char)116,(char)82,(char)101,(char)112,(char)111,(char)114,(char)116,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTSetReportEvent", a2);
  }
}

void __cxx_global_var_init_211(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)87,(char)97,(char)107,(char)101,(char)83,(char)121,(char)115,(char)116,(char)101,(char)109,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTWakeSystemEvent", a2);
  }
}

void __cxx_global_var_init_212(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)97,(char)112,(char)80,(char)111,(char)115,(char)105,(char)116,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"tapPosition", a2);
  }
}

void __cxx_global_var_init_213(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)119,(char)105,(char)112,(char)101,(char)68,(char)105,(char)114,(char)101,(char)99,(char)116,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"swipeDirection", a2);
  }
}

void __cxx_global_var_init_214(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)108,(char)111,(char)110,(char)103,(char)80,(char)114,(char)101,(char)115,(char)115,(char)80,(char)111,(char)115,(char)105,(char)116,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"longPressPosition", a2);
  }
}

void __cxx_global_var_init_227(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)84,(char)111,(char)117,(char)99,(char)104,(char)77,(char)111,(char)100,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTTouchModeEvent", a2);
  }
}

void __cxx_global_var_init_232(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)77,(char)111,(char)116,(char)105,(char)111,(char)110,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTMotionStateEvent", a2);
  }
}

void __cxx_global_var_init_239(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)83,(char)99,(char)114,(char)101,(char)101,(char)110,(char)79,(char)114,(char)105,(char)101,(char)110,(char)116,(char)97,(char)116,(char)105,(char)111,(char)110,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTScreenOrientationEvent", a2);
  }
}

void __cxx_global_var_init_245(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)72,(char)111,(char)115,(char)116,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTHostStateEvent", a2);
  }
}

void __cxx_global_var_init_276(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)87,(char)114,(char)105,(char)115,(char)116,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTWristStateEvent", a2);
  }
}

void __cxx_global_var_init_282(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)84,(char)111,(char)117,(char)99,(char)104,(char)72,(char)97,(char)110,(char)100,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTTouchHandEvent", a2);
  }
}

void __cxx_global_var_init_288(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)83,(char)116,(char)111,(char)99,(char)107,(char)104,(char)111,(char)108,(char)109,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTStockholmStateEvent", a2);
  }
}

void __cxx_global_var_init_294(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)87,(char)105,(char)114,(char)101,(char)108,(char)101,(char)115,(char)115,(char)67,(char)104,(char)97,(char)114,(char)103,(char)105,(char)110,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTWirelessChargingStateEvent", a2);
  }
}

void __cxx_global_var_init_300(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)85,(char)83,(char)66,(char)67,(char)104,(char)97,(char)114,(char)103,(char)105,(char)110,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTUSBChargingStateEvent", a2);
  }
}

void __cxx_global_var_init_306(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)83,(char)116,(char)117,(char)99,(char)107,(char)84,(char)111,(char)117,(char)99,(char)104,(char)68,(char)101,(char)116,(char)101,(char)99,(char)116,(char)111,(char)114,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTStuckTouchDetectorStateEvent", a2);
  }
}

void __cxx_global_var_init_312(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)71,(char)101,(char)116,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTGetStateEvent", a2);
  }
}

void __cxx_global_var_init_313(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)104,(char)97,(char)110,(char)100,(char)108,(char)101,(char)100>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"handled", a2);
  }
}

void __cxx_global_var_init_320(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)71,(char)101,(char)116,(char)87,(char)97,(char)116,(char)101,(char)114,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTGetWaterStateEvent", a2);
  }
}

void __cxx_global_var_init_321(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)119,(char)97,(char)116,(char)101,(char)114>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"water", a2);
  }
}

void __cxx_global_var_init_322(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)99,(char)111,(char)110,(char)102,(char)105,(char)100,(char)101,(char)110,(char)99,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"confidence", a2);
  }
}

void __cxx_global_var_init_330(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)71,(char)101,(char)116,(char)68,(char)101,(char)98,(char)117,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTGetDebugStateEvent", a2);
  }
}

void __cxx_global_var_init_331(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)100,(char)101,(char)98,(char)117,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101,(char)115>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"debugStates", a2);
  }
}

void __cxx_global_var_init_340(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)83,(char)121,(char)115,(char)116,(char)101,(char)109,(char)80,(char)111,(char)119,(char)101,(char)114,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTSystemPowerEvent", a2);
  }
}

void __cxx_global_var_init_346(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)69,(char)120,(char)116,(char)101,(char)114,(char)110,(char)97,(char)108,(char)77,(char)101,(char)115,(char)115,(char)97,(char)103,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTExternalMessageEvent", a2);
  }
}

void __cxx_global_var_init_360(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)84,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112,(char)83,(char)121,(char)110,(char)99,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTTimestampSyncEvent", a2);
  }
}

void __cxx_global_var_init_365(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)80,(char)114,(char)111,(char)120,(char)67,(char)108,(char)101,(char)97,(char)114,(char)101,(char)100,(char)65,(char)102,(char)116,(char)101,(char)114,(char)79,(char)99,(char)99,(char)108,(char)117,(char)100,(char)101,(char)100,(char)87,(char)97,(char)107,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTProxClearedAfterOccludedWakeEvent", a2);
  }
}

void sub_EE5E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_EE7BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_EE898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_EE978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_EEC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void __cxx_global_var_init_77()
{
  {
    HSUtil::Coder::_ObjectType = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"com.apple.hid.HSCoder.ObjectType", v0);
  }
}

void __cxx_global_var_init_2_71(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)121,(char)112,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"type", a2);
  }
}

void __cxx_global_var_init_3_70(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"timestamp", a2);
  }
}

void __cxx_global_var_init_4_65(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)110,(char)105,(char)120,(char)84,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"unixTimestamp", a2);
  }
}

void __cxx_global_var_init_5_65(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)118,(char)101,(char)114,(char)115,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"version", a2);
  }
}

void __cxx_global_var_init_6_65(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)116,(char)99,(char)79,(char)102,(char)102,(char)115,(char)101,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"utcOffset", a2);
  }
}

void __cxx_global_var_init_7_65(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)116,(char)97,(char)116,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"state", a2);
  }
}

void __cxx_global_var_init_8_66(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)100,(char)97,(char)116,(char)97>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"data", a2);
  }
}

void __cxx_global_var_init_15_37(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)105,(char)112,(char)79,(char)102,(char)102,(char)115,(char)101,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"tipOffset", a2);
  }
}

void __cxx_global_var_init_16_36(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)99,(char)114,(char)101,(char)101,(char)110,(char)79,(char)114,(char)105,(char)101,(char)110,(char)116,(char)97,(char)116,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"screenOrientation", a2);
  }
}

void __cxx_global_var_init_17_36(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)111,(char)117,(char)99,(char)104,(char)72,(char)97,(char)110,(char)100>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"touchHand", a2);
  }
}

void sub_EF014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __cxx_global_var_init_78()
{
  {
    HSUtil::Coder::_ObjectType = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"com.apple.hid.HSCoder.ObjectType", v0);
  }
}

void __cxx_global_var_init_2_72(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)121,(char)112,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"type", a2);
  }
}

void __cxx_global_var_init_3_71(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"timestamp", a2);
  }
}

void __cxx_global_var_init_4_66(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)110,(char)105,(char)120,(char)84,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"unixTimestamp", a2);
  }
}

void __cxx_global_var_init_5_66(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)118,(char)101,(char)114,(char)115,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"version", a2);
  }
}

void __cxx_global_var_init_6_66(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)116,(char)99,(char)79,(char)102,(char)102,(char)115,(char)101,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"utcOffset", a2);
  }
}

void __cxx_global_var_init_7_66(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)116,(char)97,(char)116,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"state", a2);
  }
}

void __cxx_global_var_init_8_67(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)100,(char)97,(char)116,(char)97>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"data", a2);
  }
}

uint64_t HSTContactFrameMetadata::Image::encode(HSTContactFrameMetadata::Image *this, HSUtil::Encoder *a2)
{
  if (!*(_DWORD *)a2)
  {
    HSUtil::Encoder::_encodeArrayStart(a2, 1u);
    if (!*(_DWORD *)a2)
    {
      char v4 = HSTPipeline::SensorSize::encode(this, a2);
      if (*(_DWORD *)a2 || (v4 & 1) != 0)
      {
        if (!*(_DWORD *)a2)
        {
          HSUtil::Encoder::_encodeUInt(a2, *((void *)this + 1));
          if (!*(_DWORD *)a2) {
            HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a2);
          }
        }
      }
      else
      {
        *(_DWORD *)a2 = 10;
      }
    }
  }
  return 1;
}

uint64_t HSTContactFrameMetadata::Image::decode(HSTContactFrameMetadata::Image *this, HSUtil::Decoder *a2)
{
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v10 = v3;
  long long v11 = v3;
  long long v8 = v3;
  long long v9 = v3;
  long long v7 = v3;
  HSUtil::Decoder::decodeArray(a2, (uint64_t)&v7);
  if (v7)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrame.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactFrameMetadata::Image::decode();
    }
LABEL_10:
    uint64_t v4 = 0;
    goto LABEL_11;
  }
  HSUtil::Decoder::decodeCodable<HSTPipeline::SensorSize>((int *)&v7, this);
  if (v7)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrame.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactFrameMetadata::Image::decode();
    }
    goto LABEL_10;
  }
  *((void *)this + 1) = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v7);
  if (v7)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrame.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactFrameMetadata::Image::decode();
    }
    goto LABEL_10;
  }
  uint64_t v4 = 1;
LABEL_11:
  if ((void)v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v9);
  }
  long long v5 = (void *)v8;
  *(void *)&long long v8 = 0;
  if (v5)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v5);
    operator delete();
  }
  return v4;
}

void sub_EF4B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

int *HSUtil::Decoder::decodeCodable<HSTPipeline::SensorSize>(int *result, HSTPipeline::SensorSize *a2)
{
  if (*result <= 4)
  {
    BOOL v2 = result;
    unint64_t v3 = *((void *)result + 9);
    uint64_t result = (int *)HSUtil::Decoder::_readCodable<HSTPipeline::SensorSize>((uint64_t)result, &v3, a2);
    if (!*v2) {
      *((void *)v2 + 9) = v3;
    }
  }
  return result;
}

uint64_t HSTContactFrameMetadata::Tritium3::encode(HSTContactFrameMetadata::Tritium3 *this, HSUtil::Encoder *a2)
{
  if (!*(_DWORD *)a2)
  {
    HSUtil::Encoder::_encodeArrayStart(a2, 1u);
    if (!*(_DWORD *)a2)
    {
      HSUtil::Encoder::_encodeUInt(a2, *(unsigned __int8 *)this);
      if (!*(_DWORD *)a2)
      {
        HSUtil::Encoder::_encodeUInt(a2, *((unsigned __int8 *)this + 1));
        if (!*(_DWORD *)a2)
        {
          HSUtil::Encoder::_encodeUInt(a2, *((unsigned int *)this + 1));
          if (!*(_DWORD *)a2) {
            HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a2);
          }
        }
      }
    }
  }
  return 1;
}

uint64_t HSTContactFrameMetadata::Tritium3::decode(HSTContactFrameMetadata::Tritium3 *this, HSUtil::Decoder *a2)
{
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v10 = v3;
  long long v11 = v3;
  long long v8 = v3;
  long long v9 = v3;
  long long v7 = v3;
  HSUtil::Decoder::decodeArray(a2, (uint64_t)&v7);
  if (v7)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrame.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactFrameMetadata::Tritium3::decode();
    }
LABEL_13:
    uint64_t v4 = 0;
    goto LABEL_14;
  }
  *(unsigned char *)this = *(unsigned char *)HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v7);
  if (v7)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrame.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactFrameMetadata::Tritium3::decode();
    }
    goto LABEL_13;
  }
  *((unsigned char *)this + 1) = *(unsigned char *)HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v7);
  if (v7)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrame.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactFrameMetadata::Tritium3::decode();
    }
    goto LABEL_13;
  }
  *((_DWORD *)this + 1) = *(unsigned __int8 *)HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v7);
  if (v7)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrame.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactFrameMetadata::Tritium3::decode();
    }
    goto LABEL_13;
  }
  uint64_t v4 = 1;
LABEL_14:
  if ((void)v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v9);
  }
  long long v5 = (void *)v8;
  *(void *)&long long v8 = 0;
  if (v5)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v5);
    operator delete();
  }
  return v4;
}

void sub_EF7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t HSTContactFrameMetadata::encode(HSTContactFrameMetadata *this, HSUtil::Encoder *a2)
{
  if (!*(_DWORD *)a2) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a2, 1);
  }
  if (this->surfaceSize.__engaged_) {
    HSUtil::Encoder::encodeCodable<HSTPipeline::Position const>(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)117,(char)114,(char)102,(char)97,(char)99,(char)101,(char)83,(char)105,(char)122,(char)101>::Key, (HSTPipeline::Position *)this);
  }
  if (this->image.__engaged_) {
    HSUtil::Encoder::encodeCodable<HSTContactFrameMetadata::Image const>(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)105,(char)109,(char)97,(char)103,(char)101>::Key, (HSTContactFrameMetadata::Image *)&this->image);
  }
  if (LOBYTE(this->tritium.var0.__val_.initialToCurrentFrameDeltaMs)) {
    HSUtil::Encoder::encodeCodable<HSTContactFrameMetadata::Tritium3 const>(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)114,(char)105,(char)116,(char)105,(char)117,(char)109>::Key, (HSTContactFrameMetadata::Tritium3 *)&this->tritium);
  }
  if (this->buttonState.var0.__null_state_) {
    HSUtil::Encoder::encodeUInt(a2, (const CoderKey *)HSUtil::CoderKey::Literal<(char)98,(char)117,(char)116,(char)116,(char)111,(char)110,(char)83,(char)116,(char)97,(char)116,(char)101>::Key, *(unsigned int *)&this->tritium.__engaged_);
  }
  if (!*(_DWORD *)a2) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a2);
  }
  return 1;
}

HSUtil::Encoder *HSUtil::Encoder::encodeCodable<HSTContactFrameMetadata::Image const>(HSUtil::Encoder *result, const CoderKey *a2, HSTContactFrameMetadata::Image *a3)
{
  if (!*(_DWORD *)result)
  {
    uint64_t v4 = result;
    uint64_t result = (HSUtil::Encoder *)HSUtil::Encoder::_encodeKey(result, a2);
    if (!*(_DWORD *)v4)
    {
      return (HSUtil::Encoder *)HSTContactFrameMetadata::Image::encode(a3, v4);
    }
  }
  return result;
}

HSUtil::Encoder *HSUtil::Encoder::encodeCodable<HSTContactFrameMetadata::Tritium3 const>(HSUtil::Encoder *result, const CoderKey *a2, HSTContactFrameMetadata::Tritium3 *a3)
{
  if (!*(_DWORD *)result)
  {
    uint64_t v4 = result;
    uint64_t result = (HSUtil::Encoder *)HSUtil::Encoder::_encodeKey(result, a2);
    if (!*(_DWORD *)v4)
    {
      return (HSUtil::Encoder *)HSTContactFrameMetadata::Tritium3::encode(a3, v4);
    }
  }
  return result;
}

uint64_t HSTContactFrameMetadata::decode(HSTContactFrameMetadata *this, HSUtil::Decoder *a2)
{
  this->surfaceSize.var0.__null_state_ = 0;
  this->surfaceSize.__engaged_ = 0;
  this->image.var0.__null_state_ = 0;
  p_image = &this->image;
  this->image.__engaged_ = 0;
  this->tritium.var0.__null_state_ = 0;
  p_tritium = &this->tritium;
  LOBYTE(this->tritium.var0.__val_.initialToCurrentFrameDeltaMs) = 0;
  this->tritium.__engaged_ = 0;
  this->buttonState.var0.__null_state_ = 0;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v13 = v5;
  long long v14 = v5;
  long long v11 = v5;
  long long v12 = v5;
  long long v10 = v5;
  HSUtil::Decoder::decodeMap((unint64_t *)a2, (uint64_t)&v10);
  if (v10)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrame.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactFrameMetadata::decode();
    }
  }
  else
  {
    while (1)
    {
      unint64_t v9 = HSUtil::Decoder::decodeKey((HSUtil::Decoder *)&v10);
      if (v10) {
        break;
      }
      if (v9 == HSUtil::CoderKey::Literal<(char)115,(char)117,(char)114,(char)102,(char)97,(char)99,(char)101,(char)83,(char)105,(char)122,(char)101>::Key)
      {
        this->surfaceSize.var0 = 0;
        this->surfaceSize.__engaged_ = 1;
        HSUtil::Decoder::decodeCodable<HSTPipeline::SurfaceSize>((int *)&v10, (HSTPipeline::SurfaceSize *)this);
      }
      else if (v9 == HSUtil::CoderKey::Literal<(char)105,(char)109,(char)97,(char)103,(char)101>::Key)
      {
        *(void *)&p_image->var0.__null_state_ = 0;
        p_image->var0.__val_.dataOffset = 0;
        this->image.__engaged_ = 1;
        HSUtil::Decoder::decodeCodable<HSTContactFrameMetadata::Image>((int *)&v10, (HSTContactFrameMetadata::Image *)p_image);
      }
      else if (v9 == HSUtil::CoderKey::Literal<(char)119,(char)97,(char)107,(char)101,(char)73,(char)110,(char)102,(char)111>::Key)
      {
        *(void *)&this->tritium.var0.__null_state_ = 0;
        LOBYTE(this->tritium.var0.__val_.initialToCurrentFrameDeltaMs) = 1;
        HSUtil::Decoder::decodeCodable<HSTContactFrameMetadata::Tritium3>((int *)&v10, (HSTContactFrameMetadata::Tritium3 *)p_tritium);
      }
      else
      {
        if (v9 != HSUtil::CoderKey::Literal<(char)98,(char)117,(char)116,(char)116,(char)111,(char)110,(char)83,(char)116,(char)97,(char)116,(char)101>::Key) {
          goto LABEL_4;
        }
        *(_DWORD *)&this->tritium.__engaged_ = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v10);
      }
      if (v10)
      {
        memset(__b, 170, sizeof(__b));
        basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrame.mm", __b);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          HSTContactFrameMetadata::decode();
        }
        goto LABEL_4;
      }
    }
    if (v10 == 3)
    {
      uint64_t v6 = 1;
      goto LABEL_5;
    }
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrame.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTContactFrameMetadata::decode();
    }
  }
LABEL_4:
  uint64_t v6 = 0;
LABEL_5:
  if ((void)v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12);
  }
  long long v7 = (void *)v11;
  *(void *)&long long v11 = 0;
  if (v7)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v7);
    operator delete();
  }
  return v6;
}

void sub_EFBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

int *HSUtil::Decoder::decodeCodable<HSTPipeline::SurfaceSize>(int *result, HSTPipeline::SurfaceSize *a2)
{
  if (*result <= 4)
  {
    BOOL v2 = result;
    unint64_t v3 = *((void *)result + 9);
    uint64_t result = (int *)HSUtil::Decoder::_readCodable<HSTPipeline::SurfaceSize>((uint64_t)result, &v3, a2);
    if (!*v2) {
      *((void *)v2 + 9) = v3;
    }
  }
  return result;
}

int *HSUtil::Decoder::decodeCodable<HSTContactFrameMetadata::Image>(int *result, HSTContactFrameMetadata::Image *a2)
{
  if (*result <= 4)
  {
    BOOL v2 = result;
    unint64_t v3 = *((void *)result + 9);
    uint64_t result = (int *)HSUtil::Decoder::_readCodable<HSTContactFrameMetadata::Image>((uint64_t)result, &v3, a2);
    if (!*v2) {
      *((void *)v2 + 9) = v3;
    }
  }
  return result;
}

int *HSUtil::Decoder::decodeCodable<HSTContactFrameMetadata::Tritium3>(int *result, HSTContactFrameMetadata::Tritium3 *a2)
{
  if (*result <= 4)
  {
    BOOL v2 = result;
    unint64_t v3 = *((void *)result + 9);
    uint64_t result = (int *)HSUtil::Decoder::_readCodable<HSTContactFrameMetadata::Tritium3>((uint64_t)result, &v3, a2);
    if (!*v2) {
      *((void *)v2 + 9) = v3;
    }
  }
  return result;
}

void sub_EFD80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void HSUtil::Encoder::encodeNSData(HSUtil::Encoder *this, const CoderKey *a2, NSData *a3)
{
  long long v5 = a3;
  if (!*(_DWORD *)this) {
    HSUtil::Encoder::_encodeKey(this, a2);
  }
  HSUtil::Encoder::encodeNSData(this, v5);
}

void sub_EFE50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id HSUtil::Decoder::decodeNSData(HSUtil::Decoder *this, const CoderKey *a2)
{
  if (*(int *)this > 4
    || (unint64_t v7 = *((void *)this + 9), HSUtil::Decoder::_findKey((const CoderKey *)this, &v7, a2), *(_DWORD *)this))
  {
    id v3 = 0;
  }
  else
  {
    long long v5 = HSUtil::Decoder::_readNSData(this, &v7);
    uint64_t v6 = v5;
    if (*(_DWORD *)this == 3)
    {
      id v3 = 0;
      *(_DWORD *)this = 13;
    }
    else
    {
      *((void *)this + 9) = v7;
      id v3 = v5;
    }
  }

  return v3;
}

void sub_F01C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_F0274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<HSTPipeline::Contact>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 6)
  {
    if (a2 >> 58) {
      std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HSTPipeline::Contact>>(v3, a2);
    unint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFC0];
    unint64_t v9 = &v6[64 * v8];
    long long v11 = (char *)*a1;
    long long v10 = (char *)a1[1];
    long long v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *((_OWORD *)v10 - 4);
        long long v14 = *((_OWORD *)v10 - 3);
        long long v15 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v15;
        *((_OWORD *)v12 - 4) = v13;
        *((_OWORD *)v12 - 3) = v14;
        v12 -= 64;
        v10 -= 64;
      }
      while (v10 != v11);
      long long v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_F043C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F0B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  HSUtil::Decoder::~Decoder((HSUtil::Decoder *)va);
  _Unwind_Resume(a1);
}

int *HSUtil::Decoder::decodeCodable<HSTContactFrameMetadata>(int *result, HSTContactFrameMetadata *a2)
{
  if (*result <= 4)
  {
    BOOL v2 = result;
    unint64_t v3 = *((void *)result + 9);
    uint64_t result = (int *)HSUtil::Decoder::_readCodable<HSTContactFrameMetadata>((uint64_t)result, &v3, a2);
    if (!*v2) {
      *((void *)v2 + 9) = v3;
    }
  }
  return result;
}

HSUtil::Encoder *HSUtil::Encoder::encodeCodable<HSTPipeline::Relative3DDelta>(HSUtil::Encoder *result, const CoderKey *a2, HSTPipeline::Relative3DDelta *a3)
{
  if (!*(_DWORD *)result)
  {
    uint64_t v4 = result;
    uint64_t result = (HSUtil::Encoder *)HSUtil::Encoder::_encodeKey(result, a2);
    if (!*(_DWORD *)v4)
    {
      uint64_t result = (HSUtil::Encoder *)HSTPipeline::Relative3DDelta::encode(a3, v4);
      if (!*(_DWORD *)v4 && (result & 1) == 0) {
        *(_DWORD *)uint64_t v4 = 10;
      }
    }
  }
  return result;
}

const CoderKey *HSUtil::Decoder::decodeCodable<HSTPipeline::Relative3DDelta>(const CoderKey *result, CoderKey *a2, HSTPipeline::Relative3DDelta *a3)
{
  if (SLODWORD(result->var0) <= 4)
  {
    uint64_t v4 = (uint64_t)result;
    unint64_t v5 = *(void *)&result[4].var1;
    uint64_t result = HSUtil::Decoder::_findKey(result, &v5, a2);
    if (!*(_DWORD *)v4)
    {
      uint64_t result = (const CoderKey *)HSUtil::Decoder::_readCodable<HSTPipeline::Relative3DDelta>(v4, &v5, a3);
      if (*(_DWORD *)v4 == 3) {
        *(_DWORD *)uint64_t v4 = 13;
      }
      else {
        *(void *)(v4 + 72) = v5;
      }
    }
  }
  return result;
}

void *HSUtil::Decoder::_readCodable<HSTContactFrameMetadata::Image>(uint64_t a1, unint64_t *a2, HSTContactFrameMetadata::Image *a3)
{
  unint64_t v6 = *a2;
  uint64_t result = (void *)HSUtil::Decoder::_skipElement((HSUtil::Decoder *)a1, a2);
  if (!*(_DWORD *)a1)
  {
    uint64_t v8 = result;
    uint64_t result = HSUtil::Decoder::_loadKeyTableIfNeeded((HSUtil::Decoder *)a1, a2);
    if (!*(_DWORD *)a1)
    {
      v11[1] = *(void *)(a1 + 8);
      v11[0] = 0xAAAAAAAA00000000;
      uint64_t v10 = *(void *)(a1 + 24);
      unint64_t v9 = *(std::__shared_weak_count **)(a1 + 32);
      long long v12 = 0;
      uint64_t v13 = v10;
      long long v14 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v15 = *(_OWORD *)(a1 + 40);
      unint64_t v16 = *(void *)(a1 + 56) + v6;
      float v17 = v8;
      uint64_t v18 = 0;
      if ((HSTContactFrameMetadata::Image::decode(a3, (HSUtil::Decoder *)v11) & 1) == 0) {
        *(_DWORD *)a1 = 10;
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      uint64_t result = v12;
      long long v12 = 0;
      if (result)
      {
        std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](result);
        operator delete();
      }
    }
  }
  return result;
}

void sub_F11CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *HSUtil::Decoder::_readCodable<HSTContactFrameMetadata::Tritium3>(uint64_t a1, unint64_t *a2, HSTContactFrameMetadata::Tritium3 *a3)
{
  unint64_t v6 = *a2;
  uint64_t result = (void *)HSUtil::Decoder::_skipElement((HSUtil::Decoder *)a1, a2);
  if (!*(_DWORD *)a1)
  {
    uint64_t v8 = result;
    uint64_t result = HSUtil::Decoder::_loadKeyTableIfNeeded((HSUtil::Decoder *)a1, a2);
    if (!*(_DWORD *)a1)
    {
      v11[1] = *(void *)(a1 + 8);
      v11[0] = 0xAAAAAAAA00000000;
      uint64_t v10 = *(void *)(a1 + 24);
      unint64_t v9 = *(std::__shared_weak_count **)(a1 + 32);
      long long v12 = 0;
      uint64_t v13 = v10;
      long long v14 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v15 = *(_OWORD *)(a1 + 40);
      unint64_t v16 = *(void *)(a1 + 56) + v6;
      float v17 = v8;
      uint64_t v18 = 0;
      if ((HSTContactFrameMetadata::Tritium3::decode(a3, (HSUtil::Decoder *)v11) & 1) == 0) {
        *(_DWORD *)a1 = 10;
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      uint64_t result = v12;
      long long v12 = 0;
      if (result)
      {
        std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](result);
        operator delete();
      }
    }
  }
  return result;
}

void sub_F12D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *HSUtil::Decoder::_readCodable<HSTPipeline::Relative3DDelta>(uint64_t a1, unint64_t *a2, HSTPipeline::Relative3DDelta *a3)
{
  unint64_t v6 = *a2;
  uint64_t result = (void *)HSUtil::Decoder::_skipElement((HSUtil::Decoder *)a1, a2);
  if (!*(_DWORD *)a1)
  {
    uint64_t v8 = result;
    uint64_t result = HSUtil::Decoder::_loadKeyTableIfNeeded((HSUtil::Decoder *)a1, a2);
    if (!*(_DWORD *)a1)
    {
      v11[1] = *(void *)(a1 + 8);
      v11[0] = 0xAAAAAAAA00000000;
      uint64_t v10 = *(void *)(a1 + 24);
      unint64_t v9 = *(std::__shared_weak_count **)(a1 + 32);
      long long v12 = 0;
      uint64_t v13 = v10;
      long long v14 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v15 = *(_OWORD *)(a1 + 40);
      unint64_t v16 = *(void *)(a1 + 56) + v6;
      float v17 = v8;
      uint64_t v18 = 0;
      if ((HSTPipeline::Relative3DDelta::decode(a3, (HSUtil::Decoder *)v11) & 1) == 0) {
        *(_DWORD *)a1 = 10;
      }
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      uint64_t result = v12;
      long long v12 = 0;
      if (result)
      {
        std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](result);
        operator delete();
      }
    }
  }
  return result;
}

void sub_F13DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void __cxx_global_var_init_79()
{
  {
    HSUtil::Coder::_ObjectType = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"com.apple.hid.HSCoder.ObjectType", v0);
  }
}

void __cxx_global_var_init_2_73(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)121,(char)112,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"type", a2);
  }
}

void __cxx_global_var_init_3_72(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"timestamp", a2);
  }
}

void __cxx_global_var_init_4_67(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)110,(char)105,(char)120,(char)84,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"unixTimestamp", a2);
  }
}

void __cxx_global_var_init_5_67(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)118,(char)101,(char)114,(char)115,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"version", a2);
  }
}

void __cxx_global_var_init_6_67(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)116,(char)99,(char)79,(char)102,(char)102,(char)115,(char)101,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"utcOffset", a2);
  }
}

void __cxx_global_var_init_7_67(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)116,(char)97,(char)116,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"state", a2);
  }
}

void __cxx_global_var_init_8_68(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)100,(char)97,(char)116,(char)97>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"data", a2);
  }
}

void __cxx_global_var_init_11_22(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)117,(char)114,(char)102,(char)97,(char)99,(char)101,(char)83,(char)105,(char)122,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"surfaceSize", a2);
  }
}

void __cxx_global_var_init_12_22(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)105,(char)109,(char)97,(char)103,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"image", a2);
  }
}

void __cxx_global_var_init_13_22(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)114,(char)105,(char)116,(char)105,(char)117,(char)109>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"tritium", a2);
  }
}

void __cxx_global_var_init_14_22(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)98,(char)117,(char)116,(char)116,(char)111,(char)110,(char)83,(char)116,(char)97,(char)116,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"buttonState", a2);
  }
}

void __cxx_global_var_init_15_38(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)119,(char)97,(char)107,(char)101,(char)73,(char)110,(char)102,(char)111>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"wakeInfo", a2);
  }
}

void __cxx_global_var_init_17_37(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)70,(char)114,(char)97,(char)109,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTFrame", a2);
  }
}

void __cxx_global_var_init_82_0(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)67,(char)111,(char)110,(char)116,(char)97,(char)99,(char)116,(char)70,(char)114,(char)97,(char)109,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSTContactFrame", a2);
  }
}

void __cxx_global_var_init_83_0(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)102,(char)114,(char)97,(char)109,(char)101,(char)78,(char)117,(char)109,(char)98,(char)101,(char)114>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"frameNumber", a2);
  }
}

void __cxx_global_var_init_84_0(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)102,(char)105,(char)114,(char)109,(char)119,(char)97,(char)114,(char)101,(char)84,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"firmwareTimestamp", a2);
  }
}

void __cxx_global_var_init_85_0(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)105,(char)110,(char)112,(char)117,(char)116,(char)68,(char)101,(char)116,(char)101,(char)99,(char)116,(char)105,(char)111,(char)110,(char)83,(char)116,(char)97,(char)116,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"inputDetectionState", a2);
  }
}

void __cxx_global_var_init_86_1(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)100,(char)101,(char)118,(char)105,(char)99,(char)101,(char)79,(char)112,(char)101,(char)114,(char)97,(char)116,(char)105,(char)110,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"deviceOperatingState", a2);
  }
}

void __cxx_global_var_init_87_1(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)99,(char)111,(char)110,(char)116,(char)97,(char)99,(char)116,(char)115>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"contacts", a2);
  }
}

void __cxx_global_var_init_88_0(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)109,(char)101,(char)116,(char)97,(char)100,(char)97,(char)116,(char)97>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"metadata", a2);
  }
}

void __cxx_global_var_init_119(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)72,(char)83,(char)80,(char)111,(char)105,(char)110,(char)116,(char)101,(char)114,(char)70,(char)114,(char)97,(char)109,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"HSPointerFrame", a2);
  }
}

void __cxx_global_var_init_120(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)114,(char)97,(char)99,(char)107,(char)105,(char)110,(char)103,(char)68,(char)80,(char)73>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"trackingDPI", a2);
  }
}

void __cxx_global_var_init_121(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)98,(char)117,(char)116,(char)116,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"button", a2);
  }
}

void __cxx_global_var_init_122(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)112,(char)111,(char)115,(char)105,(char)116,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"position", a2);
  }
}

void __cxx_global_var_init_123_0(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)99,(char)114,(char)111,(char)108,(char)108,(char)87,(char)104,(char)101,(char)101,(char)108>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"scrollWheel", a2);
  }
}

void sub_F1FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, id *a12, id *a13, id *a14)
{
  objc_destroyWeak(v19);

  objc_destroyWeak(location);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)(v20 - 128));

  _Unwind_Resume(a1);
}

void sub_F2100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_F2174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_F21DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_F2268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_F22E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_F2474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F2658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F2748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F27F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F296C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SABinaryWriter::initHostRequest(SABinaryWriter *this, char a2, size_t __n, const void *__src)
{
  if (__n && !__src || *((unsigned char *)this + 24)) {
    return 0;
  }
  *((void *)this + 2) = 0;
  *((unsigned char *)this + 24) = 4;
  if (*(void *)this)
  {
    if (*((void *)this + 1) <= 1uLL) {
      goto LABEL_14;
    }
    **(_WORD **)this = 1025;
    uint64_t v6 = *((void *)this + 2) + 2;
    uint64_t v7 = *(void *)this;
    *((void *)this + 2) = v6;
    if (!v7) {
      goto LABEL_11;
    }
    if ((unint64_t)(*((void *)this + 1) - v6) < 3)
    {
LABEL_14:
      uint64_t result = 0;
      *((unsigned char *)this + 24) = 0;
      return result;
    }
    uint64_t v8 = v7 + v6;
    *(unsigned char *)uint64_t v8 = a2;
    *(_WORD *)(v8 + 1) = __n;
    uint64_t v6 = *((void *)this + 2);
  }
  else
  {
    uint64_t v6 = 2;
  }
LABEL_11:
  uint64_t v9 = v6 + 3;
  *((void *)this + 2) = v9;
  if (__n)
  {
    uint64_t v10 = __n;
    if (*(void *)this)
    {
      if (*((void *)this + 1) - v9 < (unint64_t)__n) {
        goto LABEL_14;
      }
      memcpy((void *)(*(void *)this + v9), __src, __n);
      uint64_t v9 = *((void *)this + 2);
    }
    *((void *)this + 2) = v9 + v10;
  }
  return 1;
}

void sub_F2BB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unsigned char *HSTFrameParserTypes::ReportCast<HSTPipeline::FirmwareInterface::InputReport::SABinaryFrame>(void *a1)
{
  id v1 = a1;
  BOOL v2 = [v1 bytes];
  if ([v1 length])
  {
    if (*v2 != 90) {
      BOOL v2 = 0;
    }
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

void sub_F2C38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F2CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_F2E78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void __cxx_global_var_init_80()
{
  {
    HSUtil::Coder::_ObjectType = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"com.apple.hid.HSCoder.ObjectType", v0);
  }
}

void __cxx_global_var_init_2_74(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)121,(char)112,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"type", a2);
  }
}

void __cxx_global_var_init_3_73(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"timestamp", a2);
  }
}

void __cxx_global_var_init_4_68(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)110,(char)105,(char)120,(char)84,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"unixTimestamp", a2);
  }
}

void __cxx_global_var_init_5_68(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)118,(char)101,(char)114,(char)115,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"version", a2);
  }
}

void __cxx_global_var_init_6_68(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)116,(char)99,(char)79,(char)102,(char)102,(char)115,(char)101,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"utcOffset", a2);
  }
}

void __cxx_global_var_init_7_68(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)116,(char)97,(char)116,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"state", a2);
  }
}

void __cxx_global_var_init_8_69(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)100,(char)97,(char)116,(char)97>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"data", a2);
  }
}

void __cxx_global_var_init_15_39(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)109,(char)97,(char)120,(char)80,(char)97,(char)99,(char)107,(char)101,(char)116,(char)83,(char)105,(char)122,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"maxPacketSize", a2);
  }
}

void sub_F3478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  HSUtil::ObjectLock::~ObjectLock(&a9);

  _Unwind_Resume(a1);
}

void sub_F35F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  HSUtil::File::~File((HSUtil::File *)&a9);

  _Unwind_Resume(a1);
}

void sub_F394C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F3AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  HSUtil::ObjectLock::~ObjectLock(&a9);

  _Unwind_Resume(a1);
}

void sub_F3C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F3D44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F3ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  HSUtil::ObjectLock::~ObjectLock(&a9);
  _Unwind_Resume(a1);
}

id HSProxySynth::HSTRecordingManagerProxy_saveRecording_call1<BOOL>(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 objectAtIndexedSubscript:0];
  unint64_t v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 saveRecording:v4]);

  return v5;
}

void sub_F3FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F40CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

HSUtil::File *HSUtil::File::File(HSUtil::File *this, const char *a2, unsigned int a3)
{
  *(void *)this = &off_1414D0;
  *((void *)this + 1) = &off_141500;
  *((void *)this + 2) = &off_141448;
  *((void *)this + 3) = &off_141478;
  *((_DWORD *)this + 8) = -1;
  *((void *)this + 5) = 0;
  *((unsigned char *)this + 48) = 1;
  int v4 = open(a2, 1538, a3);
  if (v4 < 0)
  {
    *((unsigned char *)this + 48) = 0;
  }
  else
  {
    v6[0] = &off_141448;
    v6[1] = &off_141478;
    int v7 = v4;
    HSUtil::File::_init((uint64_t)this, (uint64_t)v6);
    HSUtil::FileDescriptor::~FileDescriptor((HSUtil::FileDescriptor *)v6);
  }
  return this;
}

void sub_F4230(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  HSUtil::FileDescriptor::~FileDescriptor((HSUtil::FileDescriptor *)va);
  HSUtil::FileDescriptor::~FileDescriptor(v2);
  _Unwind_Resume(a1);
}

void __cxx_global_var_init_81()
{
  {
    HSUtil::Coder::_ObjectType = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"com.apple.hid.HSCoder.ObjectType", v0);
  }
}

void __cxx_global_var_init_8_70(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)121,(char)112,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"type", a2);
  }
}

void __cxx_global_var_init_9_30(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"timestamp", a2);
  }
}

void __cxx_global_var_init_10_28(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)110,(char)105,(char)120,(char)84,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"unixTimestamp", a2);
  }
}

void __cxx_global_var_init_11_23(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)118,(char)101,(char)114,(char)115,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"version", a2);
  }
}

void __cxx_global_var_init_12_23(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)116,(char)99,(char)79,(char)102,(char)102,(char)115,(char)101,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"utcOffset", a2);
  }
}

void __cxx_global_var_init_13_23(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)116,(char)97,(char)116,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"state", a2);
  }
}

void __cxx_global_var_init_14_23(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)100,(char)97,(char)116,(char)97>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"data", a2);
  }
}

uint64_t HSTPipeline::Position::encode(HSTPipeline::Position *this, HSUtil::Encoder *a2)
{
  if (!*(_DWORD *)a2)
  {
    HSUtil::Encoder::_encodeArrayStart(a2, 1u);
    if (!*(_DWORD *)a2)
    {
      HSUtil::Encoder::_encodeInt(a2, *(int *)this);
      if (!*(_DWORD *)a2)
      {
        HSUtil::Encoder::_encodeInt(a2, *((int *)this + 1));
        if (!*(_DWORD *)a2) {
          HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a2);
        }
      }
    }
  }
  return 1;
}

uint64_t HSTPipeline::Position::decode(HSTPipeline::Position *this, HSUtil::Decoder *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v11 = v4;
  long long v12 = v4;
  long long v9 = v4;
  long long v10 = v4;
  long long v8 = v4;
  HSUtil::Decoder::decodeArray(a2, (uint64_t)&v8);
  if (*(_DWORD *)a2)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::Position::decode();
    }
LABEL_10:
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  *(_DWORD *)this = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)&v8);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::Position::decode();
    }
    goto LABEL_10;
  }
  *((_DWORD *)this + 1) = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)&v8);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::Position::decode();
    }
    goto LABEL_10;
  }
  uint64_t v5 = 1;
LABEL_11:
  if ((void)v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
  }
  uint64_t v6 = (void *)v9;
  *(void *)&long long v9 = 0;
  if (v6)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v6);
    operator delete();
  }
  return v5;
}

void sub_F4688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t HSUtil::Decoder::decodeInt(HSUtil::Decoder *this)
{
  if (*(int *)this > 4) {
    return 0;
  }
  unint64_t v3 = *((void *)this + 9);
  uint64_t result = HSUtil::Decoder::_readInt(this, &v3);
  if (*(_DWORD *)this) {
    return 0;
  }
  *((void *)this + 9) = v3;
  return result;
}

uint64_t HSTPipeline::Velocity::decode(HSTPipeline::Velocity *this, HSUtil::Decoder *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v11 = v4;
  long long v12 = v4;
  long long v9 = v4;
  long long v10 = v4;
  long long v8 = v4;
  HSUtil::Decoder::decodeArray(a2, (uint64_t)&v8);
  if (*(_DWORD *)a2)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::Velocity::decode();
    }
LABEL_10:
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  *(_DWORD *)this = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)&v8);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::Velocity::decode();
    }
    goto LABEL_10;
  }
  *((_DWORD *)this + 1) = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)&v8);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::Velocity::decode();
    }
    goto LABEL_10;
  }
  uint64_t v5 = 1;
LABEL_11:
  if ((void)v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
  }
  uint64_t v6 = (void *)v9;
  *(void *)&long long v9 = 0;
  if (v6)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v6);
    operator delete();
  }
  return v5;
}

void sub_F48C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t HSTPipeline::SurfaceSize::decode(HSTPipeline::SurfaceSize *this, HSUtil::Decoder *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v11 = v4;
  long long v12 = v4;
  long long v9 = v4;
  long long v10 = v4;
  long long v8 = v4;
  HSUtil::Decoder::decodeArray(a2, (uint64_t)&v8);
  if (*(_DWORD *)a2)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::SurfaceSize::decode();
    }
LABEL_10:
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  *(_DWORD *)this = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)&v8);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::SurfaceSize::decode();
    }
    goto LABEL_10;
  }
  *((_DWORD *)this + 1) = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)&v8);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::SurfaceSize::decode();
    }
    goto LABEL_10;
  }
  uint64_t v5 = 1;
LABEL_11:
  if ((void)v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
  }
  uint64_t v6 = (void *)v9;
  *(void *)&long long v9 = 0;
  if (v6)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v6);
    operator delete();
  }
  return v5;
}

void sub_F4A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t HSTPipeline::SurfaceCoordinates::encode(HSTPipeline::SurfaceCoordinates *this, HSUtil::Encoder *a2)
{
  if (!*(_DWORD *)a2)
  {
    HSUtil::Encoder::_encodeArrayStart(a2, 1u);
    if (!*(_DWORD *)a2)
    {
      HSUtil::Encoder::_encodeInt(a2, *(int *)this);
      if (!*(_DWORD *)a2)
      {
        HSUtil::Encoder::_encodeInt(a2, *((int *)this + 1));
        if (!*(_DWORD *)a2)
        {
          HSUtil::Encoder::_encodeInt(a2, *((int *)this + 2));
          if (!*(_DWORD *)a2)
          {
            HSUtil::Encoder::_encodeInt(a2, *((int *)this + 3));
            if (!*(_DWORD *)a2) {
              HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a2);
            }
          }
        }
      }
    }
  }
  return 1;
}

uint64_t HSTPipeline::SurfaceCoordinates::decode(HSTPipeline::SurfaceCoordinates *this, HSUtil::Decoder *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v11 = v4;
  long long v12 = v4;
  long long v9 = v4;
  long long v10 = v4;
  long long v8 = v4;
  HSUtil::Decoder::decodeArray(a2, (uint64_t)&v8);
  if (*(_DWORD *)a2)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::SurfaceCoordinates::decode();
    }
LABEL_16:
    uint64_t v5 = 0;
    goto LABEL_17;
  }
  *(_DWORD *)this = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)&v8);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::SurfaceCoordinates::decode();
    }
    goto LABEL_16;
  }
  *((_DWORD *)this + 1) = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)&v8);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::SurfaceCoordinates::decode();
    }
    goto LABEL_16;
  }
  *((_DWORD *)this + 2) = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)&v8);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::SurfaceCoordinates::decode();
    }
    goto LABEL_16;
  }
  *((_DWORD *)this + 3) = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)&v8);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::SurfaceCoordinates::decode();
    }
    goto LABEL_16;
  }
  uint64_t v5 = 1;
LABEL_17:
  if ((void)v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
  }
  uint64_t v6 = (void *)v9;
  *(void *)&long long v9 = 0;
  if (v6)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v6);
    operator delete();
  }
  return v5;
}

void sub_F4DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t HSTPipeline::SensorSize::encode(HSTPipeline::SensorSize *this, HSUtil::Encoder *a2)
{
  if (!*(_DWORD *)a2)
  {
    HSUtil::Encoder::_encodeArrayStart(a2, 1u);
    if (!*(_DWORD *)a2)
    {
      HSUtil::Encoder::_encodeUInt(a2, *(unsigned int *)this);
      if (!*(_DWORD *)a2)
      {
        HSUtil::Encoder::_encodeUInt(a2, *((unsigned int *)this + 1));
        if (!*(_DWORD *)a2) {
          HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a2);
        }
      }
    }
  }
  return 1;
}

uint64_t HSTPipeline::SensorSize::decode(HSTPipeline::SensorSize *this, HSUtil::Decoder *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v11 = v4;
  long long v12 = v4;
  long long v9 = v4;
  long long v10 = v4;
  long long v8 = v4;
  HSUtil::Decoder::decodeArray(a2, (uint64_t)&v8);
  if (*(_DWORD *)a2)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::SensorSize::decode();
    }
LABEL_10:
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  *(_DWORD *)this = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v8);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::SensorSize::decode();
    }
    goto LABEL_10;
  }
  *((_DWORD *)this + 1) = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v8);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::SensorSize::decode();
    }
    goto LABEL_10;
  }
  uint64_t v5 = 1;
LABEL_11:
  if ((void)v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
  }
  uint64_t v6 = (void *)v9;
  *(void *)&long long v9 = 0;
  if (v6)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v6);
    operator delete();
  }
  return v5;
}

void sub_F501C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t HSTPipeline::Relative3DDelta::encode(HSTPipeline::Relative3DDelta *this, HSUtil::Encoder *a2)
{
  if (!*(_DWORD *)a2)
  {
    HSUtil::Encoder::_encodeArrayStart(a2, 1u);
    if (!*(_DWORD *)a2)
    {
      HSUtil::Encoder::_encodeInt(a2, *(int *)this);
      if (!*(_DWORD *)a2)
      {
        HSUtil::Encoder::_encodeInt(a2, *((int *)this + 1));
        if (!*(_DWORD *)a2)
        {
          HSUtil::Encoder::_encodeInt(a2, *((int *)this + 2));
          if (!*(_DWORD *)a2) {
            HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a2);
          }
        }
      }
    }
  }
  return 1;
}

uint64_t HSTPipeline::Relative3DDelta::decode(HSTPipeline::Relative3DDelta *this, HSUtil::Decoder *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v11 = v4;
  long long v12 = v4;
  long long v9 = v4;
  long long v10 = v4;
  long long v8 = v4;
  HSUtil::Decoder::decodeArray(a2, (uint64_t)&v8);
  if (*(_DWORD *)a2)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::Relative3DDelta::decode();
    }
LABEL_13:
    uint64_t v5 = 0;
    goto LABEL_14;
  }
  *(_DWORD *)this = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)&v8);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::Relative3DDelta::decode();
    }
    goto LABEL_13;
  }
  *((_DWORD *)this + 1) = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)&v8);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::Relative3DDelta::decode();
    }
    goto LABEL_13;
  }
  *((_DWORD *)this + 2) = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)&v8);
  if (v8)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/Types.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      HSTPipeline::Relative3DDelta::decode();
    }
    goto LABEL_13;
  }
  uint64_t v5 = 1;
LABEL_14:
  if ((void)v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
  }
  uint64_t v6 = (void *)v9;
  *(void *)&long long v9 = 0;
  if (v6)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v6);
    operator delete();
  }
  return v5;
}

void sub_F52D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void __cxx_global_var_init_82()
{
  {
    HSUtil::Coder::_ObjectType = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"com.apple.hid.HSCoder.ObjectType", v0);
  }
}

void __cxx_global_var_init_2_75(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)121,(char)112,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"type", a2);
  }
}

void __cxx_global_var_init_3_74(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)116,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"timestamp", a2);
  }
}

void __cxx_global_var_init_4_69(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)110,(char)105,(char)120,(char)84,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"unixTimestamp", a2);
  }
}

void __cxx_global_var_init_5_69(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)118,(char)101,(char)114,(char)115,(char)105,(char)111,(char)110>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"version", a2);
  }
}

void __cxx_global_var_init_6_69(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)117,(char)116,(char)99,(char)79,(char)102,(char)102,(char)115,(char)101,(char)116>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"utcOffset", a2);
  }
}

void __cxx_global_var_init_7_69(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)115,(char)116,(char)97,(char)116,(char)101>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"state", a2);
  }
}

void __cxx_global_var_init_8_71(uint64_t a1, const char *a2)
{
  {
    HSUtil::CoderKey::Literal<(char)100,(char)97,(char)116,(char)97>::Key = (uint64_t)HSUtil::CoderKey::New((HSUtil::CoderKey *)"data", a2);
  }
}

void HSUtil::Decoder::_loadKeyTable()
{
}

void HSUtil::Buffer::writeLength()
{
  __assert_rtn("writeLength", "HSBuffer.h", 206, "len <= _state.cap");
}

void HSUtil::Buffer::Buffer()
{
}

{
  __assert_rtn("Buffer", "HSBuffer.h", 33, "len <= cap");
}

void HSUtil::Encoder::_encodeContainerStop()
{
}

void HSUtil::Buffer::_releaseData()
{
}

void mt_StandardTrackpadSettings::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void mt_StandardMouseSettings::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void HSTPipeline::CreateSAPipeline(uint64_t a1)
{
  int v1 = 136315906;
  uint64_t v2 = "HSStage *HSTPipeline::CreateSAPipeline(NSString *__strong, __strong dispatch_queue_t, MTDeviceRef, HSStage *__str"
       "ong, NSUInteger)";
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = 109;
  __int16 v7 = 2080;
  long long v8 = "deviceService != IO_OBJECT_NULL";
  _os_log_error_impl(&def_411C8, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", (uint8_t *)&v1, 0x2Au);
}

void HSTPipeline::FirmwareUtil::SetReportWithData(unsigned __int8 *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&def_411C8, log, OS_LOG_TYPE_ERROR, "FirmwareUtil::SetReport 0x%x failed: 0x%x", (uint8_t *)v4, 0xEu);
}

void setReport<HSTPipeline::FirmwareInterface::FeatureReport::HostNotificationControl>()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(v0, v1, v2, 1.5047e-36);
  OUTLINED_FUNCTION_3(&def_411C8, "FirmwareUtil::SetReport (0x%02X) failed: %{public}s", v3, v4);
}

void HSUtil::SendRight::reset()
{
  __assert_rtn("reset", "HSPortRight.h", 134, "kr == KERN_SUCCESS");
}

void HSUtil::SendRight::SendRight()
{
  __assert_rtn("SendRight", "HSPortRight.h", 108, "kr==KERN_SUCCESS || kr==KERN_INVALID_RIGHT");
}

{
  __assert_rtn("SendRight", "HSPortRight.h", 111, "kr == KERN_SUCCESS");
}

{
  __assert_rtn("SendRight", "HSPortRight.h", 123, "kr == KERN_SUCCESS");
}

void HSTPipeline::CreateMousePipeline()
{
  v1[0] = 136315906;
  OUTLINED_FUNCTION_0();
  uint64_t v2 = 56;
  __int16 v3 = v0;
  uint64_t v4 = "deviceService != IO_OBJECT_NULL";
  _os_log_error_impl(&def_411C8, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", (uint8_t *)v1, 0x2Au);
}

{
  __int16 v0;
  int v1[6];
  uint64_t v2;
  __int16 v3;
  const char *v4;

  v1[0] = 136315906;
  OUTLINED_FUNCTION_0();
  uint64_t v2 = 62;
  __int16 v3 = v0;
  uint64_t v4 = "prefsDomain";
  _os_log_error_impl(&def_411C8, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", (uint8_t *)v1, 0x2Au);
}

uint64_t std::shared_ptr<MTSurfaceDimensions_>::shared_ptr[abi:ne180100]<MTSurfaceDimensions_,void>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void HSTPipeline::CreateTrackpadPipeline()
{
  v1[0] = 136315906;
  OUTLINED_FUNCTION_0();
  uint64_t v2 = 115;
  __int16 v3 = v0;
  uint64_t v4 = "deviceService != IO_OBJECT_NULL";
  _os_log_error_impl(&def_411C8, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", (uint8_t *)v1, 0x2Au);
}

{
  __int16 v0;
  int v1[6];
  uint64_t v2;
  __int16 v3;
  const char *v4;

  v1[0] = 136315906;
  OUTLINED_FUNCTION_0();
  uint64_t v2 = 129;
  __int16 v3 = v0;
  uint64_t v4 = "server";
  _os_log_error_impl(&def_411C8, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", (uint8_t *)v1, 0x2Au);
}

void MTGestureConfig_::decodeFromMap()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void MTChordCycling_::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void MTParserPath_::filterContactForScreenUI(uint64_t a1, int *a2, os_log_t log)
{
  int v3 = *(_DWORD *)(a1 + 32);
  int v4 = *a2;
  int v5 = *(_DWORD *)(a1 + 136);
  v6[0] = 67109632;
  v6[1] = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  __int16 v9 = 1024;
  int v10 = v5;
  _os_log_debug_impl(&def_411C8, log, OS_LOG_TYPE_DEBUG, "\tDHML:  P%d Identity=%d <- %d (ignoring motion)", (uint8_t *)v6, 0x14u);
}

void MTParserPath_::filterContactForScreenUI(uint64_t a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a3;
  *((_WORD *)buf + 4) = 2080;
  *(void *)(buf + 10) = a1;
  _os_log_debug_impl(&def_411C8, log, OS_LOG_TYPE_DEBUG, "\tDHML:  P%d Hover (stage %s -- ignoring motion)", buf, 0x12u);
}

void MTPathStates_::decodeFromMap()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void MTTimeState_::decodeFromMap()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void MTHandMotion_::clearHandMotion(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&def_411C8, a2, OS_LOG_TYPE_DEBUG, "\tDHML:  MTHandMotion_::resetHandMotion(%d)", (uint8_t *)v2, 8u);
}

void MTHandStatistics_::decodeFromMap()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void MTChordCycling_::decodeFromMap()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void MTForceManagement_::decodeFromMap()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void MTHandStatistics_::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void MTPathStates_::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void MTForceManagement_::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void MTGestureConfig_::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void MTRestZoneIntegrator_::clearMotion(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&def_411C8, a2, OS_LOG_TYPE_DEBUG, "\tDHML:  MTRestZoneIntegrator_::clearMotion(%d)", (uint8_t *)v2, 8u);
}

void MTForceManagement_::actuateForceAndHIDEvents(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&def_411C8, log, OS_LOG_TYPE_DEBUG, "[HID] Skipping actuation - host click not enabled", v1, 2u);
}

void MTForceThresholding_::MTForceThresholding_(void *a1)
{
  uint64_t v2 = (void *)a1[34];
  if (v2)
  {
    a1[35] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[31];
  if (v3)
  {
    a1[32] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)a1[28];
  if (v4)
  {
    a1[29] = v4;
    operator delete(v4);
  }
  int v5 = (void *)a1[25];
  if (v5)
  {
    a1[26] = v5;
    operator delete(v5);
  }
}

void HSTPipeline::Contact::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void HSTContactStabilizerConfig::FloatRange::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void HSTContactStabilizerConfig::FloatRangeGain::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void HSTContactStabilizerConfig::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void StatContact::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void InstabilityFilter::_timeInRange()
{
}

void ContactStabilizer::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void InstabilityFilter::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void InstabilityFilter::StabilizerContact::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void HSTHIDEventGeneratorConfig::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void HSTContactFrameMetadata::Image::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void HSTContactFrameMetadata::Tritium3::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void HSTContactFrameMetadata::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void HSTPipeline::Position::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void HSTPipeline::Velocity::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void HSTPipeline::SurfaceSize::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void HSTPipeline::SurfaceCoordinates::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void HSTPipeline::SensorSize::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void HSTPipeline::Relative3DDelta::decode()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return _CFAutorelease(arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return _CFGetRetainCount(cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return _CFNumberIsFloatType(number);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFShow(CFTypeRef obj)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFRange v5 = _CFStringFind(theString, stringToFind, compareOptions);
  CFIndex length = v5.length;
  CFIndex location = v5.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return _CFUUIDCreateFromUUIDBytes(alloc, bytes);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return _IOCFSerialize(object, options);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return _IODeregisterForSystemPower(notifier);
}

uint64_t IOHIDEventAppendEvent()
{
  return _IOHIDEventAppendEvent();
}

uint64_t IOHIDEventCreateBoundaryScrollEvent()
{
  return _IOHIDEventCreateBoundaryScrollEvent();
}

uint64_t IOHIDEventCreateButtonEvent()
{
  return _IOHIDEventCreateButtonEvent();
}

uint64_t IOHIDEventCreateData()
{
  return _IOHIDEventCreateData();
}

uint64_t IOHIDEventCreateDigitizerEvent()
{
  return _IOHIDEventCreateDigitizerEvent();
}

uint64_t IOHIDEventCreateDigitizerFingerEventWithQuality()
{
  return _IOHIDEventCreateDigitizerFingerEventWithQuality();
}

uint64_t IOHIDEventCreateDockSwipeEvent()
{
  return _IOHIDEventCreateDockSwipeEvent();
}

uint64_t IOHIDEventCreateFluidTouchGestureEvent()
{
  return _IOHIDEventCreateFluidTouchGestureEvent();
}

uint64_t IOHIDEventCreateForceStageEvent()
{
  return _IOHIDEventCreateForceStageEvent();
}

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return _IOHIDEventCreateKeyboardEvent();
}

uint64_t IOHIDEventCreateMotionGestureEvent()
{
  return _IOHIDEventCreateMotionGestureEvent();
}

uint64_t IOHIDEventCreateMouseEvent()
{
  return _IOHIDEventCreateMouseEvent();
}

uint64_t IOHIDEventCreateNavigationSwipeEvent()
{
  return _IOHIDEventCreateNavigationSwipeEvent();
}

uint64_t IOHIDEventCreateProximtyEvent()
{
  return _IOHIDEventCreateProximtyEvent();
}

uint64_t IOHIDEventCreateRelativePointerEvent()
{
  return _IOHIDEventCreateRelativePointerEvent();
}

uint64_t IOHIDEventCreateRotationEvent()
{
  return _IOHIDEventCreateRotationEvent();
}

uint64_t IOHIDEventCreateScaleEvent()
{
  return _IOHIDEventCreateScaleEvent();
}

uint64_t IOHIDEventCreateScrollEvent()
{
  return _IOHIDEventCreateScrollEvent();
}

uint64_t IOHIDEventCreateSwipeEvent()
{
  return _IOHIDEventCreateSwipeEvent();
}

uint64_t IOHIDEventCreateSymbolicHotKeyEvent()
{
  return _IOHIDEventCreateSymbolicHotKeyEvent();
}

uint64_t IOHIDEventCreateTranslationEvent()
{
  return _IOHIDEventCreateTranslationEvent();
}

uint64_t IOHIDEventCreateVelocityEvent()
{
  return _IOHIDEventCreateVelocityEvent();
}

uint64_t IOHIDEventCreateVendorDefinedEvent()
{
  return _IOHIDEventCreateVendorDefinedEvent();
}

uint64_t IOHIDEventCreateWithBytes()
{
  return _IOHIDEventCreateWithBytes();
}

uint64_t IOHIDEventCreateZoomToggleEvent()
{
  return _IOHIDEventCreateZoomToggleEvent();
}

uint64_t IOHIDEventGetChildren()
{
  return _IOHIDEventGetChildren();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return _IOHIDEventGetIntegerValue();
}

uint64_t IOHIDEventGetPhase()
{
  return _IOHIDEventGetPhase();
}

uint64_t IOHIDEventGetScrollMomentum()
{
  return _IOHIDEventGetScrollMomentum();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return _IOHIDEventGetTimeStamp();
}

uint64_t IOHIDEventGetType()
{
  return _IOHIDEventGetType();
}

uint64_t IOHIDEventGetTypeString()
{
  return _IOHIDEventGetTypeString();
}

uint64_t IOHIDEventSetFloatValue()
{
  return _IOHIDEventSetFloatValue();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return _IOHIDEventSetIntegerValue();
}

uint64_t IOHIDEventSetPhase()
{
  return _IOHIDEventSetPhase();
}

uint64_t IOHIDEventSetScrollMomentum()
{
  return _IOHIDEventSetScrollMomentum();
}

uint64_t IOHIDEventSetTimeStamp()
{
  return _IOHIDEventSetTimeStamp();
}

uint64_t IOHIDPreferencesCopy()
{
  return _IOHIDPreferencesCopy();
}

uint64_t IOHIDPreferencesCopyDomain()
{
  return _IOHIDPreferencesCopyDomain();
}

uint64_t IOHIDPreferencesSet()
{
  return _IOHIDPreferencesSet();
}

uint64_t IOHIDPreferencesSynchronize()
{
  return _IOHIDPreferencesSynchronize();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MTAbsoluteTimeGetCurrent()
{
  return _MTAbsoluteTimeGetCurrent();
}

uint64_t MTActuatorActuate()
{
  return _MTActuatorActuate();
}

uint64_t MTActuatorClose()
{
  return _MTActuatorClose();
}

uint64_t MTActuatorGetService()
{
  return _MTActuatorGetService();
}

uint64_t MTActuatorGetSystemActuationsEnabled()
{
  return _MTActuatorGetSystemActuationsEnabled();
}

uint64_t MTActuatorHandoffHostClickControl()
{
  return _MTActuatorHandoffHostClickControl();
}

uint64_t MTActuatorLoadActuations()
{
  return _MTActuatorLoadActuations();
}

uint64_t MTActuatorOpen()
{
  return _MTActuatorOpen();
}

uint64_t MTActuatorReclaimHostClickControl()
{
  return _MTActuatorReclaimHostClickControl();
}

uint64_t MTActuatorSetFirmwareClicks()
{
  return _MTActuatorSetFirmwareClicks();
}

uint64_t MTContact_getEllipseEccentricity()
{
  return _MTContact_getEllipseEccentricity();
}

uint64_t MTContact_getEllipseOrientationDegrees()
{
  return _MTContact_getEllipseOrientationDegrees();
}

uint64_t MTContact_isActive()
{
  return _MTContact_isActive();
}

uint64_t MTDeviceCopyDeviceUsagePairs()
{
  return _MTDeviceCopyDeviceUsagePairs();
}

uint64_t MTDeviceCreateFromService()
{
  return _MTDeviceCreateFromService();
}

uint64_t MTDeviceCreateMultitouchDispatchSource()
{
  return _MTDeviceCreateMultitouchDispatchSource();
}

uint64_t MTDeviceEnableWorkIntervalNotification()
{
  return _MTDeviceEnableWorkIntervalNotification();
}

uint64_t MTDeviceGetAccurateMaxDigitizerPressureValue()
{
  return _MTDeviceGetAccurateMaxDigitizerPressureValue();
}

uint64_t MTDeviceGetCriticalErrors()
{
  return _MTDeviceGetCriticalErrors();
}

uint64_t MTDeviceGetDeviceID()
{
  return _MTDeviceGetDeviceID();
}

uint64_t MTDeviceGetExtendedMaxDigitizerPressureValue()
{
  return _MTDeviceGetExtendedMaxDigitizerPressureValue();
}

uint64_t MTDeviceGetMTActuator()
{
  return _MTDeviceGetMTActuator();
}

uint64_t MTDeviceGetMaxHoverHeightValue()
{
  return _MTDeviceGetMaxHoverHeightValue();
}

uint64_t MTDeviceGetMinDigitizerPressureValue()
{
  return _MTDeviceGetMinDigitizerPressureValue();
}

uint64_t MTDeviceGetParserOptions()
{
  return _MTDeviceGetParserOptions();
}

uint64_t MTDeviceGetParserType()
{
  return _MTDeviceGetParserType();
}

uint64_t MTDeviceGetReport()
{
  return _MTDeviceGetReport();
}

uint64_t MTDeviceGetSensorSurfaceDimensions()
{
  return _MTDeviceGetSensorSurfaceDimensions();
}

uint64_t MTDeviceGetService()
{
  return _MTDeviceGetService();
}

uint64_t MTDeviceInjectFrame()
{
  return _MTDeviceInjectFrame();
}

uint64_t MTDeviceIsBuiltIn()
{
  return _MTDeviceIsBuiltIn();
}

uint64_t MTDeviceNotifyWorkInterval()
{
  return _MTDeviceNotifyWorkInterval();
}

uint64_t MTDevicePowerGetState()
{
  return _MTDevicePowerGetState();
}

uint64_t MTDevicePowerSetState()
{
  return _MTDevicePowerSetState();
}

uint64_t MTDeviceSendExternalMessage()
{
  return _MTDeviceSendExternalMessage();
}

uint64_t MTDeviceSetInjectionMaxPacketSize()
{
  return _MTDeviceSetInjectionMaxPacketSize();
}

uint64_t MTDeviceSetReport()
{
  return _MTDeviceSetReport();
}

uint64_t MTDeviceStart()
{
  return _MTDeviceStart();
}

uint64_t MTDeviceStop()
{
  return _MTDeviceStop();
}

uint64_t MTDeviceSupportsActuation()
{
  return _MTDeviceSupportsActuation();
}

uint64_t MTDeviceSupportsSilentClick()
{
  return _MTDeviceSupportsSilentClick();
}

uint64_t MTGetPathStageName()
{
  return _MTGetPathStageName();
}

uint64_t MTRegisterFullFrameCallback()
{
  return _MTRegisterFullFrameCallback();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return _NSProtocolFromString(namestr);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return _NSStringFromProtocol(proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return __CFRuntimeCreateInstance();
}

uint64_t _CFRuntimeRegisterClass()
{
  return __CFRuntimeRegisterClass();
}

uint64_t _IOHIDEventSetAttachment()
{
  return __IOHIDEventSetAttachment();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return std::stringbuf::str();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

void std::string::__init(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return std::string::assign(this, __s);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str)
{
  return std::string::basic_string(this, __str);
}

void std::string::~string(std::string *this)
{
}

std::system_error *__cdecl std::system_error::system_error(std::system_error *this, int __ev, const std::error_category *__ecat, const char *__what_arg)
{
  return std::system_error::system_error(this, __ev, __ecat, __what_arg);
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::ostream::~ostream()
{
  return std::ostream::~ostream();
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return std::__thread_struct::__thread_struct(this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return std::recursive_mutex::recursive_mutex(this);
}

void std::recursive_mutex::~recursive_mutex(std::recursive_mutex *this)
{
}

const std::error_category *std::system_category(void)
{
  return std::system_category();
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::notify_one(std::condition_variable *this)
{
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return std::__shared_weak_count::lock(this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return std::__thread_local_data();
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

uint64_t std::__sort<std::__less<float,float> &,float *>()
{
  return std::__sort<std::__less<float,float> &,float *>();
}

uint64_t std::__sort<std::__less<int,int> &,int *>()
{
  return std::__sort<std::__less<int,int> &,int *>();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return std::chrono::steady_clock::now();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return std::chrono::system_clock::now();
}

void std::locale::~locale(std::locale *this)
{
}

void std::thread::detach(std::thread *this)
{
}

void std::thread::~thread(std::thread *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return std::ios::~ios();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p, std::align_val_t a2)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void __cxa_bad_cast(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)___dynamic_cast(lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return ___error();
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

uint64_t _mthid_serializePropertiesEvent()
{
  return __mthid_serializePropertiesEvent();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return _accept(a1, a2, a3);
}

float atan2f(float a1, float a2)
{
  return _atan2f(a1, a2);
}

char *__cdecl basename_r(const char *a1, char *a2)
{
  return _basename_r(a1, a2);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

float cbrtf(float a1)
{
  return _cbrtf(a1);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return _class_addMethod(cls, name, imp, types);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return _class_getInstanceMethod(cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return _class_getName(cls);
}

int close(int a1)
{
  return _close(a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

long double cos(long double __x)
{
  return _cos(__x);
}

float cosf(float a1)
{
  return _cosf(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return _dispatch_queue_get_qos_class(queue, relative_priority_ptr);
}

void dispatch_resume(dispatch_object_t object)
{
}

uint64_t dispatch_set_qos_class_fallback()
{
  return _dispatch_set_qos_class_fallback();
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return _dispatch_source_testcancel(source);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return _dispatch_workloop_create_inactive(label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return _dispatch_workloop_set_scheduler_priority();
}

long double exp(long double __x)
{
  return _exp(__x);
}

long double exp2(long double __x)
{
  return _exp2(__x);
}

float expf(float a1)
{
  return _expf(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

uint64_t fileport_makefd()
{
  return _fileport_makefd();
}

uint64_t fileport_makeport()
{
  return _fileport_makeport();
}

int flsll(uint64_t a1)
{
  return _flsll(a1);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

float fmodf(float a1, float a2)
{
  return _fmodf(a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

long double hypot(long double __x, long double __y)
{
  return _hypot(__x, __y);
}

float hypotf(float a1, float a2)
{
  return _hypotf(a1, a2);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

int listen(int a1, int a2)
{
  return _listen(a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return _mach_port_allocate(task, right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return _mach_port_insert_right(task, name, poly, polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return _mach_port_request_notification(task, name, msgid, sync, notify, notifyPoly, previous);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void method_getReturnType(Method m, char *dst, size_t dst_len)
{
}

int mkstemp(char *a1)
{
  return _mkstemp(a1);
}

float modff(float a1, float *a2)
{
  return _modff(a1, a2);
}

uint64_t mt_CreateSavedNameForDevice()
{
  return _mt_CreateSavedNameForDevice();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return _object_getClassName(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

float powf(float a1, float a2)
{
  return _powf(a1, a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return _pthread_once(a1, a2);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(a1, a2);
}

int puts(const char *a1)
{
  return _puts(a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

SEL sel_registerName(const char *str)
{
  return _sel_registerName(str);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

int shutdown(int a1, int a2)
{
  return _shutdown(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int socketpair(int a1, int a2, int a3, int *a4)
{
  return _socketpair(a1, a2, a3, a4);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return _xpc_connection_create(name, targetq);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_dup_fd(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_set_mach_send()
{
  return _xpc_dictionary_set_mach_send();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_HSRecordingPlaybackStageProxy_0mode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HSRecordingPlaybackStageProxy_0mode");
}

id objc_msgSend_HSRecordingPlaybackStageProxy_0playbackProgress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HSRecordingPlaybackStageProxy_0playbackProgress");
}

id objc_msgSend_HSRecordingPlaybackStageProxy_0recordingSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HSRecordingPlaybackStageProxy_0recordingSize");
}

id objc_msgSend_HSRecordingPlaybackStageProxy_playbackSetProgressdispatchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HSRecordingPlaybackStageProxy_playbackSetProgressdispatchEvent:");
}

id objc_msgSend_HSRecordingPlaybackStageProxy_recordingSetMaxSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HSRecordingPlaybackStageProxy_recordingSetMaxSize:");
}

id objc_msgSend_HSRecordingPlaybackStageProxy_setMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HSRecordingPlaybackStageProxy_setMode:");
}

id objc_msgSend_HSStageProxy_decodeStateFromData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HSStageProxy_decodeStateFromData:");
}

id objc_msgSend_HSTRecordingManagerProxy_saveRecording_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HSTRecordingManagerProxy_saveRecording:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__addClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addClient:");
}

id objc_msgSend__applyMouseSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyMouseSettings:");
}

id objc_msgSend__applyTPSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyTPSettings:");
}

id objc_msgSend__cancelActiveContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelActiveContacts:");
}

id objc_msgSend__clear(void *a1, const char *a2, ...)
{
  return _[a1 _clear];
}

id objc_msgSend__close(void *a1, const char *a2, ...)
{
  return _[a1 _close];
}

id objc_msgSend__closeWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_closeWithOptions:");
}

id objc_msgSend__containsMayBegin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_containsMayBegin:");
}

id objc_msgSend__copyDataTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_copyDataTo:");
}

id objc_msgSend__copyEventWithType_matching_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_copyEventWithType:matching:options:");
}

id objc_msgSend__createRecordingBuffer(void *a1, const char *a2, ...)
{
  return _[a1 _createRecordingBuffer];
}

id objc_msgSend__decodePlayFrame_toFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_decodePlayFrame:toFrame:");
}

id objc_msgSend__destroyRecordingBuffer(void *a1, const char *a2, ...)
{
  return _[a1 _destroyRecordingBuffer];
}

id objc_msgSend__dispatchHIDEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dispatchHIDEvent:");
}

id objc_msgSend__dispatchHIDEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dispatchHIDEvents:");
}

id objc_msgSend__dispatchHIDEventsAsync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dispatchHIDEventsAsync:");
}

id objc_msgSend__dispatchPointerButtonUpEvent(void *a1, const char *a2, ...)
{
  return _[a1 _dispatchPointerButtonUpEvent];
}

id objc_msgSend__dispatchReportIntervalChangedEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dispatchReportIntervalChangedEvent:");
}

id objc_msgSend__doUpdateStat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_doUpdateStat:");
}

id objc_msgSend__drainCurrentWindow(void *a1, const char *a2, ...)
{
  return _[a1 _drainCurrentWindow];
}

id objc_msgSend__driverToHSTNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_driverToHSTNotification:");
}

id objc_msgSend__driverToHSTNotificationWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_driverToHSTNotificationWithContext:");
}

id objc_msgSend__driverUserSpaceToHSTNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_driverUserSpaceToHSTNotification:");
}

id objc_msgSend__encodeFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_encodeFrame:");
}

id objc_msgSend__encodeHeaderFrames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_encodeHeaderFrames:");
}

id objc_msgSend__enumerateEncoders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateEncoders:");
}

id objc_msgSend__extractMTContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractMTContacts:");
}

id objc_msgSend__feedbackEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_feedbackEvent:");
}

id objc_msgSend__feedbackEventAsync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_feedbackEventAsync:");
}

id objc_msgSend__firmwareToHSTNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_firmwareToHSTNotification:");
}

id objc_msgSend__flushState(void *a1, const char *a2, ...)
{
  return _[a1 _flushState];
}

id objc_msgSend__getPropertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getPropertyForKey:");
}

id objc_msgSend__handleActivateEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleActivateEvent:");
}

id objc_msgSend__handleActuationEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleActuationEvent:");
}

id objc_msgSend__handleCancelEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleCancelEvent:");
}

id objc_msgSend__handleClient(void *a1, const char *a2, ...)
{
  return _[a1 _handleClient];
}

id objc_msgSend__handleConnectionClosed(void *a1, const char *a2, ...)
{
  return _[a1 _handleConnectionClosed];
}

id objc_msgSend__handleConnectionClosed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleConnectionClosed:");
}

id objc_msgSend__handleConnectionOpened(void *a1, const char *a2, ...)
{
  return _[a1 _handleConnectionOpened];
}

id objc_msgSend__handleContactFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleContactFrame:");
}

id objc_msgSend__handleContactFrame_numActivePaths_timestampS_frameNumber_baseEvent_handleTapAndAHalf_isFlush_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleContactFrame:numActivePaths:timestampS:frameNumber:baseEvent:handleTapAndAHalf:isFlush:");
}

id objc_msgSend__handleCopyEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleCopyEvent:");
}

id objc_msgSend__handleCoreAnalytics_payload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleCoreAnalytics:payload:");
}

id objc_msgSend__handleDataFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDataFromClient:");
}

id objc_msgSend__handleDebugStateEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDebugStateEvent:");
}

id objc_msgSend__handleDriverEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDriverEvent:");
}

id objc_msgSend__handleDriverExternalMessageFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDriverExternalMessageFrame:");
}

id objc_msgSend__handleDriverNotificationFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDriverNotificationFrame:");
}

id objc_msgSend__handleEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleEvents:");
}

id objc_msgSend__handleExternalMessageEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleExternalMessageEvent:");
}

id objc_msgSend__handleFirmwareEventFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFirmwareEventFrame:");
}

id objc_msgSend__handleFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFrame:");
}

id objc_msgSend__handleGetDebugEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleGetDebugEvent:");
}

id objc_msgSend__handleGetPropertyEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleGetPropertyEvent:");
}

id objc_msgSend__handleGetWaterStateEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleGetWaterStateEvent:");
}

id objc_msgSend__handleHIDEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleHIDEvents:");
}

id objc_msgSend__handleHIDPencilEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleHIDPencilEvents:");
}

id objc_msgSend__handleHSTFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleHSTFrame:");
}

id objc_msgSend__handleHSTNotificationEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleHSTNotificationEvent:");
}

id objc_msgSend__handleHostStateEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleHostStateEvent:");
}

id objc_msgSend__handleMessage_fromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMessage:fromClient:");
}

id objc_msgSend__handleMomentumRequestEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMomentumRequestEvent:");
}

id objc_msgSend__handleMomentumStateEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMomentumStateEvent:");
}

id objc_msgSend__handleMotionState_confidence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMotionState:confidence:");
}

id objc_msgSend__handleMouseSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMouseSettings:");
}

id objc_msgSend__handleNewClient(void *a1, const char *a2, ...)
{
  return _[a1 _handleNewClient];
}

id objc_msgSend__handleNewClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleNewClient:");
}

id objc_msgSend__handlePencilEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handlePencilEvents:");
}

id objc_msgSend__handlePointerFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handlePointerFrame:");
}

id objc_msgSend__handlePowerSourceState(void *a1, const char *a2, ...)
{
  return _[a1 _handlePowerSourceState];
}

id objc_msgSend__handleProxClearedAfterOccludedWake(void *a1, const char *a2, ...)
{
  return _[a1 _handleProxClearedAfterOccludedWake];
}

id objc_msgSend__handleProxClearedAfterOccludedWakeEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleProxClearedAfterOccludedWakeEvent:");
}

id objc_msgSend__handleResetEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleResetEvent:");
}

id objc_msgSend__handleResetRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleResetRequest:");
}

id objc_msgSend__handleSAFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSAFrame:");
}

id objc_msgSend__handleScreenOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleScreenOrientation:");
}

id objc_msgSend__handleScreenOrientationEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleScreenOrientationEvent:");
}

id objc_msgSend__handleSetPropertyEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSetPropertyEvent:");
}

id objc_msgSend__handleSetReportEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSetReportEvent:");
}

id objc_msgSend__handleStockholmState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleStockholmState:");
}

id objc_msgSend__handleStockholmStateEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleStockholmStateEvent:");
}

id objc_msgSend__handleStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleStream:");
}

id objc_msgSend__handleStuckTouchDetectorState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleStuckTouchDetectorState:");
}

id objc_msgSend__handleStuckTouchDetectorStateEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleStuckTouchDetectorStateEvent:");
}

id objc_msgSend__handleSystemPowerEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSystemPowerEvent:");
}

id objc_msgSend__handleTPSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleTPSettings:");
}

id objc_msgSend__handleTimerEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleTimerEvent:");
}

id objc_msgSend__handleTimestampSyncEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleTimestampSyncEvent:");
}

id objc_msgSend__handleTimestampSyncFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleTimestampSyncFrame:");
}

id objc_msgSend__handleTouchFrame_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleTouchFrame:length:");
}

id objc_msgSend__handleTouchHand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleTouchHand:");
}

id objc_msgSend__handleTouchHandEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleTouchHandEvent:");
}

id objc_msgSend__handleTouchMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleTouchMode:");
}

id objc_msgSend__handleTouchModeEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleTouchModeEvent:");
}

id objc_msgSend__handleUSBChargingStateEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleUSBChargingStateEvent:");
}

id objc_msgSend__handleVendorEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleVendorEvent:");
}

id objc_msgSend__handleWakeSystemEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleWakeSystemEvent:");
}

id objc_msgSend__handleWirelessChargingStateEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleWirelessChargingStateEvent:");
}

id objc_msgSend__handleWristState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleWristState:");
}

id objc_msgSend__handleWristStateEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleWristStateEvent:");
}

id objc_msgSend__haveToWake_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_haveToWake:");
}

id objc_msgSend__isSleeping(void *a1, const char *a2, ...)
{
  return _[a1 _isSleeping];
}

id objc_msgSend__load_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_load:");
}

id objc_msgSend__loadPreferences(void *a1, const char *a2, ...)
{
  return _[a1 _loadPreferences];
}

id objc_msgSend__logContact_ofType_withFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logContact:ofType:withFrame:");
}

id objc_msgSend__logHIDEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logHIDEvent:");
}

id objc_msgSend__mode(void *a1, const char *a2, ...)
{
  return _[a1 _mode];
}

id objc_msgSend__openActuatorDevice(void *a1, const char *a2, ...)
{
  return _[a1 _openActuatorDevice];
}

id objc_msgSend__openWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_openWithOptions:");
}

id objc_msgSend__playConsumeFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playConsumeFrame:");
}

id objc_msgSend__playNextFrame(void *a1, const char *a2, ...)
{
  return _[a1 _playNextFrame];
}

id objc_msgSend__playStateFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playStateFrame:");
}

id objc_msgSend__playbackHeartbeatTimerFired(void *a1, const char *a2, ...)
{
  return _[a1 _playbackHeartbeatTimerFired];
}

id objc_msgSend__privitizeHIDEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_privitizeHIDEvent:");
}

id objc_msgSend__probeWithService_properties_outScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_probeWithService:properties:outScore:");
}

id objc_msgSend__pruneObservers(void *a1, const char *a2, ...)
{
  return _[a1 _pruneObservers];
}

id objc_msgSend__readAODLogging(void *a1, const char *a2, ...)
{
  return _[a1 _readAODLogging];
}

id objc_msgSend__recordConsumeFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_recordConsumeFrame:");
}

id objc_msgSend__recordProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_recordProperty:forKey:");
}

id objc_msgSend__removeClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeClient:");
}

id objc_msgSend__reset(void *a1, const char *a2, ...)
{
  return _[a1 _reset];
}

id objc_msgSend__restoreFirmwareState(void *a1, const char *a2, ...)
{
  return _[a1 _restoreFirmwareState];
}

id objc_msgSend__rotateEncoders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rotateEncoders:");
}

id objc_msgSend__saveLastTouchSystemReady_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveLastTouchSystemReady:");
}

id objc_msgSend__savePreferences(void *a1, const char *a2, ...)
{
  return _[a1 _savePreferences];
}

id objc_msgSend__scheduleWithDispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleWithDispatchQueue:");
}

id objc_msgSend__sendRegistryPropertiesContinuousRecording(void *a1, const char *a2, ...)
{
  return _[a1 _sendRegistryPropertiesContinuousRecording];
}

id objc_msgSend__setAODLogging(void *a1, const char *a2, ...)
{
  return _[a1 _setAODLogging];
}

id objc_msgSend__setEnabledInputsReport(void *a1, const char *a2, ...)
{
  return _[a1 _setEnabledInputsReport];
}

id objc_msgSend__setEventCallback_target_refcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setEventCallback:target:refcon:");
}

id objc_msgSend__setOutputEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setOutputEvent:");
}

id objc_msgSend__setPlaybackTimerEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPlaybackTimerEnabled:");
}

id objc_msgSend__setPlaying_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPlaying:");
}

id objc_msgSend__setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setProperty:forKey:");
}

id objc_msgSend__setReportIntervalUs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setReportIntervalUs:");
}

id objc_msgSend__setUSBChargingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUSBChargingState:");
}

id objc_msgSend__size(void *a1, const char *a2, ...)
{
  return _[a1 _size];
}

id objc_msgSend__startRecording(void *a1, const char *a2, ...)
{
  return _[a1 _startRecording];
}

id objc_msgSend__startWithService_properties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startWithService:properties:");
}

id objc_msgSend__stop(void *a1, const char *a2, ...)
{
  return _[a1 _stop];
}

id objc_msgSend__stopRecording(void *a1, const char *a2, ...)
{
  return _[a1 _stopRecording];
}

id objc_msgSend__tickleMouseFilters(void *a1, const char *a2, ...)
{
  return _[a1 _tickleMouseFilters];
}

id objc_msgSend__unscheduleWithDispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unscheduleWithDispatchQueue:");
}

id objc_msgSend__updateButtonMotionFilter_shouldSpike_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateButtonMotionFilter:shouldSpike:");
}

id objc_msgSend__updateDeviceScanRate(void *a1, const char *a2, ...)
{
  return _[a1 _updateDeviceScanRate];
}

id objc_msgSend__updateHostClickControl(void *a1, const char *a2, ...)
{
  return _[a1 _updateHostClickControl];
}

id objc_msgSend__updateMouseMotionFilterWithXVelocity_YVelocity_tickle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMouseMotionFilterWithXVelocity:YVelocity:tickle:");
}

id objc_msgSend__updatePlaybackTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePlaybackTime:");
}

id objc_msgSend__updatePrefStages(void *a1, const char *a2, ...)
{
  return _[a1 _updatePrefStages];
}

id objc_msgSend__updateRecordedPropertyCountBy_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateRecordedPropertyCountBy:forKey:");
}

id objc_msgSend__writeAODLogging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_writeAODLogging:");
}

id objc_msgSend_accessoryConnectionInfoFromTransport_connection_transport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessoryConnectionInfoFromTransport:connection:transport:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_addClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addClient:");
}

id objc_msgSend_addClient_config_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addClient:config:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addService:");
}

id objc_msgSend_addStageObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStageObserver:");
}

id objc_msgSend_addVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addVersion:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendDeviceInfoTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendDeviceInfoTo:");
}

id objc_msgSend_appendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendEvent:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_atEndOfCurve(void *a1, const char *a2, ...)
{
  return _[a1 atEndOfCurve];
}

id objc_msgSend_autoReleaseTapAndAHalfDrag_eventRef_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoReleaseTapAndAHalfDrag:eventRef:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_builtIn(void *a1, const char *a2, ...)
{
  return _[a1 builtIn];
}

id objc_msgSend_buttonEvent_buttonMask_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonEvent:buttonMask:options:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelCurrentTapAndAHalfDrag(void *a1, const char *a2, ...)
{
  return _[a1 cancelCurrentTapAndAHalfDrag];
}

id objc_msgSend_cancelMomentum(void *a1, const char *a2, ...)
{
  return _[a1 cancelMomentum];
}

id objc_msgSend_cancelMomentumTimerWithInterrupted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelMomentumTimerWithInterrupted:");
}

id objc_msgSend_cancelNotificationCenterSource(void *a1, const char *a2, ...)
{
  return _[a1 cancelNotificationCenterSource];
}

id objc_msgSend_checkForMomentumCancellation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkForMomentumCancellation:");
}

id objc_msgSend_checkForMomentumInitiation_triggerEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkForMomentumInitiation:triggerEvent:");
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return _[a1 children];
}

id objc_msgSend_clearCurves(void *a1, const char *a2, ...)
{
  return _[a1 clearCurves];
}

id objc_msgSend_clearState(void *a1, const char *a2, ...)
{
  return _[a1 clearState];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_conformsToEventType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToEventType:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_consume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consume:");
}

id objc_msgSend_consumers(void *a1, const char *a2, ...)
{
  return _[a1 consumers];
}

id objc_msgSend_contactFrameFromData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactFrameFromData:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_continousRecordingIDsFomService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continousRecordingIDsFomService:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyDataTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyDataTo:");
}

id objc_msgSend_copyPhaseFrom_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyPhaseFrom:to:");
}

id objc_msgSend_coreAccessoryServiceInfoFromProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coreAccessoryServiceInfoFromProperties:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_coverClosed(void *a1, const char *a2, ...)
{
  return _[a1 coverClosed];
}

id objc_msgSend_createConnectionWithType_andIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createConnectionWithType:andIdentifier:");
}

id objc_msgSend_createDigitizerChildEventForPath_parserPath_pathEventMask_hostTimestamp_cancellingCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDigitizerChildEventForPath:parserPath:pathEventMask:hostTimestamp:cancellingCollection:");
}

id objc_msgSend_createDigitizerPathChildEvents_collectionEventMask_hostTimestamp_additionalEventMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDigitizerPathChildEvents:collectionEventMask:hostTimestamp:additionalEventMask:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createEndpointWithTransportType_andProtocol_andIdentifier_andDataOutHandler_forConnectionWithUUID_publishConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createEndpointWithTransportType:andProtocol:andIdentifier:andDataOutHandler:forConnectionWithUUID:publishConnection:");
}

id objc_msgSend_createHIDCollectionEvents_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createHIDCollectionEvents:timestamp:");
}

id objc_msgSend_createMomentumPointingEventWithDeltas_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createMomentumPointingEventWithDeltas:");
}

id objc_msgSend_createPointingEventWithDeltaX_deltaY_buttonMask_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createPointingEventWithDeltaX:deltaY:buttonMask:timestamp:");
}

id objc_msgSend_createScrollEventWithDeltaX_deltaY_deltaZ_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createScrollEventWithDeltaX:deltaY:deltaZ:options:");
}

id objc_msgSend_createScrollMomentumEventWithDeltas_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createScrollMomentumEventWithDeltas:");
}

id objc_msgSend_criticalErrors(void *a1, const char *a2, ...)
{
  return _[a1 criticalErrors];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentInterval(void *a1, const char *a2, ...)
{
  return _[a1 currentInterval];
}

id objc_msgSend_curveIndex(void *a1, const char *a2, ...)
{
  return _[a1 curveIndex];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataValueForField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataValueForField:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_debug(void *a1, const char *a2, ...)
{
  return _[a1 debug];
}

id objc_msgSend_debugDictionary(void *a1, const char *a2, ...)
{
  return _[a1 debugDictionary];
}

id objc_msgSend_decayMomentumPointDragWithMouseDelta_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decayMomentumPointDragWithMouseDelta:");
}

id objc_msgSend_decayStopDelta(void *a1, const char *a2, ...)
{
  return _[a1 decayStopDelta];
}

id objc_msgSend_decodeFromMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeFromMap:");
}

id objc_msgSend_decodeStateFromData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeStateFromData:");
}

id objc_msgSend_defaultDispatchRate(void *a1, const char *a2, ...)
{
  return _[a1 defaultDispatchRate];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_deltaMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 deltaMultiplier];
}

id objc_msgSend_deregisterForDeviceManagementMatching(void *a1, const char *a2, ...)
{
  return _[a1 deregisterForDeviceManagementMatching];
}

id objc_msgSend_destroyConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destroyConnectionWithUUID:");
}

id objc_msgSend_determineMouseSettings(void *a1, const char *a2, ...)
{
  return _[a1 determineMouseSettings];
}

id objc_msgSend_determineSavedOrientationForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "determineSavedOrientationForDevice:");
}

id objc_msgSend_determineSavedOrientationModeForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "determineSavedOrientationModeForDevice:");
}

id objc_msgSend_determineSurfaceOrientationSettings(void *a1, const char *a2, ...)
{
  return _[a1 determineSurfaceOrientationSettings];
}

id objc_msgSend_determineTrackpadSettings(void *a1, const char *a2, ...)
{
  return _[a1 determineTrackpadSettings];
}

id objc_msgSend_deviceButtonState(void *a1, const char *a2, ...)
{
  return _[a1 deviceButtonState];
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return _[a1 deviceID];
}

id objc_msgSend_deviceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 deviceOrientation];
}

id objc_msgSend_deviceTimestampOffsetMs(void *a1, const char *a2, ...)
{
  return _[a1 deviceTimestampOffsetMs];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _[a1 devices];
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disablingDeviceCount(void *a1, const char *a2, ...)
{
  return _[a1 disablingDeviceCount];
}

id objc_msgSend_dispatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatch:");
}

id objc_msgSend_dispatchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatchEvent:");
}

id objc_msgSend_displayOff(void *a1, const char *a2, ...)
{
  return _[a1 displayOff];
}

id objc_msgSend_divingButtonState(void *a1, const char *a2, ...)
{
  return _[a1 divingButtonState];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_doubleValueForField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValueForField:");
}

id objc_msgSend_dragButtons(void *a1, const char *a2, ...)
{
  return _[a1 dragButtons];
}

id objc_msgSend_encodeStateToData(void *a1, const char *a2, ...)
{
  return _[a1 encodeStateToData];
}

id objc_msgSend_encodeToMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeToMap:");
}

id objc_msgSend_extendedFeatures(void *a1, const char *a2, ...)
{
  return _[a1 extendedFeatures];
}

id objc_msgSend_fetchDefaultPreference(void *a1, const char *a2, ...)
{
  return _[a1 fetchDefaultPreference];
}

id objc_msgSend_firmwareTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 firmwareTimestamp];
}

id objc_msgSend_firstSwitchFromInterpolatedCurve(void *a1, const char *a2, ...)
{
  return _[a1 firstSwitchFromInterpolatedCurve];
}

id objc_msgSend_firstSwitchFromInterpolatedCurveInterval(void *a1, const char *a2, ...)
{
  return _[a1 firstSwitchFromInterpolatedCurveInterval];
}

id objc_msgSend_firstSwitchFromInterpolatedCurveMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 firstSwitchFromInterpolatedCurveMultiplier];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_forceBehaviorFromForceConfig_mask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceBehaviorFromForceConfig:mask:");
}

id objc_msgSend_frameInterval(void *a1, const char *a2, ...)
{
  return _[a1 frameInterval];
}

id objc_msgSend_frameNumber(void *a1, const char *a2, ...)
{
  return _[a1 frameNumber];
}

id objc_msgSend_generateCurvesWithInitialDelta_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateCurvesWithInitialDelta:");
}

id objc_msgSend_generateCurvesWithMomentumState_scrollMomentumDispatchRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateCurvesWithMomentumState:scrollMomentumDispatchRate:");
}

id objc_msgSend_generateFrameIntervalMomentumDeltas(void *a1, const char *a2, ...)
{
  return _[a1 generateFrameIntervalMomentumDeltas];
}

id objc_msgSend_generateHostStateEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateHostStateEvent:");
}

id objc_msgSend_gestureScrollsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 gestureScrollsEnabled];
}

id objc_msgSend_getActuationOptions_silentClick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getActuationOptions:silentClick:");
}

id objc_msgSend_getCurrentMomentumDeltas(void *a1, const char *a2, ...)
{
  return _[a1 getCurrentMomentumDeltas];
}

id objc_msgSend_getCurrentMomentumDeltasAndStep(void *a1, const char *a2, ...)
{
  return _[a1 getCurrentMomentumDeltasAndStep];
}

id objc_msgSend_getDisablerDeviceCount(void *a1, const char *a2, ...)
{
  return _[a1 getDisablerDeviceCount];
}

id objc_msgSend_getForceSourceForBehavior_secondaryClickEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getForceSourceForBehavior:secondaryClickEnabled:");
}

id objc_msgSend_getMomentumEnableEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getMomentumEnableEvent:");
}

id objc_msgSend_getPluginInterface(void *a1, const char *a2, ...)
{
  return _[a1 getPluginInterface];
}

id objc_msgSend_getSendRightFromServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSendRightFromServer:");
}

id objc_msgSend_getServiceInterface(void *a1, const char *a2, ...)
{
  return _[a1 getServiceInterface];
}

id objc_msgSend_getTimeAtIndex_curve_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTimeAtIndex:curve:");
}

id objc_msgSend_handleActMatching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleActMatching:");
}

id objc_msgSend_handleCancelEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCancelEvent:");
}

id objc_msgSend_handleConsume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConsume:");
}

id objc_msgSend_handleDebugStateEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDebugStateEvent:");
}

id objc_msgSend_handleDeviceManagementMatching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDeviceManagementMatching:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFrame:");
}

id objc_msgSend_handleGetDebugEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleGetDebugEvent:");
}

id objc_msgSend_handleGetProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleGetProperty:");
}

id objc_msgSend_handleGetPropertyEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleGetPropertyEvent:");
}

id objc_msgSend_handleHIDEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleHIDEvent:");
}

id objc_msgSend_handleHIDEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleHIDEvents:");
}

id objc_msgSend_handleHSDecode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleHSDecode:");
}

id objc_msgSend_handleHSEncode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleHSEncode:");
}

id objc_msgSend_handleHSPointerFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleHSPointerFrame:");
}

id objc_msgSend_handleHSTEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleHSTEvent:");
}

id objc_msgSend_handleInputStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInputStream:");
}

id objc_msgSend_handleMomentumRequestEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleMomentumRequestEvent:");
}

id objc_msgSend_handleMomentumState_active_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleMomentumState:active:");
}

id objc_msgSend_handleMomentumStateEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleMomentumStateEvent:");
}

id objc_msgSend_handleMouseSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleMouseSettings:");
}

id objc_msgSend_handlePowerState_messageArgument_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePowerState:messageArgument:");
}

id objc_msgSend_handleProperty_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleProperty:value:");
}

id objc_msgSend_handleSetProperty_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSetProperty:value:");
}

id objc_msgSend_handleSetPropertyEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSetPropertyEvent:");
}

id objc_msgSend_handleTPSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleTPSettings:");
}

id objc_msgSend_handleTimerEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleTimerEvent:");
}

id objc_msgSend_hostClickControl(void *a1, const char *a2, ...)
{
  return _[a1 hostClickControl];
}

id objc_msgSend_hsClassName(void *a1, const char *a2, ...)
{
  return _[a1 hsClassName];
}

id objc_msgSend_hsDecode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hsDecode:");
}

id objc_msgSend_hsEncode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hsEncode:");
}

id objc_msgSend_hsProxyAlive(void *a1, const char *a2, ...)
{
  return _[a1 hsProxyAlive];
}

id objc_msgSend_hsProxyClass(void *a1, const char *a2, ...)
{
  return _[a1 hsProxyClass];
}

id objc_msgSend_hsSetTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hsSetTimestamp:");
}

id objc_msgSend_hsTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 hsTimestamp];
}

id objc_msgSend_initWithBuffer_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBuffer:length:");
}

id objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytesNoCopy:length:encoding:freeWhenDone:");
}

id objc_msgSend_initWithConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfig:");
}

id objc_msgSend_initWithConfig_actuationHandler_builtIn_supportsDeepPress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfig:actuationHandler:builtIn:supportsDeepPress:");
}

id objc_msgSend_initWithConfig_withQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfig:withQueue:");
}

id objc_msgSend_initWithDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevice:");
}

id objc_msgSend_initWithDevice_parserOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevice:parserOptions:");
}

id objc_msgSend_initWithDevice_parserOptions_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevice:parserOptions:handler:");
}

id objc_msgSend_initWithDeviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeviceID:");
}

id objc_msgSend_initWithDeviceOrientation_screenOrientation_coverClosed_displayOff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeviceOrientation:screenOrientation:coverClosed:displayOff:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithKey_name_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:name:description:");
}

id objc_msgSend_initWithMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMessage:");
}

id objc_msgSend_initWithName_description_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:description:queue:");
}

id objc_msgSend_initWithName_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:handler:");
}

id objc_msgSend_initWithName_payload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:payload:");
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPath:");
}

id objc_msgSend_initWithPlaybackQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlaybackQueue:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithReceiveRight_authorizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReceiveRight:authorizer:");
}

id objc_msgSend_initWithReceiveRight_queue_clientHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReceiveRight:queue:clientHandler:");
}

id objc_msgSend_initWithReportIDs_deviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReportIDs:deviceID:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithSocket_config_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSocket:config:");
}

id objc_msgSend_initWithSocket_queue_clientHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSocket:queue:clientHandler:");
}

id objc_msgSend_initWithStreamSize_platformId_streamCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStreamSize:platformId:streamCallback:");
}

id objc_msgSend_initWithType_buffer_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:buffer:length:");
}

id objc_msgSend_initWithType_matching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:matching:");
}

id objc_msgSend_initWithUserDefaults_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUserDefaults:domain:");
}

id objc_msgSend_initialDelta(void *a1, const char *a2, ...)
{
  return _[a1 initialDelta];
}

id objc_msgSend_injectProperty_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "injectProperty:value:");
}

id objc_msgSend_innie(void *a1, const char *a2, ...)
{
  return _[a1 innie];
}

id objc_msgSend_instanceMethodForSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instanceMethodForSelector:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_integerValueForField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValueForField:");
}

id objc_msgSend_interpolateFrameIntervalMomentumDeltas(void *a1, const char *a2, ...)
{
  return _[a1 interpolateFrameIntervalMomentumDeltas];
}

id objc_msgSend_interpolationFrameInterval(void *a1, const char *a2, ...)
{
  return _[a1 interpolationFrameInterval];
}

id objc_msgSend_interpolationMinFrameSkipsAtEndOfTail(void *a1, const char *a2, ...)
{
  return _[a1 interpolationMinFrameSkipsAtEndOfTail];
}

id objc_msgSend_isContinuousRecordingReport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isContinuousRecordingReport:");
}

id objc_msgSend_isDigitizerCollectionHIDEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDigitizerCollectionHIDEvent:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMomentumActive(void *a1, const char *a2, ...)
{
  return _[a1 isMomentumActive];
}

id objc_msgSend_lastFrameInterval(void *a1, const char *a2, ...)
{
  return _[a1 lastFrameInterval];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return _[a1 load];
}

id objc_msgSend_loadFromData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromData:");
}

id objc_msgSend_loadFromSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromSource:");
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 localTimeZone];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_mPreferences(void *a1, const char *a2, ...)
{
  return _[a1 mPreferences];
}

id objc_msgSend_mSettingsManager(void *a1, const char *a2, ...)
{
  return _[a1 mSettingsManager];
}

id objc_msgSend_matchService_options_score_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchService:options:score:");
}

id objc_msgSend_matching(void *a1, const char *a2, ...)
{
  return _[a1 matching];
}

id objc_msgSend_maxDecayTime(void *a1, const char *a2, ...)
{
  return _[a1 maxDecayTime];
}

id objc_msgSend_mergeScrollEvent_with_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeScrollEvent:with:");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_minFrameSkipsAtEndOfTail(void *a1, const char *a2, ...)
{
  return _[a1 minFrameSkipsAtEndOfTail];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return _[a1 mode];
}

id objc_msgSend_momentumBits(void *a1, const char *a2, ...)
{
  return _[a1 momentumBits];
}

id objc_msgSend_momentumCurve(void *a1, const char *a2, ...)
{
  return _[a1 momentumCurve];
}

id objc_msgSend_momentumDecayRateAlphaWithMickeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "momentumDecayRateAlphaWithMickeys:");
}

id objc_msgSend_momentumTimer(void *a1, const char *a2, ...)
{
  return _[a1 momentumTimer];
}

id objc_msgSend_momentumTimerCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "momentumTimerCallback:");
}

id objc_msgSend_mtDeviceId(void *a1, const char *a2, ...)
{
  return _[a1 mtDeviceId];
}

id objc_msgSend_mtDeviceRef(void *a1, const char *a2, ...)
{
  return _[a1 mtDeviceRef];
}

id objc_msgSend_mtfwScanRate(void *a1, const char *a2, ...)
{
  return _[a1 mtfwScanRate];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nextInterval(void *a1, const char *a2, ...)
{
  return _[a1 nextInterval];
}

id objc_msgSend_nextScrollPhase_anyScroll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextScrollPhase:anyScroll:");
}

id objc_msgSend_noPointing(void *a1, const char *a2, ...)
{
  return _[a1 noPointing];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _[a1 notification];
}

id objc_msgSend_notificationCenterActive(void *a1, const char *a2, ...)
{
  return _[a1 notificationCenterActive];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return _[a1 objCType];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openService_config_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openService:config:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return _[a1 parent];
}

id objc_msgSend_parseContactFrame29_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseContactFrame29:");
}

id objc_msgSend_parseContactFrame31_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseContactFrame31:");
}

id objc_msgSend_parseContactFrame44_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseContactFrame44:");
}

id objc_msgSend_parseContactFrame75_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseContactFrame75:");
}

id objc_msgSend_parseRelativePointerFrame82_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseRelativePointerFrame82:");
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return _[a1 payload];
}

id objc_msgSend_physicalFrameInterval(void *a1, const char *a2, ...)
{
  return _[a1 physicalFrameInterval];
}

id objc_msgSend_playbackProgress(void *a1, const char *a2, ...)
{
  return _[a1 playbackProgress];
}

id objc_msgSend_playbackSetProgress_dispatchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackSetProgress:dispatchEvent:");
}

id objc_msgSend_playing(void *a1, const char *a2, ...)
{
  return _[a1 playing];
}

id objc_msgSend_pointerEvent_x_y_z_buttonMask_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointerEvent:x:y:z:buttonMask:options:");
}

id objc_msgSend_pointerFrameFromData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointerFrameFromData:");
}

id objc_msgSend_postNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotification:");
}

id objc_msgSend_preferenceValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceValueForKey:");
}

id objc_msgSend_preferences(void *a1, const char *a2, ...)
{
  return _[a1 preferences];
}

id objc_msgSend_previousButtonState(void *a1, const char *a2, ...)
{
  return _[a1 previousButtonState];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return _[a1 principalClass];
}

id objc_msgSend_processContact_activePathCount_timestamp_baseEvent_callbackInterval_isFlush_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processContact:activePathCount:timestamp:baseEvent:callbackInterval:isFlush:");
}

id objc_msgSend_productId(void *a1, const char *a2, ...)
{
  return _[a1 productId];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return _[a1 progress];
}

id objc_msgSend_propertyForKey_client_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:client:");
}

id objc_msgSend_publishConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publishConnectionWithUUID:");
}

id objc_msgSend_publishCoreAccessoryService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publishCoreAccessoryService:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_recording(void *a1, const char *a2, ...)
{
  return _[a1 recording];
}

id objc_msgSend_recordingCopyDataTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordingCopyDataTo:");
}

id objc_msgSend_recordingSetMaxSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordingSetMaxSize:");
}

id objc_msgSend_recordingSize(void *a1, const char *a2, ...)
{
  return _[a1 recordingSize];
}

id objc_msgSend_regenerateCurvesWithInitialDelta_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regenerateCurvesWithInitialDelta:");
}

id objc_msgSend_registerForDeviceManagementMatching(void *a1, const char *a2, ...)
{
  return _[a1 registerForDeviceManagementMatching];
}

id objc_msgSend_registryPropertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registryPropertyForKey:");
}

id objc_msgSend_remapUserFacingKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remapUserFacingKey:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEvent:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeStageObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeStageObserver:");
}

id objc_msgSend_report(void *a1, const char *a2, ...)
{
  return _[a1 report];
}

id objc_msgSend_reportIDs(void *a1, const char *a2, ...)
{
  return _[a1 reportIDs];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return _[a1 result];
}

id objc_msgSend_sanitizeContactFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sanitizeContactFrame:");
}

id objc_msgSend_saveRecording_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveRecording:");
}

id objc_msgSend_saveSurfaceOrientationForDevice_orientation_eraseSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveSurfaceOrientationForDevice:orientation:eraseSetting:");
}

id objc_msgSend_scheduleTapAndAHalfCallbackTimer_delay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleTapAndAHalfCallbackTimer:delay:");
}

id objc_msgSend_screenOrientation(void *a1, const char *a2, ...)
{
  return _[a1 screenOrientation];
}

id objc_msgSend_scrollEvent_x_y_z_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollEvent:x:y:z:options:");
}

id objc_msgSend_scrollMomentumDispatchRate(void *a1, const char *a2, ...)
{
  return _[a1 scrollMomentumDispatchRate];
}

id objc_msgSend_scrollMomentumEnabled(void *a1, const char *a2, ...)
{
  return _[a1 scrollMomentumEnabled];
}

id objc_msgSend_sendAttachNotification(void *a1, const char *a2, ...)
{
  return _[a1 sendAttachNotification];
}

id objc_msgSend_sendDetachNotification(void *a1, const char *a2, ...)
{
  return _[a1 sendDetachNotification];
}

id objc_msgSend_sendUSBEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendUSBEvent:");
}

id objc_msgSend_sendWirelessEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendWirelessEvent:");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_serviceDescription(void *a1, const char *a2, ...)
{
  return _[a1 serviceDescription];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_serviceProtocol(void *a1, const char *a2, ...)
{
  return _[a1 serviceProtocol];
}

id objc_msgSend_serviceVersion(void *a1, const char *a2, ...)
{
  return _[a1 serviceVersion];
}

id objc_msgSend_setAccessoryInfo_forEndpointWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryInfo:forEndpointWithUUID:");
}

id objc_msgSend_setBuiltIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBuiltIn:");
}

id objc_msgSend_setCancelHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelHandler:");
}

id objc_msgSend_setConsumers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConsumers:");
}

id objc_msgSend_setCoreAnalyticsCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCoreAnalyticsCallback:");
}

id objc_msgSend_setCoverClosed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCoverClosed:");
}

id objc_msgSend_setCurrentInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentInterval:");
}

id objc_msgSend_setCurveIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurveIndex:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDecayStopDelta_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDecayStopDelta:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeltaMultiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeltaMultiplier:");
}

id objc_msgSend_setDestination_maxSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestination:maxSize:");
}

id objc_msgSend_setDeviceButtonState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceButtonState:");
}

id objc_msgSend_setDeviceMatching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceMatching:");
}

id objc_msgSend_setDeviceNotificationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceNotificationHandler:");
}

id objc_msgSend_setDeviceOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceOrientation:");
}

id objc_msgSend_setDisablingDeviceCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisablingDeviceCount:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setDisplayOff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayOff:");
}

id objc_msgSend_setDivingButtonState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDivingButtonState:");
}

id objc_msgSend_setDoubleValue_forField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoubleValue:forField:");
}

id objc_msgSend_setDragButtons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDragButtons:");
}

id objc_msgSend_setEventCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventCallback:");
}

id objc_msgSend_setEventDispatcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventDispatcher:");
}

id objc_msgSend_setFirmwareClicks_silentClick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirmwareClicks:silentClick:");
}

id objc_msgSend_setFirstSwitchFromInterpolatedCurve_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstSwitchFromInterpolatedCurve:");
}

id objc_msgSend_setFirstSwitchFromInterpolatedCurveInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstSwitchFromInterpolatedCurveInterval:");
}

id objc_msgSend_setFirstSwitchFromInterpolatedCurveMultiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstSwitchFromInterpolatedCurveMultiplier:");
}

id objc_msgSend_setFrameInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrameInterval:");
}

id objc_msgSend_setHostClickControl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHostClickControl:");
}

id objc_msgSend_setHostClickEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHostClickEnabled:");
}

id objc_msgSend_setInitialDelta_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialDelta:");
}

id objc_msgSend_setIntegerValue_forField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntegerValue:forField:");
}

id objc_msgSend_setInterpolationFrameInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterpolationFrameInterval:");
}

id objc_msgSend_setInterpolationMinFrameSkipsAtEndOfTail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterpolationMinFrameSkipsAtEndOfTail:");
}

id objc_msgSend_setMaxDecayTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxDecayTime:");
}

id objc_msgSend_setMinFrameSkipsAtEndOfTail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinFrameSkipsAtEndOfTail:");
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMode:");
}

id objc_msgSend_setMomentumBits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMomentumBits:");
}

id objc_msgSend_setMomentumState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMomentumState:");
}

id objc_msgSend_setMomentumTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMomentumTimer:");
}

id objc_msgSend_setMouseButtonFilterData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMouseButtonFilterData:");
}

id objc_msgSend_setMouseMotionFilterData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMouseMotionFilterData:");
}

id objc_msgSend_setNextInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNextInterval:");
}

id objc_msgSend_setNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotification:");
}

id objc_msgSend_setNotificationCenterActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationCenterActive:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setParserExternallyDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParserExternallyDisabled:");
}

id objc_msgSend_setPencilEventCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPencilEventCallback:");
}

id objc_msgSend_setPhysicalFrameInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhysicalFrameInterval:");
}

id objc_msgSend_setPlaying_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaying:");
}

id objc_msgSend_setPowerState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPowerState:");
}

id objc_msgSend_setPreferenceValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferenceValue:forKey:");
}

id objc_msgSend_setPreviousButtonState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousButtonState:");
}

id objc_msgSend_setProgress_dispatchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgress:dispatchEvent:");
}

id objc_msgSend_setProperty_forKey_client_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:client:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setRecording_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecording:");
}

id objc_msgSend_setRemoteAccessSocket_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteAccessSocket:");
}

id objc_msgSend_setResetRequestCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResetRequestCallback:");
}

id objc_msgSend_setResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResult:");
}

id objc_msgSend_setScreenOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenOrientation:");
}

id objc_msgSend_setScrollMomentumDispatchRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollMomentumDispatchRate:");
}

id objc_msgSend_setScrollMomentumEvent_interrupted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollMomentumEvent:interrupted:");
}

id objc_msgSend_setSignpostBeginTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignpostBeginTime:");
}

id objc_msgSend_setSignpost_begin_time_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignpost_begin_time:");
}

id objc_msgSend_setStdScrollPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStdScrollPhase:");
}

id objc_msgSend_setStopInterpolatingDefaultIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStopInterpolatingDefaultIndex:");
}

id objc_msgSend_setStopInterpolatingInfoSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStopInterpolatingInfoSet:");
}

id objc_msgSend_setStopInterpolatingTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStopInterpolatingTime:");
}

id objc_msgSend_setSubtype_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtype:");
}

id objc_msgSend_setSupportsDeepPress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsDeepPress:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setUseInterpolatedCurve_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseInterpolatedCurve:");
}

id objc_msgSend_setVirtualService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVirtualService:");
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return _[a1 sharedClient];
}

id objc_msgSend_shouldDispatchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldDispatchEvent:");
}

id objc_msgSend_shouldHandleTPSettings(void *a1, const char *a2, ...)
{
  return _[a1 shouldHandleTPSettings];
}

id objc_msgSend_signpostBeginTime(void *a1, const char *a2, ...)
{
  return _[a1 signpostBeginTime];
}

id objc_msgSend_signpost_begin_time(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signpost_begin_time");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_smoothCurveBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "smoothCurveBody:");
}

id objc_msgSend_smoothCurveTail_minFrameSkipsAtEndOfTail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "smoothCurveTail:minFrameSkipsAtEndOfTail:");
}

id objc_msgSend_stage_postedNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stage:postedNotification:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startMomentumTimerWithMomentumRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMomentumTimerWithMomentumRequest:");
}

id objc_msgSend_startMomentumWithSubtype_event_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMomentumWithSubtype:event:");
}

id objc_msgSend_startNotificationCenterMonitoring_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startNotificationCenterMonitoring:queue:");
}

id objc_msgSend_stats(void *a1, const char *a2, ...)
{
  return _[a1 stats];
}

id objc_msgSend_stdScrollPhase(void *a1, const char *a2, ...)
{
  return _[a1 stdScrollPhase];
}

id objc_msgSend_stockholmState(void *a1, const char *a2, ...)
{
  return _[a1 stockholmState];
}

id objc_msgSend_stopInterpolatingDefaultIndex(void *a1, const char *a2, ...)
{
  return _[a1 stopInterpolatingDefaultIndex];
}

id objc_msgSend_stopInterpolatingInfoSet(void *a1, const char *a2, ...)
{
  return _[a1 stopInterpolatingInfoSet];
}

id objc_msgSend_stopInterpolatingTime(void *a1, const char *a2, ...)
{
  return _[a1 stopInterpolatingTime];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_stuckTouchDetectorState(void *a1, const char *a2, ...)
{
  return _[a1 stuckTouchDetectorState];
}

id objc_msgSend_subtype(void *a1, const char *a2, ...)
{
  return _[a1 subtype];
}

id objc_msgSend_supportsDeepPress(void *a1, const char *a2, ...)
{
  return _[a1 supportsDeepPress];
}

id objc_msgSend_sync(void *a1, const char *a2, ...)
{
  return _[a1 sync];
}

id objc_msgSend_systemPowerState(void *a1, const char *a2, ...)
{
  return _[a1 systemPowerState];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_touchHand(void *a1, const char *a2, ...)
{
  return _[a1 touchHand];
}

id objc_msgSend_touchMode(void *a1, const char *a2, ...)
{
  return _[a1 touchMode];
}

id objc_msgSend_tpPreferences(void *a1, const char *a2, ...)
{
  return _[a1 tpPreferences];
}

id objc_msgSend_tpSettingsManager(void *a1, const char *a2, ...)
{
  return _[a1 tpSettingsManager];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return _[a1 transport];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unpublishCoreAccessoryService(void *a1, const char *a2, ...)
{
  return _[a1 unpublishCoreAccessoryService];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_updateFingerStats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFingerStats:");
}

id objc_msgSend_updateGestureConfiguration_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateGestureConfiguration:value:");
}

id objc_msgSend_updateScrollPhaseFor_anyScroll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateScrollPhaseFor:anyScroll:");
}

id objc_msgSend_usbChargingState(void *a1, const char *a2, ...)
{
  return _[a1 usbChargingState];
}

id objc_msgSend_useInterpolatedCurve(void *a1, const char *a2, ...)
{
  return _[a1 useInterpolatedCurve];
}

id objc_msgSend_vendorDefinedEvent_usagePage_usage_version_data_length_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vendorDefinedEvent:usagePage:usage:version:data:length:options:");
}

id objc_msgSend_virtualService(void *a1, const char *a2, ...)
{
  return _[a1 virtualService];
}

id objc_msgSend_wirelessChargingState(void *a1, const char *a2, ...)
{
  return _[a1 wirelessChargingState];
}

id objc_msgSend_wristState(void *a1, const char *a2, ...)
{
  return _[a1 wristState];
}