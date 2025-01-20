double CSLUIIconCenterIconDiameter()
{
  return 40.0;
}

double CSLUIIconMaximumIconDiameter()
{
  if (qword_46D40 != -1) {
    dispatch_once(&qword_46D40, &stru_3C8F8);
  }
  return *(double *)&qword_46D38;
}

void sub_2E2C(id a1)
{
  v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  qword_46D38 = sqrt(v5 * v5 + v3 * v3);
}

void sub_30AC(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (a2) {
    id v2 = [objc_alloc((Class)UIImage) initWithCGImage:a2 scale:0 orientation:*(double *)(a1 + 56)];
  }
  double v4 = cslprf_icon_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    [v2 size];
    *(_DWORD *)buf = 138412802;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    id v16 = v2;
    __int16 v17 = 2048;
    uint64_t v18 = v6;
    _os_log_impl(&def_1AB14, v4, OS_LOG_TYPE_DEFAULT, "CSLUIApplicationIconGenerator iconImageForApplication bundleID=%@ image=%p size=%lf", buf, 0x20u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_3218;
  v10[3] = &unk_3C920;
  v7 = *(NSObject **)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v11 = v2;
  id v12 = v8;
  id v9 = v2;
  dispatch_async(v7, v10);
}

uint64_t sub_3218(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_3318(id a1)
{
  qword_46D48 = (uint64_t)dispatch_queue_create("CSLUIApplicationIconGenerator", 0);

  _objc_release_x1();
}

void sub_3358(uint64_t a1)
{
  id v2 = +[CSLUICalendarIconSource sharedInstance];
  double v3 = [v2 circularCalendarIcon];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3424;
  v7[3] = &unk_3C920;
  double v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t sub_3424(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

_DWORD *sub_36B0(_DWORD *result, float a2, float a3, float a4)
{
  float v4 = roundf(a2);
  float v5 = roundf(a3);
  float v6 = roundf(a4);
  float v7 = vabds_f32(v4, a2);
  float v8 = vabds_f32(v5, a3);
  float v9 = vabds_f32(v6, a4);
  if (v7 <= v8 || v7 <= v9)
  {
    if (v8 <= v9) {
      float v6 = (float)-v4 - v5;
    }
  }
  else
  {
    float v4 = (float)-v5 - v6;
  }
  *result = (int)v4;
  result[1] = (int)v6;
  return result;
}

id sub_3A0C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  id v2 = objc_msgSend(*(id *)(a1 + 32), "layer", *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160), *(void *)(a1 + 168), *(void *)(a1 + 176));
  [v2 setTransform:&v4];

  return [*(id *)(a1 + 32) setAlpha:0.9];
}

id sub_3B98(uint64_t a1)
{
  id v2 = *(void **)(a1 + 64);
  long long v3 = *(_OWORD *)(a1 + 48);
  v5[0] = *(_OWORD *)(a1 + 32);
  v5[1] = v3;
  [v2 applyLayoutAttributes:v5];
  return [*(id *)(a1 + 64) setAlpha:1.0];
}

id sub_3BE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) resumeJiggling];
}

id sub_3EAC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  long long v2 = *(_OWORD *)(a1 + 72);
  v4[0] = *(_OWORD *)(a1 + 56);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 88);
  [*(id *)(a1 + 32) setTransform:v4];
  return [*(id *)(a1 + 32) setAlpha:0.9];
}

id sub_3FBC(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 64);
  long long v3 = *(_OWORD *)(a1 + 48);
  v5[0] = *(_OWORD *)(a1 + 32);
  v5[1] = v3;
  [v2 applyLayoutAttributes:v5];
  return [*(id *)(a1 + 64) setAlpha:1.0];
}

void sub_4310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 sub_4590(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = 8 * (v4 - v5) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    sub_4FEC(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }
  unint64_t v8 = *(void *)(v5 + ((v7 >> 3) & 0x1FFFFFFFFFFFFFF8)) + ((v7 & 0x3F) << 6);
  __n128 result = *(__n128 *)a2;
  long long v10 = *(_OWORD *)(a2 + 16);
  long long v11 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v8 + 48) = v11;
  *(__n128 *)unint64_t v8 = result;
  *(_OWORD *)(v8 + 16) = v10;
  ++a1[5];
  return result;
}

uint64_t sub_4628(_DWORD *a1)
{
  if (a1[3] >= a1[2])
  {
    v7[0] = 0;
    *(_DWORD *)&void v7[4] = 0;
  }
  else
  {
    sub_4F4C(a1 + 6, a1[8], 1);
    int v2 = a1[4];
    int v3 = a1[3];
    int v4 = v3 - a1[5];
    if (v4 >= 6 * v2)
    {
      int v4 = 0;
      a1[4] = ++v2;
      a1[5] = v3;
      ++a1[7];
    }
    int v5 = v4 / v2 % 6;
    if (v5 <= 5) {
      a1[8] = dword_2DF60[v5];
    }
    a1[3] = v3 + 1;
    v7[0] = 1;
    *(void *)&void v7[4] = *((void *)a1 + 3);
  }
  return *(void *)v7;
}

void sub_48B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4C08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_4E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

_DWORD *sub_4F4C(_DWORD *result, int a2, int a3)
{
  switch(a2)
  {
    case 0:
      int v3 = result[1] + a3;
      goto LABEL_6;
    case 1:
      int v4 = *result + a3;
      goto LABEL_8;
    case 2:
      int v5 = *result + a3;
      int v6 = result[1] - a3;
      goto LABEL_10;
    case 3:
      int v3 = result[1] - a3;
LABEL_6:
      result[1] = v3;
      return result;
    case 4:
      int v4 = *result - a3;
LABEL_8:
      *__n128 result = v4;
      break;
    case 5:
      int v5 = *result - a3;
      int v6 = result[1] + a3;
LABEL_10:
      *__n128 result = v5;
      result[1] = v6;
      break;
    default:
      return result;
  }
  return result;
}

void sub_4FEC(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x40;
  unint64_t v4 = v2 - 64;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    int v6 = (char *)a1[3];
    a1[4] = v4;
    unint64_t v7 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    float v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)unint64_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      v34 = (char *)sub_57A4(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        unint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      float v9 = (char *)a1[1];
    }
    unint64_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      sub_5304(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    sub_541C((uint64_t)a1, &v54);
    v44 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    float v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      v34 = (char *)sub_57A4((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        unint64_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        unint64_t v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  v56 = a1 + 3;
  *(void *)&long long v54 = sub_57A4((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0x1000uLL);
  sub_553C(&v54, &v53);
  v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_5654((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_52B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_5304(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  int v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    unint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      v19 = (char *)sub_57A4(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      int v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        int v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        int v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        int v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      int v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)int v6 = *a2;
  a1[2] += 8;
}

void sub_541C(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    unint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)sub_57A4(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void sub_553C(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)sub_57A4(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void sub_5654(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)sub_57A4(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void sub_5770()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_57A4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_5770();
  }
  return operator new(8 * a2);
}

uint64_t sub_57DC(void *a1, unint64_t *a2)
{
  uint64_t v4 = operator new(0x18uLL);
  unint64_t v5 = *a2;
  v4[2] = *a2;
  *uint64_t v4 = 0;
  v4[1] = (v5 << 16) | HIDWORD(v5);
  return sub_5848(a1, (uint64_t)v4);
}

void sub_5834(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_5848(void *a1, uint64_t a2)
{
  uint64_t v4 = (_DWORD *)(a2 + 16);
  unint64_t v5 = (*(_DWORD *)(a2 + 20) | (*(_DWORD *)(a2 + 16) << 16));
  *(void *)(a2 + 8) = v5;
  uint64_t v6 = (void *)sub_5898((uint64_t)a1, v5, v4);
  sub_59F4(a1, (void *)a2, v6);
  return a2;
}

uint64_t sub_5898(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    uint64_t v9 = 2 * v6;
    BOOL v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    size_t v11 = v10 | v9;
    unint64_t v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    sub_5ADC(a1, v13);
    unint64_t v6 = *(void *)(a1 + 8);
  }
  uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v15 = a2;
    if (v6 <= a2) {
      unint64_t v15 = a2 % v6;
    }
  }
  else
  {
    unint64_t v15 = (v6 - 1) & a2;
  }
  uint64_t v16 = *(void *)(*(void *)a1 + 8 * v15);
  if (!v16) {
    return 0;
  }
  int v17 = 0;
  do
  {
    uint64_t result = v16;
    uint64_t v16 = *(void *)v16;
    if (!v16) {
      break;
    }
    unint64_t v19 = *(void *)(v16 + 8);
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v20 = *(void *)(v16 + 8);
      if (v19 >= v6) {
        unint64_t v20 = v19 % v6;
      }
    }
    else
    {
      unint64_t v20 = v19 & (v6 - 1);
    }
    if (v20 != v15) {
      break;
    }
    if (v19 == a2)
    {
      BOOL v21 = *(_DWORD *)(v16 + 16) == *a3 && *(_DWORD *)(v16 + 20) == a3[1];
      BOOL v22 = v21;
    }
    else
    {
      BOOL v22 = 0;
    }
    int v23 = v17 & !v22;
    v17 |= v22;
  }
  while (v23 != 1);
  return result;
}

void *sub_59F4(void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
    if (v6 != v4) {
      goto LABEL_18;
    }
  }
LABEL_19:
  ++result[3];
  return result;
}

void sub_5ADC(uint64_t a1, size_t __n)
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
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_5BCC(a1, prime);
    }
  }
}

void sub_5BCC(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_5770();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(uint64_t ***)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = (unint64_t)v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      for (i = *v7; *v7; i = *v7)
      {
        unint64_t v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2) {
            v12 %= a2;
          }
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          uint64_t v7 = (uint64_t **)i;
        }
        else
        {
          size_t v13 = i;
          if (*(void *)(*(void *)a1 + 8 * v12))
          {
            do
            {
              uint8x8_t v14 = v13;
              size_t v13 = (uint64_t *)*v13;
              if (!v13) {
                break;
              }
            }
            while (*((_DWORD *)i + 4) == *((_DWORD *)v13 + 4) && *((_DWORD *)i + 5) == *((_DWORD *)v13 + 5));
            unsigned char *v7 = v13;
            *uint8x8_t v14 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = i;
          }
          else
          {
            *(void *)(*(void *)a1 + 8 * v12) = v7;
            uint64_t v7 = (uint64_t **)i;
            unint64_t v8 = v12;
          }
        }
      }
    }
  }
  else
  {
    BOOL v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

uint64_t *sub_5D44(void *a1, int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  int v3 = *a2;
  unsigned int v4 = a2[1];
  unint64_t v5 = v4 | (*a2 << 16);
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v4 | (v3 << 16);
    if (*(void *)&v2 <= v5) {
      unint64_t v7 = v5 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v7 = (v2.i32[0] - 1) & v5;
  }
  unint64_t v8 = *(uint64_t ***)(*a1 + 8 * v7);
  if (!v8) {
    return 0;
  }
  for (uint64_t result = *v8; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v10 = result[1];
    if (v10 == v5)
    {
      if (*((_DWORD *)result + 4) == v3 && *((_DWORD *)result + 5) == v4) {
        return result;
      }
    }
    else
    {
      if (v6.u32[0] > 1uLL)
      {
        if (v10 >= *(void *)&v2) {
          v10 %= *(void *)&v2;
        }
      }
      else
      {
        v10 &= *(void *)&v2 - 1;
      }
      if (v10 != v7) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_5E00(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  sub_5E44(a1, a2, (uint64_t)&__p);
  int v3 = __p;
  __p = 0;
  if (v3) {
    operator delete(v3);
  }
  return v2;
}

void *sub_5E44@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  uint8x8_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    unint64_t v7 = v6;
    uint8x8_t v6 = (void *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }
  else
  {
    v8 &= *(void *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }
    else
    {
      v9 &= *(void *)&v3 - 1;
    }
    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0;
  }
  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }
    else
    {
      v11 &= *(void *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }
  void *v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

uint64_t sub_5F78(uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 < 0x40) {
    a2 = 1;
  }
  if (v2 < 0x80) {
    int v4 = a2;
  }
  else {
    int v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8;
    *(void *)(a1 + 32) -= 64;
  }
  return v4 ^ 1u;
}

uint64_t sub_5FD8(void *a1)
{
  unint64_t v2 = (void **)a1[1];
  int8x8_t v3 = (void **)a1[2];
  a1[5] = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      int8x8_t v3 = (void **)a1[2];
      unint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 32;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 64;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    unint64_t v7 = *v2++;
    operator delete(v7);
  }

  return sub_6080((uint64_t)a1);
}

uint64_t sub_6080(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_60D0(uint64_t a1)
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
  unint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

id sub_6450(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v4[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v4[1] = v2;
  v4[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return [v1 setTransform:v4];
}

id sub_6490(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

void sub_79B4(id a1)
{
  id v2 = +[UIScreen mainScreen];
  [v2 scale];
  qword_46D58 = v1;
}

void sub_7A58(id a1)
{
  uint64_t v1 = objc_alloc_init(CSLDateLabelStringFormatCache);
  id v2 = (void *)qword_46D68;
  qword_46D68 = (uint64_t)v1;

  uint64_t v3 = cslprf_startup_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_26444(v3);
  }
}

void sub_7C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_7CB4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7CC4(uint64_t a1)
{
}

void sub_7CCC(uint64_t a1)
{
  id v10 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 72));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v10],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v10];
    unint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    unint64_t v9 = +[NSDateFormatter dateFormatFromTemplate:@"cccc" options:0 locale:v10];
    [v8 setDateFormat:v9];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void sub_7ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_7EEC(uint64_t a1)
{
  id v10 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 80));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v10],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v10];
    unint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    unint64_t v9 = +[NSDateFormatter dateFormatFromTemplate:@"EEEjmm" options:0 locale:v10];
    [v8 setDateFormat:v9];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void sub_80F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_810C(uint64_t a1)
{
  id v10 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 88));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v10],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v10];
    unint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    unint64_t v9 = +[NSDateFormatter dateFormatFromTemplate:@"yMd" options:0 locale:v10];
    [v8 setDateFormat:v9];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void sub_8314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_832C(uint64_t a1)
{
  id v10 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 96));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v10],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v10];
    unint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    unint64_t v9 = +[NSDateFormatter dateFormatFromTemplate:@"Md" options:0 locale:v10];
    [v8 setDateFormat:v9];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void sub_8534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_854C(uint64_t a1)
{
  id v10 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 104));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v10],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v10];
    unint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    unint64_t v9 = +[NSDateFormatter dateFormatFromTemplate:@"Mdjmm" options:0 locale:v10];
    [v8 setDateFormat:v9];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void sub_8754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_876C(uint64_t a1)
{
  id v10 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 112));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v10],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v10];
    unint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    unint64_t v9 = +[NSDateFormatter dateFormatFromTemplate:@"MMMd" options:0 locale:v10];
    [v8 setDateFormat:v9];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void sub_8974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_898C(uint64_t a1)
{
  id v10 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 120));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v10],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v10];
    unint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    unint64_t v9 = +[NSDateFormatter dateFormatFromTemplate:@"MMMdjmm" options:0 locale:v10];
    [v8 setDateFormat:v9];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void sub_8B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_8BAC(uint64_t a1)
{
  id v10 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 152));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v10],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v10];
    unint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    unint64_t v9 = +[NSDateFormatter dateFormatFromTemplate:@"EEEEMMMMd" options:0 locale:v10];
    [v8 setDateFormat:v9];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 152), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void sub_8DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_8DCC(uint64_t a1)
{
  id v8 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 160));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v8],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v8];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setAMSymbol:&stru_3D1C0];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setPMSymbol:&stru_3D1C0];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTimeStyle:1];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void sub_8FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_8FF4(uint64_t a1)
{
  id v8 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 128));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v8],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v8];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDateStyle:0];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTimeStyle:1];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void sub_91E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_9200(uint64_t a1)
{
  id v8 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 136));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v8],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v8];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDateStyle:1];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTimeStyle:1];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDoesRelativeDateFormatting:1];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 136), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void sub_9408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_9420(uint64_t a1)
{
  id v8 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 144));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v8],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v8];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDateStyle:1];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTimeStyle:0];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDoesRelativeDateFormatting:1];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 144), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void sub_9628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_9640(uint64_t a1)
{
  id v8 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 184));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v8],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSNumberFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v8];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setNumberStyle:1];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void sub_9820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_9838(uint64_t a1)
{
  id v11 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 192));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v11],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v11];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDateFormat:@"H:mm:ss"];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    if (!*(void *)(*(void *)(a1 + 32) + 224))
    {
      uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) dateFromString:@"0:00:00"];
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 224);
      *(void *)(v9 + 224) = v8;
    }
  }
}

void sub_9A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_9A6C(uint64_t a1)
{
  id v11 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 200));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v11],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v11];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDateFormat:@"mm:ss"];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 200), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    if (!*(void *)(*(void *)(a1 + 32) + 224))
    {
      uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) dateFromString:@"00:00"];
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 224);
      *(void *)(v9 + 224) = v8;
    }
  }
}

void sub_9C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_9CA0(uint64_t a1)
{
  id v11 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 208));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v11],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v11];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDateFormat:@"H:m:ss"];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 208), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    if (!*(void *)(*(void *)(a1 + 32) + 232))
    {
      uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) dateFromString:@"0:0:00"];
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 232);
      *(void *)(v9 + 232) = v8;
    }
  }
}

void sub_9EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_9ED4(uint64_t a1)
{
  id v11 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 216));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v11],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v11];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDateFormat:@"m:ss"];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 216), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    if (!*(void *)(*(void *)(a1 + 32) + 232))
    {
      uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) dateFromString:@"0:00"];
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 232);
      *(void *)(v9 + 232) = v8;
    }
  }
}

void sub_A0F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_A108(uint64_t a1)
{
  id v8 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 168));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v8],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v8];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void sub_A2EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_A304(uint64_t a1)
{
  id v8 = +[NSLocale currentLocale];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 176));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2
    || ([v2 locale],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqual:v8],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLocale:v8];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDateFormat:@"yyyy-MM-dd-HHmmss"];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 176), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void sub_AE3C(_Unwind_Exception *a1)
{
  unint64_t v7 = v5;

  _Unwind_Resume(a1);
}

void sub_AF78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_B020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_B1D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B594(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

id sub_B5D0(void *a1)
{
  id v1 = a1;
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_3D1C0 table:@"CarouselLayoutSettings"];

  return v3;
}

void sub_B660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B9E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BB54(_Unwind_Exception *a1)
{
  unsigned __int8 v4 = v3;

  _Unwind_Resume(a1);
}

void sub_BCD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BF3C(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_C06C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_C21C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_C274(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetIconPositions];
}

void sub_C3A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C59C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_C5AC(uint64_t a1, void *a2)
{
  return [a2 positionsChanged];
}

id sub_C5B4(uint64_t a1, void *a2)
{
  return [a2 initialSyncComplete];
}

void sub_C644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_C6D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)CSLIconPositionsStore;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_C6FC(void *a1)
{
}

void sub_C77C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_E3FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E5F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_EB34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_ED60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_EE08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_EEFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_EFC4(_Unwind_Exception *a1)
{
  unsigned __int8 v4 = v3;

  _Unwind_Resume(a1);
}

int64_t sub_EFF0(id a1, CSLHexAppNode *a2, CSLHexAppNode *a3)
{
  unsigned __int8 v4 = a2;
  id v5 = a3;
  Hex v6 = [(CSLHexAppNode *)v4 hex];
  Hex v7 = [(CSLHexAppNode *)v5 hex];
  if (v6.r == v7.r)
  {
    if (v6.q < v7.q)
    {
LABEL_3:
      int64_t v8 = -1;
      goto LABEL_8;
    }
  }
  else if (v6.r < v7.r)
  {
    goto LABEL_3;
  }
  Hex v9 = [(CSLHexAppNode *)v4 hex];
  Hex v10 = [(CSLHexAppNode *)v5 hex];
  if (v10.r == v9.r) {
    int64_t v8 = v10.q < v9.q;
  }
  else {
    int64_t v8 = v10.r < v9.r;
  }
LABEL_8:

  return v8;
}

void sub_F09C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_F0BC(id a1, CSLHexAppNode *a2)
{
  id v2 = [(CSLHexAppNode *)a2 bundleIdentifier];

  return v2;
}

void sub_F178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F20C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F4D8(_Unwind_Exception *a1)
{
  int64_t v8 = v7;

  _Unwind_Resume(a1);
}

