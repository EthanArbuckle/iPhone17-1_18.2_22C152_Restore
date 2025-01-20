@interface PolyNomialExtrapolation
- (BOOL)ready;
- (PolyNomialExtrapolation)initWithHistorySize:(unint64_t)a3 degreeOfPolynomial:(unint64_t)a4;
- (double)predict;
- (id).cxx_construct;
- (void)predict;
- (void)printHistoryNamed:(id)a3;
- (void)pushPoint:(PolyNomialExtrapolation *)self;
@end

@implementation PolyNomialExtrapolation

- (PolyNomialExtrapolation)initWithHistorySize:(unint64_t)a3 degreeOfPolynomial:(unint64_t)a4
{
  int v4 = a4;
  int v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PolyNomialExtrapolation;
  v6 = [(PolyNomialExtrapolation *)&v19 init];
  v7 = v6;
  v8 = v6;
  if (v6)
  {
    v6->_unsigned int N = v5;
    v6->_n = v4;
    std::vector<float>::resize((uint64_t)&v6->_g, v5);
    begin = v8->_g.__begin_;
    end = v8->_g.__end_;
    if (begin != end)
    {
      int v11 = 0;
      do
        *begin++ = (float)v11++;
      while (begin != end);
    }
    unsigned int N = v8->_N;
    int v13 = v8->_n + 1;
    v8->_A[0].m_rows = N;
    v8->_A[0].m_cols = v13;
    cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v7->_A, v13 * N);
    unsigned int v14 = v8->_N;
    int v15 = v8->_n + 1;
    v8->_A[1].m_rows = v14;
    v8->_A[1].m_cols = v15;
    cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)&v7->_A[1], v15 * v14);
    unint64_t v16 = v8->_N;
    v8->_b[0].m_rows = v16;
    cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v7->_b, v16);
    unint64_t v17 = v8->_N;
    v8->_b[1].m_rows = v17;
    cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)&v7->_b[1], v17);
  }
  return v8;
}

- (BOOL)ready
{
  unint64_t value = self->_x.__size_.__value_;
  return value >= self->_N && value == self->_y.__size_.__value_;
}

- (void)pushPoint:(PolyNomialExtrapolation *)self
{
  float v6 = *((float *)&v2 + 1);
  p_x = &self->_x;
  int v8 = v2;
  std::deque<float>::push_back(&self->_x.__map_.__first_, (float *)&v8);
  float v7 = v6;
  std::deque<float>::push_back(&self->_y.__map_.__first_, &v7);
  unint64_t value = self->_x.__size_.__value_;
  if (value > self->_N)
  {
    ++self->_x.__start_;
    self->_x.__size_.__value_ = value - 1;
    std::deque<float>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)p_x, 1);
    *(int64x2_t *)&self->_y.__start_ = vaddq_s64(*(int64x2_t *)&self->_y.__start_, (int64x2_t)xmmword_21B813CC0);
    std::deque<float>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)&self->_y, 1);
  }
}

