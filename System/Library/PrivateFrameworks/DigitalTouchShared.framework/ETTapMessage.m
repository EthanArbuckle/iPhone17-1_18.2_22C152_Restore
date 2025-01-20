@interface ETTapMessage
+ (unsigned)messageType;
- (BOOL)reachedSizeLimit;
- (CGPoint)pointAtIndex:(unint64_t)a3;
- (ETTapMessage)init;
- (ETTapMessage)initWithArchiveData:(id)a3;
- (double)messageDuration;
- (double)timeDeltaAtIndex:(unint64_t)a3;
- (id).cxx_construct;
- (id)_animateCircleInner0:(double)a3 inner1:(double)a4 outer0:(double)a5 outer1:(double)a6 duration:(double)a7;
- (id)archiveData;
- (id)messageTypeAsString;
- (unint64_t)tapCount;
- (void)_displayInScene:(id)a3 point:(CGPoint)a4 color:(id)a5 filled:(BOOL)a6 withWisp:(BOOL)a7;
- (void)addTapAtPoint:(CGPoint)a3 time:(double)a4 color:(id)a5;
- (void)displayInScene:(id)a3;
- (void)preVisualizeInScene:(id)a3;
@end

@implementation ETTapMessage

+ (unsigned)messageType
{
  return 0;
}

- (ETTapMessage)init
{
  v8.receiver = self;
  v8.super_class = (Class)ETTapMessage;
  v2 = [(ETMessage *)&v8 init];
  v3 = v2;
  if (v2)
  {
    preVisualizeScene = v2->_preVisualizeScene;
    v2->_preVisualizeScene = 0;

    v3->_baseTime = -1.0;
  }
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  colors = v3->_colors;
  v3->_colors = (NSMutableArray *)v5;

  return v3;
}

- (ETTapMessage)initWithArchiveData:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  v64.receiver = self;
  v64.super_class = (Class)ETTapMessage;
  id v62 = a3;
  v3 = -[ETMessage initWithArchiveData:](&v64, sel_initWithArchiveData_);
  v4 = v3;
  if (!v3) {
    goto LABEL_57;
  }
  v3->_noiseFieldLock._os_unfair_lock_opaque = 0;
  uint64_t v5 = [[ETPTap alloc] initWithData:v62];
  v6 = v5;
  if (!v5) {
    goto LABEL_58;
  }
  v53 = v5;
  id v60 = [(ETPTap *)v5 timeDeltas];
  id v54 = [(ETPTap *)v6 points];
  id v55 = [(ETPTap *)v6 colors];
  unint64_t v7 = [v60 length];
  unint64_t v8 = [v54 length];
  unint64_t v9 = [v55 length];
  id v59 = v60;
  uint64_t v63 = [v59 bytes];
  id v58 = v54;
  uint64_t v10 = [v58 bytes];
  id v57 = v55;
  uint64_t v61 = [v57 bytes];
  unint64_t v56 = v7 >> 1;
  unint64_t v52 = v8 >> 2;
  if (v7 >> 1 == v8 >> 2)
  {
    if (v7 < 0x2A)
    {
      uint64_t v13 = v7 >> 1;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v66 = v56;
          _os_log_impl(&dword_23B55A000, v12, OS_LOG_TYPE_INFO, "itemCount (%zu) higher than the limit", buf, 0xCu);
        }
      }
      uint64_t v13 = 20;
    }
    if (v9 >= 8 && !v4->_colors)
    {
      uint64_t v15 = [MEMORY[0x263EFF980] array];
      colors = v4->_colors;
      v4->_colors = (NSMutableArray *)v15;
    }
    if (v13)
    {
      unint64_t v17 = 0;
      p_begin = (void **)&v4->_times.__begin_;
      do
      {
        v19 = (unsigned __int16 *)(v10 + 4 * v17);
        unsigned int v20 = *v19;
        LOWORD(v11) = *(_WORD *)(v63 + 2 * v17);
        unsigned int v21 = v19[1];
        end = v4->_times.__end_;
        unint64_t value = (unint64_t)v4->_times.__end_cap_.__value_;
        double v24 = (double)(unint64_t)v11 / 1000.0;
        if ((unint64_t)end >= value)
        {
          v26 = (double *)*p_begin;
          uint64_t v27 = ((char *)end - (unsigned char *)*p_begin) >> 3;
          unint64_t v28 = v27 + 1;
          if ((unint64_t)(v27 + 1) >> 61) {
            _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
          }
          uint64_t v29 = value - (void)v26;
          if (v29 >> 2 > v28) {
            unint64_t v28 = v29 >> 2;
          }
          if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v30 = v28;
          }
          if (v30)
          {
            v31 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v4->_times.__end_cap_, v30);
            v26 = (double *)*p_begin;
            end = v4->_times.__end_;
          }
          else
          {
            v31 = 0;
          }
          v32 = (double *)&v31[8 * v27];
          double *v32 = v24;
          v25 = v32 + 1;
          while (end != v26)
          {
            uint64_t v33 = *((void *)end-- - 1);
            *((void *)v32-- - 1) = v33;
          }
          *p_begin = v32;
          v4->_times.__end_ = v25;
          v4->_times.__end_cap_.__value_ = (double *)&v31[8 * v30];
          if (v26) {
            operator delete(v26);
          }
        }
        else
        {
          double *end = v24;
          v25 = end + 1;
        }
        v4->_times.__end_ = v25;
        double v34 = (double)v20 / 32767.0 + -1.0;
        *(double *)&long long v11 = (double)v21 / 32767.0;
        double v35 = *(double *)&v11 + -1.0;
        v36 = (void **)&v4->_points.__begin_;
        p_x = &v4->_points.__end_->x;
        unint64_t v38 = (unint64_t)v4->_points.__end_cap_.__value_;
        if ((unint64_t)p_x >= v38)
        {
          v40 = (double *)*v36;
          uint64_t v41 = ((char *)p_x - (unsigned char *)*v36) >> 4;
          unint64_t v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 60) {
            _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
          }
          uint64_t v43 = v38 - (void)v40;
          if (v43 >> 3 > v42) {
            unint64_t v42 = v43 >> 3;
          }
          if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v44 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v44 = v42;
          }
          if (v44)
          {
            v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v4->_points.__end_cap_, v44);
            v40 = (double *)*v36;
            p_x = &v4->_points.__end_->x;
          }
          else
          {
            v45 = 0;
          }
          v46 = (double *)&v45[16 * v41];
          double *v46 = v34;
          v46[1] = v35;
          v47 = v46;
          if (p_x != v40)
          {
            do
            {
              long long v11 = *((_OWORD *)p_x - 1);
              *((_OWORD *)v47 - 1) = v11;
              v47 -= 2;
              p_x -= 2;
            }
            while (p_x != v40);
            v40 = (double *)*v36;
          }
          v39 = v46 + 2;
          *v36 = v47;
          v4->_points.__end_ = (CGPoint *)(v46 + 2);
          v4->_points.__end_cap_.__value_ = (CGPoint *)&v45[16 * v44];
          if (v40) {
            operator delete(v40);
          }
        }
        else
        {
          double *p_x = v34;
          p_x[1] = v35;
          v39 = p_x + 2;
        }
        v4->_points.__end_ = (CGPoint *)v39;
        if (v9 >= 8 && v17 < v9 >> 2)
        {
          v48 = v4->_colors;
          v49 = [MEMORY[0x263F1C550] colorWithRed:(double)*(_DWORD *)(v61 + 4 * v17) / 255.0 green:(double)BYTE1(*(_DWORD *)(v61 + 4 * v17)) / 255.0 blue:(double)BYTE2(*(_DWORD *)(v61 + 4 * v17)) / 255.0 alpha:(double)HIBYTE(*(_DWORD *)(v61 + 4 * v17)) / 255.0];
          [(NSMutableArray *)v48 addObject:v49];
        }
        ++v17;
      }
      while (v17 != v13);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23B55A000, v14, OS_LOG_TYPE_INFO, "Corrupt tap message encountered", buf, 2u);
    }
  }
  if (v56 == v52) {
LABEL_57:
  }
    v50 = v4;
  else {
LABEL_58:
  }
    v50 = 0;

  return v50;
}

