void CoreOptimization::BFGS::UpdateHessian(uint64_t a1, const double **a2, uint64_t a3, const double **a4)
{
  unint64_t v7;
  double v8;
  void *v9;
  const std::locale::facet *v10;
  void *__Y;
  double v12;
  void *v13;
  const std::locale::facet *v14;
  void *v15;
  void *v16;
  const std::locale::facet *v17;
  std::locale v18;
  uint64_t vars8;

  v7 = *(void *)(a3 + 8) - *(void *)a3;
  v8 = cblas_ddot(v7 >> 3, *(const double **)a3, 1, *a4, 1);
  if (v8 < 1.0e-30)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"DAMN DAMN, a_ys = ", 18);
    v9 = (void *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
    v10 = std::locale::use_facet(&v18, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
    std::locale::~locale(&v18);
    std::ostream::put();
    std::ostream::flush();
  }
  if (v7 << 29)
  {
    if (((v7 << 29) & 0x8000000000000000) != 0) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    __Y = operator new(v7 & 0x7FFFFFFFFLL);
    bzero(__Y, v7 & 0x7FFFFFFFFLL);
  }
  else
  {
    __Y = 0;
  }
  cblas_dgemv(CblasColMajor, CblasNoTrans, v7 >> 3, v7 >> 3, 1.0, *a2, v7 >> 3, *a4, 1, 0.0, (double *)__Y, 1);
  v12 = cblas_ddot(v7 >> 3, *a4, 1, (const double *)__Y, 1);
  if (v12 < 1.0e-30)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"DAMN DAMN, a_sbs = ", 19);
    v13 = (void *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v13 + *(void *)(*v13 - 24)));
    v14 = std::locale::use_facet(&v18, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v14->__vftable[2].~facet_0)(v14, 10);
    std::locale::~locale(&v18);
    std::ostream::put();
    std::ostream::flush();
  }
  cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, v7 >> 3, v7 >> 3, 1, 1.0 / v8, *(const double **)a3, v7 >> 3, *(const double **)a3, 1, 1.0, (double *)*a2, v7 >> 3);
  cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, v7 >> 3, v7 >> 3, 1, -1.0 / v12, (const double *)__Y, v7 >> 3, (const double *)__Y, 1, 1.0, (double *)*a2, v7 >> 3);
  v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"Hessian in UpdateHessian: ", 26);
  v16 = operator<<(v15, a2);
  std::ios_base::getloc((const std::ios_base *)((char *)v16 + *(void *)(*v16 - 24)));
  v17 = std::locale::use_facet(&v18, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v17->__vftable[2].~facet_0)(v17, 10);
  std::locale::~locale(&v18);
  std::ostream::put();
  std::ostream::flush();
  if (__Y)
  {
    operator delete(__Y);
  }
}

void sub_22BF9CB0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::locale a14)
{
  std::locale::~locale(&a14);
  if (v14) {
    operator delete(v14);
  }
  _Unwind_Resume(a1);
}

void *std::endl[abi:ne180100]<char,std::char_traits<char>>(void *a1)
{
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
  v2 = std::locale::use_facet(&v4, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

void sub_22BF9CBF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

uint64_t std::valarray<double>::~valarray(uint64_t a1)
{
  v2 = *(unsigned char **)a1;
  if (v2)
  {
    v3 = *(unsigned char **)(a1 + 8);
    if (v3 != v2) {
      *(void *)(a1 + 8) = &v3[(v2 - v3 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v2);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
  }
  return a1;
}

void CoreOptimization::BFGS::UpdateHessianInv(uint64_t a1, const double **a2, uint64_t a3, const double **a4)
{
  unint64_t v7 = *(void *)(a3 + 8) - *(void *)a3;
  double v8 = cblas_ddot(v7 >> 3, *(const double **)a3, 1, *a4, 1);
  if (v8 < 1.0e-30)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"DAMN DAMN, a_ys = ", 18);
    v9 = (void *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
    v10 = std::locale::use_facet(&v22, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
    std::locale::~locale(&v22);
    std::ostream::put();
    std::ostream::flush();
    v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"y = ", 4);
    v12 = operator<<(v11, (void *)a3);
    std::ios_base::getloc((const std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
    v13 = std::locale::use_facet(&v22, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 10);
    std::locale::~locale(&v22);
    std::ostream::put();
    std::ostream::flush();
    v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"s = ", 4);
    v15 = operator<<(v14, a4);
    std::ios_base::getloc((const std::ios_base *)((char *)v15 + *(void *)(*v15 - 24)));
    v16 = std::locale::use_facet(&v22, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v16->__vftable[2].~facet_0)(v16, 10);
    std::locale::~locale(&v22);
    std::ostream::put();
    std::ostream::flush();
  }
  if (v7 << 29)
  {
    if (((v7 << 29) & 0x8000000000000000) != 0) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    __Y = operator new(v7 & 0x7FFFFFFFFLL);
    bzero(__Y, v7 & 0x7FFFFFFFFLL);
  }
  else
  {
    __Y = 0;
  }
  cblas_dgemv(CblasColMajor, CblasNoTrans, v7 >> 3, v7 >> 3, 1.0, *a2, v7 >> 3, *(const double **)a3, 1, 0.0, (double *)__Y, 1);
  double v18 = cblas_ddot(v7 >> 3, *(const double **)a3, 1, (const double *)__Y, 1);
  if (v18 < 1.0e-30)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"DAMN DAMN, a_yby = ", 19);
    v19 = (void *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v19 + *(void *)(*v19 - 24)));
    v20 = std::locale::use_facet(&v22, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v20->__vftable[2].~facet_0)(v20, 10);
    std::locale::~locale(&v22);
    std::ostream::put();
    std::ostream::flush();
  }
  cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, v7 >> 3, v7 >> 3, 1, (v8 + v18) / (v8 * v8), *a4, v7 >> 3, *a4, 1, 1.0, (double *)*a2, v7 >> 3);
  double v21 = -1.0 / v8;
  cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, v7 >> 3, v7 >> 3, 1, v21, (const double *)__Y, v7 >> 3, *a4, 1, 1.0, (double *)*a2, v7 >> 3);
  cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, v7 >> 3, v7 >> 3, 1, v21, *a4, v7 >> 3, (const double *)__Y, 1, 1.0, (double *)*a2, v7 >> 3);
  if (__Y)
  {
    operator delete(__Y);
  }
}

void sub_22BF9D0F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::locale a14)
{
  std::locale::~locale(&a14);
  if (v14) {
    operator delete(v14);
  }
  _Unwind_Resume(a1);
}

