@interface CHBoxcarFilterPointFIFO
- (CHBoxcarFilterPointFIFO)initWithFIFO:(id)a3 width:(unint64_t)a4;
- (CHBoxcarFilterPointFIFO)initWithFIFO:(id)a3 width:(unint64_t)a4 spacing:(float)a5;
- (float)spacing;
- (id).cxx_construct;
- (unint64_t)width;
- (void)addPoint:(CHBoxcarFilterPointFIFO *)self;
- (void)clear;
- (void)flush;
- (void)setSpacing:(float)a3;
- (void)setWidth:(unint64_t)a3;
@end

@implementation CHBoxcarFilterPointFIFO

- (CHBoxcarFilterPointFIFO)initWithFIFO:(id)a3 width:(unint64_t)a4 spacing:(float)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CHBoxcarFilterPointFIFO;
  result = [(CHPointFIFO *)&v8 initWithFIFO:a3];
  if (result)
  {
    result->_width = a4;
    result->_spacing = a5;
  }
  return result;
}

- (CHBoxcarFilterPointFIFO)initWithFIFO:(id)a3 width:(unint64_t)a4
{
  return (CHBoxcarFilterPointFIFO *)objc_msgSend_initWithFIFO_width_spacing_(self, a2, (uint64_t)a3, a4, v4, v5, 0.0);
}

- (void)addPoint:(CHBoxcarFilterPointFIFO *)self
{
  objc_super v8 = self + 1;
  isa = (char *)self[1].super.super.isa;
  nextFIFO = self[1].super._nextFIFO;
  uint64_t v11 = ((char *)nextFIFO - isa) >> 4;
  if (nextFIFO == (CHPointFIFO *)isa)
  {
    unint64_t v15 = *(void *)&self[1]._spacing;
    if ((unint64_t)nextFIFO < v15)
    {
      CHPointFIFO *nextFIFO = (CHPointFIFO)v6;
      v16 = nextFIFO + 1;
      goto LABEL_37;
    }
    float32x4_t v36 = v6;
    uint64_t v17 = v15 - (void)isa;
    if (v17 >> 3 <= (unint64_t)(v11 + 1)) {
      uint64_t v18 = v11 + 1;
    }
    else {
      uint64_t v18 = v17 >> 3;
    }
    BOOL v19 = (unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0;
    unint64_t v20 = 0xFFFFFFFFFFFFFFFLL;
    if (!v19) {
      unint64_t v20 = v18;
    }
    if (!(v20 >> 60))
    {
      uint64_t v21 = 16 * v20;
      v22 = (char *)operator new(16 * v20);
      v23 = (objc_class *)&v22[16 * v11];
      v8->super.super.isa = v23;
      *(float32x4_t *)v23 = v36;
      v16 = (CHPointFIFO *)((char *)v23 + 16);
      v8->super._nextFIFO = v16;
      *(void *)&v8->_spacing = &v22[v21];
      if (nextFIFO) {
        operator delete(nextFIFO);
      }
      goto LABEL_37;
    }
    goto LABEL_41;
  }
  float32x4_t v12 = vsubq_f32((float32x4_t)nextFIFO[-1], v6);
  int8x16_t v13 = (int8x16_t)vmulq_f32(v12, v12);
  if (sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v13.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL)))) >= self->_spacing)
  {
    unint64_t v14 = *(void *)&self[1]._spacing;
    if ((unint64_t)nextFIFO < v14)
    {
      *nextFIFO++ = (CHPointFIFO)v6;
LABEL_29:
      v8->super._nextFIFO = nextFIFO;
      isa = (char *)v8->super.super.isa;
      uint64_t v11 = ((char *)nextFIFO - (char *)v8->super.super.isa) >> 4;
      goto LABEL_30;
    }
    unint64_t v24 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 60) {
      sub_1C494A220();
    }
    uint64_t v25 = v14 - (void)isa;
    if (v25 >> 3 > v24) {
      unint64_t v24 = v25 >> 3;
    }
    if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v26 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v26 = v24;
    }
    if (!v26)
    {
      v27 = 0;
      goto LABEL_25;
    }
    float32x4_t v37 = v6;
    if (!(v26 >> 60))
    {
      v27 = (char *)operator new(16 * v26);
      float32x4_t v6 = v37;
LABEL_25:
      v28 = (float32x4_t *)&v27[16 * v11];
      float32x4_t *v28 = v6;
      v29 = (objc_class *)v28;
      do
      {
        CHPointFIFO v30 = nextFIFO[-1];
        --nextFIFO;
        *((CHPointFIFO *)v29 - 1) = v30;
        v29 = (objc_class *)((char *)v29 - 16);
      }
      while (nextFIFO != (CHPointFIFO *)isa);
      v31 = &v27[16 * v26];
      Class v32 = v8->super.super.isa;
      nextFIFO = (CHPointFIFO *)&v28[1];
      v8->super.super.isa = v29;
      v8->super._nextFIFO = (CHPointFIFO *)&v28[1];
      *(void *)&v8->_spacing = v31;
      if (v32) {
        operator delete(v32);
      }
      goto LABEL_29;
    }
