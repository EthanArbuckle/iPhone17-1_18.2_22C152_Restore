@interface HSTContactStabilizer
- (BOOL)handleHSDecode:(void *)a3;
- (BOOL)handleHSEncode:(void *)a3;
- (HSTContactStabilizer)initWithConfig:(const HSTContactStabilizerConfig *)a3;
- (id).cxx_construct;
- (void)_handleContactFrame:(id)a3;
- (void)_handleResetEvent:(id)a3;
- (void)handleConsume:(id)a3;
@end

@implementation HSTContactStabilizer

- (void)handleConsume:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    [(HSTContactStabilizer *)self _handleContactFrame:v4];
  }
  else
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    if (v7)
    {
      [(HSTContactStabilizer *)self _handleResetEvent:v6];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)HSTContactStabilizer;
      [(HSStage *)&v8 handleConsume:v6];
    }
  }
}

- (HSTContactStabilizer)initWithConfig:(const HSTContactStabilizerConfig *)a3
{
  v32.receiver = self;
  v32.super_class = (Class)HSTContactStabilizer;
  id v4 = [(HSStage *)&v32 init];
  id v5 = (HSTContactStabilizer *)v4;
  if (v4)
  {
    uint64_t v6 = 0;
    id v7 = v4 + 120;
    *(_OWORD *)(v4 + 120) = *(_OWORD *)&a3->excessiveEccentricity.min;
    long long v9 = *(_OWORD *)&a3->unstableDeltaRadius.gain;
    long long v8 = *(_OWORD *)&a3->endLongtermZAreaInit;
    long long v10 = *(_OWORD *)&a3->excessiveMinorRadius.min;
    *((_DWORD *)v4 + 46) = a3->hysteresisRadius;
    *(_OWORD *)(v4 + 152) = v9;
    *(_OWORD *)(v4 + 168) = v8;
    *(_OWORD *)(v4 + 136) = v10;
    v11 = (void **)(v4 + 192);
    v12 = v4 + 208;
    v13 = (char *)*((void *)v4 + 25);
    do
    {
      if ((unint64_t)v13 >= *v12)
      {
        unint64_t v14 = 0x8E38E38E38E38E39 * ((v13 - (unsigned char *)*v11) >> 4);
        unint64_t v15 = v14 + 1;
        if (v14 + 1 > 0x1C71C71C71C71C7) {
          std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
        }
        if (0x1C71C71C71C71C72 * ((uint64_t)(*v12 - (void)*v11) >> 4) > v15) {
          unint64_t v15 = 0x1C71C71C71C71C72 * ((uint64_t)(*v12 - (void)*v11) >> 4);
        }
        if (0x8E38E38E38E38E39 * ((uint64_t)(*v12 - (void)*v11) >> 4) >= 0xE38E38E38E38E3) {
          unint64_t v16 = 0x1C71C71C71C71C7;
        }
        else {
          unint64_t v16 = v15;
        }
        if (v16) {
          v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MTForceBehavior_>>((uint64_t)&v5->_stabilizers.__end_cap_, v16);
        }
        else {
          v17 = 0;
        }
        v18 = &v17[144 * v14];
        *(void *)v18 = 0;
        *((void *)v18 + 1) = 0;
        *((void *)v18 + 2) = v7;
        *((_DWORD *)v18 + 6) = 0;
        *((void *)v18 + 4) = v7;
        v18[40] = 0;
        v18[64] = 0;
        v18[72] = 0;
        v18[96] = 0;
        v18[104] = 0;
        v18[112] = 0;
        *((void *)v18 + 15) = 0;
        *((_DWORD *)v18 + 32) = 0;
        *((_WORD *)v18 + 68) = 0;
        v20 = (ContactStabilizer *)*v11;
        end = v5->_stabilizers.__end_;
        v21 = v18;
        if (end != *v11)
        {
          do
          {
            *((_OWORD *)v21 - 9) = *((_OWORD *)end - 9);
            long long v22 = *((_OWORD *)end - 8);
            long long v23 = *((_OWORD *)end - 7);
            long long v24 = *((_OWORD *)end - 5);
            *((_OWORD *)v21 - 6) = *((_OWORD *)end - 6);
            *((_OWORD *)v21 - 5) = v24;
            *((_OWORD *)v21 - 8) = v22;
            *((_OWORD *)v21 - 7) = v23;
            long long v25 = *((_OWORD *)end - 4);
            long long v26 = *((_OWORD *)end - 3);
            long long v27 = *((_OWORD *)end - 1);
            *((_OWORD *)v21 - 2) = *((_OWORD *)end - 2);
            *((_OWORD *)v21 - 1) = v27;
            *((_OWORD *)v21 - 4) = v25;
            *((_OWORD *)v21 - 3) = v26;
            v21 -= 144;
            end = (ContactStabilizer *)((char *)end - 144);
          }
          while (end != v20);
          end = (ContactStabilizer *)*v11;
        }
        v13 = v18 + 144;
        *v11 = v21;
        v5->_stabilizers.__end_ = (ContactStabilizer *)(v18 + 144);
        v5->_stabilizers.__end_cap_.__value_ = (ContactStabilizer *)&v17[144 * v16];
        if (end) {
          operator delete(end);
        }
      }
      else
      {
        *(void *)v13 = 0;
        *((void *)v13 + 1) = 0;
        *((void *)v13 + 2) = v7;
        *((_DWORD *)v13 + 6) = 0;
        *((void *)v13 + 4) = v7;
        v13[40] = 0;
        *(_OWORD *)(v13 + 41) = *(_OWORD *)v34;
        *((void *)v13 + 7) = *(void *)&v34[15];
        v13[64] = 0;
        v13[72] = 0;
        *(_OWORD *)(v13 + 73) = *(_OWORD *)v33;
        *((void *)v13 + 11) = *(void *)&v33[15];
        v13[96] = 0;
        v13[104] = 0;
        v13[112] = 0;
        *((void *)v13 + 15) = 0;
        *((_DWORD *)v13 + 32) = 0;
        *((_WORD *)v13 + 68) = 0;
        v13 += 144;
      }
      v5->_stabilizers.__end_ = (ContactStabilizer *)v13;
      ++v6;
    }
    while (v6 != 32);
    uint64_t v28 = objc_opt_new();
    stats = v5->_stats;
    v5->_stats = (HSTContactStabilizerStats *)v28;

    v30 = v5;
  }

  return v5;
}

