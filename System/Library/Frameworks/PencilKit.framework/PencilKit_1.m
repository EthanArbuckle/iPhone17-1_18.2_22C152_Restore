uint64_t drawingV1::Transform::operator=(uint64_t a1, const drawingV1::Transform *a2)
{
  int v3;
  long long v4;
  unsigned char v6[8];
  long long v7;
  uint64_t v8;
  int v9;

  if ((const drawingV1::Transform *)a1 != a2)
  {
    drawingV1::Transform::Transform((drawingV1::Transform *)v6, a2);
    v3 = *(_DWORD *)(a1 + 32);
    *(_DWORD *)(a1 + 32) = v9;
    v9 = v3;
    v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    v7 = v4;
    *(void *)&v4 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = v8;
    v8 = v4;
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

float drawingV1::swap(drawingV1 *this, drawingV1::Transform *a2, drawingV1::Transform *a3)
{
  int v3 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v3;
  int v4 = *((_DWORD *)this + 2);
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  *((_DWORD *)a2 + 2) = v4;
  int v5 = *((_DWORD *)this + 3);
  *((_DWORD *)this + 3) = *((_DWORD *)a2 + 3);
  *((_DWORD *)a2 + 3) = v5;
  int v6 = *((_DWORD *)this + 4);
  *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v6;
  int v7 = *((_DWORD *)this + 5);
  *((_DWORD *)this + 5) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v7;
  int v8 = *((_DWORD *)this + 6);
  *((_DWORD *)this + 6) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v8;
  float result = *((float *)this + 7);
  *((_DWORD *)this + 7) = *((_DWORD *)a2 + 7);
  *((float *)a2 + 7) = result;
  return result;
}

float drawingV1::Transform::Transform(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F1FB0AC0;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a2 + 32) = 0;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  float result = *(float *)(a2 + 28);
  *(float *)(a1 + 28) = result;
  return result;
}

{
  float result;

  *(void *)a1 = &unk_1F1FB0AC0;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a2 + 32) = 0;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  float result = *(float *)(a2 + 28);
  *(float *)(a1 + 28) = result;
  return result;
}

uint64_t drawingV1::Transform::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    int v8 = &unk_1F1FB0AC0;
    int v3 = *(_DWORD *)(a2 + 32);
    *(_DWORD *)(a2 + 32) = 0;
    int v11 = *(_DWORD *)(a1 + 32);
    long long v4 = *(_OWORD *)(a2 + 8);
    long long v9 = *(_OWORD *)(a1 + 8);
    uint64_t v5 = *(void *)(a1 + 24);
    uint64_t v6 = *(void *)(a2 + 24);
    *(_DWORD *)(a1 + 32) = v3;
    *(_OWORD *)(a1 + 8) = v4;
    *(void *)(a1 + 24) = v6;
    uint64_t v10 = v5;
    PB::Base::~Base((PB::Base *)&v8);
  }
  return a1;
}

uint64_t drawingV1::Transform::formatText(drawingV1::Transform *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 32);
  if (v5)
  {
    PB::TextFormatter::format(a2, "a", *((float *)this + 2));
    char v5 = *((unsigned char *)this + 32);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)this + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "b", *((float *)this + 3));
  char v5 = *((unsigned char *)this + 32);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PB::TextFormatter::format(a2, "c", *((float *)this + 4));
  char v5 = *((unsigned char *)this + 32);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PB::TextFormatter::format(a2, "d", *((float *)this + 5));
  char v5 = *((unsigned char *)this + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PB::TextFormatter::format(a2, "tx", *((float *)this + 6));
  if ((*((unsigned char *)this + 32) & 0x20) != 0) {
LABEL_7:
  }
    PB::TextFormatter::format(a2, "ty", *((float *)this + 7));
LABEL_8:

  return MEMORY[0x1F4147498](a2);
}

uint64_t drawingV1::Transform::readFrom(drawingV1::Transform *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
    {
      char v15 = 0;
      unsigned int v16 = 0;
      unint64_t v11 = 0;
      if (v2 > v3) {
        unint64_t v3 = v2;
      }
      do
      {
        if (v3 == v2)
        {
          int v4 = 1;
          *((unsigned char *)a2 + 24) = 1;
          return v4 == 0;
        }
        unint64_t v17 = v2 + 1;
        char v18 = *(unsigned char *)(v8 + v2);
        *((void *)a2 + 1) = v17;
        v11 |= (unint64_t)(v18 & 0x7F) << v15;
        if ((v18 & 0x80) == 0) {
          goto LABEL_21;
        }
        v15 += 7;
        unint64_t v2 = v17;
        BOOL v14 = v16++ > 8;
      }
      while (!v14);
LABEL_19:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      goto LABEL_43;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_21:
    if ((v11 & 7) == 4) {
      break;
    }
    switch((v11 >> 3))
    {
      case 1u:
        *((unsigned char *)this + 32) |= 1u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2)) {
          goto LABEL_40;
        }
        *((_DWORD *)this + 2) = *(_DWORD *)(*(void *)a2 + v2);
        goto LABEL_42;
      case 2u:
        *((unsigned char *)this + 32) |= 2u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2)) {
          goto LABEL_40;
        }
        *((_DWORD *)this + 3) = *(_DWORD *)(*(void *)a2 + v2);
        goto LABEL_42;
      case 3u:
        *((unsigned char *)this + 32) |= 4u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2)) {
          goto LABEL_40;
        }
        *((_DWORD *)this + 4) = *(_DWORD *)(*(void *)a2 + v2);
        goto LABEL_42;
      case 4u:
        *((unsigned char *)this + 32) |= 8u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2)) {
          goto LABEL_40;
        }
        *((_DWORD *)this + 5) = *(_DWORD *)(*(void *)a2 + v2);
        goto LABEL_42;
      case 5u:
        *((unsigned char *)this + 32) |= 0x10u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2)) {
          goto LABEL_40;
        }
        *((_DWORD *)this + 6) = *(_DWORD *)(*(void *)a2 + v2);
        goto LABEL_42;
      case 6u:
        *((unsigned char *)this + 32) |= 0x20u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 <= 0xFFFFFFFFFFFFFFFBLL && v2 + 4 <= *((void *)a2 + 2))
        {
          *((_DWORD *)this + 7) = *(_DWORD *)(*(void *)a2 + v2);
LABEL_42:
          unint64_t v2 = *((void *)a2 + 1) + 4;
          *((void *)a2 + 1) = v2;
        }
        else
        {
LABEL_40:
          *((unsigned char *)a2 + 24) = 1;
        }
        break;
      default:
        goto LABEL_19;
    }
LABEL_43:
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
      return v4 == 0;
    }
  }
  int v4 = 0;
  return v4 == 0;
}

uint64_t drawingV1::Transform::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  char v4 = *(unsigned char *)(this + 32);
  if (v4)
  {
    this = PB::Writer::write(a2, *(float *)(this + 8));
    char v4 = *(unsigned char *)(v3 + 32);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)(this + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  this = PB::Writer::write(a2, *(float *)(v3 + 12));
  char v4 = *(unsigned char *)(v3 + 32);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  this = PB::Writer::write(a2, *(float *)(v3 + 16));
  char v4 = *(unsigned char *)(v3 + 32);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    this = PB::Writer::write(a2, *(float *)(v3 + 24));
    if ((*(unsigned char *)(v3 + 32) & 0x20) == 0) {
      return this;
    }
    goto LABEL_13;
  }
LABEL_11:
  this = PB::Writer::write(a2, *(float *)(v3 + 20));
  char v4 = *(unsigned char *)(v3 + 32);
  if ((v4 & 0x10) != 0) {
    goto LABEL_12;
  }
LABEL_6:
  if ((v4 & 0x20) == 0) {
    return this;
  }
LABEL_13:
  float v5 = *(float *)(v3 + 28);

  return PB::Writer::write(a2, v5);
}

BOOL drawingV1::Transform::operator==(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 32))
  {
    if ((*(unsigned char *)(a2 + 32) & 1) == 0 || *(float *)(a1 + 8) != *(float *)(a2 + 8)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 32))
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 32) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 32) & 2) == 0 || *(float *)(a1 + 12) != *(float *)(a2 + 12)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 32) & 2) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 32) & 4) != 0)
  {
    if ((*(unsigned char *)(a2 + 32) & 4) == 0 || *(float *)(a1 + 16) != *(float *)(a2 + 16)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 32) & 4) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 32) & 8) != 0)
  {
    if ((*(unsigned char *)(a2 + 32) & 8) == 0 || *(float *)(a1 + 20) != *(float *)(a2 + 20)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 32) & 8) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 32) & 0x10) != 0)
  {
    if ((*(unsigned char *)(a2 + 32) & 0x10) == 0 || *(float *)(a1 + 24) != *(float *)(a2 + 24)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 32) & 0x10) != 0)
  {
    return 0;
  }
  BOOL v2 = (*(unsigned char *)(a2 + 32) & 0x20) == 0;
  if ((*(unsigned char *)(a1 + 32) & 0x20) != 0) {
    return (*(unsigned char *)(a2 + 32) & 0x20) != 0 && *(float *)(a1 + 28) == *(float *)(a2 + 28);
  }
  return v2;
}

uint64_t drawingV1::Transform::hash_value(drawingV1::Transform *this)
{
  if ((*((unsigned char *)this + 32) & 1) == 0)
  {
    uint64_t v1 = 0;
    if ((*((unsigned char *)this + 32) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_21:
    uint64_t v3 = 0;
    if ((*((unsigned char *)this + 32) & 4) != 0) {
      goto LABEL_6;
    }
LABEL_22:
    uint64_t v5 = 0;
    if ((*((unsigned char *)this + 32) & 8) != 0) {
      goto LABEL_9;
    }
LABEL_23:
    uint64_t v7 = 0;
    if ((*((unsigned char *)this + 32) & 0x10) != 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
  float v12 = *((float *)this + 2);
  uint64_t v1 = LODWORD(v12);
  if (v12 == 0.0) {
    uint64_t v1 = 0;
  }
  if ((*((unsigned char *)this + 32) & 2) == 0) {
    goto LABEL_21;
  }
LABEL_3:
  float v2 = *((float *)this + 3);
  uint64_t v3 = LODWORD(v2);
  if (v2 == 0.0) {
    uint64_t v3 = 0;
  }
  if ((*((unsigned char *)this + 32) & 4) == 0) {
    goto LABEL_22;
  }
LABEL_6:
  float v4 = *((float *)this + 4);
  uint64_t v5 = LODWORD(v4);
  if (v4 == 0.0) {
    uint64_t v5 = 0;
  }
  if ((*((unsigned char *)this + 32) & 8) == 0) {
    goto LABEL_23;
  }
LABEL_9:
  float v6 = *((float *)this + 5);
  uint64_t v7 = LODWORD(v6);
  if (v6 == 0.0) {
    uint64_t v7 = 0;
  }
  if ((*((unsigned char *)this + 32) & 0x10) != 0)
  {
LABEL_12:
    float v8 = *((float *)this + 6);
    uint64_t v9 = LODWORD(v8);
    if (v8 == 0.0) {
      uint64_t v9 = 0;
    }
    if ((*((unsigned char *)this + 32) & 0x20) != 0) {
      goto LABEL_15;
    }
LABEL_25:
    uint64_t v11 = 0;
    return v3 ^ v1 ^ v5 ^ v7 ^ v9 ^ v11;
  }
LABEL_24:
  uint64_t v9 = 0;
  if ((*((unsigned char *)this + 32) & 0x20) == 0) {
    goto LABEL_25;
  }
LABEL_15:
  float v10 = *((float *)this + 7);
  uint64_t v11 = LODWORD(v10);
  if (v10 == 0.0) {
    uint64_t v11 = 0;
  }
  return v3 ^ v1 ^ v5 ^ v7 ^ v9 ^ v11;
}

void PKNoiseSmoothingFilter::run(PKNoiseSmoothingFilter *this)
{
  int64_t v2 = (uint64_t)(*((void *)this + 7) - *((void *)this + 6)) >> 7;
  uint64_t v3 = (void *)((char *)this + 80);
  std::vector<PKInputPoint>::resize((uint64_t)this + 80, v2);
  double v4 = *((double *)this + 13) * 0.5;
  if (v4 == 0.0)
  {
    uint64_t v5 = *((void *)this + 9);
    uint64_t v6 = v2 - v5;
    if (v2 > v5)
    {
      uint64_t v7 = v5 << 7;
      do
      {
        float v8 = (long long *)(*((void *)this + 6) + v7);
        uint64_t v9 = (_OWORD *)(*((void *)this + 10) + v7);
        long long v10 = v8[7];
        long long v12 = v8[4];
        long long v11 = v8[5];
        v9[6] = v8[6];
        v9[7] = v10;
        v9[4] = v12;
        v9[5] = v11;
        long long v13 = *v8;
        long long v14 = v8[1];
        long long v15 = v8[3];
        v9[2] = v8[2];
        v9[3] = v15;
        *uint64_t v9 = v13;
        v9[1] = v14;
        v7 += 128;
        --v6;
      }
      while (v6);
    }
    *((void *)this + 9) = *((void *)this + 4);
  }
  else
  {
    uint64_t v16 = *((void *)this + 9);
    if (v16 >= v2)
    {
      uint64_t v24 = *((void *)this + 9);
    }
    else
    {
      double v17 = dbl_1C482A340[*((void *)this + 14) == 1];
      double v18 = v4 / v17;
      unint64_t v19 = vcvtpd_s64_f64(v18);
      double v20 = v17 * (double)(uint64_t)ceil(v18);
      uint64_t v21 = (2 * v19) | 1;
      if (v21 <= 1) {
        uint64_t v21 = 1;
      }
      uint64_t v22 = *((void *)this + 6);
      v23 = (float64x2_t *)MEMORY[0x1E4F1DAD8];
      uint64_t v24 = *((void *)this + 9);
      do
      {
        v25 = (long long *)(v22 + (v16 << 7));
        v26 = (_OWORD *)(*((void *)this + 10) + (v16 << 7));
        long long v27 = *v25;
        long long v28 = v25[1];
        long long v29 = v25[3];
        v26[2] = v25[2];
        v26[3] = v29;
        _OWORD *v26 = v27;
        v26[1] = v28;
        long long v30 = v25[4];
        long long v31 = v25[5];
        long long v32 = v25[7];
        v26[6] = v25[6];
        v26[7] = v32;
        v26[4] = v30;
        v26[5] = v31;
        uint64_t v22 = *((void *)this + 6);
        uint64_t v33 = *((void *)this + 9) - 1;
        if ((v19 & 0x8000000000000000) == 0)
        {
          uint64_t v34 = 0;
          float64x2_t v35 = *v23;
          uint64_t v36 = v22 + (v16 << 7);
          double v38 = *(double *)(v36 + 64);
          v37 = (double *)(v36 + 64);
          double v39 = v38;
          double v40 = v38 - v20;
          uint64_t v41 = ((*((void *)this + 7) - v22) >> 7) - 1;
          double v42 = 0.0;
          do
          {
            if (v39 == v40)
            {
              if (v33 <= v16) {
                uint64_t v33 = v16;
              }
              float64x2_t v43 = *(float64x2_t *)(v22 + (v16 << 7));
            }
            else
            {
              v44 = v37;
              uint64_t v45 = v16;
              if (v16 >= 1)
              {
                while (*v44 > v40)
                {
                  v44 -= 16;
                  if (v45-- <= 1)
                  {
                    uint64_t v45 = 0;
                    break;
                  }
                }
              }
              if (v45 <= v41) {
                uint64_t v47 = ((*((void *)this + 7) - v22) >> 7) - 1;
              }
              else {
                uint64_t v47 = v45;
              }
              v48 = (double *)(v22 + 192 + (v45 << 7));
              while (v47 != v45)
              {
                ++v45;
                double v49 = *v48;
                v48 += 16;
                if (v49 >= v40)
                {
                  uint64_t v47 = v45 - 1;
                  break;
                }
              }
              v50 = (float64x2_t *)(v22 + (v47 << 7));
              double v51 = v50[4].f64[0];
              if (v33 <= v47) {
                uint64_t v33 = v47;
              }
              if (v51 <= v40)
              {
                float64x2_t v43 = *v50;
                if (v47 != v41)
                {
                  double v52 = *(double *)(v22 + ((v47 + 1) << 7) + 64) - v51;
                  if (v33 <= v47 + 1) {
                    uint64_t v33 = v47 + 1;
                  }
                  if (v52 != 0.0) {
                    float64x2_t v43 = vaddq_f64(v43, vmulq_n_f64(vsubq_f64(*(float64x2_t *)(v22 + ((v47 + 1) << 7)), v43), (v40 - v51) / v52));
                  }
                }
              }
              else
              {
                float64x2_t v43 = *v50;
              }
            }
            double v40 = v17 + v40;
            float64x2_t v35 = vaddq_f64(v35, v43);
            double v42 = v42 + 1.0;
            ++v34;
          }
          while (v34 != v21);
          if (v42 > 0.0) {
            *(float64x2_t *)(*v3 + (v16 << 7)) = vmulq_n_f64(v35, 1.0 / v42);
          }
        }
        if (*((unsigned char *)this + 16) || v33 < *((void *)this + 4) - 1) {
          uint64_t v24 = ++v16;
        }
        else {
          ++v16;
        }
      }
      while (v16 != v2);
    }
    *((void *)this + 9) = v24;
  }
}

void PKNoiseSmoothingFilter::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  PKInputBaseFilter<PKInputPoint,PKInputPoint>::drawingBeganWithInk(a1, a2, a3, a4);
  *(void *)(a1 + 112) = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  float v8 = [v7 objectForKey:@"internalSettings.pathSmoothing.timeInterval"];
  PKDynamicCast(v6, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = v11;
  if (v11)
  {
    [v11 doubleValue];
    *(void *)(a1 + 104) = v10;
    uint64_t v9 = v11;
  }
}

void sub_1C468D9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t PKInputBaseFilter<PKInputPoint,PKInputPoint>::drawingEnded(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  *(unsigned char *)(a1 + 16) = 1;
  return result;
}

void PKInputProvider<PKInputPoint>::getUpdatedRangeFromIndex()
{
}

uint64_t PKInputBufferedFilter<PKInputPoint,PKInputPoint>::copyUpdatedRangeFromIndex(void *a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void *))(*a1 + 40))(a1);
  uint64_t v6 = (*(uint64_t (**)(void *))(*a1 + 48))(a1);
  std::vector<PKInputPoint>::__insert_with_size[abi:ne180100]<std::__wrap_iter<PKInputPoint*>,std::__wrap_iter<PKInputPoint*>>(a3, *(void *)(a3 + 8), (char *)(*(void *)v6 + (a2 << 7)), *(char **)(v6 + 8), (*(void *)(v6 + 8) - (*(void *)v6 + (a2 << 7))) >> 7);
  return a1[9];
}

void *PKInputFilter<PKInputPoint,PKInputPoint>::reset(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
  }
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 56) = *(void *)(a1 + 48);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1);
  result[1] = *result;
  return result;
}

uint64_t PKInputBufferedFilter<PKInputPoint,PKInputPoint>::fetchInput(uint64_t a1)
{
  uint64_t v2 = a1 + 48;
  std::vector<PKInputPoint>::resize(a1 + 48, *(void *)(a1 + 32));
  *(void *)(a1 + 32) = (*(uint64_t (**)(void, void, uint64_t))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8), *(void *)(a1 + 32), v2);
  uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 56);

  return v3(a1);
}

uint64_t PKInputFilter<PKInputPoint,PKInputPoint>::outputVector(uint64_t a1)
{
  return a1 + 80;
}

uint64_t PKInputFilter<PKInputPoint,PKInputPoint>::complete()
{
  return 0;
}

void PKInputBaseFilter<PKInputPoint,PKInputPoint>::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v8 = a2;
  uint64_t v7 = *(void (****)(void, id, uint64_t, double))(a1 + 8);
  if (v7) {
    (**v7)(v7, v8, a3, a4);
  }
  *(double *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 16) = 0;
}

void sub_1C468DD34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

char *std::vector<PKInputPoint>::__insert_with_size[abi:ne180100]<std::__wrap_iter<PKInputPoint*>,std::__wrap_iter<PKInputPoint*>>(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  uint64_t v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 7)
  {
    long long v13 = *(void **)a1;
    unint64_t v14 = a5 + ((uint64_t)(v12 - *(void *)a1) >> 7);
    if (v14 >> 57) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = (__dst - (uint64_t)v13) >> 7;
    uint64_t v16 = v10 - (void)v13;
    if (v16 >> 6 > v14) {
      unint64_t v14 = v16 >> 6;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFF80) {
      unint64_t v17 = 0x1FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v14;
    }
    uint64_t v47 = v9;
    if (v17) {
      double v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>(v9, v17);
    }
    else {
      double v18 = 0;
    }
    uint64_t v33 = &v18[128 * v15];
    __p = v18;
    v44 = v33;
    v46 = &v18[128 * v17];
    uint64_t v34 = a5 << 7;
    float64x2_t v35 = &v33[128 * a5];
    do
    {
      long long v36 = *(_OWORD *)v7;
      long long v37 = *((_OWORD *)v7 + 1);
      long long v38 = *((_OWORD *)v7 + 3);
      *((_OWORD *)v33 + 2) = *((_OWORD *)v7 + 2);
      *((_OWORD *)v33 + 3) = v38;
      *(_OWORD *)uint64_t v33 = v36;
      *((_OWORD *)v33 + 1) = v37;
      long long v39 = *((_OWORD *)v7 + 4);
      long long v40 = *((_OWORD *)v7 + 5);
      long long v41 = *((_OWORD *)v7 + 7);
      *((_OWORD *)v33 + 6) = *((_OWORD *)v7 + 6);
      *((_OWORD *)v33 + 7) = v41;
      *((_OWORD *)v33 + 4) = v39;
      *((_OWORD *)v33 + 5) = v40;
      v33 += 128;
      v7 += 128;
      v34 -= 128;
    }
    while (v34);
    uint64_t v45 = v35;
    uint64_t v5 = (char *)std::vector<PKInputPoint>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v45 != v44) {
      v45 += (v44 - v45 + 127) & 0xFFFFFFFFFFFFFF80;
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  uint64_t v19 = v12 - __dst;
  uint64_t v20 = (uint64_t)(v12 - __dst) >> 7;
  if (v20 >= a5)
  {
    uint64_t v21 = &__src[128 * a5];
    v23 = *(char **)(v9 - 8);
LABEL_17:
    uint64_t v24 = &v5[128 * a5];
    v25 = &v23[-128 * a5];
    v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      v26 = v23;
      do
      {
        long long v27 = *(_OWORD *)v25;
        long long v28 = *((_OWORD *)v25 + 1);
        long long v29 = *((_OWORD *)v25 + 3);
        *((_OWORD *)v26 + 2) = *((_OWORD *)v25 + 2);
        *((_OWORD *)v26 + 3) = v29;
        *(_OWORD *)v26 = v27;
        *((_OWORD *)v26 + 1) = v28;
        long long v30 = *((_OWORD *)v25 + 4);
        long long v31 = *((_OWORD *)v25 + 5);
        long long v32 = *((_OWORD *)v25 + 7);
        *((_OWORD *)v26 + 6) = *((_OWORD *)v25 + 6);
        *((_OWORD *)v26 + 7) = v32;
        *((_OWORD *)v26 + 4) = v30;
        *((_OWORD *)v26 + 5) = v31;
        v25 += 128;
        v26 += 128;
      }
      while ((unint64_t)v25 < v12);
    }
    *(void *)(a1 + 8) = v26;
    if (v23 != v24) {
      memmove(&v23[-128 * ((v23 - v24) >> 7)], v5, v23 - v24);
    }
    if (v21 != v7) {
      memmove(v5, v7, v21 - v7);
    }
    return v5;
  }
  uint64_t v21 = &__src[128 * v20];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[128 * v20], a4 - v21);
  }
  v23 = (char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v19 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_1C468DF60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<PKInputPoint>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  uint64_t v5 = *(void **)(a2 + 8);
  uint64_t v6 = (char *)*a1;
  uint64_t v7 = v5;
  if (*a1 != __src)
  {
    id v8 = __src;
    uint64_t v9 = *(void *)(a2 + 8);
    do
    {
      long long v10 = *((_OWORD *)v8 - 8);
      long long v11 = *((_OWORD *)v8 - 7);
      long long v12 = *((_OWORD *)v8 - 5);
      *(_OWORD *)(v9 - 96) = *((_OWORD *)v8 - 6);
      *(_OWORD *)(v9 - 80) = v12;
      *(_OWORD *)(v9 - 128) = v10;
      *(_OWORD *)(v9 - 112) = v11;
      long long v13 = *((_OWORD *)v8 - 4);
      long long v14 = *((_OWORD *)v8 - 3);
      long long v15 = *((_OWORD *)v8 - 1);
      uint64_t v7 = (void *)(v9 - 128);
      *(_OWORD *)(v9 - 32) = *((_OWORD *)v8 - 2);
      *(_OWORD *)(v9 - 16) = v15;
      *(_OWORD *)(v9 - 64) = v13;
      *(_OWORD *)(v9 - 48) = v14;
      v8 -= 128;
      v9 -= 128;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  uint64_t v16 = a1[1];
  uint64_t v17 = *(void *)(a2 + 16);
  int64_t v18 = v16 - __src;
  if (v16 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v16 - __src);
    uint64_t v7 = *(void **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v17 + v18;
  uint64_t v19 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v19;
  uint64_t v20 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v20;
  uint64_t v21 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v21;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void sub_1C468F390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C469049C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46906A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46908B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C46909B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46913B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void **a26)
{
  a26 = (void **)(v26 - 256);
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a26);
  long long v28 = *(void **)(v26 - 232);
  if (v28)
  {
    *(void *)(v26 - 224) = v28;
    operator delete(v28);
  }
  _Unwind_Resume(a1);
}

float SegmentMix(IntPoint *a1, IntPoint *a2, IntPoint *a3, float a4, float a5)
{
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)a1 - *(void *)a2;
  if (v6 >= 0) {
    unint64_t v7 = *(void *)a1 - *(void *)a2;
  }
  else {
    unint64_t v7 = *(void *)a2 - *(void *)a1;
  }
  if ((uint64_t)(*((void *)a1 + 1) - *((void *)a2 + 1)) >= 0) {
    unint64_t v8 = *((void *)a1 + 1) - *((void *)a2 + 1);
  }
  else {
    unint64_t v8 = *((void *)a2 + 1) - *((void *)a1 + 1);
  }
  if (v7 > v8)
  {
    uint64_t v9 = a3;
  }
  else
  {
    uint64_t v5 = *((void *)a2 + 1);
    uint64_t v6 = *((void *)a1 + 1) - v5;
    uint64_t v9 = (IntPoint *)((char *)a3 + 8);
  }
  double v10 = (float)((float)(*(void *)v9 - v5) / (float)v6);
  return (1.0 - v10) * *((float *)a2 + 4) + *((float *)a1 + 4) * v10;
}

void ZFillCallback(IntPoint *a1, IntPoint *a2, IntPoint *a3, IntPoint *a4, IntPoint *a5, double a6, float a7)
{
  if (*((float *)a5 + 4) < 0.0)
  {
    float v10 = *((float *)a1 + 4);
    if (v10 >= 0.0)
    {
      *((float *)a5 + 4) = SegmentMix(a1, a2, a5, v10, a7);
    }
    else if (*((float *)a1 + 5) >= 0.0)
    {
      *((_DWORD *)a5 + 5) = 1065353216;
    }
    if (*((float *)a3 + 5) >= 0.0)
    {
      *((_DWORD *)a5 + 5) = 1065353216;
    }
    else
    {
      float v11 = *((float *)a3 + 4);
      if (v11 >= 0.0) {
        *((float *)a5 + 4) = SegmentMix(a3, a4, a5, v11, a7);
      }
    }
  }
}

void sub_1C4691790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C4691928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4691B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__18(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void sub_1C4691DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46921CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1C4692488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  ClipperLib::PolyTree::~PolyTree((ClipperLib::PolyTree *)&a9);
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a22);
  uint64_t v24 = *(void **)(v22 - 56);
  if (v24)
  {
    *(void *)(v22 - 48) = v24;
    operator delete(v24);
  }
  _Unwind_Resume(a1);
}

void sub_1C46925C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void generateRectClipperPath(float64x2_t *a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  std::vector<ClipperLib::IntPoint>::reserve((void **)a2, 4uLL);
  float64x2_t v12 = a1[1];
  *(float64x2_t *)&t1.a = *a1;
  *(float64x2_t *)&t1.c = v12;
  *(float64x2_t *)&t1.tx = a1[2];
  CGAffineTransformMakeScale(&t2, 100.0, 100.0);
  CGAffineTransformConcat(&v104, &t1, &t2);
  float64x2_t v13 = *(float64x2_t *)&v104.c;
  *a1 = *(float64x2_t *)&v104.a;
  a1[1] = v13;
  a1[2] = *(float64x2_t *)&v104.tx;
  CGFloat v14 = a3;
  v13.f64[0] = a4;
  CGFloat v15 = a5;
  CGFloat v16 = a6;
  double MinX = CGRectGetMinX(*(CGRect *)((char *)&v13 - 8));
  v105.origin.x = a3;
  v105.origin.y = a4;
  v105.size.width = a5;
  v105.size.height = a6;
  CGFloat MinY = CGRectGetMinY(v105);
  float64_t v19 = a1[2].f64[0] + MinY * a1[1].f64[0] + a1->f64[0] * MinX;
  float64_t v20 = a1[2].f64[1] + MinY * a1[1].f64[1] + a1->f64[1] * MinX;
  v106.origin.x = a3;
  v106.origin.y = a4;
  v106.size.width = a5;
  v106.size.height = a6;
  double MaxX = CGRectGetMaxX(v106);
  v107.origin.x = a3;
  v107.origin.y = a4;
  v107.size.width = a5;
  v107.size.height = a6;
  CGFloat v100 = CGRectGetMinY(v107);
  double v22 = a1->f64[1];
  double v99 = a1[1].f64[1];
  double v95 = a1->f64[0];
  double v96 = a1[2].f64[0];
  double v97 = a1[1].f64[0];
  double v98 = a1[2].f64[1];
  v108.origin.x = a3;
  v108.origin.y = a4;
  v108.size.width = a5;
  v108.size.height = a6;
  double v94 = CGRectGetMaxX(v108);
  v109.origin.x = a3;
  v109.origin.y = a4;
  v109.size.width = a5;
  v109.size.height = a6;
  double MaxY = CGRectGetMaxY(v109);
  double v92 = a1->f64[0];
  double v93 = a1->f64[1];
  double v88 = a1[2].f64[0];
  double v89 = a1[1].f64[0];
  double v90 = a1[2].f64[1];
  double v91 = a1[1].f64[1];
  v110.origin.x = a3;
  v110.origin.y = a4;
  v110.size.width = a5;
  v110.size.height = a6;
  double v86 = CGRectGetMinX(v110);
  v111.origin.x = a3;
  v111.origin.y = a4;
  v111.size.width = a5;
  v111.size.height = a6;
  double v83 = CGRectGetMaxY(v111);
  float64x2_t v23 = *a1;
  float64x2_t v82 = a1[1];
  float64x2_t v24 = a1[2];
  uint64_t v25 = (int)v19;
  uint64_t v26 = (int)v20;
  long long v28 = (char **)(a2 + 16);
  uint64_t v27 = *(char **)(a2 + 16);
  long long v29 = *(char **)(a2 + 8);
  float64x2_t v84 = v24;
  float64x2_t v85 = v23;
  if (v29 >= v27)
  {
    long long v38 = *(char **)a2;
    unint64_t v39 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v29[-*(void *)a2] >> 3);
    unint64_t v40 = v39 + 1;
    if (v39 + 1 > 0xAAAAAAAAAAAAAAALL) {
      goto LABEL_66;
    }
    unint64_t v41 = 0xAAAAAAAAAAAAAAABLL * ((v27 - v38) >> 3);
    if (2 * v41 > v40) {
      unint64_t v40 = 2 * v41;
    }
    if (v41 >= 0x555555555555555) {
      unint64_t v42 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v42 = v40;
    }
    double v31 = v22;
    double v33 = v99;
    double v32 = v100;
    double v37 = v97;
    double v36 = v98;
    double v35 = v96;
    if (v42)
    {
      float64x2_t v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(a2 + 16, v42);
      long long v38 = *(char **)a2;
      long long v29 = *(char **)(a2 + 8);
    }
    else
    {
      float64x2_t v43 = 0;
    }
    double v34 = v95;
    v44 = &v43[24 * v39];
    uint64_t v27 = &v43[24 * v42];
    *(void *)v44 = v25;
    *((void *)v44 + 1) = v26;
    *((void *)v44 + 2) = 0xBF80000000000000;
    long long v30 = v44 + 24;
    if (v29 != v38)
    {
      do
      {
        long long v45 = *(_OWORD *)(v29 - 24);
        *((void *)v44 - 1) = *((void *)v29 - 1);
        *(_OWORD *)(v44 - 24) = v45;
        v44 -= 24;
        v29 -= 24;
      }
      while (v29 != v38);
      long long v38 = *(char **)a2;
    }
    *(void *)a2 = v44;
    *(void *)(a2 + 8) = v30;
    *(void *)(a2 + 16) = v27;
    if (v38)
    {
      operator delete(v38);
      uint64_t v27 = *v28;
    }
  }
  else
  {
    *(void *)long long v29 = v25;
    *((void *)v29 + 1) = v26;
    *((void *)v29 + 2) = 0xBF80000000000000;
    long long v30 = v29 + 24;
    double v31 = v22;
    double v33 = v99;
    double v32 = v100;
    double v34 = v95;
    double v35 = v96;
    double v37 = v97;
    double v36 = v98;
  }
  *(void *)(a2 + 8) = v30;
  uint64_t v46 = (int)(v35 + v32 * v37 + v34 * MaxX);
  uint64_t v47 = (int)(v36 + v32 * v33 + v31 * MaxX);
  if (v30 >= v27)
  {
    double v49 = *(char **)a2;
    unint64_t v50 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v30[-*(void *)a2] >> 3);
    unint64_t v51 = v50 + 1;
    if (v50 + 1 > 0xAAAAAAAAAAAAAAALL) {
      goto LABEL_66;
    }
    unint64_t v52 = 0xAAAAAAAAAAAAAAABLL * ((v27 - v49) >> 3);
    if (2 * v52 > v51) {
      unint64_t v51 = 2 * v52;
    }
    if (v52 >= 0x555555555555555) {
      unint64_t v53 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v53 = v51;
    }
    if (v53)
    {
      v54 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(a2 + 16, v53);
      double v49 = *(char **)a2;
      long long v30 = *(char **)(a2 + 8);
    }
    else
    {
      v54 = 0;
    }
    v55 = &v54[24 * v50];
    uint64_t v27 = &v54[24 * v53];
    *(void *)v55 = v46;
    *((void *)v55 + 1) = v47;
    *((void *)v55 + 2) = 0xBF8000003F800000;
    v48 = v55 + 24;
    if (v30 != v49)
    {
      do
      {
        long long v56 = *(_OWORD *)(v30 - 24);
        *((void *)v55 - 1) = *((void *)v30 - 1);
        *(_OWORD *)(v55 - 24) = v56;
        v55 -= 24;
        v30 -= 24;
      }
      while (v30 != v49);
      double v49 = *(char **)a2;
    }
    *(void *)a2 = v55;
    *(void *)(a2 + 8) = v48;
    *(void *)(a2 + 16) = v27;
    if (v49)
    {
      operator delete(v49);
      uint64_t v27 = *v28;
    }
  }
  else
  {
    *(void *)long long v30 = v46;
    *((void *)v30 + 1) = v47;
    *((void *)v30 + 2) = 0xBF8000003F800000;
    v48 = v30 + 24;
  }
  *(void *)(a2 + 8) = v48;
  uint64_t v57 = (int)(v88 + MaxY * v89 + v92 * v94);
  uint64_t v58 = (int)(v90 + MaxY * v91 + v93 * v94);
  if (v48 >= v27)
  {
    v60 = *(char **)a2;
    unint64_t v61 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v48[-*(void *)a2] >> 3);
    unint64_t v62 = v61 + 1;
    if (v61 + 1 > 0xAAAAAAAAAAAAAAALL) {
      goto LABEL_66;
    }
    unint64_t v63 = 0xAAAAAAAAAAAAAAABLL * ((v27 - v60) >> 3);
    if (2 * v63 > v62) {
      unint64_t v62 = 2 * v63;
    }
    if (v63 >= 0x555555555555555) {
      unint64_t v64 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v64 = v62;
    }
    if (v64)
    {
      v65 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(a2 + 16, v64);
      v60 = *(char **)a2;
      v48 = *(char **)(a2 + 8);
    }
    else
    {
      v65 = 0;
    }
    v66 = &v65[24 * v61];
    uint64_t v27 = &v65[24 * v64];
    *(void *)v66 = v57;
    *((void *)v66 + 1) = v58;
    *((void *)v66 + 2) = 0xBF80000040000000;
    v59 = v66 + 24;
    if (v48 != v60)
    {
      do
      {
        long long v67 = *(_OWORD *)(v48 - 24);
        *((void *)v66 - 1) = *((void *)v48 - 1);
        *(_OWORD *)(v66 - 24) = v67;
        v66 -= 24;
        v48 -= 24;
      }
      while (v48 != v60);
      v60 = *(char **)a2;
    }
    *(void *)a2 = v66;
    *(void *)(a2 + 8) = v59;
    *(void *)(a2 + 16) = v27;
    if (v60)
    {
      operator delete(v60);
      uint64_t v27 = *v28;
    }
  }
  else
  {
    *(void *)v48 = v57;
    *((void *)v48 + 1) = v58;
    *((void *)v48 + 2) = 0xBF80000040000000;
    v59 = v48 + 24;
  }
  *(void *)(a2 + 8) = v59;
  int32x2_t v68 = vmovn_s64(vcvtq_s64_f64(vaddq_f64(v84, vmlaq_n_f64(vmulq_n_f64(v82, v83), v85, v86))));
  *(void *)&long long v69 = v68.i32[0];
  *((void *)&v69 + 1) = v68.i32[1];
  long long v70 = v69;
  if (v59 < v27)
  {
    *(_OWORD *)v59 = v70;
    *((void *)v59 + 2) = 0xBF80000040400000;
    v71 = v59 + 24;
    goto LABEL_65;
  }
  v72 = *(unsigned char **)a2;
  unint64_t v73 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v59[-*(void *)a2] >> 3);
  unint64_t v74 = v73 + 1;
  if (v73 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_66:
  }
    std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
  unint64_t v75 = 0xAAAAAAAAAAAAAAABLL * ((v27 - v72) >> 3);
  if (2 * v75 > v74) {
    unint64_t v74 = 2 * v75;
  }
  if (v75 >= 0x555555555555555) {
    unint64_t v76 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v76 = v74;
  }
  if (v76)
  {
    long long v101 = v70;
    v77 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(a2 + 16, v76);
    long long v70 = v101;
    v78 = v77;
    v72 = *(unsigned char **)a2;
    v59 = *(char **)(a2 + 8);
  }
  else
  {
    v78 = 0;
  }
  v79 = &v78[24 * v73];
  v80 = &v78[24 * v76];
  *(_OWORD *)v79 = v70;
  *((void *)v79 + 2) = 0xBF80000040400000;
  v71 = v79 + 24;
  if (v59 != v72)
  {
    do
    {
      long long v81 = *(_OWORD *)(v59 - 24);
      *((void *)v79 - 1) = *((void *)v59 - 1);
      *(_OWORD *)(v79 - 24) = v81;
      v79 -= 24;
      v59 -= 24;
    }
    while (v59 != v72);
    v72 = *(unsigned char **)a2;
  }
  *(void *)a2 = v79;
  *(void *)(a2 + 8) = v71;
  *(void *)(a2 + 16) = v80;
  if (v72) {
    operator delete(v72);
  }
LABEL_65:
  *(void *)(a2 + 8) = v71;
}

void sub_1C4692FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1C4693120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C4693220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1C469327C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4693424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4693488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46934CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4693788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, char a17)
{
}

void sub_1C4693898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C469398C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4694708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, ClipperLib::ClipperBase *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  STACK[0x320] = (unint64_t)&a66;
  std::vector<std::vector<ClipperLib::PolyNode *>>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x320]);
  ClipperLib::PolyTree::~PolyTree((ClipperLib::PolyTree *)&a69);
  a69 = (uint64_t)&STACK[0x248];
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a69);
  long long v70 = off_1F1FAF880;
  *(unint64_t *)((char *)&STACK[0x380] + (void)*(v71 - 3)) = (unint64_t)v70;
  std::__list_imp<long long>::clear(a9);
  v72 = (void *)STACK[0x3B8];
  if (STACK[0x3B8])
  {
    STACK[0x3C0] = (unint64_t)v72;
    operator delete(v72);
  }
  unint64_t v73 = (void *)STACK[0x3A0];
  if (STACK[0x3A0])
  {
    STACK[0x3A8] = (unint64_t)v73;
    operator delete(v73);
  }
  unint64_t v74 = (void *)STACK[0x388];
  if (STACK[0x388])
  {
    STACK[0x390] = (unint64_t)v74;
    operator delete(v74);
  }
  ClipperLib::ClipperBase::~ClipperBase(a10);

  _Unwind_Resume(a1);
}

void sub_1C4694A3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4694C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1C4694EA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4695214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *__p,uint64_t a36)
{
  unint64_t v41 = v38;

  _Block_object_dispose(&a29, 8);
  if (__p)
  {
    a36 = (uint64_t)__p;
    operator delete(__p);
  }
  _Block_object_dispose((const void *)(v40 - 152), 8);
  float64x2_t v43 = *(void **)(v40 - 104);
  if (v43)
  {
    *(void *)(v40 - 96) = v43;
    operator delete(v43);
  }

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__7(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_1C4695AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19)
{
  _Unwind_Resume(a1);
}

void sub_1C4695D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a29);
  _Unwind_Resume(a1);
}

void sub_1C4696504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_1C46968E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *__p,uint64_t a42,uint64_t a43,char a44)
{
  *(void *)(v46 - 72) = v45;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v46 - 72));
  _Block_object_dispose(&a35, 8);
  if (__p)
  {
    a42 = (uint64_t)__p;
    operator delete(__p);
  }
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a44);

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__15(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_1C4696DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,char a38)
{
  *(void *)(v39 - 88) = v38;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v39 - 88));
  if (__p) {
    operator delete(__p);
  }
  if (a35) {
    operator delete(a35);
  }
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a38);
  _Unwind_Resume(a1);
}

void sub_1C4697EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  STACK[0x320] = v72;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x320]);

  _Block_object_dispose(&a47, 8);
  STACK[0x320] = a28;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x320]);
  _Block_object_dispose(&a57, 8);
  a47 = v71;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&a47);
  a57 = &a67;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&a57);
  a47 = (uint64_t)&a70;
  std::vector<Bucket>::__destroy_vector::operator()[abi:ne180100]((void ***)&a47);

  _Block_object_dispose(&STACK[0x2C0], 8);
  a47 = a10;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&a47);
  unint64_t v74 = (void *)STACK[0x308];
  if (STACK[0x308])
  {
    STACK[0x310] = (unint64_t)v74;
    operator delete(v74);
  }

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__75(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__76(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 48);
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void sub_1C4698230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id std::vector<PKStroke * {__strong}>::push_back[abi:ne180100](void *a1, id *a2)
{
  double v4 = a1 + 2;
  unint64_t v5 = a1[2];
  uint64_t v6 = (void *)a1[1];
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v9 = ((uint64_t)v6 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - *a1;
    uint64_t v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    float64x2_t v24 = v4;
    if (v12) {
      unint64_t v12 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<legacy_drawing::Command>>>(v12);
    }
    else {
      uint64_t v13 = 0;
    }
    CGFloat v14 = (void *)(v12 + 8 * v9);
    unint64_t v15 = v12 + 8 * v13;
    unint64_t v23 = v15;
    *CGFloat v14 = *a2;
    unint64_t v8 = v14 + 1;
    v22.i64[1] = (uint64_t)(v14 + 1);
    uint64_t v17 = (void *)*a1;
    CGFloat v16 = (void *)a1[1];
    if (v16 == (void *)*a1)
    {
      int64x2_t v19 = vdupq_n_s64((unint64_t)v16);
    }
    else
    {
      do
      {
        uint64_t v18 = *--v16;
        *CGFloat v16 = 0;
        *--CGFloat v14 = v18;
      }
      while (v16 != v17);
      int64x2_t v19 = *(int64x2_t *)a1;
      unint64_t v8 = (void *)v22.i64[1];
      unint64_t v15 = v23;
    }
    *a1 = v14;
    a1[1] = v8;
    int64x2_t v22 = v19;
    unint64_t v20 = a1[2];
    a1[2] = v15;
    unint64_t v23 = v20;
    uint64_t v21 = v19.i64[0];
    id result = (id)std::__split_buffer<PKStroke * {__strong}>::~__split_buffer((uint64_t)&v21);
  }
  else
  {
    id result = *a2;
    *uint64_t v6 = result;
    unint64_t v8 = v6 + 1;
  }
  a1[1] = v8;
  return result;
}

__n128 __Block_byref_object_copy__82(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__83(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 48);
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void sub_1C469855C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *__copy_helper_block_ea8_40c71_ZTSNSt3__16vectorIU8__strongP7NSArrayIP8PKStrokeENS_9allocatorIS6_EEEE(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  uint64_t v2 = a1 + 40;
  *(void *)(v2 + 16) = 0;
  return std::vector<NSArray<PKStroke *> * {__strong},std::allocator<NSArray<PKStroke *> * {__strong}>>::__init_with_size[abi:ne180100]<NSArray<PKStroke *> * {__strong}*,NSArray<PKStroke *> * {__strong}*>((char *)v2, *(void ***)(a2 + 40), *(void ***)(a2 + 48), (uint64_t)(*(void *)(a2 + 48) - *(void *)(a2 + 40)) >> 3);
}

void __destroy_helper_block_ea8_40c71_ZTSNSt3__16vectorIU8__strongP7NSArrayIP8PKStrokeENS_9allocatorIS6_EEEE(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 40);
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void sub_1C4698678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C4698790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1C4698C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *__p,uint64_t a52)
{
  _Block_object_dispose(&a36, 8);
  *(void *)(v54 - 248) = a10;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)(v54 - 248));
  _Block_object_dispose(&a45, 8);
  if (__p)
  {
    a52 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__90(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__91(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_1C4698F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void sub_1C46991CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *std::vector<std::vector<ClipperLib::IntPoint>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::vector<ClipperLib::IntPoint>*>,std::__wrap_iter<std::vector<ClipperLib::IntPoint>*>>(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5 >= 1)
  {
    uint64_t v6 = a3;
    unint64_t v7 = result;
    uint64_t v8 = *result;
    uint64_t v9 = (a2 - *result) / 24;
    uint64_t v10 = *result + 24 * v9;
    uint64_t v12 = (uint64_t)(result + 2);
    uint64_t v11 = result[2];
    uint64_t v13 = (uint64_t *)result[1];
    if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((v11 - (uint64_t)v13) >> 3)) >= a5)
    {
      if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)v13 - v10) >> 3)) >= a5)
      {
        uint64_t v18 = a3 + 24 * a5;
        __n128 result = (uint64_t *)result[1];
      }
      else
      {
        uint64_t v18 = a3 + 8 * (((uint64_t)v13 - v10) >> 3);
        __n128 result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*>((uint64_t)(result + 2), v18, a4, v13);
        v7[1] = (uint64_t)result;
        if ((uint64_t)v13 - v10 < 1) {
          return result;
        }
      }
      int64x2_t v19 = (void *)(v10 + 24 * a5);
      unint64_t v20 = &result[-3 * a5];
      uint64_t v21 = result;
      if (v20 < v13)
      {
        uint64_t v21 = result;
        do
        {
          *uint64_t v21 = 0;
          v21[1] = 0;
          v21[2] = 0;
          *(_OWORD *)uint64_t v21 = *(_OWORD *)v20;
          v21[2] = v20[2];
          *unint64_t v20 = 0;
          v20[1] = 0;
          v20[2] = 0;
          v21 += 3;
          v20 += 3;
        }
        while (v20 < v13);
      }
      v7[1] = (uint64_t)v21;
      if (result != v19)
      {
        uint64_t v22 = (uint64_t)(result - 3);
        uint64_t v23 = 8 * (result - v19);
        do
        {
          std::vector<ClipperLib::IntPoint>::__move_assign(v22, (__n128 *)(v8 + 24 * v9 - 24 + v23));
          v22 -= 24;
          v23 -= 24;
        }
        while (v23);
      }
      return (uint64_t *)std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<ClipperLib::IntPoint> *,std::vector<ClipperLib::IntPoint> *,std::vector<ClipperLib::IntPoint> *>((int)&v34, v6, v18, (char *)v10);
    }
    else
    {
      unint64_t v14 = a5 - 0x5555555555555555 * (((uint64_t)v13 - v8) >> 3);
      if (v14 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((v11 - v8) >> 3);
      if (2 * v15 > v14) {
        unint64_t v14 = 2 * v15;
      }
      if (v15 >= 0x555555555555555) {
        unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v16 = v14;
      }
      double v37 = result + 2;
      if (v16) {
        uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)(result + 2), v16);
      }
      else {
        uint64_t v17 = 0;
      }
      float64x2_t v24 = &v17[24 * v9];
      double v34 = v17;
      *(void *)&long long v35 = v24;
      *((void *)&v35 + 1) = v24;
      double v36 = &v17[24 * v16];
      uint64_t v25 = 3 * a5;
      uint64_t v26 = &v24[24 * a5];
      uint64_t v27 = 8 * v25;
      do
      {
        *(void *)float64x2_t v24 = 0;
        *((void *)v24 + 1) = 0;
        *((void *)v24 + 2) = 0;
        std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v24, *(const void **)v6, *(void *)(v6 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v6 + 8) - *(void *)v6) >> 3));
        v24 += 24;
        v6 += 24;
        v27 -= 24;
      }
      while (v27);
      *((void *)&v35 + 1) = v26;
      std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>(v12, v10, (void *)v10, *v7, (void *)*v7, v35, v35);
      *(void *)&long long v35 = v28;
      uint64_t v29 = v7[1];
      long long v30 = v26;
      uint64_t v40 = v26;
      unint64_t v41 = v26;
      v38[0] = v12;
      v38[1] = &v40;
      v38[2] = &v41;
      if (v29 != v10)
      {
        do
        {
          *(void *)long long v30 = 0;
          *((void *)v30 + 1) = 0;
          *((void *)v30 + 2) = 0;
          *(_OWORD *)long long v30 = *(_OWORD *)v10;
          *((void *)v30 + 2) = *(void *)(v10 + 16);
          *(void *)uint64_t v10 = 0;
          *(void *)(v10 + 8) = 0;
          *(void *)(v10 + 16) = 0;
          v30 += 24;
          v10 += 24;
        }
        while (v10 != v29);
        unint64_t v41 = v30;
      }
      char v39 = 1;
      std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v38);
      long long v31 = *(_OWORD *)v7;
      uint64_t v32 = (uint64_t)v36;
      *unint64_t v7 = v35;
      v7[1] = (uint64_t)v30;
      long long v35 = v31;
      uint64_t v33 = v7[2];
      v7[2] = v32;
      double v36 = (char *)v33;
      double v34 = (char *)v31;
      return (uint64_t *)std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)&v34);
    }
  }
  return result;
}

void sub_1C4699530(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
  *(void *)(v12 + 8) = v13;
  _Unwind_Resume(exception_object);
}

void ClipperLib::PolyTree::~PolyTree(ClipperLib::PolyTree *this)
{
  ClipperLib::PolyTree::~PolyTree(this);

  JUMPOUT(0x1C8783F10);
}

{
  void *v2;
  uint64_t vars8;

  *(void *)this = &unk_1F1FB0448;
  ClipperLib::PolyTree::Clear(this);
  uint64_t v2 = (void *)*((void *)this + 10);
  if (v2)
  {
    *((void *)this + 11) = v2;
    operator delete(v2);
  }

  ClipperLib::PolyNode::~PolyNode(this);
}

void std::vector<std::vector<ClipperLib::PolyNode *>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    double v4 = (char *)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      uint64_t v6 = (char *)v1[1];
      do
      {
        uint64_t v8 = (void *)*((void *)v6 - 3);
        v6 -= 24;
        unint64_t v7 = v8;
        if (v8)
        {
          *((void *)v4 - 2) = v7;
          operator delete(v7);
        }
        double v4 = v6;
      }
      while (v6 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<ClipperLib::PolyNode *>::__insert_with_size[abi:ne180100]<std::__wrap_iter<ClipperLib::PolyNode **>,std::__wrap_iter<ClipperLib::PolyNode **>>(void **a1, uint64_t a2, char *__src, char *a4, uint64_t a5)
{
  if (a5 < 1) {
    return;
  }
  uint64_t v6 = __src;
  uint64_t v8 = (char *)*a1;
  uint64_t v9 = a2 - (void)*a1;
  uint64_t v10 = (char *)*a1 + (v9 & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = a1[2];
  uint64_t v11 = (uint64_t)(a1 + 2);
  uint64_t v12 = v13;
  unint64_t v14 = *(void *)(v11 - 8);
  if (a5 > (uint64_t)&v13[-v14] >> 3)
  {
    unint64_t v15 = a5 + ((uint64_t)(v14 - (void)v8) >> 3);
    if (v15 >> 61) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v16 = v9 >> 3;
    uint64_t v17 = v12 - v8;
    uint64_t v18 = v17 >> 2;
    if (v17 >> 2 <= v15) {
      uint64_t v18 = v15;
    }
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v19 = v18;
    }
    if (v19) {
      unint64_t v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v11, v19);
    }
    else {
      unint64_t v20 = 0;
    }
    uint64_t v29 = &v20[8 * v16];
    long long v30 = &v29[8 * a5];
    uint64_t v31 = 8 * a5;
    uint64_t v32 = v29;
    do
    {
      uint64_t v33 = *(void *)v6;
      v6 += 8;
      *(void *)uint64_t v32 = v33;
      v32 += 8;
      v31 -= 8;
    }
    while (v31);
    double v34 = (char *)*a1;
    if (*a1 != v10)
    {
      long long v35 = v10;
      do
      {
        uint64_t v36 = *((void *)v35 - 1);
        v35 -= 8;
        *((void *)v29 - 1) = v36;
        v29 -= 8;
      }
      while (v35 != v34);
    }
    double v37 = &v20[8 * v19];
    uint64_t v38 = a1[1];
    uint64_t v39 = v38 - v10;
    if (v38 != v10) {
      memmove(v30, v10, v38 - v10);
    }
    uint64_t v40 = *a1;
    *a1 = v29;
    a1[1] = &v30[v39];
    a1[2] = v37;
    if (v40)
    {
      operator delete(v40);
    }
    return;
  }
  uint64_t v21 = (uint64_t)(v14 - (void)v10) >> 3;
  if (v21 >= a5)
  {
    uint64_t v22 = &__src[8 * a5];
    float64x2_t v24 = *(char **)(v11 - 8);
LABEL_17:
    uint64_t v25 = &v10[8 * a5];
    uint64_t v26 = (uint64_t *)&v24[-8 * a5];
    uint64_t v27 = v24;
    if ((unint64_t)v26 < v14)
    {
      uint64_t v27 = v24;
      do
      {
        uint64_t v28 = *v26++;
        *(void *)uint64_t v27 = v28;
        v27 += 8;
      }
      while ((unint64_t)v26 < v14);
    }
    a1[1] = v27;
    if (v24 != v25) {
      memmove(&v24[-8 * ((v24 - v25) >> 3)], v10, v24 - v25);
    }
    if (v22 != v6)
    {
      memmove(v10, v6, v22 - v6);
    }
    return;
  }
  uint64_t v22 = &__src[8 * v21];
  int64_t v23 = a4 - v22;
  if (a4 != v22) {
    memmove(*(void **)(v11 - 8), &__src[8 * v21], a4 - v22);
  }
  float64x2_t v24 = (char *)(v14 + v23);
  a1[1] = (void *)(v14 + v23);
  if ((uint64_t)(v14 - (void)v10) >= 1) {
    goto LABEL_17;
  }
}

char *std::vector<CGPoint>::__assign_with_size[abi:ne180100]<CGPoint*,CGPoint*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 4)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *unint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 60) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 3;
    if (v8 >> 3 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    __n128 result = std::vector<CGPoint>::__vallocate[abi:ne180100](v7, v11);
    uint64_t v13 = (char *)v7[1];
    uint64_t v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      uint64_t v18 = v9;
      unint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v12 = (void **)(result + 8);
  unint64_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 4;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[16 * v15];
  if (v14 != v9)
  {
    __n128 result = (char *)memmove(*(void **)result, __src, v14 - v9);
    uint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    uint64_t v18 = v9;
    unint64_t v19 = v16;
LABEL_18:
    __n128 result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *uint64_t v12 = &v9[v17];
  return result;
}

void std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    double v4 = (char *)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = (void *)*((void *)v4 - 1);
        v4 -= 8;
      }
      while (v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__split_buffer<PKStroke * {__strong}>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *std::vector<Bucket>::push_back[abi:ne180100](void *result, uint64_t a2)
{
  uint64_t v3 = (char **)result;
  unint64_t v4 = result[2];
  unint64_t v5 = result[1];
  if (v5 >= v4)
  {
    uint64_t v9 = (uint64_t)(v5 - *result) >> 6;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 58) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v4 - *result;
    if (v11 >> 5 > v10) {
      unint64_t v10 = v11 >> 5;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    uint64_t v28 = result + 2;
    if (v12)
    {
      if (v12 >> 58) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v13 = (char *)operator new(v12 << 6);
    }
    else
    {
      uint64_t v13 = 0;
    }
    unint64_t v14 = &v13[64 * v9];
    *(_OWORD *)unint64_t v14 = *(_OWORD *)a2;
    *((void *)v14 + 2) = *(void *)(a2 + 16);
    unint64_t v15 = &v13[64 * v12];
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    *(_OWORD *)(v14 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(v14 + 40) = *(_OWORD *)(a2 + 40);
    *((void *)v14 + 7) = *(void *)(a2 + 56);
    uint64_t v8 = v14 + 64;
    v26.i64[1] = (uint64_t)(v14 + 64);
    uint64_t v27 = v15;
    size_t v17 = *v3;
    unint64_t v16 = (unint64_t)v3[1];
    if ((char *)v16 == *v3)
    {
      int64x2_t v23 = vdupq_n_s64(v16);
    }
    else
    {
      uint64_t v18 = 0;
      do
      {
        unint64_t v19 = &v14[v18];
        uint64_t v20 = v16 + v18;
        *((void *)v19 - 8) = 0;
        *((void *)v19 - 7) = 0;
        *((void *)v19 - 6) = 0;
        *((_OWORD *)v19 - 4) = *(_OWORD *)(v16 + v18 - 64);
        *((void *)v19 - 6) = *(void *)(v16 + v18 - 48);
        *(void *)(v20 - 64) = 0;
        *(void *)(v20 - 56) = 0;
        *(void *)(v20 - 48) = 0;
        long long v21 = *(_OWORD *)(v16 + v18 - 40);
        long long v22 = *(_OWORD *)(v16 + v18 - 24);
        *((void *)v19 - 1) = *(void *)(v16 + v18 - 8);
        *(_OWORD *)(v19 - 24) = v22;
        *(_OWORD *)(v19 - 40) = v21;
        v18 -= 64;
      }
      while ((char *)(v16 + v18) != v17);
      int64x2_t v23 = *(int64x2_t *)v3;
      v14 += v18;
      uint64_t v8 = (char *)v26.i64[1];
      unint64_t v15 = v27;
    }
    *uint64_t v3 = v14;
    v3[1] = v8;
    int64x2_t v26 = v23;
    float64x2_t v24 = v3[2];
    v3[2] = v15;
    uint64_t v27 = v24;
    uint64_t v25 = v23.i64[0];
    __n128 result = (void *)std::__split_buffer<Bucket>::~__split_buffer((uint64_t)&v25);
  }
  else
  {
    *(void *)unint64_t v5 = 0;
    *(void *)(v5 + 8) = 0;
    *(void *)(v5 + 16) = 0;
    *(_OWORD *)unint64_t v5 = *(_OWORD *)a2;
    *(void *)(v5 + 16) = *(void *)(a2 + 16);
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    long long v6 = *(_OWORD *)(a2 + 24);
    long long v7 = *(_OWORD *)(a2 + 40);
    *(void *)(v5 + 56) = *(void *)(a2 + 56);
    *(_OWORD *)(v5 + 40) = v7;
    *(_OWORD *)(v5 + 24) = v6;
    uint64_t v8 = (char *)(v5 + 64);
  }
  v3[1] = v8;
  return result;
}

void std::vector<long>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    std::vector<long>::__append((char **)a1, a2 - v2);
  }
}

uint64_t std::__split_buffer<Bucket>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != v3)
  {
    unint64_t v4 = *(void **)(v2 - 64);
    *(void *)(a1 + 16) = v2 - 64;
    if (v4)
    {
      *(void *)(v2 - 56) = v4;
      operator delete(v4);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 64;
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::vector<long>::__append(char **a1, unint64_t a2)
{
  long long v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  long long v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 3);
    if (v10 >> 61) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 3;
    uint64_t v12 = v5 - v8;
    if (v12 >> 2 > v10) {
      unint64_t v10 = v12 >> 2;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      unint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v4, v13);
      uint64_t v8 = *a1;
      long long v7 = a1[1];
    }
    else
    {
      unint64_t v14 = 0;
    }
    unint64_t v15 = &v14[8 * v11];
    unint64_t v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    size_t v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      uint64_t v18 = *((void *)v7 - 1);
      v7 -= 8;
      *((void *)v15 - 1) = v18;
      v15 -= 8;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void *std::vector<NSArray<PKStroke *> * {__strong},std::allocator<NSArray<PKStroke *> * {__strong}>>::vector(void *a1, unint64_t a2, id *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<NSArray<PKStroke *> * {__strong},std::allocator<NSArray<PKStroke *> * {__strong}>>::__vallocate[abi:ne180100](a1, a2);
    long long v6 = (void *)a1[1];
    long long v7 = &v6[a2];
    uint64_t v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1C4699E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

char *std::vector<NSArray<PKStroke *> * {__strong},std::allocator<NSArray<PKStroke *> * {__strong}>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)operator new(8 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * a2];
  return result;
}

void ___ZL12sliceBucketsPNSt3__16vectorINS0_IN10ClipperLib8IntPointENS_9allocatorIS2_EEEENS3_IS5_EEEERNS0_IU8__strongP8PKStrokeNS3_ISB_EEEERNS0_I6BucketNS3_ISF_EEEERNS0_IU8__strongP7NSArrayISA_ENS3_ISM_EEEE_block_invoke(uint64_t a1, uint64_t a2)
{
  id v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(uint64_t)(*(void *)(**(void **)(a1 + 32) + (a2 << 6) + 8) - *(void *)(**(void **)(a1 + 32) + (a2 << 6))) >> 3];
  uint64_t v4 = **(void **)(a1 + 32) + (a2 << 6);
  unint64_t v5 = *(void **)v4;
  long long v6 = *(void **)(v4 + 8);
  while (v5 != v6)
    [v14 addObject:*(void *)(**(void **)(a1 + 40) + 8 * *v5++)];
  long long v7 = +[PKStroke sliceWithEraser:*(void *)(a1 + 48) toClip:v14];
  unint64_t v8 = 0;
  uint64_t v9 = a2 << 6;
  while (v8 < [v7 count])
  {
    uint64_t v10 = *(void *)(*(void *)(**(void **)(a1 + 32) + v9) + 8 * v8);
    uint64_t v11 = [v7 objectAtIndexedSubscript:v8];
    uint64_t v12 = **(void **)(a1 + 56);
    unint64_t v13 = *(void **)(v12 + 8 * v10);
    *(void *)(v12 + 8 * v10) = v11;

    ++v8;
  }
}

void sub_1C4699FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *std::vector<PKStroke * {__strong}>::vector(void *a1, unint64_t a2, id *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >> 61) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    long long v6 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<legacy_drawing::Command>>>(a2);
    *a1 = v6;
    a1[1] = v6;
    a1[2] = &v6[v7];
    unint64_t v8 = &v6[a2];
    uint64_t v9 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v9 -= 8;
    }
    while (v9);
    a1[1] = v8;
  }
  return a1;
}

void sub_1C469A0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

char *std::vector<NSArray<PKStroke *> * {__strong},std::allocator<NSArray<PKStroke *> * {__strong}>>::__init_with_size[abi:ne180100]<NSArray<PKStroke *> * {__strong}*,NSArray<PKStroke *> * {__strong}*>(char *result, void **a2, void **a3, unint64_t a4)
{
  if (a4)
  {
    long long v6 = result;
    __n128 result = std::vector<NSArray<PKStroke *> * {__strong},std::allocator<NSArray<PKStroke *> * {__strong}>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = (char **)*((void *)v6 + 1);
    while (a2 != a3)
    {
      unint64_t v8 = *a2++;
      __n128 result = v8;
      *v7++ = result;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_1C469A144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void std::vector<Bucket>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      long long v6 = (char *)v1[1];
      do
      {
        unint64_t v8 = (void *)*((void *)v6 - 8);
        v6 -= 64;
        uint64_t v7 = v8;
        if (v8)
        {
          *((void *)v4 - 7) = v7;
          operator delete(v7);
        }
        uint64_t v4 = v6;
      }
      while (v6 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void PKProtobufUtilitiesFormatTooNew(void *a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F28568];
    uint64_t v3 = _PencilKitBundle();
    uint64_t v4 = [v3 localizedStringForKey:@"Apple Drawing Format is from a future version that is too new." value:@"Apple Drawing Format is from a future version that is too new." table:@"Localizable"];
    v7[0] = v4;
    unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    *a1 = [v2 errorWithDomain:*MEMORY[0x1E4F281F8] code:2 userInfo:v5];
  }
}

void sub_1C469A2EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void PKProtobufUtilitiesMalformedError(void *a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F28568];
    uint64_t v3 = _PencilKitBundle();
    uint64_t v4 = [v3 localizedStringForKey:@"Apple Drawing Format data is malformed." value:@"Apple Drawing Format data is malformed." table:@"Localizable"];
    v7[0] = v4;
    unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    *a1 = [v2 errorWithDomain:*MEMORY[0x1E4F281F8] code:3 userInfo:v5];
  }
}

void sub_1C469A420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t legacy_drawing::CommandID::CommandID(uint64_t this)
{
  *(void *)this = &unk_1F1FB0628;
  *(_DWORD *)(this + 20) = 0;
  return this;
}

{
  *(void *)this = &unk_1F1FB0628;
  *(_DWORD *)(this + 20) = 0;
  return this;
}

void legacy_drawing::CommandID::~CommandID(legacy_drawing::CommandID *this)
{
  PB::Base::~Base(this);

  JUMPOUT(0x1C8783F10);
}

uint64_t legacy_drawing::CommandID::CommandID(uint64_t this, const legacy_drawing::CommandID *a2)
{
  *(void *)this = &unk_1F1FB0628;
  *(_DWORD *)(this + 20) = 0;
  char v2 = *((unsigned char *)a2 + 20);
  if (v2)
  {
    int v4 = *((_DWORD *)a2 + 2);
    char v3 = 1;
    *(unsigned char *)(this + 20) = 1;
    *(_DWORD *)(this + 8) = v4;
    char v2 = *((unsigned char *)a2 + 20);
    if ((v2 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v3 = 0;
  if ((*((unsigned char *)a2 + 20) & 4) != 0)
  {
LABEL_5:
    int v5 = *((_DWORD *)a2 + 4);
    v3 |= 4u;
    *(unsigned char *)(this + 20) = v3;
    *(_DWORD *)(this + 16) = v5;
    char v2 = *((unsigned char *)a2 + 20);
  }
LABEL_6:
  if ((v2 & 2) != 0)
  {
    int v6 = *((_DWORD *)a2 + 3);
    *(unsigned char *)(this + 20) = v3 | 2;
    *(_DWORD *)(this + 12) = v6;
  }
  return this;
}

uint64_t legacy_drawing::CommandID::operator=(uint64_t a1, const legacy_drawing::CommandID *a2)
{
  if ((const legacy_drawing::CommandID *)a1 != a2)
  {
    legacy_drawing::CommandID::CommandID((uint64_t)v5, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v6;
    long long v6 = v3;
    PB::Base::~Base((PB::Base *)v5);
  }
  return a1;
}

_DWORD *legacy_drawing::swap(_DWORD *this, legacy_drawing::CommandID *a2, legacy_drawing::CommandID *a3)
{
  int v3 = this[5];
  this[5] = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v3;
  int v4 = this[2];
  this[2] = *((_DWORD *)a2 + 2);
  *((_DWORD *)a2 + 2) = v4;
  int v5 = this[4];
  this[4] = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v5;
  int v6 = this[3];
  this[3] = *((_DWORD *)a2 + 3);
  *((_DWORD *)a2 + 3) = v6;
  return this;
}

uint64_t legacy_drawing::CommandID::CommandID(uint64_t result, _DWORD *a2)
{
  *(void *)__n128 result = &unk_1F1FB0628;
  *(_DWORD *)(result + 20) = a2[5];
  a2[5] = 0;
  *(_DWORD *)(result + 8) = a2[2];
  *(_DWORD *)(result + 16) = a2[4];
  *(_DWORD *)(result + 12) = a2[3];
  return result;
}

{
  *(void *)__n128 result = &unk_1F1FB0628;
  *(_DWORD *)(result + 20) = a2[5];
  a2[5] = 0;
  *(_DWORD *)(result + 8) = a2[2];
  *(_DWORD *)(result + 16) = a2[4];
  *(_DWORD *)(result + 12) = a2[3];
  return result;
}

uint64_t legacy_drawing::CommandID::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    int v6 = &unk_1F1FB0628;
    long long v3 = *(_OWORD *)(a2 + 8);
    *(_DWORD *)(a2 + 20) = 0;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v3;
    long long v7 = v4;
    PB::Base::~Base((PB::Base *)&v6);
  }
  return a1;
}

uint64_t legacy_drawing::CommandID::formatText(legacy_drawing::CommandID *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 20);
  if (v5)
  {
    PB::TextFormatter::format(a2, "clock");
    char v5 = *((unsigned char *)this + 20);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)this + 20) & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "replicaID");
  if ((*((unsigned char *)this + 20) & 4) != 0) {
LABEL_4:
  }
    PB::TextFormatter::format(a2, "subclock");
LABEL_5:

  return MEMORY[0x1F4147498](a2);
}

uint64_t legacy_drawing::CommandID::readFrom(legacy_drawing::CommandID *this, PB::Reader *a2)
{
  unint64_t v3 = *((void *)a2 + 1);
  unint64_t v2 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v3 < v2 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v3 > 0xFFFFFFFFFFFFFFF5 || v3 + 10 > v2) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v3 + 1;
        *((void *)a2 + 1) = v3 + 1;
        char v13 = *(unsigned char *)(v8 + v3);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v3 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_31;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v19 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        *((unsigned char *)this + 20) |= 2u;
        unint64_t v27 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
        uint64_t v28 = *(void *)a2;
        if (v27 > 0xFFFFFFFFFFFFFFF5 || v27 + 10 > v2)
        {
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v31 = 0;
          if (v2 <= v27) {
            unint64_t v3 = *((void *)a2 + 1);
          }
          else {
            unint64_t v3 = *((void *)a2 + 2);
          }
          while (1)
          {
            if (v3 == v27)
            {
              LODWORD(v31) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_83;
            }
            unint64_t v45 = v27++;
            char v46 = *(unsigned char *)(v28 + v45);
            *((void *)a2 + 1) = v27;
            v31 |= (unint64_t)(v46 & 0x7F) << v43;
            if ((v46 & 0x80) == 0) {
              break;
            }
            v43 += 7;
            BOOL v14 = v44++ > 8;
            if (v14)
            {
              LODWORD(v31) = 0;
              goto LABEL_82;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v31) = 0;
          }
LABEL_82:
          unint64_t v3 = v45 + 1;
        }
        else
        {
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          while (1)
          {
            unint64_t v3 = v27 + 1;
            *((void *)a2 + 1) = v27 + 1;
            char v32 = *(unsigned char *)(v28 + v27);
            v31 |= (unint64_t)(v32 & 0x7F) << v29;
            if ((v32 & 0x80) == 0) {
              break;
            }
            v29 += 7;
            unint64_t v27 = v3;
            BOOL v14 = v30++ > 8;
            if (v14)
            {
              LODWORD(v31) = 0;
              break;
            }
          }
        }
LABEL_83:
        *((_DWORD *)this + 3) = v31;
      }
      else if (v19 == 2)
      {
        *((unsigned char *)this + 20) |= 4u;
        unint64_t v33 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
        uint64_t v34 = *(void *)a2;
        if (v33 > 0xFFFFFFFFFFFFFFF5 || v33 + 10 > v2)
        {
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v37 = 0;
          if (v2 <= v33) {
            unint64_t v3 = *((void *)a2 + 1);
          }
          else {
            unint64_t v3 = *((void *)a2 + 2);
          }
          while (1)
          {
            if (v3 == v33)
            {
              LODWORD(v37) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_88;
            }
            unint64_t v49 = v33++;
            char v50 = *(unsigned char *)(v34 + v49);
            *((void *)a2 + 1) = v33;
            v37 |= (unint64_t)(v50 & 0x7F) << v47;
            if ((v50 & 0x80) == 0) {
              break;
            }
            v47 += 7;
            BOOL v14 = v48++ > 8;
            if (v14)
            {
              LODWORD(v37) = 0;
              goto LABEL_87;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v37) = 0;
          }
LABEL_87:
          unint64_t v3 = v49 + 1;
        }
        else
        {
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          while (1)
          {
            unint64_t v3 = v33 + 1;
            *((void *)a2 + 1) = v33 + 1;
            char v38 = *(unsigned char *)(v34 + v33);
            v37 |= (unint64_t)(v38 & 0x7F) << v35;
            if ((v38 & 0x80) == 0) {
              break;
            }
            v35 += 7;
            unint64_t v33 = v3;
            BOOL v14 = v36++ > 8;
            if (v14)
            {
              LODWORD(v37) = 0;
              break;
            }
          }
        }
LABEL_88:
        *((_DWORD *)this + 4) = v37;
      }
      else if (v19 == 1)
      {
        *((unsigned char *)this + 20) |= 1u;
        unint64_t v20 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
        uint64_t v21 = *(void *)a2;
        if (v20 > 0xFFFFFFFFFFFFFFF5 || v20 + 10 > v2)
        {
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v24 = 0;
          if (v2 <= v20) {
            unint64_t v3 = *((void *)a2 + 1);
          }
          else {
            unint64_t v3 = *((void *)a2 + 2);
          }
          while (1)
          {
            if (v3 == v20)
            {
              LODWORD(v24) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_78;
            }
            unint64_t v41 = v20++;
            char v42 = *(unsigned char *)(v21 + v41);
            *((void *)a2 + 1) = v20;
            v24 |= (unint64_t)(v42 & 0x7F) << v39;
            if ((v42 & 0x80) == 0) {
              break;
            }
            v39 += 7;
            BOOL v14 = v40++ > 8;
            if (v14)
            {
              LODWORD(v24) = 0;
              goto LABEL_77;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v24) = 0;
          }
LABEL_77:
          unint64_t v3 = v41 + 1;
        }
        else
        {
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          while (1)
          {
            unint64_t v3 = v20 + 1;
            *((void *)a2 + 1) = v20 + 1;
            char v25 = *(unsigned char *)(v21 + v20);
            v24 |= (unint64_t)(v25 & 0x7F) << v22;
            if ((v25 & 0x80) == 0) {
              break;
            }
            v22 += 7;
            unint64_t v20 = v3;
            BOOL v14 = v23++ > 8;
            if (v14)
            {
              LODWORD(v24) = 0;
              break;
            }
          }
        }
LABEL_78:
        *((_DWORD *)this + 2) = v24;
      }
      else
      {
LABEL_31:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
        unint64_t v3 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
      }
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v3 >= v2 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v3 > v2) {
      unint64_t v2 = v3;
    }
    while (v2 != v3)
    {
      unint64_t v17 = v3 + 1;
      char v18 = *(unsigned char *)(v8 + v3);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v3 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_31;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t legacy_drawing::CommandID::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  char v4 = *(unsigned char *)(this + 20);
  if ((v4 & 1) == 0)
  {
    if ((*(unsigned char *)(this + 20) & 4) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    this = PB::Writer::writeVarInt(a2);
    if ((*(unsigned char *)(v3 + 20) & 2) == 0) {
      return this;
    }
    goto LABEL_7;
  }
  this = PB::Writer::writeVarInt(a2);
  char v4 = *(unsigned char *)(v3 + 20);
  if ((v4 & 4) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v4 & 2) == 0) {
    return this;
  }
LABEL_7:

  return PB::Writer::writeVarInt(a2);
}

BOOL legacy_drawing::CommandID::operator==(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 20))
  {
    if ((*(unsigned char *)(a2 + 20) & 1) == 0 || *(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 8)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 20))
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 20) & 4) != 0)
  {
    if ((*(unsigned char *)(a2 + 20) & 4) == 0 || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 20) & 4) != 0)
  {
    return 0;
  }
  BOOL v2 = (*(unsigned char *)(a2 + 20) & 2) == 0;
  if ((*(unsigned char *)(a1 + 20) & 2) != 0) {
    return (*(unsigned char *)(a2 + 20) & 2) != 0 && *(_DWORD *)(a1 + 12) == *(_DWORD *)(a2 + 12);
  }
  return v2;
}

uint64_t legacy_drawing::CommandID::hash_value(legacy_drawing::CommandID *this)
{
  if ((*((unsigned char *)this + 20) & 1) == 0)
  {
    uint64_t v1 = 0;
    if ((*((unsigned char *)this + 20) & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v2 = 0;
    if ((*((unsigned char *)this + 20) & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v3 = 0;
    return v2 ^ v1 ^ v3;
  }
  uint64_t v1 = *((unsigned int *)this + 2);
  if ((*((unsigned char *)this + 20) & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v2 = *((unsigned int *)this + 4);
  if ((*((unsigned char *)this + 20) & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v3 = *((unsigned int *)this + 3);
  return v2 ^ v1 ^ v3;
}

void sub_1C469B658(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

char *std::vector<double>::insert(char **a1, char *a2, char *a3)
{
  uint64_t v3 = a3;
  int v6 = *a1;
  char v5 = a1[1];
  uint64_t v7 = a2 - *a1;
  uint64_t v8 = &(*a1)[v7 & 0xFFFFFFFFFFFFFFF8];
  uint64_t v10 = (uint64_t)(a1 + 2);
  unint64_t v9 = (unint64_t)a1[2];
  if ((unint64_t)v5 >= v9)
  {
    unint64_t v15 = ((v5 - v6) >> 3) + 1;
    if (v15 >> 61) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v17 = v7 >> 3;
    uint64_t v18 = v9 - (void)v6;
    if (v18 >> 2 > v15) {
      unint64_t v15 = v18 >> 2;
    }
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v19 = v15;
    }
    if (v19) {
      unint64_t v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), v19);
    }
    else {
      unint64_t v20 = 0;
    }
    uint64_t v21 = &v20[8 * v17];
    char v22 = &v20[8 * v19];
    if (v17 == v19)
    {
      if (v7 < 1)
      {
        if (v6 == a2) {
          unint64_t v24 = 1;
        }
        else {
          unint64_t v24 = v7 >> 2;
        }
        char v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v10, v24);
        uint64_t v21 = &v25[8 * (v24 >> 2)];
        char v22 = &v25[8 * v26];
        if (v20)
        {
          unint64_t v27 = &v25[8 * v26];
          operator delete(v20);
          char v22 = v27;
        }
      }
      else
      {
        unint64_t v23 = v17 + 2;
        if (v17 >= -1) {
          unint64_t v23 = v17 + 1;
        }
        v21 -= 8 * (v23 >> 1);
      }
    }
    *(void *)uint64_t v21 = *(void *)v3;
    uint64_t v28 = *a1;
    char v29 = v21;
    if (*a1 != v8)
    {
      unsigned int v30 = v8;
      char v29 = v21;
      do
      {
        uint64_t v31 = *((void *)v30 - 1);
        v30 -= 8;
        *((void *)v29 - 1) = v31;
        v29 -= 8;
      }
      while (v30 != v28);
    }
    char v32 = a1[1];
    int64_t v33 = v32 - v8;
    if (v32 != v8)
    {
      uint64_t v34 = v8;
      size_t v35 = v32 - v8;
      unsigned int v36 = v22;
      memmove(v21 + 8, v34, v35);
      char v22 = v36;
    }
    uint64_t v37 = *a1;
    *a1 = v29;
    a1[1] = &v21[v33 + 8];
    a1[2] = v22;
    if (v37) {
      operator delete(v37);
    }
    return v21;
  }
  else if (v8 == v5)
  {
    *(void *)uint64_t v8 = *(void *)a3;
    a1[1] = v8 + 8;
  }
  else
  {
    unint64_t v11 = v8 + 8;
    unint64_t v12 = v5 - 8;
    char v13 = a1[1];
    while (v12 < v5)
    {
      uint64_t v14 = *(void *)v12;
      v12 += 8;
      *(void *)char v13 = v14;
      v13 += 8;
    }
    a1[1] = v13;
    if (v5 != v11) {
      memmove(&v5[-8 * ((v5 - v11) >> 3)], v8, v5 - v11);
    }
    if (v8 <= v3) {
      v3 += 8 * (a1[1] > v3);
    }
    *(void *)uint64_t v8 = *(void *)v3;
  }
  return v8;
}

void sub_1C469BA44(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1C469CFE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
}

void sub_1C469EB30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1C469ED28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t PKHoverInputPointDescription(void *a1)
{
  return [NSString stringWithFormat:@"HoverInputPoint at (%g %g), z: %g, alt: %g, azi: %g]", *a1, a1[1], a1[7], a1[4], a1[3]];
}

void sub_1C469F44C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C469F568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C469F5EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C469F778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C469FBD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C469FC50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PKHoverController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1C469FE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C469FFB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46A051C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL isPencilGesture(UIHoverGestureRecognizer *a1)
{
  uint64_t v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [(UIHoverGestureRecognizer *)v1 _allActiveTouches];
    if ([v2 count] == 1)
    {
      uint64_t v3 = [v2 anyObject];
      id v4 = v3;
      if (v3 && [v3 type] == 2)
      {
        id v4 = v4;
        char v5 = v4;
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      id v4 = 0;
    }
    char v5 = 0;
    goto LABEL_9;
  }
  char v5 = 0;
LABEL_10:

  return v5 != 0;
}

void sub_1C46A0648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A0B50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A0C8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A0E08(_Unwind_Exception *a1)
{
  uint64_t v2 = v1;

  _Unwind_Resume(a1);
}

void sub_1C46A0EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46A1064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46A10EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A1204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C46A1268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46A1480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46A1794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A1890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A1DD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A1F48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A2018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A20C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46A21F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46A23E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A24B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46A261C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A26E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A2784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A28F0(_Unwind_Exception *exception_object)
{
}

void sub_1C46A2990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A29E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A3678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C46A3930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C46A40FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A41A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A4218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PKImageRenderer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1C46A43BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46A44A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46A45B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1C46A4B40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A4CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1C46A4D90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A4E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46A5390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A5460(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1C46A5690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46A5838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1C46A5908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t _fuzzOneInput(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a1 length:a2];
  +[PKImageRenderer _fuzzTestUnzippedData:v2];

  return 0;
}

void sub_1C46A5A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A5FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A613C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A61D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A627C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46A633C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46A8938(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 216));
  _Block_object_dispose((const void *)(v2 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1C46A8D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C46A8DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

uint64_t drawingV1::Ink::Ink(uint64_t this)
{
  *(_DWORD *)(this + 32) = 0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F1FB0938;
  return this;
}

{
  *(_DWORD *)(this + 32) = 0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F1FB0938;
  return this;
}

void drawingV1::Ink::~Ink(drawingV1::Ink *this)
{
  *(void *)this = &unk_1F1FB0938;
  uint64_t v4 = *((void *)this + 2);
  uint64_t v2 = (void *)((char *)this + 16);
  uint64_t v3 = v4;
  *uint64_t v2 = 0;
  if (v4) {
    std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)v2, v3);
  }
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }

  PB::Base::~Base(this);
}

{
  uint64_t vars8;

  drawingV1::Ink::~Ink(this);

  JUMPOUT(0x1C8783F10);
}

uint64_t drawingV1::Ink::Ink(uint64_t this, const drawingV1::Ink *a2)
{
  *(void *)(this + 8) = 0;
  *(void *)this = &unk_1F1FB0938;
  *(void *)(this + 16) = 0;
  *(_DWORD *)(this + 32) = 0;
  if (*((void *)a2 + 1)) {
    operator new();
  }
  if (*((void *)a2 + 2)) {
    operator new();
  }
  if (*((unsigned char *)a2 + 32))
  {
    uint64_t v2 = *((void *)a2 + 3);
    *(unsigned char *)(this + 32) |= 1u;
    *(void *)(this + 24) = v2;
  }
  return this;
}

uint64_t drawingV1::Ink::operator=(uint64_t a1, const drawingV1::Ink *a2)
{
  if ((const drawingV1::Ink *)a1 != a2)
  {
    drawingV1::Ink::Ink((uint64_t)v7, a2);
    int v3 = *(_DWORD *)(a1 + 32);
    *(_DWORD *)(a1 + 32) = v10;
    int v10 = v3;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v8;
    long long v8 = v4;
    uint64_t v5 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = v9;
    uint64_t v9 = v5;
    drawingV1::Ink::~Ink((drawingV1::Ink *)v7);
  }
  return a1;
}

uint64_t drawingV1::swap(uint64_t this, drawingV1::Ink *a2, drawingV1::Ink *a3)
{
  int v3 = *(_DWORD *)(this + 32);
  *(_DWORD *)(this + 32) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v3;
  uint64_t v4 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  uint64_t v5 = *(void *)(this + 16);
  uint64_t v6 = *(void *)(this + 24);
  uint64_t v7 = *((void *)a2 + 3);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *(void *)(this + 24) = v7;
  *((void *)a2 + 2) = v5;
  *((void *)a2 + 3) = v6;
  return this;
}

uint64_t drawingV1::Ink::Ink(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 16);
  *(void *)a1 = &unk_1F1FB0938;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a2 + 32) = 0;
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v6 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v8 = *v4;
  *uint64_t v4 = v7;
  if (v8) {
    std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)v4, v8);
  }
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t drawingV1::Ink::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    drawingV1::Ink::Ink((uint64_t)v7, a2);
    int v3 = *(_DWORD *)(a1 + 32);
    *(_DWORD *)(a1 + 32) = v10;
    int v10 = v3;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v8;
    long long v8 = v4;
    uint64_t v5 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = v9;
    uint64_t v9 = v5;
    drawingV1::Ink::~Ink((drawingV1::Ink *)v7);
  }
  return a1;
}

uint64_t drawingV1::Ink::formatText(drawingV1::Ink *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "color");
  }
  if (*((void *)this + 2)) {
    PB::TextFormatter::format();
  }
  if (*((unsigned char *)this + 32)) {
    PB::TextFormatter::format(a2, "version");
  }

  return MEMORY[0x1F4147498](a2);
}

uint64_t drawingV1::Ink::readFrom(drawingV1::Ink *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_19;
        }
      }
LABEL_25:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v21 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        *((unsigned char *)this + 32) |= 1u;
        unint64_t v22 = *((void *)a2 + 1);
        unint64_t v23 = *((void *)a2 + 2);
        uint64_t v24 = *(void *)a2;
        if (v22 > 0xFFFFFFFFFFFFFFF5 || v22 + 10 > v23)
        {
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v27 = 0;
          if (v23 <= v22) {
            unint64_t v23 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v23 == v22)
            {
              uint64_t v27 = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_48;
            }
            unint64_t v32 = v22 + 1;
            char v33 = *(unsigned char *)(v24 + v22);
            *((void *)a2 + 1) = v32;
            v27 |= (unint64_t)(v33 & 0x7F) << v30;
            if ((v33 & 0x80) == 0) {
              break;
            }
            v30 += 7;
            unint64_t v22 = v32;
            BOOL v14 = v31++ > 8;
            if (v14)
            {
LABEL_44:
              uint64_t v27 = 0;
              goto LABEL_48;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            uint64_t v27 = 0;
          }
        }
        else
        {
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          while (1)
          {
            unint64_t v28 = v22 + 1;
            *((void *)a2 + 1) = v22 + 1;
            char v29 = *(unsigned char *)(v24 + v22);
            v27 |= (unint64_t)(v29 & 0x7F) << v25;
            if ((v29 & 0x80) == 0) {
              break;
            }
            v25 += 7;
            unint64_t v22 = v28;
            BOOL v14 = v26++ > 8;
            if (v14) {
              goto LABEL_44;
            }
          }
        }
LABEL_48:
        *((void *)this + 3) = v27;
      }
      else
      {
        if (v21 == 2) {
          operator new();
        }
        if (v21 == 1) {
          operator new();
        }
LABEL_19:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_25;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t drawingV1::Ink::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 8);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  if (*(void *)(v3 + 16)) {
    this = PB::Writer::write();
  }
  if (*(unsigned char *)(v3 + 32))
  {
    return PB::Writer::writeVarInt(a2);
  }
  return this;
}

BOOL drawingV1::Ink::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !drawingV1::Color::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  uint64_t v6 = *(unsigned __int8 **)(a1 + 16);
  uint64_t v7 = *(unsigned __int8 ***)(a2 + 16);
  if (v6)
  {
    if (!v7) {
      return 0;
    }
    uint64_t v8 = v6[23];
    if ((v8 & 0x80u) == 0) {
      char v9 = (unsigned __int8 *)v6[23];
    }
    else {
      char v9 = (unsigned __int8 *)*((void *)v6 + 1);
    }
    unsigned int v10 = (unsigned __int8 *)*((unsigned __int8 *)v7 + 23);
    int v11 = (char)v10;
    if ((char)v10 < 0) {
      unsigned int v10 = v7[1];
    }
    if (v9 != v10) {
      return 0;
    }
    if (v11 >= 0) {
      unint64_t v12 = *(unsigned __int8 **)(a2 + 16);
    }
    else {
      unint64_t v12 = *v7;
    }
    if ((v8 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v6, v12, *((void *)v6 + 1))) {
        return 0;
      }
    }
    else if (v6[23])
    {
      while (*v6 == *v12)
      {
        ++v6;
        ++v12;
        if (!--v8) {
          goto LABEL_23;
        }
      }
      return 0;
    }
  }
  else if (v7)
  {
    return 0;
  }
LABEL_23:
  BOOL result = (*(unsigned char *)(a2 + 32) & 1) == 0;
  if ((*(unsigned char *)(a1 + 32) & 1) == 0) {
    return result;
  }
  return (*(unsigned char *)(a2 + 32) & 1) != 0 && *(void *)(a1 + 24) == *(void *)(a2 + 24);
}

unint64_t drawingV1::Ink::hash_value(drawingV1::Ink *this)
{
  unint64_t v2 = (drawingV1::Color *)*((void *)this + 1);
  if (v2) {
    uint64_t v3 = drawingV1::Color::hash_value(v2);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *((void *)this + 2);
  if (v4) {
    unint64_t v5 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v8, v4);
  }
  else {
    unint64_t v5 = 0;
  }
  if (*((unsigned char *)this + 32)) {
    uint64_t v6 = *((void *)this + 3);
  }
  else {
    uint64_t v6 = 0;
  }
  return v5 ^ v3 ^ v6;
}

uint64_t drawingV1::Ink::makeColor(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  unint64_t v5 = this;
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
    char v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    unint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void sub_1C46AB870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  unint64_t v5 = *(void **)v3;
  if (*(void *)v3)
  {
    *(void *)(v3 + 8) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(a1);
}

uint64_t std::unordered_set<CGPoint,anonymous namespace'::HashFunctions,std::equal_to<CGPoint>,std::allocator<CGPoint>>::~unordered_set[abi:ne180100](uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      unint64_t v2 = v3;
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

void sub_1C46AB9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  _Unwind_Resume(a1);
}

void sub_1C46ABAE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46ABBE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL operator<(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 16) < *(double *)(a2 + 16);
}

void sub_1C46AC654(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1C46ACB5C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1C46AD134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Unwind_Resume(a1);
}

char *std::vector<CGPoint>::insert(uint64_t a1, char *__src, char *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = __src;
  std::string::size_type v6 = *(char **)(a1 + 8);
  uint64_t v8 = a1 + 16;
  unint64_t v7 = *(void *)(a1 + 16);
  if ((unint64_t)v6 >= v7)
  {
    char v13 = *(char **)a1;
    unint64_t v14 = ((uint64_t)&v6[-*(void *)a1] >> 4) + 1;
    if (v14 >> 60) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = __src - v13;
    uint64_t v16 = (__src - v13) >> 4;
    uint64_t v17 = v7 - (void)v13;
    if (v17 >> 3 > v14) {
      unint64_t v14 = v17 >> 3;
    }
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v18 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v18 = v14;
    }
    uint64_t v30 = a1 + 16;
    if (v18) {
      unint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>(a1 + 16, v18);
    }
    else {
      unint64_t v19 = 0;
    }
    unint64_t v20 = &v19[16 * v16];
    __p = v19;
    uint64_t v27 = v20;
    unint64_t v28 = v20;
    char v29 = &v19[16 * v18];
    if (v16 == v18)
    {
      if (v15 < 1)
      {
        if (v13 == v4) {
          unint64_t v22 = 1;
        }
        else {
          unint64_t v22 = v15 >> 3;
        }
        unint64_t v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>(v8, v22);
        unint64_t v20 = &v23[16 * (v22 >> 2)];
        __p = v23;
        uint64_t v27 = v20;
        char v29 = &v23[16 * v24];
        if (v19) {
          operator delete(v19);
        }
      }
      else
      {
        unint64_t v21 = v16 + 2;
        if (v16 >= -1) {
          unint64_t v21 = v16 + 1;
        }
        v20 -= 16 * (v21 >> 1);
        uint64_t v27 = v20;
      }
    }
    *(_OWORD *)unint64_t v20 = *(_OWORD *)v3;
    unint64_t v28 = v20 + 16;
    uint64_t v4 = (char *)std::vector<CGPoint>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v4);
    if (v28 != v27) {
      v28 += (v27 - v28 + 15) & 0xFFFFFFFFFFFFFFF0;
    }
    if (__p) {
      operator delete(__p);
    }
  }
  else if (__src == v6)
  {
    *(_OWORD *)__src = *(_OWORD *)a3;
    *(void *)(a1 + 8) = __src + 16;
  }
  else
  {
    char v9 = __src + 16;
    unsigned int v10 = v6 - 16;
    int v11 = *(_OWORD **)(a1 + 8);
    while (v10 < v6)
    {
      long long v12 = *(_OWORD *)v10;
      v10 += 16;
      *v11++ = v12;
    }
    *(void *)(a1 + 8) = v11;
    if (v6 != v9) {
      memmove(&v6[-16 * ((v6 - v9) >> 4)], __src, v6 - v9);
    }
    if (v4 <= v3) {
      v3 += 16 * (*(void *)(a1 + 8) > (unint64_t)v3);
    }
    *(_OWORD *)uint64_t v4 = *(_OWORD *)v3;
  }
  return v4;
}

void sub_1C46AD380(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::unordered_set<anonymous namespace'::Edge,anonymous namespace'::HashFunctions,std::equal_to<anonymous namespace'::Edge>,std::allocator<anonymous namespace'::Edge>>::insert[abi:ne180100](uint64_t a1, double *a2)
{
  unint64_t v5 = PKHashBytes((uint64_t)a2, 32);
  unint64_t v6 = v5;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v2 = v5;
      if (v5 >= v7) {
        unint64_t v2 = v5 % v7;
      }
    }
    else
    {
      unint64_t v2 = (v7 - 1) & v5;
    }
    char v9 = *(double ***)(*(void *)a1 + 8 * v2);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = *(double **)i)
      {
        unint64_t v11 = *((void *)i + 1);
        if (v11 == v5)
        {
          if (i[2] == *a2 && i[3] == a2[1] && i[4] == a2[2] && i[5] == a2[3]) {
            return;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v2) {
            break;
          }
        }
      }
    }
  }
  unint64_t v14 = operator new(0x30uLL);
  *unint64_t v14 = 0;
  v14[1] = v6;
  long long v15 = *((_OWORD *)a2 + 1);
  *((_OWORD *)v14 + 1) = *(_OWORD *)a2;
  *((_OWORD *)v14 + 2) = v15;
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v7 || (float)(v17 * (float)v7) < v16)
  {
    BOOL v18 = 1;
    if (v7 >= 3) {
      BOOL v18 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v7);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v2 = v6 % v7;
      }
      else {
        unint64_t v2 = v6;
      }
    }
    else
    {
      unint64_t v2 = (v7 - 1) & v6;
    }
  }
  uint64_t v22 = *(void *)a1;
  unint64_t v23 = *(void **)(*(void *)a1 + 8 * v2);
  if (v23)
  {
    *unint64_t v14 = *v23;
LABEL_47:
    void *v23 = v14;
    goto LABEL_48;
  }
  *unint64_t v14 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v14;
  *(void *)(v22 + 8 * v2) = a1 + 16;
  if (*v14)
  {
    unint64_t v24 = *(void *)(*v14 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v24 >= v7) {
        v24 %= v7;
      }
    }
    else
    {
      v24 &= v7 - 1;
    }
    unint64_t v23 = (void *)(*(void *)a1 + 8 * v24);
    goto LABEL_47;
  }
LABEL_48:
  ++*(void *)(a1 + 24);
}

void sub_1C46AD5D8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<CGPoint,anonymous namespace'::HashFunctions,std::equal_to<CGPoint>,std::allocator<CGPoint>>::__rehash_unique[abi:ne180100](uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      float v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  unint64_t v5 = operator new(8 * prime);
  unint64_t v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  uint8x8_t v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    unint64_t v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *uint8x8_t v8 = *v14;
          *unint64_t v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          unint64_t v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        uint8x8_t v8 = v14;
        unint64_t v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

__n128 std::__stable_sort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<PolarPoint *>>(__n128 *a1, __n128 *a2, unint64_t a3, uint64_t a4, uint64_t a5, __n128 result)
{
  if (a3 >= 2)
  {
    uint64_t v7 = a1;
    if (a3 == 2)
    {
      result.n128_u64[0] = a2[-1].n128_u64[1];
      if (result.n128_f64[0] < a1[1].n128_f64[0])
      {
        unint64_t v8 = a1[1].n128_u64[0];
        BOOL result = *a1;
        unint64_t v9 = a2[-1].n128_u64[1];
        *a1 = *(__n128 *)((char *)a2 - 24);
        a1[1].n128_u64[0] = v9;
        *(__n128 *)((char *)a2 - 24) = result;
        a2[-1].n128_u64[1] = v8;
      }
    }
    else if ((uint64_t)a3 > 128)
    {
      uint64_t v19 = a4;
      unint64_t v20 = a3 >> 1;
      size_t v21 = (__n128 *)((char *)a1 + 24 * (a3 >> 1));
      unint64_t v22 = a3 >> 1;
      if ((uint64_t)a3 <= a5)
      {
        __n128 v23 = std::__stable_sort_move<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<PolarPoint *>>(a1, v21, v22, a4, result);
        uint64_t v24 = v19 + 24 * v20;
        result.n128_u64[0] = std::__stable_sort_move<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<PolarPoint *>>((__n128 *)((char *)v7 + 24 * (a3 >> 1)), a2, a3 - (a3 >> 1), v24, v23).n128_u64[0];
        char v25 = (__n128 *)(v19 + 24 * a3);
        unsigned int v26 = (__n128 *)v24;
        while (v26 != v25)
        {
          if (v26[1].n128_f64[0] >= *(double *)(v19 + 16))
          {
            BOOL result = *(__n128 *)v19;
            v7[1].n128_u64[0] = *(void *)(v19 + 16);
            *uint64_t v7 = result;
            v19 += 24;
          }
          else
          {
            BOOL result = *v26;
            v7[1].n128_u64[0] = v26[1].n128_u64[0];
            *uint64_t v7 = result;
            unsigned int v26 = (__n128 *)((char *)v26 + 24);
          }
          uint64_t v7 = (__n128 *)((char *)v7 + 24);
          if (v19 == v24)
          {
            if (v26 != v25)
            {
              unint64_t v27 = 0;
              do
              {
                unint64_t v28 = (__n128 *)((char *)v7 + v27);
                BOOL result = *(__n128 *)((char *)v26 + v27);
                v28[1].n128_u64[0] = v26[1].n128_u64[v27 / 8];
                *unint64_t v28 = result;
                v27 += 24;
              }
              while ((__n128 *)((char *)v26 + v27) != v25);
            }
            return result;
          }
        }
        if (v19 != v24)
        {
          uint64_t v29 = 0;
          do
          {
            uint64_t v30 = (__n128 *)((char *)v7 + v29);
            BOOL result = *(__n128 *)(v19 + v29);
            v30[1].n128_u64[0] = *(void *)(v19 + v29 + 16);
            *uint64_t v30 = result;
            v29 += 24;
          }
          while (v19 + v29 != v24);
        }
      }
      else
      {
        std::__stable_sort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<PolarPoint *>>(a1, v21, v22, a4, a5);
        std::__stable_sort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<PolarPoint *>>((char *)v7 + 24 * (a3 >> 1), a2, a3 - (a3 >> 1), v19, a5);
        std::__inplace_merge<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<PolarPoint *>>(v7->n128_f64, &v7->n128_f64[3 * (a3 >> 1)], a2->n128_f64, a3 >> 1, a3 - (a3 >> 1), (char *)v19, a5);
      }
    }
    else if (a1 != a2)
    {
      unint64_t v11 = &a1[1].n128_i8[8];
      if (&a1[1].n128_i8[8] != (__int8 *)a2)
      {
        uint64_t v12 = 0;
        uint64_t v13 = a1;
        do
        {
          result.n128_u64[0] = v13[2].n128_u64[1];
          double v14 = v13[1].n128_f64[0];
          uint64_t v13 = (__n128 *)v11;
          if (result.n128_f64[0] < v14)
          {
            long long v31 = *(_OWORD *)v11;
            uint64_t v15 = v12;
            while (1)
            {
              float v16 = (char *)a1 + v15;
              *(__n128 *)(v16 + 24) = *(__n128 *)((char *)a1 + v15);
              *((void *)v16 + 5) = *(unint64_t *)((char *)a1[1].n128_u64 + v15);
              if (!v15) {
                break;
              }
              v15 -= 24;
              if (result.n128_f64[0] >= *((double *)v16 - 1))
              {
                uint64_t v17 = (uint64_t)&a1[1].n128_i64[1] + v15;
                goto LABEL_15;
              }
            }
            uint64_t v17 = (uint64_t)a1;
LABEL_15:
            *(_OWORD *)uint64_t v17 = v31;
            *(void *)(v17 + 16) = result.n128_u64[0];
          }
          unint64_t v11 = &v13[1].n128_i8[8];
          v12 += 24;
        }
        while (&v13[1].n128_i8[8] != (__int8 *)a2);
      }
    }
  }
  return result;
}

__n128 std::__stable_sort_move<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<PolarPoint *>>(__n128 *a1, __n128 *a2, unint64_t a3, uint64_t a4, __n128 result)
{
  if (a3)
  {
    unint64_t v5 = (__n128 *)a4;
    unint64_t v8 = a1;
    if (a3 == 2)
    {
      unint64_t v9 = (__n128 *)((char *)a2 - 24);
      if (a2[-1].n128_f64[1] >= a1[1].n128_f64[0])
      {
        __n128 v19 = *a1;
        *(void *)(a4 + 16) = a1[1].n128_u64[0];
        *(__n128 *)a4 = v19;
        BOOL result = *v9;
        unint64_t v11 = a2[-1].n128_u64[1];
      }
      else
      {
        __n128 v10 = *v9;
        *(void *)(a4 + 16) = a2[-1].n128_u64[1];
        *(__n128 *)a4 = v10;
        BOOL result = *a1;
        unint64_t v11 = a1[1].n128_u64[0];
      }
      *(void *)(a4 + 40) = v11;
      *(__n128 *)(a4 + 24) = result;
    }
    else if (a3 == 1)
    {
      BOOL result = *a1;
      *(void *)(a4 + 16) = a1[1].n128_u64[0];
      *(__n128 *)a4 = result;
    }
    else if ((uint64_t)a3 > 8)
    {
      unint64_t v20 = (__n128 *)((char *)a1 + 24 * (a3 >> 1));
      std::__stable_sort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<PolarPoint *>>(a1, v20, a3 >> 1, a4, a3 >> 1);
      std::__stable_sort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<PolarPoint *>>((char *)v8 + 24 * (a3 >> 1), a2, a3 - (a3 >> 1), (char *)v5 + 24 * (a3 >> 1), a3 - (a3 >> 1));
      size_t v21 = (__n128 *)((char *)v8 + 24 * (a3 >> 1));
      while (v21 != a2)
      {
        if (v21[1].n128_f64[0] >= v8[1].n128_f64[0])
        {
          BOOL result = *v8;
          v5[1].n128_u64[0] = v8[1].n128_u64[0];
          *unint64_t v5 = result;
          unint64_t v8 = (__n128 *)((char *)v8 + 24);
        }
        else
        {
          BOOL result = *v21;
          v5[1].n128_u64[0] = v21[1].n128_u64[0];
          *unint64_t v5 = result;
          size_t v21 = (__n128 *)((char *)v21 + 24);
        }
        unint64_t v5 = (__n128 *)((char *)v5 + 24);
        if (v8 == v20)
        {
          if (v21 != a2)
          {
            unint64_t v22 = 0;
            do
            {
              __n128 v23 = (__n128 *)((char *)v5 + v22);
              BOOL result = *(__n128 *)((char *)v21 + v22);
              v23[1].n128_u64[0] = v21[1].n128_u64[v22 / 8];
              __n128 *v23 = result;
              v22 += 24;
            }
            while ((__n128 *)((char *)v21 + v22) != a2);
          }
          return result;
        }
      }
      if (v8 != v20)
      {
        unint64_t v24 = 0;
        do
        {
          char v25 = (__n128 *)((char *)v5 + v24);
          BOOL result = *(__n128 *)((char *)v8 + v24);
          v25[1].n128_u64[0] = v8[1].n128_u64[v24 / 8];
          __n128 *v25 = result;
          v24 += 24;
        }
        while ((__n128 *)((char *)v8 + v24) != v20);
      }
    }
    else if (a1 != a2)
    {
      BOOL result = *a1;
      *(void *)(a4 + 16) = a1[1].n128_u64[0];
      *(__n128 *)a4 = result;
      uint64_t v12 = (__n128 *)((char *)a1 + 24);
      if (&a1[1].n128_i8[8] != (__int8 *)a2)
      {
        uint64_t v13 = 0;
        uint64_t v14 = a4;
        do
        {
          uint64_t v15 = v8;
          uint64_t v16 = v14;
          unint64_t v8 = v12;
          v14 += 24;
          uint64_t v17 = v14;
          if (v15[2].n128_f64[1] < *(double *)(v16 + 16))
          {
            *(_OWORD *)uint64_t v14 = *(_OWORD *)v16;
            *(void *)(v14 + 16) = *(void *)(v16 + 16);
            uint64_t v17 = a4;
            if (v16 != a4)
            {
              uint64_t v18 = v13;
              while (1)
              {
                uint64_t v17 = a4 + v18;
                if (v15[2].n128_f64[1] >= *(double *)(a4 + v18 - 8)) {
                  break;
                }
                *(_OWORD *)uint64_t v17 = *(_OWORD *)(v17 - 24);
                *(void *)(v17 + 16) = *(void *)(v17 - 8);
                v18 -= 24;
                if (!v18)
                {
                  uint64_t v17 = a4;
                  break;
                }
              }
            }
          }
          BOOL result = *v8;
          *(void *)(v17 + 16) = v8[1].n128_u64[0];
          *(__n128 *)uint64_t v17 = result;
          uint64_t v12 = (__n128 *)((char *)v8 + 24);
          v13 += 24;
        }
        while (&v8[1].n128_i8[8] != (__int8 *)a2);
      }
    }
  }
  return result;
}

double *std::__inplace_merge<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<PolarPoint *>>(double *result, double *a2, double *a3, uint64_t a4, uint64_t a5, char *a6, uint64_t a7)
{
  if (a5)
  {
    __n128 v10 = result;
    while (a4 > a7 && a5 > a7)
    {
      if (!a4) {
        return result;
      }
      unint64_t v11 = 0;
      uint64_t v12 = -a4;
      while (1)
      {
        uint64_t v13 = &v10[v11 / 8];
        if (a2[2] < v10[v11 / 8 + 2]) {
          break;
        }
        v11 += 24;
        if (__CFADD__(v12++, 1)) {
          return result;
        }
      }
      uint64_t v15 = -v12;
      if (-v12 >= a5)
      {
        if (v12 == -1)
        {
          v78 = &v10[v11 / 8];
          double v100 = v10[v11 / 8 + 2];
          long long v95 = *(_OWORD *)&v10[v11 / 8];
          long long v79 = *(_OWORD *)a2;
          v78[2] = a2[2];
          *(_OWORD *)v78 = v79;
          *(_OWORD *)a2 = v95;
          a2[2] = v100;
          return result;
        }
        if (v12 > 0) {
          uint64_t v15 = 1 - v12;
        }
        uint64_t v25 = v15 >> 1;
        unint64_t v24 = a2;
        if (a2 != a3)
        {
          unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * (a3 - a2);
          unint64_t v24 = a2;
          do
          {
            unint64_t v27 = v26 >> 1;
            unint64_t v28 = &v24[3 * (v26 >> 1)];
            double v29 = v28[2];
            uint64_t v30 = v28 + 3;
            v26 += ~(v26 >> 1);
            if (v29 < v10[3 * v25 + 2 + v11 / 8]) {
              unint64_t v24 = v30;
            }
            else {
              unint64_t v26 = v27;
            }
          }
          while (v26);
        }
        uint64_t v18 = &v10[3 * v25 + v11 / 8];
        uint64_t v17 = 0xAAAAAAAAAAAAAAABLL * (v24 - a2);
      }
      else
      {
        if (a5 >= 0) {
          uint64_t v16 = a5;
        }
        else {
          uint64_t v16 = a5 + 1;
        }
        uint64_t v17 = v16 >> 1;
        uint64_t v18 = a2;
        if ((char *)a2 - (char *)v10 != v11)
        {
          unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((char *)a2 - (char *)v10 - v11) >> 3);
          uint64_t v18 = &v10[v11 / 8];
          do
          {
            unint64_t v20 = v19 >> 1;
            size_t v21 = &v18[3 * (v19 >> 1)];
            double v22 = v21[2];
            __n128 v23 = v21 + 3;
            v19 += ~(v19 >> 1);
            if (a2[3 * v17 + 2] < v22) {
              unint64_t v19 = v20;
            }
            else {
              uint64_t v18 = v23;
            }
          }
          while (v19);
        }
        unint64_t v24 = &a2[3 * v17];
        uint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((char *)v18 - (char *)v10 - v11) >> 3);
      }
      double v90 = a6;
      if (v18 == a2)
      {
        a2 = v24;
      }
      else
      {
        uint64_t v31 = (char *)v24 - (char *)a2;
        if (v24 == a2)
        {
          a2 = v18;
        }
        else
        {
          unint64_t v32 = v18 + 3;
          if (v18 + 3 == a2)
          {
            uint64_t v97 = *((void *)v18 + 2);
            long long v92 = *(_OWORD *)v18;
            uint64_t v37 = a3;
            uint64_t v83 = a7;
            uint64_t v84 = v17;
            uint64_t v86 = v25;
            uint64_t v88 = a5;
            memmove(v18, a2, (char *)v24 - (char *)a2);
            uint64_t v17 = v84;
            uint64_t v25 = v86;
            a5 = v88;
            a7 = v83;
            a3 = v37;
            a2 = (double *)((char *)v18 + v31);
            *(_OWORD *)a2 = v92;
            *((void *)a2 + 2) = v97;
          }
          else
          {
            char v33 = a2 + 3;
            if (a2 + 3 == v24)
            {
              a2 = v18 + 3;
              uint64_t v98 = *((void *)v24 - 1);
              long long v93 = *(_OWORD *)(v24 - 3);
              if (v24 - 3 != v18)
              {
                char v38 = a3;
                uint64_t v85 = v17;
                uint64_t v39 = a7;
                uint64_t v87 = v25;
                uint64_t v89 = a5;
                memmove(v18 + 3, v18, (char *)(v24 - 3) - (char *)v18);
                uint64_t v17 = v85;
                uint64_t v25 = v87;
                a5 = v89;
                a7 = v39;
                a2 = v18 + 3;
                a3 = v38;
              }
              *((void *)v18 + 2) = v98;
              *(_OWORD *)uint64_t v18 = v93;
            }
            else
            {
              unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * (a2 - v18);
              if (v34 == 0xAAAAAAAAAAAAAAABLL * (v31 >> 3))
              {
                do
                {
                  uint64_t v96 = *((void *)v32 - 1);
                  long long v91 = *(_OWORD *)(v32 - 3);
                  long long v35 = *(_OWORD *)(v33 - 3);
                  *(v32 - 1) = *(v33 - 1);
                  *(_OWORD *)(v32 - 3) = v35;
                  *(_OWORD *)(v33 - 3) = v91;
                  *((void *)v33 - 1) = v96;
                  if (v32 == a2) {
                    break;
                  }
                  v32 += 3;
                  BOOL v36 = v33 == v24;
                  v33 += 3;
                }
                while (!v36);
              }
              else
              {
                uint64_t v40 = 0xAAAAAAAAAAAAAAABLL * (v31 >> 3);
                unint64_t v41 = 0xAAAAAAAAAAAAAAABLL * (a2 - v18);
                do
                {
                  uint64_t v42 = v41;
                  unint64_t v41 = v40;
                  uint64_t v40 = v42 % v40;
                }
                while (v40);
                if (v41)
                {
                  char v43 = &v18[3 * v41];
                  do
                  {
                    long long v44 = *(_OWORD *)(v43 - 3);
                    uint64_t v45 = *((void *)v43 - 1);
                    v43 -= 3;
                    uint64_t v99 = v45;
                    long long v94 = v44;
                    char v46 = &v43[3 * v34];
                    char v47 = v43;
                    do
                    {
                      unsigned int v48 = v46;
                      long long v49 = *(_OWORD *)v46;
                      v47[2] = v46[2];
                      *(_OWORD *)char v47 = v49;
                      unint64_t v50 = 0xAAAAAAAAAAAAAAABLL * (v24 - v46);
                      v46 += 3 * v34;
                      BOOL v51 = __OFSUB__(v34, v50);
                      uint64_t v53 = v34 - v50;
                      char v52 = (v53 < 0) ^ v51;
                      uint64_t v54 = &v18[3 * v53];
                      if (!v52) {
                        char v46 = v54;
                      }
                      char v47 = v48;
                    }
                    while (v46 != v43);
                    *((void *)v48 + 2) = v99;
                    *(_OWORD *)unsigned int v48 = v94;
                  }
                  while (v43 != v18);
                }
                a2 = &v18[v31 >> 3];
              }
            }
          }
        }
      }
      a4 = -(v25 + v12);
      uint64_t v55 = a5 - v17;
      if (v25 + v17 >= a5 - (v25 + v17) - v12)
      {
        v60 = a2;
        uint64_t v61 = v25;
        uint64_t v62 = -(v25 + v12);
        uint64_t v57 = a7;
        uint64_t v55 = v17;
        BOOL result = (double *)std::__inplace_merge<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<PolarPoint *>>(a2, v24, a3, v62, a5 - v17);
        a2 = v18;
        a4 = v61;
        a3 = v60;
      }
      else
      {
        long long v56 = &v10[v11 / 8];
        uint64_t v57 = a7;
        uint64_t v58 = a3;
        v59 = a2;
        BOOL result = (double *)std::__inplace_merge<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<PolarPoint *>>(v56, v18, a2, v25, v17);
        a3 = v58;
        uint64_t v13 = v59;
        a2 = v24;
      }
      a5 = v55;
      __n128 v10 = v13;
      a6 = v90;
      a7 = v57;
      if (!v55) {
        return result;
      }
    }
    if (a4 <= a5)
    {
      if (v10 != a2)
      {
        uint64_t v72 = 0;
        do
        {
          unint64_t v73 = (double *)&a6[v72 * 8];
          long long v74 = *(_OWORD *)&v10[v72];
          v73[2] = v10[v72 + 2];
          *(_OWORD *)unint64_t v73 = v74;
          v72 += 3;
        }
        while (&v10[v72] != a2);
        if (v72 * 8)
        {
          unint64_t v75 = (double *)a6;
          while (a2 != a3)
          {
            if (a2[2] >= v75[2])
            {
              long long v77 = *(_OWORD *)v75;
              v10[2] = v75[2];
              *(_OWORD *)__n128 v10 = v77;
              v75 += 3;
            }
            else
            {
              long long v76 = *(_OWORD *)a2;
              v10[2] = a2[2];
              *(_OWORD *)__n128 v10 = v76;
              a2 += 3;
            }
            v10 += 3;
            if (&a6[v72 * 8] == (char *)v75) {
              return result;
            }
          }
          return (double *)memmove(v10, v75, a6 - (char *)v75 + v72 * 8);
        }
      }
    }
    else if (a3 != a2)
    {
      uint64_t v63 = 0;
      do
      {
        unint64_t v64 = (double *)&a6[v63 * 8];
        long long v65 = *(_OWORD *)&a2[v63];
        v64[2] = a2[v63 + 2];
        *(_OWORD *)unint64_t v64 = v65;
        v63 += 3;
      }
      while (&a2[v63] != a3);
      if (v63 * 8)
      {
        v66 = (double *)&a6[v63 * 8];
        long long v67 = a3 - 3;
        while (a2 != v10)
        {
          double v68 = *(v66 - 1);
          double v69 = *(a2 - 1);
          if (v68 >= v69) {
            long long v70 = v66 - 3;
          }
          else {
            long long v70 = a2 - 3;
          }
          if (v68 >= v69) {
            v66 -= 3;
          }
          else {
            a2 -= 3;
          }
          long long v71 = *(_OWORD *)v70;
          v67[2] = v70[2];
          *(_OWORD *)long long v67 = v71;
          v67 -= 3;
          if (v66 == (double *)a6) {
            return result;
          }
        }
        unint64_t v80 = 0;
        do
        {
          long long v81 = &v67[v80];
          long long v82 = *(_OWORD *)&v66[v80 - 3];
          v81[2] = v66[v80 - 1];
          *(_OWORD *)long long v81 = v82;
          v80 -= 3;
        }
        while (&v66[v80] != (double *)a6);
      }
    }
  }
  return result;
}

void sub_1C46AEED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1C46AF040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *PKPaletteVisualStateDescription(unint64_t a1)
{
  if (a1 > 7) {
    return 0;
  }
  else {
    return off_1E64C8F70[a1];
  }
}

uint64_t PKPaletteVisualStateIsRegular(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return 0;
  }
  else {
    return qword_1C482A700[a1 - 1];
  }
}

uint64_t _PKPaletteVisualStateForPointInRectToSettle(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGFloat v14 = CGRectGetWidth(*(CGRect *)&a2) * 0.25;
  v38.origin.x = a2;
  v38.origin.y = a3;
  v38.size.width = a4;
  v38.size.height = a5;
  CGFloat v15 = CGRectGetHeight(v38) * 0.25;
  v39.origin.x = a2;
  v39.origin.y = a3;
  v39.size.width = a4;
  v39.size.height = a5;
  CGRect v40 = CGRectInset(v39, v14, v15);
  v37.x = a6;
  v37.y = a7;
  if (CGRectContainsPoint(v40, v37)) {
    return 3;
  }
  v41.origin.x = a2;
  v41.origin.y = a3;
  v41.size.width = a4;
  v41.size.height = a5;
  double MidX = CGRectGetMidX(v41);
  v42.origin.x = a2;
  v42.origin.y = a3;
  v42.size.width = a4;
  v42.size.height = a5;
  double MinY = CGRectGetMinY(v42);
  v43.origin.x = a2;
  v43.origin.y = a3;
  v43.size.width = a4;
  v43.size.height = a5;
  double MaxX = CGRectGetMaxX(v43);
  v44.origin.x = a2;
  v44.origin.y = a3;
  v44.size.width = a4;
  v44.size.height = a5;
  double MidY = CGRectGetMidY(v44);
  v45.origin.x = a2;
  v45.origin.y = a3;
  v45.size.width = a4;
  v45.size.height = a5;
  double v36 = CGRectGetMidX(v45);
  v46.origin.x = a2;
  v46.origin.y = a3;
  v46.size.width = a4;
  v46.size.height = a5;
  double MaxY = CGRectGetMaxY(v46);
  v47.origin.x = a2;
  v47.origin.y = a3;
  v47.size.width = a4;
  v47.size.height = a5;
  double MinX = CGRectGetMinX(v47);
  v48.origin.x = a2;
  v48.origin.y = a3;
  v48.size.width = a4;
  v48.size.height = a5;
  double v31 = CGRectGetMidY(v48);
  v49.origin.x = a2;
  v49.origin.y = a3;
  v49.size.width = a4;
  v49.size.height = a5;
  double v30 = CGRectGetMinX(v49);
  v50.origin.x = a2;
  v50.origin.y = a3;
  v50.size.width = a4;
  v50.size.height = a5;
  double v29 = CGRectGetMinY(v50);
  v51.origin.x = a2;
  v51.origin.y = a3;
  v51.size.width = a4;
  v51.size.height = a5;
  double v28 = CGRectGetMaxX(v51);
  v52.origin.x = a2;
  v52.origin.y = a3;
  v52.size.width = a4;
  v52.size.height = a5;
  double v27 = CGRectGetMinY(v52);
  v53.origin.x = a2;
  v53.origin.y = a3;
  v53.size.width = a4;
  v53.size.height = a5;
  double v26 = CGRectGetMaxX(v53);
  v54.origin.x = a2;
  v54.origin.y = a3;
  v54.size.width = a4;
  v54.size.height = a5;
  double v25 = CGRectGetMaxY(v54);
  v55.origin.x = a2;
  v55.origin.y = a3;
  v55.size.width = a4;
  v55.size.height = a5;
  double v24 = CGRectGetMinX(v55);
  v56.origin.x = a2;
  v56.origin.y = a3;
  v56.size.width = a4;
  v56.size.height = a5;
  double v23 = CGRectGetMaxY(v56);
  _PKPaletteClosestReferencePointFromPointInRect(a2, a3, a4, a5, a6, a7);
  if (MidX == v19 && MinY == v20) {
    return 4;
  }
  if (v36 == v19 && MaxY == v20) {
    return 5;
  }
  if (MaxX == v19 && MidY == v20) {
    return 7;
  }
  if (MinX == v19 && v31 == v20) {
    return 6;
  }
  if (v30 == v19 && v29 == v20 || v28 == v19 && v27 == v20 || v26 == v19 && v25 == v20)
  {
    if (a1) {
      return 2;
    }
    else {
      return 3;
    }
  }
  else
  {
    uint64_t v21 = 2;
    if (!a1) {
      uint64_t v21 = 3;
    }
    if (v23 == v20 && v24 == v19) {
      return v21;
    }
    else {
      return 5;
    }
  }
}

void _PKPaletteClosestReferencePointFromPointInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6)
{
  v32[16] = *MEMORY[0x1E4F143B8];
  CGFloat MinX = CGRectGetMinX(*(CGRect *)&a1);
  v33.origin.x = a1;
  v33.origin.y = a2;
  v33.size.width = a3;
  v33.size.height = a4;
  CGFloat MinY = CGRectGetMinY(v33);
  v34.origin.x = a1;
  v34.origin.y = a2;
  v34.size.width = a3;
  v34.size.height = a4;
  CGFloat MaxX = CGRectGetMaxX(v34);
  v35.origin.x = a1;
  v35.origin.y = a2;
  v35.size.width = a3;
  v35.size.height = a4;
  CGFloat v28 = CGRectGetMinY(v35);
  v36.origin.x = a1;
  v36.origin.y = a2;
  v36.size.width = a3;
  v36.size.height = a4;
  CGFloat v27 = CGRectGetMaxX(v36);
  v37.origin.x = a1;
  v37.origin.y = a2;
  v37.size.width = a3;
  v37.size.height = a4;
  CGFloat MaxY = CGRectGetMaxY(v37);
  v38.origin.x = a1;
  v38.origin.y = a2;
  v38.size.width = a3;
  v38.size.height = a4;
  CGFloat v25 = CGRectGetMinX(v38);
  v39.origin.x = a1;
  v39.origin.y = a2;
  v39.size.width = a3;
  v39.size.height = a4;
  CGFloat v24 = CGRectGetMaxY(v39);
  v40.origin.x = a1;
  v40.origin.y = a2;
  v40.size.width = a3;
  v40.size.height = a4;
  CGFloat MidX = CGRectGetMidX(v40);
  v41.origin.x = a1;
  v41.origin.y = a2;
  v41.size.width = a3;
  v41.size.height = a4;
  CGFloat v22 = CGRectGetMinY(v41);
  v42.origin.x = a1;
  v42.origin.y = a2;
  v42.size.width = a3;
  v42.size.height = a4;
  CGFloat v21 = CGRectGetMaxX(v42);
  v43.origin.x = a1;
  v43.origin.y = a2;
  v43.size.width = a3;
  v43.size.height = a4;
  CGFloat MidY = CGRectGetMidY(v43);
  v44.origin.x = a1;
  v44.origin.y = a2;
  v44.size.width = a3;
  v44.size.height = a4;
  CGFloat v19 = CGRectGetMidX(v44);
  v45.origin.x = a1;
  v45.origin.y = a2;
  v45.size.width = a3;
  v45.size.height = a4;
  CGFloat v12 = CGRectGetMaxY(v45);
  v46.origin.x = a1;
  v46.origin.y = a2;
  v46.size.width = a3;
  v46.size.height = a4;
  CGFloat v13 = CGRectGetMinX(v46);
  v47.origin.x = a1;
  v47.origin.y = a2;
  v47.size.width = a3;
  v47.size.height = a4;
  CGFloat v14 = CGRectGetMidY(v47);
  uint64_t v15 = 0;
  *(CGFloat *)unint64_t v32 = MinX;
  *(CGFloat *)&v32[1] = MinY;
  *(CGFloat *)&v32[2] = MaxX;
  *(CGFloat *)&v32[3] = v28;
  *(CGFloat *)&v32[4] = v27;
  *(CGFloat *)&v32[5] = MaxY;
  *(CGFloat *)&v32[6] = v25;
  *(CGFloat *)&v32[7] = v24;
  *(CGFloat *)&v32[8] = MidX;
  *(CGFloat *)&v32[9] = v22;
  *(CGFloat *)&v32[10] = v21;
  *(CGFloat *)&v32[11] = MidY;
  *(CGFloat *)&v32[12] = v19;
  *(CGFloat *)&v32[13] = v12;
  double v16 = 3.40282347e38;
  *(CGFloat *)&v32[14] = v13;
  *(CGFloat *)&v32[15] = v14;
  do
  {
    double v17 = *(double *)&v32[v15];
    double v18 = *(double *)&v32[v15 + 1];
    if ((a6 - v18) * (a6 - v18) + (a5 - v17) * (a5 - v17) < v16) {
      double v16 = (a6 - v18) * (a6 - v18) + (a5 - v17) * (a5 - v17);
    }
    v15 += 2;
  }
  while (v15 != 16);
}

void sub_1C46B7C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C46B8594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t drawing::Point::Point(uint64_t this)
{
  *(void *)this = &unk_1F1FB07E8;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

{
  *(void *)this = &unk_1F1FB07E8;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

void drawing::Point::~Point(drawing::Point *this)
{
  PB::Base::~Base(this);

  JUMPOUT(0x1C8783F10);
}

float drawing::Point::Point(drawing::Point *this, const drawing::Point *a2)
{
  *(void *)this = &unk_1F1FB07E8;
  *((_DWORD *)this + 4) = 0;
  if (*((unsigned char *)a2 + 16))
  {
    float result = *((float *)a2 + 2);
    *((unsigned char *)this + 16) = 1;
    *((float *)this + 2) = result;
    char v2 = 3;
    if ((*((unsigned char *)a2 + 16) & 2) == 0) {
      return result;
    }
    goto LABEL_5;
  }
  char v2 = 2;
  if ((*((unsigned char *)a2 + 16) & 2) != 0)
  {
LABEL_5:
    float result = *((float *)a2 + 3);
    *((unsigned char *)this + 16) = v2;
    *((float *)this + 3) = result;
  }
  return result;
}

uint64_t drawing::Point::operator=(uint64_t a1, const drawing::Point *a2)
{
  if ((const drawing::Point *)a1 != a2)
  {
    drawing::Point::Point((drawing::Point *)v6, a2);
    int v3 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)(a1 + 16) = v8;
    int v8 = v3;
    uint64_t v4 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v7;
    uint64_t v7 = v4;
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

float drawing::swap(drawing *this, drawing::Point *a2, drawing::Point *a3)
{
  int v3 = *((_DWORD *)this + 4);
  *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v3;
  int v4 = *((_DWORD *)this + 2);
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  *((_DWORD *)a2 + 2) = v4;
  float result = *((float *)this + 3);
  *((_DWORD *)this + 3) = *((_DWORD *)a2 + 3);
  *((float *)a2 + 3) = result;
  return result;
}

float drawing::Point::Point(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F1FB07E8;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  float result = *(float *)(a2 + 12);
  *(float *)(a1 + 12) = result;
  return result;
}

{
  float result;

  *(void *)a1 = &unk_1F1FB07E8;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  float result = *(float *)(a2 + 12);
  *(float *)(a1 + 12) = result;
  return result;
}

uint64_t drawing::Point::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    v7[0] = &unk_1F1FB07E8;
    int v3 = *(_DWORD *)(a2 + 16);
    *(_DWORD *)(a2 + 16) = 0;
    int v8 = *(_DWORD *)(a1 + 16);
    uint64_t v4 = *(void *)(a1 + 8);
    uint64_t v5 = *(void *)(a2 + 8);
    *(_DWORD *)(a1 + 16) = v3;
    *(void *)(a1 + 8) = v5;
    v7[1] = v4;
    PB::Base::~Base((PB::Base *)v7);
  }
  return a1;
}

uint64_t drawing::Point::formatText(drawing::Point *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 16);
  if (v5)
  {
    PB::TextFormatter::format(a2, "x", *((float *)this + 2));
    char v5 = *((unsigned char *)this + 16);
  }
  if ((v5 & 2) != 0) {
    PB::TextFormatter::format(a2, "y", *((float *)this + 3));
  }

  return MEMORY[0x1F4147498](a2);
}

uint64_t drawing::Point::readFrom(drawing::Point *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    do
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        char v15 = 0;
        unsigned int v16 = 0;
        unint64_t v11 = 0;
        if (v2 > v3) {
          unint64_t v3 = v2;
        }
        while (v3 != v2)
        {
          unint64_t v17 = v2 + 1;
          char v18 = *(unsigned char *)(v8 + v2);
          *((void *)a2 + 1) = v17;
          v11 |= (unint64_t)(v18 & 0x7F) << v15;
          if ((v18 & 0x80) == 0) {
            goto LABEL_20;
          }
          v15 += 7;
          unint64_t v2 = v17;
          BOOL v14 = v16++ > 8;
          if (v14) {
            goto LABEL_26;
          }
        }
        int v4 = 1;
        *((unsigned char *)a2 + 24) = 1;
        return v4 == 0;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_26;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *((unsigned char *)this + 16) |= 2u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2)) {
          goto LABEL_30;
        }
        *((_DWORD *)this + 3) = *(_DWORD *)(*(void *)a2 + v2);
      }
      else
      {
        if ((v11 >> 3) != 1)
        {
LABEL_26:
          uint64_t result = PB::Reader::skip(a2);
          if (!result) {
            return result;
          }
          unint64_t v2 = *((void *)a2 + 1);
          goto LABEL_33;
        }
        *((unsigned char *)this + 16) |= 1u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2))
        {
LABEL_30:
          *((unsigned char *)a2 + 24) = 1;
          goto LABEL_33;
        }
        *((_DWORD *)this + 2) = *(_DWORD *)(*(void *)a2 + v2);
      }
      unint64_t v2 = *((void *)a2 + 1) + 4;
      *((void *)a2 + 1) = v2;
LABEL_33:
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
    }
    while (v2 < v3 && !*((unsigned char *)a2 + 24));
  }
  return v4 == 0;
}

uint64_t drawing::Point::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  char v4 = *(unsigned char *)(this + 16);
  if (v4)
  {
    this = PB::Writer::write(a2, *(float *)(this + 8));
    char v4 = *(unsigned char *)(v3 + 16);
  }
  if ((v4 & 2) != 0)
  {
    float v5 = *(float *)(v3 + 12);
    return PB::Writer::write(a2, v5);
  }
  return this;
}

BOOL drawing::Point::operator==(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 16))
  {
    if ((*(unsigned char *)(a2 + 16) & 1) == 0 || *(float *)(a1 + 8) != *(float *)(a2 + 8)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 16))
  {
    return 0;
  }
  BOOL v2 = (*(unsigned char *)(a2 + 16) & 2) == 0;
  if ((*(unsigned char *)(a1 + 16) & 2) != 0) {
    return (*(unsigned char *)(a2 + 16) & 2) != 0 && *(float *)(a1 + 12) == *(float *)(a2 + 12);
  }
  return v2;
}

uint64_t drawing::Point::hash_value(drawing::Point *this)
{
  if (*((unsigned char *)this + 16))
  {
    float v4 = *((float *)this + 2);
    uint64_t v1 = LODWORD(v4);
    if (v4 == 0.0) {
      uint64_t v1 = 0;
    }
    if ((*((unsigned char *)this + 16) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v3 = 0;
    return v3 ^ v1;
  }
  uint64_t v1 = 0;
  if ((*((unsigned char *)this + 16) & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  float v2 = *((float *)this + 3);
  uint64_t v3 = LODWORD(v2);
  if (v2 == 0.0) {
    uint64_t v3 = 0;
  }
  return v3 ^ v1;
}

void sub_1C46B9024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46B91C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46B92CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46B93D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void PKAccessibilityPerformBlockOnMainThreadAfterDelay(void *a1, double a2)
{
  id v3 = a1;
  id v4 = +[PKDispatchAfterHandler appLifeCycleHandler];
  [v4 dispatchAfter:0 stringIdentifier:v3 withBlock:a2];
}

void PKAccessibilityPostAnnouncementNotification(void *a1, void *a2)
{
}

void PKAccessibilityPostAnnouncementNotificationWithPriority(void *a1, void *a2, uint64_t a3)
{
  id v7 = a1;
  id v5 = a2;
  unint64_t v6 = +[PKAccessibility sharedInstance];
  if ([v6 pkaxRespondsToSelector:sel_postAnnouncement_withSender_priority_ fromExtrasProtocol:&unk_1F205A2F0])objc_msgSend(v6, "postAnnouncement:withSender:priority:", v5, v7, a3); {
}
  }

void PKAccessibilityPostHighPriorityAnnouncementNotification(void *a1, void *a2)
{
}

uint64_t PKAccessibilityNeedsAccessibilityElements()
{
  v0 = +[PKAccessibility sharedInstance];
  if ([v0 pkaxRespondsToSelector:sel_needsAccessibilityElements fromExtrasProtocol:&unk_1F205A2F0])uint64_t v1 = objc_msgSend(v0, "needsAccessibilityElements"); {
  else
  }
    uint64_t v1 = 0;

  return v1;
}

uint64_t PKAccessibilityLocalizedUnsignedInteger(uint64_t a1)
{
  return [MEMORY[0x1E4F28EE0] pkaxLocalizedUnsignedInteger:a1];
}

uint64_t PKAccessibilityLocalizedNumber(uint64_t a1)
{
  return [MEMORY[0x1E4F28EE0] pkaxLocalizedNumber:a1];
}

uint64_t PKAccessibilityLocalizedPercent()
{
  return objc_msgSend(MEMORY[0x1E4F28EE0], "pkaxLocalizedPercentage:");
}

id __PKAccessibilityStringForVariables(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  objc_opt_class();
  objc_opt_class();
  unint64_t v11 = [MEMORY[0x1E4F28E78] stringWithString:&stru_1F1FB2C00];
  if (objc_opt_isKindOfClass())
  {
    id v12 = v10;
  }
  else
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v13 = 0;
      goto LABEL_7;
    }
    id v12 = [v10 string];
  }
  char v13 = v12;
LABEL_7:
  if ([v13 length]) {
    [v11 appendString:v13];
  }
  double v20 = (id *)&a9;
  if (a1) {
    BOOL v14 = @", ";
  }
  else {
    BOOL v14 = @" ";
  }
  while (1)
  {
    char v15 = v20++;
    id v16 = *v15;
    if (objc_opt_isKindOfClass())
    {
      id v17 = v16;
LABEL_16:
      char v18 = v17;
      goto LABEL_18;
    }
    if (objc_opt_isKindOfClass())
    {
      id v17 = [v16 string];
      goto LABEL_16;
    }
    char v18 = 0;
LABEL_18:
    if (![v18 length]) {
      goto LABEL_23;
    }
    if ([v18 isEqualToString:@"__PKAccessibilityStringForVariablesSentinel"]) {
      break;
    }
    if ([v11 length]) {
      [v11 appendString:v14];
    }
    [v11 appendString:v18];
LABEL_23:
  }

  return v11;
}

void sub_1C46BADD0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
}

void sub_1C46BC098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46BC2DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46BC444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46BC534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46BC640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46BE1C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(location);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

void sub_1C46BEC6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C46BF15C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_1C46BFE04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C46C1708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46C19C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)va);

  _Unwind_Resume(a1);
}

void sub_1C46C2028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  *(void *)(v27 - 120) = &a10;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v27 - 120));
  ClipperLib::PolyTree::~PolyTree((ClipperLib::PolyTree *)&a13);
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a26);
  a13 = (void **)(v27 - 144);
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a13);

  _Unwind_Resume(a1);
}

void sub_1C46C26C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46C2B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, char a16)
{
  std::__split_buffer<PB::Data>::~__split_buffer((uint64_t)&a16);
  free(a14);
  if (v16) {
    operator delete(v16);
  }
  _Unwind_Resume(a1);
}

void sub_1C46C2CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  drawing::Stroke::~Stroke((drawing::Stroke *)va);

  _Unwind_Resume(a1);
}

void sub_1C46C2DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  drawing::Stroke::~Stroke((drawing::Stroke *)va);
  _Unwind_Resume(a1);
}

void sub_1C46C2EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46C3068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46C314C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

double *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[PKStrokeMask calculateCenterlineSlices:]::$_0 &,_PKFloatRange *>(double *result, double *a2, double *a3)
{
  double v3 = *a2;
  double v4 = *a3;
  if (*a2 >= *result)
  {
    if (v4 < v3)
    {
      long long v6 = *(_OWORD *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_OWORD *)a3 = v6;
      if (*a2 < *result)
      {
        long long v7 = *(_OWORD *)result;
        *(_OWORD *)uint64_t result = *(_OWORD *)a2;
        *(_OWORD *)a2 = v7;
      }
    }
  }
  else
  {
    if (v4 >= v3)
    {
      long long v8 = *(_OWORD *)result;
      *(_OWORD *)uint64_t result = *(_OWORD *)a2;
      *(_OWORD *)a2 = v8;
      if (*a3 >= *a2) {
        return result;
      }
      long long v5 = *(_OWORD *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
    }
    else
    {
      long long v5 = *(_OWORD *)result;
      *(_OWORD *)uint64_t result = *(_OWORD *)a3;
    }
    *(_OWORD *)a3 = v5;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[PKStrokeMask calculateCenterlineSlices:]::$_0 &,_PKFloatRange *>(long long *a1, double *a2)
{
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 4;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      long long v6 = a2 - 2;
      if (*(a2 - 2) < *(double *)a1)
      {
        long long v7 = *a1;
        *a1 = *(_OWORD *)v6;
        *(_OWORD *)long long v6 = v7;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(PKStrokeMask *)(double *)a1 calculateCenterlineSlices:a2 - 2];
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[PKStrokeMask calculateCenterlineSlices:]::$_0 &,_PKFloatRange *>((double *)a1, (double *)a1 + 2, (double *)a1 + 4, (unint64_t *)a2 - 2);
      return 1;
    case 5:
      id v16 = a1 + 1;
      id v17 = a1 + 2;
      char v18 = a1 + 3;
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[PKStrokeMask calculateCenterlineSlices:]::$_0 &,_PKFloatRange *>((double *)a1, (double *)a1 + 2, (double *)a1 + 4, (unint64_t *)a1 + 6);
      double v20 = *(a2 - 2);
      CGFloat v19 = a2 - 2;
      if (v20 < *((double *)a1 + 6))
      {
        long long v21 = *v18;
        *char v18 = *(_OWORD *)v19;
        *(_OWORD *)CGFloat v19 = v21;
        if (*(double *)v18 < *(double *)v17)
        {
          long long v22 = *v17;
          *id v17 = *v18;
          *char v18 = v22;
          if (*(double *)v17 < *(double *)v16)
          {
            long long v23 = *v16;
            *id v16 = *v17;
            *id v17 = v23;
            if (*((double *)a1 + 2) < *(double *)a1)
            {
              long long v24 = *a1;
              *a1 = *v16;
              *id v16 = v24;
            }
          }
        }
      }
      return 1;
    default:
      long long v8 = (double *)(a1 + 2);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(PKStrokeMask *)(double *)a1 calculateCenterlineSlices:(double *)a1 + 4];
      char v9 = (double *)(a1 + 3);
      if (a1 + 3 == (long long *)a2) {
        return 1;
      }
      uint64_t v10 = 0;
      int v11 = 0;
      break;
  }
  while (1)
  {
    long long v12 = *(_OWORD *)v9;
    if (*v9 < *v8)
    {
      uint64_t v13 = v10;
      while (1)
      {
        *(long long *)((char *)a1 + v13 + 48) = *(long long *)((char *)a1 + v13 + 32);
        if (v13 == -32) {
          break;
        }
        double v14 = *(double *)((char *)a1 + v13 + 16);
        v13 -= 16;
        if (*(double *)&v12 >= v14)
        {
          char v15 = (long long *)((char *)a1 + v13 + 48);
          goto LABEL_13;
        }
      }
      char v15 = a1;
LABEL_13:
      *char v15 = v12;
      if (++v11 == 8) {
        return v9 + 2 == a2;
      }
    }
    long long v8 = v9;
    v10 += 16;
    v9 += 2;
    if (v9 == a2) {
      return 1;
    }
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[PKStrokeMask calculateCenterlineSlices:]::$_0 &,_PKFloatRange *>(double *a1, double *a2, double *a3, unint64_t *a4)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(PKStrokeMask *)a1 calculateCenterlineSlices:a3];
  result.n128_u64[0] = *a4;
  if (*(double *)a4 < *a3)
  {
    __n128 result = *(__n128 *)a3;
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(__n128 *)a4 = result;
    result.n128_f64[0] = *a3;
    if (*a3 < *a2)
    {
      __n128 result = *(__n128 *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(__n128 *)a3 = result;
      result.n128_f64[0] = *a2;
      if (*a2 < *a1)
      {
        __n128 result = *(__n128 *)a1;
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(__n128 *)a2 = result;
      }
    }
  }
  return result;
}

uint64_t legacy_drawing::Parameters::Parameters(uint64_t this)
{
  *(void *)this = &unk_1F1FB0468;
  *(_DWORD *)(this + 20) = 0;
  return this;
}

{
  *(void *)this = &unk_1F1FB0468;
  *(_DWORD *)(this + 20) = 0;
  return this;
}

void legacy_drawing::Parameters::~Parameters(legacy_drawing::Parameters *this)
{
  PB::Base::~Base(this);

  JUMPOUT(0x1C8783F10);
}

float legacy_drawing::Parameters::Parameters(legacy_drawing::Parameters *this, const legacy_drawing::Parameters *a2)
{
  *(void *)this = &unk_1F1FB0468;
  *((_DWORD *)this + 5) = 0;
  char v2 = *((unsigned char *)a2 + 20);
  if (v2)
  {
    float result = *((float *)a2 + 2);
    char v3 = 1;
    *((unsigned char *)this + 20) = 1;
    *((float *)this + 2) = result;
    char v2 = *((unsigned char *)a2 + 20);
    if ((v2 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v3 = 0;
  if ((*((unsigned char *)a2 + 20) & 2) != 0)
  {
LABEL_5:
    float result = *((float *)a2 + 3);
    v3 |= 2u;
    *((unsigned char *)this + 20) = v3;
    *((float *)this + 3) = result;
    char v2 = *((unsigned char *)a2 + 20);
  }
LABEL_6:
  if ((v2 & 4) != 0)
  {
    float result = *((float *)a2 + 4);
    *((unsigned char *)this + 20) = v3 | 4;
    *((float *)this + 4) = result;
  }
  return result;
}

uint64_t legacy_drawing::Parameters::operator=(uint64_t a1, const legacy_drawing::Parameters *a2)
{
  if ((const legacy_drawing::Parameters *)a1 != a2)
  {
    legacy_drawing::Parameters::Parameters((legacy_drawing::Parameters *)v7, a2);
    int v3 = *(_DWORD *)(a1 + 20);
    *(_DWORD *)(a1 + 20) = v10;
    int v10 = v3;
    uint64_t v4 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v8;
    uint64_t v8 = v4;
    int v5 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)(a1 + 16) = v9;
    int v9 = v5;
    PB::Base::~Base((PB::Base *)v7);
  }
  return a1;
}

float legacy_drawing::swap(legacy_drawing *this, legacy_drawing::Parameters *a2, legacy_drawing::Parameters *a3)
{
  int v3 = *((_DWORD *)this + 5);
  *((_DWORD *)this + 5) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v3;
  int v4 = *((_DWORD *)this + 2);
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  *((_DWORD *)a2 + 2) = v4;
  int v5 = *((_DWORD *)this + 3);
  *((_DWORD *)this + 3) = *((_DWORD *)a2 + 3);
  *((_DWORD *)a2 + 3) = v5;
  float result = *((float *)this + 4);
  *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
  *((float *)a2 + 4) = result;
  return result;
}

float legacy_drawing::Parameters::Parameters(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F1FB0468;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 20) = 0;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  float result = *(float *)(a2 + 16);
  *(float *)(a1 + 16) = result;
  return result;
}

{
  float result;

  *(void *)a1 = &unk_1F1FB0468;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 20) = 0;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  float result = *(float *)(a2 + 16);
  *(float *)(a1 + 16) = result;
  return result;
}

uint64_t legacy_drawing::Parameters::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    v8[0] = &unk_1F1FB0468;
    int v3 = *(_DWORD *)(a2 + 20);
    *(_DWORD *)(a2 + 20) = 0;
    int v4 = *(_DWORD *)(a2 + 16);
    int v10 = *(_DWORD *)(a1 + 20);
    uint64_t v5 = *(void *)(a1 + 8);
    uint64_t v6 = *(void *)(a2 + 8);
    *(_DWORD *)(a1 + 20) = v3;
    *(void *)(a1 + 8) = v6;
    v8[1] = v5;
    LODWORD(v5) = *(_DWORD *)(a1 + 16);
    *(_DWORD *)(a1 + 16) = v4;
    int v9 = v5;
    PB::Base::~Base((PB::Base *)v8);
  }
  return a1;
}

uint64_t legacy_drawing::Parameters::formatText(legacy_drawing::Parameters *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 20);
  if (v5)
  {
    PB::TextFormatter::format(a2, "baseAlpha", *((float *)this + 2));
    char v5 = *((unsigned char *)this + 20);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)this + 20) & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "blendAlpha", *((float *)this + 3));
  if ((*((unsigned char *)this + 20) & 4) != 0) {
LABEL_4:
  }
    PB::TextFormatter::format(a2, "targetMultiple", *((float *)this + 4));
LABEL_5:

  return MEMORY[0x1F4147498](a2);
}

uint64_t legacy_drawing::Parameters::readFrom(legacy_drawing::Parameters *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    do
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        char v15 = 0;
        unsigned int v16 = 0;
        unint64_t v11 = 0;
        if (v2 > v3) {
          unint64_t v3 = v2;
        }
        while (v3 != v2)
        {
          unint64_t v17 = v2 + 1;
          char v18 = *(unsigned char *)(v8 + v2);
          *((void *)a2 + 1) = v17;
          v11 |= (unint64_t)(v18 & 0x7F) << v15;
          if ((v18 & 0x80) == 0) {
            goto LABEL_20;
          }
          v15 += 7;
          unint64_t v2 = v17;
          BOOL v14 = v16++ > 8;
          if (v14) {
            goto LABEL_27;
          }
        }
        int v4 = 1;
        *((unsigned char *)a2 + 24) = 1;
        return v4 == 0;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_27;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v19 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        *((unsigned char *)this + 20) |= 4u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2)) {
          goto LABEL_34;
        }
        *((_DWORD *)this + 4) = *(_DWORD *)(*(void *)a2 + v2);
      }
      else if (v19 == 2)
      {
        *((unsigned char *)this + 20) |= 2u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2)) {
          goto LABEL_34;
        }
        *((_DWORD *)this + 3) = *(_DWORD *)(*(void *)a2 + v2);
      }
      else
      {
        if (v19 != 1)
        {
LABEL_27:
          uint64_t result = PB::Reader::skip(a2);
          if (!result) {
            return result;
          }
          unint64_t v2 = *((void *)a2 + 1);
          goto LABEL_37;
        }
        *((unsigned char *)this + 20) |= 1u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2))
        {
LABEL_34:
          *((unsigned char *)a2 + 24) = 1;
          goto LABEL_37;
        }
        *((_DWORD *)this + 2) = *(_DWORD *)(*(void *)a2 + v2);
      }
      unint64_t v2 = *((void *)a2 + 1) + 4;
      *((void *)a2 + 1) = v2;
LABEL_37:
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
    }
    while (v2 < v3 && !*((unsigned char *)a2 + 24));
  }
  return v4 == 0;
}

uint64_t legacy_drawing::Parameters::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  char v4 = *(unsigned char *)(this + 20);
  if ((v4 & 1) == 0)
  {
    if ((*(unsigned char *)(this + 20) & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    this = PB::Writer::write(a2, *(float *)(v3 + 12));
    if ((*(unsigned char *)(v3 + 20) & 4) == 0) {
      return this;
    }
    goto LABEL_7;
  }
  this = PB::Writer::write(a2, *(float *)(this + 8));
  char v4 = *(unsigned char *)(v3 + 20);
  if ((v4 & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v4 & 4) == 0) {
    return this;
  }
LABEL_7:
  float v5 = *(float *)(v3 + 16);

  return PB::Writer::write(a2, v5);
}

BOOL legacy_drawing::Parameters::operator==(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 20))
  {
    if ((*(unsigned char *)(a2 + 20) & 1) == 0 || *(float *)(a1 + 8) != *(float *)(a2 + 8)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 20))
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 20) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 20) & 2) == 0 || *(float *)(a1 + 12) != *(float *)(a2 + 12)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 20) & 2) != 0)
  {
    return 0;
  }
  BOOL v2 = (*(unsigned char *)(a2 + 20) & 4) == 0;
  if ((*(unsigned char *)(a1 + 20) & 4) != 0) {
    return (*(unsigned char *)(a2 + 20) & 4) != 0 && *(float *)(a1 + 16) == *(float *)(a2 + 16);
  }
  return v2;
}

uint64_t legacy_drawing::Parameters::hash_value(legacy_drawing::Parameters *this)
{
  if (*((unsigned char *)this + 20))
  {
    float v6 = *((float *)this + 2);
    uint64_t v1 = LODWORD(v6);
    if (v6 == 0.0) {
      uint64_t v1 = 0;
    }
    if ((*((unsigned char *)this + 20) & 2) != 0)
    {
LABEL_3:
      float v2 = *((float *)this + 3);
      uint64_t v3 = LODWORD(v2);
      if (v2 == 0.0) {
        uint64_t v3 = 0;
      }
      if ((*((unsigned char *)this + 20) & 4) != 0) {
        goto LABEL_6;
      }
LABEL_13:
      uint64_t v5 = 0;
      return v3 ^ v1 ^ v5;
    }
  }
  else
  {
    uint64_t v1 = 0;
    if ((*((unsigned char *)this + 20) & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*((unsigned char *)this + 20) & 4) == 0) {
    goto LABEL_13;
  }
LABEL_6:
  float v4 = *((float *)this + 4);
  uint64_t v5 = LODWORD(v4);
  if (v4 == 0.0) {
    uint64_t v5 = 0;
  }
  return v3 ^ v1 ^ v5;
}

void sub_1C46C6A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C46C7BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46C7C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46C7CFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46C7D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46C80F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::shared_ptr<std::vector<anonymous namespace'::StrokeVertex>>::shared_ptr[abi:ne180100]<std::vector<anonymous namespace'::StrokeVertex>,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1C46C8194(_Unwind_Exception *exception_object)
{
  if (v1) {
  _Unwind_Resume(exception_object);
  }
}

void std::vector<anonymous namespace'::StrokeVertex>::resize(void **a1, unint64_t a2)
{
  float v4 = (char *)*a1;
  uint64_t v3 = (char *)a1[1];
  unint64_t v5 = 0xCCCCCCCCCCCCCCCDLL * ((v3 - (unsigned char *)*a1) >> 2);
  unint64_t v6 = a2 - v5;
  if (a2 <= v5)
  {
    if (a2 >= v5) {
      return;
    }
    unsigned int v16 = &v4[20 * a2];
    goto LABEL_19;
  }
  long long v7 = a1[2];
  if (0xCCCCCCCCCCCCCCCDLL * ((v7 - v3) >> 2) >= v6)
  {
    unsigned int v16 = &v3[20 * (20 * v6 / 0x14)];
LABEL_19:
    a1[1] = v16;
    return;
  }
  unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((v7 - v4) >> 2);
  unint64_t v9 = 0x999999999999999ALL * ((v7 - v4) >> 2);
  if (v9 <= a2) {
    unint64_t v9 = a2;
  }
  if (v8 >= 0x666666666666666) {
    unint64_t v10 = 0xCCCCCCCCCCCCCCCLL;
  }
  else {
    unint64_t v10 = v9;
  }
  if (v10 > 0xCCCCCCCCCCCCCCCLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  uint64_t v11 = 5 * v10;
  unint64_t v12 = (char *)operator new(20 * v10);
  char v13 = &v12[20 * v5];
  BOOL v14 = &v13[20 * (20 * v6 / 0x14)];
  if (v3 != v4)
  {
    do
    {
      long long v15 = *(_OWORD *)(v3 - 20);
      *((_DWORD *)v13 - 1) = *((_DWORD *)v3 - 1);
      *(_OWORD *)(v13 - 20) = v15;
      v13 -= 20;
      v3 -= 20;
    }
    while (v3 != v4);
    uint64_t v3 = v4;
  }
  *a1 = v13;
  a1[1] = v14;
  a1[2] = &v12[4 * v11];
  if (v3)
  {
    operator delete(v3);
  }
}

void std::vector<PKMetalSDFStrokeVertex>::resize(char **a1)
{
  uint64_t v3 = *a1;
  float v2 = a1[1];
  uint64_t v4 = v2 - *a1;
  unint64_t v5 = 0x8E38E38E38E38E39 * (v4 >> 2);
  if (v5 >> 16)
  {
    if (v4 == 2359296) {
      return;
    }
    char v18 = v3 + 2359296;
    goto LABEL_19;
  }
  unint64_t v6 = a1[2];
  if (0x8E38E38E38E38E39 * ((v6 - v2) >> 2) >= 0x10000 - v5)
  {
    bzero(a1[1], 2359260 - v4 - (2359260 - (int)v4) % 0x24u + 36);
    char v18 = &v2[2359260 - v4 - (2359260 - (int)v4) % 0x24u + 36];
LABEL_19:
    a1[1] = v18;
    return;
  }
  unint64_t v7 = 0x8E38E38E38E38E39 * ((v6 - v3) >> 2);
  unint64_t v8 = 0x1C71C71C71C71C72 * ((v6 - v3) >> 2);
  if (v8 <= 0x10000) {
    unint64_t v8 = 0x10000;
  }
  if (v7 >= 0x38E38E38E38E38ELL) {
    unint64_t v9 = 0x71C71C71C71C71CLL;
  }
  else {
    unint64_t v9 = v8;
  }
  if (v9 > 0x71C71C71C71C71CLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  uint64_t v10 = 9 * v9;
  uint64_t v11 = (char *)operator new(36 * v9);
  unint64_t v12 = &v11[4 * (v4 >> 2)];
  char v13 = &v11[4 * v10];
  size_t v14 = 2359260 - v4 - (2359260 - (int)v4) % 0x24u + 36;
  bzero(v12, v14);
  long long v15 = &v12[v14];
  if (v2 != v3)
  {
    do
    {
      long long v16 = *(_OWORD *)(v2 - 36);
      long long v17 = *(_OWORD *)(v2 - 20);
      *((_DWORD *)v12 - 1) = *((_DWORD *)v2 - 1);
      *(_OWORD *)(v12 - 20) = v17;
      *(_OWORD *)(v12 - 36) = v16;
      v12 -= 36;
      v2 -= 36;
    }
    while (v2 != v3);
    float v2 = v3;
  }
  *a1 = v12;
  a1[1] = v15;
  a1[2] = v13;
  if (v2)
  {
    operator delete(v2);
  }
}

void sub_1C46C8570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PKMetalRenderer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1C46C8674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46C8738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46C88E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46C92C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }

  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::AnimatingStroke::AnimatingStroke(uint64_t a1, PKStroke *a2, int a3, char a4, uint64_t *a5, uint64_t *a6, uint64_t a7)
{
  *(_OWORD *)(a1 + 96) = 0u;
  *(void *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  uint64_t v12 = MEMORY[0x1E4F1DAB8];
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)(a1 + 112) = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)(a1 + 128) = v13;
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(v12 + 32);
  *(void *)(a1 + 160) = 0;
  *(void *)(a1 + 168) = 0;
  *(unsigned char *)(a1 + 176) = 0;
  long long v14 = *MEMORY[0x1E4F1DB20];
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *(_OWORD *)(a1 + 200) = v15;
  *(_OWORD *)(a1 + 184) = v14;
  *(_OWORD *)(a1 + 232) = v15;
  *(_OWORD *)(a1 + 216) = v14;
  *(void *)(a1 + 288) = 0;
  *(void *)(a1 + 312) = 0;
  *(unsigned char *)(a1 + 320) = 0;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_DWORD *)(a1 + 280) = 0;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_DWORD *)(a1 + 335) = 0;
  *(void *)(a1 + 328) = 0;
  *(void *)(a1 + 344) = 0;
  *(void *)(a1 + 352) = 0;
  *(unsigned char *)(a1 + 176) = a3;
  *(_WORD *)(a1 + 284) = 0;
  *(_WORD *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 74) = 0;
  long long v16 = *(void **)(a1 + 288);
  *(void *)(a1 + 288) = 0;

  *(void *)(a1 + 296) = 0;
  *(void *)(a1 + 304) = 0x3FF0000000000000;
  *(unsigned char *)(a1 + 320) = a4;
  uint64_t v18 = *a5;
  uint64_t v17 = a5[1];
  if (v17) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v19 = *(std::__shared_weak_count **)(a1 + 8);
  *(void *)a1 = v18;
  *(void *)(a1 + 8) = v17;
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  uint64_t v21 = *a6;
  uint64_t v20 = a6[1];
  if (v20) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v20 + 8), 1uLL, memory_order_relaxed);
  }
  long long v22 = *(std::__shared_weak_count **)(a1 + 40);
  *(void *)(a1 + 32) = v21;
  *(void *)(a1 + 40) = v20;
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  if (a3) {
    operator new();
  }
  return a1;
}

void sub_1C46C95C4(_Unwind_Exception *a1)
{
  std::unique_ptr<PKMetalInputProvider>::reset[abi:ne180100]((uint64_t *)(v1 + 104), 0);
  uint64_t v4 = *(void *)(v1 + 96);
  *(void *)(v1 + 96) = 0;
  if (v4) {
    std::default_delete<PKBSplineFilter>::operator()[abi:ne180100](v2, v4);
  }

  unint64_t v5 = *(std::__shared_weak_count **)(v1 + 56);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  unint64_t v6 = *(std::__shared_weak_count **)(v1 + 40);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  unint64_t v7 = *(std::__shared_weak_count **)(v1 + 24);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  unint64_t v8 = *(std::__shared_weak_count **)(v1 + 8);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  _Unwind_Resume(a1);
}

void anonymous namespace'::AnimatingStroke::~AnimatingStroke(_anonymous_namespace_::AnimatingStroke *this)
{
  std::unique_ptr<PKMetalInputProvider>::reset[abi:ne180100]((uint64_t *)this + 13, 0);
  uint64_t v2 = *((void *)this + 12);
  *((void *)this + 12) = 0;
  if (v2) {
    std::default_delete<PKBSplineFilter>::operator()[abi:ne180100]((uint64_t)this + 96, v2);
  }

  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  unint64_t v5 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  unint64_t v6 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void sub_1C46C97FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void anonymous namespace'::AnimatingStroke::fetchInput(uint64_t a1, void *a2)
{
  if (a2) {
    operator new();
  }
  uint64_t v3 = *(void **)(a1 + 96);
  if (v3[1]) {
    (*(void (**)(void *))(*v3 + 40))(v3);
  }
}

void sub_1C46C98E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46C99F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46C9CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void anonymous namespace'::AnimatingStroke::unionDirtyRect(_anonymous_namespace_::AnimatingStroke *this, CGRect a2, CGAffineTransform *a3)
{
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v9.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v9.c = v4;
  *(_OWORD *)&v9.tCGFloat x = *(_OWORD *)&a3->tx;
  CGRect v10 = CGRectApplyAffineTransform(a2, &v9);
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  *(CGRect *)((char *)this + 184) = CGRectUnion(*(CGRect *)((char *)this + 184), v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  *(CGRect *)((char *)this + 216) = CGRectUnion(*(CGRect *)((char *)this + 216), v11);
}

void sub_1C46C9E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46CA3B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void anonymous namespace'::AnimatingStroke::setTemporaryStrokeBuffers(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(a3 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v6 = (std::__shared_weak_count *)a1[3];
  a1[2] = a2;
  a1[3] = a3;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  uint64_t v8 = *a4;
  uint64_t v7 = a4[1];
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  CGAffineTransform v9 = (std::__shared_weak_count *)a1[7];
  a1[6] = v8;
  a1[7] = v7;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  a1[8] = a1[41];
  a1[41] = 0;
}

void sub_1C46CA584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46CB570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1C46CB848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void anonymous namespace'::AnimatingStroke::resetTemporaryStrokeBuffers(_anonymous_namespace_::AnimatingStroke *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 3);
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 7);
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  *((void *)this + 41) = *((void *)this + 8);
}

BOOL anonymous namespace'::scissorRectFromCGRect(_anonymous_namespace_ *this, CGRect a2, CGSize a3)
{
  v10.size.double height = a3.height;
  v10.size.double width = a3.width;
  v10.origin.double x = 0.0;
  v10.origin.double y = 0.0;
  CGRect v9 = CGRectIntersection(a2, v10);
  double x = v9.origin.x;
  double y = v9.origin.y;
  double width = v9.size.width;
  double height = v9.size.height;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  BOOL result = CGRectIsNull(v9);
  if (!result)
  {
    *(void *)this = (unint64_t)x;
    *((void *)this + 1) = (unint64_t)y;
    *((void *)this + 2) = (unint64_t)width;
    *((void *)this + 3) = (unint64_t)height;
  }
  return result;
}

void sub_1C46CBAD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46CD3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *a49)
{
  _Block_object_dispose(&STACK[0x2C0], 8);
  CGRect v50 = (void *)STACK[0x2F0];
  if (STACK[0x2F0])
  {
    STACK[0x2F8] = (unint64_t)v50;
    operator delete(v50);
  }

  uint64_t v51 = STACK[0x308];
  STACK[0x308] = 0;
  if (v51) {
    std::default_delete<PKBSplineFilter>::operator()[abi:ne180100]((uint64_t)&STACK[0x308], v51);
  }

  _Unwind_Resume(a1);
}

void sub_1C46CDAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  for (uint64_t i = 16; i != -16; i -= 16)

  _Unwind_Resume(a1);
}

void anonymous namespace'::RendererFramebuffer::~RendererFramebuffer(_anonymous_namespace_::RendererFramebuffer *this)
{
  if (*((unsigned char *)this + 8)) {
    -[PKMetalFramebuffer decrementNonPurgeableCount](*(unsigned char **)this);
  }
}

id *anonymous namespace'::RendererFramebuffer::operator=(id *a1, uint64_t a2)
{
  *((unsigned char *)a1 + 8) = 0;
  if (*(unsigned char *)(a2 + 8)) {
    *((unsigned char *)a1 + 8) = -[PKMetalFramebuffer incrementNonPurgeableCount](*a1);
  }
  return a1;
}

void anonymous namespace'::RendererFramebuffer::reset(_anonymous_namespace_::RendererFramebuffer *this)
{
  if (*((unsigned char *)this + 8)) {
    -[PKMetalFramebuffer decrementNonPurgeableCount](*(unsigned char **)this);
  }
  uint64_t v2 = *(void **)this;
  *(void *)this = 0;

  *((unsigned char *)this + 8) = 0;
}

void sub_1C46CDD7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46CE130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46CE4D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46CEC94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, id *a14)
{
  _Unwind_Resume(a1);
}

void anonymous namespace'::RenderStateConfig::~RenderStateConfig(id *this)
{
}

void sub_1C46CEFA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46D0520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,uint64_t a26,void *a27)
{
  _Unwind_Resume(a1);
}

void sub_1C46D0E14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46D1014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46D13C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46D14D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46D3EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  _Unwind_Resume(a1);
}

void sub_1C46D4468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void anonymous namespace'::AnimatingStroke::setStroke(_anonymous_namespace_::AnimatingStroke *this, PKStroke *a2, uint64_t a3)
{
  uint64_t v8 = a2;
  objc_storeStrong((id *)this + 10, a2);
  unsigned int v6 = vcvtd_n_u64_f64((double)(1664525 * [*((id *)this + 10) randomSeed] + 1013904223) / 4294967300.0, 0xCuLL);
  *(int32x4_t *)((char *)this + 264) = vdupq_n_s32(v6);
  *((_DWORD *)this + 70) = v6;
  uint64_t v7 = *((void *)this + 12);
  if (v7) {
    *(void *)(v7 + 144) = a3;
  }
}

void sub_1C46D4540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46D4760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1C46D48EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46D4ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1C46D5068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id a15)
{
  _Unwind_Resume(a1);
}

void sub_1C46D5414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46D5574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46D56A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46D5754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46D5A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1C46D5E88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46D5F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

double anonymous namespace'::matrixFromAffineTransform(_anonymous_namespace_ *this, const CGAffineTransform *a2)
{
  memset(&v9, 0, sizeof(v9));
  long long v2 = *((_OWORD *)this + 1);
  *(_OWORD *)&v8.a = *(_OWORD *)this;
  *(_OWORD *)&v8.c = v2;
  *(_OWORD *)&v8.tdouble x = *((_OWORD *)this + 2);
  uint64_t v3 = &v9;
  CATransform3DMakeAffineTransform(&v9, &v8);
  uint64_t v4 = 0;
  memset(v10, 0, sizeof(v10));
  do
  {
    float64x2_t v6 = *(float64x2_t *)&v3->m11;
    float64x2_t v5 = *(float64x2_t *)&v3->m13;
    uint64_t v3 = (CATransform3D *)((char *)v3 + 32);
    v10[v4++] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v6), v5);
  }
  while (v4 != 4);
  return *(double *)v10;
}

uint64_t anonymous namespace'::AnimatingStroke::strokeBufferBytesAtIndex(_anonymous_namespace_::AnimatingStroke *this, uint64_t a2)
{
                                                                            + 10)))
  {
    uint64_t v4 = (uint64_t *)*((void *)this + 6);
    if (!v4) {
      uint64_t v4 = (uint64_t *)*((void *)this + 4);
    }
    uint64_t v5 = *v4;
    uint64_t v6 = 36;
  }
  else
  {
    uint64_t v7 = (uint64_t *)*((void *)this + 2);
    if (!v7) {
      uint64_t v7 = *(uint64_t **)this;
    }
    uint64_t v5 = *v7;
    uint64_t v6 = 20;
  }
  return v5 + a2 * v6;
}

void sub_1C46D63B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::RendererFramebuffer::RendererFramebuffer(uint64_t a1, void *a2, void *a3, char a4, double a5, double a6)
{
  id v11 = a3;
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 0;
  uint64_t v12 = [(id *)[PKMetalFramebuffer alloc] initWithSize:v11 pixelFormat:a4 device:0 memoryless:(void *)1 backedByIOSurface:1 sampleCount:a5 purgeable:a6];
  long long v13 = *(void **)a1;
  *(void *)a1 = v12;

  *(unsigned char *)(a1 + 8) = 0;
  return a1;
}

void sub_1C46D6468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46D6618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46D69B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

float anonymous namespace'::addCircleToVertices(uint64_t *a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17)
{
  _S16 = a17;
  double v18 = a3 + (a7 - a5) * a9;
  double v19 = a3 + (-a5 - a7) * a9;
  double v20 = a4 + (-a6 - a8) * a9;
  double v21 = a3 + (a5 + a7) * a9;
  double v22 = a4 + (a6 + a8) * a9;
  double v23 = a5 - a7;
  float v24 = v18;
  *(float *)&double v18 = a4 + (a8 - a6) * a9;
  _S20 = a9;
  __asm { FCVT            H20, S20 }
  uint64_t v30 = *a1;
  uint64_t v31 = a2 + 20 * *a1;
  *(float *)uint64_t v31 = v24;
  *(_DWORD *)(v31 + 4) = LODWORD(v18);
  *(short float *)(v31 + 8) = -*(short float *)&_S20;
  double v32 = a6 - a8;
  _S4 = a10;
  __asm
  {
    FCVT            H4, S4
    FCVT            H5, S16
  }
  *(short float *)(v31 + 10) = -*(short float *)&_S20;
  *(_WORD *)(v31 + 12) = LOWORD(_S20);
  *(_WORD *)(v31 + 14) = LOWORD(_S4);
  *(_WORD *)(v31 + 16) = _H5;
  *(_WORD *)(v31 + 18) = 0;
  float v35 = v19;
  *(float *)&double v19 = v20;
  *(float *)(v31 + 20) = v35;
  *(_DWORD *)(v31 + 24) = LODWORD(v19);
  *(short float *)(v31 + 28) = -*(short float *)&_S20;
  *(_WORD *)(v31 + 30) = LOWORD(_S20);
  *(_WORD *)(v31 + 32) = LOWORD(_S20);
  double v36 = v32 * a9;
  double v37 = a3 + v23 * a9;
  *(_WORD *)(v31 + 34) = LOWORD(_S4);
  *(_WORD *)(v31 + 36) = _H5;
  *(_WORD *)(v31 + 38) = 0;
  *(float *)&double v23 = v21;
  float v38 = v22;
  *(_DWORD *)(v31 + 40) = LODWORD(v23);
  *(float *)(v31 + 44) = v38;
  *(_WORD *)(v31 + 48) = LOWORD(_S20);
  *(short float *)(v31 + 50) = -*(short float *)&_S20;
  *(_WORD *)(v31 + 52) = LOWORD(_S20);
  *(_WORD *)(v31 + 54) = LOWORD(_S4);
  *(_WORD *)(v31 + 56) = _H5;
  *(_WORD *)(v31 + 58) = 0;
  float result = v37;
  *a1 = v30 + 4;
  float v40 = a4 + v36;
  *(float *)(v31 + 60) = result;
  *(float *)(v31 + 64) = v40;
  *(_WORD *)(v31 + 68) = LOWORD(_S20);
  *(_WORD *)(v31 + 70) = LOWORD(_S20);
  *(_WORD *)(v31 + 72) = LOWORD(_S20);
  *(_WORD *)(v31 + 74) = LOWORD(_S4);
  *(_WORD *)(v31 + 76) = _H5;
  *(_WORD *)(v31 + 78) = 0;
  return result;
}

void sub_1C46D6C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46D6EB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46D712C(_Unwind_Exception *a1)
{
  if (!v4) {

  }
  _Unwind_Resume(a1);
}

void sub_1C46D721C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1C46D74F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1C46D7718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46D7C14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::AnimatingStroke::isSDFPenStroke(_anonymous_namespace_::AnimatingStroke *this)
{
  uint64_t v1 = [(_anonymous_namespace_::AnimatingStroke *)this ink];
  long long v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 _isFountainPenInkV2];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_1C46D7D00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46D7FB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46D8540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46D89F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1C46D90A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1C46D9830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46DA568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  _Unwind_Resume(a1);
}

void sub_1C46DA6DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46DA9F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46DAB80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46DAD08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1C46DB6E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__20(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  long long v4 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v4;
  *(_OWORD *)(a1 + 48) = v2;
  *(_OWORD *)(a1 + 64) = v3;
  __n128 result = *(__n128 *)(a2 + 112);
  long long v6 = *(_OWORD *)(a2 + 128);
  long long v7 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v7;
  *(__n128 *)(a1 + 112) = result;
  *(_OWORD *)(a1 + 128) = v6;
  return result;
}

__n128 __Block_byref_object_copy__108(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_1C46DB9CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__113(uint64_t result, uint64_t a2)
{
  *(void *)(result + 48) = *(void *)(a2 + 48);
  return result;
}

void sub_1C46DBACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46DC384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void PKBSplineFilter::copyPointsFromStroke(uint64_t a1, void *a2, PKInk *a3, char **a4)
{
  id v7 = a2;
  PKBSplineFilter::configureForInk((PKBSplineFilter *)a1, a3);
  id v8 = v7;
  double v29 = &unk_1F1FB00A8;
  id v30 = v8;
  std::vector<_PKStrokePoint>::resize(a1 + 48, 0);
  PKStrokeInputProvider::copyUpdatedRangeFromIndex((uint64_t)&v29, 0, (void *)(a1 + 48));
  int64_t v9 = *(void *)(a1 + 56) - *(void *)(a1 + 48);
  unint64_t v10 = 0x2E8BA2E8BA2E8BA3 * (v9 >> 3);
  *(void *)(a1 + 72) = v10;
  std::vector<_PKStrokePoint>::resize(a1 + 80, v10);
  memcpy(*(void **)(a1 + 80), *(const void **)(a1 + 48), v9);
  if (v9 < 89) {
    goto LABEL_23;
  }
  unint64_t v11 = v10 - 1;
  uint64_t v12 = *a4;
  long long v13 = a4[1];
  unint64_t v14 = (v13 - *a4) >> 2;
  if (v11 <= v14)
  {
    if (v11 >= v14) {
      goto LABEL_20;
    }
    CGFloat v25 = &v12[4 * v11];
  }
  else
  {
    unint64_t v15 = v11 - v14;
    long long v16 = a4[2];
    if (v11 - v14 > (v16 - v13) >> 2)
    {
      if (v11 >> 62) {
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v17 = v16 - v12;
      uint64_t v18 = v17 >> 1;
      if (v17 >> 1 <= v11) {
        uint64_t v18 = v11;
      }
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v19 = v18;
      }
      if (v19 >> 62) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      double v20 = (char *)operator new(4 * v19);
      double v21 = &v20[4 * v14];
      double v22 = &v20[4 * v19];
      bzero(v21, 4 * v15);
      double v23 = &v21[4 * v15];
      while (v13 != v12)
      {
        int v24 = *((_DWORD *)v13 - 1);
        v13 -= 4;
        *((_DWORD *)v21 - 1) = v24;
        v21 -= 4;
      }
      *a4 = v21;
      a4[1] = v23;
      a4[2] = v22;
      if (v12) {
        operator delete(v12);
      }
      goto LABEL_20;
    }
    bzero(a4[1], 4 * v15);
    CGFloat v25 = &v13[4 * v15];
  }
  a4[1] = v25;
LABEL_20:
  PKBSplineFilter::calculateVStartAndVEnd((PKBSplineFilter *)a1, &v28, &v27);
  if (v11)
  {
    for (uint64_t i = 0; i != v11; ++i)
      *(_DWORD *)&(*a4)[4 * i] = PKBSplineFilter::calculateStepsForSegment((PKBSplineFilter *)a1, i, &v28, &v27);
  }
LABEL_23:
}

void sub_1C46DC660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46DD234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1C46DD72C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__124(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__125(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_1C46DDD78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1C46DDE10()
{
}

void sub_1C46DDE18()
{
}

void sub_1C46DE0C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46DE334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46DEDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,void *a62)
{
  _Unwind_Resume(a1);
}

void sub_1C46DF01C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46DF130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46DF2AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46DF3D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46DF470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);

  _Unwind_Resume(a1);
}

void sub_1C46DF7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, char a16)
{
  uint64_t v18 = *(void *)(v16 - 112);
  *(void *)(v16 - 112) = 0;
  if (v18) {
    std::default_delete<PKBSplineFilter>::operator()[abi:ne180100](v16 - 112, v18);
  }

  _Unwind_Resume(a1);
}

void sub_1C46DF99C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46E00FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1C46E0280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46E0434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46E0940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1C46E0A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46E0BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46E0D90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46E0E24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<PKMetalInputProvider>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *__n128 result = a2;
  if (v2)
  {

    JUMPOUT(0x1C8783F10);
  }
  return result;
}

uint64_t PKMetalInputProvider::copyUpdatedRangeFromIndex(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v3 = *(void **)(a1 + 8);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___ZN20PKMetalInputProvider25copyUpdatedRangeFromIndexEmPNSt3__16vectorI14_PKStrokePointNS0_9allocatorIS2_EEEE_block_invoke;
  v5[3] = &__block_descriptor_48_e46____PKStrokePoint_d_CGPoint_dd_dddddddd_16__0q8l;
  v5[4] = a3;
  v5[5] = a2;
  return [v3 fetchFilteredPointsFromIndex:a2 accessBlock:v5];
}

uint64_t ___ZN20PKMetalInputProvider25copyUpdatedRangeFromIndexEmPNSt3__16vectorI14_PKStrokePointNS0_9allocatorIS2_EEEE_block_invoke(uint64_t a1, unint64_t a2)
{
  return **(void **)(a1 + 32) + 88 * *(void *)(a1 + 40);
}

void std::__shared_ptr_pointer<std::vector<anonymous namespace'::StrokeVertex> *,std::shared_ptr<std::vector<anonymous namespace'::StrokeVertex>>::__shared_ptr_default_delete<std::vector<anonymous namespace'::StrokeVertex>,std::vector<anonymous namespace'::StrokeVertex>>,std::allocator<std::vector<anonymous namespace'::StrokeVertex>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1C8783F10);
}

void **std::__shared_ptr_pointer<std::vector<anonymous namespace'::StrokeVertex> *,std::shared_ptr<std::vector<anonymous namespace'::StrokeVertex>>::__shared_ptr_default_delete<std::vector<anonymous namespace'::StrokeVertex>,std::vector<anonymous namespace'::StrokeVertex>>,std::allocator<std::vector<anonymous namespace'::StrokeVertex>>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<std::vector<anonymous namespace'::StrokeVertex> *,std::shared_ptr<std::vector<anonymous namespace'::StrokeVertex>>::__shared_ptr_default_delete<std::vector<anonymous namespace'::StrokeVertex>,std::vector<anonymous namespace'::StrokeVertex>>,std::allocator<std::vector<anonymous namespace'::StrokeVertex>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void **std::default_delete<std::vector<anonymous namespace'::StrokeVertex>>::operator()[abi:ne180100](void **result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *result;
    if (v2)
    {
      v1[1] = v2;
      operator delete(v2);
    }
    JUMPOUT(0x1C8783F10);
  }
  return result;
}

void std::shared_ptr<std::vector<PKMetalSDFStrokeVertex>>::shared_ptr[abi:ne180100]<std::vector<PKMetalSDFStrokeVertex>,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1C46E12FC(_Unwind_Exception *exception_object)
{
  if (v1) {
  _Unwind_Resume(exception_object);
  }
}

void std::__shared_ptr_pointer<std::vector<PKMetalSDFStrokeVertex> *,std::shared_ptr<std::vector<PKMetalSDFStrokeVertex>>::__shared_ptr_default_delete<std::vector<PKMetalSDFStrokeVertex>,std::vector<PKMetalSDFStrokeVertex>>,std::allocator<std::vector<PKMetalSDFStrokeVertex>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1C8783F10);
}

void **std::__shared_ptr_pointer<std::vector<PKMetalSDFStrokeVertex> *,std::shared_ptr<std::vector<PKMetalSDFStrokeVertex>>::__shared_ptr_default_delete<std::vector<PKMetalSDFStrokeVertex>,std::vector<PKMetalSDFStrokeVertex>>,std::allocator<std::vector<PKMetalSDFStrokeVertex>>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<std::vector<PKMetalSDFStrokeVertex> *,std::shared_ptr<std::vector<PKMetalSDFStrokeVertex>>::__shared_ptr_default_delete<std::vector<PKMetalSDFStrokeVertex>,std::vector<PKMetalSDFStrokeVertex>>,std::allocator<std::vector<PKMetalSDFStrokeVertex>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t drawing::Ink::Ink(uint64_t this)
{
  *(void *)(this + 80) = 0;
  *(void *)(this + 88) = 0;
  *(_DWORD *)(this + 72) = 0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F1FB0778;
  *(void *)(this + 40) = 0;
  *(void *)(this + 48) = 0;
  *(void *)(this + 32) = 0;
  return this;
}

{
  *(void *)(this + 80) = 0;
  *(void *)(this + 88) = 0;
  *(_DWORD *)(this + 72) = 0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F1FB0778;
  *(void *)(this + 40) = 0;
  *(void *)(this + 48) = 0;
  *(void *)(this + 32) = 0;
  return this;
}

void drawing::Ink::~Ink(drawing::Ink *this)
{
  *(void *)this = &unk_1F1FB0778;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 11);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *((void *)this + 6);
  *((void *)this + 6) = 0;
  if (v3) {
    std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)this + 48, v3);
  }
  uint64_t v4 = *((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  uint64_t v6 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v6) {
    std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)this + 16, v6);
  }
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }

  PB::Base::~Base(this);
}

{
  uint64_t vars8;

  drawing::Ink::~Ink(this);

  JUMPOUT(0x1C8783F10);
}

drawing::Ink *drawing::Ink::Ink(drawing::Ink *this, const drawing::Ink *a2)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 6) = 0;
  *(void *)this = &unk_1F1FB0778;
  *((void *)this + 10) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 5) = 0;
  uint64_t v4 = *((void *)a2 + 10);
  uint64_t v5 = *((void *)a2 + 11);
  if (v5)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 11);
    *((void *)this + 10) = v4;
    *((void *)this + 11) = v5;
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
  else
  {
    *((void *)this + 10) = v4;
    *((void *)this + 11) = 0;
  }
  *((_DWORD *)this + 18) = 0;
  if (*((void *)a2 + 1)) {
    operator new();
  }
  if (*((void *)a2 + 2)) {
    operator new();
  }
  if ((*((unsigned char *)a2 + 72) & 2) != 0)
  {
    uint64_t v7 = *((void *)a2 + 7);
    *((unsigned char *)this + 72) |= 2u;
    *((void *)this + 7) = v7;
  }
  if (*((void *)a2 + 6)) {
    operator new();
  }
  if (*((void *)a2 + 4)) {
    operator new();
  }
  if (*((void *)a2 + 5)) {
    operator new();
  }
  char v8 = *((unsigned char *)a2 + 72);
  if (v8)
  {
    uint64_t v9 = *((void *)a2 + 3);
    *((unsigned char *)this + 72) |= 1u;
    *((void *)this + 3) = v9;
    char v8 = *((unsigned char *)a2 + 72);
  }
  if ((v8 & 4) != 0)
  {
    uint64_t v10 = *((void *)a2 + 8);
    *((unsigned char *)this + 72) |= 4u;
    *((void *)this + 8) = v10;
  }
  return this;
}

uint64_t drawing::Ink::operator=(uint64_t a1, const drawing::Ink *a2)
{
  if ((const drawing::Ink *)a1 != a2)
  {
    drawing::Ink::Ink((drawing::Ink *)&v13, a2);
    int v3 = *(_DWORD *)(a1 + 72);
    *(_DWORD *)(a1 + 72) = v20;
    int v20 = v3;
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v6 = v18;
    *(void *)(a1 + 48) = v17;
    *(void *)(a1 + 56) = v6;
    long long v7 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(a1 + 80) = v21;
    long long v21 = v7;
    long long v8 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v14;
    long long v14 = v8;
    uint64_t v17 = v5;
    uint64_t v18 = v4;
    long long v9 = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(a1 + 32) = v16;
    long long v16 = v9;
    uint64_t v10 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = v15;
    uint64_t v15 = v10;
    uint64_t v11 = *(void *)(a1 + 64);
    *(void *)(a1 + 64) = v19;
    uint64_t v19 = v11;
    drawing::Ink::~Ink((drawing::Ink *)&v13);
  }
  return a1;
}

double drawing::swap(drawing *this, drawing::Ink *a2, drawing::Ink *a3)
{
  uint64_t v3 = *((void *)this + 10);
  *((void *)this + 10) = *((void *)a2 + 10);
  *((void *)a2 + 10) = v3;
  uint64_t v4 = *((void *)this + 11);
  *((void *)this + 11) = *((void *)a2 + 11);
  *((void *)a2 + 11) = v4;
  LODWORD(v4) = *((_DWORD *)this + 18);
  *((_DWORD *)this + 18) = *((_DWORD *)a2 + 18);
  *((_DWORD *)a2 + 18) = v4;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v5;
  uint64_t v6 = *((void *)this + 7);
  *((void *)this + 7) = *((void *)a2 + 7);
  *((void *)a2 + 7) = v6;
  uint64_t v7 = *((void *)this + 2);
  uint64_t v8 = *((void *)this + 3);
  uint64_t v9 = *((void *)a2 + 3);
  *((void *)this + 2) = *((void *)a2 + 2);
  *((void *)this + 3) = v9;
  *((void *)a2 + 2) = v7;
  uint64_t v10 = *((void *)this + 6);
  *((void *)this + 6) = *((void *)a2 + 6);
  *((void *)a2 + 6) = v10;
  uint64_t v11 = *((void *)this + 4);
  *((void *)this + 4) = *((void *)a2 + 4);
  *((void *)a2 + 4) = v11;
  uint64_t v12 = *((void *)this + 5);
  *((void *)this + 5) = *((void *)a2 + 5);
  *((void *)a2 + 5) = v12;
  *((void *)a2 + 3) = v8;
  double result = *((double *)this + 8);
  *((void *)this + 8) = *((void *)a2 + 8);
  *((double *)a2 + 8) = result;
  return result;
}

uint64_t drawing::Ink::Ink(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 16);
  *(void *)(a1 + 32) = 0;
  uint64_t v5 = (uint64_t *)(a1 + 32);
  *(void *)(a1 + 48) = 0;
  uint64_t v6 = a1 + 48;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)a1 = &unk_1F1FB0778;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 40) = 0;
  long long v7 = *(_OWORD *)(a2 + 80);
  *(void *)(a2 + 80) = 0;
  *(void *)(a2 + 88) = 0;
  uint64_t v8 = *(std::__shared_weak_count **)(a1 + 88);
  *(_OWORD *)(a1 + 80) = v7;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(_DWORD *)(a2 + 72) = 0;
  uint64_t v9 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v10 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v9;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  uint64_t v11 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v12 = *v4;
  *uint64_t v4 = v11;
  if (v12) {
    std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)v4, v12);
  }
  uint64_t v14 = *(void *)(a2 + 48);
  uint64_t v13 = *(void *)(a2 + 56);
  *(void *)(a2 + 48) = 0;
  uint64_t v15 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v14;
  *(void *)(a1 + 56) = v13;
  if (v15) {
    std::default_delete<std::string>::operator()[abi:ne180100](v6, v15);
  }
  uint64_t v16 = *(void *)(a2 + 32);
  *(void *)(a2 + 32) = 0;
  uint64_t v17 = *v5;
  *uint64_t v5 = v16;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
  uint64_t v18 = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  uint64_t v19 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v18;
  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
  }
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

uint64_t drawing::Ink::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    drawing::Ink::Ink((uint64_t)&v13, a2);
    int v3 = *(_DWORD *)(a1 + 72);
    *(_DWORD *)(a1 + 72) = v20;
    int v20 = v3;
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v6 = v18;
    *(void *)(a1 + 48) = v17;
    *(void *)(a1 + 56) = v6;
    long long v7 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(a1 + 80) = v21;
    long long v21 = v7;
    long long v8 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v14;
    long long v14 = v8;
    uint64_t v17 = v5;
    uint64_t v18 = v4;
    long long v9 = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(a1 + 32) = v16;
    long long v16 = v9;
    uint64_t v10 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = v15;
    uint64_t v15 = v10;
    uint64_t v11 = *(void *)(a1 + 64);
    *(void *)(a1 + 64) = v19;
    uint64_t v19 = v11;
    drawing::Ink::~Ink((drawing::Ink *)&v13);
  }
  return a1;
}

uint64_t drawing::Ink::formatText(drawing::Ink *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "color");
  }
  if (*((void *)this + 2)) {
    PB::TextFormatter::format();
  }
  if (*((unsigned char *)this + 72)) {
    PB::TextFormatter::format(a2, "requiredContentVersion");
  }
  uint64_t v6 = *((void *)this + 4);
  if (v6) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v6 + 32))(v6, a2, "sixChannelAddColor");
  }
  uint64_t v7 = *((void *)this + 5);
  if (v7) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v7 + 32))(v7, a2, "sixChannelMultiplyColor");
  }
  if (*((void *)this + 6)) {
    PB::TextFormatter::format();
  }
  char v8 = *((unsigned char *)this + 72);
  if ((v8 & 2) != 0)
  {
    PB::TextFormatter::format(a2, "version");
    char v8 = *((unsigned char *)this + 72);
  }
  if ((v8 & 4) != 0) {
    PB::TextFormatter::format(a2, "weight", *((double *)this + 8));
  }

  return MEMORY[0x1F4147498](a2);
}

BOOL drawing::Ink::readFrom(drawing::Ink *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  char v8 = (PKProtobufUnknownFields **)((char *)this + 80);
  while (1)
  {
    uint64_t v9 = *(void *)a2;
    if (v2 <= 0xFFFFFFFFFFFFFFF5 && v2 + 10 <= v3) {
      break;
    }
    char v16 = 0;
    unsigned int v17 = 0;
    unint64_t v12 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    do
    {
      if (v3 == v2)
      {
        int v4 = 1;
        *((unsigned char *)a2 + 24) = 1;
        return v4 == 0;
      }
      unint64_t v18 = v2 + 1;
      char v19 = *(unsigned char *)(v9 + v2);
      *((void *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0) {
        goto LABEL_25;
      }
      v16 += 7;
      unint64_t v2 = v18;
      BOOL v15 = v17++ > 8;
    }
    while (!v15);
LABEL_20:
    int v20 = 0;
    LODWORD(v21) = 0;
LABEL_21:
    if (!*v8) {
      operator new();
    }
    BOOL result = PKProtobufUnknownFields::add(*v8, v21, v20, a2);
    if (!result) {
      return result;
    }
LABEL_72:
    unint64_t v2 = *((void *)a2 + 1);
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0) {
      return v4 == 0;
    }
  }
  char v10 = 0;
  unsigned int v11 = 0;
  unint64_t v12 = 0;
  while (1)
  {
    unint64_t v13 = v2 + 1;
    *((void *)a2 + 1) = v2 + 1;
    char v14 = *(unsigned char *)(v9 + v2);
    v12 |= (unint64_t)(v14 & 0x7F) << v10;
    if ((v14 & 0x80) == 0) {
      break;
    }
    v10 += 7;
    unint64_t v2 = v13;
    BOOL v15 = v11++ > 8;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_25:
  int v20 = v12 & 7;
  if (v20 != 4)
  {
    unint64_t v21 = v12 >> 3;
    switch((v12 >> 3))
    {
      case 1u:
        operator new();
      case 2u:
        operator new();
      case 3u:
        *((unsigned char *)this + 72) |= 2u;
        unint64_t v23 = *((void *)a2 + 1);
        unint64_t v24 = *((void *)a2 + 2);
        uint64_t v25 = *(void *)a2;
        if (v23 <= 0xFFFFFFFFFFFFFFF5 && v23 + 10 <= v24)
        {
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          do
          {
            unint64_t v29 = v23 + 1;
            *((void *)a2 + 1) = v23 + 1;
            char v30 = *(unsigned char *)(v25 + v23);
            v28 |= (unint64_t)(v30 & 0x7F) << v26;
            if ((v30 & 0x80) == 0) {
              goto LABEL_68;
            }
            v26 += 7;
            unint64_t v23 = v29;
            BOOL v15 = v27++ > 8;
          }
          while (!v15);
LABEL_55:
          uint64_t v28 = 0;
          goto LABEL_68;
        }
        char v40 = 0;
        unsigned int v41 = 0;
        uint64_t v28 = 0;
        if (v24 <= v23) {
          unint64_t v24 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v24 == v23)
          {
            uint64_t v28 = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v42 = v23 + 1;
            char v43 = *(unsigned char *)(v25 + v23);
            *((void *)a2 + 1) = v42;
            v28 |= (unint64_t)(v43 & 0x7F) << v40;
            if (v43 < 0)
            {
              v40 += 7;
              unint64_t v23 = v42;
              BOOL v15 = v41++ > 8;
              if (v15) {
                goto LABEL_55;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              uint64_t v28 = 0;
            }
          }
          break;
        }
LABEL_68:
        *((void *)this + 7) = v28;
        goto LABEL_72;
      case 4u:
        operator new();
      case 5u:
        operator new();
      case 6u:
        operator new();
      case 7u:
        *((unsigned char *)this + 72) |= 1u;
        unint64_t v31 = *((void *)a2 + 1);
        unint64_t v32 = *((void *)a2 + 2);
        uint64_t v33 = *(void *)a2;
        if (v31 <= 0xFFFFFFFFFFFFFFF5 && v31 + 10 <= v32)
        {
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          do
          {
            unint64_t v37 = v31 + 1;
            *((void *)a2 + 1) = v31 + 1;
            char v38 = *(unsigned char *)(v33 + v31);
            v36 |= (unint64_t)(v38 & 0x7F) << v34;
            if ((v38 & 0x80) == 0) {
              goto LABEL_71;
            }
            v34 += 7;
            unint64_t v31 = v37;
            BOOL v15 = v35++ > 8;
          }
          while (!v15);
LABEL_62:
          uint64_t v36 = 0;
          goto LABEL_71;
        }
        char v44 = 0;
        unsigned int v45 = 0;
        uint64_t v36 = 0;
        if (v32 <= v31) {
          unint64_t v32 = *((void *)a2 + 1);
        }
        break;
      case 8u:
        *((unsigned char *)this + 72) |= 4u;
        unint64_t v39 = *((void *)a2 + 1);
        if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *((void *)a2 + 2))
        {
          *((void *)this + 8) = *(void *)(*(void *)a2 + v39);
          *((void *)a2 + 1) += 8;
        }
        else
        {
          *((unsigned char *)a2 + 24) = 1;
        }
        goto LABEL_72;
      default:
        goto LABEL_21;
    }
    while (1)
    {
      if (v32 == v31)
      {
        uint64_t v36 = 0;
        *((unsigned char *)a2 + 24) = 1;
        goto LABEL_71;
      }
      unint64_t v46 = v31 + 1;
      char v47 = *(unsigned char *)(v33 + v31);
      *((void *)a2 + 1) = v46;
      v36 |= (unint64_t)(v47 & 0x7F) << v44;
      if ((v47 & 0x80) == 0) {
        break;
      }
      v44 += 7;
      unint64_t v31 = v46;
      BOOL v15 = v45++ > 8;
      if (v15) {
        goto LABEL_62;
      }
    }
    if (*((unsigned char *)a2 + 24)) {
      uint64_t v36 = 0;
    }
LABEL_71:
    *((void *)this + 3) = v36;
    goto LABEL_72;
  }
  int v4 = 0;
  return v4 == 0;
}

void sub_1C46E3264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, PB::Writer **a9)
{
}

const void ***drawing::Ink::writeTo(drawing::Ink *this, PB::Writer *a2)
{
  int v4 = (const PB::Base *)*((void *)this + 1);
  if (v4) {
    PB::Writer::writeSubmessage(a2, v4);
  }
  if (*((void *)this + 2)) {
    PB::Writer::write();
  }
  if ((*((unsigned char *)this + 72) & 2) != 0) {
    PB::Writer::writeVarInt(a2);
  }
  if (*((void *)this + 6)) {
    PB::Writer::write();
  }
  uint64_t v5 = (const PB::Base *)*((void *)this + 4);
  if (v5) {
    PB::Writer::writeSubmessage(a2, v5);
  }
  uint64_t v6 = (const PB::Base *)*((void *)this + 5);
  if (v6) {
    PB::Writer::writeSubmessage(a2, v6);
  }
  char v7 = *((unsigned char *)this + 72);
  if (v7)
  {
    PB::Writer::writeVarInt(a2);
    char v7 = *((unsigned char *)this + 72);
  }
  if ((v7 & 4) != 0) {
    PB::Writer::write(a2, *((double *)this + 8));
  }
  BOOL result = (const void ***)*((void *)this + 10);
  if (result)
  {
    return PKProtobufUnknownFields::writeTo(result, (char **)a2);
  }
  return result;
}

BOOL drawing::Ink::operator==(uint64_t a1, uint64_t a2)
{
  BOOL result = PKProtobufUnknownFieldsCompare((void ***)(a1 + 80), (void ***)(a2 + 80));
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 8);
    uint64_t v6 = *(void *)(a2 + 8);
    if (v5)
    {
      if (!v6 || !drawing::Color::operator==(v5, v6)) {
        return 0;
      }
    }
    else if (v6)
    {
      return 0;
    }
    char v7 = *(unsigned __int8 **)(a1 + 16);
    char v8 = *(unsigned __int8 ***)(a2 + 16);
    if (v7)
    {
      if (!v8) {
        return 0;
      }
      uint64_t v9 = v7[23];
      if ((v9 & 0x80u) == 0) {
        char v10 = (unsigned __int8 *)v7[23];
      }
      else {
        char v10 = (unsigned __int8 *)*((void *)v7 + 1);
      }
      unsigned int v11 = (unsigned __int8 *)*((unsigned __int8 *)v8 + 23);
      int v12 = (char)v11;
      if ((char)v11 < 0) {
        unsigned int v11 = v8[1];
      }
      if (v10 != v11) {
        return 0;
      }
      if (v12 >= 0) {
        unint64_t v13 = *(unsigned __int8 **)(a2 + 16);
      }
      else {
        unint64_t v13 = *v8;
      }
      if ((v9 & 0x80) != 0)
      {
        if (memcmp(*(const void **)v7, v13, *((void *)v7 + 1))) {
          return 0;
        }
      }
      else if (v7[23])
      {
        while (*v7 == *v13)
        {
          ++v7;
          ++v13;
          if (!--v9) {
            goto LABEL_24;
          }
        }
        return 0;
      }
    }
    else if (v8)
    {
      return 0;
    }
LABEL_24:
    char v14 = *(unsigned char *)(a1 + 72);
    char v15 = *(unsigned char *)(a2 + 72);
    if ((v14 & 2) != 0)
    {
      if ((*(unsigned char *)(a2 + 72) & 2) == 0 || *(void *)(a1 + 56) != *(void *)(a2 + 56)) {
        return 0;
      }
    }
    else if ((*(unsigned char *)(a2 + 72) & 2) != 0)
    {
      return 0;
    }
    char v16 = *(unsigned __int8 **)(a1 + 48);
    unsigned int v17 = *(unsigned __int8 **)(a2 + 48);
    if (v16)
    {
      if (!v17 || !std::equal_to<std::string>::operator()[abi:ne180100](v16, v17)) {
        return 0;
      }
    }
    else if (v17)
    {
      return 0;
    }
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void *)(a2 + 32);
    if (v18)
    {
      if (!v19 || !drawing::Color::operator==(v18, v19)) {
        return 0;
      }
    }
    else if (v19)
    {
      return 0;
    }
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v21 = *(void *)(a2 + 40);
    if (v20)
    {
      if (!v21 || !drawing::Color::operator==(v20, v21)) {
        return 0;
      }
LABEL_46:
      if (v14)
      {
        if ((v15 & 1) == 0 || *(void *)(a1 + 24) != *(void *)(a2 + 24)) {
          return 0;
        }
      }
      else if (v15)
      {
        return 0;
      }
      BOOL result = (v15 & 4) == 0;
      if ((v14 & 4) == 0) {
        return result;
      }
      return (v15 & 4) != 0 && *(double *)(a1 + 64) == *(double *)(a2 + 64);
    }
    if (!v21) {
      goto LABEL_46;
    }
    return 0;
  }
  return result;
}

unint64_t drawing::Ink::hash_value(drawing::Ink *this)
{
  unint64_t v2 = (drawing::Color *)*((void *)this + 1);
  if (v2) {
    uint64_t v3 = drawing::Color::hash_value(v2);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *((void *)this + 2);
  if (v4) {
    unint64_t v5 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v15, v4);
  }
  else {
    unint64_t v5 = 0;
  }
  if ((*((unsigned char *)this + 72) & 2) != 0) {
    uint64_t v6 = *((void *)this + 7);
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *((void *)this + 6);
  if (v7) {
    unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v16, v7);
  }
  else {
    unint64_t v8 = 0;
  }
  uint64_t v9 = (drawing::Color *)*((void *)this + 4);
  if (v9) {
    uint64_t v10 = drawing::Color::hash_value(v9);
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = *((void *)this + 5);
  if (v11) {
    unint64_t v11 = drawing::Color::hash_value((drawing::Color *)v11);
  }
  if ((*((unsigned char *)this + 72) & 1) == 0)
  {
    uint64_t v12 = 0;
    if ((*((unsigned char *)this + 72) & 4) != 0) {
      goto LABEL_20;
    }
LABEL_24:
    double v13 = 0.0;
    return v5 ^ v3 ^ v6 ^ v8 ^ v10 ^ v11 ^ v12 ^ *(void *)&v13;
  }
  uint64_t v12 = *((void *)this + 3);
  if ((*((unsigned char *)this + 72) & 4) == 0) {
    goto LABEL_24;
  }
LABEL_20:
  double v13 = *((double *)this + 8);
  if (v13 == 0.0) {
    double v13 = 0.0;
  }
  return v5 ^ v3 ^ v6 ^ v8 ^ v10 ^ v11 ^ v12 ^ *(void *)&v13;
}

uint64_t drawing::Ink::makeColor(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

uint64_t drawing::Ink::makeSixChannelAddColor(uint64_t this)
{
  if (!*(void *)(this + 32)) {
    operator new();
  }
  return this;
}

uint64_t drawing::Ink::makeSixChannelMultiplyColor(uint64_t this)
{
  if (!*(void *)(this + 40)) {
    operator new();
  }
  return this;
}

uint64_t drawingV1::Rectangle::Rectangle(uint64_t this)
{
  *(void *)this = &unk_1F1FB0A88;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

{
  *(void *)this = &unk_1F1FB0A88;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

void drawingV1::Rectangle::~Rectangle(drawingV1::Rectangle *this)
{
  PB::Base::~Base(this);

  JUMPOUT(0x1C8783F10);
}

float drawingV1::Rectangle::Rectangle(drawingV1::Rectangle *this, const drawingV1::Rectangle *a2)
{
  *(void *)this = &unk_1F1FB0A88;
  *((_DWORD *)this + 6) = 0;
  char v2 = *((unsigned char *)a2 + 24);
  if ((v2 & 2) != 0)
  {
    float result = *((float *)a2 + 3);
    char v3 = 2;
    *((unsigned char *)this + 24) = 2;
    *((float *)this + 3) = result;
    char v2 = *((unsigned char *)a2 + 24);
    if ((v2 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v3 = 0;
  if ((*((unsigned char *)a2 + 24) & 4) != 0)
  {
LABEL_5:
    float result = *((float *)a2 + 4);
    v3 |= 4u;
    *((unsigned char *)this + 24) = v3;
    *((float *)this + 4) = result;
    char v2 = *((unsigned char *)a2 + 24);
  }
LABEL_6:
  if ((v2 & 8) == 0)
  {
    if ((v2 & 1) == 0) {
      return result;
    }
LABEL_10:
    float result = *((float *)a2 + 2);
    *((unsigned char *)this + 24) = v3 | 1;
    *((float *)this + 2) = result;
    return result;
  }
  float result = *((float *)a2 + 5);
  v3 |= 8u;
  *((unsigned char *)this + 24) = v3;
  *((float *)this + 5) = result;
  if (*((unsigned char *)a2 + 24)) {
    goto LABEL_10;
  }
  return result;
}

uint64_t drawingV1::Rectangle::operator=(uint64_t a1, const drawingV1::Rectangle *a2)
{
  if ((const drawingV1::Rectangle *)a1 != a2)
  {
    drawingV1::Rectangle::Rectangle((drawingV1::Rectangle *)&v6, a2);
    int v3 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = v8;
    int v8 = v3;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    long long v7 = v4;
    PB::Base::~Base((PB::Base *)&v6);
  }
  return a1;
}

float drawingV1::swap(drawingV1 *this, drawingV1::Rectangle *a2, drawingV1::Rectangle *a3)
{
  int v3 = *((_DWORD *)this + 6);
  *((_DWORD *)this + 6) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v3;
  int v4 = *((_DWORD *)this + 3);
  *((_DWORD *)this + 3) = *((_DWORD *)a2 + 3);
  *((_DWORD *)a2 + 3) = v4;
  int v5 = *((_DWORD *)this + 4);
  *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v5;
  int v6 = *((_DWORD *)this + 5);
  *((_DWORD *)this + 5) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v6;
  float result = *((float *)this + 2);
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  *((float *)a2 + 2) = result;
  return result;
}

float drawingV1::Rectangle::Rectangle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F1FB0A88;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 2std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = *(_DWORD *)(a2 + 20);
  float result = *(float *)(a2 + 8);
  *(float *)(a1 + 8) = result;
  return result;
}

{
  float result;

  *(void *)a1 = &unk_1F1FB0A88;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 2std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = *(_DWORD *)(a2 + 20);
  float result = *(float *)(a2 + 8);
  *(float *)(a1 + 8) = result;
  return result;
}

uint64_t drawingV1::Rectangle::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    long long v7 = &unk_1F1FB0A88;
    int v3 = *(_DWORD *)(a2 + 24);
    *(_DWORD *)(a2 + 24) = 0;
    int v9 = *(_DWORD *)(a1 + 24);
    long long v4 = *(_OWORD *)(a1 + 8);
    long long v5 = *(_OWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 24) = v3;
    *(_OWORD *)(a1 + 8) = v5;
    long long v8 = v4;
    PB::Base::~Base((PB::Base *)&v7);
  }
  return a1;
}

uint64_t drawingV1::Rectangle::formatText(drawingV1::Rectangle *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 24);
  if (v5)
  {
    PB::TextFormatter::format(a2, "height", *((float *)this + 2));
    char v5 = *((unsigned char *)this + 24);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)this + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "originX", *((float *)this + 3));
  char v5 = *((unsigned char *)this + 24);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PB::TextFormatter::format(a2, "originY", *((float *)this + 4));
  if ((*((unsigned char *)this + 24) & 8) != 0) {
LABEL_5:
  }
    PB::TextFormatter::format(a2, "width", *((float *)this + 5));
LABEL_6:

  return MEMORY[0x1F4147498](a2);
}

uint64_t drawingV1::Rectangle::readFrom(drawingV1::Rectangle *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
    {
      char v15 = 0;
      unsigned int v16 = 0;
      unint64_t v11 = 0;
      if (v2 > v3) {
        unint64_t v3 = v2;
      }
      do
      {
        if (v3 == v2)
        {
          int v4 = 1;
          *((unsigned char *)a2 + 24) = 1;
          return v4 == 0;
        }
        unint64_t v17 = v2 + 1;
        char v18 = *(unsigned char *)(v8 + v2);
        *((void *)a2 + 1) = v17;
        v11 |= (unint64_t)(v18 & 0x7F) << v15;
        if ((v18 & 0x80) == 0) {
          goto LABEL_21;
        }
        v15 += 7;
        unint64_t v2 = v17;
        BOOL v14 = v16++ > 8;
      }
      while (!v14);
LABEL_19:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      goto LABEL_37;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_21:
    if ((v11 & 7) == 4) {
      break;
    }
    switch((v11 >> 3))
    {
      case 1u:
        *((unsigned char *)this + 24) |= 2u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2)) {
          goto LABEL_34;
        }
        *((_DWORD *)this + 3) = *(_DWORD *)(*(void *)a2 + v2);
        goto LABEL_36;
      case 2u:
        *((unsigned char *)this + 24) |= 4u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2)) {
          goto LABEL_34;
        }
        *((_DWORD *)this + 4) = *(_DWORD *)(*(void *)a2 + v2);
        goto LABEL_36;
      case 3u:
        *((unsigned char *)this + 24) |= 8u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2)) {
          goto LABEL_34;
        }
        *((_DWORD *)this + 5) = *(_DWORD *)(*(void *)a2 + v2);
        goto LABEL_36;
      case 4u:
        *((unsigned char *)this + 24) |= 1u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 <= 0xFFFFFFFFFFFFFFFBLL && v2 + 4 <= *((void *)a2 + 2))
        {
          *((_DWORD *)this + 2) = *(_DWORD *)(*(void *)a2 + v2);
LABEL_36:
          unint64_t v2 = *((void *)a2 + 1) + 4;
          *((void *)a2 + 1) = v2;
        }
        else
        {
LABEL_34:
          *((unsigned char *)a2 + 24) = 1;
        }
        break;
      default:
        goto LABEL_19;
    }
LABEL_37:
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
      return v4 == 0;
    }
  }
  int v4 = 0;
  return v4 == 0;
}

uint64_t drawingV1::Rectangle::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  char v4 = *(unsigned char *)(this + 24);
  if ((v4 & 2) != 0)
  {
    this = PB::Writer::write(a2, *(float *)(this + 12));
    char v4 = *(unsigned char *)(v3 + 24);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      this = PB::Writer::write(a2, *(float *)(v3 + 20));
      if ((*(unsigned char *)(v3 + 24) & 1) == 0) {
        return this;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)(this + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  this = PB::Writer::write(a2, *(float *)(v3 + 16));
  char v4 = *(unsigned char *)(v3 + 24);
  if ((v4 & 8) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((v4 & 1) == 0) {
    return this;
  }
LABEL_9:
  float v5 = *(float *)(v3 + 8);

  return PB::Writer::write(a2, v5);
}

BOOL drawingV1::Rectangle::operator==(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(a1 + 24) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 24) & 2) == 0 || *(float *)(a1 + 12) != *(float *)(a2 + 12)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 24) & 2) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 24) & 4) != 0)
  {
    if ((*(unsigned char *)(a2 + 24) & 4) == 0 || *(float *)(a1 + 16) != *(float *)(a2 + 16)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 24) & 4) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 24) & 8) != 0)
  {
    if ((*(unsigned char *)(a2 + 24) & 8) == 0 || *(float *)(a1 + 20) != *(float *)(a2 + 20)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 24) & 8) != 0)
  {
    return 0;
  }
  BOOL v2 = (*(unsigned char *)(a2 + 24) & 1) == 0;
  if (*(unsigned char *)(a1 + 24)) {
    return (*(unsigned char *)(a2 + 24) & 1) != 0 && *(float *)(a1 + 8) == *(float *)(a2 + 8);
  }
  return v2;
}

uint64_t drawingV1::Rectangle::hash_value(drawingV1::Rectangle *this)
{
  if ((*((unsigned char *)this + 24) & 2) == 0)
  {
    uint64_t v1 = 0;
    if ((*((unsigned char *)this + 24) & 4) != 0) {
      goto LABEL_3;
    }
LABEL_15:
    uint64_t v3 = 0;
    if ((*((unsigned char *)this + 24) & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
  float v8 = *((float *)this + 3);
  uint64_t v1 = LODWORD(v8);
  if (v8 == 0.0) {
    uint64_t v1 = 0;
  }
  if ((*((unsigned char *)this + 24) & 4) == 0) {
    goto LABEL_15;
  }
LABEL_3:
  float v2 = *((float *)this + 4);
  uint64_t v3 = LODWORD(v2);
  if (v2 == 0.0) {
    uint64_t v3 = 0;
  }
  if ((*((unsigned char *)this + 24) & 8) != 0)
  {
LABEL_6:
    float v4 = *((float *)this + 5);
    uint64_t v5 = LODWORD(v4);
    if (v4 == 0.0) {
      uint64_t v5 = 0;
    }
    if (*((unsigned char *)this + 24)) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v7 = 0;
    return v3 ^ v1 ^ v5 ^ v7;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((*((unsigned char *)this + 24) & 1) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  float v6 = *((float *)this + 2);
  uint64_t v7 = LODWORD(v6);
  if (v6 == 0.0) {
    uint64_t v7 = 0;
  }
  return v3 ^ v1 ^ v5 ^ v7;
}

void sub_1C46E62BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1C46E6538(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C46E6CF4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("FBSDisplayLayoutMonitorConfiguration");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1EB3C6030 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    FrontBoardServicesLibrary();
  }
}

void FrontBoardServicesLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __FrontBoardServicesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E64C9368;
    uint64_t v3 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrardouble y = _sl_dlopen();
    v0 = (void *)v1[0];
    if (FrontBoardServicesLibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __FrontBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FrontBoardServicesLibraryCore_frameworkLibrardouble y = result;
  return result;
}

Class __getFBSDisplayLayoutMonitorClass_block_invoke(uint64_t a1)
{
  FrontBoardServicesLibrary();
  Class result = objc_getClass("FBSDisplayLayoutMonitor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1EB3C6038 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getFBDisplayManagerClass_block_invoke(v3);
  }
  return result;
}

Class __getFBDisplayManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1EB3C6048)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __FrontBoardLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E64C9380;
    uint64_t v6 = 0;
    qword_1EB3C6048 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!qword_1EB3C6048)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("FBDisplayManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_1EB3C6040 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FrontBoardLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB3C6048 = result;
  return result;
}

void sub_1C46E9F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIAUtilityClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1EB3C6078)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __InputAnalyticsLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E64C9630;
    uint64_t v6 = 0;
    qword_1EB3C6078 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!qword_1EB3C6078)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("IAUtility");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_1EB3C6070 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __InputAnalyticsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB3C6078 = result;
  return result;
}

PKInk *PKEraserInkForTypeAndWeight(uint64_t a1, double a2)
{
  uint64_t v4 = PKInkIdentifierObjectEraser;
  if (a1) {
    uint64_t v4 = PKInkIdentifierEraser;
  }
  long long v5 = *v4;
  double v6 = fabs(a2);
  if (a1 != 1 || (int64_t v7 = 3, v6 != INFINITY)) {
    int64_t v7 = +[PKInk currentInkVersionForInkIdentifier:v5];
  }
  if (v6 == INFINITY) {
    double v8 = 0.0;
  }
  else {
    double v8 = a2;
  }
  double v9 = v8;
  unsigned int v10 = [PKInk alloc];
  unint64_t v11 = [MEMORY[0x1E4FB1618] clearColor];
  unint64_t v12 = [(PKInk *)v10 initWithIdentifier:v5 color:v11 version:v7 variant:0 weight:v9];

  return v12;
}

void sub_1C46F1440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46F1504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v13 = v12;

  objc_sync_exit(v11);
  _Unwind_Resume(a1);
}

void sub_1C46F2958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DKUNilsEquivalentEqualObjects(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  long long v5 = (void *)v4;
  if (v3 | v4)
  {
    uint64_t v6 = 0;
    if (v3 && v4) {
      uint64_t v6 = [(id)v3 isEqual:v4];
    }
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

BOOL DKUNilsEquivalentEqualHashes(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  long long v5 = (void *)v4;
  if (v3 | v4)
  {
    BOOL v6 = 0;
    if (v3 && v4)
    {
      uint64_t v7 = [(id)v3 hash];
      BOOL v6 = v7 == [v5 hash];
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

uint64_t drawing::Rectangle::Rectangle(uint64_t this)
{
  *(void *)this = &unk_1F1FB08C8;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

{
  *(void *)this = &unk_1F1FB08C8;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

void drawing::Rectangle::~Rectangle(drawing::Rectangle *this)
{
  PB::Base::~Base(this);

  JUMPOUT(0x1C8783F10);
}

float drawing::Rectangle::Rectangle(drawing::Rectangle *this, const drawing::Rectangle *a2)
{
  *(void *)this = &unk_1F1FB08C8;
  *((_DWORD *)this + 6) = 0;
  char v2 = *((unsigned char *)a2 + 24);
  if ((v2 & 2) != 0)
  {
    float result = *((float *)a2 + 3);
    char v3 = 2;
    *((unsigned char *)this + 24) = 2;
    *((float *)this + 3) = result;
    char v2 = *((unsigned char *)a2 + 24);
    if ((v2 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v3 = 0;
  if ((*((unsigned char *)a2 + 24) & 4) != 0)
  {
LABEL_5:
    float result = *((float *)a2 + 4);
    v3 |= 4u;
    *((unsigned char *)this + 24) = v3;
    *((float *)this + 4) = result;
    char v2 = *((unsigned char *)a2 + 24);
  }
LABEL_6:
  if ((v2 & 8) == 0)
  {
    if ((v2 & 1) == 0) {
      return result;
    }
LABEL_10:
    float result = *((float *)a2 + 2);
    *((unsigned char *)this + 24) = v3 | 1;
    *((float *)this + 2) = result;
    return result;
  }
  float result = *((float *)a2 + 5);
  v3 |= 8u;
  *((unsigned char *)this + 24) = v3;
  *((float *)this + 5) = result;
  if (*((unsigned char *)a2 + 24)) {
    goto LABEL_10;
  }
  return result;
}

uint64_t drawing::Rectangle::operator=(uint64_t a1, const drawing::Rectangle *a2)
{
  if ((const drawing::Rectangle *)a1 != a2)
  {
    drawing::Rectangle::Rectangle((drawing::Rectangle *)&v6, a2);
    int v3 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = v8;
    int v8 = v3;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    long long v7 = v4;
    PB::Base::~Base((PB::Base *)&v6);
  }
  return a1;
}

float drawing::swap(drawing *this, drawing::Rectangle *a2, drawing::Rectangle *a3)
{
  int v3 = *((_DWORD *)this + 6);
  *((_DWORD *)this + 6) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v3;
  int v4 = *((_DWORD *)this + 3);
  *((_DWORD *)this + 3) = *((_DWORD *)a2 + 3);
  *((_DWORD *)a2 + 3) = v4;
  int v5 = *((_DWORD *)this + 4);
  *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v5;
  int v6 = *((_DWORD *)this + 5);
  *((_DWORD *)this + 5) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v6;
  float result = *((float *)this + 2);
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  *((float *)a2 + 2) = result;
  return result;
}

float drawing::Rectangle::Rectangle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F1FB08C8;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 2std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = *(_DWORD *)(a2 + 20);
  float result = *(float *)(a2 + 8);
  *(float *)(a1 + 8) = result;
  return result;
}

{
  float result;

  *(void *)a1 = &unk_1F1FB08C8;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 2std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = *(_DWORD *)(a2 + 20);
  float result = *(float *)(a2 + 8);
  *(float *)(a1 + 8) = result;
  return result;
}

uint64_t drawing::Rectangle::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    long long v7 = &unk_1F1FB08C8;
    int v3 = *(_DWORD *)(a2 + 24);
    *(_DWORD *)(a2 + 24) = 0;
    int v9 = *(_DWORD *)(a1 + 24);
    long long v4 = *(_OWORD *)(a1 + 8);
    long long v5 = *(_OWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 24) = v3;
    *(_OWORD *)(a1 + 8) = v5;
    long long v8 = v4;
    PB::Base::~Base((PB::Base *)&v7);
  }
  return a1;
}

uint64_t drawing::Rectangle::formatText(drawing::Rectangle *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 24);
  if (v5)
  {
    PB::TextFormatter::format(a2, "height", *((float *)this + 2));
    char v5 = *((unsigned char *)this + 24);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)this + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "originX", *((float *)this + 3));
  char v5 = *((unsigned char *)this + 24);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PB::TextFormatter::format(a2, "originY", *((float *)this + 4));
  if ((*((unsigned char *)this + 24) & 8) != 0) {
LABEL_5:
  }
    PB::TextFormatter::format(a2, "width", *((float *)this + 5));
LABEL_6:

  return MEMORY[0x1F4147498](a2);
}

uint64_t drawing::Rectangle::readFrom(drawing::Rectangle *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
    {
      char v15 = 0;
      unsigned int v16 = 0;
      unint64_t v11 = 0;
      if (v2 > v3) {
        unint64_t v3 = v2;
      }
      do
      {
        if (v3 == v2)
        {
          int v4 = 1;
          *((unsigned char *)a2 + 24) = 1;
          return v4 == 0;
        }
        unint64_t v17 = v2 + 1;
        char v18 = *(unsigned char *)(v8 + v2);
        *((void *)a2 + 1) = v17;
        v11 |= (unint64_t)(v18 & 0x7F) << v15;
        if ((v18 & 0x80) == 0) {
          goto LABEL_21;
        }
        v15 += 7;
        unint64_t v2 = v17;
        BOOL v14 = v16++ > 8;
      }
      while (!v14);
LABEL_19:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      goto LABEL_37;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_21:
    if ((v11 & 7) == 4) {
      break;
    }
    switch((v11 >> 3))
    {
      case 1u:
        *((unsigned char *)this + 24) |= 2u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2)) {
          goto LABEL_34;
        }
        *((_DWORD *)this + 3) = *(_DWORD *)(*(void *)a2 + v2);
        goto LABEL_36;
      case 2u:
        *((unsigned char *)this + 24) |= 4u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2)) {
          goto LABEL_34;
        }
        *((_DWORD *)this + 4) = *(_DWORD *)(*(void *)a2 + v2);
        goto LABEL_36;
      case 3u:
        *((unsigned char *)this + 24) |= 8u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2)) {
          goto LABEL_34;
        }
        *((_DWORD *)this + 5) = *(_DWORD *)(*(void *)a2 + v2);
        goto LABEL_36;
      case 4u:
        *((unsigned char *)this + 24) |= 1u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 <= 0xFFFFFFFFFFFFFFFBLL && v2 + 4 <= *((void *)a2 + 2))
        {
          *((_DWORD *)this + 2) = *(_DWORD *)(*(void *)a2 + v2);
LABEL_36:
          unint64_t v2 = *((void *)a2 + 1) + 4;
          *((void *)a2 + 1) = v2;
        }
        else
        {
LABEL_34:
          *((unsigned char *)a2 + 24) = 1;
        }
        break;
      default:
        goto LABEL_19;
    }
LABEL_37:
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
      return v4 == 0;
    }
  }
  int v4 = 0;
  return v4 == 0;
}

uint64_t drawing::Rectangle::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  char v4 = *(unsigned char *)(this + 24);
  if ((v4 & 2) != 0)
  {
    this = PB::Writer::write(a2, *(float *)(this + 12));
    char v4 = *(unsigned char *)(v3 + 24);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      this = PB::Writer::write(a2, *(float *)(v3 + 20));
      if ((*(unsigned char *)(v3 + 24) & 1) == 0) {
        return this;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)(this + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  this = PB::Writer::write(a2, *(float *)(v3 + 16));
  char v4 = *(unsigned char *)(v3 + 24);
  if ((v4 & 8) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((v4 & 1) == 0) {
    return this;
  }
LABEL_9:
  float v5 = *(float *)(v3 + 8);

  return PB::Writer::write(a2, v5);
}

BOOL drawing::Rectangle::operator==(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(a1 + 24) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 24) & 2) == 0 || *(float *)(a1 + 12) != *(float *)(a2 + 12)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 24) & 2) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 24) & 4) != 0)
  {
    if ((*(unsigned char *)(a2 + 24) & 4) == 0 || *(float *)(a1 + 16) != *(float *)(a2 + 16)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 24) & 4) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 24) & 8) != 0)
  {
    if ((*(unsigned char *)(a2 + 24) & 8) == 0 || *(float *)(a1 + 20) != *(float *)(a2 + 20)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 24) & 8) != 0)
  {
    return 0;
  }
  BOOL v2 = (*(unsigned char *)(a2 + 24) & 1) == 0;
  if (*(unsigned char *)(a1 + 24)) {
    return (*(unsigned char *)(a2 + 24) & 1) != 0 && *(float *)(a1 + 8) == *(float *)(a2 + 8);
  }
  return v2;
}

uint64_t drawing::Rectangle::hash_value(drawing::Rectangle *this)
{
  if ((*((unsigned char *)this + 24) & 2) == 0)
  {
    uint64_t v1 = 0;
    if ((*((unsigned char *)this + 24) & 4) != 0) {
      goto LABEL_3;
    }
LABEL_15:
    uint64_t v3 = 0;
    if ((*((unsigned char *)this + 24) & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
  float v8 = *((float *)this + 3);
  uint64_t v1 = LODWORD(v8);
  if (v8 == 0.0) {
    uint64_t v1 = 0;
  }
  if ((*((unsigned char *)this + 24) & 4) == 0) {
    goto LABEL_15;
  }
LABEL_3:
  float v2 = *((float *)this + 4);
  uint64_t v3 = LODWORD(v2);
  if (v2 == 0.0) {
    uint64_t v3 = 0;
  }
  if ((*((unsigned char *)this + 24) & 8) != 0)
  {
LABEL_6:
    float v4 = *((float *)this + 5);
    uint64_t v5 = LODWORD(v4);
    if (v4 == 0.0) {
      uint64_t v5 = 0;
    }
    if (*((unsigned char *)this + 24)) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v7 = 0;
    return v3 ^ v1 ^ v5 ^ v7;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((*((unsigned char *)this + 24) & 1) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  float v6 = *((float *)this + 2);
  uint64_t v7 = LODWORD(v6);
  if (v6 == 0.0) {
    uint64_t v7 = 0;
  }
  return v3 ^ v1 ^ v5 ^ v7;
}

void sub_1C46F8A74(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1C46F8E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
}

id PKDisplayColorForTool(void *a1)
{
  id v1 = a1;
  float v2 = [v1 _configuration];
  int v3 = [v2 supportsColor];

  if (v3)
  {
    float v4 = [v1 _color];
  }
  else
  {
    float v4 = 0;
  }

  return v4;
}

void sub_1C46FD324(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46FD444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46FD550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46FD660(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1C46FD768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46FD838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C46FD910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C46FDA00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t drawingV1::Stroke::Stroke(uint64_t this)
{
  *(void *)this = &unk_1F1FB09E0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 24) = 0;
  *(_DWORD *)(this + 92) = 0;
  *(void *)(this + 48) = 0;
  *(void *)(this + 56) = 0;
  *(void *)(this + 4std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = 0;
  *(void *)(this + 72) = 0;
  *(void *)(this + 8std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = 0;
  return this;
}

{
  *(void *)this = &unk_1F1FB09E0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 24) = 0;
  *(_DWORD *)(this + 92) = 0;
  *(void *)(this + 48) = 0;
  *(void *)(this + 56) = 0;
  *(void *)(this + 4std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = 0;
  *(void *)(this + 72) = 0;
  *(void *)(this + 8std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = 0;
  return this;
}

void drawingV1::Stroke::~Stroke(drawingV1::Stroke *this)
{
  *(void *)this = &unk_1F1FB09E0;
  uint64_t v2 = *((void *)this + 10);
  *((void *)this + 1std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *((void *)this + 9);
  *((void *)this + 9) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)this + 7, 0);
  uint64_t v4 = *((void *)this + 6);
  *((void *)this + 6) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)this + 5, 0);
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)this + 3, 0);
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }

  PB::Base::~Base(this);
}

{
  uint64_t vars8;

  drawingV1::Stroke::~Stroke(this);

  JUMPOUT(0x1C8783F10);
}

uint64_t drawingV1::Stroke::Stroke(uint64_t this, const drawingV1::Stroke *a2)
{
  *(void *)this = &unk_1F1FB09E0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 24) = 0;
  *(void *)(this + 4std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = 0;
  *(void *)(this + 56) = 0;
  *(void *)(this + 72) = 0;
  *(_DWORD *)(this + 92) = 0;
  *(void *)(this + 48) = 0;
  *(void *)(this + 8std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = 0;
  if (*((void *)a2 + 6)) {
    operator new();
  }
  if (*((void *)a2 + 10)) {
    operator new();
  }
  char v2 = *((unsigned char *)a2 + 92);
  if (v2)
  {
    uint64_t v3 = *((void *)a2 + 2);
    *(unsigned char *)(this + 92) |= 1u;
    *(void *)(this + 16) = v3;
    char v2 = *((unsigned char *)a2 + 92);
  }
  if ((v2 & 2) != 0)
  {
    uint64_t v4 = *((void *)a2 + 4);
    *(unsigned char *)(this + 92) |= 2u;
    *(void *)(this + 32) = v4;
  }
  if (*((void *)a2 + 3)) {
    operator new();
  }
  if (*((void *)a2 + 1)) {
    operator new();
  }
  if ((*((unsigned char *)a2 + 92) & 0x10) != 0)
  {
    char v5 = *((unsigned char *)a2 + 89);
    *(unsigned char *)(this + 92) |= 0x10u;
    *(unsigned char *)(this + 89) = v5;
  }
  if (*((void *)a2 + 9)) {
    operator new();
  }
  char v6 = *((unsigned char *)a2 + 92);
  if ((v6 & 4) != 0)
  {
    uint64_t v7 = *((void *)a2 + 8);
    *(unsigned char *)(this + 92) |= 4u;
    *(void *)(this + 64) = v7;
    char v6 = *((unsigned char *)a2 + 92);
  }
  if ((v6 & 8) != 0)
  {
    char v8 = *((unsigned char *)a2 + 88);
    *(unsigned char *)(this + 92) |= 8u;
    *(unsigned char *)(this + 88) = v8;
  }
  if (*((void *)a2 + 7)) {
    operator new();
  }
  if (*((void *)a2 + 5)) {
    operator new();
  }
  return this;
}

drawingV1 *drawingV1::Stroke::operator=(drawingV1 *a1, const drawingV1::Stroke *a2)
{
  if (a1 != a2)
  {
    drawingV1::Stroke::Stroke((uint64_t)v5, a2);
    drawingV1::swap(a1, (drawingV1::Stroke *)v5, v3);
    drawingV1::Stroke::~Stroke((drawingV1::Stroke *)v5);
  }
  return a1;
}

double drawingV1::swap(drawingV1 *this, drawingV1::Stroke *a2, drawingV1::Stroke *a3)
{
  int v3 = *((_DWORD *)this + 23);
  *((_DWORD *)this + 23) = *((_DWORD *)a2 + 23);
  *((_DWORD *)a2 + 23) = v3;
  uint64_t v4 = *((void *)this + 6);
  *((void *)this + 6) = *((void *)a2 + 6);
  *((void *)a2 + 6) = v4;
  uint64_t v5 = *((void *)this + 10);
  *((void *)this + 1std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = *((void *)a2 + 10);
  *((void *)a2 + 1std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = v5;
  uint64_t v6 = *((void *)this + 3);
  *((void *)this + 3) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v6;
  uint64_t v8 = *((void *)this + 1);
  uint64_t v7 = *((void *)this + 2);
  uint64_t v9 = *((void *)a2 + 2);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((void *)this + 2) = v9;
  *((void *)a2 + 1) = v8;
  *((void *)a2 + 2) = v7;
  LOBYTE(v7) = *((unsigned char *)this + 89);
  *((unsigned char *)this + 89) = *((unsigned char *)a2 + 89);
  *((unsigned char *)a2 + 89) = v7;
  uint64_t v10 = *((void *)this + 9);
  *((void *)this + 9) = *((void *)a2 + 9);
  *((void *)a2 + 9) = v10;
  LOBYTE(v1std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = *((unsigned char *)this + 88);
  *((unsigned char *)this + 88) = *((unsigned char *)a2 + 88);
  uint64_t v11 = *((void *)this + 7);
  *((void *)this + 7) = *((void *)a2 + 7);
  *((void *)a2 + 7) = v11;
  uint64_t v12 = *((void *)this + 4);
  uint64_t v13 = *((void *)this + 5);
  uint64_t v14 = *((void *)a2 + 5);
  *((void *)this + 4) = *((void *)a2 + 4);
  *((void *)this + 5) = v14;
  double result = *((double *)this + 8);
  *((void *)this + 8) = *((void *)a2 + 8);
  *((double *)a2 + 8) = result;
  *((unsigned char *)a2 + 88) = v10;
  *((void *)a2 + 4) = v12;
  *((void *)a2 + 5) = v13;
  return result;
}

uint64_t drawingV1::Stroke::Stroke(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 24) = 0;
  uint64_t v4 = (void ***)(a1 + 24);
  *(void *)(a1 + 4std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = 0;
  uint64_t v5 = (void ***)(a1 + 40);
  *(void *)a1 = &unk_1F1FB09E0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 8std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = 0;
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(_DWORD *)(a2 + 92) = 0;
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  uint64_t v7 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v6;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a2 + 8std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = 0;
  uint64_t v9 = *(void *)(a1 + 80);
  *(void *)(a1 + 8std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = v8;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  uint64_t v10 = *(void ***)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a2 + 24) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, v10);
  uint64_t v11 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v12 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v11;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  uint64_t v13 = *(void *)(a2 + 72);
  *(void *)(a2 + 72) = 0;
  uint64_t v14 = *(void *)(a1 + 72);
  *(void *)(a1 + 72) = v13;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  char v15 = *(void ***)(a2 + 56);
  *(void *)(a2 + 56) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)(a1 + 56), v15);
  unsigned int v16 = *(void ***)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](v5, v16);
  return a1;
}

drawingV1 *drawingV1::Stroke::operator=(drawingV1 *a1, uint64_t a2)
{
  if (a1 != (drawingV1 *)a2)
  {
    drawingV1::Stroke::Stroke((uint64_t)v5, a2);
    drawingV1::swap(a1, (drawingV1::Stroke *)v5, v3);
    drawingV1::Stroke::~Stroke((drawingV1::Stroke *)v5);
  }
  return a1;
}

uint64_t drawingV1::Stroke::formatText(drawingV1::Stroke *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "bounds");
  }
  char v6 = *((unsigned char *)this + 92);
  if ((v6 & 8) != 0)
  {
    PB::TextFormatter::format(a2, "createdWithFinger");
    char v6 = *((unsigned char *)this + 92);
    if ((v6 & 0x10) == 0)
    {
LABEL_5:
      if ((v6 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)this + 92) & 0x10) == 0)
  {
    goto LABEL_5;
  }
  PB::TextFormatter::format(a2, "hidden");
  if (*((unsigned char *)this + 92)) {
LABEL_6:
  }
    PB::TextFormatter::format(a2, "inkIndex");
LABEL_7:
  if (*((void *)this + 3)) {
    PB::TextFormatter::format();
  }
  if ((*((unsigned char *)this + 92) & 2) != 0) {
    PB::TextFormatter::format(a2, "pointsCount");
  }
  if (*((void *)this + 5)) {
    PB::TextFormatter::format();
  }
  uint64_t v7 = *((void *)this + 6);
  if (v7) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v7 + 32))(v7, a2, "strokeID");
  }
  if (*((void *)this + 7)) {
    PB::TextFormatter::format();
  }
  if ((*((unsigned char *)this + 92) & 4) != 0) {
    PB::TextFormatter::format(a2, "timestamp", *((double *)this + 8));
  }
  uint64_t v8 = *((void *)this + 9);
  if (v8) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v8 + 32))(v8, a2, "transform");
  }
  uint64_t v9 = *((void *)this + 10);
  if (v9) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v9 + 32))(v9, a2, "version");
  }

  return MEMORY[0x1F4147498](a2);
}

uint64_t drawingV1::Stroke::readFrom(drawingV1::Stroke *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
      break;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_21:
    if ((v11 & 7) == 4)
    {
      int v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        operator new();
      case 2u:
        operator new();
      case 3u:
        *((unsigned char *)this + 92) |= 1u;
        unint64_t v20 = *((void *)a2 + 1);
        unint64_t v21 = *((void *)a2 + 2);
        uint64_t v22 = *(void *)a2;
        if (v20 <= 0xFFFFFFFFFFFFFFF5 && v20 + 10 <= v21)
        {
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          do
          {
            unint64_t v26 = v20 + 1;
            *((void *)a2 + 1) = v20 + 1;
            char v27 = *(unsigned char *)(v22 + v20);
            v25 |= (unint64_t)(v27 & 0x7F) << v23;
            if ((v27 & 0x80) == 0) {
              goto LABEL_73;
            }
            v23 += 7;
            unint64_t v20 = v26;
            BOOL v14 = v24++ > 8;
          }
          while (!v14);
LABEL_57:
          uint64_t v25 = 0;
          goto LABEL_73;
        }
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v25 = 0;
        if (v21 <= v20) {
          unint64_t v21 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v21 == v20)
          {
            uint64_t v25 = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v47 = v20 + 1;
            char v48 = *(unsigned char *)(v22 + v20);
            *((void *)a2 + 1) = v47;
            v25 |= (unint64_t)(v48 & 0x7F) << v45;
            if (v48 < 0)
            {
              v45 += 7;
              unint64_t v20 = v47;
              BOOL v14 = v46++ > 8;
              if (v14) {
                goto LABEL_57;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              uint64_t v25 = 0;
            }
          }
          break;
        }
LABEL_73:
        *((void *)this + 2) = v25;
        goto LABEL_78;
      case 4u:
        *((unsigned char *)this + 92) |= 2u;
        unint64_t v28 = *((void *)a2 + 1);
        unint64_t v29 = *((void *)a2 + 2);
        uint64_t v30 = *(void *)a2;
        if (v28 <= 0xFFFFFFFFFFFFFFF5 && v28 + 10 <= v29)
        {
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          do
          {
            unint64_t v34 = v28 + 1;
            *((void *)a2 + 1) = v28 + 1;
            char v35 = *(unsigned char *)(v30 + v28);
            v33 |= (unint64_t)(v35 & 0x7F) << v31;
            if ((v35 & 0x80) == 0) {
              goto LABEL_77;
            }
            v31 += 7;
            unint64_t v28 = v34;
            BOOL v14 = v32++ > 8;
          }
          while (!v14);
LABEL_64:
          uint64_t v33 = 0;
          goto LABEL_77;
        }
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v33 = 0;
        if (v29 <= v28) {
          unint64_t v29 = *((void *)a2 + 1);
        }
        break;
      case 5u:
        operator new();
      case 6u:
        operator new();
      case 9u:
        *((unsigned char *)this + 92) |= 0x10u;
        unint64_t v36 = *((void *)a2 + 1);
        if (v36 >= *((void *)a2 + 2))
        {
          BOOL v39 = 0;
          *((unsigned char *)a2 + 24) = 1;
        }
        else
        {
          unint64_t v37 = v36 + 1;
          int v38 = *(unsigned __int8 *)(*(void *)a2 + v36);
          *((void *)a2 + 1) = v37;
          BOOL v39 = v38 != 0;
        }
        *((unsigned char *)this + 89) = v39;
        goto LABEL_78;
      case 0xAu:
        operator new();
      case 0xBu:
        *((unsigned char *)this + 92) |= 4u;
        unint64_t v40 = *((void *)a2 + 1);
        if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *((void *)a2 + 2))
        {
          *((void *)this + 8) = *(void *)(*(void *)a2 + v40);
          *((void *)a2 + 1) += 8;
        }
        else
        {
          *((unsigned char *)a2 + 24) = 1;
        }
        goto LABEL_78;
      case 0xCu:
        *((unsigned char *)this + 92) |= 8u;
        unint64_t v41 = *((void *)a2 + 1);
        if (v41 >= *((void *)a2 + 2))
        {
          BOOL v44 = 0;
          *((unsigned char *)a2 + 24) = 1;
        }
        else
        {
          unint64_t v42 = v41 + 1;
          int v43 = *(unsigned __int8 *)(*(void *)a2 + v41);
          *((void *)a2 + 1) = v42;
          BOOL v44 = v43 != 0;
        }
        *((unsigned char *)this + 88) = v44;
        goto LABEL_78;
      case 0xDu:
        operator new();
      case 0xEu:
        operator new();
      default:
        goto LABEL_19;
    }
    while (1)
    {
      if (v29 == v28)
      {
        uint64_t v33 = 0;
        *((unsigned char *)a2 + 24) = 1;
        goto LABEL_77;
      }
      unint64_t v51 = v28 + 1;
      char v52 = *(unsigned char *)(v30 + v28);
      *((void *)a2 + 1) = v51;
      v33 |= (unint64_t)(v52 & 0x7F) << v49;
      if ((v52 & 0x80) == 0) {
        break;
      }
      v49 += 7;
      unint64_t v28 = v51;
      BOOL v14 = v50++ > 8;
      if (v14) {
        goto LABEL_64;
      }
    }
    if (*((unsigned char *)a2 + 24)) {
      uint64_t v33 = 0;
    }
LABEL_77:
    *((void *)this + 4) = v33;
LABEL_78:
    unint64_t v2 = *((void *)a2 + 1);
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0) {
      return v4 == 0;
    }
  }
  char v15 = 0;
  unsigned int v16 = 0;
  unint64_t v11 = 0;
  if (v2 > v3) {
    unint64_t v3 = v2;
  }
  do
  {
    if (v3 == v2)
    {
      int v4 = 1;
      *((unsigned char *)a2 + 24) = 1;
      return v4 == 0;
    }
    unint64_t v17 = v2 + 1;
    char v18 = *(unsigned char *)(v8 + v2);
    *((void *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0) {
      goto LABEL_21;
    }
    v15 += 7;
    unint64_t v2 = v17;
    BOOL v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  uint64_t result = PB::Reader::skip(a2);
  if (result) {
    goto LABEL_78;
  }
  return result;
}

uint64_t drawingV1::Stroke::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 48);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  uint64_t v5 = *(const PB::Base **)(v3 + 80);
  if (v5) {
    this = PB::Writer::writeSubmessage(a2, v5);
  }
  char v6 = *(unsigned char *)(v3 + 92);
  if (v6)
  {
    this = PB::Writer::writeVarInt(a2);
    char v6 = *(unsigned char *)(v3 + 92);
  }
  if ((v6 & 2) != 0) {
    this = PB::Writer::writeVarInt(a2);
  }
  uint64_t v7 = *(const PB::Data **)(v3 + 24);
  if (v7) {
    this = PB::Writer::write(a2, v7);
  }
  uint64_t v8 = *(const PB::Base **)(v3 + 8);
  if (v8) {
    this = PB::Writer::writeSubmessage(a2, v8);
  }
  if ((*(unsigned char *)(v3 + 92) & 0x10) != 0) {
    this = PB::Writer::write(a2);
  }
  char v9 = *(const PB::Base **)(v3 + 72);
  if (v9) {
    this = PB::Writer::writeSubmessage(a2, v9);
  }
  char v10 = *(unsigned char *)(v3 + 92);
  if ((v10 & 4) != 0)
  {
    this = PB::Writer::write(a2, *(double *)(v3 + 64));
    char v10 = *(unsigned char *)(v3 + 92);
  }
  if ((v10 & 8) != 0) {
    this = PB::Writer::write(a2);
  }
  unint64_t v11 = *(const PB::Data **)(v3 + 56);
  if (v11) {
    this = PB::Writer::write(a2, v11);
  }
  unint64_t v12 = *(const PB::Data **)(v3 + 40);
  if (v12)
  {
    return PB::Writer::write(a2, v12);
  }
  return this;
}

BOOL drawingV1::Stroke::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a2 + 48);
  if (v4)
  {
    if (!v5 || !drawingV1::StrokeID::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t v7 = *(void *)(a2 + 80);
  if (v6)
  {
    if (!v7 || !drawingV1::StrokeID::operator==(v6, v7)) {
      return 0;
    }
  }
  else if (v7)
  {
    return 0;
  }
  if (*(unsigned char *)(a1 + 92))
  {
    if ((*(unsigned char *)(a2 + 92) & 1) == 0 || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 92))
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 92) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 92) & 2) == 0 || *(void *)(a1 + 32) != *(void *)(a2 + 32)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 92) & 2) != 0)
  {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24))
  {
    if (!v8 || (PB::Data::operator==() & 1) == 0 && *(void *)(a1 + 24) | *(void *)(a2 + 24)) {
      return 0;
    }
  }
  else if (v8)
  {
    return 0;
  }
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a2 + 8);
  if (v9)
  {
    if (!v10 || !drawingV1::Rectangle::operator==(v9, v10)) {
      return 0;
    }
  }
  else if (v10)
  {
    return 0;
  }
  char v11 = *(unsigned char *)(a1 + 92);
  char v12 = *(unsigned char *)(a2 + 92);
  if ((v11 & 0x10) != 0)
  {
    if ((*(unsigned char *)(a2 + 92) & 0x10) == 0 || *(unsigned __int8 *)(a1 + 89) != *(unsigned __int8 *)(a2 + 89)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 92) & 0x10) != 0)
  {
    return 0;
  }
  uint64_t v13 = *(void *)(a1 + 72);
  uint64_t v14 = *(void *)(a2 + 72);
  if (v13)
  {
    if (!v14 || !drawingV1::Transform::operator==(v13, v14)) {
      return 0;
    }
  }
  else if (v14)
  {
    return 0;
  }
  if ((v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || *(double *)(a1 + 64) != *(double *)(a2 + 64)) {
      return 0;
    }
  }
  else if ((v12 & 4) != 0)
  {
    return 0;
  }
  if ((v11 & 8) != 0)
  {
    if ((v12 & 8) == 0 || *(unsigned __int8 *)(a1 + 88) != *(unsigned __int8 *)(a2 + 88)) {
      return 0;
    }
  }
  else if ((v12 & 8) != 0)
  {
    return 0;
  }
  uint64_t v15 = *(void *)(a2 + 56);
  if (!*(void *)(a1 + 56))
  {
    if (!v15) {
      goto LABEL_58;
    }
    return 0;
  }
  if (!v15 || (PB::Data::operator==() & 1) == 0 && *(void *)(a1 + 56) | *(void *)(a2 + 56)) {
    return 0;
  }
LABEL_58:
  if (*(void *)(a1 + 40))
  {
    if (!*(void *)(a2 + 40)) {
      return 0;
    }
    if (PB::Data::operator==()) {
      return 1;
    }
    if (*(void *)(a1 + 40)) {
      return 0;
    }
  }
  return *(void *)(a2 + 40) == 0;
}

uint64_t drawingV1::Stroke::hash_value(drawingV1::Stroke *this)
{
  uint64_t v2 = *((void *)this + 6);
  if (!v2)
  {
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if ((*(unsigned char *)(v2 + 32) & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)(v2 + 32) & 2) != 0) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v4 = 0;
    if ((*(unsigned char *)(v2 + 32) & 4) != 0) {
      goto LABEL_5;
    }
LABEL_9:
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if ((*(unsigned char *)(v2 + 32) & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = *(void *)(v2 + 16);
  if ((*(unsigned char *)(v2 + 32) & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = *(void *)(v2 + 24);
LABEL_10:
  uint64_t v6 = v4 ^ v3 ^ v5;
LABEL_11:
  uint64_t v7 = *((void *)this + 10);
  if (!v7)
  {
    uint64_t v11 = 0;
    goto LABEL_21;
  }
  if ((*(unsigned char *)(v7 + 32) & 1) == 0)
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)(v7 + 32) & 2) != 0) {
      goto LABEL_14;
    }
LABEL_18:
    uint64_t v9 = 0;
    if ((*(unsigned char *)(v7 + 32) & 4) != 0) {
      goto LABEL_15;
    }
LABEL_19:
    uint64_t v10 = 0;
    goto LABEL_20;
  }
  uint64_t v8 = *(void *)(v7 + 8);
  if ((*(unsigned char *)(v7 + 32) & 2) == 0) {
    goto LABEL_18;
  }
LABEL_14:
  uint64_t v9 = *(void *)(v7 + 16);
  if ((*(unsigned char *)(v7 + 32) & 4) == 0) {
    goto LABEL_19;
  }
LABEL_15:
  uint64_t v10 = *(void *)(v7 + 24);
LABEL_20:
  uint64_t v11 = v9 ^ v8 ^ v10;
LABEL_21:
  if (*((unsigned char *)this + 92))
  {
    uint64_t v25 = *((void *)this + 2);
    if ((*((unsigned char *)this + 92) & 2) != 0) {
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if ((*((unsigned char *)this + 92) & 2) != 0)
    {
LABEL_23:
      uint64_t v24 = *((void *)this + 4);
      goto LABEL_26;
    }
  }
  uint64_t v24 = 0;
LABEL_26:
  if (*((void *)this + 3)) {
    uint64_t v12 = PBHashBytes();
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = (drawingV1::Rectangle *)*((void *)this + 1);
  if (v13) {
    uint64_t v14 = drawingV1::Rectangle::hash_value(v13);
  }
  else {
    uint64_t v14 = 0;
  }
  char v15 = *((unsigned char *)this + 92);
  if ((v15 & 0x10) != 0) {
    uint64_t v16 = *((unsigned __int8 *)this + 89);
  }
  else {
    uint64_t v16 = 0;
  }
  unint64_t v17 = (drawingV1::Transform *)*((void *)this + 9);
  if (v17)
  {
    uint64_t v18 = drawingV1::Transform::hash_value(v17);
    if ((v15 & 4) == 0) {
      goto LABEL_37;
    }
LABEL_40:
    if (*((double *)this + 8) == 0.0) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = *((void *)this + 8);
    }
    if ((v15 & 8) != 0) {
      goto LABEL_38;
    }
    goto LABEL_44;
  }
  uint64_t v18 = 0;
  if ((*((unsigned char *)this + 92) & 4) != 0) {
    goto LABEL_40;
  }
LABEL_37:
  uint64_t v19 = 0;
  if ((v15 & 8) != 0)
  {
LABEL_38:
    uint64_t v20 = *((unsigned __int8 *)this + 88);
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v20 = 0;
LABEL_45:
  if (*((void *)this + 7)) {
    uint64_t v21 = PBHashBytes();
  }
  else {
    uint64_t v21 = 0;
  }
  if (*((void *)this + 5)) {
    uint64_t v22 = PBHashBytes();
  }
  else {
    uint64_t v22 = 0;
  }
  return v11 ^ v6 ^ v25 ^ v24 ^ v12 ^ v14 ^ v16 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
}

uint64_t drawingV1::Stroke::makeStrokeID(uint64_t this)
{
  if (!*(void *)(this + 48)) {
    operator new();
  }
  return this;
}

uint64_t drawingV1::Stroke::makeVersion(uint64_t this)
{
  if (!*(void *)(this + 80)) {
    operator new();
  }
  return this;
}

uint64_t drawingV1::Stroke::makeBounds(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

uint64_t drawingV1::Stroke::makeTransform(uint64_t this)
{
  if (!*(void *)(this + 72)) {
    operator new();
  }
  return this;
}

BOOL PKStrokePointEqualToStrokePoint(const void *a1, const void *a2)
{
  return memcmp(a1, a2, 0x58uLL) == 0;
}

float PKCompressedStrokePoint::compressTimestamp(PKCompressedStrokePoint *this, double a2)
{
  return a2;
}

double PKCompressedStrokePoint::uncompressTimestamp(PKCompressedStrokePoint *this, float a2)
{
  return a2;
}

float PKCompressedStrokePoint::setTimestamp(PKCompressedStrokePoint *this, double a2, double a3)
{
  float result = a2 - a3;
  this->var1 = result;
  return result;
}

double PKCompressedStrokePoint::timestamp(PKCompressedStrokePoint *this, double a2)
{
  return this->var1 + a2;
}

double PKCompressedStrokePoint::timestamp(PKCompressedStrokePoint *this)
{
  return this->var1;
}

double PKCompressedStrokePoint::uncompressLocation(PKCompressedStrokePoint *this, _PKPoint a2)
{
  return a2.var0;
}

float PKCompressedStrokePoint::compressLocation(PKCompressedStrokePoint *this, CGPoint a2)
{
  return a2.x;
}

float PKCompressedStrokePoint::setLocation(PKCompressedStrokePoint *this, CGPoint a2)
{
  float result = a2.x;
  float y = a2.y;
  this->var0.var0 = result;
  this->var0.var1 = y;
  return result;
}

double PKCompressedStrokePoint::location(PKCompressedStrokePoint *this)
{
  return this->var0.var0;
}

double PKCompressedStrokePoint::uncompressRadius(PKCompressedStrokePoint *this, float a2)
{
  return a2;
}

float PKCompressedStrokePoint::compressRadius(PKCompressedStrokePoint *this, double a2)
{
  return a2;
}

float PKCompressedStrokePoint::setRadius(PKCompressedStrokePoint *this, double a2)
{
  float result = a2;
  this->var2 = result;
  return result;
}

double PKCompressedStrokePoint::radius(PKCompressedStrokePoint *this)
{
  return this->var2;
}

uint64_t PKCompressedStrokePoint::compressAspectRatio(PKCompressedStrokePoint *this, double a2)
{
  double v2 = a2 * 1000.0;
  double v3 = 0.0;
  if (v2 >= 0.0)
  {
    double v3 = v2;
    if (v2 > 65535.0) {
      double v3 = 65535.0;
    }
  }
  return (int)v3;
}

double PKCompressedStrokePoint::uncompressAspectRatio(PKCompressedStrokePoint *this)
{
  return (double)this / 1000.0;
}

PKCompressedStrokePoint *PKCompressedStrokePoint::setAspectRatio(PKCompressedStrokePoint *this, double a2)
{
  double v2 = a2 * 1000.0;
  double v3 = 0.0;
  if (v2 >= 0.0)
  {
    double v3 = v2;
    if (v2 > 65535.0) {
      double v3 = 65535.0;
    }
  }
  this->var3 = (int)v3;
  return this;
}

double PKCompressedStrokePoint::aspectRatio(PKCompressedStrokePoint *this, double a2)
{
  LOWORD(a2) = this->var3;
  return (double)*(unint64_t *)&a2 / 1000.0;
}

uint64_t PKCompressedStrokePoint::compressEdgeWidth(PKCompressedStrokePoint *this, double a2)
{
  double v2 = a2 * 10.0;
  double v3 = 0.0;
  if (v2 >= 0.0)
  {
    double v3 = v2;
    if (v2 > 65535.0) {
      double v3 = 65535.0;
    }
  }
  return (int)v3;
}

double PKCompressedStrokePoint::uncompressEdgeWidth(PKCompressedStrokePoint *this)
{
  return (double)this / 10.0;
}

PKCompressedStrokePoint *PKCompressedStrokePoint::setEdgeWidth(PKCompressedStrokePoint *this, double a2)
{
  double v2 = a2 * 10.0;
  double v3 = 0.0;
  if (v2 >= 0.0)
  {
    double v3 = v2;
    if (v2 > 65535.0) {
      double v3 = 65535.0;
    }
  }
  this->var4 = (int)v3;
  return this;
}

double PKCompressedStrokePoint::edgeWidth(PKCompressedStrokePoint *this, double a2)
{
  LOWORD(a2) = this->var4;
  return (double)*(unint64_t *)&a2 / 10.0;
}

uint64_t PKCompressedStrokePoint::compressForce(PKCompressedStrokePoint *this, double a2)
{
  double v2 = a2 * 1000.0;
  double v3 = 0.0;
  if (v2 >= 0.0)
  {
    double v3 = v2;
    if (v2 > 65535.0) {
      double v3 = 65535.0;
    }
  }
  return (int)v3;
}

PKCompressedStrokePoint *PKCompressedStrokePoint::setForce(PKCompressedStrokePoint *this, double a2)
{
  double v2 = a2 * 1000.0;
  double v3 = 0.0;
  if (v2 >= 0.0)
  {
    double v3 = v2;
    if (v2 > 65535.0) {
      double v3 = 65535.0;
    }
  }
  this->var5 = (int)v3;
  return this;
}

double PKCompressedStrokePoint::uncompressForce(PKCompressedStrokePoint *this)
{
  return (double)this / 1000.0;
}

double PKCompressedStrokePoint::force(PKCompressedStrokePoint *this, double a2)
{
  LOWORD(a2) = this->var5;
  return (double)*(unint64_t *)&a2 / 1000.0;
}

uint64_t PKCompressedStrokePoint::compressAzimuth(PKCompressedStrokePoint *this, long double a2)
{
  double v3 = fmod(a2, 6.28318531);
  double v4 = 0.0;
  if (a2 <= 6.28318531 && a2 >= 0.0) {
    double v3 = a2;
  }
  if (v3 < 0.0) {
    double v3 = v3 + 6.28318531;
  }
  if (v3 == 0.0) {
    double v6 = 0.0;
  }
  else {
    double v6 = v3 * 10430.2192;
  }
  if (v6 >= 0.0)
  {
    double v4 = v6;
    if (v6 > 65535.0) {
      double v4 = 65535.0;
    }
  }
  return (int)v4;
}

uint64_t PKCompressedStrokePoint::setAzimuth(PKCompressedStrokePoint *this, long double a2)
{
  uint64_t result = PKCompressedStrokePoint::compressAzimuth(this, a2);
  this->var6 = result;
  return result;
}

double PKCompressedStrokePoint::uncompressAzimuth(PKCompressedStrokePoint *this)
{
  return (double)this / 10430.2192;
}

double PKCompressedStrokePoint::azimuth(PKCompressedStrokePoint *this, double a2)
{
  LOWORD(a2) = this->var6;
  return (double)*(unint64_t *)&a2 / 10430.2192;
}

uint64_t PKCompressedStrokePoint::compressAltitude(PKCompressedStrokePoint *this, double a2)
{
  double v2 = a2 * 41720.8768;
  double v3 = 0.0;
  if (v2 >= 0.0)
  {
    double v3 = v2;
    if (v2 > 65535.0) {
      double v3 = 65535.0;
    }
  }
  return (int)v3;
}

PKCompressedStrokePoint *PKCompressedStrokePoint::setAltitude(PKCompressedStrokePoint *this, double a2)
{
  double v2 = a2 * 41720.8768;
  double v3 = 0.0;
  if (v2 >= 0.0)
  {
    double v3 = v2;
    if (v2 > 65535.0) {
      double v3 = 65535.0;
    }
  }
  this->var7 = (int)v3;
  return this;
}

double PKCompressedStrokePoint::uncompressAltitude(PKCompressedStrokePoint *this)
{
  return (double)this / 41720.8768;
}

double PKCompressedStrokePoint::altitude(PKCompressedStrokePoint *this, double a2)
{
  LOWORD(a2) = this->var7;
  return (double)*(unint64_t *)&a2 / 41720.8768;
}

uint64_t PKCompressedStrokePoint::compressOpacity(PKCompressedStrokePoint *this, double a2)
{
  double v2 = a2 * 32767.5;
  double v3 = 0.0;
  if (v2 >= 0.0)
  {
    double v3 = v2;
    if (v2 > 65535.0) {
      double v3 = 65535.0;
    }
  }
  return (int)v3;
}

PKCompressedStrokePoint *PKCompressedStrokePoint::setOpacity(PKCompressedStrokePoint *this, double a2)
{
  double v2 = a2 * 32767.5;
  double v3 = 0.0;
  if (v2 >= 0.0)
  {
    double v3 = v2;
    if (v2 > 65535.0) {
      double v3 = 65535.0;
    }
  }
  this->var8 = (int)v3;
  return this;
}

double PKCompressedStrokePoint::uncompressOpacity(PKCompressedStrokePoint *this)
{
  return (double)this / 32767.5;
}

double PKCompressedStrokePoint::opacity(PKCompressedStrokePoint *this, double a2)
{
  LOWORD(a2) = this->var8;
  return (double)*(unint64_t *)&a2 / 32767.5;
}

double PKCompressedStrokePoint::uncompressRadius2(PKCompressedStrokePoint *this, float a2)
{
  return a2;
}

float PKCompressedStrokePoint::compressRadius2(PKCompressedStrokePoint *this, double a2)
{
  return a2;
}

float PKCompressedStrokePoint::setRadius2(PKCompressedStrokePoint *this, double a2)
{
  float result = a2;
  this->var9 = result;
  return result;
}

double PKCompressedStrokePoint::radius2(PKCompressedStrokePoint *this)
{
  return this->var9;
}

double PKCompressedStrokePointWithDefaultValues@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t PKConvertToCompressedStrokePoint@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, unint64_t a3@<D0>)
{
  LODWORD(a3) = *(_DWORD *)result;
  *(_DWORD *)(a2 + 8) = *(_DWORD *)result;
  *(void *)a2 = *(void *)(result + 4);
  *(_WORD *)(a2 + 16) = *(_WORD *)(result + 14);
  *(_DWORD *)(a2 + 2std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = *(_DWORD *)(result + 18);
  LOBYTE(a3) = *(unsigned char *)(result + 23);
  double v3 = (double)a3 / 255.0 * 32767.5;
  double v4 = 0.0;
  double v5 = 0.0;
  if (v3 >= 0.0)
  {
    double v5 = v3;
    if (v3 > 65535.0) {
      double v5 = 65535.0;
    }
  }
  *(_WORD *)(a2 + 26) = (int)v5;
  LOWORD(v3) = *(_WORD *)(result + 12);
  unint64_t v6 = 10.0;
  *(float *)&double v3 = (double)*(unint64_t *)&v3 / 10.0;
  *(_DWORD *)(a2 + 12) = LODWORD(v3);
  LOBYTE(v6) = *(unsigned char *)(result + 22);
  double v7 = (double)v6 / 162.338042 * 41720.8768;
  if (v7 >= 0.0)
  {
    double v4 = v7;
    if (v7 > 65535.0) {
      double v4 = 65535.0;
    }
  }
  *(_WORD *)(a2 + 24) = (int)v4;
  *(_DWORD *)(a2 + 28) = LODWORD(v3);
  *(_WORD *)(a2 + 18) = 0;
  return result;
}

double PKCompressedStrokePointV1::opacity(PKCompressedStrokePointV1 *this, double a2)
{
  LOBYTE(a2) = *((unsigned char *)this + 23);
  return (double)*(unint64_t *)&a2 / 255.0;
}

double PKCompressedStrokePointV1::radius(PKCompressedStrokePointV1 *this, double a2)
{
  LOWORD(a2) = *((_WORD *)this + 6);
  return (double)*(unint64_t *)&a2 / 10.0;
}

double PKCompressedStrokePointV1::altitude(PKCompressedStrokePointV1 *this, double a2)
{
  LOBYTE(a2) = *((unsigned char *)this + 22);
  return (double)*(unint64_t *)&a2 / 162.338042;
}

float32_t PKCompressStrokePoint@<S0>(PKCompressedStrokePoint *a1@<X0>, double a2@<D0>, float32x2_t *a3@<X8>)
{
  float32_t v5 = *(double *)&a1->var0 - a2;
  *a3 = vcvt_f32_f64(*(float64x2_t *)&a1->var1);
  double v6 = *(double *)&a1[1].var0;
  float32_t v7 = *(double *)&a1->var7;
  a3[1].f32[0] = v5;
  a3[1].f32[1] = v7;
  double v8 = v6 * 1000.0;
  double v9 = 0.0;
  double v10 = 0.0;
  if (v8 >= 0.0)
  {
    double v10 = v8;
    if (v8 > 65535.0) {
      double v10 = 65535.0;
    }
  }
  a3[2].i16[0] = (int)v10;
  double v11 = *(double *)&a1[1].var1 * 10.0;
  if (v11 >= 0.0)
  {
    double v9 = *(double *)&a1[1].var1 * 10.0;
    if (v11 > 65535.0) {
      double v9 = 65535.0;
    }
  }
  a3[2].i16[1] = (int)v9;
  double v12 = *(double *)&a1[1].var3 * 1000.0;
  double v13 = 0.0;
  double v14 = 0.0;
  if (v12 >= 0.0)
  {
    double v14 = *(double *)&a1[1].var3 * 1000.0;
    if (v12 > 65535.0) {
      double v14 = 65535.0;
    }
  }
  a3[2].i16[2] = (int)v14;
  a3[2].i16[3] = PKCompressedStrokePoint::compressAzimuth(a1, *(long double *)&a1[1].var7);
  double v15 = *(double *)&a1[2].var0 * 41720.8768;
  if (v15 >= 0.0)
  {
    double v13 = *(double *)&a1[2].var0 * 41720.8768;
    if (v15 > 65535.0) {
      double v13 = 65535.0;
    }
  }
  a3[3].i16[0] = (int)v13;
  double v16 = *(double *)&a1[2].var1 * 32767.5;
  double v17 = 0.0;
  if (v16 >= 0.0)
  {
    double v17 = *(double *)&a1[2].var1 * 32767.5;
    if (v16 > 65535.0) {
      double v17 = 65535.0;
    }
  }
  a3[3].i16[1] = (int)v17;
  float32_t result = *(double *)&a1[2].var3;
  a3[3].f32[1] = result;
  return result;
}

double PKDecompressStrokePoint@<D0>(PKCompressedStrokePoint *a1@<X0>, double a2@<D0>, uint64_t a3@<X8>)
{
  float var2 = a1->var2;
  *(double *)&unint64_t v4 = a1->var1;
  *(double *)a3 = *(double *)&v4 + a2;
  *(float64x2_t *)(a3 + 8) = vcvtq_f64_f32((float32x2_t)a1->var0);
  *(double *)&unint64_t v5 = var2;
  LOWORD(v4) = a1->var3;
  *(double *)(a3 + 24) = var2;
  *(double *)(a3 + 32) = (double)v4 / 1000.0;
  LOWORD(v5) = a1->var4;
  unint64_t v6 = 10.0;
  double v7 = (double)v5 / 10.0;
  LOWORD(v6) = a1->var5;
  *(double *)(a3 + 4std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = v7;
  *(double *)(a3 + 48) = (double)v6 / 1000.0;
  LOWORD(v7) = a1->var6;
  unint64_t v8 = 0x40C45F1C0E995AB9;
  double v9 = (double)*(unint64_t *)&v7 / 10430.2192;
  LOWORD(v8) = a1->var7;
  *(double *)(a3 + 56) = v9;
  *(double *)(a3 + 64) = (double)v8 / 41720.8768;
  LOWORD(v9) = a1->var8;
  double var9 = a1->var9;
  double result = (double)*(unint64_t *)&v9 / 32767.5;
  *(double *)(a3 + 72) = result;
  *(double *)(a3 + 8std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = var9;
  return result;
}

id PKDescriptionOfStrokePoint(_PKStrokePoint *a1)
{
  double v2 = NSStringFromCGPoint(a1->location);
  double v3 = [NSString stringWithFormat:@"location: %@\n\ttimestamp: %f\n\tforce: %f\n\tazimuth: %f\n\taltitude: %f\n\tradius: %f\n\topacity: %f\n\tedgeWidth: %f\n\taspectRatio: %f\n", v2, *(void *)&a1->timestamp, *(void *)&a1->force, *(void *)&a1->azimuth, *(void *)&a1->altitude, *(void *)&a1->radius, *(void *)&a1->opacity, *(void *)&a1->edgeWidth, *(void *)&a1->aspectRatio];

  return v3;
}

void sub_1C46FFF28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float PKCompressedStrokePointV1::setTimestamp(PKCompressedStrokePointV1 *this, double a2, double a3)
{
  float result = a2 - a3;
  *(float *)this = result;
  return result;
}

double PKCompressedStrokePointV1::timestamp(PKCompressedStrokePointV1 *this, double a2)
{
  return *(float *)this + a2;
}

float PKCompressedStrokePointV1::setLocation(PKCompressedStrokePointV1 *this, CGPoint a2)
{
  float result = a2.x;
  float y = a2.y;
  *((float *)this + 1) = result;
  *((float *)this + 2) = y;
  return result;
}

double PKCompressedStrokePointV1::location(PKCompressedStrokePointV1 *this)
{
  return *((float *)this + 1);
}

uint64_t PKCompressedStrokePointV1::setRadius(uint64_t this, double a2)
{
  double v2 = a2 * 10.0;
  double v3 = 0.0;
  if (v2 >= 0.0)
  {
    double v3 = v2;
    if (v2 > 65535.0) {
      double v3 = 65535.0;
    }
  }
  *(_WORD *)(this + 12) = (int)v3;
  return this;
}

uint64_t PKCompressedStrokePointV1::setAspectRatio(uint64_t this, double a2)
{
  double v2 = a2 * 1000.0;
  double v3 = 0.0;
  if (v2 >= 0.0)
  {
    double v3 = v2;
    if (v2 > 65535.0) {
      double v3 = 65535.0;
    }
  }
  *(_WORD *)(this + 14) = (int)v3;
  return this;
}

double PKCompressedStrokePointV1::aspectRatio(PKCompressedStrokePointV1 *this, double a2)
{
  LOWORD(a2) = *((_WORD *)this + 7);
  return (double)*(unint64_t *)&a2 / 1000.0;
}

uint64_t PKCompressedStrokePointV1::setEdgeWidth(uint64_t this, double a2)
{
  double v2 = a2 * 10.0;
  double v3 = 0.0;
  if (v2 >= 0.0)
  {
    double v3 = v2;
    if (v2 > 65535.0) {
      double v3 = 65535.0;
    }
  }
  *(_WORD *)(this + 16) = (int)v3;
  return this;
}

double PKCompressedStrokePointV1::edgeWidth(PKCompressedStrokePointV1 *this, double a2)
{
  LOWORD(a2) = *((_WORD *)this + 8);
  return (double)*(unint64_t *)&a2 / 10.0;
}

uint64_t PKCompressedStrokePointV1::setForce(uint64_t this, double a2)
{
  double v2 = a2 * 1000.0;
  double v3 = 0.0;
  if (v2 >= 0.0)
  {
    double v3 = v2;
    if (v2 > 65535.0) {
      double v3 = 65535.0;
    }
  }
  *(_WORD *)(this + 18) = (int)v3;
  return this;
}

double PKCompressedStrokePointV1::force(PKCompressedStrokePointV1 *this, double a2)
{
  LOWORD(a2) = *((_WORD *)this + 9);
  return (double)*(unint64_t *)&a2 / 1000.0;
}

void PKCompressedStrokePointV1::setAzimuth(PKCompressedStrokePointV1 *this, long double a2)
{
  double v4 = fmod(a2, 6.28318531);
  double v5 = 0.0;
  if (a2 <= 6.28318531 && a2 >= 0.0) {
    double v4 = a2;
  }
  if (v4 < 0.0) {
    double v4 = v4 + 6.28318531;
  }
  if (v4 == 0.0) {
    double v7 = 0.0;
  }
  else {
    double v7 = v4 * 10430.2192;
  }
  if (v7 >= 0.0)
  {
    double v5 = v7;
    if (v7 > 65535.0) {
      double v5 = 65535.0;
    }
  }
  *((_WORD *)this + 1std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = (int)v5;
}

double PKCompressedStrokePointV1::azimuth(PKCompressedStrokePointV1 *this, double a2)
{
  LOWORD(a2) = *((_WORD *)this + 10);
  return (double)*(unint64_t *)&a2 / 10430.2192;
}

uint64_t PKCompressedStrokePointV1::setAltitude(uint64_t this, double a2)
{
  double v2 = a2 * 162.338042;
  double v3 = 0.0;
  if (v2 >= 0.0)
  {
    double v3 = v2;
    if (v2 > 255.0) {
      double v3 = 255.0;
    }
  }
  *(unsigned char *)(this + 22) = (int)v3;
  return this;
}

uint64_t PKCompressedStrokePointV1::setOpacity(uint64_t this, double a2)
{
  double v2 = a2 * 255.0;
  double v3 = 0.0;
  if (v2 >= 0.0)
  {
    double v3 = v2;
    if (v2 > 255.0) {
      double v3 = 255.0;
    }
  }
  *(unsigned char *)(this + 23) = (int)v3;
  return this;
}

uint64_t PKConvertToCompressedStrokePointV1@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *(_DWORD *)(result + 8);
  *(void *)(a2 + 4) = *(void *)result;
  unint64_t v2 = *(void *)(result + 16);
  *(void *)(a2 + 14) = v2;
  LOWORD(v2) = *(_WORD *)(result + 26);
  double v3 = (double)v2 / 32767.5 * 255.0;
  double v4 = 0.0;
  double v5 = 0.0;
  if (v3 >= 0.0)
  {
    double v5 = v3;
    if (v3 > 255.0) {
      double v5 = 255.0;
    }
  }
  *(unsigned char *)(a2 + 23) = (int)v5;
  double v6 = *(float *)(result + 12) * 10.0;
  if (v6 >= 0.0)
  {
    double v4 = *(float *)(result + 12) * 10.0;
    if (v6 > 65535.0) {
      double v4 = 65535.0;
    }
  }
  *(_WORD *)(a2 + 12) = (int)v4;
  LOWORD(v4) = *(_WORD *)(result + 24);
  double v7 = (double)*(unint64_t *)&v4 / 41720.8768 * 162.338042;
  double v8 = 0.0;
  if (v7 >= 0.0)
  {
    double v8 = v7;
    if (v7 > 255.0) {
      double v8 = 255.0;
    }
  }
  *(unsigned char *)(a2 + 22) = (int)v8;
  return result;
}

void sub_1C47007F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C4700AD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4700C04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4700DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4701100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *__p,uint64_t a40)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1C4701378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47015A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C470177C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4701A54(_Unwind_Exception *a1)
{
  double v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t HasValidInkForDetectionItem(void *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v24 = a2;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v4) {
    goto LABEL_19;
  }
  uint64_t v23 = *(void *)v27;
  uint64_t v18 = @"com.apple.ink.crayon";
  do
  {
    uint64_t v25 = v4;
    for (uint64_t i = 0; i != v25; ++i)
    {
      if (*(void *)v27 != v23) {
        objc_enumerationMutation(obj);
      }
      double v6 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "strokeUUID", v18);
      double v7 = [v24 _visibleStrokeForIdentifier:v6];

      double v8 = [v7 ink];
      double v9 = [v8 identifier];
      if ([v9 isEqualToString:@"com.apple.ink.pen"]) {
        goto LABEL_13;
      }
      double v10 = [v7 ink];
      double v11 = [v10 identifier];
      if ([v11 isEqualToString:@"com.apple.ink.pencil"]) {
        goto LABEL_12;
      }
      double v12 = [v7 ink];
      double v13 = [v12 identifier];
      if ([v13 isEqualToString:@"com.apple.ink.monoline"]) {
        goto LABEL_11;
      }
      uint64_t v21 = [v7 ink];
      double v14 = [v21 identifier];
      if ([v14 isEqualToString:@"com.apple.ink.fountainpen"])
      {

LABEL_11:
LABEL_12:

LABEL_13:
        continue;
      }
      uint64_t v20 = [v7 ink];
      double v15 = [v20 identifier];
      char v19 = [v15 isEqualToString:v18];

      if ((v19 & 1) == 0)
      {
        uint64_t v16 = 0;
        goto LABEL_20;
      }
    }
    uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v4);
LABEL_19:
  uint64_t v16 = 1;
LABEL_20:

  return v16;
}

void sub_1C4701D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1C4701EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47020D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C4702158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47021B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C470220C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47022BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C470240C(_Unwind_Exception *a1)
{
  double v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1C4702484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47024E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4702574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4702660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1C47026E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4702790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4702848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C470293C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4702A40(_Unwind_Exception *a1)
{
  double v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1C4702AB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4702B18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4702BA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4702C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1C4702D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4702DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4702E7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4702F70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4703074(_Unwind_Exception *a1)
{
  double v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1C4703138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47031B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4703220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4703268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47032B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4703360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *___ZL42getDDShouldUseLightLinksForResultSymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!qword_1EB3C60B8)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = ___ZL28DataDetectorsCoreLibraryCorePPc_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E64C9998;
    uint64_t v7 = 0;
    qword_1EB3C60B8 = _sl_dlopen();
    id v3 = (void *)v5[0];
    unint64_t v2 = (void *)qword_1EB3C60B8;
    if (qword_1EB3C60B8)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  unint64_t v2 = (void *)qword_1EB3C60B8;
LABEL_5:
  float result = dlsym(v2, "DDShouldUseLightLinksForResult");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_147 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL28DataDetectorsCoreLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB3C60B8 = result;
  return result;
}

Class ___ZL29getDDDetectionControllerClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1EB3C60C8)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = ___ZL26DataDetectorsUILibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E64C99B0;
    uint64_t v6 = 0;
    qword_1EB3C60C8 = _sl_dlopen();
    unint64_t v2 = (void *)v4[0];
    if (!qword_1EB3C60C8)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("DDDetectionController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    unint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_1EB3C60C0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL26DataDetectorsUILibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB3C60C8 = result;
  return result;
}

uint64_t _PKHandleRemotePencilSettingDidChangeNotification(uint64_t a1, void *a2)
{
  id v3 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v5 = 0;
    _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Handle remote pencil settings did change notification", v5, 2u);
  }

  return [a2 _handleRemotePencilSettingDidChangeNotification];
}

void sub_1C4705684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4705824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4705A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4705C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__22(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void sub_1C4705FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1C4706070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47061EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __PKAllowDoubleBuffering_block_invoke()
{
  id v0 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.PencilKit"];
  _MergedGlobals_1_0 = [v0 BOOLForKey:@"PKAllowDoubleBuffering"];
}

void sub_1C4708818(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_1C4709EC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

void sub_1C4709FEC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

BOOL distanceToRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v10.origin.double x = a3;
  v10.origin.float y = a4;
  v10.size.double width = a5;
  v10.size.double height = a6;
  v9.double x = a1;
  v9.float y = a2;
  return CGRectContainsPoint(v10, v9);
}

void sub_1C470BBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C470C7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getWFConfiguredSystemActionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1EB3C6108)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __WorkflowUIServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E64C9C00;
    uint64_t v6 = 0;
    qword_1EB3C6108 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_1EB3C6108)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("WFConfiguredSystemAction");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_1EB3C6100 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __WorkflowUIServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB3C6108 = result;
  return result;
}

void sub_1C470CEC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C470CF50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1C470CFE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_1C470D074(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1C470D2EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C470D544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getDDContextMenuActionClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getDDContextMenuActionClass_softClass;
  uint64_t v7 = getDDContextMenuActionClass_softClass;
  if (!getDDContextMenuActionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getDDContextMenuActionClass_block_invoke;
    v3[3] = &unk_1E64C5478;
    v3[4] = &v4;
    __getDDContextMenuActionClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1C4712248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C4712498(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

void sub_1C4712908(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1C4712D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkDataDetectorsAllResultsKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DataDetectorsUILibrary();
  uint64_t result = dlsym(v2, "kDataDetectorsAllResultsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_151 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t DataDetectorsUILibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!DataDetectorsUILibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __DataDetectorsUILibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E64C9CD8;
    uint64_t v5 = 0;
    DataDetectorsUILibraryCore_frameworkLibrarfloat y = _sl_dlopen();
    uint64_t v1 = (void *)v3[0];
    uint64_t v0 = DataDetectorsUILibraryCore_frameworkLibrary;
    if (DataDetectorsUILibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      uint64_t v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return DataDetectorsUILibraryCore_frameworkLibrary;
}

uint64_t __DataDetectorsUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  DataDetectorsUILibraryCore_frameworkLibrarfloat y = result;
  return result;
}

void *__getkDataDetectorsMiddleTextSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DataDetectorsUILibrary();
  uint64_t result = dlsym(v2, "kDataDetectorsMiddleText");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB3C6128 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getDDContextMenuActionClass_block_invoke(uint64_t a1)
{
  DataDetectorsUILibrary();
  Class result = objc_getClass("DDContextMenuAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDDContextMenuActionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getDDContextMenuConfigurationClass_block_invoke(v3);
  }
  return result;
}

Class __getDDContextMenuConfigurationClass_block_invoke(uint64_t a1)
{
  DataDetectorsUILibrary();
  Class result = objc_getClass("DDContextMenuConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDDContextMenuConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)abort_report_np();
    return (Class)-[NSObject _pkDebugStringRepresentation](v3);
  }
  return result;
}

id PKDebugStringRepresentation(void *a1)
{
  uint64_t v1 = NSString;
  id v2 = a1;
  uint64_t v3 = (objc_class *)objc_opt_class();
  long long v4 = NSStringFromClass(v3);
  uint64_t v5 = [v1 stringWithFormat:@"<%@: %p>", v4, v2];

  return v5;
}

uint64_t legacy_drawing::Rectangle::Rectangle(uint64_t this)
{
  *(void *)this = &unk_1F1FB0660;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

{
  *(void *)this = &unk_1F1FB0660;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

void legacy_drawing::Rectangle::~Rectangle(legacy_drawing::Rectangle *this)
{
  PB::Base::~Base(this);

  JUMPOUT(0x1C8783F10);
}

float legacy_drawing::Rectangle::Rectangle(legacy_drawing::Rectangle *this, const legacy_drawing::Rectangle *a2)
{
  *(void *)this = &unk_1F1FB0660;
  *((_DWORD *)this + 6) = 0;
  char v2 = *((unsigned char *)a2 + 24);
  if ((v2 & 2) != 0)
  {
    float result = *((float *)a2 + 3);
    char v3 = 2;
    *((unsigned char *)this + 24) = 2;
    *((float *)this + 3) = result;
    char v2 = *((unsigned char *)a2 + 24);
    if ((v2 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v3 = 0;
  if ((*((unsigned char *)a2 + 24) & 4) != 0)
  {
LABEL_5:
    float result = *((float *)a2 + 4);
    v3 |= 4u;
    *((unsigned char *)this + 24) = v3;
    *((float *)this + 4) = result;
    char v2 = *((unsigned char *)a2 + 24);
  }
LABEL_6:
  if ((v2 & 8) == 0)
  {
    if ((v2 & 1) == 0) {
      return result;
    }
LABEL_10:
    float result = *((float *)a2 + 2);
    *((unsigned char *)this + 24) = v3 | 1;
    *((float *)this + 2) = result;
    return result;
  }
  float result = *((float *)a2 + 5);
  v3 |= 8u;
  *((unsigned char *)this + 24) = v3;
  *((float *)this + 5) = result;
  if (*((unsigned char *)a2 + 24)) {
    goto LABEL_10;
  }
  return result;
}

uint64_t legacy_drawing::Rectangle::operator=(uint64_t a1, const legacy_drawing::Rectangle *a2)
{
  if ((const legacy_drawing::Rectangle *)a1 != a2)
  {
    legacy_drawing::Rectangle::Rectangle((legacy_drawing::Rectangle *)&v6, a2);
    int v3 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = v8;
    int v8 = v3;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    long long v7 = v4;
    PB::Base::~Base((PB::Base *)&v6);
  }
  return a1;
}

float legacy_drawing::swap(legacy_drawing *this, legacy_drawing::Rectangle *a2, legacy_drawing::Rectangle *a3)
{
  int v3 = *((_DWORD *)this + 6);
  *((_DWORD *)this + 6) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v3;
  int v4 = *((_DWORD *)this + 3);
  *((_DWORD *)this + 3) = *((_DWORD *)a2 + 3);
  *((_DWORD *)a2 + 3) = v4;
  int v5 = *((_DWORD *)this + 4);
  *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v5;
  int v6 = *((_DWORD *)this + 5);
  *((_DWORD *)this + 5) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v6;
  float result = *((float *)this + 2);
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  *((float *)a2 + 2) = result;
  return result;
}

float legacy_drawing::Rectangle::Rectangle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F1FB0660;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 2std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = *(_DWORD *)(a2 + 20);
  float result = *(float *)(a2 + 8);
  *(float *)(a1 + 8) = result;
  return result;
}

{
  float result;

  *(void *)a1 = &unk_1F1FB0660;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 2std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = *(_DWORD *)(a2 + 20);
  float result = *(float *)(a2 + 8);
  *(float *)(a1 + 8) = result;
  return result;
}

uint64_t legacy_drawing::Rectangle::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    long long v7 = &unk_1F1FB0660;
    int v3 = *(_DWORD *)(a2 + 24);
    *(_DWORD *)(a2 + 24) = 0;
    int v9 = *(_DWORD *)(a1 + 24);
    long long v4 = *(_OWORD *)(a1 + 8);
    long long v5 = *(_OWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 24) = v3;
    *(_OWORD *)(a1 + 8) = v5;
    long long v8 = v4;
    PB::Base::~Base((PB::Base *)&v7);
  }
  return a1;
}

uint64_t legacy_drawing::Rectangle::formatText(legacy_drawing::Rectangle *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 24);
  if (v5)
  {
    PB::TextFormatter::format(a2, "height", *((float *)this + 2));
    char v5 = *((unsigned char *)this + 24);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)this + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "originX", *((float *)this + 3));
  char v5 = *((unsigned char *)this + 24);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PB::TextFormatter::format(a2, "originY", *((float *)this + 4));
  if ((*((unsigned char *)this + 24) & 8) != 0) {
LABEL_5:
  }
    PB::TextFormatter::format(a2, "width", *((float *)this + 5));
LABEL_6:

  return MEMORY[0x1F4147498](a2);
}

uint64_t legacy_drawing::Rectangle::readFrom(legacy_drawing::Rectangle *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
    {
      char v15 = 0;
      unsigned int v16 = 0;
      unint64_t v11 = 0;
      if (v2 > v3) {
        unint64_t v3 = v2;
      }
      do
      {
        if (v3 == v2)
        {
          int v4 = 1;
          *((unsigned char *)a2 + 24) = 1;
          return v4 == 0;
        }
        unint64_t v17 = v2 + 1;
        char v18 = *(unsigned char *)(v8 + v2);
        *((void *)a2 + 1) = v17;
        v11 |= (unint64_t)(v18 & 0x7F) << v15;
        if ((v18 & 0x80) == 0) {
          goto LABEL_21;
        }
        v15 += 7;
        unint64_t v2 = v17;
        BOOL v14 = v16++ > 8;
      }
      while (!v14);
LABEL_19:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      goto LABEL_37;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_21:
    if ((v11 & 7) == 4) {
      break;
    }
    switch((v11 >> 3))
    {
      case 1u:
        *((unsigned char *)this + 24) |= 2u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2)) {
          goto LABEL_34;
        }
        *((_DWORD *)this + 3) = *(_DWORD *)(*(void *)a2 + v2);
        goto LABEL_36;
      case 2u:
        *((unsigned char *)this + 24) |= 4u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2)) {
          goto LABEL_34;
        }
        *((_DWORD *)this + 4) = *(_DWORD *)(*(void *)a2 + v2);
        goto LABEL_36;
      case 3u:
        *((unsigned char *)this + 24) |= 8u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((void *)a2 + 2)) {
          goto LABEL_34;
        }
        *((_DWORD *)this + 5) = *(_DWORD *)(*(void *)a2 + v2);
        goto LABEL_36;
      case 4u:
        *((unsigned char *)this + 24) |= 1u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 <= 0xFFFFFFFFFFFFFFFBLL && v2 + 4 <= *((void *)a2 + 2))
        {
          *((_DWORD *)this + 2) = *(_DWORD *)(*(void *)a2 + v2);
LABEL_36:
          unint64_t v2 = *((void *)a2 + 1) + 4;
          *((void *)a2 + 1) = v2;
        }
        else
        {
LABEL_34:
          *((unsigned char *)a2 + 24) = 1;
        }
        break;
      default:
        goto LABEL_19;
    }
LABEL_37:
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
      return v4 == 0;
    }
  }
  int v4 = 0;
  return v4 == 0;
}

uint64_t legacy_drawing::Rectangle::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  char v4 = *(unsigned char *)(this + 24);
  if ((v4 & 2) != 0)
  {
    this = PB::Writer::write(a2, *(float *)(this + 12));
    char v4 = *(unsigned char *)(v3 + 24);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      this = PB::Writer::write(a2, *(float *)(v3 + 20));
      if ((*(unsigned char *)(v3 + 24) & 1) == 0) {
        return this;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)(this + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  this = PB::Writer::write(a2, *(float *)(v3 + 16));
  char v4 = *(unsigned char *)(v3 + 24);
  if ((v4 & 8) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((v4 & 1) == 0) {
    return this;
  }
LABEL_9:
  float v5 = *(float *)(v3 + 8);

  return PB::Writer::write(a2, v5);
}

BOOL legacy_drawing::Rectangle::operator==(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(a1 + 24) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 24) & 2) == 0 || *(float *)(a1 + 12) != *(float *)(a2 + 12)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 24) & 2) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 24) & 4) != 0)
  {
    if ((*(unsigned char *)(a2 + 24) & 4) == 0 || *(float *)(a1 + 16) != *(float *)(a2 + 16)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 24) & 4) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 24) & 8) != 0)
  {
    if ((*(unsigned char *)(a2 + 24) & 8) == 0 || *(float *)(a1 + 20) != *(float *)(a2 + 20)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 24) & 8) != 0)
  {
    return 0;
  }
  BOOL v2 = (*(unsigned char *)(a2 + 24) & 1) == 0;
  if (*(unsigned char *)(a1 + 24)) {
    return (*(unsigned char *)(a2 + 24) & 1) != 0 && *(float *)(a1 + 8) == *(float *)(a2 + 8);
  }
  return v2;
}

uint64_t legacy_drawing::Rectangle::hash_value(legacy_drawing::Rectangle *this)
{
  if ((*((unsigned char *)this + 24) & 2) == 0)
  {
    uint64_t v1 = 0;
    if ((*((unsigned char *)this + 24) & 4) != 0) {
      goto LABEL_3;
    }
LABEL_15:
    uint64_t v3 = 0;
    if ((*((unsigned char *)this + 24) & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
  float v8 = *((float *)this + 3);
  uint64_t v1 = LODWORD(v8);
  if (v8 == 0.0) {
    uint64_t v1 = 0;
  }
  if ((*((unsigned char *)this + 24) & 4) == 0) {
    goto LABEL_15;
  }
LABEL_3:
  float v2 = *((float *)this + 4);
  uint64_t v3 = LODWORD(v2);
  if (v2 == 0.0) {
    uint64_t v3 = 0;
  }
  if ((*((unsigned char *)this + 24) & 8) != 0)
  {
LABEL_6:
    float v4 = *((float *)this + 5);
    uint64_t v5 = LODWORD(v4);
    if (v4 == 0.0) {
      uint64_t v5 = 0;
    }
    if (*((unsigned char *)this + 24)) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v7 = 0;
    return v3 ^ v1 ^ v5 ^ v7;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((*((unsigned char *)this + 24) & 1) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  float v6 = *((float *)this + 2);
  uint64_t v7 = LODWORD(v6);
  if (v6 == 0.0) {
    uint64_t v7 = 0;
  }
  return v3 ^ v1 ^ v5 ^ v7;
}

void sub_1C47153C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
}

void sub_1C4716B34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4716C0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4716CF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4716D80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C4716F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4719420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C4719E98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_1C471C2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C472126C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 104));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100](&a9, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
}

void sub_1C4722234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location)
{
}

void sub_1C4722454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t DKUDeviceRGBColorSpace()
{
  if (qword_1EB3C6138 != -1) {
    dispatch_once(&qword_1EB3C6138, &__block_literal_global_68);
  }
  return _MergedGlobals_152;
}

uint64_t DKUDeviceCMYKColorSpace()
{
  if (qword_1EB3C6148 != -1) {
    dispatch_once(&qword_1EB3C6148, &__block_literal_global_2_0);
  }
  return qword_1EB3C6140;
}

CGColorSpaceRef __DKUDeviceCMYKColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceCMYK();
  qword_1EB3C6140 = (uint64_t)result;
  return result;
}

uint64_t DKUDeviceGrayColorSpace()
{
  if (qword_1EB3C6158 != -1) {
    dispatch_once(&qword_1EB3C6158, &__block_literal_global_4_0);
  }
  return qword_1EB3C6150;
}

CGColorSpaceRef __DKUDeviceGrayColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceGray();
  qword_1EB3C6150 = (uint64_t)result;
  return result;
}

uint64_t DKUDeviceLabColorSpace()
{
  if (qword_1EB3C6168 != -1) {
    dispatch_once(&qword_1EB3C6168, &__block_literal_global_6);
  }
  return qword_1EB3C6160;
}

CGColorSpaceRef __DKUDeviceLabColorSpace_block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)whitePoint = xmmword_1C482B350;
  uint64_t v4 = 0x3FF16BD900000000;
  memset(blackPoint, 0, sizeof(blackPoint));
  v1[0] = xmmword_1C482B368;
  v1[1] = unk_1C482B378;
  CGColorSpaceRef result = CGColorSpaceCreateLab(whitePoint, blackPoint, (const CGFloat *)v1);
  qword_1EB3C6160 = (uint64_t)result;
  return result;
}

CGColorRef DKUCGColorCreateWithUIColor(void *a1)
{
  uint64_t v1 = (CGColor *)[a1 CGColor];

  return CGColorCreateCopy(v1);
}

CGColorRef DKUCGColorCreateDeviceGray(CGFloat a1, CGFloat a2)
{
  components[2] = *(CGFloat *)MEMORY[0x1E4F143B8];
  components[0] = a1;
  components[1] = a2;
  if (qword_1EB3C6158 != -1) {
    dispatch_once(&qword_1EB3C6158, &__block_literal_global_4_0);
  }
  return CGColorCreate((CGColorSpaceRef)qword_1EB3C6150, components);
}

CGPatternRef DKUCGPatternCreateWithImageAndTransform(CGImage *a1, long long *a2)
{
  CGImageRetain(a1);
  CGFloat v4 = *MEMORY[0x1E4F1DAD8];
  CGFloat v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  size_t Width = CGImageGetWidth(a1);
  size_t Height = CGImageGetHeight(a1);
  if (a2)
  {
    long long v8 = a2[1];
    long long v13 = *a2;
    long long v14 = v8;
    long long v9 = a2[2];
  }
  else
  {
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v13 = *MEMORY[0x1E4F1DAB8];
    long long v14 = v10;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  long long v15 = v9;
  v16.size.double height = (double)Height;
  v16.size.double width = (double)Width;
  *(_OWORD *)&v12.a = v13;
  *(_OWORD *)&v12.c = v14;
  *(_OWORD *)&v12.tdouble x = v9;
  v16.origin.double x = v4;
  v16.origin.float y = v5;
  return CGPatternCreate(a1, v16, &v12, (double)Width, v16.size.height, kCGPatternTilingConstantSpacing, 1, &DKUCGPatternCreateWithImageAndTransform_sCallbacks);
}

void DKUDrawImageAtOriginInContext(CGImage *a1, CGContext *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F1DAD8];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
  double Width = (double)CGImageGetWidth(a1);
  double Height = (double)CGImageGetHeight(a1);
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  double v10 = Width;

  CGContextDrawImage(a2, *(CGRect *)&v8, a1);
}

CGPatternRef DKUCGPatternCreateWithImage(CGImage *a1)
{
  return DKUCGPatternCreateWithImageAndTransform(a1, 0);
}

CGColorRef DKUCGColorCreatePatternWithImageAndTransform(CGImage *a1, long long *a2)
{
  v6[1] = *(CGFloat *)MEMORY[0x1E4F143B8];
  uint64_t v2 = DKUCGPatternCreateWithImageAndTransform(a1, a2);
  Pattern = CGColorSpaceCreatePattern(0);
  v6[0] = 1.0;
  CGColorRef v4 = CGColorCreateWithPattern(Pattern, v2, v6);
  CGColorSpaceRelease(Pattern);
  CGPatternRelease(v2);
  return v4;
}

CGColorRef DKUCGColorCreatePatternWithImage(CGImage *a1)
{
  return DKUCGColorCreatePatternWithImageAndTransform(a1, 0);
}

CGColor *DKUCreateCGColorFromHSBInColorSpace(double a1, double a2, double a3, double a4)
{
  CGColorRef v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1618]) initWithHue:a1 saturation:a2 brightness:a3 alpha:a4];
  uint64_t v5 = (CGColor *)[v4 CGColor];
  CGColorRetain(v5);

  return v5;
}

uint64_t DKUHSBFromCGColorRef(CGColor *a1, double *a2, double *a3, double *a4, CGFloat *a5)
{
  *a5 = 0.0;
  *a4 = 0.0;
  *a3 = 0.0;
  *a2 = 0.0;
  ColorSpace = CGColorGetColorSpace(a1);
  if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB || CGColorGetNumberOfComponents(a1) != 4) {
    return 0;
  }
  *a5 = CGColorGetAlpha(a1);
  Components = CGColorGetComponents(a1);
  DKURGBToHSB(a2, a3, a4, *Components, Components[1], Components[2]);
  return 1;
}

double DKURGBToHSB(double *a1, double *a2, double *a3, double a4, double a5, double a6)
{
  if (a4 < a5 || a4 < a6)
  {
    if (a5 >= a4) {
      double v7 = a4;
    }
    else {
      double v7 = a5;
    }
    if (a4 >= a6) {
      double v8 = a6;
    }
    else {
      double v8 = a4;
    }
    BOOL v9 = a5 < a4 || a5 < a6;
    if (v9) {
      double v10 = a6;
    }
    else {
      double v10 = a5;
    }
    if (v9) {
      double v11 = v7;
    }
    else {
      double v11 = v8;
    }
  }
  else
  {
    if (a5 >= a6) {
      double v11 = a6;
    }
    else {
      double v11 = a5;
    }
    double v10 = a4;
  }
  double v12 = 0.0;
  if (v10 <= 0.0)
  {
    double v14 = 0.0;
  }
  else
  {
    double v13 = v10 - v11;
    double v14 = (v10 - v11) / v10;
    if (v14 != 0.0)
    {
      double v15 = (v10 - a5) / v13;
      double v16 = (v10 - a6) / v13;
      if (v10 == a4)
      {
        if (v11 == a5) {
          double v12 = v16 + 5.0;
        }
        else {
          double v12 = 1.0 - v15;
        }
      }
      else
      {
        BOOL v18 = v10 == a5;
        double v19 = (v10 - a4) / v13;
        if (v18)
        {
          if (v11 == a6) {
            double v12 = v19 + 1.0;
          }
          else {
            double v12 = 3.0 - v16;
          }
        }
        else if (v11 == a4)
        {
          double v12 = v15 + 3.0;
        }
        else
        {
          double v12 = 5.0 - v19;
        }
      }
    }
  }
  *a3 = v10;
  double result = v12 / 6.0;
  *a1 = v12 / 6.0;
  *a2 = v14;
  return result;
}

double *DKUHSBToRGB(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  double v6 = a4 * 6.0;
  BOOL v7 = a4 == 1.0;
  double v8 = 0.0;
  if (!v7) {
    double v8 = v6;
  }
  uint64_t v9 = (uint64_t)v8;
  double v10 = v8 - (double)(uint64_t)v8;
  double v11 = (1.0 - a5) * a6;
  double v12 = (1.0 - a5 * v10) * a6;
  double v13 = (1.0 - a5 * (1.0 - v10)) * a6;
  double v14 = a6;
  double v15 = v13;
  switch(v9)
  {
    case 0:
      goto LABEL_10;
    case 1:
      double v14 = v12;
      double v15 = a6;
      goto LABEL_10;
    case 2:
      double v14 = v11;
      double v15 = a6;
      double v11 = v13;
      goto LABEL_10;
    case 3:
      double v14 = v11;
      double v15 = v12;
      goto LABEL_8;
    case 4:
      double v14 = v13;
      double v15 = v11;
LABEL_8:
      double v11 = a6;
      goto LABEL_10;
    case 5:
      double v14 = a6;
      double v15 = v11;
      double v11 = v12;
LABEL_10:
      *double result = v14;
      *a2 = v15;
      *a3 = v11;
      break;
    default:
      return result;
  }
  return result;
}

double DKUCMYKToRGB(double *a1, double *a2, double *a3, double a4, double a5, double a6, double a7)
{
  *a1 = 1.0 - fmin(a7 + a4 * (1.0 - a7), 1.0);
  *a2 = 1.0 - fmin(a7 + a5 * (1.0 - a7), 1.0);
  double result = 1.0 - fmin(a7 + a6 * (1.0 - a7), 1.0);
  *a3 = result;
  return result;
}

BOOL DKUColorIsBlack(CGColor *a1)
{
  ColorSpace = CGColorGetColorSpace(a1);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  Components = CGColorGetComponents(a1);
  double v5 = 0.0;
  if (Model)
  {
    if (Model == kCGColorSpaceModelCMYK)
    {
      Components += 3;
      double v5 = 1.0;
    }
    else
    {
      if (Model != kCGColorSpaceModelRGB || *Components != 0.0 || Components[1] != 0.0) {
        return 0;
      }
      Components += 2;
    }
  }
  return *Components == v5;
}

CGFloat DKUColorLightness(CGColor *a1)
{
  ColorSpace = CGColorGetColorSpace(a1);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  switch(Model)
  {
    case kCGColorSpaceModelMonochrome:
      return *CGColorGetComponents(a1);
    case kCGColorSpaceModelCMYK:
      Components = CGColorGetComponents(a1);
      double v8 = Components[3];
      double v9 = 1.0 - fmin(v8 + *Components * (1.0 - v8), 1.0);
      double v10 = 1.0 - fmin(v8 + Components[1] * (1.0 - v8), 1.0);
      double v11 = 1.0 - fmin(v8 + Components[2] * (1.0 - v8), 1.0);
      double v5 = fmax(fmax(v9, v10), v11) + fmin(fmin(v9, v10), v11);
      return v5 * 0.5;
    case kCGColorSpaceModelRGB:
      CGColorRef v4 = CGColorGetComponents(a1);
      double v5 = fmax(fmax(*v4, v4[1]), v4[2]) + fmin(fmin(*v4, v4[1]), v4[2]);
      return v5 * 0.5;
  }
  NSLog(&cfstr_WarningTesting.isa);
  return 0.0;
}

CGContext *DKUCreateRGBABitmapContext(int a1, double a2, CGFloat a3, CGFloat a4)
{
  if (qword_1EB3C6138 != -1) {
    dispatch_once(&qword_1EB3C6138, &__block_literal_global_68);
  }
  double v8 = CGBitmapContextCreate(0, (unint64_t)(a2 * a4), (unint64_t)(a3 * a4), 8uLL, (4 * (unint64_t)(a2 * a4) + 31) & 0xFFFFFFFFFFFFFFE0, (CGColorSpaceRef)_MergedGlobals_152, 0x2002u);
  CGAffineTransformMakeScale(&transform, a4, a4);
  CGContextConcatCTM(v8, &transform);
  if (a1)
  {
    CGContextTranslateCTM(v8, 0.0, a3);
    CGAffineTransformMakeScale(&v10, 1.0, -1.0);
    CGContextConcatCTM(v8, &v10);
  }
  return v8;
}

unint64_t DKUBitmapGetAlignedBytesPerRow(uint64_t a1)
{
  return (a1 + 31) & 0xFFFFFFFFFFFFFFE0;
}

CGColorRef DKUCreateCheckerBoardColor(CGColor *a1, CGColor *a2, CGFloat a3, CGFloat a4)
{
  double v8 = a3 + a3;
  double v9 = a4 + a4;
  CGAffineTransform v10 = DKUCreateRGBABitmapContext(0, a3 + a3, a4 + a4, 1.0);
  if (!v10) {
    return 0;
  }
  double v11 = v10;
  CGContextSetFillColorWithColor(v10, a1);
  v15.origin.double x = 0.0;
  v15.origin.float y = 0.0;
  v15.size.double width = v8;
  v15.size.double height = v9;
  CGContextFillRect(v11, v15);
  CGContextSetFillColorWithColor(v11, a2);
  v16.origin.double x = 0.0;
  v16.origin.float y = 0.0;
  v16.size.double width = a3;
  v16.size.double height = a4;
  CGContextFillRect(v11, v16);
  v17.origin.double x = a3;
  v17.origin.float y = a4;
  v17.size.double width = a3;
  v17.size.double height = a4;
  CGContextFillRect(v11, v17);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  if (!Image) {
    return 0;
  }
  CGColorRef PatternWithImageAndTransform = DKUCGColorCreatePatternWithImageAndTransform(Image, 0);
  CGImageRelease(Image);
  return PatternWithImageAndTransform;
}

uint64_t DKUPatternColorFromGradient(CGGradient *a1, CGFloat a2, CGFloat a3)
{
  double v6 = DKUCreateRGBABitmapContext(1, 1.0, a2, a3);
  if (!v6) {
    return 0;
  }
  BOOL v7 = v6;
  v13.double x = 0.0;
  v13.float y = 0.0;
  v14.double x = 0.0;
  v14.float y = a2;
  CGContextDrawLinearGradient(v6, a1, v13, v14, 0);
  Image = CGBitmapContextCreateImage(v7);
  CGContextRelease(v7);
  uint64_t v9 = [MEMORY[0x1E4FB1818] imageWithCGImage:Image scale:0 orientation:a3];
  CGImageRelease(Image);
  if (!v9) {
    return 0;
  }
  CGAffineTransform v10 = (void *)MEMORY[0x1E4FB1618];

  return [v10 colorWithPatternImage:v9];
}

double DKUColorGetAlpha(CGColor *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  long long v2 = __const_DKUColorGetAlpha_rgba;
  long long v3 = unk_1C482B398;
  DKUColorGetRGBAComponents(a1, &v2);
  return *((double *)&v3 + 1);
}

float32x2_t DKUColorGetVectorFloat3(CGColor *a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = (float64x2_t)__const_DKUColorGetVectorFloat3_rgba;
  v2[1] = (float64x2_t)unk_1C482B3B8;
  DKUColorGetRGBAComponents(a1, v2);
  return vcvt_f32_f64(v2[0]);
}

double DKUColorGetVectorFloat4(CGColor *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float64x2_t v2 = (float64x2_t)__const_DKUColorIsEqualToColorIgnoringOpacity_secondColorRGBA;
  float64x2_t v3 = (float64x2_t)unk_1C482B498;
  DKUColorGetRGBAComponents(a1, &v2);
  *(void *)&double result = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v2), v3).u64[0];
  return result;
}

double DKUCalculateHue(double a1, double a2, double a3)
{
  double v3 = a3 + -6.0;
  if (a3 < 6.0) {
    double v3 = a3;
  }
  if (a3 < 0.0) {
    double v4 = a3 + 6.0;
  }
  else {
    double v4 = v3;
  }
  if (v4 < 1.0)
  {
    double v5 = a2 - a1;
    return a1 + v5 * v4;
  }
  if (v4 >= 3.0)
  {
    if (v4 < 4.0)
    {
      double v5 = a2 - a1;
      double v4 = 4.0 - v4;
      return a1 + v5 * v4;
    }
    return a1;
  }
  return a2;
}

uint64_t DKUConvertsRGBToHSL(uint64_t result, uint64_t a2)
{
  double v2 = *(double *)result;
  double v3 = *(double *)(result + 8);
  double v4 = *(double *)(result + 16);
  double v5 = fmax(fmax(*(double *)result, v3), v4);
  double v6 = fmin(fmin(*(double *)result, v3), v4);
  double v7 = v5 - v6;
  double v8 = 0.0;
  double v9 = 0.0;
  if (vabdd_f64(v5, v6) >= 0.00999999978)
  {
    if (v5 == v2)
    {
      double v10 = (v3 - v4) / v7;
      double v11 = 360.0;
    }
    else
    {
      if (v5 == v3)
      {
        double v10 = (v4 - v2) / v7;
        uint64_t v12 = 0x405E000000000000;
      }
      else
      {
        double v10 = (v2 - v3) / v7;
        uint64_t v12 = 0x406E000000000000;
      }
      double v11 = *(double *)&v12;
    }
    double v9 = v11 + v10 * 60.0;
  }
  double v13 = v5 + v6;
  double v14 = v13 * 0.5;
  if (v7 != 0.0)
  {
    if (v14 <= 0.5) {
      double v8 = v7 / v13;
    }
    else {
      double v8 = v7 / (2.0 - v13);
    }
  }
  double v15 = v9 + -360.0;
  if (v9 < 360.0) {
    double v15 = v9;
  }
  uint64_t v16 = *(void *)(result + 24);
  *(double *)a2 = v15 / 360.0;
  *(double *)(a2 + _Block_object_dispose(&STACK[0x260], 8) = v8;
  *(double *)(a2 + 16) = v14;
  *(void *)(a2 + 24) = v16;
  return result;
}

uint64_t DKUConvertHSLToSRGB(uint64_t result, uint64_t a2)
{
  double v2 = *(double *)(result + 8);
  double v3 = *(double *)(result + 16);
  if (fabs(v2) >= 0.00999999978)
  {
    double v6 = v2 + v3 - v3 * v2;
    double v5 = v3 * (v2 + 1.0);
    if (v3 > 0.5) {
      double v5 = v6;
    }
    double v7 = -(v5 - v3 * 2.0);
    double v8 = *(double *)result * 6.0;
    double v9 = v8 + 2.0;
    double v10 = v8 + 2.0 + -6.0;
    if (v8 + 2.0 < 6.0) {
      double v10 = v8 + 2.0;
    }
    if (v9 < 0.0) {
      double v11 = v9 + 6.0;
    }
    else {
      double v11 = v10;
    }
    if (v11 >= 1.0)
    {
      double v3 = v5;
      if (v11 < 3.0 || (double v3 = v7, v11 >= 4.0))
      {
LABEL_16:
        double v13 = v8 + -6.0;
        if (v8 < 6.0) {
          double v13 = *(double *)result * 6.0;
        }
        if (v8 < 0.0) {
          double v13 = v8 + 6.0;
        }
        if (v13 >= 1.0)
        {
          double v4 = v5;
          if (v13 < 3.0 || (double v4 = v7, v13 >= 4.0))
          {
LABEL_26:
            double v15 = v8 + -2.0;
            double v16 = v15 + -6.0;
            if (v15 < 6.0) {
              double v16 = v15;
            }
            if (v15 < 0.0) {
              double v17 = v15 + 6.0;
            }
            else {
              double v17 = v16;
            }
            if (v17 >= 1.0)
            {
              if (v17 < 3.0) {
                goto LABEL_37;
              }
              if (v17 >= 4.0)
              {
                double v5 = v7;
                goto LABEL_37;
              }
              double v18 = v5 - v7;
              double v17 = 4.0 - v17;
            }
            else
            {
              double v18 = v5 - v7;
            }
            double v5 = v7 + v18 * v17;
            goto LABEL_37;
          }
          double v14 = v5 - v7;
          double v13 = 4.0 - v13;
        }
        else
        {
          double v14 = v5 - v7;
        }
        double v4 = v7 + v14 * v13;
        goto LABEL_26;
      }
      double v12 = v5 - v7;
      double v11 = 4.0 - v11;
    }
    else
    {
      double v12 = v5 - v7;
    }
    double v3 = v7 + v12 * v11;
    goto LABEL_16;
  }
  double v4 = *(double *)(result + 16);
  double v5 = v4;
LABEL_37:
  uint64_t v19 = *(void *)(result + 24);
  *(double *)a2 = v3;
  *(double *)(a2 + _Block_object_dispose(&STACK[0x260], 8) = v4;
  *(double *)(a2 + 16) = v5;
  *(void *)(a2 + 24) = v19;
  return result;
}

double DKUColoGetLuminance(CGColor *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  long long v2 = __const_DKUColorIsEqualToColorIgnoringOpacity_secondColorRGBA;
  *(_OWORD *)double v3 = unk_1C482B498;
  DKUColorGetRGBAComponents(a1, &v2);
  return *((double *)&v2 + 1) * 0.7152 + *(double *)&v2 * 0.2126 + v3[0] * 0.0722;
}

uint64_t DKUTransformColorFromRGBA(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  long long v4 = __const_DKUTransformColorFromRGBA_hsla;
  *(_OWORD *)double v5 = unk_1C482B3D8;
  DKUConvertsRGBToHSL(a1, (uint64_t)&v4);
  v5[0] = 1.0 - v5[0];
  return DKUConvertHSLToSRGB((uint64_t)&v4, a2);
}

uint64_t DKUInverseTransformColorFromRGBA(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  long long v4 = __const_DKUTransformColorFromRGBA_hsla;
  *(_OWORD *)double v5 = unk_1C482B3D8;
  DKUConvertsRGBToHSL(a1, (uint64_t)&v4);
  v5[0] = 1.0 - v5[0];
  return DKUConvertHSLToSRGB((uint64_t)&v4, a2);
}

uint64_t DKUConvertRGBAForDarkStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  long long v4 = __const_DKUTransformColorFromRGBA_hsla;
  *(_OWORD *)double v5 = unk_1C482B3D8;
  DKUConvertsRGBToHSL(a1, (uint64_t)&v4);
  v5[0] = 1.0 - v5[0];
  return DKUConvertHSLToSRGB((uint64_t)&v4, a2);
}

uint64_t DKUConvertRGBAForLightStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  long long v4 = __const_DKUTransformColorFromRGBA_hsla;
  *(_OWORD *)double v5 = unk_1C482B3D8;
  DKUConvertsRGBToHSL(a1, (uint64_t)&v4);
  v5[0] = 1.0 - v5[0];
  return DKUConvertHSLToSRGB((uint64_t)&v4, a2);
}

CGColorRef DKUConvertColorForDarkStyle(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = __const_DKUConvertColorForDarkStyle_rgba;
  v6[1] = unk_1C482B3F8;
  ConvertedToCGColorRef SRGB = DKUCGColorCreateConvertedToSRGB(a1);
  DKUColorGetRGBAComponents(ConvertedToSRGB, v6);
  long long v4 = __const_DKUConvertColorForDarkStyle_retValue;
  long long v5 = unk_1C482B418;
  long long v7 = __const_DKUTransformColorFromRGBA_hsla;
  *(_OWORD *)double v8 = unk_1C482B3D8;
  DKUConvertsRGBToHSL((uint64_t)v6, (uint64_t)&v7);
  v8[0] = 1.0 - v8[0];
  DKUConvertHSLToSRGB((uint64_t)&v7, (uint64_t)&v4);
  CGColorRef SRGB = CGColorCreateSRGB(*(CGFloat *)&v4, *((CGFloat *)&v4 + 1), *(CGFloat *)&v5, *((CGFloat *)&v5 + 1));
  CFAutorelease(SRGB);
  CGColorRelease(ConvertedToSRGB);
  return SRGB;
}

CGColorRef DKUConvertColorForLightStyle(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = __const_DKUConvertColorForLightStyle_rgba;
  v6[1] = unk_1C482B438;
  ConvertedToCGColorRef SRGB = DKUCGColorCreateConvertedToSRGB(a1);
  DKUColorGetRGBAComponents(ConvertedToSRGB, v6);
  long long v4 = __const_DKUConvertColorForLightStyle_retValue;
  long long v5 = unk_1C482B458;
  long long v7 = __const_DKUTransformColorFromRGBA_hsla;
  *(_OWORD *)double v8 = unk_1C482B3D8;
  DKUConvertsRGBToHSL((uint64_t)v6, (uint64_t)&v7);
  v8[0] = 1.0 - v8[0];
  DKUConvertHSLToSRGB((uint64_t)&v7, (uint64_t)&v4);
  CGColorRef SRGB = CGColorCreateSRGB(*(CGFloat *)&v4, *((CGFloat *)&v4 + 1), *(CGFloat *)&v5, *((CGFloat *)&v5 + 1));
  CFAutorelease(SRGB);
  CGColorRelease(ConvertedToSRGB);
  return SRGB;
}

CGColorRef DKUTransformColor(uint64_t a1, int a2)
{
  if (a2) {
    return DKUConvertColorForDarkStyle(a1);
  }
  else {
    return DKUConvertColorForLightStyle(a1);
  }
}

uint64_t DKUTransformRGBA(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v5 = __const_DKUTransformColorFromRGBA_hsla;
  *(_OWORD *)uint64_t v6 = unk_1C482B3D8;
  DKUConvertsRGBToHSL(a1, (uint64_t)&v5);
  v6[0] = 1.0 - v6[0];
  return DKUConvertHSLToSRGB((uint64_t)&v5, a3);
}

BOOL DKUColorIsEqualToColor(CGColor *a1, CGColor *a2)
{
  return DKUColorIsEqualToColorIgnoringOpacity(a1, a2, 0);
}

BOOL DKUColorIsEqualToColorIgnoringOpacity(CGColor *a1, CGColor *a2, char a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v9 = __const_DKUColorIsEqualToColorIgnoringOpacity_firstColorRGBA;
  *(_OWORD *)double v10 = unk_1C482B478;
  DKUColorGetRGBAComponents(a1, &v9);
  long long v7 = __const_DKUColorIsEqualToColorIgnoringOpacity_secondColorRGBA;
  long long v8 = unk_1C482B498;
  DKUColorGetRGBAComponents(a2, &v7);
  if (*(double *)&v9 != *(double *)&v7
    && vabdd_f64(*(double *)&v9, *(double *)&v7) >= fabs(*(double *)&v7 * 0.000000999999997)
    || *((double *)&v9 + 1) != *((double *)&v7 + 1)
    && vabdd_f64(*((double *)&v9 + 1), *((double *)&v7 + 1)) >= fabs(*((double *)&v7 + 1) * 0.000000999999997))
  {
    return 0;
  }
  BOOL v5 = v10[0] != *(double *)&v8 && vabdd_f64(v10[0], *(double *)&v8) >= fabs(*(double *)&v8 * 0.000000999999997);
  BOOL result = !v5;
  if (!v5 && (a3 & 1) == 0) {
    return v10[1] == *((double *)&v8 + 1)
  }
        || vabdd_f64(v10[1], *((double *)&v8 + 1)) < fabs(*((double *)&v8 + 1) * 0.000000999999997);
  return result;
}

void PKProtobufUnknownFields::PKProtobufUnknownFields(PKProtobufUnknownFields *this)
{
  *(void *)this = 0;
  operator new();
}

void sub_1C4724CE8(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;
  MEMORY[0x1C8783F10](v3, 0x10C402FEFCB83);
  std::unique_ptr<PB::Writer>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void PKProtobufUnknownFields::~PKProtobufUnknownFields(PKProtobufUnknownFields *this)
{
}

{
  std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0);
}

const void ***PKProtobufUnknownFields::writeTo(const void ***result, char **a2)
{
  long long v4 = **result;
  uint64_t v3 = (*result)[1];
  size_t v5 = v4 - v3;
  if (v4 != v3)
  {
    uint64_t v6 = result;
    size_t v7 = (size_t)a2[2];
    long long v8 = *a2;
    if (v7 < (unint64_t)&(*a2)[v5])
    {
      long long v9 = a2[1];
      size_t v10 = v7 - (void)v9;
      if (v10 <= v5) {
        size_t v11 = v4 - v3;
      }
      else {
        size_t v11 = v10;
      }
      size_t v12 = v11 + v10;
      double v13 = (char *)malloc_type_realloc(a2[1], v11 + v10, 0x8352531FuLL);
      if (!v13)
      {
        exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
        double v15 = std::bad_alloc::bad_alloc(exception);
        __cxa_throw(v15, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
      }
      long long v8 = &v13[v8 - v9];
      a2[1] = v13;
      a2[2] = &v13[v12];
      *a2 = v8;
      uint64_t v3 = (*v6)[1];
      size_t v5 = (unsigned char *)**v6 - v3;
    }
    BOOL result = (const void ***)memcpy(v8, v3, v5);
    *a2 += (unsigned char *)**v6 - (unsigned char *)(*v6)[1];
  }
  return result;
}

BOOL PKProtobufUnknownFields::_incrementRecursionDepth(PKProtobufUnknownFields *this)
{
  unint64_t v1 = *((void *)this + 1) + 1;
  *((void *)this + 1) = v1;
  return v1 < 0x41;
}

PKProtobufUnknownFields *PKProtobufUnknownFields::_decrementRecursionDepth(PKProtobufUnknownFields *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (v1) {
    *((void *)this + 1) = v1 - 1;
  }
  return this;
}

BOOL PKProtobufUnknownFields::add(PKProtobufUnknownFields *this, int a2, int a3, PB::Reader *a4)
{
  if (a2 == -1) {
    __assert_rtn("add", "PKProtobufUnknownFields.cpp", 76, "tag != TAG_DONT_WRITE");
  }
  BOOL result = 0;
  switch(a3)
  {
    case 0:
      unint64_t v8 = *((void *)a4 + 1);
      if (v8 < 0xFFFFFFFFFFFFFFF6)
      {
        unint64_t v9 = *((void *)a4 + 2);
        if (v8 + 10 <= v9)
        {
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          uint64_t v37 = *(void *)a4;
          do
          {
            unint64_t v38 = v8 + 1;
            *((void *)a4 + 1) = v8 + 1;
            char v39 = *(unsigned char *)(v37 + v8);
            v36 |= (unint64_t)(v39 & 0x7F) << v34;
            if ((v39 & 0x80) == 0) {
              break;
            }
            v34 += 7;
            unint64_t v8 = v38;
            BOOL v17 = v35++ > 8;
          }
          while (!v17);
          goto LABEL_58;
        }
      }
      else
      {
        unint64_t v9 = *((void *)a4 + 2);
      }
      char v27 = 0;
      unsigned int v28 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = *(void *)a4;
      if (v9 <= v8) {
        unint64_t v9 = *((void *)a4 + 1);
      }
      while (v9 != v8)
      {
        unint64_t v31 = v8 + 1;
        char v32 = *(unsigned char *)(v30 + v8);
        *((void *)a4 + 1) = v31;
        v29 |= (unint64_t)(v32 & 0x7F) << v27;
        if (v32 < 0)
        {
          v27 += 7;
          unint64_t v8 = v31;
          BOOL v17 = v28++ > 8;
          if (!v17) {
            continue;
          }
        }
        goto LABEL_58;
      }
      *((unsigned char *)a4 + 24) = 1;
LABEL_58:
      PB::Writer::writeVarInt(*(PB::Writer **)this);
      return *((unsigned char *)a4 + 24) == 0;
    case 1:
      unint64_t v10 = *((void *)a4 + 1);
      if (v10 <= 0xFFFFFFFFFFFFFFF7 && v10 + 8 <= *((void *)a4 + 2)) {
        *((void *)a4 + 1) = v10 + 8;
      }
      else {
        *((unsigned char *)a4 + 24) = 1;
      }
      PB::Writer::writeFixed(*(PB::Writer **)this);
      return *((unsigned char *)a4 + 24) == 0;
    case 2:
      PB::Reader::read();
      PB::Writer::write();
      return *((unsigned char *)a4 + 24) == 0;
    case 3:
      unint64_t v11 = *((void *)this + 1) + 1;
      *((void *)this + 1) = v11;
      if (v11 > 0x40) {
        return 0;
      }
      while (2)
      {
        if (*((unsigned char *)a4 + 24)) {
          goto LABEL_47;
        }
        unint64_t v12 = *((void *)a4 + 1);
        unint64_t v13 = *((void *)a4 + 2);
        uint64_t v14 = *(void *)a4;
        char v15 = 0;
        unsigned int v16 = 0;
        BOOL v17 = v12 > 0xFFFFFFFFFFFFFFF5 || v12 + 10 > v13;
        if (v17)
        {
          unint64_t v20 = 0;
          if (v13 <= v12) {
            unint64_t v13 = *((void *)a4 + 1);
          }
          while (v13 != v12)
          {
            unint64_t v18 = v12 + 1;
            char v19 = *(unsigned char *)(v14 + v12);
            *((void *)a4 + 1) = v18;
            v20 |= (unint64_t)(v19 & 0x7F) << v15;
            if ((v19 & 0x80) == 0) {
              goto LABEL_27;
            }
            v15 += 7;
            unint64_t v12 = v18;
            BOOL v17 = v16++ > 8;
            if (v17)
            {
LABEL_26:
              LODWORD(v23) = 0;
              unsigned __int8 v24 = 0;
              goto LABEL_34;
            }
          }
          LODWORD(v23) = 0;
          unsigned __int8 v24 = 0;
          *((unsigned char *)a4 + 24) = 1;
LABEL_34:
          if ((PKProtobufUnknownFields::add(this, v23, v24, a4) & 1) == 0) {
            return 0;
          }
          continue;
        }
        break;
      }
      unint64_t v20 = 0;
      while (1)
      {
        unint64_t v21 = v12 + 1;
        *((void *)a4 + 1) = v12 + 1;
        char v22 = *(unsigned char *)(v14 + v12);
        v20 |= (unint64_t)(v22 & 0x7F) << v15;
        if ((v22 & 0x80) == 0) {
          break;
        }
        v15 += 7;
        unint64_t v12 = v21;
        BOOL v17 = v16++ > 8;
        if (v17) {
          goto LABEL_26;
        }
      }
LABEL_27:
      unsigned __int8 v24 = v20 & 7;
      unint64_t v23 = v20 >> 3;
      if ((v20 & 7) != 4 || v23 != a2) {
        goto LABEL_34;
      }
LABEL_47:
      uint64_t v33 = *((void *)this + 1);
      if (v33) {
        *((void *)this + 1) = v33 - 1;
      }
      return *((unsigned char *)a4 + 24) == 0;
    case 5:
      unint64_t v26 = *((void *)a4 + 1);
      if (v26 <= 0xFFFFFFFFFFFFFFFBLL && v26 + 4 <= *((void *)a4 + 2)) {
        *((void *)a4 + 1) = v26 + 4;
      }
      else {
        *((unsigned char *)a4 + 24) = 1;
      }
      PB::Writer::writeFixed(*(PB::Writer **)this);
      return *((unsigned char *)a4 + 24) == 0;
    default:
      return result;
  }
}

void sub_1C472520C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t PKProtobufUnknownFields::addTestInt(PKProtobufUnknownFields *this)
{
  return PB::Writer::writeVarInt(*(PB::Writer **)this);
}

uint64_t PKProtobufUnknownFields::dataSize(PKProtobufUnknownFields *this)
{
  if (*(void *)this) {
    return **(void **)this - *(void *)(*(void *)this + 8);
  }
  else {
    return 0;
  }
}

uint64_t PKProtobufUnknownFields::data(PKProtobufUnknownFields *this)
{
  if (*(void *)this) {
    return *(void *)(*(void *)this + 8);
  }
  else {
    return 0;
  }
}

BOOL PKProtobufUnknownFieldsCompare(void ***a1, void ***a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  BOOL result = ((unint64_t)*a1 | (unint64_t)*a2) == 0;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v6 = *v2;
    if (v6) {
      uint64_t v7 = *v6 - v6[1];
    }
    else {
      uint64_t v7 = 0;
    }
    unint64_t v8 = *v3;
    if (v8) {
      uint64_t v9 = *v8 - v8[1];
    }
    else {
      uint64_t v9 = 0;
    }
    if (v7 != v9) {
      return 0;
    }
    if (v6)
    {
      unint64_t v10 = (const void *)v6[1];
      if (v8) {
        goto LABEL_14;
      }
    }
    else
    {
      unint64_t v10 = 0;
      if (v8)
      {
LABEL_14:
        unint64_t v11 = (const void *)v8[1];
        if (v6)
        {
LABEL_15:
          size_t v12 = *v6 - v6[1];
          return memcmp(v10, v11, v12) == 0;
        }
LABEL_19:
        size_t v12 = 0;
        return memcmp(v10, v11, v12) == 0;
      }
    }
    unint64_t v11 = 0;
    if (v6) {
      goto LABEL_15;
    }
    goto LABEL_19;
  }
  return result;
}

PB::Writer *std::unique_ptr<PB::Writer>::reset[abi:ne180100](PB::Writer **a1, PB::Writer *a2)
{
  BOOL result = *a1;
  *a1 = a2;
  if (result)
  {
    PB::Writer::~Writer(result);
    JUMPOUT(0x1C8783F10);
  }
  return result;
}

void sub_1C4725FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  _Unwind_Resume(a1);
}

void sub_1C47263BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4726C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,id a37,void *a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48)
{
  _Unwind_Resume(a1);
}

double matrix4x4_rotation(float a1, float32x4_t a2)
{
  int32x4_t v2 = (int32x4_t)vmulq_f32(a2, a2);
  v2.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v2, 2), vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v2.i8, 1))).u32[0];
  float32x2_t v3 = vrsqrte_f32((float32x2_t)v2.u32[0]);
  float32x2_t v4 = vmul_f32(v3, vrsqrts_f32((float32x2_t)v2.u32[0], vmul_f32(v3, v3)));
  float32x4_t v8 = vmulq_n_f32(a2, vmul_f32(v4, vrsqrts_f32((float32x2_t)v2.u32[0], vmul_f32(v4, v4))).f32[0]);
  __float2 v5 = __sincosf_stret(a1);
  LODWORD(v6) = vmlas_n_f32(v5.__cosval, 1.0 - v5.__cosval, vmulq_f32(v8, v8).f32[0]);
  *((float *)&v6 + 1) = vmuls_lane_f32(v5.__sinval, v8, 2)
                      + (float)(vmuls_lane_f32(v8.f32[0], *(float32x2_t *)v8.f32, 1) * (float)(1.0 - v5.__cosval));
  return v6;
}

void sub_1C47270B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C4727180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4727468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  uint64_t v20 = va_arg(va1, void);

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v14 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1C47274F8()
{
}

void sub_1C47277AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4727A88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4728158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1C4728B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1C4728D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C472943C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4729578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C472A050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_1C472AC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1C472AEEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C472B00C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)PKAutoRefineTaskManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1C472B804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,void *a45,void *a46)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
}

void sub_1C472C0C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C472C2B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C472C3C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_1C472C4F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  objc_sync_exit(v9);

  _Unwind_Resume(a1);
}

void sub_1C472C62C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  objc_sync_exit(v9);

  _Unwind_Resume(a1);
}

void sub_1C472C8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1C472CA64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C472CE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1C472CFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1C472D3EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1C472D620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C472D704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C472D7E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C472D95C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C472DAD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C472DCB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C472DEC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C472E380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C472E6D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C472E78C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C472E840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C472E958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C472E9D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _PKSignpostLog()
{
  if (_PKSignpostLog_onceToken != -1) {
    dispatch_once(&_PKSignpostLog_onceToken, &__block_literal_global_70);
  }
  uint64_t v0 = (void *)_PKSignpostLog____PKSignpostLog;

  return v0;
}

void sub_1C4730648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C4733854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
}

void sub_1C4733B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *PKTextInputDescriptionForReserveSpaceState(unint64_t a1)
{
  if (a1 > 5) {
    return &stru_1F1FB2C00;
  }
  else {
    return off_1E64CA2F0[a1];
  }
}

void sub_1C4737130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PK_UIApplicationIsSystemShell()
{
  if (PK_UIApplicationIsSystemShell_onceToken != -1) {
    dispatch_once(&PK_UIApplicationIsSystemShell_onceToken, &__block_literal_global_72);
  }
  return PK_UIApplicationIsSystemShell___result;
}

void sub_1C4738E94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C4738F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1C473A084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
}

void sub_1C473ADE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
}

void sub_1C473BC90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C473BDE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C473BEC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C473BF88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C473C088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C473C198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t versioned_document::Version::Version(uint64_t this)
{
  *(void *)this = &unk_1F1FB0698;
  *(void *)(this + _Block_object_dispose(&STACK[0x260], 8) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

{
  *(void *)this = &unk_1F1FB0698;
  *(void *)(this + _Block_object_dispose(&STACK[0x260], 8) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

void versioned_document::Version::~Version(void ***this)
{
  *this = (void **)&unk_1F1FB0698;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](this + 1, 0);

  PB::Base::~Base((PB::Base *)this);
}

{
  uint64_t vars8;

  *this = (void **)&unk_1F1FB0698;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](this + 1, 0);

  PB::Base::~Base((PB::Base *)this);
}

{
  uint64_t vars8;

  *this = (void **)&unk_1F1FB0698;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](this + 1, 0);
  PB::Base::~Base((PB::Base *)this);

  JUMPOUT(0x1C8783F10);
}

uint64_t versioned_document::Version::Version(uint64_t this, const versioned_document::Version *a2)
{
  *(void *)this = &unk_1F1FB0698;
  *(void *)(this + _Block_object_dispose(&STACK[0x260], 8) = 0;
  *(_DWORD *)(this + 24) = 0;
  if ((*((unsigned char *)a2 + 24) & 2) != 0)
  {
    int v3 = *((_DWORD *)a2 + 5);
    *(unsigned char *)(this + 24) = 2;
    *(_DWORD *)(this + 2std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v3;
    char v2 = 3;
    if ((*((unsigned char *)a2 + 24) & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v2 = 1;
  if (*((unsigned char *)a2 + 24))
  {
LABEL_5:
    int v4 = *((_DWORD *)a2 + 4);
    *(unsigned char *)(this + 24) = v2;
    *(_DWORD *)(this + 16) = v4;
  }
LABEL_6:
  if (*((void *)a2 + 1)) {
    operator new();
  }
  return this;
}

uint64_t versioned_document::Version::operator=(uint64_t a1, const versioned_document::Version *a2)
{
  if ((const versioned_document::Version *)a1 != a2)
  {
    versioned_document::Version::Version((uint64_t)&v7, a2);
    int v3 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = v10;
    int v10 = v3;
    uint64_t v4 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v9;
    uint64_t v9 = v4;
    __float2 v5 = *(void ***)(a1 + 8);
    *(void *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = v8;
    uint64_t v7 = &unk_1F1FB0698;
    float32x4_t v8 = v5;
    std::unique_ptr<PB::Data>::reset[abi:ne180100](&v8, 0);
    PB::Base::~Base((PB::Base *)&v7);
  }
  return a1;
}

uint64_t versioned_document::swap(uint64_t this, versioned_document::Version *a2, versioned_document::Version *a3)
{
  int v3 = *(_DWORD *)(this + 24);
  *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v3;
  int v4 = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 2std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v4;
  int v5 = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v5;
  uint64_t v6 = *(void *)(this + 8);
  *(void *)(this + _Block_object_dispose(&STACK[0x260], 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v6;
  return this;
}

uint64_t versioned_document::Version::Version(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F1FB0698;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  *(_DWORD *)(a1 + 2std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  int v3 = *(void ***)(a2 + 8);
  *(void *)(a2 + _Block_object_dispose(&STACK[0x260], 8) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)(a1 + 8), v3);
  return a1;
}

{
  void **v3;

  *(void *)a1 = &unk_1F1FB0698;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  *(_DWORD *)(a1 + 2std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  int v3 = *(void ***)(a2 + 8);
  *(void *)(a2 + _Block_object_dispose(&STACK[0x260], 8) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)(a1 + 8), v3);
  return a1;
}

uint64_t versioned_document::Version::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    float32x4_t v8 = &unk_1F1FB0698;
    uint64_t v9 = 0;
    int v11 = *(_DWORD *)(a2 + 24);
    *(_DWORD *)(a2 + 24) = 0;
    uint64_t v10 = *(void *)(a2 + 16);
    int v3 = *(void ***)(a2 + 8);
    *(void *)(a2 + _Block_object_dispose(&STACK[0x260], 8) = 0;
    std::unique_ptr<PB::Data>::reset[abi:ne180100](&v9, v3);
    int v4 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = v11;
    int v11 = v4;
    uint64_t v5 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v10;
    uint64_t v10 = v5;
    uint64_t v6 = *(void ***)(a1 + 8);
    *(void *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = v9;
    float32x4_t v8 = &unk_1F1FB0698;
    uint64_t v9 = v6;
    std::unique_ptr<PB::Data>::reset[abi:ne180100](&v9, 0);
    PB::Base::~Base((PB::Base *)&v8);
  }
  return a1;
}

uint64_t versioned_document::Version::formatText(versioned_document::Version *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((void *)this + 1)) {
    PB::TextFormatter::format();
  }
  char v5 = *((unsigned char *)this + 24);
  if (v5)
  {
    PB::TextFormatter::format(a2, "minimumSupportedVersion");
    char v5 = *((unsigned char *)this + 24);
  }
  if ((v5 & 2) != 0) {
    PB::TextFormatter::format(a2, "serializationVersion");
  }

  return MEMORY[0x1F4147498](a2);
}

uint64_t versioned_document::Version::readFrom(versioned_document::Version *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_31;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v19 = v11 >> 3;
      if ((v11 >> 3) == 3) {
        operator new();
      }
      if (v19 == 2)
      {
        *((unsigned char *)this + 24) |= 1u;
        unint64_t v30 = *((void *)a2 + 1);
        unint64_t v31 = *((void *)a2 + 2);
        uint64_t v32 = *(void *)a2;
        if (v30 > 0xFFFFFFFFFFFFFFF5 || v30 + 10 > v31)
        {
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v35 = 0;
          if (v31 <= v30) {
            unint64_t v31 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v31 == v30)
            {
              LODWORD(v35) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_66;
            }
            unint64_t v44 = v30 + 1;
            char v45 = *(unsigned char *)(v32 + v30);
            *((void *)a2 + 1) = v44;
            v35 |= (unint64_t)(v45 & 0x7F) << v42;
            if ((v45 & 0x80) == 0) {
              break;
            }
            v42 += 7;
            unint64_t v30 = v44;
            BOOL v14 = v43++ > 8;
            if (v14)
            {
LABEL_58:
              LODWORD(v35) = 0;
              goto LABEL_66;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v35) = 0;
          }
        }
        else
        {
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          while (1)
          {
            unint64_t v36 = v30 + 1;
            *((void *)a2 + 1) = v30 + 1;
            char v37 = *(unsigned char *)(v32 + v30);
            v35 |= (unint64_t)(v37 & 0x7F) << v33;
            if ((v37 & 0x80) == 0) {
              break;
            }
            v33 += 7;
            unint64_t v30 = v36;
            BOOL v14 = v34++ > 8;
            if (v14) {
              goto LABEL_58;
            }
          }
        }
LABEL_66:
        *((_DWORD *)this + 4) = v35;
      }
      else if (v19 == 1)
      {
        *((unsigned char *)this + 24) |= 2u;
        unint64_t v20 = *((void *)a2 + 1);
        unint64_t v21 = *((void *)a2 + 2);
        uint64_t v22 = *(void *)a2;
        if (v20 > 0xFFFFFFFFFFFFFFF5 || v20 + 10 > v21)
        {
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v25 = 0;
          if (v21 <= v20) {
            unint64_t v21 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v21 == v20)
            {
              LODWORD(v25) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_62;
            }
            unint64_t v40 = v20 + 1;
            char v41 = *(unsigned char *)(v22 + v20);
            *((void *)a2 + 1) = v40;
            v25 |= (unint64_t)(v41 & 0x7F) << v38;
            if ((v41 & 0x80) == 0) {
              break;
            }
            v38 += 7;
            unint64_t v20 = v40;
            BOOL v14 = v39++ > 8;
            if (v14)
            {
LABEL_51:
              LODWORD(v25) = 0;
              goto LABEL_62;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v25) = 0;
          }
        }
        else
        {
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          while (1)
          {
            unint64_t v26 = v20 + 1;
            *((void *)a2 + 1) = v20 + 1;
            char v27 = *(unsigned char *)(v22 + v20);
            v25 |= (unint64_t)(v27 & 0x7F) << v23;
            if ((v27 & 0x80) == 0) {
              break;
            }
            v23 += 7;
            unint64_t v20 = v26;
            BOOL v14 = v24++ > 8;
            if (v14) {
              goto LABEL_51;
            }
          }
        }
LABEL_62:
        *((_DWORD *)this + 5) = v25;
      }
      else
      {
LABEL_31:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_31;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t versioned_document::Version::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  char v4 = *(unsigned char *)(this + 24);
  if ((v4 & 2) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    char v4 = *(unsigned char *)(v3 + 24);
  }
  if (v4) {
    this = PB::Writer::writeVarInt(a2);
  }
  char v5 = *(const PB::Data **)(v3 + 8);
  if (v5)
  {
    return PB::Writer::write(a2, v5);
  }
  return this;
}

BOOL versioned_document::Version::operator==(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(a1 + 24) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 24) & 2) == 0 || *(_DWORD *)(a1 + 20) != *(_DWORD *)(a2 + 20)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 24) & 2) != 0)
  {
    return 0;
  }
  if (*(unsigned char *)(a1 + 24))
  {
    if ((*(unsigned char *)(a2 + 24) & 1) == 0 || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 24))
  {
    return 0;
  }
  if (*(void *)(a1 + 8))
  {
    if (!*(void *)(a2 + 8)) {
      return 0;
    }
    if (PB::Data::operator==()) {
      return 1;
    }
    if (*(void *)(a1 + 8)) {
      return 0;
    }
  }
  return *(void *)(a2 + 8) == 0;
}

uint64_t versioned_document::Version::hash_value(versioned_document::Version *this)
{
  if ((*((unsigned char *)this + 24) & 2) != 0)
  {
    uint64_t v1 = *((unsigned int *)this + 5);
    if (*((unsigned char *)this + 24)) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v1 = 0;
    if (*((unsigned char *)this + 24))
    {
LABEL_3:
      uint64_t v2 = *((unsigned int *)this + 4);
      goto LABEL_6;
    }
  }
  uint64_t v2 = 0;
LABEL_6:
  if (*((void *)this + 1)) {
    uint64_t v3 = PBHashBytes();
  }
  else {
    uint64_t v3 = 0;
  }
  return v2 ^ v1 ^ v3;
}

void sub_1C473FF64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4740004(_Unwind_Exception *a1)
{
  char v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1C47400E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47401D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4740364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  legacy_drawing::VectorTimestamp::~VectorTimestamp((legacy_drawing::VectorTimestamp *)&a9);

  _Unwind_Resume(a1);
}

void sub_1C47405A8(_Unwind_Exception *exception_object)
{
}

void sub_1C4740810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1C4740948(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  PB::Writer::~Writer((PB::Writer *)va1);
  legacy_drawing::VectorTimestamp::~VectorTimestamp((legacy_drawing::VectorTimestamp *)va);
  _Unwind_Resume(a1);
}

id PKAccessibilitySystemDarkenedColor(void *a1)
{
  double v6 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v3 = 0.0;
  [a1 getHue:&v6 saturation:&v5 brightness:&v4 alpha:&v3];
  uint64_t v1 = [MEMORY[0x1E4FB1618] colorWithHue:v6 saturation:v5 brightness:v4 * 0.8 alpha:v3];

  return v1;
}

void sub_1C4740A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4740ABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4740B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
}

void sub_1C4741298(_Unwind_Exception *a1)
{
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_1C4741BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);

  _Unwind_Resume(a1);
}

uint64_t std::vector<float>::~vector[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = v2;
    operator delete(v2);
  }
  return a1;
}

void std::vector<float>::resize(void *a1, unint64_t a2)
{
  double v3 = (char *)*a1;
  double v4 = (char *)a1[1];
  unint64_t v5 = (uint64_t)&v4[-*a1] >> 2;
  if (a2 <= v5)
  {
    if (a2 >= v5) {
      return;
    }
    unint64_t v20 = &v3[4 * a2];
    goto LABEL_15;
  }
  unint64_t v6 = a2 - v5;
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2];
  if (a2 - v5 <= (v8 - (uint64_t)v4) >> 2)
  {
    bzero(v4, 4 * v6);
    unint64_t v20 = &v4[4 * v6];
LABEL_15:
    a1[1] = v20;
    return;
  }
  if (a2 >> 62) {
    std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v9 = v8 - (void)v3;
  uint64_t v10 = v9 >> 1;
  if (v9 >> 1 <= a2) {
    uint64_t v10 = a2;
  }
  if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v11 = v10;
  }
  unint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v7, v11);
  char v13 = (char *)*a1;
  BOOL v14 = (char *)a1[1];
  char v15 = &v12[4 * v5];
  unint64_t v17 = &v12[4 * v16];
  bzero(v15, 4 * v6);
  char v18 = &v15[4 * v6];
  while (v14 != v13)
  {
    int v19 = *((_DWORD *)v14 - 1);
    v14 -= 4;
    *((_DWORD *)v15 - 1) = v19;
    v15 -= 4;
  }
  *a1 = v15;
  a1[1] = v18;
  a1[2] = v17;
  if (v13)
  {
    operator delete(v13);
  }
}

void sub_1C4742110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4742140()
{
  JUMPOUT(0x1C4742138);
}

void sub_1C47425C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47425F8()
{
  JUMPOUT(0x1C47425F0);
}

void sub_1C4742C40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47442E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4744DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1C4745A30(_Unwind_Exception *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Unwind_Resume(a1);
}

void sub_1C4745F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4746434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__153(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void sub_1C4746BDC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1C47471A8(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1C474735C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C474799C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1C4747FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void ___ZL36PKDeviceSupportsUniversalCompressionv_block_invoke()
{
  uint64_t v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    id v3 = v0;
    uint64_t v1 = [v0 objectForKeyedSubscript:@"universal-buffer-compression"];
    uint64_t v2 = v1;
    if (v1) {
      _MergedGlobals_154 = [v1 BOOLValue];
    }

    uint64_t v0 = v3;
  }
}

void sub_1C47483A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t std::unique_ptr<std::__hash_node<std::__hash_value_type<anonymous namespace'::PKSixChannelShaderKey,PKMetalShader * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<anonymous namespace'::PKSixChannelShaderKey,PKMetalShader * {__strong}>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(id **)a1;
  *(void *)a1 = 0;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {

    }
    operator delete(v2);
  }
  return a1;
}

BOOL PKNamedShaderKey::operator==(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 == *(void *)a2
    && *(_DWORD *)(a1 + 8) == *(_DWORD *)(a2 + 8)
    && *(_DWORD *)(a1 + 12) == *(_DWORD *)(a2 + 12)
    && (*(_DWORD *)(a1 + 32) == *(_DWORD *)(a2 + 32)
      ? (BOOL v2 = *(unsigned __int16 *)(a1 + 36) == *(unsigned __int16 *)(a2 + 36))
      : (BOOL v2 = 0),
        v2
     && *(void *)(a1 + 24) == *(void *)(a2 + 24)
     && *(unsigned __int8 *)(a1 + 17) == *(unsigned __int8 *)(a2 + 17)))
  {
    return *(unsigned __int8 *)(a1 + 18) == *(unsigned __int8 *)(a2 + 18);
  }
  else
  {
    return 0;
  }
}

uint64_t std::unique_ptr<std::__hash_node<std::__hash_value_type<anonymous namespace'::PKMetalShaderKey,PKMetalShader * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<anonymous namespace'::PKMetalShaderKey,PKMetalShader * {__strong}>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t a1)
{
  BOOL v2 = *(id **)a1;
  *(void *)a1 = 0;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {

    }
    operator delete(v2);
  }
  return a1;
}

double PK_convertPointFromCoordinateSpaceToCoordinateSpace(void *a1, void *a2, double a3, double a4)
{
  return PK_convertRectFromCoordinateSpaceToCoordinateSpace(a1, a2, a3, a4, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

double PK_convertRectFromCoordinateSpaceToCoordinateSpace(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a1;
  id v12 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_msgSend(v11, "PK_convertRect:toView:", v12, a3, a4, a5, a6);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(v11, "PK_convertRect:toCoordinateSpace:", v12, a3, a4, a5, a6);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v12, "PK_convertRect:fromCoordinateSpace:", v11, a3, a4, a5, a6);
      }
      else {
        objc_msgSend(v11, "convertRect:toCoordinateSpace:", v12, a3, a4, a5, a6);
      }
    }
  }
  double v14 = v13;

  return v14;
}

double PK_convertPointToCoordinateSpaceFromCoordinateSpace(void *a1, void *a2, double a3, double a4)
{
  return PK_convertRectFromCoordinateSpaceToCoordinateSpace(a2, a1, a3, a4, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

double PK_convertRectToCoordinateSpaceFromCoordinateSpace(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  return PK_convertRectFromCoordinateSpaceToCoordinateSpace(a2, a1, a3, a4, a5, a6);
}

CGAffineTransform *PK_transformToConvertFromCoordinateSpaceToCoordinateSpace@<X0>(void *a1@<X0>, void *a2@<X1>, _OWORD *a3@<X8>)
{
  id v5 = a2;
  id v6 = a1;
  objc_msgSend(v6, "convertPoint:toCoordinateSpace:", v5, 1.0, 0.0);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  objc_msgSend(v6, "convertPoint:toCoordinateSpace:", v5, 0.0, 1.0);
  double v12 = v11;
  double v14 = v13;

  a3[1] = 0u;
  a3[2] = 0u;
  *a3 = 0u;

  return DKDTransformMakeFree(0, (uint64_t)a3, 1.0, 0.0, 0.0, 1.0, v8, v10, v12, v14);
}

void sub_1C474A7F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

__CFString *PKTextInputDescriptionForResultCommandState(unint64_t a1)
{
  if (a1 > 7) {
    return &stru_1F1FB2C00;
  }
  else {
    return off_1E64CA750[a1];
  }
}

__CFString *PKTextInputDescriptionForImmediateCommitType(unint64_t a1)
{
  if (a1 > 3) {
    return &stru_1F1FB2C00;
  }
  else {
    return off_1E64CA730[a1];
  }
}

void sub_1C474FFE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C47500B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t legacy_drawing::VectorTimestampClockReplicaClock::VectorTimestampClockReplicaClock(uint64_t this)
{
  *(void *)this = &unk_1F1FB0510;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

{
  *(void *)this = &unk_1F1FB0510;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

void legacy_drawing::VectorTimestampClockReplicaClock::~VectorTimestampClockReplicaClock(legacy_drawing::VectorTimestampClockReplicaClock *this)
{
  PB::Base::~Base(this);

  JUMPOUT(0x1C8783F10);
}

uint64_t legacy_drawing::VectorTimestampClockReplicaClock::VectorTimestampClockReplicaClock(uint64_t this, const legacy_drawing::VectorTimestampClockReplicaClock *a2)
{
  *(void *)this = &unk_1F1FB0510;
  *(_DWORD *)(this + 16) = 0;
  if (*((unsigned char *)a2 + 16))
  {
    int v3 = *((_DWORD *)a2 + 2);
    *(unsigned char *)(this + 16) = 1;
    *(_DWORD *)(this + _Block_object_dispose(&STACK[0x260], 8) = v3;
    char v2 = 3;
    if ((*((unsigned char *)a2 + 16) & 2) == 0) {
      return this;
    }
    goto LABEL_5;
  }
  char v2 = 2;
  if ((*((unsigned char *)a2 + 16) & 2) != 0)
  {
LABEL_5:
    int v4 = *((_DWORD *)a2 + 3);
    *(unsigned char *)(this + 16) = v2;
    *(_DWORD *)(this + 12) = v4;
  }
  return this;
}

uint64_t legacy_drawing::VectorTimestampClockReplicaClock::operator=(uint64_t a1, const legacy_drawing::VectorTimestampClockReplicaClock *a2)
{
  if ((const legacy_drawing::VectorTimestampClockReplicaClock *)a1 != a2)
  {
    legacy_drawing::VectorTimestampClockReplicaClock::VectorTimestampClockReplicaClock((uint64_t)v6, a2);
    int v3 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)(a1 + 16) = v8;
    int v8 = v3;
    uint64_t v4 = *(void *)(a1 + 8);
    *(void *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = v7;
    uint64_t v7 = v4;
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

_DWORD *legacy_drawing::swap(_DWORD *this, legacy_drawing::VectorTimestampClockReplicaClock *a2, legacy_drawing::VectorTimestampClockReplicaClock *a3)
{
  int v3 = this[4];
  this[4] = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v3;
  int v4 = this[2];
  this[2] = *((_DWORD *)a2 + 2);
  *((_DWORD *)a2 + 2) = v4;
  int v5 = this[3];
  this[3] = *((_DWORD *)a2 + 3);
  *((_DWORD *)a2 + 3) = v5;
  return this;
}

uint64_t legacy_drawing::VectorTimestampClockReplicaClock::VectorTimestampClockReplicaClock(uint64_t result, _DWORD *a2)
{
  *(void *)__n128 result = &unk_1F1FB0510;
  *(_DWORD *)(result + 16) = a2[4];
  a2[4] = 0;
  *(_DWORD *)(result + _Block_object_dispose(&STACK[0x260], 8) = a2[2];
  *(_DWORD *)(result + 12) = a2[3];
  return result;
}

{
  *(void *)__n128 result = &unk_1F1FB0510;
  *(_DWORD *)(result + 16) = a2[4];
  a2[4] = 0;
  *(_DWORD *)(result + _Block_object_dispose(&STACK[0x260], 8) = a2[2];
  *(_DWORD *)(result + 12) = a2[3];
  return result;
}

uint64_t legacy_drawing::VectorTimestampClockReplicaClock::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    v7[0] = &unk_1F1FB0510;
    int v3 = *(_DWORD *)(a2 + 16);
    *(_DWORD *)(a2 + 16) = 0;
    int v8 = *(_DWORD *)(a1 + 16);
    uint64_t v4 = *(void *)(a1 + 8);
    uint64_t v5 = *(void *)(a2 + 8);
    *(_DWORD *)(a1 + 16) = v3;
    *(void *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = v5;
    v7[1] = v4;
    PB::Base::~Base((PB::Base *)v7);
  }
  return a1;
}

uint64_t legacy_drawing::VectorTimestampClockReplicaClock::formatText(legacy_drawing::VectorTimestampClockReplicaClock *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 16);
  if (v5)
  {
    PB::TextFormatter::format(a2, "clock");
    char v5 = *((unsigned char *)this + 16);
  }
  if ((v5 & 2) != 0) {
    PB::TextFormatter::format(a2, "subclock");
  }

  return MEMORY[0x1F4147498](a2);
}

uint64_t legacy_drawing::VectorTimestampClockReplicaClock::readFrom(legacy_drawing::VectorTimestampClockReplicaClock *this, PB::Reader *a2)
{
  unint64_t v3 = *((void *)a2 + 1);
  unint64_t v2 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v3 < v2 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v3 > 0xFFFFFFFFFFFFFFF5 || v3 + 10 > v2) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v3 + 1;
        *((void *)a2 + 1) = v3 + 1;
        char v13 = *(unsigned char *)(v8 + v3);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v3 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_30;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *((unsigned char *)this + 16) |= 2u;
        unint64_t v26 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
        uint64_t v27 = *(void *)a2;
        if (v26 > 0xFFFFFFFFFFFFFFF5 || v26 + 10 > v2)
        {
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v30 = 0;
          if (v2 <= v26) {
            unint64_t v3 = *((void *)a2 + 1);
          }
          else {
            unint64_t v3 = *((void *)a2 + 2);
          }
          while (1)
          {
            if (v3 == v26)
            {
              LODWORD(v3std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_64;
            }
            unint64_t v38 = v26++;
            char v39 = *(unsigned char *)(v27 + v38);
            *((void *)a2 + 1) = v26;
            v30 |= (unint64_t)(v39 & 0x7F) << v36;
            if ((v39 & 0x80) == 0) {
              break;
            }
            v36 += 7;
            BOOL v14 = v37++ > 8;
            if (v14)
            {
              LODWORD(v3std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
              goto LABEL_63;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v3std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
          }
LABEL_63:
          unint64_t v3 = v38 + 1;
        }
        else
        {
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          while (1)
          {
            unint64_t v3 = v26 + 1;
            *((void *)a2 + 1) = v26 + 1;
            char v31 = *(unsigned char *)(v27 + v26);
            v30 |= (unint64_t)(v31 & 0x7F) << v28;
            if ((v31 & 0x80) == 0) {
              break;
            }
            v28 += 7;
            unint64_t v26 = v3;
            BOOL v14 = v29++ > 8;
            if (v14)
            {
              LODWORD(v3std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
              break;
            }
          }
        }
LABEL_64:
        *((_DWORD *)this + 3) = v30;
      }
      else if ((v11 >> 3) == 1)
      {
        *((unsigned char *)this + 16) |= 1u;
        unint64_t v19 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
        uint64_t v20 = *(void *)a2;
        if (v19 > 0xFFFFFFFFFFFFFFF5 || v19 + 10 > v2)
        {
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v23 = 0;
          if (v2 <= v19) {
            unint64_t v3 = *((void *)a2 + 1);
          }
          else {
            unint64_t v3 = *((void *)a2 + 2);
          }
          while (1)
          {
            if (v3 == v19)
            {
              LODWORD(v23) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_60;
            }
            unint64_t v34 = v19++;
            char v35 = *(unsigned char *)(v20 + v34);
            *((void *)a2 + 1) = v19;
            v23 |= (unint64_t)(v35 & 0x7F) << v32;
            if ((v35 & 0x80) == 0) {
              break;
            }
            v32 += 7;
            BOOL v14 = v33++ > 8;
            if (v14)
            {
              LODWORD(v23) = 0;
              goto LABEL_59;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v23) = 0;
          }
LABEL_59:
          unint64_t v3 = v34 + 1;
        }
        else
        {
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          while (1)
          {
            unint64_t v3 = v19 + 1;
            *((void *)a2 + 1) = v19 + 1;
            char v24 = *(unsigned char *)(v20 + v19);
            v23 |= (unint64_t)(v24 & 0x7F) << v21;
            if ((v24 & 0x80) == 0) {
              break;
            }
            v21 += 7;
            unint64_t v19 = v3;
            BOOL v14 = v22++ > 8;
            if (v14)
            {
              LODWORD(v23) = 0;
              break;
            }
          }
        }
LABEL_60:
        *((_DWORD *)this + 2) = v23;
      }
      else
      {
LABEL_30:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
        unint64_t v3 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
      }
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v3 >= v2 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v3 > v2) {
      unint64_t v2 = v3;
    }
    while (v2 != v3)
    {
      unint64_t v17 = v3 + 1;
      char v18 = *(unsigned char *)(v8 + v3);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v3 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_30;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t legacy_drawing::VectorTimestampClockReplicaClock::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  char v4 = *(unsigned char *)(this + 16);
  if (v4)
  {
    this = PB::Writer::writeVarInt(a2);
    char v4 = *(unsigned char *)(v3 + 16);
  }
  if ((v4 & 2) != 0)
  {
    return PB::Writer::writeVarInt(a2);
  }
  return this;
}

BOOL legacy_drawing::VectorTimestampClockReplicaClock::operator==(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 16))
  {
    if ((*(unsigned char *)(a2 + 16) & 1) == 0 || *(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 8)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 16))
  {
    return 0;
  }
  BOOL v2 = (*(unsigned char *)(a2 + 16) & 2) == 0;
  if ((*(unsigned char *)(a1 + 16) & 2) != 0) {
    return (*(unsigned char *)(a2 + 16) & 2) != 0 && *(_DWORD *)(a1 + 12) == *(_DWORD *)(a2 + 12);
  }
  return v2;
}

uint64_t legacy_drawing::VectorTimestampClockReplicaClock::hash_value(legacy_drawing::VectorTimestampClockReplicaClock *this)
{
  if (*((unsigned char *)this + 16))
  {
    uint64_t v1 = *((unsigned int *)this + 2);
    if ((*((unsigned char *)this + 16) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v2 = 0;
    return v2 ^ v1;
  }
  uint64_t v1 = 0;
  if ((*((unsigned char *)this + 16) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v2 = *((unsigned int *)this + 3);
  return v2 ^ v1;
}

void sub_1C4751804(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1C4752350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t PKFunctionIdentity::isKindOfFunction(PKFunctionIdentity *this)
{
  return 2;
}

void PKFunctionIdentity::clone(PKFunctionIdentity *this)
{
}

void PKFunctionIdentity::~PKFunctionIdentity(PKFunction *this)
{
  PKFunction::~PKFunction(this);

  JUMPOUT(0x1C8783F10);
}

void sub_1C4753268(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 152));
  _Unwind_Resume(a1);
}

void sub_1C4754918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PKUUIDCompare(const unsigned __int8 *a1, const unsigned __int8 *a2)
{
  int v2 = uuid_compare(a1, a2);
  if (v2 < 0) {
    return -1;
  }
  else {
    return v2 != 0;
  }
}

void sub_1C47586EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C475876C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C4758AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4758CBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4758E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4759108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  drawing::Drawing::~Drawing((drawing::Drawing *)&a9);
  _Unwind_Resume(a1);
}

void sub_1C4759240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C475941C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PKProtobufUtilitiesNSDataFromArchiveWithHeader<drawing::Drawing>(uint64_t a1, char a2)
{
  int v12 = -261852553;
  char v11 = a2;
  char v10 = 0;
  PB::Writer::Writer((PB::Writer *)&v8);
  (*(void (**)(uint64_t, uint64_t *))(*(void *)a1 + 24))(a1, &v8);
  id v3 = objc_alloc(MEMORY[0x1E4F1CA58]);
  char v4 = (void *)[v3 initWithCapacity:v8 - v9 + 8];
  [v4 appendBytes:&v12 length:4];
  [v4 appendBytes:&v11 length:1];
  [v4 appendBytes:&v10 length:1];
  __int16 v7 = 8;
  [v4 appendBytes:&v7 length:2];
  [v4 appendBytes:v9 length:v8 - v9];
  char v5 = (void *)[v4 copy];

  PB::Writer::~Writer((PB::Writer *)&v8);

  return v5;
}

void sub_1C475956C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  PB::Writer::~Writer((PB::Writer *)va);
  _Unwind_Resume(a1);
}

void sub_1C475972C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  drawingV1::Drawing::~Drawing(&a9);

  _Unwind_Resume(a1);
}

void sub_1C47598D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  legacy_drawing::Drawing::~Drawing((legacy_drawing::Drawing *)va);

  _Unwind_Resume(a1);
}

void sub_1C4759D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1C475A2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1C475A68C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C475AF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  std::__split_buffer<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::~__split_buffer((void **)(v14 - 176));

  _Unwind_Resume(a1);
}

uint64_t std::vector<PB::Data>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>(result, a2);
    v7[1] = v7[0] + v5;
    void v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 16 * v6;
    std::vector<PB::Data>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<PB::Data>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_1C475B148(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<PB::Data>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void PB::PtrVector<drawing::StrokeID>::emplace_back<>()
{
}

void sub_1C475B274(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void PB::PtrVector<drawing::Ink>::emplace_back<>()
{
}

void sub_1C475B3E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void sub_1C475BC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  std::__split_buffer<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::~__split_buffer((void **)(v15 - 168));

  _Unwind_Resume(a1);
}

void sub_1C475BF2C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  PB::Writer::~Writer((PB::Writer *)(v2 - 40));
  drawingV1::Drawing::~Drawing((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::unique_ptr<drawing::StrokeID>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::unique_ptr<drawing::StrokeID>>,std::reverse_iterator<std::unique_ptr<drawing::StrokeID>*>,std::reverse_iterator<std::unique_ptr<drawing::StrokeID>*>,std::reverse_iterator<std::unique_ptr<drawing::StrokeID>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::unique_ptr<drawing::StrokeID>>,std::reverse_iterator<std::unique_ptr<drawing::StrokeID>*>,std::reverse_iterator<std::unique_ptr<drawing::StrokeID>*>,std::reverse_iterator<std::unique_ptr<drawing::StrokeID>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 == a5)
  {
    uint64_t v11 = a6;
  }
  else
  {
    uint64_t v8 = (void *)(a7 - 8);
    uint64_t v9 = (void *)(a7 - 8);
    do
    {
      uint64_t v10 = *--a3;
      *a3 = 0;
      *v9-- = v10;
      *((void *)&v16 + 1) = v8;
      v7 -= 8;
      uint64_t v8 = v9;
    }
    while (a3 != a5);
    uint64_t v11 = v16;
  }
  char v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<drawing::StrokeID>>,std::reverse_iterator<std::unique_ptr<drawing::StrokeID>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return v11;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<drawing::StrokeID>>,std::reverse_iterator<std::unique_ptr<drawing::StrokeID>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>,std::reverse_iterator<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>*>>::operator()[abi:ne180100]((void *)a1);
  }
  return a1;
}

uint64_t std::vector<std::unique_ptr<drawing::Ink>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::unique_ptr<drawing::Ink>>,std::reverse_iterator<std::unique_ptr<drawing::Ink>*>,std::reverse_iterator<std::unique_ptr<drawing::Ink>*>,std::reverse_iterator<std::unique_ptr<drawing::Ink>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::unique_ptr<drawing::Ink>>,std::reverse_iterator<std::unique_ptr<drawing::Ink>*>,std::reverse_iterator<std::unique_ptr<drawing::Ink>*>,std::reverse_iterator<std::unique_ptr<drawing::Ink>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 == a5)
  {
    uint64_t v11 = a6;
  }
  else
  {
    uint64_t v8 = (void *)(a7 - 8);
    uint64_t v9 = (void *)(a7 - 8);
    do
    {
      uint64_t v10 = *--a3;
      *a3 = 0;
      *v9-- = v10;
      *((void *)&v16 + 1) = v8;
      v7 -= 8;
      uint64_t v8 = v9;
    }
    while (a3 != a5);
    uint64_t v11 = v16;
  }
  char v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<drawing::Ink>>,std::reverse_iterator<std::unique_ptr<drawing::Ink>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return v11;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<drawing::Ink>>,std::reverse_iterator<std::unique_ptr<drawing::Ink>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>,std::reverse_iterator<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>*>>::operator()[abi:ne180100]((void *)a1);
  }
  return a1;
}

void **std::vector<std::unique_ptr<drawing::Stroke>>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)result, a2);
    v7[1] = (char *)v7[0] + v5;
    void v7[2] = (char *)v7[0] + v5;
    v7[3] = (char *)v7[0] + 8 * v6;
    std::vector<std::unique_ptr<drawing::Stroke>>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::~__split_buffer(v7);
  }
  return result;
}

void sub_1C475C268(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void sub_1C475C328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C475C3B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C475C43C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C475C4BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C475C660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C475CC00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C475CD80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C475D010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C475D298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id DKDStringFromAffineTransform(_OWORD *a1)
{
  long long v1 = a1[1];
  *(_OWORD *)&v4.a = *a1;
  *(_OWORD *)&v4.c = v1;
  *(_OWORD *)&v4.tdouble x = a1[2];
  uint64_t v2 = NSStringFromCGAffineTransform(&v4);

  return v2;
}

BOOL DKDTransformsDifferOnlyByTranslation(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

CGPath *DKDCreatePathFromTransformedRect(const CGAffineTransform *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  Mutable = CGPathCreateMutable();
  v12.origin.double x = a2;
  v12.origin.float y = a3;
  v12.size.double width = a4;
  v12.size.double height = a5;
  CGPathAddRect(Mutable, a1, v12);
  return Mutable;
}

float64x2_t DKDTransformedCornersOfRect(float64x2_t *a1, double *a2, double *a3, double *a4, double *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  CGFloat MinX = CGRectGetMinX(*(CGRect *)&a6);
  v23.origin.double x = a6;
  v23.origin.float y = a7;
  v23.size.double width = a8;
  v23.size.double height = a9;
  CGFloat MinY = CGRectGetMinY(v23);
  v24.origin.double x = a6;
  v24.origin.float y = a7;
  v24.size.double width = a8;
  v24.size.double height = a9;
  CGFloat MaxX = CGRectGetMaxX(v24);
  v25.origin.double x = a6;
  v25.origin.float y = a7;
  v25.size.double width = a8;
  v25.size.double height = a9;
  CGFloat MaxY = CGRectGetMaxY(v25);
  *a2 = MinX;
  a2[1] = MinY;
  *a3 = MinX;
  a3[1] = MaxY;
  *a4 = MaxX;
  a4[1] = MaxY;
  *a5 = MaxX;
  a5[1] = MinY;
  *(float64x2_t *)a2 = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a2[1]), *a1, *a2));
  *(float64x2_t *)a3 = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a3[1]), *a1, *a3));
  *(float64x2_t *)a4 = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a4[1]), *a1, *a4));
  float64x2_t result = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a5[1]), *a1, *a5));
  *(float64x2_t *)a5 = result;
  return result;
}

CGAffineTransform *DKDAffineTransformShear@<X0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>)
{
  t1.a = 1.0;
  t1.b = a3;
  t1.c = a4;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&t1.d = _Q0;
  t1.tfloat y = 1.0;
  long long v9 = a1[1];
  *(_OWORD *)&v11.a = *a1;
  *(_OWORD *)&v11.c = v9;
  *(_OWORD *)&v11.tdouble x = a1[2];
  return CGAffineTransformConcat(a2, &t1, &v11);
}

long double DKDTransformAngle(double *a1)
{
  double v2 = *a1;
  double v1 = a1[1];
  if (v1 * a1[2] - *a1 * a1[3] > 0.0)
  {
    double v2 = -v2;
    double v1 = -v1;
  }
  return atan2(v1, v2) * 57.2957795;
}

BOOL DKDIsTransformFlipped(double *a1)
{
  return a1[2] * a1[1] - *a1 * a1[3] > 0.0;
}

double DKDTransformScale(double *a1)
{
  return sqrt(a1[1] * a1[1] + *a1 * *a1);
}

double DKDTransformIsValid(double *a1)
{
  double v1 = fabs(*a1 * a1[3] - a1[1] * a1[2]);
  double result = 0.0;
  if (v1 >= 0.001 && v1 != INFINITY && fabs(a1[4]) != INFINITY)
  {
    double v3 = fabs(a1[5]);
    BOOL v4 = v3 < INFINITY;
    BOOL v5 = v3 <= INFINITY;
    double result = 0.0;
    if (v4) {
      double result = 1.0;
    }
    if (!v5) {
      return 1.0;
    }
  }
  return result;
}

double DKDTransformXYScale(double *a1)
{
  return sqrt(a1[1] * a1[1] + *a1 * *a1);
}

CGAffineTransform *DKDTransformNormalizeScale@<X0>(uint64_t a1@<X0>, CGAffineTransform *a2@<X8>)
{
  CGFloat v2 = 1.0 / sqrt(*(double *)(a1 + 8) * *(double *)(a1 + 8) + *(double *)a1 * *(double *)a1);
  CGFloat v3 = 1.0 / sqrt(*(double *)(a1 + 24) * *(double *)(a1 + 24) + *(double *)(a1 + 16) * *(double *)(a1 + 16));
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v6.a = *(_OWORD *)a1;
  *(_OWORD *)&v6.c = v4;
  *(_OWORD *)&v6.tdouble x = *(_OWORD *)(a1 + 32);
  return CGAffineTransformScale(a2, &v6, v2, v3);
}

BOOL DKDIsTransformAxisAlignedWithObjectSize(double *a1, double a2, double a3)
{
  double v3 = 1.0 / (a2 * 0.5);
  double v4 = 1.0 / (a3 * 0.5);
  if (v3 >= v4) {
    double v3 = v4;
  }
  double v5 = fabs(a1[3]);
  if (fabs(*a1) < v3 && v5 < v3) {
    return 1;
  }
  if (fabs(a1[1]) >= v3) {
    return 0;
  }
  return fabs(a1[2]) < v3;
}

BOOL DKDIsTransformAxisAlignedWithThreshold(double *a1, double a2)
{
  if (fabs(*a1) < a2 && fabs(a1[3]) < a2) {
    return 1;
  }
  if (fabs(a1[1]) >= a2) {
    return 0;
  }
  return fabs(a1[2]) < a2;
}

BOOL DKDIsTransformAxisAligned(double *a1)
{
  if (fabs(*a1) < 1.0e-12 && fabs(a1[3]) < 1.0e-12) {
    return 1;
  }
  if (fabs(a1[1]) >= 1.0e-12) {
    return 0;
  }
  return fabs(a1[2]) < 1.0e-12;
}

BOOL DKDIsTransformAxisAlignedUnflipped(double *a1)
{
  return fabs(a1[1]) < 1.0e-12 && fabs(a1[2]) < 1.0e-12 && *a1 >= 0.0 && a1[3] >= 0.0;
}

CGAffineTransform *DKDAffineTransformForFlips@<X0>(CGAffineTransform *result@<X0>, int a2@<W1>, uint64_t a3@<X8>, CGFloat a4@<D0>, CGFloat a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>)
{
  uint64_t v13 = MEMORY[0x1E4F1DAB8];
  long long v14 = *MEMORY[0x1E4F1DAB8];
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)a3 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)(a3 + 16) = v15;
  long long v16 = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a3 + 32) = v16;
  if (result)
  {
    long long v31 = v15;
    long long v32 = v14;
    CGFloat v17 = a4;
    CGFloat v18 = a5;
    long long v30 = v16;
    CGFloat v19 = a6;
    double MinX = CGRectGetMinX(*(CGRect *)(&a7 - 3));
    v35.origin.double x = a4;
    v35.origin.float y = a5;
    v35.size.double width = a6;
    v35.size.double height = a7;
    CGFloat MaxX = CGRectGetMaxX(v35);
    *(_OWORD *)&v34.a = v32;
    *(_OWORD *)&v34.c = v31;
    *(_OWORD *)&v34.tdouble x = v30;
    CGAffineTransformTranslate((CGAffineTransform *)a3, &v34, MinX + MaxX, 0.0);
    long long v22 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v33.a = *(_OWORD *)a3;
    *(_OWORD *)&v33.c = v22;
    *(_OWORD *)&v33.tdouble x = *(_OWORD *)(a3 + 32);
    double result = CGAffineTransformScale(&v34, &v33, -1.0, 1.0);
    long long v23 = *(_OWORD *)&v34.c;
    *(_OWORD *)a3 = *(_OWORD *)&v34.a;
    *(_OWORD *)(a3 + 16) = v23;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v34.tx;
  }
  if (a2)
  {
    v36.origin.double x = a4;
    v36.origin.float y = a5;
    v36.size.double width = a6;
    v36.size.double height = a7;
    double MinY = CGRectGetMinY(v36);
    v37.origin.double x = a4;
    v37.origin.float y = a5;
    v37.size.double width = a6;
    v37.size.double height = a7;
    CGFloat MaxY = CGRectGetMaxY(v37);
    long long v26 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v33.a = *(_OWORD *)a3;
    *(_OWORD *)&v33.c = v26;
    *(_OWORD *)&v33.tdouble x = *(_OWORD *)(a3 + 32);
    CGAffineTransformTranslate(&v34, &v33, 0.0, MinY + MaxY);
    long long v27 = *(_OWORD *)&v34.c;
    *(_OWORD *)a3 = *(_OWORD *)&v34.a;
    *(_OWORD *)(a3 + 16) = v27;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v34.tx;
    long long v28 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v33.a = *(_OWORD *)a3;
    *(_OWORD *)&v33.c = v28;
    *(_OWORD *)&v33.tdouble x = *(_OWORD *)(a3 + 32);
    double result = CGAffineTransformScale(&v34, &v33, 1.0, -1.0);
    long long v29 = *(_OWORD *)&v34.c;
    *(_OWORD *)a3 = *(_OWORD *)&v34.a;
    *(_OWORD *)(a3 + 16) = v29;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v34.tx;
  }
  return result;
}

CGAffineTransform *DKDTransformFromTransformSpace@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  long long v6 = a2[1];
  *(_OWORD *)&v10.a = *a2;
  *(_OWORD *)&v10.c = v6;
  *(_OWORD *)&v10.tdouble x = a2[2];
  CGAffineTransformInvert(&t1, &v10);
  long long v7 = a1[1];
  *(_OWORD *)&v10.a = *a1;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tdouble x = a1[2];
  CGAffineTransformConcat(&v12, &t1, &v10);
  long long v8 = a2[1];
  *(_OWORD *)&v10.a = *a2;
  *(_OWORD *)&v10.c = v8;
  *(_OWORD *)&v10.tdouble x = a2[2];
  return CGAffineTransformConcat(a3, &v12, &v10);
}

CGAffineTransform *DKDTransformInTransformSpace@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  long long v5 = a2[1];
  *(_OWORD *)&t1.a = *a2;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tdouble x = a2[2];
  long long v6 = a1[1];
  *(_OWORD *)&t2.a = *a1;
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tdouble x = a1[2];
  CGAffineTransformConcat(&v12, &t1, &t2);
  long long v7 = a2[1];
  *(_OWORD *)&t1.a = *a2;
  *(_OWORD *)&t1.c = v7;
  *(_OWORD *)&t1.tdouble x = a2[2];
  CGAffineTransformInvert(&v9, &t1);
  return CGAffineTransformConcat(a3, &v12, &v9);
}

CGAffineTransform *DKDTransformConvertForNewOrigin@<X0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>)
{
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeTranslation(&v14, -a3, -a4);
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeTranslation(&v13, a3, a4);
  CGAffineTransform t1 = v13;
  long long v8 = a1[1];
  *(_OWORD *)&v10.a = *a1;
  *(_OWORD *)&v10.c = v8;
  *(_OWORD *)&v10.tdouble x = a1[2];
  CGAffineTransformConcat(&v12, &t1, &v10);
  CGAffineTransform t1 = v14;
  return CGAffineTransformConcat(a2, &v12, &t1);
}

CGAffineTransform *DKDTransformMakeFree@<X0>(int a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, CGFloat a7@<D4>, CGFloat a8@<D5>, double a9@<D6>, double a10@<D7>)
{
  double v15 = a3 - a5;
  double v16 = a4 - a6;
  double v17 = sqrt(v16 * v16 + v15 * v15);
  if (v17 < 0.0001 || (double v18 = a7 - a9, v19 = a8 - a10, v20 = sqrt(v19 * v19 + v18 * v18), v20 < 0.0001))
  {
    return CGAffineTransformMakeTranslation((CGAffineTransform *)a2, a7 - a3, a8 - a4);
  }
  else
  {
    double v22 = v20 / v17;
    double v23 = atan2(v16, v15);
    long double v24 = atan2(v19, v18);
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    CGAffineTransformMakeTranslation((CGAffineTransform *)a2, -a3, -a4);
    CGAffineTransformMakeRotation(&t2, -v23);
    long long v25 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v25;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)(a2 + 32);
    CGAffineTransformConcat(&v40, &t1, &t2);
    long long v26 = *(_OWORD *)&v40.c;
    *(_OWORD *)a2 = *(_OWORD *)&v40.a;
    *(_OWORD *)(a2 + 16) = v26;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v40.tx;
    if (a1) {
      double v27 = 1.0;
    }
    else {
      double v27 = v22;
    }
    CGAffineTransformMakeScale(&v37, v22, v27);
    long long v28 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v28;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)(a2 + 32);
    CGAffineTransformConcat(&v40, &t1, &v37);
    long long v29 = *(_OWORD *)&v40.c;
    *(_OWORD *)a2 = *(_OWORD *)&v40.a;
    *(_OWORD *)(a2 + 16) = v29;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v40.tx;
    CGAffineTransformMakeRotation(&v36, v24);
    long long v30 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v30;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)(a2 + 32);
    CGAffineTransformConcat(&v40, &t1, &v36);
    long long v31 = *(_OWORD *)&v40.c;
    *(_OWORD *)a2 = *(_OWORD *)&v40.a;
    *(_OWORD *)(a2 + 16) = v31;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v40.tx;
    CGAffineTransformMakeTranslation(&v35, a7, a8);
    long long v32 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v32;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)(a2 + 32);
    double result = CGAffineTransformConcat(&v40, &t1, &v35);
    long long v34 = *(_OWORD *)&v40.c;
    *(_OWORD *)a2 = *(_OWORD *)&v40.a;
    *(_OWORD *)(a2 + 16) = v34;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v40.tx;
  }
  return result;
}

CGFloat DKDTransformMakeAxisAligned@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>, double a9@<D7>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  double v15 = sqrt((a3 - a5) * (a3 - a5) + (a2 - a4) * (a2 - a4));
  if (v15 < 0.0001 || (double v18 = sqrt((a7 - a9) * (a7 - a9) + (a6 - a8) * (a6 - a8)), v18 < 0.0001))
  {
    double v20 = a6 - a2;
    double v21 = a7 - a3;
    CGAffineTransformMakeTranslation((CGAffineTransform *)a1, v20, v21);
  }
  else
  {
    double v19 = v18 / v15;
    if (v18 / v15 >= *(double *)&a10)
    {
      if (v19 > *(double *)&a11) {
        double v19 = *(double *)&a11 + (v19 - *(double *)&a11) * *(double *)&a12;
      }
    }
    else
    {
      double v19 = (v19 - *(double *)&a10) * *(double *)&a12 * 0.5 + *(double *)&a10;
    }
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    CGAffineTransformMakeTranslation((CGAffineTransform *)a1, (a2 + a4) * -0.5, (a3 + a5) * -0.5);
    CGAffineTransformMakeScale(&t2, v19, v19);
    long long v23 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a1;
    *(_OWORD *)&t1.c = v23;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)(a1 + 32);
    CGAffineTransformConcat(&v30, &t1, &t2);
    long long v24 = *(_OWORD *)&v30.c;
    *(_OWORD *)a1 = *(_OWORD *)&v30.a;
    *(_OWORD *)(a1 + 16) = v24;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)&v30.tx;
    CGAffineTransformMakeTranslation(&v27, (a6 + a8) * 0.5, (a7 + a9) * 0.5);
    long long v25 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a1;
    *(_OWORD *)&t1.c = v25;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)(a1 + 32);
    CGAffineTransformConcat(&v30, &t1, &v27);
    long long v26 = *(_OWORD *)&v30.c;
    *(_OWORD *)a1 = *(_OWORD *)&v30.a;
    *(_OWORD *)(a1 + 16) = v26;
    CGFloat result = v30.tx;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)&v30.tx;
  }
  return result;
}

CGFloat DKDTransformConvertingRectToRect@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>, double a9@<D7>)
{
  return DKDTransformConvertingRectToRectAtPercent(a1, a2, a3, a4, a5, a6, a7, a8, a9, 1.0);
}

CGFloat DKDTransformConvertingRectToRectAtPercent@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>, double a9@<D7>, double a10)
{
  CGFloat v11 = (a6 - a2) * a10;
  CGFloat v12 = (a7 - a3) * a10;
  double v13 = DKDMixSizes(1.0, 1.0, a8 / a4, a9 / a5, a10);
  CGFloat v15 = v14;
  uint64_t v16 = MEMORY[0x1E4F1DAB8];
  long long v17 = *MEMORY[0x1E4F1DAB8];
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)(a1 + 16) = v18;
  long long v19 = *(_OWORD *)(v16 + 32);
  *(_OWORD *)(a1 + 32) = v19;
  *(_OWORD *)&v24.a = v17;
  *(_OWORD *)&v24.c = v18;
  *(_OWORD *)&v24.tdouble x = v19;
  CGAffineTransformTranslate((CGAffineTransform *)a1, &v24, v11, v12);
  long long v20 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v23.a = *(_OWORD *)a1;
  *(_OWORD *)&v23.c = v20;
  *(_OWORD *)&v23.tdouble x = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v24, &v23, v13, v15);
  long long v21 = *(_OWORD *)&v24.c;
  *(_OWORD *)a1 = *(_OWORD *)&v24.a;
  *(_OWORD *)(a1 + 16) = v21;
  CGFloat result = v24.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v24.tx;
  return result;
}

CGFloat DKD_CGAffineTransformCompose@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v4 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 16) = v4;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 56);
  CGFloat v5 = *(double *)(a1 + 16);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v13.a = *(_OWORD *)a2;
  *(_OWORD *)&v13.c = v6;
  *(_OWORD *)&v13.tdouble x = *(_OWORD *)(a2 + 32);
  CGAffineTransformRotate((CGAffineTransform *)a2, &v13, v5);
  CGFloat v7 = *(double *)a1;
  CGFloat v8 = *(double *)(a1 + 8);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v12.a = *(_OWORD *)a2;
  *(_OWORD *)&v12.c = v9;
  *(_OWORD *)&v12.tdouble x = *(_OWORD *)(a2 + 32);
  CGAffineTransformScale(&v13, &v12, v7, v8);
  long long v10 = *(_OWORD *)&v13.c;
  *(_OWORD *)a2 = *(_OWORD *)&v13.a;
  *(_OWORD *)(a2 + 16) = v10;
  CGFloat result = v13.tx;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v13.tx;
  return result;
}

double DKDTransformDecompose(_OWORD *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  v16[9] = *MEMORY[0x1E4F143B8];
  long long v11 = a1[1];
  v15[0] = *a1;
  v15[1] = v11;
  v15[2] = a1[2];
  DKD_CGAffineTransformDecompose((uint64_t)v15, (uint64_t)v16);
  uint64_t v12 = v16[2];
  *a2 = v16[7];
  *a3 = v16[8];
  *a4 = v12;
  double result = *(double *)v16;
  uint64_t v14 = v16[1];
  *a5 = v16[0];
  *a6 = v14;
  return result;
}

uint64_t DKDTransform3DDecompose(_OWORD *a1, CGFloat *a2, CGFloat *a3, CGFloat *a4, CGFloat *a5, CGFloat *a6)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v12 = a1[5];
  *(_OWORD *)&v26.m31 = a1[4];
  *(_OWORD *)&v26.m33 = v12;
  long long v13 = a1[7];
  *(_OWORD *)&v26.m41 = a1[6];
  *(_OWORD *)&v26.m43 = v13;
  long long v14 = a1[1];
  *(_OWORD *)&v26.m11 = *a1;
  *(_OWORD *)&v26.CGFloat m13 = v14;
  long long v15 = a1[3];
  *(_OWORD *)&v26.m21 = a1[2];
  *(_OWORD *)&v26.m23 = v15;
  uint64_t v16 = MEMORY[0x1C8782B60](&v26);
  if (v16)
  {
    memset(&v24, 0, sizeof(v24));
    long long v17 = a1[5];
    *(_OWORD *)&v26.m31 = a1[4];
    *(_OWORD *)&v26.m33 = v17;
    long long v18 = a1[7];
    *(_OWORD *)&v26.m41 = a1[6];
    *(_OWORD *)&v26.m43 = v18;
    long long v19 = a1[1];
    *(_OWORD *)&v26.m11 = *a1;
    *(_OWORD *)&v26.CGFloat m13 = v19;
    long long v20 = a1[3];
    *(_OWORD *)&v26.m21 = a1[2];
    *(_OWORD *)&v26.m23 = v20;
    CATransform3DGetAffineTransform(&v24, &v26);
    CGAffineTransform v25 = v24;
    DKD_CGAffineTransformDecompose((uint64_t)&v25, (uint64_t)&v26);
    CGFloat m13 = v26.m13;
    *a2 = v26.m24;
    *a3 = v26.m31;
    *a4 = m13;
    CGFloat m12 = v26.m12;
    *a5 = v26.m11;
    *a6 = m12;
  }
  return v16;
}

void DKDTransformMixAffineTransforms(long long *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v7 = a1[1];
  long long v16 = *a1;
  v17[0] = v7;
  v17[1] = a1[2];
  DKD_CGAffineTransformDecompose((uint64_t)&v16, (uint64_t)&v18);
  long long v8 = a2[1];
  v15[0] = *a2;
  v15[1] = v8;
  v15[2] = a2[2];
  DKD_CGAffineTransformDecompose((uint64_t)v15, (uint64_t)&v16);
  if ((v18 >= 0.0 || *((double *)&v16 + 1) >= 0.0) && (v19 >= 0.0 || *(double *)&v16 >= 0.0))
  {
    double v9 = __x;
  }
  else
  {
    double v18 = -v18;
    double v19 = -v19;
    double v9 = __x + dbl_1C482B710[__x < 0.0];
  }
  double v10 = fmod(v9, 6.28318531);
  __double x = v10;
  double v11 = fmod(*(long double *)v17, 6.28318531);
  *(double *)long long v17 = v11;
  if (vabdd_f64(v10, v11) > 3.14159265)
  {
    BOOL v12 = v10 <= v11;
    if (v10 > v11) {
      double v11 = v10;
    }
    long long v13 = (double *)&v16;
    if (!v12) {
      long long v13 = &v18;
    }
    v13[2] = v11 + -6.28318531;
  }
  for (uint64_t i = 0; i != 72; i += 8)
    *(double *)((char *)&v18 + i) = *(double *)((char *)&v18 + i)
                                  + (*(double *)((char *)&v17[-1] + i) - *(double *)((char *)&v18 + i)) * a4;
  DKD_CGAffineTransformCompose((uint64_t)&v18, a3);
}

BOOL DKDTransform3DNearlyEqualToTransform(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[5];
  v12[4] = a1[4];
  v12[5] = v2;
  long long v3 = a1[7];
  v12[6] = a1[6];
  v12[7] = v3;
  long long v4 = a1[1];
  v12[0] = *a1;
  v12[1] = v4;
  long long v5 = a1[3];
  v12[2] = a1[2];
  v12[3] = v5;
  long long v6 = a2[5];
  v11[4] = a2[4];
  v11[5] = v6;
  long long v7 = a2[7];
  v11[6] = a2[6];
  v11[7] = v7;
  long long v8 = a2[1];
  v11[0] = *a2;
  v11[1] = v8;
  long long v9 = a2[3];
  v11[2] = a2[2];
  v11[3] = v9;
  return DKDTransform3DNearlyEqualToTransformWithTolerance((double *)v12, (double *)v11, 0.01);
}

BOOL DKDTransform3DNearlyEqualToTransformWithTolerance(double *a1, double *a2, double a3)
{
  return vabdd_f64(*a1, *a2) < a3
      && vabdd_f64(a1[1], a2[1]) < a3
      && vabdd_f64(a1[2], a2[2]) < a3
      && vabdd_f64(a1[3], a2[3]) < a3
      && vabdd_f64(a1[4], a2[4]) < a3
      && vabdd_f64(a1[5], a2[5]) < a3
      && vabdd_f64(a1[6], a2[6]) < a3
      && vabdd_f64(a1[7], a2[7]) < a3
      && vabdd_f64(a1[8], a2[8]) < a3
      && vabdd_f64(a1[9], a2[9]) < a3
      && vabdd_f64(a1[10], a2[10]) < a3
      && vabdd_f64(a1[11], a2[11]) < a3
      && vabdd_f64(a1[12], a2[12]) < a3
      && vabdd_f64(a1[13], a2[13]) < a3
      && vabdd_f64(a1[14], a2[14]) < a3
      && vabdd_f64(a1[15], a2[15]) < a3;
}

void sub_1C475F894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C475FC18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1C47602B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1C4760A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PKRulerExtremaFilter::copyUpdatedRangeFromIndex(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  char v7 = [WeakRetained isSnappedToRuler];

  if (v7)
  {
    return PKInputBufferedFilter<_PKStrokePoint,_PKStrokePoint>::copyUpdatedRangeFromIndex((void *)a1, a2, a3);
  }
  else
  {
    long long v9 = *(uint64_t (**)(void))(**(void **)(a1 + 8) + 24);
    return v9();
  }
}

void sub_1C4761A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void PKRulerExtremaFilter::run(PKRulerExtremaFilter *this)
{
  uint64_t v1 = *((void *)this + 5);
  if (0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((void *)this + 7) - *((void *)this + 6)) >> 3) > (unint64_t)v1)
  {
    if (v1 < 1 || *((void *)this + 4) >= v1)
    {
      std::vector<_PKStrokePoint>::resize((uint64_t)this + 80, *((void *)this + 9));
      unint64_t v3 = *((void *)this + 5);
    }
    else
    {
      std::vector<_PKStrokePoint>::resize((uint64_t)this + 80, 0);
      unint64_t v3 = 0;
      *((void *)this + 5) = 0;
      *((void *)this + 9) = 0;
    }
    uint64_t v4 = *((void *)this + 6);
    if (v3 < 0x2E8BA2E8BA2E8BA3 * ((*((void *)this + 7) - v4) >> 3))
    {
      long long v5 = (void *)((char *)this + 80);
      long long v6 = (void *)((char *)this + 96);
      char v7 = (char *)*((void *)this + 11);
      while (1)
      {
        uint64_t v8 = v4 + 88 * v3;
        if ((unint64_t)v7 >= *v6)
        {
          uint64_t v13 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)&v7[-*v5] >> 3);
          unint64_t v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) > 0x2E8BA2E8BA2E8BALL) {
            goto LABEL_83;
          }
          if (0x5D1745D1745D1746 * ((uint64_t)(*v6 - *v5) >> 3) > v14) {
            unint64_t v14 = 0x5D1745D1745D1746 * ((uint64_t)(*v6 - *v5) >> 3);
          }
          if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*v6 - *v5) >> 3)) >= 0x1745D1745D1745DLL) {
            unint64_t v15 = 0x2E8BA2E8BA2E8BALL;
          }
          else {
            unint64_t v15 = v14;
          }
          if (v15) {
            long long v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_PKStrokePoint>>((uint64_t)this + 96, v15);
          }
          else {
            long long v16 = 0;
          }
          long long v17 = &v16[88 * v13];
          long long v18 = *(_OWORD *)(v8 + 16);
          *(_OWORD *)long long v17 = *(_OWORD *)v8;
          *((_OWORD *)v17 + 1) = v18;
          long long v19 = *(_OWORD *)(v8 + 32);
          long long v20 = *(_OWORD *)(v8 + 48);
          long long v21 = *(_OWORD *)(v8 + 64);
          *((void *)v17 + 1std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(v8 + 80);
          *((_OWORD *)v17 + 3) = v20;
          *((_OWORD *)v17 + 4) = v21;
          *((_OWORD *)v17 + 2) = v19;
          CGAffineTransform v23 = (char *)*((void *)this + 10);
          double v22 = (char *)*((void *)this + 11);
          CGAffineTransform v24 = v17;
          if (v22 != v23)
          {
            do
            {
              long long v25 = *(_OWORD *)(v22 - 88);
              *(_OWORD *)(v24 - 72) = *(_OWORD *)(v22 - 72);
              *(_OWORD *)(v24 - 8_Block_object_dispose(&STACK[0x260], 8) = v25;
              long long v26 = *(_OWORD *)(v22 - 56);
              long long v27 = *(_OWORD *)(v22 - 40);
              long long v28 = *(_OWORD *)(v22 - 24);
              *((void *)v24 - 1) = *((void *)v22 - 1);
              *(_OWORD *)(v24 - 24) = v28;
              *(_OWORD *)(v24 - 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v27;
              *(_OWORD *)(v24 - 56) = v26;
              v24 -= 88;
              v22 -= 88;
            }
            while (v22 != v23);
            double v22 = (char *)*v5;
          }
          char v7 = v17 + 88;
          *((void *)this + 1std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v24;
          *((void *)this + 11) = v17 + 88;
          *((void *)this + 12) = &v16[88 * v15];
          if (v22) {
            operator delete(v22);
          }
        }
        else
        {
          long long v9 = *(_OWORD *)(v8 + 16);
          *(_OWORD *)char v7 = *(_OWORD *)v8;
          *((_OWORD *)v7 + 1) = v9;
          long long v10 = *(_OWORD *)(v8 + 32);
          long long v11 = *(_OWORD *)(v8 + 48);
          long long v12 = *(_OWORD *)(v8 + 64);
          *((void *)v7 + 1std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(v8 + 80);
          *((_OWORD *)v7 + 3) = v11;
          *((_OWORD *)v7 + 4) = v12;
          *((_OWORD *)v7 + 2) = v10;
          v7 += 88;
        }
        *((void *)this + 11) = v7;
        if (PKRulerExtremaFilter::isReversal(this)) {
          break;
        }
        int64_t v34 = *((void *)this + 4);
        if ((uint64_t)v3 < v34)
        {
          uint64_t v35 = 1;
LABEL_77:
          *((void *)this + 9) += v35;
        }
LABEL_78:
        ++v3;
        uint64_t v4 = *((void *)this + 6);
        if (v3 >= 0x2E8BA2E8BA2E8BA3 * ((*((void *)this + 7) - v4) >> 3)) {
          goto LABEL_81;
        }
      }
      long long v29 = v7 - 88;
      *((void *)this + 11) = v7 - 88;
      CGAffineTransform v30 = v7 - 176;
      unint64_t v31 = *((void *)this + 12);
      if ((unint64_t)(v7 - 88) >= v31)
      {
        uint64_t v36 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)&v29[-*v5] >> 3);
        unint64_t v37 = v36 + 1;
        if ((unint64_t)(v36 + 1) > 0x2E8BA2E8BA2E8BALL) {
          goto LABEL_83;
        }
        unint64_t v38 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v31 - *v5) >> 3);
        if (2 * v38 > v37) {
          unint64_t v37 = 2 * v38;
        }
        if (v38 >= 0x1745D1745D1745DLL) {
          unint64_t v39 = 0x2E8BA2E8BA2E8BALL;
        }
        else {
          unint64_t v39 = v37;
        }
        if (v39) {
          CGAffineTransform v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_PKStrokePoint>>((uint64_t)this + 96, v39);
        }
        else {
          CGAffineTransform v40 = 0;
        }
        char v41 = &v40[88 * v36];
        long long v42 = *((_OWORD *)v30 + 1);
        *(_OWORD *)char v41 = *(_OWORD *)v30;
        *((_OWORD *)v41 + 1) = v42;
        long long v43 = *((_OWORD *)v30 + 2);
        long long v44 = *((_OWORD *)v30 + 3);
        long long v45 = *((_OWORD *)v30 + 4);
        *((void *)v41 + 1std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *((void *)v30 + 10);
        *((_OWORD *)v41 + 3) = v44;
        *((_OWORD *)v41 + 4) = v45;
        *((_OWORD *)v41 + 2) = v43;
        unint64_t v47 = (char *)*((void *)this + 10);
        unsigned int v46 = (char *)*((void *)this + 11);
        char v48 = v41;
        if (v46 != v47)
        {
          do
          {
            long long v49 = *(_OWORD *)(v46 - 88);
            *(_OWORD *)(v48 - 72) = *(_OWORD *)(v46 - 72);
            *(_OWORD *)(v48 - 8_Block_object_dispose(&STACK[0x260], 8) = v49;
            long long v50 = *(_OWORD *)(v46 - 56);
            long long v51 = *(_OWORD *)(v46 - 40);
            long long v52 = *(_OWORD *)(v46 - 24);
            *((void *)v48 - 1) = *((void *)v46 - 1);
            *(_OWORD *)(v48 - 24) = v52;
            *(_OWORD *)(v48 - 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v51;
            *(_OWORD *)(v48 - 56) = v50;
            v48 -= 88;
            v46 -= 88;
          }
          while (v46 != v47);
          unsigned int v46 = (char *)*v5;
        }
        char v7 = v41 + 88;
        *((void *)this + 1std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v48;
        *((void *)this + 11) = v41 + 88;
        *((void *)this + 12) = &v40[88 * v39];
        if (v46) {
          operator delete(v46);
        }
      }
      else
      {
        long long v32 = *((_OWORD *)v7 - 8);
        *(_OWORD *)(v7 - 56) = *((_OWORD *)v7 - 9);
        *(_OWORD *)(v7 - 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v32;
        *(_OWORD *)(v7 - 24) = *((_OWORD *)v7 - 7);
        *((void *)v7 - 1) = *((void *)v7 - 12);
        long long v33 = *((_OWORD *)v7 - 10);
        *(_OWORD *)long long v29 = *(_OWORD *)v30;
        *(_OWORD *)(v7 - 72) = v33;
      }
      *((void *)this + 11) = v7;
      CGRect v53 = v7 - 88;
      unint64_t v54 = *((void *)this + 12);
      if ((unint64_t)v7 >= v54)
      {
        uint64_t v59 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)&v7[-*v5] >> 3);
        unint64_t v60 = v59 + 1;
        if ((unint64_t)(v59 + 1) > 0x2E8BA2E8BA2E8BALL) {
          goto LABEL_83;
        }
        unint64_t v61 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v54 - *v5) >> 3);
        if (2 * v61 > v60) {
          unint64_t v60 = 2 * v61;
        }
        if (v61 >= 0x1745D1745D1745DLL) {
          unint64_t v62 = 0x2E8BA2E8BA2E8BALL;
        }
        else {
          unint64_t v62 = v60;
        }
        if (v62) {
          uint64_t v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_PKStrokePoint>>((uint64_t)this + 96, v62);
        }
        else {
          uint64_t v63 = 0;
        }
        unint64_t v64 = &v63[88 * v59];
        long long v65 = *((_OWORD *)v53 + 1);
        *(_OWORD *)unint64_t v64 = *(_OWORD *)v53;
        *((_OWORD *)v64 + 1) = v65;
        long long v66 = *((_OWORD *)v53 + 2);
        long long v67 = *((_OWORD *)v53 + 3);
        long long v68 = *((_OWORD *)v53 + 4);
        *((void *)v64 + 1std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *((void *)v53 + 10);
        *((_OWORD *)v64 + 3) = v67;
        *((_OWORD *)v64 + 4) = v68;
        *((_OWORD *)v64 + 2) = v66;
        long long v70 = (char *)*((void *)this + 10);
        double v69 = (char *)*((void *)this + 11);
        long long v71 = v64;
        if (v69 != v70)
        {
          do
          {
            long long v72 = *(_OWORD *)(v69 - 88);
            *(_OWORD *)(v71 - 72) = *(_OWORD *)(v69 - 72);
            *(_OWORD *)(v71 - 8_Block_object_dispose(&STACK[0x260], 8) = v72;
            long long v73 = *(_OWORD *)(v69 - 56);
            long long v74 = *(_OWORD *)(v69 - 40);
            long long v75 = *(_OWORD *)(v69 - 24);
            *((void *)v71 - 1) = *((void *)v69 - 1);
            *(_OWORD *)(v71 - 24) = v75;
            *(_OWORD *)(v71 - 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v74;
            *(_OWORD *)(v71 - 56) = v73;
            v71 -= 88;
            v69 -= 88;
          }
          while (v69 != v70);
          double v69 = (char *)*v5;
        }
        uint64_t v58 = v64 + 88;
        *((void *)this + 1std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v71;
        *((void *)this + 11) = v64 + 88;
        *((void *)this + 12) = &v63[88 * v62];
        if (v69) {
          operator delete(v69);
        }
      }
      else
      {
        long long v55 = *(_OWORD *)(v7 - 40);
        *((_OWORD *)v7 + 2) = *(_OWORD *)(v7 - 56);
        *((_OWORD *)v7 + 3) = v55;
        *((_OWORD *)v7 + 4) = *(_OWORD *)(v7 - 24);
        *((void *)v7 + 1std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *((void *)v7 - 1);
        long long v56 = *(_OWORD *)v53;
        long long v57 = *(_OWORD *)(v7 - 72);
        uint64_t v58 = v7 + 88;
        *(_OWORD *)char v7 = v56;
        *((_OWORD *)v7 + 1) = v57;
      }
      *((void *)this + 11) = v58;
      uint64_t v76 = *((void *)this + 6) + 88 * v3;
      unint64_t v77 = *((void *)this + 12);
      if ((unint64_t)v58 >= v77)
      {
        uint64_t v82 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)&v58[-*v5] >> 3);
        unint64_t v83 = v82 + 1;
        if ((unint64_t)(v82 + 1) > 0x2E8BA2E8BA2E8BALL) {
LABEL_83:
        }
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        unint64_t v84 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v77 - *v5) >> 3);
        if (2 * v84 > v83) {
          unint64_t v83 = 2 * v84;
        }
        if (v84 >= 0x1745D1745D1745DLL) {
          unint64_t v85 = 0x2E8BA2E8BA2E8BALL;
        }
        else {
          unint64_t v85 = v83;
        }
        if (v85) {
          uint64_t v86 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_PKStrokePoint>>((uint64_t)this + 96, v85);
        }
        else {
          uint64_t v86 = 0;
        }
        uint64_t v87 = &v86[88 * v82];
        long long v88 = *(_OWORD *)(v76 + 16);
        *(_OWORD *)uint64_t v87 = *(_OWORD *)v76;
        *((_OWORD *)v87 + 1) = v88;
        long long v89 = *(_OWORD *)(v76 + 32);
        long long v90 = *(_OWORD *)(v76 + 48);
        long long v91 = *(_OWORD *)(v76 + 64);
        *((void *)v87 + 1std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(v76 + 80);
        *((_OWORD *)v87 + 3) = v90;
        *((_OWORD *)v87 + 4) = v91;
        *((_OWORD *)v87 + 2) = v89;
        long long v93 = (char *)*((void *)this + 10);
        long long v92 = (char *)*((void *)this + 11);
        long long v94 = v87;
        if (v92 != v93)
        {
          do
          {
            long long v95 = *(_OWORD *)(v92 - 88);
            *(_OWORD *)(v94 - 72) = *(_OWORD *)(v92 - 72);
            *(_OWORD *)(v94 - 8_Block_object_dispose(&STACK[0x260], 8) = v95;
            long long v96 = *(_OWORD *)(v92 - 56);
            long long v97 = *(_OWORD *)(v92 - 40);
            long long v98 = *(_OWORD *)(v92 - 24);
            *((void *)v94 - 1) = *((void *)v92 - 1);
            *(_OWORD *)(v94 - 24) = v98;
            *(_OWORD *)(v94 - 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v97;
            *(_OWORD *)(v94 - 56) = v96;
            v94 -= 88;
            v92 -= 88;
          }
          while (v92 != v93);
          long long v92 = (char *)*v5;
        }
        char v7 = v87 + 88;
        *((void *)this + 1std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v94;
        *((void *)this + 11) = v87 + 88;
        *((void *)this + 12) = &v86[88 * v85];
        if (v92) {
          operator delete(v92);
        }
      }
      else
      {
        long long v78 = *(_OWORD *)(v76 + 16);
        *(_OWORD *)uint64_t v58 = *(_OWORD *)v76;
        *((_OWORD *)v58 + 1) = v78;
        long long v79 = *(_OWORD *)(v76 + 32);
        long long v80 = *(_OWORD *)(v76 + 48);
        long long v81 = *(_OWORD *)(v76 + 64);
        *((void *)v58 + 1std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(v76 + 80);
        *((_OWORD *)v58 + 3) = v80;
        *((_OWORD *)v58 + 4) = v81;
        *((_OWORD *)v58 + 2) = v79;
        char v7 = v58 + 88;
      }
      *((void *)this + 11) = v7;
      int64_t v34 = *((void *)this + 4);
      if ((uint64_t)v3 >= v34) {
        goto LABEL_78;
      }
      uint64_t v35 = 3;
      goto LABEL_77;
    }
    int64_t v34 = *((void *)this + 4);
LABEL_81:
    *((void *)this + 5) = v34;
  }
}

BOOL PKRulerExtremaFilter::isReversal(PKRulerExtremaFilter *this)
{
  uint64_t v1 = *((void *)this + 10);
  unint64_t v2 = 0x2E8BA2E8BA2E8BA3 * ((*((void *)this + 11) - v1) >> 3);
  if (v2 < 3) {
    return 0;
  }
  BOOL result = 0;
  uint64_t v4 = v1 + 88 * v2;
  double v5 = *(double *)(v4 - 168);
  double v6 = *(double *)(v4 - 160);
  double v7 = *(double *)(v4 - 256) - v5;
  double v8 = *(double *)(v4 - 248) - v6;
  double v9 = sqrt(v8 * v8 + v7 * v7);
  if (v9 >= 0.00001)
  {
    double v10 = *(double *)(v4 - 80) - v5;
    double v11 = *(double *)(v4 - 72) - v6;
    double v12 = sqrt(v11 * v11 + v10 * v10);
    if (v12 >= 0.00001) {
      return v8 * (1.0 / v9) * (v11 * (1.0 / v12)) + v7 * (1.0 / v9) * (v10 * (1.0 / v12)) >= 0.9;
    }
  }
  return result;
}

void sub_1C47626BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,id a27)
{
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

uint64_t drawing::StrokeID::StrokeID(uint64_t this)
{
  *(void *)this = &unk_1F1FB0890;
  *(_DWORD *)(this + 32) = 0;
  return this;
}

{
  *(void *)this = &unk_1F1FB0890;
  *(_DWORD *)(this + 32) = 0;
  return this;
}

void drawing::StrokeID::~StrokeID(drawing::StrokeID *this)
{
  PB::Base::~Base(this);

  JUMPOUT(0x1C8783F10);
}

uint64_t drawing::StrokeID::StrokeID(uint64_t this, const drawing::StrokeID *a2)
{
  *(void *)this = &unk_1F1FB0890;
  *(_DWORD *)(this + 32) = 0;
  char v2 = *((unsigned char *)a2 + 32);
  if (v2)
  {
    uint64_t v4 = *((void *)a2 + 1);
    char v3 = 1;
    *(unsigned char *)(this + 32) = 1;
    *(void *)(this + _Block_object_dispose(&STACK[0x260], 8) = v4;
    char v2 = *((unsigned char *)a2 + 32);
    if ((v2 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v3 = 0;
  if ((*((unsigned char *)a2 + 32) & 2) != 0)
  {
LABEL_5:
    uint64_t v5 = *((void *)a2 + 2);
    v3 |= 2u;
    *(unsigned char *)(this + 32) = v3;
    *(void *)(this + 16) = v5;
    char v2 = *((unsigned char *)a2 + 32);
  }
LABEL_6:
  if ((v2 & 4) != 0)
  {
    uint64_t v6 = *((void *)a2 + 3);
    *(unsigned char *)(this + 32) = v3 | 4;
    *(void *)(this + 24) = v6;
  }
  return this;
}

uint64_t drawing::StrokeID::operator=(uint64_t a1, const drawing::StrokeID *a2)
{
  if ((const drawing::StrokeID *)a1 != a2)
  {
    drawing::StrokeID::StrokeID((uint64_t)v7, a2);
    int v3 = *(_DWORD *)(a1 + 32);
    *(_DWORD *)(a1 + 32) = v10;
    int v10 = v3;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = v8;
    long long v8 = v4;
    uint64_t v5 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = v9;
    uint64_t v9 = v5;
    PB::Base::~Base((PB::Base *)v7);
  }
  return a1;
}

uint64_t drawing::swap(uint64_t this, drawing::StrokeID *a2, drawing::StrokeID *a3)
{
  int v3 = *(_DWORD *)(this + 32);
  *(_DWORD *)(this + 32) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + _Block_object_dispose(&STACK[0x260], 8) = v3;
  uint64_t v4 = *(void *)(this + 8);
  *(void *)(this + _Block_object_dispose(&STACK[0x260], 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  uint64_t v5 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v5;
  uint64_t v6 = *(void *)(this + 24);
  *(void *)(this + 24) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v6;
  return this;
}

uint64_t drawing::StrokeID::StrokeID(uint64_t result, uint64_t a2)
{
  *(void *)BOOL result = &unk_1F1FB0890;
  *(_DWORD *)(result + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a2 + 32) = 0;
  *(void *)(result + _Block_object_dispose(&STACK[0x260], 8) = *(void *)(a2 + 8);
  *(void *)(result + 16) = *(void *)(a2 + 16);
  *(void *)(result + 24) = *(void *)(a2 + 24);
  return result;
}

{
  *(void *)BOOL result = &unk_1F1FB0890;
  *(_DWORD *)(result + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a2 + 32) = 0;
  *(void *)(result + _Block_object_dispose(&STACK[0x260], 8) = *(void *)(a2 + 8);
  *(void *)(result + 16) = *(void *)(a2 + 16);
  *(void *)(result + 24) = *(void *)(a2 + 24);
  return result;
}

uint64_t drawing::StrokeID::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    uint64_t v9 = &unk_1F1FB0890;
    int v3 = *(_DWORD *)(a2 + 32);
    *(_DWORD *)(a2 + 32) = 0;
    uint64_t v4 = *(void *)(a2 + 24);
    int v12 = *(_DWORD *)(a1 + 32);
    long long v5 = *(_OWORD *)(a1 + 8);
    long long v6 = *(_OWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 32) = v3;
    *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = v6;
    long long v10 = v5;
    uint64_t v7 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = v4;
    uint64_t v11 = v7;
    PB::Base::~Base((PB::Base *)&v9);
  }
  return a1;
}

uint64_t drawing::StrokeID::formatText(drawing::StrokeID *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 32);
  if (v5)
  {
    PB::TextFormatter::format(a2, "clock");
    char v5 = *((unsigned char *)this + 32);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)this + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "replicaIndex");
  if ((*((unsigned char *)this + 32) & 4) != 0) {
LABEL_4:
  }
    PB::TextFormatter::format(a2, "subclock");
LABEL_5:

  return MEMORY[0x1F4147498](a2);
}

uint64_t drawing::StrokeID::readFrom(drawing::StrokeID *this, PB::Reader *a2)
{
  unint64_t v3 = *((void *)a2 + 1);
  unint64_t v2 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v3 < v2 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v3 > 0xFFFFFFFFFFFFFFF5 || v3 + 10 > v2) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v3 + 1;
        *((void *)a2 + 1) = v3 + 1;
        char v13 = *(unsigned char *)(v8 + v3);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v3 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_31;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v19 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        *((unsigned char *)this + 32) |= 4u;
        unint64_t v27 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
        uint64_t v28 = *(void *)a2;
        if (v27 > 0xFFFFFFFFFFFFFFF5 || v27 + 10 > v2)
        {
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v31 = 0;
          if (v2 <= v27) {
            unint64_t v3 = *((void *)a2 + 1);
          }
          else {
            unint64_t v3 = *((void *)a2 + 2);
          }
          while (1)
          {
            if (v3 == v27)
            {
              uint64_t v31 = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_83;
            }
            unint64_t v45 = v27++;
            char v46 = *(unsigned char *)(v28 + v45);
            *((void *)a2 + 1) = v27;
            v31 |= (unint64_t)(v46 & 0x7F) << v43;
            if ((v46 & 0x80) == 0) {
              break;
            }
            v43 += 7;
            BOOL v14 = v44++ > 8;
            if (v14)
            {
              uint64_t v31 = 0;
              goto LABEL_82;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            uint64_t v31 = 0;
          }
LABEL_82:
          unint64_t v3 = v45 + 1;
        }
        else
        {
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          while (1)
          {
            unint64_t v3 = v27 + 1;
            *((void *)a2 + 1) = v27 + 1;
            char v32 = *(unsigned char *)(v28 + v27);
            v31 |= (unint64_t)(v32 & 0x7F) << v29;
            if ((v32 & 0x80) == 0) {
              break;
            }
            v29 += 7;
            unint64_t v27 = v3;
            BOOL v14 = v30++ > 8;
            if (v14)
            {
              uint64_t v31 = 0;
              break;
            }
          }
        }
LABEL_83:
        *((void *)this + 3) = v31;
      }
      else if (v19 == 2)
      {
        *((unsigned char *)this + 32) |= 2u;
        unint64_t v33 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
        uint64_t v34 = *(void *)a2;
        if (v33 > 0xFFFFFFFFFFFFFFF5 || v33 + 10 > v2)
        {
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v37 = 0;
          if (v2 <= v33) {
            unint64_t v3 = *((void *)a2 + 1);
          }
          else {
            unint64_t v3 = *((void *)a2 + 2);
          }
          while (1)
          {
            if (v3 == v33)
            {
              uint64_t v37 = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_88;
            }
            unint64_t v49 = v33++;
            char v50 = *(unsigned char *)(v34 + v49);
            *((void *)a2 + 1) = v33;
            v37 |= (unint64_t)(v50 & 0x7F) << v47;
            if ((v50 & 0x80) == 0) {
              break;
            }
            v47 += 7;
            BOOL v14 = v48++ > 8;
            if (v14)
            {
              uint64_t v37 = 0;
              goto LABEL_87;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            uint64_t v37 = 0;
          }
LABEL_87:
          unint64_t v3 = v49 + 1;
        }
        else
        {
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          while (1)
          {
            unint64_t v3 = v33 + 1;
            *((void *)a2 + 1) = v33 + 1;
            char v38 = *(unsigned char *)(v34 + v33);
            v37 |= (unint64_t)(v38 & 0x7F) << v35;
            if ((v38 & 0x80) == 0) {
              break;
            }
            v35 += 7;
            unint64_t v33 = v3;
            BOOL v14 = v36++ > 8;
            if (v14)
            {
              uint64_t v37 = 0;
              break;
            }
          }
        }
LABEL_88:
        *((void *)this + 2) = v37;
      }
      else if (v19 == 1)
      {
        *((unsigned char *)this + 32) |= 1u;
        unint64_t v20 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
        uint64_t v21 = *(void *)a2;
        if (v20 > 0xFFFFFFFFFFFFFFF5 || v20 + 10 > v2)
        {
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v24 = 0;
          if (v2 <= v20) {
            unint64_t v3 = *((void *)a2 + 1);
          }
          else {
            unint64_t v3 = *((void *)a2 + 2);
          }
          while (1)
          {
            if (v3 == v20)
            {
              uint64_t v24 = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_78;
            }
            unint64_t v41 = v20++;
            char v42 = *(unsigned char *)(v21 + v41);
            *((void *)a2 + 1) = v20;
            v24 |= (unint64_t)(v42 & 0x7F) << v39;
            if ((v42 & 0x80) == 0) {
              break;
            }
            v39 += 7;
            BOOL v14 = v40++ > 8;
            if (v14)
            {
              uint64_t v24 = 0;
              goto LABEL_77;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            uint64_t v24 = 0;
          }
LABEL_77:
          unint64_t v3 = v41 + 1;
        }
        else
        {
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          while (1)
          {
            unint64_t v3 = v20 + 1;
            *((void *)a2 + 1) = v20 + 1;
            char v25 = *(unsigned char *)(v21 + v20);
            v24 |= (unint64_t)(v25 & 0x7F) << v22;
            if ((v25 & 0x80) == 0) {
              break;
            }
            v22 += 7;
            unint64_t v20 = v3;
            BOOL v14 = v23++ > 8;
            if (v14)
            {
              uint64_t v24 = 0;
              break;
            }
          }
        }
LABEL_78:
        *((void *)this + 1) = v24;
      }
      else
      {
LABEL_31:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
        unint64_t v3 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
      }
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v3 >= v2 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v3 > v2) {
      unint64_t v2 = v3;
    }
    while (v2 != v3)
    {
      unint64_t v17 = v3 + 1;
      char v18 = *(unsigned char *)(v8 + v3);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v3 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_31;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t drawing::StrokeID::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  char v4 = *(unsigned char *)(this + 32);
  if ((v4 & 1) == 0)
  {
    if ((*(unsigned char *)(this + 32) & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    this = PB::Writer::writeVarInt(a2);
    if ((*(unsigned char *)(v3 + 32) & 4) == 0) {
      return this;
    }
    goto LABEL_7;
  }
  this = PB::Writer::writeVarInt(a2);
  char v4 = *(unsigned char *)(v3 + 32);
  if ((v4 & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v4 & 4) == 0) {
    return this;
  }
LABEL_7:

  return PB::Writer::writeVarInt(a2);
}

BOOL drawing::StrokeID::operator==(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 32))
  {
    if ((*(unsigned char *)(a2 + 32) & 1) == 0 || *(void *)(a1 + 8) != *(void *)(a2 + 8)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 32))
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 32) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 32) & 2) == 0 || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 32) & 2) != 0)
  {
    return 0;
  }
  BOOL v2 = (*(unsigned char *)(a2 + 32) & 4) == 0;
  if ((*(unsigned char *)(a1 + 32) & 4) != 0) {
    return (*(unsigned char *)(a2 + 32) & 4) != 0 && *(void *)(a1 + 24) == *(void *)(a2 + 24);
  }
  return v2;
}

uint64_t drawing::StrokeID::hash_value(drawing::StrokeID *this)
{
  if ((*((unsigned char *)this + 32) & 1) == 0)
  {
    uint64_t v1 = 0;
    if ((*((unsigned char *)this + 32) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v2 = 0;
    if ((*((unsigned char *)this + 32) & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v3 = 0;
    return v2 ^ v1 ^ v3;
  }
  uint64_t v1 = *((void *)this + 1);
  if ((*((unsigned char *)this + 32) & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v2 = *((void *)this + 2);
  if ((*((unsigned char *)this + 32) & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v3 = *((void *)this + 3);
  return v2 ^ v1 ^ v3;
}

void sub_1C47650FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
}

void sub_1C47652D0(_Unwind_Exception *a1)
{
  char v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1C4765340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C476539C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47654A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PKAutoRefineQuery;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1C4765650(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4765CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1C4765EA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4765FE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C47667FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__28(uint64_t a1)
{
}

uint64_t drawing::StrokeData::StrokeData(uint64_t this)
{
  *(void *)this = &unk_1F1FB0708;
  *(void *)(this + 24) = 0;
  *(void *)(this + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  *(void *)(this + 64) = 0;
  *(void *)(this + 92) = 0;
  *(void *)(this + 84) = 0;
  *(_DWORD *)(this + 10std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return this;
}

{
  *(void *)this = &unk_1F1FB0708;
  *(void *)(this + 24) = 0;
  *(void *)(this + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  *(void *)(this + 64) = 0;
  *(void *)(this + 92) = 0;
  *(void *)(this + 84) = 0;
  *(_DWORD *)(this + 10std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return this;
}

void drawing::StrokeData::~StrokeData(drawing::StrokeData *this)
{
  *(void *)this = &unk_1F1FB0708;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 12);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)this + 8, 0);
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)this + 5, 0);
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)this + 3, 0);

  PB::Base::~Base(this);
}

{
  uint64_t vars8;

  drawing::StrokeData::~StrokeData(this);

  JUMPOUT(0x1C8783F10);
}

drawing::StrokeData *drawing::StrokeData::StrokeData(drawing::StrokeData *this, const drawing::StrokeData *a2)
{
  *(void *)this = &unk_1F1FB0708;
  *((void *)this + 3) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + _Block_object_dispose(&STACK[0x260], 8) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  uint64_t v4 = *((void *)a2 + 11);
  uint64_t v5 = *((void *)a2 + 12);
  if (v5)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    long long v6 = (std::__shared_weak_count *)*((void *)this + 12);
    *((void *)this + 11) = v4;
    *((void *)this + 12) = v5;
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
  else
  {
    *((void *)this + 11) = v4;
    *((void *)this + 12) = 0;
  }
  *((_DWORD *)this + 21) = 0;
  if (*((void *)a2 + 8)) {
    operator new();
  }
  char v7 = *((unsigned char *)a2 + 84);
  if ((v7 & 0x20) != 0)
  {
    uint64_t v12 = *((void *)a2 + 9);
    *((unsigned char *)this + 84) |= 0x20u;
    *((void *)this + 9) = v12;
    char v7 = *((unsigned char *)a2 + 84);
    if ((v7 & 4) == 0)
    {
LABEL_9:
      if ((v7 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)a2 + 84) & 4) == 0)
  {
    goto LABEL_9;
  }
  uint64_t v13 = *((void *)a2 + 4);
  *((unsigned char *)this + 84) |= 4u;
  *((void *)this + 4) = v13;
  char v7 = *((unsigned char *)a2 + 84);
  if ((v7 & 8) == 0)
  {
LABEL_10:
    if ((v7 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  uint64_t v14 = *((void *)a2 + 6);
  *((unsigned char *)this + 84) |= 8u;
  *((void *)this + 6) = v14;
  if ((*((unsigned char *)a2 + 84) & 2) != 0)
  {
LABEL_11:
    uint64_t v8 = *((void *)a2 + 2);
    *((unsigned char *)this + 84) |= 2u;
    *((void *)this + 2) = v8;
  }
LABEL_12:
  if (*((void *)a2 + 3)) {
    operator new();
  }
  if (*((void *)a2 + 5)) {
    operator new();
  }
  char v9 = *((unsigned char *)a2 + 84);
  if ((v9 & 0x40) == 0)
  {
    if ((*((unsigned char *)a2 + 84) & 1) == 0) {
      goto LABEL_18;
    }
LABEL_26:
    uint64_t v16 = *((void *)a2 + 1);
    *((unsigned char *)this + 84) |= 1u;
    *((void *)this + 1) = v16;
    if ((*((unsigned char *)a2 + 84) & 0x10) == 0) {
      return this;
    }
    goto LABEL_19;
  }
  char v15 = *((unsigned char *)a2 + 80);
  *((unsigned char *)this + 84) |= 0x40u;
  *((unsigned char *)this + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v15;
  char v9 = *((unsigned char *)a2 + 84);
  if (v9) {
    goto LABEL_26;
  }
LABEL_18:
  if ((v9 & 0x10) != 0)
  {
LABEL_19:
    uint64_t v10 = *((void *)a2 + 7);
    *((unsigned char *)this + 84) |= 0x10u;
    *((void *)this + 7) = v10;
  }
  return this;
}

drawing *drawing::StrokeData::operator=(drawing *a1, const drawing::StrokeData *a2)
{
  if (a1 != a2)
  {
    drawing::StrokeData::StrokeData((drawing::StrokeData *)v5, a2);
    drawing::swap(a1, (drawing::StrokeData *)v5, v3);
    drawing::StrokeData::~StrokeData((drawing::StrokeData *)v5);
  }
  return a1;
}

double drawing::swap(drawing *this, drawing::StrokeData *a2, drawing::StrokeData *a3)
{
  uint64_t v3 = *((void *)this + 11);
  *((void *)this + 11) = *((void *)a2 + 11);
  *((void *)a2 + 11) = v3;
  uint64_t v4 = *((void *)this + 12);
  *((void *)this + 12) = *((void *)a2 + 12);
  *((void *)a2 + 12) = v4;
  LODWORD(v4) = *((_DWORD *)this + 21);
  *((_DWORD *)this + 21) = *((_DWORD *)a2 + 21);
  *((_DWORD *)a2 + 21) = v4;
  uint64_t v5 = *((void *)this + 8);
  *((void *)this + _Block_object_dispose(&STACK[0x260], 8) = *((void *)a2 + 8);
  *((void *)a2 + _Block_object_dispose(&STACK[0x260], 8) = v5;
  uint64_t v6 = *((void *)this + 4);
  *((void *)this + 4) = *((void *)a2 + 4);
  *((void *)a2 + 4) = v6;
  uint64_t v7 = *((void *)this + 6);
  *((void *)this + 6) = *((void *)a2 + 6);
  *((void *)a2 + 6) = v7;
  uint64_t v8 = *((void *)this + 2);
  uint64_t v9 = *((void *)this + 3);
  uint64_t v10 = *((void *)a2 + 3);
  *((void *)this + 2) = *((void *)a2 + 2);
  *((void *)this + 3) = v10;
  double result = *((double *)this + 9);
  *((void *)this + 9) = *((void *)a2 + 9);
  *((double *)a2 + 9) = result;
  *((void *)a2 + 2) = v8;
  *((void *)a2 + 3) = v9;
  uint64_t v12 = *((void *)this + 5);
  *((void *)this + 5) = *((void *)a2 + 5);
  *((void *)a2 + 5) = v12;
  LOBYTE(v12) = *((unsigned char *)this + 80);
  *((unsigned char *)this + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *((unsigned char *)a2 + 80);
  *((unsigned char *)a2 + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v12;
  uint64_t v13 = *((void *)this + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v13;
  uint64_t v14 = *((void *)this + 7);
  *((void *)this + 7) = *((void *)a2 + 7);
  *((void *)a2 + 7) = v14;
  return result;
}

uint64_t drawing::StrokeData::StrokeData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F1FB0708;
  *(void *)(a1 + 24) = 0;
  uint64_t v4 = (void ***)(a1 + 24);
  *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  uint64_t v5 = (void ***)(a1 + 40);
  *(void *)(a1 + 64) = 0;
  uint64_t v6 = (void ***)(a1 + 64);
  *(void *)(a1 + 8_Block_object_dispose(&STACK[0x260], 8) = 0;
  *(void *)(a1 + 96) = 0;
  long long v7 = *(_OWORD *)(a2 + 88);
  *(void *)(a2 + 8_Block_object_dispose(&STACK[0x260], 8) = 0;
  *(void *)(a2 + 96) = 0;
  uint64_t v8 = *(std::__shared_weak_count **)(a1 + 96);
  *(_OWORD *)(a1 + 8_Block_object_dispose(&STACK[0x260], 8) = v7;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  *(_DWORD *)(a1 + 84) = *(_DWORD *)(a2 + 84);
  *(_DWORD *)(a2 + 84) = 0;
  uint64_t v9 = *(void ***)(a2 + 64);
  *(void *)(a2 + 64) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](v6, v9);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x260], 8) = *(void *)(a2 + 48);
  uint64_t v10 = *(void ***)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a2 + 24) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, v10);
  unint64_t v11 = *(void ***)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](v5, v11);
  *(unsigned char *)(a1 + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

drawing *drawing::StrokeData::operator=(drawing *a1, uint64_t a2)
{
  if (a1 != (drawing *)a2)
  {
    drawing::StrokeData::StrokeData((uint64_t)v5, a2);
    drawing::swap(a1, (drawing::StrokeData *)v5, v3);
    drawing::StrokeData::~StrokeData((drawing::StrokeData *)v5);
  }
  return a1;
}

uint64_t drawing::StrokeData::formatText(drawing::StrokeData *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 84);
  if ((v5 & 0x40) != 0)
  {
    PB::TextFormatter::format(a2, "createdWithFinger");
    char v5 = *((unsigned char *)this + 84);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)this + 84) & 1) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "immutablePointsCount");
  if ((*((unsigned char *)this + 84) & 2) != 0) {
LABEL_4:
  }
    PB::TextFormatter::format(a2, "pointsConstantFlags");
LABEL_5:
  if (*((void *)this + 3)) {
    PB::TextFormatter::format();
  }
  if ((*((unsigned char *)this + 84) & 4) != 0) {
    PB::TextFormatter::format(a2, "pointsCount");
  }
  if (*((void *)this + 5)) {
    PB::TextFormatter::format();
  }
  char v6 = *((unsigned char *)this + 84);
  if ((v6 & 8) != 0)
  {
    PB::TextFormatter::format(a2, "pointsFlags");
    char v6 = *((unsigned char *)this + 84);
  }
  if ((v6 & 0x10) != 0) {
    PB::TextFormatter::format(a2, "startIndex");
  }
  if (*((void *)this + 8)) {
    PB::TextFormatter::format();
  }
  if ((*((unsigned char *)this + 84) & 0x20) != 0) {
    PB::TextFormatter::format(a2, "timestamp", *((double *)this + 9));
  }

  return MEMORY[0x1F4147498](a2);
}

BOOL drawing::StrokeData::readFrom(drawing::StrokeData *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  uint64_t v8 = (PKProtobufUnknownFields **)((char *)this + 88);
  while (1)
  {
    uint64_t v9 = *(void *)a2;
    if (v2 <= 0xFFFFFFFFFFFFFFF5 && v2 + 10 <= v3) {
      break;
    }
    char v16 = 0;
    unsigned int v17 = 0;
    unint64_t v12 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    do
    {
      if (v3 == v2)
      {
        int v4 = 1;
        *((unsigned char *)a2 + 24) = 1;
        return v4 == 0;
      }
      unint64_t v18 = v2 + 1;
      char v19 = *(unsigned char *)(v9 + v2);
      *((void *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0) {
        goto LABEL_25;
      }
      v16 += 7;
      unint64_t v2 = v18;
      BOOL v15 = v17++ > 8;
    }
    while (!v15);
LABEL_20:
    int v20 = 0;
    LODWORD(v21) = 0;
LABEL_21:
    if (!*v8) {
      operator new();
    }
    BOOL result = PKProtobufUnknownFields::add(*v8, v21, v20, a2);
    if (!result) {
      return result;
    }
LABEL_128:
    unint64_t v2 = *((void *)a2 + 1);
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0) {
      return v4 == 0;
    }
  }
  char v10 = 0;
  unsigned int v11 = 0;
  unint64_t v12 = 0;
  while (1)
  {
    unint64_t v13 = v2 + 1;
    *((void *)a2 + 1) = v2 + 1;
    char v14 = *(unsigned char *)(v9 + v2);
    v12 |= (unint64_t)(v14 & 0x7F) << v10;
    if ((v14 & 0x80) == 0) {
      break;
    }
    v10 += 7;
    unint64_t v2 = v13;
    BOOL v15 = v11++ > 8;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_25:
  int v20 = v12 & 7;
  if (v20 != 4)
  {
    unint64_t v21 = v12 >> 3;
    switch((v12 >> 3))
    {
      case 1u:
        operator new();
      case 2u:
        *((unsigned char *)this + 84) |= 0x20u;
        unint64_t v23 = *((void *)a2 + 1);
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *((void *)a2 + 2))
        {
          *((void *)this + 9) = *(void *)(*(void *)a2 + v23);
          *((void *)a2 + 1) += 8;
        }
        else
        {
          *((unsigned char *)a2 + 24) = 1;
        }
        goto LABEL_128;
      case 3u:
        *((unsigned char *)this + 84) |= 4u;
        unint64_t v24 = *((void *)a2 + 1);
        unint64_t v25 = *((void *)a2 + 2);
        uint64_t v26 = *(void *)a2;
        if (v24 <= 0xFFFFFFFFFFFFFFF5 && v24 + 10 <= v25)
        {
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          do
          {
            unint64_t v30 = v24 + 1;
            *((void *)a2 + 1) = v24 + 1;
            char v31 = *(unsigned char *)(v26 + v24);
            v29 |= (unint64_t)(v31 & 0x7F) << v27;
            if ((v31 & 0x80) == 0) {
              goto LABEL_115;
            }
            v27 += 7;
            unint64_t v24 = v30;
            BOOL v15 = v28++ > 8;
          }
          while (!v15);
LABEL_76:
          uint64_t v29 = 0;
          goto LABEL_115;
        }
        char v68 = 0;
        unsigned int v69 = 0;
        uint64_t v29 = 0;
        if (v25 <= v24) {
          unint64_t v25 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v25 == v24)
          {
            uint64_t v29 = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v70 = v24 + 1;
            char v71 = *(unsigned char *)(v26 + v24);
            *((void *)a2 + 1) = v70;
            v29 |= (unint64_t)(v71 & 0x7F) << v68;
            if (v71 < 0)
            {
              v68 += 7;
              unint64_t v24 = v70;
              BOOL v15 = v69++ > 8;
              if (v15) {
                goto LABEL_76;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              uint64_t v29 = 0;
            }
          }
          break;
        }
LABEL_115:
        *((void *)this + 4) = v29;
        goto LABEL_128;
      case 4u:
        *((unsigned char *)this + 84) |= 8u;
        unint64_t v32 = *((void *)a2 + 1);
        unint64_t v33 = *((void *)a2 + 2);
        uint64_t v34 = *(void *)a2;
        if (v32 <= 0xFFFFFFFFFFFFFFF5 && v32 + 10 <= v33)
        {
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          do
          {
            unint64_t v38 = v32 + 1;
            *((void *)a2 + 1) = v32 + 1;
            char v39 = *(unsigned char *)(v34 + v32);
            v37 |= (unint64_t)(v39 & 0x7F) << v35;
            if ((v39 & 0x80) == 0) {
              goto LABEL_118;
            }
            v35 += 7;
            unint64_t v32 = v38;
            BOOL v15 = v36++ > 8;
          }
          while (!v15);
LABEL_83:
          uint64_t v37 = 0;
          goto LABEL_118;
        }
        char v72 = 0;
        unsigned int v73 = 0;
        uint64_t v37 = 0;
        if (v33 <= v32) {
          unint64_t v33 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v33 == v32)
          {
            uint64_t v37 = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v74 = v32 + 1;
            char v75 = *(unsigned char *)(v34 + v32);
            *((void *)a2 + 1) = v74;
            v37 |= (unint64_t)(v75 & 0x7F) << v72;
            if (v75 < 0)
            {
              v72 += 7;
              unint64_t v32 = v74;
              BOOL v15 = v73++ > 8;
              if (v15) {
                goto LABEL_83;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              uint64_t v37 = 0;
            }
          }
          break;
        }
LABEL_118:
        *((void *)this + 6) = v37;
        goto LABEL_128;
      case 5u:
        *((unsigned char *)this + 84) |= 2u;
        unint64_t v40 = *((void *)a2 + 1);
        unint64_t v41 = *((void *)a2 + 2);
        uint64_t v42 = *(void *)a2;
        if (v40 <= 0xFFFFFFFFFFFFFFF5 && v40 + 10 <= v41)
        {
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v45 = 0;
          do
          {
            unint64_t v46 = v40 + 1;
            *((void *)a2 + 1) = v40 + 1;
            char v47 = *(unsigned char *)(v42 + v40);
            v45 |= (unint64_t)(v47 & 0x7F) << v43;
            if ((v47 & 0x80) == 0) {
              goto LABEL_121;
            }
            v43 += 7;
            unint64_t v40 = v46;
            BOOL v15 = v44++ > 8;
          }
          while (!v15);
LABEL_90:
          uint64_t v45 = 0;
          goto LABEL_121;
        }
        char v76 = 0;
        unsigned int v77 = 0;
        uint64_t v45 = 0;
        if (v41 <= v40) {
          unint64_t v41 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v41 == v40)
          {
            uint64_t v45 = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v78 = v40 + 1;
            char v79 = *(unsigned char *)(v42 + v40);
            *((void *)a2 + 1) = v78;
            v45 |= (unint64_t)(v79 & 0x7F) << v76;
            if (v79 < 0)
            {
              v76 += 7;
              unint64_t v40 = v78;
              BOOL v15 = v77++ > 8;
              if (v15) {
                goto LABEL_90;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              uint64_t v45 = 0;
            }
          }
          break;
        }
LABEL_121:
        *((void *)this + 2) = v45;
        goto LABEL_128;
      case 6u:
        operator new();
      case 7u:
        operator new();
      case 8u:
        *((unsigned char *)this + 84) |= 0x40u;
        unint64_t v48 = *((void *)a2 + 1);
        if (v48 >= *((void *)a2 + 2))
        {
          BOOL v51 = 0;
          *((unsigned char *)a2 + 24) = 1;
        }
        else
        {
          unint64_t v49 = v48 + 1;
          int v50 = *(unsigned __int8 *)(*(void *)a2 + v48);
          *((void *)a2 + 1) = v49;
          BOOL v51 = v50 != 0;
        }
        *((unsigned char *)this + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v51;
        goto LABEL_128;
      case 9u:
        *((unsigned char *)this + 84) |= 1u;
        unint64_t v52 = *((void *)a2 + 1);
        unint64_t v53 = *((void *)a2 + 2);
        uint64_t v54 = *(void *)a2;
        if (v52 <= 0xFFFFFFFFFFFFFFF5 && v52 + 10 <= v53)
        {
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v57 = 0;
          do
          {
            unint64_t v58 = v52 + 1;
            *((void *)a2 + 1) = v52 + 1;
            char v59 = *(unsigned char *)(v54 + v52);
            v57 |= (unint64_t)(v59 & 0x7F) << v55;
            if ((v59 & 0x80) == 0) {
              goto LABEL_124;
            }
            v55 += 7;
            unint64_t v52 = v58;
            BOOL v15 = v56++ > 8;
          }
          while (!v15);
LABEL_99:
          uint64_t v57 = 0;
          goto LABEL_124;
        }
        char v80 = 0;
        unsigned int v81 = 0;
        uint64_t v57 = 0;
        if (v53 <= v52) {
          unint64_t v53 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v53 == v52)
          {
            uint64_t v57 = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v82 = v52 + 1;
            char v83 = *(unsigned char *)(v54 + v52);
            *((void *)a2 + 1) = v82;
            v57 |= (unint64_t)(v83 & 0x7F) << v80;
            if (v83 < 0)
            {
              v80 += 7;
              unint64_t v52 = v82;
              BOOL v15 = v81++ > 8;
              if (v15) {
                goto LABEL_99;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              uint64_t v57 = 0;
            }
          }
          break;
        }
LABEL_124:
        *((void *)this + 1) = v57;
        goto LABEL_128;
      case 0xAu:
        *((unsigned char *)this + 84) |= 0x10u;
        unint64_t v60 = *((void *)a2 + 1);
        unint64_t v61 = *((void *)a2 + 2);
        uint64_t v62 = *(void *)a2;
        if (v60 <= 0xFFFFFFFFFFFFFFF5 && v60 + 10 <= v61)
        {
          char v63 = 0;
          unsigned int v64 = 0;
          uint64_t v65 = 0;
          do
          {
            unint64_t v66 = v60 + 1;
            *((void *)a2 + 1) = v60 + 1;
            char v67 = *(unsigned char *)(v62 + v60);
            v65 |= (unint64_t)(v67 & 0x7F) << v63;
            if ((v67 & 0x80) == 0) {
              goto LABEL_127;
            }
            v63 += 7;
            unint64_t v60 = v66;
            BOOL v15 = v64++ > 8;
          }
          while (!v15);
LABEL_106:
          uint64_t v65 = 0;
          goto LABEL_127;
        }
        char v84 = 0;
        unsigned int v85 = 0;
        uint64_t v65 = 0;
        if (v61 <= v60) {
          unint64_t v61 = *((void *)a2 + 1);
        }
        break;
      default:
        goto LABEL_21;
    }
    while (1)
    {
      if (v61 == v60)
      {
        uint64_t v65 = 0;
        *((unsigned char *)a2 + 24) = 1;
        goto LABEL_127;
      }
      unint64_t v86 = v60 + 1;
      char v87 = *(unsigned char *)(v62 + v60);
      *((void *)a2 + 1) = v86;
      v65 |= (unint64_t)(v87 & 0x7F) << v84;
      if ((v87 & 0x80) == 0) {
        break;
      }
      v84 += 7;
      unint64_t v60 = v86;
      BOOL v15 = v85++ > 8;
      if (v15) {
        goto LABEL_106;
      }
    }
    if (*((unsigned char *)a2 + 24)) {
      uint64_t v65 = 0;
    }
LABEL_127:
    *((void *)this + 7) = v65;
    goto LABEL_128;
  }
  int v4 = 0;
  return v4 == 0;
}

void sub_1C476792C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100]((PB::Writer ***)va, 0);
  _Unwind_Resume(a1);
}

const void ***drawing::StrokeData::writeTo(drawing::StrokeData *this, PB::Writer *a2)
{
  int v4 = (const PB::Data *)*((void *)this + 8);
  if (v4) {
    PB::Writer::write(a2, v4);
  }
  char v5 = *((unsigned char *)this + 84);
  if ((v5 & 0x20) != 0)
  {
    PB::Writer::write(a2, *((double *)this + 9));
    char v5 = *((unsigned char *)this + 84);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)this + 84) & 4) == 0)
  {
    goto LABEL_5;
  }
  PB::Writer::writeVarInt(a2);
  char v5 = *((unsigned char *)this + 84);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_22:
  PB::Writer::writeVarInt(a2);
  if ((*((unsigned char *)this + 84) & 2) != 0) {
LABEL_7:
  }
    PB::Writer::writeVarInt(a2);
LABEL_8:
  char v6 = (const PB::Data *)*((void *)this + 3);
  if (v6) {
    PB::Writer::write(a2, v6);
  }
  long long v7 = (const PB::Data *)*((void *)this + 5);
  if (v7) {
    PB::Writer::write(a2, v7);
  }
  char v8 = *((unsigned char *)this + 84);
  if ((v8 & 0x40) != 0)
  {
    PB::Writer::write(a2);
    char v8 = *((unsigned char *)this + 84);
    if ((v8 & 1) == 0)
    {
LABEL_14:
      if ((v8 & 0x10) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)this + 84) & 1) == 0)
  {
    goto LABEL_14;
  }
  PB::Writer::writeVarInt(a2);
  if ((*((unsigned char *)this + 84) & 0x10) != 0) {
LABEL_15:
  }
    PB::Writer::writeVarInt(a2);
LABEL_16:
  BOOL result = (const void ***)*((void *)this + 11);
  if (result)
  {
    return PKProtobufUnknownFields::writeTo(result, (char **)a2);
  }
  return result;
}

BOOL drawing::StrokeData::operator==(uint64_t a1, uint64_t a2)
{
  BOOL result = PKProtobufUnknownFieldsCompare((void ***)(a1 + 88), (void ***)(a2 + 88));
  if (result)
  {
    uint64_t v5 = *(void *)(a2 + 64);
    if (*(void *)(a1 + 64))
    {
      if (!v5 || (PB::Data::operator==() & 1) == 0 && *(void *)(a1 + 64) | *(void *)(a2 + 64)) {
        return 0;
      }
    }
    else if (v5)
    {
      return 0;
    }
    if ((*(unsigned char *)(a1 + 84) & 0x20) != 0)
    {
      if ((*(unsigned char *)(a2 + 84) & 0x20) == 0 || *(double *)(a1 + 72) != *(double *)(a2 + 72)) {
        return 0;
      }
    }
    else if ((*(unsigned char *)(a2 + 84) & 0x20) != 0)
    {
      return 0;
    }
    if ((*(unsigned char *)(a1 + 84) & 4) != 0)
    {
      if ((*(unsigned char *)(a2 + 84) & 4) == 0 || *(void *)(a1 + 32) != *(void *)(a2 + 32)) {
        return 0;
      }
    }
    else if ((*(unsigned char *)(a2 + 84) & 4) != 0)
    {
      return 0;
    }
    if ((*(unsigned char *)(a1 + 84) & 8) != 0)
    {
      if ((*(unsigned char *)(a2 + 84) & 8) == 0 || *(void *)(a1 + 48) != *(void *)(a2 + 48)) {
        return 0;
      }
    }
    else if ((*(unsigned char *)(a2 + 84) & 8) != 0)
    {
      return 0;
    }
    if ((*(unsigned char *)(a1 + 84) & 2) != 0)
    {
      if ((*(unsigned char *)(a2 + 84) & 2) == 0 || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
        return 0;
      }
    }
    else if ((*(unsigned char *)(a2 + 84) & 2) != 0)
    {
      return 0;
    }
    uint64_t v6 = *(void *)(a2 + 24);
    if (*(void *)(a1 + 24))
    {
      if (!v6 || (PB::Data::operator==() & 1) == 0 && *(void *)(a1 + 24) | *(void *)(a2 + 24)) {
        return 0;
      }
    }
    else if (v6)
    {
      return 0;
    }
    uint64_t v7 = *(void *)(a2 + 40);
    if (*(void *)(a1 + 40))
    {
      if (!v7 || (PB::Data::operator==() & 1) == 0 && *(void *)(a1 + 40) | *(void *)(a2 + 40)) {
        return 0;
      }
LABEL_40:
      if ((*(unsigned char *)(a1 + 84) & 0x40) != 0)
      {
        if ((*(unsigned char *)(a2 + 84) & 0x40) == 0 || *(unsigned __int8 *)(a1 + 80) != *(unsigned __int8 *)(a2 + 80)) {
          return 0;
        }
      }
      else if ((*(unsigned char *)(a2 + 84) & 0x40) != 0)
      {
        return 0;
      }
      if (*(unsigned char *)(a1 + 84))
      {
        if ((*(unsigned char *)(a2 + 84) & 1) == 0 || *(void *)(a1 + 8) != *(void *)(a2 + 8)) {
          return 0;
        }
      }
      else if (*(unsigned char *)(a2 + 84))
      {
        return 0;
      }
      BOOL result = (*(unsigned char *)(a2 + 84) & 0x10) == 0;
      if ((*(unsigned char *)(a1 + 84) & 0x10) == 0) {
        return result;
      }
      return (*(unsigned char *)(a2 + 84) & 0x10) != 0 && *(void *)(a1 + 56) == *(void *)(a2 + 56);
    }
    if (!v7) {
      goto LABEL_40;
    }
    return 0;
  }
  return result;
}

uint64_t drawing::StrokeData::hash_value(drawing::StrokeData *this)
{
  if (*((void *)this + 8)) {
    uint64_t v2 = PBHashBytes();
  }
  else {
    uint64_t v2 = 0;
  }
  if ((*((unsigned char *)this + 84) & 0x20) != 0)
  {
    if (*((double *)this + 9) == 0.0) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = *((void *)this + 9);
    }
    if ((*((unsigned char *)this + 84) & 4) != 0)
    {
LABEL_6:
      uint64_t v4 = *((void *)this + 4);
      if ((*((unsigned char *)this + 84) & 8) != 0) {
        goto LABEL_7;
      }
LABEL_14:
      uint64_t v5 = 0;
      if ((*((unsigned char *)this + 84) & 2) != 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*((unsigned char *)this + 84) & 4) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
  if ((*((unsigned char *)this + 84) & 8) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v5 = *((void *)this + 6);
  if ((*((unsigned char *)this + 84) & 2) != 0)
  {
LABEL_8:
    uint64_t v6 = *((void *)this + 2);
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v6 = 0;
LABEL_16:
  if (*((void *)this + 3)) {
    uint64_t v7 = PBHashBytes();
  }
  else {
    uint64_t v7 = 0;
  }
  if (*((void *)this + 5)) {
    uint64_t v8 = PBHashBytes();
  }
  else {
    uint64_t v8 = 0;
  }
  if ((*((unsigned char *)this + 84) & 0x40) == 0)
  {
    uint64_t v9 = 0;
    if (*((unsigned char *)this + 84)) {
      goto LABEL_24;
    }
LABEL_27:
    uint64_t v10 = 0;
    if ((*((unsigned char *)this + 84) & 0x10) != 0) {
      goto LABEL_25;
    }
LABEL_28:
    uint64_t v11 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  uint64_t v9 = *((unsigned __int8 *)this + 80);
  if ((*((unsigned char *)this + 84) & 1) == 0) {
    goto LABEL_27;
  }
LABEL_24:
  uint64_t v10 = *((void *)this + 1);
  if ((*((unsigned char *)this + 84) & 0x10) == 0) {
    goto LABEL_28;
  }
LABEL_25:
  uint64_t v11 = *((void *)this + 7);
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

void sub_1C4769C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__29(uint64_t a1)
{
}

void sub_1C476BE64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C476C298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C476C628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __PKSubheadRegularFontSizeInPoints_block_invoke()
{
  id v1 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v1 pointSize];
  _MergedGlobals_7 = v0;
}

void sub_1C476C9A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476CAB0(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1C476CBBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476CDE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476CF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)PKRecognitionSessionManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1C476D000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C476D118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_1C476D258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C476D588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476D680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__30(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return result;
}

{
  *(void *)(result + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__30(uint64_t a1)
{
}

void sub_1C476D794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476DCE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476DDE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476DF24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476E28C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476E5B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476E7E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476E950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476EBC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id drawingStrokesFromStrokes(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "_strokeUUID", (void)v14);
          uint64_t v11 = [v4 _visibleStrokeForIdentifier:v10];

          if (v11) {
            [v5 addObject:v11];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    unint64_t v12 = (void *)[v5 copy];
  }
  else
  {
    unint64_t v12 = 0;
  }

  return v12;
}

void sub_1C476ED9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476EEA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476EFF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476F2D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476F93C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476FB24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C476FDCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  unint64_t v23 = v22;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1C476FFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  char v22 = v21;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1C47701A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1C4770638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1C4770BA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4770C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C4770DD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4770F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C4771334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_1C477148C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C477158C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_1C4771644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47716F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4771800(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4771944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1C4771AC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4771B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C4772324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1C4772470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47728C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1C4772F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4773124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47732D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C477349C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  objc_destroyWeak(v17);
  _Unwind_Resume(a1);
}

void sub_1C47735DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C4773AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_1C4773F64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47742D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4774708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1C4774880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C4774A30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4774C08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4774DE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4775214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id location)
{
  objc_destroyWeak(v38);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1C4775368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47753F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47756C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1C4775800(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4775994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4775B14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4775CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  int v20 = v19;

  _Unwind_Resume(a1);
}

void sub_1C47763A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4776548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C477672C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1C47768FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4776C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4776D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C4776E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16, id a17)
{
  unint64_t v21 = v20;

  a9.super_class = (Class)PKRendererTile;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1C47770A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4777420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4777524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4777678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47777AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47778E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4777A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1C4777BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1C4778254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4779C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1C477A10C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__31(uint64_t a1)
{
}

{
}

void PKFountainPenFilter::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v9 = a2;
  PKInputBaseFilter<_PKStrokePoint,_PKStrokePoint>::drawingBeganWithInk(a1, v9, a3, a4);
  *(void *)(a1 + 104) = a3;
  char v7 = [v9 _isFountainPenInkV2];
  if (a3 == 1) {
    char v8 = v7;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(a1 + 112) = v8;
}

void sub_1C477C13C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void PKFountainPenFilter::run(PKFountainPenFilter *this)
{
  int64_t v2 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((void *)this + 7) - *((void *)this + 6)) >> 3);
  id v3 = (uint64_t *)((char *)this + 80);
  std::vector<_PKStrokePoint>::resize((uint64_t)this + 80, v2);
  uint64_t v4 = *((void *)this + 9);
  if (*((unsigned char *)this + 112))
  {
    if (v2 > v4)
    {
      uint64_t v5 = *v3;
      do
      {
        uint64_t v6 = *((void *)this + 6) + 88 * v4;
        uint64_t v7 = v5 + 88 * v4;
        long long v8 = *(_OWORD *)(v6 + 16);
        *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
        *(_OWORD *)(v7 + 16) = v8;
        long long v9 = *(_OWORD *)(v6 + 32);
        long long v10 = *(_OWORD *)(v6 + 48);
        long long v11 = *(_OWORD *)(v6 + 64);
        *(void *)(v7 + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(v6 + 80);
        *(_OWORD *)(v7 + 4_Block_object_dispose(&STACK[0x260], 8) = v10;
        *(_OWORD *)(v7 + 64) = v11;
        *(_OWORD *)(v7 + 32) = v9;
        uint64_t v5 = *((void *)this + 10);
        uint64_t v12 = v5 + 88 * v4;
        *(void *)(v12 + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0x3FF0000000000000;
        unint64_t v13 = (double *)(v12 + 80);
        if (v4 < 1 || v4 >= v2 - 1)
        {
          ++v4;
        }
        else
        {
          DKDDiffAngleInRadians(*(long double *)(*((void *)this + 6) + 88 * v4 + 56), *(long double *)(*((void *)this + 6) + 88 * v4 + 144));
          *(float *)&double v14 = v14;
          double v15 = (fabsf(*(float *)&v14) + -0.75) / -0.699999999;
          double v16 = 0.0;
          if (v15 >= 0.0)
          {
            double v16 = v15;
            if (v15 > 1.0) {
              double v16 = 1.0;
            }
          }
          ++v4;
          float v17 = v16;
          *unint64_t v13 = v17;
        }
      }
      while (v4 != v2);
    }
    if (*((uint64_t *)this + 4) <= 1) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = *((void *)this + 4);
    }
    uint64_t v19 = v18 - 1;
    if (*((unsigned char *)this + 16)) {
      uint64_t v20 = *((void *)this + 4);
    }
    else {
      uint64_t v20 = v19;
    }
  }
  else
  {
    int64_t v21 = v2 - v4;
    if (v2 > v4)
    {
      uint64_t v22 = 88 * v4;
      do
      {
        uint64_t v23 = *((void *)this + 6) + v22;
        uint64_t v24 = *((void *)this + 10) + v22;
        long long v26 = *(_OWORD *)(v23 + 48);
        long long v25 = *(_OWORD *)(v23 + 64);
        long long v27 = *(_OWORD *)(v23 + 32);
        *(void *)(v24 + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(v23 + 80);
        *(_OWORD *)(v24 + 4_Block_object_dispose(&STACK[0x260], 8) = v26;
        *(_OWORD *)(v24 + 64) = v25;
        *(_OWORD *)(v24 + 32) = v27;
        long long v28 = *(_OWORD *)(v23 + 16);
        *(_OWORD *)uint64_t v24 = *(_OWORD *)v23;
        *(_OWORD *)(v24 + 16) = v28;
        v22 += 88;
        --v21;
      }
      while (v21);
    }
    uint64_t v20 = *((void *)this + 4);
  }
  *((void *)this + 9) = v20;
}

uint64_t PKFountainPenFilter::copyUpdatedRangeFromIndex(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 112)) {
    return PKInputBufferedFilter<_PKStrokePoint,_PKStrokePoint>::copyUpdatedRangeFromIndex((void *)a1, a2, a3);
  }
  else {
    return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 24))();
  }
}

void sub_1C477C724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPNPWelcomeControllerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PNPWelcomeController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1EB3C6240 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    PencilPairingUILibrary();
  }
}

void PencilPairingUILibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!PencilPairingUILibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    _OWORD v1[2] = 3221225472;
    v1[3] = __PencilPairingUILibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E64CAE20;
    uint64_t v3 = 0;
    PencilPairingUILibraryCore_frameworkLibrarfloat y = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (PencilPairingUILibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __PencilPairingUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PencilPairingUILibraryCore_frameworkLibrarfloat y = result;
  return result;
}

PKPaletteContainerView *__getPNPWizardViewControllerClass_block_invoke(uint64_t a1)
{
  PencilPairingUILibrary();
  uint64_t result = (PKPaletteContainerView *)objc_getClass("PNPWizardViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1EB3C6248 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (PKPaletteContainerView *)abort_report_np();
    return [(PKPaletteContainerView *)v3 initWithFrame:v5];
  }
  return result;
}

void sub_1C4782610(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C478282C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C4782B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C4782DC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4782E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  long long v10 = v9;

  a9.super_class = (Class)PKLassoRenderer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1C478346C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,id location,id a55,id a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,void *a63)
{
  objc_destroyWeak(v70);
  objc_destroyWeak(v72);
  objc_destroyWeak(v71);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a55);
  objc_destroyWeak(&a56);
  _Block_object_dispose(&a57, 8);
  if (a63)
  {
    a64 = (uint64_t)a63;
    operator delete(a63);
  }
  if (__p)
  {
    a67 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1C4783754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v14 = v13;

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__32(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__32(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_1C478398C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C4783DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  _Unwind_Resume(a1);
}

void sub_1C4783F24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4783FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1C4784484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  _Block_object_dispose(&a22, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C4784850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C4784904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

uint64_t PKPaletteToolEqualTools(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  CGRect v5 = [v3 toolIdentifier];
  uint64_t v6 = [v4 toolIdentifier];
  id v7 = v5;
  id v8 = v6;
  long long v9 = v8;
  if (v7 == v8)
  {
  }
  else
  {
    uint64_t v10 = 0;
    if (!v7 || !v8)
    {
      id v20 = v8;
      id v21 = v7;
LABEL_25:

      long long v9 = v20;
      id v7 = v21;
LABEL_26:

      goto LABEL_27;
    }
    uint64_t v10 = [v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_26;
    }
  }
  long long v11 = [v3 configuration];
  uint64_t v12 = [v4 configuration];
  unint64_t v13 = v11;
  unint64_t v14 = v12;
  if (v13 | v14)
  {
    uint64_t v19 = (void *)v14;
    uint64_t v10 = 0;
    if (!v13 || !v14)
    {
      double v16 = (void *)v13;
LABEL_24:
      id v21 = v7;
      id v20 = v9;

      long long v9 = v19;
      id v7 = v16;
      goto LABEL_25;
    }
    char v22 = [(id)v13 isEqual:v14];

    if ((v22 & 1) == 0)
    {
      uint64_t v10 = 0;
      goto LABEL_27;
    }
  }
  else
  {
  }
  if ([v3 isInkingTool] && objc_msgSend(v4, "isInkingTool"))
  {
    id v7 = [v3 inkingTool];
    double v15 = [v7 ink];
    double v16 = [v4 inkingTool];
    float v17 = [v16 ink];
    unint64_t v13 = v15;
    unint64_t v18 = v17;
    if (v13 | v18)
    {
      uint64_t v19 = (void *)v18;
      uint64_t v10 = 0;
      if (v13 && v18) {
        uint64_t v10 = [(id)v13 isEqual:v18];
      }
      long long v9 = (void *)v13;
    }
    else
    {
      uint64_t v19 = 0;
      unint64_t v13 = 0;
      long long v9 = 0;
      uint64_t v10 = 1;
    }
    goto LABEL_24;
  }
  uint64_t v10 = 1;
LABEL_27:

  return v10;
}

void sub_1C4786244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C4787BF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4787F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4788090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47881D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__33(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__33(uint64_t a1)
{
}

void sub_1C47882AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47885AC(_Unwind_Exception *a1)
{
  uint64_t v6 = *(void **)(v4 - 184);
  if (v6)
  {
    *(void *)(v4 - 176) = v6;
    operator delete(v6);
  }
  id v7 = *(void **)(v4 - 160);
  if (v7)
  {
    *(void *)(v4 - 152) = v7;
    operator delete(v7);
  }

  _Unwind_Resume(a1);
}

void sub_1C4788BE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4788FF4(_Unwind_Exception *a1)
{
  id v8 = *(void **)(v6 - 152);
  if (v8)
  {
    *(void *)(v6 - 144) = v8;
    operator delete(v8);
  }

  _Unwind_Resume(a1);
}

void sub_1C47890EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C4789550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *__p,uint64_t a38)
{
  if (__p) {
    operator delete(__p);
  }
  char v43 = *(void **)(v41 - 200);
  if (v43)
  {
    *(void *)(v41 - 192) = v43;
    operator delete(v43);
  }

  _Unwind_Resume(a1);
}

void sub_1C4789C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,void *a32,uint64_t a33)
{
  if (__p) {
    operator delete(__p);
  }
  if (a32) {
    operator delete(a32);
  }

  _Unwind_Resume(a1);
}

void sub_1C478A014(_Unwind_Exception *a1)
{
  uint64_t v6 = *(void **)(v4 - 152);
  if (v6)
  {
    *(void *)(v4 - 144) = v6;
    operator delete(v6);
  }

  _Unwind_Resume(a1);
}

void sub_1C478A628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,uint64_t a29,void *a30,uint64_t a31)
{
  if (__p) {
    operator delete(__p);
  }
  if (a30) {
    operator delete(a30);
  }

  _Unwind_Resume(a1);
}

void sub_1C478AAA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *__p,uint64_t a37,uint64_t a38,void *a39,uint64_t a40)
{
  if (__p) {
    operator delete(__p);
  }
  if (a39) {
    operator delete(a39);
  }

  _Unwind_Resume(a1);
}

void sub_1C478AE30(_Unwind_Exception *a1)
{
  uint64_t v6 = *(void **)(v4 - 136);
  if (v6)
  {
    *(void *)(v4 - 12_Block_object_dispose(&STACK[0x260], 8) = v6;
    operator delete(v6);
  }

  _Unwind_Resume(a1);
}

void sub_1C478B5E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,void *__p,uint64_t a55)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1C478BA10(_Unwind_Exception *a1)
{
  uint64_t v6 = *(void **)(v4 - 184);
  if (v6)
  {
    *(void *)(v4 - 176) = v6;
    operator delete(v6);
  }

  _Unwind_Resume(a1);
}

void sub_1C478BDD0(_Unwind_Exception *a1)
{
  uint64_t v6 = *(void **)(v4 - 168);
  if (v6)
  {
    *(void *)(v4 - 16std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v6;
    operator delete(v6);
  }

  _Unwind_Resume(a1);
}

void sub_1C478C0BC(_Unwind_Exception *a1)
{
  uint64_t v6 = *(void **)(v4 - 152);
  if (v6)
  {
    *(void *)(v4 - 144) = v6;
    operator delete(v6);
  }

  _Unwind_Resume(a1);
}

void sub_1C478C2F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C478D0FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1C478D410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C478DB68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C478DD9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<TimestampedPoint>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<TimestampedPoint>::__append((void **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = *(void *)a1 + 24 * a2;
  }
}

void std::vector<TimestampedAngles>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 5;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = *(void *)a1 + 32 * a2;
    }
  }
  else
  {
    std::vector<TimestampedAngles>::__append((char **)a1, a2 - v2);
  }
}

void sub_1C478E3BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t PKDisableShapeRecognition(void)
{
  if (qword_1EB3C6290 != -1) {
    dispatch_once(&qword_1EB3C6290, &__block_literal_global_136_1);
  }
  return byte_1EB3C6251;
}

void ___Z25PKDisableShapeRecognitionv_block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  byte_1EB3C6251 = [v0 BOOLForKey:@"PKDisableShapeRecognition"];
}

void sub_1C478E474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<TimestampedAngles>>(unint64_t a1)
{
  if (a1 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a1);
}

void std::vector<TimestampedPoint>::__append(void **a1, unint64_t a2)
{
  unint64_t v4 = a1[1];
  CGRect v5 = a1[2];
  if (0xAAAAAAAAAAAAAAABLL * ((v5 - (unsigned char *)v4) >> 3) >= a2)
  {
    if (a2)
    {
      long long v11 = &v4[3 * a2];
      uint64_t v12 = (_OWORD *)MEMORY[0x1E4F1DAD8];
      do
      {
        *(_OWORD *)unint64_t v4 = *v12;
        v4[2] = 0;
        v4 += 3;
      }
      while (v4 != v11);
      unint64_t v4 = v11;
    }
    a1[1] = v4;
  }
  else
  {
    unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)v4 - (unsigned char *)*a1) >> 3);
    unint64_t v7 = v6 + a2;
    if (v6 + a2 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (unsigned char *)*a1) >> 3);
    if (2 * v8 > v7) {
      unint64_t v7 = 2 * v8;
    }
    if (v8 >= 0x555555555555555) {
      unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v9 = v7;
    }
    if (v9) {
      unint64_t v9 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::LocalMinimum>>(v9);
    }
    else {
      uint64_t v10 = 0;
    }
    unint64_t v13 = v9 + 24 * v6;
    unint64_t v14 = (void *)(v13 + 24 * a2);
    double v15 = (_OWORD *)MEMORY[0x1E4F1DAD8];
    unint64_t v16 = v13;
    do
    {
      *(_OWORD *)unint64_t v16 = *v15;
      *(void *)(v16 + 16) = 0;
      v16 += 24;
    }
    while ((void *)v16 != v14);
    unint64_t v17 = v9 + 24 * v10;
    uint64_t v19 = (char *)*a1;
    unint64_t v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        long long v20 = *(_OWORD *)(v18 - 24);
        *(void *)(v13 - _Block_object_dispose(&STACK[0x260], 8) = *((void *)v18 - 1);
        *(_OWORD *)(v13 - 24) = v20;
        v13 -= 24;
        v18 -= 24;
      }
      while (v18 != v19);
      unint64_t v18 = (char *)*a1;
    }
    *a1 = (void *)v13;
    a1[1] = v14;
    a1[2] = (void *)v17;
    if (v18)
    {
      operator delete(v18);
    }
  }
}

void std::vector<TimestampedAngles>::__append(char **a1, unint64_t a2)
{
  CGRect v5 = a1[1];
  unint64_t v4 = a1[2];
  if (a2 <= (v4 - v5) >> 5)
  {
    if (a2)
    {
      bzero(a1[1], 32 * a2);
      v5 += 32 * a2;
    }
    a1[1] = v5;
  }
  else
  {
    uint64_t v6 = v5 - *a1;
    unint64_t v7 = a2 + (v6 >> 5);
    if (v7 >> 59) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v8 = v6 >> 5;
    uint64_t v9 = v4 - *a1;
    if (v9 >> 4 > v7) {
      unint64_t v7 = v9 >> 4;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v10 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v10 = v7;
    }
    if (v10) {
      unint64_t v10 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<TimestampedAngles>>(v10);
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = (char *)(v10 + 32 * v8);
    unint64_t v13 = v10 + 32 * v11;
    bzero(v12, 32 * a2);
    unint64_t v14 = &v12[32 * a2];
    unint64_t v16 = *a1;
    double v15 = a1[1];
    if (v15 != *a1)
    {
      do
      {
        long long v17 = *((_OWORD *)v15 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v15 - 2);
        *((_OWORD *)v12 - 1) = v17;
        v12 -= 32;
        v15 -= 32;
      }
      while (v15 != v16);
      double v15 = *a1;
    }
    *a1 = v12;
    a1[1] = v14;
    a1[2] = (char *)v13;
    if (v15)
    {
      operator delete(v15);
    }
  }
}

void sub_1C4793748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47938E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double b(int a1, double a2)
{
  switch(a1)
  {
    case -2:
      double v2 = (3.0 - a2) * a2 + -3.0;
      goto LABEL_6;
    case -1:
      double v2 = (a2 * 3.0 + -6.0) * a2;
      double v4 = 4.0;
      goto LABEL_7;
    case 0:
      double v2 = (a2 * -3.0 + 3.0) * a2 + 3.0;
LABEL_6:
      double v4 = 1.0;
LABEL_7:
      double v5 = v4 + v2 * a2;
      goto LABEL_9;
    case 1:
      double v5 = a2 * a2 * a2;
LABEL_9:
      double result = v5 / 6.0;
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

double b2(int a1, double a2)
{
  switch(a1)
  {
    case -2:
      double v2 = (a2 * -2.0 + 3.0) * a2 / 6.0 + (3.0 - a2) * a2 / 6.0;
      double v3 = -0.5;
      goto LABEL_6;
    case -1:
      double result = a2 * a2 * 0.5 + (a2 * 3.0 + -6.0) * a2 / 3.0;
      break;
    case 0:
      __asm
      {
        FMOV            V2.2D, #3.0
        FMOV            V1.2D, #6.0
      }
      double v2 = vaddvq_f64(vdivq_f64(vmulq_n_f64(vmlaq_n_f64(_Q2, (float64x2_t)xmmword_1C482B9B0, a2), a2), _Q1));
      double v3 = 0.5;
LABEL_6:
      double result = v2 + v3;
      break;
    case 1:
      double result = a2 * a2 * 3.0 / 6.0;
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

double b3(int a1, double result)
{
  switch(a1)
  {
    case -2:
      double result = 1.0 - result;
      break;
    case -1:
      double v2 = -2.0;
      double v3 = 3.0;
      goto LABEL_6;
    case 0:
      double v2 = 1.0;
      double v3 = -3.0;
LABEL_6:
      double result = v2 + result * v3;
      break;
    case 1:
      return result;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

double approximateSplineLength(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v8 = (a1 + a3 * 2.0) * 0.333333333;
  double v9 = (a2 + a4 * 2.0) * 0.333333333;
  double v10 = (a8 + a6 * 2.0) * 0.333333333;
  double v11 = (a5 + a3 * 2.0) * 0.333333333;
  double v12 = (a6 + a4 * 2.0) * 0.333333333;
  double v13 = (a3 + a5 * 2.0) * 0.333333333;
  double v14 = (a4 + a6 * 2.0) * 0.333333333;
  double v15 = (v8 + v11) * 0.5;
  double v16 = (v9 + v12) * 0.5;
  double v17 = (v13 + (a7 + a5 * 2.0) * 0.333333333) * 0.5;
  double v18 = (v14 + v10) * 0.5;
  return (sqrt((v12 - v14) * (v12 - v14) + (v11 - v13) * (v11 - v13))
        + sqrt((v16 - v12) * (v16 - v12) + (v15 - v11) * (v15 - v11))
        + sqrt((v14 - v18) * (v14 - v18) + (v13 - v17) * (v13 - v17)))
       * 0.5
       + sqrt((v16 - v18) * (v16 - v18) + (v15 - v17) * (v15 - v17)) * 0.5;
}

double splinePoint(void *a1, uint64_t a2, double (*a3)(void, double), double a4)
{
  double v9 = *MEMORY[0x1E4F1DAD8];
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  uint64_t v10 = 88 * a2 - 80;
  uint64_t v11 = -4;
  do
  {
    if (a2 + v11 + 2 > -2)
    {
      unint64_t v14 = a2 + v11 + 3;
      uint64_t v15 = a1[1];
      unint64_t v16 = 0x2E8BA2E8BA2E8BA3 * ((v15 - *a1) >> 3);
      double v17 = (double *)(v15 - 80);
      double v18 = (double *)(v15 - 72);
      BOOL v19 = v14 >= v16;
      if (v14 >= v16) {
        double v13 = v18;
      }
      else {
        double v13 = (double *)(*a1 + v10 + 8);
      }
      if (v19) {
        double v12 = v17;
      }
      else {
        double v12 = (double *)(*a1 + v10);
      }
    }
    else
    {
      double v12 = (double *)(*a1 + 8);
      double v13 = (double *)(*a1 + 16);
    }
    double v20 = *v12;
    double v21 = *v13;
    double v22 = a3((v11 + 2), a4);
    double v9 = v9 + v22 * v20;
    double v8 = v8 + v22 * v21;
    v10 += 88;
    BOOL v19 = __CFADD__(v11++, 1);
  }
  while (!v19);
  return v9;
}

double splinePoint(const PKStrokePathPointsPrivate *this, unint64_t a2, unint64_t a3, uint64_t a4, double a5, double (*a6)(int, double))
{
  if (a3 - a2 <= 1) {
    return PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, a2);
  }
  double v8 = *MEMORY[0x1E4F1DAD8];
  double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v35 = PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, a2);
  double v15 = v14;
  double v16 = PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, a2 + 1);
  double v18 = v17;
  double v19 = PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, a3 - 1);
  double v21 = v20;
  double v22 = -(v16 - v35 * 2.0);
  double v23 = -(v18 - v15 * 2.0);
  double v36 = -(PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, a3 - 2) - v19 * 2.0);
  double v25 = -(v24 - v21 * 2.0);
  uint64_t v26 = ~a4;
  uint64_t v27 = a4 + a2;
  for (uint64_t i = -2; i != 2; ++i)
  {
    double v29 = v23;
    double v30 = v22;
    if (i >= v26)
    {
      unint64_t v31 = v27 + i + 1;
      double v29 = v25;
      double v30 = v36;
      if (v31 < a3)
      {
        double v30 = PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, v31);
        double v29 = v32;
      }
    }
    double v33 = a6(i, a5);
    double v8 = v8 + v33 * v30;
    double v13 = v13 + v33 * v29;
  }
  return v8;
}

double splineSegmentLength(const PKStrokePathPointsPrivate *this, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a3 - a2 < 2) {
    return 0.0;
  }
  if (a3 - a2 == 2)
  {
    double v7 = PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, a2);
    double v9 = v8;
    double v10 = PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, a2 + 1);
    return sqrt((v9 - v11) * (v9 - v11) + (v7 - v10) * (v7 - v10));
  }
  else
  {
    if (a4)
    {
      if (a3 - 2 == a4)
      {
        double v13 = PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, a3 - 1);
        double v15 = v14;
        double v16 = PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, a4);
        double v18 = v17;
        double v19 = -(v17 - v15 * 2.0);
        double v20 = PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, a4 - 1);
        double v22 = v16;
        double v23 = v18;
        double v24 = v13;
        double v25 = v15;
        double v26 = -(v16 - v13 * 2.0);
        double v27 = v19;
      }
      else
      {
        double v36 = PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, a4 - 1);
        double v38 = v37;
        double v39 = PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, a4);
        double v41 = v40;
        double v42 = PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, a4 + 1);
        double v44 = v43;
        double v26 = PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, a4 + 2);
        double v27 = v45;
        double v20 = v36;
        double v21 = v38;
        double v22 = v39;
        double v23 = v41;
        double v24 = v42;
        double v25 = v44;
      }
    }
    else
    {
      double v28 = PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, a2);
      double v30 = v29;
      double v31 = PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, a2 + 1);
      double v33 = v32;
      double v34 = -(v32 - v30 * 2.0);
      double v26 = PKStrokePathPointsPrivate::locationAtIndex((PKStrokePathPointsPrivate *)this, 2uLL);
      double v27 = v35;
      double v20 = -(v31 - v28 * 2.0);
      double v21 = v34;
      double v22 = v28;
      double v23 = v30;
      double v24 = v31;
      double v25 = v33;
    }
    return approximateSplineLength(v20, v21, v22, v23, v24, v25, v26, v27);
  }
}

float64x2_t PKSplinePointsToBezierPoints(float64x2_t *a1, CGPoint *a2)
{
  uint64_t v2 = 0;
  double v3 = (double *)&qword_1C482BA00;
  do
  {
    float64x2_t result = a1[2];
    a2[v2++] = (CGPoint)vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(a1[1], *(v3 - 4)), *a1, *(v3 - 8)), result, *v3), a1[3], v3[4]);
    ++v3;
  }
  while (v2 != 4);
  return result;
}

CGPath *PKCreateCGPathFromBSpline(PKStrokePathPointsPrivate *a1, uint64_t a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  Mutable = CGPathCreateMutable();
  if (a2 < 2) {
    return Mutable;
  }
  uint64_t v5 = 0;
  uint64_t v6 = -1;
  do
  {
    unint64_t v7 = v6;
    for (uint64_t i = 8; i != 72; i += 16)
    {
      unint64_t v9 = v7 + 1;
      if (v7 == -1)
      {
        double v10 = PKStrokePathPointsPrivate::locationAtIndex(a1, 0);
        double v11 = v10 + v10;
        double v13 = v12 + v12;
        double v14 = a1;
        unint64_t v15 = 1;
LABEL_8:
        double v18 = v11 - PKStrokePathPointsPrivate::locationAtIndex(v14, v15);
        double v20 = v13 - v19;
        goto LABEL_10;
      }
      if (a2 == v7)
      {
        double v16 = PKStrokePathPointsPrivate::locationAtIndex(a1, a2 - 1);
        double v11 = v16 + v16;
        double v13 = v17 + v17;
        double v14 = a1;
        unint64_t v15 = a2 - 2;
        goto LABEL_8;
      }
      double v18 = PKStrokePathPointsPrivate::locationAtIndex(a1, v7);
LABEL_10:
      double v21 = (double *)((char *)&v30.x + i);
      *(v21 - 1) = v18;
      *double v21 = v20;
      unint64_t v7 = v9;
    }
    PKSplinePointsToBezierPoints((float64x2_t *)&v30, &v23);
    if (!v5) {
      CGPathMoveToPoint(Mutable, 0, v23.x, v23.y);
    }
    CGPathAddCurveToPoint(Mutable, 0, v24, v25, v26, v27, v28, v29);
    ++v5;
    ++v6;
  }
  while (v5 != a2 - 1);
  return Mutable;
}

void sub_1C4799A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C479A180(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1C479A2D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id PencilKitBundle()
{
  if (qword_1EB3C62C8 != -1) {
    dispatch_once(&qword_1EB3C62C8, &__block_literal_global_86);
  }
  id v0 = (void *)qword_1EB3C62C0;

  return v0;
}

void __PencilKitBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.PencilKit"];
  uint64_t v1 = (void *)qword_1EB3C62C0;
  qword_1EB3C62C0 = v0;
}

id PKUIKitUserDefaults()
{
  if (qword_1EB3C62D8 != -1) {
    dispatch_once(&qword_1EB3C62D8, &__block_literal_global_9_0);
  }
  uint64_t v0 = (void *)qword_1EB3C62D0;

  return v0;
}

void __PKUIKitUserDefaults_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.UIKit"];
  uint64_t v1 = (void *)qword_1EB3C62D0;
  qword_1EB3C62D0 = v0;
}

id PKUserDefaults()
{
  if (qword_1EB3C62E8 != -1) {
    dispatch_once(&qword_1EB3C62E8, &__block_literal_global_15_1);
  }
  uint64_t v0 = (void *)qword_1EB3C62E0;

  return v0;
}

void __PKUserDefaults_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.PencilKit"];
  uint64_t v1 = (void *)qword_1EB3C62E0;
  qword_1EB3C62E0 = v0;
}

BOOL PKIsPhoneDevice()
{
  uint64_t v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 0;

  return v1;
}

uint64_t PKIsQuickNoteWindowScene(void *a1)
{
  id v1 = a1;
  if (v1
    && PKIsPadDevice()
    && ([MEMORY[0x1E4F28B50] mainBundle],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        [v2 bundleIdentifier],
        double v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isEqualToString:@"com.apple.mobilenotes"],
        v3,
        v2,
        v4))
  {
    uint64_t v10 = 0;
    double v11 = &v10;
    uint64_t v12 = 0x2050000000;
    uint64_t v5 = (void *)qword_1EB3C62F8;
    uint64_t v13 = qword_1EB3C62F8;
    if (!qword_1EB3C62F8)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getSBSUISystemNotesWindowSceneClass_block_invoke;
      v9[3] = &unk_1E64C5478;
      v9[4] = &v10;
      __getSBSUISystemNotesWindowSceneClass_block_invoke((uint64_t)v9);
      uint64_t v5 = (void *)v11[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v10, 8);
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

void sub_1C479B56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PKIsSmallestQuickNoteWindowScene(void *a1)
{
  id v1 = a1;
  if (PKIsQuickNoteWindowScene(v1))
  {
    uint64_t v2 = [v1 coordinateSpace];
    [v2 bounds];
    BOOL v4 = v3 <= 560.0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

BOOL PKIsQuickNoteOnPhone()
{
  BOOL result = PKIsPhoneDevice();
  if (result)
  {
    id v1 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v2 = [v1 bundleIdentifier];
    uint64_t v3 = [v2 isEqualToString:@"com.apple.mobilenotes.EditorExtension"];

    return v3;
  }
  return result;
}

void PKPerformOnMainThreadNextRunLoop(void *a1, int a2)
{
  id v3 = a1;
  BOOL v4 = v3;
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __PKPerformOnMainThreadNextRunLoop_block_invoke;
    block[3] = &unk_1E64C6060;
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    PKPerformOnMainThread(v3);
  }
}

uint64_t __PKPerformOnMainThreadNextRunLoop_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t PKIsiWork()
{
  if (qword_1EB3C62F0 != -1) {
    dispatch_once(&qword_1EB3C62F0, &__block_literal_global_22_1);
  }
  return _MergedGlobals_160;
}

void __PKIsiWork_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v2 = [v0 bundleIdentifier];

  if (([v2 isEqualToString:@"com.apple.Pages"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.Keynote"] & 1) != 0)
  {
    char v1 = 1;
  }
  else
  {
    char v1 = [v2 isEqualToString:@"com.apple.Numbers"];
  }
  _MergedGlobals_160 = v1;
}

BOOL PKUseCompactSize(void *a1, void *a2)
{
  id v3 = a1;
  BOOL v4 = (PKIsQuickNoteWindowScene(a2) & 1) != 0
    || ![v3 userInterfaceIdiom]
    || [v3 horizontalSizeClass] == 1;

  return v4;
}

CGAffineTransform *PKCGAffineTransformRotateForEdge@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, CGAffineTransform *a3@<X8>)
{
  switch(a2)
  {
    case 2:
      long long v5 = a1[1];
      *(_OWORD *)&v8.a = *a1;
      *(_OWORD *)&v8.c = v5;
      *(_OWORD *)&v8.tdouble x = a1[2];
      CGFloat v4 = 1.57079633;
      break;
    case 8:
      long long v6 = a1[1];
      *(_OWORD *)&v8.a = *a1;
      *(_OWORD *)&v8.c = v6;
      *(_OWORD *)&v8.tdouble x = a1[2];
      CGFloat v4 = -1.57079633;
      break;
    default:
      long long v3 = a1[1];
      *(_OWORD *)&v8.a = *a1;
      *(_OWORD *)&v8.c = v3;
      *(_OWORD *)&v8.tdouble x = a1[2];
      CGFloat v4 = 0.0;
      break;
  }
  return CGAffineTransformRotate(a3, &v8, v4);
}

uint64_t PKUIPopoverPermittedArrowDirectionsForEdge(uint64_t a1)
{
  if (PKIsVisionDevice())
  {
    if (a1 != 4)
    {
      id v2 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CGFloat v4 = 0;
        _os_log_error_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_ERROR, "Unexpected edge to determine popover arrow directions on this platform.", v4, 2u);
      }
    }
    return 2;
  }
  else if ((unint64_t)(a1 - 1) > 7)
  {
    return 15;
  }
  else
  {
    return qword_1C482BA58[a1 - 1];
  }
}

uint64_t PKUIPopoverPermittedArrowDirectionsForCorner(uint64_t a1)
{
  switch(a1)
  {
    case -1:
      uint64_t v1 = 15;
      goto LABEL_6;
    case 1:
    case 2:
      uint64_t v1 = 1;
LABEL_6:
      return PKUIPopoverPermittedArrowDirectionsForEdge(v1);
    case 4:
    case 8:
      PKIsVisionDevice();
      return 2;
    default:
      return 2;
  }
}

uint64_t PKUIPopoverPermittedArrowDirections(uint64_t a1, uint64_t a2, int a3, char a4, int a5)
{
  uint64_t v5 = 2;
  if (a3) {
    uint64_t v5 = 0;
  }
  if (a3 & 1) != 0 || (a4) {
    return v5;
  }
  if (a5) {
    return PKUIPopoverPermittedArrowDirectionsForCorner(a2);
  }
  return PKUIPopoverPermittedArrowDirectionsForEdge(a1);
}

uint64_t PKCurrentDeviceSupportsPencil()
{
  uint64_t v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v1 = [v0 _supportsPencil];

  return v1;
}

BOOL PKCurrentDeviceSupportsInkSynthesis()
{
  return CHGetPersonalizedSynthesisSupportState() > 2;
}

BOOL PKCurrentDeviceSupportsInkSynthesisAndInventoryReady()
{
  return CHGetPersonalizedSynthesisSupportState() == 4;
}

BOOL PKCurrentDeviceSupportsAutoRefine()
{
  BOOL result = PKIsPadDevice();
  if (result) {
    return CHGetPersonalizedSynthesisSupportState() > 2;
  }
  return result;
}

BOOL PKCurrentDeviceSupportsAutoRefineNotReady()
{
  uint64_t v0 = CHGetPersonalizedSynthesisSupportState();
  BOOL v1 = PKIsPadDevice();
  BOOL v2 = v0 > 0 && v1;
  return v0 < 3 && v2;
}

BOOL PKCurrentDeviceSupportsAutoRefineInitializing()
{
  BOOL result = PKIsPadDevice();
  if (result) {
    return CHGetPersonalizedSynthesisSupportState() == 2;
  }
  return result;
}

uint64_t PKCurrentAppSupportsRefinement()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v1 = [v0 bundleIdentifier];
  char v2 = [v1 isEqualToString:@"com.apple.mobilenotes"];

  if (v2) {
    return 1;
  }
  long long v3 = [MEMORY[0x1E4F28B50] mainBundle];
  CGFloat v4 = [v3 bundleIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.PaperKit.MarkupPhotoEditingExtension"];

  if (v5) {
    return 1;
  }
  long long v6 = [MEMORY[0x1E4F28B50] mainBundle];
  unint64_t v7 = [v6 bundleIdentifier];
  if (([v7 isEqualToString:@"com.apple.quicklook.extension.previewUI"] & 1) == 0)
  {
    unint64_t v9 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v10 = [v9 bundleIdentifier];
    char v11 = [v10 isEqualToString:@"com.apple.quicklook.UIExtension"];

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v13 = [v12 bundleIdentifier];
      char v14 = [v13 isEqualToString:@"com.apple.ScreenshotServicesService"];

      if ((v14 & 1) == 0)
      {
        unint64_t v15 = [MEMORY[0x1E4F28B50] mainBundle];
        double v16 = [v15 bundleIdentifier];
        char v17 = [v16 isEqualToString:@"com.apple.Preferences"];

        if ((v17 & 1) == 0)
        {
          long long v6 = [MEMORY[0x1E4F28B50] mainBundle];
          unint64_t v7 = [v6 bundleIdentifier];
          uint64_t v8 = [v7 hasPrefix:@"com.apple.Compose"];
          goto LABEL_5;
        }
      }
    }
    return 1;
  }
  uint64_t v8 = 1;
LABEL_5:

  return v8;
}

Class __getSBSUISystemNotesWindowSceneClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1EB3C6300)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SpringBoardUIServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E64CB188;
    uint64_t v6 = 0;
    qword_1EB3C6300 = _sl_dlopen();
    char v2 = (void *)v4[0];
    if (!qword_1EB3C6300)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SBSUISystemNotesWindowScene");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    char v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_1EB3C62F8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardUIServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB3C6300 = result;
  return result;
}

uint64_t __MobileKeyBagLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileKeyBagLibraryCore_frameworkLibrarfloat y = result;
  return result;
}

void sub_1C479C11C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C479C180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)PKSpaceInsertionView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1C479C334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C479C418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C479C61C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C479C9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1C479CB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C479CCA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C479CE2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C479D10C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C479D378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C479D43C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C479D584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C479D8C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, id a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1C479DE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1C479E0BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1C479E14C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C479E6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1C479E9DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C479EC68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C479EF08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1C479F168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C479F4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1C479F618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C479F6D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C479F7D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1C47A1304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__34(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__34(uint64_t a1)
{
}

void sub_1C47A26F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id location)
{
}

void sub_1C47A2C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double drawing::StrokeDelta::StrokeDelta(drawing::StrokeDelta *this)
{
  *(void *)this = &unk_1F1FB0740;
  double result = 0.0;
  *(_OWORD *)((char *)this + _Block_object_dispose(&STACK[0x260], 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0u;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F1FB0740;
  double result = 0.0;
  *(_OWORD *)((char *)this + _Block_object_dispose(&STACK[0x260], 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0u;
  return result;
}

void drawing::StrokeDelta::~StrokeDelta(drawing::StrokeDelta *this)
{
  *(void *)this = &unk_1F1FB0740;
  uint64_t v2 = *((void *)this + 6);
  *((void *)this + 6) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  long long v5 = (void **)((char *)this + 16);
  std::vector<PB::Data>::__destroy_vector::operator()[abi:ne180100](&v5);
  uint64_t v4 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  PB::Base::~Base(this);
}

{
  uint64_t vars8;

  drawing::StrokeDelta::~StrokeDelta(this);

  JUMPOUT(0x1C8783F10);
}

drawing::StrokeDelta *drawing::StrokeDelta::StrokeDelta(PB::Data **this, PB::Data **a2)
{
  *this = (PB::Data *)&unk_1F1FB0740;
  *(_OWORD *)(this + 1) = 0u;
  *(_OWORD *)(this + 3) = 0u;
  *(_OWORD *)(this + 5) = 0u;
  if (this != a2) {
    std::vector<PB::Data>::__assign_with_size[abi:ne180100]<PB::Data*,PB::Data*>((uint64_t)(this + 2), a2[2], a2[3], (a2[3] - a2[2]) >> 4);
  }
  if (a2[1]) {
    operator new();
  }
  if (a2[5]) {
    operator new();
  }
  if (a2[6]) {
    operator new();
  }
  return (drawing::StrokeDelta *)this;
}

uint64_t drawing::StrokeDelta::operator=(uint64_t a1, PB::Data **a2)
{
  if ((PB::Data **)a1 != a2)
  {
    drawing::StrokeDelta::StrokeDelta(&v7, a2);
    long long v3 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v9;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = v8;
    long long v8 = v4;
    long long v9 = v3;
    long long v5 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v10;
    long long v10 = v5;
    drawing::StrokeDelta::~StrokeDelta((drawing::StrokeDelta *)&v7);
  }
  return a1;
}

void *drawing::swap(void *this, drawing::StrokeDelta *a2, drawing::StrokeDelta *a3)
{
  uint64_t v3 = this[2];
  this[2] = *((void *)a2 + 2);
  *((void *)a2 + 2) = v3;
  uint64_t v4 = this[3];
  this[3] = *((void *)a2 + 3);
  *((void *)a2 + 3) = v4;
  uint64_t v5 = this[4];
  this[4] = *((void *)a2 + 4);
  *((void *)a2 + 4) = v5;
  uint64_t v6 = this[1];
  this[1] = *((void *)a2 + 1);
  *((void *)a2 + 1) = v6;
  uint64_t v7 = this[5];
  this[5] = *((void *)a2 + 5);
  *((void *)a2 + 5) = v7;
  uint64_t v8 = this[6];
  this[6] = *((void *)a2 + 6);
  *((void *)a2 + 6) = v8;
  return this;
}

uint64_t drawing::StrokeDelta::StrokeDelta(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F1FB0740;
  *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0u;
  std::vector<PB::Data>::__vdeallocate((void **)(a1 + 16));
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a2 + 24) = 0u;
  uint64_t v4 = *(void *)(a2 + 8);
  *(_OWORD *)(a2 + _Block_object_dispose(&STACK[0x260], 8) = 0u;
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = v4;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  uint64_t v7 = *(void *)(a1 + 40);
  *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v6;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a2 + 4_Block_object_dispose(&STACK[0x260], 8) = 0;
  uint64_t v9 = *(void *)(a1 + 48);
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x260], 8) = v8;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  return a1;
}

uint64_t drawing::StrokeDelta::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    drawing::StrokeDelta::StrokeDelta((uint64_t)v7, a2);
    long long v3 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v9;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = v8;
    long long v8 = v4;
    long long v9 = v3;
    long long v5 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v10;
    long long v10 = v5;
    drawing::StrokeDelta::~StrokeDelta((drawing::StrokeDelta *)v7);
  }
  return a1;
}

uint64_t drawing::StrokeDelta::formatText(drawing::StrokeDelta *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "ink");
  }
  uint64_t v6 = *((void *)this + 2);
  for (uint64_t i = *((void *)this + 3); v6 != i; v6 += 16)
    PB::TextFormatter::format();
  uint64_t v8 = *((void *)this + 5);
  if (v8) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v8 + 32))(v8, a2, "stroke");
  }
  uint64_t v9 = *((void *)this + 6);
  if (v9) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v9 + 32))(v9, a2, "strokeData");
  }

  return MEMORY[0x1F4147498](a2);
}

uint64_t drawing::StrokeDelta::readFrom(drawing::StrokeDelta *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    uint64_t v8 = (uint64_t *)((char *)this + 16);
    uint64_t v9 = (char *)this + 32;
    while (1)
    {
      uint64_t v10 = *(void *)a2;
      if (v2 <= 0xFFFFFFFFFFFFFFF5 && v2 + 10 <= v3) {
        break;
      }
      char v17 = 0;
      unsigned int v18 = 0;
      unint64_t v13 = 0;
      if (v2 > v3) {
        unint64_t v3 = v2;
      }
      do
      {
        if (v3 == v2)
        {
          int v4 = 1;
          *((unsigned char *)a2 + 24) = 1;
          return v4 == 0;
        }
        unint64_t v19 = v2 + 1;
        char v20 = *(unsigned char *)(v10 + v2);
        *((void *)a2 + 1) = v19;
        v13 |= (unint64_t)(v20 & 0x7F) << v17;
        if ((v20 & 0x80) == 0) {
          goto LABEL_22;
        }
        v17 += 7;
        unint64_t v2 = v19;
        BOOL v16 = v18++ > 8;
      }
      while (!v16);
LABEL_20:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
LABEL_40:
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      unint64_t v14 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v15 = *(unsigned char *)(v10 + v2);
      v13 |= (unint64_t)(v15 & 0x7F) << v11;
      if ((v15 & 0x80) == 0) {
        break;
      }
      v11 += 7;
      unint64_t v2 = v14;
      BOOL v16 = v12++ > 8;
      if (v16) {
        goto LABEL_20;
      }
    }
LABEL_22:
    if ((v13 & 7) != 4)
    {
      switch((v13 >> 3))
      {
        case 2u:
          CGPoint v23 = (void *)*((void *)this + 3);
          unint64_t v22 = *((void *)this + 4);
          if ((unint64_t)v23 >= v22)
          {
            uint64_t v25 = ((uint64_t)v23 - *v8) >> 4;
            unint64_t v26 = v25 + 1;
            if ((unint64_t)(v25 + 1) >> 60) {
              std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v27 = v22 - *v8;
            if (v27 >> 3 > v26) {
              unint64_t v26 = v27 >> 3;
            }
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v28 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v28 = v26;
            }
            v31[4] = v9;
            if (v28) {
              CGFloat v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)v9, v28);
            }
            else {
              CGFloat v29 = 0;
            }
            CGPoint v30 = &v29[16 * v25];
            v31[0] = v29;
            v31[1] = v30;
            v31[3] = &v29[16 * v28];
            *(void *)CGPoint v30 = 0;
            *((void *)v30 + 1) = 0;
            v31[2] = v30 + 16;
            std::vector<PB::Data>::__swap_out_circular_buffer(v8, v31);
            CGFloat v24 = (void *)*((void *)this + 3);
            std::__split_buffer<PB::Data>::~__split_buffer((uint64_t)v31);
          }
          else
          {
            void *v23 = 0;
            v23[1] = 0;
            CGFloat v24 = v23 + 2;
            *((void *)this + 3) = v23 + 2;
          }
          *((void *)this + 3) = v24;
          PB::Reader::read(a2, (PB::Data *)(v24 - 2));
          goto LABEL_40;
        case 3u:
          operator new();
        case 4u:
          operator new();
        case 5u:
          operator new();
        default:
          goto LABEL_20;
      }
    }
    int v4 = 0;
  }
  return v4 == 0;
}

void sub_1C47A3CA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<PB::Data>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t drawing::StrokeDelta::writeTo(uint64_t this, PB::Writer *a2)
{
  unint64_t v3 = (void *)this;
  int v4 = *(const PB::Data **)(this + 16);
  uint64_t v5 = *(const PB::Data **)(this + 24);
  while (v4 != v5)
  {
    this = PB::Writer::write(a2, v4);
    int v4 = (const PB::Data *)((char *)v4 + 16);
  }
  uint64_t v6 = (const PB::Base *)v3[1];
  if (v6) {
    this = PB::Writer::writeSubmessage(a2, v6);
  }
  uint64_t v7 = (const PB::Base *)v3[5];
  if (v7) {
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  uint64_t v8 = (const PB::Base *)v3[6];
  if (v8)
  {
    return PB::Writer::writeSubmessage(a2, v8);
  }
  return this;
}

uint64_t drawing::StrokeDelta::operator==(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  if (v3 - v2 != a2[3] - v4) {
    return 0;
  }
  while (v2 != v3)
  {
    uint64_t result = PB::Data::operator==();
    if (!result) {
      return result;
    }
    v2 += 16;
    v4 += 16;
  }
  uint64_t v8 = a1[1];
  uint64_t v9 = a2[1];
  if (v8)
  {
    if (!v9 || !drawing::Ink::operator==(v8, v9) && a1[1] | a2[1]) {
      return 0;
    }
  }
  else if (v9)
  {
    return 0;
  }
  uint64_t v10 = a1[5];
  uint64_t v11 = a2[5];
  if (v10)
  {
    if (!v11 || (drawing::Stroke::operator==(v10, v11) & 1) == 0 && a1[5] | a2[5]) {
      return 0;
    }
  }
  else if (v11)
  {
    return 0;
  }
  uint64_t v12 = a1[6];
  if (!v12) {
    return a2[6] == 0;
  }
  uint64_t v13 = a2[6];
  if (v13)
  {
    if (drawing::StrokeData::operator==(v12, v13)) {
      return 1;
    }
    if (!a1[6]) {
      return a2[6] == 0;
    }
  }
  return 0;
}

unint64_t drawing::StrokeDelta::hash_value(drawing::StrokeDelta *this)
{
  uint64_t v2 = *((void *)this + 2);
  uint64_t v3 = *((void *)this + 3);
  if (v2 == v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    do
    {
      v2 += 16;
      v4 ^= PBHashBytes();
    }
    while (v2 != v3);
  }
  uint64_t v5 = (drawing::Ink *)*((void *)this + 1);
  if (v5) {
    unint64_t v6 = drawing::Ink::hash_value(v5);
  }
  else {
    unint64_t v6 = 0;
  }
  uint64_t v7 = (drawing::Stroke *)*((void *)this + 5);
  if (v7) {
    uint64_t v8 = drawing::Stroke::hash_value(v7);
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = *((void *)this + 6);
  if (v9) {
    unint64_t v9 = drawing::StrokeData::hash_value((drawing::StrokeData *)v9);
  }
  return v6 ^ v4 ^ v8 ^ v9;
}

uint64_t drawing::StrokeDelta::makeInk(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

uint64_t drawing::StrokeDelta::makeStroke(uint64_t this)
{
  if (!*(void *)(this + 40)) {
    operator new();
  }
  return this;
}

uint64_t drawing::StrokeDelta::makeStrokeData(uint64_t this)
{
  if (!*(void *)(this + 48)) {
    operator new();
  }
  return this;
}

uint64_t PKRandom(unsigned int *a1, unsigned int a2)
{
  unsigned int v2 = 1664525 * *a1 + 1013904223;
  *a1 = v2;
  return ((double)v2 / 4294967300.0 * (double)a2);
}

void sub_1C47A6758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C47A875C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__35(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__35(uint64_t a1)
{
}

void sub_1C47A9BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
}

void sub_1C47A9CF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

double DKDNearestPointOnLineToPoint(CGPoint *a1, CGPoint a2)
{
  double y = a1->y;
  double v3 = ((a2.y - y) * (a1[1].y - y) + (a2.x - a1->x) * (a1[1].x - a1->x))
     / ((a1[1].y - y) * (a1[1].y - y) + (a1[1].x - a1->x) * (a1[1].x - a1->x));
  double result = 0.0;
  if (v3 >= 0.0)
  {
    double result = v3;
    if (v3 > 1.0) {
      return 1.0;
    }
  }
  return result;
}

void sub_1C47AFAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47AFC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47AFDA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47AFE88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1C47B0198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47B0430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47B0738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47B0818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47B10F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__36(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x260], 8) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v2;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v4 = *(_OWORD *)(a2 + 96);
  long long v5 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 12_Block_object_dispose(&STACK[0x260], 8) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v4;
  *(_OWORD *)(a1 + 112) = v5;
  *(__n128 *)(a1 + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = result;
  return result;
}

void sub_1C47B16A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47B1808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47B1A30(_Unwind_Exception *a1)
{
  if (!v1) {
  _Unwind_Resume(a1);
  }
}

void sub_1C47B1DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47B2138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *__copy_helper_block_ea8_40c54_ZTSNSt3__16vectorI12PKInputPointNS_9allocatorIS1_EEEE(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x260], 8) = 0;
  long long v2 = (void *)(a1 + 40);
  float64x2_t v2[2] = 0;
  return std::vector<PKInputPoint>::__init_with_size[abi:ne180100]<PKInputPoint*,PKInputPoint*>(v2, *(const void **)(a2 + 40), *(void *)(a2 + 48), (uint64_t)(*(void *)(a2 + 48) - *(void *)(a2 + 40)) >> 7);
}

void __destroy_helper_block_ea8_40c54_ZTSNSt3__16vectorI12PKInputPointNS_9allocatorIS1_EEEE(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 4_Block_object_dispose(&STACK[0x260], 8) = v2;
    operator delete(v2);
  }
}

void sub_1C47B2D88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47B2E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1C47B3260(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_1C47B34DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1C47B3924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  unsigned int v18 = *(void **)v16;
  if (*(void *)v16)
  {
    *(void *)(v16 + _Block_object_dispose(&STACK[0x260], 8) = v18;
    operator delete(v18);
  }
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1C47B3A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1C47B3C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1C47B3DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  _Unwind_Resume(a1);
}

void sub_1C47B3F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  _Unwind_Resume(a1);
}

void sub_1C47B4114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47B4380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t PKInputProviderInitial::getUpdatedRangeFromIndex(id *this, unint64_t *a2)
{
  id WeakRetained = objc_loadWeakRetained(this + 1);
  uint64_t v4 = [WeakRetained getInputUpdatedRangeFromIndex:a2];

  return v4;
}

void sub_1C47B48C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t PKInputProviderInitial::copyUpdatedRangeFromIndex(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  uint64_t v6 = [WeakRetained copyInputUpdatedRangeFromIndex:a2 into:a3];

  return v6;
}

void sub_1C47B4920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void PKInputProviderInitial::reset(id *this)
{
  id WeakRetained = objc_loadWeakRetained(this + 1);
  [WeakRetained reset];
}

void sub_1C47B4978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

double PKPixelSmoothingFilter::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  PKInputBaseFilter<PKInputPoint,PKInputPoint>::drawingBeganWithInk(a1, a2, a3, a4);
  double result = a4 * 0.5;
  *(double *)(a1 + 32) = a4 * 0.5;
  *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = a3;
  return result;
}

uint64_t PKPixelSmoothingFilter::copyUpdatedRangeFromIndex(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = *a3;
  uint64_t v5 = a3[1];
  uint64_t v7 = (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained isSnappedToRuler])
  {
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);

    if (v9 != 1)
    {
      uint64_t v10 = (v5 - v6) >> 7;
      uint64_t v11 = *a3;
      uint64_t v12 = (a3[1] - *a3) >> 7;
      if (v10 + 1 < v12 - 1)
      {
        uint64_t v13 = (float64x2_t *)(v11 + (v10 << 7));
        float64x2_t v14 = *(float64x2_t *)(v11 + ((v10 + 1) << 7));
        float64x2_t v15 = *v13;
        uint64_t v16 = v13 + 16;
        uint64_t v17 = v12 - v10 - 2;
        float64x2_t v18 = (float64x2_t)vdupq_n_s64(0x3FD5555555555555uLL);
        do
        {
          float64x2_t v19 = *v16;
          float64x2_t v15 = vmulq_f64(vaddq_f64(vaddq_f64(v15, v14), *v16), v18);
          float64x2_t v20 = vsubq_f64(v15, v14);
          double v21 = sqrt(vmlad_n_f64(COERCE_DOUBLE(*(void *)&vmulq_f64(v20, v20).f64[1]), v20.f64[0], v20.f64[0]));
          double v22 = *(double *)(a1 + 32);
          if (v21 >= v22) {
            float64x2_t v15 = vaddq_f64(v14, vmulq_n_f64(v20, v22 / v21));
          }
          v16[-8] = v15;
          v16 += 8;
          float64x2_t v14 = v19;
          --v17;
        }
        while (v17);
      }
      if (v7 <= 1) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = v7;
      }
      uint64_t v24 = v23 - 1;
      if (!*(unsigned char *)(a1 + 16)) {
        return v24;
      }
    }
  }
  return v7;
}

void sub_1C47B4B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t PKInputBaseFilter<PKInputPoint,PKInputPoint>::reset(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 32))(result);
  }
  *(unsigned char *)(a1 + 16) = 0;
  return result;
}

float64x2_t PKPointReductionFilter::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  PKInputBaseFilter<PKInputPoint,PKInputPoint>::drawingBeganWithInk(a1, a2, a3, a4);
  *(void *)(a1 + 104) = a3;
  *(void *)(a1 + 112) = 0;
  float64x2_t v6 = vmulq_n_f64((float64x2_t)xmmword_1C482BB10, *(double *)(a1 + 24));
  float64x2_t result = vmulq_f64(v6, v6);
  *(float64x2_t *)(a1 + 12_Block_object_dispose(&STACK[0x260], 8) = result;
  return result;
}

void *PKPointReductionFilter::reset(PKPointReductionFilter *this)
{
  float64x2_t result = PKInputFilter<PKInputPoint,PKInputPoint>::reset((uint64_t)this);
  *((void *)this + 15) = 0;
  *((unsigned char *)this + 192) = 0;
  return result;
}

uint64_t PKPointReductionFilter::fetchInput(PKPointReductionFilter *this)
{
  long long v2 = (char *)this + 48;
  std::vector<PKInputPoint>::resize((uint64_t)this + 48, *((void *)this + 4) - *((void *)this + 15));
  *((void *)this + 4) = (*(uint64_t (**)(void, void, char *))(**((void **)this + 1) + 24))(*((void *)this + 1), *((void *)this + 4), v2);
  double v3 = *(uint64_t (**)(PKPointReductionFilter *))(*(void *)this + 56);

  return v3(this);
}

void PKPointReductionFilter::run(PKPointReductionFilter *this)
{
  uint64_t v1 = (double *)*((void *)this + 6);
  long long v2 = (double *)*((void *)this + 7);
  if (v2 != v1 && !*((unsigned char *)this + 192))
  {
    uint64_t v5 = *((void *)this + 14);
    uint64_t v4 = *((void *)this + 15);
    uint64_t v6 = *((void *)this + 4) - v4 - 20;
    uint64_t v7 = v5 + 1;
    if (v5 + 1 < v6)
    {
      uint64_t v8 = &v1[16 * v5];
      double v9 = *v8;
      double v10 = v8[1];
      uint64_t v11 = *((void *)this + 14);
      do
      {
        uint64_t v12 = &v1[16 * v7];
        BOOL v13 = (v12[1] - v10) * (v12[1] - v10) + (*v12 - v9) * (*v12 - v9) <= *((double *)this + 16) && v7 < v6 - 1;
        if (!v13)
        {
          uint64_t v14 = v11 - v5;
          if (v11 <= v5)
          {
            uint64_t v5 = v7;
          }
          else
          {
            float64x2_t v15 = &v1[16 * v5];
            double v17 = v15[2];
            uint64_t v16 = v15 + 2;
            double v18 = v17;
            int v19 = *((unsigned __int8 *)v16 + 80);
            float64x2_t v20 = v16 + 16;
            do
            {
              if (v18 < *v20) {
                double v18 = *v20;
              }
              *uint64_t v16 = v18;
              if (v19 && !*((unsigned char *)v20 + 80))
              {
                int v19 = 0;
                v16[2] = v20[2];
                *((unsigned char *)v16 + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
              }
              v20 += 16;
              --v11;
            }
            while (v5 != v11);
            uint64_t v21 = (uint64_t)&v1[16 * v5 + 16];
            if ((double *)v21 != v12)
            {
              int64_t v22 = (char *)v2 - (char *)v12;
              if (v2 != v12)
              {
                memmove(&v1[16 * v5 + 16], v12, (char *)v2 - (char *)v12);
                uint64_t v4 = *((void *)this + 15);
                uint64_t v1 = (double *)*((void *)this + 6);
              }
              long long v2 = (double *)(v21 + v22);
              *((void *)this + 7) = v21 + v22;
            }
            v4 += v14;
            *((void *)this + 15) = v4;
            v6 -= v14;
            uint64_t v7 = v5;
          }
          uint64_t v23 = &v1[16 * v5];
          double v9 = *v23;
          double v10 = v23[1];
        }
        uint64_t v11 = v7++;
      }
      while (v7 < v6);
    }
    v168 = (void **)((char *)this + 80);
    std::vector<PKInputPoint>::resize((uint64_t)this + 80, *((void *)this + 9));
    uint64_t v24 = (void *)*((void *)this + 18);
    if (*((void **)this + 19) != v24) {
      *((void *)this + 19) = v24;
    }
    unint64_t v25 = *((void *)this + 20);
    if ((unint64_t)v24 >= v25)
    {
      uint64_t v27 = v25 - (void)v24;
      uint64_t v28 = v27 >> 3;
      if ((unint64_t)(v27 >> 3) <= 1) {
        uint64_t v28 = 1;
      }
      if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v29 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v29 = v28;
      }
      CGPoint v30 = std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessElement>>(v29);
      uint64_t v31 = (char *)*((void *)this + 18);
      double v32 = (char *)*((void *)this + 19);
      double v34 = &v30[2 * v33];
      *CGPoint v30 = -1;
      v30[1] = 0;
      unint64_t v26 = (double *)(v30 + 2);
      if (v32 != v31)
      {
        do
        {
          *((_OWORD *)v30 - 1) = *((_OWORD *)v32 - 1);
          v30 -= 2;
          v32 -= 16;
        }
        while (v32 != v31);
        uint64_t v31 = (char *)*((void *)this + 18);
      }
      *((void *)this + 1_Block_object_dispose(&STACK[0x260], 8) = v30;
      *((void *)this + 19) = v26;
      *((void *)this + 2std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v34;
      if (v31) {
        operator delete(v31);
      }
    }
    else
    {
      *uint64_t v24 = -1;
      v24[1] = 0;
      unint64_t v26 = (double *)(v24 + 2);
    }
    *((void *)this + 19) = v26;
    unint64_t v35 = *((void *)this + 14);
    unint64_t v36 = v35 + 1;
    uint64_t v37 = *((void *)this + 6);
    if (v35 + 1 < (*((void *)this + 7) - v37) >> 7)
    {
      uint64_t v38 = (v35 << 7) + 136;
      do
      {
        int64_t v39 = v35;
        unint64_t v35 = v36;
        int64_t v40 = *((void *)this + 14);
        if (v39 >= v40)
        {
          uint64_t v43 = 0;
          int64_t v44 = v39 - 49;
          double v45 = (double *)(v37 + (v35 << 7));
          double v46 = *v45;
          double v47 = v45[1];
          unint64_t v48 = (double *)(v37 + v38);
          double v41 = 1.79769313e308;
          int64_t v42 = *((void *)this + 14);
          do
          {
            double v49 = *(double *)(*((void *)this + 18) + 16 * (v39 - v40) + 8);
            if (v49 < 1.79769313e308)
            {
              int v50 = (double *)(v37 + (v39 << 7));
              double v51 = *v50;
              double v52 = v50[1];
              double v53 = v46 - *v50;
              double v54 = v47 - v52;
              double v55 = v54 * v54 + v53 * v53;
              if (v55 >= *((double *)this + 16))
              {
                double v56 = 0.0;
                if (v39 + 1 < v35)
                {
                  uint64_t v57 = v48;
                  uint64_t v58 = v43;
                  do
                  {
                    double v59 = *(v57 - 1);
                    double v60 = (v54 * (*v57 - v52) + (v59 - v51) * v53) / v55;
                    double v61 = 0.0;
                    if (v60 >= 0.0)
                    {
                      double v61 = (v54 * (*v57 - v52) + (v59 - v51) * v53) / v55;
                      if (v60 > 1.0) {
                        double v61 = 1.0;
                      }
                    }
                    double v56 = v56
                        + (v47 * v61 + v52 * (1.0 - v61) - *v57) * (v47 * v61 + v52 * (1.0 - v61) - *v57)
                        + (v46 * v61 + v51 * (1.0 - v61) - v59) * (v46 * v61 + v51 * (1.0 - v61) - v59);
                    v57 += 16;
                    --v58;
                  }
                  while (v58);
                }
                double v62 = v56 + v49;
                if (v62 < v41)
                {
                  int64_t v42 = v39;
                  double v41 = v62;
                }
                if (v39 < v44 || v55 > *((double *)this + 17)) {
                  break;
                }
              }
            }
            ++v43;
            v48 -= 16;
            BOOL v13 = v39-- <= v40;
          }
          while (!v13);
        }
        else
        {
          double v41 = 1.79769313e308;
          int64_t v42 = *((void *)this + 14);
        }
        unint64_t v63 = *((void *)this + 20);
        if ((unint64_t)v26 >= v63)
        {
          unsigned int v64 = (double *)*((void *)this + 18);
          uint64_t v65 = ((char *)v26 - (char *)v64) >> 4;
          unint64_t v66 = v65 + 1;
          if ((unint64_t)(v65 + 1) >> 60) {
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v67 = v63 - (void)v64;
          if (v67 >> 3 > v66) {
            unint64_t v66 = v67 >> 3;
          }
          if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v68 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v68 = v66;
          }
          if (v68)
          {
            unint64_t v68 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessElement>>(v68);
            unsigned int v64 = (double *)*((void *)this + 18);
            unint64_t v26 = (double *)*((void *)this + 19);
          }
          else
          {
            uint64_t v69 = 0;
          }
          unint64_t v70 = v68 + 16 * v65;
          *(void *)unint64_t v70 = v42;
          *(double *)(v70 + _Block_object_dispose(&STACK[0x260], 8) = v41;
          unint64_t v71 = v70;
          if (v26 != v64)
          {
            do
            {
              *(_OWORD *)(v71 - 16) = *((_OWORD *)v26 - 1);
              v71 -= 16;
              v26 -= 2;
            }
            while (v26 != v64);
            unsigned int v64 = (double *)*((void *)this + 18);
          }
          unint64_t v26 = (double *)(v70 + 16);
          *((void *)this + 1_Block_object_dispose(&STACK[0x260], 8) = v71;
          *((void *)this + 19) = v70 + 16;
          *((void *)this + 2std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v68 + 16 * v69;
          if (v64) {
            operator delete(v64);
          }
        }
        else
        {
          *(void *)unint64_t v26 = v42;
          v26[1] = v41;
          v26 += 2;
        }
        *((void *)this + 19) = v26;
        unint64_t v36 = v35 + 1;
        uint64_t v37 = *((void *)this + 6);
        v38 += 128;
      }
      while (v35 + 1 < (*((void *)this + 7) - v37) >> 7);
    }
    char v72 = (void **)((char *)this + 168);
    std::vector<long>::resize((uint64_t)this + 168, 0);
    uint64_t v73 = *((void *)this + 14);
    uint64_t v74 = v73 + ((uint64_t)(*((void *)this + 19) - *((void *)this + 18)) >> 4) - 1;
    if (v74 > v73)
    {
      char v75 = (void *)((char *)this + 184);
      char v76 = (uint64_t *)*((void *)this + 22);
      do
      {
        if ((unint64_t)v76 >= *v75)
        {
          unint64_t v78 = (uint64_t *)*v72;
          uint64_t v79 = ((char *)v76 - (unsigned char *)*v72) >> 3;
          unint64_t v80 = v79 + 1;
          if ((unint64_t)(v79 + 1) >> 61) {
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v81 = *v75 - (void)v78;
          if (v81 >> 2 > v80) {
            unint64_t v80 = v81 >> 2;
          }
          if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v82 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v82 = v80;
          }
          if (v82)
          {
            char v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)this + 184, v82);
            unint64_t v78 = (uint64_t *)*((void *)this + 21);
            char v76 = (uint64_t *)*((void *)this + 22);
          }
          else
          {
            char v83 = 0;
          }
          char v84 = (uint64_t *)&v83[8 * v79];
          *char v84 = v74;
          unsigned int v77 = v84 + 1;
          while (v76 != v78)
          {
            uint64_t v85 = *--v76;
            *--char v84 = v85;
          }
          *((void *)this + 21) = v84;
          *((void *)this + 22) = v77;
          *((void *)this + 23) = &v83[8 * v82];
          if (v78) {
            operator delete(v78);
          }
        }
        else
        {
          *char v76 = v74;
          unsigned int v77 = v76 + 1;
        }
        *((void *)this + 22) = v77;
        uint64_t v73 = *((void *)this + 14);
        uint64_t v74 = *(void *)(*((void *)this + 18) + 16 * (v74 - v73));
        char v76 = v77;
      }
      while (v74 > v73);
    }
    unint64_t v86 = (float64x2_t *)*((void *)this + 10);
    char v87 = (char *)*((void *)this + 11);
    uint64_t v88 = v87 - (char *)v86;
    if (v87 == (char *)v86)
    {
      unint64_t v89 = *((void *)this + 12);
      long long v90 = (long long *)*((void *)this + 6);
      if ((unint64_t)v87 >= v89)
      {
        uint64_t v97 = v88 >> 7;
        uint64_t v98 = v89 - (void)v86;
        if (v98 >> 6 <= (unint64_t)((v88 >> 7) + 1)) {
          uint64_t v99 = v97 + 1;
        }
        else {
          uint64_t v99 = v98 >> 6;
        }
        if ((unint64_t)v98 >= 0x7FFFFFFFFFFFFF80) {
          unint64_t v100 = 0x1FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v100 = v99;
        }
        long long v101 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)this + 96, v100);
        v102 = &v101[128 * v97];
        CGAffineTransform v104 = &v101[128 * v103];
        long long v105 = *v90;
        long long v106 = v90[1];
        long long v107 = v90[3];
        *((_OWORD *)v102 + 2) = v90[2];
        *((_OWORD *)v102 + 3) = v107;
        *(_OWORD *)v102 = v105;
        *((_OWORD *)v102 + 1) = v106;
        long long v108 = v90[4];
        long long v109 = v90[5];
        long long v110 = v90[7];
        *((_OWORD *)v102 + 6) = v90[6];
        *((_OWORD *)v102 + 7) = v110;
        *((_OWORD *)v102 + 4) = v108;
        *((_OWORD *)v102 + 5) = v109;
        char v87 = v102 + 128;
        v112 = (char *)*((void *)this + 10);
        CGRect v111 = (char *)*((void *)this + 11);
        if (v111 != v112)
        {
          do
          {
            long long v113 = *((_OWORD *)v111 - 8);
            long long v114 = *((_OWORD *)v111 - 7);
            long long v115 = *((_OWORD *)v111 - 5);
            *((_OWORD *)v102 - 6) = *((_OWORD *)v111 - 6);
            *((_OWORD *)v102 - 5) = v115;
            *((_OWORD *)v102 - _Block_object_dispose(&STACK[0x260], 8) = v113;
            *((_OWORD *)v102 - 7) = v114;
            long long v116 = *((_OWORD *)v111 - 4);
            long long v117 = *((_OWORD *)v111 - 3);
            long long v118 = *((_OWORD *)v111 - 1);
            *((_OWORD *)v102 - 2) = *((_OWORD *)v111 - 2);
            *((_OWORD *)v102 - 1) = v118;
            *((_OWORD *)v102 - 4) = v116;
            *((_OWORD *)v102 - 3) = v117;
            v102 -= 128;
            v111 -= 128;
          }
          while (v111 != v112);
          CGRect v111 = (char *)*v168;
        }
        *((void *)this + 1std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v102;
        *((void *)this + 11) = v87;
        *((void *)this + 12) = v104;
        if (v111) {
          operator delete(v111);
        }
      }
      else
      {
        long long v91 = *v90;
        long long v92 = v90[1];
        long long v93 = v90[3];
        *((_OWORD *)v87 + 2) = v90[2];
        *((_OWORD *)v87 + 3) = v93;
        *(_OWORD *)char v87 = v91;
        *((_OWORD *)v87 + 1) = v92;
        long long v94 = v90[4];
        long long v95 = v90[5];
        long long v96 = v90[7];
        *((_OWORD *)v87 + 6) = v90[6];
        *((_OWORD *)v87 + 7) = v96;
        *((_OWORD *)v87 + 4) = v94;
        *((_OWORD *)v87 + 5) = v95;
        v87 += 128;
      }
      *((void *)this + 11) = v87;
      uint64_t v73 = *((void *)this + 14);
      unint64_t v86 = (float64x2_t *)*((void *)this + 10);
    }
    v119 = (unsigned char *)*((void *)this + 21);
    v120 = (char *)*((void *)this + 22);
    BOOL v121 = v87 - (char *)v86 == 128 && v120 - v119 == 8;
    if (v121
      && (uint64_t v122 = *((void *)this + 7),
          int32x2_t v123 = vmovn_s64(vcgtq_f64((float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL), vabdq_f64(*v86, *(float64x2_t *)(v122 - 128)))), (v123.i32[0] & v123.i32[1] & 1) != 0))
    {
      uint64_t v124 = *((void *)this + 6);
      if (v122 - v124 >= 129)
      {
        unint64_t v125 = (unint64_t)(v122 - v124) >> 7;
        double v126 = *((double *)v87 - 14);
        int v127 = *(v87 - 32);
        if (v125 <= 2) {
          unint64_t v125 = 2;
        }
        unint64_t v128 = v125 - 1;
        uint64_t v129 = v124 + 144;
        do
        {
          if (v126 < *(double *)v129) {
            double v126 = *(double *)v129;
          }
          *((double *)v87 - 14) = v126;
          if (v127 && !*(unsigned char *)(v129 + 80))
          {
            int v127 = 0;
            *((void *)v87 - 12) = *(void *)(v129 + 16);
            *(v87 - 32) = 0;
          }
          v129 += 128;
          --v128;
        }
        while (v128);
      }
    }
    else
    {
      if (v120 == v119)
      {
        uint64_t v130 = 0;
        uint64_t v131 = -1;
      }
      else
      {
        uint64_t v130 = 0;
        uint64_t v131 = -1;
        do
        {
          uint64_t v133 = *((void *)v120 - 1);
          v120 -= 8;
          uint64_t v132 = v133;
          uint64_t v134 = (v87 - (char *)v86) >> 7;
          if (v133 < *((void *)this + 4) - *((void *)this + 15) && v134 > *((void *)this + 9) + 5)
          {
            uint64_t v130 = v132;
            uint64_t v131 = (v87 - (char *)v86) >> 7;
          }
          v135 = (long long *)(*((void *)this + 6) + (v132 << 7));
          unint64_t v136 = *((void *)this + 12);
          if ((unint64_t)v87 >= v136)
          {
            if ((unint64_t)(v134 + 1) >> 57) {
              std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v143 = v136 - (void)v86;
            uint64_t v144 = v143 >> 6;
            if (v143 >> 6 <= (unint64_t)(v134 + 1)) {
              uint64_t v144 = v134 + 1;
            }
            if ((unint64_t)v143 >= 0x7FFFFFFFFFFFFF80) {
              unint64_t v145 = 0x1FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v145 = v144;
            }
            if (v145) {
              v146 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)this + 96, v145);
            }
            else {
              v146 = 0;
            }
            v147 = &v146[128 * v134];
            long long v148 = *v135;
            long long v149 = v135[1];
            long long v150 = v135[3];
            *((_OWORD *)v147 + 2) = v135[2];
            *((_OWORD *)v147 + 3) = v150;
            *(_OWORD *)v147 = v148;
            *((_OWORD *)v147 + 1) = v149;
            long long v151 = v135[4];
            long long v152 = v135[5];
            long long v153 = v135[7];
            *((_OWORD *)v147 + 6) = v135[6];
            *((_OWORD *)v147 + 7) = v153;
            *((_OWORD *)v147 + 4) = v151;
            *((_OWORD *)v147 + 5) = v152;
            v155 = (char *)*((void *)this + 10);
            v154 = (char *)*((void *)this + 11);
            v156 = v147;
            if (v154 != v155)
            {
              do
              {
                long long v157 = *((_OWORD *)v154 - 8);
                long long v158 = *((_OWORD *)v154 - 7);
                long long v159 = *((_OWORD *)v154 - 5);
                *((_OWORD *)v156 - 6) = *((_OWORD *)v154 - 6);
                *((_OWORD *)v156 - 5) = v159;
                *((_OWORD *)v156 - _Block_object_dispose(&STACK[0x260], 8) = v157;
                *((_OWORD *)v156 - 7) = v158;
                long long v160 = *((_OWORD *)v154 - 4);
                long long v161 = *((_OWORD *)v154 - 3);
                long long v162 = *((_OWORD *)v154 - 1);
                *((_OWORD *)v156 - 2) = *((_OWORD *)v154 - 2);
                *((_OWORD *)v156 - 1) = v162;
                *((_OWORD *)v156 - 4) = v160;
                *((_OWORD *)v156 - 3) = v161;
                v156 -= 128;
                v154 -= 128;
              }
              while (v154 != v155);
              v154 = (char *)*v168;
            }
            char v87 = v147 + 128;
            *((void *)this + 1std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v156;
            *((void *)this + 11) = v147 + 128;
            *((void *)this + 12) = &v146[128 * v145];
            if (v154) {
              operator delete(v154);
            }
          }
          else
          {
            long long v137 = *v135;
            long long v138 = v135[1];
            long long v139 = v135[3];
            *((_OWORD *)v87 + 2) = v135[2];
            *((_OWORD *)v87 + 3) = v139;
            *(_OWORD *)char v87 = v137;
            *((_OWORD *)v87 + 1) = v138;
            long long v140 = v135[4];
            long long v141 = v135[5];
            long long v142 = v135[7];
            *((_OWORD *)v87 + 6) = v135[6];
            *((_OWORD *)v87 + 7) = v142;
            *((_OWORD *)v87 + 4) = v140;
            *((_OWORD *)v87 + 5) = v141;
            v87 += 128;
          }
          *((void *)this + 11) = v87;
          unint64_t v86 = (float64x2_t *)*((void *)this + 10);
          v163 = &v86[8 * v134];
          *((double *)v87 - 5) = sqrt((v163[-8].f64[1] - *((double *)v87 - 15)) * (v163[-8].f64[1] - *((double *)v87 - 15))+ (v163[-8].f64[0] - *((double *)v87 - 16)) * (v163[-8].f64[0] - *((double *)v87 - 16)));
          if (v73 + 1 < v132)
          {
            double v164 = *((double *)v87 - 14);
            int v165 = *(v87 - 32);
            uint64_t v166 = ~v73 + v132;
            uint64_t v167 = *((void *)this + 6) + (v73 << 7) + 144;
            do
            {
              if (v164 < *(double *)v167) {
                double v164 = *(double *)v167;
              }
              *((double *)v87 - 14) = v164;
              if (v165 && !*(unsigned char *)(v167 + 80))
              {
                int v165 = 0;
                *((void *)v87 - 12) = *(void *)(v167 + 16);
                *(v87 - 32) = 0;
              }
              v167 += 128;
              --v166;
            }
            while (v166);
          }
          uint64_t v73 = v132;
        }
        while (v120 != *v72);
      }
      if (*((void *)this + 4) == (uint64_t)(*((void *)this + 7) - *((void *)this + 6)) >> 7
        && *((unsigned char *)this + 16))
      {
        *((void *)this + 9) = (uint64_t)&v87[-*((void *)this + 10)] >> 7;
        *((unsigned char *)this + 192) = 1;
      }
      else if (v131 >= 1)
      {
        *((void *)this + 9) = v131 + 1;
        *((void *)this + 14) = v130;
      }
    }
  }
}

uint64_t PKInputBufferedFilter<PKInputPoint,PKInputPoint>::reset(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 32))(result);
  }
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 56) = *(void *)(a1 + 48);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return result;
}

void PKEstimatedAltitudeAndAzimuthFilter::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v14 = a2;
  PKInputBaseFilter<PKInputPoint,PKInputPoint>::drawingBeganWithInk(a1, v14, a3, a4);
  *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = -1;
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x260], 8) = -1;
  *(void *)(a1 + 32) = -1;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(a1 + 56) = _Q0;
  *(_OWORD *)(a1 + 72) = _Q0;
  *(void *)(a1 + 8_Block_object_dispose(&STACK[0x260], 8) = a3;
  uint64_t v12 = [v14 behavior];
  if (v12) {
    BOOL v13 = v12[8] != 0;
  }
  else {
    BOOL v13 = 0;
  }
  *(unsigned char *)(a1 + 96) = v13;
}

void sub_1C47B5738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t PKEstimatedAltitudeAndAzimuthFilter::copyUpdatedRangeFromIndex(uint64_t a1, unint64_t a2, double **a3)
{
  uint64_t v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8));
  if (*(void *)(a1 + 88) != 1 || !*(unsigned char *)(a1 + 96)) {
    return v6;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
  if (([WeakRetained isSnappedToRuler] & 1) != 0 || a3[1] == *a3)
  {

    return v6;
  }
  int v8 = *((unsigned __int8 *)*a3 + 96);

  if (!v8) {
    return v6;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9 != -1) {
    goto LABEL_7;
  }
  int v19 = *a3;
  uint64_t v20 = (char *)a3[1] - (char *)*a3;
  unint64_t v21 = v20 >> 7;
  unint64_t v22 = (v20 >> 7) - 1;
  if (v22 > a2)
  {
    uint64_t v23 = &v19[16 * a2 + 12];
    uint64_t v9 = a2;
    while (*(unsigned char *)v23)
    {
      ++v9;
      v23 += 16;
      if (v22 == v9) {
        goto LABEL_35;
      }
    }
    *(void *)(a1 + 32) = v9;
    *(int8x16_t *)(a1 + 72) = vextq_s8(*(int8x16_t *)(v23 - 9), *(int8x16_t *)(v23 - 9), 8uLL);
    if (v9 != -1)
    {
LABEL_7:
      if (v9 > a2)
      {
        if (v9 < 1)
        {
          double v13 = 0.0;
        }
        else
        {
          double v12 = **a3;
          double v11 = (*a3)[1];
          uint64_t v10 = (uint64_t)(*a3 + 16);
          double v13 = 0.0;
          uint64_t v14 = v9;
          do
          {
            double v15 = *(double *)v10;
            double v16 = *(double *)(v10 + 8);
            double v17 = sqrt((v16 - v11) * (v16 - v11) + (*(double *)v10 - v12) * (*(double *)v10 - v12));
            *(double *)(v10 + 8_Block_object_dispose(&STACK[0x260], 8) = v17;
            double v13 = v13 + v17;
            v10 += 128;
            double v11 = v16;
            double v12 = v15;
            --v14;
          }
          while (v14);
        }
        if (v13 >= *(double *)(a1 + 112))
        {
          uint64_t v28 = *(void *)(a1 + 40);
          unint64_t v29 = *a3;
          if (v28 == -1)
          {
            *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v28;
            *(int8x16_t *)(a1 + 56) = vextq_s8(*(int8x16_t *)&v29[16 * v28 + 3], *(int8x16_t *)&v29[16 * v28 + 3], 8uLL);
          }
          if (v28 + 1 < v9)
          {
            uint64_t v30 = ~v28 + v9;
            uint64_t v31 = &v29[16 * v28 + 27];
            double v32 = 0.0;
            do
            {
              double v33 = *v31;
              v31 += 16;
              double v32 = v32 + v33;
              --v30;
            }
            while (v30);
            float64x2_t v34 = *(float64x2_t *)(a1 + 56);
            float64x2_t v35 = *(float64x2_t *)(a1 + 72);
            uint64_t v36 = ~v28 + v9;
            uint64_t v37 = &v29[16 * v28 + 27];
            double v38 = 0.0;
            do
            {
              double v38 = v38 + *v37;
              int8x16_t v39 = (int8x16_t)vmlaq_n_f64(vmulq_n_f64(v35, v38 / v32), v34, 1.0 - v38 / v32);
              *((int8x16_t *)v37 - 4) = vextq_s8(v39, v39, 8uLL);
              v37 += 16;
              --v36;
            }
            while (v36);
          }
          uint64_t v27 = (char *)a3[1] - (char *)v29;
        }
        else
        {
          uint64_t v24 = *a3;
          unint64_t v25 = v9 - a2;
          if (v9 > (uint64_t)a2)
          {
            unint64_t v26 = &v24[16 * a2 + 3];
            do
            {
              *(_OWORD *)unint64_t v26 = *(_OWORD *)&v24[16 * v9 + 3];
              v26 += 16;
              --v25;
            }
            while (v25);
          }
          uint64_t v27 = (char *)a3[1] - (char *)v24;
        }
        uint64_t v40 = v27 >> 7;
        goto LABEL_41;
      }
      return v6;
    }
  }
LABEL_35:
  if (v21 <= *(int *)(a1 + 104)) {
    return 0;
  }
  uint64_t v41 = *(void *)(a1 + 48);
  if (v41 != -1)
  {
    if (v41 <= v42) {
      uint64_t v40 = v42;
    }
    else {
      uint64_t v40 = v41;
    }
    *(void *)(a1 + 4_Block_object_dispose(&STACK[0x260], 8) = v40;
LABEL_41:
    if (v40 >= v6) {
      return v6;
    }
    else {
      return v40;
    }
  }
  double v43 = 0.0;
  if ((unint64_t)v20 >= 0x81)
  {
    if (v21 <= 2) {
      unint64_t v21 = 2;
    }
    double v46 = *v19;
    double v45 = v19[1];
    int64_t v44 = v19 + 17;
    unint64_t v47 = v21 - 1;
    do
    {
      double v48 = *(v44 - 1);
      double v49 = *v44;
      double v43 = v43 + sqrt((*v44 - v45) * (*v44 - v45) + (v48 - v46) * (v48 - v46));
      v44 += 16;
      double v45 = v49;
      double v46 = v48;
      --v47;
    }
    while (v47);
  }
  if (v43 <= *(double *)(a1 + 112) * 1.25) {
    return 0;
  }
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x260], 8) = result;
  if (result >= v6) {
    return v6;
  }
  return result;
}

void sub_1C47B5A98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::backtrack(void *a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v4 = (a2 << 7) | 8;
  double v5 = 0.0;
  do
  {
    uint64_t v6 = -1;
    if (a2 < 1) {
      break;
    }
    if (a2 < a3) {
      break;
    }
    uint64_t v6 = a2 - 1;
    if (a2 == 1) {
      break;
    }
    uint64_t v7 = (double *)(*a1 + v4);
    v4 -= 128;
    double v5 = v5 + sqrt((*v7 - *(v7 - 16)) * (*v7 - *(v7 - 16)) + (*(v7 - 1) - *(v7 - 17)) * (*(v7 - 1) - *(v7 - 17)));
  }
  while (v5 <= a4 && a3 + 1 != a2--);
  return v6;
}

void PKStartHookFilter::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = a3 == 0;
}

uint64_t PKStartHookFilter::copyUpdatedRangeFromIndex(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8), *(void *)(a1 + 32) + a2);
  if (!*(unsigned char *)(a1 + 40)) {
    return (v5 - *(void *)(a1 + 32)) & ~((v5 - *(void *)(a1 + 32)) >> 63);
  }
  uint64_t v6 = *(double **)a3;
  uint64_t v7 = *(char **)(a3 + 8);
  uint64_t v8 = (uint64_t)&v7[-*(void *)a3];
  if ((unint64_t)v8 >= 0x180)
  {
    uint64_t v9 = 2;
    if ((unint64_t)(v8 >> 7) > 2) {
      uint64_t v9 = v8 >> 7;
    }
    double v10 = 0.0;
    int v11 = -1;
    uint64_t v12 = 1;
    uint64_t v13 = 27;
    do
    {
      double v10 = v10 + v6[v13];
      double v14 = v10 / *(double *)(a1 + 24);
      BOOL v15 = v11 != -1 || v14 <= 6.0;
      if (!v15) {
        int v11 = v12;
      }
      ++v12;
      v13 += 16;
    }
    while (v9 != v12);
    if (v14 >= 24.0 && v11 != -1 && (v8 >> 7) - 2 > (unint64_t)v11)
    {
      uint64_t v17 = v11;
      *(unsigned char *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
      if (v6[16 * (uint64_t)v11 + 8] - v6[8] <= 0.1)
      {
        uint64_t v18 = (uint64_t)v11 << 7;
        while (1)
        {
          BOOL v15 = v17-- < 1;
          if (v15) {
            break;
          }
          double v19 = *(double *)((char *)v6 + v18);
          double v20 = *(double *)((char *)v6 + v18 + 8);
          double v21 = *(double *)((char *)v6 + v18 - 128) - v19;
          double v22 = *(double *)((char *)v6 + v18 - 120) - v20;
          double v23 = (v22 * (*(double *)((char *)v6 + v18 + 136) - v20) + v21 * (*(double *)((char *)v6 + v18 + 128) - v19))
              / (sqrt(v22 * v22 + v21 * v21)
               * sqrt((*(double *)((char *)v6 + v18 + 136) - v20) * (*(double *)((char *)v6 + v18 + 136) - v20)+ (*(double *)((char *)v6 + v18 + 128) - v19) * (*(double *)((char *)v6 + v18 + 128) - v19)));
          if (v23 < -1.0) {
            double v23 = -1.0;
          }
          if (v23 > 1.0) {
            double v23 = 1.0;
          }
          v18 -= 128;
          if (acos(v23) * 57.2957795 < 150.0)
          {
            *(void *)(a1 + 32) = v17 + 1;
            uint64_t v24 = (char *)v6 + v18 + 128;
            if (v24 != v7) {
              memmove(v6, v24, v8 - v18 - 128);
            }
            *(void *)(a3 + _Block_object_dispose(&STACK[0x260], 8) = (char *)v6 + v8 - v18 - 128;
            return 0;
          }
        }
      }
    }
  }
  return 0;
}

uint64_t PKStartHookFilter::reset(PKStartHookFilter *this)
{
  uint64_t result = *((void *)this + 1);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 32))(result);
  }
  *((unsigned char *)this + 16) = 0;
  *((unsigned char *)this + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  *((void *)this + 4) = 0;
  return result;
}

void PKEndHookFilter::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  *(void *)(a1 + 32) = 0x7FFFFFFFFFFFFFFFLL;
  *(unsigned char *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = a3 == 0;
}

int64_t PKEndHookFilter::copyUpdatedRangeFromIndex(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = a2 - ((a3[1] - *a3) >> 7);
  uint64_t v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8));
  int64_t v7 = v6;
  if (!*(unsigned char *)(a1 + 40))
  {
    int64_t v20 = *(void *)(a1 + 32);
    if (v20 > v5 && v20 < (unint64_t)(v5 + ((a3[1] - *a3) >> 7)))
    {
      std::vector<PKInputPoint>::resize((uint64_t)a3, v20 - v5);
      int64_t v20 = *(void *)(a1 + 32);
    }
LABEL_19:
    if (v7 >= v20) {
      return v20;
    }
    else {
      return v7;
    }
  }
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v8 = *a3;
    uint64_t v9 = a3[1];
    uint64_t v10 = v9 - *a3;
    unint64_t v11 = v10 >> 7;
    if ((unint64_t)v10 >= 0x180)
    {
      double v12 = *(double *)(a1 + 24);
      uint64_t v13 = v11 - 2;
      uint64_t v14 = 2;
      if (v11 > 2) {
        uint64_t v14 = v11;
      }
      uint64_t v15 = v14 - 2;
      double v16 = (double *)(v8 + 216);
      double v17 = 0.0;
      do
      {
        double v18 = *v16;
        v16 += 16;
        double v17 = v17 + v18;
      }
      while (v17 / v12 < 24.0 && v15-- != 0);
      if (v17 / v12 >= 24.0)
      {
        unint64_t v24 = v11 - 1;
        uint64_t v25 = 2;
        if (v13 < 2) {
          uint64_t v25 = v11 - 2;
        }
        unint64_t v26 = (double *)(v8 + (v11 << 7) - 40);
        double v27 = 0.0;
        while ((uint64_t)--v24 >= 3)
        {
          if (*(double *)(v8 + ((v11 - 1) << 7) + 64) - *(v26 - 19) > 0.1) {
            goto LABEL_13;
          }
          double v28 = *v26;
          v26 -= 16;
          double v27 = v27 + v28;
          if (v27 / v12 > 6.0) {
            goto LABEL_33;
          }
        }
        unint64_t v24 = v25;
        if (v25 < 1) {
          goto LABEL_13;
        }
LABEL_33:
        if (v24 <= v13) {
          unint64_t v29 = v11 - 2;
        }
        else {
          unint64_t v29 = v24;
        }
        uint64_t v30 = (double *)(v8 + (v24 << 7) + 8);
        while (v29 != v24)
        {
          ++v24;
          uint64_t v31 = v30 + 16;
          double v32 = *(v30 - 1);
          double v33 = v30[15] - v32;
          double v34 = v30[16] - *v30;
          double v35 = (v34 * (*(v30 - 16) - *v30) + v33 * (*(v30 - 17) - v32))
              / (sqrt(v34 * v34 + v33 * v33)
               * sqrt((*(v30 - 16) - *v30) * (*(v30 - 16) - *v30) + (*(v30 - 17) - v32) * (*(v30 - 17) - v32)));
          if (v35 < -1.0) {
            double v35 = -1.0;
          }
          if (v35 > 1.0) {
            double v35 = 1.0;
          }
          long double v36 = acos(v35);
          uint64_t v30 = v31;
          if (v36 * 57.2957795 < 150.0)
          {
            if (v11 != v24 && (uint64_t)(v11 - v24) >= 1)
            {
              unint64_t v37 = ~v24 + v11;
              if (v37 >= 7) {
                unint64_t v37 = 7;
              }
              uint64_t v38 = v9 - (v37 << 7) - 128;
              a3[1] = v38;
              unint64_t v11 = (v38 - v8) >> 7;
            }
            break;
          }
        }
      }
    }
LABEL_13:
    int64_t v20 = v11 + v5;
    *(void *)(a1 + 32) = v11 + v5;
    goto LABEL_19;
  }
  uint64_t v23 = 8;
  if (v6 > 8) {
    uint64_t v23 = v6;
  }
  return v23 - 8;
}

uint64_t PKEndHookFilter::reset(PKEndHookFilter *this)
{
  uint64_t result = *((void *)this + 1);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 32))(result);
  }
  *((unsigned char *)this + 16) = 0;
  *((unsigned char *)this + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  *((void *)this + 4) = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

void PKVelocityCalculationFilter::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v13 = a2;
  PKInputBaseFilter<PKInputPoint,PKInputPoint>::drawingBeganWithInk(a1, v13, a3, a4);
  int64_t v7 = [v13 behavior];
  uint64_t v8 = [v7 smoothingDescriptor];
  [v8 velocitySmoothing];
  *(void *)(a1 + 32) = v9;

  uint64_t v10 = [v13 behavior];
  unint64_t v11 = v10;
  if (v10) {
    char v12 = [v10 isEraser];
  }
  else {
    char v12 = 0;
  }
  *(unsigned char *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v12;
}

void sub_1C47B61A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

unint64_t PKVelocityCalculationFilter::copyUpdatedRangeFromIndex(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v7 = *a3;
  uint64_t v6 = a3[1];
  unint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8));
  uint64_t v10 = *a3;
  uint64_t v9 = a3[1];
  uint64_t v11 = v9 - *a3;
  if (v9 != *a3)
  {
    uint64_t v12 = (v6 - v7) >> 7;
    uint64_t v13 = v11 >> 7;
    if (v12 >= v11 >> 7)
    {
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v14 = 0;
      double v15 = *(double *)(a1 + 32);
      uint64_t v16 = v10 + (v12 << 7);
      double v17 = (double *)(v16 + 64);
      double v18 = (double *)(v16 + 192);
      uint64_t v19 = (v6 - v7) >> 7;
      do
      {
        double v20 = *(double *)(v10 + (v19 << 7) + 64);
        double v21 = v20 - v15;
        if (v19 < 0)
        {
          double v23 = 0.0;
        }
        else if (v19)
        {
          uint64_t v22 = 0;
          double v23 = 0.0;
          unint64_t v24 = v17;
          while (1)
          {
            double v25 = *(v24 - 16);
            double v26 = v24[3];
            if (v25 <= v21) {
              break;
            }
            double v23 = v23 + v26;
            ++v22;
            v24 -= 16;
            if (v19 == v22) {
              goto LABEL_12;
            }
          }
          double v23 = v23 + v26 * (*v24 - v21) / (*v24 - v25);
        }
        else
        {
          double v23 = 0.0;
LABEL_12:
          double v21 = *(double *)(v10 + 64);
        }
        if (v19 == v13 - 1)
        {
LABEL_18:
          double v27 = *(double *)(v10 + ((v13 - 1) << 7) + 64);
        }
        else
        {
          double v27 = v15 + v20;
          uint64_t v28 = v13 - 1;
          unint64_t v29 = v18;
          while (1)
          {
            double v30 = v29[3];
            if (*v29 >= v27) {
              break;
            }
            double v23 = v23 + v30;
            v29 += 16;
            if (v19 == --v28) {
              goto LABEL_18;
            }
          }
          double v23 = v23 + v30 * (v27 - *(v29 - 16)) / (*v29 - *(v29 - 16));
          uint64_t v14 = v19;
        }
        double v31 = v27 - v21;
        double v32 = 0.0;
        if (v31 > 0.0) {
          double v32 = v23 / v31 / *(double *)(a1 + 24);
        }
        *(double *)(v10 + (v19++ << 7) + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v32;
        v17 += 16;
        v18 += 16;
      }
      while (v19 != v13);
    }
    if (!*(unsigned char *)(a1 + 16) && !*(unsigned char *)(a1 + 40))
    {
      unint64_t v33 = v12 - a2 + v14;
      if (result >= v33) {
        return v33;
      }
    }
  }
  return result;
}

void PKDirectionAngleCalculationFilter::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v10 = a2;
  PKInputBaseFilter<PKInputPoint,PKInputPoint>::drawingBeganWithInk(a1, v10, a3, a4);
  uint64_t v7 = [v10 behavior];
  uint64_t v8 = [v7 smoothingDescriptor];
  [v8 angleSmoothing];
  *(void *)(a1 + 32) = v9;
}

void sub_1C47B6444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

unint64_t PKDirectionAngleCalculationFilter::copyUpdatedRangeFromIndex(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = *a3;
  uint64_t v5 = a3[1];
  unint64_t v7 = (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8));
  uint64_t v8 = a3[1];
  uint64_t v9 = v8 - *a3;
  if (v8 != *a3 && *(double *)(a1 + 32) > 0.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    char v11 = [WeakRetained isPreviewing];
    uint64_t v12 = (v5 - v6) >> 7;
    uint64_t v13 = v9 >> 7;

    if (v11)
    {
      uint64_t v14 = v13 - v12;
      if (v13 > v12)
      {
        double v15 = (void *)(*a3 + (v12 << 7) + 48);
        do
        {
          *double v15 = 0x3FF921FB54442D18;
          v15 += 16;
          --v14;
        }
        while (v14);
      }
    }
    else if (v13 > v12)
    {
      double v16 = *(double *)(a1 + 32);
      uint64_t v17 = *a3;
      double v18 = (double *)(*a3 + (v12 << 7) + 48);
      do
      {
        uint64_t v19 = a3[1];
        double v20 = PKPropertySmootherFilter::stepDistanceFrom<PKInputPoint,double PKPropertySmootherFilter::stepDistanceFrom<PKInputPoint>(double,double,std::vector<PKInputPoint> const&)::{lambda(double,double,double)#1}>(v17, v19, (double)v12, -v16);
        double v21 = PKPropertySmootherFilter::stepDistanceFrom<PKInputPoint,double PKPropertySmootherFilter::stepDistanceFrom<PKInputPoint>(double,double,std::vector<PKInputPoint> const&)::{lambda(double,double,double)#1}>(v17, v19, (double)v12, v16);
        *(void *)&double v22 = *(_OWORD *)&PKPropertySmootherFilter::propertyAt<PKInputPoint,CGPoint PKPropertySmootherFilter::locationAt<PKInputPoint>(double,std::vector<PKInputPoint> const&)::{lambda(PKInputPoint)#1},CGPoint>(v17, v19, v20);
        double v24 = v23;
        *(void *)&double v25 = *(_OWORD *)&PKPropertySmootherFilter::propertyAt<PKInputPoint,CGPoint PKPropertySmootherFilter::locationAt<PKInputPoint>(double,std::vector<PKInputPoint> const&)::{lambda(PKInputPoint)#1},CGPoint>(v17, v19, v21);
        double v27 = v26;
        if (v7 >= v12) {
          unint64_t v28 = v12;
        }
        else {
          unint64_t v28 = v7;
        }
        if (v21 >= (double)(v13 - 1)) {
          unint64_t v7 = v28;
        }
        double v29 = v22 - v25;
        double v30 = v24 - v27;
        if (v30 * v30 + v29 * v29 <= 0.1)
        {
          double v31 = -6.37045177;
          if (v12 >= 1) {
            double v31 = *(v18 - 16);
          }
        }
        else
        {
          double v31 = 3.14159265 - atan2(-v30, v29);
        }
        *double v18 = v31;
        v18 += 16;
        ++v12;
      }
      while (v13 != v12);
    }
  }
  return v7;
}

void sub_1C47B667C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double PKPropertySmootherFilter::stepDistanceFrom<PKInputPoint,double PKPropertySmootherFilter::stepDistanceFrom<PKInputPoint>(double,double,std::vector<PKInputPoint> const&)::{lambda(double,double,double)#1}>(uint64_t a1, uint64_t a2, double result, double a4)
{
  BOOL v4 = a4 >= 0.0;
  double v5 = -a4;
  if (a4 < 0.0)
  {
    BOOL v6 = result <= 0.0;
  }
  else
  {
    double v5 = a4;
    BOOL v6 = 0;
  }
  if (!v6 && v5 > 0.0)
  {
    while (1)
    {
      uint64_t v7 = (uint64_t)result;
      double v8 = result - (double)(uint64_t)result;
      if (a4 < 0.0 && v8 == 0.0)
      {
        BOOL v6 = v7-- < 1;
        if (v6) {
          return result;
        }
        double v8 = 1.0;
      }
      if (v7 + 1 >= (a2 - a1) >> 7) {
        break;
      }
      uint64_t v9 = (double *)(a1 + ((v7 + 1) << 7));
      double v10 = sqrt((*(double *)(a1 + (v7 << 7) + 8) - v9[1]) * (*(double *)(a1 + (v7 << 7) + 8) - v9[1])+ (*(double *)(a1 + (v7 << 7)) - *v9) * (*(double *)(a1 + (v7 << 7)) - *v9));
      if (a4 >= 0.0) {
        double v8 = 1.0 - v8;
      }
      double v11 = v8 * v10;
      if (v11 > v5)
      {
        if (a4 >= 0.0) {
          double v15 = v5;
        }
        else {
          double v15 = -v5;
        }
        return result + v15 / v10;
      }
      BOOL v12 = __OFADD__(v7, v4);
      uint64_t v13 = v7 + v4;
      unint64_t result = (double)v13;
      if ((v13 < 0) ^ v12 | (v13 == 0)) {
        BOOL v14 = a4 >= 0.0;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14)
      {
        double v5 = v5 - v11;
        if (v5 > 0.0) {
          continue;
        }
      }
      return result;
    }
  }
  return result;
}

float64x2_t PKPropertySmootherFilter::propertyAt<PKInputPoint,CGPoint PKPropertySmootherFilter::locationAt<PKInputPoint>(double,std::vector<PKInputPoint> const&)::{lambda(PKInputPoint)#1},CGPoint>(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3 = (uint64_t)a3;
  double v4 = a3 - (double)(uint64_t)a3;
  float64x2_t result = *(float64x2_t *)(a1 + ((uint64_t)a3 << 7));
  if (v4 > 0.0)
  {
    unint64_t v6 = v3 + 1;
    if (v6 < (a2 - a1) >> 7) {
      return vaddq_f64(result, vmulq_n_f64(vsubq_f64(*(float64x2_t *)(a1 + (v6 << 7)), result), v4));
    }
  }
  return result;
}

double PKAzimuthFilter::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  PKInputBaseFilter<PKInputPoint,PKInputPoint>::drawingBeganWithInk(a1, a2, a3, a4);
  *(void *)(a1 + 104) = a3;
  *(_WORD *)(a1 + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 8_Block_object_dispose(&STACK[0x260], 8) = xmmword_1C482BB20;
  return result;
}

double PKAzimuthFilter::reset(PKAzimuthFilter *this)
{
  uint64_t v2 = *((void *)this + 1);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
  }
  *((unsigned char *)this + 16) = 0;
  *((void *)this + 7) = *((void *)this + 6);
  *((void *)this + 9) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((unsigned char *)this + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8_Block_object_dispose(&STACK[0x260], 8) = xmmword_1C482BB20;
  return result;
}

uint64_t PKInputOneToOneFilter<PKInputPoint>::outputVector(uint64_t a1)
{
  return a1 + 48;
}

void PKAzimuthFilter::run(PKAzimuthFilter *this)
{
  if (*((void *)this + 7) - *((void *)this + 6) < 0x100uLL) {
    return;
  }
  uint64_t v3 = *((void *)this + 13);
  if (v3 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)this + 14);
    if ([WeakRetained activeInputProperties])
    {
      int v5 = 0;
      goto LABEL_7;
    }
  }
  id v4 = objc_loadWeakRetained((id *)this + 14);
  int v5 = [v4 isSnappedToRuler] ^ 1;

  if (v3 == 1) {
LABEL_7:
  }

  uint64_t v6 = *((void *)this + 11);
  if (!*((unsigned char *)this + 81))
  {
    double v8 = (double *)*((void *)this + 6);
    uint64_t v7 = *((void *)this + 7);
    double v9 = *(double *)(v7 - 128) - *v8;
    double v10 = *(double *)(v7 - 120) - v8[1];
    double v11 = sqrt(v10 * v10 + v9 * v9) / *((double *)this + 3);
    if (*((unsigned char *)this + 80))
    {
      int v12 = *((unsigned __int8 *)this + 16);
    }
    else
    {
      double v13 = atan2(-v9, v10);
      long double v14 = *((double *)this + 12);
      DKDDiffAngleInRadians(v14, v13);
      if (v15 < 0.0) {
        double v15 = -v15;
      }
      if (v15 > 1.57079633)
      {
        double v16 = v13 + 3.14159265;
        double v17 = fmod(v16, 6.28318531);
        if (v16 <= 6.28318531 && v16 >= 0.0) {
          double v17 = v16;
        }
        if (v17 < 0.0) {
          double v17 = v17 + 6.28318531;
        }
        if (v17 == 0.0) {
          double v13 = 0.0;
        }
        else {
          double v13 = v17;
        }
      }
      *((double *)this + 11) = v13;
      double v19 = 20.0;
      if (*((void *)this + 13) == 1) {
        double v19 = 7.0;
      }
      int v12 = *((unsigned __int8 *)this + 16);
      if (*((unsigned char *)this + 16) || v11 > v19)
      {
        *((unsigned char *)this + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 1;
      }
      else
      {
        double v20 = (v11 + -3.0) / (v19 + -3.0);
        double v21 = 0.0;
        if (v20 >= 0.0)
        {
          double v21 = v20;
          if (v20 > 1.0) {
            double v21 = 1.0;
          }
        }
        DKDMixAnglesInRadians(v14, v13, v21);
        uint64_t v6 = v22;
        int v12 = 0;
      }
    }
    char v23 = 1;
    if (!v12 && v11 <= 20.0) {
      goto LABEL_37;
    }
    *((unsigned char *)this + 81) = 1;
  }
  char v23 = 0;
LABEL_37:
  if (v5)
  {
    uint64_t v24 = *((void *)this + 9);
    uint64_t v25 = *((void *)this + 6);
    uint64_t v26 = (*((void *)this + 7) - v25) >> 7;
    BOOL v27 = v26 <= v24;
    uint64_t v28 = v26 - v24;
    if (!v27)
    {
      double v29 = (void *)(v25 + (v24 << 7) + 24);
      do
      {
        *double v29 = v6;
        v29 += 16;
        --v28;
      }
      while (v28);
    }
  }
  if ((v23 & 1) == 0) {
    *((void *)this + 9) = *((void *)this + 4);
  }
}

void sub_1C47B6AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void PKInputBaseFilter<PKInputPoint,_PKStrokePoint>::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v8 = a2;
  uint64_t v7 = *(void (****)(void, id, uint64_t, double))(a1 + 8);
  if (v7) {
    (**v7)(v7, v8, a3, a4);
  }
  *(double *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 16) = 0;
}

void sub_1C47B6B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t PKInputBaseFilter<PKInputPoint,_PKStrokePoint>::drawingEnded(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  *(unsigned char *)(a1 + 16) = 1;
  return result;
}

uint64_t PKInputBufferedFilter<PKInputPoint,_PKStrokePoint>::copyUpdatedRangeFromIndex(void *a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void *))(*a1 + 40))(a1);
  uint64_t v6 = (*(uint64_t (**)(void *))(*a1 + 48))(a1);
  std::vector<_PKStrokePoint>::__insert_with_size[abi:ne180100]<std::__wrap_iter<_PKStrokePoint*>,std::__wrap_iter<_PKStrokePoint*>>(a3, *(void *)(a3 + 8), (char *)(*(void *)v6 + 88 * a2), *(char **)(v6 + 8), 0x2E8BA2E8BA2E8BA3 * ((*(void *)(v6 + 8) - (*(void *)v6 + 88 * a2)) >> 3));
  return a1[9];
}

void *PKInputFilter<PKInputPoint,_PKStrokePoint>::reset(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
  }
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 56) = *(void *)(a1 + 48);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1);
  result[1] = *result;
  return result;
}

uint64_t PKInputBufferedFilter<PKInputPoint,_PKStrokePoint>::fetchInput(uint64_t a1)
{
  uint64_t v2 = a1 + 48;
  std::vector<PKInputPoint>::resize(a1 + 48, *(void *)(a1 + 32));
  *(void *)(a1 + 32) = (*(uint64_t (**)(void, void, uint64_t))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8), *(void *)(a1 + 32), v2);
  uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 56);

  return v3(a1);
}

uint64_t PKInputFilter<PKInputPoint,_PKStrokePoint>::outputVector(uint64_t a1)
{
  return a1 + 80;
}

void PKInputToOutputFilter::run(PKInputToOutputFilter *this)
{
  uint64_t v2 = (void *)((char *)this + 80);
  std::vector<_PKStrokePoint>::resize((uint64_t)this + 80, (uint64_t)(*((void *)this + 7) - *((void *)this + 6)) >> 7);
  uint64_t v3 = (uint64_t)(*((void *)this + 7) - *((void *)this + 6)) >> 7;
  uint64_t v4 = *((void *)this + 9);
  uint64_t v5 = v3 - v4;
  if (v3 > v4)
  {
    uint64_t v6 = 88 * v4;
    uint64_t v7 = v4 << 7;
    do
    {
      id WeakRetained = objc_loadWeakRetained((id *)this + 13);
      double v9 = WeakRetained;
      double v10 = (long long *)(*((void *)this + 6) + v7);
      long long v11 = v10[3];
      long long v13 = *v10;
      long long v12 = v10[1];
      v22[2] = v10[2];
      v22[3] = v11;
      v22[0] = v13;
      v22[1] = v12;
      long long v14 = v10[7];
      long long v16 = v10[4];
      long long v15 = v10[5];
      v22[6] = v10[6];
      v22[7] = v14;
      v22[4] = v16;
      v22[5] = v15;
      if (WeakRetained)
      {
        [WeakRetained outputCurrentStrokePoint:v22];
      }
      else
      {
        uint64_t v28 = 0;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v23 = 0u;
      }
      uint64_t v17 = *v2 + v6;
      long long v18 = v24;
      *(_OWORD *)uint64_t v17 = v23;
      *(_OWORD *)(v17 + 16) = v18;
      long long v19 = v25;
      long long v20 = v26;
      long long v21 = v27;
      *(void *)(v17 + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v28;
      *(_OWORD *)(v17 + 4_Block_object_dispose(&STACK[0x260], 8) = v20;
      *(_OWORD *)(v17 + 64) = v21;
      *(_OWORD *)(v17 + 32) = v19;

      v6 += 88;
      v7 += 128;
      --v5;
    }
    while (v5);
  }
  *((void *)this + 9) = *((void *)this + 4);
}

void sub_1C47B6EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t PKInputFilter<PKInputPoint,_PKStrokePoint>::complete()
{
  return 0;
}

uint64_t PKInputBufferedFilter<PKInputPoint,_PKStrokePoint>::reset(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 32))(result);
  }
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 56) = *(void *)(a1 + 48);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return result;
}

void PKStartCapsFilter::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v20 = a2;
  PKInputBaseFilter<_PKStrokePoint,_PKStrokePoint>::drawingBeganWithInk(a1, v20, a3, a4);
  if (a3 == 1)
  {
    long long v15 = [v20 behavior];
    long long v16 = [v15 pencilFeatheringDescriptor];

    if (!v16) {
      goto LABEL_8;
    }
    uint64_t v17 = [v20 behavior];
    long long v18 = [v17 pencilFeatheringDescriptor];
    [v18 startCapTime];
    *(void *)(a1 + 32) = v19;

    long long v12 = [v20 behavior];
    long long v13 = [v12 pencilFeatheringDescriptor];
    [v13 startCapFade];
    goto LABEL_7;
  }
  if (!a3)
  {
    uint64_t v7 = [v20 behavior];
    id v8 = [v7 featheringDescriptor];

    if (v8)
    {
      double v9 = [v20 behavior];
      double v10 = [v9 featheringDescriptor];
      [v10 startCapTime];
      *(void *)(a1 + 32) = v11;

      long long v12 = [v20 behavior];
      long long v13 = [v12 featheringDescriptor];
      [v13 startCapFade];
LABEL_7:
      *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v14;
    }
  }
LABEL_8:
}

void sub_1C47B70CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t PKStartCapsFilter::copyUpdatedRangeFromIndex(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void **)a3;
  uint64_t v6 = *(void *)(a3 + 8);
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8));
  if (!a2 && *(void *)(a3 + 8) != *(void *)a3) {
    *(void *)(a1 + 4_Block_object_dispose(&STACK[0x260], 8) = **(void **)a3;
  }
  double v9 = *(double *)(a1 + 32);
  if (v9 > 0.0)
  {
    uint64_t v10 = *(void *)(a3 + 8) - *(void *)a3;
    if (v10)
    {
      uint64_t v11 = (v6 - (uint64_t)v7) / 88;
      uint64_t v12 = v10 / 88;
      BOOL v13 = v12 <= v11;
      uint64_t v14 = v12 - v11;
      if (!v13)
      {
        double v15 = *(double *)(a1 + 48);
        long long v16 = (double *)(*(void *)a3 + 88 * v11 + 72);
        do
        {
          double v17 = *(v16 - 9) - v15;
          if (v17 < v9) {
            *long long v16 = *v16 * (1.0 - *(double *)(a1 + 40) * (1.0 - v17 / v9));
          }
          v16 += 11;
          --v14;
        }
        while (v14);
      }
    }
  }
  return result;
}

uint64_t PKInputBaseFilter<_PKStrokePoint,_PKStrokePoint>::reset(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 32))(result);
  }
  *(unsigned char *)(a1 + 16) = 0;
  return result;
}

void PKAnimationFilter::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v15 = a2;
  PKInputBaseFilter<_PKStrokePoint,_PKStrokePoint>::drawingBeganWithInk(a1, v15, a3, a4);
  uint64_t v7 = [v15 behavior];
  id v8 = [v7 animationDescriptor];

  if (v8)
  {
    double v9 = [v15 behavior];
    uint64_t v10 = [v9 animationDescriptor];
    [v10 duration];
    *(void *)(a1 + 32) = v11;

    uint64_t v12 = [v15 behavior];
    BOOL v13 = [v12 animationDescriptor];
    [v13 sizeDelta];
    *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v14;
  }
  else
  {
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  }
}

void sub_1C47B7384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t PKAnimationFilter::copyUpdatedRangeFromIndex(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = *a3;
  uint64_t v5 = a3[1];
  uint64_t v7 = (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8));
  if (*(double *)(a1 + 32) > 0.0 && a3[1] != *a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    char v9 = [WeakRetained isPreviewing];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = 0x2E8BA2E8BA2E8BA3 * ((v5 - v6) >> 3);
      uint64_t v11 = a3[1];
      double v12 = *(unsigned char *)(a1 + 16) ? 1.79769313e308 : *(double *)(v11 - 88);
      uint64_t v13 = 0x2E8BA2E8BA2E8BA3 * ((v11 - *a3) >> 3);
      if (v13 > v10)
      {
        double v14 = *(double *)(a1 + 32);
        id v15 = (double *)(*a3 + 88 * v13 - 88);
        do
        {
          double v16 = fmax((v12 - *v15) / v14, 0.0);
          if (v16 >= 1.0) {
            break;
          }
          --v13;
          _OWORD v15[3] = v15[3] * (v16 + (*(double *)(a1 + 40) + 1.0) * (1.0 - v16));
          if (v7 >= v13) {
            uint64_t v7 = v13;
          }
          v15 -= 11;
        }
        while (v13 > v10);
      }
    }
  }
  return v7;
}

void sub_1C47B7524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void PKPropertySmootherFilter::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v15 = a2;
  PKInputBaseFilter<_PKStrokePoint,_PKStrokePoint>::drawingBeganWithInk(a1, v15, a3, a4);
  uint64_t v7 = [v15 behavior];
  id v8 = [v7 smoothingDescriptor];
  [v8 radiusSmoothing];
  double v10 = v9;
  [v15 weight];
  *(double *)(a1 + 104) = v10 * v11;

  *(void *)(a1 + 112) = 0;
  int v12 = [v15 _isFountainPenInkV2] ^ 1;
  if (a3 != 1) {
    LOBYTE(v12) = 1;
  }
  if ((v12 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    char v14 = [WeakRetained isPreviewing];

    if ((v14 & 1) == 0) {
      *(void *)(a1 + 112) = *(void *)(a1 + 104);
    }
  }
}

void sub_1C47B7620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t PKPropertySmootherFilter::copyUpdatedRangeFromIndex(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(double *)(a1 + 104) <= 0.0 && *(double *)(a1 + 112) <= 0.0) {
    return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 24))();
  }
  else {
    return PKInputBufferedFilter<_PKStrokePoint,_PKStrokePoint>::copyUpdatedRangeFromIndex((void *)a1, a2, a3);
  }
}

void PKPropertySmootherFilter::run(PKPropertySmootherFilter *this)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (char *)this + 48;
  uint64_t v3 = (void *)((char *)this + 80);
  std::vector<_PKStrokePoint>::resize((uint64_t)this + 80, 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((void *)this + 7) - *((void *)this + 6)) >> 3));
  uint64_t v4 = *((void *)v2 - 2);
  uint64_t v5 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((void *)v2 + 1) - *(void *)v2) >> 3);
  uint64_t v6 = *((void *)v2 + 3);
  if (v6 < v5)
  {
    double v7 = *((double *)v2 + 7) / 7.0;
    double v8 = *((double *)v2 + 8) / 7.0;
    double v35 = (double)(v5 - 1);
    uint64_t v36 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((void *)v2 + 1) - *(void *)v2) >> 3);
    do
    {
      uint64_t v9 = *(void *)v2 + 88 * v6;
      uint64_t v10 = *v3 + 88 * v6;
      long long v12 = *(_OWORD *)(v9 + 48);
      long long v11 = *(_OWORD *)(v9 + 64);
      long long v13 = *(_OWORD *)(v9 + 32);
      *(void *)(v10 + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(v9 + 80);
      *(_OWORD *)(v10 + 4_Block_object_dispose(&STACK[0x260], 8) = v12;
      *(_OWORD *)(v10 + 64) = v11;
      *(_OWORD *)(v10 + 32) = v13;
      long long v14 = *(_OWORD *)(v9 + 16);
      *(_OWORD *)uint64_t v10 = *(_OWORD *)v9;
      *(_OWORD *)(v10 + 16) = v14;
      if (v7 > 0.0)
      {
        double v37 = 0.0;
        uint64_t v42 = &v37;
        double v43 = v7 * -0.5;
        int64_t v44 = v2;
        PKPropertySmootherFilter::stepDistanceFrom<_PKStrokePoint,PKPropertySmootherFilter::integrateRadiusFrom(double &,double,std::vector<_PKStrokePoint> const&)::{lambda(double,double,double)#1}>(*((void *)this + 6), *((void *)this + 7), (uint64_t)&v42, (double)v6, v7 * -0.5);
        double v45 = v37 * 0.5;
        for (uint64_t i = 2; i != -1; --i)
        {
          double v41 = 0.0;
          double v37 = COERCE_DOUBLE(&v41);
          double v38 = -v7;
          int8x16_t v39 = v2;
          PKPropertySmootherFilter::stepDistanceFrom<_PKStrokePoint,PKPropertySmootherFilter::integrateRadiusFrom(double &,double,std::vector<_PKStrokePoint> const&)::{lambda(double,double,double)#1}>(*((void *)this + 6), *((void *)this + 7), (uint64_t)&v37, v15, -v7);
          *(double *)&(&v42)[i] = v41;
        }
        double v41 = 0.0;
        double v37 = COERCE_DOUBLE(&v41);
        double v38 = v7 * 0.5;
        int8x16_t v39 = v2;
        PKPropertySmootherFilter::stepDistanceFrom<_PKStrokePoint,PKPropertySmootherFilter::integrateRadiusFrom(double &,double,std::vector<_PKStrokePoint> const&)::{lambda(double,double,double)#1}>(*((void *)this + 6), *((void *)this + 7), (uint64_t)&v37, (double)v6, v7 * 0.5);
        double v45 = v45 + v41 * 0.5;
        for (uint64_t j = 4; j != 7; ++j)
        {
          double v41 = 0.0;
          double v37 = COERCE_DOUBLE(&v41);
          double v38 = v7;
          int8x16_t v39 = v2;
          PKPropertySmootherFilter::stepDistanceFrom<_PKStrokePoint,PKPropertySmootherFilter::integrateRadiusFrom(double &,double,std::vector<_PKStrokePoint> const&)::{lambda(double,double,double)#1}>(*((void *)this + 6), *((void *)this + 7), (uint64_t)&v37, v17, v7);
          *(double *)&(&v42)[j] = v41;
        }
        uint64_t v19 = 0;
        double v20 = 0.0;
        do
        {
          double v20 = v20 + *(double *)&PKPropertySmootherFilter::run(void)::smoothingKernel[v19] * *(double *)&(&v42)[v19];
          ++v19;
        }
        while (v19 != 7);
        if (v4 >= v6) {
          uint64_t v21 = v6;
        }
        else {
          uint64_t v21 = v4;
        }
        if (v17 >= v35) {
          uint64_t v4 = v21;
        }
        *(double *)(*v3 + 88 * v6 + 24) = v20;
        uint64_t v5 = v36;
      }
      if (v8 > 0.0)
      {
        uint64_t v22 = *((void *)this + 6);
        uint64_t v23 = *((void *)this + 7);
        double v24 = *(double *)(v22 + 88 * v6 + 56);
        double v37 = 0.0;
        uint64_t v42 = &v37;
        double v43 = v8 * -0.5;
        int64_t v44 = v2;
        double v45 = v24;
        double v25 = PKPropertySmootherFilter::stepDistanceFrom<_PKStrokePoint,PKPropertySmootherFilter::integrateRelativeAzimuthFrom(double &,double,double,std::vector<_PKStrokePoint> const&)::{lambda(double,double,double)#1}>(v22, v23, (uint64_t)&v42, (double)v6, v8 * -0.5);
        double v45 = v37 * 0.5;
        for (uint64_t k = 2; k != -1; --k)
        {
          double v41 = 0.0;
          double v37 = COERCE_DOUBLE(&v41);
          double v38 = -v8;
          int8x16_t v39 = v2;
          double v40 = v24;
          double v25 = PKPropertySmootherFilter::stepDistanceFrom<_PKStrokePoint,PKPropertySmootherFilter::integrateRelativeAzimuthFrom(double &,double,double,std::vector<_PKStrokePoint> const&)::{lambda(double,double,double)#1}>(*((void *)this + 6), *((void *)this + 7), (uint64_t)&v37, v25, -v8);
          *(double *)&(&v42)[k] = v41;
        }
        double v41 = 0.0;
        double v37 = COERCE_DOUBLE(&v41);
        double v38 = v8 * 0.5;
        int8x16_t v39 = v2;
        double v40 = v24;
        double v27 = PKPropertySmootherFilter::stepDistanceFrom<_PKStrokePoint,PKPropertySmootherFilter::integrateRelativeAzimuthFrom(double &,double,double,std::vector<_PKStrokePoint> const&)::{lambda(double,double,double)#1}>(*((void *)this + 6), *((void *)this + 7), (uint64_t)&v37, (double)v6, v8 * 0.5);
        double v45 = v45 + v41 * 0.5;
        for (uint64_t m = 4; m != 7; ++m)
        {
          double v41 = 0.0;
          double v37 = COERCE_DOUBLE(&v41);
          double v38 = v8;
          int8x16_t v39 = v2;
          double v40 = v24;
          double v27 = PKPropertySmootherFilter::stepDistanceFrom<_PKStrokePoint,PKPropertySmootherFilter::integrateRelativeAzimuthFrom(double &,double,double,std::vector<_PKStrokePoint> const&)::{lambda(double,double,double)#1}>(*((void *)this + 6), *((void *)this + 7), (uint64_t)&v37, v27, v8);
          *(double *)&(&v42)[m] = v41;
        }
        uint64_t v29 = 0;
        double v30 = 0.0;
        do
        {
          double v30 = v30 + *(double *)&PKPropertySmootherFilter::run(void)::smoothingKernel[v29] * *(double *)&(&v42)[v29];
          ++v29;
        }
        while (v29 != 7);
        if (v4 >= v6) {
          uint64_t v31 = v6;
        }
        else {
          uint64_t v31 = v4;
        }
        if (v27 >= v35) {
          uint64_t v4 = v31;
        }
        double v32 = v24 + v30;
        double v33 = fmod(v24 + v30, 6.28318531);
        if (v32 <= 6.28318531 && v32 >= 0.0) {
          double v33 = v32;
        }
        if (v33 < 0.0) {
          double v33 = v33 + 6.28318531;
        }
        if (v33 == 0.0) {
          double v33 = 0.0;
        }
        *(double *)(*v3 + 88 * v6 + 56) = v33;
        uint64_t v5 = v36;
      }
      ++v6;
    }
    while (v6 != v5);
  }
  *((void *)this + 9) = v4;
}

uint64_t PKPropertySmootherFilter::stepDistanceFrom<_PKStrokePoint,PKPropertySmootherFilter::integrateRadiusFrom(double &,double,std::vector<_PKStrokePoint> const&)::{lambda(double,double,double)#1}>(uint64_t result, uint64_t a2, uint64_t a3, double a4, double a5)
{
  BOOL v5 = a5 >= 0.0;
  double v6 = -a5;
  if (a5 < 0.0)
  {
    BOOL v7 = a4 <= 0.0;
  }
  else
  {
    double v6 = a5;
    BOOL v7 = 0;
  }
  if (!v7 && v6 > 0.0)
  {
    do
    {
      uint64_t v8 = (uint64_t)a4;
      double v9 = a4 - (double)(uint64_t)a4;
      double v10 = v9;
      uint64_t v11 = (uint64_t)a4;
      if (a5 < 0.0)
      {
        double v10 = a4 - (double)(uint64_t)a4;
        uint64_t v11 = (uint64_t)a4;
        if (v9 == 0.0)
        {
          uint64_t v11 = v8 - 1;
          if (v8 < 1) {
            break;
          }
          double v10 = 1.0;
        }
      }
      if (v11 + 1 >= 0x2E8BA2E8BA2E8BA3 * ((a2 - result) >> 3)) {
        break;
      }
      uint64_t v12 = result + 88 * v11;
      uint64_t v13 = result + 88 * (v11 + 1);
      double v14 = sqrt((*(double *)(v12 + 16) - *(double *)(v13 + 16)) * (*(double *)(v12 + 16) - *(double *)(v13 + 16))+ (*(double *)(v12 + 8) - *(double *)(v13 + 8)) * (*(double *)(v12 + 8) - *(double *)(v13 + 8)));
      if (a5 >= 0.0) {
        double v10 = 1.0 - v10;
      }
      double v15 = v10 * v14;
      if (v15 > v6)
      {
        if (a5 >= 0.0) {
          double v30 = v6;
        }
        else {
          double v30 = -v6;
        }
        a4 = a4 + v30 / v14;
        double v31 = *(double *)(a3 + 8);
        if (v31 < 0.0) {
          double v31 = -v31;
        }
        double v29 = v6 / v31;
        goto LABEL_37;
      }
      double v16 = *(double *)(a3 + 8);
      double v17 = -v16;
      if (v16 >= 0.0) {
        double v17 = *(double *)(a3 + 8);
      }
      long long v18 = *(uint64_t **)(a3 + 16);
      uint64_t v19 = *v18;
      uint64_t v20 = v18[1];
      double v21 = *(double *)(v19 + 88 * v8 + 24);
      if (v9 > 0.0)
      {
        unint64_t v22 = v8 + 1;
        if (v22 < 0x2E8BA2E8BA2E8BA3 * ((v20 - v19) >> 3)) {
          double v21 = v21 + (*(double *)(v19 + 88 * v22 + 24) - v21) * v9;
        }
      }
      uint64_t v23 = v11 + v5;
      a4 = (double)(v11 + v5);
      double v24 = a4 - (double)(uint64_t)a4;
      double v25 = *(double *)(v19 + 88 * (uint64_t)a4 + 24);
      if (v24 > 0.0)
      {
        unint64_t v26 = (uint64_t)a4 + 1;
        if (v26 < 0x2E8BA2E8BA2E8BA3 * ((v20 - v19) >> 3)) {
          double v25 = v25 + (*(double *)(v19 + 88 * v26 + 24) - v25) * v24;
        }
      }
      **(double **)a3 = **(double **)a3 + v15 / v17 * (v21 + v25) * 0.5;
      double v6 = v6 - v15;
      BOOL v27 = v23 > 0 || a5 >= 0.0;
    }
    while (v27 && v6 > 0.0);
  }
  if (v6 > 0.0)
  {
    double v28 = *(double *)(a3 + 8);
    if (v28 < 0.0) {
      double v28 = -v28;
    }
    double v29 = v6 / v28;
    uint64_t v8 = (uint64_t)a4;
    double v9 = a4 - (double)(uint64_t)a4;
LABEL_37:
    double v32 = *(uint64_t **)(a3 + 16);
    uint64_t v33 = *v32;
    uint64_t v34 = v32[1];
    double v35 = *(double *)(v33 + 88 * v8 + 24);
    if (v9 > 0.0 && v8 + 1 < (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((v34 - v33) >> 3))) {
      double v35 = v35 + (*(double *)(v33 + 88 * (v8 + 1) + 24) - v35) * v9;
    }
    double v36 = a4 - (double)(uint64_t)a4;
    double v37 = *(double *)(v33 + 88 * (uint64_t)a4 + 24);
    if (v36 > 0.0)
    {
      unint64_t v38 = (uint64_t)a4 + 1;
      if (v38 < 0x2E8BA2E8BA2E8BA3 * ((v34 - v33) >> 3)) {
        double v37 = v37 + (*(double *)(v33 + 88 * v38 + 24) - v37) * v36;
      }
    }
    **(double **)a3 = **(double **)a3 + v29 * (v35 + v37) * 0.5;
  }
  return result;
}

double PKPropertySmootherFilter::stepDistanceFrom<_PKStrokePoint,PKPropertySmootherFilter::integrateRelativeAzimuthFrom(double &,double,double,std::vector<_PKStrokePoint> const&)::{lambda(double,double,double)#1}>(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  BOOL v7 = a5 < 0.0;
  BOOL v8 = a5 >= 0.0;
  double v9 = -a5;
  if (v7) {
    double v10 = v9;
  }
  else {
    double v10 = a5;
  }
  BOOL v11 = v7 && a4 <= 0.0;
  if (!v11 && v10 > 0.0)
  {
    uint64_t v13 = 0x2E8BA2E8BA2E8BA3 * ((a2 - a1) >> 3);
    while (1)
    {
      uint64_t v14 = (uint64_t)a4;
      double v15 = a4 - (double)(uint64_t)a4;
      if (a5 < 0.0 && v15 == 0.0)
      {
        BOOL v11 = v14-- < 1;
        if (v11) {
          break;
        }
        double v15 = 1.0;
      }
      if (v14 + 1 >= v13) {
        break;
      }
      uint64_t v16 = a1 + 88 * (v14 + 1);
      double v17 = sqrt((*(double *)(a1 + 88 * v14 + 16) - *(double *)(v16 + 16))* (*(double *)(a1 + 88 * v14 + 16) - *(double *)(v16 + 16))+ (*(double *)(a1 + 88 * v14 + 8) - *(double *)(v16 + 8))* (*(double *)(a1 + 88 * v14 + 8) - *(double *)(v16 + 8)));
      if (a5 >= 0.0) {
        double v15 = 1.0 - v15;
      }
      double v18 = v15 * v17;
      if (v15 * v17 > v10)
      {
        double v37 = -v10;
        if (a5 >= 0.0) {
          double v37 = v10;
        }
        double v20 = a4 + v37 / v17;
        double v38 = *(double *)(a3 + 8);
        if (v38 < 0.0) {
          double v38 = -v38;
        }
        double v32 = v10 / v38;
        long double v33 = *(double *)(a3 + 24);
        int8x16_t v39 = *(uint64_t **)(a3 + 16);
        uint64_t v35 = *v39;
        uint64_t v36 = v39[1];
        goto LABEL_35;
      }
      uint64_t v19 = v14 + v8;
      double v20 = (double)(v14 + v8);
      double v21 = *(double *)(a3 + 8);
      if (v21 < 0.0) {
        double v21 = -v21;
      }
      double v22 = v18 / v21;
      long double v23 = *(double *)(a3 + 24);
      double v24 = *(uint64_t **)(a3 + 16);
      uint64_t v25 = *v24;
      uint64_t v26 = v24[1];
      PKPropertySmootherFilter::relativeAzimuthAt<_PKStrokePoint>(*v24, v26, a4, v23);
      double v28 = v27;
      PKPropertySmootherFilter::relativeAzimuthAt<_PKStrokePoint>(v25, v26, v20, v23);
      **(double **)a3 = **(double **)a3 + v22 * (v28 + v29) * 0.5;
      double v10 = v10 - v18;
      BOOL v30 = !v8;
      if (v19 >= 1) {
        BOOL v30 = 0;
      }
      if (!v30)
      {
        a4 = v20;
        if (v10 > 0.0) {
          continue;
        }
      }
      goto LABEL_26;
    }
  }
  double v20 = a4;
LABEL_26:
  if (v10 > 0.0)
  {
    double v31 = *(double *)(a3 + 8);
    if (v31 < 0.0) {
      double v31 = -v31;
    }
    double v32 = v10 / v31;
    long double v33 = *(double *)(a3 + 24);
    uint64_t v34 = *(uint64_t **)(a3 + 16);
    uint64_t v35 = *v34;
    uint64_t v36 = v34[1];
    a4 = v20;
LABEL_35:
    PKPropertySmootherFilter::relativeAzimuthAt<_PKStrokePoint>(v35, v36, a4, v33);
    double v41 = v40;
    PKPropertySmootherFilter::relativeAzimuthAt<_PKStrokePoint>(v35, v36, v20, v33);
    **(double **)a3 = **(double **)a3 + v32 * (v41 + v42) * 0.5;
  }
  return v20;
}

void PKPropertySmootherFilter::relativeAzimuthAt<_PKStrokePoint>(uint64_t a1, uint64_t a2, double a3, long double a4)
{
  uint64_t v5 = (uint64_t)a3;
  double v6 = a3 - (double)(uint64_t)a3;
  double v7 = *(double *)(a1 + 88 * v5 + 56);
  if (v6 > 0.0)
  {
    unint64_t v8 = v5 + 1;
    if (v8 < 0x2E8BA2E8BA2E8BA3 * ((a2 - a1) >> 3)) {
      double v7 = v7 + (*(double *)(a1 + 88 * v8 + 56) - v7) * v6;
    }
  }
  DKDDiffAngleInRadians(a4, v7);
}

void PKEndCapsFilter::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v20 = a2;
  PKInputBaseFilter<_PKStrokePoint,_PKStrokePoint>::drawingBeganWithInk(a1, v20, a3, a4);
  if (a3 == 1)
  {
    double v15 = [v20 behavior];
    uint64_t v16 = [v15 pencilFeatheringDescriptor];

    if (!v16) {
      goto LABEL_8;
    }
    double v17 = [v20 behavior];
    double v18 = [v17 pencilFeatheringDescriptor];
    [v18 endCapTime];
    *(void *)(a1 + 32) = v19;

    uint64_t v12 = [v20 behavior];
    uint64_t v13 = [v12 pencilFeatheringDescriptor];
    [v13 endCapFade];
    goto LABEL_7;
  }
  if (!a3)
  {
    double v7 = [v20 behavior];
    unint64_t v8 = [v7 featheringDescriptor];

    if (v8)
    {
      double v9 = [v20 behavior];
      double v10 = [v9 featheringDescriptor];
      [v10 endCapTime];
      *(void *)(a1 + 32) = v11;

      uint64_t v12 = [v20 behavior];
      uint64_t v13 = [v12 featheringDescriptor];
      [v13 endCapFade];
LABEL_7:
      *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v14;
    }
  }
LABEL_8:
}

void sub_1C47B820C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t PKEndCapsFilter::copyUpdatedRangeFromIndex(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v7 = *(void **)a3;
  uint64_t v6 = *(void *)(a3 + 8);
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8));
  if (!a2 && *(void *)(a3 + 8) != *(void *)a3) {
    *(void *)(a1 + 4_Block_object_dispose(&STACK[0x260], 8) = **(void **)a3;
  }
  double v9 = *(double *)(a1 + 32);
  if (v9 > 0.0)
  {
    double v10 = *(void **)a3;
    uint64_t v11 = *(void *)(a3 + 8);
    if (v11 != *(void *)a3)
    {
      if (*(unsigned char *)(a1 + 16))
      {
        if (v9 > 0.0)
        {
          double v12 = *(double *)(v11 - 88);
          if (v12 - *(double *)(a1 + 48) > v9 + v9)
          {
            uint64_t v13 = (v11 - *(void *)a3) / 88;
            uint64_t v14 = (uint64_t)&v10[11 * v13 + 2];
            uint64_t v15 = v13;
            while (--v15)
            {
              uint64_t v16 = (double *)(v14 - 88);
              double v17 = v12 - *(double *)(v14 - 104);
              v14 -= 88;
              if (v17 > v9)
              {
                double v18 = *(v16 - 1);
                double v19 = *v16;
                goto LABEL_19;
              }
            }
            double v18 = 0.0;
            double v19 = 0.0;
LABEL_19:
            if ((v19 - *(double *)(v11 - 72)) * (v19 - *(double *)(v11 - 72))
               + (v18 - *(double *)(v11 - 80)) * (v18 - *(double *)(v11 - 80)) > 225.0)
            {
              uint64_t v22 = v13 - 1;
              if (v13 != 1)
              {
                long double v23 = (double *)&v10[11 * v13 - 2];
                do
                {
                  double v24 = v12 - *(v23 - 9);
                  if (v24 >= v9) {
                    break;
                  }
                  double *v23 = *v23 * (1.0 - *(double *)(a1 + 40) * (1.0 - v24 / v9));
                  v23 -= 11;
                  --v22;
                }
                while (v22);
              }
            }
          }
        }
      }
      else if (result)
      {
        double v20 = *(double *)(v11 - 88) - v9;
        double v21 = (double *)&v10[11 * (result + (v6 - (uint64_t)v7) / 88 - a2)];
        do
        {
          if (*v21 <= v20) {
            break;
          }
          v21 -= 11;
          --result;
        }
        while (result);
      }
    }
  }
  return result;
}

void PKInputBaseFilter<_PKStrokePoint,PKCompressedStrokePoint>::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v8 = a2;
  double v7 = *(void (****)(void, id, uint64_t, double))(a1 + 8);
  if (v7) {
    (**v7)(v7, v8, a3, a4);
  }
  *(double *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 16) = 0;
}

void sub_1C47B84CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t PKInputBaseFilter<_PKStrokePoint,PKCompressedStrokePoint>::drawingEnded(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  *(unsigned char *)(a1 + 16) = 1;
  return result;
}

void PKInputProvider<PKCompressedStrokePoint>::getUpdatedRangeFromIndex()
{
}

uint64_t PKInputBufferedFilter<_PKStrokePoint,PKCompressedStrokePoint>::copyUpdatedRangeFromIndex(void *a1, uint64_t a2, char **a3)
{
  (*(void (**)(void *))(*a1 + 40))(a1);
  uint64_t v6 = (void *)(*(uint64_t (**)(void *))(*a1 + 48))(a1);
  double v7 = (char *)v6[1];
  id v8 = (char *)(*v6 + 32 * a2);
  uint64_t v9 = v7 - v8;
  if (v7 - v8 < 1) {
    return a1[9];
  }
  uint64_t v10 = v9 >> 5;
  unint64_t v11 = (unint64_t)a3[1];
  uint64_t v12 = v11 - (void)*a3;
  uint64_t v13 = &(*a3)[v12 & 0xFFFFFFFFFFFFFFE0];
  uint64_t v14 = a3[2];
  if (v9 >> 5 > (uint64_t)&v14[-v11] >> 5)
  {
    uint64_t v15 = v12 >> 5;
    unint64_t v16 = (v12 >> 5) + v10;
    if (v16 >> 59) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v17 = v14 - *a3;
    if (v17 >> 4 > v16) {
      unint64_t v16 = v17 >> 4;
    }
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v18 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v18 = v16;
    }
    if (v18) {
      double v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKCompressedStrokePoint>>((uint64_t)(a3 + 2), v18);
    }
    else {
      double v19 = 0;
    }
    double v29 = &v19[32 * v15];
    BOOL v30 = &v29[32 * v10];
    uint64_t v31 = 32 * v10;
    double v32 = v29;
    do
    {
      long long v33 = *(_OWORD *)v8;
      long long v34 = *((_OWORD *)v8 + 1);
      v8 += 32;
      *(_OWORD *)double v32 = v33;
      *((_OWORD *)v32 + 1) = v34;
      v32 += 32;
      v31 -= 32;
    }
    while (v31);
    uint64_t v35 = *a3;
    if (*a3 == v13)
    {
      double v38 = v29;
    }
    else
    {
      uint64_t v36 = v13;
      do
      {
        long long v37 = *((_OWORD *)v36 - 1);
        double v38 = v29 - 32;
        *((_OWORD *)v29 - 2) = *((_OWORD *)v36 - 2);
        *((_OWORD *)v29 - 1) = v37;
        v36 -= 32;
        v29 -= 32;
      }
      while (v36 != v35);
    }
    int8x16_t v39 = &v19[32 * v18];
    double v40 = a3[1];
    uint64_t v41 = v40 - v13;
    if (v40 != v13) {
      memmove(v30, v13, v40 - v13);
    }
    double v42 = *a3;
    *a3 = v38;
    a3[1] = &v30[v41];
    a3[2] = v39;
    if (v42) {
      operator delete(v42);
    }
    return a1[9];
  }
  uint64_t v20 = (uint64_t)(v11 - (void)v13) >> 5;
  if (v20 >= v10)
  {
    double v21 = &v8[32 * v10];
    long double v23 = a3[1];
LABEL_17:
    double v24 = &v13[32 * v10];
    uint64_t v25 = (long long *)&v23[-32 * v10];
    uint64_t v26 = v23;
    if ((unint64_t)v25 < v11)
    {
      uint64_t v26 = v23;
      do
      {
        long long v27 = *v25;
        long long v28 = v25[1];
        v25 += 2;
        *(_OWORD *)uint64_t v26 = v27;
        *((_OWORD *)v26 + 1) = v28;
        v26 += 32;
      }
      while ((unint64_t)v25 < v11);
    }
    a3[1] = v26;
    if (v23 != v24) {
      memmove(&v23[-32 * ((v23 - v24) >> 5)], v13, v23 - v24);
    }
    if (v21 != v8) {
      memmove(v13, v8, v21 - v8);
    }
    return a1[9];
  }
  double v21 = &v8[32 * v20];
  int64_t v22 = v7 - v21;
  if (v7 != v21) {
    memmove(a3[1], &v8[32 * v20], v7 - v21);
  }
  long double v23 = (char *)(v11 + v22);
  a3[1] = (char *)(v11 + v22);
  if ((uint64_t)(v11 - (void)v13) >= 1) {
    goto LABEL_17;
  }
  return a1[9];
}

void *PKInputFilter<_PKStrokePoint,PKCompressedStrokePoint>::reset(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
  }
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 56) = *(void *)(a1 + 48);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1);
  result[1] = *result;
  return result;
}

uint64_t PKInputBufferedFilter<_PKStrokePoint,PKCompressedStrokePoint>::fetchInput(uint64_t a1)
{
  uint64_t v2 = a1 + 48;
  std::vector<_PKStrokePoint>::resize(a1 + 48, *(void *)(a1 + 32));
  *(void *)(a1 + 32) = (*(uint64_t (**)(void, void, uint64_t))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8), *(void *)(a1 + 32), v2);
  uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 56);

  return v3(a1);
}

uint64_t PKInputFilter<_PKStrokePoint,PKCompressedStrokePoint>::outputVector(uint64_t a1)
{
  return a1 + 80;
}

void PKCompressionFilter::run(PKCompressionFilter *this)
{
  std::vector<PKCompressedStrokePoint>::resize((uint64_t)this + 80, 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((void *)this + 7) - *((void *)this + 6)) >> 3));
  unint64_t v2 = *((void *)this + 9);
  uint64_t v3 = (double *)*((void *)this + 6);
  if (v2 < 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((void *)this + 7) - (void)v3) >> 3))
  {
    uint64_t v4 = 32 * v2;
    uint64_t v5 = 11 * v2;
    do
    {
      long long v6 = *(_OWORD *)&v3[v5 + 6];
      long long v11 = *(_OWORD *)&v3[v5 + 4];
      long long v12 = v6;
      long long v13 = *(_OWORD *)&v3[v5 + 8];
      double v14 = v3[v5 + 10];
      long long v7 = *(_OWORD *)&v3[v5 + 2];
      *(_OWORD *)&v10.var0.var0 = *(_OWORD *)&v3[v5];
      *(_OWORD *)&v10.var3 = v7;
      PKCompressStrokePoint(&v10, *v3, (float32x2_t *)v15);
      id v8 = (_OWORD *)(*((void *)this + 10) + v4);
      long long v9 = v15[1];
      *id v8 = v15[0];
      v8[1] = v9;
      ++v2;
      uint64_t v3 = (double *)*((void *)this + 6);
      v4 += 32;
      v5 += 11;
    }
    while (v2 < 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((void *)this + 7) - (void)v3) >> 3));
  }
  *((void *)this + 9) = *((void *)this + 4);
}

uint64_t PKInputFilter<_PKStrokePoint,PKCompressedStrokePoint>::complete()
{
  return 0;
}

uint64_t PKInputBufferedFilter<_PKStrokePoint,PKCompressedStrokePoint>::reset(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 32))(result);
  }
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 56) = *(void *)(a1 + 48);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return result;
}

void PKInputBaseFilter<PKCompressedStrokePoint,_PKStrokePoint>::drawingBeganWithInk(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v8 = a2;
  long long v7 = *(void (****)(void, id, uint64_t, double))(a1 + 8);
  if (v7) {
    (**v7)(v7, v8, a3, a4);
  }
  *(double *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 16) = 0;
}

void sub_1C47B8B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t PKInputBaseFilter<PKCompressedStrokePoint,_PKStrokePoint>::drawingEnded(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  *(unsigned char *)(a1 + 16) = 1;
  return result;
}

uint64_t PKInputBufferedFilter<PKCompressedStrokePoint,_PKStrokePoint>::copyUpdatedRangeFromIndex(void *a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void *))(*a1 + 40))(a1);
  uint64_t v6 = (*(uint64_t (**)(void *))(*a1 + 48))(a1);
  std::vector<_PKStrokePoint>::__insert_with_size[abi:ne180100]<std::__wrap_iter<_PKStrokePoint*>,std::__wrap_iter<_PKStrokePoint*>>(a3, *(void *)(a3 + 8), (char *)(*(void *)v6 + 88 * a2), *(char **)(v6 + 8), 0x2E8BA2E8BA2E8BA3 * ((*(void *)(v6 + 8) - (*(void *)v6 + 88 * a2)) >> 3));
  return a1[9];
}

void *PKInputFilter<PKCompressedStrokePoint,_PKStrokePoint>::reset(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
  }
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 56) = *(void *)(a1 + 48);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1);
  result[1] = *result;
  return result;
}

uint64_t PKInputBufferedFilter<PKCompressedStrokePoint,_PKStrokePoint>::fetchInput(uint64_t a1)
{
  uint64_t v2 = a1 + 48;
  std::vector<PKCompressedStrokePoint>::resize(a1 + 48, *(void *)(a1 + 32));
  *(void *)(a1 + 32) = (*(uint64_t (**)(void, void, uint64_t))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8), *(void *)(a1 + 32), v2);
  uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 56);

  return v3(a1);
}

uint64_t PKInputFilter<PKCompressedStrokePoint,_PKStrokePoint>::outputVector(uint64_t a1)
{
  return a1 + 80;
}

void PKDecompressionFilter::run(PKDecompressionFilter *this)
{
  uint64_t v2 = (void *)((char *)this + 80);
  std::vector<_PKStrokePoint>::resize((uint64_t)this + 80, (uint64_t)(*((void *)this + 7) - *((void *)this + 6)) >> 5);
  unint64_t v8 = *((void *)this + 9);
  uint64_t v9 = *((void *)this + 6);
  unint64_t v10 = (*((void *)this + 7) - v9) >> 5;
  BOOL v11 = v10 > v8;
  unint64_t v12 = v10 - v8;
  if (v11)
  {
    uint64_t v13 = v9 + 32 * v8 + 16;
    double v14 = (double *)(*v2 + 88 * v8 + 40);
    do
    {
      double v15 = *((double *)this + 13);
      double v16 = v15 + *(float *)(v13 - 8);
      double v17 = *(float *)(v13 - 4);
      LOWORD(v15) = *(_WORD *)v13;
      LOWORD(v3) = *(_WORD *)(v13 + 2);
      double v3 = (double)*(unint64_t *)&v3 / 10.0;
      LOWORD(v4) = *(_WORD *)(v13 + 4);
      double v4 = (double)*(unint64_t *)&v4 / 1000.0;
      LOWORD(v5) = *(_WORD *)(v13 + 6);
      double v5 = (double)*(unint64_t *)&v5 / 10430.2192;
      LOWORD(v6) = *(_WORD *)(v13 + 8);
      double v6 = (double)*(unint64_t *)&v6 / 41720.8768;
      LOWORD(v7) = *(_WORD *)(v13 + 10);
      double v7 = (double)*(unint64_t *)&v7;
      double v18 = *(float *)(v13 + 12);
      *(v14 - 5) = v16;
      *((float64x2_t *)v14 - 2) = vcvtq_f64_f32(*(float32x2_t *)(v13 - 16));
      *(v14 - 2) = v17;
      *(v14 - 1) = (double)*(unint64_t *)&v15 / 1000.0;
      *double v14 = v3;
      v14[1] = v4;
      v14[2] = v5;
      v14[3] = v6;
      v14[4] = v7 / 32767.5;
      v14[5] = v18;
      v13 += 32;
      v14 += 11;
      --v12;
    }
    while (v12);
  }
  *((void *)this + 9) = *((void *)this + 4);
}

uint64_t PKInputFilter<PKCompressedStrokePoint,_PKStrokePoint>::complete()
{
  return 0;
}

uint64_t PKInputBufferedFilter<PKCompressedStrokePoint,_PKStrokePoint>::reset(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 32))(result);
  }
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 56) = *(void *)(a1 + 48);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return result;
}

void ___ZL24PKAllowPencilHookFiltersv_block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  byte_1EB3C6369 = [v0 BOOLForKey:@"internalSettings.drawing.allowPencilHookFilters"];
}

void sub_1C47B8FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47BED94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47BEEE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47BF194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
  _Unwind_Resume(a1);
}

void sub_1C47BF28C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C4128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C41E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C484C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1C47C49F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C4ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C4C10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C47C4C9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C4CEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C4D3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C4D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C4E7C(_Unwind_Exception *a1)
{
  if (v3) {
  _Unwind_Resume(a1);
  }
}

void sub_1C47C4F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C4F88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C4FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C5028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C51F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C52EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C53A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C5610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C56C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C5778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C5840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C58EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C5994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C5A98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C5C10(_Unwind_Exception *a1)
{
  unint64_t v8 = v6;

  _Unwind_Resume(a1);
}

void sub_1C47C5D88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C5EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C6108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C61C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C62B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C656C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C66A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C6798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C6850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C69D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C6A64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C6B10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47C6BEC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<PKProtobufUnknownFields>::reset[abi:ne180100]((PB::Writer ***)va, 0);
  _Unwind_Resume(a1);
}

void sub_1C47C6D64(_Unwind_Exception *a1)
{
  char v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1C47C6FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47CDA20(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 152));
  _Unwind_Resume(a1);
}

void sub_1C47CDBEC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1C47CE214(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_1C47D0DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C47D432C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47D44D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47D4734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47D4934(_Unwind_Exception *a1)
{
  char v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1C47D513C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47D55A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  _Unwind_Resume(a1);
}

void sub_1C47D5B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  _Unwind_Resume(a1);
}

void sub_1C47D5C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47D5D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47D5D90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47D5E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47D643C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47D6784(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1C47D6E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C47D7188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C47D7BA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C47D88B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47D8990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47D8A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47D8B18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47D9308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47D9398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47D9600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__37(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__37(uint64_t a1)
{
}

void sub_1C47D9DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1C47DA350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47DA598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47DA920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1C47DABCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47DAD14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47DAFC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

double legacy_drawing::Command::Command(legacy_drawing::Command *this)
{
  *(void *)this = &unk_1F1FB05B8;
  *((_DWORD *)this + 25) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + _Block_object_dispose(&STACK[0x260], 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((void *)this + 11) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F1FB05B8;
  *((_DWORD *)this + 25) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + _Block_object_dispose(&STACK[0x260], 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((void *)this + 11) = 0;
  return result;
}

void legacy_drawing::Command::~Command(legacy_drawing::Command *this)
{
  *(void *)this = &unk_1F1FB05B8;
  uint64_t v2 = *((void *)this + 11);
  *((void *)this + 11) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*((void *)this + 8))
  {
    std::vector<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::__clear[abi:ne180100]((void *)this + 8);
    operator delete(*((void **)this + 8));
  }
  uint64_t v3 = *((void *)this + 7);
  *((void *)this + 7) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = *((void *)this + 6);
  *((void *)this + 6) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = *((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  uint64_t v6 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  uint64_t v8 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  uint64_t v9 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }

  PB::Base::~Base(this);
}

{
  uint64_t vars8;

  legacy_drawing::Command::~Command(this);

  JUMPOUT(0x1C8783F10);
}

uint64_t legacy_drawing::Command::Command(uint64_t this, const legacy_drawing::Command *a2)
{
  *(void *)this = &unk_1F1FB05B8;
  *(_OWORD *)(this + _Block_object_dispose(&STACK[0x260], 8) = 0u;
  *(_DWORD *)(this + 10std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  *(_OWORD *)(this + 24) = 0u;
  *(_OWORD *)(this + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0u;
  *(_OWORD *)(this + 56) = 0u;
  *(_OWORD *)(this + 72) = 0u;
  *(void *)(this + 8_Block_object_dispose(&STACK[0x260], 8) = 0;
  if (*((void *)a2 + 6)) {
    operator new();
  }
  if (*((unsigned char *)a2 + 100))
  {
    int v2 = *((_DWORD *)a2 + 24);
    *(unsigned char *)(this + 100) |= 1u;
    *(_DWORD *)(this + 96) = v2;
  }
  if (*((void *)a2 + 5)) {
    operator new();
  }
  if (*((void *)a2 + 1)) {
    operator new();
  }
  if (*((void *)a2 + 8) != *((void *)a2 + 9)) {
    operator new();
  }
  if (*((void *)a2 + 11)) {
    operator new();
  }
  if (*((void *)a2 + 2)) {
    operator new();
  }
  if (*((void *)a2 + 4)) {
    operator new();
  }
  if (*((void *)a2 + 3)) {
    operator new();
  }
  if (*((void *)a2 + 7)) {
    operator new();
  }
  return this;
}

void sub_1C47DBAF4(void *a1)
{
}

uint64_t legacy_drawing::Command::operator=(uint64_t a1, const legacy_drawing::Command *a2)
{
  if ((const legacy_drawing::Command *)a1 != a2)
  {
    legacy_drawing::Command::Command((uint64_t)v5, a2);
    legacy_drawing::swap(a1, (legacy_drawing::Command *)v5, v3);
    legacy_drawing::Command::~Command((legacy_drawing::Command *)v5);
  }
  return a1;
}

uint64_t legacy_drawing::swap(uint64_t this, legacy_drawing::Command *a2, legacy_drawing::Command *a3)
{
  int v3 = *(_DWORD *)(this + 100);
  *(_DWORD *)(this + 10std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *((_DWORD *)a2 + 25);
  *((_DWORD *)a2 + 25) = v3;
  uint64_t v4 = *(void *)(this + 48);
  *(void *)(this + 4_Block_object_dispose(&STACK[0x260], 8) = *((void *)a2 + 6);
  *((void *)a2 + 6) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 96);
  *(_DWORD *)(this + 96) = *((_DWORD *)a2 + 24);
  *((_DWORD *)a2 + 24) = v4;
  uint64_t v5 = *(void *)(this + 40);
  *(void *)(this + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *((void *)a2 + 5);
  *((void *)a2 + 5) = v5;
  uint64_t v6 = *(void *)(this + 8);
  *(void *)(this + _Block_object_dispose(&STACK[0x260], 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v6;
  uint64_t v7 = *(void *)(this + 64);
  *(void *)(this + 64) = *((void *)a2 + 8);
  *((void *)a2 + _Block_object_dispose(&STACK[0x260], 8) = v7;
  uint64_t v8 = *(void *)(this + 72);
  *(void *)(this + 72) = *((void *)a2 + 9);
  *((void *)a2 + 9) = v8;
  uint64_t v9 = *(void *)(this + 80);
  *(void *)(this + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *((void *)a2 + 10);
  *((void *)a2 + 1std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v9;
  uint64_t v10 = *(void *)(this + 88);
  *(void *)(this + 8_Block_object_dispose(&STACK[0x260], 8) = *((void *)a2 + 11);
  *((void *)a2 + 11) = v10;
  uint64_t v11 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v11;
  uint64_t v12 = *(void *)(this + 32);
  *(void *)(this + 32) = *((void *)a2 + 4);
  *((void *)a2 + 4) = v12;
  uint64_t v13 = *(void *)(this + 24);
  *(void *)(this + 24) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v13;
  uint64_t v14 = *(void *)(this + 56);
  *(void *)(this + 56) = *((void *)a2 + 7);
  *((void *)a2 + 7) = v14;
  return this;
}

uint64_t legacy_drawing::Command::Command(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F1FB05B8;
  *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = 0u;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(void *)(a1 + 8_Block_object_dispose(&STACK[0x260], 8) = 0;
  *(_DWORD *)(a1 + 10std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(_DWORD *)(a2 + 100);
  *(_DWORD *)(a2 + 10std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a2 + 4_Block_object_dispose(&STACK[0x260], 8) = 0;
  uint64_t v6 = *(void *)(a1 + 48);
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x260], 8) = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  uint64_t v8 = *(void *)(a1 + 40);
  *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v7;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  uint64_t v9 = (void **)(a1 + 64);
  uint64_t v10 = *(void *)(a2 + 8);
  *(void *)(a2 + _Block_object_dispose(&STACK[0x260], 8) = 0;
  uint64_t v11 = *v4;
  *uint64_t v4 = v10;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  if (*v9)
  {
    std::vector<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::__clear[abi:ne180100]((void *)(a1 + 64));
    operator delete(*v9);
    *uint64_t v9 = 0;
    *(void *)(a1 + 72) = 0;
    *(void *)(a1 + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  }
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(a2 + 80);
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  uint64_t v12 = *(void *)(a2 + 88);
  *(void *)(a2 + 8_Block_object_dispose(&STACK[0x260], 8) = 0;
  uint64_t v13 = *(void *)(a1 + 88);
  *(void *)(a1 + 8_Block_object_dispose(&STACK[0x260], 8) = v12;
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  }
  uint64_t v14 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v15 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v14;
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  }
  uint64_t v16 = *(void *)(a2 + 32);
  *(void *)(a2 + 32) = 0;
  uint64_t v17 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v16;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
  uint64_t v18 = *(void *)(a2 + 24);
  *(void *)(a2 + 24) = 0;
  uint64_t v19 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v18;
  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
  }
  uint64_t v20 = *(void *)(a2 + 56);
  *(void *)(a2 + 56) = 0;
  uint64_t v21 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v20;
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
  }
  return a1;
}

uint64_t legacy_drawing::Command::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    legacy_drawing::Command::Command((uint64_t)v5, a2);
    legacy_drawing::swap(a1, (legacy_drawing::Command *)v5, v3);
    legacy_drawing::Command::~Command((legacy_drawing::Command *)v5);
  }
  return a1;
}

uint64_t legacy_drawing::Command::formatText(legacy_drawing::Command *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "baseValues");
  }
  uint64_t v6 = *((void *)this + 2);
  if (v6) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v6 + 32))(v6, a2, "bounds");
  }
  uint64_t v7 = *((void *)this + 3);
  if (v7) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v7 + 32))(v7, a2, "clipNormal");
  }
  uint64_t v8 = *((void *)this + 4);
  if (v8) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v8 + 32))(v8, a2, "clipOrigin");
  }
  uint64_t v9 = *((void *)this + 5);
  if (v9) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v9 + 32))(v9, a2, "color");
  }
  uint64_t v10 = *((void *)this + 6);
  if (v10) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v10 + 32))(v10, a2, "commandID");
  }
  uint64_t v11 = *((void *)this + 7);
  if (v11) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v11 + 32))(v11, a2, "parameters");
  }
  uint64_t v12 = (uint64_t *)*((void *)this + 8);
  uint64_t v13 = (uint64_t *)*((void *)this + 9);
  while (v12 != v13)
  {
    uint64_t v14 = *v12++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v14 + 32))(v14, a2, "path");
  }
  uint64_t v15 = *((void *)this + 11);
  if (v15) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v15 + 32))(v15, a2, "timestamp");
  }
  if (*((unsigned char *)this + 100)) {
    PB::TextFormatter::format(a2, "type");
  }

  return MEMORY[0x1F4147498](a2);
}

uint64_t legacy_drawing::Command::readFrom(legacy_drawing::Command *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
      break;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_21:
    if ((v11 & 7) == 4)
    {
      int v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        operator new();
      case 2u:
        *((unsigned char *)this + 100) |= 1u;
        unint64_t v20 = *((void *)a2 + 1);
        unint64_t v21 = *((void *)a2 + 2);
        uint64_t v22 = *(void *)a2;
        if (v20 <= 0xFFFFFFFFFFFFFFF5 && v20 + 10 <= v21)
        {
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          do
          {
            unint64_t v26 = v20 + 1;
            *((void *)a2 + 1) = v20 + 1;
            char v27 = *(unsigned char *)(v22 + v20);
            v25 |= (unint64_t)(v27 & 0x7F) << v23;
            if ((v27 & 0x80) == 0) {
              goto LABEL_54;
            }
            v23 += 7;
            unint64_t v20 = v26;
            BOOL v14 = v24++ > 8;
          }
          while (!v14);
LABEL_45:
          LODWORD(v25) = 0;
          goto LABEL_54;
        }
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v25 = 0;
        if (v21 <= v20) {
          unint64_t v21 = *((void *)a2 + 1);
        }
        break;
      case 3u:
        operator new();
      case 4u:
        operator new();
      case 5u:
        operator new();
      case 6u:
        operator new();
      case 7u:
        operator new();
      case 8u:
        operator new();
      case 9u:
        operator new();
      case 0xAu:
        operator new();
      default:
        goto LABEL_19;
    }
    while (1)
    {
      if (v21 == v20)
      {
        LODWORD(v25) = 0;
        *((unsigned char *)a2 + 24) = 1;
        goto LABEL_54;
      }
      unint64_t v30 = v20 + 1;
      char v31 = *(unsigned char *)(v22 + v20);
      *((void *)a2 + 1) = v30;
      v25 |= (unint64_t)(v31 & 0x7F) << v28;
      if ((v31 & 0x80) == 0) {
        break;
      }
      v28 += 7;
      unint64_t v20 = v30;
      BOOL v14 = v29++ > 8;
      if (v14) {
        goto LABEL_45;
      }
    }
    if (*((unsigned char *)a2 + 24)) {
      LODWORD(v25) = 0;
    }
LABEL_54:
    *((_DWORD *)this + 24) = v25;
LABEL_46:
    unint64_t v2 = *((void *)a2 + 1);
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0) {
      return v4 == 0;
    }
  }
  char v15 = 0;
  unsigned int v16 = 0;
  unint64_t v11 = 0;
  if (v2 > v3) {
    unint64_t v3 = v2;
  }
  do
  {
    if (v3 == v2)
    {
      int v4 = 1;
      *((unsigned char *)a2 + 24) = 1;
      return v4 == 0;
    }
    unint64_t v17 = v2 + 1;
    char v18 = *(unsigned char *)(v8 + v2);
    *((void *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0) {
      goto LABEL_21;
    }
    v15 += 7;
    unint64_t v2 = v17;
    BOOL v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  uint64_t result = PB::Reader::skip(a2);
  if (result) {
    goto LABEL_46;
  }
  return result;
}

void sub_1C47DC93C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t legacy_drawing::Command::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 48);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  if (*(unsigned char *)(v3 + 100)) {
    this = PB::Writer::writeVarInt(a2);
  }
  uint64_t v5 = *(const PB::Base **)(v3 + 40);
  if (v5) {
    this = PB::Writer::writeSubmessage(a2, v5);
  }
  uint64_t v6 = *(const PB::Base **)(v3 + 8);
  if (v6) {
    this = PB::Writer::writeSubmessage(a2, v6);
  }
  uint64_t v7 = *(const PB::Base ***)(v3 + 64);
  uint64_t v8 = *(const PB::Base ***)(v3 + 72);
  while (v7 != v8)
  {
    char v9 = *v7++;
    this = PB::Writer::writeSubmessage(a2, v9);
  }
  unsigned int v10 = *(const PB::Base **)(v3 + 88);
  if (v10) {
    this = PB::Writer::writeSubmessage(a2, v10);
  }
  unint64_t v11 = *(const PB::Base **)(v3 + 16);
  if (v11) {
    this = PB::Writer::writeSubmessage(a2, v11);
  }
  unint64_t v12 = *(const PB::Base **)(v3 + 32);
  if (v12) {
    this = PB::Writer::writeSubmessage(a2, v12);
  }
  char v13 = *(const PB::Base **)(v3 + 24);
  if (v13) {
    this = PB::Writer::writeSubmessage(a2, v13);
  }
  BOOL v14 = *(const PB::Base **)(v3 + 56);
  if (v14)
  {
    return PB::Writer::writeSubmessage(a2, v14);
  }
  return this;
}

BOOL legacy_drawing::Command::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a2 + 48);
  if (v4)
  {
    if (!v5 || !legacy_drawing::CommandID::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  if (*(unsigned char *)(a1 + 100))
  {
    if ((*(unsigned char *)(a2 + 100) & 1) == 0 || *(_DWORD *)(a1 + 96) != *(_DWORD *)(a2 + 96)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 100))
  {
    return 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a2 + 40);
  if (v6)
  {
    if (!v7 || !legacy_drawing::Color::operator==(v6, v7)) {
      return 0;
    }
  }
  else if (v7)
  {
    return 0;
  }
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a2 + 8);
  if (v8)
  {
    if (!v9 || !legacy_drawing::Point::operator==(v8, v9)) {
      return 0;
    }
  }
  else if (v9)
  {
    return 0;
  }
  unsigned int v10 = *(uint64_t **)(a1 + 64);
  unint64_t v11 = *(uint64_t **)(a1 + 72);
  unint64_t v12 = *(uint64_t **)(a2 + 64);
  if ((char *)v11 - (char *)v10 != *(void *)(a2 + 72) - (void)v12) {
    return 0;
  }
  while (v10 != v11)
  {
    BOOL result = legacy_drawing::Point::operator==(*v10, *v12);
    if (!result) {
      return result;
    }
    ++v10;
    ++v12;
  }
  uint64_t v14 = *(void *)(a1 + 88);
  uint64_t v15 = *(void *)(a2 + 88);
  if (v14)
  {
    if (!v15 || !legacy_drawing::CommandID::operator==(v14, v15)) {
      return 0;
    }
  }
  else if (v15)
  {
    return 0;
  }
  uint64_t v16 = *(void *)(a1 + 16);
  uint64_t v17 = *(void *)(a2 + 16);
  if (v16)
  {
    if (!v17 || !legacy_drawing::Rectangle::operator==(v16, v17)) {
      return 0;
    }
  }
  else if (v17)
  {
    return 0;
  }
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void *)(a2 + 32);
  if (v18)
  {
    if (!v19 || !legacy_drawing::Point::operator==(v18, v19)) {
      return 0;
    }
  }
  else if (v19)
  {
    return 0;
  }
  uint64_t v20 = *(void *)(a1 + 24);
  uint64_t v21 = *(void *)(a2 + 24);
  if (!v20)
  {
    if (!v21) {
      goto LABEL_43;
    }
    return 0;
  }
  if (!v21 || !legacy_drawing::Point::operator==(v20, v21)) {
    return 0;
  }
LABEL_43:
  uint64_t v22 = *(void *)(a1 + 56);
  uint64_t v23 = *(void *)(a2 + 56);
  BOOL result = (v22 | v23) == 0;
  if (v22 && v23)
  {
    uint64_t v24 = *(void *)(a1 + 56);
    return legacy_drawing::Parameters::operator==(v24, v23);
  }
  return result;
}

unint64_t legacy_drawing::Command::hash_value(legacy_drawing::Command *this)
{
  uint64_t v2 = *((void *)this + 6);
  if (!v2)
  {
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if ((*(unsigned char *)(v2 + 20) & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)(v2 + 20) & 4) != 0) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v4 = 0;
    if ((*(unsigned char *)(v2 + 20) & 2) != 0) {
      goto LABEL_5;
    }
LABEL_9:
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  uint64_t v3 = *(unsigned int *)(v2 + 8);
  if ((*(unsigned char *)(v2 + 20) & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = *(unsigned int *)(v2 + 16);
  if ((*(unsigned char *)(v2 + 20) & 2) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = *(unsigned int *)(v2 + 12);
LABEL_10:
  uint64_t v6 = v4 ^ v3 ^ v5;
LABEL_11:
  if (*((unsigned char *)this + 100)) {
    uint64_t v7 = *((unsigned int *)this + 24);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = (legacy_drawing::Color *)*((void *)this + 5);
  if (v8) {
    uint64_t v9 = legacy_drawing::Color::hash_value(v8);
  }
  else {
    uint64_t v9 = 0;
  }
  unsigned int v10 = (legacy_drawing::Point *)*((void *)this + 1);
  if (v10) {
    uint64_t v11 = legacy_drawing::Point::hash_value(v10);
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = (legacy_drawing::Point **)*((void *)this + 8);
  char v13 = (legacy_drawing::Point **)*((void *)this + 9);
  if (v12 == v13)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = *v12++;
      v14 ^= legacy_drawing::Point::hash_value(v15);
    }
    while (v12 != v13);
  }
  uint64_t v16 = *((void *)this + 11);
  if (!v16)
  {
    uint64_t v20 = 0;
    goto LABEL_35;
  }
  if ((*(unsigned char *)(v16 + 20) & 1) == 0)
  {
    uint64_t v17 = 0;
    if ((*(unsigned char *)(v16 + 20) & 4) != 0) {
      goto LABEL_28;
    }
LABEL_32:
    uint64_t v18 = 0;
    if ((*(unsigned char *)(v16 + 20) & 2) != 0) {
      goto LABEL_29;
    }
LABEL_33:
    uint64_t v19 = 0;
    goto LABEL_34;
  }
  uint64_t v17 = *(unsigned int *)(v16 + 8);
  if ((*(unsigned char *)(v16 + 20) & 4) == 0) {
    goto LABEL_32;
  }
LABEL_28:
  uint64_t v18 = *(unsigned int *)(v16 + 16);
  if ((*(unsigned char *)(v16 + 20) & 2) == 0) {
    goto LABEL_33;
  }
LABEL_29:
  uint64_t v19 = *(unsigned int *)(v16 + 12);
LABEL_34:
  uint64_t v20 = v18 ^ v17 ^ v19;
LABEL_35:
  uint64_t v21 = (legacy_drawing::Rectangle *)*((void *)this + 2);
  if (v21) {
    uint64_t v22 = legacy_drawing::Rectangle::hash_value(v21);
  }
  else {
    uint64_t v22 = 0;
  }
  uint64_t v23 = (legacy_drawing::Point *)*((void *)this + 4);
  if (v23) {
    uint64_t v24 = legacy_drawing::Point::hash_value(v23);
  }
  else {
    uint64_t v24 = 0;
  }
  uint64_t v25 = (legacy_drawing::Point *)*((void *)this + 3);
  if (v25) {
    uint64_t v26 = legacy_drawing::Point::hash_value(v25);
  }
  else {
    uint64_t v26 = 0;
  }
  unint64_t v27 = *((void *)this + 7);
  if (v27) {
    unint64_t v27 = legacy_drawing::Parameters::hash_value((legacy_drawing::Parameters *)v27);
  }
  return v7 ^ v6 ^ v20 ^ v22 ^ v24 ^ v26 ^ v27 ^ v9 ^ v11 ^ v14;
}

uint64_t legacy_drawing::Command::makeCommandID(uint64_t this)
{
  if (!*(void *)(this + 48)) {
    operator new();
  }
  return this;
}

uint64_t legacy_drawing::Command::makeColor(uint64_t this)
{
  if (!*(void *)(this + 40)) {
    operator new();
  }
  return this;
}

uint64_t legacy_drawing::Command::makeBaseValues(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

uint64_t legacy_drawing::Command::makeTimestamp(uint64_t this)
{
  if (!*(void *)(this + 88)) {
    operator new();
  }
  return this;
}

uint64_t legacy_drawing::Command::makeBounds(uint64_t this)
{
  if (!*(void *)(this + 16)) {
    operator new();
  }
  return this;
}

uint64_t legacy_drawing::Command::makeClipOrigin(uint64_t this)
{
  if (!*(void *)(this + 32)) {
    operator new();
  }
  return this;
}

uint64_t legacy_drawing::Command::makeClipNormal(uint64_t this)
{
  if (!*(void *)(this + 24)) {
    operator new();
  }
  return this;
}

uint64_t legacy_drawing::Command::makeParameters(uint64_t this)
{
  if (!*(void *)(this + 56)) {
    operator new();
  }
  return this;
}

double DKDOffsetForEdgeOfFrame(int a1, double a2, double a3, double a4, double a5)
{
  switch(a1)
  {
    case 0:
      double result = CGRectGetMinX(*(CGRect *)&a2);
      break;
    case 1:
      double result = CGRectGetMidX(*(CGRect *)&a2);
      break;
    case 2:
      double result = CGRectGetMaxX(*(CGRect *)&a2);
      break;
    case 3:
      double result = CGRectGetMinY(*(CGRect *)&a2);
      break;
    case 4:
      double result = CGRectGetMidY(*(CGRect *)&a2);
      break;
    case 5:
      double result = CGRectGetMaxY(*(CGRect *)&a2);
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

double DKDRectWithCenterAndSize(double a1, double a2, double a3)
{
  return a1 - a3 * 0.5;
}

double DKDRectWithPoints(double a1, double a2, double a3)
{
  if (a1 >= a3) {
    return a3;
  }
  else {
    return a1;
  }
}

double DKDRectWithSize()
{
  return 0.0;
}

double DKDRectWithSizeAlignedToRect(int a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v17.size.double height = a4;
  v17.size.double width = a3;
  v17.origin.double x = 0.0;
  v17.origin.double y = 0.0;
  CGRect v18 = CGRectStandardize(v17);
  double x = v18.origin.x;
  double width = v18.size.width;
  v18.origin.double x = a5;
  v18.origin.double y = a6;
  v18.size.double width = a7;
  v18.size.double height = a8;
  if (!CGRectIsNull(v18))
  {
    switch(a1)
    {
      case 3:
        v20.origin.double x = a5;
        v20.origin.double y = a6;
        v20.size.double width = a7;
        v20.size.double height = a8;
        double x = CGRectGetMaxX(v20) - width;
        break;
      case 2:
        v21.origin.double x = a5;
        v21.origin.double y = a6;
        v21.size.double width = a7;
        v21.size.double height = a8;
        double x = CGRectGetMidX(v21) + width * -0.5;
        break;
      case 1:
        v19.origin.double x = a5;
        v19.origin.double y = a6;
        v19.size.double width = a7;
        v19.size.double height = a8;
        double x = CGRectGetMinX(v19);
        break;
    }
    switch(a2)
    {
      case 3:
        v23.origin.double x = a5;
        v23.origin.double y = a6;
        v23.size.double width = a7;
        v23.size.double height = a8;
        CGRectGetMaxY(v23);
        break;
      case 2:
        v24.origin.double x = a5;
        v24.origin.double y = a6;
        v24.size.double width = a7;
        v24.size.double height = a8;
        CGRectGetMidY(v24);
        break;
      case 1:
        v22.origin.double x = a5;
        v22.origin.double y = a6;
        v22.size.double width = a7;
        v22.size.double height = a8;
        CGRectGetMinY(v22);
        break;
    }
  }
  return x;
}

double DKDUpdateFixedSizeRectToIncludePoint(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double v15 = a5 + a7 - CGRectGetMaxX(*(CGRect *)&a1);
  if (v15 <= 0.0) {
    double v15 = -0.0;
  }
  v21.origin.double x = a1 + v15;
  v21.origin.double y = a2;
  v21.size.double width = a3;
  v21.size.double height = a4;
  double v16 = v21.origin.x - fmax(CGRectGetMinX(v21) - (a5 - a7), 0.0);
  v22.origin.double x = v16;
  v22.origin.double y = a2;
  v22.size.double width = a3;
  v22.size.double height = a4;
  double v17 = a6 + a8 - CGRectGetMaxY(v22);
  if (v17 <= 0.0) {
    double v17 = -0.0;
  }
  CGFloat v18 = a2 + v17;
  v23.origin.double x = v16;
  v23.origin.double y = v18;
  v23.size.double width = a3;
  v23.size.double height = a4;
  CGRectGetMinY(v23);
  return v16;
}

double DKDUpdateFixedSizeRectToIncludeRectIfPossible(double a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9, double a10)
{
  v58.origin.double x = a5;
  v58.origin.double y = a6;
  v58.size.double width = a7;
  v58.size.double height = a8;
  if (!CGRectIsNull(v58))
  {
    v59.origin.double x = a5;
    v59.origin.double y = a6;
    v59.size.double width = a7;
    v59.size.double height = a8;
    double MinX = CGRectGetMinX(v59);
    v60.origin.double x = a5;
    v60.origin.double y = a6;
    v60.size.double width = a7;
    v60.size.double height = a8;
    double MinY = CGRectGetMinY(v60);
    double v27 = DKDUpdateFixedSizeRectToIncludePoint(a1, a2, a3, a4, MinX, MinY, a9, a10);
    CGFloat v52 = v28;
    double v55 = v27;
    CGFloat v50 = v29;
    CGFloat v31 = v30;
    v61.origin.double x = a5;
    v61.origin.double y = a6;
    v61.size.double width = a7;
    v61.size.double height = a8;
    double v32 = CGRectGetMinX(v61);
    v62.origin.double x = a5;
    v62.origin.double y = a6;
    v62.size.double width = a7;
    v62.size.double height = a8;
    double MaxY = CGRectGetMaxY(v62);
    double v34 = DKDUpdateFixedSizeRectToIncludePoint(v55, v52, v50, v31, v32, MaxY, a9, a10);
    CGFloat v53 = v35;
    double v56 = v34;
    CGFloat v51 = v36;
    CGFloat v38 = v37;
    v63.origin.double x = a5;
    v63.origin.double y = a6;
    v63.size.double width = a7;
    v63.size.double height = a8;
    double MaxX = CGRectGetMaxX(v63);
    v64.origin.double x = a5;
    v64.origin.double y = a6;
    v64.size.double width = a7;
    v64.size.double height = a8;
    double v40 = CGRectGetMinY(v64);
    double v57 = DKDUpdateFixedSizeRectToIncludePoint(v56, v53, v51, v38, MaxX, v40, a9, a10);
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v46 = v45;
    v65.origin.double x = a5;
    v65.origin.double y = a6;
    v65.size.double width = a7;
    v65.size.double height = a8;
    double v47 = CGRectGetMaxX(v65);
    v66.origin.double x = a5;
    v66.origin.double y = a6;
    v66.size.double width = a7;
    v66.size.double height = a8;
    double v48 = CGRectGetMaxY(v66);
    return DKDUpdateFixedSizeRectToIncludePoint(v57, v42, v44, v46, v47, v48, a9, a10);
  }
  return a1;
}

CGFloat DKDUpdateFixedSizeRectToFitInsideRectIfPossible(double a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v14 = a1;
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  v21.origin.double x = a5;
  v21.origin.double y = a6;
  v21.size.double width = a7;
  v21.size.double height = a8;
  if (MinX < CGRectGetMinX(v21))
  {
    v22.origin.double x = a5;
    v22.origin.double y = a6;
    v22.size.double width = a7;
    v22.size.double height = a8;
    double v14 = CGRectGetMinX(v22);
  }
  v23.origin.double x = v14;
  v23.origin.double y = a2;
  v23.size.double width = a3;
  v23.size.double height = a4;
  double MinY = CGRectGetMinY(v23);
  v24.origin.double x = a5;
  v24.origin.double y = a6;
  v24.size.double width = a7;
  v24.size.double height = a8;
  if (MinY < CGRectGetMinY(v24))
  {
    v25.origin.double x = a5;
    v25.origin.double y = a6;
    v25.size.double width = a7;
    v25.size.double height = a8;
    a2 = CGRectGetMinY(v25);
  }
  v26.origin.double x = v14;
  v26.origin.double y = a2;
  v26.size.double width = a3;
  v26.size.double height = a4;
  double MaxX = CGRectGetMaxX(v26);
  v27.origin.double x = a5;
  v27.origin.double y = a6;
  v27.size.double width = a7;
  v27.size.double height = a8;
  CGFloat v18 = v14 - fmax(MaxX - CGRectGetMaxX(v27), 0.0);
  v28.origin.double x = v18;
  v28.origin.double y = a2;
  v28.size.double width = a3;
  v28.size.double height = a4;
  CGRectGetMaxY(v28);
  v29.origin.double x = a5;
  v29.origin.double y = a6;
  v29.size.double width = a7;
  v29.size.double height = a8;
  CGRectGetMaxY(v29);
  return v18;
}

BOOL DKDEqualPoints(double a1, double a2, double a3, double a4, double a5)
{
  BOOL v5 = vabdd_f64(a1, a3) < a5;
  return vabdd_f64(a2, a4) < a5 && v5;
}

BOOL DKDNearlyEqualPoints(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) < 0.01;
  return vabdd_f64(a2, a4) < 0.01 && v4;
}

BOOL DKDNearlyEqualVectorFloat4(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vsubq_f32(a1, a2);
  return fabsf(v2.f32[0]) < 0.01 && fabsf(v2.f32[1]) < 0.01 && fabsf(v2.f32[2]) < 0.01 && fabsf(v2.f32[3]) < 0.01;
}

BOOL DKDEqualSizes(double a1, double a2, double a3, double a4, double a5)
{
  BOOL v5 = vabdd_f64(a1, a3) < a5;
  return vabdd_f64(a2, a4) < a5 && v5;
}

BOOL DKDNearlyEqualSizes(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) < 0.01;
  return vabdd_f64(a2, a4) < 0.01 && v4;
}

BOOL DKDNearlyEqualTransforms(double *a1, double *a2)
{
  return vabdd_f64(*a1, *a2) < 0.000000001
      && vabdd_f64(a1[1], a2[1]) < 0.000000001
      && vabdd_f64(a1[2], a2[2]) < 0.000000001
      && vabdd_f64(a1[3], a2[3]) < 0.000000001
      && vabdd_f64(a1[4], a2[4]) < 0.000000001
      && vabdd_f64(a1[5], a2[5]) < 0.000000001;
}

BOOL DKDEqualRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v17 = vabdd_f64(a2, a6);
  if (vabdd_f64(a1, a5) >= a9 || v17 >= a9) {
    return 0;
  }
  BOOL v20 = vabdd_f64(a3, a7) < a9;
  return vabdd_f64(a4, a8) < a9 && v20;
}

BOOL DKDNearlyEqualRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL result = 0;
  if (vabdd_f64(a1, a5) < 0.01 && vabdd_f64(a2, a6) < 0.01)
  {
    BOOL v9 = vabdd_f64(a3, a7) < 0.01;
    return vabdd_f64(a4, a8) < 0.01 && v9;
  }
  return result;
}

BOOL DKDNearlyContainsRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v18 = CGRectInset(*(CGRect *)&a1, -0.01, -0.01);
  double v12 = a5;
  double v13 = a6;
  double v14 = a7;
  double v15 = a8;

  return CGRectContainsRect(v18, *(CGRect *)&v12);
}

BOOL DKDCollinearPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return fabs((a3 - a1) * (a6 - a2) - (a4 - a2) * (a5 - a1)) < 8.90029543e-308;
}

BOOL DKDNearlyCollinearPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a3 - a1;
  return (v6 * (a6 - a2) - (a4 - a2) * (a5 - a1)) * (v6 * (a6 - a2) - (a4 - a2) * (a5 - a1)) < ((a4 - a2) * (a4 - a2)
                                                                                              + v6 * v6)
                                                                                             * 0.0001
                                                                                             * ((a6 - a2) * (a6 - a2)
                                                                                              + (a5 - a1) * (a5 - a1));
}

double DKDDistanceSquared(double a1, double a2, double a3, double a4)
{
  return (a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3);
}

BOOL DKDRectsOverlapVertically(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  v22.origin.double x = a5;
  v22.origin.double y = a6;
  v22.size.double width = a7;
  v22.size.double height = a8;
  double v16 = CGRectGetMinX(v22);
  v23.origin.double x = a1;
  v23.origin.double y = a2;
  v23.size.double width = a3;
  v23.size.double height = a4;
  double MaxX = CGRectGetMaxX(v23);
  v24.origin.double x = a5;
  v24.origin.double y = a6;
  v24.size.double width = a7;
  v24.size.double height = a8;
  double v18 = CGRectGetMaxX(v24);
  if (MinX <= v16) {
    return MaxX >= v16;
  }
  else {
    return v18 >= MinX;
  }
}

BOOL DKDRectsOverlapHorizontally(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinY = CGRectGetMinY(*(CGRect *)&a1);
  v22.origin.double x = a5;
  v22.origin.double y = a6;
  v22.size.double width = a7;
  v22.size.double height = a8;
  double v16 = CGRectGetMinY(v22);
  v23.origin.double x = a1;
  v23.origin.double y = a2;
  v23.size.double width = a3;
  v23.size.double height = a4;
  double MaxY = CGRectGetMaxY(v23);
  v24.origin.double x = a5;
  v24.origin.double y = a6;
  v24.size.double width = a7;
  v24.size.double height = a8;
  double v18 = CGRectGetMaxY(v24);
  if (MinY <= v16) {
    return MaxY >= v16;
  }
  else {
    return v18 >= MinY;
  }
}

uint64_t DKDLineIntersectsRect(CGFloat a1, CGFloat a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v12 = a4;
  double v13 = a3;
  while (1)
  {
    uint64_t v16 = p_ComputeOutcode(a1, a2, a5, a6, a7, a8);
    uint64_t v17 = p_ComputeOutcode(v13, v12, a5, a6, a7, a8);
    uint64_t result = 1;
    if (!v16 || !v17) {
      break;
    }
    if ((v17 & v16) != 0) {
      return 0;
    }
    double v19 = (v13 + a1) * 0.5;
    double v20 = (v12 + a2) * 0.5;
    int v21 = DKDLineIntersectsRect(1, a1, a2, v19, v20, a5, a6, a7, a8);
    a1 = v19;
    a2 = v20;
    double v13 = a3;
    double v12 = a4;
    if (v21) {
      return 1;
    }
  }
  return result;
}

uint64_t p_ComputeOutcode(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v14.origin.double x = a3;
  v14.origin.double y = a4;
  v14.size.double width = a5;
  v14.size.double height = a6;
  if (a2 <= CGRectGetMaxY(v14))
  {
    v15.origin.double x = a3;
    v15.origin.double y = a4;
    v15.size.double width = a5;
    v15.size.double height = a6;
    if (a2 < CGRectGetMinY(v15)) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 1;
  }
  v16.origin.double x = a3;
  v16.origin.double y = a4;
  v16.size.double width = a5;
  v16.size.double height = a6;
  if (a1 > CGRectGetMaxX(v16)) {
    return v12 | 4;
  }
  v17.origin.double x = a3;
  v17.origin.double y = a4;
  v17.size.double width = a5;
  v17.size.double height = a6;
  if (a1 < CGRectGetMinX(v17)) {
    return v12 | 8;
  }
  else {
    return v12;
  }
}

double DKDAveragePoints(double a1, double a2, double a3)
{
  return (a1 + a3) * 0.5;
}

double DKDNearestPointOnInfiniteLineToPoint(double *a1, double a2, double a3)
{
  double v3 = a1[1];
  double v4 = a1[2] - *a1;
  double v5 = a1[3] - v3;
  double v6 = 1.0 / sqrt(v5 * v5 + v4 * v4);
  return *a1 + v4 * v6 * ((a3 - v3) * (v5 * v6) + (a2 - *a1) * (v4 * v6));
}

double DKDNormalizePoint(double a1, double a2)
{
  return a1 * (1.0 / sqrt(a2 * a2 + a1 * a1));
}

double DKDSubtractPoints(double a1, double a2, double a3)
{
  return a1 - a3;
}

double DKDDotPoints(double a1, double a2, double a3, double a4)
{
  return a2 * a4 + a1 * a3;
}

double DKDAddPoints(double a1, double a2, double a3)
{
  return a1 + a3;
}

double DKDMultiplyPointScalar(double a1, double a2, double a3)
{
  return a1 * a3;
}

BOOL DKDSizeIsEmpty(double a1, double a2)
{
  return a2 == 0.0 || a1 == 0.0;
}

double DKDSizeWithMaxArea(double result, double a2, double a3, double a4)
{
  if (result * a2 <= a3 * a4) {
    return a3;
  }
  return result;
}

double DKDUnionRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL v8 = a7 <= 0.0;
  if (a8 > 0.0) {
    BOOL v8 = 0;
  }
  if (a3 > 0.0 || a4 > 0.0)
  {
    if (v8)
    {
      return a1;
    }
    else if (a1 < a5)
    {
      return a1;
    }
  }
  else if (v8)
  {
    return *MEMORY[0x1E4F1DB28];
  }
  return a5;
}

double DKDHorizontalSpacingRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  v31.origin.double x = a5;
  v31.origin.double y = a6;
  v31.size.double width = a7;
  CGFloat v24 = a7;
  v31.size.double height = a8;
  double v29 = fmax(MinX, CGRectGetMinX(v31));
  v32.origin.double x = a1;
  v32.origin.double y = a2;
  v32.size.double width = a3;
  v32.size.double height = a4;
  double MaxX = CGRectGetMaxX(v32);
  v33.origin.double x = a5;
  v33.origin.double y = a6;
  v33.size.double width = a7;
  v33.size.double height = a8;
  double v27 = fmin(MaxX, CGRectGetMaxX(v33));
  v34.origin.double x = a1;
  v34.origin.double y = a2;
  v34.size.double width = a3;
  v34.size.double height = a4;
  double MaxY = CGRectGetMaxY(v34);
  v35.origin.double x = a5;
  v35.origin.double y = a6;
  v35.size.double width = v24;
  v35.size.double height = a8;
  double v16 = fmin(MaxY, CGRectGetMaxY(v35));
  v36.origin.double x = a1;
  v36.origin.double y = a2;
  v36.size.double width = a3;
  v36.size.double height = a4;
  double MinY = CGRectGetMinY(v36);
  v37.origin.double x = a5;
  v37.origin.double y = a6;
  v37.size.double width = v24;
  v37.size.double height = a8;
  double v18 = fmax(MinY, CGRectGetMinY(v37));
  double v19 = v29;
  double v21 = v18 - v16;
  double v22 = v16;

  double v20 = v27 - v29;
  *(void *)&double result = (unint64_t)CGRectStandardize(*(CGRect *)&v19);
  return result;
}

double DKDVerticalSpacingRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  v31.origin.double x = a5;
  v31.origin.double y = a6;
  v31.size.double width = a7;
  CGFloat v24 = a7;
  v31.size.double height = a8;
  double v29 = fmin(MaxX, CGRectGetMaxX(v31));
  v32.origin.double x = a1;
  v32.origin.double y = a2;
  v32.size.double width = a3;
  v32.size.double height = a4;
  double MinX = CGRectGetMinX(v32);
  v33.origin.double x = a5;
  v33.origin.double y = a6;
  v33.size.double width = a7;
  v33.size.double height = a8;
  double v27 = fmax(MinX, CGRectGetMinX(v33));
  v34.origin.double x = a1;
  v34.origin.double y = a2;
  v34.size.double width = a3;
  v34.size.double height = a4;
  double MinY = CGRectGetMinY(v34);
  v35.origin.double x = a5;
  v35.origin.double y = a6;
  v35.size.double width = v24;
  v35.size.double height = a8;
  double v16 = fmax(MinY, CGRectGetMinY(v35));
  v36.origin.double x = a1;
  v36.origin.double y = a2;
  v36.size.double width = a3;
  v36.size.double height = a4;
  double MaxY = CGRectGetMaxY(v36);
  v37.origin.double x = a5;
  v37.origin.double y = a6;
  v37.size.double width = v24;
  v37.size.double height = a8;
  double v18 = fmin(MaxY, CGRectGetMaxY(v37));
  double v19 = v29;
  double v21 = v18 - v16;
  double v22 = v16;

  double v20 = v27 - v29;
  *(void *)&double result = (unint64_t)CGRectStandardize(*(CGRect *)&v19);
  return result;
}

BOOL DKDIntersectsRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (a1 < a5) {
    BOOL result = a1 + a3 > a5;
  }
  else {
    BOOL result = a5 + a7 > a1;
  }
  if (a2 >= a6)
  {
    if (a6 + a8 > a2) {
      return result;
    }
    return 0;
  }
  if (a2 + a4 <= a6) {
    return 0;
  }
  return result;
}

BOOL DKDPointInRectInclusive(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a3 + a5;
  return a1 >= a3 && a1 <= v6 && a2 >= a4 && a2 <= a4 + a6;
}

double DKDAddSizes(double a1, double a2, double a3)
{
  return a1 + a3;
}

double DKDSubtractSizes(double a1, double a2, double a3)
{
  return a1 - a3;
}

double DKDMultiplyPointBySize(double a1, double a2, double a3)
{
  return a1 * a3;
}

double DKDMultiplySizeScalar(double a1, double a2, double a3)
{
  return a1 * a3;
}

double DKDFlooredSize(double a1)
{
  return floor(a1);
}

double DKDMultiplyRectScalar(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v9 = a1;
  if (!CGRectIsInfinite(*(CGRect *)&a1))
  {
    v11.origin.double x = v9;
    v11.origin.double y = a2;
    v11.size.double width = a3;
    v11.size.double height = a4;
    if (!CGRectIsNull(v11)) {
      return v9 * a5;
    }
  }
  return v9;
}

double DKDFlooredPoint(double a1)
{
  return floor(a1);
}

double DKDPointLength(double a1, double a2)
{
  return sqrt(a2 * a2 + a1 * a1);
}

double DKDPointSquaredLength(double a1, double a2)
{
  return a2 * a2 + a1 * a1;
}

double DKDDistance(double a1, double a2, double a3, double a4)
{
  return sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

double DKDOrthogonalDistance(double a1, double a2, double a3, double a4)
{
  double v4 = a1 - a3;
  if (v4 < 0.0) {
    double v4 = -v4;
  }
  double v5 = a2 - a4;
  if (v5 < 0.0) {
    double v5 = -v5;
  }
  return v4 + v5;
}

void DKDDistanceToRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v16.origin.double x = a3;
  v16.origin.double y = a4;
  v16.size.double width = a5;
  v16.size.double height = a6;
  if (a1 < CGRectGetMinX(v16))
  {
    v17.origin.double x = a3;
    v17.origin.double y = a4;
    v17.size.double width = a5;
    v17.size.double height = a6;
    if (a2 < CGRectGetMinY(v17))
    {
      v18.origin.double x = a3;
      v18.origin.double y = a4;
      v18.size.double width = a5;
      v18.size.double height = a6;
      CGRectGetMinX(v18);
LABEL_7:
      v22.origin.double x = a3;
      v22.origin.double y = a4;
      v22.size.double width = a5;
      v22.size.double height = a6;
      CGRectGetMinY(v22);
      return;
    }
    v23.origin.double x = a3;
    v23.origin.double y = a4;
    v23.size.double width = a5;
    v23.size.double height = a6;
    double MaxY = CGRectGetMaxY(v23);
    v24.origin.double x = a3;
    v24.origin.double y = a4;
    v24.size.double width = a5;
    v24.size.double height = a6;
    CGRectGetMinX(v24);
    if (a2 <= MaxY) {
      return;
    }
LABEL_13:
    v28.origin.double x = a3;
    v28.origin.double y = a4;
    v28.size.double width = a5;
    v28.size.double height = a6;
    CGRectGetMaxY(v28);
    return;
  }
  v19.origin.double x = a3;
  v19.origin.double y = a4;
  v19.size.double width = a5;
  v19.size.double height = a6;
  double MaxX = CGRectGetMaxX(v19);
  v20.origin.double x = a3;
  v20.origin.double y = a4;
  v20.size.double width = a5;
  v20.size.double height = a6;
  double MinY = CGRectGetMinY(v20);
  if (a1 <= MaxX)
  {
    if (a2 >= MinY)
    {
      v29.origin.double x = a3;
      v29.origin.double y = a4;
      v29.size.double width = a5;
      v29.size.double height = a6;
      if (a2 > CGRectGetMaxY(v29))
      {
        v30.origin.double x = a3;
        v30.origin.double y = a4;
        v30.size.double width = a5;
        v30.size.double height = a6;
        CGRectGetMaxY(v30);
      }
    }
    else
    {
      v25.origin.double x = a3;
      v25.origin.double y = a4;
      v25.size.double width = a5;
      v25.size.double height = a6;
      CGRectGetMinY(v25);
    }
    return;
  }
  if (a2 < MinY)
  {
    v21.origin.double x = a3;
    v21.origin.double y = a4;
    v21.size.double width = a5;
    v21.size.double height = a6;
    CGRectGetMaxX(v21);
    goto LABEL_7;
  }
  v26.origin.double x = a3;
  v26.origin.double y = a4;
  v26.size.double width = a5;
  v26.size.double height = a6;
  double v15 = CGRectGetMaxY(v26);
  v27.origin.double x = a3;
  v27.origin.double y = a4;
  v27.size.double width = a5;
  v27.size.double height = a6;
  CGRectGetMaxX(v27);
  if (a2 > v15) {
    goto LABEL_13;
  }
}

double DKDDistanceToRectFromRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double v14 = a1;
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v25.origin.double x = v14;
  v25.origin.double y = a2;
  v25.size.double width = a3;
  v25.size.double height = a4;
  double MidY = CGRectGetMidY(v25);
  double v17 = a5 + a7;
  if (MidX <= a5 + a7) {
    double v17 = MidX;
  }
  if (MidX < a5) {
    double v17 = a5;
  }
  double v18 = a6 + a8;
  if (MidY <= a6 + a8) {
    double v18 = MidY;
  }
  if (MidY >= a6) {
    double v19 = v18;
  }
  else {
    double v19 = a6;
  }
  if (v17 >= v14)
  {
    double v20 = v14 + a3;
    BOOL v21 = v17 <= v14 + a3;
    double v14 = v17;
    if (!v21) {
      double v14 = v20;
    }
  }
  if (v19 >= a2)
  {
    double v22 = a2 + a4;
    BOOL v21 = v19 <= a2 + a4;
    a2 = v19;
    if (!v21) {
      a2 = v22;
    }
  }
  return sqrt((v19 - a2) * (v19 - a2) + (v17 - v14) * (v17 - v14));
}

double DKDClampPointInRect(double a1, double a2, double a3, double a4, double a5)
{
  if (a1 >= a3)
  {
    double v5 = a3 + a5;
    a3 = a1;
    if (a1 > v5) {
      return v5;
    }
  }
  return a3;
}

double DKDCenterOfRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.double x = a1;
  v10.origin.double y = a2;
  v10.size.double width = a3;
  v10.size.double height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

BOOL DKDPercentRectInsideRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v9 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  return CGRectEqualToRect(v9, *MEMORY[0x1E4F1DB20]);
}

double DKDRectGetMinPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  v10.origin.double x = a1;
  v10.origin.double y = a2;
  v10.size.double width = a3;
  v10.size.double height = a4;
  CGRectGetMinY(v10);
  return MinX;
}

double DKDRectGetMaxPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  v10.origin.double x = a1;
  v10.origin.double y = a2;
  v10.size.double width = a3;
  v10.size.double height = a4;
  CGRectGetMaxY(v10);
  return MaxX;
}

double DKDRectGetBottomLeftPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  v10.origin.double x = a1;
  v10.origin.double y = a2;
  v10.size.double width = a3;
  v10.size.double height = a4;
  CGRectGetMaxY(v10);
  return MinX;
}

double DKDRectGetTopRightPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  v10.origin.double x = a1;
  v10.origin.double y = a2;
  v10.size.double width = a3;
  v10.size.double height = a4;
  CGRectGetMinY(v10);
  return MaxX;
}

double DKDRectGetPointFromCorner(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  switch(a1)
  {
    case -1:
    case 8:
      double MaxX = CGRectGetMaxX(*(CGRect *)&a2);
      goto LABEL_8;
    case 1:
      double MinX = CGRectGetMinX(*(CGRect *)&a2);
      goto LABEL_6;
    case 2:
      double MinX = CGRectGetMaxX(*(CGRect *)&a2);
LABEL_6:
      double v10 = MinX;
      v13.origin.double x = a2;
      v13.origin.double y = a3;
      v13.size.double width = a4;
      v13.size.double height = a5;
      CGRectGetMinY(v13);
      break;
    case 4:
      double MaxX = CGRectGetMinX(*(CGRect *)&a2);
LABEL_8:
      double v10 = MaxX;
      v14.origin.double x = a2;
      v14.origin.double y = a3;
      v14.size.double width = a4;
      v14.size.double height = a5;
      CGRectGetMaxY(v14);
      break;
    default:
      double v10 = *MEMORY[0x1E4F1DAD8];
      break;
  }
  return v10;
}

double DKDComplexMultiplyPoint(double a1, double a2, double a3, double a4)
{
  return a1 * a3 - a2 * a4;
}

double DKDCrossPoints(double a1, double a2, double a3, double a4)
{
  return a2 * a3 - a1 * a4;
}

double DKDGrowRectToPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  if (!CGRectIsNull(*(CGRect *)&a1))
  {
    v13.origin.double x = a1;
    v13.origin.double y = a2;
    v13.size.double width = a3;
    v13.size.double height = a4;
    double MinX = CGRectGetMinX(v13);
    if (MinX >= a5) {
      double v11 = a5;
    }
    else {
      double v11 = MinX;
    }
    v14.origin.double x = a1;
    v14.origin.double y = a2;
    v14.size.double width = a3;
    v14.size.double height = a4;
    CGRectGetMaxX(v14);
    v15.origin.double x = a1;
    v15.origin.double y = a2;
    v15.size.double width = a3;
    v15.size.double height = a4;
    CGRectGetMinY(v15);
    v16.origin.double x = a1;
    v16.origin.double y = a2;
    v16.size.double width = a3;
    v16.size.double height = a4;
    CGRectGetMaxY(v16);
    return v11;
  }
  return a5;
}

double DKDFlipRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGRectGetMidY(*(CGRect *)&a1);
  v14.origin.double x = a5;
  v14.origin.double y = a6;
  v14.size.double width = a7;
  v14.size.double height = a8;
  CGRectGetMidY(v14);
  return a1;
}

double DKDCenterRectOverRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v26.origin.double x = a5;
  v26.origin.double y = a6;
  v26.size.double width = a7;
  v26.size.double height = a8;
  double MidX = CGRectGetMidX(v26);
  v27.origin.double x = a5;
  v27.origin.double y = a6;
  v27.size.double width = a7;
  v27.size.double height = a8;
  double MidY = CGRectGetMidY(v27);
  v28.origin.double x = a1;
  v28.origin.double y = a2;
  v28.size.double width = a3;
  v28.size.double height = a4;
  double v17 = CGRectGetMidX(v28);
  v29.origin.double x = a1;
  v29.origin.double y = a2;
  v29.size.double width = a3;
  v29.size.double height = a4;
  double v18 = MidY - CGRectGetMidY(v29);
  CGFloat v19 = a1;
  CGFloat v20 = a2;
  CGFloat v21 = a3;
  CGFloat v22 = a4;

  *(void *)&double result = (unint64_t)CGRectOffset(*(CGRect *)&v19, MidX - v17, v18);
  return result;
}

uint64_t DKDRectIsFinite(double a1, double a2, double a3, double a4)
{
  uint64_t result = 0;
  if (fabs(a1) != INFINITY && fabs(a2) != INFINITY)
  {
    double v5 = fabs(a3);
    BOOL v6 = v5 < INFINITY;
    if (v5 > INFINITY) {
      BOOL v6 = 1;
    }
    double v7 = fabs(a4);
    BOOL v8 = v7 < INFINITY;
    if (v7 > INFINITY) {
      BOOL v8 = 1;
    }
    return v6 & v8;
  }
  return result;
}

uint64_t DKDPointIsFinite(double a1, double a2)
{
  double v2 = fabs(a1);
  BOOL v3 = v2 < INFINITY;
  if (v2 > INFINITY) {
    BOOL v3 = 1;
  }
  double v4 = fabs(a2);
  BOOL v5 = v4 < INFINITY;
  if (v4 > INFINITY) {
    BOOL v5 = 1;
  }
  return v3 & v5;
}

uint64_t DKDSizeIsFinite(double a1, double a2)
{
  double v2 = fabs(a1);
  BOOL v3 = v2 < INFINITY;
  if (v2 > INFINITY) {
    BOOL v3 = 1;
  }
  double v4 = fabs(a2);
  BOOL v5 = v4 < INFINITY;
  if (v4 > INFINITY) {
    BOOL v5 = 1;
  }
  return v3 & v5;
}

void DKDRectDivide(CGRect *a1, CGRect *a2, CGRectEdge a3, double a4, double a5, double a6, double a7, CGFloat a8)
{
  memset(v8, 0, sizeof(v8));
  if (!a1) {
    a1 = (CGRect *)v8;
  }
  if (!a2) {
    a2 = (CGRect *)v8;
  }
  CGRectDivide(*(CGRect *)&a4, a1, a2, a8, a3);
}

uint64_t DKDGetCanvasSpaceCorners(float64x2_t *a1, _OWORD *a2, _OWORD *a3, _OWORD *a4, _OWORD *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  v51[2] = *(double *)MEMORY[0x1E4F143B8];
  float64x2_t v18 = a1[1];
  v46[0] = *a1;
  v46[1] = v18;
  v46[2] = a1[2];
  DKDTransformedCornersOfRect(v46, &v47, &v49, &v50, v51, a6, a7, a8, a9);
  v52.origin.double x = a6;
  v52.origin.double y = a7;
  v52.size.double width = a8;
  v52.size.double height = a9;
  double MidX = CGRectGetMidX(v52);
  v53.origin.double x = a6;
  v53.origin.double y = a7;
  v53.size.double width = a8;
  v53.size.double height = a9;
  CGFloat MidY = CGRectGetMidY(v53);
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  double v23 = a1[2].f64[0] + MidY * a1[1].f64[0] + a1->f64[0] * MidX;
  double v24 = 1000000.0;
  double v25 = a1[2].f64[1] + MidY * a1[1].f64[1] + a1->f64[1] * MidX;
  CGRect v26 = (double *)&v48;
  do
  {
    long double v27 = atan2(*v26 - v25, *(v26 - 1) - v23) * 57.2957795;
    double v28 = fmod(v27, 360.0);
    BOOL v29 = v27 > 360.0 || v27 < 0.0;
    if (!v29) {
      double v28 = v27;
    }
    if (v28 < 0.0) {
      double v28 = v28 + 360.0;
    }
    if (v28 == 0.0) {
      double v30 = 225.0;
    }
    else {
      double v30 = 360.0 - v28 + -135.0;
    }
    double v31 = fabs(v30);
    if (v31 < v24)
    {
      uint64_t v21 = v22;
      double v24 = v31;
    }
    ++v22;
    v26 += 2;
  }
  while (v22 != 4);
  uint64_t v32 = (v21 + 2) & 3;
  if (v21 + 2 <= 0) {
    uint64_t v32 = -(-(v21 + 2) & 3);
  }
  long long v33 = *((_OWORD *)&v47 + v32);
  *a2 = *((_OWORD *)&v47 + v21);
  *a4 = v33;
  double v34 = a1->f64[1] * a1[1].f64[0] - a1->f64[0] * a1[1].f64[1];
  uint64_t v35 = v21 + 3;
  if (v34 > 0.0) {
    uint64_t v36 = v21 + 1;
  }
  else {
    uint64_t v36 = v21 + 3;
  }
  uint64_t v37 = v36 & 3;
  if (v34 <= 0.0) {
    uint64_t v35 = v21 + 1;
  }
  uint64_t v38 = -v36;
  BOOL v29 = v38 < 0;
  uint64_t v39 = v38 & 3;
  if (v29) {
    uint64_t v40 = v37;
  }
  else {
    uint64_t v40 = -v39;
  }
  *a5 = *((_OWORD *)&v47 + v40);
  uint64_t v41 = v35 & 3;
  uint64_t v42 = -v35;
  BOOL v29 = v42 < 0;
  uint64_t v43 = v42 & 3;
  if (v29) {
    uint64_t v44 = v41;
  }
  else {
    uint64_t v44 = -v43;
  }
  *a3 = *((_OWORD *)&v47 + v44);
  return v21;
}

double DKDAngleFromDelta(long double a1, long double a2)
{
  return atan2(a2, a1);
}

void DKDNormalizeAngleInDegrees(long double a1)
{
}

double DKDInterpolatePoints(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

double DKDMixPoints(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

uint64_t DKDMixBOOLs(uint64_t result, unsigned int a2, double a3)
{
  if (a3 > 0.5) {
    return a2;
  }
  else {
    return result;
  }
}

double DKDMixFloats(double a1, double a2, double a3)
{
  return a2 * a3 + a1 * (1.0 - a3);
}

double DKDNormalizedFloatInRange(double a1, double a2, double a3)
{
  return (a3 - a1) / (a2 - a1);
}

void DKDMixAnglesInDegrees(long double a1, long double a2, double a3)
{
  double v6 = fmod(a1, 360.0);
  if (a1 <= 360.0 && a1 >= 0.0) {
    double v6 = a1;
  }
  if (v6 < 0.0) {
    double v6 = v6 + 360.0;
  }
  if (v6 == 0.0) {
    double v8 = 0.0;
  }
  else {
    double v8 = v6;
  }
  double v9 = fmod(a2, 360.0);
  if (a2 <= 360.0 && a2 >= 0.0) {
    double v9 = a2;
  }
  if (v9 < 0.0) {
    double v9 = v9 + 360.0;
  }
  if (v9 == 0.0) {
    double v9 = 0.0;
  }
  if (vabdd_f64(v9, v8) > 180.0)
  {
    if (v8 <= v9) {
      double v9 = v9 + -360.0;
    }
    else {
      double v9 = v9 + 360.0;
    }
  }
  fmod(v9 * a3 + v8 * (1.0 - a3), 360.0);
}

void DKDDiffAngleInRadians(long double a1, long double a2)
{
}

void DKDNormalizeAngleInRadians(long double a1)
{
}

void DKDMixAnglesInRadians(long double a1, long double a2, double a3)
{
  double v6 = fmod(a1, 6.28318531);
  if (a1 <= 6.28318531 && a1 >= 0.0) {
    double v6 = a1;
  }
  if (v6 < 0.0) {
    double v6 = v6 + 6.28318531;
  }
  if (v6 == 0.0) {
    double v8 = 0.0;
  }
  else {
    double v8 = v6;
  }
  double v9 = fmod(a2, 6.28318531);
  if (a2 <= 6.28318531 && a2 >= 0.0) {
    double v9 = a2;
  }
  if (v9 < 0.0) {
    double v9 = v9 + 6.28318531;
  }
  if (v9 == 0.0) {
    double v9 = 0.0;
  }
  if (vabdd_f64(v9, v8) > 3.14159265)
  {
    if (v8 <= v9) {
      double v9 = v9 + -6.28318531;
    }
    else {
      double v9 = v9 + 6.28318531;
    }
  }
  fmod(v9 * a3 + v8 * (1.0 - a3), 6.28318531);
}

double DKDMixNormalizedAnglesInRadians(double a1, double a2, double a3)
{
  double v3 = vabdd_f64(a2, a1);
  double result = a2 * a3 + a1 * (1.0 - a3);
  if (v3 > 3.14159265)
  {
    double result = result + -3.14159265;
    if (result < 0.0) {
      return result + 6.28318531;
    }
  }
  return result;
}

double DKDMixSizes(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

double DKDMixRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a5 * a9 + a1 * (1.0 - a9);
}

double DKDTranslatedRectMaximizingOverlapWithRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v36.origin.double x = a5;
  v36.origin.double y = a6;
  v36.size.double width = a7;
  v36.size.double height = a8;
  double MaxX = CGRectGetMaxX(v36);
  double v34 = a1;
  v37.origin.double x = a1;
  v37.origin.double y = a2;
  v37.size.double width = a3;
  v37.size.double height = a4;
  if (MaxX > CGRectGetMaxX(v37))
  {
    v38.origin.double x = a5;
    v38.origin.double y = a6;
    v38.size.double width = a7;
    v38.size.double height = a8;
    double MinX = CGRectGetMinX(v38);
    v39.origin.double x = a1;
    v39.origin.double y = a2;
    v39.size.double width = a3;
    v39.size.double height = a4;
    if (MinX > CGRectGetMinX(v39))
    {
      v40.origin.double x = a5;
      v40.origin.double y = a6;
      v40.size.double width = a7;
      v40.size.double height = a8;
      double v29 = CGRectGetMaxX(v40);
      v41.origin.double x = a1;
      v41.origin.double y = a2;
      v41.size.double width = a3;
      v41.size.double height = a4;
      double v30 = v29 - CGRectGetMaxX(v41);
      v42.origin.double x = a5;
      v42.origin.double y = a6;
      v42.size.double width = a7;
      v42.size.double height = a8;
      double v28 = CGRectGetMinX(v42);
      v43.origin.double x = a1;
      v43.origin.double y = a2;
      v43.size.double width = a3;
      v43.size.double height = a4;
      double v17 = v28 - CGRectGetMinX(v43);
      if (v30 < v17) {
        double v17 = v30;
      }
      double v18 = a1 + v17;
LABEL_11:
      double v34 = v18;
      goto LABEL_12;
    }
  }
  v44.origin.double x = a5;
  v44.origin.double y = a6;
  v44.size.double width = a7;
  v44.size.double height = a8;
  double v19 = CGRectGetMinX(v44);
  v45.origin.double x = a1;
  v45.origin.double y = a2;
  v45.size.double width = a3;
  v45.size.double height = a4;
  if (v19 < CGRectGetMinX(v45))
  {
    v46.origin.double x = a5;
    v46.origin.double y = a6;
    v46.size.double width = a7;
    v46.size.double height = a8;
    double v20 = CGRectGetMaxX(v46);
    v47.origin.double x = a1;
    v47.origin.double y = a2;
    v47.size.double width = a3;
    v47.size.double height = a4;
    if (v20 < CGRectGetMaxX(v47))
    {
      v48.origin.double x = a1;
      v48.origin.double y = a2;
      v48.size.double width = a3;
      v48.size.double height = a4;
      double v31 = CGRectGetMinX(v48);
      v49.origin.double x = a5;
      v49.origin.double y = a6;
      v49.size.double width = a7;
      v49.size.double height = a8;
      double v32 = v31 - CGRectGetMinX(v49);
      v50.origin.double x = a1;
      v50.origin.double y = a2;
      v50.size.double width = a3;
      v50.size.double height = a4;
      double v21 = CGRectGetMaxX(v50);
      v51.origin.double x = a5;
      v51.origin.double y = a6;
      v51.size.double width = a7;
      v51.size.double height = a8;
      double v22 = v21 - CGRectGetMaxX(v51);
      if (v32 < v22) {
        double v22 = v32;
      }
      double v18 = a1 - v22;
      goto LABEL_11;
    }
  }
LABEL_12:
  v52.origin.double x = a5;
  v52.origin.double y = a6;
  v52.size.double width = a7;
  v52.size.double height = a8;
  double MaxY = CGRectGetMaxY(v52);
  v53.origin.double x = a1;
  v53.origin.double y = a2;
  v53.size.double width = a3;
  v53.size.double height = a4;
  if (MaxY <= CGRectGetMaxY(v53)) {
    goto LABEL_15;
  }
  v54.origin.double x = a5;
  v54.origin.double y = a6;
  v54.size.double width = a7;
  v54.size.double height = a8;
  double MinY = CGRectGetMinY(v54);
  v55.origin.double x = a1;
  v55.origin.double y = a2;
  v55.size.double width = a3;
  v55.size.double height = a4;
  if (MinY <= CGRectGetMinY(v55))
  {
LABEL_15:
    v60.origin.double x = a5;
    v60.origin.double y = a6;
    v60.size.double width = a7;
    v60.size.double height = a8;
    double v25 = CGRectGetMinY(v60);
    v61.origin.double x = a1;
    v61.origin.double y = a2;
    v61.size.double width = a3;
    v61.size.double height = a4;
    if (v25 < CGRectGetMinY(v61))
    {
      v62.origin.double x = a5;
      v62.origin.double y = a6;
      v62.size.double width = a7;
      v62.size.double height = a8;
      double v26 = CGRectGetMaxY(v62);
      v63.origin.double x = a1;
      v63.origin.double y = a2;
      v63.size.double width = a3;
      v63.size.double height = a4;
      if (v26 < CGRectGetMaxY(v63))
      {
        v64.origin.double x = a1;
        v64.origin.double y = a2;
        v64.size.double width = a3;
        v64.size.double height = a4;
        CGRectGetMinY(v64);
        v65.origin.double x = a5;
        v65.origin.double y = a6;
        v65.size.double width = a7;
        v65.size.double height = a8;
        CGRectGetMinY(v65);
        v66.origin.double x = a1;
        v66.origin.double y = a2;
        v66.size.double width = a3;
        v66.size.double height = a4;
        CGRectGetMaxY(v66);
        v67.origin.double x = a5;
        v67.origin.double y = a6;
        v67.size.double width = a7;
        v67.size.double height = a8;
        CGRectGetMaxY(v67);
      }
    }
  }
  else
  {
    v56.origin.double x = a5;
    v56.origin.double y = a6;
    v56.size.double width = a7;
    v56.size.double height = a8;
    CGRectGetMaxY(v56);
    v57.origin.double x = a1;
    v57.origin.double y = a2;
    v57.size.double width = a3;
    v57.size.double height = a4;
    CGRectGetMaxY(v57);
    v58.origin.double x = a5;
    v58.origin.double y = a6;
    v58.size.double width = a7;
    v58.size.double height = a8;
    CGRectGetMinY(v58);
    v59.origin.double x = a1;
    v59.origin.double y = a2;
    v59.size.double width = a3;
    v59.size.double height = a4;
    CGRectGetMinY(v59);
  }
  return v34;
}

double DKDRectByPinningEdgeToRect(int a1, double MinX, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  switch(a1)
  {
    case 0:
      v15.origin.double x = a6;
      v15.origin.double y = a7;
      v15.size.double width = a8;
      v15.size.double height = a9;
      double MinX = CGRectGetMinX(v15);
      break;
    case 1:
      v16.origin.double x = a6;
      v16.origin.double y = a7;
      v16.size.double width = a8;
      v16.size.double height = a9;
      CGRectGetMinY(v16);
      break;
    case 2:
      v17.origin.double x = a6;
      v17.origin.double y = a7;
      v17.size.double width = a8;
      v17.size.double height = a9;
      double MaxX = CGRectGetMaxX(v17);
      v18.origin.double x = MinX;
      v18.origin.double y = a3;
      v18.size.double width = a4;
      v18.size.double height = a5;
      double MinX = MaxX - CGRectGetWidth(v18);
      break;
    case 3:
      v19.origin.double x = a6;
      v19.origin.double y = a7;
      v19.size.double width = a8;
      v19.size.double height = a9;
      CGRectGetMaxY(v19);
      v20.origin.double x = MinX;
      v20.origin.double y = a3;
      v20.size.double width = a4;
      v20.size.double height = a5;
      CGRectGetHeight(v20);
      break;
    default:
      return MinX;
  }
  return MinX;
}

double DKDOriginRotate(double *a1, double a2, double a3)
{
  __double2 v5 = __sincos_stret(a3);
  double result = v5.__sinval * a2;
  *a1 = v5.__cosval * a2;
  a1[1] = v5.__sinval * a2;
  return result;
}

double DKDNiceAngleFromDelta(long double a1, long double a2)
{
  if (a2 != 0.0) {
    return atan2(a2, a1);
  }
  double result = 3.14159265;
  if (a1 >= 0.0) {
    return 0.0;
  }
  return result;
}

double DKDDeltaFromAngle(double a1)
{
  if (a1 == 0.0) {
    return 1.0;
  }
  return __sincos_stret(a1).__cosval;
}

double DKDShiftConstrainDelta(long double a1, long double a2)
{
  long double v4 = atan2(a2, a1);
  return sqrt(a2 * a2 + a1 * a1)
       * __sincos_stret((double)(int)((v4 + 6.28318531) / 0.785398163 + 0.5) * 0.785398163).__cosval;
}

double DKDShiftConstrainDeltaToAngle(double a1, double a2, double a3)
{
  return __sincos_stret(a3).__cosval * sqrt(a2 * a2 + a1 * a1);
}

double DKDRotatePoint90Degrees(int a1, double a2, double a3)
{
  if (a1) {
    return -a3;
  }
  else {
    return a3;
  }
}

void DKDNormalizeSignedDifferenceAngleInDegrees(double a1, double a2)
{
}

double DKDNormalizeDifferenceAngleInDegrees(double a1, double a2)
{
  double v2 = fmod(a1 - a2, 360.0);
  if (v2 > 180.0) {
    double v2 = v2 + -360.0;
  }
  if (v2 < -180.0) {
    double v2 = v2 + 360.0;
  }
  return fabs(v2);
}

void DKDNormalizeAngleAboutZeroInRadians(double a1)
{
}

double DKDDeltaApplyAffineTransform(float64x2_t *a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64(vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a3), *a1, a2)), vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], *(double *)(MEMORY[0x1E4F1DAD8] + 8)), *a1, *MEMORY[0x1E4F1DAD8])));
  return result;
}

void DKDDistanceBetweenAnglesInRadians(long double a1, long double a2)
{
}

double DKDNormalizedPointInRect(double a1, double a2, double a3, double a4, double a5)
{
  return (a1 - a3) / a5;
}

double DKDPointFromNormalizedRect(double a1, double a2, double a3, double a4, double a5)
{
  return a3 + a1 * a5;
}

void DKDRectFromNormalizedSubrect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v12.origin.double x = a5;
  v12.origin.double y = a6;
  v12.size.double width = a7;
  v12.size.double height = a8;
  CGRectGetMaxX(v12);
  v13.origin.double x = a5;
  v13.origin.double y = a6;
  v13.size.double width = a7;
  v13.size.double height = a8;
  CGRectGetMaxY(v13);
}

void DKDNormalizedSubrectInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRectGetMaxX(*(CGRect *)&a1);
  v8.origin.double x = a1;
  v8.origin.double y = a2;
  v8.size.double width = a3;
  v8.size.double height = a4;
  CGRectGetMaxY(v8);
}

double DKDRectSubtractingRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double v11 = a1;
  CGRect v42 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  CGFloat x = v42.origin.x;
  CGFloat y = v42.origin.y;
  CGFloat width = v42.size.width;
  CGFloat height = v42.size.height;
  if (!CGRectIsNull(v42))
  {
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v43);
    v44.origin.CGFloat x = v11;
    v44.origin.CGFloat y = a2;
    v44.size.CGFloat width = a3;
    v44.size.CGFloat height = a4;
    double MinY = CGRectGetMinY(v44);
    v45.origin.CGFloat x = v11;
    v45.origin.CGFloat y = a2;
    v45.size.CGFloat width = a3;
    v45.size.CGFloat height = a4;
    double v37 = CGRectGetMaxY(v45);
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    double v38 = v37 - CGRectGetMaxY(v46);
    v47.origin.CGFloat x = v11;
    v47.origin.CGFloat y = a2;
    v47.size.CGFloat width = a3;
    v47.size.CGFloat height = a4;
    double v33 = v38 * CGRectGetWidth(v47);
    CGFloat v36 = height;
    CGFloat v39 = x;
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    double v16 = CGRectGetMinY(v48);
    v49.origin.CGFloat x = v11;
    v49.origin.CGFloat y = a2;
    v49.size.CGFloat width = a3;
    v49.size.CGFloat height = a4;
    double v17 = v16 - CGRectGetMinY(v49);
    v50.origin.CGFloat x = v11;
    v50.origin.CGFloat y = a2;
    v50.size.CGFloat width = a3;
    v50.size.CGFloat height = a4;
    double v18 = v17 * CGRectGetWidth(v50);
    double v19 = v33;
    if (v18 <= v33)
    {
      double v35 = MaxY - MinY;
      CGRectEdge v21 = CGRectMinYEdge;
    }
    else
    {
      v51.origin.CGFloat x = v11;
      v51.origin.CGFloat y = a2;
      v51.size.CGFloat width = a3;
      v51.size.CGFloat height = a4;
      double v20 = CGRectGetMaxY(v51);
      v52.size.CGFloat height = v36;
      v52.origin.CGFloat x = v39;
      v52.origin.CGFloat y = y;
      v52.size.CGFloat width = width;
      double v35 = v20 - CGRectGetMinY(v52);
      CGRectEdge v21 = CGRectMaxYEdge;
      double v19 = v18;
    }
    v53.origin.CGFloat x = v11;
    v53.origin.CGFloat y = a2;
    v53.size.CGFloat width = a3;
    v53.size.CGFloat height = a4;
    double MaxX = CGRectGetMaxX(v53);
    v54.size.CGFloat height = v36;
    v54.origin.CGFloat x = v39;
    v54.origin.CGFloat y = y;
    v54.size.CGFloat width = width;
    double v23 = MaxX - CGRectGetMaxX(v54);
    v55.origin.CGFloat x = v11;
    v55.origin.CGFloat y = a2;
    v55.size.CGFloat width = a3;
    v55.size.CGFloat height = a4;
    double v24 = v23 * CGRectGetHeight(v55);
    if (v24 > v19)
    {
      v56.size.CGFloat height = v36;
      v56.origin.CGFloat x = v39;
      v56.origin.CGFloat y = y;
      v56.size.CGFloat width = width;
      double v25 = CGRectGetMaxX(v56);
      v57.origin.CGFloat x = v11;
      v57.origin.CGFloat y = a2;
      v57.size.CGFloat width = a3;
      v57.size.CGFloat height = a4;
      CGRectEdge v21 = CGRectMinXEdge;
      double v35 = v25 - CGRectGetMinX(v57);
      double v19 = v24;
    }
    v58.size.CGFloat height = v36;
    v58.origin.CGFloat x = v39;
    v58.origin.CGFloat y = y;
    v58.size.CGFloat width = width;
    double MinX = CGRectGetMinX(v58);
    v59.origin.CGFloat x = v11;
    v59.origin.CGFloat y = a2;
    v59.size.CGFloat width = a3;
    v59.size.CGFloat height = a4;
    double v27 = MinX - CGRectGetMinX(v59);
    v60.origin.CGFloat x = v11;
    v60.origin.CGFloat y = a2;
    v60.size.CGFloat width = a3;
    v60.size.CGFloat height = a4;
    CGFloat v28 = CGRectGetHeight(v60);
    double v29 = v35;
    if (v27 * v28 > v19)
    {
      v61.origin.CGFloat x = v11;
      v61.origin.CGFloat y = a2;
      v61.size.CGFloat width = a3;
      v61.size.CGFloat height = a4;
      double v30 = CGRectGetMaxX(v61);
      v62.size.CGFloat height = v36;
      v62.origin.CGFloat x = v39;
      v62.origin.CGFloat y = y;
      v62.size.CGFloat width = width;
      double v29 = v30 - CGRectGetMinX(v62);
      CGRectEdge v21 = CGRectMaxXEdge;
    }
    memset(&remainder, 0, sizeof(remainder));
    memset(&slice, 0, sizeof(slice));
    v63.origin.CGFloat x = v11;
    v63.origin.CGFloat y = a2;
    v63.size.CGFloat width = a3;
    v63.size.CGFloat height = a4;
    CGRectDivide(v63, &slice, &remainder, v29, v21);
    return remainder.origin.x;
  }
  return v11;
}

double DKDSizeWithAspectRatio(int a1, double result, double a3, double a4, double a5)
{
  BOOL v5 = result == a4 && a3 == a5;
  if (!v5 && a4 != 0.0 && a5 != 0.0 && a4 != 3.40282347e38 && a5 != 3.40282347e38)
  {
    if (a1)
    {
      double v6 = sqrt(a5 * a5 + a4 * a4);
      return a4 / v6 * (a3 * (a5 / v6) + result * (a4 / v6));
    }
    else if (vabdd_f64(result, a4) < 0.01)
    {
      return a3 * a4 / a5;
    }
  }
  return result;
}

double DKDSizeExpandedToMatchAspectRatio(double result, double a2, double a3, double a4)
{
  BOOL v4 = result != a3;
  if (a2 != a4) {
    BOOL v4 = 1;
  }
  BOOL v5 = a3 <= 0.0 || !v4;
  if (!v5 && a4 > 0.0)
  {
    double v6 = a3 / a4;
    if (v6 > result / a2) {
      return a2 * v6;
    }
  }
  return result;
}

double DKDScaleSizeWithinSize(double a1, double a2, double a3, double a4)
{
  if (a1 / a2 < a3 / a4) {
    return a1 * (a4 / a2);
  }
  return a3;
}

double DKDShrinkSizeToFitInSize(double result, double a2, double a3, double a4)
{
  if (result <= a3)
  {
    BOOL v4 = a2 == a4;
    BOOL v5 = a2 < a4;
  }
  else
  {
    BOOL v4 = 0;
    BOOL v5 = 0;
  }
  if (!v5 && !v4)
  {
    if (result / a2 <= a3 / a4)
    {
      if (result / a2 < a3 / a4) {
        return result * (a4 / a2);
      }
      else {
        return a3;
      }
    }
    else
    {
      return a3;
    }
  }
  return result;
}

double DKDFitOrFillSizeInSize(int a1, double a2, double a3, double a4, double a5)
{
  double v5 = a4 / a2;
  double v6 = a5 / a3;
  if (v5 >= v6) {
    double v7 = v5;
  }
  else {
    double v7 = v6;
  }
  if (v5 >= v6) {
    double v5 = v6;
  }
  if (a1) {
    double v5 = v7;
  }
  return a2 * v5;
}

double DKDFitOrFillSizeInRect(int a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  double v11 = a6 / a2;
  if (a6 / a2 >= a7 / a3) {
    double v12 = a6 / a2;
  }
  else {
    double v12 = a7 / a3;
  }
  if (a6 / a2 >= a7 / a3) {
    double v11 = a7 / a3;
  }
  if (a1) {
    double v13 = v12;
  }
  else {
    double v13 = v11;
  }
  return DKDCenterRectOverRect(0.0, 0.0, a2 * v13, a3 * v13, a4, a5, a6, a7);
}

void DKDScaleRectAroundPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7)
{
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, -a5, -a6);
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, a7, a7);
  memset(&v16, 0, sizeof(v16));
  CGAffineTransform t1 = v18;
  CGAffineTransform t2 = v17;
  CGAffineTransformConcat(&v15, &t1, &t2);
  CGAffineTransform t1 = v18;
  CGAffineTransformInvert(&v12, &t1);
  CGAffineTransformConcat(&v16, &v15, &v12);
  CGAffineTransform t1 = v16;
  v19.origin.CGFloat x = a1;
  v19.origin.CGFloat y = a2;
  v19.size.CGFloat width = a3;
  v19.size.CGFloat height = a4;
  CGRectApplyAffineTransform(v19, &t1);
}

void DKDVisibleUnscaledRectForNewScale(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7, double a8)
{
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeScale(&v19, a7, a7);
  memset(&v18, 0, sizeof(v18));
  CGAffineTransform v17 = v19;
  CGAffineTransformInvert(&v18, &v17);
  CGAffineTransform v17 = v18;
  v20.origin.CGFloat x = a1;
  v20.origin.CGFloat y = a2;
  v20.size.CGFloat width = a3;
  v20.size.CGFloat height = a4;
  CGRect v21 = CGRectApplyAffineTransform(v20, &v17);
  float64x2_t v14 = vaddq_f64(*(float64x2_t *)&v18.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v18.c, a6), *(float64x2_t *)&v18.a, a5));
  DKDScaleRectAroundPoint(v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, v14.f64[0], v14.f64[1], a7 / a8);
}

double DKDRectWithInverseNormalizedRect(double a1, double a2, double a3)
{
  return -a1 / a3;
}

double DKDRectByExpandingBoundingRectToContentRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9, double a10, double a11, double a12)
{
  double v25 = a1 + a5 * a3;
  v36.origin.CGFloat x = a5;
  v36.origin.CGFloat y = a6;
  v36.size.CGFloat width = a7;
  v36.size.CGFloat height = a8;
  double MaxX = CGRectGetMaxX(v36);
  v37.origin.CGFloat x = a5;
  v37.origin.CGFloat y = a6;
  v37.size.CGFloat width = a7;
  v37.size.CGFloat height = a8;
  CGRectGetMaxY(v37);
  double v26 = a1 + MaxX * a3;
  if (v25 >= v26) {
    double v27 = a1 + MaxX * a3;
  }
  else {
    double v27 = v25;
  }
  if (v25 >= v26) {
    double v26 = v25;
  }
  double v35 = v27;
  double v28 = v26 - v27;
  double v29 = -a9 / a11 * (v26 - v27);
  v38.origin.CGFloat x = -a9 / a11;
  v38.origin.CGFloat y = -a10 / a12;
  v38.size.CGFloat width = 1.0 / a11;
  v38.size.CGFloat height = 1.0 / a12;
  double v30 = CGRectGetMaxX(v38);
  v39.origin.CGFloat x = -a9 / a11;
  v39.origin.CGFloat y = -a10 / a12;
  v39.size.CGFloat width = 1.0 / a11;
  v39.size.CGFloat height = 1.0 / a12;
  CGRectGetMaxY(v39);
  if (v29 >= v30 * v28) {
    double v31 = v30 * v28;
  }
  else {
    double v31 = v29;
  }
  return v35 + v31;
}

double DKDAliasRound(double a1)
{
  double v1 = floor(a1);
  double v2 = a1 - v1;
  double result = ceil(a1);
  if (v2 < 0.49) {
    return v1;
  }
  return result;
}

double DKDAliasRoundedPoint(double a1)
{
  double v1 = floor(a1);
  double v2 = a1 - v1;
  double result = ceil(a1);
  if (v2 < 0.49) {
    return v1;
  }
  return result;
}

double DKDRoundForScale(double a1, double a2)
{
  return round(a1 * a2) / a2;
}

double DKDRoundedPoint(double a1)
{
  return round(a1);
}

double DKDRoundedPointForScale(double a1, double a2, double a3)
{
  return 1.0 / a3 * round(a1 * a3);
}

double DKDRoundedSize(double a1)
{
  return round(a1);
}

double DKDRoundedSizeForScale(double a1, double a2, double a3)
{
  return round(a1 * a3) / a3;
}

double DKDCeilSize(double a1)
{
  return ceil(a1);
}

double DKDRoundedRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return DKDRoundedRectForScale(a1, a2, a3, a4, 1.0);
}

double DKDRoundedRectForScale(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v8 = a1;
  if (a5 != 0.0 && !CGRectIsNull(*(CGRect *)&a1))
  {
    v19.origin.CGFloat x = DKDMultiplyRectScalar(v8, a2, a3, a4, a5);
    CGFloat x = v19.origin.x;
    CGFloat y = v19.origin.y;
    CGFloat width = v19.size.width;
    CGFloat height = v19.size.height;
    double v14 = round(CGRectGetMinX(v19));
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGFloat v15 = round(CGRectGetMinY(v20));
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGFloat v16 = round(CGRectGetMaxX(v21)) - v14;
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v22);
    return DKDMultiplyRectScalar(v14, v15, v16, round(MaxY) - v15, 1.0 / a5);
  }
  return v8;
}

double DKDAliasRoundedRectForScale(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v8 = a1;
  if (a5 != 0.0 && !CGRectIsNull(*(CGRect *)&a1))
  {
    v34.origin.CGFloat x = DKDMultiplyRectScalar(v8, a2, a3, a4, a5);
    CGFloat x = v34.origin.x;
    CGFloat y = v34.origin.y;
    CGFloat width = v34.size.width;
    CGFloat height = v34.size.height;
    double MinX = CGRectGetMinX(v34);
    double v15 = floor(MinX);
    double v16 = MinX - v15;
    double v17 = ceil(MinX);
    if (v16 >= 0.49) {
      double v18 = v17;
    }
    else {
      double v18 = v15;
    }
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v35);
    double v20 = floor(MinY);
    double v21 = MinY - v20;
    double v22 = ceil(MinY);
    if (v21 >= 0.49) {
      CGFloat v23 = v22;
    }
    else {
      CGFloat v23 = v20;
    }
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v36);
    double v25 = floor(MaxX);
    double v26 = MaxX - v25;
    double v27 = ceil(MaxX);
    if (v26 < 0.49) {
      double v27 = v25;
    }
    double v33 = v27 - v18;
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v37);
    double v29 = floor(MaxY);
    double v30 = MaxY - v29;
    double v31 = ceil(MaxY);
    if (v30 < 0.49) {
      double v31 = v29;
    }
    return DKDMultiplyRectScalar(v18, v23, v33, v31 - v23, 1.0 / a5);
  }
  return v8;
}

double DKDRoundedMinX(double a1, double a2, double a3, double a4)
{
  return round(CGRectGetMinX(*(CGRect *)&a1));
}

double DKDRoundedMidX(double a1, double a2, double a3, double a4)
{
  return round((round(a1) + round(CGRectGetMaxX(*(CGRect *)&a1))) * 0.5);
}

double DKDRoundedMaxX(double a1, double a2, double a3, double a4)
{
  return round(CGRectGetMaxX(*(CGRect *)&a1));
}

double DKDRoundedMinY(double a1, double a2, double a3, double a4)
{
  return round(CGRectGetMinY(*(CGRect *)&a1));
}

double DKDRoundedMidY(double a1, double a2, double a3, double a4)
{
  return round((round(a2) + round(CGRectGetMaxY(*(CGRect *)&a1))) * 0.5);
}

double DKDRoundedMaxY(double a1, double a2, double a3, double a4)
{
  return round(CGRectGetMaxY(*(CGRect *)&a1));
}

double DKDFloorForScale(double a1, double a2)
{
  return round(a1 * a2) / a2;
}

uint64_t DKDSizeHasNaNComponents()
{
  return 0;
}

uint64_t DKDRectHasNaNComponents()
{
  return 0;
}

uint64_t DKDPointHasNaNComponents()
{
  return 0;
}

uint64_t DKDTransformHasNaNComponents()
{
  return 0;
}

uint64_t DKDIntersectionOfInfiniteLines(double *a1, double *a2, double *a3, double *a4, double *a5)
{
  return DKDIntersectionOfLines(a1, a2, a3, a4, a5, 1, 1);
}

uint64_t DKDIntersectionOfSegments(double *a1, double *a2, double *a3, double *a4, double *a5)
{
  return DKDIntersectionOfLines(a1, a2, a3, a4, a5, 0, 0);
}

uint64_t DKDPointOrientation(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = (a4 - a2) * (a5 - a3) - (a3 - a1) * (a6 - a4);
  double v7 = fabs(v6);
  if (v6 > 0.0) {
    unsigned int v8 = 1;
  }
  else {
    unsigned int v8 = 2;
  }
  if (v7 >= 0.000001) {
    return v8;
  }
  else {
    return 0;
  }
}

double drawing::Drawing::Drawing(drawing::Drawing *this)
{
  *(void *)this = &unk_1F1FB0858;
  double result = 0.0;
  *(_OWORD *)((char *)this + _Block_object_dispose(&STACK[0x260], 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 8_Block_object_dispose(&STACK[0x260], 8) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 12std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0u;
  *((void *)this + 17) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F1FB0858;
  double result = 0.0;
  *(_OWORD *)((char *)this + _Block_object_dispose(&STACK[0x260], 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 8_Block_object_dispose(&STACK[0x260], 8) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 12std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0u;
  *((void *)this + 17) = 0;
  return result;
}

void drawing::Drawing::~Drawing(drawing::Drawing *this)
{
  *(void *)this = &unk_1F1FB0858;
  double v2 = (std::__shared_weak_count *)*((void *)this + 17);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  if (*((void *)this + 13))
  {
    std::vector<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::__clear[abi:ne180100]((void *)this + 13);
    operator delete(*((void **)this + 13));
  }
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)this + 12, 0);
  double v5 = (void **)((char *)this + 72);
  std::vector<std::unique_ptr<drawing::Stroke>>::__destroy_vector::operator()[abi:ne180100](&v5);
  double v5 = (void **)((char *)this + 48);
  std::vector<PB::Data>::__destroy_vector::operator()[abi:ne180100](&v5);
  if (*((void *)this + 3))
  {
    std::vector<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::__clear[abi:ne180100]((void *)this + 3);
    operator delete(*((void **)this + 3));
  }
  uint64_t v3 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  PB::Base::~Base(this);
}

{
  uint64_t vars8;

  drawing::Drawing::~Drawing(this);

  JUMPOUT(0x1C8783F10);
}

drawing::Drawing *drawing::Drawing::Drawing(drawing::Drawing *this, const drawing::Drawing *a2)
{
  *(void *)this = &unk_1F1FB0858;
  *(_OWORD *)((char *)this + _Block_object_dispose(&STACK[0x260], 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 8_Block_object_dispose(&STACK[0x260], 8) = 0u;
  *(_OWORD *)((char *)this + 12std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0u;
  *((void *)this + 17) = 0;
  uint64_t v4 = *((void *)a2 + 16);
  uint64_t v5 = *((void *)a2 + 17);
  if (v5)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    double v6 = (std::__shared_weak_count *)*((void *)this + 17);
    *((void *)this + 16) = v4;
    *((void *)this + 17) = v5;
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
  else
  {
    *((void *)this + 16) = v4;
    *((void *)this + 17) = 0;
  }
  if (this != a2) {
    std::vector<PB::Data>::__assign_with_size[abi:ne180100]<PB::Data*,PB::Data*>((uint64_t)this + 48, *((PB::Data **)a2 + 6), *((PB::Data **)a2 + 7), (uint64_t)(*((void *)a2 + 7) - *((void *)a2 + 6)) >> 4);
  }
  if (*((void *)a2 + 13) != *((void *)a2 + 14)) {
    operator new();
  }
  if (*((void *)a2 + 3) != *((void *)a2 + 4)) {
    operator new();
  }
  if (*((void *)a2 + 9) != *((void *)a2 + 10)) {
    PB::PtrVector<drawing::Stroke>::emplace_back<drawing::Stroke const&>();
  }
  if (*((void *)a2 + 1)) {
    operator new();
  }
  if (*((void *)a2 + 2)) {
    operator new();
  }
  if (*((void *)a2 + 12)) {
    operator new();
  }
  return this;
}

void sub_1C47E734C(void *a1)
{
}

const drawing::Drawing *drawing::Drawing::operator=(const drawing::Drawing *a1, const drawing::Drawing *a2)
{
  if (a1 != a2)
  {
    drawing::Drawing::Drawing((drawing::Drawing *)v5, a2);
    drawing::swap(a1, (drawing::Drawing *)v5, v3);
    drawing::Drawing::~Drawing((drawing::Drawing *)v5);
  }
  return a1;
}

void *drawing::swap(void *this, drawing::Drawing *a2, drawing::Drawing *a3)
{
  uint64_t v3 = this[16];
  this[16] = *((void *)a2 + 16);
  *((void *)a2 + 16) = v3;
  uint64_t v4 = this[17];
  this[17] = *((void *)a2 + 17);
  *((void *)a2 + 17) = v4;
  uint64_t v5 = this[6];
  this[6] = *((void *)a2 + 6);
  *((void *)a2 + 6) = v5;
  uint64_t v6 = this[7];
  this[7] = *((void *)a2 + 7);
  *((void *)a2 + 7) = v6;
  uint64_t v7 = this[8];
  this[8] = *((void *)a2 + 8);
  *((void *)a2 + _Block_object_dispose(&STACK[0x260], 8) = v7;
  uint64_t v8 = this[13];
  this[13] = *((void *)a2 + 13);
  *((void *)a2 + 13) = v8;
  uint64_t v9 = this[14];
  this[14] = *((void *)a2 + 14);
  *((void *)a2 + 14) = v9;
  uint64_t v10 = this[15];
  this[15] = *((void *)a2 + 15);
  *((void *)a2 + 15) = v10;
  uint64_t v11 = this[3];
  this[3] = *((void *)a2 + 3);
  *((void *)a2 + 3) = v11;
  uint64_t v12 = this[4];
  this[4] = *((void *)a2 + 4);
  *((void *)a2 + 4) = v12;
  uint64_t v13 = this[5];
  this[5] = *((void *)a2 + 5);
  *((void *)a2 + 5) = v13;
  uint64_t v14 = this[9];
  this[9] = *((void *)a2 + 9);
  *((void *)a2 + 9) = v14;
  uint64_t v15 = this[10];
  this[10] = *((void *)a2 + 10);
  *((void *)a2 + 1std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = v15;
  uint64_t v16 = this[11];
  this[11] = *((void *)a2 + 11);
  *((void *)a2 + 11) = v16;
  uint64_t v17 = this[1];
  this[1] = *((void *)a2 + 1);
  *((void *)a2 + 1) = v17;
  uint64_t v18 = this[2];
  this[2] = *((void *)a2 + 2);
  *((void *)a2 + 2) = v18;
  uint64_t v19 = this[12];
  this[12] = *((void *)a2 + 12);
  *((void *)a2 + 12) = v19;
  return this;
}

uint64_t drawing::Drawing::Drawing(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F1FB0858;
  *(_OWORD *)(a1 + 24) = 0u;
  uint64_t v4 = (void **)(a1 + 24);
  *(_OWORD *)(a1 + 72) = 0u;
  uint64_t v5 = (void **)(a1 + 72);
  *(_OWORD *)(a1 + 104) = 0u;
  uint64_t v6 = (void **)(a1 + 104);
  uint64_t v7 = (void **)(a1 + 48);
  *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = 0u;
  *(_OWORD *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 8_Block_object_dispose(&STACK[0x260], 8) = 0u;
  *(_OWORD *)(a1 + 12std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0u;
  *(void *)(a1 + 136) = 0;
  long long v8 = *(_OWORD *)(a2 + 128);
  *(void *)(a2 + 12_Block_object_dispose(&STACK[0x260], 8) = 0;
  *(void *)(a2 + 136) = 0;
  uint64_t v9 = *(std::__shared_weak_count **)(a1 + 136);
  *(_OWORD *)(a1 + 12_Block_object_dispose(&STACK[0x260], 8) = v8;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  std::vector<PB::Data>::__vdeallocate(v7);
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x260], 8) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a2 + 4_Block_object_dispose(&STACK[0x260], 8) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  if (*(void *)(a1 + 104))
  {
    std::vector<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::__clear[abi:ne180100](v6);
    operator delete(*v6);
    *uint64_t v6 = 0;
    v6[1] = 0;
    _OWORD v6[2] = 0;
  }
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 12std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(a2 + 120);
  *(void *)(a2 + 104) = 0;
  *(void *)(a2 + 112) = 0;
  *(void *)(a2 + 12std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  if (*(void *)(a1 + 24))
  {
    std::vector<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::__clear[abi:ne180100](v4);
    operator delete(*v4);
    *uint64_t v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  std::vector<std::unique_ptr<drawing::Stroke>>::__vdeallocate(v5);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 8_Block_object_dispose(&STACK[0x260], 8) = *(void *)(a2 + 88);
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 8std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  *(void *)(a2 + 8_Block_object_dispose(&STACK[0x260], 8) = 0;
  uint64_t v10 = *(void *)(a2 + 8);
  *(void *)(a2 + _Block_object_dispose(&STACK[0x260], 8) = 0;
  uint64_t v11 = *(void *)(a1 + 8);
  *(void *)(a1 + _Block_object_dispose(&STACK[0x260], 8) = v10;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  uint64_t v12 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v13 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v12;
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  }
  uint64_t v14 = *(void ***)(a2 + 96);
  *(void *)(a2 + 96) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)(a1 + 96), v14);
  return a1;
}

void *drawing::Drawing::operator=(void *a1, uint64_t a2)
{
  if (a1 != (void *)a2)
  {
    drawing::Drawing::Drawing((uint64_t)v5, a2);
    drawing::swap(a1, (drawing::Drawing *)v5, v3);
    drawing::Drawing::~Drawing((drawing::Drawing *)v5);
  }
  return a1;
}

uint64_t drawing::Drawing::formatText(drawing::Drawing *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "bounds");
  }
  uint64_t v6 = *((void *)this + 2);
  if (v6) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v6 + 32))(v6, a2, "boundsVersion");
  }
  uint64_t v7 = (uint64_t *)*((void *)this + 3);
  long long v8 = (uint64_t *)*((void *)this + 4);
  while (v7 != v8)
  {
    uint64_t v9 = *v7++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v9 + 32))(v9, a2, "inks");
  }
  uint64_t v10 = *((void *)this + 6);
  for (uint64_t i = *((void *)this + 7); v10 != i; v10 += 16)
    PB::TextFormatter::format();
  uint64_t v12 = (uint64_t *)*((void *)this + 9);
  uint64_t v13 = (uint64_t *)*((void *)this + 10);
  while (v12 != v13)
  {
    uint64_t v14 = *v12++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v14 + 32))(v14, a2, "strokes");
  }
  if (*((void *)this + 12)) {
    PB::TextFormatter::format();
  }
  uint64_t v15 = (uint64_t *)*((void *)this + 13);
  uint64_t v16 = (uint64_t *)*((void *)this + 14);
  while (v15 != v16)
  {
    uint64_t v17 = *v15++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v17 + 32))(v17, a2, "versionVector");
  }

  return MEMORY[0x1F4147498](a2);
}

BOOL drawing::Drawing::readFrom(drawing::Drawing *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    long long v8 = (uint64_t *)((char *)this + 48);
    double v33 = (char *)this + 64;
    uint64_t v9 = (PKProtobufUnknownFields **)((char *)this + 128);
    while (1)
    {
      uint64_t v10 = *(void *)a2;
      if (v2 <= 0xFFFFFFFFFFFFFFF5 && v2 + 10 <= v3) {
        break;
      }
      char v17 = 0;
      unsigned int v18 = 0;
      unint64_t v13 = 0;
      if (v2 > v3) {
        unint64_t v3 = v2;
      }
      do
      {
        if (v3 == v2)
        {
          int v4 = 1;
          *((unsigned char *)a2 + 24) = 1;
          return v4 == 0;
        }
        unint64_t v19 = v2 + 1;
        char v20 = *(unsigned char *)(v10 + v2);
        *((void *)a2 + 1) = v19;
        v13 |= (unint64_t)(v20 & 0x7F) << v17;
        if ((v20 & 0x80) == 0) {
          goto LABEL_25;
        }
        v17 += 7;
        unint64_t v2 = v19;
        BOOL v16 = v18++ > 8;
      }
      while (!v16);
LABEL_20:
      int v21 = 0;
      LODWORD(v22) = 0;
LABEL_21:
      if (!*v9) {
        operator new();
      }
      BOOL result = PKProtobufUnknownFields::add(*v9, v22, v21, a2);
      if (!result) {
        return result;
      }
LABEL_46:
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      unint64_t v14 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v15 = *(unsigned char *)(v10 + v2);
      v13 |= (unint64_t)(v15 & 0x7F) << v11;
      if ((v15 & 0x80) == 0) {
        break;
      }
      v11 += 7;
      unint64_t v2 = v14;
      BOOL v16 = v12++ > 8;
      if (v16) {
        goto LABEL_20;
      }
    }
LABEL_25:
    int v21 = v13 & 7;
    if (v21 != 4)
    {
      unint64_t v22 = v13 >> 3;
      switch((v13 >> 3))
      {
        case 2u:
          double v25 = (void *)*((void *)this + 7);
          unint64_t v24 = *((void *)this + 8);
          if ((unint64_t)v25 >= v24)
          {
            uint64_t v27 = ((uint64_t)v25 - *v8) >> 4;
            unint64_t v28 = v27 + 1;
            if ((unint64_t)(v27 + 1) >> 60) {
              std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v29 = v24 - *v8;
            if (v29 >> 3 > v28) {
              unint64_t v28 = v29 >> 3;
            }
            if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v30 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v30 = v28;
            }
            v34[4] = v33;
            if (v30) {
              double v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)v33, v30);
            }
            else {
              double v31 = 0;
            }
            double v32 = &v31[16 * v27];
            v34[0] = v31;
            v34[1] = v32;
            v34[3] = &v31[16 * v30];
            *(void *)double v32 = 0;
            *((void *)v32 + 1) = 0;
            v34[2] = v32 + 16;
            std::vector<PB::Data>::__swap_out_circular_buffer(v8, v34);
            double v26 = (void *)*((void *)this + 7);
            std::__split_buffer<PB::Data>::~__split_buffer((uint64_t)v34);
          }
          else
          {
            void *v25 = 0;
            v25[1] = 0;
            double v26 = v25 + 2;
            *((void *)this + 7) = v25 + 2;
          }
          *((void *)this + 7) = v26;
          PB::Reader::read(a2, (PB::Data *)(v26 - 2));
          goto LABEL_46;
        case 3u:
          PB::PtrVector<drawing::StrokeID>::emplace_back<>();
        case 4u:
          PB::PtrVector<drawing::Ink>::emplace_back<>();
        case 5u:
          PB::PtrVector<drawing::Stroke>::emplace_back<>();
        case 6u:
          operator new();
        case 7u:
          operator new();
        case 8u:
          operator new();
        default:
          goto LABEL_21;
      }
    }
    int v4 = 0;
  }
  return v4 == 0;
}

void sub_1C47E7DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__split_buffer<PB::Data>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

const void ***drawing::Drawing::writeTo(drawing::Drawing *this, PB::Writer *a2)
{
  int v4 = (const PB::Data *)*((void *)this + 6);
  uint64_t v5 = (const PB::Data *)*((void *)this + 7);
  while (v4 != v5)
  {
    PB::Writer::write(a2, v4);
    int v4 = (const PB::Data *)((char *)v4 + 16);
  }
  uint64_t v6 = (const PB::Base **)*((void *)this + 13);
  uint64_t v7 = (const PB::Base **)*((void *)this + 14);
  while (v6 != v7)
  {
    long long v8 = *v6++;
    PB::Writer::writeSubmessage(a2, v8);
  }
  uint64_t v9 = (const PB::Base **)*((void *)this + 3);
  uint64_t v10 = (const PB::Base **)*((void *)this + 4);
  while (v9 != v10)
  {
    char v11 = *v9++;
    PB::Writer::writeSubmessage(a2, v11);
  }
  unsigned int v12 = (const PB::Base **)*((void *)this + 9);
  unint64_t v13 = (const PB::Base **)*((void *)this + 10);
  while (v12 != v13)
  {
    unint64_t v14 = *v12++;
    PB::Writer::writeSubmessage(a2, v14);
  }
  char v15 = (const PB::Base *)*((void *)this + 1);
  if (v15) {
    PB::Writer::writeSubmessage(a2, v15);
  }
  BOOL v16 = (const PB::Base *)*((void *)this + 2);
  if (v16) {
    PB::Writer::writeSubmessage(a2, v16);
  }
  char v17 = (const PB::Data *)*((void *)this + 12);
  if (v17) {
    PB::Writer::write(a2, v17);
  }
  BOOL result = (const void ***)*((void *)this + 16);
  if (result)
  {
    return PKProtobufUnknownFields::writeTo(result, (char **)a2);
  }
  return result;
}

uint64_t drawing::Drawing::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t result = PKProtobufUnknownFieldsCompare((void ***)(a1 + 128), (void ***)(a2 + 128));
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a2 + 48);
    if (v6 - v5 != *(void *)(a2 + 56) - v7) {
      return 0;
    }
    while (v5 != v6)
    {
      uint64_t result = PB::Data::operator==();
      if (!result) {
        return result;
      }
      v5 += 16;
      v7 += 16;
    }
    long long v8 = *(uint64_t **)(a1 + 104);
    uint64_t v9 = *(uint64_t **)(a1 + 112);
    uint64_t v10 = *(uint64_t **)(a2 + 104);
    if ((char *)v9 - (char *)v8 != *(void *)(a2 + 112) - (void)v10) {
      return 0;
    }
    while (v8 != v9)
    {
      uint64_t result = drawing::StrokeID::operator==(*v8, *v10);
      if (!result) {
        return result;
      }
      ++v8;
      ++v10;
    }
    char v11 = *(uint64_t **)(a2 + 24);
    unint64_t v13 = *(uint64_t **)(a1 + 24);
    unsigned int v12 = *(uint64_t **)(a1 + 32);
    if ((char *)v12 - (char *)v13 != *(void *)(a2 + 32) - (void)v11) {
      return 0;
    }
    while (v13 != v12)
    {
      uint64_t result = drawing::Ink::operator==(*v13, *v11);
      if (!result) {
        return result;
      }
      ++v13;
      ++v11;
      unsigned int v12 = *(uint64_t **)(a1 + 32);
    }
    uint64_t result = PB::PtrVector<drawing::Stroke>::operator==((void *)(a1 + 72), (void *)(a2 + 72));
    if (result)
    {
      uint64_t v14 = *(void *)(a1 + 8);
      uint64_t v15 = *(void *)(a2 + 8);
      if (v14)
      {
        if (!v15 || !drawing::Rectangle::operator==(v14, v15)) {
          return 0;
        }
      }
      else if (v15)
      {
        return 0;
      }
      uint64_t v16 = *(void *)(a1 + 16);
      uint64_t v17 = *(void *)(a2 + 16);
      if (v16)
      {
        if (!v17 || !drawing::StrokeID::operator==(v16, v17)) {
          return 0;
        }
LABEL_25:
        if (!*(void *)(a1 + 96)) {
          return *(void *)(a2 + 96) == 0;
        }
        if (*(void *)(a2 + 96))
        {
          if (PB::Data::operator==()) {
            return 1;
          }
          if (!*(void *)(a1 + 96)) {
            return *(void *)(a2 + 96) == 0;
          }
        }
        return 0;
      }
      if (!v17) {
        goto LABEL_25;
      }
      return 0;
    }
  }
  return result;
}

uint64_t drawing::Drawing::hash_value(drawing::Drawing *this)
{
  uint64_t v2 = *((void *)this + 6);
  uint64_t v3 = *((void *)this + 7);
  if (v2 == v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    do
    {
      v2 += 16;
      v4 ^= PBHashBytes();
    }
    while (v2 != v3);
  }
  uint64_t v5 = *((void *)this + 13);
  uint64_t v6 = *((void *)this + 14);
  if (v5 != v6)
  {
    uint64_t v7 = 0;
    while (1)
    {
      long long v8 = *(void **)v5;
      if (*(unsigned char *)(*(void *)v5 + 32))
      {
        uint64_t v9 = v8[1];
        if ((*(unsigned char *)(*(void *)v5 + 32) & 2) != 0)
        {
LABEL_10:
          uint64_t v10 = v8[2];
          if ((*(unsigned char *)(*(void *)v5 + 32) & 4) == 0) {
            goto LABEL_14;
          }
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v9 = 0;
        if ((*(unsigned char *)(*(void *)v5 + 32) & 2) != 0) {
          goto LABEL_10;
        }
      }
      uint64_t v10 = 0;
      if ((*(unsigned char *)(*(void *)v5 + 32) & 4) == 0)
      {
LABEL_14:
        uint64_t v11 = 0;
        goto LABEL_15;
      }
LABEL_11:
      uint64_t v11 = v8[3];
LABEL_15:
      v7 ^= v9 ^ v10 ^ v11;
      v5 += 8;
      if (v5 == v6) {
        goto LABEL_18;
      }
    }
  }
  uint64_t v7 = 0;
LABEL_18:
  unsigned int v12 = (drawing::Ink **)*((void *)this + 3);
  unint64_t v13 = (drawing::Ink **)*((void *)this + 4);
  if (v12 == v13)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = *v12++;
      v14 ^= drawing::Ink::hash_value(v15);
    }
    while (v12 != v13);
  }
  uint64_t v16 = (drawing::Stroke **)*((void *)this + 9);
  uint64_t v17 = (drawing::Stroke **)*((void *)this + 10);
  if (v16 == v17)
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = 0;
    do
    {
      unint64_t v19 = *v16++;
      v18 ^= drawing::Stroke::hash_value(v19);
    }
    while (v16 != v17);
  }
  char v20 = (drawing::Rectangle *)*((void *)this + 1);
  if (v20) {
    uint64_t v21 = drawing::Rectangle::hash_value(v20);
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v22 = *((void *)this + 2);
  if (!v22)
  {
    uint64_t v26 = 0;
    goto LABEL_41;
  }
  if ((*(unsigned char *)(v22 + 32) & 1) == 0)
  {
    uint64_t v23 = 0;
    if ((*(unsigned char *)(v22 + 32) & 2) != 0) {
      goto LABEL_34;
    }
LABEL_38:
    uint64_t v24 = 0;
    if ((*(unsigned char *)(v22 + 32) & 4) != 0) {
      goto LABEL_35;
    }
LABEL_39:
    uint64_t v25 = 0;
    goto LABEL_40;
  }
  uint64_t v23 = *(void *)(v22 + 8);
  if ((*(unsigned char *)(v22 + 32) & 2) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v24 = *(void *)(v22 + 16);
  if ((*(unsigned char *)(v22 + 32) & 4) == 0) {
    goto LABEL_39;
  }
LABEL_35:
  uint64_t v25 = *(void *)(v22 + 24);
LABEL_40:
  uint64_t v26 = v24 ^ v23 ^ v25;
LABEL_41:
  if (*((void *)this + 12)) {
    uint64_t v27 = PBHashBytes();
  }
  else {
    uint64_t v27 = 0;
  }
  return v7 ^ v4 ^ v21 ^ v26 ^ v27 ^ v14 ^ v18;
}

uint64_t drawing::Drawing::makeBounds(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

uint64_t drawing::Drawing::makeBoundsVersion(uint64_t this)
{
  if (!*(void *)(this + 16)) {
    operator new();
  }
  return this;
}

__CFString *PKTextInputDescriptionForWritingState(uint64_t a1)
{
  double v1 = @"Active";
  if (a1 != 1) {
    double v1 = 0;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Idle";
  }
}

void sub_1C47EE7D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1C47F2024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

uint64_t __Block_byref_object_copy__38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)this, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__38(uint64_t a1)
{
}

void sub_1C47F5538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C47F6210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47F6838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1C47F6A1C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1C47F6FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1C47F76AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12, void *a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17)
{
  _Unwind_Resume(a1);
}

void sub_1C47F78A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C47F7E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1C47F8004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C47F885C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t PropertyListDecoder.init()()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t Data.init(contentsOf:options:)()
{
  return MEMORY[0x1F40E4BE0]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x1F40E4D48]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t static Date.timeIntervalSinceReferenceDate.getter()
{
  return MEMORY[0x1F40E4EF0]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x1F40E5188]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t static UUID.== infix(_:_:)()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x1F40E5448]();
}

NSNumber __swiftcall CGFloat._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1F40E5F50]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x1F4188568]();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return MEMORY[0x1F4188570]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x1F4188580]();
}

uint64_t OSSignposter.init(logger:)()
{
  return MEMORY[0x1F4188590]();
}

uint64_t OSSignposter.logHandle.getter()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t type metadata accessor for OSSignposter()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return MEMORY[0x1F4188650]();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return MEMORY[0x1F4188658]();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return MEMORY[0x1F4188660]();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return MEMORY[0x1F4188668]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x1F41886B0]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1F40E6000]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t dispatch thunk of Encodable.encode(to:)()
{
  return MEMORY[0x1F4183510]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x1F40E6190]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1F41839B0]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x1F4183D80]();
}

{
  return MEMORY[0x1F4183D98]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x1F4183DF8]();
}

{
  return MEMORY[0x1F4183E10]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1F40E6338]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t static MainActor.shared.getter()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t type metadata accessor for MainActor()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t dispatch thunk of Decodable.init(from:)()
{
  return MEMORY[0x1F4184090]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6458]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1F40E6478]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x1F4188708]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x1F4188710]();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x1F41874A8](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x1F4188720]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1F4184640]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x1F4184978]();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t __CocoaSet.element(at:)()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return MEMORY[0x1F4184BD0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return MEMORY[0x1F4187F70]();
}

uint64_t ContinuousClock.init()()
{
  return MEMORY[0x1F4187F78]();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return MEMORY[0x1F4187F80]();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return MEMORY[0x1F4184F98]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x1F4185050]();
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t __CocoaDictionary.count.getter()
{
  return MEMORY[0x1F4185238]();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return MEMORY[0x1F4185270]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1F4185350]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x1F4185368]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1F4185370]();
}

uint64_t static _DictionaryStorage.convert(_:capacity:)()
{
  return MEMORY[0x1F4185378]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x1F4185380]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x1F41854C8](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x1F4185528]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x1F4185568]();
}

{
  return MEMORY[0x1F4185570]();
}

{
  return MEMORY[0x1F4185578]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x1F4185598]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x1F4185658]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x1F4185690]();
}

{
  return MEMORY[0x1F4185698]();
}

{
  return MEMORY[0x1F41856A0]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x1F41856C0]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x1F4185740](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1F4185758]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)()
{
  return MEMORY[0x1F4185A88]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x1F4185B20]();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return MEMORY[0x1F4188170]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1F4185EB0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t static Duration.milliseconds(_:)()
{
  return MEMORY[0x1F4186140]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximuuint64_t m = v4;
  result.minimuuint64_t m = v3;
  return result;
}

uint64_t CARenderServerSnapshot()
{
  return MEMORY[0x1F40F4CC0]();
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40F4CE8](retstr, t);
}

BOOL CATransform3DIsAffine(CATransform3D *t)
{
  return MEMORY[0x1F40F4D00](t);
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x1F40F4D10](retstr, m);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D30](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D48](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D58](retstr, t, sx, sy, sz);
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1F40C94A8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80E0](allocator, activities, repeats, order, block);
}

void CFRunLoopRun(void)
{
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1F40D8698](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x1F40D86A8](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return MEMORY[0x1F40D86B0](tokenizer, index);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

uint64_t CGBitmapContextCreateForFlatteningImage()
{
  return MEMORY[0x1F40D9810]();
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateCopy(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9978](color);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99B0](red, green, blue, alpha);
}

CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space, CGPatternRef pattern, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D99B8](space, pattern, components);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1F40D99D0](color1, color2);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateLab(const CGFloat *whitePoint, const CGFloat *blackPoint, const CGFloat *range)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B28](whitePoint, blackPoint, range);
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B38](baseSpace);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextFlush(CGContextRef c)
{
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9F68](retstr, c);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

uint64_t CGImageCreateMaskFromAlpha()
{
  return MEMORY[0x1F40DA888]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGImageRef CGImageCreateWithMask(CGImageRef image, CGImageRef mask)
{
  return (CGImageRef)MEMORY[0x1F40DA8A8](image, mask);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

void CGImageDestinationAddImageAndMetadata(CGImageDestinationRef idst, CGImageRef image, CGImageMetadataRef metadata, CFDictionaryRef options)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

uint64_t CGImageGetMask()
{
  return MEMORY[0x1F40DA960]();
}

CFStringRef CGImageGetUTType(CGImageRef image)
{
  return (CFStringRef)MEMORY[0x1F40DA9B0](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

uint64_t CGImageHasAlpha()
{
  return MEMORY[0x1F40DA9C0]();
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1F40E97C8]();
}

BOOL CGImageMetadataSetValueMatchingImageProperty(CGMutableImageMetadataRef metadata, CFStringRef dictionaryName, CFStringRef propertyName, CFTypeRef value)
{
  return MEMORY[0x1F40E9828](metadata, dictionaryName, propertyName, value);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x1F40DB008](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB010](path);
}

CGPathRef CGPathCreateCopyByFlattening(CGPathRef path, CGFloat flatteningThreshold)
{
  return (CGPathRef)MEMORY[0x1F40DB020](path, flatteningThreshold);
}

CGPathRef CGPathCreateCopyByIntersectingPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x1F40DB028](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyByStrokingPath(CGPathRef path, const CGAffineTransform *transform, CGFloat lineWidth, CGLineCap lineCap, CGLineJoin lineJoin, CGFloat miterLimit)
{
  return (CGPathRef)MEMORY[0x1F40DB038](path, transform, *(void *)&lineCap, *(void *)&lineJoin, lineWidth, miterLimit);
}

CGPathRef CGPathCreateCopyBySubtractingPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x1F40DB040](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB048](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGMutablePathRef CGPathCreateMutableCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB078](path, transform);
}

CFArrayRef CGPathCreateSeparateComponents(CGPathRef path, BOOL evenOddFillRule)
{
  return (CFArrayRef)MEMORY[0x1F40DB080](path, evenOddFillRule);
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0B0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x1F40DB0D0](path);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGPoint CGPathGetCurrentPoint(CGPathRef path)
{
  MEMORY[0x1F40DB0D8](path);
  result.CGFloat y = v2;
  result.CGFloat x = v1;
  return result;
}

uint64_t CGPathIntersectsRect()
{
  return MEMORY[0x1F40DB100]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB178](path);
}

CGPatternRef CGPatternCreate(void *info, CGRect bounds, CGAffineTransform *matrix, CGFloat xStep, CGFloat yStep, CGPatternTiling tiling, BOOL isColored, const CGPatternCallbacks *callbacks)
{
  return (CGPatternRef)MEMORY[0x1F40DB180](info, matrix, *(void *)&tiling, isColored, callbacks, (__n128)bounds.origin, *(__n128 *)&bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height, xStep, yStep);
}

void CGPatternRelease(CGPatternRef pattern)
{
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  MEMORY[0x1F40DB1F8](t, (__n128)point, *(__n128 *)&point.y);
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

CGPoint CGPointFromString(NSString *string)
{
  MEMORY[0x1F4166A78](string);
  result.CGFloat y = v2;
  result.CGFloat x = v1;
  return result;
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectFromString(NSString *string)
{
  MEMORY[0x1F4166A80](string);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1F40DB2E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x1F40DB300]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

uint64_t CHGetPersonalizedSynthesisSupportState()
{
  return MEMORY[0x1F4113D98]();
}

uint64_t CHGetSynthesisModelVersionForLocale()
{
  return MEMORY[0x1F4113DA0]();
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x1F40E89C8]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1F40E8A00]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x1F40E8A20]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1F40E8A38]();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x1F40E8AB8](client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x1F40E8AC8]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x1F40E8B38]();
}

void IOHIDManagerActivate(IOHIDManagerRef manager)
{
}

void IOHIDManagerCancel(IOHIDManagerRef manager)
{
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x1F40E8C68](allocator, *(void *)&options);
}

void IOHIDManagerRegisterDeviceMatchingCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
}

void IOHIDManagerRegisterDeviceRemovalCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
}

void IOHIDManagerSetCancelHandler(IOHIDManagerRef manager, dispatch_block_t handler)
{
}

void IOHIDManagerSetDeviceMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
}

void IOHIDManagerSetDispatchQueue(IOHIDManagerRef manager, dispatch_queue_t queue)
{
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E8D20](service, key);
}

uint64_t IOMobileFramebufferChangeFrameInfo()
{
  return MEMORY[0x1F41249B8]();
}

uint64_t IOMobileFramebufferFrameInfo()
{
  return MEMORY[0x1F4124A10]();
}

uint64_t IOMobileFramebufferGetRunLoopSource()
{
  return MEMORY[0x1F4124AA0]();
}

uint64_t IOMobileFramebufferOpenByName()
{
  return MEMORY[0x1F4124AE0]();
}

uint64_t IOMobileFramebufferSupportedFrameInfo()
{
  return MEMORY[0x1F4124B58]();
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return MEMORY[0x1F40E9100]();
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9308](properties);
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x1F40E95D8](buffer, *(void *)&newState, oldState);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1F417CE48]();
}

MDLVertexDescriptor *__cdecl MTKModelIOVertexDescriptorFromMetal(MTLVertexDescriptor *metalDescriptor)
{
  return (MDLVertexDescriptor *)MEMORY[0x1F40EDE70](metalDescriptor);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSRect NSIntersectionRect(NSRect aRect, NSRect bRect)
{
  MEMORY[0x1F40E7148]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1 = MEMORY[0x1F40E71F8](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x1F4166A98](transform);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4166AA0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4166AB0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PBHashBytes()
{
  return MEMORY[0x1F4147258]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1F4166AF0]();
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x1F4166B10]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4166B18]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1F4166B50]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1F4166BC0]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x1F4166C10]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

uint64_t UIKeyboardInputModeGetBaseLanguage()
{
  return MEMORY[0x1F4166D60]();
}

uint64_t UIKeyboardInputModeGetRegion()
{
  return MEMORY[0x1F4166D78]();
}

uint64_t UIKeyboardLocalizedReturnKeyNameForLocale()
{
  return MEMORY[0x1F4166DA8]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1F4166E08]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1F4166E10]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1F4166E18]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4166E80]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1F4166E88]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1F4166E98]();
}

uint64_t UIRectIntegralWithViewScale()
{
  return MEMORY[0x1F4166EA0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4166EC8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return MEMORY[0x1F40D8D18]();
}

uint64_t _UIAccessibilityForceTouchEnabled()
{
  return MEMORY[0x1F4166F70]();
}

uint64_t _UIAccessibilityForceTouchSensitivity()
{
  return MEMORY[0x1F4166F78]();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x1F4166FA8]();
}

uint64_t _UIMachTimeForMediaTime()
{
  return MEMORY[0x1F4167068]();
}

uint64_t _UIMediaTimeForMachTime()
{
  return MEMORY[0x1F4167070]();
}

uint64_t _UIUpdateCycleEnabled()
{
  return MEMORY[0x1F41670D0]();
}

uint64_t _UIUpdateRequestActivate()
{
  return MEMORY[0x1F41670E8]();
}

uint64_t _UIUpdateRequestDeactivate()
{
  return MEMORY[0x1F41670F0]();
}

uint64_t _UIUpdateSequenceInsertItem()
{
  return MEMORY[0x1F4167100]();
}

uint64_t _UIUpdateSequenceRemoveItem()
{
  return MEMORY[0x1F4167108]();
}

uint64_t _UIUserInterfaceSizeClassForWidth()
{
  return MEMORY[0x1F4167118]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t PB::TextFormatter::beginObject(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x1F4147448](this, a2);
}

uint64_t PB::TextFormatter::format()
{
  return MEMORY[0x1F4147450]();
}

{
  return MEMORY[0x1F4147458]();
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x1F4147460](this, a2);
}

{
  return MEMORY[0x1F4147480](this, a2);
}

{
  return MEMORY[0x1F4147490](this, a2);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, double a3)
{
  return MEMORY[0x1F4147468](this, a2, a3);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, float a3)
{
  return MEMORY[0x1F4147470](this, a2, a3);
}

void PB::Base::~Base(PB::Base *this)
{
}

uint64_t PB::Data::assign(PB::Data *this, const unsigned __int8 *a2, const unsigned __int8 *a3)
{
  return MEMORY[0x1F41474A8](this, a2, a3);
}

uint64_t PB::Data::Data(PB::Data *this, const unsigned __int8 *a2)
{
  return MEMORY[0x1F41474B0](this, a2);
}

uint64_t PB::Data::Data(PB::Data *this, const PB::Data *a2)
{
  return MEMORY[0x1F41474B8](this, a2);
}

uint64_t PB::Reader::recallMark()
{
  return MEMORY[0x1F41474C0]();
}

uint64_t PB::Reader::read(PB::Reader *this, PB::Data *a2)
{
  return MEMORY[0x1F41474C8](this, a2);
}

uint64_t PB::Reader::read()
{
  return MEMORY[0x1F41474D0]();
}

{
  return MEMORY[0x1F41474D8]();
}

uint64_t PB::Reader::skip(PB::Reader *this)
{
  return MEMORY[0x1F41474E0](this);
}

uint64_t PB::Reader::placeMark()
{
  return MEMORY[0x1F41474E8]();
}

uint64_t PB::Reader::Reader(PB::Reader *this, const unsigned __int8 *a2)
{
  return MEMORY[0x1F41474F0](this, a2);
}

uint64_t PB::Writer::writeFixed(PB::Writer *this)
{
  return MEMORY[0x1F41474F8](this);
}

{
  return MEMORY[0x1F4147508](this);
}

uint64_t PB::Writer::writeVarInt(PB::Writer *this)
{
  return MEMORY[0x1F4147510](this);
}

{
  return MEMORY[0x1F4147518](this);
}

{
  return MEMORY[0x1F4147528](this);
}

uint64_t PB::Writer::writeSubmessage(PB::Writer *this, const PB::Base *a2)
{
  return MEMORY[0x1F4147530](this, a2);
}

uint64_t PB::Writer::write(PB::Writer *this, const PB::Data *a2)
{
  return MEMORY[0x1F4147538](this, a2);
}

uint64_t PB::Writer::write()
{
  return MEMORY[0x1F4147540]();
}

{
  return MEMORY[0x1F4147548]();
}

uint64_t PB::Writer::write(PB::Writer *this)
{
  return MEMORY[0x1F4147550](this);
}

uint64_t PB::Writer::write(PB::Writer *this, double a2)
{
  return MEMORY[0x1F4147558](this, a2);
}

uint64_t PB::Writer::write(PB::Writer *this, float a2)
{
  return MEMORY[0x1F4147560](this, a2);
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x1F4147578](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
}

uint64_t PB::Data::operator==()
{
  return MEMORY[0x1F4147588]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E8C8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1F417EEC8](this);
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

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
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
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
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

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x1F40C9C00]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

long double acos(long double __x)
{
  MEMORY[0x1F40CA330](__x);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

long double asin(long double __x)
{
  MEMORY[0x1F40CA3D0](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CB9F8](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

kern_return_t mach_wait_until(uint64_t deadline)
{
  return MEMORY[0x1F40CCAD0](deadline);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

size_t os_proc_available_memory(void)
{
  return MEMORY[0x1F40CD538]();
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1F40CD658]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1F4181B10](p);
}

uint64_t random(void)
{
  return MEMORY[0x1F40CDC18]();
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1F41881F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x1F41866F0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

long double tan(long double __x)
{
  MEMORY[0x1F40CE420](__x);
  return result;
}

int32_t u_getIntPropertyValue(UChar32 c, UProperty which)
{
  return MEMORY[0x1F417F760](*(void *)&c, *(void *)&which);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1F40CE630](uu1, uu2);
}

void uuid_generate(uuid_t out)
{
}