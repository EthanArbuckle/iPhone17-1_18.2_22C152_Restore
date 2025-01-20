@interface HSTTipOffsetFilter
- (BOOL)handleHSDecode:(void *)a3;
- (BOOL)handleHSEncode:(void *)a3;
- (HSTTipOffsetFilter)initWithConfig:(const HSTTipOffsetFilterConfig *)a3;
- (id).cxx_construct;
- (void)_handleContactFrame:(id)a3;
- (void)_handleScreenOrientationEvent:(id)a3;
- (void)_handleTouchHandEvent:(id)a3;
- (void)_handleWakeSystemEvent:(id)a3;
- (void)handleConsume:(id)a3;
@end

@implementation HSTTipOffsetFilter

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
    [(HSTTipOffsetFilter *)self _handleContactFrame:v4];
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
      [(HSTTipOffsetFilter *)self _handleWakeSystemEvent:v6];
    }
    else
    {
      id v8 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }

      if (v9)
      {
        [(HSTTipOffsetFilter *)self _handleScreenOrientationEvent:v8];
      }
      else
      {
        id v10 = v8;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }

        if (v11)
        {
          [(HSTTipOffsetFilter *)self _handleTouchHandEvent:v10];
        }
        else
        {
          v12.receiver = self;
          v12.super_class = (Class)HSTTipOffsetFilter;
          [(HSStage *)&v12 handleConsume:v10];
        }
      }
    }
  }
}

- (HSTTipOffsetFilter)initWithConfig:(const HSTTipOffsetFilterConfig *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HSTTipOffsetFilter;
  id v4 = [(HSStage *)&v8 init];
  id v5 = v4;
  if (v4)
  {
    v4->_config = *a3;
    id v6 = v4;
  }

  return v5;
}

- (void)_handleContactFrame:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HSTTipOffsetFilter.mm", 47, @"Invalid parameter not satisfying: %@", @"frame" object file lineNumber description];
  }
  int y = self->_config.tipOffset.y;
  int screenOrientation = self->_state.screenOrientation;
  if (self->_state.touchHand == 1) {
    int x = -self->_config.tipOffset.x;
  }
  else {
    int x = self->_config.tipOffset.x;
  }
  if (screenOrientation == 2) {
    int v9 = -x;
  }
  else {
    int v9 = x;
  }
  if (screenOrientation == 2) {
    int v10 = -y;
  }
  else {
    int v10 = self->_config.tipOffset.y;
  }
  if (screenOrientation == 3)
  {
    int v9 = -y;
    int v10 = x;
  }
  if (screenOrientation == 4)
  {
    int v9 = self->_config.tipOffset.y;
    int v11 = -x;
  }
  else
  {
    int v11 = v10;
  }
  uint64_t v12 = v5[6];
  uint64_t v13 = v5[7];
  while (v12 != v13)
  {
    int v14 = *(_DWORD *)(v12 + 20) + v11;
    *(_DWORD *)(v12 + 16) += v9;
    *(_DWORD *)(v12 + 20) = v14;
    v12 += 64;
  }
  v16.receiver = self;
  v16.super_class = (Class)HSTTipOffsetFilter;
  [(HSStage *)&v16 handleConsume:v5];
}

- (void)_handleWakeSystemEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HSTTipOffsetFilter.mm", 62, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  if (*((unsigned char *)v5 + 24))
  {
    int x = self->_config.tipOffset.x;
    int y = self->_config.tipOffset.y;
    int screenOrientation = self->_state.screenOrientation;
    if (self->_state.touchHand == 1) {
      int x = -x;
    }
    if (screenOrientation == 2) {
      int v9 = -x;
    }
    else {
      int v9 = x;
    }
    if (screenOrientation == 2) {
      int v10 = -y;
    }
    else {
      int v10 = self->_config.tipOffset.y;
    }
    if (screenOrientation == 3)
    {
      int v9 = -y;
      int v10 = x;
    }
    if (screenOrientation == 4)
    {
      int v11 = -x;
    }
    else
    {
      int y = v9;
      int v11 = v10;
    }
    v5[4] += y;
    v5[5] += v11;
  }
  if (*((unsigned char *)v5 + 40))
  {
    int v12 = self->_config.tipOffset.y;
    int v13 = self->_state.screenOrientation;
    if (self->_state.touchHand == 1) {
      int v14 = -self->_config.tipOffset.x;
    }
    else {
      int v14 = self->_config.tipOffset.x;
    }
    if (v13 == 2) {
      int v15 = -v14;
    }
    else {
      int v15 = v14;
    }
    if (v13 == 2) {
      int v16 = -v12;
    }
    else {
      int v16 = self->_config.tipOffset.y;
    }
    if (v13 == 3)
    {
      int v15 = -v12;
      int v16 = v14;
    }
    if (v13 == 4)
    {
      int v15 = self->_config.tipOffset.y;
      int v17 = -v14;
    }
    else
    {
      int v17 = v16;
    }
    v5[8] += v15;
    v5[9] += v17;
  }
  v19.receiver = self;
  v19.super_class = (Class)HSTTipOffsetFilter;
  [(HSStage *)&v19 handleConsume:v5];
}