void CoreOptimization::BFGS::Solve(uint64_t a1, uint64_t **a2, double **a3, double **a4, char a5)
{
  v34 = a4;
  uint64_t v41 = *MEMORY[0x263EF8340];
  unint64_t v8 = (unint64_t)((char *)a3[1] - (char *)*a3) >> 3;
  __CLPK_integer __lda = v8;
  std::valarray<double>::valarray(&v37, a2);
  v9 = v37;
  if (v38 == v37)
  {
    v9 = (__CLPK_doublereal *)malloc_type_malloc(0x20uLL, 0x100004000313F17uLL);
    LODWORD(v8) = __lda;
  }
  v10 = (__CLPK_integer *)malloc_type_malloc(4 * (int)v8, 0x100004052888210uLL);
  __CLPK_integer __info = 0;
  uint64_t v11 = dgetrf_(&__lda, &__lda, v9, &__lda, v10, &__info);
  if (__info)
  {
    v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"dgetrf failed", 13);
    std::ios_base::getloc((const std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
    v13 = std::locale::use_facet(&v40, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 10);
    std::locale::~locale(&v40);
    std::ostream::put();
    std::ostream::flush();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"error = ", 8);
    v14 = (void *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v14 + *(void *)(*v14 - 24)));
    v15 = std::locale::use_facet(&v40, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v15->__vftable[2].~facet_0)(v15, 10);
    std::locale::~locale(&v40);
    std::ostream::put();
    std::ostream::flush();
    v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"matrix[] is:", 12);
    std::ios_base::getloc((const std::ios_base *)((char *)v16 + *(void *)(*v16 - 24)));
    v17 = std::locale::use_facet(&v40, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v17->__vftable[2].~facet_0)(v17, 10);
    std::locale::~locale(&v40);
    std::ostream::put();
    std::ostream::flush();
    uint64_t v18 = 0;
    v19 = (std::locale::id *)MEMORY[0x263F8C108];
    do
    {
      v20 = (void *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v20 + *(void *)(*v20 - 24)));
      double v21 = std::locale::use_facet(&v40, v19);
      ((void (*)(const std::locale::facet *, uint64_t))v21->__vftable[2].~facet_0)(v21, 10);
      std::locale::~locale(&v40);
      std::ostream::put();
      uint64_t v11 = std::ostream::flush();
      v18 += 8;
    }
    while (v18 != 32);
  }
  LODWORD(v40.__locale_) = 1;
  MEMORY[0x270FA5388](v11);
  v23 = (__CLPK_doublereal *)((char *)&v33 - ((v22 + 15) & 0xFFFFFFFF0));
  uint64_t v24 = __lda;
  if (__lda >= 1)
  {
    v25 = (uint64_t *)*a3;
    v26 = v23;
    do
    {
      uint64_t v27 = *v25++;
      *(void *)v26++ = v27;
      --v24;
    }
    while (v24);
  }
  __CLPK_integer __info = 0;
  char __trans = 78;
  dgetrs_(&__trans, &__lda, (__CLPK_integer *)&v40, v9, &__lda, v10, v23, &__lda, &__info);
  v28 = v34;
  if (__info)
  {
    v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"dgetrs failed", 13);
    std::endl[abi:ne180100]<char,std::char_traits<char>>(v32);
    printf("No.%d value is illegal\n", -__info);
    exit(1);
  }
  uint64_t v29 = __lda;
  if (__lda >= 1)
  {
    v30 = *v34;
    do
    {
      double v31 = *v23++;
      *v30++ = -v31;
      --v29;
    }
    while (v29);
  }
  if (a5) {
    printf("H=(%lf, %lf, %lf, %lf), g=(%lf, %lf), p=(%lf, %lf)\n", *(double *)*a2, *((double *)*a2 + 1), *((double *)*a2 + 2), *((double *)*a2 + 3), **a3, (*a3)[1], **v28, (*v28)[1]);
  }
  if (v10) {
    free(v10);
  }
  if (v9) {
    free(v9);
  }
  if (v37)
  {
    if (v38 != v37) {
      v38 = (__CLPK_doublereal *)((char *)v38 + (((char *)v37 - (char *)v38 + 7) & 0xFFFFFFFFFFFFFFF8));
    }
    operator delete(v37);
  }
}

