@interface CSLPressStateApplier
- ($153C3A5BC4E016D58A1B9CA554FFC462)_computeTargetAttributesForHex:(Hex)a3 sourceAttributes:(id)a4 forPressState:(id *)a5;
- ($153C3A5BC4E016D58A1B9CA554FFC462)_interpolateBetweenSourceAttributes:(id)a3 targetAttributes:(id)a4 fraction:(double)a5;
- ($153C3A5BC4E016D58A1B9CA554FFC462)_interpolateBetweenSourceAttributes:(id)a3 targetAttributes:(id)a4 pressState:(id *)a5;
- ($153C3A5BC4E016D58A1B9CA554FFC462)layoutAttributesForHex:(Hex)a3;
- (BOOL)_needsDisplayLink;
- (BOOL)isEnabled;
- (BOOL)isEnabledForHex:(Hex)a3;
- (CSLPressStateApplier)init;
- (CSLPressStateApplierDelegate)delegate;
- (id).cxx_construct;
- (void)_displayLinkFired:(id)a3;
- (void)_reversePressStatesAtTime:(double)a3;
- (void)_updateDisplayLink;
- (void)cleanupAfterLayout;
- (void)clearAllPresses;
- (void)clearPressedHex;
- (void)prepareForLayout;
- (void)setDelegate:(id)a3;
- (void)setPressedHex:(Hex)a3;
@end

@implementation CSLPressStateApplier

- (CSLPressStateApplier)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSLPressStateApplier;
  v2 = [(CSLPressStateApplier *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[CASpringAnimation animation];
    spring = v2->_spring;
    v2->_spring = (CASpringAnimation *)v3;

    [(CASpringAnimation *)v2->_spring setMass:3.0];
    [(CASpringAnimation *)v2->_spring setStiffness:1000.0];
    [(CASpringAnimation *)v2->_spring setDamping:500.0];
    [(CASpringAnimation *)v2->_spring durationForEpsilon:0.015];
    v2->_springDuration = v5;
    -[CASpringAnimation setDuration:](v2->_spring, "setDuration:");
    v6 = v2;
  }

  return v2;
}

- (void)_reversePressStatesAtTime:(double)a3
{
  begin = self->_pressStates.__map_.__begin_;
  if (self->_pressStates.__map_.__end_ != begin)
  {
    unint64_t start = self->_pressStates.__start_;
    double v5 = &begin[start >> 6];
    unint64_t v6 = (unint64_t)*v5 + 64 * (start & 0x3F);
    unint64_t v7 = *(unint64_t *)((char *)begin
                             + (((self->_pressStates.__size_.__value_ + start) >> 3) & 0x1FFFFFFFFFFFFFF8))
       + 64 * ((self->_pressStates.__size_.__value_ + start) & 0x3F);
    while (v6 != v7)
    {
      if (!*(unsigned char *)(v6 + 16))
      {
        *(unsigned char *)(v6 + 16) = 1;
        *(double *)(v6 + 24) = a3;
      }
      v6 += 64;
      if (v6 - (void)*v5 == 4096)
      {
        objc_super v8 = v5[1];
        ++v5;
        unint64_t v6 = (unint64_t)v8;
      }
    }
  }
}

- (void)clearPressedHex
{
  double v3 = CACurrentMediaTime();

  [(CSLPressStateApplier *)self _reversePressStatesAtTime:v3];
}

