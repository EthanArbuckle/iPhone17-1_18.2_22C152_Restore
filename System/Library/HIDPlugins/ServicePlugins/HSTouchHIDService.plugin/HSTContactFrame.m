@interface HSTContactFrame
+ (const)hsClassName;
- (BOOL)decodeFromMap:(void *)a3;
- (BOOL)isTouching;
- (HSTContactFrame)init;
- (NSData)data;
- (id).cxx_construct;
- (id)contactAtIndex:(unint64_t)a3;
- (id)description;
- (id)metadata;
- (int64_t)firmwareTimestamp;
- (signed)imagePixels;
- (unint64_t)contactCount;
- (unint64_t)frameNumber;
- (unsigned)inputDetectionState;
- (void)_clear;
- (void)encodeToMap:(void *)a3;
- (void)setContactCount:(unint64_t)a3;
- (void)setData:(id)a3;
- (void)setFirmwareTimestamp:(int64_t)a3;
- (void)setFrameNumber:(unint64_t)a3;
- (void)setInputDetectionState:(unsigned int)a3;
@end

@implementation HSTContactFrame

- (NSData)data
{
  return self->super.data;
}

- (void)setData:(id)a3
{
}

- (unint64_t)frameNumber
{
  return self->frameNumber;
}

- (void)setFrameNumber:(unint64_t)a3
{
  self->frameNumber = a3;
}

- (int64_t)firmwareTimestamp
{
  return self->firmwareTimestamp;
}

- (void)setFirmwareTimestamp:(int64_t)a3
{
  self->firmwareTimestamp = a3;
}

- (unsigned)inputDetectionState
{
  return self->inputDetectionState;
}

- (void)setInputDetectionState:(unsigned int)a3
{
  self->inputDetectionState = a3;
}

- (unint64_t)contactCount
{
  return self->contacts.__end_ - self->contacts.__begin_;
}

- (void)setContactCount:(unint64_t)a3
{
}

- (id)contactAtIndex:(unint64_t)a3
{
  uint64_t v5 = objc_opt_new();
  objc_storeStrong((id *)(v5 + 8), self);
  *(void *)(v5 + 16) = a3;

  return (id)v5;
}

- (id)metadata
{
  v3 = (id *)objc_opt_new();
  objc_storeStrong(v3 + 1, self);

  return v3;
}

- (HSTContactFrame)init
{
  v6.receiver = self;
  v6.super_class = (Class)HSTContactFrame;
  v2 = [(HSTFrame *)&v6 init];
  v3 = v2;
  if (v2)
  {
    std::vector<HSTPipeline::Contact>::reserve((void **)&v2->contacts.__begin_, 0xAuLL);
    v4 = v3;
  }

  return v3;
}

- (id)description
{
  v3 = objc_opt_new();
  begin = self->contacts.__begin_;
  for (i = self->contacts.__end_; begin != i; ++begin)
  {
    objc_super v6 = +[NSString stringWithFormat:@"HSTContact{ID:%u,Stage:%u,Finger:%u,Flags:0x%08llX}", begin->contactID, begin->stage, begin->finger, begin->flags];
    [v3 appendFormat:@"%@,", v6];
  }
  v7 = +[NSString stringWithFormat:@"<HSTContactFrame contacts: %@>", v3];

  return v7;
}

- (BOOL)isTouching
{
  begin = self->contacts.__begin_;
  end = self->contacts.__end_;
  if (begin == end) {
    return 0;
  }
  v4 = begin + 1;
  do
  {
    unsigned int v5 = v4[-1].stage - 3;
    BOOL result = v5 < 2;
  }
  while (v5 >= 2 && v4++ != end);
  return result;
}

- (signed)imagePixels
{
  if (self->metadata.image.__engaged_) {
    return (signed __int16 *)((char *)[(NSData *)self->super.data bytes]
  }
                            + self->metadata.image.var0.__val_.dataOffset);
  else {
    return 0;
  }
}

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)67,(char)111,(char)110,(char)116,(char)97,(char)99,(char)116,(char)70,(char)114,(char)97,(char)109,(char)101>::Key;
}