void sub_F660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_F740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_F7F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F90C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FD50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_FED8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_FF18(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_FFE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CSLHexNodesAbbreviatedDescription(void *a1)
{
  BOOL v21 = [a1 sortedArrayUsingComparator:&stru_3CCC0];
  int v23 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v21 count]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v21;
  id v1 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v1)
  {
    uint64_t v2 = *(void *)v25;
    do
    {
      for (i = 0; i != v1; i = (char *)i + 1)
      {
        if (*(void *)v25 != v2) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v5 = [v4 bundleIdentifier];
        Hex v6 = [v5 componentsSeparatedByString:@"."];
        if ((unint64_t)[v6 count] < 2)
        {
          uint8x8_t v14 = v5;
        }
        else
        {
          Hex v7 = (char *)[v6 count];
          int64_t v8 = [v6 objectAtIndexedSubscript:v7 - 1];
          unsigned int v9 = [v8 isEqual:@"watchkitapp"];

          if (v9) {
            Hex v10 = v7 - 2;
          }
          else {
            Hex v10 = v7 - 1;
          }
          id v11 = [v6 objectAtIndexedSubscript:1];
          unsigned __int8 v12 = [v11 isEqual:@"apple"];

          if (v10) {
            char v13 = v12;
          }
          else {
            char v13 = 1;
          }
          if (v13)
          {
            uint8x8_t v14 = [v6 objectAtIndexedSubscript:v10];
          }
          else
          {
            uint64_t v15 = [v6 objectAtIndexedSubscript:v10 - 1];
            uint64_t v16 = [v6 objectAtIndexedSubscript:v10];
            uint8x8_t v14 = +[NSString stringWithFormat:@"%@.%@", v15, v16];

            id v5 = (void *)v15;
          }
        }
        int v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@:%d,%d", v14, [v4 hex], (unint64_t)objc_msgSend(v4, "hex") >> 32);
        [v23 addObject:v17];
      }
      id v1 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v1);
  }

  uint64_t v18 = [v23 componentsJoinedByString:@";"];
  unint64_t v19 = +[NSString stringWithFormat:@"{ %@ }", v18];

  return v19;
}

void sub_10694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_109BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,char a26)
{
  sub_60D0((uint64_t)&a26);
  _Unwind_Resume(a1);
}

id sub_10A2C(uint64_t a1)
{
  return [*(id *)(a1 + 32) isVerticalOnly];
}

id sub_10A34(uint64_t a1)
{
  return [*(id *)(a1 + 32) lastReorderReason];
}

id sub_10A3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) isExactlyEqual:*(void *)(a1 + 40)];
}

void sub_10AF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10F6C(int *a1@<X0>, std::string *a2@<X8>)
{
  sub_18E40(&v25, "hex {");
  std::to_string(&v24, *a1);
  if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v4 = &v24;
  }
  else {
    uint64_t v4 = (std::string *)v24.__r_.__value_.__r.__words[0];
  }
  if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v24.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v24.__r_.__value_.__l.__size_;
  }
  Hex v6 = std::string::append(&v25, (const std::string::value_type *)v4, size);
  long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v26.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  sub_18E40(v22, ",");
  if ((v23 & 0x80u) == 0) {
    int64_t v8 = v22;
  }
  else {
    int64_t v8 = (void **)v22[0];
  }
  if ((v23 & 0x80u) == 0) {
    std::string::size_type v9 = v23;
  }
  else {
    std::string::size_type v9 = (std::string::size_type)v22[1];
  }
  Hex v10 = std::string::append(&v26, (const std::string::value_type *)v8, v9);
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v27.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v21, a1[1]);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unsigned __int8 v12 = &v21;
  }
  else {
    unsigned __int8 v12 = (std::string *)v21.__r_.__value_.__r.__words[0];
  }
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v13 = HIBYTE(v21.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v13 = v21.__r_.__value_.__l.__size_;
  }
  uint8x8_t v14 = std::string::append(&v27, (const std::string::value_type *)v12, v13);
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v28.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  sub_18E40(__p, "}");
  if ((v20 & 0x80u) == 0) {
    uint64_t v16 = __p;
  }
  else {
    uint64_t v16 = (void **)__p[0];
  }
  if ((v20 & 0x80u) == 0) {
    std::string::size_type v17 = v20;
  }
  else {
    std::string::size_type v17 = (std::string::size_type)__p[1];
  }
  uint64_t v18 = std::string::append(&v28, (const std::string::value_type *)v16, v17);
  *a2 = *v18;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  if ((char)v20 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v28.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v21.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  if ((char)v23 < 0) {
    operator delete(v22[0]);
  }
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
}

void sub_1115C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,void *a40,uint64_t a41,int a42,__int16 a43,char a44,char a45)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v45 - 41) < 0) {
    operator delete(*(void **)(v45 - 64));
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v45 - 73) < 0) {
    operator delete(*(void **)(v45 - 96));
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (a45 < 0) {
    operator delete(a40);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  if (a39 < 0) {
    operator delete(a34);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_112E4(unsigned int *a1)
{
  uint64_t v2 = *a1;
  int v1 = a1[1];
  if (v1 < -2 || (v1 + 3 + 2 * v2) >= 7)
  {
    if (v1 >= -2)
    {
      BOOL v5 = (int)v2 < -((v1 + 3) >> 1);
      uint64_t v2 = -((v1 + 3) >> 1);
      if (v5) {
        goto LABEL_11;
      }
      unsigned int v6 = v1 + 4;
      int v4 = v1 + 1;
      uint64_t v2 = -(v6 >> 1);
    }
    else
    {
      uint64_t v2 = 0;
      int v4 = -2;
    }
    a1[1] = v4;
  }
LABEL_11:
  *a1 = v2 + 1;
  return (v2 << 32) | 1;
}

uint64_t sub_11348(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 52);
  if (v1 >= *(_DWORD *)(a1 + 48))
  {
LABEL_4:
    LOBYTE(v12) = 0;
    HIDWORD(v12) = 0;
  }
  else
  {
    int v2 = *(_DWORD *)(a1 + 44);
    if (v1 >= v2)
    {
      if (v1 == v2)
      {
        int v3 = *(_DWORD *)(a1 + 8);
        int v4 = *(_DWORD *)(a1 + 12);
        *(void *)(a1 + 20) = 0x300000024;
        *(_DWORD *)(a1 + 36) = v4 + 3;
        *(_DWORD *)(a1 + 40) = 1;
        *(_DWORD *)(a1 + 28) = 18;
        *(_DWORD *)(a1 + 32) = v3 - 1;
      }
      *(_DWORD *)(a1 + 52) = v1 + 1;
      return sub_4628((_DWORD *)(a1 + 8));
    }
    else
    {
      *(_DWORD *)(a1 + 52) = v1 + 1;
      switch(v1)
      {
        case 0:
        case 17:
          int v6 = 1;
          LOBYTE(v12) = 1;
          goto LABEL_55;
        case 1:
          LOBYTE(v12) = 1;
          goto LABEL_13;
        case 2:
          LOBYTE(v12) = 1;
          goto LABEL_48;
        case 3:
          int v5 = 1;
          LOBYTE(v12) = 1;
          goto LABEL_43;
        case 4:
          LOBYTE(v12) = 1;
          HIDWORD(v12) = 0;
          return v12;
        case 5:
          LOBYTE(v12) = 1;
LABEL_13:
          int v6 = -1;
          goto LABEL_55;
        case 6:
          int v7 = 1;
          LOBYTE(v12) = 1;
          goto LABEL_34;
        case 7:
          LOBYTE(v12) = 1;
          int v8 = -1;
          goto LABEL_37;
        case 8:
          int v9 = 1;
          LOBYTE(v12) = 1;
          goto LABEL_19;
        case 9:
          LOBYTE(v12) = 1;
          int v5 = 2;
          goto LABEL_43;
        case 10:
          LOBYTE(v12) = 1;
          int v9 = -1;
LABEL_19:
          HIDWORD(v12) = v9;
          return v12;
        case 11:
          LOBYTE(v12) = 1;
          goto LABEL_30;
        case 12:
          LOBYTE(v12) = 1;
          HIDWORD(v12) = 0;
          return v12;
        case 13:
          LOBYTE(v12) = 1;
          int v7 = 2;
          goto LABEL_34;
        case 14:
          LOBYTE(v12) = 1;
          HIDWORD(v12) = 0;
          return v12;
        case 15:
          LOBYTE(v12) = 1;
          int v8 = -2;
          goto LABEL_37;
        case 16:
        case 20:
          LOBYTE(v12) = 1;
          goto LABEL_40;
        case 18:
          LOBYTE(v12) = 1;
          int v10 = -2;
          goto LABEL_50;
        case 19:
          LOBYTE(v12) = 1;
          int v10 = -1;
          goto LABEL_50;
        case 21:
          LOBYTE(v12) = 1;
LABEL_30:
          int v6 = -2;
          goto LABEL_55;
        case 22:
          int v8 = 1;
          LOBYTE(v12) = 1;
          goto LABEL_37;
        case 23:
          LOBYTE(v12) = 1;
          int v7 = 3;
          goto LABEL_34;
        case 24:
          LOBYTE(v12) = 1;
          int v7 = -1;
LABEL_34:
          HIDWORD(v12) = v7;
          return v12;
        case 25:
          LOBYTE(v12) = 1;
          int v8 = -3;
LABEL_37:
          HIDWORD(v12) = v8;
          return v12;
        case 26:
          LOBYTE(v12) = 1;
LABEL_40:
          int v6 = 2;
          goto LABEL_55;
        case 27:
          LOBYTE(v12) = 1;
          int v5 = 3;
          goto LABEL_43;
        case 28:
          LOBYTE(v12) = 1;
          int v5 = -2;
LABEL_43:
          HIDWORD(v12) = v5;
          return v12;
        case 29:
          LOBYTE(v12) = 1;
          goto LABEL_54;
        case 30:
          LOBYTE(v12) = 1;
          HIDWORD(v12) = 0;
          return v12;
        case 31:
        case 34:
          LOBYTE(v12) = 1;
          int v6 = 3;
          goto LABEL_55;
        case 32:
          LOBYTE(v12) = 1;
LABEL_48:
          HIDWORD(v12) = 0;
          return v12;
        case 33:
          LOBYTE(v12) = 1;
          int v10 = -3;
LABEL_50:
          HIDWORD(v12) = v10;
          return v12;
        case 35:
          LOBYTE(v12) = 1;
LABEL_54:
          int v6 = -3;
LABEL_55:
          HIDWORD(v12) = v6;
          break;
        default:
          goto LABEL_4;
      }
    }
  }
  return v12;
}

void sub_11730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_119F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_11EF8(uint64_t *a1)
{
  switch(*((_DWORD *)a1 + 3))
  {
    case 0:
      unsigned int v1 = *((_DWORD *)a1 + 2);
      *((_DWORD *)a1 + 2) = v1 + 1;
      if (v1 >= 6) {
        goto LABEL_29;
      }
      goto LABEL_32;
    case 1:
      uint64_t v2 = *((int *)a1 + 2);
      *((_DWORD *)a1 + 2) = v2 + 1;
      if (v2 >= 3) {
        goto LABEL_29;
      }
      int v3 = &unk_2E08C;
      goto LABEL_22;
    case 2:
      uint64_t v2 = *((int *)a1 + 2);
      *((_DWORD *)a1 + 2) = v2 + 1;
      if (v2 >= 3) {
        goto LABEL_29;
      }
      int v3 = &unk_2E098;
      goto LABEL_22;
    case 3:
      uint64_t v2 = *((int *)a1 + 2);
      *((_DWORD *)a1 + 2) = v2 + 1;
      if (v2 >= 3) {
        goto LABEL_29;
      }
      int v3 = &unk_2E0A4;
      goto LABEL_22;
    case 4:
      int v4 = *((_DWORD *)a1 + 2);
      *((_DWORD *)a1 + 2) = v4 + 1;
      if (!v4) {
        goto LABEL_15;
      }
      if (v4 != 1) {
        goto LABEL_29;
      }
LABEL_30:
      unsigned int v1 = 2;
      goto LABEL_32;
    case 5:
      int v5 = *((_DWORD *)a1 + 2);
      *((_DWORD *)a1 + 2) = v5 + 1;
      if (!v5) {
        goto LABEL_30;
      }
      if (v5 != 1) {
        goto LABEL_29;
      }
LABEL_15:
      unsigned int v1 = 3;
      goto LABEL_32;
    case 6:
      uint64_t v2 = *((int *)a1 + 2);
      *((_DWORD *)a1 + 2) = v2 + 1;
      if (v2 >= 3) {
        goto LABEL_29;
      }
      int v3 = &unk_2E0B0;
      goto LABEL_22;
    case 7:
      uint64_t v2 = *((int *)a1 + 2);
      *((_DWORD *)a1 + 2) = v2 + 1;
      if (v2 >= 3) {
        goto LABEL_29;
      }
      int v3 = &unk_2E0BC;
      goto LABEL_22;
    case 8:
      uint64_t v2 = *((int *)a1 + 2);
      *((_DWORD *)a1 + 2) = v2 + 1;
      if (v2 >= 3) {
        goto LABEL_29;
      }
      int v3 = &unk_2E0C8;
LABEL_22:
      unsigned int v1 = v3[v2];
      goto LABEL_32;
    case 9:
      unsigned int v1 = *((_DWORD *)a1 + 2);
      *((_DWORD *)a1 + 2) = v1 + 1;
      if (!v1) {
        goto LABEL_32;
      }
      if (v1 != 1) {
        goto LABEL_29;
      }
LABEL_31:
      unsigned int v1 = 5;
      goto LABEL_32;
    case 0xA:
      int v6 = *((_DWORD *)a1 + 2);
      *((_DWORD *)a1 + 2) = v6 + 1;
      if (!v6) {
        goto LABEL_31;
      }
      if (v6 == 1)
      {
LABEL_28:
        unsigned int v1 = 0;
LABEL_32:
        LOBYTE(v9[0]) = 1;
        uint64_t v8 = *a1;
        *(void *)((char *)v9 + 4) = *(void *)sub_4F4C(&v8, v1, 1);
      }
      else
      {
LABEL_29:
        LOBYTE(v9[0]) = 0;
        *(void *)((char *)v9 + 4) = 0;
      }
      return v9[0];
    default:
      goto LABEL_28;
  }
}

uint64_t sub_12108(uint64_t *a1)
{
  int v1 = *((_DWORD *)a1 + 2);
  if (v1 < 6)
  {
    LOBYTE(v4[0]) = 1;
    uint64_t v3 = *a1;
    *((_DWORD *)a1 + 2) = v1 + 1;
    *(void *)((char *)v4 + 4) = *(void *)sub_4F4C(&v3, v1, 1);
  }
  else
  {
    LOBYTE(v4[0]) = 0;
    *(void *)((char *)v4 + 4) = 0;
  }
  return v4[0];
}

void sub_12224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_122F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_12554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_126C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_132BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26,void *a27)
{
  _Unwind_Resume(a1);
}

uint64_t sub_13440(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  if (v1 <= *(_DWORD *)(a1 + 20))
  {
    *(_DWORD *)(a1 + 16) = v1 + 1;
    float v3 = *(float *)(a1 + 24) + (float)(*(float *)(a1 + 40) * (float)v1);
    float v4 = *(float *)(a1 + 28) + (float)(*(float *)(a1 + 44) * (float)v1);
    float v5 = *(float *)(a1 + 32) + (float)(*(float *)(a1 + 48) * (float)v1);
    uint64_t v7 = 0;
    *(void *)((char *)v8 + 4) = *(void *)sub_36B0(&v7, v3, v4, v5);
    char v2 = 1;
  }
  else
  {
    char v2 = 0;
    *(void *)((char *)v8 + 4) = 0;
  }
  LOBYTE(v8[0]) = v2;
  return v8[0];
}

void sub_13AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t sub_13BBC(signed int *a1)
{
  int v1 = a1[1];
  if (v1 >= -2 && (v1 + 3 + 2 * *a1) < 7) {
    goto LABEL_12;
  }
  if (v1 > -3)
  {
    signed int v3 = 3 - ((v1 + 4) >> 1);
    if (*a1 > v3)
    {
      *a1 = v3;
LABEL_12:
      v5[0] = 1;
      *(void *)&v5[4] = *(void *)a1;
      *a1 = *(void *)a1 - 1;
      return *(void *)v5;
    }
    if (v1 != -2)
    {
      *a1 = 3 - ((v1 + 3) >> 1);
      a1[1] = v1 - 1;
      goto LABEL_12;
    }
  }
  v5[0] = 0;
  *(_DWORD *)&v5[4] = 0;
  return *(void *)v5;
}

void sub_13C48(id *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v11 = a3;
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = cslprf_icon_field_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    sub_10F6C((int *)&v11, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 138412802;
    id v13 = v6;
    __int16 v14 = 2080;
    long long v15 = p_p;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_debug_impl(&def_1AB14, v8, OS_LOG_TYPE_DEBUG, "[343 move] move %@ -> %s; next:%@; ", buf, 0x20u);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }

  [*a1 setNode:v6 toHex:v11];
}

void sub_13D78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_146C8(_DWORD *a1)
{
  int v2 = a1[6];
  if (!v2) {
    goto LABEL_8;
  }
  if (v2 <= a1[8])
  {
    signed int v3 = a1 + 9;
LABEL_7:
    sub_4F4C(a1 + 4, *v3, 1);
LABEL_8:
    ++a1[6];
    v5[0] = 1;
    *(void *)&v5[4] = *((void *)a1 + 2);
    return *(void *)v5;
  }
  if (v2 <= a1[7])
  {
    signed int v3 = a1 + 10;
    goto LABEL_7;
  }
  v5[0] = 0;
  *(_DWORD *)&v5[4] = 0;
  return *(void *)v5;
}

uint64_t sub_14760(uint64_t a1)
{
  v7[0] = 1;
  do
  {
    int v2 = *(_DWORD *)(a1 + 60);
    *(_DWORD *)(a1 + 60) = v2 + 1;
    uint64_t v3 = (v2 % 6);
    float v4 = (_DWORD *)(a1 + 8 * v3 + 12);
    sub_4F4C(v4, v2 % 6, 1);
    if (!*(unsigned char *)(a1 + 8)) {
      break;
    }
    int v5 = *(_DWORD *)(a1 + 64);
    if (v5 < 0 && !*v4 && !*(_DWORD *)(a1 + 8 * v3 + 16))
    {
      *(_DWORD *)(a1 + 64) = v3;
      int v5 = v3;
    }
  }
  while (v3 == v5);
  *(void *)&void v7[4] = *(void *)v4;
  return *(void *)v7;
}

void sub_148E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_14BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_14C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_15C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_15CD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_164FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (([*(id *)(a1 + 32) containsObject:v4] & 1) == 0
    && ([v4 isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    int v5 = cslprf_icon_field_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_27094();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void sub_16590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_169FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16A80(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = [v3 hex];
  sub_1A4CC(v4 + 32, (int *)&v8, &v8, (uint64_t *)&v9);
  int v5 = [*(id *)(a1 + 32) nodesByBundle];
  id v6 = v9;
  id v7 = [v9 bundleIdentifier];
  [v5 setObject:v6 forKey:v7];
}

void sub_16B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

void sub_16C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_16D04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16DBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_16DD8(id a1, CSLHexAppNode *a2, CSLHexAppNode *a3)
{
  uint64_t v4 = a2;
  int v5 = a3;
  Hex v6 = [(CSLHexAppNode *)v4 hex];
  Hex v7 = [(CSLHexAppNode *)v5 hex];
  if (v6.r == v7.r)
  {
    if (v6.q < v7.q)
    {
LABEL_3:
      int64_t v8 = -1;
      goto LABEL_8;
    }
  }
  else if (v6.r < v7.r)
  {
    goto LABEL_3;
  }
  Hex v9 = [(CSLHexAppNode *)v4 hex];
  Hex v10 = [(CSLHexAppNode *)v5 hex];
  if (v10.r == v9.r) {
    int64_t v8 = v10.q < v9.q;
  }
  else {
    int64_t v8 = v10.r < v9.r;
  }
LABEL_8:

  return v8;
}

void sub_16E84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16EF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1705C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1742C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);

  _Unwind_Resume(a1);
}

void sub_174C0(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_opt_isKindOfClass() & 1;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    Hex v9 = cslprf_icon_field_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_27370();
    }
    goto LABEL_40;
  }
  if ([v7 isEqualToString:@"verticalOnly"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_opt_respondsToSelector() & 1;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 112) = [v8 BOOLValue];
      goto LABEL_41;
    }
    Hex v9 = cslprf_icon_field_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_273D8();
    }