- (double)predict
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if ([(id)a1 ready])
  {
    uint64_t v28 = *(unsigned int *)(a1 + 8);
    if ((int)v28 >= 1)
    {
      unint64_t v2 = 0;
      uint64_t v29 = *(unsigned int *)(a1 + 12);
      do
      {
        if ((v29 & 0x80000000) == 0)
        {
          unint64_t v3 = *(unsigned int *)(a1 + 32);
          if (v2 < v3)
          {
            unint64_t v4 = 0;
            uint64_t v5 = *(void *)(a1 + 112);
            uint64_t v6 = *(unsigned int *)(a1 + 36);
            int v7 = v29;
            unsigned int v8 = v2;
            while (v6 != v4)
            {
              float v9 = pow(*(float *)(v5 + 4 * v2), (double)v7);
              *(float *)(*(void *)(a1 + 16) + 4 * v8) = v9;
              double v10 = pow(*(float *)(v5 + 4 * v2), (double)v7);
              unint64_t v11 = *(unsigned int *)(a1 + 56);
              if (v2 >= v11 || v4 >= *(unsigned int *)(a1 + 60)) {
                -[PolyNomialExtrapolation predict]();
              }
              float v12 = v10;
              *(float *)(*(void *)(a1 + 40) + 4 * (v2 + v11 * v4++)) = v12;
              v8 += v3;
              --v7;
              if (v29 + 1 == v4) {
                goto LABEL_11;
              }
            }
          }
          -[PolyNomialExtrapolation predict]();
        }
LABEL_11:
        ++v2;
      }
      while (v2 != (v28 & ~((int)v28 >> 31)));
    }
    if ((int)v28 >= 1)
    {
      unint64_t v13 = 0;
      uint64_t v14 = *(unsigned int *)(a1 + 80);
      do
      {
        if (v14 == v13) {
          -[PolyNomialExtrapolation predict]();
        }
        *(_DWORD *)(*(void *)(a1 + 64) + 4 * v13) = *(_DWORD *)(*(void *)(*(void *)(a1 + 144)
                                                                            + (((v13 + *(void *)(a1 + 168)) >> 7) & 0x1FFFFFFFFFFFFF8))
                                                                + 4 * ((v13 + *(void *)(a1 + 168)) & 0x3FF));
        if (v13 >= *(unsigned int *)(a1 + 104)) {
          -[PolyNomialExtrapolation predict]();
        }
        *(_DWORD *)(*(void *)(a1 + 88) + 4 * v13) = *(_DWORD *)(*(void *)(*(void *)(a1 + 192)
                                                                            + (((v13 + *(void *)(a1 + 216)) >> 7) & 0x1FFFFFFFFFFFFF8))
                                                                + 4 * ((v13 + *(void *)(a1 + 216)) & 0x3FF));
        ++v13;
      }
      while (v28 != v13);
    }
    unsigned int v41 = 869711765;
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::SVD<cva::Matrix<float,0u,0u,false>>((uint64_t)v33, (_DWORD *)(a1 + 16), 3, 0);
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(v33, &v41, (uint64_t)v36);
    if (v38 != *(_DWORD *)(a1 + 80)) {
      __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
    }
    v39[0] = 0;
    v39[1] = 0;
    cva::MatrixData<int,0ul,0ul,false>::allocate(v39, v37);
    unsigned int v40 = v37;
    v43 = v36;
    uint64_t v44 = a1 + 64;
    if (v38 != *(_DWORD *)(a1 + 80)) {
      __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
    }
    int v45 = 1065353216;
    cva::assign<false,false,cva::Matrix<float,0u,1u,false>,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,1u,false>>((uint64_t)v39, (uint64_t)v42);
    free(v36[0]);
    free(v35);
    free(v34);
    free(v33[0]);
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::SVD<cva::Matrix<float,0u,0u,false>>((uint64_t)v33, (_DWORD *)(a1 + 40), 3, 0);
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(v33, &v41, (uint64_t)v30);
    if (v32 != *(_DWORD *)(a1 + 104)) {
      __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
    }
    v36[0] = 0;
    v36[1] = 0;
    cva::MatrixData<int,0ul,0ul,false>::allocate(v36, v31);
    unsigned int v37 = v31;
    v43 = v30;
    uint64_t v44 = a1 + 88;
    if (v32 != *(_DWORD *)(a1 + 104)) {
      __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
    }
    int v45 = 1065353216;
    cva::assign<false,false,cva::Matrix<float,0u,1u,false>,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,1u,false>>((uint64_t)v36, (uint64_t)v42);
    free(v30[0]);
    free(v35);
    free(v34);
    free(v33[0]);
    uint64_t v15 = *(unsigned int *)(a1 + 12);
    unint64_t v16 = v36[0];
    if ((v15 & 0x80000000) != 0)
    {
      float32x2_t v22 = 0;
    }
    else
    {
      unint64_t v17 = (__int32 *)v39[0];
      if (v15 >= v37) {
        unsigned int v18 = v37;
      }
      else {
        unsigned int v18 = *(_DWORD *)(a1 + 12);
      }
      if (v18 >= v40) {
        unsigned int v19 = v40;
      }
      else {
        unsigned int v19 = v18;
      }
      BOOL v21 = v40 <= v18 || v37 == v19;
      float32x2_t v22 = 0;
      v23 = (__int32 *)v36[0];
      do
      {
        if (v21) {
          __assert_rtn("assert_in_bounds", "matrixmixin.h", 2269, "((row < mixed().rows()) && (col < mixed().columns())) || cva::detail::assertMessage(\"Index out of bounds!\")");
        }
        double v24 = pow((double)*(int *)(a1 + 8), (double)(int)v15);
        __int32 v25 = *v17++;
        v26.i32[0] = v25;
        v26.i32[1] = *v23++;
        float32x2_t v22 = vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(v22), vcvtq_f64_f32(v26), v24));
        --v15;
      }
      while (v15 != -1);
    }
    free(v16);
    free(v39[0]);
  }
  else
  {
    float32x2_t v22 = (float32x2_t)vdup_n_s32(0x7FC00000u);
  }
  return *(double *)&v22;
}

- (void)printHistoryNamed:(id)a3
{
  printf("%s = [", (const char *)[a3 UTF8String]);
  if (self->_x.__size_.__value_)
  {
    unint64_t v4 = 0;
    do
    {
      printf("%f, %f;",
        (*(float **)((char *)self->_x.__map_.__begin_ + (((v4 + self->_x.__start_) >> 7) & 0x1FFFFFFFFFFFFF8)))[(v4 + self->_x.__start_) & 0x3FF],
        (*(float **)((char *)self->_y.__map_.__begin_ + (((v4 + self->_y.__start_) >> 7) & 0x1FFFFFFFFFFFFF8)))[(v4 + self->_y.__start_) & 0x3FF]);
      ++v4;
    }
    while (self->_x.__size_.__value_ > v4);
  }
  puts("];");
}

- (void).cxx_destruct
{
  std::deque<float>::~deque[abi:ne180100](&self->_y.__map_.__first_);
  std::deque<float>::~deque[abi:ne180100](&self->_x.__map_.__first_);
  begin = self->_g.__begin_;
  if (begin)
  {
    self->_g.__end_ = begin;
    operator delete(begin);
  }
  for (uint64_t i = 88; i != 40; i -= 24)
    free(*(void **)((char *)&self->super.isa + i));
  do
  {
    free(*(void **)((char *)&self->super.isa + i));
    i -= 24;
  }
  while (i != -8);
}

- (id).cxx_construct
{
  for (uint64_t i = 16; i != 64; i += 24)
  {
    unint64_t v3 = (char *)self + i;
    *unint64_t v3 = 0;
    v3[1] = 0;
    v3[2] = 0;
  }
  for (uint64_t j = 64; j != 112; j += 24)
  {
    uint64_t v5 = (char *)self + j;
    *(void *)uint64_t v5 = 0;
    *((void *)v5 + 1) = 0;
    *((_DWORD *)v5 + 4) = 0;
  }
  *((void *)self + 28) = 0;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 7) = 0u;
  return self;
}

- (void)predict
{
}

@end