- (id)archiveData
{
  v32 = objc_alloc_init(ETPTap);
  unint64_t v33 = [(ETTapMessage *)self tapCount];
  uint64_t v29 = [MEMORY[0x263EFF990] data];
  unint64_t v28 = [MEMORY[0x263EFF990] data];
  v3 = [MEMORY[0x263EFF990] data];
  objc_msgSend(v29, "setLength:", 2 * v33, v3);
  [v28 setLength:4 * v33];
  [v3 setLength:4 * v33];
  id v4 = v29;
  uint64_t v5 = [v4 mutableBytes];
  id v6 = v28;
  uint64_t v7 = [v6 mutableBytes];
  id v8 = v3;
  uint64_t v9 = [v8 mutableBytes];
  unint64_t v30 = v8;
  v31 = v4;
  if (v33)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    for (uint64_t i = 0; i != v33; ++i)
    {
      *(_WORD *)(v5 + 2 * i) = llround(self->_times.__begin_[i] * 1000.0);
      uint64_t v13 = &self->_points.__begin_[v11];
      double y = v13->y;
      float v15 = (v13->x + 1.0) * 32767.0;
      LOWORD(v13) = llroundf(v15);
      float v16 = (y + 1.0) * 32767.0;
      unint64_t v17 = (_WORD *)(v7 + 1 * v11);
      *unint64_t v17 = (_WORD)v13;
      v17[1] = llroundf(v16);
      v18 = [(NSMutableArray *)self->_colors objectAtIndexedSubscript:i];
      double v36 = 0.0;
      double v37 = 0.0;
      double v34 = 0.0;
      double v35 = 0.0;
      [v18 getRed:&v37 green:&v36 blue:&v35 alpha:&v34];
      float v19 = v37 * 255.0;
      unsigned int v20 = llroundf(v19);
      float v21 = v36 * 255.0;
      unsigned int v22 = llroundf(v21);
      float v23 = v35 * 255.0;
      unsigned int v24 = llroundf(v23);
      float v25 = v34 * 255.0;
      *(_DWORD *)(v10 + 4 * i) = (v24 << 16) | (llroundf(v25) << 24) | (v22 << 8) | v20;

      ++v11;
    }
  }
  [(ETPTap *)v32 setTimeDeltas:v31];
  [(ETPTap *)v32 setPoints:v6];
  [(ETPTap *)v32 setColors:v30];
  v26 = [(ETPTap *)v32 data];

  return v26;
}