LABEL_41:
    sub_1C4949AA8();
  }
LABEL_30:
  if (v11 != self->_width) {
    return;
  }
  float32x4_t v33 = 0uLL;
  if (isa != (char *)nextFIFO)
  {
    v34 = (float32x4_t *)isa;
    do
    {
      float32x4_t v35 = *v34++;
      float32x4_t v33 = vaddq_f32(v33, v35);
    }
    while (v34 != (float32x4_t *)nextFIFO);
  }
  a2 = isa + 16;
  if (nextFIFO != (CHPointFIFO *)(isa + 16)) {
    memmove(isa, a2, (char *)nextFIFO - (isa + 16));
  }
  v16 = nextFIFO - 1;
LABEL_37:
  v8->super._nextFIFO = v16;
  objc_msgSend_emitPoint_(self, a2, v2, v3, v4, v5);
}

- (void)flush
{
  objc_super v8 = self + 1;
  Class isa = self[1].super.super.isa;
  nextFIFO = self[1].super._nextFIFO;
  uint64_t v11 = ((char *)nextFIFO - (char *)isa) >> 4;
  if (v11 == self->_width)
  {
    float32x4_t v12 = 0uLL;
    if (isa != (Class)nextFIFO)
    {
      Class v13 = self[1].super.super.isa;
      do
      {
        float32x4_t v14 = *(float32x4_t *)v13;
        Class v13 = (Class)((char *)v13 + 16);
        v6.i32[1] = v14.i32[1];
        float32x4_t v12 = vaddq_f32(v12, v14);
      }
      while (v13 != (Class)nextFIFO);
    }
    *(float *)v6.i32 = (float)(unint64_t)v11;
    float32x4_t v15 = vdivq_f32(v12, (float32x4_t)vdupq_lane_s32(v6, 0));
    v16 = (char *)isa + 16;
    int64_t v17 = (char *)nextFIFO - ((char *)isa + 16);
    if (nextFIFO != (CHPointFIFO *)((char *)isa + 16))
    {
      float32x4_t v18 = v15;
      memmove(self[1].super.super.isa, v16, (char *)nextFIFO - ((char *)isa + 16));
      v15.i64[0] = v18.i64[0];
    }
    v8->super._nextFIFO = (CHPointFIFO *)((char *)isa + v17);
    objc_msgSend_emitPoint_(self, (const char *)v16, v2, v3, v4, v5, *(double *)v15.i64, *(_OWORD *)&v18);
    Class isa = v8->super.super.isa;
    nextFIFO = v8->super._nextFIFO;
  }
  if (nextFIFO != (CHPointFIFO *)isa)
  {
    objc_msgSend_emitPoint_(self, a2, v2, v3, v4, v5, *(double *)&nextFIFO[-1].super.isa);
    Class isa = v8->super.super.isa;
  }
  v8->super._nextFIFO = (CHPointFIFO *)isa;
  v19.receiver = self;
  v19.super_class = (Class)CHBoxcarFilterPointFIFO;
  [(CHPointFIFO *)&v19 flush];
}

- (void)clear
{
  self[1].super._nextFIFO = (CHPointFIFO *)self[1].super.super.isa;
  v2.receiver = self;
  v2.super_class = (Class)CHBoxcarFilterPointFIFO;
  [(CHPointFIFO *)&v2 clear];
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (float)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(float)a3
{
  self->_spacing = a3;
}

- (void).cxx_destruct
{
  objc_super v2 = self + 1;
  Class isa = self[1].super.super.isa;
  if (isa)
  {
    v2->super._nextFIFO = (CHPointFIFO *)isa;
    operator delete(isa);
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end