LABEL_40:

    *a4 = 1;
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"lastReason"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_opt_respondsToSelector() & 1;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      *(void *)(*(void *)(a1 + 32) + 128) = [v8 integerValue];
      goto LABEL_41;
    }
    Hex v9 = cslprf_icon_field_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_27450();
    }
    goto LABEL_40;
  }
  if ([v7 isEqualToString:@"nodes"])
  {
    objc_opt_class();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_opt_isKindOfClass() & 1;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      Hex v9 = cslprf_icon_field_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_274C8();
      }
      goto LABEL_40;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v8 count];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v8;
    id v10 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v44;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v44 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          objc_opt_class();
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_opt_isKindOfClass() & 1;
          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
          {
            std::string v26 = cslprf_icon_field_log();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              sub_27540();
            }

            *a4 = 1;
            goto LABEL_51;
          }
          __p.__r_.__value_.__r.__words[0] = +[CSLHexAppNode unarchiveFromDictionary:v13];
          id v42 = [__p.__r_.__value_.__l.__data_ hex];
          __int16 v14 = [*(id *)(a1 + 32) nodeAtHex:v42];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v14 == 0;

          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
          {
            std::string v27 = cslprf_icon_field_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              [*(id *)(a1 + 32) nodeAtHex:v42];
              objc_claimAutoreleasedReturnValue();
              sub_275A8();
            }

            *a4 = 1;
            goto LABEL_51;
          }
          sub_1A4CC(*(void *)(a1 + 32) + 32, (int *)&v42, &v42, (uint64_t *)&__p);
          long long v15 = *(void **)(*(void *)(a1 + 32) + 136);
          std::string::size_type v16 = __p.__r_.__value_.__r.__words[0];
          id v17 = [__p.__r_.__value_.__l.__data_ bundleIdentifier];
          [v15 setObject:v16 forKey:v17];
        }
        id v10 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_51:
  }
  else
  {
    objc_opt_class();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_opt_isKindOfClass() & 1;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      Hex v9 = cslprf_icon_field_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_27600();
      }
      goto LABEL_40;
    }
    id v18 = v7;
    id v19 = v8;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v19 count] == (char *)&def_1AB14 + 2;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      unsigned __int8 v20 = [v19 firstObject];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_opt_respondsToSelector() & 1;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        std::string v21 = [v19 lastObject];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_opt_respondsToSelector() & 1;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
        {
          id v22 = v20;
          id v23 = v21;
          id obja = v22;
          LODWORD(v42) = [v22 intValue];
          HIDWORD(v42) = [v23 intValue];
          std::string v24 = [*(id *)(a1 + 32) nodeAtHex:v42];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v24 == 0;

          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
          {
            *(void *)buf = [[CSLHexAppNode alloc] initWithBundleIdentifier:v18 hex:v42];
            sub_1A4CC(*(void *)(a1 + 32) + 32, (int *)&v42, &v42, (uint64_t *)buf);
            [*(id *)(*(void *)(a1 + 32) + 136) setObject:*(void *)buf forKey:v18];
          }
          else
          {
            long long v32 = cslprf_icon_field_log();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              log = v32;
              sub_10F6C((int *)&v42, &__p);
              int v37 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
              std::string::size_type v33 = __p.__r_.__value_.__r.__words[0];
              uint64_t v34 = [*(id *)(a1 + 32) nodeAtHex:v42];
              v35 = (void *)v34;
              p_p = &__p;
              *(_DWORD *)buf = 138412802;
              if (v37 < 0) {
                p_p = (std::string *)v33;
              }
              *(void *)&uint8_t buf[4] = v18;
              __int16 v48 = 2080;
              uint64_t v49 = p_p;
              __int16 v50 = 2112;
              uint64_t v51 = v34;
              _os_log_error_impl(&def_1AB14, log, OS_LOG_TYPE_ERROR, "invalid defaults (%@ %s repeated location from %@)", buf, 0x20u);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }

              long long v32 = log;
            }

            *a4 = 1;
          }
        }
        else
        {
          long long v30 = cslprf_icon_field_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            long long v31 = objc_opt_class();
            sub_276D0((uint64_t)v21, v31, (uint64_t)buf);
          }

          *a4 = 1;
        }
      }
      else
      {
        std::string v28 = cslprf_icon_field_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = objc_opt_class();
          sub_276D0((uint64_t)v20, v29, (uint64_t)buf);
        }

        *a4 = 1;
      }
    }
    else
    {
      std::string v25 = cslprf_icon_field_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_27668();
      }

      *a4 = 1;
    }
  }
LABEL_41:
}

void sub_17CDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  _Unwind_Resume(a1);
}

void sub_17E7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_18488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (__p) {
    operator delete(__p);
  }
  if (a14) {
    operator delete(a14);
  }
  sub_60D0((uint64_t)&a18);

  _Unwind_Resume(a1);
}

void sub_18544(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_19C80();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    Hex v6 = (char *)sub_57A4(v3, a2);
    id v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    Hex v9 = &v6[8 * v8];
    uint64_t v11 = (char *)*a1;
    id v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      id v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_1888C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  _Unwind_Resume(a1);
}

void sub_18C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  _Unwind_Resume(a1);
}

int64_t sub_18D74(id a1, CSLHexAppNode *a2, CSLHexAppNode *a3)
{
  uint64_t v4 = a2;
  int64_t v5 = a3;
  Hex v6 = [(CSLHexAppNode *)v4 hex];
  Hex v7 = [(CSLHexAppNode *)v5 hex];
  if (v6.r == v7.r)
  {
    if (v6.q < v7.q)
    {
LABEL_3:
      int64_t v8 = -1;
      goto LABEL_8;
    }
  }
  else if (v6.r < v7.r)
  {
    goto LABEL_3;
  }
  Hex v9 = [(CSLHexAppNode *)v4 hex];
  Hex v10 = [(CSLHexAppNode *)v5 hex];
  if (v10.r == v9.r) {
    int64_t v8 = v10.q < v9.q;
  }
  else {
    int64_t v8 = v10.r < v9.r;
  }
LABEL_8:

  return v8;
}

void sub_18E20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_18E40(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_18EF4();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    Hex v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    Hex v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_18EF4()
{
}

void sub_18F0C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_18F68(exception, a1);
}

void sub_18F54(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_18F68(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_18FB4(int a1, int a2, int a3)
{
  if (a2 < a1) {
    unsigned int v3 = 4;
  }
  else {
    unsigned int v3 = 5;
  }
  if (a2) {
    int v4 = 2;
  }
  else {
    int v4 = 3;
  }
  if (a2 <= 0) {
    unsigned int v3 = v4;
  }
  if (a2) {
    int v5 = 7;
  }
  else {
    int v5 = 8;
  }
  if (a1)
  {
    int v6 = 10;
  }
  else
  {
    int v5 = 6;
    int v6 = 1;
  }
  if (a2 > a1) {
    int v6 = 9;
  }
  if (a2 < 0) {
    int v5 = v6;
  }
  if (a1 <= 0) {
    unsigned int v3 = v5;
  }
  if (a1 | a3 | a2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t sub_1901C(uint64_t a1, int *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 8 * a3;
    do
    {
      sub_19094(a1, a2, a2);
      a2 += 2;
      v5 -= 8;
    }
    while (v5);
  }
  return a1;
}

void sub_19080(_Unwind_Exception *a1)
{
  sub_60D0(v1);
  _Unwind_Resume(a1);
}

void *sub_19094(uint64_t a1, int *a2, void *a3)
{
  int v6 = *a2;
  unsigned int v7 = a2[1];
  unint64_t v8 = v7 | (*a2 << 16);
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7 | (v6 << 16);
      if (v9 <= v8) {
        unint64_t v3 = v8 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
    uint64_t v11 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      uint64_t v12 = *v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (*((_DWORD *)v12 + 4) == v6 && *((_DWORD *)v12 + 5) == v7) {
              return v12;
            }
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v3) {
              break;
            }
          }
          uint64_t v12 = (void *)*v12;
        }
        while (v12);
      }
    }
  }
  uint64_t v12 = operator new(0x18uLL);
  *uint64_t v12 = 0;
  v12[1] = v8;
  v12[2] = *a3;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_192BC(a1, v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= v8) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v21 = *(void *)a1;
  id v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *uint64_t v12 = *v22;
LABEL_42:
    *id v22 = v12;
    goto LABEL_43;
  }
  *uint64_t v12 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v12;
  *(void *)(v21 + 8 * v3) = a1 + 16;
  if (*v12)
  {
    unint64_t v23 = *(void *)(*v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9) {
        v23 %= v9;
      }
    }
    else
    {
      v23 &= v9 - 1;
    }
    id v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
  return v12;
}

void sub_192A8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_192BC(uint64_t a1, size_t __n)
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
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_193AC(a1, prime);
    }
  }
}

void sub_193AC(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_5770();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            *uint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint8x8_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

float sub_19508(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a2;
  *(void *)a1 = *a2;
  uint64_t v9 = *a3;
  *(void *)(a1 + 8) = *a3;
  int v5 = v9 - v3;
  BOOL v4 = (int)v9 - (int)v3 < 0;
  unint64_t v6 = HIDWORD(v3);
  int v7 = HIDWORD(v9) + v9;
  int v8 = v3 - (HIDWORD(v9) + v9) + HIDWORD(v3);
  LODWORD(v9) = HIDWORD(v9) - HIDWORD(v3);
  if (v4) {
    unsigned int v10 = -v5;
  }
  else {
    unsigned int v10 = v5;
  }
  if (v8 < 0) {
    int v8 = -v8;
  }
  if ((int)v9 >= 0) {
    unsigned int v11 = HIDWORD(v9) - HIDWORD(v3);
  }
  else {
    unsigned int v11 = HIDWORD(v3) - HIDWORD(v9);
  }
  if (v10 <= v11) {
    unsigned int v12 = v11;
  }
  else {
    unsigned int v12 = v10;
  }
  BOOL v13 = v8 >= v11 && v8 >= v10;
  float v14 = (float)(int)v3;
  if (v13) {
    int v15 = v8;
  }
  else {
    int v15 = v12;
  }
  int v16 = HIDWORD(v3) + v3;
  *(_DWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 20) = v15;
  *(float *)(a1 + 24) = v14;
  *(float *)(a1 + 28) = (float)-v16;
  *(float *)(a1 + 32) = (float)(int)v6;
  if (v15) {
    float v17 = 1.0 / (double)v15;
  }
  else {
    float v17 = 0.0;
  }
  *(float *)(a1 + 36) = v17;
  *(float *)(a1 + 40) = v17 * (float)v5;
  float v18 = v17 * (float)(v16 - v7);
  float result = v17 * (float)(int)v9;
  *(float *)(a1 + 44) = v18;
  *(float *)(a1 + 48) = result;
  return result;
}

uint64_t *sub_195C0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a2;
  a1[3] = 0;
  *((_DWORD *)a1 + 8) = 0;
  int v6 = a3 - a2;
  int v7 = HIDWORD(a2) + a2 - (a3 + HIDWORD(a3));
  int v8 = HIDWORD(a3) - HIDWORD(a2);
  uint64_t v9 = sub_19790((int)a3 - (int)a2, v7, HIDWORD(a3) - HIDWORD(a2));
  *((_DWORD *)a1 + 7) = v9;
  unsigned int v10 = HIDWORD(v9) - 6;
  if ((HIDWORD(v9) - 6) < 6)
  {
    if ((HIDWORD(v9) - 5) >= 6) {
      int v11 = HIDWORD(v9) - 11;
    }
    else {
      int v11 = HIDWORD(v9) - 5;
    }
    if (v10 >= 3) {
      int v12 = HIDWORD(v9) - 9;
    }
    else {
      int v12 = HIDWORD(v9) - 6;
    }
    int v13 = v8;
    if (v12)
    {
      if (v12 == 1) {
        int v13 = v7;
      }
      else {
        int v13 = v6;
      }
    }
    if (v13 >= 0) {
      int v14 = v13;
    }
    else {
      int v14 = -v13;
    }
    if ((v11 + 1) % 3u)
    {
      int v8 = v7;
      if ((v11 + 1) % 3u != 1) {
        int v8 = v6;
      }
    }
    if (v8 >= 0) {
      int v15 = v8;
    }
    else {
      int v15 = -v8;
    }
    uint64_t v25 = *a1;
    uint64_t v16 = *(void *)sub_4F4C(&v25, v10, v14);
    uint64_t v25 = *a1;
    uint64_t v17 = *(void *)sub_4F4C(&v25, v11, v15);
    int v18 = sub_19830(a2, v16, 0);
    int v19 = sub_19830(v16, a3, 0);
    if (v19 >= v18) {
      int v20 = v18;
    }
    else {
      int v20 = v19;
    }
    int v21 = sub_19830(a2, v17, 0);
    int v22 = sub_19830(v17, a3, 0);
    if (v22 >= v21) {
      int v23 = v21;
    }
    else {
      int v23 = v22;
    }
    if (v20 >= v23)
    {
      *((_DWORD *)a1 + 8) = v14;
      *((_DWORD *)a1 + 9) = v10;
      *((_DWORD *)a1 + 10) = v11;
    }
    else
    {
      *((_DWORD *)a1 + 8) = v15;
      *((_DWORD *)a1 + 9) = v11;
      *((_DWORD *)a1 + 10) = v10;
    }
  }
  else if (HIDWORD(v9) <= 5)
  {
    a1[4] = v9;
  }
  return a1;
}

uint64_t sub_19790(int a1, int a2, int a3)
{
  if (a1 >= 0) {
    LODWORD(v3) = a1;
  }
  else {
    LODWORD(v3) = -a1;
  }
  if (a2 >= 0) {
    unsigned int v4 = a2;
  }
  else {
    unsigned int v4 = -a2;
  }
  if (a3 >= 0) {
    unsigned int v5 = a3;
  }
  else {
    unsigned int v5 = -a3;
  }
  uint64_t v6 = 0x800000000;
  if (a3 > 0) {
    uint64_t v6 = 0xB00000000;
  }
  uint64_t v7 = 0xA00000000;
  if (a1 > 0) {
    uint64_t v7 = 0x700000000;
  }
  uint64_t v8 = 0x500000000;
  if (a1 > 0) {
    uint64_t v8 = 0x200000000;
  }
  if (v3 == v5) {
    uint64_t v7 = v8;
  }
  if (v3 >= v5) {
    unsigned int v9 = v3;
  }
  else {
    unsigned int v9 = v5;
  }
  if (v3 >= v5) {
    uint64_t v6 = v7;
  }
  uint64_t v10 = 0x600000000;
  if (a2 > 0) {
    uint64_t v10 = 0x900000000;
  }
  uint64_t v11 = 0x300000000;
  if (a2 <= 0) {
    uint64_t v11 = 0;
  }
  if (v4 == v5) {
    uint64_t v10 = v11;
  }
  uint64_t v12 = 0x100000000;
  if (a2 > 0) {
    uint64_t v12 = 0x400000000;
  }
  BOOL v13 = v4 >= v3;
  if (v4 == v3) {
    uint64_t v10 = v12;
  }
  else {
    LODWORD(v3) = v4;
  }
  BOOL v14 = v13 && v4 >= v5;
  if (v14) {
    uint64_t v3 = v3;
  }
  else {
    uint64_t v3 = v9;
  }
  if (v14) {
    uint64_t v15 = v10;
  }
  else {
    uint64_t v15 = v6;
  }
  return v15 | v3;
}

uint64_t sub_19830(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v3 = a3;
  unint64_t v4 = HIDWORD(a3);
  uint64_t v5 = sub_19898(a1, a2, a3);
  unsigned int v6 = v5 - v3;
  unsigned int v7 = v4 + v3 - (v5 + HIDWORD(v5));
  int v8 = HIDWORD(v5) - v4;
  if ((int)v5 - v3 < 0) {
    unsigned int v6 = v3 - v5;
  }
  if ((v7 & 0x80000000) != 0) {
    unsigned int v7 = v5 + HIDWORD(v5) - (v4 + v3);
  }
  if (v8 < 0) {
    int v8 = v4 - HIDWORD(v5);
  }
  if (v6 <= v8) {
    unsigned int v9 = v8;
  }
  else {
    unsigned int v9 = v6;
  }
  if (v7 >= v8 && v7 >= v6) {
    return v7;
  }
  else {
    return v9;
  }
}

uint64_t sub_19898(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = a1;
  unint64_t v9 = (a3 - a1) | ((unint64_t)(HIDWORD(a3) - HIDWORD(a1)) << 32);
  uint64_t v10 = a2;
  int v3 = HIDWORD(a2) - HIDWORD(a1) + a2 - a1;
  int v4 = HIDWORD(a3) - HIDWORD(a1) + a3 - a1;
  int v5 = (a2 - a1) * (a3 - a1) + (HIDWORD(a3) - HIDWORD(a1)) * (HIDWORD(a2) - HIDWORD(a1)) + v4 * v3;
  if (v5 < 1)
  {
    unsigned int v7 = &v11;
  }
  else
  {
    int v6 = (a3 - a1) * (a3 - a1) + (HIDWORD(a3) - HIDWORD(a1)) * (HIDWORD(a3) - HIDWORD(a1)) + v4 * v4;
    if (v6 <= v5) {
      unsigned int v7 = &v10;
    }
    else {
      unsigned int v7 = (uint64_t *)sub_36B0(&v9, (float)(int)a1 + (float)((float)((float)v5 / (float)v6) * (float)(a2 - a1)), (float)(-(int)a1 - HIDWORD(a1)) + (float)((float)((float)v5 / (float)v6) * (float)-v3), (float)SHIDWORD(a1)+ (float)((float)((float)v5 / (float)v6) * (float)(HIDWORD(a2) - HIDWORD(a1))));
    }
  }
  return *v7;
}

uint64_t sub_19968(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  sub_192BC(a1, *(void *)(a2 + 8));
  for (i = *(int **)(a2 + 16); i; i = *(int **)i)
    sub_199E0(a1, i + 4, (_OWORD *)i + 1);
  return a1;
}

void sub_199C8(_Unwind_Exception *a1)
{
  sub_60D0(v1);
  _Unwind_Resume(a1);
}

void *sub_199E0(uint64_t a1, int *a2, _OWORD *a3)
{
  int v6 = *a2;
  unsigned int v7 = a2[1];
  unint64_t v8 = v7 | (*a2 << 16);
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7 | (v6 << 16);
      if (v9 <= v8) {
        unint64_t v3 = v8 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
    uint64_t v11 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      uint64_t v12 = *v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (*((_DWORD *)v12 + 4) == v6 && *((_DWORD *)v12 + 5) == v7) {
              return v12;
            }
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v3) {
              break;
            }
          }
          uint64_t v12 = (void *)*v12;
        }
        while (v12);
      }
    }
  }
  uint64_t v12 = operator new(0x20uLL);
  *uint64_t v12 = 0;
  v12[1] = v8;
  *((_OWORD *)v12 + 1) = *a3;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_192BC(a1, v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= v8) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v21 = *(void *)a1;
  int v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *uint64_t v12 = *v22;
LABEL_42:
    *int v22 = v12;
    goto LABEL_43;
  }
  *uint64_t v12 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v12;
  *(void *)(v21 + 8 * v3) = a1 + 16;
  if (*v12)
  {
    unint64_t v23 = *(void *)(*v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9) {
        v23 %= v9;
      }
    }
    else
    {
      v23 &= v9 - 1;
    }
    int v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
  return v12;
}

void sub_19BF4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C08(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  sub_192BC(a1, *(void *)(a2 + 8));
  for (i = *(int **)(a2 + 16); i; i = *(int **)i)
    sub_19094(a1, i + 4, (void *)i + 2);
  return a1;
}

void sub_19C68(_Unwind_Exception *a1)
{
  sub_60D0(v1);
  _Unwind_Resume(a1);
}

void sub_19C80()
{
}