- (void)clearAllPresses
{
  begin = self->_pressStates.__map_.__begin_;
  end = self->_pressStates.__map_.__end_;
  self->_pressStates.__size_.__value_ = 0;
  unint64_t v5 = (char *)end - (char *)begin;
  if (v5 >= 0x11)
  {
    do
    {
      operator delete(*begin);
      unint64_t v6 = self->_pressStates.__map_.__end_;
      begin = self->_pressStates.__map_.__begin_ + 1;
      self->_pressStates.__map_.__begin_ = begin;
      unint64_t v5 = (char *)v6 - (char *)begin;
    }
    while (v5 > 0x10);
  }
  if (v5 >> 3 == 1)
  {
    unint64_t v7 = 32;
  }
  else
  {
    if (v5 >> 3 != 2) {
      goto LABEL_8;
    }
    unint64_t v7 = 64;
  }
  self->_pressStates.__start_ = v7;
LABEL_8:

  [(CSLPressStateApplier *)self _updateDisplayLink];
}

- (void)setPressedHex:(Hex)a3
{
  Hex v18 = a3;
  CFTimeInterval v5 = CACurrentMediaTime();
  self->_updateTime = v5;
  *(CFTimeInterval *)v14 = v5;
  v14[1] = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained originalLayoutAttributesForHex:a3];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  long long v16 = v12[0];
  long long v17 = v12[1];

  char v15 = 0;
  [(CSLPressStateApplier *)self _reversePressStatesAtTime:v5];
  sub_4590(&self->_pressStates.__map_.__first_, (uint64_t)v14);
  sub_57DC(&self->_pressedHexes.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v18);
  *(Hex *)&v12[0] = v18;
  *(_OWORD *)((char *)v12 + 8) = xmmword_2DF40;
  *((Hex *)&v12[1] + 1) = v18;
  int v13 = 0;
  uint64_t v10 = sub_4628(v12);
  for (LODWORD(v11) = v8; (_BYTE)v10; LODWORD(v11) = v9)
  {
    sub_57DC(&self->_pressedHexes.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)((char *)&v10 + 4));
    uint64_t v10 = sub_4628(v12);
  }
  [(CSLPressStateApplier *)self _updateDisplayLink];
}

- (BOOL)isEnabled
{
  return self->_pressStates.__size_.__value_ != 0;
}

- (BOOL)isEnabledForHex:(Hex)a3
{
  Hex v4 = a3;
  return sub_5D44(&self->_pressedHexes.__table_.__bucket_list_.__ptr_.__value_, (int *)&v4) != 0;
}

- ($153C3A5BC4E016D58A1B9CA554FFC462)layoutAttributesForHex:(Hex)a3
{
  unint64_t v6 = v3;
  *double v3 = 0u;
  v3[1] = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained originalLayoutAttributesForHex:a3];
  }
  else
  {
    _OWORD *v6 = 0u;
    v6[1] = 0u;
  }

  begin = self->_pressStates.__map_.__begin_;
  if (self->_pressStates.__map_.__end_ != begin)
  {
    unint64_t start = self->_pressStates.__start_;
    v12 = &begin[start >> 6];
    int v13 = (char *)*v12 + 64 * (start & 0x3F);
    unint64_t v14 = *(unint64_t *)((char *)begin
                              + (((self->_pressStates.__size_.__value_ + start) >> 3) & 0x1FFFFFFFFFFFFFF8))
        + 64 * ((self->_pressStates.__size_.__value_ + start) & 0x3F);
    while (v13 != (char *)v14)
    {
      long long v15 = *(_OWORD *)v13;
      long long v16 = *((_OWORD *)v13 + 1);
      long long v17 = *((_OWORD *)v13 + 3);
      long long v37 = *((_OWORD *)v13 + 2);
      long long v38 = v17;
      long long v35 = v15;
      long long v36 = v16;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v18 = v6[1];
      v32[0] = *v6;
      v32[1] = v18;
      long long v19 = *((_OWORD *)v13 + 2);
      long long v20 = *((_OWORD *)v13 + 3);
      long long v21 = *(_OWORD *)v13;
      long long v22 = *((_OWORD *)v13 + 1);
      v13 += 64;
      v31[2] = v19;
      v31[3] = v20;
      v31[0] = v21;
      v31[1] = v22;
      [(CSLPressStateApplier *)self _computeTargetAttributesForHex:a3 sourceAttributes:v32 forPressState:v31];
      long long v23 = v6[1];
      v28[0] = *v6;
      v28[1] = v23;
      v27[0] = v33;
      v27[1] = v34;
      v26[0] = v35;
      v26[1] = v36;
      v26[2] = v37;
      v26[3] = v38;
      [(CSLPressStateApplier *)self _interpolateBetweenSourceAttributes:v28 targetAttributes:v27 pressState:v26];
      *($153C3A5BC4E016D58A1B9CA554FFC462 *)&v9.var0 = ($153C3A5BC4E016D58A1B9CA554FFC462)v29;
      long long v24 = v30;
      _OWORD *v6 = v29;
      v6[1] = v24;
      if (v13 - (char *)*v12 == 4096)
      {
        v25 = v12[1];
        ++v12;
        int v13 = (char *)v25;
      }
    }
  }
  return v9;
}