void sub_22BF9D64C(_Unwind_Exception *exception_object)
{
  v3 = *(unsigned char **)(v1 - 120);
  if (v3)
  {
    std::locale v4 = *(unsigned char **)(v1 - 112);
    if (v4 != v3) {
      *(void *)(v1 - 112) = &v4[(v3 - v4 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *CoreOptimization::BFGS::GetSolution@<X0>(uint64_t **this@<X0>, void *a2@<X8>)
{
  return std::valarray<double>::valarray(a2, this + 3);
}

void CoreOptimization::BFGS::Optimize(CoreOptimization::BFGS *this)
{
  uint64_t v2 = *((void *)this + 2) - *((void *)this + 1);
  uint64_t v3 = v2 << 29;
  v56 = 0;
  v57 = 0;
  if (v2 << 29)
  {
    if (v3 < 0) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    v56 = operator new(v2 & 0x7FFFFFFFFLL);
    bzero(v56, v2 & 0x7FFFFFFFFLL);
    v57 = (char *)v56 + (v2 & 0x7FFFFFFFFLL);
    v54 = operator new(v2 & 0x7FFFFFFFFLL);
    bzero(v54, v2 & 0x7FFFFFFFFLL);
    v55 = (char *)v54 + (v2 & 0x7FFFFFFFFLL);
    __p = operator new(v2 & 0x7FFFFFFFFLL);
    bzero(__p, v2 & 0x7FFFFFFFFLL);
    v53 = (char *)__p + (v2 & 0x7FFFFFFFFLL);
  }
  else
  {
    v54 = 0;
    v55 = 0;
    __p = 0;
    v53 = 0;
  }
  uint64_t v4 = v2 >> 3;
  __A = 0;
  v51 = 0;
  std::valarray<double>::resize((uint64_t)&__A, (v4 * v4), 0.0);
  if (*(int *)this >= 3)
  {
    v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"B_inv = \n", 9);
    v6 = operator<<(v5, &__A);
    std::ios_base::getloc((const std::ios_base *)((char *)v6 + *(void *)(*v6 - 24)));
    unint64_t v7 = std::locale::use_facet(&v48, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 10);
    std::locale::~locale(&v48);
    std::ostream::put();
    std::ostream::flush();
  }
  unint64_t v8 = __A;
  if ((char *)v51 - (char *)__A >= 1) {
    bzero(__A, 8 * (((unint64_t)((char *)v51 - (char *)__A) >> 3) - ((unint64_t)((char *)v51 - (char *)__A) > 7))+ 8);
  }
  uint64_t v9 = ((unint64_t)v2 >> 3);
  if ((int)v4 >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = ((unint64_t)v2 >> 3);
    do
    {
      *(double *)((char *)v8 + (v10 >> 29)) = 1.0;
      v10 += v3 + 0x100000000;
      --v11;
    }
    while (v11);
  }
  int v12 = 0;
  do
  {
    CoreOptimization::gradient_t::gradient_t((CoreOptimization::gradient_t *)&v48, v4);
    (*((void (**)(char *, void, std::locale *))this + 6))((char *)this + 24, *((void *)this + 8), &v48);
    HIDWORD(v13) = -858993459 * (unsigned __int16)v12;
    LODWORD(v13) = HIDWORD(v13);
    if ((v13 >> 1) <= 0x19999999 && *(int *)this >= 2)
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"BFGS round ", 11);
      v14 = (void *)std::ostream::operator<<();
      v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)": beta = ", 9);
      v16 = operator<<(v15, (void *)this + 3);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)" value = ", 9);
      (*((void (**)(char *, void))this + 5))((char *)this + 24, *((void *)this + 8));
      v17 = (void *)std::ostream::operator<<();
      uint64_t v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)" gradient = ", 12);
      v19 = (void *)operator<<(v18, &v48);
      std::ios_base::getloc((const std::ios_base *)((char *)v19 + *(void *)(*v19 - 24)));
      v20 = std::locale::use_facet(&v46, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v20->__vftable[2].~facet_0)(v20, 10);
      std::locale::~locale(&v46);
      std::ostream::put();
      std::ostream::flush();
    }
    double v21 = norm((uint64_t)&v48);
    if (v21 >= 0.00001)
    {
      if ((int)v4 >= 1)
      {
        locale = v48.__locale_;
        uint64_t v30 = v9;
        do
        {
          *(double *)locale = -*(double *)locale;
          locale = (std::locale::__imp *)((char *)locale + 8);
          --v30;
        }
        while (v30);
      }
      __Y = (double *)v54;
      if (v55 - (unsigned char *)v54 >= 1) {
        bzero(v54, 8 * (((unint64_t)(v55 - (unsigned char *)v54) >> 3) - ((unint64_t)(v55 - (unsigned char *)v54) > 7)) + 8);
      }
      cblas_dgemv(CblasColMajor, CblasNoTrans, v4, v4, -1.0, __A, v4, (const double *)v48.__locale_, 1, 0.0, __Y, 1);
      CoreOptimization::BFGS::GoldenSectionSearch((uint64_t)this, (uint64_t)this + 24, &v54);
      if ((int)v4 >= 1)
      {
        uint64_t v33 = (double *)v54;
        v34 = (double *)v56;
        uint64_t v35 = v9;
        v36 = (double *)*((void *)this + 3);
        do
        {
          double v37 = *v33++;
          *v34++ = v32 * v37;
          double *v36 = v32 * v37 + *v36;
          ++v36;
          --v35;
        }
        while (v35);
      }
      CoreOptimization::gradient_t::gradient_t((CoreOptimization::gradient_t *)&v46, v4);
      uint64_t v38 = (*((uint64_t (**)(char *, void, std::locale *))this + 6))((char *)this + 24, *((void *)this + 8), &v46);
      if ((int)v4 >= 1)
      {
        v39 = v46.__locale_;
        std::locale v40 = v48.__locale_;
        uint64_t v41 = v9;
        v42 = (double *)__p;
        do
        {
          double v43 = -*(double *)v39;
          *(double *)v39 = v43;
          v39 = (std::locale::__imp *)((char *)v39 + 8);
          double v44 = *(double *)v40;
          std::locale v40 = (std::locale::__imp *)((char *)v40 + 8);
          *v42++ = v43 - v44;
          --v41;
        }
        while (v41);
      }
      CoreOptimization::BFGS::UpdateHessianInv(v38, (const double **)&__A, (uint64_t)&__p, (const double **)&v56);
      if (v46.__locale_)
      {
        if (v47 != v46.__locale_) {
          v47 = (std::locale::__imp *)((char *)v47 + ((v46.__locale_ - v47 + 7) & 0xFFFFFFFFFFFFFFF8));
        }
        operator delete(v46.__locale_);
      }
    }
    else if (*(int *)this >= 2)
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"BFGS (last) round ", 18);
      uint64_t v22 = (void *)std::ostream::operator<<();
      v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)": beta = ", 9);
      uint64_t v24 = operator<<(v23, (void *)this + 3);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)" value = ", 9);
      (*((void (**)(char *, void))this + 5))((char *)this + 24, *((void *)this + 8));
      v25 = (void *)std::ostream::operator<<();
      v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)" gradient = ", 12);
      uint64_t v27 = (void *)operator<<(v26, &v48);
      std::ios_base::getloc((const std::ios_base *)((char *)v27 + *(void *)(*v27 - 24)));
      v28 = std::locale::use_facet(&v46, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v28->__vftable[2].~facet_0)(v28, 10);
      std::locale::~locale(&v46);
      std::ostream::put();
      std::ostream::flush();
    }
    if (v48.__locale_)
    {
      if (v49 != v48.__locale_) {
        v49 = (std::locale::__imp *)((char *)v49 + ((v48.__locale_ - v49 + 7) & 0xFFFFFFFFFFFFFFF8));
      }
      operator delete(v48.__locale_);
    }
    ++v12;
  }
  while (v21 >= 0.00001 && v12 != 10000);
  if (__A)
  {
    if (v51 != __A) {
      v51 = (double *)((char *)v51 + (((char *)__A - (char *)v51 + 7) & 0xFFFFFFFFFFFFFFF8));
    }
    operator delete(__A);
  }
  if (__p)
  {
    if (v53 != __p) {
      v53 += ((unsigned char *)__p - v53 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    operator delete(__p);
  }
  if (v54)
  {
    if (v55 != v54) {
      v55 += ((unsigned char *)v54 - v55 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    operator delete(v54);
  }
  if (v56)
  {
    if (v57 != v56) {
      v57 += ((unsigned char *)v56 - v57 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    operator delete(v56);
  }
}

void sub_22BF9DD94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11, uint64_t a12, uint64_t a13, std::locale a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,void *__p,uint64_t a23,void *a24,uint64_t a25)
{
  if (__p) {
    operator delete(__p);
  }
  if (a24) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

void std::valarray<double>::resize(uint64_t a1, unint64_t a2, double a3)
{
  v6 = *(unsigned char **)a1;
  if (v6)
  {
    unint64_t v7 = *(unsigned char **)(a1 + 8);
    if (v7 != v6) {
      *(void *)(a1 + 8) = &v7[(v6 - v7 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v6);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
  }
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    unint64_t v8 = (double *)operator new(8 * a2);
    *(void *)a1 = v8;
    do
    {
      *v8++ = a3;
      --a2;
    }
    while (a2);
    *(void *)(a1 + 8) = v8;
  }
}

void CoreOptimization::BFGS::GoldenSectionSearch(uint64_t a1, uint64_t a2, void *a3)
{
  double v20 = 1.0e-30;
  int v6 = 100;
  do
  {
    double v20 = v20 + v20;
    uint64_t v7 = (uint64_t)(a3[1] - *a3) >> 3;
    v16 = &v20;
    uint64_t v17 = v7;
    v15 = a3;
    uint64_t v14 = a2;
    std::__val_expr<std::_BinaryOp<std::plus<double>,std::valarray<double>,std::__val_expr<std::_BinaryOp<std::multiplies<double>,std::valarray<double>,std::__scalar_expr<double>>>>>::operator std::valarray<double>((double *)&v13, (double **)&__p);
    double v8 = (*(double (**)(void **, void))(a1 + 40))(&__p, *(void *)(a1 + 64));
    if (__p)
    {
      if (v19 != __p) {
        v19 += ((unsigned char *)__p - v19 + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      operator delete(__p);
    }
  }
  while (0.000001 - (*(double (**)(uint64_t, void))(a1 + 40))(a2, *(void *)(a1 + 64)) >= -v8 && v6-- != 0);
  if (*(int *)a1 >= 3)
  {
    uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"search direction: ", 18);
    uint64_t v11 = operator<<(v10, a3);
    std::ios_base::getloc((const std::ios_base *)((char *)v11 + *(void *)(*v11 - 24)));
    int v12 = std::locale::use_facet(&v13, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 10);
    std::locale::~locale(&v13);
    std::ostream::put();
    std::ostream::flush();
  }
  CoreOptimization::BFGS::GoldenSectionSearch_r(a1, a2, a3, 0.0, v20 * 0.25, v20 * 0.5, 0.01);
}

void sub_22BF9E208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
}

void CoreOptimization::BFGS::Optimize0(CoreOptimization::BFGS *this)
{
  uint64_t v2 = (uint64_t *)*((void *)this + 1);
  unint64_t v3 = *((void *)this + 2) - (void)v2;
  unint64_t v4 = v3 << 29;
  v53 = 0;
  v54 = 0;
  if (v3 << 29)
  {
    if ((v4 & 0x8000000000000000) != 0) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    v53 = (double *)operator new(v3 & 0x7FFFFFFFFLL);
    bzero(v53, v3 & 0x7FFFFFFFFLL);
    v5 = v53;
    v54 = (char *)v53 + (v3 & 0x7FFFFFFFFLL);
    v51 = operator new(v3 & 0x7FFFFFFFFLL);
    bzero(v51, v3 & 0x7FFFFFFFFLL);
    v52 = (char *)v51 + (v3 & 0x7FFFFFFFFLL);
    int v6 = operator new(v3 & 0x7FFFFFFFFLL);
    v49 = v6;
    bzero(v6, v3 & 0x7FFFFFFFFLL);
    v50 = (char *)v6 + (v3 & 0x7FFFFFFFFLL);
    v47 = (char *)operator new(v3 & 0x7FFFFFFFFLL);
    bzero(v47, v3 & 0x7FFFFFFFFLL);
    std::locale v40 = (double *)v47;
    std::locale v48 = &v47[v3 & 0x7FFFFFFFFLL];
  }
  else
  {
    std::locale v40 = 0;
    v5 = 0;
    int v6 = 0;
    v51 = 0;
    v52 = 0;
    v49 = 0;
    v50 = 0;
    v47 = 0;
    std::locale v48 = 0;
  }
  uint64_t v7 = (uint64_t)v3 >> 3;
  if ((int)((uint64_t)v3 >> 3) >= 1)
  {
    uint64_t v8 = (v3 >> 3);
    do
    {
      uint64_t v9 = *v2++;
      *v6++ = v9;
      --v8;
    }
    while (v8);
  }
  __p = 0;
  std::locale v46 = 0;
  std::valarray<double>::resize((uint64_t)&__p, (v7 * v7), 0.0);
  uint64_t v10 = operator<<(MEMORY[0x263F8C100], &__p);
  std::ios_base::getloc((const std::ios_base *)((char *)v10 + *(void *)(*v10 - 24)));
  uint64_t v11 = std::locale::use_facet(&v43, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 10);
  std::locale::~locale(&v43);
  std::ostream::put();
  std::ostream::flush();
  int v12 = (char *)__p;
  if (v46 - (unsigned char *)__p >= 1) {
    bzero(__p, 8 * (((unint64_t)(v46 - (unsigned char *)__p) >> 3) - ((unint64_t)(v46 - (unsigned char *)__p) > 7)) + 8);
  }
  if ((int)v7 >= 1)
  {
    uint64_t v13 = 0;
    uint64_t v14 = (v3 >> 3);
    do
    {
      *(void *)&v12[v13 >> 29] = 0x3FF0000000000000;
      v13 += v4 + 0x100000000;
      --v14;
    }
    while (v14);
  }
  int v15 = 0;
  v16 = (std::locale::id *)MEMORY[0x263F8C108];
  while (1)
  {
    CoreOptimization::gradient_t::gradient_t((CoreOptimization::gradient_t *)&v43, v7);
    (*((void (**)(void **, void, std::locale *))this + 6))(&v49, *((void *)this + 8), &v43);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"BFGS round ", 11);
    uint64_t v17 = (void *)std::ostream::operator<<();
    uint64_t v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)": beta = ", 9);
    v19 = operator<<(v18, &v49);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)" value = ", 9);
    (*((void (**)(void **, void))this + 5))(&v49, *((void *)this + 8));
    double v20 = (void *)std::ostream::operator<<();
    double v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)" gradient = ", 12);
    uint64_t v22 = (void *)operator<<(v21, &v43);
    std::ios_base::getloc((const std::ios_base *)((char *)v22 + *(void *)(*v22 - 24)));
    v23 = std::locale::use_facet(&v41, v16);
    ((void (*)(const std::locale::facet *, uint64_t))v23->__vftable[2].~facet_0)(v23, 10);
    std::locale::~locale(&v41);
    std::ostream::put();
    std::ostream::flush();
    if (norm((uint64_t)&v43) < 0.00001) {
      break;
    }
    if ((int)v7 >= 1)
    {
      locale = v43.__locale_;
      uint64_t v26 = (v3 >> 3);
      do
      {
        *(double *)locale = -*(double *)locale;
        locale = (std::locale::__imp *)((char *)locale + 8);
        --v26;
      }
      while (v26);
    }
    CoreOptimization::BFGS::Solve(v24, (uint64_t **)&__p, (double **)&v43, (double **)&v51, 0);
    CoreOptimization::BFGS::GoldenSectionSearch((uint64_t)this, (uint64_t)&v49, &v51);
    if ((int)v7 >= 1)
    {
      v28 = (double *)v51;
      uint64_t v29 = (double *)v49;
      uint64_t v30 = (v3 >> 3);
      double v31 = v5;
      do
      {
        double v32 = *v28++;
        *v31++ = v27 * v32;
        *uint64_t v29 = v27 * v32 + *v29;
        ++v29;
        --v30;
      }
      while (v30);
    }
    CoreOptimization::gradient_t::gradient_t((CoreOptimization::gradient_t *)&v41, v7);
    uint64_t v33 = (*((uint64_t (**)(void **, void, std::locale *))this + 6))(&v49, *((void *)this + 8), &v41);
    if ((int)v7 >= 1)
    {
      uint64_t v35 = v40;
      v34 = v41.__locale_;
      v36 = v43.__locale_;
      uint64_t v37 = (v3 >> 3);
      do
      {
        double v38 = -*(double *)v34;
        *(double *)v34 = v38;
        v34 = (std::locale::__imp *)((char *)v34 + 8);
        double v39 = *(double *)v36;
        v36 = (std::locale::__imp *)((char *)v36 + 8);
        *v35++ = v38 - v39;
        --v37;
      }
      while (v37);
    }
    CoreOptimization::BFGS::UpdateHessian(v33, (const double **)&__p, (uint64_t)&v47, (const double **)&v53);
    if (v41.__locale_)
    {
      if (v42 != v41.__locale_) {
        v42 = (std::locale::__imp *)((char *)v42 + ((v41.__locale_ - v42 + 7) & 0xFFFFFFFFFFFFFFF8));
      }
      operator delete(v41.__locale_);
    }
    if (v43.__locale_)
    {
      if (v44 != v43.__locale_) {
        double v44 = (std::locale::__imp *)((char *)v44 + ((v43.__locale_ - v44 + 7) & 0xFFFFFFFFFFFFFFF8));
      }
      operator delete(v43.__locale_);
    }
    if (++v15 == 10000) {
      goto LABEL_38;
    }
  }
  if (v43.__locale_)
  {
    if (v44 != v43.__locale_) {
      double v44 = (std::locale::__imp *)((char *)v44 + ((v43.__locale_ - v44 + 7) & 0xFFFFFFFFFFFFFFF8));
    }
    operator delete(v43.__locale_);
  }