char *sub_19C98(uint64_t a1, char *__src, void *a3, void *a4, uint64_t a5)
{
  int v5 = __src;
  if (a5 >= 1)
  {
    unsigned int v7 = a3;
    uint64_t v11 = *(void *)(a1 + 16);
    uint64_t v9 = a1 + 16;
    uint64_t v10 = v11;
    unint64_t v12 = *(void *)(v9 - 8);
    if (a5 <= (uint64_t)(v11 - v12) >> 3)
    {
      unint64_t v19 = a5 + 1;
      size_t v20 = a3;
      do
      {
        size_t v20 = (void *)*v20;
        --v19;
      }
      while (v19 > 1);
      uint64_t v21 = (uint64_t)(v12 - (void)__src) >> 3;
      if (v21 >= a5)
      {
        unint64_t v23 = *(char **)(v9 - 8);
        uint64_t v21 = a5;
      }
      else
      {
        if ((uint64_t)(v12 - (void)__src) < 1)
        {
          size_t v20 = a3;
        }
        else
        {
          unint64_t v22 = v21 + 1;
          size_t v20 = a3;
          do
          {
            size_t v20 = (void *)*v20;
            --v22;
          }
          while (v22 > 1);
        }
        unint64_t v23 = *(char **)(v9 - 8);
        if (v20 != a4)
        {
          std::string v27 = v20;
          std::string v28 = *(void **)(v9 - 8);
          do
          {
            *v28++ = v27[2];
            std::string v27 = (void *)*v27;
            v23 += 8;
          }
          while (v27 != a4);
        }
        *(void *)(a1 + 8) = v23;
      }
      if (v21 >= 1)
      {
        v29 = &__src[8 * a5];
        long long v30 = &v23[-8 * a5];
        long long v31 = v23;
        if ((unint64_t)v30 < v12)
        {
          long long v31 = v23;
          do
          {
            uint64_t v32 = *(void *)v30;
            v30 += 8;
            *(void *)long long v31 = v32;
            v31 += 8;
          }
          while ((unint64_t)v30 < v12);
        }
        *(void *)(a1 + 8) = v31;
        if (v23 != v29) {
          memmove(&v23[-8 * ((v23 - v29) >> 3)], __src, v23 - v29);
        }
        if (v20 != v7)
        {
          std::string::size_type v33 = v5;
          do
          {
            *(void *)std::string::size_type v33 = v7[2];
            v33 += 8;
            unsigned int v7 = (void *)*v7;
          }
          while (v7 != v20);
        }
      }
    }
    else
    {
      unint64_t v13 = *(unsigned char **)a1;
      unint64_t v14 = a5 + ((uint64_t)(v12 - *(void *)a1) >> 3);
      if (v14 >> 61) {
        sub_19C80();
      }
      uint64_t v15 = (__src - v13) >> 3;
      uint64_t v16 = v10 - (void)v13;
      if (v16 >> 2 > v14) {
        unint64_t v14 = v16 >> 2;
      }
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v17 = v14;
      }
      uint64_t v39 = v9;
      if (v17) {
        unint64_t v18 = (char *)sub_57A4(v9, v17);
      }
      else {
        unint64_t v18 = 0;
      }
      std::string v24 = &v18[8 * v15];
      std::string __p = v18;
      uint64_t v36 = v24;
      v38 = &v18[8 * v17];
      uint64_t v25 = 8 * a5;
      std::string v26 = &v24[8 * a5];
      do
      {
        *(void *)std::string v24 = v7[2];
        v24 += 8;
        unsigned int v7 = (void *)*v7;
        v25 -= 8;
      }
      while (v25);
      int v37 = v26;
      int v5 = sub_19EFC((void **)a1, (uint64_t)&__p, v5);
      if (v37 != v36) {
        v37 += (v36 - v37 + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      if (__p) {
        operator delete(__p);
      }
    }
  }
  return v5;
}

void sub_19EC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_19EFC(void **a1, uint64_t a2, char *__src)
{
  int v5 = *(char **)(a2 + 8);
  int v6 = (char *)*a1;
  unsigned int v7 = v5;
  if (*a1 != __src)
  {
    unint64_t v8 = __src;
    unsigned int v7 = *(char **)(a2 + 8);
    do
    {
      uint64_t v9 = *((void *)v8 - 1);
      v8 -= 8;
      *((void *)v7 - 1) = v9;
      v7 -= 8;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  uint64_t v10 = a1[1];
  uint64_t v11 = *(void *)(a2 + 16);
  int64_t v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    unsigned int v7 = *(char **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v11 + v12;
  unint64_t v13 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v13;
  unint64_t v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v14;
  uint64_t v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v15;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void *sub_19FC4(void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    float result = (void *)result[2];
    if (result)
    {
      do
      {
        int v2 = (void *)*result;
        operator delete(result);
        float result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void *sub_1A02C(uint64_t a1, int *a2, void *a3, _DWORD *a4)
{
  int v8 = *a2;
  unsigned int v9 = a2[1];
  unint64_t v10 = v9 | (*a2 << 16);
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9 | (v8 << 16);
      if (v11 <= v10) {
        unint64_t v4 = v10 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
    unint64_t v13 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v13)
    {
      unint64_t v14 = *v13;
      if (*v13)
      {
        do
        {
          unint64_t v15 = v14[1];
          if (v15 == v10)
          {
            if (*((_DWORD *)v14 + 4) == v8 && *((_DWORD *)v14 + 5) == v9) {
              return v14;
            }
          }
          else
          {
            if (v12.u32[0] > 1uLL)
            {
              if (v15 >= v11) {
                v15 %= v11;
              }
            }
            else
            {
              v15 &= v11 - 1;
            }
            if (v15 != v4) {
              break;
            }
          }
          unint64_t v14 = (void *)*v14;
        }
        while (v14);
      }
    }
  }
  unint64_t v14 = operator new(0x20uLL);
  *unint64_t v14 = 0;
  v14[1] = v10;
  v14[2] = *a3;
  *((_DWORD *)v14 + 6) = *a4;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    sub_192BC(a1, v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v11 <= v10) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  uint64_t v23 = *(void *)a1;
  std::string v24 = *(void **)(*(void *)a1 + 8 * v4);
  if (v24)
  {
    *unint64_t v14 = *v24;
LABEL_42:
    *std::string v24 = v14;
    goto LABEL_43;
  }
  *unint64_t v14 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v14;
  *(void *)(v23 + 8 * v4) = a1 + 16;
  if (*v14)
  {
    unint64_t v25 = *(void *)(*v14 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v25 >= v11) {
        v25 %= v11;
      }
    }
    else
    {
      v25 &= v11 - 1;
    }
    std::string v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_1A254(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_1A268(uint64_t a1, int *a2, uint64_t a3, void **a4)
{
  int v7 = *a2;
  unsigned int v8 = a2[1];
  unint64_t v9 = v8 | (*a2 << 16);
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = v8 | (v7 << 16);
      if (v10 <= v9) {
        unint64_t v4 = v9 % v10;
      }
    }
    else
    {
      unint64_t v4 = (v10 - 1) & v9;
    }
    uint8x8_t v12 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v12)
    {
      unint64_t v13 = *v12;
      if (*v12)
      {
        do
        {
          unint64_t v14 = v13[1];
          if (v14 == v9)
          {
            if (*((_DWORD *)v13 + 4) == v7 && *((_DWORD *)v13 + 5) == v8) {
              return v13;
            }
          }
          else
          {
            if (v11.u32[0] > 1uLL)
            {
              if (v14 >= v10) {
                v14 %= v10;
              }
            }
            else
            {
              v14 &= v10 - 1;
            }
            if (v14 != v4) {
              break;
            }
          }
          unint64_t v13 = (void *)*v13;
        }
        while (v13);
      }
    }
  }
  unint64_t v13 = operator new(0x20uLL);
  *unint64_t v13 = 0;
  v13[1] = v9;
  v13[2] = **a4;
  v13[3] = 0;
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    sub_192BC(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v10 <= v9) {
        unint64_t v4 = v9 % v10;
      }
      else {
        unint64_t v4 = v9;
      }
    }
    else
    {
      unint64_t v4 = (v10 - 1) & v9;
    }
  }
  uint64_t v22 = *(void *)a1;
  uint64_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *unint64_t v13 = *v23;
LABEL_42:
    *uint64_t v23 = v13;
    goto LABEL_43;
  }
  *unint64_t v13 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v13;
  *(void *)(v22 + 8 * v4) = a1 + 16;
  if (*v13)
  {
    unint64_t v24 = *(void *)(*v13 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v24 >= v10) {
        v24 %= v10;
      }
    }
    else
    {
      v24 &= v10 - 1;
    }
    uint64_t v23 = (void *)(*(void *)a1 + 8 * v24);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
  return v13;
}

void sub_1A480(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_1A494(void *a1, int *a2)
{
  float result = sub_5D44(a1, a2);
  if (result)
  {
    sub_5E00(a1, result);
    return (void *)(&def_1AB14 + 1);
  }
  return result;
}

void *sub_1A4CC(uint64_t a1, int *a2, void *a3, uint64_t *a4)
{
  int v8 = *a2;
  unsigned int v9 = a2[1];
  unint64_t v10 = v9 | (*a2 << 16);
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9 | (v8 << 16);
      if (v11 <= v10) {
        unint64_t v4 = v10 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
    unint64_t v13 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v13)
    {
      unint64_t v14 = *v13;
      if (*v13)
      {
        do
        {
          unint64_t v15 = v14[1];
          if (v15 == v10)
          {
            if (*((_DWORD *)v14 + 4) == v8 && *((_DWORD *)v14 + 5) == v9) {
              return v14;
            }
          }
          else
          {
            if (v12.u32[0] > 1uLL)
            {
              if (v15 >= v11) {
                v15 %= v11;
              }
            }
            else
            {
              v15 &= v11 - 1;
            }
            if (v15 != v4) {
              break;
            }
          }
          unint64_t v14 = (void *)*v14;
        }
        while (v14);
      }
    }
  }
  unint64_t v14 = operator new(0x20uLL);
  *unint64_t v14 = 0;
  v14[1] = v10;
  uint64_t v17 = *a4;
  v14[2] = *a3;
  v14[3] = v17;
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v19 = *(float *)(a1 + 32);
  if (!v11 || (float)(v19 * (float)v11) < v18)
  {
    BOOL v20 = 1;
    if (v11 >= 3) {
      BOOL v20 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v11);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    sub_192BC(a1, v23);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v11 <= v10) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  uint64_t v24 = *(void *)a1;
  unint64_t v25 = *(void **)(*(void *)a1 + 8 * v4);
  if (v25)
  {
    *unint64_t v14 = *v25;
LABEL_42:
    *unint64_t v25 = v14;
    goto LABEL_43;
  }
  *unint64_t v14 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v14;
  *(void *)(v24 + 8 * v4) = a1 + 16;
  if (*v14)
  {
    unint64_t v26 = *(void *)(*v14 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v26 >= v11) {
        v26 %= v11;
      }
    }
    else
    {
      v26 &= v11 - 1;
    }
    unint64_t v25 = (void *)(*(void *)a1 + 8 * v26);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_1A6F0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1A704(uint64_t result, uint64_t *a2, uint64_t a3, char a4)
{
  unsigned int v9 = (uint64_t *)result;
  while (2)
  {
    unint64_t v10 = a2 - 1;
    v115 = a2;
    v116 = a2 - 2;
    v113 = a2 - 3;
    unint64_t v11 = v9;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          unsigned int v9 = v11;
          uint64_t v12 = (char *)a2 - (char *)v11;
          uint64_t v13 = a2 - v11;
          if (v5 || !v4)
          {
            switch(v13)
            {
              case 0:
              case 1:
                return result;
              case 2:
                uint64_t v53 = *(a2 - 1);
                uint64_t v119 = *v9;
                uint64_t v120 = v53;
                int v54 = sub_1B40C((int *)&v120);
                float result = sub_1B40C((int *)&v119);
                if (v54 < (int)result)
                {
                  uint64_t v55 = *v9;
                  *unsigned int v9 = *(a2 - 1);
                  *(a2 - 1) = v55;
                }
                break;
              case 3:
                float result = sub_1B0D4(v9, v9 + 1, v10);
                break;
              case 4:
                float result = sub_1B5DC(v9, v9 + 1, v9 + 2, v10);
                break;
              case 5:
                float result = sub_1AFA8(v9, v9 + 1, v9 + 2, v9 + 3, v10);
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          if (v12 <= 191)
          {
            v56 = v9 + 1;
            BOOL v58 = v9 == a2 || v56 == a2;
            if (a4)
            {
              if (!v58)
              {
                uint64_t v59 = 0;
                v60 = v9;
                do
                {
                  uint64_t v62 = *v60;
                  uint64_t v61 = v60[1];
                  v60 = v56;
                  uint64_t v119 = v62;
                  uint64_t v120 = v61;
                  int v63 = sub_1B40C((int *)&v120);
                  float result = sub_1B40C((int *)&v119);
                  if (v63 < (int)result)
                  {
                    uint64_t v64 = *v60;
                    uint64_t v65 = v59;
                    while (1)
                    {
                      *(uint64_t *)((char *)v9 + v65 + 8) = *(uint64_t *)((char *)v9 + v65);
                      if (!v65) {
                        break;
                      }
                      uint64_t v119 = *(uint64_t *)((char *)v9 + v65 - 8);
                      uint64_t v120 = v64;
                      int v66 = sub_1B40C((int *)&v120);
                      float result = sub_1B40C((int *)&v119);
                      v65 -= 8;
                      if (v66 >= (int)result)
                      {
                        v67 = (uint64_t *)((char *)v9 + v65 + 8);
                        goto LABEL_75;
                      }
                    }
                    v67 = v9;
LABEL_75:
                    uint64_t *v67 = v64;
                    a2 = v115;
                  }
                  v56 = v60 + 1;
                  v59 += 8;
                }
                while (v60 + 1 != a2);
              }
            }
            else if (!v58)
            {
              do
              {
                uint64_t v106 = *v9;
                uint64_t v105 = v9[1];
                unsigned int v9 = v56;
                uint64_t v119 = v106;
                uint64_t v120 = v105;
                int v107 = sub_1B40C((int *)&v120);
                float result = sub_1B40C((int *)&v119);
                if (v107 < (int)result)
                {
                  uint64_t v108 = *v9;
                  v109 = v9;
                  do
                  {
                    v110 = v109;
                    uint64_t v111 = *--v109;
                    uint64_t *v110 = v111;
                    uint64_t v119 = *(v110 - 2);
                    uint64_t v120 = v108;
                    int v112 = sub_1B40C((int *)&v120);
                    float result = sub_1B40C((int *)&v119);
                  }
                  while (v112 < (int)result);
                  uint64_t *v109 = v108;
                }
                v56 = v9 + 1;
              }
              while (v9 + 1 != a2);
            }
            return result;
          }
          if (!a3)
          {
            if (v9 != a2)
            {
              int64_t v68 = (unint64_t)(v13 - 2) >> 1;
              int64_t v117 = v68;
              do
              {
                int64_t v69 = v68;
                if (v117 >= v68)
                {
                  uint64_t v70 = (2 * v68) | 1;
                  v71 = &v9[v70];
                  if (2 * v68 + 2 < v13)
                  {
                    uint64_t v72 = *v71;
                    uint64_t v119 = v71[1];
                    uint64_t v120 = v72;
                    int v73 = sub_1B40C((int *)&v120);
                    int v74 = sub_1B40C((int *)&v119);
                    if (v73 < v74) {
                      ++v71;
                    }
                    a2 = v115;
                    if (v73 < v74) {
                      uint64_t v70 = 2 * v69 + 2;
                    }
                  }
                  v75 = &v9[v69];
                  uint64_t v76 = *v71;
                  uint64_t v119 = *v75;
                  uint64_t v120 = v76;
                  int v77 = sub_1B40C((int *)&v120);
                  float result = sub_1B40C((int *)&v119);
                  if (v77 >= (int)result)
                  {
                    int64_t v114 = v69;
                    uint64_t v78 = *v75;
                    do
                    {
                      v79 = v71;
                      uint64_t *v75 = *v71;
                      if (v117 < v70) {
                        break;
                      }
                      uint64_t v80 = (2 * v70) | 1;
                      v71 = &v9[v80];
                      if (2 * v70 + 2 < v13)
                      {
                        uint64_t v81 = *v71;
                        uint64_t v119 = v71[1];
                        uint64_t v120 = v81;
                        int v82 = sub_1B40C((int *)&v120);
                        if (v82 < (int)sub_1B40C((int *)&v119))
                        {
                          ++v71;
                          uint64_t v80 = 2 * v70 + 2;
                        }
                      }
                      uint64_t v83 = *v71;
                      uint64_t v119 = v78;
                      uint64_t v120 = v83;
                      int v84 = sub_1B40C((int *)&v120);
                      float result = sub_1B40C((int *)&v119);
                      v75 = v79;
                      uint64_t v70 = v80;
                    }
                    while (v84 >= (int)result);
                    uint64_t *v79 = v78;
                    int64_t v69 = v114;
                    a2 = v115;
                  }
                }
                int64_t v68 = v69 - 1;
              }
              while (v69);
              uint64_t v85 = (unint64_t)v12 >> 3;
              do
              {
                uint64_t v86 = 0;
                uint64_t v118 = *v9;
                v87 = v9;
                do
                {
                  v88 = &v87[v86 + 1];
                  uint64_t v89 = (2 * v86) | 1;
                  uint64_t v90 = 2 * v86 + 2;
                  if (v90 < v85)
                  {
                    uint64_t v91 = *v88;
                    uint64_t v119 = v88[1];
                    uint64_t v120 = v91;
                    int v92 = sub_1B40C((int *)&v120);
                    float result = sub_1B40C((int *)&v119);
                    if (v92 < (int)result)
                    {
                      ++v88;
                      uint64_t v89 = v90;
                    }
                  }
                  uint64_t *v87 = *v88;
                  v87 = v88;
                  uint64_t v86 = v89;
                }
                while (v89 <= (uint64_t)((unint64_t)(v85 - 2) >> 1));
                v93 = a2 - 1;
                if (v88 == a2 - 1)
                {
                  v94 = a2 - 1;
                  uint64_t *v88 = v118;
                }
                else
                {
                  uint64_t *v88 = *v93;
                  v94 = a2 - 1;
                  uint64_t *v93 = v118;
                  uint64_t v95 = (char *)v88 - (char *)v9 + 8;
                  if (v95 >= 9)
                  {
                    unint64_t v96 = (((unint64_t)v95 >> 3) - 2) >> 1;
                    v97 = &v9[v96];
                    uint64_t v98 = *v97;
                    uint64_t v119 = *v88;
                    uint64_t v120 = v98;
                    int v99 = sub_1B40C((int *)&v120);
                    float result = sub_1B40C((int *)&v119);
                    if (v99 < (int)result)
                    {
                      uint64_t v100 = *v88;
                      do
                      {
                        v101 = v97;
                        uint64_t *v88 = *v97;
                        if (!v96) {
                          break;
                        }
                        unint64_t v96 = (v96 - 1) >> 1;
                        v97 = &v9[v96];
                        uint64_t v102 = *v97;
                        uint64_t v119 = v100;
                        uint64_t v120 = v102;
                        int v103 = sub_1B40C((int *)&v120);
                        float result = sub_1B40C((int *)&v119);
                        v88 = v101;
                      }
                      while (v103 < (int)result);
                      uint64_t *v101 = v100;
                    }
                  }
                }
                BOOL v104 = v85-- <= 2;
                a2 = v94;
              }
              while (!v104);
            }
            return result;
          }
          unint64_t v14 = (unint64_t)v13 >> 1;
          unint64_t v15 = &v9[(unint64_t)v13 >> 1];
          if ((unint64_t)v12 < 0x401)
          {
            sub_1B0D4(v15, v9, v10);
          }
          else
          {
            sub_1B0D4(v9, v15, v10);
            sub_1B0D4(v9 + 1, v15 - 1, v116);
            sub_1B0D4(v9 + 2, &v9[v14 + 1], v113);
            sub_1B0D4(v15 - 1, v15, &v9[v14 + 1]);
            uint64_t v16 = *v9;
            *unsigned int v9 = *v15;
            *unint64_t v15 = v16;
          }
          --a3;
          if (a4) {
            break;
          }
          uint64_t v17 = *(v9 - 1);
          uint64_t v119 = *v9;
          uint64_t v120 = v17;
          int v18 = sub_1B40C((int *)&v120);
          if (v18 < (int)sub_1B40C((int *)&v119)) {
            break;
          }
          uint64_t v38 = *v9;
          uint64_t v119 = *v10;
          uint64_t v120 = v38;
          int v39 = sub_1B40C((int *)&v120);
          float result = sub_1B40C((int *)&v119);
          if (v39 >= (int)result)
          {
            id v42 = v9 + 1;
            do
            {
              unint64_t v11 = v42;
              if (v42 >= a2) {
                break;
              }
              ++v42;
              uint64_t v119 = *v11;
              uint64_t v120 = v38;
              int v43 = sub_1B40C((int *)&v120);
              float result = sub_1B40C((int *)&v119);
            }
            while (v43 >= (int)result);
          }
          else
          {
            unint64_t v11 = v9;
            do
            {
              uint64_t v40 = v11[1];
              ++v11;
              uint64_t v119 = v40;
              uint64_t v120 = v38;
              int v41 = sub_1B40C((int *)&v120);
              float result = sub_1B40C((int *)&v119);
            }
            while (v41 >= (int)result);
          }
          long long v44 = a2;
          if (v11 < a2)
          {
            long long v44 = a2;
            do
            {
              uint64_t v45 = *--v44;
              uint64_t v119 = v45;
              uint64_t v120 = v38;
              int v46 = sub_1B40C((int *)&v120);
              float result = sub_1B40C((int *)&v119);
            }
            while (v46 < (int)result);
          }
          while (v11 < v44)
          {
            uint64_t v47 = *v11;
            *unint64_t v11 = *v44;
            uint64_t *v44 = v47;
            do
            {
              uint64_t v48 = v11[1];
              ++v11;
              uint64_t v119 = v48;
              uint64_t v120 = v38;
              int v49 = sub_1B40C((int *)&v120);
            }
            while (v49 >= (int)sub_1B40C((int *)&v119));
            do
            {
              uint64_t v50 = *--v44;
              uint64_t v119 = v50;
              uint64_t v120 = v38;
              int v51 = sub_1B40C((int *)&v120);
              float result = sub_1B40C((int *)&v119);
            }
            while (v51 < (int)result);
          }
          uint64_t v52 = v11 - 1;
          BOOL v4 = v11 - 1 >= v9;
          BOOL v5 = v11 - 1 == v9;
          if (v11 - 1 != v9) {
            *unsigned int v9 = *v52;
          }
          a4 = 0;
          *uint64_t v52 = v38;
        }
        uint64_t v19 = 0;
        uint64_t v20 = *v9;
        do
        {
          uint64_t v21 = v9[v19 + 1];
          uint64_t v119 = v20;
          uint64_t v120 = v21;
          int v22 = sub_1B40C((int *)&v120);
          ++v19;
        }
        while (v22 < (int)sub_1B40C((int *)&v119));
        size_t v23 = &v9[v19];
        uint64_t v24 = v115;
        BOOL v5 = v19 == 1;
        a2 = v115;
        if (v5)
        {
          uint64_t v24 = v115;
          do
          {
            if (v23 >= v24) {
              break;
            }
            uint64_t v27 = *--v24;
            uint64_t v119 = v20;
            uint64_t v120 = v27;
            int v28 = sub_1B40C((int *)&v120);
          }
          while (v28 >= (int)sub_1B40C((int *)&v119));
        }
        else
        {
          do
          {
            uint64_t v25 = *--v24;
            uint64_t v119 = v20;
            uint64_t v120 = v25;
            int v26 = sub_1B40C((int *)&v120);
          }
          while (v26 >= (int)sub_1B40C((int *)&v119));
        }
        if (v23 >= v24)
        {
          uint64_t v36 = v23 - 1;
        }
        else
        {
          v29 = v23;
          long long v30 = v24;
          do
          {
            uint64_t v31 = *v29;
            uint64_t *v29 = *v30;
            *long long v30 = v31;
            do
            {
              uint64_t v32 = v29[1];
              ++v29;
              uint64_t v119 = v20;
              uint64_t v120 = v32;
              int v33 = sub_1B40C((int *)&v120);
            }
            while (v33 < (int)sub_1B40C((int *)&v119));
            do
            {
              uint64_t v34 = *--v30;
              uint64_t v119 = v20;
              uint64_t v120 = v34;
              int v35 = sub_1B40C((int *)&v120);
            }
            while (v35 >= (int)sub_1B40C((int *)&v119));
          }
          while (v29 < v30);
          uint64_t v36 = v29 - 1;
          a2 = v115;
        }
        if (v36 != v9) {
          *unsigned int v9 = *v36;
        }
        *uint64_t v36 = v20;
        if (v23 >= v24) {
          break;
        }
LABEL_33:
        float result = sub_1A704(v9, v36, a3, a4 & 1);
        a4 = 0;
        unint64_t v11 = v36 + 1;
      }
      BOOL v37 = sub_1B218(v9, v36);
      unint64_t v11 = v36 + 1;
      float result = sub_1B218(v36 + 1, a2);
      if (result) {
        break;
      }
      if (!v37) {
        goto LABEL_33;
      }
    }
    a2 = v36;
    if (!v37) {
      continue;
    }
    return result;
  }
}

uint64_t sub_1AFA8(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  sub_1B5DC(a1, a2, a3, a4);
  uint64_t v10 = *a5;
  uint64_t v23 = *a4;
  uint64_t v24 = v10;
  int v11 = sub_1B40C((int *)&v24);
  uint64_t result = sub_1B40C((int *)&v23);
  if (v11 < (int)result)
  {
    uint64_t v13 = *a4;
    *a4 = *a5;
    *a5 = v13;
    uint64_t v14 = *a4;
    uint64_t v23 = *a3;
    uint64_t v24 = v14;
    int v15 = sub_1B40C((int *)&v24);
    uint64_t result = sub_1B40C((int *)&v23);
    if (v15 < (int)result)
    {
      uint64_t v16 = *a3;
      *a3 = *a4;
      *a4 = v16;
      uint64_t v17 = *a3;
      uint64_t v23 = *a2;
      uint64_t v24 = v17;
      int v18 = sub_1B40C((int *)&v24);
      uint64_t result = sub_1B40C((int *)&v23);
      if (v18 < (int)result)
      {
        uint64_t v19 = *a2;
        *a2 = *a3;
        *a3 = v19;
        uint64_t v20 = *a2;
        uint64_t v23 = *a1;
        uint64_t v24 = v20;
        int v21 = sub_1B40C((int *)&v24);
        uint64_t result = sub_1B40C((int *)&v23);
        if (v21 < (int)result)
        {
          uint64_t v22 = *a1;
          *a1 = *a2;
          *a2 = v22;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1B0D4(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = *a2;
  uint64_t v20 = *a1;
  uint64_t v21 = v6;
  int v7 = sub_1B40C((int *)&v21);
  int v8 = sub_1B40C((int *)&v20);
  uint64_t v9 = *a3;
  if (v7 >= v8)
  {
    uint64_t v20 = *a2;
    uint64_t v21 = v9;
    int v13 = sub_1B40C((int *)&v21);
    uint64_t result = sub_1B40C((int *)&v20);
    if (v13 < (int)result)
    {
      uint64_t v14 = *a2;
      *a2 = *a3;
      *a3 = v14;
      uint64_t v15 = *a2;
      uint64_t v20 = *a1;
      uint64_t v21 = v15;
      int v16 = sub_1B40C((int *)&v21);
      uint64_t result = sub_1B40C((int *)&v20);
      if (v16 < (int)result)
      {
        uint64_t v17 = *a1;
        *a1 = *a2;
        *a2 = v17;
      }
    }
  }
  else
  {
    uint64_t v20 = *a2;
    uint64_t v21 = v9;
    int v10 = sub_1B40C((int *)&v21);
    uint64_t result = sub_1B40C((int *)&v20);
    uint64_t v12 = *a1;
    if (v10 >= (int)result)
    {
      *a1 = *a2;
      *a2 = v12;
      uint64_t v18 = *a3;
      uint64_t v20 = v12;
      uint64_t v21 = v18;
      int v19 = sub_1B40C((int *)&v21);
      uint64_t result = sub_1B40C((int *)&v20);
      if (v19 >= (int)result) {
        return result;
      }
      uint64_t v12 = *a2;
      *a2 = *a3;
    }
    else
    {
      *a1 = *a3;
    }
    *a3 = v12;
  }
  return result;
}

BOOL sub_1B218(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = a2 - a1;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v6 = *(a2 - 1);
      uint64_t v19 = *a1;
      uint64_t v20 = v6;
      int v7 = sub_1B40C((int *)&v20);
      if (v7 < (int)sub_1B40C((int *)&v19))
      {
        uint64_t v8 = *a1;
        *a1 = *(a2 - 1);
        *(a2 - 1) = v8;
      }
      return 1;
    case 3:
      sub_1B0D4(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      sub_1B5DC(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      sub_1AFA8(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      uint64_t v9 = a1 + 2;
      sub_1B0D4(a1, a1 + 1, a1 + 2);
      int v10 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v11 = 0;
      int v12 = 0;
      break;
  }
  while (1)
  {
    uint64_t v13 = *v10;
    uint64_t v19 = *v9;
    uint64_t v20 = v13;
    int v14 = sub_1B40C((int *)&v20);
    if (v14 < (int)sub_1B40C((int *)&v19))
    {
      uint64_t v15 = *v10;
      uint64_t v16 = v11;
      while (1)
      {
        *(uint64_t *)((char *)a1 + v16 + 24) = *(uint64_t *)((char *)a1 + v16 + 16);
        if (v16 == -16) {
          break;
        }
        uint64_t v19 = *(uint64_t *)((char *)a1 + v16 + 8);
        uint64_t v20 = v15;
        int v17 = sub_1B40C((int *)&v20);
        v16 -= 8;
        if (v17 >= (int)sub_1B40C((int *)&v19))
        {
          uint64_t v18 = (uint64_t *)((char *)a1 + v16 + 24);
          goto LABEL_12;
        }
      }
      uint64_t v18 = a1;
LABEL_12:
      *uint64_t v18 = v15;
      if (++v12 == 8) {
        return v10 + 1 == a2;
      }
    }
    uint64_t v9 = v10;
    v11 += 8;
    if (++v10 == a2) {
      return 1;
    }
  }
}

uint64_t sub_1B40C(int *a1)
{
  int v1 = *a1;
  switch(*a1)
  {
    case -3:
      int v2 = a1[1];
      if (v2 >= 4) {
        goto LABEL_28;
      }
      return dword_2E150[v2];
    case -2:
      uint64_t v4 = a1[1];
      if (v4 < 4) {
        return dword_2E140[v4];
      }
      if (v4 != -1) {
        goto LABEL_27;
      }
      return 28;
    case -1:
      int v5 = a1[1];
      int v6 = v5 + 1;
      if ((v5 + 1) < 5)
      {
        int v7 = (unsigned int *)&unk_2E118;
        return v7[v6];
      }
      if (v5 != -2) {
        goto LABEL_27;
      }
      return 24;
    case 0:
      int v6 = a1[1] + 2;
      if (v6 < 5)
      {
        int v7 = (unsigned int *)&unk_2E0EC;
        return v7[v6];
      }
      int v2 = a1[1];
      if (v2 == -3) {
        return 32;
      }
      if (v2 != 3) {
        goto LABEL_28;
      }
      return 30;
    case 1:
      int v6 = a1[1] + 3;
      if (v6 >= 6) {
        goto LABEL_27;
      }
      int v7 = (unsigned int *)&unk_2E100;
      return v7[v6];
    case 2:
      int v8 = a1[1];
      int v6 = v8 + 3;
      if ((v8 + 3) < 4)
      {
        int v7 = (unsigned int *)&unk_2E130;
        return v7[v6];
      }
      if (v8 == 1) {
        return 26;
      }
LABEL_27:
      int v2 = a1[1];
      goto LABEL_28;
    case 3:
      int v9 = a1[1];
      if (v9 == -2) {
        return 23;
      }
      if (v9 == -1) {
        return 27;
      }
      int v2 = a1[1];
      if (v2 == -3) {
        return 31;
      }
      if (!v2) {
        return 34;
      }
LABEL_28:
      int v10 = v2 + v1;
      if (v1 < 0) {
        int v1 = -v1;
      }
      if (v10 < 0) {
        int v10 = -v10;
      }
      if (v2 < 0) {
        int v2 = -v2;
      }
      if (v1 <= v2) {
        int v11 = v2;
      }
      else {
        int v11 = v1;
      }
      if (v10 >= v2 && v10 >= v1) {
        int v13 = v10;
      }
      else {
        int v13 = v11;
      }
      return (v13 + 100);
    default:
      goto LABEL_27;
  }
}

uint64_t sub_1B5DC(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  sub_1B0D4(a1, a2, a3);
  uint64_t v8 = *a4;
  uint64_t v18 = *a3;
  uint64_t v19 = v8;
  int v9 = sub_1B40C((int *)&v19);
  uint64_t result = sub_1B40C((int *)&v18);
  if (v9 < (int)result)
  {
    uint64_t v11 = *a3;
    *a3 = *a4;
    *a4 = v11;
    uint64_t v12 = *a3;
    uint64_t v18 = *a2;
    uint64_t v19 = v12;
    int v13 = sub_1B40C((int *)&v19);
    uint64_t result = sub_1B40C((int *)&v18);
    if (v13 < (int)result)
    {
      uint64_t v14 = *a2;
      *a2 = *a3;
      *a3 = v14;
      uint64_t v15 = *a2;
      uint64_t v18 = *a1;
      uint64_t v19 = v15;
      int v16 = sub_1B40C((int *)&v19);
      uint64_t result = sub_1B40C((int *)&v18);
      if (v16 < (int)result)
      {
        uint64_t v17 = *a1;
        *a1 = *a2;
        *a2 = v17;
      }
    }
  }
  return result;
}

void *sub_1B6CC(void *result, uint64_t a2, uint64_t a3, float a4)
{
  if (v4 >= 0) {
    int v5 = result;
  }
  else {
    int v5 = (void *)*result;
  }
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = v5;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void sub_1B6F0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1B758(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t sub_1B770(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_DWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 8) = 2112;
  *(void *)(a3 + 10) = a2;
  return result;
}

id sub_1B788(uint64_t a1, void *a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return a2;
}

void sub_1B7AC(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1B7D4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0x16u);
}

void sub_1B848(id a1)
{
  qword_46D78 = objc_alloc_init(CSLUICalendarIconSource);

  _objc_release_x1();
}

id sub_1BA9C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCalendarIcon:1];
}

void sub_1BB6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1BC30;
  v7[3] = &unk_3CD08;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

id sub_1BC30(uint64_t a1)
{
  return [*(id *)(a1 + 32) calendarIconSource:*(void *)(a1 + 40) updatedIcon:*(void *)(a1 + 48) circularIcon:*(void *)(a1 + 56)];
}

void sub_1BCF8(id a1)
{
  int v1 = +[NSUserDefaults standardUserDefaults];
  int v2 = [v1 objectForKey:@"calendarIconOverrideDate"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&qword_46D88, v2);
    id v3 = cslprf_icon_field_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543618;
      uint64_t v5 = qword_46D88;
      __int16 v6 = 2114;
      CFStringRef v7 = @"calendarIconOverrideDate";
      _os_log_impl(&def_1AB14, v3, OS_LOG_TYPE_DEFAULT, "_calendarOverrideDate: using override date %{public}@ from com.apple.Carousel:%{public}@", (uint8_t *)&v4, 0x16u);
    }
  }
}

id CSLStringAbbreviationForDayOfWeek(uint64_t a1)
{
  int v2 = +[NSLocale currentLocale];
  id v3 = objc_alloc_init((Class)NSDateFormatter);
  [v3 setLocale:v2];
  int v4 = [v3 shortWeekdaySymbols];
  uint64_t v5 = v4;
  BOOL v6 = a1 < 1;
  unint64_t v7 = a1 - 1;
  if (v6 || v7 >= (unint64_t)[v4 count])
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v5 objectAtIndexedSubscript:v7];
  }

  return v8;
}

CFStringRef NSStringFromCSLHexAppPlacementReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return @"unknown";
  }
  else {
    return off_3CD98[a1 - 1];
  }
}

void sub_1C9D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CA58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CB18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CC64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CCD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CF8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33)
{
  _Unwind_Resume(a1);
}

id sub_1CFF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) bundleIdentifier];
}