- ($153C3A5BC4E016D58A1B9CA554FFC462)_interpolateBetweenSourceAttributes:(id)a3 targetAttributes:(id)a4 fraction:(double)a5
{
  v7[1].i64[1] = 0;
  float var0 = a3.var0;
  *unint64_t v7 = vmlaq_n_f32(*v5, vsubq_f32(*v6, *v5), var0);
  *($153C3A5BC4E016D58A1B9CA554FFC462 *)&v9.float var0 = ($153C3A5BC4E016D58A1B9CA554FFC462)v6[1].i64[0];
  *($153C3A5BC4E016D58A1B9CA554FFC462 *)v7[1].f32 = v9;
  return v9;
}

- ($153C3A5BC4E016D58A1B9CA554FFC462)_interpolateBetweenSourceAttributes:(id)a3 targetAttributes:(id)a4 pressState:(id *)a5
{
  int v8 = a5;
  float32x4_t v9 = vsubq_f32(*(float32x4_t *)&a5->var0, *v5);
  float32x4_t v10 = vsubq_f32(*v5, *(float32x4_t *)&a5->var0);
  float v11 = fmaxf(fmaxf(v10.f32[0], v10.f32[2]), v10.f32[1]);
  if (fmaxf(fmaxf(v9.f32[0], v9.f32[2]), v9.f32[1]) < 0.00000011921 && v11 < 0.00000011921)
  {
    long long v20 = *(_OWORD *)&a5->var0;
    long long v21 = *(_OWORD *)&a5->var2;
    *unint64_t v7 = *(_OWORD *)&a5->var0;
    v7[1] = v21;
  }
  else
  {
    int v13 = v5;
    if (*(unsigned char *)(v6 + 16))
    {
      uint64_t v15 = v6 + 24;
      [(CASpringAnimation *)self->_spring _timeFunction:(*(double *)(v6 + 24) - *(double *)v6) / self->_springDuration];
      long long v16 = *(_OWORD *)&v8->var2;
      v25[0] = *(_OWORD *)&v8->var0;
      v25[1] = v16;
      float32x4_t v17 = v13[1];
      v24[0] = *v13;
      v24[1] = v17;
      -[CSLPressStateApplier _interpolateBetweenSourceAttributes:targetAttributes:fraction:](self, "_interpolateBetweenSourceAttributes:targetAttributes:fraction:", v25, v24);
      uint64_t v6 = v15;
    }
    else
    {
      long long v18 = *(_OWORD *)&a5->var2;
      long long v28 = *(_OWORD *)&a5->var0;
      long long v29 = v18;
      int v8 = ($847C81B9837434A642F1AD4ECFBED923 *)v5;
    }
    long long v19 = *(_OWORD *)&v8->var2;
    long long v26 = *(_OWORD *)&v8->var0;
    long long v27 = v19;
    [(CASpringAnimation *)self->_spring _timeFunction:(self->_updateTime - *(double *)v6) / self->_springDuration];
    v23[0] = v28;
    v23[1] = v29;
    v22[0] = v26;
    v22[1] = v27;
    -[CSLPressStateApplier _interpolateBetweenSourceAttributes:targetAttributes:fraction:](self, "_interpolateBetweenSourceAttributes:targetAttributes:fraction:", v23, v22);
  }
  return ($153C3A5BC4E016D58A1B9CA554FFC462)v20;
}