LABEL_38:
  if (__p)
  {
    if (v46 != __p) {
      v46 += ((unsigned char *)__p - v46 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    operator delete(__p);
  }
  if (v40)
  {
    if (v48 != (char *)v40) {
      v48 += ((char *)v40 - v48 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    operator delete(v40);
  }
  if (v49)
  {
    if (v50 != v49) {
      v50 += ((unsigned char *)v49 - v50 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    operator delete(v49);
  }
  if (v51)
  {
    if (v52 != v51) {
      v52 += ((unsigned char *)v51 - v52 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    operator delete(v51);
  }
  if (v5) {
    operator delete(v5);
  }
}

void sub_22BF9E810(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, std::locale a11, uint64_t a12, uint64_t a13, std::locale a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,void *a24,uint64_t a25)
{
  if (__p) {
    operator delete(__p);
  }
  if (a24) {
    operator delete(a24);
  }
  if (v25) {
    operator delete(v25);
  }
  _Unwind_Resume(exception_object);
}

double CoreOptimization::BFGS::GoldenSectionSearch_r(uint64_t a1, uint64_t a2, void *a3, double a4, double a5, double a6, double a7)
{
  if (a6 - a5 <= a5 - a4) {
    double v10 = a5 + (a5 - a4) * -0.381966011;
  }
  else {
    double v10 = a5 + (a6 - a5) * 0.381966011;
  }
  unint64_t v47 = *(void *)&v10;
  double v48 = a5;
  if (vabdd_f64(a6, a4) >= (fabs(a5) + fabs(v10)) * a7)
  {
    uint64_t v15 = (uint64_t)(a3[1] - *a3) >> 3;
    std::locale v43 = &v47;
    uint64_t v44 = v15;
    v42 = a3;
    uint64_t v41 = a2;
    std::__val_expr<std::_BinaryOp<std::plus<double>,std::valarray<double>,std::__val_expr<std::_BinaryOp<std::multiplies<double>,std::valarray<double>,std::__scalar_expr<double>>>>>::operator std::valarray<double>((double *)&v40, (double **)&v45);
    double v16 = (*(double (**)(void **, void))(a1 + 40))(&v45, *(void *)(a1 + 64));
    uint64_t v17 = (uint64_t)(a3[1] - *a3) >> 3;
    v36 = &v48;
    uint64_t v37 = v17;
    uint64_t v35 = a3;
    uint64_t v34 = a2;
    std::__val_expr<std::_BinaryOp<std::plus<double>,std::valarray<double>,std::__val_expr<std::_BinaryOp<std::multiplies<double>,std::valarray<double>,std::__scalar_expr<double>>>>>::operator std::valarray<double>(&v33, (double **)&__p);
    double v18 = (*(double (**)(void **, void))(a1 + 40))(&__p, *(void *)(a1 + 64));
    if (__p)
    {
      if (v39 != __p) {
        v39 += ((unsigned char *)__p - v39 + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      operator delete(__p);
    }
    if (v45)
    {
      if (v46 != v45) {
        v46 += ((unsigned char *)v45 - v46 + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      operator delete(v45);
    }
    if (v16 == v18)
    {
      v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"Bang!", 5);
      std::ios_base::getloc((const std::ios_base *)((char *)v19 + *(void *)(*v19 - 24)));
      double v20 = std::locale::use_facet(&v40, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v20->__vftable[2].~facet_0)(v20, 10);
      std::locale::~locale(&v40);
      std::ostream::put();
      std::ostream::flush();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"returning ", 10);
      double v11 = (a4 + a6) * 0.5;
      double v21 = (void *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v21 + *(void *)(*v21 - 24)));
      uint64_t v22 = std::locale::use_facet(&v40, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v22->__vftable[2].~facet_0)(v22, 10);
      std::locale::~locale(&v40);
      std::ostream::put();
      std::ostream::flush();
      return v11;
    }
    uint64_t v23 = (uint64_t)(a3[1] - *a3) >> 3;
    std::locale v43 = &v47;
    uint64_t v44 = v23;
    v42 = a3;
    uint64_t v41 = a2;
    std::__val_expr<std::_BinaryOp<std::plus<double>,std::valarray<double>,std::__val_expr<std::_BinaryOp<std::multiplies<double>,std::valarray<double>,std::__scalar_expr<double>>>>>::operator std::valarray<double>((double *)&v40, (double **)&v45);
    double v24 = (*(double (**)(void **, void))(a1 + 40))(&v45, *(void *)(a1 + 64));
    uint64_t v25 = (uint64_t)(a3[1] - *a3) >> 3;
    v36 = &v48;
    uint64_t v37 = v25;
    uint64_t v35 = a3;
    uint64_t v34 = a2;
    std::__val_expr<std::_BinaryOp<std::plus<double>,std::valarray<double>,std::__val_expr<std::_BinaryOp<std::multiplies<double>,std::valarray<double>,std::__scalar_expr<double>>>>>::operator std::valarray<double>(&v33, (double **)&__p);
    double v29 = (*(double (**)(void **, void))(a1 + 40))(&__p, *(void *)(a1 + 64));
    if (__p)
    {
      if (v39 != __p) {
        v39 += ((unsigned char *)__p - v39 + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      operator delete(__p);
    }
    if (v45)
    {
      if (v46 != v45) {
        v46 += ((unsigned char *)v45 - v46 + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      operator delete(v45);
    }
    v28.n128_f64[0] = v48;
    double v30 = a6 - v48;
    double v31 = v48 - a4;
    if (v24 <= v29)
    {
      if (v30 <= v31)
      {
        v26.n128_u64[0] = v47;
        v27.n128_f64[0] = v48;
        goto LABEL_31;
      }
      v26.n128_f64[0] = a4;
      v27.n128_f64[0] = v48;
      v28.n128_u64[0] = v47;
    }
    else
    {
      if (v30 > v31)
      {
        v26.n128_f64[0] = v48;
        v27.n128_u64[0] = v47;
LABEL_31:
        v28.n128_f64[0] = a6;
        return CoreOptimization::BFGS::GoldenSectionSearch_r(a1, a2, a3, v26, v27, v28, a7);
      }
      v26.n128_f64[0] = a4;
      v27.n128_u64[0] = v47;
    }
    return CoreOptimization::BFGS::GoldenSectionSearch_r(a1, a2, a3, v26, v27, v28, a7);
  }
  return (a4 + a6) * 0.5;
}

void sub_22BF9EDA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, std::locale a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24)
{
  if (__p) {
    operator delete(__p);
  }
  if (a23) {
    operator delete(a23);
  }
  _Unwind_Resume(exception_object);
}

double *std::__val_expr<std::_BinaryOp<std::plus<double>,std::valarray<double>,std::__val_expr<std::_BinaryOp<std::multiplies<double>,std::valarray<double>,std::__scalar_expr<double>>>>>::operator std::valarray<double>@<X0>(double *result@<X0>, double **a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  uint64_t v3 = *((void *)result + 1);
  v5 = *(double **)v3;
  uint64_t v4 = *(void *)(v3 + 8);
  uint64_t v6 = v4 - *(void *)v3;
  if (v4 != *(void *)v3)
  {
    if (v6 < 0) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v7 = result;
    result = (double *)operator new(v4 - *(void *)v3);
    uint64_t v8 = v6 >> 3;
    *a2 = result;
    a2[1] = result;
    uint64_t v9 = (double *)*((void *)v7 + 4);
    double v10 = (double *)**((void **)v7 + 3);
    do
    {
      double v11 = *v10++;
      double v12 = v11 * *v9;
      double v13 = *v5++;
      *result++ = v13 + v12;
      --v8;
    }
    while (v8);
    a2[1] = result;
  }
  return result;
}

void sub_22BF9EEC0(_Unwind_Exception *a1)
{
  std::valarray<double>::~valarray(v1);
  _Unwind_Resume(a1);
}

double CoreOptimization::BFGS::GoldenSectionSearch0(uint64_t a1, double **a2, double **a3, int a4)
{
  uint64_t v8 = *a2;
  uint64_t v7 = a2[1];
  if (a4)
  {
    uint64_t v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"searchDirection = ", 18);
    double v10 = operator<<(v9, a3);
    std::ios_base::getloc((const std::ios_base *)((char *)v10 + *(void *)(*v10 - 24)));
    double v11 = std::locale::use_facet(&v47, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 10);
    std::locale::~locale(&v47);
    std::ostream::put();
    std::ostream::flush();
  }
  int v12 = 0;
  unint64_t v13 = (char *)v7 - (char *)v8;
  unint64_t v14 = (unint64_t)((char *)v7 - (char *)v8) >> 3;
  int64_t v15 = ((char *)v7 - (char *)v8) << 29;
  size_t v16 = (uint64_t)(v13 << 29) >> 29;
  uint64_t v17 = (v13 >> 3);
  double v18 = 0.01;
  double v19 = 0.2;
  do
  {
    v47.__locale_ = 0;
    double v48 = 0;
    if (v15)
    {
      if (v15 < 0) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      double v20 = (std::locale::__imp *)operator new(v16);
      v47.__locale_ = v20;
      bzero(v20, v16);
      double v48 = (std::locale::__imp *)((char *)v20 + v16);
      double v21 = (double *)operator new(v16);
      __p = v21;
      bzero(v21, v16);
      std::locale v46 = (char *)v21 + v16;
    }
    else
    {
      double v21 = 0;
      double v20 = 0;
      __p = 0;
      std::locale v46 = 0;
    }
    double v22 = (v19 - v18) / 1.61803399;
    double v23 = v18 + v22;
    double v24 = v19 - v22;
    if ((int)v14 >= 1)
    {
      uint64_t v25 = *a2;
      __n128 v26 = *a3;
      uint64_t v27 = v17;
      do
      {
        *(double *)double v20 = *v25 + v24 * *v26;
        double v20 = (std::locale::__imp *)((char *)v20 + 8);
        double v28 = *v25++;
        double v29 = v28;
        double v30 = *v26++;
        *v21++ = v29 + v23 * v30;
        --v27;
      }
      while (v27);
    }
    if (a4)
    {
      double v31 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"\tx=", 3);
      double v32 = operator<<(v31, a2);
      std::ios_base::getloc((const std::ios_base *)((char *)v32 + *(void *)(*v32 - 24)));
      double v33 = std::locale::use_facet(&v49, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v33->__vftable[2].~facet_0)(v33, 10);
      std::locale::~locale(&v49);
      std::ostream::put();
      std::ostream::flush();
      printf("\t[lo, up]=[%lf, %lf], [nlo, nup]=[%lf, %lf]\n", v18, v19, v24, v23);
      uint64_t v34 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"\t[xlo, xhi]=[", 13);
      uint64_t v35 = operator<<(v34, &v47);
      v36 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)", ", 2);
      uint64_t v37 = operator<<(v36, &__p);
      double v38 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)"]", 1);
      std::ios_base::getloc((const std::ios_base *)((char *)v38 + *(void *)(*v38 - 24)));
      double v39 = std::locale::use_facet(&v49, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v39->__vftable[2].~facet_0)(v39, 10);
      std::locale::~locale(&v49);
      std::ostream::put();
      std::ostream::flush();
      double v40 = (*(double (**)(std::locale *, void))(a1 + 40))(&v47, *(void *)(a1 + 64));
      double v41 = (*(double (**)(void **, void))(a1 + 40))(&__p, *(void *)(a1 + 64));
      printf("\t(vlo, vhi)=(%lf, %lf)\n", -v40, -v41);
    }
    double v42 = (*(double (**)(std::locale *, void))(a1 + 40))(&v47, *(void *)(a1 + 64));
    if (v42 > (*(double (**)(void **, void))(a1 + 40))(&__p, *(void *)(a1 + 64))) {
      double v19 = v23;
    }
    else {
      double v18 = v24;
    }
    if (a4) {
      printf("range: (%lf, %lf)\n", v18, v19);
    }
    if (__p)
    {
      if (v46 != __p) {
        v46 += ((unsigned char *)__p - v46 + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      operator delete(__p);
    }
    if (v47.__locale_)
    {
      if (v48 != v47.__locale_) {
        double v48 = (std::locale::__imp *)((char *)v48 + ((v47.__locale_ - v48 + 7) & 0xFFFFFFFFFFFFFFF8));
      }
      operator delete(v47.__locale_);
    }
    ++v12;
  }
  while (v12 != 20);
  return (v18 + v19) * 0.5;
}

void sub_22BF9F32C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, std::locale a16, uint64_t a17, std::locale a18)
{
}

CoreOptimization::gradient_t *CoreOptimization::gradient_t::gradient_t(CoreOptimization::gradient_t *this, int a2)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  std::valarray<double>::resize((uint64_t)this, a2, 0.0);
  return this;
}

void sub_22BF9F3F0(_Unwind_Exception *a1)
{
  std::valarray<double>::~valarray(v1);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *std::valarray<double>::valarray(void *a1, uint64_t **a2)
{
  *a1 = 0;
  a1[1] = 0;
  uint64_t v3 = a2[1];
  size_t v4 = (char *)v3 - (char *)*a2;
  if (v3 != *a2)
  {
    if ((v4 & 0x8000000000000000) != 0) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v6 = (char *)operator new(v4);
    *a1 = v6;
    a1[1] = v6;
    uint64_t v7 = *a2;
    if (*a2 != a2[1])
    {
      uint64_t v8 = v6 + 8;
      do
      {
        uint64_t v9 = *v7++;
        *((void *)v8 - 1) = v9;
        a1[1] = v8;
        v8 += 8;
      }
      while (v7 != a2[1]);
    }
  }
  return a1;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x230F5A520](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      double v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x230F5A530](v13);
  return a1;
}

void sub_22BF9F5FC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x230F5A530](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x22BF9F5DCLL);
}

void sub_22BF9F650(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      unint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_22BF9F7D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264904C98, MEMORY[0x263F8C060]);
}

void sub_22BF9F8F8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void GradientDescent(uint64_t *a1, uint64_t a2, int a3)
{
  if (a3 >= 2)
  {
    uint64_t v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)" ======= Start of Gradient Descent method ======= ", 50);
    std::ios_base::getloc((const std::ios_base *)((char *)v6 + *(void *)(*v6 - 24)));
    size_t v7 = std::locale::use_facet(&v35, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 10);
    std::locale::~locale(&v35);
    std::ostream::put();
    std::ostream::flush();
    size_t v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"f(beta=", 7);
    int v9 = operator<<(v8, a1);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)") = ", 4);
    (*(void (**)(uint64_t *, void))a2)(a1, *(void *)(a2 + 24));
    double v10 = (void *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v10 + *(void *)(*v10 - 24)));
    uint64_t v11 = std::locale::use_facet(&v35, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 10);
    std::locale::~locale(&v35);
    std::ostream::put();
    std::ostream::flush();
  }
  CoreOptimization::gradient_t::gradient_t((CoreOptimization::gradient_t *)&v35, 15);
  (*(void (**)(uint64_t *, void, std::locale *))(a2 + 8))(a1, *(void *)(a2 + 24), &v35);
  if (a3 >= 2)
  {
    int64_t v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"g(beta=", 7);
    unint64_t v13 = operator<<(v12, a1);
    uint64_t v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)")' = ", 5);
    uint64_t v15 = (void *)operator<<(v14, &v35);
    std::ios_base::getloc((const std::ios_base *)((char *)v15 + *(void *)(*v15 - 24)));
    size_t v16 = std::locale::use_facet(&v33, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v16->__vftable[2].~facet_0)(v16, 10);
    std::locale::~locale(&v33);
    std::ostream::put();
    std::ostream::flush();
  }
  unsigned int v17 = 0;
  char v18 = (void *)MEMORY[0x263F8C100];
  double v19 = (std::locale::id *)MEMORY[0x263F8C108];
  while (1)
  {
    CoreOptimization::gradient_t::gradient_t((CoreOptimization::gradient_t *)&v33, 15);
    (*(void (**)(uint64_t *, void, std::locale *))(a2 + 8))(a1, *(void *)(a2 + 24), &v35);
    uint64_t v20 = 0;
    locale = v35.__locale_;
    uint64_t v22 = *a1;
    do
    {
      *(double *)(v22 + v20) = *(double *)(v22 + v20) + *(double *)((char *)locale + v20) * 0.001;
      v20 += 8;
    }
    while (v20 != 120);
    if (norm((uint64_t)&v35) <= 0.00001) {
      break;
    }
    if (a3 >= 2 && !(v17 % 0x3E8))
    {
      double v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"beta = ", 7);
      double v24 = operator<<(v23, a1);
      std::ios_base::getloc((const std::ios_base *)((char *)v24 + *(void *)(*v24 - 24)));
      uint64_t v25 = std::locale::use_facet(&v37, v19);
      ((void (*)(const std::locale::facet *, uint64_t))v25->__vftable[2].~facet_0)(v25, 10);
      std::locale::~locale(&v37);
      std::ostream::put();
      std::ostream::flush();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"f() = ", 6);
      (*(void (**)(uint64_t *, void))a2)(a1, *(void *)(a2 + 24));
      __n128 v26 = (void *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v26 + *(void *)(*v26 - 24)));
      uint64_t v27 = std::locale::use_facet(&v37, v19);
      ((void (*)(const std::locale::facet *, uint64_t))v27->__vftable[2].~facet_0)(v27, 10);
      std::locale::~locale(&v37);
      std::ostream::put();
      std::ostream::flush();
      (*(void (**)(uint64_t *, void, std::locale *))(a2 + 8))(a1, *(void *)(a2 + 24), &v35);
      double v28 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"g() = ", 6);
      double v29 = (void *)operator<<(v28, &v35);
      std::ios_base::getloc((const std::ios_base *)((char *)v29 + *(void *)(*v29 - 24)));
      double v30 = std::locale::use_facet(&v37, v19);
      ((void (*)(const std::locale::facet *, uint64_t))v30->__vftable[2].~facet_0)(v30, 10);
      std::locale::~locale(&v37);
      std::ostream::put();
      std::ostream::flush();
    }
    if (v33.__locale_)
    {
      if (v34 != v33.__locale_) {
        uint64_t v34 = (std::locale::__imp *)((char *)v34 + ((v33.__locale_ - v34 + 7) & 0xFFFFFFFFFFFFFFF8));
      }
      operator delete(v33.__locale_);
    }
    if (++v17 == 100000) {
      goto LABEL_22;
    }
  }
  if (v33.__locale_)
  {
    if (v34 != v33.__locale_) {
      uint64_t v34 = (std::locale::__imp *)((char *)v34 + ((v33.__locale_ - v34 + 7) & 0xFFFFFFFFFFFFFFF8));
    }
    operator delete(v33.__locale_);
  }