BOOL sub_1CFF8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) hex];
  return *(_DWORD *)(v1 + 24) == v2 && *(_DWORD *)(v1 + 28) == HIDWORD(v2);
}

BOOL sub_1D040(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) savedHex];
  return *(_DWORD *)(v1 + 32) == v2 && *(_DWORD *)(v1 + 36) == HIDWORD(v2);
}

id sub_1D088(uint64_t a1)
{
  return [*(id *)(a1 + 32) directPlacementReason];
}

id sub_1D090(uint64_t a1)
{
  return [*(id *)(a1 + 32) placementReason];
}

void sub_1D118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D2B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D6B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D7A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DA44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DAC0()
{
}

void sub_1DC78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id CSLDiagnosticFilenameWithSuffix(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = +[CSLDateLabelStringFormatCache sharedInstance];
  BOOL v6 = +[NSDate date];
  unint64_t v7 = [v5 formatDateAsLongYMDHMSNoSpacesWithDate:v6];

  id v8 = [(__CFString *)v3 length];
  CFStringRef v9 = @".";
  CFStringRef v10 = &stru_3D1C0;
  if (!v8) {
    CFStringRef v9 = &stru_3D1C0;
  }
  if (v3) {
    CFStringRef v10 = v3;
  }
  id v11 = +[NSString stringWithFormat:@"%@-%@%@%@", v4, v7, v9, v10];

  return v11;
}

id CSLDiagnosticSubDirectory(void *a1)
{
  return CSLDiagnosticFilenameWithSuffix(a1, 0);
}

id CSLDiagnosticFilename(void *a1)
{
  return CSLDiagnosticFilenameWithSuffix(a1, @"log");
}

id CSLDiagnosticDirectoryURLWithDirectoryName(void *a1)
{
  return sub_1DFB8(a1, 1);
}

id sub_1DFB8(void *a1, int a2)
{
  id v3 = a1;
  id v4 = 0;
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v5 = +[NSString stringWithFormat:@"%@/Library/Logs/CrashReporter/DiagnosticLogs/Carousel", CPSharedResourcesDirectory()];
    BOOL v6 = +[NSURL fileURLWithPath:v5];

    uint64_t v7 = [v6 URLByAppendingPathComponent:v3];
    id v8 = (void *)v7;
    if (a2) {
      CFStringRef v9 = (void *)v7;
    }
    else {
      CFStringRef v9 = v6;
    }
    id v10 = v9;
    id v11 = +[NSFileManager defaultManager];
    NSFileAttributeKey v16 = NSFileProtectionKey;
    NSFileProtectionType v17 = NSFileProtectionNone;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    unsigned int v13 = [v11 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:v12 error:0];

    if (v13)
    {
      id v4 = v8;
    }
    else
    {
      uint64_t v14 = cslprf_diagnostics_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_2790C(v10, v14);
      }

      id v4 = 0;
    }
  }

  return v4;
}

id CSLDiagnosticFileURLWithFilename(void *a1)
{
  return sub_1DFB8(a1, 0);
}

void sub_1E480(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1E544;
  block[3] = &unk_3CDD8;
  id v5 = a2;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_1E544(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void **)(a1 + 40);
    objc_msgSend(v2, "setRawIcon:");
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_279A4(a1);
  }
}

uint64_t sub_1E5AC(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void sub_1E5C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_27A34(a1);
  }
}

void sub_1E7E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ECF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1EE80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1EF4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1EFF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1F09C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1F11C(uint64_t a1)
{
  if (a1)
  {
    [*(id *)(a1 + 32) invalidate];
    id v2 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;
  }
}

void sub_1F278(uint64_t a1)
{
  sub_1F11C(*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8))
  {
    *(unsigned char *)(v2 + 40) = 1;
    id v3 = *(void **)(a1 + 32);
    [v3 setState:2];
  }
}

void sub_1F420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_1F440(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    [a1 touchPoint];
    objc_msgSend(v3, "convertPoint:fromView:", 0);
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

void sub_1F4A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1F538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1FA4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1FA98(uint64_t result)
{
  if (result)
  {
    *(unsigned char *)(result + 168) = 0;
    *(void *)(result + 176) = 0;
  }
  return result;
}

double sub_1FAB8(uint64_t a1)
{
  if (a1)
  {
    [(id)a1 bounds];
    double v3 = v2;
    double width = v4;
    double height = v6;
    if (*(unsigned char *)(a1 + 9))
    {
      [(id)a1 safeAreaInsets];
      double v3 = ceil(v3 + v8 + v3 + v8) * 0.5;
      double width = floor(width - (v9 + v10) + width - (v9 + v10)) * 0.5;
      double height = floor(height - (v8 + v11) + height - (v8 + v11)) * 0.5;
    }
    double x = width * 0.5;
    if (sub_20138(a1) && (*(unsigned char *)(a1 + 8) & 0x80) != 0)
    {
      double v14 = 0.0;
      v25.origin.double x = width * 0.5;
      v25.origin.double y = v3;
      v25.size.double width = width;
      v25.size.double height = height;
      CGRect v26 = CGRectInset(v25, 0.0, 8.0);
      double x = v26.origin.x;
      double y = v26.origin.y;
      double width = v26.size.width;
      double height = v26.size.height;
      [*(id *)(a1 + 72) hexSideSize];
      double v17 = v16 * 1.5 * 0.5;
      uint64_t v18 = *(void **)(a1 + 72);
      if (v18)
      {
        [v18 layoutAttributesForItemAtHex:0xFFFFFFFE00000000];
        uint64_t v19 = *(void **)(a1 + 72);
        if (v19)
        {
          [v19 layoutAttributesForItemAtHex:0xFFFFFFFE00000000];
          double v14 = v24;
        }
      }
      double v13 = y + floor(v14 - v17 + v14 - v17) * -0.5;
    }
    else
    {
      double v13 = height * 0.5;
    }
    v20.f32[0] = width;
    float32_t v21 = height;
    v20.f32[1] = v21;
    qword_46D98 = (uint64_t)vadd_f32(v20, (float32x2_t)0x4100000041000000);
    objc_msgSend(*(id *)(a1 + 16), "setFrame:", x, v13, width, height);
    [*(id *)(a1 + 72) hexSideSize];
    double result = (height + v22 * 1.5 * 0.25) / (v22 * 1.5);
    *(_DWORD *)(a1 + 24) = (int)result;
  }
  return result;
}

void sub_1FCB0(uint64_t a1)
{
  if (a1)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v3 = [WeakRetained countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v8;
      do
      {
        double v5 = 0;
        do
        {
          if (*(void *)v8 != v4) {
            objc_enumerationMutation(WeakRetained);
          }
          id v6 = sub_201B0(a1, *(void **)(*((void *)&v7 + 1) + 8 * (void)v5));
          double v5 = (char *)v5 + 1;
        }
        while (v3 != v5);
        id v3 = [WeakRetained countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v3);
    }
  }
}

void sub_1FDB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1FE40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  long long v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)CSLUIFieldOfIconsView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1FFF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_200A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_200CC(void *a1, double a2, double a3)
{
  if (!a1) {
    return 0;
  }
  double v5 = [a1 layout];
  id v6 = objc_msgSend(v5, "hexAtPoint:", a2, a3);

  return v6;
}