- (void)encodeToMap:(void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HSTContactFrame;
  -[HSTFrame encodeToMap:](&v9, "encodeToMap:");
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)102,(char)114,(char)97,(char)109,(char)101,(char)78,(char)117,(char)109,(char)98,(char)101,(char)114>::Key, self->frameNumber);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)102,(char)105,(char)114,(char)109,(char)119,(char)97,(char)114,(char)101,(char)84,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key, self->firmwareTimestamp);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)105,(char)110,(char)112,(char)117,(char)116,(char)68,(char)101,(char)116,(char)101,(char)99,(char)116,(char)105,(char)111,(char)110,(char)83,(char)116,(char)97,(char)116,(char)101>::Key, self->inputDetectionState);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)100,(char)101,(char)118,(char)105,(char)99,(char)101,(char)79,(char)112,(char)101,(char)114,(char)97,(char)116,(char)105,(char)110,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101>::Key, self->deviceOperatingState);
  HSUtil::Encoder::encodeArrayStart((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)99,(char)111,(char)110,(char)116,(char)97,(char)99,(char)116,(char)115>::Key, 2u);
  begin = self->contacts.__begin_;
  end = self->contacts.__end_;
  int v7 = *(_DWORD *)a3;
  while (begin != end)
  {
    if (!v7)
    {
      char v8 = HSTPipeline::Contact::encode((HSTPipeline::Contact *)begin, (HSUtil::Encoder *)a3);
      int v7 = *(_DWORD *)a3;
      if (!*(_DWORD *)a3 && (v8 & 1) == 0)
      {
        int v7 = 10;
        *(_DWORD *)a3 = 10;
      }
    }
    ++begin;
  }
  if (!v7) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a3);
  }
  HSUtil::Encoder::encodeCodable<HSTContactFrameMetadata>((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)101,(char)116,(char)97,(char)100,(char)97,(char)116,(char)97>::Key, &self->metadata);
}

- (BOOL)decodeFromMap:(void *)a3
{
  v46.receiver = self;
  v46.super_class = (Class)HSTContactFrame;
  if (!-[HSTFrame decodeFromMap:](&v46, "decodeFromMap:"))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrame.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTContactFrame decodeFromMap:]();
    }
    return 0;
  }
  [(HSTContactFrame *)self _clear];
  HSUtil::Decoder::setOffset((HSUtil::Decoder *)a3, 0);
  while (1)
  {
    unint64_t v5 = HSUtil::Decoder::decodeKey((HSUtil::Decoder *)a3);
    if (*(_DWORD *)a3) {
      break;
    }
    if (v5 == HSUtil::CoderKey::Literal<(char)102,(char)114,(char)97,(char)109,(char)101,(char)78,(char)117,(char)109,(char)98,(char)101,(char)114>::Key)
    {
      objc_super v6 = (objc_class *)HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3);
      uint64_t v7 = 24;
LABEL_13:
      *(Class *)((char *)&self->super.super.isa + v7) = v6;
      goto LABEL_17;
    }
    if (v5 == HSUtil::CoderKey::Literal<(char)102,(char)105,(char)114,(char)109,(char)119,(char)97,(char)114,(char)101,(char)84,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112>::Key)
    {
      objc_super v6 = (objc_class *)HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3);
      uint64_t v7 = 32;
      goto LABEL_13;
    }
    if (v5 == HSUtil::CoderKey::Literal<(char)105,(char)110,(char)112,(char)117,(char)116,(char)68,(char)101,(char)116,(char)101,(char)99,(char)116,(char)105,(char)111,(char)110,(char)83,(char)116,(char)97,(char)116,(char)101>::Key)
    {
      int v8 = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3);
      uint64_t v9 = 40;
    }
    else
    {
      if (v5 != HSUtil::CoderKey::Literal<(char)100,(char)101,(char)118,(char)105,(char)99,(char)101,(char)79,(char)112,(char)101,(char)114,(char)97,(char)116,(char)105,(char)110,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101>::Key)
      {
        if (v5 == HSUtil::CoderKey::Literal<(char)99,(char)111,(char)110,(char)116,(char)97,(char)99,(char)116,(char)115>::Key)
        {
          *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v44 = v10;
          long long v45 = v10;
          long long v42 = v10;
          long long v43 = v10;
          long long v41 = v10;
          HSUtil::Decoder::decodeArray((HSUtil::Decoder *)a3, (uint64_t)&v41);
          while (1)
          {
            long long v40 = 0xFFFFFFFFFFFFFFFFLL;
            *(_DWORD *)&v39[8] = -1431655936;
            DWORD1(v40) = 0;
            long long v38 = 0xAAAAAAAA00000000;
            *(void *)v39 = 0;
            memset(&v39[12], 0, 20);
            HSUtil::Decoder::decodeCodable<HSTPipeline::Contact>((int *)&v41, (HSTPipeline::Contact *)&v38);
            if (v41) {
              break;
            }
            p_contacts = &self->contacts;
            end = self->contacts.__end_;
            value = self->contacts.__end_cap_.__value_;
            if (end >= value)
            {
              uint64_t v18 = end - p_contacts->__begin_;
              unint64_t v19 = v18 + 1;
              if ((unint64_t)(v18 + 1) >> 58) {
                std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v20 = (char *)value - (char *)p_contacts->__begin_;
              if (v20 >> 5 > v19) {
                unint64_t v19 = v20 >> 5;
              }
              if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFC0) {
                unint64_t v21 = 0x3FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v21 = v19;
              }
              if (v21) {
                v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HSTPipeline::Contact>>((uint64_t)&self->contacts.__end_cap_, v21);
              }
              else {
                v22 = 0;
              }
              v23 = &v22[64 * v18];
              long long v24 = v38;
              long long v25 = *(_OWORD *)v39;
              long long v26 = v40;
              *((_OWORD *)v23 + 2) = *(_OWORD *)&v39[16];
              *((_OWORD *)v23 + 3) = v26;
              *(_OWORD *)v23 = v24;
              *((_OWORD *)v23 + 1) = v25;
              begin = p_contacts->__begin_;
              v27 = self->contacts.__end_;
              v29 = (Contact *)v23;
              if (v27 != p_contacts->__begin_)
              {
                do
                {
                  long long v30 = *(_OWORD *)&v27[-1].contactID;
                  long long v31 = *(_OWORD *)&v27[-1].position.x;
                  long long v32 = *(_OWORD *)&v27[-1].azimuth;
                  *(_OWORD *)&v29[-1].velocity.y = *(_OWORD *)&v27[-1].velocity.y;
                  *(_OWORD *)&v29[-1].azimuth = v32;
                  *(_OWORD *)&v29[-1].contactID = v30;
                  *(_OWORD *)&v29[-1].position.x = v31;
                  --v29;
                  --v27;
                }
                while (v27 != begin);
                v27 = p_contacts->__begin_;
              }
              v17 = (Contact *)(v23 + 64);
              p_contacts->__begin_ = v29;
              self->contacts.__end_ = (Contact *)(v23 + 64);
              self->contacts.__end_cap_.__value_ = (Contact *)&v22[64 * v21];
              if (v27) {
                operator delete(v27);
              }
            }
            else
            {
              long long v14 = v38;
              long long v15 = *(_OWORD *)v39;
              long long v16 = v40;
              *(_OWORD *)&end->velocity.y = *(_OWORD *)&v39[16];
              *(_OWORD *)&end->azimuth = v16;
              *(_OWORD *)&end->contactID = v14;
              *(_OWORD *)&end->position.x = v15;
              v17 = end + 1;
            }
            self->contacts.__end_ = v17;
          }
          if (v41 == 3)
          {
            char v33 = 1;
          }
          else
          {
            memset(__b, 170, sizeof(__b));
            v34 = basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrame.mm", __b);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315906;
              v48 = "-[HSTContactFrame decodeFromMap:]";
              __int16 v49 = 2080;
              v50 = v34;
              __int16 v51 = 2048;
              uint64_t v52 = 268;
              __int16 v53 = 2080;
              v54 = "contactsArray";
              _os_log_error_impl(&def_411C8, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", buf, 0x2Au);
            }
            char v33 = 0;
          }
          if ((void)v43) {
            std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v43);
          }
          v35 = (void *)v42;
          *(void *)&long long v42 = 0;
          if (v35)
          {
            std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v35);
            operator delete();
          }
          if ((v33 & 1) == 0) {
            return 0;
          }
        }
        else if (v5 == HSUtil::CoderKey::Literal<(char)109,(char)101,(char)116,(char)97,(char)100,(char)97,(char)116,(char)97>::Key)
        {
          HSUtil::Decoder::decodeCodable<HSTContactFrameMetadata>((int *)a3, &self->metadata);
        }
        else
        {
          HSUtil::Decoder::skipElement((unint64_t *)a3);
        }
        goto LABEL_17;
      }
      int v8 = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3);
      uint64_t v9 = 44;
    }
    *(_DWORD *)((char *)&self->super.super.isa + v9) = v8;