LABEL_22:
  if (a3 >= 2)
  {
    double v31 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)" ======= End of Gradient Descent method ======= ", 48);
    std::ios_base::getloc((const std::ios_base *)((char *)v31 + *(void *)(*v31 - 24)));
    double v32 = std::locale::use_facet(&v33, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v32->__vftable[2].~facet_0)(v32, 10);
    std::locale::~locale(&v33);
    std::ostream::put();
    std::ostream::flush();
  }
  if (v35.__locale_)
  {
    if (v36 != v35.__locale_) {
      v36 = (std::locale::__imp *)((char *)v36 + ((v35.__locale_ - v36 + 7) & 0xFFFFFFFFFFFFFFF8));
    }
    operator delete(v35.__locale_);
  }
}

void sub_22BF9FF94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10, uint64_t a11, uint64_t a12, unsigned char *__p, unsigned char *a14, uint64_t a15, std::locale a16)
{
  if (__p)
  {
    if (a14 != __p) {
      a14 += (__p - a14 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

double norm(uint64_t a1)
{
  uint64_t v1 = *(double **)a1;
  uint64_t v2 = *(void *)(a1 + 8) - *(void *)a1;
  if (v2)
  {
    unint64_t v3 = v2 >> 3;
    if (v3 <= 1) {
      unint64_t v3 = 1;
    }
    double v4 = 0.0;
    do
    {
      double v5 = *v1++;
      double v4 = v4 + v5 * v5;
      --v3;
    }
    while (v3);
  }
  else
  {
    double v4 = 0.0;
  }
  return sqrt(v4);
}

void *operator<<(void *a1, void *a2)
{
  uint64_t v2 = a1;
  if (a2[1] == *a2)
  {
    double v5 = "Empty";
    uint64_t v6 = 5;
  }
  else
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"(", 1);
    std::ostream::operator<<();
    if (a2[1] - *a2 >= 9uLL)
    {
      unint64_t v4 = 1;
      do
      {
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)", ", 2);
        std::ostream::operator<<();
        ++v4;
      }
      while (v4 < (uint64_t)(a2[1] - *a2) >> 3);
    }
    double v5 = ")";
    a1 = v2;
    uint64_t v6 = 1;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)v5, v6);
  return v2;
}