void sub_20128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_20138(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained isVerticalOnly];

  return v2;
}

void sub_20184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_201B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    double v5 = [v3 bundleIdentifier];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    long long v7 = [WeakRetained createIconViewWithBundleIdentifier:v5];

    if (v7)
    {
      [v7 setNode:v4];
      [*(id *)(a1 + 32) setObject:v7 forKey:v5];
      [v4 hex];
      sub_202B0(a1, v7);
    }
  }
  else
  {
    long long v7 = 0;
  }

  return v7;
}

void sub_20284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_202B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    [*(id *)(a1 + 16) addSubview:v3];
    [v3 setJiggling:(*(void *)(a1 + 8) >> 4) & 1];
  }
}

void sub_20324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_20370(id *a1, uint64_t a2)
{
  id v2 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 5);
    double v5 = [WeakRetained nodeAtHex:a2];

    if (v5)
    {
      id v6 = [v5 bundleIdentifier];
      id v2 = [v2 iconViewForBundleIdentifier:v6];
    }
    else
    {
      id v2 = 0;
    }
  }

  return v2;
}

void sub_20414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_204EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_20504(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2098C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_20A7C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_20A8C(uint64_t a1)
{
}

id sub_20A94(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = +[NSMutableArray array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = sub_201B0((uint64_t)a1, *(void **)(*((void *)&v13 + 1) + 8 * i));
          [a1 layoutIconView:v9 forcedApply:1 forcedSubview:1];
          [v4 addObject:v9];
          long long v10 = [v9 layer];
          CATransform3DMakeScale(&v12, 0.01, 0.01, 1.0);
          [v10 setTransform:&v12];

          [v9 setAlpha:0.0];
        }
        id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_20C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20C9C(uint64_t a1)
{
  sub_20D08(*(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  uint64_t v2 = sub_20E4C(*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(id **)(a1 + 32);
  id v6 = *(void **)(a1 + 48);

  sub_21194(v5, v6);
}

void sub_20D08(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          objc_msgSend(a1, "layoutIconView:forcedApply:forcedSubview:", v9, 1, 1, (void)v10);
          [v9 setAlpha:1.0];
        }
        id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

void sub_20E28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_20E4C(uint64_t a1, void *a2)
{
  id v16 = a2;
  if (a1)
  {
    id v18 = +[NSMutableArray array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v3 = v16;
    id obj = v3;
    id v4 = [v3 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (!v4)
    {
LABEL_18:

      goto LABEL_19;
    }
    char v5 = 0;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        long long v8 = [*(id *)(*((void *)&v20 + 1) + 8 * i) bundleIdentifier];
        unsigned __int8 v9 = [v8 isEqualToString:*(void *)(a1 + 368)];
        id v10 = [(id)a1 iconViewForBundleIdentifier:v8];
        if (v10)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 248));
          BOOL v12 = v10 == WeakRetained;

          if (v12) {
            [(id)a1 endDragging];
          }
          [*(id *)(a1 + 32) removeObjectForKey:v8];
          long long v13 = [v10 layer];
          CATransform3DMakeScale(&v19, 0.01, 0.01, 1.0);
          [v13 setTransform:&v19];

          [v10 setAlpha:0.0];
          [v18 addObject:v10];
        }
        else
        {
          long long v14 = cslprf_ui_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            CGRect v25 = v8;
            _os_log_error_impl(&def_1AB14, v14, OS_LOG_TYPE_ERROR, "ERROR: no view for '%@'", buf, 0xCu);
          }
        }
        v5 |= v9;
      }
      id v4 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v4);

    if (v5)
    {
      id v3 = +[NSString stringWithFormat:@"removed target:%@", *(void *)(a1 + 368)];
      [(id)a1 setTargetHexToScrolledCenterForReason:v3];
      goto LABEL_18;
    }
  }
  else
  {
    id v18 = 0;
  }
LABEL_19:

  return v18;
}

void sub_21114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21194(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      do
      {
        long long v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v8), "bundleIdentifier", (void)v12);
          id v10 = [a1 iconViewForBundleIdentifier:v9];

          id WeakRetained = objc_loadWeakRetained(a1 + 31);
          LOBYTE(v9) = v10 == WeakRetained;

          if ((v9 & 1) == 0) {
            [a1 layoutIconView:v10 forcedApply:1 forcedSubview:1];
          }

          long long v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

void sub_212F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21338(uint64_t a1)
{
}

void sub_2134C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v10;
      do
      {
        long long v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "removeFromSuperview", (void)v9);
          long long v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

void sub_21448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2146C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (a1)
  {
    sub_21548(a1);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    _OWORD v5[2] = sub_215BC;
    v5[3] = &unk_3CF18;
    v5[4] = a1;
    id v6 = v4;
    +[UIView _animateUsingDefaultTimingWithOptions:4 animations:v5 completion:0];
  }
}

void sub_21528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_21548(id result)
{
  if (result)
  {
    v1[0] = _NSConcreteStackBlock;
    v1[1] = 3221225472;
    v1[2] = sub_21EA8;
    v1[3] = &unk_3CF88;
    v1[4] = result;
    return [result enumerateIconViewsWithBlock:v1];
  }
  return result;
}

void sub_215BC(uint64_t a1)
{
}

void sub_21934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *sub_21964(id *result)
{
  if (result) {
    return (id *)[result[23] cancel];
  }
  return result;
}

uint64_t sub_2197C(uint64_t result)
{
  if (result) {
    return (*(unsigned __int8 *)(result + 8) >> 4) & 1;
  }
  return result;
}

unint64_t sub_21994(uint64_t a1, unint64_t a2)
{
  if (a1)
  {
    unint64_t v2 = a2;
    unint64_t v4 = HIDWORD(a2);
    if (sub_20138(a1))
    {
      if ((v2 & 0x8000000000000000) != 0)
      {
        unint64_t v4 = 0;
        LODWORD(v2) = -1;
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        unint64_t v6 = [WeakRetained rowCount] - *(_DWORD *)(a1 + 24);

        if ((int)v6 < (int)v4)
        {
          LODWORD(v2) = -(((int)v6 + 3) >> 1);
          unint64_t v4 = v6;
        }
      }
    }
  }
  else
  {
    unint64_t v4 = 0;
    LODWORD(v2) = 0;
  }
  return v2 | (v4 << 32);
}

void sub_21A34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21A44(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (!*(unsigned char *)(a1 + 32))
  {
    id v3 = [v5 node];
    unint64_t v4 = (unint64_t)[v3 hex];
    if (v4)
    {
    }
    else
    {

      if (!HIDWORD(v4)) {
        goto LABEL_6;
      }
    }
  }
  [v5 setJiggling:*(unsigned __int8 *)(a1 + 33)];
LABEL_6:
}

void sub_21AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_21CC8(uint64_t a1)
{
  +[UIView setAnimationPreventsAdditive:1];
  unint64_t v2 = *(void **)(a1 + 32);

  return [v2 layoutIconsForcedApply:1 forcedSubview:1];
}

double sub_21D70(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0.0;
  }
  double v2 = *(float *)(a2 + 8);
  [*(id *)(a1 + 72) hexSideSize];
  double result = v3 * 1.5;
  if (result < v2) {
    return v2;
  }
  return result;
}

id sub_21E90(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) layoutIconView:a2 forcedApply:*(unsigned __int8 *)(a1 + 40) forcedSubview:*(unsigned __int8 *)(a1 + 41)];
}

id sub_21EA8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) forceIconAttributesAndSubviewForView:a2];
}

void sub_21F54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL _isIconWithAttributesOnScreen(float32x2_t *a1)
{
  if (COERCE_FLOAT(*(void *)&a1[1]) < 0.2) {
    return 0;
  }
  uint32x2_t v2 = (uint32x2_t)vcgt_f32(vabs_f32(*a1), vadd_f32((float32x2_t)vdup_laneq_s32(*(int32x4_t *)a1->f32, 2), (float32x2_t)qword_46D98));
  return vpmax_u32(v2, v2).i32[0] >= 0;
}

void sub_221DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22214(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1) {
    [v3 removeFromSuperview];
  }
}

void sub_22264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id *sub_22278(id *result)
{
  if (result)
  {
    uint64_t v1 = result;
    [result[24] setEnabled:0];
    [v1[33] setEnabled:0];
    [v1[10] setEnabled:0];
    return sub_222F0(v1);
  }
  return result;
}

id *sub_222F0(id *result)
{
  if (result)
  {
    uint64_t v1 = result;
    int v2 = *((unsigned __int8 *)result + 56);
    if (*((unsigned char *)result + 56))
    {
      uint64_t v3 = (unint64_t)result[1] & 9;
      unint64_t v4 = &OBJC_IVAR___CSLUIFieldOfIconsView__tapRecognizer;
      [result[24] setLongPressEnabled:v3 != 0];
      [v1[33] setEnabled:((unint64_t)v1[1] >> 1) & 1];
      BOOL v5 = ((unint64_t)v1[1] & 4 | v3) != 0;
    }
    else
    {
      [result[24] setEnabled:0];
      BOOL v5 = 0;
      unint64_t v4 = &OBJC_IVAR___CSLUIFieldOfIconsView__pinchRecognizer;
    }
    [*(id *)((char *)v1 + *v4) setEnabled:v5];
    id v6 = v1[10];
    return (id *)[v6 setEnabled:v2 != 0];
  }
  return result;
}

void sub_224C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_224D8(uint64_t a1, void *a2)
{
  id v25 = a2;
  if (a1)
  {
    switch((unint64_t)[v25 state])
    {
      case 1uLL:
        [*(id *)(a1 + 192) setState:4];
        [*(id *)(a1 + 192) reset];
        *(double *)(a1 + 232) = sub_1F440(v25, *(void **)(a1 + 16));
        *(double *)(a1 + 240) = v11 + -50.0;
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        id v13 = objc_loadWeakRetained((id *)(a1 + 248));
        long long v14 = [v13 node];
        [WeakRetained commitMovedNode:v14 withReason:2];

        [v25 locationInView:a1];
        double v16 = v15;
        double v18 = v17;
        [v25 translationInView:a1];
        goto LABEL_7;
      case 2uLL:
        [v25 locationInView:a1];
        sub_24754(a1, v21, v22);
        [v25 locationInView:a1];
        double v16 = v23;
        double v18 = v24;
        [v25 translationInView:*(void *)(a1 + 16)];
LABEL_7:
        sub_24F38(a1, v16, v18 + -50.0, v19, v20);
        break;
      case 3uLL:
        sub_24980(a1);
        [v25 locationInView:a1];
        double v5 = v4;
        double v7 = v6;
        [v25 translationInView:*(void *)(a1 + 16)];
        sub_24F38(a1, v5, v7 + -50.0, v8, v9);
        [(id)a1 endDragging];
        id v10 = objc_loadWeakRetained((id *)(a1 + 344));
        [v10 iconsEdited];

        break;
      case 4uLL:
      case 5uLL:
        id v3 = objc_loadWeakRetained((id *)(a1 + 40));
        [v3 revertMove];

        [(id)a1 endDragging];
        break;
      default:
        break;
    }
  }
}

void sub_22724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22778(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    [*(id *)(a1 + 184) cancel];
    id v3 = (char *)[v4 state];
    if ((unint64_t)(v3 - 3) >= 3)
    {
      if (v3 == (unsigned char *)&def_1AB14 + 1)
      {
        [*(id *)(a1 + 192) setState:4];
        [*(id *)(a1 + 192) reset];
        *(CGPoint *)(a1 + 128) = CGPointZero;
      }
      else if (v3 == (unsigned char *)&def_1AB14 + 2)
      {
        sub_2370C(a1, v4);
      }
    }
    else
    {
      [*(id *)(a1 + 88) endDragging];
    }
  }
}

void sub_22850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22868(uint64_t a1, void *a2)
{
  id v4 = a2;
  double v5 = v4;
  if (a1)
  {
    id v6 = v4;
    objc_storeStrong((id *)(a1 + 336), a2);
    if (v6)
    {
      *(unsigned char *)(a1 + 224) = 1;
      double v7 = [v6 bundleIdentifier];
      double v8 = [(id)a1 iconViewForBundleIdentifier:v7];

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_22A74;
      v12[3] = &unk_3CE78;
      id v13 = v8;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_22A80;
      v10[3] = &unk_3CFB0;
      void v10[4] = a1;
      id v9 = v13;
      id v11 = v9;
      +[UIView animateWithDuration:327680 delay:v12 options:v10 animations:0.1 completion:0.0];
      objc_storeStrong((id *)(a1 + 208), v8);
      if (([(id)a1 isEditing] & 1) == 0) {
        objc_msgSend(*(id *)(a1 + 216), "setPressedHex:", objc_msgSend(v6, "hex"));
      }
      [(id)a1 layoutAnimated:0];
    }
  }
}

void sub_22A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

id sub_22A74(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.5];
}

void sub_22A80(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 224) = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  int v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 208) != v2)
  {
    [v2 alpha];
    if (fabs(v4 + -1.0) >= 2.22044605e-16)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      _OWORD v5[2] = sub_22B78;
      v5[3] = &unk_3CE78;
      id v6 = *(id *)(a1 + 40);
      +[UIView _animateUsingDefaultTimingWithOptions:4 animations:v5 completion:0];
    }
  }
}

void sub_22B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_22B78(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void sub_22B84(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    double v4 = cslprf_icon_field_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double v5 = [*(id *)(a1 + 208) node];
      int v6 = *(unsigned __int8 *)(a1 + 224);
      unsigned int v7 = [(id)a1 isEditing];
      int v8 = (*(_DWORD *)(a1 + 8) >> 4) & 1;
      *(_DWORD *)buf = 138544386;
      id v12 = v3;
      __int16 v13 = 2114;
      long long v14 = v5;
      __int16 v15 = 1024;
      int v16 = v6;
      __int16 v17 = 1024;
      unsigned int v18 = v7;
      __int16 v19 = 1024;
      int v20 = v8;
      _os_log_impl(&def_1AB14, v4, OS_LOG_TYPE_DEFAULT, "Ending press state for reason:%{public}@ pressedIconNode:%{public}@ animating:%{BOOL}u isEditing:%{BOOL}u jiggling:%{BOOL}u", buf, 0x28u);
    }
    if (!*(unsigned char *)(a1 + 224))
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_22D88;
      v10[3] = &unk_3CE78;
      void v10[4] = a1;
      +[UIView _animateUsingDefaultTimingWithOptions:4 animations:v10 completion:0];
    }
    id v9 = *(void **)(a1 + 208);
    *(void *)(a1 + 208) = 0;

    [*(id *)(a1 + 216) clearPressedHex];
    [(id)a1 layoutAnimated:0];
  }
}

void sub_22D50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_22D88(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) setAlpha:1.0];
}

void sub_23374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2345C(void *a1, void *a2, double a3, double a4)
{
  id v9 = a2;
  if (a1 && ([v9 hex] || sub_20138((uint64_t)a1)))
  {
    unsigned int v7 = [v9 bundleIdentifier];
    int v8 = [a1 iconViewForBundleIdentifier:v7];

    if (v8) {
      sub_250B8((uint64_t)a1, v8, v9, a3, a4 + -50.0);
    }
  }
}