- (void)_handleContactFrame:(id)a3
{
  id v5 = (uint64_t *)a3;
  if (!v5)
  {
    v29 = +[NSAssertionHandler currentHandler];
    [v29 handleFailureInMethod:a2, self, @"HSTContactStabilizer.mm", 611, @"Invalid parameter not satisfying: %@", @"frame" object file lineNumber description];
  }
  self->_stats->contacts.__end_ = self->_stats->contacts.__begin_;
  self->_stats->hysteresisRadius = self->_config.hysteresisRadius;
  uint64_t v6 = (const Contact *)v5[6];
  objc_super v32 = (unsigned __int8 *)v5[7];
  if (v6 == (const Contact *)v32)
  {
LABEL_25:
    v34.receiver = self;
    v34.super_class = (Class)HSTContactStabilizer;
    [(HSStage *)&v34 handleConsume:v5];
    stats = self->_stats;
    v33.receiver = self;
    v33.super_class = (Class)HSTContactStabilizer;
    [(HSStage *)&v33 handleConsume:stats];
  }
  else
  {
    v30 = self;
    p_stabilizers = &self->_stabilizers;
    while (0x8E38E38E38E38E39 * ((p_stabilizers->__end_ - p_stabilizers->__begin_) >> 4) > v6->contactID)
    {
      uint64_t v7 = (uint64_t)p_stabilizers->__begin_ + 144 * v6->contactID;
      long long v8 = v5;
      ContactStabilizer::update((ContactStabilizer *)v7, v5[4], v6);
      long long v9 = self->_stats;
      unsigned __int8 contactID = v6->contactID;
      Position position = v6->position;
      Position v12 = *(Position *)v7;
      uint64_t v13 = *(void *)(v7 + 8);
      end = v9->contacts.__end_;
      value = v9->contacts.__end_cap_.__value_;
      if (end >= value)
      {
        begin = v9->contacts.__begin_;
        uint64_t v18 = 0x6DB6DB6DB6DB6DB7 * ((end - begin) >> 2);
        unint64_t v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) > 0x924924924924924) {
          std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v20 = 0x6DB6DB6DB6DB6DB7 * ((value - begin) >> 2);
        if (2 * v20 > v19) {
          unint64_t v19 = 2 * v20;
        }
        if (v20 >= 0x492492492492492) {
          unint64_t v21 = 0x924924924924924;
        }
        else {
          unint64_t v21 = v19;
        }
        if (v21) {
          long long v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<StatContact>>((uint64_t)&v9->contacts.__end_cap_, v21);
        }
        else {
          long long v22 = 0;
        }
        long long v23 = &v22[28 * v18];
        *long long v23 = contactID;
        *(Position *)(v23 + 4) = position;
        *(Position *)(v23 + 12) = v12;
        *(void *)(v23 + 20) = v13;
        long long v25 = v9->contacts.__begin_;
        long long v24 = v9->contacts.__end_;
        long long v26 = (StatContact *)v23;
        id v5 = v8;
        if (v24 == v25)
        {
          self = v30;
        }
        else
        {
          self = v30;
          do
          {
            long long v27 = *(_OWORD *)((char *)v24 - 28);
            *((_OWORD *)v26 - 1) = *((_OWORD *)v24 - 1);
            *(_OWORD *)((char *)v26 - 28) = v27;
            long long v26 = (StatContact *)((char *)v26 - 28);
            long long v24 = (StatContact *)((char *)v24 - 28);
          }
          while (v24 != v25);
          long long v24 = v9->contacts.__begin_;
        }
        unint64_t v16 = (StatContact *)(v23 + 28);
        v9->contacts.__begin_ = v26;
        v9->contacts.__end_ = (StatContact *)(v23 + 28);
        v9->contacts.__end_cap_.__value_ = (StatContact *)&v22[28 * v21];
        if (v24) {
          operator delete(v24);
        }
      }
      else
      {
        *(unsigned char *)end = contactID;
        *(Position *)((char *)end + 4) = position;
        *(Position *)((char *)end + 12) = v12;
        unint64_t v16 = (StatContact *)((char *)end + 28);
        *(void *)((char *)end + 20) = v13;
        id v5 = v8;
        self = v30;
      }
      v9->contacts.__end_ = v16;
      v6->Position position = *(Position *)v7;
      if (++v6 == (const Contact *)v32) {
        goto LABEL_25;
      }
    }
  }
}