- (unint64_t)tapCount
{
  int64_t v2 = (char *)self->_times.__end_ - (char *)self->_times.__begin_;
  end = self->_points.__end_;
  if (end - self->_points.__begin_ >= (unint64_t)(v2 >> 3)) {
    return v2 >> 3;
  }
  else {
    return end - self->_points.__begin_;
  }
}

- (CGPoint)pointAtIndex:(unint64_t)a3
{
  if ([(ETTapMessage *)self tapCount] < a3)
  {
    id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"tapIndex > number of taps" userInfo:0];
    objc_exception_throw(v8);
  }
  uint64_t v5 = &self->_points.__begin_[a3];
  double x = v5->x;
  double y = v5->y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)timeDeltaAtIndex:(unint64_t)a3
{
  if ([(ETTapMessage *)self tapCount] < a3)
  {
    id v6 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"tapIndex > number of taps" userInfo:0];
    objc_exception_throw(v6);
  }
  return self->_times.__begin_[a3];
}

- (void)addTapAtPoint:(CGPoint)a3 time:(double)a4 color:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v9 = a5;
  [(ETMessage *)self setColor:v9];
  double baseTime = self->_baseTime;
  if (baseTime >= 0.0) {
    double v11 = a4 - baseTime;
  }
  else {
    double v11 = 0.0;
  }
  self->_double baseTime = a4;
  p_points = &self->_points;
  end = self->_points.__end_;
  unint64_t value = self->_points.__end_cap_.__value_;
  if (end >= value)
  {
    begin = p_points->__begin_;
    uint64_t v17 = end - p_points->__begin_;
    unint64_t v18 = v17 + 1;
    if ((unint64_t)(v17 + 1) >> 60) {
      _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
    }
    uint64_t v19 = (char *)value - (char *)begin;
    if (v19 >> 3 > v18) {
      unint64_t v18 = v19 >> 3;
    }
    if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v20 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v20 = v18;
    }
    if (v20)
    {
      float v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&self->_points.__end_cap_, v20);
      begin = p_points->__begin_;
      end = self->_points.__end_;
    }
    else
    {
      float v21 = 0;
    }
    unsigned int v22 = (CGPoint *)&v21[16 * v17];
    float v23 = (CGPoint *)&v21[16 * v20];
    v22->double x = x;
    v22->double y = y;
    float v15 = v22 + 1;
    if (end != begin)
    {
      do
      {
        v22[-1] = end[-1];
        --v22;
        --end;
      }
      while (end != begin);
      begin = p_points->__begin_;
    }
    p_points->__begin_ = v22;
    self->_points.__end_ = v15;
    self->_points.__end_cap_.__value_ = v23;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    end->double x = x;
    end->double y = y;
    float v15 = end + 1;
  }
  self->_points.__end_ = v15;
  p_times = &self->_times;
  float v25 = self->_times.__end_;
  v26 = self->_times.__end_cap_.__value_;
  if (v25 >= v26)
  {
    unint64_t v28 = p_times->__begin_;
    uint64_t v29 = v25 - p_times->__begin_;
    unint64_t v30 = v29 + 1;
    if ((unint64_t)(v29 + 1) >> 61) {
      _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
    }
    uint64_t v31 = (char *)v26 - (char *)v28;
    if (v31 >> 2 > v30) {
      unint64_t v30 = v31 >> 2;
    }
    if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v32 = v30;
    }
    if (v32)
    {
      unint64_t v33 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_times.__end_cap_, v32);
      unint64_t v28 = p_times->__begin_;
      float v25 = self->_times.__end_;
    }
    else
    {
      unint64_t v33 = 0;
    }
    double v34 = (double *)&v33[8 * v29];
    double v35 = (double *)&v33[8 * v32];
    *double v34 = v11;
    uint64_t v27 = v34 + 1;
    while (v25 != v28)
    {
      uint64_t v36 = *((void *)v25-- - 1);
      *((void *)v34-- - 1) = v36;
    }
    p_times->__begin_ = v34;
    self->_times.__end_ = v27;
    self->_times.__end_cap_.__value_ = v35;
    if (v28) {
      operator delete(v28);
    }
  }
  else
  {
    double *v25 = v11;
    uint64_t v27 = v25 + 1;
  }
  self->_times.__end_ = v27;
  [(NSMutableArray *)self->_colors addObject:v9];
  if (self->_preVisualizeScene)
  {
    if (IMOSLoggingEnabled())
    {
      double v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        unint64_t v38 = [MEMORY[0x263EFF910] date];
        v39 = +[ETUtility dateFormatWithMilliseconds:v38];
        int v40 = 138412290;
        uint64_t v41 = v39;
        _os_log_impl(&dword_23B55A000, v37, OS_LOG_TYPE_INFO, "(%@) ETTapMessage playing tap haptic", (uint8_t *)&v40, 0xCu);
      }
    }
    -[ETTapMessage _displayInScene:point:color:filled:withWisp:](self, "_displayInScene:point:color:filled:withWisp:", self->_preVisualizeScene, v9, 0, 1, x, y);
  }
}