void sub_23524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23694(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) layer];
  long long v2 = *(_OWORD *)&CATransform3DIdentity.m33;
  v6[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v6[5] = v2;
  long long v3 = *(_OWORD *)&CATransform3DIdentity.m43;
  v6[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v6[7] = v3;
  long long v4 = *(_OWORD *)&CATransform3DIdentity.m13;
  v6[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v6[1] = v4;
  long long v5 = *(_OWORD *)&CATransform3DIdentity.m23;
  v6[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v6[3] = v5;
  [v1 setTransform:v6];
}

void sub_236FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2370C(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (a1)
  {
    [v11 translationInView:0];
    double v5 = v4;
    double v6 = v3;
    if (v4 != *(double *)(a1 + 128) || v3 != *(double *)(a1 + 136))
    {
      unsigned __int8 v8 = [(id)a1 isEditing];
      double v9 = 0.0;
      if ((v8 & 1) == 0) {
        double v9 = *(double *)(a1 + 128) - v5;
      }
      double v10 = *(double *)(a1 + 136) - v6;
      *(double *)(a1 + 128) = v5;
      *(double *)(a1 + 136) = v6;
      objc_msgSend(*(id *)(a1 + 88), "addDragDelta:", v9, v10);
    }
  }
}

void sub_237C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_239C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t sub_239D8(void *a1, double a2, double a3)
{
  if (a1)
  {
    double v6 = [a1 layout];
    unint64_t v7 = sub_21994((uint64_t)a1, (unint64_t)objc_msgSend(v6, "hexAtPoint:", a2, a3));
    unsigned __int8 v8 = sub_20370((id *)a1, v7);
    double v9 = v8;
    if (v8)
    {
      [v8 center];
      unint64_t v10 = HIDWORD(v7);
      unsigned int v11 = v7;
    }
    else
    {
      LODWORD(v10) = 0;
      unsigned int v11 = 0;
      int v13 = 0;
      long long v14 = 0;
      unint64_t v33 = v7;
      long long v34 = xmmword_2E1E0;
      unint64_t v35 = v7;
      int v36 = 0;
      int v15 = HIDWORD(v7) + v7;
      double v16 = 1.79769313e308;
LABEL_7:
      double v9 = v14;
      while (1)
      {
        uint64_t v17 = sub_4628(&v33);
        unint64_t v32 = __PAIR64__(v18, HIDWORD(v17));
        if (!(_BYTE)v17) {
          break;
        }
        if (v13)
        {
          unsigned int v19 = HIDWORD(v17) - v7;
          int v20 = v15 - v18 - HIDWORD(v17);
          int v21 = v18 - HIDWORD(v7);
          if (HIDWORD(v17) - (int)v7 < 0) {
            unsigned int v19 = v7 - HIDWORD(v17);
          }
          if (v20 < 0) {
            int v20 = HIDWORD(v17) - (v15 - v18);
          }
          if (v21 < 0) {
            int v21 = HIDWORD(v7) - v18;
          }
          if (v19 <= v21) {
            int v22 = v21;
          }
          else {
            int v22 = v19;
          }
          if (v20 < v21 || v20 < v19) {
            int v20 = v22;
          }
          if (v20 > v13) {
            break;
          }
        }
        long long v14 = sub_20370((id *)a1, __SPAIR64__(v18, HIDWORD(v17)));

        double v9 = v14;
        if (v14)
        {
          if (!v13)
          {
            unsigned int v24 = v32 - v7;
            int v25 = v15 - (v32 + HIDWORD(v32));
            int v26 = HIDWORD(v32) - HIDWORD(v7);
            if ((int)v32 - (int)v7 < 0) {
              unsigned int v24 = v7 - v32;
            }
            if (v25 < 0) {
              int v25 = v32 + HIDWORD(v32) - v15;
            }
            if (v26 < 0) {
              int v26 = HIDWORD(v7) - HIDWORD(v32);
            }
            if (v24 <= v26) {
              int v27 = v26;
            }
            else {
              int v27 = v24;
            }
            if (v25 < v26 || v25 < v24) {
              int v25 = v27;
            }
            int v13 = v25 + 1;
          }
          [v14 center];
          *(float *)&double v29 = (v30 - a3) * (v30 - a3) + (v29 - a2) * (v29 - a2);
          double v31 = sqrtf(*(float *)&v29);
          if (v16 > v31)
          {
            unsigned int v11 = v32;
            unint64_t v10 = HIDWORD(v32);
            double v16 = v31;
          }
          goto LABEL_7;
        }
      }
    }
  }
  else
  {
    LODWORD(v10) = 0;
    unsigned int v11 = 0;
  }
  return v11 | ((unint64_t)v10 << 32);
}

void sub_23BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23C20(uint64_t a1, float32x2_t a2, float32x2_t a3)
{
  if (a1)
  {
    double v6 = *(double *)(a1 + 112);
    double v5 = *(double *)(a1 + 120);
    double v7 = *(double *)&a2 + v6;
    double v8 = *(double *)&a3 + v5;
    if (sub_20138(a1))
    {
      double v9 = *(void **)(a1 + 376);
      if (v9)
      {
        [v9 configuration];
      }
      else
      {
        double v39 = 0.0;
        v10.i32[1] = 0;
        v10.i64[1] = 0;
        memset(buf, 0, sizeof(buf));
      }
      v11.f32[0] = v7;
      v10.f32[0] = v8;
      v11.i32[1] = v10.i32[0];
      float32x2_t v12 = 0;
      if (v10.f32[0] > 0.0)
      {
        simd_float4 v35 = v10;
        [*(id *)(a1 + 16) frame];
        float v15 = v14;
        v10.i64[1] = v35.i64[1];
        if (v35.f32[0] >= v15)
        {
          double v16 = v13;
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
          int v18 = [WeakRetained rowCount];

          v10.i64[1] = 0;
          unsigned int v19 = *(void **)(a1 + 72);
          if (v19) {
            objc_msgSend(v19, "layoutAttributesForItemAtHex:", -(v18 >> 1) | ((unint64_t)(v18 - 3) << 32), 0.0);
          }
          float v20 = v15 - v16;
          float v21 = (float)(buf[6].f32[0] + 0.0) - v20;
          v12.i32[0] = 0;
          v12.i32[1] = fminf(v21, v35.f32[0]);
          v11.f32[0] = v7;
          v11.i32[1] = fmaxf(v35.f32[0] - v21, 0.0);
        }
        else
        {
          v12.i32[0] = 0;
          v12.i32[1] = v35.i32[0];
          v11.f32[0] = v7;
          v11.i32[1] = 0;
        }
      }
      float32x2_t v22 = vabs_f32(v11);
      uint32x2_t v23 = (uint32x2_t)vcgt_f32(v22, buf[7]);
      if ((vpmax_u32(v23, v23).u32[0] & 0x80000000) != 0)
      {
        float32x2_t v36 = v12;
        __asm { FMOV            V1.2S, #1.0 }
        float32x2_t v32 = (float32x2_t)vand_s8(vorr_s8(vand_s8((int8x8_t)v11, (int8x8_t)0x8000000080000000), _D1), vorr_s8((int8x8_t)vcltz_f32(v11), (int8x8_t)vcgtz_f32(v11)));
        *(float32x2_t *)v10.f32 = vdiv_f32(vmul_f32(buf[1], vmul_f32(v32, vmaxnm_f32(vsub_f32(v22, buf[7]), 0))), (float32x2_t)vdup_lane_s32((int32x2_t)buf[6], 0));
        float32x2_t v34 = vdiv_f32((float32x2_t)*(_OWORD *)&_simd_atan_f4(v10), (float32x2_t)vdup_n_s32(0x3FC90FDBu));
        objc_msgSend(*(id *)(a1 + 376), "setRubberbandVector:");
        unsigned int v24 = cslprf_ui_log();
        float32x2_t v33 = vmla_f32(v36, vminnm_f32(v22, buf[7]), v32);
        double v26 = v33.f32[0];
        double v25 = v33.f32[1];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          buf[0].i32[0] = 134220288;
          *(float32x2_t *)((char *)buf + 4) = *(float32x2_t *)&v26;
          buf[1].i16[2] = 2048;
          *(float32x2_t *)((char *)&buf[1] + 6) = *(float32x2_t *)&v25;
          buf[2].i16[3] = 2048;
          buf[3] = *(float32x2_t *)&v7;
          buf[4].i16[0] = 2048;
          *(float32x2_t *)((char *)&buf[4] + 2) = *(float32x2_t *)&v8;
          buf[5].i16[1] = 2048;
          *(float32x2_t *)((char *)&buf[5] + 4) = a2;
          buf[6].i16[2] = 2048;
          *(float32x2_t *)((char *)&buf[6] + 6) = a3;
          buf[7].i16[3] = 2048;
          double v39 = v6;
          __int16 v40 = 2048;
          double v41 = v5;
          __int16 v42 = 2048;
          double v43 = v34.f32[0];
          __int16 v44 = 2048;
          double v45 = v34.f32[1];
          _os_log_debug_impl(&def_1AB14, v24, OS_LOG_TYPE_DEBUG, "inertial updater: setContentOffset:{%.4f, %.4f} rubberbanded from rawOffset:{%.4f, %.4f} from delta:{%.4f, %.4f} to originalOffset:{%.4f, %.4f} rubberBandVector:{%.4f, %.4f}", (uint8_t *)buf, 0x66u);
        }
        goto LABEL_17;
      }
      [*(id *)(a1 + 376) setRubberbandVector:0.0];
    }
    unsigned int v24 = cslprf_ui_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      buf[0].i32[0] = 134219264;
      *(float32x2_t *)((char *)buf + 4) = *(float32x2_t *)&v7;
      buf[1].i16[2] = 2048;
      *(float32x2_t *)((char *)&buf[1] + 6) = *(float32x2_t *)&v8;
      buf[2].i16[3] = 2048;
      buf[3] = a2;
      buf[4].i16[0] = 2048;
      *(float32x2_t *)((char *)&buf[4] + 2) = a3;
      buf[5].i16[1] = 2048;
      *(float32x2_t *)((char *)&buf[5] + 4) = *(float32x2_t *)&v6;
      buf[6].i16[2] = 2048;
      *(float32x2_t *)((char *)&buf[6] + 6) = *(float32x2_t *)&v5;
      _os_log_debug_impl(&def_1AB14, v24, OS_LOG_TYPE_DEBUG, "inertial updater: setContentOffset:{%.4f, %.4f} from delta:{%.4f, %.4f} to originalOffset:{%.4f, %.4f}", (uint8_t *)buf, 0x3Eu);
    }
    double v25 = v8;
    double v26 = v7;
LABEL_17:

    sub_2401C(a1, 0, v26, v25, v7, v8);
  }
}

void sub_23FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2401C(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  if (a1)
  {
    if (a2)
    {
      sub_24150(a1, a3, a4);
    }
    else
    {
      *(double *)(a1 + 96) = a3;
      *(double *)(a1 + 104) = a4;
      *(double *)(a1 + 112) = a5;
      *(double *)(a1 + 120) = a6;
      objc_msgSend(*(id *)(a1 + 376), "setContentOffset:", *(double *)(a1 + 96), *(double *)(a1 + 104));
      [(id)a1 layoutAnimated:0];
      if (!*(void *)(a1 + 320))
      {
        BOOL v7 = [*(id *)(a1 + 80) state] == (char *)&def_1AB14 + 2;
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 360));
        [WeakRetained fieldOfIconsViewDidScroll:a1 touchTracking:v7];
      }
    }
  }
}

void sub_2411C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_24150(uint64_t a1, double a2, double a3)
{
  if (a1)
  {
    [*(id *)(a1 + 88) endUpdating];
    double v6 = *(double *)(a1 + 96);
    double v7 = *(double *)(a1 + 104);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_2435C;
    v11[3] = &unk_3D000;
    v11[4] = a1;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_24370;
    v10[3] = &unk_3CE78;
    void v10[4] = a1;
    uint64_t v8 = +[CSLUIPointAnimator animateFromPoint:toPoint:withApplier:completion:](CSLUIPointAnimator, "animateFromPoint:toPoint:withApplier:completion:", v11, v10, v6, v7, a2, a3);
    double v9 = *(void **)(a1 + 184);
    *(void *)(a1 + 184) = v8;
  }
}

id sub_24328(float32x2_t *a1, float a2)
{
  if (a2 >= 1.0) {
    float32x2_t v2 = a1[6];
  }
  else {
    float32x2_t v2 = vmla_n_f32(a1[5], vsub_f32(a1[6], a1[5]), a2);
  }
  return [*(id *)&a1[4] setContentOffset:0 animated:vcvtq_f64_f32(v2)];
}

uint64_t sub_2435C(uint64_t a1, __n128 a2, __n128 a3)
{
  return sub_2401C(*(void *)(a1 + 32), 0, a2, a3, a2.n128_f64[0], a3.n128_f64[0]);
}

void sub_24370(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  float32x2_t v2 = *(void **)(v1 + 184);
  *(void *)(v1 + 184) = 0;
}

void sub_243E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_243F8(id *a1, uint64_t a2)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 5);
    double v5 = [WeakRetained nodeAtHex:a2];

    if (!v5)
    {
      id v6 = [a1 closestIconHexToHex:a2];
      double v7 = cslprf_icon_field_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v10[0] = 67109888;
        v10[1] = a2;
        __int16 v11 = 1024;
        int v12 = HIDWORD(a2);
        __int16 v13 = 1024;
        int v14 = (int)v6;
        __int16 v15 = 1024;
        int v16 = HIDWORD(v6);
        _os_log_error_impl(&def_1AB14, v7, OS_LOG_TYPE_ERROR, "ERROR: no icon at {%d,%d} (scrolling did not settle with icon centered) will use {%d,%d}", (uint8_t *)v10, 0x1Au);
      }

      id v8 = objc_loadWeakRetained(a1 + 5);
      double v5 = [v8 nodeAtHex:v6];
    }
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

void sub_24554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24754(uint64_t a1, CGFloat a2, CGFloat a3)
{
  if (!a1) {
    return;
  }
  double v6 = (*(double *)(a1 + 64) + *(double *)(a1 + 64)) / 3.0;
  [(id)a1 bounds];
  double width = v13.size.width;
  double height = v13.size.height;
  CGRect v14 = CGRectInset(v13, v6, v6);
  v12.double x = a2;
  v12.double y = a3;
  if (CGRectContainsPoint(v14, v12))
  {
    sub_24980(a1);
    return;
  }
  *(void *)(a1 + 176) = 0;
  if ((sub_20138(a1) & 1) == 0)
  {
    if (vabdd_f64(a2, width) < v6)
    {
      uint64_t v9 = 8;
LABEL_11:
      *(void *)(a1 + 176) |= v9;
      goto LABEL_12;
    }
    if (fabs(a2) < v6)
    {
      uint64_t v9 = 4;
      goto LABEL_11;
    }
  }
LABEL_12:
  if (vabdd_f64(a3, height) >= v6)
  {
    uint64_t v10 = *(void *)(a1 + 176);
    if (fabs(a3) >= v6)
    {
      if (!v10) {
        return;
      }
    }
    else
    {
      *(void *)(a1 + 176) = v10 | 1;
    }
  }
  else
  {
    *(void *)(a1 + 176) |= 2uLL;
  }

  sub_248C0(a1);
}

void sub_248C0(uint64_t a1)
{
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 168))
    {
      uint64_t v2 = +[CADisplayLink displayLinkWithTarget:a1 selector:"autoScroll"];
      double v3 = *(void **)(a1 + 160);
      *(void *)(a1 + 160) = v2;

      double v4 = *(void **)(a1 + 160);
      double v5 = +[NSRunLoop currentRunLoop];
      [v4 addToRunLoop:v5 forMode:NSRunLoopCommonModes];

      *(unsigned char *)(a1 + 168) = 1;
    }
  }
}

void sub_24970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24980(uint64_t a1)
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 168))
    {
      [*(id *)(a1 + 160) invalidate];
      uint64_t v2 = *(void **)(a1 + 160);
      *(void *)(a1 + 160) = 0;

      *(unsigned char *)(a1 + 168) = 0;
    }
  }
}

uint64_t sub_249E8(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (sub_20138(result))
    {
      if (a2 == 2)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(v3 + 40));
        unsigned int v31 = [WeakRetained rowCount];
        int v32 = *(_DWORD *)(v3 + 24);

        long long v39 = 0u;
        long long v40 = 0u;
        float32x2_t v33 = *(void **)(v3 + 72);
        if (v33)
        {
          [v33 layoutAttributesForItemAtHex:-((int)(v31 - v32 + 3) >> 1) | ((unint64_t)(v31 - v32) << 32)];
          double v34 = *((float *)&v39 + 1) + -2.0;
        }
        else
        {
          double v34 = -2.0;
        }
        if (*(double *)(v3 + 104) < v34) {
          return 1;
        }
      }
      else if (a2 == 1 && *(double *)(v3 + 104) > 2.0)
      {
        return 1;
      }
    }
    else
    {
      [(id)v3 bounds];
      double v5 = v4;
      double v7 = v6;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v8 = objc_loadWeakRetained((id *)(v3 + 40));
      uint64_t v9 = objc_msgSend(v8, "allNodes", 0);

      uint64_t v10 = v9;
      id v11 = [v9 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v36;
        uint64_t v13 = a2 - 1;
        while (2)
        {
          for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v36 != v12) {
              objc_enumerationMutation(v9);
            }
            __int16 v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            id v16 = objc_loadWeakRetained((id *)(v3 + 248));
            uint64_t v17 = [v16 node];
            BOOL v18 = v15 == v17;

            if (!v18)
            {
              id v19 = [v15 hex];
              long long v39 = 0u;
              long long v40 = 0u;
              float v20 = *(void **)(v3 + 376);
              if (v20)
              {
                [v20 layoutAttributesForItemAtHex:v19];
                long long v21 = v39;
              }
              else
              {
                *(void *)&long long v21 = 0;
                DWORD2(v21) = 0;
              }
              double x = CGRectZero.origin.x;
              double y = CGRectZero.origin.y;
              double width = CGRectZero.size.width;
              double height = CGRectZero.size.height;
              double v26 = *((float *)&v21 + 2);
              double v27 = *((float *)&v21 + 2) * 0.5;
              switch(v13)
              {
                case 0:
                  double y = 0.0 - v27;
                  double width = v5 + v26;
                  double x = 0.0 - v27;
                  goto LABEL_19;
                case 1:
                  double x = 0.0 - v27;
                  double width = v5 + v26;
                  double y = *((float *)&v21 + 2) * 0.5;
LABEL_19:
                  double height = v7;
                  break;
                case 3:
                  double y = 0.0 - v27;
                  double height = v7 + v26;
                  double x = 0.0 - v27;
                  goto LABEL_22;
                case 7:
                  double y = 0.0 - v27;
                  double height = v7 + v26;
                  double x = *((float *)&v21 + 2) * 0.5;
LABEL_22:
                  double width = v5;
                  break;
                default:
                  break;
              }
              objc_msgSend(*(id *)(v3 + 16), "convertPoint:toView:", v3, *(float *)&v21, *((float *)&v21 + 1), v27);
              v42.double x = v28;
              v42.double y = v29;
              v43.origin.double x = x;
              v43.origin.double y = y;
              v43.size.double width = width;
              v43.size.double height = height;
              if (CGRectContainsPoint(v43, v42))
              {

                return 1;
              }
            }
            uint64_t v9 = v10;
          }
          id v11 = [v10 countByEnumeratingWithState:&v35 objects:v41 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }
    return 0;
  }
  return result;
}

void sub_24D5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24E84(uint64_t a1)
{
  if (a1) {
    sub_24980(a1);
  }
}

void sub_24F38(uint64_t a1, double a2, double a3, double a4, double a5)
{
  if (a1)
  {
    *(unsigned char *)(a1 + 256) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 248));
    objc_msgSend(WeakRetained, "dragToPoint:", a2, a3);

    if (!*(unsigned char *)(a1 + 168))
    {
      unint64_t v10 = (unint64_t)sub_200CC((void *)a1, a4 + *(double *)(a1 + 232), a5 + *(double *)(a1 + 240));
      if (v10 | HIDWORD(v10) || sub_20138(a1))
      {
        id v14 = objc_loadWeakRetained((id *)(a1 + 40));
        id v11 = objc_loadWeakRetained((id *)(a1 + 248));
        uint64_t v12 = [v11 node];
        [v14 moveNode:v12 toHex:v10 final:0];
      }
    }
  }
}

void sub_2508C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_250B8(uint64_t a1, void *a2, void *a3, double a4, double a5)
{
  id obj = a2;
  id v9 = a3;
  if (a1)
  {
    objc_storeWeak((id *)(a1 + 248), obj);
    *(unsigned char *)(a1 + 256) = 0;
    if (obj)
    {
      unint64_t v10 = *(void **)(a1 + 16);
      [obj center];
      objc_msgSend(v10, "convertPoint:toView:", a1);
      double v12 = v11;
      double v14 = v13;
      [(id)a1 addSubview:obj];
      objc_msgSend(obj, "setCenter:", v12, v14);
      objc_msgSend(obj, "beginDraggingAtPoint:", a4, a5);
    }
  }
}

void sub_251AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_25364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2546C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_25480(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = v3;
  if (a1)
  {
    [v3 locationInView:*(void *)(a1 + 16)];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

void sub_254E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_255C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_257C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2591C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_263BC(os_log_t log, double a2, double a3)
{
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&def_1AB14, log, OS_LOG_TYPE_DEBUG, "inertial updater: scrolledWithDelta:{%.4f, %.4f}", (uint8_t *)&v3, 0x16u);
}

void sub_26444(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&def_1AB14, log, OS_LOG_TYPE_DEBUG, "Created CSLDateLabelStringFormatCache", v1, 2u);
}

void sub_26488(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  CFStringRef v5 = @"plist";
  _os_log_error_impl(&def_1AB14, a2, OS_LOG_TYPE_ERROR, "failed to find default icon position plist: %@.%@", (uint8_t *)&v2, 0x16u);
}

void sub_26514()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "failed to read default icon position plist: %@", v2, v3, v4, v5, v6);
}

void sub_2657C()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "failed to parse default icon position plist: %@", v2, v3, v4, v5, v6);
}

void sub_265E4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&def_1AB14, log, OS_LOG_TYPE_ERROR, "failed to unarchive default icon position plist", v1, 2u);
}

void sub_26628()
{
  sub_FF00();
  sub_FF18(&def_1AB14, v0, v1, "Failed to load local icon position data for key %@ with error %@");
}

void sub_26690()
{
  sub_FF00();
  sub_FF18(&def_1AB14, v0, v1, "Failed to create icon graph for key %@ with dictionary %@");
}

void sub_266F8()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "could not write icon positions plist: %@", v2, v3, v4, v5, v6);
}

void sub_26760()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "could not rename old icon positions file %@", v2, v3, v4, v5, v6);
}

void sub_267C8()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "could not get file attributes %@", v2, v3, v4, v5, v6);
}

void sub_26830()
{
  sub_1B7C8();
  *(_DWORD *)uint64_t v1 = 138412290;
  *(void *)(v1 + 4) = v2;
  sub_1B7AC(&def_1AB14, v1, v3, "invalid nodes: %@", v4);
}

void sub_26878()
{
  sub_FF00();
  sub_1B6F0(&def_1AB14, v0, (uint64_t)v0, "cannot add %@ already have node with same bundle: %@", v1);
}

void sub_268E8()
{
  sub_FEF4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  sub_1B6F0(&def_1AB14, v1, (uint64_t)v1, "cannot add %@ already have node at that location: %@", v2);
}

void sub_26968(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&def_1AB14, log, OS_LOG_TYPE_ERROR, "node not found - cannot remove", v1, 2u);
}

void sub_269AC()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "%@ is at zero", v2, v3, v4, v5, v6);
}

void sub_26A14(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_1B758(&def_1AB14, a2, a3, "removed %@", (uint8_t *)&v4);
}