{
  void *v2;
  unint64_t v4;
  const char *v5;
  uint64_t v6;

  uint64_t v2 = a1;
  if (a2[1] == *a2)
  {
    double v5 = "Empty";
    uint64_t v6 = 5;
  }
  else
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"(", 1);
    std::ostream::operator<<();
    if (a2[1] - *a2 >= 9uLL)
    {
      unint64_t v4 = 1;
      do
      {
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)", ", 2);
        std::ostream::operator<<();
        ++v4;
      }
      while (v4 < (uint64_t)(a2[1] - *a2) >> 3);
    }
    double v5 = ")";
    a1 = v2;
    uint64_t v6 = 1;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)v5, v6);
  return v2;
}

{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  std::locale::id *v9;
  const std::locale::facet *v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  std::locale v15;

  uint64_t v2 = a2[1];
  unint64_t v3 = (unint64_t)(v2 - *a2) >> 3;
  unint64_t v4 = (int)sqrt((double)(int)v3);
  if ((v4 + 1) * (v4 + 1) == v3) {
    double v5 = v4 + 1;
  }
  else {
    double v5 = v4;
  }
  if (v5 * v5 != v3)
  {
    uint64_t v14 = std::operator<<[abi:ne180100]<std::char_traits<char>>(MEMORY[0x263F8C100], "A Hessian is supposed to be a square matrix");
    std::endl[abi:ne180100]<char,std::char_traits<char>>(v14);
    exit(1);
  }
  if (v2 == *a2)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"Empty", 5);
  }
  else if ((int)v5 >= 1)
  {
    size_t v7 = 0;
    size_t v8 = 0;
    int v9 = (std::locale::id *)MEMORY[0x263F8C108];
    do
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      double v10 = std::locale::use_facet(&v15, v9);
      ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
      std::locale::~locale(&v15);
      std::ostream::put();
      std::ostream::flush();
      uint64_t v11 = v5;
      int64_t v12 = v7;
      do
      {
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"\t", 1);
        std::ostream::operator<<();
        v12 += 8 * v5;
        --v11;
      }
      while (v11);
      ++v8;
      v7 += 8;
    }
    while (v8 != v5);
  }
  return a1;
}