- (void)_handleResetEvent:(id)a3
{
  id v4 = a3;
  begin = self->_stabilizers.__begin_;
  end = self->_stabilizers.__end_;
  while (begin != end)
  {
    if (*((unsigned char *)begin + 64)) {
      *((unsigned char *)begin + 64) = 0;
    }
    if (*((unsigned char *)begin + 96)) {
      *((unsigned char *)begin + 96) = 0;
    }
    *((_DWORD *)begin + 6) = 0;
    *((_WORD *)begin + 68) = 0;
    *(void *)begin = 0;
    *((void *)begin + 1) = 0;
    begin = (ContactStabilizer *)((char *)begin + 144);
  }
  v7.receiver = self;
  v7.super_class = (Class)HSTContactStabilizer;
  [(HSStage *)&v7 handleConsume:v4];
}

- (BOOL)handleHSEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 4);
  }
  HSUtil::Encoder::encodeCodable<HSTContactStabilizerConfig>((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)99,(char)111,(char)110,(char)102,(char)105,(char)103>::Key, &self->_config);
  HSUtil::Encoder::encodeArrayStart((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)116,(char)97,(char)98,(char)105,(char)108,(char)105,(char)122,(char)101,(char)114,(char)115>::Key, 4u);
  p_stabilizers = &self->_stabilizers;
  begin = self->_stabilizers.__begin_;
  end = p_stabilizers->__end_;
  int v8 = *(_DWORD *)a3;
  while (begin != end)
  {
    if (!v8)
    {
      char v9 = ContactStabilizer::encode(begin, (HSUtil::Encoder *)a3);
      int v8 = *(_DWORD *)a3;
      if (!*(_DWORD *)a3 && (v9 & 1) == 0)
      {
        int v8 = 10;
        *(_DWORD *)a3 = 10;
      }
    }
    begin = (ContactStabilizer *)((char *)begin + 144);
  }
  if (!v8)
  {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a3);
    if (!*(_DWORD *)a3) {
      HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a3);
    }
  }
  return 1;
}