void sub_26A88()
{
  sub_1B708();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1B758(&def_1AB14, v3, (uint64_t)v3, "[collapse] %s has no further occupied hexes", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_26AE4()
{
  sub_1B708();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1B758(&def_1AB14, v3, (uint64_t)v3, "[collapse] %s start", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_26B40()
{
  sub_1B720();
  sub_1B770(v1, v2, v3, 1.5047e-36);
  _os_log_debug_impl(&def_1AB14, v5, OS_LOG_TYPE_DEBUG, "changed count:%d (delegate=%@)", v4, 0x12u);
}

void sub_26B98()
{
  sub_1B730();
  sub_1B6CC(v1, v2, v3, 4.8151e-34);
  sub_1B6F0(&def_1AB14, v6, v4, "%s or %@ is zero", v5);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_26BEC()
{
  sub_1B720();
  sub_1B770(v1, v2, v3, 1.5047e-36);
  _os_log_debug_impl(&def_1AB14, v5, OS_LOG_TYPE_DEBUG, "[_changedNodes count] %d (delegate=%@)", v4, 0x12u);
}

void sub_26C3C()
{
  sub_FEF4();
  sub_1B758(&def_1AB14, v0, v1, "[lonely?] add %@ (final)", v2);
}

void sub_26CA8()
{
  sub_FEF4();
  sub_1B758(&def_1AB14, v0, v1, "[lonely?] add %@", v2);
}

void sub_26D14()
{
  sub_1B720();
  if (*((char *)v2 + 23) >= 0) {
    char v6 = v2;
  }
  else {
    char v6 = (uint64_t *)*v2;
  }
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)(v3 + 4) = v1;
  *(_WORD *)(v3 + 12) = 2080;
  *(void *)(v3 + 14) = v6;
  _os_log_debug_impl(&def_1AB14, v5, OS_LOG_TYPE_DEBUG, "[unoccupied] move %@ -> %s", v4, 0x16u);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_26D90()
{
  sub_1B708();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1B758(&def_1AB14, v3, (uint64_t)v3, "[push up] found empty: %s", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_26DEC()
{
  sub_1B7C8();
  *(_DWORD *)uint64_t v1 = 138412290;
  *(void *)(v1 + 4) = v2;
  sub_1B7AC(&def_1AB14, v1, v3, "failed integrity check: %@ will not change", v4);
}

void sub_26E34()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "duplicate %@", v2, v3, v4, v5, v6);
}

void sub_26E9C()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "disconnected %@", v2, v3, v4, v5, v6);
}

void sub_26F04()
{
  sub_1B7C8();
  if (*((char *)v1 + 23) >= 0) {
    uint8_t v6 = v1;
  }
  else {
    uint8_t v6 = (uint64_t *)*v1;
  }
  *(_DWORD *)uint64_t v2 = 136315394;
  *(void *)(v2 + 4) = v6;
  *(_WORD *)(v2 + 12) = 2048;
  *(void *)(v2 + 14) = v3;
  sub_1B6F0(&def_1AB14, v5, v3, "no node at hex:%s remainingNodes:%ld", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_26F7C()
{
  sub_FF00();
  sub_1B6F0(&def_1AB14, v0, (uint64_t)v0, "nodes do not match %@ or %@", v1);
}

void sub_26FEC()
{
  sub_1B730();
  sub_1B6CC(v1, v2, v3, 4.8151e-34);
  sub_1B6F0(&def_1AB14, v6, v4, "hexes do not match %s or %@", v5);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_27040()
{
  sub_1B730();
  sub_1B6CC(v1, v2, v3, 4.8151e-34);
  sub_1B6F0(&def_1AB14, v6, v4, "hex not valid for vertical only:%s node:%@", v5);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_27094()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "extra (bundle index) %@", v2, v3, v4, v5, v6);
}

void sub_270FC()
{
  sub_1B7C8();
  *(_DWORD *)uint64_t v1 = 67109378;
  *(_DWORD *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 8) = 2112;
  *(void *)(v1 + 10) = v3;
  _os_log_error_impl(&def_1AB14, v5, OS_LOG_TYPE_ERROR, "invalid icon positions (%d), intialization failed: %@", v4, 0x12u);
}

void sub_27160()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "invalid icon position (%@)", v2, v3, v4, v5, v6);
}

void sub_271C8(int a1, NSObject *a2)
{
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 1;
  _os_log_error_impl(&def_1AB14, a2, OS_LOG_TYPE_ERROR, "invalid version (%d > %d)", (uint8_t *)v2, 0xEu);
}

void sub_27250(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&def_1AB14, log, OS_LOG_TYPE_ERROR, "invalid icon plist, resetting to default", v1, 2u);
}

void sub_27294(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*(void *)a2 + 24);
  int v5 = 134218240;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  sub_1B6F0(&def_1AB14, a3, (uint64_t)a3, "invalid nodes count (%ld != %ld)", (uint8_t *)&v5);
}

void sub_27320(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a1 = 134218240;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = a3;
  sub_1B6F0(&def_1AB14, a4, a3, "invalid count (%ld != %ld)", (uint8_t *)a1);
}

void sub_27370()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "invalid defaults (key %@ not string)", v2, v3, v4, v5, v6);
}

void sub_273D8()
{
  v2[0] = 138412546;
  sub_1B744();
  sub_1B6F0(&def_1AB14, v0, v1, "invalid defaults (%@:%@ not BOOLean)", (uint8_t *)v2);
}

void sub_27450()
{
  v2[0] = 138412546;
  sub_1B744();
  sub_1B6F0(&def_1AB14, v0, v1, "invalid defaults (%@:%@ not integer)", (uint8_t *)v2);
}

void sub_274C8()
{
  v2[0] = 138412546;
  sub_1B744();
  sub_1B6F0(&def_1AB14, v0, v1, "invalid defaults (%@:%@ not array)", (uint8_t *)v2);
}

void sub_27540()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "invalid defaults (%@ not dictionary)", v2, v3, v4, v5, v6);
}

void sub_275A8()
{
  sub_1B720();
  *(_DWORD *)uint64_t v1 = 138412546;
  *(void *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2112;
  *(void *)(v1 + 14) = v3;
  sub_1B6F0(&def_1AB14, v5, v1, "invalid defaults (node %@ repeated location from %@)", v4);
}

void sub_27600()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "invalid defaults (%@ not array)", v2, v3, v4, v5, v6);
}

void sub_27668()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "invalid defaults (%@ count not 2)", v2, v3, v4, v5, v6);
}

void sub_276D0(uint64_t a1, void *a2, uint64_t a3)
{
  id v3 = sub_1B788(a1, a2, a3, 5.778e-34);
  sub_1B7D4(&def_1AB14, v4, v5, "invalid defaults (%@:%@ not have intValue)");
}

void sub_27724()
{
  sub_1B7C8();
  *(_DWORD *)uint64_t v1 = 138412290;
  *(void *)(v1 + 4) = v2;
  sub_1B7AC(&def_1AB14, v1, v3, "[343 collapse] failed to find all nodes (likely non-valid nodes) exist: %@", v4);
}

void sub_2776C()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "%@ not dictionary", v2, v3, v4, v5, v6);
}

void sub_277D4()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "could not find bundle in %@", v2, v3, v4, v5, v6);
}

void sub_2783C()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "could not find hex coordinates in %@", v2, v3, v4, v5, v6);
}

void sub_278A4()
{
  sub_FEF4();
  sub_FED8(&def_1AB14, v0, v1, "could not find hex in %@", v2, v3, v4, v5, v6);
}

void sub_2790C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 path];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&def_1AB14, a2, OS_LOG_TYPE_ERROR, "Failed to create diagnostic log, could not create directory: \"%@\"", (uint8_t *)&v4, 0xCu);
}

void sub_279A4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 64);
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_error_impl(&def_1AB14, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "ERROR: failed to find icon for %@", (uint8_t *)&v2, 0xCu);
}

void sub_27A34(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 64);
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_error_impl(&def_1AB14, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "ERROR: failed to find icon for %@", (uint8_t *)&v2, 0xCu);
}

void sub_27AC4(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&def_1AB14, a2, OS_LOG_TYPE_DEBUG, "CSLUIFieldOfIconsView gesture recognizers enabled: %{BOOL}u", (uint8_t *)v2, 8u);
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DScale(retstr, t, sx, sy, sz);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return _CGBitmapContextCreateImage(context);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGImageRelease(CGImageRef image)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntegral(CGRect rect)
{
  return _CGRectIntegral(rect);
}

uint64_t CPSharedResourcesDirectory()
{
  return _CPSharedResourcesDirectory();
}

uint64_t CSLPRFEqual()
{
  return _CSLPRFEqual();
}

uint64_t CSLPRFGreater()
{
  return _CSLPRFGreater();
}

uint64_t CSLPairingIsTinker()
{
  return _CSLPairingIsTinker();
}

uint64_t HKRPShouldInstallOxygenSaturationWatchAppOnPairedWatch()
{
  return _HKRPShouldInstallOxygenSaturationWatchAppOnPairedWatch();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NPSHasCompletedInitialSync()
{
  return _NPSHasCompletedInitialSync();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t UIRoundToScreenScale()
{
  return _UIRoundToScreenScale();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return std::to_string(retstr, __val);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

uint64_t _bs_set_crash_log_message()
{
  return __bs_set_crash_log_message();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

simd_float4 _simd_atan_f4(simd_float4 x)
{
  return __simd_atan_f4(x);
}

simd_float4 _simd_cos_f4(simd_float4 x)
{
  return __simd_cos_f4(x);
}

uint32_t arc4random(void)
{
  return _arc4random();
}

uint64_t cslprf_diagnostics_log()
{
  return _cslprf_diagnostics_log();
}

uint64_t cslprf_dock_log()
{
  return _cslprf_dock_log();
}

uint64_t cslprf_fluidui_log()
{
  return _cslprf_fluidui_log();
}

uint64_t cslprf_icon_field_log()
{
  return _cslprf_icon_field_log();
}

uint64_t cslprf_icon_log()
{
  return _cslprf_icon_log();
}

uint64_t cslprf_startup_log()
{
  return _cslprf_startup_log();
}

uint64_t cslprf_ui_log()
{
  return _cslprf_ui_log();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

float powf(float a1, float a2)
{
  return _powf(a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__appLayoutSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _appLayoutSpecifiers];
}

id objc_msgSend__appViewSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _appViewSpecifiers];
}

id objc_msgSend__beginDraggingIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _beginDraggingIfNecessary];
}

id objc_msgSend__calendarOverrideDate(void *a1, const char *a2, ...)
{
  return [a1 _calendarOverrideDate];
}

id objc_msgSend__cleanupAfterAnimation(void *a1, const char *a2, ...)
{
  return [a1 _cleanupAfterAnimation];
}

id objc_msgSend__computeDecelerationTarget(void *a1, const char *a2, ...)
{
  return [a1 _computeDecelerationTarget];
}

id objc_msgSend__finalizeOffset(void *a1, const char *a2, ...)
{
  return [a1 _finalizeOffset];
}

id objc_msgSend__needsDisplayLink(void *a1, const char *a2, ...)
{
  return [a1 _needsDisplayLink];
}

id objc_msgSend__updateDisplayLink(void *a1, const char *a2, ...)
{
  return [a1 _updateDisplayLink];
}

id objc_msgSend_abbrevDayMonthFormatter(void *a1, const char *a2, ...)
{
  return [a1 abbrevDayMonthFormatter];
}

id objc_msgSend_abbrevDayMonthTimeFormatter(void *a1, const char *a2, ...)
{
  return [a1 abbrevDayMonthTimeFormatter];
}

id objc_msgSend_abbreviatedDescription(void *a1, const char *a2, ...)
{
  return [a1 abbreviatedDescription];
}

id objc_msgSend_abbreviatedTimerJustMinutesSecondsFormatter(void *a1, const char *a2, ...)
{
  return [a1 abbreviatedTimerJustMinutesSecondsFormatter];
}

id objc_msgSend_abbreviatedTimerWithHoursFormatter(void *a1, const char *a2, ...)
{
  return [a1 abbreviatedTimerWithHoursFormatter];
}

id objc_msgSend_actionsOnInitialSyncComplete(void *a1, const char *a2, ...)
{
  return [a1 actionsOnInitialSyncComplete];
}

id objc_msgSend_activePairedDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activePairedDeviceSelectorBlock];
}

id objc_msgSend_addClip(void *a1, const char *a2, ...)
{
  return [a1 addClip];
}

id objc_msgSend_alarmSnoozeJustMinutesSecondsFormatter(void *a1, const char *a2, ...)
{
  return [a1 alarmSnoozeJustMinutesSecondsFormatter];
}

id objc_msgSend_alarmSnoozeWithHoursFormatter(void *a1, const char *a2, ...)
{
  return [a1 alarmSnoozeWithHoursFormatter];
}

id objc_msgSend_allNodes(void *a1, const char *a2, ...)
{
  return [a1 allNodes];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allPropertiesHash(void *a1, const char *a2, ...)
{
  return [a1 allPropertiesHash];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_animation(void *a1, const char *a2, ...)
{
  return [a1 animation];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_archiveToDictionary(void *a1, const char *a2, ...)
{
  return [a1 archiveToDictionary];
}

id objc_msgSend_archiveToDictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 archiveToDictionaryRepresentation];
}

id objc_msgSend_archiveToPropertyList(void *a1, const char *a2, ...)
{
  return [a1 archiveToPropertyList];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_calculateNeighborCounts(void *a1, const char *a2, ...)
{
  return [a1 calculateNeighborCounts];
}

id objc_msgSend_calendarIcon(void *a1, const char *a2, ...)
{
  return [a1 calendarIcon];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_centerIconDiameter(void *a1, const char *a2, ...)
{
  return [a1 centerIconDiameter];
}

id objc_msgSend_centeredHex(void *a1, const char *a2, ...)
{
  return [a1 centeredHex];
}

id objc_msgSend_circularCalendarIcon(void *a1, const char *a2, ...)
{
  return [a1 circularCalendarIcon];
}

id objc_msgSend_cleanupAfterLayout(void *a1, const char *a2, ...)
{
  return [a1 cleanupAfterLayout];
}

id objc_msgSend_cleanupJiggling(void *a1, const char *a2, ...)
{
  return [a1 cleanupJiggling];
}

id objc_msgSend_clearAllPresses(void *a1, const char *a2, ...)
{
  return [a1 clearAllPresses];
}

id objc_msgSend_clearPressedHex(void *a1, const char *a2, ...)
{
  return [a1 clearPressedHex];
}

id objc_msgSend_collapseAll343Holes(void *a1, const char *a2, ...)
{
  return [a1 collapseAll343Holes];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return [a1 contentOffset];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createFieldOfIconsView(void *a1, const char *a2, ...)
{
  return [a1 createFieldOfIconsView];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateBaselineFromOriginY(void *a1, const char *a2, ...)
{
  return [a1 dateBaselineFromOriginY];
}

id objc_msgSend_dateFont(void *a1, const char *a2, ...)
{
  return [a1 dateFont];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_dayBaselineFromOriginY(void *a1, const char *a2, ...)
{
  return [a1 dayBaselineFromOriginY];
}

id objc_msgSend_dayFont(void *a1, const char *a2, ...)
{
  return [a1 dayFont];
}

id objc_msgSend_dayHorizontalOffset(void *a1, const char *a2, ...)
{
  return [a1 dayHorizontalOffset];
}

id objc_msgSend_dayMonthYearFormatter(void *a1, const char *a2, ...)
{
  return [a1 dayMonthYearFormatter];
}

id objc_msgSend_dayOfWeekFormatter(void *a1, const char *a2, ...)
{
  return [a1 dayOfWeekFormatter];
}

id objc_msgSend_dayOfWeekMonthDayFormatter(void *a1, const char *a2, ...)
{
  return [a1 dayOfWeekMonthDayFormatter];
}

id objc_msgSend_dayOfWeekWithTimeFormatter(void *a1, const char *a2, ...)
{
  return [a1 dayOfWeekWithTimeFormatter];
}

id objc_msgSend_decimalFormatter(void *a1, const char *a2, ...)
{
  return [a1 decimalFormatter];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultDiameter(void *a1, const char *a2, ...)
{
  return [a1 defaultDiameter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultParagraphStyle(void *a1, const char *a2, ...)
{
  return [a1 defaultParagraphStyle];
}

id objc_msgSend_defaultPixelDiameter(void *a1, const char *a2, ...)
{
  return [a1 defaultPixelDiameter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceConfiguration(void *a1, const char *a2, ...)
{
  return [a1 deviceConfiguration];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_directPlacementReason(void *a1, const char *a2, ...)
{
  return [a1 directPlacementReason];
}

id objc_msgSend_endDragging(void *a1, const char *a2, ...)
{
  return [a1 endDragging];
}

id objc_msgSend_endJiggling(void *a1, const char *a2, ...)
{
  return [a1 endJiggling];
}

id objc_msgSend_endUpdating(void *a1, const char *a2, ...)
{
  return [a1 endUpdating];
}

id objc_msgSend_fakeBundle(void *a1, const char *a2, ...)
{
  return [a1 fakeBundle];
}

id objc_msgSend_firstGoodEmptyHex(void *a1, const char *a2, ...)
{
  return [a1 firstGoodEmptyHex];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptor];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_handleLongPress(void *a1, const char *a2, ...)
{
  return [a1 handleLongPress];
}

id objc_msgSend_hasDictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 hasDictionaryRepresentation];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hex(void *a1, const char *a2, ...)
{
  return [a1 hex];
}

id objc_msgSend_hexSideSize(void *a1, const char *a2, ...)
{
  return [a1 hexSideSize];
}

id objc_msgSend_iconsEdited(void *a1, const char *a2, ...)
{
  return [a1 iconsEdited];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_integrityCheck(void *a1, const char *a2, ...)
{
  return [a1 integrityCheck];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isDragging(void *a1, const char *a2, ...)
{
  return [a1 isDragging];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return [a1 isEditing];
}

id objc_msgSend_isEqual(void *a1, const char *a2, ...)
{
  return [a1 isEqual];
}

id objc_msgSend_isLongPress(void *a1, const char *a2, ...)
{
  return [a1 isLongPress];
}

id objc_msgSend_isVerticalOnly(void *a1, const char *a2, ...)
{
  return [a1 isVerticalOnly];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastReorderReason(void *a1, const char *a2, ...)
{
  return [a1 lastReorderReason];
}

id objc_msgSend_launcherViewMode(void *a1, const char *a2, ...)
{
  return [a1 launcherViewMode];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layout(void *a1, const char *a2, ...)
{
  return [a1 layout];
}

id objc_msgSend_layoutAttributes(void *a1, const char *a2, ...)
{
  return [a1 layoutAttributes];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return [a1 lineHeight];
}

id objc_msgSend_loadDefaultVerticalOnlyPositions(void *a1, const char *a2, ...)
{
  return [a1 loadDefaultVerticalOnlyPositions];
}

id objc_msgSend_loadLegacyDefaultPositions(void *a1, const char *a2, ...)
{
  return [a1 loadLegacyDefaultPositions];
}

id objc_msgSend_loadPositions(void *a1, const char *a2, ...)
{
  return [a1 loadPositions];
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return [a1 locale];
}

id objc_msgSend_longYMDHMSNoSpaceFormatter(void *a1, const char *a2, ...)
{
  return [a1 longYMDHMSNoSpaceFormatter];
}

id objc_msgSend_longYMDHMSZFormatter(void *a1, const char *a2, ...)
{
  return [a1 longYMDHMSZFormatter];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makePositionAnimation(void *a1, const char *a2, ...)
{
  return [a1 makePositionAnimation];
}

id objc_msgSend_makeTransformAnimation(void *a1, const char *a2, ...)
{
  return [a1 makeTransformAnimation];
}

id objc_msgSend_moved(void *a1, const char *a2, ...)
{
  return [a1 moved];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_node(void *a1, const char *a2, ...)
{
  return [a1 node];
}

id objc_msgSend_nodesByBundle(void *a1, const char *a2, ...)
{
  return [a1 nodesByBundle];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pauseJiggling(void *a1, const char *a2, ...)
{
  return [a1 pauseJiggling];
}

id objc_msgSend_percentComplete(void *a1, const char *a2, ...)
{
  return [a1 percentComplete];
}

id objc_msgSend_placementReason(void *a1, const char *a2, ...)
{
  return [a1 placementReason];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return [a1 position];
}

id objc_msgSend_prepareForLayout(void *a1, const char *a2, ...)
{
  return [a1 prepareForLayout];
}

id objc_msgSend_pressStateApplierDidUpdate(void *a1, const char *a2, ...)
{
  return [a1 pressStateApplierDidUpdate];
}

id objc_msgSend_q(void *a1, const char *a2, ...)
{
  return [a1 q];
}

id objc_msgSend_r(void *a1, const char *a2, ...)
{
  return [a1 r];
}

id objc_msgSend_relativeDateFormatter(void *a1, const char *a2, ...)
{
  return [a1 relativeDateFormatter];
}

id objc_msgSend_relativeDateTimeFormatter(void *a1, const char *a2, ...)
{
  return [a1 relativeDateTimeFormatter];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_revertMove(void *a1, const char *a2, ...)
{
  return [a1 revertMove];
}

id objc_msgSend_rowCount(void *a1, const char *a2, ...)
{
  return [a1 rowCount];
}

id objc_msgSend_rubberbandVector(void *a1, const char *a2, ...)
{
  return [a1 rubberbandVector];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_savedHex(void *a1, const char *a2, ...)
{
  return [a1 savedHex];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return [a1 setFill];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setupJiggling(void *a1, const char *a2, ...)
{
  return [a1 setupJiggling];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shortDayMonthTimeFormatter(void *a1, const char *a2, ...)
{
  return [a1 shortDayMonthTimeFormatter];
}

id objc_msgSend_shortWeekdaySymbols(void *a1, const char *a2, ...)
{
  return [a1 shortWeekdaySymbols];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_standardAppearance(void *a1, const char *a2, ...)
{
  return [a1 standardAppearance];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_startJiggling(void *a1, const char *a2, ...)
{
  return [a1 startJiggling];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_tabBar(void *a1, const char *a2, ...)
{
  return [a1 tabBar];
}

id objc_msgSend_tabBarController(void *a1, const char *a2, ...)
{
  return [a1 tabBarController];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_targetHex(void *a1, const char *a2, ...)
{
  return [a1 targetHex];
}

id objc_msgSend_timeFormatter(void *a1, const char *a2, ...)
{
  return [a1 timeFormatter];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeNoAMPMFormatter(void *a1, const char *a2, ...)
{
  return [a1 timeNoAMPMFormatter];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_touchPoint(void *a1, const char *a2, ...)
{
  return [a1 touchPoint];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_updateConstants(void *a1, const char *a2, ...)
{
  return [a1 updateConstants];
}

id objc_msgSend_updateNormalizedRadius(void *a1, const char *a2, ...)
{
  return [a1 updateNormalizedRadius];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_wasReflowed(void *a1, const char *a2, ...)
{
  return [a1 wasReflowed];
}

id objc_msgSend_weekday(void *a1, const char *a2, ...)
{
  return [a1 weekday];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}