void *std::operator<<[abi:ne180100]<std::char_traits<char>>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)__s, v4);
}

void sub_22BFA040C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987A8]();
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
  return (void *)MEMORY[0x270F98EC0](thrown_size);
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void bzero(void *a1, size_t a2)
{
}

double cblas_ddot(const int __N, const double *__X, const int __incX, const double *__Y, const int __incY)
{
  MEMORY[0x270EDE318](*(void *)&__N, __X, *(void *)&__incX, __Y, *(void *)&__incY);
  return result;
}

void cblas_dgemm(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const CBLAS_TRANSPOSE __TransB, const int __M, const int __N, const int __K, const double __alpha, const double *__A, const int __lda, const double *__B, const int __ldb, const double __beta, double *__C, const int __ldc)
{
}

void cblas_dgemv(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const int __M, const int __N, const double __alpha, const double *__A, const int __lda, const double *__X, const int __incX, const double __beta, double *__Y, const int __incY)
{
}

int dgetrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE5A0](__m, __n, __a, __lda, __ipiv, __info);
}

int dgetrs_(char *__trans, __CLPK_integer *__n, __CLPK_integer *__nrhs, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_doublereal *__b, __CLPK_integer *__ldb, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE5C0](__trans, __n, __nrhs, __a, __lda, __ipiv, __b, __ldb);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}