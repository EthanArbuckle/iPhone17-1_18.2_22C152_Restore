uint64_t sub_21B6E5DB8()
{
  void (*v0)(void *);
  uint64_t vars8;

  sub_21B6E60E0(qword_26AA49B40, "[");
  v0 = (void (*)(void *))MEMORY[0x263F8C0B8];
  __cxa_atexit(MEMORY[0x263F8C0B8], qword_26AA49B40, &dword_21B6E4000);
  sub_21B6E60E0(&qword_26AA49B40[3], "]");
  __cxa_atexit(v0, &qword_26AA49B40[3], &dword_21B6E4000);
  sub_21B6E60E0(&qword_26AA49B40[6], " ");
  __cxa_atexit(v0, &qword_26AA49B40[6], &dword_21B6E4000);
  sub_21B6E60E0(&qword_26AA49B40[9], ";");
  __cxa_atexit(v0, &qword_26AA49B40[9], &dword_21B6E4000);
  sub_21B6E60E0(&qword_26AA49B40[12], ", ");
  return __cxa_atexit(v0, &qword_26AA49B40[12], &dword_21B6E4000);
}

double sub_21B6E5EB8()
{
  sub_21B6E60E0(qword_26AA49BD0, "[");
  v0 = (void (*)(void *))MEMORY[0x263F8C0B8];
  __cxa_atexit(MEMORY[0x263F8C0B8], qword_26AA49BD0, &dword_21B6E4000);
  sub_21B6E60E0(&qword_26AA49BD0[3], "]");
  __cxa_atexit(v0, &qword_26AA49BD0[3], &dword_21B6E4000);
  sub_21B6E60E0(&qword_26AA49BD0[6], " ");
  __cxa_atexit(v0, &qword_26AA49BD0[6], &dword_21B6E4000);
  sub_21B6E60E0(&qword_26AA49BD0[9], ";");
  __cxa_atexit(v0, &qword_26AA49BD0[9], &dword_21B6E4000);
  sub_21B6E60E0(&qword_26AA49BD0[12], ", ");
  __cxa_atexit(v0, &qword_26AA49BD0[12], &dword_21B6E4000);
  qword_26AA49BC0 = 0x400374B791E38EA2;
  qword_26AA49BC8 = 0x4008000000000000;
  qword_26AA49C60 = 0;
  unk_26AA49C68 = 0;
  double result = 6335439.33;
  xmmword_26AA49C50 = xmmword_21B700FF0;
  qword_26AA49C70 = 0x3FF0000000000000;
  return result;
}

uint64_t sub_21B6E5FE0()
{
  sub_21B6E60E0(qword_26AA49C78, "[");
  v0 = (void (*)(void *))MEMORY[0x263F8C0B8];
  __cxa_atexit(MEMORY[0x263F8C0B8], qword_26AA49C78, &dword_21B6E4000);
  sub_21B6E60E0(&qword_26AA49C78[3], "]");
  __cxa_atexit(v0, &qword_26AA49C78[3], &dword_21B6E4000);
  sub_21B6E60E0(&qword_26AA49C78[6], " ");
  __cxa_atexit(v0, &qword_26AA49C78[6], &dword_21B6E4000);
  sub_21B6E60E0(&qword_26AA49C78[9], ";");
  __cxa_atexit(v0, &qword_26AA49C78[9], &dword_21B6E4000);
  sub_21B6E60E0(&qword_26AA49C78[12], ", ");
  return __cxa_atexit(v0, &qword_26AA49C78[12], &dword_21B6E4000);
}

void *sub_21B6E60E0(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_21B6E64F4();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_21B6E6194(void *a1)
{
}

double sub_21B6E61A8(uint64_t a1)
{
  *(_OWORD *)a1 = xmmword_21B6FE7C0;
  *(void *)(a1 + 16) = 0xBFF0000000000000;
  *(void *)(a1 + 24) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_DWORD *)(a1 + 48) = -1082130432;
  *(unsigned char *)(a1 + 52) = 1;
  *(_DWORD *)(a1 + 56) = 1;
  *(_OWORD *)(a1 + 64) = 0u;
  *(void *)(a1 + 80) = 0xBFF0000000000000;
  *(void *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 96) = 0;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_DWORD *)(a1 + 124) = -1;
  *(void *)(a1 + 136) = -1;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_DWORD *)(a1 + 312) = -1;
  *(_DWORD *)(a1 + 332) = 0;
  *(_OWORD *)(a1 + 336) = xmmword_21B6FE7C0;
  *(_DWORD *)(a1 + 352) = 1;
  *(unsigned char *)(a1 + 356) = 0;
  *(void *)(a1 + 376) = 0;
  __asm { FMOV            V1.2D, #-1.0 }
  *(_OWORD *)(a1 + 384) = _Q1;
  *(_OWORD *)(a1 + 400) = xmmword_21B6FE7D0;
  *(void *)(a1 + 416) = 0xBFF0000000000000;
  *(_WORD *)(a1 + 424) = 0;
  *(_OWORD *)(a1 + 432) = 0u;
  *(void *)(a1 + 448) = 0xBFF0000000000000;
  *(_DWORD *)(a1 + 456) = 0;
  *(_OWORD *)(a1 + 464) = xmmword_21B6FE7D0;
  *(_OWORD *)(a1 + 480) = _Q1;
  *(_OWORD *)(a1 + 496) = xmmword_21B6FE7D0;
  *(unsigned char *)(a1 + 512) = 0;
  *(_DWORD *)(a1 + 536) = 0;
  *(_OWORD *)(a1 + 544) = xmmword_21B6FE7D0;
  *(void *)(a1 + 560) = 0;
  *(_DWORD *)(a1 + 568) = -1;
  *(unsigned char *)(a1 + 576) = 0;
  *(void *)(a1 + 584) = 0xBFF0000000000000;
  *(_OWORD *)(a1 + 592) = _Q1;
  *(_WORD *)(a1 + 608) = 0;
  *(unsigned char *)(a1 + 610) = 0;
  *(unsigned char *)(a1 + 636) = 0;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(void *)(a1 + 280) = 0xBFF0000000000000;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 316) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 520) = 0u;
  double result = 0.0;
  *(_OWORD *)(a1 + 612) = xmmword_21B6FE7E0;
  *(void *)(a1 + 628) = 0;
  return result;
}

double sub_21B6E62D4@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  memcpy(a2, &unk_21B6FE7F0, 0x230uLL);
  long long v4 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v4;
  *(void *)&long long v4 = *(void *)(a1 + 40);
  *((void *)a2 + 4) = *(void *)(a1 + 32);
  *((void *)a2 + 5) = v4;
  *((_DWORD *)a2 + 12) = *(_DWORD *)(a1 + 48);
  *((unsigned char *)a2 + 52) = *(unsigned char *)(a1 + 52);
  *((_DWORD *)a2 + 14) = *(_DWORD *)(a1 + 56);
  a2[4] = *(_OWORD *)(a1 + 64);
  *(void *)&long long v4 = *(void *)(a1 + 88);
  *((void *)a2 + 10) = *(void *)(a1 + 80);
  *((void *)a2 + 11) = v4;
  *((unsigned char *)a2 + 96) = *(unsigned char *)(a1 + 96);
  *(_OWORD *)((char *)a2 + 104) = *(_OWORD *)(a1 + 104);
  *(_OWORD *)((char *)a2 + 120) = *(_OWORD *)(a1 + 120);
  *(_OWORD *)((char *)a2 + 136) = *(_OWORD *)(a1 + 136);
  *(_OWORD *)((char *)a2 + 152) = *(_OWORD *)(a1 + 152);
  long long v5 = *(_OWORD *)(a1 + 280);
  *(_OWORD *)((char *)a2 + 264) = *(_OWORD *)(a1 + 264);
  *(_OWORD *)((char *)a2 + 280) = v5;
  *(_OWORD *)((char *)a2 + 248) = *(_OWORD *)(a1 + 248);
  *(_OWORD *)((char *)a2 + 232) = *(_OWORD *)(a1 + 232);
  *(_OWORD *)((char *)a2 + 216) = *(_OWORD *)(a1 + 216);
  *(_OWORD *)((char *)a2 + 200) = *(_OWORD *)(a1 + 200);
  *(_OWORD *)((char *)a2 + 184) = *(_OWORD *)(a1 + 184);
  *(_OWORD *)((char *)a2 + 168) = *(_OWORD *)(a1 + 168);
  *(_OWORD *)((char *)a2 + 296) = *(_OWORD *)(a1 + 296);
  *((_DWORD *)a2 + 78) = *(_DWORD *)(a1 + 312);
  *((_DWORD *)a2 + 79) = *(_DWORD *)(a1 + 316);
  long long v6 = *(_OWORD *)(a1 + 336);
  a2[20] = *(_OWORD *)(a1 + 320);
  a2[21] = v6;
  *((_DWORD *)a2 + 88) = *(_DWORD *)(a1 + 352);
  *((unsigned char *)a2 + 356) = *(unsigned char *)(a1 + 356);
  *((void *)a2 + 45) = *(void *)(a1 + 360);
  long long v7 = *(_OWORD *)(a1 + 384);
  a2[23] = *(_OWORD *)(a1 + 368);
  a2[24] = v7;
  a2[25] = *(_OWORD *)(a1 + 400);
  *((void *)a2 + 52) = *(void *)(a1 + 416);
  *((unsigned char *)a2 + 424) = *(unsigned char *)(a1 + 424);
  *((unsigned char *)a2 + 425) = *(unsigned char *)(a1 + 425);
  a2[27] = *(_OWORD *)(a1 + 432);
  *((void *)a2 + 56) = *(void *)(a1 + 448);
  *((_DWORD *)a2 + 114) = *(_DWORD *)(a1 + 456);
  long long v8 = *(_OWORD *)(a1 + 480);
  a2[29] = *(_OWORD *)(a1 + 464);
  a2[30] = v8;
  a2[31] = *(_OWORD *)(a1 + 496);
  int v9 = *(unsigned __int8 *)(a1 + 576);
  if (v9 == 1) {
    int v10 = 1;
  }
  else {
    int v10 = 2 * (v9 == 2);
  }
  *((_DWORD *)a2 + 128) = v10;
  *((void *)a2 + 65) = *(void *)(a1 + 584);
  *((void *)a2 + 66) = *(void *)(a1 + 592);
  double result = *(double *)(a1 + 616);
  *((double *)a2 + 67) = result;
  *((void *)a2 + 68) = *(void *)(a1 + 624);
  *((unsigned char *)a2 + 552) = *(unsigned char *)(a1 + 636);
  return result;
}

void sub_21B6E6480(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_21B6E64F4()
{
}

void sub_21B6E650C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_21B6E6568(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2643B5E28, MEMORY[0x263F8C060]);
}

void sub_21B6E6554(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_21B6E6568(std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_21B6E659C(double *a1, uint64_t a2)
{
  sub_21B6E6680(a1 + 1, a2);
  double v4 = a1[2];
  double v5 = a1[3];
  v3 = a1 + 2;
  double v6 = v4 * v4;
  double v7 = v3[2];
  double v8 = v3[3];
  double v9 = v4 * v5;
  double v10 = v4 * v7;
  double v11 = v4 * v8;
  double v12 = v5 * v5;
  double v13 = v5 * v7;
  double v14 = v5 * v8;
  double v15 = v7 * v7;
  double v16 = v7 * v8;
  double v17 = v8 * v8;
  double v18 = v9 + v9;
  v3[6] = v6 - v12 - v15 + v17;
  v3[7] = v18 - v16 - v16;
  double v19 = v10 + v10;
  v3[8] = v14 + v19 + v14;
  v3[9] = v16 + v18 + v16;
  v3[10] = v12 - v6 - v15 + v17;
  v3[11] = v13 + v13 - v11 - v11;
  v3[12] = v19 - v14 - v14;
  v3[13] = v11 + v13 + v13 + v11;
  v3[14] = v17 + v15 - v6 - v12;
  sub_21B6E670C(v3, v3 + 17);
}

void sub_21B6E6680(double *a1, uint64_t a2)
{
  v3 = a1 + 1;
  sub_21B6EAFB8((double *)(a2 + 8), a1 + 1);
  double v5 = a1[1];
  double v4 = a1[2];
  double v6 = a1[3];
  double v7 = a1[4];
  double v8 = sqrt(v4 * v4 + v5 * v5 + v6 * v6 + v7 * v7);
  if (v8 == 0.0)
  {
    void *v3 = 0;
    a1[2] = 0.0;
    double v9 = 1.0;
    a1[3] = 0.0;
  }
  else
  {
    if (v8 == 1.0) {
      return;
    }
    a1[1] = v5 / v8;
    a1[2] = v4 / v8;
    a1[3] = v6 / v8;
    double v9 = v7 / v8;
  }
  a1[4] = v9;
}

void sub_21B6E670C(double *a1, double *a2)
{
  double v4 = *a1;
  double v5 = sqrt(a1[1] * a1[1] + v4 * v4 + a1[2] * a1[2]);
  if (v5 <= 1.0) {
    double v6 = v5;
  }
  else {
    double v6 = 1.0;
  }
  long double v7 = asin(v6);
  if (v7 == 0.0)
  {
    *a2 = 1.0;
    a2[1] = 0.0;
    a2[2] = 0.0;
    a2[3] = 0.0;
  }
  else
  {
    v8.i64[0] = (uint64_t)a1[3];
    v10.f64[0] = NAN;
    v10.f64[1] = NAN;
    v9.i64[0] = 1.0;
    v8.i64[0] = vbslq_s8((int8x16_t)vnegq_f64(v10), v9, v8).u64[0];
    double v11 = -v4;
    if (fabs(v7) >= 2.22044605e-16)
    {
      *a2 = *(double *)v8.i64 * (v11 / v6);
      a2[1] = *(double *)v8.i64 * (-a1[1] / v6);
      a2[2] = *(double *)v8.i64 * (-a1[2] / v6);
      double v12 = fabs(a1[3]);
      long double v7 = v6;
    }
    else
    {
      *a2 = v11 / v7 * *(double *)v8.i64;
      a2[1] = *(double *)v8.i64 * (-a1[1] / v7);
      a2[2] = *(double *)v8.i64 * (-a1[2] / v7);
      double v12 = fabs(a1[3]);
    }
    long double v13 = atan2(v7, v12);
    a2[3] = v13 + v13;
  }
}

double sub_21B6E6834(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 32) = v3;
  *(void *)(a1 + 48) = v2;
  double v5 = *(double *)(a1 + 16);
  double v4 = *(double *)(a1 + 24);
  double v6 = v4 * v4;
  double v8 = *(double *)(a1 + 32);
  double v7 = *(double *)(a1 + 40);
  double v9 = sqrt(v4 * v4 + v5 * v5 + v8 * v8 + v7 * v7);
  if (v9 == 0.0)
  {
    *(void *)(a1 + 16) = 0;
    *(void *)(a1 + 24) = 0;
    double v7 = 1.0;
    double v8 = 0.0;
    double v4 = 0.0;
    double v5 = 0.0;
    *(void *)(a1 + 32) = 0;
LABEL_5:
    *(double *)(a1 + 40) = v7;
    double v6 = v4 * v4;
    goto LABEL_6;
  }
  if (v9 != 1.0)
  {
    double v5 = v5 / v9;
    double v4 = v4 / v9;
    *(double *)(a1 + 16) = v5;
    *(double *)(a1 + 24) = v4;
    double v8 = v8 / v9;
    *(double *)(a1 + 32) = v8;
    double v7 = v7 / v9;
    goto LABEL_5;
  }
LABEL_6:
  double v10 = v5 * v5;
  double v11 = v5 * v4;
  double v12 = v5 * v8;
  double v13 = v5 * v7;
  double v14 = v4 * v8;
  double v15 = v4 * v7;
  double v16 = v8 * v8;
  double v17 = v8 * v7;
  double v18 = v7 * v7;
  double v19 = v11 + v11;
  *(double *)(a1 + 64) = v10 - v6 - v16 + v18;
  *(double *)(a1 + 72) = v19 - v17 - v17;
  double v20 = v12 + v12;
  *(double *)(a1 + 80) = v15 + v20 + v15;
  *(double *)(a1 + 88) = v17 + v19 + v17;
  *(double *)(a1 + 96) = v6 - v10 - v16 + v18;
  *(double *)(a1 + 104) = v14 + v14 - v13 - v13;
  *(double *)(a1 + 112) = v20 - v15 - v15;
  *(double *)(a1 + 120) = v13 + v14 + v14 + v13;
  *(double *)(a1 + 128) = v18 + v16 - v10 - v6;
  sub_21B6E670C((double *)(a1 + 16), (double *)(a1 + 152));
  return result;
}

void sub_21B6E695C(uint64_t a1, uint64_t a2, int8x16_t a3, double a4, int8x16_t a5)
{
  sub_21B6E6A40((void *)(a1 + 8), a2, a3, a4, a5);
  double v7 = *(double *)(a1 + 16);
  double v8 = *(double *)(a1 + 24);
  double v6 = (double *)(a1 + 16);
  double v9 = v7 * v7;
  double v10 = v6[2];
  double v11 = v6[3];
  double v12 = v7 * v8;
  double v13 = v7 * v10;
  double v14 = v7 * v11;
  double v15 = v8 * v8;
  double v16 = v8 * v10;
  double v17 = v8 * v11;
  double v18 = v10 * v10;
  double v19 = v10 * v11;
  double v20 = v11 * v11;
  double v21 = v12 + v12;
  v6[6] = v9 - v15 - v18 + v20;
  v6[7] = v21 - v19 - v19;
  double v22 = v13 + v13;
  v6[8] = v17 + v22 + v17;
  v6[9] = v19 + v21 + v19;
  v6[10] = v15 - v9 - v18 + v20;
  v6[11] = v16 + v16 - v14 - v14;
  v6[12] = v22 - v17 - v17;
  v6[13] = v14 + v16 + v16 + v14;
  v6[14] = v20 + v18 - v9 - v15;
  sub_21B6E670C(v6, v6 + 17);
}

void sub_21B6E6A40(void *a1, uint64_t a2, int8x16_t a3, double a4, int8x16_t a5)
{
  a3.i64[0] = *(void *)(a2 + 32);
  if (*(double *)a3.i64 <= -3.14159265 || *(double *)a3.i64 > 3.14159265)
  {
    a5.i64[0] = 0x400921FB54442D18;
    v7.f64[0] = NAN;
    v7.f64[1] = NAN;
    int8x16_t v19 = a5;
    int8x16_t v20 = (int8x16_t)vnegq_f64(v7);
    double v18 = *(double *)vbslq_s8(v20, a5, a3).i64;
    *(double *)a3.i64 = fmod(*(double *)a3.i64 + v18, 6.28318531);
    *(void *)&double v8 = vbslq_s8(v20, v19, a3).u64[0];
    if (*(double *)a3.i64 == 0.0) {
      *(double *)a3.i64 = v8;
    }
    else {
      *(double *)a3.i64 = *(double *)a3.i64 - v18;
    }
  }
  double v9 = a1 + 1;
  double v10 = *(double *)a3.i64 * 0.5;
  if (v10 == 0.0)
  {
    *double v9 = 0;
    a1[2] = 0;
    a1[3] = 0;
    a1[4] = 0x3FF0000000000000;
    double v11 = 0.0;
    double cosval = 1.0;
    double v13 = 0.0;
    double v14 = 0.0;
  }
  else
  {
    if (fabs(v10) >= 2.22044605e-16)
    {
      __double2 v15 = __sincos_stret(v10);
      double cosval = v15.__cosval;
      double v14 = -(*(double *)(a2 + 8) * v15.__sinval);
      *((double *)a1 + 1) = v14;
      double v13 = -(*(double *)(a2 + 16) * v15.__sinval);
      *((double *)a1 + 2) = v13;
      double v11 = -(*(double *)(a2 + 24) * v15.__sinval);
    }
    else
    {
      double v14 = -(*(double *)(a2 + 8) * v10);
      *((double *)a1 + 1) = v14;
      double v13 = -(*(double *)(a2 + 16) * v10);
      *((double *)a1 + 2) = v13;
      double v11 = -(*(double *)(a2 + 24) * v10);
      double cosval = sqrt(1.0 - (v13 * v13 + v14 * v14 + v11 * v11));
    }
    *((double *)a1 + 3) = v11;
    *((double *)a1 + 4) = cosval;
  }
  double v16 = sqrt(v13 * v13 + v14 * v14 + v11 * v11 + cosval * cosval);
  if (v16 == 0.0)
  {
    *double v9 = 0;
    a1[2] = 0;
    double v17 = 1.0;
    a1[3] = 0;
  }
  else
  {
    if (v16 == 1.0) {
      return;
    }
    *((double *)a1 + 1) = v14 / v16;
    *((double *)a1 + 2) = v13 / v16;
    *((double *)a1 + 3) = v11 / v16;
    double v17 = cosval / v16;
  }
  *((double *)a1 + 4) = v17;
}

BOOL sub_21B6E6BDC(unsigned char *a1)
{
  uint64_t v1 = 152;
  while ((*(void *)&a1[v1] & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
  {
    v1 += 8;
    if (v1 == 184)
    {
      uint64_t v2 = 200;
      while ((*(void *)&a1[v2] & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
      {
        v2 += 8;
        if (v2 == 224)
        {
          if (*a1) {
            return 1;
          }
          uint64_t v4 = 0;
          double v5 = a1 + 240;
          while ((*(void *)&v5[v4] & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
          {
            v4 += 8;
            if (v4 == 288)
            {
              uint64_t v6 = 0;
              do
              {
                double v7 = *(double *)&v5[v6];
                BOOL result = v7 >= 0.0;
                if (v7 < 0.0) {
                  break;
                }
                BOOL v8 = v6 == 280;
                v6 += 56;
              }
              while (!v8);
              return result;
            }
          }
          return 0;
        }
      }
      return 0;
    }
  }
  return 0;
}

void sub_21B6E6C8C(uint64_t a1)
{
  if (*(unsigned char *)a1)
  {
    LOBYTE(v12) = 1;
    v13[0] = vdupq_n_s64(3uLL);
    v13[1] = xmmword_21B6FEA60;
    *(void *)&v13[2] = a1 + 64;
    *((void *)&v13[2] + 1) = a1 + 136;
    sub_21B6EA188((uint64_t)&v30, &v12);
    sub_21B6E659C((double *)a1, (uint64_t)&v30);
    sub_21B6E70C8((uint64_t)&v30, a1 + 56, (double *)(a1 + 192));
    *(_OWORD *)(a1 + 200) = *(_OWORD *)__B;
    *(_OWORD *)(a1 + 216) = *(_OWORD *)&__B[16];
    *(float64x2_t *)(a1 + 200) = vnegq_f64(*(float64x2_t *)(a1 + 200));
    *(double *)(a1 + 216) = -*(double *)(a1 + 216);
  }
  else
  {
    v49 = &unk_26CB86830;
    long long v50 = *(_OWORD *)(a1 + 200);
    long long v51 = *(_OWORD *)(a1 + 216);
    LOBYTE(v12) = 1;
    v13[0] = vdupq_n_s64(3uLL);
    v13[1] = xmmword_21B6FEA60;
    *(void *)&v13[2] = a1 + 64;
    *((void *)&v13[2] + 1) = a1 + 136;
    sub_21B6EA188((uint64_t)&v30, &v12);
    sub_21B6E659C((double *)a1, (uint64_t)&v30);
    sub_21B6E70C8((uint64_t)&v30, a1 + 56, (double *)(a1 + 192));
    *(_OWORD *)(a1 + 200) = *(_OWORD *)__B;
    *(_OWORD *)(a1 + 216) = *(_OWORD *)&__B[16];
    *(float64x2_t *)(a1 + 200) = vnegq_f64(*(float64x2_t *)(a1 + 200));
    *(double *)(a1 + 216) = -*(double *)(a1 + 216);
    memset(&__B[8], 0, 32);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v36 = 0;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    unint64_t v37 = 0xBFF0000000000000;
    *(void *)&long long v33 = 0xBFF0000000000000;
    v30 = &unk_26CB86950;
    *(void *)__B = 0xBFF0000000000000;
    sub_21B6E7EE8((double *)(a1 + 56), a1 + 144, (double *)&v49, (uint64_t)&v12, (int8x16_t)0, v2);
    *(_OWORD *)&__B[24] = v13[0];
    *(void *)&long long v32 = *(void *)&v13[1];
    long long v34 = *(_OWORD *)((char *)&v13[1] + 8);
    *(void *)&long long v35 = *((void *)&v13[2] + 1);
    long long v38 = v14;
    *(void *)&long long v39 = v15;
    long long v3 = *(_OWORD *)(a1 + 64);
    v13[1] = *(_OWORD *)(a1 + 80);
    long long v4 = *(_OWORD *)(a1 + 112);
    v13[2] = *(_OWORD *)(a1 + 96);
    long long v14 = v4;
    long long v15 = *(_OWORD *)(a1 + 128);
    uint64_t v5 = 8;
    v13[0] = v3;
    do
    {
      *(double *)((char *)&v12 + v5) = -*(double *)((char *)&v12 + v5);
      v5 += 8;
    }
    while (v5 != 80);
    long long v41 = v13[0];
    *(void *)&long long v42 = *(void *)&v13[1];
    long long v44 = *(_OWORD *)((char *)&v13[1] + 8);
    *(void *)&long long v45 = *((void *)&v13[2] + 1);
    long long v47 = v14;
    *(void *)&long long v48 = v15;
    sub_21B6EB144(&v10, 6, 6);
    cblas_dgemm(CblasColMajor, CblasNoTrans, CblasTrans, 6, 6, 6, 1.0, (const double *)(a1 + 240), 6, (const double *)__B, 6, 0.0, __C[2], (const int)__C[1]);
    uint64_t v6 = v13;
    long long v27 = 0u;
    long long v28 = 0u;
    memset(v13, 0, sizeof(v13));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v12 = &unk_26CB86950;
    uint64_t v29 = 0;
    double v7 = __C[2];
    BOOL v8 = __C[3];
    while (v7 != v8)
    {
      uint64_t v9 = *(void *)v7++;
      *v6++ = v9;
    }
    sub_21B6EA254(&v10);
    sub_21B6E7130((uint64_t)&v30, (uint64_t)&v12, (uint64_t)&v10);
    memcpy((void *)(a1 + 240), __C, 0x128uLL);
    sub_21B6E7200(a1);
  }
}

double sub_21B6E70C8(uint64_t a1, uint64_t a2, double *a3)
{
  *(void *)a1 = &unk_26CB86830;
  *(void *)(a1 + 32) = 0;
  double v3 = a3[1];
  double v4 = a3[2];
  double v5 = a3[3];
  *(float64x2_t *)(a1 + 8) = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 32), v4), *(float64x2_t *)(a2 + 8), v3), *(float64x2_t *)(a2 + 56), v5);
  double result = v4 * *(double *)(a2 + 48) + *(double *)(a2 + 24) * v3 + *(double *)(a2 + 72) * v5;
  *(double *)(a1 + 24) = result;
  return result;
}

void sub_21B6E7130(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = &unk_26CB86950;
  *(_OWORD *)(a3 + 24) = 0u;
  *(_OWORD *)(a3 + 40) = 0u;
  *(_OWORD *)(a3 + 56) = 0u;
  *(_OWORD *)(a3 + 72) = 0u;
  *(_OWORD *)(a3 + 88) = 0u;
  *(_OWORD *)(a3 + 104) = 0u;
  *(_OWORD *)(a3 + 120) = 0u;
  *(_OWORD *)(a3 + 136) = 0u;
  *(_OWORD *)(a3 + 152) = 0u;
  *(_OWORD *)(a3 + 168) = 0u;
  *(_OWORD *)(a3 + 184) = 0u;
  *(_OWORD *)(a3 + 200) = 0u;
  *(_OWORD *)(a3 + 216) = 0u;
  *(_OWORD *)(a3 + 232) = 0u;
  *(_OWORD *)(a3 + 248) = 0u;
  *(void *)(a3 + 296) = 0;
  *(_OWORD *)(a3 + 8) = 0u;
  uint64_t __C = a3 + 8;
  *(_OWORD *)(__C + 256) = 0u;
  *(_OWORD *)(__C + 272) = 0u;
  cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, 6, 6, 6, 1.0, (const double *)(a1 + 8), 6, (const double *)(a2 + 8), 6, 0.0, (double *)__C, 6);
}

void sub_21B6E7200(uint64_t a1)
{
  uint64_t v1 = a1 + 232;
  int8x16_t v2 = (void *)(a1 + 240);
  LOBYTE(v3) = 1;
  int64x2_t v4 = vdupq_n_s64(6uLL);
  long long v5 = xmmword_21B6FEA70;
  uint64_t v6 = a1 + 240;
  uint64_t v7 = a1 + 528;
  *(void *)&double __B = &unk_26CB86950;
  memcpy(v9, (const void *)(a1 + 240), sizeof(v9));
  sub_21B6EB3D4((uint64_t)&__B, &v3);
  memcpy(v2, v9, 0x128uLL);
  double __B = 0.5;
  sub_21B6EB4C4(v1, &__B);
}

double sub_21B6E72BC(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    sub_21B6EA294((uint64_t)&v71, a1);
    v70[5] = 0;
    v70[0] = &unk_26CB86970;
    double v6 = *(double *)(a2 + 32);
    double v5 = *(double *)(a2 + 40);
    double v7 = *(double *)(a2 + 16);
    double v8 = *(double *)(a2 + 24);
    *(double *)&v70[1] = v72.f64[1] * v5 + *(double *)&v73[16] * v7 - *(double *)v73 * v6 + *(double *)&v73[8] * v8;
    *(double *)&v70[2] = v5 * *(double *)v73 + *(double *)&v73[16] * v8 - *(double *)&v73[8] * v7 + v72.f64[1] * v6;
    *(double *)&v70[3] = v5 * *(double *)&v73[8] + *(double *)&v73[16] * v6 - v72.f64[1] * v8 + *(double *)v73 * v7;
    *(double *)&v70[4] = *(double *)&v73[16] * v5 - v72.f64[1] * v7 - *(double *)v73 * v8 - *(double *)&v73[8] * v6;
    sub_21B6E6834(a1, (uint64_t)v70);
    uint64_t v9 = 0;
    v64 = &unk_26CB86830;
    *((void *)&v66 + 1) = 0;
    double v10 = *(double *)(a2 + 200);
    double v11 = *(double *)(a2 + 208);
    double v12 = *(double *)(a2 + 216);
    float64x2_t v65 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(v75, v11), *(float64x2_t *)&v74[8], v10), v77, v12);
    *(double *)&long long v66 = v11 * v76 + *(double *)&v74[24] * v10 + v78 * v12;
    do
    {
      *(double *)((char *)&v64 + v9 + 8) = *(double *)((char *)&v64 + v9 + 8) + *(double *)&v79[v9];
      v9 += 8;
    }
    while (v9 != 24);
    long long v13 = v66;
    *(float64x2_t *)(a1 + 200) = v65;
    *(_OWORD *)(a1 + 216) = v13;
    sub_21B6E7878((double *)(a1 + 144), a1 + 8, (uint64_t)v69);
    *(unsigned char *)a1 = 0;
    *(_OWORD *)(a1 + 240) = 0u;
    *(_OWORD *)(a1 + 256) = 0u;
    *(_OWORD *)(a1 + 272) = 0u;
    *(_OWORD *)(a1 + 288) = 0u;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 320) = 0u;
    *(_OWORD *)(a1 + 336) = 0u;
    *(_OWORD *)(a1 + 352) = 0u;
    *(_OWORD *)(a1 + 368) = 0u;
    *(_OWORD *)(a1 + 384) = 0u;
    *(_OWORD *)(a1 + 400) = 0u;
    *(_OWORD *)(a1 + 416) = 0u;
    *(_OWORD *)(a1 + 432) = 0u;
    *(_OWORD *)(a1 + 448) = 0u;
    *(_OWORD *)(a1 + 464) = 0u;
    *(_OWORD *)(a1 + 480) = 0u;
    *(_OWORD *)(a1 + 496) = 0u;
    *(_OWORD *)(a1 + 512) = 0u;
    if (!(_BYTE)v71)
    {
      sub_21B6E79DC((double *)&v71, a2, (uint64_t)v69, (uint64_t)&v64);
      LOBYTE(v36) = 0;
      int64x2_t v37 = vdupq_n_s64(6uLL);
      long long v38 = xmmword_21B6FEA70;
      long long v39 = &v65;
      long long v40 = &v68;
      sub_21B6E7BA4((uint64_t)&v80, &v36, v41);
      long long v61 = 0u;
      long long v62 = 0u;
      float64x2_t __B = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v44 = &unk_26CB86950;
      uint64_t v63 = 0;
      long long v14 = v42;
      long long v15 = v43;
      if (v42 != v43)
      {
        p_B = &__B;
        do
        {
          float64_t v17 = *v14++;
          p_B->f64[0] = v17;
          p_B = (float64x2_t *)((char *)p_B + 8);
        }
        while (v14 != v15);
      }
      sub_21B6EA254(v41);
      cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, 6, 6, 6, 1.0, v65.f64, 6, __B.f64, 6, 1.0, (double *)(a1 + 240), 6);
    }
    if (!*(unsigned char *)a2)
    {
      sub_21B6E7C7C((uint64_t)&v71, a2, (uint64_t)v69, (uint64_t)&v64);
      LOBYTE(v36) = 0;
      int64x2_t v37 = vdupq_n_s64(6uLL);
      long long v38 = xmmword_21B6FEA70;
      long long v39 = &v65;
      long long v40 = &v68;
      sub_21B6E7BA4(a2 + 232, &v36, v41);
      long long v61 = 0u;
      long long v62 = 0u;
      float64x2_t __B = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v44 = &unk_26CB86950;
      uint64_t v63 = 0;
      long long v18 = v42;
      long long v19 = v43;
      if (v42 != v43)
      {
        long long v20 = &__B;
        do
        {
          float64_t v21 = *v18++;
          v20->f64[0] = v21;
          long long v20 = (float64x2_t *)((char *)v20 + 8);
        }
        while (v18 != v19);
      }
      sub_21B6EA254(v41);
      cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, 6, 6, 6, 1.0, v65.f64, 6, __B.f64, 6, 1.0, (double *)(a1 + 240), 6);
    }
    sub_21B6E7200(a1);
  }
  else
  {
    v71 = &unk_26CB86850;
    float64x2_t v23 = *(float64x2_t *)(a1 + 64);
    *(_OWORD *)v73 = *(_OWORD *)(a1 + 80);
    long long v24 = *(_OWORD *)(a1 + 112);
    *(_OWORD *)&v73[16] = *(_OWORD *)(a1 + 96);
    *(_OWORD *)v74 = v24;
    *(_OWORD *)&v74[16] = *(_OWORD *)(a1 + 128);
    float64x2_t v72 = v23;
    uint64_t v67 = 0;
    v64 = &unk_26CB86970;
    double v25 = *(double *)(a1 + 16);
    v23.f64[0] = *(float64_t *)(a1 + 24);
    double v26 = *(double *)(a2 + 32);
    *(void *)&long long v24 = *(void *)(a2 + 40);
    double v28 = *(double *)(a1 + 32);
    double v27 = *(double *)(a1 + 40);
    double v29 = *(double *)(a2 + 16);
    double v30 = *(double *)(a2 + 24);
    v65.f64[0] = v25 * *(double *)&v24 + v27 * v29 - v23.f64[0] * v26 + v28 * v30;
    v65.f64[1] = *(double *)&v24 * v23.f64[0] + v27 * v30 - v28 * v29 + v25 * v26;
    *(double *)&long long v66 = *(double *)&v24 * v28 + v27 * v26 - v25 * v30 + v23.f64[0] * v29;
    *((double *)&v66 + 1) = v27 * *(double *)&v24 - v25 * v29 - v23.f64[0] * v30 - v28 * v26;
    sub_21B6E6834(a1, (uint64_t)&v64);
    uint64_t v31 = 0;
    double v32 = *(double *)(a2 + 200);
    double v33 = *(double *)(a2 + 208);
    double v34 = *(double *)(a2 + 216);
    *((void *)&v46 + 1) = 0;
    float64x2_t __B = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v73[8], v33), v72, v32), *(float64x2_t *)v74, v34);
    *(double *)&long long v46 = v33 * *(double *)&v73[24] + *(double *)v73 * v32 + *(double *)&v74[16] * v34;
    do
    {
      *(double *)((char *)&v44 + v31 + 8) = *(double *)((char *)&v44 + v31 + 8) + *(double *)(a1 + v31 + 200);
      v31 += 8;
    }
    while (v31 != 24);
    long long v35 = v46;
    *(float64x2_t *)(a1 + 200) = __B;
    *(_OWORD *)(a1 + 216) = v35;
    *(unsigned char *)a1 = 1;
    double result = 0.0;
    *(_OWORD *)(a1 + 240) = 0u;
    *(_OWORD *)(a1 + 256) = 0u;
    *(_OWORD *)(a1 + 272) = 0u;
    *(_OWORD *)(a1 + 288) = 0u;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 320) = 0u;
    *(_OWORD *)(a1 + 336) = 0u;
    *(_OWORD *)(a1 + 352) = 0u;
    *(_OWORD *)(a1 + 368) = 0u;
    *(_OWORD *)(a1 + 384) = 0u;
    *(_OWORD *)(a1 + 400) = 0u;
    *(_OWORD *)(a1 + 416) = 0u;
    *(_OWORD *)(a1 + 432) = 0u;
    *(_OWORD *)(a1 + 448) = 0u;
    *(_OWORD *)(a1 + 464) = 0u;
    *(_OWORD *)(a1 + 480) = 0u;
    *(_OWORD *)(a1 + 496) = 0u;
    *(_OWORD *)(a1 + 512) = 0u;
  }
  return result;
}

void sub_21B6E7878(double *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = &unk_26CB86870;
  *(_OWORD *)(a3 + 8) = 0u;
  *(_OWORD *)(a3 + 24) = 0u;
  *(_OWORD *)(a3 + 40) = 0u;
  *(_OWORD *)(a3 + 56) = 0u;
  *(_OWORD *)(a3 + 72) = 0u;
  *(_OWORD *)(a3 + 88) = 0u;
  *(void *)(a3 + 104) = 0;
  double v5 = a1[4];
  double v6 = v5 * 0.5;
  if (v5 * 0.5 == 0.0)
  {
    *(void *)(a3 + 96) = 0;
    *(_OWORD *)(a3 + 64) = 0uLL;
    *(_OWORD *)(a3 + 80) = 0uLL;
    *(_OWORD *)(a3 + 32) = 0uLL;
    *(_OWORD *)(a3 + 48) = 0uLL;
    *(_OWORD *)(a3 + 16) = 0uLL;
    *(void *)(a3 + 72) = 0xC000000000000000;
    *(void *)(a3 + 40) = 0xC000000000000000;
    *(void *)(a3 + 8) = 0xC000000000000000;
  }
  else
  {
    if (fabs(v6) >= 2.22044605e-16)
    {
      __double2 v10 = __sincos_stret(v6);
      double v9 = v5 / v10.__sinval;
      double v8 = -(v5 / v10.__sinval - v10.__cosval * 2.0);
      double v5 = v10.__sinval + v10.__sinval;
    }
    else
    {
      double v8 = -(v6 * v6);
      double v9 = 2.0;
    }
    double v11 = a1[1];
    double v12 = a1[2];
    double v13 = v8 * -(v12 * v11);
    *(double *)(a3 + 8) = -(v9 - -(v11 * v11) * v8);
    *(double *)(a3 + 16) = v13;
    double v14 = a1[3];
    double v15 = v8 * -(v14 * v11);
    *(double *)(a3 + 24) = v15;
    *(double *)(a3 + 32) = v13;
    double v16 = v8 * -(v14 * v12);
    *(double *)(a3 + 40) = -(v9 - -(v12 * v12) * v8);
    *(double *)(a3 + 48) = v16;
    *(double *)(a3 + 56) = v15;
    *(double *)(a3 + 64) = v16;
    *(double *)(a3 + 72) = -(v9 - -(v14 * v14) * v8);
    *(double *)(a3 + 80) = -(v11 * v5);
    *(double *)(a3 + 88) = -(v12 * v5);
    *(double *)(a3 + 96) = -(v14 * v5);
  }
  if (*(double *)(a2 + 32) < 0.0)
  {
    for (uint64_t i = 8; i != 104; i += 16)
      *(float64x2_t *)(a3 + i) = vnegq_f64(*(float64x2_t *)(a3 + i));
  }
}

double sub_21B6E79DC@<D0>(double *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  double v9 = *(double *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  double v11 = *(double *)(a2 + 16);
  double v10 = *(double *)(a2 + 24);
  v31[0] = &unk_26CB868F0;
  v31[1] = v8;
  *(double *)&v31[2] = v9;
  *(double *)&v31[3] = -v10;
  *(double *)&v31[4] = -v11;
  *(double *)&v31[5] = -v9;
  v31[6] = v8;
  *(double *)&v31[7] = v11;
  *(double *)&v31[8] = -v10;
  *(double *)&v31[9] = v10;
  *(double *)&v31[10] = -v11;
  v31[11] = v8;
  *(double *)&v31[12] = -v9;
  *(double *)&v31[13] = v11;
  *(double *)&v31[14] = v10;
  *(double *)&v31[15] = v9;
  v31[16] = v8;
  v31[17] = 0;
  uint64_t v12 = (uint64_t)(a1 + 18);
  sub_21B6E86AC((uint64_t)v30, a1 + 18, a1[5]);
  *(void *)a4 = &unk_26CB86950;
  *(_OWORD *)(a4 + 24) = 0u;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 56) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  *(_OWORD *)(a4 + 88) = 0u;
  *(_OWORD *)(a4 + 104) = 0u;
  *(_OWORD *)(a4 + 120) = 0u;
  *(_OWORD *)(a4 + 136) = 0u;
  *(_OWORD *)(a4 + 152) = 0u;
  *(_OWORD *)(a4 + 168) = 0u;
  *(_OWORD *)(a4 + 184) = 0u;
  *(_OWORD *)(a4 + 200) = 0u;
  *(_OWORD *)(a4 + 216) = 0u;
  *(_OWORD *)(a4 + 232) = 0u;
  *(_OWORD *)(a4 + 248) = 0u;
  *(void *)(a4 + 296) = 0;
  *(_OWORD *)(a4 + 8) = 0u;
  *(_OWORD *)(a4 + 264) = 0u;
  *(_OWORD *)(a4 + 280) = 0u;
  sub_21B6E88AC((uint64_t)v16, a3, (uint64_t)v31);
  sub_21B6E8810((uint64_t)v23, (uint64_t)v16, (uint64_t)v30);
  *(_OWORD *)(a4 + 8) = v24;
  *(void *)(a4 + 24) = v25;
  *(_OWORD *)(a4 + 56) = v26;
  *(void *)(a4 + 72) = v27;
  v13.i64[1] = *((void *)&v28 + 1);
  *(_OWORD *)(a4 + 104) = v28;
  v13.i64[0] = v29;
  *(void *)(a4 + 120) = v29;
  sub_21B6E7EE8(a1 + 7, v12, (double *)(a2 + 192), (uint64_t)v16, v13, v14);
  *(_OWORD *)(a4 + 32) = v17;
  *(void *)(a4 + 48) = v18;
  *(_OWORD *)(a4 + 80) = v19;
  *(void *)(a4 + 96) = v20;
  *(_OWORD *)(a4 + 128) = v21;
  double result = v22;
  *(double *)(a4 + 144) = v22;
  *(void *)(a4 + 288) = 0x3FF0000000000000;
  *(void *)(a4 + 232) = 0x3FF0000000000000;
  *(void *)(a4 + 176) = 0x3FF0000000000000;
  return result;
}

void sub_21B6E7BA4(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  double v5 = sub_21B6EB144(a3, 6, a2[2]);
  uint64_t v6 = a2[2];
  if (v6)
  {
    double v7 = (const double *)a2[5];
    uint64_t v8 = a2[3];
    uint64_t __incY = v5[2];
    __Y = (double *)v5[3];
    if (v6 == 1)
    {
      cblas_dgemv(CblasColMajor, CblasNoTrans, 6, 6, 1.0, (const double *)(a1 + 8), 6, v7, v8, 0.0, __Y, __incY);
    }
    else
    {
      uint64_t v11 = a2[4];
      if (v8 == 1)
      {
        CBLAS_TRANSPOSE v12 = CblasNoTrans;
      }
      else
      {
        uint64_t v11 = a2[3];
        CBLAS_TRANSPOSE v12 = CblasTrans;
      }
      cblas_dgemm(CblasColMajor, CblasNoTrans, v12, 6, v6, 6, 1.0, (const double *)(a1 + 8), 6, v7, v11, 0.0, __Y, __incY);
    }
  }
}

double sub_21B6E7C7C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  double v8 = *(double *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  double v10 = *(double *)(a1 + 16);
  double v9 = *(double *)(a1 + 24);
  v21[0] = &unk_26CB868F0;
  v21[1] = v7;
  *(double *)&v21[2] = -v8;
  *(double *)&v21[3] = v9;
  *(double *)&v21[4] = -v10;
  *(double *)&v21[5] = v8;
  v21[6] = v7;
  *(double *)&v21[7] = -v10;
  *(double *)&v21[8] = -v9;
  *(double *)&v21[9] = -v9;
  *(double *)&v21[10] = v10;
  v21[11] = v7;
  *(double *)&v21[12] = -v8;
  *(double *)&v21[13] = v10;
  *(double *)&v21[14] = v9;
  *(double *)&v21[15] = v8;
  v21[16] = v7;
  v21[17] = 0;
  sub_21B6E86AC((uint64_t)v20, (double *)(a2 + 144), *(double *)(a2 + 40));
  *(void *)a4 = &unk_26CB86950;
  *(_OWORD *)(a4 + 24) = 0u;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 56) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  *(_OWORD *)(a4 + 88) = 0u;
  *(_OWORD *)(a4 + 104) = 0u;
  *(_OWORD *)(a4 + 120) = 0u;
  *(_OWORD *)(a4 + 136) = 0u;
  *(_OWORD *)(a4 + 152) = 0u;
  *(_OWORD *)(a4 + 168) = 0u;
  *(_OWORD *)(a4 + 184) = 0u;
  *(_OWORD *)(a4 + 200) = 0u;
  *(_OWORD *)(a4 + 216) = 0u;
  *(_OWORD *)(a4 + 232) = 0u;
  *(_OWORD *)(a4 + 248) = 0u;
  *(void *)(a4 + 296) = 0;
  *(_OWORD *)(a4 + 8) = 0u;
  *(_OWORD *)(a4 + 264) = 0u;
  *(_OWORD *)(a4 + 280) = 0u;
  sub_21B6E88AC((uint64_t)v12, a3, (uint64_t)v21);
  sub_21B6E8810((uint64_t)v13, (uint64_t)v12, (uint64_t)v20);
  *(_OWORD *)(a4 + 8) = v14;
  *(void *)(a4 + 24) = v15;
  *(_OWORD *)(a4 + 56) = v16;
  *(void *)(a4 + 72) = v17;
  *(_OWORD *)(a4 + 104) = v18;
  *(void *)(a4 + 120) = v19;
  *(_OWORD *)(a4 + 176) = *(_OWORD *)(a1 + 64);
  *(void *)(a4 + 192) = *(void *)(a1 + 80);
  *(_OWORD *)(a4 + 224) = *(_OWORD *)(a1 + 88);
  *(void *)(a4 + 240) = *(void *)(a1 + 104);
  *(_OWORD *)(a4 + 272) = *(_OWORD *)(a1 + 112);
  double result = *(double *)(a1 + 128);
  *(double *)(a4 + 288) = result;
  return result;
}

double sub_21B6E7E1C@<D0>(double *a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = &unk_26CB86850;
  *(void *)(a3 + 80) = 0;
  double v3 = a2[1];
  double v4 = a2[2];
  double v6 = a1[3];
  double v5 = a1[4];
  double v7 = a1[1];
  double v8 = a1[2];
  double v9 = a1[7];
  double v10 = a1[8];
  double v11 = a2[3];
  double v12 = a2[4];
  double v13 = a1[5];
  double v14 = a1[6];
  *(double *)(a3 + 8) = v5 * v4 + v7 * v3 + v9 * v11;
  *(double *)(a3 + 16) = v4 * v13 + v8 * v3 + v10 * v11;
  double v15 = v4 * v14 + v6 * v3;
  double v16 = a1[9];
  double v17 = v15 + v16 * v11;
  double v18 = a2[5];
  double v19 = a2[6];
  *(double *)(a3 + 24) = v17;
  *(double *)(a3 + 32) = v5 * v18 + v7 * v12 + v9 * v19;
  *(double *)(a3 + 40) = v13 * v18 + v8 * v12 + v10 * v19;
  *(double *)(a3 + 48) = v14 * v18 + v6 * v12 + v16 * v19;
  double v20 = a2[7];
  double v21 = a2[8];
  double v22 = v5 * v21 + v7 * v20;
  double v23 = a2[9];
  *(double *)(a3 + 56) = v22 + v9 * v23;
  *(double *)(a3 + 64) = v13 * v21 + v8 * v20 + v10 * v23;
  double result = v14 * v21 + v6 * v20 + v16 * v23;
  *(double *)(a3 + 72) = result;
  return result;
}

double sub_21B6E7EE8@<D0>(double *a1@<X0>, uint64_t a2@<X1>, double *a3@<X2>, uint64_t a4@<X8>, int8x16_t a5@<Q0>, int8x16_t a6@<Q2>)
{
  uint64_t v9 = a2 + 32;
  a5.i64[0] = *(void *)(a2 + 32);
  if (*(double *)a5.i64 <= -3.14159265 || *(double *)a5.i64 > 3.14159265)
  {
    a6.i64[0] = 0x400921FB54442D18;
    v10.f64[0] = NAN;
    v10.f64[1] = NAN;
    int8x16_t v46 = a6;
    int8x16_t v47 = (int8x16_t)vnegq_f64(v10);
    double v45 = *(double *)vbslq_s8(v47, a6, a5).i64;
    *(double *)a5.i64 = fmod(*(double *)a5.i64 + v45, 6.28318531);
    *(void *)&double v11 = vbslq_s8(v47, v46, a5).u64[0];
    if (*(double *)a5.i64 == 0.0) {
      *(double *)a5.i64 = v11;
    }
    else {
      *(double *)a5.i64 = *(double *)a5.i64 - v45;
    }
  }
  double __B = *(double *)a5.i64;
  v70 = &unk_26CB86850;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  double v13 = a3[2];
  double v12 = a3[3];
  double v14 = a3[1];
  *((double *)&v71 + 1) = -v12;
  *(double *)&long long v72 = v13;
  *((double *)&v72 + 1) = v12;
  *((double *)&v73 + 1) = -v14;
  *(double *)&long long v74 = -v13;
  *((double *)&v74 + 1) = v14;
  if (fabs(*(double *)a5.i64 * 0.5) >= 2.22044605e-16)
  {
    LOBYTE(v54) = 0;
    int64x2_t v55 = (int64x2_t)xmmword_21B6FEA60;
    int64x2_t v56 = vdupq_n_s64(1uLL);
    *(void *)&double v57 = v9 - 24;
    *(void *)&long long v58 = v9;
    long long v61 = 0uLL;
    long long v62 = 0uLL;
    long long v63 = 0uLL;
    long long v64 = 0uLL;
    double v65 = 0.0;
    sub_21B6EB4F8((uint64_t *)&v61, &v54);
    sub_21B6EB798((uint64_t)&v61, &__B);
    uint64_t v67 = &unk_26CB86830;
    long long v68 = 0u;
    long long v69 = 0u;
    double v18 = (uint64_t *)*((void *)&v62 + 1);
    double v19 = (uint64_t *)v63;
    if (*((void *)&v62 + 1) != (void)v63)
    {
      double v20 = &v68;
      do
      {
        uint64_t v21 = *v18++;
        *(void *)double v20 = v21;
        double v20 = (long long *)((char *)v20 + 8);
      }
      while (v18 != v19);
    }
    sub_21B6EA254(&v61);
    LOBYTE(v54) = 0;
    int64x2_t v55 = vdupq_n_s64(3uLL);
    int64x2_t v56 = (int64x2_t)xmmword_21B6FEA60;
    *(void *)&double v57 = a1 + 1;
    *(void *)&long long v58 = a1 + 10;
    sub_21B6EA188((uint64_t)&v61, &v54);
    *((double *)&v61 + 1) = *((double *)&v61 + 1) + -1.0;
    *((double *)&v63 + 1) = *((double *)&v63 + 1) + -1.0;
    double v66 = v66 + -1.0;
    long long v54 = &unk_26CB86850;
    v55.i64[0] = 0;
    double v57 = 0.0;
    long long v60 = 0u;
    v55.i64[1] = v69;
    *(double *)v56.i64 = -*((double *)&v68 + 1);
    *(double *)&v56.i64[1] = -*(double *)&v69;
    long long v58 = v68;
    double v59 = -*(double *)&v68;
    long long v48 = &unk_26CB86850;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    cblas_dsyr(CblasColMajor, CblasLower, 3, 1.0, (const double *)&v68, 1, (double *)&v49, 3);
    double v22 = *((double *)&v49 + 1);
    *(double *)&long long v49 = *(double *)&v63 * *(double *)&v55.i64[1]
                    + *((double *)&v61 + 1) * *(double *)v55.i64
                    + *((double *)&v64 + 1) * *(double *)v56.i64
                    + *(double *)&v49;
    *((double *)&v49 + 1) = *((double *)&v49 + 1)
                          + *(double *)&v55.i64[1] * *((double *)&v63 + 1)
                          + *(double *)&v62 * *(double *)v55.i64
                          + v65 * *(double *)v56.i64;
    double v23 = *(double *)&v50;
    *(double *)&long long v50 = *(double *)&v50
                    + *(double *)&v55.i64[1] * *(double *)&v64
                    + *((double *)&v62 + 1) * *(double *)v55.i64
                    + v66 * *(double *)v56.i64;
    *((double *)&v50 + 1) = v22
                          + *(double *)&v63 * v57
                          + *((double *)&v61 + 1) * *(double *)&v56.i64[1]
                          + *((double *)&v64 + 1) * *(double *)&v58;
    double v24 = *((double *)&v51 + 1);
    *(double *)&long long v51 = *((double *)&v63 + 1) * v57
                    + *(double *)&v62 * *(double *)&v56.i64[1]
                    + v65 * *(double *)&v58
                    + *(double *)&v51;
    *((double *)&v51 + 1) = *((double *)&v51 + 1)
                          + *(double *)&v64 * v57
                          + *((double *)&v62 + 1) * *(double *)&v56.i64[1]
                          + v66 * *(double *)&v58;
    *(double *)&long long v52 = v23
                    + *(double *)&v63 * v59
                    + *((double *)&v61 + 1) * *((double *)&v58 + 1)
                    + *((double *)&v64 + 1) * *(double *)&v60;
    *((double *)&v52 + 1) = v24
                          + *((double *)&v63 + 1) * v59
                          + *(double *)&v62 * *((double *)&v58 + 1)
                          + v65 * *(double *)&v60;
    *(double *)&long long v53 = *(double *)&v64 * v59
                    + *((double *)&v62 + 1) * *((double *)&v58 + 1)
                    + v66 * *(double *)&v60
                    + *(double *)&v53;
    double v25 = __B * __B;
    for (uint64_t i = 8; i != 80; i += 8)
      *(double *)((char *)&v48 + i) = *(double *)((char *)&v48 + i) / v25;
    sub_21B6E7E1C(a1, (double *)&v70, a4);
    double v27 = *(double *)(a4 + 8);
    double v28 = *(double *)(a4 + 16);
    double v29 = *(double *)(a4 + 24);
    double v30 = *(double *)(a4 + 32);
    double v31 = *(double *)(a4 + 40);
    double v32 = *(double *)(a4 + 48);
    double v33 = *(double *)(a4 + 56);
    double v34 = *(double *)(a4 + 64);
    double v35 = *(double *)(a4 + 72);
    long long v36 = v49;
    long long v37 = v50;
    double v38 = v31 * *((double *)&v49 + 1) + v28 * *(double *)&v49 + v34 * *(double *)&v50;
    *(double *)(a4 + 8) = v30 * *((double *)&v49 + 1) + v27 * *(double *)&v49 + v33 * *(double *)&v50;
    *(double *)(a4 + 16) = v38;
    long long v39 = v51;
    double v40 = v30 * *(double *)&v51 + v27 * *((double *)&v37 + 1) + v33 * *((double *)&v51 + 1);
    *(double *)(a4 + 24) = v32 * *((double *)&v36 + 1) + v29 * *(double *)&v36 + v35 * *(double *)&v37;
    *(double *)(a4 + 32) = v40;
    *(double *)(a4 + 40) = v31 * *(double *)&v39 + v28 * *((double *)&v37 + 1) + v34 * *((double *)&v39 + 1);
    *(double *)(a4 + 48) = v32 * *(double *)&v39 + v29 * *((double *)&v37 + 1) + v35 * *((double *)&v39 + 1);
    long long v41 = v52;
    double v42 = v30 * *((double *)&v52 + 1) + v27 * *(double *)&v52;
    double v43 = *(double *)&v53;
    double v44 = v31 * *((double *)&v52 + 1) + v28 * *(double *)&v52 + v34 * *(double *)&v53;
    *(double *)(a4 + 56) = v42 + v33 * *(double *)&v53;
    *(double *)(a4 + 64) = v44;
    double result = v32 * *((double *)&v41 + 1) + v29 * *(double *)&v41 + v35 * v43;
    *(double *)(a4 + 72) = result;
  }
  else
  {
    *(void *)a4 = &unk_26CB86850;
    long long v15 = v71;
    *(_OWORD *)(a4 + 24) = v72;
    long long v16 = v74;
    *(_OWORD *)(a4 + 40) = v73;
    *(_OWORD *)(a4 + 56) = v16;
    double result = *(double *)&v75;
    *(_OWORD *)(a4 + 72) = v75;
    *(_OWORD *)(a4 + 8) = v15;
  }
  return result;
}

double sub_21B6E83C8(uint64_t a1, double *a2, double *a3, uint64_t a4, uint64_t a5, int a6)
{
  double v12 = (double *)(a1 + 56);
  sub_21B6E70C8((uint64_t)&v54, a1 + 56, a2);
  *(_OWORD *)(a4 + 8) = v55;
  v13.i64[0] = v56;
  *(_OWORD *)(a4 + 24) = v56;
  if (a6)
  {
    long long v54 = &unk_26CB86850;
    long long v14 = *(_OWORD *)(a1 + 64);
    long long v56 = *(_OWORD *)(a1 + 80);
    long long v15 = *(_OWORD *)(a1 + 112);
    long long v57 = *(_OWORD *)(a1 + 96);
    long long v58 = v15;
    long long v59 = *(_OWORD *)(a1 + 128);
    long long v55 = v14;
    sub_21B6E7E1C(v12, a3, (uint64_t)&v48);
    int64x2_t v16 = __B;
    *(_OWORD *)(a5 + 24) = v50;
    long long v17 = v52;
    *(_OWORD *)(a5 + 40) = v51;
    *(_OWORD *)(a5 + 56) = v17;
    *(_OWORD *)(a5 + 72) = v53;
    *(int64x2_t *)(a5 + 8) = v16;
    LOBYTE(v48) = 1;
    int64x2_t __B = vdupq_n_s64(3uLL);
    long long v50 = xmmword_21B6FEA60;
    *(void *)&long long v51 = a1 + 64;
    *((void *)&v51 + 1) = a1 + 136;
    *(double *)v13.i64 = sub_21B6EB29C((double *)a5, &v48);
    if (!*(unsigned char *)a1)
    {
      sub_21B6E7EE8(v12, a1 + 144, a2, (uint64_t)&v48, v13, v18);
      sub_21B6EB144(v38, 3, 3);
      cblas_dgemm(CblasColMajor, CblasNoTrans, CblasTrans, 3, 3, 3, 1.0, (const double *)(a1 + 240), 6, (const double *)__B.i64, 3, 0.0, __C, __ldc);
      double v42 = &unk_26CB86850;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      double v19 = __C;
      double v20 = v41;
      if (__C != v41)
      {
        uint64_t v21 = &v43;
        do
        {
          uint64_t v22 = *(void *)v19++;
          *(void *)uint64_t v21 = v22;
          uint64_t v21 = (long long *)((char *)v21 + 8);
        }
        while (v19 != v20);
      }
      sub_21B6EA254(v38);
      double v23 = *((double *)&v43 + 1);
      v13.i64[0] = v43;
      long long v24 = v50;
      int64x2_t v25 = __B;
      long long v26 = v52;
      long long v27 = v44;
      long long v28 = v51;
      double v29 = *(double *)(a5 + 16)
          + *((double *)&v43 + 1) * *(double *)&v51
          + *(double *)&__B.i64[1] * *(double *)&v43
          + *((double *)&v52 + 1) * *(double *)&v44;
      *(double *)(a5 + 8) = *((double *)&v50 + 1) * *((double *)&v43 + 1)
                          + *(double *)__B.i64 * *(double *)&v43
                          + *(double *)&v52 * *(double *)&v44
                          + *(double *)(a5 + 8);
      *(double *)(a5 + 16) = v29;
      *(double *)v13.i64 = v23 * *((double *)&v28 + 1) + *(double *)&v24 * *(double *)v13.i64;
      double v30 = *(double *)&v53;
      long long v31 = v45;
      double v32 = *(double *)(a5 + 32)
          + *((double *)&v24 + 1) * *(double *)&v45
          + *(double *)v25.i64 * *((double *)&v27 + 1)
          + *(double *)&v26 * *((double *)&v45 + 1);
      *(double *)(a5 + 24) = *(double *)(a5 + 24) + *(double *)v13.i64 + *(double *)&v53 * *(double *)&v27;
      *(double *)(a5 + 32) = v32;
      double v33 = *(double *)(a5 + 48);
      *(double *)(a5 + 40) = *(double *)&v28 * *(double *)&v31
                           + *(double *)&v25.i64[1] * *((double *)&v27 + 1)
                           + *((double *)&v26 + 1) * *((double *)&v31 + 1)
                           + *(double *)(a5 + 40);
      *(double *)(a5 + 48) = *((double *)&v28 + 1) * *(double *)&v31
                           + *(double *)&v24 * *((double *)&v27 + 1)
                           + v30 * *((double *)&v31 + 1)
                           + v33;
      double v34 = *((double *)&v46 + 1);
      v13.i64[0] = v46;
      double v35 = *(double *)&v47;
      double v36 = *(double *)&v28 * *((double *)&v46 + 1)
          + *(double *)&v25.i64[1] * *(double *)&v46
          + *((double *)&v26 + 1) * *(double *)&v47
          + *(double *)(a5 + 64);
      *(double *)(a5 + 56) = *(double *)(a5 + 56)
                           + *((double *)&v24 + 1) * *((double *)&v46 + 1)
                           + *(double *)v25.i64 * *(double *)&v46
                           + *(double *)&v26 * *(double *)&v47;
      *(double *)(a5 + 64) = v36;
      *(double *)v13.i64 = *((double *)&v28 + 1) * v34
                         + *(double *)&v24 * *(double *)v13.i64
                         + v30 * v35
                         + *(double *)(a5 + 72);
      *(void *)(a5 + 72) = v13.i64[0];
    }
  }
  return *(double *)v13.i64;
}

void sub_21B6E86AC(uint64_t a1, double *a2, double a3)
{
  *(void *)a1 = &unk_26CB868D0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(void *)(a1 + 104) = 0;
  double v5 = a2[4];
  double v6 = v5 * 0.5;
  if (v5 * 0.5 == 0.0)
  {
    *(_OWORD *)(a1 + 64) = 0uLL;
    *(_OWORD *)(a1 + 80) = 0uLL;
    *(_OWORD *)(a1 + 32) = 0uLL;
    *(_OWORD *)(a1 + 48) = 0uLL;
    *(_OWORD *)(a1 + 16) = 0uLL;
    *(void *)(a1 + 88) = 0xBFE0000000000000;
    *(void *)(a1 + 96) = 0;
    *(void *)(a1 + 48) = 0xBFE0000000000000;
    *(void *)(a1 + 8) = 0xBFE0000000000000;
  }
  else
  {
    if (fabs(v6) >= 2.22044605e-16)
    {
      __double2 v11 = __sincos_stret(v6);
      double v10 = v11.__sinval / v5;
      double v9 = v11.__sinval / v5 + v11.__cosval * -0.5;
      double v8 = v11.__sinval * 0.5;
    }
    else
    {
      double v8 = v5 * 0.25;
      double v9 = v8 * v8;
      double v10 = 0.5;
    }
    double v12 = a2[1];
    double v13 = a2[2];
    double v14 = v9 * (v12 * v13);
    *(double *)(a1 + 8) = -(v10 - v12 * v12 * v9);
    *(double *)(a1 + 16) = v14;
    double v15 = a2[3];
    double v16 = v9 * (v12 * v15);
    *(double *)(a1 + 24) = v16;
    *(double *)(a1 + 32) = -(v12 * v8);
    *(double *)(a1 + 40) = v14;
    *(double *)(a1 + 48) = -(v10 - v13 * v13 * v9);
    double v17 = v9 * (v13 * v15);
    *(double *)(a1 + 56) = v17;
    *(double *)(a1 + 64) = -(v13 * v8);
    *(double *)(a1 + 72) = v16;
    *(double *)(a1 + 80) = v17;
    *(double *)(a1 + 88) = -(v10 - v15 * v15 * v9);
    *(double *)(a1 + 96) = -(v15 * v8);
  }
  if (a3 < 0.0)
  {
    for (uint64_t i = 8; i != 104; i += 16)
      *(float64x2_t *)(a1 + i) = vnegq_f64(*(float64x2_t *)(a1 + i));
  }
}

void sub_21B6E8810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = &unk_26CB86850;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, 3, 3, 4, 1.0, (const double *)(a2 + 8), 3, (const double *)(a3 + 8), 4, 0.0, (double *)(a1 + 8), 3);
}

void sub_21B6E88AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = &unk_26CB86870;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(void *)(a1 + 104) = 0;
  *(_OWORD *)(a1 + 8) = 0u;
  cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, 3, 4, 4, 1.0, (const double *)(a2 + 8), 3, (const double *)(a3 + 8), 4, 0.0, (double *)(a1 + 8), 3);
}

void sub_21B6E8954(void *a1@<X0>, unsigned char *a2@<X1>, char *a3@<X8>)
{
  *a2 = 1;
  if (a1 && [a1 inertialState] && objc_msgSend(a1, "inertialCovariance"))
  {
    [a1 inertialStateInfo];
    [a1 inertialCovarianceInfo];
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a1, "inertialState"), "length");
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a1, "inertialCovariance"), "length");
    if (v67 == 21
      && (v6 & 0xFFFFFFFFFFFFFFF8) == 0xA8
      && v69 == 9
      && !v68
      && v73 == 3
      && v72 == 18
      && v71 == 3
      && v70 == 12
      && v60 == 225
      && (v7 & 0xFFFFFFFFFFFFFFF8) == 0x708
      && v62 == 3
      && !v61
      && v66 == 3
      && v65 == 12
      && v64 == 3
      && v63 == 6)
    {
      [a1 cameraPose];
      long long v23 = v8;
      long long v24 = v9;
      long long v25 = v10;
      long long v26 = v11;
      uint64_t v12 = objc_msgSend((id)objc_msgSend(a1, "inertialState"), "bytes");
      uint64_t v13 = objc_msgSend((id)objc_msgSend(a1, "inertialCovariance"), "bytes");
      sub_21B6EA464((uint64_t)a3);
      *(_DWORD *)a3 = [a1 trackingState];
      [a1 originTimestamp];
      *((void *)a3 + 2) = v14;
      [a1 timestamp];
      *((void *)a3 + 5) = v15;
      long long v43 = 0u;
      long long v42 = 0u;
      *(void *)&v41[1] = &unk_26CB86970;
      uint64_t v44 = 0;
      long long v45 = &unk_26CB86850;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v51 = &unk_26CB868B0;
      uint64_t v54 = 0;
      long long v55 = &unk_26CB86830;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = &unk_26CB86950;
      memset(v59, 0, sizeof(v59));
      LOBYTE(v41[0]) = 0;
      LOBYTE(v34) = 0;
      int64x2_t v27 = vdupq_n_s64(3uLL);
      int64x2_t v35 = v27;
      long long v36 = xmmword_21B6FEA80;
      long long v37 = (void *)v12;
      double v38 = (void *)(v12 + 72);
      sub_21B6EA188((uint64_t)v39, &v34);
      sub_21B6E659C(v41, (uint64_t)v39);
      long long v56 = *(_OWORD *)(v12 + 144);
      *(void *)&long long v57 = *(void *)(v12 + 160);
      LOBYTE(v39[0]) = 0;
      *(int64x2_t *)((char *)v39 + 8) = v27;
      *(_OWORD *)((char *)&v39[1] + 8) = xmmword_21B6FEA90;
      *((void *)&v39[2] + 1) = v13;
      *(void *)&v40[0] = v13 + 264;
      LOBYTE(v34) = 1;
      int64x2_t v35 = v27;
      long long v36 = xmmword_21B6FEAA0;
      long long v37 = v59;
      double v38 = &v59[15];
      sub_21B6EB7D0(&v34, v39);
      double __B = -1.0;
      LOBYTE(v34) = 0;
      int64x2_t v35 = v27;
      long long v36 = xmmword_21B6FEA90;
      long long v37 = (void *)(v13 + 96);
      double v38 = (void *)(v13 + 360);
      memset(v39, 0, sizeof(v39));
      memset(v40, 0, 24);
      sub_21B6EB4F8((uint64_t *)v39, &v34);
      sub_21B6EB798((uint64_t)v39, &__B);
      LOBYTE(v28) = 1;
      int64x2_t v29 = v27;
      long long v30 = xmmword_21B6FEAA0;
      long long v31 = &v59[18];
      double v32 = &v59[33];
      sub_21B6EB92C(&v28, (uint64_t *)v39);
      sub_21B6EA254(v39);
      double __B = -1.0;
      LOBYTE(v34) = 0;
      int64x2_t v35 = v27;
      long long v36 = xmmword_21B6FEA90;
      long long v37 = (void *)(v13 + 1440);
      double v38 = (void *)(v13 + 1704);
      memset(v39, 0, sizeof(v39));
      memset(v40, 0, 24);
      sub_21B6EB4F8((uint64_t *)v39, &v34);
      sub_21B6EB798((uint64_t)v39, &__B);
      LOBYTE(v28) = 1;
      int64x2_t v29 = v27;
      long long v30 = xmmword_21B6FEAA0;
      long long v31 = &v59[3];
      double v32 = &v59[18];
      sub_21B6EB92C(&v28, (uint64_t *)v39);
      sub_21B6EA254(v39);
      LOBYTE(v39[0]) = 0;
      *(int64x2_t *)((char *)v39 + 8) = v27;
      *(_OWORD *)((char *)&v39[1] + 8) = xmmword_21B6FEA90;
      *((void *)&v39[2] + 1) = v13 + 1536;
      *(void *)&v40[0] = v13 + 1800;
      LOBYTE(v34) = 1;
      int64x2_t v35 = v27;
      long long v36 = xmmword_21B6FEAA0;
      long long v37 = &v59[21];
      double v38 = &v59[36];
      sub_21B6EB7D0(&v34, v39);
      uint64_t v16 = (uint64_t)(a3 + 592);
      *(void *)&v39[0] = &unk_26CB86850;
      *(float64x2_t *)((char *)v39 + 8) = vcvtq_f64_f32(*(float32x2_t *)&v23);
      v39[2] = vcvtq_f64_f32(*(float32x2_t *)&v24);
      *((double *)&v39[1] + 1) = *((float *)&v23 + 2);
      v40[0] = *((float *)&v24 + 2);
      *(float64x2_t *)&v40[1] = vcvtq_f64_f32(*(float32x2_t *)&v25);
      v40[3] = *((float *)&v25 + 2);
      v40[4] = 0.0;
      sub_21B6E659C((double *)a3 + 74, (uint64_t)v39);
      *(float64x2_t *)((char *)v39 + 8) = vcvtq_f64_f32(*(float32x2_t *)&v26);
      *((double *)&v39[1] + 1) = *((float *)&v26 + 2);
      *(void *)&v39[2] = 0;
      *(_OWORD *)(a3 + 792) = *(_OWORD *)((char *)v39 + 8);
      *(_OWORD *)(a3 + 808) = *(_OWORD *)((char *)&v39[1] + 8);
      sub_21B6E72BC((uint64_t)(a3 + 592), (uint64_t)v41, 0);
      sub_21B6E6C8C((uint64_t)(a3 + 592));
      a3[56] = LOBYTE(v41[0]);
      uint64_t v17 = (uint64_t)(a3 + 56);
      long long v18 = v43;
      *(_OWORD *)(v17 + 16) = v42;
      *(_OWORD *)(v17 + 32) = v18;
      *(void *)(v17 + 48) = v44;
      long long v19 = v49;
      *(_OWORD *)(v17 + 96) = v48;
      *(_OWORD *)(v17 + 112) = v19;
      *(_OWORD *)(v17 + 128) = v50;
      long long v20 = v47;
      *(_OWORD *)(v17 + 64) = v46;
      *(_OWORD *)(v17 + 80) = v20;
      long long v21 = v52;
      long long v22 = v53;
      *(void *)(v17 + 184) = v54;
      *(_OWORD *)(v17 + 168) = v22;
      *(_OWORD *)(v17 + 152) = v21;
      *(_OWORD *)(v17 + 216) = v57;
      *(_OWORD *)(v17 + 200) = v56;
      memcpy((void *)(v17 + 240), v59, 0x128uLL);
      sub_21B6E72BC(v17, v16, 1);
      *(void *)(v17 + 1080) = *(void *)(v12 + 96);
      *(void *)(v17 + 1088) = *(void *)(v12 + 104);
      *(void *)(v17 + 1096) = *(void *)(v12 + 112);
      LOBYTE(v39[0]) = 0;
      *(int64x2_t *)((char *)v39 + 8) = v27;
      *(_OWORD *)((char *)&v39[1] + 8) = xmmword_21B6FEA90;
      *((void *)&v39[2] + 1) = v13 + 768;
      *(void *)&v40[0] = v13 + 1032;
      sub_21B6E9088(v17 + 1112, v39);
      *(unsigned char *)(v17 + 1200) = 0;
      *(unsigned char *)(v17 + 1344) = 0;
      *(unsigned char *)(v17 + 1368) = 0;
      *a2 = 0;
    }
    else
    {
      bzero(a3, 0x598uLL);
      sub_21B6EA464((uint64_t)a3);
    }
  }
  else
  {
    bzero(a3, 0x598uLL);
    sub_21B6EA464((uint64_t)a3);
  }
}

double sub_21B6E9088(uint64_t a1, void *a2)
{
  uint64_t v2 = a2[3];
  uint64_t v3 = a2[4];
  double v4 = (void *)a2[5];
  *(void *)(a1 + 8) = *v4;
  *(void *)(a1 + 16) = v4[v2];
  *(void *)(a1 + 24) = v4[2 * v2];
  *(void *)(a1 + 32) = v4[v3];
  *(void *)(a1 + 40) = v4[v3 + v2];
  *(void *)(a1 + 48) = v4[2 * v2 + v3];
  *(void *)(a1 + 56) = v4[2 * v3];
  *(void *)(a1 + 64) = v4[2 * v3 + v2];
  double result = *(double *)&v4[2 * v3 + 2 * v2];
  *(double *)(a1 + 72) = result;
  return result;
}

BOOL sub_21B6E90F8(uint64_t a1)
{
  *(unsigned char *)(a1 + 1144) = 0;
  v14[9] = &unk_26CB86830;
  long long v15 = 0u;
  long long v16 = 0u;
  char v9 = 0;
  uint64_t v12 = 0x300000003;
  long long v11 = xmmword_21B6FEAB0;
  long long v10 = &unk_26CB869C0;
  uint64_t v13 = v14;
  uint64_t v8 = MEMORY[0x263F36888] + 16;
  if (cnnavigation::ECEFToENU())
  {
    BOOL v1 = 0;
  }
  else
  {
    uint64_t v5 = 0x300000003;
    long long v4 = xmmword_21B6FEAB0;
    uint64_t v3 = &unk_26CB869C0;
    uint64_t v6 = &v7;
    BOOL v1 = v9 != 0;
  }
  cnnavigation::ECEFToENUJacobian::~ECEFToENUJacobian((cnnavigation::ECEFToENUJacobian *)&v8);
  return v1;
}

void *sub_21B6E9540(void *result)
{
  *double result = &unk_26CB86990;
  return result;
}

void sub_21B6E9560(void *a1@<X0>, unsigned char *a2@<X1>, uint64_t a3@<X8>)
{
  *a2 = 1;
  if (a1)
  {
    [a1 transform];
    [a1 covariance];
    uint64_t v6 = 0;
    uint64_t v54 = &unk_26CB86850;
    uint64_t v7 = v55;
    memset(v55, 0, sizeof(v55));
    long long v51 = &unk_26CB86830;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v9 = v57;
    long long v8 = v58;
    do
    {
      uint64_t v10 = 0;
      long long v11 = (long long *)&v56[32 * v6 + 144];
      long long v13 = *v11;
      long long v12 = v11[1];
      do
      {
        v32[0] = v13;
        v32[1] = v12;
        *(void *)&v7[8 * v10] = *((void *)v32 + (v10 & 3));
        ++v10;
      }
      while (v10 != 3);
      v31[0] = v9;
      v31[1] = v8;
      *((void *)&v52 + v6) = *((void *)v31 + (v6 & 3));
      ++v6;
      v7 += 24;
    }
    while (v6 != 3);
    v48[1] = &unk_26CB86830;
    long long v49 = 0u;
    long long v50 = 0u;
    if (cnnavigation::ECEFToLLA())
    {
      bzero((void *)a3, 0x6C0uLL);
      sub_21B6EA688(a3);
    }
    else
    {
      uint64_t v14 = 0;
      long long v15 = &v45;
      memset(v46, 0, sizeof(v46));
      memset(v47, 0, sizeof(v47));
      long long v16 = (float *)v56;
      long long v45 = &unk_26CB86950;
      v48[0] = 0;
      do
      {
        uint64_t v17 = v16;
        for (uint64_t i = 1; i != 7; ++i)
        {
          float v19 = *v17;
          v17 += 6;
          *(double *)&v15[i] = v19;
        }
        ++v14;
        v15 += 6;
        ++v16;
      }
      while (v14 != 6);
      objc_msgSend(a1, "timestamp", sub_21B6EA688(a3));
      *(unsigned char *)(a3 + 24) = 0;
      *(void *)(a3 + 8) = v20;
      sub_21B6E659C((double *)(a3 + 24), (uint64_t)&v54);
      long long v21 = v53;
      *(_OWORD *)(a3 + 224) = v52;
      *(_OWORD *)(a3 + 240) = v21;
      LOBYTE(v40) = 1;
      int64x2_t v30 = vdupq_n_s64(3uLL);
      int64x2_t v41 = v30;
      long long v42 = xmmword_21B6FEAA0;
      long long v43 = (char *)&v47[1] + 8;
      uint64_t v44 = (char *)v48;
      LOBYTE(v33) = 1;
      long long v34 = (__int128)v30;
      long long v35 = xmmword_21B6FEAA0;
      *(void *)&long long v36 = a3 + 264;
      *((void *)&v36 + 1) = a3 + 384;
      sub_21B6EB7D0(&v33, &v40);
      LOBYTE(v40) = 1;
      int64x2_t v41 = v30;
      long long v42 = xmmword_21B6FEAA0;
      long long v43 = (char *)&v46[1] + 8;
      uint64_t v44 = (char *)v47;
      LOBYTE(v33) = 1;
      long long v34 = (__int128)v30;
      long long v35 = xmmword_21B6FEAA0;
      *(void *)&long long v36 = a3 + 408;
      *((void *)&v36 + 1) = a3 + 528;
      sub_21B6EB7D0(&v33, &v40);
      LOBYTE(v40) = 1;
      int64x2_t v41 = v30;
      long long v42 = xmmword_21B6FEAA0;
      long long v43 = (char *)v47;
      uint64_t v44 = (char *)&v47[7] + 8;
      LOBYTE(v33) = 1;
      long long v34 = (__int128)v30;
      long long v35 = xmmword_21B6FEAA0;
      *(void *)&long long v36 = a3 + 288;
      *((void *)&v36 + 1) = a3 + 408;
      sub_21B6EB7D0(&v33, &v40);
      LOBYTE(v40) = 1;
      int64x2_t v41 = v30;
      long long v42 = xmmword_21B6FEAA0;
      long long v43 = (char *)v46;
      uint64_t v44 = (char *)&v46[7] + 8;
      LOBYTE(v33) = 1;
      long long v34 = (__int128)v30;
      long long v35 = xmmword_21B6FEAA0;
      *(void *)&long long v36 = a3 + 432;
      *((void *)&v36 + 1) = a3 + 552;
      sub_21B6EB7D0(&v33, &v40);
      long long v22 = v50;
      *(_OWORD *)(a3 + 1104) = v49;
      *(_OWORD *)(a3 + 1120) = v22;
      [a1 confidence];
      *(double *)(a3 + 1136) = v23;
      *(unsigned char *)(a3 + 1144) = 0;
      sub_21B6EA9E0((uint64_t)&v40, 1);
      double v33 = &unk_26CB86850;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      long long v34 = xmmword_21B6FEAC0;
      long long v35 = *(_OWORD *)algn_21B6FEAD0;
      long long v36 = xmmword_21B6FEAE0;
      long long v37 = unk_21B6FEAF0;
      sub_21B6E659C((double *)&v40, (uint64_t)&v33);
      *(unsigned char *)(a3 + 560) = *(unsigned char *)(a3 + 24);
      long long v24 = *(_OWORD *)(a3 + 56);
      *(_OWORD *)(a3 + 576) = *(_OWORD *)(a3 + 40);
      *(_OWORD *)(a3 + 592) = v24;
      *(void *)(a3 + 608) = *(void *)(a3 + 72);
      long long v25 = *(_OWORD *)(a3 + 104);
      long long v26 = *(_OWORD *)(a3 + 136);
      *(_OWORD *)(a3 + 656) = *(_OWORD *)(a3 + 120);
      *(_OWORD *)(a3 + 672) = v26;
      *(_OWORD *)(a3 + 688) = *(_OWORD *)(a3 + 152);
      *(_OWORD *)(a3 + 624) = *(_OWORD *)(a3 + 88);
      *(_OWORD *)(a3 + 640) = v25;
      long long v27 = *(_OWORD *)(a3 + 176);
      long long v28 = *(_OWORD *)(a3 + 192);
      *(void *)(a3 + 744) = *(void *)(a3 + 208);
      *(_OWORD *)(a3 + 728) = v28;
      *(_OWORD *)(a3 + 712) = v27;
      long long v29 = *(_OWORD *)(a3 + 240);
      *(_OWORD *)(a3 + 760) = *(_OWORD *)(a3 + 224);
      *(_OWORD *)(a3 + 776) = v29;
      memcpy((void *)(a3 + 800), (const void *)(a3 + 264), 0x128uLL);
      sub_21B6E72BC(a3 + 560, (uint64_t)&v40, 1);
      *a2 = 0;
    }
  }
  else
  {
    bzero((void *)a3, 0x6C0uLL);
    sub_21B6EA688(a3);
  }
}

void sub_21B6E9A24(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  *a3 = 1;
  __n128 v8 = sub_21B6EAB50((uint64_t)&v33);
  int v33 = *(_DWORD *)(a1 + 96);
  uint64_t v9 = *(void *)(a2 + 32);
  v10.i64[0] = *(void *)(a2 + 344);
  uint64_t v34 = *(void *)(a1 + 76);
  uint64_t v35 = v9;
  uint64_t v36 = v10.i64[0];
  double v11 = *(double *)(a1 + 36);
  if (v11 <= 0.0)
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB869E0);
    }
    uint64_t v14 = qword_267C5A9E0;
    double v11 = -1.0;
    double v15 = 0.0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B6E4000, v14, OS_LOG_TYPE_DEBUG, "CLVLFT,convertAltitudeMslToWgs84,altitudeMsl unavailable", buf, 2u);
    }
  }
  else
  {
    double v12 = *(double *)(a1 + 28);
    if (*(_DWORD *)(a2 + 312) != -1)
    {
      float v13 = *(float *)(a2 + 316);
LABEL_14:
      double v15 = v12 + v13;
      goto LABEL_15;
    }
    float v45 = 0.0;
    if (sub_21B6FBCE8(&v45, *(double *)(a1 + 4), *(double *)(a1 + 12)))
    {
      float v13 = v45;
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB869E0);
      }
      long long v16 = qword_267C5A9E0;
      if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134283521;
        double v47 = v45;
        _os_log_impl(&dword_21B6E4000, v16, OS_LOG_TYPE_DEBUG, "CLVLFT,convertAltitudeMslToWgs84,DEM unavailable,using DMA und,%{private}f", buf, 0xCu);
      }
      double v11 = *(double *)(a1 + 36);
      goto LABEL_14;
    }
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB869E0);
    }
    long long v28 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B6E4000, v28, OS_LOG_TYPE_DEBUG, "CLVLFT,convertAltitudeMslToWgs84,DMA unavailable,Failed to convert altitude", buf, 2u);
    }
    double v11 = -1.0;
    double v15 = 0.0;
  }
LABEL_15:
  double v38 = v15;
  double v40 = v11;
  double v17 = *(double *)(a1 + 20);
  if (v17 >= 0.0)
  {
    float64x2_t v37 = vmulq_f64(*(float64x2_t *)(a1 + 4), (float64x2_t)vdupq_n_s64(0x3F91DF46A2529D39uLL));
    unint64_t v39 = *(void *)&v17;
    if (cnnavigation::LLAToECEF())
    {
      *(void *)(a4 + 352) = 0;
      *(_OWORD *)(a4 + 320) = 0u;
      *(_OWORD *)(a4 + 336) = 0u;
      *(_OWORD *)(a4 + 288) = 0u;
      *(_OWORD *)(a4 + 304) = 0u;
      *(_OWORD *)(a4 + 256) = 0u;
      *(_OWORD *)(a4 + 272) = 0u;
      *(_OWORD *)(a4 + 224) = 0u;
      *(_OWORD *)(a4 + 240) = 0u;
      *(_OWORD *)(a4 + 192) = 0u;
      *(_OWORD *)(a4 + 208) = 0u;
      *(_OWORD *)(a4 + 160) = 0u;
      *(_OWORD *)(a4 + 176) = 0u;
      *(_OWORD *)(a4 + 128) = 0u;
      *(_OWORD *)(a4 + 144) = 0u;
      *(_OWORD *)(a4 + 96) = 0u;
      *(_OWORD *)(a4 + 112) = 0u;
      *(_OWORD *)(a4 + 64) = 0u;
      *(_OWORD *)(a4 + 80) = 0u;
      *(_OWORD *)(a4 + 32) = 0u;
      *(_OWORD *)(a4 + 48) = 0u;
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
      sub_21B6EAB50(a4);
      return;
    }
  }
  else
  {
    float64x2_t v37 = 0uLL;
    unint64_t v39 = 0xBFF0000000000000;
  }
  double v18 = *(double *)(a1 + 68);
  __asm { FMOV            V3.2D, #-1.0 }
  if (_NF || (double v24 = *(double *)(a1 + 60), v24 < 0.0))
  {
    long long v41 = _Q3;
  }
  else
  {
    v8.n128_f64[0] = v24 * -0.0174532925 + 1.57079633;
    if (v8.n128_f64[0] <= -3.14159265 || v8.n128_f64[0] > 3.14159265)
    {
      v10.i64[0] = 0x400921FB54442D18;
      v25.f64[0] = NAN;
      v25.f64[1] = NAN;
      int8x16_t v30 = v10;
      int8x16_t v31 = (int8x16_t)vnegq_f64(v25);
      double v29 = *(double *)vbslq_s8(v31, v10, (int8x16_t)v8).i64;
      long long v32 = _Q3;
      v8.n128_f64[0] = fmod(v8.n128_f64[0] + v29, 6.28318531);
      _Q3 = v32;
      *(void *)&double v26 = vbslq_s8(v31, v30, (int8x16_t)v8).u64[0];
      if (v8.n128_f64[0] == 0.0) {
        v8.n128_f64[0] = v26;
      }
      else {
        v8.n128_f64[0] = v8.n128_f64[0] - v29;
      }
    }
    *(void *)&long long v41 = v8.n128_u64[0];
    *((double *)&v41 + 1) = v18 * 0.0174532925;
  }
  double v27 = *(double *)(a1 + 52);
  if (v27 >= 0.0 && *(double *)(a1 + 44) >= 0.0)
  {
    *(void *)&long long v42 = *(void *)(a1 + 44);
    *((double *)&v42 + 1) = v27;
  }
  else
  {
    long long v42 = _Q3;
  }
  char v43 = 0;
  char v44 = 0;
  *a3 = 0;
  sub_21B6EAC40(a4, (uint64_t)&v33);
}

void sub_21B6E9E0C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_21B6E6194(a1);
  }
  _Unwind_Resume(a1);
}

void sub_21B6E9E1C(uint64_t a1@<X0>, unsigned char *a2@<X1>, uint64_t a3@<X8>)
{
  *a2 = 1;
  sub_21B6EAB50(a3);
  *(_DWORD *)a3 = 1;
  *(_OWORD *)(a3 + 8) = *(_OWORD *)a1;
  *(void *)(a3 + 24) = *(void *)(a1 + 16);
  *(_OWORD *)(a3 + 40) = *(_OWORD *)(a1 + 1104);
  *(_OWORD *)(a3 + 56) = *(_OWORD *)(a1 + 1120);
  long long v6 = *(_OWORD *)(a1 + 776);
  *(_OWORD *)(a3 + 80) = *(_OWORD *)(a1 + 760);
  *(_OWORD *)(a3 + 96) = v6;
  if (*(unsigned char *)(a1 + 1144))
  {
    LOBYTE(v16) = 0;
    int64x2_t v17 = vdupq_n_s64(3uLL);
    long long v18 = xmmword_21B6FEAA0;
    uint64_t v19 = a1 + 1600;
    uint64_t v20 = a1 + 1720;
    double v7 = *(double *)(a1 + 1600);
    if ((*(void *)&v7 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
      || v7 < 0.0
      || (double v8 = *(double *)(a1 + 1656), (*(void *)&v8 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
      || v8 < 0.0
      || (double v9 = *(double *)(a1 + 1712), (*(void *)&v9 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
      || v9 < 0.0)
    {
      __asm { FMOV            V0.2D, #-1.0 }
      *(_OWORD *)(a3 + 112) = _Q0;
      *(unsigned char *)(a3 + 160) = 0;
    }
    else
    {
      *(double *)(a3 + 112) = sqrt(v7 + v8);
      *(double *)(a3 + 120) = sqrt(v9);
      *(unsigned char *)(a3 + 160) = 1;
      long long v10 = *(_OWORD *)(a1 + 1176);
      *(_OWORD *)(a3 + 176) = *(_OWORD *)(a1 + 1160);
      *(_OWORD *)(a3 + 192) = v10;
      *(_OWORD *)(a3 + 216) = *(_OWORD *)(a1 + 1392);
      *(_OWORD *)(a3 + 232) = *(_OWORD *)(a1 + 1408);
      sub_21B6E9088(a3 + 248, &v16);
    }
  }
  *(unsigned char *)(a3 + 336) = 0;
  *a2 = 0;
}

BOOL sub_21B6E9F78(int a1, double *a2, double *a3, double a4, double a5, float a6)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  *a3 = a4;
  if (a5 > 0.0)
  {
    if (a1 != -1)
    {
      *a3 = a4 - a6;
      return 1;
    }
    float v12 = 0.0;
    if (sub_21B6FBCE8(&v12, *a2, a2[1]))
    {
      *a3 = a4 - v12;
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB869E0);
      }
      double v11 = qword_267C5A9E0;
      if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134283521;
        double v14 = v12;
        _os_log_impl(&dword_21B6E4000, v11, OS_LOG_TYPE_DEBUG, "CLVLFT,convertAltitudeWgs84ToMsl,DEM unavailable,using DMA und,%{private}f", buf, 0xCu);
      }
      return 1;
    }
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB869E0);
    }
    double v9 = qword_267C5A9E0;
    if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    long long v10 = "CLVLFT,convertAltitudeWgs84ToMsl,DMA unavailable,Failed to convert altitude";
LABEL_9:
    _os_log_impl(&dword_21B6E4000, v9, OS_LOG_TYPE_DEBUG, v10, buf, 2u);
    return 0;
  }
  if (qword_267C5A9D8 != -1) {
    dispatch_once(&qword_267C5A9D8, &unk_26CB869E0);
  }
  double v9 = qword_267C5A9E0;
  BOOL result = os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    *(_WORD *)buf = 0;
    long long v10 = "CLVLFT,convertAltitudeWgs84ToMsl,altitudeWgs84 unavailable";
    goto LABEL_9;
  }
  return result;
}

void sub_21B6EA168(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_21B6E6194(a1);
}

void sub_21B6EA174()
{
}

double sub_21B6EA188(uint64_t a1, void *a2)
{
  *(void *)a1 = &unk_26CB86850;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  uint64_t v2 = a2[3];
  uint64_t v3 = a2[4];
  long long v4 = (void *)a2[5];
  *(void *)(a1 + 8) = *v4;
  *(void *)(a1 + 16) = v4[v2];
  *(void *)(a1 + 24) = v4[2 * v2];
  *(void *)(a1 + 32) = v4[v3];
  *(void *)(a1 + 40) = v4[v3 + v2];
  *(void *)(a1 + 48) = v4[2 * v2 + v3];
  *(void *)(a1 + 56) = v4[2 * v3];
  *(void *)(a1 + 64) = v4[2 * v3 + v2];
  double result = *(double *)&v4[2 * v3 + 2 * v2];
  *(double *)(a1 + 72) = result;
  return result;
}

void sub_21B6EA22C()
{
}

void sub_21B6EA240()
{
}

void *sub_21B6EA254(void *a1)
{
  uint64_t v2 = (void *)a1[6];
  if (v2) {
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[3];
  if (v3)
  {
    a1[4] = v3;
    operator delete(v3);
  }
  return a1;
}

uint64_t sub_21B6EA294(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = &unk_26CB868B0;
  long long v3 = *(_OWORD *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(void *)(a1 + 8) = &unk_26CB86970;
  *(void *)(a1 + 48) = v4;
  *(void *)(a1 + 56) = &unk_26CB86850;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  long long v5 = *(_OWORD *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  *(void *)(a1 + 144) = &unk_26CB868B0;
  long long v8 = *(_OWORD *)(a2 + 152);
  uint64_t v9 = *(void *)(a2 + 184);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 152) = v8;
  *(void *)(a1 + 184) = v9;
  *(void *)(a1 + 192) = &unk_26CB86830;
  long long v10 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 200) = v10;
  *(void *)(a1 + 232) = &unk_26CB86950;
  memcpy((void *)(a1 + 240), (const void *)(a2 + 240), 0x128uLL);
  return a1;
}

void sub_21B6EA3D4()
{
}

void sub_21B6EA3EC()
{
}

void sub_21B6EA400()
{
}

void sub_21B6EA414()
{
}

void sub_21B6EA428()
{
}

void sub_21B6EA43C()
{
}

void sub_21B6EA450()
{
}

uint64_t sub_21B6EA464(uint64_t a1)
{
  *(_DWORD *)a1 = 1;
  __asm { FMOV            V0.2D, #-1.0 }
  long long v8 = _Q0;
  *(_OWORD *)(a1 + 8) = _Q0;
  *(_OWORD *)(a1 + 24) = _Q0;
  *(_OWORD *)(a1 + 40) = _Q0;
  *(unsigned char *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(void *)(a1 + 64) = &unk_26CB86970;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = &unk_26CB86850;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(void *)(a1 + 200) = &unk_26CB868B0;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(void *)(a1 + 240) = 0;
  *(void *)(a1 + 248) = &unk_26CB86830;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(void *)(a1 + 288) = &unk_26CB86950;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 440) = 0u;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_OWORD *)(a1 + 488) = 0u;
  *(_OWORD *)(a1 + 504) = 0u;
  *(_OWORD *)(a1 + 520) = 0u;
  *(_OWORD *)(a1 + 536) = 0u;
  *(_OWORD *)(a1 + 552) = 0u;
  *(_OWORD *)(a1 + 568) = 0u;
  *(void *)(a1 + 584) = 0;
  sub_21B6EA9E0(a1 + 592, 1);
  *(void *)(a1 + 1128) = &unk_26CB86830;
  *(_OWORD *)(a1 + 1136) = 0u;
  *(_OWORD *)(a1 + 1152) = 0u;
  *(void *)(a1 + 1168) = &unk_26CB86850;
  *(_OWORD *)(a1 + 1176) = 0u;
  *(_OWORD *)(a1 + 1192) = 0u;
  *(_OWORD *)(a1 + 1208) = 0u;
  *(_OWORD *)(a1 + 1224) = 0u;
  *(_OWORD *)(a1 + 1240) = 0u;
  *(unsigned char *)(a1 + 1256) = 0;
  *(void *)(a1 + 1264) = &unk_26CB86830;
  *(_OWORD *)(a1 + 1272) = 0u;
  *(_OWORD *)(a1 + 1288) = 0u;
  *(void *)(a1 + 1304) = &unk_26CB86850;
  *(_OWORD *)(a1 + 1312) = 0u;
  *(_OWORD *)(a1 + 1328) = 0u;
  *(_OWORD *)(a1 + 1344) = 0u;
  *(_OWORD *)(a1 + 1360) = 0u;
  *(_OWORD *)(a1 + 1376) = 0u;
  *(void *)(a1 + 1392) = 0xBFF0000000000000;
  *(unsigned char *)(a1 + 1400) = 0;
  *(_OWORD *)(a1 + 1408) = v8;
  *(unsigned char *)(a1 + 1424) = 0;
  return a1;
}

double sub_21B6EA688(uint64_t a1)
{
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)a1 = _Q0;
  *(void *)(a1 + 16) = 0xBFF0000000000000;
  *(unsigned char *)(a1 + 24) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(void *)(a1 + 32) = &unk_26CB86970;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = &unk_26CB86850;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(void *)(a1 + 168) = &unk_26CB868B0;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 216) = &unk_26CB86830;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(void *)(a1 + 256) = &unk_26CB86950;
  *(_OWORD *)(a1 + 576) = 0u;
  *(_OWORD *)(a1 + 592) = 0u;
  *(void *)(a1 + 608) = 0;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 440) = 0u;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_OWORD *)(a1 + 488) = 0u;
  *(_OWORD *)(a1 + 504) = 0u;
  *(_OWORD *)(a1 + 520) = 0u;
  *(_OWORD *)(a1 + 536) = 0u;
  *(_OWORD *)(a1 + 545) = 0u;
  *(void *)(a1 + 568) = &unk_26CB86970;
  *(void *)(a1 + 616) = &unk_26CB86850;
  *(_OWORD *)(a1 + 624) = 0u;
  *(_OWORD *)(a1 + 640) = 0u;
  *(_OWORD *)(a1 + 656) = 0u;
  *(_OWORD *)(a1 + 672) = 0u;
  *(_OWORD *)(a1 + 688) = 0u;
  *(void *)(a1 + 704) = &unk_26CB868B0;
  *(_OWORD *)(a1 + 712) = 0u;
  *(_OWORD *)(a1 + 728) = 0u;
  *(void *)(a1 + 744) = 0;
  *(void *)(a1 + 752) = &unk_26CB86830;
  *(_OWORD *)(a1 + 760) = 0u;
  *(_OWORD *)(a1 + 776) = 0u;
  *(void *)(a1 + 792) = &unk_26CB86950;
  *(_OWORD *)(a1 + 800) = 0u;
  *(_OWORD *)(a1 + 816) = 0u;
  *(_OWORD *)(a1 + 832) = 0u;
  *(_OWORD *)(a1 + 848) = 0u;
  *(_OWORD *)(a1 + 864) = 0u;
  *(_OWORD *)(a1 + 880) = 0u;
  *(_OWORD *)(a1 + 896) = 0u;
  *(_OWORD *)(a1 + 912) = 0u;
  *(_OWORD *)(a1 + 928) = 0u;
  *(_OWORD *)(a1 + 944) = 0u;
  *(_OWORD *)(a1 + 960) = 0u;
  *(_OWORD *)(a1 + 976) = 0u;
  *(_OWORD *)(a1 + 992) = 0u;
  *(_OWORD *)(a1 + 1008) = 0u;
  *(_OWORD *)(a1 + 1024) = 0u;
  *(_OWORD *)(a1 + 1040) = 0u;
  *(_OWORD *)(a1 + 1056) = 0u;
  *(_OWORD *)(a1 + 1072) = 0u;
  *(void *)(a1 + 1088) = 0;
  *(void *)(a1 + 1096) = &unk_26CB86830;
  *(_OWORD *)(a1 + 1104) = 0u;
  *(_OWORD *)(a1 + 1120) = 0u;
  *(_OWORD *)(a1 + 1129) = 0u;
  *(void *)(a1 + 1152) = &unk_26CB86830;
  *(_OWORD *)(a1 + 1208) = 0u;
  *(_OWORD *)(a1 + 1224) = 0u;
  *(void *)(a1 + 1240) = 0;
  *(_OWORD *)(a1 + 1160) = 0u;
  *(_OWORD *)(a1 + 1176) = 0u;
  *(unsigned char *)(a1 + 1192) = 0;
  *(void *)(a1 + 1200) = &unk_26CB86970;
  *(void *)(a1 + 1248) = &unk_26CB86850;
  *(_OWORD *)(a1 + 1256) = 0u;
  *(_OWORD *)(a1 + 1272) = 0u;
  *(_OWORD *)(a1 + 1288) = 0u;
  *(_OWORD *)(a1 + 1304) = 0u;
  *(_OWORD *)(a1 + 1320) = 0u;
  *(void *)(a1 + 1336) = &unk_26CB868B0;
  *(_OWORD *)(a1 + 1344) = 0u;
  *(_OWORD *)(a1 + 1360) = 0u;
  *(void *)(a1 + 1376) = 0;
  *(void *)(a1 + 1384) = &unk_26CB86830;
  *(_OWORD *)(a1 + 1392) = 0u;
  *(_OWORD *)(a1 + 1408) = 0u;
  *(void *)(a1 + 1424) = &unk_26CB86950;
  *(_OWORD *)(a1 + 1432) = 0u;
  *(_OWORD *)(a1 + 1448) = 0u;
  *(_OWORD *)(a1 + 1464) = 0u;
  *(_OWORD *)(a1 + 1480) = 0u;
  *(_OWORD *)(a1 + 1496) = 0u;
  *(_OWORD *)(a1 + 1512) = 0u;
  *(_OWORD *)(a1 + 1528) = 0u;
  *(_OWORD *)(a1 + 1544) = 0u;
  *(_OWORD *)(a1 + 1560) = 0u;
  *(_OWORD *)(a1 + 1576) = 0u;
  *(_OWORD *)(a1 + 1592) = 0u;
  *(_OWORD *)(a1 + 1608) = 0u;
  *(_OWORD *)(a1 + 1624) = 0u;
  *(_OWORD *)(a1 + 1640) = 0u;
  *(_OWORD *)(a1 + 1656) = 0u;
  *(_OWORD *)(a1 + 1672) = 0u;
  *(_OWORD *)(a1 + 1688) = 0u;
  *(_OWORD *)(a1 + 1704) = 0u;
  *(void *)(a1 + 1720) = 0;
  return result;
}

uint64_t sub_21B6EA9E0(uint64_t result, int a2)
{
  *(unsigned char *)double result = 0;
  *(_OWORD *)(result + 16) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(void *)(result + 8) = &unk_26CB86970;
  *(void *)(result + 48) = 0;
  *(void *)(result + 56) = &unk_26CB86850;
  *(_OWORD *)(result + 64) = 0u;
  *(_OWORD *)(result + 80) = 0u;
  *(_OWORD *)(result + 96) = 0u;
  *(_OWORD *)(result + 112) = 0u;
  *(_OWORD *)(result + 128) = 0u;
  *(_OWORD *)(result + 152) = 0u;
  *(void *)(result + 144) = &unk_26CB868B0;
  *(_OWORD *)(result + 168) = 0u;
  *(void *)(result + 184) = 0;
  *(void *)(result + 192) = &unk_26CB86830;
  *(_OWORD *)(result + 200) = 0u;
  *(_OWORD *)(result + 216) = 0u;
  *(_OWORD *)(result + 240) = 0u;
  *(void *)(result + 232) = &unk_26CB86950;
  *(_OWORD *)(result + 256) = 0u;
  *(_OWORD *)(result + 272) = 0u;
  *(_OWORD *)(result + 288) = 0u;
  *(_OWORD *)(result + 304) = 0u;
  *(_OWORD *)(result + 320) = 0u;
  *(_OWORD *)(result + 336) = 0u;
  *(_OWORD *)(result + 352) = 0u;
  *(_OWORD *)(result + 368) = 0u;
  *(_OWORD *)(result + 384) = 0u;
  *(_OWORD *)(result + 400) = 0u;
  *(_OWORD *)(result + 416) = 0u;
  *(_OWORD *)(result + 432) = 0u;
  *(_OWORD *)(result + 448) = 0u;
  *(_OWORD *)(result + 464) = 0u;
  *(_OWORD *)(result + 480) = 0u;
  *(_OWORD *)(result + 496) = 0u;
  *(_OWORD *)(result + 512) = 0u;
  *(void *)(result + 528) = 0;
  if (a2)
  {
    *(unsigned char *)double result = 1;
    *(void *)(result + 24) = 0;
    *(void *)(result + 32) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 40) = 0x3FF0000000000000;
    *(_OWORD *)(result + 88) = 0uLL;
    *(_OWORD *)(result + 72) = 0uLL;
    *(_OWORD *)(result + 104) = 0uLL;
    *(void *)(result + 120) = 0;
    *(void *)(result + 128) = 0x3FF0000000000000;
    *(void *)(result + 96) = 0x3FF0000000000000;
    *(void *)(result + 64) = 0x3FF0000000000000;
    *(_OWORD *)(result + 152) = 0uLL;
    *(_OWORD *)(result + 168) = 0uLL;
    *(void *)(result + 208) = 0;
    *(void *)(result + 216) = 0;
    *(void *)(result + 200) = 0;
    *(_OWORD *)(result + 240) = 0uLL;
    *(_OWORD *)(result + 256) = 0uLL;
    *(_OWORD *)(result + 272) = 0uLL;
    *(_OWORD *)(result + 288) = 0uLL;
    *(_OWORD *)(result + 304) = 0uLL;
    *(_OWORD *)(result + 320) = 0uLL;
    *(_OWORD *)(result + 336) = 0uLL;
    *(_OWORD *)(result + 352) = 0uLL;
    *(_OWORD *)(result + 368) = 0uLL;
    *(_OWORD *)(result + 384) = 0uLL;
    *(_OWORD *)(result + 400) = 0uLL;
    *(_OWORD *)(result + 416) = 0uLL;
    *(_OWORD *)(result + 432) = 0uLL;
    *(_OWORD *)(result + 448) = 0uLL;
    *(_OWORD *)(result + 464) = 0uLL;
    *(_OWORD *)(result + 480) = 0uLL;
    *(_OWORD *)(result + 496) = 0uLL;
    *(_OWORD *)(result + 512) = 0uLL;
  }
  return result;
}

__n128 sub_21B6EAB50(uint64_t a1)
{
  *(_DWORD *)a1 = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(__n128 *)(a1 + 8) = result;
  *(void *)(a1 + 24) = 0xBFF0000000000000;
  *(void *)(a1 + 32) = &unk_26CB86830;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(void *)(a1 + 72) = &unk_26CB86830;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(__n128 *)(a1 + 112) = result;
  *(__n128 *)(a1 + 128) = result;
  *(__n128 *)(a1 + 144) = result;
  *(unsigned char *)(a1 + 160) = 0;
  *(void *)(a1 + 168) = &unk_26CB86830;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(void *)(a1 + 208) = &unk_26CB86830;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(void *)(a1 + 248) = &unk_26CB86850;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(unsigned char *)(a1 + 336) = 0;
  *(void *)(a1 + 344) = 0xBFF0000000000000;
  *(void *)(a1 + 352) = 0xBFF0000000000000;
  return result;
}

__n128 sub_21B6EAC40(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  *(void *)(a1 + 32) = &unk_26CB86830;
  long long v3 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v3;
  *(void *)(a1 + 72) = &unk_26CB86830;
  long long v4 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v4;
  long long v5 = *(_OWORD *)(a2 + 112);
  long long v6 = *(_OWORD *)(a2 + 128);
  long long v7 = *(_OWORD *)(a2 + 144);
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(_OWORD *)(a1 + 128) = v6;
  *(_OWORD *)(a1 + 144) = v7;
  *(_OWORD *)(a1 + 112) = v5;
  *(void *)(a1 + 168) = &unk_26CB86830;
  long long v8 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v8;
  *(void *)(a1 + 208) = &unk_26CB86830;
  long long v9 = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 216) = v9;
  *(void *)(a1 + 248) = &unk_26CB86850;
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  long long v10 = *(_OWORD *)(a2 + 272);
  long long v11 = *(_OWORD *)(a2 + 288);
  long long v12 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 320) = v12;
  *(_OWORD *)(a1 + 272) = v10;
  *(_OWORD *)(a1 + 288) = v11;
  __n128 result = *(__n128 *)(a2 + 336);
  *(void *)(a1 + 352) = *(void *)(a2 + 352);
  *(__n128 *)(a1 + 336) = result;
  return result;
}

os_log_t sub_21B6EAD5C()
{
  os_log_t result = os_log_create("com.apple.locationd.Position", "Vision");
  qword_267C5A9E0 = (uint64_t)result;
  return result;
}

void sub_21B6EAD8C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  BOOL v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_21B6EADC0(void *a1)
{
  *a1 = &unk_26CB86990;
  JUMPOUT(0x21D493AF0);
}

uint64_t sub_21B6EADF0(uint64_t result)
{
  *(void *)(result + 32) = result + 40;
  return result;
}

void sub_21B6EADFC(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unsigned int v1 = *(_DWORD *)(a1 + 8);
  if (v1 >= 2)
  {
    unsigned int v3 = *(_DWORD *)(a1 + 12);
    if (v3 >= 2)
    {
      int v4 = v3 + v1 - *(_DWORD *)(a1 + 20);
      if (v4 <= 0) {
        __assert_rtn("TransposeDataFootprint", "cnmatrix.h", 128, "lead_dim > 0");
      }
      int v5 = *(_DWORD *)(a1 + 16);
      bzero(v13, v5);
      if (v5 >= 3)
      {
        uint64_t v6 = (v5 - 1);
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = 1;
        do
        {
          long long v9 = &v13[v8];
          if (!v13[v8])
          {
            uint64_t v10 = *(void *)(v7 + 8 * v8);
            int v11 = v8;
            do
            {
              int v11 = v11 * v4 % (int)v6;
              uint64_t v12 = *(void *)(v7 + 8 * v11);
              *(void *)(v7 + 8 * v11) = v10;
              *long long v9 = 1;
              long long v9 = &v13[v11];
              uint64_t v10 = v12;
            }
            while (!*v9);
          }
          ++v8;
        }
        while (v8 != v6);
      }
    }
  }
}

uint64_t sub_21B6EAF20(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3) {
    __assert_rtn("operator()", "cnmatrixbase.h", 782, "data_ != __null");
  }
  unsigned int v4 = a2 + *(_DWORD *)(a1 + 20) * a3;
  if ((v4 & 0x80000000) != 0) {
    __assert_rtn("operator()", "cnmatrixbase.h", 783, "idx >= 0");
  }
  if ((signed int)v4 >= *(_DWORD *)(a1 + 16)) {
    __assert_rtn("operator()", "cnmatrixbase.h", 784, "idx < num_elements_");
  }
  return v3 + 8 * v4;
}

double sub_21B6EAFB8(double *a1, double *a2)
{
  double v2 = *a1;
  double v3 = a1[4];
  double v4 = a1[8];
  double v5 = *a1 + v3 + v4;
  if (v5 <= 0.0)
  {
    if (v2 > v3)
    {
      BOOL v8 = v2 == v4;
      BOOL v9 = v2 < v4;
    }
    else
    {
      BOOL v8 = 1;
      BOOL v9 = 0;
    }
    if (v9 || v8)
    {
      double v10 = 1.0 - v2;
      if (v3 <= v4)
      {
        double v15 = sqrt(v10 - v3 + v4);
        double v6 = v15 + v15;
        *a2 = (a1[2] + a1[6]) / v6;
        a2[1] = (a1[7] + a1[5]) / v6;
        a2[2] = v6 * 0.25;
        double v13 = a1[3];
        double v14 = a1[1];
      }
      else
      {
        double v11 = sqrt(v10 + v3 - v4);
        double v6 = v11 + v11;
        *a2 = (a1[3] + a1[1]) / v6;
        a2[1] = v6 * 0.25;
        a2[2] = (a1[7] + a1[5]) / v6;
        double v13 = a1[2];
        double v14 = a1[6];
      }
    }
    else
    {
      double v12 = sqrt(v2 + 1.0 - v3 - v4);
      double v6 = v12 + v12;
      *a2 = v6 * 0.25;
      a2[1] = (a1[3] + a1[1]) / v6;
      a2[2] = (a1[2] + a1[6]) / v6;
      double v13 = a1[7];
      double v14 = a1[5];
    }
    double v7 = v13 - v14;
  }
  else
  {
    double v6 = 0.5 / sqrt(v5 + 1.0);
    *a2 = v6 * (a1[7] - a1[5]);
    a2[1] = v6 * (a1[2] - a1[6]);
    a2[2] = v6 * (a1[3] - a1[1]);
    double v7 = 0.25;
  }
  double result = v7 / v6;
  a2[3] = result;
  return result;
}

uint64_t *sub_21B6EB144(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  *a1 = a2;
  a1[1] = a3;
  if (a3 == 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = a2;
  }
  a1[2] = v4;
  sub_21B6EB190(a1 + 3, a3 * a2);
  a1[6] = 0;
  a1[7] = 0;
  a1[8] = 0;
  return a1;
}

void *sub_21B6EB190(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_21B6EB208(a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_21B6EB1EC(_Unwind_Exception *exception_object)
{
  double v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_21B6EB208(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_21B6EB24C();
  }
  double result = (char *)sub_21B6EB264((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void sub_21B6EB24C()
{
}

void *sub_21B6EB264(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_21B6EAD8C();
  }
  return operator new(8 * a2);
}

double sub_21B6EB29C(double *a1, void *a2)
{
  double v3 = a1[1];
  double v2 = a1[2];
  double v4 = a1[3];
  double v5 = a1[4];
  double v7 = a1[5];
  double v6 = a1[6];
  double v9 = a1[7];
  double v8 = a1[8];
  double v10 = a1[9];
  uint64_t v12 = a2[4];
  double v11 = (double *)a2[5];
  uint64_t v13 = a2[3];
  uint64_t v14 = v12 + v13;
  uint64_t v15 = v12 + 2 * v13;
  uint64_t v16 = v13 + 2 * v12;
  a1[1] = v5 * v11[v13] + v3 * *v11 + v9 * v11[2 * v13];
  a1[2] = v7 * v11[v13] + v2 * *v11 + v8 * v11[2 * v13];
  a1[3] = v6 * v11[v13] + v4 * *v11 + v10 * v11[2 * v13];
  a1[4] = v5 * v11[v12 + v13] + v3 * v11[v12] + v9 * v11[v15];
  double v17 = v11[v12 + v13];
  uint64_t v18 = 2 * v12 + 2 * v13;
  a1[5] = v7 * v17 + v2 * v11[v12] + v8 * v11[v15];
  a1[6] = v6 * v11[v14] + v4 * v11[v12] + v10 * v11[v15];
  v12 *= 16;
  a1[7] = v5 * v11[v16] + v3 * *(double *)((char *)v11 + v12) + v9 * v11[v18];
  a1[8] = v7 * v11[v16] + v2 * *(double *)((char *)v11 + v12) + v8 * v11[v18];
  double result = v6 * v11[v16] + v4 * *(double *)((char *)v11 + v12) + v10 * v11[v18];
  a1[9] = result;
  return result;
}

void sub_21B6EB3D4(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = a2[4];
  double v4 = (const double *)a2[5];
  if (v3 == 6)
  {
    vDSP_vaddD((const double *)(a1 + 8), 1, v4, 1, (double *)(a1 + 8), 1, 0x24uLL);
  }
  else
  {
    uint64_t v5 = a2[3];
    if (v5 == 1)
    {
      uint64_t v6 = 8 * v3;
      for (uint64_t i = 8; i != 296; i += 48)
      {
        vDSP_vaddD((const double *)(v2 + i), 1, v4, 1, (double *)(v2 + i), 1, 6uLL);
        double v4 = (const double *)((char *)v4 + v6);
      }
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 8 * v3;
      uint64_t v10 = 8 * v5;
      do
      {
        double v11 = (double *)v4;
        for (uint64_t j = 8; j != 56; j += 8)
        {
          *(double *)(v2 + j) = *(double *)(v2 + j) + *v11;
          double v11 = (double *)((char *)v11 + v10);
        }
        ++v8;
        double v4 = (const double *)((char *)v4 + v9);
        v2 += 48;
      }
      while (v8 != 6);
    }
  }
}

void sub_21B6EB4C4(uint64_t a1, const double *__B)
{
}

void sub_21B6EB4F8(uint64_t *a1, void *a2)
{
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  *a1 = v4;
  a1[1] = v5;
  if (v5 == 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v4;
  }
  a1[2] = v6;
  double v7 = (void **)(a1 + 3);
  sub_21B6EB64C((uint64_t)(a1 + 3), v5 * v4);
  uint64_t v8 = a2[1];
  uint64_t v9 = a2[4];
  if (v8 == v9)
  {
    uint64_t v10 = (unsigned char *)a2[5];
    double v11 = (unsigned char *)a2[6];
    if (v11 != v10)
    {
      uint64_t v12 = *v7;
      memmove(v12, v10, v11 - v10);
    }
  }
  else
  {
    uint64_t v13 = a2[3];
    unint64_t v14 = a1[1];
    if (v13 == 1)
    {
      if (v14)
      {
        for (unint64_t i = 0; i < v14; ++i)
        {
          if (v8)
          {
            memmove((void *)(a1[3] + 8 * a1[2] * i), (const void *)(a2[5] + 8 * a2[4] * i), 8 * v8);
            unint64_t v14 = a1[1];
          }
        }
      }
    }
    else if (v14)
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = *a1;
      uint64_t v19 = 8 * a1[2];
      uint64_t v20 = (void *)a2[5];
      uint64_t v21 = 8 * v9;
      uint64_t v22 = 8 * v13;
      do
      {
        if (v18)
        {
          float v23 = (char *)*v7 + v16;
          double v24 = v20;
          uint64_t v25 = v18;
          do
          {
            *v23++ = *v24;
            double v24 = (void *)((char *)v24 + v22);
            --v25;
          }
          while (v25);
        }
        ++v17;
        v16 += v19;
        uint64_t v20 = (void *)((char *)v20 + v21);
      }
      while (v17 != v14);
    }
  }
}

void sub_21B6EB64C(uint64_t a1, unint64_t a2)
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
    sub_21B6EB67C((char **)a1, a2 - v2);
  }
}

void sub_21B6EB67C(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  double v7 = *(char **)(v4 - 8);
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
      sub_21B6EB24C();
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
      unint64_t v14 = (char *)sub_21B6EB264(v4, v13);
      uint64_t v8 = *a1;
      double v7 = a1[1];
    }
    else
    {
      unint64_t v14 = 0;
    }
    uint64_t v15 = &v14[8 * v11];
    uint64_t v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    uint64_t v17 = &v15[8 * a2];
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

void sub_21B6EB798(uint64_t a1, const double *__B)
{
}

void *sub_21B6EB7D0(void *result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v5 = result[3];
  uint64_t v4 = result[4];
  uint64_t v7 = result[1];
  unint64_t v6 = result[2];
  uint64_t v8 = a2[2];
  uint64_t v9 = a2[3];
  if (v4 == v7)
  {
    BOOL v11 = v5 != v6 || v9 != v8;
    if (a2[4] != a2[1] && v11) {
      goto LABEL_10;
    }
  }
  else if (v5 != v6 || v9 != v8)
  {
LABEL_10:
    if (v5 == 1 && v9 == 1)
    {
      if (v6)
      {
        unint64_t v26 = 0;
        uint64_t v27 = a2[1];
        do
        {
          if (v27)
          {
            double result = memmove((void *)(v3[5] + 8 * v3[4] * v26), (const void *)(a2[5] + 8 * a2[4] * v26), 8 * v27);
            unint64_t v6 = v3[2];
          }
          ++v26;
        }
        while (v26 < v6);
      }
    }
    else if (v6)
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 8 * v4;
      uint64_t v16 = 8 * v5;
      uint64_t v17 = (void *)a2[5];
      uint64_t v18 = 8 * a2[4];
      uint64_t v19 = 8 * v9;
      do
      {
        if (v7)
        {
          uint64_t v20 = (void *)(v3[5] + v13);
          double result = v17;
          uint64_t v21 = v7;
          do
          {
            *uint64_t v20 = *result;
            uint64_t v20 = (void *)((char *)v20 + v16);
            double result = (void *)((char *)result + v19);
            --v21;
          }
          while (v21);
        }
        ++v14;
        v13 += v15;
        uint64_t v17 = (void *)((char *)v17 + v18);
      }
      while (v14 != v6);
    }
    return result;
  }
  float v23 = (unsigned char *)a2[5];
  double v24 = (unsigned char *)a2[6];
  if (v24 != v23)
  {
    uint64_t v25 = (void *)result[5];
    return memmove(v25, v23, v24 - v23);
  }
  return result;
}

void *sub_21B6EB92C(void *result, uint64_t *a2)
{
  uint64_t v2 = result[4];
  uint64_t v3 = result[1];
  if (v2 == v3)
  {
    uint64_t v4 = (uint64_t *)a2[3];
    uint64_t v5 = (uint64_t *)a2[4];
    if (v4 != v5)
    {
      unint64_t v6 = (void *)result[5];
      do
      {
        uint64_t v7 = *v4++;
        *v6++ = v7;
      }
      while (v4 != v5);
    }
  }
  else
  {
    uint64_t v8 = result[3];
    uint64_t v9 = a2[1];
    uint64_t v10 = a2[2];
    if (v8 == 1)
    {
      if (v9)
      {
        uint64_t v11 = 0;
        uint64_t v12 = a2[3];
        uint64_t v13 = result[5];
        do
        {
          if (v3)
          {
            uint64_t v14 = (uint64_t *)(v12 + 8 * v11 * v10);
            uint64_t v15 = (void *)(v13 + 8 * v11 * v2);
            double result = (void *)(8 * v3);
            do
            {
              uint64_t v16 = *v14++;
              *v15++ = v16;
              --result;
            }
            while (result);
          }
          ++v11;
        }
        while (v11 != v9);
      }
    }
    else if (v9)
    {
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = *a2;
      uint64_t v20 = 8 * v2;
      uint64_t v21 = (uint64_t *)a2[3];
      uint64_t v22 = 8 * v8;
      uint64_t v23 = 8 * v10;
      do
      {
        if (v19)
        {
          double v24 = (void *)(result[5] + v17);
          uint64_t v25 = v21;
          uint64_t v26 = v19;
          do
          {
            uint64_t v27 = *v25++;
            *double v24 = v27;
            double v24 = (void *)((char *)v24 + v22);
            --v26;
          }
          while (v26);
        }
        ++v18;
        v17 += v20;
        uint64_t v21 = (uint64_t *)((char *)v21 + v23);
      }
      while (v18 != v9);
    }
  }
  return result;
}

uint64_t sub_21B6EBA1C(uint64_t a1)
{
  *(_WORD *)a1 = 0;
  uint64_t v2 = (atomic_uchar *)(a1 + 1);
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(void *)(a1 + 72) = 0;
  sub_21B6FA710(a1 + 80);
  sub_21B6FA710(a1 + 3416);
  *(void *)(a1 + 6768) = 0;
  *(_OWORD *)(a1 + 6752) = 0u;
  sub_21B6FA710(a1 + 6776);
  sub_21B6EA464(a1 + 10112);
  sub_21B6EA688(a1 + 11544);
  sub_21B6EAB50(a1 + 13272);
  sub_21B6EBAC4(v2);
  sub_21B6EBAFC(a1, 1);
  atomic_store(0, (unsigned __int8 *)v2);
  return a1;
}

atomic_uchar *sub_21B6EBAC4(atomic_uchar *result)
{
  uint64_t v1 = result;
  while ((atomic_exchange_explicit(v1, 1u, memory_order_acquire) & 1) != 0)
    double result = (atomic_uchar *)sched_yield();
  return result;
}

void sub_21B6EBAFC(uint64_t a1, int a2)
{
  unsigned __int8 v4 = atomic_exchange_explicit((atomic_uchar *volatile)(a1 + 1), 1u, memory_order_acquire);
  if ((v4 & 1) == 0)
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    uint64_t v5 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v43) = 0;
      _os_log_impl(&dword_21B6E4000, v5, OS_LOG_TYPE_ERROR, "CLVLF,reset,Called without locking vision buffers", (uint8_t *)&v43, 2u);
    }
  }
  if (!a2)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = a1 + 32;
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 64);
    if (*(void *)(a1 + 32) == v9)
    {
      if (v11 == v12)
      {
        sub_21B6F0040(a1, 2.4);
        goto LABEL_24;
      }
      sub_21B6F81C0(a1, *(double *)(v12 - 1776));
    }
    else
    {
      if (v11 == v12)
      {
        sub_21B6F81C0(a1, *(double *)(v9 - 3152));
        sub_21B6F8484(v10, *(void *)(a1 + 32), (long long *)(*(void *)(a1 + 40) - 3160));
        goto LABEL_24;
      }
      uint64_t v13 = (double *)(v12 - 1776);
      double v14 = *v13;
      uint64_t v15 = (double *)(v9 - 3152);
      if (*v15 < *v13) {
        double v14 = *v15;
      }
      sub_21B6F0040(a1, v14);
      sub_21B6F8484(v10, *(void *)(a1 + 32), (long long *)(*(void *)(a1 + 40) - 3160));
    }
    sub_21B6F84C8(a1 + 56, *(void *)(a1 + 56), *(void *)(a1 + 64) - 1792);
    goto LABEL_24;
  }
  unint64_t v6 = *(void **)(a1 + 8);
  if (v6)
  {
    *(void *)(a1 + 16) = v6;
    operator delete(v6);
  }
  uint64_t v7 = *(void **)(a1 + 32);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  if (v7)
  {
    *(void *)(a1 + 40) = v7;
    operator delete(v7);
  }
  uint64_t v8 = *(void **)(a1 + 56);
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  if (v8)
  {
    *(void *)(a1 + 64) = v8;
    operator delete(v8);
  }
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
LABEL_24:
  bzero(&v43, 0xD08uLL);
  sub_21B6FA710((uint64_t)&v43);
  sub_21B6F850C(a1 + 80, (uint64_t)&v43);
  bzero(&v43, 0xD08uLL);
  sub_21B6FA710((uint64_t)&v43);
  sub_21B6F850C(a1 + 3416, (uint64_t)&v43);
  uint64_t v16 = *(void **)(a1 + 6752);
  if (v16)
  {
    *(void *)(a1 + 6760) = v16;
    operator delete(v16);
  }
  *(void *)(a1 + 6752) = 0;
  *(void *)(a1 + 6760) = 0;
  *(void *)(a1 + 6768) = 0;
  bzero(&v43, 0xD08uLL);
  sub_21B6FA710((uint64_t)&v43);
  sub_21B6F850C(a1 + 6776, (uint64_t)&v43);
  bzero(&v43, 0x598uLL);
  sub_21B6EA464((uint64_t)&v43);
  long long v17 = v44;
  *(_OWORD *)(a1 + 10112) = v43;
  *(_OWORD *)(a1 + 10128) = v17;
  *(_OWORD *)(a1 + 10144) = *(_OWORD *)v45;
  *(void *)(a1 + 10160) = *(void *)&v45[16];
  *(unsigned char *)(a1 + 10168) = v45[24];
  *(_OWORD *)(a1 + 10184) = *(_OWORD *)&v45[40];
  *(_OWORD *)(a1 + 10200) = *(_OWORD *)&v45[56];
  *(void *)(a1 + 10216) = *(void *)&v45[72];
  *(_OWORD *)(a1 + 10232) = *(_OWORD *)&v45[88];
  long long v18 = *(_OWORD *)&v45[104];
  long long v19 = *(_OWORD *)&v45[120];
  long long v20 = *(_OWORD *)&v45[136];
  *(_OWORD *)(a1 + 10296) = *(_OWORD *)&v45[152];
  *(_OWORD *)(a1 + 10280) = v20;
  *(_OWORD *)(a1 + 10264) = v19;
  *(_OWORD *)(a1 + 10248) = v18;
  long long v21 = *(_OWORD *)&v45[192];
  *(_OWORD *)(a1 + 10320) = *(_OWORD *)&v45[176];
  *(_OWORD *)(a1 + 10336) = v21;
  *(void *)(a1 + 10352) = *(void *)&v45[208];
  long long v22 = *(_OWORD *)&v45[240];
  *(_OWORD *)(a1 + 10368) = *(_OWORD *)&v45[224];
  *(_OWORD *)(a1 + 10384) = v22;
  memcpy((void *)(a1 + 10408), &v45[264], 0x128uLL);
  long long v23 = v48;
  *(_OWORD *)(a1 + 10720) = v47;
  *(_OWORD *)(a1 + 10736) = v23;
  long long v24 = v50;
  *(_OWORD *)(a1 + 10784) = v51;
  long long v25 = *(_OWORD *)v53;
  *(_OWORD *)(a1 + 10800) = v52;
  *(_OWORD *)(a1 + 10816) = v25;
  *(_OWORD *)(a1 + 10832) = *(_OWORD *)&v53[16];
  *(unsigned char *)(a1 + 10704) = v46;
  *(void *)(a1 + 10752) = v49;
  *(_OWORD *)(a1 + 10768) = v24;
  *(_OWORD *)(a1 + 10856) = v54;
  *(_OWORD *)(a1 + 10872) = v55;
  *(void *)(a1 + 10888) = v56;
  *(_OWORD *)(a1 + 10904) = *(_OWORD *)v57;
  *(_OWORD *)(a1 + 10920) = *(_OWORD *)&v57[16];
  memcpy((void *)(a1 + 10944), &v57[40], 0x128uLL);
  *(_OWORD *)(a1 + 11248) = v58;
  *(_OWORD *)(a1 + 11264) = *(_OWORD *)v59;
  *(_OWORD *)(a1 + 11304) = v61;
  *(_OWORD *)(a1 + 11320) = v62;
  *(_OWORD *)(a1 + 11336) = v63;
  *(_OWORD *)(a1 + 11352) = v64;
  *(_OWORD *)(a1 + 11288) = v60;
  *(unsigned char *)(a1 + 11368) = v65;
  long long v26 = v66;
  *(_OWORD *)(a1 + 11400) = v67;
  *(_OWORD *)(a1 + 11384) = v26;
  *(_OWORD *)(a1 + 11440) = *(_OWORD *)&v68[24];
  *(_OWORD *)(a1 + 11456) = v69;
  *(_OWORD *)(a1 + 11472) = v70;
  *(_OWORD *)(a1 + 11488) = v71;
  *(_OWORD *)(a1 + 11424) = *(_OWORD *)&v68[8];
  *(_OWORD *)(a1 + 11504) = v72;
  *(_OWORD *)(a1 + 11520) = v73;
  *(unsigned char *)(a1 + 11536) = v74;
  bzero(&v43, 0x6C0uLL);
  sub_21B6EA688((uint64_t)&v43);
  *(_OWORD *)(a1 + 11544) = v43;
  *(void *)(a1 + 11560) = v44;
  *(unsigned char *)(a1 + 11568) = BYTE8(v44);
  *(_OWORD *)(a1 + 11584) = *(_OWORD *)&v45[8];
  *(_OWORD *)(a1 + 11600) = *(_OWORD *)&v45[24];
  *(void *)(a1 + 11616) = *(void *)&v45[40];
  *(_OWORD *)(a1 + 11696) = *(_OWORD *)&v45[120];
  *(_OWORD *)(a1 + 11680) = *(_OWORD *)&v45[104];
  *(_OWORD *)(a1 + 11664) = *(_OWORD *)&v45[88];
  *(_OWORD *)(a1 + 11648) = *(_OWORD *)&v45[72];
  *(_OWORD *)(a1 + 11632) = *(_OWORD *)&v45[56];
  long long v27 = *(_OWORD *)&v45[160];
  *(_OWORD *)(a1 + 11720) = *(_OWORD *)&v45[144];
  *(_OWORD *)(a1 + 11736) = v27;
  *(void *)(a1 + 11752) = *(void *)&v45[176];
  long long v28 = *(_OWORD *)&v45[208];
  *(_OWORD *)(a1 + 11768) = *(_OWORD *)&v45[192];
  *(_OWORD *)(a1 + 11784) = v28;
  memcpy((void *)(a1 + 11808), &v45[232], 0x128uLL);
  *(unsigned char *)(a1 + 12104) = v45[528];
  long long v29 = v46;
  *(_OWORD *)(a1 + 12120) = *(_OWORD *)&v45[544];
  *(_OWORD *)(a1 + 12136) = v29;
  *(void *)(a1 + 12152) = v47;
  long long v30 = v51;
  *(_OWORD *)(a1 + 12200) = v50;
  *(_OWORD *)(a1 + 12216) = v30;
  *(_OWORD *)(a1 + 12232) = v52;
  long long v31 = v49;
  *(_OWORD *)(a1 + 12168) = v48;
  *(_OWORD *)(a1 + 12184) = v31;
  *(void *)(a1 + 12288) = v54;
  *(_OWORD *)(a1 + 12272) = *(_OWORD *)&v53[24];
  *(_OWORD *)(a1 + 12256) = *(_OWORD *)&v53[8];
  *(_OWORD *)(a1 + 12304) = v55;
  *(_OWORD *)(a1 + 12320) = v56;
  memcpy((void *)(a1 + 12344), &v57[8], 0x128uLL);
  *(_OWORD *)(a1 + 12648) = *(_OWORD *)&v57[312];
  *(_OWORD *)(a1 + 12664) = *(_OWORD *)&v57[328];
  *(_OWORD *)(a1 + 12704) = *(_OWORD *)&v59[8];
  *(_OWORD *)(a1 + 12720) = v60;
  long long v32 = v62;
  *(_OWORD *)(a1 + 12768) = v63;
  *(_OWORD *)(a1 + 12752) = v32;
  long long v33 = v65;
  *(_OWORD *)(a1 + 12816) = v66;
  long long v34 = *(_OWORD *)v68;
  *(_OWORD *)(a1 + 12832) = v67;
  *(void *)(a1 + 12680) = v58;
  *(unsigned char *)(a1 + 12688) = BYTE8(v58);
  *(unsigned char *)(a1 + 12736) = v61;
  *(void *)(a1 + 12784) = v64;
  *(_OWORD *)(a1 + 12848) = v34;
  *(_OWORD *)(a1 + 12864) = *(_OWORD *)&v68[16];
  *(_OWORD *)(a1 + 12800) = v33;
  *(_OWORD *)(a1 + 12888) = v69;
  *(_OWORD *)(a1 + 12904) = v70;
  *(void *)(a1 + 12920) = v71;
  *(_OWORD *)(a1 + 12952) = v73;
  *(_OWORD *)(a1 + 12936) = v72;
  memcpy((void *)(a1 + 12976), v75, 0x128uLL);
  memset(v45, 0, 328);
  long long v43 = 0u;
  long long v44 = 0u;
  sub_21B6EAB50((uint64_t)&v43);
  long long v35 = v44;
  *(_OWORD *)(a1 + 13272) = v43;
  *(_OWORD *)(a1 + 13288) = v35;
  *(_OWORD *)(a1 + 13312) = *(_OWORD *)&v45[8];
  *(_OWORD *)(a1 + 13328) = *(_OWORD *)&v45[24];
  long long v36 = *(_OWORD *)&v45[64];
  *(_OWORD *)(a1 + 13352) = *(_OWORD *)&v45[48];
  *(_OWORD *)(a1 + 13368) = v36;
  *(unsigned char *)(a1 + 13432) = v45[128];
  long long v37 = *(_OWORD *)&v45[112];
  long long v38 = *(_OWORD *)&v45[80];
  *(_OWORD *)(a1 + 13400) = *(_OWORD *)&v45[96];
  *(_OWORD *)(a1 + 13416) = v37;
  *(_OWORD *)(a1 + 13384) = v38;
  long long v39 = *(_OWORD *)&v45[160];
  *(_OWORD *)(a1 + 13448) = *(_OWORD *)&v45[144];
  *(_OWORD *)(a1 + 13464) = v39;
  *(_OWORD *)(a1 + 13488) = *(_OWORD *)&v45[184];
  *(_OWORD *)(a1 + 13504) = *(_OWORD *)&v45[200];
  long long v40 = *(_OWORD *)&v45[272];
  *(_OWORD *)(a1 + 13560) = *(_OWORD *)&v45[256];
  *(_OWORD *)(a1 + 13576) = v40;
  long long v41 = *(_OWORD *)&v45[240];
  *(_OWORD *)(a1 + 13528) = *(_OWORD *)&v45[224];
  *(_OWORD *)(a1 + 13544) = v41;
  *(void *)(a1 + 13624) = *(void *)&v45[320];
  long long v42 = *(_OWORD *)&v45[304];
  *(_OWORD *)(a1 + 13592) = *(_OWORD *)&v45[288];
  *(_OWORD *)(a1 + 13608) = v42;
  *(void *)(a1 + 13632) = 0;
  if ((v4 & 1) == 0) {
    atomic_store(0, (unsigned __int8 *)(a1 + 1));
  }
}

uint64_t sub_21B6EC1E8(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  *(_WORD *)(a3 + 424) = 0;
  int v5 = *(_DWORD *)(a2 + 96);
  if (v5 != 1 && v5 != 11)
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    uint64_t v25 = qword_267C5A9E0;
    if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    uint64_t v26 = *(void *)(a3 + 32);
    int v27 = *(_DWORD *)(a2 + 96);
    *(_DWORD *)buf = 134349313;
    *(void *)&uint8_t buf[4] = v26;
    *(_WORD *)&buf[12] = 1025;
    *(_DWORD *)&buf[14] = v27;
    uint64_t v16 = "CLVLF,getFusedLocation,Nonsupporting provider,machAbsTime,%{public}.3lf,locationType,%{private}d";
    long long v17 = v25;
    goto LABEL_26;
  }
  double v8 = *(double *)(a3 + 32);
  if (!*a1)
  {
    double v9 = *((double *)a1 + 1444);
    double v10 = vabdd_f64(v8, v9);
    if (v9 <= 0.0 || v10 > 24.0)
    {
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
      }
      uint64_t v12 = qword_267C5A9E0;
      if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      uint64_t v13 = *(void *)(a3 + 32);
      int v14 = *a1;
      uint64_t v15 = *((void *)a1 + 1444);
      *(_DWORD *)buf = 134349568;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = v14;
      *(_WORD *)&buf[18] = 2050;
      *(void *)&buf[20] = v15;
      uint64_t v16 = "CLVLF,getFusedLocation,Filter inactive,machAbsTime,%{public}.3lf,activated,%{public}d,lastValidVlf,%{public}.3lf";
      long long v17 = v12;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      uint32_t v19 = 28;
      goto LABEL_27;
    }
  }
  long long v20 = a1 + 6776;
  if (!a1[6777] && !*v20)
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    uint64_t v43 = qword_267C5A9E0;
    if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    uint64_t v44 = *(void *)(a3 + 32);
    if (a1[6777]) {
      int v45 = 1;
    }
    else {
      int v45 = *v20;
    }
    *(_DWORD *)buf = 134349312;
    *(void *)&uint8_t buf[4] = v44;
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = v45;
    uint64_t v16 = "CLVLF,getFusedLocation,Filter not initialized,machAbsTime,%{public}.3lf,initialized,%{public}d";
    long long v17 = v43;
LABEL_26:
    os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
    uint32_t v19 = 18;
LABEL_27:
    _os_log_impl(&dword_21B6E4000, v17, v18, v16, buf, v19);
    return 0;
  }
  if (v8 != *((double *)a1 + 994))
  {
    long long v21 = (uint64_t *)(a1 + 7952);
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    uint64_t v22 = qword_267C5A9E0;
    if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    uint64_t v23 = *(void *)(a3 + 32);
    uint64_t v24 = *v21;
    *(_DWORD *)buf = 134349312;
    *(void *)&uint8_t buf[4] = v23;
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = v24;
    uint64_t v16 = "CLVLF,getFusedLocation,Outdated state,machAbsTime,%{public}.3lf,stateMachAbsTime,%{public}.3lf";
    long long v17 = v22;
    os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
    uint32_t v19 = 22;
    goto LABEL_27;
  }
  double v30 = *((double *)a1 + 1444);
  BOOL v31 = vabdd_f64(v8, v30) <= 24.0 && v30 > 0.0;
  unsigned int v32 = *((_DWORD *)a1 + 2074);
  double v33 = -1.0;
  if ((v32 & 1) == 0 || (double v34 = *((double *)a1 + 1006), v34 <= 0.0))
  {
    int v35 = 0;
    int v41 = 0;
    int v40 = 0;
    uint64_t v28 = 0;
    double v38 = -1.0;
    double v39 = -1.0;
    if ((v32 & 2) != 0) {
      goto LABEL_71;
    }
LABEL_38:
    BOOL v42 = 0;
    goto LABEL_98;
  }
  int v35 = (v34 > 0.0) & (v32 >> 2);
  double v36 = *((double *)a1 + 998) * 57.2957795;
  *(double *)buf = *((double *)a1 + 997) * 57.2957795;
  *(double *)&buf[8] = v36;
  long long v37 = (_OWORD *)(a2 + 4);
  double v38 = sub_21B6FC85C((double *)&xmmword_26AA49C50, *(double *)(a2 + 4), *(double *)(a2 + 12), *(double *)buf, v36, *(double *)(a2 + 28));
  if (*((double *)a1 + 1006) > 32.0) {
    goto LABEL_36;
  }
  if (v31)
  {
    *long long v37 = *(_OWORD *)buf;
    double v46 = *((double *)a1 + 1006) * 0.7;
    if (v46 < 1.6) {
      double v46 = 1.6;
    }
    *(double *)(a2 + 20) = v46;
    long long v47 = (void *)(a2 + 20);
    if (v35) {
      uint64_t v28 = 5;
    }
    else {
      uint64_t v28 = 1;
    }
    *(unsigned char *)(a3 + 424) = 1;
    BOOL v48 = *a1 != 0;
  }
  else
  {
    long long v47 = (void *)(a2 + 20);
    double v49 = *(double *)(a2 + 20);
    if (v49 > 0.0 && v38 > v49 * *(double *)&qword_26AA49BC0)
    {
LABEL_36:
      uint64_t v28 = 0;
      double v39 = -1.0;
      int v40 = 1;
      goto LABEL_70;
    }
    BOOL v48 = 0;
    *long long v37 = *(_OWORD *)buf;
    *long long v47 = *((void *)a1 + 1006);
    if (v35) {
      uint64_t v28 = 5;
    }
    else {
      uint64_t v28 = 1;
    }
    *(unsigned char *)(a3 + 424) = 1;
  }
  *(unsigned char *)(a3 + 425) = v48;
  *(_OWORD *)(a3 + 432) = *v37;
  *(void *)(a3 + 448) = *v47;
  double v85 = 0.0;
  if (sub_21B6E9F78(*(_DWORD *)(a3 + 312), (double *)buf, &v85, *((double *)a1 + 999), *((double *)a1 + 1007), *(float *)(a3 + 316)))
  {
    double v50 = v85;
    double v39 = vabdd_f64(*(double *)(a2 + 28), v85);
    double v51 = *((double *)a1 + 1007);
    if (v51 > 8.0)
    {
LABEL_61:
      int v40 = 0;
      goto LABEL_70;
    }
    if (v31)
    {
      *(double *)(a2 + 28) = v85;
      double v51 = v51 * 0.8;
      *(double *)(a2 + 36) = v51;
      if (v51 < 0.8)
      {
        *(void *)(a2 + 36) = 0x3FE999999999999ALL;
        double v51 = 0.8;
      }
    }
    else
    {
      double v52 = *(double *)(a2 + 36);
      if (v52 > 0.0 && v39 > v51 + v52 + v51 + v52) {
        goto LABEL_61;
      }
      *(double *)(a2 + 28) = v85;
      *(double *)(a2 + 36) = v51;
    }
    int v40 = 0;
    *(double *)(a3 + 464) = v50;
    *(double *)(a3 + 472) = v51;
  }
  else
  {
    int v40 = 0;
    double v39 = -1.0;
  }
LABEL_70:
  int v41 = 1;
  if ((*((_DWORD *)a1 + 2074) & 2) == 0) {
    goto LABEL_38;
  }
LABEL_71:
  double v53 = *((double *)a1 + 1009);
  BOOL v42 = v53 > 0.0;
  if (v53 <= 0.0) {
    char v54 = 1;
  }
  else {
    char v54 = v40;
  }
  if ((v54 & 1) == 0)
  {
    double v55 = 1.57079633 - *((double *)a1 + 1008);
    if (v55 < 0.0 || v55 >= 6.28318531)
    {
      double v55 = fmod(v55, 6.28318531);
      if (v55 < 0.0 || v55 == 0.0 && (*(void *)&v55 & 0x8000000000000000) == 0) {
        double v55 = v55 + 6.28318531;
      }
    }
    double v56 = v53 * 57.2957795;
    if (v31)
    {
      double v56 = v56 * 0.4;
      if (v56 < 7.5) {
        double v56 = 7.5;
      }
      if (v56 > 180.0) {
        double v56 = 180.0;
      }
    }
    double v57 = v55 * 57.2957795;
    double v58 = *(double *)(a2 + 60);
    if (v58 < 0.0 || (long long v59 = (double *)(a2 + 68), v60 = *(double *)(a2 + 68), v60 <= 0.0))
    {
      *(double *)(a2 + 60) = v57;
      long long v59 = (double *)(a2 + 68);
      double v33 = -1.0;
    }
    else
    {
      double v61 = vabdd_f64(v57, v58);
      if (360.0 - v61 >= v61) {
        double v33 = v61;
      }
      else {
        double v33 = 360.0 - v61;
      }
      if (!v31)
      {
        double v62 = v56 + v60 + v56 + v60;
        if (v62 > 180.0) {
          double v62 = 180.0;
        }
        if (v33 > v62) {
          goto LABEL_98;
        }
      }
      *(double *)(a2 + 60) = v57;
    }
    *long long v59 = v56;
    uint64_t v28 = v28 | 2;
    *(double *)(a3 + 480) = v57;
    *(double *)(a3 + 488) = v56;
  }
LABEL_98:
  if (v40)
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    long long v63 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v64 = *(void *)(a3 + 32);
      uint64_t v65 = *((void *)a1 + 1006);
      uint64_t v66 = *(void *)(a2 + 20);
      uint64_t v67 = *((void *)a1 + 1007);
      uint64_t v68 = *(void *)(a2 + 36);
      double v69 = *((double *)a1 + 1009) * 57.2957795;
      uint64_t v70 = *(void *)(a2 + 68);
      *(_DWORD *)buf = 134351361;
      *(void *)&uint8_t buf[4] = v64;
      *(_WORD *)&buf[12] = 2049;
      *(void *)&buf[14] = v65;
      *(_WORD *)&buf[22] = 2049;
      *(void *)&buf[24] = v66;
      *(_WORD *)&buf[32] = 2049;
      *(double *)&buf[34] = v38;
      *(_WORD *)&buf[42] = 2049;
      *(void *)&buf[44] = v67;
      *(_WORD *)&buf[52] = 2049;
      *(void *)&buf[54] = v68;
      *(_WORD *)&buf[62] = 2049;
      *(double *)&buf[64] = v39;
      *(_WORD *)&buf[72] = 2049;
      *(double *)&buf[74] = v69;
      *(_WORD *)&buf[82] = 2049;
      *(void *)&buf[84] = v70;
      *(_WORD *)&buf[92] = 2049;
      *(double *)&buf[94] = v33;
      _os_log_impl(&dword_21B6E4000, v63, OS_LOG_TYPE_ERROR, "CLVLF,getFusedLocation,Filter reset,diverged,machAbsTime,%{public}.3lf,fusedHorizontalAccuracy,%{private}.3lf,locationHorizontalAccuracy,%{private}.3lf,horzDistToRaw,%{private}.3lf,fusedVerticalAccuracy,%{private}.3lf,locationVerticalAccuracy,%{private}.3lf,vertDistToRaw,%{private}.3lf,fusedCourseAccuracy,%{private}.3lf,locationCourseAccuracy,%{private}.3lf,courseDiffToRaw,%{private}.3lf", buf, 0x66u);
    }
    sub_21B6EBAC4((atomic_uchar *)a1 + 1);
    sub_21B6EBAFC((uint64_t)a1, 0);
    uint64_t v28 = 0;
    atomic_store(0, a1 + 1);
  }
  else
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    long long v71 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
    {
      int v72 = *(_DWORD *)(a2 + 96);
      uint64_t v73 = *(void *)(a2 + 76);
      uint64_t v74 = *(void *)(a3 + 32);
      uint64_t v75 = *(void *)(a3 + 344);
      double v76 = *(double *)(a2 + 4);
      double v77 = *(double *)(a2 + 12);
      double v78 = *(double *)(a2 + 20);
      double v79 = *(double *)(a2 + 28);
      double v80 = *(double *)(a2 + 36);
      double v81 = *(double *)(a2 + 60);
      BOOL v82 = v76 == *(double *)(a3 + 432);
      if (v77 != *(double *)(a3 + 440)) {
        BOOL v82 = 0;
      }
      if (v78 != *(double *)(a3 + 448)) {
        BOOL v82 = 0;
      }
      if (v79 != *(double *)(a3 + 464)) {
        BOOL v82 = 0;
      }
      if (v80 != *(double *)(a3 + 472)) {
        BOOL v82 = 0;
      }
      double v83 = *(double *)(a2 + 68);
      int v84 = *(unsigned __int8 *)(a3 + 424);
      if (v81 != *(double *)(a3 + 480)) {
        BOOL v82 = 0;
      }
      if (v83 != *(double *)(a3 + 488)) {
        BOOL v82 = 0;
      }
      if (*(_DWORD *)(a2 + 132) != *(_DWORD *)(a3 + 456)) {
        BOOL v82 = 0;
      }
      *(_DWORD *)buf = 67179265;
      *(_DWORD *)&uint8_t buf[4] = v72;
      *(_WORD *)&buf[8] = 2050;
      *(void *)&buf[10] = v73;
      *(_WORD *)&buf[18] = 2050;
      *(void *)&buf[20] = v74;
      *(_WORD *)&buf[28] = 2050;
      *(void *)&buf[30] = v75;
      *(_WORD *)&buf[38] = 2049;
      *(double *)&buf[40] = v76;
      *(_WORD *)&buf[48] = 2049;
      *(double *)&buf[50] = v77;
      *(_WORD *)&buf[58] = 2049;
      *(double *)&buf[60] = v78;
      *(_WORD *)&buf[68] = 2049;
      *(double *)&buf[70] = v79;
      *(_WORD *)&buf[78] = 2049;
      *(double *)&buf[80] = v80;
      *(_WORD *)&buf[88] = 2049;
      *(double *)&buf[90] = v81;
      *(_WORD *)&buf[98] = 2049;
      *(double *)&buf[100] = v83;
      __int16 v87 = 1026;
      int v88 = v41;
      __int16 v89 = 1026;
      int v90 = v35;
      __int16 v91 = 2049;
      double v92 = v38;
      __int16 v93 = 2049;
      double v94 = v39;
      __int16 v95 = 1026;
      BOOL v96 = v42;
      __int16 v97 = 2049;
      double v98 = v33;
      __int16 v99 = 1026;
      int v100 = v84;
      __int16 v101 = 1026;
      BOOL v102 = v82;
      _os_log_impl(&dword_21B6E4000, v71, OS_LOG_TYPE_DEBUG, "CLVLF,getFusedLocation,Output,type,%{private}d,timestamp,%{public}.3lf,machtime,%{public}.3lf,machContinuousTime,%{public}.3lf,latitude,%{private}.8lf,longitude,%{private}.8lf,horizontalAccuracy,%{private}.3lf,altitude,%{private}.3lf,verticalAccuracy,%{private}.3lf,course,%{private}.3lf,courseAccuracy,%{private}.3lf,isLocationFused,%{public}d,isLocationPropagated,%{public}d,horzDistToOriginal,%{private}.3lf,vertDistToOriginal,%{private}.3lf,isCourseFused,%{public}d,courseDiffToOriginal,%{private}.3lf,isCoordinateFused,%{public}d,isCoordinateEqualToFusedCoordinate,%{public}d", buf, 0xA8u);
    }
  }
  return v28;
}

void sub_21B6ECB14(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (qword_267C5A9D8 != -1) {
    dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
  }
  unsigned __int8 v4 = qword_267C5A9E0;
  if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(__p) = 67240192;
    HIDWORD(__p) = a2;
    _os_log_impl(&dword_21B6E4000, v4, OS_LOG_TYPE_DEBUG, "CLVLF,pushARSessionState,sessionState,%{public}d", (uint8_t *)&__p, 8u);
  }
  if (a2 == 1)
  {
    if (a1[6777] || a1[6776])
    {
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
      }
      int v5 = qword_267C5A9E0;
      if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
      {
        int v6 = *a1;
        LODWORD(__p) = 67240192;
        HIDWORD(__p) = v6;
        _os_log_impl(&dword_21B6E4000, v5, OS_LOG_TYPE_DEBUG, "CLVLF,pushARSessionState,Filter reset,AR session started,activated,%{public}d", (uint8_t *)&__p, 8u);
      }
      sub_21B6EBAC4((atomic_uchar *)a1 + 1);
      sub_21B6EBAFC((uint64_t)a1, 1);
      atomic_store(0, a1 + 1);
    }
    uint64_t v7 = *((void *)a1 + 1);
    uint64_t v8 = *((void *)a1 + 3);
    *a1 = 1;
    if (0xED6866F8D962AE7BLL * ((v8 - v7) >> 3) <= 0x1D)
    {
      uint64_t v9 = *((void *)a1 + 2);
      uint64_t v22 = a1 + 24;
      __p = operator new(0xA7D0uLL);
      uint32_t v19 = (char *)__p + v9 - v7;
      long long v20 = v19;
      long long v21 = (char *)__p + 42960;
      sub_21B6FAC68((uint64_t *)a1 + 1, &__p);
      if (__p) {
        operator delete(__p);
      }
    }
    uint64_t v10 = *((void *)a1 + 4);
    if (0xEBE8AB1946A49E23 * ((*((void *)a1 + 6) - v10) >> 3) <= 0x13)
    {
      uint64_t v11 = *((void *)a1 + 5);
      uint64_t v22 = a1 + 48;
      __p = operator new(0xF6E0uLL);
      uint32_t v19 = (char *)__p + v11 - v10;
      long long v20 = v19;
      long long v21 = (char *)__p + 63200;
      sub_21B6FACF0((uint64_t *)a1 + 4, &__p);
      if (__p) {
        operator delete(__p);
      }
    }
    uint64_t v12 = *((void *)a1 + 7);
    if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((*((void *)a1 + 9) - v12) >> 8)) <= 9)
    {
      uint64_t v13 = *((void *)a1 + 8);
      uint64_t v22 = a1 + 72;
      __p = operator new(0x4600uLL);
      uint32_t v19 = (char *)__p + v13 - v12;
      long long v20 = v19;
      long long v21 = (char *)__p + 17920;
      sub_21B6FADAC((uint64_t *)a1 + 7, &__p);
      if (__p) {
        operator delete(__p);
      }
    }
    uint64_t v14 = *((void *)a1 + 844);
    if ((unint64_t)(0x13A524387AC82261 * ((*((void *)a1 + 846) - v14) >> 3)) <= 3)
    {
      uint64_t v15 = *((void *)a1 + 845);
      uint64_t v22 = a1 + 6768;
      __p = operator new(0x3420uLL);
      uint32_t v19 = (char *)__p + v15 - v14;
      long long v20 = v19;
      long long v21 = (char *)__p + 13344;
      sub_21B6FAE68((uint64_t *)a1 + 844, &__p);
      if (__p) {
        operator delete(__p);
      }
    }
  }
  else
  {
    *a1 = 0;
    if (*((double *)a1 + 1444) <= 0.0)
    {
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
      }
      uint64_t v16 = qword_267C5A9E0;
      if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
      {
        int v17 = *a1;
        LODWORD(__p) = 67240192;
        HIDWORD(__p) = v17;
        _os_log_impl(&dword_21B6E4000, v16, OS_LOG_TYPE_DEBUG, "CLVLF,pushARSessionState,Filter reset,AR session closed,activated,%{public}d", (uint8_t *)&__p, 8u);
      }
      sub_21B6EBAC4((atomic_uchar *)a1 + 1);
      sub_21B6EBAFC((uint64_t)a1, 1);
      atomic_store(0, a1 + 1);
    }
  }
}

void sub_21B6ECF1C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_21B6E6194(a1);
}

void sub_21B6ECF28(unsigned __int8 *a1, void *a2)
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  if (*a1)
  {
    char v86 = 1;
    sub_21B6E8954(a2, &v86, (char *)v91);
    if (v86)
    {
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
      }
      uint64_t v4 = qword_267C5A9E0;
      if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
      {
        [a2 timestamp];
        uint64_t v6 = v5;
        int v7 = [a2 trackingState];
        uint64_t v8 = [a2 inertialState];
        uint64_t v9 = [a2 inertialCovariance];
        *(_DWORD *)__int16 v87 = 134349825;
        *(void *)int v88 = v6;
        *(_WORD *)&v88[8] = 1026;
        *(_DWORD *)&v88[10] = v7;
        *(_WORD *)&v88[14] = 2049;
        *(void *)&v88[16] = v8;
        *(_WORD *)&v88[24] = 2049;
        *(void *)&v88[26] = v9;
        uint64_t v10 = "CLVLF,pushVIOEstimation,Unable to construct VioData,machAbsTime,%{public}.3lf,trackingState,%{public}d,ine"
              "rtialState,%{private}p,inertialCovariance,%{private}p";
        uint64_t v11 = v87;
        uint64_t v12 = v4;
        os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
        uint32_t v14 = 38;
LABEL_60:
        _os_log_impl(&dword_21B6E4000, v12, v13, v10, v11, v14);
      }
    }
    else if (v92 > 0.0 {
           && ((uint64_t v17 = *((void *)a1 + 2), v18 = a1 + 8, *((void *)a1 + 1) == v17) || *(double *)(v17 - 1392) < v92)
    }
           && sub_21B6E6BDC(v93)
           && sub_21B6E6BDC(v98))
    {
      v87[0] = 1;
      *(int64x2_t *)&v88[4] = vdupq_n_s64(3uLL);
      *(_OWORD *)&v88[20] = xmmword_21B6FEAA0;
      __int16 v89 = v94;
      int v90 = &v95;
      sub_21B6FAFD0((uint64_t)v87, &dbl_21B701000);
      double v19 = v94[0] + v94[7] + v94[14];
      double v20 = sqrt(v19);
      BOOL v22 = (v20 < 0.0 || ((*(void *)&v20 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
         && (unint64_t)(*(void *)&v20 - 1) > 0xFFFFFFFFFFFFELL;
      if (!v22 && v20 < 0.041887902)
      {
        double __B = 0.00175459634 / v19;
        sub_21B6FAFD0((uint64_t)v87, &__B);
      }
      LOBYTE(__B) = 1;
      int64x2_t v82 = vdupq_n_s64(3uLL);
      long long v83 = xmmword_21B6FEAA0;
      int v84 = v96;
      double v85 = &v97;
      sub_21B6FAFD0((uint64_t)&__B, &dbl_21B701008);
      double v23 = v96[0] + v96[7] + v96[14];
      double v24 = sqrt(v23);
      if ((v24 >= 0.0 && ((*(void *)&v24 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
         || (unint64_t)(*(void *)&v24 - 1) <= 0xFFFFFFFFFFFFELL)
        && v24 < 1.5)
      {
        *(double *)buf = 2.25 / v23;
        sub_21B6FAFD0((uint64_t)&__B, (const double *)buf);
      }
      uint64_t v28 = (atomic_uchar *)(a1 + 1);
      sub_21B6EBAC4((atomic_uchar *)a1 + 1);
      unint64_t v29 = *((void *)a1 + 1);
      uint64_t v30 = *((void *)a1 + 2);
      if (v29 != v30)
      {
        double v31 = *(double *)(v30 - 1392) - *(double *)(v29 + 40);
        unint64_t v29 = *((void *)a1 + 2);
        if (v31 >= 3.0)
        {
          if (qword_267C5A9D8 != -1) {
            dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
          }
          unsigned int v32 = qword_267C5A9E0;
          if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
          {
            double v33 = (double)(unint64_t)(*((void *)a1 + 2) - *((void *)a1 + 1)) * 0.000000953674316;
            *(_DWORD *)buf = 134349569;
            *(double *)&uint8_t buf[4] = v92;
            *(_WORD *)&buf[12] = 2050;
            *(double *)&buf[14] = v31;
            *(_WORD *)&buf[22] = 2049;
            double v100 = v33;
            _os_log_impl(&dword_21B6E4000, v32, OS_LOG_TYPE_DEBUG, "CLVLF,pushVIOEstimation,VIO buffer reached its maximum size,machAbsTime,%{public}.3lf,sizeInSec,%{public}.3lf,sizeInMB,%{private}.3lf", buf, 0x20u);
          }
          unsigned __int8 v34 = atomic_exchange_explicit(v28, 1u, memory_order_acquire);
          if ((v34 & 1) == 0)
          {
            if (qword_267C5A9D8 != -1) {
              dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
            }
            int v35 = qword_267C5A9E0;
            if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21B6E4000, v35, OS_LOG_TYPE_ERROR, "CLVLF,removeAllVioDataForFirstNSeconds,Called without locking vision buffers", buf, 2u);
            }
          }
          uint64_t v37 = *((void *)a1 + 1);
          uint64_t v36 = *((void *)a1 + 2);
          if (v37 != v36)
          {
            double v38 = *(double *)(v37 + 40) + 0.3;
            while (*(double *)(v37 + 40) >= v38)
            {
              v37 += 1432;
              if (v37 == v36)
              {
                uint64_t v39 = *((void *)a1 + 2);
                goto LABEL_70;
              }
            }
            if (v37 == v36 || v37 + 1432 == v36)
            {
              uint64_t v39 = v37;
            }
            else
            {
              uint64_t v39 = v37;
              do
              {
                if (*(double *)(v37 + 1472) >= v38)
                {
                  long long v43 = *(_OWORD *)(v37 + 1432);
                  long long v44 = *(_OWORD *)(v37 + 1448);
                  long long v45 = *(_OWORD *)(v37 + 1464);
                  *(void *)(v39 + 48) = *(void *)(v37 + 1480);
                  *(_OWORD *)(v39 + 16) = v44;
                  *(_OWORD *)(v39 + 32) = v45;
                  *(_OWORD *)uint64_t v39 = v43;
                  *(unsigned char *)(v39 + 56) = *(unsigned char *)(v37 + 1488);
                  long long v46 = *(_OWORD *)(v37 + 1504);
                  long long v47 = *(_OWORD *)(v37 + 1520);
                  *(void *)(v39 + 104) = *(void *)(v37 + 1536);
                  *(_OWORD *)(v39 + 88) = v47;
                  *(_OWORD *)(v39 + 72) = v46;
                  long long v48 = *(_OWORD *)(v37 + 1584);
                  long long v49 = *(_OWORD *)(v37 + 1600);
                  long long v50 = *(_OWORD *)(v37 + 1616);
                  *(_OWORD *)(v39 + 136) = *(_OWORD *)(v37 + 1568);
                  *(_OWORD *)(v39 + 184) = v50;
                  *(_OWORD *)(v39 + 168) = v49;
                  *(_OWORD *)(v39 + 152) = v48;
                  *(_OWORD *)(v39 + 120) = *(_OWORD *)(v37 + 1552);
                  long long v51 = *(_OWORD *)(v37 + 1640);
                  long long v52 = *(_OWORD *)(v37 + 1656);
                  *(void *)(v39 + 240) = *(void *)(v37 + 1672);
                  *(_OWORD *)(v39 + 208) = v51;
                  *(_OWORD *)(v39 + 224) = v52;
                  long long v53 = *(_OWORD *)(v37 + 1704);
                  *(_OWORD *)(v39 + 256) = *(_OWORD *)(v37 + 1688);
                  *(_OWORD *)(v39 + 272) = v53;
                  memcpy((void *)(v39 + 296), (const void *)(v37 + 1728), 0x129uLL);
                  long long v55 = *(_OWORD *)(v37 + 2040);
                  long long v54 = *(_OWORD *)(v37 + 2056);
                  *(void *)(v39 + 640) = *(void *)(v37 + 2072);
                  *(_OWORD *)(v39 + 608) = v55;
                  *(_OWORD *)(v39 + 624) = v54;
                  long long v57 = *(_OWORD *)(v37 + 2104);
                  long long v56 = *(_OWORD *)(v37 + 2120);
                  long long v58 = *(_OWORD *)(v37 + 2152);
                  *(_OWORD *)(v39 + 704) = *(_OWORD *)(v37 + 2136);
                  *(_OWORD *)(v39 + 720) = v58;
                  *(_OWORD *)(v39 + 672) = v57;
                  *(_OWORD *)(v39 + 688) = v56;
                  *(_OWORD *)(v39 + 656) = *(_OWORD *)(v37 + 2088);
                  long long v59 = *(_OWORD *)(v37 + 2176);
                  long long v60 = *(_OWORD *)(v37 + 2192);
                  *(void *)(v39 + 776) = *(void *)(v37 + 2208);
                  *(_OWORD *)(v39 + 760) = v60;
                  *(_OWORD *)(v39 + 744) = v59;
                  long long v61 = *(_OWORD *)(v37 + 2224);
                  *(_OWORD *)(v39 + 808) = *(_OWORD *)(v37 + 2240);
                  *(_OWORD *)(v39 + 792) = v61;
                  memcpy((void *)(v39 + 832), (const void *)(v37 + 2264), 0x128uLL);
                  long long v62 = *(_OWORD *)(v37 + 2568);
                  *(_OWORD *)(v39 + 1152) = *(_OWORD *)(v37 + 2584);
                  *(_OWORD *)(v39 + 1136) = v62;
                  *(_OWORD *)(v39 + 1176) = *(_OWORD *)(v37 + 2608);
                  long long v63 = *(_OWORD *)(v37 + 2640);
                  long long v64 = *(_OWORD *)(v37 + 2656);
                  long long v65 = *(_OWORD *)(v37 + 2672);
                  *(_OWORD *)(v39 + 1192) = *(_OWORD *)(v37 + 2624);
                  *(_OWORD *)(v39 + 1240) = v65;
                  *(_OWORD *)(v39 + 1224) = v64;
                  *(_OWORD *)(v39 + 1208) = v63;
                  *(unsigned char *)(v39 + 1256) = *(unsigned char *)(v37 + 2688);
                  long long v66 = *(_OWORD *)(v37 + 2704);
                  *(_OWORD *)(v39 + 1288) = *(_OWORD *)(v37 + 2720);
                  *(_OWORD *)(v39 + 1272) = v66;
                  *(_OWORD *)(v39 + 1312) = *(_OWORD *)(v37 + 2744);
                  long long v67 = *(_OWORD *)(v37 + 2792);
                  long long v68 = *(_OWORD *)(v37 + 2808);
                  long long v69 = *(_OWORD *)(v37 + 2776);
                  *(_OWORD *)(v39 + 1328) = *(_OWORD *)(v37 + 2760);
                  *(_OWORD *)(v39 + 1376) = v68;
                  *(_OWORD *)(v39 + 1360) = v67;
                  *(_OWORD *)(v39 + 1344) = v69;
                  long long v70 = *(_OWORD *)(v37 + 2824);
                  long long v71 = *(_OWORD *)(v37 + 2840);
                  *(unsigned char *)(v39 + 1424) = *(unsigned char *)(v37 + 2856);
                  *(_OWORD *)(v39 + 1408) = v71;
                  *(_OWORD *)(v39 + 1392) = v70;
                  v39 += 1432;
                }
                uint64_t v72 = v37 + 2864;
                v37 += 1432;
              }
              while (v72 != v36);
              uint64_t v36 = *((void *)a1 + 2);
            }
LABEL_70:
            sub_21B6FA474((void *)a1 + 1, v39, v36);
          }
          if ((v34 & 1) == 0) {
            atomic_store(0, (unsigned __int8 *)v28);
          }
          unint64_t v29 = *((void *)a1 + 2);
        }
      }
      unint64_t v73 = *((void *)a1 + 3);
      if (v29 >= v73)
      {
        unint64_t v75 = 0xED6866F8D962AE7BLL * ((uint64_t)(v29 - *v18) >> 3);
        if (v75 + 1 > 0x2DC3EED6866F8DLL) {
          sub_21B6EB24C();
        }
        unint64_t v76 = 0xED6866F8D962AE7BLL * ((uint64_t)(v73 - *v18) >> 3);
        uint64_t v77 = 2 * v76;
        if (2 * v76 <= v75 + 1) {
          uint64_t v77 = v75 + 1;
        }
        if (v76 >= 0x16E1F76B4337C6) {
          unint64_t v78 = 0x2DC3EED6866F8DLL;
        }
        else {
          unint64_t v78 = v77;
        }
        __int16 v101 = a1 + 24;
        if (v78)
        {
          if (v78 > 0x2DC3EED6866F8DLL) {
            sub_21B6EAD8C();
          }
          double v79 = (char *)operator new(1432 * v78);
        }
        else
        {
          double v79 = 0;
        }
        uint64_t v80 = (uint64_t)&v79[1432 * v75];
        *(void *)buf = v79;
        *(void *)&buf[8] = v80;
        *(void *)&double v100 = &v79[1432 * v78];
        sub_21B6FAAAC(v80, v91);
        *(void *)&buf[16] = v80 + 1432;
        sub_21B6FAC68((uint64_t *)a1 + 1, buf);
        uint64_t v74 = *((void *)a1 + 2);
        if (*(void *)buf) {
          operator delete(*(void **)buf);
        }
      }
      else
      {
        uint64_t v74 = sub_21B6FAAAC(v29, v91) + 1432;
      }
      *((void *)a1 + 2) = v74;
      atomic_store(0, a1 + 1);
    }
    else
    {
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
      }
      uint64_t v40 = qword_267C5A9E0;
      if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v41 = *((void *)a1 + 2);
        if (*((void *)a1 + 1) == v41) {
          unint64_t v42 = 0xBFF0000000000000;
        }
        else {
          unint64_t v42 = *(void *)(v41 - 1392);
        }
        *(_DWORD *)__int16 v87 = 134349312;
        *(double *)int v88 = v92;
        *(_WORD *)&v88[8] = 2050;
        *(void *)&v88[10] = v42;
        uint64_t v10 = "CLVLF,pushVIOEstimation,Invalid measurement,machAbsTime,%{public}.3lf,prevMachAbsTime,%{public}.3lf";
        uint64_t v11 = v87;
        uint64_t v12 = v40;
        os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
        uint32_t v14 = 22;
        goto LABEL_60;
      }
    }
  }
  else
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    uint64_t v15 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      int v16 = *a1;
      LODWORD(v91[0]) = 67240192;
      DWORD1(v91[0]) = v16;
      uint64_t v10 = "CLVLF,pushVIOEstimation,activated,%{public}d";
      uint64_t v11 = (uint8_t *)v91;
      uint64_t v12 = v15;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 8;
      goto LABEL_60;
    }
  }
}

void sub_21B6ED7D8(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_21B6E6194(a1);
}

void sub_21B6ED7E4()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = (unsigned __int8 *)v0;
  uint64_t v216 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)v0)
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    uint64_t v12 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      int v13 = *v2;
      LODWORD(v106) = 67240192;
      DWORD1(v106) = v13;
      int v7 = "CLVLF,pushVLLocalizationResult,activated,%{public}d";
      uint64_t v8 = (uint8_t *)&v106;
      uint64_t v9 = v12;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 8;
      goto LABEL_87;
    }
    return;
  }
  uint64_t v3 = v1;
  uint64_t v4 = *(void *)(v0 + 13632);
  if (v4 != -1) {
    *(void *)(v0 + 13632) = v4 + 1;
  }
  uint64_t v94 = v0;
  char v100 = 1;
  sub_21B6EA688((uint64_t)&v106);
  sub_21B6EA464((uint64_t)v159);
  sub_21B6E9560(v3, &v100, (uint64_t)v160);
  long long v106 = *(_OWORD *)v160;
  uint64_t v107 = *(void *)&v160[16];
  v108[0] = LOBYTE(v161);
  long long v109 = v162;
  long long v110 = v163;
  uint64_t v111 = v164;
  long long v116 = v169;
  long long v115 = v168;
  long long v114 = v167;
  long long v113 = v166;
  long long v112 = v165;
  long long v117 = v170;
  long long v118 = v171;
  uint64_t v119 = v172;
  long long v120 = v173;
  long long v121 = v174;
  memcpy(v122, v175, sizeof(v122));
  char v123 = v175[296];
  long long v124 = v176;
  long long v125 = v177;
  uint64_t v126 = v178;
  long long v129 = v181;
  long long v130 = v182;
  long long v131 = v183;
  long long v127 = v179;
  long long v128 = v180;
  long long v132 = v184;
  long long v133 = v185;
  uint64_t v134 = v186;
  long long v135 = v187[0];
  long long v136 = v187[1];
  memcpy(v137, v188, 0x128uLL);
  long long v138 = v189;
  long long v139 = v190;
  double v140 = v191;
  char v141 = v192;
  long long v142 = v193;
  long long v143 = v194;
  char v144 = v195;
  long long v145 = v196;
  long long v146 = v197;
  uint64_t v147 = v198;
  long long v150 = v201;
  long long v151 = v202;
  long long v152 = v203;
  long long v148 = v199;
  long long v149 = v200;
  long long v153 = v204;
  long long v154 = v205;
  uint64_t v155 = v206;
  long long v157 = *(_OWORD *)v208;
  long long v156 = __y;
  memcpy(v158, v209, sizeof(v158));
  if (v100)
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    uint64_t v5 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      [v3 timestamp];
      *(_DWORD *)v160 = 134349056;
      *(void *)&v160[4] = v6;
      int v7 = "CLVLF,pushVLLocalizationResult,Unable to construct VlfData,machAbsTime,%{public}.3lf";
      uint64_t v8 = v160;
      uint64_t v9 = v5;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_9:
      uint32_t v11 = 12;
LABEL_87:
      _os_log_impl(&dword_21B6E4000, v9, v10, v7, v8, v11);
      return;
    }
    return;
  }
  uint64_t v14 = v94;
  sub_21B6EBAC4((atomic_uchar *)(v94 + 1));
  if (sub_21B6EE8F4(v94, &v106, (uint64_t)v159)) {
    sub_21B6F0040(v94, 2.4);
  }
  __int16 v93 = (atomic_uchar *)(v94 + 1);
  atomic_store(0, (unsigned __int8 *)(v94 + 1));
  double v15 = *((double *)&v106 + 1);
  if (*((double *)&v106 + 1) <= 0.0) {
    goto LABEL_77;
  }
  uint64_t v16 = *(void *)(v94 + 40);
  if (*(void *)(v94 + 32) != v16 && *(double *)(v16 - 3152) >= *((double *)&v106 + 1)) {
    goto LABEL_77;
  }
  uint64_t v17 = *(void *)(v94 + 6760);
  if (*(void *)(v94 + 6752) != v17 && *(double *)(v17 - 2160) >= *((double *)&v106 + 1) + 2.4) {
    goto LABEL_77;
  }
  if ((*(void *)&v140 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL || v140 < 0.6827 || v140 > 1.0) {
    goto LABEL_77;
  }
  if (!sub_21B6E6BDC(v108))
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    uint64_t v61 = qword_267C5A9E0;
    if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
LABEL_79:
      uint64_t v66 = qword_267C5A9E0;
      if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR)) {
        return;
      }
      uint64_t v67 = *(void *)(v94 + 40);
      if (*(void *)(v94 + 32) == v67)
      {
        uint64_t v69 = *(void *)(v94 + 6760);
        if (*(void *)(v94 + 6752) == v69)
        {
          unint64_t v70 = 0xBFF0000000000000;
          goto LABEL_85;
        }
        long long v68 = (unint64_t *)(v69 - 2160);
      }
      else
      {
        long long v68 = (unint64_t *)(v67 - 3152);
      }
      unint64_t v70 = *v68;
LABEL_85:
      *(_DWORD *)v160 = 134349568;
      *(void *)&v160[4] = *((void *)&v106 + 1);
      *(_WORD *)&v160[12] = 2050;
      *(void *)&v160[14] = v70;
      *(_WORD *)&v160[22] = 2050;
      double v161 = v140;
      int v7 = "CLVLF,pushVLLocalizationResult,Invalid measurement,machAbsTime,%{public}.3lf,prevMachAbsTime,%{public}.3lf,co"
           "nfidence,%{public}.3lf,";
      uint64_t v8 = v160;
LABEL_86:
      uint64_t v9 = v66;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 32;
      goto LABEL_87;
    }
    *(_WORD *)v160 = 0;
    long long v62 = "CLVLF,isValid,Invalid VL,inf or nan value in estimates or covariance";
    long long v63 = v160;
LABEL_75:
    long long v64 = v61;
    uint32_t v65 = 2;
LABEL_76:
    _os_log_impl(&dword_21B6E4000, v64, OS_LOG_TYPE_ERROR, v62, v63, v65);
LABEL_77:
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    goto LABEL_79;
  }
  double v18 = *(double *)(v94 + 13288);
  if (v18 <= 0.0 || vabdd_f64(v18, v15) > 6.0) {
    goto LABEL_27;
  }
  sub_21B6FA9E0((uint64_t)v160, &v106);
  if (!sub_21B6E90F8((uint64_t)v160))
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    uint64_t v61 = qword_267C5A9E0;
    if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_77;
    }
    LOWORD(v101) = 0;
    long long v62 = "CLVLF,isValid,Invalid VL,Unable to compute ENU from ECEF";
    long long v63 = (uint8_t *)&v101;
    goto LABEL_75;
  }
  double v71 = hypot(*(long double *)&__y, *((long double *)&__y + 1));
  if (*(double *)&qword_26AA49BC0 * *(double *)(v94 + 13384) >= 64.0) {
    double v72 = *(double *)&qword_26AA49BC0 * *(double *)(v94 + 13384);
  }
  else {
    double v72 = 64.0;
  }
  if (v71 > v72)
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    uint64_t v73 = qword_267C5A9E0;
    if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_77;
    }
    int v101 = 134283777;
    *(double *)uint64_t v102 = v71;
    *(_WORD *)&v102[8] = 2049;
    *(double *)&v102[10] = v72;
    long long v62 = "CLVLF,isValid,Invalid VL,CL-VL horizontal distance,%{private}.3lf,horzDistThres,%{private}.3lf";
    goto LABEL_119;
  }
  double v77 = fabs(v208[0]);
  if (*(double *)&qword_26AA49BC8 * *(double *)(v94 + 13392) >= 48.0) {
    double v78 = *(double *)&qword_26AA49BC8 * *(double *)(v94 + 13392);
  }
  else {
    double v78 = 48.0;
  }
  if (v77 > v78)
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    uint64_t v73 = qword_267C5A9E0;
    if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_77;
    }
    int v101 = 134283777;
    *(double *)uint64_t v102 = v77;
    *(_WORD *)&v102[8] = 2049;
    *(double *)&v102[10] = v78;
    long long v62 = "CLVLF,isValid,Invalid VL,CL-VL vertical distance,%{private}.3lf,vertDistThres,%{private}.3lf";
LABEL_119:
    long long v63 = (uint8_t *)&v101;
    long long v64 = v73;
    uint32_t v65 = 22;
    goto LABEL_76;
  }
LABEL_27:
  double v92 = (uint64_t *)(v94 + 32);
  LOBYTE(v101) = 1;
  *(int64x2_t *)&v102[4] = vdupq_n_s64(3uLL);
  long long v103 = xmmword_21B6FEAA0;
  v104 = v137;
  v105 = &v137[15];
  sub_21B6FAFD0((uint64_t)&v101, &dbl_21B701010);
  double v19 = v137[0] + v137[7] + v137[14];
  double v20 = sqrt(v19);
  BOOL v22 = (v20 < 0.0 || ((*(void *)&v20 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
     && (unint64_t)(*(void *)&v20 - 1) > 0xFFFFFFFFFFFFELL;
  if (!v22 && v20 < 0.0200712864)
  {
    *(double *)v160 = 0.000402856538 / v19;
    sub_21B6FAFD0((uint64_t)&v101, (const double *)v160);
  }
  v95[0] = 1;
  int64x2_t v96 = vdupq_n_s64(3uLL);
  long long v97 = xmmword_21B6FEAA0;
  double v98 = &v137[21];
  __int16 v99 = &v137[36];
  sub_21B6FAFD0((uint64_t)v95, &dbl_21B701018);
  double v23 = v137[21] + v137[28] + v137[35];
  double v24 = sqrt(v23);
  BOOL v26 = (v24 < 0.0 || ((*(void *)&v24 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
     && (unint64_t)(*(void *)&v24 - 1) > 0xFFFFFFFFFFFFELL;
  if (!v26 && v24 < 0.7)
  {
    *(double *)v160 = 0.49 / v23;
    sub_21B6FAFD0((uint64_t)v95, (const double *)v160);
  }
  sub_21B6FA9E0((uint64_t)v160, (long long *)(v94 + 11544));
  *(_OWORD *)(v94 + 11544) = v106;
  *(void *)(v94 + 11560) = v107;
  *(unsigned char *)(v94 + 11568) = v108[0];
  long long v27 = v110;
  *(_OWORD *)(v94 + 11584) = v109;
  *(_OWORD *)(v94 + 11600) = v27;
  *(void *)(v94 + 11616) = v111;
  *(_OWORD *)(v94 + 11696) = v116;
  long long v28 = v114;
  *(_OWORD *)(v94 + 11680) = v115;
  *(_OWORD *)(v94 + 11664) = v28;
  long long v29 = v112;
  *(_OWORD *)(v94 + 11648) = v113;
  *(_OWORD *)(v94 + 11632) = v29;
  long long v30 = v118;
  *(_OWORD *)(v94 + 11720) = v117;
  *(_OWORD *)(v94 + 11736) = v30;
  *(void *)(v94 + 11752) = v119;
  long long v31 = v121;
  *(_OWORD *)(v94 + 11768) = v120;
  *(_OWORD *)(v94 + 11784) = v31;
  memcpy((void *)(v94 + 11808), v122, 0x128uLL);
  long long v32 = v125;
  *(_OWORD *)(v94 + 12120) = v124;
  *(_OWORD *)(v94 + 12136) = v32;
  long long v33 = v130;
  *(_OWORD *)(v94 + 12200) = v129;
  *(_OWORD *)(v94 + 12216) = v33;
  *(_OWORD *)(v94 + 12232) = v131;
  long long v34 = v128;
  *(_OWORD *)(v94 + 12168) = v127;
  *(_OWORD *)(v94 + 12184) = v34;
  long long v35 = v132;
  *(_OWORD *)(v94 + 12272) = v133;
  *(_OWORD *)(v94 + 12256) = v35;
  long long v36 = v136;
  *(_OWORD *)(v94 + 12304) = v135;
  *(unsigned char *)(v94 + 12104) = v123;
  *(void *)(v94 + 12152) = v126;
  *(void *)(v94 + 12288) = v134;
  *(_OWORD *)(v94 + 12320) = v36;
  memcpy((void *)(v94 + 12344), v137, 0x128uLL);
  long long v37 = v139;
  *(_OWORD *)(v94 + 12648) = v138;
  *(_OWORD *)(v94 + 12664) = v37;
  long long v38 = v143;
  *(_OWORD *)(v94 + 12704) = v142;
  *(_OWORD *)(v94 + 12720) = v38;
  long long v39 = v145;
  *(_OWORD *)(v94 + 12768) = v146;
  *(_OWORD *)(v94 + 12752) = v39;
  long long v40 = v148;
  *(_OWORD *)(v94 + 12816) = v149;
  long long v41 = v151;
  *(_OWORD *)(v94 + 12832) = v150;
  *(double *)(v94 + 12680) = v140;
  *(unsigned char *)(v94 + 12688) = v141;
  *(unsigned char *)(v94 + 12736) = v144;
  *(void *)(v94 + 12784) = v147;
  *(_OWORD *)(v94 + 12848) = v41;
  *(_OWORD *)(v94 + 12864) = v152;
  *(_OWORD *)(v94 + 12800) = v40;
  long long v42 = v154;
  *(_OWORD *)(v94 + 12888) = v153;
  *(_OWORD *)(v94 + 12904) = v42;
  *(void *)(v94 + 12920) = v155;
  long long v43 = v156;
  *(_OWORD *)(v94 + 12952) = v157;
  *(_OWORD *)(v94 + 12936) = v43;
  memcpy((void *)(v94 + 12976), v158, 0x128uLL);
  double v44 = *(double *)&v160[8];
  if (*(double *)&v160[8] > 0.0 && (*(unsigned char *)(v94 + 6777) || *(unsigned char *)(v94 + 6776)))
  {
    uint64_t v45 = 0;
    double v46 = *((double *)&v106 + 1);
    *(void *)buf = &unk_26CB86830;
    *(_OWORD *)&buf[8] = v135;
    long long v215 = v136;
    do
    {
      *(double *)&buf[v45 + 8] = *(double *)&buf[v45 + 8] - *(double *)((char *)v187 + v45);
      v45 += 8;
    }
    while (v45 != 24);
    double v47 = vabdd_f64(v46, v44);
    double v48 = *(double *)&buf[16] * *(double *)&buf[16]
        + *(double *)&buf[8] * *(double *)&buf[8]
        + *(double *)&v215 * *(double *)&v215;
    double v49 = v47 * (v47 * 81.0);
    if (v48 > 0.04 && v48 > v49)
    {
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
      }
      uint64_t v74 = qword_267C5A9E0;
      if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v210 = 134283777;
        double v211 = sqrt(v48);
        __int16 v212 = 2049;
        double v213 = sqrt(v49);
        _os_log_impl(&dword_21B6E4000, v74, OS_LOG_TYPE_ERROR, "CLVLF,isValid,Invalid VL,VL-VL distance,%{private}.3lf,distThres,%{private}.3lf", v210, 0x16u);
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
        }
      }
      uint64_t v66 = qword_267C5A9E0;
      if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR)) {
        return;
      }
      uint64_t v75 = *(void *)(v94 + 40);
      if (*(void *)(v94 + 32) == v75)
      {
        uint64_t v80 = *(void *)(v94 + 6760);
        if (*(void *)(v94 + 6752) == v80)
        {
          unint64_t v81 = 0xBFF0000000000000;
          goto LABEL_129;
        }
        unint64_t v76 = (unint64_t *)(v80 - 2160);
      }
      else
      {
        unint64_t v76 = (unint64_t *)(v75 - 3152);
      }
      unint64_t v81 = *v76;
LABEL_129:
      *(_DWORD *)buf = 134349568;
      *(void *)&uint8_t buf[4] = *((void *)&v106 + 1);
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = v81;
      *(_WORD *)&buf[22] = 2050;
      *(double *)&long long v215 = v140;
      int v7 = "CLVLF,pushVLLocalizationResult,Invalid measurement,machAbsTime,%{public}.3lf,prevMachAbsTime,%{public}.3lf,co"
           "nfidence,%{public}.3lf,";
      uint64_t v8 = buf;
      goto LABEL_86;
    }
  }
  sub_21B6EBAC4(v93);
  unint64_t v52 = *(void *)(v94 + 32);
  uint64_t v51 = *(void *)(v94 + 40);
  if (v52 != v51)
  {
    double v53 = *(double *)(v51 - 3152) - *(double *)(v52 + 8);
    unint64_t v52 = *(void *)(v94 + 40);
    if (v53 >= 10.0)
    {
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
      }
      long long v54 = qword_267C5A9E0;
      if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
      {
        double v55 = (double)(0x80B70FBB5A19BE48 * ((uint64_t)(*(void *)(v94 + 16) - *(void *)(v94 + 8)) >> 3))
            * 0.000000953674316;
        *(_DWORD *)buf = 134349569;
        *(void *)&uint8_t buf[4] = *((void *)&v106 + 1);
        *(_WORD *)&buf[12] = 2050;
        *(double *)&buf[14] = v53;
        *(_WORD *)&buf[22] = 2049;
        *(double *)&long long v215 = v55;
        _os_log_impl(&dword_21B6E4000, v54, OS_LOG_TYPE_DEBUG, "CLVLF,pushVLLocalizationResult,VL buffer reached its maximum size,machAbsTime,%{public}.3lf,sizeInSec,%{public}.3lf,sizeInMB,%{private}.3lf", buf, 0x20u);
      }
      unsigned __int8 v56 = atomic_exchange_explicit(v93, 1u, memory_order_acquire);
      if ((v56 & 1) == 0)
      {
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
        }
        long long v57 = qword_267C5A9E0;
        if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B6E4000, v57, OS_LOG_TYPE_ERROR, "CLVLF,removeAllVlfDataForFirstNSeconds,Called without locking vision buffers", buf, 2u);
        }
      }
      uint64_t v59 = *(void *)(v94 + 32);
      long long v58 = *(long long **)(v94 + 40);
      if ((long long *)v59 != v58)
      {
        double v60 = *(double *)(v59 + 8) + 1.0;
        while (*(double *)(v59 + 8) >= v60)
        {
          v59 += 3160;
          if ((long long *)v59 == v58)
          {
            uint64_t v59 = *(void *)(v94 + 40);
            goto LABEL_131;
          }
        }
        if ((long long *)v59 != v58)
        {
          uint64_t v79 = v59 + 3160;
          if ((long long *)(v59 + 3160) == v58)
          {
            uint64_t v14 = v94;
          }
          else
          {
            do
            {
              if (*(double *)(v79 + 8) >= v60)
              {
                sub_21B6FB198(v59, (long long *)v79);
                v59 += 3160;
              }
              v79 += 3160;
            }
            while ((long long *)v79 != v58);
            uint64_t v14 = v94;
            long long v58 = *(long long **)(v94 + 40);
          }
        }
LABEL_131:
        sub_21B6F8484((uint64_t)v92, v59, v58);
      }
      if ((v56 & 1) == 0) {
        atomic_store(0, (unsigned __int8 *)v93);
      }
      unint64_t v52 = *(void *)(v14 + 40);
    }
  }
  unint64_t v82 = *(void *)(v14 + 48);
  if (v52 >= v82)
  {
    unint64_t v84 = 0xEBE8AB1946A49E23 * ((uint64_t)(v52 - *v92) >> 3);
    if (v84 + 1 > 0x14BD3EDDA68FE0) {
      sub_21B6EB24C();
    }
    unint64_t v85 = 0xEBE8AB1946A49E23 * ((uint64_t)(v82 - *v92) >> 3);
    uint64_t v86 = 2 * v85;
    if (2 * v85 <= v84 + 1) {
      uint64_t v86 = v84 + 1;
    }
    if (v85 >= 0xA5E9F6ED347F0) {
      unint64_t v87 = 0x14BD3EDDA68FE0;
    }
    else {
      unint64_t v87 = v86;
    }
    *((void *)&v215 + 1) = v14 + 48;
    if (v87)
    {
      if (v87 > 0x14BD3EDDA68FE0) {
        sub_21B6EAD8C();
      }
      int v88 = (char *)operator new(3160 * v87);
    }
    else
    {
      int v88 = 0;
    }
    uint64_t v89 = (uint64_t)&v88[3160 * v84];
    *(void *)buf = v88;
    *(void *)&buf[8] = v89;
    *(void *)&long long v215 = &v88[3160 * v87];
    sub_21B6FA9E0(v89, &v106);
    sub_21B6FAAAC(v89 + 1728, v159);
    *(void *)&buf[16] = v89 + 3160;
    sub_21B6FACF0(v92, buf);
    unint64_t v83 = *(void *)(v14 + 40);
    if (*(void *)buf) {
      operator delete(*(void **)buf);
    }
  }
  else
  {
    sub_21B6FA9E0(v52, &v106);
    sub_21B6FAAAC(v52 + 1728, v159);
    unint64_t v83 = v52 + 3160;
  }
  *(void *)(v14 + 40) = v83;
  atomic_store(0, (unsigned __int8 *)(v14 + 1));
  if (qword_267C5A9D8 != -1) {
    dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
  }
  uint64_t v90 = qword_267C5A9E0;
  if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
  {
    [v3 timestamp];
    *(_DWORD *)buf = 134349056;
    *(void *)&uint8_t buf[4] = v91;
    int v7 = "CLVLF,pushVLLocalizationResult,VL added to queue,machAbsTime,%{public}.3lf";
    uint64_t v8 = buf;
    uint64_t v9 = v90;
    os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
    goto LABEL_9;
  }
}

void sub_21B6EE8E8(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_21B6E6194(a1);
}

BOOL sub_21B6EE8F4(uint64_t a1, long long *a2, uint64_t a3)
{
  uint64_t v260 = *MEMORY[0x263EF8340];
  unsigned __int8 v6 = atomic_exchange_explicit((atomic_uchar *volatile)(a1 + 1), 1u, memory_order_acquire);
  if ((v6 & 1) == 0)
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    int v7 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B6E4000, v7, OS_LOG_TYPE_ERROR, "CLVLF,synchronizeVioDataAt,Called without locking vision buffers", buf, 2u);
    }
  }
  long long v8 = *a2;
  *(void *)(a3 + 48) = *((void *)a2 + 2);
  *(_OWORD *)(a3 + 32) = v8;
  *(unsigned char *)(a3 + 1424) = 0;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  if (0xED6866F8D962AE7BLL * ((v10 - v9) >> 3) <= 1) {
    goto LABEL_50;
  }
  double v11 = *((double *)a2 + 1);
  if (*(double *)(v9 + 40) > v11) {
    goto LABEL_50;
  }
  uint64_t v12 = (_OWORD *)(a3 + 32);
  double v13 = *(double *)(v10 - 1392);
  if (v13 >= v11)
  {
    long long v14 = *a2;
    *(void *)(a3 + 48) = *((void *)a2 + 2);
    *uint64_t v12 = v14;
    *(unsigned char *)(a3 + 1424) = 0;
    unint64_t v15 = *(void *)(a1 + 8);
    unint64_t v16 = *(void *)(a1 + 16);
    if (v15 >= v16) {
      goto LABEL_45;
    }
    double v17 = *((double *)a2 + 1);
    if (*(double *)(v15 + 40) > v17 || *(double *)(v16 - 1392) < v17) {
      goto LABEL_45;
    }
    unint64_t v18 = 0xED6866F8D962AE7BLL * ((uint64_t)(v16 - v15) >> 3);
    unint64_t v19 = *(void *)(a1 + 8);
    do
    {
      unint64_t v20 = v18 >> 1;
      unint64_t v21 = v19 + 1432 * (v18 >> 1);
      double v22 = *(double *)(v21 + 40);
      unint64_t v23 = v21 + 1432;
      v18 += ~(v18 >> 1);
      if (v22 < v17) {
        unint64_t v19 = v23;
      }
      else {
        unint64_t v18 = v20;
      }
    }
    while (v18);
    unint64_t v24 = v19 - 1432;
    if (v19 == v15)
    {
      int v25 = 1;
    }
    else
    {
      if (v19 != v16) {
        goto LABEL_34;
      }
      int v25 = -1;
    }
    v24 += 1432 * v25;
    v19 += 1432 * v25;
LABEL_34:
    if (v24 >= v15 && v24 < v16 && v19 >= v15 && v19 < v16)
    {
      BOOL result = sub_21B6FA03C(v24, v19);
      if (!result) {
        goto LABEL_51;
      }
      double v84 = *(double *)(v24 + 40);
      if (v84 == v17)
      {
        long long v85 = *(_OWORD *)v24;
        long long v86 = *(_OWORD *)(v24 + 16);
        long long v87 = *(_OWORD *)(v24 + 32);
        *(void *)(a3 + 48) = *(void *)(v24 + 48);
        *(_OWORD *)(a3 + 16) = v86;
        *(_OWORD *)(a3 + 32) = v87;
        *(_OWORD *)a3 = v85;
        *(unsigned char *)(a3 + 56) = *(unsigned char *)(v24 + 56);
        long long v88 = *(_OWORD *)(v24 + 72);
        long long v89 = *(_OWORD *)(v24 + 88);
        *(void *)(a3 + 104) = *(void *)(v24 + 104);
        *(_OWORD *)(a3 + 88) = v89;
        *(_OWORD *)(a3 + 72) = v88;
        long long v90 = *(_OWORD *)(v24 + 152);
        long long v91 = *(_OWORD *)(v24 + 168);
        long long v92 = *(_OWORD *)(v24 + 184);
        *(_OWORD *)(a3 + 136) = *(_OWORD *)(v24 + 136);
        *(_OWORD *)(a3 + 184) = v92;
        *(_OWORD *)(a3 + 168) = v91;
        *(_OWORD *)(a3 + 152) = v90;
        *(_OWORD *)(a3 + 120) = *(_OWORD *)(v24 + 120);
        long long v93 = *(_OWORD *)(v24 + 208);
        long long v94 = *(_OWORD *)(v24 + 224);
        *(void *)(a3 + 240) = *(void *)(v24 + 240);
        *(_OWORD *)(a3 + 208) = v93;
        *(_OWORD *)(a3 + 224) = v94;
        long long v95 = *(_OWORD *)(v24 + 272);
        *(_OWORD *)(a3 + 256) = *(_OWORD *)(v24 + 256);
        *(_OWORD *)(a3 + 272) = v95;
        memcpy((void *)(a3 + 296), (const void *)(v24 + 296), 0x129uLL);
        long long v97 = *(_OWORD *)(v24 + 608);
        long long v96 = *(_OWORD *)(v24 + 624);
        *(void *)(a3 + 640) = *(void *)(v24 + 640);
        *(_OWORD *)(a3 + 608) = v97;
        *(_OWORD *)(a3 + 624) = v96;
        long long v99 = *(_OWORD *)(v24 + 672);
        long long v98 = *(_OWORD *)(v24 + 688);
        long long v100 = *(_OWORD *)(v24 + 720);
        *(_OWORD *)(a3 + 704) = *(_OWORD *)(v24 + 704);
        *(_OWORD *)(a3 + 720) = v100;
        *(_OWORD *)(a3 + 672) = v99;
        *(_OWORD *)(a3 + 688) = v98;
        *(_OWORD *)(a3 + 656) = *(_OWORD *)(v24 + 656);
        long long v101 = *(_OWORD *)(v24 + 744);
        long long v102 = *(_OWORD *)(v24 + 760);
        *(void *)(a3 + 776) = *(void *)(v24 + 776);
        *(_OWORD *)(a3 + 760) = v102;
        *(_OWORD *)(a3 + 744) = v101;
        long long v103 = *(_OWORD *)(v24 + 792);
        *(_OWORD *)(a3 + 808) = *(_OWORD *)(v24 + 808);
        *(_OWORD *)(a3 + 792) = v103;
        memcpy((void *)(a3 + 832), (const void *)(v24 + 832), 0x128uLL);
        long long v104 = *(_OWORD *)(v24 + 1136);
        *(_OWORD *)(a3 + 1152) = *(_OWORD *)(v24 + 1152);
        *(_OWORD *)(a3 + 1136) = v104;
        *(_OWORD *)(a3 + 1176) = *(_OWORD *)(v24 + 1176);
        long long v105 = *(_OWORD *)(v24 + 1208);
        long long v106 = *(_OWORD *)(v24 + 1224);
        long long v107 = *(_OWORD *)(v24 + 1240);
        *(_OWORD *)(a3 + 1192) = *(_OWORD *)(v24 + 1192);
        *(_OWORD *)(a3 + 1240) = v107;
        *(_OWORD *)(a3 + 1224) = v106;
        *(_OWORD *)(a3 + 1208) = v105;
        *(unsigned char *)(a3 + 1256) = *(unsigned char *)(v24 + 1256);
        long long v108 = *(_OWORD *)(v24 + 1272);
        *(_OWORD *)(a3 + 1288) = *(_OWORD *)(v24 + 1288);
        *(_OWORD *)(a3 + 1272) = v108;
        *(_OWORD *)(a3 + 1312) = *(_OWORD *)(v24 + 1312);
        long long v109 = *(_OWORD *)(v24 + 1344);
        long long v110 = *(_OWORD *)(v24 + 1360);
        long long v111 = *(_OWORD *)(v24 + 1376);
        *(_OWORD *)(a3 + 1328) = *(_OWORD *)(v24 + 1328);
        *(_OWORD *)(a3 + 1376) = v111;
        *(_OWORD *)(a3 + 1360) = v110;
        *(_OWORD *)(a3 + 1344) = v109;
        long long v112 = *(_OWORD *)(v24 + 1392);
        long long v113 = *(_OWORD *)(v24 + 1408);
LABEL_94:
        *(_OWORD *)(a3 + 1408) = v113;
        *(_OWORD *)(a3 + 1392) = v112;
        goto LABEL_74;
      }
      double v123 = *(double *)(v19 + 40);
      if (v123 == v17)
      {
        long long v124 = *(_OWORD *)v19;
        long long v125 = *(_OWORD *)(v19 + 16);
        long long v126 = *(_OWORD *)(v19 + 32);
        *(void *)(a3 + 48) = *(void *)(v19 + 48);
        *(_OWORD *)(a3 + 16) = v125;
        *(_OWORD *)(a3 + 32) = v126;
        *(_OWORD *)a3 = v124;
        *(unsigned char *)(a3 + 56) = *(unsigned char *)(v19 + 56);
        long long v127 = *(_OWORD *)(v19 + 72);
        long long v128 = *(_OWORD *)(v19 + 88);
        *(void *)(a3 + 104) = *(void *)(v19 + 104);
        *(_OWORD *)(a3 + 88) = v128;
        *(_OWORD *)(a3 + 72) = v127;
        long long v129 = *(_OWORD *)(v19 + 152);
        long long v130 = *(_OWORD *)(v19 + 168);
        long long v131 = *(_OWORD *)(v19 + 184);
        *(_OWORD *)(a3 + 136) = *(_OWORD *)(v19 + 136);
        *(_OWORD *)(a3 + 184) = v131;
        *(_OWORD *)(a3 + 168) = v130;
        *(_OWORD *)(a3 + 152) = v129;
        *(_OWORD *)(a3 + 120) = *(_OWORD *)(v19 + 120);
        long long v132 = *(_OWORD *)(v19 + 208);
        long long v133 = *(_OWORD *)(v19 + 224);
        *(void *)(a3 + 240) = *(void *)(v19 + 240);
        *(_OWORD *)(a3 + 208) = v132;
        *(_OWORD *)(a3 + 224) = v133;
        long long v134 = *(_OWORD *)(v19 + 272);
        *(_OWORD *)(a3 + 256) = *(_OWORD *)(v19 + 256);
        *(_OWORD *)(a3 + 272) = v134;
        memcpy((void *)(a3 + 296), (const void *)(v19 + 296), 0x129uLL);
        long long v136 = *(_OWORD *)(v19 + 608);
        long long v135 = *(_OWORD *)(v19 + 624);
        *(void *)(a3 + 640) = *(void *)(v19 + 640);
        *(_OWORD *)(a3 + 608) = v136;
        *(_OWORD *)(a3 + 624) = v135;
        long long v138 = *(_OWORD *)(v19 + 672);
        long long v137 = *(_OWORD *)(v19 + 688);
        long long v139 = *(_OWORD *)(v19 + 720);
        *(_OWORD *)(a3 + 704) = *(_OWORD *)(v19 + 704);
        *(_OWORD *)(a3 + 720) = v139;
        *(_OWORD *)(a3 + 672) = v138;
        *(_OWORD *)(a3 + 688) = v137;
        *(_OWORD *)(a3 + 656) = *(_OWORD *)(v19 + 656);
        long long v140 = *(_OWORD *)(v19 + 744);
        long long v141 = *(_OWORD *)(v19 + 760);
        *(void *)(a3 + 776) = *(void *)(v19 + 776);
        *(_OWORD *)(a3 + 760) = v141;
        *(_OWORD *)(a3 + 744) = v140;
        long long v142 = *(_OWORD *)(v19 + 792);
        *(_OWORD *)(a3 + 808) = *(_OWORD *)(v19 + 808);
        *(_OWORD *)(a3 + 792) = v142;
        memcpy((void *)(a3 + 832), (const void *)(v19 + 832), 0x128uLL);
        long long v143 = *(_OWORD *)(v19 + 1136);
        *(_OWORD *)(a3 + 1152) = *(_OWORD *)(v19 + 1152);
        *(_OWORD *)(a3 + 1136) = v143;
        *(_OWORD *)(a3 + 1176) = *(_OWORD *)(v19 + 1176);
        long long v144 = *(_OWORD *)(v19 + 1208);
        long long v145 = *(_OWORD *)(v19 + 1224);
        long long v146 = *(_OWORD *)(v19 + 1240);
        *(_OWORD *)(a3 + 1192) = *(_OWORD *)(v19 + 1192);
        *(_OWORD *)(a3 + 1240) = v146;
        *(_OWORD *)(a3 + 1224) = v145;
        *(_OWORD *)(a3 + 1208) = v144;
        *(unsigned char *)(a3 + 1256) = *(unsigned char *)(v19 + 1256);
        long long v147 = *(_OWORD *)(v19 + 1272);
        *(_OWORD *)(a3 + 1288) = *(_OWORD *)(v19 + 1288);
        *(_OWORD *)(a3 + 1272) = v147;
        *(_OWORD *)(a3 + 1312) = *(_OWORD *)(v19 + 1312);
        long long v148 = *(_OWORD *)(v19 + 1344);
        long long v149 = *(_OWORD *)(v19 + 1360);
        long long v150 = *(_OWORD *)(v19 + 1376);
        *(_OWORD *)(a3 + 1328) = *(_OWORD *)(v19 + 1328);
        *(_OWORD *)(a3 + 1376) = v150;
        *(_OWORD *)(a3 + 1360) = v149;
        *(_OWORD *)(a3 + 1344) = v148;
        long long v112 = *(_OWORD *)(v19 + 1392);
        long long v113 = *(_OWORD *)(v19 + 1408);
        goto LABEL_94;
      }
      if (*(_DWORD *)v19) {
        long long v153 = (_DWORD *)v19;
      }
      else {
        long long v153 = (_DWORD *)v24;
      }
      *(_DWORD *)a3 = *v153;
      *(void *)(a3 + 16) = *(void *)(v19 + 16);
      *(void *)&long long v208 = 0;
      long long v207 = 0u;
      long long v206 = 0u;
      long long v205 = &unk_26CB86970;
      sub_21B6E6680((double *)&v205, v24 + 112);
      uint64_t v254 = 0;
      long long v252 = 0u;
      long long v253 = 0u;
      v251 = &unk_26CB86970;
      sub_21B6E6680((double *)&v251, v19 + 112);
      uint64_t v204 = 0;
      long long v203 = 0u;
      long long v202 = 0u;
      double v154 = *(double *)(v24 + 40);
      double v155 = *(double *)(v19 + 40);
      double v156 = *((double *)a2 + 1);
      if (v156 >= v154 && v155 >= v156)
      {
        if (v154 == v155)
        {
          long long v202 = v206;
          long long v203 = v207;
        }
        else
        {
          double v159 = *((double *)&v206 + 1) * *((double *)&v252 + 1)
               + *(double *)&v206 * *(double *)&v252
               + *(double *)&v207 * *(double *)&v253
               + *((double *)&v207 + 1) * *((double *)&v253 + 1);
          if (fabs(v159) >= 1.0)
          {
            long long v202 = v206;
            long long v203 = v207;
          }
          else
          {
            double v160 = -v159;
            if (v159 >= 0.0) {
              double v160 = *((double *)&v206 + 1) * *((double *)&v252 + 1)
            }
                   + *(double *)&v206 * *(double *)&v252
                   + *(double *)&v207 * *(double *)&v253
                   + *((double *)&v207 + 1) * *((double *)&v253 + 1);
            double v161 = (v156 - v154) / (v155 - v154);
            double v200 = v161;
            double v162 = sqrt(1.0 - v160 * v160);
            if (fabs(v162) >= 2.22044605e-16)
            {
              double v166 = acos(v160);
              long double v167 = sin((1.0 - v200) * v166);
              long double v168 = v200 * v166;
              double v201 = v167 / v162;
              double v169 = sin(v168) / v162;
              uint64_t v170 = 0;
              if (v159 >= 0.0)
              {
                float64x2_t v174 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v201, 0);
                do
                {
                  *(long long *)((char *)&v202 + v170) = (__int128)vmlaq_f64(vmulq_n_f64(*(float64x2_t *)((char *)&v252 + v170), v169), *(float64x2_t *)((char *)&v206 + v170), v174);
                  v170 += 16;
                }
                while (v170 != 32);
              }
              else
              {
                double v171 = -v169;
                float64x2_t v172 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v201, 0);
                do
                {
                  *(long long *)((char *)&v202 + v170) = (__int128)vmlaq_f64(vmulq_n_f64(*(float64x2_t *)((char *)&v252 + v170), v171), *(float64x2_t *)((char *)&v206 + v170), v172);
                  v170 += 16;
                }
                while (v170 != 32);
              }
              double v175 = sqrt(*((double *)&v202 + 1) * *((double *)&v202 + 1)+ *(double *)&v202 * *(double *)&v202+ *(double *)&v203 * *(double *)&v203+ *((double *)&v203 + 1) * *((double *)&v203 + 1));
              if (v175 == 0.0)
              {
                double v176 = 1.0;
                double v177 = 0.0;
                double v178 = 0.0;
                double v179 = 0.0;
              }
              else
              {
                double v177 = *(double *)&v202 / v175;
                double v178 = *((double *)&v202 + 1) / v175;
                double v179 = *(double *)&v203 / v175;
                double v176 = *((double *)&v203 + 1) / v175;
              }
              *(double *)&long long v202 = v177;
              *((double *)&v202 + 1) = v178;
              *(double *)&long long v203 = v179;
              *((double *)&v203 + 1) = v176;
            }
            else
            {
              double v163 = 1.0 - v161;
              uint64_t v164 = 0;
              if (v159 >= 0.0)
              {
                float64x2_t v173 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v163, 0);
                do
                {
                  *(long long *)((char *)&v202 + v164) = (__int128)vmlaq_f64(vmulq_n_f64(*(float64x2_t *)((char *)&v252 + v164), v200), *(float64x2_t *)((char *)&v206 + v164), v173);
                  v164 += 16;
                }
                while (v164 != 32);
              }
              else
              {
                float64x2_t v165 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v163, 0);
                do
                {
                  *(long long *)((char *)&v202 + v164) = (__int128)vmlaq_f64(vmulq_n_f64(*(float64x2_t *)((char *)&v252 + v164), -v200), *(float64x2_t *)((char *)&v206 + v164), v165);
                  v164 += 16;
                }
                while (v164 != 32);
              }
            }
          }
        }
        double v180 = v123 - v84;
        double v181 = v123 - v17;
        double v182 = v17 - v84;
        *(void *)buf = &unk_26CB86850;
        *(_OWORD *)&buf[8] = 0u;
        long long v256 = 0u;
        long long v257 = 0u;
        long long v258 = 0u;
        long long v259 = 0u;
        sub_21B6FBAB8((double *)&v202, (double *)&buf[8]);
        sub_21B6E659C((double *)(a3 + 56), (uint64_t)buf);
        LOBYTE(v240) = 0;
        int64x2_t v241 = vdupq_n_s64(3uLL);
        long long v242 = xmmword_21B6FEA60;
        unint64_t v243 = v24 + 120;
        unint64_t v244 = v24 + 192;
        sub_21B6F9A74((uint64_t *)&v245, a3 + 112, (uint64_t *)&v240);
        *(void *)buf = &unk_26CB86850;
        *(_OWORD *)&buf[8] = 0u;
        long long v256 = 0u;
        long long v257 = 0u;
        long long v258 = 0u;
        long long v259 = 0u;
        long long v184 = (uint64_t *)*((void *)&v247 + 1);
        long long v183 = (uint64_t *)v247;
        if ((void)v247 != *((void *)&v247 + 1))
        {
          long long v185 = &buf[8];
          do
          {
            uint64_t v186 = *v183++;
            *v185++ = v186;
          }
          while (v183 != v184);
        }
        double v187 = v181 / v180;
        double v188 = v182 / v180;
        sub_21B6EA254(&v245);
        LOBYTE(v234) = 0;
        int64x2_t v197 = vdupq_n_s64(3uLL);
        int64x2_t v235 = v197;
        long long v236 = xmmword_21B6FEAA0;
        *(void *)&long long v237 = v24 + 296;
        *((void *)&v237 + 1) = v24 + 416;
        sub_21B6F9A74((uint64_t *)&v240, (uint64_t)buf, (uint64_t *)&v234);
        LOBYTE(v229) = 0;
        int64x2_t v230 = v197;
        v231[0] = xmmword_21B6FEA60;
        *(void *)&v231[1] = &buf[8];
        *((void *)&v231[1] + 1) = (char *)&v259 + 8;
        sub_21B6FA0C4((uint64_t *)&v245, (uint64_t *)&v240, (uint64_t *)&v229);
        LOBYTE(v223) = 1;
        int64x2_t v224 = v197;
        *(_OWORD *)v225 = xmmword_21B6FEAA0;
        *(void *)&v225[16] = a3 + 296;
        v226 = (char *)(a3 + 416);
        sub_21B6EB92C(&v223, (uint64_t *)&v245);
        sub_21B6EA254(&v245);
        sub_21B6EA254(&v240);
        LOBYTE(v240) = 0;
        int64x2_t v241 = v197;
        long long v242 = xmmword_21B6FEAA0;
        unint64_t v243 = v24 + 320;
        unint64_t v244 = v24 + 440;
        LOBYTE(v234) = 0;
        int64x2_t v235 = v197;
        long long v236 = xmmword_21B6FEA60;
        *(void *)&long long v237 = &buf[8];
        *((void *)&v237 + 1) = (char *)&v259 + 8;
        sub_21B6FA1A8((uint64_t *)&v245, (uint64_t *)&v240, (uint64_t *)&v234);
        LOBYTE(v229) = 1;
        int64x2_t v230 = v197;
        v231[0] = xmmword_21B6FEAA0;
        *(void *)&v231[1] = a3 + 320;
        *((void *)&v231[1] + 1) = a3 + 440;
        sub_21B6EB92C(&v229, (uint64_t *)&v245);
        sub_21B6EA254(&v245);
        LOBYTE(v240) = 0;
        int64x2_t v241 = v197;
        long long v242 = xmmword_21B6FEAA0;
        unint64_t v243 = v24 + 440;
        unint64_t v244 = v24 + 560;
        sub_21B6F9A74((uint64_t *)&v245, (uint64_t)buf, (uint64_t *)&v240);
        LOBYTE(v234) = 1;
        int64x2_t v235 = v197;
        long long v236 = xmmword_21B6FEAA0;
        *(void *)&long long v237 = a3 + 440;
        *((void *)&v237 + 1) = a3 + 560;
        sub_21B6EB92C(&v234, (uint64_t *)&v245);
        sub_21B6EA254(&v245);
        for (uint64_t i = 0; i != 24; i += 8)
          *(double *)(a3 + 256 + i) = v188 * *(double *)(v19 + 256 + i) + v187 * *(double *)(v24 + 256 + i);
        int64x2_t v198 = vdupq_n_s64(3uLL);
        LOBYTE(v240) = 0;
        int64x2_t v241 = v198;
        long long v242 = xmmword_21B6FEAA0;
        unint64_t v243 = v24 + 464;
        unint64_t v244 = v24 + 584;
        sub_21B6FA2A0((uint64_t)&v245, &v240);
        LOBYTE(v234) = 0;
        int64x2_t v235 = v198;
        long long v236 = xmmword_21B6FEAA0;
        *(void *)&long long v237 = v19 + 464;
        *((void *)&v237 + 1) = v19 + 584;
        sub_21B6FA2A0((uint64_t)&v240, &v234);
        v234 = &unk_26CB86850;
        int64x2_t v235 = 0u;
        long long v236 = 0u;
        long long v237 = 0u;
        long long v238 = 0u;
        long long v239 = 0u;
        for (uint64_t j = 8; j != 80; j += 8)
          *(double *)((char *)&v234 + j) = v188 * *(double *)((char *)&v240 + j) + v187 * *(double *)((char *)&v245 + j);
        sub_21B6FA358((uint64_t)&v229, (double *)&v234);
        uint64_t v191 = 0;
        *(int64x2_t *)(a3 + 464) = v230;
        *(void *)(a3 + 480) = *(void *)&v231[0];
        *(_OWORD *)(a3 + 512) = *(_OWORD *)((char *)v231 + 8);
        uint64_t v192 = v233;
        *(void *)(a3 + 528) = *((void *)&v231[1] + 1);
        *(_OWORD *)(a3 + 560) = v232;
        *(void *)(a3 + 576) = v192;
        do
        {
          *(double *)(a3 + 1136 + v191) = v188 * *(double *)(v19 + 1136 + v191) + v187 * *(double *)(v24 + 1136 + v191);
          v191 += 8;
        }
        while (v191 != 24);
        sub_21B6FA3E4((uint64_t)&v229, (double *)(v24 + 1168));
        sub_21B6FA3E4((uint64_t)&v223, (double *)(v19 + 1168));
        v217 = &unk_26CB86850;
        int64x2_t v218 = 0u;
        long long v219 = 0u;
        long long v220 = 0u;
        long long v221 = 0u;
        long long v222 = 0u;
        for (uint64_t k = 8; k != 80; k += 8)
          *(double *)((char *)&v217 + k) = v188 * *(double *)((char *)&v223 + k) + v187 * *(double *)((char *)&v229 + k);
        sub_21B6FA358((uint64_t)&v211, (double *)&v217);
        uint64_t v68 = a3 + 1168;
        *(_OWORD *)(a3 + 1192) = v213;
        *(_OWORD *)(a3 + 1208) = v214;
        *(_OWORD *)(a3 + 1224) = v215;
        *(_OWORD *)(a3 + 1240) = v216;
        long long v69 = v212;
LABEL_73:
        *(_OWORD *)(v68 + 8) = v69;
LABEL_74:
        BOOL result = 1;
        *(unsigned char *)(a3 + 1424) = 1;
        goto LABEL_51;
      }
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
      }
      long long v28 = qword_267C5A9E0;
      if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
      {
        uint64_t v158 = *((void *)a2 + 1);
        *(_DWORD *)buf = 134349056;
        *(void *)&uint8_t buf[4] = v158;
        long long v31 = "CLVLF,interpolateVioDataAt,mach::SphericalLinearInterpolator::interpolate error,machAbsTime,%{public}.3lf";
        goto LABEL_49;
      }
LABEL_50:
      BOOL result = 0;
      goto LABEL_51;
    }
LABEL_45:
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    long long v28 = qword_267C5A9E0;
    BOOL result = os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR);
    if (result)
    {
      uint64_t v48 = *((void *)a2 + 1);
      *(_DWORD *)buf = 134349056;
      *(void *)&uint8_t buf[4] = v48;
      long long v31 = "CLVLF,interpolateVioDataAt,util::binary_find_nearest error,machAbsTime,%{public}.3lf";
      goto LABEL_49;
    }
    goto LABEL_51;
  }
  if (v13 < v11 + -0.6) {
    goto LABEL_50;
  }
  long long v26 = *a2;
  *(void *)(a3 + 48) = *((void *)a2 + 2);
  *uint64_t v12 = v26;
  *(unsigned char *)(a3 + 1424) = 0;
  uint64_t v27 = *(void *)(a1 + 16);
  if (0xED6866F8D962AE7BLL * ((v27 - *(void *)(a1 + 8)) >> 3) > 1)
  {
    BOOL result = sub_21B6FA03C(v27 - 2864, v27 - 1432);
    if (!result) {
      goto LABEL_51;
    }
    double v32 = *(double *)(v27 - 1392);
    double v33 = *(double *)(v27 - 2824);
    double v34 = v32 - v33;
    double v35 = *((double *)a2 + 1);
    double v36 = v35 - v33;
    if (*(_DWORD *)(v27 - 2864)) {
      long long v37 = (_DWORD *)(v27 - 2864);
    }
    else {
      long long v37 = (_DWORD *)(v27 - 1432);
    }
    *(_DWORD *)a3 = *v37;
    *(void *)(a3 + 16) = *(void *)(v27 - 1416);
    LOBYTE(v245) = 0;
    int64x2_t v246 = vdupq_n_s64(3uLL);
    long long v247 = xmmword_21B6FEA60;
    *(void *)&long long v248 = v27 - 2744;
    *((void *)&v248 + 1) = v27 - 2672;
    sub_21B6F9A74((uint64_t *)buf, v27 - 1320, (uint64_t *)&v245);
    unint64_t v243 = 0;
    long long v242 = 0u;
    int64x2_t v241 = 0u;
    v240 = &unk_26CB86970;
    sub_21B6EAFB8((double *)v256, (double *)v241.i64);
    double v38 = *(double *)&v241.i64[1];
    double v39 = *(double *)v241.i64;
    v40.i64[0] = *((void *)&v242 + 1);
    double v41 = *(double *)&v242;
    double v42 = *(double *)&v241.i64[1] * *(double *)&v241.i64[1] + *(double *)v241.i64 * *(double *)v241.i64 + v41 * v41;
    double v43 = v42 + *((double *)&v242 + 1) * *((double *)&v242 + 1);
    double v44 = sqrt(v43);
    double v199 = v35;
    if (v44 == 0.0)
    {
      int64x2_t v241 = 0uLL;
      v40.i64[0] = 1.0;
      double v41 = 0.0;
      double v38 = 0.0;
      double v39 = 0.0;
      *(void *)&long long v242 = 0;
    }
    else
    {
      if (v44 == 1.0)
      {
LABEL_57:
        double v49 = v34;
        double v50 = v36 / v34;
        long long v252 = 0u;
        long long v253 = 0u;
        v251 = &unk_26CB868B0;
        uint64_t v254 = 0;
        double v51 = sqrt(v43);
        if (v51 == 0.0) {
          goto LABEL_58;
        }
        int8x16_t v196 = v40;
        if (v51 == 1.0)
        {
          double v114 = sqrt(v42);
          if (v114 <= 1.0) {
            double v115 = v114;
          }
          else {
            double v115 = 1.0;
          }
          long double v116 = asin(v115);
          double v52 = v49;
          if (v116 != 0.0)
          {
            v118.f64[0] = NAN;
            v118.f64[1] = NAN;
            v117.i64[0] = 1.0;
            v117.i64[0] = vbslq_s8((int8x16_t)vnegq_f64(v118), v117, v196).u64[0];
            double v119 = -v39;
            double v120 = -v38;
            double v121 = -v41;
            double v122 = fabs(*(double *)v196.i64);
            double v53 = v199;
            if (fabs(v116) >= 2.22044605e-16)
            {
              *(double *)&long long v252 = *(double *)v117.i64 * (v119 / v115);
              *((double *)&v252 + 1) = *(double *)v117.i64 * (v120 / v115);
              *(double *)&long long v253 = *(double *)v117.i64 * (v121 / v115);
              long double v116 = v115;
            }
            else
            {
              *(double *)&long long v252 = *(double *)v117.i64 * (v119 / v116);
              *((double *)&v252 + 1) = *(double *)v117.i64 * (v120 / v116);
              *(double *)&long long v253 = *(double *)v117.i64 * (v121 / v116);
            }
            long double v152 = atan2(v116, v122);
            *((double *)&v253 + 1) = v152 + v152;
            goto LABEL_61;
          }
          long long v252 = 0x3FF0000000000000uLL;
          long long v253 = 0uLL;
LABEL_60:
          double v53 = v199;
LABEL_61:
          sub_21B6EA254(buf);
          *((double *)&v253 + 1) = v50 * *((double *)&v253 + 1);
          *(void *)buf = &unk_26CB86850;
          *((void *)&v259 + 1) = 0;
          __double2 v54 = __sincos_stret(*((double *)&v253 + 1));
          double v55 = (1.0 - v54.__cosval) * (*(double *)&v252 * *((double *)&v252 + 1));
          double v56 = (1.0 - v54.__cosval) * (*(double *)&v252 * *(double *)&v253);
          double v57 = (1.0 - v54.__cosval) * (*((double *)&v252 + 1) * *(double *)&v253);
          *(double *)&buf[8] = v54.__cosval + (1.0 - v54.__cosval) * (*(double *)&v252 * *(double *)&v252);
          *(double *)&buf[16] = v54.__sinval * *(double *)&v253 + v55;
          *(double *)&long long v256 = v56 - v54.__sinval * *((double *)&v252 + 1);
          *((double *)&v256 + 1) = v55 - v54.__sinval * *(double *)&v253;
          *(double *)&long long v257 = v54.__cosval + (1.0 - v54.__cosval) * (*((double *)&v252 + 1) * *((double *)&v252 + 1));
          *((double *)&v257 + 1) = v54.__sinval * *(double *)&v252 + v57;
          *(double *)&long long v258 = v54.__sinval * *((double *)&v252 + 1) + v56;
          *((double *)&v258 + 1) = v57 - v54.__sinval * *(double *)&v252;
          *(double *)&long long v259 = v54.__cosval + (1.0 - v54.__cosval) * (*(double *)&v253 * *(double *)&v253);
          sub_21B6E7E1C((double *)buf, (double *)(v27 - 2752), (uint64_t)&v245);
          sub_21B6E659C((double *)(a3 + 56), (uint64_t)&v245);
          LOBYTE(v234) = 0;
          int64x2_t v235 = vdupq_n_s64(3uLL);
          long long v236 = xmmword_21B6FEA60;
          *(void *)&long long v237 = v27 - 1312;
          *((void *)&v237 + 1) = v27 - 1240;
          sub_21B6F9A74((uint64_t *)&v240, a3 + 112, (uint64_t *)&v234);
          v245 = &unk_26CB86850;
          int64x2_t v246 = 0u;
          long long v247 = 0u;
          long long v248 = 0u;
          long long v249 = 0u;
          long long v250 = 0u;
          uint64_t v59 = (uint64_t *)*((void *)&v242 + 1);
          long long v58 = (uint64_t *)v242;
          if ((void)v242 != *((void *)&v242 + 1))
          {
            double v60 = &v246;
            do
            {
              uint64_t v61 = *v58++;
              v60->i64[0] = v61;
              double v60 = (int64x2_t *)((char *)v60 + 8);
            }
            while (v58 != v59);
          }
          double v62 = (v32 - v53) / v52;
          sub_21B6EA254(&v240);
          LOBYTE(v229) = 0;
          int64x2_t v194 = vdupq_n_s64(3uLL);
          int64x2_t v230 = v194;
          v231[0] = xmmword_21B6FEAA0;
          *(void *)&v231[1] = v27 - 1136;
          *((void *)&v231[1] + 1) = v27 - 1016;
          sub_21B6F9A74((uint64_t *)&v234, (uint64_t)&v245, (uint64_t *)&v229);
          LOBYTE(v223) = 0;
          int64x2_t v224 = v194;
          *(_OWORD *)v225 = xmmword_21B6FEA60;
          *(void *)&v225[16] = &v246;
          v226 = (char *)&v250 + 8;
          sub_21B6FA0C4((uint64_t *)&v240, (uint64_t *)&v234, &v223);
          LOBYTE(v217) = 1;
          int64x2_t v218 = v194;
          long long v219 = xmmword_21B6FEAA0;
          *(void *)&long long v220 = a3 + 296;
          *((void *)&v220 + 1) = a3 + 416;
          sub_21B6EB92C(&v217, (uint64_t *)&v240);
          sub_21B6EA254(&v240);
          sub_21B6EA254(&v234);
          LOBYTE(v234) = 0;
          int64x2_t v235 = v194;
          long long v236 = xmmword_21B6FEAA0;
          *(void *)&long long v237 = v27 - 1112;
          *((void *)&v237 + 1) = v27 - 992;
          LOBYTE(v229) = 0;
          int64x2_t v230 = v194;
          v231[0] = xmmword_21B6FEA60;
          *(void *)&v231[1] = &v246;
          *((void *)&v231[1] + 1) = (char *)&v250 + 8;
          sub_21B6FA1A8((uint64_t *)&v240, (uint64_t *)&v234, (uint64_t *)&v229);
          LOBYTE(v223) = 1;
          int64x2_t v224 = v194;
          *(_OWORD *)v225 = xmmword_21B6FEAA0;
          *(void *)&v225[16] = a3 + 320;
          v226 = (char *)(a3 + 440);
          sub_21B6EB92C(&v223, (uint64_t *)&v240);
          sub_21B6EA254(&v240);
          LOBYTE(v234) = 0;
          int64x2_t v235 = v194;
          long long v236 = xmmword_21B6FEAA0;
          *(void *)&long long v237 = v27 - 992;
          *((void *)&v237 + 1) = v27 - 872;
          sub_21B6F9A74((uint64_t *)&v240, (uint64_t)&v245, (uint64_t *)&v234);
          LOBYTE(v229) = 1;
          int64x2_t v230 = v194;
          v231[0] = xmmword_21B6FEAA0;
          *(void *)&v231[1] = a3 + 440;
          *((void *)&v231[1] + 1) = a3 + 560;
          sub_21B6EB92C(&v229, (uint64_t *)&v240);
          sub_21B6EA254(&v240);
          for (uint64_t m = 0; m != 24; m += 8)
            *(double *)(a3 + 256 + m) = v50 * *(double *)(v27 + m - 1176) + v62 * *(double *)(v27 + m - 2608);
          int64x2_t v195 = vdupq_n_s64(3uLL);
          LOBYTE(v234) = 0;
          int64x2_t v235 = v195;
          long long v236 = xmmword_21B6FEAA0;
          *(void *)&long long v237 = v27 - 2400;
          *((void *)&v237 + 1) = v27 - 2280;
          sub_21B6FA2A0((uint64_t)&v240, &v234);
          LOBYTE(v229) = 0;
          int64x2_t v230 = v195;
          v231[0] = xmmword_21B6FEAA0;
          *(void *)&v231[1] = v27 - 968;
          *((void *)&v231[1] + 1) = v27 - 848;
          sub_21B6FA2A0((uint64_t)&v234, &v229);
          v229 = &unk_26CB86850;
          int64x2_t v230 = 0u;
          memset(v231, 0, sizeof(v231));
          long long v232 = 0u;
          long long v233 = 0u;
          for (uint64_t n = 8; n != 80; n += 8)
            *(double *)((char *)&v229 + n) = v50 * *(double *)((char *)&v234 + n) + v62 * *(double *)((char *)&v240 + n);
          sub_21B6FA358((uint64_t)&v223, (double *)&v229);
          uint64_t v65 = 0;
          *(int64x2_t *)(a3 + 464) = v224;
          uint64_t v66 = v226;
          *(void *)(a3 + 480) = *(void *)v225;
          *(_OWORD *)(a3 + 512) = *(_OWORD *)&v225[8];
          *(void *)(a3 + 528) = v66;
          *(_OWORD *)(a3 + 560) = v227;
          *(void *)(a3 + 576) = v228;
          do
          {
            *(double *)(a3 + 1136 + v65) = v50 * *(double *)(v27 + v65 - 296) + v62 * *(double *)(v27 + v65 - 1728);
            v65 += 8;
          }
          while (v65 != 24);
          sub_21B6FA3E4((uint64_t)&v223, (double *)(v27 - 1696));
          sub_21B6FA3E4((uint64_t)&v217, (double *)(v27 - 264));
          double v211 = &unk_26CB86850;
          long long v212 = 0u;
          long long v213 = 0u;
          long long v214 = 0u;
          long long v215 = 0u;
          long long v216 = 0u;
          for (iuint64_t i = 8; ii != 80; ii += 8)
            *(double *)((char *)&v211 + ii) = v50 * *(double *)((char *)&v217 + ii)
                                            + v62 * *(double *)((char *)&v223 + ii);
          sub_21B6FA358((uint64_t)&v205, (double *)&v211);
          uint64_t v68 = a3 + 1168;
          *(_OWORD *)(a3 + 1192) = v207;
          *(_OWORD *)(a3 + 1208) = v208;
          *(_OWORD *)(a3 + 1224) = v209;
          *(_OWORD *)(a3 + 1240) = v210;
          long long v69 = v206;
          goto LABEL_73;
        }
        double v70 = v39 / v51;
        double v71 = v38 / v51;
        double v72 = v41 / v51;
        double v73 = sqrt(v71 * v71 + v70 * v70 + v72 * v72);
        double v74 = v73 <= 1.0 ? v73 : 1.0;
        long double v75 = asin(v74);
        if (v75 == 0.0)
        {
LABEL_58:
          long long v252 = 0x3FF0000000000000uLL;
          long long v253 = 0uLL;
        }
        else
        {
          v77.i64[1] = v196.i64[1];
          *(double *)v77.i64 = *(double *)v196.i64 / v51;
          v78.f64[0] = NAN;
          v78.f64[1] = NAN;
          v76.i64[0] = 1.0;
          *(void *)&double v79 = vbslq_s8((int8x16_t)vnegq_f64(v78), v76, v77).u64[0];
          double v80 = -v70;
          double v81 = -v71;
          double v82 = -v72;
          double v83 = fabs(*(double *)v196.i64 / v51);
          if (fabs(v75) >= 2.22044605e-16)
          {
            *(double *)&long long v252 = v79 * (v80 / v74);
            *((double *)&v252 + 1) = v79 * (v81 / v74);
            *(double *)&long long v253 = v79 * (v82 / v74);
            long double v75 = v74;
          }
          else
          {
            *(double *)&long long v252 = v79 * (v80 / v75);
            *((double *)&v252 + 1) = v79 * (v81 / v75);
            *(double *)&long long v253 = v79 * (v82 / v75);
          }
          long double v151 = atan2(v75, v83);
          *((double *)&v253 + 1) = v151 + v151;
        }
        double v52 = v49;
        goto LABEL_60;
      }
      double v39 = *(double *)v241.i64 / v44;
      double v38 = *(double *)&v241.i64[1] / v44;
      *(double *)v241.i64 = *(double *)v241.i64 / v44;
      *(double *)&v241.i64[1] = *(double *)&v241.i64[1] / v44;
      double v41 = *(double *)&v242 / v44;
      *(double *)&long long v242 = *(double *)&v242 / v44;
      *(double *)v40.i64 = *((double *)&v242 + 1) / v44;
    }
    *((void *)&v242 + 1) = v40.i64[0];
    double v42 = v38 * v38 + v39 * v39 + v41 * v41;
    double v43 = v42 + *(double *)v40.i64 * *(double *)v40.i64;
    goto LABEL_57;
  }
  if (qword_267C5A9D8 != -1) {
    dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
  }
  long long v28 = qword_267C5A9E0;
  BOOL result = os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR);
  if (result)
  {
    uint64_t v30 = *((void *)a2 + 1);
    *(_DWORD *)buf = 134349056;
    *(void *)&uint8_t buf[4] = v30;
    long long v31 = "CLVLF,extrapolateVioDataAt,Not enough VIO data,machAbsTime,%{public}.3lf";
LABEL_49:
    _os_log_impl(&dword_21B6E4000, v28, OS_LOG_TYPE_ERROR, v31, buf, 0xCu);
    goto LABEL_50;
  }
LABEL_51:
  if ((v6 & 1) == 0) {
    atomic_store(0, (unsigned __int8 *)(a1 + 1));
  }
  return result;
}

void sub_21B6F0040(uint64_t a1, double a2)
{
  unsigned __int8 v4 = atomic_exchange_explicit((atomic_uchar *volatile)(a1 + 1), 1u, memory_order_acquire);
  if ((v4 & 1) == 0)
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    uint64_t v5 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v39 = 0;
      _os_log_impl(&dword_21B6E4000, v5, OS_LOG_TYPE_ERROR, "CLVLF,removeAllVioDataExceptLastNSeconds,Called without locking vision buffers", v39, 2u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  if (v7 != v6)
  {
    double v8 = *(double *)(v6 - 1392) - a2;
    while (*(double *)(v7 + 40) >= v8)
    {
      v7 += 1432;
      if (v7 == v6)
      {
        uint64_t v7 = *(void *)(a1 + 16);
        goto LABEL_17;
      }
    }
    if (v7 != v6)
    {
      uint64_t v9 = v7 + 1432;
      if (v7 + 1432 != v6)
      {
        do
        {
          if (*(double *)(v9 + 40) >= v8)
          {
            long long v10 = *(_OWORD *)v9;
            long long v11 = *(_OWORD *)(v9 + 16);
            long long v12 = *(_OWORD *)(v9 + 32);
            *(void *)(v7 + 48) = *(void *)(v9 + 48);
            *(_OWORD *)(v7 + 16) = v11;
            *(_OWORD *)(v7 + 32) = v12;
            *(_OWORD *)uint64_t v7 = v10;
            *(unsigned char *)(v7 + 56) = *(unsigned char *)(v9 + 56);
            long long v13 = *(_OWORD *)(v9 + 72);
            long long v14 = *(_OWORD *)(v9 + 88);
            *(void *)(v7 + 104) = *(void *)(v9 + 104);
            *(_OWORD *)(v7 + 88) = v14;
            *(_OWORD *)(v7 + 72) = v13;
            long long v15 = *(_OWORD *)(v9 + 152);
            long long v16 = *(_OWORD *)(v9 + 168);
            long long v17 = *(_OWORD *)(v9 + 184);
            *(_OWORD *)(v7 + 136) = *(_OWORD *)(v9 + 136);
            *(_OWORD *)(v7 + 184) = v17;
            *(_OWORD *)(v7 + 168) = v16;
            *(_OWORD *)(v7 + 152) = v15;
            *(_OWORD *)(v7 + 120) = *(_OWORD *)(v9 + 120);
            long long v18 = *(_OWORD *)(v9 + 208);
            long long v19 = *(_OWORD *)(v9 + 224);
            *(void *)(v7 + 240) = *(void *)(v9 + 240);
            *(_OWORD *)(v7 + 208) = v18;
            *(_OWORD *)(v7 + 224) = v19;
            long long v20 = *(_OWORD *)(v9 + 272);
            *(_OWORD *)(v7 + 256) = *(_OWORD *)(v9 + 256);
            *(_OWORD *)(v7 + 272) = v20;
            memcpy((void *)(v7 + 296), (const void *)(v9 + 296), 0x129uLL);
            long long v22 = *(_OWORD *)(v9 + 608);
            long long v21 = *(_OWORD *)(v9 + 624);
            *(void *)(v7 + 640) = *(void *)(v9 + 640);
            *(_OWORD *)(v7 + 608) = v22;
            *(_OWORD *)(v7 + 624) = v21;
            long long v24 = *(_OWORD *)(v9 + 672);
            long long v23 = *(_OWORD *)(v9 + 688);
            long long v25 = *(_OWORD *)(v9 + 720);
            *(_OWORD *)(v7 + 704) = *(_OWORD *)(v9 + 704);
            *(_OWORD *)(v7 + 720) = v25;
            *(_OWORD *)(v7 + 672) = v24;
            *(_OWORD *)(v7 + 688) = v23;
            *(_OWORD *)(v7 + 656) = *(_OWORD *)(v9 + 656);
            long long v26 = *(_OWORD *)(v9 + 744);
            long long v27 = *(_OWORD *)(v9 + 760);
            *(void *)(v7 + 776) = *(void *)(v9 + 776);
            *(_OWORD *)(v7 + 760) = v27;
            *(_OWORD *)(v7 + 744) = v26;
            long long v28 = *(_OWORD *)(v9 + 792);
            *(_OWORD *)(v7 + 808) = *(_OWORD *)(v9 + 808);
            *(_OWORD *)(v7 + 792) = v28;
            memcpy((void *)(v7 + 832), (const void *)(v9 + 832), 0x128uLL);
            long long v29 = *(_OWORD *)(v9 + 1136);
            *(_OWORD *)(v7 + 1152) = *(_OWORD *)(v9 + 1152);
            *(_OWORD *)(v7 + 1136) = v29;
            *(_OWORD *)(v7 + 1176) = *(_OWORD *)(v9 + 1176);
            long long v30 = *(_OWORD *)(v9 + 1224);
            long long v31 = *(_OWORD *)(v9 + 1240);
            long long v32 = *(_OWORD *)(v9 + 1208);
            *(_OWORD *)(v7 + 1192) = *(_OWORD *)(v9 + 1192);
            *(_OWORD *)(v7 + 1240) = v31;
            *(_OWORD *)(v7 + 1224) = v30;
            *(_OWORD *)(v7 + 1208) = v32;
            *(unsigned char *)(v7 + 1256) = *(unsigned char *)(v9 + 1256);
            long long v33 = *(_OWORD *)(v9 + 1272);
            *(_OWORD *)(v7 + 1288) = *(_OWORD *)(v9 + 1288);
            *(_OWORD *)(v7 + 1272) = v33;
            *(_OWORD *)(v7 + 1312) = *(_OWORD *)(v9 + 1312);
            long long v34 = *(_OWORD *)(v9 + 1344);
            long long v35 = *(_OWORD *)(v9 + 1360);
            long long v36 = *(_OWORD *)(v9 + 1376);
            *(_OWORD *)(v7 + 1328) = *(_OWORD *)(v9 + 1328);
            *(_OWORD *)(v7 + 1376) = v36;
            *(_OWORD *)(v7 + 1360) = v35;
            *(_OWORD *)(v7 + 1344) = v34;
            long long v37 = *(_OWORD *)(v9 + 1392);
            long long v38 = *(_OWORD *)(v9 + 1408);
            *(unsigned char *)(v7 + 1424) = *(unsigned char *)(v9 + 1424);
            *(_OWORD *)(v7 + 1408) = v38;
            *(_OWORD *)(v7 + 1392) = v37;
            v7 += 1432;
          }
          v9 += 1432;
        }
        while (v9 != v6);
        uint64_t v6 = *(void *)(a1 + 16);
      }
    }
LABEL_17:
    sub_21B6FA474((void *)(a1 + 8), v7, v6);
  }
  if ((v4 & 1) == 0) {
    atomic_store(0, (unsigned __int8 *)(a1 + 1));
  }
}

void sub_21B6F0310(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  if (!*a1)
  {
    double v6 = *((double *)a1 + 1444);
    double v7 = vabdd_f64(*(double *)(a3 + 32), v6);
    if (v6 <= 0.0 || v7 > 24.0)
    {
      if (v6 > 0.0)
      {
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
        }
        uint64_t v9 = qword_267C5A9E0;
        if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = *(void *)(a3 + 32);
          int v11 = *a1;
          uint64_t v12 = *((void *)a1 + 1444);
          *(_DWORD *)buf = 134349568;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&buf[12] = 1026;
          *(_DWORD *)&buf[14] = v11;
          *(_WORD *)&buf[18] = 2050;
          *(void *)&buf[20] = v12;
          _os_log_impl(&dword_21B6E4000, v9, OS_LOG_TYPE_ERROR, "CLVLF,pushLocation,Filter reset,this should not happen,machAbsTime,%{public}.3lf,activated,%{public}d,lastValidVlf,%{public}.3lf", buf, 0x1Cu);
        }
        sub_21B6EBAC4((atomic_uchar *)a1 + 1);
        sub_21B6EBAFC((uint64_t)a1, 1);
        atomic_store(0, a1 + 1);
      }
      return;
    }
  }
  char v56 = 1;
  sub_21B6EAB50((uint64_t)buf);
  sub_21B6EA464((uint64_t)v98);
  sub_21B6E9A24(a2, a3, &v56, (uint64_t)v57);
  *(_OWORD *)buf = *(_OWORD *)v57;
  *(_OWORD *)&buf[16] = *(_OWORD *)&v57[16];
  long long v79 = v59;
  long long v80 = v60;
  long long v81 = v61;
  long long v82 = v62;
  unsigned __int8 v86 = v66;
  long long v84 = v64;
  long long v85 = v65;
  long long v83 = v63;
  long long v87 = v67;
  long long v88 = v68;
  long long v89 = v69;
  long long v90 = v70;
  long long v93 = v73;
  long long v94 = v74;
  long long v91 = v71;
  long long v92 = v72;
  uint64_t v97 = v77;
  long long v95 = v75;
  long long v96 = v76;
  if (!v56)
  {
    sub_21B6EBAC4((atomic_uchar *)a1 + 1);
    if (sub_21B6EE8F4((uint64_t)a1, (long long *)&buf[8], (uint64_t)v98)) {
      sub_21B6F0040((uint64_t)a1, 2.4);
    }
    atomic_store(0, a1 + 1);
    if (*(_DWORD *)buf == 11 || *(_DWORD *)buf == 1)
    {
      if (*(double *)&buf[16] <= 0.0)
      {
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
        }
        double v41 = qword_267C5A9E0;
        if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
        {
LABEL_54:
          uint64_t v42 = qword_267C5A9E0;
          if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR)) {
            return;
          }
          uint64_t v43 = *((void *)a1 + 8);
          if (*((void *)a1 + 7) == v43)
          {
            uint64_t v45 = *((void *)a1 + 845);
            if (*((void *)a1 + 844) == v45)
            {
              unint64_t v46 = 0xBFF0000000000000;
              goto LABEL_60;
            }
            double v44 = (unint64_t *)(v45 - 2160);
          }
          else
          {
            double v44 = (unint64_t *)(v43 - 1776);
          }
          unint64_t v46 = *v44;
LABEL_60:
          *(_DWORD *)double v57 = 134349569;
          *(void *)&v57[4] = *(void *)&buf[16];
          *(_WORD *)&v57[12] = 2050;
          *(void *)&v57[14] = v46;
          *(_WORD *)&v57[22] = 1025;
          *(_DWORD *)&v57[24] = *(_DWORD *)buf;
          long long v15 = "CLVLF,pushLocation,Invalid measurement,machAbsTime,%{public}.3lf,prevMachAbsTime,%{public}.3lf,locationType,%{private}d";
          long long v16 = v42;
          uint32_t v17 = 28;
          goto LABEL_61;
        }
        *(_WORD *)double v57 = 0;
        _os_log_impl(&dword_21B6E4000, v41, OS_LOG_TYPE_DEBUG, "CLVLF,isValid,Invalid CL,maybe a simulated location", v57, 2u);
      }
      else
      {
        unint64_t v20 = *((void *)a1 + 7);
        unint64_t v18 = *((void *)a1 + 8);
        long long v19 = a1 + 56;
        if (v20 == v18 || *(double *)(v18 - 1776) < *(double *)&buf[16])
        {
          uint64_t v21 = *((void *)a1 + 845);
          if ((*((void *)a1 + 844) == v21 || *(double *)(v21 - 2160) < *(double *)&buf[16])
            && (*(double *)&v83 > 0.0 || *((double *)&v83 + 1) > 0.0))
          {
            BOOL v23 = ((uint64_t)v83 < 0
                || (((unint64_t)v83 & 0x7FFFFFFFFFFFFFFFLL) - 0x10000000000000) >> 53 > 0x3FE)
               && (unint64_t)(v83 - 1) > 0xFFFFFFFFFFFFELL;
            if (!v23 && *(double *)&v83 < 4.0) {
              *(void *)&long long v83 = 0x4010000000000000;
            }
            long long v24 = *(_OWORD *)&buf[16];
            *(_OWORD *)(a1 + 13272) = *(_OWORD *)buf;
            *(_OWORD *)(a1 + 13288) = v24;
            long long v25 = v80;
            *((_OWORD *)a1 + 832) = v79;
            *((_OWORD *)a1 + 833) = v25;
            long long v26 = v82;
            *(_OWORD *)(a1 + 13352) = v81;
            *(_OWORD *)(a1 + 13368) = v26;
            long long v27 = v83;
            long long v28 = v84;
            long long v29 = v85;
            a1[13432] = v86;
            *(_OWORD *)(a1 + 13400) = v28;
            *(_OWORD *)(a1 + 13416) = v29;
            *(_OWORD *)(a1 + 13384) = v27;
            long long v30 = v88;
            *(_OWORD *)(a1 + 13448) = v87;
            *(_OWORD *)(a1 + 13464) = v30;
            long long v31 = v89;
            *((_OWORD *)a1 + 844) = v90;
            *((_OWORD *)a1 + 843) = v31;
            long long v32 = v94;
            *(_OWORD *)(a1 + 13560) = v93;
            *(_OWORD *)(a1 + 13576) = v32;
            long long v33 = v95;
            long long v34 = v92;
            *(_OWORD *)(a1 + 13528) = v91;
            *(_OWORD *)(a1 + 13544) = v34;
            long long v35 = v96;
            *((void *)a1 + 1703) = v97;
            *(_OWORD *)(a1 + 13592) = v33;
            *(_OWORD *)(a1 + 13608) = v35;
            if (v20 != v18)
            {
              double v36 = *(double *)(v18 - 1776) - *(double *)(v20 + 16);
              unint64_t v20 = v18;
              if (v36 >= 10.0)
              {
                if (qword_267C5A9D8 != -1) {
                  dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
                }
                long long v37 = qword_267C5A9E0;
                if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
                {
                  double v38 = (double)(unint64_t)(*((void *)a1 + 8) - *((void *)a1 + 7)) * 0.000000953674316;
                  *(_DWORD *)double v57 = 134349569;
                  *(void *)&v57[4] = *(void *)&buf[16];
                  *(_WORD *)&v57[12] = 2050;
                  *(double *)&v57[14] = v36;
                  *(_WORD *)&v57[22] = 2049;
                  *(double *)&v57[24] = v38;
                  _os_log_impl(&dword_21B6E4000, v37, OS_LOG_TYPE_DEBUG, "CLVLF,pushLocation,LOC buffer reached its maximum size,machAbsTime,%{public}.3lf,sizeInSec,%{public}.3lf,sizeInMB,%{private}.3lf", v57, 0x20u);
                }
                unint64_t v20 = *((void *)a1 + 7);
                uint64_t v39 = *((void *)a1 + 8);
                if (v20 != v39)
                {
                  double v40 = *(double *)(v20 + 16) + 1.0;
                  while (*(double *)(v20 + 16) >= v40)
                  {
                    v20 += 1792;
                    if (v20 == v39)
                    {
                      unint64_t v20 = *((void *)a1 + 8);
                      goto LABEL_70;
                    }
                  }
                  if (v20 != v39)
                  {
                    uint64_t v47 = v20 + 1792;
                    if (v20 + 1792 != v39)
                    {
                      do
                      {
                        if (*(double *)(v47 + 16) >= v40)
                        {
                          sub_21B6F7D88(v20, v47);
                          v20 += 1792;
                        }
                        v47 += 1792;
                      }
                      while (v47 != v39);
                      uint64_t v39 = *((void *)a1 + 8);
                    }
                  }
LABEL_70:
                  sub_21B6F84C8((uint64_t)(a1 + 56), v20, v39);
                  unint64_t v20 = *((void *)a1 + 8);
                }
              }
            }
            unint64_t v48 = *((void *)a1 + 9);
            if (v20 >= v48)
            {
              uint64_t v50 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v20 - *v19) >> 8);
              if ((unint64_t)(v50 + 1) > 0x24924924924924) {
                sub_21B6EB24C();
              }
              unint64_t v51 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v48 - *v19) >> 8);
              uint64_t v52 = 2 * v51;
              if (2 * v51 <= v50 + 1) {
                uint64_t v52 = v50 + 1;
              }
              if (v51 >= 0x12492492492492) {
                unint64_t v53 = 0x24924924924924;
              }
              else {
                unint64_t v53 = v52;
              }
              long long v58 = a1 + 72;
              if (v53)
              {
                if (v53 > 0x24924924924924) {
                  sub_21B6EAD8C();
                }
                __double2 v54 = (char *)operator new(1792 * v53);
              }
              else
              {
                __double2 v54 = 0;
              }
              uint64_t v55 = (uint64_t)&v54[1792 * v50];
              *(void *)double v57 = v54;
              *(void *)&v57[8] = v55;
              *(void *)&v57[24] = &v54[1792 * v53];
              sub_21B6EAC40(v55, (uint64_t)buf);
              sub_21B6FAAAC(v55 + 360, v98);
              *(void *)&v57[16] = v55 + 1792;
              sub_21B6FADAC((uint64_t *)a1 + 7, v57);
              unint64_t v49 = *((void *)a1 + 8);
              if (*(void *)v57) {
                operator delete(*(void **)v57);
              }
            }
            else
            {
              sub_21B6EAC40(v20, (uint64_t)buf);
              sub_21B6FAAAC(v20 + 360, v98);
              unint64_t v49 = v20 + 1792;
            }
            *((void *)a1 + 8) = v49;
            sub_21B6F0AFC();
            return;
          }
        }
      }
    }
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    goto LABEL_54;
  }
  if (qword_267C5A9D8 != -1) {
    dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
  }
  uint64_t v13 = qword_267C5A9E0;
  if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = *(void *)(a3 + 32);
    *(_DWORD *)double v57 = 134349056;
    *(void *)&v57[4] = v14;
    long long v15 = "CLVLF,pushLocation,Unable to construct LocData,machAbsTime,%{public}.3lf";
    long long v16 = v13;
    uint32_t v17 = 12;
LABEL_61:
    _os_log_impl(&dword_21B6E4000, v16, OS_LOG_TYPE_ERROR, v15, v57, v17);
  }
}

void sub_21B6F0AF0(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_21B6E6194(a1);
}

void sub_21B6F0AFC()
{
  uint64_t v0 = (atomic_uchar *)MEMORY[0x270FA5388]();
  uint64_t v472 = v1;
  uint64_t v2 = v0;
  uint64_t v707 = *MEMORY[0x263EF8340];
  v480 = v0 + 10704;
  v474 = (unsigned __int8 *)(v0 + 10168);
  v451 = v0 + 9272;
  v450 = (unsigned __int8 *)(v0 + 8736);
  uint64_t v498 = (uint64_t)(v0 + 6776);
  if (!v0[6777])
  {
    if (v0[6776]) {
      goto LABEL_17;
    }
    *(_WORD *)uint64_t v498 = 0;
    sub_21B6F86E0();
    if (*(unsigned char *)(v498 + 1))
    {
      int v7 = 1;
      goto LABEL_18;
    }
    if (*(unsigned char *)v498)
    {
LABEL_107:
      int v7 = *v2;
      if (*v2) {
        goto LABEL_19;
      }
      goto LABEL_108;
    }
    if (*((void *)v2 + 1704) > 1uLL) {
      goto LABEL_17;
    }
    uint64_t v179 = *((void *)v2 + 7);
    uint64_t v180 = *((void *)v2 + 8);
    if (v179 == v180)
    {
      uint64_t v180 = *((void *)v2 + 7);
    }
    else
    {
      int v181 = *(_DWORD *)(v180 - 1792);
      while (*(unsigned char *)(v179 + 1784) && *(_DWORD *)v179 == v181)
      {
        v179 += 1792;
        if (v179 == v180)
        {
          uint64_t v179 = *((void *)v2 + 8);
          goto LABEL_358;
        }
      }
      if (v179 != v180)
      {
        uint64_t v319 = v179 + 1792;
        if (v179 + 1792 != v180)
        {
          do
          {
            if (*(unsigned char *)(v319 + 1784) && *(_DWORD *)v319 == v181)
            {
              sub_21B6F7D88(v179, v319);
              v179 += 1792;
            }
            v319 += 1792;
          }
          while (v319 != v180);
          uint64_t v180 = *((void *)v2 + 8);
        }
      }
    }
LABEL_358:
    sub_21B6F84C8((uint64_t)(v2 + 56), v179, v180);
    uint64_t v320 = *((void *)v2 + 7);
    uint64_t v321 = *((void *)v2 + 8);
    if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v321 - v320) >> 8)) < 3) {
      goto LABEL_17;
    }
    v525 = &unk_26CB86830;
    float64x2_t v322 = *(float64x2_t *)(v321 - 1176);
    *(_OWORD *)v527 = *(_OWORD *)(v321 - 1160);
    long long v526 = (__int128)v322;
    uint64_t v323 = v320 + 616;
    for (uint64_t i = 616; i != 640; i += 8)
      *(double *)((char *)&v525 + i - 608) = *(double *)((char *)&v525 + i - 608) - *(double *)(v320 + i);
    double v325 = hypot(*(long double *)&v526, *((long double *)&v526 + 1));
    double v326 = sub_21B6FC85C((double *)&xmmword_26AA49C50, *(double *)(v321 - 1752) * 57.2957795, *(double *)(v321 - 1744) * 57.2957795, *(double *)(v320 + 40) * 57.2957795, *(double *)(v320 + 48) * 57.2957795, *(double *)(v321 - 1736));
    if (v325 < 8.0 || v326 < 8.0)
    {
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
      }
      uint64_t v328 = qword_267C5A9E0;
      if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      uint64_t v329 = *(void *)(v321 - 1776);
      LODWORD(v690[0]) = 134349569;
      *(void *)((char *)v690 + 4) = v329;
      WORD2(v690[1]) = 2049;
      *(double *)((char *)&v690[1] + 6) = v325;
      HIWORD(v690[2]) = 2049;
      v690[3] = v326;
      v330 = "CLVLF,initWithPoints,Not enough movement,machAbsTime,%{public}.3lf,vioHorzDist,%{private}.3lf,locHorzDist,%{private}.3lf";
    }
    else
    {
      v494 = (long long *)(v321 - 1752);
      uint64_t v332 = *((void *)v2 + 7);
      uint64_t v331 = *((void *)v2 + 8);
      if (v332 != v331)
      {
        while (sub_21B6F7B74(v332 + 72, v321 - 1760, v332))
        {
          v332 += 1792;
          if (v332 == v331) {
            goto LABEL_373;
          }
        }
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
        }
        uint64_t v410 = qword_267C5A9E0;
        if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
        uint64_t v411 = *(void *)(v321 - 1776);
        LODWORD(v690[0]) = 134349056;
        *(void *)((char *)v690 + 4) = v411;
        v330 = "CLVLF,initWithPoints,Unable to compute ENU potisions,machAbsTime,%{public}.3lf";
        goto LABEL_465;
      }
LABEL_373:
      if (!sub_21B6F57B0(v320, v321 - 1792, v321 - 1792))
      {
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
        }
        v333 = qword_267C5A9E0;
        if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v334 = *(void *)(v321 - 1776);
          LODWORD(v690[0]) = 134349056;
          *(void *)((char *)v690 + 4) = v334;
          _os_log_impl(&dword_21B6E4000, v333, OS_LOG_TYPE_DEBUG, "CLVLF,initWithPoints,Unable to compute course in ENU,machAbsTime,%{public}.3lf", (uint8_t *)v690, 0xCu);
        }
      }
      double v335 = vabdd_f64(*(double *)(v321 - 1448), *(double *)(v321 - 1664));
      if (6.28318531 - v335 < v335) {
        double v335 = 6.28318531 - v335;
      }
      if (v335 <= 1.83259571)
      {
        uint64_t v342 = 0;
        uint64_t v343 = v320 + 360;
        v508 = &unk_26CB86830;
        float64x2_t v344 = *(float64x2_t *)(v321 - 1176);
        *(_OWORD *)v510 = *(_OWORD *)(v321 - 1160);
        float64x2_t v509 = v344;
        do
        {
          *(double *)(v323 + v342) = *(double *)(v323 + v342) - *(double *)((char *)&v508 + v342 + 8);
          v342 += 8;
        }
        while (v342 != 24);
        for (uint64_t j = 8; j != 32; j += 8)
          *(double *)(v321 + j - 1184) = *(double *)(v321 + j - 1184) - *(double *)((char *)&v508 + j);
        if ((sub_21B6F5AF8(v343, v321 - 1432, v321 - 1432) & 1) == 0)
        {
          if (qword_267C5A9D8 != -1) {
            dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
          }
          v346 = qword_267C5A9E0;
          if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v347 = *(void *)(v321 - 1776);
            LODWORD(v690[0]) = 134349056;
            *(void *)((char *)v690 + 4) = v347;
            _os_log_impl(&dword_21B6E4000, v346, OS_LOG_TYPE_DEBUG, "CLVLF,initWithPoints,Unable to compute delta position in VIO,machAbsTime,%{public}.3lf", (uint8_t *)v690, 0xCu);
          }
        }
        if (!sub_21B6F5CDC(v343, v321 - 1432, v321 - 1432))
        {
          if (qword_267C5A9D8 != -1) {
            dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
          }
          v348 = qword_267C5A9E0;
          if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v349 = *(void *)(v321 - 1776);
            LODWORD(v690[0]) = 134349056;
            *(void *)((char *)v690 + 4) = v349;
            _os_log_impl(&dword_21B6E4000, v348, OS_LOG_TYPE_DEBUG, "CLVLF,initWithPoints,Unable to compute course in VIO,machAbsTime,%{public}.3lf", (uint8_t *)v690, 0xCu);
          }
        }
        for (uint64_t k = 0; k != 24; k += 8)
          *(double *)(v323 + k) = *(double *)(v323 + k) + *(double *)((char *)&v508 + k + 8);
        for (uint64_t m = 8; m != 32; m += 8)
          *(double *)(v321 + m - 1184) = *(double *)(v321 + m - 1184) + *(double *)((char *)&v508 + m);
        *((void *)v2 + 851) = 0;
        *((void *)v2 + 850) = 0;
        *((void *)v2 + 852) = 0;
        *((void *)v2 + 853) = 0x3FF0000000000000;
        *((void *)v2 + 863) = 0;
        *(_OWORD *)(v2 + 6856) = 0u;
        *(_OWORD *)(v2 + 6872) = 0u;
        *(_OWORD *)(v2 + 6888) = 0u;
        *((void *)v2 + 864) = 0x3FF0000000000000;
        *((void *)v2 + 860) = 0x3FF0000000000000;
        *((void *)v2 + 856) = 0x3FF0000000000000;
        *(_OWORD *)(v2 + 6936) = 0u;
        *(_OWORD *)(v2 + 6952) = 0u;
        *((void *)v2 + 873) = 0;
        *((void *)v2 + 875) = 0;
        *((void *)v2 + 874) = 0;
        *((_OWORD *)v2 + 456) = 0u;
        *((_OWORD *)v2 + 455) = 0u;
        *((_OWORD *)v2 + 454) = 0u;
        *((_OWORD *)v2 + 453) = 0u;
        *((_OWORD *)v2 + 452) = 0u;
        *((_OWORD *)v2 + 451) = 0u;
        *((_OWORD *)v2 + 450) = 0u;
        *((_OWORD *)v2 + 449) = 0u;
        *((_OWORD *)v2 + 448) = 0u;
        *((_OWORD *)v2 + 447) = 0u;
        *((_OWORD *)v2 + 446) = 0u;
        *((_OWORD *)v2 + 445) = 0u;
        *((_OWORD *)v2 + 444) = 0u;
        *((_OWORD *)v2 + 443) = 0u;
        *((_OWORD *)v2 + 442) = 0u;
        *((_OWORD *)v2 + 441) = 0u;
        uint64_t v352 = *((void *)v2 + 8);
        uint64_t v353 = v352 - *((void *)v2 + 7);
        *((_OWORD *)v2 + 440) = 0u;
        *((_OWORD *)v2 + 439) = 0u;
        *(unsigned char *)(v498 + 8) = 0;
        if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (v353 >> 8)) < 3
          || !*(unsigned char *)(v352 - 1632)
          || !*(unsigned char *)(v352 - 1456)
          || !*(unsigned char *)(v352 - 32))
        {
          if (qword_267C5A9D8 != -1) {
            dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
          }
          uint64_t v410 = qword_267C5A9E0;
          if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          uint64_t v412 = *(void *)(v321 - 1776);
          LODWORD(v690[0]) = 134349056;
          *(void *)((char *)v690 + 4) = v412;
          v330 = "CLVLF,initWithPoints,Unable to initialize transform_vio2enu,machAbsTime,%{public}.3lf";
LABEL_465:
          v339 = v410;
          os_log_type_t v340 = OS_LOG_TYPE_ERROR;
          uint32_t v341 = 12;
          goto LABEL_466;
        }
        uint64_t v476 = v321 - 1792;
        v479 = (void *)(v321 - 1176);
        uint64_t v481 = v321 - 1432;
        __double2 v354 = __sincos_stret(*(double *)(v352 - 1448) - *(double *)(v352 - 24));
        *(void *)v565 = &unk_26CB86850;
        *(double *)&v565[8] = v354.__cosval;
        *(double *)&v565[16] = v354.__sinval;
        *(void *)&v565[24] = 0;
        *(double *)&v565[32] = -v354.__sinval;
        *(double *)&v565[40] = v354.__cosval;
        memset(&v565[48], 0, 24);
        v566[0] = 0x3FF0000000000000;
        v566[1] = 0;
        sub_21B6E659C((double *)(v498 + 8), (uint64_t)v565);
        long long v355 = *(_OWORD *)(v352 - 1560);
        *(_OWORD *)(v2 + 6984) = *(_OWORD *)(v352 - 1576);
        *(_OWORD *)(v2 + 7000) = v355;
        LOBYTE(v690[0]) = 0;
        *(int64x2_t *)&v690[1] = vdupq_n_s64(3uLL);
        *(_OWORD *)&v690[3] = xmmword_21B6FEA60;
        v497 = (double *)(v2 + 6840);
        *(void *)&v690[5] = v2 + 6848;
        *(void *)&v690[6] = v2 + 6920;
        sub_21B6EA188((uint64_t)v688, v690);
        v545 = &unk_26CB86850;
        long long v546 = 0u;
        int64x2_t v547 = 0u;
        long long v548 = 0u;
        long long v549 = 0u;
        long long v550 = 0u;
        *(void *)&v690[0] = &unk_26CB86890;
        *((void *)&v693[1] + 1) = 0;
        uint64_t v692 = 0;
        *(void *)&v691[0] = 0;
        memset(&v690[1], 0, 64);
        v691[1] = 0u;
        *(_OWORD *)((char *)v693 + 8) = 0u;
        long long v694 = 0xBFF0000000000000;
        *(void *)&v693[0] = 0xBFF0000000000000;
        *((void *)&v691[0] + 1) = 0xBFF0000000000000;
        v556 = &unk_26CB86830;
        float64x2_t v557 = 0u;
        v558[0] = 0u;
        uint64_t v357 = *((void *)v2 + 7);
        uint64_t v356 = *((void *)v2 + 8);
        if (v357 != v356)
        {
          uint64_t v358 = *((void *)v2 + 7);
          do
          {
            *(void *)buf = &unk_26CB86830;
            long long v359 = *(_OWORD *)(v358 + 632);
            *(_OWORD *)&buf[8] = *(_OWORD *)(v358 + 616);
            *(_OWORD *)&unsigned char buf[24] = v359;
            for (uint64_t n = 8; n != 32; n += 8)
              *(double *)&buf[n] = *(double *)&buf[n] - *(double *)(v352 + n - 1184);
            for (iuint64_t i = 8; ii != 32; ii += 8)
              *(double *)((char *)&v556 + ii) = *(double *)((char *)&v556 + ii) + *(double *)&buf[ii];
            v358 += 1792;
          }
          while (v358 != v356);
        }
        __aa = (double *)(v2 + 7024);
        for (juint64_t j = 8; jj != 32; jj += 8)
          *(double *)((char *)&v556 + jj) = *(double *)((char *)&v556 + jj)
                                          / (double)(unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v356 - v357) >> 8));
        uint64_t v492 = v356;
        if (v357 != v356)
        {
          int64x2_t v487 = vdupq_n_s64(3uLL);
          do
          {
            if (*(unsigned char *)(v357 + 160))
            {
              LOBYTE(__lda) = 0;
              v562[0] = (float64x2_t)v487;
              v562[1] = (float64x2_t)xmmword_21B6FEAA0;
              *(void *)&v562[2].f64[0] = v357 + 824;
              *(void *)&v562[2].f64[1] = v357 + 944;
              sub_21B6F9A74((uint64_t *)&__n, (uint64_t)v497, (uint64_t *)&__lda);
              sub_21B6EB144((uint64_t *)&__work, (uint64_t)__n, 3);
              if (__n) {
                cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, (const int)__n, 3, 3, 1.0, *(const double **)&v514.f64[0], (const int)__n, (const double *)&v688[1], 3, 0.0, (double *)__C.i64[0], (const int)__n);
              }
              uint64_t v363 = 0;
              *(void *)buf = &unk_26CB86850;
              long long v364 = *(_OWORD *)(v357 + 304);
              long long v581 = *(_OWORD *)(v357 + 288);
              long long v582 = v364;
              *(_OWORD *)v583 = *(_OWORD *)(v357 + 320);
              long long v365 = *(_OWORD *)(v357 + 272);
              *(_OWORD *)&buf[8] = *(_OWORD *)(v357 + 256);
              *(_OWORD *)&unsigned char buf[24] = v365;
              uint64_t v366 = __C.i64[0];
              do
              {
                *(double *)&buf[v363 + 8] = *(double *)&buf[v363 + 8] + *(double *)(v366 + v363);
                v363 += 8;
              }
              while (v363 != 72);
              long long v548 = v581;
              long long v549 = v582;
              long long v550 = *(_OWORD *)v583;
              long long v546 = *(_OWORD *)&buf[8];
              int64x2_t v547 = *(int64x2_t *)&buf[24];
              sub_21B6EA254(&__work);
              sub_21B6EA254(&__n);
              long long v367 = v546;
              int64x2_t v368 = v547;
              double v369 = *(double *)&v548;
              double v370 = *(double *)&v548 * *(double *)&v550 - *((double *)&v549 + 1) * *((double *)&v548 + 1);
              double v371 = *((double *)&v549 + 1) * *(double *)v547.i64 - *((double *)&v546 + 1) * *(double *)&v550;
              double v372 = *((double *)&v546 + 1) * *((double *)&v548 + 1) - *(double *)&v548 * *(double *)v547.i64;
              double v373 = *(double *)&v547.i64[1] * v371 + v370 * *(double *)&v546 + v372 * *(double *)&v549;
              *(double *)&long long v546 = v370 / v373;
              *((double *)&v546 + 1) = v371 / v373;
              *(double *)v547.i64 = v372 / v373;
              *(double *)&v547.i64[1] = (*(double *)&v549 * *((double *)&v548 + 1)
                                       - *(double *)&v547.i64[1] * *(double *)&v550)
                                      / v373;
              *(double *)&long long v548 = (*(double *)&v367 * *(double *)&v550 - *(double *)&v549 * *(double *)v368.i64) / v373;
              *((double *)&v548 + 1) = (*(double *)&v368.i64[1] * *(double *)v368.i64
                                      - *(double *)&v367 * *((double *)&v548 + 1))
                                     / v373;
              *(double *)v374.i64 = (*(double *)&v368.i64[1] * *((double *)&v549 + 1) - *(double *)&v549 * v369) / v373;
              double v375 = (*(double *)&v549 * *((double *)&v367 + 1) - *(double *)&v367 * *((double *)&v549 + 1)) / v373;
              *(double *)&long long v549 = *(double *)v374.i64;
              *((double *)&v549 + 1) = v375;
              *(double *)&long long v550 = (*(double *)&v367 * v369 - *(double *)&v368.i64[1] * *((double *)&v367 + 1)) / v373;
              __woruint64_t k = COERCE_DOUBLE(&unk_26CB86830);
              int8x16_t v376 = *(int8x16_t *)(v357 + 616);
              int64x2_t v377 = *(int64x2_t *)(v357 + 632);
              float64x2_t v535 = (float64x2_t)v376;
              int64x2_t __C = v377;
              for (kuint64_t k = 8; kk != 32; kk += 8)
                *(__CLPK_doublereal *)((char *)&__work + kk) = *(__CLPK_doublereal *)((char *)&__work + kk)
                                                             - *(double *)(v352 + kk - 1184);
              for (muint64_t m = 8; mm != 32; mm += 8)
              {
                *(double *)v376.i64 = *(__CLPK_doublereal *)((char *)&__work + mm) - *(double *)((char *)&v556 + mm);
                *(__CLPK_doublereal *)((char *)&__work + mm) = *(__CLPK_doublereal *)v376.i64;
              }
              sub_21B6E7EE8(v497, (uint64_t)(v2 + 6928), &__work, (uint64_t)buf, v376, v374);
              for (nuint64_t n = 8; nn != 80; nn += 8)
                *(double *)&buf[nn] = -*(double *)&buf[nn];
              *(_OWORD *)&v690[1] = *(_OWORD *)&buf[8];
              *(_OWORD *)&v690[3] = *(_OWORD *)&buf[24];
              *(_OWORD *)&v690[5] = v581;
              *(_OWORD *)&v690[7] = v582;
              *(void *)&v691[0] = *(void *)v583;
              *(void *)buf = &unk_26CB86890;
              memset(&buf[8], 0, 32);
              long long v581 = 0u;
              long long v582 = 0u;
              memset(v583, 0, sizeof(v583));
              cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, 3, 6, 3, 1.0, (const double *)&v546, 3, &v690[1], 3, 0.0, (double *)&buf[8], 3);
              cblas_dgemm(CblasColMajor, CblasTrans, CblasNoTrans, 6, 6, 3, 1.0, &v690[1], 3, (const double *)&buf[8], 3, 1.0, __aa, 6);
            }
            v357 += 1792;
          }
          while (v357 != v492);
        }
        memset(buf, 0, 24);
        LODWORD(__n) = 6;
        LODWORD(__lda) = 6;
        v381 = (__CLPK_integer *)operator new(0x18uLL);
        *(void *)v381 = 0;
        *((void *)v381 + 1) = 0;
        *((void *)v381 + 2) = 0;
        __info[0] = 1;
        dgetrf_((__CLPK_integer *)&__n, (__CLPK_integer *)&__n, __aa, (__CLPK_integer *)&__lda, v381, __info);
        __lwork[0] = -1;
        __woruint64_t k = 0.0;
        __info[0] = 1;
        dgetri_((__CLPK_integer *)&__n, __aa, (__CLPK_integer *)&__lda, v381, &__work, __lwork, __info);
        sub_21B6EB64C((uint64_t)buf, (unint64_t)__work);
        __lwork[0] = (int)__work;
        __info[0] = 1;
        dgetri_((__CLPK_integer *)&__n, __aa, (__CLPK_integer *)&__lda, v381, *(__CLPK_doublereal **)buf, __lwork, __info);
        operator delete(v381);
        if (*(void *)buf)
        {
          *(void *)&buf[8] = *(void *)buf;
          operator delete(*(void **)buf);
        }
        buf[0] = 1;
        *(int64x2_t *)&buf[8] = vdupq_n_s64(3uLL);
        *(_OWORD *)&unsigned char buf[24] = xmmword_21B6FEAA0;
        *(void *)&long long v581 = v2 + 7024;
        *((void *)&v581 + 1) = v2 + 7144;
        double v382 = *((double *)v2 + 878) + *((double *)v2 + 885) + *((double *)v2 + 892);
        double v383 = sqrt(v382);
        BOOL v385 = (v383 < 0.0 || ((*(void *)&v383 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
            && (unint64_t)(*(void *)&v383 - 1) > 0xFFFFFFFFFFFFELL;
        if (!v385 && v383 < 0.261799388)
        {
          v690[0] = 0.0685389195 / v382;
          sub_21B6FAFD0((uint64_t)buf, v690);
        }
        v565[0] = 1;
        *(int64x2_t *)&v565[8] = vdupq_n_s64(3uLL);
        *(_OWORD *)&v565[24] = xmmword_21B6FEAA0;
        *(void *)&v565[40] = v2 + 7192;
        *(void *)&v565[48] = v2 + 7312;
        double v386 = *((double *)v2 + 899) + *((double *)v2 + 906) + *((double *)v2 + 913);
        double v387 = sqrt(v386);
        if ((v387 >= 0.0 && ((*(void *)&v387 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
           || (unint64_t)(*(void *)&v387 - 1) <= 0xFFFFFFFFFFFFELL)
          && v387 < 3.0)
        {
          v690[0] = 9.0 / v386;
          sub_21B6FAFD0((uint64_t)v565, v690);
        }
        void *v479 = 0;
        v479[1] = 0;
        v479[2] = 0;
        *(unsigned char *)(v498 + 1) = 1;
        long long v391 = *v494;
        *(_OWORD *)(v2 + 7880) = v494[1];
        *(_OWORD *)(v2 + 7864) = v391;
        long long v392 = *(_OWORD *)v510;
        *((float64x2_t *)v2 + 494) = v509;
        *((_OWORD *)v2 + 495) = v392;
        long long v393 = *(_OWORD *)(v476 + 16);
        *((_OWORD *)v2 + 496) = *(_OWORD *)v476;
        *((_OWORD *)v2 + 497) = v393;
        long long v394 = v494[1];
        *(_OWORD *)(v2 + 7976) = *v494;
        *(_OWORD *)(v2 + 7992) = v394;
        long long v395 = *(_OWORD *)(v476 + 96);
        *((_OWORD *)v2 + 501) = *(_OWORD *)(v476 + 80);
        *((_OWORD *)v2 + 502) = v395;
        unsigned __int8 v396 = *(unsigned char *)(v476 + 160);
        long long v398 = *(_OWORD *)(v476 + 128);
        long long v397 = *(_OWORD *)(v476 + 144);
        *((_OWORD *)v2 + 503) = *(_OWORD *)(v476 + 112);
        *((_OWORD *)v2 + 504) = v398;
        *((_OWORD *)v2 + 505) = v397;
        v2[8096] = v396;
        long long v399 = *(_OWORD *)(v476 + 192);
        *((_OWORD *)v2 + 507) = *(_OWORD *)(v476 + 176);
        *((_OWORD *)v2 + 508) = v399;
        long long v400 = *(_OWORD *)(v476 + 232);
        *(_OWORD *)(v2 + 8152) = *(_OWORD *)(v476 + 216);
        *(_OWORD *)(v2 + 8168) = v400;
        *((_OWORD *)v2 + 512) = *(_OWORD *)(v476 + 256);
        long long v401 = *(_OWORD *)(v476 + 304);
        long long v402 = *(_OWORD *)(v476 + 320);
        long long v403 = *(_OWORD *)(v476 + 288);
        *((_OWORD *)v2 + 513) = *(_OWORD *)(v476 + 272);
        *((_OWORD *)v2 + 516) = v402;
        *((_OWORD *)v2 + 515) = v401;
        *((_OWORD *)v2 + 514) = v403;
        long long v404 = *(_OWORD *)(v476 + 336);
        *((void *)v2 + 1036) = *(void *)(v476 + 352);
        *((_OWORD *)v2 + 517) = v404;
        *((_DWORD *)v2 + 2074) = 0;
        sub_21B6F6244(v481, (unsigned __int8 *)v498);
        sub_21B6F6498(v481, (unsigned __int8 *)v498);
        sub_21B6F6734(v498, v405, v406, v407);
        sub_21B6F7D88((uint64_t)(v2 + 8320), v476);
        *((void *)v2 + 8) = *((void *)v2 + 7);
        sub_21B6F74F8((uint64_t)(v2 + 3416), v498);
        sub_21B6F74F8((uint64_t)(v2 + 80), (uint64_t)(v2 + 3416));
        unint64_t v408 = *((void *)v2 + 844);
        *((void *)v2 + 845) = v408;
        if (v408 >= *((void *)v2 + 846)) {
          uint64_t v409 = sub_21B6FB580((uint64_t *)v2 + 844, v498);
        }
        else {
          uint64_t v409 = sub_21B6FB69C(v408, v498) + 3336;
        }
        *((void *)v2 + 845) = v409;
        *((void *)v2 + 1270) = *((void *)v2 + 1091);
        *((_OWORD *)v2 + 632) = *(_OWORD *)(v2 + 8680);
        *((_OWORD *)v2 + 633) = *(_OWORD *)(v2 + 8696);
        *((_OWORD *)v2 + 634) = *(_OWORD *)(v2 + 8712);
        unsigned __int8 *v474 = *v450;
        *((void *)v2 + 1277) = *((void *)v2 + 1098);
        *(_OWORD *)(v2 + 10184) = *((_OWORD *)v2 + 547);
        *(_OWORD *)(v2 + 10200) = *((_OWORD *)v2 + 548);
        *(_OWORD *)(v2 + 10232) = *((_OWORD *)v2 + 550);
        *(_OWORD *)(v2 + 10296) = *((_OWORD *)v2 + 554);
        *(_OWORD *)(v2 + 10280) = *((_OWORD *)v2 + 553);
        *(_OWORD *)(v2 + 10264) = *((_OWORD *)v2 + 552);
        *(_OWORD *)(v2 + 10248) = *((_OWORD *)v2 + 551);
        *((_OWORD *)v2 + 645) = *(_OWORD *)(v2 + 8888);
        *((_OWORD *)v2 + 646) = *(_OWORD *)(v2 + 8904);
        *((void *)v2 + 1294) = *((void *)v2 + 1115);
        long long v413 = *(_OWORD *)(v2 + 8936);
        *((_OWORD *)v2 + 649) = *(_OWORD *)(v2 + 8952);
        *((_OWORD *)v2 + 648) = v413;
        memcpy(v2 + 10408, v2 + 8976, 0x128uLL);
        atomic_uchar *v480 = *v451;
        *((_OWORD *)v2 + 670) = *(_OWORD *)(v2 + 9288);
        *((_OWORD *)v2 + 671) = *(_OWORD *)(v2 + 9304);
        *((void *)v2 + 1344) = *((void *)v2 + 1165);
        *((_OWORD *)v2 + 674) = *(_OWORD *)(v2 + 9352);
        *((_OWORD *)v2 + 675) = *(_OWORD *)(v2 + 9368);
        *((_OWORD *)v2 + 676) = *(_OWORD *)(v2 + 9384);
        *((_OWORD *)v2 + 677) = *(_OWORD *)(v2 + 9400);
        *(_OWORD *)(v2 + 10872) = *((_OWORD *)v2 + 590);
        *(_OWORD *)(v2 + 10856) = *((_OWORD *)v2 + 589);
        *(_OWORD *)(v2 + 10904) = *((_OWORD *)v2 + 592);
        *(_OWORD *)(v2 + 10920) = *((_OWORD *)v2 + 593);
        long long v414 = *(_OWORD *)(v2 + 9336);
        *((void *)v2 + 1361) = *((void *)v2 + 1182);
        *((_OWORD *)v2 + 673) = v414;
        memcpy(v2 + 10944, v2 + 9512, 0x128uLL);
        *((_OWORD *)v2 + 703) = *(_OWORD *)(v2 + 9816);
        *((_OWORD *)v2 + 704) = *(_OWORD *)(v2 + 9832);
        *(_OWORD *)(v2 + 11304) = *((_OWORD *)v2 + 617);
        *(_OWORD *)(v2 + 11320) = *((_OWORD *)v2 + 618);
        *(_OWORD *)(v2 + 11336) = *((_OWORD *)v2 + 619);
        *(_OWORD *)(v2 + 11352) = *((_OWORD *)v2 + 620);
        *(_OWORD *)(v2 + 11288) = *((_OWORD *)v2 + 616);
        v480[664] = v451[664];
        long long v415 = *((_OWORD *)v2 + 622);
        *(_OWORD *)(v2 + 11400) = *((_OWORD *)v2 + 623);
        *(_OWORD *)(v2 + 11384) = v415;
        *((_OWORD *)v2 + 718) = *(_OWORD *)(v2 + 10056);
        *((_OWORD *)v2 + 717) = *(_OWORD *)(v2 + 10040);
        *((_OWORD *)v2 + 716) = *(_OWORD *)(v2 + 10024);
        *((_OWORD *)v2 + 715) = *(_OWORD *)(v2 + 10008);
        *((_OWORD *)v2 + 714) = *(_OWORD *)(v2 + 9992);
        *((_OWORD *)v2 + 719) = *(_OWORD *)(v2 + 10072);
        *((_OWORD *)v2 + 720) = *(_OWORD *)(v2 + 10088);
        v416 = (unsigned __int8 *)(v2 + 1);
        v2[11536] = v2[10104];
        sub_21B6EBAC4(v2 + 1);
        double v417 = *((double *)v2 + 994);
        unsigned __int8 v418 = atomic_exchange_explicit(v2 + 1, 1u, memory_order_acquire);
        if ((v418 & 1) == 0)
        {
          if (qword_267C5A9D8 != -1) {
            dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
          }
          v419 = qword_267C5A9E0;
          if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v690[0]) = 0;
            _os_log_impl(&dword_21B6E4000, v419, OS_LOG_TYPE_ERROR, "CLVLF,removeAllVlfDataLessThanMachAbsoluteTime,Called without locking vision buffers", (uint8_t *)v690, 2u);
          }
        }
        uint64_t v421 = *((void *)v2 + 4);
        v420 = (long long *)*((void *)v2 + 5);
        if ((long long *)v421 != v420)
        {
          while (*(double *)(v421 + 8) >= v417)
          {
            v421 += 3160;
            if ((long long *)v421 == v420)
            {
              uint64_t v421 = *((void *)v2 + 5);
              goto LABEL_484;
            }
          }
          if ((long long *)v421 != v420)
          {
            uint64_t v422 = v421 + 3160;
            if ((long long *)(v421 + 3160) != v420)
            {
              do
              {
                if (*(double *)(v422 + 8) >= v417)
                {
                  sub_21B6FB198(v421, (long long *)v422);
                  v421 += 3160;
                }
                v422 += 3160;
              }
              while ((long long *)v422 != v420);
              v420 = (long long *)*((void *)v2 + 5);
            }
          }
LABEL_484:
          sub_21B6F8484((uint64_t)(v2 + 32), v421, v420);
        }
        if ((v418 & 1) == 0) {
          atomic_store(0, v416);
        }
        atomic_store(0, v416);
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
        }
        uint64_t v423 = qword_267C5A9E0;
        if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_17;
        }
        uint64_t v424 = *((void *)v2 + 1042);
        uint64_t v425 = *((void *)v2 + 867);
        double v426 = *((double *)v2 + 868);
        uint64_t v427 = *((void *)v2 + 869);
        double v428 = *((double *)v2 + 870) * 57.2957795;
        uint64_t v429 = *((void *)v2 + 873);
        double v430 = *((double *)v2 + 874);
        uint64_t v431 = *((void *)v2 + 875);
        uint64_t v432 = *((void *)v2 + 878);
        uint64_t v433 = *((void *)v2 + 885);
        uint64_t v434 = *((void *)v2 + 892);
        uint64_t v435 = *((void *)v2 + 899);
        uint64_t v436 = *((void *)v2 + 906);
        uint64_t v437 = *((void *)v2 + 913);
        LODWORD(v690[0]) = 134352385;
        *(void *)((char *)v690 + 4) = v424;
        WORD2(v690[1]) = 2049;
        *(void *)((char *)&v690[1] + 6) = v425;
        HIWORD(v690[2]) = 2049;
        v690[3] = v426;
        LOWORD(v690[4]) = 2049;
        *(void *)((char *)&v690[4] + 2) = v427;
        WORD1(v690[5]) = 2049;
        *(double *)((char *)&v690[5] + 4) = v428;
        WORD2(v690[6]) = 2049;
        *(void *)((char *)&v690[6] + 6) = v429;
        HIWORD(v690[7]) = 2049;
        v690[8] = v430;
        LOWORD(v691[0]) = 2049;
        *(void *)((char *)v691 + 2) = v431;
        WORD5(v691[0]) = 2049;
        *(void *)((char *)v691 + 12) = v432;
        WORD2(v691[1]) = 2049;
        *(void *)((char *)&v691[1] + 6) = v433;
        HIWORD(v691[1]) = 2049;
        uint64_t v692 = v434;
        LOWORD(v693[0]) = 2049;
        *(void *)((char *)v693 + 2) = v435;
        WORD5(v693[0]) = 2049;
        *(void *)((char *)v693 + 12) = v436;
        WORD2(v693[1]) = 2049;
        *(void *)((char *)&v693[1] + 6) = v437;
        v330 = "CLVLF,initWithPoints,Filter initialized,machAbsTime,%{public}.3lf,vio2enu,[%{private}.3lf,%{private}.3lf,"
               "%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf],vio2enu_cov_diag,[%{private}."
               "6lf,%{private}.6lf,%{private}.6lf,%{private}.6lf,%{private}.6lf,%{private}.6lf]";
        v339 = v423;
        os_log_type_t v340 = OS_LOG_TYPE_DEBUG;
        uint32_t v341 = 142;
LABEL_466:
        _os_log_impl(&dword_21B6E4000, v339, v340, v330, (uint8_t *)v690, v341);
        goto LABEL_17;
      }
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
      }
      uint64_t v328 = qword_267C5A9E0;
      if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      uint64_t v336 = *(void *)(v321 - 1776);
      double v337 = *(double *)(v321 - 1448) * 57.2957795;
      double v338 = *(double *)(v321 - 1664) * 57.2957795;
      LODWORD(v690[0]) = 134349569;
      *(void *)((char *)v690 + 4) = v336;
      WORD2(v690[1]) = 2049;
      *(double *)((char *)&v690[1] + 6) = v337;
      HIWORD(v690[2]) = 2049;
      v690[3] = v338;
      v330 = "CLVLF,initialize,Computed course and reported course are too different,machAbsTime,%{public}.3lf,courseEnuF"
             "romPos,%{private}.3lf,courseEnu,%{private}.3lf";
    }
    v339 = v328;
    os_log_type_t v340 = OS_LOG_TYPE_DEBUG;
    uint32_t v341 = 32;
    goto LABEL_466;
  }
  if (!v0[6776])
  {
    sub_21B6EBAC4(v0 + 1);
    uint64_t v3 = *((void *)v2 + 4);
    uint64_t v4 = *((void *)v2 + 5);
    atomic_store(0, (unsigned __int8 *)v2 + 1);
    if (v3 != v4)
    {
      sub_21B6F86E0();
      if (*(unsigned char *)v498)
      {
        *(unsigned char *)(v498 + 1) = 0;
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
        }
        uint64_t v5 = qword_267C5A9E0;
        if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v690[0]) = 0;
          double v6 = "CLVLF,reinitWithFrames,filter re-initialized with frames";
LABEL_16:
          _os_log_impl(&dword_21B6E4000, v5, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)v690, 2u);
        }
      }
      else
      {
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
        }
        uint64_t v5 = qword_267C5A9E0;
        if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v690[0]) = 0;
          double v6 = "CLVLF,reinitWithFrames,filter still with points init";
          goto LABEL_16;
        }
      }
    }
  }
LABEL_17:
  int v7 = *(unsigned __int8 *)(v498 + 1);
  if (!*(unsigned char *)(v498 + 1))
  {
    if (!*(unsigned char *)v498) {
      return;
    }
    goto LABEL_107;
  }
LABEL_18:
  if (*v2)
  {
LABEL_19:
    v469 = v2 + 10112;
    v468 = v2 + 10184;
    v467 = v2 + 10232;
    v466 = v2 + 10320;
    v465 = v2 + 10368;
    __dst = v2 + 10408;
    v463 = v2 + 10720;
    v462 = v2 + 10768;
    v461 = v2 + 10856;
    v460 = v2 + 10904;
    v459 = v2 + 10944;
    v458 = v2 + 11248;
    v457 = v2 + 11288;
    v456 = v2 + 11384;
    v455 = v2 + 11424;
    v454 = v2 + 11504;
    v453 = (uint64_t *)(v2 + 6752);
    v493 = v2 + 7936;
    v491 = v2 + 7976;
    __a = (__CLPK_doublereal *)(v2 + 8016);
    v488 = v2 + 8048;
    v486 = v2 + 8112;
    v485 = (long long *)(v2 + 8152);
    *(void *)&v8.f64[1] = 3;
    v8.f64[0] = 3.14159265;
    int8x16_t v442 = (int8x16_t)v8;
    v484 = v2 + 8272;
    v483 = v2 + 8320;
    uint64_t v475 = (uint64_t)(v2 + 6784);
    v471 = (double *)(v2 + 6840);
    uint64_t v470 = (uint64_t)(v2 + 6928);
    __A = (double *)(v2 + 7016);
    v441 = (const double *)(v2 + 6960);
    int64x2_t v443 = vdupq_n_s64(3uLL);
    v8.f64[0] = NAN;
    v8.f64[1] = NAN;
    int8x16_t v440 = (int8x16_t)vnegq_f64(v8);
    v473 = v2 + 1;
    uint64_t v452 = (uint64_t)(v2 + 3416);
    double __B = v2 + 0x2000;
    while (1)
    {
      if (!*(unsigned char *)(v498 + 1) && !*(unsigned char *)v498) {
        goto LABEL_215;
      }
      sub_21B6EBAC4(v473);
      uint64_t v9 = *((void *)v2 + 4);
      uint64_t v10 = (long long *)*((void *)v2 + 5);
      if ((long long *)v9 == v10 || *(double *)(v9 + 8) > *(double *)(v472 + 8))
      {
        uint64_t v170 = (unsigned __int8 *)(v2 + 1);
        goto LABEL_214;
      }
      sub_21B6FA9E0((uint64_t)buf, *((long long **)v2 + 4));
      sub_21B6FAAAC((uint64_t)v638 + 8, (long long *)(v9 + 1728));
      *((void *)v2 + 5) = sub_21B6FB140((long long *)(v9 + 3160), v10, v9);
      atomic_store(0, (unsigned __int8 *)v2 + 1);
      double v11 = *((double *)v2 + 250);
      BOOL v12 = v11 <= 0.0 || v687 == 0;
      if (!v12 && *((double *)&v638[1] + 1) != v11) {
        break;
      }
      double v14 = *((double *)v2 + 1269);
      if (v14 > 0.0 && *(double *)&v638[3] >= v14 && *(double *)&v638[3] > v14 + 8.0)
      {
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
        }
        double v171 = qword_267C5A9E0;
        if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
        {
          double v186 = *((double *)v2 + 1269);
          LODWORD(v690[0]) = 134349568;
          *(double *)((char *)v690 + 4) = 8.0;
          WORD2(v690[1]) = 2050;
          *(double *)((char *)&v690[1] + 6) = *(double *)&v638[3];
          HIWORD(v690[2]) = 2050;
          v690[3] = v186;
          float64x2_t v173 = "CLVLF,fuseWithFrames,Filter reset,VIO measurements were unacceptable for %{public}.3lf sec,machAbsTime,"
                 "%{public}.3lf,lastNominalVioMachAbsTime,%{public}.3lf";
LABEL_211:
          _os_log_impl(&dword_21B6E4000, v171, OS_LOG_TYPE_ERROR, v173, (uint8_t *)v690, 0x20u);
        }
LABEL_212:
        sub_21B6EBAC4(v473);
        uint64_t v177 = (uint64_t)v2;
        int v178 = 1;
        goto LABEL_213;
      }
      if (*(double *)&v638[3] >= v14 && v687 && !DWORD2(v638[0]))
      {
        long long v17 = *(_OWORD *)((char *)&v638[1] + 8);
        _OWORD *v469 = *(_OWORD *)((char *)v638 + 8);
        *((_OWORD *)v2 + 633) = v17;
        *((_OWORD *)v2 + 634) = *(_OWORD *)((char *)&v638[2] + 8);
        *((void *)v2 + 1270) = *((void *)&v638[3] + 1);
        unsigned __int8 *v474 = v639;
        long long v18 = v641;
        _OWORD *v468 = v640;
        *(_OWORD *)(v2 + 10200) = v18;
        *((void *)v2 + 1277) = v642;
        long long v19 = v643;
        long long v20 = v644;
        long long v21 = v647;
        *(_OWORD *)(v2 + 10280) = v646;
        *(_OWORD *)(v2 + 10296) = v21;
        long long v22 = v645;
        *(_OWORD *)(v2 + 10248) = v20;
        *(_OWORD *)(v2 + 10264) = v22;
        _OWORD *v467 = v19;
        long long v23 = v648;
        long long v24 = v649;
        *((void *)v2 + 1294) = v650;
        _OWORD *v466 = v23;
        *((_OWORD *)v2 + 646) = v24;
        long long v25 = v653;
        _OWORD *v465 = v652;
        *((_OWORD *)v2 + 649) = v25;
        memcpy(__dst, v654, 0x128uLL);
        atomic_uchar *v480 = v655;
        long long v26 = v657;
        _OWORD *v463 = v656;
        *((_OWORD *)v2 + 671) = v26;
        *((void *)v2 + 1344) = v658;
        long long v27 = v662;
        *((_OWORD *)v2 + 675) = v661;
        *((_OWORD *)v2 + 676) = v27;
        *((_OWORD *)v2 + 677) = v663;
        long long v28 = v660;
        _OWORD *v462 = v659;
        *((_OWORD *)v2 + 674) = v28;
        long long v29 = v665;
        _OWORD *v461 = v664;
        *(_OWORD *)(v2 + 10872) = v29;
        *((void *)v2 + 1361) = v666;
        long long v30 = v668;
        _OWORD *v460 = v667;
        *(_OWORD *)(v2 + 10920) = v30;
        memcpy(v459, v669, 0x128uLL);
        long long v31 = v671;
        _OWORD *v458 = v670;
        *((_OWORD *)v2 + 704) = v31;
        long long v32 = v675;
        *(_OWORD *)(v2 + 11320) = v674;
        *(_OWORD *)(v2 + 11336) = v32;
        *(_OWORD *)(v2 + 11352) = v676;
        long long v33 = v673;
        _OWORD *v457 = v672;
        *(_OWORD *)(v2 + 11304) = v33;
        v480[664] = v677;
        long long v34 = v679;
        _OWORD *v456 = v678;
        *(_OWORD *)(v2 + 11400) = v34;
        long long v35 = v683;
        *((_OWORD *)v2 + 716) = v682;
        *((_OWORD *)v2 + 717) = v35;
        *((_OWORD *)v2 + 718) = v684;
        long long v36 = v681;
        _OWORD *v455 = v680;
        *((_OWORD *)v2 + 715) = v36;
        long long v37 = v686;
        _OWORD *v454 = v685;
        *((_OWORD *)v2 + 720) = v37;
        v2[11536] = v687;
      }
      if (!sub_21B6E90F8((uint64_t)buf))
      {
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
        }
        float64x2_t v174 = qword_267C5A9E0;
        if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v690[0]) = 134349056;
          *(double *)((char *)v690 + 4) = *(double *)&buf[8];
          double v175 = "CLVLF,fuseWithFrames,Unable to compute VLF for ENU,machAbsTime,%{public}.3lf";
          goto LABEL_182;
        }
LABEL_215:
        int64x2_t v447 = vdupq_n_s64(3uLL);
        v187.f64[0] = NAN;
        v187.f64[1] = NAN;
        int8x16_t v446 = (int8x16_t)vnegq_f64(v187);
        double v188 = (unsigned __int8 *)v498;
        while (2)
        {
          if (!v188[1] && !*(unsigned char *)v498) {
            return;
          }
          uint64_t v189 = *((void *)v2 + 7);
          if (v189 == *((void *)v2 + 8)) {
            return;
          }
          sub_21B6EAC40((uint64_t)buf, *((void *)v2 + 7));
          sub_21B6FAAAC((uint64_t)&v591, (long long *)(v189 + 360));
          *((void *)v2 + 8) = sub_21B6FB8B8(*((void *)v2 + 7) + 1792, *((void *)v2 + 8), *((void *)v2 + 7));
          double v190 = *((double *)v2 + 250);
          if (v190 > 0.0 && v639 != 0 && *(double *)&v592 != v190)
          {
            if (qword_267C5A9D8 != -1) {
              dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
            }
            v310 = qword_267C5A9E0;
            if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
            {
              uint64_t v311 = *((void *)v2 + 250);
              LODWORD(v690[0]) = 134349568;
              *(double *)((char *)v690 + 4) = *((double *)&v593 + 1);
              WORD2(v690[1]) = 2050;
              *(void *)((char *)&v690[1] + 6) = v311;
              HIWORD(v690[2]) = 2050;
              *(void *)&v690[3] = v592;
              v312 = "CLVLF,fuseWithPoints,Filter reset,VIO session is re-initialized,machAbsTime,%{public}.3lf,prevOrigi"
                     "nTimestamp,%{public}.3lf,currOriginTimestamp,%{public}.3lf";
              goto LABEL_341;
            }
            goto LABEL_342;
          }
          double v193 = *((double *)v2 + 1269);
          if (v193 > 0.0 && *((double *)&v593 + 1) >= v193 && *((double *)&v593 + 1) > v193 + 8.0)
          {
            if (qword_267C5A9D8 != -1) {
              dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
            }
            v310 = qword_267C5A9E0;
            if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
            {
              double v317 = *((double *)v2 + 1269);
              LODWORD(v690[0]) = 134349568;
              *(double *)((char *)v690 + 4) = 8.0;
              WORD2(v690[1]) = 2050;
              *(double *)((char *)&v690[1] + 6) = *((double *)&v593 + 1);
              HIWORD(v690[2]) = 2050;
              v690[3] = v317;
              v312 = "CLVLF,fuseWithPoints,Filter reset,VIO measurements were unacceptable for %{public}.3lf sec,machAbsT"
                     "ime,%{public}.3lf,lastNominalVioMachAbsTime,%{public}.3lf";
LABEL_341:
              _os_log_impl(&dword_21B6E4000, v310, OS_LOG_TYPE_ERROR, v312, (uint8_t *)v690, 0x20u);
            }
LABEL_342:
            sub_21B6EBAC4(v473);
            uint64_t v315 = (uint64_t)v2;
            int v316 = 1;
LABEL_343:
            sub_21B6EBAFC(v315, v316);
            atomic_store(0, (unsigned __int8 *)v2 + 1);
            return;
          }
          if (*((double *)&v593 + 1) >= v193 && v639 != 0 && v591 == 0)
          {
            long long v198 = v592;
            _OWORD *v469 = v591;
            *((_OWORD *)v2 + 633) = v198;
            *((_OWORD *)v2 + 634) = v593;
            *((void *)v2 + 1270) = v594;
            unsigned __int8 *v474 = v595;
            long long v199 = v597;
            _OWORD *v468 = v596;
            *(_OWORD *)(v2 + 10200) = v199;
            *((void *)v2 + 1277) = v598;
            long long v200 = v599;
            long long v201 = v600;
            long long v202 = v603;
            *(_OWORD *)(v2 + 10280) = v602;
            *(_OWORD *)(v2 + 10296) = v202;
            long long v203 = v601;
            *(_OWORD *)(v2 + 10248) = v201;
            *(_OWORD *)(v2 + 10264) = v203;
            _OWORD *v467 = v200;
            long long v204 = v604;
            long long v205 = v605;
            *((void *)v2 + 1294) = v606;
            _OWORD *v466 = v204;
            *((_OWORD *)v2 + 646) = v205;
            long long v206 = v609;
            _OWORD *v465 = v608;
            *((_OWORD *)v2 + 649) = v206;
            memcpy(__dst, v610, 0x128uLL);
            atomic_uchar *v480 = v610[296];
            long long v207 = v612;
            _OWORD *v463 = v611;
            *((_OWORD *)v2 + 671) = v207;
            *((void *)v2 + 1344) = v613;
            long long v208 = v617;
            *((_OWORD *)v2 + 675) = v616;
            *((_OWORD *)v2 + 676) = v208;
            *((_OWORD *)v2 + 677) = v618;
            long long v209 = v615;
            _OWORD *v462 = v614;
            *((_OWORD *)v2 + 674) = v209;
            long long v210 = v620;
            _OWORD *v461 = v619;
            *(_OWORD *)(v2 + 10872) = v210;
            *((void *)v2 + 1361) = v621;
            long long v211 = v623;
            _OWORD *v460 = v622;
            *(_OWORD *)(v2 + 10920) = v211;
            memcpy(v459, v624, 0x128uLL);
            long long v212 = v626;
            _OWORD *v458 = v625;
            *((_OWORD *)v2 + 704) = v212;
            long long v213 = v630;
            *(_OWORD *)(v2 + 11320) = v629;
            *(_OWORD *)(v2 + 11336) = v213;
            *(float64x2_t *)(v2 + 11352) = v631;
            long long v214 = v628;
            _OWORD *v457 = v627;
            *(_OWORD *)(v2 + 11304) = v214;
            v480[664] = LOBYTE(v632);
            float64x2_t v215 = v634;
            _OWORD *v456 = v633;
            *(float64x2_t *)(v2 + 11400) = v215;
            long long v216 = v638[0];
            *((_OWORD *)v2 + 716) = v637[1];
            *((_OWORD *)v2 + 717) = v216;
            *((_OWORD *)v2 + 718) = v638[1];
            long long v217 = v637[0];
            _OWORD *v455 = v636;
            *((_OWORD *)v2 + 715) = v217;
            long long v218 = v638[3];
            _OWORD *v454 = v638[2];
            *((_OWORD *)v2 + 720) = v218;
            v2[11536] = v639;
          }
          uint64_t v219 = *((void *)v2 + 844);
          uint64_t v220 = *((void *)v2 + 845);
          sub_21B6F7B74((uint64_t)v583, v220 - 1624, (uint64_t)buf);
          sub_21B6F57B0(v219 + 1544, (uint64_t)buf, (uint64_t)buf);
          for (uint64_t i1 = 0; i1 != 24; i1 += 8)
            *(double *)((char *)&v608 + i1) = *(double *)((char *)&v608 + i1) - *(double *)&v2[i1 + 4544];
          sub_21B6F5AF8(v220 - 1432, (uint64_t)&v591, (uint64_t)&v591);
          sub_21B6F5CDC(v219 + 1904, (uint64_t)&v591, (uint64_t)&v591);
          sub_21B6FA710((uint64_t)v690);
          sub_21B6F6028((uint64_t)v2, (uint64_t)buf, (uint64_t)&v591, (uint64_t)v690);
          if (*(unsigned char *)(v498 + 1) || *(unsigned char *)v498)
          {
            double v222 = *((double *)v2 + 1444);
            BOOL v223 = v222 > 0.0;
          }
          else
          {
            BOOL v223 = 0;
            double v222 = *((double *)v2 + 1444);
          }
          double v224 = *(double *)&buf[16];
          BOOL v225 = vabdd_f64(*(double *)&buf[16], v222) > 24.0 || v222 <= 0.0;
          BOOL v226 = sub_21B6F7CF0((uint64_t)buf);
          BOOL v227 = v226;
          if ((!v223 || v225) && !v226)
          {
            if (v639 && v584 && v704)
            {
              uint64_t v228 = 0;
              *(_OWORD *)&v565[8] = v608;
              *(_OWORD *)&v565[24] = v609;
              do
              {
                *(double *)&v565[v228 + 8] = *(double *)&v565[v228 + 8] - *(double *)&v2[v228 + 5576];
                v228 += 8;
              }
              while (v228 != 24);
              uint64_t v229 = 0;
              long double v230 = *(double *)&v565[8];
              long double v231 = *(double *)&v565[16];
              *(_OWORD *)&v688[1] = v705;
              *(int64x2_t *)&v688[3] = v706;
              do
              {
                *(double *)&v688[v229 + 1] = *(double *)&v688[v229 + 1] - *(double *)((char *)&v587 + v229 * 8);
                ++v229;
              }
              while (v229 != 3);
              double v232 = hypot(v230, v231);
              double v233 = hypot(*(long double *)&v688[1], *(long double *)&v688[2]);
              if (v232 >= 8.0)
              {
                int v448 = 1;
              }
              else
              {
                BOOL v235 = *(double *)&v583[40] > 0.0
                    && (*(double *)v234.i64 = v703, v703 > 0.0)
                    && v703 + *(double *)&qword_26AA49BC0 * *(double *)&v583[40] < v233
                    || vabdd_f64(v224, *((double *)v2 + 622)) >= 16.0;
                int v448 = v235;
              }
              uint64_t v252 = 0;
              *(void *)__info = &unk_26CB86830;
              long long v501 = v587;
              int64x2_t v502 = v588;
              do
              {
                *(double *)&__info[v252 + 2] = *(double *)&__info[v252 + 2] - *(double *)&v702[v252 * 4 + 384];
                v252 += 2;
              }
              while (v252 != 6);
              v688[0] = (uint64_t)&unk_26CB86890;
              memset(&v688[1], 0, 144);
              uint64_t v689 = 0;
              sub_21B6E7EE8(v471, v470, &v607, (uint64_t)v565, (int8x16_t)0, v234);
              *(_OWORD *)&v688[1] = *(_OWORD *)&v565[8];
              *(_OWORD *)&v688[3] = *(_OWORD *)&v565[24];
              *(_OWORD *)&v688[5] = *(_OWORD *)&v565[40];
              *(_OWORD *)&v688[7] = *(_OWORD *)&v565[56];
              v688[9] = v566[0];
              v688[18] = 0x3FF0000000000000;
              v688[14] = 0x3FF0000000000000;
              v688[10] = 0x3FF0000000000000;
              LOBYTE(v545) = 0;
              long long v546 = (__int128)v447;
              int64x2_t v547 = (int64x2_t)xmmword_21B6FEAA0;
              *(void *)&long long v548 = &v610[168];
              *((void *)&v548 + 1) = &v610[288];
              sub_21B6F9A74((uint64_t *)v565, (uint64_t)v471, (uint64_t *)&v545);
              __uint64_t n = &unk_26CB86850;
              float64x2_t v513 = 0u;
              float64x2_t v514 = 0u;
              float64x2_t v515 = 0u;
              float64x2_t v516 = 0u;
              long long v517 = 0u;
              long long v253 = *(double **)&v565[24];
              uint64_t v254 = *(double **)&v565[32];
              if (*(void *)&v565[24] != *(void *)&v565[32])
              {
                v255 = &v513;
                do
                {
                  float64_t v256 = *v253++;
                  v255->f64[0] = v256;
                  v255 = (float64x2_t *)((char *)v255 + 8);
                }
                while (v253 != v254);
              }
              sub_21B6EA254(v565);
              v565[0] = 0;
              *(int64x2_t *)&v565[8] = vdupq_n_s64(3uLL);
              *(_OWORD *)&v565[24] = xmmword_21B6FEA60;
              *(void *)&v565[40] = v2 + 6848;
              *(void *)&v565[48] = v2 + 6920;
              sub_21B6EB29C((double *)&__n, v565);
              for (uint64_t i2 = 0; i2 != 72; i2 += 8)
                *(double *)((char *)&__n + i2 + 8) = *(double *)((char *)&__n + i2 + 8) + *(double *)((char *)v589 + i2);
              sub_21B6F9C1C((uint64_t)v565, (uint64_t)v688, (uint64_t)__A);
              LOBYTE(__work) = 1;
              float64x2_t v535 = (float64x2_t)xmmword_21B700FB0;
              int64x2_t __C = (int64x2_t)xmmword_21B6FEA60;
              *(void *)&long long v537 = &v688[1];
              *((void *)&v537 + 1) = &v689;
              sub_21B6F9B48((uint64_t *)&v545, (uint64_t)v565, (uint64_t *)&__work);
              uint64_t v258 = 0;
              __lda = &unk_26CB86850;
              v562[2] = v515;
              float64x2_t v563 = v516;
              long long v564 = v517;
              v562[0] = v513;
              v562[1] = v514;
              uint64_t v259 = v547.i64[0];
              do
              {
                v562[0].f64[v258] = v562[0].f64[v258] + *(double *)(v259 + v258 * 8);
                ++v258;
              }
              while (v258 != 9);
              sub_21B6EA254(&v545);
              sub_21B6F9CCC((uint64_t)&v556, (uint64_t)&__lda);
              LOBYTE(v545) = 0;
              long long v546 = xmmword_21B6FEA80;
              int64x2_t v547 = vdupq_n_s64(1uLL);
              *(void *)&long long v548 = &v501;
              *((void *)&v548 + 1) = &v502.i64[1];
              __woruint64_t k = COERCE_DOUBLE(&unk_26CB86830);
              __C.i64[1] = 0;
              float64x2_t v535 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)((char *)v558 + 8), *((double *)&v501 + 1)), v557, *(double *)&v501), v559, *(double *)v502.i64);
              *(double *)__C.i64 = *((double *)&v501 + 1) * *((double *)&v558[1] + 1)
                                 + *(double *)v558 * *(double *)&v501
                                 + *(double *)&v560 * *(double *)v502.i64;
              sub_21B6F9DB4((uint64_t *)v565, (uint64_t)&v545, (uint64_t)&__work);
              v505 = &unk_26CB867D0;
              float64x2_t v506 = 0uLL;
              uint64_t v260 = *(double **)&v565[24];
              v261 = *(double **)&v565[32];
              double v188 = (unsigned __int8 *)v498;
              if (*(void *)&v565[24] != *(void *)&v565[32])
              {
                v262 = &v506;
                do
                {
                  float64_t v263 = *v260++;
                  v262->f64[0] = v263;
                  v262 = (float64x2_t *)((char *)v262 + 8);
                }
                while (v260 != v261);
              }
              sub_21B6EA254(v565);
              if (v506.f64[0] <= 6.7553467) {
                goto LABEL_297;
              }
              if (qword_267C5A9D8 != -1) {
                dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
              }
              v264 = qword_267C5A9E0;
              if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v565 = 134349312;
                *(void *)&v565[4] = *(void *)&buf[16];
                *(_WORD *)&v565[12] = 1026;
                *(_DWORD *)&v565[14] = v448;
                _os_log_impl(&dword_21B6E4000, v264, OS_LOG_TYPE_DEBUG, "CLVLF,updateWithCLPoints,Mahalanobis test failed,machAbsTime,%{public}.3lf,forceUpdateNeeded,%{public}d", v565, 0x12u);
              }
              if (v448)
              {
LABEL_297:
                sub_21B6F9C1C((uint64_t)&v545, (uint64_t)v688, (uint64_t)__A);
                LOBYTE(v525) = 0;
                long long v526 = xmmword_21B700FB0;
                *(_OWORD *)v527 = xmmword_21B6FEA60;
                *(void *)&v527[16] = &v546;
                double v528 = COERCE_DOUBLE(&v555);
                sub_21B6F9E44((uint64_t *)v565, (uint64_t)&v525, (uint64_t)&v556);
                __woruint64_t k = COERCE_DOUBLE(&unk_26CB86930);
                float64x2_t v535 = 0u;
                int64x2_t __C = 0u;
                long long v537 = 0u;
                long long v538 = 0u;
                long long v539 = 0u;
                long long v540 = 0u;
                long long v541 = 0u;
                long long v542 = 0u;
                long long v543 = 0u;
                uint64_t v544 = 0;
                v265 = *(double **)&v565[24];
                v266 = *(double **)&v565[32];
                if (*(void *)&v565[24] != *(void *)&v565[32])
                {
                  v267 = &v535;
                  do
                  {
                    float64_t v268 = *v265++;
                    v267->f64[0] = v268;
                    v267 = (float64x2_t *)((char *)v267 + 8);
                  }
                  while (v265 != v266);
                }
                sub_21B6EA254(v565);
                sub_21B6F9EE4((uint64_t)&v525, (uint64_t)&__work, (uint64_t)__info);
                *(float64x2_t *)(v498 + 208) = vaddq_f64(*(float64x2_t *)&v527[8], *(float64x2_t *)(v498 + 208));
                *((double *)v2 + 875) = v528 + *((double *)v2 + 875);
                sub_21B6F9F6C((uint64_t)v565, (uint64_t)&__work, (uint64_t)&v545);
                sub_21B6FBA80((uint64_t)__A, (uint64_t)v565);
                if (sqrt(*((double *)&v526 + 1) * *((double *)&v526 + 1)+ *(double *)&v526 * *(double *)&v526+ *(double *)v527 * *(double *)v527) != 0.0)
                {
                  LOBYTE(v508) = 0;
                  float64x2_t v509 = (float64x2_t)xmmword_21B6FEA60;
                  *(int64x2_t *)v510 = vdupq_n_s64(1uLL);
                  *(void *)&v510[16] = v2 + 6936;
                  *(void *)&double v511 = v2 + 6960;
                  memset(v565, 0, sizeof(v565));
                  sub_21B6EB4F8((uint64_t *)v565, &v508);
                  sub_21B6EB798((uint64_t)v565, v441);
                  *(void *)__lworuint64_t k = &unk_26CB86830;
                  float64x2_t v532 = 0u;
                  long long v533 = 0u;
                  v269 = *(double **)&v565[24];
                  v270 = *(double **)&v565[32];
                  if (*(void *)&v565[24] != *(void *)&v565[32])
                  {
                    v271 = &v532;
                    do
                    {
                      float64_t v272 = *v269++;
                      v271->f64[0] = v272;
                      v271 = (float64x2_t *)((char *)v271 + 8);
                    }
                    while (v269 != v270);
                  }
                  sub_21B6EA254(v565);
                  float64x2_t v273 = vaddq_f64((float64x2_t)v526, v532);
                  float64x2_t v532 = v273;
                  double v274 = *(double *)&v533;
                  *(double *)&long long v533 = *(double *)v527 + *(double *)&v533;
                  double v275 = *(double *)&v533;
                  *(double *)v276.i64 = sqrt(vmlad_n_f64(COERCE_DOUBLE(*(void *)&vmulq_f64(v273, v273).f64[1]), v273.f64[0], v273.f64[0])+ v275 * v275);
                  if (*(double *)v276.i64 == 0.0)
                  {
                    *(void *)v565 = &unk_26CB868B0;
                    int8x16_t v277 = 0uLL;
                    memset(&v565[8], 0, 40);
                  }
                  else
                  {
                    v277.i64[1] = v442.i64[1];
                    v277.i64[0] = v276.i64[0];
                    if (*(double *)v276.i64 > *(double *)v442.i64)
                    {
                      double v444 = *(double *)vbslq_s8(v446, v442, v276).i64;
                      uint64_t v445 = v276.i64[0];
                      float64x2_t v449 = v273;
                      *(double *)v277.i64 = fmod(*(double *)v276.i64 + v444, 6.28318531);
                      v276.i64[0] = v445;
                      *(void *)&double v278 = vbslq_s8(v446, v442, v277).u64[0];
                      if (*(double *)v277.i64 == 0.0) {
                        *(double *)v277.i64 = v278;
                      }
                      else {
                        *(double *)v277.i64 = *(double *)v277.i64 - v444;
                      }
                      float64x2_t v273 = v449;
                    }
                    *(void *)v565 = &unk_26CB868B0;
                    *(float64x2_t *)&v565[8] = vdivq_f64(v273, (float64x2_t)vdupq_lane_s64(v276.i64[0], 0));
                    double v274 = v275 / *(double *)v276.i64;
                    *(double *)&v565[24] = v275 / *(double *)v276.i64;
                    *(void *)&v565[32] = v277.i64[0];
                    *(void *)&v565[40] = 0;
                  }
                  sub_21B6E695C(v475, (uint64_t)v565, v277, v274, (int8x16_t)v273);
                  double v188 = (unsigned __int8 *)v498;
                }
                sub_21B6E7200(v475);
                if (qword_267C5A9D8 != -1) {
                  dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
                }
                v279 = qword_267C5A9E0;
                if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v280 = *((void *)v2 + 867);
                  uint64_t v281 = *((void *)v2 + 868);
                  uint64_t v282 = *((void *)v2 + 869);
                  double v283 = *((double *)v2 + 870) * 57.2957795;
                  uint64_t v284 = *((void *)v2 + 873);
                  uint64_t v285 = *((void *)v2 + 874);
                  uint64_t v286 = *((void *)v2 + 875);
                  uint64_t v287 = *((void *)v2 + 878);
                  uint64_t v288 = *((void *)v2 + 885);
                  uint64_t v289 = *((void *)v2 + 892);
                  uint64_t v290 = *((void *)v2 + 899);
                  uint64_t v291 = *((void *)v2 + 906);
                  uint64_t v292 = *((void *)v2 + 913);
                  *(_DWORD *)v565 = 134352385;
                  *(void *)&v565[4] = *(void *)&buf[16];
                  *(_WORD *)&v565[12] = 2049;
                  *(void *)&v565[14] = v280;
                  *(_WORD *)&v565[22] = 2049;
                  *(void *)&v565[24] = v281;
                  *(_WORD *)&v565[32] = 2049;
                  *(void *)&v565[34] = v282;
                  *(_WORD *)&v565[42] = 2049;
                  *(double *)&v565[44] = v283;
                  *(_WORD *)&v565[52] = 2049;
                  *(void *)&v565[54] = v284;
                  *(_WORD *)&v565[62] = 2049;
                  *(void *)&v565[64] = v285;
                  LOWORD(v566[0]) = 2049;
                  *(void *)((char *)v566 + 2) = v286;
                  WORD1(v566[1]) = 2049;
                  *(void *)((char *)&v566[1] + 4) = v287;
                  WORD2(v566[2]) = 2049;
                  *(void *)((char *)&v566[2] + 6) = v288;
                  HIWORD(v566[3]) = 2049;
                  v566[4] = v289;
                  LOWORD(v567[0]) = 2049;
                  *(void *)((char *)v567 + 2) = v290;
                  WORD5(v567[0]) = 2049;
                  *(void *)((char *)v567 + 12) = v291;
                  WORD2(v567[1]) = 2049;
                  *(void *)((char *)&v567[1] + 6) = v292;
                  _os_log_impl(&dword_21B6E4000, v279, OS_LOG_TYPE_DEBUG, "CLVLF,updateWithCLPoints,Filter updated,machAbsTime,%{public}.3lf,vio2enu,[%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf],vio2enu_cov_diag,[%{private}.6lf,%{private}.6lf,%{private}.6lf,%{private}.6lf,%{private}.6lf,%{private}.6lf]", v565, 0x8Eu);
                }
                int v250 = 1;
                goto LABEL_319;
              }
            }
            else
            {
              double v188 = (unsigned __int8 *)v498;
              if (qword_267C5A9D8 != -1) {
                dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
              }
              v251 = qword_267C5A9E0;
              if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v565 = 134349824;
                *(void *)&v565[4] = *(void *)&buf[16];
                *(_WORD *)&v565[12] = 1026;
                *(_DWORD *)&v565[14] = v639;
                *(_WORD *)&v565[18] = 1026;
                *(_DWORD *)&v565[20] = v584;
                *(_WORD *)&v565[24] = 1026;
                *(_DWORD *)&v565[26] = v704;
                _os_log_impl(&dword_21B6E4000, v251, OS_LOG_TYPE_ERROR, "CLVLF,updateWithCLPoints,Invalid measurement,machAbsTime,%{public}.3lf,isVioSynced,%{public}d,isLocEnuValid,%{public}d,isPredictedStateEnuValid,%{public}d", v565, 0x1Eu);
              }
            }
            int v250 = 0;
            goto LABEL_319;
          }
          if (qword_267C5A9D8 != -1) {
            dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
          }
          long long v236 = qword_267C5A9E0;
          if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v237 = *((void *)v2 + 867);
            uint64_t v238 = *((void *)v2 + 868);
            uint64_t v239 = *((void *)v2 + 869);
            double v240 = *((double *)v2 + 870) * 57.2957795;
            uint64_t v241 = *((void *)v2 + 873);
            uint64_t v242 = *((void *)v2 + 874);
            uint64_t v243 = *((void *)v2 + 875);
            uint64_t v244 = *((void *)v2 + 878);
            uint64_t v245 = *((void *)v2 + 885);
            uint64_t v246 = *((void *)v2 + 892);
            uint64_t v247 = *((void *)v2 + 899);
            uint64_t v248 = *((void *)v2 + 906);
            uint64_t v249 = *((void *)v2 + 913);
            *(_DWORD *)v565 = 134353153;
            *(void *)&v565[4] = *(void *)&buf[16];
            *(_WORD *)&v565[12] = 1026;
            *(_DWORD *)&v565[14] = v223;
            *(_WORD *)&v565[18] = 1026;
            *(_DWORD *)&v565[20] = v225;
            *(_WORD *)&v565[24] = 1026;
            *(_DWORD *)&v565[26] = v227;
            *(_WORD *)&v565[30] = 2049;
            *(void *)&v565[32] = v237;
            *(_WORD *)&v565[40] = 2049;
            *(void *)&v565[42] = v238;
            *(_WORD *)&v565[50] = 2049;
            *(void *)&v565[52] = v239;
            *(_WORD *)&v565[60] = 2049;
            *(double *)&v565[62] = v240;
            *(_WORD *)&v565[70] = 2049;
            v566[0] = v241;
            LOWORD(v566[1]) = 2049;
            *(void *)((char *)&v566[1] + 2) = v242;
            WORD1(v566[2]) = 2049;
            *(void *)((char *)&v566[2] + 4) = v243;
            WORD2(v566[3]) = 2049;
            *(void *)((char *)&v566[3] + 6) = v244;
            HIWORD(v566[4]) = 2049;
            *(void *)&v567[0] = v245;
            WORD4(v567[0]) = 2049;
            *(void *)((char *)v567 + 10) = v246;
            WORD1(v567[1]) = 2049;
            *(void *)((char *)&v567[1] + 4) = v247;
            WORD6(v567[1]) = 2049;
            *(void *)((char *)&v567[1] + 14) = v248;
            WORD3(v567[2]) = 2049;
            *((void *)&v567[2] + 1) = v249;
            _os_log_impl(&dword_21B6E4000, v236, OS_LOG_TYPE_DEBUG, "CLVLF,fuseWithPoints,Update skipped,machAbsTime,%{public}.3lf,hasVlfEngaged,%{public}d,hasVlfTimedOut,%{public}d,isDevicestatic,%{public}d,vio2enu,[%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf],vio2enu_cov_diag,[%{private}.6lf,%{private}.6lf,%{private}.6lf,%{private}.6lf,%{private}.6lf,%{private}.6lf]", v565, 0xA0u);
          }
          int v250 = 0;
          double v188 = (unsigned __int8 *)v498;
LABEL_319:
          long long v293 = *(_OWORD *)&buf[16];
          _OWORD *v493 = *(_OWORD *)buf;
          *((_OWORD *)v2 + 497) = v293;
          long long v294 = v582;
          _OWORD *v491 = v581;
          *(_OWORD *)(v2 + 7992) = v294;
          long long v295 = *(_OWORD *)&v583[24];
          *(_OWORD *)__a = *(_OWORD *)&v583[8];
          *((_OWORD *)v2 + 502) = v295;
          v2[8096] = v584;
          long long v296 = *(_OWORD *)&v583[72];
          long long v297 = *(_OWORD *)&v583[40];
          *((_OWORD *)v2 + 504) = *(_OWORD *)&v583[56];
          *((_OWORD *)v2 + 505) = v296;
          _OWORD *v488 = v297;
          long long v298 = v586;
          _OWORD *v486 = v585;
          *((_OWORD *)v2 + 508) = v298;
          int64x2_t v299 = v588;
          long long *v485 = v587;
          *(int64x2_t *)(v2 + 8168) = v299;
          long long v300 = v589[4];
          long long v301 = v589[2];
          *((_OWORD *)v2 + 515) = v589[3];
          *((_OWORD *)v2 + 516) = v300;
          long long v302 = v589[1];
          *double __B = v589[0];
          *((_OWORD *)v2 + 513) = v302;
          *((_OWORD *)v2 + 514) = v301;
          long long v303 = v589[5];
          *((void *)v2 + 1036) = v590;
          _OWORD *v484 = v303;
          *((_DWORD *)v2 + 2074) = 0;
          sub_21B6F6244((uint64_t)&v591, v188);
          sub_21B6F6498((uint64_t)&v591, v188);
          sub_21B6F6734((uint64_t)v188, v304, v305, v306);
          sub_21B6F6B00((uint64_t)v2, (uint64_t)buf);
          sub_21B6F7250((uint64_t)v2, (uint64_t)&v591);
          sub_21B6F7D88((uint64_t)v483, (uint64_t)buf);
          if (v250) {
            sub_21B6F74F8(v452, (uint64_t)v188);
          }
          unint64_t v307 = *((void *)v2 + 845);
          uint64_t v308 = *((void *)v2 + 844);
          if ((unint64_t)(0x13A524387AC82261 * ((uint64_t)(v307 - v308) >> 3)) >= 4)
          {
            unint64_t v307 = sub_21B6FB528(v308 + 3336, *((void *)v2 + 845), v308);
            *((void *)v2 + 845) = v307;
          }
          if (v307 >= *((void *)v2 + 846))
          {
            uint64_t v309 = sub_21B6FB580(v453, (uint64_t)v188);
          }
          else
          {
            sub_21B6FB69C(v307, (uint64_t)v188);
            uint64_t v309 = v307 + 3336;
          }
          *((void *)v2 + 845) = v309;
          if (!sub_21B6F78F0(v2))
          {
            if (qword_267C5A9D8 != -1) {
              dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
            }
            v313 = qword_267C5A9E0;
            if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
            {
              uint64_t v314 = *((void *)v2 + 1042);
              *(_DWORD *)v565 = 134349056;
              *(void *)&v565[4] = v314;
              _os_log_impl(&dword_21B6E4000, v313, OS_LOG_TYPE_ERROR, "CLVLF,fuseWithPoints,Filter reset,unhealthy state,machAbsTime,%{public}.3lf", v565, 0xCu);
            }
            sub_21B6EBAC4(v473);
            uint64_t v315 = (uint64_t)v2;
            int v316 = 0;
            goto LABEL_343;
          }
          continue;
        }
      }
      char v499 = 1;
      sub_21B6E9E1C((uint64_t)buf, &v499, (uint64_t)v565);
      if (v499)
      {
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
        }
        float64x2_t v174 = qword_267C5A9E0;
        if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v690[0]) = 134349056;
          *(double *)((char *)v690 + 4) = *(double *)&buf[8];
          double v175 = "CLVLF,fuseWithFrames,Unable to convert VLF to LOC,machAbsTime,%{public}.3lf";
LABEL_182:
          _os_log_impl(&dword_21B6E4000, v174, OS_LOG_TYPE_ERROR, v175, (uint8_t *)v690, 0xCu);
        }
        goto LABEL_215;
      }
      *(_DWORD *)v565 = *((_DWORD *)v2 + 3318);
      v567[1] = *(_OWORD *)(v480 + 2696);
      v567[2] = *(_OWORD *)(v480 + 2712);
      uint64_t v38 = *((void *)v2 + 844);
      sub_21B6F57B0(v38 + 1544, (uint64_t)v565, (uint64_t)v565);
      for (uint64_t i3 = 0; i3 != 24; i3 += 8)
        *(double *)((char *)&v652 + i3) = *(double *)((char *)&v652 + i3) - *(double *)&v2[i3 + 4544];
      sub_21B6F5AF8(*((void *)v2 + 845) - 1432, (uint64_t)v638 + 8, (uint64_t)v638 + 8);
      sub_21B6F5CDC(v38 + 1904, (uint64_t)v638 + 8, (uint64_t)v638 + 8);
      sub_21B6FA710((uint64_t)v690);
      sub_21B6F6028((uint64_t)v2, (uint64_t)v565, (uint64_t)v638 + 8, (uint64_t)v690);
      uint64_t v40 = 0;
      *(_OWORD *)&v688[1] = v652;
      *(_OWORD *)&v688[3] = v653;
      do
      {
        *(double *)&v688[v40 + 1] = *(double *)&v688[v40 + 1] - *(double *)&v2[v40 * 8 + 5576];
        ++v40;
      }
      while (v40 != 3);
      long double v41 = *(double *)&v688[1];
      long double v42 = *(double *)&v688[2];
      long long v546 = v705;
      int64x2_t v547 = v706;
      for (uint64_t i4 = 1392; i4 != 1416; i4 += 8)
        *(double *)((char *)&v545 + i4 - 1384) = *(double *)((char *)&v545 + i4 - 1384) - *(double *)&buf[i4];
      double v44 = hypot(v41, v42);
      double v45 = hypot(*(long double *)&v546, *((long double *)&v546 + 1));
      if (v44 >= 8.0)
      {
        BOOL v48 = 1;
      }
      else
      {
        v46.i64[0] = *(void *)&v634.f64[1];
        double v47 = sqrt(v631.f64[0] + v634.f64[1]);
        BOOL v48 = v47 > 0.0 && (*(double *)v46.i64 = v703, v703 > 0.0) && v703 + *(double *)&qword_26AA49BC0 * v47 < v45
           || vabdd_f64(*(double *)&buf[8], *((double *)v2 + 622)) >= 16.0;
      }
      *(void *)__lworuint64_t k = &unk_26CB86830;
      float64x2_t v532 = *(float64x2_t *)&v624[25];
      long long v533 = *(_OWORD *)&v624[27];
      for (unint64_t i5 = 744; i5 != 768; i5 += 8)
        *(double *)&__lwork[i5 / 4 - 184] = *(double *)&__lwork[i5 / 4 - 184] - v690[i5 / 8];
      v545 = &unk_26CB86890;
      long long v546 = 0u;
      int64x2_t v547 = 0u;
      long long v548 = 0u;
      long long v549 = 0u;
      long long v550 = 0u;
      long long v551 = 0u;
      long long v552 = 0u;
      long long v553 = 0u;
      long long v554 = 0u;
      uint64_t v555 = 0;
      sub_21B6E7EE8(v471, v470, &v651, (uint64_t)v688, (int8x16_t)0, v46);
      long long v546 = *(_OWORD *)&v688[1];
      int64x2_t v547 = *(int64x2_t *)&v688[3];
      long long v548 = *(_OWORD *)&v688[5];
      long long v549 = *(_OWORD *)&v688[7];
      *(void *)&long long v550 = v688[9];
      *((void *)&v554 + 1) = 0x3FF0000000000000;
      *((void *)&v552 + 1) = 0x3FF0000000000000;
      *((void *)&v550 + 1) = 0x3FF0000000000000;
      LOBYTE(__work) = 0;
      float64x2_t v535 = (float64x2_t)v443;
      int64x2_t __C = (int64x2_t)xmmword_21B6FEAA0;
      *(void *)&long long v537 = &v654[168];
      *((void *)&v537 + 1) = &v654[288];
      sub_21B6F9A74(v688, (uint64_t)v471, (uint64_t *)&__work);
      __lda = &unk_26CB86850;
      memset(v562, 0, sizeof(v562));
      float64x2_t v563 = 0u;
      long long v564 = 0u;
      uint64_t v50 = (double *)v688[3];
      uint64_t v51 = v688[4];
      if (v688[3] != v688[4])
      {
        uint64_t v52 = v562;
        do
        {
          float64_t v53 = *v50++;
          v52->f64[0] = v53;
          uint64_t v52 = (float64x2_t *)((char *)v52 + 8);
        }
        while (v50 != (double *)v51);
      }
      sub_21B6EA254(v688);
      LOBYTE(v688[0]) = 0;
      *(int64x2_t *)&v688[1] = vdupq_n_s64(3uLL);
      *(_OWORD *)&v688[3] = xmmword_21B6FEA60;
      v688[5] = (uint64_t)(v2 + 6848);
      v688[6] = (uint64_t)(v2 + 6920);
      sub_21B6EB29C((double *)&__lda, v688);
      v562[0] = vaddq_f64(v631, v562[0]);
      v562[1].f64[0] = v632 + v562[1].f64[0];
      *(float64x2_t *)((char *)&v562[1] + 8) = vaddq_f64(v634, *(float64x2_t *)((char *)&v562[1] + 8));
      v562[2].f64[1] = v635 + v562[2].f64[1];
      float64x2_t v563 = vaddq_f64(*(float64x2_t *)((char *)v637 + 8), v563);
      *(double *)&long long v564 = *((double *)&v637[1] + 1) + *(double *)&v564;
      sub_21B6F9C1C((uint64_t)v688, (uint64_t)&v545, (uint64_t)__A);
      LOBYTE(__n) = 1;
      float64x2_t v513 = (float64x2_t)xmmword_21B700FB0;
      float64x2_t v514 = (float64x2_t)xmmword_21B6FEA60;
      *(void *)&v515.f64[0] = &v546;
      *(void *)&v515.f64[1] = &v555;
      sub_21B6F9B48((uint64_t *)&__work, (uint64_t)v688, (uint64_t *)&__n);
      uint64_t v54 = 0;
      v556 = &unk_26CB86850;
      v558[1] = v562[2];
      float64x2_t v559 = v563;
      long long v560 = v564;
      float64x2_t v557 = v562[0];
      v558[0] = v562[1];
      uint64_t v55 = __C.i64[0];
      do
      {
        *(double *)((char *)&v556 + v54 + 8) = *(double *)((char *)&v556 + v54 + 8) + *(double *)(v55 + v54);
        v54 += 8;
      }
      while (v54 != 72);
      sub_21B6EA254(&__work);
      sub_21B6F9CCC((uint64_t)&v525, (uint64_t)&v556);
      LOBYTE(__work) = 0;
      float64x2_t v535 = (float64x2_t)xmmword_21B6FEA80;
      int64x2_t __C = vdupq_n_s64(1uLL);
      *(void *)&long long v537 = &v532;
      *((void *)&v537 + 1) = (char *)&v533 + 8;
      __uint64_t n = &unk_26CB86830;
      v514.f64[1] = 0.0;
      float64x2_t v513 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v527[8], v532.f64[1]), (float64x2_t)v526, v532.f64[0]), v529, *(double *)&v533);
      v514.f64[0] = v532.f64[1] * v528 + *(double *)v527 * v532.f64[0] + v530 * *(double *)&v533;
      sub_21B6F9DB4(v688, (uint64_t)&__work, (uint64_t)&__n);
      v523 = &unk_26CB867D0;
      v524[0] = 0.0;
      v524[1] = 0.0;
      char v56 = (uint64_t *)v688[3];
      uint64_t v57 = v688[4];
      if (v688[3] != v688[4])
      {
        long long v58 = v524;
        do
        {
          uint64_t v59 = *v56++;
          *(void *)v58++ = v59;
        }
        while (v56 != (uint64_t *)v57);
      }
      sub_21B6EA254(v688);
      if (v524[0] <= 8.02488176) {
        goto LABEL_75;
      }
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
      }
      long long v60 = qword_267C5A9E0;
      if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v688[0]) = 134349312;
        *(uint64_t *)((char *)v688 + 4) = *(void *)&buf[8];
        WORD2(v688[1]) = 1026;
        *(_DWORD *)((char *)&v688[1] + 6) = v48;
        _os_log_impl(&dword_21B6E4000, v60, OS_LOG_TYPE_DEBUG, "CLVLF,updateWithVLPoints,Mahalanobis test failed,machAbsTime,%{public}.3lf,forceUpdateNeeded,%{public}d", (uint8_t *)v688, 0x12u);
      }
      if (v48)
      {
LABEL_75:
        sub_21B6F9C1C((uint64_t)&__work, (uint64_t)&v545, (uint64_t)__A);
        LOBYTE(v508) = 0;
        float64x2_t v509 = (float64x2_t)xmmword_21B700FB0;
        *(_OWORD *)v510 = xmmword_21B6FEA60;
        *(void *)&v510[16] = &v535;
        double v511 = COERCE_DOUBLE(&v544);
        sub_21B6F9E44(v688, (uint64_t)&v508, (uint64_t)&v525);
        __uint64_t n = &unk_26CB86930;
        float64x2_t v513 = 0u;
        float64x2_t v514 = 0u;
        float64x2_t v515 = 0u;
        float64x2_t v516 = 0u;
        long long v517 = 0u;
        long long v518 = 0u;
        long long v519 = 0u;
        long long v520 = 0u;
        long long v521 = 0u;
        uint64_t v522 = 0;
        long long v61 = (double *)v688[3];
        uint64_t v62 = v688[4];
        if (v688[3] != v688[4])
        {
          long long v63 = &v513;
          do
          {
            float64_t v64 = *v61++;
            v63->f64[0] = v64;
            long long v63 = (float64x2_t *)((char *)v63 + 8);
          }
          while (v61 != (double *)v62);
        }
        sub_21B6EA254(v688);
        sub_21B6F9EE4((uint64_t)&v508, (uint64_t)&__n, (uint64_t)__lwork);
        *(float64x2_t *)(v498 + 208) = vaddq_f64(*(float64x2_t *)&v510[8], *(float64x2_t *)(v498 + 208));
        *((double *)v2 + 875) = v511 + *((double *)v2 + 875);
        sub_21B6F9F6C((uint64_t)v688, (uint64_t)&__n, (uint64_t)&__work);
        sub_21B6FBA80((uint64_t)__A, (uint64_t)v688);
        if (sqrt(v509.f64[1] * v509.f64[1] + v509.f64[0] * v509.f64[0] + *(double *)v510 * *(double *)v510) != 0.0)
        {
          LOBYTE(__info[0]) = 0;
          long long v501 = xmmword_21B6FEA60;
          int64x2_t v502 = vdupq_n_s64(1uLL);
          v503 = (unsigned __int8 *)(v2 + 6936);
          v504 = (unsigned __int8 *)(v2 + 6960);
          memset(v688, 0, 72);
          sub_21B6EB4F8(v688, __info);
          sub_21B6EB798((uint64_t)v688, v441);
          v505 = &unk_26CB86830;
          float64x2_t v506 = 0u;
          long long v507 = 0u;
          long long v65 = (double *)v688[3];
          uint64_t v66 = v688[4];
          if (v688[3] != v688[4])
          {
            long long v67 = &v506;
            do
            {
              float64_t v68 = *v65++;
              v67->f64[0] = v68;
              long long v67 = (float64x2_t *)((char *)v67 + 8);
            }
            while (v65 != (double *)v66);
          }
          sub_21B6EA254(v688);
          float64x2_t v69 = vaddq_f64(v509, v506);
          float64x2_t v506 = v69;
          double v70 = *(double *)&v507;
          double v71 = *(double *)v510 + *(double *)&v507;
          *(double *)&long long v507 = v71;
          *(double *)v72.i64 = sqrt(vmlad_n_f64(COERCE_DOUBLE(*(void *)&vmulq_f64(v69, v69).f64[1]), v69.f64[0], v69.f64[0])+ v71 * v71);
          if (*(double *)v72.i64 == 0.0)
          {
            v688[0] = (uint64_t)&unk_26CB868B0;
            int8x16_t v73 = 0uLL;
            memset(&v688[1], 0, 40);
          }
          else
          {
            v73.i64[1] = v442.i64[1];
            v73.i64[0] = v72.i64[0];
            if (*(double *)v72.i64 > *(double *)v442.i64)
            {
              double v438 = *(double *)vbslq_s8(v440, v442, v72).i64;
              uint64_t v439 = v72.i64[0];
              float64x2_t v477 = v69;
              *(double *)v73.i64 = fmod(*(double *)v72.i64 + v438, 6.28318531);
              v72.i64[0] = v439;
              *(void *)&double v74 = vbslq_s8(v440, v442, v73).u64[0];
              if (*(double *)v73.i64 == 0.0) {
                *(double *)v73.i64 = v74;
              }
              else {
                *(double *)v73.i64 = *(double *)v73.i64 - v438;
              }
              float64x2_t v69 = v477;
            }
            v688[0] = (uint64_t)&unk_26CB868B0;
            *(float64x2_t *)&v688[1] = vdivq_f64(v69, (float64x2_t)vdupq_lane_s64(v72.i64[0], 0));
            double v70 = v71 / *(double *)v72.i64;
            *(double *)&v688[3] = v71 / *(double *)v72.i64;
            v688[4] = v73.i64[0];
            v688[5] = 0;
          }
          sub_21B6E695C(v475, (uint64_t)v688, v73, v70, (int8x16_t)v69);
        }
        sub_21B6E7200(v475);
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
        }
        long long v75 = qword_267C5A9E0;
        if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v76 = *((void *)v2 + 867);
          uint64_t v77 = *((void *)v2 + 868);
          uint64_t v78 = *((void *)v2 + 869);
          double v79 = *((double *)v2 + 870) * 57.2957795;
          uint64_t v80 = *((void *)v2 + 873);
          uint64_t v81 = *((void *)v2 + 874);
          uint64_t v82 = *((void *)v2 + 875);
          uint64_t v83 = *((void *)v2 + 878);
          uint64_t v84 = *((void *)v2 + 885);
          uint64_t v85 = *((void *)v2 + 892);
          uint64_t v86 = *((void *)v2 + 899);
          uint64_t v87 = *((void *)v2 + 906);
          uint64_t v88 = *((void *)v2 + 913);
          LODWORD(v688[0]) = 134352385;
          *(uint64_t *)((char *)v688 + 4) = *(void *)&buf[8];
          WORD2(v688[1]) = 2049;
          *(uint64_t *)((char *)&v688[1] + 6) = v76;
          HIWORD(v688[2]) = 2049;
          v688[3] = v77;
          LOWORD(v688[4]) = 2049;
          *(uint64_t *)((char *)&v688[4] + 2) = v78;
          WORD1(v688[5]) = 2049;
          *(double *)((char *)&v688[5] + 4) = v79;
          WORD2(v688[6]) = 2049;
          *(uint64_t *)((char *)&v688[6] + 6) = v80;
          HIWORD(v688[7]) = 2049;
          v688[8] = v81;
          LOWORD(v688[9]) = 2049;
          *(uint64_t *)((char *)&v688[9] + 2) = v82;
          WORD1(v688[10]) = 2049;
          *(uint64_t *)((char *)&v688[10] + 4) = v83;
          WORD2(v688[11]) = 2049;
          *(uint64_t *)((char *)&v688[11] + 6) = v84;
          HIWORD(v688[12]) = 2049;
          v688[13] = v85;
          LOWORD(v688[14]) = 2049;
          *(uint64_t *)((char *)&v688[14] + 2) = v86;
          WORD1(v688[15]) = 2049;
          *(uint64_t *)((char *)&v688[15] + 4) = v87;
          WORD2(v688[16]) = 2049;
          *(uint64_t *)((char *)&v688[16] + 6) = v88;
          _os_log_impl(&dword_21B6E4000, v75, OS_LOG_TYPE_DEBUG, "CLVLF,updateWithVLPoints,Filter updated,machAbsTime,%{public}.3lf,vio2enu,[%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf],vio2enu_cov_diag,[%{private}.6lf,%{private}.6lf,%{private}.6lf,%{private}.6lf,%{private}.6lf,%{private}.6lf]", (uint8_t *)v688, 0x8Eu);
        }
        int v478 = 1;
      }
      else
      {
        int v478 = 0;
      }
      long long v89 = *(_OWORD *)&v565[16];
      _OWORD *v493 = *(_OWORD *)v565;
      *((_OWORD *)v2 + 497) = v89;
      long long v90 = *(_OWORD *)&v565[56];
      _OWORD *v491 = *(_OWORD *)&v565[40];
      *(_OWORD *)(v2 + 7992) = v90;
      long long v91 = *(_OWORD *)&v566[3];
      *(_OWORD *)__a = *(_OWORD *)&v566[1];
      *((_OWORD *)v2 + 502) = v91;
      v2[8096] = v568;
      long long v92 = v567[2];
      long long v93 = v567[0];
      *((_OWORD *)v2 + 504) = v567[1];
      *((_OWORD *)v2 + 505) = v92;
      _OWORD *v488 = v93;
      long long v94 = v570;
      _OWORD *v486 = v569;
      *((_OWORD *)v2 + 508) = v94;
      long long v95 = v572;
      long long *v485 = v571;
      *(_OWORD *)(v2 + 8168) = v95;
      long long v96 = v576;
      *((_OWORD *)v2 + 514) = v575;
      *((_OWORD *)v2 + 515) = v96;
      *((_OWORD *)v2 + 516) = v577;
      long long v97 = v574;
      *double __B = v573;
      *((_OWORD *)v2 + 513) = v97;
      *((void *)v2 + 1036) = v579;
      _OWORD *v484 = v578;
      *((_DWORD *)v2 + 2074) = 0;
      sub_21B6F6244((uint64_t)v638 + 8, (unsigned __int8 *)v498);
      sub_21B6F6498((uint64_t)v638 + 8, (unsigned __int8 *)v498);
      sub_21B6F6734(v498, v98, v99, v100);
      sub_21B6F6B00((uint64_t)v2, (uint64_t)v565);
      sub_21B6F7250((uint64_t)v2, (uint64_t)v638 + 8);
      long long v101 = *(_OWORD *)&v565[16];
      _OWORD *v483 = *(_OWORD *)v565;
      *((_OWORD *)v2 + 521) = v101;
      long long v102 = *(_OWORD *)&v565[56];
      *(_OWORD *)(v2 + 8360) = *(_OWORD *)&v565[40];
      *(_OWORD *)(v2 + 8376) = v102;
      long long v103 = *(_OWORD *)&v566[3];
      *((_OWORD *)v2 + 525) = *(_OWORD *)&v566[1];
      *((_OWORD *)v2 + 526) = v103;
      v2[8480] = v568;
      long long v104 = v567[2];
      long long v105 = v567[0];
      *((_OWORD *)v2 + 528) = v567[1];
      *((_OWORD *)v2 + 529) = v104;
      *((_OWORD *)v2 + 527) = v105;
      long long v106 = v570;
      *((_OWORD *)v2 + 531) = v569;
      *((_OWORD *)v2 + 532) = v106;
      long long v107 = v572;
      *(_OWORD *)(v2 + 8536) = v571;
      *(_OWORD *)(v2 + 8552) = v107;
      long long v108 = v576;
      *((_OWORD *)v2 + 538) = v575;
      *((_OWORD *)v2 + 539) = v108;
      *((_OWORD *)v2 + 540) = v577;
      long long v109 = v574;
      *((_OWORD *)v2 + 536) = v573;
      *((_OWORD *)v2 + 537) = v109;
      *((void *)v2 + 1084) = v579;
      *((_OWORD *)v2 + 541) = v578;
      *((void *)v2 + 1091) = *((void *)&v638[3] + 1);
      long long v110 = *(_OWORD *)((char *)&v638[2] + 8);
      long long v111 = *(_OWORD *)((char *)v638 + 8);
      *(_OWORD *)(v2 + 8696) = *(_OWORD *)((char *)&v638[1] + 8);
      *(_OWORD *)(v2 + 8712) = v110;
      *(_OWORD *)(v2 + 8680) = v111;
      unsigned __int8 *v450 = v639;
      long long v112 = v641;
      *((_OWORD *)v2 + 547) = v640;
      *((_OWORD *)v2 + 548) = v112;
      *((void *)v2 + 1098) = v642;
      long long v113 = v643;
      long long v114 = v644;
      long long v115 = v647;
      *((_OWORD *)v2 + 553) = v646;
      *((_OWORD *)v2 + 554) = v115;
      long long v116 = v645;
      *((_OWORD *)v2 + 551) = v114;
      *((_OWORD *)v2 + 552) = v116;
      *((_OWORD *)v2 + 550) = v113;
      long long v117 = v648;
      long long v118 = v649;
      *((void *)v2 + 1115) = v650;
      *(_OWORD *)(v2 + 8888) = v117;
      *(_OWORD *)(v2 + 8904) = v118;
      long long v119 = v653;
      *(_OWORD *)(v2 + 8936) = v652;
      *(_OWORD *)(v2 + 8952) = v119;
      memcpy(v2 + 8976, v654, 0x128uLL);
      atomic_uchar *v451 = v655;
      long long v120 = v657;
      *(_OWORD *)(v2 + 9288) = v656;
      *(_OWORD *)(v2 + 9304) = v120;
      *((void *)v2 + 1165) = v658;
      long long v121 = v662;
      *(_OWORD *)(v2 + 9368) = v661;
      *(_OWORD *)(v2 + 9384) = v121;
      *(_OWORD *)(v2 + 9400) = v663;
      long long v122 = v660;
      *(_OWORD *)(v2 + 9336) = v659;
      *(_OWORD *)(v2 + 9352) = v122;
      long long v123 = v665;
      *((_OWORD *)v2 + 589) = v664;
      *((_OWORD *)v2 + 590) = v123;
      *((void *)v2 + 1182) = v666;
      long long v124 = v668;
      *((_OWORD *)v2 + 592) = v667;
      *((_OWORD *)v2 + 593) = v124;
      memcpy(v2 + 9512, v669, 0x128uLL);
      long long v125 = v671;
      *(_OWORD *)(v2 + 9816) = v670;
      *(_OWORD *)(v2 + 9832) = v125;
      long long v126 = v675;
      *((_OWORD *)v2 + 618) = v674;
      *((_OWORD *)v2 + 619) = v126;
      *((_OWORD *)v2 + 620) = v676;
      long long v127 = v673;
      *((_OWORD *)v2 + 616) = v672;
      *((_OWORD *)v2 + 617) = v127;
      v451[664] = v677;
      long long v128 = v679;
      *((_OWORD *)v2 + 622) = v678;
      *((_OWORD *)v2 + 623) = v128;
      long long v129 = v683;
      *(_OWORD *)(v2 + 10024) = v682;
      *(_OWORD *)(v2 + 10040) = v129;
      *(_OWORD *)(v2 + 10056) = v684;
      long long v130 = v681;
      *(_OWORD *)(v2 + 9992) = v680;
      *(_OWORD *)(v2 + 10008) = v130;
      long long v131 = v686;
      *(_OWORD *)(v2 + 10072) = v685;
      *(_OWORD *)(v2 + 10088) = v131;
      v2[10104] = v687;
      if (v478) {
        sub_21B6F74F8(v452, v498);
      }
      unint64_t v132 = *((void *)v2 + 845);
      uint64_t v133 = *((void *)v2 + 844);
      if ((unint64_t)(0x13A524387AC82261 * ((uint64_t)(v132 - v133) >> 3)) >= 4)
      {
        unint64_t v132 = sub_21B6FB528(v133 + 3336, *((void *)v2 + 845), v133);
        *((void *)v2 + 845) = v132;
      }
      if (v132 >= *((void *)v2 + 846))
      {
        uint64_t v134 = sub_21B6FB580(v453, v498);
      }
      else
      {
        sub_21B6FB69C(v132, v498);
        uint64_t v134 = v132 + 3336;
      }
      *((void *)v2 + 845) = v134;
      if (!sub_21B6F78F0(v2))
      {
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
        }
        double v176 = qword_267C5A9E0;
        if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v688[0]) = 134349056;
          *(uint64_t *)((char *)v688 + 4) = *(void *)&buf[8];
          _os_log_impl(&dword_21B6E4000, v176, OS_LOG_TYPE_ERROR, "CLVLF,fuseWithFrames,Filter reset,unhealthy state,machAbsTime,%{public}.3lf", (uint8_t *)v688, 0xCu);
        }
        sub_21B6EBAC4(v473);
        uint64_t v177 = (uint64_t)v2;
        int v178 = 0;
LABEL_213:
        sub_21B6EBAFC(v177, v178);
        uint64_t v170 = (unsigned __int8 *)(v2 + 1);
LABEL_214:
        atomic_store(0, v170);
        goto LABEL_215;
      }
    }
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    double v171 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v172 = *((void *)v2 + 250);
      LODWORD(v690[0]) = 134349568;
      *(double *)((char *)v690 + 4) = *(double *)&v638[3];
      WORD2(v690[1]) = 2050;
      *(void *)((char *)&v690[1] + 6) = v172;
      HIWORD(v690[2]) = 2050;
      v690[3] = *((double *)&v638[1] + 1);
      float64x2_t v173 = "CLVLF,fuseWithFrames,Filter reset,VIO session is re-initialized,machAbsTime,%{public}.3lf,prevOriginTimesta"
             "mp,%{public}.3lf,currOriginTimestamp,%{public}.3lf";
      goto LABEL_211;
    }
    goto LABEL_212;
  }
LABEL_108:
  if (*((double *)v2 + 1444) > 0.0)
  {
    __Aa = (double *)(v2 + 8152);
    long long v135 = (unsigned __int8 *)(v2 + 0x2000);
    if (v7) {
      goto LABEL_111;
    }
LABEL_110:
    if (*(unsigned char *)v498)
    {
      while (1)
      {
LABEL_111:
        uint64_t v136 = *((void *)v2 + 7);
        if (v136 == *((void *)v2 + 8)) {
          return;
        }
        sub_21B6EAC40((uint64_t)v690, *((void *)v2 + 7));
        sub_21B6FAAAC((uint64_t)v702, (long long *)(v136 + 360));
        *((void *)v2 + 8) = sub_21B6FB8B8(*((void *)v2 + 7) + 1792, *((void *)v2 + 8), *((void *)v2 + 7));
        if (!*(unsigned char *)(v498 + 1320))
        {
          if (qword_267C5A9D8 != -1) {
            dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
          }
          uint64_t v182 = qword_267C5A9E0;
          if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR)) {
            goto LABEL_206;
          }
          *(_DWORD *)buf = 134349056;
          *(double *)&uint8_t buf[4] = v690[2];
          long long v183 = "CLVLF,propagateAfterSessionEnded,Filter reset,prev ENU invalid,machAbsTime,%{public}.3lf";
          goto LABEL_204;
        }
        double v137 = vabdd_f64(v690[2], *((double *)v2 + 994));
        BOOL v138 = sub_21B6F7CF0((uint64_t)v690);
        *((_DWORD *)v2 + 1984) = LODWORD(v690[0]);
        *(_OWORD *)(v2 + 7944) = *(_OWORD *)&v690[1];
        *((double *)v2 + 995) = v690[3];
        *(unsigned char *)(v498 + 1496) = 0;
        *((_DWORD *)v2 + 2074) = 0;
        if (v138)
        {
          *(double *)v565 = *((double *)&v694 + 1) * (v137 * (v137 * 0.5) * *((double *)&v694 + 1));
          int v139 = 1;
          buf[0] = 1;
          *(_OWORD *)&buf[8] = xmmword_21B700FC0;
          *(_OWORD *)&unsigned char buf[24] = xmmword_21B700FD0;
          *(void *)&long long v581 = v2 + 0x2000;
          *((void *)&v581 + 1) = v2 + 8232;
          sub_21B6FB910((uint64_t)buf, (const double *)v565);
          *((double *)v2 + 1006) = sqrt(*((double *)v2 + 1024) + *((double *)v2 + 1028));
          long long v140 = v694;
          *((_OWORD *)v2 + 504) = v693[1];
          *((_OWORD *)v2 + 505) = v140;
          goto LABEL_152;
        }
        double v141 = *((double *)&v693[1] + 1);
        double v142 = *((double *)&v694 + 1);
        if (*((double *)&v693[1] + 1) > 0.0)
        {
          if (*((double *)&v694 + 1) > 0.0)
          {
            double v143 = *(double *)&v693[1];
            double v144 = *(double *)&v694;
            goto LABEL_126;
          }
          double v145 = *((double *)v2 + 1011);
          if (v145 > 0.0)
          {
            double v143 = *(double *)&v693[1];
            double v144 = *((double *)v2 + 1010);
LABEL_125:
            double v142 = v145;
            goto LABEL_126;
          }
        }
        if (*((double *)v2 + 1009) <= 0.0) {
          goto LABEL_127;
        }
        if (*((double *)&v694 + 1) <= 0.0)
        {
          double v145 = *((double *)v2 + 1011);
          if (v145 <= 0.0)
          {
LABEL_127:
            *((void *)v2 + 1008) = *(void *)&v693[1];
            *((double *)v2 + 1009) = v141;
            *((void *)v2 + 1010) = v694;
            *((double *)v2 + 1011) = v142;
            goto LABEL_128;
          }
          double v143 = *((double *)v2 + 1008);
          double v144 = *((double *)v2 + 1010);
          double v141 = *((double *)v2 + 1009);
          goto LABEL_125;
        }
        double v143 = *((double *)v2 + 1008);
        double v144 = *(double *)&v694;
        double v141 = *((double *)v2 + 1009);
LABEL_126:
        sub_21B6F7FA0((double *)v2 + 992, v143, v141, v144, v142, v137);
LABEL_128:
        if (sub_21B6F7B74((uint64_t)v691, (uint64_t)(v2 + 7856), (uint64_t)v690))
        {
          double v146 = hypot(*((long double *)v2 + 1006), *((long double *)v2 + 1007));
          double v147 = hypot(*(long double *)v693, *((long double *)v693 + 1));
          double v148 = v146 + v147;
          unint64_t v149 = (unint64_t)(COERCE__INT64(fabs(v146 + v147)) - 0x10000000000000) >> 53;
          if ((COERCE__INT64(v146 + v147) <= -1 || v149 >= 0x3FF)
            && (unint64_t)(COERCE__INT64(v146 + v147) - 1) >= 0xFFFFFFFFFFFFFLL)
          {
            if (qword_267C5A9D8 != -1) {
              dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
            }
            uint64_t v318 = qword_267C5A9E0;
            if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134349568;
              *(double *)&uint8_t buf[4] = v690[2];
              *(_WORD *)&buf[12] = 2050;
              *(double *)&buf[14] = v146;
              *(_WORD *)&buf[22] = 2050;
              *(double *)&unsigned char buf[24] = v147;
              long long v183 = "CLVLF,propagateAfterSessionEnded,Filter reset,Invalid horzAcc,machAbsTime,%{public}.3lf,prevHorzAcc"
                     ",%{public}.3lf,currHorzAcc,%{public}.3lf";
              long long v184 = v318;
              uint32_t v185 = 32;
LABEL_205:
              _os_log_impl(&dword_21B6E4000, v184, OS_LOG_TYPE_ERROR, v183, buf, v185);
            }
LABEL_206:
            sub_21B6EBAC4(v2 + 1);
            sub_21B6EBAFC((uint64_t)v2, 1);
            atomic_store(0, (unsigned __int8 *)v2 + 1);
            return;
          }
          *(void *)buf = &unk_26CB86830;
          long long v152 = *(_OWORD *)(v2 + 8168);
          *(_OWORD *)&buf[8] = *(_OWORD *)__Aa;
          *(_OWORD *)&unsigned char buf[24] = v152;
          uint64_t v153 = 8;
          double v154 = v147 / v148;
          do
          {
            *(double *)&buf[v153] = v154 * *(double *)&buf[v153];
            v153 += 8;
          }
          while (v153 != 32);
          *(void *)v565 = &unk_26CB86830;
          *(_OWORD *)&v565[8] = v695;
          *(_OWORD *)&v565[24] = v696;
          uint64_t v155 = 8;
          double v156 = v146 / v148;
          do
          {
            *(double *)&v565[v155] = v156 * *(double *)&v565[v155];
            v155 += 8;
          }
          while (v155 != 32);
          for (uint64_t i6 = 8; i6 != 32; i6 += 8)
            *(double *)&buf[i6] = *(double *)&buf[i6] + *(double *)&v565[i6];
          uint64_t v158 = 0;
          long long v159 = *(_OWORD *)&buf[24];
          *(_OWORD *)__Aa = *(_OWORD *)&buf[8];
          *(_OWORD *)(v2 + 8168) = v159;
          double v160 = v154 * v154;
          do
          {
            *(double *)&v135[v158] = v160 * *(double *)&v135[v158];
            v158 += 8;
          }
          while (v158 != 72);
          *(void *)buf = &unk_26CB86850;
          long long v581 = v699;
          long long v582 = v700;
          *(_OWORD *)v583 = v701;
          uint64_t v161 = 8;
          *(_OWORD *)&buf[8] = v697;
          *(_OWORD *)&unsigned char buf[24] = v698;
          do
          {
            *(double *)&buf[v161] = v156 * v156 * *(double *)&buf[v161];
            v161 += 8;
          }
          while (v161 != 80);
          for (uint64_t i7 = 0; i7 != 72; i7 += 8)
            *(double *)&v135[i7] = *(double *)&v135[i7] + *(double *)&buf[i7 + 8];
          *((double *)v2 + 1006) = sqrt(*((double *)v2 + 1024) + *((double *)v2 + 1028));
          *((double *)v2 + 1007) = sqrt(*((double *)v2 + 1032));
        }
        if (cnnavigation::ENUToECEF() || cnnavigation::ECEFToLLA())
        {
          if (qword_267C5A9D8 != -1) {
            dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
          }
          uint64_t v182 = qword_267C5A9E0;
          if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR)) {
            goto LABEL_206;
          }
          *(_DWORD *)buf = 134349056;
          *(double *)&uint8_t buf[4] = v690[2];
          long long v183 = "CLVLF,propagateAfterSessionEnded,Filter reset,Propagated LLA invalid,machAbsTime,%{public}.3lf";
LABEL_204:
          long long v184 = v182;
          uint32_t v185 = 12;
          goto LABEL_205;
        }
        int v139 = 5;
LABEL_152:
        *((_DWORD *)v2 + 2074) = v139;
        sub_21B6F7D88((uint64_t)(v2 + 8320), (uint64_t)v690);
        unint64_t v163 = *((void *)v2 + 845);
        uint64_t v164 = *((void *)v2 + 844);
        if ((unint64_t)(0x13A524387AC82261 * ((uint64_t)(v163 - v164) >> 3)) >= 4)
        {
          unint64_t v163 = sub_21B6FB528(v164 + 3336, *((void *)v2 + 845), v164);
          *((void *)v2 + 845) = v163;
        }
        if (v163 >= *((void *)v2 + 846))
        {
          uint64_t v165 = sub_21B6FB580((uint64_t *)v2 + 844, v498);
        }
        else
        {
          sub_21B6FB69C(v163, v498);
          uint64_t v165 = v163 + 3336;
        }
        *((void *)v2 + 845) = v165;
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
        }
        double v166 = qword_267C5A9E0;
        if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v167 = *((void *)v2 + 1042);
          double v168 = 1.57079633 - *((double *)v2 + 1008);
          if (v168 < 0.0 || v168 >= 6.28318531)
          {
            double v168 = fmod(v168, 6.28318531);
            if (v168 < 0.0 || v168 == 0.0 && (*(void *)&v168 & 0x8000000000000000) == 0) {
              double v168 = v168 + 6.28318531;
            }
          }
          uint64_t v169 = *((void *)v2 + 1010);
          *(_DWORD *)buf = 134349568;
          *(void *)&uint8_t buf[4] = v167;
          *(_WORD *)&buf[12] = 2050;
          *(double *)&buf[14] = v168 * 57.2957795;
          *(_WORD *)&buf[22] = 2050;
          *(void *)&unsigned char buf[24] = v169;
          _os_log_impl(&dword_21B6E4000, v166, OS_LOG_TYPE_DEBUG, "CLVLF,propagateAfterSessionEnded,Location propagated,machAbsTime,%{public}.3lf,course,%{public}.3lf,speed,%{public}.3lf", buf, 0x20u);
        }
        if (!*(unsigned char *)(v498 + 1)) {
          goto LABEL_110;
        }
      }
    }
  }
}

void sub_21B6F5770(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_21B6E6194(a1);
  }
  _Unwind_Resume(a1);
}

BOOL sub_21B6F57B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL result = 0;
  *(unsigned char *)(a3 + 336) = 0;
  *(void *)(a3 + 352) = 0xBFF0000000000000;
  if (*(unsigned char *)(a1 + 160)) {
    BOOL v5 = *(unsigned char *)(a2 + 160) == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v7 = 0;
    double v44 = &unk_26CB86830;
    long long v45 = *(_OWORD *)(a2 + 216);
    long long v46 = *(_OWORD *)(a2 + 232);
    do
    {
      *(double *)((char *)&v44 + v7 + 8) = *(double *)((char *)&v44 + v7 + 8) - *(double *)(a1 + 216 + v7);
      v7 += 8;
    }
    while (v7 != 24);
    double v8 = *((double *)&v45 + 1) * *((double *)&v45 + 1) + *(double *)&v45 * *(double *)&v45;
    if (v8 >= 1.44)
    {
      LOBYTE(v30) = 0;
      int64x2_t v31 = vdupq_n_s64(2uLL);
      int64x2_t v32 = (int64x2_t)xmmword_21B6FEA80;
      long long v33 = (double *)(a2 + 256);
      long long v34 = (uint64_t *)(a2 + 296);
      *(_OWORD *)__N = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v39 = 0;
      sub_21B6EB4F8((uint64_t *)__N, &v30);
      vDSP_Length v9 = __N[0];
      if (__N[0])
      {
        vDSP_Length v10 = __N[1];
        if (__N[1])
        {
          double v11 = (const double *)(a1 + 256);
          BOOL v12 = (double *)*((void *)&v36 + 1);
          if ((void)v36 == 3 && __N[0] == 3)
          {
            vDSP_vaddD(*((const double **)&v36 + 1), 1, v11, 1, *((double **)&v36 + 1), 1, 3 * __N[1]);
          }
          else
          {
            uint64_t v13 = 8 * v36;
            do
            {
              vDSP_vaddD(v12, 1, v11, 1, v12, 1, v9);
              v11 += 3;
              BOOL v12 = (double *)((char *)v12 + v13);
              --v10;
            }
            while (v10);
          }
        }
      }
      float64x2_t v41 = 0u;
      float64x2_t v42 = 0u;
      uint64_t v40 = &unk_26CB86810;
      uint64_t v43 = 0;
      double v14 = (double *)*((void *)&v36 + 1);
      long long v15 = (double *)v37;
      if (*((void *)&v36 + 1) != (void)v37)
      {
        long long v16 = &v41;
        do
        {
          float64_t v17 = *v14++;
          v16->f64[0] = v17;
          long long v16 = (float64x2_t *)((char *)v16 + 8);
        }
        while (v14 != v15);
      }
      sub_21B6EA254(__N);
      *(void *)&v27[2] = &unk_26CB867F0;
      v28[0] = -*((double *)&v45 + 1) / v8;
      v28[1] = *(double *)&v45 / v8;
      uint64_t v29 = 0;
      LOBYTE(v30) = 0;
      int64x2_t v31 = (int64x2_t)xmmword_21B700FE0;
      int64x2_t v32 = vdupq_n_s64(1uLL);
      long long v33 = v28;
      long long v34 = &v29;
      long long v23 = &unk_26CB867F0;
      uint64_t v25 = 0;
      float64x2_t v24 = vmlaq_n_f64(vmulq_n_f64(v42, *(double *)&v45 / v8), v41, v28[0]);
      sub_21B6FA678((uint64_t *)__N, (uint64_t)&v30, (uint64_t)&v23);
      v27[0] = 0.0;
      v27[1] = 0.0;
      long long v26 = &unk_26CB867D0;
      long long v18 = (uint64_t *)*((void *)&v36 + 1);
      long long v19 = (uint64_t *)v37;
      if (*((void *)&v36 + 1) != (void)v37)
      {
        long long v20 = v27;
        do
        {
          uint64_t v21 = *v18++;
          *(void *)v20++ = v21;
        }
        while (v18 != v19);
      }
      sub_21B6EA254(__N);
      BOOL result = 0;
      double v22 = v27[0];
      if ((*(void *)&v27[0] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL && v27[0] >= 0.0)
      {
        *(long double *)(a3 + 344) = atan2(*((long double *)&v45 + 1), *(long double *)&v45);
        *(double *)(a3 + 352) = v22;
        BOOL result = sqrt(v22) <= 3.14159265;
        *(unsigned char *)(a3 + 336) = result;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_21B6F5AF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(a3 + 1256) = 0;
  if (*(unsigned char *)(a1 + 1424)) {
    BOOL v3 = *(unsigned char *)(a2 + 1424) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v4 = !v3;
  if (!v3)
  {
    uint64_t v8 = 0;
    __N[0] = (vDSP_Length)&unk_26CB86830;
    long long v9 = *(_OWORD *)(a2 + 272);
    *(_OWORD *)&__N[1] = *(_OWORD *)(a2 + 256);
    *(_OWORD *)&__N[3] = v9;
    do
    {
      *(double *)&__N[v8 + 1] = *(double *)&__N[v8 + 1] - *(double *)(a1 + 256 + v8 * 8);
      ++v8;
    }
    while (v8 != 3);
    long long v10 = *(_OWORD *)&__N[3];
    *(_OWORD *)(a3 + 1272) = *(_OWORD *)&__N[1];
    *(_OWORD *)(a3 + 1288) = v10;
    LOBYTE(v21) = 0;
    int64x2_t v22 = vdupq_n_s64(3uLL);
    long long v23 = xmmword_21B6FEAA0;
    uint64_t v24 = a2 + 464;
    uint64_t v25 = a2 + 584;
    memset(__N, 0, sizeof(__N));
    long long v27 = 0u;
    uint64_t v28 = 0;
    sub_21B6EB4F8((uint64_t *)__N, &v21);
    vDSP_Length v11 = __N[0];
    if (__N[0])
    {
      vDSP_Length v12 = __N[1];
      if (__N[1])
      {
        uint64_t v13 = (const double *)(a1 + 464);
        double v14 = (double *)__N[3];
        if (__N[2] == 6 && __N[0] == 6)
        {
          vDSP_vaddD((const double *)__N[3], 1, (const double *)(a1 + 464), 1, (double *)__N[3], 1, 6 * __N[1]);
        }
        else
        {
          vDSP_Length v15 = 8 * __N[2];
          do
          {
            vDSP_vaddD(v14, 1, v13, 1, v14, 1, v11);
            v13 += 6;
            double v14 = (double *)((char *)v14 + v15);
            --v12;
          }
          while (v12);
        }
      }
    }
    vDSP_Length v17 = __N[4];
    long long v16 = (uint64_t *)__N[3];
    if (__N[3] != __N[4])
    {
      long long v18 = (void *)(a3 + 1312);
      do
      {
        uint64_t v19 = *v16++;
        *v18++ = v19;
      }
      while (v16 != (uint64_t *)v17);
    }
    sub_21B6EA254(__N);
    *(double *)(a3 + 1392) = *(double *)(a2 + 40) - *(double *)(a1 + 40);
    *(unsigned char *)(a3 + 1256) = 1;
  }
  return v4;
}

BOOL sub_21B6F5CDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL result = 0;
  *(unsigned char *)(a3 + 1400) = 0;
  *(void *)(a3 + 1416) = 0xBFF0000000000000;
  if (*(unsigned char *)(a1 + 1424)) {
    BOOL v5 = *(unsigned char *)(a2 + 1424) == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v7 = 0;
    long long v45 = &unk_26CB86830;
    long long v8 = *(_OWORD *)(a2 + 272);
    long long v46 = *(_OWORD *)(a2 + 256);
    long long v47 = v8;
    do
    {
      *(double *)((char *)&v45 + v7 + 8) = *(double *)((char *)&v45 + v7 + 8) - *(double *)(a1 + 256 + v7);
      v7 += 8;
    }
    while (v7 != 24);
    double v9 = *((double *)&v46 + 1) * *((double *)&v46 + 1) + *(double *)&v46 * *(double *)&v46;
    if (v9 >= 1.44)
    {
      LOBYTE(v31) = 0;
      int64x2_t v32 = vdupq_n_s64(2uLL);
      int64x2_t v33 = (int64x2_t)xmmword_21B6FEAA0;
      long long v34 = (double *)(a2 + 464);
      long long v35 = (uint64_t *)(a2 + 528);
      *(_OWORD *)__N = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v40 = 0;
      sub_21B6EB4F8((uint64_t *)__N, &v31);
      vDSP_Length v10 = __N[0];
      if (__N[0])
      {
        vDSP_Length v11 = __N[1];
        if (__N[1])
        {
          vDSP_Length v12 = (const double *)(a1 + 464);
          uint64_t v13 = (double *)*((void *)&v37 + 1);
          if ((void)v37 == 6 && __N[0] == 6)
          {
            vDSP_vaddD(*((const double **)&v37 + 1), 1, v12, 1, *((double **)&v37 + 1), 1, 6 * __N[1]);
          }
          else
          {
            uint64_t v14 = 8 * v37;
            do
            {
              vDSP_vaddD(v13, 1, v12, 1, v13, 1, v10);
              v12 += 6;
              uint64_t v13 = (double *)((char *)v13 + v14);
              --v11;
            }
            while (v11);
          }
        }
      }
      float64x2_t v42 = 0u;
      float64x2_t v43 = 0u;
      float64x2_t v41 = &unk_26CB86810;
      uint64_t v44 = 0;
      vDSP_Length v15 = (double *)*((void *)&v37 + 1);
      long long v16 = (double *)v38;
      if (*((void *)&v37 + 1) != (void)v38)
      {
        vDSP_Length v17 = &v42;
        do
        {
          float64_t v18 = *v15++;
          v17->f64[0] = v18;
          vDSP_Length v17 = (float64x2_t *)((char *)v17 + 8);
        }
        while (v15 != v16);
      }
      sub_21B6EA254(__N);
      *(void *)&double v28[2] = &unk_26CB867F0;
      v29[0] = -*((double *)&v46 + 1) / v9;
      v29[1] = *(double *)&v46 / v9;
      uint64_t v30 = 0;
      LOBYTE(v31) = 0;
      int64x2_t v32 = (int64x2_t)xmmword_21B700FE0;
      int64x2_t v33 = vdupq_n_s64(1uLL);
      long long v34 = v29;
      long long v35 = &v30;
      uint64_t v24 = &unk_26CB867F0;
      uint64_t v26 = 0;
      float64x2_t v25 = vmlaq_n_f64(vmulq_n_f64(v43, *(double *)&v46 / v9), v42, v29[0]);
      sub_21B6FA678((uint64_t *)__N, (uint64_t)&v31, (uint64_t)&v24);
      v28[0] = 0.0;
      v28[1] = 0.0;
      long long v27 = &unk_26CB867D0;
      uint64_t v19 = (uint64_t *)*((void *)&v37 + 1);
      long long v20 = (uint64_t *)v38;
      if (*((void *)&v37 + 1) != (void)v38)
      {
        uint64_t v21 = v28;
        do
        {
          uint64_t v22 = *v19++;
          *(void *)v21++ = v22;
        }
        while (v19 != v20);
      }
      sub_21B6EA254(__N);
      BOOL result = 0;
      double v23 = v28[0];
      if ((*(void *)&v28[0] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL && v28[0] >= 0.0)
      {
        *(long double *)(a3 + 1408) = atan2(*((long double *)&v46 + 1), *(long double *)&v46);
        *(double *)(a3 + 1416) = v23;
        BOOL result = sqrt(v23) <= 3.14159265;
        *(unsigned char *)(a3 + 1400) = result;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_21B6F6028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  double v8 = vabdd_f64(*(double *)(a2 + 16), *(double *)(*(void *)(a1 + 6760) - 1776));
  sub_21B6F74F8(a4, a1 + 3416);
  *(_DWORD *)(a4 + 1520) = 0;
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a4 + 1160) = *(_OWORD *)a2;
  *(_OWORD *)(a4 + 1176) = v9;
  long long v10 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a4 + 1216) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a4 + 1200) = v10;
  long long v11 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a4 + 1240) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a4 + 1256) = v11;
  long long v12 = *(_OWORD *)(a2 + 112);
  long long v13 = *(_OWORD *)(a2 + 128);
  long long v14 = *(_OWORD *)(a2 + 144);
  *(unsigned char *)(a4 + 1320) = *(unsigned char *)(a2 + 160);
  *(_OWORD *)(a4 + 1288) = v13;
  *(_OWORD *)(a4 + 1304) = v14;
  *(_OWORD *)(a4 + 1272) = v12;
  long long v15 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a4 + 1336) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a4 + 1352) = v15;
  long long v16 = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a4 + 1392) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a4 + 1376) = v16;
  *(_OWORD *)(a4 + 1416) = *(_OWORD *)(a2 + 256);
  long long v17 = *(_OWORD *)(a2 + 272);
  long long v18 = *(_OWORD *)(a2 + 288);
  long long v19 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a4 + 1464) = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a4 + 1480) = v19;
  *(_OWORD *)(a4 + 1432) = v17;
  *(_OWORD *)(a4 + 1448) = v18;
  long long v20 = *(_OWORD *)(a2 + 336);
  *(void *)(a4 + 1512) = *(void *)(a2 + 352);
  *(_OWORD *)(a4 + 1496) = v20;
  sub_21B6F6244(a3, (unsigned __int8 *)a4);
  double v21 = v8 * 0.00523598776;
  *(double *)(a1 + 7024) = v8 * 0.00523598776 * (v8 * 0.00523598776) + *(double *)(a1 + 7024);
  *(double *)(a1 + 7080) = v8 * 0.00523598776 * (v8 * 0.00523598776) + *(double *)(a1 + 7080);
  *(double *)(a1 + 7136) = v8 * 0.00523598776 * (v8 * 0.00523598776) + *(double *)(a1 + 7136);
  double v22 = v8 * 0.3;
  *(double *)(a1 + 7192) = v22 * v22 + *(double *)(a1 + 7192);
  *(double *)(a1 + 7248) = v22 * v22 + *(double *)(a1 + 7248);
  *(double *)(a1 + 7304) = v22 * v22 + *(double *)(a1 + 7304);
  if (qword_267C5A9D8 != -1) {
    dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
  }
  double v23 = qword_267C5A9E0;
  if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = *(void *)(a2 + 16);
    int v25 = 134349568;
    uint64_t v26 = v24;
    __int16 v27 = 2050;
    double v28 = v21 * 57.2957795;
    __int16 v29 = 2050;
    double v30 = v22;
    _os_log_impl(&dword_21B6E4000, v23, OS_LOG_TYPE_DEBUG, "CLVLF,propagate,Filter propagated,machAbsTime,%{public}.3lf,rotProcNoiseStd,%{public}.3lf,posProcNoiseStd,%{public}.3lf", (uint8_t *)&v25, 0x20u);
  }
}

uint64_t sub_21B6F6244(uint64_t result, unsigned __int8 *a2)
{
  a2[1320] = 0;
  if (a2[1] | *a2) {
    BOOL v2 = *(unsigned char *)(result + 1424) == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    uint64_t v4 = result + 56;
    sub_21B6EA294((uint64_t)&v17, (uint64_t)(a2 + 8));
    sub_21B6E72BC((uint64_t)&v17, v4, 1);
    a2[544] = v17;
    long long v5 = *(_OWORD *)&v18[24];
    *((_OWORD *)a2 + 35) = *(_OWORD *)&v18[8];
    *((_OWORD *)a2 + 36) = v5;
    *((void *)a2 + 74) = v19;
    long long v6 = v23;
    *((_OWORD *)a2 + 40) = v22;
    *((_OWORD *)a2 + 41) = v6;
    *((_OWORD *)a2 + 42) = v24;
    long long v7 = v25;
    *(_OWORD *)(a2 + 712) = v26;
    *(_OWORD *)(a2 + 696) = v7;
    *(_OWORD *)(a2 + 744) = v28;
    *(_OWORD *)(a2 + 760) = v29;
    long long v8 = v21;
    long long v9 = v20;
    *((void *)a2 + 91) = v27;
    long long v10 = a2 + 784;
    *((_OWORD *)a2 + 38) = v9;
    *((_OWORD *)a2 + 39) = v8;
    BOOL result = (uint64_t)memcpy(a2 + 784, v30, 0x128uLL);
    uint64_t v11 = 0;
    while ((*(void *)&a2[v11 + 160] & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
    {
      v11 += 8;
      if (v11 == 32)
      {
        uint64_t v12 = 0;
        while ((*(void *)&a2[v12 + 208] & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
        {
          v12 += 8;
          if (v12 == 24)
          {
            uint64_t v13 = 0;
            while ((*(void *)&v10[v13] & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
            {
              v13 += 8;
              if (v13 == 288)
              {
                uint64_t v14 = 0;
                while (*(double *)&v10[v14] >= 0.0)
                {
                  v14 += 56;
                  if (v14 == 336)
                  {
                    long long v15 = *(_OWORD *)(a2 + 760);
                    *((_OWORD *)a2 + 86) = *(_OWORD *)(a2 + 744);
                    *((_OWORD *)a2 + 87) = v15;
                    LOBYTE(v17) = 1;
                    *(int64x2_t *)long long v18 = vdupq_n_s64(3uLL);
                    *(_OWORD *)&v18[16] = xmmword_21B6FEAA0;
                    *(void *)&v18[32] = a2 + 952;
                    long long v19 = a2 + 1072;
                    sub_21B6E9088((uint64_t)(a2 + 1408), &v17);
                    *((double *)a2 + 159) = sqrt(*((double *)a2 + 177) + *((double *)a2 + 181));
                    *((double *)a2 + 160) = sqrt(*((double *)a2 + 185));
                    long long v16 = *((_OWORD *)a2 + 69);
                    *(_OWORD *)(a2 + 1336) = *((_OWORD *)a2 + 68);
                    *(_OWORD *)(a2 + 1352) = v16;
                    BOOL result = cnnavigation::ENUToECEF();
                    if (!result)
                    {
                      BOOL result = cnnavigation::ECEFToLLA();
                      if (!result)
                      {
                        a2[1320] = 1;
                        *((_DWORD *)a2 + 380) |= 1u;
                      }
                    }
                    return result;
                  }
                }
                return result;
              }
            }
            return result;
          }
        }
        return result;
      }
    }
  }
  return result;
}

void sub_21B6F6498(uint64_t a1, unsigned __int8 *a2)
{
  a2[1496] = 0;
  if (a2[1] | *a2) {
    _ZF = *(unsigned char *)(a1 + 1424) == 0;
  }
  else {
    _ZF = 1;
  }
  if (!_ZF && *(unsigned char *)(a1 + 1400) != 0)
  {
    __double2 v6 = __sincos_stret(*(double *)(a1 + 1408));
    double v7 = *(double *)(a1 + 1416);
    uint64_t v43 = 0;
    *(void *)&v44[0] = &unk_26CB86830;
    v44[1] = v6.__cosval;
    v44[2] = v6.__sinval;
    v44[3] = 0.0;
    v44[4] = 0.0;
    *(void *)&v36[0] = &unk_26CB86850;
    v36[1] = v6.__sinval * (v7 * v6.__sinval);
    double v37 = -(v7 * v6.__sinval * v6.__cosval);
    uint64_t v38 = 0;
    double v39 = v37;
    double v40 = v6.__cosval * (v7 * v6.__cosval);
    long long v41 = 0u;
    long long v42 = 0u;
    int64x2_t v33 = &unk_26CB86830;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v31 = &unk_26CB86850;
    memset(v32, 0, sizeof(v32));
    sub_21B6E83C8((uint64_t)(a2 + 8), v44, v36, (uint64_t)&v33, (uint64_t)&v31, 1);
    uint64_t v27 = &unk_26CB867F0;
    double v28 = -*((double *)&v34 + 1);
    double v29 = *(double *)&v34;
    uint64_t v30 = 0;
    sub_21B6EB144(v19, 2, 1);
    cblas_dgemv(CblasColMajor, CblasNoTrans, 2, 2, 1.0, v32, 3, &v28, 1, 0.0, __Y, __incY);
    long long v23 = &unk_26CB867F0;
    double v24 = 0.0;
    double v25 = 0.0;
    uint64_t v26 = 0;
    long long v8 = __Y;
    long long v9 = v22;
    if (__Y != v22)
    {
      long long v10 = &v24;
      do
      {
        uint64_t v11 = *(void *)v8++;
        *(void *)v10++ = v11;
      }
      while (v8 != v9);
    }
    sub_21B6EA254(v19);
    double v12 = atan2(*((long double *)&v34 + 1), *(long double *)&v34);
    *((double *)a2 + 188) = v12;
    double v13 = v29 * v25 + v28 * v24;
    *((double *)a2 + 189) = v13;
    if ((*(void *)&v13 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL && v13 >= 0.0)
    {
      *((double *)a2 + 161) = v12;
      double v14 = sqrt(v13);
      *((double *)a2 + 162) = v14;
      if (v14 <= 3.14159265)
      {
        a2[1496] = 1;
        *((_DWORD *)a2 + 380) |= 2u;
      }
      else
      {
        __asm { FMOV            V0.2D, #-1.0 }
        *(_OWORD *)(a2 + 1288) = _Q0;
      }
    }
  }
}

void sub_21B6F6734(uint64_t a1, double a2, double a3, int8x16_t a4)
{
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(a1 + 1528) = _Q0;
  LOBYTE(v56) = 1;
  int64x2_t v21 = vdupq_n_s64(3uLL);
  int64x2_t v57 = v21;
  long long v58 = xmmword_21B6FEAA0;
  uint64_t v59 = a1 + 784;
  uint64_t v60 = a1 + 904;
  uint64_t v51 = 0;
  uint64_t v52 = &unk_26CB86830;
  uint64_t v54 = 0x3FF0000000000000;
  uint64_t v55 = 0;
  long long v53 = xmmword_21B701020;
  *(void *)&_Q0 = *(void *)(a1 + 672);
  v48[1] = &unk_26CB86830;
  long long v49 = *(_OWORD *)(a1 + 656);
  uint64_t v50 = _Q0;
  sub_21B6E7EE8((double *)(a1 + 600), a1 + 688, (double *)&v52, (uint64_t)v46, (int8x16_t)(unint64_t)_Q0, a4);
  sub_21B6F9A74((uint64_t *)&__lda, (uint64_t)v46, &v56);
  LOBYTE(v22) = 0;
  *(int64x2_t *)uint64_t __incY = v21;
  *(_OWORD *)__X = xmmword_21B6FEA60;
  double v25 = &v47;
  uint64_t v26 = v48;
  sub_21B6FA0C4(v41, (uint64_t *)&__lda, &v22);
  uint64_t v44 = &unk_26CB86850;
  memset(v45, 0, sizeof(v45));
  long long v10 = __Y;
  uint64_t v11 = v43;
  if (__Y != v43)
  {
    double v12 = v45;
    do
    {
      uint64_t v13 = *(void *)v10++;
      *(void *)v12++ = v13;
    }
    while (v10 != v11);
  }
  sub_21B6EA254(v41);
  sub_21B6EA254(&__lda);
  double v14 = *((double *)&v49 + 1) * *((double *)&v49 + 1) + *(double *)&v49 * *(double *)&v49;
  if (sqrt(v14) != 0.0)
  {
    *(void *)&v33[2] = &unk_26CB867F0;
    v34[0] = -*((double *)&v49 + 1) / v14;
    v34[1] = *(double *)&v49 / v14;
    uint64_t v35 = 0;
    LOBYTE(v27) = 0;
    long long v28 = xmmword_21B700FE0;
    int64x2_t v29 = vdupq_n_s64(1uLL);
    uint64_t v30 = v34;
    uint64_t v31 = &v35;
    long long __lda = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v40 = 0;
    sub_21B6EB4F8((uint64_t *)&__lda, &v27);
    sub_21B6EB144(&v22, 2, 1);
    cblas_dgemv(CblasColMajor, CblasNoTrans, 2, 2, 1.0, v45, 3, v34, 1, 0.0, __X[0], __incY[2]);
    sub_21B6EB144(v41, __lda, *(uint64_t *)__incY);
    if ((void)__lda && *((void *)&__lda + 1) && *(void *)__incY)
    {
      if (*(void *)__incY == 1) {
        cblas_dgemv(CblasColMajor, CblasNoTrans, __lda, SDWORD2(__lda), 1.0, *((const double **)&v37 + 1), __lda, __X[0], 1, 0.0, __Y, 1);
      }
      else {
        cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, __lda, __incY[0], SDWORD2(__lda), 1.0, *((const double **)&v37 + 1), __lda, __X[0], SDWORD2(__lda), 0.0, __Y, __lda);
      }
    }
    v33[0] = 0.0;
    v33[1] = 0.0;
    int64x2_t v32 = &unk_26CB867D0;
    long long v15 = __Y;
    long long v16 = v43;
    if (__Y != v43)
    {
      uint64_t v17 = v33;
      do
      {
        uint64_t v18 = *(void *)v15++;
        *(void *)v17++ = v18;
      }
      while (v15 != v16);
    }
    sub_21B6EA254(v41);
    sub_21B6EA254(&v22);
    sub_21B6EA254(&__lda);
    double v19 = v33[0];
    if ((*(void *)&v33[0] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL && v33[0] >= 0.0)
    {
      *(long double *)(a1 + 1528) = atan2(*((long double *)&v49 + 1), *(long double *)&v49);
      double v20 = sqrt(v19);
      *(double *)(a1 + 1536) = v20;
      *(unsigned char *)(a1 + 1524) = v20 <= 3.14159265;
    }
  }
}

void sub_21B6F6B00(uint64_t a1, uint64_t a2)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 8296)) {
    return;
  }
  uint64_t v3 = *(void *)(a1 + 6760);
  if ((unint64_t)(0x13A524387AC82261 * ((v3 - *(void *)(a1 + 6752)) >> 3)) < 2) {
    return;
  }
  if (*(unsigned char *)(a2 + 160))
  {
    sub_21B6EAC40((uint64_t)v61, v3 - 2176);
    double v5 = *(double *)(a2 + 16) - *(double *)&v61[16];
    *(_DWORD *)long long v61 = *(_DWORD *)a2;
    *(_OWORD *)&v61[8] = *(_OWORD *)(a2 + 8);
    *(void *)&v61[24] = *(void *)(a2 + 24);
    LOBYTE(v77) = 0;
    double v6 = *(double *)(a2 + 144);
    double v7 = *(double *)(a2 + 152);
    if (v7 > 0.0 && v6 < 0.5)
    {
      double __B = v7 * (v5 * (v5 * 0.5) * v7);
      buf[0] = 1;
      *(_OWORD *)&buf[8] = xmmword_21B700FC0;
      long long v57 = xmmword_21B700FD0;
      *(void *)&long long v58 = v74;
      *((void *)&v58 + 1) = (char *)v75 + 8;
      sub_21B6FB910((uint64_t)buf, &__B);
      *(void *)&long long v66 = sqrt(*(double *)v74 + *(double *)v75);
      long long v19 = *(_OWORD *)(a2 + 144);
      long long v67 = *(_OWORD *)(a2 + 128);
      long long v68 = v19;
      goto LABEL_16;
    }
    double v9 = *(double *)(a2 + 136);
    if (v9 <= 0.0)
    {
      if (*((double *)&v67 + 1) > 0.0)
      {
        if (v7 > 0.0)
        {
          double v9 = *((double *)&v67 + 1);
          double v10 = *(double *)&v67;
          goto LABEL_33;
        }
        if (*((double *)&v68 + 1) > 0.0)
        {
          double v10 = *(double *)&v67;
          double v6 = *(double *)&v68;
          double v9 = *((double *)&v67 + 1);
          double v7 = *((double *)&v68 + 1);
          goto LABEL_33;
        }
      }
    }
    else
    {
      if (v7 > 0.0)
      {
        double v10 = *(double *)(a2 + 128);
LABEL_33:
        sub_21B6F7FA0((double *)v61, v10, v9, v6, v7, v5);
LABEL_35:
        double v30 = hypot(*(long double *)&v66, *((long double *)&v66 + 1));
        double v31 = hypot(*(long double *)(a2 + 112), *(long double *)(a2 + 120));
        double v32 = v30 + v31;
        unint64_t v33 = (unint64_t)(COERCE__INT64(fabs(v30 + v31)) - 0x10000000000000) >> 53;
        if ((COERCE__INT64(v30 + v31) <= -1 || v33 >= 0x3FF)
          && (unint64_t)(COERCE__INT64(v30 + v31) - 1) >= 0xFFFFFFFFFFFFFLL)
        {
          if (qword_267C5A9D8 != -1) {
            dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
          }
          uint64_t v51 = qword_267C5A9E0;
          if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR)) {
            return;
          }
          uint64_t v52 = *(void *)(a2 + 16);
          *(_DWORD *)buf = 134349568;
          *(void *)&uint8_t buf[4] = v52;
          *(_WORD *)&buf[12] = 2050;
          *(double *)&buf[14] = v30;
          *(_WORD *)&buf[22] = 2050;
          *(double *)&long long v57 = v31;
          double v14 = "CLVLF,filterUnfusedLocation,Invalid horzAcc,machAbsTime,%{public}.3lf,prevHorzAcc,%{public}.3lf,currHorz"
                "Acc,%{public}.3lf";
          long long v15 = buf;
          long long v16 = v51;
          os_log_type_t v17 = OS_LOG_TYPE_ERROR;
LABEL_64:
          uint32_t v18 = 32;
          goto LABEL_65;
        }
        *(void *)buf = &unk_26CB86830;
        *(_OWORD *)&buf[8] = v72;
        long long v57 = v73;
        uint64_t v36 = 8;
        double v37 = v31 / v32;
        do
        {
          *(double *)&buf[v36] = v37 * *(double *)&buf[v36];
          v36 += 8;
        }
        while (v36 != 32);
        double __B = COERCE_DOUBLE(&unk_26CB86830);
        long long v38 = *(_OWORD *)(a2 + 232);
        long long v54 = *(_OWORD *)(a2 + 216);
        long long v55 = v38;
        uint64_t v39 = 8;
        double v40 = v30 / v32;
        do
        {
          *(double *)((char *)&__B + v39) = v40 * *(double *)((char *)&__B + v39);
          v39 += 8;
        }
        while (v39 != 32);
        for (uint64_t i = 8; i != 32; i += 8)
          *(double *)&buf[i] = *(double *)&buf[i] + *(double *)((char *)&__B + i);
        uint64_t v42 = 0;
        long long v72 = *(_OWORD *)&buf[8];
        long long v73 = v57;
        double v43 = v37 * v37;
        do
        {
          *(double *)((char *)v74 + v42) = v43 * *(double *)((char *)v74 + v42);
          v42 += 8;
        }
        while (v42 != 72);
        long long v44 = *(_OWORD *)(a2 + 256);
        long long v57 = *(_OWORD *)(a2 + 272);
        long long v45 = *(_OWORD *)(a2 + 304);
        long long v58 = *(_OWORD *)(a2 + 288);
        long long v59 = v45;
        long long v60 = *(_OWORD *)(a2 + 320);
        double v46 = v40 * v40;
        *(void *)buf = &unk_26CB86850;
        *(_OWORD *)&buf[8] = v44;
        for (uint64_t j = 8; j != 80; j += 8)
          *(double *)&buf[j] = v46 * *(double *)&buf[j];
        for (uint64_t k = 0; k != 72; k += 8)
          *(double *)((char *)v74 + k) = *(double *)((char *)v74 + k) + *(double *)&buf[k + 8];
        *(void *)&long long v66 = sqrt(*(double *)v74 + *(double *)v75);
        *((void *)&v66 + 1) = sqrt(*(double *)&v76);
        if (cnnavigation::ENUToECEF() || cnnavigation::ECEFToLLA())
        {
          if (qword_267C5A9D8 != -1) {
            dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
          }
          uint64_t v49 = qword_267C5A9E0;
          if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
          {
            uint64_t v50 = *(void *)(a2 + 16);
            *(_DWORD *)buf = 134349056;
            *(void *)&uint8_t buf[4] = v50;
            double v14 = "CLVLF,filterUnfusedLocation,Propagated LLA invalid,machAbsTime,%{public}.3lf";
            long long v15 = buf;
            long long v16 = v49;
            os_log_type_t v17 = OS_LOG_TYPE_ERROR;
            uint32_t v18 = 12;
            goto LABEL_65;
          }
          return;
        }
LABEL_16:
        long long v20 = *(_OWORD *)&v61[16];
        *(_OWORD *)(a1 + 7936) = *(_OWORD *)v61;
        *(_OWORD *)(a1 + 7952) = v20;
        *(_OWORD *)(a1 + 7976) = v62;
        *(_OWORD *)(a1 + 7992) = v63;
        long long v21 = v65;
        *(_OWORD *)(a1 + 8016) = v64;
        *(_OWORD *)(a1 + 8032) = v21;
        *(_OWORD *)(a1 + 8080) = v68;
        long long v22 = v66;
        *(_OWORD *)(a1 + 8064) = v67;
        *(_OWORD *)(a1 + 8048) = v22;
        long long v23 = v70;
        *(_OWORD *)(a1 + 8128) = v71;
        *(_OWORD *)(a1 + 8112) = v23;
        *(_OWORD *)(a1 + 8152) = v72;
        *(_OWORD *)(a1 + 8168) = v73;
        *(_OWORD *)(a1 + 8256) = v76;
        long long v24 = v75[0];
        *(_OWORD *)(a1 + 8240) = v75[1];
        *(_OWORD *)(a1 + 8224) = v24;
        long long v25 = v74[0];
        *(_OWORD *)(a1 + 8208) = v74[1];
        *(unsigned char *)(a1 + 8096) = v69;
        *(_OWORD *)(a1 + 0x2000) = v25;
        *(void *)(a1 + 8288) = v78;
        *(_OWORD *)(a1 + 8272) = v77;
        *(_DWORD *)(a1 + 8296) = 5;
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
        }
        uint64_t v26 = qword_267C5A9E0;
        if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG)) {
          return;
        }
        uint64_t v27 = *(void *)(a2 + 16);
        double v28 = 1.57079633 - *(double *)(a1 + 8064);
        if (v28 < 0.0 || v28 >= 6.28318531)
        {
          double v28 = fmod(v28, 6.28318531);
          if (v28 < 0.0 || v28 == 0.0 && (*(void *)&v28 & 0x8000000000000000) == 0) {
            double v28 = v28 + 6.28318531;
          }
        }
        uint64_t v29 = *(void *)(a1 + 8080);
        *(_DWORD *)buf = 134349568;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&buf[12] = 2050;
        *(double *)&buf[14] = v28 * 57.2957795;
        *(_WORD *)&buf[22] = 2050;
        *(void *)&long long v57 = v29;
        double v14 = "CLVLF,filterUnfusedLocation,Location propagated,machAbsTime,%{public}.3lf,course,%{public}.3lf,speed,%{public}.3lf";
        long long v15 = buf;
        long long v16 = v26;
        os_log_type_t v17 = OS_LOG_TYPE_DEBUG;
        goto LABEL_64;
      }
      if (*((double *)&v68 + 1) > 0.0)
      {
        double v10 = *(double *)(a2 + 128);
        double v7 = *((double *)&v68 + 1);
        double v6 = *(double *)&v68;
        goto LABEL_33;
      }
    }
    *(void *)&long long v67 = *(void *)(a2 + 128);
    *((double *)&v67 + 1) = v9;
    *(double *)&long long v68 = v6;
    *((double *)&v68 + 1) = v7;
    goto LABEL_35;
  }
  if (qword_267C5A9D8 != -1) {
    dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
  }
  uint64_t v11 = qword_267C5A9E0;
  if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = *(void *)(a2 + 16);
    int v13 = *(unsigned __int8 *)(a2 + 160);
    *(_DWORD *)long long v61 = 134349312;
    *(void *)&v61[4] = v12;
    *(_WORD *)&v61[12] = 1026;
    *(_DWORD *)&v61[14] = v13;
    double v14 = "CLVLF,filterUnfusedLocation,Invalid LocData,machAbsTime,%{public}.3lf,currLocIsEnuValid,%{public}d";
    long long v15 = v61;
    long long v16 = v11;
    os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    uint32_t v18 = 18;
LABEL_65:
    _os_log_impl(&dword_21B6E4000, v16, v17, v14, v15, v18);
  }
}

void sub_21B6F7244(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_21B6E6194(a1);
}

void sub_21B6F7250(uint64_t a1, uint64_t a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)(a1 + 8296) & 2) != 0)
  {
    uint64_t v3 = *(void *)(a1 + 6752);
    if (v3 != *(void *)(a1 + 6760))
    {
      if (*(_DWORD *)(v3 + 1904) | *(_DWORD *)a2)
      {
        uint64_t v5 = v3 + 1160;
        sub_21B6EAC40((uint64_t)v28, a1 + 7936);
        if (sub_21B6F57B0(v5, (uint64_t)v28, (uint64_t)v28))
        {
          double v6 = v29;
          double v7 = *(double *)(a1 + 8064);
          double v8 = vabdd_f64(v29, v7);
          if (6.28318531 - v8 >= v8) {
            double v9 = v8;
          }
          else {
            double v9 = 6.28318531 - v8;
          }
          double v10 = *(double *)(a1 + 8072);
          double v11 = v10 * 1.5;
          if (v10 * 1.5 > 3.14159265) {
            double v11 = 3.14159265;
          }
          if (v9 > v11)
          {
            double v12 = v30;
            double v13 = sqrt(v30);
            double v14 = v10 + v13;
            unint64_t v15 = (unint64_t)(COERCE__INT64(fabs(v10 + v13)) - 0x10000000000000) >> 53;
            if ((COERCE__INT64(v10 + v13) <= -1 || v15 >= 0x3FF)
              && (unint64_t)(COERCE__INT64(v10 + v13) - 1) >= 0xFFFFFFFFFFFFFLL)
            {
              if (qword_267C5A9D8 != -1) {
                dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
              }
              uint64_t v26 = qword_267C5A9E0;
              if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
              {
                uint64_t v27 = *(void *)(a2 + 40);
                *(_DWORD *)buf = 134349568;
                uint64_t v32 = v27;
                __int16 v33 = 2050;
                double v34 = v10;
                __int16 v35 = 2050;
                double v36 = v13;
                long long v22 = "CLVLF,filterFusedCourse,Invalid courseAcc,machAbsTime,%{public}.3lf,prevCourseAcc,%{public}.3lf,cu"
                      "rrCourseAcc,%{public}.3lf";
                long long v23 = v26;
                os_log_type_t v24 = OS_LOG_TYPE_ERROR;
                uint32_t v25 = 32;
                goto LABEL_26;
              }
            }
            else
            {
              double v18 = v13 / v14;
              double v19 = v10 / v14;
              *(double *)(a1 + 8064) = v29 * v19 + v18 * v7;
              *(unsigned char *)(a1 + 8272) = v28[336];
              *(double *)(a1 + 8072) = sqrt(v12 * (v19 * v19) + v10 * (v18 * v18) * v10);
              *(double *)(a1 + 8280) = v6;
              *(double *)(a1 + 8288) = v12;
              if (qword_267C5A9D8 != -1) {
                dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
              }
              uint64_t v20 = qword_267C5A9E0;
              if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v21 = *(void *)(a2 + 40);
                *(_DWORD *)buf = 134349312;
                uint64_t v32 = v21;
                __int16 v33 = 2050;
                double v34 = v9 * 57.2957795;
                long long v22 = "CLVLF,filterFusedCourse,Course adjusted,machAbsTime,%{public}.3lf,courseDiff,%{public}.3lf";
                long long v23 = v20;
                os_log_type_t v24 = OS_LOG_TYPE_DEBUG;
                uint32_t v25 = 22;
LABEL_26:
                _os_log_impl(&dword_21B6E4000, v23, v24, v22, buf, v25);
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_21B6F74F8(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  long long v4 = *(_OWORD *)(a2 + 24);
  long long v5 = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 24) = v4;
  long long v6 = *(_OWORD *)(a2 + 104);
  long long v7 = *(_OWORD *)(a2 + 120);
  long long v8 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 136) = v8;
  *(_OWORD *)(a1 + 120) = v7;
  *(_OWORD *)(a1 + 104) = v6;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  long long v9 = *(_OWORD *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 176);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 176) = v10;
  long long v11 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 224) = v11;
  memcpy((void *)(a1 + 248), (const void *)(a2 + 248), 0x128uLL);
  *(unsigned char *)(a1 + 544) = *(unsigned char *)(a2 + 544);
  long long v13 = *(_OWORD *)(a2 + 560);
  long long v12 = *(_OWORD *)(a2 + 576);
  *(void *)(a1 + 592) = *(void *)(a2 + 592);
  *(_OWORD *)(a1 + 560) = v13;
  *(_OWORD *)(a1 + 576) = v12;
  long long v15 = *(_OWORD *)(a2 + 624);
  long long v14 = *(_OWORD *)(a2 + 640);
  long long v16 = *(_OWORD *)(a2 + 672);
  *(_OWORD *)(a1 + 656) = *(_OWORD *)(a2 + 656);
  *(_OWORD *)(a1 + 672) = v16;
  *(_OWORD *)(a1 + 624) = v15;
  *(_OWORD *)(a1 + 640) = v14;
  *(_OWORD *)(a1 + 608) = *(_OWORD *)(a2 + 608);
  long long v17 = *(_OWORD *)(a2 + 696);
  long long v18 = *(_OWORD *)(a2 + 712);
  *(void *)(a1 + 728) = *(void *)(a2 + 728);
  *(_OWORD *)(a1 + 712) = v18;
  *(_OWORD *)(a1 + 696) = v17;
  long long v19 = *(_OWORD *)(a2 + 744);
  *(_OWORD *)(a1 + 760) = *(_OWORD *)(a2 + 760);
  *(_OWORD *)(a1 + 744) = v19;
  memcpy((void *)(a1 + 784), (const void *)(a2 + 784), 0x128uLL);
  long long v20 = *(_OWORD *)(a2 + 1088);
  *(_OWORD *)(a1 + 1104) = *(_OWORD *)(a2 + 1104);
  *(_OWORD *)(a1 + 1088) = v20;
  long long v21 = *(_OWORD *)(a2 + 1144);
  *(_OWORD *)(a1 + 1128) = *(_OWORD *)(a2 + 1128);
  *(_OWORD *)(a1 + 1144) = v21;
  long long v22 = *(_OWORD *)(a2 + 1176);
  *(_OWORD *)(a1 + 1160) = *(_OWORD *)(a2 + 1160);
  *(_OWORD *)(a1 + 1176) = v22;
  long long v23 = *(_OWORD *)(a2 + 1216);
  *(_OWORD *)(a1 + 1200) = *(_OWORD *)(a2 + 1200);
  *(_OWORD *)(a1 + 1216) = v23;
  long long v24 = *(_OWORD *)(a2 + 1256);
  *(_OWORD *)(a1 + 1240) = *(_OWORD *)(a2 + 1240);
  *(_OWORD *)(a1 + 1256) = v24;
  char v25 = *(unsigned char *)(a2 + 1320);
  long long v27 = *(_OWORD *)(a2 + 1288);
  long long v26 = *(_OWORD *)(a2 + 1304);
  *(_OWORD *)(a1 + 1272) = *(_OWORD *)(a2 + 1272);
  *(_OWORD *)(a1 + 1288) = v27;
  *(_OWORD *)(a1 + 1304) = v26;
  *(unsigned char *)(a1 + 1320) = v25;
  long long v28 = *(_OWORD *)(a2 + 1352);
  *(_OWORD *)(a1 + 1336) = *(_OWORD *)(a2 + 1336);
  *(_OWORD *)(a1 + 1352) = v28;
  long long v29 = *(_OWORD *)(a2 + 1392);
  *(_OWORD *)(a1 + 1376) = *(_OWORD *)(a2 + 1376);
  *(_OWORD *)(a1 + 1392) = v29;
  *(_OWORD *)(a1 + 1416) = *(_OWORD *)(a2 + 1416);
  long long v30 = *(_OWORD *)(a2 + 1480);
  long long v32 = *(_OWORD *)(a2 + 1432);
  long long v31 = *(_OWORD *)(a2 + 1448);
  *(_OWORD *)(a1 + 1464) = *(_OWORD *)(a2 + 1464);
  *(_OWORD *)(a1 + 1480) = v30;
  *(_OWORD *)(a1 + 1432) = v32;
  *(_OWORD *)(a1 + 1448) = v31;
  long long v33 = *(_OWORD *)(a2 + 1496);
  *(void *)(a1 + 1512) = *(void *)(a2 + 1512);
  *(_OWORD *)(a1 + 1496) = v33;
  uint64_t v34 = *(void *)(a2 + 1536);
  *(_OWORD *)(a1 + 1520) = *(_OWORD *)(a2 + 1520);
  *(void *)(a1 + 1536) = v34;
  long long v35 = *(_OWORD *)(a2 + 1560);
  *(_OWORD *)(a1 + 1544) = *(_OWORD *)(a2 + 1544);
  *(_OWORD *)(a1 + 1560) = v35;
  long long v36 = *(_OWORD *)(a2 + 1600);
  *(_OWORD *)(a1 + 1584) = *(_OWORD *)(a2 + 1584);
  *(_OWORD *)(a1 + 1600) = v36;
  long long v37 = *(_OWORD *)(a2 + 1640);
  *(_OWORD *)(a1 + 1624) = *(_OWORD *)(a2 + 1624);
  *(_OWORD *)(a1 + 1640) = v37;
  long long v39 = *(_OWORD *)(a2 + 1672);
  long long v38 = *(_OWORD *)(a2 + 1688);
  long long v40 = *(_OWORD *)(a2 + 1656);
  *(unsigned char *)(a1 + 1704) = *(unsigned char *)(a2 + 1704);
  *(_OWORD *)(a1 + 1672) = v39;
  *(_OWORD *)(a1 + 1688) = v38;
  *(_OWORD *)(a1 + 1656) = v40;
  long long v41 = *(_OWORD *)(a2 + 1736);
  *(_OWORD *)(a1 + 1720) = *(_OWORD *)(a2 + 1720);
  *(_OWORD *)(a1 + 1736) = v41;
  long long v42 = *(_OWORD *)(a2 + 1776);
  *(_OWORD *)(a1 + 1760) = *(_OWORD *)(a2 + 1760);
  *(_OWORD *)(a1 + 1776) = v42;
  *(_OWORD *)(a1 + 1800) = *(_OWORD *)(a2 + 1800);
  long long v43 = *(_OWORD *)(a2 + 1864);
  long long v45 = *(_OWORD *)(a2 + 1816);
  long long v44 = *(_OWORD *)(a2 + 1832);
  *(_OWORD *)(a1 + 1848) = *(_OWORD *)(a2 + 1848);
  *(_OWORD *)(a1 + 1864) = v43;
  *(_OWORD *)(a1 + 1816) = v45;
  *(_OWORD *)(a1 + 1832) = v44;
  long long v46 = *(_OWORD *)(a2 + 1880);
  *(void *)(a1 + 1896) = *(void *)(a2 + 1896);
  *(_OWORD *)(a1 + 1880) = v46;
  long long v47 = *(_OWORD *)(a2 + 1920);
  long long v48 = *(_OWORD *)(a2 + 1936);
  uint64_t v49 = *(void *)(a2 + 1952);
  *(_OWORD *)(a1 + 1904) = *(_OWORD *)(a2 + 1904);
  *(void *)(a1 + 1952) = v49;
  *(_OWORD *)(a1 + 1936) = v48;
  *(_OWORD *)(a1 + 1920) = v47;
  *(unsigned char *)(a1 + 1960) = *(unsigned char *)(a2 + 1960);
  long long v51 = *(_OWORD *)(a2 + 1976);
  long long v50 = *(_OWORD *)(a2 + 1992);
  *(void *)(a1 + 2008) = *(void *)(a2 + 2008);
  *(_OWORD *)(a1 + 1976) = v51;
  *(_OWORD *)(a1 + 1992) = v50;
  long long v53 = *(_OWORD *)(a2 + 2040);
  long long v52 = *(_OWORD *)(a2 + 2056);
  long long v54 = *(_OWORD *)(a2 + 2088);
  *(_OWORD *)(a1 + 2072) = *(_OWORD *)(a2 + 2072);
  *(_OWORD *)(a1 + 2088) = v54;
  *(_OWORD *)(a1 + 2040) = v53;
  *(_OWORD *)(a1 + 2056) = v52;
  *(_OWORD *)(a1 + 2024) = *(_OWORD *)(a2 + 2024);
  long long v55 = *(_OWORD *)(a2 + 2112);
  long long v56 = *(_OWORD *)(a2 + 2128);
  *(void *)(a1 + 2144) = *(void *)(a2 + 2144);
  *(_OWORD *)(a1 + 2128) = v56;
  *(_OWORD *)(a1 + 2112) = v55;
  long long v57 = *(_OWORD *)(a2 + 2160);
  *(_OWORD *)(a1 + 2176) = *(_OWORD *)(a2 + 2176);
  *(_OWORD *)(a1 + 2160) = v57;
  memcpy((void *)(a1 + 2200), (const void *)(a2 + 2200), 0x129uLL);
  long long v58 = *(_OWORD *)(a2 + 2528);
  long long v59 = *(_OWORD *)(a2 + 2512);
  *(void *)(a1 + 2544) = *(void *)(a2 + 2544);
  *(_OWORD *)(a1 + 2512) = v59;
  *(_OWORD *)(a1 + 2528) = v58;
  long long v60 = *(_OWORD *)(a2 + 2592);
  long long v61 = *(_OWORD *)(a2 + 2608);
  long long v62 = *(_OWORD *)(a2 + 2576);
  *(_OWORD *)(a1 + 2624) = *(_OWORD *)(a2 + 2624);
  *(_OWORD *)(a1 + 2576) = v62;
  *(_OWORD *)(a1 + 2608) = v61;
  *(_OWORD *)(a1 + 2592) = v60;
  *(_OWORD *)(a1 + 2560) = *(_OWORD *)(a2 + 2560);
  long long v63 = *(_OWORD *)(a2 + 2648);
  long long v64 = *(_OWORD *)(a2 + 2664);
  *(void *)(a1 + 2680) = *(void *)(a2 + 2680);
  *(_OWORD *)(a1 + 2664) = v64;
  *(_OWORD *)(a1 + 2648) = v63;
  long long v65 = *(_OWORD *)(a2 + 2696);
  *(_OWORD *)(a1 + 2712) = *(_OWORD *)(a2 + 2712);
  *(_OWORD *)(a1 + 2696) = v65;
  memcpy((void *)(a1 + 2736), (const void *)(a2 + 2736), 0x128uLL);
  long long v66 = *(_OWORD *)(a2 + 3040);
  *(_OWORD *)(a1 + 3056) = *(_OWORD *)(a2 + 3056);
  *(_OWORD *)(a1 + 3040) = v66;
  *(_OWORD *)(a1 + 3080) = *(_OWORD *)(a2 + 3080);
  long long v67 = *(_OWORD *)(a2 + 3112);
  long long v68 = *(_OWORD *)(a2 + 3128);
  long long v69 = *(_OWORD *)(a2 + 3144);
  *(_OWORD *)(a1 + 3096) = *(_OWORD *)(a2 + 3096);
  *(_OWORD *)(a1 + 3144) = v69;
  *(_OWORD *)(a1 + 3128) = v68;
  *(_OWORD *)(a1 + 3112) = v67;
  *(unsigned char *)(a1 + 3160) = *(unsigned char *)(a2 + 3160);
  long long v70 = *(_OWORD *)(a2 + 3176);
  *(_OWORD *)(a1 + 3192) = *(_OWORD *)(a2 + 3192);
  *(_OWORD *)(a1 + 3176) = v70;
  *(_OWORD *)(a1 + 3216) = *(_OWORD *)(a2 + 3216);
  long long v71 = *(_OWORD *)(a2 + 3248);
  long long v72 = *(_OWORD *)(a2 + 3264);
  long long v73 = *(_OWORD *)(a2 + 3280);
  *(_OWORD *)(a1 + 3232) = *(_OWORD *)(a2 + 3232);
  *(_OWORD *)(a1 + 3280) = v73;
  *(_OWORD *)(a1 + 3264) = v72;
  *(_OWORD *)(a1 + 3248) = v71;
  long long v74 = *(_OWORD *)(a2 + 3296);
  long long v75 = *(_OWORD *)(a2 + 3312);
  *(unsigned char *)(a1 + 3328) = *(unsigned char *)(a2 + 3328);
  *(_OWORD *)(a1 + 3312) = v75;
  *(_OWORD *)(a1 + 3296) = v74;
  return a1;
}

BOOL sub_21B6F78F0(void *a1)
{
  uint64_t v2 = 0;
  uint64_t v22 = *MEMORY[0x263EF8340];
  do
  {
    if ((a1[v2 + 867] & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
      return 0;
    }
    ++v2;
  }
  while (v2 != 4);
  for (uint64_t i = 0; i != 3; ++i)
  {
    if ((a1[i + 873] & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
      return 0;
    }
  }
  uint64_t v4 = 0;
  long long v5 = a1 + 878;
  do
  {
    if ((v5[v4] & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
      return 0;
    }
    ++v4;
  }
  while (v4 != 36);
  for (uint64_t j = 0; j != 42; j += 7)
  {
    if (*(double *)&v5[j] <= 0.0) {
      return 0;
    }
  }
  uint64_t v7 = a1[844];
  uint64_t v8 = a1[845];
  if (v7 == v8) {
    return 1;
  }
  LOBYTE(v9) = 1;
  char v10 = 1;
  do
  {
    v10 &= (*(_DWORD *)(v7 + 1520) & 3) == 0;
    v9 &= (*(_DWORD *)(v7 + 1520) & 4u) >> 2;
    v7 += 3336;
  }
  while (v7 != v8);
  if (v10)
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    long long v11 = qword_267C5A9E0;
    BOOL result = os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG);
    if (result)
    {
      uint64_t v13 = 0x13A524387AC82261 * ((uint64_t)(a1[845] - a1[844]) >> 3);
      uint64_t v14 = a1[994];
      int v18 = 134218240;
      uint64_t v19 = v13;
      __int16 v20 = 2050;
      uint64_t v21 = v14;
      long long v15 = "CLVLF,checkStateHealth,Location not fused consecutively for last %zu epochs,machAbsTime,%{public}.3lf";
LABEL_26:
      _os_log_impl(&dword_21B6E4000, v11, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v18, 0x16u);
      return 0;
    }
    return result;
  }
  if (!v9) {
    return 1;
  }
  if (qword_267C5A9D8 != -1) {
    dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
  }
  long long v11 = qword_267C5A9E0;
  BOOL result = os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    uint64_t v16 = 0x13A524387AC82261 * ((uint64_t)(a1[845] - a1[844]) >> 3);
    uint64_t v17 = a1[994];
    int v18 = 134218240;
    uint64_t v19 = v16;
    __int16 v20 = 2050;
    uint64_t v21 = v17;
    long long v15 = "CLVLF,checkStateHealth,Location propagated consecutively for last %zu epochs,machAbsTime,%{public}.3lf";
    goto LABEL_26;
  }
  return result;
}

BOOL sub_21B6F7B74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a3 + 176) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a3 + 192) = v3;
  *(unsigned char *)(a3 + 160) = 0;
  if (*(double *)(a3 + 112) <= 0.0)
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    char v10 = qword_267C5A9E0;
    BOOL result = os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG);
    if (result)
    {
      __int16 v14 = 0;
      long long v11 = "CLVLF,computeEnuFromEcef,latitude/longitude unavailable";
      long long v12 = (uint8_t *)&v14;
LABEL_15:
      _os_log_impl(&dword_21B6E4000, v10, OS_LOG_TYPE_DEBUG, v11, v12, 2u);
      return 0;
    }
  }
  else
  {
    if (*(double *)(a3 + 120) > 0.0)
    {
      int v5 = cnnavigation::ECEFToENU();
      *(unsigned char *)(a3 + 160) = v5 == 0;
      if (!v5)
      {
        double v6 = *(double *)(a3 + 120);
        double v7 = *(double *)(a3 + 112) * (*(double *)(a3 + 112) * 0.5);
        *(double *)(a3 + 288) = v7;
        *(double *)(a3 + 256) = v7;
        double v8 = v6 * v6;
        if (v6 < 0.0) {
          double v8 = 0.0;
        }
        *(double *)(a3 + 320) = v8;
        return 1;
      }
      return 0;
    }
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    char v10 = qword_267C5A9E0;
    BOOL result = os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG);
    if (result)
    {
      __int16 v13 = 0;
      long long v11 = "CLVLF,computeEnuFromEcef,altitude unavailable";
      long long v12 = (uint8_t *)&v13;
      goto LABEL_15;
    }
  }
  return result;
}

BOOL sub_21B6F7CF0(uint64_t a1)
{
  double v2 = *(double *)(a1 + 152);
  if (*(unsigned char *)(a1 + 1784)) {
    BOOL v3 = *(unsigned char *)(a1 + 1616) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3 || v2 <= 0.0)
  {
    return v2 > 0.0 && *(double *)(a1 + 144) < 0.5;
  }
  else
  {
    BOOL v4 = hypot(*(long double *)(a1 + 1632), *(long double *)(a1 + 1640)) / *(double *)(a1 + 1752) < 0.4;
    return *(double *)(a1 + 144) < 0.5 && v4;
  }
}

uint64_t sub_21B6F7D88(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v5;
  long long v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 128);
  long long v9 = *(_OWORD *)(a2 + 144);
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  *(_OWORD *)(a1 + 112) = v7;
  long long v10 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v10;
  long long v11 = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 216) = v11;
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  long long v12 = *(_OWORD *)(a2 + 272);
  long long v13 = *(_OWORD *)(a2 + 288);
  long long v14 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 320) = v14;
  *(_OWORD *)(a1 + 272) = v12;
  *(_OWORD *)(a1 + 288) = v13;
  long long v15 = *(_OWORD *)(a2 + 336);
  *(void *)(a1 + 352) = *(void *)(a2 + 352);
  *(_OWORD *)(a1 + 336) = v15;
  uint64_t v16 = (_OWORD *)(a1 + 360);
  uint64_t v17 = (_OWORD *)(a2 + 360);
  long long v18 = *(_OWORD *)(a2 + 360);
  long long v19 = *(_OWORD *)(a2 + 376);
  long long v20 = *(_OWORD *)(a2 + 392);
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  *(_OWORD *)(a1 + 376) = v19;
  *(_OWORD *)(a1 + 392) = v20;
  *(_OWORD *)(a1 + 360) = v18;
  *(unsigned char *)(a1 + 416) = *(unsigned char *)(a2 + 416);
  long long v21 = *(_OWORD *)(a2 + 432);
  long long v22 = *(_OWORD *)(a2 + 448);
  *(void *)(a1 + 464) = *(void *)(a2 + 464);
  *(_OWORD *)(a1 + 432) = v21;
  *(_OWORD *)(a1 + 448) = v22;
  long long v23 = *(_OWORD *)(a2 + 544);
  long long v25 = *(_OWORD *)(a2 + 496);
  long long v24 = *(_OWORD *)(a2 + 512);
  *(_OWORD *)(a1 + 528) = *(_OWORD *)(a2 + 528);
  *(_OWORD *)(a1 + 544) = v23;
  *(_OWORD *)(a1 + 496) = v25;
  *(_OWORD *)(a1 + 512) = v24;
  *(_OWORD *)(a1 + 480) = *(_OWORD *)(a2 + 480);
  long long v26 = *(_OWORD *)(a2 + 568);
  long long v27 = *(_OWORD *)(a2 + 584);
  *(void *)(a1 + 600) = *(void *)(a2 + 600);
  *(_OWORD *)(a1 + 568) = v26;
  *(_OWORD *)(a1 + 584) = v27;
  long long v28 = *(_OWORD *)(a2 + 632);
  *(_OWORD *)(a1 + 616) = *(_OWORD *)(a2 + 616);
  *(_OWORD *)(a1 + 632) = v28;
  memcpy((void *)(a1 + 656), (const void *)(a2 + 656), 0x128uLL);
  *(unsigned char *)(a1 + 952) = *(unsigned char *)(a2 + 952);
  long long v30 = v17[38];
  long long v29 = v17[39];
  *(void *)(a1 + 1000) = *(void *)(a2 + 1000);
  v16[38] = v30;
  v16[39] = v29;
  long long v32 = v17[42];
  long long v31 = v17[43];
  long long v33 = v17[45];
  v16[44] = v17[44];
  v16[45] = v33;
  v16[42] = v32;
  v16[43] = v31;
  v16[41] = v17[41];
  long long v34 = *(_OWORD *)(a2 + 1104);
  long long v35 = *(_OWORD *)(a2 + 1120);
  *(void *)(a1 + 1136) = *(void *)(a2 + 1136);
  *(_OWORD *)(a1 + 1120) = v35;
  *(_OWORD *)(a1 + 1104) = v34;
  long long v36 = *(_OWORD *)(a2 + 1152);
  *(_OWORD *)(a1 + 1168) = *(_OWORD *)(a2 + 1168);
  *(_OWORD *)(a1 + 1152) = v36;
  memcpy((void *)(a1 + 1192), (const void *)(a2 + 1192), 0x128uLL);
  long long v37 = v17[71];
  v16[72] = v17[72];
  v16[71] = v37;
  *(_OWORD *)(a1 + 1536) = *(_OWORD *)(a2 + 1536);
  long long v38 = *(_OWORD *)(a2 + 1568);
  long long v39 = *(_OWORD *)(a2 + 1584);
  long long v40 = *(_OWORD *)(a2 + 1600);
  *(_OWORD *)(a1 + 1552) = *(_OWORD *)(a2 + 1552);
  *(_OWORD *)(a1 + 1600) = v40;
  *(_OWORD *)(a1 + 1584) = v39;
  *(_OWORD *)(a1 + 1568) = v38;
  *(unsigned char *)(a1 + 1616) = *(unsigned char *)(a2 + 1616);
  long long v41 = *(_OWORD *)(a2 + 1632);
  *(_OWORD *)(a1 + 1648) = *(_OWORD *)(a2 + 1648);
  *(_OWORD *)(a1 + 1632) = v41;
  v16[82] = v17[82];
  long long v42 = v17[84];
  long long v43 = v17[85];
  long long v44 = v17[86];
  v16[83] = v17[83];
  v16[86] = v44;
  v16[85] = v43;
  v16[84] = v42;
  long long v45 = v17[87];
  long long v46 = v17[88];
  *(unsigned char *)(a1 + 1784) = *(unsigned char *)(a2 + 1784);
  v16[88] = v46;
  v16[87] = v45;
  return a1;
}

double *sub_21B6F7FA0(double *result, double a2, double a3, double a4, double a5, double a6)
{
  if (a5 >= 0.0)
  {
    long long v6 = result;
    if (a3 >= 0.0 && *((unsigned char *)result + 160) != 0)
    {
      __double2 v13 = __sincos_stret(a2);
      double v14 = v13.__sinval * a6 * a4 + v6[28];
      v6[27] = v13.__cosval * a6 * a4 + v6[27];
      v6[28] = v14;
      long long v28 = &unk_26CB86810;
      double __B = -(v13.__sinval * a6 * a4);
      double v30 = v13.__cosval * a6 * a4;
      double v31 = v13.__cosval * a6;
      double v32 = v13.__sinval * a6;
      uint64_t v33 = 0;
      double v23 = a3 * a3;
      long long v22 = &unk_26CB86810;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      double v26 = a5 * a5;
      uint64_t v27 = 0;
      v18[4] = 0.0;
      v18[0] = v13.__cosval * a6 * 0.0 - v13.__sinval * a6 * a4 * (a3 * a3);
      v18[1] = v13.__sinval * a6 * 0.0 + v30 * (a3 * a3);
      v18[2] = a5 * a5 * (v13.__cosval * a6) - v13.__sinval * a6 * a4 * 0.0;
      v18[3] = a5 * a5 * (v13.__sinval * a6) + v30 * 0.0;
      sub_21B6EB144(v19, 2, 2);
      cblas_dgemm(CblasColMajor, CblasNoTrans, CblasTrans, 2, 2, 2, 1.0, v18, 2, &__B, 2, 0.0, __C, __ldc);
      uint64_t v15 = 0;
      uint64_t v16 = __C;
      uint64_t v17 = 8 * __ldc;
      do
      {
        vDSP_vaddD(&v6[v15 + 32], 1, v16, 1, &v6[v15 + 32], 1, 2uLL);
        v15 += 3;
        uint64_t v16 = (const double *)((char *)v16 + v17);
      }
      while (v15 != 6);
      BOOL result = (double *)sub_21B6EA254(v19);
      v6[14] = sqrt(v6[32] + v6[36]);
      v6[16] = a2;
      v6[17] = a3;
      v6[18] = a4;
      v6[19] = a5;
    }
  }
  return result;
}

void sub_21B6F81C0(uint64_t a1, double a2)
{
  unsigned __int8 v4 = atomic_exchange_explicit((atomic_uchar *volatile)(a1 + 1), 1u, memory_order_acquire);
  if ((v4 & 1) == 0)
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    long long v5 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v38 = 0;
      _os_log_impl(&dword_21B6E4000, v5, OS_LOG_TYPE_ERROR, "CLVLF,removeAllVioDataLessThanMachAbsoluteTime,Called without locking vision buffers", v38, 2u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  if (v7 != v6)
  {
    while (*(double *)(v7 + 40) >= a2)
    {
      v7 += 1432;
      if (v7 == v6)
      {
        uint64_t v7 = *(void *)(a1 + 16);
        goto LABEL_16;
      }
    }
    if (v7 != v6)
    {
      uint64_t v8 = v7 + 1432;
      if (v7 + 1432 != v6)
      {
        do
        {
          if (*(double *)(v8 + 40) >= a2)
          {
            long long v9 = *(_OWORD *)v8;
            long long v10 = *(_OWORD *)(v8 + 16);
            long long v11 = *(_OWORD *)(v8 + 32);
            *(void *)(v7 + 48) = *(void *)(v8 + 48);
            *(_OWORD *)(v7 + 16) = v10;
            *(_OWORD *)(v7 + 32) = v11;
            *(_OWORD *)uint64_t v7 = v9;
            *(unsigned char *)(v7 + 56) = *(unsigned char *)(v8 + 56);
            long long v12 = *(_OWORD *)(v8 + 72);
            long long v13 = *(_OWORD *)(v8 + 88);
            *(void *)(v7 + 104) = *(void *)(v8 + 104);
            *(_OWORD *)(v7 + 88) = v13;
            *(_OWORD *)(v7 + 72) = v12;
            long long v14 = *(_OWORD *)(v8 + 152);
            long long v15 = *(_OWORD *)(v8 + 168);
            long long v16 = *(_OWORD *)(v8 + 184);
            *(_OWORD *)(v7 + 136) = *(_OWORD *)(v8 + 136);
            *(_OWORD *)(v7 + 184) = v16;
            *(_OWORD *)(v7 + 168) = v15;
            *(_OWORD *)(v7 + 152) = v14;
            *(_OWORD *)(v7 + 120) = *(_OWORD *)(v8 + 120);
            long long v17 = *(_OWORD *)(v8 + 208);
            long long v18 = *(_OWORD *)(v8 + 224);
            *(void *)(v7 + 240) = *(void *)(v8 + 240);
            *(_OWORD *)(v7 + 208) = v17;
            *(_OWORD *)(v7 + 224) = v18;
            long long v19 = *(_OWORD *)(v8 + 272);
            *(_OWORD *)(v7 + 256) = *(_OWORD *)(v8 + 256);
            *(_OWORD *)(v7 + 272) = v19;
            memcpy((void *)(v7 + 296), (const void *)(v8 + 296), 0x129uLL);
            long long v21 = *(_OWORD *)(v8 + 608);
            long long v20 = *(_OWORD *)(v8 + 624);
            *(void *)(v7 + 640) = *(void *)(v8 + 640);
            *(_OWORD *)(v7 + 608) = v21;
            *(_OWORD *)(v7 + 624) = v20;
            long long v23 = *(_OWORD *)(v8 + 672);
            long long v22 = *(_OWORD *)(v8 + 688);
            long long v24 = *(_OWORD *)(v8 + 720);
            *(_OWORD *)(v7 + 704) = *(_OWORD *)(v8 + 704);
            *(_OWORD *)(v7 + 720) = v24;
            *(_OWORD *)(v7 + 672) = v23;
            *(_OWORD *)(v7 + 688) = v22;
            *(_OWORD *)(v7 + 656) = *(_OWORD *)(v8 + 656);
            long long v25 = *(_OWORD *)(v8 + 744);
            long long v26 = *(_OWORD *)(v8 + 760);
            *(void *)(v7 + 776) = *(void *)(v8 + 776);
            *(_OWORD *)(v7 + 760) = v26;
            *(_OWORD *)(v7 + 744) = v25;
            long long v27 = *(_OWORD *)(v8 + 792);
            *(_OWORD *)(v7 + 808) = *(_OWORD *)(v8 + 808);
            *(_OWORD *)(v7 + 792) = v27;
            memcpy((void *)(v7 + 832), (const void *)(v8 + 832), 0x128uLL);
            long long v28 = *(_OWORD *)(v8 + 1136);
            *(_OWORD *)(v7 + 1152) = *(_OWORD *)(v8 + 1152);
            *(_OWORD *)(v7 + 1136) = v28;
            *(_OWORD *)(v7 + 1176) = *(_OWORD *)(v8 + 1176);
            long long v29 = *(_OWORD *)(v8 + 1224);
            long long v30 = *(_OWORD *)(v8 + 1240);
            long long v31 = *(_OWORD *)(v8 + 1208);
            *(_OWORD *)(v7 + 1192) = *(_OWORD *)(v8 + 1192);
            *(_OWORD *)(v7 + 1240) = v30;
            *(_OWORD *)(v7 + 1224) = v29;
            *(_OWORD *)(v7 + 1208) = v31;
            *(unsigned char *)(v7 + 1256) = *(unsigned char *)(v8 + 1256);
            long long v32 = *(_OWORD *)(v8 + 1272);
            *(_OWORD *)(v7 + 1288) = *(_OWORD *)(v8 + 1288);
            *(_OWORD *)(v7 + 1272) = v32;
            *(_OWORD *)(v7 + 1312) = *(_OWORD *)(v8 + 1312);
            long long v33 = *(_OWORD *)(v8 + 1344);
            long long v34 = *(_OWORD *)(v8 + 1360);
            long long v35 = *(_OWORD *)(v8 + 1376);
            *(_OWORD *)(v7 + 1328) = *(_OWORD *)(v8 + 1328);
            *(_OWORD *)(v7 + 1376) = v35;
            *(_OWORD *)(v7 + 1360) = v34;
            *(_OWORD *)(v7 + 1344) = v33;
            long long v36 = *(_OWORD *)(v8 + 1392);
            long long v37 = *(_OWORD *)(v8 + 1408);
            *(unsigned char *)(v7 + 1424) = *(unsigned char *)(v8 + 1424);
            *(_OWORD *)(v7 + 1408) = v37;
            *(_OWORD *)(v7 + 1392) = v36;
            v7 += 1432;
          }
          v8 += 1432;
        }
        while (v8 != v6);
        uint64_t v6 = *(void *)(a1 + 16);
      }
    }
LABEL_16:
    sub_21B6FA474((void *)(a1 + 8), v7, v6);
  }
  if ((v4 & 1) == 0) {
    atomic_store(0, (unsigned __int8 *)(a1 + 1));
  }
}

uint64_t sub_21B6F8484(uint64_t result, uint64_t a2, long long *a3)
{
  if ((long long *)a2 != a3)
  {
    uint64_t v3 = result;
    BOOL result = sub_21B6FB140(a3, *(long long **)(result + 8), a2);
    *(void *)(v3 + 8) = result;
  }
  return result;
}

uint64_t sub_21B6F84C8(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2 != a3)
  {
    uint64_t v3 = result;
    BOOL result = sub_21B6FB8B8(a3, *(void *)(result + 8), a2);
    *(void *)(v3 + 8) = result;
  }
  return result;
}

uint64_t sub_21B6F850C(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  long long v4 = *(_OWORD *)(a2 + 24);
  long long v5 = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 24) = v4;
  long long v6 = *(_OWORD *)(a2 + 104);
  long long v7 = *(_OWORD *)(a2 + 120);
  long long v8 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 136) = v8;
  *(_OWORD *)(a1 + 120) = v7;
  *(_OWORD *)(a1 + 104) = v6;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  long long v9 = *(_OWORD *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 176);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 176) = v10;
  long long v11 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 224) = v11;
  memcpy((void *)(a1 + 248), (const void *)(a2 + 248), 0x128uLL);
  *(unsigned char *)(a1 + 544) = *(unsigned char *)(a2 + 544);
  long long v13 = *(_OWORD *)(a2 + 560);
  long long v12 = *(_OWORD *)(a2 + 576);
  *(void *)(a1 + 592) = *(void *)(a2 + 592);
  *(_OWORD *)(a1 + 560) = v13;
  *(_OWORD *)(a1 + 576) = v12;
  long long v15 = *(_OWORD *)(a2 + 624);
  long long v14 = *(_OWORD *)(a2 + 640);
  long long v16 = *(_OWORD *)(a2 + 672);
  *(_OWORD *)(a1 + 656) = *(_OWORD *)(a2 + 656);
  *(_OWORD *)(a1 + 672) = v16;
  *(_OWORD *)(a1 + 624) = v15;
  *(_OWORD *)(a1 + 640) = v14;
  *(_OWORD *)(a1 + 608) = *(_OWORD *)(a2 + 608);
  long long v17 = *(_OWORD *)(a2 + 696);
  long long v18 = *(_OWORD *)(a2 + 712);
  *(void *)(a1 + 728) = *(void *)(a2 + 728);
  *(_OWORD *)(a1 + 712) = v18;
  *(_OWORD *)(a1 + 696) = v17;
  long long v19 = *(_OWORD *)(a2 + 744);
  *(_OWORD *)(a1 + 760) = *(_OWORD *)(a2 + 760);
  *(_OWORD *)(a1 + 744) = v19;
  memcpy((void *)(a1 + 784), (const void *)(a2 + 784), 0x128uLL);
  long long v20 = *(_OWORD *)(a2 + 1088);
  *(_OWORD *)(a1 + 1104) = *(_OWORD *)(a2 + 1104);
  *(_OWORD *)(a1 + 1088) = v20;
  long long v21 = *(_OWORD *)(a2 + 1144);
  *(_OWORD *)(a1 + 1128) = *(_OWORD *)(a2 + 1128);
  *(_OWORD *)(a1 + 1144) = v21;
  long long v22 = *(_OWORD *)(a2 + 1176);
  *(_OWORD *)(a1 + 1160) = *(_OWORD *)(a2 + 1160);
  *(_OWORD *)(a1 + 1176) = v22;
  long long v23 = *(_OWORD *)(a2 + 1216);
  *(_OWORD *)(a1 + 1200) = *(_OWORD *)(a2 + 1200);
  *(_OWORD *)(a1 + 1216) = v23;
  long long v24 = *(_OWORD *)(a2 + 1256);
  *(_OWORD *)(a1 + 1240) = *(_OWORD *)(a2 + 1240);
  *(_OWORD *)(a1 + 1256) = v24;
  char v25 = *(unsigned char *)(a2 + 1320);
  long long v27 = *(_OWORD *)(a2 + 1288);
  long long v26 = *(_OWORD *)(a2 + 1304);
  *(_OWORD *)(a1 + 1272) = *(_OWORD *)(a2 + 1272);
  *(_OWORD *)(a1 + 1288) = v27;
  *(_OWORD *)(a1 + 1304) = v26;
  *(unsigned char *)(a1 + 1320) = v25;
  long long v28 = *(_OWORD *)(a2 + 1352);
  *(_OWORD *)(a1 + 1336) = *(_OWORD *)(a2 + 1336);
  *(_OWORD *)(a1 + 1352) = v28;
  long long v29 = *(_OWORD *)(a2 + 1392);
  *(_OWORD *)(a1 + 1376) = *(_OWORD *)(a2 + 1376);
  *(_OWORD *)(a1 + 1392) = v29;
  *(_OWORD *)(a1 + 1416) = *(_OWORD *)(a2 + 1416);
  long long v30 = *(_OWORD *)(a2 + 1480);
  long long v32 = *(_OWORD *)(a2 + 1432);
  long long v31 = *(_OWORD *)(a2 + 1448);
  *(_OWORD *)(a1 + 1464) = *(_OWORD *)(a2 + 1464);
  *(_OWORD *)(a1 + 1480) = v30;
  *(_OWORD *)(a1 + 1432) = v32;
  *(_OWORD *)(a1 + 1448) = v31;
  long long v33 = *(_OWORD *)(a2 + 1496);
  *(void *)(a1 + 1512) = *(void *)(a2 + 1512);
  *(_OWORD *)(a1 + 1496) = v33;
  uint64_t v34 = *(void *)(a2 + 1536);
  *(_OWORD *)(a1 + 1520) = *(_OWORD *)(a2 + 1520);
  *(void *)(a1 + 1536) = v34;
  sub_21B6F7D88(a1 + 1544, a2 + 1544);
  return a1;
}

void sub_21B6F86E0()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v256 = *MEMORY[0x263EF8340];
  double v147 = (unsigned __int8 *)(v0 + 1);
  sub_21B6EBAC4((atomic_uchar *)(v0 + 1));
  uint64_t v4 = *(void *)(v3 + 32);
  long long v5 = *(long long **)(v3 + 40);
  if ((long long *)v4 == v5)
  {
    long long v5 = *(long long **)(v3 + 32);
  }
  else
  {
    while (*(unsigned char *)(v4 + 3152) && *(double *)(v4 + 1136) >= 0.6827)
    {
      v4 += 3160;
      if ((long long *)v4 == v5)
      {
        uint64_t v4 = *(void *)(v3 + 40);
        goto LABEL_14;
      }
    }
    if ((long long *)v4 != v5)
    {
      uint64_t v6 = v4 + 3160;
      if ((long long *)(v4 + 3160) != v5)
      {
        do
        {
          if (*(unsigned char *)(v6 + 3152) && *(double *)(v6 + 1136) >= 0.6827)
          {
            sub_21B6FB198(v4, (long long *)v6);
            v4 += 3160;
          }
          v6 += 3160;
        }
        while ((long long *)v6 != v5);
        long long v5 = *(long long **)(v3 + 40);
      }
    }
  }
LABEL_14:
  sub_21B6F8484(v3 + 32, v4, v5);
  uint64_t v7 = *(void *)(v3 + 32);
  uint64_t v8 = *(void *)(v3 + 40);
  atomic_store(0, v147);
  if (v7 == v8) {
    return;
  }
  double v146 = (unsigned char *)(v3 + 9272);
  double v145 = (unsigned char *)(v3 + 8736);
  long long v9 = (unsigned __int8 *)(v3 + 6776);
  __src = (void *)(v3 + 8976);
  double v143 = (_OWORD *)(v3 + 9288);
  double v142 = (_OWORD *)(v3 + 9336);
  double v141 = (_OWORD *)(v3 + 9424);
  long long v140 = (_OWORD *)(v3 + 9472);
  int v139 = (void *)(v3 + 9512);
  BOOL v138 = (_OWORD *)(v3 + 9816);
  double v137 = (_OWORD *)(v3 + 9856);
  uint64_t v136 = (_OWORD *)(v3 + 9952);
  long long v135 = (_OWORD *)(v3 + 9992);
  uint64_t v134 = (_OWORD *)(v3 + 10072);
  int64x2_t v128 = vdupq_n_s64(3uLL);
  double v10 = 3.0;
  uint64_t v127 = v3 + 3416;
  uint64_t v126 = v2;
  unint64_t v132 = (_OWORD *)(v3 + 8752);
  uint64_t v133 = (_OWORD *)(v3 + 8680);
  long long v130 = (_OWORD *)(v3 + 8888);
  long long v131 = (_OWORD *)(v3 + 8800);
  long long v129 = (_OWORD *)(v3 + 8936);
  while (1)
  {
    sub_21B6EBAC4((atomic_uchar *)v147);
    uint64_t v11 = *(void *)(v3 + 32);
    long long v12 = *(long long **)(v3 + 40);
    if ((long long *)v11 == v12 || *(double *)(v11 + 8) > *(double *)(v2 + 8)) {
      break;
    }
    sub_21B6FA9E0((uint64_t)v181, *(long long **)(v3 + 32));
    sub_21B6FAAAC((uint64_t)v192, (long long *)(v11 + 1728));
    *(void *)(v3 + 40) = sub_21B6FB140((long long *)(v11 + 3160), v12, v11);
    atomic_store(0, (unsigned __int8 *)(v3 + 1));
    int v178 = &unk_26CB86830;
    long long v179 = v183;
    long long v180 = v184;
    if (!sub_21B6E90F8((uint64_t)v181))
    {
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
      }
      uint64_t v16 = qword_267C5A9E0;
      if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      *(_DWORD *)uint64_t v246 = 134349056;
      *(void *)&v246[4] = v182;
      long long v14 = v16;
      long long v15 = "CLVLF,initWithFrames,Unable to compute VLF for ENU,machAbsTime,%{public}.3lf";
      goto LABEL_28;
    }
    char v177 = 1;
    sub_21B6E9E1C((uint64_t)v181, &v177, (uint64_t)&v156);
    if (v177)
    {
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
      }
      uint64_t v13 = qword_267C5A9E0;
      if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      *(_DWORD *)uint64_t v246 = 134349056;
      *(void *)&v246[4] = v182;
      long long v14 = v13;
      long long v15 = "CLVLF,initWithFrames,Unable to convert VLF to LOC,machAbsTime,%{public}.3lf";
      goto LABEL_28;
    }
    LODWORD(v156) = *(_DWORD *)(v3 + 13272);
    long long v18 = *(_OWORD *)(v3 + 13416);
    long long v163 = *(_OWORD *)(v3 + 13400);
    long long v164 = v18;
    if (!v185 || !v240) {
      goto LABEL_49;
    }
    *(void *)uint64_t v246 = &unk_26CB86830;
    memset(&v246[8], 0, 32);
    double v19 = *(double *)&v199;
    if (*(double *)&v199 >= 1.0)
    {
      *(void *)&v246[16] = 0xBFF921FB54442D18;
      double v21 = atan2(-*((double *)&v201 + 1), *(long double *)&v200);
      double v20 = -1.57079633;
    }
    else if (*(double *)&v199 <= -1.0)
    {
      *(void *)&v246[16] = 0x3FF921FB54442D18;
      double v21 = -atan2(-*((double *)&v201 + 1), *(long double *)&v200);
      double v20 = 1.57079633;
    }
    else
    {
      *(void *)&v246[8] = atan2(*((long double *)&v200 + 1), *(long double *)&__x);
      double v20 = asin(-v19);
      *(double *)&v246[16] = v20;
      double v21 = atan2(*((long double *)&v198 + 1), *(long double *)&v198);
    }
    *(double *)&v246[24] = v21;
    double v148 = &unk_26CB86830;
    int64x2_t v149 = 0u;
    long long v150 = 0u;
    double v22 = v187;
    if (v187 >= 1.0)
    {
      v149.i64[1] = 0xBFF921FB54442D18;
      double v24 = atan2(-v190, v188);
      double v23 = -1.57079633;
    }
    else if (v187 <= -1.0)
    {
      v149.i64[1] = 0x3FF921FB54442D18;
      double v24 = -atan2(-v190, v188);
      double v23 = 1.57079633;
    }
    else
    {
      v149.i64[0] = atan2(v189, v191);
      double v23 = asin(-v22);
      *(double *)&v149.i64[1] = v23;
      double v24 = atan2(v186[9], v186[8]);
    }
    *(double *)&long long v150 = v24;
    double v25 = vabdd_f64(v20, v23);
    if (6.28318531 - v25 >= v25) {
      double v26 = v25;
    }
    else {
      double v26 = 6.28318531 - v25;
    }
    if (v26 <= 0.261799388)
    {
      double v10 = 3.0;
LABEL_49:
      uint64_t v153 = &unk_26CB86830;
      long long v154 = v206;
      long long v155 = v207;
      long long v206 = 0uLL;
      *(void *)&long long v207 = 0;
      sub_21B6EA294((uint64_t)&v148, (uint64_t)v194);
      sub_21B6E6C8C((uint64_t)&v148);
      sub_21B6EA294((uint64_t)v246, (uint64_t)v186);
      sub_21B6E72BC((uint64_t)v246, (uint64_t)&v148, 1);
      *(unsigned char *)(v3 + 6784) = v246[0];
      long long v27 = *(_OWORD *)&v246[32];
      *(_OWORD *)(v3 + 6800) = *(_OWORD *)&v246[16];
      *(_OWORD *)(v3 + 6816) = v27;
      *(void *)(v3 + 6832) = *(void *)&v246[48];
      long long v28 = *(_OWORD *)v249;
      *(_OWORD *)(v3 + 6880) = *(_OWORD *)&v248[32];
      *(_OWORD *)(v3 + 6896) = v28;
      *(_OWORD *)(v3 + 6912) = *(_OWORD *)&v249[16];
      long long v29 = *(_OWORD *)&v248[16];
      *(_OWORD *)(v3 + 6848) = *(_OWORD *)v248;
      *(_OWORD *)(v3 + 6864) = v29;
      long long v30 = v250;
      long long v31 = v251;
      *(void *)(v3 + 6968) = v252;
      *(_OWORD *)(v3 + 6936) = v30;
      *(_OWORD *)(v3 + 6952) = v31;
      long long v32 = v254;
      *(_OWORD *)(v3 + 6984) = v253;
      *(_OWORD *)(v3 + 7000) = v32;
      memcpy((void *)(v3 + 7024), v255, 0x128uLL);
      LOBYTE(v148) = 1;
      int64x2_t v149 = v128;
      long long v150 = xmmword_21B6FEAA0;
      uint64_t v151 = v3 + 7024;
      uint64_t v152 = v3 + 7144;
      double v33 = *(double *)(v3 + 7024) + *(double *)(v3 + 7080) + *(double *)(v3 + 7136);
      double v34 = sqrt(v33);
      BOOL v36 = (v34 < 0.0 || ((*(void *)&v34 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
         && (unint64_t)(*(void *)&v34 - 1) > 0xFFFFFFFFFFFFELL;
      if (!v36 && v34 < 0.261799388)
      {
        *(double *)uint64_t v246 = 0.0685389195 / v33;
        sub_21B6FAFD0((uint64_t)&v148, (const double *)v246);
      }
      LOBYTE(v241) = 1;
      *(int64x2_t *)&v242[4] = vdupq_n_s64(3uLL);
      long long v243 = xmmword_21B6FEAA0;
      uint64_t v244 = v3 + 7192;
      uint64_t v245 = v3 + 7312;
      double v37 = *(double *)(v3 + 7192) + *(double *)(v3 + 7248) + *(double *)(v3 + 7304);
      double v38 = sqrt(v37);
      BOOL v40 = (v38 < 0.0 || ((*(void *)&v38 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
         && (unint64_t)(*(void *)&v38 - 1) > 0xFFFFFFFFFFFFELL;
      if (!v40 && v38 < v10)
      {
        *(double *)uint64_t v246 = 9.0 / v37;
        sub_21B6FAFD0((uint64_t)&v241, (const double *)v246);
      }
      *long long v9 = 1;
      long long v41 = v180;
      *(_OWORD *)(v3 + 7864) = v179;
      *(_OWORD *)(v3 + 7880) = v41;
      long long v42 = v155;
      *(_OWORD *)(v3 + 7904) = v154;
      *(_OWORD *)(v3 + 7920) = v42;
      long long v43 = v157;
      *(_OWORD *)(v3 + 7936) = v156;
      *(_OWORD *)(v3 + 7952) = v43;
      long long v44 = v159;
      *(_OWORD *)(v3 + 7976) = v158;
      *(_OWORD *)(v3 + 7992) = v44;
      long long v45 = v161;
      *(_OWORD *)(v3 + 8016) = v160;
      *(_OWORD *)(v3 + 8032) = v45;
      long long v46 = v163;
      *(_OWORD *)(v3 + 8048) = v162;
      *(_OWORD *)(v3 + 8064) = v46;
      *(_OWORD *)(v3 + 8080) = v164;
      *(unsigned char *)(v3 + 8096) = v165;
      long long v47 = v167;
      *(_OWORD *)(v3 + 8112) = v166;
      *(_OWORD *)(v3 + 8128) = v47;
      long long v48 = v169;
      *(_OWORD *)(v3 + 8152) = v168;
      *(_OWORD *)(v3 + 8168) = v48;
      long long v49 = v174;
      long long v50 = v172;
      *(_OWORD *)(v3 + 8240) = v173;
      *(_OWORD *)(v3 + 8256) = v49;
      long long v51 = v171;
      *(_OWORD *)(v3 + 0x2000) = v170;
      *(_OWORD *)(v3 + 8208) = v51;
      *(_OWORD *)(v3 + 8224) = v50;
      *(void *)(v3 + 8288) = v176;
      *(_OWORD *)(v3 + 8272) = v175;
      *(_DWORD *)(v3 + 8296) = 0;
      sub_21B6F6244((uint64_t)v192, v9);
      sub_21B6F6498((uint64_t)v192, v9);
      sub_21B6F6734((uint64_t)v9, v52, v53, v54);
      long long v55 = v157;
      *(_OWORD *)(v3 + 8320) = v156;
      *(_OWORD *)(v3 + 8336) = v55;
      long long v56 = v159;
      *(_OWORD *)(v3 + 8360) = v158;
      *(_OWORD *)(v3 + 8376) = v56;
      long long v57 = v161;
      *(_OWORD *)(v3 + 8400) = v160;
      *(_OWORD *)(v3 + 8416) = v57;
      *(unsigned char *)(v3 + 8480) = v165;
      long long v58 = v164;
      long long v59 = v162;
      *(_OWORD *)(v3 + 8448) = v163;
      *(_OWORD *)(v3 + 8464) = v58;
      *(_OWORD *)(v3 + 8432) = v59;
      long long v60 = v167;
      *(_OWORD *)(v3 + 8496) = v166;
      *(_OWORD *)(v3 + 8512) = v60;
      long long v61 = v169;
      *(_OWORD *)(v3 + 8536) = v168;
      *(_OWORD *)(v3 + 8552) = v61;
      long long v62 = v173;
      *(_OWORD *)(v3 + 8608) = v172;
      *(_OWORD *)(v3 + 8624) = v62;
      *(_OWORD *)(v3 + 8640) = v174;
      long long v63 = v171;
      *(_OWORD *)(v3 + 8576) = v170;
      *(_OWORD *)(v3 + 8592) = v63;
      *(void *)(v3 + 8672) = v176;
      *(_OWORD *)(v3 + 8656) = v175;
      *(void *)(v3 + 8728) = v193;
      long long v64 = v192[2];
      long long v65 = v192[0];
      *(_OWORD *)(v3 + 8696) = v192[1];
      *(_OWORD *)(v3 + 8712) = v64;
      *uint64_t v133 = v65;
      *double v145 = v194[0];
      long long v66 = v196;
      *unint64_t v132 = v195;
      *(_OWORD *)(v3 + 8768) = v66;
      *(void *)(v3 + 8784) = v197;
      long long v67 = v198;
      long long v68 = v199;
      long long v69 = __x;
      *(_OWORD *)(v3 + 8848) = v201;
      *(_OWORD *)(v3 + 8864) = v69;
      long long v70 = v200;
      *(_OWORD *)(v3 + 8816) = v68;
      *(_OWORD *)(v3 + 8832) = v70;
      *long long v131 = v67;
      long long v71 = v203;
      long long v72 = v204;
      *(void *)(v3 + 8920) = v205;
      *long long v130 = v71;
      *(_OWORD *)(v3 + 8904) = v72;
      long long v73 = v207;
      *long long v129 = v206;
      *(_OWORD *)(v3 + 8952) = v73;
      memcpy(__src, v208, 0x128uLL);
      *double v146 = v208[296];
      long long v74 = v210;
      *double v143 = v209;
      *(_OWORD *)(v3 + 9304) = v74;
      *(void *)(v3 + 9320) = v211;
      long long v75 = v215;
      *(_OWORD *)(v3 + 9368) = v214;
      *(_OWORD *)(v3 + 9384) = v75;
      *(_OWORD *)(v3 + 9400) = v216;
      long long v76 = v213;
      *double v142 = v212;
      *(_OWORD *)(v3 + 9352) = v76;
      long long v77 = v218;
      *double v141 = v217;
      *(_OWORD *)(v3 + 9440) = v77;
      *(void *)(v3 + 9456) = v219;
      long long v78 = v221;
      *long long v140 = v220;
      *(_OWORD *)(v3 + 9488) = v78;
      memcpy(v139, v222, 0x128uLL);
      long long v79 = v224;
      *BOOL v138 = v223;
      *(_OWORD *)(v3 + 9832) = v79;
      long long v80 = v228;
      *(_OWORD *)(v3 + 9888) = v227;
      *(_OWORD *)(v3 + 9904) = v80;
      *(_OWORD *)(v3 + 9920) = v229;
      long long v81 = v226;
      *double v137 = v225;
      *(_OWORD *)(v3 + 9872) = v81;
      *(unsigned char *)(v3 + 9936) = v230;
      long long v82 = v232;
      *uint64_t v136 = v231;
      *(_OWORD *)(v3 + 9968) = v82;
      long long v83 = v236;
      *(_OWORD *)(v3 + 10024) = v235;
      *(_OWORD *)(v3 + 10040) = v83;
      *(_OWORD *)(v3 + 10056) = v237;
      long long v84 = v234;
      *long long v135 = v233;
      *(_OWORD *)(v3 + 10008) = v84;
      long long v85 = v239;
      *uint64_t v134 = v238;
      *(_OWORD *)(v3 + 10088) = v85;
      *(unsigned char *)(v3 + 10104) = v240;
      sub_21B6F74F8(v127, (uint64_t)v9);
      sub_21B6F74F8(v3 + 80, v127);
      unint64_t v86 = *(void *)(v3 + 6752);
      *(void *)(v3 + 6760) = v86;
      if (v86 >= *(void *)(v3 + 6768)) {
        uint64_t v87 = sub_21B6FB580((uint64_t *)(v3 + 6752), (uint64_t)v9);
      }
      else {
        uint64_t v87 = sub_21B6FB69C(v86, (uint64_t)v9) + 3336;
      }
      *(void *)(v3 + 6760) = v87;
      long long v88 = *(_OWORD *)(v3 + 8696);
      *(_OWORD *)(v3 + 10112) = *v133;
      *(_OWORD *)(v3 + 10128) = v88;
      *(_OWORD *)(v3 + 10144) = *(_OWORD *)(v3 + 8712);
      *(void *)(v3 + 10160) = *(void *)(v3 + 8728);
      *(unsigned char *)(v3 + 10168) = *v145;
      long long v89 = *(_OWORD *)(v3 + 8768);
      *(_OWORD *)(v3 + 10184) = *v132;
      *(_OWORD *)(v3 + 10200) = v89;
      *(void *)(v3 + 10216) = *(void *)(v3 + 8784);
      long long v90 = *(_OWORD *)(v3 + 8848);
      *(_OWORD *)(v3 + 10264) = *(_OWORD *)(v3 + 8832);
      *(_OWORD *)(v3 + 10280) = v90;
      *(_OWORD *)(v3 + 10296) = *(_OWORD *)(v3 + 8864);
      long long v91 = *(_OWORD *)(v3 + 8816);
      *(_OWORD *)(v3 + 10232) = *v131;
      *(_OWORD *)(v3 + 10248) = v91;
      long long v92 = *(_OWORD *)(v3 + 8904);
      *(_OWORD *)(v3 + 10320) = *v130;
      *(_OWORD *)(v3 + 10336) = v92;
      *(void *)(v3 + 10352) = *(void *)(v3 + 8920);
      long long v93 = *(_OWORD *)(v3 + 8952);
      *(_OWORD *)(v3 + 10368) = *v129;
      *(_OWORD *)(v3 + 10384) = v93;
      memcpy((void *)(v3 + 10408), __src, 0x128uLL);
      *(unsigned char *)(v3 + 10704) = *v146;
      long long v94 = *(_OWORD *)(v3 + 9304);
      *(_OWORD *)(v3 + 10720) = *v143;
      *(_OWORD *)(v3 + 10736) = v94;
      *(void *)(v3 + 10752) = *(void *)(v3 + 9320);
      long long v95 = *(_OWORD *)(v3 + 9384);
      *(_OWORD *)(v3 + 10800) = *(_OWORD *)(v3 + 9368);
      *(_OWORD *)(v3 + 10816) = v95;
      *(_OWORD *)(v3 + 10832) = *(_OWORD *)(v3 + 9400);
      long long v96 = *(_OWORD *)(v3 + 9352);
      *(_OWORD *)(v3 + 10768) = *v142;
      *(_OWORD *)(v3 + 10784) = v96;
      long long v97 = *(_OWORD *)(v3 + 9440);
      *(_OWORD *)(v3 + 10856) = *v141;
      *(_OWORD *)(v3 + 10872) = v97;
      *(void *)(v3 + 10888) = *(void *)(v3 + 9456);
      long long v98 = *(_OWORD *)(v3 + 9488);
      *(_OWORD *)(v3 + 10904) = *v140;
      *(_OWORD *)(v3 + 10920) = v98;
      memcpy((void *)(v3 + 10944), v139, 0x128uLL);
      long long v99 = *(_OWORD *)(v3 + 9832);
      *(_OWORD *)(v3 + 11248) = *v138;
      *(_OWORD *)(v3 + 11264) = v99;
      long long v100 = *(_OWORD *)(v3 + 9904);
      *(_OWORD *)(v3 + 11320) = *(_OWORD *)(v3 + 9888);
      *(_OWORD *)(v3 + 11336) = v100;
      *(_OWORD *)(v3 + 11352) = *(_OWORD *)(v3 + 9920);
      long long v101 = *(_OWORD *)(v3 + 9872);
      *(_OWORD *)(v3 + 11288) = *v137;
      *(_OWORD *)(v3 + 11304) = v101;
      *(unsigned char *)(v3 + 11368) = *(unsigned char *)(v3 + 9936);
      long long v102 = *(_OWORD *)(v3 + 9968);
      *(_OWORD *)(v3 + 11384) = *v136;
      *(_OWORD *)(v3 + 11400) = v102;
      long long v103 = *(_OWORD *)(v3 + 10040);
      *(_OWORD *)(v3 + 11456) = *(_OWORD *)(v3 + 10024);
      *(_OWORD *)(v3 + 11472) = v103;
      *(_OWORD *)(v3 + 11488) = *(_OWORD *)(v3 + 10056);
      long long v104 = *(_OWORD *)(v3 + 10008);
      *(_OWORD *)(v3 + 11424) = *v135;
      *(_OWORD *)(v3 + 11440) = v104;
      long long v105 = *(_OWORD *)(v3 + 10088);
      *(_OWORD *)(v3 + 11504) = *v134;
      *(_OWORD *)(v3 + 11520) = v105;
      *(unsigned char *)(v3 + 11536) = *(unsigned char *)(v3 + 10104);
      uint64_t v106 = *(void *)(v3 + 56);
      uint64_t v107 = *(void *)(v3 + 64);
      if (v106 != v107)
      {
        double v108 = *(double *)(v3 + 7952);
        while (*(double *)(v106 + 16) >= v108)
        {
          v106 += 1792;
          if (v106 == v107)
          {
            uint64_t v106 = *(void *)(v3 + 64);
            goto LABEL_88;
          }
        }
        if (v106 != v107)
        {
          uint64_t v111 = v106 + 1792;
          if (v106 + 1792 != v107)
          {
            do
            {
              if (*(double *)(v111 + 16) >= v108)
              {
                sub_21B6F7D88(v106, v111);
                v106 += 1792;
              }
              v111 += 1792;
            }
            while (v111 != v107);
            uint64_t v107 = *(void *)(v3 + 64);
          }
        }
LABEL_88:
        sub_21B6F84C8(v3 + 56, v106, v107);
      }
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
      }
      uint64_t v2 = v126;
      long long v112 = qword_267C5A9E0;
      if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v113 = *(void *)(v3 + 6936);
        uint64_t v114 = *(void *)(v3 + 6944);
        uint64_t v115 = *(void *)(v3 + 6952);
        double v116 = *(double *)(v3 + 6960) * 57.2957795;
        uint64_t v117 = *(void *)(v3 + 6984);
        uint64_t v118 = *(void *)(v3 + 6992);
        uint64_t v119 = *(void *)(v3 + 7000);
        uint64_t v120 = *(void *)(v3 + 7024);
        uint64_t v121 = *(void *)(v3 + 7080);
        uint64_t v122 = *(void *)(v3 + 7136);
        uint64_t v123 = *(void *)(v3 + 7192);
        uint64_t v124 = *(void *)(v3 + 7248);
        uint64_t v125 = *(void *)(v3 + 7304);
        *(_DWORD *)uint64_t v246 = 134352385;
        *(void *)&v246[4] = v182;
        *(_WORD *)&v246[12] = 2049;
        *(void *)&v246[14] = v113;
        *(_WORD *)&v246[22] = 2049;
        *(void *)&v246[24] = v114;
        *(_WORD *)&v246[32] = 2049;
        *(void *)&v246[34] = v115;
        *(_WORD *)&v246[42] = 2049;
        *(double *)&v246[44] = v116;
        *(_WORD *)&v246[52] = 2049;
        *(void *)&v246[54] = v117;
        __int16 v247 = 2049;
        *(void *)uint64_t v248 = v118;
        *(_WORD *)&v248[8] = 2049;
        *(void *)&v248[10] = v119;
        *(_WORD *)&v248[18] = 2049;
        *(void *)&v248[20] = v120;
        *(_WORD *)&v248[28] = 2049;
        *(void *)&v248[30] = v121;
        *(_WORD *)&v248[38] = 2049;
        *(void *)&v248[40] = v122;
        *(_WORD *)uint64_t v249 = 2049;
        *(void *)&v249[2] = v123;
        *(_WORD *)&v249[10] = 2049;
        *(void *)&v249[12] = v124;
        *(_WORD *)&v249[20] = 2049;
        *(void *)&v249[22] = v125;
        _os_log_impl(&dword_21B6E4000, v112, OS_LOG_TYPE_DEBUG, "CLVLF,initWithFrames,Filter initialized,machAbsTime,%{public}.3lf,vio2enu,[%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf,%{private}.3lf],vio2enu_cov_diag,[%{private}.6lf,%{private}.6lf,%{private}.6lf,%{private}.6lf,%{private}.6lf,%{private}.6lf]", v246, 0x8Eu);
      }
      int v17 = 3;
      goto LABEL_30;
    }
    double v10 = 3.0;
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
    }
    long long v109 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      int v241 = 134283777;
      *(double *)uint64_t v242 = v26 * 57.2957795;
      *(_WORD *)&v242[8] = 2049;
      *(void *)&v242[10] = 0x402DFFFFFFFFFFFFLL;
      _os_log_impl(&dword_21B6E4000, v109, OS_LOG_TYPE_ERROR, "CLVLF,isValid,Invalid VL,VL-VIO pitchDiff,%{private}.3lf,pitchDiffThres,%{private}.3lf", (uint8_t *)&v241, 0x16u);
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A00);
      }
    }
    uint64_t v110 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v246 = 134349056;
      *(void *)&v246[4] = v182;
      long long v14 = v110;
      long long v15 = "CLVLF,initWithFrames,Invalid measurement,machAbsTime,%{public}.3lf";
LABEL_28:
      _os_log_impl(&dword_21B6E4000, v14, OS_LOG_TYPE_ERROR, v15, v246, 0xCu);
    }
LABEL_29:
    int v17 = 2;
LABEL_30:
    if (v17 != 2) {
      return;
    }
  }
  atomic_store(0, v147);
}

void sub_21B6F9A60(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_21B6E6194(a1);
}

void sub_21B6F9A74(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  long long v5 = sub_21B6EB144(a1, 3, a3[2]);
  uint64_t v6 = a3[2];
  if (v6)
  {
    uint64_t v7 = (const double *)a3[5];
    uint64_t v8 = a3[3];
    uint64_t __incY = v5[2];
    __Y = (double *)v5[3];
    if (v6 == 1)
    {
      cblas_dgemv(CblasColMajor, CblasNoTrans, 3, 3, 1.0, (const double *)(a2 + 8), 3, v7, v8, 0.0, __Y, __incY);
    }
    else
    {
      uint64_t v11 = a3[4];
      if (v8 == 1)
      {
        CBLAS_TRANSPOSE v12 = CblasNoTrans;
      }
      else
      {
        uint64_t v11 = a3[3];
        CBLAS_TRANSPOSE v12 = CblasTrans;
      }
      cblas_dgemm(CblasColMajor, CblasNoTrans, v12, 3, v6, 3, 1.0, (const double *)(a2 + 8), 3, v7, v11, 0.0, __Y, __incY);
    }
  }
}

void sub_21B6F9B48(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  long long v5 = sub_21B6EB144(a1, 3, a3[2]);
  uint64_t v6 = a3[2];
  if (v6)
  {
    uint64_t v7 = (const double *)a3[5];
    uint64_t v8 = a3[3];
    uint64_t __incY = v5[2];
    __Y = (double *)v5[3];
    if (v6 == 1)
    {
      cblas_dgemv(CblasColMajor, CblasNoTrans, 3, 6, 1.0, (const double *)(a2 + 8), 3, v7, v8, 0.0, __Y, __incY);
    }
    else
    {
      uint64_t v11 = a3[4];
      if (v8 == 1)
      {
        CBLAS_TRANSPOSE v12 = CblasNoTrans;
      }
      else
      {
        uint64_t v11 = a3[3];
        CBLAS_TRANSPOSE v12 = CblasTrans;
      }
      cblas_dgemm(CblasColMajor, CblasNoTrans, v12, 3, v6, 6, 1.0, (const double *)(a2 + 8), 3, v7, v11, 0.0, __Y, __incY);
    }
  }
}

void sub_21B6F9C1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = &unk_26CB86890;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(void *)(a1 + 152) = 0;
  *(_OWORD *)(a1 + 8) = 0u;
  cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, 3, 6, 6, 1.0, (const double *)(a2 + 8), 3, (const double *)(a3 + 8), 6, 0.0, (double *)(a1 + 8), 3);
}

double sub_21B6F9CCC(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  double v2 = *(double *)(a1 + 8);
  double v3 = *(double *)(a1 + 16);
  double v4 = *(double *)(a1 + 24);
  double v5 = *(double *)(a1 + 32);
  double v6 = *(double *)(a1 + 40);
  double v7 = *(double *)(a1 + 48);
  double v8 = *(double *)(a1 + 56);
  double v9 = *(double *)(a1 + 64);
  double v10 = *(double *)(a1 + 72);
  double v11 = v6 * v10 - v9 * v7;
  double v12 = v9 * v4 - v3 * v10;
  double v13 = v3 * v7 - v6 * v4;
  double v14 = v5 * v12 + v11 * v2 + v13 * v8;
  *(void *)a1 = &unk_26CB86850;
  *(double *)(a1 + 8) = v11 / v14;
  *(double *)(a1 + 16) = v12 / v14;
  *(double *)(a1 + 24) = v13 / v14;
  *(double *)(a1 + 32) = (v8 * v7 - v5 * v10) / v14;
  *(double *)(a1 + 40) = (v2 * v10 - v8 * v4) / v14;
  *(double *)(a1 + 48) = (v5 * v4 - v2 * v7) / v14;
  *(double *)(a1 + 56) = (v5 * v9 - v8 * v6) / v14;
  *(double *)(a1 + 64) = (v8 * v3 - v2 * v9) / v14;
  double result = (v2 * v6 - v5 * v3) / v14;
  *(double *)(a1 + 72) = result;
  return result;
}

void sub_21B6F9DB4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  double v5 = sub_21B6EB144(a1, *(void *)(a2 + 8), 1);
  if (*(void *)(a2 + 8))
  {
    uint64_t v6 = *(void *)(a2 + 24);
    if (v6 == 1) {
      CBLAS_TRANSPOSE v7 = CblasNoTrans;
    }
    else {
      CBLAS_TRANSPOSE v7 = CblasTrans;
    }
    if (v6 == 1) {
      int v8 = *(void *)(a2 + 8);
    }
    else {
      int v8 = 3;
    }
    if (v6 == 1) {
      int v9 = 3;
    }
    else {
      int v9 = *(void *)(a2 + 8);
    }
    if (v6 == 1) {
      int v10 = *(_DWORD *)(a2 + 32);
    }
    else {
      int v10 = *(void *)(a2 + 24);
    }
    cblas_dgemv(CblasColMajor, v7, v8, v9, 1.0, *(const double **)(a2 + 40), v10, (const double *)(a3 + 8), 1, 0.0, (double *)v5[3], v5[2]);
  }
}

void sub_21B6F9E44(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  double v5 = sub_21B6EB144(a1, *(void *)(a2 + 8), 3);
  uint64_t v6 = *(void *)(a2 + 8);
  if (v6)
  {
    uint64_t v7 = *(void *)(a2 + 24);
    if (v7 == 1) {
      CBLAS_TRANSPOSE v8 = CblasNoTrans;
    }
    else {
      CBLAS_TRANSPOSE v8 = CblasTrans;
    }
    if (v7 == 1) {
      int v9 = *(_DWORD *)(a2 + 32);
    }
    else {
      int v9 = *(void *)(a2 + 24);
    }
    cblas_dgemm(CblasColMajor, v8, CblasNoTrans, v6, 3, 3, 1.0, *(const double **)(a2 + 40), v9, (const double *)(a3 + 8), 3, 0.0, (double *)v5[3], v5[2]);
  }
}

void sub_21B6F9EE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = &unk_26CB86910;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 8) = 0u;
  cblas_dgemv(CblasColMajor, CblasNoTrans, 6, 3, 1.0, (const double *)(a2 + 8), 6, (const double *)(a3 + 8), 1, 0.0, (double *)(a1 + 8), 1);
}

void sub_21B6F9F6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = &unk_26CB86950;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(void *)(a1 + 296) = 0;
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t __C = a1 + 8;
  *(_OWORD *)(__C + 256) = 0u;
  *(_OWORD *)(__C + 272) = 0u;
  cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, 6, 6, 3, 1.0, (const double *)(a2 + 8), 6, (const double *)(a3 + 8), 3, 0.0, (double *)__C, 6);
}

BOOL sub_21B6FA03C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  double v3 = *(double *)(a2 + 40);
  double v4 = *(double *)(a1 + 40);
  long long v5 = *(_OWORD *)(a2 + 272);
  long long v12 = *(_OWORD *)(a2 + 256);
  long long v13 = v5;
  do
  {
    *(double *)&v11[v2 + 8] = *(double *)&v11[v2 + 8] - *(double *)(a1 + 256 + v2);
    v2 += 8;
  }
  while (v2 != 24);
  double v6 = *((double *)&v12 + 1) * *((double *)&v12 + 1) + *(double *)&v12 * *(double *)&v12;
  double v7 = vabdd_f64(v3, v4);
  double v8 = v7 * (v7 * 36.0);
  return v6 <= 0.0576 || v6 <= v8;
}

void sub_21B6FA0C4(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  long long v5 = sub_21B6EB144(a1, *a2, a3[2]);
  uint64_t v6 = *a2;
  if (*a2)
  {
    uint64_t v7 = a2[1];
    if (v7)
    {
      uint64_t v8 = a3[2];
      if (v8)
      {
        int v9 = (const double *)a2[3];
        int v10 = (const double *)a3[5];
        uint64_t v11 = a3[3];
        uint64_t __incY = v5[2];
        __Y = (double *)v5[3];
        if (v8 == 1)
        {
          cblas_dgemv(CblasColMajor, CblasNoTrans, v6, v7, 1.0, v9, a2[2], v10, v11, 0.0, __Y, __incY);
        }
        else
        {
          uint64_t v14 = a3[4];
          if (v7 == 1) {
            int v15 = *a2;
          }
          else {
            int v15 = a2[2];
          }
          if (v11 == 1)
          {
            CBLAS_TRANSPOSE v16 = CblasNoTrans;
          }
          else
          {
            uint64_t v14 = a3[3];
            CBLAS_TRANSPOSE v16 = CblasTrans;
          }
          cblas_dgemm(CblasColMajor, CblasNoTrans, v16, v6, v8, v7, 1.0, v9, v15, v10, v14, 0.0, __Y, __incY);
        }
      }
    }
  }
}

void sub_21B6FA1A8(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  long long v5 = sub_21B6EB144(a1, a2[1], a3[2]);
  uint64_t v6 = a2[1];
  if (v6)
  {
    uint64_t v7 = a2[2];
    if (v7)
    {
      uint64_t v8 = a3[2];
      if (v8)
      {
        uint64_t v10 = a2[4];
        int v9 = (const double *)a2[5];
        uint64_t v11 = a2[3];
        long long v12 = (const double *)a3[5];
        uint64_t v13 = a3[3];
        uint64_t __incY = v5[2];
        __Y = (double *)v5[3];
        if (v8 == 1)
        {
          if (v11 == 1) {
            CBLAS_TRANSPOSE v16 = CblasNoTrans;
          }
          else {
            CBLAS_TRANSPOSE v16 = CblasTrans;
          }
          if (v11 == 1) {
            int v17 = a2[1];
          }
          else {
            int v17 = a2[2];
          }
          if (v11 == 1)
          {
            LODWORD(v6) = a2[2];
            int v18 = a2[4];
          }
          else
          {
            int v18 = a2[3];
          }
          cblas_dgemv(CblasColMajor, v16, v17, v6, 1.0, v9, v18, v12, v13, 0.0, __Y, __incY);
        }
        else
        {
          if (v7 == 1) {
            LODWORD(v10) = a2[1];
          }
          if (v11 == 1) {
            CBLAS_TRANSPOSE v19 = CblasNoTrans;
          }
          else {
            CBLAS_TRANSPOSE v19 = CblasTrans;
          }
          if (v11 == 1) {
            LODWORD(v11) = v10;
          }
          if (v13 == 1) {
            uint64_t v20 = a3[4];
          }
          else {
            uint64_t v20 = a3[3];
          }
          if (v13 == 1) {
            CBLAS_TRANSPOSE v21 = CblasNoTrans;
          }
          else {
            CBLAS_TRANSPOSE v21 = CblasTrans;
          }
          cblas_dgemm(CblasColMajor, v19, v21, v6, v8, v7, 1.0, v9, v11, v12, v20, 0.0, __Y, __incY);
        }
      }
    }
  }
}

double sub_21B6FA2A0(uint64_t a1, void *a2)
{
  *(void *)a1 = &unk_26CB86850;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  uint64_t v3 = a2[4];
  uint64_t v2 = (double *)a2[5];
  uint64_t v4 = a2[3];
  uint64_t v5 = 8;
  uint64_t v6 = v2;
  do
  {
    *(double *)(a1 + v5) = sqrt(*v6);
    v5 += 32;
    v6 += v3 + v4;
  }
  while (v5 != 104);
  double v7 = *(double *)(a1 + 40);
  double v8 = *(double *)(a1 + 8);
  double v9 = v2[v4] / (v7 * v8);
  *(double *)(a1 + 16) = v9;
  double v10 = *(double *)(a1 + 72);
  double v11 = v2[2 * v4] / (v8 * v10);
  *(double *)(a1 + 24) = v11;
  double v12 = v2[2 * v4 + v3];
  *(double *)(a1 + 32) = v9;
  double result = v12 / (v7 * v10);
  *(double *)(a1 + 48) = result;
  *(double *)(a1 + 56) = v11;
  *(double *)(a1 + 64) = result;
  return result;
}

double sub_21B6FA358(uint64_t a1, double *a2)
{
  *(void *)a1 = &unk_26CB86850;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  for (uint64_t i = 1; i != 13; i += 4)
    *(double *)(a1 + i * 8) = a2[i] * a2[i];
  double v3 = a2[1];
  double v4 = a2[5];
  double v5 = a2[6];
  double result = a2[2] * v4 * v3;
  double v7 = a2[9];
  double v8 = v3 * (a2[3] * v7);
  *(double *)(a1 + 16) = result;
  *(double *)(a1 + 24) = v8;
  double v9 = v4 * (v7 * v5);
  *(double *)(a1 + 32) = result;
  *(double *)(a1 + 48) = v9;
  *(double *)(a1 + 56) = v8;
  *(double *)(a1 + 64) = v9;
  return result;
}

double sub_21B6FA3E4(uint64_t a1, double *a2)
{
  *(void *)a1 = &unk_26CB86850;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  for (uint64_t i = 1; i != 13; i += 4)
    *(double *)(a1 + i * 8) = sqrt(a2[i]);
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 8);
  double v5 = a2[2] / (v3 * v4);
  double v6 = *(double *)(a1 + 72);
  double v7 = a2[3] / (v4 * v6);
  *(double *)(a1 + 16) = v5;
  *(double *)(a1 + 24) = v7;
  double v8 = a2[6];
  *(double *)(a1 + 32) = v5;
  double result = v8 / (v3 * v6);
  *(double *)(a1 + 48) = result;
  *(double *)(a1 + 56) = v7;
  *(double *)(a1 + 64) = result;
  return result;
}

void *sub_21B6FA474(void *result, uint64_t a2, uint64_t a3)
{
  if (a2 != a3)
  {
    uint64_t v3 = a2;
    double v4 = result;
    uint64_t v5 = result[1];
    if (a3 != v5)
    {
      uint64_t v6 = 8 * ((a3 - a2) >> 3);
      do
      {
        long long v7 = *(_OWORD *)(v3 + v6);
        long long v8 = *(_OWORD *)(v3 + v6 + 16);
        long long v9 = *(_OWORD *)(v3 + v6 + 32);
        *(void *)(v3 + 48) = *(void *)(v3 + v6 + 48);
        *(_OWORD *)(v3 + 16) = v8;
        *(_OWORD *)(v3 + 32) = v9;
        *(_OWORD *)uint64_t v3 = v7;
        *(unsigned char *)(v3 + 56) = *(unsigned char *)(v3 + v6 + 56);
        uint64_t v10 = *(void *)(v3 + v6 + 104);
        long long v11 = *(_OWORD *)(v3 + v6 + 88);
        *(_OWORD *)(v3 + 72) = *(_OWORD *)(v3 + v6 + 72);
        *(_OWORD *)(v3 + 88) = v11;
        *(void *)(v3 + 104) = v10;
        *(_OWORD *)(v3 + 120) = *(_OWORD *)(v3 + v6 + 120);
        long long v12 = *(_OWORD *)(v3 + v6 + 136);
        long long v13 = *(_OWORD *)(v3 + v6 + 152);
        long long v14 = *(_OWORD *)(v3 + v6 + 168);
        *(_OWORD *)(v3 + 184) = *(_OWORD *)(v3 + v6 + 184);
        *(_OWORD *)(v3 + 168) = v14;
        *(_OWORD *)(v3 + 152) = v13;
        *(_OWORD *)(v3 + 136) = v12;
        long long v15 = *(_OWORD *)(v3 + v6 + 208);
        long long v16 = *(_OWORD *)(v3 + v6 + 224);
        *(void *)(v3 + 240) = *(void *)(v3 + v6 + 240);
        *(_OWORD *)(v3 + 208) = v15;
        *(_OWORD *)(v3 + 224) = v16;
        long long v17 = *(_OWORD *)(v3 + v6 + 272);
        *(_OWORD *)(v3 + 256) = *(_OWORD *)(v3 + v6 + 256);
        *(_OWORD *)(v3 + 272) = v17;
        memcpy((void *)(v3 + 296), (const void *)(v3 + v6 + 296), 0x129uLL);
        uint64_t v18 = *(void *)(v3 + v6 + 640);
        long long v19 = *(_OWORD *)(v3 + v6 + 624);
        *(_OWORD *)(v3 + 608) = *(_OWORD *)(v3 + v6 + 608);
        *(_OWORD *)(v3 + 624) = v19;
        *(void *)(v3 + 640) = v18;
        *(_OWORD *)(v3 + 656) = *(_OWORD *)(v3 + v6 + 656);
        long long v20 = *(_OWORD *)(v3 + v6 + 720);
        long long v22 = *(_OWORD *)(v3 + v6 + 672);
        long long v21 = *(_OWORD *)(v3 + v6 + 688);
        *(_OWORD *)(v3 + 704) = *(_OWORD *)(v3 + v6 + 704);
        *(_OWORD *)(v3 + 720) = v20;
        long long v23 = *(_OWORD *)(v3 + v6 + 744);
        long long v24 = *(_OWORD *)(v3 + v6 + 760);
        *(void *)(v3 + 776) = *(void *)(v3 + v6 + 776);
        *(_OWORD *)(v3 + 744) = v23;
        *(_OWORD *)(v3 + 760) = v24;
        long long v25 = *(_OWORD *)(v3 + v6 + 808);
        *(_OWORD *)(v3 + 792) = *(_OWORD *)(v3 + v6 + 792);
        *(_OWORD *)(v3 + 808) = v25;
        *(_OWORD *)(v3 + 672) = v22;
        *(_OWORD *)(v3 + 688) = v21;
        double result = memcpy((void *)(v3 + 832), (const void *)(v3 + v6 + 832), 0x128uLL);
        long long v26 = *(_OWORD *)(v3 + v6 + 1152);
        *(_OWORD *)(v3 + 1136) = *(_OWORD *)(v3 + v6 + 1136);
        *(_OWORD *)(v3 + 1152) = v26;
        *(_OWORD *)(v3 + 1176) = *(_OWORD *)(v3 + v6 + 1176);
        long long v27 = *(_OWORD *)(v3 + v6 + 1240);
        long long v29 = *(_OWORD *)(v3 + v6 + 1192);
        long long v28 = *(_OWORD *)(v3 + v6 + 1208);
        *(_OWORD *)(v3 + 1224) = *(_OWORD *)(v3 + v6 + 1224);
        *(_OWORD *)(v3 + 1240) = v27;
        *(_OWORD *)(v3 + 1192) = v29;
        *(_OWORD *)(v3 + 1208) = v28;
        *(unsigned char *)(v3 + 1256) = *(unsigned char *)(v3 + v6 + 1256);
        long long v30 = (_OWORD *)(v3 + 1272);
        *(_OWORD *)(v3 + 1312) = *(_OWORD *)(v3 + v6 + 1312);
        long long v31 = *(_OWORD *)(v3 + v6 + 1328);
        long long v32 = *(_OWORD *)(v3 + v6 + 1344);
        long long v33 = *(_OWORD *)(v3 + v6 + 1360);
        *(_OWORD *)(v3 + 1376) = *(_OWORD *)(v3 + v6 + 1376);
        *(_OWORD *)(v3 + 1360) = v33;
        long long v34 = *(_OWORD *)(v3 + v6 + 1272);
        long long v35 = *(_OWORD *)(v3 + v6 + 1288);
        *(_OWORD *)(v3 + 1344) = v32;
        *(_OWORD *)(v3 + 1328) = v31;
        long long v36 = *(_OWORD *)(v3 + v6 + 1392);
        long long v37 = *(_OWORD *)(v3 + v6 + 1408);
        *(unsigned char *)(v3 + 1424) = *(unsigned char *)(v3 + v6 + 1424);
        *(_OWORD *)(v3 + 1408) = v37;
        *(_OWORD *)(v3 + 1392) = v36;
        v3 += 1432;
        _OWORD *v30 = v34;
        v30[1] = v35;
      }
      while (v3 + v6 != v5);
    }
    v4[1] = v3;
  }
  return result;
}

void sub_21B6FA678(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_21B6EB144(a1, *(void *)(a2 + 8), 1);
  if (*(void *)(a2 + 8))
  {
    uint64_t v6 = *(void *)(a2 + 24);
    if (v6 == 1) {
      CBLAS_TRANSPOSE v7 = CblasNoTrans;
    }
    else {
      CBLAS_TRANSPOSE v7 = CblasTrans;
    }
    if (v6 == 1) {
      int v8 = *(void *)(a2 + 8);
    }
    else {
      int v8 = 2;
    }
    if (v6 == 1) {
      int v9 = 2;
    }
    else {
      int v9 = *(void *)(a2 + 8);
    }
    if (v6 == 1) {
      int v10 = *(_DWORD *)(a2 + 32);
    }
    else {
      int v10 = *(void *)(a2 + 24);
    }
    cblas_dgemv(CblasColMajor, v7, v8, v9, 1.0, *(const double **)(a2 + 40), v10, (const double *)(a3 + 8), 1, 0.0, (double *)v5[3], v5[2]);
  }
}

uint64_t sub_21B6FA710(uint64_t a1)
{
  *(_WORD *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 16) = &unk_26CB86970;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = &unk_26CB86850;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(void *)(a1 + 152) = &unk_26CB868B0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(void *)(a1 + 192) = 0;
  *(void *)(a1 + 200) = &unk_26CB86830;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(void *)(a1 + 240) = &unk_26CB86950;
  *(_OWORD *)(a1 + 560) = 0u;
  *(_OWORD *)(a1 + 576) = 0u;
  *(void *)(a1 + 592) = 0;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 440) = 0u;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_OWORD *)(a1 + 488) = 0u;
  *(_OWORD *)(a1 + 529) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 504) = 0u;
  *(_OWORD *)(a1 + 520) = 0u;
  *(void *)(a1 + 552) = &unk_26CB86970;
  *(void *)(a1 + 600) = &unk_26CB86850;
  *(_OWORD *)(a1 + 608) = 0u;
  *(_OWORD *)(a1 + 624) = 0u;
  *(_OWORD *)(a1 + 640) = 0u;
  *(_OWORD *)(a1 + 656) = 0u;
  *(_OWORD *)(a1 + 672) = 0u;
  *(void *)(a1 + 688) = &unk_26CB868B0;
  *(_OWORD *)(a1 + 696) = 0u;
  *(_OWORD *)(a1 + 712) = 0u;
  *(void *)(a1 + 728) = 0;
  *(void *)(a1 + 736) = &unk_26CB86830;
  *(_OWORD *)(a1 + 744) = 0u;
  *(_OWORD *)(a1 + 760) = 0u;
  *(void *)(a1 + 776) = &unk_26CB86950;
  *(_OWORD *)(a1 + 784) = 0u;
  *(_OWORD *)(a1 + 800) = 0u;
  *(_OWORD *)(a1 + 816) = 0u;
  *(_OWORD *)(a1 + 832) = 0u;
  *(_OWORD *)(a1 + 848) = 0u;
  *(_OWORD *)(a1 + 864) = 0u;
  *(_OWORD *)(a1 + 880) = 0u;
  *(_OWORD *)(a1 + 896) = 0u;
  *(_OWORD *)(a1 + 912) = 0u;
  *(_OWORD *)(a1 + 928) = 0u;
  *(_OWORD *)(a1 + 944) = 0u;
  *(_OWORD *)(a1 + 960) = 0u;
  *(_OWORD *)(a1 + 976) = 0u;
  *(_OWORD *)(a1 + 992) = 0u;
  *(_OWORD *)(a1 + 1008) = 0u;
  *(_OWORD *)(a1 + 1024) = 0u;
  *(_OWORD *)(a1 + 1040) = 0u;
  *(_OWORD *)(a1 + 1056) = 0u;
  *(void *)(a1 + 1072) = 0;
  *(void *)(a1 + 1080) = &unk_26CB86830;
  *(_OWORD *)(a1 + 1088) = 0u;
  *(_OWORD *)(a1 + 1104) = 0u;
  *(void *)(a1 + 1120) = &unk_26CB86830;
  *(_OWORD *)(a1 + 1128) = 0u;
  *(_OWORD *)(a1 + 1144) = 0u;
  sub_21B6EAB50(a1 + 1160);
  *(_DWORD *)(a1 + 1520) = 0;
  *(unsigned char *)(a1 + 1524) = 0;
  *(void *)(a1 + 1528) = 0xBFF0000000000000;
  *(void *)(a1 + 1536) = 0xBFF0000000000000;
  sub_21B6EAB50(a1 + 1544);
  sub_21B6EA464(a1 + 1904);
  return a1;
}

os_log_t sub_21B6FA9B0()
{
  os_log_t result = os_log_create("com.apple.locationd.Position", "Vision");
  qword_267C5A9E0 = (uint64_t)result;
  return result;
}

uint64_t sub_21B6FA9E0(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v4;
  sub_21B6EA294(a1 + 24, (uint64_t)a2 + 24);
  sub_21B6EA294(a1 + 560, (uint64_t)(a2 + 35));
  *(void *)(a1 + 1096) = &unk_26CB86830;
  long long v5 = a2[69];
  *(_OWORD *)(a1 + 1120) = a2[70];
  *(_OWORD *)(a1 + 1104) = v5;
  uint64_t v6 = *((void *)a2 + 142);
  *(unsigned char *)(a1 + 1144) = *((unsigned char *)a2 + 1144);
  *(void *)(a1 + 1136) = v6;
  *(void *)(a1 + 1152) = &unk_26CB86830;
  long long v7 = *(long long *)((char *)a2 + 1160);
  *(_OWORD *)(a1 + 1176) = *(long long *)((char *)a2 + 1176);
  *(_OWORD *)(a1 + 1160) = v7;
  sub_21B6EA294(a1 + 1192, (uint64_t)a2 + 1192);
  return a1;
}

uint64_t sub_21B6FAAAC(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  long long v5 = a2[1];
  long long v6 = a2[2];
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  *(_OWORD *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 32) = v6;
  *(_OWORD *)a1 = v4;
  sub_21B6EA294(a1 + 56, (uint64_t)a2 + 56);
  sub_21B6EA294(a1 + 592, (uint64_t)(a2 + 37));
  *(void *)(a1 + 1128) = &unk_26CB86830;
  long long v7 = a2[71];
  *(_OWORD *)(a1 + 1152) = a2[72];
  *(_OWORD *)(a1 + 1136) = v7;
  *(void *)(a1 + 1168) = &unk_26CB86850;
  *(_OWORD *)(a1 + 1176) = *(long long *)((char *)a2 + 1176);
  long long v8 = *(long long *)((char *)a2 + 1192);
  long long v9 = *(long long *)((char *)a2 + 1208);
  long long v10 = *(long long *)((char *)a2 + 1224);
  *(_OWORD *)(a1 + 1240) = *(long long *)((char *)a2 + 1240);
  *(_OWORD *)(a1 + 1224) = v10;
  *(_OWORD *)(a1 + 1208) = v9;
  *(_OWORD *)(a1 + 1192) = v8;
  *(unsigned char *)(a1 + 1256) = *((unsigned char *)a2 + 1256);
  *(void *)(a1 + 1264) = &unk_26CB86830;
  long long v11 = *(long long *)((char *)a2 + 1272);
  *(_OWORD *)(a1 + 1288) = *(long long *)((char *)a2 + 1288);
  *(_OWORD *)(a1 + 1272) = v11;
  *(void *)(a1 + 1304) = &unk_26CB86850;
  *(_OWORD *)(a1 + 1312) = a2[82];
  long long v12 = a2[83];
  long long v13 = a2[84];
  long long v14 = a2[85];
  *(_OWORD *)(a1 + 1376) = a2[86];
  *(_OWORD *)(a1 + 1360) = v14;
  *(_OWORD *)(a1 + 1344) = v13;
  *(_OWORD *)(a1 + 1328) = v12;
  long long v15 = a2[87];
  long long v16 = a2[88];
  *(unsigned char *)(a1 + 1424) = *((unsigned char *)a2 + 1424);
  *(_OWORD *)(a1 + 1408) = v16;
  *(_OWORD *)(a1 + 1392) = v15;
  return a1;
}

void sub_21B6FAC18()
{
}

void sub_21B6FAC2C()
{
}

void sub_21B6FAC40()
{
}

void sub_21B6FAC54()
{
}

uint64_t sub_21B6FAC68(uint64_t *a1, void *a2)
{
  long long v5 = (long long *)*a1;
  long long v4 = (long long *)a1[1];
  uint64_t result = a2[1];
  while (v4 != v5)
  {
    long long v4 = (long long *)((char *)v4 - 1432);
    uint64_t result = sub_21B6FAAAC(result - 1432, v4);
  }
  a2[1] = result;
  uint64_t v7 = *a1;
  *a1 = result;
  a2[1] = v7;
  uint64_t v8 = a1[1];
  a1[1] = a2[2];
  a2[2] = v8;
  uint64_t v9 = a1[2];
  a1[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

uint64_t *sub_21B6FACF0(uint64_t *result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *result;
  uint64_t v5 = result[1];
  uint64_t v6 = a2[1];
  if (v5 == *result)
  {
    uint64_t v7 = a2[1];
  }
  else
  {
    do
    {
      uint64_t v7 = v6 - 3160;
      sub_21B6FA9E0(v6 - 3160, (long long *)(v5 - 3160));
      uint64_t result = (uint64_t *)sub_21B6FAAAC(v6 - 1432, (long long *)(v5 - 1432));
      v5 -= 3160;
      v6 -= 3160;
    }
    while (v5 != v4);
  }
  a2[1] = v7;
  uint64_t v8 = *v3;
  uint64_t *v3 = v7;
  a2[1] = v8;
  uint64_t v9 = v3[1];
  v3[1] = a2[2];
  a2[2] = v9;
  uint64_t v10 = v3[2];
  v3[2] = a2[3];
  a2[3] = v10;
  *a2 = a2[1];
  return result;
}

uint64_t *sub_21B6FADAC(uint64_t *result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *result;
  uint64_t v5 = result[1];
  uint64_t v6 = a2[1];
  if (v5 == *result)
  {
    uint64_t v7 = a2[1];
  }
  else
  {
    do
    {
      uint64_t v7 = v6 - 1792;
      sub_21B6EAC40(v6 - 1792, v5 - 1792);
      uint64_t result = (uint64_t *)sub_21B6FAAAC(v6 - 1432, (long long *)(v5 - 1432));
      v5 -= 1792;
      v6 -= 1792;
    }
    while (v5 != v4);
  }
  a2[1] = v7;
  uint64_t v8 = *v3;
  uint64_t *v3 = v7;
  a2[1] = v8;
  uint64_t v9 = v3[1];
  v3[1] = a2[2];
  a2[2] = v9;
  uint64_t v10 = v3[2];
  v3[2] = a2[3];
  a2[3] = v10;
  *a2 = a2[1];
  return result;
}

uint64_t *sub_21B6FAE68(uint64_t *result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v5 = *result;
  uint64_t v4 = result[1];
  uint64_t v6 = a2[1];
  if (v4 != *result)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = v6 + v7;
      *(_WORD *)(v6 + v7 - 3336) = *(_WORD *)(v4 + v7 - 3336);
      sub_21B6EA294(v6 + v7 - 3328, v4 + v7 - 3328);
      sub_21B6EA294(v6 + v7 - 2792, v4 + v7 - 2792);
      *(void *)(v8 - 2256) = &unk_26CB86830;
      uint64_t v9 = (_OWORD *)(v6 + v7 - 2248);
      long long v10 = *(_OWORD *)(v4 + v7 - 2232);
      *uint64_t v9 = *(_OWORD *)(v4 + v7 - 2248);
      v9[1] = v10;
      *(void *)(v8 - 2216) = &unk_26CB86830;
      long long v11 = (_OWORD *)(v6 + v7 - 2208);
      long long v12 = *(_OWORD *)(v4 + v7 - 2192);
      *long long v11 = *(_OWORD *)(v4 + v7 - 2208);
      v11[1] = v12;
      sub_21B6EAC40(v6 + v7 - 2176, v4 + v7 - 2176);
      uint64_t v13 = v6 + v7 - 1816;
      long long v14 = *(_OWORD *)(v4 + v7 - 1816);
      *(void *)(v13 + 16) = *(void *)(v4 + v7 - 1800);
      *(_OWORD *)uint64_t v13 = v14;
      sub_21B6EAC40(v6 + v7 - 1792, v4 + v7 - 1792);
      uint64_t result = (uint64_t *)sub_21B6FAAAC(v6 + v7 - 1432, (long long *)(v4 + v7 - 1432));
      v7 -= 3336;
    }
    while (v4 + v7 != v5);
    v6 += v7;
  }
  a2[1] = v6;
  uint64_t v15 = *v3;
  uint64_t *v3 = v6;
  a2[1] = v15;
  uint64_t v16 = v3[1];
  v3[1] = a2[2];
  a2[2] = v16;
  uint64_t v17 = v3[2];
  v3[2] = a2[3];
  a2[3] = v17;
  *a2 = a2[1];
  return result;
}

void sub_21B6FAFD0(uint64_t a1, const double *__B)
{
  vDSP_Stride v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(double **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 24);
  if (v5 == 1)
  {
    vDSP_Length v6 = *(void *)(a1 + 8);
    uint64_t v7 = *(void *)(a1 + 16);
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      if (v6 == v4)
      {
        vDSP_vsmulD(*(const double **)(a1 + 40), 1, __B, v3, 1, v7 * v4);
      }
      else
      {
        uint64_t v12 = 8 * v4;
        do
        {
          vDSP_vsmulD(v3, 1, __B, v3, 1, v6);
          uint64_t v3 = (double *)((char *)v3 + v12);
          --v7;
        }
        while (v7);
      }
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 8);
    vDSP_Length v9 = *(void *)(a1 + 16);
    if (v9) {
      BOOL v11 = v10 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      if (v9 == v5)
      {
        vDSP_vsmulD(*(const double **)(a1 + 40), 1, __B, v3, 1, v10 * v5);
      }
      else if (v4 == 1 || v10 == 1)
      {
        uint64_t v14 = 8 * v5;
        do
        {
          vDSP_vsmulD(v3, v4, __B, v3, 1, v9);
          uint64_t v3 = (double *)((char *)v3 + v14);
          --v10;
        }
        while (v10);
      }
      else
      {
        uint64_t v15 = 0;
        uint64_t v16 = 8 * v5;
        do
        {
          uint64_t v17 = v3;
          uint64_t v18 = v3;
          vDSP_Length v19 = v9;
          do
          {
            *v18++ = *v17 * *__B;
            v17 += v4;
            --v19;
          }
          while (v19);
          ++v15;
          uint64_t v3 = (double *)((char *)v3 + v16);
        }
        while (v15 != v10);
      }
    }
  }
}

uint64_t sub_21B6FB140(long long *a1, long long *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = a1;
    do
    {
      sub_21B6FB198(a3, v5);
      uint64_t v5 = (long long *)((char *)v5 + 3160);
      a3 += 3160;
    }
    while (v5 != a2);
  }
  return a3;
}

uint64_t sub_21B6FB198(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v4;
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  long long v5 = *(long long *)((char *)a2 + 40);
  long long v6 = *(long long *)((char *)a2 + 56);
  *(void *)(a1 + 72) = *((void *)a2 + 9);
  *(_OWORD *)(a1 + 56) = v6;
  *(_OWORD *)(a1 + 40) = v5;
  long long v7 = *(long long *)((char *)a2 + 120);
  long long v8 = *(long long *)((char *)a2 + 136);
  long long v9 = *(long long *)((char *)a2 + 152);
  *(_OWORD *)(a1 + 104) = *(long long *)((char *)a2 + 104);
  *(_OWORD *)(a1 + 152) = v9;
  *(_OWORD *)(a1 + 136) = v8;
  *(_OWORD *)(a1 + 120) = v7;
  *(_OWORD *)(a1 + 88) = *(long long *)((char *)a2 + 88);
  long long v10 = a2[11];
  long long v11 = a2[12];
  *(void *)(a1 + 208) = *((void *)a2 + 26);
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 192) = v11;
  long long v12 = a2[15];
  *(_OWORD *)(a1 + 224) = a2[14];
  *(_OWORD *)(a1 + 240) = v12;
  memcpy((void *)(a1 + 264), (char *)a2 + 264, 0x128uLL);
  *(unsigned char *)(a1 + 560) = *((unsigned char *)a2 + 560);
  long long v14 = a2[36];
  long long v13 = a2[37];
  *(void *)(a1 + 608) = *((void *)a2 + 76);
  *(_OWORD *)(a1 + 576) = v14;
  *(_OWORD *)(a1 + 592) = v13;
  long long v16 = a2[40];
  long long v15 = a2[41];
  long long v17 = a2[43];
  *(_OWORD *)(a1 + 672) = a2[42];
  *(_OWORD *)(a1 + 688) = v17;
  *(_OWORD *)(a1 + 640) = v16;
  *(_OWORD *)(a1 + 656) = v15;
  *(_OWORD *)(a1 + 624) = a2[39];
  long long v18 = *(long long *)((char *)a2 + 712);
  long long v19 = *(long long *)((char *)a2 + 728);
  *(void *)(a1 + 744) = *((void *)a2 + 93);
  *(_OWORD *)(a1 + 728) = v19;
  *(_OWORD *)(a1 + 712) = v18;
  long long v20 = *(long long *)((char *)a2 + 760);
  *(_OWORD *)(a1 + 776) = *(long long *)((char *)a2 + 776);
  *(_OWORD *)(a1 + 760) = v20;
  memcpy((void *)(a1 + 800), a2 + 50, 0x128uLL);
  long long v21 = a2[69];
  *(_OWORD *)(a1 + 1120) = a2[70];
  *(_OWORD *)(a1 + 1104) = v21;
  char v22 = *((unsigned char *)a2 + 1144);
  *(void *)(a1 + 1136) = *((void *)a2 + 142);
  *(unsigned char *)(a1 + 1144) = v22;
  long long v23 = *(long long *)((char *)a2 + 1176);
  *(_OWORD *)(a1 + 1160) = *(long long *)((char *)a2 + 1160);
  *(_OWORD *)(a1 + 1176) = v23;
  *(unsigned char *)(a1 + 1192) = *((unsigned char *)a2 + 1192);
  long long v25 = *(long long *)((char *)a2 + 1208);
  long long v24 = *(long long *)((char *)a2 + 1224);
  *(void *)(a1 + 1240) = *((void *)a2 + 155);
  *(_OWORD *)(a1 + 1208) = v25;
  *(_OWORD *)(a1 + 1224) = v24;
  long long v27 = *(long long *)((char *)a2 + 1272);
  long long v26 = *(long long *)((char *)a2 + 1288);
  long long v28 = *(long long *)((char *)a2 + 1320);
  *(_OWORD *)(a1 + 1304) = *(long long *)((char *)a2 + 1304);
  *(_OWORD *)(a1 + 1320) = v28;
  *(_OWORD *)(a1 + 1272) = v27;
  *(_OWORD *)(a1 + 1288) = v26;
  *(_OWORD *)(a1 + 1256) = *(long long *)((char *)a2 + 1256);
  long long v29 = a2[84];
  long long v30 = a2[85];
  *(void *)(a1 + 1376) = *((void *)a2 + 172);
  *(_OWORD *)(a1 + 1360) = v30;
  *(_OWORD *)(a1 + 1344) = v29;
  long long v31 = a2[87];
  *(_OWORD *)(a1 + 1408) = a2[88];
  *(_OWORD *)(a1 + 1392) = v31;
  memcpy((void *)(a1 + 1432), (char *)a2 + 1432, 0x128uLL);
  long long v32 = a2[109];
  long long v33 = a2[110];
  uint64_t v34 = *((void *)a2 + 222);
  *(_OWORD *)(a1 + 1728) = a2[108];
  *(void *)(a1 + 1776) = v34;
  *(_OWORD *)(a1 + 1760) = v33;
  *(_OWORD *)(a1 + 1744) = v32;
  *(unsigned char *)(a1 + 1784) = *((unsigned char *)a2 + 1784);
  long long v35 = *(long long *)((char *)a2 + 1816);
  long long v36 = *(long long *)((char *)a2 + 1800);
  *(void *)(a1 + 1832) = *((void *)a2 + 229);
  *(_OWORD *)(a1 + 1800) = v36;
  *(_OWORD *)(a1 + 1816) = v35;
  long long v37 = *(long long *)((char *)a2 + 1880);
  long long v38 = *(long long *)((char *)a2 + 1896);
  long long v39 = *(long long *)((char *)a2 + 1864);
  *(_OWORD *)(a1 + 1912) = *(long long *)((char *)a2 + 1912);
  *(_OWORD *)(a1 + 1864) = v39;
  *(_OWORD *)(a1 + 1896) = v38;
  *(_OWORD *)(a1 + 1880) = v37;
  *(_OWORD *)(a1 + 1848) = *(long long *)((char *)a2 + 1848);
  long long v40 = a2[121];
  long long v41 = a2[122];
  *(void *)(a1 + 1968) = *((void *)a2 + 246);
  *(_OWORD *)(a1 + 1952) = v41;
  *(_OWORD *)(a1 + 1936) = v40;
  long long v42 = a2[124];
  *(_OWORD *)(a1 + 2000) = a2[125];
  *(_OWORD *)(a1 + 1984) = v42;
  memcpy((void *)(a1 + 2024), (char *)a2 + 2024, 0x129uLL);
  long long v43 = a2[147];
  long long v44 = a2[146];
  *(void *)(a1 + 2368) = *((void *)a2 + 296);
  *(_OWORD *)(a1 + 2336) = v44;
  *(_OWORD *)(a1 + 2352) = v43;
  long long v45 = a2[151];
  long long v46 = a2[152];
  long long v47 = a2[150];
  *(_OWORD *)(a1 + 2448) = a2[153];
  *(_OWORD *)(a1 + 2400) = v47;
  *(_OWORD *)(a1 + 2432) = v46;
  *(_OWORD *)(a1 + 2416) = v45;
  *(_OWORD *)(a1 + 2384) = a2[149];
  long long v48 = *(long long *)((char *)a2 + 2472);
  long long v49 = *(long long *)((char *)a2 + 2488);
  *(void *)(a1 + 2504) = *((void *)a2 + 313);
  *(_OWORD *)(a1 + 2488) = v49;
  *(_OWORD *)(a1 + 2472) = v48;
  long long v50 = *(long long *)((char *)a2 + 2520);
  *(_OWORD *)(a1 + 2536) = *(long long *)((char *)a2 + 2536);
  *(_OWORD *)(a1 + 2520) = v50;
  memcpy((void *)(a1 + 2560), a2 + 160, 0x128uLL);
  long long v51 = a2[179];
  *(_OWORD *)(a1 + 2880) = a2[180];
  *(_OWORD *)(a1 + 2864) = v51;
  *(_OWORD *)(a1 + 2904) = *(long long *)((char *)a2 + 2904);
  long long v52 = *(long long *)((char *)a2 + 2936);
  long long v53 = *(long long *)((char *)a2 + 2952);
  long long v54 = *(long long *)((char *)a2 + 2968);
  *(_OWORD *)(a1 + 2920) = *(long long *)((char *)a2 + 2920);
  *(_OWORD *)(a1 + 2968) = v54;
  *(_OWORD *)(a1 + 2952) = v53;
  *(_OWORD *)(a1 + 2936) = v52;
  *(unsigned char *)(a1 + 2984) = *((unsigned char *)a2 + 2984);
  long long v55 = *(long long *)((char *)a2 + 3000);
  *(_OWORD *)(a1 + 3016) = *(long long *)((char *)a2 + 3016);
  *(_OWORD *)(a1 + 3000) = v55;
  *(_OWORD *)(a1 + 3040) = a2[190];
  long long v56 = a2[192];
  long long v57 = a2[193];
  long long v58 = a2[194];
  *(_OWORD *)(a1 + 3056) = a2[191];
  *(_OWORD *)(a1 + 3104) = v58;
  *(_OWORD *)(a1 + 3088) = v57;
  *(_OWORD *)(a1 + 3072) = v56;
  long long v59 = a2[195];
  long long v60 = a2[196];
  *(unsigned char *)(a1 + 3152) = *((unsigned char *)a2 + 3152);
  *(_OWORD *)(a1 + 3136) = v60;
  *(_OWORD *)(a1 + 3120) = v59;
  return a1;
}

uint64_t sub_21B6FB528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = a1;
    do
    {
      sub_21B6F850C(a3, v5);
      v5 += 3336;
      a3 += 3336;
    }
    while (v5 != a2);
  }
  return a3;
}

uint64_t sub_21B6FB580(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = 0x13A524387AC82261 * ((a1[1] - *a1) >> 3);
  unint64_t v3 = v2 + 1;
  if ((unint64_t)(v2 + 1) > 0x13A524387AC822) {
    sub_21B6EB24C();
  }
  if (0x274A4870F59044C2 * ((a1[2] - *a1) >> 3) > v3) {
    unint64_t v3 = 0x274A4870F59044C2 * ((a1[2] - *a1) >> 3);
  }
  if ((unint64_t)(0x13A524387AC82261 * ((a1[2] - *a1) >> 3)) >= 0x9D2921C3D6411) {
    unint64_t v6 = 0x13A524387AC822;
  }
  else {
    unint64_t v6 = v3;
  }
  long long v14 = a1 + 2;
  if (v6)
  {
    if (v6 > 0x13A524387AC822) {
      sub_21B6EAD8C();
    }
    long long v7 = (char *)operator new(3336 * v6);
  }
  else
  {
    long long v7 = 0;
  }
  __p = v7;
  long long v11 = &v7[3336 * v2];
  long long v13 = &v7[3336 * v6];
  sub_21B6FB69C((uint64_t)v11, a2);
  long long v12 = v11 + 3336;
  sub_21B6FAE68(a1, &__p);
  uint64_t v8 = a1[1];
  if (__p) {
    operator delete(__p);
  }
  return v8;
}

uint64_t sub_21B6FB69C(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  sub_21B6EA294(a1 + 8, a2 + 8);
  sub_21B6EA294(a1 + 544, a2 + 544);
  *(void *)(a1 + 1080) = &unk_26CB86830;
  long long v4 = *(_OWORD *)(a2 + 1088);
  *(_OWORD *)(a1 + 1104) = *(_OWORD *)(a2 + 1104);
  *(_OWORD *)(a1 + 1088) = v4;
  *(void *)(a1 + 1120) = &unk_26CB86830;
  long long v5 = *(_OWORD *)(a2 + 1128);
  *(_OWORD *)(a1 + 1144) = *(_OWORD *)(a2 + 1144);
  *(_OWORD *)(a1 + 1128) = v5;
  sub_21B6EAC40(a1 + 1160, a2 + 1160);
  long long v6 = *(_OWORD *)(a2 + 1520);
  *(void *)(a1 + 1536) = *(void *)(a2 + 1536);
  *(_OWORD *)(a1 + 1520) = v6;
  sub_21B6EAC40(a1 + 1544, a2 + 1544);
  long long v7 = *(_OWORD *)(a2 + 1904);
  long long v8 = *(_OWORD *)(a2 + 1920);
  long long v9 = *(_OWORD *)(a2 + 1936);
  *(void *)(a1 + 1952) = *(void *)(a2 + 1952);
  *(_OWORD *)(a1 + 1936) = v9;
  *(_OWORD *)(a1 + 1920) = v8;
  *(_OWORD *)(a1 + 1904) = v7;
  sub_21B6EA294(a1 + 1960, a2 + 1960);
  sub_21B6EA294(a1 + 2496, a2 + 2496);
  *(void *)(a1 + 3032) = &unk_26CB86830;
  long long v10 = *(_OWORD *)(a2 + 3040);
  *(_OWORD *)(a1 + 3056) = *(_OWORD *)(a2 + 3056);
  *(_OWORD *)(a1 + 3040) = v10;
  *(void *)(a1 + 3072) = &unk_26CB86850;
  *(_OWORD *)(a1 + 3080) = *(_OWORD *)(a2 + 3080);
  long long v11 = *(_OWORD *)(a2 + 3096);
  long long v12 = *(_OWORD *)(a2 + 3112);
  long long v13 = *(_OWORD *)(a2 + 3128);
  *(_OWORD *)(a1 + 3144) = *(_OWORD *)(a2 + 3144);
  *(_OWORD *)(a1 + 3128) = v13;
  *(_OWORD *)(a1 + 3112) = v12;
  *(_OWORD *)(a1 + 3096) = v11;
  *(unsigned char *)(a1 + 3160) = *(unsigned char *)(a2 + 3160);
  *(void *)(a1 + 3168) = &unk_26CB86830;
  long long v14 = *(_OWORD *)(a2 + 3176);
  *(_OWORD *)(a1 + 3192) = *(_OWORD *)(a2 + 3192);
  *(_OWORD *)(a1 + 3176) = v14;
  *(void *)(a1 + 3208) = &unk_26CB86850;
  *(_OWORD *)(a1 + 3216) = *(_OWORD *)(a2 + 3216);
  long long v15 = *(_OWORD *)(a2 + 3232);
  long long v16 = *(_OWORD *)(a2 + 3248);
  long long v17 = *(_OWORD *)(a2 + 3264);
  *(_OWORD *)(a1 + 3280) = *(_OWORD *)(a2 + 3280);
  *(_OWORD *)(a1 + 3264) = v17;
  *(_OWORD *)(a1 + 3248) = v16;
  *(_OWORD *)(a1 + 3232) = v15;
  long long v18 = *(_OWORD *)(a2 + 3296);
  long long v19 = *(_OWORD *)(a2 + 3312);
  *(unsigned char *)(a1 + 3328) = *(unsigned char *)(a2 + 3328);
  *(_OWORD *)(a1 + 3312) = v19;
  *(_OWORD *)(a1 + 3296) = v18;
  return a1;
}

uint64_t sub_21B6FB8B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = a1;
    do
    {
      sub_21B6F7D88(a3, v5);
      v5 += 1792;
      a3 += 1792;
    }
    while (v5 != a2);
  }
  return a3;
}

void sub_21B6FB910(uint64_t a1, const double *__B)
{
  vDSP_Stride v4 = *(void *)(a1 + 32);
  unint64_t v3 = *(double **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 24);
  if (v5 == 1)
  {
    vDSP_Length v6 = *(void *)(a1 + 8);
    uint64_t v7 = *(void *)(a1 + 16);
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      if (v6 == v4)
      {
        vDSP_vsaddD(*(const double **)(a1 + 40), 1, __B, v3, 1, v7 * v4);
      }
      else
      {
        uint64_t v12 = 8 * v4;
        do
        {
          vDSP_vsaddD(v3, 1, __B, v3, 1, v6);
          unint64_t v3 = (double *)((char *)v3 + v12);
          --v7;
        }
        while (v7);
      }
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 8);
    vDSP_Length v9 = *(void *)(a1 + 16);
    if (v9) {
      BOOL v11 = v10 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      if (v9 == v5)
      {
        vDSP_vsaddD(*(const double **)(a1 + 40), 1, __B, v3, 1, v10 * v5);
      }
      else if (v4 == 1 || v10 == 1)
      {
        uint64_t v14 = 8 * v5;
        do
        {
          vDSP_vsaddD(v3, v4, __B, v3, 1, v9);
          unint64_t v3 = (double *)((char *)v3 + v14);
          --v10;
        }
        while (v10);
      }
      else
      {
        uint64_t v15 = 0;
        uint64_t v16 = 8 * v5;
        do
        {
          long long v17 = v3;
          long long v18 = v3;
          vDSP_Length v19 = v9;
          do
          {
            *v18++ = *v17 + *__B;
            v17 += v4;
            --v19;
          }
          while (v19);
          ++v15;
          unint64_t v3 = (double *)((char *)v3 + v16);
        }
        while (v15 != v10);
      }
    }
  }
}

void sub_21B6FBA80(uint64_t a1, uint64_t a2)
{
}

double sub_21B6FBAB8(double *a1, double *a2)
{
  double v3 = *a1;
  double v2 = a1[1];
  double result = v2 * v2;
  double v5 = a1[2];
  double v6 = a1[3];
  double v7 = sqrt(v2 * v2 + v3 * v3 + v5 * v5 + v6 * v6);
  if (v7 == 0.0)
  {
    *a2 = 1.0;
    a2[1] = 0.0;
    a2[2] = 0.0;
    a2[3] = 0.0;
    a2[4] = 1.0;
    a2[5] = 0.0;
    a2[6] = 0.0;
    a2[7] = 0.0;
    a2[8] = 1.0;
  }
  else
  {
    if (v7 == 1.0)
    {
      double v25 = v3 * v3;
      double v26 = v3 * v2;
      double v27 = v3 * v5;
      double v28 = v3 * v6;
      double v29 = v2 * v5;
      double v30 = v2 * v6;
      double v31 = v5 * v5;
      double v32 = v5 * v6;
      double v21 = v6 * v6;
      double v33 = v26 + v26;
      *a2 = v25 - result - v31 + v21;
      a2[1] = v33 - v32 - v32;
      double v34 = v27 + v27;
      a2[2] = v30 + v34 + v30;
      a2[3] = v32 + v33 + v32;
      a2[4] = result - v25 - v31 + v21;
      a2[5] = v29 + v29 - v28 - v28;
      a2[6] = v34 - v30 - v30;
      a2[7] = v28 + v29 + v29 + v28;
      double v24 = v31 - v25 - result;
    }
    else
    {
      double v8 = v3 / v7;
      double v9 = v2 / v7;
      double v10 = v5 / v7;
      double v11 = v6 / v7;
      double v12 = v8 * v8;
      double v13 = v8 * v9;
      double v14 = v8 * v10;
      double v15 = v8 * v11;
      double v16 = v9 * v9;
      double v17 = v9 * v10;
      double v18 = v9 * v11;
      double v19 = v10 * v10;
      double v20 = v10 * v11;
      double v21 = v11 * v11;
      double v22 = v13 + v13;
      *a2 = v21 + v12 - v16 - v19;
      a2[1] = v22 - v20 - v20;
      double v23 = v14 + v14;
      a2[2] = v18 + v18 + v23;
      a2[3] = v20 + v20 + v22;
      a2[4] = v21 + v16 - v12 - v19;
      a2[5] = v17 + v17 - v15 - v15;
      a2[6] = v23 - v18 - v18;
      a2[7] = v15 + v15 + v17 + v17;
      double v24 = v19 - v12 - v16;
    }
    double result = v21 + v24;
    a2[8] = result;
  }
  return result;
}

BOOL sub_21B6FBC48(unsigned int a1)
{
  if (a1 >= 0x2AC)
  {
    if (qword_267C5A9E8 != -1) {
      dispatch_once(&qword_267C5A9E8, &unk_26CB86A20);
    }
    double v2 = qword_267C5A9F0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9F0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)vDSP_Stride v4 = 0;
      _os_log_impl(&dword_21B6E4000, v2, OS_LOG_TYPE_FAULT, "Bad index into kkDefenseMappingAgencyTenByTenGeoid.", v4, 2u);
    }
  }
  return a1 < 0x2AC;
}

BOOL sub_21B6FBCE8(float *a1, double a2, double a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  *a1 = 0.0;
  if (a2 < -90.0 || a2 > 90.0)
  {
    if (qword_267C5A9E8 != -1) {
      dispatch_once(&qword_267C5A9E8, &unk_26CB86A20);
    }
    uint64_t v15 = qword_267C5A9F0;
    BOOL v16 = os_log_type_enabled((os_log_t)qword_267C5A9F0, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v16)
    {
      *(_DWORD *)buf = 134217984;
      double v29 = a2;
      double v14 = "#Warning Input latitude = %.9lf is out of possible range";
      double v17 = v15;
      os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
LABEL_32:
      _os_log_impl(&dword_21B6E4000, v17, v18, v14, buf, 0xCu);
      return 0;
    }
  }
  else
  {
    double v5 = a3;
    if (a3 < -180.0)
    {
      unsigned int v6 = 0;
      do
        double v5 = v5 + 360.0;
      while (v5 < -180.0 && v6++ < 3);
    }
    if (v5 >= 180.0)
    {
      unsigned int v8 = 0;
      do
        double v5 = v5 + -360.0;
      while (v5 >= 180.0 && v8++ < 3);
    }
    float v10 = (v5 + 180.0) / 10.0;
    int v11 = vcvtms_s32_f32(v10);
    if (v11 < 0x24)
    {
      float v19 = (90.0 - a2) / 10.0;
      int v20 = vcvtms_s32_f32(v19);
      if (v20 < 0x13)
      {
        if (v11 == 35) {
          uint64_t v21 = 0;
        }
        else {
          uint64_t v21 = (v11 + 1);
        }
        int v22 = v20 + 1;
        if (v20 == 18)
        {
          *a1 = -30.0;
        }
        else
        {
          uint64_t v23 = (36 * v20);
          BOOL result = sub_21B6FBC48(v23 + v11);
          if (!result) {
            return result;
          }
          char v24 = byte_21B701FE8[v23 + v11];
          uint64_t v25 = (36 * v22);
          BOOL result = sub_21B6FBC48(v25 + v11);
          if (!result) {
            return result;
          }
          char v27 = byte_21B701FE8[v25 + v11];
          BOOL result = sub_21B6FBC48(v21 + v23);
          if (!result) {
            return result;
          }
          char v26 = byte_21B701FE8[v21 + v23];
          BOOL result = sub_21B6FBC48(v21 + v25);
          if (!result) {
            return result;
          }
          *a1 = (float)((float)((float)((float)((float)((float)v22 - v19)
                                              * (float)((float)(v10 - (float)v11) * (float)v26))
                                      + (float)((float)((float)((float)(int)v21 - v10) * (float)v24)
                                              * (float)((float)v22 - v19)))
                              + (float)((float)((float)((float)(int)v21 - v10) * (float)v27) * (float)(v19 - (float)v20)))
                      + (float)((float)((float)(v10 - (float)v11) * (float)byte_21B701FE8[v21 + v25])
                              * (float)(v19 - (float)v20)))
              / (float)((float)((float)v22 - (float)v20) * (float)((float)(int)v21 - (float)v11));
        }
        return 1;
      }
      if (qword_267C5A9E8 != -1) {
        dispatch_once(&qword_267C5A9E8, &unk_26CB86A20);
      }
      uint64_t v12 = qword_267C5A9F0;
      BOOL result = os_log_type_enabled((os_log_t)qword_267C5A9F0, OS_LOG_TYPE_FAULT);
      if (result)
      {
        *(_DWORD *)buf = 134217984;
        double v29 = a2;
        double v14 = "latitude %.9lf is not valid.";
        goto LABEL_31;
      }
    }
    else
    {
      if (qword_267C5A9E8 != -1) {
        dispatch_once(&qword_267C5A9E8, &unk_26CB86A20);
      }
      uint64_t v12 = qword_267C5A9F0;
      BOOL result = os_log_type_enabled((os_log_t)qword_267C5A9F0, OS_LOG_TYPE_FAULT);
      if (result)
      {
        *(_DWORD *)buf = 134217984;
        double v29 = v5;
        double v14 = "longitude %.9lf is not valid.";
LABEL_31:
        double v17 = v12;
        os_log_type_t v18 = OS_LOG_TYPE_FAULT;
        goto LABEL_32;
      }
    }
  }
  return result;
}

os_log_t sub_21B6FC08C()
{
  os_log_t result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_267C5A9F0 = (uint64_t)result;
  return result;
}

long double sub_21B6FC0BC(double a1, double a2, double a3, double a4)
{
  double v4 = a3;
  long double result = 0.0;
  if (a3 > 90.0 || a1 < -90.0 || a1 > 90.0 || a3 < -90.0) {
    return result;
  }
  double v7 = a4 + 360.0;
  if (a4 >= 0.0) {
    double v7 = a4;
  }
  double v8 = a2 + 360.0;
  if (a2 >= 0.0) {
    double v8 = a2;
  }
  double v9 = v8 - v7;
  if (v9 <= 180.0)
  {
    if (v9 < -180.0) {
      double v9 = v9 + 360.0;
    }
  }
  else
  {
    double v9 = v9 + -360.0;
  }
  if (fabs(a1 + v4) >= 0.0001)
  {
    double v42 = a2;
    double v43 = a4;
LABEL_18:
    double v11 = v9;
    goto LABEL_19;
  }
  double v10 = fabs(a1);
  if (v10 < 0.0001 && 180.0 - fabs(v9) < 0.0001) {
    return 20037508.3;
  }
  BOOL v41 = fabs(v10 + -90.0) < 0.0001;
  if (v41) {
    double v11 = 0.0;
  }
  else {
    double v11 = v9;
  }
  double v42 = a2;
  double v43 = a4;
  if (!v41 && 180.0 - fabs(v9) >= 0.0001) {
    goto LABEL_18;
  }
  if (a1 <= v4) {
    double v4 = v4 + -0.0001;
  }
  else {
    a1 = a1 + -0.0001;
  }
LABEL_19:
  double v12 = v11 * 0.0174532925;
  double v44 = a1;
  double v13 = tan(a1 * 0.0174532925);
  long double v14 = tan(v4 * 0.0174532925);
  long double v15 = v13 * 0.996647189;
  long double v16 = v14 * 0.996647189;
  double v17 = atan(v15);
  double v18 = atan(v16);
  __double2 v19 = __sincos_stret(v17);
  __double2 v20 = __sincos_stret(v18);
  unsigned int v21 = 0;
  double v22 = v19.__cosval * v20.__cosval;
  double v23 = v12;
  while (1)
  {
    __double2 v24 = __sincos_stret(v23);
    double v25 = sqrt((-(v19.__sinval * v20.__cosval) * v24.__cosval + v19.__cosval * v20.__sinval)* (-(v19.__sinval * v20.__cosval) * v24.__cosval + v19.__cosval * v20.__sinval)+ v20.__cosval * v24.__sinval * (v20.__cosval * v24.__sinval));
    if (v25 < 2.22044605e-15) {
      break;
    }
    double v26 = v22 * v24.__cosval + v19.__sinval * v20.__sinval;
    double v27 = fabs(v26);
    if (fabs(v25) > 1.0 || v27 > 1.0) {
      break;
    }
    double v29 = atan2(v25, v26);
    double v30 = v22 * v24.__sinval / v25;
    if (v30 > 1.0) {
      break;
    }
    double v31 = 1.0 - v30 * v30;
    if (fabs(v31) >= 2.22044605e-15)
    {
      double v33 = v26 - (v19.__sinval + v19.__sinval) * v20.__sinval / v31;
      double v32 = v31 * 0.000209550667 * ((v31 * -3.0 + 4.0) * 0.00335281066 + 4.0);
    }
    else
    {
      double v32 = 0.0;
      double v33 = -1.0;
    }
    double v34 = v30 * ((1.0 - v32) * 0.00335281066);
    double v35 = v33 * v33 * 2.0 + -1.0;
    double v36 = v12 + v34 * (v29 + v25 * v32 * (v33 + v26 * v32 * v35));
    if (vabdd_f64(v36, v23) > 0.000000001)
    {
      double v23 = v36;
      if (v21++ < 0x31) {
        continue;
      }
    }
    double v38 = v31 * 2.72331606e11 / 4.04083e13;
    double v39 = v38 * 0.0000610351562 * (v38 * (v38 * (v38 * -175.0 + 320.0) + -768.0) + 4096.0) + 1.0;
    double v40 = v38 * 0.0009765625 * (v38 * (v38 * (v38 * -47.0 + 74.0) + -128.0) + 256.0);
    return v39
         * 6356752.31
         * (v29 - v25 * v40 * (v33 + v40 * 0.25 * ((v33 * v33 * 4.0 + -3.0) * (v40 / 6.0 * v33 * 3.0) + v26 * v35)));
  }
  return sub_21B6FC514(v44, v42, v4, v43);
}

long double sub_21B6FC514(double a1, double a2, double a3, double a4)
{
  double v5 = 360.0;
  if (a2 < 0.0) {
    a2 = a2 + 360.0;
  }
  if (a4 < 0.0) {
    a4 = a4 + 360.0;
  }
  double v6 = a4 - a2;
  if (v6 <= 180.0)
  {
    if (v6 >= -180.0) {
      goto LABEL_9;
    }
  }
  else
  {
    double v5 = -360.0;
  }
  double v6 = v6 + v5;
LABEL_9:
  double v7 = a1 * 0.0174532925;
  double v8 = v6 * 0.0174532925;
  long double v9 = sin((a3 - a1) * 0.0174532925 * 0.5);
  long double v10 = v9 * v9;
  __double2 v11 = __sincos_stret(v7);
  long double v12 = v11.__cosval * cos(a3 * 0.0174532925);
  long double v13 = sin(v8 * 0.5);
  double v14 = v10 + v12 * (v13 * v13);
  double v15 = 1.0 - v14;
  if (v14 < 0.0) {
    double v14 = 0.0;
  }
  if (v15 < 0.0) {
    double v15 = 0.0;
  }
  long double v16 = atan2(sqrt(v14), sqrt(v15));
  return (fabs(v11.__sinval) * -21000.0 + 6378160.0) * (v16 + v16);
}

BOOL sub_21B6FC63C(double a1, double a2, double a3, double a4)
{
  if (a2 < 0.0) {
    a2 = a2 + 360.0;
  }
  if (a4 < 0.0) {
    a4 = a4 + 360.0;
  }
  double v4 = a4 - a2;
  if (v4 <= 180.0)
  {
    if (v4 < -180.0) {
      double v4 = v4 + 360.0;
    }
  }
  else
  {
    double v4 = v4 + -360.0;
  }
  unsigned int v5 = (int)v4;
  if ((int)v4 < 0) {
    unsigned int v5 = -v5;
  }
  int v6 = (int)a3 - (int)a1;
  if (v6 < 0) {
    int v6 = (int)a1 - (int)a3;
  }
  return v6 > 2 || v5 > 2;
}

BOOL sub_21B6FC6C0(double *a1, double *a2, double *a3, double *a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  double v10 = vabdd_f64(a5, a8);
  if (v10 <= 2.0)
  {
    double v21 = a1[3];
    if (v21 == 0.0 || vabdd_f64(a5, v21) > 0.005)
    {
      double v22 = (a5 + a8) * 0.5;
      a1[2] = v22 * 0.0174532925;
      a1[3] = v22;
      __double2 v23 = __sincos_stret(v22 * 0.0174532925);
      double v24 = v23.__sinval * -0.00669437999 * v23.__sinval + 1.0;
      double v25 = sqrt(v24);
      *a1 = 6335439.33 / (v24 * v25);
      a1[1] = 6378137.0 / v25;
      a1[4] = v23.__cosval;
    }
    double v26 = 360.0;
    double v27 = a6 + 360.0;
    if (a6 >= 0.0) {
      double v27 = a6;
    }
    double v28 = a9 + 360.0;
    if (a9 >= 0.0) {
      double v28 = a9;
    }
    double v29 = v28 - v27;
    if (v29 <= 180.0)
    {
      if (v29 >= -180.0)
      {
LABEL_13:
        *a2 = (a8 - a5) * 0.0174532925 * (*a1 + a7);
        *a3 = v29 * 0.0174532925 * ((a1[1] + a7) * a1[4]);
        *a4 = a10 - a7;
        return v10 <= 2.0;
      }
    }
    else
    {
      double v26 = -360.0;
    }
    double v29 = v29 + v26;
    goto LABEL_13;
  }
  return v10 <= 2.0;
}

long double sub_21B6FC85C(double *a1, double a2, double a3, double a4, double a5, double a6)
{
  double v14 = 0.0;
  double v15 = 0.0;
  if (!sub_21B6FC63C(a2, a3, a4, a5) && sub_21B6FC6C0(a1, &v15, &v14, &v13, a2, a3, a6, a4, a5, a6)) {
    return sqrt(v14 * v14 + v15 * v15);
  }
  return sub_21B6FC0BC(a2, a3, a4, a5);
}

void sub_21B6FCC34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B6FCD00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B6FCE68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B6FD120(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B6FD3DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B6FD728(_Unwind_Exception *a1)
{
  if (STACK[0x7B0]) {
    sub_21B6E6480((std::__shared_weak_count *)STACK[0x7B0]);
  }
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

os_log_t sub_21B6FE224()
{
  os_log_t result = os_log_create("com.apple.locationd.Position", "Vision");
  qword_267C5A9E0 = (uint64_t)result;
  return result;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void cnnavigation::ECEFToENUJacobian::~ECEFToENUJacobian(cnnavigation::ECEFToENUJacobian *this)
{
}

uint64_t cnnavigation::ECEFToENU()
{
  return MEMORY[0x270F1A8A8]();
}

{
  return MEMORY[0x270F1A8B0]();
}

uint64_t cnnavigation::ECEFToLLA()
{
  return MEMORY[0x270F1A8B8]();
}

uint64_t cnnavigation::ENUToECEF()
{
  return MEMORY[0x270F1A8C0]();
}

uint64_t cnnavigation::LLAToECEF()
{
  return MEMORY[0x270F1A8C8]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::terminate(void)
{
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

void *__cdecl operator new(size_t __sz)
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

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__double cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

long double asin(long double __x)
{
  MEMORY[0x270ED8610](__x);
  return result;
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void cblas_dgemm(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const CBLAS_TRANSPOSE __TransB, const int __M, const int __N, const int __K, const double __alpha, const double *__A, const int __lda, const double *__B, const int __ldb, const double __beta, double *__C, const int __ldc)
{
}

void cblas_dgemv(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const int __M, const int __N, const double __alpha, const double *__A, const int __lda, const double *__X, const int __incX, const double __beta, double *__Y, const int __incY)
{
}

void cblas_dsyr(const CBLAS_ORDER __Order, const CBLAS_UPLO __Uplo, const int __N, const double __alpha, const double *__X, const int __incX, double *__A, const int __lda)
{
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

int dgetrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE5A0](__m, __n, __a, __lda, __ipiv, __info);
}

int dgetri_(__CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE5B0](__n, __a, __lda, __ipiv, __work, __lwork, __info);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x270ED9E58](__x, __y);
  return result;
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int sched_yield(void)
{
  return MEMORY[0x270EDB320]();
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

long double tan(long double __x)
{
  MEMORY[0x270EDB810](__x);
  return result;
}

void vDSP_vaddD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsaddD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmulD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsubD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}