- (void)_handleScreenOrientationEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HSTTipOffsetFilter.mm", 83, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  self->_state.int screenOrientation = [v5 screenOrientation];
  v7.receiver = self;
  v7.super_class = (Class)HSTTipOffsetFilter;
  [(HSStage *)&v7 handleConsume:v5];
}

- (void)_handleTouchHandEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HSTTipOffsetFilter.mm", 92, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  self->_state.touchHand = [v5 touchHand];
  v7.receiver = self;
  v7.super_class = (Class)HSTTipOffsetFilter;
  [(HSStage *)&v7 handleConsume:v5];
}

- (BOOL)handleHSEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 4);
  }
  HSUtil::Encoder::encodeCodable<HSTPipeline::Position const>((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)105,(char)112,(char)79,(char)102,(char)102,(char)115,(char)101,(char)116>::Key, (HSTPipeline::Position *)&self->_config);
  p_state = &self->_state;
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)99,(char)114,(char)101,(char)101,(char)110,(char)79,(char)114,(char)105,(char)101,(char)110,(char)116,(char)97,(char)116,(char)105,(char)111,(char)110>::Key, p_state->screenOrientation);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)111,(char)117,(char)99,(char)104,(char)72,(char)97,(char)110,(char)100>::Key, p_state->touchHand);
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a3);
  }
  return 1;
}

- (BOOL)handleHSDecode:(void *)a3
{
  v5.var0 = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&v5.var1 = 0xAAAAAAAAAAAAAAAALL;
  CoderKey v13 = v5;
  CoderKey v14 = v5;
  CoderKey v11 = v5;
  CoderKey v12 = v5;
  CoderKey v10 = v5;
  HSUtil::Decoder::decodeMap((unint64_t *)a3, (uint64_t)&v10);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTTipOffsetFilter.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTTipOffsetFilter handleHSDecode:].cold.4();
    }
LABEL_13:
    BOOL v7 = 0;
    goto LABEL_14;
  }
  HSUtil::Decoder::decodeCodable<HSTPipeline::Position>(&v10, (CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)105,(char)112,(char)79,(char)102,(char)102,(char)115,(char)101,(char)116>::Key, (HSTPipeline::Position *)&self->_config);
  if (LODWORD(v10.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTTipOffsetFilter.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTTipOffsetFilter handleHSDecode:]();
    }
    goto LABEL_13;
  }
  p_state = &self->_state;
  p_state->int screenOrientation = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v10, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)99,(char)114,(char)101,(char)101,(char)110,(char)79,(char)114,(char)105,(char)101,(char)110,(char)116,(char)97,(char)116,(char)105,(char)111,(char)110>::Key);
  if (LODWORD(v10.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTTipOffsetFilter.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTTipOffsetFilter handleHSDecode:]();
    }
    goto LABEL_13;
  }
  p_state->touchHand = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v10, (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)111,(char)117,(char)99,(char)104,(char)72,(char)97,(char)110,(char)100>::Key);
  if (LODWORD(v10.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTTipOffsetFilter.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTTipOffsetFilter handleHSDecode:]();
    }
    goto LABEL_13;
  }
  BOOL v7 = 1;
LABEL_14:
  if (v12.var0) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12.var0);
  }
  var0 = v11.var0;
  v11.var0 = 0;
  if (var0)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](var0);
    operator delete();
  }
  return v7;
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *((_WORD *)self + 64) = 0;
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