- (BOOL)handleHSDecode:(void *)a3
{
  v5.var0 = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&v5.var1 = 0xAAAAAAAAAAAAAAAALL;
  CoderKey v22 = v5;
  CoderKey v23 = v5;
  CoderKey v20 = v5;
  CoderKey v21 = v5;
  CoderKey v19 = v5;
  HSUtil::Decoder::decodeMap((unint64_t *)a3, (uint64_t)&v19);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTContactStabilizer handleHSDecode:].cold.4();
    }
LABEL_7:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  HSUtil::Decoder::decodeCodable<HSTContactStabilizerConfig>(&v19, (CoderKey *)HSUtil::CoderKey::Literal<(char)99,(char)111,(char)110,(char)102,(char)105,(char)103>::Key, &self->_config);
  if (LODWORD(v19.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTContactStabilizer handleHSDecode:]();
    }
    goto LABEL_7;
  }
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v17 = v9;
  long long v18 = v9;
  long long v15 = v9;
  long long v16 = v9;
  long long v14 = v9;
  HSUtil::Decoder::decodeArray(&v19, (CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)116,(char)97,(char)98,(char)105,(char)108,(char)105,(char)122,(char)101,(char)114,(char)115>::Key, (uint64_t)&v14);
  if (LODWORD(v19.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTContactStabilizer handleHSDecode:]();
    }
  }
  else
  {
    p_stabilizers = &self->_stabilizers;
    begin = self->_stabilizers.__begin_;
    end = p_stabilizers->__end_;
    while (1)
    {
      if (begin == end)
      {
        BOOL v6 = 1;
        goto LABEL_26;
      }
      if (*((unsigned char *)begin + 64)) {
        *((unsigned char *)begin + 64) = 0;
      }
      if (*((unsigned char *)begin + 96)) {
        *((unsigned char *)begin + 96) = 0;
      }
      *((_DWORD *)begin + 6) = 0;
      *((_WORD *)begin + 68) = 0;
      *(void *)begin = 0;
      *((void *)begin + 1) = 0;
      HSUtil::Decoder::decodeCodable<ContactStabilizer>((int *)&v14, begin);
      if ((int)v14 >= 5) {
        break;
      }
      begin = (ContactStabilizer *)((char *)begin + 144);
    }
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTContactStabilizer.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTContactStabilizer handleHSDecode:]();
    }
  }
  BOOL v6 = 0;
LABEL_26:
  if ((void)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v16);
  }
  uint64_t v13 = (void *)v15;
  *(void *)&long long v15 = 0;
  if (v13)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v13);
    operator delete();
  }
LABEL_8:
  if (v21.var0) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v21.var0);
  }
  var0 = v20.var0;
  v20.var0 = 0;
  if (var0)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](var0);
    operator delete();
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stats, 0);
  begin = self->_stabilizers.__begin_;
  if (begin)
  {
    self->_stabilizers.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 22) = 0;
  *((_DWORD *)self + 46) = 0;
  *((void *)self + 25) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 24) = 0;
  return self;
}

- (void)handleHSDecode:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHSDecode:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHSDecode:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHSDecode:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

@end