LABEL_17:
    if (*(_DWORD *)a3)
    {
      memset(__b, 170, sizeof(__b));
      basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrame.mm", __b);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[HSTContactFrame decodeFromMap:]();
      }
      return 0;
    }
  }
  if (*(_DWORD *)a3 == 3) {
    return 1;
  }
  memset(__b, 170, sizeof(__b));
  basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrame.mm", __b);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    -[HSTContactFrame decodeFromMap:]();
  }
  return 0;
}

- (void)_clear
{
  self->frameNumber = 0;
  self->firmwareTimestamp = 0;
  self->inputDetectionState = 0;
  self->deviceOperatingState = 0;
  self->contacts.__end_ = self->contacts.__begin_;
  self->metadata.surfaceSize.var0.__null_state_ = 0;
  self->metadata.surfaceSize.__engaged_ = 0;
  self->metadata.image.var0.__null_state_ = 0;
  self->metadata.image.__engaged_ = 0;
  self->metadata.tritium.var0.__null_state_ = 0;
  LOBYTE(self->metadata.tritium.var0.__val_.initialToCurrentFrameDeltaMs) = 0;
  self->metadata.tritium.__engaged_ = 0;
  self->metadata.buttonState.var0.__null_state_ = 0;
}

- (void).cxx_destruct
{
  p_contacts = &self->contacts;
  begin = self->contacts.__begin_;
  if (begin)
  {
    p_contacts->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 6) = 0;
  *((unsigned char *)self + 72) = 0;
  *((unsigned char *)self + 80) = 0;
  *((unsigned char *)self + 88) = 0;
  *((unsigned char *)self + 104) = 0;
  *((unsigned char *)self + 112) = 0;
  *((unsigned char *)self + 120) = 0;
  *((unsigned char *)self + 124) = 0;
  *((unsigned char *)self + 128) = 0;
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

@end