- ($153C3A5BC4E016D58A1B9CA554FFC462)_computeTargetAttributesForHex:(Hex)a3 sourceAttributes:(id)a4 forPressState:(id *)a5
{
  __int32 v8 = v5->i32[2];
  __int32 v7 = v5->i32[3];
  int v9 = a3.q - v8;
  if (a3.q == v8 && a3.r == v7)
  {
    *(float *)&int v21 = *(float *)&a5->var1.q * 0.884;
    a5->var1.q = v21;
  }
  else
  {
    int v11 = v8 - (a3.r + a3.q) + v7;
    int v12 = a3.r - v7;
    if (v9 < 0) {
      int v9 = -v9;
    }
    if (v11 >= 0) {
      unsigned int v13 = v11;
    }
    else {
      unsigned int v13 = -v11;
    }
    if (v12 < 0) {
      int v12 = -v12;
    }
    if (v9 <= v12) {
      unsigned int v14 = v12;
    }
    else {
      unsigned int v14 = v9;
    }
    if (v13 >= v12 && v13 >= v9) {
      unsigned int v16 = v13;
    }
    else {
      unsigned int v16 = v14;
    }
    if (v16 <= 2)
    {
      long long v17 = *(_OWORD *)&a5->var0;
      float32x4_t v18 = v5[2];
      float32x4_t v19 = vsubq_f32(*(float32x4_t *)&a5->var0, v18);
      v19.i32[2] = 0;
      if (v16 == 2)
      {
        float32x4_t v19 = vmulq_f32(v19, (float32x4_t)vdupq_n_s32(0x3F7D70A4u));
      }
      else if (v16 == 1)
      {
        float32x4_t v19 = vmulq_f32(v19, (float32x4_t)vdupq_n_s32(0x3F760419u));
        *(float *)&int v20 = *((float *)&v17 + 2) * 0.97;
        a5->var1.q = v20;
        float32x4_t v18 = v5[2];
        long long v17 = *(_OWORD *)&a5->var0;
      }
      a5->var1.q = DWORD2(v17);
      *(void *)&a5->float var0 = vaddq_f32(v19, v18).u64[0];
    }
  }
  long long v22 = *(_OWORD *)&a5->var0;
  long long v23 = *(_OWORD *)&a5->var2;
  _OWORD *v6 = *(_OWORD *)&a5->var0;
  v6[1] = v23;
  return ($153C3A5BC4E016D58A1B9CA554FFC462)v22;
}

- (void)prepareForLayout
{
  self->_updateTime = CACurrentMediaTime();
  begin = self->_pressStates.__map_.__begin_;
  if (self->_pressStates.__map_.__end_ != begin)
  {
    unint64_t start = self->_pressStates.__start_;
    CFTimeInterval v5 = &begin[start >> 6];
    unint64_t v6 = (unint64_t)*v5 + 64 * (start & 0x3F);
    unint64_t v7 = *(unint64_t *)((char *)begin
                             + (((self->_pressStates.__size_.__value_ + start) >> 3) & 0x1FFFFFFFFFFFFFF8))
       + 64 * ((self->_pressStates.__size_.__value_ + start) & 0x3F);
    if (v6 != v7)
    {
      p_delegate = &self->_delegate;
      do
      {
        id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
        float32x4_t v10 = WeakRetained;
        if (WeakRetained)
        {
          [WeakRetained originalLayoutAttributesForHex:*(void *)(v6 + 8)];
        }
        else
        {
          long long v12 = 0u;
          long long v13 = 0u;
        }
        *(_OWORD *)(v6 + 32) = v12;
        *(_OWORD *)(v6 + 48) = v13;

        v6 += 64;
        if (v6 - (void)*v5 == 4096)
        {
          int v11 = v5[1];
          ++v5;
          unint64_t v6 = (unint64_t)v11;
        }
      }
      while (v6 != v7);
    }
  }
}