- (BOOL)reachedSizeLimit
{
  return [(ETTapMessage *)self tapCount] > 0x13;
}

- (id)messageTypeAsString
{
  return @"Tap";
}

- (void)preVisualizeInScene:(id)a3
{
}

- (void)displayInScene:(id)a3
{
  id v28 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  objc_initWeak(location, v28);
  unint64_t v5 = [(NSMutableArray *)self->_colors count];
  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(ETMessage *)self color];
  }
  for (unint64_t i = 0; [(ETTapMessage *)self tapCount] > i; ++i)
  {
    [(ETTapMessage *)self pointAtIndex:i];
    id v9 = v8;
    double v11 = v10;
    [(ETTapMessage *)self timeDeltaAtIndex:i];
    uint64_t v13 = v12;
    if (v5)
    {
      colors = self->_colors;
      if (v5 <= i) {
        [(NSMutableArray *)colors objectAtIndexedSubscript:v5 - 1];
      }
      else {
      uint64_t v15 = [(NSMutableArray *)colors objectAtIndexedSubscript:i];
      }

      id v6 = (void *)v15;
    }
    if ([(ETMessage *)self isRenderingOffscreen])
    {
      id WeakRetained = objc_loadWeakRetained(location);
      BOOL v17 = *(double *)&v13 > 0.5 || i == [(ETTapMessage *)self tapCount] - 1;
      -[ETTapMessage _displayInScene:point:color:filled:withWisp:](self, "_displayInScene:point:color:filled:withWisp:", WeakRetained, v6, 1, v17, *(double *)&v9, *(double *)&v11);
    }
    else
    {
      unint64_t v18 = [getSKActionClass() waitForDuration:*(double *)&v13];
      [v4 addObject:v18];

      id SKActionClass = getSKActionClass();
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __31__ETTapMessage_displayInScene___block_invoke;
      v34[3] = &unk_264DECB40;
      v34[4] = self;
      objc_copyWeak(v36, location);
      v36[1] = v9;
      v36[2] = v11;
      id v35 = v6;
      v36[3] = v13;
      int v37 = i;
      unint64_t v20 = [SKActionClass runBlock:v34];
      [v4 addObject:v20];

      objc_destroyWeak(v36);
    }
  }
  if (![(ETMessage *)self isRenderingOffscreen])
  {
    objc_initWeak(&from, self);
    float v21 = [getSKActionClass() waitForDuration:1.0];
    [v4 addObject:v21];

    id v22 = getSKActionClass();
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __31__ETTapMessage_displayInScene___block_invoke_13;
    v31[3] = &unk_264DECB68;
    objc_copyWeak(&v32, &from);
    float v23 = [v22 runBlock:v31 queue:MEMORY[0x263EF83A0]];
    [v4 addObject:v23];

    unsigned int v24 = [getSKActionClass() waitForDuration:1.0];
    [v4 addObject:v24];

    id v25 = getSKActionClass();
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __31__ETTapMessage_displayInScene___block_invoke_2;
    v29[3] = &unk_264DECB68;
    objc_copyWeak(&v30, &from);
    v26 = [v25 runBlock:v29 queue:MEMORY[0x263EF83A0]];
    [v4 addObject:v26];

    uint64_t v27 = [getSKActionClass() sequence:v4];
    [v28 runAction:v27];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&from);
  }

  objc_destroyWeak(location);
}

void __31__ETTapMessage_displayInScene___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    int64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = [MEMORY[0x263EFF910] date];
      id v4 = +[ETUtility dateFormatWithMilliseconds:v3];
      int v12 = 138412290;
      uint64_t v13 = v4;
      _os_log_impl(&dword_23B55A000, v2, OS_LOG_TYPE_INFO, "(%@) ETTapMessage playing tap haptic", (uint8_t *)&v12, 0xCu);
    }
  }
  unint64_t v5 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v7 = *(double *)(a1 + 56);
  double v8 = *(double *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 40);
  if (*(double *)(a1 + 72) <= 0.5)
  {
    uint64_t v11 = *(int *)(a1 + 80);
    BOOL v10 = [*(id *)(a1 + 32) tapCount] - 1 == v11;
  }
  else
  {
    BOOL v10 = 1;
  }
  objc_msgSend(v5, "_displayInScene:point:color:filled:withWisp:", WeakRetained, v9, 1, v10, v7, v8);
}

void __31__ETTapMessage_displayInScene___block_invoke_13(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int64_t v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 messageWillStopPlaying:v3];
}

void __31__ETTapMessage_displayInScene___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int64_t v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 messageDidStopPlaying:v3];
}

- (id)_animateCircleInner0:(double)a3 inner1:(double)a4 outer0:(double)a5 outer1:(double)a6 duration:(double)a7
{
  float v10 = a4 - a3;
  float v11 = a6 - a5;
  id SKActionClass = getSKActionClass();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__ETTapMessage__animateCircleInner0_inner1_outer0_outer1_duration___block_invoke;
  v15[3] = &__block_descriptor_64_e19_v24__0__SKNode_8d16l;
  *(double *)&v15[4] = a7;
  *(double *)&v15[5] = a5;
  float v16 = v11;
  float v17 = v10;
  *(double *)&v15[6] = a3;
  uint64_t v13 = [SKActionClass customActionWithDuration:v15 actionBlock:a7];

  return v13;
}

