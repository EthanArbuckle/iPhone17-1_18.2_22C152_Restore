@interface HSPlaybackStageProgressEvent
+ (const)hsClassName;
- (BOOL)hsDecode:(void *)a3;
- (BOOL)hsEncode:(void *)a3;
- (id).cxx_construct;
@end

@implementation HSPlaybackStageProgressEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)80,(char)108,(char)97,(char)121,(char)98,(char)97,(char)99,(char)107,(char)83,(char)116,(char)97,(char)103,(char)101,(char)80,(char)114,(char)111,(char)103,(char)114,(char)101,(char)115,(char)115,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (BOOL)hsEncode:(void *)a3
{
  v9 = self;
  SEL v8 = a2;
  v7 = (HSUtil::Encoder *)a3;
  HSUtil::Encoder::encodeArrayStart((HSUtil::Coder *)a3, 4u);
  v6[1] = &v9->datas;
  v6[0] = std::vector<std::unique_ptr<EncoderState>>::begin[abi:ne180100]((uint64_t *)&v9->datas);
  uint64_t v5 = std::vector<std::unique_ptr<EncoderState>>::end[abi:ne180100]((uint64_t)&v9->datas);
  while (std::operator!=[abi:ne180100]<std::unique_ptr<EncoderState> *>((uint64_t)v6, (uint64_t)&v5))
  {
    id location = *(id *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)v6);
    HSUtil::Encoder::encodeObject(v7, (objc_object *)location);
    objc_storeStrong(&location, 0);
    std::__wrap_iter<std::unique_ptr<EncoderState> *>::operator++[abi:ne180100](v6);
  }
  HSUtil::Encoder::encodeObjectStop(v7);
  return 1;
}

- (BOOL)hsDecode:(void *)a3
{
  v17 = self;
  SEL v16 = a2;
  v15 = (HSUtil::Coder *)a3;
  HSUtil::Decoder::decodeArray((HSUtil::Decoder *)a3, (uint64_t)v14);
  if (HSUtil::Coder::ok(v15))
  {
    do
    {
      id location = HSUtil::Decoder::decodeObject((HSUtil::Decoder *)v14);
      if (HSUtil::Coder::end((HSUtil::Coder *)v14))
      {
        int v9 = 2;
      }
      else
      {
        BOOL v7 = 0;
        BOOL v7 = HSUtil::Coder::ok((HSUtil::Coder *)v14);
        if (v7)
        {
          std::vector<objc_object * {__strong}>::push_back[abi:ne180100]((uint64_t *)&v17->datas, &location);
          int v9 = 0;
        }
        else
        {
          v6 = 0;
          v6 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSPlaybackStage.mm", v20);
          os_log_t v5 = &_os_log_default;
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            v4 = v5;
            __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v19, (uint64_t)"-[HSPlaybackStageProgressEvent hsDecode:]", (uint64_t)v6, 26, (uint64_t)"array");
            _os_log_error_impl(&def_411C8, v4, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v19, 0x2Au);
          }
          objc_storeStrong((id *)&v5, 0);
          char v18 = 0;
          int v9 = 1;
        }
      }
      objc_storeStrong(&location, 0);
    }
    while (!v9);
    if (v9 == 2)
    {
      char v18 = 1;
      int v9 = 1;
    }
  }
  else
  {
    v12 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSPlaybackStage.mm", v22);
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v21, (uint64_t)"-[HSPlaybackStageProgressEvent hsDecode:]", (uint64_t)v12, 21, (uint64_t)"coder");
      _os_log_error_impl(&def_411C8, oslog, type, "Assertion failed (%s @ %s:%ju): %s", v21, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    char v18 = 0;
    int v9 = 1;
  }
  HSUtil::Decoder::~Decoder((HSUtil::Decoder *)v14);
  return v18 & 1;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end