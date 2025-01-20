@interface SMTNoiseSampler
- (SMTNoiseSampler)init;
- (SMTNoiseSampler)initWithUnigram:(float *)a3 ofSize:(unint64_t)a4;
- (SMTNoiseSampler)initWithZipfOfSize:(unint64_t)a3;
- (id).cxx_construct;
- (unint64_t)drawNoise;
@end

@implementation SMTNoiseSampler

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  unsigned int v2 = 5489;
  *((_DWORD *)self + 14) = 5489;
  uint64_t v3 = 1;
  for (uint64_t i = 15; i != 638; ++i)
  {
    int v5 = 1812433253 * (v2 ^ (v2 >> 30));
    unsigned int v2 = v5 + v3;
    *((_DWORD *)self + i) = i + v5 - 14;
    ++v3;
  }
  *((void *)self + 319) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_unigram.__begin_;
  if (begin)
  {
    self->_unigram.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_alias.__begin_;
  if (v4)
  {
    self->_alias.__end_ = v4;
    operator delete(v4);
  }
}

- (unint64_t)drawNoise
{
  p_generator = &self->_generator;
  int64_t v4 = (char *)self->_unigram.__end_ - (char *)self->_unigram.__begin_;
  uint64_t v5 = v4 >> 2;
  if (v4)
  {
    unint64_t v6 = v5 + 1;
    if (v5 == -1)
    {
      sub_1000066AC((uint64_t)v16, (uint64_t)p_generator, 0x40uLL);
      unint64_t v9 = sub_100006798((uint64_t)v16);
    }
    else
    {
      unint64_t v7 = __clz(v6);
      uint64_t v8 = 63;
      if (((v6 << v7) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        uint64_t v8 = 64;
      }
      sub_1000066AC((uint64_t)v16, (uint64_t)p_generator, v8 - v7);
      do
        unint64_t v9 = sub_100006798((uint64_t)v16);
      while (v9 >= v6);
    }
    uint64_t v5 = v9;
  }
  float v10 = self->_unigram.__begin_[v5];
  unint64_t v11 = self->_alias.__begin_[v5];
  double v12 = v10;
  double v13 = (double)sub_10000660C((uint64_t)p_generator);
  if ((v13 + (double)sub_10000660C((uint64_t)p_generator) * 4294967300.0) * 5.42101086e-20 + 0.0 >= v12) {
    unint64_t v14 = v11;
  }
  else {
    unint64_t v14 = v5;
  }
  return (unint64_t)(float)v14;
}

- (SMTNoiseSampler)initWithUnigram:(float *)a3 ofSize:(unint64_t)a4
{
  v83.receiver = self;
  v83.super_class = (Class)SMTNoiseSampler;
  unint64_t v6 = [(SMTNoiseSampler *)&v83 init];
  if (!v6) {
    return v6;
  }
  sub_1000070F4(&__token, "/dev/urandom");
  std::random_device::random_device(&v81, &__token);
  if (SHIBYTE(__token.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__token.__r_.__value_.__l.__data_);
  }
  std::random_device::result_type v7 = std::random_device::operator()(&v81);
  LODWORD(__src[0]) = v7;
  for (uint64_t i = 1; i != 624; ++i)
  {
    std::random_device::result_type v7 = i + 1812433253 * (v7 ^ (v7 >> 30));
    *((_DWORD *)__src + i) = v7;
  }
  __src[312] = 0;
  memcpy(&v6->_generator, __src, sizeof(v6->_generator));
  std::random_device::~random_device(&v81);
  LODWORD(__src[0]) = 0;
  p_unigram = &v6->_unigram;
  sub_100006E7C((char **)&v6->_unigram, a4, __src);
  begin = v6->_alias.__begin_;
  end = v6->_alias.__end_;
  unint64_t v11 = end - begin;
  if (a4 <= v11)
  {
    if (a4 < v11) {
      v6->_alias.__end_ = &begin[a4];
    }
  }
  else
  {
    value = v6->_alias.__end_cap_.__value_;
    if (a4 - v11 <= value - end)
    {
      v26 = &end[a4 - v11];
      unint64_t v27 = 8 * a4 - 8 * v11;
      do
      {
        *end++ = 0;
        v27 -= 8;
      }
      while (v27);
      v6->_alias.__end_ = v26;
    }
    else
    {
      if (a4 >> 61) {
        sub_100006FA8();
      }
      unint64_t v13 = (char *)value - (char *)begin;
      unint64_t v14 = ((char *)value - (char *)begin) >> 2;
      if (v14 <= a4) {
        unint64_t v14 = a4;
      }
      if (v13 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v15 = v14;
      }
      v16 = (char *)sub_100006FC0(v15);
      v18 = &v16[8 * v11];
      v19 = (unint64_t *)&v16[8 * a4];
      v20 = v18;
      unint64_t v21 = 8 * a4 - 8 * v11;
      do
      {
        *(void *)v20 = 0;
        v20 += 8;
        v21 -= 8;
      }
      while (v21);
      v22 = (unint64_t *)&v16[8 * v17];
      v23 = v6->_alias.__begin_;
      for (j = v6->_alias.__end_; j != v23; --j)
      {
        uint64_t v25 = *(j - 1);
        *((void *)v18 - 1) = v25;
        v18 -= 8;
      }
      v6->_alias.__begin_ = (unint64_t *)v18;
      v6->_alias.__end_ = v19;
      v6->_alias.__end_cap_.__value_ = v22;
      if (v23) {
        operator delete(v23);
      }
    }
  }
  if (!a4) {
    return v6;
  }
  v78 = v6;
  v79 = a3;
  v28 = 0;
  v29 = 0;
  v30 = 0;
  unint64_t v31 = 0;
  v32 = 0;
  unint64_t v33 = 0;
  uint64_t v34 = 0;
  do
  {
    float v35 = a3[v34] * (float)a4;
    p_unigram->__begin_[v34] = v35;
    if (v35 >= 1.0)
    {
      if ((unint64_t)v29 < v33)
      {
        *(void *)v29 = v34;
        v29 += 8;
        goto LABEL_64;
      }
      uint64_t v40 = (v29 - v32) >> 3;
      unint64_t v41 = v40 + 1;
      if ((unint64_t)(v40 + 1) >> 61) {
LABEL_122:
      }
        sub_100006FA8();
      if ((uint64_t)(v33 - (void)v32) >> 2 > v41) {
        unint64_t v41 = (uint64_t)(v33 - (void)v32) >> 2;
      }
      if (v33 - (unint64_t)v32 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v42 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v42 = v41;
      }
      if (v42) {
        unint64_t v42 = (unint64_t)sub_100006FC0(v42);
      }
      else {
        uint64_t v43 = 0;
      }
      v47 = (char *)(v42 + 8 * v40);
      *(void *)v47 = v34;
      v48 = v47 + 8;
      while (v29 != v32)
      {
        uint64_t v49 = *((void *)v29 - 1);
        v29 -= 8;
        *((void *)v47 - 1) = v49;
        v47 -= 8;
      }
      unint64_t v33 = v42 + 8 * v43;
      if (v32) {
        operator delete(v32);
      }
      v29 = v48;
      v32 = v47;
    }
    else
    {
      if ((unint64_t)v28 < v31)
      {
        *(void *)v28 = v34;
        v28 += 8;
        goto LABEL_64;
      }
      uint64_t v36 = (v28 - v30) >> 3;
      unint64_t v37 = v36 + 1;
      if ((unint64_t)(v36 + 1) >> 61) {
        goto LABEL_122;
      }
      if ((uint64_t)(v31 - (void)v30) >> 2 > v37) {
        unint64_t v37 = (uint64_t)(v31 - (void)v30) >> 2;
      }
      if (v31 - (unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v38 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v38 = v37;
      }
      if (v38) {
        unint64_t v38 = (unint64_t)sub_100006FC0(v38);
      }
      else {
        uint64_t v39 = 0;
      }
      v44 = (char *)(v38 + 8 * v36);
      *(void *)v44 = v34;
      v45 = v44 + 8;
      while (v28 != v30)
      {
        uint64_t v46 = *((void *)v28 - 1);
        v28 -= 8;
        *((void *)v44 - 1) = v46;
        v44 -= 8;
      }
      unint64_t v31 = v38 + 8 * v39;
      if (v30) {
        operator delete(v30);
      }
      v28 = v45;
      v30 = v44;
    }
    a3 = v79;
LABEL_64:
    ++v34;
  }
  while (v34 != a4);
  if (v28 != v30)
  {
    while (v29 != v32)
    {
      v51 = v28 - 8;
      uint64_t v50 = *((void *)v28 - 1);
      v52 = v29 - 8;
      unint64_t v53 = *((void *)v29 - 1);
      v78->_alias.__begin_[v50] = v53;
      v54 = v78->_unigram.__begin_;
      float v55 = v54[v53] + -1.0 + v54[v50];
      v54[v53] = v55;
      if (v55 >= 1.0)
      {
        if ((unint64_t)v52 >= v33)
        {
          uint64_t v60 = (v52 - v32) >> 3;
          unint64_t v61 = v60 + 1;
          if ((unint64_t)(v60 + 1) >> 61) {
LABEL_123:
          }
            sub_100006FA8();
          if ((uint64_t)(v33 - (void)v32) >> 2 > v61) {
            unint64_t v61 = (uint64_t)(v33 - (void)v32) >> 2;
          }
          if (v33 - (unint64_t)v32 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v62 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v62 = v61;
          }
          if (v62) {
            unint64_t v62 = (unint64_t)sub_100006FC0(v62);
          }
          else {
            uint64_t v63 = 0;
          }
          v66 = (char *)(v62 + 8 * v60);
          *(void *)v66 = v53;
          v67 = v66 + 8;
          while (v52 != v32)
          {
            uint64_t v68 = *((void *)v52 - 1);
            v52 -= 8;
            *((void *)v66 - 1) = v68;
            v66 -= 8;
          }
          unint64_t v33 = v62 + 8 * v63;
          if (v32) {
            operator delete(v32);
          }
          v52 = v67;
          v32 = v66;
        }
        else
        {
          *(void *)v52 = v53;
          v52 = v29;
        }
        v28 = v51;
      }
      else if ((unint64_t)v51 >= v31)
      {
        uint64_t v56 = (v51 - v30) >> 3;
        unint64_t v57 = v56 + 1;
        if ((unint64_t)(v56 + 1) >> 61) {
          goto LABEL_123;
        }
        if ((uint64_t)(v31 - (void)v30) >> 2 > v57) {
          unint64_t v57 = (uint64_t)(v31 - (void)v30) >> 2;
        }
        if (v31 - (unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v58 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v58 = v57;
        }
        if (v58) {
          unint64_t v58 = (unint64_t)sub_100006FC0(v58);
        }
        else {
          uint64_t v59 = 0;
        }
        v64 = (char *)(v58 + 8 * v56);
        *(void *)v64 = v53;
        v28 = v64 + 8;
        while (v51 != v30)
        {
          uint64_t v65 = *((void *)v51 - 1);
          v51 -= 8;
          *((void *)v64 - 1) = v65;
          v64 -= 8;
        }
        unint64_t v31 = v58 + 8 * v59;
        if (v30) {
          operator delete(v30);
        }
        v30 = v64;
      }
      else
      {
        *(void *)v51 = v53;
      }
      v29 = v52;
      if (v28 == v30) {
        goto LABEL_111;
      }
    }
    if (v30 != v28)
    {
      unint64_t v69 = (v28 - v30) >> 3;
      v70 = p_unigram->__begin_;
      if (v69 <= 1) {
        unint64_t v69 = 1;
      }
      v71 = v30;
      do
      {
        uint64_t v72 = *(void *)v71;
        v71 += 8;
        v70[v72] = 1.0;
        --v69;
      }
      while (v69);
    }
  }
  v52 = v29;
LABEL_111:
  if (v52 == v32)
  {
    if (v32) {
      goto LABEL_118;
    }
  }
  else
  {
    unint64_t v73 = (v52 - v32) >> 3;
    v74 = p_unigram->__begin_;
    if (v73 <= 1) {
      unint64_t v73 = 1;
    }
    v75 = v32;
    do
    {
      uint64_t v76 = *(void *)v75;
      v75 += 8;
      v74[v76] = 1.0;
      --v73;
    }
    while (v73);
LABEL_118:
    operator delete(v32);
  }
  unint64_t v6 = v78;
  if (v30) {
    operator delete(v30);
  }
  return v6;
}

- (SMTNoiseSampler)initWithZipfOfSize:(unint64_t)a3
{
  if (a3)
  {
    if (a3 >> 62) {
      sub_100006FA8();
    }
    uint64_t v5 = (char *)sub_1000070BC(a3);
    bzero(v5, 4 * a3);
    double v6 = log((double)(a3 + 1));
    unint64_t v7 = 0;
    float v8 = 0.0;
    do
    {
      float v9 = logf((float)v7 + 2.0);
      float v10 = (float)(v9 - logf((float)v7 + 1.0)) / v6;
      float v8 = v8 + v10;
      *(float *)&v5[4 * v7++] = v10;
    }
    while (a3 != v7);
    uint64_t v11 = 0;
    do
    {
      *(float *)&v5[4 * v11] = *(float *)&v5[4 * v11] / v8;
      ++v11;
    }
    while (a3 != v11);
    double v12 = &v5[4 * a3];
  }
  else
  {
    uint64_t v5 = 0;
    double v12 = 0;
  }
  unint64_t v13 = [(SMTNoiseSampler *)self initWithUnigram:v5 ofSize:(v12 - v5) >> 2];
  if (v5) {
    operator delete(v5);
  }
  return v13;
}

- (SMTNoiseSampler)init
{
  return 0;
}

@end