void __67__ETTapMessage__animateCircleInner0_inner1_outer0_outer1_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  double v6 = a3 / *(double *)(a1 + 32);
  id v8 = v5;
  CirclePath = createCirclePath(*(double *)(a1 + 40) + *(float *)(a1 + 56) * v6, *(double *)(a1 + 48) + *(float *)(a1 + 60) * v6);
  [v8 setPath:CirclePath];
  CGPathRelease(CirclePath);
}

- (void)_displayInScene:(id)a3 point:(CGPoint)a4 color:(id)a5 filled:(BOOL)a6 withWisp:(BOOL)a7
{
  BOOL v133 = a6;
  double y = a4.y;
  double x = a4.x;
  uint64_t v174 = *MEMORY[0x263EF8340];
  id v138 = a3;
  id v137 = a5;
  v142[0] = 0;
  v142[1] = v142;
  double baseTime = self->_baseTime;
  v142[2] = 0x2020000000;
  *(double *)&v142[3] = baseTime;
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [MEMORY[0x263EFF910] date];
      uint64_t v15 = +[ETUtility dateFormatWithMilliseconds:v14];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_23B55A000, v13, OS_LOG_TYPE_INFO, "(%@) ETTapMessage displaying tap in scene", (uint8_t *)&buf, 0xCu);
    }
  }
  os_unfair_lock_lock(&self->_noiseFieldLock);
  noiseField = self->_noiseField;
  if (!noiseField)
  {
    double v143 = 0.0;
    v144 = &v143;
    uint64_t v145 = 0x2050000000;
    float v17 = (void *)getSKFieldNodeClass(void)::softClass;
    uint64_t v146 = getSKFieldNodeClass(void)::softClass;
    if (!getSKFieldNodeClass(void)::softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v171 = (uint64_t)___ZL19getSKFieldNodeClassv_block_invoke;
      v172 = &unk_264DECBF8;
      v173 = &v143;
      ___ZL19getSKFieldNodeClassv_block_invoke((uint64_t)&buf);
      float v17 = (void *)*((void *)v144 + 3);
    }
    id v18 = v17;
    _Block_object_dispose(&v143, 8);
    uint64_t v19 = [v18 noiseFieldWithSmoothness:drand48() * 0.1 + 0.5 animationSpeed:60.0];
    unint64_t v20 = self->_noiseField;
    self->_noiseField = v19;

    LODWORD(v21) = 1.0;
    [(SKFieldNode *)self->_noiseField setStrength:v21];
    [(SKFieldNode *)self->_noiseField setCategoryBitMask:2];
    noiseField = self->_noiseField;
  }
  id v22 = [(SKFieldNode *)noiseField parent];
  BOOL v23 = v22 == 0;

  if (v23) {
    [v138 addChild:self->_noiseField];
  }
  BOOL v131 = [(ETMessage *)self isRenderingOffscreen];
  if (!v131)
  {
    unsigned int v24 = self->_noiseField;
    id SKActionClass = getSKActionClass();
    v26 = [getSKActionClass() waitForDuration:3.0];
    v169[0] = v26;
    uint64_t v27 = [getSKActionClass() removeFromParent];
    v169[1] = v27;
    id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v169 count:2];
    uint64_t v29 = [SKActionClass sequence:v28];
    [(SKFieldNode *)v24 runAction:v29 withKey:@"removal"];
  }
  os_unfair_lock_unlock(&self->_noiseFieldLock);
  [v138 size];
  double v31 = fmax(v30 / 156.0, 1.0);
  if (v31 <= 3.0) {
    double v32 = v31;
  }
  else {
    double v32 = 3.0;
  }
  unint64_t v33 = [getSKNodeClass() node];
  [v138 frame];
  double v35 = v34;
  [v138 frame];
  objc_msgSend(v33, "setPosition:", x * v35 * 0.5, y * v36 * 0.5);
  [v33 setScale:v32];
  [v138 addChild:v33];
  v136 = [getSKNodeClass() node];
  [v33 addChild:v136];
  double v143 = 0.0;
  v144 = &v143;
  uint64_t v145 = 0x2050000000;
  int v37 = (void *)getSKShapeNodeClass(void)::softClass;
  uint64_t v146 = getSKShapeNodeClass(void)::softClass;
  if (!getSKShapeNodeClass(void)::softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v171 = (uint64_t)___ZL19getSKShapeNodeClassv_block_invoke;
    v172 = &unk_264DECBF8;
    v173 = &v143;
    ___ZL19getSKShapeNodeClassv_block_invoke((uint64_t)&buf);
    int v37 = (void *)*((void *)v144 + 3);
  }
  id v38 = v37;
  _Block_object_dispose(&v143, 8);
  v39 = [v38 node];
  [v39 setFillColor:v137];
  [v39 setStrokeColor:v137];
  [v39 setZPosition:1.0];
  [v33 addChild:v39];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v171 = 0x2020000000;
  LODWORD(v172) = 0;
  id v40 = getSKActionClass();
  v140[0] = MEMORY[0x263EF8330];
  v140[1] = 3221225472;
  v140[2] = __60__ETTapMessage__displayInScene_point_color_filled_withWisp___block_invoke;
  v140[3] = &unk_264DECBB0;
  v140[4] = self;
  v140[5] = v142;
  BOOL v141 = a7;
  v140[6] = &buf;
  v129 = [v40 customActionWithDuration:v140 actionBlock:0.200000003];
  v130 = [getSKActionClass() customActionWithDuration:&__block_literal_global_5 actionBlock:0.0];
  uint64_t v41 = (void *)_dots;
  if (!_dots)
  {
    ETFrameworkBundle();
    uint64_t v42 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    ET_SKSetResourceBundle(v42);

    uint64_t v43 = [getSKEmitterNodeClass() nodeWithFileNamed:@"doodle_wisp_stroke"];
    unint64_t v44 = (void *)_dots;
    _dots = v43;

    v45 = (void *)[objc_alloc((Class)getSKKeyframeSequenceClass()) initWithKeyframeValues:&unk_26EEA3300 times:&unk_26EEA3318];
    [v45 setInterpolationMode:2];
    [v45 setRepeatMode:1];
    [(id)_dots setParticleScaleSequence:v45];
    [(id)_dots setZPosition:-1.0];
    [(id)_dots setParticleSpeedRange:6.0];
    [(id)_dots setParticleSpeed:10.0];
    [(id)_dots setYAcceleration:0.0];
    [(id)_dots setXAcceleration:0.0];
    [(id)_dots setParticleLifetime:1.5];
    [(id)_dots setParticleLifetimeRange:0.5];
    [(id)_dots setDensityBased:0];
    [(id)_dots setParticleBirthRate:0.0];
    [(id)_dots setParticleDensity:1.0];
    [(id)_dots setEmissionAngleRange:6.28318531];
    [(id)_dots setEmissionDistance:29.75];
    [(id)_dots setEmissionDistanceRange:2.0];
    [(id)_dots setFieldBitMask:2];
    v46 = (void *)[objc_alloc((Class)getSKKeyframeSequenceClass()) initWithKeyframeValues:&unk_26EEA3330 times:&unk_26EEA3348];
    [v46 setInterpolationMode:1];
    [(id)_dots setFieldInfluenceSequence:v46];
    objc_msgSend((id)_dots, "setPosition:", 0.0, 0.0);

    uint64_t v41 = (void *)_dots;
  }
  id v47 = (id)[v41 copy];
  id v48 = v137;
  double v143 = 0.0;
  double v156 = 0.0;
  double v157 = 0.0;
  double v155 = 0.0;
  v139 = v47;
  [v48 getRed:&v143 green:&v157 blue:&v156 alpha:&v155];
  v49 = [v47 particleColorSequence];
  if (v49)
  {
    for (unint64_t i = 0; [v49 count] > i; ++i)
    {
      v51 = [v49 getKeyframeValueForIndex:i];
      double v153 = 0.0;
      double v154 = 0.0;
      double v151 = 0.0;
      double v152 = 0.0;
      double v149 = 0.0;
      double v150 = 0.0;
      uint64_t v147 = 0;
      double v148 = 0.0;
      [v51 getRed:&v154 green:&v153 blue:&v152 alpha:&v151];
      unint64_t v52 = [MEMORY[0x263F1C550] colorWithRed:v143 green:v157 blue:v156 alpha:v151];
      [v52 getHue:&v150 saturation:&v149 brightness:&v148 alpha:&v147];
      float v53 = v150 + (v154 + -0.5) * 2.0;
      float v54 = v149 + (v153 + -0.5) * 2.0;
      double v149 = fmaxf(fminf(v54, 1.0), 0.0);
      double v150 = fmaxf(fminf(v53, 1.0), 0.0);
      float v55 = v148 + (v152 + -0.5) * 2.0;
      double v148 = fmaxf(fminf(v55, 1.0), 0.0);
      if (v143 == v157 && v157 == v156)
      {
        uint64_t v56 = [MEMORY[0x263F1C550] colorWithRed:v143 green:v157 blue:v156 alpha:v151];
      }
      else
      {
        uint64_t v56 = objc_msgSend(MEMORY[0x263F1C550], "colorWithHue:saturation:brightness:alpha:");
      }
      id v57 = (void *)v56;
      [v49 setKeyframeValue:v56 forIndex:i];
    }
    [v139 setParticleColorSequence:v49];
  }
  else
  {
    [v47 setParticleColor:v48];
  }

  [v139 setTargetNode:v136];
  [v33 addChild:v139];
  id v58 = (void *)_smoke;
  if (!_smoke)
  {
    ETFrameworkBundle();
    id v59 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    ET_SKSetResourceBundle(v59);

    uint64_t v60 = [getSKEmitterNodeClass() nodeWithFileNamed:@"doodle_wisp_dots"];
    uint64_t v61 = (void *)_smoke;
    _smoke = v60;

    id v62 = (void *)[objc_alloc((Class)getSKKeyframeSequenceClass()) initWithKeyframeValues:&unk_26EEA3360 times:&unk_26EEA3378];
    [v62 setInterpolationMode:2];
    [v62 setRepeatMode:1];
    [(id)_smoke setParticleScaleSequence:v62];
    [(id)_smoke setZPosition:-2.0];
    [(id)_smoke setParticleSpeedRange:6.0];
    [(id)_smoke setParticleSpeed:10.0];
    [(id)_smoke setYAcceleration:0.0];
    [(id)_smoke setXAcceleration:0.0];
    [(id)_smoke setParticleLifetime:1.5];
    [(id)_smoke setParticleLifetimeRange:0.5];
    [(id)_smoke setDensityBased:0];
    [(id)_smoke setParticleBirthRate:0.0];
    [(id)_smoke setParticleDensity:0.6];
    [(id)_smoke setEmissionAngleRange:6.28318531];
    [(id)_smoke setEmissionDistance:29.75];
    [(id)_smoke setEmissionDistanceRange:2.0];
    [(id)_smoke setFieldBitMask:2];
    uint64_t v63 = (void *)[objc_alloc((Class)getSKKeyframeSequenceClass()) initWithKeyframeValues:&unk_26EEA3390 times:&unk_26EEA33A8];
    [v63 setInterpolationMode:1];
    [(id)_smoke setFieldInfluenceSequence:v63];
    objc_msgSend((id)_smoke, "setPosition:", 0.0, 0.0);

    id v58 = (void *)_smoke;
  }
  id v64 = (id)[v58 copy];
  id v135 = v48;
  v65 = [v64 particleColorSequence];
  unint64_t v66 = v65;
  if (v65)
  {
    uint64_t v67 = [v65 count];
    double v143 = 0.0;
    double v156 = 0.0;
    double v157 = 0.0;
    double v155 = 0.0;
    [v135 getHue:&v143 saturation:&v157 brightness:&v156 alpha:&v155];
    if (v67)
    {
      for (uint64_t j = 0; j != v67; ++j)
      {
        v69 = [v66 getKeyframeValueForIndex:j];
        double v153 = 0.0;
        double v154 = 0.0;
        double v151 = 0.0;
        double v152 = 0.0;
        [v69 getHue:&v154 saturation:&v153 brightness:&v152 alpha:&v151];
        v70 = [MEMORY[0x263F1C550] colorWithHue:v143 saturation:v157 brightness:v152 alpha:v151 * v155];

        [v66 setKeyframeValue:v70 forIndex:j];
      }
    }
    [v64 setParticleColorSequence:v66];
  }
  else
  {
    [v64 setParticleColor:v135];
  }

  [v64 setTargetNode:v136];
  [v33 addChild:v64];
  if (v133)
  {
    CirclePath = createCirclePath(32.5, 37.5);
    [v39 setPath:CirclePath];
    CGPathRelease(CirclePath);
    v134 = [(ETTapMessage *)self _animateCircleInner0:0.0 inner1:35.0 outer0:35.0 outer1:35.0 duration:0.649999976];
    [v134 setTimingMode:1];
    [v39 runAction:v134];
    [v39 setScale:0.0];
    v132 = [getSKActionClass() scaleTo:1.0 duration:0.649999976];
    [v132 setTimingMode:3];
    id v72 = getSKActionClass();
    v168 = v132;
    v73 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v168 count:1];
    v74 = [v72 sequence:v73];
    [v39 runAction:v74];

    if (v131) {
      goto LABEL_45;
    }
    id v75 = getSKActionClass();
    v76 = [getSKActionClass() waitForDuration:0.649999976];
    v167[0] = v76;
    v77 = [getSKActionClass() fadeOutWithDuration:0.227499992];
    v167[1] = v77;
    v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:v167 count:2];
    v79 = [v75 sequence:v78];
    [v39 runAction:v79];

    [v33 setAlpha:0.0];
    id v80 = getSKActionClass();
    v81 = [getSKActionClass() fadeInWithDuration:0.3];
    v166[0] = v81;
    v82 = [getSKActionClass() waitForDuration:1.8];
    v166[1] = v82;
    v83 = [getSKActionClass() fadeOutWithDuration:0.5];
    v166[2] = v83;
    v84 = [getSKActionClass() removeFromParent];
    v166[3] = v84;
    v85 = [MEMORY[0x263EFF8C0] arrayWithObjects:v166 count:4];
    v86 = [v80 sequence:v85];
    [v33 runAction:v86];

    *(_DWORD *)(*((void *)&buf + 1) + 24) = 1065353216;
    id v87 = getSKActionClass();
    v88 = [getSKActionClass() waitForDuration:0.454999983];
    v165[0] = v88;
    v165[1] = v129;
    v165[2] = v130;
    v89 = [MEMORY[0x263EFF8C0] arrayWithObjects:v165 count:3];
    v90 = [v87 sequence:v89];
    [v139 runAction:v90];

    id v91 = getSKActionClass();
    v92 = [getSKActionClass() waitForDuration:0.454999983];
    v164[0] = v92;
    v164[1] = v129;
    v164[2] = v130;
    v93 = [MEMORY[0x263EFF8C0] arrayWithObjects:v164 count:3];
    v94 = [v91 sequence:v93];
    [v64 runAction:v94];
    goto LABEL_43;
  }
  v95 = createCirclePath(32.5, 37.5);
  [v39 setPath:v95];
  CGPathRelease(v95);
  v134 = [(ETTapMessage *)self _animateCircleInner0:51.0 inner1:32.5 outer0:54.0 outer1:37.5 duration:0.324999988];
  v132 = [(ETTapMessage *)self _animateCircleInner0:32.5 inner1:35.0 outer0:37.5 outer1:35.0 duration:0.649999976];
  [v134 setTimingMode:2];
  [v132 setTimingMode:1];
  id v96 = getSKActionClass();
  v163[0] = v134;
  v163[1] = v132;
  v97 = [MEMORY[0x263EFF8C0] arrayWithObjects:v163 count:2];
  v98 = [v96 sequence:v97];
  [v39 runAction:v98];

  [v39 setScale:1.0];
  v92 = [getSKActionClass() scaleTo:0.8 duration:0.649999976];
  [v92 setTimingMode:3];
  id v99 = getSKActionClass();
  v100 = [getSKActionClass() waitForDuration:0.129999995];
  v162[0] = v100;
  v162[1] = v92;
  v101 = [MEMORY[0x263EFF8C0] arrayWithObjects:v162 count:2];
  v102 = [v99 sequence:v101];
  [v39 runAction:v102];

  if (!v131)
  {
    id v103 = getSKActionClass();
    v104 = [getSKActionClass() waitForDuration:0.649999976];
    v161[0] = v104;
    v105 = [getSKActionClass() fadeOutWithDuration:0.227499992];
    v161[1] = v105;
    v106 = [MEMORY[0x263EFF8C0] arrayWithObjects:v161 count:2];
    v107 = [v103 sequence:v106];
    [v39 runAction:v107];

    [v33 setAlpha:0.0];
    id v108 = getSKActionClass();
    v109 = [getSKActionClass() fadeInWithDuration:0.3];
    v160[0] = v109;
    v110 = [getSKActionClass() waitForDuration:1.8];
    v160[1] = v110;
    v111 = [getSKActionClass() fadeOutWithDuration:0.5];
    v160[2] = v111;
    v112 = [getSKActionClass() removeFromParent];
    v160[3] = v112;
    v113 = [MEMORY[0x263EFF8C0] arrayWithObjects:v160 count:4];
    v114 = [v108 sequence:v113];
    [v33 runAction:v114];

    *(_DWORD *)(*((void *)&buf + 1) + 24) = -1082130432;
    id v115 = getSKActionClass();
    v116 = [getSKActionClass() waitForDuration:0.454999983];
    v159[0] = v116;
    v159[1] = v129;
    v159[2] = v130;
    v117 = [MEMORY[0x263EFF8C0] arrayWithObjects:v159 count:3];
    v118 = [v115 sequence:v117];
    [v139 runAction:v118];

    id v119 = getSKActionClass();
    v93 = [getSKActionClass() waitForDuration:0.454999983];
    v158[0] = v93;
    v158[1] = v129;
    v158[2] = v130;
    v94 = [MEMORY[0x263EFF8C0] arrayWithObjects:v158 count:3];
    v120 = [v119 sequence:v94];
    [v64 runAction:v120];

LABEL_43:
  }

