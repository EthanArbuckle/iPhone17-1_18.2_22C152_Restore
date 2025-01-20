@interface PKLiveStrokePath
- (PKLiveStrokePath)initWithPoints:(PKCompressedStrokePoint *)a3 count:(unint64_t)a4 immutableCount:(unint64_t)a5 inputType:(int64_t)a6 timestamp:(double)a7 UUID:(id)a8 inputPoints:(const void *)a9;
- (id).cxx_construct;
- (id)regenerateStrokeWithInk:(id)a3 randomSeed:(unsigned int)a4 strokeClass:(Class)a5;
@end

@implementation PKLiveStrokePath

- (PKLiveStrokePath)initWithPoints:(PKCompressedStrokePoint *)a3 count:(unint64_t)a4 immutableCount:(unint64_t)a5 inputType:(int64_t)a6 timestamp:(double)a7 UUID:(id)a8 inputPoints:(const void *)a9
{
  id v16 = a8;
  v35.receiver = self;
  v35.super_class = (Class)PKLiveStrokePath;
  v17 = [(PKStrokePath *)&v35 initWithPoints:a3 count:a4 immutableCount:a5 inputType:a6 timestamp:v16 UUID:a7];
  v18 = v17;
  p_inputPoints = &v17->_inputPoints;
  begin = v17->_inputPoints.__begin_;
  if (&v17->_inputPoints == a9)
  {
    v28 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*((void *)a9 + 1);
    goto LABEL_22;
  }
  v21 = *(char **)a9;
  v22 = (char *)*((void *)a9 + 1);
  int64_t v23 = (int64_t)&v22[-*(void *)a9];
  unint64_t v24 = v23 >> 7;
  uint64_t value = (uint64_t)v17->_inputPoints.__end_cap_.__value_;
  if (v23 >> 7 <= (unint64_t)((value - (uint64_t)begin) >> 7))
  {
    end = v17->_inputPoints.__end_;
    unint64_t v30 = (end - begin) >> 7;
    if (v30 < v24)
    {
      v31 = &v21[128 * v30];
      if (end != begin)
      {
        memmove(v17->_inputPoints.__begin_, v21, end - begin);
        begin = p_inputPoints->__end_;
      }
      int64_t v23 = v22 - v31;
      if (v22 == v31) {
        goto LABEL_21;
      }
      v32 = begin;
      v33 = v31;
      goto LABEL_20;
    }
  }
  else
  {
    if (begin)
    {
      v17->_inputPoints.__end_ = begin;
      operator delete(begin);
      uint64_t value = 0;
      p_inputPoints->__begin_ = 0;
      p_inputPoints->__end_ = 0;
      p_inputPoints->__end_cap_.__value_ = 0;
    }
    if (v23 < 0) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v26 = value >> 6;
    if (value >> 6 <= v24) {
      uint64_t v26 = v23 >> 7;
    }
    if ((unint64_t)value >= 0x7FFFFFFFFFFFFF80) {
      unint64_t v27 = 0x1FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v27 = v26;
    }
    std::vector<PKInputPoint>::__vallocate[abi:ne180100](p_inputPoints, v27);
    begin = p_inputPoints->__end_;
  }
  if (v22 != v21)
  {
    v32 = begin;
    v33 = v21;
LABEL_20:
    memmove(v32, v33, v23);
  }
LABEL_21:
  v28 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v23);
  p_inputPoints->__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v23);
  begin = p_inputPoints->__begin_;
LABEL_22:
  while (begin != v28)
  {
    *((void *)begin + 10) = -1;
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 128);
  }

  return v18;
}

- (id)regenerateStrokeWithInk:(id)a3 randomSeed:(unsigned int)a4 strokeClass:(Class)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = objc_alloc_init(PKStrokeGenerator);
  [(PKStrokeGenerator *)v9 setCaptureLiveData:1];
  v10 = [(PKStrokeGenerator *)v9 strokeFromInputPoints:&self->_inputPoints inputType:[(PKStrokePath *)self _inputType] ink:v8 inputScale:v6 randomSeed:a5 strokeClass:1.0];

  return v10;
}

- (void).cxx_destruct
{
  p_inputPoints = &self->_inputPoints;
  begin = self->_inputPoints.__begin_;
  if (begin)
  {
    p_inputPoints->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 14) = 0;
  return self;
}

@end