- (void)cleanupAfterLayout
{
  if (self->_pressStates.__size_.__value_)
  {
    long long v10 = xmmword_2DF50;
    do
    {
      uint64_t v3 = *(uint64_t *)((char *)self->_pressStates.__map_.__begin_
                      + ((self->_pressStates.__start_ >> 3) & 0x1FFFFFFFFFFFFFF8));
      unint64_t v4 = self->_pressStates.__start_ & 0x3F;
      uint64_t v5 = v3 + (v4 << 6);
      if (!*(unsigned char *)(v5 + 16)) {
        break;
      }
      if (self->_updateTime <= *(double *)(v5 + 24) + self->_springDuration) {
        break;
      }
      uint64_t v6 = v3 + (v4 << 6);
      unint64_t v7 = sub_5D44(&self->_pressedHexes.__table_.__bucket_list_.__ptr_.__value_, (int *)(v6 + 8));
      sub_5E00(&self->_pressedHexes.__table_.__bucket_list_.__ptr_.__value_, v7);
      uint64_t v12 = *(void *)(v6 + 8);
      long long v13 = xmmword_2DF40;
      uint64_t v14 = v12;
      int v15 = 0;
      *(void *)&v11[4] = 0;
      while (1)
      {
        *(void *)int v11 = sub_4628(&v12);
        *(_DWORD *)&v11[8] = v8;
        if (!v11[0]) {
          break;
        }
        int v9 = sub_5D44(&self->_pressedHexes.__table_.__bucket_list_.__ptr_.__value_, (int *)&v11[4]);
        sub_5E00(&self->_pressedHexes.__table_.__bucket_list_.__ptr_.__value_, v9);
      }
      *(int64x2_t *)&self->_pressStates.__start_ = vaddq_s64(*(int64x2_t *)&self->_pressStates.__start_, (int64x2_t)xmmword_2DF50);
      sub_5F78((uint64_t)&self->_pressStates, 1);
    }
    while (self->_pressStates.__size_.__value_);
  }
  [(CSLPressStateApplier *)self _updateDisplayLink];
}

- (BOOL)_needsDisplayLink
{
  return [(CSLPressStateApplier *)self isEnabled];
}

- (void)_updateDisplayLink
{
  unsigned int v3 = [(CSLPressStateApplier *)self _needsDisplayLink];
  displayLink = self->_displayLink;
  if (v3)
  {
    if (displayLink) {
      return;
    }
    uint64_t v5 = +[CADisplayLink displayLinkWithTarget:self selector:"_displayLinkFired:"];
    uint64_t v6 = self->_displayLink;
    self->_displayLink = v5;

    unint64_t v7 = self->_displayLink;
    uint64_t v9 = +[NSRunLoop currentRunLoop];
    -[CADisplayLink addToRunLoop:forMode:](v7, "addToRunLoop:forMode:");
    int v8 = (CADisplayLink *)v9;
  }
  else
  {
    if (!displayLink) {
      return;
    }
    [(CADisplayLink *)displayLink invalidate];
    int v8 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (void)_displayLinkFired:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pressStateApplierDidUpdate];
}

- (CSLPressStateApplierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSLPressStateApplierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  sub_60D0((uint64_t)&self->_pressedHexes);
  sub_5FD8(&self->_pressStates.__map_.__first_);
  objc_storeStrong((id *)&self->_displayLink, 0);

  objc_storeStrong((id *)&self->_spring, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_DWORD *)self + 30) = 1065353216;
  return self;
}

@end