LABEL_45:
  v121 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v122 = [v121 persistentDomainForName:@"com.apple.ET"];
  v123 = [v122 objectForKey:@"ETSceneLoggingEnabled"];
  int v124 = [v123 BOOLValue];

  if (v124)
  {
    v125 = NSString;
    v126 = [MEMORY[0x263EFF910] date];
    v127 = [v125 stringWithFormat:@"/tmp/ETTapMessage-%@.sks", v126];

    v128 = [MEMORY[0x263F08910] archivedDataWithRootObject:v138 requiringSecureCoding:1 error:0];
    [v128 writeToFile:v127 atomically:1];
  }
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(v142, 8);
}

void __60__ETTapMessage__displayInScene_point_color_filled_withWisp___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(double *)(*(void *)(a1 + 32) + 168) == *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && *(unsigned char *)(a1 + 56))
  {
    [v3 setParticleSpeed:(float)(*(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) * 10.0)];
    [v4 setDensityBased:0];
    [v4 setParticleBirthRate:1000.0];
  }
  else
  {
    [v3 resetSimulation];
  }
}

void __60__ETTapMessage__displayInScene_point_color_filled_withWisp___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setDensityBased:0];
  [v2 setParticleBirthRate:0.0];
}

- (double)messageDuration
{
  begin = self->_times.__begin_;
  end = self->_times.__end_;
  if (begin == end) {
    return 1.3;
  }
  double v4 = 0.0;
  do
  {
    double v5 = *begin++;
    double v4 = v4 + v5;
  }
  while (begin != end);
  return v4 + 1.3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundTimer, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  begin = self->_times.__begin_;
  if (begin)
  {
    self->_times.__end_ = begin;
    operator delete(begin);
  }
  double v4 = self->_points.__begin_;
  if (v4)
  {
    self->_points.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_noiseField, 0);

  objc_storeStrong((id *)&self->_preVisualizeScene, 0);
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 17) = 0;
  return self;
}

@end