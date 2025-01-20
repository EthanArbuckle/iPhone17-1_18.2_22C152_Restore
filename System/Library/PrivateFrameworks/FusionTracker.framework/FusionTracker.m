void sub_21762C1E0(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  MEMORY[0x21D449420](v2, 0x1090C406D3911BDLL);

  _Unwind_Resume(a1);
}

void sub_21762C208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

ft::HungarianMatcher *ft::HungarianMatcher::HungarianMatcher(ft::HungarianMatcher *this, unint64_t a2)
{
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  ft::HungarianMatcher::UpdateBuffers(this, a2);
  return this;
}

{
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  ft::HungarianMatcher::UpdateBuffers(this, a2);
  return this;
}

void sub_21762C250(_Unwind_Exception *a1)
{
  v3 = *(void **)(v1 + 48);
  if (v3)
  {
    *(void *)(v1 + 56) = v3;
    operator delete(v3);
  }
  ft::HungarianMatcher::HungarianMatcher((void **)(v1 + 24), v1);
  _Unwind_Resume(a1);
}

void ft::HungarianMatcher::UpdateBuffers(ft::HungarianMatcher *this, unint64_t a2)
{
  if (*((void *)this + 9) >= a2) {
    return;
  }
  uint64_t v6 = *((void *)this + 3);
  v4 = (std::vector<unsigned int> *)((char *)this + 24);
  uint64_t v5 = v6;
  v4[2].__begin_ = (std::vector<unsigned int>::pointer)a2;
  unint64_t v7 = ((uint64_t)v4->__end_ - v6) >> 2;
  BOOL v8 = a2 >= v7;
  BOOL v9 = a2 > v7;
  std::vector<unsigned int>::size_type v10 = a2 - v7;
  if (v9)
  {
    std::vector<unsigned int>::__append(v4, v10);
  }
  else if (!v8)
  {
    *((void *)this + 4) = v5 + 4 * a2;
  }
  unint64_t v11 = (uint64_t)(*((void *)this + 1) - *(void *)this) >> 2;
  if (a2 * a2 <= v11)
  {
    if (a2 * a2 < v11) {
      *((void *)this + 1) = *(void *)this + 4 * a2 * a2;
    }
  }
  else
  {
    std::vector<float>::__append((uint64_t)this, a2 * a2 - v11);
  }
  unsigned int v12 = bmMunkresTempBytes(a2);
  uint64_t v13 = v12;
  v15 = (char *)*((void *)this + 6);
  v14 = (char *)*((void *)this + 7);
  unint64_t v16 = v14 - v15;
  size_t v17 = v12 - (v14 - v15);
  if (v12 > (unint64_t)(v14 - v15))
  {
    uint64_t v18 = *((void *)this + 8);
    if (v18 - (uint64_t)v14 >= v17)
    {
      bzero(*((void **)this + 7), v17);
      *((void *)this + 7) = &v14[v17];
      return;
    }
    unint64_t v19 = v18 - (void)v15;
    uint64_t v20 = 2 * v19;
    if (2 * v19 <= v12) {
      uint64_t v20 = v12;
    }
    if (v19 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v21 = v20;
    }
    v22 = (char *)operator new(v21);
    v23 = &v22[v16];
    v24 = &v22[v21];
    v25 = &v22[v13];
    bzero(&v22[v16], v17);
    if (v14 == v15) {
      goto LABEL_38;
    }
    if (v16 >= 8 && (unint64_t)(v15 - v22) >= 0x20)
    {
      if (v16 < 0x20)
      {
        unint64_t v26 = 0;
        goto LABEL_30;
      }
      unint64_t v26 = v16 & 0xFFFFFFFFFFFFFFE0;
      v27 = v14 - 16;
      v28 = &v22[v14 - 16 - v15];
      unint64_t v29 = v16 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        long long v30 = *(_OWORD *)v27;
        *((_OWORD *)v28 - 1) = *((_OWORD *)v27 - 1);
        *(_OWORD *)v28 = v30;
        v28 -= 32;
        v27 -= 32;
        v29 -= 32;
      }
      while (v29);
      if (v16 == v26) {
        goto LABEL_37;
      }
      if ((v16 & 0x18) != 0)
      {
LABEL_30:
        v23 -= v16 & 0xFFFFFFFFFFFFFFF8;
        v31 = &v14[-v26 - 8];
        v32 = (char *)(v31 - v15);
        unint64_t v33 = v26 - (v16 & 0xFFFFFFFFFFFFFFF8);
        do
        {
          uint64_t v34 = *(void *)v31;
          v31 -= 8;
          *(void *)&v32[(void)v22] = v34;
          v32 -= 8;
          v33 += 8;
        }
        while (v33);
        v14 -= v16 & 0xFFFFFFFFFFFFFFF8;
        if (v16 == (v16 & 0xFFFFFFFFFFFFFFF8)) {
          goto LABEL_37;
        }
        goto LABEL_35;
      }
      v23 -= v26;
      v14 -= v26;
    }
LABEL_35:
    v35 = v23 - 1;
    do
    {
      char v36 = *--v14;
      *v35-- = v36;
    }
    while (v14 != v15);
LABEL_37:
    v14 = v15;
    v23 = v22;
LABEL_38:
    *((void *)this + 6) = v23;
    *((void *)this + 7) = v25;
    *((void *)this + 8) = v24;
    if (v14)
    {
      operator delete(v14);
    }
    return;
  }
  if (v12 < (unint64_t)(v14 - v15)) {
    *((void *)this + 7) = &v15[v12];
  }
}

void std::vector<unsigned int>::__append(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  std::vector<unsigned int>::pointer end = this->__end_;
  value = this->__end_cap_.__value_;
  uint64_t v6 = end;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(end, 4 * __n);
      uint64_t v6 = &end[__n];
    }
    this->__end_ = v6;
  }
  else
  {
    std::vector<unsigned int>::pointer begin = this->__begin_;
    uint64_t v8 = (char *)end - (char *)this->__begin_;
    uint64_t v9 = v8 >> 2;
    unint64_t v10 = (v8 >> 2) + __n;
    if (v10 >> 62) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = (char *)value - (char *)begin;
    if (v11 >> 1 > v10) {
      unint64_t v10 = v11 >> 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 >> 62) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v13 = operator new(4 * v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
    v14 = &v13[4 * v9];
    size_t v15 = 4 * __n;
    unint64_t v16 = (unsigned int *)&v13[4 * v12];
    bzero(v14, v15);
    size_t v17 = (unsigned int *)&v14[v15];
    if (end != begin)
    {
      unint64_t v18 = (char *)end - (char *)begin - 4;
      if (v18 < 0x2C) {
        goto LABEL_31;
      }
      if ((unint64_t)((char *)end - v13 - v8) < 0x20) {
        goto LABEL_31;
      }
      uint64_t v19 = (v18 >> 2) + 1;
      uint64_t v20 = 4 * (v19 & 0x7FFFFFFFFFFFFFF8);
      uint64_t v6 = &end[v20 / 0xFFFFFFFFFFFFFFFCLL];
      v14 -= v20;
      size_t v21 = &v13[4 * v9 - 16];
      v22 = (long long *)(end - 4);
      uint64_t v23 = v19 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v24 = *v22;
        *(v21 - 1) = *(v22 - 1);
        *size_t v21 = v24;
        v21 -= 2;
        v22 -= 2;
        v23 -= 8;
      }
      while (v23);
      if (v19 != (v19 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_31:
        do
        {
          int v25 = *--v6;
          *((_DWORD *)v14 - 1) = v25;
          v14 -= 4;
        }
        while (v6 != begin);
      }
    }
    this->__begin_ = (std::vector<unsigned int>::pointer)v14;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

void std::vector<float>::__append(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = *(char **)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v6 = v5;
  if (a2 <= (v4 - (uint64_t)v5) >> 2)
  {
    if (a2)
    {
      bzero(v5, 4 * a2);
      uint64_t v6 = &v5[4 * a2];
    }
    *(void *)(a1 + 8) = v6;
  }
  else
  {
    unint64_t v7 = *(char **)a1;
    uint64_t v8 = (uint64_t)&v5[-*(void *)a1];
    uint64_t v9 = v8 >> 2;
    unint64_t v10 = (v8 >> 2) + a2;
    if (v10 >> 62) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v4 - (void)v7;
    if (v11 >> 1 > v10) {
      unint64_t v10 = v11 >> 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 >> 62) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v13 = operator new(4 * v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
    v14 = &v13[4 * v9];
    size_t v15 = 4 * a2;
    unint64_t v16 = &v13[4 * v12];
    bzero(v14, v15);
    size_t v17 = &v14[v15];
    if (v5 != v7)
    {
      unint64_t v18 = v5 - v7 - 4;
      if (v18 < 0x2C) {
        goto LABEL_31;
      }
      if ((unint64_t)(v5 - v13 - v8) < 0x20) {
        goto LABEL_31;
      }
      uint64_t v19 = (v18 >> 2) + 1;
      uint64_t v20 = 4 * (v19 & 0x7FFFFFFFFFFFFFF8);
      uint64_t v6 = &v5[-v20];
      v14 -= v20;
      size_t v21 = &v13[4 * v9 - 16];
      v22 = v5 - 16;
      uint64_t v23 = v19 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v24 = *(_OWORD *)v22;
        *(v21 - 1) = *((_OWORD *)v22 - 1);
        *size_t v21 = v24;
        v21 -= 2;
        v22 -= 32;
        v23 -= 8;
      }
      while (v23);
      if (v19 != (v19 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_31:
        do
        {
          int v25 = *((_DWORD *)v6 - 1);
          v6 -= 4;
          *((_DWORD *)v14 - 1) = v25;
          v14 -= 4;
        }
        while (v6 != v7);
      }
    }
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v17;
    *(void *)(a1 + 16) = v16;
    if (v7)
    {
      operator delete(v7);
    }
  }
}

uint64_t bmMunkresGetTempBuffers(int a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  BmMixedBufSize::BmMixedBufSize((BmMixedBufSize *)&v22);
  if (v23) {
    rtcv::simImageChMeanTempBytes();
  }
  int v8 = v22;
  BmMixedBufSize::BmMixedBufSize((BmMixedBufSize *)&v22);
  if (v23) {
    rtcv::simImageChMeanTempBytes();
  }
  unsigned int v9 = a1 * a1 + 12 * a1 + v8 + 6;
  int v10 = 4 * a1 * a1;
  int v11 = ((4 * a1) | 3) + v10 + 2 * (((4 * a1) | 3) + a1) + v9 + v22;
  uint64_t result = (v11 + 3);
  int v22 = v11 + 3;
  if (a2)
  {
    if (result > a3) {
      bmMunkresGetTempBuffers();
    }
    if (!a4) {
      bmMunkresGetTempBuffers();
    }
    unsigned int v23 = a1 * a1 + 12 * a1 + v8 + 6;
    if (result < v9) {
      rtcv::simImageChMean();
    }
    *(_DWORD *)(a4 + 8) = v9;
    *(void *)a4 = a2;
    uint64_t v13 = a2 + v9;
    int v14 = a1 - a2;
    unsigned int v23 = a1 - a2 + v13;
    if (result < v23) {
      rtcv::simImageChMean();
    }
    *(void *)(a4 + 16) = v13;
    uint64_t v15 = a2 + (v14 + v13);
    unsigned int v23 = v14 + v15;
    if (result < v14 + (int)v15) {
      rtcv::simImageChMean();
    }
    *(void *)(a4 + 24) = v15;
    unint64_t v16 = (a2 + (v14 + v15) + 3) & 0xFFFFFFFFFFFFFFFCLL;
    int v17 = 4 * a1 - a2;
    unsigned int v23 = v16 + v17;
    if (result < (int)v16 + v17) {
      rtcv::simImageChMean();
    }
    *(void *)(a4 + 32) = v16;
    unint64_t v18 = (a2 + (v16 + v17) + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unsigned int v23 = v18 + v17;
    if (result < (int)v18 + v17) {
      rtcv::simImageChMean();
    }
    *(_DWORD *)(a4 + 48) = 4 * a1;
    *(void *)(a4 + 40) = v18;
    unint64_t v19 = (a2 + (v18 + v17) + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unsigned int v20 = v19 - a2 + v10;
    unsigned int v23 = v20;
    if (result < v20) {
      rtcv::simImageChMean();
    }
    *(void *)(a4 + 56) = v19;
    unint64_t v21 = (a2 + v20 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unsigned int v23 = v21 + v17;
    if (result < (int)v21 + v17) {
      rtcv::simImageChMean();
    }
    *(void *)(a4 + 64) = v21;
  }
  return result;
}

void BmMixedBufSize::BmMixedBufSize(BmMixedBufSize *this)
{
  *(void *)this = 0;
}

{
  *(void *)this = 0;
}

uint64_t bmMunkresTempBytes(int a1)
{
  return bmMunkresGetTempBuffers(a1, 0, 0, 0);
}

__CFString *FTGetChipIdentifier()
{
  uint64_t v0 = MGGetSInt64Answer();
  int v1 = v0;
  if (v0 < 0x8000)
  {
    switch(v0)
    {
      case 24608:
      case 24609:
      case 24610:
LABEL_8:
        uint64_t result = @"H14";
        break;
      case 24611:
      case 24612:
      case 24613:
      case 24614:
      case 24615:
      case 24616:
      case 24617:
      case 24618:
      case 24619:
      case 24620:
      case 24621:
      case 24622:
      case 24623:
      case 24628:
      case 24629:
      case 24630:
      case 24631:
      case 24632:
      case 24633:
      case 24634:
      case 24635:
      case 24636:
      case 24637:
      case 24638:
      case 24639:
      case 24643:
      case 24644:
      case 24645:
      case 24646:
      case 24647:
      case 24648:
      case 24649:
      case 24650:
      case 24651:
      case 24652:
      case 24653:
      case 24654:
      case 24655:
        goto LABEL_17;
      case 24624:
      case 24625:
      case 24626:
      case 24627:
LABEL_5:
        uint64_t result = @"H15";
        break;
      case 24640:
      case 24641:
      case 24642:
LABEL_9:
        uint64_t result = @"H16";
        break;
      case 24656:
      case 24657:
      case 24658:
LABEL_10:
        uint64_t result = @"H17";
        break;
      default:
        if ((unint64_t)(v0 - 28672) >= 2)
        {
LABEL_17:
          v3 = ft::GetOsLog((ft *)v0);
          if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
            FTGetChipIdentifier_cold_1(v1, v3);
          }

          uint64_t result = 0;
        }
        else
        {
          uint64_t result = @"H7";
        }
        break;
    }
  }
  else
  {
    switch(v0)
    {
      case 33025:
      case 33027:
        uint64_t result = @"H13";
        break;
      case 33026:
      case 33028:
      case 33029:
      case 33030:
      case 33031:
      case 33032:
      case 33033:
      case 33034:
      case 33035:
      case 33036:
      case 33037:
      case 33038:
      case 33039:
      case 33041:
      case 33043:
      case 33044:
      case 33045:
      case 33046:
      case 33047:
      case 33048:
      case 33049:
      case 33050:
      case 33051:
      case 33052:
      case 33053:
      case 33054:
      case 33055:
      case 33057:
      case 33059:
      case 33060:
      case 33061:
      case 33062:
      case 33063:
      case 33064:
      case 33065:
      case 33066:
      case 33067:
      case 33068:
      case 33069:
      case 33070:
      case 33071:
      case 33073:
      case 33075:
      case 33076:
      case 33077:
      case 33078:
      case 33079:
      case 33080:
      case 33081:
      case 33082:
      case 33083:
      case 33084:
      case 33085:
      case 33086:
      case 33087:
      case 33089:
        goto LABEL_17;
      case 33040:
      case 33042:
        goto LABEL_8;
      case 33056:
      case 33058:
        goto LABEL_5;
      case 33072:
      case 33074:
        goto LABEL_9;
      case 33088:
      case 33090:
        goto LABEL_10;
      default:
        switch(v0)
        {
          case 33025:
          case 33026:
          case 33028:
            uint64_t result = @"H8";
            break;
          case 33041:
          case 33042:
            uint64_t result = @"H9";
            break;
          case 33046:
            uint64_t result = @"H10";
            break;
          case 33057:
          case 33064:
            uint64_t result = @"H11";
            break;
          case 33073:
            uint64_t result = @"H12";
            break;
          default:
            goto LABEL_17;
        }
        break;
    }
  }
  return result;
}

float ft::KalmanTrack::KalmanTrack(ft::Track *a1, const uint64_t *a2, uint64_t a3)
{
  ft::Track::Track(a1, a2);
  *(void *)uint64_t v4 = &unk_26C78E418;
  long long v5 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v4 + 264) = *(_OWORD *)a3;
  *(_OWORD *)(v4 + 280) = v5;
  *(_OWORD *)(v4 + 368) = xmmword_217665A40;
  *(_OWORD *)(v4 + 384) = xmmword_217665A50;
  *(_OWORD *)(v4 + 400) = xmmword_217665A60;
  *(_OWORD *)(v4 + 416) = xmmword_217665A70;
  *(void *)(v4 + 432) = 1065353216;
  *(void *)(v4 + 440) = 0x3F80000000000000;
  *(void *)(v4 + 480) = 0;
  *(void *)(v4 + 488) = 0;
  *(_OWORD *)(v4 + 496) = xmmword_217665A40;
  *(_OWORD *)(v4 + 512) = xmmword_217665A50;
  *(_OWORD *)(v4 + 528) = xmmword_217665A60;
  *(_OWORD *)(v4 + 544) = xmmword_217665A70;
  *(void *)(v4 + 464) = 0;
  *(void *)(v4 + 472) = 0;
  *(void *)(v4 + 448) = 1065353216;
  *(void *)(v4 + 456) = 0x3F80000000000000;
  *(_OWORD *)(v4 + 304) = xmmword_217665A40;
  *(_OWORD *)(v4 + 320) = xmmword_217665A50;
  *(_OWORD *)(v4 + 336) = xmmword_217665A80;
  *(_OWORD *)(v4 + 352) = xmmword_217665A90;
  int32x2_t v6 = vdup_lane_s32((int32x2_t)COERCE_UNSIGNED_INT(*(float *)(a3 + 8) * *(float *)(a3 + 8)), 0);
  unsigned __int32 v7 = v6.i32[0];
  v6.i32[0] = 0;
  *(void *)(v4 + 432) = v7;
  *(int32x2_t *)(v4 + 440) = v6;
  v6.i32[0] = *(_DWORD *)(a3 + 12);
  float v8 = *(float *)(a3 + 16);
  *(_OWORD *)(v4 + 400) = xmmword_217665A60;
  *(_OWORD *)(v4 + 416) = xmmword_217665A70;
  *(_OWORD *)(v4 + 368) = COERCE_UNSIGNED_INT(*(float *)v6.i32 * *(float *)v6.i32);
  *(_OWORD *)(v4 + 384) = xmmword_217665A50;
  *(float *)(v4 + 388) = *(float *)v6.i32 * *(float *)v6.i32;
  float result = v8 * v8;
  *(float *)(v4 + 408) = v8 * v8;
  *(float *)(v4 + 428) = v8 * v8;
  return result;
}

{
  uint64_t v4;
  long long v5;
  int32x2_t v6;
  unsigned __int32 v7;
  float v8;
  float result;

  ft::Track::Track(a1, a2);
  *(void *)uint64_t v4 = &unk_26C78E418;
  long long v5 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v4 + 264) = *(_OWORD *)a3;
  *(_OWORD *)(v4 + 280) = v5;
  *(_OWORD *)(v4 + 368) = xmmword_217665A40;
  *(_OWORD *)(v4 + 384) = xmmword_217665A50;
  *(_OWORD *)(v4 + 400) = xmmword_217665A60;
  *(_OWORD *)(v4 + 416) = xmmword_217665A70;
  *(void *)(v4 + 432) = 1065353216;
  *(void *)(v4 + 440) = 0x3F80000000000000;
  *(void *)(v4 + 480) = 0;
  *(void *)(v4 + 488) = 0;
  *(_OWORD *)(v4 + 496) = xmmword_217665A40;
  *(_OWORD *)(v4 + 512) = xmmword_217665A50;
  *(_OWORD *)(v4 + 528) = xmmword_217665A60;
  *(_OWORD *)(v4 + 544) = xmmword_217665A70;
  *(void *)(v4 + 464) = 0;
  *(void *)(v4 + 472) = 0;
  *(void *)(v4 + 448) = 1065353216;
  *(void *)(v4 + 456) = 0x3F80000000000000;
  *(_OWORD *)(v4 + 304) = xmmword_217665A40;
  *(_OWORD *)(v4 + 320) = xmmword_217665A50;
  *(_OWORD *)(v4 + 336) = xmmword_217665A80;
  *(_OWORD *)(v4 + 352) = xmmword_217665A90;
  int32x2_t v6 = vdup_lane_s32((int32x2_t)COERCE_UNSIGNED_INT(*(float *)(a3 + 8) * *(float *)(a3 + 8)), 0);
  unsigned __int32 v7 = v6.i32[0];
  v6.i32[0] = 0;
  *(void *)(v4 + 432) = v7;
  *(int32x2_t *)(v4 + 440) = v6;
  v6.i32[0] = *(_DWORD *)(a3 + 12);
  float v8 = *(float *)(a3 + 16);
  *(_OWORD *)(v4 + 400) = xmmword_217665A60;
  *(_OWORD *)(v4 + 416) = xmmword_217665A70;
  *(_OWORD *)(v4 + 368) = COERCE_UNSIGNED_INT(*(float *)v6.i32 * *(float *)v6.i32);
  *(_OWORD *)(v4 + 384) = xmmword_217665A50;
  *(float *)(v4 + 388) = *(float *)v6.i32 * *(float *)v6.i32;
  float result = v8 * v8;
  *(float *)(v4 + 408) = v8 * v8;
  *(float *)(v4 + 428) = v8 * v8;
  return result;
}

void ft::KalmanTrack::~KalmanTrack(ft::KalmanTrack *this)
{
  ft::Track::~Track(this);

  JUMPOUT(0x21D449420);
}

float64x2_t ft::KalmanTrack::SyncFromFilter(ft::KalmanTrack *this)
{
  float v2 = 2.0
     / (expf((float)-sqrtf((float)((float)(*((float *)this + 124) + *((float *)this + 129)) + *((float *)this + 134))+ *((float *)this + 139))/ *((float *)this + 73))+ 1.0)+ -1.0;
  double v3 = 1.0 - v2;
  *((double *)this + 31) = v3;
  *((unsigned char *)this + 240) = v3 < *((float *)this + 72);
  __asm { FMOV            V2.2D, #-0.5 }
  float64x2_t result = vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)this + 480)), vmulq_f64(*(float64x2_t *)((char *)this + 40), _Q2));
  *(float64x2_t *)((char *)this + 24) = result;
  return result;
}

__n128 ft::KalmanTrack::UpdateTimeDelta(ft::KalmanTrack *this, const Frame *a2)
{
  if ((*((unsigned char *)this + 572) & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Prior time step not established.");
    goto LABEL_6;
  }
  if ((*((unsigned char *)a2 + 12) & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Frame has invalid timestamp.");
LABEL_6:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  double v4 = *((float *)this + 71);
  *(_OWORD *)&lhs.value = *(_OWORD *)a2;
  lhs.epoch = *((void *)a2 + 2);
  CMTime v9 = *(CMTime *)((char *)this + 560);
  CMTimeSubtract(&time, &lhs, &v9);
  float v5 = CMTimeGetSeconds(&time) * v4;
  *((float *)this + 84) = v5;
  *((float *)this + 89) = v5;
  uint64_t v6 = *((void *)a2 + 2);
  __n128 result = *(__n128 *)a2;
  *((_OWORD *)this + 35) = *(_OWORD *)a2;
  *((void *)this + 72) = v6;
  return result;
}

void sub_21762CFC8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21762CFDC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

float64x2_t ft::KalmanTrack::PredictState(ft::KalmanTrack *this, const Frame *a2)
{
  ft::KalmanTrack::UpdateTimeDelta(this, a2);
  float32x4_t v4 = *((float32x4_t *)this + 19);
  float32x4_t v3 = *((float32x4_t *)this + 20);
  float32x4_t v6 = *((float32x4_t *)this + 21);
  float32x4_t v5 = *((float32x4_t *)this + 22);
  float32x4_t v27 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*((_OWORD *)this + 30))), v3, *(float32x2_t *)((char *)this + 480), 1), v6, *((float32x4_t *)this + 30), 2), v5, *((float32x4_t *)this + 30), 3);
  float32x4_t v7 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*((_OWORD *)this + 31))), v3, *(float32x2_t *)((char *)this + 496), 1), v6, *((float32x4_t *)this + 31), 2), v5, *((float32x4_t *)this + 31), 3);
  float32x4_t v8 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*((_OWORD *)this + 32))), v3, *(float32x2_t *)((char *)this + 512), 1), v6, *((float32x4_t *)this + 32), 2), v5, *((float32x4_t *)this + 32), 3);
  float32x4_t v9 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*((_OWORD *)this + 33))), v3, *(float32x2_t *)((char *)this + 528), 1), v6, *((float32x4_t *)this + 33), 2), v5, *((float32x4_t *)this + 33), 3);
  float32x4_t v10 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*((_OWORD *)this + 34))), v3, *(float32x2_t *)((char *)this + 544), 1), v6, *((float32x4_t *)this + 34), 2), v5, *((float32x4_t *)this + 34), 3);
  float32x4_t v11 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v7, v4.f32[0]), v8, v3.f32[0]), v9, v6.f32[0]), v10, v5.f32[0]);
  float32x4_t v12 = vmlaq_lane_f32(vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(v7, *(float32x2_t *)v4.f32, 1), v8, *(float32x2_t *)v3.f32, 1), v9, *(float32x2_t *)v6.f32, 1), v10, *(float32x2_t *)v5.f32, 1);
  float32x4_t v13 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v7, v4, 2), v8, v3, 2), v9, v6, 2), v10, v5, 2);
  float32x4_t v14 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v7, v4, 3), v8, v3, 3), v9, v6, 3), v10, v5, 3);
  float32x4_t v15 = vaddq_f32(*((float32x4_t *)this + 23), v11);
  float32x4_t v16 = vaddq_f32(*((float32x4_t *)this + 24), v12);
  int32x4_t v17 = (int32x4_t)vaddq_f32(*((float32x4_t *)this + 25), v13);
  int32x4_t v18 = (int32x4_t)vaddq_f32(*((float32x4_t *)this + 26), v14);
  *((float32x4_t *)this + 30) = v27;
  *((float32x4_t *)this + 31) = v15;
  *((float32x4_t *)this + 32) = v16;
  *((int32x4_t *)this + 33) = v17;
  *((int32x4_t *)this + 34) = v18;
  float v19 = 2.0
      / (expf((float)-sqrtf(vaddq_f32(vaddq_f32(vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1)), (float32x4_t)vdupq_laneq_s32(v17, 2)), (float32x4_t)vdupq_laneq_s32(v18, 3)).f32[0])/ *((float *)this + 73))+ 1.0)+ -1.0;
  double v20 = 1.0 - v19;
  *((double *)this + 31) = v20;
  *((unsigned char *)this + 240) = v20 < *((float *)this + 72);
  __asm { FMOV            V2.2D, #-0.5 }
  float64x2_t result = vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)v27.f32), vmulq_f64(*(float64x2_t *)((char *)this + 40), _Q2));
  *(float64x2_t *)((char *)this + 24) = result;
  return result;
}

float64x2_t ft::KalmanTrack::UpdateState(ft::KalmanTrack *this, uint64_t a2, float64x2_t *a3)
{
  float64x2_t v4 = *a3;
  *(float32x2_t *)&long long v5 = vcvt_f32_f64(vaddq_f64(*a3, vcvtq_f64_f32(vmul_f32(vcvt_f32_f64(a3[1]), (float32x2_t)0x3F0000003F000000))));
  *(float64x2_t *)((char *)this + 40) = a3[1];
  *(float64x2_t *)((char *)this + 24) = v4;
  if (*((unsigned char *)this + 232))
  {
    float32x2_t v16 = (float32x2_t)v5;
    ft::KalmanTrack::UpdateTimeDelta(this, (const Frame *)a2);
    float32x2_t v17 = v16;
    ft::KalmanFilter<float,4ul,2ul>::Update((uint64_t)this + 304, &v17);
    float v6 = 2.0
       / (expf((float)-sqrtf((float)((float)(*((float *)this + 124) + *((float *)this + 129)) + *((float *)this + 134))+ *((float *)this + 139))/ *((float *)this + 73))+ 1.0)+ -1.0;
    double v7 = 1.0 - v6;
    *((double *)this + 31) = v7;
    *((unsigned char *)this + 240) = v7 < *((float *)this + 72);
    __asm { FMOV            V2.2D, #-0.5 }
    float64x2_t result = vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)this + 480)), vmulq_f64(*(float64x2_t *)((char *)this + 40), _Q2));
    *(float64x2_t *)((char *)this + 24) = result;
  }
  else
  {
    *((void *)&v5 + 1) = vextq_s8(*((int8x16_t *)this + 30), *((int8x16_t *)this + 30), 8uLL).u64[0];
    float v14 = *((float *)this + 66);
    float v15 = *((float *)this + 67);
    *((_OWORD *)this + 32) = xmmword_217665A50;
    *((_OWORD *)this + 33) = xmmword_217665A60;
    *((_OWORD *)this + 34) = xmmword_217665A70;
    *((_OWORD *)this + 30) = v5;
    *((_OWORD *)this + 31) = COERCE_UNSIGNED_INT(v14 * v14);
    *((float *)this + 129) = v14 * v14;
    *((float *)this + 134) = v15 * v15;
    *((float *)this + 139) = v15 * v15;
    float64x2_t result = *(float64x2_t *)a2;
    *((void *)this + 72) = *(void *)(a2 + 16);
    *((float64x2_t *)this + 35) = result;
  }
  return result;
}

uint64_t ft::KalmanFilter<float,4ul,2ul>::Update(uint64_t a1, float32x2_t *a2)
{
  float32x2_t v2 = *a2;
  uint64_t v3 = a1 + 176;
  float32x4_t v43 = *(float32x4_t *)(a1 + 176);
  float32x2_t v4 = *(float32x2_t *)(a1 + 144);
  float32x2_t v5 = *(float32x2_t *)(a1 + 152);
  float32x2_t v6 = *(float32x2_t *)(a1 + 160);
  float32x2_t v7 = *(float32x2_t *)(a1 + 168);
  float32x4_t v8 = *(float32x4_t *)(a1 + 192);
  float32x4_t v9 = *(float32x4_t *)(a1 + 208);
  float32x4_t v10 = *(float32x4_t *)(a1 + 224);
  float32x4_t v11 = *(float32x4_t *)(a1 + 240);
  float32x2_t v12 = vmla_laneq_f32(vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(v4, v8.f32[0]), v5, *(float32x2_t *)v8.f32, 1), v6, v8, 2), v7, v8, 3);
  float32x2_t v13 = vmla_laneq_f32(vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(v4, v9.f32[0]), v5, *(float32x2_t *)v9.f32, 1), v6, v9, 2), v7, v9, 3);
  float32x2_t v14 = vmla_laneq_f32(vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(v4, v10.f32[0]), v5, *(float32x2_t *)v10.f32, 1), v6, v10, 2), v7, v10, 3);
  float32x2_t v15 = vmla_laneq_f32(vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(v4, v11.f32[0]), v5, *(float32x2_t *)v11.f32, 1), v6, v11, 2), v7, v11, 3);
  float32x2_t v16 = vadd_f32(*(float32x2_t *)(a1 + 128), vmla_f32(vmla_f32(vmla_f32(vmul_n_f32(v12, v4.f32[0]), (float32x2_t)*(_OWORD *)&vdupq_lane_s32((int32x2_t)v5, 0), v13), (float32x2_t)*(_OWORD *)&vdupq_lane_s32((int32x2_t)v6, 0), v14), (float32x2_t)*(_OWORD *)&vdupq_lane_s32((int32x2_t)v7, 0), v15));
  float32x2_t v39 = v4;
  float32x2_t v42 = v5;
  float32x2_t v40 = v7;
  float32x2_t v41 = v6;
  float32x4_t v37 = vmlaq_lane_f32(vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(v8, v4, 1), v9, v5, 1), v10, v6, 1), v11, v7, 1);
  float32x4_t v38 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v8, v4.f32[0]), v9, v5.f32[0]), v10, v6.f32[0]), v11, v7.f32[0]);
  *(float32x2_t *)v8.f32 = vadd_f32(*(float32x2_t *)(a1 + 136), vmla_f32(vmla_f32(vmla_f32(vmul_lane_f32(v12, v4, 1), (float32x2_t)*(_OWORD *)&vdupq_lane_s32((int32x2_t)v5, 1), v13), (float32x2_t)*(_OWORD *)&vdupq_lane_s32((int32x2_t)v6, 1), v14), (float32x2_t)*(_OWORD *)&vdupq_lane_s32((int32x2_t)v7, 1), v15));
  simd_float2x2 v17 = __invert_f2(*(simd_float2x2 *)((char *)&v8 - 8));
  float32x4_t v18 = vmlaq_lane_f32(vmulq_n_f32(v38, v17.columns[0].f32[0]), v37, (float32x2_t)v17.columns[0], 1);
  float32x4_t v19 = vmlaq_lane_f32(vmulq_n_f32(v38, v17.columns[1].f32[0]), v37, (float32x2_t)v17.columns[1], 1);
  float32x2_t v20 = vsub_f32(v2, vmla_laneq_f32(vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(v39, v43.f32[0]), v42, *(float32x2_t *)v43.f32, 1), v41, v43, 2), v40, v43, 3));
  float32x4_t v21 = vsubq_f32((float32x4_t)xmmword_217665A40, vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(void *)(v3 - 32))), v19, *(float32x2_t *)(v3 - 32), 1));
  float32x4_t v22 = vsubq_f32((float32x4_t)xmmword_217665A50, vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(void *)(v3 - 24))), v19, *(float32x2_t *)(v3 - 24), 1));
  float32x4_t v23 = vsubq_f32((float32x4_t)xmmword_217665A60, vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(void *)(v3 - 16))), v19, *(float32x2_t *)(v3 - 16), 1));
  float32x4_t v24 = vsubq_f32((float32x4_t)xmmword_217665A70, vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(void *)(v3 - 8))), v19, *(float32x2_t *)(v3 - 8), 1));
  float32x4_t v25 = vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(void *)(v3 - 48))), v19, *(float32x2_t *)(v3 - 48), 1);
  float32x4_t v26 = vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(void *)(v3 - 40))), v19, *(float32x2_t *)(v3 - 40), 1);
  float32x4_t v27 = vmlaq_laneq_f32(vmulq_laneq_f32(v25, v18, 2), v26, v19, 2);
  float32x4_t v28 = vmlaq_laneq_f32(vmulq_laneq_f32(v25, v18, 3), v26, v19, 3);
  float32x4_t v29 = vaddq_f32(vmlaq_n_f32(vmulq_n_f32(v25, v18.f32[0]), v26, v19.f32[0]), (float32x4_t)0);
  float32x4_t v30 = vaddq_f32(vmlaq_lane_f32(vmulq_lane_f32(v25, *(float32x2_t *)v18.f32, 1), v26, *(float32x2_t *)v19.f32, 1), (float32x4_t)0);
  float32x4_t v31 = vaddq_f32(v28, (float32x4_t)0);
  float32x4_t v32 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(_OWORD *)(v3 + 16))), v22, *(float32x2_t *)(v3 + 16), 1), v23, *(float32x4_t *)(v3 + 16), 2), v24, *(float32x4_t *)(v3 + 16), 3);
  float32x4_t v33 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(_OWORD *)(v3 + 32))), v22, *(float32x2_t *)(v3 + 32), 1), v23, *(float32x4_t *)(v3 + 32), 2), v24, *(float32x4_t *)(v3 + 32), 3);
  float32x4_t v34 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(_OWORD *)(v3 + 48))), v22, *(float32x2_t *)(v3 + 48), 1), v23, *(float32x4_t *)(v3 + 48), 2), v24, *(float32x4_t *)(v3 + 48), 3);
  float32x4_t v35 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(_OWORD *)(v3 + 64))), v22, *(float32x2_t *)(v3 + 64), 1), v23, *(float32x4_t *)(v3 + 64), 2), v24, *(float32x4_t *)(v3 + 64), 3);
  *(float32x4_t *)uint64_t v3 = vaddq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, v20.f32[0]), v19, v20, 1), *(float32x4_t *)v3);
  *(float32x4_t *)(v3 + 16) = vaddq_f32(v29, vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v32, v21.f32[0]), v33, v22.f32[0]), v34, v23.f32[0]), v35, v24.f32[0]));
  *(float32x4_t *)(v3 + 32) = vaddq_f32(v30, vmlaq_lane_f32(vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(v32, *(float32x2_t *)v21.f32, 1), v33, *(float32x2_t *)v22.f32, 1), v34, *(float32x2_t *)v23.f32, 1), v35, *(float32x2_t *)v24.f32, 1));
  *(float32x4_t *)(v3 + 48) = vaddq_f32(vaddq_f32(v27, (float32x4_t)0), vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v32, v21, 2), v33, v22, 2), v34, v23, 2), v35, v24, 2));
  *(float32x4_t *)(v3 + 64) = vaddq_f32(v31, vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v32, v21, 3), v33, v22, 3), v34, v23, 3), v35, v24, 3));
  return v3;
}

const char *ft::KalmanTrack::Kind(ft::KalmanTrack *this)
{
  return "kalman";
}

uint64_t AcAttrNode::AcAttrNode(uint64_t a1, _DWORD *a2)
{
  *(void *)(a1 + 1056) = 0;
  *(_OWORD *)(a1 + 1040) = 0u;
  *(_OWORD *)(a1 + 1008) = 0u;
  *(_OWORD *)(a1 + 1024) = 0u;
  *(_OWORD *)(a1 + 976) = 0u;
  *(_OWORD *)(a1 + 992) = 0u;
  *(_OWORD *)(a1 + 944) = 0u;
  *(_OWORD *)(a1 + 960) = 0u;
  *(_OWORD *)(a1 + 912) = 0u;
  *(_OWORD *)(a1 + 928) = 0u;
  *(_OWORD *)(a1 + 880) = 0u;
  *(_OWORD *)(a1 + 896) = 0u;
  *(_OWORD *)(a1 + 848) = 0u;
  *(_OWORD *)(a1 + 864) = 0u;
  *(_OWORD *)(a1 + 816) = 0u;
  *(_OWORD *)(a1 + 832) = 0u;
  *(_OWORD *)(a1 + 800) = 0u;
  *a2 = 1;
  return a1;
}

{
  bzero((void *)a1, 0x31CuLL);
  *(void *)(a1 + 1056) = 0;
  *(_OWORD *)(a1 + 1040) = 0u;
  *(_OWORD *)(a1 + 1008) = 0u;
  *(_OWORD *)(a1 + 1024) = 0u;
  *(_OWORD *)(a1 + 976) = 0u;
  *(_OWORD *)(a1 + 992) = 0u;
  *(_OWORD *)(a1 + 944) = 0u;
  *(_OWORD *)(a1 + 960) = 0u;
  *(_OWORD *)(a1 + 912) = 0u;
  *(_OWORD *)(a1 + 928) = 0u;
  *(_OWORD *)(a1 + 880) = 0u;
  *(_OWORD *)(a1 + 896) = 0u;
  *(_OWORD *)(a1 + 848) = 0u;
  *(_OWORD *)(a1 + 864) = 0u;
  *(_OWORD *)(a1 + 816) = 0u;
  *(_OWORD *)(a1 + 832) = 0u;
  *(_OWORD *)(a1 + 800) = 0u;
  *a2 = 1;
  return a1;
}

void AcAttrNode::~AcAttrNode(AcAttrNode *this)
{
}

{
  AcAttrNode::releaseBuffers(this);
}

uint64_t AcAttrNode::releaseBuffers(AcAttrNode *this)
{
  uint64_t v2 = *((void *)this + 104);
  if (v2)
  {
    MEMORY[0x21D449400](v2, 0x1000C8052888210);
    *((void *)this + 104) = 0;
  }
  uint64_t v3 = *((void *)this + 103);
  if (v3)
  {
    MEMORY[0x21D449400](v3, 0x1000C8052888210);
    *((void *)this + 103) = 0;
  }
  uint64_t v4 = *((void *)this + 102);
  if (v4)
  {
    MEMORY[0x21D449400](v4, 0x1000C8052888210);
    *((void *)this + 102) = 0;
  }
  uint64_t v5 = *((void *)this + 101);
  if (v5)
  {
    MEMORY[0x21D449400](v5, 0x1000C8052888210);
    *((void *)this + 101) = 0;
  }
  uint64_t v6 = *((void *)this + 100);
  if (v6)
  {
    MEMORY[0x21D449400](v6, 0x1000C8052888210);
    *((void *)this + 100) = 0;
  }
  uint64_t v7 = *((void *)this + 105);
  if (v7)
  {
    MEMORY[0x21D449400](v7, 0x1000C8052888210);
    *((void *)this + 105) = 0;
  }
  uint64_t v8 = *((void *)this + 106);
  if (v8)
  {
    MEMORY[0x21D449400](v8, 0x1000C8052888210);
    *((void *)this + 106) = 0;
  }
  uint64_t v9 = *((void *)this + 107);
  if (v9)
  {
    MEMORY[0x21D449400](v9, 0x1000C8052888210);
    *((void *)this + 107) = 0;
  }
  uint64_t v10 = *((void *)this + 108);
  if (v10)
  {
    MEMORY[0x21D449400](v10, 0x1000C8052888210);
    *((void *)this + 108) = 0;
  }
  uint64_t v11 = *((void *)this + 109);
  if (v11)
  {
    MEMORY[0x21D449400](v11, 0x1000C8052888210);
    *((void *)this + 109) = 0;
  }
  uint64_t v12 = *((void *)this + 110);
  if (v12)
  {
    MEMORY[0x21D449400](v12, 0x1000C8052888210);
    *((void *)this + 110) = 0;
  }
  uint64_t result = *((void *)this + 111);
  if (result)
  {
    uint64_t result = MEMORY[0x21D449400](result, 0x1000C8052888210);
    *((void *)this + 111) = 0;
  }
  return result;
}

uint64_t AcAttrNode::init(AcAttrNode *a1, const char *a2, _DWORD *a3)
{
  if (*a3 == 1)
  {
    AcAttrNode::releaseBuffers(a1);
    if (a2)
    {
      uint64_t v6 = a1;
      uint64_t v7 = a2;
    }
    else
    {
      uint64_t v7 = "1.7.3";
      uint64_t v6 = a1;
    }
    memcpy(v6, v7, 0x31CuLL);
    operator new[]();
  }
  return 4294967289;
}

void AcAttrNode::initBinCenters(AcAttrNode *this, float *a2, float a3, float a4, unsigned int a5)
{
  if (a5)
  {
    float v5 = (float)(a3 - a4) / (float)a5;
    float v6 = (float)(v5 * 0.5) + a4;
    uint64_t v7 = a5;
    do
    {
      *a2++ = v6;
      float v6 = v5 + v6;
      --v7;
    }
    while (v7);
  }
}

uint64_t AcAttrNode::preProcess(uint64_t a1, unsigned int a2, unsigned int a3, _DWORD *a4, float32x2_t *a5, unsigned int a6, _DWORD *a7, uint64_t a8, _DWORD *a9)
{
  if (a6 >= 0xB) {
    AcAttrNode::preProcess();
  }
  LODWORD(v10) = a6;
  std::chrono::steady_clock::now();
  if (*a7 != 1) {
    return 4294967289;
  }
  *a9 = v10;
  if (v10)
  {
    float32x2_t v16 = a7 + 2;
    simd_float2x2 v17 = a5 + 2;
    float32x4_t v18 = (float32x2_t *)(a9 + 101);
    uint64_t v19 = (uint64_t)(a9 + 1);
    uint64_t v10 = v10;
    do
    {
      float32x2_t v20 = vmul_n_f32(*v17, *(float *)(a1 + 64));
      float32x2_t v21 = vadd_f32(v17[-1], vmul_f32(vsub_f32(*v17, v20), (float32x2_t)0x3F0000003F000000));
      *float32x4_t v18 = v21;
      v18[1] = v20;
      v18 += 2;
      *v16++ = acCropResizeGenerateConfig(a2, a3, a4, *(_DWORD *)(a1 + 68), *(_DWORD *)(a1 + 72), 1, v19, v21.f32[0], v21.f32[1], v20.f32[0], v20.f32[1]);
      simd_float2x2 v17 = (float32x2_t *)((char *)v17 + 92);
      v19 += 40;
      --v10;
    }
    while (v10);
  }
  return 0;
}

uint64_t AcAttrNode::postProcess(uint64_t a1, uint64_t a2, int a3, _DWORD *a4, uint64_t a5, unsigned int a6, double a7, double a8, float32x4_t a9, __n128 a10, float32x4_t a11)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  if (*a4 != 1) {
    return 4294967289;
  }
  if (a3 != 7) {
    return 4294967292;
  }
  if (!*((unsigned char *)a4 + a6 + 8))
  {
    uint64_t result = 0;
    *(_WORD *)(a5 + 81) = 0;
    *(unsigned char *)(a5 + 83) = 0;
    return result;
  }
  uint64_t v13 = 0;
  while (1)
  {
    float32x2_t v14 = (long long *)(a2 + 24 * v13);
    uint64_t v15 = a1 + 24 * v13;
    long long v16 = *v14;
    *(void *)(v15 + 912) = *((void *)v14 + 2);
    *(_OWORD *)(v15 + 896) = v16;
    float32x4_t v18 = (_DWORD *)v14 + 5;
    int v17 = *((_DWORD *)v14 + 5);
    if (v17 != 6) {
      break;
    }
LABEL_5:
    if (++v13 == 7)
    {
      *(_WORD *)(a5 + 81) = 257;
      *(unsigned char *)(a5 + 83) = 1;
      *(_DWORD *)(a5 + 36) = acAttrReduceSmile(a1 + 896, *(_DWORD *)(a1 + 20));
      __int16 v87 = 0;
      *(_DWORD *)(a5 + 40) = acAttrReduceBlink((float **)(a1 + 920), *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 28), (BOOL *)&v87 + 1, v65);
      *(_DWORD *)(a5 + 44) = acAttrReduceBlink((float **)(a1 + 944), *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 28), (BOOL *)&v87, v66);
      v67.n128_f64[0] = acAttrReducePitch(a1 + 968, *(void *)(a1 + 800), *(unsigned int *)(a1 + 148));
      float v69 = (float)v68;
      int v70 = acAttrReduceYaw(a1 + 992, *(float **)(a1 + 808), *(_DWORD *)(a1 + 152), v67);
      BOOL v71 = (HIBYTE(v87) | v87) != 0;
      if (fabsf(v69) >= *(float *)(a1 + 60))
      {
        *(void *)(a5 + 40) = 0;
        *(_DWORD *)(a5 + 36) = 0;
      }
      else
      {
        float v72 = fabsf((float)v70);
        float v73 = *(float *)(a1 + 56);
        BOOL v74 = v72 >= v73 || (HIBYTE(v87) | v87) != 0;
        if (v74 && (*(void *)(a5 + 40) = 0, v72 >= v73))
        {
          *(_DWORD *)(a5 + 36) = 0;
        }
        else if (!v71)
        {
          if (!*(_DWORD *)(a1 + 1052)
            || (int v75 = *(_DWORD *)(a1 + 1048)) == 0
            || (v76 = *(float **)(a1 + 1040), v88[0] = *v76, v75 == 1)
            || (uint64_t v77 = *(unsigned int *)(a1 + 1056), v88[1] = *(float *)((char *)v76 + v77), v75 == 2)
            || (v89[0] = *(float *)((char *)v76 + (2 * v77)), v75 == 3))
          {
            AcAttrNode::postProcess();
          }
          v89[1] = *(float *)((char *)v76 + (3 * v77));
          float32x2_t v78 = *(float32x2_t *)(a5 + 16);
          float32x2_t v79 = vmul_n_f32(v78, *(float *)(a1 + 64));
          v86[0] = vadd_f32(*(float32x2_t *)(a5 + 8), vmul_f32(vsub_f32(v78, v79), (float32x2_t)0x3F0000003F000000));
          v86[1] = v79;
          *(float *)(a5 + 48) = acAttrEyeLoc(v89, (float *)v86);
          *(_DWORD *)(a5 + 52) = v80;
          *(_DWORD *)(a5 + 56) = v81;
          *(_DWORD *)(a5 + 60) = v82;
          *(float *)(a5 + 64) = acAttrEyeLoc(v88, (float *)v86);
          *(_DWORD *)(a5 + 68) = v83;
          *(_DWORD *)(a5 + 72) = v84;
          *(_DWORD *)(a5 + 76) = v85;
          return 0;
        }
      }
      *(_OWORD *)(a5 + 48) = 0u;
      *(_OWORD *)(a5 + 64) = 0u;
      return 0;
    }
  }
  uint64_t v19 = (unint64_t *)(v15 + 896);
  if (v17 == 1)
  {
    float32x4_t v29 = (unsigned int *)(a1 + 24 * v13);
    v29[229] = 6;
    uint64_t v30 = v29[227];
    uint64_t v31 = (4 * v30);
    v29[228] = v31;
    unint64_t v32 = *(void *)(a1 + 8 * v13 + 840);
    *uint64_t v19 = v32;
    if (*v18 != 1) {
      AcAttrNode::postProcess();
    }
    int v33 = *(_DWORD *)(a2 + 24 * v13 + 8);
    if (v33 != *(_DWORD *)(a1 + 24 * v13 + 904)) {
      AcAttrNode::postProcess();
    }
    if (*(_DWORD *)(a2 + 24 * v13 + 12) != v30) {
      AcAttrNode::postProcess();
    }
    if (v33 && v30)
    {
      LODWORD(v16) = *(_DWORD *)(a1 + 4 * v13 + 192);
      uint64_t v34 = *(unsigned int *)(a2 + 24 * v13 + 16);
      unint64_t v35 = *(void *)v14;
      if (v30 >= 8)
      {
        uint64_t v55 = 0;
        a9 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v16, 0);
        v56 = (unsigned __int32 *)(v35 + 4);
        unint64_t v57 = v32;
        unint64_t v58 = v35;
        do
        {
          uint64_t v59 = 0;
          if (v57 < v35 + v30 + v55 * v34 && v58 < v32 + 4 * v30 + v55 * v31) {
            goto LABEL_100;
          }
          v61 = v56;
          do
          {
            a10.n128_u32[0] = *(v61 - 1);
            a11.i32[0] = *v61;
            a11 = vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a11.f32)));
            float32x4_t v62 = vmlaq_f32((float32x4_t)0, vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8((uint8x8_t)a10.n128_u64[0]))), a9);
            a10 = (__n128)vmlaq_f32((float32x4_t)0, a11, a9);
            uint64_t v63 = v57 + v59;
            *(float32x4_t *)uint64_t v63 = v62;
            *(__n128 *)(v63 + 16) = a10;
            v61 += 2;
            v59 += 32;
          }
          while (((4 * v30) & 0x3FFFFFFE0) != v59);
          uint64_t v59 = v30 & 0xFFFFFFF8;
          if (v59 != v30)
          {
LABEL_100:
            do
            {
              a10.n128_u8[0] = *(unsigned char *)(v58 + v59);
              a10.n128_f32[0] = (float)(*(float *)&v16 * (float)a10.n128_u32[0]) + 0.0;
              *(_DWORD *)(v57 + 4 * v59++) = a10.n128_u32[0];
            }
            while (v30 != v59);
          }
          v58 += v34;
          v57 += v31;
          ++v55;
          v56 = (unsigned __int32 *)((char *)v56 + v34);
        }
        while (v55 != v33);
      }
      else
      {
        char v36 = (unsigned __int8 *)(v35 + 3);
        float32x4_t v37 = (_DWORD *)(v32 + 12);
        do
        {
          a9.i8[0] = *(v36 - 3);
          a9.f32[0] = (float)(*(float *)&v16 * (float)a9.u32[0]) + 0.0;
          *(v37 - 3) = a9.i32[0];
          if (v30 != 1)
          {
            a9.i8[0] = *(v36 - 2);
            a9.f32[0] = (float)(*(float *)&v16 * (float)a9.u32[0]) + 0.0;
            *(v37 - 2) = a9.i32[0];
            if (v30 != 2)
            {
              a9.i8[0] = *(v36 - 1);
              a9.f32[0] = (float)(*(float *)&v16 * (float)a9.u32[0]) + 0.0;
              *(v37 - 1) = a9.i32[0];
              if (v30 != 3)
              {
                a9.i8[0] = *v36;
                a9.f32[0] = (float)(*(float *)&v16 * (float)a9.u32[0]) + 0.0;
                *float32x4_t v37 = a9.i32[0];
                if (v30 != 4)
                {
                  a9.i8[0] = v36[1];
                  a9.f32[0] = (float)(*(float *)&v16 * (float)a9.u32[0]) + 0.0;
                  v37[1] = a9.i32[0];
                  if (v30 != 5)
                  {
                    a9.i8[0] = v36[2];
                    a9.f32[0] = (float)(*(float *)&v16 * (float)a9.u32[0]) + 0.0;
                    v37[2] = a9.i32[0];
                    if (v30 != 6)
                    {
                      a9.i8[0] = v36[3];
                      a9.f32[0] = (float)(*(float *)&v16 * (float)a9.u32[0]) + 0.0;
                      v37[3] = a9.i32[0];
                    }
                  }
                }
              }
            }
          }
          v36 += v34;
          float32x4_t v37 = (_DWORD *)((char *)v37 + v31);
          --v33;
        }
        while (v33);
      }
    }
    goto LABEL_5;
  }
  if (!v17)
  {
    float32x2_t v20 = (unsigned int *)(a1 + 24 * v13);
    v20[229] = 6;
    uint64_t v21 = v20[227];
    uint64_t v22 = (4 * v21);
    v20[228] = v22;
    unint64_t v23 = *(void *)(a1 + 8 * v13 + 840);
    *uint64_t v19 = v23;
    if (*v18) {
      AcAttrNode::postProcess();
    }
    int v24 = *(_DWORD *)(a2 + 24 * v13 + 8);
    if (v24 != *(_DWORD *)(a1 + 24 * v13 + 904)) {
      AcAttrNode::postProcess();
    }
    if (*(_DWORD *)(a2 + 24 * v13 + 12) != v21) {
      AcAttrNode::postProcess();
    }
    if (!v24 || !v21) {
      goto LABEL_5;
    }
    LODWORD(v16) = *(_DWORD *)(a1 + 4 * v13 + 192);
    uint64_t v25 = *(unsigned int *)(a2 + 24 * v13 + 16);
    unint64_t v26 = *(void *)v14;
    if (v21 < 8)
    {
      float32x4_t v27 = (unsigned __int8 *)(v26 + 3);
      float32x4_t v28 = (_DWORD *)(v23 + 12);
      do
      {
        a9.i8[0] = *(v27 - 3);
        a9.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)a9.f32)).u64[0];
        a9.f32[0] = (float)(*(float *)&v16 * (float)a9.i32[0]) + 0.0;
        *(v28 - 3) = a9.i32[0];
        if (v21 != 1)
        {
          a9.i8[0] = *(v27 - 2);
          a9.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)a9.f32)).u64[0];
          a9.f32[0] = (float)(*(float *)&v16 * (float)a9.i32[0]) + 0.0;
          *(v28 - 2) = a9.i32[0];
          if (v21 != 2)
          {
            a9.i8[0] = *(v27 - 1);
            a9.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)a9.f32)).u64[0];
            a9.f32[0] = (float)(*(float *)&v16 * (float)a9.i32[0]) + 0.0;
            *(v28 - 1) = a9.i32[0];
            if (v21 != 3)
            {
              a9.i8[0] = *v27;
              a9.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)a9.f32)).u64[0];
              a9.f32[0] = (float)(*(float *)&v16 * (float)a9.i32[0]) + 0.0;
              _DWORD *v28 = a9.i32[0];
              if (v21 != 4)
              {
                a9.i8[0] = v27[1];
                a9.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)a9.f32)).u64[0];
                a9.f32[0] = (float)(*(float *)&v16 * (float)a9.i32[0]) + 0.0;
                v28[1] = a9.i32[0];
                if (v21 != 5)
                {
                  a9.i8[0] = v27[2];
                  a9.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)a9.f32)).u64[0];
                  a9.f32[0] = (float)(*(float *)&v16 * (float)a9.i32[0]) + 0.0;
                  v28[2] = a9.i32[0];
                  if (v21 != 6)
                  {
                    a9.i8[0] = v27[3];
                    a9.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)a9.f32)).u64[0];
                    a9.f32[0] = (float)(*(float *)&v16 * (float)a9.i32[0]) + 0.0;
                    v28[3] = a9.i32[0];
                  }
                }
              }
            }
          }
        }
        v27 += v25;
        float32x4_t v28 = (_DWORD *)((char *)v28 + v22);
        --v24;
      }
      while (v24);
      goto LABEL_5;
    }
    uint64_t v38 = 0;
    a9 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v16, 0);
    uint64_t v39 = v21 & 0xFFFFFFF8;
    unint64_t v40 = v23;
    unint64_t v41 = v26;
    while (1)
    {
      if (v40 >= v26 + v21 + v38 * v25 || v41 >= v23 + 4 * v21 + v38 * v22)
      {
        if (v21 < 0x10)
        {
          uint64_t v43 = 0;
LABEL_48:
          uint64_t v44 = 4 * v43;
          do
          {
            int8x8_t v45 = *(int8x8_t *)(v41 + v43);
            a11 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v45, 0), 8uLL), 8uLL)));
            float32x4_t v46 = vmlaq_f32((float32x4_t)0, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v45, 0), 8uLL), 8uLL))), a9);
            a10 = (__n128)vmlaq_f32((float32x4_t)0, a11, a9);
            unint64_t v47 = v40 + v44;
            *(float32x4_t *)unint64_t v47 = v46;
            *(__n128 *)(v47 + 16) = a10;
            v43 += 8;
            v44 += 32;
          }
          while (v39 != v43);
          uint64_t v48 = v21 & 0xFFFFFFF8;
          if (v39 == v21) {
            goto LABEL_40;
          }
          goto LABEL_51;
        }
        uint64_t v49 = 0;
        v50 = (int8x16_t *)v41;
        do
        {
          int8x16_t v51 = *v50++;
          a11 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v51.i8, 0), 8uLL), 8uLL)));
          int8x8_t v52 = (int8x8_t)vextq_s8(v51, v51, 8uLL).u64[0];
          float32x4_t v53 = vmlaq_f32((float32x4_t)0, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v52, 0), 8uLL), 8uLL))), a9);
          a10 = (__n128)vmlaq_f32((float32x4_t)0, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v52, 0), 8uLL), 8uLL))), a9);
          uint64_t v54 = v40 + v49;
          *(float32x4_t *)uint64_t v54 = vmlaq_f32((float32x4_t)0, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v51.i8, 0), 8uLL), 8uLL))), a9);
          *(float32x4_t *)(v54 + 16) = vmlaq_f32((float32x4_t)0, a11, a9);
          *(float32x4_t *)(v54 + 32) = v53;
          *(__n128 *)(v54 + 48) = a10;
          v49 += 64;
        }
        while (((4 * v21) & 0x3FFFFFFC0) != v49);
        if ((v21 & 0xFFFFFFF0) == v21) {
          goto LABEL_40;
        }
        uint64_t v43 = v21 & 0xFFFFFFF0;
        uint64_t v48 = v43;
        if ((v21 & 8) != 0) {
          goto LABEL_48;
        }
      }
      else
      {
        uint64_t v48 = 0;
      }
      do
      {
LABEL_51:
        a10.n128_u8[0] = *(unsigned char *)(v41 + v48);
        a10.n128_u64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8((int8x8_t)a10.n128_u64[0])).u64[0];
        a10.n128_f32[0] = (float)(*(float *)&v16 * (float)a10.n128_i32[0]) + 0.0;
        *(_DWORD *)(v40 + 4 * v48++) = a10.n128_u32[0];
      }
      while (v21 != v48);
LABEL_40:
      v41 += v25;
      v40 += v22;
      if (++v38 == v24) {
        goto LABEL_5;
      }
    }
  }
  return 4294967293;
}

uint64_t AcAttrNode::getParams(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  if (*a2 != 1) {
    return 4294967289;
  }
  int v3 = *(_DWORD *)(a1 + 76);
  *(void *)&long long v4 = *(void *)(a1 + 20);
  *((void *)&v4 + 1) = *(void *)(a1 + 68);
  *(_OWORD *)a3 = v4;
  *(_DWORD *)(a3 + 16) = v3;
  *(_DWORD *)(a3 + 20) = 10 * ((v3 * DWORD2(v4) + 63) & 0xFFFFFFC0) * HIDWORD(v4);
  *(_DWORD *)(a3 + 24) = *(_DWORD *)(a1 + 80);
  *(_DWORD *)(a3 + 52) = *(_DWORD *)(a1 + 108);
  *(_DWORD *)(a3 + 80) = *(_DWORD *)(a1 + 136);
  *(_DWORD *)(a3 + 28) = *(_DWORD *)(a1 + 84);
  *(_DWORD *)(a3 + 56) = *(_DWORD *)(a1 + 112);
  *(_DWORD *)(a3 + 84) = *(_DWORD *)(a1 + 140);
  *(_DWORD *)(a3 + 32) = *(_DWORD *)(a1 + 88);
  *(_DWORD *)(a3 + 60) = *(_DWORD *)(a1 + 116);
  *(_DWORD *)(a3 + 88) = *(_DWORD *)(a1 + 144);
  *(_DWORD *)(a3 + 36) = *(_DWORD *)(a1 + 92);
  *(_DWORD *)(a3 + 64) = *(_DWORD *)(a1 + 120);
  *(_DWORD *)(a3 + 92) = *(_DWORD *)(a1 + 148);
  *(_DWORD *)(a3 + 40) = *(_DWORD *)(a1 + 96);
  *(_DWORD *)(a3 + 68) = *(_DWORD *)(a1 + 124);
  *(_DWORD *)(a3 + 96) = *(_DWORD *)(a1 + 152);
  *(_DWORD *)(a3 + 44) = *(_DWORD *)(a1 + 100);
  *(_DWORD *)(a3 + 72) = *(_DWORD *)(a1 + 128);
  *(_DWORD *)(a3 + 100) = *(_DWORD *)(a1 + 156);
  *(_DWORD *)(a3 + 48) = *(_DWORD *)(a1 + 104);
  *(_DWORD *)(a3 + 76) = *(_DWORD *)(a1 + 132);
  *(void *)(a3 + 104) = *(void *)(a1 + 160);
  *(_DWORD *)(a3 + 112) = *(_DWORD *)(a1 + 168);
  *(_DWORD *)(a3 + 116) = *(_DWORD *)(a1 + 172);
  *(_DWORD *)(a3 + 120) = *(_DWORD *)(a1 + 176);
  *(_DWORD *)(a3 + 124) = *(_DWORD *)(a1 + 180);
  *(_DWORD *)(a3 + 128) = *(_DWORD *)(a1 + 184);
  *(_DWORD *)(a3 + 132) = *(_DWORD *)(a1 + 188);
  *(_DWORD *)(a3 + 136) = 0;
  uint64_t v5 = *(int *)(a1 + 164);
  if (v5 >= 8) {
    goto LABEL_18;
  }
  if (((0xFBu >> v5) & 1) == 0) {
    goto LABEL_18;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 136) * *(_DWORD *)(a1 + 108) * ((dword_217665AC4[v5] * *(_DWORD *)(a1 + 80) + 63) & 0xFFFFFFC0);
  *(_DWORD *)(a3 + 136) = v6;
  uint64_t v7 = *(int *)(a1 + 168);
  if (v7 > 7) {
    goto LABEL_18;
  }
  if (((0xFBu >> v7) & 1) == 0) {
    goto LABEL_18;
  }
  unsigned int v8 = v6
     + *(_DWORD *)(a1 + 140) * *(_DWORD *)(a1 + 112) * ((dword_217665AC4[v7] * *(_DWORD *)(a1 + 84) + 63) & 0xFFFFFFC0);
  *(_DWORD *)(a3 + 136) = v8;
  uint64_t v9 = *(int *)(a1 + 172);
  if (v9 > 7) {
    goto LABEL_18;
  }
  if (((0xFBu >> v9) & 1) == 0) {
    goto LABEL_18;
  }
  unsigned int v10 = v8
      + *(_DWORD *)(a1 + 144) * *(_DWORD *)(a1 + 116) * ((dword_217665AC4[v9] * *(_DWORD *)(a1 + 88) + 63) & 0xFFFFFFC0);
  *(_DWORD *)(a3 + 136) = v10;
  uint64_t v11 = *(int *)(a1 + 176);
  if (v11 > 7) {
    goto LABEL_18;
  }
  if (((0xFBu >> v11) & 1) == 0) {
    goto LABEL_18;
  }
  unsigned int v12 = v10
      + *(_DWORD *)(a1 + 148)
      * *(_DWORD *)(a1 + 120)
      * ((dword_217665AC4[v11] * *(_DWORD *)(a1 + 92) + 63) & 0xFFFFFFC0);
  *(_DWORD *)(a3 + 136) = v12;
  uint64_t v13 = *(int *)(a1 + 180);
  if (v13 > 7
    || ((0xFBu >> v13) & 1) == 0
    || (unsigned int v14 = v12
            + *(_DWORD *)(a1 + 152)
            * *(_DWORD *)(a1 + 124)
            * ((dword_217665AC4[v13] * *(_DWORD *)(a1 + 96) + 63) & 0xFFFFFFC0),
        *(_DWORD *)(a3 + 136) = v14,
        uint64_t v15 = *(int *)(a1 + 184),
        v15 > 7)
    || ((0xFBu >> v15) & 1) == 0
    || (unsigned int v16 = v14
            + *(_DWORD *)(a1 + 156)
            * *(_DWORD *)(a1 + 128)
            * ((dword_217665AC4[v15] * *(_DWORD *)(a1 + 100) + 63) & 0xFFFFFFC0),
        *(_DWORD *)(a3 + 136) = v16,
        uint64_t v17 = *(int *)(a1 + 188),
        v17 > 7)
    || ((0xFBu >> v17) & 1) == 0)
  {
LABEL_18:
    AcAttrNode::getParams();
  }
  *(_DWORD *)(a3 + 136) = 10
                        * (v16
                         + *(_DWORD *)(a1 + 160)
                         * *(_DWORD *)(a1 + 132)
                         * ((dword_217665AC4[v17] * *(_DWORD *)(a1 + 104) + 63) & 0xFFFFFFC0));
  *(_DWORD *)(a3 + 140) = *(_DWORD *)(a1 + 192);
  long long v18 = *(_OWORD *)(a1 + 220);
  *(_OWORD *)(a3 + 184) = *(_OWORD *)(a1 + 236);
  *(_OWORD *)(a3 + 168) = v18;
  *(_DWORD *)(a3 + 144) = *(_DWORD *)(a1 + 196);
  long long v19 = *(_OWORD *)(a1 + 252);
  *(_OWORD *)(a3 + 216) = *(_OWORD *)(a1 + 268);
  *(_OWORD *)(a3 + 200) = v19;
  *(_DWORD *)(a3 + 148) = *(_DWORD *)(a1 + 200);
  long long v20 = *(_OWORD *)(a1 + 284);
  *(_OWORD *)(a3 + 248) = *(_OWORD *)(a1 + 300);
  *(_OWORD *)(a3 + 232) = v20;
  *(_DWORD *)(a3 + 152) = *(_DWORD *)(a1 + 204);
  long long v21 = *(_OWORD *)(a1 + 332);
  *(_OWORD *)(a3 + 264) = *(_OWORD *)(a1 + 316);
  *(_OWORD *)(a3 + 280) = v21;
  *(_DWORD *)(a3 + 156) = *(_DWORD *)(a1 + 208);
  long long v22 = *(_OWORD *)(a1 + 364);
  *(_OWORD *)(a3 + 296) = *(_OWORD *)(a1 + 348);
  *(_OWORD *)(a3 + 312) = v22;
  *(_DWORD *)(a3 + 160) = *(_DWORD *)(a1 + 212);
  long long v23 = *(_OWORD *)(a1 + 396);
  *(_OWORD *)(a3 + 328) = *(_OWORD *)(a1 + 380);
  *(_OWORD *)(a3 + 344) = v23;
  *(_DWORD *)(a3 + 164) = *(_DWORD *)(a1 + 216);
  long long v24 = *(_OWORD *)(a1 + 428);
  *(_OWORD *)(a3 + 360) = *(_OWORD *)(a1 + 412);
  *(_OWORD *)(a3 + 376) = v24;
  long long v25 = *(_OWORD *)(a1 + 460);
  *(_OWORD *)(a3 + 392) = *(_OWORD *)(a1 + 444);
  *(_OWORD *)(a3 + 408) = v25;
  long long v26 = *(_OWORD *)(a1 + 492);
  *(_OWORD *)(a3 + 424) = *(_OWORD *)(a1 + 476);
  *(_OWORD *)(a3 + 440) = v26;
  long long v27 = *(_OWORD *)(a1 + 524);
  *(_OWORD *)(a3 + 456) = *(_OWORD *)(a1 + 508);
  *(_OWORD *)(a3 + 472) = v27;
  long long v28 = *(_OWORD *)(a1 + 556);
  *(_OWORD *)(a3 + 488) = *(_OWORD *)(a1 + 540);
  *(_OWORD *)(a3 + 504) = v28;
  long long v29 = *(_OWORD *)(a1 + 588);
  *(_OWORD *)(a3 + 520) = *(_OWORD *)(a1 + 572);
  *(_OWORD *)(a3 + 536) = v29;
  long long v30 = *(_OWORD *)(a1 + 620);
  *(_OWORD *)(a3 + 552) = *(_OWORD *)(a1 + 604);
  *(_OWORD *)(a3 + 568) = v30;
  long long v31 = *(_OWORD *)(a1 + 652);
  *(_OWORD *)(a3 + 584) = *(_OWORD *)(a1 + 636);
  *(_OWORD *)(a3 + 600) = v31;
  long long v32 = *(_OWORD *)(a1 + 684);
  *(_OWORD *)(a3 + 616) = *(_OWORD *)(a1 + 668);
  *(_OWORD *)(a3 + 632) = v32;
  long long v33 = *(_OWORD *)(a1 + 716);
  *(_OWORD *)(a3 + 648) = *(_OWORD *)(a1 + 700);
  *(_OWORD *)(a3 + 664) = v33;
  long long v34 = *(_OWORD *)(a1 + 748);
  *(_OWORD *)(a3 + 680) = *(_OWORD *)(a1 + 732);
  *(_OWORD *)(a3 + 696) = v34;
  long long v35 = *(_OWORD *)(a1 + 780);
  *(_OWORD *)(a3 + 712) = *(_OWORD *)(a1 + 764);
  *(_OWORD *)(a3 + 728) = v35;
  return 0;
}

uint64_t AcAttrNode::setUpNetBuffers(uint64_t result, uint64_t a2, _DWORD *a3, int *a4)
{
  if (result > 0xA) {
    return 4294967292;
  }
  uint64_t v4 = *(void *)(a2 + 4);
  if (!v4) {
    return 4294967292;
  }
  uint64_t v5 = *(void *)(a2 + 16);
  if (!v5) {
    return 4294967292;
  }
  uint64_t v6 = *(int *)(a2 + 12);
  if (v6 < a3[5]) {
    return 4294967292;
  }
  int64_t v7 = *(int *)(a2 + 24);
  if (v7 < a3[34]) {
    return 4294967292;
  }
  if (result)
  {
    uint64_t v8 = 0;
    int v9 = a3[3];
    int v10 = a3[4] * a3[2];
    unsigned int v11 = (v10 + 63) & 0xFFFFFFC0;
    uint64_t v12 = v11 * v9;
    uint64_t v13 = result;
    unsigned int v14 = a4 + 3;
    uint64_t v15 = v13;
    while (1)
    {
      *(void *)(v14 - 3) = v4 + v8;
      *(v14 - 1) = v9;
      int *v14 = v10;
      v14[1] = v11;
      v14[2] = 1;
      if (v12 + v8 > v6) {
        return 4294967292;
      }
      v14 += 6;
      v8 += v12;
      if (!--v15)
      {
        if (*(_DWORD *)a2 != 1)
        {
          uint64_t v46 = v5 + *(unsigned int *)(a2 + 28);
          uint64_t v47 = (int)a3[27];
          uint64_t v48 = a4 + 65;
          uint64_t v49 = v13;
          do
          {
            *(void *)(v48 - 5) = v46;
            int v50 = a3[6];
            *(v48 - 2) = v50;
            int v51 = a3[20] * a3[13];
            *(v48 - 3) = v51;
            *uint64_t v48 = v47;
            if (v47 > 7 || ((0xFBu >> v47) & 1) == 0) {
              goto LABEL_75;
            }
            unsigned int v52 = (dword_217665AC4[v47] * v50 + 63) & 0xFFFFFFC0;
            *(v48 - 1) = v52;
            v46 += v52 * v51;
            if (v46 - v5 > v7) {
              return 4294967292;
            }
            v48 += 42;
            --v49;
          }
          while (v49);
          uint64_t v53 = v5 + *(unsigned int *)(a2 + 32);
          uint64_t v54 = (int)a3[28];
          uint64_t v55 = a4 + 71;
          uint64_t v56 = v13;
          do
          {
            *(void *)(v55 - 5) = v53;
            int v57 = a3[7];
            *(v55 - 2) = v57;
            int v58 = a3[21] * a3[14];
            *(v55 - 3) = v58;
            *uint64_t v55 = v54;
            if (v54 > 7 || ((0xFBu >> v54) & 1) == 0) {
              goto LABEL_75;
            }
            unsigned int v59 = (dword_217665AC4[v54] * v57 + 63) & 0xFFFFFFC0;
            *(v55 - 1) = v59;
            v53 += v59 * v58;
            if (v53 - v5 > v7) {
              return 4294967292;
            }
            v55 += 42;
            --v56;
          }
          while (v56);
          uint64_t v60 = v5 + *(unsigned int *)(a2 + 36);
          uint64_t v61 = (int)a3[29];
          float32x4_t v62 = a4 + 77;
          uint64_t v63 = v13;
          do
          {
            *(void *)(v62 - 5) = v60;
            int v64 = a3[8];
            *(v62 - 2) = v64;
            int v65 = a3[22] * a3[15];
            *(v62 - 3) = v65;
            *float32x4_t v62 = v61;
            if (v61 > 7 || ((0xFBu >> v61) & 1) == 0) {
              goto LABEL_75;
            }
            unsigned int v66 = (dword_217665AC4[v61] * v64 + 63) & 0xFFFFFFC0;
            *(v62 - 1) = v66;
            v60 += v66 * v65;
            if (v60 - v5 > v7) {
              return 4294967292;
            }
            v62 += 42;
            --v63;
          }
          while (v63);
          uint64_t v67 = v5 + *(unsigned int *)(a2 + 40);
          uint64_t v68 = (int)a3[30];
          float v69 = a4 + 83;
          uint64_t v70 = v13;
          do
          {
            *(void *)(v69 - 5) = v67;
            int v71 = a3[9];
            *(v69 - 2) = v71;
            int v72 = a3[23] * a3[16];
            *(v69 - 3) = v72;
            *float v69 = v68;
            if (v68 > 7 || ((0xFBu >> v68) & 1) == 0) {
              goto LABEL_75;
            }
            unsigned int v73 = (dword_217665AC4[v68] * v71 + 63) & 0xFFFFFFC0;
            *(v69 - 1) = v73;
            v67 += v73 * v72;
            if (v67 - v5 > v7) {
              return 4294967292;
            }
            v69 += 42;
            --v70;
          }
          while (v70);
          uint64_t v74 = v5 + *(unsigned int *)(a2 + 44);
          uint64_t v75 = (int)a3[31];
          v76 = a4 + 89;
          uint64_t v77 = v13;
          do
          {
            *(void *)(v76 - 5) = v74;
            int v78 = a3[10];
            *(v76 - 2) = v78;
            int v79 = a3[24] * a3[17];
            *(v76 - 3) = v79;
            _DWORD *v76 = v75;
            if (v75 > 7 || ((0xFBu >> v75) & 1) == 0) {
              goto LABEL_75;
            }
            unsigned int v80 = (dword_217665AC4[v75] * v78 + 63) & 0xFFFFFFC0;
            *(v76 - 1) = v80;
            v74 += v80 * v79;
            if (v74 - v5 > v7) {
              return 4294967292;
            }
            v76 += 42;
            --v77;
          }
          while (v77);
          uint64_t v81 = v5 + *(unsigned int *)(a2 + 48);
          uint64_t v82 = (int)a3[32];
          int v83 = a4 + 95;
          uint64_t v84 = v13;
          do
          {
            *(void *)(v83 - 5) = v81;
            int v85 = a3[11];
            *(v83 - 2) = v85;
            int v86 = a3[25] * a3[18];
            *(v83 - 3) = v86;
            *int v83 = v82;
            if (v82 > 7 || ((0xFBu >> v82) & 1) == 0) {
              goto LABEL_75;
            }
            unsigned int v87 = (dword_217665AC4[v82] * v85 + 63) & 0xFFFFFFC0;
            *(v83 - 1) = v87;
            v81 += v87 * v86;
            if (v81 - v5 > v7) {
              return 4294967292;
            }
            v83 += 42;
            --v84;
          }
          while (v84);
          uint64_t v88 = v5 + *(unsigned int *)(a2 + 52);
          uint64_t v89 = (int)a3[33];
          for (i = a4 + 101; ; i += 42)
          {
            *(void *)(i - 5) = v88;
            int v91 = a3[12];
            *(i - 2) = v91;
            int v92 = a3[26] * a3[19];
            *(i - 3) = v92;
            _DWORD *i = v89;
            if (v89 > 7 || ((0xFBu >> v89) & 1) == 0) {
              break;
            }
            unsigned int v93 = (dword_217665AC4[v89] * v91 + 63) & 0xFFFFFFC0;
            *(i - 1) = v93;
            v88 += v93 * v92;
            if (v88 - v5 > v7) {
              return 4294967292;
            }
            uint64_t result = 0;
            if (!--v13) {
              return result;
            }
          }
LABEL_75:
          AcAttrNode::getParams();
        }
        uint64_t v16 = (int)a3[27];
        uint64_t v17 = (int)a3[28];
        uint64_t v18 = (int)a3[29];
        uint64_t v19 = (int)a3[30];
        uint64_t v20 = (int)a3[31];
        uint64_t v21 = (int)a3[32];
        uint64_t v22 = (int)a3[33];
        long long v23 = a4 + 101;
        uint64_t v24 = v5;
        while (1)
        {
          *(void *)(v23 - 41) = v24 + *(unsigned int *)(a2 + 28);
          int v25 = a3[6];
          *(v23 - 38) = v25;
          int v26 = a3[20] * a3[13];
          *(v23 - 39) = v26;
          *(v23 - 36) = v16;
          if (v16 > 7 || ((0xFBu >> v16) & 1) == 0) {
            goto LABEL_74;
          }
          unsigned int v27 = (dword_217665AC4[v16] * v25 + 63) & 0xFFFFFFC0;
          *(v23 - 37) = v27;
          if (v24 + *(unsigned int *)(a2 + 28) + v27 * v26 - v5 > v7) {
            return 4294967292;
          }
          *(void *)(v23 - 35) = v24 + *(unsigned int *)(a2 + 32);
          int v28 = a3[7];
          *(v23 - 32) = v28;
          int v29 = a3[21] * a3[14];
          *(v23 - 33) = v29;
          *(v23 - 30) = v17;
          if (v17 > 7 || ((0xFBu >> v17) & 1) == 0) {
            goto LABEL_74;
          }
          unsigned int v30 = (dword_217665AC4[v17] * v28 + 63) & 0xFFFFFFC0;
          *(v23 - 31) = v30;
          if (v24 + *(unsigned int *)(a2 + 32) + v30 * v29 - v5 > v7) {
            return 4294967292;
          }
          *(void *)(v23 - 29) = v24 + *(unsigned int *)(a2 + 36);
          int v31 = a3[8];
          *(v23 - 26) = v31;
          int v32 = a3[22] * a3[15];
          *(v23 - 27) = v32;
          *(v23 - 24) = v18;
          if (v18 > 7 || ((0xFBu >> v18) & 1) == 0) {
            goto LABEL_74;
          }
          unsigned int v33 = (dword_217665AC4[v18] * v31 + 63) & 0xFFFFFFC0;
          *(v23 - 25) = v33;
          if (v24 + *(unsigned int *)(a2 + 36) + v33 * v32 - v5 > v7) {
            return 4294967292;
          }
          *(void *)(v23 - 23) = v24 + *(unsigned int *)(a2 + 40);
          int v34 = a3[9];
          *(v23 - 20) = v34;
          int v35 = a3[23] * a3[16];
          *(v23 - 21) = v35;
          *(v23 - 18) = v19;
          if (v19 > 7 || ((0xFBu >> v19) & 1) == 0) {
            goto LABEL_74;
          }
          unsigned int v36 = (dword_217665AC4[v19] * v34 + 63) & 0xFFFFFFC0;
          *(v23 - 19) = v36;
          if (v24 + *(unsigned int *)(a2 + 40) + v36 * v35 - v5 > v7) {
            return 4294967292;
          }
          *(void *)(v23 - 17) = v24 + *(unsigned int *)(a2 + 44);
          int v37 = a3[10];
          *(v23 - 14) = v37;
          int v38 = a3[24] * a3[17];
          *(v23 - 15) = v38;
          *(v23 - 12) = v20;
          if (v20 > 7 || ((0xFBu >> v20) & 1) == 0) {
            goto LABEL_74;
          }
          unsigned int v39 = (dword_217665AC4[v20] * v37 + 63) & 0xFFFFFFC0;
          *(v23 - 13) = v39;
          if (v24 + *(unsigned int *)(a2 + 44) + v39 * v38 - v5 > v7) {
            return 4294967292;
          }
          *(void *)(v23 - 11) = v24 + *(unsigned int *)(a2 + 48);
          int v40 = a3[11];
          *(v23 - 8) = v40;
          int v41 = a3[25] * a3[18];
          *(v23 - 9) = v41;
          *(v23 - 6) = v21;
          if (v21 > 7 || ((0xFBu >> v21) & 1) == 0) {
            goto LABEL_74;
          }
          unsigned int v42 = (dword_217665AC4[v21] * v40 + 63) & 0xFFFFFFC0;
          *(v23 - 7) = v42;
          if (v24 + *(unsigned int *)(a2 + 48) + v42 * v41 - v5 > v7) {
            return 4294967292;
          }
          *(void *)(v23 - 5) = v24 + *(unsigned int *)(a2 + 52);
          int v43 = a3[12];
          *(v23 - 2) = v43;
          int v44 = a3[26] * a3[19];
          *(v23 - 3) = v44;
          _DWORD *v23 = v22;
          if (v22 > 7 || ((0xFBu >> v22) & 1) == 0) {
LABEL_74:
          }
            AcAttrNode::getParams();
          unsigned int v45 = (dword_217665AC4[v22] * v43 + 63) & 0xFFFFFFC0;
          *(v23 - 1) = v45;
          v24 += *(unsigned int *)(a2 + 52) + (unint64_t)(v45 * v44);
          if (v24 - v5 > v7) {
            return 4294967292;
          }
          uint64_t result = 0;
          v23 += 42;
          if (!--v13) {
            return result;
          }
        }
      }
    }
  }
  return result;
}

void ttDetRectOverlap(float *a1, float *a2)
{
  bmMaximum(0.0, a1[2] - *a1);
  bmMaximum(0.0, a1[3] - a1[1]);
  bmMaximum(0.0, a2[2] - *a2);
  bmMaximum(0.0, a2[3] - a2[1]);
  float v4 = bmMaximum(*a1, *a2);
  float v5 = bmMaximum(a1[1], a2[1]);
  float v6 = bmMinimum(a1[2], a2[2]);
  float v7 = bmMinimum(a1[3], a2[3]);
  bmMaximum(a1[6], a2[6]);
  bmMaximum(0.0, v6 - v4);
  bmMaximum(0.0, v7 - v5);
}

void ttDetRectOverlap2(float *a1, float *a2)
{
  bmMaximum(0.0, a1[2] - *a1);
  bmMaximum(0.0, a1[3] - a1[1]);
  bmMaximum(0.0, a2[2] - *a2);
  bmMaximum(0.0, a2[3] - a2[1]);
  float v4 = bmMaximum(*a1, *a2);
  float v5 = bmMaximum(a1[1], a2[1]);
  float v6 = bmMinimum(a1[2], a2[2]);
  float v7 = bmMinimum(a1[3], a2[3]);
  bmMaximum(a1[6], a2[6]);
  bmMaximum(0.0, v6 - v4);
  bmMaximum(0.0, v7 - v5);
}

void ttDetRectOverlapSmallbox(float *a1, float *a2)
{
  float v4 = bmMaximum(0.0, a1[2] - *a1);
  float v5 = v4 * bmMaximum(0.0, a1[3] - a1[1]);
  float v6 = bmMaximum(0.0, a2[2] - *a2);
  float v7 = v6 * bmMaximum(0.0, a2[3] - a2[1]);
  float v8 = bmMaximum(*a1, *a2);
  float v9 = bmMaximum(a1[1], a2[1]);
  float v10 = bmMinimum(a1[2], a2[2]);
  float v11 = bmMinimum(a1[3], a2[3]);
  bmMaximum(a1[6], a2[6]);
  bmMaximum(0.0, v10 - v8);
  bmMaximum(0.0, v11 - v9);
  bmMinimum(v5, v7);
}

BOOL ttDetRectScoreCompare(float *a1, float *a2)
{
  return a1[6] < a2[6];
}

int32x2_t ttDetRectFromObject@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  float32x2_t v2 = *(float32x2_t *)(a1 + 8);
  float32x2_t v3 = vadd_f32(v2, *(float32x2_t *)(a1 + 16));
  *(float32x2_t *)a2 = v2;
  *(float32x2_t *)(a2 + 8) = v3;
  int v4 = *(_DWORD *)(a1 + 4);
  if (v4 >= 7) {
    ttDetRectFromObject();
  }
  *(_DWORD *)(a2 + 16) = v4 + 1;
  *(float *)(a2 + 24) = (float)*(unsigned int *)(a1 + 24) / 1000.0;
  int32x2_t result = vrev64_s32((int32x2_t)vcvt_f32_u32(*(uint32x2_t *)(a1 + 28)));
  *(int32x2_t *)(a2 + 28) = result;
  return result;
}

void sub_21762F664(_Unwind_Exception *a1)
{
  float32x2_t v3 = *(void **)(v1 + 48);
  if (v3)
  {
    *(void *)(v1 + 56) = v3;
    operator delete(v3);
  }
  ft::HungarianMatcher::HungarianMatcher((void **)(v1 + 24), v1);
  _Unwind_Resume(a1);
}

void ft::HungarianMatcher::~HungarianMatcher(ft::HungarianMatcher *this)
{
  float32x2_t v2 = (void *)*((void *)this + 6);
  if (v2)
  {
    *((void *)this + 7) = v2;
    operator delete(v2);
  }
  float32x2_t v3 = (void *)*((void *)this + 3);
  if (v3)
  {
    *((void *)this + 4) = v3;
    operator delete(v3);
  }
  int v4 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v4;
    operator delete(v4);
  }
}

{
  void *v2;
  void *v3;
  void *v4;

  float32x2_t v2 = (void *)*((void *)this + 6);
  if (v2)
  {
    *((void *)this + 7) = v2;
    operator delete(v2);
  }
  float32x2_t v3 = (void *)*((void *)this + 3);
  if (v3)
  {
    *((void *)this + 4) = v3;
    operator delete(v3);
  }
  int v4 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v4;
    operator delete(v4);
  }
}

void ft::HungarianMatcher::Match(ft::HungarianMatcher *this@<X0>, float *a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, void *a5@<X8>)
{
  if (a3 <= a4) {
    unint64_t v10 = a4;
  }
  else {
    unint64_t v10 = a3;
  }
  if (*((void *)this + 9) < v10) {
    ft::HungarianMatcher::UpdateBuffers(this, v10);
  }
  float v11 = *(float **)this;
  if (a3 && a4)
  {
    uint64_t v12 = 4 * v10;
    if (a4 < 8)
    {
      uint64_t v13 = v11 + 3;
      unint64_t v14 = a3;
      do
      {
        *(v13 - 3) = *a2;
        if (a4 == 1)
        {
          ++a2;
        }
        else
        {
          *(v13 - 2) = a2[1];
          if (a4 == 2)
          {
            a2 += 2;
          }
          else
          {
            *(v13 - 1) = a2[2];
            if (a4 == 3)
            {
              a2 += 3;
            }
            else
            {
              *uint64_t v13 = a2[3];
              if (a4 == 4)
              {
                a2 += 4;
              }
              else
              {
                v13[1] = a2[4];
                if (a4 == 5)
                {
                  a2 += 5;
                }
                else
                {
                  v13[2] = a2[5];
                  if (a4 == 6)
                  {
                    a2 += 6;
                  }
                  else
                  {
                    v13[3] = a2[6];
                    a2 += 7;
                  }
                }
              }
            }
          }
        }
        uint64_t v13 = (float *)((char *)v13 + v12);
        --v14;
      }
      while (v14);
      goto LABEL_33;
    }
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)this;
    do
    {
      if ((unint64_t)((char *)v11 + v12 * v15 - (char *)a2) >= 0x20)
      {
        uint64_t v19 = 0;
        uint64_t v18 = &a2[a4 & 0xFFFFFFFFFFFFFFF8];
        unint64_t v20 = a4 & 0xFFFFFFFFFFFFFFF8;
        do
        {
          long long v21 = *(_OWORD *)&a2[v19 + 4];
          uint64_t v22 = (_OWORD *)(v16 + v19 * 4);
          _OWORD *v22 = *(_OWORD *)&a2[v19];
          v22[1] = v21;
          v19 += 8;
          v20 -= 8;
        }
        while (v20);
        unint64_t v17 = a4 & 0xFFFFFFFFFFFFFFF8;
        if ((a4 & 0xFFFFFFFFFFFFFFF8) == a4) {
          goto LABEL_25;
        }
      }
      else
      {
        unint64_t v17 = 0;
        uint64_t v18 = a2;
      }
      do
      {
        float v23 = *v18++;
        *(float *)(v16 + 4 * v17++) = v23;
      }
      while (a4 != v17);
LABEL_25:
      ++v15;
      v16 += v12;
      a2 = (float *)v18;
    }
    while (v15 != a3);
  }
LABEL_33:
  if (a3 != a4)
  {
    unint64_t v24 = a3 >= a4 ? 0 : a3;
    unint64_t v25 = a3 >= a4 ? a4 : 0;
    unint64_t v26 = v10 - v24;
    if (v10 > v24 && v10 != v25)
    {
      unsigned int v27 = &v11[v24 * v10 + v25];
      size_t v28 = 4 * (v10 - v25);
      do
      {
        bzero(v27, v28);
        v27 += v10;
        --v26;
      }
      while (v26);
    }
  }
  bmMunkres(v11, v10, *((unsigned __int8 **)this + 6), *((_DWORD *)this + 14) - *((void *)this + 6), *((unsigned int **)this + 3), v10, 0);
  *a5 = 0;
  a5[1] = 0;
  a5[2] = 0;
  if (!a3)
  {
    int v29 = 0;
    if (!v10) {
      return;
    }
    goto LABEL_49;
  }
  if (a3 >> 61) {
    std::vector<long long>::__throw_length_error[abi:ne180100]();
  }
  int v29 = (char *)operator new(8 * a3);
  *a5 = v29;
  a5[2] = &v29[8 * a3];
  bzero(v29, 8 * a3);
  a5[1] = &v29[8 * a3];
  if (v10)
  {
LABEL_49:
    unint64_t v30 = 0;
    uint64_t v31 = *((void *)this + 3);
    do
    {
      unint64_t v32 = *(unsigned int *)(v31 + 4 * v30);
      if (v32 < a3)
      {
        if (v30 >= a4) {
          uint64_t v33 = -1;
        }
        else {
          uint64_t v33 = v30;
        }
        *(void *)&v29[8 * v32] = v33;
      }
      ++v30;
    }
    while (v10 != v30);
  }
}

void sub_21762FA04(_Unwind_Exception *exception_object)
{
  float32x2_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<long long>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264294C30, MEMORY[0x263F8C060]);
}

void sub_21762FA80(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  int32x2_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

uint64_t acCropResizeGenerateConfig(unsigned int a1, unsigned int a2, _DWORD *a3, unsigned int a4, unsigned int a5, char a6, uint64_t a7, float a8, float a9, float a10, float a11)
{
  if ((a5 | a4)) {
    acCropResizeGenerateConfig();
  }
  unsigned int v12 = a3[1];
  if (v12 >= 5) {
    acCropResizeGenerateConfig();
  }
  uint64_t result = 0;
  *(unsigned char *)a7 = 0;
  if (a8 >= 0.0 && a9 >= 0.0 && !*a3 && v12)
  {
    __int16 v20 = a5;
    __int16 v21 = a4;
    float v22 = (float)a1;
    float v23 = (float)a2;
    float v24 = (float)a4;
    float v25 = (float)a5;
    float v26 = bmMinimum((float)a3[2] / (float)a1, (float)a3[6] / (float)a2);
    float v57 = a10;
    float v58 = a11;
    float v27 = v24 / bmMaximum(1.0, v26 * a10);
    float v28 = bmMaximum(1.0, v26 * a11);
    float v29 = bmMinimum(v27, v25 / v28);
    if (v29 > 4.0) {
      return 0;
    }
    float v30 = 0.5;
    if (v29 >= 0.5)
    {
      char v39 = 0;
LABEL_18:
      float v31 = v57;
      a11 = v58;
      *(unsigned char *)(a7 + 1) = v39;
    }
    else
    {
      float v31 = v57;
      if (a3[1] >= 2u)
      {
        uint64_t v32 = 0;
        do
        {
          uint64_t v33 = &a3[v32];
          unsigned int v34 = v33[3];
          if (v34 > v33[2]) {
            acCropResizeGenerateConfig();
          }
          unsigned int v35 = v33[7];
          if (v35 > v33[6]) {
            acCropResizeGenerateConfig();
          }
          float v26 = bmMinimum((float)v34 / v22, (float)v35 / v23);
          float v36 = v24 / bmMaximum(1.0, v26 * v31);
          float v37 = bmMaximum(1.0, v26 * a11);
          float v29 = bmMinimum(v36, v25 / v37);
          if (v29 > 4.0) {
            return 0;
          }
          float v30 = 0.5;
          if (v29 >= 0.5)
          {
            char v39 = v32 + 1;
            goto LABEL_18;
          }
          unint64_t v38 = v32 + 2;
          ++v32;
          float v31 = v57;
          a11 = v58;
        }
        while (v38 < a3[1]);
      }
    }
    if (v29 < v30) {
      return 0;
    }
    uint64_t v40 = *(unsigned __int8 *)(a7 + 1);
    int v41 = &a3[v40];
    unsigned int v42 = v41 + 2;
    unsigned int v43 = v41[2];
    if ((float)(v26 * a8) > (float)((float)v43 + -1.0)) {
      return 0;
    }
    unsigned int v45 = v41[6];
    int v44 = v41 + 6;
    if ((float)(v26 * a9) > (float)((float)v45 + -1.0)) {
      return 0;
    }
    *(_WORD *)(a7 + 20) = v21;
    *(_WORD *)(a7 + 22) = v20;
    unsigned int v46 = llroundf((float)(v26 * a8) * 8.0);
    *(_WORD *)(a7 + 24) = v46;
    *(_WORD *)(a7 + 26) = v46 >> 1;
    unsigned int v47 = llroundf((float)(v26 * a9) * 8.0);
    *(_WORD *)(a7 + 30) = v47 >> 1;
    unsigned int v48 = llroundf(16384.0 / v29);
    *(_WORD *)(a7 + 28) = v47;
    *(_WORD *)(a7 + 32) = v48;
    *(_WORD *)(a7 + 36) = v48;
    v48 >>= 1;
    *(_WORD *)(a7 + 34) = v48;
    *(_WORD *)(a7 + 38) = v48;
    if (a6)
    {
      unsigned int v50 = (v46 >> 3) & 0x1FC0;
      unsigned int v51 = (v47 >> 3) & 0x1FFE;
      unsigned int v52 = &a3[2 * v40];
      *(_DWORD *)(a7 + 12) = v50 + v52[10] * v51;
      *(_DWORD *)(a7 + 16) = v50 + v52[11] * ((unsigned __int16)v47 >> 4);
      unsigned int v53 = *v42;
      if (v53 <= v50) {
        acCropResizeGenerateConfig();
      }
      if (*v44 <= v51) {
        acCropResizeGenerateConfig();
      }
      *(_DWORD *)(a7 + 4) = bmMinimum(v53 - v50, (float)(v26 * v31) + 63);
      *(_DWORD *)(a7 + 8) = bmMinimum(a3[*(unsigned __int8 *)(a7 + 1) + 6] - v51, (float)(v26 * a11) + 1);
      unsigned __int16 v54 = *(_WORD *)(a7 + 24) - 8 * v50;
      *(_WORD *)(a7 + 24) = v54;
      unsigned __int16 v55 = *(_WORD *)(a7 + 28) - 8 * v51;
      *(_WORD *)(a7 + 28) = v55;
      *(_WORD *)(a7 + 26) = v54 >> 1;
      *(_WORD *)(a7 + 30) = v55 >> 1;
      uint64_t result = 1;
      *(unsigned char *)a7 = 1;
    }
    else
    {
      *(_DWORD *)(a7 + 4) = v43;
      unsigned int v49 = *v44;
      *(_DWORD *)(a7 + 12) = 0;
      *(_DWORD *)(a7 + 16) = 0;
      *(_DWORD *)(a7 + 8) = v49;
      return 1;
    }
  }
  return result;
}

uint64_t AcDetNode::AcDetNode(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 3308) = 0u;
  *(_OWORD *)(a1 + 3324) = 0u;
  int v4 = (void *)(a1 + 2512);
  *(_OWORD *)(a1 + 3276) = 0u;
  *(_OWORD *)(a1 + 3292) = 0u;
  *(_OWORD *)(a1 + 3244) = 0u;
  *(_OWORD *)(a1 + 3260) = 0u;
  *(_OWORD *)(a1 + 3212) = 0u;
  *(_OWORD *)(a1 + 3228) = 0u;
  *(_OWORD *)(a1 + 3196) = 0u;
  *(unsigned char *)(a1 + 3412) = 0;
  bzero((void *)a1, 0x9A4uLL);
  bzero(v4, 0x294uLL);
  *(_DWORD *)(a2 + 8) = 0;
  *(void *)a2 = 0xDE7C00000001;
  return a1;
}

{
  void *v4;

  *(_OWORD *)(a1 + 3308) = 0u;
  *(_OWORD *)(a1 + 3324) = 0u;
  int v4 = (void *)(a1 + 2512);
  *(_OWORD *)(a1 + 3276) = 0u;
  *(_OWORD *)(a1 + 3292) = 0u;
  *(_OWORD *)(a1 + 3244) = 0u;
  *(_OWORD *)(a1 + 3260) = 0u;
  *(_OWORD *)(a1 + 3212) = 0u;
  *(_OWORD *)(a1 + 3228) = 0u;
  *(_OWORD *)(a1 + 3196) = 0u;
  *(unsigned char *)(a1 + 3412) = 0;
  bzero((void *)a1, 0x9A4uLL);
  bzero(v4, 0x294uLL);
  *(_DWORD *)(a2 + 8) = 0;
  *(void *)a2 = 0xDE7C00000001;
  return a1;
}

void AcDetNode::~AcDetNode(AcDetNode *this)
{
  uint64_t v2 = *((void *)this + 314);
  if (v2) {
    MEMORY[0x21D449400](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 306);
  if (v3) {
    MEMORY[0x21D449400](v3, 0x1000C8052888210);
  }
  int v4 = (void *)((char *)this + 3364);
  uint64_t v5 = *((void *)this + 307);
  if (v5) {
    MEMORY[0x21D449400](v5, 0x1000C8052888210);
  }
  if (*v4) {
    MEMORY[0x21D449400](*v4, 0x1000C8077774924);
  }
  uint64_t v6 = *(void *)((char *)this + 3388);
  if (v6) {
    MEMORY[0x21D449400](v6, 0x1000C8077774924);
  }
}

{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  uint64_t v2 = *((void *)this + 314);
  if (v2) {
    MEMORY[0x21D449400](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 306);
  if (v3) {
    MEMORY[0x21D449400](v3, 0x1000C8052888210);
  }
  int v4 = (void *)((char *)this + 3364);
  uint64_t v5 = *((void *)this + 307);
  if (v5) {
    MEMORY[0x21D449400](v5, 0x1000C8052888210);
  }
  if (*v4) {
    MEMORY[0x21D449400](*v4, 0x1000C8077774924);
  }
  uint64_t v6 = *(void *)((char *)this + 3388);
  if (v6) {
    MEMORY[0x21D449400](v6, 0x1000C8077774924);
  }
}

uint64_t AcDetNode::init(uint64_t a1, char *a2, _DWORD *a3, int a4)
{
  if (*a3 != 1) {
    return 4294967289;
  }
  int v4 = a3[1];
  if (v4 != 56956 && v4 != 56945) {
    return 4294967292;
  }
  uint64_t v6 = (char *)&kAcODNodeConfigDefaultRawData;
  if (!a4) {
    uint64_t v6 = (char *)&kAcDetFaceNodeConfigDefaultRawData;
  }
  if (a2)
  {
LABEL_10:
    if (*((_DWORD *)a2 + 6))
    {
      if (*((_DWORD *)a2 + 5))
      {
        if (*((_DWORD *)a2 + 11) >= 2u && (*((_DWORD *)a2 + 12) - 11) >= 0xFFFFFFF6)
        {
          unsigned int v7 = *((_DWORD *)a2 + 26);
          if (v7 - 7 >= 0xFFFFFFFA
            && *((_DWORD *)a2 + 393) <= v7
            && *((_DWORD *)a2 + 394) <= 5u
            && !a2[1706]
            && !a2[1738]
            && !a2[1770]
            && !a2[1802])
          {
            __src = a2;
            if (!a2[1834]
              && !a2[1866]
              && !a2[1898]
              && !a2[1930]
              && !a2[1962]
              && !a2[1994]
              && !a2[2026]
              && !a2[2058]
              && !a2[2090]
              && !a2[2122]
              && !a2[2154]
              && !a2[2186]
              && !a2[2218]
              && !a2[2250]
              && !a2[2282]
              && !a2[2314]
              && !a2[2346]
              && !a2[2378]
              && !a2[2410]
              && !a2[2442])
            {
              memcpy((void *)a1, a2, 0x990uLL);
              *(float *)(a1 + 2468) = logf(*(float *)(a1 + 1380) / (float)(1.0 - *(float *)(a1 + 1380)));
              *(float *)(a1 + 2472) = logf(*(float *)(a1 + 1384) / (float)(1.0 - *(float *)(a1 + 1384)));
              *(float *)(a1 + 2476) = logf(*(float *)(a1 + 1388) / (float)(1.0 - *(float *)(a1 + 1388)));
              *(float *)(a1 + 2480) = logf(*(float *)(a1 + 1392) / (float)(1.0 - *(float *)(a1 + 1392)));
              *(float *)(a1 + 2484) = logf(*(float *)(a1 + 1396) / (float)(1.0 - *(float *)(a1 + 1396)));
              *(float *)(a1 + 2488) = logf(*(float *)(a1 + 1400) / (float)(1.0 - *(float *)(a1 + 1400)));
              *(float *)(a1 + 2492) = logf(*(float *)(a1 + 1404) / (float)(1.0 - *(float *)(a1 + 1404)));
              *(float *)(a1 + 2496) = logf(*(float *)(a1 + 1408) / (float)(1.0 - *(float *)(a1 + 1408)));
              *(float *)(a1 + 2500) = logf(*(float *)(a1 + 1412) / (float)(1.0 - *(float *)(a1 + 1412)));
              *(float *)(a1 + 2504) = logf(*(float *)(a1 + 1416) / (float)(1.0 - *(float *)(a1 + 1416)));
              uint64_t v10 = *(void *)(a1 + 2512);
              if (v10) {
                MEMORY[0x21D449400](v10, 0x1000C8077774924);
              }
              *(_DWORD *)(a1 + 2464) = 0;
              *(_DWORD *)(a1 + 2520) = 0;
              uint64_t v11 = *(unsigned int *)(a1 + 104);
              if (v11)
              {
                int v12 = 0;
                unsigned int v13 = 0;
                unint64_t v14 = (_DWORD *)(a1 + 132);
                uint64_t v15 = (int *)(__src + 228);
                do
                {
                  unsigned int v16 = *v14 * *(v14 - 6);
                  if (!v16) {
                    AcDetNode::init();
                  }
                  if (!v14[24]) {
                    AcDetNode::init();
                  }
                  ++v14;
                  if (v16 > v13) {
                    unsigned int v13 = v16;
                  }
                  int v17 = *v15++;
                  v12 += v17;
                  *(_DWORD *)(a1 + 2464) = v12;
                  --v11;
                }
                while (v11);
              }
              else
              {
                unsigned int v13 = 0;
              }
              *(_DWORD *)(a1 + 2520) = v13;
              operator new[]();
            }
          }
        }
      }
    }
    return 4294967292;
  }
  if (a4 != 1)
  {
    a2 = v6;
    goto LABEL_10;
  }
  return 4294967288;
}

uint64_t AcDetNode::postProcess(uint64_t a1, uint64_t a2, int a3, _DWORD *a4, _DWORD *a5)
{
  if (*a4 != 1) {
    return 4294967289;
  }
  uint64_t result = 4294967292;
  if (a3 == 24 && a4[1] == 56945)
  {
    std::chrono::steady_clock::now();
    AcDetNode::postProcessDet(a1, a2, v10, (uint64_t)a4, a5);
    return 0;
  }
  return result;
}

uint64_t AcDetNode::postProcessDet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  int v8 = *(_DWORD *)(a4 + 8);
  a5[54] = v8;
  *(_DWORD *)(a4 + 8) = v8 + 1;
  if (*(_DWORD *)(a1 + 104))
  {
    unint64_t v9 = 0;
    uint64_t v10 = a1 + 2524;
    uint64_t v11 = (_DWORD *)(a1 + 2668);
    do
    {
      unsigned int v78 = -1;
      unsigned int v79 = -1;
      unsigned int v77 = -1;
      acDetBboxCoderGetClsBufferInds(*(unsigned int *)(a1 + 1572), v9, &v79, &v78, &v77);
      uint64_t v23 = v79;
      if (v79 == -1)
      {
        uint64_t v24 = v78;
        if (v78 == -1) {
          AcDetNode::postProcessDet();
        }
        uint64_t v23 = v77;
        if (v77 == -1) {
          AcDetNode::postProcessDet();
        }
        float v25 = (long long *)(a2 + 24 * v78);
        uint64_t v26 = a1 + 24 * v78 + 2692;
        long long v27 = *v25;
        *(void *)(v26 + 16) = *((void *)v25 + 2);
        *(_OWORD *)uint64_t v26 = v27;
        *(_DWORD *)(a1 + 4 * v24 + 2980) = *(_DWORD *)(a1 + 4 * v24 + 1580);
      }
      int v12 = (long long *)(a2 + 24 * v23);
      uint64_t v13 = a1 + 24 * v23 + 2692;
      long long v14 = *v12;
      uint64_t v15 = *((void *)v12 + 2);
      *(_OWORD *)uint64_t v13 = v14;
      uint64_t v16 = 4 * v23;
      LODWORD(v14) = *(_DWORD *)(a1 + 1580 + v16);
      *(void *)(v13 + 16) = v15;
      *(_DWORD *)(a1 + v16 + 2980) = v14;
      int v17 = (long long *)(a2 + 24 * (v9 + 6));
      long long v18 = *v17;
      *(void *)(v10 + 16) = *((void *)v17 + 2);
      *(_OWORD *)uint64_t v10 = v18;
      *uint64_t v11 = *(_DWORD *)(a1 + 1580 + 4 * (v9 + 6));
      uint64_t v19 = (long long *)(a2 + 24 * (v9 + 12));
      long long v20 = *v19;
      *(void *)(v10 + 520) = *((void *)v19 + 2);
      *(_OWORD *)(v10 + 504) = v20;
      v11[126] = *(_DWORD *)(a1 + 1580 + 4 * (v9 + 12));
      __int16 v21 = (long long *)(a2 + 24 * (v9 + 18));
      long long v22 = *v21;
      *(void *)(v10 + 688) = *((void *)v21 + 2);
      *(_OWORD *)(v10 + 672) = v22;
      v11[168] = *(_DWORD *)(a1 + 1580 + 4 * (v9++ + 18));
      v10 += 24;
      ++v11;
    }
    while (v9 < *(unsigned int *)(a1 + 104));
  }
  std::chrono::steady_clock::now();
  uint64_t v31 = a1 + 2468;
  uint64_t v32 = a1 + 2692;
  uint64_t v33 = a1 + 2524;
  uint64_t v34 = a1 + 3028;
  uint64_t v35 = a1 + 3196;
  if (*(_DWORD *)(a2 + 20)) {
    uint64_t v36 = acDetBboxCoderDecodeAllFloat((unsigned int *)a1, v31, v32, v33, v34, v35, *(void *)(a1 + 2448), *(void *)(a1 + 2456), *(_DWORD *)(a1 + 2464), *(unsigned char *)(a1 + 3412), *(void *)(a1 + 2512), *(_DWORD *)(a1 + 2520), a1 + 3364, a1 + 3388);
  }
  else {
    uint64_t v36 = acDetBboxCoderDecodeAll((unsigned int *)a1, v31, v32, v33, v34, v35, a1 + 2980, a1 + 2668, v28, v29, v30, a1 + 3172, a1 + 3340, *(void *)(a1 + 2448), *(void *)(a1 + 2456), *(_DWORD *)(a1 + 2464), *(unsigned char *)(a1 + 3412), *(void *)(a1 + 2512), *(_DWORD *)(a1 + 2520),
  }
            a1 + 3364,
            a1 + 3388);
  unint64_t v37 = v36;
  bmHeapsort(*(void *)(a1 + 2512), v36, 0x24uLL, (int (*)(uint64_t, uint64_t))acDetBboxCoderRectDefDistCostCompare);
  acDetBboxCoderRectToDetRect(*(void *)(a1 + 2512), v37, *(void *)(a1 + 2512));
  unsigned int v38 = *(_DWORD *)(a1 + 96);
  if (v38 >= v37 || *(float *)(*(void *)(a1 + 2512) + 36 * v38 + 24) < *(float *)(a1 + 100))
  {
    if (*(unsigned char *)(a1 + 2444))
    {
      std::chrono::steady_clock::now();
      unint64_t v37 = acDetRectWeightedMerge(*(void *)(a1 + 2512), v37, *(float *)(a1 + 60), *(float *)(a1 + 64));
      bmHeapsort(*(void *)(a1 + 2512), v37, 0x24uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
    }
    std::chrono::steady_clock::now();
    unint64_t v39 = acNonMaxSuppression(*(void *)(a1 + 2512), v37, *(float *)(a1 + 68));
    std::chrono::steady_clock::now();
    unint64_t v40 = acCrossClassSuppression(*(void *)(a1 + 2512), 1, 2, v39, *(float *)(a1 + 72));
    bmHeapsort(*(void *)(a1 + 2512), v40, 0x24uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
    if (*(unsigned char *)(a1 + 2444))
    {
      std::chrono::steady_clock::now();
      unint64_t v41 = acDetRectSmallRectSuppression(*(void *)(a1 + 2512), v40, *(float *)(a1 + 76), *(float *)(a1 + 80));
      bmHeapsort(*(void *)(a1 + 2512), v41, 0x24uLL, (int (*)(uint64_t, uint64_t))acDetRectSortIndexCompare);
      std::chrono::steady_clock::now();
      LODWORD(v40) = acDetRectLowMergeCountSuppression(*(void *)(a1 + 2512), v41, *(_DWORD *)(a1 + 88), *(_DWORD *)(a1 + 92), *(float *)(a1 + 84));
    }
    if (*(unsigned char *)(a1 + 3412)) {
      uint64_t v42 = a1 + 1420;
    }
    else {
      uint64_t v42 = a1 + 1380;
    }
    uint64_t v43 = acDetRectFilterByScore(*(void *)(a1 + 2512), v40, v42);
    unsigned int v44 = bmMinimum(v43, *(_DWORD *)(a1 + 48));
    if (v44)
    {
      uint64_t v45 = 0;
      uint64_t v46 = 36 * v44;
      int v47 = 1;
      do
      {
        uint64_t v58 = *(void *)(a1 + 2512);
        uint64_t v59 = v58 + v45;
        uint64_t v60 = *(unsigned int *)(v58 + v45 + 16);
        if (v60 > 2)
        {
          uint64_t v70 = a5[286];
          a5[8 * v70 + 287] = v47;
          if ((int)v60 >= 10) {
            AcDetNode::postProcessDet();
          }
          if (v60 <= 9) {
            int v48 = dword_2176662E8[(int)v60];
          }
          else {
            int v48 = 0;
          }
          uint64_t v49 = (uint64_t)&a5[8 * v70 + 287];
          *(_DWORD *)(v49 + 4) = v48;
          unsigned int v50 = (float32x2_t *)(v58 + v45);
          *(float32x2_t *)v51.f32 = *v50;
          *(float32x2_t *)v52.i8 = vcvt_f32_u32(*(uint32x2_t *)(a1 + 20));
          v52.i64[1] = v52.i64[0];
          *(float32x2_t *)&v51.u32[2] = vsub_f32(v50[1], *v50);
          *(float32x4_t *)(v49 + 8) = vmulq_f32(v51, (float32x4_t)vrev64q_s32(v52));
          int v53 = bmClamp((int)(float)((float)((float)((float)(v50[3].f32[0] - *(float *)(v42 + 4 * v60))/ (float)(1.0 - *(float *)(v42 + 4 * v60)))* 1000.0)+ 0.5), 1u, 1000);
          uint64_t v54 = a5[286];
          uint64_t v55 = (uint64_t)&a5[8 * v54 + 287];
          *(_DWORD *)(v55 + 24) = v53;
          uint64_t v56 = (_DWORD *)(v55 + 28);
          float v57 = a5 + 286;
        }
        else
        {
          int v61 = a5[55];
          a5[23 * v61 + 56] = v47;
          if (!v60) {
            AcDetNode::postProcessDet();
          }
          a5[23 * v61 + 57] = 0;
          float32x4_t v62 = (float32x2_t *)(v58 + v45);
          if (v60 == 1)
          {
            int32x2_t v64 = (int32x2_t)*v62;
            float32x2_t v63 = v62[1];
            float32x2_t v65 = vsub_f32(v63, *v62);
            int32x2_t v66 = (int32x2_t)vcvt_f32_u32(*(uint32x2_t *)(a1 + 20));
            float32x2_t v67 = (float32x2_t)vrev64_s32(v66);
            v65.f32[0] = vmlas_n_f32(COERCE_FLOAT(vmul_f32(v65, v67).i32[1]), *(float *)&v66.i32[1], v65.f32[0]) * 0.5;
            *(float *)v64.i32 = v65.f32[0] * 0.5;
            float32x2_t v68 = vsub_f32(vmul_f32(vmul_f32(vadd_f32(v63, *v62), (float32x2_t)0x3F0000003F000000), v67), (float32x2_t)vdup_lane_s32(v64, 0));
            float32x2_t v69 = (float32x2_t)vdup_lane_s32((int32x2_t)v65, 0);
          }
          else
          {
            float32x2_t v71 = (float32x2_t)vrev64_s32((int32x2_t)vcvt_f32_u32(*(uint32x2_t *)(a1 + 20)));
            float32x2_t v68 = vmul_f32(*v62, v71);
            float32x2_t v69 = vmul_f32(vsub_f32(v62[1], *v62), v71);
          }
          uint64_t v72 = (uint64_t)&a5[23 * v61 + 56];
          *(float32x2_t *)(v72 + 8) = v68;
          *(float32x2_t *)(v72 + 16) = v69;
          uint64_t v73 = v58 + v45;
          int v74 = bmClamp((int)(float)((float)((float)((float)(*(float *)(v58 + v45 + 24) - *(float *)(v42 + 4 * v60))/ (float)(1.0 - *(float *)(v42 + 4 * v60)))* 1000.0)+ 0.5), 1u, 1000);
          LODWORD(v54) = a5[55];
          uint64_t v75 = (uint64_t)&a5[23 * v54 + 56];
          *(_DWORD *)(v75 + 24) = v74;
          *(unsigned char *)(v75 + 80) = 1;
          *(int32x2_t *)(v75 + 28) = vrev64_s32(vcvt_s32_f32(*(float32x2_t *)(v73 + 28)));
          *(unsigned char *)(v75 + 84) = *(_DWORD *)(v59 + 16) == 1;
          uint64_t v56 = (_DWORD *)(v75 + 88);
          float v57 = a5 + 55;
        }
        _DWORD *v56 = 0;
        *float v57 = v54 + 1;
        v45 += 36;
        ++v47;
      }
      while (v46 != v45);
    }
  }
  return 0;
}

uint64_t AcDetNode::getClsBufferInds(AcDetNode *this, unsigned int a2, unsigned int *a3, unsigned int *a4, unsigned int *a5)
{
  uint64_t result = acDetBboxCoderGetClsBufferInds(*((unsigned int *)this + 393), a2, a3, a4, a5);
  if (*a3 == -1)
  {
    if (*a4 == -1) {
      AcDetNode::postProcessDet();
    }
    if (*a5 == -1) {
      AcDetNode::postProcessDet();
    }
  }
  return result;
}

BOOL acDetBboxCoderRectDefDistCostCompare(float *a1, float *a2)
{
  return a1[8] > a2[8];
}

BOOL acDetRectSortIndexCompare(_DWORD *a1, _DWORD *a2)
{
  return a1[5] < a2[5];
}

uint64_t AcDetNode::getParams(uint64_t a1, _DWORD *a2, uint64_t a3, unsigned int a4)
{
  if (*a2 != 1) {
    return 4294967289;
  }
  if (a2[1] != 56945) {
    return 4294967292;
  }
  uint64_t v7 = a4;
  uint64_t v8 = a3 + 24 * a4;
  long long v9 = *(_OWORD *)(a1 + 20);
  *(void *)(v8 + 16) = *(void *)(a1 + 36);
  *(_OWORD *)uint64_t v8 = v9;
  if (*(_DWORD *)(a1 + 104))
  {
    unint64_t v10 = 0;
    do
    {
      unsigned int v41 = -1;
      unsigned int v42 = -1;
      unsigned int v40 = -1;
      acDetBboxCoderGetClsBufferInds(*(unsigned int *)(a1 + 1572), v10, &v42, &v41, &v40);
      unsigned int v12 = v42;
      if (v42 == -1)
      {
        unsigned int v17 = v41;
        if (v41 == -1) {
          AcDetNode::postProcessDet();
        }
        unsigned int v12 = v40;
        if (v40 == -1) {
          AcDetNode::postProcessDet();
        }
        long long v18 = (_DWORD *)(a1 + 4 * v10);
        uint64_t v19 = a3 + 576 * v7 + 24 * v41;
        *(_DWORD *)(v19 + 76) = v18[27];
        *(_DWORD *)(v19 + 72) = v18[33];
        if (a2[1] != 56945) {
          AcDetNode::getParams();
        }
        uint64_t v20 = a3 + 576 * v7 + 72;
        uint64_t v21 = v20 + 24 * v17;
        *(_DWORD *)(v21 + 8) = v18[303] * v18[57];
        *(_DWORD *)(v21 + 12) = 0;
        long long v22 = (_DWORD *)(v20 + 24 * v12);
        v22[1] = v18[27];
        _DWORD *v22 = v18[33];
        int v15 = v18[57];
        int v16 = *(_DWORD *)(a1 + 1576);
      }
      else
      {
        uint64_t v13 = (_DWORD *)(a1 + 4 * v10);
        uint64_t v14 = a3 + 576 * v7 + 24 * v42;
        *(_DWORD *)(v14 + 76) = v13[27];
        *(_DWORD *)(v14 + 72) = v13[33];
        if (a2[1] != 56945) {
          AcDetNode::getParams();
        }
        int v15 = v13[57];
        int v16 = *(_DWORD *)(a1 + 44);
      }
      *(void *)(a3 + 576 * v7 + 24 * v12 + 80) = (v16 * v15);
      ++v10;
      unint64_t v11 = *(unsigned int *)(a1 + 104);
    }
    while (v10 < v11);
    if (v11)
    {
      if (a2[1] != 56945) {
        AcDetNode::getParams(a1, a3, v7);
      }
      for (uint64_t i = 0; i != v11; ++i)
      {
        float v25 = (_DWORD *)(a1 + 4 * i);
        uint64_t v26 = a3 + 576 * v7 + 24 * (i + 6);
        *(_DWORD *)(v26 + 76) = v25[27];
        *(_DWORD *)(v26 + 72) = v25[33];
        *(void *)(v26 + 80) = (4 * v25[57]);
      }
      if (a2[1] != 56945) {
        AcDetNode::getParams(a1, a3, v7);
      }
      uint64_t v27 = 0;
      int v28 = *(_DWORD *)(a1 + 1484);
      do
      {
        double v29 = (_DWORD *)(a1 + 4 * v27);
        uint64_t v30 = a3 + 576 * v7 + 24 * (v27 + 12);
        *(_DWORD *)(v30 + 76) = v29[27];
        *(_DWORD *)(v30 + 72) = v29[33];
        *(void *)(v30 + 80) = (v28 * v29[57]);
        ++v27;
      }
      while (v11 != v27);
      if (a2[1] != 56945) {
        AcDetNode::getParams(a1, a3, v7);
      }
      uint64_t v31 = 0;
      int v32 = *(_DWORD *)(a1 + 1536);
      do
      {
        uint64_t v33 = (_DWORD *)(a1 + 4 * v31);
        uint64_t v34 = a3 + 576 * v7 + 24 * (v31 + 18);
        *(_DWORD *)(v34 + 76) = v33[27];
        *(_DWORD *)(v34 + 72) = v33[33];
        *(void *)(v34 + 80) = (v32 * v33[57]);
        ++v31;
      }
      while (v11 != v31);
    }
  }
  uint64_t v35 = 0;
  uint64_t v36 = (int *)(a1 + 1580);
  unint64_t v37 = (_DWORD *)(a3 + 576 * v7 + 92);
  uint64_t v38 = a3 + 768 * v7 + 1800;
  do
  {
    int v39 = *v36++;
    *(v37 - 1) = v39;
    *unint64_t v37 = 0;
    v37 += 6;
    strncpy((char *)(v38 + v35), (const char *)(a1 + v35 + 1676), 0x20uLL);
    v35 += 32;
  }
  while (v35 != 768);
  return 0;
}

uint64_t AcDetNode::classBufChCount(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 4) != 56945) {
    AcDetNode::getParams();
  }
  return (*(_DWORD *)(a1 + 44) * *(_DWORD *)(a1 + 4 * a2 + 228));
}

uint64_t AcDetNode::classPosBufChCount(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 4) != 56945) {
    AcDetNode::getParams();
  }
  return (*(_DWORD *)(a1 + 4 * a2 + 1212) * *(_DWORD *)(a1 + 4 * a2 + 228));
}

uint64_t AcDetNode::classNegBufChCount(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 4) != 56945) {
    AcDetNode::classNegBufChCount();
  }
  return (*(_DWORD *)(a1 + 1576) * *(_DWORD *)(a1 + 4 * a2 + 228));
}

uint64_t AcDetNode::bboxBufChCount(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 4) != 56945) {
    AcDetNode::bboxBufChCount();
  }
  return (4 * *(_DWORD *)(a1 + 4 * a2 + 228));
}

uint64_t AcDetNode::rollBufChCount(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 4) != 56945) {
    AcDetNode::rollBufChCount();
  }
  return (*(_DWORD *)(a1 + 1484) * *(_DWORD *)(a1 + 4 * a2 + 228));
}

uint64_t AcDetNode::yawBufChCount(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 4) != 56945) {
    AcDetNode::yawBufChCount();
  }
  return (*(_DWORD *)(a1 + 1536) * *(_DWORD *)(a1 + 4 * a2 + 228));
}

void AcDetNode::useLowThresholds(AcDetNode *this, char a2)
{
  *((unsigned char *)this + 3412) = a2;
  if (a2)
  {
    *((float *)this + 617) = logf(*((float *)this + 355) / (float)(1.0 - *((float *)this + 355)));
    *((float *)this + 618) = logf(*((float *)this + 356) / (float)(1.0 - *((float *)this + 356)));
    *((float *)this + 619) = logf(*((float *)this + 357) / (float)(1.0 - *((float *)this + 357)));
    *((float *)this + 620) = logf(*((float *)this + 358) / (float)(1.0 - *((float *)this + 358)));
    *((float *)this + 621) = logf(*((float *)this + 359) / (float)(1.0 - *((float *)this + 359)));
    *((float *)this + 622) = logf(*((float *)this + 360) / (float)(1.0 - *((float *)this + 360)));
    *((float *)this + 623) = logf(*((float *)this + 361) / (float)(1.0 - *((float *)this + 361)));
    *((float *)this + 624) = logf(*((float *)this + 362) / (float)(1.0 - *((float *)this + 362)));
    *((float *)this + 625) = logf(*((float *)this + 363) / (float)(1.0 - *((float *)this + 363)));
    uint64_t v3 = (float *)((char *)this + 1456);
  }
  else
  {
    *((float *)this + 617) = logf(*((float *)this + 345) / (float)(1.0 - *((float *)this + 345)));
    *((float *)this + 618) = logf(*((float *)this + 346) / (float)(1.0 - *((float *)this + 346)));
    *((float *)this + 619) = logf(*((float *)this + 347) / (float)(1.0 - *((float *)this + 347)));
    *((float *)this + 620) = logf(*((float *)this + 348) / (float)(1.0 - *((float *)this + 348)));
    *((float *)this + 621) = logf(*((float *)this + 349) / (float)(1.0 - *((float *)this + 349)));
    *((float *)this + 622) = logf(*((float *)this + 350) / (float)(1.0 - *((float *)this + 350)));
    *((float *)this + 623) = logf(*((float *)this + 351) / (float)(1.0 - *((float *)this + 351)));
    *((float *)this + 624) = logf(*((float *)this + 352) / (float)(1.0 - *((float *)this + 352)));
    *((float *)this + 625) = logf(*((float *)this + 353) / (float)(1.0 - *((float *)this + 353)));
    uint64_t v3 = (float *)((char *)this + 1416);
  }
  *((float *)this + 626) = logf(*v3 / (float)(1.0 - *v3));
}

uint64_t ttMemBlockCoalesce(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2 >= 2)
  {
    uint64_t v4 = a2;
    bmHeapsort(a1, a2, 0xCuLL, (int (*)(uint64_t, uint64_t))ttMemBlockCompareAddress);
    uint64_t v5 = 0;
    char v6 = 0;
    uint64_t v7 = (_DWORD *)(a1 + 20);
    uint64_t v8 = 1;
    do
    {
      long long v9 = (void *)(a1 + 12 * v5);
      uint64_t v12 = *v9;
      unint64_t v10 = v9 + 1;
      uint64_t v11 = v12;
      uint64_t v13 = v7;
      unint64_t v14 = v8;
      do
      {
        uint64_t v15 = *v10;
        if (v11 + v15 == *((void *)v13 - 1))
        {
          *unint64_t v10 = *v13 + v15;
          *uint64_t v13 = 0;
          char v6 = 1;
        }
        ++v14;
        v13 += 3;
      }
      while (v14 < v2);
      ++v8;
      ++v5;
      v7 += 3;
    }
    while (v5 != v2 - 1);
    if (v6)
    {
      uint64_t v2 = 0;
      int v16 = (_DWORD *)(a1 + 8);
      do
      {
        if (*v16)
        {
          uint64_t v17 = a1 + 12 * v2;
          uint64_t v18 = *((void *)v16 - 1);
          uint64_t v2 = (v2 + 1);
          *(_DWORD *)(v17 + 8) = *v16;
          *(void *)uint64_t v17 = v18;
        }
        v16 += 3;
        --v4;
      }
      while (v4);
    }
  }
  return v2;
}

BOOL ttMemBlockCompareAddress(void *a1, void *a2)
{
  return *a1 > *a2;
}

uint64_t ttMemBlockCoalesceNoSort(uint64_t a1, uint64_t a2)
{
  if (a2 >= 2)
  {
    uint64_t v2 = 0;
    char v3 = 0;
    uint64_t v4 = (_DWORD *)(a1 + 20);
    uint64_t v5 = 1;
    uint64_t v6 = a2;
    do
    {
      uint64_t v7 = (void *)(a1 + 12 * v2);
      uint64_t v10 = *v7;
      uint64_t v8 = v7 + 1;
      uint64_t v9 = v10;
      uint64_t v11 = v4;
      unint64_t v12 = v5;
      do
      {
        uint64_t v13 = *v8;
        if (v9 + v13 == *((void *)v11 - 1))
        {
          *uint64_t v8 = *v11 + v13;
          *uint64_t v11 = 0;
          char v3 = 1;
        }
        ++v12;
        v11 += 3;
      }
      while (v12 < a2);
      ++v5;
      ++v2;
      v4 += 3;
    }
    while (v2 != a2 - 1);
    if (v3)
    {
      a2 = 0;
      unint64_t v14 = (_DWORD *)(a1 + 8);
      do
      {
        if (*v14)
        {
          uint64_t v15 = a1 + 12 * a2;
          uint64_t v16 = *((void *)v14 - 1);
          a2 = (a2 + 1);
          *(_DWORD *)(v15 + 8) = *v14;
          *(void *)uint64_t v15 = v16;
        }
        v14 += 3;
        --v6;
      }
      while (v6);
    }
  }
  return a2;
}

uint64_t acAttrReduceSmile(uint64_t a1, unsigned int a2)
{
  if (a2 >= 0x65) {
    acAttrReduceSmile();
  }
  if (!*(_DWORD *)(a1 + 12) || (unsigned int v2 = *(_DWORD *)(a1 + 8)) == 0) {
    AcAttrNode::postProcess();
  }
  if (v2 <= 1) {
    AcAttrNode::postProcess();
  }
  float v3 = (float)a2 / 100.0;
  float v4 = bmSoftmax2(**(float **)a1, *(float *)(*(void *)a1 + *(unsigned int *)(a1 + 16)));
  if (v4 < v3) {
    return 0xFFFFFFFFLL;
  }

  return bmClamp((int)(float)((float)((float)((float)(v4 - v3) / (float)(1.0 - v3)) * 100.0) + 0.5), 1u, 100);
}

uint64_t acAttrReduceBlink(float **a1, unsigned int a2, unsigned int a3, BOOL *a4, __n128 a5)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*((_DWORD *)a1 + 2) <= 2u) {
    acAttrReduceBlink();
  }
  if (a2 >= 0x65) {
    acAttrReduceBlink();
  }
  if (a3 >= 0x65) {
    acAttrReduceBlink();
  }
  if (!*((_DWORD *)a1 + 3)) {
    AcAttrNode::postProcess();
  }
  uint64_t v7 = *a1;
  uint64_t v8 = *((unsigned int *)a1 + 4);
  v16[0] = **a1;
  float v9 = (float)a3 / 100.0;
  v16[1] = *(float *)((char *)v7 + v8);
  unsigned __int32 v17 = *(_DWORD *)((char *)v7 + (2 * v8));
  a5.n128_u32[0] = v17;
  bmSoftmax((float32x4_t *)v16, &v13, 3u, a5);
  BOOL v10 = v15 <= v9;
  *a4 = v15 > v9;
  if (!v10) {
    return 0;
  }
  float v12 = (float)a2 / 100.0;
  if (v14 >= v12) {
    return bmClamp((int)(float)((float)((float)((float)(v14 - v12) / (float)(1.0 - v12)) * 100.0) + 0.5), 1u, 100);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t acAttrReduceYaw(uint64_t a1, float *a2, unsigned int a3, __n128 a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3 >= 0xB) {
    acAttrReduceYaw();
  }
  if (a3)
  {
    if (!*(_DWORD *)(a1 + 12)) {
LABEL_14:
    }
      AcAttrNode::postProcess();
    uint64_t v5 = 0;
    uint64_t v6 = a3;
    uint64_t v7 = *(unsigned int *)(a1 + 8);
    do
    {
      if (v7 == v5) {
        goto LABEL_14;
      }
      a4.n128_u32[0] = *(_DWORD *)(*(void *)a1 + (*(_DWORD *)(a1 + 16) * v5));
      v15[0].i32[v5++] = a4.n128_u32[0];
    }
    while (a3 != v5);
    uint64_t v8 = v15;
    bmSoftmax(v15, v15[0].f32, a3, a4);
    float v9 = 0.0;
    do
    {
      float v10 = v8->f32[0];
      uint64_t v8 = (float32x4_t *)((char *)v8 + 4);
      float v11 = v10;
      float v12 = *a2++;
      float v9 = v9 + (float)(v11 * v12);
      --v6;
    }
    while (v6);
  }
  else
  {
    bmSoftmax(v15, v15[0].f32, 0, a4);
    float v9 = 0.0;
  }
  float v13 = -0.5;
  if (v9 > 0.0) {
    float v13 = 0.5;
  }
  return (int)(float)(v9 + v13);
}

uint64_t acAttrReduceRoll(uint64_t a1, float *a2, float *a3, unsigned int a4, __n128 a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a4 >= 0xB) {
    acAttrReduceRoll();
  }
  if (a4)
  {
    if (!*(_DWORD *)(a1 + 12)) {
LABEL_14:
    }
      AcAttrNode::postProcess();
    uint64_t v7 = 0;
    uint64_t v8 = a4;
    uint64_t v9 = *(unsigned int *)(a1 + 8);
    do
    {
      if (v9 == v7) {
        goto LABEL_14;
      }
      a5.n128_u32[0] = *(_DWORD *)(*(void *)a1 + (*(_DWORD *)(a1 + 16) * v7));
      v20[0].i32[v7++] = a5.n128_u32[0];
    }
    while (a4 != v7);
    float v10 = v20;
    bmSoftmax(v20, v20[0].f32, a4, a5);
    float v11 = 0.0;
    float v12 = 0.0;
    do
    {
      float v13 = v10->f32[0];
      float v10 = (float32x4_t *)((char *)v10 + 4);
      float v14 = v13;
      float v15 = *a2++;
      float v12 = v12 + (float)(v14 * v15);
      float v16 = *a3++;
      float v11 = v11 + (float)(v14 * v16);
      --v8;
    }
    while (v8);
  }
  else
  {
    bmSoftmax(v20, v20[0].f32, 0, a5);
    float v12 = 0.0;
    float v11 = 0.0;
  }
  float v17 = (float)(atan2f(v12, v11) / 3.1416) * 180.0;
  float v18 = -0.5;
  if (v17 > 0.0) {
    float v18 = 0.5;
  }
  return (int)(float)(v17 + v18);
}

double acDetRectNull@<D0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

float acDetRectWidth(float *a1)
{
  return bmMaximum(0.0, a1[2] - *a1);
}

float acDetRectHeight(uint64_t a1)
{
  return bmMaximum(0.0, *(float *)(a1 + 12) - *(float *)(a1 + 4));
}

float acDetRectCenterX(float *a1)
{
  return (float)(*a1 + a1[2]) * 0.5;
}

float acDetRectCenterY(uint64_t a1)
{
  return (float)(*(float *)(a1 + 4) + *(float *)(a1 + 12)) * 0.5;
}

float acDetRectArea(float *a1)
{
  float v2 = bmMaximum(0.0, a1[2] - *a1);
  return v2 * bmMaximum(0.0, a1[3] - a1[1]);
}

void acDetRectIntersect(float *a1@<X0>, float *a2@<X1>, float *a3@<X8>)
{
  *a3 = bmMaximum(*a1, *a2);
  a3[1] = bmMaximum(a1[1], a2[1]);
  a3[2] = bmMinimum(a1[2], a2[2]);
  a3[3] = bmMinimum(a1[3], a2[3]);
  a3[6] = bmMaximum(a1[6], a2[6]);
}

void acDetRectOverlap(float *a1, float *a2)
{
  bmMaximum(0.0, a1[2] - *a1);
  bmMaximum(0.0, a1[3] - a1[1]);
  bmMaximum(0.0, a2[2] - *a2);
  bmMaximum(0.0, a2[3] - a2[1]);
  float v4 = bmMaximum(*a1, *a2);
  float v5 = bmMaximum(a1[1], a2[1]);
  float v6 = bmMinimum(a1[2], a2[2]);
  float v7 = bmMinimum(a1[3], a2[3]);
  bmMaximum(a1[6], a2[6]);
  bmMaximum(0.0, v6 - v4);
  bmMaximum(0.0, v7 - v5);
}

void acDetRectOverlapSmallbox(float *a1, float *a2)
{
  float v4 = bmMaximum(0.0, a1[2] - *a1);
  float v5 = v4 * bmMaximum(0.0, a1[3] - a1[1]);
  float v6 = bmMaximum(0.0, a2[2] - *a2);
  float v7 = v6 * bmMaximum(0.0, a2[3] - a2[1]);
  float v8 = bmMaximum(*a1, *a2);
  float v9 = bmMaximum(a1[1], a2[1]);
  float v10 = bmMinimum(a1[2], a2[2]);
  float v11 = bmMinimum(a1[3], a2[3]);
  bmMaximum(a1[6], a2[6]);
  bmMaximum(0.0, v10 - v8);
  bmMaximum(0.0, v11 - v9);
  bmMinimum(v5, v7);
}

BOOL acDetRectScoreCompare(float *a1, float *a2)
{
  return a1[6] < a2[6];
}

BOOL acDetRectClassCompare(_DWORD *a1, _DWORD *a2)
{
  return a1[4] < a2[4];
}

uint64_t acDetRectFilterByScore(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = 0;
  if (a2)
  {
    uint64_t v4 = a1 + 24;
    uint64_t v5 = a2;
    do
    {
      if (*(float *)v4 > *(float *)(a3 + 4 * *(unsigned int *)(v4 - 8)))
      {
        uint64_t v6 = a1 + 36 * v3;
        uint64_t v3 = (v3 + 1);
        long long v7 = *(_OWORD *)(v4 - 24);
        long long v8 = *(_OWORD *)(v4 - 8);
        *(_DWORD *)(v6 + 32) = *(_DWORD *)(v4 + 8);
        *(_OWORD *)uint64_t v6 = v7;
        *(_OWORD *)(v6 + 16) = v8;
      }
      v4 += 36;
      --v5;
    }
    while (v5);
  }
  return v3;
}

unint64_t acDetRectSmallRectSuppression(uint64_t a1, unint64_t a2, float a3, float a4)
{
  unint64_t v4 = a2;
  if (a2)
  {
    unint64_t v8 = 0;
    float v9 = (long long *)(a1 + 36);
    unint64_t v10 = 1;
    do
    {
      int v11 = v4;
      unint64_t v31 = v10;
      int v32 = v9;
      unint64_t v30 = v8 + 1;
      if (v8 + 1 >= v4)
      {
        unint64_t v4 = v8 + 1;
      }
      else
      {
        uint64_t v12 = a1 + 36 * v8;
        float v13 = (_DWORD *)(v12 + 16);
        uint64_t v36 = (float *)(v12 + 4);
        unint64_t v37 = (float *)(v12 + 24);
        uint64_t v33 = (float *)v12;
        uint64_t v34 = (float *)(v12 + 12);
        uint64_t v35 = (float *)(v12 + 8);
        unint64_t v4 = v8 + 1;
        do
        {
          if (*v37 < *((float *)v9 + 6)) {
            acDetRectSmallRectSuppression();
          }
          if (*v13 != *((_DWORD *)v9 + 4)) {
            goto LABEL_15;
          }
          float v14 = bmMaximum(*v33, *(float *)v9);
          float v15 = bmMaximum(*v36, *((float *)v9 + 1));
          float v16 = bmMinimum(*v35, *((float *)v9 + 2));
          float v17 = bmMinimum(*v34, *((float *)v9 + 3));
          bmMaximum(*v37, *((float *)v9 + 6));
          float v18 = bmMaximum(0.0, v16 - v14);
          float v19 = v18 * bmMaximum(0.0, v17 - v15);
          float v20 = bmMaximum(0.0, *((float *)v9 + 2) - *(float *)v9);
          float v21 = v20 * bmMaximum(0.0, *((float *)v9 + 3) - *((float *)v9 + 1));
          float v22 = bmMaximum(0.0, *v35 - *v33);
          float v23 = (float)(v22 * bmMaximum(0.0, *v34 - *v36)) * a4;
          if ((float)(v19 / v21) <= a3 || v21 > v23)
          {
LABEL_15:
            unsigned int v25 = v4;
            if (v10 < v4) {
              acDetRectSmallRectSuppression();
            }
            unint64_t v4 = (v4 + 1);
            uint64_t v26 = a1 + 36 * v25;
            long long v27 = *v9;
            long long v28 = v9[1];
            *(_DWORD *)(v26 + 32) = *((_DWORD *)v9 + 8);
            *(_OWORD *)uint64_t v26 = v27;
            *(_OWORD *)(v26 + 16) = v28;
          }
          ++v10;
          float v9 = (long long *)((char *)v9 + 36);
        }
        while (v11 != v10);
      }
      unint64_t v10 = v31 + 1;
      float v9 = (long long *)((char *)v32 + 36);
      unint64_t v8 = v30;
    }
    while (v30 < v4);
  }
  return v4;
}

unint64_t acDetRectLowMergeCountSuppression(uint64_t a1, unint64_t a2, unsigned int a3, unsigned int a4, float a5)
{
  unint64_t v5 = a2;
  if (a2)
  {
    unint64_t v7 = 0;
    unint64_t v8 = (long long *)(a1 + 36);
    unint64_t v9 = 1;
    uint64_t v41 = a1;
    do
    {
      uint64_t v10 = a1 + 36 * v7;
      int v11 = (unsigned int *)(v10 + 20);
      unint64_t v12 = v7 + 1;
      unint64_t v39 = v9;
      unsigned int v40 = v8;
      unint64_t v38 = v7 + 1;
      if (*(_DWORD *)(v10 + 20) > a4)
      {
        int v13 = v5;
        if (v12 >= v5)
        {
          unint64_t v5 = v7 + 1;
        }
        else
        {
          uint64_t v14 = a1 + 36 * v7;
          float v15 = (_DWORD *)(v14 + 16);
          uint64_t v46 = (float *)(v14 + 12);
          int v47 = (float *)(v14 + 8);
          unsigned int v44 = (float *)v10;
          uint64_t v45 = (float *)(v14 + 4);
          uint64_t v43 = (float *)(v14 + 24);
          unint64_t v5 = v12;
          do
          {
            if (*v15 != *((_DWORD *)v8 + 4)) {
              goto LABEL_19;
            }
            float v16 = bmMaximum(0.0, *v47 - *v44);
            float v17 = v16 * bmMaximum(0.0, *v46 - *v45);
            float v18 = bmMaximum(0.0, *((float *)v8 + 2) - *(float *)v8);
            float v19 = v18 * bmMaximum(0.0, *((float *)v8 + 3) - *((float *)v8 + 1));
            float v20 = bmMaximum(*v44, *(float *)v8);
            float v21 = bmMaximum(*v45, *((float *)v8 + 1));
            float v22 = bmMinimum(*v47, *((float *)v8 + 2));
            float v23 = bmMinimum(*v46, *((float *)v8 + 3));
            bmMaximum(*v43, *((float *)v8 + 6));
            float v24 = bmMaximum(0.0, v22 - v20);
            float v25 = bmMaximum(0.0, v23 - v21);
            a1 = v41;
            float v26 = v24 * v25;
            float v27 = (float)(v17 + v19) - v26;
            float v28 = v26 / v27;
            if (v27 < 0.00000011921) {
              float v28 = 0.0;
            }
            unsigned int v29 = *((_DWORD *)v8 + 5);
            BOOL v30 = v28 > a5 && *v11 >= v29;
            if (!v30 || *v11 - v29 <= a3)
            {
LABEL_19:
              unsigned int v32 = v5;
              if (v9 < v5) {
                acDetRectLowMergeCountSuppression();
              }
              unint64_t v5 = (v5 + 1);
              uint64_t v33 = a1 + 36 * v32;
              long long v34 = *v8;
              long long v35 = v8[1];
              *(_DWORD *)(v33 + 32) = *((_DWORD *)v8 + 8);
              *(_OWORD *)uint64_t v33 = v34;
              *(_OWORD *)(v33 + 16) = v35;
            }
            ++v9;
            unint64_t v8 = (long long *)((char *)v8 + 36);
          }
          while (v13 != v9);
        }
      }
      unint64_t v9 = v39 + 1;
      unint64_t v8 = (long long *)((char *)v40 + 36);
      unint64_t v7 = v38;
    }
    while (v38 < v5);
  }
  return v5;
}

unint64_t acDetRectWeightedMerge(uint64_t a1, unint64_t a2, float a3, float a4)
{
  if (!a1) {
    acDetRectWeightedMerge();
  }
  unint64_t v4 = a2;
  if (a2)
  {
    unint64_t v6 = 0;
    unint64_t v7 = (long long *)(a1 + 36);
    unint64_t v8 = 1;
    do
    {
      unint64_t v9 = v6 + 1;
      unint64_t v48 = v6;
      uint64_t v10 = (float *)(a1 + 36 * v6);
      float v11 = v10[6];
      unint64_t v12 = v10 + 1;
      float v13 = v10[1];
      float v57 = v11 * *v10;
      float v58 = v11 * v13;
      uint64_t v14 = v10 + 3;
      float v15 = bmMaximum(0.0, v10[3] - v13);
      float v16 = v10 + 2;
      float v17 = bmMaximum(0.0, v10[2] - *v10);
      unint64_t v18 = v9;
      float v55 = v15 * v10[6];
      float v56 = v10[6];
      float v54 = v17 * v56;
      int v19 = v4;
      unint64_t v49 = v8;
      unsigned int v50 = v7;
      unint64_t v47 = v18;
      if (v18 >= v4)
      {
        int v53 = 1;
        unint64_t v4 = v18;
      }
      else
      {
        float v62 = (float)(*v12 + *v14) * 0.5;
        float v63 = (float)(*v10 + *v16) * 0.5;
        float v51 = v17;
        float v52 = v15;
        float v61 = fminf(v17, v15);
        int v53 = 1;
        unint64_t v4 = v18;
        do
        {
          while (1)
          {
            float v65 = bmMaximum(0.0, *((float *)v7 + 3) - *((float *)v7 + 1));
            float v64 = bmMaximum(0.0, *((float *)v7 + 2) - *(float *)v7);
            float v21 = (float)(*(float *)v7 + *((float *)v7 + 2)) * 0.5;
            float v22 = (float)(*((float *)v7 + 1) + *((float *)v7 + 3)) * 0.5;
            float v23 = bmMaximum(0.0, *v16 - *v10);
            float v24 = v23 * bmMaximum(0.0, *v14 - *v12);
            float v25 = bmMaximum(0.0, *((float *)v7 + 2) - *(float *)v7);
            float v26 = v25 * bmMaximum(0.0, *((float *)v7 + 3) - *((float *)v7 + 1));
            float v27 = bmMaximum(*v10, *(float *)v7);
            float v28 = bmMaximum(*v12, *((float *)v7 + 1));
            float v29 = bmMinimum(*v16, *((float *)v7 + 2));
            float v30 = bmMinimum(*v14, *((float *)v7 + 3));
            bmMaximum(v10[6], *((float *)v7 + 6));
            float v31 = bmMaximum(0.0, v29 - v27);
            float v32 = v31 * bmMaximum(0.0, v30 - v28);
            float v33 = (float)(v24 + v26) - v32;
            float v34 = v32 / v33;
            if (v33 < 0.00000011921) {
              float v34 = 0.0;
            }
            float v35 = (float)((float)(sqrtf((float)((float)(v62 - v22) * (float)(v62 - v22))+ (float)((float)(v63 - v21) * (float)(v63 - v21)))* a4)/ v61)+ (float)(1.0 - sqrtf(v34));
            if (v35 >= a3) {
              break;
            }
            float v36 = *((float *)v7 + 1);
            float v37 = 1.0 - v35;
            float v38 = fmaxf(fminf(*((float *)v7 + 3), *v14) - fmaxf(v36, *v12), 0.0);
            float v39 = v51 * v37;
            float v40 = v52 * v37;
            if (fmaxf(fminf(*((float *)v7 + 2), *v16) - fmaxf(*(float *)v7, *v10), 0.0) < v39 || v38 < v40) {
              break;
            }
            float v20 = *((float *)v7 + 6);
            float v57 = v57 + (float)(v20 * *(float *)v7);
            float v58 = v58 + (float)(v20 * v36);
            float v54 = v54 + (float)(v20 * v64);
            float v55 = v55 + (float)(v20 * v65);
            float v56 = v56 + v20;
            ++v53;
            ++v8;
            unint64_t v7 = (long long *)((char *)v7 + 36);
            if (v19 == v8) {
              goto LABEL_5;
            }
          }
          unsigned int v42 = v4;
          if (v8 < v4) {
            acDetRectWeightedMerge();
          }
          unint64_t v4 = (v4 + 1);
          uint64_t v43 = a1 + 36 * v42;
          long long v44 = *v7;
          long long v45 = v7[1];
          *(_DWORD *)(v43 + 32) = *((_DWORD *)v7 + 8);
          *(_OWORD *)uint64_t v43 = v44;
          *(_OWORD *)(v43 + 16) = v45;
          ++v8;
          unint64_t v7 = (long long *)((char *)v7 + 36);
        }
        while (v19 != v8);
      }
LABEL_5:
      *uint64_t v10 = v57 / v56;
      *unint64_t v12 = v58 / v56;
      *float v16 = (float)(v54 / v56) + (float)(v57 / v56);
      float *v14 = (float)(v55 / v56) + (float)(v58 / v56);
      *(_DWORD *)(a1 + 36 * v48 + 20) = v53;
      unint64_t v8 = v49 + 1;
      unint64_t v7 = (long long *)((char *)v50 + 36);
      unint64_t v6 = v47;
    }
    while (v47 < v4);
  }
  return v4;
}

int32x2_t acDetRectFromFace@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  float32x2_t v2 = *(float32x2_t *)(a1 + 8);
  float32x2_t v3 = vadd_f32(v2, *(float32x2_t *)(a1 + 16));
  *(float32x2_t *)a2 = v2;
  *(float32x2_t *)(a2 + 8) = v3;
  int v4 = *(_DWORD *)(a1 + 4);
  if (v4 >= 7) {
    acDetRectFromFace();
  }
  *(_DWORD *)(a2 + 16) = v4 + 1;
  *(float *)(a2 + 24) = (float)*(unsigned int *)(a1 + 24) / 1000.0;
  int32x2_t result = vrev64_s32((int32x2_t)vcvt_f32_s32(*(int32x2_t *)(a1 + 28)));
  *(int32x2_t *)(a2 + 28) = result;
  return result;
}

char *TtTrkRpnNode::TtTrkRpnNode(char *a1, void *a2)
{
  int v4 = a1 + 536;
  bzero(a1, 0x218uLL);
  *a2 = 0x721CC00000001;
  _OWORD *v4 = 0u;
  return a1;
}

{
  _OWORD *v4;

  int v4 = a1 + 536;
  bzero(a1, 0x218uLL);
  *a2 = 0x721CC00000001;
  _OWORD *v4 = 0u;
  return a1;
}

void TtTrkRpnNode::~TtTrkRpnNode(TtTrkRpnNode *this)
{
}

{
  TtTrkRpnNode::releaseBuffers(this);
}

uint64_t TtTrkRpnNode::releaseBuffers(TtTrkRpnNode *this)
{
  uint64_t v2 = *((void *)this + 55);
  if (v2) {
    MEMORY[0x21D449400](v2, 0x1000C80451B5BE8);
  }
  uint64_t v3 = *((void *)this + 56);
  if (v3) {
    MEMORY[0x21D449400](v3, 0x1000C80451B5BE8);
  }
  uint64_t v4 = *((void *)this + 57);
  if (v4) {
    MEMORY[0x21D449400](v4, 0x1000C8052888210);
  }
  uint64_t v5 = *((void *)this + 58);
  if (v5) {
    MEMORY[0x21D449400](v5, 0x1000C8052888210);
  }
  uint64_t v6 = *((void *)this + 59);
  if (v6) {
    MEMORY[0x21D449400](v6, 0x1000C8052888210);
  }
  uint64_t v7 = *((void *)this + 60);
  if (v7) {
    MEMORY[0x21D449400](v7, 0x1000C8052888210);
  }
  uint64_t v8 = *((void *)this + 67);
  if (v8) {
    MEMORY[0x21D449400](v8, 0x1000C8052888210);
  }
  uint64_t result = *((void *)this + 68);
  if (result)
  {
    JUMPOUT(0x21D449400);
  }
  return result;
}

uint64_t TtTrkRpnNode::init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)a3 != 1) {
    return 4294967289;
  }
  if ((*(_DWORD *)(a3 + 4) - 467393) <= 0xB && ((1 << (*(unsigned char *)(a3 + 4) + 63)) & 0xB01) != 0)
  {
    uint64_t v6 = (ft::UserDefaults *)TtTrkRpnNode::releaseBuffers((TtTrkRpnNode *)a1);
    *(void *)(a1 + 20) = 0x800000013;
    *(void *)(a1 + 28) = 0x4100000000000001;
    *(_DWORD *)(a1 + 52) = 5;
    *(_OWORD *)(a1 + 56) = xmmword_217666340;
    *(_OWORD *)(a1 + 132) = xmmword_217666350;
    *(void *)(a1 + 260) = 0x1400000013;
    *(_DWORD *)(a1 + 268) = 10;
    *(_OWORD *)(a1 + 148) = xmmword_217666360;
    *(_OWORD *)(a1 + 164) = xmmword_217666370;
    *(_DWORD *)(a1 + 336) = 6;
    *(_OWORD *)(a1 + 244) = xmmword_217666380;
    *(_OWORD *)(a1 + 72) = xmmword_217666390;
    *(_OWORD *)(a1 + 116) = xmmword_2176663A0;
    *(_OWORD *)(a1 + 88) = xmmword_2176663B0;
    *(void *)(a1 + 104) = 0x3E4CCCCD3BB60B61;
    *(_DWORD *)(a1 + 112) = 1069547520;
    uint64_t v7 = (ft *)ft::UserDefaults::Get(v6);
    switch(*((_DWORD *)v7 + 1))
    {
      case 1:
        *(_DWORD *)(a1 + 92) = 1050924810;
        OsLog = ft::GetOsLog(v7);
        if (!os_log_type_enabled(OsLog, OS_LOG_TYPE_INFO)) {
          goto LABEL_16;
        }
        goto LABEL_15;
      case 2:
        *(_DWORD *)(a1 + 92) = 1053609165;
        OsLog = ft::GetOsLog(v7);
        if (!os_log_type_enabled(OsLog, OS_LOG_TYPE_INFO)) {
          goto LABEL_16;
        }
        goto LABEL_15;
      case 4:
        *(_DWORD *)(a1 + 92) = 1056964608;
        goto LABEL_14;
      case 5:
        *(void *)(a1 + 92) = 0x3F4CCCCD3F0F5C29;
        *(_DWORD *)(a1 + 100) = 1058642330;
        OsLog = ft::GetOsLog(v7);
        if (!os_log_type_enabled(OsLog, OS_LOG_TYPE_INFO)) {
          goto LABEL_16;
        }
        goto LABEL_15;
      default:
LABEL_14:
        OsLog = ft::GetOsLog(v7);
        if (os_log_type_enabled(OsLog, OS_LOG_TYPE_INFO))
        {
LABEL_15:
          double v10 = *(float *)(a1 + 92);
          int v11 = 134217984;
          double v12 = v10;
          _os_log_impl(&dword_21762A000, OsLog, OS_LOG_TYPE_INFO, "RPN score cutoff set to %0.4f", (uint8_t *)&v11, 0xCu);
        }
LABEL_16:
        *(_DWORD *)(a3 + 4) = 467393;
        *(_WORD *)(a3 + 1856) = 0;
        *(_DWORD *)(a3 + 1820) = 1065353216;
        *(_OWORD *)(a3 + 1836) = 0u;
        *(_WORD *)(a3 + 1861) = 0;
        *(_DWORD *)(a3 + 1852) = 0;
        *(_OWORD *)(a3 + 1572) = 0u;
        *(_OWORD *)(a3 + 1588) = 0u;
        *(_OWORD *)(a3 + 1604) = 0u;
        *(_OWORD *)(a3 + 1620) = 0u;
        *(_OWORD *)(a3 + 1636) = 0u;
        *(_OWORD *)(a3 + 1652) = 0u;
        *(_OWORD *)(a3 + 1668) = 0u;
        *(_OWORD *)(a3 + 1684) = 0u;
        *(_OWORD *)(a3 + 1700) = 0u;
        *(_OWORD *)(a3 + 1716) = 0u;
        *(_OWORD *)(a3 + 1732) = 0u;
        *(_OWORD *)(a3 + 1748) = 0u;
        *(_OWORD *)(a3 + 1764) = 0u;
        *(_OWORD *)(a3 + 1780) = 0u;
        *(_OWORD *)(a3 + 1796) = 0u;
        *(_DWORD *)(a1 + 436) = *(_DWORD *)(a1 + 20)
                              * *(_DWORD *)(a1 + 20)
                              * *(_DWORD *)(a1 + 28)
                              * *(_DWORD *)(a1 + 52);
        operator new[]();
    }
  }
  return 4294967292;
}

double TtTrkRpnNode::killTrackedObject(uint64_t a1, uint64_t a2)
{
  *(_WORD *)(a2 + 1856) = 0;
  *(_DWORD *)(a2 + 1820) = 1065353216;
  double result = 0.0;
  *(_OWORD *)(a2 + 1836) = 0u;
  *(_WORD *)(a2 + 1861) = 0;
  *(_DWORD *)(a2 + 1852) = 0;
  *(_OWORD *)(a2 + 1572) = 0u;
  *(_OWORD *)(a2 + 1588) = 0u;
  *(_OWORD *)(a2 + 1604) = 0u;
  *(_OWORD *)(a2 + 1620) = 0u;
  *(_OWORD *)(a2 + 1636) = 0u;
  *(_OWORD *)(a2 + 1652) = 0u;
  *(_OWORD *)(a2 + 1668) = 0u;
  *(_OWORD *)(a2 + 1684) = 0u;
  *(_OWORD *)(a2 + 1700) = 0u;
  *(_OWORD *)(a2 + 1716) = 0u;
  *(_OWORD *)(a2 + 1732) = 0u;
  *(_OWORD *)(a2 + 1748) = 0u;
  *(_OWORD *)(a2 + 1764) = 0u;
  *(_OWORD *)(a2 + 1780) = 0u;
  *(_OWORD *)(a2 + 1796) = 0u;
  return result;
}

uint64_t TtTrkRpnNode::PopulateAnchorBoxes(uint64_t this, double a2, double a3, double a4, double a5, double a6, double a7, float32x2_t a8)
{
  uint64_t v10 = *(unsigned int *)(this + 52);
  if (!v10) {
    return this;
  }
  unsigned int v11 = *(_DWORD *)(this + 20);
  uint64_t v12 = *(unsigned int *)(this + 28);
  if (!v12 || v11 == 0) {
    return this;
  }
  unsigned int v14 = *(_DWORD *)(this + 24);
  unsigned int v15 = v11 >> 1;
  *(float *)&a2 = (float)(v14 * v14);
  uint64_t v16 = *(void *)(this + 440);
  if (v11 >= 8)
  {
    uint64_t v39 = 0;
    unsigned int v40 = 0;
    int32x4_t v41 = vdupq_n_s32(v15);
    int32x4_t v42 = vdupq_n_s32(v14);
    unsigned int v43 = v11 & 0xFFFFFFF8;
    v44.i64[0] = 0x400000004;
    v44.i64[1] = 0x400000004;
    v45.i64[0] = 0x800000008;
    v45.i64[1] = 0x800000008;
    while (1)
    {
      uint64_t v46 = 0;
      a8.i32[0] = *(_DWORD *)(this + 4 * v39 + 56);
      a8 = vcvt_f32_s32(vcvt_s32_f32(vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vdiv_f32(*(float32x2_t *)&a2, a8), (int32x2_t)vmul_f32(*(float32x2_t *)&a2, a8)))));
      do
      {
        int v47 = 0;
        int32x2_t v48 = (int32x2_t)vcvt_f32_s32(vcvt_s32_f32(vmul_n_f32(a8, *(float *)(this + 4 * v46 + 32))));
        int32x4_t v49 = vdupq_lane_s32(v48, 0);
        int32x4_t v50 = vdupq_lane_s32(v48, 1);
        do
        {
          *(float *)v9.i32 = (float)(int)((v47 - v15) * v14);
          if (__CFADD__(v40, v11 - 1))
          {
            unsigned int v51 = 0;
            unsigned int v52 = v40;
LABEL_33:
            unsigned int v60 = v11 - v51;
            int v61 = v14 * (v51 - v15);
            unsigned int v40 = v52;
            do
            {
              uint64_t v62 = v16 + 16 * v40;
              *(float *)uint64_t v62 = (float)v61;
              *(_DWORD *)(v62 + 4) = v9.i32[0];
              *(int32x2_t *)(v62 + 8) = v48;
              ++v40;
              v61 += v14;
              --v60;
            }
            while (v60);
            goto LABEL_27;
          }
          unsigned int v52 = v40 + v43;
          int32x4_t v53 = vdupq_lane_s32(v9, 0);
          unsigned int v54 = v11 & 0xFFFFFFF8;
          int32x4_t v55 = (int32x4_t)xmmword_2176663C0;
          do
          {
            int32x4_t v56 = vsubq_s32(v55, v41);
            float32x4_t v57 = vcvtq_f32_s32(vmulq_s32(v56, v42));
            v63.val[0] = vcvtq_f32_s32(vmulq_s32(vaddq_s32(v56, v44), v42));
            v63.val[1] = (float32x4_t)v53;
            v63.val[2] = (float32x4_t)v49;
            v63.val[3] = (float32x4_t)v50;
            float v58 = (float *)(v16 + 16 * v40);
            uint64_t v59 = (float *)(v16 + 16 * (v40 + 4));
            vst4q_f32(v58, *(float32x4x4_t *)(&v49 - 2));
            vst4q_f32(v59, v63);
            int32x4_t v55 = vaddq_s32(v55, v45);
            v40 += 8;
            v54 -= 8;
          }
          while (v54);
          unsigned int v51 = v11 & 0xFFFFFFF8;
          unsigned int v40 = v52;
          if (v11 != v43) {
            goto LABEL_33;
          }
LABEL_27:
          ++v47;
        }
        while (v47 != v11);
        ++v46;
      }
      while (v46 != v12);
      if (++v39 == v10) {
        return this;
      }
    }
  }
  uint64_t v17 = 0;
  unsigned int v18 = 0;
  float v19 = (float)(int)(v14 - v15 * v14);
  float v20 = (float)(int)((2 - v15) * v14);
  float v21 = (float)(int)((3 - v15) * v14);
  float v22 = (float)(int)((4 - v15) * v14);
  float v23 = (float)(int)((5 - v15) * v14);
  float v24 = (float)(int)((6 - v15) * v14);
  int v25 = -(v15 * v14);
  do
  {
    uint64_t v26 = 0;
    v8.i32[0] = *(_DWORD *)(this + 4 * v17 + 56);
    float32x2_t v8 = vcvt_f32_s32(vcvt_s32_f32(vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vdiv_f32(*(float32x2_t *)&a2, v8), (int32x2_t)vmul_f32(*(float32x2_t *)&a2, v8)))));
    do
    {
      float32x2_t v27 = vcvt_f32_s32(vcvt_s32_f32(vmul_n_f32(v8, *(float *)(this + 4 * v26 + 32))));
      int v28 = v25;
      unsigned int v29 = v11;
      do
      {
        unsigned int v30 = v18;
        float v31 = (float)v28;
        float v32 = (float32x2_t *)(v16 + 16 * v18);
        v32->f32[0] = (float)v25;
        v32->f32[1] = (float)v28;
        v32[1] = v27;
        unsigned int v18 = v30 + 1;
        if (v11 != 1)
        {
          float v33 = (float32x2_t *)(v16 + 16 * v18);
          v33->f32[0] = v19;
          v33->f32[1] = v31;
          v33[1] = v27;
          unsigned int v18 = v30 + 2;
          if (v11 != 2)
          {
            float v34 = (float32x2_t *)(v16 + 16 * v18);
            v34->f32[0] = v20;
            v34->f32[1] = v31;
            v34[1] = v27;
            unsigned int v18 = v30 + 3;
            if (v11 != 3)
            {
              float v35 = (float32x2_t *)(v16 + 16 * v18);
              v35->f32[0] = v21;
              v35->f32[1] = v31;
              v35[1] = v27;
              unsigned int v18 = v30 + 4;
              if (v11 != 4)
              {
                float v36 = (float32x2_t *)(v16 + 16 * v18);
                v36->f32[0] = v22;
                v36->f32[1] = v31;
                v36[1] = v27;
                unsigned int v18 = v30 + 5;
                if (v11 != 5)
                {
                  float v37 = (float32x2_t *)(v16 + 16 * v18);
                  v37->f32[0] = v23;
                  v37->f32[1] = v31;
                  v37[1] = v27;
                  unsigned int v18 = v30 + 6;
                  if (v11 != 6)
                  {
                    float v38 = (float32x2_t *)(v16 + 16 * v18);
                    v38->f32[0] = v24;
                    v38->f32[1] = v31;
                    v38[1] = v27;
                    unsigned int v18 = v30 + 7;
                  }
                }
              }
            }
          }
        }
        v28 += v14;
        --v29;
      }
      while (v29);
      ++v26;
    }
    while (v26 != v12);
    ++v17;
  }
  while (v17 != v10);
  return this;
}

void TtTrkRpnNode::PopulatePenaltyMatrix(TtTrkRpnNode *this)
{
}

uint64_t TtTrkRpnNode::restart(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a2 != 1) {
    return 4294967289;
  }
  int v2 = *(_DWORD *)(a2 + 4);
  if (v2 != 467402 && v2 != 467393) {
    return 4294967289;
  }
  uint64_t result = 0;
  *(_DWORD *)(a2 + 1820) = 1065353216;
  *(_OWORD *)(a2 + 1836) = 0u;
  *(_WORD *)(a2 + 1861) = 0;
  *(_WORD *)(a2 + 1856) = 0;
  *(_DWORD *)(a2 + 1852) = 0;
  *(_OWORD *)(a2 + 1572) = 0u;
  *(_OWORD *)(a2 + 1588) = 0u;
  *(_OWORD *)(a2 + 1604) = 0u;
  *(_OWORD *)(a2 + 1620) = 0u;
  *(_OWORD *)(a2 + 1636) = 0u;
  *(_OWORD *)(a2 + 1652) = 0u;
  *(_OWORD *)(a2 + 1668) = 0u;
  *(_OWORD *)(a2 + 1684) = 0u;
  *(_OWORD *)(a2 + 1700) = 0u;
  *(_OWORD *)(a2 + 1716) = 0u;
  *(_OWORD *)(a2 + 1732) = 0u;
  *(_OWORD *)(a2 + 1748) = 0u;
  *(_OWORD *)(a2 + 1764) = 0u;
  *(_OWORD *)(a2 + 1780) = 0u;
  *(_OWORD *)(a2 + 1796) = 0u;
  return result;
}

uint64_t TtTrkRpnNode::exemplarPreProcess(uint64_t a1, uint64_t a2, long long *a3, int *a4, uint64_t a5, uint64_t a6)
{
  std::chrono::steady_clock::now();
  if (*(_DWORD *)a5 != 1 || *(_DWORD *)(a5 + 4) != 467393) {
    return 4294967289;
  }
  int v11 = *a4;
  if (*a4)
  {
    long long v12 = *a3;
    *(_OWORD *)(a5 + 24) = a3[1];
    *(_OWORD *)(a5 + 8) = v12;
    long long v13 = a3[2];
    long long v14 = a3[3];
    long long v15 = a3[4];
    *(void *)(a5 + 88) = *((void *)a3 + 10);
    *(_OWORD *)(a5 + 72) = v15;
    *(_OWORD *)(a5 + 56) = v14;
    *(_OWORD *)(a5 + 40) = v13;
    LOBYTE(v11) = 1;
    *(unsigned char *)(a6 + 81) = 1;
    *(void *)&long long v15 = *(void *)(a5 + 24);
    float v16 = vaddv_f32(*(float32x2_t *)&v15);
    *(float *)&long long v13 = roundf(sqrtf((float)(*(float *)&v15 + (float)(*(float *)(a1 + 88) * v16))* (float)(*((float *)&v15 + 1) + (float)(*(float *)(a1 + 88) * v16))));
    *(float32x2_t *)(a5 + 96) = vmla_n_f32(vmla_f32(*(float32x2_t *)(a5 + 16), (float32x2_t)0x3F0000003F000000, *(float32x2_t *)&v15), (float32x2_t)0xBF000000BF000000, *(float *)&v13);
    *(_DWORD *)(a5 + 104) = v13;
    *(_DWORD *)(a5 + 108) = v13;
  }
  uint64_t result = 0;
  *(unsigned char *)(a5 + 1856) = v11;
  *(_DWORD *)(a5 + 4) = 467402;
  return result;
}

uint64_t TtTrkRpnNode::instancePreProcess(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, float32x2_t *a5, uint64_t a6)
{
  std::chrono::steady_clock::now();
  if (a5->i32[0] != 1 || a5->i32[1] != 467393) {
    return 4294967289;
  }
  char v9 = a5[232].i8[0];
  if (v9)
  {
    char v9 = 1;
    *(unsigned char *)(a6 + 80) = 1;
    unsigned int v10 = *(_DWORD *)(a1 + 144);
    float32x2_t v11 = a5[3];
    float v12 = vaddv_f32(v11);
    float v13 = a5[227].f32[1]
        * sqrtf((float)(v11.f32[0] + (float)(*(float *)(a1 + 88) * v12))* (float)(v11.f32[1] + (float)(*(float *)(a1 + 88) * v12)));
    float v14 = (float)v10 / v13;
    float v15 = v13 + (float)((float)((float)((float)(*(_DWORD *)(a1 + 132) - v10) * 0.5) / v14) * 2.0);
    a5[14] = vmla_n_f32(vmla_f32(a5[2], (float32x2_t)0x3F0000003F000000, v11), (float32x2_t)0xBF000000BF000000, v15);
    a5[15].f32[0] = v15;
    a5[15].f32[1] = v15;
    a5[228].f32[0] = v14;
    a5[3] = vmul_n_f32(v11, v14);
  }
  uint64_t result = 0;
  a5[232].i8[1] = v9;
  a5->i32[1] = 467401;
  return result;
}

uint64_t TtTrkRpnNode::exemplarPostProcess(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, _DWORD *a5)
{
  std::chrono::steady_clock::now();
  if (*a5 != 1 || a5[1] != 467402) {
    return 4294967289;
  }
  if (a3 > 2) {
    return 4294967292;
  }
  uint64_t result = 0;
  a5[1] = 467393;
  return result;
}

uint64_t TtTrkRpnNode::instancePostProcess(uint64_t a1, uint64_t a2, int a3, unsigned int *a4, uint64_t a5, uint64_t a6, _DWORD *a7)
{
  std::chrono::steady_clock::now();
  if (*(_DWORD *)a5 != 1 || *(_DWORD *)(a5 + 4) != 467401) {
    return 4294967289;
  }
  if (a3 != 2) {
    return 4294967292;
  }
  if (*(unsigned char *)(a5 + 1857))
  {
    int v14 = *(_DWORD *)(a2 + 20);
    if ((v14 & 0xFFFFFFFE) != 6) {
      goto LABEL_150;
    }
    uint64_t v15 = a2;
    if (v14 == 7)
    {
      uint64_t v15 = a1 + 488;
      bmBufferDequantizeHalf((uint64_t *)a2, (uint64_t *)(a1 + 488));
    }
    int v16 = *(_DWORD *)(a2 + 44);
    if ((v16 & 0xFFFFFFFE) != 6) {
LABEL_150:
    }
      TtTrkRpnNode::instancePostProcess();
    v179 = a4;
    uint64_t v17 = *(void *)v15;
    unsigned int v19 = *(_DWORD *)(v15 + 8);
    int v18 = *(_DWORD *)(v15 + 12);
    float v20 = (uint64_t *)(a2 + 24);
    int v182 = *(_DWORD *)(v15 + 16);
    if (v16 == 7)
    {
      bmBufferDequantizeHalf(v20, (uint64_t *)(a1 + 512));
      int v21 = *(_DWORD *)(a1 + 528);
      int v22 = *(_DWORD *)(a1 + 524);
      unsigned int v23 = *(_DWORD *)(a1 + 520);
      uint64_t v24 = *(void *)(a1 + 512);
      unsigned int v25 = *(_DWORD *)(a1 + 436);
      if (!v25)
      {
LABEL_97:
        if (v25)
        {
          if (v22)
          {
            unsigned int v102 = 0;
            while (1)
            {
              unsigned int v103 = *(_DWORD *)(a1 + 20);
              unsigned int v104 = v102 / v103 + *(_DWORD *)(a1 + 52) * v103 * *(_DWORD *)(a1 + 28);
              if (v23 <= v102 / v103 || v23 <= v104) {
                break;
              }
              unsigned int v176 = v23;
              unint64_t v106 = 0;
              v107 = (float *)(v24 + v21 * (v102 / v103));
              uint64_t v174 = v24;
              v108 = (float *)(v24 + v21 * v104);
              do
              {
                float v109 = *v107++;
                float v110 = v109;
                float v111 = *v108++;
                *(float *)(*(void *)(a1 + 456) + 4 * (v102 + v106++)) = bmSoftmax2(v110, v111);
                unint64_t v112 = *(unsigned int *)(a1 + 20);
              }
              while (v106 < v112);
              unsigned int v25 = *(_DWORD *)(a1 + 436);
              unsigned int v23 = v176;
              uint64_t v24 = v174;
              v102 += v112;
              if (v102 >= v25) {
                goto LABEL_108;
              }
            }
          }
          AcAttrNode::postProcess();
        }
LABEL_108:
        v178 = a7;
        uint64_t v113 = *(void *)(a1 + 448);
        if (v25)
        {
          uint64_t v160 = a6;
          uint64_t v114 = 0;
          unsigned int v115 = 0;
          uint64_t v117 = *(void *)(a1 + 456);
          uint64_t v116 = *(void *)(a1 + 464);
          uint64_t v118 = v25;
          uint64_t v119 = *(void *)(a1 + 472);
          uint64_t v120 = *(void *)(a1 + 480);
          uint64_t v201 = *(void *)(a1 + 448);
          v121 = (float *)(v113 + 12);
          float v122 = -3.4028e38;
          do
          {
            float v123 = *(v121 - 1);
            float v124 = *(float *)(a5 + 24);
            float v125 = *(float *)(a5 + 28);
            float v126 = sqrtf((float)(v123 + (float)((float)(v123 + *v121) * 0.5))* (float)(*v121 + (float)((float)(v123 + *v121) * 0.5)))/ sqrtf((float)(v124 + (float)((float)(v124 + v125) * 0.5))* (float)(v125 + (float)((float)(v124 + v125) * 0.5)));
            float v127 = expf(-(float)((float)((float)(fmaxf((float)(v124 / v125) / (float)(v123 / *v121), 1.0 / (float)((float)(v124 / v125) / (float)(v123 / *v121)))* fmaxf(v126, 1.0 / v126))+ -1.0)* *(float *)(a1 + 76)));
            uint64_t v128 = 4 * v114;
            *(float *)(v119 + v128) = v127;
            float v129 = *(float *)(v117 + 4 * v114) * v127;
            *(float *)(v116 + v128) = v129;
            float v130 = (float)(*(float *)(a1 + 80) * *(float *)(v120 + 4 * v114))
                 + (float)(v129 * (float)(1.0 - *(float *)(a1 + 80)));
            *(float *)(v116 + v128) = v130;
            if (v130 > v122)
            {
              unsigned int v115 = v114;
              float v122 = v130;
            }
            ++v114;
            v121 += 4;
          }
          while (v118 != v114);
          a6 = v160;
          uint64_t v113 = v201;
        }
        else
        {
          unsigned int v115 = 0;
          uint64_t v119 = *(void *)(a1 + 472);
          uint64_t v117 = *(void *)(a1 + 456);
        }
        uint64_t v131 = 4 * v115;
        float v132 = *(float *)(a5 + 1824);
        float v133 = *(float *)(a5 + 24) / v132;
        float v134 = *(float *)(a5 + 28) / v132;
        v135 = (float *)(v113 + 16 * v115);
        float v136 = (float)(*(float *)(v119 + v131) * *(float *)(v117 + v131)) * *(float *)(a1 + 84);
        float v137 = (float)(*(float *)(a5 + 20) + (float)(v134 * 0.5)) + (float)(v135[1] / v132);
        float v138 = (float)((float)(v135[2] / v132) * v136) + (float)(v133 * (float)(1.0 - v136));
        float v139 = (float)((float)(v135[3] / v132) * v136) + (float)(v134 * (float)(1.0 - v136));
        float v140 = bmClamp((float)(*(float *)(a5 + 16) + (float)(v133 * 0.5)) + (float)(*v135 / v132), 0.0, (float)*v179);
        float v141 = bmClamp(v137, 0.0, (float)v179[1]);
        float v142 = bmClamp(v138, 10.0, (float)*v179);
        float v143 = bmClamp(v139, 10.0, (float)v179[1]);
        *(float *)(a5 + 16) = v140 - (float)(v142 * 0.5);
        *(float *)(a5 + 20) = v141 - (float)(v143 * 0.5);
        *(float *)(a5 + 24) = v142;
        *(float *)(a5 + 28) = v143;
        long long v208 = *(_OWORD *)(a6 + 8);
        *(_OWORD *)(a6 + 8) = *(_OWORD *)(a5 + 16);
        _DWORD *v178 = 1;
        uint64_t v144 = *(void *)(a1 + 456);
        float v145 = *(float *)(v144 + v131);
        *(_DWORD *)(a6 + 24) = (float)(v145 * 1000.0);
        int v146 = *(_DWORD *)(a1 + 20);
        v205 = (const void *)(v144 + 4 * v115 / (v146 * v146) * v146 * v146);
        LODWORD(v207) = 4 * v146;
        HIDWORD(v207) = 6;
        LODWORD(v206) = v146;
        HIDWORD(v206) = v146;
        ttTrkScoreNormalize((uint64_t *)&v205);
        uint64_t v204 = 0;
        int v203 = 0;
        ttTrkScoreFindMaxScore((uint64_t *)&v205, (float *)&v204 + 1, &v204, (unsigned int *)&v203);
        if (!*(unsigned char *)(a5 + 1861))
        {
          *(unsigned char *)(a5 + 1861) = 1;
          memcpy((void *)(a5 + 128), v205, (v206 * v207));
          *(_DWORD *)(a5 + 1828) = v204;
          *(_DWORD *)(a5 + 1832) = v203;
        }
        v202[1] = v206;
        v202[2] = v207;
        v202[0] = a5 + 128;
        float v147 = -1.0;
        if (*(float *)(a1 + 96) < 1.0 && *(float *)(a1 + 100) > 0.0) {
          float v147 = ttTrkComputeKL(v202, (uint64_t *)&v205, *(_DWORD *)(a5 + 1828), *(_DWORD *)(a5 + 1832), v204, v203);
        }
        if (*(unsigned char *)(a5 + 1862))
        {
          long long v148 = v208;
          *(_OWORD *)(a5 + 16) = v208;
          *(_OWORD *)(a6 + 8) = v148;
          unsigned int v149 = *(_DWORD *)(a5 + 1852);
          if (v149 >= *(_DWORD *)(a1 + 128))
          {
            *(_WORD *)(a5 + 1856) = 0;
            *(_DWORD *)(a5 + 1820) = 1065353216;
            *(_OWORD *)(a5 + 1836) = 0u;
            *(_WORD *)(a5 + 1861) = 0;
            *(_DWORD *)(a5 + 1852) = 0;
            *(_OWORD *)(a5 + 1572) = 0u;
            *(_OWORD *)(a5 + 1588) = 0u;
            *(_OWORD *)(a5 + 1604) = 0u;
            *(_OWORD *)(a5 + 1620) = 0u;
            *(_OWORD *)(a5 + 1636) = 0u;
            *(_OWORD *)(a5 + 1652) = 0u;
            *(_OWORD *)(a5 + 1668) = 0u;
            *(_OWORD *)(a5 + 1684) = 0u;
            *(_OWORD *)(a5 + 1700) = 0u;
            *(_OWORD *)(a5 + 1716) = 0u;
            *(_OWORD *)(a5 + 1732) = 0u;
            *(_OWORD *)(a5 + 1748) = 0u;
            *(_OWORD *)(a5 + 1764) = 0u;
            *(_OWORD *)(a5 + 1780) = 0u;
            *(_OWORD *)(a5 + 1796) = 0u;
            _DWORD *v178 = 0;
            goto LABEL_147;
          }
          unsigned int v150 = v149 + 1;
          *(_DWORD *)(a5 + 1852) = v150;
          if (*(float *)(a5 + 1812) < v145) {
            unsigned int v151 = *(_DWORD *)(a5 + 1848) + 1;
          }
          else {
            unsigned int v151 = 0;
          }
          *(_DWORD *)(a5 + 1848) = v151;
          if (v151 >= *(_DWORD *)(a1 + 116))
          {
            *(unsigned char *)(a5 + 1862) = 0;
            *(_DWORD *)(a5 + 1852) = 0;
            *(_DWORD *)(a5 + 1820) = 1065353216;
            *(void *)(a5 + 1840) = 0;
            *(_DWORD *)(a5 + 1836) = 0;
            *(_OWORD *)(a5 + 1572) = 0u;
            *(_OWORD *)(a5 + 1588) = 0u;
            *(_OWORD *)(a5 + 1604) = 0u;
            *(_OWORD *)(a5 + 1620) = 0u;
            *(_OWORD *)(a5 + 1636) = 0u;
            *(_OWORD *)(a5 + 1652) = 0u;
            *(_OWORD *)(a5 + 1668) = 0u;
            *(_OWORD *)(a5 + 1684) = 0u;
            *(_OWORD *)(a5 + 1700) = 0u;
            *(_OWORD *)(a5 + 1716) = 0u;
            *(_OWORD *)(a5 + 1732) = 0u;
            *(_OWORD *)(a5 + 1748) = 0u;
            *(_OWORD *)(a5 + 1764) = 0u;
            *(_OWORD *)(a5 + 1780) = 0u;
            *(_OWORD *)(a5 + 1796) = 0u;
          }
          else
          {
            *(float *)(a5 + 1820) = (float)(*(float *)(a1 + 104) * (float)v150) + 1.0;
          }
        }
        else
        {
          if (*(float *)(a1 + 92) > v145) {
            unsigned int v152 = *(_DWORD *)(a5 + 1840) + 1;
          }
          else {
            unsigned int v152 = 0;
          }
          *(_DWORD *)(a5 + 1840) = v152;
          if (*(float *)(a1 + 96) >= v147 || *(float *)(a1 + 100) <= v145)
          {
            unsigned int v153 = 0;
            *(_DWORD *)(a5 + 1844) = 0;
          }
          else
          {
            unsigned int v153 = *(_DWORD *)(a5 + 1844) + 1;
            *(_DWORD *)(a5 + 1844) = v153;
          }
          unsigned int v154 = *(_DWORD *)(a1 + 120);
          if (v152 >= v154 || v153 >= v154)
          {
            *(unsigned char *)(a5 + 1862) = 1;
            TtTrkRpnNode::terminate(a1, a5, v147);
          }
          else
          {
            uint64_t v155 = *(unsigned int *)(a5 + 1836);
            uint64_t v156 = a5 + 4 * v155;
            *(float *)(v156 + 1572) = v145;
            *(float *)(v156 + 1692) = v147;
            if ((v155 + 1) < *(_DWORD *)(a1 + 124)) {
              int v157 = v155 + 1;
            }
            else {
              int v157 = 0;
            }
            *(_DWORD *)(a5 + 1836) = v157;
          }
        }
        if (*(unsigned char *)(a5 + 1862))
        {
          int v158 = 2;
LABEL_148:
          *(_DWORD *)(a6 + 84) = v158;
          goto LABEL_149;
        }
LABEL_147:
        int v158 = 1;
        goto LABEL_148;
      }
    }
    else
    {
      int v21 = *(_DWORD *)(a2 + 40);
      int v22 = *(_DWORD *)(a2 + 36);
      unsigned int v23 = *(_DWORD *)(a2 + 32);
      uint64_t v24 = *v20;
      unsigned int v25 = *(_DWORD *)(a1 + 436);
      if (!v25) {
        goto LABEL_97;
      }
    }
    if (v18)
    {
      uint64_t v27 = *(unsigned int *)(a1 + 20);
      int v28 = *(_DWORD *)(a1 + 52) * v27 * *(_DWORD *)(a1 + 28);
      if (v27)
      {
        unsigned int v29 = 0;
        int v165 = v27 - 1;
        uint64_t v30 = 16 * (v27 - 1);
        uint64_t v163 = v27 & 0xFFFFFFFC;
        uint64_t v164 = 4 * *(unsigned int *)(a1 + 20);
        uint64_t v162 = v163;
        while (1)
        {
          unsigned int v31 = v28 + v29 / v27;
          unsigned int v32 = v28 + v31;
          unsigned int v33 = v28 + v28 + v31;
          if (v19 <= v29 / v27 || v19 <= v31 || v19 <= v32 || v19 <= v33) {
            goto LABEL_114;
          }
          uint64_t v37 = v182 * (v29 / v27);
          uint64_t v38 = v182 * v31;
          uint64_t v39 = v182 * v32;
          unsigned int v40 = (float *)(v17 + v39);
          uint64_t v41 = v182 * v33;
          int32x4_t v42 = (float *)(v17 + v41);
          uint64_t v43 = *(void *)(a1 + 440);
          uint64_t v44 = *(void *)(a1 + 448);
          uint64_t v199 = v44;
          uint64_t v200 = v43;
          uint64_t v172 = a1;
          uint64_t v173 = v24;
          v177 = a7;
          unsigned int v175 = v23;
          unsigned int v170 = v19;
          unsigned int v171 = v25;
          uint64_t v169 = v17;
          int v167 = v28;
          int v168 = v22;
          unsigned int v180 = v29;
          uint64_t v181 = v27;
          uint64_t v166 = v30;
          if (v27 < 0xC) {
            break;
          }
          v186 = (float *)(v17 + v37);
          uint64_t v45 = 0;
          BOOL v60 = __CFADD__(v29, v165);
          uint64_t v61 = 16 * v29;
          unint64_t v62 = v44 + v61;
          if (v44 + v61 + v30 < (unint64_t)(v44 + v61))
          {
            uint64_t v46 = (float *)(v17 + v37);
            goto LABEL_31;
          }
          v185 = (float *)(v17 + v38);
          if (v62 + 4 + v30 < v62 + 4 || v62 + 12 + v30 < v62 + 12 || v62 + 8 + v30 < v62 + 8 || v60)
          {
            int v47 = (float *)(v17 + v38);
            uint64_t v46 = (float *)(v17 + v37);
          }
          else
          {
            uint64_t v45 = 0;
            uint64_t v63 = 16 * (v27 + v29);
            unint64_t v64 = v44 + v63;
            float v65 = (float *)(v17 + v39);
            unint64_t v66 = v17 + v164 + v39;
            unint64_t v67 = v17 + v164 + v38;
            unint64_t v68 = v17 + v164 + v37;
            unint64_t v69 = v43 + v63;
            v184 = v65;
            BOOL v70 = (unint64_t)v65 >= v64 || v62 >= v66;
            char v71 = !v70;
            BOOL v73 = (unint64_t)v185 < v64 && v62 < v67;
            BOOL v75 = (unint64_t)v186 < v64 && v62 < v68;
            BOOL v70 = v62 >= v69;
            unint64_t v76 = v17 + v164 + v41;
            char v78 = !v70 && v43 + v61 < v64;
            BOOL v79 = v62 >= v76 || (unint64_t)v42 >= v64;
            if (!v79 || (v71 & 1) != 0)
            {
              int v47 = v185;
              uint64_t v46 = v186;
              unsigned int v40 = v65;
            }
            else
            {
              unsigned int v40 = v65;
              unsigned int v80 = v185;
              uint64_t v81 = v186;
              if (v73 || v75 || (v78 & 1) != 0)
              {
                uint64_t v46 = v186;
                int v47 = v185;
              }
              else
              {
                int v161 = v21;
                uint64_t v159 = a6;
                uint64_t v82 = 0;
                uint64_t v83 = v163;
                uint64_t v46 = &v186[v162];
                int v47 = &v185[v162];
                unsigned int v40 = &v184[v162];
                v183 = v42;
                int32x4_t v42 = (float *)((char *)v42 + v162 * 4);
                unsigned int v84 = v29;
                do
                {
                  uint64_t v85 = 16 * v84;
                  int v86 = (const float *)(v43 + v85);
                  float32x4x4_t v210 = vld4q_f32(v86);
                  float32x4_t v194 = vmlaq_f32(v210.val[0], v210.val[2], *(float32x4_t *)&v81[v82]);
                  float32x4_t v195 = vmlaq_f32(v210.val[1], v210.val[3], *(float32x4_t *)&v80[v82]);
                  float32x4_t v196 = v210.val[2];
                  float32x4_t v198 = v210.val[3];
                  long long v192 = *(_OWORD *)&v184[v82];
                  float v187 = expf(COERCE_FLOAT(HIDWORD(*(void *)&v184[v82])));
                  v87.f32[0] = expf(*(float *)&v192);
                  v87.f32[1] = v187;
                  float32x4_t v188 = v87;
                  float v88 = expf(*((float *)&v192 + 2));
                  float32x4_t v89 = v188;
                  v89.f32[2] = v88;
                  float32x4_t v189 = v89;
                  float v90 = expf(*((float *)&v192 + 3));
                  float32x4_t v91 = v189;
                  v91.f32[3] = v90;
                  float32x4_t v197 = vmulq_f32(v196, v91);
                  long long v193 = *(_OWORD *)&v183[v82];
                  uint64_t v43 = v200;
                  v189.i32[0] = expf(COERCE_FLOAT(HIDWORD(*(void *)&v183[v82])));
                  v92.f32[0] = expf(*(float *)&v193);
                  v92.i32[1] = v189.i32[0];
                  float32x4_t v190 = v92;
                  float v93 = expf(*((float *)&v193 + 2));
                  float32x4_t v94 = v190;
                  v94.f32[2] = v93;
                  float32x4_t v191 = v94;
                  float v95 = expf(*((float *)&v193 + 3));
                  unsigned int v80 = v185;
                  uint64_t v81 = v186;
                  uint64_t v44 = v199;
                  float32x4_t v96 = v191;
                  v96.f32[3] = v95;
                  v209.val[0] = v194;
                  v209.val[1] = v195;
                  v209.val[2] = v197;
                  v209.val[3] = vmulq_f32(v198, v96);
                  v97 = (float *)(v199 + v85);
                  vst4q_f32(v97, v209);
                  v82 += 4;
                  v84 += 4;
                  v83 -= 4;
                }
                while (v83);
                uint64_t v45 = v163;
                a6 = v159;
                int v21 = v161;
                if (v163 == v181) {
                  goto LABEL_34;
                }
              }
            }
          }
LABEL_32:
          unsigned int v48 = v180 + v45;
          uint64_t v49 = v181 - v45;
          do
          {
            float v50 = *v46++;
            uint64_t v51 = 16 * v48;
            uint64_t v52 = v43 + v51;
            float v53 = *(float *)(v43 + v51 + 8);
            float v54 = *(float *)(v43 + v51) + (float)(v50 * v53);
            int32x4_t v55 = (float *)(v44 + v51);
            *int32x4_t v55 = v54;
            float v56 = *v47++;
            float v57 = *(float *)(v52 + 12);
            v55[1] = *(float *)(v52 + 4) + (float)(v56 * v57);
            float v58 = *v40++;
            v55[2] = v53 * expf(v58);
            float v59 = *v42++;
            v55[3] = v57 * expf(v59);
            uint64_t v44 = v199;
            uint64_t v43 = v200;
            ++v48;
            --v49;
          }
          while (v49);
LABEL_34:
          uint64_t v27 = v181;
          unsigned int v29 = v180 + v181;
          unsigned int v19 = v170;
          unsigned int v25 = v171;
          a1 = v172;
          uint64_t v24 = v173;
          a7 = v177;
          unsigned int v23 = v175;
          uint64_t v17 = v169;
          int v28 = v167;
          int v22 = v168;
          uint64_t v30 = v166;
          if (v180 + v181 >= v171) {
            goto LABEL_97;
          }
        }
        uint64_t v45 = 0;
        uint64_t v46 = (float *)(v17 + v37);
LABEL_31:
        int v47 = (float *)(v17 + v38);
        goto LABEL_32;
      }
      do
        unsigned int v98 = v28 + 0 / 0u;
      while (v19 > 0 / 0u && v19 > v98 && v19 > v28 + v98 && v19 > v28 + v28 + v98);
    }
LABEL_114:
    AcAttrNode::postProcess();
  }
LABEL_149:
  uint64_t result = 0;
  *(_DWORD *)(a5 + 4) = 467393;
  return result;
}

uint64_t *bmBufferDequantizeHalf(uint64_t *result, uint64_t *a2)
{
  if (*((_DWORD *)result + 5) != 7) {
    bmBufferDequantizeHalf();
  }
  if (*((_DWORD *)a2 + 5) != 6) {
    bmBufferDequantizeHalf();
  }
  int v2 = *((_DWORD *)result + 2);
  if (v2 != *((_DWORD *)a2 + 2)) {
    bmBufferDequantizeHalf();
  }
  uint64_t v3 = *((unsigned int *)result + 3);
  if (v3 != *((_DWORD *)a2 + 3)) {
    bmBufferDequantizeHalf();
  }
  if (v2 && v3)
  {
    int v4 = 0;
    uint64_t v5 = *((unsigned int *)result + 4);
    uint64_t v6 = *((unsigned int *)a2 + 4);
    uint64_t v7 = *result;
    uint64_t result = (uint64_t *)*a2;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        while (1)
        {
          while (1)
          {
            unsigned int v13 = *(__int16 *)(v7 + 2 * i);
            unsigned int v14 = v13 & 0x80000000;
            int v10 = (v13 >> 10) & 0x1F;
            int v15 = *(unsigned __int16 *)(v7 + 2 * i) << 13;
            unsigned int v11 = v15 & 0x7FE000;
            if (!v10) {
              break;
            }
            if (v10 != 31) {
              goto LABEL_12;
            }
            if (v11) {
              int v16 = 2143289344;
            }
            else {
              int v16 = 2139095040;
            }
            *((_DWORD *)result + i++) = v14 | v15 | v16;
            if (v3 == i) {
              goto LABEL_8;
            }
          }
          if (!v11) {
            break;
          }
          unsigned int v9 = __clz(v11);
          int v10 = 9 - v9;
          unsigned int v11 = (v15 << (v9 - 8)) & 0x7FE000;
LABEL_12:
          *((_DWORD *)result + i++) = ((v11 | (v10 << 23)) + 939524096) | v14;
          if (v3 == i) {
            goto LABEL_8;
          }
        }
        if (v14) {
          float v12 = -0.0;
        }
        else {
          float v12 = 0.0;
        }
        *((float *)result + i) = v12;
      }
LABEL_8:
      v7 += v5;
      uint64_t result = (uint64_t *)((char *)result + v6);
      ++v4;
    }
    while (v4 != v2);
  }
  return result;
}

BOOL TtTrkRpnNode::checkToReId(uint64_t a1, uint64_t a2, float a3)
{
  if (*(float *)(a2 + 1812) < a3) {
    unsigned int v3 = *(_DWORD *)(a2 + 1848) + 1;
  }
  else {
    unsigned int v3 = 0;
  }
  *(_DWORD *)(a2 + 1848) = v3;
  return v3 >= *(_DWORD *)(a1 + 116);
}

double TtTrkRpnNode::reId(uint64_t a1, uint64_t a2)
{
  double result = 0.0;
  *(void *)(a2 + 1840) = 0;
  *(_DWORD *)(a2 + 1836) = 0;
  *(_OWORD *)(a2 + 1572) = 0u;
  *(_OWORD *)(a2 + 1588) = 0u;
  *(_OWORD *)(a2 + 1604) = 0u;
  *(_OWORD *)(a2 + 1620) = 0u;
  *(_OWORD *)(a2 + 1636) = 0u;
  *(_OWORD *)(a2 + 1652) = 0u;
  *(_OWORD *)(a2 + 1668) = 0u;
  *(_OWORD *)(a2 + 1684) = 0u;
  *(_OWORD *)(a2 + 1700) = 0u;
  *(_OWORD *)(a2 + 1716) = 0u;
  *(_OWORD *)(a2 + 1732) = 0u;
  *(_OWORD *)(a2 + 1748) = 0u;
  *(_OWORD *)(a2 + 1764) = 0u;
  *(_OWORD *)(a2 + 1780) = 0u;
  *(_OWORD *)(a2 + 1796) = 0u;
  return result;
}

BOOL TtTrkRpnNode::checkToTerminate(uint64_t a1, uint64_t a2, float a3, float a4)
{
  float v4 = *(float *)(a1 + 96);
  if (*(float *)(a1 + 92) > a3) {
    unsigned int v5 = *(_DWORD *)(a2 + 1840) + 1;
  }
  else {
    unsigned int v5 = 0;
  }
  *(_DWORD *)(a2 + 1840) = v5;
  if (v4 >= a4 || *(float *)(a1 + 100) <= a3)
  {
    *(_DWORD *)(a2 + 1844) = 0;
    unsigned int v10 = *(_DWORD *)(a1 + 120);
    return v5 >= v10 || v10 == 0;
  }
  else
  {
    unsigned int v6 = *(_DWORD *)(a2 + 1844) + 1;
    *(_DWORD *)(a2 + 1844) = v6;
    unsigned int v7 = *(_DWORD *)(a1 + 120);
    return v5 >= v7 || v6 >= v7;
  }
}

float TtTrkRpnNode::terminate(uint64_t a1, uint64_t a2, float result)
{
  *(_DWORD *)(a2 + 1848) = 0;
  uint64_t v3 = *(unsigned int *)(a1 + 124);
  if (v3)
  {
    if (v3 >= 8)
    {
      uint64_t v4 = v3 & 0xFFFFFFF8;
      float v6 = 0.0;
      int32x4_t v7 = 0uLL;
      v8.i64[0] = 0x8000000080000000;
      v8.i64[1] = 0x8000000080000000;
      uint64_t v9 = v4;
      unsigned int v10 = (float32x4_t *)(a2 + 1572);
      int32x4_t v11 = 0uLL;
      do
      {
        float32x4_t v12 = *v10;
        float32x4_t v13 = v10[1];
        v10 += 2;
        int32x4_t v14 = vcgtzq_f32(v12);
        int8x16_t v15 = vbslq_s8((int8x16_t)v14, (int8x16_t)v12, v8);
        int32x4_t v16 = vcgtzq_f32(v13);
        int8x16_t v17 = vbslq_s8((int8x16_t)v16, (int8x16_t)v13, v8);
        int32x4_t v7 = vsubq_s32(v7, v14);
        int32x4_t v11 = vsubq_s32(v11, v16);
        float v6 = (float)((float)((float)((float)((float)((float)((float)(v6 + *(float *)v15.i32) + *(float *)&v15.i32[1])
                                                   + *(float *)&v15.i32[2])
                                           + *(float *)&v15.i32[3])
                                   + *(float *)v17.i32)
                           + *(float *)&v17.i32[1])
                   + *(float *)&v17.i32[2])
           + *(float *)&v17.i32[3];
        v9 -= 8;
      }
      while (v9);
      unsigned int v5 = vaddvq_s32(vaddq_s32(v11, v7));
      if (v4 == v3) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v4 = 0;
      unsigned int v5 = 0;
      float v6 = 0.0;
    }
    int v18 = (float *)(a2 + 4 * v4 + 1572);
    uint64_t v19 = v3 - v4;
    do
    {
      float v20 = *v18++;
      float v21 = v20;
      BOOL v22 = v20 <= 0.0;
      if (v20 <= 0.0) {
        float v21 = -0.0;
      }
      float v6 = v6 + v21;
      if (!v22) {
        ++v5;
      }
      --v19;
    }
    while (v19);
LABEL_13:
    if (v5) {
      *(float *)(a2 + 1812) = v6 / (float)v5;
    }
    if (v3 >= 8)
    {
      uint64_t v23 = v3 & 0xFFFFFFF8;
      unsigned int v25 = (float32x4_t *)(a2 + 1692);
      double result = 0.0;
      int32x4_t v26 = 0uLL;
      v27.i64[0] = 0x8000000080000000;
      v27.i64[1] = 0x8000000080000000;
      uint64_t v28 = v23;
      int32x4_t v29 = 0uLL;
      do
      {
        float32x4_t v30 = *v25;
        float32x4_t v31 = v25[1];
        v25 += 2;
        int32x4_t v32 = vcgtzq_f32(v30);
        int8x16_t v33 = vbslq_s8((int8x16_t)v32, (int8x16_t)v30, v27);
        int32x4_t v34 = vcgtzq_f32(v31);
        int8x16_t v35 = vbslq_s8((int8x16_t)v34, (int8x16_t)v31, v27);
        int32x4_t v26 = vsubq_s32(v26, v32);
        int32x4_t v29 = vsubq_s32(v29, v34);
        double result = (float)((float)((float)((float)((float)((float)((float)(result + *(float *)v33.i32)
                                                               + *(float *)&v33.i32[1])
                                                       + *(float *)&v33.i32[2])
                                               + *(float *)&v33.i32[3])
                                       + *(float *)v35.i32)
                               + *(float *)&v35.i32[1])
                       + *(float *)&v35.i32[2])
               + *(float *)&v35.i32[3];
        v28 -= 8;
      }
      while (v28);
      unsigned int v24 = vaddvq_s32(vaddq_s32(v29, v26));
      if (v23 == v3)
      {
LABEL_26:
        if (v24)
        {
          double result = result / (float)v24;
          *(float *)(a2 + 1816) = result;
        }
        return result;
      }
    }
    else
    {
      uint64_t v23 = 0;
      unsigned int v24 = 0;
      double result = 0.0;
    }
    float v36 = (float *)(a2 + 4 * v23 + 1692);
    uint64_t v37 = v3 - v23;
    do
    {
      float v38 = *v36++;
      float v39 = v38;
      BOOL v40 = v38 <= 0.0;
      if (v38 <= 0.0) {
        float v39 = -0.0;
      }
      double result = result + v39;
      if (!v40) {
        ++v24;
      }
      --v37;
    }
    while (v37);
    goto LABEL_26;
  }
  return result;
}

uint64_t TtTrkRpnNode::getParams(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  if (*a2 != 1) {
    return 4294967289;
  }
  int v3 = a2[1];
  if (v3 != 467402 && v3 != 467393) {
    return 4294967289;
  }
  unsigned int v5 = (*(_DWORD *)(a1 + 152) * *(_DWORD *)(a1 + 144) + 63) & 0xFFFFFFC0;
  unsigned int v6 = (*(_DWORD *)(a1 + 140) * *(_DWORD *)(a1 + 132) + 63) & 0xFFFFFFC0;
  *(_OWORD *)(a3 + 196) = 0u;
  *(_OWORD *)(a3 + 184) = 0u;
  *(_OWORD *)(a3 + 168) = 0u;
  *(_OWORD *)(a3 + 152) = 0u;
  *(_OWORD *)(a3 + 136) = 0u;
  *(_OWORD *)(a3 + 120) = 0u;
  *(_OWORD *)(a3 + 104) = 0u;
  *(_OWORD *)(a3 + 88) = 0u;
  *(_OWORD *)(a3 + 72) = 0u;
  *(_OWORD *)(a3 + 56) = 0u;
  *(_OWORD *)(a3 + 40) = 0u;
  *(_OWORD *)(a3 + 24) = 0u;
  *(_OWORD *)(a3 + 8) = 0u;
  *(void *)a3 = 0x100000001;
  int v7 = *(_DWORD *)(a1 + 132);
  *(_DWORD *)(a3 + 8) = *(_DWORD *)(a1 + 28);
  *(_DWORD *)(a3 + 12) = v7;
  uint64_t v8 = *(void *)(a1 + 136);
  *(void *)(a3 + 16) = v8;
  int v9 = *(_DWORD *)(a1 + 144);
  *(_DWORD *)(a3 + 24) = v8 * v6;
  *(_DWORD *)(a3 + 28) = v9;
  uint64_t v10 = *(void *)(a1 + 148);
  *(void *)(a3 + 32) = v10;
  *(_DWORD *)(a3 + 40) = v10 * v5;
  unsigned int v11 = *(_DWORD *)(a1 + 336);
  *(_DWORD *)(a3 + 44) = *(_DWORD *)(a1 + 248);
  *(_DWORD *)(a3 + 52) = *(_DWORD *)(a1 + 256);
  *(_DWORD *)(a3 + 60) = *(_DWORD *)(a1 + 264);
  if (v11 >= 8 || ((0xFBu >> v11) & 1) == 0) {
    AcAttrNode::getParams();
  }
  int v12 = dword_2176663D0[v11];
  int v13 = *(_DWORD *)(a1 + 244);
  *(_DWORD *)(a3 + 68) = v12 * *(_DWORD *)(a1 + 248) * *(_DWORD *)(a1 + 256) * *(_DWORD *)(a1 + 264);
  *(_DWORD *)(a3 + 48) = *(_DWORD *)(a1 + 252);
  *(_DWORD *)(a3 + 56) = *(_DWORD *)(a1 + 260);
  *(_DWORD *)(a3 + 64) = *(_DWORD *)(a1 + 268);
  *(_DWORD *)(a3 + 72) = v12 * *(_DWORD *)(a1 + 252) * *(_DWORD *)(a1 + 260) * *(_DWORD *)(a1 + 268);
  *(_DWORD *)(a3 + 76) = v11;
  *(_DWORD *)(a3 + 80) = *(_DWORD *)(a1 + 156);
  *(_DWORD *)(a3 + 88) = *(_DWORD *)(a1 + 164);
  *(_DWORD *)(a3 + 96) = *(_DWORD *)(a1 + 172);
  *(_DWORD *)(a3 + 104) = v12 * *(_DWORD *)(a1 + 156) * *(_DWORD *)(a1 + 164) * *(_DWORD *)(a1 + 172);
  *(_DWORD *)(a3 + 84) = *(_DWORD *)(a1 + 160);
  *(_DWORD *)(a3 + 92) = *(_DWORD *)(a1 + 168);
  *(_DWORD *)(a3 + 100) = *(_DWORD *)(a1 + 176);
  *(_DWORD *)(a3 + 108) = v12 * *(_DWORD *)(a1 + 160) * *(_DWORD *)(a1 + 168) * *(_DWORD *)(a1 + 176);
  *(_DWORD *)(a3 + 112) = v13;
  return 0;
}

uint64_t TtTrkRpnNode::setUpNetBuffers(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  if (!*(void *)a1) {
    return 4294967292;
  }
  uint64_t v3 = *(void *)(a1 + 12);
  v4.i64[0] = v3;
  v4.i64[1] = *(void *)(a1 + 32);
  if (vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqzq_s64(v4), (int32x4_t)vceqzq_s64(*(int64x2_t *)(a1 + 48)))))) {
    return 4294967292;
  }
  if (!*(void *)(a1 + 24)) {
    return 4294967292;
  }
  unsigned int v5 = a2[6];
  if (*(_DWORD *)(a1 + 8) < v5) {
    return 4294967292;
  }
  unsigned int v6 = a2[10];
  if (*(_DWORD *)(a1 + 20) < v6) {
    return 4294967292;
  }
  *(void *)a3 = *(void *)a1;
  int v8 = a2[4];
  int v9 = a2[5] * a2[3];
  *(_DWORD *)(a3 + 8) = v8;
  *(_DWORD *)(a3 + 12) = v9;
  unsigned int v10 = (v9 + 63) & 0xFFFFFFC0;
  *(_DWORD *)(a3 + 16) = v10;
  *(_DWORD *)(a3 + 20) = 1;
  if (v10 * v8 != v5) {
    TtTrkRpnNode::setUpNetBuffers();
  }
  *(void *)(a3 + 24) = v3;
  int v11 = a2[8];
  int v12 = a2[9] * a2[7];
  *(_DWORD *)(a3 + 32) = v11;
  *(_DWORD *)(a3 + 36) = v12;
  unsigned int v13 = (v12 + 63) & 0xFFFFFFC0;
  *(_DWORD *)(a3 + 40) = v13;
  *(_DWORD *)(a3 + 44) = 1;
  if (v13 * v11 != v6) {
    TtTrkRpnNode::setUpNetBuffers();
  }
  signed int v14 = a2[28];
  uint64_t v15 = *(void *)(a1 + 24);
  *(void *)(a3 + 48) = v15;
  int v16 = a2[20];
  *(_DWORD *)(a3 + 60) = v16;
  int v17 = a2[24] * a2[22];
  *(_DWORD *)(a3 + 56) = v17;
  *(_DWORD *)(a3 + 68) = v14;
  if (v14 >= 8 || ((0xFBu >> v14) & 1) == 0) {
    AcAttrNode::getParams();
  }
  int v18 = dword_2176663D0[v14] * v16;
  *(_DWORD *)(a3 + 64) = v18;
  if (v15 + (v18 * v17) - *(void *)(a1 + 24) != a2[26]) {
    goto LABEL_18;
  }
  uint64_t v19 = *(void *)(a1 + 32);
  *(void *)(a3 + 72) = v19;
  int v20 = a2[21];
  *(_DWORD *)(a3 + 84) = v20;
  int v21 = a2[25] * a2[23];
  *(_DWORD *)(a3 + 80) = v21;
  int v22 = dword_2176663D0[v14] * v20;
  *(_DWORD *)(a3 + 88) = v22;
  *(_DWORD *)(a3 + 92) = v14;
  if (v19 + (v22 * v21) - *(void *)(a1 + 32) != a2[27]) {
LABEL_18:
  }
    TtTrkRpnNode::setUpNetBuffers();
  signed int v23 = a2[19];
  uint64_t v24 = *(void *)(a1 + 48);
  *(void *)(a3 + 96) = v24;
  int v25 = a2[11];
  *(_DWORD *)(a3 + 108) = v25;
  int v26 = a2[15] * a2[13];
  *(_DWORD *)(a3 + 104) = v26;
  *(_DWORD *)(a3 + 116) = v23;
  if (v23 >= 8 || ((0xFBu >> v23) & 1) == 0) {
    AcAttrNode::getParams();
  }
  int v27 = dword_2176663D0[v23] * v25;
  *(_DWORD *)(a3 + 112) = v27;
  if (v24 + (v27 * v26) - *(void *)(a1 + 48) != a2[17]) {
    goto LABEL_19;
  }
  uint64_t v28 = *(void *)(a1 + 56);
  *(void *)(a3 + 120) = v28;
  int v29 = a2[12];
  *(_DWORD *)(a3 + 132) = v29;
  int v30 = a2[16] * a2[14];
  *(_DWORD *)(a3 + 128) = v30;
  int v31 = dword_2176663D0[v23] * v29;
  *(_DWORD *)(a3 + 136) = v31;
  *(_DWORD *)(a3 + 140) = v23;
  if (v28 + (v31 * v30) - *(void *)(a1 + 56) != a2[18]) {
LABEL_19:
  }
    TtTrkRpnNode::setUpNetBuffers();
  return 0;
}

void sub_217634C44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217634E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217635010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2176351F8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);

  _Unwind_Resume(a1);
}

void sub_217635218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217635228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2176353B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217635538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217635778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217635888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217635AD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217635B34(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_217635D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
    {
LABEL_8:
      std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100](v23 - 48);
      _Unwind_Resume(a1);
    }
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

void ReportException(std::exception *a1)
{
  uint64_t v1 = ft::GetOsLog((ft *)a1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    ReportException();
  }
}

{
  NSObject *v1;

  uint64_t v1 = ft::GetOsLog((ft *)a1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    -[FTCinematicTapToTrack initWithEspressoEngine:scalingBackend:commandQueue:]();
  }
}

void __clang_call_terminate(void *a1)
{
}

void sub_217636310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217636320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217636330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217636340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217636350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217636360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217636428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217636548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217636820(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100](v2 - 48);
  _Unwind_Resume(a1);
}

void sub_21763683C(_Unwind_Exception *a1)
{
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100](v1 - 48);
  _Unwind_Resume(a1);
}

void sub_217636850(_Unwind_Exception *a1)
{
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100](v1 - 48);
  _Unwind_Resume(a1);
}

void sub_2176369CC(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v2);

  _Unwind_Resume(a1);
}

void sub_2176369E4()
{
}

void AsEspressoBufferMap(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v3 = a2;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  id v31 = v3;
  uint64_t v32 = a1;
  *(_DWORD *)(a1 + 32) = 1065353216;
  unint64_t prime = vcvtps_u32_f32((float)(unint64_t)[v3 count] / *(float *)(a1 + 32));
  if (prime == 1)
  {
    unint64_t prime = 2;
  }
  else if ((prime & (prime - 1)) != 0)
  {
    unint64_t prime = std::__next_prime(prime);
  }
  int8x8_t v5 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v5) {
    goto LABEL_6;
  }
  if (prime < *(void *)&v5)
  {
    unint64_t v6 = vcvtps_u32_f32((float)*(unint64_t *)(v32 + 24) / *(float *)(v32 + 32));
    if (*(void *)&v5 < 3uLL || (uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5), v7.i16[0] = vaddlv_u8(v7), v7.u32[0] > 1uLL))
    {
      unint64_t v6 = std::__next_prime(v6);
    }
    else
    {
      uint64_t v8 = 1 << -(char)__clz(v6 - 1);
      if (v6 >= 2) {
        unint64_t v6 = v8;
      }
    }
    if (prime <= v6) {
      unint64_t prime = v6;
    }
    if (prime < *(void *)&v5) {
LABEL_6:
    }
      std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__do_rehash<true>(v32, prime);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v9 = v31;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(v9);
        }
        unsigned int v13 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        signed int v14 = [v9 objectForKeyedSubscript:v13];
        uint64_t v15 = v14;
        if (v14)
        {
          [v14 buffer];
        }
        else
        {
          uint64_t v45 = 0;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v42 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v35 = 0u;
        }
        int v16 = (const char *)[v13 UTF8String];
        size_t v17 = strlen(v16);
        if (v17 >= 0x7FFFFFFFFFFFFFF8) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        int v18 = (void *)v17;
        if (v17 >= 0x17)
        {
          uint64_t v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v17 | 7) != 0x17) {
            uint64_t v20 = v17 | 7;
          }
          uint64_t v21 = v20 + 1;
          uint64_t v19 = (void **)operator new(v20 + 1);
          __dst[1] = v18;
          unint64_t v34 = v21 | 0x8000000000000000;
          __dst[0] = v19;
LABEL_32:
          memmove(v19, v16, (size_t)v18);
          goto LABEL_33;
        }
        HIBYTE(v34) = v17;
        uint64_t v19 = __dst;
        if (v17) {
          goto LABEL_32;
        }
LABEL_33:
        *((unsigned char *)v18 + (void)v19) = 0;
        float v50 = __dst;
        int v22 = std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v32, (uint64_t)__dst, (uint64_t)&std::piecewise_construct, (long long **)&v50);
        long long v24 = v40;
        long long v23 = v41;
        long long v25 = v39;
        *(_OWORD *)(v22 + 88) = v38;
        uint64_t v26 = v45;
        long long v28 = v43;
        long long v27 = v44;
        *(_OWORD *)(v22 + 152) = v42;
        *(_OWORD *)(v22 + 168) = v28;
        *(_OWORD *)(v22 + 184) = v27;
        *((void *)v22 + 25) = v26;
        *(_OWORD *)(v22 + 104) = v25;
        *(_OWORD *)(v22 + 120) = v24;
        *(_OWORD *)(v22 + 136) = v23;
        long long v29 = v36;
        long long v30 = v37;
        *(_OWORD *)(v22 + 40) = v35;
        *(_OWORD *)(v22 + 56) = v29;
        *(_OWORD *)(v22 + 72) = v30;
        if (SHIBYTE(v34) < 0) {
          operator delete(__dst[0]);
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v10);
  }
}

void sub_217636D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  std::unordered_map<std::string,espresso_buffer_t>::~unordered_map[abi:ne180100](a11);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<std::string,espresso_buffer_t>::~unordered_map[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      int8x8_t v5 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v5;
    }
    while (v5);
  }
  id v3 = *(void **)a1;
  *(void *)a1 = 0;
  if (v3) {
    operator delete(v3);
  }
  return a1;
}

void sub_217636F30(_Unwind_Exception *a1, int a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::unordered_map<std::string,espresso_buffer_t>::~unordered_map[abi:ne180100]((uint64_t)va);
  if (a2 == 1)
  {
    uint8x8_t v7 = (std::exception *)__cxa_begin_catch(a1);
    ReportException(v7);
    __cxa_end_catch();
    JUMPOUT(0x217636ECCLL);
  }
  std::recursive_mutex::unlock(v4);

  _Unwind_Resume(a1);
}

void sub_217636F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ft::CinematicTracker::TerminateHighPriorityTrack(ft::CinematicTracker *this)
{
  uint64_t v2 = *((void *)this + 19);
  if (v2)
  {
    uint64_t v3 = *((void *)this + 24);
    int64x2_t v4 = (std::__shared_weak_count *)*((void *)this + 20);
    uint64_t v9 = v2;
    uint64_t v10 = v4;
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ft::TrackPool::RemoveTrack(v3, (uint64_t)&v9);
    int8x8_t v5 = v10;
    if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  ft::CinematicTracker::SetHighPriorityTrack((uint64_t *)this, &v7);
  unint64_t v6 = v8;
  if (v8)
  {
    if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_2176370AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2176370C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_217637128(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *FTCinematicHighPriorityTrackerOpDescription(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_264294D38[a1];
  }
}

void sub_2176374EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100]((uint64_t)&a11);

  _Unwind_Resume(a1);
}

void sub_217637518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217637CDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::recursive_mutex *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,char a50)
{
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100]((uint64_t)&a50);
  if (a2 == 1)
  {
    float v56 = (std::exception *)__cxa_begin_catch(a1);
    ReportException(v56);
    __cxa_end_catch();
    JUMPOUT(0x217637A14);
  }
  std::recursive_mutex::unlock(a13);
  _Unwind_Resume(a1);
}

void sub_217637E6C(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void ft::CinematicTracker::TerminateHighlyOverlappingDetectionlessTrack(ft::CinematicTracker *this)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v1 = (double *)*((void *)this + 21);
  if (v1)
  {
    double v3 = v1[3];
    double v4 = v1[4];
    double v5 = v1[5];
    double v6 = v1[6];
    ActiveTracks = (ft *)ft::TrackPool::GetActiveTracks(*((ft::TrackPool **)this + 24));
    uint64_t v8 = *(double ***)ActiveTracks;
    uint64_t v9 = (double **)*((void *)ActiveTracks + 1);
    if (*(double ***)ActiveTracks != v9)
    {
      double v10 = v3 + v5;
      double v11 = v5 * v6;
      while (1)
      {
        int v12 = *v8;
        if (*v8 != *((double **)this + 21))
        {
          double v13 = v12[3];
          double v14 = v12[4];
          if (v13 >= v3) {
            double v15 = v12[3];
          }
          else {
            double v15 = v3;
          }
          if (v14 >= v4) {
            double v16 = v12[4];
          }
          else {
            double v16 = v4;
          }
          double v17 = v12[5];
          double v18 = v12[6];
          double v19 = v13 + v17;
          if (v10 < v19) {
            double v19 = v10;
          }
          double v20 = v14 + v18;
          if (v4 + v6 < v20) {
            double v20 = v4 + v6;
          }
          double v21 = v19 <= v15 ? 0.0 : v19 - v15;
          double v22 = v20 <= v16 ? 0.0 : v20 - v16;
          float v23 = v21 * v22;
          float v24 = v11 + v17 * v18 - v23;
          float v25 = v23 / v24;
          float v26 = v24 >= 0.00000011921 ? v25 : 0.0;
          if (v26 > 0.4) {
            break;
          }
        }
        v8 += 2;
        if (v8 == v9) {
          return;
        }
      }
      long long v27 = ft::GetOsLog(ActiveTracks);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        int v28 = 134218240;
        double v29 = v26;
        __int16 v30 = 2048;
        uint64_t v31 = 0x3FD99999A0000000;
        _os_log_impl(&dword_21762A000, v27, OS_LOG_TYPE_INFO, "Terminating detectionless track. IoU exceeded: %0.2f > %0.2f", (uint8_t *)&v28, 0x16u);
      }

      ft::CinematicTracker::TerminateDetectionlessTrack(this);
    }
  }
}

void sub_2176381C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2176386DC(_Unwind_Exception *a1)
{
  double v4 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v4;
    operator delete(v4);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

void sub_2176388EC(_Unwind_Exception *a1)
{
  double v4 = v3;
  std::__shared_weak_count::~__shared_weak_count(v4);
  operator delete(v6);

  _Unwind_Resume(a1);
}

void sub_217638910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217638924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217638DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, std::recursive_mutex *a10, char a11, uint64_t a12, char a13, uint64_t a14, char a15)
{
  if (v16) {
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  }
  if (a2 == 1)
  {
    float v23 = (std::exception *)__cxa_begin_catch(a1);
    ReportException(v23);
    __cxa_end_catch();
    JUMPOUT(0x217638A44);
  }
  std::recursive_mutex::unlock(a10);

  _Unwind_Resume(a1);
}

void ft::CinematicTracker::Track(ft::TrackPool **this, const Frame *a2)
{
  uint64_t ActiveTracks = ft::TrackPool::GetActiveTracks(this[24]);
  double v5 = *(uint64_t **)ActiveTracks;
  double v6 = *(uint64_t **)(ActiveTracks + 8);
  if (*(uint64_t **)ActiveTracks != v6)
  {
    do
    {
      uint64_t v7 = *v5;
      v5 += 2;
      ft::Track::Predict(v7, a2);
    }
    while (v5 != v6);
  }
  ft::TrackPool::UpdateForeignTracks((uint64_t)this[24], a2, __p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  ft::TrackPool::RetireLostTracks(this[24]);
  ft::CinematicTracker::ProcessTap((ft::CinematicTracker *)this, a2);
  ft::CinematicTracker::ManageHighPriorityTrack((ft::CinematicTracker *)this, a2);
}

void sub_2176390C8(_Unwind_Exception *a1)
{
  double v4 = v3;

  _Unwind_Resume(a1);
}

void sub_2176392C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21763944C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (!a2)
  {
    double v15 = *(void **)a1;
    *(void *)a1 = 0;
    if (v15) {
      operator delete(v15);
    }
    *(void *)(a1 + 8) = 0;
    return;
  }
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  double v4 = operator new(8 * a2);
  double v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v6 = 0;
  *(void *)(a1 + 8) = a2;
  do
    *(void *)(*(void *)a1 + 8 * v6++) = 0;
  while (a2 != v6);
  uint64_t v8 = a1 + 16;
  uint64_t v7 = *(void **)(a1 + 16);
  if (v7)
  {
    unint64_t v9 = v7[1];
    unint64_t v10 = a2 - 1;
    if ((a2 & (a2 - 1)) == 0)
    {
      uint64_t v11 = v9 & v10;
      *(void *)(*(void *)a1 + 8 * v11) = v8;
      while (1)
      {
        int v12 = (void *)*v7;
        if (!*v7) {
          break;
        }
        uint64_t v13 = v12[1] & v10;
        if (v13 == v11)
        {
          uint64_t v7 = (void *)*v7;
        }
        else if (*(void *)(*(void *)a1 + 8 * v13))
        {
          *uint64_t v7 = *v12;
          uint64_t v14 = 8 * v13;
          *int v12 = **(void **)(*(void *)a1 + v14);
          **(void **)(*(void *)a1 + v14) = v12;
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v13) = v7;
          uint64_t v7 = v12;
          uint64_t v11 = v13;
        }
      }
      return;
    }
    if (v9 >= a2) {
      v9 %= a2;
    }
    *(void *)(*(void *)a1 + 8 * v9) = v8;
    double v16 = (void *)*v7;
    if (*v7)
    {
      while (1)
      {
        unint64_t v18 = v16[1];
        if (v18 >= a2) {
          v18 %= a2;
        }
        if (v18 == v9) {
          goto LABEL_25;
        }
        if (*(void *)(*(void *)a1 + 8 * v18))
        {
          *uint64_t v7 = *v16;
          uint64_t v17 = 8 * v18;
          *double v16 = **(void **)(*(void *)a1 + v17);
          **(void **)(*(void *)a1 + v17) = v16;
          double v16 = v7;
LABEL_25:
          uint64_t v7 = v16;
          double v16 = (void *)*v16;
          if (!v16) {
            return;
          }
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v18) = v7;
          uint64_t v7 = v16;
          double v16 = (void *)*v16;
          unint64_t v9 = v18;
          if (!v16) {
            return;
          }
        }
      }
    }
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = (unsigned char *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }
  unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)v44, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    uint64_t v14 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      double v15 = (unsigned __int8 *)*v14;
      if (*v14)
      {
        char v16 = v6[23];
        if (v16 >= 0) {
          uint64_t v17 = v6[23];
        }
        else {
          uint64_t v17 = *((void *)v6 + 1);
        }
        if (v16 < 0) {
          uint64_t v6 = *(unsigned char **)v6;
        }
        if (v13.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v22 = *((void *)v15 + 1);
            if (v22 == v11)
            {
              uint64_t v23 = v15[39];
              if ((v23 & 0x80u) == 0) {
                uint64_t v24 = v15[39];
              }
              else {
                uint64_t v24 = *((void *)v15 + 3);
              }
              if (v24 == v17)
              {
                if ((v23 & 0x80) != 0)
                {
                  if (!memcmp(*((const void **)v15 + 2), v6, *((void *)v15 + 3))) {
                    return v15;
                  }
                }
                else
                {
                  if (!v15[39]) {
                    return v15;
                  }
                  uint64_t v25 = 0;
                  while (v15[v25 + 16] == v6[v25])
                  {
                    if (v23 == ++v25) {
                      return v15;
                    }
                  }
                }
              }
            }
            else if ((v22 & (v12 - 1)) != v4)
            {
              goto LABEL_51;
            }
            double v15 = *(unsigned __int8 **)v15;
            if (!v15) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v18 = *((void *)v15 + 1);
          if (v18 == v11)
          {
            uint64_t v19 = v15[39];
            if ((v19 & 0x80u) == 0) {
              uint64_t v20 = v15[39];
            }
            else {
              uint64_t v20 = *((void *)v15 + 3);
            }
            if (v20 == v17)
            {
              if ((v19 & 0x80) != 0)
              {
                if (!memcmp(*((const void **)v15 + 2), v6, *((void *)v15 + 3))) {
                  return v15;
                }
              }
              else
              {
                if (!v15[39]) {
                  return v15;
                }
                uint64_t v21 = 0;
                while (v15[v21 + 16] == v6[v21])
                {
                  if (v19 == ++v21) {
                    return v15;
                  }
                }
              }
            }
          }
          else
          {
            if (v18 >= v12) {
              v18 %= v12;
            }
            if (v18 != v4) {
              break;
            }
          }
          double v15 = *(unsigned __int8 **)v15;
        }
        while (v15);
      }
    }
  }
LABEL_51:
  float v26 = (void *)(a1 + 16);
  double v15 = (unsigned __int8 *)operator new(0xD0uLL);
  v44[0] = v15;
  v44[1] = a1 + 16;
  *(void *)double v15 = 0;
  *((void *)v15 + 1) = v11;
  long long v27 = *a4;
  long long v28 = **a4;
  *((void *)v15 + 4) = *((void *)*a4 + 2);
  *((_OWORD *)v15 + 1) = v28;
  *((void *)v27 + 1) = 0;
  *((void *)v27 + 2) = 0;
  *(void *)long long v27 = 0;
  *(_OWORD *)(v15 + 40) = 0u;
  *(_OWORD *)(v15 + 56) = 0u;
  *(_OWORD *)(v15 + 72) = 0u;
  *(_OWORD *)(v15 + 88) = 0u;
  *(_OWORD *)(v15 + 104) = 0u;
  *(_OWORD *)(v15 + 120) = 0u;
  *(_OWORD *)(v15 + 136) = 0u;
  *(_OWORD *)(v15 + 152) = 0u;
  *(_OWORD *)(v15 + 168) = 0u;
  *(_OWORD *)(v15 + 184) = 0u;
  *((void *)v15 + 25) = 0;
  char v45 = 1;
  float v29 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v30 = *(float *)(a1 + 32);
  if (v12 && (float)(v30 * (float)v12) >= v29)
  {
    uint64_t v31 = *(void *)a1;
    uint64_t v32 = *(void **)(*(void *)a1 + 8 * v4);
    if (v32)
    {
LABEL_54:
      *(void *)double v15 = *v32;
LABEL_89:
      void *v32 = v15;
      goto LABEL_90;
    }
  }
  else
  {
    BOOL v33 = 1;
    if (v12 >= 3) {
      BOOL v33 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v34 = v33 | (2 * v12);
    unint64_t v35 = vcvtps_u32_f32(v29 / v30);
    if (v34 <= v35) {
      size_t prime = v35;
    }
    else {
      size_t prime = v34;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v37 = *(int8x8_t *)(a1 + 8);
    if (prime > *(void *)&v37) {
      goto LABEL_65;
    }
    if (prime < *(void *)&v37)
    {
      unint64_t v38 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(void *)&v37 < 3uLL || (uint8x8_t v39 = (uint8x8_t)vcnt_s8(v37), v39.i16[0] = vaddlv_u8(v39), v39.u32[0] > 1uLL))
      {
        unint64_t v38 = std::__next_prime(v38);
      }
      else
      {
        uint64_t v40 = 1 << -(char)__clz(v38 - 1);
        if (v38 >= 2) {
          unint64_t v38 = v40;
        }
      }
      if (prime <= v38) {
        size_t prime = v38;
      }
      if (prime < *(void *)&v37) {
LABEL_65:
      }
        std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__do_rehash<true>(a1, prime);
    }
    unint64_t v12 = *(void *)(a1 + 8);
    unint64_t v41 = v12 - 1;
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
      {
        unint64_t v4 = v11 % v12;
        uint64_t v31 = *(void *)a1;
        uint64_t v32 = *(void **)(*(void *)a1 + 8 * (v11 % v12));
        if (v32) {
          goto LABEL_54;
        }
      }
      else
      {
        unint64_t v4 = v11;
        uint64_t v31 = *(void *)a1;
        uint64_t v32 = *(void **)(*(void *)a1 + 8 * v11);
        if (v32) {
          goto LABEL_54;
        }
      }
    }
    else
    {
      unint64_t v4 = v41 & v11;
      uint64_t v31 = *(void *)a1;
      uint64_t v32 = *(void **)(*(void *)a1 + 8 * (v41 & v11));
      if (v32) {
        goto LABEL_54;
      }
    }
  }
  *(void *)double v15 = *v26;
  *float v26 = v15;
  *(void *)(v31 + 8 * v4) = v26;
  if (*(void *)v15)
  {
    unint64_t v42 = *(void *)(*(void *)v15 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v42 >= v12) {
        v42 %= v12;
      }
    }
    else
    {
      v42 &= v12 - 1;
    }
    uint64_t v32 = (void *)(*(void *)a1 + 8 * v42);
    goto LABEL_89;
  }
LABEL_90:
  ++*(void *)(a1 + 24);
  return v15;
}

void sub_217639A6C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,espresso_buffer_t>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,espresso_buffer_t>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,espresso_buffer_t>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,espresso_buffer_t>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16) && *(char *)(v2 + 39) < 0) {
      operator delete(*(void **)(v2 + 16));
    }
    operator delete((void *)v2);
  }
  return a1;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v23 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v24 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v25 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v27 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v26 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v28 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v29 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v30 = v26 + v28;
      unint64_t v31 = 0x9DDFEA08EB382D69
          * (v25 ^ ((0x9DDFEA08EB382D69 * (v25 ^ (v23 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v25 ^ (v23 + a3))));
      unint64_t v32 = 0x9DDFEA08EB382D69 * (v31 ^ (v31 >> 47));
      unint64_t v33 = v27 + a3 + v26 + v23;
      uint64_t v34 = v33 + v24;
      unint64_t v35 = __ROR8__(v33, 44) + v27 + a3 + __ROR8__(v24 + v27 + a3 - 0x622015F714C7D297 * (v31 ^ (v31 >> 47)), 21);
      uint64_t v36 = v26 + v28 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v37 = v36 + v25 + v28;
      uint64_t v38 = __ROR8__(v37, 44);
      uint64_t v39 = v37 + v29;
      uint64_t v40 = v38 + v36 + __ROR8__(v36 + v24 + v29, 21);
      uint64_t v42 = *a2;
      unint64_t v41 = a2 + 4;
      unint64_t v43 = v42 - 0x4B6D499041670D8DLL * v24;
      uint64_t v44 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v45 = *(v41 - 3);
        uint64_t v46 = v43 + v34 + v30 + v45;
        uint64_t v47 = v41[2];
        uint64_t v48 = v41[3];
        uint64_t v49 = v41[1];
        unint64_t v30 = v49 + v34 - 0x4B6D499041670D8DLL * __ROR8__(v30 + v35 + v47, 42);
        uint64_t v50 = v32 + v39;
        uint64_t v51 = *(v41 - 2);
        uint64_t v52 = *(v41 - 1);
        uint64_t v53 = *(v41 - 4) - 0x4B6D499041670D8DLL * v35;
        uint64_t v54 = v53 + v39 + v52;
        uint64_t v55 = v53 + v45 + v51;
        uint64_t v34 = v55 + v52;
        uint64_t v56 = __ROR8__(v55, 44) + v53;
        unint64_t v57 = (0xB492B66FBE98F273 * __ROR8__(v46, 37)) ^ v40;
        unint64_t v43 = 0xB492B66FBE98F273 * __ROR8__(v50, 33);
        unint64_t v35 = v56 + __ROR8__(v54 + v57, 21);
        unint64_t v58 = v43 + v40 + *v41;
        uint64_t v39 = v58 + v49 + v47 + v48;
        uint64_t v40 = __ROR8__(v58 + v49 + v47, 44) + v58 + __ROR8__(v30 + v51 + v58 + v48, 21);
        v41 += 8;
        unint64_t v32 = v57;
        v44 += 64;
      }
      while (v44);
      unint64_t v59 = v43
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v40 ^ ((0x9DDFEA08EB382D69 * (v40 ^ v35)) >> 47) ^ (0x9DDFEA08EB382D69 * (v40 ^ v35)))) ^ ((0x9DDFEA08EB382D69 * (v40 ^ ((0x9DDFEA08EB382D69 * (v40 ^ v35)) >> 47) ^ (0x9DDFEA08EB382D69 * (v40 ^ v35)))) >> 47));
      unint64_t v60 = 0x9DDFEA08EB382D69
          * (v59 ^ (v57
                  - 0x4B6D499041670D8DLL * (v30 ^ (v30 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v39 ^ ((0x9DDFEA08EB382D69 * (v39 ^ v34)) >> 47) ^ (0x9DDFEA08EB382D69 * (v39 ^ v34)))) ^ ((0x9DDFEA08EB382D69 * (v39 ^ ((0x9DDFEA08EB382D69 * (v39 ^ v34)) >> 47) ^ (0x9DDFEA08EB382D69 * (v39 ^ v34)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v59 ^ (v60 >> 47) ^ v60)) ^ ((0x9DDFEA08EB382D69 * (v59 ^ (v60 >> 47) ^ v60)) >> 47));
    }
    else
    {
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v7 = *a2 - 0x3C5A37A36834CED9 * (v6 + a3);
      uint64_t v9 = a2[2];
      uint64_t v8 = a2[3];
      uint64_t v10 = __ROR8__(v7 + v8, 52);
      uint64_t v11 = v7 + a2[1];
      uint64_t v12 = __ROR8__(v11, 7);
      uint64_t v13 = v11 + v9;
      uint64_t v14 = *(uint64_t *)((char *)a2 + a3 - 32) + v9;
      uint64_t v15 = v12 + __ROR8__(*a2 - 0x3C5A37A36834CED9 * (v6 + a3), 37) + v10 + __ROR8__(v13, 31);
      uint64_t v16 = *(uint64_t *)((char *)a2 + a3 - 24) + v14 + v6;
      unint64_t v17 = 0xC3A5C85C97CB3127 * (v16 + *(uint64_t *)((char *)a2 + a3 - 8) + v8 + v15)
          - 0x651E95C4D06FBFB1
          * (v13
           + v8
           + __ROR8__(v14, 37)
           + __ROR8__(*(uint64_t *)((char *)a2 + a3 - 24) + v14, 7)
           + __ROR8__(*(uint64_t *)((char *)a2 + a3 - 8) + v8 + v14, 52)
           + __ROR8__(v16, 31));
      return 0x9AE16A3B2F90404FLL
           * ((v15 - 0x3C5A37A36834CED9 * (v17 ^ (v17 >> 47))) ^ ((v15 - 0x3C5A37A36834CED9 * (v17 ^ (v17 >> 47))) >> 47));
    }
  }
  else if (a3 > 0x10)
  {
    uint64_t v18 = a2[1];
    unint64_t v19 = 0xB492B66FBE98F273 * *a2;
    uint64_t v20 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a2 + a3 - 8), 30) + __ROR8__(v19 - v18, 43);
    unint64_t v21 = v19 + a3 + __ROR8__(v18 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a2 + a3 - 8);
    unint64_t v22 = 0x9DDFEA08EB382D69 * ((v20 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a2 + a3 - 16)) ^ v21);
    return 0x9DDFEA08EB382D69
         * ((0x9DDFEA08EB382D69 * (v21 ^ (v22 >> 47) ^ v22)) ^ ((0x9DDFEA08EB382D69 * (v21 ^ (v22 >> 47) ^ v22)) >> 47));
  }
  else if (a3 < 9)
  {
    if (a3 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a3)
      {
        unint64_t v63 = (0xC949D7C7509E6557 * (a3 + 4 * *((unsigned __int8 *)a2 + a3 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                       * (*(unsigned __int8 *)a2 | ((unint64_t)*((unsigned __int8 *)a2 + (a3 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v63 ^ (v63 >> 47));
      }
    }
    else
    {
      uint64_t v61 = *(unsigned int *)((char *)a2 + a3 - 4);
      unint64_t v62 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a2) + a3) ^ v61);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v61 ^ (v62 >> 47) ^ v62)) ^ ((0x9DDFEA08EB382D69 * (v61 ^ (v62 >> 47) ^ v62)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(uint64_t *)((char *)a2 + a3 - 8);
    uint64_t v4 = __ROR8__(v3 + a3, a3);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a2)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a2)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a2)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a2)))) >> 47))) ^ v3;
  }
  return result;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

uint64_t *ft::CinematicTracker::SetHighPriorityTrack(uint64_t *this, uint64_t *a2)
{
  uint64_t v2 = *a2;
  if (*a2 != this[19])
  {
    uint64_t v4 = this;
    if (this[21])
    {
      ft::CinematicTracker::TerminateDetectionlessTrack((ft::CinematicTracker *)this);
      uint64_t v2 = *a2;
    }
    if (v2 && (*(unsigned char *)(v2 + 8) & 1) != 0)
    {
      uint64_t v5 = a2[1];
      if (v5) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
      }
      uint64_t v6 = (std::__shared_weak_count *)v4[22];
      v4[21] = v2;
      v4[22] = v5;
      if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    uint64_t v8 = *a2;
    uint64_t v7 = a2[1];
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = (std::__shared_weak_count *)v4[20];
    v4[19] = v8;
    v4[20] = v7;
    if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
      uint64_t v10 = v4 + 25;
    }
    else
    {
      uint64_t v10 = v4 + 25;
    }
    return ft::SiameseRpnSession::Reset(v10);
  }
  return this;
}

void ft::CinematicTracker::TerminateDetectionlessTrack(ft::CinematicTracker *this)
{
  uint64_t v2 = *((void *)this + 21);
  if (v2 != *((void *)this + 19))
  {
    uint64_t v3 = ft::GetOsLog(this);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ft::CinematicTracker::TerminateDetectionlessTrack();
    }

    uint64_t v2 = *((void *)this + 21);
  }
  uint64_t v4 = *((void *)this + 24);
  uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 22);
  uint64_t v9 = v2;
  uint64_t v10 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ft::TrackPool::RemoveTrack(v4, (uint64_t)&v9);
  uint64_t v6 = v10;
  if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  uint64_t v7 = (std::__shared_weak_count *)*((void *)this + 22);
  *((void *)this + 21) = 0;
  *((void *)this + 22) = 0;
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  uint64_t v8 = (std::__shared_weak_count *)*((void *)this + 20);
  *((void *)this + 19) = 0;
  *((void *)this + 20) = 0;
  if (v8)
  {
    if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

void sub_21763A214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void ft::CinematicTracker::ProcessTap(ft::CinematicTracker *this, const Frame *a2)
{
  if (!*((unsigned char *)a2 + 80)) {
    return;
  }
  ft::TrackPool::GetTrackById(*((void *)this + 24), *((void *)a2 + 7), &v19);
  if (!(void)v19)
  {
    double v8 = *((double *)a2 + 8);
    if (v8 > 1.0 || v8 < 0.0) {
      goto LABEL_4;
    }
    double v9 = *((double *)a2 + 9);
    if (v9 < 0.0 || v9 > 1.0) {
      goto LABEL_4;
    }
    ft::TrackPool::CreateNewDetectionlessTrack(*((ft::TrackPool **)this + 24), (uint64_t)&v18);
    long long v11 = v18;
    long long v18 = 0uLL;
    uint64_t v12 = (std::__shared_weak_count *)*((void *)&v19 + 1);
    long long v19 = v11;
    if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    uint64_t v13 = (std::__shared_weak_count *)*((void *)&v18 + 1);
    if (*((void *)&v18 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v18 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
    unint64_t v14 = v19;
    *(void *)(v19 + 8) |= 1uLL;
    unsigned long long v17 = __PAIR128__(*((unint64_t *)&v19 + 1), v14);
    if (*((void *)&v19 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v19 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    ft::CinematicTracker::SetHighPriorityTrack((uint64_t *)this, (uint64_t *)&v17);
    uint64_t v15 = (std::__shared_weak_count *)*((void *)&v17 + 1);
    if (*((void *)&v17 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v17 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  long long v4 = *(_OWORD *)a2;
  *((void *)this + 4) = *((void *)a2 + 2);
  *((_OWORD *)this + 1) = v4;
  unint64_t v16 = *(void *)(v19 + 16);
  *(void *)&long long v18 = &v16;
  uint64_t v5 = std::__hash_table<std::__hash_value_type<long long,CMTime>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,CMTime>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,CMTime>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,CMTime>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long &&>,std::tuple<>>((uint64_t)this + 40, &v16, (uint64_t)&std::piecewise_construct, (uint64_t **)&v18);
  long long v6 = *(_OWORD *)a2;
  v5[5] = *((void *)a2 + 2);
  *(_OWORD *)(v5 + 3) = v6;
LABEL_4:
  uint64_t v7 = (std::__shared_weak_count *)*((void *)&v19 + 1);
  if (*((void *)&v19 + 1))
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v19 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

void sub_21763A478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_21763A494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21763A4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void ft::CinematicTracker::ManageHighPriorityTrack(ft::CinematicTracker *this, const Frame *a2)
{
  uint64_t v4 = *((void *)this + 19);
  if (v4
    && *(unsigned char *)(v4 + 240)
    && (v22 = 0, v23 = 0, ft::CinematicTracker::SetHighPriorityTrack((uint64_t *)this, &v22), (uint64_t v5 = v23) != 0)
    && !atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
    if ([*(id *)this allowTrackPromotion]) {
      goto LABEL_6;
    }
  }
  else if ([*(id *)this allowTrackPromotion])
  {
LABEL_6:
    if (*((unsigned char *)a2 + 96)) {
      ft::CinematicTracker::PromoteTrackById(this, *((void *)a2 + 11));
    }
    if (!*((void *)this + 19)) {
      ft::CinematicTracker::AutoPromoteExistingTrackToHighPriority((ft::TrackPool **)this);
    }
    return;
  }
  uint64_t v6 = *((void *)this + 19);
  if (v6)
  {
    if (*(unsigned char *)(v6 + 232))
    {
      long long v7 = *(_OWORD *)(v6 + 168);
      long long v17 = *(_OWORD *)(v6 + 152);
      long long v18 = v7;
      long long v19 = *(_OWORD *)(v6 + 184);
      uint64_t v20 = *(void *)(v6 + 200);
      long long v8 = *(_OWORD *)(v6 + 104);
      long long v14 = *(_OWORD *)(v6 + 88);
      long long v15 = v8;
      long long v9 = *(_OWORD *)(v6 + 136);
      *(_OWORD *)unint64_t v16 = *(_OWORD *)(v6 + 120);
      *(_OWORD *)&v16[16] = v9;
      long long v10 = *(_OWORD *)(v6 + 72);
      long long v12 = *(_OWORD *)(v6 + 56);
      long long v13 = v10;
      CMTime time1 = *(CMTime *)&v16[4];
      CMTime v11 = *(CMTime *)a2;
      if (!CMTimeCompare(&time1, &v11)) {
        ft::SiameseRpnSession::Reset((uint64_t *)this + 25);
      }
    }
  }
}

void sub_21763A644(_Unwind_Exception *a1)
{
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100](v1 - 48);
  _Unwind_Resume(a1);
}

void ft::CinematicTracker::PromoteTrackById(ft::CinematicTracker *this, uint64_t a2)
{
  if (a2 != -1)
  {
    ft::TrackPool::GetTrackById(*((void *)this + 24), a2, &v9);
    if (v9)
    {
      if (*(unsigned char *)(v9 + 232))
      {
        double v3 = *(double *)(v9 + 24);
        if (v3 >= 0.0)
        {
          double v4 = *(double *)(v9 + 32);
          if (v4 >= 0.0 && v3 + *(double *)(v9 + 40) <= 1.0 && v4 + *(double *)(v9 + 48) <= 1.0)
          {
            uint64_t v7 = v9;
            long long v8 = v10;
            if (v10) {
              atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            ft::CinematicTracker::SetHighPriorityTrack((uint64_t *)this, &v7);
            uint64_t v5 = v8;
            if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
              std::__shared_weak_count::__release_weak(v5);
            }
          }
        }
      }
    }
    uint64_t v6 = v10;
    if (v10)
    {
      if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_21763A7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void ft::CinematicTracker::AutoPromoteExistingTrackToHighPriority(ft::TrackPool **this)
{
  uint64_t ActiveTracks = ft::TrackPool::GetActiveTracks(this[24]);
  double v3 = *(uint64_t **)ActiveTracks;
  double v4 = *(uint64_t **)(ActiveTracks + 8);
  if (*(uint64_t **)ActiveTracks != v4)
  {
    uint64_t v5 = *(uint64_t **)ActiveTracks;
    while (1)
    {
      uint64_t v6 = (double *)*v5;
      if (*(unsigned char *)(*v5 + 232))
      {
        double v7 = v6[3];
        if (v7 >= 0.0)
        {
          double v8 = v6[4];
          if (v8 >= 0.0 && v7 + v6[5] <= 1.0 && v8 + v6[6] <= 1.0) {
            break;
          }
        }
      }
      v5 += 2;
      if (v5 == v4) {
        return;
      }
    }
    uint64_t v10 = *v3;
    uint64_t v9 = (std::__shared_weak_count *)v3[1];
    uint64_t v12 = v10;
    long long v13 = v9;
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ft::CinematicTracker::SetHighPriorityTrack((uint64_t *)this, &v12);
    CMTime v11 = v13;
    if (v13)
    {
      if (!atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
}

void sub_21763A8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *std::__hash_table<std::__hash_value_type<long long,CMTime>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,CMTime>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,CMTime>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,CMTime>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long &&>,std::tuple<>>(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void **)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      CMTime v11 = (void *)*v10;
      if (*v10)
      {
        if (v9.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v13 = v11[1];
            if (v13 == v7)
            {
              if (v11[2] == v7) {
                return v11;
              }
            }
            else if ((v13 & (v8 - 1)) != v4)
            {
              goto LABEL_23;
            }
            CMTime v11 = (void *)*v11;
            if (!v11) {
              goto LABEL_23;
            }
          }
        }
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7) {
              return v11;
            }
          }
          else
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
            if (v12 != v4) {
              break;
            }
          }
          CMTime v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
LABEL_23:
  long long v15 = operator new(0x30uLL);
  void *v15 = 0;
  v15[1] = v7;
  uint64_t v16 = **a4;
  v15[4] = 0;
  v15[5] = 0;
  float32x4_t v15[2] = v16;
  v15[3] = 0;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (v8 && (float)(v18 * (float)v8) >= v17)
  {
    uint64_t v19 = *(void *)a1;
    uint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
    if (v20)
    {
LABEL_26:
      void *v15 = *v20;
LABEL_61:
      *uint64_t v20 = v15;
      goto LABEL_62;
    }
  }
  else
  {
    BOOL v21 = 1;
    if (v8 >= 3) {
      BOOL v21 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v22 = v21 | (2 * v8);
    unint64_t v23 = vcvtps_u32_f32(v17 / v18);
    if (v22 <= v23) {
      size_t prime = v23;
    }
    else {
      size_t prime = v22;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
      unint64_t v8 = *(void *)(a1 + 8);
    }
    if (prime > v8) {
      goto LABEL_37;
    }
    if (prime < v8)
    {
      unint64_t v25 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v8 < 3 || (uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v26.i16[0] = vaddlv_u8(v26), v26.u32[0] > 1uLL))
      {
        unint64_t v25 = std::__next_prime(v25);
      }
      else
      {
        uint64_t v27 = 1 << -(char)__clz(v25 - 1);
        if (v25 >= 2) {
          unint64_t v25 = v27;
        }
      }
      if (prime <= v25) {
        size_t prime = v25;
      }
      if (prime < v8) {
LABEL_37:
      }
        std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__do_rehash<true>(a1, prime);
    }
    unint64_t v8 = *(void *)(a1 + 8);
    unint64_t v28 = v8 - 1;
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
      {
        unint64_t v4 = v7 % v8;
        uint64_t v19 = *(void *)a1;
        uint64_t v20 = *(void **)(*(void *)a1 + 8 * (v7 % v8));
        if (v20) {
          goto LABEL_26;
        }
      }
      else
      {
        unint64_t v4 = v7;
        uint64_t v19 = *(void *)a1;
        uint64_t v20 = *(void **)(*(void *)a1 + 8 * v7);
        if (v20) {
          goto LABEL_26;
        }
      }
    }
    else
    {
      unint64_t v4 = v28 & v7;
      uint64_t v19 = *(void *)a1;
      uint64_t v20 = *(void **)(*(void *)a1 + 8 * (v28 & v7));
      if (v20) {
        goto LABEL_26;
      }
    }
  }
  void *v15 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v15;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v15)
  {
    unint64_t v29 = *(void *)(*v15 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v29 >= v8) {
        v29 %= v8;
      }
    }
    else
    {
      v29 &= v8 - 1;
    }
    uint64_t v20 = (void *)(*(void *)a1 + 8 * v29);
    goto LABEL_61;
  }
LABEL_62:
  ++*(void *)(a1 + 24);
  return v15;
}

void sub_21763ABFC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<ft::CinematicTracker>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C78E6E8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ft::CinematicTracker>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C78E6E8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D449420);
}

void std::__shared_ptr_emplace<ft::CinematicTracker>::__on_zero_shared(uint64_t a1)
{
}

void ft::CinematicTracker::CinematicTracker(ft::CinematicTracker *this, FTCinematicConfig *a2)
{
  *(void *)this = a2;
  *((void *)this + 1) = 0;
  uint64_t v3 = *(void *)(MEMORY[0x263F01090] + 16);
  *((_OWORD *)this + 1) = *MEMORY[0x263F01090];
  *((void *)this + 4) = v3;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_DWORD *)this + 18) = 1065353216;
  MEMORY[0x21D449350]((char *)this + 80);
  *((_OWORD *)this + 9) = 0u;
  *((void *)this + 22) = 0;
  *((_OWORD *)this + 10) = 0u;
  uint64_t v4 = 10;
  uint64_t v5 = 0x13E4CCCCDLL;
  operator new();
}

void sub_21763ADB4(_Unwind_Exception *a1)
{
  std::unique_ptr<ft::TrackPool>::~unique_ptr[abi:ne180100](v5);
  std::unique_ptr<ft::TrackMatcher>::~unique_ptr[abi:ne180100]((ft::TrackMatcher **)(v6 + 40));
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100](v6 + 24);
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100](v6 + 8);

  std::recursive_mutex::~recursive_mutex(v4);
  std::unordered_map<long long,CMTime>::~unordered_map[abi:ne180100](v3);

  _Unwind_Resume(a1);
}

void sub_21763AE60()
{
}

ft::TrackPool **std::unique_ptr<ft::TrackPool>::~unique_ptr[abi:ne180100](ft::TrackPool **a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    ft::TrackPool::~TrackPool(v2);
    MEMORY[0x21D449420]();
  }
  return a1;
}

ft::TrackMatcher **std::unique_ptr<ft::TrackMatcher>::~unique_ptr[abi:ne180100](ft::TrackMatcher **a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    ft::TrackMatcher::~TrackMatcher(v2);
    MEMORY[0x21D449420]();
  }
  return a1;
}

uint64_t std::unordered_map<long long,CMTime>::~unordered_map[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void ft::CinematicTracker::~CinematicTracker(ft::CinematicTracker *this)
{
  ft::SiameseRpnSession::~SiameseRpnSession((ft::CinematicTracker *)((char *)this + 200));
  uint64_t v2 = (ft::TrackPool *)*((void *)this + 24);
  *((void *)this + 24) = 0;
  if (v2)
  {
    ft::TrackPool::~TrackPool(v2);
    MEMORY[0x21D449420]();
  }
  uint64_t v3 = (ft::TrackMatcher *)*((void *)this + 23);
  *((void *)this + 23) = 0;
  if (v3)
  {
    ft::TrackMatcher::~TrackMatcher(v3);
    MEMORY[0x21D449420]();
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 22);
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 20);
    if (!v5) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 20);
    if (!v5) {
      goto LABEL_11;
    }
  }
  if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
LABEL_11:

  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)((char *)this + 80));
  uint64_t v6 = (void *)*((void *)this + 7);
  if (v6)
  {
    do
    {
      unint64_t v7 = (void *)*v6;
      operator delete(v6);
      uint64_t v6 = v7;
    }
    while (v7);
  }
  unint64_t v8 = (void *)*((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v8) {
    operator delete(v8);
  }
}

void std::__shared_ptr_emplace<ft::Frame>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C78E720;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ft::Frame>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C78E720;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D449420);
}

void std::__shared_ptr_emplace<ft::Frame>::__on_zero_shared(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 56);
  if (v2)
  {
    *(void *)(a1 + 64) = v2;
    operator delete(v2);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t rtcv::bmBufferPixelFormatTypeFromString(uint64_t a1, _DWORD *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v34, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v34 = *(std::string *)a1;
  }
  if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v3 = (std::string *)((char *)&v34 + HIBYTE(v34.__r_.__value_.__r.__words[2]));
  }
  else {
    uint64_t v3 = (std::string *)(v34.__r_.__value_.__r.__words[0] + v34.__r_.__value_.__l.__size_);
  }
  if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v4 = &v34;
  }
  else {
    uint64_t v4 = (std::string *)v34.__r_.__value_.__r.__words[0];
  }
  for (; v4 != v3; uint64_t v4 = (std::string *)((char *)v4 + 1))
    v4->__r_.__value_.__s.__data_[0] = __tolower(v4->__r_.__value_.__s.__data_[0]);
  if ((atomic_load_explicit((atomic_uchar *volatile)&_MergedGlobals, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&_MergedGlobals))
  {
    int v33 = 0;
    std::pair<std::string const,BmBufferPixelFormatType>::pair[abi:ne180100]<char const(&)[5],BmBufferPixelFormatType,0>(v35, "int8", &v33);
    int v32 = 1;
    std::pair<std::string const,BmBufferPixelFormatType>::pair[abi:ne180100]<char const(&)[5],BmBufferPixelFormatType,0>(&v37, "uint8", &v32);
    int v31 = 2;
    std::pair<std::string const,BmBufferPixelFormatType>::pair[abi:ne180100]<char const(&)[5],BmBufferPixelFormatType,0>(&__p, "uint10", &v31);
    int v30 = 3;
    std::pair<std::string const,BmBufferPixelFormatType>::pair[abi:ne180100]<char const(&)[5],BmBufferPixelFormatType,0>(&v41, "uint12", &v30);
    int v29 = 4;
    std::pair<std::string const,BmBufferPixelFormatType>::pair[abi:ne180100]<char const(&)[5],BmBufferPixelFormatType,0>(&v43, "uint14", &v29);
    int v28 = 5;
    std::pair<std::string const,BmBufferPixelFormatType>::pair[abi:ne180100]<char const(&)[5],BmBufferPixelFormatType,0>(&v45, "uint16", &v28);
    int v27 = 6;
    std::pair<std::string const,BmBufferPixelFormatType>::pair[abi:ne180100]<char const(&)[5],BmBufferPixelFormatType,0>(&v47, "float", &v27);
    int v26 = 7;
    std::pair<std::string const,BmBufferPixelFormatType>::pair[abi:ne180100]<char const(&)[5],BmBufferPixelFormatType,0>(&v49, "half", &v26);
    std::map<std::string,BmBufferPixelFormatType>::map[abi:ne180100]((uint64_t)&unk_26ACF5858, (const void **)v35, 8);
    if (v50 < 0)
    {
      operator delete(v49);
      if ((v48 & 0x80000000) == 0)
      {
LABEL_60:
        if ((v46 & 0x80000000) == 0) {
          goto LABEL_61;
        }
        goto LABEL_69;
      }
    }
    else if ((v48 & 0x80000000) == 0)
    {
      goto LABEL_60;
    }
    operator delete(v47);
    if ((v46 & 0x80000000) == 0)
    {
LABEL_61:
      if ((v44 & 0x80000000) == 0) {
        goto LABEL_62;
      }
      goto LABEL_70;
    }
LABEL_69:
    operator delete(v45);
    if ((v44 & 0x80000000) == 0)
    {
LABEL_62:
      if ((v42 & 0x80000000) == 0) {
        goto LABEL_63;
      }
      goto LABEL_71;
    }
LABEL_70:
    operator delete(v43);
    if ((v42 & 0x80000000) == 0)
    {
LABEL_63:
      if ((v40 & 0x80000000) == 0) {
        goto LABEL_64;
      }
      goto LABEL_72;
    }
LABEL_71:
    operator delete(v41);
    if ((v40 & 0x80000000) == 0)
    {
LABEL_64:
      if ((v38 & 0x80000000) == 0) {
        goto LABEL_65;
      }
      goto LABEL_73;
    }
LABEL_72:
    operator delete(__p);
    if ((v38 & 0x80000000) == 0)
    {
LABEL_65:
      if ((v36 & 0x80000000) == 0)
      {
LABEL_66:
        __cxa_atexit((void (*)(void *))std::map<std::string,BmBufferPixelFormatType>::~map[abi:ne180100], &unk_26ACF5858, &dword_21762A000);
        __cxa_guard_release(&_MergedGlobals);
        goto LABEL_13;
      }
LABEL_74:
      operator delete(v35[0]);
      goto LABEL_66;
    }
LABEL_73:
    operator delete(v37);
    if ((v36 & 0x80000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_74;
  }
LABEL_13:
  uint64_t v5 = qword_26ACF5860;
  char v6 = HIBYTE(v34.__r_.__value_.__r.__words[2]);
  if (qword_26ACF5860)
  {
    std::string::size_type v7 = (v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
       ? HIBYTE(v34.__r_.__value_.__r.__words[2])
       : v34.__r_.__value_.__l.__size_;
    unint64_t v8 = (v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
       ? &v34
       : (std::string *)v34.__r_.__value_.__r.__words[0];
    uint64_t v9 = &qword_26ACF5860;
    do
    {
      int v10 = *(char *)(v5 + 55);
      if (v10 >= 0) {
        size_t v11 = *(unsigned __int8 *)(v5 + 55);
      }
      else {
        size_t v11 = *(void *)(v5 + 40);
      }
      if (v10 >= 0) {
        unint64_t v12 = (const void *)(v5 + 32);
      }
      else {
        unint64_t v12 = *(const void **)(v5 + 32);
      }
      if (v7 >= v11) {
        size_t v13 = v11;
      }
      else {
        size_t v13 = v7;
      }
      int v14 = memcmp(v12, v8, v13);
      BOOL v15 = v11 < v7;
      if (v14) {
        BOOL v15 = v14 < 0;
      }
      BOOL v16 = !v15;
      if (v15) {
        float v17 = (uint64_t *)(v5 + 8);
      }
      else {
        float v17 = (uint64_t *)v5;
      }
      if (v16) {
        uint64_t v9 = (uint64_t *)v5;
      }
      uint64_t v5 = *v17;
    }
    while (*v17);
    if (v9 != &qword_26ACF5860)
    {
      int v18 = *((char *)v9 + 55);
      unint64_t v19 = v18 >= 0 ? *((unsigned __int8 *)v9 + 55) : v9[5];
      uint64_t v20 = v18 >= 0 ? v9 + 4 : (uint64_t *)v9[4];
      size_t v21 = v19 >= v7 ? v7 : v19;
      int v22 = memcmp(v8, v20, v21);
      BOOL v23 = v7 < v19;
      if (v22) {
        BOOL v23 = v22 < 0;
      }
      if (!v23)
      {
        *a2 = *((_DWORD *)v9 + 14);
        uint64_t v24 = 1;
        if ((v6 & 0x80) == 0) {
          return v24;
        }
        goto LABEL_53;
      }
    }
  }
  uint64_t v24 = 0;
  if (v6 < 0) {
LABEL_53:
  }
    operator delete(v34.__r_.__value_.__l.__data_);
  return v24;
}

void sub_21763B590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,__int16 a45,char a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,int a51,__int16 a52,char a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,int a58,__int16 a59,char a60,char a61,uint64_t a62,uint64_t a63)
{
  if (a72 < 0)
  {
    operator delete(v72[28]);
    if ((a68 & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  else if ((a68 & 0x80000000) == 0)
  {
LABEL_3:
    if (a61 < 0) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  operator delete(v72[24]);
  if (a61 < 0)
  {
LABEL_4:
    operator delete(v72[20]);
    if ((a54 & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  if ((a54 & 0x80000000) == 0)
  {
LABEL_5:
    if (a47 < 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  operator delete(v72[16]);
  if (a47 < 0)
  {
LABEL_6:
    operator delete(v72[12]);
    if ((a40 & 0x80000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  if ((a40 & 0x80000000) == 0)
  {
LABEL_7:
    if (a33 < 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  operator delete(a35);
  if (a33 < 0)
  {
LABEL_8:
    operator delete(__p);
    if ((a26 & 0x80000000) == 0)
    {
LABEL_18:
      __cxa_guard_abort(&_MergedGlobals);
      if (a20 < 0) {
        operator delete(a15);
      }
      _Unwind_Resume(a1);
    }
LABEL_17:
    operator delete(a21);
    goto LABEL_18;
  }
LABEL_16:
  if ((a26 & 0x80000000) == 0) {
    goto LABEL_18;
  }
  goto LABEL_17;
}

_DWORD *std::pair<std::string const,BmBufferPixelFormatType>::pair[abi:ne180100]<char const(&)[5],BmBufferPixelFormatType,0>(_DWORD *a1, char *__s, _DWORD *a3)
{
  size_t v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    unint64_t v8 = operator new(v9 + 1);
    *((void *)a1 + 1) = v7;
    *((void *)a1 + 2) = v10 | 0x8000000000000000;
    *(void *)a1 = v8;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v6;
    unint64_t v8 = a1;
    if (!v6) {
      goto LABEL_9;
    }
  }
  memmove(v8, __s, v7);
LABEL_9:
  *((unsigned char *)v8 + v7) = 0;
  a1[6] = *a3;
  return a1;
}

uint64_t std::map<std::string,BmBufferPixelFormatType>::map[abi:ne180100](uint64_t a1, const void **a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 32 * a3;
    do
    {
      std::__tree<std::__value_type<std::string,BmBufferPixelFormatType>,std::__map_value_compare<std::string,std::__value_type<std::string,BmBufferPixelFormatType>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BmBufferPixelFormatType>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,BmBufferPixelFormatType> const&>((uint64_t **)a1, v4, a2, (uint64_t)a2);
      a2 += 4;
      v6 -= 32;
    }
    while (v6);
  }
  return a1;
}

void sub_21763B810(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<std::string,BmBufferPixelFormatType>,std::__map_value_compare<std::string,std::__value_type<std::string,BmBufferPixelFormatType>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BmBufferPixelFormatType>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t std::map<std::string,BmBufferPixelFormatType>::~map[abi:ne180100](uint64_t a1)
{
  return a1;
}

void rtcv::bmBufferPixelFormatTypeToString(int a1@<W0>, std::string *a2@<X8>)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26ACF5850, memory_order_acquire) & 1) == 0)
  {
    uint64_t v6 = a2;
    int v7 = __cxa_guard_acquire(&qword_26ACF5850);
    a2 = v6;
    if (v7)
    {
      int v15 = 0;
      std::pair<BmBufferPixelFormatType const,std::string>::pair[abi:ne180100]<BmBufferPixelFormatType,char const(&)[5],0>((uint64_t)&v16, &v15, "int8");
      int v14 = 1;
      std::pair<BmBufferPixelFormatType const,std::string>::pair[abi:ne180100]<BmBufferPixelFormatType,char const(&)[5],0>((uint64_t)&v19, &v14, "uint8");
      int v13 = 2;
      std::pair<BmBufferPixelFormatType const,std::string>::pair[abi:ne180100]<BmBufferPixelFormatType,char const(&)[5],0>((uint64_t)&v22, &v13, "uint10");
      int v12 = 3;
      std::pair<BmBufferPixelFormatType const,std::string>::pair[abi:ne180100]<BmBufferPixelFormatType,char const(&)[5],0>((uint64_t)&v25, &v12, "uint12");
      int v11 = 4;
      std::pair<BmBufferPixelFormatType const,std::string>::pair[abi:ne180100]<BmBufferPixelFormatType,char const(&)[5],0>((uint64_t)&v28, &v11, "uint14");
      int v10 = 5;
      std::pair<BmBufferPixelFormatType const,std::string>::pair[abi:ne180100]<BmBufferPixelFormatType,char const(&)[5],0>((uint64_t)&v31, &v10, "uint16");
      int v9 = 6;
      std::pair<BmBufferPixelFormatType const,std::string>::pair[abi:ne180100]<BmBufferPixelFormatType,char const(&)[5],0>((uint64_t)&v34, &v9, "float");
      int v8 = 7;
      std::pair<BmBufferPixelFormatType const,std::string>::pair[abi:ne180100]<BmBufferPixelFormatType,char const(&)[5],0>((uint64_t)&v37, &v8, "half");
      std::map<BmBufferPixelFormatType,std::string>::map[abi:ne180100]((uint64_t)&unk_26ACF5870, &v16, 8);
      if (v39 < 0)
      {
        operator delete(__p);
        if ((v36 & 0x80000000) == 0)
        {
LABEL_15:
          if ((v33 & 0x80000000) == 0) {
            goto LABEL_16;
          }
          goto LABEL_24;
        }
      }
      else if ((v36 & 0x80000000) == 0)
      {
        goto LABEL_15;
      }
      operator delete(v35);
      if ((v33 & 0x80000000) == 0)
      {
LABEL_16:
        if ((v30 & 0x80000000) == 0) {
          goto LABEL_17;
        }
        goto LABEL_25;
      }
LABEL_24:
      operator delete(v32);
      if ((v30 & 0x80000000) == 0)
      {
LABEL_17:
        if ((v27 & 0x80000000) == 0) {
          goto LABEL_18;
        }
        goto LABEL_26;
      }
LABEL_25:
      operator delete(v29);
      if ((v27 & 0x80000000) == 0)
      {
LABEL_18:
        if ((v24 & 0x80000000) == 0) {
          goto LABEL_19;
        }
        goto LABEL_27;
      }
LABEL_26:
      operator delete(v26);
      if ((v24 & 0x80000000) == 0)
      {
LABEL_19:
        if ((v21 & 0x80000000) == 0) {
          goto LABEL_20;
        }
        goto LABEL_28;
      }
LABEL_27:
      operator delete(v23);
      if ((v21 & 0x80000000) == 0)
      {
LABEL_20:
        if ((v18 & 0x80000000) == 0)
        {
LABEL_21:
          __cxa_atexit((void (*)(void *))std::map<BmBufferPixelFormatType,std::string>::~map[abi:ne180100], &unk_26ACF5870, &dword_21762A000);
          __cxa_guard_release(&qword_26ACF5850);
          a2 = v6;
          goto LABEL_2;
        }
LABEL_29:
        operator delete(v17);
        goto LABEL_21;
      }
LABEL_28:
      operator delete(v20);
      if ((v18 & 0x80000000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_29;
    }
  }
LABEL_2:
  uint64_t v3 = qword_26ACF5878;
  if (!qword_26ACF5878) {
LABEL_8:
  }
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  while (1)
  {
    while (1)
    {
      int v4 = *(_DWORD *)(v3 + 32);
      if (v4 <= a1) {
        break;
      }
      uint64_t v3 = *(void *)v3;
      if (!v3) {
        goto LABEL_8;
      }
    }
    if (v4 >= a1) {
      break;
    }
    uint64_t v3 = *(void *)(v3 + 8);
    if (!v3) {
      goto LABEL_8;
    }
  }
  if (*(char *)(v3 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)(v3 + 40), *(void *)(v3 + 48));
  }
  else
  {
    long long v5 = *(_OWORD *)(v3 + 40);
    a2->__r_.__value_.__r.__words[2] = *(void *)(v3 + 56);
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v5;
  }
}

void sub_21763BB60(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _Unwind_Exception *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *__p,uint64_t a51,int a52,__int16 a53,char a54,char a55)
{
  if (a55 < 0) {
    operator delete(__p);
  }
  rtcv::bmBufferPixelFormatTypeToString((uint64_t)&a21, a1, a2, (uint64_t)&a15, &a20);
  unint64_t v58 = a15;
  if (&a21 != v55 && a20)
  {
    do
    {
      if (*(v55 - 1) < 0) {
        operator delete(*((void **)v55 - 3));
      }
      v55 -= 32;
    }
    while (v55 != &a21);
  }
  __cxa_guard_abort(&qword_26ACF5850);
  _Unwind_Resume(v58);
}

uint64_t std::pair<BmBufferPixelFormatType const,std::string>::pair[abi:ne180100]<BmBufferPixelFormatType,char const(&)[5],0>(uint64_t a1, _DWORD *a2, char *__s)
{
  *(_DWORD *)a1 = *a2;
  long long v5 = (void *)(a1 + 8);
  size_t v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v8 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v8 = v6 | 7;
    }
    uint64_t v9 = v8 + 1;
    long long v5 = operator new(v8 + 1);
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v9 | 0x8000000000000000;
    *(void *)(a1 + 8) = v5;
  }
  else
  {
    *(unsigned char *)(a1 + 31) = v6;
    if (!v6) {
      goto LABEL_9;
    }
  }
  memmove(v5, __s, v7);
LABEL_9:
  *((unsigned char *)v5 + v7) = 0;
  return a1;
}

uint64_t std::map<BmBufferPixelFormatType,std::string>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  int v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 32 * a3;
    do
    {
      std::__tree<std::__value_type<BmBufferPixelFormatType,std::string>,std::__map_value_compare<BmBufferPixelFormatType,std::__value_type<BmBufferPixelFormatType,std::string>,std::less<BmBufferPixelFormatType>,true>,std::allocator<std::__value_type<BmBufferPixelFormatType,std::string>>>::__emplace_hint_unique_key_args<BmBufferPixelFormatType,std::pair<BmBufferPixelFormatType const,std::string> const&>((void **)a1, v4, a2, (uint64_t)a2);
      a2 += 8;
      v6 -= 32;
    }
    while (v6);
  }
  return a1;
}

void sub_21763BD34(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<BmBufferPixelFormatType,std::string>,std::__map_value_compare<BmBufferPixelFormatType,std::__value_type<BmBufferPixelFormatType,std::string>,std::less<BmBufferPixelFormatType>,true>,std::allocator<std::__value_type<BmBufferPixelFormatType,std::string>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t std::map<BmBufferPixelFormatType,std::string>::~map[abi:ne180100](uint64_t a1)
{
  return a1;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  long long v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    long long v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

char *std::__tree<std::__value_type<std::string,BmBufferPixelFormatType>,std::__map_value_compare<std::string,std::__value_type<std::string,BmBufferPixelFormatType>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BmBufferPixelFormatType>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,BmBufferPixelFormatType> const&>(uint64_t **a1, uint64_t *a2, const void **a3, uint64_t a4)
{
  std::string::size_type v6 = std::__tree<std::__value_type<std::string,BmBufferPixelFormatType>,std::__map_value_compare<std::string,std::__value_type<std::string,BmBufferPixelFormatType>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BmBufferPixelFormatType>>>::__find_equal<std::string>(a1, a2, &v15, &v14, a3);
  if (*v6) {
    return (char *)*v6;
  }
  uint64_t v8 = v6;
  uint64_t v9 = (char *)operator new(0x40uLL);
  int v10 = (std::string *)(v9 + 32);
  if (*(char *)(a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)a4, *(void *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = *(_OWORD *)a4;
    *((void *)v9 + 6) = *(void *)(a4 + 16);
  }
  *((_DWORD *)v9 + 14) = *(_DWORD *)(a4 + 24);
  int v11 = v15;
  *(void *)uint64_t v9 = 0;
  *((void *)v9 + 1) = 0;
  *((void *)v9 + 2) = v11;
  *uint64_t v8 = (uint64_t)v9;
  int v12 = (uint64_t *)**a1;
  int v13 = (uint64_t *)v9;
  if (v12)
  {
    *a1 = v12;
    int v13 = (uint64_t *)*v8;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v13);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return v9;
}

void sub_21763BF04(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,BmBufferPixelFormatType>,std::__map_value_compare<std::string,std::__value_type<std::string,BmBufferPixelFormatType>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BmBufferPixelFormatType>>>::__find_equal<std::string>(uint64_t **a1, uint64_t *a2, uint64_t **a3, uint64_t **a4, const void **a5)
{
  uint64_t v8 = a1 + 1;
  if (a1 + 1 == (uint64_t **)a2) {
    goto LABEL_20;
  }
  int v10 = *((char *)a2 + 55);
  int v11 = *((char *)a5 + 23);
  if (v11 >= 0) {
    size_t v12 = *((unsigned __int8 *)a5 + 23);
  }
  else {
    size_t v12 = (size_t)a5[1];
  }
  if (v11 >= 0) {
    int v13 = a5;
  }
  else {
    int v13 = *a5;
  }
  if (v10 >= 0) {
    size_t v14 = *((unsigned __int8 *)a2 + 55);
  }
  else {
    size_t v14 = a2[5];
  }
  if (v10 >= 0) {
    int v15 = a2 + 4;
  }
  else {
    int v15 = (const void *)a2[4];
  }
  if (v14 >= v12) {
    size_t v16 = v12;
  }
  else {
    size_t v16 = v14;
  }
  int v17 = memcmp(v13, v15, v16);
  BOOL v18 = v12 < v14;
  if (v17) {
    BOOL v18 = v17 < 0;
  }
  if (v18)
  {
LABEL_20:
    uint64_t v19 = (uint64_t *)*a2;
    if (*a1 == a2)
    {
      char v21 = a2;
LABEL_53:
      if (v19)
      {
        *a3 = v21;
        return v21 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v19)
    {
      uint64_t v20 = (uint64_t *)*a2;
      do
      {
        char v21 = v20;
        uint64_t v20 = (uint64_t *)v20[1];
      }
      while (v20);
    }
    else
    {
      int v26 = a2;
      do
      {
        char v21 = (uint64_t *)v26[2];
        BOOL v27 = *v21 == (void)v26;
        int v26 = v21;
      }
      while (v27);
    }
    int v28 = *((char *)a5 + 23);
    int v29 = *((char *)v21 + 55);
    if (v29 >= 0) {
      size_t v30 = *((unsigned __int8 *)v21 + 55);
    }
    else {
      size_t v30 = v21[5];
    }
    if (v29 >= 0) {
      uint64_t v31 = v21 + 4;
    }
    else {
      uint64_t v31 = (const void *)v21[4];
    }
    if (v28 >= 0) {
      size_t v32 = *((unsigned __int8 *)a5 + 23);
    }
    else {
      size_t v32 = (size_t)a5[1];
    }
    if (v28 >= 0) {
      char v33 = a5;
    }
    else {
      char v33 = *a5;
    }
    if (v32 >= v30) {
      size_t v34 = v30;
    }
    else {
      size_t v34 = v32;
    }
    int v35 = memcmp(v31, v33, v34);
    BOOL v36 = v30 < v32;
    if (v35) {
      BOOL v36 = v35 < 0;
    }
    if (v36) {
      goto LABEL_53;
    }
    uint64_t v37 = *v8;
    if (*v8)
    {
      do
      {
        while (1)
        {
          char v38 = (uint64_t **)v37;
          unint64_t v41 = (const void *)v37[4];
          char v39 = v37 + 4;
          uint64_t v40 = v41;
          int v42 = *((char *)v39 + 23);
          if (v42 >= 0) {
            size_t v43 = *((unsigned __int8 *)v39 + 23);
          }
          else {
            size_t v43 = v39[1];
          }
          if (v42 >= 0) {
            char v44 = v39;
          }
          else {
            char v44 = v40;
          }
          if (v43 >= v32) {
            size_t v45 = v32;
          }
          else {
            size_t v45 = v43;
          }
          int v46 = memcmp(v33, v44, v45);
          BOOL v47 = v32 < v43;
          if (v46) {
            BOOL v47 = v46 < 0;
          }
          if (!v47) {
            break;
          }
          uint64_t v37 = *v38;
          uint64_t v8 = v38;
          if (!*v38) {
            goto LABEL_74;
          }
        }
        int v48 = memcmp(v44, v33, v45);
        BOOL v49 = v43 < v32;
        if (v48) {
          BOOL v49 = v48 < 0;
        }
        if (!v49) {
          break;
        }
        uint64_t v8 = v38 + 1;
        uint64_t v37 = v38[1];
      }
      while (v37);
    }
    else
    {
      char v38 = v8;
    }
LABEL_74:
    *a3 = (uint64_t *)v38;
    return (uint64_t *)v8;
  }
  int v22 = memcmp(v15, v13, v16);
  BOOL v23 = v14 < v12;
  if (v22) {
    BOOL v23 = v22 < 0;
  }
  if (!v23)
  {
    *a3 = a2;
    *a4 = a2;
    return (uint64_t *)a4;
  }
  uint64_t v24 = a2[1];
  if (v24)
  {
    uint64_t v25 = (uint64_t *)a2[1];
    do
    {
      a4 = (uint64_t **)v25;
      uint64_t v25 = (uint64_t *)*v25;
    }
    while (v25);
  }
  else
  {
    char v50 = a2;
    do
    {
      a4 = (uint64_t **)v50[2];
      BOOL v27 = *a4 == v50;
      char v50 = (uint64_t *)a4;
    }
    while (!v27);
  }
  if (a4 != v8)
  {
    int v51 = *((char *)a4 + 55);
    if (v51 >= 0) {
      size_t v52 = *((unsigned __int8 *)a4 + 55);
    }
    else {
      size_t v52 = (size_t)a4[5];
    }
    if (v51 >= 0) {
      uint64_t v53 = (uint64_t *)(a4 + 4);
    }
    else {
      uint64_t v53 = a4[4];
    }
    if (v52 >= v12) {
      size_t v54 = v12;
    }
    else {
      size_t v54 = v52;
    }
    int v55 = memcmp(v13, v53, v54);
    BOOL v56 = v12 < v52;
    if (v55) {
      BOOL v56 = v55 < 0;
    }
    if (!v56)
    {
      unint64_t v57 = *v8;
      if (*v8)
      {
        unint64_t v58 = a3;
        do
        {
          while (1)
          {
            unint64_t v59 = (uint64_t **)v57;
            unint64_t v62 = (const void *)v57[4];
            unint64_t v60 = v57 + 4;
            uint64_t v61 = v62;
            int v63 = *((char *)v60 + 23);
            if (v63 >= 0) {
              size_t v64 = *((unsigned __int8 *)v60 + 23);
            }
            else {
              size_t v64 = v60[1];
            }
            if (v63 >= 0) {
              float v65 = v60;
            }
            else {
              float v65 = v61;
            }
            if (v64 >= v12) {
              size_t v66 = v12;
            }
            else {
              size_t v66 = v64;
            }
            int v67 = memcmp(v13, v65, v66);
            BOOL v68 = v12 < v64;
            if (v67) {
              BOOL v68 = v67 < 0;
            }
            if (!v68) {
              break;
            }
            unint64_t v57 = *v59;
            uint64_t v8 = v59;
            if (!*v59) {
              goto LABEL_119;
            }
          }
          int v69 = memcmp(v65, v13, v66);
          BOOL v70 = v64 < v12;
          if (v69) {
            BOOL v70 = v69 < 0;
          }
          if (!v70) {
            break;
          }
          uint64_t v8 = v59 + 1;
          unint64_t v57 = v59[1];
        }
        while (v57);
      }
      else
      {
        unint64_t v59 = v8;
        unint64_t v58 = a3;
      }
LABEL_119:
      *unint64_t v58 = (uint64_t *)v59;
      return (uint64_t *)v8;
    }
  }
  if (v24)
  {
    *a3 = (uint64_t *)a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return (uint64_t *)a4;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 == result) {
    return result;
  }
  while (1)
  {
    uint64_t v2 = a2[2];
    if (*(unsigned char *)(v2 + 24)) {
      return result;
    }
    uint64_t v3 = *(uint64_t **)(v2 + 16);
    uint64_t v4 = *v3;
    if (*v3 != v2) {
      break;
    }
    uint64_t v7 = v3[1];
    if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), long long v5 = (unsigned char *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(unsigned char *)(v2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        uint64_t *v3 = v11;
        if (v11) {
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v9 = *(uint64_t **)(v2 + 8);
        uint64_t v10 = *v9;
        *(void *)(v2 + 8) = *v9;
        if (v10)
        {
          *(void *)(v10 + 16) = v2;
          uint64_t v3 = *(uint64_t **)(v2 + 16);
        }
        v9[2] = (uint64_t)v3;
        *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = v9;
        *uint64_t v9 = v2;
        *(void *)(v2 + 16) = v9;
        uint64_t v3 = (uint64_t *)v9[2];
        uint64_t v2 = *v3;
        *((unsigned char *)v9 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        uint64_t *v3 = v11;
        if (v11) {
LABEL_15:
        }
          *(void *)(v11 + 16) = v3;
      }
      *(void *)(v2 + 16) = v3[2];
      *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
      *(void *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }
LABEL_3:
    *(unsigned char *)(v2 + 24) = 1;
    a2 = v3;
    *((unsigned char *)v3 + 24) = v3 == result;
    *long long v5 = 1;
    if (v3 == result) {
      return result;
    }
  }
  if (v4)
  {
    int v6 = *(unsigned __int8 *)(v4 + 24);
    long long v5 = (unsigned char *)(v4 + 24);
    if (!v6) {
      goto LABEL_3;
    }
  }
  if (*(uint64_t **)v2 == a2)
  {
    uint64_t v12 = a2[1];
    *(void *)uint64_t v2 = v12;
    if (v12)
    {
      *(void *)(v12 + 16) = v2;
      uint64_t v3 = *(uint64_t **)(v2 + 16);
    }
    a2[2] = (uint64_t)v3;
    *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(void *)(v2 + 16) = a2;
    uint64_t v3 = (uint64_t *)a2[2];
  }
  else
  {
    a2 = (uint64_t *)a2[2];
  }
  *((unsigned char *)a2 + 24) = 1;
  *((unsigned char *)v3 + 24) = 0;
  int v13 = (uint64_t *)v3[1];
  uint64_t v14 = *v13;
  v3[1] = *v13;
  if (v14) {
    *(void *)(v14 + 16) = v3;
  }
  v13[2] = v3[2];
  *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v13;
  *int v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

void std::__tree<std::__value_type<std::string,BmBufferPixelFormatType>,std::__map_value_compare<std::string,std::__value_type<std::string,BmBufferPixelFormatType>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BmBufferPixelFormatType>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,BmBufferPixelFormatType>,std::__map_value_compare<std::string,std::__value_type<std::string,BmBufferPixelFormatType>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BmBufferPixelFormatType>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<std::string,BmBufferPixelFormatType>,std::__map_value_compare<std::string,std::__value_type<std::string,BmBufferPixelFormatType>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BmBufferPixelFormatType>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[55] < 0)
    {
      operator delete(*((void **)a2 + 4));
      uint64_t v4 = a2;
    }
    else
    {
      uint64_t v4 = a2;
    }
    operator delete(v4);
  }
}

char *std::__tree<std::__value_type<BmBufferPixelFormatType,std::string>,std::__map_value_compare<BmBufferPixelFormatType,std::__value_type<BmBufferPixelFormatType,std::string>,std::less<BmBufferPixelFormatType>,true>,std::allocator<std::__value_type<BmBufferPixelFormatType,std::string>>>::__emplace_hint_unique_key_args<BmBufferPixelFormatType,std::pair<BmBufferPixelFormatType const,std::string> const&>(void **a1, uint64_t *a2, int *a3, uint64_t a4)
{
  int v6 = std::__tree<std::__value_type<BmBufferPixelFormatType,std::string>,std::__map_value_compare<BmBufferPixelFormatType,std::__value_type<BmBufferPixelFormatType,std::string>,std::less<BmBufferPixelFormatType>,true>,std::allocator<std::__value_type<BmBufferPixelFormatType,std::string>>>::__find_equal<BmBufferPixelFormatType>(a1, a2, &v15, &v14, a3);
  if (*v6) {
    return (char *)*v6;
  }
  int v8 = v6;
  uint64_t v9 = (char *)operator new(0x40uLL);
  *((_DWORD *)v9 + 8) = *(_DWORD *)a4;
  uint64_t v10 = (std::string *)(v9 + 40);
  if (*(char *)(a4 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)(a4 + 8), *(void *)(a4 + 16));
  }
  else
  {
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = *(_OWORD *)(a4 + 8);
    *((void *)v9 + 7) = *(void *)(a4 + 24);
  }
  uint64_t v11 = v15;
  *(void *)uint64_t v9 = 0;
  *((void *)v9 + 1) = 0;
  *((void *)v9 + 2) = v11;
  *int v8 = (uint64_t)v9;
  uint64_t v12 = (void *)**a1;
  int v13 = (uint64_t *)v9;
  if (v12)
  {
    *a1 = v12;
    int v13 = (uint64_t *)*v8;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v13);
  a1[2] = (void *)((char *)a1[2] + 1);
  return v9;
}

void sub_21763C63C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<BmBufferPixelFormatType,std::string>,std::__map_value_compare<BmBufferPixelFormatType,std::__value_type<BmBufferPixelFormatType,std::string>,std::less<BmBufferPixelFormatType>,true>,std::allocator<std::__value_type<BmBufferPixelFormatType,std::string>>>::__find_equal<BmBufferPixelFormatType>(void *a1, uint64_t *a2, uint64_t **a3, uint64_t **a4, int *a5)
{
  long long v5 = a1 + 1;
  if (a1 + 1 == a2 || (int v6 = *a5, v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    int v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      uint64_t v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        uint64_t v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      uint64_t v14 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v14[2];
        BOOL v15 = *v10 == (void)v14;
        uint64_t v14 = v10;
      }
      while (v15);
    }
    int v16 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5) {
      goto LABEL_17;
    }
    uint64_t v18 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v19 = (uint64_t *)v18;
          int v20 = *(_DWORD *)(v18 + 32);
          if (v16 >= v20) {
            break;
          }
          uint64_t v18 = *v19;
          long long v5 = v19;
          if (!*v19) {
            goto LABEL_25;
          }
        }
        if (v20 >= v16) {
          break;
        }
        long long v5 = v19 + 1;
        uint64_t v18 = v19[1];
      }
      while (v18);
LABEL_25:
      *a3 = v19;
      return v5;
    }
    else
    {
      *a3 = v5;
      return a1 + 1;
    }
  }
  else if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return (uint64_t *)a4;
  }
  else
  {
    uint64_t v11 = a2[1];
    if (v11)
    {
      uint64_t v12 = (uint64_t *)a2[1];
      do
      {
        int v13 = v12;
        uint64_t v12 = (uint64_t *)*v12;
      }
      while (v12);
    }
    else
    {
      char v21 = a2;
      do
      {
        int v13 = (uint64_t *)v21[2];
        BOOL v15 = *v13 == (void)v21;
        char v21 = v13;
      }
      while (!v15);
    }
    if (v13 == v5 || v6 < *((_DWORD *)v13 + 8))
    {
      if (v11)
      {
        *a3 = v13;
        return v13;
      }
      else
      {
        *a3 = a2;
        return a2 + 1;
      }
    }
    else
    {
      uint64_t v22 = *v5;
      if (*v5)
      {
        do
        {
          while (1)
          {
            BOOL v23 = (uint64_t *)v22;
            int v24 = *(_DWORD *)(v22 + 32);
            if (v6 >= v24) {
              break;
            }
            uint64_t v22 = *v23;
            long long v5 = v23;
            if (!*v23) {
              goto LABEL_41;
            }
          }
          if (v24 >= v6) {
            break;
          }
          long long v5 = v23 + 1;
          uint64_t v22 = v23[1];
        }
        while (v22);
LABEL_41:
        *a3 = v23;
        return v5;
      }
      else
      {
        *a3 = v5;
        return a1 + 1;
      }
    }
  }
}

void std::__tree<std::__value_type<BmBufferPixelFormatType,std::string>,std::__map_value_compare<BmBufferPixelFormatType,std::__value_type<BmBufferPixelFormatType,std::string>,std::less<BmBufferPixelFormatType>,true>,std::allocator<std::__value_type<BmBufferPixelFormatType,std::string>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<BmBufferPixelFormatType,std::string>,std::__map_value_compare<BmBufferPixelFormatType,std::__value_type<BmBufferPixelFormatType,std::string>,std::less<BmBufferPixelFormatType>,true>,std::allocator<std::__value_type<BmBufferPixelFormatType,std::string>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<BmBufferPixelFormatType,std::string>,std::__map_value_compare<BmBufferPixelFormatType,std::__value_type<BmBufferPixelFormatType,std::string>,std::less<BmBufferPixelFormatType>,true>,std::allocator<std::__value_type<BmBufferPixelFormatType,std::string>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[63] < 0)
    {
      operator delete(*((void **)a2 + 5));
      uint64_t v4 = a2;
    }
    else
    {
      uint64_t v4 = a2;
    }
    operator delete(v4);
  }
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264294C38, MEMORY[0x263F8C068]);
}

void sub_21763C8CC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  unint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

id ft::GetOsLog(ft *this)
{
  if (ft::GetOsLog(void)::token == -1)
  {
    uint64_t v1 = (void *)ft::GetOsLog(void)::os_log;
  }
  else
  {
    dispatch_once(&ft::GetOsLog(void)::token, &__block_literal_global);
    uint64_t v1 = (void *)ft::GetOsLog(void)::os_log;
  }
  return v1;
}

uint64_t ___ZN2ft8GetOsLogEv_block_invoke()
{
  ft::GetOsLog(void)::os_log = (uint64_t)os_log_create("com.apple.FusionTracker", "default");

  return MEMORY[0x270F9A758]();
}

void *ft::UserDefaults::Get(ft::UserDefaults *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26ACF5890, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(&qword_26ACF5890))
  {
    return &_MergedGlobals_0;
  }
  ft::UserDefaults::UserDefaults((ft::UserDefaults *)&_MergedGlobals_0);
  __cxa_guard_release(&qword_26ACF5890);
  return &_MergedGlobals_0;
}

void sub_21763CA38(_Unwind_Exception *a1)
{
}

ft::UserDefaults *ft::UserDefaults::UserDefaults(ft::UserDefaults *this)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.coremedia"];
  *(unsigned char *)this = [v2 BOOLForKey:@"enable_tap_to_track_overlap_with_isp_mitigation"];
  uint64_t v3 = (ft *)[v2 integerForKey:@"ttt_rpn_precision_level"];
  int v4 = (int)v3;
  if ((v3 - 1) >= 5) {
    int v5 = 3;
  }
  else {
    int v5 = (int)v3;
  }
  *((_DWORD *)this + 1) = v5;
  int v6 = ft::GetOsLog(v3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = *((_DWORD *)this + 1);
    v9[0] = 67109376;
    v9[1] = v7;
    __int16 v10 = 1024;
    int v11 = v4;
    _os_log_impl(&dword_21762A000, v6, OS_LOG_TYPE_INFO, "RPN Precision Level set to %d (defaults value: %d)", (uint8_t *)v9, 0xEu);
  }

  return this;
}

void sub_21763CB6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21763CB7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21763CB8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t simResizeVisPipeBinning(uint64_t a1, uint64_t *a2, float a3, float a4, float a5, float a6)
{
  if (a5 != 0.0 || a6 != 0.0) {
    simResizeVisPipeBinning();
  }
  unsigned int v6 = vcvtas_u32_f32(1.0 / a3);
  uint64_t v7 = (1 << v6) & 0x116;
  if (v6 > 8 || v7 == 0) {
    simResizeVisPipeBinning();
  }
  LODWORD(v7) = vcvtas_u32_f32(1.0 / a4);
  if (v7 > 8 || ((1 << v7) & 0x116) == 0) {
    simResizeVisPipeBinning();
  }
  unsigned int v10 = *(_DWORD *)(a1 + 12);
  LODWORD(v11) = (v10 / v6) & 0xFFFFFFFE;
  unsigned int v12 = *((_DWORD *)a2 + 2);
  unsigned int v13 = *((_DWORD *)a2 + 3);
  if (v13 >= v11) {
    uint64_t v11 = v11;
  }
  else {
    uint64_t v11 = v13;
  }
  LODWORD(v14) = *(_DWORD *)(a1 + 8) / v7;
  if (v12 >= v14) {
    uint64_t v14 = v14;
  }
  else {
    uint64_t v14 = v12;
  }
  uint64_t v69 = v14;
  if (v14)
  {
    if (v13)
    {
      if (v11)
      {
        uint64_t v68 = *a2;
        int v67 = *((_DWORD *)a2 + 4);
        unsigned int v15 = v6 >> 1;
        unsigned int v16 = v7 >> 1;
        unsigned int v17 = v7 - 1;
        uint64_t v18 = v6 - 1;
        if (v18 >= 0xF)
        {
          unint64_t v34 = 0;
          unsigned int v35 = 0;
          int v36 = 0;
          uint64_t v37 = v18 + 1;
          uint64_t v38 = (v18 + 1) & 0x1FFFFFFF0;
          while (v34 < *((unsigned int *)a2 + 2))
          {
            unsigned int v39 = 0;
            uint64_t v40 = 0;
            unint64_t v41 = (_WORD *)(v68 + (v67 * v34));
            unint64_t v66 = v34;
            int v42 = v34 * v7;
            do
            {
              if (v10 <= v40 * v6) {
                goto LABEL_60;
              }
              unsigned int v44 = *(_DWORD *)(a1 + 8);
              if (v44 <= v35) {
                unsigned int v44 = v35;
              }
              if (v36 + v44 <= v17) {
LABEL_60:
              }
                simResizeVisPipeBinning();
              uint64_t v45 = 0;
              int v46 = 0;
              int v47 = *(_DWORD *)(a1 + 16);
              unsigned int v48 = v35 * v47;
              do
              {
                BOOL v49 = (uint16x8_t *)(*(void *)a1 + 2 * v39 + 16 + v48);
                char v50 = (unsigned __int16 *)(*(void *)a1
                                         + 2 * v40 * v6
                                         + 2 * v38
                                         + (v47 * (v42 + v45)));
                int32x4_t v51 = 0uLL;
                uint64_t v52 = v38;
                int32x4_t v53 = 0uLL;
                int32x4_t v54 = 0uLL;
                int32x4_t v55 = 0uLL;
                do
                {
                  uint16x8_t v56 = v49[-1];
                  int32x4_t v53 = (int32x4_t)vaddw_high_u16((uint32x4_t)v53, v56);
                  int32x4_t v51 = (int32x4_t)vaddw_u16((uint32x4_t)v51, *(uint16x4_t *)v56.i8);
                  int32x4_t v55 = (int32x4_t)vaddw_high_u16((uint32x4_t)v55, *v49);
                  int32x4_t v54 = (int32x4_t)vaddw_u16((uint32x4_t)v54, *(uint16x4_t *)v49->i8);
                  v49 += 2;
                  v52 -= 16;
                }
                while (v52);
                int v57 = vaddvq_s32(vaddq_s32(vaddq_s32(v54, v51), vaddq_s32(v55, v53)));
                if (v37 != v38)
                {
                  int v58 = v6 - v38;
                  do
                  {
                    int v59 = *v50++;
                    v57 += v59;
                    --v58;
                  }
                  while (v58);
                }
                v46 += (v57 + v15) / v6;
                ++v45;
                v48 += v47;
              }
              while (v45 != v7);
              signed int v43 = (v46 + v16) / v7;
              if (v43 >= 0xFFFF) {
                signed int v43 = 0xFFFF;
              }
              *v41++ = v43 & ~(unsigned __int16)(v43 >> 31);
              ++v40;
              v39 += v6;
            }
            while (v40 != v11);
            unint64_t v34 = v66 + 1;
            v36 -= v7;
            v35 += v7;
            if (v66 + 1 == v69) {
              return 1;
            }
          }
        }
        else
        {
          unint64_t v19 = 0;
          unsigned int v20 = 0;
          int v21 = 0;
          while (v19 < *((unsigned int *)a2 + 2))
          {
            uint64_t v22 = 0;
            BOOL v23 = (_WORD *)(v68 + (v67 * v19));
            do
            {
              if (v10 <= v22 * v6) {
                goto LABEL_60;
              }
              unsigned int v24 = *(_DWORD *)(a1 + 8);
              if (v24 <= v20) {
                unsigned int v24 = v20;
              }
              if (v21 + v24 <= v17) {
                goto LABEL_60;
              }
              uint64_t v25 = 0;
              int v26 = 0;
              do
              {
                int v27 = 0;
                int v28 = (unsigned __int16 *)(*(void *)a1
                                         + 2 * v22 * v6
                                         + (*(_DWORD *)(a1 + 16) * (v19 * v7 + v25)));
                unsigned int v29 = v6;
                do
                {
                  int v30 = *v28++;
                  v27 += v30;
                  --v29;
                }
                while (v29);
                v26 += (v27 + v15) / v6;
                ++v25;
              }
              while (v25 != v7);
              signed int v31 = (v26 + v16) / v7;
              if (v31 >= 0xFFFF) {
                signed int v31 = 0xFFFF;
              }
              *v23++ = v31 & ~(unsigned __int16)(v31 >> 31);
              ++v22;
            }
            while (v22 != v11);
            ++v19;
            v21 -= v7;
            v20 += v7;
            if (v19 == v69) {
              return 1;
            }
          }
        }
      }
      else
      {
        unsigned int v32 = v14 - 1;
        if ((int)v14 - 1 >= v12) {
          unsigned int v32 = *((_DWORD *)a2 + 2);
        }
        if (v32 > 0x1F)
        {
          unsigned int v60 = v32 + 1;
          int v61 = v60 & 0x1F;
          if ((v60 & 0x1F) == 0) {
            int v61 = 32;
          }
          unsigned int v33 = v60 - v61;
          unsigned int v62 = v33;
          do
            v62 -= 32;
          while (v62);
        }
        else
        {
          unsigned int v33 = 0;
        }
        unsigned int v63 = v12 - v33;
        int v64 = v14 - v33;
        while (v63)
        {
          --v63;
          if (!--v64) {
            return 1;
          }
        }
      }
    }
    simResizeVisPipeBinning();
  }
  return 1;
}

uint64_t simResizeVisPipeArea(uint64_t *a1, uint64_t *a2, uint64_t *a3, float a4, float a5, float a6, float a7)
{
  uint64_t v9 = *((unsigned int *)a2 + 3);
  uint64_t v77 = *((unsigned int *)a2 + 2);
  uint64_t v84 = *((unsigned int *)a1 + 2);
  if (!v84) {
    goto LABEL_48;
  }
  int v10 = *((_DWORD *)a1 + 3);
  if (!v10) {
    goto LABEL_97;
  }
  if (!*((_DWORD *)a3 + 3)) {
    goto LABEL_98;
  }
  if (v9)
  {
    unint64_t v11 = 0;
    unsigned int v12 = vcvtas_u32_f32(65536.0 / a4);
    LODWORD(v7) = vcvtas_u32_f32(a4 * 65536.0);
    uint64_t v8 = vcvtas_u32_f32(a6 * 8.0) << 13;
    uint64_t v82 = *a1;
    int v80 = *((_DWORD *)a1 + 4);
    uint64_t v79 = *a3;
    unsigned int v13 = v10 - 1;
    int v14 = *((_DWORD *)a3 + 4);
    while (v11 < *((unsigned int *)a1 + 2))
    {
      if (v11 >= *((unsigned int *)a3 + 2)) {
        goto LABEL_98;
      }
      int v15 = 0;
      uint64_t v16 = v82 + (v80 * v11);
      unsigned int v17 = (_WORD *)(v79 + (v14 * v11));
      unsigned int v18 = v8 + v12;
      unsigned int v19 = v8;
      do
      {
        unsigned int v25 = HIWORD(v19);
        unsigned int v26 = HIWORD(v19) + 1;
        int v27 = 0x10000 - (unsigned __int16)v19;
        v19 += v12;
        unsigned int v28 = HIWORD(v19);
        if (v13 >= v25) {
          unsigned int v29 = v25;
        }
        else {
          unsigned int v29 = v13;
        }
        int v30 = v27 * *(unsigned __int16 *)(v16 + 2 * v29);
        if (v26 < v28)
        {
          int v31 = ~v25;
          unsigned int v32 = ~v25 + ((v8 + v12 + v15 * v12) >> 16);
          if (v32 < 2) {
            goto LABEL_102;
          }
          int v33 = 0;
          unsigned int v34 = (v31 + HIWORD(v18)) & 0xFFFFFFFE;
          unsigned int v35 = v26;
          v26 += v32 & 0xFFFFFFFE;
          do
          {
            if (v13 >= v35) {
              unsigned int v36 = v35;
            }
            else {
              unsigned int v36 = v13;
            }
            if (v13 >= v35 + 1) {
              unsigned int v37 = v35 + 1;
            }
            else {
              unsigned int v37 = v13;
            }
            v30 += *(unsigned __int16 *)(v16 + 2 * v36) << 16;
            v33 += *(unsigned __int16 *)(v16 + 2 * v37) << 16;
            v35 += 2;
            v34 -= 2;
          }
          while (v34);
          v30 += v33;
          if (v32 != (v32 & 0xFFFFFFFE))
          {
LABEL_102:
            do
            {
              if (v13 >= v26) {
                unsigned int v38 = v26;
              }
              else {
                unsigned int v38 = v13;
              }
              v30 += *(unsigned __int16 *)(v16 + 2 * v38) << 16;
              ++v26;
            }
            while (v26 < v28);
          }
        }
        if (v13 >= v28) {
          unsigned int v20 = HIWORD(v19);
        }
        else {
          unsigned int v20 = v13;
        }
        uint64_t v21 = (v30 + (unsigned __int16)v19 * *(unsigned __int16 *)(v16 + 2 * v20)) * v7;
        uint64_t v22 = v21 + (v21 >> 63);
        unint64_t v23 = (unint64_t)(v22 + 0x80000000) >> 32;
        if (v22 >= 0xFFFE80000000) {
          LOWORD(v23) = -1;
        }
        if (v22 <= 0x7FFFFFFF) {
          __int16 v24 = 0;
        }
        else {
          __int16 v24 = v23;
        }
        *v17++ = v24;
        ++v15;
        v18 += v12;
      }
      while (v15 != v9);
      if (++v11 == v84) {
        goto LABEL_48;
      }
    }
LABEL_97:
    simResizeVisPipeBinning();
  }
  unsigned int v39 = *((_DWORD *)a3 + 2);
  if (v84 > v39)
  {
    if (v39 >= (int)v84 - 1) {
      unsigned int v40 = v84 - 1;
    }
    else {
      unsigned int v40 = *((_DWORD *)a3 + 2);
    }
    if (v40 >= v84) {
      unsigned int v41 = *((_DWORD *)a1 + 2);
    }
    else {
      unsigned int v41 = v40;
    }
    if (v84 <= v40) {
      goto LABEL_97;
    }
    if (v39 != v41)
    {
      if (v84 - 1 != v41)
      {
        while (1)
          ;
      }
      goto LABEL_48;
    }
LABEL_98:
    simResizeVisPipeBinning();
  }
LABEL_48:
  if (v77)
  {
    if (v9)
    {
      unsigned int v42 = 0;
      unint64_t v43 = 0;
      unsigned int v44 = vcvtas_u32_f32(65536.0 / a5);
      LODWORD(v8) = vcvtas_u32_f32(a5 * 65536.0);
      unsigned int v45 = vcvtas_u32_f32(a7 * 8.0) << 13;
      uint64_t v81 = *a2;
      int v83 = *((_DWORD *)a2 + 4);
      unsigned int v46 = v84 - 1;
      unint64_t v47 = *((unsigned int *)a3 + 3);
      unsigned int v48 = v44 + v45;
      unsigned int v85 = v44;
      while (1)
      {
        unsigned int v49 = HIWORD(v45);
        if (HIWORD(v45) >= v46) {
          unsigned int v50 = v46;
        }
        else {
          unsigned int v50 = HIWORD(v45);
        }
        unsigned int v51 = HIWORD(v48);
        if (HIWORD(v48) >= v46) {
          unsigned int v51 = v46;
        }
        if (v43 >= *((unsigned int *)a2 + 2)) {
          break;
        }
        unsigned int v52 = v45 + v44;
        unsigned int v53 = (v45 + v44) >> 16;
        int v54 = 0x10000 - (unsigned __int16)v45;
        int v55 = (unsigned __int16)(v45 + v44);
        if (v46 >= v49) {
          unsigned int v56 = HIWORD(v45);
        }
        else {
          unsigned int v56 = v46;
        }
        uint64_t v57 = *a3;
        int v58 = *((_DWORD *)a3 + 4);
        if (v46 >= v53) {
          unsigned int v59 = HIWORD(v52);
        }
        else {
          unsigned int v59 = v46;
        }
        if (v49 + 1 < v53)
        {
          unint64_t v60 = 0;
          int v61 = (_WORD *)(v81 + (v83 * v43));
          while (v60 < v47)
          {
            unsigned int v62 = *((_DWORD *)a3 + 2);
            if (v62 <= v56) {
              break;
            }
            int v63 = v54 * *(unsigned __int16 *)(v57 + v58 * v56 + 2 * v60);
            unsigned int v64 = v49 + 1;
            do
            {
              if (v46 >= v64) {
                unsigned int v65 = v64;
              }
              else {
                unsigned int v65 = v46;
              }
              if (v62 <= v65) {
                simResizeVisPipeBinning();
              }
              v63 += *(unsigned __int16 *)(v57 + 2 * v60 + v65 * v58) << 16;
              ++v64;
            }
            while (v64 < v53);
            if (v62 <= v59) {
              goto LABEL_96;
            }
            uint64_t v66 = (v63 + v55 * *(unsigned __int16 *)(v57 + v58 * v59 + 2 * v60)) * v8;
            uint64_t v67 = v66 + (v66 >> 63);
            unint64_t v68 = (unint64_t)(v67 + 0x80000000) >> 32;
            if (v67 >= 0xFFFE80000000) {
              LOWORD(v68) = -1;
            }
            if (v67 <= 0x7FFFFFFF) {
              __int16 v69 = 0;
            }
            else {
              __int16 v69 = v68;
            }
            *v61++ = v69;
            if (++v60 == v9) {
              goto LABEL_52;
            }
          }
LABEL_95:
          simResizeVisPipeBinning();
        }
        unint64_t v70 = 0;
        uint64_t v71 = v57 + v58 * v50;
        uint64_t v72 = v57 + v58 * v51;
        do
        {
          if (v70 >= v47) {
            goto LABEL_95;
          }
          unsigned int v73 = *((_DWORD *)a3 + 2);
          if (v73 <= v56) {
            goto LABEL_95;
          }
          if (v73 <= v59) {
LABEL_96:
          }
            simResizeVisPipeBinning();
          unint64_t v74 = v8
              * (unint64_t)(v54 * *(unsigned __int16 *)(v71 + 2 * v70)
                                 + v55 * *(unsigned __int16 *)(v72 + 2 * v70));
          unint64_t v75 = (v74 + 0x80000000) >> 32;
          if (v74 >= 0xFFFE80000000) {
            LOWORD(v75) = -1;
          }
          if (!(v74 >> 31)) {
            LOWORD(v75) = 0;
          }
          *(_WORD *)(v81 + v42 + 2 * v70++) = v75;
        }
        while (v9 != v70);
LABEL_52:
        ++v43;
        unsigned int v44 = v85;
        v48 += v85;
        v42 += v83;
        unsigned int v45 = v52;
        if (v43 == v77) {
          return 1;
        }
      }
    }
    simResizeVisPipeBinning();
  }
  return 1;
}

uint64_t simResizeVisPipeBilinear(uint64_t *a1, uint64_t *a2, float a3, float a4, float a5, float a6)
{
  uint64_t v6 = *((unsigned int *)a2 + 2);
  if (v6)
  {
    int v7 = *((_DWORD *)a1 + 3);
    if (v7)
    {
      int v8 = *((_DWORD *)a2 + 3);
      unsigned int v9 = vcvtas_u32_f32(a6 * 8.0) << 13;
      unsigned int v10 = *((_DWORD *)a1 + 2);
      unsigned int v11 = v10 - 1;
      if (v8)
      {
        unint64_t v12 = 0;
        unsigned int v13 = vcvtas_u32_f32(65536.0 / a3);
        unsigned int v14 = vcvtas_u32_f32(65536.0 / a4);
        unsigned int v15 = vcvtas_u32_f32(a5 * 8.0) << 13;
        uint64_t v16 = *a1;
        int v17 = *((_DWORD *)a1 + 4);
        uint64_t v18 = *a2;
        int v19 = *((_DWORD *)a2 + 4);
        unsigned int v20 = v7 - 1;
        while (1)
        {
          unsigned int v21 = HIWORD(v9);
          unsigned int v22 = v11 >= HIWORD(v9) ? HIWORD(v9) : v11;
          unsigned int v23 = *((_DWORD *)a1 + 2);
          if (v23 <= v22) {
            break;
          }
          if (v11 >= v21 + 1) {
            unsigned int v24 = v21 + 1;
          }
          else {
            unsigned int v24 = v11;
          }
          if (v23 <= v24) {
            goto LABEL_37;
          }
          if (v12 >= *((unsigned int *)a2 + 2)) {
            goto LABEL_35;
          }
          uint64_t v25 = v16 + v17 * v22;
          uint64_t v26 = v16 + v17 * v24;
          int v27 = (_WORD *)(v18 + (v19 * v12));
          int v28 = v8;
          unsigned int v29 = v15;
          do
          {
            if (v20 >= HIWORD(v29)) {
              unsigned int v30 = HIWORD(v29);
            }
            else {
              unsigned int v30 = v20;
            }
            if (v20 >= HIWORD(v29) + 1) {
              unsigned int v31 = HIWORD(v29) + 1;
            }
            else {
              unsigned int v31 = v20;
            }
            uint64_t v32 = 2 * v31;
            uint64_t v33 = 2 * v30;
            int v34 = (*(unsigned __int16 *)(v25 + v32) - *(unsigned __int16 *)(v25 + v33)) * (unsigned __int16)v29
                + (*(unsigned __int16 *)(v25 + v33) << 16);
            LODWORD(v32) = (*(unsigned __int16 *)(v26 + v32) - *(unsigned __int16 *)(v26 + v33)) * (unsigned __int16)v29
                         + (*(unsigned __int16 *)(v26 + v33) << 16);
            LODWORD(v32) = ((v34 + (v34 >> 31) + 0x8000) & 0xFFFF0000)
                         + ((((int)v32 + ((int)v32 >> 31) + 0x8000) >> 16) - ((v34 + (v34 >> 31) + 0x8000) >> 16))
                         * (unsigned __int16)v9;
            int v35 = v32 + ((int)v32 >> 31) + 0x8000;
            if (v35 < 0x10000) {
              __int16 v36 = 0;
            }
            else {
              __int16 v36 = HIWORD(v35);
            }
            *v27++ = v36;
            v29 += v13;
            --v28;
          }
          while (v28);
          ++v12;
          v9 += v14;
          if (v12 == v6) {
            return 1;
          }
        }
      }
      else
      {
        unsigned int v38 = HIWORD(v9);
        if (v11 >= HIWORD(v9)) {
          unsigned int v39 = HIWORD(v9);
        }
        else {
          unsigned int v39 = v10 - 1;
        }
        if (v10 > v39)
        {
          if (v11 >= v38 + 1) {
            unsigned int v40 = v38 + 1;
          }
          else {
            unsigned int v40 = v10 - 1;
          }
          if (v10 > v40) {
LABEL_35:
          }
            simResizeVisPipeBinning();
LABEL_37:
          simResizeVisPipeBinning();
        }
      }
    }
    simResizeVisPipeBinning();
  }
  return 1;
}

uint64_t simResizeVisPipe(long long *a1, uint64_t a2, uint64_t *a3, int a4, unsigned int a5, float a6, float a7, float a8, float a9)
{
  if (a6 > 4.0 || a7 > 4.0) {
    simResizeVisPipe();
  }
  if (a6 < 0.0625 || a7 < 0.0625) {
    simResizeVisPipe();
  }
  if ((a7 > 1.0 || a6 > 1.0) && a4 == 0) {
    simResizeVisPipe();
  }
  unsigned int v17 = *(_DWORD *)(a2 + 12);
  if (v17 >= 0x901) {
    simResizeVisPipe();
  }
  unsigned int v18 = *(_DWORD *)(a2 + 8);
  if (v18 > 0x2000) {
    simResizeVisPipe();
  }
  int v19 = a1;
  uint64_t v20 = *((unsigned int *)a1 + 3);
  if (!v20) {
    return 0;
  }
  int v21 = *((_DWORD *)a1 + 2);
  if (!v21) {
    return 0;
  }
  uint64_t v22 = 1;
  if (v17 && v18)
  {
    if (!a5)
    {
      int v28 = 0;
      goto LABEL_46;
    }
    unsigned int v59 = a3;
    int v26 = *((_DWORD *)a1 + 4);
    if (v26 * v21)
    {
      int v27 = operator new((v26 * v21));
      bzero(v27, (v26 * v21));
      int v28 = v27;
      long long v60 = *v19;
      uint64_t v61 = *((void *)v19 + 2);
      *(void *)&long long v60 = v27;
      if ((v26 & 1) == 0) {
        goto LABEL_25;
      }
    }
    else
    {
      int v28 = 0;
      long long v60 = *a1;
      uint64_t v61 = *((void *)a1 + 2);
      *(void *)&long long v60 = 0;
      if ((v26 & 1) == 0)
      {
LABEL_25:
        if (v26 == v61)
        {
          if (v20 == HIDWORD(v60))
          {
            if (v21 == DWORD2(v60))
            {
              int v29 = *((_DWORD *)v19 + 5);
              if (v29 == HIDWORD(v61))
              {
                if (v29 == 5)
                {
                  unsigned int v30 = *(unsigned __int16 **)v19;
                  uint64_t v31 = ((v21 - 1) * v26);
                  uint64_t v32 = (unsigned __int16 *)(*(void *)v19 + 2 * v20 + v31);
                  if (*(unsigned __int16 **)v19 == v32)
                  {
                    int v19 = &v60;
                    a3 = v59;
                    goto LABEL_46;
                  }
                  unint64_t v33 = 2 * v20 + v31 - 2;
                  if (v33 < 0x1E)
                  {
                    int v34 = v28;
                    a3 = v59;
                  }
                  else
                  {
                    int v34 = v28;
                    a3 = v59;
                    if ((unint64_t)((char *)v28 - (char *)v30) >= 0x20)
                    {
                      uint64_t v35 = 0;
                      uint64_t v36 = (v33 >> 1) + 1;
                      uint64_t v37 = v36 & 0x7FFFFFFFFFFFFFF0;
                      int v34 = &v28[v37];
                      unsigned int v38 = &v30[v37];
                      uint32x4_t v39 = (uint32x4_t)vnegq_s32(vdupq_n_s32(a5));
                      uint64_t v40 = v36 & 0x7FFFFFFFFFFFFFF0;
                      do
                      {
                        unsigned int v41 = (unsigned long long *)&v28[v35];
                        unsigned long long v42 = *(_OWORD *)&vuzp1q_s16((int16x8_t)vshlq_u32(vmovl_u16(*(uint16x4_t *)&v30[v35 + 8]), v39), (int16x8_t)vshlq_u32(vmovl_high_u16(*(uint16x8_t *)&v30[v35 + 8]), v39)) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL);
                        *unsigned int v41 = *(_OWORD *)&vuzp1q_s16((int16x8_t)vshlq_u32(vmovl_u16(*(uint16x4_t *)&v30[v35]), v39), (int16x8_t)vshlq_u32(vmovl_high_u16(*(uint16x8_t *)&v30[v35]), v39)) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL);
                        v41[1] = v42;
                        v35 += 16;
                        v40 -= 16;
                      }
                      while (v40);
                      unsigned int v30 = v38;
                      if (v36 == (v36 & 0x7FFFFFFFFFFFFFF0)) {
                        goto LABEL_45;
                      }
                    }
                  }
                  do
                  {
                    unsigned int v46 = *v30++;
                    *v34++ = (v46 >> a5) & 0xFFF;
                  }
                  while (v30 != v32);
LABEL_45:
                  int v19 = &v60;
LABEL_46:
                  if (a4 == 2)
                  {
                    simResizeVisPipeBinning((uint64_t)v19, (uint64_t *)a2, a6, a7, a8, a9);
                  }
                  else if (a4 == 1)
                  {
                    simResizeVisPipeBilinear((uint64_t *)v19, (uint64_t *)a2, a6, a7, a8, a9);
                  }
                  else
                  {
                    if (a4)
                    {
                      uint64_t v22 = 0;
                      if (!a5) {
                        goto LABEL_62;
                      }
                      goto LABEL_55;
                    }
                    simResizeVisPipeArea((uint64_t *)v19, (uint64_t *)a2, a3, a6, a7, a8, a9);
                  }
                  uint64_t v22 = 1;
                  if (!a5)
                  {
LABEL_62:
                    if (v28) {
                      operator delete(v28);
                    }
                    return v22;
                  }
LABEL_55:
                  int v47 = *(_DWORD *)(a2 + 16);
                  if (v47) {
                    __assert_rtn("outputHandler", "simresizevispipe.cpp", 234, "output.rowBytes % sizeof(uint16_t) == 0");
                  }
                  uint64_t v48 = *(void *)a2;
                  uint64_t v49 = ((*(_DWORD *)(a2 + 8) - 1) * v47);
                  uint64_t v50 = 2 * *(unsigned int *)(a2 + 12);
                  unsigned int v51 = (_WORD *)(*(void *)a2 + v50 + v49);
                  if (*(_WORD **)a2 != v51)
                  {
                    unint64_t v52 = v50 + v49 - 2;
                    unsigned int v53 = *(_WORD **)a2;
                    if (v52 < 0x1E) {
                      goto LABEL_78;
                    }
                    uint64_t v54 = (v52 >> 1) + 1;
                    unsigned int v53 = (_WORD *)(v48 + 2 * (v54 & 0xFFFFFFFFFFFFFFF0));
                    uint32x4_t v55 = (uint32x4_t)vdupq_n_s32(a5);
                    uint64_t v56 = v48 + 16;
                    unint64_t v57 = v54 & 0xFFFFFFFFFFFFFFF0;
                    do
                    {
                      v58.i32[0] = *(_OWORD *)v56 & 0xFFF0FFF;
                      v58.i16[2] = HIDWORD(*(void *)v56) & 0xFFF;
                      v58.i16[3] = v58.i16[2];
                      v58.i32[2] = *(void *)(v56 + 8) & 0xFFF0FFF;
                      v58.i16[6] = v58.i16[2];
                      v58.i16[7] = v58.i16[2];
                      *(int16x8_t *)(v56 - 16) = vuzp1q_s16((int16x8_t)vshlq_u32(vmovl_u16((uint16x4_t)(*(void *)(v56 - 16) & 0xFFF0FFF0FFF0FFFLL)), v55), (int16x8_t)vshlq_u32(vmovl_high_u16((uint16x8_t)(*(_OWORD *)(v56 - 16) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL))), v55));
                      *(int16x8_t *)uint64_t v56 = vuzp1q_s16((int16x8_t)vshlq_u32(vmovl_u16(*(uint16x4_t *)v58.i8), v55), (int16x8_t)vshlq_u32(vmovl_high_u16(v58), v55));
                      v56 += 32;
                      v57 -= 16;
                    }
                    while (v57);
                    if (v54 != (v54 & 0xFFFFFFFFFFFFFFF0))
                    {
LABEL_78:
                      do
                      {
                        *unsigned int v53 = (*v53 & 0xFFF) << a5;
                        ++v53;
                      }
                      while (v53 != v51);
                    }
                  }
                  goto LABEL_62;
                }
                unsigned int v44 = "input.pixelFormat == kBmBufferPixelFormatType_UInt16";
                int v45 = 221;
              }
              else
              {
                unsigned int v44 = "input.pixelFormat == shiftedInput.pixelFormat";
                int v45 = 220;
              }
            }
            else
            {
              unsigned int v44 = "input.height == shiftedInput.height";
              int v45 = 219;
            }
          }
          else
          {
            unsigned int v44 = "input.width == shiftedInput.width";
            int v45 = 218;
          }
        }
        else
        {
          unsigned int v44 = "input.rowBytes == shiftedInput.rowBytes";
          int v45 = 217;
        }
LABEL_75:
        __assert_rtn("inputHandler", "simresizevispipe.cpp", v45, v44);
      }
    }
    unsigned int v44 = "input.rowBytes % sizeof(uint16_t) == 0";
    int v45 = 216;
    goto LABEL_75;
  }
  return v22;
}

void sub_21763DA98(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AcDetCreate(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    operator new();
  }
  return 4294967292;
}

void sub_21763DC30(_Unwind_Exception *a1)
{
  MEMORY[0x21D449420](v1, 0x1010C404B47ADB7);
  _Unwind_Resume(a1);
}

void sub_21763DC54(_Unwind_Exception *a1)
{
  MEMORY[0x21D449420](v1, 0x1090C408B5E7112);
  _Unwind_Resume(a1);
}

uint64_t AcDetDestroy(AcDetNode **a1)
{
  if (!a1) {
    return 4294967292;
  }
  uint64_t v2 = *a1;
  if (!v2) {
    return 4294967292;
  }
  AcDetNode::~AcDetNode(v2);
  MEMORY[0x21D449420]();
  uint64_t v3 = a1[1];
  if (v3)
  {
    AcSaliencyNode::~AcSaliencyNode(v3);
    MEMORY[0x21D449420]();
  }
  MEMORY[0x21D449420](a1, 0x20C40A4A59CD2);
  return 0;
}

uint64_t AcDetStart(void *a1)
{
  uint64_t result = 4294967292;
  if (a1)
  {
    if (*a1) {
      return 0;
    }
    else {
      return 4294967292;
    }
  }
  return result;
}

uint64_t AcDetStop(void *a1)
{
  uint64_t result = 4294967292;
  if (a1)
  {
    if (*a1) {
      return 0;
    }
    else {
      return 4294967292;
    }
  }
  return result;
}

uint64_t AcDetGetParams(uint64_t *a1, _DWORD *a2, uint64_t a3)
{
  if (!a1) {
    return 4294967292;
  }
  uint64_t v4 = *a1;
  if (!*a1) {
    return 4294967292;
  }
  uint64_t result = 4294967292;
  if (a2)
  {
    if (a3)
    {
      uint64_t result = AcDetNode::getParams(v4, a2, a3, 0);
      if (!result)
      {
        uint64_t v8 = a1[1];
        return AcSaliencyNode::getParams(v8, a2 + 3, a3);
      }
    }
  }
  return result;
}

uint64_t AcDetPreProcessRef(uint64_t a1)
{
  if (!a1) {
    return 4294967292;
  }
  int v5 = (uint64_t *)MEMORY[0x270FA5388]();
  if (!*v5) {
    return 4294967292;
  }
  uint64_t result = 4294967292;
  if (!v1) {
    return result;
  }
  int v7 = v3;
  if (!v3) {
    return result;
  }
  uint64_t v8 = v4;
  if (!v4) {
    return result;
  }
  unsigned int v9 = v2;
  if (!*v2) {
    return result;
  }
  if (!*v4) {
    return result;
  }
  uint64_t result = AcDetNode::getParams(*v5, v3, (uint64_t)v14, 0);
  if (result) {
    return result;
  }
  uint64_t result = AcSaliencyNode::getParams(v5[1], v7 + 3, (uint64_t)v14);
  if (result) {
    return result;
  }
  unsigned int v10 = *((_DWORD *)v9 + 3);
  if ((v10 & 3) != 0) {
    return 4294967292;
  }
  unsigned int v11 = *((_DWORD *)v8 + 3);
  if (v11 != 4 * v14[1]) {
    return 4294967292;
  }
  unsigned int v12 = *((_DWORD *)v8 + 2);
  if (v12 != v14[0]) {
    return 4294967292;
  }
  unsigned int v13 = *((_DWORD *)v8 + 4);
  uint64_t result = 4294967292;
  if (v13 >= v11 && (v13 & 0x3F) == 0)
  {
    if (rtcv::simResize((void *)*v9, v10 >> 2, *((_DWORD *)v9 + 2), *((_DWORD *)v9 + 4), 0, 0, 0, (void *)*v8, v11 >> 2, v12, v13))
    {
      return 0;
    }
    else
    {
      return 4294967288;
    }
  }
  return result;
}

void AcDetPostProcessMultiNetOutputs(uint64_t a1)
{
  if (a1)
  {
    uint64_t v6 = (uint64_t *)MEMORY[0x270FA5388]();
    if (*v6)
    {
      int v7 = v4;
      if (v4)
      {
        uint64_t v8 = v1;
        if (v1)
        {
          unsigned int v9 = (__n128 *)v5;
          if (v5)
          {
            if (*v1)
            {
              if (v1[1])
              {
                unsigned int v10 = v3;
                unsigned int v11 = v2;
                if (*v3 == 24 || !*v3)
                {
                  int v12 = v3[1];
                  if ((v12 == 24 || !v12) && v3[2] <= 1)
                  {
                    *(void *)(v5 + 205) = 0;
                    *(_OWORD *)(v5 + 176) = 0u;
                    *(_OWORD *)(v5 + 192) = 0u;
                    *(_OWORD *)(v5 + 144) = 0u;
                    *(_OWORD *)(v5 + 160) = 0u;
                    *(_OWORD *)(v5 + 112) = 0u;
                    *(_OWORD *)(v5 + 128) = 0u;
                    *(_OWORD *)(v5 + 80) = 0u;
                    *(_OWORD *)(v5 + 96) = 0u;
                    *(_OWORD *)(v5 + 48) = 0u;
                    *(_OWORD *)(v5 + 64) = 0u;
                    *(_OWORD *)(v5 + 16) = 0u;
                    *(_OWORD *)(v5 + 32) = 0u;
                    *(_OWORD *)uint64_t v5 = 0u;
                    if (*v6)
                    {
                      if (!AcDetNode::getParams(*v6, v4, (uint64_t)&v45, 0))
                      {
                        unsigned int v13 = v7 + 3;
                        if (!AcSaliencyNode::getParams(v6[1], v7 + 3, (uint64_t)&v45))
                        {
                          if (*v10)
                          {
                            if (AcDetNode::postProcess(*v6, *v11, *v10, v7, v9)) {
                              return;
                            }
                            if (v9[13].n128_u32[3])
                            {
                              unint64_t v14 = 0;
                              unsigned int v15 = &v9[15].n128_f32[1];
                              do
                              {
                                float v16 = *(v15 - 3);
                                *(float *)&uint64_t v44 = *(v15 - 2);
                                *((float *)&v44 + 1) = v16;
                                float v17 = v16 + *(v15 - 1);
                                float v42 = *(float *)&v44 + *v15;
                                float v43 = v17;
                                bmBufferResizeCoordConvertReversed(*v8, v8[1], v46, v45, 1, (float *)&v44 + 1, (float *)&v44, v16, *(float *)&v44);
                                bmBufferResizeCoordConvertReversed(*v8, v8[1], v46, v45, 1, &v43, &v42, v43, v42);
                                uint64_t v18 = v44;
                                *(v15 - 3) = *((float *)&v44 + 1);
                                *((_DWORD *)v15 - 2) = v18;
                                float v19 = v42 - *(float *)&v18;
                                *(v15 - 1) = v43 - *((float *)&v18 + 1);
                                float *v15 = v19;
                                ++v14;
                                v15 += 23;
                              }
                              while (v14 < v9[13].n128_u32[3]);
                            }
                            if (v9[71].n128_u32[2])
                            {
                              unint64_t v20 = 0;
                              int v21 = (float *)&v9[73];
                              do
                              {
                                float v22 = *(v21 - 3);
                                *(float *)&uint64_t v44 = *(v21 - 2);
                                *((float *)&v44 + 1) = v22;
                                float v23 = v22 + *(v21 - 1);
                                float v42 = *(float *)&v44 + *v21;
                                float v43 = v23;
                                bmBufferResizeCoordConvertReversed(*v8, v8[1], v46, v45, 1, (float *)&v44 + 1, (float *)&v44, v22, *(float *)&v44);
                                bmBufferResizeCoordConvertReversed(*v8, v8[1], v46, v45, 1, &v43, &v42, v43, v42);
                                uint64_t v24 = v44;
                                *(v21 - 3) = *((float *)&v44 + 1);
                                *((_DWORD *)v21 - 2) = v24;
                                float v25 = v42 - *(float *)&v24;
                                *(v21 - 1) = v43 - *((float *)&v24 + 1);
                                *int v21 = v25;
                                ++v20;
                                v21 += 8;
                              }
                              while (v20 < v9[71].n128_u32[2]);
                            }
                          }
                          int v26 = v10[2];
                          if (v26)
                          {
                            AcSaliencyNode::postProcess(v6[1], v11[2], v26, v13, v9);
                            if (v27) {
                              return;
                            }
                            uint64_t v44 = 0;
                            bmBufferResizeCoordConvert(*v8, v8[1], v9[374].n128_u16[0], v9[374].n128_u16[1], 1, (float *)&v44 + 1, (float *)&v44, (float)(*v8 - 1), (float)(v8[1] - 1));
                            v9[374].n128_u16[0] = (int)(float)(*((float *)&v44 + 1) + 1.0);
                            v9[374].n128_u16[1] = (int)(float)(*(float *)&v44 + 1.0);
                            if (v9[91].n128_u32[3])
                            {
                              unint64_t v28 = 0;
                              int v29 = &v9[93].n128_f32[1];
                              do
                              {
                                float v30 = *(v29 - 3);
                                float v42 = *(v29 - 2);
                                float v43 = v30;
                                float v31 = v30 + *(v29 - 1);
                                float v40 = v42 + *v29;
                                float v41 = v31;
                                bmBufferResizeCoordConvertReversed(*v8, v8[1], v9[374].n128_u16[0], v9[374].n128_u16[1], 1, &v43, &v42, v30, v42);
                                bmBufferResizeCoordConvertReversed(*v8, v8[1], v9[374].n128_u16[0], v9[374].n128_u16[1], 1, &v41, &v40, v41, v40);
                                float v33 = v42;
                                float v32 = v43;
                                *(v29 - 3) = v43;
                                *(v29 - 2) = v33;
                                float v34 = v41 - v32;
                                float v35 = v40 - v33;
                                *(v29 - 1) = v34;
                                *int v29 = v35;
                                ++v28;
                                v29 += 8;
                              }
                              while (v28 < v9[91].n128_u32[3]);
                            }
                          }
                          if (!v9->n128_u8[0])
                          {
                            uint64_t v36 = AcCommitHash();
                            strncpy(&v9->n128_i8[1], v36, 0x14uLL);
                            unsigned __int8 v37 = v9->n128_u8[0];
                            unsigned int v38 = (char *)v9 + 20 * v9->n128_u8[0];
                            *(_DWORD *)(v38 + 37) = 0;
                            *(_OWORD *)(v38 + 21) = xmmword_217666E48;
                            long long v39 = *(_OWORD *)*v6;
                            *(_DWORD *)(v38 + 117) = *(_DWORD *)(*v6 + 16);
                            *(_OWORD *)(v38 + 101) = v39;
                            v9->n128_u8[0] = v37 + 1;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void AcDetPostProcess()
{
  uint64_t v0 = (uint64_t *)MEMORY[0x270FA5388]();
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v6 = v1;
  uint64_t v7 = (uint64_t)v0;
  uint64_t v59 = *MEMORY[0x263EF8340];
  if (*v1 && *(uint64_t *)((char *)v1 + 36))
  {
    int v8 = *((_DWORD *)v1 + 15);
    if (v8 != 24 && v8 != 0) {
      return;
    }
  }
  else if (*((_DWORD *)v1 + 6) || *((_DWORD *)v1 + 15))
  {
    return;
  }
  if (v1[1] && *(uint64_t *)((char *)v1 + 44))
  {
    int v10 = *((_DWORD *)v1 + 16);
    if (v10 != 24 && v10) {
      return;
    }
  }
  else if (*((_DWORD *)v1 + 7) || *((_DWORD *)v1 + 16))
  {
    return;
  }
  if (v1[2] && *(uint64_t *)((char *)v1 + 52))
  {
    if (*((_DWORD *)v1 + 17) > 1u) {
      return;
    }
  }
  else if (*((_DWORD *)v1 + 8) || *((_DWORD *)v1 + 17))
  {
    return;
  }
  if (!v0
    || !v2
    || !*v0
    || AcDetNode::getParams(*v0, v2, (uint64_t)v50, 0)
    || AcSaliencyNode::getParams(*(void *)(v7 + 8), v5 + 3, (uint64_t)v50))
  {
    return;
  }
  uint64_t v54 = 0;
  unsigned int v53 = 0;
  uint64_t v11 = *v6;
  if (!*v6)
  {
    unsigned int v13 = 0;
    LODWORD(v12) = 0;
LABEL_36:
    *(void *)&v52[2868] = v13;
    int v55 = v12;
    uint64_t v23 = v6[1];
    if (v23)
    {
      int v24 = *((_DWORD *)v6 + 16);
      int v25 = v12;
      if (v24)
      {
        int v26 = *(unsigned int **)((char *)v6 + 44);
        int v27 = &v51;
        unint64_t v28 = *((unsigned int *)v6 + 7);
        uint64_t v29 = *((unsigned int *)v6 + 16);
        int v25 = v12;
        do
        {
          unsigned int v30 = *v26++;
          float v31 = &v58[24 * v25];
          *(void *)float v31 = v23 + v30;
          int v32 = *(v27 - 2);
          int v33 = *(v27 - 1) * *(v27 - 3);
          *((_DWORD *)v31 + 2) = v33;
          *((_DWORD *)v31 + 3) = v32;
          unsigned int v34 = (v32 + 63) & 0xFFFFFFC0;
          int v35 = *v27;
          *((_DWORD *)v31 + 4) = v34;
          *((_DWORD *)v31 + 5) = v35;
          if (v30 + (unint64_t)(v33 * v34) > v28) {
            return;
          }
          v27 += 6;
          ++v25;
        }
        while (--v29);
      }
      unsigned int v53 = &v58[24 * v12];
      int v56 = v24;
      int v36 = v24 + v12;
      LODWORD(v12) = v25;
    }
    else
    {
      unsigned int v53 = 0;
      int v56 = 0;
      int v36 = v12;
    }
    uint64_t v37 = v6[2];
    if (v37)
    {
      int v38 = *((_DWORD *)v6 + 17);
      if (v38)
      {
        long long v39 = *(unsigned int **)((char *)v6 + 52);
        unint64_t v40 = *((unsigned int *)v6 + 8);
        float v41 = (int *)v52;
        uint64_t v42 = *((unsigned int *)v6 + 17);
        do
        {
          unsigned int v43 = *v39++;
          uint64_t v44 = &v58[24 * v12];
          *(void *)uint64_t v44 = v37 + v43;
          int v45 = *(v41 - 2);
          int v46 = *(v41 - 1) * *(v41 - 3);
          *((_DWORD *)v44 + 2) = v46;
          *((_DWORD *)v44 + 3) = v45;
          unsigned int v47 = (v45 + 63) & 0xFFFFFFC0;
          int v48 = *v41;
          *((_DWORD *)v44 + 4) = v47;
          *((_DWORD *)v44 + 5) = v48;
          if (v43 + (unint64_t)(v46 * v47) > v40) {
            return;
          }
          v41 += 6;
          LODWORD(v12) = v12 + 1;
        }
        while (--v42);
      }
      uint64_t v49 = &v58[24 * v36];
    }
    else
    {
      uint64_t v49 = 0;
      int v38 = 0;
    }
    uint64_t v54 = v49;
    int v57 = v38;
    bzero(v4, 0x1768uLL);
    AcDetPostProcessMultiNetOutputs(v7);
    return;
  }
  uint64_t v12 = *((unsigned int *)v6 + 15);
  unsigned int v13 = v58;
  if (!v12) {
    goto LABEL_36;
  }
  uint64_t v14 = 0;
  unsigned int v15 = *(unsigned int **)((char *)v6 + 36);
  unint64_t v16 = *((unsigned int *)v6 + 6);
  while (1)
  {
    unsigned int v17 = *v15++;
    uint64_t v18 = &v58[v14];
    *(void *)uint64_t v18 = v11 + v17;
    int v19 = *(_DWORD *)&v50[v14 + 76];
    int v20 = *(_DWORD *)&v50[v14 + 84];
    int v21 = *(_DWORD *)&v50[v14 + 80] * *(_DWORD *)&v50[v14 + 72];
    *((_DWORD *)v18 + 2) = v21;
    *((_DWORD *)v18 + 3) = v19;
    unsigned int v22 = (v19 + 63) & 0xFFFFFFC0;
    *((_DWORD *)v18 + 4) = v22;
    *((_DWORD *)v18 + 5) = v20;
    if (v17 + (unint64_t)(v21 * v22) > v16) {
      break;
    }
    v14 += 24;
    if (24 * v12 == v14)
    {
      unsigned int v13 = v58;
      goto LABEL_36;
    }
  }
}

uint64_t AcDetUseLowThresholds(AcDetNode **a1, int a2)
{
  if (!a1) {
    return 4294967292;
  }
  uint64_t v2 = *a1;
  if (!v2) {
    return 4294967292;
  }
  AcDetNode::useLowThresholds(v2, a2 != 0);
  return 0;
}

unint64_t acNonMaxSuppression(uint64_t a1, unint64_t a2, float a3)
{
  if (!a1) {
    acNonMaxSuppression();
  }
  unint64_t v3 = a2;
  if (a2)
  {
    bmHeapsort(a1, a2, 0x24uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
    unint64_t v6 = 0;
    uint64_t v7 = a1 + 36;
    uint64_t v8 = 1;
    do
    {
      unint64_t v9 = v6 + 1;
      int v10 = v3;
      if (v6 + 1 >= v3)
      {
        unint64_t v3 = v6 + 1;
      }
      else
      {
        uint64_t v11 = a1 + 36 * v6;
        uint64_t v12 = v7;
        unint64_t v13 = v8;
        unint64_t v3 = v6 + 1;
        do
        {
          if (*(_DWORD *)(v11 + 16) != *(_DWORD *)(v12 + 16)
            || (acDetRectOverlap((float *)v11, (float *)v12), v14 <= a3))
          {
            unsigned int v15 = v3;
            if (v13 < v3) {
              acNonMaxSuppression();
            }
            unint64_t v3 = (v3 + 1);
            uint64_t v16 = a1 + 36 * v15;
            long long v17 = *(_OWORD *)v12;
            long long v18 = *(_OWORD *)(v12 + 16);
            *(_DWORD *)(v16 + 32) = *(_DWORD *)(v12 + 32);
            *(_OWORD *)uint64_t v16 = v17;
            *(_OWORD *)(v16 + 16) = v18;
          }
          ++v13;
          v12 += 36;
        }
        while (v10 != v13);
      }
      ++v8;
      v7 += 36;
      unint64_t v6 = v9;
    }
    while (v9 < v3);
  }
  return v3;
}

unint64_t acCrossClassSuppression(uint64_t a1, int a2, int a3, unint64_t a4, float a5)
{
  if (!a1) {
    acCrossClassSuppression();
  }
  unint64_t v5 = a4;
  if (a4)
  {
    bmHeapsort(a1, a4, 0x24uLL, (int (*)(uint64_t, uint64_t))acDetRectClassCompare);
    unint64_t v10 = 0;
    uint64_t v11 = a1 + 36;
    unint64_t v12 = 1;
    do
    {
      int v13 = v5;
      unint64_t v22 = v12;
      uint64_t v23 = v11;
      unint64_t v21 = v10 + 1;
      if (v10 + 1 >= v5)
      {
        unint64_t v5 = v10 + 1;
      }
      else
      {
        uint64_t v14 = a1 + 36 * v10;
        unint64_t v5 = v10 + 1;
        do
        {
          if (*(_DWORD *)(v14 + 16) != a2
            || *(_DWORD *)(v11 + 16) != a3
            || (acDetRectOverlap((float *)v14, (float *)v11), v15 <= a5))
          {
            unsigned int v16 = v5;
            if (v12 < v5) {
              acCrossClassSuppression();
            }
            unint64_t v5 = (v5 + 1);
            uint64_t v17 = a1 + 36 * v16;
            long long v18 = *(_OWORD *)v11;
            long long v19 = *(_OWORD *)(v11 + 16);
            *(_DWORD *)(v17 + 32) = *(_DWORD *)(v11 + 32);
            *(_OWORD *)uint64_t v17 = v18;
            *(_OWORD *)(v17 + 16) = v19;
          }
          ++v12;
          v11 += 36;
        }
        while (v13 != v12);
      }
      unint64_t v12 = v22 + 1;
      uint64_t v11 = v23 + 36;
      unint64_t v10 = v21;
    }
    while (v21 < v5);
  }
  return v5;
}

unint64_t acNonMaxSuppressionSmallbox(uint64_t a1, unint64_t a2, float a3)
{
  if (!a1) {
    acNonMaxSuppressionSmallbox();
  }
  unint64_t v3 = a2;
  if (a2)
  {
    bmHeapsort(a1, a2, 0x24uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
    unint64_t v6 = 0;
    uint64_t v7 = a1 + 36;
    uint64_t v8 = 1;
    do
    {
      unint64_t v9 = v6 + 1;
      int v10 = v3;
      if (v6 + 1 >= v3)
      {
        unint64_t v3 = v6 + 1;
      }
      else
      {
        uint64_t v11 = a1 + 36 * v6;
        uint64_t v12 = v7;
        unint64_t v13 = v8;
        unint64_t v3 = v6 + 1;
        do
        {
          if (*(_DWORD *)(v11 + 16) != *(_DWORD *)(v12 + 16)
            || (acDetRectOverlapSmallbox((float *)v11, (float *)v12), v14 <= a3))
          {
            unsigned int v15 = v3;
            if (v13 < v3) {
              acNonMaxSuppressionSmallbox();
            }
            unint64_t v3 = (v3 + 1);
            uint64_t v16 = a1 + 36 * v15;
            long long v17 = *(_OWORD *)v12;
            long long v18 = *(_OWORD *)(v12 + 16);
            *(_DWORD *)(v16 + 32) = *(_DWORD *)(v12 + 32);
            *(_OWORD *)uint64_t v16 = v17;
            *(_OWORD *)(v16 + 16) = v18;
          }
          ++v13;
          v12 += 36;
        }
        while (v10 != v13);
      }
      ++v8;
      v7 += 36;
      unint64_t v6 = v9;
    }
    while (v9 < v3);
  }
  return v3;
}

uint64_t acRemoveOverlapBoxes(long long *a1, unsigned int a2, unsigned __int8 *a3, unsigned int a4, float a5)
{
  if (a2 > a4) {
    acRemoveOverlapBoxes();
  }
  if (!a2) {
    return 0;
  }
  unint64_t v5 = a3;
  unint64_t v7 = a2;
  bzero(a3, a2);
  uint64_t v8 = 0;
  unint64_t v9 = (float *)a1 + 9;
  uint64_t v10 = 1;
  do
  {
    uint64_t v11 = v8 + 1;
    if (v8 + 1 < v7)
    {
      uint64_t v12 = (float *)a1 + 9 * v8;
      unint64_t v13 = v9;
      uint64_t v14 = v10;
      do
      {
        acDetRectOverlap(v12, v13);
        if (v15 > a5)
        {
          if (v12[6] <= v13[6]) {
            uint64_t v16 = v8;
          }
          else {
            uint64_t v16 = v14;
          }
          v5[v16] = 1;
        }
        ++v14;
        v13 += 9;
      }
      while (v7 != v14);
    }
    ++v10;
    v9 += 9;
    ++v8;
  }
  while (v11 != v7);
  uint64_t result = 0;
  long long v18 = a1;
  do
  {
    if (!*v5++)
    {
      uint64_t v20 = (uint64_t)a1 + 36 * result;
      long long v21 = *v18;
      long long v22 = v18[1];
      *(_DWORD *)(v20 + 32) = *((_DWORD *)v18 + 8);
      *(_OWORD *)uint64_t v20 = v21;
      *(_OWORD *)(v20 + 16) = v22;
      uint64_t result = (result + 1);
    }
    long long v18 = (long long *)((char *)v18 + 36);
    --v7;
  }
  while (v7);
  return result;
}

BOOL acCheckOverlapBox(float *a1, unsigned int a2, float *a3, float a4)
{
  if (!a2) {
    return 0;
  }
  acDetRectOverlap(a1, a3);
  if (v8 > a4) {
    return 1;
  }
  uint64_t v10 = a1 + 9;
  uint64_t v11 = 1;
  do
  {
    unint64_t v12 = v11;
    if (a2 == v11) {
      break;
    }
    acDetRectOverlap(v10, a3);
    uint64_t v11 = v12 + 1;
    v10 += 9;
  }
  while (v13 <= a4);
  return v12 < a2;
}

void ft::Detector::Detector(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  if (v4)
  {
    if (v4 == a3)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a3 + 24) + 24))(*(void *)(a3 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 16))(v4);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  *(_OWORD *)(a1 + 48) = 0u;
  *(_DWORD *)(a1 + 40) = 1;
  *(_OWORD *)(a1 + 64) = 0u;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 32) = &unk_26C78E518;
  operator new();
}

void sub_21763F754(_Unwind_Exception *a1)
{
  __cxa_free_exception(v5);
  ik::EspressoNet::~EspressoNet(v4);
  std::unique_ptr<ft::DetectorInternals>::~unique_ptr[abi:ne180100](v3);
  ik::PixelBufferTensor::~PixelBufferTensor(v2);
  std::function<void ()(__CVBuffer *,__CVBuffer *,ft::Rect<double> const&)>::~function(v1);
  _Unwind_Resume(a1);
}

void **std::vector<std::string>::~vector[abi:ne180100](void **a1)
{
  uint64_t v2 = (void **)*a1;
  if (*a1)
  {
    unint64_t v3 = (void **)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0) {
          operator delete(*(v3 - 3));
        }
        v3 -= 3;
      }
      while (v3 != v2);
      uint64_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

ik::PixelBufferTensor *ik::PixelBufferTensor::PixelBufferTensor(ik::PixelBufferTensor *a1, uint64_t a2)
{
  if (!*(void *)a2 || !*(void *)(a2 + 8))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Invalid dimensions requested for CVPixelBuffer creation.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CVPixelBufferRef pixelBufferOut = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  long long v18 = Mutable;
  if (*(unsigned char *)(a2 + 20))
  {
    CFMutableDictionaryRef v6 = CFDictionaryCreateMutable(v4, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    unint64_t v7 = (const void *)*MEMORY[0x263F04130];
    v17.__r_.__value_.__r.__words[0] = (std::string::size_type)v6;
    CFDictionarySetValue(Mutable, v7, v6);
    if (v6) {
      CFRelease(v6);
    }
  }
  if (*(unsigned char *)(a2 + 32))
  {
    CFNumberRef v8 = CFNumberCreate(v4, kCFNumberSInt32Type, (const void *)(a2 + 24));
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04078], v8);
    CFRelease(v8);
  }
  CVReturn v9 = CVPixelBufferCreate(v4, *(void *)a2, *(void *)(a2 + 8), *(_DWORD *)(a2 + 16), Mutable, &pixelBufferOut);
  if (v9)
  {
    float v13 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v16, v9);
    uint64_t v14 = std::string::insert(&v16, 0, "Failed to create CVPixelBuffer. Status = ");
    long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    v17.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(v13, &v17);
    __cxa_throw(v13, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v10 = pixelBufferOut;
  if (Mutable) {
    CFRelease(Mutable);
  }
  ik::PixelBufferTensor::PixelBufferTensor(a1, v10);
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*((void *)a1 + 5) + 8));
  return a1;
}

void sub_21763FD70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,const void *a23)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v24 & 1) == 0)
    {
LABEL_8:
      ik::Dict::~Dict(&a23);
      _Unwind_Resume(a1);
    }
  }
  else if (!v24)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v23);
  ik::Dict::~Dict(&a23);
  _Unwind_Resume(a1);
}

void ik::PixelBufferTensor::~PixelBufferTensor(ik::PixelBufferTensor *this)
{
  *(void *)this = &unk_26C78E630;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    unint64_t v3 = (void *)*((void *)this + 2);
    if (!v3) {
      return;
    }
  }
  else
  {
    unint64_t v3 = (void *)*((void *)this + 2);
    if (!v3) {
      return;
    }
  }
  *((void *)this + 3) = v3;
  operator delete(v3);
}

{
  std::__shared_weak_count *v2;
  void *v3;
  uint64_t vars8;

  *(void *)this = &unk_26C78E630;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    unint64_t v3 = (void *)*((void *)this + 2);
    if (!v3)
    {
LABEL_5:
      JUMPOUT(0x21D449420);
    }
  }
  else
  {
    unint64_t v3 = (void *)*((void *)this + 2);
    if (!v3) {
      goto LABEL_5;
    }
  }
  *((void *)this + 3) = v3;
  operator delete(v3);
  goto LABEL_5;
}

void ik::PixelBufferScopeLock::~PixelBufferScopeLock(ik::PixelBufferScopeLock *this)
{
  *(void *)this = &unk_26C78E610;
  if (CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)this + 1), *((void *)this + 2)))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
}

{
  std::runtime_error *exception;
  uint64_t vars8;

  *(void *)this = &unk_26C78E610;
  if (!CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)this + 1), *((void *)this + 2)))
  {
    JUMPOUT(0x21D449420);
  }
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
  __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_21763FF6C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void ik::EspressoNet::~EspressoNet(ik::EspressoNet *this)
{
  *(void *)this = &unk_26C78E4B0;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1)
  {
    if (!atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26C78E4B0;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }

  JUMPOUT(0x21D449420);
}

AcDetNode ****std::unique_ptr<ft::DetectorInternals>::~unique_ptr[abi:ne180100](AcDetNode ****a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*v2) {
      AcDetDestroy(*v2);
    }
    MEMORY[0x21D449420](v2, 0x1020C405B838537);
  }
  return a1;
}

void *std::function<void ()(__CVBuffer *,__CVBuffer *,ft::Rect<double> const&)>::~function(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
    return a1;
  }
  else
  {
    if (v2) {
      (*(void (**)(void *))(*v2 + 40))(v2);
    }
    return a1;
  }
}

void ft::Detector::~Detector(ft::Detector *this)
{
  *((void *)this + 12) = &unk_26C78E4B0;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 14);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    unint64_t v3 = (AcDetNode ***)*((void *)this + 11);
    *((void *)this + 11) = 0;
    if (!v3) {
      goto LABEL_7;
    }
  }
  else
  {
    unint64_t v3 = (AcDetNode ***)*((void *)this + 11);
    *((void *)this + 11) = 0;
    if (!v3) {
      goto LABEL_7;
    }
  }
  if (*v3) {
    AcDetDestroy(*v3);
  }
  MEMORY[0x21D449420](v3, 0x1020C405B838537);
LABEL_7:
  *((void *)this + 4) = &unk_26C78E630;
  CFAllocatorRef v4 = (std::__shared_weak_count *)*((void *)this + 10);
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  unint64_t v5 = (void *)*((void *)this + 6);
  if (v5)
  {
    *((void *)this + 7) = v5;
    operator delete(v5);
  }
  CFMutableDictionaryRef v6 = (ft::Detector *)*((void *)this + 3);
  if (v6 == this)
  {
    (*(void (**)(ft::Detector *))(*(void *)this + 32))(this);
  }
  else if (v6)
  {
    (*(void (**)(ft::Detector *))(*(void *)v6 + 40))(v6);
  }
}

uint64_t ft::Detector::Detect@<X0>(ft::Detector *this@<X0>, CVPixelBufferRef pixelBuffer@<X1>, void *a3@<X8>)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v6 = *((void *)this + 11);
  *(_DWORD *)(v6 + 4368) = 0;
  *(_DWORD *)(v6 + 5292) = 0;
  *(_DWORD *)(v6 + 5616) = 0;
  *(unsigned char *)(v6 + 4148) = 0;
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  uint64_t v9 = *((void *)this + 11);
  *(_DWORD *)(v9 + 32) = Width;
  *(_DWORD *)(v9 + 36) = Height;
  double v10 = (float)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(*((void *)this + 9) + 8));
  double v11 = (float)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(*((void *)this + 9) + 8));
  v12.i64[0] = Width;
  v12.i64[1] = Height;
  float64x2_t v13 = vcvtq_f64_u64(v12);
  double v14 = vmuld_lane_f64(v10, v13, 1);
  BOOL v15 = v11 * v13.f64[0] > v14;
  float64x2_t v44 = v13;
  double v16 = round(v14 / v13.f64[0]);
  double v17 = round(v11 * v13.f64[0] / v13.f64[1]);
  if (v15)
  {
    double v11 = v16;
    double v17 = v10;
  }
  uint64_t v18 = *(void *)(*((void *)this + 9) + 8);
  v53[0] = 0;
  v53[1] = 0;
  double v54 = v17;
  double v55 = v11;
  __p[0] = pixelBuffer;
  *(void *)&long long v59 = v18;
  uint64_t v19 = *((void *)this + 3);
  if (!v19) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, void **, long long *, void **))(*(void *)v19 + 48))(v19, __p, &v59, v53);
  *(_OWORD *)__p = 0u;
  long long v49 = 0u;
  int v50 = 1065353216;
  std::pair<std::string const,ik::Tensor>::pair[abi:ne180100]<char const(&)[6],ik::PixelBufferTensor &,0>((uint64_t)v53, "image", (uint64_t)this + 32);
  memset(v46, 0, sizeof(v46));
  int v47 = 1065353216;
  std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,ik::Tensor> const&>((uint64_t)v46, (uint64_t)v53, (long long *)v53);
  uint64_t v20 = *((void *)this + 13);
  uint64_t v22 = *(void *)(v20 + 56);
  uint64_t v23 = *(void *)(v20 + 64);
  long long v21 = (long long **)(v20 + 56);
  if (v22 == v23)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Model has no pre-declared outputs.");
    exception->__vftable = (std::runtime_error_vtbl *)&unk_26C78E4F0;
  }
  ik::EspressoNet::Predict((uint64_t)this + 96, (uint64_t)v46, v21, (uint64_t)&v59);
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::clear(__p);
  int v24 = (void *)v59;
  *(void *)&long long v59 = 0;
  int v25 = __p[0];
  __p[0] = v24;
  if (v25) {
    operator delete(v25);
  }
  unint64_t v26 = *((void *)&v59 + 1);
  *((void *)&v59 + 1) = 0;
  int v50 = v61;
  __p[1] = (void *)v26;
  long long v49 = v60;
  if (*((void *)&v60 + 1))
  {
    unint64_t v27 = *(void *)(v60 + 8);
    if ((v26 & (v26 - 1)) != 0)
    {
      if (v27 >= v26) {
        v27 %= v26;
      }
    }
    else
    {
      v27 &= v26 - 1;
    }
    *((void *)__p[0] + v27) = &v49;
    long long v60 = 0uLL;
  }
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)&v59);
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)v46);
  double v55 = COERCE_DOUBLE(&unk_26C78E630);
  unint64_t v28 = v58;
  if (v58 && !atomic_fetch_add(&v58->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
  }
  if (v56)
  {
    int v57 = v56;
    operator delete(v56);
  }
  if (SHIBYTE(v54) < 0) {
    operator delete(v53[0]);
  }
  uint64_t v29 = 0;
  uint64_t v30 = *((void *)this + 13);
  do
  {
    float v31 = std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::find<std::string>(__p, *(void *)(v30 + 56) + v29 * 8);
    if (!v31) {
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
    ft::BmBufferFromTensor<float>((uint64_t)(v31 + 5), (uint64_t)&v59);
    int v32 = &v53[v29];
    *(_OWORD *)int v32 = v59;
    v32[2] = (void *)v60;
    v29 += 3;
  }
  while (v29 != 72);
  *(void *)&long long v59 = v53;
  *(void *)&long long v60 = 0;
  *((void *)&v59 + 1) = 0;
  int v52 = 0;
  uint64_t v51 = 24;
  uint64_t v33 = *((void *)this + 11);
  v46[0] = operator new(0x20uLL);
  *(_OWORD *)&v46[1] = xmmword_217666E70;
  strcpy((char *)v46[0], "Detector post processing");
  AcDetPostProcessMultiNetOutputs(*(void *)v33);
  int v45 = v34;
  ft::EnsureOK((uint64_t)v46, &v45);
  if (SHIBYTE(v46[2]) < 0)
  {
    operator delete(v46[0]);
    uint64_t v35 = *(unsigned int *)(v33 + 4368);
    a3[1] = 0;
    a3[2] = 0;
    *a3 = 0;
    if (!v35) {
      return std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)__p);
    }
  }
  else
  {
    uint64_t v35 = *(unsigned int *)(v33 + 4368);
    a3[1] = 0;
    a3[2] = 0;
    *a3 = 0;
    if (!v35) {
      return std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)__p);
    }
  }
  int v36 = (char *)operator new(48 * v35);
  *a3 = v36;
  a3[1] = v36;
  uint64_t v37 = &v36[48 * v35];
  a3[2] = v37;
  int v38 = v36;
  do
  {
    *(_DWORD *)int v38 = 1;
    *(_OWORD *)(v38 + 4) = 0uLL;
    *(_OWORD *)(v38 + 20) = 0uLL;
    *(void *)(v38 + 36) = 0xBF80000000000000;
    v38 += 48;
  }
  while (v38 != v37);
  a3[1] = v37;
  long long v39 = (float *)(v36 + 40);
  unint64_t v40 = (unsigned int *)(v33 + 4396);
  do
  {
    *((float64x2_t *)v39 - 2) = vdivq_f64(vcvtq_f64_f32(*(float32x2_t *)(v40 - 4)), v44);
    *((float64x2_t *)v39 - 1) = vdivq_f64(vcvtq_f64_f32(*(float32x2_t *)(v40 - 2)), v44);
    unsigned int v41 = *v40;
    v40 += 23;
    *long long v39 = (float)v41;
    v39 += 12;
    --v35;
  }
  while (v35);
  return std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)__p);
}

void sub_2176407B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  __cxa_free_exception(v27);
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)&a13);
  std::pair<std::string const,ik::Tensor>::~pair((uint64_t)&a27);
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)&a19);
  _Unwind_Resume(a1);
}

void sub_2176407F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  if (a18 < 0)
  {
    operator delete(__p);
    std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)&a22);
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x217640824);
}

void sub_21764081C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t std::pair<std::string const,ik::Tensor>::~pair(uint64_t a1)
{
  *(void *)(a1 + 24) = &unk_26C78E630;
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v2 || atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    unint64_t v3 = *(void **)(a1 + 40);
    if (!v3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
  std::__shared_weak_count::__release_weak(v2);
  unint64_t v3 = *(void **)(a1 + 40);
  if (v3)
  {
LABEL_4:
    *(void *)(a1 + 48) = v3;
    operator delete(v3);
  }
LABEL_5:
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t ft::BmBufferFromTensor<float>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(_DWORD *)(a1 + 8) != 1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    goto LABEL_6;
  }
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 24))(*(void *)(a1 + 40));
  unint64_t v5 = *(_DWORD **)(a1 + 16);
  if (*(void *)(a1 + 24) - (void)v5 != 32)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Expected a rank 4 NCHW tensor.");
LABEL_6:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  int v6 = v5[2];
  int v7 = v5[4];
  int v8 = v5[6];
  *(void *)a2 = result;
  *(_DWORD *)(a2 + 8) = v7 * v6;
  *(_DWORD *)(a2 + 12) = v8;
  *(_DWORD *)(a2 + 16) = 4 * v8;
  *(_DWORD *)(a2 + 20) = 6;
  return result;
}

void sub_2176409DC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2176409F0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void ft::EnsureOK(uint64_t a1, int *a2)
{
  if (*a2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::operator+<char>();
    CFAllocatorRef v4 = std::string::append(&v11, " / internal code = ");
    long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
    v12.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v5;
    v4->__r_.__value_.__l.__size_ = 0;
    v4->__r_.__value_.__r.__words[2] = 0;
    v4->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v10, *a2);
    if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v6 = &v10;
    }
    else {
      int v6 = (std::string *)v10.__r_.__value_.__r.__words[0];
    }
    if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v10.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v10.__r_.__value_.__l.__size_;
    }
    int v8 = std::string::append(&v12, (const std::string::value_type *)v6, size);
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v13.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v13);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
}

{
  std::runtime_error *exception;
  std::string *v4;
  long long v5;
  std::string *v6;
  std::string::size_type size;
  std::string *v8;
  long long v9;
  std::string v10;
  std::string v11;
  std::string v12;
  std::string v13;

  if (*a2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::operator+<char>();
    CFAllocatorRef v4 = std::string::append(&v11, " / internal code = ");
    long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
    v12.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v5;
    v4->__r_.__value_.__l.__size_ = 0;
    v4->__r_.__value_.__r.__words[2] = 0;
    v4->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v10, *a2);
    if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v6 = &v10;
    }
    else {
      int v6 = (std::string *)v10.__r_.__value_.__r.__words[0];
    }
    if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v10.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v10.__r_.__value_.__l.__size_;
    }
    int v8 = std::string::append(&v12, (const std::string::value_type *)v6, size);
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v13.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v13);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
}

void sub_217640B08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (*(char *)(v28 - 41) < 0)
  {
    operator delete(*(void **)(v28 - 64));
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a26 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a9);
  if ((a26 & 0x80000000) == 0)
  {
LABEL_4:
    if (a20 < 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  operator delete(a21);
  if (a20 < 0)
  {
LABEL_5:
    operator delete(__p);
    if ((v27 & 1) == 0) {
LABEL_12:
    }
      _Unwind_Resume(a1);
LABEL_11:
    __cxa_free_exception(v26);
    goto LABEL_12;
  }
LABEL_10:
  if (!v27) {
    goto LABEL_12;
  }
  goto LABEL_11;
}

uint64_t ft::Detector::GetEspressoPlan(ft::Detector *this)
{
  return *(void *)(*((void *)this + 13) + 24);
}

void ik::Tensor::~Tensor(ik::Tensor *this)
{
  *(void *)this = &unk_26C78E630;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    unint64_t v3 = (void *)*((void *)this + 2);
    if (!v3) {
      return;
    }
  }
  else
  {
    unint64_t v3 = (void *)*((void *)this + 2);
    if (!v3) {
      return;
    }
  }
  *((void *)this + 3) = v3;
  operator delete(v3);
}

{
  std::__shared_weak_count *v2;
  void *v3;
  uint64_t vars8;

  *(void *)this = &unk_26C78E630;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    unint64_t v3 = (void *)*((void *)this + 2);
    if (!v3)
    {
LABEL_5:
      JUMPOUT(0x21D449420);
    }
  }
  else
  {
    unint64_t v3 = (void *)*((void *)this + 2);
    if (!v3) {
      goto LABEL_5;
    }
  }
  *((void *)this + 3) = v3;
  operator delete(v3);
  goto LABEL_5;
}

void std::__shared_ptr_emplace<ik::core::EspressoNetState>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C78E758;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ik::core::EspressoNetState>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C78E758;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D449420);
}

void std::__shared_ptr_emplace<ik::core::EspressoNetState>::__on_zero_shared(uint64_t a1)
{
}

uint64_t ik::core::EspressoNetState::EspressoNetState(uint64_t a1, long long *a2, ik::EspressoConfig *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  int v6 = (uint64_t *)(a1 + 16);
  *(void *)(a1 + 24) = 0;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 32), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v7 = *a2;
    *(void *)(a1 + 48) = *((void *)a2 + 2);
    *(_OWORD *)(a1 + 32) = v7;
  }
  ik::EspressoConfig::EspressoConfig((ik::EspressoConfig *)(a1 + 56), a3);
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_DWORD *)(a1 + 224) = 1065353216;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_DWORD *)(a1 + 264) = 1065353216;
  if (!*((unsigned char *)a3 + 28) && qword_26ACF58A0 != -1) {
    dispatch_once(&qword_26ACF58A0, &__block_literal_global_0);
  }
  uint64_t context = espresso_create_context();
  *int v6 = context;
  if (!context)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to create espresso context.");
    goto LABEL_63;
  }
  uint64_t plan = espresso_create_plan();
  *(void *)(a1 + 24) = plan;
  if (!plan)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to create espresso plan.");
LABEL_63:
    exception->__vftable = (std::runtime_error_vtbl *)&unk_26C78E4F0;
  }
  if (*((unsigned char *)a3 + 48)
    && (LODWORD(__dst.__r_.__value_.__l.__data_) = espresso_plan_set_priority(),
        *((unsigned char *)&__p.__r_.__value_.__s + 23) = 20,
        strcpy((char *)&__p, "Setting plan priorty"),
        ik::VerifyEspressoStatus((int *)&__dst, (uint64_t *)&__p),
        SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0))
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((*((char *)a2 + 23) & 0x80000000) == 0) {
      goto LABEL_12;
    }
  }
  else if ((*((char *)a2 + 23) & 0x80000000) == 0)
  {
LABEL_12:
    std::string __p = *(std::string *)a2;
    goto LABEL_15;
  }
  std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *((void *)a2 + 1));
LABEL_15:
  int v10 = *((char *)a3 + 135);
  if (v10 >= 0) {
    std::string::size_type v11 = *((unsigned __int8 *)a3 + 135);
  }
  else {
    std::string::size_type v11 = *((void *)a3 + 15);
  }
  if (!v11) {
    goto LABEL_40;
  }
  int v12 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t size = __p.__r_.__value_.__l.__size_;
  }
  unint64_t v14 = size + 1;
  if (size + 1 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v14 >= 0x17)
  {
    uint64_t v16 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v16 = v14 | 7;
    }
    uint64_t v17 = v16 + 1;
    p_dst = (std::string *)operator new(v16 + 1);
    __dst.__r_.__value_.__l.__size_ = size + 1;
    __dst.__r_.__value_.__r.__words[2] = v17 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_29;
  }
  memset(&__dst, 0, sizeof(__dst));
  p_dst = &__dst;
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = size + 1;
  if (size)
  {
LABEL_29:
    if (v12 >= 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    memmove(p_dst, p_p, size);
  }
  *(_WORD *)((char *)&p_dst->__r_.__value_.__l.__data_ + size) = 58;
  if (v10 >= 0) {
    uint64_t v19 = (char *)a3 + 112;
  }
  else {
    uint64_t v19 = (const std::string::value_type *)*((void *)a3 + 14);
  }
  uint64_t v20 = std::string::append(&__dst, v19, v11);
  std::string::size_type v21 = v20->__r_.__value_.__r.__words[0];
  *(void *)&long long v31 = v20->__r_.__value_.__l.__size_;
  *(void *)((char *)&v31 + 7) = *(std::string::size_type *)((char *)&v20->__r_.__value_.__r.__words[1] + 7);
  char v22 = HIBYTE(v20->__r_.__value_.__r.__words[2]);
  v20->__r_.__value_.__l.__size_ = 0;
  v20->__r_.__value_.__r.__words[2] = 0;
  v20->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  __p.__r_.__value_.__r.__words[0] = v21;
  __p.__r_.__value_.__l.__size_ = v31;
  *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)&v31 + 7);
  *((unsigned char *)&__p.__r_.__value_.__s + 23) = v22;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
LABEL_40:
  LODWORD(v31) = espresso_plan_add_network();
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&__dst.__r_.__value_.__r.__words[1] = xmmword_217666E70;
  strcpy(__dst.__r_.__value_.__l.__data_, "Loading espresso Network");
  ik::VerifyEspressoStatus((int *)&v31, (uint64_t *)&__dst);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    if (!*((unsigned char *)a3 + 64)) {
      goto LABEL_45;
    }
  }
  else if (!*((unsigned char *)a3 + 64))
  {
    goto LABEL_45;
  }
  LODWORD(v31) = espresso_plan_share_intermediate_buffer();
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&__dst.__r_.__value_.__r.__words[1] = xmmword_217666E80;
  strcpy(__dst.__r_.__value_.__l.__data_, "Sharing intermediate buffer");
  ik::VerifyEspressoStatus((int *)&v31, (uint64_t *)&__dst);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    uint64_t v24 = *(void *)a3;
    uint64_t v23 = *((void *)a3 + 1);
    if (*(void *)a3 == v23) {
      goto LABEL_51;
    }
    goto LABEL_48;
  }
LABEL_45:
  uint64_t v24 = *(void *)a3;
  uint64_t v23 = *((void *)a3 + 1);
  if (*(void *)a3 == v23) {
    goto LABEL_51;
  }
  do
  {
LABEL_48:
    LODWORD(v31) = espresso_network_declare_output();
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
    *(_OWORD *)&__dst.__r_.__value_.__r.__words[1] = xmmword_217666E70;
    strcpy(__dst.__r_.__value_.__l.__data_, "Declaring network output");
    ik::VerifyEspressoStatus((int *)&v31, (uint64_t *)&__dst);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__dst.__r_.__value_.__l.__data_);
    }
    v24 += 24;
  }
  while (v24 != v23);
LABEL_51:
  for (uint64_t i = (uint64_t *)*((void *)a3 + 11); i; uint64_t i = (uint64_t *)*i)
  {
    long long v31 = *(_OWORD *)(i + 5);
    int v32 = *((_DWORD *)i + 14);
    int v28 = espresso_set_image_preprocessing_params();
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
    *(_OWORD *)&__dst.__r_.__value_.__r.__words[1] = xmmword_217666E90;
    strcpy(__dst.__r_.__value_.__l.__data_, "Setting preprocessing params");
    ik::VerifyEspressoStatus(&v28, (uint64_t *)&__dst);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__dst.__r_.__value_.__l.__data_);
    }
  }
  LODWORD(v31) = espresso_plan_build();
  strcpy((char *)&__dst, "Building espresso plan");
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 22;
  ik::VerifyEspressoStatus((int *)&v31, (uint64_t *)&__dst);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return a1;
    }
LABEL_60:
    operator delete(__p.__r_.__value_.__l.__data_);
    return a1;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_60;
  }
  return a1;
}

void sub_217641578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table(a11);
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table(v30);
  ik::EspressoConfig::~EspressoConfig(a12);
  if (*(char *)(v29 + 55) < 0) {
    operator delete(*v31);
  }
  _Unwind_Resume(a1);
}

ik::EspressoConfig *ik::EspressoConfig::EspressoConfig(ik::EspressoConfig *this, const ik::EspressoConfig *a2)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(this, *(void *)a2, *((void *)a2 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 1) - *(void *)a2) >> 3));
  long long v4 = *(_OWORD *)((char *)a2 + 24);
  long long v5 = *(_OWORD *)((char *)a2 + 40);
  *(_OWORD *)((char *)this + 49) = *(_OWORD *)((char *)a2 + 49);
  *(_OWORD *)((char *)this + 40) = v5;
  *(_OWORD *)((char *)this + 24) = v4;
  std::unordered_map<std::string,espresso_simple_image_preprocessing_params_t>::unordered_map((uint64_t)this + 72, (uint64_t)a2 + 72);
  int v6 = (std::string *)((char *)this + 112);
  if (*((char *)a2 + 135) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *((const std::string::value_type **)a2 + 14), *((void *)a2 + 15));
  }
  else
  {
    long long v7 = *((_OWORD *)a2 + 7);
    *((void *)this + 16) = *((void *)a2 + 16);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  return this;
}

void sub_217641728(_Unwind_Exception *exception_object)
{
  long long v4 = (void **)v1[11];
  if (v4) {
    ft::Detector::Detector(v4);
  }
  long long v5 = *v2;
  *uint64_t v2 = 0;
  if (v5)
  {
    operator delete(v5);
    int v6 = (void **)*v1;
    if (!*v1) {
LABEL_5:
    }
      _Unwind_Resume(exception_object);
  }
  else
  {
    int v6 = (void **)*v1;
    if (!*v1) {
      goto LABEL_5;
    }
  }
  long long v7 = (void **)v1[1];
  int v8 = v6;
  if (v7 != v6)
  {
    do
    {
      if (*((char *)v7 - 1) < 0) {
        operator delete(*(v7 - 3));
      }
      v7 -= 3;
    }
    while (v7 != v6);
    int v8 = *v1;
  }
  v1[1] = v6;
  operator delete(v8);
  _Unwind_Resume(exception_object);
}

uint64_t ik::VerifyEspressoStatus(int *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (result)
  {
    ik::LogEspressoError(result, a2);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::operator+<char>();
    long long v5 = std::string::append(&v14, " [espresso error: ");
    long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    v15.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v6;
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v13, *a1);
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      long long v7 = &v13;
    }
    else {
      long long v7 = (std::string *)v13.__r_.__value_.__r.__words[0];
    }
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v13.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v13.__r_.__value_.__l.__size_;
    }
    long long v9 = std::string::append(&v15, (const std::string::value_type *)v7, size);
    long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    v16.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    std::string::size_type v11 = std::string::append(&v16, "]");
    long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v17.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v17);
    exception->__vftable = (std::runtime_error_vtbl *)&unk_26C78E4F0;
  }
  return result;
}

void sub_217641908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v35 - 41) < 0)
  {
    operator delete(*(void **)(v35 - 64));
    if ((a33 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a14 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((a33 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a28);
  if ((a14 & 0x80000000) == 0)
  {
LABEL_4:
    if ((a26 & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  operator delete(a9);
  if ((a26 & 0x80000000) == 0)
  {
LABEL_5:
    if (a20 < 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  operator delete(a21);
  if (a20 < 0)
  {
LABEL_6:
    operator delete(__p);
    if ((v34 & 1) == 0) {
LABEL_14:
    }
      _Unwind_Resume(a1);
LABEL_13:
    __cxa_free_exception(v33);
    goto LABEL_14;
  }
LABEL_12:
  if (!v34) {
    goto LABEL_14;
  }
  goto LABEL_13;
}

void std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    if (a4 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    int v8 = (char *)operator new(24 * a4);
    *a1 = v8;
    a1[1] = v8;
    a1[2] = &v8[24 * a4];
    if (a2 != a3)
    {
      uint64_t v9 = 0;
      do
      {
        long long v10 = (std::string *)&v8[v9];
        uint64_t v11 = a2 + v9;
        if (*(char *)(a2 + v9 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)v11, *(void *)(v11 + 8));
        }
        else
        {
          *(_OWORD *)&v10->__r_.__value_.__l.__data_ = *(_OWORD *)v11;
          v10->__r_.__value_.__r.__words[2] = *(void *)(v11 + 16);
        }
        v9 += 24;
      }
      while (a2 + v9 != a3);
      v8 += v9;
    }
    a1[1] = v8;
  }
}

void sub_217641AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void sub_217641AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  for (; v11; v11 -= 24)
  {
    if (*(char *)(v10 + v11 - 1) < 0) {
      operator delete(*(void **)(v10 + v11 - 24));
    }
  }
  *(void *)(v9 + 8) = v10;
  std::__exception_guard_exceptions<std::vector<std::string>::__destroy_vector>::~__exception_guard_exceptions[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void ***std::__exception_guard_exceptions<std::vector<std::string>::__destroy_vector>::~__exception_guard_exceptions[abi:ne180100](void ***result)
{
  uint64_t v1 = result;
  if (!*((unsigned char *)result + 8))
  {
    uint64_t v2 = *result;
    unint64_t v3 = (void **)**result;
    if (v3)
    {
      long long v4 = (void **)v2[1];
      long long v5 = **result;
      if (v4 != v3)
      {
        do
        {
          if (*((char *)v4 - 1) < 0) {
            operator delete(*(v4 - 3));
          }
          v4 -= 3;
        }
        while (v4 != v3);
        long long v5 = **v1;
      }
      v2[1] = v3;
      operator delete(v5);
      return v1;
    }
  }
  return result;
}

uint64_t std::unordered_map<std::string,espresso_simple_image_preprocessing_params_t>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  size_t prime = *(void *)(a2 + 8);
  if (prime == 1)
  {
    size_t prime = 2;
LABEL_17:
    std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__do_rehash<true>(a1, prime);
    goto LABEL_18;
  }
  if ((prime & (prime - 1)) != 0)
  {
    size_t prime = std::__next_prime(*(void *)(a2 + 8));
    int8x8_t v5 = *(int8x8_t *)(a1 + 8);
    BOOL v6 = prime >= *(void *)&v5;
    if (prime > *(void *)&v5) {
      goto LABEL_17;
    }
  }
  else
  {
    int8x8_t v5 = 0;
    BOOL v6 = 1;
    if (prime) {
      goto LABEL_17;
    }
  }
  if (!v6)
  {
    unint64_t v7 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v5 < 3uLL || (uint8x8_t v8 = (uint8x8_t)vcnt_s8(v5), v8.i16[0] = vaddlv_u8(v8), v8.u32[0] > 1uLL))
    {
      unint64_t v7 = std::__next_prime(v7);
    }
    else
    {
      uint64_t v9 = 1 << -(char)__clz(v7 - 1);
      if (v7 >= 2) {
        unint64_t v7 = v9;
      }
    }
    if (prime <= v7) {
      size_t prime = v7;
    }
    if (prime < *(void *)&v5) {
      goto LABEL_17;
    }
  }
LABEL_18:
  for (uint64_t i = *(void **)(a2 + 16); i; uint64_t i = (void *)*i)
    std::__hash_table<std::__hash_value_type<std::string,espresso_simple_image_preprocessing_params_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_simple_image_preprocessing_params_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_simple_image_preprocessing_params_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_simple_image_preprocessing_params_t>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,espresso_simple_image_preprocessing_params_t> const&>(a1, (uint64_t)(i + 2), (uint64_t)(i + 2));
  return a1;
}

void sub_217641CDC(_Unwind_Exception *a1)
{
  std::unordered_map<std::string,espresso_buffer_t>::~unordered_map[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_217641CF0(_Unwind_Exception *a1)
{
  std::unordered_map<std::string,espresso_buffer_t>::~unordered_map[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<std::string,espresso_simple_image_preprocessing_params_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_simple_image_preprocessing_params_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_simple_image_preprocessing_params_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_simple_image_preprocessing_params_t>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,espresso_simple_image_preprocessing_params_t> const&>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int8x8_t v5 = (unsigned char *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v8 = v7;
  }
  unint64_t v9 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)v42, (uint64_t *)a2, v8);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v3 = v9;
      if (v9 >= v11) {
        unint64_t v3 = v9 % v11;
      }
    }
    else
    {
      unint64_t v3 = (v11 - 1) & v9;
    }
    std::string v13 = *(uint64_t ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      std::string v14 = *v13;
      if (*v13)
      {
        char v15 = v5[23];
        if (v15 >= 0) {
          uint64_t v16 = v5[23];
        }
        else {
          uint64_t v16 = *((void *)v5 + 1);
        }
        if (v15 < 0) {
          int8x8_t v5 = *(unsigned char **)v5;
        }
        if (v12.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v21 = v14[1];
            if (v21 == v10)
            {
              uint64_t v22 = *((unsigned __int8 *)v14 + 39);
              if ((v22 & 0x80u) == 0) {
                uint64_t v23 = *((unsigned __int8 *)v14 + 39);
              }
              else {
                uint64_t v23 = v14[3];
              }
              if (v23 == v16)
              {
                if ((v22 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v14[2], v5, v14[3])) {
                    return v14;
                  }
                }
                else
                {
                  if (!*((unsigned char *)v14 + 39)) {
                    return v14;
                  }
                  uint64_t v24 = 0;
                  while (*((unsigned __int8 *)v14 + v24 + 16) == v5[v24])
                  {
                    if (v22 == ++v24) {
                      return v14;
                    }
                  }
                }
              }
            }
            else if ((v21 & (v11 - 1)) != v3)
            {
              goto LABEL_51;
            }
            std::string v14 = (uint64_t *)*v14;
            if (!v14) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v17 = v14[1];
          if (v17 == v10)
          {
            uint64_t v18 = *((unsigned __int8 *)v14 + 39);
            if ((v18 & 0x80u) == 0) {
              uint64_t v19 = *((unsigned __int8 *)v14 + 39);
            }
            else {
              uint64_t v19 = v14[3];
            }
            if (v19 == v16)
            {
              if ((v18 & 0x80) != 0)
              {
                if (!memcmp((const void *)v14[2], v5, v14[3])) {
                  return v14;
                }
              }
              else
              {
                if (!*((unsigned char *)v14 + 39)) {
                  return v14;
                }
                uint64_t v20 = 0;
                while (*((unsigned __int8 *)v14 + v20 + 16) == v5[v20])
                {
                  if (v18 == ++v20) {
                    return v14;
                  }
                }
              }
            }
          }
          else
          {
            if (v17 >= v11) {
              v17 %= v11;
            }
            if (v17 != v3) {
              break;
            }
          }
          std::string v14 = (uint64_t *)*v14;
        }
        while (v14);
      }
    }
  }
LABEL_51:
  int v25 = (char *)operator new(0x40uLL);
  v42[0] = v25;
  v42[1] = a1 + 16;
  char v43 = 0;
  *(void *)int v25 = 0;
  *((void *)v25 + 1) = v10;
  unint64_t v26 = (std::string *)(v25 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v26, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v26->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((void *)v25 + 4) = *(void *)(a3 + 16);
  }
  *(_OWORD *)(v25 + 40) = *(_OWORD *)(a3 + 24);
  *((_DWORD *)v25 + 14) = *(_DWORD *)(a3 + 40);
  char v43 = 1;
  float v27 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v28 = *(float *)(a1 + 32);
  if (!v11 || (float)(v28 * (float)v11) < v27)
  {
    BOOL v31 = 1;
    if (v11 >= 3) {
      BOOL v31 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v32 = v31 | (2 * v11);
    unint64_t v33 = vcvtps_u32_f32(v27 / v28);
    if (v32 <= v33) {
      size_t prime = v33;
    }
    else {
      size_t prime = v32;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v35 = *(int8x8_t *)(a1 + 8);
    if (prime > *(void *)&v35) {
      goto LABEL_68;
    }
    if (prime < *(void *)&v35)
    {
      unint64_t v36 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(void *)&v35 < 3uLL || (uint8x8_t v37 = (uint8x8_t)vcnt_s8(v35), v37.i16[0] = vaddlv_u8(v37), v37.u32[0] > 1uLL))
      {
        unint64_t v36 = std::__next_prime(v36);
      }
      else
      {
        uint64_t v38 = 1 << -(char)__clz(v36 - 1);
        if (v36 >= 2) {
          unint64_t v36 = v38;
        }
      }
      if (prime <= v36) {
        size_t prime = v36;
      }
      if (prime < *(void *)&v35) {
LABEL_68:
      }
        std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__do_rehash<true>(a1, prime);
    }
    unint64_t v11 = *(void *)(a1 + 8);
    unint64_t v39 = v11 - 1;
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
      {
        unint64_t v3 = v10 % v11;
        uint64_t v29 = *(void **)(*(void *)a1 + 8 * (v10 % v11));
        uint64_t v30 = (void *)v42[0];
        if (v29) {
          goto LABEL_57;
        }
      }
      else
      {
        unint64_t v3 = v10;
        uint64_t v29 = *(void **)(*(void *)a1 + 8 * v10);
        uint64_t v30 = (void *)v42[0];
        if (v29) {
          goto LABEL_57;
        }
      }
    }
    else
    {
      unint64_t v3 = v39 & v10;
      uint64_t v29 = *(void **)(*(void *)a1 + 8 * (v39 & v10));
      uint64_t v30 = (void *)v42[0];
      if (v29) {
        goto LABEL_57;
      }
    }
LABEL_81:
    *uint64_t v30 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v42[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v42[0])
    {
      unint64_t v40 = *(void *)(*(void *)v42[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v40 >= v11) {
          v40 %= v11;
        }
      }
      else
      {
        v40 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v40) = v42[0];
    }
    goto LABEL_92;
  }
  uint64_t v29 = *(void **)(*(void *)a1 + 8 * v3);
  uint64_t v30 = (void *)v42[0];
  if (!v29) {
    goto LABEL_81;
  }
LABEL_57:
  *uint64_t v30 = *v29;
  *uint64_t v29 = v42[0];
LABEL_92:
  std::string v14 = (uint64_t *)v42[0];
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_217642154(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,espresso_buffer_t>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,espresso_buffer_t>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_217642168(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,espresso_buffer_t>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,espresso_buffer_t>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t ___ZN2ikL28IsAppleNeuralEngineAvailableEv_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _MergedGlobals_1 = result;
  return result;
}

void ik::InferenceError::~InferenceError(std::runtime_error *this)
{
  std::runtime_error::~runtime_error(this);

  JUMPOUT(0x21D449420);
}

void ik::LogEspressoError(uint64_t a1, uint64_t *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    ik::LogEspressoError(a2);
  }
}

{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    ik::LogEspressoError(a2);
  }
}

void ik::core::EspressoNetState::~EspressoNetState(ik::core::EspressoNetState *this)
{
  if (*((void *)this + 3)) {
    espresso_plan_destroy();
  }
  if (*((void *)this + 2)) {
    espresso_context_destroy();
  }
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)this + 232);
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)this + 192);
  ik::EspressoConfig::~EspressoConfig((void **)this + 7);
  if (*((char *)this + 55) < 0) {
    operator delete(*((void **)this + 4));
  }
}

void ik::EspressoConfig::~EspressoConfig(void **this)
{
  if (*((char *)this + 135) < 0)
  {
    operator delete(this[14]);
    uint64_t v2 = (void **)this[11];
    if (!v2) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v2 = (void **)this[11];
    if (!v2) {
      goto LABEL_5;
    }
  }
  do
  {
    unint64_t v7 = (void **)*v2;
    if (*((char *)v2 + 39) < 0) {
      operator delete(v2[2]);
    }
    operator delete(v2);
    uint64_t v2 = v7;
  }
  while (v7);
LABEL_5:
  unint64_t v3 = this[9];
  this[9] = 0;
  if (v3) {
    operator delete(v3);
  }
  long long v4 = (void **)*this;
  if (*this)
  {
    int8x8_t v5 = (void **)this[1];
    BOOL v6 = *this;
    if (v5 != v4)
    {
      do
      {
        if (*((char *)v5 - 1) < 0) {
          operator delete(*(v5 - 3));
        }
        v5 -= 3;
      }
      while (v5 != v4);
      BOOL v6 = *this;
    }
    this[1] = v4;
    operator delete(v6);
  }
}

void ik::Dict::~Dict(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

ik::PixelBufferTensor *ik::PixelBufferTensor::PixelBufferTensor(ik::PixelBufferTensor *this, __CVBuffer *a2)
{
  CVPixelBufferRef pixelBuffer = a2;
  unint64_t v3 = (std::__shared_weak_count *)operator new(0x28uLL);
  std::__shared_ptr_emplace<ik::core::PixelBufferStorage>::__shared_ptr_emplace[abi:ne180100]<__CVBuffer *&,std::allocator<ik::core::PixelBufferStorage>,0>(v3, &pixelBuffer);
  uint64_t v21 = v3 + 1;
  uint64_t v22 = v3;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  int v5 = ik::core::DataTypeFromPixelBuffer(pixelBuffer, v4);
  BOOL v6 = pixelBuffer;
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  size_t Width = CVPixelBufferGetWidth(v6);
  uint64_t v10 = ik::core::ChannelCountFromPixelBuffer(v6, v9);
  ik::TensorShape::TensorShape<unsigned long,unsigned long,unsigned long>(&v17, Height, Width, v10);
  *(void *)this = &unk_26C78E630;
  *((void *)this + 2) = 0;
  *((_DWORD *)this + 2) = v5;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  unint64_t v11 = v17;
  int64_t v12 = v18 - v17;
  if (v18 != v17)
  {
    if (v12 < 0) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    std::string v13 = (char *)operator new(v18 - v17);
    *((void *)this + 2) = v13;
    *((void *)this + 3) = v13;
    std::string v14 = &v13[8 * (v12 >> 3)];
    *((void *)this + 4) = v14;
    memcpy(v13, v11, v12);
    *((void *)this + 3) = v14;
  }
  *((void *)this + 5) = v3 + 1;
  *((void *)this + 6) = v3;
  atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  if (v11)
  {
    uint64_t v18 = v11;
    operator delete(v11);
  }
  if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  char v15 = v20;
  if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
  *(void *)this = &unk_26C78E518;
  return this;
}

void sub_217642588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char a12, uint64_t a13, char a14)
{
}

uint64_t ik::core::DataTypeFromPixelBuffer(ik::core *this, __CVBuffer *a2)
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(this);
  if (PixelFormatType <= 1278226533)
  {
    if (PixelFormatType <= 1111970368)
    {
      if (PixelFormatType != 32)
      {
        int v3 = 1094862674;
        goto LABEL_10;
      }
      return 0;
    }
    if (PixelFormatType == 1111970369) {
      return 0;
    }
    int v3 = 1278226488;
LABEL_10:
    if (PixelFormatType == v3) {
      return 0;
    }
LABEL_15:
    unsigned int v5 = PixelFormatType;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v9, v5);
    unint64_t v7 = std::string::insert(&v9, 0, "Unsupported CVPixelBuffer type: ");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v10.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v10.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v10);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (PixelFormatType > 1717855599)
  {
    if (PixelFormatType != 1717856627 && PixelFormatType != 1717855600) {
      goto LABEL_15;
    }
  }
  else if (PixelFormatType != 1278226534)
  {
    int v3 = 1380401729;
    goto LABEL_10;
  }
  return 1;
}

{
  signed int PixelFormatType;
  int v3;
  unsigned int v5;
  std::runtime_error *exception;
  std::string *v7;
  long long v8;
  std::string v9;
  std::string v10;

  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(this);
  if (PixelFormatType <= 1278226533)
  {
    if (PixelFormatType <= 1111970368)
    {
      if (PixelFormatType != 32)
      {
        int v3 = 1094862674;
        goto LABEL_10;
      }
      return 0;
    }
    if (PixelFormatType == 1111970369) {
      return 0;
    }
    int v3 = 1278226488;
LABEL_10:
    if (PixelFormatType == v3) {
      return 0;
    }
LABEL_15:
    unsigned int v5 = PixelFormatType;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v9, v5);
    unint64_t v7 = std::string::insert(&v9, 0, "Unsupported CVPixelBuffer type: ");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v10.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v10.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v10);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (PixelFormatType > 1717855599)
  {
    if (PixelFormatType != 1717856627 && PixelFormatType != 1717855600) {
      goto LABEL_15;
    }
  }
  else if (PixelFormatType != 1278226534)
  {
    int v3 = 1380401729;
    goto LABEL_10;
  }
  return 1;
}

{
  signed int PixelFormatType;
  int v3;
  unsigned int v5;
  std::runtime_error *exception;
  std::string *v7;
  long long v8;
  std::string v9;
  std::string v10;

  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(this);
  if (PixelFormatType <= 1278226533)
  {
    if (PixelFormatType <= 1111970368)
    {
      if (PixelFormatType != 32)
      {
        int v3 = 1094862674;
        goto LABEL_10;
      }
      return 0;
    }
    if (PixelFormatType == 1111970369) {
      return 0;
    }
    int v3 = 1278226488;
LABEL_10:
    if (PixelFormatType == v3) {
      return 0;
    }
LABEL_15:
    unsigned int v5 = PixelFormatType;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v9, v5);
    unint64_t v7 = std::string::insert(&v9, 0, "Unsupported CVPixelBuffer type: ");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v10.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v10.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v10);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (PixelFormatType > 1717855599)
  {
    if (PixelFormatType != 1717856627 && PixelFormatType != 1717855600) {
      goto LABEL_15;
    }
  }
  else if (PixelFormatType != 1278226534)
  {
    int v3 = 1380401729;
    goto LABEL_10;
  }
  return 1;
}

{
  signed int PixelFormatType;
  int v3;
  unsigned int v5;
  std::runtime_error *exception;
  std::string *v7;
  long long v8;
  std::string v9;
  std::string v10;

  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(this);
  if (PixelFormatType <= 1278226533)
  {
    if (PixelFormatType <= 1111970368)
    {
      if (PixelFormatType != 32)
      {
        int v3 = 1094862674;
        goto LABEL_10;
      }
      return 0;
    }
    if (PixelFormatType == 1111970369) {
      return 0;
    }
    int v3 = 1278226488;
LABEL_10:
    if (PixelFormatType == v3) {
      return 0;
    }
LABEL_15:
    unsigned int v5 = PixelFormatType;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v9, v5);
    unint64_t v7 = std::string::insert(&v9, 0, "Unsupported CVPixelBuffer type: ");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v10.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v10.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v10);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (PixelFormatType > 1717855599)
  {
    if (PixelFormatType != 1717856627 && PixelFormatType != 1717855600) {
      goto LABEL_15;
    }
  }
  else if (PixelFormatType != 1278226534)
  {
    int v3 = 1380401729;
    goto LABEL_10;
  }
  return 1;
}

void sub_21764278C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

void *std::__shared_ptr_emplace<ik::core::PixelBufferStorage>::__shared_ptr_emplace[abi:ne180100]<__CVBuffer *&,std::allocator<ik::core::PixelBufferStorage>,0>(void *a1, __CVBuffer **a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26C78E790;
  int v3 = *a2;
  a1[3] = &unk_26C78E590;
  a1[4] = v3;
  if (!v3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Null CVPixelBuffer encountered.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CVPixelBufferRetain(v3);
  return a1;
}

void sub_2176428A0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_2176428BC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<ik::core::PixelBufferStorage>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C78E790;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ik::core::PixelBufferStorage>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C78E790;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D449420);
}

void std::__shared_ptr_emplace<ik::core::PixelBufferStorage>::__on_zero_shared(uint64_t a1)
{
}

void ik::core::PixelBufferStorage::~PixelBufferStorage(CVPixelBufferRef *this)
{
}

{
  uint64_t vars8;

  CVPixelBufferRelease(this[1]);

  JUMPOUT(0x21D449420);
}

uint64_t ik::core::PixelBufferStorage::Bind(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 24))(a2, *(void *)(a1 + 8));
}

void *ik::core::PixelBufferStorage::Data(CVPixelBufferRef *this)
{
  BaseAddress = CVPixelBufferGetBaseAddress(this[1]);
  if (!BaseAddress)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to get CVPixelBuffer's data. Ensure the buffer was locked.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  int v3 = BaseAddress;
  CVPixelBufferGetDataSize(this[1]);
  return v3;
}

void sub_217642A90(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *ik::core::PixelBufferStorage::Strides@<X0>(ik::core **this@<X0>, __CVBuffer *a2@<X1>, void *a3@<X8>)
{
  int v5 = ik::core::DataTypeFromPixelBuffer(this[1], a2);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(this[1]);
  uint64_t v8 = ik::core::ChannelCountFromPixelBuffer(this[1], v7);
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  uint64_t result = operator new(0x18uLL);
  a3[1] = result + 3;
  a3[2] = result + 3;
  *uint64_t result = BytesPerRow;
  result[1] = v8 << (2 * (v5 != 0));
  if (v5) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = 1;
  }
  result[2] = v10;
  *a3 = result;
  return result;
}

void ik::core::PixelBufferStorage::CopyData(CVPixelBufferRef *this)
{
  if (!CVPixelBufferLockBaseAddress(this[1], 1uLL))
  {
    (*((void (**)(CVPixelBufferRef *))*this + 3))(this);
    (*((void (**)(void **__return_ptr, CVPixelBufferRef *))*this + 4))(&__p, this);
    ik::StridedArray::StridedArray();
  }
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Failed to lock pixel buffer.");
  __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_217642C8C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_217642CA0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_217642CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
  {
    a13 = (uint64_t)__p;
    operator delete(__p);
  }
  ik::core::CorePixelBufferScopeLock::~CorePixelBufferScopeLock((ik::core::CorePixelBufferScopeLock *)&a9);
  _Unwind_Resume(a1);
}

void ik::TensorStorage::CopyData(ik::TensorStorage *this)
{
  (*(void (**)(ik::TensorStorage *))(*(void *)this + 24))(this);
  (*(void (**)(void **__return_ptr, ik::TensorStorage *))(*(void *)this + 32))(&__p, this);
  ik::StridedArray::StridedArray();
}

void sub_217642D94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ik::StridedArray::StridedArray()
{
}

void sub_217642EAC(_Unwind_Exception *a1)
{
  MEMORY[0x21D449420](v1, 0x1000C4077774924);
  _Unwind_Resume(a1);
}

void sub_217642ED0(_Unwind_Exception *a1)
{
  long long v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 32) = v4;
    operator delete(v4);
  }
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<unsigned char *,std::shared_ptr<unsigned char []>::__shared_ptr_default_delete<unsigned char [],unsigned char>,std::allocator<unsigned char>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D449420);
}

uint64_t std::__shared_ptr_pointer<unsigned char *,std::shared_ptr<unsigned char []>::__shared_ptr_default_delete<unsigned char [],unsigned char>,std::allocator<unsigned char>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    JUMPOUT(0x21D449400);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<unsigned char *,std::shared_ptr<unsigned char []>::__shared_ptr_default_delete<unsigned char [],unsigned char>,std::allocator<unsigned char>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021766704DLL) {
    return a1 + 24;
  }
  if (((v3 & 0x800000021766704DLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000021766704DLL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021766704DLL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

uint64_t ik::core::ChannelCountFromPixelBuffer(ik::core *this, __CVBuffer *a2)
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(this);
  if (PixelFormatType <= 1278226533)
  {
    if (PixelFormatType <= 1111970368)
    {
      if (PixelFormatType == 32) {
        return 4;
      }
      int v3 = 1094862674;
      goto LABEL_8;
    }
    if (PixelFormatType == 1111970369) {
      return 4;
    }
    int v5 = 1278226488;
LABEL_14:
    if (PixelFormatType != v5) {
      goto LABEL_16;
    }
    return 1;
  }
  if (PixelFormatType > 1717855599)
  {
    if (PixelFormatType == 1717856627) {
      return 1;
    }
    int v5 = 1717855600;
    goto LABEL_14;
  }
  if (PixelFormatType != 1278226534)
  {
    int v3 = 1380401729;
LABEL_8:
    if (PixelFormatType == v3) {
      return 4;
    }
LABEL_16:
    unsigned int v6 = PixelFormatType;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v10, v6);
    uint64_t v8 = std::string::insert(&v10, 0, "Unsupported CVPixelBuffer type: ");
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v11.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v11);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return 1;
}

{
  signed int PixelFormatType;
  int v3;
  int v5;
  unsigned int v6;
  std::runtime_error *exception;
  std::string *v8;
  long long v9;
  std::string v10;
  std::string v11;

  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(this);
  if (PixelFormatType <= 1278226533)
  {
    if (PixelFormatType <= 1111970368)
    {
      if (PixelFormatType == 32) {
        return 4;
      }
      int v3 = 1094862674;
      goto LABEL_8;
    }
    if (PixelFormatType == 1111970369) {
      return 4;
    }
    int v5 = 1278226488;
LABEL_14:
    if (PixelFormatType != v5) {
      goto LABEL_16;
    }
    return 1;
  }
  if (PixelFormatType > 1717855599)
  {
    if (PixelFormatType == 1717856627) {
      return 1;
    }
    int v5 = 1717855600;
    goto LABEL_14;
  }
  if (PixelFormatType != 1278226534)
  {
    int v3 = 1380401729;
LABEL_8:
    if (PixelFormatType == v3) {
      return 4;
    }
LABEL_16:
    unsigned int v6 = PixelFormatType;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v10, v6);
    uint64_t v8 = std::string::insert(&v10, 0, "Unsupported CVPixelBuffer type: ");
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v11.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v11);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return 1;
}

{
  signed int PixelFormatType;
  int v3;
  int v5;
  unsigned int v6;
  std::runtime_error *exception;
  std::string *v8;
  long long v9;
  std::string v10;
  std::string v11;

  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(this);
  if (PixelFormatType <= 1278226533)
  {
    if (PixelFormatType <= 1111970368)
    {
      if (PixelFormatType == 32) {
        return 4;
      }
      int v3 = 1094862674;
      goto LABEL_8;
    }
    if (PixelFormatType == 1111970369) {
      return 4;
    }
    int v5 = 1278226488;
LABEL_14:
    if (PixelFormatType != v5) {
      goto LABEL_16;
    }
    return 1;
  }
  if (PixelFormatType > 1717855599)
  {
    if (PixelFormatType == 1717856627) {
      return 1;
    }
    int v5 = 1717855600;
    goto LABEL_14;
  }
  if (PixelFormatType != 1278226534)
  {
    int v3 = 1380401729;
LABEL_8:
    if (PixelFormatType == v3) {
      return 4;
    }
LABEL_16:
    unsigned int v6 = PixelFormatType;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v10, v6);
    uint64_t v8 = std::string::insert(&v10, 0, "Unsupported CVPixelBuffer type: ");
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v11.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v11);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return 1;
}

{
  signed int PixelFormatType;
  int v3;
  int v5;
  unsigned int v6;
  std::runtime_error *exception;
  std::string *v8;
  long long v9;
  std::string v10;
  std::string v11;

  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(this);
  if (PixelFormatType <= 1278226533)
  {
    if (PixelFormatType <= 1111970368)
    {
      if (PixelFormatType == 32) {
        return 4;
      }
      int v3 = 1094862674;
      goto LABEL_8;
    }
    if (PixelFormatType == 1111970369) {
      return 4;
    }
    int v5 = 1278226488;
LABEL_14:
    if (PixelFormatType != v5) {
      goto LABEL_16;
    }
    return 1;
  }
  if (PixelFormatType > 1717855599)
  {
    if (PixelFormatType == 1717856627) {
      return 1;
    }
    int v5 = 1717855600;
    goto LABEL_14;
  }
  if (PixelFormatType != 1278226534)
  {
    int v3 = 1380401729;
LABEL_8:
    if (PixelFormatType == v3) {
      return 4;
    }
LABEL_16:
    unsigned int v6 = PixelFormatType;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v10, v6);
    uint64_t v8 = std::string::insert(&v10, 0, "Unsupported CVPixelBuffer type: ");
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v11.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v11);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return 1;
}

void sub_217643148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

void ik::core::CorePixelBufferScopeLock::~CorePixelBufferScopeLock(ik::core::CorePixelBufferScopeLock *this)
{
  *(void *)this = &unk_26C78E610;
  if (CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)this + 1), *((void *)this + 2)))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
}

{
  std::runtime_error *exception;
  uint64_t vars8;

  *(void *)this = &unk_26C78E610;
  if (!CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)this + 1), *((void *)this + 2)))
  {
    JUMPOUT(0x21D449420);
  }
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
  __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_217643230(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2176432F8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  MEMORY[0x21D449420](v1, 0x10A1C40AFD1EA57);
  _Unwind_Resume(a1);
}

char **ik::TensorShape::TensorShape<unsigned long,unsigned long,unsigned long>(char **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v8 = (char *)operator new(8uLL);
  *(void *)uint64_t v8 = a2;
  a1[1] = v8 + 8;
  a1[2] = v8 + 8;
  *a1 = v8;
  long long v9 = (char *)operator new(0x10uLL);
  std::string v10 = v9 + 16;
  *(void *)long long v9 = *(void *)v8;
  *((void *)v9 + 1) = a3;
  *a1 = v9;
  a1[1] = v9 + 16;
  a1[2] = v9 + 16;
  operator delete(v8);
  unint64_t v11 = (unint64_t)a1[2];
  a1[1] = v9 + 16;
  if ((unint64_t)(v9 + 16) < v11)
  {
    *((void *)v9 + 2) = a4;
    uint64_t v12 = (uint64_t)(v9 + 24);
    goto LABEL_21;
  }
  std::string v13 = *a1;
  uint64_t v14 = (v10 - *a1) >> 3;
  unint64_t v15 = v14 + 1;
  if ((unint64_t)(v14 + 1) >> 61) {
    std::vector<long long>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v16 = v11 - (void)v13;
  if (v16 >> 2 > v15) {
    unint64_t v15 = v16 >> 2;
  }
  if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v17 = v15;
  }
  if (v17)
  {
    if (v17 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v18 = (char *)operator new(8 * v17);
    uint64_t v19 = &v18[8 * v14];
    uint64_t v20 = &v18[8 * v17];
    *(void *)uint64_t v19 = a4;
    uint64_t v12 = (uint64_t)(v19 + 8);
    if (v10 == v13) {
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  uint64_t v18 = 0;
  uint64_t v19 = (char *)(8 * v14);
  uint64_t v20 = 0;
  *(void *)(8 * v14) = a4;
  uint64_t v12 = 8 * v14 + 8;
  if (v10 != v13)
  {
LABEL_14:
    unint64_t v21 = v9 - v13 + 8;
    if (v21 < 0x18) {
      goto LABEL_26;
    }
    uint64_t v22 = (v21 >> 3) + 1;
    uint64_t v23 = 8 * (v22 & 0x3FFFFFFFFFFFFFFCLL);
    v10 -= v23;
    v19 -= v23;
    uint64_t v24 = &v18[8 * v14 - 16];
    uint64_t v25 = v22 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v26 = *(_OWORD *)v9;
      *((_OWORD *)v24 - 1) = *((_OWORD *)v9 - 1);
      *(_OWORD *)uint64_t v24 = v26;
      v24 -= 32;
      v9 -= 32;
      v25 -= 4;
    }
    while (v25);
    if (v22 != (v22 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_26:
      do
      {
        uint64_t v27 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v19 - 1) = v27;
        v19 -= 8;
      }
      while (v10 != v13);
    }
  }
LABEL_19:
  *a1 = v19;
  a1[1] = (char *)v12;
  a1[2] = v20;
  if (v13) {
    operator delete(v13);
  }
LABEL_21:
  a1[1] = (char *)v12;
  return a1;
}

void sub_2176434F0(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(void *result, char *__src, char *a3, size_t __sz)
{
  unsigned int v6 = __src;
  unint64_t v7 = result;
  uint64_t v8 = result[2];
  long long v9 = (char *)*result;
  if (__sz > (v8 - *result) >> 3)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *unint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (__sz >> 61) {
      goto LABEL_22;
    }
    uint64_t v10 = v8 >> 2;
    if (v8 >> 2 <= __sz) {
      uint64_t v10 = __sz;
    }
    BOOL v11 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8;
    unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    if (!v11) {
      unint64_t v12 = v10;
    }
    if (v12 >> 61) {
LABEL_22:
    }
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    uint64_t v13 = v12;
    uint64_t result = operator new(8 * v12);
    long long v9 = (char *)result;
    *unint64_t v7 = result;
    v7[1] = result;
    v7[2] = &result[v13];
    size_t v14 = a3 - v6;
    if (v14) {
      uint64_t result = memcpy(result, v6, v14);
    }
    unint64_t v15 = (void **)(v7 + 1);
    goto LABEL_21;
  }
  unint64_t v15 = (void **)(result + 1);
  uint64_t v16 = (unsigned char *)result[1];
  unint64_t v17 = (v16 - v9) >> 3;
  if (v17 >= __sz)
  {
    size_t v14 = a3 - __src;
    if (a3 == __src) {
      goto LABEL_21;
    }
    uint64_t v19 = (void *)*result;
LABEL_20:
    uint64_t result = memmove(v19, __src, v14);
    goto LABEL_21;
  }
  uint64_t v18 = &__src[8 * v17];
  if (v16 != v9)
  {
    uint64_t result = memmove((void *)*result, __src, v16 - v9);
    long long v9 = (char *)*v15;
  }
  size_t v14 = a3 - v18;
  if (v14)
  {
    uint64_t v19 = v9;
    __src = v18;
    goto LABEL_20;
  }
LABEL_21:
  std::__shared_weak_count *v15 = &v9[v14];
  return result;
}

void sub_217643708(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  MEMORY[0x21D449420](v1, 0x10A1C40AFD1EA57);
  _Unwind_Resume(a1);
}

uint64_t ik::EspressoNet::Predict@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X2>, uint64_t a4@<X8>)
{
  int v5 = *(long long **)(a1 + 8);
  for (uint64_t i = *(uint64_t **)(a2 + 16); i; uint64_t i = (uint64_t *)*i)
  {
    *(void *)int v34 = &unk_26C78E558;
    if (*((char *)i + 39) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v34[8], (const std::string::value_type *)i[2], i[3]);
    }
    else
    {
      long long v7 = *((_OWORD *)i + 1);
      uint64_t v35 = i[4];
      *(_OWORD *)&v34[8] = v7;
    }
    long long v36 = *v5;
    (*(void (**)(uint64_t, unsigned char *))(*(void *)i[10] + 16))(i[10], v34);
    if (SHIBYTE(v35) < 0) {
      operator delete(*(void **)&v34[8]);
    }
  }
  long long v9 = *a3;
  uint64_t v8 = a3[1];
  if (*a3 != v8)
  {
    do
    {
      if (std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::find<std::string>((void *)v5 + 24, (uint64_t)v9))
      {
        uint64_t v10 = std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::find<std::string>((void *)v5 + 24, (uint64_t)v9);
        if (!v10) {
          std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
        }
        BOOL v11 = v10;
        uint64_t v25 = &unk_26C78E630;
        int v26 = *((_DWORD *)v10 + 12);
        float v28 = 0;
        uint64_t v29 = 0;
        uint64_t v27 = 0;
        uint64_t v13 = (unsigned char *)v10[7];
        unint64_t v12 = (unsigned char *)v10[8];
        int64_t v14 = v12 - v13;
        if (v12 != v13)
        {
          if (v14 < 0) {
            std::vector<long long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v27 = operator new(v12 - v13);
          float v28 = (char *)v27;
          unint64_t v15 = (char *)v27 + 8 * (v14 >> 3);
          uint64_t v29 = v15;
          memcpy(v27, v13, v14);
          float v28 = v15;
        }
        uint64_t v16 = (std::__shared_weak_count *)v11[11];
        uint64_t v30 = v11[10];
        BOOL v31 = v16;
        if (v16)
        {
          atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v17 = v31;
          uint64_t v25 = &unk_26C78E630;
          if (v31) {
            goto LABEL_29;
          }
        }
        else
        {
          uint64_t v25 = &unk_26C78E630;
        }
      }
      else
      {
        int v33 = espresso_network_bind_buffer();
        HIBYTE(v32[2]) = 21;
        strcpy((char *)v32, "Binding output buffer");
        ik::VerifyEspressoStatus(&v33, (uint64_t *)v32);
        if (SHIBYTE(v32[2]) < 0) {
          operator delete(v32[0]);
        }
        LOWORD(v32[0]) = 0;
        ik::EspressoTensor::EspressoTensor((uint64_t)&v25, (uint64_t)v34, v32);
        v32[0] = v9;
        uint64_t v18 = std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)(v5 + 12), (uint64_t)v9, (uint64_t)&std::piecewise_construct, v32);
        uint64_t v19 = v18;
        *((_DWORD *)v18 + 12) = v26;
        if (v18 + 5 != (uint64_t *)&v25) {
          std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(v18 + 7, (char *)v27, v28, (v28 - (unsigned char *)v27) >> 3);
        }
        uint64_t v21 = v30;
        uint64_t v20 = v31;
        if (v31) {
          atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v22 = (std::__shared_weak_count *)v19[11];
        v19[10] = v21;
        v19[11] = (uint64_t)v20;
        if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
          unint64_t v17 = v31;
          uint64_t v25 = &unk_26C78E630;
          if (v31)
          {
LABEL_29:
            if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
              std::__shared_weak_count::__release_weak(v17);
            }
          }
        }
        else
        {
          unint64_t v17 = v31;
          uint64_t v25 = &unk_26C78E630;
          if (v31) {
            goto LABEL_29;
          }
        }
      }
      if (v27)
      {
        float v28 = (char *)v27;
        operator delete(v27);
      }
      long long v9 = (long long *)((char *)v9 + 24);
    }
    while (v9 != v8);
  }
  LODWORD(v32[0]) = espresso_plan_execute_sync();
  v34[23] = 14;
  strcpy(v34, "Executing plan");
  ik::VerifyEspressoStatus((int *)v32, (uint64_t *)v34);
  if ((v34[23] & 0x80000000) != 0) {
    operator delete(*(void **)v34);
  }
  return std::unordered_map<std::string,ik::EspressoTensor>::unordered_map(a4, (uint64_t)(v5 + 12));
}

void sub_217643B6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,int a30,__int16 a31,char a32,char a33)
{
  if (a29 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ik::core::EspressoBinder::~EspressoBinder(void **this)
{
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

{
  uint64_t vars8;

  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }

  JUMPOUT(0x21D449420);
}

void ik::EspressoTensor::~EspressoTensor(ik::EspressoTensor *this)
{
  *(void *)this = &unk_26C78E630;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    int v3 = (void *)*((void *)this + 2);
    if (!v3) {
      return;
    }
  }
  else
  {
    int v3 = (void *)*((void *)this + 2);
    if (!v3) {
      return;
    }
  }
  *((void *)this + 3) = v3;
  operator delete(v3);
}

{
  std::__shared_weak_count *v2;
  void *v3;
  uint64_t vars8;

  *(void *)this = &unk_26C78E630;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    int v3 = (void *)*((void *)this + 2);
    if (!v3)
    {
LABEL_5:
      JUMPOUT(0x21D449420);
    }
  }
  else
  {
    int v3 = (void *)*((void *)this + 2);
    if (!v3) {
      goto LABEL_5;
    }
  }
  *((void *)this + 3) = v3;
  operator delete(v3);
  goto LABEL_5;
}

void ik::core::EspressoBinder::Bind(uint64_t a1, long long *a2, _DWORD *a3)
{
  switch(*a3)
  {
    case 0:
      long long v3 = a2[1];
      long long v10 = *a2;
      long long v11 = v3;
      int v12 = espresso_network_bind_input_vimagebuffer_bgra8();
      char v9 = 21;
      strcpy(__p, "Binding vImage_Buffer");
      ik::VerifyEspressoStatus(&v12, (uint64_t *)__p);
      break;
    case 1:
      long long v5 = a2[1];
      long long v10 = *a2;
      long long v11 = v5;
      int v12 = espresso_network_bind_input_vimagebuffer_rgba8();
      char v9 = 21;
      strcpy(__p, "Binding vImage_Buffer");
      ik::VerifyEspressoStatus(&v12, (uint64_t *)__p);
      break;
    case 2:
      long long v4 = a2[1];
      long long v10 = *a2;
      long long v11 = v4;
      int v12 = espresso_network_bind_input_vimagebuffer_argb8();
      char v9 = 21;
      strcpy(__p, "Binding vImage_Buffer");
      ik::VerifyEspressoStatus(&v12, (uint64_t *)__p);
      break;
    case 3:
      long long v6 = a2[1];
      long long v10 = *a2;
      long long v11 = v6;
      int v12 = espresso_network_bind_input_vimagebuffer_planar8();
      char v9 = 21;
      strcpy(__p, "Binding vImage_Buffer");
      ik::VerifyEspressoStatus(&v12, (uint64_t *)__p);
      break;
    default:
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Unsupported image buffer type");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (v9 < 0) {
    operator delete(*(void **)__p);
  }
}

void sub_217643F7C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_217643F90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ik::core::EspressoBinder::Bind(ik::core::EspressoBinder *this, __CVBuffer *a2)
{
  int v4 = espresso_network_bind_cvpixelbuffer();
  char v3 = 21;
  strcpy(__p, "Binding CVPixelBuffer");
  ik::VerifyEspressoStatus(&v4, (uint64_t *)__p);
  if (v3 < 0) {
    operator delete(*(void **)__p);
  }
}

void sub_217644068(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ik::core::EspressoBinder::Bind()
{
  int v2 = espresso_network_bind_buffer();
  std::string __p = operator new(0x20uLL);
  long long v1 = xmmword_217666EA0;
  strcpy((char *)__p, "Binding espresso_buffer_t");
  ik::VerifyEspressoStatus(&v2, (uint64_t *)&__p);
  if (SHIBYTE(v1) < 0) {
    operator delete(__p);
  }
}

void sub_21764413C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::find<std::string>(void *a1, uint64_t a2)
{
  int v2 = (unsigned char *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v5 = v4;
  }
  unint64_t v6 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v25, (uint64_t *)a2, v5);
  int8x8_t v7 = (int8x8_t)a1[1];
  if (!*(void *)&v7) {
    return 0;
  }
  unint64_t v8 = v6;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v10 = v6;
    if (v6 >= *(void *)&v7) {
      unint64_t v10 = v6 % *(void *)&v7;
    }
  }
  else
  {
    unint64_t v10 = (*(void *)&v7 - 1) & v6;
  }
  int v12 = *(uint64_t ***)(*a1 + 8 * v10);
  if (v12)
  {
    uint64_t v13 = *v12;
    if (*v12)
    {
      char v14 = v2[23];
      if (v14 >= 0) {
        uint64_t v15 = v2[23];
      }
      else {
        uint64_t v15 = *((void *)v2 + 1);
      }
      if (v14 < 0) {
        int v2 = *(unsigned char **)v2;
      }
      if (v9.u32[0] < 2uLL)
      {
        uint64_t v16 = *(void *)&v7 - 1;
        while (1)
        {
          uint64_t v21 = v13[1];
          if (v8 == v21)
          {
            uint64_t v22 = *((unsigned __int8 *)v13 + 39);
            if ((v22 & 0x80u) == 0) {
              uint64_t v23 = *((unsigned __int8 *)v13 + 39);
            }
            else {
              uint64_t v23 = v13[3];
            }
            if (v23 == v15)
            {
              if ((v22 & 0x80) != 0)
              {
                if (!memcmp((const void *)v13[2], v2, v13[3])) {
                  return v13;
                }
              }
              else
              {
                if (!*((unsigned char *)v13 + 39)) {
                  return v13;
                }
                uint64_t v24 = 0;
                while (*((unsigned __int8 *)v13 + v24 + 16) == v2[v24])
                {
                  if (v22 == ++v24) {
                    return v13;
                  }
                }
              }
            }
          }
          else if ((v21 & v16) != v10)
          {
            return 0;
          }
          uint64_t result = 0;
          uint64_t v13 = (uint64_t *)*v13;
          if (!v13) {
            return result;
          }
        }
      }
      while (1)
      {
        unint64_t v17 = v13[1];
        if (v8 == v17)
        {
          uint64_t v18 = *((unsigned __int8 *)v13 + 39);
          if ((v18 & 0x80u) == 0) {
            uint64_t v19 = *((unsigned __int8 *)v13 + 39);
          }
          else {
            uint64_t v19 = v13[3];
          }
          if (v19 == v15)
          {
            if ((v18 & 0x80) != 0)
            {
              if (!memcmp((const void *)v13[2], v2, v13[3])) {
                return v13;
              }
            }
            else
            {
              if (!*((unsigned char *)v13 + 39)) {
                return v13;
              }
              uint64_t v20 = 0;
              while (*((unsigned __int8 *)v13 + v20 + 16) == v2[v20])
              {
                if (v18 == ++v20) {
                  return v13;
                }
              }
            }
          }
        }
        else
        {
          if (v17 >= *(void *)&v7) {
            v17 %= *(void *)&v7;
          }
          if (v17 != v10) {
            return 0;
          }
        }
        uint64_t result = 0;
        uint64_t v13 = (uint64_t *)*v13;
        if (!v13) {
          return result;
        }
      }
    }
  }
  return 0;
}

{
  unsigned char *v2;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int8x8_t v7;
  unint64_t v8;
  uint8x8_t v9;
  unint64_t v10;
  uint64_t *result;
  uint64_t **v12;
  uint64_t *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  int v2 = (unsigned char *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v5 = v4;
  }
  unint64_t v6 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v25, (uint64_t *)a2, v5);
  int8x8_t v7 = (int8x8_t)a1[1];
  if (!*(void *)&v7) {
    return 0;
  }
  unint64_t v8 = v6;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v10 = v6;
    if (v6 >= *(void *)&v7) {
      unint64_t v10 = v6 % *(void *)&v7;
    }
  }
  else
  {
    unint64_t v10 = (*(void *)&v7 - 1) & v6;
  }
  int v12 = *(uint64_t ***)(*a1 + 8 * v10);
  if (v12)
  {
    uint64_t v13 = *v12;
    if (*v12)
    {
      char v14 = v2[23];
      if (v14 >= 0) {
        uint64_t v15 = v2[23];
      }
      else {
        uint64_t v15 = *((void *)v2 + 1);
      }
      if (v14 < 0) {
        int v2 = *(unsigned char **)v2;
      }
      if (v9.u32[0] < 2uLL)
      {
        uint64_t v16 = *(void *)&v7 - 1;
        while (1)
        {
          uint64_t v21 = v13[1];
          if (v21 == v8)
          {
            uint64_t v22 = *((unsigned __int8 *)v13 + 39);
            if ((v22 & 0x80u) == 0) {
              uint64_t v23 = *((unsigned __int8 *)v13 + 39);
            }
            else {
              uint64_t v23 = v13[3];
            }
            if (v23 == v15)
            {
              if ((v22 & 0x80) != 0)
              {
                if (!memcmp((const void *)v13[2], v2, v13[3])) {
                  return v13;
                }
              }
              else
              {
                if (!*((unsigned char *)v13 + 39)) {
                  return v13;
                }
                uint64_t v24 = 0;
                while (*((unsigned __int8 *)v13 + v24 + 16) == v2[v24])
                {
                  if (v22 == ++v24) {
                    return v13;
                  }
                }
              }
            }
          }
          else if ((v21 & v16) != v10)
          {
            return 0;
          }
          uint64_t result = 0;
          uint64_t v13 = (uint64_t *)*v13;
          if (!v13) {
            return result;
          }
        }
      }
      while (1)
      {
        unint64_t v17 = v13[1];
        if (v17 == v8)
        {
          uint64_t v18 = *((unsigned __int8 *)v13 + 39);
          if ((v18 & 0x80u) == 0) {
            uint64_t v19 = *((unsigned __int8 *)v13 + 39);
          }
          else {
            uint64_t v19 = v13[3];
          }
          if (v19 == v15)
          {
            if ((v18 & 0x80) != 0)
            {
              if (!memcmp((const void *)v13[2], v2, v13[3])) {
                return v13;
              }
            }
            else
            {
              if (!*((unsigned char *)v13 + 39)) {
                return v13;
              }
              uint64_t v20 = 0;
              while (*((unsigned __int8 *)v13 + v20 + 16) == v2[v20])
              {
                if (v18 == ++v20) {
                  return v13;
                }
              }
            }
          }
        }
        else
        {
          if (v17 >= *(void *)&v7) {
            v17 %= *(void *)&v7;
          }
          if (v17 != v10) {
            return 0;
          }
        }
        uint64_t result = 0;
        uint64_t v13 = (uint64_t *)*v13;
        if (!v13) {
          return result;
        }
      }
    }
  }
  return 0;
}

uint64_t ik::EspressoTensor::EspressoTensor(uint64_t a1, uint64_t a2, _WORD *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v6 = (std::__shared_weak_count *)operator new(0xD0uLL);
  v6->__shared_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C78E7C8;
  v6->__shared_weak_owners_ = 0;
  v6[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26C78E5D0;
  long long v7 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)&v6[6].__shared_weak_owners_ = *(_OWORD *)(a2 + 128);
  *(_OWORD *)&v6[7].__shared_owners_ = v7;
  v6[8].__vftable = *(std::__shared_weak_count_vtbl **)(a2 + 160);
  long long v8 = *(_OWORD *)(a2 + 80);
  v6[4].std::__shared_count = *(std::__shared_count *)(a2 + 64);
  *(_OWORD *)&v6[4].__shared_weak_owners_ = v8;
  std::__shared_count v9 = *(std::__shared_count *)(a2 + 112);
  *(_OWORD *)&v6[5].__shared_owners_ = *(_OWORD *)(a2 + 96);
  v6[6].std::__shared_count = v9;
  std::__shared_count v10 = *(std::__shared_count *)(a2 + 16);
  *(_OWORD *)&v6[1].__shared_owners_ = *(_OWORD *)a2;
  v6[2].std::__shared_count = v10;
  long long v11 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)&v6[2].__shared_weak_owners_ = *(_OWORD *)(a2 + 32);
  *(_OWORD *)&v6[3].__shared_owners_ = v11;
  LOWORD(v6[8].__shared_owners_) = *a3;
  int v12 = *(_DWORD *)(a2 + 160);
  if (v12 == 262152)
  {
    int v13 = 0;
  }
  else
  {
    if (v12 != 65568)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Unsupported espresso type encountered.");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    int v13 = 1;
  }
  *(_DWORD *)&v23[8] = 0;
  *(void *)uint64_t v23 = espresso_buffer_unpack_tensor_shape();
  strcpy((char *)__p, "Unpacking tensor shape");
  HIBYTE(__p[2]) = 22;
  ik::VerifyEspressoStatus((int *)v23, (uint64_t *)__p);
  if (SHIBYTE(__p[2]) < 0)
  {
    operator delete(__p[0]);
    unint64_t v14 = *(void *)&v23[4];
    memset(__p, 0, sizeof(__p));
    if (*(void *)&v23[4]) {
      goto LABEL_7;
    }
LABEL_11:
    uint64_t v16 = 0;
    goto LABEL_12;
  }
  unint64_t v14 = *(void *)&v23[4];
  memset(__p, 0, sizeof(__p));
  if (!*(void *)&v23[4]) {
    goto LABEL_11;
  }
LABEL_7:
  if (v14 >> 61) {
    std::vector<long long>::__throw_length_error[abi:ne180100]();
  }
  size_t v15 = 8 * v14;
  if (((8 * v14) & 0x8000000000000000) != 0) {
    std::vector<long long>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v16 = (char *)operator new(8 * v14);
  unint64_t v14 = (unint64_t)&v16[8 * ((uint64_t)(8 * v14) >> 3)];
  memcpy(v16, __src, v15);
LABEL_12:
  *(void *)a1 = &unk_26C78E630;
  *(_DWORD *)(a1 + 8) = v13;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  uint64_t v17 = v14 - (void)v16;
  if ((char *)v14 != v16)
  {
    if (v17 < 0) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v18 = (char *)operator new(v14 - (void)v16);
    *(void *)(a1 + 16) = v18;
    uint64_t v19 = &v18[8 * (v17 >> 3)];
    *(void *)(a1 + 32) = v19;
    memcpy(v18, v16, v14 - (void)v16);
    *(void *)(a1 + 24) = v19;
  }
  *(void *)(a1 + 40) = v6 + 1;
  *(void *)(a1 + 48) = v6;
  atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  if (v16) {
    operator delete(v16);
  }
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  *(void *)a1 = &unk_26C78E4D0;
  return a1;
}

void sub_2176447CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
}

void sub_217644838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va1, a5);
  va_start(va, a5);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  std::__shared_count v9 = *v7;
  if (*v7)
  {
    *(void *)(v5 + 24) = v9;
    operator delete(v9);
  }
  if (v6) {
    JUMPOUT(0x217644854);
  }
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_217644870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<ik::core::EspressoBufferStorage>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C78E7C8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ik::core::EspressoBufferStorage>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C78E7C8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D449420);
}

void std::__shared_ptr_emplace<ik::core::EspressoBufferStorage>::__on_zero_shared(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 201)) {
    free(*(void **)(a1 + 32));
  }
}

void ik::core::EspressoBufferStorage::~EspressoBufferStorage(void **this)
{
  if (*((unsigned char *)this + 177)) {
    free(this[1]);
  }
}

{
  uint64_t vars8;

  if (*((unsigned char *)this + 177)) {
    free(this[1]);
  }

  JUMPOUT(0x21D449420);
}

uint64_t ik::core::EspressoBufferStorage::Bind(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 32))(a2, a1 + 8);
}

uint64_t ik::core::EspressoBufferStorage::Data(ik::core::EspressoBufferStorage *this)
{
  return *((void *)this + 1);
}

unint64_t ik::core::EspressoBufferStorage::Strides@<X0>(ik::core::EspressoBufferStorage *this@<X0>, void *a2@<X8>)
{
  unint64_t result = espresso_buffer_get_rank();
  unint64_t v5 = result;
  if (result >= 6)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v19, v5);
    unint64_t v14 = std::string::insert(&v19, 0, "Unsupported tensor rank: ");
    int8x16_t v15 = *(int8x16_t *)&v14->__r_.__value_.__l.__data_;
    v17.i64[0] = v14->__r_.__value_.__r.__words[2];
    int8x16_t v16 = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, (const std::string *)&v16);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  int8x16_t v6 = (int8x16_t)vshlq_n_s64(*(int64x2_t *)((char *)this + 152), 2uLL);
  int8x16_t v7 = (int8x16_t)vshlq_n_s64(*(int64x2_t *)((char *)this + 136), 2uLL);
  int8x16_t v16 = vextq_s8(v6, v6, 8uLL);
  int8x16_t v17 = vextq_s8(v7, v7, 8uLL);
  uint64_t v18 = 4 * *((void *)this + 16);
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  if (result)
  {
    uint64_t v8 = 8 * (5 - result);
    size_t v9 = 40 - v8;
    uint64_t v10 = (char *)operator new(40 - v8);
    long long v11 = &v16.i8[v8];
    *a2 = v10;
    uint64_t v12 = &v10[8 * ((unint64_t)(40 - v8) >> 3)];
    a2[2] = v12;
    unint64_t result = (unint64_t)memcpy(v10, v11, v9);
    a2[1] = v12;
  }
  return result;
}

void sub_217644B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  int8x16_t v6 = (unsigned char *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }
  unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)v45, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    unint64_t v14 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      int8x16_t v15 = *v14;
      if (*v14)
      {
        char v16 = v6[23];
        if (v16 >= 0) {
          uint64_t v17 = v6[23];
        }
        else {
          uint64_t v17 = *((void *)v6 + 1);
        }
        if (v16 < 0) {
          int8x16_t v6 = *(unsigned char **)v6;
        }
        if (v13.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v22 = v15[1];
            if (v22 == v11)
            {
              uint64_t v23 = *((unsigned __int8 *)v15 + 39);
              if ((v23 & 0x80u) == 0) {
                uint64_t v24 = *((unsigned __int8 *)v15 + 39);
              }
              else {
                uint64_t v24 = v15[3];
              }
              if (v24 == v17)
              {
                if ((v23 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v15[2], v6, v15[3])) {
                    return v15;
                  }
                }
                else
                {
                  if (!*((unsigned char *)v15 + 39)) {
                    return v15;
                  }
                  uint64_t v25 = 0;
                  while (*((unsigned __int8 *)v15 + v25 + 16) == v6[v25])
                  {
                    if (v23 == ++v25) {
                      return v15;
                    }
                  }
                }
              }
            }
            else if ((v22 & (v12 - 1)) != v4)
            {
              goto LABEL_51;
            }
            int8x16_t v15 = (uint64_t *)*v15;
            if (!v15) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v18 = v15[1];
          if (v18 == v11)
          {
            uint64_t v19 = *((unsigned __int8 *)v15 + 39);
            if ((v19 & 0x80u) == 0) {
              uint64_t v20 = *((unsigned __int8 *)v15 + 39);
            }
            else {
              uint64_t v20 = v15[3];
            }
            if (v20 == v17)
            {
              if ((v19 & 0x80) != 0)
              {
                if (!memcmp((const void *)v15[2], v6, v15[3])) {
                  return v15;
                }
              }
              else
              {
                if (!*((unsigned char *)v15 + 39)) {
                  return v15;
                }
                uint64_t v21 = 0;
                while (*((unsigned __int8 *)v15 + v21 + 16) == v6[v21])
                {
                  if (v19 == ++v21) {
                    return v15;
                  }
                }
              }
            }
          }
          else
          {
            if (v18 >= v12) {
              v18 %= v12;
            }
            if (v18 != v4) {
              break;
            }
          }
          int8x16_t v15 = (uint64_t *)*v15;
        }
        while (v15);
      }
    }
  }
LABEL_51:
  int v26 = (char *)operator new(0x60uLL);
  v45[0] = v26;
  v45[1] = a1 + 16;
  char v46 = 0;
  *(void *)int v26 = 0;
  *((void *)v26 + 1) = v11;
  uint64_t v27 = (std::string *)(v26 + 16);
  float v28 = *a4;
  if (*((char *)*a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v27, *(const std::string::value_type **)v28, *((void *)v28 + 1));
  }
  else
  {
    long long v29 = *v28;
    *((void *)v26 + 4) = *((void *)v28 + 2);
    *(_OWORD *)&v27->__r_.__value_.__l.__data_ = v29;
  }
  *((_DWORD *)v26 + 12) = 1;
  *(_OWORD *)(v26 + 56) = 0u;
  *(_OWORD *)(v26 + 72) = 0u;
  *((void *)v26 + 11) = 0;
  *((void *)v26 + 5) = &unk_26C78E4D0;
  char v46 = 1;
  float v30 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v31 = *(float *)(a1 + 32);
  if (!v12 || (float)(v31 * (float)v12) < v30)
  {
    BOOL v34 = 1;
    if (v12 >= 3) {
      BOOL v34 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v35 = v34 | (2 * v12);
    unint64_t v36 = vcvtps_u32_f32(v30 / v31);
    if (v35 <= v36) {
      size_t prime = v36;
    }
    else {
      size_t prime = v35;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v38 = *(int8x8_t *)(a1 + 8);
    if (prime > *(void *)&v38) {
      goto LABEL_68;
    }
    if (prime < *(void *)&v38)
    {
      unint64_t v39 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(void *)&v38 < 3uLL || (uint8x8_t v40 = (uint8x8_t)vcnt_s8(v38), v40.i16[0] = vaddlv_u8(v40), v40.u32[0] > 1uLL))
      {
        unint64_t v39 = std::__next_prime(v39);
      }
      else
      {
        uint64_t v41 = 1 << -(char)__clz(v39 - 1);
        if (v39 >= 2) {
          unint64_t v39 = v41;
        }
      }
      if (prime <= v39) {
        size_t prime = v39;
      }
      if (prime < *(void *)&v38) {
LABEL_68:
      }
        std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__do_rehash<true>(a1, prime);
    }
    unint64_t v12 = *(void *)(a1 + 8);
    unint64_t v42 = v12 - 1;
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
      {
        unint64_t v4 = v11 % v12;
        unint64_t v32 = *(void **)(*(void *)a1 + 8 * (v11 % v12));
        int v33 = (void *)v45[0];
        if (v32) {
          goto LABEL_57;
        }
      }
      else
      {
        unint64_t v4 = v11;
        unint64_t v32 = *(void **)(*(void *)a1 + 8 * v11);
        int v33 = (void *)v45[0];
        if (v32) {
          goto LABEL_57;
        }
      }
    }
    else
    {
      unint64_t v4 = v42 & v11;
      unint64_t v32 = *(void **)(*(void *)a1 + 8 * (v42 & v11));
      int v33 = (void *)v45[0];
      if (v32) {
        goto LABEL_57;
      }
    }
LABEL_81:
    *int v33 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v45[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v45[0])
    {
      unint64_t v43 = *(void *)(*(void *)v45[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v43 >= v12) {
          v43 %= v12;
        }
      }
      else
      {
        v43 &= v12 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v43) = v45[0];
    }
    goto LABEL_92;
  }
  unint64_t v32 = *(void **)(*(void *)a1 + 8 * v4);
  int v33 = (void *)v45[0];
  if (!v32) {
    goto LABEL_81;
  }
LABEL_57:
  *int v33 = *v32;
  void *v32 = v45[0];
LABEL_92:
  int8x16_t v15 = (uint64_t *)v45[0];
  ++*(void *)(a1 + 24);
  return v15;
}

void sub_217645030(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ik::EspressoTensor>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ik::EspressoTensor>,void *>>>>::reset[abi:ne180100]((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void sub_217645048(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ik::EspressoTensor>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ik::EspressoTensor>,void *>>>>::reset[abi:ne180100]((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ik::EspressoTensor>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ik::EspressoTensor>,void *>>>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    if (!*((unsigned char *)a1 + 16)) {
      goto LABEL_9;
    }
    *(void *)(v2 + 40) = &unk_26C78E630;
    char v3 = *(std::__shared_weak_count **)(v2 + 88);
    if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
    unint64_t v4 = *(void **)(v2 + 56);
    if (v4)
    {
      *(void *)(v2 + 64) = v4;
      operator delete(v4);
    }
    if (*(char *)(v2 + 39) < 0)
    {
      operator delete(*(void **)(v2 + 16));
      unint64_t v5 = (void *)v2;
    }
    else
    {
LABEL_9:
      unint64_t v5 = (void *)v2;
    }
    operator delete(v5);
  }
}

uint64_t std::unordered_map<std::string,ik::EspressoTensor>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  size_t prime = *(void *)(a2 + 8);
  if (prime == 1)
  {
    size_t prime = 2;
LABEL_17:
    std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__do_rehash<true>(a1, prime);
    goto LABEL_18;
  }
  if ((prime & (prime - 1)) != 0)
  {
    size_t prime = std::__next_prime(*(void *)(a2 + 8));
    int8x8_t v5 = *(int8x8_t *)(a1 + 8);
    BOOL v6 = prime >= *(void *)&v5;
    if (prime > *(void *)&v5) {
      goto LABEL_17;
    }
  }
  else
  {
    int8x8_t v5 = 0;
    BOOL v6 = 1;
    if (prime) {
      goto LABEL_17;
    }
  }
  if (!v6)
  {
    unint64_t v7 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v5 < 3uLL || (uint8x8_t v8 = (uint8x8_t)vcnt_s8(v5), v8.i16[0] = vaddlv_u8(v8), v8.u32[0] > 1uLL))
    {
      unint64_t v7 = std::__next_prime(v7);
    }
    else
    {
      uint64_t v9 = 1 << -(char)__clz(v7 - 1);
      if (v7 >= 2) {
        unint64_t v7 = v9;
      }
    }
    if (prime <= v7) {
      size_t prime = v7;
    }
    if (prime < *(void *)&v5) {
      goto LABEL_17;
    }
  }
LABEL_18:
  for (uint64_t i = *(long long **)(a2 + 16); i; uint64_t i = *(long long **)i)
    std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,ik::EspressoTensor> const&>(a1, (uint64_t)(i + 1), i + 1);
  return a1;
}

void sub_217645278(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void sub_21764528C(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,ik::EspressoTensor> const&>(uint64_t a1, uint64_t a2, long long *a3)
{
  int8x8_t v5 = (unsigned char *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v8 = v7;
  }
  unint64_t v9 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)v41, (uint64_t *)a2, v8);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v3 = v9;
      if (v9 >= v11) {
        unint64_t v3 = v9 % v11;
      }
    }
    else
    {
      unint64_t v3 = (v11 - 1) & v9;
    }
    uint8x8_t v13 = *(uint64_t ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      unint64_t v14 = *v13;
      if (*v13)
      {
        char v15 = v5[23];
        if (v15 >= 0) {
          uint64_t v16 = v5[23];
        }
        else {
          uint64_t v16 = *((void *)v5 + 1);
        }
        if (v15 < 0) {
          int8x8_t v5 = *(unsigned char **)v5;
        }
        if (v12.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v21 = v14[1];
            if (v21 == v10)
            {
              uint64_t v22 = *((unsigned __int8 *)v14 + 39);
              if ((v22 & 0x80u) == 0) {
                uint64_t v23 = *((unsigned __int8 *)v14 + 39);
              }
              else {
                uint64_t v23 = v14[3];
              }
              if (v23 == v16)
              {
                if ((v22 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v14[2], v5, v14[3])) {
                    return v14;
                  }
                }
                else
                {
                  if (!*((unsigned char *)v14 + 39)) {
                    return v14;
                  }
                  uint64_t v24 = 0;
                  while (*((unsigned __int8 *)v14 + v24 + 16) == v5[v24])
                  {
                    if (v22 == ++v24) {
                      return v14;
                    }
                  }
                }
              }
            }
            else if ((v21 & (v11 - 1)) != v3)
            {
              goto LABEL_51;
            }
            unint64_t v14 = (uint64_t *)*v14;
            if (!v14) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v17 = v14[1];
          if (v17 == v10)
          {
            uint64_t v18 = *((unsigned __int8 *)v14 + 39);
            if ((v18 & 0x80u) == 0) {
              uint64_t v19 = *((unsigned __int8 *)v14 + 39);
            }
            else {
              uint64_t v19 = v14[3];
            }
            if (v19 == v16)
            {
              if ((v18 & 0x80) != 0)
              {
                if (!memcmp((const void *)v14[2], v5, v14[3])) {
                  return v14;
                }
              }
              else
              {
                if (!*((unsigned char *)v14 + 39)) {
                  return v14;
                }
                uint64_t v20 = 0;
                while (*((unsigned __int8 *)v14 + v20 + 16) == v5[v20])
                {
                  if (v18 == ++v20) {
                    return v14;
                  }
                }
              }
            }
          }
          else
          {
            if (v17 >= v11) {
              v17 %= v11;
            }
            if (v17 != v3) {
              break;
            }
          }
          unint64_t v14 = (uint64_t *)*v14;
        }
        while (v14);
      }
    }
  }
LABEL_51:
  uint64_t v25 = (char *)operator new(0x60uLL);
  v41[0] = v25;
  v41[1] = a1 + 16;
  char v42 = 0;
  *(void *)uint64_t v25 = 0;
  *((void *)v25 + 1) = v10;
  std::pair<std::string const,ik::EspressoTensor>::pair[abi:ne180100]((std::string *)(v25 + 16), a3);
  char v42 = 1;
  float v26 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v27 = *(float *)(a1 + 32);
  if (!v11 || (float)(v27 * (float)v11) < v26)
  {
    BOOL v30 = 1;
    if (v11 >= 3) {
      BOOL v30 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v31 = v30 | (2 * v11);
    unint64_t v32 = vcvtps_u32_f32(v26 / v27);
    if (v31 <= v32) {
      size_t prime = v32;
    }
    else {
      size_t prime = v31;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v34 = *(int8x8_t *)(a1 + 8);
    if (prime > *(void *)&v34) {
      goto LABEL_65;
    }
    if (prime < *(void *)&v34)
    {
      unint64_t v35 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(void *)&v34 < 3uLL || (uint8x8_t v36 = (uint8x8_t)vcnt_s8(v34), v36.i16[0] = vaddlv_u8(v36), v36.u32[0] > 1uLL))
      {
        unint64_t v35 = std::__next_prime(v35);
      }
      else
      {
        uint64_t v37 = 1 << -(char)__clz(v35 - 1);
        if (v35 >= 2) {
          unint64_t v35 = v37;
        }
      }
      if (prime <= v35) {
        size_t prime = v35;
      }
      if (prime < *(void *)&v34) {
LABEL_65:
      }
        std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__do_rehash<true>(a1, prime);
    }
    unint64_t v11 = *(void *)(a1 + 8);
    unint64_t v38 = v11 - 1;
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
      {
        unint64_t v3 = v10 % v11;
        float v28 = *(void **)(*(void *)a1 + 8 * (v10 % v11));
        long long v29 = (void *)v41[0];
        if (v28) {
          goto LABEL_54;
        }
      }
      else
      {
        unint64_t v3 = v10;
        float v28 = *(void **)(*(void *)a1 + 8 * v10);
        long long v29 = (void *)v41[0];
        if (v28) {
          goto LABEL_54;
        }
      }
    }
    else
    {
      unint64_t v3 = v38 & v10;
      float v28 = *(void **)(*(void *)a1 + 8 * (v38 & v10));
      long long v29 = (void *)v41[0];
      if (v28) {
        goto LABEL_54;
      }
    }
LABEL_78:
    *long long v29 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v41[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v41[0])
    {
      unint64_t v39 = *(void *)(*(void *)v41[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v39 >= v11) {
          v39 %= v11;
        }
      }
      else
      {
        v39 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v39) = v41[0];
    }
    goto LABEL_89;
  }
  float v28 = *(void **)(*(void *)a1 + 8 * v3);
  long long v29 = (void *)v41[0];
  if (!v28) {
    goto LABEL_78;
  }
LABEL_54:
  *long long v29 = *v28;
  void *v28 = v41[0];
LABEL_89:
  unint64_t v14 = (uint64_t *)v41[0];
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_2176456C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ik::EspressoTensor>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ik::EspressoTensor>,void *>>>>::reset[abi:ne180100]((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void sub_2176456E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ik::EspressoTensor>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ik::EspressoTensor>,void *>>>>::reset[abi:ne180100]((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,ik::EspressoTensor>::pair[abi:ne180100](std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  int v5 = *((_DWORD *)a2 + 8);
  this[1].__r_.__value_.__r.__words[2] = 0;
  this[1].__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26C78E630;
  LODWORD(this[1].__r_.__value_.__r.__words[1]) = v5;
  this[2].__r_.__value_.__r.__words[0] = 0;
  this[2].__r_.__value_.__l.__size_ = 0;
  unint64_t v7 = (unsigned char *)*((void *)a2 + 5);
  BOOL v6 = (unsigned char *)*((void *)a2 + 6);
  int64_t v8 = v6 - v7;
  if (v6 != v7)
  {
    if (v8 < 0) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v9 = operator new(v6 - v7);
    this[1].__r_.__value_.__r.__words[2] = (std::string::size_type)v9;
    this[2].__r_.__value_.__r.__words[0] = (std::string::size_type)v9;
    std::string::size_type v10 = (std::string::size_type)v9 + 8 * (v8 >> 3);
    this[2].__r_.__value_.__l.__size_ = v10;
    memcpy(v9, v7, v8);
    this[2].__r_.__value_.__r.__words[0] = v10;
  }
  std::string::size_type v11 = *((void *)a2 + 9);
  this[2].__r_.__value_.__r.__words[2] = *((void *)a2 + 8);
  this[3].__r_.__value_.__r.__words[0] = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  this[1].__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26C78E4D0;
  return this;
}

void sub_217645808(_Unwind_Exception *a1)
{
  long long v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  std::pair<std::string const,ik::EspressoTensor>::pair[abi:ne180100]((void **)v1);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = (void *)*v2;
      v2[5] = &unk_26C78E630;
      long long v4 = (std::__shared_weak_count *)v2[11];
      if (v4)
      {
        if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
          break;
        }
      }
      int v5 = (void *)v2[7];
      if (v5) {
        goto LABEL_7;
      }
LABEL_8:
      if (*((char *)v2 + 39) < 0) {
        operator delete((void *)v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v3;
      if (!v3) {
        goto LABEL_12;
      }
    }
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    int v5 = (void *)v2[7];
    if (!v5) {
      goto LABEL_8;
    }
LABEL_7:
    v2[8] = v5;
    operator delete(v5);
    goto LABEL_8;
  }
LABEL_12:
  BOOL v6 = *(void **)a1;
  *(void *)a1 = 0;
  if (v6) {
    operator delete(v6);
  }
  return a1;
}

uint64_t std::pair<std::string const,ik::Tensor>::pair[abi:ne180100]<char const(&)[6],ik::PixelBufferTensor &,0>(uint64_t a1, char *__s, uint64_t a3)
{
  size_t v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    int64_t v8 = operator new(v9 + 1);
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v10 | 0x8000000000000000;
    *(void *)a1 = v8;
    goto LABEL_8;
  }
  *(unsigned char *)(a1 + 23) = v6;
  int64_t v8 = (void *)a1;
  if (v6) {
LABEL_8:
  }
    memmove(v8, __s, v7);
  *((unsigned char *)v8 + v7) = 0;
  int v11 = *(_DWORD *)(a3 + 8);
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = &unk_26C78E630;
  *(_DWORD *)(a1 + 32) = v11;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  uint8x8_t v13 = *(unsigned char **)(a3 + 16);
  uint8x8_t v12 = *(unsigned char **)(a3 + 24);
  int64_t v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    char v15 = (char *)operator new(v12 - v13);
    *(void *)(a1 + 40) = v15;
    *(void *)(a1 + 48) = v15;
    uint64_t v16 = &v15[8 * (v14 >> 3)];
    *(void *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(void *)(a1 + 48) = v16;
  }
  uint64_t v17 = *(void *)(a3 + 48);
  *(void *)(a1 + 64) = *(void *)(a3 + 40);
  *(void *)(a1 + 72) = v17;
  if (v17) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

void sub_217645A70(_Unwind_Exception *a1)
{
  long long v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  std::pair<std::string const,ik::EspressoTensor>::pair[abi:ne180100]((void **)v1);
  _Unwind_Resume(a1);
}

void *std::vector<std::string>::vector[abi:ne180100](void *a1, uint64_t a2, unint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a3)
  {
    if (a3 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = 24 * a3;
    size_t v6 = (char *)operator new(24 * a3);
    uint64_t v7 = 0;
    *a1 = v6;
    a1[1] = v6;
    a1[2] = &v6[v5];
    do
    {
      uint64_t v9 = (std::string *)&v6[v7];
      uint64_t v10 = (long long *)(a2 + v7);
      if (*(char *)(a2 + v7 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
      }
      else
      {
        long long v8 = *v10;
        v9->__r_.__value_.__r.__words[2] = *((void *)v10 + 2);
        *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v8;
      }
      v7 += 24;
    }
    while (v5 != v7);
    a1[1] = &v6[v7];
  }
  return a1;
}

void sub_217645DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void sub_217645DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  for (; v11; v11 -= 24)
  {
    if (*(char *)(v10 + v11 - 1) < 0) {
      operator delete(*(void **)(v10 + v11 - 24));
    }
  }
  *(void *)(v9 + 8) = v10;
  std::__exception_guard_exceptions<std::vector<std::string>::__destroy_vector>::~__exception_guard_exceptions[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

ft::DetectorInternals *ft::DetectorInternals::DetectorInternals(ft::DetectorInternals *this)
{
  uint64_t v2 = (_DWORD *)((char *)this + 8);
  unint64_t v3 = (char *)this + 4364;
  bzero(this, 0x1109uLL);
  bzero(v3, 0x1690uLL);
  char v8 = 0;
  char v7 = 15;
  strcpy(__p, "Create detector");
  int Params = AcDetCreate((uint64_t)this, (uint64_t)&v8);
  ft::EnsureOK((uint64_t)__p, &Params);
  if (v7 < 0) {
    operator delete(*(void **)__p);
  }
  char v7 = 14;
  strcpy(__p, "Start detector");
  int Params = AcDetStart(*(void **)this);
  ft::EnsureOK((uint64_t)__p, &Params);
  if (v7 < 0) {
    operator delete(*(void **)__p);
  }
  char v7 = 19;
  strcpy(__p, "Get detector params");
  int Params = AcDetGetParams(*(uint64_t **)this, v2, (uint64_t)this + 44);
  ft::EnsureOK((uint64_t)__p, &Params);
  if (v7 < 0) {
    operator delete(*(void **)__p);
  }
  return this;
}

void sub_217645F60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x21D449420);
}

uint64_t *std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,ik::Tensor> const&>(uint64_t a1, uint64_t a2, long long *a3)
{
  uint64_t v5 = (unsigned char *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v8 = v7;
  }
  unint64_t v9 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)v41, (uint64_t *)a2, v8);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v3 = v9;
      if (v9 >= v11) {
        unint64_t v3 = v9 % v11;
      }
    }
    else
    {
      unint64_t v3 = (v11 - 1) & v9;
    }
    uint8x8_t v13 = *(uint64_t ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      int64_t v14 = *v13;
      if (*v13)
      {
        char v15 = v5[23];
        if (v15 >= 0) {
          uint64_t v16 = v5[23];
        }
        else {
          uint64_t v16 = *((void *)v5 + 1);
        }
        if (v15 < 0) {
          uint64_t v5 = *(unsigned char **)v5;
        }
        if (v12.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v21 = v14[1];
            if (v21 == v10)
            {
              uint64_t v22 = *((unsigned __int8 *)v14 + 39);
              if ((v22 & 0x80u) == 0) {
                uint64_t v23 = *((unsigned __int8 *)v14 + 39);
              }
              else {
                uint64_t v23 = v14[3];
              }
              if (v23 == v16)
              {
                if ((v22 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v14[2], v5, v14[3])) {
                    return v14;
                  }
                }
                else
                {
                  if (!*((unsigned char *)v14 + 39)) {
                    return v14;
                  }
                  uint64_t v24 = 0;
                  while (*((unsigned __int8 *)v14 + v24 + 16) == v5[v24])
                  {
                    if (v22 == ++v24) {
                      return v14;
                    }
                  }
                }
              }
            }
            else if ((v21 & (v11 - 1)) != v3)
            {
              goto LABEL_51;
            }
            int64_t v14 = (uint64_t *)*v14;
            if (!v14) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v17 = v14[1];
          if (v17 == v10)
          {
            uint64_t v18 = *((unsigned __int8 *)v14 + 39);
            if ((v18 & 0x80u) == 0) {
              uint64_t v19 = *((unsigned __int8 *)v14 + 39);
            }
            else {
              uint64_t v19 = v14[3];
            }
            if (v19 == v16)
            {
              if ((v18 & 0x80) != 0)
              {
                if (!memcmp((const void *)v14[2], v5, v14[3])) {
                  return v14;
                }
              }
              else
              {
                if (!*((unsigned char *)v14 + 39)) {
                  return v14;
                }
                uint64_t v20 = 0;
                while (*((unsigned __int8 *)v14 + v20 + 16) == v5[v20])
                {
                  if (v18 == ++v20) {
                    return v14;
                  }
                }
              }
            }
          }
          else
          {
            if (v17 >= v11) {
              v17 %= v11;
            }
            if (v17 != v3) {
              break;
            }
          }
          int64_t v14 = (uint64_t *)*v14;
        }
        while (v14);
      }
    }
  }
LABEL_51:
  uint64_t v25 = (char *)operator new(0x60uLL);
  v41[0] = v25;
  v41[1] = a1 + 16;
  char v42 = 0;
  *(void *)uint64_t v25 = 0;
  *((void *)v25 + 1) = v10;
  std::pair<std::string const,ik::Tensor>::pair[abi:ne180100]((std::string *)(v25 + 16), a3);
  char v42 = 1;
  float v26 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v27 = *(float *)(a1 + 32);
  if (!v11 || (float)(v27 * (float)v11) < v26)
  {
    BOOL v30 = 1;
    if (v11 >= 3) {
      BOOL v30 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v31 = v30 | (2 * v11);
    unint64_t v32 = vcvtps_u32_f32(v26 / v27);
    if (v31 <= v32) {
      size_t prime = v32;
    }
    else {
      size_t prime = v31;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v34 = *(int8x8_t *)(a1 + 8);
    if (prime > *(void *)&v34) {
      goto LABEL_65;
    }
    if (prime < *(void *)&v34)
    {
      unint64_t v35 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(void *)&v34 < 3uLL || (uint8x8_t v36 = (uint8x8_t)vcnt_s8(v34), v36.i16[0] = vaddlv_u8(v36), v36.u32[0] > 1uLL))
      {
        unint64_t v35 = std::__next_prime(v35);
      }
      else
      {
        uint64_t v37 = 1 << -(char)__clz(v35 - 1);
        if (v35 >= 2) {
          unint64_t v35 = v37;
        }
      }
      if (prime <= v35) {
        size_t prime = v35;
      }
      if (prime < *(void *)&v34) {
LABEL_65:
      }
        std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__do_rehash<true>(a1, prime);
    }
    unint64_t v11 = *(void *)(a1 + 8);
    unint64_t v38 = v11 - 1;
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
      {
        unint64_t v3 = v10 % v11;
        float v28 = *(void **)(*(void *)a1 + 8 * (v10 % v11));
        long long v29 = (void *)v41[0];
        if (v28) {
          goto LABEL_54;
        }
      }
      else
      {
        unint64_t v3 = v10;
        float v28 = *(void **)(*(void *)a1 + 8 * v10);
        long long v29 = (void *)v41[0];
        if (v28) {
          goto LABEL_54;
        }
      }
    }
    else
    {
      unint64_t v3 = v38 & v10;
      float v28 = *(void **)(*(void *)a1 + 8 * (v38 & v10));
      long long v29 = (void *)v41[0];
      if (v28) {
        goto LABEL_54;
      }
    }
LABEL_78:
    *long long v29 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v41[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v41[0])
    {
      unint64_t v39 = *(void *)(*(void *)v41[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v39 >= v11) {
          v39 %= v11;
        }
      }
      else
      {
        v39 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v39) = v41[0];
    }
    goto LABEL_89;
  }
  float v28 = *(void **)(*(void *)a1 + 8 * v3);
  long long v29 = (void *)v41[0];
  if (!v28) {
    goto LABEL_78;
  }
LABEL_54:
  *long long v29 = *v28;
  void *v28 = v41[0];
LABEL_89:
  int64_t v14 = (uint64_t *)v41[0];
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_217646434(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ik::EspressoTensor>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ik::EspressoTensor>,void *>>>>::reset[abi:ne180100]((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void sub_21764644C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ik::EspressoTensor>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ik::EspressoTensor>,void *>>>>::reset[abi:ne180100]((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,ik::Tensor>::pair[abi:ne180100](std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  int v5 = *((_DWORD *)a2 + 8);
  this[1].__r_.__value_.__r.__words[2] = 0;
  this[1].__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26C78E630;
  LODWORD(this[1].__r_.__value_.__r.__words[1]) = v5;
  this[2].__r_.__value_.__r.__words[0] = 0;
  this[2].__r_.__value_.__l.__size_ = 0;
  unint64_t v7 = (unsigned char *)*((void *)a2 + 5);
  size_t v6 = (unsigned char *)*((void *)a2 + 6);
  int64_t v8 = v6 - v7;
  if (v6 != v7)
  {
    if (v8 < 0) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v9 = operator new(v6 - v7);
    this[1].__r_.__value_.__r.__words[2] = (std::string::size_type)v9;
    this[2].__r_.__value_.__r.__words[0] = (std::string::size_type)v9;
    std::string::size_type v10 = (std::string::size_type)v9 + 8 * (v8 >> 3);
    this[2].__r_.__value_.__l.__size_ = v10;
    memcpy(v9, v7, v8);
    this[2].__r_.__value_.__r.__words[0] = v10;
  }
  std::string::size_type v11 = *((void *)a2 + 9);
  this[2].__r_.__value_.__r.__words[2] = *((void *)a2 + 8);
  this[3].__r_.__value_.__r.__words[0] = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

void sub_217646558(_Unwind_Exception *a1)
{
  long long v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  std::pair<std::string const,ik::EspressoTensor>::pair[abi:ne180100]((void **)v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::clear(void *a1)
{
  if (a1[3])
  {
    uint64_t v2 = (void *)a1[2];
    if (v2)
    {
      while (1)
      {
        unint64_t v3 = (void *)*v2;
        v2[5] = &unk_26C78E630;
        long long v4 = (std::__shared_weak_count *)v2[11];
        if (v4)
        {
          if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
            break;
          }
        }
        int v5 = (void *)v2[7];
        if (v5) {
          goto LABEL_8;
        }
LABEL_9:
        if (*((char *)v2 + 39) < 0) {
          operator delete((void *)v2[2]);
        }
        operator delete(v2);
        uint64_t v2 = v3;
        if (!v3) {
          goto LABEL_13;
        }
      }
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      int v5 = (void *)v2[7];
      if (!v5) {
        goto LABEL_9;
      }
LABEL_8:
      v2[8] = v5;
      operator delete(v5);
      goto LABEL_9;
    }
LABEL_13:
    a1[2] = 0;
    uint64_t v6 = a1[1];
    if (v6)
    {
      for (uint64_t i = 0; i != v6; ++i)
        *(void *)(*a1 + 8 * i) = 0;
    }
    a1[3] = 0;
  }
}

void OUTLINED_FUNCTION_0_0(void **a1)
{
}

uint64_t bmBufferResizeCHW(uint64_t result, int a2, unsigned int a3, uint64_t a4)
{
  if (a2) {
    bmBufferResizeCHW();
  }
  int v4 = *(_DWORD *)(a4 + 20);
  if (v4 != *(_DWORD *)(result + 20)) {
    bmBufferResizeCHW();
  }
  if (v4) {
    bmBufferResizeCHW();
  }
  unsigned int v5 = *(_DWORD *)(result + 8);
  unsigned int v6 = v5 / a3;
  if (v5 / a3 * a3 != v5) {
    bmBufferResizeCHW();
  }
  unsigned int v7 = *(_DWORD *)(a4 + 8);
  unsigned int v8 = v7 / a3;
  if (v7 / a3 * a3 != v7) {
    bmBufferResizeCHW();
  }
  unsigned int v9 = *(_DWORD *)(result + 12);
  int v10 = *(_DWORD *)(a4 + 12);
  BOOL v12 = v7 < a3 || v10 == 0;
  BOOL v53 = v12;
  if (v5 < a3)
  {
    if (!v5 || !v9) {
      goto LABEL_72;
    }
    if (v7 && v10) {
      bmBufferResizeCHW();
    }
LABEL_73:
    bmBufferResizeCHW();
  }
  int v13 = 2 * v9;
  if (v10 != 2 * v9)
  {
    if (!v9) {
      goto LABEL_72;
    }
    if (v7 && v10) {
      bmBufferResizeCHW();
    }
    goto LABEL_73;
  }
  int v49 = *(_DWORD *)(a4 + 12);
  if (v8 != 2 * v6)
  {
    if (v9)
    {
      if (v7 && v10) {
        bmBufferResizeCHW();
      }
      goto LABEL_73;
    }
LABEL_72:
    bmBufferResizeCHW();
  }
  int v14 = 0;
  int v15 = *(_DWORD *)(result + 16);
  int v16 = *(_DWORD *)(a4 + 16);
  uint64_t v17 = (v13 - 1);
  uint64_t v18 = (v13 - 2);
  uint64_t v19 = v8 - 1;
  uint64_t v52 = a4;
  uint64_t v51 = result;
  unsigned int v50 = v8;
  do
  {
    unsigned int v20 = v14 * v6;
    if (*(_DWORD *)(result + 12)) {
      BOOL v21 = *(_DWORD *)(result + 8) > v20;
    }
    else {
      BOOL v21 = 0;
    }
    if (!v21) {
      goto LABEL_72;
    }
    if (!*(_DWORD *)(a4 + 12) || *(_DWORD *)(a4 + 8) <= v14 * v8) {
      goto LABEL_73;
    }
    uint64_t v22 = *(void *)result + *(_DWORD *)(result + 16) * v20;
    uint64_t v23 = *(void *)a4 + *(_DWORD *)(a4 + 16) * v14 * v8;
    if (v8 > 1)
    {
      if (!v49) {
        bmBufferResizeCHW();
      }
      if (v9)
      {
        uint64_t v24 = 0;
        char v25 = 1;
        while (1)
        {
          unsigned int v26 = v24 >> 1;
          if (v6 <= v24 >> 1) {
            break;
          }
          uint64_t v27 = 0;
          uint64_t v28 = v24 + 1;
          uint64_t v29 = v23 + (v16 * v24);
          if (v26 + 1 >= v6) {
            unsigned int v30 = v24 >> 1;
          }
          else {
            unsigned int v30 = v26 + 1;
          }
          uint64_t v31 = v22 + v26 * v15;
          uint64_t v32 = v22 + v30 * v15;
          if (v24) {
            int v33 = 1;
          }
          else {
            int v33 = 2;
          }
          do
          {
            uint64_t v34 = v27 + 1;
            uint64_t v35 = v27 >> 1;
            if ((int)v35 + 1 >= v9) {
              uint64_t v36 = v35;
            }
            else {
              uint64_t v36 = (v35 + 1);
            }
            int v37 = (*(char *)(v31 + v35) << (((v27 + 1) & 1) + (v25 & 1)))
                + (((int)(v27 << 31) >> 31) & v33) * *(char *)(v31 + v36)
                + ((2 - v33) << ((v27 + 1) & 1)) * *(char *)(v32 + v35)
                + (((int)(v27 << 31) >> 31) & (2 - v33)) * *(char *)(v32 + v36);
            int v38 = v37 + 2;
            unsigned int v39 = v37 + 5;
            if (v38 >= 0) {
              unsigned int v39 = v38;
            }
            *(unsigned char *)(v29 + v27++) = v39 >> 2;
          }
          while (v17 != v34);
          *(unsigned char *)(v29 + v17) = *(unsigned char *)(v29 + v18);
          ++v25;
          uint64_t v24 = v28;
          if (v28 == v19) {
            goto LABEL_41;
          }
        }
      }
      bmBufferResizeCHW();
    }
LABEL_41:
    if (!v9) {
      bmBufferResizeCHW();
    }
    if (v53) {
      bmBufferResizeCHW();
    }
    uint64_t v40 = 0;
    uint64_t v41 = v22 + v15 * (v6 - 1);
    uint64_t v42 = v23 + (v16 * v19);
    do
    {
      uint64_t v43 = v40 + 1;
      uint64_t v44 = v40 >> 1;
      if ((int)v44 + 1 >= v9) {
        unsigned int v45 = v40 >> 1;
      }
      else {
        unsigned int v45 = v44 + 1;
      }
      int v46 = ((2 * *(char *)(v41 + v44)) << ((v40 + 1) & 1))
          + (((int)(v40 << 31) >> 31) & (2 * *(char *)(v41 + v45)));
      int v47 = v46 + 2;
      unsigned int v48 = v46 + 5;
      if (v47 >= 0) {
        unsigned int v48 = v47;
      }
      *(unsigned char *)(v42 + v40++) = v48 >> 2;
    }
    while (v17 != v43);
    *(unsigned char *)(v42 + v17) = *(unsigned char *)(v42 + v18);
    ++v14;
    a4 = v52;
    unint64_t result = v51;
    unsigned int v8 = v50;
  }
  while (v14 != a3);
  return result;
}

void bmBufferPartialResizeCHW(_DWORD *a1, int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, _DWORD *a8)
{
  if (a2 != 1) {
    bmBufferPartialResizeCHW();
  }
  unsigned int v8 = a3;
  unsigned int v9 = a1;
  unsigned int v10 = a1[2];
  unsigned int v11 = v10 / a3;
  if (v10 / a3 * a3 != v10) {
    bmBufferPartialResizeCHW();
  }
  BOOL v12 = a8;
  unsigned int v13 = a8[2];
  unsigned int v14 = v13 / a3;
  if (v13 / a3 * a3 != v13) {
    bmBufferPartialResizeCHW();
  }
  unsigned int v15 = a8[3];
  unsigned int v16 = a1[3];
  if (v16) {
    BOOL v17 = v10 >= a3;
  }
  else {
    BOOL v17 = 0;
  }
  if (!v17)
  {
    if (v10 && v16)
    {
      if (v13)
      {
        if (v15) {
          bmBufferPartialResizeCHW();
        }
      }
      goto LABEL_83;
    }
LABEL_82:
    AcAttrNode::postProcess();
  }
  if (v15 < v16)
  {
    if (!v10 || !v16) {
      goto LABEL_82;
    }
    if (v13 && v15) {
      bmBufferPartialResizeCHW();
    }
LABEL_83:
    AcAttrNode::postProcess();
  }
  if (v14 < v11)
  {
    if (!v10 || !v16) {
      goto LABEL_82;
    }
    if (v13 && v15) {
      bmBufferPartialResizeCHW();
    }
    goto LABEL_83;
  }
  if (a1[5] != 6)
  {
    if (!v10 || !v16) {
      goto LABEL_82;
    }
    if (v13 && v15) {
      bmBufferPartialResizeCHW();
    }
    goto LABEL_83;
  }
  if (a8[5] != 6)
  {
    if (!v10 || !v16) {
      goto LABEL_82;
    }
    if (v13 && v15) {
      bmBufferPartialResizeCHW();
    }
    goto LABEL_83;
  }
  int v81 = a8[4];
  size_t v18 = v81 * v14;
  if (a4 < a5)
  {
    int v20 = 0;
    int v80 = a1[4];
    signed int v90 = v11 - 1;
    float v88 = (float)(v11 - 1);
    float v89 = (float)(v14 - 1);
    float v21 = (float)(v15 - 1);
    uint64_t v78 = a4;
    uint64_t v85 = a5;
    if (a4 <= v14) {
      uint64_t v22 = v14;
    }
    else {
      uint64_t v22 = a4;
    }
    uint64_t v87 = v22;
    unsigned int v86 = v11;
    int v74 = v13 / a3;
    size_t v73 = v81 * v14;
    signed int v84 = v16 - 1;
    float v23 = (float)(v16 - 1);
    float v24 = v21;
    while (1)
    {
      unsigned int v25 = v20 * v11;
      if (!v9[3] || v9[2] <= v25) {
        goto LABEL_82;
      }
      if (!v12[3] || v12[2] <= v20 * v14) {
        goto LABEL_83;
      }
      int v79 = v20;
      uint64_t v83 = *(void *)v9 + v9[4] * v25;
      uint64_t v82 = (char *)(*(void *)v12 + v12[4] * v20 * v14);
      bzero(v82, v18);
      uint64_t v27 = v78;
      do
      {
        float v28 = (float)((float)v27 / v89) * v88;
        signed int v29 = vcvtms_s32_f32(v28);
        float v30 = bmClamp(v28 - (float)(int)floorf(v28), 0.0, 1.0);
        unsigned int v31 = bmClamp(v29 - 1, 0, v90);
        if (v11 <= v31) {
          AcAttrNode::postProcess();
        }
        unsigned int v32 = v31;
        unsigned int v33 = bmClamp(v29, 0, v90);
        if (v11 <= v33) {
          AcAttrNode::postProcess();
        }
        unsigned int v34 = v33;
        unsigned int v35 = bmClamp(v29 + 1, 0, v90);
        if (v11 <= v35) {
          AcAttrNode::postProcess();
        }
        unsigned int v36 = v35;
        unsigned int v37 = bmClamp(v29 + 2, 0, v90);
        if (v11 <= v37) {
          AcAttrNode::postProcess();
        }
        if (v27 == v87) {
          AcAttrNode::postProcess();
        }
        uint64_t v92 = v27;
        if (a6 < a7)
        {
          uint64_t v94 = v83 + v32 * v80;
          uint64_t v38 = v83 + v34 * v80;
          uint64_t v39 = v83 + v36 * v80;
          uint64_t v40 = v83 + v37 * v80;
          float v93 = &v82[(v81 * v27)];
          float v41 = vabds_f32(-1.0, v30);
          float v42 = (float)((float)((float)(v41 * (float)(v41 * 3.75)) + (float)((float)(v41 * (float)(v41 * -0.75)) * v41))
                      + (float)(v41 * -6.0))
              + 3.0;
          float v43 = fabsf(v30);
          float v44 = (float)((float)(v43 * (float)(v43 * -2.25)) + (float)((float)(v43 * (float)(v43 * 1.25)) * v43)) + 1.0;
          float v45 = vabds_f32(1.0, v30);
          float v46 = (float)((float)(v45 * (float)(v45 * -2.25)) + (float)((float)(v45 * (float)(v45 * 1.25)) * v45)) + 1.0;
          float v47 = vabds_f32(2.0, v30);
          float v48 = (float)((float)((float)(v47 * (float)(v47 * 3.75)) + (float)((float)(v47 * (float)(v47 * -0.75)) * v47))
                      + (float)(v47 * -6.0))
              + 3.0;
          uint64_t v49 = a6;
          do
          {
            float v50 = (float)((float)v49 / v24) * v23;
            signed int v51 = vcvtms_s32_f32(v50);
            float v52 = bmClamp(v50 - (float)(int)floorf(v50), 0.0, 1.0);
            unsigned int v53 = bmClamp(v51 - 1, 0, v84);
            unsigned int v54 = bmClamp(v51, 0, v84);
            unsigned int v55 = bmClamp(v51 + 1, 0, v84);
            unsigned int v56 = bmClamp(v51 + 2, 0, v84);
            uint64_t v57 = 4 * v53;
            uint64_t v58 = 4 * v54;
            uint64_t v59 = 4 * v55;
            uint64_t v60 = 4 * v56;
            float v61 = vabds_f32(-1.0, v52);
            float v62 = fabsf(v52);
            float v63 = (float)((float)(v62 * (float)(v62 * -2.25)) + (float)((float)(v62 * (float)(v62 * 1.25)) * v62)) + 1.0;
            float v64 = vabds_f32(1.0, v52);
            float v65 = (float)((float)(v64 * (float)(v64 * -2.25)) + (float)((float)(v64 * (float)(v64 * 1.25)) * v64)) + 1.0;
            float v66 = vabds_f32(2.0, v52);
            float v67 = (float)((float)((float)(v61 * (float)(v61 * 3.75)) + (float)((float)(v61 * (float)(v61 * -0.75)) * v61))
                        + (float)(v61 * -6.0))
                + 3.0;
            float v68 = (float)((float)((float)(v66 * (float)(v66 * 3.75)) + (float)((float)(v66 * (float)(v66 * -0.75)) * v66))
                        + (float)(v66 * -6.0))
                + 3.0;
            *(float *)&v93[4 * v49++] = (float)((float)((float)(v44
                                                              * (float)((float)((float)((float)(v63
                                                                                              * *(float *)(v38 + v58))
                                                                                      + (float)(v67
                                                                                              * *(float *)(v38 + v57)))
                                                                              + (float)(v65 * *(float *)(v38 + v59)))
                                                                      + (float)(v68 * *(float *)(v38 + v60))))
                                                      + (float)(v42
                                                              * (float)((float)((float)((float)(v63
                                                                                              * *(float *)(v94 + v58))
                                                                                      + (float)(v67
                                                                                              * *(float *)(v94 + v57)))
                                                                              + (float)(v65 * *(float *)(v94 + v59)))
                                                                      + (float)(v68 * *(float *)(v94 + v60)))))
                                              + (float)(v46
                                                      * (float)((float)((float)((float)(v63 * *(float *)(v39 + v58))
                                                                              + (float)(v67 * *(float *)(v39 + v57)))
                                                                      + (float)(v65 * *(float *)(v39 + v59)))
                                                              + (float)(v68 * *(float *)(v39 + v60)))))
                                      + (float)(v48
                                              * (float)((float)((float)((float)(v63 * *(float *)(v40 + v58))
                                                                      + (float)(v67 * *(float *)(v40 + v57)))
                                                              + (float)(v65 * *(float *)(v40 + v59)))
                                                      + (float)(v68 * *(float *)(v40 + v60))));
          }
          while (a7 != v49);
        }
        uint64_t v27 = v92 + 1;
        unsigned int v11 = v86;
      }
      while (v92 + 1 != v85);
      int v20 = v79 + 1;
      BOOL v12 = a8;
      unsigned int v9 = a1;
      unsigned int v14 = v74;
      size_t v18 = v73;
      if (v79 + 1 == a3) {
        return;
      }
    }
  }
  int v69 = 0;
  do
  {
    if (v9[3]) {
      BOOL v70 = v9[2] > v69 * v11;
    }
    else {
      BOOL v70 = 0;
    }
    if (!v70) {
      goto LABEL_82;
    }
    unsigned int v71 = v69 * v14;
    if (v12[3]) {
      BOOL v72 = v12[2] > v71;
    }
    else {
      BOOL v72 = 0;
    }
    if (!v72) {
      goto LABEL_83;
    }
    bzero((void *)(*(void *)v12 + v12[4] * v71), v18);
    ++v69;
    --v8;
  }
  while (v8);
}

void bmBufferResizeCoordConvert(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, float *a6, float *a7, float a8, float a9)
{
  if (a5 >= 3) {
    bmBufferResizeCoordConvert();
  }
  if (!a4 || !a1 || !a2 || !a3) {
    bmBufferResizeCoordConvert();
  }
  if (a5)
  {
    float v14 = (float)a3;
    float v15 = (float)a1;
    float v16 = (float)a4;
    float v17 = (float)a2;
    float v18 = bmMinimum((float)a3 / (float)a1, (float)a4 / (float)a2);
    *a6 = v18 * a8;
    *a7 = v18 * a9;
    if (a5 != 2) {
      return;
    }
    *a6 = (float)((float)(v14 - (float)(v18 * v15)) * 0.5) + *a6;
    float v19 = (float)((float)(v16 - (float)(v18 * v17)) * 0.5) + *a7;
  }
  else
  {
    *a6 = (float)(a8 / (float)a1) * (float)a3;
    float v19 = (float)(a9 / (float)a2) * (float)a4;
  }
  *a7 = v19;
}

float bmBufferResizeCoordConvertReversed(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, float *a6, float *a7, float a8, float a9)
{
  if (a5 >= 3) {
    bmBufferResizeCoordConvertReversed();
  }
  if (!a4 || !a1 || !a2 || !a3) {
    bmBufferResizeCoordConvertReversed();
  }
  float v14 = (float)a3;
  if (a5)
  {
    float v15 = (float)a1;
    float v16 = (float)a4;
    float v17 = (float)a2;
    float v18 = bmMinimum(v14 / (float)a1, (float)a4 / (float)a2);
    float v19 = 0.0;
    float v20 = (float)(v14 - (float)(v18 * v15)) * 0.5;
    if (a5 == 2) {
      float v19 = (float)(v16 - (float)(v18 * v17)) * 0.5;
    }
    else {
      float v20 = 0.0;
    }
    float v21 = 1.0 / v18;
    *a6 = v21 * (float)(a8 - v20);
    float v22 = a9 - v19;
  }
  else
  {
    *a6 = (float)(a8 / v14) * (float)a1;
    float v21 = a9 / (float)a4;
    float v22 = (float)a2;
  }
  float result = v21 * v22;
  *a7 = result;
  return result;
}

uint64_t TtTrkRpnCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2 && a3) {
    operator new();
  }
  return 4294967292;
}

void sub_217647390(_Unwind_Exception *a1)
{
  MEMORY[0x21D449420](v1, 0x10A0C4007650D25);
  _Unwind_Resume(a1);
}

uint64_t TtTrkRpnDestroy(TtTrkRpnNode **a1)
{
  if (!a1) {
    return 4294967292;
  }
  uint64_t v2 = *a1;
  if (!v2) {
    return 4294967292;
  }
  TtTrkRpnNode::~TtTrkRpnNode(v2);
  MEMORY[0x21D449420]();
  MEMORY[0x21D449420](a1, 0x10A0C40FC37F48CLL);
  return 0;
}

uint64_t TtTrkRpnStart(uint64_t *a1, uint64_t a2)
{
  if (a1 && a2 && (uint64_t v2 = *a1) != 0) {
    return TtTrkRpnNode::restart(v2, a2);
  }
  else {
    return 4294967292;
  }
}

uint64_t TtTrkRpnStop(void *a1)
{
  uint64_t result = 4294967292;
  if (a1)
  {
    if (*a1) {
      return 0;
    }
    else {
      return 4294967292;
    }
  }
  return result;
}

uint64_t TtTrkRpnGetParams(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1 || !*(void *)a1) {
    return 4294967292;
  }
  uint64_t result = 4294967292;
  if (a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      long long v5 = *(_OWORD *)(a1 + 24);
      *(_OWORD *)a3 = *(_OWORD *)(a1 + 8);
      *(_OWORD *)(a3 + 16) = v5;
      long long v6 = *(_OWORD *)(a1 + 40);
      long long v7 = *(_OWORD *)(a1 + 56);
      long long v8 = *(_OWORD *)(a1 + 88);
      *(_OWORD *)(a3 + 64) = *(_OWORD *)(a1 + 72);
      *(_OWORD *)(a3 + 80) = v8;
      *(_OWORD *)(a3 + 32) = v6;
      *(_OWORD *)(a3 + 48) = v7;
      long long v9 = *(_OWORD *)(a1 + 104);
      long long v10 = *(_OWORD *)(a1 + 120);
      long long v11 = *(_OWORD *)(a1 + 152);
      *(_OWORD *)(a3 + 128) = *(_OWORD *)(a1 + 136);
      *(_OWORD *)(a3 + 144) = v11;
      *(_OWORD *)(a3 + 96) = v9;
      *(_OWORD *)(a3 + 112) = v10;
      long long v12 = *(_OWORD *)(a1 + 168);
      long long v13 = *(_OWORD *)(a1 + 184);
      long long v14 = *(_OWORD *)(a1 + 200);
      *(_DWORD *)(a3 + 208) = *(_DWORD *)(a1 + 216);
      *(_OWORD *)(a3 + 176) = v13;
      *(_OWORD *)(a3 + 192) = v14;
      *(_OWORD *)(a3 + 160) = v12;
    }
  }
  return result;
}

uint64_t TtTrkRpnGetExtState(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 4294967292;
  }
  if (!*a1) {
    return 4294967292;
  }
  uint64_t result = 4294967292;
  if (a2)
  {
    if (a3)
    {
      if (a4)
      {
        uint64_t v6 = *(void *)(a3 + 12);
        if (v6)
        {
          int v7 = *(_DWORD *)(a3 + 20);
          if (v7)
          {
            if (*(void *)(a3 + 24) && *(void *)(a3 + 32) && *(_DWORD *)(a3 + 40))
            {
              if (*(_DWORD *)(a3 + 44))
              {
                *(_DWORD *)a4 = 4;
                *(void *)(a4 + 4) = a2;
                *(_DWORD *)(a4 + 12) = 1864;
                *(void *)(a4 + 16) = v6;
                *(_DWORD *)(a4 + 24) = v7;
                *(void *)(a4 + 28) = *(void *)(a3 + 24);
                *(_DWORD *)(a4 + 36) = *(_DWORD *)(a3 + 40);
                *(void *)(a4 + 28) = *(void *)(a3 + 32);
                *(_DWORD *)(a4 + 36) = *(_DWORD *)(a3 + 44);
                int v8 = ttMemBlockCoalesceNoSort(a4 + 4, 4);
                uint64_t result = 0;
                *(_DWORD *)a4 = v8;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t TtTrkRpnExemplarPreProcess(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (!a1 || !*(void *)a1) {
    return 4294967292;
  }
  uint64_t result = 4294967292;
  if (a2)
  {
    if (a3)
    {
      if (a4)
      {
        if (a5)
        {
          if (a6)
          {
            if (a7)
            {
              uint64_t result = TtTrkRpnNode::setUpNetBuffers(a5, (_DWORD *)(a1 + 8), a7);
              if (!result)
              {
                if (!*(unsigned char *)(a2 + 8) || (uint64_t result = TtTrkRpnNode::restart(*(void *)a1, a4), !result))
                {
                  uint64_t v13 = *(void *)a1;
                  return TtTrkRpnNode::exemplarPreProcess(v13, a2, (long long *)(a3 + 184), (int *)(a3 + 180), a4, a6);
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t TtTrkRpnInstancePreProcess(uint64_t a1, uint64_t a2, uint64_t a3, float32x2_t *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (!a1 || !*(void *)a1) {
    return 4294967292;
  }
  uint64_t result = 4294967292;
  if (a2)
  {
    if (a3)
    {
      if (a4)
      {
        if (a5)
        {
          if (a6)
          {
            if (a7)
            {
              uint64_t result = TtTrkRpnNode::setUpNetBuffers(a5, (_DWORD *)(a1 + 8), a7);
              if (!result)
              {
                if (*(unsigned char *)(a2 + 8))
                {
                  return 4294967294;
                }
                else
                {
                  uint64_t v13 = *(void *)a1;
                  return TtTrkRpnNode::instancePreProcess(v13, a2, a3 + 184, a3 + 180, a4, a6);
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t TtTrkRpnPreProcessCropResizeTempBytes(rtcv *a1, int a2, _DWORD *a3)
{
  *a3 = rtcv::simImageChMeanTempBytes(a1, a2);
  return 0;
}

uint64_t TtTrkRpnPreProcessCropResizeRef(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (!a1) {
    return 4294967292;
  }
  uint64_t result = 4294967292;
  if (a2)
  {
    if (*(void *)a1)
    {
      if (a4)
      {
        if (a6)
        {
          if (*(void *)a3)
          {
            if ((*(unsigned char *)(a3 + 12) & 3) == 0)
            {
              uint64_t v13 = (void **)(a1 + 220);
              uint64_t result = TtTrkRpnNode::setUpNetBuffers(a7, (_DWORD *)(a1 + 8), a1 + 220);
              if (!result)
              {
                if (*(unsigned char *)(a4 + 80))
                {
                  *(unsigned char *)(a4 + 80) = 0;
                  if (!*v13) {
                    return 4294967292;
                  }
                  unsigned int v14 = *(_DWORD *)(a1 + 232);
                  if (v14 != *(_DWORD *)(a1 + 28) * *(_DWORD *)(a1 + 20)) {
                    return 4294967292;
                  }
                  unsigned int v15 = *(_DWORD *)(a1 + 228);
                  if (v15 != *(_DWORD *)(a1 + 24)) {
                    return 4294967292;
                  }
                  unsigned int v16 = *(_DWORD *)(a1 + 236);
                  uint64_t result = 4294967292;
                  if (v16 < v14 || (v16 & 0x3F) != 0) {
                    return result;
                  }
                  if (!rtcv::simCropResizeExtendMean(*(void **)a3, *(_DWORD *)(a3 + 12) >> 2, *(_DWORD *)(a3 + 8), *(_DWORD *)(a3 + 16), 0, 0, 0, *v13, *(float *)(a6 + 112), *(float *)(a6 + 116), (float)v15 / fmaxf(*(float *)(a6 + 124), 1.0), v14 >> 2, v15, v16, a6 + 1858))return 4294967288; {
                }
                  }
                if (!*(unsigned char *)(a4 + 81)) {
                  return 0;
                }
                *(unsigned char *)(a4 + 81) = 0;
                if (*(void *)(a1 + 244))
                {
                  unsigned int v17 = *(_DWORD *)(a1 + 256);
                  if (v17 == *(_DWORD *)(a1 + 44) * *(_DWORD *)(a1 + 36)
                    && *(_DWORD *)(a1 + 252) == *(_DWORD *)(a1 + 40))
                  {
                    unsigned int v18 = *(_DWORD *)(a1 + 260);
                    uint64_t result = 4294967292;
                    if (v18 >= v17 && (v18 & 0x3F) == 0)
                    {
                      rtcv::simImageChMean(*(const unsigned __int8 **)a3, *(_DWORD *)(a3 + 12) >> 2, *(_DWORD *)(a3 + 8), 0, *(float **)a5, *(_DWORD *)(a5 + 8), (unsigned char *)(a6 + 1858));
                      BOOL v19 = rtcv::simCropResizeExtendMean(*(void **)a3, *(_DWORD *)(a3 + 12) >> 2, *(_DWORD *)(a3 + 8), *(_DWORD *)(a3 + 16), 0, 0, 0, *(void **)(a1 + 244), *(float *)(a6 + 96), *(float *)(a6 + 100), (float)*(unsigned int *)(a1 + 252) / fmaxf(*(float *)(a6 + 108), 1.0), *(_DWORD *)(a1 + 256) >> 2, *(_DWORD *)(a1 + 252), *(_DWORD *)(a1 + 260), a6 + 1858);
                      uint64_t result = 0;
                      if (!v19) {
                        return 4294967288;
                      }
                    }
                    return result;
                  }
                }
                return 4294967292;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

__n128 TtTrkRpnGetExemplarCrop(__n128 *a1, __n128 *a2)
{
  if (a2)
  {
    if (a1[116].n128_u8[0])
    {
      __n128 result = a1[6];
      *a2 = result;
    }
  }
  return result;
}

__n128 TtTrkRpnGetInstanceCrop(__n128 *a1, __n128 *a2)
{
  if (a2)
  {
    if (a1[116].n128_u8[1])
    {
      __n128 result = a1[7];
      *a2 = result;
    }
  }
  return result;
}

__n128 TtTrkRpnExemplarPostProcess(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, unsigned char *a6)
{
  if (a1
    && *(void *)a1
    && a2
    && a3
    && a5
    && a6
    && !TtTrkRpnNode::setUpNetBuffers(a3, (_DWORD *)(a1 + 8), a1 + 220)
    && !TtTrkRpnNode::exemplarPostProcess(*(void *)a1, a1 + 268, 2u, a2, a5)
    && *a6 <= 2uLL)
  {
    long long v11 = &a6[20 * *a6];
    *(_OWORD *)(v11 + 21) = xmmword_21766719D;
    *(_DWORD *)(v11 + 37) = 0;
    long long v12 = (__n128 *)TtTrkRpnNode::config(*(TtTrkRpnNode **)a1);
    __n128 result = *v12;
    *(_DWORD *)(v11 + 97) = v12[1].n128_u32[0];
    *(__n128 *)(v11 + 81) = result;
    ++*a6;
  }
  return result;
}

uint64_t TtTrkRpnInstancePostProcess(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6)
{
  if (!a1) {
    return 4294967292;
  }
  if (!*(void *)a1) {
    return 4294967292;
  }
  uint64_t result = 4294967292;
  if (a2)
  {
    if (a3)
    {
      if (a5)
      {
        if (a6)
        {
          uint64_t result = TtTrkRpnNode::setUpNetBuffers(a3, (_DWORD *)(a1 + 8), a1 + 220);
          if (!result)
          {
            uint64_t result = TtTrkRpnNode::instancePostProcess(*(void *)a1, a1 + 316, 2, a2, a5, (uint64_t)(a6 + 184), (_DWORD *)a6 + 45);
            if (!result)
            {
              unsigned int v11 = *a6;
              if (v11 <= 2)
              {
                uint64_t result = 0;
                *a6 = v11 + 1;
                return result;
              }
              return 4294967292;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t bmQsort(uint64_t result, unint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a2 >= 2 && a3)
  {
    v8[4] = v4;
    v8[5] = v5;
    if ((a3 & 3) != 0) {
      unint64_t v6 = a3;
    }
    else {
      unint64_t v6 = a3 >> 2;
    }
    int v7 = swap8;
    v8[0] = a3;
    v8[1] = v6;
    if ((a3 & 3) == 0) {
      int v7 = swap32;
    }
    v8[2] = a4;
    v8[3] = v7;
    return qsort_internal(result, a2, (uint64_t)v8);
  }
  return result;
}

uint64_t swap32(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a4[1];
  if (v4)
  {
    unint64_t v5 = result + *a4 * a3;
    unint64_t v6 = result + *a4 * a2;
    if (a4[1] < 8uLL
      || ((uint64_t v7 = ((4 * v4 + 0x3FFFFFFFCLL) & 0x3FFFFFFFCLL) + 4, v5 + v7 > v6) ? (v8 = v6 + v7 > v5) : (v8 = 0), v8))
    {
      unsigned int v11 = (int *)(result + *a4 * a3);
      long long v12 = (int *)(result + *a4 * a2);
    }
    else
    {
      uint64_t v9 = a4[1] & 7;
      uint64_t v10 = a4[1] - v9;
      LODWORD(v4) = v4 & 7;
      unsigned int v11 = (int *)(v5 + 4 * v10);
      long long v12 = (int *)(v6 + 4 * v10);
      uint64_t v13 = (long long *)(v6 + 16);
      unsigned int v14 = (long long *)(v5 + 16);
      do
      {
        long long v15 = *(v13 - 1);
        long long v16 = *v13;
        long long v17 = *v14;
        *(v13 - 1) = *(v14 - 1);
        *uint64_t v13 = v17;
        *(v14 - 1) = v15;
        long long *v14 = v16;
        v13 += 2;
        v14 += 2;
        v10 -= 8;
      }
      while (v10);
      if (!v9) {
        return result;
      }
    }
    do
    {
      int v18 = *v12;
      *v12++ = *v11;
      *v11++ = v18;
      LODWORD(v4) = v4 - 1;
    }
    while (v4);
  }
  return result;
}

double swap8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a4[1];
  if (v4)
  {
    unint64_t v5 = a1 + *a4 * a3;
    unint64_t v6 = a1 + *a4 * a2;
    unint64_t v7 = a4[1];
    if (v7 < 8 || ((uint64_t v8 = (v4 - 1) + 1, v5 + v8 > v6) ? (v9 = v6 + v8 > v5) : (v9 = 0), v9))
    {
      unsigned int v11 = (char *)(a1 + *a4 * a3);
      long long v12 = (char *)(a1 + *a4 * a2);
      goto LABEL_10;
    }
    if (v7 < 0x20)
    {
      unint64_t v10 = 0;
      goto LABEL_17;
    }
    unint64_t v10 = v7 - (a4[1] & 0x1FLL);
    unsigned int v14 = (long long *)(v6 + 16);
    long long v15 = (long long *)(v5 + 16);
    unint64_t v16 = v10;
    do
    {
      long long v17 = *(v14 - 1);
      long long v18 = *v14;
      long long v19 = *v15;
      *(v14 - 1) = *(v15 - 1);
      long long *v14 = v19;
      *(v15 - 1) = v17;
      long long *v15 = v18;
      v14 += 2;
      v15 += 2;
      v16 -= 32;
    }
    while (v16);
    if ((v4 & 0x1F) != 0)
    {
      if ((v4 & 0x1Fu) < 8uLL)
      {
        long long v12 = (char *)(v6 + v10);
        unsigned int v11 = (char *)(v5 + v10);
        LODWORD(v4) = v4 - v10;
        goto LABEL_10;
      }
LABEL_17:
      uint64_t v20 = v4 & 7;
      LODWORD(v4) = v4 - (v7 - v20);
      unsigned int v11 = (char *)(v5 + v7 - v20);
      long long v12 = (char *)(v6 + v7 - v20);
      float v21 = (void *)(v6 + v10);
      float v22 = (void *)(v5 + v10);
      unint64_t v23 = v10 + v20 - v7;
      do
      {
        *(void *)&long long v17 = *v21;
        *v21++ = *v22;
        *v22++ = v17;
        v23 += 8;
      }
      while (v23);
      if (!v20) {
        return *(double *)&v17;
      }
      do
      {
LABEL_10:
        char v13 = *v12;
        *v12++ = *v11;
        *v11++ = v13;
        LODWORD(v4) = v4 - 1;
      }
      while (v4);
    }
  }
  return *(double *)&v17;
}

uint64_t qsort_internal(uint64_t result, unint64_t a2, uint64_t a3)
{
  unint64_t v4 = a2;
  uint64_t v5 = result;
  if (a2 >= 7)
  {
    do
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      unint64_t v9 = v4 - 1;
      do
      {
        if ((*(int (**)(unint64_t, uint64_t))(a3 + 16))(v5 + *(void *)a3 * v9, v5 + *(void *)a3 * v8) >= 1)(*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 24))(v5, v7++, v8, a3); {
        ++v8;
        }
      }
      while (v9 != v8);
      (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a3 + 24))(v5, v4 - 1, v7, a3);
      uint64_t result = qsort_internal(v5, v7, a3);
      v5 += *(void *)a3 + *(void *)a3 * v7;
      v4 += ~v7;
    }
    while (v4 > 6);
  }
  if (v4 >= 2)
  {
    for (uint64_t i = 1; i != v4; ++i)
    {
      uint64_t v10 = i;
      do
      {
        uint64_t v11 = v10 - 1;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(v5 + *(void *)a3 * (v10 - 1), v5 + *(void *)a3 * v10);
        if ((int)result < 1) {
          break;
        }
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 24))(v5, v10 - 1, v10, a3);
        --v10;
      }
      while (v11);
    }
  }
  return result;
}

uint64_t bmHeapsort(uint64_t a1, unint64_t a2, unint64_t a3, int (*a4)(uint64_t, uint64_t))
{
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if ((a3 & 3) != 0) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = a3 >> 2;
  }
  uint64_t v7 = (void (*)(uint64_t, uint64_t, uint64_t, void *))swap8;
  v26[0] = a3;
  v26[1] = v6;
  if ((a3 & 3) == 0) {
    uint64_t v7 = (void (*)(uint64_t, uint64_t, uint64_t, void *))swap32;
  }
  uint64_t v27 = a4;
  float v28 = v7;
  if (a2 < 7)
  {
    if (a2 >= 2)
    {
      if (v27(a1, v26[0] + a1) >= 1) {
        v28(a1, 0, 1, v26);
      }
      if (a2 != 2)
      {
        unint64_t v17 = 2 - a2;
        uint64_t v18 = -3;
        do
        {
          if (v27(a1 + v26[0] * (v18 + 4), a1 + v26[0] * (v18 + 5)) >= 1)
          {
            v28(a1, v18 + 4, v18 + 5, v26);
            if (v27(a1 + v26[0] * (v18 + 3), a1 + v26[0] * (v18 + 4)) >= 1)
            {
              v28(a1, v18 + 3, v18 + 4, v26);
              if (v18 != -3 && v27(a1 + v26[0] * (v18 + 2), a1 + v26[0] * (v18 + 3)) >= 1)
              {
                v28(a1, v18 + 2, v18 + 3, v26);
                if (v18 != -2 && v27(a1 + v26[0] * (v18 + 1), a1 + v26[0] * (v18 + 2)) >= 1)
                {
                  v28(a1, v18 + 1, v18 + 2, v26);
                  if (v18 != -1 && v27(a1 + v26[0] * v18, a1 + v26[0] * (v18 + 1)) >= 1) {
                    v28(a1, v18, v18 + 1, v26);
                  }
                }
              }
            }
          }
          ++v18;
        }
        while (v17 + v18 != -3);
      }
    }
  }
  else
  {
    int v8 = a2 - 1;
    if ((int)a2 >= 1)
    {
      if ((int)a2 >= 2) {
        int v8 = a2 - 2;
      }
      unint64_t v9 = (v8 >> 1);
      unint64_t v10 = a2 - 1;
      do
      {
        unint64_t v12 = (2 * v9) | 1;
        if (v12 <= v10)
        {
          uint64_t v13 = 2 * v9;
          unint64_t v14 = v9;
          do
          {
            if (v27(a1 + v26[0] * v12, a1 + v26[0] * v14) <= 0) {
              unint64_t v15 = v14;
            }
            else {
              unint64_t v15 = v12;
            }
            if (v13 + 2 <= v10 && v27(a1 + v26[0] * (v13 + 2), a1 + v26[0] * v15) > 0) {
              unint64_t v15 = v13 + 2;
            }
            if (v15 == v14) {
              break;
            }
            v28(a1, v14, v15, v26);
            uint64_t v13 = 2 * v15;
            unint64_t v12 = (2 * v15) | 1;
            unint64_t v14 = v15;
          }
          while (v12 <= v10);
        }
        BOOL v11 = (int)v9-- <= 0;
      }
      while (!v11);
      if ((int)a2 >= 2)
      {
        uint64_t v19 = a2;
        do
        {
          v28(a1, 0, (v19 - 1), v26);
          unint64_t v20 = (v19 - 2);
          if (v19 != 2)
          {
            uint64_t v21 = 0;
            unint64_t v22 = 0;
            unint64_t v23 = 1;
            do
            {
              if (v27(a1 + v26[0] * v23, a1 + v26[0] * v22) <= 0) {
                unint64_t v24 = v22;
              }
              else {
                unint64_t v24 = v23;
              }
              unint64_t v25 = v21 + 2;
              if (v25 <= v20 && v27(a1 + v26[0] * v25, a1 + v26[0] * v24) > 0) {
                unint64_t v24 = v25;
              }
              if (v24 == v22) {
                break;
              }
              v28(a1, v22, v24, v26);
              uint64_t v21 = 2 * v24;
              unint64_t v23 = (2 * v24) | 1;
              unint64_t v22 = v24;
            }
            while (v23 <= v20);
          }
          BOOL v11 = v19-- <= 2;
        }
        while (!v11);
      }
    }
  }
  return 0;
}

uint64_t isort_internal(uint64_t result, unint64_t a2, uint64_t a3)
{
  if (a2 >= 2)
  {
    uint64_t v5 = result;
    for (uint64_t i = 1; i != a2; ++i)
    {
      uint64_t v7 = i;
      do
      {
        uint64_t v8 = v7 - 1;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(v5 + *(void *)a3 * (v7 - 1), v5 + *(void *)a3 * v7);
        if ((int)result < 1) {
          break;
        }
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 24))(v5, v7 - 1, v7, a3);
        --v7;
      }
      while (v8);
    }
  }
  return result;
}

void sub_2176484EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (a2 == 1)
  {
    BOOL v11 = (ft *)__cxa_begin_catch(exception_object);
    unint64_t v12 = ft::GetOsLog(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[FTBipartiteMatcher computeMatchingForCostMatrix:withRowCount:columnCount:]((uint64_t)v11, v12);
    }

    __cxa_end_catch();
    JUMPOUT(0x2176484C0);
  }
  _Unwind_Resume(exception_object);
}

float bmMinimum(float result, float a2)
{
  if (result >= a2) {
    return a2;
  }
  return result;
}

uint64_t bmMinimum(uint64_t result, unsigned int a2)
{
  if (result >= a2) {
    return a2;
  }
  else {
    return result;
  }
}

uint64_t bmMinimum(uint64_t result, int a2)
{
  if ((int)result >= a2) {
    return a2;
  }
  else {
    return result;
  }
}

float bmMaximum(float result, float a2)
{
  if (result < a2) {
    return a2;
  }
  return result;
}

uint64_t bmMaximum(uint64_t result, unsigned int a2)
{
  if (result <= a2) {
    return a2;
  }
  else {
    return result;
  }
}

uint64_t bmMaximum(uint64_t result, int a2)
{
  if ((int)result <= a2) {
    return a2;
  }
  else {
    return result;
  }
}

uint64_t bmClamp(signed int a1, unsigned int a2, signed int a3)
{
  if (a3 >= a1) {
    unsigned int v3 = a1;
  }
  else {
    unsigned int v3 = a3;
  }
  if (a1 >= (int)a2) {
    return v3;
  }
  else {
    return a2;
  }
}

float bmClamp(float a1, float a2, float a3)
{
  if (a3 >= a1) {
    a3 = a1;
  }
  if (a1 >= a2) {
    return a3;
  }
  else {
    return a2;
  }
}

float bmSoftmax2(float a1, float a2)
{
  if (a1 >= a2) {
    float v3 = a1;
  }
  else {
    float v3 = a2;
  }
  float v4 = expf(a1 - v3);
  float v5 = expf(a2 - v3);
  return v5 / (float)(v4 + v5);
}

void bmSoftmax(float32x4_t *a1, float *a2, unsigned int a3, __n128 a4)
{
  float v5 = a2;
  a4.n128_u32[0] = a1->i32[0];
  if (a3 >= 2)
  {
    unint64_t v6 = &a1->f32[1];
    do
    {
      float v7 = *v6++;
      float v8 = v7;
      if (a4.n128_f32[0] < v7) {
        a4.n128_f32[0] = v8;
      }
    }
    while (v6 < &a1->f32[a3]);
  }
  if (!a3) {
    return;
  }
  uint64_t v9 = 0;
  if (a3 < 8) {
    goto LABEL_12;
  }
  if ((unint64_t)((char *)a2 - (char *)a1) < 0x20) {
    goto LABEL_12;
  }
  uint64_t v9 = a3 & 0xFFFFFFF8;
  float32x4_t v11 = (float32x4_t)vdupq_lane_s32((int32x2_t)a4.n128_u64[0], 0);
  unint64_t v12 = a1 + 1;
  uint64_t v13 = a2 + 4;
  uint64_t v14 = v9;
  do
  {
    float32x4_t v15 = vsubq_f32(*v12, v11);
    *((float32x4_t *)v13 - 1) = vsubq_f32(v12[-1], v11);
    *(float32x4_t *)uint64_t v13 = v15;
    v12 += 2;
    v13 += 8;
    v14 -= 8;
  }
  while (v14);
  if (v9 != a3)
  {
LABEL_12:
    unint64_t v16 = &a1->f32[v9];
    unint64_t v17 = &a2[v9];
    uint64_t v18 = a3 - v9;
    do
    {
      float v19 = *v16++;
      *v17++ = v19 - a4.n128_f32[0];
      --v18;
    }
    while (v18);
  }
  if (a3 == 1)
  {
    LODWORD(v20) = 0;
    a4.n128_u64[0] = 0;
    uint64_t v21 = a2;
  }
  else
  {
    uint64_t v20 = a3 & 0xFFFFFFFE;
    uint64_t v21 = &a2[v20];
    unint64_t v22 = a2 + 1;
    a4.n128_u32[0] = 0;
    uint64_t v23 = v20;
    do
    {
      float v38 = a4.n128_f32[0];
      float v24 = *v22;
      float v25 = expf(*(v22 - 1));
      a4.n128_f32[0] = (float)(v38 + v25) + expf(v24);
      v22 += 2;
      v23 -= 2;
    }
    while (v23);
    if (v20 == a3) {
      goto LABEL_21;
    }
  }
  int v26 = a3 - v20;
  do
  {
    __n128 v39 = a4;
    float v27 = *v21++;
    float v28 = expf(v27);
    __n128 v29 = v39;
    v29.n128_f32[0] = v39.n128_f32[0] + v28;
    a4 = v29;
    --v26;
  }
  while (v26);
LABEL_21:
  float v40 = a4.n128_f32[0];
  if (a3 == 1)
  {
    LODWORD(v30) = 0;
    unsigned int v31 = v5;
LABEL_26:
    int v35 = a3 - v30;
    do
    {
      float *v31 = expf(*v31) / v40;
      ++v31;
      --v35;
    }
    while (v35);
    return;
  }
  uint64_t v30 = a3 & 0xFFFFFFFE;
  unsigned int v31 = &v5[v30];
  float32x2_t v32 = (float32x2_t)vdup_lane_s32((int32x2_t)a4.n128_u64[0], 0);
  uint64_t v33 = v30;
  do
  {
    LODWORD(v36) = *(void *)v5;
    float v37 = expf(COERCE_FLOAT(HIDWORD(*(void *)v5)));
    v34.f32[0] = expf(v36);
    v34.f32[1] = v37;
    *(float32x2_t *)float v5 = vdiv_f32(v34, v32);
    v5 += 2;
    v33 -= 2;
  }
  while (v33);
  if (v30 != a3) {
    goto LABEL_26;
  }
}

void bmSoftmax(float32x4_t *a1, float *a2, unsigned int a3, unsigned int a4, double a5)
{
  unsigned int v5 = a3;
  unint64_t v6 = a2;
  LODWORD(a5) = a1->i32[0];
  unint64_t v7 = 4 * a4;
  if (a4 * a3 > a4)
  {
    float v8 = &a1->f32[v7 / 4];
    do
    {
      if (*(float *)&a5 < *v8) {
        *(float *)&a5 = *v8;
      }
      float v8 = (const float *)((char *)v8 + v7);
    }
    while (v8 < &a1->f32[a4 * a3]);
  }
  if (a3)
  {
    uint64_t v9 = 0;
    if (a3 < 8) {
      goto LABEL_13;
    }
    if (a4 != 1) {
      goto LABEL_13;
    }
    if ((unint64_t)((char *)a2 - (char *)a1) < 0x20) {
      goto LABEL_13;
    }
    uint64_t v9 = a3 & 0xFFFFFFF8;
    float32x4_t v10 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a5, 0);
    float32x4_t v11 = a1 + 1;
    unint64_t v12 = a2 + 4;
    uint64_t v13 = v9;
    do
    {
      float32x4_t v14 = vsubq_f32(*v11, v10);
      *((float32x4_t *)v12 - 1) = vsubq_f32(v11[-1], v10);
      *(float32x4_t *)unint64_t v12 = v14;
      v11 += 2;
      v12 += 8;
      v13 -= 8;
    }
    while (v13);
    if (v9 != a3)
    {
LABEL_13:
      int v15 = a4 * v9;
      uint64_t v16 = a3 - v9;
      do
      {
        a2[v15] = a1->f32[v15] - *(float *)&a5;
        v15 += a4;
        --v16;
      }
      while (v16);
    }
    float v17 = 0.0;
    uint64_t v18 = a2;
    unsigned int v19 = a3;
    do
    {
      float v17 = v17 + expf(*v18);
      uint64_t v18 = (float *)((char *)v18 + v7);
      --v19;
    }
    while (v19);
    do
    {
      *unint64_t v6 = expf(*v6) / v17;
      unint64_t v6 = (float *)((char *)v6 + v7);
      --v5;
    }
    while (v5);
  }
}

uint64_t bmArgMax(signed __int8 *a1, int a2, int a3)
{
  if (a2 == 1) {
    return 0;
  }
  if (!a2) {
    bmArgMax();
  }
  LODWORD(v3) = 0;
  signed __int8 v4 = *a1;
  unsigned int v5 = 1;
  int v6 = a3;
  do
  {
    if (a1[v6] <= v4)
    {
      uint64_t v3 = v3;
    }
    else
    {
      signed __int8 v4 = a1[v6];
      uint64_t v3 = v5;
    }
    ++v5;
    v6 += a3;
  }
  while (a2 != v5);
  return v3;
}

__n128 ft::TrackPool::TrackPool(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  unint64_t v3 = a2[1].n128_u64[0];
  *a1 = *a2;
  a1[1].n128_u64[0] = v3;
  a1[1].n128_u64[1] = 0;
  a1[2].n128_u64[0] = 0;
  a1[2].n128_u64[1] = 0;
  return result;
}

{
  __n128 result;
  unint64_t v3;

  __n128 result = *a2;
  unint64_t v3 = a2[1].n128_u64[0];
  *a1 = *a2;
  a1[1].n128_u64[0] = v3;
  a1[1].n128_u64[1] = 0;
  a1[2].n128_u64[0] = 0;
  a1[2].n128_u64[1] = 0;
  return result;
}

void ft::TrackPool::~TrackPool(ft::TrackPool *this)
{
  uint64_t v2 = *((void *)this + 3);
  if (v2)
  {
    uint64_t v3 = *((void *)this + 4);
    signed __int8 v4 = (void *)*((void *)this + 3);
    if (v3 != v2)
    {
      do
      {
        unsigned int v5 = *(std::__shared_weak_count **)(v3 - 8);
        if (v5)
        {
          if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
            std::__shared_weak_count::__release_weak(v5);
          }
        }
        v3 -= 16;
      }
      while (v3 != v2);
      signed __int8 v4 = (void *)*((void *)this + 3);
    }
    *((void *)this + 4) = v2;
    operator delete(v4);
  }
}

{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  std::__shared_weak_count *v5;

  uint64_t v2 = *((void *)this + 3);
  if (v2)
  {
    uint64_t v3 = *((void *)this + 4);
    signed __int8 v4 = (void *)*((void *)this + 3);
    if (v3 != v2)
    {
      do
      {
        unsigned int v5 = *(std::__shared_weak_count **)(v3 - 8);
        if (v5)
        {
          if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
            std::__shared_weak_count::__release_weak(v5);
          }
        }
        v3 -= 16;
      }
      while (v3 != v2);
      signed __int8 v4 = (void *)*((void *)this + 3);
    }
    *((void *)this + 4) = v2;
    operator delete(v4);
  }
}

void **std::vector<std::shared_ptr<ft::Track>>::~vector[abi:ne180100](void **a1)
{
  uint64_t v2 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    signed __int8 v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        unsigned int v5 = (std::__shared_weak_count *)*((void *)v3 - 1);
        if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
        v3 -= 16;
      }
      while (v3 != v2);
      signed __int8 v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

uint64_t ft::TrackPool::GetActiveTracks(ft::TrackPool *this)
{
  return (uint64_t)this + 24;
}

uint64_t ft::TrackPool::GetTrackById@<X0>(uint64_t this@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *(void **)(this + 24);
  signed __int8 v4 = *(void **)(this + 32);
  if (v3 == v4)
  {
LABEL_4:
    *a3 = 0;
    a3[1] = 0;
  }
  else
  {
    while (1)
    {
      uint64_t v5 = *v3;
      if (*(void *)(*v3 + 16) == a2) {
        break;
      }
      v3 += 2;
      if (v3 == v4) {
        goto LABEL_4;
      }
    }
    uint64_t v6 = v3[1];
    *a3 = v5;
    a3[1] = v6;
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
  }
  return this;
}

void ft::TrackPool::MaybeCreateNewTrack(uint64_t a1@<X0>, int **a2@<X1>, void *a3@<X8>)
{
  if (*(unsigned char *)(a1 + 8)
    && *(void *)a1 <= (unint64_t)((uint64_t)(*(void *)(a1 + 32) - *(void *)(a1 + 24)) >> 4))
  {
    *a3 = 0;
    a3[1] = 0;
  }
  else
  {
    v3[0] = 0;
    v3[8] = 0;
    ft::TrackPool::CreateNewTrack(a1, a2, 1, (uint64_t)v3, (uint64_t)a3);
  }
}

void ft::TrackPool::CreateNewTrack(uint64_t a1@<X0>, int **a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = 0;
  *(void *)(a5 + 8) = 0;
  uint64_t v29 = 0;
  if (*(unsigned char *)(a4 + 8))
  {
    uint64_t v29 = *(void *)a4;
    float v8 = *a2;
    uint64_t v9 = a2[1];
    if (v9 != (int *)5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v29 = atomic_fetch_add(&ft::ReserveNewTrackId(void)::track_id_ctr, 1uLL) | 0x100000000;
    float v8 = *a2;
    uint64_t v9 = a2[1];
    if (v9 != (int *)5)
    {
LABEL_3:
      if (v9 != (int *)6) {
        goto LABEL_29;
      }
      int v10 = *v8;
      int v11 = *((unsigned __int16 *)v8 + 2);
      if (v10 != 1835819371 || v11 != 28257) {
        goto LABEL_29;
      }
      *(_OWORD *)float v28 = xmmword_217667240;
      *(_OWORD *)&v28[16] = xmmword_217667250;
      uint64_t v13 = operator new(0x270uLL);
      v13[1] = 0;
      v13[2] = 0;
      *uint64_t v13 = &unk_26C78E6B0;
      v15.n128_f32[0] = ft::KalmanTrack::KalmanTrack((ft::Track *)(v13 + 4), &v29, (uint64_t)v28);
      goto LABEL_17;
    }
  }
  int v16 = *v8;
  int v17 = *((unsigned __int8 *)v8 + 4);
  if (v16 != 2020569712 || v17 != 121)
  {
LABEL_29:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::string::basic_string<std::string_view,0>(&__dst, (uint64_t)a2);
    float v25 = std::string::insert(&__dst, 0, "Unknown track type encountered: ");
    long long v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
    *(void *)&v28[16] = *((void *)&v25->__r_.__value_.__l + 2);
    *(_OWORD *)float v28 = v26;
    v25->__r_.__value_.__l.__size_ = 0;
    v25->__r_.__value_.__r.__words[2] = 0;
    v25->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, (const std::string *)v28);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v13 = operator new(0x120uLL);
  v13[1] = 0;
  v13[2] = 0;
  *uint64_t v13 = &unk_26C78E678;
  ft::ProxyTrack::ProxyTrack((ft::ProxyTrack *)(v13 + 3), &v29);
LABEL_17:
  unsigned int v19 = *(std::__shared_weak_count **)(a5 + 8);
  *(void *)a5 = v14;
  *(void *)(a5 + 8) = v13;
  if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *, __n128))v19->__on_zero_shared)(v19, v15);
    std::__shared_weak_count::__release_weak(v19);
    if (!a3) {
      return;
    }
  }
  else if (!a3)
  {
    return;
  }
  uint64_t v20 = *(void **)(a1 + 32);
  if ((unint64_t)v20 >= *(void *)(a1 + 40))
  {
    unint64_t v22 = std::vector<std::shared_ptr<ft::Track>>::__emplace_back_slow_path<std::shared_ptr<ft::Track>&>(a1 + 24, (long long *)a5);
  }
  else
  {
    *uint64_t v20 = *(void *)a5;
    uint64_t v21 = *(void *)(a5 + 8);
    v20[1] = v21;
    if (v21) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v21 + 8), 1uLL, memory_order_relaxed);
    }
    unint64_t v22 = v20 + 2;
  }
  *(void *)(a1 + 32) = v22;
}

void sub_217648FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  std::shared_ptr<ft::Track>::~shared_ptr[abi:ne180100](v21);
  _Unwind_Resume(a1);
}

void *std::string::basic_string<std::string_view,0>(void *__dst, uint64_t a2)
{
  size_t v3 = *(void *)(a2 + 8);
  if (v3 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  signed __int8 v4 = *(const void **)a2;
  if (v3 >= 0x17)
  {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17) {
      uint64_t v6 = v3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v5 = operator new(v6 + 1);
    __dst[1] = v3;
    __dst[2] = v7 | 0x8000000000000000;
    *std::string __dst = v5;
  }
  else
  {
    *((unsigned char *)__dst + 23) = v3;
    uint64_t v5 = __dst;
    if (!v3) {
      goto LABEL_9;
    }
  }
  memmove(v5, v4, v3);
LABEL_9:
  *((unsigned char *)v5 + v3) = 0;
  return __dst;
}

void ft::TrackPool::CreateNewDetectionlessTrack(ft::TrackPool *this@<X0>, uint64_t a2@<X8>)
{
  v2[0] = 0;
  v2[8] = 0;
  ft::TrackPool::CreateNewTrack((uint64_t)this, (int **)&ft::ProxyTrack::KIND, 1, (uint64_t)v2, a2);
}

uint64_t ft::TrackPool::RetireLostTracks(ft::TrackPool *this)
{
  uint64_t v2 = (void *)*((void *)this + 3);
  uint64_t v3 = *((void *)this + 4);
  uint64_t v1 = (char *)this + 24;
  if (v2 == (void *)v3)
  {
    uint64_t v3 = *((void *)this + 3);
  }
  else
  {
    while (!*(unsigned char *)(*v2 + 240))
    {
      v2 += 2;
      if (v2 == (void *)v3)
      {
        uint64_t v2 = (void *)*((void *)this + 4);
        goto LABEL_16;
      }
    }
    if (v2 != (void *)v3)
    {
      uint64_t v5 = v2 + 2;
      if (v2 + 2 != (void *)v3)
      {
        do
        {
          uint64_t v6 = *v5;
          if (!*(unsigned char *)(*v5 + 240))
          {
            uint64_t v7 = v5[1];
            *uint64_t v5 = 0;
            v5[1] = 0;
            float v8 = (std::__shared_weak_count *)v2[1];
            *uint64_t v2 = v6;
            v2[1] = v7;
            if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
              std::__shared_weak_count::__release_weak(v8);
            }
            v2 += 2;
          }
          v5 += 2;
        }
        while (v5 != (void *)v3);
        uint64_t v3 = *((void *)this + 4);
      }
    }
  }
LABEL_16:

  return std::vector<std::shared_ptr<ft::Track>>::erase((uint64_t)v1, (uint64_t)v2, v3);
}

uint64_t std::vector<std::shared_ptr<ft::Track>>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != a3)
  {
    uint64_t v5 = a3;
    uint64_t v6 = *(void *)(a1 + 8);
    if (a3 == v6)
    {
      uint64_t v8 = a2;
      if (a3 == a2)
      {
LABEL_16:
        *(void *)(a1 + 8) = v8;
        return a2;
      }
    }
    else
    {
      uint64_t v7 = 16 * ((a3 - a2) >> 4);
      uint64_t v8 = a2;
      do
      {
        uint64_t v9 = (void *)(v8 + v7);
        long long v10 = *(_OWORD *)(v8 + v7);
        *uint64_t v9 = 0;
        v9[1] = 0;
        int v11 = *(std::__shared_weak_count **)(v8 + 8);
        *(_OWORD *)uint64_t v8 = v10;
        if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
        v8 += 16;
      }
      while (v8 + v7 != v6);
      uint64_t v5 = *(void *)(a1 + 8);
      if (v5 == v8) {
        goto LABEL_16;
      }
    }
    do
    {
      unint64_t v12 = *(std::__shared_weak_count **)(v5 - 8);
      if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
      v5 -= 16;
    }
    while (v5 != v8);
    goto LABEL_16;
  }
  return a2;
}

BOOL ft::TrackPool::RemoveTrack(uint64_t a1, uint64_t a2)
{
  if (!*(void *)a2) {
    return 0;
  }
  signed __int8 v4 = *(void **)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v3 = a1 + 24;
  if (v4 == (void *)v5)
  {
    uint64_t v5 = *(void *)(a1 + 24);
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)a2 + 16);
    while (*(void *)(*v4 + 16) != v6)
    {
      v4 += 2;
      if (v4 == (void *)v5)
      {
        signed __int8 v4 = *(void **)(a1 + 32);
        goto LABEL_19;
      }
    }
    if (v4 != (void *)v5)
    {
      uint64_t v8 = v4 + 2;
      if (v4 + 2 != (void *)v5)
      {
        do
        {
          uint64_t v9 = *v8;
          if (*(void *)(*v8 + 16) != v6)
          {
            uint64_t v10 = v8[1];
            *uint64_t v8 = 0;
            v8[1] = 0;
            int v11 = (std::__shared_weak_count *)v4[1];
            void *v4 = v9;
            v4[1] = v10;
            if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
              std::__shared_weak_count::__release_weak(v11);
            }
            v4 += 2;
          }
          v8 += 2;
        }
        while (v8 != (void *)v5);
        uint64_t v5 = *(void *)(a1 + 32);
      }
    }
  }
LABEL_19:
  BOOL v7 = v4 != (void *)v5;
  std::vector<std::shared_ptr<ft::Track>>::erase(v3, (uint64_t)v4, v5);
  return v7;
}

BOOL ft::TrackPool::RemoveTrackById(ft::TrackPool *this, uint64_t a2)
{
  uint64_t v3 = (void *)*((void *)this + 3);
  uint64_t v4 = *((void *)this + 4);
  uint64_t v2 = (char *)this + 24;
  if (v3 == (void *)v4)
  {
    uint64_t v4 = *((void *)this + 3);
  }
  else
  {
    while (*(void *)(*v3 + 16) != a2)
    {
      v3 += 2;
      if (v3 == (void *)v4)
      {
        uint64_t v3 = (void *)*((void *)this + 4);
        goto LABEL_16;
      }
    }
    if (v3 != (void *)v4)
    {
      BOOL v7 = v3 + 2;
      if (v3 + 2 != (void *)v4)
      {
        do
        {
          uint64_t v8 = *v7;
          if (*(void *)(*v7 + 16) != a2)
          {
            uint64_t v9 = v7[1];
            *BOOL v7 = 0;
            v7[1] = 0;
            uint64_t v10 = (std::__shared_weak_count *)v3[1];
            void *v3 = v8;
            v3[1] = v9;
            if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
              std::__shared_weak_count::__release_weak(v10);
            }
            v3 += 2;
          }
          v7 += 2;
        }
        while (v7 != (void *)v4);
        uint64_t v4 = *((void *)this + 4);
      }
    }
  }
LABEL_16:
  std::vector<std::shared_ptr<ft::Track>>::erase((uint64_t)v2, (uint64_t)v3, v4);
  return v3 != (void *)v4;
}

void ft::TrackPool::Reset(ft::TrackPool *this)
{
  uint64_t v2 = *((void *)this + 3);
  for (uint64_t i = *((void *)this + 4); i != v2; i -= 16)
  {
    uint64_t v4 = *(std::__shared_weak_count **)(i - 8);
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  *((void *)this + 4) = v2;
}

void ft::TrackPool::ReincarnateTrack(uint64_t a1@<X0>, uint64_t a2@<X1>, int **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = *(void **)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v8 = a1 + 24;
  if (v9 == (void *)v10)
  {
    uint64_t v10 = *(void *)(a1 + 24);
  }
  else
  {
    uint64_t v11 = *(void *)(*(void *)a2 + 16);
    while (*(void *)(*v9 + 16) != v11)
    {
      v9 += 2;
      if (v9 == (void *)v10)
      {
        uint64_t v9 = *(void **)(a1 + 32);
        goto LABEL_17;
      }
    }
    if (v9 != (void *)v10)
    {
      unint64_t v12 = v9 + 2;
      if (v9 + 2 != (void *)v10)
      {
        do
        {
          uint64_t v13 = *v12;
          if (*(void *)(*v12 + 16) != v11)
          {
            uint64_t v14 = v12[1];
            *unint64_t v12 = 0;
            v12[1] = 0;
            __n128 v15 = (std::__shared_weak_count *)v9[1];
            *uint64_t v9 = v13;
            v9[1] = v14;
            if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
              std::__shared_weak_count::__release_weak(v15);
            }
            v9 += 2;
          }
          v12 += 2;
        }
        while (v12 != (void *)v10);
        uint64_t v10 = *(void *)(a1 + 32);
      }
    }
  }
LABEL_17:
  std::vector<std::shared_ptr<ft::Track>>::erase(v8, (uint64_t)v9, v10);
  uint64_t v16 = *(void *)(*(void *)a2 + 16);
  char v17 = 1;
  ft::TrackPool::CreateNewTrack(a1, a3, v9 != (void *)v10, (uint64_t)&v16, a4);
}

void ft::TrackPool::UpdateForeignTracks(uint64_t this@<X0>, const Frame *a2@<X1>, void **a3@<X8>)
{
  uint64_t v3 = (ft::TrackPool *)this;
  uint64_t v98 = *MEMORY[0x263EF8340];
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  *(_OWORD *)uint64_t v82 = 0u;
  *(_OWORD *)std::string __p = 0u;
  int v84 = 1065353216;
  uint64_t v5 = *((void *)a2 + 4);
  uint64_t v6 = *((void *)a2 + 5);
  if (v5 != v6)
  {
    __asm { FMOV            V8.2S, #-1.0 }
    do
    {
      if (*(unsigned char *)(v5 + 104))
      {
        unint64_t v21 = *(void *)(v5 + 96);
        unint64_t v81 = v21;
        if ((v21 & 0x100000000) != 0)
        {
          OsLog = ft::GetOsLog((ft *)this);
          this = os_log_type_enabled(OsLog, OS_LOG_TYPE_ERROR);
          if (this) {
            ft::TrackPool::UpdateForeignTracks(&v79, v80, OsLog);
          }
        }
        else
        {
          if (v82[1])
          {
            uint8x8_t v22 = (uint8x8_t)vcnt_s8((int8x8_t)v82[1]);
            v22.i16[0] = vaddlv_u8(v22);
            if (v22.u32[0] > 1uLL)
            {
              unint64_t v23 = v21;
              if ((void *)v21 >= v82[1]) {
                unint64_t v23 = v21 % (unint64_t)v82[1];
              }
            }
            else
            {
              unint64_t v23 = ((unint64_t)v82[1] - 1) & v21;
            }
            float32x2_t v32 = (void *)*((void *)v82[0] + v23);
            if (v32)
            {
              uint64_t v33 = (void *)*v32;
              if (v33)
              {
                if (v22.u32[0] < 2uLL)
                {
                  while (1)
                  {
                    uint64_t v35 = v33[1];
                    if (v21 == v35)
                    {
                      if (v33[2] == v21) {
                        goto LABEL_56;
                      }
                    }
                    else if ((v35 & ((uint64_t)v82[1] - 1)) != v23)
                    {
                      goto LABEL_40;
                    }
                    uint64_t v33 = (void *)*v33;
                    if (!v33) {
                      goto LABEL_40;
                    }
                  }
                }
                do
                {
                  unint64_t v34 = v33[1];
                  if (v21 == v34)
                  {
                    if (v33[2] == v21)
                    {
LABEL_56:
                      float v65 = ft::GetOsLog((ft *)this);
                      this = os_log_type_enabled(v65, OS_LOG_TYPE_ERROR);
                      if (this)
                      {
                        *(_DWORD *)buf = 134217984;
                        *(void *)&buf[4] = v81;
                        _os_log_error_impl(&dword_21762A000, v65, OS_LOG_TYPE_ERROR, "Duplicate track ID provided in observation: %lld", buf, 0xCu);
                      }
                      goto LABEL_5;
                    }
                  }
                  else
                  {
                    if ((void *)v34 >= v82[1]) {
                      v34 %= (unint64_t)v82[1];
                    }
                    if (v34 != v23) {
                      break;
                    }
                  }
                  uint64_t v33 = (void *)*v33;
                }
                while (v33);
              }
            }
          }
LABEL_40:
          std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v82, &v81, &v81);
          float v36 = (uint64_t *)*((void *)v3 + 3);
          float v37 = (uint64_t *)*((void *)v3 + 4);
          if (v36 == v37)
          {
LABEL_43:
            long long v78 = 0uLL;
            unint64_t v76 = v81;
            char v77 = 1;
            ft::TrackPool::CreateNewTrack((uint64_t)v3, (int **)&ft::ProxyTrack::KIND, 1, (uint64_t)&v76, (uint64_t)buf);
            long long v39 = *(_OWORD *)buf;
            memset(buf, 0, sizeof(buf));
            long long v78 = v39;
            uint64_t v38 = v39;
          }
          else
          {
            while (1)
            {
              uint64_t v38 = *v36;
              if (*(void *)(*v36 + 16) == v81) {
                break;
              }
              v36 += 2;
              if (v36 == v37) {
                goto LABEL_43;
              }
            }
            *(void *)&long long v78 = *v36;
            uint64_t v40 = v36[1];
            *((void *)&v78 + 1) = v40;
            if (v40) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v40 + 8), 1uLL, memory_order_relaxed);
            }
          }
          long long v41 = *(_OWORD *)(v5 + 16);
          *(_OWORD *)buf = *(_OWORD *)v5;
          long long v86 = v41;
          long long v42 = *(_OWORD *)(v5 + 32);
          long long v43 = *(_OWORD *)(v5 + 48);
          long long v44 = *(_OWORD *)(v5 + 80);
          long long v89 = *(_OWORD *)(v5 + 64);
          long long v90 = v44;
          long long v87 = v42;
          long long v88 = v43;
          long long v45 = *(_OWORD *)(v5 + 96);
          long long v46 = *(_OWORD *)(v5 + 112);
          long long v47 = *(_OWORD *)(v5 + 128);
          uint64_t v94 = *(void *)(v5 + 144);
          long long v92 = v46;
          long long v93 = v47;
          long long v91 = v45;
          char v95 = 0;
          char v96 = 0;
          uint64_t v97 = _D8;
          this = ft::Track::Update(v38, (uint64_t)a2, buf);
          float v48 = (std::__shared_weak_count *)*((void *)&v78 + 1);
          if (*((void *)&v78 + 1)
            && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v78 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
            std::__shared_weak_count::__release_weak(v48);
          }
        }
      }
      else
      {
        float v25 = (char *)a3[1];
        unint64_t v24 = (unint64_t)a3[2];
        if ((unint64_t)v25 < v24)
        {
          long long v13 = *(_OWORD *)(v5 + 16);
          *(_OWORD *)float v25 = *(_OWORD *)v5;
          *((_OWORD *)v25 + 1) = v13;
          long long v14 = *(_OWORD *)(v5 + 32);
          long long v15 = *(_OWORD *)(v5 + 48);
          long long v16 = *(_OWORD *)(v5 + 80);
          *((_OWORD *)v25 + 4) = *(_OWORD *)(v5 + 64);
          *((_OWORD *)v25 + 5) = v16;
          *((_OWORD *)v25 + 2) = v14;
          *((_OWORD *)v25 + 3) = v15;
          long long v17 = *(_OWORD *)(v5 + 96);
          long long v18 = *(_OWORD *)(v5 + 112);
          long long v19 = *(_OWORD *)(v5 + 128);
          *((void *)v25 + 18) = *(void *)(v5 + 144);
          *((_OWORD *)v25 + 7) = v18;
          *((_OWORD *)v25 + 8) = v19;
          *((_OWORD *)v25 + 6) = v17;
          uint64_t v20 = v25 + 152;
        }
        else
        {
          long long v26 = (char *)*a3;
          unint64_t v27 = 0x86BCA1AF286BCA1BLL * ((v25 - (unsigned char *)*a3) >> 3);
          unint64_t v28 = v27 + 1;
          if (v27 + 1 > 0x1AF286BCA1AF286) {
            std::vector<long long>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v29 = 0x86BCA1AF286BCA1BLL * ((uint64_t)(v24 - (void)v26) >> 3);
          if (2 * v29 > v28) {
            unint64_t v28 = 2 * v29;
          }
          if (v29 >= 0xD79435E50D7943) {
            unint64_t v30 = 0x1AF286BCA1AF286;
          }
          else {
            unint64_t v30 = v28;
          }
          if (v30)
          {
            if (v30 > 0x1AF286BCA1AF286) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            this = (uint64_t)operator new(152 * v30);
          }
          else
          {
            this = 0;
          }
          uint64_t v49 = (char *)(this + 152 * v27);
          long long v50 = *(_OWORD *)(v5 + 16);
          *(_OWORD *)uint64_t v49 = *(_OWORD *)v5;
          *((_OWORD *)v49 + 1) = v50;
          long long v51 = *(_OWORD *)(v5 + 32);
          long long v52 = *(_OWORD *)(v5 + 48);
          long long v53 = *(_OWORD *)(v5 + 80);
          *((_OWORD *)v49 + 4) = *(_OWORD *)(v5 + 64);
          *((_OWORD *)v49 + 5) = v53;
          *((_OWORD *)v49 + 2) = v51;
          *((_OWORD *)v49 + 3) = v52;
          long long v54 = *(_OWORD *)(v5 + 96);
          long long v55 = *(_OWORD *)(v5 + 112);
          long long v56 = *(_OWORD *)(v5 + 128);
          *((void *)v49 + 18) = *(void *)(v5 + 144);
          *((_OWORD *)v49 + 7) = v55;
          *((_OWORD *)v49 + 8) = v56;
          *((_OWORD *)v49 + 6) = v54;
          uint64_t v57 = v49;
          if (v25 != v26)
          {
            do
            {
              long long v58 = *(_OWORD *)(v25 - 152);
              *(_OWORD *)(v57 - 136) = *(_OWORD *)(v25 - 136);
              *(_OWORD *)(v57 - 152) = v58;
              long long v59 = *(_OWORD *)(v25 - 120);
              long long v60 = *(_OWORD *)(v25 - 104);
              long long v61 = *(_OWORD *)(v25 - 88);
              *(_OWORD *)(v57 - 72) = *(_OWORD *)(v25 - 72);
              *(_OWORD *)(v57 - 88) = v61;
              *(_OWORD *)(v57 - 104) = v60;
              *(_OWORD *)(v57 - 120) = v59;
              long long v62 = *(_OWORD *)(v25 - 56);
              long long v63 = *(_OWORD *)(v25 - 40);
              long long v64 = *(_OWORD *)(v25 - 24);
              *((void *)v57 - 1) = *((void *)v25 - 1);
              *(_OWORD *)(v57 - 24) = v64;
              *(_OWORD *)(v57 - 40) = v63;
              *(_OWORD *)(v57 - 56) = v62;
              v57 -= 152;
              v25 -= 152;
            }
            while (v25 != v26);
            float v25 = v26;
          }
          uint64_t v20 = v49 + 152;
          *a3 = v57;
          a3[1] = v49 + 152;
          a3[2] = (void *)(this + 152 * v30);
          if (v25) {
            operator delete(v25);
          }
        }
        a3[1] = v20;
      }
LABEL_5:
      v5 += 152;
    }
    while (v5 != v6);
  }
  std::vector<std::shared_ptr<ft::Track>>::vector(buf, (uint64_t *)v3 + 3);
  float v66 = *(void **)buf;
  float v67 = *(void **)&buf[8];
  if (*(void *)buf != *(void *)&buf[8])
  {
    do
    {
      if ((*(unsigned char *)(*v66 + 20) & 1) == 0 && *(void *)(*v66 + 256) > *((void *)v3 + 2))
      {
        v75[0] = *v66;
        float v68 = (std::__shared_weak_count *)v66[1];
        v75[1] = v68;
        if (v68) {
          atomic_fetch_add_explicit(&v68->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        ft::TrackPool::RemoveTrack((uint64_t)v3, (uint64_t)v75);
        if (v68 && !atomic_fetch_add(&v68->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
          std::__shared_weak_count::__release_weak(v68);
        }
      }
      v66 += 2;
    }
    while (v66 != v67);
    float v66 = *(void **)buf;
  }
  if (v66)
  {
    int v69 = *(void **)&buf[8];
    BOOL v70 = v66;
    if (*(void **)&buf[8] != v66)
    {
      do
      {
        unsigned int v71 = (std::__shared_weak_count *)*(v69 - 1);
        if (v71 && !atomic_fetch_add(&v71->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
          std::__shared_weak_count::__release_weak(v71);
        }
        v69 -= 2;
      }
      while (v69 != v66);
      BOOL v70 = *(void **)buf;
    }
    *(void *)&buf[8] = v66;
    operator delete(v70);
  }
  BOOL v72 = __p[0];
  if (__p[0])
  {
    do
    {
      size_t v73 = (void *)*v72;
      operator delete(v72);
      BOOL v72 = v73;
    }
    while (v73);
  }
  int v74 = v82[0];
  v82[0] = 0;
  if (v74) {
    operator delete(v74);
  }
}

void sub_217649EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  std::unordered_map<long long,CMTime>::~unordered_map[abi:ne180100]((uint64_t)va);
  long long v13 = *(void **)v11;
  if (!*(void *)v11) {
    _Unwind_Resume(a1);
  }
  *(void *)(v11 + 8) = v13;
  operator delete(v13);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<ft::KalmanTrack>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C78E6B0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ft::KalmanTrack>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C78E6B0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D449420);
}

void std::__shared_ptr_emplace<ft::KalmanTrack>::__on_zero_shared(uint64_t a1)
{
}

void std::__shared_ptr_emplace<ft::ProxyTrack>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C78E678;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ft::ProxyTrack>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C78E678;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D449420);
}

void std::__shared_ptr_emplace<ft::ProxyTrack>::__on_zero_shared(uint64_t a1)
{
}

_OWORD *std::vector<std::shared_ptr<ft::Track>>::__emplace_back_slow_path<std::shared_ptr<ft::Track>&>(uint64_t a1, long long *a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void **)(a1 + 8);
  uint64_t v5 = ((uint64_t)v4 - *(void *)a1) >> 4;
  unint64_t v6 = v5 + 1;
  if ((unint64_t)(v5 + 1) >> 60) {
    std::vector<long long>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = *(void *)(a1 + 16) - (void)v3;
  if (v7 >> 3 > v6) {
    unint64_t v6 = v7 >> 3;
  }
  if ((unint64_t)v7 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v6 = 0xFFFFFFFFFFFFFFFLL;
  }
  if (v6 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  uint64_t v9 = 16 * v6;
  uint64_t v10 = (char *)operator new(16 * v6);
  uint64_t v11 = &v10[16 * v5];
  long long v12 = *a2;
  *(_OWORD *)uint64_t v11 = *a2;
  if (*((void *)&v12 + 1))
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v12 + 1) + 8), 1uLL, memory_order_relaxed);
    uint64_t v3 = *(void **)a1;
    uint64_t v4 = *(void **)(a1 + 8);
  }
  long long v13 = &v10[v9];
  long long v14 = v11 + 16;
  if (v4 == v3)
  {
    *(void *)a1 = v11;
    *(void *)(a1 + 8) = v14;
    *(void *)(a1 + 16) = v13;
    if (!v3) {
      return v14;
    }
    goto LABEL_19;
  }
  do
  {
    long long v15 = *((_OWORD *)v4 - 1);
    v4 -= 2;
    *((_OWORD *)v11 - 1) = v15;
    v11 -= 16;
    void *v4 = 0;
    v4[1] = 0;
  }
  while (v4 != v3);
  long long v16 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 8);
  *(void *)a1 = v11;
  *(void *)(a1 + 8) = v14;
  *(void *)(a1 + 16) = v13;
  if (v3 != v16)
  {
    do
    {
      long long v17 = (std::__shared_weak_count *)*(v3 - 1);
      if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
      v3 -= 2;
    }
    while (v3 != v16);
    uint64_t v3 = v16;
  }
  if (v3) {
LABEL_19:
  }
    operator delete(v3);
  return v14;
}

void *std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(void **)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint64_t v10 = (void *)*v9;
      if (*v9)
      {
        if (v8.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v12 = v10[1];
            if (v12 == v6)
            {
              if (v10[2] == v6) {
                return v10;
              }
            }
            else if ((v12 & (v7 - 1)) != v3)
            {
              goto LABEL_23;
            }
            uint64_t v10 = (void *)*v10;
            if (!v10) {
              goto LABEL_23;
            }
          }
        }
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (v10[2] == v6) {
              return v10;
            }
          }
          else
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
            if (v11 != v3) {
              break;
            }
          }
          uint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
LABEL_23:
  long long v14 = operator new(0x18uLL);
  void *v14 = 0;
  v14[1] = v6;
  v14[2] = *a3;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (v7 && (float)(v16 * (float)v7) >= v15)
  {
    uint64_t v17 = *(void *)a1;
    long long v18 = *(void **)(*(void *)a1 + 8 * v3);
    if (v18)
    {
LABEL_26:
      void *v14 = *v18;
LABEL_61:
      *long long v18 = v14;
      goto LABEL_62;
    }
  }
  else
  {
    BOOL v19 = 1;
    if (v7 >= 3) {
      BOOL v19 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v7);
    unint64_t v21 = vcvtps_u32_f32(v15 / v16);
    if (v20 <= v21) {
      size_t prime = v21;
    }
    else {
      size_t prime = v20;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
      unint64_t v7 = *(void *)(a1 + 8);
    }
    if (prime > v7) {
      goto LABEL_37;
    }
    if (prime < v7)
    {
      unint64_t v23 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v7 < 3 || (uint8x8_t v24 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v24.i16[0] = vaddlv_u8(v24), v24.u32[0] > 1uLL))
      {
        unint64_t v23 = std::__next_prime(v23);
      }
      else
      {
        uint64_t v25 = 1 << -(char)__clz(v23 - 1);
        if (v23 >= 2) {
          unint64_t v23 = v25;
        }
      }
      if (prime <= v23) {
        size_t prime = v23;
      }
      if (prime < v7) {
LABEL_37:
      }
        std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__do_rehash<true>(a1, prime);
    }
    unint64_t v7 = *(void *)(a1 + 8);
    unint64_t v26 = v7 - 1;
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
      {
        unint64_t v3 = v6 % v7;
        uint64_t v17 = *(void *)a1;
        long long v18 = *(void **)(*(void *)a1 + 8 * (v6 % v7));
        if (v18) {
          goto LABEL_26;
        }
      }
      else
      {
        unint64_t v3 = v6;
        uint64_t v17 = *(void *)a1;
        long long v18 = *(void **)(*(void *)a1 + 8 * v6);
        if (v18) {
          goto LABEL_26;
        }
      }
    }
    else
    {
      unint64_t v3 = v26 & v6;
      uint64_t v17 = *(void *)a1;
      long long v18 = *(void **)(*(void *)a1 + 8 * (v26 & v6));
      if (v18) {
        goto LABEL_26;
      }
    }
  }
  void *v14 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v14;
  *(void *)(v17 + 8 * v3) = a1 + 16;
  if (*v14)
  {
    unint64_t v27 = *(void *)(*v14 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v27 >= v7) {
        v27 %= v7;
      }
    }
    else
    {
      v27 &= v7 - 1;
    }
    long long v18 = (void *)(*(void *)a1 + 8 * v27);
    goto LABEL_61;
  }
LABEL_62:
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_21764A4C8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::vector<std::shared_ptr<ft::Track>>::vector(void *a1, uint64_t *a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = v4 - *a2;
  if (v4 != *a2)
  {
    if (v5 < 0) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v6 = (char *)operator new(v4 - *a2);
    uint64_t v7 = 0;
    *a1 = v6;
    a1[1] = v6;
    a1[2] = &v6[16 * (v5 >> 4)];
    do
    {
      uint64_t v8 = v3 + v7;
      uint64_t v9 = &v6[v7];
      uint64_t v10 = *(void *)(v3 + v7 + 8);
      *(void *)uint64_t v9 = *(void *)(v3 + v7);
      *((void *)v9 + 1) = v10;
      if (v10) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
      }
      v7 += 16;
    }
    while (v8 + 16 != v4);
    a1[1] = &v6[v7];
  }
  return a1;
}

void sub_21764A588(_Unwind_Exception *exception_object)
{
  if (*(void *)v1) {
    std::vector<std::shared_ptr<ft::Track>>::vector((void **)(v1 + 8), *(char **)v1, (void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_21764A634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21764A644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21764A7F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21764A898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21764A8A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id FTResolveEspressoNetPath(void *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = [v2 contentsOfDirectoryAtPath:@"/System/Library/ImagingNetworks" error:0];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v9, "hasSuffix:", @".espresso.net", (void)v18))
          {
            uint64_t v10 = [@"/System/Library/ImagingNetworks" stringByAppendingPathComponent:v9];
            [v4 addObject:v10];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }

    unint64_t v11 = SearchForEspressoNetInPaths(v4, v1);
  }
  else
  {
    unint64_t v11 = 0;
  }

  if (v11)
  {
    id v12 = v11;
    id v13 = v12;
  }
  else
  {
    long long v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.Celestial"];
    if (!v14)
    {
      long long v14 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/Celestial.framework"];
    }
    float v15 = SearchForEspressoNetInBundle(v14, &cfstr_Classifiers.isa, (NSString *)v1);
    id v12 = v15;
    if (v15)
    {
      id v13 = v15;
    }
    else
    {
      float v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      SearchForEspressoNetInBundle(v16, &stru_26C78EF78.isa, (NSString *)v1);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v13;
}

void sub_21764AF5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SearchForEspressoNetInBundle(NSBundle *a1, NSString *a2, NSString *a3)
{
  id v5 = a1;
  uint64_t v6 = a2;
  uint64_t v7 = a3;
  if (v5)
  {
    uint64_t v8 = [(NSBundle *)v5 pathsForResourcesOfType:@".net" inDirectory:v6];
    uint64_t v9 = SearchForEspressoNetInPaths(v8, v7);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void sub_21764B084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21764B0A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SearchForEspressoNetInPaths(void *a1, void *a2)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v4 = a1;
  id v5 = a2;
  uint64_t v6 = [v5 stringByAppendingString:@"."];
  uint64_t v7 = (void *)MEMORY[0x263F08A98];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = ___ZL27SearchForEspressoNetInPathsP7NSArrayIP8NSStringES1__block_invoke;
  v40[3] = &unk_264294DB0;
  id v8 = v6;
  id v41 = v8;
  uint64_t v9 = [v7 predicateWithBlock:v40];
  uint64_t v10 = [v4 filteredArrayUsingPredicate:v9];

  if (![v10 count])
  {
    id v2 = 0;
    goto LABEL_44;
  }
  if ([v10 count] == 1)
  {
    id v2 = [v10 firstObject];
    goto LABEL_44;
  }
  id v11 = v10;
  long long v39 = FTGetChipIdentifier();
  if (!v39) {
    goto LABEL_9;
  }
  id v12 = [NSString stringWithFormat:@".%@.", v39];
  id v13 = (void *)MEMORY[0x263F08A98];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  void v42[2] = ___ZL32SelectBestEspressoNetForPlatformP7NSArrayIP8NSStringE_block_invoke;
  v42[3] = &unk_264294DB0;
  id v14 = v12;
  id v43 = v14;
  float v15 = [v13 predicateWithBlock:v42];
  float v16 = [v11 filteredArrayUsingPredicate:v15];

  uint64_t v17 = [v16 count];
  if (v17 == 1)
  {
    id v2 = [v16 firstObject];
  }

  if (v17 != 1)
  {
LABEL_9:
    id v18 = v11;
    long long v19 = [v18 sortedArrayUsingComparator:&__block_literal_global_1];
    memset(v65, 0, 64);
    id v20 = v19;
    if (![v20 countByEnumeratingWithState:v65 objects:v66 count:16])
    {
      id v2 = 0;
LABEL_42:

      goto LABEL_43;
    }
    id v38 = v11;
    id v37 = v18;
    id v21 = *(id *)v65[1];
    uint8x8_t v22 = (const char *)[v21 UTF8String];
    size_t v23 = strlen(v22);
    if (v23 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v24 = v23;
    if (v23 >= 0x17)
    {
      uint64_t v26 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v23 | 7) != 0x17) {
        uint64_t v26 = v23 | 7;
      }
      uint64_t v27 = v26 + 1;
      p_dst = (long long *)operator new(v26 + 1);
      *((void *)&__dst + 1) = v24;
      unint64_t v61 = v27 | 0x8000000000000000;
      *(void *)&long long __dst = p_dst;
    }
    else
    {
      HIBYTE(v61) = v23;
      p_dst = &__dst;
      if (!v23)
      {
LABEL_18:
        *((unsigned char *)p_dst + v24) = 0;
        char v48 = 0;
        long long v45 = 0;
        uint64_t v46 = 0;
        long long v44 = 0;
        char v47 = 0;
        uint64_t v49 = -4294901744;
        int v50 = 0;
        char v51 = 0;
        char v52 = 0;
        char v53 = 0;
        char v54 = 0;
        long long v55 = 0u;
        long long v56 = 0u;
        int v57 = 1065353216;
        char v59 = 0;
        LOBYTE(__p) = 0;
        long long v62 = &unk_26C78E4B0;
        id v11 = v38;
        unint64_t v28 = (std::__shared_weak_count *)operator new(0x128uLL);
        v28->__shared_owners_ = 0;
        v28->__shared_weak_owners_ = 0;
        v28->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C78E758;
        uint64_t v63 = ik::core::EspressoNetState::EspressoNetState((uint64_t)&v28[1], &__dst, (ik::EspressoConfig *)&v44);
        long long v64 = v28;
        if (v59 < 0) {
          operator delete(__p);
        }
        unint64_t v29 = (void **)v56;
        if ((void)v56)
        {
          do
          {
            unint64_t v34 = (void **)*v29;
            if (*((char *)v29 + 39) < 0) {
              operator delete(v29[2]);
            }
            operator delete(v29);
            unint64_t v29 = v34;
          }
          while (v34);
        }
        unint64_t v30 = (void *)v55;
        *(void *)&long long v55 = 0;
        if (v30) {
          operator delete(v30);
        }
        unsigned int v31 = (void **)v44;
        if (v44)
        {
          float32x2_t v32 = v45;
          uint64_t v33 = v44;
          if (v45 != v44)
          {
            do
            {
              if (*((char *)v32 - 1) < 0) {
                operator delete(*(v32 - 3));
              }
              v32 -= 3;
            }
            while (v32 != v31);
            uint64_t v33 = v44;
          }
          long long v45 = v31;
          operator delete(v33);
        }
        if (SHIBYTE(v61) < 0) {
          operator delete((void *)__dst);
        }
        id v2 = v21;
        long long v62 = &unk_26C78E4B0;
        uint64_t v35 = v64;
        id v18 = v37;
        if (v64 && !atomic_fetch_add(&v64->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
          std::__shared_weak_count::__release_weak(v35);
        }
        goto LABEL_42;
      }
    }
    memmove(p_dst, v22, v24);
    goto LABEL_18;
  }
LABEL_43:

LABEL_44:

  return v2;
}

void sub_21764B6A8()
{
}

void sub_21764B6FC()
{
  JUMPOUT(0x21764B704);
}

void sub_21764B728()
{
  JUMPOUT(0x21764B74CLL);
}

void sub_21764B734()
{
}

void sub_21764B73C()
{
}

uint64_t ___ZL27SearchForEspressoNetInPathsP7NSArrayIP8NSStringES1__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 lastPathComponent];
  uint64_t v4 = [v3 hasPrefix:*(void *)(a1 + 32)];

  return v4;
}

void sub_21764B7B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL32SelectBestEspressoNetForPlatformP7NSArrayIP8NSStringE_block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsString:*(void *)(a1 + 32)];
}

uint64_t ___ZL39SearchForPlatformCompatibleNetByLoadingP7NSArrayIP8NSStringE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2 options:64];
}

int *ik::VerifyEspressoStatus(int *result, uint64_t *a2)
{
  if (*result)
  {
    id v2 = result;
    ik::LogEspressoError((uint64_t)result, a2);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::operator+<char>();
    uint64_t v4 = std::string::append(&v13, " [espresso error: ");
    long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
    v14.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v5;
    v4->__r_.__value_.__l.__size_ = 0;
    v4->__r_.__value_.__r.__words[2] = 0;
    v4->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v12, *v2);
    if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v6 = &v12;
    }
    else {
      uint64_t v6 = (std::string *)v12.__r_.__value_.__r.__words[0];
    }
    if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v12.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v12.__r_.__value_.__l.__size_;
    }
    id v8 = std::string::append(&v14, (const std::string::value_type *)v6, size);
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v15.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    uint64_t v10 = std::string::append(&v15, "]");
    long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
    v16.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v11;
    v10->__r_.__value_.__l.__size_ = 0;
    v10->__r_.__value_.__r.__words[2] = 0;
    v10->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v16);
    exception->__vftable = (std::runtime_error_vtbl *)&unk_26C78E4F0;
  }
  return result;
}

{
  int *v2;
  std::runtime_error *exception;
  std::string *v4;
  long long v5;
  std::string *v6;
  std::string::size_type size;
  std::string *v8;
  long long v9;
  std::string *v10;
  long long v11;
  std::string v12;
  std::string v13;
  std::string v14;
  std::string v15;
  std::string v16;

  if (*result)
  {
    id v2 = result;
    ik::LogEspressoError((uint64_t)result, a2);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::operator+<char>();
    uint64_t v4 = std::string::append(&v13, " [espresso error: ");
    long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
    v14.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v5;
    v4->__r_.__value_.__l.__size_ = 0;
    v4->__r_.__value_.__r.__words[2] = 0;
    v4->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v12, *v2);
    if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v6 = &v12;
    }
    else {
      uint64_t v6 = (std::string *)v12.__r_.__value_.__r.__words[0];
    }
    if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v12.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v12.__r_.__value_.__l.__size_;
    }
    id v8 = std::string::append(&v14, (const std::string::value_type *)v6, size);
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v15.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    uint64_t v10 = std::string::append(&v15, "]");
    long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
    v16.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v11;
    v10->__r_.__value_.__l.__size_ = 0;
    v10->__r_.__value_.__r.__words[2] = 0;
    v10->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v16);
    exception->__vftable = (std::runtime_error_vtbl *)&unk_26C78E4F0;
  }
  return result;
}

{
  int *v2;
  std::runtime_error *exception;
  std::string *v4;
  long long v5;
  std::string *v6;
  std::string::size_type size;
  std::string *v8;
  long long v9;
  std::string *v10;
  long long v11;
  std::string v12;
  std::string v13;
  std::string v14;
  std::string v15;
  std::string v16;

  if (*result)
  {
    id v2 = result;
    ik::LogEspressoError((uint64_t)result, a2);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::operator+<char>();
    uint64_t v4 = std::string::append(&v13, " [espresso error: ");
    long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
    v14.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v5;
    v4->__r_.__value_.__l.__size_ = 0;
    v4->__r_.__value_.__r.__words[2] = 0;
    v4->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v12, *v2);
    if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v6 = &v12;
    }
    else {
      uint64_t v6 = (std::string *)v12.__r_.__value_.__r.__words[0];
    }
    if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v12.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v12.__r_.__value_.__l.__size_;
    }
    id v8 = std::string::append(&v14, (const std::string::value_type *)v6, size);
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v15.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    uint64_t v10 = std::string::append(&v15, "]");
    long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
    v16.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v11;
    v10->__r_.__value_.__l.__size_ = 0;
    v10->__r_.__value_.__r.__words[2] = 0;
    v10->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v16);
    exception->__vftable = (std::runtime_error_vtbl *)&unk_26C78E4F0;
  }
  return result;
}

void sub_21764B92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v35 - 41) < 0)
  {
    operator delete(*(void **)(v35 - 64));
    if ((a33 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a14 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((a33 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a28);
  if ((a14 & 0x80000000) == 0)
  {
LABEL_4:
    if ((a26 & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  operator delete(a9);
  if ((a26 & 0x80000000) == 0)
  {
LABEL_5:
    if (a20 < 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  operator delete(a21);
  if (a20 < 0)
  {
LABEL_6:
    operator delete(__p);
    if ((v34 & 1) == 0) {
LABEL_14:
    }
      _Unwind_Resume(a1);
LABEL_13:
    __cxa_free_exception(v33);
    goto LABEL_14;
  }
LABEL_12:
  if (!v34) {
    goto LABEL_14;
  }
  goto LABEL_13;
}

uint64_t ___ZN2ikL28IsAppleNeuralEngineAvailableEv_block_invoke_0()
{
  uint64_t result = MGGetBoolAnswer();
  _MergedGlobals_2 = result;
  return result;
}

double ft::Track::Track(ft::Track *this, const uint64_t *a2)
{
  *(void *)this = &unk_26C78E478;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = *a2;
  *((unsigned char *)this + 232) = 0;
  *((unsigned char *)this + 240) = 0;
  *((unsigned char *)this + 56) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((void *)this + 31) = 0;
  *((void *)this + 32) = 0;
  return result;
}

uint64_t ft::Track::Predict(uint64_t this, const Frame *a2)
{
  if (!*(unsigned char *)(this + 232))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Predict called before initialization");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (!*(unsigned char *)(this + 240))
  {
    ++*(void *)(this + 256);
    id v2 = *(uint64_t (**)(void))(*(void *)this + 24);
    return v2();
  }
  return this;
}

void sub_21764BB8C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ft::Track::Update(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  *(void *)(a1 + 248) = 0x3FF0000000000000;
  *(void *)(a1 + 256) = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
  int v6 = *(unsigned __int8 *)(a1 + 232);
  long long v8 = a3[1];
  long long v7 = a3[2];
  *(_OWORD *)(a1 + 56) = *a3;
  *(_OWORD *)(a1 + 72) = v8;
  *(_OWORD *)(a1 + 88) = v7;
  long long v9 = a3[5];
  long long v10 = a3[6];
  long long v11 = a3[4];
  *(_OWORD *)(a1 + 104) = a3[3];
  *(_OWORD *)(a1 + 152) = v10;
  *(_OWORD *)(a1 + 136) = v9;
  *(_OWORD *)(a1 + 120) = v11;
  long long v12 = a3[9];
  long long v13 = a3[10];
  long long v14 = a3[8];
  *(_OWORD *)(a1 + 168) = a3[7];
  *(_OWORD *)(a1 + 216) = v13;
  *(_OWORD *)(a1 + 200) = v12;
  *(_OWORD *)(a1 + 184) = v14;
  if (!v6) {
    *(unsigned char *)(a1 + 232) = 1;
  }
  return result;
}

void ft::CreateIOSurfaceBackedPixelBuffer(ft *this@<X0>, size_t a2@<X1>, OSType a3@<W2>, void *a4@<X8>)
{
  v12[1] = *MEMORY[0x263EF8340];
  CVPixelBufferRef v10 = 0;
  uint64_t v11 = *MEMORY[0x263F04130];
  v12[0] = MEMORY[0x263EFFA78];
  CFDictionaryRef v8 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (size_t)this, a2, a3, v8, &v10))
  {
    *a4 = v10;
    operator new();
  }
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Failed to create IOSurface-backed CVPixelBuffer.");
  __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_21764C0D4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21764C0E8(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    __cxa_begin_catch(exception_object);
    CVPixelBufferRelease(v2);
    __cxa_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_21764C108(_Unwind_Exception *a1)
{
}

void sub_21764C114(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

CVPixelBufferPoolRef *ft::PixelBufferPool::PixelBufferPool(CVPixelBufferPoolRef *poolOut, const __CFDictionary *a2, const __CFDictionary *a3)
{
  *poolOut = 0;
  CVReturn v4 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, a3, poolOut);
  if (v4)
  {
    int v6 = v4;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v10, v6);
    CFDictionaryRef v8 = std::string::insert(&v10, 0, "Failed to create pixel buffer pool. Status = ");
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v11.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v11);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return poolOut;
}

void sub_21764C200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

CVPixelBufferPoolRef *ft::PixelBufferPool::PixelBufferPool(CVPixelBufferPoolRef *a1, uint64_t a2, const __CFDictionary *a3)
{
  CFDictionaryRef v5 = (const __CFDictionary *)ft::AsPoolAttribsDict(a2);

  return ft::PixelBufferPool::PixelBufferPool(a1, v5, a3);
}

{
  CFDictionaryRef v5;
  uint64_t vars8;

  CFDictionaryRef v5 = (const __CFDictionary *)ft::AsPoolAttribsDict(a2);

  return ft::PixelBufferPool::PixelBufferPool(a1, v5, a3);
}

void *ft::AsPoolAttribsDict(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = [NSNumber numberWithUnsignedLong:*(void *)a1];
  [v2 setValue:v3 forKey:*MEMORY[0x263F041C0]];

  CVReturn v4 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 8)];
  [v2 setValue:v4 forKey:*MEMORY[0x263F041B0]];

  CFDictionaryRef v5 = (void *)(a1 + 16);
  if (*(char *)(a1 + 39) < 0)
  {
    if (!*(void *)(a1 + 24)) {
      goto LABEL_3;
    }
    CFDictionaryRef v5 = (void *)*v5;
  }
  else if (!*(unsigned char *)(a1 + 39))
  {
LABEL_3:

    return v2;
  }
  long long v7 = [NSString stringWithUTF8String:v5];
  [v2 setValue:v7 forKey:*MEMORY[0x263F041D0]];

  return v2;
}

void sub_21764C3B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21764C3D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ft::PixelBufferPool::NewPixelBuffer(CVPixelBufferPoolRef *this@<X0>, CVPixelBufferRef *a2@<X8>)
{
  CVPixelBufferRef pixelBufferOut = 0;
  CVReturn v3 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], *this, &pixelBufferOut);
  if (!v3)
  {
    *a2 = pixelBufferOut;
    operator new();
  }
  int v4 = v3;
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::to_string(&v8, v4);
  int v6 = std::string::insert(&v8, 0, "Failed to create pixel buffer. Status = ");
  long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v9.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v9.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  std::runtime_error::runtime_error(exception, &v9);
  __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_21764C550(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
}

void sub_21764C5C8()
{
}

void ft::PixelBufferPool::~PixelBufferPool(__CVPixelBufferPool **this)
{
  id v1 = *this;
  if (v1) {
    CVPixelBufferPoolRelease(v1);
  }
}

{
  __CVPixelBufferPool *v1;

  id v1 = *this;
  if (v1) {
    CVPixelBufferPoolRelease(v1);
  }
}

void std::__shared_ptr_pointer<__CVBuffer *,void (*)(__CVBuffer *),std::allocator<__CVBuffer>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D449420);
}

uint64_t std::__shared_ptr_pointer<__CVBuffer *,void (*)(__CVBuffer *),std::allocator<__CVBuffer>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<__CVBuffer *,void (*)(__CVBuffer *),std::allocator<__CVBuffer>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000002176676A8) {
    return a1 + 32;
  }
  if (((v3 & 0x80000002176676A8 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000002176676A8)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000002176676A8 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 32;
  }
  return 0;
}

unint64_t ttNonMaxSuppression(uint64_t a1, unint64_t a2, float a3)
{
  if (!a1) {
    ttNonMaxSuppression();
  }
  unint64_t v3 = a2;
  if (a2)
  {
    bmHeapsort(a1, a2, 0x24uLL, (int (*)(uint64_t, uint64_t))ttDetRectScoreCompare);
    unint64_t v6 = 0;
    uint64_t v7 = a1 + 36;
    uint64_t v8 = 1;
    do
    {
      unint64_t v9 = v6 + 1;
      int v10 = v3;
      if (v6 + 1 >= v3)
      {
        unint64_t v3 = v6 + 1;
      }
      else
      {
        std::string v11 = (float *)(a1 + 36 * v6);
        uint64_t v12 = v7;
        unint64_t v13 = v8;
        unint64_t v3 = v6 + 1;
        do
        {
          ttDetRectOverlap(v11, (float *)v12);
          if (v17 <= a3)
          {
            unsigned int v18 = v3;
            if (v13 < v3) {
              ttNonMaxSuppression();
            }
            unint64_t v3 = (v3 + 1);
            uint64_t v14 = a1 + 36 * v18;
            long long v15 = *(_OWORD *)v12;
            long long v16 = *(_OWORD *)(v12 + 16);
            *(_DWORD *)(v14 + 32) = *(_DWORD *)(v12 + 32);
            *(_OWORD *)uint64_t v14 = v15;
            *(_OWORD *)(v14 + 16) = v16;
          }
          ++v13;
          v12 += 36;
        }
        while (v10 != v13);
      }
      ++v8;
      v7 += 36;
      unint64_t v6 = v9;
    }
    while (v9 < v3);
  }
  return v3;
}

unint64_t ttNonMaxSuppression2(uint64_t a1, unint64_t a2, float a3)
{
  if (!a1) {
    ttNonMaxSuppression2();
  }
  unint64_t v3 = a2;
  if (a2)
  {
    bmHeapsort(a1, a2, 0x24uLL, (int (*)(uint64_t, uint64_t))ttDetRectScoreCompare);
    unint64_t v6 = 0;
    uint64_t v7 = a1 + 36;
    uint64_t v8 = 1;
    do
    {
      unint64_t v9 = v6 + 1;
      int v10 = v3;
      if (v6 + 1 >= v3)
      {
        unint64_t v3 = v6 + 1;
      }
      else
      {
        std::string v11 = (float *)(a1 + 36 * v6);
        uint64_t v12 = v7;
        unint64_t v13 = v8;
        unint64_t v3 = v6 + 1;
        do
        {
          ttDetRectOverlap2(v11, (float *)v12);
          if (v17 <= a3)
          {
            unsigned int v18 = v3;
            if (v13 < v3) {
              ttNonMaxSuppression2();
            }
            unint64_t v3 = (v3 + 1);
            uint64_t v14 = a1 + 36 * v18;
            long long v15 = *(_OWORD *)v12;
            long long v16 = *(_OWORD *)(v12 + 16);
            *(_DWORD *)(v14 + 32) = *(_DWORD *)(v12 + 32);
            *(_OWORD *)uint64_t v14 = v15;
            *(_OWORD *)(v14 + 16) = v16;
          }
          ++v13;
          v12 += 36;
        }
        while (v10 != v13);
      }
      ++v8;
      v7 += 36;
      unint64_t v6 = v9;
    }
    while (v9 < v3);
  }
  return v3;
}

unint64_t ttNonMaxSuppressionSmallbox(uint64_t a1, unint64_t a2, float a3)
{
  if (!a1) {
    ttNonMaxSuppressionSmallbox();
  }
  unint64_t v3 = a2;
  if (a2)
  {
    bmHeapsort(a1, a2, 0x24uLL, (int (*)(uint64_t, uint64_t))ttDetRectScoreCompare);
    unint64_t v6 = 0;
    uint64_t v7 = a1 + 36;
    uint64_t v8 = 1;
    do
    {
      unint64_t v9 = v6 + 1;
      int v10 = v3;
      if (v6 + 1 >= v3)
      {
        unint64_t v3 = v6 + 1;
      }
      else
      {
        uint64_t v11 = a1 + 36 * v6;
        uint64_t v12 = v7;
        unint64_t v13 = v8;
        unint64_t v3 = v6 + 1;
        do
        {
          if (*(_DWORD *)(v11 + 16) != *(_DWORD *)(v12 + 16)
            || (ttDetRectOverlapSmallbox((float *)v11, (float *)v12), v14 <= a3))
          {
            unsigned int v15 = v3;
            if (v13 < v3) {
              ttNonMaxSuppressionSmallbox();
            }
            unint64_t v3 = (v3 + 1);
            uint64_t v16 = a1 + 36 * v15;
            long long v17 = *(_OWORD *)v12;
            long long v18 = *(_OWORD *)(v12 + 16);
            *(_DWORD *)(v16 + 32) = *(_DWORD *)(v12 + 32);
            *(_OWORD *)uint64_t v16 = v17;
            *(_OWORD *)(v16 + 16) = v18;
          }
          ++v13;
          v12 += 36;
        }
        while (v10 != v13);
      }
      ++v8;
      v7 += 36;
      unint64_t v6 = v9;
    }
    while (v9 < v3);
  }
  return v3;
}

uint64_t ttRemoveOverlapBoxes(long long *a1, unsigned int a2, unsigned __int8 *a3, unsigned int a4, float a5)
{
  if (a2 > a4) {
    ttRemoveOverlapBoxes();
  }
  if (!a2) {
    return 0;
  }
  CFDictionaryRef v5 = a3;
  unint64_t v7 = a2;
  bzero(a3, a2);
  uint64_t v8 = 0;
  unint64_t v9 = (float *)a1 + 9;
  uint64_t v10 = 1;
  do
  {
    uint64_t v11 = v8 + 1;
    if (v8 + 1 < v7)
    {
      uint64_t v12 = (float *)a1 + 9 * v8;
      unint64_t v13 = v9;
      uint64_t v14 = v10;
      do
      {
        ttDetRectOverlap(v12, v13);
        if (v15 > a5)
        {
          if (v12[6] <= v13[6]) {
            uint64_t v16 = v8;
          }
          else {
            uint64_t v16 = v14;
          }
          v5[v16] = 1;
        }
        ++v14;
        v13 += 9;
      }
      while (v7 != v14);
    }
    ++v10;
    v9 += 9;
    ++v8;
  }
  while (v11 != v7);
  uint64_t result = 0;
  long long v18 = a1;
  do
  {
    if (!*v5++)
    {
      uint64_t v20 = (uint64_t)a1 + 36 * result;
      long long v21 = *v18;
      long long v22 = v18[1];
      *(_DWORD *)(v20 + 32) = *((_DWORD *)v18 + 8);
      *(_OWORD *)uint64_t v20 = v21;
      *(_OWORD *)(v20 + 16) = v22;
      uint64_t result = (result + 1);
    }
    long long v18 = (long long *)((char *)v18 + 36);
    --v7;
  }
  while (v7);
  return result;
}

BOOL ttCheckOverlapBox(float *a1, unsigned int a2, float *a3, float a4)
{
  if (!a2) {
    return 0;
  }
  ttDetRectOverlap(a1, a3);
  if (v8 > a4) {
    return 1;
  }
  uint64_t v10 = a1 + 9;
  uint64_t v11 = 1;
  do
  {
    unint64_t v12 = v11;
    if (a2 == v11) {
      break;
    }
    ttDetRectOverlap(v10, a3);
    uint64_t v11 = v12 + 1;
    v10 += 9;
  }
  while (v13 <= a4);
  return v12 < a2;
}

uint64_t rtcv::simResize(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, int a6, uint64_t a7, int a8, float a9, float a10, float a11, float a12, int a13, int a14)
{
  if (a5 != 1) {
    return 0;
  }
  *(void *)&long long v32 = a1;
  *((void *)&v32 + 1) = __PAIR64__(a2, a3);
  uint64_t v33 = a4 | 0x500000000;
  long long v30 = v32;
  uint64_t v31 = v33;
  size_t v21 = a4 * a3;
  if (v21)
  {
    long long v22 = operator new(a4 * a3);
    bzero(v22, v21);
  }
  else
  {
    long long v22 = 0;
  }
  *(void *)&long long v30 = v22;
  uint64_t v25 = a7;
  int v26 = a13;
  int v27 = a8;
  int v28 = a14;
  int v29 = 5;
  if ((a6 - 1) <= 2)
  {
    uint64_t v23 = simResizeVisPipe(&v32, (uint64_t)&v25, (uint64_t *)&v30, dword_2176676BC[a6 - 1], 2u, a9, a10, a11, a12);
    if (!v22) {
      return v23;
    }
    goto LABEL_10;
  }
  uint64_t v23 = 0;
  if (v22) {
LABEL_10:
  }
    operator delete(v22);
  return v23;
}

void sub_21764CDBC(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

BOOL rtcv::simResize(void *a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, int a6, int a7, void *a8, unsigned int a9, unsigned int a10, unsigned int a11)
{
  if (a6 | a5) {
    return 0;
  }
  unsigned int v18 = a10;
  unsigned int v19 = a9;
  bzero(a8, a11 * a10);
  if (!a7)
  {
    if (a10 * a2 <= a9 * a3)
    {
      unsigned int v19 = vcvtas_u32_f32((float)(a10 * a2) / (float)a3);
      if (v19 > a9) {
        rtcv::simResize();
      }
    }
    else
    {
      unsigned int v18 = vcvtas_u32_f32((float)(a9 * a3) / (float)a2);
      if (v18 > a10) {
        rtcv::simResize();
      }
    }
  }
  src.data = a1;
  src.height = a3;
  src.width = a2;
  src.rowBytes = a4;
  v20.data = a8;
  v20.height = v18;
  v20.width = v19;
  v20.rowBytes = a11;
  return vImageScale_ARGB8888(&src, &v20, 0, 0) == 0;
}

BOOL rtcv::simCropResize(void *a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, int a6, int a7, void *a8, float a9, float a10, float a11, unsigned int a12, unsigned int a13, unsigned int a14)
{
  if (a6 | a5 | a7) {
    return 0;
  }
  uint64_t v20 = v14;
  uint64_t v21 = v15;
  v19.data = a1;
  v19.height = a3;
  v19.width = a2;
  v19.rowBytes = a4;
  dest.data = a8;
  dest.height = a13;
  dest.width = a12;
  dest.rowBytes = a14;
  transform.a = a11;
  transform.b = 0.0;
  transform.c = 0.0;
  transform.d = a11;
  transform.tx = -(float)(a11 * a9);
  transform.ty = (float)a13 - (float)(a11 * (float)((float)a3 - a10));
  return vImageAffineWarp_ARGB8888(&v19, &dest, 0, &transform, 0, 8u) == 0;
}

BOOL rtcv::simCropResizeExtendMean(void *a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, int a6, int a7, void *a8, float a9, float a10, float a11, unsigned int a12, unsigned int a13, unsigned int a14, uint64_t a15)
{
  if (a6 | a5 | a7) {
    return 0;
  }
  uint64_t v24 = v15;
  uint64_t v25 = v16;
  v23.data = a1;
  v23.height = a3;
  v23.width = a2;
  v23.rowBytes = a4;
  dest.data = a8;
  dest.height = a13;
  dest.width = a12;
  dest.rowBytes = a14;
  uint8_t backColor = *(unsigned char *)a15;
  __int16 v20 = *(_WORD *)(a15 + 1);
  char v21 = -1;
  transform.a = a11;
  *(void *)&transform.b = 0;
  transform.d = a11;
  transform.tx = -(float)(a11 * a9);
  transform.ty = (float)a13 - (float)(a11 * (float)((float)a3 - a10));
  return vImageAffineWarp_ARGB8888(&v23, &dest, 0, &transform, &backColor, 4u) == 0;
}

uint64_t rtcv::simImageChMeanTempBytes(rtcv *this, int a2)
{
  int v3 = (int)this;
  BmMixedBufSize::BmMixedBufSize((BmMixedBufSize *)v5);
  if (v5[1]) {
    rtcv::simImageChMeanTempBytes();
  }
  return (v5[0] + 12 * v3 * a2 + 9);
}

float rtcv::simImageChMean(const unsigned __int8 *a1, int a2, int a3, int a4, float *a5, unsigned int a6, unsigned char *a7)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!a4)
  {
    BmMixedBufSize::BmMixedBufSize((BmMixedBufSize *)&__C);
    if (HIDWORD(__C)) {
      rtcv::simImageChMeanTempBytes();
    }
    unsigned int v13 = __C + 12 * a2 * a3 + 9;
    LODWORD(__C) = v13;
    if (a5)
    {
      if (v13 > a6) {
        rtcv::simImageChMean();
      }
      uint64_t v14 = (float *)(((unint64_t)a5 + 3) & 0xFFFFFFFFFFFFFFFCLL);
      int v15 = 4 * a2 * a3 - a5;
      HIDWORD(__C) = v14 + v15;
      if (v13 < (int)v14 + v15) {
        rtcv::simImageChMean();
      }
      uint64_t v16 = (float *)(((unint64_t)a5 + (v14 + v15) + 3) & 0xFFFFFFFFFFFFFFFCLL);
      HIDWORD(__C) = v16 + v15;
      if (v13 < (int)v16 + v15) {
        rtcv::simImageChMean();
      }
      uint64_t v17 = (uint64_t)a5 + (v16 + v15) + 3;
      a5 = (float *)(v17 & 0xFFFFFFFFFFFFFFFCLL);
      HIDWORD(__C) = (v17 & 0xFFFFFFFC) + v15;
      if (v13 < HIDWORD(__C)) {
        rtcv::simImageChMean();
      }
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v16 = 0;
    }
    vDSP_Length v18 = (a3 * a2);
    float v22 = 0.0;
    uint64_t __C = 0;
    vDSP_vfltu8(a1, 4, a5, 1, v18);
    vDSP_vfltu8(a1 + 1, 4, v16, 1, v18);
    vDSP_vfltu8(a1 + 2, 4, v14, 1, v18);
    vDSP_meanv(a5, 1, (float *)&__C, v18);
    vDSP_meanv(v16, 1, (float *)&__C + 1, v18);
    vDSP_meanv(v14, 1, &v22, v18);
    float v19 = *((float *)&__C + 1);
    *a7 = (int)(float)(*(float *)&__C + 0.5);
    a7[1] = (int)(float)(v19 + 0.5);
    float result = v22 + 0.5;
    a7[2] = (int)(float)(v22 + 0.5);
  }
  return result;
}

uint64_t acMemBlockCoalesce(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2 >= 2)
  {
    uint64_t v4 = a2;
    bmHeapsort(a1, a2, 0xCuLL, (int (*)(uint64_t, uint64_t))acMemBlockCompareAddress);
    uint64_t v5 = 0;
    char v6 = 0;
    unint64_t v7 = (_DWORD *)(a1 + 20);
    uint64_t v8 = 1;
    do
    {
      unint64_t v9 = (void *)(a1 + 12 * v5);
      uint64_t v12 = *v9;
      uint64_t v10 = v9 + 1;
      uint64_t v11 = v12;
      unsigned int v13 = v7;
      unint64_t v14 = v8;
      do
      {
        uint64_t v15 = *v10;
        if (v11 + v15 == *((void *)v13 - 1))
        {
          *uint64_t v10 = *v13 + v15;
          *unsigned int v13 = 0;
          char v6 = 1;
        }
        ++v14;
        v13 += 3;
      }
      while (v14 < v2);
      ++v8;
      ++v5;
      v7 += 3;
    }
    while (v5 != v2 - 1);
    if (v6)
    {
      uint64_t v2 = 0;
      uint64_t v16 = (_DWORD *)(a1 + 8);
      do
      {
        if (*v16)
        {
          uint64_t v17 = a1 + 12 * v2;
          uint64_t v18 = *((void *)v16 - 1);
          uint64_t v2 = (v2 + 1);
          *(_DWORD *)(v17 + 8) = *v16;
          *(void *)uint64_t v17 = v18;
        }
        v16 += 3;
        --v4;
      }
      while (v4);
    }
  }
  return v2;
}

BOOL acMemBlockCompareAddress(void *a1, void *a2)
{
  return *a1 > *a2;
}

uint64_t acMemBlockCoalesceNoSort(uint64_t a1, uint64_t a2)
{
  if (a2 >= 2)
  {
    uint64_t v2 = 0;
    char v3 = 0;
    uint64_t v4 = (_DWORD *)(a1 + 20);
    uint64_t v5 = 1;
    uint64_t v6 = a2;
    do
    {
      unint64_t v7 = (void *)(a1 + 12 * v2);
      uint64_t v10 = *v7;
      uint64_t v8 = v7 + 1;
      uint64_t v9 = v10;
      uint64_t v11 = v4;
      unint64_t v12 = v5;
      do
      {
        uint64_t v13 = *v8;
        if (v9 + v13 == *((void *)v11 - 1))
        {
          *uint64_t v8 = *v11 + v13;
          *uint64_t v11 = 0;
          char v3 = 1;
        }
        ++v12;
        v11 += 3;
      }
      while (v12 < a2);
      ++v5;
      ++v2;
      v4 += 3;
    }
    while (v2 != a2 - 1);
    if (v3)
    {
      a2 = 0;
      unint64_t v14 = (_DWORD *)(a1 + 8);
      do
      {
        if (*v14)
        {
          uint64_t v15 = a1 + 12 * a2;
          uint64_t v16 = *((void *)v14 - 1);
          a2 = (a2 + 1);
          *(_DWORD *)(v15 + 8) = *v14;
          *(void *)uint64_t v15 = v16;
        }
        v14 += 3;
        --v6;
      }
      while (v6);
    }
  }
  return a2;
}

void ft::ProxyTrack::ProxyTrack(ft::ProxyTrack *this, const uint64_t *a2)
{
  ft::Track::Track(this, a2);
  *uint64_t v2 = &unk_26C78E3E0;
}

{
  void *v2;

  ft::Track::Track(this, a2);
  *uint64_t v2 = &unk_26C78E3E0;
}

void ft::ProxyTrack::~ProxyTrack(ft::ProxyTrack *this)
{
  ft::Track::~Track(this);

  JUMPOUT(0x21D449420);
}

double ft::ProxyTrack::UpdateState(uint64_t a1, uint64_t a2, float *a3)
{
  long long v3 = *(_OWORD *)a3;
  *(_OWORD *)(a1 + 40) = *((_OWORD *)a3 + 1);
  *(_OWORD *)(a1 + 24) = v3;
  double result = a3[10];
  *(double *)(a1 + 248) = result;
  return result;
}

uint64_t ft::ProxyTrack::SetLost(uint64_t this, char a2)
{
  *(unsigned char *)(this + 240) = a2;
  return this;
}

const char *ft::ProxyTrack::Kind(ft::ProxyTrack *this)
{
  return "proxy";
}

uint64_t *ttTrkScoreFindMaxScore(uint64_t *result, float *a2, _DWORD *a3, unsigned int *a4)
{
  int v4 = *((_DWORD *)result + 2);
  uint64_t v5 = *((unsigned int *)result + 3);
  *a2 = -3.4028e38;
  *a3 = 0;
  *a4 = 0;
  if (v4)
  {
    if (v5)
    {
      unsigned int v6 = 0;
      uint64_t v7 = *result;
      float v8 = -3.4028e38;
      while (*((_DWORD *)result + 3) && *((_DWORD *)result + 2) > v6)
      {
        uint64_t v10 = 0;
        uint64_t v11 = v7 + *((_DWORD *)result + 4) * v6;
        do
        {
          float v12 = *(float *)(v11 + 4 * v10);
          if (v12 > v8)
          {
            *a2 = v12;
            *a3 = v10;
            float v8 = v12;
            *a4 = v6;
          }
          ++v10;
        }
        while (v5 != v10);
        if (++v6 == v4) {
          return result;
        }
      }
LABEL_17:
      AcAttrNode::postProcess();
    }
    if (!*((_DWORD *)result + 3) || *((_DWORD *)result + 2) <= (v4 - 1)) {
      goto LABEL_17;
    }
  }
  return result;
}

uint64_t *ttTrkScoreNormalize(uint64_t *result)
{
  uint64_t v1 = *((unsigned int *)result + 2);
  if (v1)
  {
    uint64_t v2 = *((unsigned int *)result + 3);
    if (!v2) {
      AcAttrNode::postProcess();
    }
    unsigned int v3 = 0;
    uint64_t v4 = 0;
    int32x2_t v5 = 0;
    do
    {
      unsigned int v6 = (float *)(*result + v3);
      uint64_t v7 = *((unsigned int *)result + 3);
      do
      {
        float v8 = *v6++;
        *(float *)v5.i32 = *(float *)v5.i32 + v8;
        --v7;
      }
      while (v7);
      ++v4;
      v3 += *((_DWORD *)result + 4);
    }
    while (v4 != v1);
    if (*(float *)v5.i32 > 0.0000001)
    {
      uint64_t v9 = *result;
      int v10 = *((_DWORD *)result + 4);
      if (v2 > 7)
      {
        uint64_t v14 = v2 & 0xFFFFFFF8;
        float32x4_t v15 = (float32x4_t)vdupq_lane_s32(v5, 0);
        unint64_t v16 = v2 - v14;
        if (v2 == v14)
        {
          unsigned int v17 = 0;
          uint64_t v18 = v9 + 16;
          while (v16 < *((unsigned int *)result + 2))
          {
            float v19 = (float32x4_t *)(v18 + v17);
            uint64_t v20 = v14;
            do
            {
              float32x4_t v21 = vdivq_f32(*v19, v15);
              v19[-1] = vdivq_f32(v19[-1], v15);
              *float v19 = v21;
              v19 += 2;
              v20 -= 8;
            }
            while (v20);
            ++v16;
            v17 += v10;
            if (v16 == v1) {
              return result;
            }
          }
        }
        else
        {
          unsigned int v22 = 0;
          unint64_t v23 = 0;
          uint64_t v24 = v9 + 16;
          uint64_t v25 = v9 + ((4 * v2) & 0x3FFFFFFE0);
          while (v23 < *((unsigned int *)result + 2))
          {
            int v26 = (float *)(v25 + v22);
            int v27 = (float32x4_t *)(v24 + v22);
            uint64_t v28 = v14;
            do
            {
              float32x4_t v29 = vdivq_f32(*v27, v15);
              v27[-1] = vdivq_f32(v27[-1], v15);
              float32x4_t *v27 = v29;
              v27 += 2;
              v28 -= 8;
            }
            while (v28);
            unint64_t v30 = v16;
            do
            {
              *int v26 = *v26 / *(float *)v5.i32;
              ++v26;
              --v30;
            }
            while (v30);
            ++v23;
            v22 += v10;
            if (v23 == v1) {
              return result;
            }
          }
        }
      }
      else
      {
        unsigned int v11 = 0;
        unint64_t v12 = 0;
        while (v12 < *((unsigned int *)result + 2))
        {
          uint64_t v13 = (float *)(v9 + v11);
          *uint64_t v13 = *v13 / *(float *)v5.i32;
          if (v2 != 1)
          {
            v13[1] = v13[1] / *(float *)v5.i32;
            if (v2 != 2)
            {
              v13[2] = v13[2] / *(float *)v5.i32;
              if (v2 != 3)
              {
                v13[3] = v13[3] / *(float *)v5.i32;
                if (v2 != 4)
                {
                  v13[4] = v13[4] / *(float *)v5.i32;
                  if (v2 != 5)
                  {
                    v13[5] = v13[5] / *(float *)v5.i32;
                    if (v2 != 6) {
                      v13[6] = v13[6] / *(float *)v5.i32;
                    }
                  }
                }
              }
            }
          }
          ++v12;
          v11 += v10;
          if (v1 == v12) {
            return result;
          }
        }
      }
      AcAttrNode::postProcess();
    }
  }
  return result;
}

float ttTrkComputeKL(uint64_t *a1, uint64_t *a2, int a3, int a4, int a5, int a6)
{
  int v7 = *((_DWORD *)a2 + 2);
  int v29 = *((_DWORD *)a2 + 3);
  int v8 = *((_DWORD *)a1 + 2);
  int v9 = *((_DWORD *)a1 + 3);
  int v10 = *((_DWORD *)a1 + 4);
  uint64_t v27 = *a2;
  uint64_t v28 = *a1;
  int v11 = *((_DWORD *)a2 + 4);
  int v25 = v11 * (a6 - 9);
  int v26 = v10 * (a4 - 9);
  float v12 = 0.0;
  int v13 = -9;
  int v32 = a6;
  int v33 = v11;
  do
  {
    unsigned int v14 = v13 + a5;
    int v35 = v13;
    if (v13 + a5 >= 0)
    {
      unsigned int v15 = v13 + a3;
      if (((v13 + a3) & 0x80000000) == 0 && (int)v14 < v29)
      {
        int v16 = -9;
        unsigned int v18 = v25;
        unsigned int v17 = v26;
        uint64_t v19 = v27 + 4 * v14;
        uint64_t v34 = v19;
        do
        {
          if (a6 + v16 >= 0 && a6 + v16 < v7 && (int)v15 < v9 && ((a4 + v16) & 0x80000000) == 0 && a4 + v16 < v8)
          {
            float v20 = *(float *)(v28 + 4 * v15 + v17);
            float v21 = *(float *)(v19 + v18);
            if (v21 >= 0.000001 && v20 >= 0.000001)
            {
              float v23 = logf(v20 / v21);
              uint64_t v19 = v34;
              a6 = v32;
              int v11 = v33;
              float v12 = v12 + (float)(v20 * v23);
            }
          }
          ++v16;
          v17 += v10;
          v18 += v11;
        }
        while (v16 != 10);
      }
    }
    int v13 = v35 + 1;
  }
  while (v35 != 9);
  return fmaxf(v12, 0.0);
}

void *ft::SiameseRpnSession::SiameseRpnSession(void *this)
{
  *this = 0;
  this[1] = 0;
  return this;
}

{
  *this = 0;
  this[1] = 0;
  return this;
}

void ft::SiameseRpnSession::~SiameseRpnSession(ft::SiameseRpnSession *this)
{
  uint64_t v1 = *(void *)this;
  *(void *)this = 0;
  if (v1)
  {
    TtTrkRpnStop(*(void **)(v1 + 536));
    TtTrkRpnDestroy(*(TtTrkRpnNode ***)(v1 + 536));
    MEMORY[0x21D449420](v1, 0x10A0C40C54048FFLL);
  }
}

{
  uint64_t v1;

  uint64_t v1 = *(void *)this;
  *(void *)this = 0;
  if (v1)
  {
    TtTrkRpnStop(*(void **)(v1 + 536));
    TtTrkRpnDestroy(*(TtTrkRpnNode ***)(v1 + 536));
    MEMORY[0x21D449420](v1, 0x10A0C40C54048FFLL);
  }
}

void ft::SiameseRpnSession::ComputeExemplarInputRect(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  ft::SiameseRpnSession::EnsureAtStage(a1, 0);
  operator new();
}

void sub_21764DCB4(_Unwind_Exception *a1)
{
  MEMORY[0x21D449420](v1, 0x10A0C40C54048FFLL);
  _Unwind_Resume(a1);
}

void sub_21764DCD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ft::SiameseRpnSession::EnsureAtStage(uint64_t result, unint64_t a2)
{
  if (*(void *)(result + 8) != a2)
  {
    uint64_t v2 = result;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v14, a2);
    int32x2_t v5 = std::string::insert(&v14, 0, "Expected to be in stage ");
    long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    v15.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v6;
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    int v7 = std::string::append(&v15, ". Curent stage instead: ");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v16.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v13, *(void *)(v2 + 8));
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v9 = &v13;
    }
    else {
      int v9 = (std::string *)v13.__r_.__value_.__r.__words[0];
    }
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v13.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v13.__r_.__value_.__l.__size_;
    }
    int v11 = std::string::append(&v16, (const std::string::value_type *)v9, size);
    long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v17.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v17);
    exception->__vftable = (std::runtime_error_vtbl *)&unk_26C78E450;
  }
  return result;
}

void sub_21764DE50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v35 - 41) < 0)
  {
    operator delete(*(void **)(v35 - 64));
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a33 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a9);
  if ((a33 & 0x80000000) == 0)
  {
LABEL_4:
    if ((a26 & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  operator delete(a28);
  if ((a26 & 0x80000000) == 0)
  {
LABEL_5:
    if (a20 < 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  operator delete(a21);
  if (a20 < 0)
  {
LABEL_6:
    operator delete(__p);
    if ((v34 & 1) == 0) {
LABEL_14:
    }
      _Unwind_Resume(a1);
LABEL_13:
    __cxa_free_exception(v33);
    goto LABEL_14;
  }
LABEL_12:
  if (!v34) {
    goto LABEL_14;
  }
  goto LABEL_13;
}

void sub_21764E040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (*(char *)(v28 - 41) < 0)
  {
    operator delete(*(void **)(v28 - 64));
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a26 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a9);
  if ((a26 & 0x80000000) == 0)
  {
LABEL_4:
    if (a20 < 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  operator delete(a21);
  if (a20 < 0)
  {
LABEL_5:
    operator delete(__p);
    if ((v27 & 1) == 0) {
LABEL_12:
    }
      _Unwind_Resume(a1);
LABEL_11:
    __cxa_free_exception(v26);
    goto LABEL_12;
  }
LABEL_10:
  if (!v27) {
    goto LABEL_12;
  }
  goto LABEL_11;
}

void ft::SiameseRpnSession::PostProcessExemplarOutputs(ft::SiameseRpnSession *a1, void *a2)
{
  ft::SiameseRpnSession::EnsureAtStage((uint64_t)a1, 1uLL);
  uint64_t v4 = *(void *)a1;
  HIBYTE(__p[2]) = 16;
  strcpy((char *)__p, "net_exempler_reg");
  int32x2_t v5 = std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::find<std::string>(a2, (uint64_t)__p);
  if (!v5) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  long long v6 = (void *)(v4 + 2660);
  *long long v6 = v5[5];
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  HIBYTE(__p[2]) = 16;
  strcpy((char *)__p, "net_exempler_cls");
  int v7 = std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::find<std::string>(a2, (uint64_t)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  v6[1] = v7[5];
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  __p[0] = operator new(0x20uLL);
  *(_OWORD *)&__p[1] = xmmword_217666E70;
  strcpy((char *)__p[0], "Exemplar post-processing");
  TtTrkRpnExemplarPostProcess(*(void *)(*(void *)a1 + 536), *(void *)a1 + 544, *(void *)a1 + 2636, *(void *)a1 + 2708, (_DWORD *)(*(void *)a1 + 557), *(unsigned char **)a1);
  int v10 = v8;
  ft::EnsureOK((uint64_t)__p, &v10);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  int v9 = *(unsigned char **)a1;
  v9[552] = 0;
  *int v9 = 0;
  *((void *)a1 + 1) = 2;
  ft::SiameseRpnSession::PrepareNextInstanceInputRect(a1);
}

void sub_21764E278(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ft::SiameseRpnSession::PrepareNextInstanceInputRect(ft::SiameseRpnSession *this)
{
  ft::SiameseRpnSession::EnsureAtStage((uint64_t)this, 2uLL);
  std::string __p = operator new(0x19uLL);
  long long v4 = xmmword_217667700;
  strcpy((char *)__p, "Instance pre-processing");
  int v2 = TtTrkRpnInstancePreProcess(*(void *)(*(void *)this + 536), *(void *)this + 544, *(void *)this, (float32x2_t *)(*(void *)this + 557), *(void *)this + 2636, *(void *)this + 2708, *(void *)this + 2792);
  ft::EnsureOK((uint64_t)&__p, &v2);
  if (SHIBYTE(v4) < 0) {
    operator delete(__p);
  }
}

void sub_21764E350(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ft::SiameseRpnSession::PutativeSize(ft::SiameseRpnSession *this)
{
  return *(void *)(*(void *)this + 544);
}

double ft::SiameseRpnSession::ComputeInstanceInputRect(ft::SiameseRpnSession *this)
{
  ft::SiameseRpnSession::EnsureAtStage((uint64_t)this, 2uLL);
  __n128 v8 = 0uLL;
  char v7 = 21;
  strcpy(__p, "Fetching instance ROI");
  TtTrkRpnGetInstanceCrop((__n128 *)(*(void *)this + 557), &v8);
  int v5 = v2;
  ft::EnsureOK((uint64_t)__p, &v5);
  if (v7 < 0) {
    operator delete(*(void **)__p);
  }
  LODWORD(v3) = *(_DWORD *)(*(void *)this + 544);
  return v8.n128_f32[0] / (double)v3;
}

void sub_21764E43C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

float ft::SiameseRpnSession::PostProcessInstanceOutputs@<S0>(unsigned __int8 **a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  long long v6 = *a1;
  HIBYTE(__p[2]) = 14;
  strcpy((char *)__p, "regress_adjust");
  char v7 = std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::find<std::string>(a2, (uint64_t)__p);
  if (!v7) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  __n128 v8 = v6 + 2684;
  *__n128 v8 = v7[5];
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  HIBYTE(__p[2]) = 21;
  strcpy((char *)__p, "classification_x_corr");
  int v9 = std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::find<std::string>(a2, (uint64_t)__p);
  if (!v9) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  v8[1] = v9[5];
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  __p[0] = operator new(0x20uLL);
  *(_OWORD *)&__p[1] = xmmword_217666E70;
  strcpy((char *)__p[0], "Instance post-processing");
  int v21 = TtTrkRpnInstancePostProcess(*((void *)*a1 + 67), (unsigned int *)*a1 + 136, (uint64_t)(*a1 + 2636), (uint64_t)(*a1 + 2708), (uint64_t)(*a1 + 557), *a1);
  ft::EnsureOK((uint64_t)__p, &v21);
  if (SHIBYTE(__p[2]) < 0)
  {
    operator delete(__p[0]);
    int v11 = *a1;
    *int v11 = 0;
    int v12 = *((_DWORD *)v11 + 45);
    if (!v12)
    {
LABEL_13:
      *(unsigned char *)a3 = 0;
      *(unsigned char *)(a3 + 40) = v12;
      return result;
    }
  }
  else
  {
    int v11 = *a1;
    *int v11 = 0;
    int v12 = *((_DWORD *)v11 + 45);
    if (!v12) {
      goto LABEL_13;
    }
  }
  if (*((_DWORD *)v11 + 67) == 2)
  {
    LOBYTE(v12) = 0;
    a1[1] = (unsigned __int8 *)3;
    goto LABEL_13;
  }
  ft::SiameseRpnSession::PrepareNextInstanceInputRect((ft::SiameseRpnSession *)a1);
  LODWORD(v13) = *((_DWORD *)*a1 + 136);
  double v14 = (double)v13;
  double v15 = *((float *)v11 + 48) / v14;
  LODWORD(v16) = *((_DWORD *)*a1 + 137);
  double v17 = (double)v16;
  double v18 = *((float *)v11 + 49) / v17;
  double v19 = *((float *)v11 + 50) / v14;
  double v20 = *((float *)v11 + 51) / v17;
  *(float *)&double v14 = (float)*((unsigned int *)v11 + 52);
  *(double *)a3 = v15;
  *(double *)(a3 + 8) = v18;
  *(double *)(a3 + 16) = v19;
  *(double *)(a3 + 24) = v20;
  float result = *(float *)&v14 / 1000.0;
  *(float *)(a3 + 32) = *(float *)&v14 / 1000.0;
  *(unsigned char *)(a3 + 40) = 1;
  return result;
}

void sub_21764E684(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ft::SiameseRpnSession::CurrentStage(ft::SiameseRpnSession *this)
{
  return *((void *)this + 1);
}

uint64_t *ft::SiameseRpnSession::Reset(uint64_t *this)
{
  uint64_t v1 = *this;
  *this = 0;
  this[1] = 0;
  if (v1)
  {
    TtTrkRpnStop(*(void **)(v1 + 536));
    TtTrkRpnDestroy(*(TtTrkRpnNode ***)(v1 + 536));
    JUMPOUT(0x21D449420);
  }
  return this;
}

void ft::SiameseRpnStageError::~SiameseRpnStageError(std::runtime_error *this)
{
  std::runtime_error::~runtime_error(this);

  JUMPOUT(0x21D449420);
}

ft::SiameseRpnCore *ft::SiameseRpnCore::SiameseRpnCore(ft::SiameseRpnCore *this)
{
  *(_OWORD *)((char *)this + 157) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  int v2 = (uint64_t *)((char *)this + 536);
  unint64_t v3 = (char *)this + 556;
  long long v4 = (char *)this + 557;
  int v5 = (_OWORD *)((char *)this + 2424);
  long long v6 = (_OWORD *)((char *)this + 2792);
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((_OWORD *)this + 15) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *((_OWORD *)this + 17) = 0u;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 19) = 0u;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *((_OWORD *)this + 25) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_OWORD *)this + 27) = 0u;
  *((_OWORD *)this + 28) = 0u;
  *((_OWORD *)this + 29) = 0u;
  *((_OWORD *)this + 30) = 0u;
  *((_OWORD *)this + 31) = 0u;
  *((_OWORD *)this + 32) = 0u;
  *((_OWORD *)this + 33) = 0u;
  *(_OWORD *)((char *)this + 537) = 0u;
  bzero((char *)this + 556, 0x749uLL);
  *(_OWORD *)((char *)this + 2774) = 0u;
  v5[20] = 0u;
  v5[21] = 0u;
  v5[18] = 0u;
  v5[19] = 0u;
  v5[16] = 0u;
  v5[17] = 0u;
  v5[14] = 0u;
  v5[15] = 0u;
  v5[12] = 0u;
  v5[13] = 0u;
  v5[10] = 0u;
  v5[11] = 0u;
  v5[8] = 0u;
  v5[9] = 0u;
  v5[6] = 0u;
  v5[7] = 0u;
  v5[4] = 0u;
  v5[5] = 0u;
  _DWORD v5[2] = 0u;
  v5[3] = 0u;
  *int v5 = 0u;
  v5[1] = 0u;
  v6[7] = 0u;
  v6[8] = 0u;
  v6[5] = 0u;
  v6[6] = 0u;
  v6[3] = 0u;
  v6[4] = 0u;
  v6[1] = 0u;
  v6[2] = 0u;
  *long long v6 = 0u;
  __p[0] = operator new(0x19uLL);
  *(_OWORD *)&__p[1] = xmmword_217667700;
  strcpy((char *)__p[0], "Tracker handle creation");
  int Params = TtTrkRpnCreate((uint64_t)v2, (uint64_t)v3, (uint64_t)v4);
  ft::EnsureOK((uint64_t)__p, &Params);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  HIBYTE(__p[2]) = 18;
  strcpy((char *)__p, "Get tracker params");
  int Params = TtTrkRpnGetParams(*v2, (uint64_t)v4, (uint64_t)v5);
  ft::EnsureOK((uint64_t)__p, &Params);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  HIBYTE(__p[2]) = 9;
  strcpy((char *)__p, "RPN start");
  int Params = TtTrkRpnStart((uint64_t *)*v2, (uint64_t)v4);
  ft::EnsureOK((uint64_t)__p, &Params);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  *(void *)((char *)this + 2676) = *((void *)this + 316);
  *((_DWORD *)this + 675) = *((_DWORD *)this + 623);
  *((_DWORD *)this + 676) = *((_DWORD *)this + 624);
  *((_DWORD *)this + 664) = *((_DWORD *)this + 616);
  *((_DWORD *)this + 661) = *((_DWORD *)this + 612);
  *((void *)this + 331) = 195948557;
  *(void *)((char *)this + 2636) = 195948557;
  *(void *)((char *)this + 2684) = 195948557;
  *(void *)((char *)this + 2692) = 195948557;
  *(void *)((char *)this + 2660) = 195948557;
  *(void *)((char *)this + 2668) = 195948557;
  return this;
}

void sub_21764E9A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AcAttrCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2 && a3) {
    operator new();
  }
  return 4294967292;
}

void sub_21764EAE4(_Unwind_Exception *a1)
{
  MEMORY[0x21D449420](v1, 0x1080C401E4740B3);
  _Unwind_Resume(a1);
}

uint64_t AcAttrDestroy(AcAttrNode **a1)
{
  if (!a1) {
    return 4294967292;
  }
  int v2 = *a1;
  if (!v2) {
    return 4294967292;
  }
  AcAttrNode::~AcAttrNode(v2);
  MEMORY[0x21D449420]();
  MEMORY[0x21D449420](a1, 0x10A0C40947D6BA8);
  return 0;
}

uint64_t AcAttrStart(void *a1)
{
  uint64_t result = 4294967292;
  if (a1)
  {
    if (*a1) {
      return 0;
    }
    else {
      return 4294967292;
    }
  }
  return result;
}

uint64_t AcAttrStop(void *a1)
{
  uint64_t result = 4294967292;
  if (a1)
  {
    if (*a1) {
      return 0;
    }
    else {
      return 4294967292;
    }
  }
  return result;
}

uint64_t AcAttrGetParams(void *a1, uint64_t a2, void *__dst)
{
  if (!a1) {
    return 4294967292;
  }
  if (!*a1) {
    return 4294967292;
  }
  uint64_t result = 4294967292;
  if (a2)
  {
    if (__dst)
    {
      memcpy(__dst, a1 + 1, 0x2E8uLL);
      return 0;
    }
  }
  return result;
}

uint64_t AcAttrPreProcess(uint64_t a1, unsigned int *a2, float32x2_t *a3, _DWORD *a4, uint64_t a5, _DWORD *a6, int *a7)
{
  if (!a1 || !*(void *)a1) {
    return 4294967292;
  }
  uint64_t result = 4294967292;
  if (a2 && a3 && a4 && a5 && a6 && a7)
  {
    uint64_t result = AcAttrNode::setUpNetBuffers(a3[27].u32[1], a5, (_DWORD *)(a1 + 8), a7);
    if (!result) {
      return AcAttrNode::preProcess(*(void *)a1, *a2, a2[1], a2 + 2, a3 + 28, a3[27].u32[1], a4, (uint64_t)a7, a6);
    }
  }
  return result;
}

uint64_t AcAttrPreProcessCropResizeRef(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, uint64_t a5, uint64_t a6)
{
  if (!a1) {
    return 4294967292;
  }
  uint64_t result = 4294967292;
  if (a2)
  {
    if (*(void *)a1)
    {
      if (a6)
      {
        if (a4)
        {
          if (a5)
          {
            if (*(void *)a3)
            {
              if ((*(unsigned char *)(a3 + 12) & 3) == 0)
              {
                uint64_t result = AcAttrNode::setUpNetBuffers(*a4, a6, (_DWORD *)(a1 + 8), (int *)(a1 + 752));
                if (!result)
                {
                  unint64_t v10 = *a4;
                  if (!v10) {
                    return 0;
                  }
                  unint64_t v11 = 0;
                  int v12 = (unsigned int *)(a1 + 768);
                  unint64_t v13 = a4 + 1;
                  double v14 = (float *)(a4 + 104);
                  do
                  {
                    double v15 = (void *)*((void *)v12 - 2);
                    if (!v15) {
                      return 4294967292;
                    }
                    if (*v13)
                    {
                      if (!rtcv::simCropResize(*(void **)a3, *(_DWORD *)(a3 + 12) >> 2, *(_DWORD *)(a3 + 8), *(_DWORD *)(a3 + 16), 0, 0, 0, v15, *(v14 - 3), *(v14 - 2), (float)*(v12 - 2) / fmaxf(*v14, 1.0), *(v12 - 1) >> 2, *(v12 - 2), *v12))return 4294967288; {
                      unint64_t v10 = *a4;
                      }
                    }
                    uint64_t result = 0;
                    ++v11;
                    v12 += 6;
                    v13 += 40;
                    v14 += 4;
                  }
                  while (v11 < v10);
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

__n128 AcAttrPostProcess(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, char *a5, __n128 result)
{
  if (a1
    && *(void *)a1
    && a2
    && a3
    && a4
    && a5
    && !AcAttrNode::setUpNetBuffers(*((unsigned int *)a5 + 55), a3, (_DWORD *)(a1 + 8), (int *)(a1 + 752)))
  {
    std::chrono::steady_clock::now();
    if (*((_DWORD *)a5 + 55))
    {
      unint64_t v13 = 0;
      uint64_t v14 = a1 + 992;
      uint64_t v15 = (uint64_t)(a5 + 224);
      while (!AcAttrNode::postProcess(*(void *)a1, v14, 7, a4, v15, v13, result.n128_f64[0], v9, v10, v11, v12))
      {
        ++v13;
        v14 += 168;
        v15 += 92;
        if (v13 >= *((unsigned int *)a5 + 55)) {
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:
      if (*a5 <= 3u)
      {
        unint64_t v16 = AcCommitHash();
        strncpy(a5 + 1, v16, 0x14uLL);
        double v17 = (unsigned __int8 *)&a5[20 * *a5];
        *(_DWORD *)(v17 + 37) = 0;
        *(_OWORD *)(v17 + 21) = *(_OWORD *)"attr";
        double v18 = (__n128 *)AcAttrNode::config(*(AcAttrNode **)a1);
        uint64_t result = *v18;
        *(_DWORD *)(v17 + 117) = v18[1].n128_u32[0];
        *(__n128 *)(v17 + 101) = result;
        ++*a5;
      }
    }
  }
  return result;
}

void sub_21764F8A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, char a20)
{
  if (a17 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void std::make_unique[abi:ne180100]<ik::EspressoNet,char const*,ik::EspressoConfig>()
{
}

void sub_21764FB70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  std::__shared_weak_count::~__shared_weak_count(v16);
  operator delete(v18);
  if (a15 < 0) {
    operator delete(__p);
  }
  MEMORY[0x21D449420](v15, 0xA1C409BE6959DLL);
  _Unwind_Resume(a1);
}

void sub_21764FD78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21764FD88(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);

  _Unwind_Resume(a1);
}

void sub_21764FDA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21764FDB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21764FF20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21764FF38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21764FF48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21764FF5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21764FF6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21764FF7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2176500EC(_Unwind_Exception *a1)
{
  int v5 = v4;

  _Unwind_Resume(a1);
}

void sub_217650378(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ik::PixelBufferScopeLock::~PixelBufferScopeLock((ik::PixelBufferScopeLock *)va);
  _Unwind_Resume(a1);
}

void sub_2176504FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21765050C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21765051C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21765052C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21765053C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217650A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

void sub_217650C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t std::pair<std::string const,ik::Tensor>::pair[abi:ne180100]<char const*,ik::PixelBufferTensor &,0>(uint64_t a1, const char **a2, uint64_t a3)
{
  int v5 = *a2;
  size_t v6 = strlen(*a2);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    __n128 v8 = operator new(v9 + 1);
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v10 | 0x8000000000000000;
    *(void *)a1 = v8;
    goto LABEL_8;
  }
  *(unsigned char *)(a1 + 23) = v6;
  __n128 v8 = (void *)a1;
  if (v6) {
LABEL_8:
  }
    memmove(v8, v5, v7);
  *((unsigned char *)v8 + v7) = 0;
  int v11 = *(_DWORD *)(a3 + 8);
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = &unk_26C78E630;
  *(_DWORD *)(a1 + 32) = v11;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  unint64_t v13 = *(unsigned char **)(a3 + 16);
  float32x4_t v12 = *(unsigned char **)(a3 + 24);
  int64_t v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = (char *)operator new(v12 - v13);
    *(void *)(a1 + 40) = v15;
    *(void *)(a1 + 48) = v15;
    unint64_t v16 = &v15[8 * (v14 >> 3)];
    *(void *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(void *)(a1 + 48) = v16;
  }
  uint64_t v17 = *(void *)(a3 + 48);
  *(void *)(a1 + 64) = *(void *)(a3 + 40);
  *(void *)(a1 + 72) = v17;
  if (v17) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

void sub_217650E08(_Unwind_Exception *a1)
{
  long long v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  std::pair<std::string const,ik::EspressoTensor>::pair[abi:ne180100]((void **)v1);
  _Unwind_Resume(a1);
}

void ik::core::GetOutput(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = (void *)(a2 + 192);
  if (std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::find<std::string>((void *)(a2 + 192), a3))
  {
    size_t v6 = std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::find<std::string>(v5, a3);
    if (!v6) {
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
    size_t v7 = v6;
    *(void *)a1 = &unk_26C78E630;
    int v8 = *((_DWORD *)v6 + 12);
    *(void *)(a1 + 16) = 0;
    *(_DWORD *)(a1 + 8) = v8;
    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 32) = 0;
    uint64_t v10 = (unsigned char *)v6[7];
    uint64_t v9 = (unsigned char *)v6[8];
    int64_t v11 = v9 - v10;
    if (v9 != v10)
    {
      if (v11 < 0) {
        std::vector<long long>::__throw_length_error[abi:ne180100]();
      }
      float32x4_t v12 = (char *)operator new(v9 - v10);
      *(void *)(a1 + 16) = v12;
      *(void *)(a1 + 24) = v12;
      unint64_t v13 = &v12[8 * (v11 >> 3)];
      *(void *)(a1 + 32) = v13;
      memcpy(v12, v10, v11);
      *(void *)(a1 + 24) = v13;
    }
    *(void *)(a1 + 40) = v7[10];
    uint64_t v14 = v7[11];
    *(void *)(a1 + 48) = v14;
    if (v14) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 8), 1uLL, memory_order_relaxed);
    }
    *(void *)a1 = &unk_26C78E4D0;
  }
  else
  {
    int v22 = espresso_network_bind_buffer();
    char v21 = 21;
    strcpy(__p, "Binding output buffer");
    ik::VerifyEspressoStatus(&v22, (uint64_t *)__p);
    if (v21 < 0) {
      operator delete(*(void **)__p);
    }
    *(_WORD *)std::string __p = 0;
    ik::EspressoTensor::EspressoTensor(a1, (uint64_t)v23, __p);
    *(void *)std::string __p = a3;
    uint64_t v15 = std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v5, a3, (uint64_t)&std::piecewise_construct, (long long **)__p);
    unint64_t v16 = v15;
    *((_DWORD *)v15 + 12) = *(_DWORD *)(a1 + 8);
    if (v15 + 5 != (uint64_t *)a1) {
      std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(v15 + 7, *(char **)(a1 + 16), *(char **)(a1 + 24), (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3);
    }
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 48);
    if (v17) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
    }
    double v19 = (std::__shared_weak_count *)v16[11];
    v16[10] = v18;
    v16[11] = v17;
    if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
}

{
  void *v5;
  uint64_t *v6;
  uint64_t *v7;
  int v8;
  unsigned char *v9;
  unsigned char *v10;
  int64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  char __p[22];
  char v21;
  int v22;
  char v23[168];

  int v5 = (void *)(a2 + 192);
  if (std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::find<std::string>((void *)(a2 + 192), a3))
  {
    size_t v6 = std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::find<std::string>(v5, a3);
    if (!v6) {
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
    size_t v7 = v6;
    *(void *)a1 = &unk_26C78E630;
    int v8 = *((_DWORD *)v6 + 12);
    *(void *)(a1 + 16) = 0;
    *(_DWORD *)(a1 + 8) = v8;
    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 32) = 0;
    uint64_t v10 = (unsigned char *)v6[7];
    uint64_t v9 = (unsigned char *)v6[8];
    int64_t v11 = v9 - v10;
    if (v9 != v10)
    {
      if (v11 < 0) {
        std::vector<long long>::__throw_length_error[abi:ne180100]();
      }
      float32x4_t v12 = (char *)operator new(v9 - v10);
      *(void *)(a1 + 16) = v12;
      *(void *)(a1 + 24) = v12;
      unint64_t v13 = &v12[8 * (v11 >> 3)];
      *(void *)(a1 + 32) = v13;
      memcpy(v12, v10, v11);
      *(void *)(a1 + 24) = v13;
    }
    *(void *)(a1 + 40) = v7[10];
    uint64_t v14 = v7[11];
    *(void *)(a1 + 48) = v14;
    if (v14) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 8), 1uLL, memory_order_relaxed);
    }
    *(void *)a1 = &unk_26C78E4D0;
  }
  else
  {
    int v22 = espresso_network_bind_buffer();
    char v21 = 21;
    strcpy(__p, "Binding output buffer");
    ik::VerifyEspressoStatus(&v22, (uint64_t *)__p);
    if (v21 < 0) {
      operator delete(*(void **)__p);
    }
    *(_WORD *)std::string __p = 0;
    ik::EspressoTensor::EspressoTensor(a1, (uint64_t)v23, __p);
    *(void *)std::string __p = a3;
    uint64_t v15 = std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v5, a3, (uint64_t)&std::piecewise_construct, (long long **)__p);
    unint64_t v16 = v15;
    *((_DWORD *)v15 + 12) = *(_DWORD *)(a1 + 8);
    if (v15 + 5 != (uint64_t *)a1) {
      std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(v15 + 7, *(char **)(a1 + 16), *(char **)(a1 + 24), (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3);
    }
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 48);
    if (v17) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
    }
    double v19 = (std::__shared_weak_count *)v16[11];
    v16[10] = v18;
    v16[11] = v17;
    if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
}

void sub_217651094(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_217651224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v35 - 41) < 0)
  {
    operator delete(*(void **)(v35 - 64));
    if ((a33 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a14 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((a33 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a28);
  if ((a14 & 0x80000000) == 0)
  {
LABEL_4:
    if ((a26 & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  operator delete(a9);
  if ((a26 & 0x80000000) == 0)
  {
LABEL_5:
    if (a20 < 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  operator delete(a21);
  if (a20 < 0)
  {
LABEL_6:
    operator delete(__p);
    if ((v34 & 1) == 0) {
LABEL_14:
    }
      _Unwind_Resume(a1);
LABEL_13:
    __cxa_free_exception(v33);
    goto LABEL_14;
  }
LABEL_12:
  if (!v34) {
    goto LABEL_14;
  }
  goto LABEL_13;
}

uint64_t ___ZN2ikL28IsAppleNeuralEngineAvailableEv_block_invoke_1()
{
  uint64_t result = MGGetBoolAnswer();
  _MergedGlobals_3 = result;
  return result;
}

void std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__assign_unique<std::pair<std::string const,ik::Tensor> const*>(void *a1, std::string *__str, std::string *a3)
{
  long long v4 = __str;
  uint64_t v6 = a1[1];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
      *(void *)(*a1 + 8 * i) = 0;
    uint64_t v8 = a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (!v8 || __str == a3)
    {
      uint64_t v10 = (void *)v8;
    }
    else
    {
      do
      {
        std::string::operator=((std::string *)(v8 + 16), v4);
        *(_DWORD *)(v8 + 48) = v4[1].__r_.__value_.__r.__words[1];
        if ((std::string *)(v8 + 16) != v4) {
          std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>((void *)(v8 + 56), (char *)v4[1].__r_.__value_.__r.__words[2], v4[2].__r_.__value_.__l.__data_, (uint64_t)(v4[2].__r_.__value_.__r.__words[0] - v4[1].__r_.__value_.__r.__words[2]) >> 3);
        }
        std::string::size_type v12 = v4[2].__r_.__value_.__r.__words[2];
        std::string::pointer data = v4[3].__r_.__value_.__l.__data_;
        if (data) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)data + 1, 1uLL, memory_order_relaxed);
        }
        unint64_t v13 = *(std::__shared_weak_count **)(v8 + 88);
        *(void *)(v8 + 80) = v12;
        *(void *)(v8 + 88) = data;
        if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
        uint64_t v10 = *(void **)v8;
        std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__node_insert_unique(a1, v8);
        long long v4 = (std::string *)((char *)v4 + 80);
        if (!v10) {
          break;
        }
        uint64_t v8 = (uint64_t)v10;
      }
      while (v4 != a3);
    }
    if (v10)
    {
      while (1)
      {
        uint64_t v14 = (void *)*v10;
        v10[5] = &unk_26C78E630;
        uint64_t v15 = (std::__shared_weak_count *)v10[11];
        if (v15)
        {
          if (!atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
            break;
          }
        }
        unint64_t v16 = (void *)v10[7];
        if (v16) {
          goto LABEL_25;
        }
LABEL_26:
        if (*((char *)v10 + 39) < 0) {
          operator delete((void *)v10[2]);
        }
        operator delete(v10);
        uint64_t v10 = v14;
        if (!v14) {
          goto LABEL_31;
        }
      }
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
      unint64_t v16 = (void *)v10[7];
      if (!v16) {
        goto LABEL_26;
      }
LABEL_25:
      v10[8] = v16;
      operator delete(v16);
      goto LABEL_26;
    }
  }
LABEL_31:
  while (v4 != a3)
  {
    std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,ik::Tensor> const&>((uint64_t)a1, (uint64_t)v4, (long long *)v4);
    long long v4 = (std::string *)((char *)v4 + 80);
  }
}

void sub_21765154C(void *a1)
{
  __cxa_begin_catch(a1);
  std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__deallocate_node(v1, v2);
  __cxa_rethrow();
}

void sub_217651568(_Unwind_Exception *a1)
{
}

uint64_t *std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__node_insert_unique(void *a1, uint64_t a2)
{
  long long v4 = (unsigned __int8 **)(a2 + 16);
  unint64_t v5 = *(unsigned __int8 *)(a2 + 39);
  unint64_t v6 = *(void *)(a2 + 24);
  if ((v5 & 0x80u) == 0) {
    size_t v7 = (uint64_t *)(a2 + 16);
  }
  else {
    size_t v7 = *(uint64_t **)(a2 + 16);
  }
  if ((v5 & 0x80u) == 0) {
    unint64_t v8 = v5;
  }
  else {
    unint64_t v8 = v6;
  }
  unint64_t v9 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v16, v7, v8);
  *(void *)(a2 + 8) = v9;
  uint64_t result = std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__node_insert_unique_prepare[abi:ne180100]((uint64_t)a1, v9, v4);
  if (!result)
  {
    int8x8_t v11 = (int8x8_t)a1[1];
    unint64_t v12 = *(void *)(a2 + 8);
    uint8x8_t v13 = (uint8x8_t)vcnt_s8(v11);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      if (v12 >= *(void *)&v11) {
        v12 %= *(void *)&v11;
      }
    }
    else
    {
      v12 &= *(void *)&v11 - 1;
    }
    uint64_t v14 = *(void **)(*a1 + 8 * v12);
    if (v14)
    {
      *(void *)a2 = *v14;
    }
    else
    {
      *(void *)a2 = a1[2];
      a1[2] = a2;
      *(void *)(*a1 + 8 * v12) = a1 + 2;
      if (!*(void *)a2)
      {
LABEL_21:
        ++a1[3];
        return (uint64_t *)a2;
      }
      unint64_t v15 = *(void *)(*(void *)a2 + 8);
      if (v13.u32[0] > 1uLL)
      {
        if (v15 >= *(void *)&v11) {
          v15 %= *(void *)&v11;
        }
      }
      else
      {
        v15 &= *(void *)&v11 - 1;
      }
      uint64_t v14 = (void *)(*a1 + 8 * v15);
    }
    void *v14 = a2;
    goto LABEL_21;
  }
  return result;
}

void std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__deallocate_node(int a1, void *__p)
{
  if (__p)
  {
    int v2 = __p;
    while (1)
    {
      unint64_t v3 = (void *)*v2;
      v2[5] = &unk_26C78E630;
      long long v4 = (std::__shared_weak_count *)v2[11];
      if (v4)
      {
        if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
          break;
        }
      }
      unint64_t v5 = (void *)v2[7];
      if (v5) {
        goto LABEL_7;
      }
LABEL_8:
      if (*((char *)v2 + 39) < 0) {
        operator delete((void *)v2[2]);
      }
      operator delete(v2);
      int v2 = v3;
      if (!v3) {
        return;
      }
    }
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    unint64_t v5 = (void *)v2[7];
    if (!v5) {
      goto LABEL_8;
    }
LABEL_7:
    v2[8] = v5;
    operator delete(v5);
    goto LABEL_8;
  }
}

uint64_t *std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__node_insert_unique_prepare[abi:ne180100](uint64_t a1, unint64_t a2, unsigned __int8 **a3)
{
  unint64_t v4 = *(void *)(a1 + 8);
  if (!v4) {
    goto LABEL_50;
  }
  uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)v4);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    if (v4 <= a2) {
      unint64_t v7 = a2 % v4;
    }
    else {
      unint64_t v7 = a2;
    }
    unint64_t v8 = *(uint64_t ***)(*(void *)a1 + 8 * v7);
    if (!v8) {
      goto LABEL_50;
    }
  }
  else
  {
    unint64_t v7 = (v4 - 1) & a2;
    unint64_t v8 = *(uint64_t ***)(*(void *)a1 + 8 * v7);
    if (!v8) {
      goto LABEL_50;
    }
  }
  unint64_t v9 = *v8;
  if (*v8)
  {
    char v10 = *((unsigned char *)a3 + 23);
    if (v10 >= 0) {
      int8x8_t v11 = (unsigned __int8 *)*((unsigned __int8 *)a3 + 23);
    }
    else {
      int8x8_t v11 = a3[1];
    }
    if (v10 >= 0) {
      unint64_t v12 = (unsigned __int8 *)a3;
    }
    else {
      unint64_t v12 = *a3;
    }
    if (v6.u32[0] < 2uLL)
    {
      while (1)
      {
        uint64_t v17 = v9[1];
        if (v17 == a2)
        {
          uint64_t v18 = *((unsigned __int8 *)v9 + 39);
          if ((v18 & 0x80u) == 0) {
            double v19 = (unsigned __int8 *)*((unsigned __int8 *)v9 + 39);
          }
          else {
            double v19 = (unsigned __int8 *)v9[3];
          }
          if (v19 == v11)
          {
            if ((v18 & 0x80) != 0)
            {
              if (!memcmp((const void *)v9[2], v12, v9[3])) {
                return v9;
              }
            }
            else
            {
              if (!*((unsigned char *)v9 + 39)) {
                return v9;
              }
              uint64_t v20 = 0;
              while (*((unsigned __int8 *)v9 + v20 + 16) == v12[v20])
              {
                if (v18 == ++v20) {
                  return v9;
                }
              }
            }
          }
        }
        else if ((v17 & (v4 - 1)) != v7)
        {
          goto LABEL_50;
        }
        unint64_t v9 = (uint64_t *)*v9;
        if (!v9) {
          goto LABEL_50;
        }
      }
    }
    do
    {
      unint64_t v13 = v9[1];
      if (v13 == a2)
      {
        uint64_t v14 = *((unsigned __int8 *)v9 + 39);
        if ((v14 & 0x80u) == 0) {
          unint64_t v15 = (unsigned __int8 *)*((unsigned __int8 *)v9 + 39);
        }
        else {
          unint64_t v15 = (unsigned __int8 *)v9[3];
        }
        if (v15 == v11)
        {
          if ((v14 & 0x80) != 0)
          {
            if (!memcmp((const void *)v9[2], v12, v9[3])) {
              return v9;
            }
          }
          else
          {
            if (!*((unsigned char *)v9 + 39)) {
              return v9;
            }
            uint64_t v16 = 0;
            while (*((unsigned __int8 *)v9 + v16 + 16) == v12[v16])
            {
              if (v14 == ++v16) {
                return v9;
              }
            }
          }
        }
      }
      else
      {
        if (v13 >= v4) {
          v13 %= v4;
        }
        if (v13 != v7) {
          break;
        }
      }
      unint64_t v9 = (uint64_t *)*v9;
    }
    while (v9);
  }
LABEL_50:
  float v21 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v22 = *(float *)(a1 + 32);
  if (v4 && (float)(v22 * (float)v4) >= v21) {
    return 0;
  }
  BOOL v23 = 1;
  if (v4 >= 3) {
    BOOL v23 = (v4 & (v4 - 1)) != 0;
  }
  unint64_t v24 = v23 | (2 * v4);
  unint64_t v25 = vcvtps_u32_f32(v21 / v22);
  if (v24 <= v25) {
    size_t prime = v25;
  }
  else {
    size_t prime = v24;
  }
  if (prime == 1)
  {
    size_t prime = 2;
  }
  else if ((prime & (prime - 1)) != 0)
  {
    size_t prime = std::__next_prime(prime);
    unint64_t v4 = *(void *)(a1 + 8);
  }
  if (prime > v4) {
    goto LABEL_74;
  }
  if (prime < v4)
  {
    size_t v27 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (v4 < 3 || (uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)v4), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
    {
      size_t v30 = std::__next_prime(v27);
      if (prime <= v30) {
        size_t prime = v30;
      }
      if (prime >= v4) {
        return 0;
      }
    }
    else
    {
      uint64_t v29 = 1 << -(char)__clz(v27 - 1);
      if (v27 >= 2) {
        size_t v27 = v29;
      }
      if (prime <= v27) {
        size_t prime = v27;
      }
      if (prime >= v4) {
        return 0;
      }
    }
LABEL_74:
    std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__do_rehash<true>(a1, prime);
  }
  return 0;
}

__n128 swap(void *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = *a1 + 36 * a2;
  int v4 = *(_DWORD *)(v3 + 32);
  long long v6 = *(_OWORD *)v3;
  __n128 result = *(__n128 *)(v3 + 16);
  uint64_t v7 = *a1 + 36 * a3;
  int v8 = *(_DWORD *)(v7 + 32);
  long long v9 = *(_OWORD *)(v7 + 16);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)v7;
  *(_OWORD *)(v3 + 16) = v9;
  *(_DWORD *)(v3 + 32) = v8;
  uint64_t v10 = *a1 + 36 * a3;
  *(_OWORD *)uint64_t v10 = v6;
  *(__n128 *)(v10 + 16) = result;
  *(_DWORD *)(v10 + 32) = v4;
  return result;
}

__n128 percolateUp(uint64_t *a1, unsigned int a2)
{
  if (a2 >= 2)
  {
    uint64_t v28 = v2;
    uint64_t v29 = v3;
    unint64_t v5 = a2;
    do
    {
      long long v6 = (int (*)(_OWORD *, _OWORD *))a1[2];
      uint64_t v7 = *a1;
      uint64_t v8 = *a1 + 36 * v5;
      int v9 = *(_DWORD *)(v8 + 32);
      long long v10 = *(_OWORD *)(v8 + 16);
      v26[0] = *(_OWORD *)v8;
      v26[1] = v10;
      int v27 = v9;
      unint64_t v11 = v5 >> 1;
      unint64_t v12 = (long long *)(v7 + 36 * (v5 >> 1));
      long long v14 = *v12;
      long long v13 = v12[1];
      int v25 = *((_DWORD *)v12 + 8);
      v24[0] = v14;
      v24[1] = v13;
      if (v6(v26, v24) < 1) {
        break;
      }
      uint64_t v16 = *a1 + 36 * v5;
      int v17 = *(_DWORD *)(v16 + 32);
      long long v18 = *(_OWORD *)v16;
      __n128 result = *(__n128 *)(v16 + 16);
      uint64_t v19 = *a1 + 36 * v11;
      int v20 = *(_DWORD *)(v19 + 32);
      long long v21 = *(_OWORD *)(v19 + 16);
      *(_OWORD *)uint64_t v16 = *(_OWORD *)v19;
      *(_OWORD *)(v16 + 16) = v21;
      *(_DWORD *)(v16 + 32) = v20;
      uint64_t v22 = *a1 + 36 * v11;
      *(_OWORD *)uint64_t v22 = v18;
      *(__n128 *)(v22 + 16) = result;
      *(_DWORD *)(v22 + 32) = v17;
      BOOL v23 = v5 > 3;
      v5 >>= 1;
    }
    while (v23);
  }
  return result;
}

__n128 percolateDown(uint64_t *a1, unsigned int a2)
{
  unsigned int v2 = 2 * a2;
  unsigned int v3 = *((_DWORD *)a1 + 2);
  if (2 * a2 <= v3)
  {
    unsigned int v4 = a2;
    do
    {
      if (v2 >= v3)
      {
        unsigned int v8 = v2;
      }
      else
      {
        long long v6 = (int (*)(_OWORD *, _OWORD *))a1[2];
        uint64_t v7 = *a1;
        unsigned int v8 = v2 | 1;
        uint64_t v9 = *a1 + 36 * (v2 | 1);
        int v10 = *(_DWORD *)(v9 + 32);
        long long v11 = *(_OWORD *)(v9 + 16);
        v38[0] = *(_OWORD *)v9;
        v38[1] = v11;
        int v39 = v10;
        unint64_t v12 = (long long *)(v7 + 36 * v2);
        long long v14 = *v12;
        long long v13 = v12[1];
        int v37 = *((_DWORD *)v12 + 8);
        v36[0] = v14;
        v36[1] = v13;
        if (v6(v38, v36) <= 0) {
          unsigned int v8 = v2;
        }
      }
      unint64_t v15 = (unsigned int (*)(_OWORD *, _OWORD *))a1[2];
      uint64_t v16 = *a1;
      uint64_t v17 = *a1 + 36 * v4;
      int v18 = *(_DWORD *)(v17 + 32);
      long long v19 = *(_OWORD *)(v17 + 16);
      v34[0] = *(_OWORD *)v17;
      v34[1] = v19;
      int v35 = v18;
      int v20 = (long long *)(v16 + 36 * v8);
      long long v22 = *v20;
      long long v21 = v20[1];
      int v33 = *((_DWORD *)v20 + 8);
      v32[0] = v22;
      v32[1] = v21;
      if (v15(v34, v32)) {
        break;
      }
      uint64_t v24 = *a1 + 36 * v4;
      int v25 = *(_DWORD *)(v24 + 32);
      long long v26 = *(_OWORD *)v24;
      __n128 result = *(__n128 *)(v24 + 16);
      uint64_t v27 = 36 * v8;
      uint64_t v28 = *a1 + v27;
      int v29 = *(_DWORD *)(v28 + 32);
      long long v30 = *(_OWORD *)(v28 + 16);
      *(_OWORD *)uint64_t v24 = *(_OWORD *)v28;
      *(_OWORD *)(v24 + 16) = v30;
      *(_DWORD *)(v24 + 32) = v29;
      uint64_t v31 = *a1 + v27;
      *(_OWORD *)uint64_t v31 = v26;
      *(__n128 *)(v31 + 16) = result;
      *(_DWORD *)(v31 + 32) = v25;
      unsigned int v2 = 2 * v8;
      unsigned int v3 = *((_DWORD *)a1 + 2);
      unsigned int v4 = v8;
    }
    while (2 * v8 <= v3);
  }
  return result;
}

uint64_t initHeap(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(void *)__n128 result = a2;
  *(_DWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 12) = a3;
  *(void *)(result + 16) = a4;
  *(_DWORD *)(result + 24) = 305419896;
  return result;
}

__n128 addToHeap(uint64_t *a1, uint64_t a2)
{
  if (*((_DWORD *)a1 + 6) != 305419896) {
    addToHeap();
  }
  int v4 = *((_DWORD *)a1 + 2);
  if (v4 == *((_DWORD *)a1 + 3) - 1)
  {
    unint64_t v5 = (unsigned int (*)(_OWORD *, _OWORD *))a1[2];
    uint64_t v6 = *a1;
    long long v7 = *(_OWORD *)(*a1 + 52);
    v34[0] = *(_OWORD *)(*a1 + 36);
    v34[1] = v7;
    int v35 = *(_DWORD *)(v6 + 68);
    long long v8 = *(_OWORD *)(a2 + 16);
    v32[0] = *(_OWORD *)a2;
    v32[1] = v8;
    int v33 = *(_DWORD *)(a2 + 32);
    if (!v5(v34, v32)) {
      return result;
    }
    removeFromHeap(a1, (uint64_t)v38);
    int v4 = *((_DWORD *)a1 + 2);
  }
  uint64_t v10 = *a1;
  unsigned int v11 = v4 + 1;
  *((_DWORD *)a1 + 2) = v11;
  uint64_t v12 = v10 + 36 * v11;
  __n128 result = *(__n128 *)a2;
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_DWORD *)(v12 + 32) = *(_DWORD *)(a2 + 32);
  *(__n128 *)uint64_t v12 = result;
  *(_OWORD *)(v12 + 16) = v13;
  unint64_t v14 = *((unsigned int *)a1 + 2);
  if (v14 >= 2)
  {
    do
    {
      unint64_t v15 = (int (*)(_OWORD *, _OWORD *))a1[2];
      uint64_t v16 = *a1;
      uint64_t v17 = *a1 + 36 * v14;
      int v18 = *(_DWORD *)(v17 + 32);
      long long v19 = *(_OWORD *)(v17 + 16);
      v38[0] = *(_OWORD *)v17;
      v38[1] = v19;
      int v39 = v18;
      unint64_t v20 = v14 >> 1;
      unint64_t v21 = v16 + 36 * (v14 >> 1);
      long long v23 = *(_OWORD *)v21;
      long long v22 = *(_OWORD *)(v21 + 16);
      int v37 = *(_DWORD *)(v21 + 32);
      v36[0] = v23;
      v36[1] = v22;
      if (v15(v38, v36) < 1) {
        break;
      }
      uint64_t v24 = *a1 + 36 * v14;
      int v25 = *(_DWORD *)(v24 + 32);
      long long v26 = *(_OWORD *)v24;
      __n128 result = *(__n128 *)(v24 + 16);
      uint64_t v27 = *a1 + 36 * v20;
      int v28 = *(_DWORD *)(v27 + 32);
      long long v29 = *(_OWORD *)(v27 + 16);
      *(_OWORD *)uint64_t v24 = *(_OWORD *)v27;
      *(_OWORD *)(v24 + 16) = v29;
      *(_DWORD *)(v24 + 32) = v28;
      uint64_t v30 = *a1 + 36 * v20;
      *(_OWORD *)uint64_t v30 = v26;
      *(__n128 *)(v30 + 16) = result;
      *(_DWORD *)(v30 + 32) = v25;
      BOOL v31 = v14 > 3;
      v14 >>= 1;
    }
    while (v31);
  }
  return result;
}

uint64_t removeFromHeap(uint64_t *a1, uint64_t a2)
{
  if (*((_DWORD *)a1 + 6) != 305419896) {
    removeFromHeap();
  }
  if (!*((_DWORD *)a1 + 2)) {
    return 4294967290;
  }
  long long v3 = *(_OWORD *)(*a1 + 36);
  long long v4 = *(_OWORD *)(*a1 + 52);
  *(_DWORD *)(a2 + 32) = *(_DWORD *)(*a1 + 68);
  *(_OWORD *)a2 = v3;
  *(_OWORD *)(a2 + 16) = v4;
  uint64_t v5 = *((unsigned int *)a1 + 2);
  *((_DWORD *)a1 + 2) = v5 - 1;
  uint64_t v6 = *a1;
  int v7 = *(_DWORD *)(*a1 + 68);
  long long v8 = *(_OWORD *)(*a1 + 52);
  long long v9 = *(_OWORD *)(*a1 + 36);
  v5 *= 36;
  uint64_t v10 = *a1 + v5;
  int v11 = *(_DWORD *)(v10 + 32);
  long long v12 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)(v6 + 36) = *(_OWORD *)v10;
  *(_OWORD *)(v6 + 52) = v12;
  *(_DWORD *)(v6 + 68) = v11;
  uint64_t v13 = *a1 + v5;
  *(_OWORD *)uint64_t v13 = v9;
  *(_OWORD *)(v13 + 16) = v8;
  *(_DWORD *)(v13 + 32) = v7;
  unsigned int v14 = *((_DWORD *)a1 + 2);
  if (v14 >= 2)
  {
    unsigned int v15 = 1;
    unsigned int v16 = 2;
    do
    {
      if (v16 >= v14)
      {
        unsigned int v19 = v16;
      }
      else
      {
        uint64_t v17 = (int (*)(_OWORD *, _OWORD *))a1[2];
        uint64_t v18 = *a1;
        unsigned int v19 = v16 | 1;
        uint64_t v20 = *a1 + 36 * (v16 | 1);
        int v21 = *(_DWORD *)(v20 + 32);
        long long v22 = *(_OWORD *)(v20 + 16);
        v50[0] = *(_OWORD *)v20;
        v50[1] = v22;
        int v51 = v21;
        long long v23 = (long long *)(v18 + 36 * v16);
        long long v25 = *v23;
        long long v24 = v23[1];
        int v49 = *((_DWORD *)v23 + 8);
        v48[0] = v25;
        v48[1] = v24;
        if (v17(v50, v48) <= 0) {
          unsigned int v19 = v16;
        }
      }
      long long v26 = (unsigned int (*)(_OWORD *, _OWORD *))a1[2];
      uint64_t v27 = *a1;
      uint64_t v28 = *a1 + 36 * v15;
      int v29 = *(_DWORD *)(v28 + 32);
      long long v30 = *(_OWORD *)(v28 + 16);
      v46[0] = *(_OWORD *)v28;
      v46[1] = v30;
      int v47 = v29;
      BOOL v31 = (long long *)(v27 + 36 * v19);
      long long v33 = *v31;
      long long v32 = v31[1];
      int v45 = *((_DWORD *)v31 + 8);
      v44[0] = v33;
      v44[1] = v32;
      if (v26(v46, v44)) {
        break;
      }
      uint64_t v34 = *a1 + 36 * v15;
      int v35 = *(_DWORD *)(v34 + 32);
      long long v37 = *(_OWORD *)v34;
      long long v36 = *(_OWORD *)(v34 + 16);
      uint64_t v38 = 36 * v19;
      uint64_t v39 = *a1 + v38;
      int v40 = *(_DWORD *)(v39 + 32);
      long long v41 = *(_OWORD *)(v39 + 16);
      *(_OWORD *)uint64_t v34 = *(_OWORD *)v39;
      *(_OWORD *)(v34 + 16) = v41;
      *(_DWORD *)(v34 + 32) = v40;
      uint64_t v42 = *a1 + v38;
      *(_OWORD *)uint64_t v42 = v37;
      *(_OWORD *)(v42 + 16) = v36;
      *(_DWORD *)(v42 + 32) = v35;
      unsigned int v16 = 2 * v19;
      unsigned int v14 = *((_DWORD *)a1 + 2);
      unsigned int v15 = v19;
    }
    while (2 * v19 <= v14);
  }
  return 0;
}

void sub_21765216C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;
  MEMORY[0x21D449420](v4, 0x1020C40F15AEE48);
  MEMORY[0x21D449420](v2, 0x20C4093837F09);

  _Unwind_Resume(a1);
}

void sub_2176521B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217652508(_Unwind_Exception *a1)
{
  ik::PixelBufferScopeLock::~PixelBufferScopeLock((ik::PixelBufferScopeLock *)(v1 - 176));
  ik::PixelBufferScopeLock::~PixelBufferScopeLock((ik::PixelBufferScopeLock *)(v1 - 152));
  _Unwind_Resume(a1);
}

void sub_21765283C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217652874(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2176528E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)FTVTScaler;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_217652CEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217652D00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217652D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217652D20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ik::core::msr::MSR::Resample(unint64_t *a1, __CVBuffer *a2, __CVBuffer *a3, uint64_t a4)
{
  if (*(unsigned char *)(a4 + 32))
  {
    double Width = *(double *)(a4 + 16);
    double Height = *(double *)(a4 + 24);
    float64x2_t v65 = *(float64x2_t *)a4;
    v83.CGPoint origin = *(CGPoint *)a4;
    v83.size.width = Width;
    v83.size.height = Height;
    if (*(unsigned char *)(a4 + 72))
    {
LABEL_3:
      double v11 = *(double *)(a4 + 40);
      double v10 = *(double *)(a4 + 48);
      double v12 = *(double *)(a4 + 56);
      double v13 = *(double *)(a4 + 64);
      goto LABEL_6;
    }
  }
  else
  {
    double Width = (double)CVPixelBufferGetWidth(a2);
    double Height = (double)CVPixelBufferGetHeight(a2);
    float64x2_t v65 = 0u;
    v83.CGPoint origin = 0u;
    v83.size.width = Width;
    v83.size.height = Height;
    if (*(unsigned char *)(a4 + 72)) {
      goto LABEL_3;
    }
  }
  double v12 = (double)CVPixelBufferGetWidth(a3);
  double v13 = (double)CVPixelBufferGetHeight(a3);
  double v10 = 0.0;
  double v11 = 0.0;
LABEL_6:
  *(double *)&long long v84 = v11;
  *((double *)&v84 + 1) = v10;
  *(double *)&long long v85 = v12;
  *((double *)&v85 + 1) = v13;
  float v14 = v12 / Width;
  float v15 = v13 / Height;
  if (v15 >= v14) {
    float v16 = v12 / Width;
  }
  else {
    float v16 = v13 / Height;
  }
  if (v16 < 0.25 || (v14 >= v15 ? (float v17 = v12 / Width) : (float v17 = v13 / Height), v17 > 4.0))
  {
    if (!*(unsigned char *)a1)
    {
      __cxa_allocate_exception(0x10uLL);
      ik::core::msr::DescribeRect((ik::core::msr *)&v81, &v83);
    }
    double v18 = fmax(fmin(v15, 4.0), 0.25);
    double v19 = ceil(Height * v18);
    double v20 = floor(Height * v18);
    if (v18 >= 1.0) {
      CGFloat v21 = v20;
    }
    else {
      CGFloat v21 = v19;
    }
    double v22 = fmax(fmin(v14, 4.0), 0.25);
    double v23 = ceil(Width * v22);
    double v24 = floor(Width * v22);
    if (v22 >= 1.0) {
      CGFloat v25 = v24;
    }
    else {
      CGFloat v25 = v23;
    }
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a2);
    v86.width = v25;
    v86.height = v21;
    ik::core::msr::MSR::GetIntermediateTensor((ik::core::msr::MSR *)a1, v86, PixelFormatType, a1[1], (uint64_t)&v75);
    uint64_t v27 = *(__CVBuffer **)(v79 + 8);
    v82.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26C78E610;
    *(_OWORD *)&v82.__r_.__value_.__r.__words[1] = (unint64_t)v27;
    if (CVPixelBufferLockBaseAddress(v27, 0))
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Failed to lock pixel buffer.");
    }
    else
    {
      v82.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26C78E538;
      uint64_t v28 = *(void *)(v79 + 8);
      CGSize v29 = *(CGSize *)(a4 + 16);
      valuePtr.CGPoint origin = *(CGPoint *)a4;
      valuePtr.CGSize size = v29;
      v67[0] = *(unsigned char *)(a4 + 32);
      v67[8] = 0;
      char v68 = 0;
      LOBYTE(v69) = 0;
      char v70 = 0;
      char v71 = 0;
      uint64_t v72 = *(void *)(a4 + 96);
      char v73 = 0;
      char v74 = 0;
      ik::core::msr::MSR::Resample(a1, a2, v28, &valuePtr);
      long long v30 = *(_OWORD *)(a4 + 56);
      *(_OWORD *)&v67[8] = *(_OWORD *)(a4 + 40);
      LOBYTE(valuePtr.origin.x) = 0;
      v67[0] = 0;
      *(_OWORD *)&v67[24] = v30;
      char v68 = *(unsigned char *)(a4 + 72);
      uint64_t v69 = *(void *)(a4 + 80);
      char v70 = *(unsigned char *)(a4 + 88);
      char v71 = *(unsigned char *)(a4 + 92);
      uint64_t v72 = *(void *)(a4 + 96);
      char v73 = 0;
      char v74 = 0;
      ik::core::msr::MSR::Resample(a1, v28, a3, &valuePtr);
      v82.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26C78E610;
      if (!CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)v82.__r_.__value_.__l.__size_, v82.__r_.__value_.__r.__words[2]))
      {
        v75.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26C78E630;
        BOOL v31 = v80;
        if (v80 && !atomic_fetch_add(&v80->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
          std::__shared_weak_count::__release_weak(v31);
        }
        if (v75.__r_.__value_.__r.__words[2])
        {
          unint64_t v76 = v75.__r_.__value_.__r.__words[2];
          operator delete((void *)v75.__r_.__value_.__r.__words[2]);
        }
        return;
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
    }
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (!CVPixelBufferGetIOSurface(a2) || !CVPixelBufferGetIOSurface(a3))
  {
    uint64_t v63 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v63, "Pixel buffer is not backed by an IOSurface.");
    goto LABEL_82;
  }
  if (IOSurfaceGetCompressionTypeOfPlane())
  {
    CGFloat v32 = (double)CVPixelBufferGetWidth(a3);
    v87.size.height = (double)CVPixelBufferGetHeight(a3);
    v87.origin.x = 0.0;
    v87.origin.y = 0.0;
    v87.size.width = v32;
    v88.origin.x = v11;
    v88.origin.y = v10;
    v88.size.width = v12;
    v88.size.height = v13;
    if (!CGRectEqualToRect(v87, v88))
    {
      uint64_t v63 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v63, "Destination ROI must be the entire bounds for compressed pixel formats.");
LABEL_82:
      __cxa_throw(v63, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  v75.__r_.__value_.__r.__words[2] = vcvtd_n_u64_f64(Width, 0x10uLL);
  unint64_t v76 = vcvtd_n_u64_f64(Height, 0x10uLL);
  unsigned int v77 = v11;
  unsigned int v78 = v10;
  *(uint64x2_t *)&v75.__r_.__value_.__l.__data_ = vcvtq_n_u64_f64(v65, 0x10uLL);
  LODWORD(v79) = v12;
  HIDWORD(v79) = v13;
  std::string v82 = *(std::string *)byte_26C78E900;
  CFAllocatorRef v33 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v81.__r_.__value_.__r.__words[0] = (std::string::size_type)Mutable;
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F4B278], (const void *)*MEMORY[0x263EFFB38]);
  if (!*(unsigned char *)(a4 + 88)) {
    goto LABEL_43;
  }
  int v35 = 2 * *(unsigned __int8 *)(a4 + 80);
  LODWORD(valuePtr.origin.x) = v35;
  if (*(unsigned char *)(a4 + 81))
  {
    v35 |= 1u;
    LODWORD(valuePtr.origin.x) = v35;
  }
  int v36 = *(_DWORD *)(a4 + 84);
  switch(v36)
  {
    case 3:
      int v37 = v35 ^ 7;
      goto LABEL_41;
    case 2:
      int v37 = v35 ^ 3;
      goto LABEL_41;
    case 1:
      int v37 = v35 ^ 4;
LABEL_41:
      LODWORD(valuePtr.origin.x) = v37;
      break;
  }
  CFNumberRef v38 = CFNumberCreate(v33, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F4B270], v38);
  CFRelease(v38);
LABEL_43:
  if (*(unsigned char *)(a4 + 144))
  {
    if (!*(void *)(a4 + 104))
    {
      long long v64 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v64, "Output histogram pointer is null.");
      __cxa_throw(v64, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    LODWORD(valuePtr.origin.x) = 1;
    CFNumberRef v39 = CFNumberCreate(v33, kCFNumberSInt32Type, &valuePtr);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F4B230], v39);
    CFRelease(v39);
    CFNumberRef v40 = CFNumberCreate(v33, kCFNumberCGFloatType, (const void *)(a4 + 112));
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F4B240], v40);
    CFRelease(v40);
    CFNumberRef v41 = CFNumberCreate(v33, kCFNumberCGFloatType, (const void *)(a4 + 120));
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F4B248], v41);
    CFRelease(v41);
    CFNumberRef v42 = CFNumberCreate(v33, kCFNumberCGFloatType, (const void *)(a4 + 128));
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F4B250], v42);
    CFRelease(v42);
    CFNumberRef v43 = CFNumberCreate(v33, kCFNumberCGFloatType, (const void *)(a4 + 136));
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F4B238], v43);
    CFRelease(v43);
  }
  *(void *)&valuePtr.origin.x = operator new(0x28uLL);
  *(_OWORD *)&valuePtr.origin.y = xmmword_217667760;
  strcpy(*(char **)&valuePtr.origin.x, "IOSurfaceAcceleratorTransformSurface");
  int v44 = IOSurfaceAcceleratorTransformSurface();
  ik::core::msr::Ensure<0,int>((uint64_t)&valuePtr, v44);
  if (SHIBYTE(valuePtr.size.width) < 0)
  {
    operator delete(*(void **)&valuePtr.origin.x);
    if (!*(unsigned char *)(a4 + 144)) {
      goto LABEL_51;
    }
  }
  else if (!*(unsigned char *)(a4 + 144))
  {
    goto LABEL_51;
  }
  *(void *)&valuePtr.origin.x = operator new(0x28uLL);
  *(_OWORD *)&valuePtr.origin.y = xmmword_217667770;
  strcpy(*(char **)&valuePtr.origin.x, "IOSurfaceAcceleratorGetHistogram");
  int Histogram = IOSurfaceAcceleratorGetHistogram();
  ik::core::msr::Ensure<0,int>((uint64_t)&valuePtr, Histogram);
  if (SHIBYTE(valuePtr.size.width) < 0)
  {
    operator delete(*(void **)&valuePtr.origin.x);
    uint64_t v46 = *(CGRect ***)(a4 + 96);
    if (v46) {
      goto LABEL_52;
    }
    goto LABEL_72;
  }
LABEL_51:
  uint64_t v46 = *(CGRect ***)(a4 + 96);
  if (v46)
  {
LABEL_52:
    CGRect valuePtr = v83;
    *(_OWORD *)uint64_t v67 = v84;
    *(_OWORD *)&v67[16] = v85;
    char v48 = v46[1];
    unint64_t v47 = (unint64_t)v46[2];
    if ((unint64_t)v48 >= v47)
    {
      int v50 = *v46;
      uint64_t v51 = ((char *)v48 - (char *)*v46) >> 6;
      unint64_t v52 = v51 + 1;
      if ((unint64_t)(v51 + 1) >> 58) {
        std::vector<long long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v53 = v47 - (void)v50;
      if (v53 >> 5 > v52) {
        unint64_t v52 = v53 >> 5;
      }
      if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFC0) {
        unint64_t v54 = 0x3FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v54 = v52;
      }
      if (v54)
      {
        if (v54 >> 58) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        long long v55 = (char *)operator new(v54 << 6);
      }
      else
      {
        long long v55 = 0;
      }
      long long v56 = (CGRect *)&v55[64 * v51];
      CGSize size = valuePtr.size;
      v56->CGPoint origin = valuePtr.origin;
      v56->CGSize size = size;
      CGSize v58 = *(CGSize *)&v67[16];
      v56[1].CGPoint origin = *(CGPoint *)v67;
      v56[1].CGSize size = v58;
      int v49 = v56 + 2;
      if (v48 != v50)
      {
        do
        {
          CGPoint origin = v48[-2].origin;
          CGSize v60 = v48[-2].size;
          CGSize v61 = v48[-1].size;
          v56[-1].CGPoint origin = v48[-1].origin;
          v56[-1].CGSize size = v61;
          v56[-2].CGPoint origin = origin;
          v56[-2].CGSize size = v60;
          v56 -= 2;
          v48 -= 2;
        }
        while (v48 != v50);
        char v48 = *v46;
      }
      *uint64_t v46 = v56;
      v46[1] = v49;
      _OWORD v46[2] = (CGRect *)&v55[64 * v54];
      if (v48) {
        operator delete(v48);
      }
    }
    else
    {
      *char v48 = valuePtr;
      v48[1].CGPoint origin = *(CGPoint *)v67;
      v48[1].CGSize size = *(CGSize *)&v67[16];
      int v49 = v48 + 2;
    }
    v46[1] = v49;
  }
LABEL_72:
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void sub_21765378C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50,void *__p,uint64_t a52,int a53,__int16 a54,char a55,char a56)
{
  if (a16 < 0)
  {
    operator delete(a11);
    if ((a50 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a39 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((a50 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a45);
  if ((a39 & 0x80000000) == 0)
  {
LABEL_4:
    if ((*(char *)(v58 - 217) & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  operator delete(a34);
  if ((*(char *)(v58 - 217) & 0x80000000) == 0)
  {
LABEL_5:
    if (a56 < 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  operator delete(*(void **)(v58 - 240));
  if (a56 < 0)
  {
LABEL_6:
    operator delete(__p);
    if ((v57 & 1) == 0) {
LABEL_14:
    }
      _Unwind_Resume(a1);
LABEL_13:
    __cxa_free_exception(v56);
    _Unwind_Resume(a1);
  }
LABEL_12:
  if (!v57) {
    goto LABEL_14;
  }
  goto LABEL_13;
}

void ik::core::msr::DescribeRect(ik::core::msr *this, const CGRect *a2)
{
  uint64_t v3 = (char *)operator new(0x20uLL);
  strcpy(v3, "(x:%g, y:%g, w:%g, h:%g)");
  if ((snprintf(0, 0, v3, *(void *)&a2->origin.x, *(void *)&a2->origin.y, *(void *)&a2->size.width, *(void *)&a2->size.height) & 0x80000000) == 0)operator new[](); {
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  }
  std::runtime_error::runtime_error(exception, "String formmating failed.");
  __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_217653B40(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_217653B5C(_Unwind_Exception *a1)
{
  MEMORY[0x21D449400](v2, 0x1000C8077774924);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_217653B88(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void ik::core::msr::MSR::GetIntermediateTensor(ik::core::msr::MSR *this@<X0>, CGSize a2@<0:D0, 8:D1>, unsigned int a3@<W1>, unint64_t a4@<X2>, uint64_t a5@<X8>)
{
  CGSize v37 = a2;
  unsigned int v38 = a3;
  long long v8 = (uint64_t *)*((void *)this + 4);
  if (v8)
  {
    long long v9 = (uint64_t *)*((void *)this + 4);
    do
    {
      double v10 = *((double *)v9 + 4);
      if (a2.width < v10) {
        goto LABEL_4;
      }
      double v11 = *((double *)v9 + 5);
      if (a2.width == v10 && a2.height < v11) {
        goto LABEL_4;
      }
      BOOL v13 = a2.width == v10;
      if (v11 >= a2.height) {
        BOOL v13 = 0;
      }
      if (v10 >= a2.width && !v13)
      {
        unsigned int v14 = *((_DWORD *)v9 + 12);
        if (v14 > a3) {
          goto LABEL_4;
        }
        if (v14 >= a3)
        {
          while (1)
          {
            double v15 = *((double *)v8 + 4);
            if (a2.width < v15) {
              goto LABEL_17;
            }
            double v16 = *((double *)v8 + 5);
            if (a2.width == v15 && a2.height < v16) {
              goto LABEL_17;
            }
            BOOL v18 = a2.width == v15;
            if (v16 >= a2.height) {
              BOOL v18 = 0;
            }
            if (v15 < a2.width || v18) {
              goto LABEL_29;
            }
            unsigned int v19 = *((_DWORD *)v8 + 12);
            if (v19 > a3)
            {
LABEL_17:
              long long v8 = (uint64_t *)*v8;
              if (!v8) {
                goto LABEL_30;
              }
            }
            else
            {
              if (v19 >= a3)
              {
                *(void *)a5 = &unk_26C78E630;
                int v25 = *((_DWORD *)v8 + 16);
                *(void *)(a5 + 16) = 0;
                *(_DWORD *)(a5 + 8) = v25;
                *(void *)(a5 + 24) = 0;
                *(void *)(a5 + 32) = 0;
                uint64_t v27 = (unsigned char *)v8[9];
                long long v26 = (unsigned char *)v8[10];
                int64_t v28 = v26 - v27;
                if (v26 != v27)
                {
                  if (v28 < 0) {
                    std::vector<long long>::__throw_length_error[abi:ne180100]();
                  }
                  CGSize v29 = (char *)operator new(v26 - v27);
                  *(void *)(a5 + 16) = v29;
                  *(void *)(a5 + 24) = v29;
                  long long v30 = &v29[8 * (v28 >> 3)];
                  *(void *)(a5 + 32) = v30;
                  memcpy(v29, v27, v28);
                  *(void *)(a5 + 24) = v30;
                }
                *(void *)(a5 + 40) = v8[12];
                uint64_t v31 = v8[13];
                *(void *)(a5 + 48) = v31;
                if (v31) {
                  atomic_fetch_add_explicit((atomic_ullong *volatile)(v31 + 8), 1uLL, memory_order_relaxed);
                }
                *(void *)a5 = &unk_26C78E518;
                return;
              }
LABEL_29:
              long long v8 = (uint64_t *)v8[1];
              if (!v8) {
LABEL_30:
              }
                std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
            }
          }
        }
      }
      ++v9;
LABEL_4:
      long long v9 = (uint64_t *)*v9;
    }
    while (v9);
  }
  v32[0] = (_OWORD *)a2.width;
  v32[1] = (_OWORD *)a2.height;
  unsigned int v33 = a3;
  char v34 = 1;
  char v35 = 0;
  char v36 = 0;
  ik::PixelBufferTensor::PixelBufferTensor((ik::PixelBufferTensor *)a5, (uint64_t)v32);
  if (a4)
  {
    while (*((void *)this + 5) >= a4)
      std::__tree<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::__map_value_compare<std::pair<CGSize,unsigned int>,std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::less<std::pair<CGSize,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>>>::erase((uint64_t **)this + 3, *((uint64_t **)this + 3));
    v32[0] = &v37;
    double v20 = std::__tree<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::__map_value_compare<std::pair<CGSize,unsigned int>,std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::less<std::pair<CGSize,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>>>::__emplace_unique_key_args<std::pair<CGSize,unsigned int>,std::piecewise_construct_t const&,std::tuple<std::pair<CGSize,unsigned int> const&>,std::tuple<>>((uint64_t **)this + 3, (uint64_t)&v37, (uint64_t)&std::piecewise_construct, v32);
    CGFloat v21 = v20;
    *((_DWORD *)v20 + 16) = *(_DWORD *)(a5 + 8);
    if (v20 + 7 != (uint64_t *)a5) {
      std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(v20 + 9, *(char **)(a5 + 16), *(char **)(a5 + 24), (uint64_t)(*(void *)(a5 + 24) - *(void *)(a5 + 16)) >> 3);
    }
    uint64_t v23 = *(void *)(a5 + 40);
    uint64_t v22 = *(void *)(a5 + 48);
    if (v22) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v22 + 8), 1uLL, memory_order_relaxed);
    }
    double v24 = (std::__shared_weak_count *)v21[13];
    v21[12] = v23;
    v21[13] = v22;
    if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
}

void sub_217653E88(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void sub_217653EA4(_Unwind_Exception *a1)
{
  ik::PixelBufferTensor::~PixelBufferTensor(v1);
  _Unwind_Resume(a1);
}

void sub_217653EB8(_Unwind_Exception *a1)
{
  ik::PixelBufferTensor::~PixelBufferTensor(v1);
  _Unwind_Resume(a1);
}

void ik::core::msr::Ensure<0,int>(uint64_t a1, int a2)
{
  if (a2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::operator+<char>();
    uint64_t v4 = std::string::append(&v11, " / status = ");
    long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
    v12.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v5;
    v4->__r_.__value_.__l.__size_ = 0;
    v4->__r_.__value_.__r.__words[2] = 0;
    v4->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v10, a2);
    if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v6 = &v10;
    }
    else {
      uint64_t v6 = (std::string *)v10.__r_.__value_.__r.__words[0];
    }
    if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v10.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v10.__r_.__value_.__l.__size_;
    }
    long long v8 = std::string::append(&v12, (const std::string::value_type *)v6, size);
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v13.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v13);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
}

void sub_217653FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (*(char *)(v28 - 41) < 0)
  {
    operator delete(*(void **)(v28 - 64));
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a26 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a9);
  if ((a26 & 0x80000000) == 0)
  {
LABEL_4:
    if (a20 < 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  operator delete(a21);
  if (a20 < 0)
  {
LABEL_5:
    operator delete(__p);
    if ((v27 & 1) == 0) {
LABEL_12:
    }
      _Unwind_Resume(a1);
LABEL_11:
    __cxa_free_exception(v26);
    goto LABEL_12;
  }
LABEL_10:
  if (!v27) {
    goto LABEL_12;
  }
  goto LABEL_11;
}

void sub_217654204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

void sub_2176543D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t *std::__tree<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::__map_value_compare<std::pair<CGSize,unsigned int>,std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::less<std::pair<CGSize,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>>>::erase(uint64_t **a1, uint64_t *a2)
{
  uint64_t v3 = (uint64_t *)a2[1];
  if (v3)
  {
    do
    {
      uint64_t v4 = v3;
      uint64_t v3 = (uint64_t *)*v3;
    }
    while (v3);
  }
  else
  {
    long long v5 = a2;
    do
    {
      uint64_t v4 = (uint64_t *)v5[2];
      BOOL v6 = *v4 == (void)v5;
      long long v5 = v4;
    }
    while (!v6);
  }
  if (*a1 == a2) {
    *a1 = v4;
  }
  int v7 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v7, a2);
  a2[7] = (uint64_t)&unk_26C78E630;
  long long v8 = (std::__shared_weak_count *)a2[13];
  if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    long long v9 = (void *)a2[9];
    if (!v9) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  long long v9 = (void *)a2[9];
  if (v9)
  {
LABEL_12:
    a2[10] = (uint64_t)v9;
    operator delete(v9);
  }
LABEL_13:
  operator delete(a2);
  return v4;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_10;
    }
    do
    {
      uint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (!v2)
  {
    int v5 = 1;
    BOOL v6 = (uint64_t **)v3[2];
    int v7 = *v6;
    if (*v6 == v3) {
      goto LABEL_6;
    }
LABEL_11:
    v6[1] = (uint64_t *)v2;
    int v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }
LABEL_10:
  int v5 = 0;
  *(void *)(v2 + 16) = v3[2];
  BOOL v6 = (uint64_t **)v3[2];
  int v7 = *v6;
  if (*v6 != v3) {
    goto LABEL_11;
  }
LABEL_6:
  *BOOL v6 = (uint64_t *)v2;
  if (v3 != result)
  {
    int v7 = v6[1];
    int v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2) {
      goto LABEL_16;
    }
LABEL_12:
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      __n128 result = v3;
    }
    goto LABEL_16;
  }
  int v7 = 0;
  __n128 result = (uint64_t *)v2;
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2) {
    goto LABEL_12;
  }
LABEL_16:
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    unsigned int v14 = (uint64_t **)v7[2];
    if (*v14 == v7) {
      break;
    }
    if (*((unsigned char *)v7 + 24))
    {
      double v15 = (void *)*v7;
      if (!*v7) {
        goto LABEL_38;
      }
    }
    else
    {
      *((unsigned char *)v7 + 24) = 1;
      *((unsigned char *)v14 + 24) = 0;
      float v17 = v14[1];
      BOOL v18 = (uint64_t *)*v17;
      v14[1] = (uint64_t *)*v17;
      if (v18) {
        v18[2] = (uint64_t)v14;
      }
      v17[2] = (uint64_t)v14[2];
      v14[2][*v14[2] != (void)v14] = (uint64_t)v17;
      *float v17 = (uint64_t)v14;
      v14[2] = v17;
      if (result == (uint64_t *)*v7) {
        __n128 result = v7;
      }
      int v7 = *(uint64_t **)(*v7 + 8);
      double v15 = (void *)*v7;
      if (!*v7) {
        goto LABEL_38;
      }
    }
    if (!*((unsigned char *)v15 + 24))
    {
      unsigned int v19 = (uint64_t *)v7[1];
      if (!v19) {
        goto LABEL_64;
      }
LABEL_63:
      if (*((unsigned char *)v19 + 24))
      {
LABEL_64:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v23 = v15[1];
        *int v7 = v23;
        if (v23) {
          *(void *)(v23 + 16) = v7;
        }
        float32x4_t v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        unsigned int v19 = v7;
      }
      else
      {
        double v15 = v7;
      }
      uint64_t v27 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v27 + 24);
      *(unsigned char *)(v27 + 24) = 1;
      *((unsigned char *)v19 + 24) = 1;
      uint64_t v28 = *(uint64_t **)(v27 + 8);
      uint64_t v29 = *v28;
      *(void *)(v27 + 8) = *v28;
      if (v29) {
        *(void *)(v29 + 16) = v27;
      }
      v28[2] = *(void *)(v27 + 16);
      *(void *)(*(void *)(v27 + 16) + 8 * (**(void **)(v27 + 16) != v27)) = v28;
      uint64_t *v28 = v27;
      *(void *)(v27 + 16) = v28;
      return result;
    }
LABEL_38:
    unsigned int v19 = (uint64_t *)v7[1];
    if (v19 && !*((unsigned char *)v19 + 24)) {
      goto LABEL_63;
    }
    *((unsigned char *)v7 + 24) = 0;
    std::string v12 = (uint64_t *)v7[2];
    if (v12 == result)
    {
      std::string v12 = result;
LABEL_61:
      *((unsigned char *)v12 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v12 + 24)) {
      goto LABEL_61;
    }
LABEL_24:
    int v7 = *(uint64_t **)(v12[2] + 8 * (*(void *)v12[2] == (void)v12));
  }
  if (*((unsigned char *)v7 + 24))
  {
    double v16 = (void *)*v7;
    if (!*v7) {
      goto LABEL_49;
    }
LABEL_48:
    if (!*((unsigned char *)v16 + 24)) {
      goto LABEL_67;
    }
  }
  else
  {
    *((unsigned char *)v7 + 24) = 1;
    *((unsigned char *)v14 + 24) = 0;
    double v20 = (uint64_t *)v7[1];
    void *v14 = v20;
    if (v20) {
      float32x4_t v20[2] = (uint64_t)v14;
    }
    v7[2] = (uint64_t)v14[2];
    v14[2][*v14[2] != (void)v14] = (uint64_t)v7;
    v7[1] = (uint64_t)v14;
    v14[2] = v7;
    if (result == (uint64_t *)v14) {
      __n128 result = v7;
    }
    int v7 = *v14;
    double v16 = (void *)**v14;
    if (v16) {
      goto LABEL_48;
    }
  }
LABEL_49:
  CGFloat v21 = (uint64_t *)v7[1];
  if (!v21 || *((unsigned char *)v21 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    std::string v12 = (uint64_t *)v7[2];
    if (*((unsigned char *)v12 + 24)) {
      BOOL v13 = v12 == result;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13) {
      goto LABEL_61;
    }
    goto LABEL_24;
  }
  if (v16 && !*((unsigned char *)v16 + 24))
  {
LABEL_67:
    CGFloat v21 = v7;
  }
  else
  {
    *((unsigned char *)v21 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v22 = *v21;
    v7[1] = *v21;
    if (v22) {
      *(void *)(v22 + 16) = v7;
    }
    v21[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v21;
    *CGFloat v21 = (uint64_t)v7;
    v7[2] = (uint64_t)v21;
    double v16 = v7;
  }
  double v24 = (uint64_t *)v21[2];
  *((unsigned char *)v21 + 24) = *((unsigned char *)v24 + 24);
  *((unsigned char *)v24 + 24) = 1;
  *((unsigned char *)v16 + 24) = 1;
  uint64_t v25 = *v24;
  uint64_t v26 = *(void *)(*v24 + 8);
  uint64_t *v24 = v26;
  if (v26) {
    *(void *)(v26 + 16) = v24;
  }
  *(void *)(v25 + 16) = v24[2];
  *(void *)(v24[2] + 8 * (*(void *)v24[2] != (void)v24)) = v25;
  *(void *)(v25 + 8) = v24;
  _OWORD v24[2] = v25;
  return result;
}

uint64_t *std::__tree<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::__map_value_compare<std::pair<CGSize,unsigned int>,std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::less<std::pair<CGSize,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>>>::__emplace_unique_key_args<std::pair<CGSize,unsigned int>,std::piecewise_construct_t const&,std::tuple<std::pair<CGSize,unsigned int> const&>,std::tuple<>>(uint64_t **a1, uint64_t a2, uint64_t a3, _OWORD **a4)
{
  int v7 = a1 + 1;
  BOOL v6 = a1[1];
  if (v6)
  {
    double v8 = *(double *)a2;
    double v9 = *(double *)(a2 + 8);
    unsigned int v10 = *(_DWORD *)(a2 + 16);
    while (1)
    {
      uint64_t v11 = v6;
      double v12 = *((double *)v6 + 4);
      if (v8 < v12) {
        goto LABEL_3;
      }
      double v13 = *((double *)v6 + 5);
      if (v8 == v12 && v9 < v13) {
        goto LABEL_3;
      }
      BOOL v15 = v8 == v12;
      if (v13 >= v9) {
        BOOL v15 = 0;
      }
      if (v12 < v8 || v15) {
        goto LABEL_15;
      }
      unsigned int v16 = *((_DWORD *)v11 + 12);
      if (v10 < v16)
      {
LABEL_3:
        BOOL v6 = (uint64_t *)*v11;
        int v7 = (uint64_t **)v11;
        if (!*v11) {
          goto LABEL_18;
        }
      }
      else
      {
        if (v16 >= v10) {
          return v11;
        }
LABEL_15:
        BOOL v6 = (uint64_t *)v11[1];
        if (!v6)
        {
          int v7 = (uint64_t **)(v11 + 1);
          goto LABEL_18;
        }
      }
    }
  }
  uint64_t v11 = (uint64_t *)(a1 + 1);
LABEL_18:
  float v17 = v11;
  BOOL v18 = operator new(0x70uLL);
  uint64_t v19 = *((void *)*a4 + 2);
  v18[2] = **a4;
  *((_DWORD *)v18 + 16) = 1;
  *(_OWORD *)((char *)v18 + 72) = 0u;
  *(_OWORD *)((char *)v18 + 88) = 0u;
  *((void *)v18 + 13) = 0;
  *((void *)v18 + 6) = v19;
  *((void *)v18 + 7) = &unk_26C78E518;
  *(void *)BOOL v18 = 0;
  *((void *)v18 + 1) = 0;
  *((void *)v18 + 2) = v17;
  *int v7 = (uint64_t *)v18;
  double v20 = (uint64_t *)**a1;
  CGFloat v21 = (uint64_t *)v18;
  if (v20)
  {
    *a1 = v20;
    CGFloat v21 = *v7;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v21);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return (uint64_t *)v18;
}

uint64_t ik::core::msr::MSR::MSR(uint64_t a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 24) = a1 + 32;
  *(void *)(a1 + 40) = 0;
  uint64_t v3 = (char *)operator new(0x20uLL);
  strcpy(v3, "IOSurfaceAccelerator creation");
  int v4 = IOSurfaceAcceleratorCreate();
  if (v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::operator+<char>();
    int v7 = std::string::append(&v14, " / status = ");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v15.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v13, v4);
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      double v9 = &v13;
    }
    else {
      double v9 = (std::string *)v13.__r_.__value_.__r.__words[0];
    }
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v13.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v13.__r_.__value_.__l.__size_;
    }
    uint64_t v11 = std::string::append(&v15, (const std::string::value_type *)v9, size);
    long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v16.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v16);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  operator delete(v3);
  return a1;
}

void sub_217654C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v37 - 57) < 0)
  {
    operator delete(*(void **)(v37 - 80));
    if ((a21 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a33 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((a21 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a16);
  if ((a33 & 0x80000000) == 0)
  {
LABEL_4:
    if (a27 < 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  operator delete(a28);
  if (a27 < 0)
  {
LABEL_5:
    operator delete(__p);
    if ((v35 & 1) == 0)
    {
LABEL_12:
      if (a15 < 0)
      {
        operator delete(a10);
        std::__tree<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::__map_value_compare<std::pair<CGSize,unsigned int>,std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::less<std::pair<CGSize,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>>>::destroy(v33, *v36);
        _Unwind_Resume(a1);
      }
      std::__tree<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::__map_value_compare<std::pair<CGSize,unsigned int>,std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::less<std::pair<CGSize,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>>>::destroy(v33, *v36);
      _Unwind_Resume(a1);
    }
LABEL_11:
    __cxa_free_exception(v34);
    goto LABEL_12;
  }
LABEL_10:
  if (!v35) {
    goto LABEL_12;
  }
  goto LABEL_11;
}

void std::__tree<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::__map_value_compare<std::pair<CGSize,unsigned int>,std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::less<std::pair<CGSize,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::__map_value_compare<std::pair<CGSize,unsigned int>,std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::less<std::pair<CGSize,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::__map_value_compare<std::pair<CGSize,unsigned int>,std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::less<std::pair<CGSize,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>>>::destroy(a1, a2[1]);
    a2[7] = &unk_26C78E630;
    int v4 = (std::__shared_weak_count *)a2[13];
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    int v5 = (void *)a2[9];
    if (v5)
    {
      a2[10] = v5;
      operator delete(v5);
    }
    operator delete(a2);
  }
}

double AcSaliencyNode::AcSaliencyNode(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 112) = 0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_DWORD *)(a2 + 8) = 0;
  *(void *)&double result = 0xDE7C00000001;
  *(void *)a2 = 0xDE7C00000001;
  return result;
}

{
  double result;

  *(_DWORD *)(a1 + 112) = 0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_DWORD *)(a2 + 8) = 0;
  *(void *)&double result = 0xDE7C00000001;
  *(void *)a2 = 0xDE7C00000001;
  return result;
}

void AcSaliencyNode::~AcSaliencyNode(AcSaliencyNode *this)
{
  uint64_t v1 = *((void *)this + 15);
  if (v1) {
    MEMORY[0x21D449400](v1, 0x1000C8077774924);
  }
}

{
  uint64_t v1;

  uint64_t v1 = *((void *)this + 15);
  if (v1) {
    MEMORY[0x21D449400](v1, 0x1000C8077774924);
  }
}

uint64_t AcSaliencyNode::init(uint64_t a1, _OWORD *a2, _DWORD *a3)
{
  if (*a3 != 1) {
    return 4294967289;
  }
  int v3 = a3[1];
  if (v3 == 56956 || v3 == 56945)
  {
    BOOL v6 = &kAcSaliencyNodeConfigDefaultRawData;
    if (a2) {
      BOOL v6 = a2;
    }
    if (*((_DWORD *)v6 + 6))
    {
      if (*((_DWORD *)v6 + 5))
      {
        long long v7 = *v6;
        long long v8 = v6[1];
        long long v9 = v6[3];
        *(_OWORD *)(a1 + 32) = v6[2];
        *(_OWORD *)(a1 + 48) = v9;
        *(_OWORD *)a1 = v7;
        *(_OWORD *)(a1 + 16) = v8;
        long long v10 = v6[4];
        long long v11 = v6[5];
        long long v12 = v6[6];
        *(_DWORD *)(a1 + 112) = *((_DWORD *)v6 + 28);
        *(_OWORD *)(a1 + 80) = v11;
        *(_OWORD *)(a1 + 96) = v12;
        *(_OWORD *)(a1 + 64) = v10;
        *(_DWORD *)(a1 + 128) = 4 * *(_DWORD *)(a1 + 44) + 4 + (4 * *(_DWORD *)(a1 + 44) + 4) * *(_DWORD *)(a1 + 48);
        operator new[]();
      }
    }
  }
  return 4294967292;
}

void AcSaliencyNode::postProcess(uint64_t a1, uint64_t a2, int a3, _DWORD *a4, __n128 *a5)
{
  if (*a4 == 1 && a3 == 1 && a4[1] == 56945)
  {
    int v8 = *(_DWORD *)(a1 + 48);
    a5[374].n128_u16[1] = *(_DWORD *)(a1 + 44);
    a5[374].n128_u16[0] = v8;
    std::chrono::steady_clock::now();
    AcSaliencyNode::postProcessSaliency(a1, a2, 1, v9, a5, v10, v11);
  }
}

__n128 AcSaliencyNode::postProcessSaliency(uint64_t a1, uint64_t a2, int a3, int a4, __n128 *a5, double a6, double a7)
{
  a5[91].n128_u32[3] = 0;
  if (a3
    && (int v9 = *(_DWORD *)(a2 + 12), v10 = a5[374].n128_u16[0], v9 == v10)
    && (unint64_t v11 = *(unsigned int *)(a2 + 8), v12 = a5[374].n128_u16[1], v11 == v12))
  {
    std::string v14 = a5 + 94;
    if (*(_DWORD *)(a2 + 8) && v9)
    {
      unint64_t v15 = 0;
      LODWORD(v16) = 1;
      float v17 = a5 + 94;
      do
      {
        if (v16)
        {
          unint64_t v18 = 0;
          do
          {
            LOBYTE(a7) = *(unsigned char *)(*(void *)a2 + (v18 + v15 * *(_DWORD *)(a2 + 16)));
            *(void *)&a7 = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)&a7)).u64[0];
            *(float *)&a7 = (float)((float)(*(float *)(a1 + 68) * (float)SLODWORD(a7)) + 1.0) * 255.0;
            v17->n128_u8[v18++] = (int)*(float *)&a7;
            unint64_t v16 = *(unsigned int *)(a2 + 12);
          }
          while (v18 < v16);
          unint64_t v11 = *(unsigned int *)(a2 + 8);
        }
        ++v15;
        v17 += 5;
      }
      while (v15 < v11);
      int v10 = a5[374].n128_u16[0];
      LODWORD(v12) = a5[374].n128_u16[1];
    }
    uint64_t v19 = (_OWORD *)((char *)&a5[91].n128_f64[1] + 4);
    a5[374].n128_u8[6] = 1;
    a5[374].n128_u16[2] = 80;
    unsigned int v38 = a5 + 94;
    int v39 = v12;
    int v40 = v10;
    uint64_t v41 = 0x100000050;
    double v20 = (__n128 *)(a1 + 132);
    convertSaliencyMapToBoundingBoxes((uint64_t)&v38, (uint64_t)a5, *(char **)(a1 + 120), *(_DWORD *)(a1 + 128), a1 + 132, 50, *(float *)(a1 + 104), *(float *)(a1 + 108));
    if (!*(_DWORD *)(a2 + 8) || !*(_DWORD *)(a2 + 12)) {
      goto LABEL_41;
    }
    int v23 = 0;
    unint64_t v24 = 0;
    unsigned __int8 v25 = 0;
    LODWORD(v26) = 1;
    do
    {
      if (v26)
      {
        *(float *)v21.i32 = (float)v24;
        float v27 = a5[92].n128_f32[3];
        if (v27 <= (float)v24)
        {
          unint64_t v30 = 0;
          float v31 = a5[92].n128_f32[2];
          do
          {
            v22.i8[0] = *(unsigned char *)(*(void *)a2 + (v30 + v23 * *(_DWORD *)(a2 + 16)));
            float v32 = (float)((float)(*(float *)(a1 + 68) * (float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v22)).i32[0])
                        - *(float *)(a1 + 112))
                / (float)(1.0 - *(float *)(a1 + 112));
            int8x8_t v22 = 0;
            if (v32 >= 0.0)
            {
              *(float *)v22.i32 = v32;
              if (v32 > 1.0) {
                v22.i32[0] = 1.0;
              }
            }
            int v33 = (int)(float)(*(float *)v22.i32 * 255.0);
            *(float *)v22.i32 = (float)v30;
            if (v31 <= (float)v30 && (float)(v31 + a5[93].n128_f32[0]) > *(float *)v22.i32)
            {
              *(float *)v22.i32 = v27 + a5[93].n128_f32[1];
              BOOL v35 = *(float *)v22.i32 > *(float *)v21.i32 && v33 != 0;
              v25 |= v35;
            }
            v14->n128_u8[v30++] = v33;
          }
          while (v30 < *(unsigned int *)(a2 + 12));
          LODWORD(v26) = *(_DWORD *)(a2 + 12);
        }
        else
        {
          unint64_t v28 = 0;
          do
          {
            v21.i8[0] = *(unsigned char *)(*(void *)a2 + (v28 + v23 * *(_DWORD *)(a2 + 16)));
            float v29 = (float)((float)(*(float *)(a1 + 68) * (float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v21)).i32[0])
                        - *(float *)(a1 + 112))
                / (float)(1.0 - *(float *)(a1 + 112));
            int8x8_t v21 = 0;
            if (v29 >= 0.0)
            {
              *(float *)v21.i32 = v29;
              if (v29 > 1.0) {
                v21.i32[0] = 1.0;
              }
            }
            *(float *)v21.i32 = *(float *)v21.i32 * 255.0;
            v14->n128_u8[v28++] = (int)*(float *)v21.i32;
            unint64_t v26 = *(unsigned int *)(a2 + 12);
          }
          while (v28 < v26);
        }
      }
      ++v24;
      v14 += 5;
      ++v23;
    }
    while (v24 < *(unsigned int *)(a2 + 8));
    if (((*(_DWORD *)v19 != 0) & v25) == 0)
    {
LABEL_41:
      a5[93].n128_u32[3] = 0;
      *uint64_t v19 = 0u;
      *(__n128 *)((char *)&a5[92] + 12) = 0u;
    }
    __n128 result = a5[92];
    __n128 v37 = a5[93];
    *double v20 = result;
    *(__n128 *)(a1 + 148) = v37;
  }
  else
  {
    a5[374].n128_u8[6] = 0;
  }
  return result;
}

uint64_t AcSaliencyNode::getParams(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  if (*a2 != 1) {
    return 4294967289;
  }
  if (a2[1] != 56945) {
    return 4294967292;
  }
  long long v3 = *(_OWORD *)(a1 + 20);
  *(void *)(a3 + 64) = *(void *)(a1 + 36);
  *(_OWORD *)(a3 + 48) = v3;
  long long v4 = *(_OWORD *)(a1 + 44);
  *(void *)(a3 + 1240) = *(void *)(a1 + 60);
  *(_OWORD *)(a3 + 1224) = v4;
  strncpy((char *)(a3 + 3336), (const char *)(a1 + 72), 0x20uLL);
  return 0;
}

uint64_t acDetBboxCoderDecodeAll(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned int a16, char a17, uint64_t a18, unsigned int a19, uint64_t a20,uint64_t a21)
{
  uint64_t v164 = a1 + 11;
  if ((a1[11] | 2) != 7) {
    acDetBboxCoderDecodeAll();
  }
  uint64_t v22 = 355;
  if (!a17) {
    uint64_t v22 = 345;
  }
  unint64_t v23 = a1[26];
  if (v23)
  {
    uint64_t v24 = a2;
    unint64_t v25 = 0;
    uint64_t v26 = 0;
    unsigned int v142 = 0;
    int v158 = &a1[v22];
    float v145 = a1 + 385;
    int v146 = a1 + 372;
    while (1)
    {
      unint64_t v27 = a1[393];
      if (v25 >= v27)
      {
        unsigned int v28 = v25 - v27 + 2 * v27;
        unsigned int v30 = a1[v25 + 57];
        uint64_t v31 = a3;
        if (v28 != -1)
        {
          uint64_t v32 = 0;
          float v33 = *(float *)(a7 + 4 * v28);
          float v157 = v33;
          char v34 = v164;
          goto LABEL_13;
        }
        unsigned int v29 = -1;
      }
      else
      {
        unsigned int v28 = 2 * v25;
        unsigned int v29 = (2 * v25) | 1;
        unsigned int v30 = a1[v25 + 57];
        uint64_t v31 = a3;
      }
      float v33 = *(float *)(a7 + 4 * v28);
      uint64_t v32 = v31 + 24 * v29;
      float v157 = *(float *)(a7 + 4 * v29);
      char v34 = &a1[v25 + 303];
LABEL_13:
      BOOL v35 = &a1[v25];
      if (!v35[303]) {
        acDetBboxCoderDecodeAll();
      }
      if (*(_DWORD *)(v31 + 24 * v28 + 20)) {
        acDetBboxCoderDecodeAll();
      }
      unsigned int v36 = *v34;
      if (v32 && *(_DWORD *)(v32 + 20)) {
        acDetBboxCoderDecodeAll();
      }
      uint64_t v141 = a4 + 24 * v25;
      if (*(_DWORD *)(v141 + 20)) {
        acDetBboxCoderDecodeAll();
      }
      uint64_t v140 = a5 + 24 * v25;
      if (*(_DWORD *)(v140 + 20)) {
        acDetBboxCoderDecodeAll();
      }
      uint64_t v139 = a6 + 24 * v25;
      if (*(_DWORD *)(v139 + 20)) {
        acDetBboxCoderDecodeAll();
      }
      unsigned int v37 = v36 * v30;
      uint64_t v38 = v31 + 24 * v28;
      unsigned int v39 = *(_DWORD *)(v38 + 8);
      unsigned int v40 = v39 / (v36 * v30);
      if (v40 * v37 != v39) {
        acDetBboxCoderDecodeAll();
      }
      uint64_t v165 = *(unsigned int *)(v38 + 12);
      if (v165 != *(_DWORD *)(a4 + 24 * v25 + 12)) {
        acDetBboxCoderDecodeAll();
      }
      if (*(_DWORD *)(a4 + 24 * v25 + 8) != 4 * v30 * v40) {
        acDetBboxCoderDecodeAll();
      }
      if (!v32)
      {
        unsigned int v160 = 0;
        if (!v30) {
          goto LABEL_6;
        }
LABEL_27:
        if (v37 > v39)
        {
          unsigned int v113 = a16 - v142;
          if (a16 < v142) {
            unsigned int v113 = 0;
          }
          unsigned int v114 = v30 - 1;
          v142 += v30;
          while (v113 > v114)
          {
            if (!--v30) {
              goto LABEL_6;
            }
          }
        }
        else
        {
          if (a16 >= v142) {
            uint64_t v41 = a16 - v142;
          }
          else {
            uint64_t v41 = 0;
          }
          if (v165)
          {
            uint64_t v42 = 0;
            uint64_t v128 = v31 + 24 * v28;
            uint64_t v162 = v35 + 303;
            float v154 = *(float *)(a8 + 4 * v25);
            CFNumberRef v43 = (float *)&a1[v25];
            float v156 = v43[51];
            float v153 = v43[39];
            float v127 = v43[45];
            int v44 = *(_DWORD *)(v128 + 16) * v40;
            float v125 = (_DWORD *)(a5 + 24 * v25 + 16);
            float v126 = (_DWORD *)(a4 + 24 * v25 + 16);
            float v124 = (_DWORD *)(a6 + 24 * v25 + 16);
            uint64_t v148 = *v125 * v40;
            unsigned int v45 = *v126 * v40;
            int v119 = 4 * v45;
            uint64_t v147 = *v124 * v40;
            float v46 = -v157;
            uint64_t v152 = v45;
            uint64_t v151 = 2 * v45;
            uint64_t v150 = 3 * v45;
            uint64_t v117 = v30;
            if (v40 <= 1) {
              int v47 = 1;
            }
            else {
              int v47 = v40;
            }
            int v122 = v47;
            unint64_t v170 = v25;
            uint64_t v161 = v32;
            uint64_t v123 = v41;
            float v143 = *(float *)(a13 + 4 * v25);
            float v144 = *(float *)(a12 + 4 * v25);
LABEL_36:
            if (v42 == v41) {
              goto LABEL_146;
            }
            unsigned int v48 = 0;
            uint64_t v132 = (v119 * v42);
            int v131 = v44 * v42;
            int v121 = v160 * v42;
            uint64_t v118 = v42;
            int v129 = v147 * v42;
            int v130 = v148 * v42;
            while (2)
            {
              if (v32)
              {
                uint64_t v159 = *(void *)v32 + v121 * a1[394] + *(_DWORD *)(v32 + 16) * v48;
                int v49 = v162;
              }
              else
              {
                uint64_t v159 = 0;
                int v49 = v164;
              }
              uint64_t v50 = 0;
              uint64_t v51 = (__int8 *)(*(void *)v141 + v132 + *v126 * v48);
              uint64_t v163 = *(void *)v128 + v131 * *v49 + *(_DWORD *)(v128 + 16) * v48;
              unint64_t v52 = (unsigned __int8 *)(*(void *)v140 + v130 * a1[371] + *v125 * v48);
              uint64_t v53 = (unsigned __int8 *)(*(void *)v139 + v129 * a1[384] + *v124 * v48);
              unsigned int v136 = v48;
              *(float *)&a10 = v156;
              *(float *)&a11 = v127;
              float v155 = v127 + (float)((float)v48 * v156);
LABEL_45:
              uint64_t v54 = v163 + v50;
              uint64_t v55 = *v164;
              if (v32)
              {
                uint64_t v56 = *v162;
                if (v56)
                {
                  uint64_t v57 = 0;
                  float v58 = -INFINITY;
                  do
                  {
                    LOBYTE(a10) = *(unsigned char *)(v54 + (v44 * v57));
                    *(void *)&a10 = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)&a10)).u64[0];
                    *(float *)&a10 = (float)SLODWORD(a10);
                    if (v58 < *(float *)&a10)
                    {
                      LODWORD(v55) = v57;
                      float v58 = *(float *)&a10;
                    }
                    ++v57;
                  }
                  while (v56 != v57);
                }
                else
                {
                  float v58 = -INFINITY;
                }
                uint64_t v63 = v159 + v50;
                char v64 = *(unsigned char *)(v159 + v50);
                uint64_t v65 = a1[394] * v160;
                if (v160 < v65)
                {
                  unint64_t v66 = v63 + v65;
                  uint64_t v67 = (char *)(v63 + v160);
                  do
                  {
                    if (*v67 > v64) {
                      char v64 = *v67;
                    }
                    v67 += v160;
                  }
                  while ((unint64_t)v67 < v66);
                }
                float v68 = (float)v64;
                *(float *)&a9 = (float)(v33 * v58) + (float)(v46 * v68);
                uint64_t v69 = a1[v55 + 365];
                LODWORD(a10) = *(_DWORD *)(v24 + 4 * v69);
                if (*(float *)&a9 >= *(float *)&a10)
                {
                  unsigned int v167 = v26;
                  uint64_t v166 = v51;
                  int v168 = v53;
                  uint64_t v169 = v52;
                  if (v56)
                  {
                    int v70 = 0;
                    uint64_t v55 = v55;
                    float v71 = 0.0;
                    float v72 = -INFINITY;
                    do
                    {
                      LOBYTE(a9) = *(unsigned char *)(v54 + (v44 * v70));
                      *(float *)&a9 = expf(v33 * (float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)&a9)).i32[0]);
                      if (!v55) {
                        float v72 = *(float *)&a9;
                      }
                      float v71 = v71 + *(float *)&a9;
                      ++v70;
                      --v55;
                      --v56;
                    }
                    while (v56);
                  }
                  else
                  {
                    float v71 = 0.0;
                    float v72 = -INFINITY;
                  }
                  float v76 = expf(v157 * v68) + v71;
                  goto LABEL_96;
                }
                unint64_t v25 = v170;
              }
              else
              {
                if (v55)
                {
                  uint64_t v59 = 0;
                  unsigned int v60 = 0;
                  BOOL v61 = 0;
                  LODWORD(a10) = -8388608;
                  LODWORD(a9) = -8388608;
                  unsigned int v62 = *v164;
                  do
                  {
                    LOBYTE(a11) = *(unsigned char *)(v54 + (v44 * v59));
                    *(void *)&a11 = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)&a11)).u64[0];
                    *(float *)&a11 = v33 * (float)SLODWORD(a11);
                    if (v60 < *v162 && v59 == a1[6 * v25 + 309 + v60])
                    {
                      if (*(float *)&a11 > *(float *)&a9)
                      {
                        BOOL v61 = (float)(*(float *)&a11 - *(float *)&a10) < *(float *)(v24 + 4 * a1[v60 + 365]);
                        unsigned int v62 = v60;
                        LODWORD(a9) = LODWORD(a11);
                      }
                      ++v60;
                    }
                    else if (*(float *)&a11 > *(float *)&a10)
                    {
                      if (v62 == v55) {
                        unsigned int v62 = *v164;
                      }
                      else {
                        BOOL v61 = (float)(*(float *)&a9 - *(float *)&a11) < *(float *)(v24 + 4 * a1[v62 + 365]);
                      }
                      LODWORD(a10) = LODWORD(a11);
                    }
                    ++v59;
                  }
                  while (v55 != v59);
                  if (v61) {
                    goto LABEL_44;
                  }
                  int v168 = v53;
                  uint64_t v169 = v52;
                  uint64_t v166 = v51;
                  unsigned int v167 = v26;
                  uint64_t v73 = 0;
                  unsigned int v74 = 0;
                  unsigned int v75 = *v162;
                  float v76 = 0.0;
                  float v72 = -INFINITY;
                  do
                  {
                    while (1)
                    {
                      LOBYTE(a9) = *(unsigned char *)(v54 + (v44 * v73));
                      *(float *)&a9 = expf(v33 * (float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)&a9)).i32[0]);
                      if (v74 < v75) {
                        break;
                      }
                      float v76 = v76 + *(float *)&a9;
                      if (v55 == ++v73) {
                        goto LABEL_93;
                      }
                    }
                    if (*(float *)&a9 <= v72) {
                      unsigned int v77 = v62;
                    }
                    else {
                      unsigned int v77 = v74;
                    }
                    if (*(float *)&a9 <= v72) {
                      *(float *)&a10 = v72;
                    }
                    else {
                      *(float *)&a10 = *(float *)&a9;
                    }
                    if (v73 == a1[6 * v170 + 309 + v74])
                    {
                      unsigned int v62 = v77;
                      float v72 = *(float *)&a10;
                      ++v74;
                    }
                    float v76 = v76 + *(float *)&a9;
                    ++v73;
                  }
                  while (v55 != v73);
                }
                else
                {
                  int v168 = v53;
                  uint64_t v169 = v52;
                  uint64_t v166 = v51;
                  unsigned int v167 = v26;
                  unsigned int v62 = 0;
                  float v76 = 0.0;
                  float v72 = -INFINITY;
                }
LABEL_93:
                uint64_t v69 = a1[v62 + 365];
                uint64_t v24 = a2;
LABEL_96:
                float v78 = v72 / v76;
                uint64_t v26 = v167;
                unint64_t v52 = v169;
                unint64_t v25 = v170;
                uint64_t v32 = v161;
                uint64_t v51 = v166;
                uint64_t v53 = v168;
                if (v78 > *(float *)&v158[v69])
                {
                  if (v167 >= a19) {
                    acDetBboxCoderDecodeAll();
                  }
                  LODWORD(a9) = *(_DWORD *)(a15 + 4 * v142);
                  float v79 = (float)a1[5];
                  float v80 = *(float *)&a9 / v79;
                  LOBYTE(a9) = v166[v150];
                  float v81 = v80 * expf(v154 * (float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)&a9)).i32[0]);
                  v82.i32[0] = *(_DWORD *)(a14 + 4 * v142);
                  float v83 = (float)a1[6];
                  float v84 = *(float *)v82.i32 / v83;
                  v82.i8[0] = v166[v151];
                  v90.n128_f32[0] = v84 * expf(v154 * (float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v82)).i32[0]);
                  v85.i8[0] = v166[v152];
                  *(void *)&a10 = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v85)).u64[0];
                  v86.i8[0] = *v166;
                  float v87 = (float)(v153 + (float)((float)v50 * v156)) / v83;
                  *(float *)v86.i32 = (float)(v87
                                            + (float)((float)(v154
                                                            * (float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v86)).i32[0])
                                                    * v84))
                                    + (float)(v90.n128_f32[0] * -0.5);
                  uint64_t v88 = a18 + 36 * v167;
                  v90.n128_f32[0] = v90.n128_f32[0] + *(float *)v86.i32;
                  *(float *)&a10 = (float)((float)(v155 / v79) + (float)((float)(v154 * (float)SLODWORD(a10)) * v80))
                                 + (float)(v81 * -0.5);
                  *(_DWORD *)uint64_t v88 = v86.i32[0];
                  *(_DWORD *)(v88 + 4) = LODWORD(a10);
                  *(_DWORD *)(v88 + 8) = v90.n128_u32[0];
                  *(float *)(v88 + 12) = v81 + *(float *)&a10;
                  *(_DWORD *)(v88 + 16) = v69;
                  *(float *)(v88 + 20) = v78;
                  float v89 = v87 + (float)(v84 * -0.5);
                  *(float *)&a11 = (float)(v155 / v79) + (float)(v80 * -0.5);
                  v90.n128_f32[0] = (float)((float)(v89 + (float)(v84 + v89)) * -0.5)
                                  + (float)((float)(*(float *)v86.i32 + v90.n128_f32[0]) * 0.5);
                  *(float *)&a10 = (float)((float)(*(float *)&a11 + (float)(v80 + *(float *)&a11)) * -0.5)
                                 + (float)((float)(*(float *)&a10 + (float)(v81 + *(float *)&a10)) * 0.5);
                  *(float *)&a11 = (float)(v80 + *(float *)&a11) - *(float *)&a11;
                  v90.n128_f32[0] = sqrtf((float)((float)(*(float *)&a10 / *(float *)&a11)* (float)(*(float *)&a10 / *(float *)&a11))+ (float)((float)(v90.n128_f32[0] / (float)((float)(v84 + v89) - v89))* (float)(v90.n128_f32[0] / (float)((float)(v84 + v89) - v89))));
                  *(float *)&a10 = 1.0 - v78;
                  v90.n128_f32[0] = (float)(1.0 - v78) + v90.n128_f32[0];
                  *(_DWORD *)(v88 + 32) = v90.n128_u32[0];
                  if (v69 == 1)
                  {
                    long long v91 = *(float32x4_t **)a20;
                    uint64_t v92 = a1[371];
                    uint64_t v93 = v92;
                    uint64_t v94 = *(float32x4_t **)a20;
                    char v95 = v169;
                    float v46 = -v157;
                    if (v92)
                    {
                      do
                      {
                        v90.n128_u8[0] = *v95;
                        __n128 v90 = (__n128)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8((int8x8_t)v90.n128_u64[0]));
                        v90.n128_f32[0] = v144 * (float)v90.n128_i32[0];
                        v94->i32[0] = v90.n128_u32[0];
                        uint64_t v94 = (float32x4_t *)((char *)v94 + 4);
                        v95 += v148;
                        --v93;
                      }
                      while (v93);
                    }
                    bmSoftmax(v91, v91->f32, v92, v90);
                    unsigned int v97 = a1[371];
                    if (*(_DWORD *)(a20 + 12) != v97) {
                      acDetBboxCoderDecodeAll();
                    }
                    if (v97 < 2)
                    {
                      uint64_t v98 = 0;
                      uint64_t v101 = v147;
                      unsigned int v102 = v168;
                    }
                    else
                    {
                      LODWORD(v98) = 0;
                      float v99 = **(float **)a20;
                      uint64_t v100 = 1;
                      uint64_t v101 = v147;
                      unsigned int v102 = v168;
                      do
                      {
                        float v103 = *(float *)(*(void *)a20 + 4 * v100);
                        if (v103 <= v99) {
                          uint64_t v98 = v98;
                        }
                        else {
                          uint64_t v98 = v100;
                        }
                        if (v103 > v99) {
                          float v99 = *(float *)(*(void *)a20 + 4 * v100);
                        }
                        ++v100;
                      }
                      while (v97 != v100);
                    }
                    v96.n128_f32[0] = (float)(int)v146[v98];
                    *(_DWORD *)(a18 + 36 * v167 + 24) = v96.n128_u32[0];
                    unsigned int v104 = *(float32x4_t **)a21;
                    uint64_t v105 = a1[384];
                    uint64_t v106 = v105;
                    v107 = *(float32x4_t **)a21;
                    v108 = v102;
                    if (v105)
                    {
                      do
                      {
                        v96.n128_u8[0] = *v108;
                        __n128 v96 = (__n128)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8((int8x8_t)v96.n128_u64[0]));
                        v96.n128_f32[0] = v143 * (float)v96.n128_i32[0];
                        v107->i32[0] = v96.n128_u32[0];
                        v107 = (float32x4_t *)((char *)v107 + 4);
                        v108 += v101;
                        --v106;
                      }
                      while (v106);
                    }
                    bmSoftmax(v104, v104->f32, v105, v96);
                    unsigned int v109 = a1[384];
                    if (*(_DWORD *)(a21 + 12) != v109) {
                      acDetBboxCoderDecodeAll();
                    }
                    if (v109 < 2)
                    {
                      uint64_t v110 = 0;
                      uint64_t v32 = v161;
                      uint64_t v51 = v166;
                      uint64_t v53 = v168;
                      unint64_t v52 = v169;
                    }
                    else
                    {
                      LODWORD(v110) = 0;
                      float v111 = **(float **)a21;
                      uint64_t v112 = 1;
                      uint64_t v32 = v161;
                      uint64_t v51 = v166;
                      uint64_t v53 = v168;
                      unint64_t v52 = v169;
                      do
                      {
                        LODWORD(a10) = *(_DWORD *)(*(void *)a21 + 4 * v112);
                        if (*(float *)&a10 <= v111) {
                          uint64_t v110 = v110;
                        }
                        else {
                          uint64_t v110 = v112;
                        }
                        if (*(float *)&a10 > v111) {
                          float v111 = *(float *)(*(void *)a21 + 4 * v112);
                        }
                        ++v112;
                      }
                      while (v109 != v112);
                    }
                    *(float *)(a18 + 36 * v167 + 28) = (float)(int)v145[v110];
                    uint64_t v26 = v167 + 1;
                    if (v26 >= a19) {
                      return v26;
                    }
                  }
                  else
                  {
                    uint64_t v51 = v166;
                    *(_DWORD *)(a18 + 36 * v167 + 24) = 0;
                    HIDWORD(a9) = 0;
                    uint64_t v32 = v161;
                    float v46 = -v157;
                    uint64_t v53 = v168;
                    unint64_t v52 = v169;
                    *(_DWORD *)(a18 + 36 * v167 + 28) = 0;
                    uint64_t v26 = v167 + 1;
                    if (v26 >= a19) {
                      return v26;
                    }
                  }
                }
              }
LABEL_44:
              ++v51;
              ++v52;
              ++v53;
              if (++v50 == v165)
              {
                unsigned int v48 = v136 + 1;
                uint64_t v41 = v123;
                if (v136 + 1 != v122) {
                  continue;
                }
                uint64_t v42 = v118 + 1;
                ++v142;
                if (v118 + 1 == v117)
                {
                  unint64_t v23 = a1[26];
                  goto LABEL_6;
                }
                goto LABEL_36;
              }
              goto LABEL_45;
            }
          }
          unsigned int v115 = v30 - 1;
          v142 += v30;
          if (v32)
          {
            while (v41 > v115)
            {
              if (!--v30) {
                goto LABEL_6;
              }
            }
          }
          else
          {
            while (v41 > v115)
            {
              if (!--v30) {
                goto LABEL_6;
              }
            }
          }
        }
LABEL_146:
        acDetBboxCoderDecodeAll();
      }
      unsigned int v160 = *(_DWORD *)(v32 + 16) * v40;
      if (v30) {
        goto LABEL_27;
      }
LABEL_6:
      if (++v25 >= v23) {
        return v26;
      }
    }
  }
  return 0;
}

uint64_t acDetBboxCoderGetClsBufferInds(uint64_t result, unsigned int a2, unsigned int *a3, unsigned int *a4, unsigned int *a5)
{
  unsigned int v5 = a2 - result + 2 * result;
  int v6 = 2 * a2;
  if (a2 >= result) {
    int v6 = -1;
  }
  else {
    unsigned int v5 = -1;
  }
  *a3 = v5;
  if (a2 < result) {
    int v7 = (2 * a2) | 1;
  }
  else {
    int v7 = -1;
  }
  *a4 = v6;
  *a5 = v7;
  return result;
}

uint64_t acDetBboxCoderDecodeAllFloat(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, char a10, uint64_t a11, unsigned int a12, uint64_t a13, uint64_t a14)
{
  int v168 = a1 + 11;
  if ((a1[11] | 2) != 7) {
    acDetBboxCoderDecodeAllFloat();
  }
  uint64_t v15 = 355;
  if (!a10) {
    uint64_t v15 = 345;
  }
  unsigned int v16 = a1[26];
  if (v16)
  {
    uint64_t v17 = a2;
    uint64_t v18 = 0;
    uint64_t v147 = 0;
    uint64_t v163 = &a1[v15];
    unsigned int v149 = a1 + 372;
    uint64_t v148 = a1 + 385;
    while (1)
    {
      unsigned int v19 = a1[393];
      int v20 = HIDWORD(v147);
      BOOL v21 = HIDWORD(v147) >= v19;
      if (HIDWORD(v147) < v19) {
        int v22 = -1;
      }
      else {
        int v22 = HIDWORD(v147) - v19 + 2 * v19;
      }
      if (HIDWORD(v147) < v19) {
        unsigned int v23 = 2 * HIDWORD(v147);
      }
      else {
        unsigned int v23 = -1;
      }
      if (v21) {
        unsigned int v24 = -1;
      }
      else {
        unsigned int v24 = (2 * HIDWORD(v147)) | 1;
      }
      unint64_t v25 = &a1[HIDWORD(v147)];
      uint64_t v26 = (int *)v168;
      uint64_t v165 = v25 + 303;
      if (v22 == -1)
      {
        uint64_t v26 = (int *)(v25 + 303);
        uint64_t v27 = a3 + 24 * v24;
      }
      else
      {
        uint64_t v27 = 0;
      }
      int v169 = v22;
      if (v22 != -1) {
        unsigned int v23 = v22;
      }
      if (!v25[303]) {
        acDetBboxCoderDecodeAllFloat();
      }
      if (*(_DWORD *)(a3 + 24 * v23 + 20) != 6) {
        acDetBboxCoderDecodeAllFloat();
      }
      uint64_t v28 = v25[57];
      int v29 = *v26;
      if (v22 == -1 && *(_DWORD *)(a3 + 24 * v24 + 20) != 6) {
        acDetBboxCoderDecodeAllFloat();
      }
      int v30 = HIDWORD(v147);
      if (*(_DWORD *)(a4 + 24 * HIDWORD(v147) + 20) != 6) {
        acDetBboxCoderDecodeAllFloat();
      }
      if (*(_DWORD *)(a5 + 24 * HIDWORD(v147) + 20) != 6) {
        acDetBboxCoderDecodeAllFloat();
      }
      if (*(_DWORD *)(a6 + 24 * HIDWORD(v147) + 20) != 6) {
        acDetBboxCoderDecodeAllFloat();
      }
      unsigned int v31 = v29 * v28;
      uint64_t v32 = a3 + 24 * v23;
      unsigned int v33 = *(_DWORD *)(v32 + 8);
      unsigned int v34 = v33 / (v29 * (int)v28);
      if (v34 * v31 != v33) {
        acDetBboxCoderDecodeAllFloat();
      }
      uint64_t v167 = *(unsigned int *)(v32 + 12);
      if (v167 != *(_DWORD *)(a4 + 24 * HIDWORD(v147) + 12)) {
        acDetBboxCoderDecodeAllFloat();
      }
      if (*(_DWORD *)(a4 + 24 * HIDWORD(v147) + 8) != 4 * v28 * v34) {
        acDetBboxCoderDecodeAllFloat();
      }
      uint64_t v35 = a3 + 24 * v23;
      int v37 = *(_DWORD *)(v35 + 16);
      unsigned int v36 = (_DWORD *)(v35 + 16);
      unsigned int v38 = v37 * v34;
      if (((v37 * v34) & 3) != 0) {
        acDetBboxCoderDecodeAllFloat();
      }
      if (v169 == -1) {
        break;
      }
      unsigned int v162 = 0;
      unsigned int v39 = v147;
      if (v28) {
        goto LABEL_36;
      }
LABEL_6:
      HIDWORD(v147) = v20 + 1;
      if (v20 + 1 >= v16) {
        return v18;
      }
    }
    unsigned int v162 = (*(_DWORD *)(a3 + 24 * v24 + 16) * v34) >> 2;
    unsigned int v39 = v147;
    if (!v28) {
      goto LABEL_6;
    }
LABEL_36:
    if (v31 > v33)
    {
      unsigned int v120 = a9 - v39;
      if (a9 < v39) {
        unsigned int v120 = 0;
      }
      unsigned int v121 = v28 - 1;
      LODWORD(v147) = v39 + v28;
      while (v120 > v121)
      {
        LODWORD(v28) = v28 - 1;
        if (!v28) {
          goto LABEL_6;
        }
      }
    }
    else
    {
      if (a9 >= v39) {
        uint64_t v40 = a9 - v39;
      }
      else {
        uint64_t v40 = 0;
      }
      if (v167)
      {
        float v137 = v36;
        uint64_t v126 = v27;
        float v127 = (void *)(a3 + 24 * v24);
        unsigned int v136 = (void *)(a3 + 24 * v23);
        uint64_t v41 = (float *)&a1[HIDWORD(v147)];
        float v160 = v41[51];
        float v157 = v41[39];
        float v135 = v41[45];
        unsigned int v42 = v38 >> 2;
        float v134 = (_DWORD *)(a5 + 24 * HIDWORD(v147) + 16);
        uint64_t v151 = (*v134 * v34) >> 2;
        uint64_t v43 = 0;
        uint64_t v132 = (_DWORD *)(a6 + 24 * HIDWORD(v147) + 16);
        float v133 = (_DWORD *)(a4 + 24 * HIDWORD(v147) + 16);
        uint64_t v150 = (*v132 * v34) >> 2;
        LODWORD(v41) = *v133 * v34;
        unsigned int v125 = v41 & 0xFFFFFFFC;
        uint64_t v155 = 2 * (v41 >> 2);
        uint64_t v156 = v41 >> 2;
        uint64_t v154 = 3 * (v41 >> 2);
        if (v34 <= 1) {
          int v44 = 1;
        }
        else {
          int v44 = v34;
        }
        int v129 = v44;
        uint64_t v45 = 4 * v162;
        uint64_t v131 = v28;
        uint64_t v130 = v40;
LABEL_45:
        if (v43 == v40) {
          goto LABEL_155;
        }
        unsigned int v46 = 0;
        uint64_t v141 = v125 * v43;
        int v140 = v42 * v43;
        int v128 = v162 * v43;
        uint64_t v124 = v43;
        int v138 = v150 * v43;
        int v139 = v151 * v43;
LABEL_48:
        if (v169 == -1)
        {
          uint64_t v47 = *v127 + 4 * v128 * a1[394] + ((*(_DWORD *)(v126 + 16) * v46) & 0xFFFFFFFC);
          unsigned int v48 = v165;
        }
        else
        {
          uint64_t v47 = 0;
          unsigned int v48 = v168;
        }
        uint64_t v49 = 0;
        uint64_t v50 = *(void *)(a4 + 24 * HIDWORD(v147)) + 4 * v141 + ((*v133 * v46) & 0xFFFFFFFC);
        uint64_t v166 = *v136 + 4 * v140 * *v48 + 4 * ((*v137 * v46) >> 2);
        uint64_t v153 = *(void *)(a5 + 24 * HIDWORD(v147)) + 4 * v139 * a1[371] + 4 * *v134 * v46;
        uint64_t v152 = *(void *)(a6 + 24 * HIDWORD(v147)) + 4 * v138 * a1[384] + 4 * *v132 * v46;
        unsigned int v144 = v46;
        float v51 = v135 + (float)((float)v46 * v160);
        unint64_t v52 = (float *)(v47 + v45);
        uint64_t v164 = v47;
        while (1)
        {
          uint64_t v172 = (float *)v50;
          uint64_t v54 = v166 + 4 * v49;
          uint64_t v55 = *v168;
          if (v169 == -1)
          {
            unsigned int v171 = v18;
            uint64_t v71 = *v165;
            if (v71)
            {
              uint64_t v72 = 0;
              float v73 = -INFINITY;
              do
              {
                if (*(float *)(v54 + 4 * v42 * v72) > v73)
                {
                  LODWORD(v55) = v72;
                  float v73 = *(float *)(v54 + 4 * v42 * v72);
                }
                ++v72;
              }
              while (v71 != v72);
            }
            else
            {
              float v73 = -INFINITY;
            }
            unsigned int v75 = (float *)(v47 + 4 * v49);
            float v76 = *v75;
            unsigned int v77 = a1[394] * v162;
            if (v162 < v77)
            {
              float v78 = &v75[v77];
              float v79 = v52;
              do
              {
                if (*v79 > v76) {
                  float v76 = *v79;
                }
                float v79 = (float *)((char *)v79 + v45);
              }
              while (v79 < v78);
            }
            uint64_t v74 = a1[v55 + 365];
            if ((float)(v73 - v76) >= *(float *)(v17 + 4 * v74))
            {
              unint64_t v170 = v52;
              if (v71)
              {
                int v80 = 0;
                uint64_t v55 = v55;
                float v81 = 0.0;
                float v67 = -INFINITY;
                do
                {
                  float v82 = expf(*(float *)(v54 + 4 * v42 * v80));
                  if (!v55) {
                    float v67 = v82;
                  }
                  float v81 = v81 + v82;
                  ++v80;
                  --v55;
                  --v71;
                }
                while (v71);
              }
              else
              {
                float v81 = 0.0;
                float v67 = -INFINITY;
              }
              float v66 = expf(v76) + v81;
LABEL_105:
              uint64_t v53 = v172;
              int v30 = HIDWORD(v147);
              float v83 = v67 / v66;
              uint64_t v45 = 4 * v162;
              uint64_t v18 = v171;
              uint64_t v47 = v164;
              unint64_t v52 = v170;
              if (v83 > *(float *)&v163[v74])
              {
                if (v171 >= a12) {
                  acDetBboxCoderDecodeAllFloat();
                }
                float v84 = (float)a1[5];
                float v85 = *(float *)(a8 + 4 * v147) / v84;
                float v86 = v85 * expf(v172[v154]);
                float v87 = (float)a1[6];
                float v88 = *(float *)(a7 + 4 * v147) / v87;
                v96.n128_f32[0] = v88 * expf(v172[v155]);
                float v89 = (float)(v157 + (float)((float)v49 * v160)) / v87;
                float v90 = (float)(v89 + (float)(*v172 * v88)) + (float)(v96.n128_f32[0] * -0.5);
                uint64_t v91 = a11 + 36 * v171;
                v96.n128_f32[0] = v96.n128_f32[0] + v90;
                float v92 = (float)((float)(v51 / v84) + (float)(v172[v156] * v85)) + (float)(v86 * -0.5);
                *(float *)uint64_t v91 = v90;
                *(float *)(v91 + 4) = v92;
                *(_DWORD *)(v91 + 8) = v96.n128_u32[0];
                *(float *)(v91 + 12) = v86 + v92;
                *(_DWORD *)(v91 + 16) = v74;
                *(float *)(v91 + 20) = v83;
                float v93 = v89 + (float)(v88 * -0.5);
                float v94 = (float)(v51 / v84) + (float)(v85 * -0.5);
                v96.n128_f32[0] = (float)((float)(v93 + (float)(v88 + v93)) * -0.5)
                                + (float)((float)(v90 + v96.n128_f32[0]) * 0.5);
                float v95 = (float)((float)(v94 + (float)(v85 + v94)) * -0.5)
                    + (float)((float)(v92 + (float)(v86 + v92)) * 0.5);
                v96.n128_f32[0] = (float)(1.0 - v83)
                                + sqrtf((float)((float)(v95 / (float)((float)(v85 + v94) - v94))* (float)(v95 / (float)((float)(v85 + v94) - v94)))+ (float)((float)(v96.n128_f32[0] / (float)((float)(v88 + v93) - v93))* (float)(v96.n128_f32[0] / (float)((float)(v88 + v93) - v93))));
                *(_DWORD *)(v91 + 32) = v96.n128_u32[0];
                if (v74 == 1)
                {
                  unsigned int v97 = *(float32x4_t **)a13;
                  uint64_t v98 = a1[371];
                  uint64_t v99 = v98;
                  uint64_t v100 = *(float32x4_t **)a13;
                  uint64_t v101 = (unsigned __int32 *)v153;
                  if (v98)
                  {
                    do
                    {
                      v96.n128_u32[0] = *v101;
                      v100->i32[0] = *v101;
                      uint64_t v100 = (float32x4_t *)((char *)v100 + 4);
                      v101 += v151;
                      --v99;
                    }
                    while (v99);
                  }
                  bmSoftmax(v97, v97->f32, v98, v96);
                  unsigned int v103 = a1[371];
                  if (*(_DWORD *)(a13 + 12) != v103) {
                    acDetBboxCoderDecodeAll();
                  }
                  if (v103 < 2)
                  {
                    uint64_t v104 = 0;
                    uint64_t v107 = v150;
                  }
                  else
                  {
                    LODWORD(v104) = 0;
                    float v105 = **(float **)a13;
                    uint64_t v106 = 1;
                    uint64_t v107 = v150;
                    do
                    {
                      float v108 = *(float *)(*(void *)a13 + 4 * v106);
                      if (v108 <= v105) {
                        uint64_t v104 = v104;
                      }
                      else {
                        uint64_t v104 = v106;
                      }
                      if (v108 > v105) {
                        float v105 = *(float *)(*(void *)a13 + 4 * v106);
                      }
                      ++v106;
                    }
                    while (v103 != v106);
                  }
                  v102.n128_f32[0] = (float)(int)v149[v104];
                  *(_DWORD *)(a11 + 36 * v171 + 24) = v102.n128_u32[0];
                  uint64_t v110 = *(float32x4_t **)a14;
                  uint64_t v111 = a1[384];
                  uint64_t v112 = v111;
                  unsigned int v113 = *(float32x4_t **)a14;
                  unsigned int v114 = (unsigned __int32 *)v152;
                  if (v111)
                  {
                    do
                    {
                      v102.n128_u32[0] = *v114;
                      v113->i32[0] = *v114;
                      unsigned int v113 = (float32x4_t *)((char *)v113 + 4);
                      v114 += v107;
                      --v112;
                    }
                    while (v112);
                  }
                  bmSoftmax(v110, v110->f32, v111, v102);
                  unsigned int v115 = a1[384];
                  if (*(_DWORD *)(a14 + 12) != v115) {
                    acDetBboxCoderDecodeAll();
                  }
                  if (v115 < 2)
                  {
                    uint64_t v116 = 0;
                    uint64_t v45 = 4 * v162;
                    uint64_t v47 = v164;
                  }
                  else
                  {
                    LODWORD(v116) = 0;
                    float v117 = **(float **)a14;
                    uint64_t v118 = 1;
                    uint64_t v45 = 4 * v162;
                    uint64_t v47 = v164;
                    do
                    {
                      float v119 = *(float *)(*(void *)a14 + 4 * v118);
                      if (v119 <= v117) {
                        uint64_t v116 = v116;
                      }
                      else {
                        uint64_t v116 = v118;
                      }
                      if (v119 > v117) {
                        float v117 = *(float *)(*(void *)a14 + 4 * v118);
                      }
                      ++v118;
                    }
                    while (v115 != v118);
                  }
                  float v109 = (float)(int)v148[v116];
                }
                else
                {
                  *(_DWORD *)(a11 + 36 * v171 + 24) = 0;
                  float v109 = 0.0;
                  uint64_t v45 = 4 * v162;
                  uint64_t v47 = v164;
                }
                *(float *)(a11 + 36 * v171 + 28) = v109;
                uint64_t v18 = v171 + 1;
                int v30 = HIDWORD(v147);
                if (v18 >= a12) {
                  return v18;
                }
              }
              goto LABEL_54;
            }
            uint64_t v18 = v171;
          }
          else
          {
            if (!v55)
            {
              unint64_t v170 = v52;
              unsigned int v171 = v18;
              unsigned int v61 = 0;
              float v66 = 0.0;
              float v67 = -INFINITY;
LABEL_89:
              uint64_t v74 = a1[v61 + 365];
              uint64_t v17 = a2;
              goto LABEL_105;
            }
            uint64_t v56 = 0;
            unsigned int v57 = 0;
            BOOL v58 = 0;
            float v59 = -INFINITY;
            float v60 = -INFINITY;
            unsigned int v61 = *v168;
            do
            {
              float v62 = *(float *)(v54 + 4 * v42 * v56);
              if (v57 < *v165 && v56 == a1[6 * v30 + 309 + v57])
              {
                if (v62 > v60)
                {
                  BOOL v58 = (float)(v62 - v59) < *(float *)(v17 + 4 * a1[v57 + 365]);
                  unsigned int v61 = v57;
                  float v60 = *(float *)(v54 + 4 * v42 * v56);
                }
                ++v57;
              }
              else if (v62 > v59)
              {
                if (v61 == v55) {
                  unsigned int v61 = *v168;
                }
                else {
                  BOOL v58 = (float)(v60 - v62) < *(float *)(v17 + 4 * a1[v61 + 365]);
                }
                float v59 = *(float *)(v54 + 4 * v42 * v56);
              }
              ++v56;
            }
            while (v55 != v56);
            if (!v58)
            {
              unint64_t v170 = v52;
              unsigned int v171 = v18;
              uint64_t v63 = 0;
              unsigned int v64 = 0;
              unsigned int v65 = *v165;
              float v66 = 0.0;
              float v67 = -INFINITY;
              do
              {
                float v68 = expf(*(float *)(v54 + 4 * v42 * v63));
                if (v64 < v65)
                {
                  int v69 = v68 <= v67 ? v61 : v64;
                  float v70 = v68 <= v67 ? v67 : v68;
                  if (v63 == a1[6 * HIDWORD(v147) + 309 + v64])
                  {
                    unsigned int v61 = v69;
                    float v67 = v70;
                    ++v64;
                  }
                }
                float v66 = v66 + v68;
                ++v63;
              }
              while (v55 != v63);
              goto LABEL_89;
            }
          }
          uint64_t v53 = v172;
LABEL_54:
          uint64_t v50 = (uint64_t)(v53 + 1);
          ++v49;
          ++v52;
          if (v49 == v167)
          {
            unsigned int v46 = v144 + 1;
            int v20 = HIDWORD(v147);
            uint64_t v40 = v130;
            if (v144 + 1 != v129) {
              goto LABEL_48;
            }
            LODWORD(v147) = v147 + 1;
            uint64_t v43 = v124 + 1;
            if (v124 + 1 == v131)
            {
              unsigned int v16 = a1[26];
              goto LABEL_6;
            }
            goto LABEL_45;
          }
        }
      }
      unsigned int v122 = v28 - 1;
      LODWORD(v147) = v39 + v28;
      if (v169 == -1)
      {
        while (v40 > v122)
        {
          LODWORD(v28) = v28 - 1;
          if (!v28) {
            goto LABEL_6;
          }
        }
      }
      else
      {
        while (v40 > v122)
        {
          LODWORD(v28) = v28 - 1;
          if (!v28) {
            goto LABEL_6;
          }
        }
      }
    }
LABEL_155:
    acDetBboxCoderDecodeAllFloat();
  }
  return 0;
}

float acDetBboxCoderRectToDetRect(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = a3 + v3;
      float result = *(float *)(a1 + v3 + 28);
      long long v6 = *(_OWORD *)(a1 + v3);
      *(_DWORD *)(v4 + 16) = *(_DWORD *)(a1 + v3 + 16);
      uint64_t v7 = *(void *)(a1 + v3 + 20);
      *(_OWORD *)uint64_t v4 = v6;
      *(void *)(v4 + 24) = v7;
      *(float *)(v4 + 32) = result;
      v3 += 36;
    }
    while (a1 + v3 < a1 + 36 * (unint64_t)a2);
  }
  return result;
}

__n128 acObjectFromFace@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  __n128 result = *(__n128 *)(a1 + 12);
  *(__n128 *)(a2 + 12) = result;
  *(_DWORD *)(a2 + 28) = *(_DWORD *)(a1 + 88);
  return result;
}

__n128 acObjectToFace@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 60) = 0u;
  *(_OWORD *)(a2 + 44) = 0u;
  *(_OWORD *)(a2 + 28) = 0u;
  *(_OWORD *)a2 = *(_OWORD *)a1;
  __n128 result = *(__n128 *)(a1 + 12);
  *(__n128 *)(a2 + 12) = result;
  *(_DWORD *)(a2 + 88) = *(_DWORD *)(a1 + 28);
  return result;
}

float bmActivationSigmoid(float a1)
{
  return 1.0 / (float)(expf(-a1) + 1.0);
}

float bmActivationTanh(float a1)
{
  float v1 = expf(a1 + a1);
  if (v1 == INFINITY) {
    return 1.0;
  }
  else {
    return (float)(v1 + -1.0) / (float)(v1 + 1.0);
  }
}

void bmActivationSigmoid(unint64_t a1, unsigned int a2, int a3, int a4)
{
  if (a3)
  {
    int v4 = a3;
    if (a2)
    {
      int v6 = 0;
      uint64_t v7 = a4 - 4 * a2;
      uint64_t v8 = 4 * a2;
      __asm { FMOV            V0.4S, #1.0 }
      float32x4_t v26 = _Q0;
      uint64_t v25 = a2;
      do
      {
        std::string v14 = (float *)(v8 + a1);
        if (v8 + a1 <= a1 + 4) {
          std::string v14 = (float *)(a1 + 4);
        }
        unint64_t v15 = (unint64_t)v14 + ~a1;
        unsigned int v16 = (float *)a1;
        if (v15 < 0xC) {
          goto LABEL_16;
        }
        uint64_t v17 = (v15 >> 2) + 1;
        unsigned int v16 = (float *)(a1 + 4 * (v17 & 0x7FFFFFFFFFFFFFFCLL));
        uint64_t v18 = v17 & 0x7FFFFFFFFFFFFFFCLL;
        unsigned int v19 = (float32x4_t *)a1;
        do
        {
          float32x4_t v30 = vnegq_f32(*v19);
          float v27 = expf(v30.f32[1]);
          v20.f32[0] = expf(v30.f32[0]);
          v20.f32[1] = v27;
          float32x4_t v28 = v20;
          float v21 = expf(v30.f32[2]);
          float32x4_t v22 = v28;
          v22.f32[2] = v21;
          float32x4_t v29 = v22;
          float v23 = expf(v30.f32[3]);
          float32x4_t v24 = v29;
          v24.f32[3] = v23;
          *v19++ = vdivq_f32(v26, vaddq_f32(v24, v26));
          v18 -= 4;
        }
        while (v18);
        if (v17 != (v17 & 0x7FFFFFFFFFFFFFFCLL))
        {
LABEL_16:
          do
          {
            *unsigned int v16 = 1.0 / (float)(expf(-*v16) + 1.0);
            ++v16;
          }
          while ((unint64_t)v16 < a1 + 4 * v25);
        }
        a1 = (unint64_t)v16 + v7;
        ++v6;
      }
      while (v6 != v4);
    }
    else
    {
      do
        --v4;
      while (v4);
    }
  }
}

void bmActivationSigmoid(const signed __int8 *a1, unsigned int a2, int a3, int a4, float a5, unsigned __int8 *a6, int a7)
{
  if (a3)
  {
    int v12 = 0;
    uint64_t v13 = a7 - a2;
    uint64_t v14 = a4 - a2;
    uint64_t v15 = a2;
    do
    {
      if (a2)
      {
        unsigned int v16 = &a1[v15];
        do
        {
          int v17 = *a1++;
          float v18 = expf(-(float)((float)v17 * a5));
          *a6++ = (int)bmClamp((float)((float)(1.0 / (float)(v18 + 1.0)) * 255.0) + 0.5, 0.0, 255.0);
        }
        while (a1 < v16);
      }
      a1 += v14;
      a6 += v13;
      ++v12;
    }
    while (v12 != a3);
  }
}

void bmActivationTanh(unint64_t a1, unsigned int a2, int a3, int a4)
{
  if (a3)
  {
    int v4 = a3;
    if (a2)
    {
      int v6 = 0;
      uint64_t v7 = 4 * a2;
      uint64_t v8 = a4 - 4 * a2;
      __asm { FMOV            V0.4S, #-1.0 }
      float32x4_t v31 = _Q0;
      float32x4_t v32 = (float32x4_t)vdupq_n_s32(0x7F800000u);
      __asm { FMOV            V0.4S, #1.0 }
      float32x4_t v30 = _Q0;
      uint64_t v28 = v8;
      uint64_t v29 = a2;
      do
      {
        uint64_t v15 = (float *)(v7 + a1);
        if (v7 + a1 <= a1 + 4) {
          uint64_t v15 = (float *)(a1 + 4);
        }
        unint64_t v16 = (unint64_t)v15 + ~a1;
        int v17 = (float *)a1;
        if (v16 < 0xC) {
          goto LABEL_18;
        }
        uint64_t v18 = (v16 >> 2) + 1;
        int v17 = (float *)(a1 + 4 * (v18 & 0x7FFFFFFFFFFFFFFCLL));
        uint64_t v19 = v18 & 0x7FFFFFFFFFFFFFFCLL;
        float32x4_t v20 = (float32x4_t *)a1;
        do
        {
          float32x4_t v36 = vaddq_f32(*v20, *v20);
          float v33 = expf(v36.f32[1]);
          v21.f32[0] = expf(v36.f32[0]);
          v21.f32[1] = v33;
          float32x4_t v34 = v21;
          float v22 = expf(v36.f32[2]);
          float32x4_t v23 = v34;
          v23.f32[2] = v22;
          float32x4_t v35 = v23;
          float v24 = expf(v36.f32[3]);
          float32x4_t v25 = v35;
          v25.f32[3] = v24;
          *(int8x16_t *)v20++ = vbslq_s8((int8x16_t)vceqq_f32(v25, v32), (int8x16_t)v30, (int8x16_t)vdivq_f32(vaddq_f32(v25, v31), vaddq_f32(v25, v30)));
          v19 -= 4;
        }
        while (v19);
        uint64_t v8 = v28;
        if (v18 != (v18 & 0x7FFFFFFFFFFFFFFCLL))
        {
LABEL_18:
          do
          {
            float v26 = expf(*v17 + *v17);
            float v27 = 1.0;
            if (v26 != INFINITY) {
              float v27 = (float)(v26 + -1.0) / (float)(v26 + 1.0);
            }
            *v17++ = v27;
          }
          while ((unint64_t)v17 < a1 + 4 * v29);
        }
        a1 = (unint64_t)v17 + v8;
        ++v6;
      }
      while (v6 != v4);
    }
    else
    {
      do
        --v4;
      while (v4);
    }
  }
}

void bmMunkres(float *a1, unsigned int a2, unsigned __int8 *a3, unsigned int a4, unsigned int *a5, unsigned int a6, unsigned int *a7)
{
  if (!a2) {
    bmMunkres();
  }
  if (a6 < a2) {
    bmMunkres();
  }
  if (a2 == 1
    || (v270 = 0,
        long long v268 = 0u,
        long long v269 = 0u,
        long long v266 = 0u,
        long long v267 = 0u,
        bmMunkresGetTempBuffers(a2, (uint64_t)a3, a4, (uint64_t)&v266),
        !(void)v268))
  {
    *a5 = 0;
    return;
  }
  uint64_t v12 = 0;
  int v13 = 4 * a2;
  do
  {
    unsigned int v14 = 0;
    uint64_t v15 = &a1[v12];
    float v16 = 3.4028e38;
    uint64_t v17 = a2;
    unsigned int v18 = a2;
    do
    {
      if (*(float *)((char *)v15 + v14) < v16)
      {
        float v16 = *(float *)((char *)v15 + v14);
        unsigned int v18 = v12;
      }
      v14 += v13;
      --v17;
    }
    while (v17);
    if (v16 < 0.0) {
      bmMunkres();
    }
    if (v18 >= a2) {
      bmMunkres();
    }
    if (v16 > 0.0)
    {
      unsigned int v19 = 0;
      uint64_t v20 = a2;
      do
      {
        *(float *)((char *)v15 + v19) = *(float *)((char *)v15 + v19) - v16;
        v19 += v13;
        --v20;
      }
      while (v20);
    }
    ++v12;
  }
  while (v12 != a2);
  unsigned int v21 = 0;
  uint64_t v22 = 0;
  do
  {
    uint64_t v23 = 0;
    float v24 = (float32x4_t *)((char *)a1 + v21 + 16);
    v11.i32[0] = 2139095039;
    unsigned int v26 = a2;
    do
    {
      float32x4_t v25 = (char *)a1 + v21;
      if (*(float *)&v25[4 * v23] < *(float *)v11.i32)
      {
        v11.i32[0] = *(_DWORD *)&v25[4 * v23];
        unsigned int v26 = v23;
      }
      ++v23;
    }
    while (a2 != v23);
    if (*(float *)v11.i32 < 0.0) {
      bmMunkres();
    }
    if (v26 >= a2) {
      bmMunkres();
    }
    if (*(float *)v11.i32 > 0.0)
    {
      if (a2 < 8)
      {
        uint64_t v27 = 0;
LABEL_33:
        uint64_t v31 = a2 - v27;
        float32x4_t v32 = (float *)((char *)&a1[v27] + v21);
        do
        {
          float *v32 = *v32 - *(float *)v11.i32;
          ++v32;
          --v31;
        }
        while (v31);
        goto LABEL_20;
      }
      float32x4_t v28 = (float32x4_t)vdupq_lane_s32(v11, 0);
      uint64_t v29 = a2 & 0xFFFFFFF8;
      do
      {
        float32x4_t v30 = vsubq_f32(*v24, v28);
        v24[-1] = vsubq_f32(v24[-1], v28);
        float32x4_t *v24 = v30;
        v24 += 2;
        v29 -= 8;
      }
      while (v29);
      uint64_t v27 = a2 & 0xFFFFFFF8;
      if (v27 != a2) {
        goto LABEL_33;
      }
    }
LABEL_20:
    ++v22;
    v21 += v13;
  }
  while (v22 != a2);
  uint64_t v259 = a2 & 0xFFFFFFF8;
  v246 = a7;
  float v33 = (char *)v266;
  if (!(void)v266) {
LABEL_293:
  }
    bmMunkres();
  float32x4_t v34 = (int8x16_t *)*((void *)&v267 + 1);
  float32x4_t v35 = (int8x16_t *)v267;
  int v249 = a2 * a2 + 8 * a2 + v13 + 6;
  size_t v247 = 4 * a2;
  int32x4_t v248 = vdupq_n_s32(a2);
  unsigned int v36 = DWORD2(v266);
  v260 = a1;
  int v265 = 4 * a2;
LABEL_39:
  v257 = v34;
  v263 = v33;
  BmMixedBufSize::BmMixedBufSize((BmMixedBufSize *)&v271);
  if (v272) {
    rtcv::simImageChMeanTempBytes();
  }
  size_t v37 = (v249 + v271);
  int v271 = v37;
  if (v37 > v36) {
    bmMunkres();
  }
  v256 = v35;
  unint64_t v38 = (unint64_t)(v263 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  unsigned int v39 = v38 + v13 - v263;
  unsigned int v272 = v39;
  if (v37 < v39) {
    rtcv::simImageChMean();
  }
  unint64_t v40 = (unint64_t)&v263[v39 + 3] & 0xFFFFFFFFFFFFFFFCLL;
  unsigned int v41 = v40 + v13 - v263;
  unsigned int v272 = v41;
  if (v37 < v41) {
    rtcv::simImageChMean();
  }
  uint64_t v42 = (v40 + v13 - v263);
  uint64_t v43 = &v263[v42];
  unsigned int v44 = a2 * a2 + v41;
  unsigned int v272 = v44;
  if (v37 < v44) {
    rtcv::simImageChMean();
  }
  uint64_t v45 = v44;
  unsigned int v46 = &v263[v44];
  unsigned int v47 = a2 - v263;
  unsigned int v272 = a2 - v263 + v46;
  if (v37 < v272) {
    rtcv::simImageChMean();
  }
  unsigned int v48 = (int8x8_t *)&v263[a2 - v263 + v46];
  unsigned int v49 = v47 + a2 + v46;
  unsigned int v272 = v49;
  if (v37 < v49) {
    rtcv::simImageChMean();
  }
  unsigned int v50 = a2 + a2 + v46;
  unsigned int v272 = a2 + v49;
  if (v37 < a2 + v49) {
    rtcv::simImageChMean();
  }
  uint64_t v250 = v47 + v50;
  unsigned int v272 = a2 + a2 + v47 + a2 + v46;
  if (v37 < v272) {
    rtcv::simImageChMean();
  }
  uint64_t v258 = v42;
  uint64_t v251 = a2 - v263 + v46;
  v252 = &v263[v47 + a2 + v46];
  uint64_t v253 = v47 + a2 + v46;
  v254 = v46;
  uint64_t v255 = v45;
  v261 = (int8x8_t *)&v263[v47 + v50];
  bzero(v263, v37);
  if (a2 < 8)
  {
    uint64_t v51 = 0;
    v52.i64[0] = 0x100000001;
    v52.i64[1] = 0x100000001;
    v53.i64[0] = 0x101010101010101;
    v53.i64[1] = 0x101010101010101;
    uint64_t v55 = v261;
    uint64_t v54 = v263;
    uint64_t v56 = v258;
    goto LABEL_53;
  }
  uint64_t v56 = v258;
  uint64_t v57 = a2 & 0xFFFFFFF8;
  BOOL v58 = a5 + 4;
  v52.i64[0] = 0x100000001;
  v52.i64[1] = 0x100000001;
  v53.i64[0] = 0x101010101010101;
  v53.i64[1] = 0x101010101010101;
  do
  {
    *((int32x4_t *)v58 - 1) = v248;
    *(int32x4_t *)BOOL v58 = v248;
    v58 += 8;
    v57 -= 8;
  }
  while (v57);
  uint64_t v51 = a2 & 0xFFFFFFF8;
  uint64_t v55 = v261;
  uint64_t v54 = v263;
  if (v259 != a2)
  {
LABEL_53:
    uint64_t v59 = a2 - v51;
    float v60 = &a5[v51];
    do
    {
      *v60++ = a2;
      --v59;
    }
    while (v59);
  }
  unsigned int v61 = 0;
  unsigned int v62 = 0;
  uint64_t v63 = 0;
  do
  {
    unsigned int v64 = &v54[v56 + v62];
    unsigned int v65 = (_DWORD *)v40;
    uint64_t v66 = a2;
    float v67 = (float *)((char *)a1 + v61);
    do
    {
      while (*v67 > 0.000001)
      {
        *v64++ = 1;
        ++v65;
        ++v67;
        if (!--v66) {
          goto LABEL_56;
        }
      }
      if (*v67 < 0.0) {
        bmMunkres();
      }
      ++*v65++;
      ++*(_DWORD *)(v38 + 4 * v63);
      ++v64;
      ++v67;
      --v66;
    }
    while (v66);
LABEL_56:
    ++v63;
    v62 += a2;
    v61 += v265;
  }
  while (v63 != a2);
  char v68 = 0;
  uint64_t v69 = 0;
  while (1)
  {
    if (*(_DWORD *)(v38 + 4 * v69) == 1)
    {
      uint64_t v70 = 0;
      uint64_t v71 = &v43[v69 * a2];
      do
      {
        int v72 = v71[v70];
        if (!v71[v70])
        {
          v48->i8[v69] = 1;
          v71[v70] = 2;
          uint64_t v73 = v70;
          a5[v73] = v69;
          --*(_DWORD *)(v38 + 4 * v69);
          *(_DWORD *)(v40 + v73 * 4) = *(_DWORD *)(v40 + 4 * v70) - 1;
          uint64_t v74 = &v43[v70];
          uint64_t v75 = v69;
          uint64_t v76 = a2;
          unsigned int v77 = (_DWORD *)((unint64_t)(v263 + 3) & 0xFFFFFFFFFFFFFFFCLL);
          do
          {
            if (v75 && !v74[v72])
            {
              v74[v72] = 3;
              --*(_DWORD *)(v40 + 4 * v70);
              --*v77;
            }
            ++v77;
            v72 += a2;
            --v75;
            --v76;
          }
          while (v76);
          char v68 = 1;
        }
        ++v70;
      }
      while (v70 != a2);
    }
    if (++v69 == a2)
    {
      uint64_t v78 = 0;
      char v79 = v68;
      do
      {
        if (*(_DWORD *)(v40 + 4 * v78) == 1)
        {
          unsigned int v80 = 0;
          uint64_t v81 = 0;
          do
          {
            float v82 = &v43[v81 * a2];
            if (!v82[v78])
            {
              uint64_t v83 = 0;
              v48->i8[v81] = 1;
              v82[v78] = 2;
              uint64_t v84 = v78;
              a5[v84] = v81;
              --*(_DWORD *)(v38 + 4 * v81);
              float v85 = &v54[v56 + v80];
              *(_DWORD *)(v40 + v84 * 4) = *(_DWORD *)(v40 + 4 * v78) - 1;
              do
              {
                if (v78 != v83 && !v85[v83])
                {
                  v85[v83] = 3;
                  --*(_DWORD *)(v38 + 4 * v81);
                  --*(_DWORD *)(v40 + 4 * v83);
                }
                ++v83;
              }
              while (a2 != v83);
              char v79 = 1;
            }
            ++v81;
            v80 += a2;
          }
          while (v81 != a2);
        }
        ++v78;
      }
      while (v78 != a2);
      char v68 = 0;
      uint64_t v69 = 0;
      if ((v79 & 1) == 0) {
        break;
      }
    }
  }
  char v86 = 0;
  uint64_t v87 = 0;
  do
  {
    if (*(_DWORD *)(v38 + 4 * v87))
    {
      uint64_t v88 = 0;
      float v89 = &v43[v87 * a2];
      char v90 = 1;
      do
      {
        if (!v89[v88])
        {
          if (v90)
          {
            int v91 = 0;
            uint64_t v92 = 0;
            v48->i8[v87] = 1;
            v89[v88] = 2;
            a5[v88] = v87;
            v55->i8[v88] = 1;
            --*(_DWORD *)(v38 + 4 * v87);
            --*(_DWORD *)(v40 + 4 * v88);
            float v93 = &v43[v88];
            do
            {
              if (v87 != v92 && !v93[v91])
              {
                v93[v91] = 3;
                --*(_DWORD *)(v40 + 4 * v88);
                --*(_DWORD *)(v38 + 4 * v92);
              }
              ++v92;
              v91 += a2;
            }
            while (a2 != v92);
            char v90 = 0;
            char v86 = 1;
          }
          else
          {
            char v90 = 0;
            v89[v88] = 3;
            --*(_DWORD *)(v38 + 4 * v87);
            --*(_DWORD *)(v40 + 4 * v88);
          }
        }
        ++v88;
      }
      while (v88 != a2);
    }
    ++v87;
  }
  while (v87 != a2);
  uint64_t v94 = 0;
  if (a2 < 8)
  {
    unsigned int v97 = v256;
    uint64_t v95 = v253;
    uint64_t v98 = v254;
    __n128 v96 = v252;
  }
  else
  {
    __n128 v96 = v252;
    uint64_t v95 = v253;
    unsigned int v97 = v256;
    uint64_t v98 = v254;
    if ((unint64_t)(v252 - (char *)v48) >= 8)
    {
      uint64_t v99 = &v54[v253 + 3];
      uint64_t v100 = a2 & 0xFFFFFFF8;
      while (1)
      {
        int8x8_t v101 = vceqz_s8(*v48);
        if (v101.i8[0])
        {
          *(v99 - 3) = 1;
          if ((v101.i8[1] & 1) == 0) {
            goto LABEL_108;
          }
        }
        else if ((v101.i8[1] & 1) == 0)
        {
LABEL_108:
          if (v101.i8[2]) {
            goto LABEL_109;
          }
          goto LABEL_117;
        }
        *(v99 - 2) = 1;
        if (v101.i8[2])
        {
LABEL_109:
          *(v99 - 1) = 1;
          if ((v101.i8[3] & 1) == 0) {
            goto LABEL_110;
          }
          goto LABEL_118;
        }
LABEL_117:
        if ((v101.i8[3] & 1) == 0)
        {
LABEL_110:
          if (v101.i8[4]) {
            goto LABEL_111;
          }
          goto LABEL_119;
        }
LABEL_118:
        *uint64_t v99 = 1;
        if (v101.i8[4])
        {
LABEL_111:
          v99[1] = 1;
          if ((v101.i8[5] & 1) == 0) {
            goto LABEL_112;
          }
          goto LABEL_120;
        }
LABEL_119:
        if ((v101.i8[5] & 1) == 0)
        {
LABEL_112:
          if (v101.i8[6]) {
            goto LABEL_113;
          }
          goto LABEL_121;
        }
LABEL_120:
        v99[2] = 1;
        if (v101.i8[6])
        {
LABEL_113:
          v99[3] = 1;
          if (v101.i8[7]) {
            goto LABEL_122;
          }
          goto LABEL_105;
        }
LABEL_121:
        if (v101.i8[7]) {
LABEL_122:
        }
          v99[4] = 1;
LABEL_105:
        ++v48;
        v99 += 8;
        v100 -= 8;
        if (!v100)
        {
          uint64_t v94 = a2 & 0xFFFFFFF8;
          if (v259 == a2) {
            goto LABEL_124;
          }
          break;
        }
      }
    }
  }
  float v119 = &v54[v94 + v95];
  uint64_t v120 = a2 - v94;
  unsigned int v121 = &v54[v94 + v251];
  do
  {
    if (!*v121++) {
      *float v119 = 1;
    }
    ++v119;
    --v120;
  }
  while (v120);
LABEL_124:
  char v102 = 0;
  uint64_t v103 = 0;
  do
  {
    if (v96[v103])
    {
      uint64_t v104 = &v43[v103 * a2];
      float v105 = v98;
      uint64_t v106 = a2;
      uint64_t v107 = a5;
      char v108 = v102;
      do
      {
        int v110 = *v104++;
        int v109 = v110;
        if ((v110 == 3 || v109 == 0) && !*v105)
        {
          char v108 = 1;
          *float v105 = 1;
          uint64_t v112 = *v107;
          if (v112 < a2 && !v96[v112]) {
            v96[v112] = 1;
          }
        }
        ++v107;
        ++v105;
        --v106;
      }
      while (v106);
    }
    else
    {
      char v108 = v102;
    }
    BOOL v113 = v103 + 1 == a2;
    char v102 = (v103 + 1 != a2) & v108;
    if (v103 + 1 == a2) {
      uint64_t v103 = 0;
    }
    else {
      ++v103;
    }
  }
  while (!v113 || (v108 & 1) != 0);
  unsigned int v114 = 0;
  uint64_t v115 = 0;
  if (a2 < 8)
  {
    uint64_t v117 = a2 & 0xFFFFFFE0;
    uint64_t v116 = v257;
    goto LABEL_161;
  }
  uint64_t v116 = v257;
  uint64_t v117 = a2 & 0xFFFFFFE0;
  if ((unint64_t)((char *)v257 - v96) < 0x20)
  {
LABEL_161:
    uint64_t v148 = a2 - v115;
    unsigned int v149 = (BOOL *)&v116->i8[v115];
    uint64_t v150 = &v54[v115 + v95];
    do
    {
      int v151 = *v150++;
      *v149++ = v151 == 0;
      if (!v151) {
        ++v114;
      }
      --v148;
    }
    while (v148);
  }
  else if (a2 >= 0x20)
  {
    int32x4_t v123 = 0uLL;
    int32x4_t v124 = 0uLL;
    unsigned int v125 = (int8x16_t *)&v54[v95 + 16];
    uint64_t v126 = v257 + 1;
    uint64_t v127 = a2 & 0xFFFFFFE0;
    int32x4_t v128 = 0uLL;
    int32x4_t v129 = 0uLL;
    int32x4_t v130 = 0uLL;
    int32x4_t v131 = 0uLL;
    int32x4_t v132 = 0uLL;
    int32x4_t v133 = 0uLL;
    do
    {
      int8x16_t v134 = vceqzq_s8(v125[-1]);
      int8x16_t v135 = vceqzq_s8(*v125);
      v126[-1] = vandq_s8(v134, v53);
      *uint64_t v126 = vandq_s8(v135, v53);
      uint16x8_t v136 = vmovl_u8(*(uint8x8_t *)v134.i8);
      uint16x8_t v137 = vmovl_high_u8((uint8x16_t)v134);
      uint16x8_t v138 = vmovl_u8(*(uint8x8_t *)v135.i8);
      uint16x8_t v139 = vmovl_high_u8((uint8x16_t)v135);
      int32x4_t v129 = vaddq_s32(v129, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v137), v52));
      int32x4_t v128 = vaddq_s32(v128, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v137.i8), v52));
      int32x4_t v124 = vaddq_s32(v124, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v136), v52));
      int32x4_t v123 = vaddq_s32(v123, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v136.i8), v52));
      int32x4_t v133 = vaddq_s32(v133, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v139), v52));
      int32x4_t v132 = vaddq_s32(v132, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v139.i8), v52));
      int32x4_t v131 = vaddq_s32(v131, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v138), v52));
      int32x4_t v130 = vaddq_s32(v130, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v138.i8), v52));
      v125 += 2;
      v126 += 2;
      v127 -= 32;
    }
    while (v127);
    unsigned int v114 = vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v130, v123), vaddq_s32(v132, v128)), vaddq_s32(vaddq_s32(v131, v124), vaddq_s32(v133, v129))));
    if ((a2 & 0xFFFFFFE0) != (unint64_t)a2)
    {
      uint64_t v118 = a2 & 0xFFFFFFE0;
      uint64_t v115 = v118;
      if ((a2 & 0x18) != 0) {
        goto LABEL_158;
      }
      goto LABEL_161;
    }
  }
  else
  {
    unsigned int v114 = 0;
    uint64_t v118 = 0;
LABEL_158:
    int32x4_t v140 = 0uLL;
    int32x4_t v141 = (int32x4_t)v114;
    unsigned int v142 = (int8x8_t *)&v54[v118 + v95];
    float v143 = (int8x8_t *)&v257->i8[v118];
    uint64_t v144 = v118 - (a2 & 0xFFFFFFF8);
    do
    {
      int8x8_t v145 = *v142++;
      int8x8_t v146 = vceqz_s8(v145);
      *v143++ = vand_s8(v146, (int8x8_t)0x101010101010101);
      uint16x8_t v147 = vmovl_u8((uint8x8_t)v146);
      int32x4_t v140 = vaddq_s32(v140, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v147), v52));
      int32x4_t v141 = vaddq_s32(v141, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v147.i8), v52));
      v144 += 8;
    }
    while (v144);
    unsigned int v114 = vaddvq_s32(vaddq_s32(v141, v140));
    uint64_t v115 = a2 & 0xFFFFFFF8;
    if (v259 != a2) {
      goto LABEL_161;
    }
  }
  uint64_t v152 = 0;
  if (a2 < 8)
  {
    uint64_t v153 = v255;
    goto LABEL_177;
  }
  uint64_t v153 = v255;
  if ((unint64_t)((char *)v97 - v98) < 0x20)
  {
LABEL_177:
    uint64_t v181 = a2 - v152;
    int v182 = &v97->i8[v152];
    v183 = &v54[v152 + v153];
    do
    {
      int v184 = *v183++;
      *v182++ = v184;
      if (v184) {
        ++v114;
      }
      --v181;
    }
    while (v181);
  }
  else if (a2 >= 0x20)
  {
    int32x4_t v155 = 0uLL;
    int32x4_t v156 = (int32x4_t)v114;
    float v157 = (int8x16_t *)&v54[v255 + 16];
    int v158 = v97 + 1;
    uint64_t v159 = v117;
    int32x4_t v160 = 0uLL;
    int32x4_t v161 = 0uLL;
    int32x4_t v162 = 0uLL;
    int32x4_t v163 = 0uLL;
    int32x4_t v164 = 0uLL;
    int32x4_t v165 = 0uLL;
    do
    {
      int8x16_t v166 = v157[-1];
      int8x16_t v167 = *v157;
      v158[-1] = v166;
      *int v158 = v167;
      uint8x16_t v168 = (uint8x16_t)vtstq_s8(v166, v166);
      uint16x8_t v169 = vmovl_u8(*(uint8x8_t *)v168.i8);
      uint16x8_t v170 = vmovl_high_u8(v168);
      uint8x16_t v171 = (uint8x16_t)vtstq_s8(v167, v167);
      uint16x8_t v172 = vmovl_u8(*(uint8x8_t *)v171.i8);
      uint16x8_t v173 = vmovl_high_u8(v171);
      int32x4_t v161 = vaddq_s32(v161, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v170), v52));
      int32x4_t v160 = vaddq_s32(v160, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v170.i8), v52));
      int32x4_t v155 = vaddq_s32(v155, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v169), v52));
      int32x4_t v156 = vaddq_s32(v156, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v169.i8), v52));
      int32x4_t v165 = vaddq_s32(v165, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v173), v52));
      int32x4_t v164 = vaddq_s32(v164, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v173.i8), v52));
      int32x4_t v163 = vaddq_s32(v163, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v172), v52));
      int32x4_t v162 = vaddq_s32(v162, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v172.i8), v52));
      v157 += 2;
      v158 += 2;
      v159 -= 32;
    }
    while (v159);
    unsigned int v114 = vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v162, v156), vaddq_s32(v164, v160)), vaddq_s32(vaddq_s32(v163, v155), vaddq_s32(v165, v161))));
    if (v117 != a2)
    {
      uint64_t v154 = v117;
      uint64_t v152 = v117;
      if ((a2 & 0x18) != 0) {
        goto LABEL_174;
      }
      goto LABEL_177;
    }
  }
  else
  {
    uint64_t v154 = 0;
LABEL_174:
    int32x4_t v174 = 0uLL;
    int32x4_t v175 = (int32x4_t)v114;
    unsigned int v176 = (int8x8_t *)&v54[v154 + v255];
    v177 = (int8x8_t *)&v97->i8[v154];
    uint64_t v178 = v154 - (a2 & 0xFFFFFFF8);
    do
    {
      int8x8_t v179 = *v176++;
      *v177++ = v179;
      uint16x8_t v180 = vmovl_u8((uint8x8_t)vtst_s8(v179, v179));
      int32x4_t v174 = vaddq_s32(v174, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v180), v52));
      int32x4_t v175 = vaddq_s32(v175, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v180.i8), v52));
      v178 += 8;
    }
    while (v178);
    unsigned int v114 = vaddvq_s32(vaddq_s32(v175, v174));
    uint64_t v152 = a2 & 0xFFFFFFF8;
    if (v259 != a2) {
      goto LABEL_177;
    }
  }
  if (((v114 == a2) & v86) != 1) {
    goto LABEL_210;
  }
  if (a2 >= 8 && (&v54[a2 + v250] <= (char *)a5 || v55 >= (int8x8_t *)&a5[a2]))
  {
    float32x4_t v190 = a5 + 4;
    uint64_t v191 = a2 & 0xFFFFFFF8;
    while (1)
    {
      int8x8_t v192 = vtst_s8(*v55, *v55);
      if (v192.i8[0])
      {
        *(v190 - 4) = a2;
        if ((v192.i8[1] & 1) == 0) {
          goto LABEL_194;
        }
      }
      else if ((v192.i8[1] & 1) == 0)
      {
LABEL_194:
        if (v192.i8[2]) {
          goto LABEL_195;
        }
        goto LABEL_203;
      }
      *(v190 - 3) = a2;
      if (v192.i8[2])
      {
LABEL_195:
        *(v190 - 2) = a2;
        if ((v192.i8[3] & 1) == 0) {
          goto LABEL_196;
        }
        goto LABEL_204;
      }
LABEL_203:
      if ((v192.i8[3] & 1) == 0)
      {
LABEL_196:
        if (v192.i8[4]) {
          goto LABEL_197;
        }
        goto LABEL_205;
      }
LABEL_204:
      *(v190 - 1) = a2;
      if (v192.i8[4])
      {
LABEL_197:
        *float32x4_t v190 = a2;
        if ((v192.i8[5] & 1) == 0) {
          goto LABEL_198;
        }
        goto LABEL_206;
      }
LABEL_205:
      if ((v192.i8[5] & 1) == 0)
      {
LABEL_198:
        if (v192.i8[6]) {
          goto LABEL_199;
        }
        goto LABEL_207;
      }
LABEL_206:
      v190[1] = a2;
      if (v192.i8[6])
      {
LABEL_199:
        v190[2] = a2;
        if (v192.i8[7]) {
          goto LABEL_208;
        }
        goto LABEL_191;
      }
LABEL_207:
      if (v192.i8[7]) {
LABEL_208:
      }
        v190[3] = a2;
LABEL_191:
      ++v55;
      v190 += 8;
      v191 -= 8;
      if (!v191)
      {
        uint64_t v185 = a2 & 0xFFFFFFF8;
        if (v259 == a2) {
          goto LABEL_210;
        }
        goto LABEL_186;
      }
    }
  }
  uint64_t v185 = 0;
LABEL_186:
  uint64_t v186 = a2 - v185;
  float v187 = &a5[v185];
  float32x4_t v188 = &v54[v185 + v250];
  do
  {
    if (*v188++) {
      *float v187 = a2;
    }
    ++v187;
    --v186;
  }
  while (v186);
LABEL_210:
  if (v114 != a2)
  {
    if (!(void)v267) {
      bmMunkres();
    }
    uint64_t v193 = *((void *)&v267 + 1);
    if (!*((void *)&v267 + 1)) {
      bmMunkres();
    }
    unsigned int v194 = 0;
    uint64_t v195 = 0;
    float v196 = 3.4028e38;
    do
    {
      float32x4_t v197 = (float *)((char *)a1 + v194);
      float32x4_t v198 = (unsigned __int8 *)v267;
      uint64_t v199 = a2;
      do
      {
        int v200 = *v198++;
        if (!v200 && !*(unsigned char *)(*((void *)&v267 + 1) + v195) && *v197 < v196 && *v197 > 0.000001) {
          float v196 = *v197;
        }
        ++v197;
        --v199;
      }
      while (v199);
      ++v195;
      v194 += v265;
    }
    while (v195 != a2);
    v262 = (unsigned __int8 *)v267;
    unsigned int v202 = 0;
    uint64_t v203 = 0;
LABEL_227:
    unsigned int v264 = v202;
    uint64_t v204 = (float *)((char *)a1 + v202);
    v205 = v262;
    uint64_t v206 = a2;
    while (1)
    {
      if (*v205++)
      {
        if (!*(unsigned char *)(v193 + v203)) {
          goto LABEL_229;
        }
        float v208 = v196 + *v204;
      }
      else
      {
        if (*(unsigned char *)(v193 + v203)) {
          goto LABEL_229;
        }
        float v208 = bmMaximum(0.0, *v204 - v196);
      }
      *uint64_t v204 = v208;
LABEL_229:
      ++v204;
      if (!--v206)
      {
        a1 = v260;
        int v13 = 4 * a2;
        ++v203;
        unsigned int v202 = v264 + 4 * a2;
        if (v203 != a2) {
          goto LABEL_227;
        }
        float v33 = (char *)v266;
        unsigned int v36 = DWORD2(v266);
        float32x4_t v34 = (int8x16_t *)*((void *)&v267 + 1);
        float32x4_t v35 = (int8x16_t *)v267;
        if (!(void)v266) {
          goto LABEL_293;
        }
        goto LABEL_39;
      }
    }
  }
  unint64_t v209 = 0;
  while (a5[v209 / 4] != a2)
  {
    v209 += 4;
    if (v247 == v209) {
      return;
    }
  }
  memcpy(*((void **)&v268 + 1), a5, v269);
  bzero((void *)v268, v247);
  unsigned int v210 = 0;
  uint64_t v211 = 0;
  do
  {
    int v212 = 0;
    uint64_t v213 = 0;
    uint64_t v214 = *((void *)&v269 + 1);
    uint64_t v215 = v268;
    do
    {
      if (*(float *)((char *)&a1[v213] + v210) <= 0.000001) {
        *(_DWORD *)(v214 + 4 * (v212 + (*(_DWORD *)(v215 + 4 * v213))++)) = v211;
      }
      ++v213;
      v212 += a2;
    }
    while (a2 != v213);
    ++v211;
    v210 += v265;
  }
  while (v211 != a2);
  uint64_t v216 = 0;
  long long v217 = v268;
  if (a2 < 4 || (void)v268 - *((void *)&v268 + 1) < 0x10uLL)
  {
LABEL_283:
    v242 = (unsigned int *)(*((void *)&v217 + 1) + 4 * v216);
    v243 = (_DWORD *)(v217 + 4 * v216);
    uint64_t v244 = a2 - v216;
    do
    {
      unsigned int v245 = *v242++;
      if (v245 < a2) {
        _DWORD *v243 = 1;
      }
      ++v243;
      --v244;
    }
    while (v244);
    goto LABEL_260;
  }
  uint64_t v216 = a2 & 0xFFFFFFFC;
  uint32x2_t v218 = (uint32x2_t)vdup_n_s32(a2);
  v219 = (uint32x2_t *)(*((void *)&v268 + 1) + 8);
  v220 = (_DWORD *)(v268 + 8);
  uint64_t v221 = v216;
  while (2)
  {
    uint32x2_t v222 = *v219;
    uint32x2_t v223 = vcgt_u32(v218, v219[-1]);
    if (v223.i8[0])
    {
      *(v220 - 2) = 1;
      if ((v223.i8[4] & 1) == 0) {
        goto LABEL_252;
      }
LABEL_256:
      *(v220 - 1) = 1;
      uint32x2_t v224 = vcgt_u32(v218, v222);
      if ((v224.i8[0] & 1) == 0) {
        goto LABEL_257;
      }
LABEL_253:
      _DWORD *v220 = 1;
      if (v224.i8[4]) {
        goto LABEL_258;
      }
    }
    else
    {
      if (v223.i8[4]) {
        goto LABEL_256;
      }
LABEL_252:
      uint32x2_t v224 = vcgt_u32(v218, v222);
      if (v224.i8[0]) {
        goto LABEL_253;
      }
LABEL_257:
      if (v224.i8[4]) {
LABEL_258:
      }
        v220[1] = 1;
    }
    v219 += 2;
    v220 += 4;
    v221 -= 4;
    if (v221) {
      continue;
    }
    break;
  }
  if (v216 != a2) {
    goto LABEL_283;
  }
LABEL_260:
  bzero(v270, v247);
  uint64_t v225 = 0;
  unsigned int v226 = 0;
  v227 = (void *)*((void *)&v267 + 1);
  do
  {
    bzero(v227, a2);
    uint64_t v228 = 0;
    do
    {
      uint64_t v229 = *(unsigned int *)(*((void *)&v268 + 1) + 4 * v228);
      if (v229 < a2) {
        *((unsigned char *)v227 + v229) = 1;
      }
      ++v228;
    }
    while (a2 != v228);
    int v230 = 0;
    unint64_t v231 = 0;
    while (1)
    {
      LODWORD(v232) = *(_DWORD *)(*((void *)&v268 + 1) + 4 * v231);
      if (v232 >= a2) {
        break;
      }
LABEL_269:
      a5[v231++] = v232;
      v230 += a2;
      if (v231 >= a2)
      {
        if (v246) {
          unsigned int *v246 = v226;
        }
        return;
      }
    }
    unsigned int v233 = v270[v231];
    uint64_t v234 = *(unsigned int *)(v268 + 4 * v231);
    if (v233 < v234)
    {
      unsigned int v235 = v226 + 1;
      uint64_t v236 = v270[v231];
      do
      {
        uint64_t v232 = *(unsigned int *)(*((void *)&v269 + 1) + 4 * (v230 + v236));
        if (!*((unsigned char *)v227 + v232))
        {
          *((unsigned char *)v227 + v232) = 1;
          v270[v231] = v236;
          unsigned int v226 = v235;
          goto LABEL_269;
        }
        ++v236;
        ++v235;
      }
      while (v234 != v236);
      unsigned int v226 = v226 + v234 - v233;
    }
    v237 = v270;
    uint64_t v238 = v231;
    if (v231 < a2)
    {
      bzero(&v270[v231], 4 * (~v231 + a2) + 4);
      v237 = v270;
    }
    uint64_t v239 = v268 - 4;
    v240 = v237 - 1;
    while ((int)v238 >= 1)
    {
      unsigned int v241 = v240[v238] + 1;
      if (v241 < *(_DWORD *)(v239 + 4 * v238))
      {
        v237[v238 - 1] = v241;
        break;
      }
      v240[v238--] = 0;
      if (!v238) {
        bmMunkres();
      }
    }
    ++v225;
  }
  while (v225 != 5);
}

void sub_2176584A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21765886C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217658880(_Unwind_Exception *a1)
{
  __cxa_end_catch();

  _Unwind_Resume(a1);
}

void sub_217658890()
{
}

void sub_2176590C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, char a18)
{
  ik::PixelBufferTensor::~PixelBufferTensor((ik::PixelBufferTensor *)&a18);

  _Unwind_Resume(a1);
}

void sub_217659364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v23 & 1) == 0)
    {
LABEL_8:

      _Unwind_Resume(a1);
    }
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);

  _Unwind_Resume(a1);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    int v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    int v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_2176596F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  ik::EspressoConfig::~EspressoConfig(v15);
  _Unwind_Resume(a1);
}

void sub_2176599FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v24 & 1) == 0)
    {
LABEL_8:

      _Unwind_Resume(a1);
    }
  }
  else if (!v24)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v23);

  _Unwind_Resume(a1);
}

void sub_217659CA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);

    if ((v24 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else
  {

    if (!v24)
    {
LABEL_8:

      _Unwind_Resume(a1);
    }
  }
  __cxa_free_exception(v22);

  _Unwind_Resume(a1);
}

void sub_21765A1D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  __cxa_free_exception(v34);
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)&a21);

  _Unwind_Resume(a1);
}

void AsString(NSString *a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = (const char *)[v9 UTF8String];
  size_t v4 = strlen(v3);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = (void *)v4;
  if (v4 >= 0x17)
  {
    uint64_t v6 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v6 = v4 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    a1[1] = v5;
    a1[2] = (NSString)(v7 | 0x8000000000000000);
    *a1 = v8;
    a1 = (NSString *)v8;
    goto LABEL_8;
  }
  *((unsigned char *)a1 + 23) = v4;
  if (v4) {
LABEL_8:
  }
    memmove(a1, v3, (size_t)v5);
  *((unsigned char *)v5 + (void)a1) = 0;
}

void sub_21765A3A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id AsEspressoBufferDictionary(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:*(void *)(a1 + 24)];
  for (uint64_t i = *(uint64_t **)(a1 + 16); i; uint64_t i = (uint64_t *)*i)
  {
    uint64_t v4 = i[10];
    long long v5 = *(_OWORD *)(v4 + 40);
    long long v6 = *(_OWORD *)(v4 + 24);
    v17[0] = *(_OWORD *)(v4 + 8);
    v17[1] = v6;
    v17[2] = v5;
    long long v7 = *(_OWORD *)(v4 + 72);
    long long v8 = *(_OWORD *)(v4 + 104);
    long long v9 = *(_OWORD *)(v4 + 56);
    v17[5] = *(_OWORD *)(v4 + 88);
    v17[6] = v8;
    v17[3] = v9;
    v17[4] = v7;
    long long v10 = *(_OWORD *)(v4 + 120);
    long long v11 = *(_OWORD *)(v4 + 136);
    long long v12 = *(_OWORD *)(v4 + 152);
    uint64_t v18 = *(void *)(v4 + 168);
    v17[8] = v11;
    v17[9] = v12;
    v17[7] = v10;
    int v13 = +[FTEspressoBuffer bufferWithEspressoBuffer:v17];
    unsigned int v14 = i + 2;
    if (*((char *)i + 39) < 0) {
      unsigned int v14 = (void *)*v14;
    }
    uint64_t v15 = [NSString stringWithUTF8String:v14];
    [v2 setObject:v13 forKeyedSubscript:v15];
  }

  return v2;
}

void sub_21765A4C8(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21765A4EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21765AB94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  __cxa_free_exception(v46);
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)&__p);
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)&a46);

  _Unwind_Resume(a1);
}

void sub_21765AD7C(_Unwind_Exception *a1)
{
}

void sub_21765B208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

void sub_21765B3DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

void sub_21765B6A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21765B834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v35 - 41) < 0)
  {
    operator delete(*(void **)(v35 - 64));
    if ((a33 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a14 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((a33 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a28);
  if ((a14 & 0x80000000) == 0)
  {
LABEL_4:
    if ((a26 & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  operator delete(a9);
  if ((a26 & 0x80000000) == 0)
  {
LABEL_5:
    if (a20 < 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  operator delete(a21);
  if (a20 < 0)
  {
LABEL_6:
    operator delete(__p);
    if ((v34 & 1) == 0) {
LABEL_14:
    }
      _Unwind_Resume(a1);
LABEL_13:
    __cxa_free_exception(v33);
    goto LABEL_14;
  }
LABEL_12:
  if (!v34) {
    goto LABEL_14;
  }
  goto LABEL_13;
}

uint64_t std::pair<std::string const,ik::Tensor>::pair[abi:ne180100]<std::string,ik::PixelBufferTensor &,0>(uint64_t a1, long long *a2, uint64_t a3)
{
  long long v5 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v5;
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *(void *)a2 = 0;
  int v6 = *(_DWORD *)(a3 + 8);
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = &unk_26C78E630;
  *(_DWORD *)(a1 + 32) = v6;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  long long v8 = *(unsigned char **)(a3 + 16);
  long long v7 = *(unsigned char **)(a3 + 24);
  int64_t v9 = v7 - v8;
  if (v7 != v8)
  {
    if (v9 < 0) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    long long v10 = (char *)operator new(v7 - v8);
    *(void *)(a1 + 40) = v10;
    *(void *)(a1 + 48) = v10;
    long long v11 = &v10[8 * (v9 >> 3)];
    *(void *)(a1 + 56) = v11;
    memcpy(v10, v8, v9);
    *(void *)(a1 + 48) = v11;
  }
  uint64_t v12 = *(void *)(a3 + 48);
  *(void *)(a1 + 64) = *(void *)(a3 + 40);
  *(void *)(a1 + 72) = v12;
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

void sub_21765BA00(_Unwind_Exception *a1)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  std::pair<std::string const,ik::EspressoTensor>::pair[abi:ne180100]((void **)v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN2ikL28IsAppleNeuralEngineAvailableEv_block_invoke_2()
{
  uint64_t result = MGGetBoolAnswer();
  _MergedGlobals_4 = result;
  return result;
}

char *std::vector<std::string>::__push_back_slow_path<std::string>(void **a1, uint64_t a2)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 3);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<long long>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) > v4) {
    unint64_t v4 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) >= 0x555555555555555) {
    unint64_t v6 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v6)
  {
    if (v6 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    long long v7 = (char *)operator new(24 * v6);
  }
  else
  {
    long long v7 = 0;
  }
  long long v8 = &v7[24 * v3];
  int64_t v9 = &v7[24 * v6];
  *(_OWORD *)long long v8 = *(_OWORD *)a2;
  *((void *)v8 + 2) = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  long long v10 = v8 + 24;
  long long v11 = (char *)*a1;
  uint64_t v12 = (char *)a1[1];
  if (v12 == *a1)
  {
    *a1 = v8;
    a1[1] = v10;
    a1[2] = v9;
    if (!v12) {
      return v10;
    }
    goto LABEL_20;
  }
  do
  {
    long long v13 = *(_OWORD *)(v12 - 24);
    *((void *)v8 - 1) = *((void *)v12 - 1);
    *(_OWORD *)(v8 - 24) = v13;
    v8 -= 24;
    *((void *)v12 - 2) = 0;
    *((void *)v12 - 1) = 0;
    *((void *)v12 - 3) = 0;
    v12 -= 24;
  }
  while (v12 != v11);
  unsigned int v14 = (char *)*a1;
  uint64_t v12 = (char *)a1[1];
  *a1 = v8;
  a1[1] = v10;
  a1[2] = v9;
  if (v12 != v14)
  {
    do
    {
      if (*(v12 - 1) < 0) {
        operator delete(*((void **)v12 - 3));
      }
      v12 -= 24;
    }
    while (v12 != v14);
    uint64_t v12 = v14;
  }
  if (v12) {
LABEL_20:
  }
    operator delete(v12);
  return v10;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  unint64_t v6 = (unsigned char *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }
  unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)v44, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    unsigned int v14 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      uint64_t v15 = (unsigned __int8 *)*v14;
      if (*v14)
      {
        char v16 = v6[23];
        if (v16 >= 0) {
          uint64_t v17 = v6[23];
        }
        else {
          uint64_t v17 = *((void *)v6 + 1);
        }
        if (v16 < 0) {
          unint64_t v6 = *(unsigned char **)v6;
        }
        if (v13.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v22 = *((void *)v15 + 1);
            if (v22 == v11)
            {
              uint64_t v23 = v15[39];
              if ((v23 & 0x80u) == 0) {
                uint64_t v24 = v15[39];
              }
              else {
                uint64_t v24 = *((void *)v15 + 3);
              }
              if (v24 == v17)
              {
                if ((v23 & 0x80) != 0)
                {
                  if (!memcmp(*((const void **)v15 + 2), v6, *((void *)v15 + 3))) {
                    return v15;
                  }
                }
                else
                {
                  if (!v15[39]) {
                    return v15;
                  }
                  uint64_t v25 = 0;
                  while (v15[v25 + 16] == v6[v25])
                  {
                    if (v23 == ++v25) {
                      return v15;
                    }
                  }
                }
              }
            }
            else if ((v22 & (v12 - 1)) != v4)
            {
              goto LABEL_51;
            }
            uint64_t v15 = *(unsigned __int8 **)v15;
            if (!v15) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v18 = *((void *)v15 + 1);
          if (v18 == v11)
          {
            uint64_t v19 = v15[39];
            if ((v19 & 0x80u) == 0) {
              uint64_t v20 = v15[39];
            }
            else {
              uint64_t v20 = *((void *)v15 + 3);
            }
            if (v20 == v17)
            {
              if ((v19 & 0x80) != 0)
              {
                if (!memcmp(*((const void **)v15 + 2), v6, *((void *)v15 + 3))) {
                  return v15;
                }
              }
              else
              {
                if (!v15[39]) {
                  return v15;
                }
                uint64_t v21 = 0;
                while (v15[v21 + 16] == v6[v21])
                {
                  if (v19 == ++v21) {
                    return v15;
                  }
                }
              }
            }
          }
          else
          {
            if (v18 >= v12) {
              v18 %= v12;
            }
            if (v18 != v4) {
              break;
            }
          }
          uint64_t v15 = *(unsigned __int8 **)v15;
        }
        while (v15);
      }
    }
  }
LABEL_51:
  unsigned int v26 = (void *)(a1 + 16);
  uint64_t v15 = (unsigned __int8 *)operator new(0x60uLL);
  v44[0] = v15;
  v44[1] = a1 + 16;
  *(void *)uint64_t v15 = 0;
  *((void *)v15 + 1) = v11;
  uint64_t v27 = *a4;
  long long v28 = **a4;
  *((void *)v15 + 4) = *((void *)*a4 + 2);
  *((_OWORD *)v15 + 1) = v28;
  *((void *)v27 + 1) = 0;
  *((void *)v27 + 2) = 0;
  *(void *)uint64_t v27 = 0;
  *((void *)v15 + 5) = &unk_26C78E630;
  *((_DWORD *)v15 + 12) = 1;
  *((void *)v15 + 11) = 0;
  *(_OWORD *)(v15 + 72) = 0u;
  *(_OWORD *)(v15 + 56) = 0u;
  char v45 = 1;
  float v29 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v30 = *(float *)(a1 + 32);
  if (v12 && (float)(v30 * (float)v12) >= v29)
  {
    uint64_t v31 = *(void *)a1;
    float32x4_t v32 = *(void **)(*(void *)a1 + 8 * v4);
    if (v32)
    {
LABEL_54:
      *(void *)uint64_t v15 = *v32;
LABEL_89:
      void *v32 = v15;
      goto LABEL_90;
    }
  }
  else
  {
    BOOL v33 = 1;
    if (v12 >= 3) {
      BOOL v33 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v34 = v33 | (2 * v12);
    unint64_t v35 = vcvtps_u32_f32(v29 / v30);
    if (v34 <= v35) {
      size_t prime = v35;
    }
    else {
      size_t prime = v34;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v37 = *(int8x8_t *)(a1 + 8);
    if (prime > *(void *)&v37) {
      goto LABEL_65;
    }
    if (prime < *(void *)&v37)
    {
      unint64_t v38 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(void *)&v37 < 3uLL || (uint8x8_t v39 = (uint8x8_t)vcnt_s8(v37), v39.i16[0] = vaddlv_u8(v39), v39.u32[0] > 1uLL))
      {
        unint64_t v38 = std::__next_prime(v38);
      }
      else
      {
        uint64_t v40 = 1 << -(char)__clz(v38 - 1);
        if (v38 >= 2) {
          unint64_t v38 = v40;
        }
      }
      if (prime <= v38) {
        size_t prime = v38;
      }
      if (prime < *(void *)&v37) {
LABEL_65:
      }
        std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__do_rehash<true>(a1, prime);
    }
    unint64_t v12 = *(void *)(a1 + 8);
    unint64_t v41 = v12 - 1;
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
      {
        unint64_t v4 = v11 % v12;
        uint64_t v31 = *(void *)a1;
        float32x4_t v32 = *(void **)(*(void *)a1 + 8 * (v11 % v12));
        if (v32) {
          goto LABEL_54;
        }
      }
      else
      {
        unint64_t v4 = v11;
        uint64_t v31 = *(void *)a1;
        float32x4_t v32 = *(void **)(*(void *)a1 + 8 * v11);
        if (v32) {
          goto LABEL_54;
        }
      }
    }
    else
    {
      unint64_t v4 = v41 & v11;
      uint64_t v31 = *(void *)a1;
      float32x4_t v32 = *(void **)(*(void *)a1 + 8 * (v41 & v11));
      if (v32) {
        goto LABEL_54;
      }
    }
  }
  *(void *)uint64_t v15 = *v26;
  *unsigned int v26 = v15;
  *(void *)(v31 + 8 * v4) = v26;
  if (*(void *)v15)
  {
    unint64_t v42 = *(void *)(*(void *)v15 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v42 >= v12) {
        v42 %= v12;
      }
    }
    else
    {
      v42 &= v12 - 1;
    }
    float32x4_t v32 = (void *)(*(void *)a1 + 8 * v42);
    goto LABEL_89;
  }
LABEL_90:
  ++*(void *)(a1 + 24);
  return v15;
}

void sub_21765BFFC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ik::EspressoTensor>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ik::EspressoTensor>,void *>>>>::reset[abi:ne180100]((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

float acAttrEyeLoc(float *a1, float *a2)
{
  float v4 = bmClamp(*a1, 0.0, 1.0);
  float v5 = bmClamp(a1[1], 0.0, 1.0);
  float v6 = a2[2];
  float v7 = a2[3];
  float v8 = *a2 + (float)(v4 * v6);
  float v9 = a2[1] + (float)(v5 * v7);
  float v10 = v7 * 0.2;
  float v11 = (float)(v6 * 0.2) * 0.5;
  float v12 = bmMaximum(v8 - v11, *a2);
  bmMaximum(v9 - (float)(v10 * 0.5), a2[1]);
  bmMinimum(v8 + v11, *a2 + a2[2]);
  bmMinimum(v9 + (float)(v10 * 0.5), a2[1] + a2[3]);
  return v12;
}

uint64_t ft::TrackMatcher::TrackMatcher(uint64_t a1, unint64_t *a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  ft::HungarianMatcher::HungarianMatcher((ft::HungarianMatcher *)(a1 + 16), *a2);
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  return a1;
}

{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  ft::HungarianMatcher::HungarianMatcher((ft::HungarianMatcher *)(a1 + 16), *a2);
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  return a1;
}

void ft::TrackMatcher::~TrackMatcher(ft::TrackMatcher *this)
{
  uint64_t v2 = (void *)*((void *)this + 12);
  if (v2)
  {
    *((void *)this + 13) = v2;
    operator delete(v2);
  }
  ft::HungarianMatcher::~HungarianMatcher((ft::TrackMatcher *)((char *)this + 16));
}

{
  void *v2;

  uint64_t v2 = (void *)*((void *)this + 12);
  if (v2)
  {
    *((void *)this + 13) = v2;
    operator delete(v2);
  }
  ft::HungarianMatcher::~HungarianMatcher((ft::TrackMatcher *)((char *)this + 16));
}

void ft::TrackMatcher::Match(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, char **a4@<X8>)
{
  uint64_t v6 = *a2;
  uint64_t v5 = a2[1];
  unint64_t v7 = 0x86BCA1AF286BCA1BLL * ((v5 - *a2) >> 3);
  unint64_t v8 = (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 4;
  if (v8 * v7)
  {
    ft::TrackMatcher::ComputeCostMatrix(a1, a2, (uint64_t **)a3);
    ft::HungarianMatcher::Match((ft::HungarianMatcher *)(a1 + 16), *(float **)(a1 + 96), v8, v7, __p);
    uint64_t v10 = *(void *)(a1 + 96);
    a4[1] = 0;
    a4[2] = 0;
    *a4 = 0;
    if (v5 != v6)
    {
      if (v7 >= 0x555555555555556) {
        std::vector<long long>::__throw_length_error[abi:ne180100]();
      }
      float v11 = (char *)operator new(48 * v7);
      *a4 = v11;
      a4[2] = &v11[48 * v7];
      bzero(v11, 48 * ((48 * v7 - 48) / 0x30) + 48);
      uint64_t v12 = 0;
      a4[1] = &v11[48 * ((48 * v7 - 48) / 0x30) + 48];
      uint8x8_t v13 = __p[0];
      if (v7 <= 1) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = v7;
      }
      uint64_t v15 = v11 + 24;
      while (1)
      {
        *((void *)v15 - 3) = v12;
        unint64_t v16 = v13[v12];
        if (v16 < v8)
        {
          float v17 = *(float *)(v10 + 4 * (v12 + v16 * v7));
          if (v15[8])
          {
            *(void *)uint64_t v15 = v16;
            *((float *)v15 + 4) = v17;
            v15[20] = 1;
            if (v17 < *(float *)(a1 + 8)) {
              goto LABEL_15;
            }
          }
          else
          {
            v15[8] = 1;
            *(void *)uint64_t v15 = v16;
            *((float *)v15 + 4) = v17;
            v15[20] = 1;
            if (v17 < *(float *)(a1 + 8))
            {
LABEL_15:
              if (!*(v15 - 8)) {
                *(v15 - 8) = 1;
              }
              *((void *)v15 - 2) = v16;
            }
          }
        }
        ++v12;
        v15 += 48;
        if (v14 == v12) {
          goto LABEL_19;
        }
      }
    }
    uint8x8_t v13 = __p[0];
    if (__p[0])
    {
LABEL_19:
      __p[1] = v13;
      operator delete(v13);
    }
  }
  else
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
  }
}

void sub_21765C3BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  float v4 = *(void **)v2;
  if (*(void *)v2)
  {
    *(void *)(v2 + 8) = v4;
    operator delete(v4);
  }
  ft::TrackMatcher::Match((uint64_t)va);
  _Unwind_Resume(a1);
}

void ft::TrackMatcher::ComputeCostMatrix(uint64_t a1, uint64_t *a2, uint64_t **a3)
{
  unint64_t v6 = 0x86BCA1AF286BCA1BLL * ((a2[1] - *a2) >> 3) * (((char *)a3[1] - (char *)*a3) >> 4);
  unint64_t v8 = *(float **)(a1 + 96);
  unint64_t v7 = (float **)(a1 + 96);
  unint64_t v9 = (uint64_t)(*(void *)(a1 + 104) - (void)v8) >> 2;
  if (v6 > v9)
  {
    std::vector<float>::__append(a1 + 96, v6 - v9);
    unint64_t v8 = *v7;
  }
  int v10 = *(_DWORD *)(a1 + 12);
  if (v10 == 1)
  {
    std::string __p = 0;
    float32x4_t v32 = *a3;
    uint64_t v31 = a3[1];
    uint64_t v33 = (char *)v31 - (char *)*a3;
    if (v31 == *a3) {
      goto LABEL_78;
    }
    if (v33 < 0) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v74 = v33 >> 4;
    std::string __p = (float32x2_t *)operator new((unint64_t)v33 >> 1);
    uint64_t v78 = __p;
    unsigned int v80 = &__p[v33 >> 4];
    while (1)
    {
      uint64_t v34 = *v32;
      unint64_t v35 = (std::__shared_weak_count *)v32[1];
      if (v35) {
        atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      float32x2_t v36 = vcvt_f32_f64(vaddq_f64(*(float64x2_t *)(v34 + 24), vcvtq_f64_f32(vmul_f32(vcvt_f32_f64(*(float64x2_t *)(v34 + 40)), (float32x2_t)0x3F0000003F000000))));
      int8x8_t v37 = v78;
      if (v78 < v80)
      {
        *uint64_t v78 = v36;
        unint64_t v38 = v78 + 1;
        goto LABEL_50;
      }
      uint64_t v39 = v78 - __p;
      unint64_t v40 = v39 + 1;
      if ((unint64_t)(v39 + 1) >> 61) {
        std::vector<long long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v41 = (char *)v80 - (char *)__p;
      if (((char *)v80 - (char *)__p) >> 2 > v40) {
        unint64_t v40 = v41 >> 2;
      }
      if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v42 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v42 = v40;
      }
      if (v42)
      {
        if (v42 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        uint64_t v43 = (char *)operator new(8 * v42);
        unsigned int v44 = (float32x2_t *)&v43[8 * v39];
        *unsigned int v44 = v36;
        unint64_t v38 = v44 + 1;
        if (v78 == __p)
        {
LABEL_48:
          std::string __p = v44;
          unsigned int v80 = (float32x2_t *)&v43[8 * v42];
          if (!v78) {
            goto LABEL_50;
          }
          goto LABEL_49;
        }
      }
      else
      {
        uint64_t v43 = 0;
        unsigned int v44 = (float32x2_t *)(8 * v39);
        char v45 = (float32x2_t *)(8 * v39);
        *char v45 = v36;
        unint64_t v38 = v45 + 1;
        if (v78 == __p) {
          goto LABEL_48;
        }
      }
      do
      {
        float32x2_t v46 = v37[-1];
        --v37;
        v44[-1] = v46;
        --v44;
      }
      while (v37 != __p);
      int8x8_t v37 = __p;
      std::string __p = v44;
      unsigned int v80 = (float32x2_t *)&v43[8 * v42];
      if (!v37) {
        goto LABEL_50;
      }
LABEL_49:
      operator delete(v37);
LABEL_50:
      uint64_t v78 = v38;
      if (v35 && !atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
      v32 += 2;
      if (v32 == v31)
      {
        uint64_t v63 = *a2;
        uint64_t v64 = a2[1];
        if (*a2 == v64) {
          goto LABEL_78;
        }
        unsigned int v65 = *a3;
        uint64_t v66 = v74;
        if (v74 <= 1) {
          uint64_t v66 = 1;
        }
        while (1)
        {
          uint64_t v67 = *(void *)(v63 + 32);
          char v68 = __p;
          uint64_t v69 = v65;
          uint64_t v70 = v66;
          do
          {
            while (*(void *)(*v69 + 88) == v67)
            {
              float32x2_t v71 = *v68++;
              float32x2_t v72 = vsub_f32(v71, vcvt_f32_f64(vaddq_f64(*(float64x2_t *)v63, vcvtq_f64_f32(vmul_f32(vcvt_f32_f64(*(float64x2_t *)(v63 + 16)), (float32x2_t)0x3F0000003F000000)))));
              *v8++ = sqrtf(vaddv_f32(vmul_f32(v72, v72)));
              v69 += 2;
              if (!--v70) {
                goto LABEL_72;
              }
            }
            *v8++ = 10000000.0;
            ++v68;
            v69 += 2;
            --v70;
          }
          while (v70);
LABEL_72:
          v63 += 152;
          if (v63 == v64) {
            goto LABEL_78;
          }
        }
      }
    }
  }
  if (v10) {
    return;
  }
  std::string __p = 0;
  uint64_t v12 = *a3;
  float v11 = a3[1];
  uint64_t v13 = (char *)v11 - (char *)*a3;
  if (v11 == *a3) {
    goto LABEL_78;
  }
  if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF1) {
    std::vector<long long>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v75 = a2;
  unint64_t v73 = v13 >> 4;
  std::string __p = (float32x2_t *)operator new(2 * v13);
  unsigned int v77 = __p;
  char v79 = &__p[4 * (v13 >> 4)];
  do
  {
    uint64_t v14 = (void *)*v12;
    uint64_t v15 = (std::__shared_weak_count *)v12[1];
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    float32x2_t v17 = (float32x2_t)v14[3];
    float32x2_t v16 = (float32x2_t)v14[4];
    float32x2_t v19 = (float32x2_t)v14[5];
    float32x2_t v18 = (float32x2_t)v14[6];
    uint64_t v20 = v77;
    if (v77 < v79)
    {
      *unsigned int v77 = v17;
      v77[1] = v16;
      uint64_t v21 = v77 + 4;
      v77[2] = v19;
      v77[3] = v18;
      goto LABEL_24;
    }
    uint64_t v22 = __p;
    uint64_t v23 = ((char *)v77 - (char *)__p) >> 5;
    unint64_t v24 = v23 + 1;
    if ((unint64_t)(v23 + 1) >> 59) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v25 = (char *)v79 - (char *)__p;
    if (((char *)v79 - (char *)__p) >> 4 > v24) {
      unint64_t v24 = v25 >> 4;
    }
    if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v26 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v26 = v24;
    }
    if (v26)
    {
      if (v26 >> 59) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v27 = (char *)operator new(32 * v26);
      long long v28 = &v27[32 * v23];
      *(float32x2_t *)long long v28 = v17;
      *((float32x2_t *)v28 + 1) = v16;
      *((float32x2_t *)v28 + 2) = v19;
      *((float32x2_t *)v28 + 3) = v18;
      uint64_t v29 = (uint64_t)v28;
      if (v77 == __p)
      {
LABEL_22:
        uint64_t v21 = (float32x2_t *)(v28 + 32);
        std::string __p = (float32x2_t *)v29;
        char v79 = (float32x2_t *)&v27[32 * v26];
        if (v77) {
          goto LABEL_23;
        }
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v27 = 0;
      long long v28 = (char *)(32 * v23);
      *(float32x2_t *)long long v28 = v17;
      *((float32x2_t *)v28 + 1) = v16;
      *((float32x2_t *)v28 + 2) = v19;
      *((float32x2_t *)v28 + 3) = v18;
      uint64_t v29 = 32 * v23;
      if (v77 == __p) {
        goto LABEL_22;
      }
    }
    do
    {
      long long v30 = *(_OWORD *)v20[-2].f32;
      *(_OWORD *)(v29 - 32) = *(_OWORD *)v20[-4].f32;
      *(_OWORD *)(v29 - 16) = v30;
      v29 -= 32;
      v20 -= 4;
    }
    while (v20 != __p);
    uint64_t v20 = __p;
    uint64_t v21 = (float32x2_t *)(v28 + 32);
    std::string __p = (float32x2_t *)v29;
    char v79 = (float32x2_t *)&v27[32 * v26];
    if (v22) {
LABEL_23:
    }
      operator delete(v20);
LABEL_24:
    unsigned int v77 = v21;
    if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
    v12 += 2;
  }
  while (v12 != v11);
  uint64_t v47 = *v75;
  uint64_t v48 = v75[1];
  if (*v75 != v48)
  {
    unsigned int v49 = *a3;
    uint64_t v50 = v73;
    if (v73 <= 1) {
      uint64_t v50 = 1;
    }
    do
    {
      uint64_t v51 = *(void *)(v47 + 32);
      int8x16_t v52 = (float64x2_t *)&__p[2];
      int8x16_t v53 = v49;
      uint64_t v54 = v50;
      do
      {
        float v55 = 10.0;
        if (*(void *)(*v53 + 88) == v51)
        {
          float64x2_t v56 = v52[-1];
          float64x2_t v57 = *(float64x2_t *)(v47 + 16);
          float64x2_t v58 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(*(float64x2_t *)v47, v56), *(int8x16_t *)v47, (int8x16_t)v56);
          float64x2_t v59 = vaddq_f64(v56, *v52);
          float64x2_t v60 = vaddq_f64(*(float64x2_t *)v47, v57);
          float64x2_t v61 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v59, v60), (int8x16_t)v60, (int8x16_t)v59);
          float64x2_t v62 = (float64x2_t)vandq_s8((int8x16_t)vsubq_f64(v61, v58), (int8x16_t)vcgtq_f64(v61, v58));
          *(float *)v62.f64 = vmulq_laneq_f64(v62, v62, 1).f64[0];
          *(float *)v60.f64 = vaddvq_f64(vmulq_f64((float64x2_t)vzip1q_s64(*(int64x2_t *)v52, (int64x2_t)v57), (float64x2_t)vzip2q_s64(*(int64x2_t *)v52, (int64x2_t)v57)))- *(float *)v62.f64;
          float v55 = 1.0 - (float)(*(float *)v62.f64 / *(float *)v60.f64);
          if (*(float *)v60.f64 < 0.00000011921) {
            float v55 = 1.0;
          }
        }
        *v8++ = v55;
        v52 += 2;
        v53 += 2;
        --v54;
      }
      while (v54);
      v47 += 152;
    }
    while (v47 != v48);
  }
LABEL_78:
  if (__p) {
    operator delete(__p);
  }
}

void sub_21765C9C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

const char *AcCommitHash()
{
  return "0000000";
}

uint64_t TtDetNode::TtDetNode(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 1448) = 0u;
  *(_OWORD *)(a1 + 1464) = 0u;
  *(_OWORD *)(a1 + 1416) = 0u;
  *(_OWORD *)(a1 + 1432) = 0u;
  *(_OWORD *)(a1 + 1384) = 0u;
  *(_OWORD *)(a1 + 1400) = 0u;
  *(_OWORD *)(a1 + 1352) = 0u;
  *(_OWORD *)(a1 + 1368) = 0u;
  *(_OWORD *)(a1 + 1336) = 0u;
  *(_DWORD *)(a2 + 8) = 0;
  *(void *)a2 = 0xDE7C00000001;
  return a1;
}

{
  bzero((void *)a1, 0x530uLL);
  *(_OWORD *)(a1 + 1448) = 0u;
  *(_OWORD *)(a1 + 1464) = 0u;
  *(_OWORD *)(a1 + 1416) = 0u;
  *(_OWORD *)(a1 + 1432) = 0u;
  *(_OWORD *)(a1 + 1384) = 0u;
  *(_OWORD *)(a1 + 1400) = 0u;
  *(_OWORD *)(a1 + 1352) = 0u;
  *(_OWORD *)(a1 + 1368) = 0u;
  *(_OWORD *)(a1 + 1336) = 0u;
  *(_DWORD *)(a2 + 8) = 0;
  *(void *)a2 = 0xDE7C00000001;
  return a1;
}

void TtDetNode::~TtDetNode(TtDetNode *this)
{
}

{
  TtDetNode::releaseBuffers(this);
}

uint64_t TtDetNode::releaseBuffers(TtDetNode *this)
{
  uint64_t v2 = *((void *)this + 167);
  if (v2) {
    MEMORY[0x21D449400](v2, 0x1000C80451B5BE8);
  }
  uint64_t v3 = *((void *)this + 168);
  if (v3) {
    MEMORY[0x21D449400](v3, 0x1000C80451B5BE8);
  }
  uint64_t v4 = *((void *)this + 169);
  if (v4) {
    MEMORY[0x21D449400](v4, 0x1000C80451B5BE8);
  }
  uint64_t v5 = *((void *)this + 171);
  if (v5) {
    MEMORY[0x21D449400](v5, 0x1000C808AA14F5FLL);
  }
  uint64_t v6 = *((void *)this + 172);
  if (v6) {
    MEMORY[0x21D449400](v6, 0x1000C808AA14F5FLL);
  }
  uint64_t v7 = *((void *)this + 173);
  if (v7)
  {
    MEMORY[0x21D449400](v7, 0x1000C8052888210);
    *((void *)this + 173) = 0;
  }
  uint64_t v8 = *((void *)this + 174);
  if (v8)
  {
    MEMORY[0x21D449400](v8, 0x1000C8052888210);
    *((void *)this + 174) = 0;
  }
  uint64_t v9 = *((void *)this + 175);
  if (v9)
  {
    MEMORY[0x21D449400](v9, 0x1000C8052888210);
    *((void *)this + 175) = 0;
  }
  uint64_t v10 = *((void *)this + 176);
  if (v10)
  {
    MEMORY[0x21D449400](v10, 0x1000C8052888210);
    *((void *)this + 176) = 0;
  }
  uint64_t v11 = *((void *)this + 177);
  if (v11)
  {
    MEMORY[0x21D449400](v11, 0x1000C8052888210);
    *((void *)this + 177) = 0;
  }
  uint64_t v12 = *((void *)this + 178);
  if (v12)
  {
    MEMORY[0x21D449400](v12, 0x1000C8052888210);
    *((void *)this + 178) = 0;
  }
  uint64_t v13 = *((void *)this + 179);
  if (v13)
  {
    MEMORY[0x21D449400](v13, 0x1000C8052888210);
    *((void *)this + 179) = 0;
  }
  uint64_t v14 = *((void *)this + 180);
  if (v14)
  {
    MEMORY[0x21D449400](v14, 0x1000C8052888210);
    *((void *)this + 180) = 0;
  }
  uint64_t v15 = *((void *)this + 181);
  if (v15)
  {
    MEMORY[0x21D449400](v15, 0x1000C8052888210);
    *((void *)this + 181) = 0;
  }
  uint64_t v16 = *((void *)this + 182);
  if (v16)
  {
    MEMORY[0x21D449400](v16, 0x1000C8052888210);
    *((void *)this + 182) = 0;
  }
  uint64_t v17 = *((void *)this + 183);
  if (v17)
  {
    MEMORY[0x21D449400](v17, 0x1000C8052888210);
    *((void *)this + 183) = 0;
  }
  uint64_t v18 = *((void *)this + 184);
  if (v18)
  {
    MEMORY[0x21D449400](v18, 0x1000C8052888210);
    *((void *)this + 184) = 0;
  }
  uint64_t result = *((void *)this + 170);
  if (result)
  {
    JUMPOUT(0x21D449400);
  }
  return result;
}

uint64_t TtDetNode::init(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (*a3 != 1) {
    return 4294967289;
  }
  int v4 = a3[1];
  if (v4 == 56956 || v4 == 56945)
  {
    TtDetNode::releaseBuffers((TtDetNode *)a1);
    strcpy((char *)a1, "Tap-to-track det");
    *(int32x2_t *)(a1 + 20) = vdup_n_s32(0x12Cu);
    *(void *)(a1 + 36) = 0x400000004;
    *(void *)(a1 + 44) = 0x3F19999A3E99999ALL;
    *(_OWORD *)(a1 + 896) = xmmword_2176677B0;
    *(_OWORD *)(a1 + 912) = xmmword_2176677C0;
    *(_OWORD *)(a1 + 928) = xmmword_2176677D0;
    strcpy((char *)(a1 + 944), "BoxEncoding_0/Conv2D/q");
    strcpy((char *)(a1 + 976), "BoxEncoding_1/Conv2D/q");
    strcpy((char *)(a1 + 1008), "BoxEncoding_2/Conv2D/q");
    strcpy((char *)(a1 + 1040), "BoxEncoding_3/Conv2D/q");
    strcpy((char *)(a1 + 1072), "BoxEncoding_4/Conv2D/q");
    strcpy((char *)(a1 + 1104), "BoxEncoding_5/Conv2D/q");
    strcpy((char *)(a1 + 1136), "ClassPredictor_0/Conv2D/q");
    strcpy((char *)(a1 + 1168), "ClassPredictor_1/Conv2D/q");
    strcpy((char *)(a1 + 1200), "ClassPredictor_2/Conv2D/q");
    strcpy((char *)(a1 + 1232), "ClassPredictor_3/Conv2D/q");
    strcpy((char *)(a1 + 1264), "ClassPredictor_4/Conv2D/q");
    strcpy((char *)(a1 + 1296), "ClassPredictor_5/Conv2D/q");
    *(void *)(a1 + 768) = 0x100000002;
    *(_OWORD *)(a1 + 752) = xmmword_217667970;
    *(void *)(a1 + 792) = 0x100000002;
    *(_OWORD *)(a1 + 776) = xmmword_217667970;
    *(_DWORD *)(a1 + 824) = 19;
    *(_DWORD *)(a1 + 848) = 12;
    *(_DWORD *)(a1 + 872) = 273;
    *(_DWORD *)(a1 + 828) = 10;
    *(_DWORD *)(a1 + 852) = 24;
    *(_DWORD *)(a1 + 876) = 546;
    *(_DWORD *)(a1 + 832) = 5;
    *(_DWORD *)(a1 + 856) = 24;
    *(_DWORD *)(a1 + 880) = 546;
    *(_OWORD *)(a1 + 800) = xmmword_2176677E0;
    *(_DWORD *)(a1 + 836) = 3;
    *(_DWORD *)(a1 + 860) = 24;
    *(_DWORD *)(a1 + 884) = 546;
    *(void *)(a1 + 816) = 0x100000002;
    *(void *)(a1 + 840) = 0x100000002;
    *(void *)(a1 + 864) = 0x1800000018;
    *(int32x2_t *)(a1 + 888) = vdup_n_s32(0x222u);
    *(void *)(a1 + 432) = 0x100000002;
    *(_OWORD *)(a1 + 416) = xmmword_217667970;
    *(_OWORD *)(a1 + 472) = xmmword_2176679A8;
    *(_OWORD *)(a1 + 488) = unk_2176679B8;
    *(_OWORD *)(a1 + 440) = xmmword_217667988;
    *(_OWORD *)(a1 + 456) = *(_OWORD *)algn_217667998;
    *(_OWORD *)(a1 + 552) = xmmword_2176679F8;
    *(_OWORD *)(a1 + 568) = unk_217667A08;
    *(_OWORD *)(a1 + 520) = unk_2176679D8;
    *(_OWORD *)(a1 + 536) = xmmword_2176679E8;
    *(_OWORD *)(a1 + 504) = xmmword_2176679C8;
    *(_OWORD *)(a1 + 680) = xmmword_217667A78;
    *(_OWORD *)(a1 + 696) = unk_217667A88;
    *(_OWORD *)(a1 + 712) = xmmword_217667A98;
    *(_OWORD *)(a1 + 616) = xmmword_217667A38;
    *(_OWORD *)(a1 + 632) = unk_217667A48;
    *(_OWORD *)(a1 + 648) = xmmword_217667A58;
    *(_OWORD *)(a1 + 664) = unk_217667A68;
    *(_OWORD *)(a1 + 584) = xmmword_217667A18;
    *(_OWORD *)(a1 + 600) = unk_217667A28;
    *(void *)(a1 + 744) = 0x600000006;
    *(_DWORD *)(a1 + 28) = 4;
    *(_DWORD *)(a1 + 32) = 80;
    *(_OWORD *)(a1 + 728) = xmmword_217667AA8;
    memcpy((void *)(a1 + 52), &unk_217667AC0, 0x16CuLL);
    *(void *)(a3 + 1) = 0xDE70000DE71;
    a3[3] = 1;
    *(_DWORD *)(a1 + 1328) = 1917;
    operator new[]();
  }
  return 4294967292;
}

uint64_t TtDetNode::populateAnchorBoxes(uint64_t a1, _OWORD *a2, _OWORD *a3, uint64_t a4, unsigned int a5, uint64_t a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14)
{
  if (a5)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    v16.i64[0] = 0x3F0000003F000000;
    v16.i64[1] = 0x3F0000003F000000;
    uint64_t v17 = a2;
    uint64_t v18 = a3;
    uint64_t v19 = a5;
    while (1)
    {
      unsigned int v20 = *(_DWORD *)(a1 + 4 * v14);
      if (v20)
      {
        uint64_t v21 = *(unsigned int *)(a4 + 4 * v14);
        if (v21) {
          break;
        }
      }
LABEL_3:
      ++v14;
      uint64_t v18 = (_OWORD *)((char *)v18 + 24);
      uint64_t v17 = (_OWORD *)((char *)v17 + 24);
      if (v14 == v19) {
        return v15;
      }
    }
    float v22 = 1.0 / (float)v20;
    float v23 = v22 * 0.5;
    if (v21 < 0x10)
    {
      for (unsigned int i = 0; i != v20; ++i)
      {
        for (unsigned int j = 0; j != v20; ++j)
        {
          uint64_t v26 = 0;
          int v27 = v15;
          do
          {
            float v28 = sqrtf(*((float *)v18 + v26));
            float v29 = *((float *)v17 + v26);
            float v30 = v29 / v28;
            float v31 = v29 * v28;
            float v32 = (float)(v23 + (float)((float)j * v22)) - (float)(v31 * 0.5);
            uint64_t v33 = (float *)(a6 + 16 * (v27 + v26));
            float v34 = (float)(v23 + (float)((float)i * v22)) - (float)(v30 * 0.5);
            *uint64_t v33 = v32;
            v33[1] = v34;
            v33[2] = v31 + v32;
            v33[3] = v30 + v34;
            ++v26;
          }
          while (v21 != v26);
          LODWORD(v15) = v27 + v26;
        }
        LODWORD(v15) = v27 + v26;
      }
      uint64_t v15 = (v27 + v26);
      goto LABEL_3;
    }
    unsigned int v35 = 0;
    unint64_t v36 = (unint64_t)a3 + 24 * v14;
    unint64_t v37 = (unint64_t)a2 + 24 * v14;
    unint64_t v38 = v21 - 1;
    uint64_t v39 = a6 + 16 * v21;
    uint64_t v40 = 16 * (v21 - 1);
    uint64_t v41 = v21 & 0xFFFFFFFC;
LABEL_16:
    unsigned int v42 = 0;
    *(float *)&a12 = v23 + (float)((float)v35 * v22);
    float32x4_t v43 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a12, 0);
    while (1)
    {
      uint64_t v44 = 0;
      *(float *)&a14 = v23 + (float)((float)v42 * v22);
      BOOL v45 = __CFADD__(v15, v38);
      uint64_t v46 = 16 * v15;
      unint64_t v47 = a6 + v46;
      if (a6 + v46 + v40 < (unint64_t)(a6 + v46)
        || a6 + 4 + v46 + v40 < (unint64_t)(a6 + 4 + v46)
        || a6 + 12 + v46 + v40 < (unint64_t)(a6 + 12 + v46)
        || a6 + 8 + v46 + v40 < (unint64_t)(a6 + 8 + v46)
        || v45
        || HIDWORD(v38)
        || ((uint64_t v44 = 0, v48 = v39 + v46, v37 < v39 + v46) ? (v49 = v47 >= v37 + 4 * v21) : (v49 = 1),
            v49 ? (char v50 = 0) : (char v50 = 1),
            v47 < v36 + 4 * v21 ? (BOOL v51 = v36 >= v48) : (BOOL v51 = 1),
            !v51 || (v50 & 1) != 0))
      {
        LODWORD(v52) = v15;
      }
      else
      {
        uint64_t v52 = (v15 + v41);
        float32x4_t v53 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a14, 0);
        uint64_t v54 = v21 & 0xFFFFFFFC;
        float v55 = (float32x4_t *)v17;
        float64x2_t v56 = (float32x4_t *)v18;
        do
        {
          float32x4_t v57 = *v56++;
          float32x4_t v58 = vsqrtq_f32(v57);
          float32x4_t v59 = *v55++;
          float32x4_t v60 = vdivq_f32(v59, v58);
          float32x4_t v61 = vmulq_f32(v59, v58);
          v72.val[0] = vsubq_f32(v53, vmulq_f32(v61, v16));
          v72.val[1] = vsubq_f32(v43, vmulq_f32(v60, v16));
          v72.val[2] = vaddq_f32(v61, v72.val[0]);
          v72.val[3] = vaddq_f32(v60, v72.val[1]);
          float64x2_t v62 = (float *)(a6 + 16 * v15);
          vst4q_f32(v62, v72);
          LODWORD(v15) = v15 + 4;
          v54 -= 4;
        }
        while (v54);
        uint64_t v44 = v21 & 0xFFFFFFFC;
        uint64_t v15 = v52;
        if (v41 == v21) {
          goto LABEL_17;
        }
      }
      LODWORD(v15) = v52;
      do
      {
        float v63 = sqrtf(*((float *)v18 + v44));
        float v64 = *((float *)v17 + v44);
        float v65 = v64 / v63;
        float v66 = v64 * v63;
        float v67 = *(float *)&a14 - (float)(v66 * 0.5);
        char v68 = (float *)(a6 + 16 * v15);
        float v69 = *(float *)&a12 - (float)(v65 * 0.5);
        *char v68 = v67;
        v68[1] = v69;
        v68[2] = v66 + v67;
        v68[3] = v65 + v69;
        uint64_t v15 = (v15 + 1);
        ++v44;
      }
      while (v21 != v44);
LABEL_17:
      if (++v42 == v20)
      {
        if (++v35 == v20) {
          goto LABEL_3;
        }
        goto LABEL_16;
      }
    }
  }
  return 0;
}

uint64_t TtDetNode::postProcess(uint64_t a1, uint64_t a2, int a3, _DWORD *a4, uint64_t a5, float *a6, double a7, double a8, float32x4_t a9, __n128 a10)
{
  if (*a4 != 1) {
    return 4294967289;
  }
  uint64_t result = 4294967292;
  if (a3 == 12 && a4[1] == 56945)
  {
    uint64_t v17 = 0;
    while (1)
    {
      uint64_t v18 = (long long *)(a2 + 24 * v17);
      uint64_t v19 = a1 + 24 * v17;
      unsigned int v20 = (unint64_t *)(v19 + 1480);
      long long v21 = *v18;
      *(void *)(v19 + 1496) = *((void *)v18 + 2);
      *(_OWORD *)(v19 + 1480) = v21;
      int v22 = *((_DWORD *)v18 + 5);
      if (v22 == 6) {
        goto LABEL_5;
      }
      if (v22) {
        return 4294967293;
      }
      float v23 = (unsigned int *)(a1 + 24 * v17);
      v23[375] = 6;
      uint64_t v24 = v23[373];
      uint64_t v25 = (4 * v24);
      v23[374] = v25;
      unint64_t v26 = *(void *)(a1 + 8 * v17 + 1384);
      *unsigned int v20 = v26;
      if (*((_DWORD *)v18 + 5)) {
        AcAttrNode::postProcess();
      }
      int v27 = *(_DWORD *)(a2 + 24 * v17 + 8);
      if (v27 != *(_DWORD *)(a1 + 24 * v17 + 1488)) {
        AcAttrNode::postProcess();
      }
      if (*(_DWORD *)(a2 + 24 * v17 + 12) != v24) {
        AcAttrNode::postProcess();
      }
      if (!v27 || !v24) {
        goto LABEL_5;
      }
      LODWORD(v21) = *(_DWORD *)(a1 + 4 * v17 + 896);
      uint64_t v28 = *(unsigned int *)(a2 + 24 * v17 + 16);
      unint64_t v29 = *(void *)v18;
      if (v24 >= 8) {
        break;
      }
      float v30 = (unsigned __int8 *)(v29 + 3);
      float v31 = (_DWORD *)(v26 + 12);
      do
      {
        a9.i8[0] = *(v30 - 3);
        a9.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)a9.f32)).u64[0];
        a9.f32[0] = (float)(*(float *)&v21 * (float)a9.i32[0]) + 0.0;
        *(v31 - 3) = a9.i32[0];
        if (v24 != 1)
        {
          a9.i8[0] = *(v30 - 2);
          a9.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)a9.f32)).u64[0];
          a9.f32[0] = (float)(*(float *)&v21 * (float)a9.i32[0]) + 0.0;
          *(v31 - 2) = a9.i32[0];
          if (v24 != 2)
          {
            a9.i8[0] = *(v30 - 1);
            a9.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)a9.f32)).u64[0];
            a9.f32[0] = (float)(*(float *)&v21 * (float)a9.i32[0]) + 0.0;
            *(v31 - 1) = a9.i32[0];
            if (v24 != 3)
            {
              a9.i8[0] = *v30;
              a9.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)a9.f32)).u64[0];
              a9.f32[0] = (float)(*(float *)&v21 * (float)a9.i32[0]) + 0.0;
              _DWORD *v31 = a9.i32[0];
              if (v24 != 4)
              {
                a9.i8[0] = v30[1];
                a9.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)a9.f32)).u64[0];
                a9.f32[0] = (float)(*(float *)&v21 * (float)a9.i32[0]) + 0.0;
                v31[1] = a9.i32[0];
                if (v24 != 5)
                {
                  a9.i8[0] = v30[2];
                  a9.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)a9.f32)).u64[0];
                  a9.f32[0] = (float)(*(float *)&v21 * (float)a9.i32[0]) + 0.0;
                  v31[2] = a9.i32[0];
                  if (v24 != 6)
                  {
                    a9.i8[0] = v30[3];
                    a9.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)a9.f32)).u64[0];
                    a9.f32[0] = (float)(*(float *)&v21 * (float)a9.i32[0]) + 0.0;
                    v31[3] = a9.i32[0];
                  }
                }
              }
            }
          }
        }
        v30 += v28;
        float v31 = (_DWORD *)((char *)v31 + v25);
        --v27;
      }
      while (v27);
LABEL_5:
      if (++v17 == 12)
      {
        std::chrono::steady_clock::now();
        unsigned int v49 = 0;
        for (uint64_t i = 0; i != 6; ++i)
        {
          BOOL v51 = (unsigned int *)(a1 + 4 * i);
          unsigned int v52 = v51[200];
          if (v52)
          {
            uint64_t v53 = v51[188];
            if (v53)
            {
              unsigned int v54 = v51[212];
              if (v54)
              {
                unsigned int v55 = 0;
                uint64_t v56 = a1 + 24 * i;
                float32x4_t v57 = (unsigned int *)(v56 + 1492);
                float32x4_t v58 = (void *)(v56 + 1480);
                float32x4_t v59 = (unsigned int *)(v56 + 1488);
                float32x4_t v60 = (_DWORD *)(v56 + 1496);
                unint64_t v61 = *v57;
                do
                {
                  for (unint64_t j = 0; j != v53; ++j)
                  {
                    if (j >= v61) {
LABEL_70:
                    }
                      AcAttrNode::postProcess();
                    int v64 = 0;
                    unsigned int v65 = v55;
                    do
                    {
                      if (*v59 <= v65) {
                        goto LABEL_70;
                      }
                      int v66 = *(_DWORD *)(*v58 + *v60 * v65 + 4 * j);
                      if ((v64 & 3) == 2)
                      {
                        *(_DWORD *)(*(void *)(a1 + 1352) + 16 * v49 + 12) = v66;
                      }
                      else if ((v64 & 3) == 1)
                      {
                        *(_DWORD *)(*(void *)(a1 + 1352) + 16 * v49) = v66;
                      }
                      else if ((v64 & 3) != 0)
                      {
                        *(_DWORD *)(*(void *)(a1 + 1352) + 16 * v49++ + 8) = v66;
                      }
                      else
                      {
                        *(_DWORD *)(*(void *)(a1 + 1352) + 16 * v49 + 4) = v66;
                      }
                      ++v64;
                      v65 += v52;
                    }
                    while (v54 != v64);
                  }
                  ++v55;
                }
                while (v55 != v52);
              }
              else
              {
                do
                {
                  uint64_t v62 = v53;
                  do
                    --v62;
                  while (v62);
                  ++v54;
                }
                while (v54 != v52);
              }
            }
            else
            {
              do
                --v52;
              while (v52);
            }
          }
        }
        int v67 = 0;
        int v68 = 0;
        for (uint64_t k = 6; k != 12; ++k)
        {
          uint64_t v70 = (unsigned int *)(a1 + 4 * k);
          unsigned int v71 = v70[200];
          if (v71)
          {
            uint64_t v72 = v70[188];
            if (v72)
            {
              unsigned int v73 = v70[212];
              if (v73)
              {
                unsigned int v74 = 0;
                uint64_t v75 = a1 + 24 * k;
                uint64_t v76 = (unsigned int *)(v75 + 1492);
                unsigned int v77 = (void *)(v75 + 1480);
                uint64_t v78 = (unsigned int *)(v75 + 1488);
                char v79 = (_DWORD *)(v75 + 1496);
                unint64_t v80 = *v76;
                do
                {
                  for (unint64_t m = 0; m != v72; ++m)
                  {
                    unsigned int v82 = v74;
                    unsigned int v83 = v73;
                    if (m >= v80) {
LABEL_96:
                    }
                      AcAttrNode::postProcess();
                    do
                    {
                      if (*v78 <= v82) {
                        goto LABEL_96;
                      }
                      *(_DWORD *)(*(void *)(a1 + 1360) + 4 * (v68 + 91 * v67)) = *(_DWORD *)(*v77 + *v79 * v82 + 4 * m);
                      unsigned int v84 = v68 + 1;
                      if ((v68 + 1) <= 0x5A) {
                        ++v68;
                      }
                      else {
                        int v68 = 0;
                      }
                      if (v84 > 0x5A) {
                        ++v67;
                      }
                      v82 += v71;
                      --v83;
                    }
                    while (v83);
                  }
                  ++v74;
                }
                while (v74 != v71);
              }
              else
              {
                do
                {
                  uint64_t v85 = v72;
                  do
                    --v85;
                  while (v85);
                  ++v73;
                }
                while (v73 != v71);
              }
            }
            else
            {
              do
                --v71;
              while (v71);
            }
          }
        }
        uint64_t v86 = *(unsigned int *)(a1 + 1328);
        uint64_t v87 = *(_OWORD **)(a1 + 1344);
        if (v86)
        {
          uint64_t v88 = *(const float **)(a1 + 1352);
          unint64_t v89 = *(void *)(a1 + 1336);
          if (v86 < 4)
          {
            uint64_t v90 = 0;
LABEL_132:
            uint64_t v125 = v86 - v90;
            uint64_t v126 = (16 * v90) | 8;
            uint64_t v127 = (float32x2_t *)(v89 + v126);
            int32x4_t v128 = (float32x2_t *)((char *)v87 + v126);
            int32x4_t v129 = (float32x2_t *)((char *)v88 + v126);
            float32x2_t v10 = (float32x2_t)0x3F0000003F000000;
            __asm
            {
              FMOV            V9.2S, #10.0
              FMOV            V10.2S, #5.0
            }
            do
            {
              float32x2_t v131 = v127[-1];
              float32x2_t v132 = vmul_f32(vadd_f32(v131, *v127), (float32x2_t)0x3F0000003F000000);
              float32x2_t v133 = vsub_f32(*v127, v131);
              float32x2_t v134 = vdiv_f32(v129[-1], _D9);
              float32x2_t v135 = *v129;
              v129 += 2;
              float32x2_t v136 = vdiv_f32(v135, _D10);
              float v192 = v136.f32[0];
              float v194 = expf(v136.f32[1]);
              v137.f32[0] = expf(v192);
              v137.f32[1] = v194;
              float32x2_t v138 = vmul_f32(v133, v137);
              float32x2_t v139 = vsub_f32(vmla_f32(v132, v133, v134), vmul_f32(v138, (float32x2_t)0x3F0000003F000000));
              v128[-1] = v139;
              *int32x4_t v128 = vadd_f32(v138, v139);
              v127 += 2;
              v128 += 2;
              --v125;
            }
            while (v125);
            goto LABEL_134;
          }
          uint64_t v90 = 0;
          uint64_t v91 = 16 * v86 - 12;
          uint64_t v92 = (char *)v87 + v91;
          unint64_t v93 = v89 + v91;
          uint64_t v94 = 16 * v86 - 8;
          uint64_t v95 = 16 * v86 - 4;
          unint64_t v96 = (unint64_t)v87 + v95;
          unint64_t v97 = v89 + v95;
          BOOL v99 = (unint64_t)v87 + 4 < v89 + v94 && v89 + 4 < (unint64_t)v87 + v94;
          BOOL v101 = (unint64_t)v87 + 12 < v89 + 16 * v86 && v89 + 12 < (unint64_t)&v87[v86];
          BOOL v103 = (unint64_t)v87 + 8 < v97 && v89 + 8 < v96;
          if (v89 < (unint64_t)v92 && (unint64_t)v87 < v93) {
            goto LABEL_132;
          }
          if (v99) {
            goto LABEL_132;
          }
          if (v101) {
            goto LABEL_132;
          }
          if (v103) {
            goto LABEL_132;
          }
          int32x4_t v175 = *(const float **)(a1 + 1352);
          uint64_t v176 = *(unsigned int *)(a1 + 1328);
          uint64_t v105 = v86 & 0xFFFFFFFC;
          __asm
          {
            FMOV            V1.4S, #10.0
            FMOV            V0.4S, #5.0
          }
          float32x4_t v177 = _Q0;
          float32x4_t v178 = _Q1;
          uint64_t v174 = v105;
          int v110 = *(const float **)(a1 + 1336);
          uint64_t v111 = *(float **)(a1 + 1344);
          do
          {
            float32x4x4_t v197 = vld4q_f32(v110);
            v110 += 16;
            v112.i64[0] = 0x3F0000003F000000;
            v112.i64[1] = 0x3F0000003F000000;
            float32x4_t v182 = vmulq_f32(vaddq_f32(v197.val[1], v197.val[3]), v112);
            float32x4_t v183 = vmulq_f32(vaddq_f32(v197.val[0], v197.val[2]), v112);
            float32x4_t v184 = vsubq_f32(v197.val[2], v197.val[0]);
            float32x4x4_t v199 = vld4q_f32(v88);
            v88 += 16;
            float32x4_t v181 = vsubq_f32(v197.val[3], v197.val[1]);
            float32x4_t v179 = vdivq_f32(v199.val[1], v178);
            float32x4_t v180 = vdivq_f32(v199.val[0], v178);
            float32x4_t v189 = vdivq_f32(v199.val[2], v177);
            float32x4_t v193 = vdivq_f32(v199.val[3], v177);
            float v185 = expf(v189.f32[1]);
            v113.f32[0] = expf(v189.f32[0]);
            v113.f32[1] = v185;
            float32x4_t v186 = v113;
            float v114 = expf(v189.f32[2]);
            float32x4_t v115 = v186;
            v115.f32[2] = v114;
            float32x4_t v187 = v115;
            float v116 = expf(v189.f32[3]);
            float32x4_t v117 = v187;
            v117.f32[3] = v116;
            float32x4_t v188 = vmulq_f32(v184, v117);
            v189.i32[0] = expf(v193.f32[1]);
            v118.f32[0] = expf(v193.f32[0]);
            v118.i32[1] = v189.i32[0];
            float32x4_t v190 = v118;
            float v119 = expf(v193.f32[2]);
            float32x4_t v120 = v190;
            v120.f32[2] = v119;
            float32x4_t v191 = v120;
            float v121 = expf(v193.f32[3]);
            float32x4_t v122 = v191;
            v122.f32[3] = v121;
            float32x4_t v123 = vmulq_f32(v181, v122);
            v124.i64[0] = 0x3F0000003F000000;
            v124.i64[1] = 0x3F0000003F000000;
            v198.val[0] = vsubq_f32(vmlaq_f32(v183, v184, v180), vmulq_f32(v188, v124));
            v198.val[1] = vsubq_f32(vmlaq_f32(v182, v181, v179), vmulq_f32(v123, v124));
            v198.val[3] = vaddq_f32(v123, v198.val[1]);
            v198.val[2] = vaddq_f32(v188, v198.val[0]);
            vst4q_f32(v111, v198);
            v111 += 16;
            v105 -= 4;
          }
          while (v105);
          uint64_t v88 = v175;
          uint64_t v86 = v176;
          uint64_t v90 = v174;
          if (v174 != v176) {
            goto LABEL_132;
          }
        }
LABEL_134:
        if (a4[3] == 2)
        {
          uint64_t v140 = *(void *)(a1 + 1360);
          if (*(_DWORD *)(a5 + 180) == 1)
          {
            float32x2_t v10 = *(float32x2_t *)(a5 + 192);
            _D9 = *(float32x2_t *)(a5 + 200);
            LODWORD(v196[0]) = *(_DWORD *)(a5 + 188);
            uint64_t result = TtDetNode::multiclassNonmaxSuppress(v87, v140, v86, (uint64_t)v196, 1u, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 36), *(void *)(a1 + 1368), *(float *)(a1 + 48), *(float *)(a1 + 44), *(void *)(a1 + 1376));
            goto LABEL_139;
          }
        }
        else
        {
          uint64_t v140 = *(void *)(a1 + 1360);
        }
        a4[3] = 1;
        uint64_t result = TtDetNode::multiclassNonmaxSuppress(v87, v140, v86, a1 + 52, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 36), *(void *)(a1 + 1368), *(float *)(a1 + 48), *(float *)(a1 + 44), *(void *)(a1 + 1376));
LABEL_139:
        *(_DWORD *)(a5 + 180) = result;
        if (result)
        {
          *(float32x2_t *)v141.f32 = vcvt_f32_u32(*(uint32x2_t *)(a1 + 20));
          v141.i64[1] = v141.i64[0];
          uint64_t v142 = result;
          uint64_t v143 = a5 + 188;
          uint64_t v144 = (float32x2_t *)(*(void *)(a1 + 1376) + 8);
          do
          {
            *(float32x2_t *)v145.f32 = v144[-1];
            *(float32x2_t *)&v145.u32[2] = vsub_f32(*v144, *(float32x2_t *)v145.f32);
            *(float32x4_t *)(v143 + 4) = vmulq_f32(v145, v141);
            int v146 = v144[1].i32[0];
            if (!v146) {
              TtDetNode::postProcess();
            }
            if (v146 >= 91) {
              TtDetNode::postProcess();
            }
            *(_DWORD *)uint64_t v143 = v146;
            *(_DWORD *)(v143 + 80) = 0;
            v143 += 88;
            uint64_t v144 = (float32x2_t *)((char *)v144 + 36);
            --v142;
          }
          while (v142);
        }
        if (a6)
        {
          if (a4[3] == 1)
          {
            float v147 = *a6;
            if (*a6 >= 0.0)
            {
              float v148 = a6[1];
              if (v148 >= 0.0 && result != 0)
              {
                uint64_t v150 = 0;
                int v151 = (float *)(a5 + 204);
                unsigned int v152 = -1;
                float v153 = 1000000.0;
                do
                {
                  float v155 = *(v151 - 3);
                  float v154 = *(v151 - 2);
                  float v156 = v155 + *(v151 - 1);
                  float v157 = v154 + *v151;
                  if (v155 <= v147 && v147 <= v156 && v154 <= v148 && v148 <= v157)
                  {
                    float v161 = sqrtf((float)((float)(v148 - (float)((float)(v154 + v157) * 0.5))* (float)(v148 - (float)((float)(v154 + v157) * 0.5)))+ (float)((float)(v147 - (float)((float)(v155 + v156) * 0.5))* (float)(v147 - (float)((float)(v155 + v156) * 0.5))));
                    if (v161 < v153)
                    {
                      unsigned int v152 = v150;
                      float v153 = v161;
                    }
                  }
                  ++v150;
                  v151 += 22;
                }
                while (result != v150);
                if ((v152 & 0x80000000) == 0)
                {
                  *(_DWORD *)(a5 + 180) = 1;
                  if (v152)
                  {
                    uint64_t v171 = a5 + 184 + 88 * v152;
                    long long v172 = *(_OWORD *)(v171 + 48);
                    *(_OWORD *)(a5 + 216) = *(_OWORD *)(v171 + 32);
                    *(_OWORD *)(a5 + 232) = v172;
                    *(_OWORD *)(a5 + 248) = *(_OWORD *)(v171 + 64);
                    long long v173 = *(_OWORD *)(v171 + 16);
                    *(_OWORD *)(a5 + 184) = *(_OWORD *)v171;
                    *(void *)(a5 + 264) = *(void *)(v171 + 80);
                    *(_OWORD *)(a5 + 200) = v173;
                  }
                  uint64_t result = 0;
                  a4[3] = 2;
                  return result;
                }
              }
            }
          }
          else
          {
            if (!result) {
              return result;
            }
            unint64_t v162 = 0;
            unsigned int v163 = 0;
            v196[0] = v10;
            v196[1] = vadd_f32(_D9, v10);
            int32x4_t v164 = (float32x2_t *)(a5 + 200);
            float v165 = -1.0;
            do
            {
              float32x2_t v166 = vadd_f32(v164[-1], *v164);
              v195[0] = v164[-1];
              v195[1] = v166;
              ttDetRectOverlap((float *)v196, (float *)v195);
              if (v167 > v165)
              {
                float v165 = v167;
                unsigned int v163 = v162;
              }
              ++v162;
              v164 += 11;
            }
            while (v162 < *(unsigned int *)(a5 + 180));
            *(_DWORD *)(a5 + 180) = 1;
            if (v163)
            {
              uint64_t v168 = a5 + 184 + 88 * v163;
              long long v169 = *(_OWORD *)(v168 + 48);
              *(_OWORD *)(a5 + 216) = *(_OWORD *)(v168 + 32);
              *(_OWORD *)(a5 + 232) = v169;
              *(_OWORD *)(a5 + 248) = *(_OWORD *)(v168 + 64);
              long long v170 = *(_OWORD *)(v168 + 16);
              *(_OWORD *)(a5 + 184) = *(_OWORD *)v168;
              *(void *)(a5 + 264) = *(void *)(v168 + 80);
              *(_OWORD *)(a5 + 200) = v170;
            }
          }
        }
        return 0;
      }
    }
    uint64_t v32 = 0;
    a9 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v21, 0);
    uint64_t v33 = v24 & 0xFFFFFFF8;
    unint64_t v34 = v26;
    unint64_t v35 = v29;
    while (1)
    {
      if (v34 >= v29 + v24 + v32 * v28 || v35 >= v26 + 4 * v24 + v32 * v25)
      {
        if (v24 < 0x10)
        {
          uint64_t v37 = 0;
LABEL_32:
          uint64_t v38 = 4 * v37;
          do
          {
            int8x8_t v39 = *(int8x8_t *)(v35 + v37);
            float32x4_t v40 = vmlaq_f32((float32x4_t)0, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v39, 0), 8uLL), 8uLL))), a9);
            a10 = (__n128)vmlaq_f32((float32x4_t)0, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v39, 0), 8uLL), 8uLL))), a9);
            unint64_t v41 = v34 + v38;
            *(float32x4_t *)unint64_t v41 = v40;
            *(__n128 *)(v41 + 16) = a10;
            v37 += 8;
            v38 += 32;
          }
          while (v33 != v37);
          uint64_t v42 = v24 & 0xFFFFFFF8;
          if (v33 == v24) {
            goto LABEL_24;
          }
          goto LABEL_35;
        }
        uint64_t v43 = 0;
        uint64_t v44 = (int8x16_t *)v35;
        do
        {
          int8x16_t v45 = *v44++;
          int8x8_t v46 = (int8x8_t)vextq_s8(v45, v45, 8uLL).u64[0];
          float32x4_t v47 = vmlaq_f32((float32x4_t)0, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v46, 0), 8uLL), 8uLL))), a9);
          a10 = (__n128)vmlaq_f32((float32x4_t)0, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v46, 0), 8uLL), 8uLL))), a9);
          uint64_t v48 = v34 + v43;
          *(float32x4_t *)uint64_t v48 = vmlaq_f32((float32x4_t)0, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v45.i8, 0), 8uLL), 8uLL))), a9);
          *(float32x4_t *)(v48 + 16) = vmlaq_f32((float32x4_t)0, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v45.i8, 0), 8uLL), 8uLL))), a9);
          *(float32x4_t *)(v48 + 32) = v47;
          *(__n128 *)(v48 + 48) = a10;
          v43 += 64;
        }
        while (((4 * v24) & 0x3FFFFFFC0) != v43);
        if ((v24 & 0xFFFFFFF0) == v24) {
          goto LABEL_24;
        }
        uint64_t v37 = v24 & 0xFFFFFFF0;
        uint64_t v42 = v37;
        if ((v24 & 8) != 0) {
          goto LABEL_32;
        }
      }
      else
      {
        uint64_t v42 = 0;
      }
      do
      {
LABEL_35:
        a10.n128_u8[0] = *(unsigned char *)(v35 + v42);
        a10.n128_u64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8((int8x8_t)a10.n128_u64[0])).u64[0];
        a10.n128_f32[0] = (float)(*(float *)&v21 * (float)a10.n128_i32[0]) + 0.0;
        *(_DWORD *)(v34 + 4 * v42++) = a10.n128_u32[0];
      }
      while (v24 != v42);
LABEL_24:
      v35 += v28;
      v34 += v25;
      if (++v32 == v27) {
        goto LABEL_5;
      }
    }
  }
  return result;
}

void TtDetNode::decodeRelBoxes(const float *a1, const float *a2, unsigned int a3, float *a4)
{
  if (a3)
  {
    uint64_t v7 = a3;
    if (a3 < 4)
    {
      uint64_t v8 = 0;
LABEL_32:
      uint64_t v53 = v7 - v8;
      uint64_t v54 = (16 * v8) | 8;
      unsigned int v55 = (float32x2_t *)((char *)a1 + v54);
      uint64_t v56 = (float32x2_t *)((char *)a4 + v54);
      float32x4_t v57 = (float32x2_t *)((char *)a2 + v54);
      __asm
      {
        FMOV            V9.2S, #10.0
        FMOV            V10.2S, #5.0
      }
      do
      {
        float32x2_t v60 = v57[-1];
        float32x2_t v61 = vmul_f32(vadd_f32(v60, *v57), (float32x2_t)0x3F0000003F000000);
        float32x2_t v62 = vsub_f32(*v57, v60);
        float32x2_t v63 = vdiv_f32(v55[-1], _D9);
        float32x2_t v64 = *v55;
        v55 += 2;
        float32x2_t v65 = vdiv_f32(v64, _D10);
        float v84 = v65.f32[0];
        float v86 = expf(v65.f32[1]);
        v66.f32[0] = expf(v84);
        v66.f32[1] = v86;
        float32x2_t v67 = vmul_f32(v62, v66);
        float32x2_t v68 = vsub_f32(vmla_f32(v61, v62, v63), vmul_f32(v67, (float32x2_t)0x3F0000003F000000));
        v56[-1] = v68;
        float32x2_t *v56 = vadd_f32(v67, v68);
        v56 += 2;
        v57 += 2;
        --v53;
      }
      while (v53);
      return;
    }
    uint64_t v8 = 0;
    uint64_t v9 = 16 * a3 - 12;
    float32x2_t v10 = (char *)a4 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = 16 * a3 - 8;
    uint64_t v13 = (float *)((char *)a4 + v12);
    uint64_t v14 = a2 + 1;
    unint64_t v15 = (unint64_t)a2 + v12;
    float32x4_t v16 = a4 + 3;
    uint64_t v17 = &a4[4 * a3];
    uint64_t v18 = a2 + 3;
    uint64_t v19 = &a2[4 * a3];
    unsigned int v20 = a4 + 2;
    uint64_t v21 = 16 * a3 - 4;
    unint64_t v22 = (unint64_t)a4 + v21;
    _CF = (unint64_t)(a4 + 1) >= v15;
    float v23 = (float *)((char *)a2 + v21);
    _CF = _CF || v14 >= v13;
    char v25 = !_CF;
    BOOL v27 = v16 < v19 && v18 < v17;
    BOOL v29 = v20 < v23 && (unint64_t)(a2 + 2) < v22;
    if (v10 > (char *)a2 && v11 > (char *)a4) {
      goto LABEL_32;
    }
    if (v25) {
      goto LABEL_32;
    }
    if (v27) {
      goto LABEL_32;
    }
    if (v29) {
      goto LABEL_32;
    }
    uint64_t v8 = v7 & 0xFFFFFFFC;
    __asm
    {
      FMOV            V1.4S, #10.0
      FMOV            V0.4S, #5.0
    }
    float32x4_t v69 = _Q0;
    float32x4_t v70 = _Q1;
    uint64_t v36 = v8;
    uint64_t v37 = a2;
    uint64_t v38 = a1;
    int8x8_t v39 = a4;
    do
    {
      float32x4x4_t v87 = vld4q_f32(v37);
      v37 += 16;
      v40.i64[0] = 0x3F0000003F000000;
      v40.i64[1] = 0x3F0000003F000000;
      float32x4_t v74 = vmulq_f32(vaddq_f32(v87.val[1], v87.val[3]), v40);
      float32x4_t v75 = vmulq_f32(vaddq_f32(v87.val[0], v87.val[2]), v40);
      float32x4_t v76 = vsubq_f32(v87.val[2], v87.val[0]);
      float32x4x4_t v89 = vld4q_f32(v38);
      v38 += 16;
      float32x4_t v73 = vsubq_f32(v87.val[3], v87.val[1]);
      float32x4_t v71 = vdivq_f32(v89.val[1], v70);
      float32x4_t v72 = vdivq_f32(v89.val[0], v70);
      float32x4_t v85 = vdivq_f32(v89.val[3], v69);
      float32x4_t v81 = vdivq_f32(v89.val[2], v69);
      float v77 = expf(v81.f32[1]);
      v41.f32[0] = expf(v81.f32[0]);
      v41.f32[1] = v77;
      float32x4_t v78 = v41;
      float v42 = expf(v81.f32[2]);
      float32x4_t v43 = v78;
      v43.f32[2] = v42;
      float32x4_t v79 = v43;
      float v44 = expf(v81.f32[3]);
      float32x4_t v45 = v79;
      v45.f32[3] = v44;
      float32x4_t v80 = vmulq_f32(v76, v45);
      v81.i32[0] = expf(v85.f32[1]);
      v46.f32[0] = expf(v85.f32[0]);
      v46.i32[1] = v81.i32[0];
      float32x4_t v82 = v46;
      float v47 = expf(v85.f32[2]);
      float32x4_t v48 = v82;
      v48.f32[2] = v47;
      float32x4_t v83 = v48;
      float v49 = expf(v85.f32[3]);
      float32x4_t v50 = v83;
      v50.f32[3] = v49;
      float32x4_t v51 = vmulq_f32(v73, v50);
      v52.i64[0] = 0x3F0000003F000000;
      v52.i64[1] = 0x3F0000003F000000;
      v88.val[0] = vsubq_f32(vmlaq_f32(v75, v76, v72), vmulq_f32(v80, v52));
      v88.val[1] = vsubq_f32(vmlaq_f32(v74, v73, v71), vmulq_f32(v51, v52));
      v88.val[3] = vaddq_f32(v51, v88.val[1]);
      v88.val[2] = vaddq_f32(v80, v88.val[0]);
      vst4q_f32(v39, v88);
      v39 += 16;
      v36 -= 4;
    }
    while (v36);
    if (v8 != v7) {
      goto LABEL_32;
    }
  }
}

uint64_t TtDetNode::multiclassNonmaxSuppress(_OWORD *a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, unsigned int a6, int a7, uint64_t a8, float a9, float a10, uint64_t a11)
{
  initHeap((uint64_t)&v43, a11, a7 + 1, (uint64_t)minHeapCompare);
  if (a5)
  {
    if (a3)
    {
      uint64_t v17 = 0;
      uint64_t v36 = a5;
      uint64_t v18 = a3;
      do
      {
        unint64_t v19 = 0;
        uint64_t v20 = *(unsigned int *)(a4 + 4 * v17);
        uint64_t v21 = a1;
        unint64_t v22 = (float *)(a2 + 4 * v20);
        uint64_t v23 = v18;
        do
        {
          float v24 = 1.0 / (float)(expf(-*v22) + 1.0);
          if (v24 > a10)
          {
            uint64_t v25 = a8 + 36 * v19;
            *(_OWORD *)uint64_t v25 = *v21;
            *(_DWORD *)(v25 + 16) = v20;
            *(float *)(v25 + 24) = v24;
            unint64_t v19 = (v19 + 1);
          }
          v22 += 91;
          ++v21;
          --v23;
        }
        while (v23);
        unsigned int v26 = ttNonMaxSuppression2(a8, v19, a9);
        if (v26 >= a6) {
          uint64_t v27 = a6;
        }
        else {
          uint64_t v27 = v26;
        }
        if (v27)
        {
          uint64_t v28 = a8;
          do
          {
            long long v29 = *(_OWORD *)(v28 + 16);
            long long v40 = *(_OWORD *)v28;
            long long v41 = v29;
            int v42 = *(_DWORD *)(v28 + 32);
            addToHeap(&v43, (uint64_t)&v40);
            v28 += 36;
            --v27;
          }
          while (v27);
        }
        ++v17;
      }
      while (v17 != v36);
    }
    else
    {
      int v30 = 0;
      do
      {
        unsigned int v31 = ttNonMaxSuppression2(a8, 0, a9);
        if (v31 >= a6) {
          uint64_t v32 = a6;
        }
        else {
          uint64_t v32 = v31;
        }
        if (v32)
        {
          uint64_t v33 = a8;
          do
          {
            long long v34 = *(_OWORD *)(v33 + 16);
            long long v40 = *(_OWORD *)v33;
            long long v41 = v34;
            int v42 = *(_DWORD *)(v33 + 32);
            addToHeap(&v43, (uint64_t)&v40);
            v33 += 36;
            --v32;
          }
          while (v32);
        }
        ++v30;
      }
      while (v30 != a5);
    }
  }
  *(_DWORD *)(a11 + 24) = -1027080192;
  bmHeapsort(a11, v44 + 1, 0x24uLL, (int (*)(uint64_t, uint64_t))ttDetRectScoreCompare);
  return v44;
}

uint64_t TtDetNode::getParams(uint64_t a1, _DWORD *a2, char *a3)
{
  if (*a2 != 1) {
    return 4294967289;
  }
  if (a2[1] != 56945) {
    return 4294967292;
  }
  bzero(a3, 0x278uLL);
  *(void *)a3 = *(void *)(a1 + 20);
  *((_DWORD *)a3 + 2) = *(_DWORD *)(a1 + 752);
  *((_DWORD *)a3 + 14) = *(_DWORD *)(a1 + 800);
  *((_DWORD *)a3 + 26) = *(_DWORD *)(a1 + 848);
  *((_DWORD *)a3 + 3) = *(_DWORD *)(a1 + 756);
  *((_DWORD *)a3 + 15) = *(_DWORD *)(a1 + 804);
  *((_DWORD *)a3 + 27) = *(_DWORD *)(a1 + 852);
  *((_DWORD *)a3 + 4) = *(_DWORD *)(a1 + 760);
  *((_DWORD *)a3 + 16) = *(_DWORD *)(a1 + 808);
  *((_DWORD *)a3 + 28) = *(_DWORD *)(a1 + 856);
  *((_DWORD *)a3 + 5) = *(_DWORD *)(a1 + 764);
  *((_DWORD *)a3 + 17) = *(_DWORD *)(a1 + 812);
  *((_DWORD *)a3 + 29) = *(_DWORD *)(a1 + 860);
  *((_DWORD *)a3 + 6) = *(_DWORD *)(a1 + 768);
  *((_DWORD *)a3 + 18) = *(_DWORD *)(a1 + 816);
  *((_DWORD *)a3 + 30) = *(_DWORD *)(a1 + 864);
  *((_DWORD *)a3 + 7) = *(_DWORD *)(a1 + 772);
  *((_DWORD *)a3 + 19) = *(_DWORD *)(a1 + 820);
  *((_DWORD *)a3 + 31) = *(_DWORD *)(a1 + 868);
  *((_DWORD *)a3 + 8) = *(_DWORD *)(a1 + 776);
  *((_DWORD *)a3 + 20) = *(_DWORD *)(a1 + 824);
  *((_DWORD *)a3 + 32) = *(_DWORD *)(a1 + 872);
  *((_DWORD *)a3 + 9) = *(_DWORD *)(a1 + 780);
  *((_DWORD *)a3 + 21) = *(_DWORD *)(a1 + 828);
  *((_DWORD *)a3 + 33) = *(_DWORD *)(a1 + 876);
  *((_DWORD *)a3 + 10) = *(_DWORD *)(a1 + 784);
  *((_DWORD *)a3 + 22) = *(_DWORD *)(a1 + 832);
  *((_DWORD *)a3 + 34) = *(_DWORD *)(a1 + 880);
  *((_DWORD *)a3 + 11) = *(_DWORD *)(a1 + 788);
  *((_DWORD *)a3 + 23) = *(_DWORD *)(a1 + 836);
  *((_DWORD *)a3 + 35) = *(_DWORD *)(a1 + 884);
  *((_DWORD *)a3 + 12) = *(_DWORD *)(a1 + 792);
  *((_DWORD *)a3 + 24) = *(_DWORD *)(a1 + 840);
  *((_DWORD *)a3 + 36) = *(_DWORD *)(a1 + 888);
  *((_DWORD *)a3 + 13) = *(_DWORD *)(a1 + 796);
  *((_DWORD *)a3 + 25) = *(_DWORD *)(a1 + 844);
  *((_DWORD *)a3 + 37) = *(_DWORD *)(a1 + 892);
  *((_DWORD *)a3 + 50) = *(_DWORD *)(a1 + 896);
  strncpy(a3 + 248, (const char *)(a1 + 944), 0x20uLL);
  *((_DWORD *)a3 + 51) = *(_DWORD *)(a1 + 900);
  strncpy(a3 + 280, (const char *)(a1 + 976), 0x20uLL);
  *((_DWORD *)a3 + 52) = *(_DWORD *)(a1 + 904);
  strncpy(a3 + 312, (const char *)(a1 + 1008), 0x20uLL);
  *((_DWORD *)a3 + 53) = *(_DWORD *)(a1 + 908);
  strncpy(a3 + 344, (const char *)(a1 + 1040), 0x20uLL);
  *((_DWORD *)a3 + 54) = *(_DWORD *)(a1 + 912);
  strncpy(a3 + 376, (const char *)(a1 + 1072), 0x20uLL);
  *((_DWORD *)a3 + 55) = *(_DWORD *)(a1 + 916);
  strncpy(a3 + 408, (const char *)(a1 + 1104), 0x20uLL);
  *((_DWORD *)a3 + 56) = *(_DWORD *)(a1 + 920);
  strncpy(a3 + 440, (const char *)(a1 + 1136), 0x20uLL);
  *((_DWORD *)a3 + 57) = *(_DWORD *)(a1 + 924);
  strncpy(a3 + 472, (const char *)(a1 + 1168), 0x20uLL);
  *((_DWORD *)a3 + 58) = *(_DWORD *)(a1 + 928);
  strncpy(a3 + 504, (const char *)(a1 + 1200), 0x20uLL);
  *((_DWORD *)a3 + 59) = *(_DWORD *)(a1 + 932);
  strncpy(a3 + 536, (const char *)(a1 + 1232), 0x20uLL);
  *((_DWORD *)a3 + 60) = *(_DWORD *)(a1 + 936);
  strncpy(a3 + 568, (const char *)(a1 + 1264), 0x20uLL);
  *((_DWORD *)a3 + 61) = *(_DWORD *)(a1 + 940);
  strncpy(a3 + 600, (const char *)(a1 + 1296), 0x20uLL);
  return 0;
}

BOOL minHeapCompare(uint64_t a1, uint64_t a2)
{
  return *(float *)(a1 + 24) < *(float *)(a2 + 24);
}

uint64_t TtDetNode::getTrkScheduleInfo(uint64_t a1, _DWORD *a2, BOOL *a3)
{
  if (*a2 != 1 || a2[1] != 56945) {
    return 4294967289;
  }
  uint64_t result = 0;
  *a3 = a2[3] == 2;
  return result;
}

uint64_t FTFillPixelBufferWithColor(__CVBuffer *a1, unsigned int a2)
{
  if (CVPixelBufferLockBaseAddress(a1, 0))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to lock pixel buffer.");
    goto LABEL_12;
  }
  size_t Height = CVPixelBufferGetHeight(a1);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
  if (Height && BytesPerRow)
  {
    uint64_t v7 = 0;
    *(int32x2_t *)&long long v8 = vdup_n_s32(a2);
    *((void *)&v8 + 1) = v8;
    do
    {
      for (size_t i = 0; i < BytesPerRow; i += 64)
      {
        float32x2_t v10 = &BaseAddress[i];
        *(_OWORD *)float32x2_t v10 = v8;
        *((_OWORD *)v10 + 1) = v8;
        *((_OWORD *)v10 + 2) = v8;
        *((_OWORD *)v10 + 3) = v8;
      }
      ++v7;
      BaseAddress += 64 * (BytesPerRow >> 6);
    }
    while (v7 != Height);
  }
  uint64_t result = CVPixelBufferUnlockBaseAddress(a1, 0);
  if (result)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
LABEL_12:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return result;
}

void sub_21765EE78(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21765EE8C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21765EEA0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ik::PixelBufferScopeLock::~PixelBufferScopeLock((ik::PixelBufferScopeLock *)va);
  _Unwind_Resume(a1);
}

uint64_t FTComputeMeanColor(ft *a1, unint64_t a2, _DWORD *a3)
{
  if (!a1)
  {
    uint64_t v20 = ft::GetOsLog(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      FTComputeMeanColor_cold_1(v20);

      return 0xFFFFFFFFLL;
    }
LABEL_7:

    return 0xFFFFFFFFLL;
  }
  if (!a3)
  {
    uint64_t v20 = ft::GetOsLog(a1);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      FTComputeMeanColor_cold_2(v20);

      return 0xFFFFFFFFLL;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 0;
  unint64_t v4 = 0;
  unsigned int v5 = 0x100u / *(_DWORD *)a1;
  int32x4_t v6 = vdupq_n_s32(v5);
  v7.i32[0] = 0;
  v7.i32[1] = v5;
  v7.u64[1] = (unint64_t)vmul_s32(*(int32x2_t *)v6.i8, (int32x2_t)0x300000002);
  int32x4_t v8 = vdupq_n_s32(16 * v5);
  uint16x4_t v9 = (uint16x4_t)vmovn_s32(v6);
  int32x4_t v10 = (int32x4_t)vmull_u16(v9, (uint16x4_t)0xB000A00090008);
  int32x4_t v11 = (int32x4_t)vmull_u16(v9, (uint16x4_t)0x7000600050004);
  int32x4_t v12 = (int32x4_t)vmull_u16(v9, (uint16x4_t)0xF000E000D000CLL);
  uint64x2_t v13 = 0uLL;
  do
  {
    int8x16_t v14 = (int8x16_t)vaddq_s32(vmlaq_s32(vmulq_s32(*(int32x4_t *)(*((void *)a1 + 193) + v3 + 32), v10), *(int32x4_t *)(*((void *)a1 + 193) + v3), v7), vmlaq_s32(vmulq_s32(*(int32x4_t *)(*((void *)a1 + 193) + v3 + 48), v12), *(int32x4_t *)(*((void *)a1 + 193) + v3 + 16), v11));
    *(int32x2_t *)v14.i8 = vadd_s32(*(int32x2_t *)v14.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v14, v14, 8uLL));
    int8x16_t v15 = (int8x16_t)vaddq_s32(vmlaq_s32(vmulq_s32(*(int32x4_t *)(*((void *)a1 + 194) + v3 + 32), v10), *(int32x4_t *)(*((void *)a1 + 194) + v3), v7), vmlaq_s32(vmulq_s32(*(int32x4_t *)(*((void *)a1 + 194) + v3 + 48), v12), *(int32x4_t *)(*((void *)a1 + 194) + v3 + 16), v11));
    *(int32x2_t *)v15.i8 = vadd_s32(*(int32x2_t *)v15.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL));
    uint64x2_t v13 = vaddw_u32(v13, (uint32x2_t)vadd_s32(vzip1_s32(*(int32x2_t *)v15.i8, *(int32x2_t *)v14.i8), vzip2_s32(*(int32x2_t *)v15.i8, *(int32x2_t *)v14.i8)));
    int8x16_t v16 = (int8x16_t)vaddq_s32(vmlaq_s32(vmulq_s32(*(int32x4_t *)(*((void *)a1 + 195) + v3 + 32), v10), *(int32x4_t *)(*((void *)a1 + 195) + v3), v7), vmlaq_s32(vmulq_s32(*(int32x4_t *)(*((void *)a1 + 195) + v3 + 48), v12), *(int32x4_t *)(*((void *)a1 + 195) + v3 + 16), v11));
    *(int32x2_t *)v16.i8 = vadd_s32(*(int32x2_t *)v16.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v16, v16, 8uLL));
    v4 += vadd_s32(*(int32x2_t *)v16.i8, vdup_lane_s32(*(int32x2_t *)v16.i8, 1)).u32[0];
    int32x4_t v7 = vaddq_s32(v7, v8);
    int32x4_t v11 = vaddq_s32(v11, v8);
    int32x4_t v10 = vaddq_s32(v10, v8);
    int32x4_t v12 = vaddq_s32(v12, v8);
    v3 += 64;
  }
  while (v3 != 512);
  uint64_t result = 0;
  int32x2_t v18 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vdivq_f64(vcvtq_f64_u64(v13), (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)a2), 0)))));
  v19.i16[3] = 255;
  v19.i64[1] = 0xFF00FF00FF00FFLL;
  v19.i16[0] = llround((double)v4 / (double)a2);
  v19.i16[1] = v18.i16[0];
  v19.i16[2] = v18.i16[2];
  *a3 = vmovn_s16(v19).u32[0];
  return result;
}

uint64_t TtDetCreate(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    operator new();
  }
  return 4294967292;
}

void sub_21765F1C0(_Unwind_Exception *a1)
{
  MEMORY[0x21D449420](v1, 0x10A0C40BF7F8171);
  _Unwind_Resume(a1);
}

uint64_t TtDetDestroy(TtDetNode **a1)
{
  if (!a1) {
    return 4294967292;
  }
  uint64_t v2 = *a1;
  if (!v2) {
    return 4294967292;
  }
  TtDetNode::~TtDetNode(v2);
  MEMORY[0x21D449420]();
  MEMORY[0x21D449420](a1, 0x20C4093837F09);
  return 0;
}

uint64_t TtDetStart(void *a1)
{
  uint64_t result = 4294967292;
  if (a1)
  {
    if (*a1) {
      return 0;
    }
    else {
      return 4294967292;
    }
  }
  return result;
}

uint64_t TtDetStop(void *a1)
{
  uint64_t result = 4294967292;
  if (a1)
  {
    if (*a1) {
      return 0;
    }
    else {
      return 4294967292;
    }
  }
  return result;
}

uint64_t TtDetGetParams(uint64_t *a1, _DWORD *a2, char *a3)
{
  if (!a1) {
    return 4294967292;
  }
  uint64_t v3 = *a1;
  BOOL v4 = !v3 || a2 == 0;
  if (v4 || a3 == 0) {
    return 4294967292;
  }
  else {
    return TtDetNode::getParams(v3, a2, a3);
  }
}

uint64_t TtDetPreProcessRef(uint64_t *a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  if (!a1) {
    return 4294967292;
  }
  uint64_t v5 = *a1;
  if (!*a1) {
    return 4294967292;
  }
  uint64_t result = 4294967292;
  if (a2)
  {
    if (a4)
    {
      if (a5)
      {
        if (*(void *)a3)
        {
          if (*(void *)a5)
          {
            uint64_t result = TtDetNode::getParams(v5, a4, (char *)v13);
            if (!result)
            {
              unsigned int v9 = *(_DWORD *)(a3 + 12);
              if ((v9 & 3) == 0
                && (unsigned int v10 = *(_DWORD *)(a5 + 12), v10 == 4 * v13[0])
                && (unsigned int v11 = *(_DWORD *)(a5 + 8), v11 == v13[1]))
              {
                unsigned int v12 = *(_DWORD *)(a5 + 16);
                uint64_t result = 4294967292;
                if (v12 >= v10 && (v12 & 0x3F) == 0)
                {
                  if (rtcv::simResize(*(void **)a3, v9 >> 2, *(_DWORD *)(a3 + 8), *(_DWORD *)(a3 + 16), 0, 0, 1, *(void **)a5, v10 >> 2, v11, v12))
                  {
                    return 0;
                  }
                  else
                  {
                    return 4294967288;
                  }
                }
              }
              else
              {
                return 4294967292;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t TtDetPostProcessMultiNetOutputs(uint64_t *a1, unsigned int *a2, uint64_t a3, _DWORD *a4, uint64_t a5, float a6, float a7)
{
  if (!a1) {
    return 4294967292;
  }
  if (!*a1) {
    return 4294967292;
  }
  uint64_t result = 4294967292;
  if (!a4 || !a2 || !a5 || !*a2 || !a2[1]) {
    return result;
  }
  *(_OWORD *)(a5 + 157) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  *(_OWORD *)(a5 + 144) = 0u;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 64) = 0u;
  *(_OWORD *)(a5 + 80) = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)(a5 + 48) = 0u;
  *(_OWORD *)a5 = 0u;
  *(_OWORD *)(a5 + 16) = 0u;
  if (!*a1) {
    return 4294967292;
  }
  uint64_t result = TtDetNode::getParams(*a1, a4, (char *)&v38);
  if (!result)
  {
    bmBufferResizeCoordConvert(*a2, a2[1], v38, v39, 0, &v36, &v37, a6, a7);
    if (*(_DWORD *)(a5 + 180))
    {
      unint64_t v19 = 0;
      uint64_t v20 = (float *)(a5 + 204);
      do
      {
        float v21 = *(v20 - 3);
        float v34 = *(v20 - 2);
        float v35 = v21;
        float v22 = v21 + *(v20 - 1);
        float v32 = v34 + *v20;
        float v33 = v22;
        bmBufferResizeCoordConvert(*a2, a2[1], v38, v39, 0, &v35, &v34, v21, v34);
        bmBufferResizeCoordConvert(*a2, a2[1], v38, v39, 0, &v33, &v32, v33, v32);
        *(float *)&double v16 = v34;
        *(float *)&double v15 = v35;
        *(v20 - 3) = v35;
        *(v20 - 2) = *(float *)&v16;
        v17.f32[0] = v33;
        v18.n128_f32[0] = v33 - *(float *)&v15;
        *(float *)&double v15 = v32 - *(float *)&v16;
        *(v20 - 1) = v18.n128_f32[0];
        *uint64_t v20 = *(float *)&v15;
        ++v19;
        v20 += 22;
      }
      while (v19 < *(unsigned int *)(a5 + 180));
    }
    uint64_t result = TtDetNode::postProcess(*a1, a3, 12, a4, a5, &v36, v15, v16, v17, v18);
    if (!result)
    {
      if (*(_DWORD *)(a5 + 180))
      {
        unint64_t v23 = 0;
        float v24 = (float *)(a5 + 204);
        do
        {
          float v25 = *(v24 - 3);
          float v34 = *(v24 - 2);
          float v35 = v25;
          float v26 = v25 + *(v24 - 1);
          float v32 = v34 + *v24;
          float v33 = v26;
          bmBufferResizeCoordConvertReversed(*a2, a2[1], v38, v39, 0, &v35, &v34, v25, v34);
          bmBufferResizeCoordConvertReversed(*a2, a2[1], v38, v39, 0, &v33, &v32, v33, v32);
          float v28 = v34;
          float v27 = v35;
          *(v24 - 3) = v35;
          *(v24 - 2) = v28;
          float v29 = v33 - v27;
          float v30 = v32 - v28;
          *(v24 - 1) = v29;
          float *v24 = v30;
          ++v23;
          v24 += 22;
        }
        while (v23 < *(unsigned int *)(a5 + 180));
      }
      if (!*(unsigned char *)a5)
      {
        uint64_t result = 0;
        *(_DWORD *)(a5 + 37) = 0;
        *(_OWORD *)(a5 + 21) = xmmword_217667C50;
        int v31 = *(_DWORD *)(*a1 + 16);
        *(_OWORD *)(a5 + 81) = *(_OWORD *)*a1;
        *(_DWORD *)(a5 + 97) = v31;
        *(unsigned char *)a5 = 1;
        return result;
      }
      return 4294967292;
    }
  }
  return result;
}

uint64_t TtDetPostProcess(uint64_t *a1, unsigned int *a2, uint64_t a3, unsigned int a4, unsigned int *a5, int a6, _DWORD *a7, uint64_t a8)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t result = 4294967292;
  if (a3)
  {
    unsigned int v10 = a5;
    if (a5)
    {
      if (a6 == 12)
      {
        if (a1)
        {
          if (a7)
          {
            if (*a1)
            {
              uint64_t result = TtDetNode::getParams(*a1, a7, v24);
              if (!result)
              {
                uint64_t v16 = 0;
                for (size_t i = &v25; ; size_t i = (uint64_t *)((char *)i + 4))
                {
                  unsigned int v18 = *v10++;
                  unint64_t v19 = &v26[v16];
                  *(void *)unint64_t v19 = a3 + v18;
                  int v20 = *((_DWORD *)i - 24);
                  int v21 = *(_DWORD *)i * *((_DWORD *)i - 12);
                  *((_DWORD *)v19 + 2) = v21;
                  *((_DWORD *)v19 + 3) = v20;
                  unsigned int v22 = (v20 + 63) & 0xFFFFFFC0;
                  int v23 = *((_DWORD *)i + 12);
                  *((_DWORD *)v19 + 4) = v22;
                  *((_DWORD *)v19 + 5) = v23;
                  if (v18 + (unint64_t)(v21 * v22) > a4) {
                    break;
                  }
                  v16 += 24;
                  if (v16 == 288) {
                    return TtDetPostProcessMultiNetOutputs(a1, a2, (uint64_t)v26, a7, a8, 0.0, 0.0);
                  }
                }
                return 4294967292;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t TtDetGetTrkScheduleInfo(uint64_t *a1, _DWORD *a2, BOOL *a3)
{
  if (!a1) {
    return 4294967292;
  }
  uint64_t v3 = *a1;
  BOOL v4 = !v3 || a2 == 0;
  if (v4 || a3 == 0) {
    return 4294967292;
  }
  else {
    return TtDetNode::getTrkScheduleInfo(v3, a2, a3);
  }
}

float64x2_t *ft::GenerateObservationMatches@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t **a3@<X2>, float64x2_t **a4@<X8>)
{
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  a4[1] = 0;
  a4[2] = 0;
  *a4 = 0;
  unint64_t v9 = (v8 - v7) / 152;
  if (v8 == v7)
  {
    uint64_t result = 0;
    uint64_t v21 = *a2;
    uint64_t v22 = a2[1];
    if (*a2 == v22) {
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  if (v9 >= 0x1745D1745D1745ELL) {
    std::vector<long long>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (float64x2_t *)operator new(176 * v9);
  *a4 = result;
  a4[1] = result;
  unsigned int v11 = (char *)&result[11 * v9];
  a4[2] = (float64x2_t *)v11;
  unsigned int v12 = (long long *)MEMORY[0x263F01090];
  __asm { FMOV            V1.2S, #-1.0 }
  unsigned int v18 = (char *)result;
  do
  {
    *((_OWORD *)v18 + 2) = 0uLL;
    *((_OWORD *)v18 + 3) = 0uLL;
    *((_OWORD *)v18 + 4) = 0uLL;
    *((_OWORD *)v18 + 5) = 0uLL;
    *((void *)v18 + 20) = 0;
    *((_OWORD *)v18 + 8) = 0uLL;
    *((_OWORD *)v18 + 9) = 0uLL;
    *((_OWORD *)v18 + 6) = 0uLL;
    *((_OWORD *)v18 + 7) = 0uLL;
    *(_OWORD *)unsigned int v18 = 0uLL;
    *((_OWORD *)v18 + 1) = 0uLL;
    long long v19 = *v12;
    *(_OWORD *)(v18 + 44) = *v12;
    uint64_t v20 = *((void *)v12 + 2);
    *(void *)(v18 + 60) = v20;
    *(void *)(v18 + 84) = v20;
    *(_OWORD *)(v18 + 68) = v19;
    *((void *)v18 + 21) = _D1;
    v18 += 176;
  }
  while (v18 != v11);
  a4[1] = (float64x2_t *)v11;
  uint64_t v21 = *a2;
  uint64_t v22 = a2[1];
  if (*a2 != v22)
  {
LABEL_8:
    int v23 = *a3;
    do
    {
      if (*(unsigned char *)(v21 + 16))
      {
        uint64_t v24 = *(void *)(v23[2 * *(void *)(v21 + 8)] + 16);
        uint64_t v25 = (char *)&result[11 * *(void *)v21];
        if (!v25[160]) {
          v25[160] = 1;
        }
        *((void *)v25 + 19) = v24;
      }
      v21 += 48;
    }
    while (v21 != v22);
  }
LABEL_14:
  if (v8 != v7)
  {
    uint64_t v26 = 0;
    unint64_t v27 = v9 - 1;
    if (v9 <= 1) {
      uint64_t v28 = 1;
    }
    else {
      uint64_t v28 = (v8 - v7) / 152;
    }
    float v29 = *a3;
    float v30 = a3[1];
    do
    {
      int v31 = (char *)&result[11 * v26];
      uint64_t v32 = v7 + 152 * v26;
      long long v33 = *(_OWORD *)(v32 + 16);
      *(_OWORD *)int v31 = *(_OWORD *)v32;
      *((_OWORD *)v31 + 1) = v33;
      long long v34 = *(_OWORD *)(v32 + 32);
      long long v35 = *(_OWORD *)(v32 + 48);
      long long v36 = *(_OWORD *)(v32 + 80);
      *((_OWORD *)v31 + 4) = *(_OWORD *)(v32 + 64);
      *((_OWORD *)v31 + 5) = v36;
      *((_OWORD *)v31 + 2) = v34;
      *((_OWORD *)v31 + 3) = v35;
      long long v37 = *(_OWORD *)(v32 + 96);
      long long v38 = *(_OWORD *)(v32 + 112);
      long long v39 = *(_OWORD *)(v32 + 128);
      *((void *)v31 + 18) = *(void *)(v32 + 144);
      *((_OWORD *)v31 + 7) = v38;
      *((_OWORD *)v31 + 8) = v39;
      *((_OWORD *)v31 + 6) = v37;
      if (v29 != v30)
      {
        long long v40 = (char *)&result[11 * v26];
        int v41 = v40[160];
        int v42 = (float *)(v40 + 168);
        uint64_t v43 = *((void *)v40 + 19);
        unsigned int v44 = v29;
        do
        {
          uint64_t v45 = *v44;
          if (!v41 || *(void *)(v45 + 16) != v43)
          {
            float64x2_t v46 = *(float64x2_t *)(v45 + 24);
            float64x2_t v47 = *((float64x2_t *)v31 + 1);
            float64x2_t v48 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v46, *(float64x2_t *)v31), (int8x16_t)v46, *(int8x16_t *)v31);
            float64x2_t v49 = vaddq_f64(*(float64x2_t *)v31, v47);
            float64x2_t v50 = *(float64x2_t *)(v45 + 40);
            float64x2_t v51 = vaddq_f64(v46, v50);
            float64x2_t v52 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v49, v51), (int8x16_t)v51, (int8x16_t)v49);
            float64x2_t v53 = (float64x2_t)vandq_s8((int8x16_t)vsubq_f64(v52, v48), (int8x16_t)vcgtq_f64(v52, v48));
            *(float *)v53.f64 = vmulq_laneq_f64(v53, v53, 1).f64[0];
            *(float *)v49.f64 = vaddvq_f64(vmulq_f64((float64x2_t)vzip1q_s64((int64x2_t)v47, (int64x2_t)v50), (float64x2_t)vzip2q_s64((int64x2_t)v47, (int64x2_t)v50)))- *(float *)v53.f64;
            float v54 = *(float *)v53.f64 / *(float *)v49.f64;
            if (*(float *)v49.f64 < 0.00000011921) {
              float v54 = 0.0;
            }
            if (v54 > *v42) {
              *int v42 = v54;
            }
          }
          v44 += 2;
        }
        while (v44 != v30);
      }
      ++v26;
    }
    while (v26 != v28);
    uint64_t v55 = 0;
    uint64_t v56 = result + 12;
    do
    {
      uint64_t v57 = v55 + 1;
      if (v55 + 1 < v9)
      {
        float32x4_t v58 = (char *)&result[11 * v55];
        float64x2_t v59 = *(float64x2_t *)v58;
        float64x2_t v60 = *((float64x2_t *)v58 + 1);
        float v62 = *((float *)v58 + 43);
        float32x2_t v61 = (float *)(v58 + 172);
        float v63 = v62;
        float64x2_t v64 = vmulq_laneq_f64(v60, v60, 1);
        float64x2_t v65 = vaddq_f64(v59, v60);
        float32x2_t v66 = v56;
        unint64_t v67 = v27;
        do
        {
          float64x2_t v68 = v66[-1];
          float64x2_t v69 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v68, v59), (int8x16_t)v68, (int8x16_t)v59);
          float64x2_t v70 = vaddq_f64(v68, *v66);
          float64x2_t v71 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v65, v70), (int8x16_t)v70, (int8x16_t)v65);
          float64x2_t v72 = (float64x2_t)vandq_s8((int8x16_t)vsubq_f64(v71, v69), (int8x16_t)vcgtq_f64(v71, v69));
          *(float *)v72.f64 = vmulq_laneq_f64(v72, v72, 1).f64[0];
          float v73 = vaddq_f64(vmulq_laneq_f64(*v66, *v66, 1), v64).f64[0] - *(float *)v72.f64;
          float v74 = *(float *)v72.f64 / v73;
          if (v73 < 0.00000011921) {
            float v74 = 0.0;
          }
          if (v63 < v74)
          {
            float *v61 = v74;
            float v63 = v74;
          }
          v66 += 11;
          --v67;
        }
        while (v67);
      }
      --v27;
      v56 += 11;
      uint64_t v55 = v57;
    }
    while (v57 != v28);
  }
  return result;
}

void sub_21765FB40(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

double ttAssocObjectReset(uint64_t a1)
{
  *(void *)(a1 + 96) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

void ttAssocSetUpMunkresCost(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6)
{
  unsigned int v9 = a2;
  unsigned int v10 = bmMaximum(a2, a4);
  if (v10 * v10 > a6) {
    ttAssocSetUpMunkresCost();
  }
  unsigned int v11 = v10;
  if (v10)
  {
    unint64_t v12 = v9;
    uint64_t v13 = v10;
    uint64_t v58 = v10;
    unint64_t v59 = v9;
    if (a4)
    {
      unint64_t v14 = 0;
      unsigned int v15 = 0;
      unsigned int v55 = v10 - 1;
      unsigned int v56 = a4;
      unsigned int v51 = v10 - 1 - a4;
      unsigned int v52 = v10 - a4;
      unsigned int v53 = v10 & 0xFFFFFFF8;
      unsigned int v16 = (v10 - a4) & 0xFFFFFFF8;
      unsigned int v50 = v16 + a4;
      *(void *)&long long v17 = 0x4000000040000000;
      *((void *)&v17 + 1) = 0x4000000040000000;
      uint64_t v54 = a4;
      while (1)
      {
        if (v14 >= v12)
        {
          unsigned int v27 = 0;
          BOOL v28 = __CFADD__(v15, v55);
          if (v11 < 8 || v28)
          {
            unsigned int v18 = v15;
          }
          else
          {
            unsigned int v29 = v53;
            unsigned int v18 = v15 + v53;
            do
            {
              float v30 = (_OWORD *)(a5 + 4 * v15);
              *float v30 = v17;
              v30[1] = v17;
              v15 += 8;
              v29 -= 8;
            }
            while (v29);
            unsigned int v27 = v53;
            if (v11 == v53) {
              goto LABEL_6;
            }
          }
          unsigned int v31 = v11 - v27;
          do
          {
            *(_DWORD *)(a5 + 4 * v18++) = 0x40000000;
            --v31;
          }
          while (v31);
        }
        else
        {
          int v65 = 0;
          long long v63 = 0u;
          long long v64 = 0u;
          uint64_t v19 = a1 + 104 * v14;
          ttDetRectFromObject(v19 + 16, (uint64_t)&v63);
          uint64_t v20 = (_DWORD *)(v19 + 20);
          uint64_t v21 = v54;
          uint64_t v22 = a3;
          do
          {
            while (*v20 == *(_DWORD *)(v22 + 4))
            {
              int v62 = 0;
              memset(v61, 0, sizeof(v61));
              ttDetRectFromObject(v22, (uint64_t)v61);
              ttDetRectOverlap((float *)v61, (float *)&v63);
              *(float *)(a5 + 4 * v15) = 1.0 - v23;
              v22 += 88;
              ++v15;
              if (!--v21) {
                goto LABEL_12;
              }
            }
            *(_DWORD *)(a5 + 4 * v15) = 1065353216;
            v22 += 88;
            ++v15;
            --v21;
          }
          while (v21);
LABEL_12:
          if (v11 <= v56)
          {
            unsigned int v18 = v15;
            uint64_t v13 = v58;
            unint64_t v12 = v59;
            *(void *)&long long v17 = 0x4000000040000000;
            *((void *)&v17 + 1) = 0x4000000040000000;
          }
          else
          {
            uint64_t v13 = v58;
            unint64_t v12 = v59;
            *(void *)&long long v17 = 0x4000000040000000;
            *((void *)&v17 + 1) = 0x4000000040000000;
            if (v52 < 8)
            {
              unsigned int v24 = v56;
            }
            else
            {
              unsigned int v24 = v56;
              if (~v15 >= v51)
              {
                int v25 = 0;
                unsigned int v18 = v16 + v15;
                do
                {
                  uint64_t v26 = (_OWORD *)(a5 + 4 * (v15 + v25));
                  *uint64_t v26 = v17;
                  v26[1] = v17;
                  v25 += 8;
                }
                while (v16 != v25);
                unsigned int v24 = v50;
                v15 += v16;
                if (v52 == v16) {
                  goto LABEL_6;
                }
              }
            }
            unsigned int v18 = v15;
            do
            {
              *(_DWORD *)(a5 + 4 * v18) = 0x40000000;
              ++v24;
              ++v18;
            }
            while (v24 < v11);
          }
        }
LABEL_6:
        ++v14;
        unsigned int v15 = v18;
        if (v14 == v13) {
          return;
        }
      }
    }
    unsigned int v32 = v10 - 1;
    unsigned int v33 = v10 & 0xFFFFFFF8;
    if (v10 < 8)
    {
      unint64_t v34 = 0;
      unsigned int v35 = 0;
      while (1)
      {
        if (v34 >= v12)
        {
          unsigned int v36 = v11 + v35;
          *(_DWORD *)(a5 + 4 * v35) = 0x40000000;
          if (v11 != 1)
          {
            *(_DWORD *)(a5 + 4 * (v35 + 1)) = 0x40000000;
            if (v11 != 2)
            {
              *(_DWORD *)(a5 + 4 * (v35 + 2)) = 0x40000000;
              if (v11 != 3)
              {
                *(_DWORD *)(a5 + 4 * (v35 + 3)) = 0x40000000;
                if (v11 != 4)
                {
                  *(_DWORD *)(a5 + 4 * (v35 + 4)) = 0x40000000;
                  if (v11 != 5)
                  {
                    *(_DWORD *)(a5 + 4 * (v35 + 5)) = 0x40000000;
                    if (v11 != 6) {
                      *(_DWORD *)(a5 + 4 * (v35 + 6)) = 0x40000000;
                    }
                  }
                }
              }
            }
          }
          goto LABEL_38;
        }
        int v65 = 0;
        long long v63 = 0u;
        long long v64 = 0u;
        ttDetRectFromObject(a1 + 104 * v34 + 16, (uint64_t)&v63);
        unsigned int v36 = v11 + v35;
        BOOL v37 = __CFADD__(v35, v32);
        if (v11 < 8 || v37) {
          break;
        }
        long long v38 = (_OWORD *)(a5 + 4 * v35);
        *(void *)&long long v39 = 0x4000000040000000;
        *((void *)&v39 + 1) = 0x4000000040000000;
        *long long v38 = v39;
        v38[1] = v39;
        uint64_t v13 = v58;
        unint64_t v12 = v9;
        if (v11 != v33)
        {
          v35 += v33;
          goto LABEL_55;
        }
LABEL_38:
        ++v34;
        unsigned int v35 = v36;
        if (v34 == v13) {
          return;
        }
      }
      uint64_t v13 = v58;
      unint64_t v12 = v9;
      do
LABEL_55:
        *(_DWORD *)(a5 + 4 * v35++) = 0x40000000;
      while (v36 != v35);
      goto LABEL_38;
    }
    unint64_t v40 = 0;
    unsigned int v41 = 0;
    *(void *)&long long v42 = 0x4000000040000000;
    *((void *)&v42 + 1) = 0x4000000040000000;
    do
    {
      if (v40 >= v12)
      {
        unsigned int v43 = v11 + v41;
        if (__CFADD__(v41, v32))
        {
          unsigned int v47 = v41;
        }
        else
        {
          unsigned int v47 = v41 + v33;
          unsigned int v48 = v11 & 0xFFFFFFF8;
          do
          {
            float64x2_t v49 = (_OWORD *)(a5 + 4 * v41);
            *float64x2_t v49 = v42;
            v49[1] = v42;
            v41 += 8;
            v48 -= 8;
          }
          while (v48);
          if (v11 == v33) {
            goto LABEL_58;
          }
        }
        do
          *(_DWORD *)(a5 + 4 * v47++) = 0x40000000;
        while (v43 != v47);
      }
      else
      {
        int v65 = 0;
        long long v63 = 0u;
        long long v64 = 0u;
        ttDetRectFromObject(a1 + 104 * v40 + 16, (uint64_t)&v63);
        unsigned int v43 = v11 + v41;
        if (__CFADD__(v41, v32))
        {
          unsigned int v44 = v41;
          uint64_t v13 = v58;
          unint64_t v12 = v9;
          *(void *)&long long v42 = 0x4000000040000000;
          *((void *)&v42 + 1) = 0x4000000040000000;
        }
        else
        {
          unsigned int v44 = v41 + v33;
          unsigned int v45 = v11 & 0xFFFFFFF8;
          *(void *)&long long v42 = 0x4000000040000000;
          *((void *)&v42 + 1) = 0x4000000040000000;
          do
          {
            float64x2_t v46 = (_OWORD *)(a5 + 4 * v41);
            *float64x2_t v46 = v42;
            v46[1] = v42;
            v41 += 8;
            v45 -= 8;
          }
          while (v45);
          uint64_t v13 = v58;
          unint64_t v12 = v9;
          if (v11 == v33) {
            goto LABEL_58;
          }
        }
        do
          *(_DWORD *)(a5 + 4 * v44++) = 0x40000000;
        while (v43 != v44);
      }
LABEL_58:
      ++v40;
      unsigned int v41 = v43;
    }
    while (v40 != v13);
  }
}

uint64_t ttAssocCore(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, _DWORD *a8, uint64_t a9, unsigned int *a10)
{
  unsigned int v16 = a2;
  *a8 = 0;
  unsigned int v18 = *a10;
  *a10 = 0;
  if (a2)
  {
    if (a2 == 1)
    {
      uint64_t v19 = 0;
LABEL_7:
      uint64_t v22 = (_DWORD *)(a1 + 104 * v19 + 100);
      uint64_t v23 = a2 - v19;
      do
      {
        *(v22 - 22) = 0;
        _DWORD *v22 = 1;
        v22 += 26;
        --v23;
      }
      while (v23);
      goto LABEL_9;
    }
    uint64_t v19 = a2 & 0xFFFFFFFE;
    uint64_t v20 = (_DWORD *)(a1 + 116);
    uint64_t v21 = v19;
    do
    {
      *(v20 - 26) = 0;
      *uint64_t v20 = 0;
      *(v20 - 4) = 1;
      v20[22] = 1;
      v20 += 52;
      v21 -= 2;
    }
    while (v21);
    if (v19 != a2) {
      goto LABEL_7;
    }
  }
LABEL_9:
  uint64_t result = bmMaximum(a2, a4);
  if (result)
  {
    unint64_t v25 = 0;
    uint64_t v26 = (long long *)(a3 + 16);
    do
    {
      unsigned int v27 = *(_DWORD *)(a5 + 4 * v25);
      if (v25 >= a4)
      {
        if (v27 >= v16) {
          ttAssocCore();
        }
      }
      else
      {
        if (v27 >= v16)
        {
          uint64_t v32 = *a10;
          if (v32 >= v18) {
            ttAssocCore();
          }
          *a10 = v32 + 1;
          *(_DWORD *)(a9 + 4 * v32) = v25;
          goto LABEL_12;
        }
        if ((float)(1.0 - *(float *)(a6 + 4 * (v25 + v27 * result))) >= *(float *)a7)
        {
          *(_DWORD *)(a1 + 104 * v27 + 8) = 0;
          if (*(unsigned char *)(a7 + 32))
          {
            uint64_t v33 = a1 + 104 * v27;
            int v34 = *(_DWORD *)(v33 + 16);
            float32x2_t v35 = vmla_n_f32(vmul_n_f32(*(float32x2_t *)v26, 1.0 - *(float *)(a7 + 4)), *(float32x2_t *)(v33 + 32), *(float *)(a7 + 4));
            long long v36 = v26[1];
            long long v37 = v26[2];
            long long v38 = v26[3];
            *(void *)(v33 + 96) = *((void *)v26 + 8);
            long long v39 = *(v26 - 1);
            long long v40 = *v26;
            *(_OWORD *)(v33 + 64) = v37;
            *(_OWORD *)(v33 + 80) = v38;
            *(_OWORD *)(v33 + 32) = v40;
            *(_OWORD *)(v33 + 48) = v36;
            *(_OWORD *)(v33 + 16) = v39;
            *(_DWORD *)(v33 + 100) = 1;
            *(float32x2_t *)(v33 + 24) = vadd_f32(*(float32x2_t *)(v33 + 24), vmul_f32(vsub_f32(*(float32x2_t *)(v33 + 32), v35), (float32x2_t)0x3F0000003F000000));
            *(float32x2_t *)(v33 + 32) = v35;
            *(_DWORD *)(v33 + 16) = v34;
          }
          goto LABEL_12;
        }
        uint64_t v28 = *a10;
        if (v28 >= v18) {
          ttAssocCore();
        }
        *a10 = v28 + 1;
        *(_DWORD *)(a9 + 4 * v28) = v25;
      }
      uint64_t v29 = a1 + 104 * v27;
      unsigned int v30 = *(_DWORD *)(v29 + 8) + 1;
      *(_DWORD *)(v29 + 8) = v30;
      if (v30 >= *(_DWORD *)(a7 + 4 * *(unsigned int *)(v29 + 20) + 20)
        || (*(_DWORD *)(a1 + 104 * v27 + 4) <= *(_DWORD *)(a7 + 12) ? (BOOL v31 = v30 >= *(_DWORD *)(a7 + 16)) : (BOOL v31 = 0),
            v31))
      {
        *(_DWORD *)(a1 + 104 * v27 + 12) = 2;
        ++*a8;
      }
      else
      {
        *(_DWORD *)(a1 + 104 * v27 + 12) = 1;
      }
LABEL_12:
      ++v25;
      uint64_t v26 = (long long *)((char *)v26 + 88);
    }
    while (result != v25);
  }
  return result;
}

BOOL ttAssocObjectKillComp(_DWORD *a1, _DWORD *a2)
{
  return a1[1] < a2[1];
}

uint64_t ttAssocTrkDetGetTempBuffers(int a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  int v8 = bmMunkresTempBytes(a1);
  BmMixedBufSize::BmMixedBufSize((BmMixedBufSize *)&v30);
  if (v31) {
    rtcv::simImageChMeanTempBytes();
  }
  int v9 = 8 * a1 * a1;
  int v10 = 83 * a1 + v9 + 12 * a1 + v8 + v30;
  uint64_t result = (v10 + 21);
  int v30 = v10 + 21;
  if (a2)
  {
    if (result > a3) {
      ttAssocTrkDetGetTempBuffers();
    }
    if (!a4) {
      ttAssocTrkDetGetTempBuffers();
    }
    unint64_t v12 = (a2 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    int v13 = 4 * a1 - a2;
    unsigned int v31 = v12 + v13;
    if (result < (int)v12 + v13) {
      rtcv::simImageChMean();
    }
    *(void *)a4 = v12;
    unint64_t v14 = (a2 + (v12 + v13) + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unsigned int v15 = v14 - a2 + v9;
    unsigned int v31 = v15;
    if (result < v15) {
      rtcv::simImageChMean();
    }
    *(void *)(a4 + 8) = v14;
    uint64_t v16 = v15;
    unsigned int v17 = v15 + v8;
    unsigned int v31 = v17;
    if (result < v17) {
      rtcv::simImageChMean();
    }
    *(_DWORD *)(a4 + 24) = v8;
    *(void *)(a4 + 16) = a2 + v16;
    unint64_t v18 = (a2 + v17 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unsigned int v31 = v18 + v13;
    if (result < (int)v18 + v13) {
      rtcv::simImageChMean();
    }
    *(void *)(a4 + 32) = v18;
    *(_DWORD *)(a4 + 40) = a1 & 0x3FFFFFFF;
    unint64_t v19 = (a2 + (v18 + v13) + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unsigned int v20 = v19 - a2 + 8 * a1;
    unsigned int v31 = v20;
    if (result < v20) {
      rtcv::simImageChMean();
    }
    *(void *)(a4 + 48) = v19;
    unint64_t v21 = (a2 + v20 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unsigned int v31 = v21 + v13;
    if (result < (int)v21 + v13) {
      rtcv::simImageChMean();
    }
    *(void *)(a4 + 56) = v21;
    uint64_t v22 = a2 + (v21 + v13);
    int v23 = a1 - a2;
    unsigned int v31 = a1 - a2 + v22;
    if (result < v31) {
      rtcv::simImageChMean();
    }
    *(void *)(a4 + 64) = v22;
    uint64_t v24 = a2 + (v23 + v22);
    unsigned int v31 = v23 + v24;
    if (result < v23 + (int)v24) {
      rtcv::simImageChMean();
    }
    *(void *)(a4 + 72) = v24;
    unint64_t v25 = (a2 + (v23 + v24) + 3) & 0xFFFFFFFFFFFFFFFCLL;
    int v26 = 36 * a1 - a2;
    unsigned int v31 = v25 + v26;
    if (result < (int)v25 + v26) {
      rtcv::simImageChMean();
    }
    *(void *)(a4 + 80) = v25;
    unint64_t v27 = (a2 + (v25 + v26) + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unsigned int v28 = v27 + v26;
    unsigned int v31 = v28;
    if (result < v28) {
      rtcv::simImageChMean();
    }
    *(void *)(a4 + 88) = v27;
    uint64_t v29 = a2 + v28;
    unsigned int v31 = v23 + v29;
    if (result < v23 + (int)v29) {
      rtcv::simImageChMean();
    }
    *(_DWORD *)(a4 + 104) = a1;
    *(void *)(a4 + 96) = v29;
  }
  return result;
}

uint64_t ttAssocTrkDetTempBytes(int a1)
{
  int v2 = bmMunkresTempBytes(a1);
  BmMixedBufSize::BmMixedBufSize((BmMixedBufSize *)v4);
  if (v4[1]) {
    rtcv::simImageChMeanTempBytes();
  }
  return (9 * a1 + (8 * a1 + 86) * a1 + v2 + v4[0] + 21);
}

uint64_t ttDetTermClassIndex(int a1)
{
  if (a1 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (a1) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t ttAssocObjectRemoveKilled(long long *a1, int a2, int a3)
{
  if (a3 < 1) {
    ttAssocObjectRemoveKilled();
  }
  if (!a2) {
    return 0;
  }
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = a1;
  do
  {
    if (*((_DWORD *)v5 + 3) < a3)
    {
      if (v3 != v4)
      {
        uint64_t v6 = (uint64_t)a1 + 104 * v4;
        long long v7 = *v5;
        long long v8 = v5[2];
        *(_OWORD *)(v6 + 16) = v5[1];
        *(_OWORD *)(v6 + 32) = v8;
        *(_OWORD *)uint64_t v6 = v7;
        long long v9 = v5[3];
        long long v10 = v5[4];
        long long v11 = v5[5];
        *(void *)(v6 + 96) = *((void *)v5 + 12);
        *(_OWORD *)(v6 + 64) = v10;
        *(_OWORD *)(v6 + 80) = v11;
        *(_OWORD *)(v6 + 48) = v9;
      }
      uint64_t v4 = (v4 + 1);
    }
    ++v3;
    uint64_t v5 = (long long *)((char *)v5 + 104);
  }
  while (a2 != v3);
  return v4;
}

uint64_t ttAssocTrkDet(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, _DWORD *a7, _DWORD *a8, _DWORD *a9, void *a10, unsigned int a11)
{
  if (a2 > a3) {
    ttAssocTrkDet();
  }
  if (a5 > a3) {
    ttAssocTrkDet();
  }
  int v18 = bmMunkresTempBytes(a3);
  BmMixedBufSize::BmMixedBufSize((BmMixedBufSize *)&v149);
  if (DWORD1(v149)) {
    rtcv::simImageChMeanTempBytes();
  }
  if (9 * a3 + (8 * a3 + 86) * a3 + v18 + v149 + 21 > a11) {
    ttAssocTrkDet();
  }
  if (!a4 && a5) {
    ttAssocTrkDet();
  }
  *(_OWORD *)float v154 = 0u;
  *(_OWORD *)float v155 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  long long v149 = 0u;
  unsigned int TempBuffers = ttAssocTrkDetGetTempBuffers(a3, (uint64_t)a10, a11, (uint64_t)&v149);
  bzero(a10, TempBuffers);
  unsigned int v20 = a2;
  if (!a2)
  {
    uint64_t result = 0;
    if (a5)
    {
      uint64_t v33 = a5;
      do
      {
        if (*(_DWORD *)(a4 + 24) != 1)
        {
          uint64_t v34 = a1 + 104 * result;
          *(void *)(v34 + 96) = 0;
          *(_OWORD *)(v34 + 64) = 0uLL;
          *(_OWORD *)(v34 + 80) = 0uLL;
          *(_OWORD *)(v34 + 32) = 0uLL;
          *(_OWORD *)(v34 + 48) = 0uLL;
          *(_OWORD *)uint64_t v34 = 0uLL;
          *(_OWORD *)(v34 + 16) = 0uLL;
          long long v35 = *(_OWORD *)(a4 + 16);
          *(_OWORD *)(v34 + 16) = *(_OWORD *)a4;
          *(_OWORD *)(v34 + 32) = v35;
          long long v36 = *(_OWORD *)(a4 + 32);
          long long v37 = *(_OWORD *)(a4 + 48);
          long long v38 = *(_OWORD *)(a4 + 64);
          *(void *)(v34 + 96) = *(void *)(a4 + 80);
          *(_OWORD *)(v34 + 64) = v37;
          *(_OWORD *)(v34 + 80) = v38;
          *(_OWORD *)(v34 + 48) = v36;
          *(_DWORD *)uint64_t v34 = *a9;
          int v39 = (*a9)++;
          *(_DWORD *)(v34 + 16) = v39;
          ++*(_DWORD *)(v34 + 4);
          uint64_t result = (result + 1);
        }
        a4 += 88;
        --v33;
      }
      while (v33);
    }
    *a7 = result;
    *a8 = 0;
    return result;
  }
  unsigned int v140 = a3;
  float32x2_t v138 = a7;
  float32x2_t v139 = a8;
  unint64_t v21 = (char *)*((void *)&v149 + 1);
  uint64_t v22 = (unsigned int *)v149;
  uint64_t v23 = v152;
  unsigned int v148 = 0;
  float32x2_t v137 = (unsigned int *)v152;
  if (a5)
  {
    unsigned int v132 = DWORD2(v151);
    unsigned int v133 = DWORD2(v150);
    float32x2_t v134 = (unsigned __int8 *)v150;
    float32x2_t v135 = (unsigned int *)v151;
    unsigned int v24 = bmMaximum(a2, a5);
    ttAssocSetUpMunkresCost(a1, a2, a4, a5, (uint64_t)v21, v24 * v24);
    if (v24 * v24 > v140 * v140) {
      ttAssocTrkDet();
    }
    size_t v25 = 4 * v24 * v24;
    uint64_t v26 = (uint64_t)&v21[v25];
    memcpy(&v21[v25], v21, v25);
    bmMunkres((float *)v21, v24, v134, v133, v135, v132, 0);
    unsigned int v147 = a5;
    ttAssocCore(a1, a2, a4, a5, (uint64_t)v135, v26, a6, &v148, (uint64_t)v22, &v147);
    uint64_t v27 = v147;
    if (v147)
    {
      uint64_t v28 = 0;
      int v29 = 0;
      unsigned int v30 = a2;
      do
      {
        unsigned int v31 = v22[v28];
        if (*(_DWORD *)(a4 + 88 * v31 + 24) >= 2u)
        {
          if (v28 != v29) {
            v22[v29] = v31;
          }
          ++v29;
        }
        ++v28;
      }
      while (v27 != v28);
    }
    else
    {
      int v29 = 0;
      unsigned int v30 = a2;
    }
    unint64_t v52 = 0;
    unsigned int v53 = *(float **)v154;
    if (v30 <= 1) {
      unsigned int v54 = 1;
    }
    else {
      unsigned int v54 = v30;
    }
    uint64_t v55 = a1 + 16;
    uint64_t v56 = 36 * v54;
    do
    {
      ttDetRectFromObject(v55, (uint64_t)&v144);
      uint64_t v57 = &v53[v52 / 4];
      long long v58 = v144;
      long long v59 = v145;
      *((_DWORD *)v57 + 8) = v146;
      *(_OWORD *)uint64_t v57 = v58;
      *((_OWORD *)v57 + 1) = v59;
      v52 += 36;
      v55 += 104;
    }
    while (v56 != v52);
    if (v29)
    {
      uint64_t v60 = 0;
      unsigned int v61 = 0;
      do
      {
        unsigned int v62 = v22[v60];
        int v146 = 0;
        long long v144 = 0u;
        long long v145 = 0u;
        ttDetRectFromObject(a4 + 88 * v62, (uint64_t)&v144);
        v142[0] = v144;
        v142[1] = v145;
        int v143 = v146;
        if (!ttCheckOverlapBox(v53, a2, (float *)v142, *(float *)(a6 + 8)))
        {
          if (v60 != v61) {
            v22[v61] = v22[v60];
          }
          ++v61;
        }
        ++v60;
      }
      while (v29 != v60);
      long long v63 = *(long long **)&v154[2];
      if (v61)
      {
        uint64_t v136 = a1;
        uint64_t v64 = 0;
        int v65 = v22;
        do
        {
          unsigned int v66 = *v65++;
          ttDetRectFromObject(a4 + 88 * v66, (uint64_t)&v144);
          unint64_t v67 = (char *)v63 + v64;
          long long v68 = v144;
          long long v69 = v145;
          *((_DWORD *)v67 + 8) = v146;
          *(_OWORD *)unint64_t v67 = v68;
          *((_OWORD *)v67 + 1) = v69;
          *((_DWORD *)v67 + 5) = v66;
          v64 += 36;
        }
        while (36 * v61 != v64);
        a1 = v136;
      }
    }
    else
    {
      unsigned int v61 = 0;
      long long v63 = *(long long **)&v154[2];
    }
    unsigned int v50 = ttRemoveOverlapBoxes(v63, v61, (unsigned __int8 *)v155[0], v155[1], *(float *)(a6 + 8));
    unsigned int v44 = v140;
    unsigned int v20 = a2;
    uint64_t v23 = (uint64_t)v137;
    if (v50)
    {
      if (v50 < 0xA
        || (v22 < (unsigned int *)v63 + 9 * v50 - 3 ? (BOOL v70 = (char *)v63 + 20 >= (char *)&v22[v50]) : (BOOL v70 = 1), !v70))
      {
        uint64_t v71 = 0;
LABEL_71:
        float32x4_t v79 = &v22[v71];
        float32x4_t v80 = (int *)v63 + 9 * v71 + 5;
        uint64_t v81 = v50 - v71;
        do
        {
          int v82 = *v80;
          v80 += 9;
          *v79++ = v82;
          --v81;
        }
        while (v81);
        goto LABEL_73;
      }
      uint64_t v71 = v50 & 0xFFFFFFFC;
      float64x2_t v72 = (int *)v63 + 23;
      float v73 = v22 + 2;
      uint64_t v74 = v71;
      do
      {
        float32x4_t v75 = v72 + 9;
        LODWORD(v76) = *(v72 - 18);
        HIDWORD(v76) = *(v72 - 9);
        int v77 = *v72;
        v72 += 36;
        LODWORD(v78) = v77;
        HIDWORD(v78) = *v75;
        *(v73 - 1) = v76;
        *float v73 = v78;
        v73 += 2;
        v74 -= 4;
      }
      while (v74);
      if (v71 != v50) {
        goto LABEL_71;
      }
    }
LABEL_73:
    unsigned int v40 = v148;
    unsigned int v83 = a2 - v148 + v50;
    unsigned int v51 = v83 - v140;
    if (v83 > v140) {
      goto LABEL_74;
    }
LABEL_94:
    unsigned int v96 = v40;
    goto LABEL_95;
  }
  unsigned int v40 = 0;
  unsigned int v41 = *(_DWORD *)(a6 + 12);
  long long v42 = (_DWORD *)a1;
  uint64_t v43 = a2;
  unsigned int v44 = v140;
  do
  {
    while (1)
    {
      v42[25] = 1;
      unsigned int v45 = v42[2];
      if (a4) {
        void v42[2] = ++v45;
      }
      int v46 = v42[5];
      uint64_t v47 = v46 == 1 ? 1 : 2;
      uint64_t v48 = v46 ? v47 : 0;
      if (v45 < *(_DWORD *)(a6 + 4 * v48 + 20) && (v42[1] > v41 || v45 < *(_DWORD *)(a6 + 16))) {
        break;
      }
      v42[3] = 2;
      ++v40;
      v42 += 26;
      if (!--v43) {
        goto LABEL_39;
      }
    }
    v42[3] = 1;
    v42 += 26;
    --v43;
  }
  while (v43);
LABEL_39:
  unsigned int v50 = 0;
  unsigned int v51 = a2 - v40 - v140;
  if (a2 - v40 <= v140) {
    goto LABEL_94;
  }
LABEL_74:
  uint64_t v84 = 0;
  unsigned int v85 = 0;
  if (v20 <= 1) {
    uint64_t v86 = 1;
  }
  else {
    uint64_t v86 = v20;
  }
  float32x4x4_t v87 = (_DWORD *)(a1 + 12);
  float32x4x4_t v88 = (_DWORD *)(a1 + 12);
  do
  {
    int v89 = *v88;
    v88 += 26;
    if (v89 == 1)
    {
      uint64_t v90 = (_DWORD *)(v23 + 8 * v85);
      *uint64_t v90 = v84;
      v90[1] = *(v87 - 2);
      ++v85;
    }
    ++v84;
    float32x4x4_t v87 = v88;
  }
  while (v86 != v84);
  if (v85 < v51) {
    ttAssocTrkDet();
  }
  unsigned int v91 = v44;
  bmHeapsort(v23, v85, 8uLL, (int (*)(uint64_t, uint64_t))ttAssocObjectKillComp);
  if (!v85)
  {
    unsigned int v20 = a2;
    unsigned int v44 = v91;
    if (v50 + a2 - v40 > v91) {
      goto LABEL_128;
    }
    goto LABEL_96;
  }
  unsigned int v92 = v51 + v40;
  unsigned int v20 = a2;
  unsigned int v44 = v91;
  if (v40 >= v51 + v40) {
    goto LABEL_94;
  }
  uint64_t v93 = a1 + 104 * *v137;
  int v95 = *(_DWORD *)(v93 + 12);
  uint64_t v94 = (_DWORD *)(v93 + 12);
  if (v95 != 1) {
LABEL_130:
  }
    ttAssocTrkDet();
  *uint64_t v94 = 2;
  unsigned int v96 = v40 + 1;
  if (v85 < 2 || v96 >= v92)
  {
LABEL_95:
    if (v50 + v20 - v96 > v44) {
      goto LABEL_128;
    }
    goto LABEL_96;
  }
  unint64_t v97 = v137 + 2;
  unint64_t v98 = 2;
  do
  {
    if (*(_DWORD *)(a1 + 104 * *v97 + 4) > *(_DWORD *)(a1 + 104 * *(v97 - 2) + 4)) {
      ttAssocTrkDet();
    }
    uint64_t v99 = a1 + 104 * *v97;
    int v101 = *(_DWORD *)(v99 + 12);
    uint64_t v100 = (_DWORD *)(v99 + 12);
    if (v101 != 1) {
      goto LABEL_130;
    }
    *uint64_t v100 = 2;
    int v102 = v98 + 1;
    if (v98 >= v85) {
      break;
    }
    v97 += 2;
    unsigned int v103 = v40 + v98++;
  }
  while (v103 < v92);
  if (v50 + a2 - (v40 + v102 - 1) > v91) {
LABEL_128:
  }
    ttAssocTrkDet();
LABEL_96:
  uint64_t v104 = 0;
  uint64_t v105 = 0;
  uint64_t v106 = a1;
  do
  {
    if (*(int *)(v106 + 12) <= 1)
    {
      if (v104 != v105)
      {
        uint64_t v107 = a1 + 104 * v105;
        long long v108 = *(_OWORD *)v106;
        long long v109 = *(_OWORD *)(v106 + 32);
        *(_OWORD *)(v107 + 16) = *(_OWORD *)(v106 + 16);
        *(_OWORD *)(v107 + 32) = v109;
        *(_OWORD *)uint64_t v107 = v108;
        long long v110 = *(_OWORD *)(v106 + 48);
        long long v111 = *(_OWORD *)(v106 + 64);
        long long v112 = *(_OWORD *)(v106 + 80);
        *(void *)(v107 + 96) = *(void *)(v106 + 96);
        *(_OWORD *)(v107 + 64) = v111;
        *(_OWORD *)(v107 + 80) = v112;
        *(_OWORD *)(v107 + 48) = v110;
      }
      uint64_t v105 = (v105 + 1);
    }
    v106 += 104;
    ++v104;
  }
  while (v20 != v104);
  uint64_t result = v105;
  if (v50)
  {
    LODWORD(v113) = v44 - v105;
    if (v44 >= v105) {
      uint64_t v113 = v113;
    }
    else {
      uint64_t v113 = 0;
    }
    uint64_t v114 = v50;
    uint64_t v115 = a1 + 104 * v105 + 16;
    LODWORD(result) = v105;
    do
    {
      if (!v113) {
        ttAssocTrkDet();
      }
      unsigned int v116 = *v22++;
      *(void *)(v115 + 80) = 0;
      *(_OWORD *)(v115 + 48) = 0uLL;
      *(_OWORD *)(v115 + 64) = 0uLL;
      *(_OWORD *)(v115 + 16) = 0uLL;
      *(_OWORD *)(v115 + 32) = 0uLL;
      *(_OWORD *)(v115 - 16) = 0uLL;
      *(_OWORD *)uint64_t v115 = 0uLL;
      uint64_t v117 = a4 + 88 * v116;
      long long v118 = *(_OWORD *)(v117 + 16);
      *(_OWORD *)uint64_t v115 = *(_OWORD *)v117;
      *(_OWORD *)(v115 + 16) = v118;
      long long v119 = *(_OWORD *)(v117 + 32);
      long long v120 = *(_OWORD *)(v117 + 48);
      long long v121 = *(_OWORD *)(v117 + 64);
      *(void *)(v115 + 80) = *(void *)(v117 + 80);
      *(_OWORD *)(v115 + 48) = v120;
      *(_OWORD *)(v115 + 64) = v121;
      *(_OWORD *)(v115 + 32) = v119;
      *(_DWORD *)(v115 - 16) = *a9;
      LODWORD(v117) = (*a9)++;
      *(_DWORD *)uint64_t v115 = v117;
      v115 += 104;
      uint64_t result = (result + 1);
      --v113;
      --v114;
    }
    while (v114);
  }
  *float32x2_t v138 = result - v105;
  *float32x2_t v139 = v105;
  if (result)
  {
    if (result == 1)
    {
      uint64_t v122 = 0;
LABEL_121:
      int32x4_t v129 = (int *)(a1 + 104 * v122 + 4);
      uint64_t v130 = result - v122;
      do
      {
        if (*v129 == -1) {
          int v131 = -1;
        }
        else {
          int v131 = *v129 + 1;
        }
        *int32x4_t v129 = v131;
        v129 += 26;
        --v130;
      }
      while (v130);
      return result;
    }
    uint64_t v122 = result & 0xFFFFFFFE;
    float32x4_t v123 = (int *)(a1 + 108);
    uint64_t v124 = v122;
    do
    {
      int v125 = *(v123 - 26);
      int v126 = *v123;
      if (v125 == -1) {
        int v127 = -1;
      }
      else {
        int v127 = v125 + 1;
      }
      if (v126 == -1) {
        int v128 = -1;
      }
      else {
        int v128 = v126 + 1;
      }
      *(v123 - 26) = v127;
      *float32x4_t v123 = v128;
      v123 += 52;
      v124 -= 2;
    }
    while (v124);
    if (v122 != result) {
      goto LABEL_121;
    }
  }
  return result;
}

uint64_t TtAssociateTrackerBboxes(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v31[124] = *MEMORY[0x263EF8340];
  unsigned int v6 = *(_DWORD *)(a2 + 180);
  if (a1[1])
  {
    if (v6) {
      memcpy(__dst, (const void *)(a2 + 184), 88 * v6);
    }
  }
  else
  {
    if (v6)
    {
      unint64_t v7 = 0;
      uint64_t v8 = a2 + 184;
      long long v9 = &v30;
      do
      {
        ttDetRectFromObject(v8, (uint64_t)v27);
        long long v10 = v27[1];
        *long long v9 = v27[0];
        v9[1] = v10;
        *((_DWORD *)v9 + 8) = v28;
        *((_DWORD *)v9 + 5) = v7++;
        unint64_t v11 = *(unsigned int *)(a2 + 180);
        long long v9 = (long long *)((char *)v9 + 36);
        v8 += 88;
      }
      while (v7 < v11);
    }
    else
    {
      LODWORD(v11) = 0;
    }
    unsigned int v12 = ttRemoveOverlapBoxes(&v30, v11, (unsigned __int8 *)v27, 4u, 0.8);
    unsigned int v6 = v12;
    if (v12)
    {
      uint64_t v13 = v12;
      unint64_t v14 = (unsigned int *)v31;
      unsigned int v15 = __dst;
      do
      {
        unsigned int v16 = *v14;
        v14 += 9;
        uint64_t v17 = a2 + 88 * v16;
        long long v18 = *(_OWORD *)(v17 + 232);
        *((_OWORD *)v15 + 2) = *(_OWORD *)(v17 + 216);
        *((_OWORD *)v15 + 3) = v18;
        *((_OWORD *)v15 + 4) = *(_OWORD *)(v17 + 248);
        *((void *)v15 + 10) = *(void *)(v17 + 264);
        long long v19 = *(_OWORD *)(v17 + 200);
        *(_OWORD *)unsigned int v15 = *(_OWORD *)(v17 + 184);
        *((_OWORD *)v15 + 1) = v19;
        v15 += 88;
        --v13;
      }
      while (v13);
    }
  }
  int v20 = bmMunkresTempBytes(4);
  BmMixedBufSize::BmMixedBufSize((BmMixedBufSize *)v27);
  if (DWORD1(v27[0])) {
    rtcv::simImageChMeanTempBytes();
  }
  size_t v21 = (v20 + LODWORD(v27[0]) + 529);
  if (v20 + LODWORD(v27[0]) == -529)
  {
    uint64_t v22 = 0;
    int v23 = 0;
  }
  else
  {
    uint64_t v22 = operator new((v20 + LODWORD(v27[0]) + 529));
    int v23 = v22 + v21;
    bzero(v22, v21);
  }
  a1[1] = ttAssocTrkDet((uint64_t)(a1 + 2), a1[1], 4u, (uint64_t)__dst, v6, a3, &v26, &v25, a1, v22, v23 - (int)v22);
  if (v22) {
    operator delete(v22);
  }
  return 0;
}

void sub_2176610D0(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    operator delete(v1);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t TtUpdateAssocResult(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 4);
  if (v1)
  {
    uint64_t v2 = 0;
    unsigned int v3 = 0;
    uint64_t v4 = (int *)(a1 + 20);
    uint64_t v5 = (int *)(a1 + 20);
    do
    {
      int v6 = *v5;
      v5 += 26;
      if (v6 <= 1)
      {
        if (v2 != v3)
        {
          unint64_t v7 = v4 - 3;
          uint64_t v8 = a1 + 8 + 104 * v3;
          long long v9 = *(_OWORD *)v7;
          long long v10 = *((_OWORD *)v7 + 2);
          *(_OWORD *)(v8 + 16) = *((_OWORD *)v7 + 1);
          *(_OWORD *)(v8 + 32) = v10;
          *(_OWORD *)uint64_t v8 = v9;
          long long v11 = *((_OWORD *)v7 + 3);
          long long v12 = *((_OWORD *)v7 + 4);
          long long v13 = *((_OWORD *)v7 + 5);
          *(void *)(v8 + 96) = *((void *)v7 + 12);
          *(_OWORD *)(v8 + 64) = v12;
          *(_OWORD *)(v8 + 80) = v13;
          *(_OWORD *)(v8 + 48) = v11;
        }
        ++v3;
      }
      ++v2;
      uint64_t v4 = v5;
    }
    while (v1 != v2);
  }
  else
  {
    unsigned int v3 = 0;
  }
  *(_DWORD *)(a1 + 4) = v3;
  return 0;
}

float ttAssocObjectRectIntersectOverSmaller(float *a1, float *a2, float a3)
{
  float v3 = *a1;
  float v4 = a1[1];
  float v5 = a1[2];
  float v6 = a1[3];
  float v7 = *a1 + v5;
  float v8 = v4 + v6;
  float v9 = *a2;
  float v10 = a2[1];
  float v11 = 0.0;
  if (v7 > *a2 && v8 > v10)
  {
    float v13 = a2[2];
    float v14 = a2[3];
    float v15 = v10 + v14;
    if ((float)(v9 + v13) > v3 && v15 > v4) {
      return (float)(fmaxf(fminf(v7, v9 + v13) - fmaxf(v3, v9), 0.0) * fmaxf(fminf(v8, v15) - fmaxf(v4, v10), 0.0))
    }
           / fmaxf(a3, fminf(v5 * v6, v13 * v14));
  }
  return v11;
}

uint64_t TtAssocObjectRemoveOldOverlapObjects(uint64_t a1, float a2)
{
  unint64_t v2 = *(unsigned int *)(a1 + 4);
  if (v2)
  {
    bmHeapsort(a1 + 8, v2, 0x68uLL, (int (*)(uint64_t, uint64_t))ttAssocObjectAgeComp);
    unsigned int v5 = *(_DWORD *)(a1 + 4);
    if (v5)
    {
      unint64_t v6 = 0;
      float v7 = (long long *)(a1 + 112);
      uint64_t v8 = 1;
      do
      {
        unint64_t v9 = v6 + 1;
        unsigned int v10 = v5;
        if (v6 + 1 >= v5)
        {
          unsigned int v5 = v6 + 1;
        }
        else
        {
          uint64_t v11 = a1 + 104 * v6;
          long long v12 = (_DWORD *)(v11 + 12);
          float v13 = (_DWORD *)(v11 + 28);
          float v14 = (float *)(v11 + 32);
          float v15 = (float *)(v11 + 40);
          unsigned int v16 = (float *)(v11 + 36);
          uint64_t v17 = (float *)(v11 + 44);
          long long v18 = v7;
          unint64_t v19 = v8;
          unsigned int v5 = v9;
          do
          {
            if (*v12 > *((_DWORD *)v18 + 1)) {
              TtAssocObjectRemoveOldOverlapObjects_cold_1();
            }
            if (*v13 != *((_DWORD *)v18 + 5)) {
              goto LABEL_23;
            }
            float v20 = *v14;
            float v21 = *v14 + *v15;
            float v22 = *v16;
            float v23 = *v16 + *v17;
            float v24 = *((float *)v18 + 6);
            float v25 = *((float *)v18 + 7);
            float v26 = 0.0;
            if (v21 > v24 && v23 > v25)
            {
              float v28 = *((float *)v18 + 8);
              float v29 = *((float *)v18 + 9);
              float v30 = v25 + v29;
              if ((float)(v24 + v28) > v20 && v30 > v22) {
                float v26 = (float)(fmaxf(fminf(v21, v24 + v28) - fmaxf(v20, v24), 0.0)
              }
                            * fmaxf(fminf(v23, v30) - fmaxf(v22, v25), 0.0))
                    / fmaxf(fminf(*v15 * *v17, v28 * v29), 0.00001);
            }
            if (v26 <= a2)
            {
LABEL_23:
              unsigned int v32 = v5;
              if (v19 < v5) {
                TtAssocObjectRemoveOldOverlapObjects_cold_2();
              }
              ++v5;
              uint64_t v33 = a1 + 104 * v32;
              long long v34 = *v18;
              long long v35 = v18[1];
              *(_OWORD *)(v33 + 40) = v18[2];
              *(_OWORD *)(v33 + 24) = v35;
              *(_OWORD *)(v33 + 8) = v34;
              long long v36 = v18[3];
              long long v37 = v18[4];
              long long v38 = v18[5];
              *(void *)(v33 + 104) = *((void *)v18 + 12);
              *(_OWORD *)(v33 + 88) = v38;
              *(_OWORD *)(v33 + 72) = v37;
              *(_OWORD *)(v33 + 56) = v36;
            }
            ++v19;
            long long v18 = (long long *)((char *)v18 + 104);
          }
          while (v10 != v19);
        }
        ++v8;
        float v7 = (long long *)((char *)v7 + 104);
        unint64_t v6 = v9;
      }
      while (v9 < v5);
    }
    *(_DWORD *)(a1 + 4) = v5;
  }
  return 0;
}

BOOL ttAssocObjectAgeComp(_DWORD *a1, _DWORD *a2)
{
  return a1[1] > a2[1];
}

uint64_t getInitialPos(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  if (!v4 || (uint64_t v5 = *(unsigned int *)(a1 + 12), !v5))
  {
    *a4 = 1;
    return 0;
  }
  unsigned int v6 = 0;
  uint64_t v7 = 0;
  LOBYTE(v8) = 0;
  uint64_t v9 = 0;
  unsigned __int8 v10 = 0;
  uint64_t v11 = 0;
  float v12 = *(float *)(a2 + 8);
  float v13 = *(float *)(a2 + 12);
  do
  {
    uint64_t v14 = *(void *)a1 + v6;
    uint64_t v15 = 0;
    if (v13 <= (float)v7)
    {
      if ((float)(v13 + *(float *)(a2 + 20)) <= (float)v7)
      {
        do
        {
          unsigned int v8 = v8;
          if (*(unsigned __int8 *)(v14 + v15) > v8)
          {
            uint64_t v11 = v7;
            uint64_t v9 = v15;
            unsigned int v8 = *(unsigned __int8 *)(v14 + v15);
          }
          ++v15;
        }
        while (v5 != v15);
      }
      else
      {
        do
        {
          unsigned int v16 = *(unsigned __int8 *)(v14 + v15);
          unsigned int v8 = v8;
          if (v16 > v8)
          {
            uint64_t v11 = v7;
            uint64_t v9 = v15;
            unsigned int v8 = *(unsigned __int8 *)(v14 + v15);
          }
          float v17 = (float)v15;
          if (v16 <= v10) {
            LOBYTE(v16) = v10;
          }
          if ((float)(v12 + *(float *)(a2 + 16)) > v17 && v12 <= v17) {
            unsigned __int8 v10 = v16;
          }
          ++v15;
        }
        while (v5 != v15);
      }
    }
    else
    {
      do
      {
        unsigned int v8 = v8;
        if (*(unsigned __int8 *)(v14 + v15) > v8)
        {
          uint64_t v11 = v7;
          uint64_t v9 = v15;
          unsigned int v8 = *(unsigned __int8 *)(v14 + v15);
        }
        ++v15;
      }
      while (v5 != v15);
    }
    ++v7;
    v6 += *(_DWORD *)(a1 + 16);
  }
  while (v7 != v4);
  *a4 = v8 == 0;
  if (!v8) {
    return 0;
  }
  if (*(_DWORD *)(a2 + 24) && v8 >> 1 < v10)
  {
    unsigned int v20 = *(_DWORD *)(a1 + 12);
    float v21 = (float)v20;
    if ((float)(*(float *)(a2 + 8) + *(float *)(a2 + 16)) <= (float)v20
      && (float)(*(float *)(a2 + 12) + *(float *)(a2 + 20)) <= (float)v4)
    {
      *(_OWORD *)a3 = *(_OWORD *)(a2 + 8);
      return 0;
    }
  }
  else
  {
    unsigned int v20 = *(_DWORD *)(a1 + 12);
    float v21 = (float)v20;
  }
  unint64_t v22 = (v20 + 10) / 0x14uLL;
  unint64_t v23 = (v4 + 10) / 0x14uLL;
  float v24 = fmax((double)(uint64_t)(v9 - v22), 0.0);
  float v25 = fmax((double)(uint64_t)(v11 - v23), 0.0);
  *(float *)a3 = v24;
  *(float *)(a3 + 4) = v25;
  int v26 = (2 * v22) | 1;
  float v27 = (float)(int)((2 * v23) | 1);
  *(float *)(a3 + 8) = (float)v26;
  *(float *)(a3 + 12) = v27;
  if ((float)((float)v26 + v24) > v21) {
    *(float *)(a3 + 8) = v21 - v24;
  }
  if ((float)(v27 + v25) <= (float)v4) {
    return 0;
  }
  *(float *)(a3 + 12) = (float)v4 - v25;
  return 0;
}

uint64_t computeIntegralImage(uint64_t a1, uint64_t a2, double a3, float a4)
{
  int v4 = *(_DWORD *)(a1 + 8);
  if (*(_DWORD *)(a2 + 8) != v4 + 1) {
    return 4294967292;
  }
  unint64_t v5 = *(unsigned int *)(a2 + 12);
  uint64_t v6 = *(unsigned int *)(a1 + 12);
  if (v5 != v6 + 1) {
    return 4294967292;
  }
  if (v4 && v6)
  {
    unsigned int v7 = 0;
    int v8 = 1;
    do
    {
      uint64_t v9 = 0;
      unsigned int v10 = v7 + 1;
      int v11 = *(_DWORD *)(a2 + 16);
      uint64_t v12 = *(void *)a1 + *(_DWORD *)(a1 + 16) * v7;
      uint64_t v13 = *(void *)a2 + 4;
      uint64_t v14 = v13 + v11 * v7;
      uint64_t v15 = v13 + (v11 * v8);
      float v16 = 0.0;
      do
      {
        if (*(_DWORD *)(a1 + 8) <= v7) {
          computeIntegralImage();
        }
        uint64_t v17 = v9 + 1;
        if (v9 + 1 >= v5 || (unsigned int v18 = *(_DWORD *)(a2 + 8), v18 <= v7)) {
          AcAttrNode::postProcess();
        }
        if (v18 <= v10) {
          AcAttrNode::postProcess();
        }
        LOBYTE(a4) = *(unsigned char *)(v12 + v9);
        uint64_t v19 = 4 * v9;
        float v16 = (float)((float)LODWORD(a4) / 255.0) * (float)((float)LODWORD(a4) / 255.0) + v16;
        a4 = *(float *)(v14 + v19) + v16;
        *(float *)(v15 + v19) = a4;
        uint64_t v9 = v17;
      }
      while (v6 != v17);
      ++v8;
      ++v7;
    }
    while (v10 != v4);
  }
  return 0;
}

uint64_t convertSaliencyMapToBoundingBoxes(uint64_t a1, uint64_t a2, char *a3, unsigned int a4, uint64_t a5, int a6, float a7, float a8)
{
  if (!a3) {
    return 4294967292;
  }
  uint64_t v9 = 4 * *(unsigned __int16 *)(a2 + 5986) + 4;
  if (v9 + v9 * (unint64_t)*(unsigned __int16 *)(a2 + 5984) > a4 || !*(unsigned char *)(a2 + 5990)) {
    return 4294967292;
  }
  bzero(a3, a4);
  unint64_t v67 = a3;
  unsigned int v16 = *(unsigned __int16 *)(a2 + 5986);
  unsigned int v17 = *(unsigned __int16 *)(a2 + 5984);
  unsigned int v68 = v16 + 1;
  unsigned int v69 = v17 + 1;
  int v18 = 4 * v17 + 4;
  int v70 = v18;
  int v71 = 6;
  BOOL v65 = 0;
  getInitialPos(a1, a5, (uint64_t)&v66, &v65);
  uint64_t result = 0;
  if (!v65)
  {
    uint64_t result = computeIntegralImage(a1, (uint64_t)&v67, v19, v20);
    if (!result)
    {
      float v24 = *(float *)&v66;
      if (a6)
      {
        int v25 = 0;
        float v26 = -a7;
        LODWORD(v23) = *(_DWORD *)(a1 + 8);
        LODWORD(v22) = *(_DWORD *)(a1 + 12);
        double v27 = (double)v22;
        double v28 = (double)v23;
        float v30 = *((float *)&v66 + 2);
        float v29 = *((float *)&v66 + 1);
        float v31 = *((float *)&v66 + 3);
        do
        {
          uint64_t v32 = v24;
          unsigned int v33 = v29;
          if (v17 < v32 || v16 < v33) {
            AcAttrNode::postProcess();
          }
          float v35 = v24 + v30;
          uint64_t v36 = (float)(v24 + v30);
          float v37 = v29 + v31;
          unsigned int v38 = (float)(v29 + v31);
          if (v17 < v36 || v16 < v38) {
            AcAttrNode::postProcess();
          }
          if (v17 < (float)(v24 + 1.0)) {
            AcAttrNode::postProcess();
          }
          unsigned int v40 = (float)(v29 + 1.0);
          if (v16 < v40) {
            AcAttrNode::postProcess();
          }
          if (v17 < (float)(v35 + -1.0)) {
            AcAttrNode::postProcess();
          }
          unsigned int v41 = (float)(v37 + -1.0);
          if (v16 < v41) {
            AcAttrNode::postProcess();
          }
          long long v42 = &a3[v18 * v33];
          float v43 = *(float *)&v42[4 * v32];
          unsigned int v44 = &a3[v18 * v38];
          uint64_t v45 = 4 * (float)(v24 + v30);
          float v46 = *(float *)&v44[v45];
          float v47 = *(float *)&v44[4 * v32];
          float v48 = *(float *)&v42[v45];
          float v49 = (float)((float)((float)(v43 + v46) - v47) - v48) / (float)(v30 * v31);
          float v50 = (float)((float)((float)((float)(v43 + *(float *)&v44[4 * (float)(v24 + 1.0)]) - v47)
                              - *(float *)&v42[4 * (float)(v24 + 1.0)])
                      / v31)
              + (float)(v26 * v49);
          float v51 = (float)((float)((float)((float)(v43 + *(float *)&a3[4 * v36 + v18 * v40])
                                      - *(float *)&a3[4 * v32 + v18 * v40])
                              - v48)
                      / v30)
              + (float)(v26 * v49);
          float v52 = (float)((float)((float)((float)(v46 + *(float *)&v42[4 * (float)(v35 + -1.0)])
                                      - *(float *)&v44[4 * (float)(v35 + -1.0)])
                              - v48)
                      / v31)
              + (float)(v26 * v49);
          float v53 = (float)((float)((float)((float)(v46 + *(float *)&a3[4 * v32 + v18 * v41]) - v47)
                              - *(float *)&a3[4 * v36 + v18 * v41])
                      / v30)
              + (float)(v26 * v49);
          BOOL v54 = v53 > 0.0;
          BOOL v55 = v53 < 0.0;
          if (fabsf(v50) > (float)(v49 * a8)) {
            ++v25;
          }
          v25 += 2 * (fabsf(v51) > (float)(v49 * a8))
               + 4 * (fabsf(v52) > (float)(v49 * a8))
               + 8 * (fabsf(v53) > (float)(v49 * a8));
          float v56 = (float)(int)((__PAIR64__(v50 < 0.0, 0.0) - LODWORD(v50)) >> 32);
          if ((v25 & 1) == 0) {
            float v56 = 0.0;
          }
          double v57 = fmax((float)(v24 + v56), 0.0);
          float v58 = (float)(int)((__PAIR64__(v51 < 0.0, 0.0) - LODWORD(v51)) >> 32);
          float v24 = v57;
          if ((v25 & 2) == 0) {
            float v58 = 0.0;
          }
          float v59 = v29 + v58;
          if ((v25 & 4) != 0) {
            unint64_t v60 = (v52 > 0.0) - (unint64_t)(v52 < 0.0);
          }
          else {
            unint64_t v60 = 0;
          }
          uint64_t v61 = (uint64_t)fmin(v27, (double)(uint64_t)(v60 + (uint64_t)v35));
          double v62 = v59;
          BOOL v63 = (v25 & 8) != 0 && v54 - v55;
          uint64_t v64 = (uint64_t)fmin(v28, (double)(v63 + (uint64_t)v37));
          float v29 = fmax(v62, 0.0);
          float v30 = (float)v61 - v24;
          float v31 = (float)v64 - v29;
          --a6;
        }
        while (a6);
        *((float *)&v66 + 1) = v29;
        *((float *)&v66 + 2) = (float)v61 - v24;
        *((float *)&v66 + 3) = (float)v64 - v29;
      }
      uint64_t result = 0;
      *(float *)&long long v66 = v24;
      *(_OWORD *)(a2 + 1480) = v66;
      *(_DWORD *)(a2 + 1496) = 1;
      *(_DWORD *)(a2 + 1476) = 6;
      *(_DWORD *)(a2 + 1468) = 1;
    }
  }
  return result;
}

void AcAttrNode::preProcess()
{
  __assert_rtn("preProcess", "acattrnode.cpp", 110, "numFaces <= 10");
}

void AcAttrNode::postProcess()
{
}

{
  __assert_rtn("bmBufferDequantizeInt8", "bmbufferprivate.h", 82, "input.width == output.width");
}

{
  __assert_rtn("bmBufferDequantizeInt8", "bmbufferprivate.h", 81, "input.height == output.height");
}

{
  __assert_rtn("bmBufferDequantizeInt8", "bmbufferprivate.h", 79, "input.pixelFormat == kBmBufferPixelFormatType_Int8");
}

{
  __assert_rtn("bmBufferDequantizeUInt8", "bmbufferprivate.h", 99, "input.width == output.width");
}

{
  __assert_rtn("bmBufferDequantizeUInt8", "bmbufferprivate.h", 98, "input.height == output.height");
}

{
  __assert_rtn("bmBufferDequantizeUInt8", "bmbufferprivate.h", 96, "input.pixelFormat == kBmBufferPixelFormatType_UInt8");
}

void AcAttrNode::getParams()
{
}

void ttDetRectFromObject()
{
}

void ft::HungarianMatcher::HungarianMatcher(void **a1, uint64_t a2)
{
  float v3 = *a1;
  if (v3)
  {
    *(void *)(a2 + 32) = v3;
    operator delete(v3);
  }
  int v4 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v4;
    operator delete(v4);
  }
}

void acCropResizeGenerateConfig()
{
  __assert_rtn("acCropResizeGenerateConfig", "accropresize.cpp", 31, "srcPyrInfo.numLevels <= 4");
}

{
  __assert_rtn("acCropResizeGenerateConfig", "accropresize.cpp", 48, "pyrInd == 0 || srcPyrInfo.widths[pyrInd] <= srcPyrInfo.widths[pyrInd - 1]");
}

{
  __assert_rtn("acCropResizeGenerateConfig", "accropresize.cpp", 50, "pyrInd == 0 || srcPyrInfo.heights[pyrInd] <= srcPyrInfo.heights[pyrInd - 1]");
}

{
  __assert_rtn("acCropResizeGenerateConfig", "accropresize.cpp", 111, "yStartY < srcPyrInfo.heights[crop.pyrIndex]");
}

{
  __assert_rtn("acCropResizeGenerateConfig", "accropresize.cpp", 110, "xStartY < srcPyrInfo.widths[crop.pyrIndex]");
}

{
  __assert_rtn("acCropResizeGenerateConfig", "accropresize.cpp", 30, "!(dstWidth & 0x01) && !(dstHeight & 0x01)");
}

void AcDetNode::init()
{
}

{
  __assert_rtn("init", "acdetnode.cpp", 194, "m_config.fmBboxCounts[scaleInd]");
}

void AcDetNode::postProcessDet()
{
  __assert_rtn("acDetCategoryToIsp", "acdetnode.cpp", 46, "cat != kAcDetCategory_Background");
}

{
  __assert_rtn("acDetCategoryToIsp", "acdetnode.cpp", 47, "cat < kAcDetCategoryMax");
}

{
  __assert_rtn("getClsBufferInds", "acdetnode.cpp", 546, "posInd != ((uint32_t)-1)");
}

{
  __assert_rtn("getClsBufferInds", "acdetnode.cpp", 547, "negInd != ((uint32_t)-1)");
}

void AcDetNode::getParams(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2 + 576 * a3;
  *(_DWORD *)(v3 + 508) = *(_DWORD *)(a1 + 108);
  *(_DWORD *)(v3 + 504) = *(_DWORD *)(a1 + 132);
  __assert_rtn("yawBufChCount", "acdetnode.cpp", 538, "state.magic == 0xde71");
}

{
  uint64_t v3;

  uint64_t v3 = a2 + 576 * a3;
  *(_DWORD *)(v3 + 364) = *(_DWORD *)(a1 + 108);
  *(_DWORD *)(v3 + 360) = *(_DWORD *)(a1 + 132);
  __assert_rtn("rollBufChCount", "acdetnode.cpp", 532, "state.magic == 0xde71");
}

{
  uint64_t v3;

  uint64_t v3 = a2 + 576 * a3;
  *(_DWORD *)(v3 + 220) = *(_DWORD *)(a1 + 108);
  *(_DWORD *)(v3 + 216) = *(_DWORD *)(a1 + 132);
  __assert_rtn("bboxBufChCount", "acdetnode.cpp", 508, "state.magic == 0xde71");
}

void AcDetNode::getParams()
{
  __assert_rtn("classPosBufChCount", "acdetnode.cpp", 520, "state.magic == 0xde71");
}

{
  __assert_rtn("classBufChCount", "acdetnode.cpp", 514, "state.magic == 0xde71");
}

void AcDetNode::classNegBufChCount()
{
  __assert_rtn("classNegBufChCount", "acdetnode.cpp", 526, "state.magic == 0xde71");
}

void AcDetNode::bboxBufChCount()
{
  __assert_rtn("bboxBufChCount", "acdetnode.cpp", 508, "state.magic == 0xde71");
}

void AcDetNode::rollBufChCount()
{
  __assert_rtn("rollBufChCount", "acdetnode.cpp", 532, "state.magic == 0xde71");
}

void AcDetNode::yawBufChCount()
{
  __assert_rtn("yawBufChCount", "acdetnode.cpp", 538, "state.magic == 0xde71");
}

void acAttrReduceSmile()
{
  __assert_rtn("acAttrReduceSmile", "acattrreduce.cpp", 24, "smileThreshold <= 100");
}

void acAttrReduceBlink()
{
  __assert_rtn("acAttrReduceBlink", "acattrreduce.cpp", 41, "(*netOutput).height >= kOutputCount");
}

{
  __assert_rtn("acAttrReduceBlink", "acattrreduce.cpp", 42, "blinkThreshold <= 100");
}

{
  __assert_rtn("acAttrReduceBlink", "acattrreduce.cpp", 43, "occludedThreshold <= 100");
}

void acAttrReduceYaw()
{
  __assert_rtn("acAttrReduceYaw", "acattrreduce.cpp", 65, "numBins <= 10");
}

void acAttrReduceRoll()
{
  __assert_rtn("acAttrReduceRoll", "acattrreduce.cpp", 91, "numBins <= 10");
}

void acDetRectSmallRectSuppression()
{
  __assert_rtn("acDetRectSmallRectSuppression", "acdetrect.cpp", 139, "sortedRects[justSelected].score >= sortedRects[check].score");
}

{
  __assert_rtn("acDetRectSmallRectSuppression", "acdetrect.cpp", 144, "remaining <= check");
}

void acDetRectLowMergeCountSuppression()
{
  __assert_rtn("acDetRectLowMergeCountSuppression", "acdetrect.cpp", 188, "remaining <= check");
}

void acDetRectWeightedMerge()
{
}

{
  __assert_rtn("acDetRectWeightedMerge", "acdetrect.cpp", 257, "remaining <= check");
}

void acDetRectFromFace()
{
}

void TtTrkRpnNode::instancePostProcess()
{
  __assert_rtn("instancePostProcess", "tttrkrpnnode.cpp", 455, "netOutputs[i].pixelFormat == kBmBufferPixelFormatType_Half || netOutputs[i].pixelFormat == kBmBufferPixelFormatType_Float");
}

void bmBufferDequantizeHalf()
{
  __assert_rtn("bmBufferDequantizeHalf", "bmbufferprivate.h", 116, "input.width == output.width");
}

{
  __assert_rtn("bmBufferDequantizeHalf", "bmbufferprivate.h", 115, "input.height == output.height");
}

{
  __assert_rtn("bmBufferDequantizeHalf", "bmbufferprivate.h", 114, "output.pixelFormat == kBmBufferPixelFormatType_Float");
}

{
  __assert_rtn("bmBufferDequantizeHalf", "bmbufferprivate.h", 113, "input.pixelFormat == kBmBufferPixelFormatType_Half");
}

void TtTrkRpnNode::setUpNetBuffers()
{
  __assert_rtn("setUpNetBuffers", "tttrkrpnnode.cpp", 749, "ptr - (const uint8_t*)netBufferPtrs.xcorrOutputs[i] == params.xcorrNetOutBatchBytes[i]");
}

{
  __assert_rtn("setUpNetBuffers", "tttrkrpnnode.cpp", 736, "ptr - (const uint8_t*)netBufferPtrs.templateKernels[i] == params.templateNetOutBatchBytes[i]");
}

{
  __assert_rtn("setUpNetBuffers", "tttrkrpnnode.cpp", 724, "ptr - (const uint8_t*)netBufferPtrs.exemplarCrop == params.exemplarCropBatchBytes");
}

{
  __assert_rtn("setUpNetBuffers", "tttrkrpnnode.cpp", 712, "ptr - (const uint8_t*)netBufferPtrs.instanceCrop == params.instanceCropBatchBytes");
}

void ReportException()
{
  OUTLINED_FUNCTION_3();
  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_1(&dword_21762A000, v1, v2, "FusionTracker error: %s", v3, v4, v5, v6, 2u);
}

void ft::CinematicTracker::TerminateDetectionlessTrack()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21762A000, v0, v1, "Internal inconsistency: detection-less track is not high-priority.", v2, v3, v4, v5, v6);
}

void rtcv::bmBufferPixelFormatTypeToString(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned char *a5)
{
  if (*(char *)(a1 + 223) < 0) {
    operator delete(*(void **)(a1 + 200));
  }
  if (*(char *)(a1 + 191) < 0) {
    operator delete(*(void **)(a1 + 168));
  }
  if (*(char *)(a1 + 159) < 0) {
    operator delete(*(void **)(a1 + 136));
  }
  if (*(char *)(a1 + 127) < 0) {
    operator delete(*(void **)(a1 + 104));
  }
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  *a5 = 0;
  *(_DWORD *)(a4 + 8) = a3;
  *(void *)a4 = a2;
}

void simResizeVisPipeBinning()
{
  __assert_rtn("simResizeVisPipeBinning", "simresizevispipe.cpp", 57, "startX == 0.0f && startY == 0.0f");
}

{
  __assert_rtn("simResizeVisPipeBinning", "simresizevispipe.cpp", 61, "xStep == 1 || xStep == 2 || xStep == 4 || xStep == 8");
}

{
  __assert_rtn("simResizeVisPipeBinning", "simresizevispipe.cpp", 62, "yStep == 1 || yStep == 2 || yStep == 4 || yStep == 8");
}

{
  __assert_rtn("bmBufferPixelAtUInt16", "bmbufferprivate.h", 63, "x < buf.width && y < buf.height");
}

void simResizeVisPipe()
{
  __assert_rtn("simResizeVisPipe", "simresizevispipe.cpp", 247, "scaleX <= ISP_RESIZE_MAX_SCALE && scaleY <= ISP_RESIZE_MAX_SCALE");
}

{
  __assert_rtn("simResizeVisPipe", "simresizevispipe.cpp", 251, "scaleX >= ISP_RESIZE_MIN_SCALE * ISP_RESIZE_MIN_SCALE && scaleY >= ISP_RESIZE_MIN_SCALE * ISP_RESIZE_MIN_SCALE");
}

{
  __assert_rtn("simResizeVisPipe", "simresizevispipe.cpp", 254, "(scaleX <= 1 && scaleY <= 1) || (method != SimResizeVisPipeMethod::Area)");
}

{
  __assert_rtn("simResizeVisPipe", "simresizevispipe.cpp", 255, "output.width <= ISP_RESIZE_MAX_WIDTH");
}

{
  __assert_rtn("simResizeVisPipe", "simresizevispipe.cpp", 257, "output.height <= ISP_RESIZE_MAX_HEIGHT");
}

void acNonMaxSuppression()
{
  __assert_rtn("acNonMaxSuppression", "acnonmaxsuppression.cpp", 18, "__null != rects");
}

{
  __assert_rtn("acNonMaxSuppression", "acnonmaxsuppression.cpp", 35, "remaining <= check");
}

void acCrossClassSuppression()
{
  __assert_rtn("acCrossClassSuppression", "acnonmaxsuppression.cpp", 49, "__null != rects");
}

{
  __assert_rtn("acCrossClassSuppression", "acnonmaxsuppression.cpp", 66, "remaining <= check");
}

void acNonMaxSuppressionSmallbox()
{
  __assert_rtn("acNonMaxSuppressionSmallbox", "acnonmaxsuppression.cpp", 79, "__null != rects");
}

{
  __assert_rtn("acNonMaxSuppressionSmallbox", "acnonmaxsuppression.cpp", 96, "remaining <= check");
}

void acRemoveOverlapBoxes()
{
  __assert_rtn("acRemoveOverlapBoxes", "acnonmaxsuppression.cpp", 110, "numRects <= tempBytes");
}

void ft::Detector::Detector(void **__p)
{
  do
  {
    uint64_t v2 = (void **)*__p;
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
    operator delete(__p);
    std::string __p = v2;
  }
  while (v2);
}

void ik::LogEspressoError(uint64_t *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (*((char *)a1 + 23) >= 0) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = (uint64_t *)*a1;
  }
  int v2 = 136315394;
  uint64_t v3 = v1;
  __int16 v4 = 2080;
  uint64_t status_string = espresso_get_status_string();
  _os_log_error_impl(&dword_21762A000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Encountered an error during: %s\n -> Espresso Error: %s", (uint8_t *)&v2, 0x16u);
}

{
  int v2;
  uint64_t *v3;
  uint64_t status_string;
  uint64_t *v5;
  int v6;
  uint64_t *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  unsigned int v10 = *MEMORY[0x263EF8340];
  int v2 = *((char *)a1 + 23);
  uint64_t v3 = (uint64_t *)*a1;
  uint64_t status_string = espresso_get_status_string();
  if (v2 >= 0) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = v3;
  }
  uint64_t v6 = 136315394;
  unsigned int v7 = v5;
  int v8 = 2080;
  uint64_t v9 = status_string;
  _os_log_error_impl(&dword_21762A000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Encountered an error during: %s\n -> Espresso Error: %s", (uint8_t *)&v6, 0x16u);
}

void ik::EspressoNet::Predict(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::pair<std::string const,ik::EspressoTensor>::pair[abi:ne180100](void **a1)
{
  if (*((char *)a1 + 23) < 0) {
    OUTLINED_FUNCTION_0_0(a1);
  }
}

void bmBufferResizeCHW()
{
}

{
  __assert_rtn("bmBufferResize2xSingleChannelCHW", "bmbuffergeometry.cpp", 52, "src.height > 0");
}

{
  __assert_rtn("bmBufferResize2xSingleChannelCHW", "bmbuffergeometry.cpp", 54, "dst.height == src.height * 2");
}

{
  __assert_rtn("bmBufferResize2xSingleChannelCHW", "bmbuffergeometry.cpp", 53, "dst.width == src.width * 2");
}

{
  __assert_rtn("bmBufferResize2xCHW", "bmbuffergeometry.cpp", 84, "dstViewHeight * numChannels == dst.height");
}

{
  __assert_rtn("bmBufferResize2xCHW", "bmbuffergeometry.cpp", 81, "srcViewHeight * numChannels == src.height");
}

{
  __assert_rtn("bmBufferResize2xCHW", "bmbuffergeometry.cpp", 78, "src.pixelFormat == kBmBufferPixelFormatType_Int8");
}

{
  __assert_rtn("bmBufferResize2xCHW", "bmbuffergeometry.cpp", 77, "dst.pixelFormat == src.pixelFormat");
}

{
  __assert_rtn("bmBufferResizeCHW", "bmbuffergeometry.cpp", 206, "false");
}

void bmBufferPartialResizeCHW()
{
}

{
  __assert_rtn("bmBufferResizeBicubicSingleChannelCHW", "bmbuffergeometry.cpp", 123, "dst.width >= src.width");
}

{
  __assert_rtn("bmBufferResizeBicubicSingleChannelCHW", "bmbuffergeometry.cpp", 124, "dst.height >= src.height");
}

{
  __assert_rtn("bmBufferResizeBicubicSingleChannelCHW", "bmbuffergeometry.cpp", 126, "dst.pixelFormat == kBmBufferPixelFormatType_Float");
}

{
  __assert_rtn("bmBufferResizeBicubicSingleChannelCHW", "bmbuffergeometry.cpp", 125, "src.pixelFormat == kBmBufferPixelFormatType_Float");
}

{
  __assert_rtn("bmBufferResizeBicubicCHW", "bmbuffergeometry.cpp", 176, "dstViewHeight * numChannels == dst.height");
}

{
  __assert_rtn("bmBufferResizeBicubicCHW", "bmbuffergeometry.cpp", 173, "srcViewHeight * numChannels == src.height");
}

{
  __assert_rtn("bmBufferPartialResizeCHW", "bmbuffergeometry.cpp", 216, "false");
}

void bmBufferResizeCoordConvert()
{
}

{
  __assert_rtn("bmBufferResizeCoordConvert", "bmbuffergeometry.cpp", 223, "srcW && srcH && dstW && dstH");
}

void bmBufferResizeCoordConvertReversed()
{
}

{
  __assert_rtn("bmBufferResizeCoordConvertReversed", "bmbuffergeometry.cpp", 247, "srcW && srcH && dstW && dstH");
}

void bmArgMax()
{
}

void ft::TrackPool::UpdateForeignTracks(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21762A000, log, OS_LOG_TYPE_ERROR, "Observation ID has internal track mask set.", buf, 2u);
}

void std::vector<std::shared_ptr<ft::Track>>::vector(void **a1, char *a2, void **a3)
{
  uint64_t v5 = (char *)*a1;
  uint64_t v6 = a2;
  if (v5 != a2)
  {
    do
    {
      int v8 = (std::__shared_weak_count *)*((void *)v5 - 1);
      if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
      v5 -= 16;
    }
    while (v5 != a2);
    uint64_t v6 = *a3;
  }
  *a1 = a2;

  operator delete(v6);
}

void FTGetChipIdentifier_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21762A000, a2, OS_LOG_TYPE_ERROR, "Unknown chip encountered: 0x%x", (uint8_t *)v2, 8u);
}

void ttNonMaxSuppression()
{
  __assert_rtn("ttNonMaxSuppression", "ttnonmaxsuppression.cpp", 17, "__null != rects");
}

{
  __assert_rtn("ttNonMaxSuppression", "ttnonmaxsuppression.cpp", 33, "remaining <= check");
}

void ttNonMaxSuppression2()
{
  __assert_rtn("ttNonMaxSuppression2", "ttnonmaxsuppression.cpp", 46, "__null != rects");
}

{
  __assert_rtn("ttNonMaxSuppression2", "ttnonmaxsuppression.cpp", 62, "remaining <= check");
}

void ttNonMaxSuppressionSmallbox()
{
  __assert_rtn("ttNonMaxSuppressionSmallbox", "ttnonmaxsuppression.cpp", 75, "__null != rects");
}

{
  __assert_rtn("ttNonMaxSuppressionSmallbox", "ttnonmaxsuppression.cpp", 92, "remaining <= check");
}

void ttRemoveOverlapBoxes()
{
  __assert_rtn("ttRemoveOverlapBoxes", "ttnonmaxsuppression.cpp", 105, "numRects <= tempBytes");
}

void rtcv::simResize()
{
  __assert_rtn("simResizeBGRA8888AccelerateFramework", "simresize.cpp", 41, "dstViewHeight <= dstHeight");
}

{
  __assert_rtn("simResizeBGRA8888AccelerateFramework", "simresize.cpp", 38, "dstViewWidth <= dstWidth");
}

void rtcv::simImageChMeanTempBytes()
{
}

void rtcv::simImageChMean()
{
  __assert_rtn("simImageChMeanGetTempBuffers", "simresize.cpp", 209, "numTempBytes >= bs.totalBytes()");
}

{
  __assert_rtn("nextChunk", "bmmixedbufsize.h", 71, "m_nextChunkOffset <= m_totalBytes");
}

void addToHeap()
{
  __assert_rtn("addToHeap", "ttHeap.cpp", 72, "heap->magic == 0x12345678");
}

void removeFromHeap()
{
  __assert_rtn("removeFromHeap", "ttHeap.cpp", 89, "heap->magic == 0x12345678");
}

void acDetBboxCoderDecodeAll()
{
  __assert_rtn("acDetBboxCoderDecodeAll", "acdetbboxcoder.cpp", 58, "7 == config.categoryCount || 5 == config.categoryCount");
}

{
  __assert_rtn("acDetBboxCoderDecodeAll", "acdetbboxcoder.cpp", 89, "config.posChannelCounts[layerInd] > 0");
}

{
  __assert_rtn("acDetBboxCoderDecodeAll", "acdetbboxcoder.cpp", 128, "globalDefaultBoxInd < defaultBoxWidthsHeightsLen");
}

{
  __assert_rtn("acDetBboxCoderPoseDegrees", "acdetbboxcoder.cpp", 36, "predictions.width == numPoseBins");
}

{
  __assert_rtn("acDetBboxCoderDecodeAll", "acdetbboxcoder.cpp", 261, "outBoxInd < maxOutBoxes");
}

{
  __assert_rtn("acDetBboxCoderDecodeAll", "acdetbboxcoder.cpp", 109, "layerHeight * numDefaults * 4 == offsetsBuf.height");
}

{
  __assert_rtn("acDetBboxCoderDecodeAll", "acdetbboxcoder.cpp", 108, "logitsUniPosBuf->width == offsetsBuf.width");
}

{
  __assert_rtn("acDetBboxCoderDecodeAll", "acdetbboxcoder.cpp", 107, "layerHeight * numLogitsUniPosChs == logitsUniPosBuf->height");
}

{
  __assert_rtn("acDetBboxCoderDecodeAll", "acdetbboxcoder.cpp", 105, "yawBuf.pixelFormat == kBmBufferPixelFormatType_Int8");
}

{
  __assert_rtn("acDetBboxCoderDecodeAll", "acdetbboxcoder.cpp", 102, "rollBuf.pixelFormat == kBmBufferPixelFormatType_Int8");
}

{
  __assert_rtn("acDetBboxCoderDecodeAll", "acdetbboxcoder.cpp", 99, "offsetsBuf.pixelFormat == kBmBufferPixelFormatType_Int8");
}

{
  __assert_rtn("acDetBboxCoderDecodeAll", "acdetbboxcoder.cpp", 93, "!logitsNegBuf || logitsNegBuf->pixelFormat == kBmBufferPixelFormatType_Int8");
}

{
  __assert_rtn("acDetBboxCoderDecodeAll", "acdetbboxcoder.cpp", 91, "logitsUniPosBuf->pixelFormat == kBmBufferPixelFormatType_Int8");
}

void acDetBboxCoderDecodeAllFloat()
{
  __assert_rtn("acDetBboxCoderDecodeAllFloat", "acdetbboxcoder.cpp", 327, "7 == config.categoryCount || 5 == config.categoryCount");
}

{
  __assert_rtn("acDetBboxCoderDecodeAllFloat", "acdetbboxcoder.cpp", 354, "config.posChannelCounts[layerInd] > 0");
}

{
  __assert_rtn("acDetBboxCoderDecodeAllFloat", "acdetbboxcoder.cpp", 390, "globalDefaultBoxInd < defaultBoxWidthsHeightsLen");
}

{
  __assert_rtn("acDetBboxCoderDecodeAllFloat", "acdetbboxcoder.cpp", 522, "outBoxInd < maxOutBoxes");
}

{
  __assert_rtn("acDetBboxCoderDecodeAllFloat", "acdetbboxcoder.cpp", 379, "logitsUniPosStride * (uint32_t)sizeof(float) == layerHeight * logitsUniPosBuf->rowBytes");
}

{
  __assert_rtn("acDetBboxCoderDecodeAllFloat", "acdetbboxcoder.cpp", 371, "layerHeight * numDefaults * 4 == offsetsBuf.height");
}

{
  __assert_rtn("acDetBboxCoderDecodeAllFloat", "acdetbboxcoder.cpp", 370, "logitsUniPosBuf->width == offsetsBuf.width");
}

{
  __assert_rtn("acDetBboxCoderDecodeAllFloat", "acdetbboxcoder.cpp", 369, "layerHeight * numLogitsUniPosChs == logitsUniPosBuf->height");
}

{
  __assert_rtn("acDetBboxCoderDecodeAllFloat", "acdetbboxcoder.cpp", 367, "yawBuf.pixelFormat == kBmBufferPixelFormatType_Float");
}

{
  __assert_rtn("acDetBboxCoderDecodeAllFloat", "acdetbboxcoder.cpp", 365, "rollBuf.pixelFormat == kBmBufferPixelFormatType_Float");
}

{
  __assert_rtn("acDetBboxCoderDecodeAllFloat", "acdetbboxcoder.cpp", 363, "offsetsBuf.pixelFormat == kBmBufferPixelFormatType_Float");
}

{
  __assert_rtn("acDetBboxCoderDecodeAllFloat", "acdetbboxcoder.cpp", 358, "!logitsNegBuf || logitsNegBuf->pixelFormat == kBmBufferPixelFormatType_Float");
}

{
  __assert_rtn("acDetBboxCoderDecodeAllFloat", "acdetbboxcoder.cpp", 356, "logitsUniPosBuf->pixelFormat == kBmBufferPixelFormatType_Float");
}

void bmMunkresGetTempBuffers()
{
  __assert_rtn("bmMunkresGetTempBuffers", "bmmunkres.cpp", 375, "numTempBytes >= bs.totalBytes()");
}

{
  __assert_rtn("bmMunkresGetTempBuffers", "bmmunkres.cpp", 376, "tempBuffers");
}

void bmMunkres()
{
}

{
  __assert_rtn("bmMunkres", "bmmunkres.cpp", 396, "maxMatches >= size");
}

{
  __assert_rtn("bmMunkresSubtractMinPerRow", "bmmunkres.cpp", 80, "rowMin >= 0");
}

{
  __assert_rtn("bmMunkresSubtractMinPerCol", "bmmunkres.cpp", 57, "colMin >= 0");
}

{
  __assert_rtn("bmMunkresMaxAssignments", "bmmunkres.cpp", 127, "temp");
}

{
  __assert_rtn("bmMunkresMaxAssignmentsGetTempBuffers", "bmmunkres.cpp", 107, "numTempBytes >= bs.totalBytes()");
}

{
  __assert_rtn("bmMunkres", "bmmunkres.cpp", 523, "xi != 0");
}

{
  __assert_rtn("bmMunkresUpdateCost", "bmmunkres.cpp", 331, "rowLineFlags != nullptr");
}

{
  __assert_rtn("bmMunkresUpdateCost", "bmmunkres.cpp", 332, "colLineFlags != nullptr");
}

{
  __assert_rtn("bmMunkresMaxAssignments", "bmmunkres.cpp", 165, "0 <= aCol[r]");
}

{
  __assert_rtn("bmMunkresSubtractMinPerCol", "bmmunkres.cpp", 58, "minRow < costBuf.width");
}

{
  __assert_rtn("bmMunkresSubtractMinPerRow", "bmmunkres.cpp", 81, "minCol < costBuf.height");
}

void ft::TrackMatcher::Match(uint64_t a1)
{
  int v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
}

void TtDetNode::postProcess()
{
  __assert_rtn("ttDetCategoryToIsp", "ttdetnode.cpp", 42, "cat != kTtDetCategory_Background");
}

{
  __assert_rtn("ttDetCategoryToIsp", "ttdetnode.cpp", 43, "cat < kTtDetCategoryMax");
}

void FTComputeMeanColor_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21762A000, log, OS_LOG_TYPE_ERROR, "FTComputeMeanColor provided null pointer for histogram.", v1, 2u);
}

void FTComputeMeanColor_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21762A000, log, OS_LOG_TYPE_ERROR, "FTComputeMeanColor provided null pointer for output mean.", v1, 2u);
}

void ttAssocSetUpMunkresCost()
{
  __assert_rtn("ttAssocSetUpMunkresCost", "ttassoc.cpp", 71, "costBufLen >= costMatSize * costMatSize");
}

void ttAssocCore()
{
}

{
  __assert_rtn("ttAssocCore", "ttassoc.cpp", 122, "unmatchedDetObjectCount < unmatchedDetObjectsLen");
}

{
  __assert_rtn("ttAssocCore", "ttassoc.cpp", 167, "ti < numTrkObjects");
}

void ttAssocTrkDetGetTempBuffers()
{
  __assert_rtn("ttAssocTrkDetGetTempBuffers", "ttassoc.cpp", 207, "numTempBytes >= bs.totalBytes()");
}

{
  __assert_rtn("ttAssocTrkDetGetTempBuffers", "ttassoc.cpp", 208, "tempBuffers");
}

void ttAssocObjectRemoveKilled()
{
}

void ttAssocTrkDet()
{
  __assert_rtn("ttAssocTrkDet", "ttassoc.cpp", 268, "numTrkObjects <= maxTrkObjects");
}

{
  __assert_rtn("ttAssocTrkDet", "ttassoc.cpp", 269, "numDetObjects <= maxTrkObjects");
}

{
  __assert_rtn("ttAssocTrkDet", "ttassoc.cpp", 270, "tempBufBytes >= ttAssocTrkDetTempBytes(maxTrkObjects)");
}

{
  __assert_rtn("ttAssocTrkDet", "ttassoc.cpp", 274, "isDetRunningThisFrame || !numDetObjects");
}

{
  __assert_rtn("ttAssocTrkDet", "ttassoc.cpp", 321, "costMatSize * costMatSize <= maxTrkObjects * maxTrkObjects");
}

{
  __assert_rtn("ttAssocTrkDet", "ttassoc.cpp", 402, "ki >= n");
}

{
  __assert_rtn("ttAssocTrkDet", "ttassoc.cpp", 407, "i == 0 || trkObjects[ti].age <= trkObjects[killTemp[i - 1].index].age");
}

{
  __assert_rtn("ttAssocTrkDet", "ttassoc.cpp", 415, "numTrkObjects - trkKillCount + unmatchedDetObjectCount <= maxTrkObjects");
}

{
  __assert_rtn("ttAssocTrkDet", "ttassoc.cpp", 424, "newNumTrkObjects < maxTrkObjects");
}

{
  __assert_rtn("ttAssocTrkDet", "ttassoc.cpp", 408, "trkObjects[ti].killFlag == kTtAssocObjectKillFlag_Maybe");
}

void TtAssocObjectRemoveOldOverlapObjects_cold_1()
{
  __assert_rtn("TtAssocObjectRemoveOldOverlapObjects", "ttassoc.cpp", 538, "trkObjects->objects[justSelected].age <= trkObjects->objects[check].age");
}

void TtAssocObjectRemoveOldOverlapObjects_cold_2()
{
  __assert_rtn("TtAssocObjectRemoveOldOverlapObjects", "ttassoc.cpp", 542, "remaining <= check");
}

void computeIntegralImage()
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x270EE7188]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x270EE7278](dict, rect);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x270EE7DE0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x270EE7E20](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7F08](retstr, lhs, rhs);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1D0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x270EEA278](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x270F3D448]();
}

uint64_t IOSurfaceAcceleratorGetHistogram()
{
  return MEMORY[0x270F3D450]();
}

uint64_t IOSurfaceAcceleratorTransformSurface()
{
  return MEMORY[0x270F3D468]();
}

uint64_t IOSurfaceGetCompressionTypeOfPlane()
{
  return MEMORY[0x270EF4CF8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x270F95FF0]();
}

void NSLog(NSString *format, ...)
{
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x270F06820](session, propertyKey, propertyValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x270F983C8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B8](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x270F983D0](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x270F98900](this);
}

void std::recursive_mutex::~recursive_mutex(std::recursive_mutex *this)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x270F98C18]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

simd_float2x2 __invert_f2(simd_float2x2 a1)
{
  MEMORY[0x270ED7E10]((__n128)a1, *(__n128 *)((char *)&a1 + 8));
  result.columns[1] = v2;
  result.columns[0] = v1;
  return result;
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

float cosf(float a1)
{
  MEMORY[0x270ED9130](a1);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t espresso_buffer_get_rank()
{
  return MEMORY[0x270F27EC0]();
}

uint64_t espresso_buffer_unpack_tensor_shape()
{
  return MEMORY[0x270F27ED8]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x270F27EE0]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x270F27F08]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x270F27F20]();
}

uint64_t espresso_get_status_string()
{
  return MEMORY[0x270F27F68]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x270F27F78]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x270F27F98]();
}

uint64_t espresso_network_bind_input_vimagebuffer_argb8()
{
  return MEMORY[0x270F27FC0]();
}

uint64_t espresso_network_bind_input_vimagebuffer_bgra8()
{
  return MEMORY[0x270F27FC8]();
}

uint64_t espresso_network_bind_input_vimagebuffer_planar8()
{
  return MEMORY[0x270F27FD8]();
}

uint64_t espresso_network_bind_input_vimagebuffer_rgba8()
{
  return MEMORY[0x270F27FE8]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x270F28010]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x270F28068]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x270F28070]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x270F28090]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x270F280A0]();
}

uint64_t espresso_plan_set_priority()
{
  return MEMORY[0x270F280B8]();
}

uint64_t espresso_plan_share_intermediate_buffer()
{
  return MEMORY[0x270F280C0]();
}

uint64_t espresso_set_image_preprocessing_params()
{
  return MEMORY[0x270F280D8]();
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

void free(void *a1)
{
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vfltu8(const unsigned __int8 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

vImage_Error vImageAffineWarp_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, const vImage_AffineTransform *transform, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x270EDEEE8](src, dest, tempBuffer, transform, backColor, *(void *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF328](src, dest, tempBuffer, *(void *)&flags);
}