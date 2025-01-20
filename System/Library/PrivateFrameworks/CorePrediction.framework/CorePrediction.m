double *CPMLOnlineSvm::ConditionalUpdate(double *this, uint64_t a2, uint64_t a3)
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;

  if (a2 != a3)
  {
    v3 = this[20];
    v4 = *((void *)this + 45);
    v5 = *((void *)this + 39);
    v6 = *(double *)(v5 + 8 * a3) - fmin(v3 * *(double *)(v4 + 8 * a3), 0.0);
    if (v6 > 0.0)
    {
      v7 = fmax(v3 * *(double *)(v4 + 8 * a2), 0.0) - *(double *)(v5 + 8 * a2);
      if (v7 > 0.0)
      {
        v8 = *(double *)(*((void *)this + 48) + 8 * a2) - *(double *)(*((void *)this + 48) + 8 * a3);
        if (v8 > this[21]) {
          return (double *)CPMLOnlineSvm::Update(this, a2, a3, v7, v6, v8);
        }
      }
    }
  }
  return this;
}

void *CPMLOnlineSvm::Update(void *this, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  v6 = (unint64_t *)this[54];
  unint64_t v7 = v6[a2];
  unint64_t v8 = this[13];
  if (v8 <= v7) {
    CPMLOnlineSvm::Update();
  }
  unint64_t v9 = this[14];
  if (v9 <= v7) {
    CPMLOnlineSvm::Update();
  }
  unint64_t v10 = v6[a3];
  if (v8 <= v10) {
    CPMLOnlineSvm::Update();
  }
  if (v9 <= v10) {
    CPMLOnlineSvm::Update();
  }
  uint64_t v11 = this[12];
  uint64_t v12 = this[15];
  uint64_t v13 = this[16];
  uint64_t v14 = v12 * v7;
  uint64_t v15 = v13 * v7;
  uint64_t v16 = v10 * v13;
  double v17 = a6
      / (*(double *)(v11 + 8 * (v15 + v14))
       + *(double *)(v11 + 8 * v10 * (v13 + v12))
       + *(double *)(v11 + 8 * (v10 * v13 + v14)) * -2.0);
  if (a5 < a4) {
    a4 = a5;
  }
  uint64_t v18 = this[39];
  if (a4 >= v17) {
    a4 = v17;
  }
  *(double *)(v18 + 8 * a2) = *(double *)(v18 + 8 * a2) + a4;
  *(double *)(v18 + 8 * a3) = *(double *)(v18 + 8 * a3) - a4;
  v19 = (double *)this[48];
  uint64_t v20 = this[49] - (void)v19;
  if (v20)
  {
    unint64_t v21 = v20 >> 3;
    if (v21 <= 1) {
      unint64_t v21 = 1;
    }
    do
    {
      unint64_t v23 = *v6++;
      unint64_t v22 = v23;
      if (v8 <= v23) {
        CPMLOnlineSvm::Update();
      }
      double *v19 = *v19 - (*(double *)(v11 + 8 * (v22 * v12 + v15)) - *(double *)(v11 + 8 * (v22 * v12 + v16))) * a4;
      ++v19;
      --v21;
    }
    while (v21);
  }
  v24 = (double *)this[52];
  v25 = (double *)this[53];
  if (v24 != v25)
  {
    uint64_t v26 = this[42];
    v27 = *(double **)(v26 + 16 * a2);
    v28 = *(double **)(v26 + 16 * a3);
    do
    {
      double v29 = *v27++;
      double v30 = v29;
      double v31 = *v28++;
      double *v24 = *v24 + a4 * (v30 - v31);
      ++v24;
    }
    while (v24 != v25);
  }
  return this;
}

uint64_t CPMLOnlineSvm::ChooseArgminJ(CPMLOnlineSvm *this)
{
  uint64_t v1 = *((void *)this + 43) - *((void *)this + 42);
  if (!v1)
  {
    double v5 = 1.79769313e308;
    goto LABEL_12;
  }
  uint64_t v2 = 0;
  uint64_t v3 = v1 >> 4;
  if ((unint64_t)(v1 >> 4) <= 1) {
    uint64_t v3 = 1;
  }
  double v4 = -1.0;
  double v5 = 1.79769313e308;
  do
  {
    if (*(double *)(*((void *)this + 39) + 8 * v2) > fmin(*((double *)this + 20)* *(double *)(*((void *)this + 45) + 8 * v2), 0.0)&& *(double *)(*((void *)this + 48) + 8 * v2) < v5)
    {
      double v4 = (double)(int)v2;
      double v5 = *(double *)(*((void *)this + 48) + 8 * v2);
    }
    ++v2;
  }
  while (v3 != v2);
  if (v4 == -1.0)
  {
LABEL_12:
    printf("current_min = %lf\n", v5);
    printf("# of sv = %lu\n", (uint64_t)(*((void *)this + 43) - *((void *)this + 42)) >> 4);
    exit(1);
  }
  return (int)v4;
}

uint64_t CPMLOnlineSvm::ChooseArgmaxI(CPMLOnlineSvm *this)
{
  uint64_t v1 = *((void *)this + 43) - *((void *)this + 42);
  if (!v1) {
    goto LABEL_11;
  }
  uint64_t v2 = 0;
  uint64_t v3 = v1 >> 4;
  if ((unint64_t)(v1 >> 4) <= 1) {
    uint64_t v3 = 1;
  }
  double v4 = -1.0;
  double v5 = -1.79769313e308;
  do
  {
    if (*(double *)(*((void *)this + 39) + 8 * v2) < fmax(*((double *)this + 20)* *(double *)(*((void *)this + 45) + 8 * v2), 0.0)&& *(double *)(*((void *)this + 48) + 8 * v2) > v5)
    {
      double v4 = (double)(int)v2;
      double v5 = *(double *)(*((void *)this + 48) + 8 * v2);
    }
    ++v2;
  }
  while (v3 != v2);
  if (v4 == -1.0) {
LABEL_11:
  }
    CPMLOnlineSvm::ChooseArgmaxI();
  return (int)v4;
}

double *CPMLOnlineSvm::Process(CPMLOnlineSvm *a1, uint64_t **a2, double a3)
{
  double v5 = *a2;
  v6 = a2[1];
  if (*a2 == v6)
  {
    double v8 = 0.0;
  }
  else
  {
    unint64_t v7 = (double *)*((void *)a1 + 52);
    double v8 = 0.0;
    do
    {
      double v9 = *(double *)v5++;
      double v10 = v9;
      double v11 = *v7++;
      double v8 = v8 + v10 * v11;
    }
    while (v5 != v6);
  }
  if (!((*((void *)a1 + 33) - *((void *)a1 + 32)) >> 14))
  {
    uint64_t v12 = (double *)*((void *)a1 + 39);
    uint64_t v13 = *((void *)a1 + 40) - (void)v12;
    if (v13)
    {
      unint64_t v14 = v13 >> 3;
      uint64_t v15 = (unint64_t *)*((void *)a1 + 54);
      unint64_t v16 = *((void *)a1 + 57) + 1;
      if (v14 <= 1) {
        unint64_t v14 = 1;
      }
      double v8 = 0.0;
      do
      {
        unint64_t v18 = *v15++;
        unint64_t v17 = v18;
        if (*((void *)a1 + 13) <= v18) {
          CPMLOnlineSvm::Update();
        }
        if (*((void *)a1 + 14) <= v16) {
          CPMLOnlineSvm::Update();
        }
        double v19 = *v12++;
        double v8 = v8
           + v19 * *(double *)(*((void *)a1 + 12) + 8 * (*((void *)a1 + 15) * v17 + *((void *)a1 + 16) * v16));
        --v14;
      }
      while (v14);
    }
    else
    {
      double v8 = 0.0;
    }
  }
  double v20 = a3 - v8;
  std::valarray<double>::valarray(&__p, a2);
  CPMLOnlineSvm::AddNewSv(a1, (uint64_t **)&__p, a3, 0.0, v20);
  if (__p)
  {
    if (v25 != __p) {
      v25 += ((unsigned char *)__p - v25 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    operator delete(__p);
    __p = 0;
    v25 = 0;
  }
  if (a3 == 1.0)
  {
    uint64_t v21 = ((uint64_t)(*((void *)a1 + 43) - *((void *)a1 + 42)) >> 4) - 1;
    uint64_t v22 = (int)CPMLOnlineSvm::ChooseArgminJ(a1);
  }
  else
  {
    uint64_t v21 = (int)CPMLOnlineSvm::ChooseArgmaxI(a1);
    uint64_t v22 = ((uint64_t)(*((void *)a1 + 43) - *((void *)a1 + 42)) >> 4) - 1;
  }
  return CPMLOnlineSvm::ConditionalUpdate((double *)a1, v21, v22);
}

void sub_2142FF828(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CPMLOnlineSvm::AddNewSv(void *a1, uint64_t **a2, double a3, double a4, double a5)
{
  std::vector<std::valarray<double>>::push_back[abi:ne180100](a1 + 42, a2);
  double v9 = (double *)a1[46];
  unint64_t v10 = a1[47];
  if ((unint64_t)v9 >= v10)
  {
    uint64_t v12 = (double *)a1[45];
    uint64_t v13 = v9 - v12;
    if ((unint64_t)(v13 + 1) >> 61) {
      goto LABEL_66;
    }
    unint64_t v14 = v10 - (void)v12;
    unint64_t v15 = (uint64_t)(v10 - (void)v12) >> 2;
    if (v15 <= v13 + 1) {
      unint64_t v15 = v13 + 1;
    }
    if (v14 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v15;
    }
    if (v16)
    {
      unint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 47), v16);
      uint64_t v12 = (double *)a1[45];
      double v9 = (double *)a1[46];
    }
    else
    {
      unint64_t v17 = 0;
    }
    unint64_t v18 = (double *)&v17[8 * v13];
    double v19 = &v17[8 * v16];
    *unint64_t v18 = a3;
    double v11 = v18 + 1;
    while (v9 != v12)
    {
      uint64_t v20 = *((void *)v9-- - 1);
      *((void *)v18-- - 1) = v20;
    }
    a1[45] = v18;
    a1[46] = v11;
    a1[47] = v19;
    if (v12) {
      operator delete(v12);
    }
  }
  else
  {
    *double v9 = a3;
    double v11 = v9 + 1;
  }
  a1[46] = v11;
  uint64_t v21 = (double *)a1[40];
  unint64_t v22 = a1[41];
  if ((unint64_t)v21 >= v22)
  {
    v24 = (double *)a1[39];
    uint64_t v25 = v21 - v24;
    if ((unint64_t)(v25 + 1) >> 61) {
      goto LABEL_66;
    }
    unint64_t v26 = v22 - (void)v24;
    unint64_t v27 = (uint64_t)(v22 - (void)v24) >> 2;
    if (v27 <= v25 + 1) {
      unint64_t v27 = v25 + 1;
    }
    if (v26 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v28 = v27;
    }
    if (v28)
    {
      double v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 41), v28);
      v24 = (double *)a1[39];
      uint64_t v21 = (double *)a1[40];
    }
    else
    {
      double v29 = 0;
    }
    double v30 = (double *)&v29[8 * v25];
    double v31 = &v29[8 * v28];
    *double v30 = a4;
    unint64_t v23 = v30 + 1;
    while (v21 != v24)
    {
      uint64_t v32 = *((void *)v21-- - 1);
      *((void *)v30-- - 1) = v32;
    }
    a1[39] = v30;
    a1[40] = v23;
    a1[41] = v31;
    if (v24) {
      operator delete(v24);
    }
  }
  else
  {
    *uint64_t v21 = a4;
    unint64_t v23 = v21 + 1;
  }
  a1[40] = v23;
  v33 = (double *)a1[49];
  unint64_t v34 = a1[50];
  if ((unint64_t)v33 < v34)
  {
    double *v33 = a5;
    v35 = v33 + 1;
    goto LABEL_49;
  }
  v36 = (double *)a1[48];
  uint64_t v37 = v33 - v36;
  if ((unint64_t)(v37 + 1) >> 61) {
LABEL_66:
  }
    std::vector<double>::__throw_length_error[abi:ne180100]();
  unint64_t v38 = v34 - (void)v36;
  unint64_t v39 = (uint64_t)(v34 - (void)v36) >> 2;
  if (v39 <= v37 + 1) {
    unint64_t v39 = v37 + 1;
  }
  if (v38 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v40 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v40 = v39;
  }
  if (v40)
  {
    v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 50), v40);
    v36 = (double *)a1[48];
    v33 = (double *)a1[49];
  }
  else
  {
    v41 = 0;
  }
  v42 = (double *)&v41[8 * v37];
  v43 = &v41[8 * v40];
  double *v42 = a5;
  v35 = v42 + 1;
  while (v33 != v36)
  {
    uint64_t v44 = *((void *)v33-- - 1);
    *((void *)v42-- - 1) = v44;
  }
  a1[48] = v42;
  a1[49] = v35;
  a1[50] = v43;
  if (v36) {
    operator delete(v36);
  }
LABEL_49:
  a1[49] = v35;
  unint64_t v45 = a1[56];
  uint64_t v46 = a1[57] + 1;
  a1[57] = v46;
  v47 = (uint64_t *)a1[55];
  if ((unint64_t)v47 >= v45)
  {
    v49 = (uint64_t *)a1[54];
    uint64_t v50 = v47 - v49;
    if ((unint64_t)(v50 + 1) >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v51 = v45 - (void)v49;
    unint64_t v52 = (uint64_t)(v45 - (void)v49) >> 2;
    if (v52 <= v50 + 1) {
      unint64_t v52 = v50 + 1;
    }
    if (v51 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v53 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v53 = v52;
    }
    if (v53)
    {
      v54 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 56), v53);
      v49 = (uint64_t *)a1[54];
      v47 = (uint64_t *)a1[55];
      uint64_t v46 = a1[57];
    }
    else
    {
      v54 = 0;
    }
    v55 = (uint64_t *)&v54[8 * v50];
    v56 = &v54[8 * v53];
    uint64_t *v55 = v46;
    v48 = v55 + 1;
    while (v47 != v49)
    {
      uint64_t v57 = *--v47;
      *--v55 = v57;
    }
    a1[54] = v55;
    a1[55] = v48;
    a1[56] = v56;
    if (v49) {
      operator delete(v49);
    }
  }
  else
  {
    uint64_t *v47 = v46;
    v48 = v47 + 1;
  }
  a1[55] = v48;
}

uint64_t std::valarray<double>::~valarray(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)a1;
  if (v2)
  {
    uint64_t v3 = *(unsigned char **)(a1 + 8);
    if (v3 != v2) {
      *(void *)(a1 + 8) = &v3[(v2 - v3 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v2);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
  }
  return a1;
}

void CPMLOnlineSvm::Train(CPMLOnlineSvm *this)
{
  CPMLOnlineSvm::Init(this);

  CPMLOnlineSvm::OnlineIteration(this);
}

void CPMLOnlineSvm::Init(CPMLOnlineSvm *this)
{
  uint64_t v2 = (uint64_t)(*((void *)this + 33) - *((void *)this + 32)) >> 4;
  CoreMatrix::Matrix<double>::Resize((void *)this + 12, v2 * v2);
  *((void *)this + 13) = v2;
  *((void *)this + 14) = v2;
  int v3 = *((_DWORD *)this + 36);
  BOOL v4 = v3 == 1;
  if (v3 == 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v2;
  }
  if (v4) {
    uint64_t v6 = v2;
  }
  else {
    uint64_t v6 = 1;
  }
  *((void *)this + 15) = v5;
  *((void *)this + 16) = v6;
  unint64_t v7 = (uint64_t **)*((void *)this + 32);
  double v8 = (uint64_t **)*((void *)this + 33);
  if (v8 == v7)
  {
    unint64_t v7 = (uint64_t **)*((void *)this + 33);
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    do
    {
      unint64_t v11 = ((char *)v8 - (char *)v7) >> 4;
      uint64_t v12 = v9;
      for (unint64_t i = v10; v11 > i; v12 += 16)
      {
        if (*((void *)this + 28))
        {
          double v14 = CPMLOnlineSvm::SparseKernel((uint64_t)this, (char **)(*((void *)this + 35) + 16 * v10), (char **)(*((void *)this + 35) + v12));
          unint64_t v15 = *((void *)this + 13);
          if (v15 <= v10) {
            CPMLOnlineSvm::Update();
          }
          unint64_t v16 = *((void *)this + 14);
          if (v16 <= i) {
            CPMLOnlineSvm::Update();
          }
          uint64_t v17 = *((void *)this + 12);
          uint64_t v18 = *((void *)this + 15);
          uint64_t v19 = *((void *)this + 16);
          *(double *)(v17 + 8 * (v18 * v10 + v19 * i)) = v14;
          if (v15 <= i) {
            CPMLOnlineSvm::Update();
          }
          if (v16 <= v10) {
            CPMLOnlineSvm::Update();
          }
        }
        else
        {
          double v14 = CPMLOnlineSvm::DenseKernel((uint64_t)this, (uint64_t)&v7[2 * v10], (double **)((char *)v7 + v12));
          unint64_t v20 = *((void *)this + 13);
          if (v20 <= v10) {
            CPMLOnlineSvm::Update();
          }
          unint64_t v21 = *((void *)this + 14);
          if (v21 <= i) {
            CPMLOnlineSvm::Update();
          }
          uint64_t v17 = *((void *)this + 12);
          uint64_t v18 = *((void *)this + 15);
          uint64_t v19 = *((void *)this + 16);
          *(double *)(v17 + 8 * (v18 * v10 + v19 * i)) = v14;
          if (v20 <= i) {
            CPMLOnlineSvm::Update();
          }
          if (v21 <= v10) {
            CPMLOnlineSvm::Update();
          }
        }
        *(double *)(v17 + 8 * (v18 * i++ + v19 * v10)) = v14;
        unint64_t v7 = (uint64_t **)*((void *)this + 32);
        double v8 = (uint64_t **)*((void *)this + 33);
        unint64_t v11 = ((char *)v8 - (char *)v7) >> 4;
      }
      ++v10;
      v9 += 16;
    }
    while (v11 > v10);
  }
  int v22 = **((_DWORD **)this + 29);
  std::valarray<double>::valarray(&__p, v7);
  CPMLOnlineSvm::AddNewSv(this, (uint64_t **)&__p, (double)v22, 0.0, (double)v22);
  if (__p)
  {
    if (v47 != __p) {
      v47 += ((unsigned char *)__p - v47 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    operator delete(__p);
    __p = 0;
    v47 = 0;
  }
  if (*(_DWORD *)(*((void *)this + 29) + 4) == v22)
  {
    uint64_t v23 = 0;
    uint64_t v24 = 16;
    do
    {
      std::valarray<double>::valarray(&v44, (uint64_t **)(*((void *)this + 32) + v24));
      double v25 = (double)*(int *)(*((void *)this + 29) + 4 * v23 + 4);
      CPMLOnlineSvm::AddNewSv(this, (uint64_t **)&v44, v25, 0.0, v25);
      if (v44)
      {
        if (v45 != v44) {
          v45 += ((unsigned char *)v44 - v45 + 7) & 0xFFFFFFFFFFFFFFF8;
        }
        operator delete(v44);
        uint64_t v44 = 0;
        unint64_t v45 = 0;
      }
      int v26 = *(_DWORD *)(*((void *)this + 29) + 4 * v23++ + 8);
      v24 += 16;
    }
    while (v26 == v22);
    uint64_t v27 = (v23 + 2);
    uint64_t v28 = v23 + 1;
  }
  else
  {
    uint64_t v28 = 1;
    uint64_t v27 = 2;
  }
  std::valarray<double>::valarray(&v42, (uint64_t **)(*((void *)this + 32) + 16 * v28));
  double v29 = (double)*(int *)(*((void *)this + 29) + 4 * v28);
  CPMLOnlineSvm::AddNewSv(this, (uint64_t **)&v42, v29, 0.0, v29);
  if (v42)
  {
    if (v43 != v42) {
      v43 += ((unsigned char *)v42 - v43 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    operator delete(v42);
    v42 = 0;
    v43 = 0;
  }
  uint64_t v30 = *((void *)this + 42);
  unint64_t v31 = (*((void *)this + 43) - v30) >> 4;
  if (*((void *)this + 43) == v30)
  {
    *((void *)this + 58) = v27;
  }
  else
  {
    uint64_t v32 = 0;
    uint64_t v33 = *((void *)this + 39);
    unint64_t v34 = (double *)*((void *)this + 52);
    v35 = (double *)*((void *)this + 53);
    if (v31 <= 1) {
      uint64_t v36 = 1;
    }
    else {
      uint64_t v36 = (*((void *)this + 43) - v30) >> 4;
    }
    do
    {
      if (v34 != v35)
      {
        uint64_t v37 = *(double **)(v30 + 16 * v32);
        unint64_t v38 = v34;
        do
        {
          double v39 = *v37++;
          *unint64_t v38 = *v38 + v39 * *(double *)(v33 + 8 * v32);
          ++v38;
        }
        while (v38 != v35);
      }
      ++v32;
    }
    while (v32 != v36);
    uint64_t v40 = 0;
    *((void *)this + 58) = v27;
    uint64_t v41 = *((void *)this + 54);
    do
    {
      *(void *)(v41 + 8 * v40) = v40;
      ++v40;
    }
    while (v36 != v40);
  }
  *((void *)this + 57) = v31 - 1;
}

void sub_2142FFF94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, unsigned char *__p, unsigned char *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (__p)
  {
    if (a10 != __p) {
      *(void *)(v14 + 8) = &a10[(__p - a10 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CPMLOnlineSvm::OnlineIteration(CPMLOnlineSvm *this)
{
  unint64_t v2 = *((void *)this + 58);
  uint64_t v3 = *((void *)this + 32);
  BOOL v4 = (FILE **)MEMORY[0x263EF8358];
  if (v2 < (*((void *)this + 33) - v3) >> 4)
  {
    uint64_t v5 = 16 * v2;
    do
    {
      if (500 * (v2 / 0x1F4) == v2)
      {
        uint64_t v6 = (void *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"... ", 4);
        fflush(*v4);
        uint64_t v3 = *((void *)this + 32);
      }
      CPMLOnlineSvm::Process(this, (uint64_t **)(v3 + v5), (double)*(int *)(*((void *)this + 29) + 4 * v2));
      CPMLOnlineSvm::Reprocess(this);
      ++v2;
      uint64_t v3 = *((void *)this + 32);
      v5 += 16;
    }
    while (v2 < (*((void *)this + 33) - v3) >> 4);
  }
  if (*((int *)this + 45) >= 1)
  {
    int v7 = 0;
    do
    {
      if (*((double *)this + 51) <= *((double *)this + 21)) {
        break;
      }
      if (1000 * (v7 / 0x3E8u) == v7)
      {
        double v8 = (void *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)" (", 2);
        uint64_t v9 = (void *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)")... ", 5);
        fflush(*v4);
      }
      CPMLOnlineSvm::Reprocess(this);
      ++v7;
    }
    while (v7 < *((_DWORD *)this + 45));
  }
}

void *std::vector<std::valarray<double>>::push_back[abi:ne180100](uint64_t *a1, uint64_t **a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - *a1) >> 4;
    if ((unint64_t)(v10 + 1) >> 60) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - *a1;
    uint64_t v12 = v11 >> 3;
    if (v11 >> 3 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v19 = v4;
    if (v13) {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::valarray<char>>>(v4, v13);
    }
    else {
      uint64_t v14 = 0;
    }
    unint64_t v15 = v14;
    unint64_t v16 = &v14[16 * v10];
    uint64_t v18 = &v14[16 * v13];
    std::valarray<double>::valarray(v16, a2);
    uint64_t v17 = v16 + 16;
    std::vector<std::valarray<double>>::__swap_out_circular_buffer(a1, &v15);
    uint64_t v9 = a1[1];
    result = std::__split_buffer<std::valarray<double>>::~__split_buffer(&v15);
  }
  else
  {
    result = std::valarray<double>::valarray(*(void **)(v4 - 8), a2);
    uint64_t v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return result;
}

void sub_21430029C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

double CPMLOnlineSvm::Reprocess(CPMLOnlineSvm *this)
{
  int v2 = CPMLOnlineSvm::ChooseArgmaxI(this);
  int v3 = CPMLOnlineSvm::ChooseArgminJ(this);
  CPMLOnlineSvm::ConditionalUpdate((double *)this, v2, v3);
  int v4 = CPMLOnlineSvm::ChooseArgmaxI(this);
  int v5 = CPMLOnlineSvm::ChooseArgminJ(this);
  uint64_t v6 = *((void *)this + 43) - *((void *)this + 42);
  if (v6)
  {
    uint64_t v7 = 0;
    int v8 = 0;
    unint64_t v9 = v6 >> 4;
    do
    {
      uint64_t v10 = *((void *)this + 39);
      if (*(double *)(v10 + 8 * v7) == 0.0)
      {
        if ((double v11 = *(double *)(*((void *)this + 45) + 8 * v7), v11 == 1.0)
          && *(double *)(*((void *)this + 48) + 8 * v7) <= *(double *)(*((void *)this + 48) + 8 * v5)
          || v11 != 1.0
          && *(double *)(*((void *)this + 48) + 8 * v7) >= *(double *)(*((void *)this + 48) + 8 * v4))
        {
          uint64_t v12 = (double **)(*((void *)this + 42) + 16 * v7);
          unint64_t v13 = (double *)*((void *)this + 52);
          uint64_t v14 = (double *)*((void *)this + 53);
          if (v13 != v14)
          {
            unint64_t v15 = *v12;
            do
            {
              double v16 = *v15++;
              *unint64_t v13 = *v13 - *(double *)(v10 + 8 * v7) * v16;
              ++v13;
            }
            while (v13 != v14);
          }
          std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::valarray<double> *,std::valarray<double> *,std::valarray<double> *>((uint64_t)&v38, (uint64_t)(v12 + 2), *((void *)this + 43), (uint64_t)v12);
          uint64_t v18 = v17;
          uint64_t v19 = *((void *)this + 43);
          if (v19 != v17)
          {
            do
            {
              v19 -= 16;
              std::allocator<std::valarray<double>>::destroy[abi:ne180100]((uint64_t)this + 352, v19);
            }
            while (v19 != v18);
          }
          *((void *)this + 43) = v18;
          uint64_t v20 = *((void *)this + 45);
          uint64_t v21 = *((void *)this + 46);
          uint64_t v22 = v20 + 8 * v7;
          uint64_t v23 = v21 - (v22 + 8);
          if (v21 != v22 + 8) {
            memmove((void *)(v20 + 8 * v7), (const void *)(v22 + 8), v21 - (v22 + 8));
          }
          *((void *)this + 46) = v22 + v23;
          uint64_t v24 = *((void *)this + 39);
          uint64_t v25 = *((void *)this + 40);
          uint64_t v26 = v24 + 8 * v7;
          uint64_t v27 = v25 - (v26 + 8);
          if (v25 != v26 + 8) {
            memmove((void *)(v24 + 8 * v7), (const void *)(v26 + 8), v25 - (v26 + 8));
          }
          *((void *)this + 40) = v26 + v27;
          uint64_t v28 = *((void *)this + 48);
          uint64_t v29 = *((void *)this + 49);
          uint64_t v30 = v28 + 8 * v7;
          uint64_t v31 = v29 - (v30 + 8);
          if (v29 != v30 + 8) {
            memmove((void *)(v28 + 8 * v7), (const void *)(v30 + 8), v29 - (v30 + 8));
          }
          *((void *)this + 49) = v30 + v31;
          uint64_t v32 = *((void *)this + 54);
          uint64_t v33 = *((void *)this + 55);
          uint64_t v34 = v32 + 8 * v7;
          uint64_t v35 = v33 - (v34 + 8);
          if (v33 != v34 + 8) {
            memmove((void *)(v32 + 8 * v7), (const void *)(v34 + 8), v33 - (v34 + 8));
          }
          *((void *)this + 55) = v34 + v35;
          v4 -= v4 > v8;
          v5 -= v5 > v8;
          --v9;
          --v8;
        }
      }
      uint64_t v7 = ++v8;
    }
    while (v9 > v8);
  }
  uint64_t v36 = *((void *)this + 48);
  *((double *)this + 38) = (*(double *)(v36 + 8 * v4) + *(double *)(v36 + 8 * v5)) * 0.5;
  double result = *(double *)(v36 + 8 * v4) - *(double *)(v36 + 8 * v5);
  *((double *)this + 51) = result;
  return result;
}

double CPMLOnlineSvm::SparseKernel(uint64_t a1, char **a2, char **a3)
{
  int v4 = *(_DWORD *)(a1 + 152);
  if (v4 == 2)
  {
    return CPMLOnlineSvm::RbfSparseKernel(a1, (uint64_t)a2, (uint64_t)a3);
  }
  else if (v4 == 1)
  {
    double v6 = *(double *)(a1 + 192);
    int v7 = CPMLOnlineSvm::LinearSparseKernel(a1, a2, a3);
    long double v8 = *(double *)(a1 + 208);
    double v9 = *(double *)(a1 + 200) + v6 * (double)v7;
    return pow(v9, v8);
  }
  else
  {
    if (v4)
    {
      uint64_t v10 = std::operator<<[abi:ne180100]<std::char_traits<char>>(MEMORY[0x263F8C0F8], "Only three kernels are supported now: linear, poly, and rbf.");
      std::endl[abi:ne180100]<char,std::char_traits<char>>(v10);
      exit(1);
    }
    return (double)(int)CPMLOnlineSvm::LinearSparseKernel(a1, a2, a3);
  }
}

double CPMLOnlineSvm::DenseKernel(uint64_t a1, uint64_t a2, double **a3)
{
  int v3 = *(_DWORD *)(a1 + 152);
  if (v3 == 2)
  {
    return CPMLOnlineSvm::RbfDenseKernel(a1, a2, (uint64_t)a3);
  }
  else if (v3 == 1)
  {
    return CPMLOnlineSvm::PolyDenseKernel((double *)a1, (double **)a2, a3);
  }
  else
  {
    if (v3)
    {
      double v11 = std::operator<<[abi:ne180100]<std::char_traits<char>>(MEMORY[0x263F8C0F8], "Only three kernels are supported now: linear, poly, and rbf.");
      std::endl[abi:ne180100]<char,std::char_traits<char>>(v11);
      exit(1);
    }
    int v4 = *(double **)a2;
    int v5 = *(double **)(a2 + 8);
    if (*(double **)a2 == v5)
    {
      return 0.0;
    }
    else
    {
      double v6 = *a3;
      double result = 0.0;
      do
      {
        double v8 = *v4++;
        double v9 = v8;
        double v10 = *v6++;
        double result = result + v9 * v10;
      }
      while (v4 != v5);
    }
  }
  return result;
}

void *std::operator<<[abi:ne180100]<std::char_traits<char>>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);

  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)__s, v4);
}

uint64_t CPMLOnlineSvm::Evaluate(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a1 + 304);
  uint64_t v3 = *(void *)(a1 + 336);
  uint64_t v4 = *(void *)(a1 + 344);
  if (v4 != v3)
  {
    unint64_t v7 = 0;
    do
    {
      switch(*(_DWORD *)(a1 + 152))
      {
        case 0:
          double v8 = *(double **)a2;
          double v9 = *(double **)(a2 + 8);
          if (*(double **)a2 == v9)
          {
            double v11 = 0.0;
          }
          else
          {
            double v10 = *(double **)(v3 + 16 * v7);
            double v11 = 0.0;
            do
            {
              double v12 = *v8++;
              double v13 = v12;
              double v14 = *v10++;
              double v11 = v11 + v13 * v14;
            }
            while (v8 != v9);
          }
          double v2 = v2 + *(double *)(*(void *)(a1 + 312) + 8 * v7) * v11;
          break;
        case 1:
          double v15 = *(double *)(*(void *)(a1 + 312) + 8 * v7);
          double v16 = CPMLOnlineSvm::PolyDenseKernel((double *)a1, (double **)a2, (double **)(v3 + 16 * v7));
          goto LABEL_11;
        case 2:
          double v17 = *(double *)(*(void *)(a1 + 312) + 8 * v7);
          double v2 = v2 + v17 * CPMLOnlineSvm::RbfDenseKernel(a1, a2, v3 + 16 * v7);
          uint64_t v3 = *(void *)(a1 + 336);
          uint64_t v4 = *(void *)(a1 + 344);
          break;
        case 3:
          double v15 = *(double *)(*(void *)(a1 + 312) + 8 * v7);
          double v16 = CPMLOnlineSvm::SigmoidDenseKernel(a1, (double **)a2, (double **)(v3 + 16 * v7));
LABEL_11:
          double v2 = v2 + v15 * v16;
          break;
        default:
          break;
      }
      ++v7;
    }
    while (v7 < (v4 - v3) >> 4);
  }
  if (v2 > 0.0) {
    return 1;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

double CPMLOnlineSvm::LinearDenseKernel(uint64_t a1, double **a2, double **a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  if (*a2 == v4) {
    return 0.0;
  }
  int v5 = *a3;
  double result = 0.0;
  do
  {
    double v7 = *v3++;
    double v8 = v7;
    double v9 = *v5++;
    double result = result + v8 * v9;
  }
  while (v3 != v4);
  return result;
}

double CPMLOnlineSvm::RbfDenseKernel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v12[1] = a2;
  *(void *)&v12[2] = a3;
  std::__val_expr<std::_BinaryOp<std::minus<double>,std::valarray<double>,std::valarray<double>>>::operator std::valarray<double>(v12, &v13);
  uint64_t v4 = v13;
  int v5 = v14;
  double v6 = (char *)((char *)v13 - (char *)v14);
  if (v13 == v14)
  {
    double v10 = exp(*(double *)(a1 + 184) * -0.0);
    if (v4) {
      goto LABEL_7;
    }
  }
  else
  {
    double v7 = 0.0;
    double v8 = v13;
    do
    {
      double v9 = *v8++;
      double v7 = v7 + v9 * v9;
    }
    while (v8 != v14);
    double v10 = exp(-(*(double *)(a1 + 184) * v7));
    if (v4)
    {
      double v14 = (double *)((char *)v5 + ((unint64_t)(v6 + 7) & 0xFFFFFFFFFFFFFFF8));
LABEL_7:
      operator delete(v4);
    }
  }
  return v10;
}

double CPMLOnlineSvm::PolyDenseKernel(double *a1, double **a2, double **a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  if (*a2 == v4)
  {
    double v6 = 0.0;
  }
  else
  {
    int v5 = *a3;
    double v6 = 0.0;
    do
    {
      double v7 = *v3++;
      double v8 = v7;
      double v9 = *v5++;
      double v6 = v6 + v8 * v9;
    }
    while (v3 != v4);
  }
  double v10 = a1[25] + a1[24] * v6;
  long double v11 = a1[26];
  if (v11 == 2.0) {
    return v10 * v10;
  }
  if (v11 == 3.0) {
    return v10 * (v10 * v10);
  }
  return pow(v10, v11);
}

double CPMLOnlineSvm::SigmoidDenseKernel(uint64_t a1, double **a2, double **a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  if (*a2 == v4)
  {
    double v6 = 0.0;
  }
  else
  {
    int v5 = *a3;
    double v6 = 0.0;
    do
    {
      double v7 = *v3++;
      double v8 = v7;
      double v9 = *v5++;
      double v6 = v6 + v8 * v9;
    }
    while (v3 != v4);
  }
  return tanh(*(double *)(a1 + 200) + *(double *)(a1 + 192) * v6);
}

uint64_t CPMLOnlineSvm::serialize(CPMLOnlineSvm *this)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)this + 11);
  uint64_t v3 = (char *)this + 8;
  size_t v4 = strlen((const char *)this + 8);
  (*(void (**)(uint64_t, char *, const char *, size_t, void))(*(void *)v2 + 56))(v2, v3, "version", v4, 0);
  int v5 = (void *)*((void *)this + 42);
  uint64_t v6 = (uint64_t)(v5[1] - *v5) >> 3;
  unint64_t v11 = (uint64_t)(*((void *)this + 43) - (void)v5) >> 4;
  unint64_t v12 = v6;
  (*(void (**)(void, unint64_t *, const char *, uint64_t, void))(**((void **)this + 11) + 16))(*((void *)this + 11), &v12, "num_feature", 1, 0);
  (*(void (**)(void, unint64_t *, const char *, uint64_t, void))(**((void **)this + 11) + 16))(*((void *)this + 11), &v11, "num_sv", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), (char *)this + 304, "bias_", 1, 0);
  (*(void (**)(void, void, const char *, unint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 39), "alphas_", v11, 0);
  if (v11)
  {
    for (unint64_t i = 0; i < v11; ++i)
    {
      sprintf(v13, "support_vectors_%d", i);
      if (v12)
      {
        uint64_t v8 = 0;
        for (unint64_t j = 0; j < v12; ++j)
        {
          (*(void (**)(void, uint64_t, char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *(void *)(*((void *)this + 42) + 16 * i) + v8, v13, 1, 0);
          v8 += 8;
        }
      }
    }
  }
  return 0;
}

uint64_t CPMLOnlineSvm::Serialize(uint64_t a1)
{
  v31[19] = *MEMORY[0x263EF8340];
  std::ofstream::basic_ofstream(&v29);
  if ((v30[*(void *)(v29 - 24) + 24] & 5) != 0)
  {
    uint64_t v27 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C0F8], (uint64_t)"cannot open output file", 23);
    std::endl[abi:ne180100]<char,std::char_traits<char>>(v27);
    exit(1);
  }
  uint64_t v2 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v2 + *(void *)(*v2 - 24)));
  uint64_t v3 = std::locale::use_facet(&v28, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v3->__vftable[2].~facet_0)(v3, 10);
  std::locale::~locale(&v28);
  std::ostream::put();
  std::ostream::flush();
  size_t v4 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(void *)(*v4 - 24)));
  int v5 = std::locale::use_facet(&v28, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 10);
  std::locale::~locale(&v28);
  std::ostream::put();
  std::ostream::flush();
  uint64_t v6 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v6 + *(void *)(*v6 - 24)));
  double v7 = std::locale::use_facet(&v28, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 10);
  std::locale::~locale(&v28);
  std::ostream::put();
  std::ostream::flush();
  uint64_t v8 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v8 + *(void *)(*v8 - 24)));
  double v9 = std::locale::use_facet(&v28, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v9->__vftable[2].~facet_0)(v9, 10);
  std::locale::~locale(&v28);
  std::ostream::put();
  std::ostream::flush();
  int v10 = *(_DWORD *)(a1 + 152);
  switch(v10)
  {
    case 1:
      double v13 = (void *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v13 + *(void *)(*v13 - 24)));
      uint64_t v14 = std::locale::use_facet(&v28, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v14->__vftable[2].~facet_0)(v14, 10);
      std::locale::~locale(&v28);
      std::ostream::put();
      std::ostream::flush();
      double v15 = (void *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v15 + *(void *)(*v15 - 24)));
      double v16 = std::locale::use_facet(&v28, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v16->__vftable[2].~facet_0)(v16, 10);
      std::locale::~locale(&v28);
      std::ostream::put();
      std::ostream::flush();
      break;
    case 3:
      unint64_t v11 = (void *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v11 + *(void *)(*v11 - 24)));
      unint64_t v12 = std::locale::use_facet(&v28, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 10);
      std::locale::~locale(&v28);
      std::ostream::put();
      std::ostream::flush();
      break;
    case 2:
      break;
    default:
      goto LABEL_9;
  }
  double v17 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  uint64_t v18 = std::locale::use_facet(&v28, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v18->__vftable[2].~facet_0)(v18, 10);
  std::locale::~locale(&v28);
  std::ostream::put();
  std::ostream::flush();
LABEL_9:
  std::ostream::operator<<();
  if (*(void *)(a1 + 320) - *(void *)(a1 + 312) >= 9uLL)
  {
    unint64_t v19 = 1;
    do
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v29, (uint64_t)" ", 1);
      std::ostream::operator<<();
      ++v19;
    }
    while (v19 < (uint64_t)(*(void *)(a1 + 320) - *(void *)(a1 + 312)) >> 3);
  }
  uint64_t v20 = *(void *)(a1 + 336);
  if (*(void *)(a1 + 344) != v20)
  {
    unint64_t v21 = 0;
    uint64_t v22 = (std::locale::id *)MEMORY[0x263F8C108];
    do
    {
      std::ios_base::getloc((const std::ios_base *)&v30[*(void *)(v29 - 24) - 8]);
      uint64_t v23 = std::locale::use_facet(&v28, v22);
      ((void (*)(const std::locale::facet *, uint64_t))v23->__vftable[2].~facet_0)(v23, 10);
      std::locale::~locale(&v28);
      std::ostream::put();
      std::ostream::flush();
      std::ostream::operator<<();
      uint64_t v24 = (void *)(v20 + 16 * v21);
      if (v24[1] - *v24 >= 9uLL)
      {
        unint64_t v25 = 1;
        do
        {
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v29, (uint64_t)" ", 1);
          std::ostream::operator<<();
          ++v25;
        }
        while (v25 < (uint64_t)(v24[1] - *v24) >> 3);
      }
      ++v21;
      uint64_t v20 = *(void *)(a1 + 336);
    }
    while (v21 < (*(void *)(a1 + 344) - v20) >> 4);
  }
  uint64_t v29 = *MEMORY[0x263F8C2B0];
  *(void *)&v30[*(void *)(v29 - 24) - 8] = *(void *)(MEMORY[0x263F8C2B0] + 24);
  MEMORY[0x21669DA00](v30);
  std::ostream::~ostream();
  return MEMORY[0x21669DB40](v31);
}

void sub_214301384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10, uint64_t a11)
{
}

uint64_t *std::ofstream::basic_ofstream(uint64_t *a1)
{
  uint64_t v2 = MEMORY[0x263F8C310] + 64;
  a1[52] = MEMORY[0x263F8C310] + 64;
  uint64_t v3 = a1 + 1;
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2B0] + 16);
  uint64_t v5 = *(void *)(MEMORY[0x263F8C2B0] + 8);
  *a1 = v5;
  *(uint64_t *)((char *)a1 + *(void *)(v5 - 24)) = v4;
  uint64_t v6 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v6, a1 + 1);
  uint64_t v7 = MEMORY[0x263F8C310] + 24;
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *a1 = v7;
  a1[52] = v2;
  MEMORY[0x21669D9F0](v3);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 4);
  }
  return a1;
}

void sub_214301570(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x21669DB40](v1);
  _Unwind_Resume(a1);
}

void *std::endl[abi:ne180100]<char,std::char_traits<char>>(void *a1)
{
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
  uint64_t v2 = std::locale::use_facet(&v4, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

void sub_21430164C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

void *std::ofstream::~ofstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B0];
  uint64_t v3 = *MEMORY[0x263F8C2B0];
  *a1 = *MEMORY[0x263F8C2B0];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x21669DA00](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x21669DB40](a1 + 52);
  return a1;
}

uint64_t CPMLOnlineSvm::PrintParam(CPMLOnlineSvm *this)
{
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"kernel = ", 9);
  uint64_t v1 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v1 + *(void *)(*v1 - 24)));
  uint64_t v2 = std::locale::use_facet(&v24, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v24);
  std::ostream::put();
  std::ostream::flush();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"param_C = ", 10);
  uint64_t v3 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v3 + *(void *)(*v3 - 24)));
  std::locale v4 = std::locale::use_facet(&v24, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v4->__vftable[2].~facet_0)(v4, 10);
  std::locale::~locale(&v24);
  std::ostream::put();
  std::ostream::flush();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"tolerance = ", 12);
  uint64_t v5 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v5 + *(void *)(*v5 - 24)));
  uint64_t v6 = std::locale::use_facet(&v24, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v6->__vftable[2].~facet_0)(v6, 10);
  std::locale::~locale(&v24);
  std::ostream::put();
  std::ostream::flush();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"num_online_reprocess = ", 23);
  uint64_t v7 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v7 + *(void *)(*v7 - 24)));
  uint64_t v8 = std::locale::use_facet(&v24, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
  std::locale::~locale(&v24);
  std::ostream::put();
  std::ostream::flush();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"num_final_reprocess = ", 22);
  double v9 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
  int v10 = std::locale::use_facet(&v24, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
  std::locale::~locale(&v24);
  std::ostream::put();
  std::ostream::flush();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"rbf_gamma = ", 12);
  unint64_t v11 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v11 + *(void *)(*v11 - 24)));
  unint64_t v12 = std::locale::use_facet(&v24, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 10);
  std::locale::~locale(&v24);
  std::ostream::put();
  std::ostream::flush();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"prod_slope = ", 13);
  double v13 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v13 + *(void *)(*v13 - 24)));
  uint64_t v14 = std::locale::use_facet(&v24, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v14->__vftable[2].~facet_0)(v14, 10);
  std::locale::~locale(&v24);
  std::ostream::put();
  std::ostream::flush();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"prod_intercept = ", 17);
  double v15 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v15 + *(void *)(*v15 - 24)));
  double v16 = std::locale::use_facet(&v24, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v16->__vftable[2].~facet_0)(v16, 10);
  std::locale::~locale(&v24);
  std::ostream::put();
  std::ostream::flush();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"poly_degree = ", 14);
  double v17 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  uint64_t v18 = std::locale::use_facet(&v24, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v18->__vftable[2].~facet_0)(v18, 10);
  std::locale::~locale(&v24);
  std::ostream::put();
  std::ostream::flush();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"num_features = ", 15);
  unint64_t v19 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v19 + *(void *)(*v19 - 24)));
  uint64_t v20 = std::locale::use_facet(&v24, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v20->__vftable[2].~facet_0)(v20, 10);
  std::locale::~locale(&v24);
  std::ostream::put();
  std::ostream::flush();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"num_compact_features = ", 23);
  unint64_t v21 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v21 + *(void *)(*v21 - 24)));
  uint64_t v22 = std::locale::use_facet(&v24, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v22->__vftable[2].~facet_0)(v22, 10);
  std::locale::~locale(&v24);
  std::ostream::put();
  return std::ostream::flush();
}

void sub_214301E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

uint64_t CPMLOnlineSvm::Deserialize(uint64_t a1)
{
  v22[19] = *MEMORY[0x263EF8340];
  std::ifstream::basic_ifstream(v20);
  if ((v21[*(void *)(v20[0] - 24) + 16] & 5) != 0)
  {
    uint64_t v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C0F8], (uint64_t)"cannot open input file", 22);
    std::endl[abi:ne180100]<char,std::char_traits<char>>(v14);
    exit(1);
  }
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  MEMORY[0x21669DA40](v20, &v19);
  MEMORY[0x21669DA40](v20, &v18);
  MEMORY[0x21669DA20](v20, a1 + 304);
  int v17 = 0;
  MEMORY[0x21669DA30](v20, &v17);
  int v2 = v17;
  *(_DWORD *)(a1 + 152) = v17;
  switch(v2)
  {
    case 1:
      MEMORY[0x21669DA20](v20, a1 + 192);
      MEMORY[0x21669DA20](v20, a1 + 200);
      uint64_t v3 = a1 + 208;
      break;
    case 2:
      uint64_t v3 = a1 + 184;
      break;
    case 3:
      MEMORY[0x21669DA20](v20, a1 + 192);
      uint64_t v3 = a1 + 200;
      break;
    default:
      goto LABEL_9;
  }
  MEMORY[0x21669DA20](v20, v3);
LABEL_9:
  std::vector<double>::resize(a1 + 312, v18);
  uint64_t v4 = *(void *)(a1 + 312);
  if (*(void *)(a1 + 320) != v4)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      MEMORY[0x21669DA20](v20, v4 + v5);
      ++v6;
      uint64_t v4 = *(void *)(a1 + 312);
      v5 += 8;
    }
    while (v6 < (*(void *)(a1 + 320) - v4) >> 3);
  }
  if (v18)
  {
    unint64_t v7 = 0;
    uint64_t v8 = (uint64_t *)(a1 + 336);
    do
    {
      __p = 0;
      double v16 = 0;
      if (v19)
      {
        if (v19 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        size_t v9 = 8 * v19;
        int v10 = (char *)operator new(8 * v19);
        __p = v10;
        bzero(v10, v9);
        uint64_t v11 = 0;
        unint64_t v12 = 0;
        double v16 = &v10[v9];
        do
        {
          MEMORY[0x21669DA20](v20, &v10[v11]);
          ++v12;
          int v10 = (char *)__p;
          v11 += 8;
        }
        while (v12 < (v16 - (unsigned char *)__p) >> 3);
      }
      std::vector<std::valarray<double>>::push_back[abi:ne180100](v8, (uint64_t **)&__p);
      if (__p)
      {
        if (v16 != __p) {
          v16 += ((unsigned char *)__p - v16 + 7) & 0xFFFFFFFFFFFFFFF8;
        }
        operator delete(__p);
      }
      ++v7;
    }
    while (v18 > v7);
  }
  v20[0] = *MEMORY[0x263F8C2A8];
  *(uint64_t *)((char *)v20 + *(void *)(v20[0] - 24)) = *(void *)(MEMORY[0x263F8C2A8] + 24);
  MEMORY[0x21669DA00](v21);
  std::istream::~istream();
  return MEMORY[0x21669DB40](v22);
}

void sub_214302164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
}

uint64_t *std::ifstream::basic_ifstream(uint64_t *a1)
{
  uint64_t v2 = MEMORY[0x263F8C308] + 64;
  a1[53] = MEMORY[0x263F8C308] + 64;
  uint64_t v3 = a1 + 2;
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2A8] + 16);
  uint64_t v5 = *(void *)(MEMORY[0x263F8C2A8] + 8);
  *a1 = v5;
  *(uint64_t *)((char *)a1 + *(void *)(v5 - 24)) = v4;
  a1[1] = 0;
  unint64_t v6 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v6, a1 + 2);
  uint64_t v7 = MEMORY[0x263F8C308] + 24;
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *a1 = v7;
  a1[53] = v2;
  MEMORY[0x21669D9F0](v3);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 4);
  }
  return a1;
}

void sub_214302364(_Unwind_Exception *a1)
{
  std::istream::~istream();
  MEMORY[0x21669DB40](v1);
  _Unwind_Resume(a1);
}

void std::vector<double>::resize(uint64_t a1, unint64_t a2)
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
    std::vector<double>::__append((char **)a1, a2 - v2);
  }
}

void *std::ifstream::~ifstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2A8];
  uint64_t v3 = *MEMORY[0x263F8C2A8];
  *a1 = *MEMORY[0x263F8C2A8];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x21669DA00](a1 + 2);
  std::istream::~istream();
  MEMORY[0x21669DB40](a1 + 53);
  return a1;
}

double *std::__val_expr<std::_BinaryOp<std::minus<double>,std::valarray<double>,std::valarray<double>>>::operator std::valarray<double>@<X0>(double *result@<X0>, double **a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  uint64_t v3 = *((void *)result + 1);
  uint64_t v5 = *(double **)v3;
  uint64_t v4 = *(void *)(v3 + 8);
  uint64_t v6 = v4 - *(void *)v3;
  if (v4 != *(void *)v3)
  {
    if (v6 < 0) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v7 = result;
    double result = (double *)operator new(v4 - *(void *)v3);
    uint64_t v8 = v6 >> 3;
    *a2 = result;
    a2[1] = result;
    size_t v9 = (double *)**((void **)v7 + 2);
    do
    {
      double v10 = *v5++;
      double v11 = v10;
      double v12 = *v9++;
      *result++ = v11 - v12;
      --v8;
    }
    while (v8);
    a2[1] = result;
  }
  return result;
}

void sub_214302518(_Unwind_Exception *a1)
{
  std::valarray<double>::~valarray(v1);
  _Unwind_Resume(a1);
}

uint64_t CPMLOnlineSvm::LinearSparseKernel(uint64_t a1, char **a2, char **a3)
{
  char v3 = 0;
  uint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t v6 = a3[1];
  do
  {
LABEL_2:
    if (v4 == a2[1] || v5 == v6) {
      break;
    }
    int v7 = *v4;
    while (1)
    {
      int v8 = *v5;
      if (v7 < v8)
      {
        ++v4;
        goto LABEL_2;
      }
      if (v7 <= v8) {
        break;
      }
      if (++v5 == v6) {
        return v3;
      }
    }
    ++v3;
    int v9 = *++v4;
    ++v5;
  }
  while (v9);
  return v3;
}

double CPMLOnlineSvm::PolySparseKernel(uint64_t a1, char **a2, char **a3)
{
  double v4 = *(double *)(a1 + 192);
  int v5 = CPMLOnlineSvm::LinearSparseKernel(a1, a2, a3);
  long double v6 = *(double *)(a1 + 208);
  double v7 = *(double *)(a1 + 200) + v4 * (double)v5;

  return pow(v7, v6);
}

double CPMLOnlineSvm::RbfSparseKernel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a3 + 8);
  uint64_t v5 = v3 + v4 - *(void *)a2 - *(void *)a3 + 2;
  long double v6 = (unsigned __int8 *)(v3 - 1);
  do
  {
    int v7 = *v6--;
    --v5;
  }
  while (!v7);
  int v8 = (unsigned __int8 *)(v4 - 1);
  do
  {
    int v9 = *v8--;
    --v5;
  }
  while (!v9);
  double v10 = -(*(double *)(a1 + 184)
        * (double)(unint64_t)(v5 - 2 * (int)CPMLOnlineSvm::LinearSparseKernel(a1, (char **)a2, (char **)a3)));

  return exp(v10);
}

double CPMLOnlineSvm::SigmoidSparseKernel(uint64_t a1, char **a2, char **a3)
{
  double v3 = *(double *)(a1 + 200) + *(double *)(a1 + 192) * (double)(int)CPMLOnlineSvm::LinearSparseKernel(a1, a2, a3);

  return tanh(v3);
}

void CPMLOnlineSvm::CompressPredictors(CPMLOnlineSvm *this, int a2)
{
  uint64_t v4 = (uint64_t *)*((void *)this + 32);
  uint64_t v6 = *v4;
  uint64_t v5 = v4[1];
  int v7 = (uint64_t *)((char *)this + 280);
  std::vector<std::valarray<char>>::__base_destruct_at_end[abi:ne180100]((uint64_t)this + 280, *((void **)this + 35));
  if (*((void *)this + 33) != *((void *)this + 32))
  {
    unint64_t v8 = 0;
    if ((unint64_t)((v5 - v6) >> 3) <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = (v5 - v6) >> 3;
    }
    do
    {
      __p = 0;
      double v16 = 0;
      if (a2)
      {
        double v10 = (char *)operator new(a2);
        __p = v10;
        double v16 = v10;
        uint64_t v11 = a2;
        do
        {
          *double v10 = 0;
          double v10 = ++v16;
          --v11;
        }
        while (v11);
      }
      if (v5 != v6)
      {
        uint64_t v12 = 0;
        int v13 = 0;
        do
        {
          if (*(double *)(*(void *)(*((void *)this + 32) + 16 * v8) + 8 * v12) != 0.0 && v13 < a2) {
            *((unsigned char *)__p + v13++) = v12;
          }
          ++v12;
        }
        while (v9 != v12);
      }
      std::vector<std::valarray<char>>::push_back[abi:ne180100](v7, (char **)&__p);
      if (__p)
      {
        if (v16 != __p) {
          double v16 = (char *)__p;
        }
        operator delete(__p);
      }
      ++v8;
    }
    while (v8 < (uint64_t)(*((void *)this + 33) - *((void *)this + 32)) >> 4);
  }
}

void sub_2143027C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<std::valarray<char>>::push_back[abi:ne180100](uint64_t *a1, char **a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - *a1) >> 4;
    if ((unint64_t)(v10 + 1) >> 60) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - *a1;
    uint64_t v12 = v11 >> 3;
    if (v11 >> 3 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v19 = v4;
    if (v13) {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::valarray<char>>>(v4, v13);
    }
    else {
      uint64_t v14 = 0;
    }
    double v15 = v14;
    double v16 = &v14[16 * v10];
    unint64_t v18 = &v14[16 * v13];
    std::valarray<char>::valarray(v16, a2);
    int v17 = v16 + 16;
    std::vector<std::valarray<char>>::__swap_out_circular_buffer(a1, &v15);
    uint64_t v9 = a1[1];
    uint64_t result = std::__split_buffer<std::valarray<char>>::~__split_buffer((uint64_t)&v15);
  }
  else
  {
    uint64_t result = (uint64_t)std::valarray<char>::valarray(*(void **)(v4 - 8), a2);
    uint64_t v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return result;
}

void sub_2143028E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

void CPMLOnlineSvm::~CPMLOnlineSvm(CPMLOnlineSvm *this)
{
  CPMLOnlineSvm::~CPMLOnlineSvm(this);

  JUMPOUT(0x21669DB80);
}

{
  unsigned char *v2;
  unsigned char *v3;
  unsigned char *v4;
  unsigned char *v5;
  unsigned char *v6;
  unsigned char *v7;
  void *v8;
  unsigned char *v9;
  unsigned char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void **v16;

  *(void *)this = &unk_26C50FA68;
  uint64_t v2 = (unsigned char *)*((void *)this + 63);
  if (v2)
  {
    double v3 = (unsigned char *)*((void *)this + 64);
    if (v3 != v2) {
      *((void *)this + 64) = &v3[(v2 - v3 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v2);
    *((void *)this + 63) = 0;
    *((void *)this + 64) = 0;
  }
  uint64_t v4 = (unsigned char *)*((void *)this + 61);
  if (v4)
  {
    unint64_t v5 = (unsigned char *)*((void *)this + 62);
    if (v5 != v4) {
      *((void *)this + 62) = &v5[(v4 - v5 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v4);
    *((void *)this + 61) = 0;
    *((void *)this + 62) = 0;
  }
  unint64_t v6 = (unsigned char *)*((void *)this + 59);
  if (v6)
  {
    unint64_t v7 = (unsigned char *)*((void *)this + 60);
    if (v7 != v6) {
      *((void *)this + 60) = &v7[(v6 - v7 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v6);
    *((void *)this + 59) = 0;
    *((void *)this + 60) = 0;
  }
  unint64_t v8 = (void *)*((void *)this + 54);
  if (v8)
  {
    *((void *)this + 55) = v8;
    operator delete(v8);
  }
  uint64_t v9 = (unsigned char *)*((void *)this + 52);
  if (v9)
  {
    uint64_t v10 = (unsigned char *)*((void *)this + 53);
    if (v10 != v9) {
      *((void *)this + 53) = &v10[(v9 - v10 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v9);
    *((void *)this + 52) = 0;
    *((void *)this + 53) = 0;
  }
  uint64_t v11 = (void *)*((void *)this + 48);
  if (v11)
  {
    *((void *)this + 49) = v11;
    operator delete(v11);
  }
  uint64_t v12 = (void *)*((void *)this + 45);
  if (v12)
  {
    *((void *)this + 46) = v12;
    operator delete(v12);
  }
  double v16 = (void **)((char *)this + 336);
  std::vector<std::valarray<double>>::__destroy_vector::operator()[abi:ne180100](&v16);
  unint64_t v13 = (void *)*((void *)this + 39);
  if (v13)
  {
    *((void *)this + 40) = v13;
    operator delete(v13);
  }
  double v16 = (void **)((char *)this + 280);
  std::vector<std::valarray<char>>::__destroy_vector::operator()[abi:ne180100](&v16);
  double v16 = (void **)((char *)this + 256);
  std::vector<std::valarray<double>>::__destroy_vector::operator()[abi:ne180100](&v16);
  uint64_t v14 = (void *)*((void *)this + 29);
  if (v14)
  {
    *((void *)this + 30) = v14;
    operator delete(v14);
  }
  if (*((void *)this + 17))
  {
    double v15 = *((void *)this + 12);
    if (v15) {
      MEMORY[0x21669DB60](v15, 0x1000C8000313F17);
    }
  }
  CPModelClose(this);
}

uint64_t CPMLOnlineSvm::eval(uint64_t a1, CPMLFeatureVector *this)
{
  RealVector = (uint64_t *)CPMLFeatureVector::getRealVector(this);
  uint64_t v5 = *RealVector;
  uint64_t v6 = (RealVector[1] - *RealVector) >> 3;
  __p = 0;
  double v15 = 0;
  unint64_t v7 = v6 - 1;
  if (v6 != 1)
  {
    if (v7 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    unint64_t v8 = operator new(8 * v7);
    __p = v8;
    bzero(v8, 8 * v7);
    double v15 = &v8[v7];
    uint64_t v9 = (uint64_t *)(v5 + 8);
    do
    {
      uint64_t v10 = *v9++;
      *v8++ = v10;
      --v7;
    }
    while (v7);
  }
  int v11 = CPMLOnlineSvm::Evaluate(a1, (uint64_t)&__p);
  double v12 = 0.0;
  if (v11 != -1) {
    double v12 = 1.0;
  }
  CPMLFeatureVector::setYHat((uint64_t)this, v12);
  if (__p)
  {
    if (v15 != __p) {
      v15 += ((unsigned char *)__p - v15 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    operator delete(__p);
  }
  return 0;
}

void sub_214302A30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CPMLOnlineSvm::train(CPMLOnlineSvm *this)
{
  return 0;
}

uint64_t CPMLAlgorithm::requireIntsOnly(CPMLAlgorithm *this)
{
  return 0;
}

uint64_t CPMLOnlineSvm::requireRealOnly(CPMLOnlineSvm *this)
{
  return 1;
}

uint64_t CPMLOnlineSvm::errorString(CPMLOnlineSvm *this)
{
  return 0;
}

uint64_t CPMLAlgorithm::getModelData(CPMLAlgorithm *this)
{
  return 0;
}

void __clang_call_terminate(void *a1)
{
}

void std::vector<std::valarray<double>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 16;
        std::allocator<std::valarray<double>>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::allocator<std::valarray<double>>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned char **)a2;
  if (*(void *)a2)
  {
    uint64_t v4 = *(unsigned char **)(a2 + 8);
    if (v4 != v2) {
      *(void *)(a2 + 8) = &v4[(v2 - v4 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v2);
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
}

void std::vector<std::valarray<char>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::valarray<char>>::__base_destruct_at_end[abi:ne180100]((uint64_t)v2, *v2);
    double v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::valarray<char>>::__base_destruct_at_end[abi:ne180100](uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  if (v4 != a2)
  {
    uint64_t v5 = *(void **)(a1 + 8);
    do
    {
      unint64_t v7 = (void *)*(v5 - 2);
      v5 -= 2;
      uint64_t v6 = v7;
      if (v7)
      {
        if ((void *)v5[1] != v6) {
          *(v4 - 1) = v6;
        }
        operator delete(v6);
        *uint64_t v5 = 0;
        v5[1] = 0;
      }
      uint64_t v4 = v5;
    }
    while (v5 != a2);
  }
  *(void *)(a1 + 8) = a2;
}

void *CoreMatrix::Matrix<double>::Resize(void *result, unint64_t a2)
{
  unint64_t v2 = result[5];
  if (v2 < a2)
  {
    if (v2)
    {
      if (*result) {
        MEMORY[0x21669DB60]();
      }
    }
    operator new[]();
  }
  result[5] = a2;
  return result;
}

void std::vector<double>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264201F88, MEMORY[0x263F8C060]);
}

void sub_214302F10(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x21669DA80](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
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
  MEMORY[0x21669DA90](v13);
  return a1;
}

void sub_214303100(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x21669DA90](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2143030E0);
}

void sub_214303154(_Unwind_Exception *a1)
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

void sub_2143032D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

void *std::valarray<char>::valarray(void *a1, char **a2)
{
  *a1 = 0;
  a1[1] = 0;
  double v3 = a2[1];
  if (v3 != *a2)
  {
    uint64_t v5 = operator new(v3 - *a2);
    *a1 = v5;
    a1[1] = v5;
    uint64_t v6 = *a2;
    while (v6 != a2[1])
    {
      char v7 = *v6++;
      *uint64_t v5 = v7;
      uint64_t v5 = (unsigned char *)(a1[1] + 1);
      a1[1] = v5;
    }
  }
  return a1;
}

uint64_t std::vector<std::valarray<char>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::valarray<char>>,std::reverse_iterator<std::valarray<char>*>,std::reverse_iterator<std::valarray<char>*>,std::reverse_iterator<std::valarray<char>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::valarray<char>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::valarray<char>>,std::reverse_iterator<std::valarray<char>*>,std::reverse_iterator<std::valarray<char>*>,std::reverse_iterator<std::valarray<char>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v8 = (_OWORD *)(a7 - 16);
    do
    {
      long long v9 = *((_OWORD *)a3 - 1);
      a3 -= 2;
      *uint64_t v8 = v9;
      *a3 = 0;
      a3[1] = 0;
      *((void *)&v15 + 1) = v8;
      v7 -= 16;
      --v8;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::valarray<char>>,std::reverse_iterator<std::valarray<char>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::valarray<char>>,std::reverse_iterator<std::valarray<char>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::valarray<char>>,std::reverse_iterator<std::valarray<char>*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::valarray<char>>,std::reverse_iterator<std::valarray<char>*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v14 = v3;
  uint64_t v15 = v2;
  uint64_t v16 = v3;
  uint64_t v17 = v2;
  uint64_t v4 = *a1;
  uint64_t v5 = (uint64_t *)a1[1];
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  uint64_t v12 = v6;
  std::__allocator_destroy[abi:ne180100]<std::allocator<std::valarray<char>>,std::reverse_iterator<std::reverse_iterator<std::valarray<char>*>>,std::reverse_iterator<std::reverse_iterator<std::valarray<char>*>>>(v4, (uint64_t)v13, (uint64_t)v8);
}

void std::__allocator_destroy[abi:ne180100]<std::allocator<std::valarray<char>>,std::reverse_iterator<std::reverse_iterator<std::valarray<char>*>>,std::reverse_iterator<std::reverse_iterator<std::valarray<char>*>>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  for (uint64_t i = *(void *)(a2 + 32); i != *(void *)(a3 + 32); *(void *)(a2 + 32) = i)
  {
    uint64_t v6 = *(void **)i;
    if (*(void *)i)
    {
      if (*(void **)(i + 8) != v6) {
        *(void *)(i + 8) = v6;
      }
      operator delete(v6);
      *(void *)uint64_t i = 0;
      *(void *)(i + 8) = 0;
      uint64_t i = *(void *)(a2 + 32);
    }
    i += 16;
  }
}

uint64_t std::__split_buffer<std::valarray<char>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::valarray<char>>::__destruct_at_end[abi:ne180100](uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2 != a2)
  {
    uint64_t v5 = *(void **)(a1 + 16);
    do
    {
      uint64_t v7 = (void *)*(v5 - 2);
      v5 -= 2;
      uint64_t v6 = v7;
      *(void *)(a1 + 16) = v5;
      if (v7)
      {
        if ((void *)v5[1] != v6) {
          *(v2 - 1) = v6;
        }
        operator delete(v6);
        *uint64_t v5 = 0;
        v5[1] = 0;
        uint64_t v5 = *(void **)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

uint64_t std::vector<std::valarray<double>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::valarray<double>>,std::reverse_iterator<std::valarray<double>*>,std::reverse_iterator<std::valarray<double>*>,std::reverse_iterator<std::valarray<double>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::valarray<double>>,std::reverse_iterator<std::valarray<double>*>,std::reverse_iterator<std::valarray<double>*>,std::reverse_iterator<std::valarray<double>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v8 = (_OWORD *)(a7 - 16);
    do
    {
      long long v9 = *((_OWORD *)a3 - 1);
      a3 -= 2;
      *uint64_t v8 = v9;
      *a3 = 0;
      a3[1] = 0;
      *((void *)&v15 + 1) = v8;
      v7 -= 16;
      --v8;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::valarray<double>>,std::reverse_iterator<std::valarray<double>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::valarray<double>>,std::reverse_iterator<std::valarray<double>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::valarray<double>>,std::reverse_iterator<std::valarray<double>*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::valarray<double>>,std::reverse_iterator<std::valarray<double>*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      std::allocator<std::valarray<double>>::destroy[abi:ne180100](v3, v1);
      v1 += 16;
    }
    while (v1 != v2);
  }
}

void **std::__split_buffer<std::valarray<double>>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<std::valarray<double>>::clear[abi:ne180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 16;
    std::allocator<std::valarray<double>>::destroy[abi:ne180100](v4, i - 16);
  }
}

void std::vector<double>::__append(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
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
      std::vector<double>::__throw_length_error[abi:ne180100]();
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
      long long v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v4, v13);
      uint64_t v8 = *a1;
      uint64_t v7 = a1[1];
    }
    else
    {
      long long v14 = 0;
    }
    long long v15 = &v14[8 * v11];
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

uint64_t std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::valarray<double> *,std::valarray<double> *,std::valarray<double> *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      uint64_t v7 = *(unsigned char **)a4;
      if (*(void *)a4)
      {
        uint64_t v8 = *(unsigned char **)(a4 + 8);
        if (v8 != v7) {
          *(void *)(a4 + 8) = &v8[(v7 - v8 + 7) & 0xFFFFFFFFFFFFFFF8];
        }
        operator delete(v7);
        *(void *)a4 = 0;
        *(void *)(a4 + 8) = 0;
      }
      *(_OWORD *)a4 = *(_OWORD *)v5;
      a4 += 16;
      *(void *)uint64_t v5 = 0;
      *(void *)(v5 + 8) = 0;
      v5 += 16;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

double CPMLLINEARSVMClassifier::establishParam(CPMLLINEARSVMClassifier *this, CPMLTunableData *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!a2 || (int)CPMLTunableData::getNumberOfItems(a2) < 1)
  {
    *((_DWORD *)this + 40) = 1;
    *(_OWORD *)((char *)this + 168) = xmmword_214353BF0;
    *((_DWORD *)this + 46) = 0;
    *((_DWORD *)this + 56) = 0;
    *((void *)this + 24) = 0;
    *((void *)this + 25) = 0;
    double result = 0.1;
    *((_OWORD *)this + 13) = xmmword_214353C00;
LABEL_72:
    uint64_t v20 = *((int *)this + 40);
    if v20 <= 0xD && ((0x38FFu >> v20))
    {
      double result = dbl_214353C30[v20];
      *((double *)this + 21) = result;
    }
    return result;
  }
  CPMLTunableData::tDataGetString(a2, "solver_type", v21, 0x18uLL);
  if (*(_DWORD *)v21 == 1599222348 && *(unsigned __int16 *)&v21[4] == 21068)
  {
    *((_DWORD *)this + 40) = 0;
    goto LABEL_69;
  }
  if (*(void *)v21 != 0x4F4C324C5F52324CLL
    || *(void *)&v21[8] != 0x445F4356535F5353
    || *(void *)&v21[11] != 0x4C4155445F435653)
  {
    if (*(void *)v21 == 0x4F4C324C5F52324CLL && *(void *)&v21[6] == 0x4356535F53534F4CLL)
    {
      int v18 = 2;
      goto LABEL_68;
    }
    if (*(void *)v21 == 0x4F4C314C5F52324CLL
      && *(void *)&v21[8] == 0x445F4356535F5353
      && *(void *)&v21[11] == 0x4C4155445F435653)
    {
      int v18 = 3;
      goto LABEL_68;
    }
    if (*(void *)v21 == 0x53435F4D5653434DLL)
    {
      int v18 = 4;
      goto LABEL_68;
    }
    if (*(void *)v21 == 0x4F4C324C5F52314CLL && *(void *)&v21[6] == 0x4356535F53534F4CLL)
    {
      int v18 = 5;
      goto LABEL_68;
    }
    if (*(_DWORD *)v21 == 1599222092 && *(unsigned __int16 *)&v21[4] == 21068)
    {
      int v18 = 6;
      goto LABEL_68;
    }
    if (*(void *)v21 == 0x445F524C5F52324CLL && *(void *)&v21[3] == 0x4C4155445F524C5FLL)
    {
      int v18 = 7;
      goto LABEL_68;
    }
    if (*(void *)v21 == 0x4F4C324C5F52324CLL && *(void *)&v21[6] == 0x5256535F53534F4CLL)
    {
      int v18 = 11;
      goto LABEL_68;
    }
    if (*(void *)v21 == 0x4F4C324C5F52324CLL
      && *(void *)&v21[8] == 0x445F5256535F5353
      && *(void *)&v21[11] == 0x4C4155445F525653)
    {
      int v18 = 12;
      goto LABEL_68;
    }
    if (*(void *)v21 == 0x4F4C314C5F52324CLL
      && *(void *)&v21[8] == 0x445F5256535F5353
      && *(void *)&v21[11] == 0x4C4155445F525653)
    {
      int v18 = 13;
      goto LABEL_68;
    }
  }
  int v18 = 1;
LABEL_68:
  *((_DWORD *)this + 40) = v18;
LABEL_69:
  CPMLTunableData::tDataGetDouble(a2, "C", (double *)this + 22);
  CPMLTunableData::tDataGetDouble(a2, "eps", (double *)this + 21);
  CPMLTunableData::tDataGetDouble(a2, "p", (double *)this + 26);
  if (CPMLTunableData::tDataGetDouble(a2, "bias", (double *)this + 27) == -1) {
    *((void *)this + 27) = 0xBFF0000000000000;
  }
  CPMLTunableData::tDataGetInt(a2, "cross_validation", (int *)this + 56);
  *((_DWORD *)this + 46) = 0;
  *((void *)this + 24) = 0;
  *((void *)this + 25) = 0;
  double result = *((double *)this + 21);
  if (result == INFINITY) {
    goto LABEL_72;
  }
  return result;
}

void CPMLLINEARSVMClassifier::CPMLLINEARSVMClassifier(CPMLLINEARSVMClassifier *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, a2, a3, a4);
  *(void *)uint64_t v7 = &unk_26C50FFF8;
  strcpy((char *)(v7 + 8), "1.96");
  var0 = a2->var0;
  uint64_t v9 = *((int *)a2->var0 + 30);
  uint64_t v11 = *((int *)a2->var0 + 32);
  uint64_t v10 = *((int *)a2->var0 + 33);
  *(void *)(v7 + 96) = *((int *)a2->var0 + 31);
  *(void *)(v7 + 104) = v10;
  uint64_t v12 = *((void *)var0 + 4) - *((void *)var0 + 3);
  uint64_t v13 = *(void *)var0;
  uint64_t v14 = ((*((void *)var0 + 1) - *(void *)var0) >> 2);
  *(void *)(v7 + 128) = v14;
  *(void *)(v7 + 136) = v13;
  *(unsigned char *)(v7 + 272) = 0;
  uint64_t v15 = v12 >> 3;
  *(void *)(v7 + 112) = v9;
  *(void *)(v7 + 120) = v15;
  LODWORD(var0) = *(_DWORD *)(*((void *)var0 + 9) + 4 * v11);
  BOOL v16 = var0 == 0;
  if (var0) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = v14;
  }
  uint64_t v18 = 120;
  if (v16) {
    uint64_t v18 = 128;
  }
  *(void *)(v7 + v18) = v17 - 1;
  CPMLLINEARSVMClassifier::establishParam((CPMLLINEARSVMClassifier *)v7, a4);
  uint64_t v19 = *((void *)this + 14);
  *((_DWORD *)this + 58) = v19;
  *((void *)this + 30) = malloc_type_calloc((int)v19, 8uLL, 0x100004000313F17uLL);
  *((void *)this + 31) = malloc_type_calloc(*((int *)this + 58), 8uLL, 0x2004093837F09uLL);
  *((void *)this + 32) = *((void *)this + 27);
  CPMLCDB::getIterator();
}

void sub_214304250(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPMLLINEARSVMClassifier::CPMLLINEARSVMClassifier(CPMLLINEARSVMClassifier *this, CPMLSerialization *a2, CPMLTunableData *a3)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, a2, a3);
  *(void *)uint64_t v5 = &unk_26C50FFF8;
  *(unsigned char *)(v5 + 272) = 0;
  (*((void (**)(CPMLSerialization *, uint64_t, const char *, uint64_t, void))a2->var0 + 13))(a2, v5 + 8, "version", 5, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 112, "totalRows", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 96, "featureVectorSpace", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 104, "resultCardinality", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 120, "continousFeatureCount", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 128, "discreteFeatureCount", 1, 0);
  uint64_t v6 = malloc_type_calloc(1uLL, 0x58uLL, 0x10900405E350820uLL);
  *((void *)this + 33) = v6;
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**((void **)this + 11) + 64))(*((void *)this + 11), (uint64_t)v6 + 56, "model_nr_class", 1, 0);
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**((void **)this + 11) + 64))(*((void *)this + 11), *((void *)this + 33) + 60, "model_nr_feature", 1, 0);
  *(void *)(*((void *)this + 33) + 64) = malloc_type_calloc(*(int *)(*((void *)this + 33) + 60)* (uint64_t)*(int *)(*((void *)this + 33) + 56), 8uLL, 0x100004000313F17uLL);
  (*(void (**)(void))(**((void **)this + 11) + 96))(*((void *)this + 11));
  *(void *)(*((void *)this + 33) + 72) = malloc_type_calloc(*(int *)(*((void *)this + 33) + 56), 4uLL, 0x100004052888210uLL);
  (*(void (**)(void))(**((void **)this + 11) + 64))(*((void *)this + 11));
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 96))(*((void *)this + 11), (char *)this + 216, "bias", 1, 0);
}

void sub_2143045E8(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPMLLINEARSVMClassifier::CPMLLINEARSVMClassifier(CPMLLINEARSVMClassifier *this, int *a2, CPMLTunableData *a3)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, 0, a3);
  *(void *)uint64_t v4 = &unk_26C50FFF8;
  *(void *)(v4 + 264) = a2;
  *(unsigned char *)(v4 + 272) = 1;
  *(void *)(v4 + 240) = 0;
  *(void *)(v4 + 248) = 0;
  *(void *)(v4 + 104) = a2[14];
}

void CPMLLINEARSVMClassifier::~CPMLLINEARSVMClassifier(CPMLLINEARSVMClassifier *this)
{
  *(void *)this = &unk_26C50FFF8;
  uint64_t v2 = (void *)*((void *)this + 30);
  if (v2) {
    free(v2);
  }
  *((void *)this + 30) = 0;
  uint64_t v3 = (void *)*((void *)this + 31);
  if (v3) {
    free(v3);
  }
  *((void *)this + 31) = 0;
  if (*((void *)this + 33) && !*((unsigned char *)this + 272)) {
    free_and_destroy_model((uint64_t *)this + 33);
  }
  *((void *)this + 33) = 0;

  CPModelClose(this);
}

{
  uint64_t vars8;

  CPMLLINEARSVMClassifier::~CPMLLINEARSVMClassifier(this);

  JUMPOUT(0x21669DB80);
}

uint64_t CPMLLINEARSVMClassifier::serialize(CPMLLINEARSVMClassifier *this)
{
  uint64_t v2 = *((void *)this + 11);
  uint64_t v3 = (char *)this + 8;
  size_t v4 = strlen((const char *)this + 8);
  (*(void (**)(uint64_t, char *, const char *, size_t, void))(*(void *)v2 + 56))(v2, v3, "version", v4, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 112, "totalRows", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 96, "featureVectorSpace", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 104, "resultCardinality", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 120, "continousFeatureCount", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 128, "discreteFeatureCount", 1, 0);
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**((void **)this + 11) + 16))(*((void *)this + 11), *((void *)this + 33) + 56, "model_nr_class", 1, 0);
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**((void **)this + 11) + 16))(*((void *)this + 11), *((void *)this + 33) + 60, "model_nr_feature", 1, 0);
  (*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *(void *)(*((void *)this + 33) + 64), "model_w", *(int *)(*((void *)this + 33) + 60) * (uint64_t)*(int *)(*((void *)this + 33) + 56), 0);
  (*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 16))(*((void *)this + 11), *(void *)(*((void *)this + 33) + 72), "model_label", *(int *)(*((void *)this + 33) + 56), 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), (char *)this + 216, "bias", 1, 0);
  return 0;
}

uint64_t CPMLLINEARSVMClassifier::train(CPMLLINEARSVMClassifier *this)
{
  uint64_t v2 = (double *)((char *)this + 232);
  uint64_t v3 = (long long *)((char *)this + 160);
  size_t v4 = check_parameter((uint64_t)this + 232, (double *)this + 20);
  if (v4)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "ERROR: %s\n", v4);
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v6 = train(v2, v3);
    uint64_t result = 0;
    *((void *)this + 33) = v6;
  }
  return result;
}

uint64_t CPMLLINEARSVMClassifier::eval(uint64_t a1, CPMLFeatureVector *this)
{
  IntVector = (uint64_t *)CPMLFeatureVector::getIntVector(this);
  RealVector = (double **)CPMLFeatureVector::getRealVector(this);
  uint64_t v6 = (char *)malloc_type_calloc(((IntVector[1] - *IntVector) >> 2) + RealVector[1] - *RealVector + 2, 0x10uLL, 0x1000040F7F8B94BuLL);
  uint64_t v7 = v6;
  uint64_t v8 = *IntVector;
  unint64_t v9 = IntVector[1] - *IntVector;
  unint64_t v10 = v9 >> 2;
  if ((int)(v9 >> 2) < 1)
  {
    int v13 = 0;
    int v12 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    int v12 = 0;
    int v13 = 0;
    uint64_t v14 = (v9 >> 2);
    do
    {
      int v15 = *(_DWORD *)(v8 + 4 * v11++);
      if (v15)
      {
        BOOL v16 = (double *)&v6[16 * v13];
        *(_DWORD *)BOOL v16 = v11;
        v16[1] = (double)v15;
        ++v13;
        int v12 = v11;
      }
    }
    while (v11 != v14);
  }
  uint64_t v17 = *RealVector;
  unint64_t v18 = (char *)RealVector[1] - (char *)*RealVector;
  if ((int)(v18 >> 3) >= 1)
  {
    int v19 = v10 + 1;
    uint64_t v20 = (v18 >> 3);
    do
    {
      double v21 = *v17;
      if (*v17 != 0.0)
      {
        uint64_t v22 = (double *)&v6[16 * v13];
        *(_DWORD *)uint64_t v22 = v19;
        v22[1] = v21;
        ++v13;
        int v12 = v19;
      }
      ++v17;
      ++v19;
      --v20;
    }
    while (v20);
  }
  double v23 = *(double *)(a1 + 216);
  if (v23 >= 0.0)
  {
    std::locale v24 = (double *)&v6[16 * v13];
    *(_DWORD *)std::locale v24 = v12;
    v24[1] = v23;
    ++v13;
  }
  unint64_t v25 = (double *)&v6[16 * v13];
  *(_DWORD *)unint64_t v25 = -1;
  v25[1] = nan("");
  uint64_t v26 = malloc_type_realloc(v7, 16 * (v13 + 1), 0x1000040F7F8B94BuLL);
  double v27 = predict(*(void *)(a1 + 264), v26);
  double v28 = 1.0;
  if (v27 == -1.0) {
    double v28 = 0.0;
  }
  if (*(void *)(a1 + 104) == 2) {
    double v27 = v28;
  }
  CPMLFeatureVector::setYHat((uint64_t)this, v27);
  free(v26);
  return 0;
}

void CPMLLINEARSVMClassifier::update(CPMLLINEARSVMClassifier *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
}

uint64_t CPMLLINEARSVMClassifier::errorString(CPMLLINEARSVMClassifier *this)
{
  return 0;
}

uint64_t CPMLLINEARSVMClassifier::requireRealOnly(CPMLLINEARSVMClassifier *this)
{
  return 1;
}

void CPMLCreateLIBSVMAnalysis()
{
}

void sub_214304D64(_Unwind_Exception *a1)
{
  uint64_t v2 = v1;
  MEMORY[0x21669DB80](v2, 0xA1C4034F8F590);
  _Unwind_Resume(a1);
}

void CPMLLIBSVMAnalysisHandler::CPMLLIBSVMAnalysisHandler(CPMLLIBSVMAnalysisHandler *this, CPMLAlgorithm *a2)
{
  CPMLAnalysisHandler::CPMLAnalysisHandler(this);
  *uint64_t v3 = &unk_26C510258;
  v3[1] = a2;
}

CPMLLIBSVMAnalysisHandler *CPMLDestroyLIBSVMAnalysis(CPMLLIBSVMAnalysisHandler *result)
{
  if (result)
  {
    CPMLLIBSVMAnalysisHandler::~CPMLLIBSVMAnalysisHandler(result);
    JUMPOUT(0x21669DB80);
  }
  return result;
}

void CPMLLIBSVMAnalysisHandler::~CPMLLIBSVMAnalysisHandler(CPMLLIBSVMAnalysisHandler *this)
{
  *(void *)this = &unk_26C510258;
  uint64_t v2 = *((void *)this + 1);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  CPModelClose(this);
}

void CPMLLIBSVMAnalysisHandler::classify(CPMLLIBSVMAnalysisHandler *this, int a2, double *a3)
{
}

void sub_214304F80(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x1020C4087C48359);
  _Unwind_Resume(a1);
}

double CPMLLIBSVMAnalysisHandler::regression(CPMLLIBSVMAnalysisHandler *this, int a2, double *a3)
{
  return nan("");
}

void CPMLDelegateEngine::CPMLDelegateEngine(CPMLDelegateEngine *this, void *a2, void *a3)
{
  this->var0 = a2;
  this->var1 = a3;
}

void CPMLlinearSVM::l2r_lr_fun::l2r_lr_fun(void *a1, uint64_t a2)
{
  *a1 = &unk_26C510728;
  a1[4] = a2;
  operator new[]();
}

void CPMLlinearSVM::l2r_lr_fun::~l2r_lr_fun(CPMLlinearSVM::l2r_lr_fun *this)
{
  *(void *)this = &unk_26C510728;
  uint64_t v2 = *((void *)this + 2);
  if (v2) {
    MEMORY[0x21669DB60](v2, 0x1000C8000313F17);
  }
  uint64_t v3 = *((void *)this + 3);
  if (v3) {
    MEMORY[0x21669DB60](v3, 0x1000C8000313F17);
  }
}

{
  uint64_t vars8;

  CPMLlinearSVM::l2r_lr_fun::~l2r_lr_fun(this);

  JUMPOUT(0x21669DB80);
}

double CPMLlinearSVM::l2r_lr_fun::fun(CPMLlinearSVM::l2r_lr_fun *this, double *a2)
{
  size_t v4 = (unsigned int *)*((void *)this + 4);
  uint64_t v5 = (double *)*((void *)v4 + 1);
  uint64_t v6 = *v4;
  int v7 = (*(uint64_t (**)(CPMLlinearSVM::l2r_lr_fun *))(*(void *)this + 24))(this);
  CPMLlinearSVM::l2r_lr_fun::Xv((uint64_t)this, a2, *((double **)this + 2));
  if (v7 < 1)
  {
    double v11 = 0.0;
  }
  else
  {
    uint64_t v8 = v7;
    double v9 = 0.0;
    do
    {
      double v10 = *a2++;
      double v9 = v9 + v10 * v10;
      --v8;
    }
    while (v8);
    double v11 = v9 * 0.5;
  }
  if ((int)v6 >= 1)
  {
    uint64_t v14 = (char *)this + 8;
    int v12 = (double *)*((void *)this + 1);
    int v13 = (double *)*((void *)v14 + 1);
    do
    {
      double v15 = *v5 * *v13;
      double v16 = *v12;
      if (v15 >= 0.0)
      {
        long double v19 = exp(-v15);
        double v18 = log(v19 + 1.0);
      }
      else
      {
        long double v17 = exp(*v5 * *v13);
        double v18 = log(v17 + 1.0) - v15;
      }
      double v11 = v11 + v16 * v18;
      ++v12;
      ++v13;
      ++v5;
      --v6;
    }
    while (v6);
  }
  return v11;
}

uint64_t CPMLlinearSVM::l2r_lr_fun::Xv(uint64_t this, double *a2, double *a3)
{
  uint64_t v3 = *(unsigned int **)(this + 32);
  uint64_t v4 = *v3;
  if ((int)v4 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *((void *)v3 + 2);
    do
    {
      int v7 = *(_DWORD **)(v6 + 8 * v5);
      a3[v5] = 0.0;
      int v8 = *v7;
      if (*v7 != -1)
      {
        double v9 = (double *)(v7 + 4);
        double v10 = 0.0;
        do
        {
          double v10 = v10 + a2[v8 - 1] * *(v9 - 1);
          a3[v5] = v10;
          int v11 = *(_DWORD *)v9;
          v9 += 2;
          int v8 = v11;
        }
        while (v11 != -1);
      }
      ++v5;
    }
    while (v5 != v4);
  }
  return this;
}

void CPMLlinearSVM::l2r_lr_fun::grad(CPMLlinearSVM::l2r_lr_fun *this, double *a2, double *a3)
{
  uint64_t v6 = (unsigned int *)*((void *)this + 4);
  int v7 = (double *)*((void *)v6 + 1);
  uint64_t v8 = *v6;
  int v9 = (*(uint64_t (**)(CPMLlinearSVM::l2r_lr_fun *))(*(void *)this + 24))(this);
  double v10 = (double *)*((void *)this + 2);
  if ((int)v8 >= 1)
  {
    int v11 = (double *)*((void *)this + 3);
    int v12 = (double *)*((void *)this + 1);
    int v13 = (double *)*((void *)this + 2);
    do
    {
      long double v14 = 1.0 / (exp(-(*v7 * *v13)) + 1.0);
      *int v13 = v14;
      *v11++ = v14 * (1.0 - v14);
      double v15 = *v12++;
      double v16 = v15 * (*v13 + -1.0);
      double v17 = *v7++;
      *v13++ = v17 * v16;
      --v8;
    }
    while (v8);
  }
  CPMLlinearSVM::l2r_lr_fun::XTv(this, v10, a3);
  if (v9 >= 1)
  {
    uint64_t v18 = v9;
    do
    {
      double v19 = *a2++;
      *a3 = v19 + *a3;
      ++a3;
      --v18;
    }
    while (v18);
  }
}

void CPMLlinearSVM::l2r_lr_fun::XTv(CPMLlinearSVM::l2r_lr_fun *this, double *a2, double *a3)
{
  uint64_t v6 = **((unsigned int **)this + 4);
  int v7 = (*(uint64_t (**)(CPMLlinearSVM::l2r_lr_fun *))(*(void *)this + 24))(this);
  uint64_t v8 = *(void *)(*((void *)this + 4) + 16);
  if (v7 >= 1) {
    bzero(a3, 8 * v7);
  }
  if ((int)v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      double v10 = *(_DWORD **)(v8 + 8 * i);
      int v11 = *v10;
      if (*v10 != -1)
      {
        int v12 = (double *)(v10 + 4);
        do
        {
          a3[v11 - 1] = a3[v11 - 1] + a2[i] * *(v12 - 1);
          int v13 = *(_DWORD *)v12;
          v12 += 2;
          int v11 = v13;
        }
        while (v13 != -1);
      }
    }
  }
}

uint64_t CPMLlinearSVM::l2r_lr_fun::get_nr_variable(CPMLlinearSVM::l2r_lr_fun *this)
{
  return *(unsigned int *)(*((void *)this + 4) + 4);
}

void CPMLlinearSVM::l2r_lr_fun::Hv(CPMLlinearSVM::l2r_lr_fun *this, double *a2, double *a3)
{
}

void CPMLlinearSVM::l2r_l2_svc_fun::l2r_l2_svc_fun(void *a1, uint64_t a2)
{
  *a1 = &unk_26C510768;
  a1[6] = a2;
  operator new[]();
}

void CPMLlinearSVM::l2r_l2_svc_fun::~l2r_l2_svc_fun(CPMLlinearSVM::l2r_l2_svc_fun *this)
{
  *(void *)this = &unk_26C510768;
  uint64_t v2 = *((void *)this + 2);
  if (v2) {
    MEMORY[0x21669DB60](v2, 0x1000C8000313F17);
  }
  uint64_t v3 = *((void *)this + 3);
  if (v3) {
    MEMORY[0x21669DB60](v3, 0x1000C8000313F17);
  }
  uint64_t v4 = *((void *)this + 4);
  if (v4) {
    MEMORY[0x21669DB60](v4, 0x1000C8052888210);
  }
}

{
  uint64_t vars8;

  CPMLlinearSVM::l2r_l2_svc_fun::~l2r_l2_svc_fun(this);

  JUMPOUT(0x21669DB80);
}

uint64_t CPMLlinearSVM::l2r_l2_svc_fun::fun(CPMLlinearSVM::l2r_l2_svc_fun *this, double *a2)
{
  uint64_t v4 = (unsigned int *)*((void *)this + 6);
  uint64_t v5 = *((void *)v4 + 1);
  uint64_t v6 = *v4;
  int v7 = (*(uint64_t (**)(CPMLlinearSVM::l2r_l2_svc_fun *))(*(void *)this + 24))(this);
  uint64_t result = CPMLlinearSVM::l2r_l2_svc_fun::Xv((uint64_t)this, a2, *((double **)this + 2));
  if (v7 < 1)
  {
    double v12 = 0.0;
  }
  else
  {
    uint64_t v9 = v7;
    double v10 = 0.0;
    do
    {
      double v11 = *a2++;
      double v10 = v10 + v11 * v11;
      --v9;
    }
    while (v9);
    double v12 = v10 * 0.5;
  }
  if ((int)v6 >= 1)
  {
    uint64_t v13 = 0;
    uint64_t v14 = *((void *)this + 2);
    do
    {
      double v15 = *(double *)(v5 + v13) * *(double *)(v14 + v13);
      *(double *)(v14 + v13) = v15;
      double v16 = 1.0 - v15;
      if (v16 > 0.0) {
        double v12 = v12 + v16 * *(double *)(*((void *)this + 1) + v13) * v16;
      }
      v13 += 8;
    }
    while (8 * v6 != v13);
  }
  return result;
}

uint64_t CPMLlinearSVM::l2r_l2_svc_fun::Xv(uint64_t this, double *a2, double *a3)
{
  uint64_t v3 = *(unsigned int **)(this + 48);
  uint64_t v4 = *v3;
  if ((int)v4 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *((void *)v3 + 2);
    do
    {
      int v7 = *(_DWORD **)(v6 + 8 * v5);
      a3[v5] = 0.0;
      int v8 = *v7;
      if (*v7 != -1)
      {
        uint64_t v9 = (double *)(v7 + 4);
        double v10 = 0.0;
        do
        {
          double v10 = v10 + a2[v8 - 1] * *(v9 - 1);
          a3[v5] = v10;
          int v11 = *(_DWORD *)v9;
          v9 += 2;
          int v8 = v11;
        }
        while (v11 != -1);
      }
      ++v5;
    }
    while (v5 != v4);
  }
  return this;
}

void CPMLlinearSVM::l2r_l2_svc_fun::grad(CPMLlinearSVM::l2r_l2_svc_fun *this, double *a2, double *a3)
{
  uint64_t v6 = (unsigned int *)*((void *)this + 6);
  uint64_t v7 = *((void *)v6 + 1);
  uint64_t v8 = *v6;
  int v9 = (*(uint64_t (**)(CPMLlinearSVM::l2r_l2_svc_fun *))(*(void *)this + 24))(this);
  *((_DWORD *)this + 10) = 0;
  double v10 = (double *)*((void *)this + 2);
  if ((int)v8 >= 1)
  {
    int v11 = 0;
    for (uint64_t i = 0; i != v8; ++i)
    {
      double v13 = v10[i];
      if (v13 < 1.0)
      {
        v10[v11] = (v13 + -1.0) * (*(double *)(*((void *)this + 1) + 8 * i) * *(double *)(v7 + 8 * i));
        *(_DWORD *)(*((void *)this + 4) + 4 * v11) = i;
        int v11 = *((_DWORD *)this + 10) + 1;
        *((_DWORD *)this + 10) = v11;
      }
    }
  }
  CPMLlinearSVM::l2r_l2_svc_fun::subXTv(this, v10, a3);
  if (v9 >= 1)
  {
    uint64_t v14 = v9;
    do
    {
      double v15 = *a2++;
      *a3 = v15 + *a3 * 2.0;
      ++a3;
      --v14;
    }
    while (v14);
  }
}

void CPMLlinearSVM::l2r_l2_svc_fun::subXTv(CPMLlinearSVM::l2r_l2_svc_fun *this, double *a2, double *a3)
{
  int v6 = (*(uint64_t (**)(CPMLlinearSVM::l2r_l2_svc_fun *))(*(void *)this + 24))(this);
  uint64_t v7 = *(void *)(*((void *)this + 6) + 16);
  if (v6 >= 1) {
    bzero(a3, 8 * v6);
  }
  uint64_t v8 = *((unsigned int *)this + 10);
  if ((int)v8 >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *((void *)this + 4);
    do
    {
      int v11 = *(_DWORD **)(v7 + 8 * *(int *)(v10 + 4 * v9));
      int v12 = *v11;
      if (*v11 != -1)
      {
        double v13 = (double *)(v11 + 4);
        do
        {
          a3[v12 - 1] = a3[v12 - 1] + a2[v9] * *(v13 - 1);
          int v14 = *(_DWORD *)v13;
          v13 += 2;
          int v12 = v14;
        }
        while (v14 != -1);
      }
      ++v9;
    }
    while (v9 != v8);
  }
}

uint64_t CPMLlinearSVM::l2r_l2_svc_fun::get_nr_variable(CPMLlinearSVM::l2r_l2_svc_fun *this)
{
  return *(unsigned int *)(*((void *)this + 6) + 4);
}

void CPMLlinearSVM::l2r_l2_svc_fun::Hv(CPMLlinearSVM::l2r_l2_svc_fun *this, double *a2, double *a3)
{
}

uint64_t CPMLlinearSVM::l2r_l2_svc_fun::subXv(uint64_t this, double *a2, double *a3)
{
  uint64_t v3 = *(unsigned int *)(this + 40);
  if ((int)v3 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)(*(void *)(this + 48) + 16);
    uint64_t v6 = *(void *)(this + 32);
    do
    {
      uint64_t v7 = *(_DWORD **)(v5 + 8 * *(int *)(v6 + 4 * v4));
      a3[v4] = 0.0;
      int v8 = *v7;
      if (*v7 != -1)
      {
        uint64_t v9 = (double *)(v7 + 4);
        double v10 = 0.0;
        do
        {
          double v10 = v10 + a2[v8 - 1] * *(v9 - 1);
          a3[v4] = v10;
          int v11 = *(_DWORD *)v9;
          v9 += 2;
          int v8 = v11;
        }
        while (v11 != -1);
      }
      ++v4;
    }
    while (v4 != v3);
  }
  return this;
}

void CPMLlinearSVM::l2r_l2_svr_fun::l2r_l2_svr_fun(void *a1, uint64_t a2)
{
}

uint64_t CPMLlinearSVM::l2r_l2_svr_fun::fun(CPMLlinearSVM::l2r_l2_svr_fun *this, double *a2)
{
  uint64_t v4 = (unsigned int *)*((void *)this + 6);
  uint64_t v5 = *((void *)v4 + 1);
  uint64_t v6 = *v4;
  int v7 = (*(uint64_t (**)(CPMLlinearSVM::l2r_l2_svr_fun *))(*(void *)this + 24))(this);
  uint64_t result = CPMLlinearSVM::l2r_l2_svc_fun::Xv((uint64_t)this, a2, *((double **)this + 2));
  if (v7 < 1)
  {
    double v12 = 0.0;
  }
  else
  {
    uint64_t v9 = v7;
    double v10 = 0.0;
    do
    {
      double v11 = *a2++;
      double v10 = v10 + v11 * v11;
      --v9;
    }
    while (v9);
    double v12 = v10 * 0.5;
  }
  if ((int)v6 >= 1)
  {
    uint64_t v13 = 0;
    double v14 = *((double *)this + 7);
    while (1)
    {
      double v15 = *(double *)(*((void *)this + 2) + v13) - *(double *)(v5 + v13);
      if (v15 < -v14) {
        break;
      }
      if (v15 > v14)
      {
        double v16 = *(double *)(*((void *)this + 1) + v13);
        double v17 = v15 - v14;
        goto LABEL_12;
      }
LABEL_13:
      v13 += 8;
      if (8 * v6 == v13) {
        return result;
      }
    }
    double v16 = *(double *)(*((void *)this + 1) + v13);
    double v17 = v15 + v14;
LABEL_12:
    double v12 = v12 + v17 * v16 * v17;
    goto LABEL_13;
  }
  return result;
}

void CPMLlinearSVM::l2r_l2_svr_fun::grad(CPMLlinearSVM::l2r_l2_svr_fun *this, double *a2, double *a3)
{
  uint64_t v6 = (unsigned int *)*((void *)this + 6);
  uint64_t v7 = *((void *)v6 + 1);
  uint64_t v8 = *v6;
  int v9 = (*(uint64_t (**)(CPMLlinearSVM::l2r_l2_svr_fun *))(*(void *)this + 24))(this);
  *((_DWORD *)this + 10) = 0;
  double v10 = (double *)*((void *)this + 2);
  if ((int)v8 >= 1)
  {
    int v11 = 0;
    uint64_t v12 = 0;
    while (1)
    {
      double v13 = v10[v12] - *(double *)(v7 + 8 * v12);
      double v14 = *((double *)this + 7);
      if (v13 < -v14) {
        break;
      }
      if (v13 > v14)
      {
        double v15 = *(double *)(*((void *)this + 1) + 8 * v12);
        double v16 = v13 - v14;
        goto LABEL_7;
      }
LABEL_8:
      if (v8 == ++v12) {
        goto LABEL_9;
      }
    }
    double v15 = *(double *)(*((void *)this + 1) + 8 * v12);
    double v16 = v13 + v14;
LABEL_7:
    v10[v11] = v16 * v15;
    *(_DWORD *)(*((void *)this + 4) + 4 * v11) = v12;
    int v11 = *((_DWORD *)this + 10) + 1;
    *((_DWORD *)this + 10) = v11;
    goto LABEL_8;
  }
LABEL_9:
  CPMLlinearSVM::l2r_l2_svc_fun::subXTv(this, v10, a3);
  if (v9 >= 1)
  {
    uint64_t v17 = v9;
    do
    {
      double v18 = *a2++;
      *a3 = v18 + *a3 * 2.0;
      ++a3;
      --v17;
    }
    while (v17);
  }
}

void CPMLlinearSVM::Solver_MCSVM_CS::Solver_MCSVM_CS(uint64_t a1, int32x2_t *a2, int a3, double a4, uint64_t a5, int a6)
{
  *(int32x2_t *)(a1 + 24) = vrev64_s32(*a2);
  *(double *)(a1 + 40) = a4;
  *(_DWORD *)(a1 + 32) = a3;
  *(_DWORD *)(a1 + 36) = a6;
  *(void *)(a1 + 48) = a2;
  operator new[]();
}

void CPMLlinearSVM::Solver_MCSVM_CS::~Solver_MCSVM_CS(CPMLlinearSVM::Solver_MCSVM_CS *this)
{
  uint64_t v2 = *(void *)this;
  if (v2) {
    MEMORY[0x21669DB60](v2, 0x1000C8000313F17);
  }
  uint64_t v3 = *((void *)this + 2);
  if (v3) {
    MEMORY[0x21669DB60](v3, 0x1000C8000313F17);
  }
}

void CPMLlinearSVM::Solver_MCSVM_CS::solve_sub_problem(CPMLlinearSVM::Solver_MCSVM_CS *this, double a2, int a3, double a4, int a5, double *a6)
{
}

uint64_t CPMLlinearSVM::compare_double(CPMLlinearSVM *this, double *a2, const void *a3)
{
  if (*(double *)this > *a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *(double *)this < *a2;
  }
}

BOOL CPMLlinearSVM::Solver_MCSVM_CS::be_shrunk(CPMLlinearSVM::Solver_MCSVM_CS *this, int a2, int a3, int a4, double a5, double a6)
{
  double v6 = 0.0;
  if (a3 == a4) {
    double v6 = *(double *)(*((void *)this + 1) + 8 * (int)*(double *)(*(void *)(*((void *)this + 6) + 8) + 8 * a2));
  }
  return v6 == a5 && *(double *)(*((void *)this + 2) + 8 * a3) < a6;
}

void CPMLlinearSVM::Solver_MCSVM_CS::Solve(CPMLlinearSVM::Solver_MCSVM_CS *this, double *a2)
{
}

uint64_t info(const char *a1, ...)
{
  va_start(va, a1);
  uint64_t v3 = *MEMORY[0x263EF8340];
  vsprintf(v2, a1, va);
  return liblinear_print_string(v2);
}

{
  char v2[1024];
  uint64_t v3;
  va_list va;

  va_start(va, a1);
  uint64_t v3 = *MEMORY[0x263EF8340];
  vsprintf(v2, a1, va);
  return svm_print_string(v2);
}

_DWORD *train(double *a1, long long *a2)
{
  uint64_t v3 = a1;
  uint64_t v5 = *(unsigned int *)a1;
  uint64_t v4 = *((unsigned int *)a1 + 1);
  uint64_t v6 = (int)v4;
  uint64_t v7 = malloc_type_malloc(0x58uLL, 0x10900405E350820uLL);
  uint64_t v8 = v7;
  uint64_t v91 = v4;
  v7[15] = v4 - (v3[3] >= 0.0);
  long long v9 = *a2;
  long long v10 = a2[1];
  long long v11 = a2[2];
  *((void *)v7 + 6) = *((void *)a2 + 6);
  *((_OWORD *)v7 + 1) = v10;
  *((_OWORD *)v7 + 2) = v11;
  *(_OWORD *)uint64_t v7 = v9;
  *((double *)v7 + 10) = v3[3];
  if ((*v7 - 11) <= 2)
  {
    uint64_t v12 = malloc_type_malloc(8 * (int)v4, 0x100004000313F17uLL);
    v8[14] = 2;
    *((void *)v8 + 8) = v12;
    *((void *)v8 + 9) = 0;
    train_one((unsigned int *)v3, a2);
    return v8;
  }
  v87 = v7;
  v84 = (int *)malloc_type_malloc(4 * (int)v5, 0x100004052888210uLL);
  uint64_t v13 = *(int *)v3;
  uint64_t v14 = *(unsigned int *)v3;
  double v15 = malloc_type_malloc(0x40uLL, 0x100004052888210uLL);
  v90 = (int32x2_t *)malloc_type_malloc(0x40uLL, 0x100004052888210uLL);
  double v16 = (int *)malloc_type_malloc(4 * v13, 0x100004052888210uLL);
  uint64_t v85 = v5;
  uint64_t v81 = v6;
  v82 = (void *)(int)v5;
  if ((int)v13 < 1)
  {
    int v18 = 0;
  }
  else
  {
    uint64_t v17 = 0;
    int v18 = 0;
    int v19 = 16;
    uint64_t v20 = v90;
    v88 = v16;
    do
    {
      int v21 = (int)*(double *)(*((void *)v3 + 1) + 8 * v17);
      if (v18 < 1)
      {
        LODWORD(v22) = 0;
      }
      else
      {
        uint64_t v22 = 0;
        while (v15[v22] != v21)
        {
          if (v18 == ++v22)
          {
            v16[v17] = v18;
            goto LABEL_13;
          }
        }
        ++v20->i32[v22];
      }
      v16[v17] = v22;
      if (v22 == v18)
      {
LABEL_13:
        if (v18 == v19)
        {
          uint64_t v23 = v14;
          std::locale v24 = a2;
          unint64_t v25 = v3;
          uint64_t v26 = v20;
          double v15 = malloc_type_realloc(v15, 8 * v18, 0x100004052888210uLL);
          double v27 = v26;
          uint64_t v3 = v25;
          a2 = v24;
          uint64_t v14 = v23;
          uint64_t v20 = (int32x2_t *)malloc_type_realloc(v27, 8 * v18, 0x100004052888210uLL);
          int v19 = 2 * v18;
          double v16 = v88;
        }
        v15[v18] = v21;
        v20->i32[v18++] = 1;
      }
      ++v17;
    }
    while (v17 != v14);
    v90 = v20;
    if (v18 == 2)
    {
      double v28 = v84;
      if (*v15 == -1 && v15[1] == 1)
      {
        *(void *)double v15 = 0xFFFFFFFF00000001;
        *uint64_t v20 = vrev64_s32(*v20);
        uint64_t v29 = v16;
        uint64_t v30 = v14;
        do
        {
          *uint64_t v29 = *v29 == 0;
          ++v29;
          --v30;
        }
        while (v30);
      }
      int v18 = 2;
      goto LABEL_25;
    }
  }
  double v28 = v84;
LABEL_25:
  uint64_t v31 = malloc_type_malloc(4 * v18, 0x100004052888210uLL);
  uint64_t v32 = v31;
  *uint64_t v31 = 0;
  if (v18 > 1)
  {
    int v33 = 0;
    uint64_t v34 = v18 - 1;
    uint64_t v35 = v31 + 1;
    uint64_t v36 = v90;
    do
    {
      __int32 v37 = v36->i32[0];
      uint64_t v36 = (int32x2_t *)((char *)v36 + 4);
      v33 += v37;
      *v35++ = v33;
      --v34;
    }
    while (v34);
  }
  if ((int)v14 >= 1)
  {
    for (uint64_t i = 0; i != v14; ++i)
      v28[v31[v16[i]]++] = i;
  }
  *uint64_t v31 = 0;
  if (v18 > 1)
  {
    int v39 = 0;
    uint64_t v40 = v18 - 1;
    uint64_t v41 = v31 + 1;
    v42 = v90;
    do
    {
      __int32 v43 = v42->i32[0];
      v42 = (int32x2_t *)((char *)v42 + 4);
      v39 += v43;
      *v41++ = v39;
      --v40;
    }
    while (v40);
  }
  free(v16);
  v87[14] = v18;
  uint64_t v44 = malloc_type_malloc(4 * v18, 0x100004052888210uLL);
  *((void *)v87 + 9) = v44;
  if (v18 <= 0)
  {
    v49 = (double *)malloc_type_malloc(8 * v18, 0x100004000313F17uLL);
  }
  else
  {
    uint64_t v45 = v18;
    uint64_t v46 = v15;
    do
    {
      int v47 = *v46++;
      *v44++ = v47;
      --v45;
    }
    while (v45);
    v48 = (double *)malloc_type_malloc(8 * v18, 0x100004000313F17uLL);
    v49 = v48;
    for (uint64_t j = 0; j != v18; ++j)
      v48[j] = *((double *)a2 + 2);
  }
  int v51 = *((_DWORD *)a2 + 6);
  if (v51 >= 1)
  {
    uint64_t v52 = 0;
    unint64_t v53 = (FILE **)MEMORY[0x263EF8348];
    do
    {
      if (v18 < 1)
      {
        LODWORD(v54) = 0;
      }
      else
      {
        uint64_t v54 = 0;
        while (*(_DWORD *)(*((void *)a2 + 4) + 4 * v52) != v15[v54])
        {
          if (v18 == ++v54) {
            goto LABEL_50;
          }
        }
      }
      if (v54 == v18)
      {
LABEL_50:
        fprintf(*v53, "WARNING: class label %d specified in weight is not found\n", *(_DWORD *)(*((void *)a2 + 4) + 4 * v52));
        int v51 = *((_DWORD *)a2 + 6);
      }
      else
      {
        v49[v54] = *(double *)(*((void *)a2 + 5) + 8 * v52) * v49[v54];
      }
      ++v52;
    }
    while (v52 < v51);
  }
  size_t v55 = 8 * (void)v82;
  v56 = (char *)malloc_type_malloc(8 * (void)v82, 0x2004093837F09uLL);
  uint64_t v57 = v56;
  if ((int)v85 >= 1)
  {
    uint64_t v58 = v85;
    v59 = v84;
    v60 = v56;
    do
    {
      uint64_t v61 = *v59++;
      *(void *)v60 = *(void *)(*((void *)v3 + 2) + 8 * v61);
      v60 += 8;
      --v58;
    }
    while (v58);
  }
  v92[0] = v85;
  v92[1] = v91;
  v94 = (char *)malloc_type_malloc(v55, 0x2004093837F09uLL);
  v93 = (char *)malloc_type_malloc(v55, 0x100004000313F17uLL);
  if ((int)v85 >= 1)
  {
    uint64_t v62 = 0;
    do
    {
      *(void *)&v94[v62] = *(void *)&v57[v62];
      v62 += 8;
    }
    while (8 * v85 != v62);
  }
  v83 = v57;
  uint64_t v8 = v87;
  if (*(_DWORD *)a2 == 4)
  {
    *((void *)v87 + 8) = malloc_type_malloc(8 * v18 * (int)v91, 0x100004000313F17uLL);
    if (v18 > 0)
    {
      uint64_t v63 = 0;
      v64 = v93;
      do
      {
        uint64_t v65 = v90->i32[v63];
        if ((int)v65 >= 1)
        {
          uint64_t v66 = (int)v32[v63];
          uint64_t v67 = v65 + v66;
          do
            *(double *)&v64[8 * v66++] = (double)(int)v63;
          while (v66 < v67);
        }
        ++v63;
      }
      while (v63 != v18);
    }
    operator new[]();
  }
  if (v18 == 2)
  {
    *((void *)v87 + 8) = malloc_type_malloc(8 * v81, 0x100004000313F17uLL);
    int v68 = v90->i32[0] + *v32;
    if (v68 < 1) {
      int v68 = 0;
    }
    else {
      memset_pattern16(v93, &unk_214353DB0, 8 * (v68 - 1) + 8);
    }
    if (v68 < (int)v85) {
      memset_pattern16(&v93[8 * v68], &unk_214353DC0, 8 * (v85 + ~v68) + 8);
    }
    train_one(v92, a2);
  }
  else
  {
    *((void *)v87 + 8) = malloc_type_malloc(8 * v18 * (int)v91, 0x100004000313F17uLL);
    v89 = (uint64_t *)malloc_type_malloc(8 * v81, 0x100004000313F17uLL);
    v69 = v90;
    if (v18 >= 1)
    {
      uint64_t v70 = 0;
      uint64_t v71 = 0;
      uint64_t v72 = 8 * v18;
      uint64_t v86 = v18;
      do
      {
        uint64_t v73 = v32[v71];
        __int32 v74 = v69->i32[v71];
        if ((int)v73 < 1)
        {
          int v75 = 0;
        }
        else
        {
          memset_pattern16(v93, &unk_214353DC0, 8 * v73);
          int v75 = v73;
        }
        if (v75 < v74 + (int)v73)
        {
          memset_pattern16(&v93[8 * v75], &unk_214353DB0, 8 * (~v75 + v74 + v73) + 8);
          int v75 = v74 + v73;
        }
        if (v75 < (int)v92[0]) {
          memset_pattern16(&v93[8 * v75], &unk_214353DC0, 8 * (v92[0] + ~v75) + 8);
        }
        train_one(v92, a2);
        if ((int)v91 >= 1)
        {
          v76 = v89;
          v77 = (void *)(*((void *)v87 + 8) + v70);
          uint64_t v78 = v91;
          do
          {
            uint64_t v79 = *v76++;
            void *v77 = v79;
            v77 = (void *)((char *)v77 + v72);
            --v78;
          }
          while (v78);
        }
        ++v71;
        v70 += 8;
        v69 = v90;
      }
      while (v71 != v86);
    }
    free(v89);
    uint64_t v8 = v87;
  }
  free(v83);
  free(v15);
  free(v32);
  free(v90);
  free(v84);
  free(v94);
  free(v93);
  free(v49);
  return v8;
}

void sub_2143074C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  CPMLlinearSVM::Solver_MCSVM_CS::~Solver_MCSVM_CS((CPMLlinearSVM::Solver_MCSVM_CS *)va);
  _Unwind_Resume(a1);
}

BOOL check_regression_model(_DWORD *a1)
{
  return *a1 == 11 || *a1 == 13 || *a1 == 12;
}

size_t train_one(unsigned int *a1, _DWORD *a2)
{
  if ((int)*a1 >= 1)
  {
    int v2 = 0;
    uint64_t v3 = (double *)*((void *)a1 + 1);
    uint64_t v4 = *a1;
    do
    {
      double v5 = *v3++;
      if (v5 > 0.0) {
        ++v2;
      }
      --v4;
    }
    while (v4);
  }
  switch(*a2)
  {
    case 0:
      operator new[]();
    case 1:
    case 3:
      solve_l2r_l1l2_svc();
    case 2:
      operator new[]();
    case 5:
      transpose();
    case 6:
      transpose();
    case 7:
      operator new[]();
    case 0xB:
      operator new[]();
    case 0xC:
    case 0xD:
      solve_l2r_l1l2_svr();
    default:
      uint64_t v6 = (FILE *)*MEMORY[0x263EF8348];
      return fwrite("ERROR: unknown solver_type\n", 0x1BuLL, 1uLL, v6);
  }
}

void sub_21430956C(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x10F1C408938F244);
  _Unwind_Resume(a1);
}

void cross_validation(unsigned int *a1, long long *a2, int a3, uint64_t a4)
{
  uint64_t v7 = *a1;
  uint64_t v8 = (int *)malloc_type_malloc(4 * (int)v7, 0x100004052888210uLL);
  if ((int)v7 < a3)
  {
    fwrite("WARNING: # folds > # data. Will use # folds = # data instead (i.e., leave-one-out cross validation)\n", 0x64uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    a3 = v7;
  }
  uint64_t v9 = (a3 + 1);
  long long v10 = (int *)malloc_type_malloc(4 * (int)v9, 0x100004052888210uLL);
  if ((int)v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
      v8[i] = i;
    uint64_t v12 = 0;
    uint64_t v13 = v7;
    do
    {
      uint64_t v14 = v12 + rand() % (int)v13;
      int v15 = v8[v12];
      v8[v12] = v8[v14];
      v8[v14] = v15;
      ++v12;
      --v13;
    }
    while (v13);
  }
  if ((a3 & 0x80000000) == 0)
  {
    int v16 = 0;
    uint64_t v17 = v10;
    do
    {
      *v17++ = v16 / a3;
      v16 += v7;
      --v9;
    }
    while (v9);
    if (a3 >= 1)
    {
      uint64_t v18 = 0;
      uint64_t v34 = a3;
      do
      {
        uint64_t v19 = v10[v18++];
        uint64_t v20 = v10[v18];
        uint64_t v39 = *((void *)a1 + 3);
        unsigned int v21 = a1[1];
        LODWORD(v36) = v19 - v20 + v7;
        HIDWORD(v36) = v21;
        char v38 = malloc_type_malloc(8 * SLODWORD(v36), 0x2004093837F09uLL);
        __int32 v37 = malloc_type_malloc(8 * SLODWORD(v36), 0x100004000313F17uLL);
        if ((int)v19 < 1)
        {
          unsigned int v24 = 0;
        }
        else
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            uint64_t v23 = v8[j];
            *((void *)v38 + j) = *(void *)(*((void *)a1 + 2) + 8 * v23);
            *((void *)v37 + j) = *(void *)(*((void *)a1 + 1) + 8 * v23);
          }
          unsigned int v24 = v19;
        }
        if ((int)v20 < (int)v7)
        {
          uint64_t v25 = (int)v7 - v20;
          uint64_t v26 = 8 * v24;
          double v27 = &v8[v20];
          do
          {
            uint64_t v28 = *v27++;
            *(void *)((char *)v38 + v26) = *(void *)(*((void *)a1 + 2) + 8 * v28);
            *(void *)((char *)v37 + v26) = *(void *)(*((void *)a1 + 1) + 8 * v28);
            v26 += 8;
            --v25;
          }
          while (v25);
        }
        uint64_t v29 = train(&v36, a2);
        if ((int)v19 < (int)v20)
        {
          uint64_t v30 = &v8[(int)v19];
          int v31 = v20 - v19;
          do
          {
            double v32 = predict((uint64_t)v29, *(_DWORD **)(*((void *)a1 + 2) + 8 * *v30));
            uint64_t v33 = *v30++;
            *(double *)(a4 + 8 * v33) = v32;
            --v31;
          }
          while (v31);
        }
        if (v29)
        {
          free_model_content((uint64_t)v29);
          free(v29);
        }
        free(v38);
        free(v37);
      }
      while (v18 != v34);
    }
  }
  free(v10);
  free(v8);
}

double predict(uint64_t a1, _DWORD *a2)
{
  uint64_t v4 = (double *)malloc_type_malloc(8 * *(int *)(a1 + 56), 0x100004000313F17uLL);
  double v5 = predict_values(a1, a2, v4);
  free(v4);
  return v5;
}

void free_and_destroy_model(uint64_t *a1)
{
  uint64_t v1 = (void *)*a1;
  if (*a1)
  {
    free_model_content(*a1);
    free(v1);
  }
}

double predict_values_vn(uint64_t a1, double *a2, double *a3, int a4)
{
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(unsigned int *)(a1 + 56);
  if (v5 == 2)
  {
    uint64_t v6 = v4 - 8;
    uint64_t v7 = v4 - 8 * v5;
    if (*(_DWORD *)a1 == 4) {
      int v8 = 2;
    }
    else {
      int v8 = 1;
    }
    int v9 = 0;
    if (*(_DWORD *)a1 != 4) {
      uint64_t v7 = v6;
    }
    goto LABEL_10;
  }
  uint64_t v7 = v4 - 8 * (int)v5;
  if ((int)v5 < 8)
  {
    int v9 = 0;
    int v8 = *(_DWORD *)(a1 + 56);
LABEL_10:
    long long v10 = (float64x2_t *)a3;
    goto LABEL_21;
  }
  int v9 = v5 & 0x7FFFFFF8;
  int v11 = 8;
  long long v10 = (float64x2_t *)a3;
  do
  {
    if (a4 >= 2)
    {
      float64x2_t v18 = 0uLL;
      int v19 = 2;
      float64x2_t v20 = 0uLL;
      float64x2_t v21 = 0uLL;
      float64x2_t v22 = 0uLL;
      float64x2_t v23 = 0uLL;
      float64x2_t v24 = 0uLL;
      float64x2_t v25 = 0uLL;
      uint64_t v14 = a2;
      float64x2_t v26 = 0uLL;
      do
      {
        int v27 = *(_DWORD *)v14;
        double v28 = v14[1];
        int v29 = *((_DWORD *)v14 + 4);
        double v30 = v14[3];
        v14 += 4;
        int v31 = (float64x2_t *)(v7 + 8 * v27 * (int)v5);
        double v32 = (float64x2_t *)(v7 + 8 * v29 * (int)v5);
        float64x2_t v18 = vmlaq_n_f64(v18, *v31, v28);
        float64x2_t v20 = vmlaq_n_f64(v20, v31[1], v28);
        float64x2_t v21 = vmlaq_n_f64(v21, *v32, v30);
        float64x2_t v22 = vmlaq_n_f64(v22, v32[1], v30);
        float64x2_t v23 = vmlaq_n_f64(v23, v31[2], v28);
        float64x2_t v24 = vmlaq_n_f64(v24, v31[3], v28);
        float64x2_t v25 = vmlaq_n_f64(v25, v32[2], v30);
        float64x2_t v26 = vmlaq_n_f64(v26, v32[3], v30);
        v19 += 2;
      }
      while (v19 <= a4);
      float64x2_t v13 = vaddq_f64(v21, v18);
      float64x2_t v15 = vaddq_f64(v22, v20);
      float64x2_t v16 = vaddq_f64(v25, v23);
      signed int v12 = a4 & 0xFFFFFFFE;
      float64x2_t v17 = vaddq_f64(v26, v24);
    }
    else
    {
      signed int v12 = 0;
      float64x2_t v13 = 0uLL;
      uint64_t v14 = a2;
      float64x2_t v15 = 0uLL;
      float64x2_t v16 = 0uLL;
      float64x2_t v17 = 0uLL;
    }
    if (v12 < a4)
    {
      double v33 = v14[1];
      uint64_t v34 = (float64x2_t *)(v7 + 8 * *(_DWORD *)v14 * (int)v5);
      float64x2_t v13 = vmlaq_n_f64(v13, *v34, v33);
      float64x2_t v15 = vmlaq_n_f64(v15, v34[1], v33);
      float64x2_t v16 = vmlaq_n_f64(v16, v34[2], v33);
      float64x2_t v17 = vmlaq_n_f64(v17, v34[3], v33);
    }
    *long long v10 = v13;
    v10[1] = v15;
    v10[2] = v16;
    v10[3] = v17;
    v10 += 4;
    v7 += 64;
    v11 += 8;
  }
  while (v11 <= (int)v5);
  int v8 = v5;
LABEL_21:
  int v35 = v9 | 6;
  if ((v9 | 6) <= v8)
  {
    do
    {
      int v9 = v35;
      if (a4 >= 2)
      {
        float64x2_t v41 = 0uLL;
        int v42 = 2;
        float64x2_t v43 = 0uLL;
        float64x2_t v44 = 0uLL;
        float64x2_t v45 = 0uLL;
        char v38 = a2;
        float64x2_t v46 = 0uLL;
        float64x2_t v47 = 0uLL;
        do
        {
          int v48 = *(_DWORD *)v38;
          double v49 = v38[1];
          int v50 = *((_DWORD *)v38 + 4);
          double v51 = v38[3];
          v38 += 4;
          uint64_t v52 = (float64x2_t *)(v7 + 8 * v48 * v8);
          unint64_t v53 = (float64x2_t *)(v7 + 8 * v50 * v8);
          float64x2_t v41 = vmlaq_n_f64(v41, *v52, v49);
          float64x2_t v43 = vmlaq_n_f64(v43, v52[1], v49);
          float64x2_t v44 = vmlaq_n_f64(v44, *v53, v51);
          float64x2_t v45 = vmlaq_n_f64(v45, v53[1], v51);
          float64x2_t v47 = vmlaq_n_f64(v47, v52[2], v49);
          float64x2_t v46 = vmlaq_n_f64(v46, v53[2], v51);
          v42 += 2;
        }
        while (v42 <= a4);
        float64x2_t v37 = vaddq_f64(v44, v41);
        float64x2_t v39 = vaddq_f64(v45, v43);
        float64x2_t v40 = vaddq_f64(v47, v46);
        signed int v36 = a4 & 0xFFFFFFFE;
      }
      else
      {
        signed int v36 = 0;
        float64x2_t v37 = 0uLL;
        char v38 = a2;
        float64x2_t v39 = 0uLL;
        float64x2_t v40 = 0uLL;
      }
      if (v36 < a4)
      {
        double v54 = v38[1];
        size_t v55 = (float64x2_t *)(v7 + 8 * *(_DWORD *)v38 * v8);
        float64x2_t v37 = vmlaq_n_f64(v37, *v55, v54);
        float64x2_t v39 = vmlaq_n_f64(v39, v55[1], v54);
        float64x2_t v40 = vmlaq_n_f64(v40, v55[2], v54);
      }
      *long long v10 = v37;
      v10[1] = v39;
      v10[2] = v40;
      v10 += 3;
      v7 += 48;
      int v35 = v9 + 6;
    }
    while (v9 + 6 <= v8);
  }
  for (int i = v9 + 4; v9 + 4 <= v8; int i = v9 + 4)
  {
    int v9 = i;
    if (a4 >= 2)
    {
      float64x2_t v61 = 0uLL;
      int v62 = 2;
      float64x2_t v63 = 0uLL;
      float64x2_t v64 = 0uLL;
      v59 = a2;
      float64x2_t v65 = 0uLL;
      do
      {
        double v66 = v59[1];
        int v67 = *(_DWORD *)v59;
        double v68 = v59[3];
        int v69 = *((_DWORD *)v59 + 4);
        v59 += 4;
        uint64_t v70 = (float64x2_t *)(v7 + 8 * v67 * v8);
        uint64_t v71 = (float64x2_t *)(v7 + 8 * v69 * v8);
        float64x2_t v61 = vmlaq_n_f64(v61, *v70, v66);
        float64x2_t v63 = vmlaq_n_f64(v63, v70[1], v66);
        float64x2_t v64 = vmlaq_n_f64(v64, *v71, v68);
        float64x2_t v65 = vmlaq_n_f64(v65, v71[1], v68);
        v62 += 2;
      }
      while (v62 <= a4);
      float64x2_t v58 = vaddq_f64(v64, v61);
      float64x2_t v60 = vaddq_f64(v65, v63);
      signed int v57 = a4 & 0xFFFFFFFE;
    }
    else
    {
      signed int v57 = 0;
      float64x2_t v58 = 0uLL;
      v59 = a2;
      float64x2_t v60 = 0uLL;
    }
    if (v57 < a4)
    {
      double v72 = v59[1];
      uint64_t v73 = (float64x2_t *)(v7 + 8 * *(_DWORD *)v59 * v8);
      float64x2_t v58 = vmlaq_n_f64(v58, *v73, v72);
      float64x2_t v60 = vmlaq_n_f64(v60, v73[1], v72);
    }
    *long long v10 = v58;
    v10[1] = v60;
    v10 += 2;
    v7 += 32;
  }
  for (int j = v9 + 2; v9 + 2 <= v8; int j = v9 + 2)
  {
    int v9 = j;
    if (a4 >= 4)
    {
      float64x2_t v79 = 0uLL;
      int v80 = 4;
      float64x2_t v81 = 0uLL;
      float64x2_t v82 = 0uLL;
      v77 = a2;
      float64x2_t v83 = 0uLL;
      do
      {
        double v84 = v77[1];
        int v85 = *(_DWORD *)v77;
        double v86 = v77[3];
        int v87 = *((_DWORD *)v77 + 4);
        double v88 = v77[5];
        int v89 = *((_DWORD *)v77 + 8);
        double v90 = v77[7];
        int v91 = *((_DWORD *)v77 + 12);
        v77 += 8;
        float64x2_t v79 = vmlaq_n_f64(v79, *(float64x2_t *)(v7 + 8 * v85 * v8), v84);
        float64x2_t v81 = vmlaq_n_f64(v81, *(float64x2_t *)(v7 + 8 * v87 * v8), v86);
        float64x2_t v83 = vmlaq_n_f64(v83, *(float64x2_t *)(v7 + 8 * v89 * v8), v88);
        float64x2_t v82 = vmlaq_n_f64(v82, *(float64x2_t *)(v7 + 8 * v91 * v8), v90);
        v80 += 4;
      }
      while (v80 <= a4);
      float64x2_t v76 = vaddq_f64(v83, v79);
      float64x2_t v78 = vaddq_f64(v82, v81);
      unsigned int v75 = a4 & 0xFFFFFFFC;
    }
    else
    {
      unsigned int v75 = 0;
      float64x2_t v76 = 0uLL;
      v77 = a2;
      float64x2_t v78 = 0uLL;
    }
    if ((int)(v75 | 2) <= a4)
    {
      do
      {
        double v93 = v77[1];
        int v94 = *(_DWORD *)v77;
        double v95 = v77[3];
        int v96 = *((_DWORD *)v77 + 4);
        v77 += 4;
        float64x2_t v76 = vmlaq_n_f64(v76, *(float64x2_t *)(v7 + 8 * v94 * v8), v93);
        float64x2_t v78 = vmlaq_n_f64(v78, *(float64x2_t *)(v7 + 8 * v96 * v8), v95);
        signed int v92 = v75 + 2;
        int v97 = v75 + 4;
        v75 += 2;
      }
      while (v97 <= a4);
    }
    else
    {
      signed int v92 = v75;
    }
    float64x2_t v98 = vaddq_f64(v78, v76);
    if (v92 < a4) {
      float64x2_t v98 = vmlaq_n_f64(v98, *(float64x2_t *)(v7 + 8 * *(_DWORD *)v77 * v8), v77[1]);
    }
    *v10++ = v98;
    v7 += 16;
  }
  if (v9 < v8)
  {
    if (a4 >= 2)
    {
      signed int v99 = a4 & 0xFFFFFFFE;
      double v101 = 0.0;
      int v102 = 2;
      double v103 = 0.0;
      do
      {
        int v104 = *(_DWORD *)a2;
        double v105 = a2[1];
        int v106 = *((_DWORD *)a2 + 4);
        double v107 = a2[3];
        a2 += 4;
        double v103 = v103 + *(double *)(v7 + 8 * v104 * v8) * v105;
        double v101 = v101 + *(double *)(v7 + 8 * v106 * v8) * v107;
        v102 += 2;
      }
      while (v102 <= a4);
      double v100 = v103 + v101;
    }
    else
    {
      signed int v99 = 0;
      double v100 = 0.0;
    }
    if (v99 < a4) {
      double v100 = v100 + *(double *)(v7 + 8 * *(_DWORD *)a2 * v8) * a2[1];
    }
    v10->f64[0] = v100;
  }
  if (v5 == 2)
  {
    double result = *a3;
    if ((*(_DWORD *)a1 - 11) < 3) {
      return result;
    }
    v109 = (int *)(*(void *)(a1 + 72) + 4 * (result <= 0.0));
  }
  else
  {
    if ((int)v5 < 2)
    {
      uint64_t v112 = 0;
    }
    else
    {
      int v110 = 0;
      for (uint64_t k = 1; k != v5; ++k)
      {
        if (a3[k] > a3[v110]) {
          int v110 = k;
        }
      }
      uint64_t v112 = v110;
    }
    v109 = (int *)(*(void *)(a1 + 72) + 4 * v112);
  }
  return (double)*v109;
}

double predict_values(uint64_t a1, _DWORD *a2, double *a3)
{
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(unsigned int *)(a1 + 56);
  if (v4 == 2)
  {
    int v5 = 0;
    if (*(_DWORD *)a1 == 4) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
    goto LABEL_7;
  }
  if ((int)v4 < 8)
  {
    int v5 = 0;
    int v6 = *(_DWORD *)(a1 + 56);
LABEL_7:
    uint64_t v7 = (float64x2_t *)a3;
    goto LABEL_16;
  }
  int v5 = v4 & 0x7FFFFFF8;
  int v8 = 8;
  uint64_t v7 = (float64x2_t *)a3;
  do
  {
    int v9 = *a2;
    if (*a2 == -1)
    {
      float64x2_t v14 = 0uLL;
      float64x2_t v13 = 0uLL;
      float64x2_t v12 = 0uLL;
      float64x2_t v10 = 0uLL;
    }
    else
    {
      float64x2_t v10 = 0uLL;
      int v11 = (double *)(a2 + 4);
      float64x2_t v12 = 0uLL;
      float64x2_t v13 = 0uLL;
      float64x2_t v14 = 0uLL;
      do
      {
        double v15 = *(v11 - 1);
        float64x2_t v16 = (float64x2_t *)(v3 + 8 * (v9 - 1) * (int)v4);
        float64x2_t v10 = vmlaq_n_f64(v10, *v16, v15);
        float64x2_t v12 = vmlaq_n_f64(v12, v16[1], v15);
        float64x2_t v14 = vmlaq_n_f64(v14, v16[2], v15);
        float64x2_t v13 = vmlaq_n_f64(v13, v16[3], v15);
        int v17 = *(_DWORD *)v11;
        v11 += 2;
        int v9 = v17;
      }
      while (v17 != -1);
    }
    *uint64_t v7 = v10;
    v7[1] = v12;
    v7[2] = v14;
    v7[3] = v13;
    v7 += 4;
    v3 += 64;
    v8 += 8;
  }
  while (v8 <= (int)v4);
  int v6 = v4;
LABEL_16:
  int v18 = v5 | 4;
  if ((v5 | 4) <= v6)
  {
    do
    {
      int v5 = v18;
      int v19 = *a2;
      if (*a2 == -1)
      {
        float64x2_t v22 = 0uLL;
        float64x2_t v20 = 0uLL;
      }
      else
      {
        float64x2_t v20 = 0uLL;
        float64x2_t v21 = (double *)(a2 + 4);
        float64x2_t v22 = 0uLL;
        do
        {
          double v23 = *(v21 - 1);
          float64x2_t v24 = (float64x2_t *)(v3 + 8 * (v19 - 1) * v6);
          float64x2_t v20 = vmlaq_n_f64(v20, *v24, v23);
          float64x2_t v22 = vmlaq_n_f64(v22, v24[1], v23);
          int v25 = *(_DWORD *)v21;
          v21 += 2;
          int v19 = v25;
        }
        while (v25 != -1);
      }
      *uint64_t v7 = v20;
      v7[1] = v22;
      v7 += 2;
      v3 += 32;
      int v18 = v5 + 4;
    }
    while (v5 + 4 <= v6);
  }
  for (int i = v5 + 2; v5 + 2 <= v6; int i = v5 + 2)
  {
    int v5 = i;
    int v27 = *a2;
    float64x2_t v28 = 0uLL;
    if (*a2 != -1)
    {
      int v29 = (double *)(a2 + 4);
      do
      {
        float64x2_t v28 = vmlaq_n_f64(v28, *(float64x2_t *)(v3 + 8 * (v27 - 1) * v6), *(v29 - 1));
        int v30 = *(_DWORD *)v29;
        v29 += 2;
        int v27 = v30;
      }
      while (v30 != -1);
    }
    *v7++ = v28;
    v3 += 16;
  }
  if (v5 < v6)
  {
    int v31 = *a2;
    if (*a2 == -1)
    {
      double v33 = 0.0;
    }
    else
    {
      double v32 = (double *)(a2 + 4);
      double v33 = 0.0;
      do
      {
        double v33 = v33 + *(double *)(v3 + 8 * (v31 - 1) * v6) * *(v32 - 1);
        int v34 = *(_DWORD *)v32;
        v32 += 2;
        int v31 = v34;
      }
      while (v34 != -1);
    }
    v7->f64[0] = v33;
  }
  if (v4 == 2)
  {
    double result = *a3;
    if ((*(_DWORD *)a1 - 11) < 3) {
      return result;
    }
    signed int v36 = (int *)(*(void *)(a1 + 72) + 4 * (result <= 0.0));
  }
  else
  {
    if ((int)v4 < 2)
    {
      uint64_t v39 = 0;
    }
    else
    {
      int v37 = 0;
      for (uint64_t j = 1; j != v4; ++j)
      {
        if (a3[j] > a3[v37]) {
          int v37 = j;
        }
      }
      uint64_t v39 = v37;
    }
    signed int v36 = (int *)(*(void *)(a1 + 72) + 4 * v39);
  }
  return (double)*v36;
}

double predict_vn()
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = MEMORY[0x270FA5388]();
  return predict_values_vn(v0, v2, (double *)((char *)v5 - ((v1 + 15) & 0xFFFFFFFF0)), v3);
}

double predict_probability(_DWORD *a1, _DWORD *a2, double *a3)
{
  if (*a1 > 7u || ((1 << *a1) & 0xC1) == 0) {
    return 0.0;
  }
  uint64_t v4 = a3;
  uint64_t v5 = a1[14];
  if (v5 == 2) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }
  double v7 = predict_values((uint64_t)a1, a2, a3);
  if ((int)v6 >= 1)
  {
    int v8 = v4;
    do
    {
      *int v8 = 1.0 / (exp(-*v8) + 1.0);
      ++v8;
      --v6;
    }
    while (v6);
  }
  if (v5 == 2)
  {
    v4[1] = 1.0 - *v4;
  }
  else if ((int)v5 >= 1)
  {
    double v9 = 0.0;
    uint64_t v10 = v5;
    int v11 = v4;
    do
    {
      double v12 = *v11++;
      double v9 = v9 + v12;
      --v10;
    }
    while (v10);
    do
    {
      *uint64_t v4 = *v4 / v9;
      ++v4;
      --v5;
    }
    while (v5);
  }
  return v7;
}

BOOL check_probability_model(_DWORD *a1)
{
  if (*a1) {
    BOOL v1 = *a1 == 7;
  }
  else {
    BOOL v1 = 1;
  }
  return v1 || *a1 == 6;
}

uint64_t save_model(const char *a1, double *a2)
{
  unsigned int v3 = *((_DWORD *)a2 + 15);
  if (a2[10] < 0.0) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = v3 + 1;
  }
  uint64_t v5 = fopen(a1, "w");
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = v5;
  double v7 = setlocale(0, 0);
  int v18 = strdup(v7);
  setlocale(0, "C");
  unsigned int v8 = *((_DWORD *)a2 + 14);
  uint64_t v9 = *(int *)a2;
  if (v9 != 4 && v8 == 2) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v8;
  }
  fprintf(v6, "solver_type %s\n", solver_type_table[v9]);
  fprintf(v6, "nr_class %d\n", *((_DWORD *)a2 + 14));
  if (*((void *)a2 + 9))
  {
    fwrite("label", 5uLL, 1uLL, v6);
    if (*((int *)a2 + 14) >= 1)
    {
      uint64_t v12 = 0;
      do
        fprintf(v6, " %d", *(_DWORD *)(*((void *)a2 + 9) + 4 * v12++));
      while (v12 < *((int *)a2 + 14));
    }
    fputc(10, v6);
  }
  fprintf(v6, "nr_feature %d\n", v3);
  fprintf(v6, "bias %.16g\n", a2[10]);
  fwrite("w\n", 2uLL, 1uLL, v6);
  if ((int)v4 >= 1)
  {
    uint64_t v13 = 0;
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((int)v11 >= 1)
      {
        uint64_t v15 = v11;
        uint64_t v16 = v13;
        do
        {
          fprintf(v6, "%.16g ", *(double *)(*((void *)a2 + 8) + v16));
          v16 += 8;
          --v15;
        }
        while (v15);
      }
      fputc(10, v6);
      v13 += 8 * (int)v11;
    }
  }
  setlocale(0, v18);
  free(v18);
  if (ferror(v6)) {
    return 0xFFFFFFFFLL;
  }
  if (fclose(v6)) {
    return 0xFFFFFFFFLL;
  }
  return 0;
}

FILE *load_model(const char *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  double result = fopen(a1, "r");
  if (result)
  {
    int v2 = result;
    int v21 = 0;
    int v22 = 0;
    uint64_t v20 = 0;
    unsigned int v3 = (int *)malloc_type_malloc(0x58uLL, 0x10900405E350820uLL);
    *((void *)v3 + 9) = 0;
    uint64_t v4 = setlocale(0, 0);
    int v19 = strdup(v4);
    setlocale(0, "C");
    while (1)
    {
      while (1)
      {
        while (1)
        {
          while (1)
          {
            while (1)
            {
              fscanf(v2, "%80s", __s2);
              if (*(void *)__s2 != 0x745F7265766C6F73 || *(_DWORD *)&__s2[8] != 6647929) {
                break;
              }
              fscanf(v2, "%80s", __s2);
              uint64_t v11 = 0;
              while (strcmp(solver_type_table[v11], __s2))
              {
                if (++v11 == 14)
                {
                  fwrite("unknown solver type.\n", 0x15uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
                  goto LABEL_31;
                }
              }
              *unsigned int v3 = v11;
            }
            if (*(void *)__s2 ^ 0x7373616C635F726ELL | __s2[8]) {
              break;
            }
            fscanf(v2, "%d", &v21);
            v3[14] = v21;
          }
          if (*(void *)__s2 != 0x75746165665F726ELL || *(void *)&__s2[3] != 0x65727574616566) {
            break;
          }
          fscanf(v2, "%d", &v22);
          v3[15] = v22;
        }
        if (*(_DWORD *)__s2 ^ 0x73616962 | __s2[4]) {
          break;
        }
        fscanf(v2, "%lf", &v20);
        *((void *)v3 + 10) = v20;
      }
      if (*(unsigned __int16 *)__s2 == 119) {
        break;
      }
      if (*(_DWORD *)__s2 != 1700946284 || *(unsigned __int16 *)&__s2[4] != 108)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "unknown text in model file: [%s]\n", __s2);
LABEL_31:
        setlocale(0, v19);
        free(*((void **)v3 + 9));
        free(v3);
        free(v19);
        return 0;
      }
      uint64_t v8 = v3[14];
      *((void *)v3 + 9) = malloc_type_malloc(4 * v8, 0x100004052888210uLL);
      if ((int)v8 >= 1)
      {
        uint64_t v9 = 0;
        uint64_t v10 = 4 * v8;
        do
        {
          fscanf(v2, "%d", *((void *)v3 + 9) + v9);
          v9 += 4;
        }
        while (v10 != v9);
      }
    }
    unsigned int v12 = v3[15];
    int v22 = v12;
    if (*((double *)v3 + 10) < 0.0) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = v12 + 1;
    }
    int v14 = v21;
    if (v21 == 2 && *v3 != 4) {
      int v14 = 1;
    }
    *((void *)v3 + 8) = malloc_type_malloc(8 * v14 * (int)v13, 0x100004000313F17uLL);
    if ((int)v13 >= 1)
    {
      uint64_t v15 = 0;
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (v14 >= 1)
        {
          uint64_t v17 = v14;
          uint64_t v18 = v15;
          do
          {
            fscanf(v2, "%lf ", *((void *)v3 + 8) + v18);
            v18 += 8;
            --v17;
          }
          while (v17);
        }
        fscanf(v2, "\n");
        v15 += 8 * v14;
      }
    }
    setlocale(0, v19);
    free(v19);
    if (ferror(v2)) {
      return 0;
    }
    if (fclose(v2)) {
      return 0;
    }
    else {
      return (FILE *)v3;
    }
  }
  return result;
}

uint64_t get_nr_feature(uint64_t a1)
{
  return *(unsigned int *)(a1 + 60);
}

uint64_t get_nr_class(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

uint64_t get_labels(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 72);
  if (v2 && *(int *)(result + 56) >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      *(_DWORD *)(a2 + 4 * v3) = *(_DWORD *)(v2 + 4 * v3);
      ++v3;
    }
    while (v3 < *(int *)(result + 56));
  }
  return result;
}

double get_decfun_coef(uint64_t a1, int a2, int a3)
{
  double result = 0.0;
  if (*(_DWORD *)(a1 + 60) >= a2)
  {
    uint64_t v4 = (a2 - 1);
    if (a2 >= 1)
    {
      uint64_t v5 = *(void *)(a1 + 64);
      if ((*(_DWORD *)a1 - 11) <= 2) {
        return *(double *)(v5 + 8 * v4);
      }
      if ((a3 & 0x80000000) == 0)
      {
        int v6 = *(_DWORD *)(a1 + 56);
        if (v6 > a3)
        {
          if (v6 == 2 && *(_DWORD *)a1 != 4)
          {
            double result = *(double *)(v5 + 8 * v4);
            if (a3) {
              return -result;
            }
            return result;
          }
          uint64_t v4 = a3 + v6 * (int)v4;
          return *(double *)(v5 + 8 * v4);
        }
      }
    }
  }
  return result;
}

double get_decfun_bias(uint64_t a1, int a2)
{
  double v2 = *(double *)(a1 + 80);
  double result = 0.0;
  if (v2 > 0.0)
  {
    uint64_t v4 = *(unsigned int *)(a1 + 60);
    if ((v4 & 0x80000000) == 0)
    {
      uint64_t v5 = *(void *)(a1 + 64);
      if ((*(_DWORD *)a1 - 11) > 2)
      {
        if (a2 < 0) {
          return v2 * result;
        }
        int v6 = *(_DWORD *)(a1 + 56);
        if (v6 <= a2) {
          return v2 * result;
        }
        if (v6 == 2 && *(_DWORD *)a1 != 4)
        {
          double result = *(double *)(v5 + 8 * v4);
          if (a2) {
            double result = -result;
          }
          return v2 * result;
        }
        uint64_t v4 = a2 + v6 * (int)v4;
      }
      double result = *(double *)(v5 + 8 * v4);
    }
    return v2 * result;
  }
  return result;
}

void free_model_content(uint64_t a1)
{
  double v2 = *(void **)(a1 + 64);
  if (v2) {
    free(v2);
  }
  uint64_t v3 = *(void **)(a1 + 72);
  if (v3)
  {
    free(v3);
  }
}

void destroy_param(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  if (v2) {
    free(v2);
  }
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3)
  {
    free(v3);
  }
}

const char *check_parameter(uint64_t a1, double *a2)
{
  if (a2[1] <= 0.0) {
    return "eps <= 0";
  }
  if (a2[2] <= 0.0) {
    return "C <= 0";
  }
  if (a2[6] < 0.0) {
    return "p < 0";
  }
  uint64_t v3 = *(int *)a2;
  if (v3 > 0xD) {
    return "unknown solver type";
  }
  else {
    return (const char *)qword_264202060[v3];
  }
}

uint64_t (*set_print_string_function(uint64_t (*result)(const char *)))(const char *)
{
  if (result) {
    BOOL v1 = result;
  }
  else {
    BOOL v1 = print_string_stdout;
  }
  liblinear_print_string = v1;
  return result;
}

uint64_t print_string_stdout(const char *a1)
{
  BOOL v1 = (FILE **)MEMORY[0x263EF8358];
  fputs(a1, (FILE *)*MEMORY[0x263EF8358]);
  double v2 = *v1;

  return fflush(v2);
}

{
  FILE **v1;
  FILE *v2;
  uint64_t vars8;

  BOOL v1 = (FILE **)MEMORY[0x263EF8358];
  fputs(a1, (FILE *)*MEMORY[0x263EF8358]);
  double v2 = *v1;

  return fflush(v2);
}

void CPMLlinearSVM::l2r_l2_svr_fun::~l2r_l2_svr_fun(CPMLlinearSVM::l2r_l2_svr_fun *this)
{
  CPMLlinearSVM::l2r_l2_svc_fun::~l2r_l2_svc_fun(this);

  JUMPOUT(0x21669DB80);
}

void solve_l2r_l1l2_svc()
{
}

void transpose()
{
}

void solve_l2r_l1l2_svr()
{
}

void CPMLSerialization::CPMLSerialization(CPMLSerialization *this, sqlite3 *a2)
{
  this->var0 = (void **)&unk_26C50FBE8;
  this->var1 = 1;
  *(void *)&this->var2 = 0xFFFFFFFFLL;
  this->var4 = 0;
  this->var5 = a2;
}

void CPMLSerialization::~CPMLSerialization(CPMLSerialization *this)
{
  this->var0 = (void **)&unk_26C50FBE8;
  var4 = this->var4;
  if (var4)
  {
    size_t var3 = this->var3;
    if ((int)var3 >= 1)
    {
      uint64_t v4 = (CPMLLog *)munmap(var4, var3);
      if ((v4 & 0x80000000) != 0)
      {
        CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v4);
        CPMLLog::log(CPMLLog, CPML_LOG_ERR, "~CPMLSerialization", "unmap failed");
      }
    }
  }
  int var2 = this->var2;
  if ((var2 & 0x80000000) == 0) {
    close(var2);
  }
}

{
  uint64_t vars8;

  CPMLSerialization::~CPMLSerialization(this);

  JUMPOUT(0x21669DB80);
}

void *CPMLLog::getCPMLLog(CPMLLog *this)
{
  {
    CPMLLog::CPMLLog((CPMLLog *)&CPMLLog::getCPMLLog(void)::instance);
    __cxa_atexit((void (*)(void *))CPMLLog::~CPMLLog, &CPMLLog::getCPMLLog(void)::instance, &dword_2142FE000);
  }
  return &CPMLLog::getCPMLLog(void)::instance;
}

void sub_21430BC10(_Unwind_Exception *a1)
{
}

uint64_t CPMLSerialization::cp_write(CPMLSerialization *this, int *a2, const char *a3, unint64_t a4, const char *a5)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_write", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_write(CPMLSerialization *this, unsigned int *a2, const char *a3, unint64_t a4, const char *a5)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_write", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_write(CPMLSerialization *this, unint64_t *a2, const char *a3, unint64_t a4, const char *a5)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_write", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_write(CPMLSerialization *this, float *a2, const char *a3, unint64_t a4, const char *a5)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_write", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_write(CPMLSerialization *this, double *a2, const char *a3, unint64_t a4, const char *a5)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_write", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_write(CPMLSerialization *this, char *a2, const char *a3, unint64_t a4, const char *a5)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_write", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_read(CPMLSerialization *this, int *a2, const char *a3)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_read", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_read(CPMLSerialization *this, unsigned int *a2, const char *a3)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_read", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_read(CPMLSerialization *this, unint64_t *a2, const char *a3)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_read", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_read(CPMLSerialization *this, float *a2, const char *a3)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_read", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_read(CPMLSerialization *this, double *a2, const char *a3)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_read", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_read(CPMLSerialization *this, char *a2, const char *a3)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_read", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_doSerialization(CPMLSerialization *this)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_doSerialization", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::reset(CPMLSerialization *this)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "reset", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_query_uint64_t(CPMLSerialization *this, unint64_t *a2, unint64_t a3, char *a4, char *a5)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_query_uint64_t", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_query_double(CPMLSerialization *this, double *a2, unint64_t a3, char *a4, char *a5)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_query_double", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_update_int(CPMLSerialization *this, int a2, char *a3, char *a4)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_update_int", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_update_uint64_t(CPMLSerialization *this, unint64_t a2, char *a3, char *a4)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_update_uint64_t", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_update_double(CPMLSerialization *this, double a2, char *a3, char *a4)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_update_double", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_singleQuery_string(CPMLSerialization *this, char *a2, unint64_t a3, char *a4)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_singleQuery_string", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_singleQuery_uint64_t(CPMLSerialization *this, unint64_t *a2, char *a3)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_singleQuery_uint64_t", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_multiQuery_int(CPMLSerialization *this, int *a2, unint64_t a3, const char *a4)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_multiQuery_int", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_multiQuery_uint64_t(CPMLSerialization *this, unint64_t *a2, unint64_t a3, const char *a4)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_multiQuery_uint64_t", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_multiQuery_double(CPMLSerialization *this, double *a2, unint64_t a3, const char *a4)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_multiQuery_double", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

uint64_t CPMLSerialization::cp_singleQuery_double(CPMLSerialization *this, double *a2, char *a3)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_singleQuery_double", "unimplemented function.");
  return 0xFFFFFFFFLL;
}

pthread_mutex_t *CPMLSerialization::cp_createTable(CPMLSerialization *this, char *a2, char *a3)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  int v4 = CPML_LOG_ERR;

  return CPMLLog::log(CPMLLog, v4, "cp_createTable", "unimplemented function.");
}

pthread_mutex_t *CPMLSerialization::cp_insertIntoTable(CPMLSerialization *this, char *a2, char *a3, char *a4)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  int v5 = CPML_LOG_ERR;

  return CPMLLog::log(CPMLLog, v5, "cp_insertIntoTable", "unimplemented function.");
}

uint64_t CPMLSerialization::cp_saveCache(CPMLSerialization *this, char *a2, void *__buf, int a4)
{
  int var2 = this->var2;
  if (var2 == -1)
  {
    int var2 = open(a2, 513, 448);
    this->int var2 = var2;
  }
  uint64_t v8 = (CPMLLog *)write(var2, __buf, a4);
  if (v8 == (CPMLLog *)a4) {
    return 0;
  }
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v8);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_saveCache", "cache saved incorrectly.\n");
  close(this->var2);
  uint64_t result = 0xFFFFFFFFLL;
  this->int var2 = -1;
  return result;
}

uint64_t CPMLSerialization::cp_loadCache(CPMLSerialization *this, char *a2, void **a3, int a4)
{
  int var2 = this->var2;
  if (var2 != -1 || (uint64_t result = open(a2, 2, 0), var2 = result, this->var2 = result, result != -1))
  {
    uint64_t v9 = mmap(0, a4, 1, 2, var2, 0);
    *a3 = v9;
    if (v9 == (void *)-1)
    {
      close(this->var2);
      uint64_t result = 0xFFFFFFFFLL;
      this->int var2 = -1;
    }
    else
    {
      uint64_t v10 = v9;
      uint64_t result = 0;
      this->size_t var3 = a4;
      this->var4 = v10;
    }
  }
  return result;
}

CPMLLog *CPMLSerialization::cp_beginTransaction(CPMLSerialization *this)
{
  return CPMLsql_beginTransaction(this->var5, 0);
}

CPMLLog *CPMLSerialization::cp_endTransaction(CPMLSerialization *this)
{
  return CPMLsql_commitTransaction(this->var5);
}

id CPMLTrainDataWith(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v4)
  {
    int v6 = 0;
    goto LABEL_5;
  }
  int v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v4];
  if (v5)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 100;
    int v6 = [MEMORY[0x263F08AC0] propertyListWithData:v5 options:0 format:&v9 error:&v8];

LABEL_5:
    int v5 = CPMLTrainDataWithDict(v3, v6);

    goto LABEL_7;
  }
  NSLog(&cfstr_SPlistIncorrec.isa, "CPMLTrainDataWith");
LABEL_7:

  return v5;
}

CPMLModel *CPMLTrainDataWithDict(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [[CPMLTrainer alloc] init:v4 withModelDBPath:0 withPropertyList:v3];

  [v5 train:0];
  int v6 = objc_alloc_init(CPMLModel);
  double v7 = [v3 objectForKey:@"modelFilenameAndPath"];
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v9 = [v8 bundleIdentifier];

    double v7 = (void *)[[NSString alloc] initWithFormat:@"/tmp/_MODEL_%@", v9];
  }
  uint64_t v10 = [[CPMLModelEvaluate alloc] initWithModel:v7 withPropertyList:v3];
  [(CPMLModel *)v6 setCpModelEvaluate:v10];

  return v6;
}

id CPMLTrainDataFrom(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [[CPMLDB alloc] initWithDBName:v4 withPlistPath:v3 withWriteOptions:3];

  int v6 = CPMLTrainDataWith(v5, v3);

  return v6;
}

id CPMLTrainDataFromDict(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [[CPMLDB alloc] initWithDBName:v4 withConfiguration:v3 withWriteOptions:3];

  int v6 = CPMLTrainDataWithDict(v5, v3);

  return v6;
}

void CPMLTrainAndSaveDataWith(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6];
    if (!v8)
    {
      NSLog(&cfstr_SPlistIncorrec.isa, "CPMLTrainAndSaveDataWith");
      goto LABEL_7;
    }
    uint64_t v9 = (void *)v8;
    uint64_t v11 = 0;
    uint64_t v12 = 100;
    uint64_t v10 = [MEMORY[0x263F08AC0] propertyListWithData:v8 options:0 format:&v12 error:&v11];
  }
  else
  {
    uint64_t v10 = 0;
  }
  CPMLTrainAndSaveDataWithDict(v5, v10, v7);

LABEL_7:
}

void CPMLTrainAndSaveDataWithDict(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  id v8 = [[CPMLTrainer alloc] init:v7 withModelDBPath:v5 withPropertyList:v6];

  if (v8) {
    [v8 train:1];
  }
  else {
    NSLog(&cfstr_CannotTrainand.isa);
  }
}

void CPMLTrainAndSaveDataFrom(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  id v8 = [[CPMLDB alloc] initWithDBName:v7 withPlistPath:v6 withWriteOptions:1];

  CPMLTrainAndSaveDataWith(v8, v6, v5);
}

void CPMLTrainAndSaveDataFromDict(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  id v8 = [[CPMLDB alloc] initWithDBName:v7 withConfiguration:v6 withWriteOptions:1];

  CPMLTrainAndSaveDataWithDict(v8, v6, v5);
}

void *CPMLTrainOBJDataWith(void *a1, uint64_t a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a1;
  id v5 = (void *)[[v3 alloc] initWithCString:a2 encoding:4];
  id v6 = CPMLTrainDataWith(v4, v5);

  return v6;
}

void *CPMLTrainOBJDataFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)[[NSString alloc] initWithCString:a1 encoding:4];
  id v4 = (void *)[[NSString alloc] initWithCString:a2 encoding:4];
  id v5 = CPMLTrainDataFrom(v3, v4);

  return v5;
}

void CPMLTrainAndSaveOBJDataWith(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = (objc_class *)NSString;
  id v6 = a1;
  id v8 = (id)[[v5 alloc] initWithCString:a2 encoding:4];
  id v7 = (void *)[[NSString alloc] initWithCString:a3 encoding:4];
  CPMLTrainAndSaveDataWith(v6, v8, v7);
}

void CPMLTrainAndSaveOBJDataFrom(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = (id)[[NSString alloc] initWithCString:a1 encoding:4];
  id v5 = (void *)[[NSString alloc] initWithCString:a2 encoding:4];
  id v6 = (void *)[[NSString alloc] initWithCString:a3 encoding:4];
  CPMLTrainAndSaveDataFrom(v7, v5, v6);
}

void CPMLLog::CPMLLog(CPMLLog *this)
{
  *(void *)this = 850045863;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((void *)this + 7) = 0;
  double v2 = (pthread_mutexattr_t *)((char *)this + 64);
  int v3 = pthread_mutexattr_init((pthread_mutexattr_t *)this + 4);
  id v4 = (FILE **)MEMORY[0x263EF8348];
  if (v3) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "pthread_mutexattr_init fail %d\n", v3);
  }
  int v5 = pthread_mutexattr_settype(v2, 2);
  if (v5) {
    fprintf(*v4, "pthread_mutexattr_settype fail %d\n", v5);
  }
  int v6 = pthread_mutex_init((pthread_mutex_t *)this, v2);
  if (v6) {
    fprintf(*v4, "pthread_mutex_init fail %d\n", v6);
  }
}

void CPMLLog::~CPMLLog(pthread_mutexattr_t *this)
{
  int v2 = pthread_mutexattr_destroy(this + 4);
  int v3 = (FILE **)MEMORY[0x263EF8348];
  if (v2) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "pthread_mutexattr_destroy fail %d\n", v2);
  }
  int v4 = pthread_mutex_destroy((pthread_mutex_t *)this);
  if (v4) {
    fprintf(*v3, "pthread_mutex_destroy fail %d\n", v4);
  }
}

pthread_mutex_t *CPMLLog::log(pthread_mutex_t *this, int a2, const char *a3, const char *a4, ...)
{
  va_start(va, a4);
  int v6 = this;
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a2 < 4 || *(void *)&this[1].__opaque[8])
  {
    pthread_mutex_lock(this);
    vsnprintf(__str, 0x200uLL, a4, va);
    if (v6[1].__opaque[8]) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s: %s", a3, __str);
    }
    return (pthread_mutex_t *)pthread_mutex_unlock(v6);
  }
  return this;
}

void CPMLNaiveBayesSuggestions::predict_sorted(uint64_t a1, uint64_t *a2, uint64_t *a3, int a4, void *a5)
{
  uint64_t v10 = (unsigned int **)*a2;
  if (*(_DWORD *)(a1 + 72) >= (signed int)(-1431655765 * ((unint64_t)(a2[1] - (void)v10) >> 3)))
  {
    CPMLNaiveBayes::predict_sorted(a1, a2, a3, a4, a5);
  }
  else
  {
    __p = 0;
    int v37 = 0;
    uint64_t v38 = 0;
    CPMLNaiveBayes::sort_candidates(a1, v10, (uint64_t)&__p);
    std::vector<int>::vector(&v35, *(int *)(a1 + 72));
    int v31 = a5;
    std::vector<std::vector<int>>::vector(&v32, *(int *)(a1 + 72));
    if (*(int *)(a1 + 72) >= 1)
    {
      uint64_t v12 = 0;
      std::vector<int>::pointer end = v35.__end_;
      do
      {
        int v14 = (int *)((char *)__p + 16 * v12 + 8);
        if (end >= v35.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v35.__begin_;
          uint64_t v17 = end - v35.__begin_;
          unint64_t v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62) {
            std::vector<double>::__throw_length_error[abi:ne180100]();
          }
          int64_t v19 = (char *)v35.__end_cap_.__value_ - (char *)v35.__begin_;
          if (((char *)v35.__end_cap_.__value_ - (char *)v35.__begin_) >> 1 > v18) {
            unint64_t v18 = v19 >> 1;
          }
          if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v20 = v18;
          }
          if (v20)
          {
            int v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v35.__end_cap_, v20);
            std::vector<int>::pointer begin = v35.__begin_;
            std::vector<int>::pointer end = v35.__end_;
          }
          else
          {
            int v21 = 0;
          }
          int v22 = (int *)&v21[4 * v17];
          *int v22 = *v14;
          uint64_t v15 = v22 + 1;
          while (end != begin)
          {
            int v23 = *--end;
            *--int v22 = v23;
          }
          v35.__begin_ = v22;
          v35.__end_ = v15;
          v35.__end_cap_.__value_ = (int *)&v21[4 * v20];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *std::vector<int>::pointer end = *v14;
          uint64_t v15 = end + 1;
        }
        v35.__end_ = v15;
        ++v12;
        std::vector<int>::pointer end = v15;
      }
      while (v12 < *(int *)(a1 + 72));
    }
    uint64_t v24 = v33;
    if ((unint64_t)v33 >= v34)
    {
      int v25 = (void *)std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(&v32, (uint64_t)&v35);
    }
    else
    {
      void *v33 = 0;
      v24[1] = 0;
      v24[2] = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v24, v35.__begin_, (uint64_t)v35.__end_, v35.__end_ - v35.__begin_);
      int v25 = v24 + 3;
    }
    double v33 = v25;
    uint64_t v26 = *a2;
    if (0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3) >= 2)
    {
      uint64_t v27 = 0;
      unint64_t v28 = 1;
      do
      {
        uint64_t v29 = v26 + v27;
        int v30 = (const void **)(v29 + 24);
        if ((unint64_t)v25 >= v34)
        {
          int v25 = (void *)std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(&v32, (uint64_t)v30);
        }
        else
        {
          void *v25 = 0;
          v25[1] = 0;
          v25[2] = 0;
          std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v25, *v30, *(void *)(v29 + 32), (uint64_t)(*(void *)(v29 + 32) - (void)*v30) >> 2);
          v25 += 3;
        }
        double v33 = v25;
        ++v28;
        uint64_t v26 = *a2;
        v27 += 24;
      }
      while (0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3) > v28);
    }
    CPMLNaiveBayes::predict_sorted(a1, &v32, a3, a4, v31);
    uint64_t v39 = (void **)&v32;
    std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](&v39);
    if (v35.__begin_)
    {
      v35.__end_ = v35.__begin_;
      operator delete(v35.__begin_);
    }
    if (__p)
    {
      int v37 = __p;
      operator delete(__p);
    }
  }
}

void sub_21430D1D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, char *a20)
{
  a20 = &a11;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a20);
  if (__p)
  {
    a15 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a17)
  {
    a18 = (uint64_t)a17;
    operator delete(a17);
  }
  _Unwind_Resume(a1);
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<int>::__vallocate[abi:ne180100](this, __n);
    std::vector<int>::pointer end = this->__end_;
    bzero(end, 4 * __n);
    this->__end_ = &end[__n];
  }
  return this;
}

void sub_21430D298(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<int>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void *std::vector<std::vector<int>>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::vector<int>>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    size_t v5 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_21430D3C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

char *std::vector<std::vector<int>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  int v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<int>>::__clear[abi:ne180100]((uint64_t *)v2);
    int v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::vector<int>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      int v6 = *(void **)(v4 - 24);
      v4 -= 24;
      size_t v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

uint64_t std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  uint64_t v15 = v11;
  uint64_t v16 = &v10[24 * v9];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v11, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  v15 += 24;
  std::vector<std::vector<int>>::__swap_out_circular_buffer(a1, v14);
  uint64_t v12 = a1[1];
  std::__split_buffer<std::vector<int>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_21430D620(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<int>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    uint64_t result = std::vector<int>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21430D694(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<std::vector<int>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      long long v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<int>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<int>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v5 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

double *CPRTgrowTree(unsigned int a1, unsigned int a2, unsigned int a3, double (*a4)(double *, double *, unsigned int, unsigned int, unsigned int *, double *, unsigned int *, double), uint64_t a5, unsigned int a6, double *a7, double *a8, unsigned int a9)
{
  uint64_t v17 = malloc_type_malloc(0x40uLL, 0x10800407B512463uLL);
  v17[4] = a6;
  v17[5] = a5;
  int v67 = a8;
  double v68 = v17;
  v17[7] = a9;
  if (a6)
  {
    uint64_t v18 = 8 * a6;
    double v19 = 0.0;
    unint64_t v20 = a8;
    int v21 = (double *)v17;
    do
    {
      double v22 = *v20++;
      double v19 = v19 + v22;
      v18 -= 8;
    }
    while (v18);
  }
  else
  {
    double v19 = 0.0;
    int v21 = (double *)v17;
  }
  v21[7] = v19 / (double)a6;
  *(_DWORD *)int v21 = 2;
  *((_DWORD *)v21 + 8) = 0;
  *((_DWORD *)v21 + 6) = 0;
  v21[5] = 0.0;
  v21[6] = 0.0;
  int v23 = (CPMLLog *)malloc_type_malloc(0x10uLL, 0x2004093837F09uLL);
  *((void *)v21 + 1) = v23;
  *(void *)int v23 = 0;
  *(void *)(*((void *)v21 + 1) + 8) = 0;
  if (a3)
  {
    if (*((_DWORD *)v21 + 4) > a2 && *((_DWORD *)v21 + 7) < a1)
    {
      unsigned int v62 = a1;
      unsigned int v61 = a2;
      *(void *)float64x2_t v63 = a3;
      unsigned int v70 = a6;
      int v69 = (double *)malloc_type_malloc(8 * a3, 0x100004000313F17uLL);
      size_t v24 = 8 * a3;
      int v25 = malloc_type_malloc(v24, 0x100004000313F17uLL);
      unsigned int v60 = a3;
      size_t v26 = 4 * a3;
      uint64_t v27 = (char *)malloc_type_malloc(v26, 0x100004052888210uLL);
      unint64_t v28 = (char *)malloc_type_malloc(v26, 0x100004052888210uLL);
      uint64_t v29 = a4;
      uint64_t v30 = a5;
      unint64_t v31 = 0;
      float64x2_t v65 = v28;
      double v66 = v27;
      do
      {
        v69[v31 / 8] = v29(a7, v67, v70, v30, (unsigned int *)v27, (double *)&v25[v31 / 8], (unsigned int *)v28, v21[7]);
        v27 += 4;
        v31 += 8;
        v28 += 4;
      }
      while (v24 != v31);
      float64x2_t v64 = v25;
      uint64_t v32 = 0;
      int v33 = 0;
      double v34 = *v69;
      do
      {
        if (v34 < v69[v32])
        {
          int v33 = v32;
          double v34 = v69[v32];
        }
        ++v32;
      }
      while (*(void *)v63 != v32);
      int v35 = v65[v33];
      v68[6] = v35;
      v68[8] = v66[v33];
      *((void *)v68 + 5) = v25[v33];
      *((double *)v68 + 6) = v69[v33];
      if (v35)
      {
        signed int v36 = (double *)malloc_type_calloc((v35 * v30), 8uLL, 0x100004000313F17uLL);
        int v37 = (double *)malloc_type_calloc((v70 - v68[6]) * v30, 8uLL, 0x100004000313F17uLL);
        uint64_t v38 = (double *)malloc_type_calloc(v68[6], 8uLL, 0x100004000313F17uLL);
        uint64_t v39 = (double *)malloc_type_calloc(v70 - v68[6], 8uLL, 0x100004000313F17uLL);
        uint64_t v40 = v68[4];
        if (v40)
        {
          uint64_t v41 = 0;
          int v42 = 0;
          int v43 = 0;
          double v44 = *((double *)v68 + 5);
          float64x2_t v45 = &a7[(v40 * v68[8])];
          uint64_t v46 = v68[5];
          do
          {
            if (v45[v41] >= v44)
            {
              if (v46)
              {
                int v51 = v40 - v68[6];
                int v52 = v41;
                int v53 = v42;
                uint64_t v54 = v46;
                do
                {
                  v37[v53] = a7[v52];
                  v53 += v51;
                  v52 += v40;
                  --v54;
                }
                while (v54);
              }
              v39[v42++] = v67[v41];
            }
            else
            {
              if (v46)
              {
                int v47 = v68[6];
                int v48 = v41;
                int v49 = v43;
                uint64_t v50 = v46;
                do
                {
                  v36[v49] = a7[v48];
                  v49 += v47;
                  v48 += v40;
                  --v50;
                }
                while (v50);
              }
              v38[v43++] = v67[v41];
            }
            ++v41;
          }
          while (v41 != v40);
        }
        size_t v55 = v39;
        unsigned int v56 = v68[6];
        if (v56)
        {
          **((void **)v68 + 1) = CPRTgrowTree(v62, v61, v63[0], v29, v30, v56, v36, v38, a9 + 1);
          int v57 = v68[6];
        }
        else
        {
          int v57 = 0;
        }
        if (v70 != v57) {
          *(void *)(*((void *)v68 + 1) + 8) = CPRTgrowTree(v62, v61, v60, v29, v30, v70 - v57, v37, v55, a9 + 1);
        }
        free(v36);
        free(v37);
        free(v38);
        free(v55);
        int v25 = v64;
      }
      free(v65);
      free(v66);
      free(v25);
      free(v69);
      return (double *)v68;
    }
  }
  else
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v23);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "CPRTgrowTree", "nSplits should not be zero.");
  }
  return v21;
}

uint64_t CPRTcostTargetSD(double *a1, double *a2, unsigned int a3, uint32_t __upper_bound, unsigned int *a5, double *a6, unsigned int *a7, double a8)
{
  uint32_t v15 = arc4random_uniform(__upper_bound);
  uint64_t v16 = &a1[v15 * a3];
  uint64_t v17 = a3;
  if (a3 > 1)
  {
    unint64_t v20 = v16 + 1;
    double v21 = *v16;
    uint64_t v22 = 8 * a3 - 8;
    uint64_t v23 = v22;
    double v24 = *v16;
    int v25 = v16 + 1;
    size_t v26 = v16;
    uint64_t v27 = v16 + 1;
    do
    {
      double v28 = *v27++;
      double v29 = v28;
      if (v28 < v24)
      {
        double v24 = v29;
        size_t v26 = v25;
      }
      int v25 = v27;
      v23 -= 8;
    }
    while (v23);
    double v19 = *v26;
    uint64_t v30 = v16;
    unint64_t v31 = v16 + 1;
    do
    {
      double v32 = *v31++;
      double v33 = v32;
      if (v21 < v32)
      {
        double v21 = v33;
        uint64_t v30 = v20;
      }
      unint64_t v20 = v31;
      v22 -= 8;
    }
    while (v22);
    double v18 = *v30;
  }
  else
  {
    double v18 = *v16;
    double v19 = *v16;
  }
  double v34 = v18 - v19;
  uint64_t result = arc4random_uniform(0x7FFFFFFFu);
  double v36 = v19 + v34 * (double)result / 2147483650.0;
  *a5 = v15;
  *a6 = v36;
  if (a3)
  {
    unsigned int v37 = 0;
    unsigned int v38 = 0;
    double v39 = 0.0;
    uint64_t v40 = a3;
    uint64_t v41 = a2;
    double v42 = 0.0;
    int v43 = v16;
    do
    {
      double v44 = *v43++;
      double v45 = v44;
      double v46 = *v41++;
      BOOL v47 = v45 < v36;
      double v48 = v42 + v46;
      double v49 = v39 + v46;
      if (v47) {
        ++v38;
      }
      else {
        ++v37;
      }
      if (v47) {
        double v42 = v48;
      }
      else {
        double v39 = v49;
      }
      --v40;
    }
    while (v40);
    double v50 = v42 / (double)v38;
    double v51 = 0.0;
    double v52 = 0.0;
    double v53 = 0.0;
    double v54 = v39 / (double)v37;
    do
    {
      double v55 = *a2++;
      double v56 = v55;
      double v53 = v53 + (v55 - a8) * (v55 - a8);
      double v57 = *v16++;
      double v58 = v51 + (v56 - v54) * (v56 - v54);
      double v59 = v52 + (v56 - v50) * (v56 - v50);
      if (v57 >= v36) {
        double v51 = v58;
      }
      else {
        double v52 = v59;
      }
      --v17;
    }
    while (v17);
  }
  else
  {
    unsigned int v38 = 0;
  }
  *a7 = v38;
  return result;
}

double *CPRTpredictRegressTree(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  long long v8 = (double *)malloc_type_malloc(8 * a3, 0x100004000313F17uLL);
  uint64_t v9 = (CPMLLog *)malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
  uint64_t v10 = v9;
  if (a3)
  {
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = a1;
      uint64_t v13 = a4;
      unsigned int v14 = v11;
      uint32_t v15 = v10;
      if (a4)
      {
        do
        {
          *(void *)uint32_t v15 = *(void *)(a2 + 8 * v14);
          uint32_t v15 = (CPMLLog *)((char *)v15 + 8);
          v14 += a3;
          --v13;
        }
        while (v13);
        uint64_t v12 = a1;
      }
      while (1)
      {
        uint64_t v16 = v12;
        uint64_t v17 = *(uint64_t **)(v12 + 8);
        uint64_t v12 = *v17;
        if (!*v17 && !v17[1])
        {
LABEL_12:
          double v19 = *(double *)(v16 + 56);
          goto LABEL_14;
        }
        uint64_t v18 = *(unsigned int *)(v16 + 32);
        if (v18 >= a4) {
          break;
        }
        if (*((double *)v10 + v18) > *(double *)(v16 + 40)) {
          uint64_t v12 = v17[1];
        }
        if (!v12) {
          goto LABEL_12;
        }
      }
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v9);
      uint64_t v9 = (CPMLLog *)CPMLLog::log(CPMLLog, CPML_LOG_ERR, "predictTreeOnePoint", "Incorrect attribute. corrupted tree\n");
      double v19 = -1.0;
LABEL_14:
      v8[v11++] = v19;
    }
    while (v11 != a3);
  }
  free(v10);
  return v8;
}

void CPRTdestroyTree(void *a1)
{
  uint64_t v2 = (void *)a1[1];
  if (*v2)
  {
    CPRTdestroyTree(*v2);
    uint64_t v2 = (void *)a1[1];
  }
  if (v2[1])
  {
    CPRTdestroyTree(v2[1]);
    uint64_t v2 = (void *)a1[1];
  }
  free(v2);

  free(a1);
}

pthread_mutex_t *CPRTprintTree(CPMLLog *a1)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(a1);
  uint64_t v3 = (CPMLLog *)CPMLLog::log(CPMLLog, CPML_LOG_DEBUG, "CPRTprintTree", "** Level :%d **\n", *((_DWORD *)a1 + 7));
  unint64_t v4 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v3);
  uint64_t v5 = (CPMLLog *)CPMLLog::log(v4, CPML_LOG_DEBUG, "CPRTprintTree", "N :%d\n", *((_DWORD *)a1 + 4));
  uint64_t v6 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v5);
  uint64_t v7 = (CPMLLog *)CPMLLog::log(v6, CPML_LOG_DEBUG, "CPRTprintTree", "M :%d\n", *((_DWORD *)a1 + 5));
  long long v8 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v7);
  uint64_t v9 = (CPMLLog *)CPMLLog::log(v8, CPML_LOG_DEBUG, "CPRTprintTree", "Mean Target :%f\n", *((double *)a1 + 7));
  uint64_t v10 = (void *)*((void *)a1 + 1);
  if (*v10 || v10[1])
  {
    uint64_t v11 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v9);
    uint64_t v12 = (CPMLLog *)CPMLLog::log(v11, CPML_LOG_DEBUG, "CPRTprintTree", "Children :%d\n", *(_DWORD *)a1);
    uint64_t v13 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v12);
    unsigned int v14 = (CPMLLog *)CPMLLog::log(v13, CPML_LOG_DEBUG, "CPRTprintTree", "Split Attribute :%d\n", *((_DWORD *)a1 + 8));
    uint32_t v15 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v14);
    uint64_t v16 = (CPMLLog *)CPMLLog::log(v15, CPML_LOG_DEBUG, "CPRTprintTree", "Split Threshold :%f\n", *((double *)a1 + 5));
    uint64_t v17 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v16);
    uint64_t v9 = (CPMLLog *)CPMLLog::log(v17, CPML_LOG_DEBUG, "CPRTprintTree", "Split Cost :%f\n", *((double *)a1 + 6));
  }
  uint64_t v18 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v9);
  uint64_t result = CPMLLog::log(v18, CPML_LOG_DEBUG, "CPRTprintTree", "********\n");
  if (*(_DWORD *)a1)
  {
    unint64_t v20 = 0;
    do
    {
      uint64_t result = *(pthread_mutex_t **)(*((void *)a1 + 1) + 8 * v20);
      if (!result) {
        break;
      }
      uint64_t result = (pthread_mutex_t *)CPRTprintTree();
      ++v20;
    }
    while (v20 < *(unsigned int *)a1);
  }
  return result;
}

void sub_21430E410(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21430EB9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  MEMORY[0x21669DB80](v18, 0x10A1C405A95AE37);

  _Unwind_Resume(a1);
}

void sub_21430EF64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21430F060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21430F8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  MEMORY[0x21669DB80](v10, 0x10B1C4066637EEELL);

  _Unwind_Resume(a1);
}

void CPMLOnlineSvm::CPMLOnlineSvm(CPMLOnlineSvm *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, a2, a3, a4);
  *(_OWORD *)(v4 + 96) = 0u;
  *(void *)uint64_t v4 = &unk_26C50FA68;
  *(_OWORD *)(v4 + 112) = 0u;
  *(_OWORD *)(v4 + 128) = 0u;
  *(_DWORD *)(v4 + 144) = 1;
  *(_DWORD *)(v4 + 152) = 2;
  *(_OWORD *)(v4 + 160) = xmmword_214353E20;
  *(void *)(v4 + 176) = 0x186A000000001;
  *(_OWORD *)(v4 + 184) = xmmword_214353E30;
  *(_OWORD *)(v4 + 200) = xmmword_214353E40;
  *(_OWORD *)(v4 + 232) = 0u;
  *(_OWORD *)(v4 + 248) = 0u;
  *(void *)(v4 + 296) = 0;
  *(_OWORD *)(v4 + 264) = 0u;
  *(_OWORD *)(v4 + 280) = 0u;
  *(_OWORD *)(v4 + 312) = 0u;
  *(_OWORD *)(v4 + 328) = 0u;
  *(_OWORD *)(v4 + 344) = 0u;
  *(_OWORD *)(v4 + 360) = 0u;
  *(_OWORD *)(v4 + 376) = 0u;
  *(_OWORD *)(v4 + 392) = 0u;
  *(void *)(v4 + 448) = 0;
  *(_OWORD *)(v4 + 416) = 0u;
  *(_OWORD *)(v4 + 432) = 0u;
  *(_OWORD *)(v4 + 472) = 0u;
  *(_OWORD *)(v4 + 488) = 0u;
  *(_OWORD *)(v4 + 504) = 0u;
  strcpy((char *)(v4 + 8), "1.0.0");
  CPMLCDB::getIterator();
}

void sub_21430FE08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void **a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  std::valarray<double>::~valarray((uint64_t)(v18 + 63));
  std::valarray<double>::~valarray((uint64_t)(v18 + 61));
  std::valarray<double>::~valarray(a11);
  uint64_t v22 = (void *)v18[54];
  if (v22)
  {
    v18[55] = v22;
    operator delete(v22);
  }
  std::valarray<double>::~valarray(v20);
  uint64_t v23 = (void *)v18[48];
  if (v23)
  {
    v18[49] = v23;
    operator delete(v23);
  }
  double v24 = (void *)v18[45];
  if (v24)
  {
    v18[46] = v24;
    operator delete(v24);
  }
  __p = v18 + 42;
  std::vector<std::valarray<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  int v25 = *a12;
  if (*a12)
  {
    v18[40] = v25;
    operator delete(v25);
  }
  __p = v18 + 35;
  std::vector<std::valarray<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  std::vector<std::valarray<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  size_t v26 = *v19;
  if (*v19)
  {
    v18[30] = v26;
    operator delete(v26);
  }
  if (v18[17])
  {
    if (*a10) {
      MEMORY[0x21669DB60](*a10, 0x1000C8000313F17);
    }
  }
  CPModelClose(v18);
  _Unwind_Resume(a1);
}

void std::valarray<double>::resize(uint64_t a1, unint64_t a2, double a3)
{
  uint64_t v6 = *(unsigned char **)a1;
  if (v6)
  {
    uint64_t v7 = *(unsigned char **)(a1 + 8);
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
    long long v8 = (double *)operator new(8 * a2);
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

CPMLLibSVM::Cache *CPMLLibSVM::Cache::Cache(CPMLLibSVM::Cache *this, int a2, uint64_t a3)
{
  *(_DWORD *)this = a2;
  *((void *)this + 1) = a3;
  uint64_t v4 = malloc_type_calloc(a2, 0x20uLL, 0x10A004007F91357uLL);
  uint64_t v5 = *(int *)this;
  uint64_t v6 = (*((void *)this + 1) >> 2) - 8 * (v5 & 0x7FFFFFFFFFFFFFFLL);
  BOOL v7 = v6 <= 2 * v5;
  uint64_t v8 = 2 * v5;
  if (v7) {
    uint64_t v6 = v8;
  }
  *((void *)this + 1) = v6;
  *((void *)this + 2) = v4;
  *((void *)this + 3) = (char *)this + 24;
  *((void *)this + 4) = (char *)this + 24;
  return this;
}

void CPMLLibSVM::Cache::~Cache(CPMLLibSVM::Cache *this)
{
  uint64_t v2 = (char *)this + 24;
  for (uint64_t i = *((void *)this + 4); (char *)i != v2; uint64_t i = *(void *)(i + 8))
    free(*(void **)(i + 16));
  free(*((void **)this + 2));
}

void CPMLLibSVM::Cache::lru_delete(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(void *)(v2 + 8) = a2[1];
  *(void *)a2[1] = v2;
}

uint64_t CPMLLibSVM::Cache::lru_insert(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t result = a1 + 24;
  *a2 = v3;
  a2[1] = result;
  *(void *)(v3 + 8) = a2;
  *(void *)a2[1] = a2;
  return result;
}

uint64_t CPMLLibSVM::Cache::get_data(CPMLLibSVM::Cache *this, int a2, float **a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v7 = *((void *)this + 2);
  uint64_t v8 = a2;
  uint64_t v9 = (uint64_t *)(v7 + 32 * a2);
  uint64_t v11 = v9 + 3;
  int v10 = *((_DWORD *)v9 + 6);
  if (v10)
  {
    uint64_t v12 = *v9;
    *(void *)(v12 + 8) = v9[1];
    *(void *)v9[1] = v12;
  }
  uint64_t v13 = (a4 - v10);
  if ((int)a4 <= v10)
  {
    double v19 = *(float **)(v7 + 32 * a2 + 16);
  }
  else
  {
    if (*((void *)this + 1) < (uint64_t)v13)
    {
      do
      {
        unsigned int v14 = (uint64_t *)*((void *)this + 4);
        uint64_t v15 = *v14;
        *(void *)(v15 + 8) = v14[1];
        uint64_t v16 = (void *)v14[2];
        *(void *)v14[1] = v15;
        free(v16);
        uint64_t v17 = *((void *)this + 1) + *((int *)v14 + 6);
        *((void *)this + 1) = v17;
        void v14[2] = 0;
        *((_DWORD *)v14 + 6) = 0;
      }
      while (v17 < v13);
    }
    uint64_t v18 = v7 + 32 * v8;
    double v19 = (float *)malloc_type_realloc(*(void **)(v18 + 16), 4 * (int)v4, 0x100004052888210uLL);
    *(void *)(v18 + 16) = v19;
    *((void *)this + 1) -= v13;
    uint64_t v20 = *v11;
    *uint64_t v11 = v4;
    uint64_t v4 = v20;
  }
  uint64_t v21 = v7 + 32 * v8;
  uint64_t v22 = *((void *)this + 3);
  *(void *)(v21 + 8) = (char *)this + 24;
  *uint64_t v9 = v22;
  *(void *)(v22 + 8) = v9;
  **(void **)(v21 + 8) = v9;
  *a3 = v19;
  return v4;
}

void CPMLLibSVM::Cache::swap_index(CPMLLibSVM::Cache *this, int a2, int a3)
{
  if (a2 != a3)
  {
    uint64_t v4 = *((void *)this + 2);
    uint64_t v5 = (uint64_t *)(v4 + 32 * a2);
    if (*((_DWORD *)v5 + 6))
    {
      uint64_t v6 = *v5;
      *(void *)(v6 + 8) = v5[1];
      *(void *)v5[1] = v6;
    }
    uint64_t v7 = (uint64_t *)(v4 + 32 * a3);
    if (*((_DWORD *)v7 + 6))
    {
      uint64_t v8 = *v7;
      *(void *)(v8 + 8) = v7[1];
      *(void *)v7[1] = v8;
    }
    uint64_t v9 = v4 + 32 * a2;
    uint64_t v10 = *(void *)(v9 + 16);
    *(void *)(v9 + 16) = v7[2];
    v7[2] = v10;
    uint64_t v11 = *((void *)this + 2);
    uint64_t v12 = v11 + 32 * a2;
    uint64_t v13 = v11 + 32 * a3;
    int v14 = *(_DWORD *)(v12 + 24);
    *(_DWORD *)(v12 + 24) = *(_DWORD *)(v13 + 24);
    *(_DWORD *)(v13 + 24) = v14;
    if (*(_DWORD *)(v12 + 24))
    {
      uint64_t v15 = *((void *)this + 3);
      *(void *)uint64_t v12 = v15;
      *(void *)(v12 + 8) = (char *)this + 24;
      *(void *)(v15 + 8) = v12;
      **(void **)(v12 + 8) = v12;
    }
    if (v14)
    {
      uint64_t v16 = *((void *)this + 3);
      uint64_t v17 = (void *)(v11 + 32 * a3);
      *uint64_t v17 = v16;
      v17[1] = (char *)this + 24;
      *(void *)(v16 + 8) = v17;
      *(void *)v17[1] = v17;
    }
    if (a2 >= a3) {
      int v18 = a3;
    }
    else {
      int v18 = a2;
    }
    if (a2 <= a3) {
      int v19 = a3;
    }
    else {
      int v19 = a2;
    }
    uint64_t v20 = (char *)this + 24;
    uint64_t v21 = (char *)*((void *)this + 4);
    if (v21 != (char *)this + 24)
    {
      do
      {
        int v22 = *((_DWORD *)v21 + 6);
        if (v22 > v18)
        {
          if (v22 <= v19)
          {
            uint64_t v25 = *(void *)v21;
            *(void *)(v25 + 8) = *((void *)v21 + 1);
            size_t v26 = (void *)*((void *)v21 + 2);
            **((void **)v21 + 1) = v25;
            free(v26);
            *((void *)this + 1) += *((int *)v21 + 6);
            *((void *)v21 + 2) = 0;
            *((_DWORD *)v21 + 6) = 0;
          }
          else
          {
            uint64_t v23 = *((void *)v21 + 2);
            int v24 = *(_DWORD *)(v23 + 4 * v18);
            *(_DWORD *)(v23 + 4 * v18) = *(_DWORD *)(v23 + 4 * v19);
            *(_DWORD *)(v23 + 4 * v19) = v24;
          }
        }
        uint64_t v21 = (char *)*((void *)v21 + 1);
      }
      while (v21 != v20);
    }
  }
}

void CPMLLibSVM::Kernel::Kernel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26C510680;
  uint64_t v4 = *(void *)(a4 + 4);
  *(void *)(a1 + 40) = v4;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a4 + 16);
  uint64_t v5 = CPMLLibSVM::Kernel::kernel_linear;
  switch((int)v4)
  {
    case 0:
      goto LABEL_7;
    case 1:
      uint64_t v6 = CPMLLibSVM::Kernel::kernel_poly;
      goto LABEL_6;
    case 2:
      uint64_t v6 = (double (*)(CPMLLibSVM::Kernel *, int, int))CPMLLibSVM::Kernel::kernel_rbf;
      goto LABEL_6;
    case 3:
      uint64_t v6 = (double (*)(CPMLLibSVM::Kernel *, int, int))CPMLLibSVM::Kernel::kernel_sigmoid;
      goto LABEL_6;
    case 4:
      uint64_t v6 = CPMLLibSVM::Kernel::kernel_precomputed;
LABEL_6:
      uint64_t v5 = v6;
LABEL_7:
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = 0;
      break;
    default:
      break;
  }
  operator new[]();
}

double CPMLLibSVM::Kernel::kernel_linear(CPMLLibSVM::Kernel *this, int a2, int a3)
{
  uint64_t v3 = *((void *)this + 3);
  uint64_t v4 = *(double **)(v3 + 8 * a2);
  int v5 = *(_DWORD *)v4;
  if (*(_DWORD *)v4 == -1) {
    return 0.0;
  }
  uint64_t v6 = *(double **)(v3 + 8 * a3);
  double result = 0.0;
  do
  {
    int v8 = *(_DWORD *)v6;
    if (*(_DWORD *)v6 == -1) {
      break;
    }
    if (v5 == v8)
    {
      double result = result + v4[1] * v6[1];
      v4 += 2;
      v6 += 2;
    }
    else if (v5 > v8)
    {
      v6 += 2;
    }
    else
    {
      v4 += 2;
    }
    int v5 = *(_DWORD *)v4;
  }
  while (*(_DWORD *)v4 != -1);
  return result;
}

double CPMLLibSVM::Kernel::kernel_poly(CPMLLibSVM::Kernel *this, int a2, int a3)
{
  uint64_t v3 = *((void *)this + 3);
  uint64_t v4 = *(double **)(v3 + 8 * a2);
  int v5 = *(_DWORD *)v4;
  if (*(_DWORD *)v4 == -1)
  {
    double v7 = 0.0;
  }
  else
  {
    uint64_t v6 = *(double **)(v3 + 8 * a3);
    double v7 = 0.0;
    do
    {
      int v8 = *(_DWORD *)v6;
      if (*(_DWORD *)v6 == -1) {
        break;
      }
      if (v5 == v8)
      {
        double v7 = v7 + v4[1] * v6[1];
        v4 += 2;
        v6 += 2;
      }
      else if (v5 > v8)
      {
        v6 += 2;
      }
      else
      {
        v4 += 2;
      }
      int v5 = *(_DWORD *)v4;
    }
    while (*(_DWORD *)v4 != -1);
  }
  int v9 = *((_DWORD *)this + 11);
  if (v9 < 1) {
    return 1.0;
  }
  double v10 = *((double *)this + 7) + *((double *)this + 6) * v7;
  double result = 1.0;
  do
  {
    if (v9) {
      double v12 = v10;
    }
    else {
      double v12 = 1.0;
    }
    double result = result * v12;
    double v10 = v10 * v10;
    BOOL v13 = v9 > 1;
    int v9 = v9 >> 1;
  }
  while (v13);
  return result;
}

long double CPMLLibSVM::Kernel::kernel_rbf(CPMLLibSVM::Kernel *this, int a2, int a3)
{
  uint64_t v4 = *((void *)this + 3);
  uint64_t v3 = *((void *)this + 4);
  double v5 = *(double *)(v3 + 8 * a2);
  double v6 = *(double *)(v3 + 8 * a3);
  double v7 = *(double **)(v4 + 8 * a2);
  int v8 = *(_DWORD *)v7;
  if (*(_DWORD *)v7 == -1)
  {
    double v10 = 0.0;
  }
  else
  {
    int v9 = *(double **)(v4 + 8 * a3);
    double v10 = 0.0;
    do
    {
      int v11 = *(_DWORD *)v9;
      if (*(_DWORD *)v9 == -1) {
        break;
      }
      if (v8 == v11)
      {
        double v10 = v10 + v7[1] * v9[1];
        v7 += 2;
        v9 += 2;
      }
      else if (v8 > v11)
      {
        v9 += 2;
      }
      else
      {
        v7 += 2;
      }
      int v8 = *(_DWORD *)v7;
    }
    while (*(_DWORD *)v7 != -1);
  }
  return exp(-(*((double *)this + 6) * (v5 + v6 + v10 * -2.0)));
}

long double CPMLLibSVM::Kernel::kernel_sigmoid(CPMLLibSVM::Kernel *this, int a2, int a3)
{
  uint64_t v3 = *((void *)this + 3);
  uint64_t v4 = *(double **)(v3 + 8 * a2);
  int v5 = *(_DWORD *)v4;
  if (*(_DWORD *)v4 == -1)
  {
    double v7 = 0.0;
  }
  else
  {
    double v6 = *(double **)(v3 + 8 * a3);
    double v7 = 0.0;
    do
    {
      int v8 = *(_DWORD *)v6;
      if (*(_DWORD *)v6 == -1) {
        break;
      }
      if (v5 == v8)
      {
        double v7 = v7 + v4[1] * v6[1];
        v4 += 2;
        v6 += 2;
      }
      else if (v5 > v8)
      {
        v6 += 2;
      }
      else
      {
        v4 += 2;
      }
      int v5 = *(_DWORD *)v4;
    }
    while (*(_DWORD *)v4 != -1);
  }
  return tanh(*((double *)this + 7) + *((double *)this + 6) * v7);
}

double CPMLLibSVM::Kernel::kernel_precomputed(CPMLLibSVM::Kernel *this, int a2, int a3)
{
  return *(double *)(*(void *)(*((void *)this + 3) + 8 * a2)
                   + 16 * (int)*(double *)(*(void *)(*((void *)this + 3) + 8 * a3) + 8)
                   + 8);
}

double *CPMLLibSVM::Kernel::dot(double *result, double *a2)
{
  int v2 = *(_DWORD *)result;
  double v3 = 0.0;
  while (v2 != -1)
  {
    int v4 = *(_DWORD *)a2;
    if (*(_DWORD *)a2 == -1) {
      break;
    }
    if (v2 == v4)
    {
      double v3 = v3 + result[1] * a2[1];
      result += 2;
      a2 += 2;
    }
    else if (v2 > v4)
    {
      a2 += 2;
    }
    else
    {
      result += 2;
    }
    int v2 = *(_DWORD *)result;
  }
  return result;
}

void CPMLLibSVM::Kernel::~Kernel(CPMLLibSVM::Kernel *this)
{
  *(void *)this = &unk_26C510680;
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    MEMORY[0x21669DB60](v2, 0x60C8044C4A2DFLL);
  }
  uint64_t v3 = *((void *)this + 4);
  if (v3) {
    MEMORY[0x21669DB60](v3, 0x1000C8000313F17);
  }
}

double CPMLLibSVM::Kernel::k_function(double *a1, double *a2, uint64_t a3)
{
  double result = 0.0;
  switch(*(_DWORD *)(a3 + 4))
  {
    case 0:
      while (1)
      {
        int v4 = *(_DWORD *)a1;
        if (*(_DWORD *)a1 == -1) {
          break;
        }
        int v5 = *(_DWORD *)a2;
        if (*(_DWORD *)a2 == -1) {
          break;
        }
        if (v4 == v5)
        {
          double result = result + a1[1] * a2[1];
          a1 += 2;
          a2 += 2;
        }
        else if (v4 > v5)
        {
          a2 += 2;
        }
        else
        {
          a1 += 2;
        }
      }
      break;
    case 1:
      while (1)
      {
        int v6 = *(_DWORD *)a1;
        if (*(_DWORD *)a1 == -1) {
          break;
        }
        int v7 = *(_DWORD *)a2;
        if (*(_DWORD *)a2 == -1) {
          break;
        }
        if (v6 == v7)
        {
          double result = result + a1[1] * a2[1];
          a1 += 2;
          a2 += 2;
        }
        else if (v6 > v7)
        {
          a2 += 2;
        }
        else
        {
          a1 += 2;
        }
      }
      int v11 = *(_DWORD *)(a3 + 8);
      if (v11 < 1)
      {
        double result = 1.0;
      }
      else
      {
        double v12 = *(double *)(a3 + 24) + *(double *)(a3 + 16) * result;
        double result = 1.0;
        do
        {
          if (v11) {
            double v13 = v12;
          }
          else {
            double v13 = 1.0;
          }
          double result = result * v13;
          double v12 = v12 * v12;
          BOOL v14 = v11 >= 2;
          int v11 = v11 >> 1;
        }
        while (v14);
      }
      break;
    case 3:
      int v8 = *(_DWORD *)a1;
      double v9 = 0.0;
      while (v8 != -1)
      {
        int v10 = *(_DWORD *)a2;
        if (*(_DWORD *)a2 == -1) {
          break;
        }
        if (v8 == v10)
        {
          double v9 = v9 + a1[1] * a2[1];
          a1 += 2;
          a2 += 2;
        }
        else if (v8 > v10)
        {
          a2 += 2;
        }
        else
        {
          a1 += 2;
        }
        int v8 = *(_DWORD *)a1;
      }
      double result = tanh(*(double *)(a3 + 24) + *(double *)(a3 + 16) * v9);
      break;
    case 4:
      double result = a1[2 * (int)a2[1] + 1];
      break;
    default:
      return result;
  }
  return result;
}

void CPMLLibSVM::Kernel::k_function_rbf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t *a26,uint64_t a27,unint64_t a28,uint64_t a29,uint64_t *a30,uint64_t a31,unint64_t a32)
{
  signed int v32 = *(_DWORD *)(a2 + 108);
  unint64_t v33 = v32;
  if (libsvm_cpu_count < v32) {
    signed int v32 = libsvm_cpu_count;
  }
  size_t v34 = v32;
  a29 = 0;
  a30 = &a29;
  a31 = 0x2000000000;
  a32 = v33 / v32;
  a25 = 0;
  a26 = &a25;
  a27 = 0x2000000000;
  a28 = v33 % v32;
  var10[0] = MEMORY[0x263EF8330];
  var10[1] = 0x40000000;
  var10[2] = ___ZN10CPMLLibSVM6Kernel14k_function_rbfEPK8svm_nodePK9svm_modelPd_block_invoke;
  var10[3] = &unk_264202100;
  if (v32 == 1)
  {
    ___ZN10CPMLLibSVM6Kernel14k_function_rbfEPK8svm_nodePK9svm_modelPd_block_invoke((uint64_t)var10, 0);
  }
  else
  {
    qos_class_t v35 = qos_class_self();
    global_queue = dispatch_get_global_queue(v35, 0);
    dispatch_apply(v34, global_queue, var10);
  }
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
}

void sub_214310B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void ___ZN10CPMLLibSVM6Kernel14k_function_rbfEPK8svm_nodePK9svm_modelPd_block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t v4 = a2 - v3;
  if (a2 < v3) {
    unint64_t v4 = 0;
  }
  unint64_t v5 = (v2 + 1) * a2 - v4;
  if (v3 <= a2) {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else {
    uint64_t v6 = v2 + 1;
  }
  unint64_t v7 = v6 + v5;
  if (v5 + 8 > v6 + v5)
  {
    unint64_t v8 = (v2 + 1) * a2 - v4;
    goto LABEL_30;
  }
  double v9 = (float64x2_t *)(*(void *)(a1 + 48) + 8 * v5);
  float64x2_t v10 = 0uLL;
  int8x16_t v11 = (int8x16_t)vdupq_n_s64(0x7FF0000000000000uLL);
  float64x2_t v12 = (float64x2_t)vdupq_n_s64(0xC086232BDD7ABCD4);
  float64x2_t v13 = (float64x2_t)vdupq_n_s64(0x40671547652B82FDuLL);
  float64x2_t v14 = (float64x2_t)vdupq_n_s64(0xBF762E4000000000);
  float64x2_t v15 = (float64x2_t)vdupq_n_s64(0xBE47F7D1CF79ABCALL);
  float64x2_t v16 = (float64x2_t)vdupq_n_s64(0x3F8111116E99AC77uLL);
  float64x2_t v17 = (float64x2_t)vdupq_n_s64(0x3FA55555CA407CCBuLL);
  float64x2_t v18 = (float64x2_t)vdupq_n_s64(0x3FC55555555553F0uLL);
  float64x2_t v19 = (float64x2_t)vdupq_n_s64(0x3FDFFFFFFFFFFE1FuLL);
  int8x16_t v20 = (int8x16_t)vdupq_n_s64(0x7FuLL);
  int8x16_t v21 = (int8x16_t)vdupq_n_s64(0xFFF0000000000000);
  __asm { FMOV            V20.2D, #1.0 }
  float64x2_t v27 = 0uLL;
  float64x2_t v28 = 0uLL;
  float64x2_t v29 = 0uLL;
  do
  {
    uint64_t v30 = 0;
    uint64_t v31 = *(void *)(a1 + 56);
    signed int v32 = *(double **)(a1 + 128);
    int v33 = *(_DWORD *)v32;
    unint64_t v8 = v5 + 8;
    unint64_t v34 = v5;
    do
    {
      qos_class_t v35 = *(double **)(v31 + 8 * v34);
      double v36 = 0.0;
      if (v33 != -1)
      {
        int v37 = v33;
        unsigned int v38 = v32;
        while (1)
        {
          int v39 = *(_DWORD *)v35;
          if (*(_DWORD *)v35 == -1) {
            goto LABEL_22;
          }
          if (v37 == v39)
          {
            double v40 = v38[1] - v35[1];
            double v36 = v36 + v40 * v40;
            v38 += 2;
          }
          else
          {
            if (v37 <= v39)
            {
              double v36 = v36 + v38[1] * v38[1];
              v38 += 2;
              goto LABEL_19;
            }
            double v36 = v36 + v35[1] * v35[1];
          }
          v35 += 2;
LABEL_19:
          int v37 = *(_DWORD *)v38;
          if (*(_DWORD *)v38 == -1) {
            goto LABEL_25;
          }
        }
      }
      unsigned int v38 = v32;
LABEL_22:
      if (*(_DWORD *)v38 != -1)
      {
        uint64_t v41 = v38 + 2;
        do
        {
          double v36 = v36 + *(v41 - 1) * *(v41 - 1);
          int v42 = *(_DWORD *)v41;
          v41 += 2;
        }
        while (v42 != -1);
      }
LABEL_25:
      if (*(_DWORD *)v35 != -1)
      {
        int v43 = v35 + 2;
        do
        {
          double v36 = v36 + *(v43 - 1) * *(v43 - 1);
          int v44 = *(_DWORD *)v43;
          v43 += 2;
        }
        while (v44 != -1);
      }
      float64x2_t v90 = v10;
      float64x2_t v91 = v27;
      float64x2_t v92 = v28;
      float64x2_t v93 = v29;
      v90.f64[v30 & 7] = v36;
      float64x2_t v28 = v92;
      float64x2_t v29 = v93;
      ++v30;
      ++v34;
      float64x2_t v10 = v90;
      float64x2_t v27 = v91;
    }
    while (v30 != 8);
    int8x16_t v45 = (int8x16_t)vmulq_f64(v90, *(float64x2_t *)(a1 + 64));
    int8x16_t v46 = (int8x16_t)vmulq_f64(v91, *(float64x2_t *)(a1 + 80));
    int8x16_t v47 = (int8x16_t)vmulq_f64(v92, *(float64x2_t *)(a1 + 96));
    int8x16_t v48 = (int8x16_t)vmulq_f64(v93, *(float64x2_t *)(a1 + 112));
    float64x2_t v49 = (float64x2_t)vbicq_s8(v48, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v48, v11)));
    float64x2_t v50 = (float64x2_t)vbicq_s8(v47, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v47, v11)));
    float64x2_t v51 = vmaxq_f64((float64x2_t)vbicq_s8(v45, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v45, v11))), v12);
    float64x2_t v52 = vmaxq_f64((float64x2_t)vbicq_s8(v46, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v46, v11))), v12);
    float64x2_t v53 = vmaxq_f64(v50, v12);
    float64x2_t v54 = vmaxq_f64(v49, v12);
    float64x2_t v55 = vrndmq_f64(vmulq_f64(v51, v13));
    float64x2_t v56 = vrndmq_f64(vmulq_f64(v52, v13));
    float64x2_t v57 = vrndmq_f64(vmulq_f64(v53, v13));
    float64x2_t v58 = vrndmq_f64(vmulq_f64(v54, v13));
    float64x2_t v59 = vmlaq_f64(vmlaq_f64(v51, v14, v55), v15, v55);
    float64x2_t v60 = vmlaq_f64(vmlaq_f64(v52, v14, v56), v15, v56);
    float64x2_t v61 = vmlaq_f64(vmlaq_f64(v53, v14, v57), v15, v57);
    float64x2_t v62 = vmlaq_f64(vmlaq_f64(v54, v14, v58), v15, v58);
    int64x2_t v63 = vcvtq_s64_f64(v55);
    int64x2_t v64 = vcvtq_s64_f64(v56);
    int64x2_t v65 = vcvtq_s64_f64(v57);
    int64x2_t v66 = vcvtq_s64_f64(v58);
    float64x2_t v67 = (float64x2_t)vandq_s8((int8x16_t)v66, v20);
    int8x16_t v68 = vandq_s8((int8x16_t)v65, v20);
    int8x16_t v69 = vandq_s8((int8x16_t)v64, v20);
    int8x16_t v70 = vandq_s8((int8x16_t)v63, v20);
    *(void *)&v67.f64[0] = _ZZL5vexp8Dv8_dE9exp2table[*(void *)&v67.f64[0]];
    *(void *)&v67.f64[1] = _ZZL5vexp8Dv8_dE9exp2table[*(void *)&v67.f64[1]];
    *(void *)&v71.f64[0] = _ZZL5vexp8Dv8_dE9exp2table[v68.i64[0]];
    *(void *)&v71.f64[1] = _ZZL5vexp8Dv8_dE9exp2table[v68.i64[1]];
    *(void *)&v72.f64[0] = _ZZL5vexp8Dv8_dE9exp2table[v69.i64[0]];
    *(void *)&v72.f64[1] = _ZZL5vexp8Dv8_dE9exp2table[v69.i64[1]];
    *(void *)&v73.f64[0] = _ZZL5vexp8Dv8_dE9exp2table[v70.i64[0]];
    *(void *)&v73.f64[1] = _ZZL5vexp8Dv8_dE9exp2table[v70.i64[1]];
    *double v9 = vmulq_f64(vmlaq_f64(v73, v73, vmulq_f64(v59, vmlaq_f64(_Q20, vmlaq_f64(v19, vmlaq_f64(v18, vmlaq_f64(v17, v16, v59), v59), v59), v59))), (float64x2_t)vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshlq_n_s64(v63, 0x2DuLL), v21), (int64x2_t)_Q20));
    v9[1] = vmulq_f64(vmlaq_f64(v72, v72, vmulq_f64(v60, vmlaq_f64(_Q20, vmlaq_f64(v19, vmlaq_f64(v18, vmlaq_f64(v17, v16, v60), v60), v60), v60))), (float64x2_t)vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshlq_n_s64(v64, 0x2DuLL), v21), (int64x2_t)_Q20));
    v9[2] = vmulq_f64(vmlaq_f64(v71, v71, vmulq_f64(v61, vmlaq_f64(_Q20, vmlaq_f64(v19, vmlaq_f64(v18, vmlaq_f64(v17, v16, v61), v61), v61), v61))), (float64x2_t)vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshlq_n_s64(v65, 0x2DuLL), v21), (int64x2_t)_Q20));
    v9[3] = vmulq_f64(vmlaq_f64(v67, v67, vmulq_f64(v62, vmlaq_f64(_Q20, vmlaq_f64(v19, vmlaq_f64(v18, vmlaq_f64(v17, v16, v62), v62), v62), v62))), (float64x2_t)vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshlq_n_s64(v66, 0x2DuLL), v21), (int64x2_t)_Q20));
    v9 += 4;
    unint64_t v74 = v5 + 16;
    v5 += 8;
  }
  while (v74 <= v7);
LABEL_30:
  if (v8 < v7)
  {
    unsigned int v75 = *(double **)(a1 + 128);
    uint64_t v76 = *(void *)(a1 + 136);
    int v77 = *(_DWORD *)v75;
    uint64_t v79 = *(void *)(a1 + 48);
    uint64_t v78 = *(void *)(a1 + 56);
    while (1)
    {
      int v80 = *(double **)(v78 + 8 * v8);
      double v81 = 0.0;
      if (v77 != -1) {
        break;
      }
      float64x2_t v83 = v75;
LABEL_44:
      if (*(_DWORD *)v83 != -1)
      {
        double v86 = v83 + 2;
        do
        {
          double v81 = v81 + *(v86 - 1) * *(v86 - 1);
          int v87 = *(_DWORD *)v86;
          v86 += 2;
        }
        while (v87 != -1);
      }
LABEL_47:
      if (*(_DWORD *)v80 != -1)
      {
        double v88 = v80 + 2;
        do
        {
          double v81 = v81 + *(v88 - 1) * *(v88 - 1);
          int v89 = *(_DWORD *)v88;
          v88 += 2;
        }
        while (v89 != -1);
      }
      *(long double *)(v79 + 8 * v8++) = exp(-(*(double *)(v76 + 16) * v81));
      if (v8 >= v7) {
        return;
      }
    }
    int v82 = v77;
    float64x2_t v83 = v75;
    while (2)
    {
      int v84 = *(_DWORD *)v80;
      if (*(_DWORD *)v80 == -1) {
        goto LABEL_44;
      }
      if (v82 == v84)
      {
        double v85 = v83[1] - v80[1];
        double v81 = v81 + v85 * v85;
        v83 += 2;
        goto LABEL_39;
      }
      if (v82 <= v84)
      {
        double v81 = v81 + v83[1] * v83[1];
        v83 += 2;
      }
      else
      {
        double v81 = v81 + v80[1] * v80[1];
LABEL_39:
        v80 += 2;
      }
      int v82 = *(_DWORD *)v83;
      if (*(_DWORD *)v83 == -1) {
        goto LABEL_47;
      }
      continue;
    }
  }
}

double CPMLLibSVM::Solver::swap_index(CPMLLibSVM::Solver *this, int a2, int a3)
{
  (*(void (**)(void))(**((void **)this + 6) + 16))(*((void *)this + 6));
  uint64_t v6 = *((void *)this + 2);
  char v7 = *(unsigned char *)(v6 + a2);
  *(unsigned char *)(v6 + a2) = *(unsigned char *)(v6 + a3);
  *(unsigned char *)(v6 + a3) = v7;
  uint64_t v8 = *((void *)this + 3);
  uint64_t v9 = *((void *)this + 4);
  uint64_t v10 = *(void *)(v8 + 8 * a2);
  *(void *)(v8 + 8 * a2) = *(void *)(v8 + 8 * a3);
  *(void *)(v8 + 8 * a3) = v10;
  LOBYTE(v8) = *(unsigned char *)(v9 + a2);
  *(unsigned char *)(v9 + a2) = *(unsigned char *)(v9 + a3);
  *(unsigned char *)(v9 + a3) = v8;
  uint64_t v11 = *((void *)this + 5);
  uint64_t v12 = *(void *)(v11 + 8 * a2);
  *(void *)(v11 + 8 * a2) = *(void *)(v11 + 8 * a3);
  *(void *)(v11 + 8 * a3) = v12;
  uint64_t v13 = *((void *)this + 11);
  uint64_t v14 = *((void *)this + 12);
  uint64_t v15 = *(void *)(v13 + 8 * a2);
  *(void *)(v13 + 8 * a2) = *(void *)(v13 + 8 * a3);
  *(void *)(v13 + 8 * a3) = v15;
  LODWORD(v13) = *(_DWORD *)(v14 + 4 * a2);
  *(_DWORD *)(v14 + 4 * a2) = *(_DWORD *)(v14 + 4 * a3);
  *(_DWORD *)(v14 + 4 * a3) = v13;
  uint64_t v16 = *((void *)this + 13);
  double result = *(double *)(v16 + 8 * a2);
  *(void *)(v16 + 8 * a2) = *(void *)(v16 + 8 * a3);
  *(double *)(v16 + 8 * a3) = result;
  return result;
}

uint64_t CPMLLibSVM::Solver::reconstruct_gradient(uint64_t this)
{
  uint64_t v1 = *(unsigned int *)(this + 8);
  int v2 = *(_DWORD *)(this + 112);
  if (v1 != v2)
  {
    uint64_t v3 = this;
    if ((int)v1 < v2)
    {
      unint64_t v4 = (double *)(*(void *)(this + 104) + 8 * (int)v1);
      unint64_t v5 = (double *)(*(void *)(this + 88) + 8 * (int)v1);
      uint64_t v6 = (double *)(*(void *)(this + 24) + 8 * (int)v1);
      uint64_t v7 = v2 - (uint64_t)(int)v1;
      do
      {
        double v8 = *v4++;
        double v9 = v8;
        double v10 = *v5++;
        *v6++ = v9 + v10;
        --v7;
      }
      while (v7);
    }
    if ((int)v1 < 1)
    {
      int v11 = 0;
    }
    else
    {
      int v11 = 0;
      uint64_t v12 = *(unsigned __int8 **)(this + 32);
      uint64_t v13 = v1;
      do
      {
        int v14 = *v12++;
        if (v14 == 2) {
          ++v11;
        }
        --v13;
      }
      while (v13);
    }
    if ((int)v1 > 2 * v11)
    {
      this = info("\nWARNING: using -h 0 may be faster\n");
      int v2 = *(_DWORD *)(v3 + 112);
      uint64_t v1 = *(unsigned int *)(v3 + 8);
    }
    if (v2 * v11 <= 2 * (int)v1 * (v2 - (int)v1))
    {
      if ((int)v1 >= 1)
      {
        uint64_t v19 = 0;
        do
        {
          if (*(unsigned char *)(*(void *)(v3 + 32) + v19) == 2)
          {
            this = (***(uint64_t (****)(void, uint64_t))(v3 + 48))(*(void *)(v3 + 48), v19);
            LODWORD(v1) = *(_DWORD *)(v3 + 8);
            int v20 = *(_DWORD *)(v3 + 112);
            if ((int)v1 < v20)
            {
              double v21 = *(double *)(*(void *)(v3 + 40) + 8 * v19);
              int v22 = (float *)(this + 4 * (int)v1);
              uint64_t v23 = (double *)(*(void *)(v3 + 24) + 8 * (int)v1);
              uint64_t v24 = v20 - (uint64_t)(int)v1;
              do
              {
                float v25 = *v22++;
                *uint64_t v23 = *v23 + v21 * v25;
                ++v23;
                --v24;
              }
              while (v24);
            }
          }
          ++v19;
        }
        while (v19 < (int)v1);
      }
    }
    else if (v2 > (int)v1)
    {
      uint64_t v15 = (int)v1;
      uint64_t v16 = v1;
      do
      {
        this = (***(uint64_t (****)(void, uint64_t, uint64_t))(v3 + 48))(*(void *)(v3 + 48), v15, v16);
        uint64_t v16 = *(unsigned int *)(v3 + 8);
        if ((int)v16 >= 1)
        {
          uint64_t v17 = 0;
          uint64_t v18 = *(void *)(v3 + 32);
          do
          {
            if (*(unsigned char *)(v18 + v17) == 2) {
              *(double *)(*(void *)(v3 + 24) + 8 * v15) = *(double *)(*(void *)(v3 + 24) + 8 * v15)
            }
                                                          + *(double *)(*(void *)(v3 + 40) + 8 * v17)
                                                          * *(float *)(this + 4 * v17);
            ++v17;
          }
          while (v16 != v17);
        }
        ++v15;
      }
      while (v15 < *(int *)(v3 + 112));
    }
  }
  return this;
}

void CPMLLibSVM::Solver::Solve(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)(a1 + 112) = a2;
  *(void *)(a1 + 48) = a3;
  *(void *)(a1 + 56) = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 8))(a3);
  operator new[]();
}

uint64_t CPMLLibSVM::Solver::select_working_set(CPMLLibSVM::Solver *this, int *a2, int *a3)
{
  uint64_t v6 = *((unsigned int *)this + 2);
  if ((int)v6 < 1)
  {
    LODWORD(v8) = -1;
    double v9 = -INFINITY;
    double v12 = -INFINITY;
    int v13 = -1;
    goto LABEL_35;
  }
  uint64_t v7 = 0;
  uint64_t v8 = 0xFFFFFFFFLL;
  double v9 = -INFINITY;
  do
  {
    if (*(unsigned char *)(*((void *)this + 2) + v7) == 1)
    {
      if (*(unsigned char *)(*((void *)this + 4) + v7) != 1)
      {
        double v10 = -*(double *)(*((void *)this + 3) + 8 * v7);
        if (v9 <= v10) {
          goto LABEL_9;
        }
      }
    }
    else if (*(unsigned char *)(*((void *)this + 4) + v7))
    {
      double v10 = *(double *)(*((void *)this + 3) + 8 * v7);
      if (v10 >= v9)
      {
LABEL_9:
        double v9 = v10;
        uint64_t v8 = v7;
      }
    }
    ++v7;
  }
  while (v6 != v7);
  if (v8 == -1)
  {
    uint64_t v11 = 0;
    LODWORD(v8) = -1;
  }
  else
  {
    uint64_t v11 = (***((uint64_t (****)(void, uint64_t))this + 6))(*((void *)this + 6), v8);
    LODWORD(v6) = *((_DWORD *)this + 2);
  }
  if ((int)v6 >= 1)
  {
    uint64_t v14 = 0;
    uint64_t v15 = *((void *)this + 2);
    int v13 = -1;
    double v12 = -INFINITY;
    double v16 = INFINITY;
    while (1)
    {
      if (*(unsigned char *)(v15 + v14) == 1)
      {
        if (!*(unsigned char *)(*((void *)this + 4) + v14)) {
          goto LABEL_32;
        }
        uint64_t v17 = *((void *)this + 3);
        double v18 = *(double *)(v17 + 8 * v14);
        double v19 = v9 + v18;
        if (v18 >= v12) {
          double v12 = *(double *)(v17 + 8 * v14);
        }
        if (v19 <= 0.0) {
          goto LABEL_32;
        }
        double v20 = *(double *)(*((void *)this + 7) + 8 * (int)v8) + *(double *)(*((void *)this + 7) + 8 * v14);
        double v21 = *(float *)(v11 + 4 * v14);
        double v22 = (double)*(char *)(v15 + (int)v8) * -2.0;
      }
      else
      {
        if (*(unsigned char *)(*((void *)this + 4) + v14) == 1) {
          goto LABEL_32;
        }
        double v23 = *(double *)(*((void *)this + 3) + 8 * v14);
        double v19 = v9 - v23;
        double v24 = -v23;
        if (v12 <= v24) {
          double v12 = v24;
        }
        if (v19 <= 0.0) {
          goto LABEL_32;
        }
        double v20 = *(double *)(*((void *)this + 7) + 8 * (int)v8) + *(double *)(*((void *)this + 7) + 8 * v14);
        double v22 = (double)*(char *)(v15 + (int)v8) + (double)*(char *)(v15 + (int)v8);
        double v21 = *(float *)(v11 + 4 * v14);
      }
      double v25 = v20 + v22 * v21;
      double v26 = -(v19 * v19);
      if (v25 <= 0.0) {
        double v25 = 1.0e-12;
      }
      double v27 = v26 / v25;
      if (v27 <= v16)
      {
        int v13 = v14;
        double v16 = v27;
      }
LABEL_32:
      if (v6 == ++v14) {
        goto LABEL_35;
      }
    }
  }
  int v13 = -1;
  double v12 = -INFINITY;
LABEL_35:
  if (v9 + v12 < *((double *)this + 8)) {
    return 1;
  }
  uint64_t result = 0;
  *a2 = v8;
  *a3 = v13;
  return result;
}

BOOL CPMLLibSVM::Solver::be_shrunk(CPMLLibSVM::Solver *this, int a2, double a3, double a4)
{
  if (*(unsigned char *)(*((void *)this + 4) + a2))
  {
    if (*(unsigned char *)(*((void *)this + 4) + a2) != 1) {
      return 0;
    }
    double v4 = -*(double *)(*((void *)this + 3) + 8 * a2);
    if (*(unsigned char *)(*((void *)this + 2) + a2) != 1) {
      goto LABEL_4;
    }
  }
  else
  {
    double v4 = *(double *)(*((void *)this + 3) + 8 * a2);
    if (*(unsigned char *)(*((void *)this + 2) + a2) == 1)
    {
LABEL_4:
      BOOL v5 = v4 <= a4;
      return !v5;
    }
  }
  BOOL v5 = v4 <= a3;
  return !v5;
}

void CPMLLibSVM::Solver::do_shrinking(CPMLLibSVM::Solver *this)
{
  int v2 = *((_DWORD *)this + 2);
  if (v2 < 1)
  {
    double v8 = -INFINITY;
    double v6 = -INFINITY;
  }
  else
  {
    double v4 = (double *)*((void *)this + 3);
    uint64_t v3 = (unsigned __int8 *)*((void *)this + 4);
    BOOL v5 = (unsigned __int8 *)*((void *)this + 2);
    double v6 = -INFINITY;
    uint64_t v7 = *((unsigned int *)this + 2);
    double v8 = -INFINITY;
    do
    {
      int v10 = *v5++;
      int v9 = v10;
      int v12 = *v3++;
      int v11 = v12;
      double v13 = *v4;
      if (v9 == 1)
      {
        if (v11 == 1) {
          goto LABEL_8;
        }
        if (v8 <= -v13) {
          double v8 = -v13;
        }
        if (v11)
        {
LABEL_8:
          if (v13 >= v6) {
            double v6 = *v4;
          }
        }
      }
      else
      {
        if (v11 == 1) {
          goto LABEL_15;
        }
        if (v6 <= -v13) {
          double v6 = -v13;
        }
        if (v11)
        {
LABEL_15:
          if (v13 >= v8) {
            double v8 = *v4;
          }
        }
      }
      ++v4;
      --v7;
    }
    while (v7);
  }
  if (!*((unsigned char *)this + 116) && v8 + v6 <= *((double *)this + 8) * 10.0)
  {
    *((unsigned char *)this + 116) = 1;
    CPMLLibSVM::Solver::reconstruct_gradient((uint64_t)this);
    *((_DWORD *)this + 2) = *((_DWORD *)this + 28);
    info("*");
    int v2 = *((_DWORD *)this + 2);
  }
  if (v2 >= 1)
  {
    for (int i = 0; i < v2; ++i)
    {
      if (CPMLLibSVM::Solver::be_shrunk(this, i, v8, v6))
      {
        while (1)
        {
          *((_DWORD *)this + 2) = --v2;
          if (v2 <= i) {
            break;
          }
          if (!CPMLLibSVM::Solver::be_shrunk(this, v2, v8, v6))
          {
            CPMLLibSVM::Solver::swap_index(this, i, v2);
            int v2 = *((_DWORD *)this + 2);
            break;
          }
        }
      }
    }
  }
}

double CPMLLibSVM::Solver::calculate_rho(CPMLLibSVM::Solver *this)
{
  uint64_t v1 = *((unsigned int *)this + 2);
  if ((int)v1 < 1)
  {
    double v7 = INFINITY;
    double v8 = -INFINITY;
  }
  else
  {
    int v2 = 0;
    uint64_t v3 = (unsigned __int8 *)*((void *)this + 2);
    double v4 = (double *)*((void *)this + 3);
    BOOL v5 = (unsigned __int8 *)*((void *)this + 4);
    double v6 = 0.0;
    double v7 = INFINITY;
    double v8 = -INFINITY;
    do
    {
      int v10 = *v3++;
      int v9 = v10;
      double v11 = (double)(char)v10;
      double v12 = *v4++;
      double v13 = v12 * v11;
      LODWORD(v12) = *v5++;
      int v14 = LODWORD(v12);
      if (v8 <= v13) {
        double v15 = v13;
      }
      else {
        double v15 = v8;
      }
      if (v7 >= v13) {
        double v16 = v13;
      }
      else {
        double v16 = v7;
      }
      if (v9 == 1) {
        double v15 = v8;
      }
      else {
        double v16 = v7;
      }
      double v17 = v6 + v13;
      if (v8 <= v13) {
        double v18 = v13;
      }
      else {
        double v18 = v8;
      }
      if (v7 < v13) {
        double v13 = v7;
      }
      if (v9 == 255) {
        double v18 = v8;
      }
      else {
        double v13 = v7;
      }
      if (v14 == 1) {
        int v19 = v2;
      }
      else {
        int v19 = v2 + 1;
      }
      if (v14 == 1)
      {
        double v7 = v13;
        double v8 = v18;
        double v20 = v6;
      }
      else
      {
        double v20 = v17;
      }
      if (v14)
      {
        int v2 = v19;
      }
      else
      {
        double v7 = v16;
        double v8 = v15;
      }
      if (v14) {
        double v6 = v20;
      }
      --v1;
    }
    while (v1);
    if (v2 > 0) {
      return v6 / (double)v2;
    }
  }
  return (v7 + v8) * 0.5;
}

uint64_t CPMLLibSVM::Solver_NU::select_working_set(CPMLLibSVM::Solver_NU *this, int *a2, int *a3)
{
  uint64_t v6 = *((unsigned int *)this + 2);
  if ((int)v6 < 1)
  {
    LODWORD(v8) = -1;
    double v9 = -INFINITY;
    LODWORD(v10) = -1;
    double v11 = -INFINITY;
    double v13 = -INFINITY;
    double v14 = -INFINITY;
    int v15 = -1;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0xFFFFFFFFLL;
    double v9 = -INFINITY;
    uint64_t v10 = 0xFFFFFFFFLL;
    double v11 = -INFINITY;
    do
    {
      if (*(unsigned char *)(*((void *)this + 2) + v7) == 1)
      {
        if (*(unsigned char *)(*((void *)this + 4) + v7) != 1 && v11 <= -*(double *)(*((void *)this + 3) + 8 * v7))
        {
          double v11 = -*(double *)(*((void *)this + 3) + 8 * v7);
          uint64_t v10 = v7;
        }
      }
      else if (*(unsigned char *)(*((void *)this + 4) + v7) && *(double *)(*((void *)this + 3) + 8 * v7) >= v9)
      {
        double v9 = *(double *)(*((void *)this + 3) + 8 * v7);
        uint64_t v8 = v7;
      }
      ++v7;
    }
    while (v6 != v7);
    if (v10 == -1)
    {
      uint64_t v12 = 0;
      LODWORD(v10) = -1;
    }
    else
    {
      uint64_t v12 = (***((uint64_t (****)(void, uint64_t))this + 6))(*((void *)this + 6), v10);
      uint64_t v6 = *((unsigned int *)this + 2);
    }
    if (v8 == -1)
    {
      uint64_t v16 = 0;
      LODWORD(v8) = -1;
    }
    else
    {
      uint64_t v16 = (***((uint64_t (****)(void, uint64_t, uint64_t))this + 6))(*((void *)this + 6), v8, v6);
      LODWORD(v6) = *((_DWORD *)this + 2);
    }
    if ((int)v6 >= 1)
    {
      uint64_t v17 = 0;
      int v15 = -1;
      double v14 = -INFINITY;
      double v18 = INFINITY;
      double v13 = -INFINITY;
      while (1)
      {
        if (*(unsigned char *)(*((void *)this + 2) + v17) == 1)
        {
          if (!*(unsigned char *)(*((void *)this + 4) + v17)) {
            goto LABEL_35;
          }
          uint64_t v19 = *((void *)this + 3);
          double v20 = *(double *)(v19 + 8 * v17);
          double v21 = v11 + v20;
          if (v20 >= v13) {
            double v13 = *(double *)(v19 + 8 * v17);
          }
          if (v21 <= 0.0) {
            goto LABEL_35;
          }
          double v22 = *(double *)(*((void *)this + 7) + 8 * (int)v10) + *(double *)(*((void *)this + 7) + 8 * v17);
          float v23 = *(float *)(v12 + 4 * v17);
        }
        else
        {
          if (*(unsigned char *)(*((void *)this + 4) + v17) == 1) {
            goto LABEL_35;
          }
          double v24 = *(double *)(*((void *)this + 3) + 8 * v17);
          double v21 = v9 - v24;
          double v25 = -v24;
          if (v14 <= v25) {
            double v14 = v25;
          }
          if (v21 <= 0.0) {
            goto LABEL_35;
          }
          double v22 = *(double *)(*((void *)this + 7) + 8 * (int)v8) + *(double *)(*((void *)this + 7) + 8 * v17);
          float v23 = *(float *)(v16 + 4 * v17);
        }
        double v26 = v22 - (float)(v23 + v23);
        double v27 = -(v21 * v21);
        if (v26 <= 0.0) {
          double v26 = 1.0e-12;
        }
        double v28 = v27 / v26;
        if (v28 <= v18)
        {
          int v15 = v17;
          double v18 = v28;
        }
LABEL_35:
        if (v6 == ++v17) {
          goto LABEL_38;
        }
      }
    }
    int v15 = -1;
    double v13 = -INFINITY;
    double v14 = -INFINITY;
  }
LABEL_38:
  double v29 = v11 + v13;
  double v30 = v9 + v14;
  if (v29 > v30) {
    double v30 = v29;
  }
  if (v30 < *((double *)this + 8)) {
    return 1;
  }
  uint64_t result = 0;
  if (*(unsigned char *)(*((void *)this + 2) + v15) == 1) {
    int v32 = v10;
  }
  else {
    int v32 = v8;
  }
  *a2 = v32;
  *a3 = v15;
  return result;
}

BOOL CPMLLibSVM::Solver_NU::be_shrunk(CPMLLibSVM::Solver_NU *this, int a2, double a3, double a4, double a5, double a6)
{
  if (*(unsigned char *)(*((void *)this + 4) + a2))
  {
    if (*(unsigned char *)(*((void *)this + 4) + a2) != 1) {
      return 0;
    }
    double v6 = -*(double *)(*((void *)this + 3) + 8 * a2);
    if (*(unsigned char *)(*((void *)this + 2) + a2) == 1) {
      BOOL v7 = v6 <= a3;
    }
    else {
      BOOL v7 = v6 <= a6;
    }
  }
  else
  {
    double v8 = *(double *)(*((void *)this + 3) + 8 * a2);
    if (*(unsigned char *)(*((void *)this + 2) + a2) == 1) {
      BOOL v7 = v8 <= a4;
    }
    else {
      BOOL v7 = v8 <= a5;
    }
  }
  return !v7;
}

void CPMLLibSVM::Solver_NU::do_shrinking(CPMLLibSVM::Solver_NU *this)
{
  uint64_t v2 = *((unsigned int *)this + 2);
  if ((int)v2 < 1)
  {
    double v7 = -INFINITY;
    double v6 = -INFINITY;
    double v5 = -INFINITY;
    double v4 = -INFINITY;
  }
  else
  {
    uint64_t v3 = 0;
    double v4 = -INFINITY;
    double v5 = -INFINITY;
    double v6 = -INFINITY;
    double v7 = -INFINITY;
    do
    {
      int v8 = *(unsigned __int8 *)(*((void *)this + 2) + v3);
      if (*(unsigned char *)(*((void *)this + 4) + v3) == 1) {
        goto LABEL_10;
      }
      double v9 = -*(double *)(*((void *)this + 3) + 8 * v3);
      if (v8 == 1)
      {
        if (v7 < v9) {
          double v7 = -*(double *)(*((void *)this + 3) + 8 * v3);
        }
      }
      else if (v4 < v9)
      {
        double v4 = -*(double *)(*((void *)this + 3) + 8 * v3);
      }
      if (*(unsigned char *)(*((void *)this + 4) + v3))
      {
LABEL_10:
        double v10 = *(double *)(*((void *)this + 3) + 8 * v3);
        if (v8 == 1)
        {
          if (v10 > v6) {
            double v6 = *(double *)(*((void *)this + 3) + 8 * v3);
          }
        }
        else if (v10 > v5)
        {
          double v5 = *(double *)(*((void *)this + 3) + 8 * v3);
        }
      }
      ++v3;
    }
    while (v2 != v3);
  }
  if (!*((unsigned char *)this + 116))
  {
    double v11 = v7 + v6;
    if (v7 + v6 <= v5 + v4) {
      double v11 = v5 + v4;
    }
    if (v11 <= *((double *)this + 8) * 10.0)
    {
      *((unsigned char *)this + 116) = 1;
      CPMLLibSVM::Solver::reconstruct_gradient((uint64_t)this);
      LODWORD(v2) = *((_DWORD *)this + 28);
      *((_DWORD *)this + 2) = v2;
    }
  }
  if ((int)v2 >= 1)
  {
    int v12 = 0;
    do
    {
      if (CPMLLibSVM::Solver_NU::be_shrunk(this, v12, v7, v6, v5, v4))
      {
        while (1)
        {
          LODWORD(v2) = v2 - 1;
          *((_DWORD *)this + 2) = v2;
          if ((int)v2 <= v12) {
            break;
          }
          if (!CPMLLibSVM::Solver_NU::be_shrunk(this, v2, v7, v6, v5, v4))
          {
            CPMLLibSVM::Solver::swap_index(this, v12, v2);
            LODWORD(v2) = *((_DWORD *)this + 2);
            break;
          }
        }
      }
      ++v12;
    }
    while (v12 < (int)v2);
  }
}

double CPMLLibSVM::Solver_NU::calculate_rho(CPMLLibSVM::Solver_NU *this)
{
  uint64_t v1 = *((unsigned int *)this + 2);
  if ((int)v1 < 1)
  {
    int v3 = 0;
    double v5 = 0.0;
    double v6 = INFINITY;
    double v7 = -INFINITY;
    double v9 = -INFINITY;
    double v10 = INFINITY;
  }
  else
  {
    uint64_t v2 = 0;
    int v3 = 0;
    int v4 = 0;
    double v5 = 0.0;
    double v6 = INFINITY;
    double v7 = -INFINITY;
    double v8 = 0.0;
    double v9 = -INFINITY;
    double v10 = INFINITY;
    do
    {
      int v11 = *(unsigned __int8 *)(*((void *)this + 4) + v2);
      if (*(unsigned char *)(*((void *)this + 2) + v2) == 1)
      {
        if (*(unsigned char *)(*((void *)this + 4) + v2))
        {
          if (v11 == 1)
          {
            if (v9 <= *(double *)(*((void *)this + 3) + 8 * v2)) {
              double v9 = *(double *)(*((void *)this + 3) + 8 * v2);
            }
          }
          else
          {
            ++v4;
            double v8 = v8 + *(double *)(*((void *)this + 3) + 8 * v2);
          }
        }
        else if (v10 >= *(double *)(*((void *)this + 3) + 8 * v2))
        {
          double v10 = *(double *)(*((void *)this + 3) + 8 * v2);
        }
      }
      else if (*(unsigned char *)(*((void *)this + 4) + v2))
      {
        if (v11 == 1)
        {
          if (v7 <= *(double *)(*((void *)this + 3) + 8 * v2)) {
            double v7 = *(double *)(*((void *)this + 3) + 8 * v2);
          }
        }
        else
        {
          ++v3;
          double v5 = v5 + *(double *)(*((void *)this + 3) + 8 * v2);
        }
      }
      else if (v6 >= *(double *)(*((void *)this + 3) + 8 * v2))
      {
        double v6 = *(double *)(*((void *)this + 3) + 8 * v2);
      }
      ++v2;
    }
    while (v1 != v2);
    if (v4 > 0)
    {
      double v12 = v8 / (double)v4;
      goto LABEL_27;
    }
  }
  double v12 = (v10 + v9) * 0.5;
LABEL_27:
  if (v3 < 1) {
    double v13 = (v6 + v7) * 0.5;
  }
  else {
    double v13 = v5 / (double)v3;
  }
  *(double *)(*((void *)this + 15) + 32) = (v12 + v13) * 0.5;
  return (v12 - v13) * 0.5;
}

char *svm_train(int *a1, long long *a2)
{
  int v4 = (char *)malloc_type_malloc(0xB8uLL, 0x109004003BC950CuLL);
  double v5 = v4;
  long long v6 = *a2;
  long long v7 = a2[2];
  *((_OWORD *)v4 + 1) = a2[1];
  *((_OWORD *)v4 + 2) = v7;
  *(_OWORD *)int v4 = v6;
  long long v8 = a2[3];
  long long v9 = a2[4];
  long long v10 = a2[5];
  *((void *)v4 + 12) = *((void *)a2 + 12);
  *((_OWORD *)v4 + 4) = v9;
  *((_OWORD *)v4 + 5) = v10;
  *((_OWORD *)v4 + 3) = v8;
  *((_DWORD *)v4 + 44) = 0;
  if ((*(_DWORD *)a2 - 2) <= 2)
  {
    *((void *)v4 + 17) = 0;
    int v11 = (void **)(v4 + 136);
    *((_DWORD *)v4 + 26) = 2;
    *((void *)v4 + 18) = 0;
    *((void *)v4 + 20) = 0;
    *((void *)v4 + 21) = 0;
    *((void *)v4 + 15) = malloc_type_malloc(8uLL, 0x80040B8603338uLL);
    if (*((_DWORD *)a2 + 25) && (*(_DWORD *)a2 - 3) <= 1)
    {
      *int v11 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
      double v12 = (double *)malloc_type_malloc(8 * *a1, 0x100004000313F17uLL);
      uint64_t v311 = *((void *)a2 + 12);
      long long v13 = a2[4];
      long long v310 = a2[5];
      long long v14 = a2[1];
      long long v305 = *a2;
      long long v306 = v14;
      long long v15 = a2[2];
      long long v308 = a2[3];
      *(_OWORD *)v309 = v13;
      long long v307 = v15;
      HIDWORD(v311) = 0;
      svm_cross_validation(a1, &v305, 5, (uint64_t)v12);
      uint64_t v16 = *a1;
      if ((int)v16 < 1)
      {
        int v23 = 0;
        double v25 = 0.0;
      }
      else
      {
        uint64_t v17 = (double *)*((void *)a1 + 1);
        double v18 = 0.0;
        uint64_t v19 = *a1;
        double v20 = v12;
        do
        {
          double v21 = *v17++;
          double v22 = *v20;
          *double v20 = v21 - *v20;
          ++v20;
          double v18 = v18 + vabdd_f64(v21, v22);
          --v19;
        }
        while (v19);
        int v23 = 0;
        double v24 = sqrt(v18 / (double)(int)v16 * (v18 / (double)(int)v16 + v18 / (double)(int)v16)) * 5.0;
        double v25 = 0.0;
        uint64_t v26 = v16;
        double v27 = v12;
        do
        {
          double v28 = *v27++;
          double v29 = fabs(v28);
          BOOL v30 = v29 <= v24;
          if (v29 > v24) {
            double v29 = -0.0;
          }
          double v25 = v25 + v29;
          if (!v30) {
            ++v23;
          }
          --v26;
        }
        while (v26);
      }
      double v248 = v25 / (double)((int)v16 - v23);
      info("Prob. model for test data: target value = predicted value + z,\nz: Laplace distribution e^(-|z|/sigma)/(2sigma),sigma= %g\n", v248);
      free(v12);
      *(double *)*int v11 = v248;
    }
    v219 = svm_train_one(a1, a2);
    uint64_t v250 = v249;
    v251 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
    *((void *)v5 + 16) = v251;
    void *v251 = v250;
    uint64_t v252 = *a1;
    if ((int)v252 < 1)
    {
      unsigned int v253 = 0;
    }
    else
    {
      unsigned int v253 = 0;
      v254 = (double *)v219;
      do
      {
        double v255 = *v254++;
        int v256 = v255 < 0.0;
        if (v255 > 0.0) {
          int v256 = 1;
        }
        v253 += v256;
        --v252;
      }
      while (v252);
    }
    *((_DWORD *)v5 + 27) = v253;
    *((void *)v5 + 14) = malloc_type_malloc(8 * v253, 0x2004093837F09uLL);
    **((void **)v5 + 15) = malloc_type_malloc(8 * v253, 0x100004000313F17uLL);
    *((void *)v5 + 19) = malloc_type_malloc(4 * v253, 0x100004052888210uLL);
    int v257 = *a1;
    if (*a1 >= 1)
    {
      uint64_t v258 = 0;
      int v259 = 0;
      do
      {
        double v260 = *(double *)&v219[8 * v258];
        if (v260 < 0.0 || v260 > 0.0)
        {
          *(void *)(*((void *)v5 + 14) + 8 * v259) = *(void *)(*((void *)a1 + 2) + 8 * v258);
          *(double *)(**((void **)v5 + 15) + 8 * v259) = v260;
          *(_DWORD *)(*((void *)v5 + 19) + 4 * v259++) = ++v258;
          int v257 = *a1;
        }
        else
        {
          ++v258;
        }
      }
      while (v258 < v257);
    }
    goto LABEL_232;
  }
  size_t v31 = *a1;
  size_t v32 = *a1;
  unsigned int v304 = 0;
  v302 = 0;
  v303 = 0;
  v301 = 0;
  v267 = (int *)malloc_type_malloc(4 * v31, 0x100004052888210uLL);
  svm_group_classes(a1, (int *)&v304, &v303, &v302, &v301, (uint64_t)v267);
  uint64_t v33 = v304;
  if (v304 == 1) {
    info("WARNING: training data in only one class. See README for details.\n");
  }
  uint64_t v34 = (int)v33;
  qos_class_t v35 = malloc_type_malloc(8 * v31, 0x2004093837F09uLL);
  double v36 = v35;
  if ((int)v32 >= 1)
  {
    size_t v37 = v32;
    unsigned int v38 = v267;
    int v39 = v35;
    do
    {
      uint64_t v40 = *v38++;
      *v39++ = *(void *)(*((void *)a1 + 2) + 8 * v40);
      --v37;
    }
    while (v37);
  }
  unsigned int size = v31;
  size_t v265 = v32;
  uint64_t v41 = (double *)malloc_type_malloc(8 * (int)v33, 0x100004000313F17uLL);
  int v42 = v41;
  unsigned int v266 = v33 - 1;
  if ((int)v33 >= 1)
  {
    uint64_t v43 = v33;
    int v44 = v41;
    do
    {
      *v44++ = *((double *)a2 + 6);
      --v43;
    }
    while (v43);
  }
  v276 = a2;
  int v45 = *((_DWORD *)a2 + 14);
  if (v45 >= 1)
  {
    uint64_t v46 = 0;
    int8x16_t v47 = v303;
    int8x16_t v48 = (FILE **)MEMORY[0x263EF8348];
    do
    {
      if ((int)v33 < 1)
      {
        LODWORD(v49) = 0;
      }
      else
      {
        uint64_t v49 = 0;
        while (*(_DWORD *)(*((void *)v276 + 8) + 4 * v46) != v47[v49])
        {
          if (v33 == ++v49) {
            goto LABEL_31;
          }
        }
      }
      if (v49 == v33)
      {
LABEL_31:
        fprintf(*v48, "WARNING: class label %d specified in weight is not found\n", *(_DWORD *)(*((void *)v276 + 8) + 4 * v46));
        int v45 = *((_DWORD *)v276 + 14);
      }
      else
      {
        v42[v49] = *(double *)(*((void *)v276 + 9) + 8 * v46) * v42[v49];
      }
      ++v46;
    }
    while (v46 < v45);
  }
  float64x2_t v50 = (char *)malloc_type_malloc(v31, 0x100004077774924uLL);
  float64x2_t v51 = v50;
  if ((int)v265 >= 1) {
    bzero(v50, v265);
  }
  v279 = v51;
  int v268 = v266 * v33;
  v280 = malloc_type_malloc(16 * ((int)(v266 * v33) / 2), 0x1080040FC6463CFuLL);
  float64x2_t v52 = v276;
  uint64_t v263 = (uint64_t)(int)(v266 * v33 + ((int)(v266 * v33) < 0)) >> 1;
  size_t v53 = 8 * v263;
  uint64_t v262 = 8 * v263;
  if (*((_DWORD *)v276 + 25))
  {
    float64x2_t v54 = (uint64_t *)malloc_type_malloc(v53, 0x100004000313F17uLL);
    v289 = (double *)malloc_type_malloc(v53, 0x100004000313F17uLL);
  }
  else
  {
    float64x2_t v54 = 0;
    v289 = 0;
  }
  uint64_t v274 = v33;
  v275 = v42;
  v291 = v54;
  uint64_t v270 = (int)v33;
  if ((int)v33 < 1) {
    goto LABEL_162;
  }
  uint64_t v55 = 0;
  LODWORD(v56) = 0;
  v277 = v301;
  v278 = v302;
  double v57 = -1.0;
  uint64_t v58 = 1;
  v269 = v5;
  v273 = v36;
  do
  {
    uint64_t v59 = v55 + 1;
    if (v55 + 1 >= v34) {
      goto LABEL_161;
    }
    uint64_t v271 = v55 + 1;
    uint64_t v272 = v58;
    uint64_t v56 = (int)v56;
    uint64_t v60 = v58;
    uint64_t v288 = v55;
    do
    {
      uint64_t v61 = v33;
      uint64_t v284 = v278[v55];
      float64x2_t v62 = v36;
      uint64_t v63 = v277->i32[v55];
      uint64_t v286 = v278[v60];
      uint64_t v287 = v277->u32[v55];
      uint64_t v64 = v277->u32[v60];
      int v298 = v64 + v63;
      v300 = malloc_type_malloc(8 * ((int)v64 + (int)v63), 0x2004093837F09uLL);
      v299 = malloc_type_malloc(8 * v298, 0x100004000313F17uLL);
      uint64_t v285 = v63;
      BOOL v30 = (int)v63 < 1;
      double v36 = v62;
      if (!v30)
      {
        uint64_t v65 = 0;
        do
        {
          *(void *)((char *)v300 + v65 * 8) = v62[v284 + v65];
          *(void *)((char *)v299 + v65 * 8) = 0x3FF0000000000000;
          ++v65;
        }
        while (v287 != v65);
      }
      if ((int)v64 >= 1)
      {
        uint64_t v66 = 8 * v285;
        uint64_t v67 = v64;
        int8x16_t v68 = &v62[v286];
        do
        {
          uint64_t v69 = *v68++;
          *(void *)((char *)v300 + v66) = v69;
          *(void *)((char *)v299 + v66) = 0xBFF0000000000000;
          v66 += 8;
          --v67;
        }
        while (v67);
      }
      uint64_t v33 = v61;
      if (!*((_DWORD *)v52 + 25)) {
        goto LABEL_147;
      }
      uint64_t v282 = v64;
      uint64_t v283 = v60;
      uint64_t v290 = v56;
      double v70 = v42[v288];
      double v71 = v42[v60];
      float64x2_t v72 = (int *)malloc_type_malloc(4 * v298, 0x100004052888210uLL);
      float64x2_t v73 = (double *)malloc_type_malloc(8 * v298, 0x100004000313F17uLL);
      if (v298 >= 1)
      {
        for (uint64_t i = 0; i < v298; ++i)
          v72[i] = i;
        if (v298 >= 1)
        {
          int v75 = 0;
          for (uint64_t j = 0; j < v298; ++j)
          {
            uint64_t v77 = j + rand() % (v75 + v298);
            int v78 = v72[j];
            v72[j] = v72[v77];
            v72[v77] = v78;
            --v75;
          }
        }
      }
      int v79 = 0;
      do
      {
        int v80 = v298 * v79;
        uint64_t v81 = (v298 * v79++ / 5);
        int v82 = v298 * v79 / 5;
        int v312 = v81 - v82 + v298;
        v314 = malloc_type_malloc(8 * v312, 0x2004093837F09uLL);
        float64x2_t v83 = (double *)malloc_type_malloc(8 * v312, 0x100004000313F17uLL);
        v313 = v83;
        if (v80 < 5)
        {
          LODWORD(v86) = 0;
        }
        else
        {
          uint64_t v84 = 0;
          do
          {
            uint64_t v85 = v72[v84];
            v314[v84] = *((void *)v300 + v85);
            float64x2_t v83 = v313;
            v313[v84++] = *((double *)v299 + v85);
          }
          while (v81 != v84);
          LODWORD(v86) = v80 / 5;
        }
        if (v82 < v298)
        {
          int v87 = &v72[v82];
          uint64_t v88 = v86;
          uint64_t v89 = v298 - (uint64_t)v82;
          do
          {
            uint64_t v90 = *v87++;
            v314[v88] = *((void *)v300 + v90);
            float64x2_t v83 = v313;
            v313[v88++] = *((double *)v299 + v90);
            LODWORD(v86) = v86 + 1;
            --v89;
          }
          while (v89);
        }
        if (v86)
        {
          int v91 = 0;
          int v92 = 0;
          uint64_t v86 = v86;
          do
          {
            double v93 = *v83++;
            if (v93 <= 0.0) {
              ++v91;
            }
            else {
              ++v92;
            }
            --v86;
          }
          while (v86);
        }
        else
        {
          int v92 = 0;
          int v91 = 0;
        }
        if (v92 | v91)
        {
          if (v92) {
            BOOL v97 = v91 == 0;
          }
          else {
            BOOL v97 = 0;
          }
          if (v97)
          {
            if ((int)v81 < v82)
            {
              v109 = &v72[(int)v81];
              uint64_t v110 = v82 - (uint64_t)(int)v81;
              do
              {
                uint64_t v111 = *v109++;
                v73[v111] = 1.0;
                --v110;
              }
              while (v110);
            }
          }
          else
          {
            if (v92) {
              BOOL v98 = 1;
            }
            else {
              BOOL v98 = v91 == 0;
            }
            if (v98)
            {
              uint64_t v311 = *((void *)v52 + 12);
              long long v99 = v52[4];
              long long v310 = v52[5];
              long long v100 = v52[1];
              long long v305 = *v52;
              long long v306 = v100;
              long long v101 = v52[2];
              HIDWORD(v308) = HIDWORD(v52[3]);
              *(_OWORD *)v309 = v99;
              long long v307 = v101;
              HIDWORD(v311) = 0;
              *(void *)&long long v308 = 0x3FF0000000000000;
              DWORD2(v308) = 2;
              v309[0] = malloc_type_malloc(8uLL, 0x100004052888210uLL);
              int v102 = (double *)malloc_type_malloc(0x10uLL, 0x100004000313F17uLL);
              v309[1] = v102;
              *(void *)v309[0] = 0xFFFFFFFF00000001;
              *int v102 = v70;
              v102[1] = v71;
              uint64_t v103 = svm_train(&v312, &v305);
              int v104 = (int **)v103;
              if ((int)v81 >= v82)
              {
                if (v103) {
                  goto LABEL_100;
                }
              }
              else
              {
                uint64_t v105 = v82;
                int v106 = &v72[(int)v81];
                uint64_t v107 = v105 - (int)v81;
                do
                {
                  svm_predict_values((uint64_t)v104, *((double **)v300 + *v106), &v73[*v106]);
                  uint64_t v108 = *v106++;
                  v73[v108] = v73[v108] * (double)*v104[20];
                  --v107;
                }
                while (v107);
LABEL_100:
                svm_free_model_content((uint64_t)v104);
                free(v104);
              }
              free(v309[0]);
              free(v309[1]);
              goto LABEL_102;
            }
            if ((int)v81 < v82)
            {
              uint64_t v112 = &v72[(int)v81];
              uint64_t v113 = v82 - (uint64_t)(int)v81;
              do
              {
                uint64_t v114 = *v112++;
                v73[v114] = -1.0;
                --v113;
              }
              while (v113);
            }
          }
        }
        else if ((int)v81 < v82)
        {
          int v94 = &v72[(int)v81];
          uint64_t v95 = v82 - (uint64_t)(int)v81;
          do
          {
            uint64_t v96 = *v94++;
            v73[v96] = 0.0;
            --v95;
          }
          while (v95);
        }
LABEL_102:
        free(v314);
        free(v313);
      }
      while (v79 != 5);
      int v115 = v298;
      uint64_t v116 = v298;
      v117 = (double *)v299;
      double v118 = 0.0;
      double v119 = 0.0;
      double v120 = 0.0;
      if (v298 >= 1)
      {
        v121 = (double *)v299;
        uint64_t v122 = v298;
        do
        {
          double v123 = *v121++;
          if (v123 <= 0.0) {
            double v120 = v120 + 1.0;
          }
          else {
            double v119 = v119 + 1.0;
          }
          --v122;
        }
        while (v122);
      }
      v124 = (double *)malloc_type_malloc(8 * v298, 0x100004000313F17uLL);
      v291[v290] = 0;
      double v125 = log((v120 + 1.0) / (v119 + 1.0));
      v289[v290] = v125;
      int v281 = v115;
      if ((int)v116 < 1)
      {
        v131 = v289;
        double v135 = v125;
      }
      else
      {
        double v126 = (v119 + 1.0) / (v119 + 2.0);
        double v118 = 0.0;
        v127 = v124;
        v128 = v73;
        uint64_t v129 = v116;
        double v130 = 1.0 / (v120 + 2.0);
        v131 = v289;
        do
        {
          double v132 = *v117++;
          if (v132 <= 0.0) {
            double v133 = v130;
          }
          else {
            double v133 = v126;
          }
          *v127++ = v133;
          double v134 = *v128++;
          double v135 = v289[v290];
          double v136 = v135 + v134 * *(double *)&v291[v290];
          double v137 = -v136;
          if (v136 >= 0.0)
          {
            double v138 = v133;
          }
          else
          {
            double v137 = v136;
            double v138 = v133 + v57;
          }
          long double v139 = exp(v137);
          double v118 = v118 + log(v139 + 1.0) + v138 * v136;
          --v129;
        }
        while (v129);
      }
      v289 = v131;
      int v140 = 0;
      float64x2_t v54 = v291;
      float64x2_t v52 = v276;
      uint64_t v56 = v290;
      double v141 = 1.0;
      double v142 = v135;
      while (1)
      {
        double v296 = v118;
        double v297 = v142;
        if (v281 < 1)
        {
          double v149 = 0.0;
          double v151 = 1.0e-12;
          double v150 = 1.0e-12;
          double v148 = 0.0;
          double v144 = 0.0;
        }
        else
        {
          double v143 = *(double *)&v54[v56];
          double v144 = 0.0;
          v145 = v73;
          v146 = v124;
          uint64_t v147 = v116;
          double v148 = 0.0;
          double v149 = 0.0;
          double v150 = 1.0e-12;
          double v151 = 1.0e-12;
          do
          {
            double v152 = *v145;
            double v153 = v142 + *v145 * v143;
            if (v153 >= 0.0)
            {
              long double v157 = exp(-v153);
              double v142 = v297;
              double v155 = v157 / (v157 + v141);
              double v156 = v141 / (v157 + v141);
            }
            else
            {
              long double v154 = exp(v153);
              double v142 = v297;
              double v155 = v141 / (v154 + v141);
              double v156 = v154 / (v154 + v141);
            }
            double v158 = v155 * v156;
            double v150 = v150 + v152 * v152 * v158;
            double v151 = v151 + v158;
            double v159 = *v146++;
            double v149 = v149 + v152 * v158;
            double v148 = v148 + v152 * (v159 - v155);
            double v144 = v144 + v159 - v155;
            ++v145;
            --v147;
          }
          while (v147);
        }
        uint64_t v56 = v290;
        float64x2_t v54 = v291;
        if (fabs(v148) < 0.00001 && fabs(v144) < 0.00001) {
          break;
        }
        double v160 = v150 * v151 - v149 * v149;
        double v294 = -(v150 * v144 + -v149 * v148) / v160;
        double v295 = -(v151 * v148 - v149 * v144) / v160;
        double v292 = *(double *)&v291[v290];
        double v293 = v144 * v294 + v148 * v295;
        double v161 = 1.0;
        while (1)
        {
          double v162 = v292 + v161 * v295;
          double v163 = v142 + v161 * v294;
          double v164 = 0.0;
          if ((int)v116 >= 1)
          {
            v165 = v73;
            v166 = v124;
            uint64_t v167 = v116;
            do
            {
              double v168 = *v165++;
              double v169 = v168;
              double v170 = *v166++;
              double v171 = v170;
              double v172 = v163 + v169 * v162;
              double v173 = -v172;
              double v174 = v170 + -1.0;
              if (v172 >= 0.0)
              {
                double v175 = v171;
              }
              else
              {
                double v173 = v172;
                double v175 = v174;
              }
              long double v176 = exp(v173);
              double v164 = v164 + log(v176 + 1.0) + v175 * v172;
              --v167;
            }
            while (v167);
          }
          if (v164 < v296 + v161 * 0.0001 * v293) {
            break;
          }
          double v161 = v161 * 0.5;
          double v142 = v297;
          if (v161 < 1.0e-10)
          {
            uint64_t v56 = v290;
            float64x2_t v54 = v291;
            double v141 = 1.0;
            double v118 = v296;
            goto LABEL_142;
          }
        }
        uint64_t v56 = v290;
        float64x2_t v54 = v291;
        *(double *)&v291[v290] = v162;
        v289[v290] = v163;
        double v142 = v163;
        double v118 = v164;
        double v141 = 1.0;
LABEL_142:
        if (v161 < 1.0e-10)
        {
          info("Line search fails in two-class probability estimates\n");
          break;
        }
        if (++v140 == 100)
        {
          info("Reaching maximal iterations in two-class probability estimates\n");
          break;
        }
      }
      free(v124);
      free(v73);
      free(v72);
      double v36 = v273;
      uint64_t v33 = v274;
      int v42 = v275;
      double v57 = -1.0;
      uint64_t v64 = v282;
      uint64_t v60 = v283;
LABEL_147:
      v177 = svm_train_one(&v298, v52);
      v178 = (char **)&v280[2 * v56];
      *v178 = v177;
      v178[1] = v179;
      uint64_t v180 = v287;
      if ((int)v287 >= 1)
      {
        v181 = &v279[v284];
        v182 = (double *)v177;
        do
        {
          if (!*v181 && *v182 != 0.0) {
            char *v181 = 1;
          }
          ++v181;
          ++v182;
          --v180;
        }
        while (v180);
      }
      if ((int)v64 >= 1)
      {
        v183 = (double *)&v177[8 * v285];
        v184 = &v279[v286];
        do
        {
          if (!*v184 && *v183 != 0.0) {
            char *v184 = 1;
          }
          ++v183;
          ++v184;
          --v64;
        }
        while (v64);
      }
      free(v300);
      free(v299);
      ++v56;
      ++v60;
      uint64_t v55 = v288;
    }
    while (v60 != v33);
    double v5 = v269;
    uint64_t v34 = v270;
    uint64_t v59 = v271;
    uint64_t v58 = v272;
LABEL_161:
    ++v58;
    uint64_t v55 = v59;
  }
  while (v59 != v33);
LABEL_162:
  *((_DWORD *)v5 + 26) = v33;
  size_t v185 = 4 * v34;
  v186 = malloc_type_malloc(4 * v34, 0x100004052888210uLL);
  *((void *)v5 + 20) = v186;
  if ((int)v33 >= 1)
  {
    v187 = (int *)v303;
    uint64_t v188 = v33;
    do
    {
      int v189 = *v187++;
      *v186++ = v189;
      --v188;
    }
    while (v188);
  }
  v190 = malloc_type_malloc(v262, 0x100004000313F17uLL);
  *((void *)v5 + 16) = v190;
  if (v268 > 1)
  {
    uint64_t v191 = v263;
    v192 = v280 + 1;
    do
    {
      uint64_t v193 = *v192;
      v192 += 2;
      *v190++ = v193;
      --v191;
    }
    while (v191);
  }
  if (*((_DWORD *)v52 + 25))
  {
    *((void *)v5 + 17) = malloc_type_malloc(v262, 0x100004000313F17uLL);
    v194 = malloc_type_malloc(v262, 0x100004000313F17uLL);
    *((void *)v5 + 18) = v194;
    if (v268 > 1)
    {
      v195 = (void *)*((void *)v5 + 17);
      uint64_t v196 = v263;
      v197 = v289;
      do
      {
        uint64_t v198 = *v54++;
        *v195++ = v198;
        uint64_t v199 = *(void *)v197++;
        *v194++ = v199;
        --v196;
      }
      while (v196);
    }
  }
  else
  {
    *((void *)v5 + 17) = 0;
    *((void *)v5 + 18) = 0;
  }
  v200 = (int *)malloc_type_malloc(4 * v34, 0x100004052888210uLL);
  v201 = malloc_type_malloc(4 * v34, 0x100004052888210uLL);
  *((void *)v5 + 21) = v201;
  if ((int)v33 < 1)
  {
    int v203 = 0;
  }
  else
  {
    uint64_t v202 = 0;
    int v203 = 0;
    v204 = v301;
    v205 = v302;
    do
    {
      uint64_t v206 = v204->u32[v202];
      if ((int)v206 < 1)
      {
        int v207 = 0;
      }
      else
      {
        int v207 = 0;
        v208 = &v279[v205[v202]];
        do
        {
          int v209 = *v208++;
          v203 += v209;
          v207 += v209;
          --v206;
        }
        while (v206);
      }
      v201[v202] = v207;
      v200[v202++] = v207;
    }
    while (v202 != v33);
  }
  info("Total nSV = %d\n", v203);
  *((_DWORD *)v5 + 27) = v203;
  size_t v210 = 8 * v203;
  *((void *)v5 + 14) = malloc_type_malloc(v210, 0x2004093837F09uLL);
  v211 = malloc_type_malloc(4 * v203, 0x100004052888210uLL);
  v212 = (unsigned __int8 *)v279;
  *((void *)v5 + 19) = v211;
  if ((int)v265 >= 1)
  {
    int v213 = 0;
    uint64_t v214 = size;
    v215 = v36;
    v216 = v267;
    do
    {
      if (*v212++)
      {
        *(void *)(*((void *)v5 + 14) + 8 * v213) = *v215;
        *(_DWORD *)(*((void *)v5 + 19) + 4 * v213++) = *v216 + 1;
      }
      ++v216;
      ++v215;
      --v214;
    }
    while (v214);
  }
  v218 = malloc_type_malloc(v185, 0x100004052888210uLL);
  v219 = (char *)v218;
  _DWORD *v218 = 0;
  if ((int)v33 <= 1)
  {
    *((void *)v5 + 15) = malloc_type_malloc(8 * (int)v266, 0x80040B8603338uLL);
    v226 = v5 + 120;
  }
  else
  {
    int v220 = 0;
    v221 = v218 + 1;
    uint64_t v222 = v33 - 1;
    v223 = v200;
    do
    {
      int v224 = *v223++;
      v220 += v224;
      *v221++ = v220;
      --v222;
    }
    while (v222);
    uint64_t v225 = 0;
    *((void *)v5 + 15) = malloc_type_malloc(8 * (int)v266, 0x80040B8603338uLL);
    v226 = v5 + 120;
    do
    {
      *(void *)(*v226 + v225) = malloc_type_malloc(v210, 0x100004000313F17uLL);
      v225 += 8;
    }
    while (8 * v266 != v225);
    uint64_t v33 = v274;
  }
  v228 = v301;
  v227 = v302;
  if ((int)v33 >= 1)
  {
    uint64_t v229 = 0;
    LODWORD(v230) = 0;
    uint64_t v231 = 1;
    do
    {
      uint64_t v232 = v229 + 1;
      if (v229 + 1 < v270)
      {
        uint64_t v233 = v228->u32[v229];
        int v234 = *(_DWORD *)&v219[4 * v229];
        uint64_t v230 = (int)v230;
        v235 = &v279[v227[v229]];
        uint64_t v236 = v231;
        do
        {
          uint64_t v237 = v227[v236];
          uint64_t v238 = v228->u32[v236];
          if ((int)v233 >= 1)
          {
            uint64_t v239 = 0;
            int v240 = v234;
            do
            {
              if (v235[v239]) {
                *(void *)(*(void *)(*v226 + 8 * (v236 - 1)) + 8 * v240++) = *(void *)(v280[2 * v230] + 8 * v239);
              }
              ++v239;
            }
            while (v233 != v239);
          }
          if ((int)v238 >= 1)
          {
            int v241 = *(_DWORD *)&v219[4 * v236];
            v242 = &v279[v237];
            uint64_t v243 = 8 * (int)v233;
            do
            {
              if (*v242++) {
                *(void *)(*(void *)(*v226 + 8 * v229) + 8 * v241++) = *(void *)(v280[2 * v230] + v243);
              }
              v243 += 8;
              --v238;
            }
            while (v238);
          }
          ++v230;
          ++v236;
        }
        while (v236 != v33);
      }
      ++v231;
      ++v229;
    }
    while (v232 != v33);
  }
  free(v303);
  free(v291);
  free(v289);
  free(v228);
  free(v267);
  free(v227);
  free(v36);
  free(v275);
  free(v279);
  if (v268 > 1)
  {
    uint64_t v245 = v263;
    v246 = (void **)v280;
    do
    {
      v247 = *v246;
      v246 += 2;
      free(v247);
      --v245;
    }
    while (v245);
  }
  free(v280);
  free(v200);
LABEL_232:
  free(v219);
  return v5;
}

char *svm_train_one(int *a1, _DWORD *a2)
{
  int v4 = (char *)malloc_type_malloc(8 * *a1, 0x100004000313F17uLL);
  switch(*a2)
  {
    case 0:
      operator new[]();
    case 1:
      operator new[]();
    case 2:
      operator new[]();
    case 3:
      operator new[]();
    case 4:
      operator new[]();
    default:
      info("obuint64_t j = %f, rho = %f\n", v13, v14);
      uint64_t v5 = *a1;
      if ((int)v5 >= 1)
      {
        uint64_t v6 = 0;
        int v7 = 0;
        int v8 = 0;
        uint64_t v9 = 8 * v5;
        while (1)
        {
          double v10 = *(double *)&v4[v6];
          if (v10 != 0.0)
          {
            double v11 = fabs(v10);
            ++v8;
            if (*(double *)(*((void *)a1 + 1) + v6) > 0.0)
            {
              if (v11 < v15) {
                goto LABEL_15;
              }
LABEL_14:
              ++v7;
              goto LABEL_15;
            }
            if (v11 >= v16) {
              goto LABEL_14;
            }
          }
LABEL_15:
          v6 += 8;
          if (v9 == v6) {
            goto LABEL_18;
          }
        }
      }
      int v8 = 0;
      int v7 = 0;
LABEL_18:
      info("nSV = %d, nBSV = %d\n", v8, v7);
      return v4;
  }
}

void sub_21431489C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  CPMLLibSVM::SVC_Q::~SVC_Q((CPMLLibSVM::SVC_Q *)va);
  _Unwind_Resume(a1);
}

void svm_group_classes(int *a1, int *a2, void *a3, void *a4, int32x2_t **a5, uint64_t a6)
{
  uint64_t v10 = *a1;
  uint64_t v11 = *a1;
  double v12 = malloc_type_malloc(0x40uLL, 0x100004052888210uLL);
  double v13 = (int32x2_t *)malloc_type_malloc(0x40uLL, 0x100004052888210uLL);
  double v14 = (int *)malloc_type_malloc(4 * v10, 0x100004052888210uLL);
  if ((int)v10 < 1)
  {
    int v16 = 0;
  }
  else
  {
    uint64_t v34 = a3;
    qos_class_t v35 = a4;
    double v36 = a5;
    uint64_t v15 = 0;
    int v16 = 0;
    int v17 = 16;
    do
    {
      int v18 = (int)*(double *)(*((void *)a1 + 1) + 8 * v15);
      if (v16 < 1)
      {
        LODWORD(v19) = 0;
      }
      else
      {
        uint64_t v19 = 0;
        while (v12[v19] != v18)
        {
          if (v16 == ++v19)
          {
            v14[v15] = v16;
            goto LABEL_11;
          }
        }
        ++v13->i32[v19];
      }
      v14[v15] = v19;
      if (v19 == v16)
      {
LABEL_11:
        if (v16 == v17)
        {
          int v17 = 2 * v16;
          double v12 = malloc_type_realloc(v12, 8 * v16, 0x100004052888210uLL);
          double v13 = (int32x2_t *)malloc_type_realloc(v13, 8 * v16, 0x100004052888210uLL);
        }
        v12[v16] = v18;
        v13->i32[v16++] = 1;
      }
      ++v15;
    }
    while (v15 != v11);
    if (v16 == 2)
    {
      if (*v12 == -1 && v12[1] == 1)
      {
        *(void *)double v12 = 0xFFFFFFFF00000001;
        *double v13 = vrev64_s32(*v13);
        uint64_t v20 = v11;
        double v21 = v14;
        do
        {
          *double v21 = *v21 == 0;
          ++v21;
          --v20;
        }
        while (v20);
      }
      else
      {
        int v16 = 2;
      }
    }
    a4 = v35;
    a5 = v36;
    a3 = v34;
  }
  double v22 = malloc_type_malloc(4 * v16, 0x100004052888210uLL);
  *double v22 = 0;
  if (v16 > 1)
  {
    int v23 = 0;
    double v24 = v22 + 1;
    uint64_t v25 = v16 - 1;
    uint64_t v26 = v13;
    do
    {
      __int32 v27 = v26->i32[0];
      uint64_t v26 = (int32x2_t *)((char *)v26 + 4);
      v23 += v27;
      *v24++ = v23;
      --v25;
    }
    while (v25);
  }
  if ((int)v11 >= 1)
  {
    for (uint64_t i = 0; i != v11; ++i)
      *(_DWORD *)(a6 + 4 * (int)v22[v14[i]]++) = i;
  }
  *double v22 = 0;
  if (v16 > 1)
  {
    int v29 = 0;
    BOOL v30 = v22 + 1;
    uint64_t v31 = v16 - 1;
    size_t v32 = v13;
    do
    {
      __int32 v33 = v32->i32[0];
      size_t v32 = (int32x2_t *)((char *)v32 + 4);
      v29 += v33;
      *v30++ = v29;
      --v31;
    }
    while (v31);
  }
  *a2 = v16;
  *a3 = v12;
  *a4 = v22;
  *a5 = v13;

  free(v14);
}

void svm_cross_validation(int *a1, _DWORD *a2, int a3, uint64_t a4)
{
  uint64_t v8 = *a1;
  uint64_t v9 = (int *)malloc_type_malloc(4 * (int)v8, 0x100004052888210uLL);
  if ((int)v8 < a3)
  {
    fwrite("WARNING: # folds > # data. Will use # folds = # data instead (i.e., leave-one-out cross validation)\n", 0x64uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    a3 = v8;
  }
  uint64_t v10 = (a3 + 1);
  uint64_t v11 = (int *)malloc_type_malloc(4 * (int)v10, 0x100004052888210uLL);
  BOOL v12 = a3 >= (int)v8 || *a2 >= 2u;
  double v93 = a2;
  uint64_t v94 = a4;
  int v95 = v8;
  if (!v12)
  {
    unsigned int v103 = 0;
    BOOL v98 = 0;
    long long v101 = 0;
    int v102 = 0;
    svm_group_classes(a1, (int *)&v103, &v102, &v98, (int32x2_t **)&v101, (uint64_t)v9);
    uint64_t v90 = (int *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
    uint64_t v20 = malloc_type_malloc(4 * (int)v8, 0x100004052888210uLL);
    double v21 = v20;
    if ((int)v8 >= 1)
    {
      uint64_t v22 = v8;
      int v23 = v9;
      double v24 = v20;
      do
      {
        int v25 = *v23++;
        *v24++ = v25;
        --v22;
      }
      while (v22);
    }
    uint64_t v26 = v103;
    if ((int)v103 >= 1)
    {
      uint64_t v27 = 0;
      double v28 = v101;
      int v29 = v98;
      for (i = v103; i != v27; uint64_t v26 = i)
      {
        if ((int)v28[v27] >= 1)
        {
          int v30 = 0;
          int v31 = 0;
          do
          {
            int v32 = rand();
            int v33 = v31 + v29[v27];
            int v34 = v33 + v32 % (v30 + v28[v27]);
            int v35 = v21[v34];
            v21[v34] = v21[v33];
            v21[v33] = v35;
            ++v31;
            --v30;
          }
          while (v31 < v28[v27]);
        }
        ++v27;
      }
    }
    if (a3 <= 0)
    {
      *uint64_t v11 = 0;
      char v50 = 1;
      LODWORD(v8) = v95;
      int v39 = v90;
      uint64_t v38 = (a3 + 1);
    }
    else
    {
      uint64_t v36 = 0;
      size_t v37 = (int *)v101;
      int v39 = v90;
      uint64_t v38 = (a3 + 1);
      do
      {
        v90[v36] = 0;
        uint64_t v40 = v36 + 1;
        if ((int)v26 >= 1)
        {
          int v41 = 0;
          uint64_t v42 = v26;
          uint64_t v43 = v37;
          do
          {
            int v44 = *v43++;
            v41 += v44 * (int)v40 / a3 - v44 * (int)v36 / a3;
            v90[v36] = v41;
            --v42;
          }
          while (v42);
        }
        ++v36;
      }
      while (v40 != a3);
      *uint64_t v11 = 0;
      int v45 = 0;
      uint64_t v46 = v11 + 1;
      uint64_t v47 = (a3 + 1) - 1;
      int8x16_t v48 = v90;
      do
      {
        int v49 = *v48++;
        v45 += v49;
        *v46++ = v45;
        --v47;
      }
      while (v47);
      char v50 = 0;
      LODWORD(v8) = v95;
    }
    if ((int)v26 >= 1)
    {
      uint64_t v51 = 0;
      float64x2_t v52 = v98;
      size_t v53 = v101;
      do
      {
        if (a3 >= 1)
        {
          uint64_t v54 = 0;
          do
          {
            int v55 = v53[v51];
            int v56 = v55 * (int)v54 / a3;
            uint64_t v57 = v54 + 1;
            int v58 = v55 * ((int)v54 + 1) / a3;
            if (v56 < v58)
            {
              int v59 = v52[v51];
              uint64_t v60 = v56 + v59;
              uint64_t v61 = v58 + v59;
              int v62 = v11[v54];
              do
              {
                v9[v62] = v21[v60];
                int v62 = v11[v54] + 1;
                v11[v54] = v62;
                ++v60;
              }
              while (v60 < v61);
            }
            ++v54;
          }
          while (v57 != a3);
        }
        ++v51;
      }
      while (v51 != v26);
    }
    *uint64_t v11 = 0;
    if ((v50 & 1) == 0)
    {
      int v63 = 0;
      uint64_t v64 = v11 + 1;
      uint64_t v65 = v38 - 1;
      uint64_t v66 = v39;
      do
      {
        int v67 = *v66++;
        v63 += v67;
        *v64++ = v63;
        --v65;
      }
      while (v65);
    }
    free(v98);
    free(v102);
    free(v101);
    free(v21);
    free(v39);
    goto LABEL_49;
  }
  if ((int)v8 >= 1)
  {
    for (uint64_t j = 0; j != v8; ++j)
      v9[j] = j;
    uint64_t v14 = 0;
    uint64_t v15 = v8;
    do
    {
      uint64_t v16 = v14 + rand() % (int)v15;
      int v17 = v9[v14];
      v9[v14] = v9[v16];
      v9[v16] = v17;
      ++v14;
      --v15;
    }
    while (v15);
  }
  if ((a3 & 0x80000000) == 0)
  {
    int v18 = 0;
    uint64_t v19 = v11;
    do
    {
      *v19++ = v18 / a3;
      v18 += v8;
      --v10;
    }
    while (v10);
LABEL_49:
    if (a3 >= 1)
    {
      uint64_t v68 = 0;
      uint64_t v91 = (int)v8;
      uint64_t v92 = a3;
      do
      {
        uint64_t v69 = v11[v68];
        uint64_t v70 = v68 + 1;
        uint64_t v71 = v11[v70];
        LODWORD(v98) = v69 - v71 + v8;
        long long v100 = malloc_type_malloc(8 * (int)v98, 0x2004093837F09uLL);
        long long v99 = malloc_type_malloc(8 * (int)v98, 0x100004000313F17uLL);
        uint64_t v97 = v70;
        if ((int)v69 < 1)
        {
          unsigned int v74 = 0;
        }
        else
        {
          for (uint64_t k = 0; k != v69; ++k)
          {
            uint64_t v73 = v9[k];
            *((void *)v100 + k) = *(void *)(*((void *)a1 + 2) + 8 * v73);
            *((void *)v99 + k) = *(void *)(*((void *)a1 + 1) + 8 * v73);
          }
          unsigned int v74 = v69;
        }
        if ((int)v71 < (int)v8)
        {
          uint64_t v75 = v91 - v71;
          uint64_t v76 = 8 * v74;
          uint64_t v77 = &v9[v71];
          do
          {
            uint64_t v78 = *v77++;
            *(void *)((char *)v100 + v76) = *(void *)(*((void *)a1 + 2) + 8 * v78);
            *(void *)((char *)v99 + v76) = *(void *)(*((void *)a1 + 1) + 8 * v78);
            v76 += 8;
            --v75;
          }
          while (v75);
        }
        uint64_t v79 = svm_train(&v98, v93);
        int v80 = (void *)v79;
        if (v93[25] && *v93 <= 1u)
        {
          uint64_t v81 = malloc_type_malloc(8 * *(int *)(v79 + 104), 0x100004000313F17uLL);
          if ((int)v69 < (int)v71)
          {
            int v82 = &v9[(int)v69];
            int v83 = v71 - v69;
            do
            {
              double v84 = svm_predict_probability((uint64_t)v80, *(void *)(*((void *)a1 + 2) + 8 * *v82), (uint64_t)v81);
              uint64_t v85 = *v82++;
              *(double *)(v94 + 8 * v85) = v84;
              --v83;
            }
            while (v83);
          }
          free(v81);
        }
        else if ((int)v69 < (int)v71)
        {
          uint64_t v86 = &v9[(int)v69];
          int v87 = v71 - v69;
          do
          {
            svm_predict((uint64_t)v80, *(void *)(*((void *)a1 + 2) + 8 * *v86));
            uint64_t v88 = *v86++;
            *(void *)(v94 + 8 * v88) = v89;
            --v87;
          }
          while (v87);
        }
        if (v80)
        {
          svm_free_model_content((uint64_t)v80);
          free(v80);
        }
        free(v100);
        free(v99);
        LODWORD(v8) = v95;
        uint64_t v68 = v97;
      }
      while (v97 != v92);
    }
  }
  free(v11);
  free(v9);
}

uint64_t svm_get_nr_class(uint64_t a1)
{
  return *(unsigned int *)(a1 + 104);
}

double svm_predict_probability(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = (void *)a1;
  if (*(_DWORD *)a1 <= 1u && *(void *)(a1 + 136) && *(void *)(a1 + 144))
  {
    uint64_t v6 = *(int *)(a1 + 104);
    int v7 = (double *)malloc_type_malloc(8 * (((int)v6 - 1) * (int)v6 / 2), 0x100004000313F17uLL);
    uint64_t v8 = (double *)a2;
    uint64_t v9 = v6;
    uint64_t v78 = v7;
    svm_predict_values((uint64_t)v4, v8, v7);
    uint64_t size = 8 * v6;
    uint64_t v10 = (void **)malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
    uint64_t v11 = v10;
    uint64_t v12 = v6;
    uint64_t v79 = v10;
    uint64_t v83 = v6;
    if ((int)v6 >= 1)
    {
      uint64_t v6 = v6;
      double v13 = v10;
      do
      {
        *v13++ = malloc_type_malloc(size, 0x100004000313F17uLL);
        --v6;
      }
      while (v6);
      int v14 = 0;
      uint64_t v15 = v11 + 1;
      uint64_t v16 = v12 - 1;
      uint64_t v17 = 8;
      uint64_t v76 = v9;
      uint64_t v77 = v4;
      do
      {
        uint64_t v18 = v6 + 1;
        if (v6 + 1 < v9)
        {
          uint64_t v19 = v11;
          uint64_t v20 = 0;
          uint64_t v21 = v4[17];
          uint64_t v22 = v4[18];
          int v23 = &v78[v14];
          uint64_t v24 = v21 + 8 * v14;
          int v80 = v14;
          uint64_t v25 = v22 + 8 * v14;
          uint64_t v26 = (uint64_t)v19[v6] + v17;
          do
          {
            double v27 = *(double *)(v25 + 8 * v20) + v23[v20] * *(double *)(v24 + 8 * v20);
            if (v27 >= 0.0)
            {
              double v28 = exp(-v27);
              double v29 = v28;
            }
            else
            {
              double v28 = exp(v27);
              double v29 = 1.0;
            }
            double v30 = fmin(fmax(v29 / (v28 + 1.0), 0.0000001), 0.9999999);
            *(double *)(v26 + 8 * v20) = v30;
            *((double *)v15[v20++] + v6) = 1.0 - v30;
          }
          while (v16 != v20);
          int v14 = v80 + v20;
          uint64_t v9 = v76;
          int v4 = v77;
          uint64_t v11 = v79;
          uint64_t v18 = v6 + 1;
          uint64_t v12 = v83;
        }
        ++v15;
        v17 += 8;
        --v16;
        uint64_t v6 = v18;
      }
      while (v18 != v12);
    }
    if ((int)v9 <= 100) {
      int v31 = 100;
    }
    else {
      int v31 = v9;
    }
    int v32 = (void **)malloc_type_malloc(size, 0x80040B8603338uLL);
    int v33 = malloc_type_malloc(size, 0x100004000313F17uLL);
    double v34 = (double)(int)v12;
    if ((int)v12 <= 0)
    {
      uint64_t v50 = v9;
    }
    else
    {
      int v81 = v31;
      uint64_t v35 = 0;
      uint64_t v36 = (uint64_t *)(v11 + 1);
      uint64_t v37 = 1;
      uint64_t v38 = 1;
      do
      {
        *(double *)(a3 + 8 * v35) = 1.0 / v34;
        int v39 = malloc_type_malloc(size, 0x100004000313F17uLL);
        v32[v35] = v39;
        v39[v35] = 0;
        if (v35)
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            double v41 = *((double *)v11[i] + v35);
            *(double *)&v39[v35] = *(double *)&v39[v35] + v41 * v41;
            v39[i] = *((void *)v32[i] + v35);
          }
        }
        uint64_t v42 = v35 + 1;
        if (v35 + 1 < v9)
        {
          uint64_t v43 = (double *)&v39[v38];
          int v44 = (double *)((char *)v11[v35] + v38 * 8);
          int v45 = v36;
          uint64_t v46 = v83;
          do
          {
            uint64_t v47 = *v45++;
            *(double *)&v39[v35] = *(double *)&v39[v35] + *(double *)(v47 + 8 * v35) * *(double *)(v47 + 8 * v35);
            double v48 = *(double *)(v47 + 8 * v35);
            double v49 = *v44++;
            *v43++ = -(v48 * v49);
            --v46;
          }
          while (v37 != v46);
        }
        ++v37;
        ++v38;
        ++v36;
        ++v35;
      }
      while (v42 != v83);
      LODWORD(v12) = v83;
      uint64_t v50 = v83;
      int v31 = v81;
    }
    int v52 = 0;
    double v53 = 0.005 / v34;
    do
    {
      if ((int)v12 < 1)
      {
        if (v53 > 0.0) {
          goto LABEL_55;
        }
      }
      else
      {
        uint64_t v54 = 0;
        double v55 = 0.0;
        do
        {
          uint64_t v56 = 0;
          v33[v54] = 0;
          uint64_t v57 = (double *)v32[v54];
          double v58 = 0.0;
          do
          {
            double v58 = v58 + v57[v56] * *(double *)(a3 + 8 * v56);
            *(double *)&v33[v54] = v58;
            ++v56;
          }
          while (v50 != v56);
          double v55 = v55 + *(double *)(a3 + 8 * v54++) * v58;
        }
        while (v54 != v50);
        uint64_t v59 = 0;
        double v60 = 0.0;
        do
        {
          double v61 = vabdd_f64(*(double *)&v33[v59], v55);
          if (v61 > v60) {
            double v60 = v61;
          }
          ++v59;
        }
        while (v50 != v59);
        if (v60 < v53) {
          goto LABEL_52;
        }
        uint64_t v62 = 0;
        do
        {
          uint64_t v63 = 0;
          uint64_t v64 = (double *)v32[v62];
          double v65 = (v55 - *(double *)&v33[v62]) / v64[v62];
          *(double *)(a3 + 8 * v62) = *(double *)(a3 + 8 * v62) + v65;
          double v66 = *(double *)&v33[v62] + *(double *)&v33[v62] + v65 * v64[v62];
          double v67 = v65 + 1.0;
          do
          {
            *(double *)&v33[v63] = (*(double *)&v33[v63] + v65 * v64[v63]) / v67;
            *(double *)(a3 + 8 * v63) = *(double *)(a3 + 8 * v63) / v67;
            ++v63;
          }
          while (v50 != v63);
          double v55 = (v55 + v65 * v66) / v67 / v67;
          ++v62;
        }
        while (v62 != v50);
      }
      ++v52;
    }
    while (v52 != v31);
    info("Exceeds max_iter in multiclass_prob\n", 1.0);
LABEL_52:
    if ((int)v12 >= 1)
    {
      uint64_t v68 = v32;
      uint64_t v69 = v50;
      do
      {
        uint64_t v70 = *v68++;
        free(v70);
        --v69;
      }
      while (v69);
    }
LABEL_55:
    free(v32);
    free(v33);
    if ((int)v12 <= 1)
    {
      uint64_t v73 = 0;
    }
    else
    {
      int v71 = 0;
      uint64_t v72 = 1;
      do
      {
        if (*(double *)(a3 + 8 * v72) > *(double *)(a3 + 8 * v71)) {
          int v71 = v72;
        }
        ++v72;
      }
      while (v50 != v72);
      uint64_t v73 = v71;
    }
    if ((int)v9 >= 1)
    {
      unsigned int v74 = v79;
      do
      {
        uint64_t v75 = *v74++;
        free(v75);
        --v50;
      }
      while (v50);
    }
    free(v78);
    free(v79);
    return (double)*(int *)(v4[20] + 4 * v73);
  }
  else
  {
    svm_predict(a1, a2);
  }
  return result;
}

void svm_predict(uint64_t a1, uint64_t a2)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = MEMORY[0x270FA5388](a1, a2);
  svm_predict_values(v2, v4, (double *)((char *)v5 - v3));
}

void svm_free_and_destroy_model(void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      svm_free_model_content((uint64_t)v2);
      free(*a1);
      *a1 = 0;
    }
  }
}

uint64_t svm_get_svm_type(unsigned int *a1)
{
  return *a1;
}

uint64_t svm_get_labels(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 160);
  if (v2 && *(int *)(result + 104) >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      *(_DWORD *)(a2 + 4 * v3) = *(_DWORD *)(v2 + 4 * v3);
      ++v3;
    }
    while (v3 < *(int *)(result + 104));
  }
  return result;
}

uint64_t svm_get_sv_indices(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 152);
  if (v2 && *(int *)(result + 108) >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      *(_DWORD *)(a2 + 4 * v3) = *(_DWORD *)(v2 + 4 * v3);
      ++v3;
    }
    while (v3 < *(int *)(result + 108));
  }
  return result;
}

uint64_t svm_get_nr_sv(uint64_t a1)
{
  return *(unsigned int *)(a1 + 108);
}

double svm_get_svr_probability(uint64_t a1)
{
  if ((*(_DWORD *)a1 - 3) <= 1)
  {
    uint64_t v1 = *(void *)(a1 + 136);
    if (v1) {
      return *(double *)v1;
    }
  }
  fwrite("Model doesn't contain information for SVR probability inference\n", 0x40uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  return 0.0;
}

void svm_predict_values(uint64_t a1, double *a2, double *a3)
{
  double v65 = a3;
  if ((*(_DWORD *)a1 - 2) > 2)
  {
    uint64_t v13 = *(int *)(a1 + 104);
    uint64_t v12 = *(int *)(a1 + 108);
    uint64_t v14 = *(unsigned int *)(a1 + 104);
    uint64_t v15 = (double *)malloc_type_malloc(8 * v12, 0x100004000313F17uLL);
    uint64_t v21 = v15;
    if (*(_DWORD *)(a1 + 4) == 2)
    {
      CPMLLibSVM::Kernel::k_function_rbf((uint64_t)a2, a1, (uint64_t)v15, v16, v17, v18, v19, v20, v57, v59, v61, v63, (uint64_t)v65, v66, v68, v70, v72, (uint64_t)v74, v76,
        v77,
        v78,
        __N,
        v82,
        *(uint64_t *)&v83,
        __C[0],
        (uint64_t *)__C[1],
        __C[2],
        __C[3],
        __C[4],
        (uint64_t *)__C[5],
        __C[6],
        __C[7]);
    }
    else
    {
      uint64_t v12 = v12;
      if ((int)v12 >= 1)
      {
        uint64_t v22 = *(double ***)(a1 + 112);
        int v23 = v15;
        do
        {
          uint64_t v24 = *v22++;
          *v23++ = CPMLLibSVM::Kernel::k_function(a2, v24, a1);
          --v12;
        }
        while (v12);
      }
    }
    uint64_t v25 = malloc_type_malloc(4 * v13, 0x100004052888210uLL);
    uint64_t v26 = (char *)v25;
    _DWORD *v25 = 0;
    if ((int)v13 > 1)
    {
      int v27 = 0;
      double v28 = *(int **)(a1 + 168);
      double v29 = v25 + 1;
      uint64_t v30 = v14 - 1;
      do
      {
        int v31 = *v28++;
        v27 += v31;
        *v29++ = v27;
        --v30;
      }
      while (v30);
    }
    int v32 = malloc_type_malloc(4 * v13, 0x100004052888210uLL);
    int v33 = v32;
    if ((int)v14 >= 1)
    {
      int v58 = v14;
      uint64_t v75 = v21;
      uint64_t v34 = v13;
      bzero(v32, 4 * v13);
      uint64_t v35 = 0;
      int v36 = 0;
      uint64_t v37 = v26 + 4;
      uint64_t v60 = -(uint64_t)v13;
      uint64_t v62 = v13;
      uint64_t v38 = 1;
      uint64_t v39 = 4;
      uint64_t v40 = 0;
      uint64_t v64 = v13;
      int v71 = v33;
      uint64_t v73 = v26;
      do
      {
        uint64_t v41 = v40 + 1;
        if (v40 + 1 < v13)
        {
          uint64_t v67 = v40 + 1;
          int v69 = v36;
          uint64_t v42 = 0;
          uint64_t v79 = v36;
          do
          {
            uint64_t v43 = *(int *)&v26[4 * v40];
            uint64_t v44 = *(int *)&v37[4 * v42];
            uint64_t v45 = *(void *)(a1 + 168);
            vDSP_Length v46 = *(int *)(v45 + 4 * v40);
            vDSP_Length __Na = *(int *)(v45 + v39 + 4 * v42);
            uint64_t v47 = *(void *)(a1 + 120);
            uint64_t v48 = *(void *)(v47 + v35 + 8 * v42);
            uint64_t v49 = *(void *)(v47 + 8 * v40);
            double v83 = 0.0;
            __C[0] = 0;
            uint64_t v50 = v37;
            uint64_t v51 = v40;
            vDSP_dotprD((const double *)(v48 + 8 * v43), 1, &v75[v43], 1, (double *)__C, v46);
            int v52 = (const double *)(v49 + 8 * v44);
            int v33 = v71;
            uint64_t v26 = v73;
            vDSP_dotprD(v52, 1, &v75[v44], 1, &v83, __Na);
            uint64_t v40 = v51;
            uint64_t v37 = v50;
            *(double *)__C = v83 + *(double *)__C;
            double v53 = *(double *)__C - *(double *)(*(void *)(a1 + 128) + v79 * 8 + 8 * v42);
            v65[v79 + v42] = v53;
            uint64_t v54 = v38 + v42;
            if (v53 > 0.0) {
              uint64_t v54 = v51;
            }
            ++v71[v54];
            ++v42;
          }
          while (v60 + v38 + v42);
          uint64_t v41 = v67;
          int v36 = v69 + v42;
          uint64_t v34 = v62;
          uint64_t v13 = v64;
        }
        ++v38;
        v39 += 4;
        v37 += 4;
        v35 += 8;
        uint64_t v40 = v41;
      }
      while (v41 != v34);
      uint64_t v21 = (double *)v75;
      if (v58 >= 2)
      {
        int v55 = 0;
        uint64_t v56 = 1;
        do
        {
          if (v33[v56] > v33[v55]) {
            int v55 = v56;
          }
          ++v56;
        }
        while (v34 != v56);
      }
    }
    free(v21);
    free(v26);
    free(v33);
  }
  else
  {
    uint64_t v5 = *(unsigned int *)(a1 + 108);
    if ((int)v5 < 1)
    {
      double v8 = 0.0;
    }
    else
    {
      uint64_t v6 = *(double ***)(a1 + 112);
      int v7 = **(double ***)(a1 + 120);
      double v8 = 0.0;
      do
      {
        double v9 = *v7++;
        double v10 = v9;
        uint64_t v11 = *v6++;
        double v8 = v8 + v10 * CPMLLibSVM::Kernel::k_function(a2, v11, a1);
        --v5;
      }
      while (v5);
    }
    *double v65 = v8 - **(double **)(a1 + 128);
  }
}

uint64_t svm_save_model(const char *a1, double *a2)
{
  uint64_t v3 = fopen(a1, "w");
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  int v4 = v3;
  uint64_t v5 = setlocale(0, 0);
  double v28 = strdup(v5);
  setlocale(0, "C");
  fprintf(v4, "svm_type %s\n", svm_type_table[*(int *)a2]);
  fprintf(v4, "kernel_type %s\n", kernel_type_table[*((int *)a2 + 1)]);
  int v6 = *((_DWORD *)a2 + 1);
  if (v6 == 1)
  {
    fprintf(v4, "degree %d\n", *((_DWORD *)a2 + 2));
    int v6 = *((_DWORD *)a2 + 1);
  }
  if ((v6 - 1) <= 2)
  {
    fprintf(v4, "gamma %g\n", a2[2]);
    int v6 = *((_DWORD *)a2 + 1);
  }
  if ((v6 | 2) == 3) {
    fprintf(v4, "coef0 %g\n", a2[3]);
  }
  uint64_t v8 = *((unsigned int *)a2 + 26);
  uint64_t v7 = *((unsigned int *)a2 + 27);
  fprintf(v4, "nr_class %d\n", *((_DWORD *)a2 + 26));
  uint64_t v29 = v7;
  fprintf(v4, "total_sv %d\n", v7);
  fwrite("rho", 3uLL, 1uLL, v4);
  int v9 = (v8 - 1) * v8;
  if (v9 >= 0) {
    int v10 = (v8 - 1) * v8;
  }
  else {
    int v10 = v9 + 1;
  }
  uint64_t v11 = (v10 >> 1);
  if (v9 >= 2)
  {
    uint64_t v12 = 0;
    do
      fprintf(v4, " %g", *(double *)(*((void *)a2 + 16) + 8 * v12++));
    while (v11 != v12);
  }
  fputc(10, v4);
  if (*((void *)a2 + 20))
  {
    fwrite("label", 5uLL, 1uLL, v4);
    if ((int)v8 >= 1)
    {
      uint64_t v13 = 0;
      do
      {
        fprintf(v4, " %d", *(_DWORD *)(*((void *)a2 + 20) + v13));
        v13 += 4;
      }
      while (4 * v8 != v13);
    }
    fputc(10, v4);
  }
  if (*((void *)a2 + 17))
  {
    fwrite("probA", 5uLL, 1uLL, v4);
    if (v9 >= 2)
    {
      uint64_t v14 = 0;
      do
        fprintf(v4, " %g", *(double *)(*((void *)a2 + 17) + 8 * v14++));
      while (v11 != v14);
    }
    fputc(10, v4);
  }
  if (*((void *)a2 + 18))
  {
    fwrite("probB", 5uLL, 1uLL, v4);
    if (v9 >= 2)
    {
      uint64_t v15 = 0;
      do
        fprintf(v4, " %g", *(double *)(*((void *)a2 + 18) + 8 * v15++));
      while (v11 != v15);
    }
    fputc(10, v4);
  }
  if (*((void *)a2 + 21))
  {
    fwrite("nr_sv", 5uLL, 1uLL, v4);
    if ((int)v8 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        fprintf(v4, " %d", *(_DWORD *)(*((void *)a2 + 21) + v16));
        v16 += 4;
      }
      while (4 * v8 != v16);
    }
    fputc(10, v4);
  }
  fwrite("SV\n", 3uLL, 1uLL, v4);
  if ((int)v29 >= 1)
  {
    uint64_t v17 = 0;
    uint64_t v18 = *((void *)a2 + 14);
    uint64_t v19 = (uint64_t *)*((void *)a2 + 15);
    do
    {
      uint64_t v20 = (v8 - 1);
      uint64_t v21 = v19;
      if ((int)v8 >= 2)
      {
        do
        {
          uint64_t v22 = *v21++;
          fprintf(v4, "%.16g ", *(double *)(v22 + 8 * v17));
          --v20;
        }
        while (v20);
      }
      int v23 = *(double **)(v18 + 8 * v17);
      if (*((_DWORD *)a2 + 1) == 4)
      {
        fprintf(v4, "0:%d ", (int)v23[1]);
      }
      else
      {
        int v24 = *(_DWORD *)v23;
        if (*(_DWORD *)v23 != -1)
        {
          uint64_t v25 = v23 + 2;
          do
          {
            fprintf(v4, "%d:%.8g ", v24, *(v25 - 1));
            int v26 = *(_DWORD *)v25;
            v25 += 2;
            int v24 = v26;
          }
          while (v26 != -1);
        }
      }
      fputc(10, v4);
      ++v17;
    }
    while (v17 != v29);
  }
  setlocale(0, v28);
  free(v28);
  if (ferror(v4)) {
    return 0xFFFFFFFFLL;
  }
  if (fclose(v4)) {
    return 0xFFFFFFFFLL;
  }
  return 0;
}

_DWORD *svm_load_model(const char *a1)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  uint64_t v1 = fopen(a1, "rb");
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = setlocale(0, 0);
  int v4 = strdup(v3);
  setlocale(0, "C");
  uint64_t v5 = malloc_type_malloc(0xB8uLL, 0x109004003BC950CuLL);
  *((_OWORD *)v5 + 8) = 0u;
  int v6 = (void **)(v5 + 32);
  *((_OWORD *)v5 + 9) = 0u;
  *((_OWORD *)v5 + 10) = 0u;
  if (fscanf(v2, "%80s", __s2) != 1)
  {
LABEL_94:
    fwrite("ERROR: fscanf failed to read model\n", 0x23uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    setlocale(0, v4);
    free(v4);
    free(*((void **)v5 + 16));
    free(*((void **)v5 + 20));
    free(*((void **)v5 + 21));
    free(v5);
    return 0;
  }
  while (1)
  {
    if (!(*(void *)__s2 ^ 0x657079745F6D7673 | v68))
    {
      if (fscanf(v2, "%80s", __s2) == 1)
      {
        for (uint64_t i = 0; i != 5; ++i)
        {
          if (!strcmp(svm_type_table[i], __s2))
          {
            *uint64_t v5 = i;
            goto LABEL_60;
          }
        }
        int v36 = (FILE *)*MEMORY[0x263EF8348];
        uint64_t v37 = "unknown svm type.\n";
        size_t v38 = 18;
LABEL_93:
        fwrite(v37, v38, 1uLL, v36);
      }
      goto LABEL_94;
    }
    if (*(void *)__s2 == 0x745F6C656E72656BLL && v68 == 6647929)
    {
      if (fscanf(v2, "%80s", __s2) != 1) {
        goto LABEL_94;
      }
      uint64_t v19 = 0;
      while (strcmp(kernel_type_table[v19], __s2))
      {
        if (++v19 == 5)
        {
          int v36 = (FILE *)*MEMORY[0x263EF8348];
          uint64_t v37 = "unknown kernel function.\n";
          size_t v38 = 25;
          goto LABEL_93;
        }
      }
      v5[1] = v19;
      goto LABEL_60;
    }
    if (*(_DWORD *)__s2 == 1919378788 && *(_DWORD *)&__s2[3] == 6645106)
    {
LABEL_56:
      int v20 = fscanf(v2, "%d");
      goto LABEL_59;
    }
    BOOL v9 = *(_DWORD *)__s2 == 1835884903 && *(unsigned __int16 *)&__s2[4] == 97;
    if (v9 || (*(_DWORD *)__s2 == 1717923683 ? (BOOL v10 = *(unsigned __int16 *)&__s2[4] == 48) : (BOOL v10 = 0), v10))
    {
      int v20 = fscanf(v2, "%lf");
LABEL_59:
      if (v20 != 1) {
        goto LABEL_94;
      }
      goto LABEL_60;
    }
    if (!(*(void *)__s2 ^ 0x7373616C635F726ELL | v68)
      || !(*(void *)__s2 ^ 0x76735F6C61746F74 | v68))
    {
      goto LABEL_56;
    }
    if (*(_DWORD *)__s2 != 7301234) {
      break;
    }
    uint64_t v64 = v5 + 26;
    int v21 = (*v64 - 1) * *v64;
    if (v21 >= 0) {
      int v22 = (*v64 - 1) * *v64;
    }
    else {
      int v22 = v21 + 1;
    }
    uint64_t v23 = (v22 >> 1);
    double *v6 = malloc_type_malloc(8 * (int)v23, 0x100004000313F17uLL);
    if (v21 >= 2)
    {
      uint64_t v24 = 0;
      while (fscanf(v2, "%lf", (char *)*v6 + v24) == 1)
      {
        v24 += 8;
        if (!--v23) {
          goto LABEL_60;
        }
      }
      goto LABEL_94;
    }
LABEL_60:
    if (fscanf(v2, "%80s", __s2) != 1) {
      goto LABEL_94;
    }
  }
  if (*(_DWORD *)__s2 == 1700946284 && *(unsigned __int16 *)&__s2[4] == 108)
  {
    uint64_t v25 = (int)v5[26];
    *((void *)v5 + 20) = malloc_type_malloc(4 * v25, 0x100004052888210uLL);
    if ((int)v25 >= 1)
    {
      uint64_t v26 = 0;
      uint64_t v27 = 4 * v25;
      while (fscanf(v2, "%d", *((void *)v5 + 20) + v26) == 1)
      {
        v26 += 4;
        if (v27 == v26) {
          goto LABEL_60;
        }
      }
      goto LABEL_94;
    }
    goto LABEL_60;
  }
  if (*(_DWORD *)__s2 == 1651470960 && *(unsigned __int16 *)&__s2[4] == 65)
  {
    int v28 = (v5[26] - 1) * v5[26];
    if (v28 >= 0) {
      int v29 = (v5[26] - 1) * v5[26];
    }
    else {
      int v29 = v28 + 1;
    }
    uint64_t v30 = (v29 >> 1);
    *((void *)v5 + 17) = malloc_type_malloc(8 * (int)v30, 0x100004000313F17uLL);
    if (v28 >= 2)
    {
      uint64_t v31 = 0;
      while (fscanf(v2, "%lf", *((void *)v5 + 17) + v31) == 1)
      {
        v31 += 8;
        if (!--v30) {
          goto LABEL_60;
        }
      }
      goto LABEL_94;
    }
    goto LABEL_60;
  }
  if (*(_DWORD *)__s2 == 1651470960 && *(unsigned __int16 *)&__s2[4] == 66)
  {
    int v32 = (v5[26] - 1) * v5[26];
    if (v32 >= 0) {
      int v33 = (v5[26] - 1) * v5[26];
    }
    else {
      int v33 = v32 + 1;
    }
    uint64_t v34 = (v33 >> 1);
    *((void *)v5 + 18) = malloc_type_malloc(8 * (int)v34, 0x100004000313F17uLL);
    if (v32 >= 2)
    {
      uint64_t v35 = 0;
      while (fscanf(v2, "%lf", *((void *)v5 + 18) + v35) == 1)
      {
        v35 += 8;
        if (!--v34) {
          goto LABEL_60;
        }
      }
      goto LABEL_94;
    }
    goto LABEL_60;
  }
  if (*(_DWORD *)__s2 == 1935635054 && *(unsigned __int16 *)&__s2[4] == 118)
  {
    uint64_t v15 = (int)v5[26];
    *((void *)v5 + 21) = malloc_type_malloc(4 * v15, 0x100004052888210uLL);
    if ((int)v15 >= 1)
    {
      uint64_t v16 = 0;
      uint64_t v17 = 4 * v15;
      while (fscanf(v2, "%d", *((void *)v5 + 21) + v16) == 1)
      {
        v16 += 4;
        if (v17 == v16) {
          goto LABEL_60;
        }
      }
      goto LABEL_94;
    }
    goto LABEL_60;
  }
  if (*(unsigned __int16 *)__s2 ^ 0x5653 | __s2[2])
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "unknown text in model file: [%s]\n", __s2);
    goto LABEL_94;
  }
  do
    int v40 = getc(v2);
  while (v40 != -1 && v40 != 10);
  uint64_t v41 = MEMORY[0x21669DE70](v2);
  max_line_len = 1024;
  line = (uint64_t)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
  *(void *)__s2 = 0;
  int v42 = 0;
  while (readline(v2))
  {
    strtok((char *)line, ":");
    --v42;
    do
      ++v42;
    while (strtok(0, ":"));
  }
  int v43 = v5[27];
  fseek(v2, v41, 0);
  int v44 = v5[26];
  uint64_t v45 = (int)v5[27];
  unsigned int v46 = v44 - 1;
  uint64_t v66 = v5[27];
  *((void *)v5 + 15) = malloc_type_malloc(8 * (v44 - 1), 0x80040B8603338uLL);
  size_t v47 = 8 * v45;
  int v65 = v44;
  if (v44 > 1)
  {
    uint64_t v48 = 0;
    do
    {
      *(void *)(*((void *)v5 + 15) + v48) = malloc_type_malloc(v47, 0x100004000313F17uLL);
      v48 += 8;
    }
    while (8 * v46 != v48);
  }
  *((void *)v5 + 14) = malloc_type_malloc(v47, 0x2004093837F09uLL);
  if ((int)v66 >= 1)
  {
    uint64_t v49 = (char *)malloc_type_malloc(16 * (v43 + v42), 0x1000040F7F8B94BuLL);
    uint64_t v50 = 0;
    int v51 = 0;
    uint64_t v52 = 8 * v46;
    uint64_t v62 = v49 + 8;
    uint64_t v63 = v49;
    do
    {
      readline(v2);
      *(void *)(*((void *)v5 + 14) + 8 * v50) = &v49[16 * v51];
      double v53 = strtok((char *)line, " \t");
      *(double *)(**((void **)v5 + 15) + 8 * v50) = strtod(v53, (char **)__s2);
      if (v65 >= 3)
      {
        uint64_t v54 = 8;
        do
        {
          int v55 = strtok(0, " \t");
          *(double *)(*(void *)(*((void *)v5 + 15) + v54) + 8 * v50) = strtod(v55, (char **)__s2);
          v54 += 8;
        }
        while (v52 != v54);
      }
      uint64_t v56 = v51;
      uint64_t v57 = strtok(0, ":");
      int v58 = strtok(0, " \t");
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = (uint64_t)v51 << 32;
        uint64_t v61 = (double *)&v62[16 * v51];
        do
        {
          *((_DWORD *)v61 - 2) = strtol(v57, (char **)__s2, 10);
          *uint64_t v61 = strtod(v59, (char **)__s2);
          v61 += 2;
          uint64_t v57 = strtok(0, ":");
          uint64_t v59 = strtok(0, " \t");
          v60 += 0x100000000;
          ++v51;
        }
        while (v59);
        uint64_t v56 = v60 >> 32;
        uint64_t v49 = v63;
      }
      ++v51;
      *(_DWORD *)&v49[16 * v56] = -1;
      ++v50;
      uint64_t v52 = 8 * v46;
    }
    while (v50 != v66);
  }
  free((void *)line);
  setlocale(0, v4);
  free(v4);
  if (!ferror(v2) && !fclose(v2))
  {
    v5[44] = 1;
    return v5;
  }
  return 0;
}

void *readline(__sFILE *a1)
{
  if (!fgets((char *)line, max_line_len, a1)) {
    return 0;
  }
  while (1)
  {
    uint64_t v2 = (void *)line;
    if (strrchr((char *)line, 10)) {
      break;
    }
    size_t v3 = 2 * max_line_len;
    max_line_len *= 2;
    line = (uint64_t)malloc_type_realloc(v2, v3, 0x78C8D676uLL);
    int v4 = strlen((const char *)line);
    if (!fgets((char *)(line + v4), max_line_len - v4, a1)) {
      return (void *)line;
    }
  }
  return v2;
}

void svm_free_model_content(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 176))
  {
    if (*(int *)(a1 + 108) >= 1)
    {
      uint64_t v2 = *(void ***)(a1 + 112);
      if (v2) {
        free(*v2);
      }
    }
  }
  if (*(void *)(a1 + 120) && *(int *)(a1 + 104) >= 2)
  {
    uint64_t v3 = 0;
    do
      free(*(void **)(*(void *)(a1 + 120) + 8 * v3++));
    while (v3 < *(int *)(a1 + 104) - 1);
  }
  free(*(void **)(a1 + 112));
  *(void *)(a1 + 112) = 0;
  free(*(void **)(a1 + 120));
  *(void *)(a1 + 120) = 0;
  free(*(void **)(a1 + 128));
  *(void *)(a1 + 128) = 0;
  free(*(void **)(a1 + 160));
  *(void *)(a1 + 160) = 0;
  free(*(void **)(a1 + 136));
  *(void *)(a1 + 136) = 0;
  free(*(void **)(a1 + 144));
  *(void *)(a1 + 144) = 0;
  free(*(void **)(a1 + 152));
  *(void *)(a1 + 152) = 0;
  free(*(void **)(a1 + 168));
  *(void *)(a1 + 168) = 0;
}

void svm_destroy_param(uint64_t a1)
{
  free(*(void **)(a1 + 64));
  uint64_t v2 = *(void **)(a1 + 72);

  free(v2);
}

const char *svm_check_parameter(unsigned int *a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)a2;
  if (*(_DWORD *)a2 > 4u) {
    return "unknown svm type";
  }
  if (*(_DWORD *)(a2 + 4) > 4u) {
    return "unknown kernel type";
  }
  if (*(double *)(a2 + 16) < 0.0) {
    return "gamma < 0";
  }
  if ((*(_DWORD *)(a2 + 8) & 0x80000000) != 0) {
    return "degree of polynomial kernel < 0";
  }
  if (*(double *)(a2 + 32) <= 0.0) {
    return "cache_size <= 0";
  }
  if (*(double *)(a2 + 40) <= 0.0) {
    return "eps <= 0";
  }
  if (v2 <= 4 && ((1 << v2) & 0x19) != 0 && *(double *)(a2 + 48) <= 0.0) {
    return "C <= 0";
  }
  if (v2 - 1 < 2) {
    goto LABEL_16;
  }
  if (v2 == 3)
  {
LABEL_19:
    if (*(double *)(a2 + 88) < 0.0) {
      return "p < 0";
    }
    goto LABEL_25;
  }
  if (v2 == 4)
  {
LABEL_16:
    double v6 = *(double *)(a2 + 80);
    double result = "nu <= 0 or nu > 1";
    if (v6 <= 0.0 || v6 > 1.0) {
      return result;
    }
    if (v2 == 3) {
      goto LABEL_19;
    }
  }
LABEL_25:
  if (*(_DWORD *)(a2 + 96) > 1u) {
    return "shrinking != 0 and shrinking != 1";
  }
  unsigned int v7 = *(_DWORD *)(a2 + 100);
  if (v7 > 1) {
    return "probability != 0 and probability != 1";
  }
  if (v7 == 1 && v2 == 2) {
    double result = "one-class SVM probability output not supported yet";
  }
  else {
    double result = 0;
  }
  if (v2 == 1)
  {
    uint64_t v9 = *a1;
    BOOL v10 = malloc_type_malloc(0x40uLL, 0x100004052888210uLL);
    uint64_t v11 = malloc_type_malloc(0x40uLL, 0x100004052888210uLL);
    if ((int)v9 < 1) {
      goto LABEL_57;
    }
    uint64_t v12 = 0;
    int v13 = 0;
    int v14 = 16;
    do
    {
      int v15 = (int)*(double *)(*((void *)a1 + 1) + 8 * v12);
      if (v13 < 1)
      {
        LODWORD(v16) = 0;
      }
      else
      {
        uint64_t v16 = 0;
        while (v10[v16] != v15)
        {
          if (v13 == ++v16) {
            goto LABEL_44;
          }
        }
        ++v11[v16];
      }
      if (v16 == v13)
      {
LABEL_44:
        if (v13 == v14)
        {
          int v14 = 2 * v13;
          BOOL v10 = malloc_type_realloc(v10, 8 * v13, 0x100004052888210uLL);
          uint64_t v11 = malloc_type_realloc(v11, 8 * v13, 0x100004052888210uLL);
        }
        v10[v13] = v15;
        v11[v13++] = 1;
      }
      ++v12;
    }
    while (v12 != v9);
    if (v13 < 1)
    {
LABEL_57:
      free(v10);
      free(v11);
      return 0;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v18 = 1;
      while (1)
      {
        uint64_t v19 = v17 + 1;
        if (v17 + 1 < (unint64_t)v13) {
          break;
        }
LABEL_56:
        ++v18;
        uint64_t v17 = v19;
        if (v19 == v13) {
          goto LABEL_57;
        }
      }
      int v20 = v11[v17];
      uint64_t v21 = v18;
      while (1)
      {
        int v22 = v11[v21];
        double v23 = *(double *)(a2 + 80) * (double)(v22 + v20) * 0.5;
        if (v20 < v22) {
          int v22 = v20;
        }
        if (v23 > (double)v22) {
          break;
        }
        if (v13 == ++v21) {
          goto LABEL_56;
        }
      }
      free(v10);
      free(v11);
      return "specified nu is infeasible";
    }
  }
  return result;
}

BOOL svm_check_probability_model(uint64_t a1)
{
  if (*(_DWORD *)a1 > 1u)
  {
    if ((*(_DWORD *)a1 - 3) <= 1) {
      return *(void *)(a1 + 136) != 0;
    }
  }
  else if (*(void *)(a1 + 136) && *(void *)(a1 + 144))
  {
    return 1;
  }
  return 0;
}

uint64_t (*svm_set_print_string_function(uint64_t (*result)(const char *)))(const char *)
{
  if (result) {
    uint64_t v1 = result;
  }
  else {
    uint64_t v1 = print_string_stdout;
  }
  svm_print_string = v1;
  return result;
}

double CPMLLibSVM::Kernel::swap_index(CPMLLibSVM::Kernel *this, int a2, int a3)
{
  uint64_t v3 = *((void *)this + 3);
  uint64_t v4 = *(void *)(v3 + 8 * a2);
  *(void *)(v3 + 8 * a2) = *(void *)(v3 + 8 * a3);
  *(void *)(v3 + 8 * a3) = v4;
  uint64_t v5 = *((void *)this + 4);
  if (v5)
  {
    double result = *(double *)(v5 + 8 * a2);
    *(void *)(v5 + 8 * a2) = *(void *)(v5 + 8 * a3);
    *(double *)(v5 + 8 * a3) = result;
  }
  return result;
}

void CPMLLibSVM::Solver::~Solver(CPMLLibSVM::Solver *this)
{
}

void CPMLLibSVM::Solver_NU::~Solver_NU(CPMLLibSVM::Solver_NU *this)
{
}

void CPMLLibSVM::SVC_Q::SVC_Q(uint64_t a1, unsigned int *a2, uint64_t a3)
{
}

void sub_21431729C(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v2, 0x10A0C408A4F435CLL);
  CPMLLibSVM::Kernel::~Kernel(v1);
  _Unwind_Resume(a1);
}

float *CPMLLibSVM::SVC_Q::get_Q(CPMLLibSVM::Cache **this, uint64_t a2, uint64_t a3)
{
  int v3 = a3;
  uint64_t v17 = 0;
  int data = CPMLLibSVM::Cache::get_data(this[9], a2, &v17, a3);
  unsigned int v7 = v17;
  if (data < v3)
  {
    uint64_t v8 = data;
    do
    {
      uint64_t v9 = this[8];
      int v10 = *((char *)v9 + (int)a2);
      int v11 = *((char *)v9 + v8);
      uint64_t v12 = this[1];
      uint64_t v13 = (uint64_t)this[2];
      int v14 = (CPMLLibSVM::Cache **)((char *)this + (v13 >> 1));
      if (v13) {
        uint64_t v12 = *(CPMLLibSVM::Cache **)(*v14 + v12);
      }
      float v15 = ((double (*)(void *, uint64_t, uint64_t))v12)(v14, a2, v8) * (double)(v11 * v10);
      v7[v8++] = v15;
    }
    while (v3 != v8);
  }
  return v7;
}

uint64_t CPMLLibSVM::SVC_Q::get_QD(CPMLLibSVM::SVC_Q *this)
{
  return *((void *)this + 10);
}

double CPMLLibSVM::SVC_Q::swap_index(CPMLLibSVM::Cache **this, int a2, int a3)
{
  CPMLLibSVM::Cache::swap_index(this[9], a2, a3);
  double v6 = this[3];
  uint64_t v7 = *((void *)v6 + a2);
  *((void *)v6 + a2) = *((void *)v6 + a3);
  *((void *)v6 + a3) = v7;
  uint64_t v8 = this[4];
  if (v8)
  {
    uint64_t v9 = *((void *)v8 + a2);
    *((void *)v8 + a2) = *((void *)v8 + a3);
    *((void *)v8 + a3) = v9;
  }
  int v10 = this[8];
  char v11 = *((unsigned char *)v10 + a2);
  *((unsigned char *)v10 + a2) = *((unsigned char *)v10 + a3);
  *((unsigned char *)v10 + a3) = v11;
  uint64_t v12 = this[10];
  double result = *((double *)v12 + a2);
  *((void *)v12 + a2) = *((void *)v12 + a3);
  *((double *)v12 + a3) = result;
  return result;
}

void CPMLLibSVM::SVC_Q::~SVC_Q(CPMLLibSVM::SVC_Q *this)
{
  CPMLLibSVM::SVC_Q::~SVC_Q(this);

  JUMPOUT(0x21669DB80);
}

{
  uint64_t v2;
  CPMLLibSVM::Cache *v3;
  uint64_t v4;
  uint64_t vars8;

  *(void *)this = &unk_26C510610;
  uint64_t v2 = *((void *)this + 8);
  if (v2) {
    MEMORY[0x21669DB60](v2, 0x1000C8077774924);
  }
  int v3 = (CPMLLibSVM::Cache *)*((void *)this + 9);
  if (v3)
  {
    CPMLLibSVM::Cache::~Cache(v3);
    MEMORY[0x21669DB80]();
  }
  uint64_t v4 = *((void *)this + 10);
  if (v4) {
    MEMORY[0x21669DB60](v4, 0x1000C8000313F17);
  }

  CPMLLibSVM::Kernel::~Kernel(this);
}

void CPMLLibSVM::ONE_CLASS_Q::ONE_CLASS_Q(uint64_t a1, unsigned int *a2, uint64_t a3)
{
}

void sub_21431766C(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v2, 0x10A0C408A4F435CLL);
  CPMLLibSVM::Kernel::~Kernel(v1);
  _Unwind_Resume(a1);
}

float *CPMLLibSVM::ONE_CLASS_Q::get_Q(CPMLLibSVM::Cache **this, uint64_t a2, uint64_t a3)
{
  int v3 = a3;
  float v15 = 0;
  uint64_t data = CPMLLibSVM::Cache::get_data(this[8], a2, &v15, a3);
  uint64_t v7 = v15;
  if ((int)data < v3)
  {
    uint64_t v8 = data;
    uint64_t v9 = &v15[(int)data];
    do
    {
      int v10 = this[1];
      uint64_t v11 = (uint64_t)this[2];
      uint64_t v12 = (CPMLLibSVM::Cache **)((char *)this + (v11 >> 1));
      if (v11) {
        int v10 = *(CPMLLibSVM::Cache **)(*v12 + v10);
      }
      float v13 = ((double (*)(void *, uint64_t, uint64_t))v10)(v12, a2, v8);
      *v9++ = v13;
      uint64_t v8 = (v8 + 1);
    }
    while (v3 != v8);
  }
  return v7;
}

uint64_t CPMLLibSVM::ONE_CLASS_Q::get_QD(CPMLLibSVM::ONE_CLASS_Q *this)
{
  return *((void *)this + 9);
}

double CPMLLibSVM::ONE_CLASS_Q::swap_index(CPMLLibSVM::Cache **this, int a2, int a3)
{
  CPMLLibSVM::Cache::swap_index(this[8], a2, a3);
  double v6 = this[3];
  uint64_t v7 = *((void *)v6 + a2);
  *((void *)v6 + a2) = *((void *)v6 + a3);
  *((void *)v6 + a3) = v7;
  uint64_t v8 = this[4];
  if (v8)
  {
    uint64_t v9 = *((void *)v8 + a2);
    *((void *)v8 + a2) = *((void *)v8 + a3);
    *((void *)v8 + a3) = v9;
  }
  int v10 = this[9];
  double result = *((double *)v10 + a2);
  *((void *)v10 + a2) = *((void *)v10 + a3);
  *((double *)v10 + a3) = result;
  return result;
}

void CPMLLibSVM::ONE_CLASS_Q::~ONE_CLASS_Q(CPMLLibSVM::ONE_CLASS_Q *this)
{
  CPMLLibSVM::ONE_CLASS_Q::~ONE_CLASS_Q(this);

  JUMPOUT(0x21669DB80);
}

{
  CPMLLibSVM::Cache *v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)this = &unk_26C5105D8;
  uint64_t v2 = (CPMLLibSVM::Cache *)*((void *)this + 8);
  if (v2)
  {
    CPMLLibSVM::Cache::~Cache(v2);
    MEMORY[0x21669DB80]();
  }
  int v3 = *((void *)this + 9);
  if (v3) {
    MEMORY[0x21669DB60](v3, 0x1000C8000313F17);
  }

  CPMLLibSVM::Kernel::~Kernel(this);
}

void CPMLLibSVM::SVR_Q::SVR_Q(uint64_t a1, unsigned int *a2, uint64_t a3)
{
}

void sub_214317AD8(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v2, 0x10A0C408A4F435CLL);
  CPMLLibSVM::Kernel::~Kernel(v1);
  _Unwind_Resume(a1);
}

float *CPMLLibSVM::SVR_Q::get_Q(CPMLLibSVM::SVR_Q *this, int a2, int a3)
{
  int v28 = 0;
  uint64_t v6 = *((void *)this + 11);
  uint64_t v7 = *(unsigned int *)(v6 + 4 * a2);
  int data = CPMLLibSVM::Cache::get_data(*((CPMLLibSVM::Cache **)this + 9), *(_DWORD *)(v6 + 4 * a2), &v28, *((unsigned int *)this + 16));
  int v9 = *((_DWORD *)this + 16);
  if (data < v9 && v9 >= 1)
  {
    uint64_t v11 = 0;
    uint64_t v12 = v28;
    do
    {
      float v13 = (double (*)(void *, uint64_t, uint64_t))*((void *)this + 1);
      uint64_t v14 = *((void *)this + 2);
      float v15 = (void *)((char *)this + (v14 >> 1));
      if (v14) {
        float v13 = *(double (**)(void *, uint64_t, uint64_t))(*v15 + v13);
      }
      float v16 = v13(v15, v7, v11);
      v12[v11++] = v16;
    }
    while (v11 < *((int *)this + 16));
  }
  uint64_t v17 = *((int *)this + 24);
  double result = (float *)*((void *)this + v17 + 13);
  *((_DWORD *)this + 24) = 1 - v17;
  if (a3 >= 1)
  {
    uint64_t v19 = (char *)*((void *)this + 10);
    int v20 = (int *)*((void *)this + 11);
    float v21 = (float)v19[a2];
    int v22 = v28;
    uint64_t v23 = a3;
    uint64_t v24 = result;
    do
    {
      int v25 = *v19++;
      float v26 = v21 * (float)v25;
      uint64_t v27 = *v20++;
      *v24++ = v26 * v22[v27];
      --v23;
    }
    while (v23);
  }
  return result;
}

uint64_t CPMLLibSVM::SVR_Q::get_QD(CPMLLibSVM::SVR_Q *this)
{
  return *((void *)this + 15);
}

double CPMLLibSVM::SVR_Q::swap_index(CPMLLibSVM::SVR_Q *this, int a2, int a3)
{
  uint64_t v3 = *((void *)this + 10);
  char v4 = *(unsigned char *)(v3 + a2);
  *(unsigned char *)(v3 + a2) = *(unsigned char *)(v3 + a3);
  *(unsigned char *)(v3 + a3) = v4;
  uint64_t v5 = *((void *)this + 11);
  int v6 = *(_DWORD *)(v5 + 4 * a2);
  *(_DWORD *)(v5 + 4 * a2) = *(_DWORD *)(v5 + 4 * a3);
  *(_DWORD *)(v5 + 4 * a3) = v6;
  uint64_t v7 = *((void *)this + 15);
  double result = *(double *)(v7 + 8 * a2);
  *(void *)(v7 + 8 * a2) = *(void *)(v7 + 8 * a3);
  *(double *)(v7 + 8 * a3) = result;
  return result;
}

void CPMLLibSVM::SVR_Q::~SVR_Q(CPMLLibSVM::SVR_Q *this)
{
  CPMLLibSVM::SVR_Q::~SVR_Q(this);

  JUMPOUT(0x21669DB80);
}

{
  CPMLLibSVM::Cache *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars8;

  *(void *)this = &unk_26C510648;
  uint64_t v2 = (CPMLLibSVM::Cache *)*((void *)this + 9);
  if (v2)
  {
    CPMLLibSVM::Cache::~Cache(v2);
    MEMORY[0x21669DB80]();
  }
  uint64_t v3 = *((void *)this + 10);
  if (v3) {
    MEMORY[0x21669DB60](v3, 0x1000C8077774924);
  }
  char v4 = *((void *)this + 11);
  if (v4) {
    MEMORY[0x21669DB60](v4, 0x1000C8052888210);
  }
  uint64_t v5 = *((void *)this + 13);
  if (v5) {
    MEMORY[0x21669DB60](v5, 0x1000C8052888210);
  }
  int v6 = *((void *)this + 14);
  if (v6) {
    MEMORY[0x21669DB60](v6, 0x1000C8052888210);
  }
  uint64_t v7 = *((void *)this + 15);
  if (v7) {
    MEMORY[0x21669DB60](v7, 0x1000C8000313F17);
  }

  CPMLLibSVM::Kernel::~Kernel(this);
}

void CPMLUserDefinedAlgorithm::CPMLUserDefinedAlgorithm(CPMLUserDefinedAlgorithm *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, a2, a3, a4);
  *char v4 = &unk_26C510148;
  CPMLCDB::getIterator();
}

void sub_214317E28(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPMLUserDefinedAlgorithm::CPMLUserDefinedAlgorithm(CPMLUserDefinedAlgorithm *this, CPMLSerialization *a2, CPMLTunableData *a3)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, a2, a3);
  *(void *)uint64_t v3 = &unk_26C510148;
  CPMLDelegate::deSerializeCPMLAlgorithm(*(CPMLDelegate **)(v3 + 56));
}

void sub_214317E98(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPMLUserDefinedAlgorithm::~CPMLUserDefinedAlgorithm(CPMLUserDefinedAlgorithm *this)
{
  CPModelClose(this);

  JUMPOUT(0x21669DB80);
}

uint64_t CPMLUserDefinedAlgorithm::update(CPMLUserDefinedAlgorithm *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  uint64_t v5 = (*(uint64_t (**)(void, CPMLCDB *, CPMLSerialization *, CPMLTunableData *))(**((void **)this + 10)
                                                                                            + 32))(*((void *)this + 10), a2, a3, a4);
  if (v5)
  {
    int v6 = (CPMLFeatureVector *)v5;
    do
    {
      CPMLDelegate::updateCPMLAlgorithm(*((CPMLDelegate **)this + 7), v6);
      int v6 = (CPMLFeatureVector *)(*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
    }
    while (v6);
  }
  return 0;
}

uint64_t CPMLUserDefinedAlgorithm::eval(uint64_t a1, CPMLFeatureVector *a2)
{
  double v4 = -1.0;
  CPMLDelegate::evaluateCPMLAlgorithm(*(id **)(a1 + 56), a2, 0, &v4);
  CPMLFeatureVector::setYHat((uint64_t)a2, v4);
  return 0;
}

uint64_t CPMLUserDefinedAlgorithm::serialize(CPMLDelegate **this)
{
  return 0;
}

uint64_t CPMLUserDefinedAlgorithm::train(CPMLUserDefinedAlgorithm *this)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
  if (v2)
  {
    uint64_t v3 = (CPMLFeatureVector *)v2;
    do
    {
      CPMLDelegate::trainCPMLAlgorithm(*((CPMLDelegate **)this + 7), v3);
      uint64_t v3 = (CPMLFeatureVector *)(*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
    }
    while (v3);
  }
  return 0;
}

uint64_t CPMLUserDefinedAlgorithm::errorString(CPMLUserDefinedAlgorithm *this)
{
  return 0;
}

uint64_t CPMLUserDefinedAlgorithm::requireRealOnly(CPMLUserDefinedAlgorithm *this)
{
  return 1;
}

void CPMLNaiveBayesSpotLightAdaptor::CPMLNaiveBayesSpotLightAdaptor(CPMLNaiveBayesSpotLightAdaptor *this, CPMLSerialization *a2)
{
  CPMLNaiveBayesAdaptor::CPMLNaiveBayesAdaptor(this, a2);
  *uint64_t v2 = &unk_26C510490;
}

double CPMLNaiveBayesSpotLightAdaptor::get_cx_given_y(CPMLNaiveBayesSpotLightAdaptor *this, int a2, int a3, int a4, double *a5)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  int v66 = a3;
  if (a2 < 2)
  {
    double v10 = 0.0;
    if (a2 != 1)
    {
      unint64_t v64 = 0xBFF0000000000000;
      double v65 = -1.0;
      uint64_t v11 = sqlite3_mprintf("select xCardinality from xCardinality%d where yMap=%d;", a2, a4);
      (*(void (**)(void, unint64_t *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v64, v11);
      if (v11) {
        sqlite3_free(v11);
      }
      if (fabs(v65) == INFINITY)
      {
        *a5 = 0.0;
        return -2.0;
      }
      else
      {
        *(void *)a5 = v64;
        uint64_t v61 = 0;
        uint64_t v62 = 0;
        uint64_t v63 = 0;
        uint64_t v12 = sqlite3_mprintf("select keyValue from cacheString where indexValue=%d;", a3);
        (*(void (**)(void, char *, uint64_t, char *))(**((void **)this + 1) + 184))(*((void *)this + 1), v67, 512, v12);
        if (v67[0])
        {
          float v13 = sqlite3_mprintf("select count(*) from xcol0;");
          (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v65, v13);
          sqlite3_free(v13);
          ((void (*)(void))MEMORY[0x270FA5388])();
          float v15 = (char *)v60 - v14;
          float v16 = sqlite3_mprintf("select indexValue from INDEX0 where keyValue like \"%s%%\" ;", v67);
          int v17 = (*(uint64_t (**)(void, char *, void, char *))(**((void **)this + 1) + 200))(*((void *)this + 1), v15, (int)v65, v16);
          v60[1] = v60;
          if (v17 < 1)
          {
            uint64_t v31 = sqlite3_mprintf("select count(*) from xcol1;");
            (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v65, v31);
            sqlite3_free(v31);
            v60[0] = v60;
            MEMORY[0x270FA5388](v32, v33);
            uint64_t v35 = (char *)v60 - v34;
            int v36 = sqlite3_mprintf("select indexValue from INDEX1 where keyValue like '%s%%';", v67);
            int v37 = (*(uint64_t (**)(void, char *, void, char *))(**((void **)this + 1) + 200))(*((void *)this + 1), v35, (int)v65, v36);
            BOOL v30 = v37 > 0;
            if (v37 < 1)
            {
              std::vector<int>::push_back[abi:ne180100]((uint64_t)&v61, &v66);
            }
            else
            {
              uint64_t v38 = 0;
              uint64_t v39 = v37;
              int v40 = v62;
              do
              {
                if (v40 >= v63)
                {
                  int v42 = v61;
                  uint64_t v43 = (v40 - (char *)v61) >> 2;
                  unint64_t v44 = v43 + 1;
                  if ((unint64_t)(v43 + 1) >> 62) {
                    std::vector<double>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v45 = v63 - (char *)v61;
                  if ((v63 - (char *)v61) >> 1 > v44) {
                    unint64_t v44 = v45 >> 1;
                  }
                  if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v46 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v46 = v44;
                  }
                  if (v46)
                  {
                    size_t v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v63, v46);
                    int v42 = v61;
                    int v40 = v62;
                  }
                  else
                  {
                    size_t v47 = 0;
                  }
                  uint64_t v48 = &v47[4 * v43];
                  *(_DWORD *)uint64_t v48 = *(_DWORD *)&v35[4 * v38];
                  uint64_t v41 = v48 + 4;
                  while (v40 != (char *)v42)
                  {
                    int v49 = *((_DWORD *)v40 - 1);
                    v40 -= 4;
                    *((_DWORD *)v48 - 1) = v49;
                    v48 -= 4;
                  }
                  uint64_t v61 = (int *)v48;
                  uint64_t v62 = v41;
                  uint64_t v63 = &v47[4 * v46];
                  if (v42) {
                    operator delete(v42);
                  }
                }
                else
                {
                  *(_DWORD *)int v40 = *(_DWORD *)&v35[4 * v38];
                  uint64_t v41 = v40 + 4;
                }
                uint64_t v62 = v41;
                ++v38;
                int v40 = v41;
              }
              while (v38 != v39);
            }
          }
          else
          {
            uint64_t v18 = 0;
            uint64_t v19 = v17;
            int v20 = v62;
            do
            {
              if (v20 >= v63)
              {
                int v22 = v61;
                uint64_t v23 = (v20 - (char *)v61) >> 2;
                unint64_t v24 = v23 + 1;
                if ((unint64_t)(v23 + 1) >> 62) {
                  std::vector<double>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v25 = v63 - (char *)v61;
                if ((v63 - (char *)v61) >> 1 > v24) {
                  unint64_t v24 = v25 >> 1;
                }
                if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v26 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v26 = v24;
                }
                if (v26)
                {
                  uint64_t v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v63, v26);
                  int v22 = v61;
                  int v20 = v62;
                }
                else
                {
                  uint64_t v27 = 0;
                }
                int v28 = &v27[4 * v23];
                *(_DWORD *)int v28 = *(_DWORD *)&v15[4 * v18];
                float v21 = v28 + 4;
                while (v20 != (char *)v22)
                {
                  int v29 = *((_DWORD *)v20 - 1);
                  v20 -= 4;
                  *((_DWORD *)v28 - 1) = v29;
                  v28 -= 4;
                }
                uint64_t v61 = (int *)v28;
                uint64_t v62 = v21;
                uint64_t v63 = &v27[4 * v26];
                if (v22) {
                  operator delete(v22);
                }
              }
              else
              {
                *(_DWORD *)int v20 = *(_DWORD *)&v15[4 * v18];
                float v21 = v20 + 4;
              }
              uint64_t v62 = v21;
              ++v18;
              int v20 = v21;
            }
            while (v18 != v19);
            BOOL v30 = 0;
          }
          int v55 = (int *)v62;
        }
        else
        {
          uint64_t v50 = (v62 - (char *)v61) >> 2;
          unint64_t v51 = v50 + 1;
          if ((unint64_t)(v50 + 1) >> 62) {
            std::vector<double>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v52 = v63 - (char *)v61;
          if ((v63 - (char *)v61) >> 1 > v51) {
            unint64_t v51 = v52 >> 1;
          }
          if ((unint64_t)v52 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v53 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v53 = v51;
          }
          if (v53) {
            uint64_t v54 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v63, v53);
          }
          else {
            uint64_t v54 = 0;
          }
          uint64_t v56 = (int *)&v54[4 * v50];
          int *v56 = a3;
          int v55 = v56 + 1;
          uint64_t v61 = v56;
          uint64_t v63 = &v54[4 * v53];
          BOOL v30 = 0;
          uint64_t v62 = (char *)(v56 + 1);
        }
        if (v55 == v61)
        {
          double v10 = 0.0;
          if (!v55) {
            return v10;
          }
        }
        else
        {
          unint64_t v57 = 0;
          double v10 = 0.0;
          int v55 = v61;
          do
          {
            int v58 = sqlite3_mprintf("select xyCount from xcol%d where (xMap==%d and yMap==%d);", v30, v55[v57], a4);
            (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v65, v58);
            if (v58) {
              sqlite3_free(v58);
            }
            double v59 = v65;
            if (fabs(v65) == INFINITY)
            {
              double v65 = 0.0;
              double v59 = 0.0;
            }
            double v10 = v10 + v59;
            ++v57;
            int v55 = v61;
          }
          while (v57 < (v62 - (char *)v61) >> 2);
          if (!v61) {
            return v10;
          }
        }
        uint64_t v62 = (char *)v55;
        operator delete(v55);
      }
    }
    return v10;
  }

  return CPMLNaiveBayesAdaptor::get_cx_given_y(this, a2, a3, a4, a5);
}

void sub_2143187DC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)(v1 + 16);
  if (v3)
  {
    *(void *)(v1 + 24) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<int>::push_back[abi:ne180100](uint64_t a1, _DWORD *a2)
{
  uint64_t v4 = a1 + 16;
  unint64_t v5 = *(void *)(a1 + 16);
  int v6 = *(_DWORD **)(a1 + 8);
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v8 = *(_DWORD **)a1;
    uint64_t v9 = ((uint64_t)v6 - *(void *)a1) >> 2;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - (void)v8;
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
      float v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v4, v12);
      uint64_t v8 = *(_DWORD **)a1;
      int v6 = *(_DWORD **)(a1 + 8);
    }
    else
    {
      float v13 = 0;
    }
    uint64_t v14 = &v13[4 * v9];
    float v15 = &v13[4 * v12];
    *(_DWORD *)uint64_t v14 = *a2;
    uint64_t v7 = v14 + 4;
    while (v6 != v8)
    {
      int v16 = *--v6;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    _DWORD *v6 = *a2;
    uint64_t v7 = v6 + 1;
  }
  *(void *)(a1 + 8) = v7;
}

double CPMLNaiveBayesDBAdaptor::getYCardinalityCount(CPMLNaiveBayesDBAdaptor *this)
{
  return *((double *)this + 3);
}

uint64_t CPMLNaiveBayesDBAdaptor::getDefaultCandidateList(CPMLNaiveBayesDBAdaptor *this)
{
  return (uint64_t)this + 160;
}

void CPMLIterator::CPMLIterator(CPMLIterator *this)
{
  *(void *)this = &unk_26C50F9B0;
  *((void *)this + 4) = 0;
}

void CPMLIterator::CPMLIterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)a1 = &unk_26C50F9B0;
  *(_DWORD *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = a2;
  *(void *)(a1 + 32) = a3;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 64) = a5;
  *(void *)(a1 + 72) = a8;
  operator new();
}

void sub_214318BB0(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x1020C40A6DF2F91);
  _Unwind_Resume(a1);
}

void CPMLIterator::~CPMLIterator(CPMLIterator *this)
{
  *(void *)this = &unk_26C50F9B0;
  uint64_t v2 = (sqlite3 *)*((void *)this + 4);
  if (v2)
  {
    if (!CPMLsql_createTable(v2, "MODEL_TRAINING_STATS", "lastTrainingIndexPos integer", 0))
    {
      uint64_t v3 = sqlite3_mprintf("%d", *((_DWORD *)this + 3) + *((_DWORD *)this + 4));
      inserted = (CPMLLog *)CPMLsql_insertIntoTable(*((sqlite3 **)this + 4), "MODEL_TRAINING_STATS", "lastTrainingIndexPos", v3);
      if ((inserted & 0x80000000) != 0)
      {
        CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(inserted);
        CPMLLog::log(CPMLLog, CPML_LOG_ERR, "~CPMLIterator", "failed ot write out last training position %d %d", *((_DWORD *)this + 4), *((_DWORD *)this + 3));
      }
      if (v3) {
        sqlite3_free(v3);
      }
    }
    int v6 = (CPMLFeatureVector *)*((void *)this + 6);
    if (v6)
    {
      CPMLFeatureVector::~CPMLFeatureVector(v6);
      MEMORY[0x21669DB80]();
    }
    if (*((unsigned char *)this + 8))
    {
      uint64_t v7 = (CPMLRemapper *)*((void *)this + 7);
      if (v7)
      {
        CPMLRemapper::~CPMLRemapper(v7);
        MEMORY[0x21669DB80]();
      }
    }
    sqlite3_finalize(*((sqlite3_stmt **)this + 5));
  }
}

{
  uint64_t vars8;

  CPMLIterator::~CPMLIterator(this);

  JUMPOUT(0x21669DB80);
}

uint64_t CPMLIterator::iterateAll(CPMLIterator *this)
{
  CPMLFeatureVector::resetAll(*((CPMLFeatureVector **)this + 6));
  CPMLFeatureVector::resizeRealVector(*((CPMLFeatureVector **)this + 6), *(_DWORD *)(*((void *)this + 8) + 120) * *(_DWORD *)(*((void *)this + 8) + 124));
  if (*(int *)(*((void *)this + 8) + 120) < 1) {
    return *((void *)this + 6);
  }
  int v2 = 0;
  while (1)
  {
    uint64_t v3 = (CPMLLog *)sqlite3_step(*((sqlite3_stmt **)this + 5));
    if (v3 != 100) {
      break;
    }
    uint64_t v4 = *((void *)this + 8);
    if (*(int *)(v4 + 124) >= 1)
    {
      int v5 = 0;
      do
      {
        ++CPMLIterator::iterateAll(void)::ct;
        int v6 = sqlite3_column_type(*((sqlite3_stmt **)this + 5), v5);
        uint64_t v7 = (sqlite3_stmt *)*((void *)this + 5);
        if (v6 == 2 || (v8 = sqlite3_column_type(v7, v5), uint64_t v7 = (sqlite3_stmt *)*((void *)this + 5), v8 == 1))
        {
          double v9 = sqlite3_column_double(v7, v5);
          double v10 = CPMLRemapper::normalizeColumn(*((CPMLRemapper **)this + 7), v9, v5);
        }
        else
        {
          uint64_t v11 = (char *)sqlite3_column_text(v7, v5);
          double v10 = (double)(int)CPMLRemapper::remap(*((CPMLRemapper **)this + 7), v11, v5);
          uint64_t v12 = *((void *)this + 8);
          if (*(unsigned char *)(v12 + 136)) {
            double v10 = v10 / (double)*(int *)(v12 + 120);
          }
        }
        CPMLFeatureVector::insertRealVClass(*((CPMLFeatureVector **)this + 6), v10, v2 + *(_DWORD *)(*((void *)this + 8) + 120) * v5++);
        uint64_t v4 = *((void *)this + 8);
      }
      while (v5 < *(_DWORD *)(v4 + 124));
    }
    if (++v2 >= *(_DWORD *)(v4 + 120)) {
      return *((void *)this + 6);
    }
  }
  int v13 = (int)v3;
  if (v3 == 101) {
    return *((void *)this + 6);
  }
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v3);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "iterateAll", "CPCDBDefault: Error iterating All rows %d\n", v13);
  return 0;
}

uint64_t CPMLIterator::iterateFirst(CPMLIterator *this)
{
  v57[1] = *MEMORY[0x263EF8340];
  while (1)
  {
    int v2 = sqlite3_step(*((sqlite3_stmt **)this + 5));
    if (v2 == 101) {
      return 0;
    }
    int v3 = v2;
    CPMLFeatureVector::resetAll(*((CPMLFeatureVector **)this + 6));
    if (v3 != 100) {
      return 0;
    }
    ++*((_DWORD *)this + 4);
    uint64_t v4 = *((void *)this + 8);
    if (*(int *)(v4 + 124) < 1) {
      return *((void *)this + 6);
    }
    uint64_t v5 = 0;
    char v6 = 1;
    do
    {
      uint64_t v7 = *(unsigned int *)(v4 + 128);
      int v8 = (sqlite3_stmt *)*((void *)this + 5);
      if (v5 == v7)
      {
        int v9 = sqlite3_column_type(v8, v7);
        double v10 = (sqlite3_stmt *)*((void *)this + 5);
        int v11 = *(_DWORD *)(*((void *)this + 8) + 128);
        if (v9 == 2
          || (int v12 = sqlite3_column_type(v10, v11),
              double v10 = (sqlite3_stmt *)*((void *)this + 5),
              int v11 = *(_DWORD *)(*((void *)this + 8) + 128),
              v12 == 1))
        {
          double v13 = sqlite3_column_double(v10, v11);
        }
        else
        {
          if (sqlite3_column_type(v10, v11) == 4)
          {
            int v21 = *(_DWORD *)(*((void *)this + 8) + 128);
            int v22 = (unsigned __int8 *)sqlite3_column_blob(*((sqlite3_stmt **)this + 5), v21);
            uint64_t v23 = sqlite3_column_bytes(*((sqlite3_stmt **)this + 5), v21);
            uint64_t v25 = (CPMLLog *)MEMORY[0x270FA5388](v23, v24);
            uint64_t v27 = (char *)v57 - v26;
            int v28 = *v22;
            if (v28 == 83)
            {
              uint64_t v42 = *(void *)(v22 + 1);
              if (v42)
              {
                uint64_t v43 = (size_t *)(v22 + 9);
                do
                {
                  size_t v46 = *v43;
                  unint64_t v44 = (const char *)(v43 + 1);
                  size_t v45 = v46;
                  strlcpy(v27, v44, v46);
                  int v47 = CPMLRemapper::remap(*((CPMLRemapper **)this + 7), v27, v21);
                  if ((v47 & 0x80000000) == 0) {
                    CPMLFeatureVector::insertYIntVClass(*((CPMLFeatureVector **)this + 6), v47);
                  }
                  uint64_t v43 = (size_t *)&v44[v45];
                  --v42;
                }
                while (v42);
                double v13 = (double)v47;
                goto LABEL_44;
              }
            }
            else
            {
              if (v28 == 78)
              {
                double v13 = (double)(int)CPMLRemapper::remap(*((CPMLRemapper **)this + 7), "", v21);
                goto LABEL_44;
              }
              CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v25);
              CPMLLog::log(CPMLLog, CPML_LOG_ERR, "iterateFirst", "Encoding unsupported");
            }
            double v13 = 0.0;
LABEL_44:
            YVectorVector = (void *)CPMLFeatureVector::getYVectorVector(*((CPMLFeatureVector **)this + 6));
            if (YVectorVector[1] == *YVectorVector) {
              char v6 = 0;
            }
            goto LABEL_17;
          }
          uint64_t v39 = (char *)sqlite3_column_text(*((sqlite3_stmt **)this + 5), *(_DWORD *)(*((void *)this + 8) + 128));
          double v13 = (double)(int)CPMLRemapper::remap(*((CPMLRemapper **)this + 7), v39, *(_DWORD *)(*((void *)this + 8) + 128));
        }
        CPMLFeatureVector::setYHat(*((void *)this + 6), v13);
      }
      else
      {
        int v14 = sqlite3_column_type(v8, v5);
        float v15 = (sqlite3_stmt *)*((void *)this + 5);
        if (v14 == 2 || (v16 = sqlite3_column_type(v15, v5), float v15 = (sqlite3_stmt *)*((void *)this + 5), v16 == 1))
        {
          double v17 = sqlite3_column_double(v15, v5);
          double v13 = CPMLRemapper::normalizeColumn(*((CPMLRemapper **)this + 7), v17, v5);
        }
        else
        {
          int v29 = sqlite3_column_type(v15, v5);
          BOOL v30 = (sqlite3_stmt *)*((void *)this + 5);
          if (v29 == 4)
          {
            uint64_t v31 = (unsigned __int8 *)sqlite3_column_blob(v30, v5);
            uint64_t v32 = sqlite3_column_bytes(*((sqlite3_stmt **)this + 5), v5);
            uint64_t v34 = (CPMLLog *)MEMORY[0x270FA5388](v32, v33);
            int v36 = (char *)v57 - v35;
            int v37 = *v31;
            if (v37 != 83)
            {
              if (v37 == 78)
              {
                int v38 = CPMLRemapper::remap(*((CPMLRemapper **)this + 7), "", v5);
                CPMLFeatureVector::insertIntToLastVVClass(*((CPMLFeatureVector **)this + 6), v38);
              }
              else
              {
                int v55 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v34);
                CPMLLog::log(v55, CPML_LOG_ERR, "iterateFirst", "Encoding unsupported");
              }
              goto LABEL_22;
            }
            uint64_t v50 = *(void *)(v31 + 1);
            double v13 = 666.666;
            if (v50)
            {
              unint64_t v51 = (size_t *)(v31 + 9);
              do
              {
                size_t v53 = *v51;
                uint64_t v52 = (const char *)(v51 + 1);
                strlcpy(v36, v52, v53);
                int v54 = CPMLRemapper::remap(*((CPMLRemapper **)this + 7), v36, v5);
                CPMLFeatureVector::insertIntToLastVVClass(*((CPMLFeatureVector **)this + 6), v54);
                unint64_t v51 = (size_t *)&v52[v53];
                --v50;
              }
              while (v50);
              double v13 = (double)v54;
            }
          }
          else
          {
            int v40 = (char *)sqlite3_column_text(v30, v5);
            double v13 = (double)(int)CPMLRemapper::remap(*((CPMLRemapper **)this + 7), v40, v5);
            uint64_t v41 = *((void *)this + 8);
            if (*(unsigned char *)(v41 + 136)) {
              double v13 = v13 / (double)*(int *)(v41 + 120);
            }
          }
        }
        uint64_t v18 = *((void *)this + 8);
        if (*(_DWORD *)(*(void *)(v18 + 72) + 4 * v5) || *(unsigned char *)(v18 + 136)) {
          CPMLFeatureVector::insertRealVClass(*((CPMLFeatureVector **)this + 6), v13);
        }
        else {
          CPMLFeatureVector::insertIntVClass(*((CPMLFeatureVector **)this + 6), (int)v13);
        }
      }
LABEL_17:
      BOOL isOptionAvailable = CPMLTunableData::isOptionAvailable(*((CPMLTunableData **)this + 9), v5);
      if (v13 > 0.0 && isOptionAvailable) {
        char v6 = 0;
      }
LABEL_22:
      ++v5;
      uint64_t v4 = *((void *)this + 8);
    }
    while (v5 < *(int *)(v4 + 124));
    if (v6) {
      return *((void *)this + 6);
    }
  }
}

uint64_t CPMLIterator::iterateNext(CPMLIterator *this)
{
  return (*(uint64_t (**)(void))(*(void *)this + 24))();
}

uint64_t CPMLIterator::iterateReset(CPMLIterator *this)
{
  *((_DWORD *)this + 4) = 0;
  return sqlite3_reset(*((sqlite3_stmt **)this + 5));
}

void CPMLTunableData::CPMLTunableData(CPMLTunableData *this, void *a2, void *a3)
{
  uint64_t v5 = a2;
  this->var1 = (void *)[v5 objectForKey:@"tuneableDictionary"];
  char v6 = [v5 objectForKey:@"tuneableDictionary"];
  this->var0 = [v6 count];
  this->int var2 = a3;
}

void sub_214319424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *CPMLTunableData::getNSNumFrom(CPMLTunableData *this, const char *a2)
{
  if (!this->var1) {
    NSLog(&cfstr_SMdataEmpty.isa, "getNSNumFrom");
  }
  uint64_t v4 = (void *)[[NSString alloc] initWithCString:a2 encoding:4];
  uint64_t v5 = [this->var1 objectForKey:v4];

  return v5;
}

void sub_2143194D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CPMLTunableData::tDataGetBool(CPMLTunableData *this, const char *a2, BOOL *a3)
{
  uint64_t v4 = CPMLTunableData::getNSNumFrom(this, a2);
  *a3 = [v4 BOOLValue];

  return 0;
}

void sub_21431951C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CPMLTunableData::tDataGetInt(CPMLTunableData *this, const char *a2, int *a3)
{
  uint64_t v4 = CPMLTunableData::getNSNumFrom(this, a2);
  *a3 = [v4 intValue];

  return 0;
}

void sub_214319568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CPMLTunableData::tDataGetUInt(CPMLTunableData *this, const char *a2, unsigned int *a3)
{
  uint64_t v4 = CPMLTunableData::getNSNumFrom(this, a2);
  *a3 = [v4 unsignedIntValue];

  return 0;
}

void sub_2143195B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CPMLTunableData::tDataGetUInt64(CPMLTunableData *this, const char *a2, unint64_t *a3)
{
  uint64_t v4 = CPMLTunableData::getNSNumFrom(this, a2);
  *a3 = [v4 unsignedLongLongValue];

  return 0;
}

void sub_214319600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CPMLTunableData::tDataGetDouble(CPMLTunableData *this, const char *a2, double *a3)
{
  uint64_t v4 = CPMLTunableData::getNSNumFrom(this, a2);
  [v4 doubleValue];
  *(void *)a3 = v5;

  return 0;
}

void sub_21431964C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CPMLTunableData::tDataGetString(CPMLTunableData *this, const char *a2, char *a3, size_t a4)
{
  if (!this->var1) {
    NSLog(&cfstr_SMdataEmpty.isa, "tDataGetString");
  }
  int v8 = (void *)[[NSString alloc] initWithCString:a2 encoding:4];
  int v9 = [this->var1 objectForKey:v8];
  double v10 = v9;
  if (v9) {
    strlcpy(a3, (const char *)[v9 UTF8String], a4);
  }
  else {
    strlcpy(a3, "", 0);
  }

  return 0;
}

void sub_21431972C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CPMLTunableData::getNumberOfItems(CPMLTunableData *this)
{
  return this->var0;
}

BOOL CPMLTunableData::isOptionAvailable(CPMLTunableData *this, int a2)
{
  int v3 = this->var2;
  if ([v3 count] <= (unint64_t)a2)
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v4 = objc_msgSend(v3, "objectAtIndexedSubscript:");
    uint64_t v5 = [MEMORY[0x263EFF9D0] null];
    BOOL v6 = v4 != v5;
  }
  return v6;
}

void sub_2143197D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CPMLStatistics::allocateMemory(CPMLStatistics *this)
{
  std::vector<int>::reserve((std::vector<int> *)this + 3, *((int *)this + 31));
  std::vector<double>::reserve((void **)this + 3, *((int *)this + 31));
  std::vector<int>::reserve((std::vector<int> *)this, *((int *)this + 31));
  std::vector<int>::reserve((std::vector<int> *)this + 2, *((int *)this + 31));
  std::vector<double>::reserve((void **)this + 18, *((int *)this + 31));
  std::vector<int>::reserve((std::vector<int> *)this + 4, *((int *)this + 31));
  std::vector<double>::reserve((void **)this + 21, *((int *)this + 31));
  std::vector<double>::reserve((void **)this + 24, *((int *)this + 31));
  std::vector<double>::reserve((void **)this + 27, *((int *)this + 31));
  unint64_t v2 = *((int *)this + 31);

  std::vector<double>::reserve((void **)this + 30, v2);
}

void std::vector<int>::reserve(std::vector<int> *this, std::vector<int>::size_type __n)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  if (__n > value - this->__begin_)
  {
    if (__n >> 62) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (char *)this->__end_ - (char *)this->__begin_;
    BOOL v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)p_end_cap, __n);
    uint64_t v7 = (int *)&v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    int v9 = (int *)&v6[4 * v8];
    std::vector<int>::pointer begin = this->__begin_;
    std::vector<int>::pointer end = this->__end_;
    int v12 = v7;
    if (end != this->__begin_)
    {
      int v12 = v7;
      do
      {
        int v13 = *--end;
        *--int v12 = v13;
      }
      while (end != begin);
    }
    this->__begin_ = v12;
    this->__end_ = v7;
    this->__end_cap_.__value_ = v9;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

void std::vector<double>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    BOOL v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    int v9 = &v6[8 * v8];
    double v10 = (char *)*a1;
    int v11 = (char *)a1[1];
    int v12 = v7;
    if (v11 != *a1)
    {
      int v12 = v7;
      do
      {
        uint64_t v13 = *((void *)v11 - 1);
        v11 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
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

uint64_t CPMLStatistics::CPMLStatistics(uint64_t a1, int a2, int a3)
{
  *(_OWORD *)(a1 + 144) = 0u;
  *(void *)(a1 + 112) = 0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(void *)(a1 + 256) = 0;
  *(_DWORD *)(a1 + 124) = a2;
  *(unsigned char *)(a1 + 136) = a3 != 0;
  CPMLStatistics::allocateMemory((CPMLStatistics *)a1);
  return a1;
}

void sub_214319A54(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *(void **)(v1 + 240);
  if (v4)
  {
    *(void *)(v1 + 248) = v4;
    operator delete(v4);
  }
  int64_t v5 = *(void **)(v1 + 216);
  if (v5)
  {
    *(void *)(v1 + 224) = v5;
    operator delete(v5);
  }
  BOOL v6 = *(void **)(v1 + 192);
  if (v6)
  {
    *(void *)(v1 + 200) = v6;
    operator delete(v6);
  }
  uint64_t v7 = *(void **)(v1 + 168);
  if (v7)
  {
    *(void *)(v1 + 176) = v7;
    operator delete(v7);
  }
  uint64_t v8 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 152) = v8;
    operator delete(v8);
  }
  int v9 = *(void **)(v1 + 96);
  if (v9)
  {
    *(void *)(v1 + 104) = v9;
    operator delete(v9);
  }
  double v10 = *(void **)(v1 + 72);
  if (v10)
  {
    *(void *)(v1 + 80) = v10;
    operator delete(v10);
  }
  int v11 = *(void **)(v1 + 48);
  if (v11)
  {
    *(void *)(v1 + 56) = v11;
    operator delete(v11);
  }
  int v12 = *(void **)(v1 + 24);
  if (v12)
  {
    *(void *)(v1 + 32) = v12;
    operator delete(v12);
  }
  uint64_t v13 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v13;
    operator delete(v13);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CPMLStatistics::CPMLStatistics(uint64_t a1, void *a2, int a3)
{
  *(_OWORD *)(a1 + 48) = 0u;
  double v142 = (void **)(a1 + 48);
  *(_OWORD *)(a1 + 96) = 0u;
  double v143 = (void **)(a1 + 96);
  *(_OWORD *)(a1 + 144) = 0u;
  double v148 = (void **)(a1 + 144);
  *(_OWORD *)(a1 + 192) = 0u;
  v146 = (void **)(a1 + 192);
  *(_OWORD *)(a1 + 240) = 0u;
  double v144 = (void **)(a1 + 240);
  *(void *)(a1 + 112) = 0;
  double v141 = (void **)(a1 + 24);
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  int64_t v5 = (void **)(a1 + 72);
  uint64_t v147 = (void **)(a1 + 168);
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  v145 = (void **)(a1 + 216);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(void *)(a1 + 256) = 0;
  *(void *)(a1 + 264) = a2;
  id v6 = a2;
  *(_DWORD *)(a1 + 124) = [v6 getColumnCount];
  uint64_t v7 = [v6 getYColumnPosition];
  *(_DWORD *)(a1 + 128) = v7;
  *(_DWORD *)(a1 + 132) = [v6 getCombinedRemapTableCardinality:v7];
  *(_DWORD *)(a1 + 120) = [v6 getRowCount];
  *(unsigned char *)(a1 + 136) = a3 != 0;
  CPMLStatistics::allocateMemory((CPMLStatistics *)a1);
  int v8 = *(_DWORD *)(a1 + 124);
  if (v8 >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      int v10 = [v6 isColumnContinousData:v9];
      int v11 = v10;
      uint64_t v13 = *(char **)(a1 + 80);
      unint64_t v12 = *(void *)(a1 + 88);
      if ((unint64_t)v13 >= v12)
      {
        float v15 = (char *)*v5;
        uint64_t v16 = (v13 - (unsigned char *)*v5) >> 2;
        unint64_t v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 62) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v18 = v12 - (void)v15;
        if (v18 >> 1 > v17) {
          unint64_t v17 = v18 >> 1;
        }
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v19 = v17;
        }
        if (v19)
        {
          int v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(a1 + 88, v19);
          float v15 = *(char **)(a1 + 72);
          uint64_t v13 = *(char **)(a1 + 80);
        }
        else
        {
          int v20 = 0;
        }
        int v21 = &v20[4 * v16];
        *(_DWORD *)int v21 = v11;
        int v14 = v21 + 4;
        while (v13 != v15)
        {
          int v22 = *((_DWORD *)v13 - 1);
          v13 -= 4;
          *((_DWORD *)v21 - 1) = v22;
          v21 -= 4;
        }
        *(void *)(a1 + 72) = v21;
        *(void *)(a1 + 80) = v14;
        *(void *)(a1 + 88) = &v20[4 * v19];
        if (v15) {
          operator delete(v15);
        }
      }
      else
      {
        *(_DWORD *)uint64_t v13 = v10;
        int v14 = v13 + 4;
      }
      *(void *)(a1 + 80) = v14;
      uint64_t v9 = (v9 + 1);
      int v8 = *(_DWORD *)(a1 + 124);
    }
    while ((int)v9 < v8);
  }
  if (v8)
  {
    unint64_t v23 = 0;
    uint64_t v140 = a1 + 16;
    do
    {
      unint64_t v24 = objc_msgSend(v6, "getCardinality:", v23, v140);
      if ([v6 getSchemaType:v23] == 7)
      {
        uint64_t v26 = *(char **)(a1 + 56);
        unint64_t v25 = *(void *)(a1 + 64);
        if ((unint64_t)v26 >= v25)
        {
          uint64_t v32 = (char *)*v142;
          uint64_t v33 = (v26 - (unsigned char *)*v142) >> 2;
          unint64_t v34 = v33 + 1;
          if ((unint64_t)(v33 + 1) >> 62) {
            std::vector<double>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v35 = v25 - (void)v32;
          if (v35 >> 1 > v34) {
            unint64_t v34 = v35 >> 1;
          }
          if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v36 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v36 = v34;
          }
          if (v36)
          {
            int v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(a1 + 64, v36);
            uint64_t v32 = *(char **)(a1 + 48);
            uint64_t v26 = *(char **)(a1 + 56);
          }
          else
          {
            int v37 = 0;
          }
          unint64_t v44 = &v37[4 * v33];
          *(_DWORD *)unint64_t v44 = v24;
          uint64_t v27 = v44 + 4;
          while (v26 != v32)
          {
            int v45 = *((_DWORD *)v26 - 1);
            v26 -= 4;
            *((_DWORD *)v44 - 1) = v45;
            v44 -= 4;
          }
          *(void *)(a1 + 48) = v44;
          *(void *)(a1 + 56) = v27;
          *(void *)(a1 + 64) = &v37[4 * v36];
          if (v32) {
            operator delete(v32);
          }
        }
        else
        {
          *(_DWORD *)uint64_t v26 = v24;
          uint64_t v27 = v26 + 4;
        }
        *(void *)(a1 + 56) = v27;
      }
      else if (*((_DWORD *)*v5 + v23) || *(unsigned char *)(a1 + 136))
      {
        double v28 = (double)v24;
        BOOL v30 = *(double **)(a1 + 32);
        unint64_t v29 = *(void *)(a1 + 40);
        if ((unint64_t)v30 >= v29)
        {
          int v38 = (double *)*v141;
          uint64_t v39 = ((char *)v30 - (unsigned char *)*v141) >> 3;
          unint64_t v40 = v39 + 1;
          if ((unint64_t)(v39 + 1) >> 61) {
            std::vector<double>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v41 = v29 - (void)v38;
          if (v41 >> 2 > v40) {
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
            uint64_t v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a1 + 40, v42);
            int v38 = *(double **)(a1 + 24);
            BOOL v30 = *(double **)(a1 + 32);
          }
          else
          {
            uint64_t v43 = 0;
          }
          size_t v46 = (double *)&v43[8 * v39];
          *size_t v46 = v28;
          uint64_t v31 = v46 + 1;
          while (v30 != v38)
          {
            uint64_t v47 = *((void *)v30-- - 1);
            *((void *)v46-- - 1) = v47;
          }
          *(void *)(a1 + 24) = v46;
          *(void *)(a1 + 32) = v31;
          *(void *)(a1 + 40) = &v43[8 * v42];
          if (v38) {
            operator delete(v38);
          }
        }
        else
        {
          *BOOL v30 = v28;
          uint64_t v31 = v30 + 1;
        }
        *(void *)(a1 + 32) = v31;
      }
      else
      {
        uint64_t v129 = *(_DWORD **)(a1 + 8);
        unint64_t v128 = *(void *)(a1 + 16);
        if ((unint64_t)v129 >= v128)
        {
          v131 = *(_DWORD **)a1;
          uint64_t v132 = ((uint64_t)v129 - *(void *)a1) >> 2;
          unint64_t v133 = v132 + 1;
          if ((unint64_t)(v132 + 1) >> 62) {
            std::vector<double>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v134 = v128 - (void)v131;
          if (v134 >> 1 > v133) {
            unint64_t v133 = v134 >> 1;
          }
          if ((unint64_t)v134 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v135 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v135 = v133;
          }
          if (v135)
          {
            double v136 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v140, v135);
            v131 = *(_DWORD **)a1;
            uint64_t v129 = *(_DWORD **)(a1 + 8);
          }
          else
          {
            double v136 = 0;
          }
          double v137 = &v136[4 * v132];
          *(_DWORD *)double v137 = v24;
          double v130 = v137 + 4;
          while (v129 != v131)
          {
            int v138 = *--v129;
            *((_DWORD *)v137 - 1) = v138;
            v137 -= 4;
          }
          *(void *)a1 = v137;
          *(void *)(a1 + 8) = v130;
          *(void *)(a1 + 16) = &v136[4 * v135];
          if (v131) {
            operator delete(v131);
          }
        }
        else
        {
          *uint64_t v129 = v24;
          double v130 = v129 + 1;
        }
        *(void *)(a1 + 8) = v130;
      }
      double v48 = (double)v24;
      uint64_t v50 = *(double **)(a1 + 152);
      unint64_t v49 = *(void *)(a1 + 160);
      if ((unint64_t)v50 >= v49)
      {
        uint64_t v52 = (double *)*v148;
        uint64_t v53 = ((char *)v50 - (unsigned char *)*v148) >> 3;
        unint64_t v54 = v53 + 1;
        if ((unint64_t)(v53 + 1) >> 61) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v55 = v49 - (void)v52;
        if (v55 >> 2 > v54) {
          unint64_t v54 = v55 >> 2;
        }
        if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v56 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v56 = v54;
        }
        if (v56)
        {
          unint64_t v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a1 + 160, v56);
          uint64_t v52 = *(double **)(a1 + 144);
          uint64_t v50 = *(double **)(a1 + 152);
        }
        else
        {
          unint64_t v57 = 0;
        }
        int v58 = (double *)&v57[8 * v53];
        *int v58 = v48;
        unint64_t v51 = v58 + 1;
        while (v50 != v52)
        {
          uint64_t v59 = *((void *)v50-- - 1);
          *((void *)v58-- - 1) = v59;
        }
        *(void *)(a1 + 144) = v58;
        *(void *)(a1 + 152) = v51;
        *(void *)(a1 + 160) = &v57[8 * v56];
        if (v52) {
          operator delete(v52);
        }
      }
      else
      {
        *uint64_t v50 = v48;
        unint64_t v51 = v50 + 1;
      }
      *(void *)(a1 + 152) = v51;
      [v6 getMeanFor:v23];
      uint64_t v61 = v60;
      uint64_t v63 = *(char **)(a1 + 176);
      unint64_t v62 = *(void *)(a1 + 184);
      if ((unint64_t)v63 >= v62)
      {
        double v65 = (char *)*v147;
        uint64_t v66 = (v63 - (unsigned char *)*v147) >> 3;
        unint64_t v67 = v66 + 1;
        if ((unint64_t)(v66 + 1) >> 61) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v68 = v62 - (void)v65;
        if (v68 >> 2 > v67) {
          unint64_t v67 = v68 >> 2;
        }
        if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v69 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v69 = v67;
        }
        if (v69)
        {
          uint64_t v70 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a1 + 184, v69);
          double v65 = *(char **)(a1 + 168);
          uint64_t v63 = *(char **)(a1 + 176);
        }
        else
        {
          uint64_t v70 = 0;
        }
        int v71 = &v70[8 * v66];
        *(void *)int v71 = v61;
        unint64_t v64 = v71 + 8;
        while (v63 != v65)
        {
          uint64_t v72 = *((void *)v63 - 1);
          v63 -= 8;
          *((void *)v71 - 1) = v72;
          v71 -= 8;
        }
        *(void *)(a1 + 168) = v71;
        *(void *)(a1 + 176) = v64;
        *(void *)(a1 + 184) = &v70[8 * v69];
        if (v65) {
          operator delete(v65);
        }
      }
      else
      {
        *(void *)uint64_t v63 = v60;
        unint64_t v64 = v63 + 8;
      }
      *(void *)(a1 + 176) = v64;
      [v6 getStdDevFor:v23];
      uint64_t v74 = v73;
      uint64_t v76 = *(char **)(a1 + 200);
      unint64_t v75 = *(void *)(a1 + 208);
      if ((unint64_t)v76 >= v75)
      {
        uint64_t v78 = (char *)*v146;
        uint64_t v79 = (v76 - (unsigned char *)*v146) >> 3;
        unint64_t v80 = v79 + 1;
        if ((unint64_t)(v79 + 1) >> 61) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v81 = v75 - (void)v78;
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
          double v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a1 + 208, v82);
          uint64_t v78 = *(char **)(a1 + 192);
          uint64_t v76 = *(char **)(a1 + 200);
        }
        else
        {
          double v83 = 0;
        }
        double v84 = &v83[8 * v79];
        *(void *)double v84 = v74;
        uint64_t v77 = v84 + 8;
        while (v76 != v78)
        {
          uint64_t v85 = *((void *)v76 - 1);
          v76 -= 8;
          *((void *)v84 - 1) = v85;
          v84 -= 8;
        }
        *(void *)(a1 + 192) = v84;
        *(void *)(a1 + 200) = v77;
        *(void *)(a1 + 208) = &v83[8 * v82];
        if (v78) {
          operator delete(v78);
        }
      }
      else
      {
        *(void *)uint64_t v76 = v73;
        uint64_t v77 = v76 + 8;
      }
      *(void *)(a1 + 200) = v77;
      [v6 getMinFor:v23];
      uint64_t v87 = v86;
      uint64_t v89 = *(char **)(a1 + 224);
      unint64_t v88 = *(void *)(a1 + 232);
      if ((unint64_t)v89 >= v88)
      {
        uint64_t v91 = (char *)*v145;
        uint64_t v92 = (v89 - (unsigned char *)*v145) >> 3;
        unint64_t v93 = v92 + 1;
        if ((unint64_t)(v92 + 1) >> 61) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v94 = v88 - (void)v91;
        if (v94 >> 2 > v93) {
          unint64_t v93 = v94 >> 2;
        }
        if ((unint64_t)v94 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v95 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v95 = v93;
        }
        if (v95)
        {
          uint64_t v96 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a1 + 232, v95);
          uint64_t v91 = *(char **)(a1 + 216);
          uint64_t v89 = *(char **)(a1 + 224);
        }
        else
        {
          uint64_t v96 = 0;
        }
        uint64_t v97 = &v96[8 * v92];
        *(void *)uint64_t v97 = v87;
        uint64_t v90 = v97 + 8;
        while (v89 != v91)
        {
          uint64_t v98 = *((void *)v89 - 1);
          v89 -= 8;
          *((void *)v97 - 1) = v98;
          v97 -= 8;
        }
        *(void *)(a1 + 216) = v97;
        *(void *)(a1 + 224) = v90;
        *(void *)(a1 + 232) = &v96[8 * v95];
        if (v91) {
          operator delete(v91);
        }
      }
      else
      {
        *(void *)uint64_t v89 = v86;
        uint64_t v90 = v89 + 8;
      }
      *(void *)(a1 + 224) = v90;
      [v6 getMaxFor:v23];
      uint64_t v100 = v99;
      int v102 = *(char **)(a1 + 248);
      unint64_t v101 = *(void *)(a1 + 256);
      if ((unint64_t)v102 >= v101)
      {
        int v104 = (char *)*v144;
        uint64_t v105 = (v102 - (unsigned char *)*v144) >> 3;
        unint64_t v106 = v105 + 1;
        if ((unint64_t)(v105 + 1) >> 61) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v107 = v101 - (void)v104;
        if (v107 >> 2 > v106) {
          unint64_t v106 = v107 >> 2;
        }
        if ((unint64_t)v107 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v108 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v108 = v106;
        }
        if (v108)
        {
          v109 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a1 + 256, v108);
          int v104 = *(char **)(a1 + 240);
          int v102 = *(char **)(a1 + 248);
        }
        else
        {
          v109 = 0;
        }
        uint64_t v110 = &v109[8 * v105];
        *(void *)uint64_t v110 = v100;
        unsigned int v103 = v110 + 8;
        while (v102 != v104)
        {
          uint64_t v111 = *((void *)v102 - 1);
          v102 -= 8;
          *((void *)v110 - 1) = v111;
          v110 -= 8;
        }
        *(void *)(a1 + 240) = v110;
        *(void *)(a1 + 248) = v103;
        *(void *)(a1 + 256) = &v109[8 * v108];
        if (v104) {
          operator delete(v104);
        }
      }
      else
      {
        *(void *)int v102 = v99;
        unsigned int v103 = v102 + 8;
      }
      *(void *)(a1 + 248) = v103;
      uint64_t v112 = [v6 getRemapTable];
      uint64_t v113 = [v112 objectAtIndex:v23];
      uint64_t v114 = v113;
      if (v113)
      {
        int v115 = [v113 intValue];
        int v116 = v115;
        double v118 = *(char **)(a1 + 104);
        unint64_t v117 = *(void *)(a1 + 112);
        if ((unint64_t)v118 >= v117)
        {
          double v120 = (char *)*v143;
          uint64_t v121 = (v118 - (unsigned char *)*v143) >> 2;
          unint64_t v122 = v121 + 1;
          if ((unint64_t)(v121 + 1) >> 62) {
            std::vector<double>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v123 = v117 - (void)v120;
          if (v123 >> 1 > v122) {
            unint64_t v122 = v123 >> 1;
          }
          if ((unint64_t)v123 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v124 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v124 = v122;
          }
          if (v124)
          {
            double v125 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(a1 + 112, v124);
            double v120 = *(char **)(a1 + 96);
            double v118 = *(char **)(a1 + 104);
          }
          else
          {
            double v125 = 0;
          }
          double v126 = &v125[4 * v121];
          *(_DWORD *)double v126 = v116;
          double v119 = v126 + 4;
          while (v118 != v120)
          {
            int v127 = *((_DWORD *)v118 - 1);
            v118 -= 4;
            *((_DWORD *)v126 - 1) = v127;
            v126 -= 4;
          }
          *(void *)(a1 + 96) = v126;
          *(void *)(a1 + 104) = v119;
          *(void *)(a1 + 112) = &v125[4 * v124];
          if (v120) {
            operator delete(v120);
          }
        }
        else
        {
          *(_DWORD *)double v118 = v115;
          double v119 = v118 + 4;
        }
        *(void *)(a1 + 104) = v119;
      }

      ++v23;
    }
    while (v23 < *(unsigned int *)(a1 + 124));
  }

  return a1;
}

void sub_21431A444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, void **a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void **a20,void **a21,void **a22,void **a23,void **a24)
{
  unint64_t v29 = *a21;
  if (*a21)
  {
    *(void *)(v24 + 248) = v29;
    operator delete(v29);
  }
  BOOL v30 = *a22;
  if (*a22)
  {
    *(void *)(v24 + 224) = v30;
    operator delete(v30);
  }
  uint64_t v31 = *a23;
  if (*a23)
  {
    *(void *)(v24 + 200) = v31;
    operator delete(v31);
  }
  uint64_t v32 = *a24;
  if (*a24)
  {
    *(void *)(v24 + 176) = v32;
    operator delete(v32);
  }
  uint64_t v33 = **(void ***)(v27 - 112);
  if (v33)
  {
    *(void *)(v24 + 152) = v33;
    operator delete(v33);
  }
  unint64_t v34 = *a20;
  if (*a20)
  {
    *(void *)(v24 + 104) = v34;
    operator delete(v34);
  }
  uint64_t v35 = *v26;
  if (*v26)
  {
    *(void *)(v24 + 80) = v35;
    operator delete(v35);
  }
  unint64_t v36 = *a14;
  if (*a14)
  {
    *(void *)(v24 + 56) = v36;
    operator delete(v36);
  }
  int v37 = *a13;
  if (*a13)
  {
    *(void *)(v24 + 32) = v37;
    operator delete(v37);
  }
  int v38 = *(void **)v24;
  if (*(void *)v24)
  {
    *(void *)(v24 + 8) = v38;
    operator delete(v38);
  }
  _Unwind_Resume(a1);
}

void CPMLStatistics::~CPMLStatistics(CPMLStatistics *this)
{
  unint64_t v2 = (void *)*((void *)this + 30);
  if (v2)
  {
    *((void *)this + 31) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 27);
  if (v3)
  {
    *((void *)this + 28) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 24);
  if (v4)
  {
    *((void *)this + 25) = v4;
    operator delete(v4);
  }
  int64_t v5 = (void *)*((void *)this + 21);
  if (v5)
  {
    *((void *)this + 22) = v5;
    operator delete(v5);
  }
  id v6 = (void *)*((void *)this + 18);
  if (v6)
  {
    *((void *)this + 19) = v6;
    operator delete(v6);
  }
  uint64_t v7 = (void *)*((void *)this + 12);
  if (v7)
  {
    *((void *)this + 13) = v7;
    operator delete(v7);
  }
  int v8 = (void *)*((void *)this + 9);
  if (v8)
  {
    *((void *)this + 10) = v8;
    operator delete(v8);
  }
  uint64_t v9 = (void *)*((void *)this + 6);
  if (v9)
  {
    *((void *)this + 7) = v9;
    operator delete(v9);
  }
  int v10 = (void *)*((void *)this + 3);
  if (v10)
  {
    *((void *)this + 4) = v10;
    operator delete(v10);
  }
  int v11 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v11;
    operator delete(v11);
  }
}

void CPMLStatistics::updateAllColumnTypeToReal(CPMLStatistics *this)
{
  id v2 = *((id *)this + 33);
  if (*((_DWORD *)this + 31))
  {
    unint64_t v3 = 0;
    id v5 = v2;
    do
    {
      *(_DWORD *)(*((void *)this + 9) + 4 * v3) = 1;
      unint64_t v4 = [v2 getCardinality:v3];
      if ([v5 getSchemaType:v3] != 7) {
        *(double *)(*((void *)this + 3) + 8 * v3) = (double)v4;
      }
      ++v3;
      id v2 = v5;
    }
    while (v3 < *((unsigned int *)this + 31));
  }
}

void sub_21431A6F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *CPKNNClassfier::initializeNaiveKNNMemory(CPKNNClassfier *this)
{
  double result = malloc_type_calloc(*((void *)this + 15), 8 * *((void *)this + 16) + 8, 0x100004000313F17uLL);
  *((void *)this + 14) = result;
  return result;
}

void CPKNNClassfier::CPKNNClassfier(CPKNNClassfier *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, a2, a3, a4);
  *(void *)uint64_t v5 = &unk_26C50FB58;
  strcpy((char *)(v5 + 8), "1.0.0");
  *(unsigned char *)(v5 + 244) = 0;
  uint64_t v6 = *((void *)a2->var0 + 15);
  *(void *)&long long v7 = (int)v6;
  *((void *)&v7 + 1) = SHIDWORD(v6);
  *(_OWORD *)(v5 + 120) = v7;
  *(_OWORD *)(v5 + 96) = xmmword_214354390;
  CPMLCDB::getIterator();
}

void sub_21431A80C(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPKNNClassfier::CPKNNClassfier(CPKNNClassfier *this, CPMLSerialization *a2, CPMLTunableData *a3)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, a2, a3);
  *(void *)uint64_t v6 = &unk_26C50FB58;
  *(unsigned char *)(v6 + 244) = 1;
  if ((int)CPMLTunableData::getNumberOfItems(a3) < 1)
  {
    *((void *)this + 17) = 1;
    strlcpy((char *)this + 144, "/tmp/knn_buffer", 0x64uLL);
  }
  else
  {
    CPMLTunableData::tDataGetUInt64(a3, "kthValue", (unint64_t *)this + 17);
    CPMLTunableData::tDataGetString(a3, "cacheFileName", (char *)this + 144, 0x64uLL);
  }
  if (((*((uint64_t (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 13))(a2, (char *)this + 8, "version", 5, 0) & 0x80000000) != 0)strcpy((char *)this + 8, "1.0.0"); {
  if (((*((uint64_t (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 96, "totalDataCount", 1, 0) & 0x80000000) != 0)*((void *)this + 12) = 0;
  }
  long long v7 = (void *)((char *)this + 128);
  if (((*((uint64_t (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 128, "totalCols", 1, 0) & 0x80000000) != 0)*long long v7 = 0; {
  int v8 = (uint64_t *)((char *)this + 120);
  }
  if (((*((uint64_t (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 120, "totalRows", 1, 0) & 0x80000000) != 0)*int v8 = 0; {
  if (((*((uint64_t (**)(CPMLSerialization *, char *, const char *, uint64_t, uint64_t))a2->var0 + 10))(a2, (char *)this + 104, "KNNDistanceType", 1, 1) & 0x80000000) != 0)*((void *)this + 13) = 1;
  }
  if (!*v7)
  {
    uint64_t v9 = sqlite3_mprintf("select cptrainColumns from cptrainColumns;");
    (*((void (**)(CPMLSerialization *, char *, char *))a2->var0 + 24))(a2, (char *)this + 128, v9);
    if (v9) {
      sqlite3_free(v9);
    }
  }
  if (a2->var1)
  {
    int v10 = (void **)((char *)this + 112);
    if ((*((unsigned int (**)(CPMLSerialization *, char *, char *, void))a2->var0 + 32))(a2, (char *)this + 144, (char *)this + 112, (8 * (*((_DWORD *)this + 30) + *((_DWORD *)this + 30) * *((_DWORD *)this + 32)))))
    {
      *((unsigned char *)this + 244) = 0;
      *int v10 = malloc_type_calloc(*((void *)this + 15), 8 * *((void *)this + 16) + 8, 0x100004000313F17uLL);
      if (((*((uint64_t (**)(CPMLSerialization *))a2->var0 + 12))(a2) & 0x80000000) != 0)
      {
        uint64_t v12 = *v8;
        uint64_t v13 = *v7 + 1;
        int v11 = *v10;
        if (v13 * v12) {
          bzero(v11, 8 * v13 * v12);
        }
      }
      else
      {
        int v11 = *v10;
        uint64_t v12 = *v8;
        uint64_t v13 = *v7 + 1;
      }
      (*((void (**)(CPMLSerialization *, char *, void *, void))a2->var0 + 31))(a2, (char *)this + 144, v11, (8 * v12 * v13));
    }
  }
  else
  {
    *((void *)this + 14) = 0;
  }
}

void sub_21431AC04(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPKNNClassfier::~CPKNNClassfier(void **this)
{
  *this = &unk_26C50FB58;
  if (!*((unsigned char *)this + 244) && *((unsigned char *)this[11] + 8)) {
    free(this[14]);
  }

  CPModelClose(this);
}

{
  uint64_t vars8;

  CPKNNClassfier::~CPKNNClassfier(this);

  JUMPOUT(0x21669DB80);
}

uint64_t CPKNNClassfier::serialize(CPKNNClassfier *this)
{
  uint64_t v2 = *((void *)this + 11);
  unint64_t v3 = (char *)this + 8;
  size_t v4 = strlen((const char *)this + 8);
  (*(void (**)(uint64_t, char *, const char *, size_t, void))(*(void *)v2 + 56))(v2, v3, "version", v4, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 96, "totalDataCount", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 128, "totalCols", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 120, "totalRows", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 104, "KNNDistanceType", 1, 0);
  (*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 14), "KNNDataTable", *((void *)this + 15) + *((void *)this + 15) * *((void *)this + 16), 0);
  return 0;
}

uint64_t CPKNNClassfier::train(CPKNNClassfier *this)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
  if (v2)
  {
    unint64_t v3 = (CPMLFeatureVector *)v2;
    do
    {
      IntVector = (int **)CPMLFeatureVector::getIntVector(v3);
      uint64_t v5 = *IntVector;
      uint64_t v6 = (char *)IntVector[1] - (char *)*IntVector;
      if (v6)
      {
        unint64_t v7 = v6 >> 2;
        if (v7 <= 1) {
          unint64_t v7 = 1;
        }
        int v8 = (double *)(*((void *)this + 14)
                      + 8 * (*((void *)this + 12) + *((void *)this + 12) * *((void *)this + 16)));
        do
        {
          int v9 = *v5++;
          *v8++ = (double)v9;
          --v7;
        }
        while (v7);
      }
      uint64_t RealVector = CPMLFeatureVector::getRealVector(v3);
      int v11 = *(uint64_t **)RealVector;
      uint64_t v12 = *(void *)(RealVector + 8) - *(void *)RealVector;
      if (v12)
      {
        unint64_t v13 = v12 >> 3;
        if (v13 <= 1) {
          unint64_t v13 = 1;
        }
        int v14 = (void *)(*((void *)this + 14)
                       + 8 * (*((void *)this + 12) + *((void *)this + 12) * *((void *)this + 16))
                       + 2 * ((char *)IntVector[1] - (char *)*IntVector));
        do
        {
          uint64_t v15 = *v11++;
          *v14++ = v15;
          --v13;
        }
        while (v13);
      }
      double YHat = CPMLFeatureVector::getYHat(v3);
      uint64_t v17 = *((void *)this + 12);
      uint64_t v18 = *((void *)this + 15);
      *(double *)(*((void *)this + 14)
                + 8
                * (v17
                 + v17 * *((void *)this + 16)
                 + ((*(void *)(RealVector + 8) - *(void *)RealVector) >> 3)
                 + ((unint64_t)((char *)IntVector[1] - (char *)*IntVector) >> 2))) = YHat;
      *((void *)this + 15) = v18 + 1;
      *((void *)this + 12) = v17 + 1;
      unint64_t v3 = (CPMLFeatureVector *)(*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
    }
    while (v3);
  }
  return 0;
}

uint64_t CPKNNClassfier::eval(uint64_t a1, CPMLFeatureVector *a2)
{
  v57[1] = *MEMORY[0x263EF8340];
  size_t v4 = (double *)malloc_type_calloc(8 * *(void *)(a1 + 96), 1uLL, 0x5DFF3921uLL);
  unint64_t v56 = (double *)malloc_type_calloc(8 * *(void *)(a1 + 128), 1uLL, 0x8486955uLL);
  uint64_t v5 = malloc_type_calloc(8 * *(void *)(a1 + 136), 1uLL, 0x66C3D14FuLL);
  uint64_t v6 = (int *)malloc_type_calloc(4 * *(void *)(a1 + 136), 1uLL, 0x1E5D2B32uLL);
  unint64_t v7 = v6;
  uint64_t v8 = *(void *)(a1 + 136);
  if (v8)
  {
    int v9 = v6;
    int v10 = v5;
    do
    {
      *v9++ = -1;
      *v10++ = 0x7FEFFFFFFFFFFFFFLL;
      --v8;
    }
    while (v8);
  }
  IntVector = (int **)CPMLFeatureVector::getIntVector(a2);
  uint64_t v12 = *IntVector;
  uint64_t v13 = (char *)IntVector[1] - (char *)*IntVector;
  if (v13)
  {
    unint64_t v14 = v13 >> 2;
    if (v14 <= 1) {
      unint64_t v14 = 1;
    }
    uint64_t v15 = v56;
    do
    {
      int v16 = *v12++;
      *v15++ = (double)v16;
      --v14;
    }
    while (v14);
  }
  uint64_t RealVector = CPMLFeatureVector::getRealVector(a2);
  unint64_t v19 = (void *)RealVector;
  int v20 = *(uint64_t **)RealVector;
  uint64_t v21 = *(void *)(RealVector + 8) - *(void *)RealVector;
  if (v21)
  {
    unint64_t v22 = v21 >> 3;
    if (v22 <= 1) {
      unint64_t v22 = 1;
    }
    unint64_t v23 = (char *)v56 + 2 * ((char *)IntVector[1] - (char *)*IntVector);
    do
    {
      uint64_t v24 = *v20++;
      *(void *)unint64_t v23 = v24;
      v23 += 8;
      --v22;
    }
    while (v22);
  }
  uint64_t v55 = a2;
  if (*(void *)(a1 + 96))
  {
    uint64_t v25 = 0;
    unint64_t v26 = 0;
    do
    {
      if (*(unsigned char *)(*(void *)(a1 + 88) + 8))
      {
        uint64_t v27 = *(void *)(a1 + 128);
        if (v27)
        {
          double v28 = (double *)(*(void *)(a1 + 112) + v25 * (v27 + 1));
          double v29 = 0.0;
          BOOL v30 = v56;
          do
          {
            double v31 = *v30++;
            double v32 = v31;
            double v33 = *v28++;
            double v29 = v29 + (v32 - v33) * (v32 - v33);
            --v27;
          }
          while (v27);
        }
        else
        {
          double v29 = 0.0;
        }
      }
      else
      {
        MEMORY[0x270FA5388](RealVector, v18);
        uint64_t v35 = (double *)((char *)&v55 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0));
        uint64_t RealVector = (*(uint64_t (**)(void, double *, uint64_t, const char *, const char *, void))(**(void **)(a1 + 88) + 152))(*(void *)(a1 + 88), v35, *(void *)(a1 + 128) + 1, "KNNDataTable", "KNNDataTable", (v26 * (*(_DWORD *)(a1 + 128) + 1)));
        uint64_t v36 = *(void *)(a1 + 128);
        if (v36)
        {
          double v29 = 0.0;
          int v37 = v56;
          do
          {
            double v38 = *v37++;
            double v39 = v38;
            double v40 = *v35++;
            double v29 = v29 + (v39 - v40) * (v39 - v40);
            --v36;
          }
          while (v36);
        }
        else
        {
          double v29 = 0.0;
        }
      }
      v4[v26] = sqrt(v29);
      unint64_t v41 = *(void *)(a1 + 136);
      if (v41)
      {
        double v42 = v4[v26];
        uint64_t v43 = (double *)v5;
        unint64_t v44 = v7;
        uint64_t v45 = *(void *)(a1 + 136);
        int v46 = v26;
        do
        {
          double v47 = *v43;
          if (v42 < *v43)
          {
            double *v43 = v42;
            v4[v26] = v47;
            int v48 = *v44;
            *unint64_t v44 = v46;
            int v46 = v48;
            double v42 = v47;
          }
          ++v44;
          ++v43;
          --v45;
        }
        while (v45);
      }
      ++v26;
      v25 += 8;
    }
    while (*(void *)(a1 + 96) > v26);
  }
  else
  {
    unint64_t v41 = *(void *)(a1 + 136);
  }
  if (v41)
  {
    unint64_t v49 = 0;
    double v50 = 0.0;
    do
    {
      unint64_t v51 = *(unsigned char **)(a1 + 88);
      if (v51[8])
      {
        double v52 = (double)(int)*(double *)(*(void *)(a1 + 112)
                                     + 8
                                     * (v7[v49]
                                      + v7[v49] * *(void *)(a1 + 128)
                                      + ((v19[1] - *v19) >> 3)
                                      + ((unint64_t)((char *)IntVector[1] - (char *)*IntVector) >> 2)));
      }
      else
      {
        (*(void (**)(unsigned char *, void *, uint64_t, const char *, const char *, void))(*(void *)v51 + 152))(v51, v57, 1, "KNNDataTable", "KNNDataTable", ((v19[1] - *v19) >> 3)+ ((unint64_t)((char *)IntVector[1] - (char *)*IntVector) >> 2)+ v7[v49]+ v7[v49] * *(_DWORD *)(a1 + 128));
        double v52 = *(double *)v57;
        unint64_t v41 = *(void *)(a1 + 136);
      }
      double v50 = v50 + v52;
      ++v49;
    }
    while (v49 < v41);
  }
  else
  {
    double v50 = 0.0;
  }
  double v53 = 1.0;
  if (v50 / (double)v41 < 0.5) {
    double v53 = 0.0;
  }
  CPMLFeatureVector::setYHat((uint64_t)v55, v53);
  free(v7);
  free(v5);
  free(v4);
  free(v56);
  return 0;
}

void CPKNNClassfier::update(CPKNNClassfier *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
}

uint64_t CPKNNClassfier::errorString(CPKNNClassfier *this)
{
  return 0;
}

uint64_t CPMLAlgorithm::requireRealOnly(CPMLAlgorithm *this)
{
  return 0;
}

void CPMLNaiveBayesClassifier::CPMLNaiveBayesClassifier(CPMLNaiveBayesClassifier *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, a2, a3, a4);
  *(void *)uint64_t v5 = &unk_26C5100D0;
  *(_OWORD *)(v5 + 176) = 0u;
  *(_OWORD *)(v5 + 192) = 0u;
  *(_OWORD *)(v5 + 208) = 0u;
  *(void *)(v5 + 376) = 0;
  *(void *)(v5 + 384) = 0;
  strcpy((char *)(v5 + 8), "1.0.1");
  *(void *)(v5 + 112) = 0;
  var0 = a2->var0;
  *(void *)(v5 + 96) = *((int *)a2->var0 + 31);
  uint64_t v7 = *((int *)var0 + 33);
  *(void *)(v5 + 104) = v7;
  *(void *)(v5 + 120) = (uint64_t)(*((void *)var0 + 4) - *((void *)var0 + 3)) >> 3;
  uint64_t v8 = *(void *)var0;
  *(void *)(v5 + 128) = (uint64_t)(*((void *)var0 + 1) - *(void *)var0) >> 2;
  *(void *)(v5 + 136) = v8;
  *(void *)(v5 + 144) = v7;
  *(void *)(v5 + 152) = (uint64_t)(*((void *)var0 + 7) - *((void *)var0 + 6)) >> 2;
  CPMLCDB::getIterator();
}

void sub_21431BBCC(_Unwind_Exception *a1)
{
  size_t v4 = (void *)v1[25];
  if (v4)
  {
    v1[26] = v4;
    operator delete(v4);
  }
  uint64_t v5 = *v2;
  if (*v2)
  {
    v1[23] = v5;
    operator delete(v5);
  }
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPMLNaiveBayesClassifier::setTunableData(CPMLNaiveBayesClassifier *this, CPMLTunableData *a2)
{
  size_t v4 = (_OWORD *)((char *)this + 344);
  if ((int)CPMLTunableData::getNumberOfItems(a2) < 2)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *size_t v4 = _Q0;
    *((_DWORD *)this + 84) = 1;
    *((void *)this + 45) = 0x3CD203AF9EE75616;
    *((_WORD *)this + 112) = 0;
    *((void *)this + 41) = 20;
    strcpy((char *)this + 226, "defaultNBV3b");
  }
  else
  {
    CPMLTunableData::tDataGetInt(a2, "k", (int *)this + 82);
    CPMLTunableData::tDataGetDouble(a2, "decayRate", (double *)this + 43);
    CPMLTunableData::tDataGetDouble(a2, "smoothRate", (double *)this + 44);
    CPMLTunableData::tDataGetInt(a2, "smoothMode", (int *)this + 84);
    CPMLTunableData::tDataGetDouble(a2, "epsilonRate", (double *)this + 45);
    CPMLTunableData::tDataGetBool(a2, "enableLogging", (BOOL *)this + 225);
    CPMLTunableData::tDataGetString(a2, "logFilename", (char *)this + 226, 0x64uLL);
    CPMLTunableData::tDataGetBool(a2, "dataCollection", (BOOL *)this + 224);
    CPMLTunableData::tDataGetInt(a2, "nbAdatorVersion", (int *)this + 83);
  }
  operator new();
}

void sub_21431BF28(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x10B1C40E26776D8);
  _Unwind_Resume(a1);
}

void CPMLNaiveBayesClassifier::CPMLNaiveBayesClassifier(CPMLNaiveBayesClassifier *this, CPMLStatistics *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, a3, a4);
  *(void *)uint64_t v8 = &unk_26C5100D0;
  *(_OWORD *)(v8 + 160) = 0u;
  *(_OWORD *)(v8 + 176) = 0u;
  *(_OWORD *)(v8 + 192) = 0u;
  *(_OWORD *)(v8 + 208) = 0u;
  *(void *)(v8 + 96) = *((int *)a2 + 31);
  double v11 = 0.0;
  uint64_t v9 = (void *)(v8 + 104);
  (*((void (**)(CPMLSerialization *, uint64_t, const char *))a3->var0 + 24))(a3, v8 + 104, "CREATE TABLE IF NOT EXISTS resultCardinality (resultCardinality INTEGER, pKey INTEGER PRIMARY KEY);");
  (*((void (**)(CPMLSerialization *, double *, const char *))a3->var0 + 28))(a3, &v11, "CREATE TABLE IF NOT EXISTS rowCountY (rowCountY REAL, pKey INTEGER PRIMARY KEY);");
  (*((void (**)(CPMLSerialization *, double *, const char *))a3->var0 + 28))(a3, &v11, "CREATE TABLE IF NOT EXISTS yCount (yMap INTEGER, yCount REAL, pKey INTEGER PRIMARY KEY);");
  (*((void (**)(CPMLSerialization *, double *, const char *))a3->var0 + 28))(a3, &v11, "CREATE INDEX IF NOT EXISTS idxRowCountY on rowCountY (rowCountY);");
  (*((void (**)(CPMLSerialization *, double *, const char *))a3->var0 + 28))(a3, &v11, "CREATE INDEX IF NOT EXISTS idxYCount on yCount (yMap, yCount);");
  if (*((void *)this + 12))
  {
    unint64_t v10 = 0;
    do
    {
      sprintf(v13, "CREATE TABLE IF NOT EXISTS xcol%d (xMap INTEGER, yMap INTEGER, xyCount REAL, pKey INTEGER PRIMARY KEY);",
        v10);
      sprintf(v12, "CREATE TABLE IF NOT EXISTS xCardinality%d (yMap INTEGER, xCardinality REAL, pKey INTEGER PRIMARY KEY);",
        v10);
      (*((void (**)(CPMLSerialization *, double *, char *))a3->var0 + 28))(a3, &v11, v12);
      (*((void (**)(CPMLSerialization *, double *, char *))a3->var0 + 28))(a3, &v11, v13);
      ++v10;
    }
    while (*((void *)this + 12) > v10);
  }
  (*((void (**)(CPMLSerialization *, double *, const char *))a3->var0 + 28))(a3, &v11, "CREATE TABLE IF NOT EXISTS resultCardinality (resultCardinality REAL, pKey INTEGER PRIMARY KEY);");
  (*((void (**)(CPMLSerialization *, double *, const char *))a3->var0 + 28))(a3, &v11, "select count(*) from yCount;");
  if (v11 >= 1.0)
  {
    *uint64_t v9 = (unint64_t)v11;
  }
  else
  {
    *(void *)uint64_t v13 = 0;
    (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void, double))a3->var0 + 4))(a3, v13, "resultCardinality", 1, 0, v11);
  }
  CPMLNaiveBayesClassifier::setTunableData(this, a4);
}

void sub_21431C2C8(_Unwind_Exception *a1)
{
  unint64_t v3 = (void *)v1[25];
  if (v3)
  {
    v1[26] = v3;
    operator delete(v3);
  }
  size_t v4 = (void *)v1[22];
  if (v4)
  {
    v1[23] = v4;
    operator delete(v4);
  }
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPMLNaiveBayesClassifier::~CPMLNaiveBayesClassifier(CPMLNaiveBayesClassifier *this)
{
  *(void *)this = &unk_26C5100D0;
  uint64_t v2 = (CPMLLogger *)*((void *)this + 46);
  if (v2)
  {
    CPMLLogger::~CPMLLogger(v2);
    MEMORY[0x21669DB80]();
  }
  unint64_t v3 = (CPMLNaiveBayes *)*((void *)this + 47);
  if (v3)
  {
    CPMLNaiveBayes::~CPMLNaiveBayes(v3);
    MEMORY[0x21669DB80]();
  }
  size_t v4 = (CPMLNaiveBayesAdaptor *)*((void *)this + 48);
  if (v4)
  {
    CPMLNaiveBayesAdaptor::~CPMLNaiveBayesAdaptor(v4);
    MEMORY[0x21669DB80]();
  }
  uint64_t v5 = (void *)*((void *)this + 20);
  if (v5) {
    free(v5);
  }
  uint64_t v6 = (void *)*((void *)this + 21);
  if (v6) {
    free(v6);
  }
  uint64_t v7 = (void *)*((void *)this + 25);
  if (v7)
  {
    *((void *)this + 26) = v7;
    operator delete(v7);
  }
  uint64_t v8 = (void *)*((void *)this + 22);
  if (v8)
  {
    *((void *)this + 23) = v8;
    operator delete(v8);
  }

  CPModelClose(this);
}

{
  uint64_t vars8;

  CPMLNaiveBayesClassifier::~CPMLNaiveBayesClassifier(this);

  JUMPOUT(0x21669DB80);
}

uint64_t CPMLNaiveBayesClassifier::serialize(CPMLNaiveBayesClassifier *this)
{
  uint64_t v1 = this;
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 104, "resultCardinality", 1, 0);
  uint64_t v2 = *((void *)v1 + 11);
  uint64_t v1 = (CPMLNaiveBayesClassifier *)((char *)v1 + 8);
  size_t v3 = strlen((const char *)v1);
  (*(void (**)(uint64_t, CPMLNaiveBayesClassifier *, const char *, size_t, void))(*(void *)v2 + 56))(v2, v1, "version", v3, 0);
  return 0;
}

uint64_t CPMLNaiveBayesClassifier::train(CPMLNaiveBayesClassifier *this)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v2 = (CPMLFeatureVector *)(*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
  if (v2)
  {
    while (1)
    {
      YVectorVector = (CPMLLog *)CPMLFeatureVector::getYVectorVector(v2);
      size_t v4 = *(char ****)YVectorVector;
      unint64_t v5 = *((void *)YVectorVector + 1) - *(void *)YVectorVector;
      if (!v5) {
        break;
      }
      ++*((void *)this + 14);
      if (v5 < 0x11)
      {
        if (v5 == 16)
        {
          uint64_t v8 = *v4;
          uint64_t v7 = **v4;
          unint64_t v9 = v8[1] - v7;
          unint64_t v10 = v9 >> 2;
          if ((v9 >> 2))
          {
            if (v10 == 1)
            {
              *(double *)(*((void *)this + 20) + 8 * *(int *)v7) = *(double *)(*((void *)this + 20)
                                                                                 + 8 * *(int *)v7)
                                                                     + 1.0;
            }
            else if ((int)v10 >= 1)
            {
              uint64_t v11 = 0;
              uint64_t v12 = *((void *)this + 20);
              uint64_t v13 = (v9 >> 2);
              do
              {
                uint64_t v14 = 0;
                uint64_t v15 = *(int *)&v7[4 * v11];
                *(double *)(v12 + 8 * v15) = *(double *)(v12 + 8 * v15) + 1.0;
                do
                {
                  if (v11 != v14)
                  {
                    uint64_t v16 = *(int *)&v7[4 * v14] + *((void *)this + 18) * v15;
                    ++*(void *)(**((void **)this + 21) + 8 * v16);
                  }
                  ++v14;
                }
                while (v13 != v14);
                ++v11;
              }
              while (v11 != v13);
            }
          }
        }
      }
      else
      {
        CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(YVectorVector);
        CPMLLog::log(CPMLLog, CPML_LOG_ERR, "train", "Too many Y\n");
      }
      uint64_t v2 = (CPMLFeatureVector *)(*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
      if (!v2) {
        goto LABEL_17;
      }
    }
    unint64_t v26 = (pthread_mutex_t *)CPMLLog::getCPMLLog(YVectorVector);
    CPMLLog::log(v26, CPML_LOG_ERR, "train", "no vectors to process\n");
    return 0xFFFFFFFFLL;
  }
  else
  {
LABEL_17:
    uint64_t v17 = sqlite3_mprintf("%lf", (double)*((unint64_t *)this + 14));
    (*(void (**)(void, const char *, const char *, char *))(**((void **)this + 11) + 136))(*((void *)this + 11), "rowCountY", "rowCountY", v17);
    if (v17) {
      sqlite3_free(v17);
    }
    if (*((void *)this + 13))
    {
      unint64_t v18 = 0;
      do
      {
        unint64_t v19 = sqlite3_mprintf("%d,%lf", v18, *(double *)(*((void *)this + 20) + 8 * v18));
        (*(void (**)(void, const char *, const char *, char *))(**((void **)this + 11) + 136))(*((void *)this + 11), "yCount", "yMap,yCount", v19);
        if (v19) {
          sqlite3_free(v19);
        }
        ++v18;
      }
      while (*((void *)this + 13) > v18);
    }
    if (*((void *)this + 12))
    {
      unint64_t v20 = 0;
      do
      {
        sprintf(v27, "xcol%d", v20);
        unint64_t v21 = *((void *)this + 18);
        if (v21)
        {
          for (unint64_t i = 0; i < v21; ++i)
          {
            unint64_t v23 = 0;
            do
            {
              uint64_t v24 = sqlite3_mprintf("%d,%d,%lf", i, v23, (double)*(unint64_t *)(**((void **)this + 21) + 8 * (v23 + i * v21)));
              (*(void (**)(void, char *, const char *, char *))(**((void **)this + 11) + 136))(*((void *)this + 11), v27, "xMap,yMap,xyCount", v24);
              if (v24) {
                sqlite3_free(v24);
              }
              ++v23;
              unint64_t v21 = *((void *)this + 18);
            }
            while (v21 > v23);
          }
        }
        ++v20;
      }
      while (*((void *)this + 12) > v20);
    }
    return 0;
  }
}

uint64_t CPMLNaiveBayesClassifier::eval(uint64_t a1, CPMLFeatureVector *this, uint64_t *a3)
{
  if (!*(void *)(a1 + 104)) {
    return 0xFFFFFFFFLL;
  }
  __p = 0;
  uint64_t v73 = 0;
  uint64_t v74 = 0;
  uint64_t v6 = *a3;
  if (a3[1] == *a3)
  {
    unint64_t v20 = 0;
    unint64_t v21 = 0;
    do
    {
      if (v20 >= v74)
      {
        unint64_t v23 = (char *)__p;
        uint64_t v24 = (v20 - (unsigned char *)__p) >> 2;
        unint64_t v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 62) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v26 = v74 - (unsigned char *)__p;
        if ((v74 - (unsigned char *)__p) >> 1 > v25) {
          unint64_t v25 = v26 >> 1;
        }
        if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v27 = v25;
        }
        if (v27)
        {
          uint64_t v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v74, v27);
          unint64_t v23 = (char *)__p;
          unint64_t v20 = v73;
        }
        else
        {
          uint64_t v28 = 0;
        }
        double v29 = &v28[4 * v24];
        *(_DWORD *)double v29 = v21;
        unint64_t v22 = v29 + 4;
        while (v20 != v23)
        {
          int v30 = *((_DWORD *)v20 - 1);
          v20 -= 4;
          *((_DWORD *)v29 - 1) = v30;
          v29 -= 4;
        }
        __p = v29;
        uint64_t v73 = v22;
        uint64_t v74 = &v28[4 * v27];
        if (v23) {
          operator delete(v23);
        }
      }
      else
      {
        *(_DWORD *)unint64_t v20 = v21;
        unint64_t v22 = v20 + 4;
      }
      uint64_t v73 = v22;
      ++v21;
      unint64_t v20 = v22;
    }
    while (*(void *)(a1 + 104) > v21);
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      int v9 = *(_DWORD *)(v6 + 4 * v8);
      if (v7 >= v74)
      {
        uint64_t v11 = (char *)__p;
        uint64_t v12 = (v7 - (unsigned char *)__p) >> 2;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 62) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v14 = v74 - (unsigned char *)__p;
        if ((v74 - (unsigned char *)__p) >> 1 > v13) {
          unint64_t v13 = v14 >> 1;
        }
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v15 = v13;
        }
        if (v15)
        {
          uint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v74, v15);
          uint64_t v11 = (char *)__p;
          uint64_t v7 = v73;
        }
        else
        {
          uint64_t v16 = 0;
        }
        uint64_t v17 = &v16[4 * v12];
        *(_DWORD *)uint64_t v17 = v9;
        unint64_t v10 = v17 + 4;
        while (v7 != v11)
        {
          int v18 = *((_DWORD *)v7 - 1);
          v7 -= 4;
          *((_DWORD *)v17 - 1) = v18;
          v17 -= 4;
        }
        __p = v17;
        uint64_t v73 = v10;
        uint64_t v74 = &v16[4 * v15];
        if (v11) {
          operator delete(v11);
        }
      }
      else
      {
        *(_DWORD *)uint64_t v7 = v9;
        unint64_t v10 = v7 + 4;
      }
      uint64_t v73 = v10;
      ++v8;
      uint64_t v6 = *a3;
      uint64_t v7 = v10;
    }
    while (v8 < (a3[1] - *a3) >> 2);
  }
  XVectorVector = (CPMLLog *)CPMLFeatureVector::getXVectorVector(this);
  if (*((void *)XVectorVector + 1) == *(void *)XVectorVector)
  {
    unint64_t v69 = 0;
    uint64_t v70 = 0;
    int v71 = 0;
    IntVector = (uint64_t *)CPMLFeatureVector::getIntVector(this);
    uint64_t v34 = *IntVector;
    if (IntVector[1] != *IntVector)
    {
      unint64_t v35 = 0;
      uint64_t v36 = v70;
      do
      {
        int v37 = *(_DWORD *)(v34 + 4 * v35);
        if (v36 >= v71)
        {
          double v39 = (char *)v69;
          uint64_t v40 = (v36 - (unsigned char *)v69) >> 2;
          unint64_t v41 = v40 + 1;
          if ((unint64_t)(v40 + 1) >> 62) {
            std::vector<double>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v42 = v71 - (unsigned char *)v69;
          if ((v71 - (unsigned char *)v69) >> 1 > v41) {
            unint64_t v41 = v42 >> 1;
          }
          if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v43 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v43 = v41;
          }
          if (v43)
          {
            unint64_t v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v71, v43);
            double v39 = (char *)v69;
            uint64_t v36 = v70;
          }
          else
          {
            unint64_t v44 = 0;
          }
          uint64_t v45 = &v44[4 * v40];
          *(_DWORD *)uint64_t v45 = v37;
          double v38 = v45 + 4;
          while (v36 != v39)
          {
            int v46 = *((_DWORD *)v36 - 1);
            v36 -= 4;
            *((_DWORD *)v45 - 1) = v46;
            v45 -= 4;
          }
          unint64_t v69 = v45;
          uint64_t v70 = v38;
          int v71 = &v44[4 * v43];
          if (v39) {
            operator delete(v39);
          }
        }
        else
        {
          *(_DWORD *)uint64_t v36 = v37;
          double v38 = v36 + 4;
        }
        uint64_t v70 = v38;
        ++v35;
        uint64_t v34 = *IntVector;
        uint64_t v36 = v38;
      }
      while (v35 < (IntVector[1] - *IntVector) >> 2);
    }
    uint64_t RealVector = (char *)CPMLFeatureVector::getRealVector(this);
    int v48 = RealVector;
    uint64_t v49 = *(void *)RealVector;
    if (*((void *)RealVector + 1) == *(void *)RealVector)
    {
      double v53 = v70;
    }
    else
    {
      unint64_t v50 = 0;
      unint64_t v51 = v70;
      do
      {
        int v52 = (int)*(double *)(v49 + 8 * v50);
        if (v51 >= v71)
        {
          uint64_t RealVector = (char *)v69;
          uint64_t v54 = (v51 - (unsigned char *)v69) >> 2;
          unint64_t v55 = v54 + 1;
          if ((unint64_t)(v54 + 1) >> 62) {
            std::vector<double>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v56 = v71 - (unsigned char *)v69;
          if ((v71 - (unsigned char *)v69) >> 1 > v55) {
            unint64_t v55 = v56 >> 1;
          }
          if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v57 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v57 = v55;
          }
          if (v57)
          {
            int v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v71, v57);
            uint64_t RealVector = (char *)v69;
            unint64_t v51 = v70;
          }
          else
          {
            int v58 = 0;
          }
          uint64_t v59 = (int *)&v58[4 * v54];
          int *v59 = v52;
          double v53 = (char *)(v59 + 1);
          while (v51 != RealVector)
          {
            int v60 = *((_DWORD *)v51 - 1);
            v51 -= 4;
            *--uint64_t v59 = v60;
          }
          unint64_t v69 = v59;
          uint64_t v70 = v53;
          int v71 = &v58[4 * v57];
          if (RealVector) {
            operator delete(RealVector);
          }
        }
        else
        {
          *(_DWORD *)unint64_t v51 = v52;
          double v53 = v51 + 4;
        }
        uint64_t v70 = v53;
        ++v50;
        uint64_t v49 = *(void *)v48;
        unint64_t v51 = v53;
      }
      while (v50 < (uint64_t)(*((void *)v48 + 1) - *(void *)v48) >> 3);
    }
    if (v53 == v69)
    {
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)RealVector);
      CPMLLog::log(CPMLLog, CPML_LOG_ERR, "eval", "empty integer list");
      uint64_t v19 = 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t v66 = 0;
      uint64_t v67 = 0;
      uint64_t v68 = 0;
      uint64_t v61 = std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(&v66, (uint64_t)&v69);
      uint64_t v62 = *(unsigned int *)(a1 + 328);
      uint64_t v63 = *(void (****)(void, uint64_t, void **, uint64_t, uint64_t))(a1 + 376);
      uint64_t v67 = v61;
      CPMLNaiveBayes::predict(v63, (uint64_t)&v66, (unsigned int **)&__p, v62, a1 + 176);
      unint64_t v75 = (void **)&v66;
      std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](&v75);
      CPMLFeatureVector::setYHatProbList((uint64_t)this, a1 + 176);
      uint64_t v19 = 0;
      *(void *)(a1 + 184) = *(void *)(a1 + 176);
    }
    if (v69)
    {
      uint64_t v70 = (char *)v69;
      operator delete(v69);
    }
  }
  else
  {
    double v32 = (pthread_mutex_t *)CPMLLog::getCPMLLog(XVectorVector);
    CPMLLog::log(v32, CPML_LOG_ERR, "eval", "no vector supported");
    uint64_t v19 = 0xFFFFFFFFLL;
  }
  if (__p)
  {
    uint64_t v73 = (char *)__p;
    operator delete(__p);
  }
  return v19;
}

void sub_21431CDB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  if (a15) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void CPMLNaiveBayesClassifier::update(CPMLNaiveBayesClassifier *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
}

void sub_21431D2F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CPMLNaiveBayesClassifier::errorString(CPMLNaiveBayesClassifier *this)
{
  return 0;
}

CPMLModel *CPModelOpen(char *a1, char *a2)
{
  size_t v3 = (void *)[[NSString alloc] initWithCString:a1 encoding:4];
  size_t v4 = (void *)[[NSString alloc] initWithCString:a2 encoding:4];
  unint64_t v5 = [[CPMLModel alloc] initWithModelPath:v3 withPropertyListPath:v4];

  return v5;
}

void sub_21431D3D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CPModelPredictV(void *a1, char *a2, ...)
{
  return 0;
}

void sub_21431D4BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21431D554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21431D600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21431D6EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21431D7F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_21431DF98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21431E260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CPRegressionForestClassfier::serializeTree(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**(void **)(a1 + 88) + 24))(*(void *)(a1 + 88), a2, "nChildren", 1, 0);
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**(void **)(a1 + 88) + 24))(*(void *)(a1 + 88), a2 + 16, "N", 1, 0);
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**(void **)(a1 + 88) + 24))(*(void *)(a1 + 88), a2 + 20, "M", 1, 0);
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**(void **)(a1 + 88) + 24))(*(void *)(a1 + 88), a2 + 24, "NL", 1, 0);
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**(void **)(a1 + 88) + 24))(*(void *)(a1 + 88), a2 + 28, "level", 1, 0);
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**(void **)(a1 + 88) + 24))(*(void *)(a1 + 88), a2 + 32, "splitAttr", 1, 0);
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**(void **)(a1 + 88) + 48))(*(void *)(a1 + 88), a2 + 40, "splitThreshold", 1, 0);
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**(void **)(a1 + 88) + 48))(*(void *)(a1 + 88), a2 + 48, "splitCost", 1, 0);
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**(void **)(a1 + 88) + 48))(*(void *)(a1 + 88), a2 + 56, "meanTarget", 1, 0);
  int v9 = 0;
  size_t v4 = *(uint64_t **)(a2 + 8);
  uint64_t v6 = *v4;
  uint64_t v5 = v4[1];
  if (v6)
  {
    if (!v5)
    {
      int v9 = 1;
      (*(void (**)(void, int *, const char *, uint64_t, void))(**(void **)(a1 + 88) + 24))(*(void *)(a1 + 88), &v9, "flagChildren", 1, 0);
      uint64_t v7 = **(void **)(a2 + 8);
      goto LABEL_8;
    }
    int v9 = 3;
    (*(void (**)(void, int *, const char *, uint64_t, void))(**(void **)(a1 + 88) + 24))(*(void *)(a1 + 88), &v9, "flagChildren", 1, 0);
    CPRegressionForestClassfier::serializeTree(a1, **(void **)(a2 + 8));
  }
  else
  {
    if (!v5)
    {
      (*(void (**)(void, int *, const char *, uint64_t, void))(**(void **)(a1 + 88) + 24))(*(void *)(a1 + 88), &v9, "flagChildren", 1, 0);
      return 0;
    }
    int v9 = 2;
    (*(void (**)(void, int *, const char *, uint64_t, void))(**(void **)(a1 + 88) + 24))(*(void *)(a1 + 88), &v9, "flagChildren", 1, 0);
  }
  uint64_t v7 = *(void *)(*(void *)(a2 + 8) + 8);
LABEL_8:
  CPRegressionForestClassfier::serializeTree(a1, v7);
  return 0;
}

void CPRegressionForestClassfier::CPRegressionForestClassfier(CPRegressionForestClassfier *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, a2, a3, a4);
  *(void *)uint64_t v4 = &unk_26C510308;
  strcpy((char *)(v4 + 8), "1.0.0");
  CPMLCDB::getIterator();
}

void sub_21431E83C(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPRegressionForestClassfier::CPRegressionForestClassfier(CPRegressionForestClassfier *this, CPMLSerialization *a2, CPMLTunableData *a3)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, a2, a3);
  *uint64_t v5 = &unk_26C510308;
  uint64_t v6 = (unsigned int *)malloc_type_malloc(0x28uLL, 0x1080040F07CF49EuLL);
  *((void *)this + 12) = v6;
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 13))(a2, (char *)this + 8, "version", 5, 0);
  (*((void (**)(CPMLSerialization *, unsigned int *, const char *, uint64_t, void))a2->var0 + 9))(a2, v6, "numTrees", 1, 0);
  (*((void (**)(CPMLSerialization *, unsigned int *, const char *, uint64_t, void))a2->var0 + 9))(a2, v6 + 4, "maxDepth", 1, 0);
  (*((void (**)(CPMLSerialization *, unsigned int *, const char *, uint64_t, void))a2->var0 + 9))(a2, v6 + 5, "minCardinality", 1, 0);
  (*((void (**)(CPMLSerialization *, unsigned int *, const char *, uint64_t, void))a2->var0 + 9))(a2, v6 + 6, "nSplitsPerTest", 1, 0);
  (*((void (**)(CPMLSerialization *, unsigned int *, const char *, uint64_t, void))a2->var0 + 12))(a2, v6 + 8, "splitPerTree", 1, 0);
  *((void *)v6 + 1) = malloc_type_malloc(8 * *v6, 0x2004093837F09uLL);
  if (*v6)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      deSerializeTree((uint64_t)a2, (void *)(*((void *)v6 + 1) + v7), v8++);
      v7 += 8;
    }
    while (v8 < *v6);
  }
}

void sub_21431EA98(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void *deSerializeTree(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = malloc_type_malloc(0x40uLL, 0x10800407B512463uLL);
  *a2 = v6;
  (*(void (**)(uint64_t, void *, const char *, uint64_t, uint64_t))(*(void *)a1 + 72))(a1, v6, "nChildren", 1, a3);
  (*(void (**)(uint64_t, void *, const char *, uint64_t, uint64_t))(*(void *)a1 + 72))(a1, v6 + 2, "N", 1, a3);
  (*(void (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t))(*(void *)a1 + 72))(a1, (uint64_t)v6 + 20, "M", 1, a3);
  (*(void (**)(uint64_t, void *, const char *, uint64_t, uint64_t))(*(void *)a1 + 72))(a1, v6 + 3, "NL", 1, a3);
  (*(void (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t))(*(void *)a1 + 72))(a1, (uint64_t)v6 + 28, "level", 1, a3);
  (*(void (**)(uint64_t, void *, const char *, uint64_t, uint64_t))(*(void *)a1 + 72))(a1, v6 + 4, "splitAttr", 1, a3);
  (*(void (**)(uint64_t, void *, const char *, uint64_t, uint64_t))(*(void *)a1 + 96))(a1, v6 + 5, "splitThreshold", 1, a3);
  (*(void (**)(uint64_t, void *, const char *, uint64_t, uint64_t))(*(void *)a1 + 96))(a1, v6 + 6, "splitCost", 1, a3);
  (*(void (**)(uint64_t, void *, const char *, uint64_t, uint64_t))(*(void *)a1 + 96))(a1, v6 + 7, "meanTarget", 1, a3);
  int v10 = 0;
  (*(void (**)(uint64_t, int *, const char *, uint64_t, uint64_t))(*(void *)a1 + 72))(a1, &v10, "flagChildren", 1, a3);
  double result = malloc_type_malloc(0x10uLL, 0x2004093837F09uLL);
  v6[1] = result;
  void *result = 0;
  *(void *)(v6[1] + 8) = 0;
  if (v10 == 1)
  {
    uint64_t v8 = v6[1];
LABEL_7:
    uint64_t v9 = a3 + 1;
    return (void *)deSerializeTree(a1, v8, v9);
  }
  if (v10 == 2)
  {
    uint64_t v8 = v6[1] + 8;
    goto LABEL_7;
  }
  if (v10 != 3) {
    return result;
  }
  deSerializeTree(a1, v6[1], a3 + 1);
  uint64_t v8 = v6[1] + 8;
  uint64_t v9 = a3 + 2;
  return (void *)deSerializeTree(a1, v8, v9);
}

void CPRegressionForestClassfier::~CPRegressionForestClassfier(CPRegressionForestClassfier *this)
{
  *(void *)this = &unk_26C510308;
  uint64_t v2 = (unsigned int *)*((void *)this + 12);
  if (*v2)
  {
    unint64_t v3 = 0;
    do
      CPRTdestroyTree(*(void **)(*((void *)v2 + 1) + 8 * v3++));
    while (v3 < *v2);
  }
  free(*((void **)v2 + 1));

  CPModelClose(this);
}

{
  uint64_t vars8;

  CPRegressionForestClassfier::~CPRegressionForestClassfier(this);

  JUMPOUT(0x21669DB80);
}

uint64_t CPRegressionForestClassfier::serialize(CPRegressionForestClassfier *this)
{
  uint64_t v3 = *((void *)this + 11);
  uint64_t v2 = (unsigned int *)*((void *)this + 12);
  uint64_t v4 = *((void *)v2 + 1);
  uint64_t v5 = (char *)this + 8;
  size_t v6 = strlen((const char *)this + 8);
  (*(void (**)(uint64_t, char *, const char *, size_t, void))(*(void *)v3 + 56))(v3, v5, "version", v6, 0);
  (*(void (**)(void, unsigned int *, const char *, uint64_t, void))(**((void **)this + 11) + 24))(*((void *)this + 11), v2, "numTrees", 1, 0);
  (*(void (**)(void, unsigned int *, const char *, uint64_t, void))(**((void **)this + 11) + 24))(*((void *)this + 11), v2 + 4, "maxDepth", 1, 0);
  (*(void (**)(void, unsigned int *, const char *, uint64_t, void))(**((void **)this + 11) + 24))(*((void *)this + 11), v2 + 5, "minCardinality", 1, 0);
  (*(void (**)(void, unsigned int *, const char *, uint64_t, void))(**((void **)this + 11) + 24))(*((void *)this + 11), v2 + 6, "nSplitsPerTest", 1, 0);
  (*(void (**)(void, unsigned int *, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), v2 + 8, "splitPerTree", 1, 0);
  if (*v2)
  {
    unint64_t v7 = 0;
    do
      CPRegressionForestClassfier::serializeTree((uint64_t)this, *(void *)(v4 + 8 * v7++));
    while (v7 < *v2);
  }
  return 0;
}

uint64_t CPRegressionForestClassfier::train(double **this)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_DEBUG, "train", "start training Regression Forest\n");
  uint64_t v3 = (CPMLFeatureVector *)(*(uint64_t (**)(double *))(*(void *)this[10] + 16))(this[10]);
  uint64_t v4 = *(void *)this[6];
  uint64_t v5 = *(unsigned int *)(v4 + 120);
  uint64_t v6 = (*(_DWORD *)(v4 + 124) - 1);
  unint64_t v7 = (double *)malloc_type_malloc(8 * v5 * v6, 0x73EFCCDCuLL);
  uint64_t v8 = (double *)malloc_type_malloc(8 * v5, 0x85EA264uLL);
  uint64_t RealVector = (uint64_t *)CPMLFeatureVector::getRealVector(v3);
  if (v6)
  {
    unsigned int v10 = 0;
    int v11 = 0;
    do
    {
      if (v5)
      {
        uint64_t v12 = *RealVector;
        uint64_t v13 = v5;
        unsigned int v14 = v10;
        do
        {
          float v15 = *(double *)(v12 + 8 * v14);
          v7[v14++] = v15;
          --v13;
        }
        while (v13);
      }
      ++v11;
      v10 += v5;
    }
    while (v11 != v6);
  }
  if (v5)
  {
    unsigned int v16 = v6 * v5;
    uint64_t v17 = *RealVector;
    uint64_t v18 = v5;
    uint64_t v19 = v8;
    do
    {
      float v20 = *(double *)(v17 + 8 * v16);
      *v19++ = v20;
      ++v16;
      --v18;
    }
    while (v18);
  }
  unint64_t v21 = this[12];
  uint64_t v22 = (v21[4] * (double)v5);
  unint64_t v23 = (double *)malloc_type_malloc(8 * v22 * v6, 0x60E23D3DuLL);
  uint64_t v24 = (double *)malloc_type_malloc(8 * v22, 0xF3567D95uLL);
  if (*(_DWORD *)v21)
  {
    unint64_t v25 = 0;
    do
    {
      if (v22)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          uint32_t v27 = arc4random_uniform(v5);
          uint32_t v28 = v27;
          int v29 = i;
          uint64_t v30 = v6;
          if (v6)
          {
            do
            {
              v23[v29] = v7[v28];
              v29 += v22;
              v28 += v5;
              --v30;
            }
            while (v30);
          }
          v24[i] = v8[v27];
        }
      }
      *(void *)(*((void *)v21 + 1) + 8 * v25++) = CPRTgrowTree(*((_DWORD *)v21 + 4), *((_DWORD *)v21 + 5), *((_DWORD *)v21 + 6), (double (*)(double *, double *, unsigned int, unsigned int, unsigned int *, double *, unsigned int *, double))CPRTcostTargetSD, v6, v22, v23, v24, 0);
    }
    while (v25 < *(unsigned int *)v21);
  }
  free(v23);
  free(v24);
  free(v7);
  free(v8);
  return 0;
}

uint64_t CPRegressionForestClassfier::eval(uint64_t a1, CPMLFeatureVector *this)
{
  uint64_t RealVector = (uint64_t **)CPMLFeatureVector::getRealVector(this);
  unint64_t v5 = (char *)RealVector[1] - (char *)*RealVector;
  unint64_t v6 = v5 >> 3;
  unint64_t v7 = malloc_type_malloc(v5 & 0x7FFFFFFF8, 0xACF3CB29uLL);
  uint64_t v8 = v7;
  if ((v5 >> 3))
  {
    uint64_t v9 = *RealVector;
    uint64_t v10 = (v5 >> 3);
    int v11 = v7;
    do
    {
      uint64_t v12 = *v9++;
      *v11++ = v12;
      --v10;
    }
    while (v10);
  }
  uint64_t v13 = *(unsigned int **)(a1 + 96);
  unsigned int v14 = (double *)malloc_type_calloc(1uLL, 8uLL, 0x100004000313F17uLL);
  if (v14)
  {
    float v15 = malloc_type_calloc(*v13, 8uLL, 0x80040B8603338uLL);
    if (v15)
    {
      unsigned int v16 = v15;
      if (*v13)
      {
        unint64_t v17 = 0;
        do
        {
          uint64_t v18 = CPRTpredictRegressTree(*(void *)(*((void *)v13 + 1) + 8 * v17), (uint64_t)v8, 1u, v6);
          v16[v17] = v18;
          *unsigned int v14 = *v18 + *v14;
          free(v18);
          ++v17;
          unint64_t v19 = *v13;
        }
        while (v17 < v19);
        double v20 = (double)v19;
      }
      else
      {
        double v20 = 0.0;
      }
      *unsigned int v14 = *v14 / v20;
      free(v16);
    }
    else
    {
      free(v14);
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v22);
      CPMLLog::log(CPMLLog, CPML_LOG_ERR, "predictForest", "yt out of memory.");
      unsigned int v14 = 0;
    }
  }
  else
  {
    unint64_t v21 = (pthread_mutex_t *)CPMLLog::getCPMLLog(0);
    CPMLLog::log(v21, CPML_LOG_ERR, "predictForest", "y out of memory.");
  }
  CPMLFeatureVector::setYHat((uint64_t)this, *v14);
  free(v8);
  free(v14);
  return 0;
}

uint64_t CPRegressionForestClassfier::errorString(CPRegressionForestClassfier *this)
{
  return 0;
}

uint64_t CPRegressionForestClassfier::requireRealOnly(CPRegressionForestClassfier *this)
{
  return 1;
}

void CPMLNaiveBayesSuggestionsClassifier::CPMLNaiveBayesSuggestionsClassifier(CPMLNaiveBayesSuggestionsClassifier *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, a2, a3, a4);
  *(void *)uint64_t v5 = &unk_26C510560;
  *(void *)(v5 + 176) = 0;
  *(void *)(v5 + 184) = 0;
  *(void *)(v5 + 192) = 0;
  *(void *)(v5 + 360) = 0;
  *(void *)(v5 + 368) = 0;
  strcpy((char *)(v5 + 8), "1.0.1");
  *(void *)(v5 + 112) = 0;
  var0 = a2->var0;
  *(void *)(v5 + 96) = *((int *)a2->var0 + 31);
  uint64_t v7 = *((int *)var0 + 33);
  *(void *)(v5 + 104) = v7;
  *(void *)(v5 + 120) = (uint64_t)(*((void *)var0 + 4) - *((void *)var0 + 3)) >> 3;
  uint64_t v8 = *(void *)var0;
  *(void *)(v5 + 128) = (uint64_t)(*((void *)var0 + 1) - *(void *)var0) >> 2;
  *(void *)(v5 + 136) = v8;
  *(void *)(v5 + 144) = v7;
  *(void *)(v5 + 152) = (uint64_t)(*((void *)var0 + 7) - *((void *)var0 + 6)) >> 2;
  CPMLCDB::getIterator();
}

void sub_21431F804(_Unwind_Exception *a1)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    v1[23] = v4;
    operator delete(v4);
  }
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPMLNaiveBayesSuggestionsClassifier::setTunableData(CPMLNaiveBayesSuggestionsClassifier *this, CPMLTunableData *a2)
{
  int NumberOfItems = CPMLTunableData::getNumberOfItems(a2);
  uint64_t v5 = (int *)((char *)this + 304);
  unint64_t v6 = (_DWORD *)((char *)this + 312);
  if (NumberOfItems < 2)
  {
    *((void *)this + 43) = 0x100000020;
    __asm { FMOV            V0.2D, #1.0 }
    *((_OWORD *)this + 20) = _Q0;
    *((void *)this + 42) = 0x3CD203AF9EE75616;
    *(void *)uint64_t v5 = 0xA00000014;
    _DWORD *v6 = 10;
    *((unsigned char *)this + 201) = 0;
    *((unsigned char *)this + 200) = 0;
    strcpy((char *)this + 202, "defaultNBV3");
  }
  else
  {
    CPMLTunableData::tDataGetInt(a2, "k", v5);
    CPMLTunableData::tDataGetInt(a2, "cacheLength", (int *)this + 86);
    CPMLTunableData::tDataGetInt(a2, "cacheAssocitivity", (int *)this + 87);
    CPMLTunableData::tDataGetDouble(a2, "decayRate", (double *)this + 40);
    CPMLTunableData::tDataGetDouble(a2, "smoothRate", (double *)this + 41);
    CPMLTunableData::tDataGetDouble(a2, "epsilonRate", (double *)this + 42);
    CPMLTunableData::tDataGetUInt(a2, "maxAllowedUpdate", (unsigned int *)this + 77);
    CPMLTunableData::tDataGetUInt(a2, "maxAllowedPredict", (unsigned int *)this + 78);
    CPMLTunableData::tDataGetBool(a2, "enableLogging", (BOOL *)this + 201);
    CPMLTunableData::tDataGetBool(a2, "dataCollection", (BOOL *)this + 200);
    CPMLTunableData::tDataGetString(a2, "logFilename", (char *)this + 202, 0x64uLL);
    CPMLTunableData::tDataGetString(a2, "versionMD", (char *)this + 8, 0x20uLL);
    if (!*((_DWORD *)this + 77)) {
      *((_DWORD *)this + 77) = 10;
    }
    if (!*v6) {
      _DWORD *v6 = 10;
    }
    if (!*((unsigned char *)this + 8)) {
      strcpy((char *)this + 8, "1.0.1");
    }
  }
  operator new();
}

void sub_21431FA8C(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x10F2C40B74731EELL);
  _Unwind_Resume(a1);
}

void CPMLNaiveBayesSuggestionsClassifier::CPMLNaiveBayesSuggestionsClassifier(CPMLNaiveBayesSuggestionsClassifier *this, CPMLStatistics *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, a3, a4);
  *(void *)uint64_t v6 = &unk_26C510560;
  *(_OWORD *)(v6 + 160) = 0u;
  *(_OWORD *)(v6 + 176) = 0u;
  *(void *)(v6 + 192) = 0;
  *(void *)(v6 + 96) = *((int *)a2 + 31);
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  CPMLNaiveBayesSuggestionsClassifier::setTunableData((CPMLNaiveBayesSuggestionsClassifier *)v6, a4);
}

void sub_214320158(_Unwind_Exception *a1)
{
  uint64_t v3 = (void *)v1[22];
  if (v3)
  {
    v1[23] = v3;
    operator delete(v3);
  }
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPMLNaiveBayesSuggestionsClassifier::~CPMLNaiveBayesSuggestionsClassifier(CPMLNaiveBayesSuggestionsClassifier *this)
{
  *(void *)this = &unk_26C510560;
  uint64_t v2 = (CPMLLogger *)*((void *)this + 44);
  if (v2)
  {
    CPMLLogger::~CPMLLogger(v2);
    MEMORY[0x21669DB80]();
  }
  uint64_t v3 = (CPMLNaiveBayes *)*((void *)this + 45);
  if (v3)
  {
    CPMLNaiveBayes::~CPMLNaiveBayes(v3);
    MEMORY[0x21669DB80]();
  }
  uint64_t v4 = (CPMLNaiveBayesAdaptor *)*((void *)this + 46);
  if (v4)
  {
    CPMLNaiveBayesAdaptor::~CPMLNaiveBayesAdaptor(v4);
    MEMORY[0x21669DB80]();
  }
  uint64_t v5 = (void *)*((void *)this + 20);
  if (v5) {
    free(v5);
  }
  uint64_t v6 = (void *)*((void *)this + 21);
  if (v6) {
    free(v6);
  }
  uint64_t v7 = (void *)*((void *)this + 22);
  if (v7)
  {
    *((void *)this + 23) = v7;
    operator delete(v7);
  }

  CPModelClose(this);
}

{
  uint64_t vars8;

  CPMLNaiveBayesSuggestionsClassifier::~CPMLNaiveBayesSuggestionsClassifier(this);

  JUMPOUT(0x21669DB80);
}

uint64_t CPMLNaiveBayesSuggestionsClassifier::serialize(CPMLNaiveBayesSuggestionsClassifier *this)
{
  return 0;
}

uint64_t CPMLNaiveBayesSuggestionsClassifier::train(CPMLNaiveBayesSuggestionsClassifier *this)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = (CPMLFeatureVector *)(*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
  if (v2)
  {
    while (1)
    {
      YVectorVector = (CPMLLog *)CPMLFeatureVector::getYVectorVector(v2);
      uint64_t v4 = *(char ****)YVectorVector;
      unint64_t v5 = *((void *)YVectorVector + 1) - *(void *)YVectorVector;
      if (!v5) {
        break;
      }
      ++*((void *)this + 14);
      if (v5 < 0x11)
      {
        if (v5 == 16)
        {
          uint64_t v7 = *v4;
          uint64_t v8 = **v4;
          uint64_t v9 = (int *)v7[1];
          unint64_t v10 = (char *)v9 - v8;
          if (((unint64_t)((char *)v9 - v8) >> 2))
          {
            unint64_t v11 = (v10 >> 2);
            if (v11 == 1)
            {
              *(double *)(*((void *)this + 20) + 8 * *(int *)v8) = *(double *)(*((void *)this + 20)
                                                                                 + 8 * *(int *)v8)
                                                                     + 1.0;
            }
            else
            {
              unint64_t v12 = *((unsigned int *)this + 77);
              if (v12 < v11)
              {
                unint64_t v13 = v10 - 4;
                do
                {
                  unint64_t v14 = v13;
                  --v9;
                  unint64_t v15 = v13 >> 2;
                  v13 -= 4;
                }
                while (v12 < v15);
                unint64_t v11 = (v14 >> 2);
                v7[1] = (char *)v9;
              }
              if ((int)v11 >= 1)
              {
                uint64_t v16 = 0;
                uint64_t v17 = *((void *)this + 20);
                do
                {
                  uint64_t v18 = 0;
                  uint64_t v19 = *(int *)&v8[4 * v16];
                  *(double *)(v17 + 8 * v19) = *(double *)(v17 + 8 * v19) + 1.0;
                  do
                  {
                    if (v16 != v18)
                    {
                      uint64_t v20 = *(int *)&v8[4 * v18] + *((void *)this + 18) * v19;
                      ++*(void *)(**((void **)this + 21) + 8 * v20);
                    }
                    ++v18;
                  }
                  while (v11 != v18);
                  ++v16;
                }
                while (v16 != v11);
              }
            }
          }
        }
      }
      else
      {
        CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(YVectorVector);
        CPMLLog::log(CPMLLog, CPML_LOG_ERR, "train", "Too many Y\n");
      }
      uint64_t v2 = (CPMLFeatureVector *)(*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
      if (!v2) {
        goto LABEL_21;
      }
    }
    double v31 = (pthread_mutex_t *)CPMLLog::getCPMLLog(YVectorVector);
    CPMLLog::log(v31, CPML_LOG_ERR, "train", "no vectors to process\n");
    return 0xFFFFFFFFLL;
  }
  else
  {
LABEL_21:
    unint64_t v21 = sqlite3_mprintf("%lf", (double)*((unint64_t *)this + 14));
    (*(void (**)(void, const char *, const char *, char *))(**((void **)this + 11) + 136))(*((void *)this + 11), "rowCountY", "rowCountY", v21);
    if (v21) {
      sqlite3_free(v21);
    }
    if (*((void *)this + 13))
    {
      unint64_t v22 = 0;
      do
      {
        unint64_t v23 = sqlite3_mprintf("%d,%lf", v22, *(double *)(*((void *)this + 20) + 8 * v22));
        (*(void (**)(void, const char *, const char *, char *))(**((void **)this + 11) + 136))(*((void *)this + 11), "yCount", "yMap,yCount", v23);
        if (v23) {
          sqlite3_free(v23);
        }
        ++v22;
      }
      while (*((void *)this + 13) > v22);
    }
    if (*((void *)this + 12))
    {
      unint64_t v24 = 0;
      do
      {
        sprintf(v32, "xcol%d", v24);
        unint64_t v25 = *((void *)this + 18);
        if (v25)
        {
          for (unint64_t i = 0; i < v25; ++i)
          {
            unint64_t v27 = 0;
            do
            {
              unint64_t v28 = *(void *)(**((void **)this + 21) + 8 * (v27 + i * v25));
              if (v28)
              {
                int v29 = sqlite3_mprintf("%d,%d,%lf", i, v27, (double)v28);
                (*(void (**)(void, char *, const char *, char *))(**((void **)this + 11) + 136))(*((void *)this + 11), v32, "xMap,yMap,xyCount", v29);
                if (v29) {
                  sqlite3_free(v29);
                }
              }
              ++v27;
              unint64_t v25 = *((void *)this + 18);
            }
            while (v25 > v27);
          }
        }
        ++v24;
      }
      while (*((void *)this + 12) > v24);
    }
    return 0;
  }
}

uint64_t CPMLNaiveBayesSuggestionsClassifier::eval(uint64_t a1, CPMLFeatureVector *this, uint64_t *a3)
{
  if (!*(void *)(a1 + 104)) {
    return 0xFFFFFFFFLL;
  }
  XVectorVector = (CPMLLog *)CPMLFeatureVector::getXVectorVector(this);
  if (*((void *)XVectorVector + 1) == *(void *)XVectorVector)
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(XVectorVector);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "eval", "only vector support");
  }
  else
  {
    uint64_t v7 = *(uint64_t **)(*(void *)XVectorVector + 16 * *(int *)this);
    uint64_t v8 = v7[1];
    unsigned int v9 = *(_DWORD *)(a1 + 312);
    unint64_t v10 = v8 - *v7;
    if (v9 < (v10 >> 2))
    {
      unint64_t v11 = v10 - 4;
      do
      {
        v8 -= 4;
        unint64_t v12 = v11 >> 2;
        v11 -= 4;
      }
      while (v9 < v12);
      v7[1] = v8;
    }
    memset(v50, 0, sizeof(v50));
    int v51 = 1065353216;
    uint64_t v13 = *v7;
    if (v7[1] != *v7)
    {
      unint64_t v14 = 0;
      do
      {
        LODWORD(v44) = 0;
        LODWORD(v44) = *(_DWORD *)(v13 + 4 * v14);
        __p = &v44;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v50, (int *)&v44, (uint64_t)&std::piecewise_construct, (_DWORD **)&__p)+ 5) = 1;
        ++v14;
        uint64_t v13 = *v7;
      }
      while (v14 < (v7[1] - *v7) >> 2);
    }
    __p = 0;
    int v48 = 0;
    uint64_t v49 = 0;
    uint64_t v15 = *a3;
    if (a3[1] == *a3)
    {
      for (unint64_t i = 0; ; ++i)
      {
        uint64_t v33 = (void *)(*(uint64_t (**)(void))(**(void **)(a1 + 368) + 72))(*(void *)(a1 + 368));
        if (i >= (uint64_t)(v33[1] - *v33) >> 2) {
          break;
        }
        LODWORD(v52) = 0;
        LODWORD(v52) = *(_DWORD *)(*(void *)(*(uint64_t (**)(void))(**(void **)(a1 + 368) + 72))(*(void *)(a1 + 368))
                                 + 4 * i);
        unint64_t v44 = (void ***)&v52;
        if (*((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v50, (int *)&v52, (uint64_t)&std::piecewise_construct, (_DWORD **)&v44)+ 5) != 1)
        {
          uint64_t v34 = v48;
          if (v48 >= v49)
          {
            uint64_t v36 = (char *)__p;
            uint64_t v37 = (v48 - (unsigned char *)__p) >> 2;
            unint64_t v38 = v37 + 1;
            if ((unint64_t)(v37 + 1) >> 62) {
              std::vector<double>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v39 = v49 - (unsigned char *)__p;
            if ((v49 - (unsigned char *)__p) >> 1 > v38) {
              unint64_t v38 = v39 >> 1;
            }
            if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v40 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v40 = v38;
            }
            if (v40)
            {
              unint64_t v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v49, v40);
              uint64_t v36 = (char *)__p;
              uint64_t v34 = v48;
            }
            else
            {
              unint64_t v41 = 0;
            }
            uint64_t v42 = &v41[4 * v37];
            *(_DWORD *)uint64_t v42 = v52;
            unint64_t v35 = v42 + 4;
            while (v34 != v36)
            {
              int v43 = *((_DWORD *)v34 - 1);
              v34 -= 4;
              *((_DWORD *)v42 - 1) = v43;
              v42 -= 4;
            }
            __p = v42;
            int v48 = v35;
            uint64_t v49 = &v41[4 * v40];
            if (v36) {
              operator delete(v36);
            }
          }
          else
          {
            *(_DWORD *)int v48 = v52;
            unint64_t v35 = v34 + 4;
          }
          int v48 = v35;
        }
      }
    }
    else
    {
      unint64_t v16 = 0;
      do
      {
        LODWORD(v52) = 0;
        LODWORD(v52) = *(_DWORD *)(v15 + 4 * v16);
        unint64_t v44 = (void ***)&v52;
        if (*((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v50, (int *)&v52, (uint64_t)&std::piecewise_construct, (_DWORD **)&v44)+ 5) != 1)
        {
          uint64_t v17 = v48;
          if (v48 >= v49)
          {
            uint64_t v19 = (char *)__p;
            uint64_t v20 = (v48 - (unsigned char *)__p) >> 2;
            unint64_t v21 = v20 + 1;
            if ((unint64_t)(v20 + 1) >> 62) {
              std::vector<double>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v22 = v49 - (unsigned char *)__p;
            if ((v49 - (unsigned char *)__p) >> 1 > v21) {
              unint64_t v21 = v22 >> 1;
            }
            if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v23 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v23 = v21;
            }
            if (v23)
            {
              unint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v49, v23);
              uint64_t v19 = (char *)__p;
              uint64_t v17 = v48;
            }
            else
            {
              unint64_t v24 = 0;
            }
            unint64_t v25 = &v24[4 * v20];
            *(_DWORD *)unint64_t v25 = v52;
            uint64_t v18 = v25 + 4;
            while (v17 != v19)
            {
              int v26 = *((_DWORD *)v17 - 1);
              v17 -= 4;
              *((_DWORD *)v25 - 1) = v26;
              v25 -= 4;
            }
            __p = v25;
            int v48 = v18;
            uint64_t v49 = &v24[4 * v23];
            if (v19) {
              operator delete(v19);
            }
          }
          else
          {
            *(_DWORD *)int v48 = v52;
            uint64_t v18 = v17 + 4;
          }
          int v48 = v18;
        }
        ++v16;
        uint64_t v15 = *a3;
      }
      while (v16 < (a3[1] - *a3) >> 2);
    }
    unint64_t v44 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    uint64_t v27 = std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>((uint64_t *)&v44, (uint64_t)v7);
    uint64_t v28 = *(unsigned int *)(a1 + 304);
    int v29 = *(void (****)(void, uint64_t, void **, uint64_t, uint64_t))(a1 + 360);
    uint64_t v45 = v27;
    CPMLNaiveBayes::predict(v29, (uint64_t)&v44, (unsigned int **)&__p, v28, a1 + 176);
    int v52 = &v44;
    std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v52);
    if (__p)
    {
      int v48 = (char *)__p;
      operator delete(__p);
    }
    std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)v50);
  }
  CPMLFeatureVector::setYHatProbList((uint64_t)this, a1 + 176);
  uint64_t result = 0;
  *(void *)(a1 + 184) = *(void *)(a1 + 176);
  return result;
}

void sub_214320BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, char a17)
{
  *(void *)(v18 - 88) = v17;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v18 - 88));
  if (__p) {
    operator delete(__p);
  }
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)&a17);
  _Unwind_Resume(a1);
}

void CPMLNaiveBayesSuggestionsClassifier::update(CPMLNaiveBayesSuggestionsClassifier *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
}

void sub_214320EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

uint64_t CPMLNaiveBayesSuggestionsClassifier::errorString(CPMLNaiveBayesSuggestionsClassifier *this)
{
  return 0;
}

uint64_t std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table(uint64_t a1)
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

void *std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
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
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  unint64_t v11 = operator new(0x18uLL);
  *unint64_t v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *((_DWORD *)v11 + 5) = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__rehash<true>(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  uint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *unint64_t v11 = *v20;
LABEL_38:
    *uint64_t v20 = v11;
    goto LABEL_39;
  }
  *unint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    uint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_214321124(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
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
      unint64_t v11 = (void *)*v7;
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
            *uint64_t v7 = *v11;
            *unint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    unint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void CPMLLogger::CPMLLogger(CPMLLogger *this, char *a2, char a3)
{
  uint64_t v6 = (uint64_t *)((char *)this + 8);
  uint64_t v7 = (uint64_t *)((char *)this + 424);
  uint64_t v8 = MEMORY[0x263F8C310] + 64;
  *((void *)this + 53) = MEMORY[0x263F8C310] + 64;
  uint8x8_t v9 = (char *)this + 16;
  uint64_t v10 = *(void *)(MEMORY[0x263F8C2B0] + 16);
  uint64_t v11 = *(void *)(MEMORY[0x263F8C2B0] + 8);
  *((void *)this + 1) = v11;
  *(uint64_t *)((char *)v6 + *(void *)(v11 - 24)) = v10;
  unint64_t v12 = (std::ios_base *)((char *)this + *(void *)(*((void *)this + 1) - 24) + 8);
  std::ios_base::init(v12, (char *)this + 16);
  uint64_t v13 = MEMORY[0x263F8C310] + 24;
  v12[1].__vftable = 0;
  v12[1].__fmtflags_ = -1;
  uint64_t *v6 = v13;
  *uint64_t v7 = v8;
  MEMORY[0x21669D9F0](v9);
  *((void *)this + 74) = 0;
  *((_OWORD *)this + 36) = 0u;
  *(unsigned char *)this = a3;
  std::string::basic_string[abi:ne180100]<0>(&__p, "/tmp/");
  std::string::append(&__p, a2);
  if (*(unsigned char *)this)
  {
    std::ofstream::open();
    time(0);
    float v14 = (void *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v14 + *(void *)(*v14 - 24)));
    BOOL v15 = std::locale::use_facet(&v17, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v15->__vftable[2].~facet_0)(v15, 10);
    std::locale::~locale(&v17);
    std::ostream::put();
    std::ostream::flush();
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_2143215DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, std::locale a15)
{
  if (*(char *)(v16 + 599) < 0) {
    operator delete(*(void **)(v16 + 576));
  }
  std::ofstream::~ofstream(v15);
  _Unwind_Resume(a1);
}

uint64_t CPMLLogger::CPMLLogger(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = (uint64_t *)(a1 + 8);
  uint64_t v7 = (uint64_t *)(a1 + 424);
  uint64_t v8 = MEMORY[0x263F8C310] + 64;
  *(void *)(a1 + 424) = MEMORY[0x263F8C310] + 64;
  uint64_t v9 = a1 + 16;
  uint64_t v10 = *(void *)(MEMORY[0x263F8C2B0] + 16);
  uint64_t v11 = *(void *)(MEMORY[0x263F8C2B0] + 8);
  *(void *)(a1 + 8) = v11;
  *(uint64_t *)((char *)v6 + *(void *)(v11 - 24)) = v10;
  unint64_t v12 = (std::ios_base *)(a1 + 8 + *(void *)(*(void *)(a1 + 8) - 24));
  std::ios_base::init(v12, (void *)(a1 + 16));
  uint64_t v13 = MEMORY[0x263F8C310] + 24;
  v12[1].__vftable = 0;
  v12[1].__fmtflags_ = -1;
  uint64_t *v6 = v13;
  *uint64_t v7 = v8;
  MEMORY[0x21669D9F0](v9);
  *(void *)(a1 + 592) = 0;
  *(_OWORD *)(a1 + 576) = 0u;
  *(unsigned char *)a1 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__p, "/tmp/");
  int v14 = *(char *)(a2 + 23);
  if (v14 >= 0) {
    BOOL v15 = (const std::string::value_type *)a2;
  }
  else {
    BOOL v15 = *(const std::string::value_type **)a2;
  }
  if (v14 >= 0) {
    std::string::size_type v16 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v16 = *(void *)(a2 + 8);
  }
  std::string::append(&__p, v15, v16);
  if (*(unsigned char *)a1)
  {
    std::ofstream::open();
    time(0);
    std::locale v17 = (void *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
    size_t v18 = std::locale::use_facet(&v21, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v18->__vftable[2].~facet_0)(v18, 10);
    std::locale::~locale(&v21);
    std::ostream::put();
    std::ostream::flush();
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return a1;
}

void sub_2143218C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, std::locale a15)
{
  if (*(char *)(v16 + 599) < 0) {
    operator delete(*(void **)(v16 + 576));
  }
  std::ofstream::~ofstream(v15);
  _Unwind_Resume(a1);
}

void CPMLLogger::~CPMLLogger(CPMLLogger *this)
{
  uint64_t v2 = (void *)((char *)this + 8);
  if ((*((unsigned char *)this + *(void *)(*((void *)this + 1) - 24) + 40) & 5) == 0
    && *((void *)this + 17)
    && !std::filebuf::close())
  {
    std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24)), *(_DWORD *)((char *)v2 + *(void *)(*v2 - 24) + 32) | 4);
  }
  if (*((char *)this + 599) < 0) {
    operator delete(*((void **)this + 72));
  }
  uint64_t v3 = MEMORY[0x263F8C2B0];
  uint64_t v4 = *MEMORY[0x263F8C2B0];
  *((void *)this + 1) = *MEMORY[0x263F8C2B0];
  *(void *)((char *)v2 + *(void *)(v4 - 24)) = *(void *)(v3 + 24);
  MEMORY[0x21669DA00]((char *)this + 16);
  std::ostream::~ostream();
  MEMORY[0x21669DB40]((char *)this + 424);
}

uint64_t CPMLLogger::cpmlLog(uint64_t this, const char *a2)
{
  if (*(unsigned char *)this)
  {
    uint64_t v2 = (void *)(this + 8);
    if ((*(unsigned char *)(this + 8 + *(void *)(*(void *)(this + 8) - 24) + 32) & 5) == 0)
    {
      if (*(void *)(this + 136))
      {
        std::ostream::write();
        std::ios_base::getloc((const std::ios_base *)((char *)v2 + *(void *)(*v2 - 24)));
        uint64_t v3 = std::locale::use_facet(&v4, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v3->__vftable[2].~facet_0)(v3, 10);
        std::locale::~locale(&v4);
        std::ostream::put();
        return std::ostream::flush();
      }
    }
  }
  return this;
}

void sub_214321B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

void *CPMLLogger::cpmlLog(void *result, uint64_t a2)
{
  if (*(unsigned char *)result)
  {
    uint64_t v2 = result;
    uint64_t v3 = result[1];
    if ((*((unsigned char *)++result + *(void *)(v3 - 24) + 32) & 5) == 0)
    {
      if (v2[17])
      {
        uint64_t v4 = *(void *)(a2 + 8);
        if (*(char *)(a2 + 23) >= 0)
        {
          uint64_t v5 = *(unsigned __int8 *)(a2 + 23);
        }
        else
        {
          a2 = *(void *)a2;
          uint64_t v5 = v4;
        }
        uint64_t v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(result, a2, v5);
        std::ios_base::getloc((const std::ios_base *)((char *)v6 + *(void *)(*v6 - 24)));
        uint64_t v7 = std::locale::use_facet(&v8, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 10);
        std::locale::~locale(&v8);
        std::ostream::put();
        return (void *)std::ostream::flush();
      }
    }
  }
  return result;
}

void sub_214321C80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
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
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void CPNaiveBayesV2Classifier::CPNaiveBayesV2Classifier(CPNaiveBayesV2Classifier *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, a2, a3, a4);
  *size_t v5 = &unk_26C5101C0;
  v5[29] = 0;
  v5[30] = 0;
  v5[31] = 0;
  var0 = a2->var0;
  uint64_t v7 = *((int *)a2->var0 + 33);
  v5[12] = *((int *)a2->var0 + 31);
  v5[13] = v7;
  uint64_t v8 = (uint64_t)(*((void *)var0 + 4) - *((void *)var0 + 3)) >> 3;
  v5[19] = 0;
  v5[20] = v8;
  uint64_t v9 = *(void *)var0;
  v5[21] = (uint64_t)(*((void *)var0 + 1) - *(void *)var0) >> 2;
  v5[22] = v9;
  uint64_t v10 = (uint64_t)(*((void *)var0 + 7) - *((void *)var0 + 6)) >> 2;
  v5[25] = v7;
  v5[26] = v10;
  CPMLCDB::getIterator();
}

void sub_214321E04(_Unwind_Exception *a1)
{
  size_t v4 = *v2;
  if (*v2)
  {
    v1[30] = v4;
    operator delete(v4);
  }
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void *CPNaiveBayesV2Classifier::initializeNaiveBayesV2Memory(CPNaiveBayesV2Classifier *this)
{
  *((void *)this + 18) = malloc_type_calloc(*((void *)this + 13), 8uLL, 0x100004000313F17uLL);
  size_t v2 = *((void *)this + 13);
  if (!v2)
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(0);
    CPMLLog::log(CPMLLog, CPML_LOG_DEBUG, "initializeNaiveBayesV2Memory", "resultcardinality 0");
    size_t v2 = 1;
    *((void *)this + 13) = 1;
  }
  if (*((void *)this + 21))
  {
    *((void *)this + 23) = malloc_type_calloc(v2, 8uLL, 0x80040B8603338uLL);
    if (*((void *)this + 13))
    {
      size_t v4 = 0;
      size_t v5 = *((void *)this + 21);
      do
      {
        *(void *)(*((void *)this + 23) + 8 * v4) = malloc_type_calloc(v5, 8uLL, 0x10040436913F5uLL);
        size_t v5 = *((void *)this + 21);
        if (v5)
        {
          for (size_t i = 0; i < v5; ++i)
          {
            *(void *)(*(void *)(*((void *)this + 23) + 8 * v4) + 8 * i) = malloc_type_calloc(*(int *)(*((void *)this + 22) + 4 * i), 8uLL, 0x100004000313F17uLL);
            size_t v5 = *((void *)this + 21);
          }
        }
        ++v4;
        size_t v2 = *((void *)this + 13);
      }
      while (v2 > v4);
    }
    else
    {
      size_t v2 = 0;
    }
  }
  if (*((void *)this + 20))
  {
    *((void *)this + 16) = malloc_type_calloc(v2, 8uLL, 0x80040B8603338uLL);
    *((void *)this + 17) = malloc_type_calloc(*((void *)this + 13), 8uLL, 0x80040B8603338uLL);
    *((void *)this + 14) = malloc_type_calloc(*((void *)this + 13), 8uLL, 0x80040B8603338uLL);
    *((void *)this + 15) = malloc_type_calloc(*((void *)this + 13), 8uLL, 0x80040B8603338uLL);
    if (*((void *)this + 13))
    {
      unint64_t v7 = 0;
      do
      {
        *(void *)(*((void *)this + 16) + 8 * v7) = malloc_type_calloc(*((void *)this + 12), 8uLL, 0x100004000313F17uLL);
        *(void *)(*((void *)this + 17) + 8 * v7) = malloc_type_calloc(*((void *)this + 12), 8uLL, 0x100004000313F17uLL);
        *(void *)(*((void *)this + 14) + 8 * v7) = malloc_type_calloc(*((void *)this + 12), 8uLL, 0x100004000313F17uLL);
        *(void *)(*((void *)this + 15) + 8 * v7++) = malloc_type_calloc(*((void *)this + 12), 8uLL, 0x100004000313F17uLL);
      }
      while (*((void *)this + 13) > v7);
    }
  }
  uint64_t result = (void *)*((void *)this + 26);
  if (result)
  {
    *((void *)this + 24) = malloc_type_calloc((size_t)result, 8uLL, 0x10040436913F5uLL);
    uint64_t result = malloc_type_calloc(*((void *)this + 13), 8uLL, 0x100004000313F17uLL);
    *((void *)this + 27) = result;
    if (*((void *)this + 26))
    {
      unint64_t v9 = 0;
      do
      {
        uint64_t result = malloc_type_calloc(*((void *)this + 25) * *((void *)this + 25), 8uLL, 0x100004000313F17uLL);
        *(void *)(*((void *)this + 24) + 8 * v9++) = result;
      }
      while (*((void *)this + 26) > v9);
    }
  }
  return result;
}

void CPNaiveBayesV2Classifier::CPNaiveBayesV2Classifier(CPNaiveBayesV2Classifier *this, CPMLSerialization *a2, CPMLTunableData *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, a2, a3);
  *size_t v5 = &unk_26C5101C0;
  v5[29] = 0;
  v5[30] = 0;
  v5[31] = 0;
  (*((void (**)(CPMLSerialization *, void *, const char *, uint64_t, void))a2->var0 + 10))(a2, v5 + 19, "totalDataCount", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 96, "featureVectorSpace", 1, 0);
  uint64_t v6 = (unint64_t *)((char *)this + 104);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 104, "resultCardinality", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 160, "continousFeatureCount", 1, 0);
  unint64_t v7 = (uint64_t *)((char *)this + 168);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 168, "discreteFeatureCount", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 200, "vectorCount", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 208, "vectorFeatureCount", 1, 0);
  if (*((void *)this + 21))
  {
    *((void *)this + 22) = malloc_type_calloc(*((void *)this + 21), 4uLL, 0x100004052888210uLL);
    (*((void (**)(CPMLSerialization *))a2->var0 + 8))(a2);
  }
  CPNaiveBayesV2Classifier::initializeNaiveBayesV2Memory(this);
  unint64_t v8 = *v6;
  if (*v7)
  {
    if (!v8) {
      goto LABEL_15;
    }
    unint64_t v9 = 0;
    uint64_t v10 = 1;
    do
    {
      if (v10)
      {
        unint64_t v11 = 0;
        do
        {
          sprintf(v14, "discreteFeatureTable%d", v11);
          (*((void (**)(CPMLSerialization *, void, char *, void, void))a2->var0 + 10))(a2, *(void *)(*(void *)(*((void *)this + 23) + 8 * v9) + 8 * v11), v14, *(int *)(*((void *)this + 22) + 4 * v11), 0);
          ++v11;
          uint64_t v10 = *v7;
        }
        while (*v7 > v11);
        unint64_t v8 = *v6;
      }
      ++v9;
    }
    while (v8 > v9);
  }
  if (*((void *)this + 20) && v8)
  {
    unint64_t v12 = 0;
    do
    {
      sprintf(v14, "datasetMean%d", v12);
      sprintf(v13, "datasetVariance%d", v12);
      (*((void (**)(CPMLSerialization *, void, char *, void, void))a2->var0 + 12))(a2, *(void *)(*((void *)this + 14) + 8 * v12), v14, *((void *)this + 12), 0);
      (*((void (**)(CPMLSerialization *, void, char *, void, void))a2->var0 + 12))(a2, *(void *)(*((void *)this + 15) + 8 * v12++), v13, *((void *)this + 12), 0);
    }
    while (*v6 > v12);
  }
LABEL_15:
  (*((void (**)(CPMLSerialization *, void, const char *))a2->var0 + 10))(a2, *((void *)this + 18), "dist_datasetOutput");
  (*((void (**)(CPMLSerialization *, void, const char *, void, void))a2->var0 + 12))(a2, *((void *)this + 27), "pY_tableFreqCount", *((void *)this + 13), 0);
}

void sub_2143225B8(_Unwind_Exception *a1)
{
  size_t v4 = *v2;
  if (*v2)
  {
    v1[30] = v4;
    operator delete(v4);
  }
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPNaiveBayesV2Classifier::~CPNaiveBayesV2Classifier(CPNaiveBayesV2Classifier *this)
{
  *(void *)this = &unk_26C5101C0;
  if (*((void *)this + 21))
  {
    if (*((void *)this + 13))
    {
      unint64_t v2 = 0;
      do
      {
        if (*((void *)this + 21))
        {
          unint64_t v3 = 0;
          do
            free(*(void **)(*(void *)(*((void *)this + 23) + 8 * v2) + 8 * v3++));
          while (*((void *)this + 21) > v3);
        }
        free(*(void **)(*((void *)this + 23) + 8 * v2++));
      }
      while (*((void *)this + 13) > v2);
    }
    free(*((void **)this + 23));
  }
  if (*((void *)this + 20))
  {
    if (*((void *)this + 13))
    {
      unint64_t v4 = 0;
      do
      {
        free(*(void **)(*((void *)this + 16) + 8 * v4));
        free(*(void **)(*((void *)this + 17) + 8 * v4));
        free(*(void **)(*((void *)this + 14) + 8 * v4));
        free(*(void **)(*((void *)this + 15) + 8 * v4++));
      }
      while (*((void *)this + 13) > v4);
    }
    free(*((void **)this + 16));
    free(*((void **)this + 17));
    free(*((void **)this + 14));
    free(*((void **)this + 15));
  }
  free(*((void **)this + 18));
  free(*((void **)this + 27));
  size_t v5 = (void *)*((void *)this + 29);
  if (v5)
  {
    *((void *)this + 3(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = v5;
    operator delete(v5);
  }

  CPModelClose(this);
}

{
  uint64_t vars8;

  CPNaiveBayesV2Classifier::~CPNaiveBayesV2Classifier(this);

  JUMPOUT(0x21669DB80);
}

uint64_t CPNaiveBayesV2Classifier::serialize(CPNaiveBayesV2Classifier *this)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 152, "totalDataCount", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 96, "featureVectorSpace", 1, 0);
  unint64_t v2 = (unint64_t *)((char *)this + 104);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 104, "resultCardinality", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 160, "continousFeatureCount", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 168, "discreteFeatureCount", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 200, "vectorCount", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 208, "vectorFeatureCount", 1, 0);
  uint64_t v3 = *((void *)this + 21);
  if (v3)
  {
    (*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 16))(*((void *)this + 11), *((void *)this + 22), "discreteCardinality", v3, 0);
    if (!*((void *)this + 13)) {
      goto LABEL_14;
    }
    unint64_t v4 = 0;
    do
    {
      sprintf(v10, "discreteFeatureTable%d", v4);
      if (*((void *)this + 21))
      {
        unint64_t v5 = 0;
        do
        {
          (*(void (**)(void, void, char *, void, void))(**((void **)this + 11) + 32))(*((void *)this + 11), *(void *)(*(void *)(*((void *)this + 23) + 8 * v4) + 8 * v5), v10, *(int *)(*((void *)this + 22) + 4 * v5), 0);
          ++v5;
        }
        while (*((void *)this + 21) > v5);
      }
      ++v4;
      unint64_t v6 = *v2;
    }
    while (*v2 > v4);
  }
  else
  {
    unint64_t v6 = *v2;
  }
  if (*((void *)this + 20) && v6)
  {
    unint64_t v7 = 0;
    do
    {
      sprintf(v10, "datasetMean%d", v7);
      sprintf(v9, "datasetVariance%d", v7);
      (*(void (**)(void, void, char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *(void *)(*((void *)this + 14) + 8 * v7), v10, *((void *)this + 12), 0);
      (*(void (**)(void, void, char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *(void *)(*((void *)this + 15) + 8 * v7++), v9, *((void *)this + 12), 0);
    }
    while (*((void *)this + 13) > v7);
  }
LABEL_14:
  (*(void (**)(void, void, const char *))(**((void **)this + 11) + 32))(*((void *)this + 11), *((void *)this + 18), "dist_datasetOutput");
  (*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 27), "pY_tableFreqCount", *((void *)this + 13), 0);
  return 0;
}

uint64_t CPNaiveBayesV2Classifier::train(CPNaiveBayesV2Classifier *this)
{
  uint64_t result = (*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
  if (result)
  {
    uint64_t v3 = (CPMLFeatureVector *)result;
    while (1)
    {
      YVectorVector = (CPMLLog *)CPMLFeatureVector::getYVectorVector(v3);
      unint64_t v5 = *(char ****)YVectorVector;
      unint64_t v6 = *((void *)YVectorVector + 1) - *(void *)YVectorVector;
      if (!v6) {
        break;
      }
      ++*((void *)this + 19);
      if (v6 < 0x11)
      {
        if (v6 == 16)
        {
          std::locale v21 = *v5;
          uint64_t v20 = **v5;
          unint64_t v22 = v21[1] - v20;
          unint64_t v23 = v22 >> 2;
          if ((v22 >> 2))
          {
            if (v23 == 1)
            {
              *(double *)(*((void *)this + 27) + 8 * *(int *)v2(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = *(double *)(*((void *)this + 27)
                                                                                  + 8 * *(int *)v20)
                                                                      + 1.0;
            }
            else if ((int)v23 >= 1)
            {
              uint64_t v24 = 0;
              uint64_t v25 = *((void *)this + 27);
              uint64_t v26 = (v22 >> 2);
              do
              {
                uint64_t v27 = 0;
                uint64_t v28 = *(int *)&v20[4 * v24];
                *(double *)(v25 + 8 * v28) = *(double *)(v25 + 8 * v28) + 1.0;
                do
                {
                  if (v24 != v27)
                  {
                    uint64_t v29 = *(int *)&v20[4 * v27] + *((void *)this + 25) * v28;
                    ++*(void *)(**((void **)this + 24) + 8 * v29);
                  }
                  ++v27;
                }
                while (v26 != v27);
                ++v24;
              }
              while (v24 != v26);
            }
          }
        }
      }
      else
      {
        XVectorVector = (CPMLLog *)CPMLFeatureVector::getXVectorVector(v3);
        CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(XVectorVector);
        unint64_t v9 = (CPMLLog *)CPMLLog::log(CPMLLog, CPML_LOG_DEBUG, "train", "Too many Y\n");
        uint64_t v11 = *(void *)XVectorVector;
        uint64_t v10 = *((void *)XVectorVector + 1);
        if (v10 != *(void *)XVectorVector)
        {
          unint64_t v12 = 0;
          do
          {
            uint64_t v13 = *(void **)(v11 + 16 * v12);
            uint64_t v14 = v13[1] - *v13;
            if (v14)
            {
              unint64_t v15 = 0;
              unint64_t v16 = v14 >> 2;
              do
              {
                uint64_t v17 = 0;
                if (v16 <= 1) {
                  unint64_t v16 = 1;
                }
                do
                {
                  if (v15 != v17)
                  {
                    uint64_t v18 = *(void *)(*((void *)this + 24) + 8 * v12);
                    ++*(void *)(v18 + 8 * (v17 + v15 * *((void *)this + 25)));
                  }
                  ++v17;
                }
                while (v16 != v17);
                uint64_t v19 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v9);
                unint64_t v9 = (CPMLLog *)CPMLLog::log(v19, CPML_LOG_DEBUG, "train", "%d \n", *(_DWORD *)(*v13 + 4 * v15++));
                unint64_t v16 = (uint64_t)(v13[1] - *v13) >> 2;
              }
              while (v16 > v15);
              uint64_t v11 = *(void *)XVectorVector;
              uint64_t v10 = *((void *)XVectorVector + 1);
            }
            ++v12;
          }
          while (v12 < (v10 - v11) >> 4);
        }
      }
      uint64_t result = (*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
      uint64_t v3 = (CPMLFeatureVector *)result;
      if (!result) {
        return result;
      }
    }
    uint64_t v30 = (pthread_mutex_t *)CPMLLog::getCPMLLog(YVectorVector);
    CPMLLog::log(v30, CPML_LOG_ERR, "train", "no vectors to process\n");
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t CPNaiveBayesV2Classifier::eval(uint64_t a1, CPMLFeatureVector *a2)
{
  v57[1] = *MEMORY[0x263EF8340];
  size_t v3 = *(void *)(a1 + 104);
  if (v3)
  {
    unint64_t v5 = malloc_type_calloc(v3, 0x10uLL, 0x1000040F7F8B94BuLL);
    unint64_t v6 = (long double *)malloc_type_calloc(*(void *)(a1 + 104), 8uLL, 0x100004000313F17uLL);
    *(void *)(a1 + 224) = v6;
    unint64_t v7 = *(void *)(a1 + 104);
    if (v7)
    {
      unint64_t v8 = v6;
      uint64_t v9 = *(void *)(a1 + 216);
      double v10 = log((double)v7 + (double)*(unint64_t *)(a1 + 152));
      for (uint64_t i = 0; i != v7; ++i)
        v8[i] = log(*(double *)(v9 + 8 * i) + 1.0) - v10;
      uint64_t v12 = 0;
      uint64_t v13 = v5 + 1;
      do
      {
        *((_DWORD *)v13 - 2) = v12;
        *uint64_t v13 = *(void *)&v8[v12];
        v13 += 2;
        ++v12;
      }
      while (v7 != v12);
    }
    XVectorVector = (CPMLLog *)CPMLFeatureVector::getXVectorVector(a2);
    if (*((void *)XVectorVector + 1) == *(void *)XVectorVector)
    {
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(XVectorVector);
      CPMLLog::log(CPMLLog, CPML_LOG_ERR, "eval", "only vector support");
      size_t v15 = *(void *)(a1 + 104);
    }
    else if (*(void *)(a1 + 104))
    {
      unint64_t v16 = XVectorVector;
      size_t v17 = 0;
      do
      {
        uint64_t v18 = (uint64_t)(*(void *)(**(void **)v16 + 8) - ***(void ***)v16) >> 2;
        uint64_t v19 = v18;
        uint64_t v20 = MEMORY[0x270FA5388](XVectorVector, v15);
        MEMORY[0x270FA5388](v20, v21);
        uint64_t v26 = (double *)((char *)v57 - v25);
        if ((int)v18 >= 1)
        {
          uint64_t v27 = *v24;
          uint64_t v28 = v18;
          uint64_t v29 = (double *)((char *)v57 - v25);
          uint64_t v30 = v23;
          do
          {
            int v32 = *v27++;
            int v31 = v32;
            if (v32 == -1)
            {
              LODWORD(v18) = 0;
              double v35 = *(double *)(*(void *)(a1 + 216) + 8 * v17);
              goto LABEL_22;
            }
            *v29++ = (double)*(unint64_t *)(**(void **)(a1 + 192) + 8 * (v17 + *(void *)(a1 + 200) * v31));
            *v30++ = v31;
            --v28;
          }
          while (v28);
          if (v22)
          {
            uint64_t v33 = v18;
            do
            {
              uint64_t v34 = *v23++;
              v5[2 * v34 + 1] = 0xC202A05F20000000;
              --v33;
            }
            while (v33);
          }
        }
        double v35 = *(double *)(*(void *)(a1 + 216) + 8 * v17);
        if (v18)
        {
          double v36 = 0.0;
          do
          {
            long double v37 = log(*v26 + 1.0);
            *v26++ = v37;
            double v36 = v36 + v37;
            --v19;
          }
          while (v19);
        }
        else
        {
LABEL_22:
          double v36 = 0.0;
        }
        *(long double *)&v5[2 * v17 + 1] = *(double *)&v5[2 * v17 + 1]
                                         + v36
                                         - (double)v18 * log(v35 + (double)v18);
        ++v17;
        size_t v15 = *(void *)(a1 + 104);
      }
      while (v15 > v17);
    }
    else
    {
      size_t v15 = 0;
    }
    qsort(v5, v15, 0x10uLL, (int (__cdecl *)(const void *, const void *))compareCPNaiveBayesResult);
    if (*(void *)(a1 + 104))
    {
      unint64_t v41 = 0;
      uint64_t v42 = (void *)(a1 + 232);
      int v43 = (void *)(a1 + 248);
      unint64_t v44 = *(char **)(a1 + 240);
      do
      {
        uint64_t v45 = (char *)&v5[2 * v41];
        uint64_t v46 = *((void *)v45 + 1);
        int v47 = *(_DWORD *)v45;
        if ((unint64_t)v44 >= *v43)
        {
          uint64_t v48 = (uint64_t)&v44[-*v42] >> 4;
          if ((unint64_t)(v48 + 1) >> 60) {
            std::vector<double>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v49 = *v43 - *v42;
          uint64_t v50 = v49 >> 3;
          if (v49 >> 3 <= (unint64_t)(v48 + 1)) {
            uint64_t v50 = v48 + 1;
          }
          if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v51 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v51 = v50;
          }
          if (v51) {
            int v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::valarray<char>>>(a1 + 248, v51);
          }
          else {
            int v52 = 0;
          }
          double v53 = &v52[16 * v48];
          *(void *)double v53 = v46;
          *((_DWORD *)v53 + 2) = v47;
          *((_DWORD *)v53 + 3) = 0;
          unint64_t v55 = *(char **)(a1 + 232);
          uint64_t v54 = *(char **)(a1 + 240);
          uint64_t v56 = v53;
          if (v54 != v55)
          {
            do
            {
              *((_OWORD *)v56 - 1) = *((_OWORD *)v54 - 1);
              v56 -= 16;
              v54 -= 16;
            }
            while (v54 != v55);
            uint64_t v54 = (char *)*v42;
          }
          unint64_t v44 = v53 + 16;
          *(void *)(a1 + 232) = v56;
          *(void *)(a1 + 24(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = v53 + 16;
          *(void *)(a1 + 248) = &v52[16 * v51];
          if (v54) {
            operator delete(v54);
          }
        }
        else
        {
          *(void *)unint64_t v44 = v46;
          *((_DWORD *)v44 + 2) = v47;
          *((_DWORD *)v44 + 3) = 0;
          v44 += 16;
        }
        *(void *)(a1 + 24(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = v44;
        ++v41;
      }
      while (v41 != 10 && *(void *)(a1 + 104) > v41);
    }
    CPMLFeatureVector::setYHatProbList((uint64_t)a2, a1 + 232);
    *(void *)(a1 + 24(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = *(void *)(a1 + 232);
    free(v5);
    return 0;
  }
  else
  {
    unint64_t v38 = (pthread_mutex_t *)CPMLLog::getCPMLLog(0);
    CPMLLog::log(v38, CPML_LOG_DEBUG, "eval", "resultcardinality 0");
    return 0xFFFFFFFFLL;
  }
}

uint64_t compareCPNaiveBayesResult(double *a1, double *a2)
{
  double v2 = a1[1];
  double v3 = a2[1];
  if (v2 > v3) {
    return 0xFFFFFFFFLL;
  }
  if (v2 == v3) {
    return 0;
  }
  return v2 < v3;
}

uint64_t CPNaiveBayesV2Classifier::errorString(CPNaiveBayesV2Classifier *this)
{
  return 0;
}

void *CPNaiveBayesV2Classifier::updateMeanV2(void *this)
{
  uint64_t v1 = this[13];
  if (v1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = this[20];
    do
    {
      if (v3)
      {
        unint64_t v4 = *(double **)(this[16] + 8 * v2);
        double v5 = (double)*(unint64_t *)(this[18] + 8 * v2);
        unint64_t v6 = *(double **)(this[14] + 8 * v2);
        uint64_t v7 = v3;
        do
        {
          double v8 = *v4++;
          *v6++ = v8 / v5;
          --v7;
        }
        while (v7);
      }
      ++v2;
    }
    while (v2 != v1);
  }
  return this;
}

void *CPNaiveBayesV2Classifier::updateVarianceV2(void *this)
{
  uint64_t v1 = this[13];
  if (v1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = this[20];
    do
    {
      if (v3)
      {
        unint64_t v4 = *(double **)(this[17] + 8 * v2);
        double v5 = (double)(unint64_t)(*(void *)(this[18] + 8 * v2) - 1);
        unint64_t v6 = *(double **)(this[15] + 8 * v2);
        uint64_t v7 = v3;
        do
        {
          double v8 = *v4++;
          *v6++ = v8 / v5;
          --v7;
        }
        while (v7);
      }
      ++v2;
    }
    while (v2 != v1);
  }
  return this;
}

void CPLogisticRegressionClassfier::Normalize(double **a1, void *a2)
{
  if (a2[1] != *a2)
  {
    uint64_t v4 = *(void *)(*a2 + 8) - *(void *)*a2;
    unint64_t v5 = (unint64_t)v4 >> 3;
    unint64_t v6 = a1 + 34;
    std::valarray<double>::resize((uint64_t)(a1 + 34), (int)(v4 >> 3), 2.22507386e-308);
    uint64_t v7 = a1 + 32;
    std::valarray<double>::resize((uint64_t)(a1 + 32), (int)(v4 >> 3), 1.79769313e308);
    double v8 = a1 + 36;
    std::valarray<double>::resize((uint64_t)(a1 + 36), (int)(v4 >> 3), 0.0);
    uint64_t v9 = *a2;
    uint64_t v10 = a2[1];
    uint64_t v11 = v10 - *a2;
    if (v10 != *a2)
    {
      uint64_t v12 = 0;
      unint64_t v13 = v11 >> 4;
      if (v13 <= 1) {
        unint64_t v13 = 1;
      }
      do
      {
        if ((int)v5 >= 1)
        {
          uint64_t v14 = *v6;
          size_t v15 = *(double **)(v9 + 16 * v12);
          unint64_t v16 = *v7;
          uint64_t v17 = ((unint64_t)v4 >> 3);
          do
          {
            double v18 = *v14;
            if (*v14 < *v15) {
              double v18 = *v15;
            }
            *v14++ = v18;
            double v19 = *v15++;
            double v20 = v19;
            if (v19 >= *v16) {
              double v20 = *v16;
            }
            *v16++ = v20;
            --v17;
          }
          while (v17);
        }
        ++v12;
      }
      while (v12 != v13);
    }
    char v22 = a1[34];
    uint64_t v21 = a1[35];
    uint64_t v23 = v21 - v22;
    if (v23 != a1[37] - a1[36]) {
      std::valarray<double>::resize((uint64_t)(a1 + 36), v21 - v22, 0.0);
    }
    if (v21 != v22)
    {
      uint64_t v24 = *v8;
      uint64_t v25 = *v6;
      uint64_t v26 = *v7;
      do
      {
        double v27 = *v25++;
        double v28 = v27;
        double v29 = *v26++;
        *v24++ = v28 - v29;
        --v23;
      }
      while (v23);
    }
    if ((int)v5 >= 1)
    {
      unint64_t v30 = 0;
      do
      {
        if ((*v8)[v30 / 8] == 0.0)
        {
          unint64_t v44 = (void *)MEMORY[0x263F8C100];
          uint64_t v45 = std::operator<<[abi:ne180100]<std::char_traits<char>>(MEMORY[0x263F8C100], "normalization failed due to zero range");
          std::endl[abi:ne180100]<char,std::char_traits<char>>(v45);
          std::operator<<[abi:ne180100]<std::char_traits<char>>(v44, "min: ");
          uint64_t v46 = (void *)std::ostream::operator<<();
          std::operator<<[abi:ne180100]<std::char_traits<char>>(v46, "\tmax: ");
          int v47 = (void *)std::ostream::operator<<();
          std::endl[abi:ne180100]<char,std::char_traits<char>>(v47);
          exit(1);
        }
        v30 += 8;
      }
      while ((v4 & 0x7FFFFFFF8) != v30);
    }
    uint64_t v31 = *a2;
    uint64_t v32 = a2[1];
    uint64_t v33 = v32 - *a2;
    if (v32 != *a2)
    {
      uint64_t v34 = 0;
      unint64_t v35 = v33 >> 4;
      if (v35 <= 1) {
        unint64_t v35 = 1;
      }
      do
      {
        double v36 = *(double **)(v31 + 16 * v34);
        uint64_t v37 = *(void *)(v31 + 16 * v34 + 8) - (void)v36;
        if (v37)
        {
          uint64_t v38 = v37 >> 3;
          uint64_t v39 = *v7;
          unint64_t v40 = *v8;
          do
          {
            double v41 = *v39++;
            double v42 = *v36 - v41;
            double v43 = *v40++;
            *v36++ = v42 / v43;
            --v38;
          }
          while (v38);
        }
        ++v34;
      }
      while (v34 != v35);
    }
  }
}

void CPLogisticRegressionClassfier::CPLogisticRegressionClassfier(CPLogisticRegressionClassfier *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, a2, a3, a4);
  *(void *)uint64_t v4 = &unk_26C510418;
  *(void *)(v4 + 20(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = 0;
  *(void *)(v4 + 208) = 0;
  *(void *)(v4 + 216) = 0;
  *(_OWORD *)(v4 + 24(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = 0u;
  *(_OWORD *)(v4 + 256) = 0u;
  *(_OWORD *)(v4 + 272) = 0u;
  *(_OWORD *)(v4 + 288) = 0u;
  strcpy((char *)(v4 + 8), "1.0.0");
  CPMLCDB::getIterator();
}

void sub_214323C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,char *a24,void *a25,uint64_t a26)
{
  a24 = &a15;
  std::vector<std::vector<data_record_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a24);
  a24 = &a18;
  std::vector<std::valarray<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a24);
  if (__p)
  {
    a22 = (uint64_t)__p;
    operator delete(__p);
  }
  std::valarray<double>::~valarray((uint64_t)v26 + 288);
  std::valarray<double>::~valarray((uint64_t)v26 + 272);
  std::valarray<double>::~valarray((uint64_t)v26 + 256);
  std::valarray<double>::~valarray(a9);
  a24 = a10;
  std::vector<std::vector<data_record_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a24);
  CPModelClose(v26);
  _Unwind_Resume(a1);
}

void CPLogisticRegressionClassfier::Init(uint64_t a1, uint64_t **a2, int a3, int a4, int a5, int a6)
{
  uint64_t v11 = a1 + 200;
  if ((uint64_t **)v11 != a2) {
    std::vector<std::vector<data_record_t>>::__assign_with_size[abi:ne180100]<std::vector<data_record_t>*,std::vector<data_record_t>*>(v11, *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * (a2[1] - *a2));
  }
  *(_DWORD *)(a1 + 192) = a3;
  *(_DWORD *)(a1 + 224) = a4;
  *(_DWORD *)(a1 + 228) = a5;
  *(_DWORD *)(a1 + 232) = a6;
  uint64_t v12 = *(double **)(a1 + 240);
  uint64_t v13 = *(void *)(a1 + 248) - (void)v12;
  if (v13 >= 1)
  {
    unint64_t v14 = ((unint64_t)v13 >> 3) + 1;
    do
    {
      *v12++ = (double)(a5 + 1);
      --v14;
    }
    while (v14 > 1);
  }
}

void *CPLogisticRegressionClassfier::initializeLogisticRegressionMemory(CPLogisticRegressionClassfier *this)
{
  *((void *)this + 21) = malloc_type_calloc(*((void *)this + 17), 8uLL, 0x80040B8603338uLL);
  if (*((void *)this + 17))
  {
    unint64_t v2 = 0;
    do
      *(void *)(*((void *)this + 21) + 8 * v2++) = malloc_type_calloc(*((void *)this + 18), 8uLL, 0x100004000313F17uLL);
    while (*((void *)this + 17) > v2);
  }
  *((void *)this + 19) = malloc_type_calloc(*((void *)this + 18), 8uLL, 0x100004000313F17uLL);
  uint64_t result = malloc_type_calloc(*((void *)this + 18), 8uLL, 0x100004000313F17uLL);
  *((void *)this + 2(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = result;
  return result;
}

double CPLogisticRegressionClassfier::ComputeSingleLogProb(uint64_t a1, uint64_t *a2, int a3, int a4, int a5)
{
  if (a3 == 1) {
    return -0.0;
  }
  if (a3 <= 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  unsigned int v8 = a3 - 1;
  size_t v9 = 8 * (a3 - 1);
  uint64_t v10 = operator new(v9);
  bzero(v10, v9);
  uint64_t v11 = 0;
  uint64_t v12 = *a2;
  uint64_t v13 = *(double **)(a1 + 8);
  uint64_t v14 = a4 + 1;
  unsigned int v28 = v8;
  uint64_t v15 = v8;
  unint64_t v16 = (double *)(v12 + 8);
  long double v17 = 1.0;
  do
  {
    double v18 = *(double *)(v12 + 8 * v11 * v14);
    double v19 = v16;
    uint64_t v20 = a4;
    uint64_t v21 = v13;
    if (a4 >= 1)
    {
      do
      {
        double v22 = *v21++;
        double v23 = v22;
        double v24 = *v19++;
        double v18 = v18 + v23 * v24;
        --v20;
      }
      while (v20);
    }
    *((double *)v10 + v11) = v18;
    long double v17 = v17 + exp(v18);
    ++v11;
    v16 += v14;
  }
  while (v11 != v15);
  if (v28 == a5)
  {
    double v25 = -log(v17);
  }
  else
  {
    double v26 = *((double *)v10 + a5);
    double v25 = v26 - log(v17);
  }
  operator delete(v10);
  return v25;
}

double CPLogisticRegressionClassfier::ObjectiveFunction(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  int v3 = -1431655765 * ((a2[1] - *a2) >> 3);
  if (v3 < 1) {
    return 0.0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = (*(void *)(*(void *)v2 + 16) - *(void *)(*(void *)v2 + 8)) >> 3;
  double v8 = 0.0;
  do
  {
    uint64_t v9 = *(void *)(v2 + 24 * v6);
    if (*(void *)(v2 + 24 * v6 + 8) != v9)
    {
      uint64_t v10 = 0;
      unint64_t v11 = 0;
      do
      {
        double v8 = v8 + CPLogisticRegressionClassfier::ComputeSingleLogProb(v9 + v10, a1, v3, v7, v6);
        ++v11;
        uint64_t v2 = *a2;
        uint64_t v9 = *(void *)(*a2 + 24 * v6);
        v10 += 32;
      }
      while (v11 < (*(void *)(*a2 + 24 * v6 + 8) - v9) >> 5);
    }
    ++v6;
  }
  while (v6 != v3);
  return v8;
}

double CPLogisticRegressionClassfier::ObjectiveFunction0(double **a1, uint64_t **a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = **a2;
  uint64_t v6 = (*a2)[1] - v5;
  if (v6)
  {
    uint64_t v7 = 0;
    unint64_t v8 = v6 >> 5;
    uint64_t v9 = (uint64_t)(*a1 + 1);
    double v10 = **a1;
    if (v8 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v8;
    }
    double v12 = 0.0;
    do
    {
      uint64_t v13 = *(double **)(v5 + 32 * v7 + 8);
      double v14 = v10;
      uint64_t v15 = *(void *)(v5 + 32 * v7 + 16) - (void)v13;
      if (v15)
      {
        unint64_t v16 = v15 >> 3;
        if (v16 <= 1) {
          unint64_t v16 = 1;
        }
        long double v17 = (double *)v9;
        double v14 = v10;
        do
        {
          double v18 = *v13++;
          double v19 = v18;
          double v20 = *v17++;
          double v14 = v14 + v19 * v20;
          --v16;
        }
        while (v16);
      }
      long double v21 = exp(v14);
      double v12 = v12 + log(v21 + 1.0);
      ++v7;
    }
    while (v7 != v11);
  }
  else
  {
    double v12 = 0.0;
  }
  double v22 = -v12;
  unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * (a2[1] - v4);
  if (v23 >= 2)
  {
    double v24 = *a1;
    for (uint64_t i = 1; i != v23; ++i)
    {
      double v26 = &v4[3 * i];
      uint64_t v27 = *v26;
      uint64_t v28 = v26[1] - *v26;
      if (v28)
      {
        uint64_t v29 = 0;
        unint64_t v30 = v28 >> 5;
        double v31 = *v24;
        if (v30 <= 1) {
          uint64_t v32 = 1;
        }
        else {
          uint64_t v32 = v30;
        }
        double v33 = 0.0;
        do
        {
          uint64_t v34 = *(double **)(v27 + 32 * v29 + 8);
          double v35 = v31;
          uint64_t v36 = *(void *)(v27 + 32 * v29 + 16) - (void)v34;
          if (v36)
          {
            unint64_t v37 = v36 >> 3;
            if (v37 <= 1) {
              unint64_t v37 = 1;
            }
            uint64_t v38 = v24 + 1;
            double v35 = v31;
            do
            {
              double v39 = *v34++;
              double v40 = v39;
              double v41 = *v38++;
              double v35 = v35 + v40 * v41;
              --v37;
            }
            while (v37);
          }
          double v42 = v33 + v35;
          long double v43 = exp(v35);
          double v33 = v42 - log(v43 + 1.0);
          ++v29;
        }
        while (v29 != v32);
      }
      else
      {
        double v33 = 0.0;
      }
      double v22 = v22 + v33;
    }
  }
  return v22;
}

void CPLogisticRegressionClassfier::ComputeSingleGradient(uint64_t a1, uint64_t *a2, int a3, int a4, int a5, uint64_t *a6)
{
  if (a5 < 0 || (int v6 = a5, a3 <= a5)) {
    CPLogisticRegressionClassfier::ComputeSingleGradient();
  }
  uint64_t v8 = *a2;
  uint64_t v9 = *a6;
  if (a2[1] - *a2 != a6[1] - *a6) {
    CPLogisticRegressionClassfier::ComputeSingleGradient();
  }
  uint64_t v12 = (a3 - 1);
  if (a3 == 1)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = operator new(8 * (int)v12);
    bzero(v13, 8 * (int)v12);
    if (a3 >= 2)
    {
      int v41 = v6;
      uint64_t v14 = 0;
      uint64_t v42 = a1;
      uint64_t v15 = *(double **)(a1 + 8);
      uint64_t v16 = a4 + 1;
      long double v17 = (double *)(v8 + 8);
      double v18 = 1.0;
      do
      {
        double v19 = *(double *)(v8 + 8 * v14 * v16);
        double v20 = v17;
        uint64_t v21 = a4;
        double v22 = v15;
        if (a4 >= 1)
        {
          do
          {
            double v23 = *v22++;
            double v24 = v23;
            double v25 = *v20++;
            double v19 = v19 + v24 * v25;
            --v21;
          }
          while (v21);
        }
        long double v26 = exp(v19);
        *((long double *)v13 + v14) = v26;
        double v18 = v18 + v26;
        ++v14;
        v17 += v16;
      }
      while (v14 != v12);
      uint64_t v27 = 0;
      a1 = v42;
      uint64_t v28 = *(double **)(v42 + 8);
      uint64_t v29 = (double *)(v9 + 8);
      int v6 = v41;
      do
      {
        double v30 = *((double *)v13 + v27);
        *(double *)(v9 + 8 * v27 * v16) = -v30 / v18;
        double v31 = v29;
        uint64_t v32 = a4;
        double v33 = v28;
        if (a4 >= 1)
        {
          do
          {
            double v34 = *v33++;
            *v31++ = -(v34 * v30) / v18;
            --v32;
          }
          while (v32);
        }
        ++v27;
        v29 += v16;
      }
      while (v27 != v12);
    }
  }
  if (v12 != v6)
  {
    int v35 = v6 + v6 * a4;
    *(double *)(v9 + 8 * v35) = *(double *)(v9 + 8 * v35) + 1.0;
    if (a4 >= 1)
    {
      uint64_t v36 = v35;
      unint64_t v37 = *(double **)(a1 + 8);
      uint64_t v38 = a4;
      double v39 = (double *)(v9 + 8 * v36 + 8);
      do
      {
        double v40 = *v37++;
        *double v39 = v40 + *v39;
        ++v39;
        --v38;
      }
      while (v38);
    }
  }
  if (v13)
  {
    operator delete(v13);
  }
}

void CPLogisticRegressionClassfier::ObjectiveFunctionGradient(uint64_t *a1, uint64_t **a2, uint64_t a3)
{
  int v3 = *(double **)a3;
  size_t v4 = *(void *)(a3 + 8) - *(void *)a3;
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  if (v4 != v5 - *a1) {
    CPLogisticRegressionClassfier::ObjectiveFunctionGradient();
  }
  uint64_t v11 = *a2;
  double v10 = a2[1];
  uint64_t v12 = **a2;
  uint64_t v14 = *(void *)(v12 + 8);
  uint64_t v13 = *(void *)(v12 + 16);
  long double v26 = 0;
  uint64_t v27 = 0;
  if (v5 == v6)
  {
    uint64_t v15 = 0;
  }
  else
  {
    if ((v4 & 0x8000000000000000) != 0) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v15 = (char *)operator new(v4);
    long double v26 = v15;
    bzero(v15, v4);
    uint64_t v27 = &v15[v4];
  }
  unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * (v10 - v11);
  if ((uint64_t)v4 >= 1) {
    bzero(v3, 8 * ((v4 >> 3) - (v4 > 7)) + 8);
  }
  if ((int)v16 >= 1)
  {
    uint64_t v17 = 0;
    unint64_t v18 = (unint64_t)(v13 - v14) >> 3;
    do
    {
      uint64_t v19 = v11[3 * v17];
      if (v11[3 * v17 + 1] != v19)
      {
        unint64_t v20 = 0;
        do
        {
          CPLogisticRegressionClassfier::ComputeSingleGradient(v19 + 32 * v20, a1, v16, v18, v17, (uint64_t *)&v26);
          uint64_t v21 = *(double **)a3;
          uint64_t v22 = *(void *)(a3 + 8) - *(void *)a3;
          if (v22)
          {
            unint64_t v23 = v22 >> 3;
            if (v23 <= 1) {
              unint64_t v23 = 1;
            }
            double v24 = (double *)v15;
            do
            {
              double v25 = *v24++;
              *uint64_t v21 = v25 + *v21;
              ++v21;
              --v23;
            }
            while (v23);
          }
          ++v20;
          uint64_t v11 = *a2;
          uint64_t v19 = (*a2)[3 * v17];
        }
        while (v20 < ((*a2)[3 * v17 + 1] - v19) >> 5);
      }
      ++v17;
    }
    while (v17 != v16);
  }
  if (v15)
  {
    operator delete(v15);
  }
}

void sub_2143246CC(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void CPLogisticRegressionClassfier::ObjectiveFunctionGradient0(uint64_t a1, uint64_t **a2, void **a3)
{
  uint64_t v5 = (unsigned char *)a3[1] - (unsigned char *)*a3;
  if (v5 >= 1) {
    bzero(*a3, 8 * (((unint64_t)v5 >> 3) - ((unint64_t)v5 > 7)) + 8);
  }
  uint64_t v6 = (*(void *)(a1 + 8) - *(void *)a1) >> 3;
  uint64_t v8 = *a2;
  uint64_t v7 = a2[1];
  if (0xAAAAAAAAAAAAAAABLL * (v7 - *a2) < 2) {
    goto LABEL_15;
  }
  unint64_t v9 = 1;
  do
  {
    double v10 = &v8[3 * v9];
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    uint64_t v13 = v12 - *v10;
    *(double *)*a3 = *(double *)*a3 + (double)(unint64_t)(v13 >> 5);
    if (!v13) {
      goto LABEL_14;
    }
    do
    {
      LODWORD(v39) = *(_DWORD *)v11;
      int v41 = 0;
      uint64_t v42 = 0;
      std::string __p = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, *(const void **)(v11 + 8), *(void *)(v11 + 16), (uint64_t)(*(void *)(v11 + 16) - *(void *)(v11 + 8)) >> 3);
      uint64_t v14 = (double *)__p;
      if ((int)v6 < 2)
      {
        if (!__p) {
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v15 = (double *)((char *)*a3 + 8);
        uint64_t v16 = (v6 - 1);
        uint64_t v17 = (double *)__p;
        do
        {
          double v18 = *v17++;
          *uint64_t v15 = v18 + *v15;
          ++v15;
          --v16;
        }
        while (v16);
      }
      int v41 = v14;
      operator delete(v14);
LABEL_12:
      v11 += 32;
    }
    while (v11 != v12);
    uint64_t v8 = *a2;
    uint64_t v7 = a2[1];
LABEL_14:
    ++v9;
  }
  while (0xAAAAAAAAAAAAAAABLL * (v7 - v8) > v9);
LABEL_15:
  if (v8 == v7) {
    return;
  }
  while (2)
  {
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    std::vector<data_record_t>::__init_with_size[abi:ne180100]<data_record_t*,data_record_t*>(&v36, *v8, v8[1], (v8[1] - *v8) >> 5);
    uint64_t v20 = v36;
    uint64_t v19 = v37;
    while (2)
    {
      if (v20 != v19)
      {
        LODWORD(v39) = *(_DWORD *)v20;
        int v41 = 0;
        uint64_t v42 = 0;
        std::string __p = 0;
        std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, *(const void **)(v20 + 8), *(void *)(v20 + 16), (uint64_t)(*(void *)(v20 + 16) - *(void *)(v20 + 8)) >> 3);
        double v21 = **(double **)a1;
        uint64_t v22 = (double *)__p;
        if ((int)v6 >= 2)
        {
          unint64_t v23 = (double *)(*(void *)a1 + 8);
          uint64_t v24 = (v6 - 1);
          double v25 = (double *)__p;
          do
          {
            double v26 = *v25++;
            double v27 = v26;
            double v28 = *v23++;
            double v21 = v21 + v27 * v28;
            --v24;
          }
          while (v24);
        }
        double v29 = exp(v21);
        double v30 = (char *)*a3;
        *(double *)*a3 = *(double *)*a3 - v29 / (v29 + 1.0);
        if ((int)v6 < 2)
        {
          if (v22) {
            goto LABEL_26;
          }
        }
        else
        {
          double v31 = (double *)(v30 + 8);
          uint64_t v32 = (v6 - 1);
          double v33 = v22;
          do
          {
            double v34 = *v33++;
            *double v31 = *v31 - v29 * v34 / (v29 + 1.0);
            ++v31;
            --v32;
          }
          while (v32);
LABEL_26:
          int v41 = v22;
          operator delete(v22);
        }
        v20 += 32;
        continue;
      }
      break;
    }
    double v39 = (void **)&v36;
    std::vector<data_record_t>::__destroy_vector::operator()[abi:ne180100](&v39);
    v8 += 3;
    if (v8 != v7) {
      continue;
    }
    break;
  }
}

void sub_21432498C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void **a13)
{
  a13 = (void **)&a10;
  std::vector<data_record_t>::__destroy_vector::operator()[abi:ne180100](&a13);
  _Unwind_Resume(a1);
}

void CPLogisticRegressionClassfier::ComputeSingleHessian(uint64_t a1, uint64_t *a2, int a3, int a4, double **a5)
{
  uint64_t v47 = *a2;
  uint64_t v5 = *a5;
  if (((a2[1] - v47) >> 3) * ((a2[1] - v47) >> 3) != a5[1] - *a5) {
    CPLogisticRegressionClassfier::ComputeSingleHessian();
  }
  int v6 = a3 - 1;
  if (a3 != 1)
  {
    if (a3 <= 0) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v9 = (a4 + 1);
    int v10 = v9 * v6;
    unsigned int v11 = a3 - 1;
    size_t v12 = 8 * v6;
    uint64_t v13 = (char *)operator new(v12);
    bzero(v13, v12);
    uint64_t v14 = 0;
    uint64_t v46 = *(double **)(a1 + 8);
    uint64_t v15 = (double *)(v47 + 8);
    double v16 = 1.0;
    do
    {
      double v17 = *(double *)(v47 + 8 * v14 * (int)v9);
      double v18 = v15;
      uint64_t v19 = a4;
      uint64_t v20 = v46;
      if (a4 >= 1)
      {
        do
        {
          double v21 = *v20++;
          double v22 = v21;
          double v23 = *v18++;
          double v17 = v17 + v22 * v23;
          --v19;
        }
        while (v19);
      }
      long double v24 = exp(v17);
      *(long double *)&v13[8 * v14] = v24;
      double v16 = v16 + v24;
      ++v14;
      v15 += (int)v9;
    }
    while (v14 != v11);
    uint64_t v25 = 0;
    do
    {
      *(double *)&v13[v25] = *(double *)&v13[v25] / v16;
      v25 += 8;
    }
    while (8 * v11 != v25);
    uint64_t v26 = 0;
    int v27 = v10 + 1;
    double v28 = v5;
    do
    {
      uint64_t v29 = 0;
      double v30 = *(double *)&v13[8 * v26];
      int v31 = v27;
      uint64_t v32 = v28;
      do
      {
        if (v26 == v29) {
          double v33 = v30;
        }
        else {
          double v33 = 0.0;
        }
        if ((a4 & 0x80000000) == 0)
        {
          uint64_t v34 = 0;
          double v35 = v30 * *(double *)&v13[8 * v29] - v33;
          uint64_t v36 = v32;
          do
          {
            uint64_t v37 = v9;
            uint64_t v38 = v36;
            do
            {
              *uint64_t v38 = v35;
              v38 += v10;
              --v37;
            }
            while (v37);
            ++v34;
            ++v36;
          }
          while (v34 != v9);
          if (a4 >= 1)
          {
            uint64_t v39 = 0;
            double v40 = *(double **)(a1 + 8);
            int v41 = v31;
            do
            {
              uint64_t v42 = a4;
              int v43 = v41;
              unint64_t v44 = v40;
              do
              {
                double v45 = *v44++;
                v5[v43] = v5[v43] * (v40[v39] * v45);
                v43 += v10;
                --v42;
              }
              while (v42);
              ++v39;
              ++v41;
            }
            while (v39 != a4);
          }
        }
        ++v29;
        v32 += (int)v9 * (uint64_t)v10;
        v31 += v11 * v9 * v9;
      }
      while (v29 != v11);
      ++v26;
      v28 += (int)v9;
      v27 += v9;
    }
    while (v26 != v11);
    operator delete(v13);
  }
}

void CPLogisticRegressionClassfier::ObjectiveFunctionHessian(uint64_t *a1, uint64_t **a2, double **a3)
{
  uint64_t v7 = *a2;
  int v6 = a2[1];
  uint64_t v8 = **a2;
  uint64_t v10 = *(void *)(v8 + 8);
  uint64_t v9 = *(void *)(v8 + 16);
  size_t v12 = *a3;
  unsigned int v11 = a3[1];
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  size_t v13 = (char *)v11 - (char *)v12;
  if (v11 == v12)
  {
    uint64_t v14 = 0;
  }
  else
  {
    if ((v13 & 0x8000000000000000) != 0) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v14 = (double *)operator new((char *)v11 - (char *)v12);
    uint64_t v25 = v14;
    bzero(v14, v13);
    uint64_t v26 = (char *)v14 + v13;
  }
  unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (v6 - v7);
  if ((uint64_t)v13 >= 1) {
    bzero(v12, 8 * ((v13 >> 3) - (v13 > 7)) + 8);
  }
  if ((int)v15 >= 1)
  {
    uint64_t v16 = 0;
    unint64_t v17 = (unint64_t)(v9 - v10) >> 3;
    do
    {
      uint64_t v18 = v7[3 * v16];
      if (v7[3 * v16 + 1] != v18)
      {
        unint64_t v19 = 0;
        do
        {
          CPLogisticRegressionClassfier::ComputeSingleHessian(v18 + 32 * v19, a1, v15, v17, &v25);
          uint64_t v20 = *a3;
          uint64_t v21 = (char *)a3[1] - (char *)*a3;
          if (v21)
          {
            unint64_t v22 = v21 >> 3;
            if (v22 <= 1) {
              unint64_t v22 = 1;
            }
            double v23 = v14;
            do
            {
              double v24 = *v23++;
              *uint64_t v20 = v24 + *v20;
              ++v20;
              --v22;
            }
            while (v22);
          }
          ++v19;
          uint64_t v7 = *a2;
          uint64_t v18 = (*a2)[3 * v16];
        }
        while (v19 < ((*a2)[3 * v16 + 1] - v18) >> 5);
      }
      ++v16;
    }
    while (v16 != v15);
  }
  if (v14)
  {
    operator delete(v14);
  }
}

void sub_214324DF4(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void CPLogisticRegressionClassfier::ObjectiveFunctionHessian0(uint64_t a1, uint64_t **a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 8) - *(void *)a3;
  if (v6 >= 1) {
    bzero(*(void **)a3, 8 * (((unint64_t)v6 >> 3) - ((unint64_t)v6 > 7)) + 8);
  }
  uint64_t v7 = *(void *)(a1 + 8) - *(void *)a1;
  unint64_t v8 = (unint64_t)v7 >> 3;
  uint64_t v9 = ((unint64_t)v7 >> 3) - 1;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"num_predictor = ", 16);
  uint64_t v10 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v10 + *(void *)(*v10 - 24)));
  unsigned int v11 = std::locale::use_facet(&v45, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 10);
  std::locale::~locale(&v45);
  std::ostream::put();
  std::ostream::flush();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"hessian uint64_t size = ", 15);
  size_t v12 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  size_t v13 = std::locale::use_facet(&v45, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 10);
  std::locale::~locale(&v45);
  std::ostream::put();
  std::ostream::flush();
  uint64_t v14 = *a2;
  uint64_t v42 = a2[1];
  if (*a2 != v42)
  {
    uint64_t v15 = (int)(v7 >> 3);
    uint64_t v16 = 8 * v15;
    uint64_t v44 = 8 * v15 + 8;
    do
    {
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      int v43 = v14;
      std::vector<data_record_t>::__init_with_size[abi:ne180100]<data_record_t*,data_record_t*>(&v49, *v14, v14[1], (v14[1] - *v14) >> 5);
      uint64_t v17 = v49;
      uint64_t v18 = v50;
      while (v17 != v18)
      {
        LODWORD(v45.__locale_) = *(_DWORD *)v17;
        uint64_t v47 = 0;
        uint64_t v48 = 0;
        uint64_t v46 = 0;
        std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v46, *(const void **)(v17 + 8), *(void *)(v17 + 16), (uint64_t)(*(void *)(v17 + 16) - *(void *)(v17 + 8)) >> 3);
        double v19 = **(double **)a1;
        uint64_t v20 = v46;
        if ((int)v8 >= 2)
        {
          uint64_t v21 = (double *)(*(void *)a1 + 8);
          uint64_t v22 = v9;
          double v23 = v46;
          do
          {
            double v24 = *v23++;
            double v25 = v24;
            double v26 = *v21++;
            double v19 = v19 + v25 * v26;
            --v22;
          }
          while (v22);
        }
        long double v27 = exp(v19);
        double v28 = v27 / ((v27 + 1.0) * (v27 + 1.0));
        uint64_t v29 = *(double **)a3;
        **(double **)a3 = **(double **)a3 - v28;
        if ((int)v8 < 2)
        {
          if (!v20) {
            goto LABEL_18;
          }
        }
        else
        {
          uint64_t v30 = 0;
          int v31 = (double *)((char *)v29 + v44);
          uint64_t v32 = (double *)((char *)v29 + v44);
          do
          {
            uint64_t v33 = v30;
            double v34 = v20[v30++];
            double v35 = v29[v30] - v34 * v28;
            v29[v30] = v35;
            v29[v30 * v15] = v35;
            uint64_t v36 = v31;
            uint64_t v37 = v32;
            uint64_t v38 = v9;
            uint64_t v39 = v20;
            do
            {
              double v40 = *v39++;
              double v41 = *v36 + -(v40 * v20[v33]) * v28;
              *v36++ = v41;
              *uint64_t v37 = v41;
              uint64_t v37 = (double *)((char *)v37 + v16);
              --v38;
            }
            while (v38);
            ++v32;
            int v31 = (double *)((char *)v31 + v16);
          }
          while (v30 != v9);
        }
        uint64_t v47 = v20;
        operator delete(v20);
LABEL_18:
        v17 += 32;
      }
      v45.__locale_ = (std::locale::__imp *)&v49;
      std::vector<data_record_t>::__destroy_vector::operator()[abi:ne180100]((void ***)&v45);
      uint64_t v14 = v43 + 3;
    }
    while (v43 + 3 != v42);
  }
}

void sub_21432516C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::locale a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

uint64_t CPLogisticRegressionClassfier::Evaluate(uint64_t a1, double **a2)
{
  int v2 = *(_DWORD *)(a1 + 224);
  if (v2 == 2)
  {
    int v3 = *a2;
    size_t v4 = a2[1];
    uint64_t v5 = *(double **)(a1 + 240);
    double v6 = *v5;
    if (*a2 != v4)
    {
      uint64_t v7 = v5 + 1;
      do
      {
        double v8 = *v3++;
        double v9 = v8;
        double v10 = *v7++;
        double v6 = v6 + v9 * v10;
      }
      while (v3 != v4);
    }
    return v6 <= 0.0;
  }
  else
  {
    if (v2 < 2) {
      goto LABEL_18;
    }
    uint64_t v12 = 0;
    uint64_t v13 = (v2 - 1);
    uint64_t v14 = *(int *)(a1 + 228);
    uint64_t v15 = v14 + 1;
    uint64_t v16 = a2[1];
    uint64_t v17 = *(void *)(a1 + 240);
    uint64_t v18 = (double *)(v17 + 8);
    uint64_t v19 = 8 * v14 + 8;
    unsigned int v20 = -1;
    double v21 = 2.22507386e-308;
    do
    {
      double v22 = *(double *)(v17 + 8 * v12 * v15);
      if (*a2 != v16)
      {
        double v23 = v18;
        double v24 = *a2;
        do
        {
          double v25 = *v24++;
          double v26 = v25;
          double v27 = *v23++;
          double v22 = v22 + v26 * v27;
        }
        while (v24 != v16);
      }
      if (v22 > v21)
      {
        double v21 = v22;
        unsigned int v20 = v12;
      }
      ++v12;
      uint64_t v18 = (double *)((char *)v18 + v19);
    }
    while (v12 != v13);
    uint64_t result = v21 >= 0.0 ? v20 : v13;
    if (result == -1) {
LABEL_18:
    }
      CPLogisticRegressionClassfier::Evaluate();
  }
  return result;
}

uint64_t CPLogisticRegressionClassfier::Serialize(uint64_t a1)
{
  v7[19] = *MEMORY[0x263EF8340];
  std::ofstream::basic_ofstream(&v5);
  if ((v6[*(void *)(v5 - 24) + 24] & 5) != 0)
  {
    size_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C0F8], (uint64_t)"cannot open output file", 23);
    std::endl[abi:ne180100]<char,std::char_traits<char>>(v4);
    exit(1);
  }
  std::ostream::operator<<();
  if (*(void *)(a1 + 248) - *(void *)(a1 + 240) >= 9uLL)
  {
    unint64_t v2 = 1;
    do
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" ", 1);
      std::ostream::operator<<();
      ++v2;
    }
    while (v2 < (uint64_t)(*(void *)(a1 + 248) - *(void *)(a1 + 240)) >> 3);
  }
  uint64_t v5 = *MEMORY[0x263F8C2B0];
  *(void *)&v6[*(void *)(v5 - 24) - 8] = *(void *)(MEMORY[0x263F8C2B0] + 24);
  MEMORY[0x21669DA00](v6);
  std::ostream::~ostream();
  return MEMORY[0x21669DB40](v7);
}

void sub_21432544C(_Unwind_Exception *exception_object)
{
}

uint64_t CPLogisticRegressionClassfier::Deserialize(uint64_t a1)
{
  v9[19] = *MEMORY[0x263EF8340];
  std::ifstream::basic_ifstream(v7);
  if ((v8[*(void *)(v7[0] - 24) + 16] & 5) != 0)
  {
    double v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C0F8], (uint64_t)"cannot open input file", 22);
    std::endl[abi:ne180100]<char,std::char_traits<char>>(v6);
    exit(1);
  }
  uint64_t v2 = *(void *)(a1 + 240);
  if (*(void *)(a1 + 248) != v2)
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    do
    {
      MEMORY[0x21669DA20](v7, v2 + v3);
      ++v4;
      uint64_t v2 = *(void *)(a1 + 240);
      v3 += 8;
    }
    while (v4 < (*(void *)(a1 + 248) - v2) >> 3);
  }
  v7[0] = *MEMORY[0x263F8C2A8];
  *(uint64_t *)((char *)v7 + *(void *)(v7[0] - 24)) = *(void *)(MEMORY[0x263F8C2A8] + 24);
  MEMORY[0x21669DA00](v8);
  std::istream::~istream();
  return MEMORY[0x21669DB40](v9);
}

void sub_21432560C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::ifstream::~ifstream((uint64_t *)va);
  _Unwind_Resume(a1);
}

void CPLogisticRegressionClassfier::Train(CPLogisticRegressionClassfier *this)
{
  int v2 = *((_DWORD *)this + 56) - 1 + (*((_DWORD *)this + 56) - 1) * *((_DWORD *)this + 57);
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  if (v2)
  {
    if (v2 < 0) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v3 = (uint64_t *)operator new(8 * v2);
    uint64_t v37 = v3;
    bzero(v3, 8 * v2);
    unint64_t v4 = &v3[v2];
    uint64_t v38 = v4;
  }
  else
  {
    unint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  uint64_t v5 = (char *)v4 - (char *)v3;
  if (v5 >= 1) {
    memset_pattern16(v3, &unk_214353DB0, 8 * (((unint64_t)v5 >> 3) - ((unint64_t)v5 > 7)) + 8);
  }
  if (*((int *)this + 48) >= 2)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"Initial objective function for beta=", 36);
    double v6 = (void *)operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)" is ", 4);
    CPLogisticRegressionClassfier::ObjectiveFunction((uint64_t *)&v37, (uint64_t *)this + 25);
    uint64_t v7 = (void *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v7 + *(void *)(*v7 - 24)));
    double v8 = std::locale::use_facet(&v32, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
    std::locale::~locale(&v32);
    std::ostream::put();
    std::ostream::flush();
    int v2 = *((_DWORD *)this + 56) - 1 + (*((_DWORD *)this + 56) - 1) * *((_DWORD *)this + 57);
  }
  CoreOptimization::gradient_t::gradient_t((CoreOptimization::gradient_t *)&v35, v2);
  CPLogisticRegressionClassfier::ObjectiveFunctionGradient((uint64_t *)&v37, (uint64_t **)this + 25, (uint64_t)&v35);
  if (*((int *)this + 48) >= 2)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"Initial Gradient for beta=", 26);
    double v9 = (void *)operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)" is ", 4);
    double v10 = (void *)operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v10 + *(void *)(*v10 - 24)));
    unsigned int v11 = std::locale::use_facet(&v32, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 10);
    std::locale::~locale(&v32);
    std::ostream::put();
    std::ostream::flush();
  }
  uint64_t v33 = 0;
  double v34 = 0;
  std::valarray<double>::resize((uint64_t)&v33, (*((_DWORD *)this + 56) - 1 + (*((_DWORD *)this + 56) - 1) * *((_DWORD *)this + 57))* (*((_DWORD *)this + 56) - 1 + (*((_DWORD *)this + 56) - 1) * *((_DWORD *)this + 57)), 0.0);
  CPLogisticRegressionClassfier::ObjectiveFunctionHessian((uint64_t *)&v37, (uint64_t **)this + 25, &v33);
  if (*((int *)this + 48) >= 2)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"Initial Hessian for beta=", 25);
    uint64_t v12 = (void *)operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" is ", 4);
    uint64_t v13 = (void *)operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v13 + *(void *)(*v13 - 24)));
    uint64_t v14 = std::locale::use_facet(&v32, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v14->__vftable[2].~facet_0)(v14, 10);
    std::locale::~locale(&v32);
    std::ostream::put();
    std::ostream::flush();
    if (*((int *)this + 48) >= 2)
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"Initial objective function for beta=", 36);
      uint64_t v15 = (void *)operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" is ", 4);
      CPLogisticRegressionClassfier::ObjectiveFunction((uint64_t *)&v37, (uint64_t *)this + 25);
      uint64_t v16 = (void *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v16 + *(void *)(*v16 - 24)));
      uint64_t v17 = std::locale::use_facet(&v32, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v17->__vftable[2].~facet_0)(v17, 10);
      std::locale::~locale(&v32);
      std::ostream::put();
      std::ostream::flush();
    }
  }
  int v19 = *((_DWORD *)this + 57);
  int v18 = *((_DWORD *)this + 58);
  int v20 = *((_DWORD *)this + 56);
  std::valarray<double>::valarray(&__p, &v37);
  *(void *)&long long v27 = CPLogisticRegressionClassfier::ObjectiveFunction;
  *((void *)&v27 + 1) = CPLogisticRegressionClassfier::ObjectiveFunctionGradient;
  double v28 = CPLogisticRegressionClassfier::ObjectiveFunctionHessian;
  uint64_t v29 = (char *)this + 200;
  CoreOptimization::BFGS::BFGS((uint64_t)&v32, (uint64_t **)&__p, &v27, 1, 1.0 / (double)((v20 - 1) * v18 + (v20 - 1) * v18 * v19));
  if (__p)
  {
    if (v31 != __p) {
      v31 += ((unsigned char *)__p - v31 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    operator delete(__p);
    std::string __p = 0;
    int v31 = 0;
  }
  CoreOptimization::BFGS::Optimize((CoreOptimization::BFGS *)&v32);
  CoreOptimization::BFGS::GetSolution((uint64_t *)v26, (CoreOptimization::BFGS *)&v32);
  double v21 = (unsigned char *)*((void *)this + 30);
  if (v21)
  {
    double v22 = (unsigned char *)*((void *)this + 31);
    if (v22 != v21) {
      *((void *)this + 31) = &v22[(v21 - v22 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v21);
    *((void *)this + 3(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = 0;
    *((void *)this + 31) = 0;
  }
  *((_OWORD *)this + 15) = *(_OWORD *)v26;
  if (*((int *)this + 48) >= 1)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"Solution: ", 10);
    double v23 = (void *)operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v23 + *(void *)(*v23 - 24)));
    double v24 = std::locale::use_facet((const std::locale *)v26, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
    std::locale::~locale((std::locale *)v26);
    std::ostream::put();
    std::ostream::flush();
  }
  unint64_t v25 = *((int *)this + 56) - 1 + (*((int *)this + 56) - 1) * *((int *)this + 57);
  v26[0] = 0;
  v26[1] = 0;
  std::valarray<double>::resize((uint64_t)v26, v25, 1.0);
  if (v26[0])
  {
    if (v26[1] != v26[0]) {
      v26[1] = (char *)v26[1] + (((char *)v26[0] - (char *)v26[1] + 7) & 0xFFFFFFFFFFFFFFF8);
    }
    operator delete(v26[0]);
  }
  CoreOptimization::BFGS::~BFGS((CoreOptimization::BFGS *)&v32);
  if (v33)
  {
    if (v34 != v33) {
      double v34 = (double *)((char *)v34 + (((char *)v33 - (char *)v34 + 7) & 0xFFFFFFFFFFFFFFF8));
    }
    operator delete(v33);
  }
  if (v35)
  {
    if (v36 != v35) {
      v36 += (v35 - v36 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    operator delete(v35);
  }
  if (v37)
  {
    if (v38 != v37) {
      uint64_t v38 = (uint64_t *)((char *)v38 + (((char *)v37 - (char *)v38 + 7) & 0xFFFFFFFFFFFFFFF8));
    }
    operator delete(v37);
  }
}

void sub_214325CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, std::locale a17)
{
  std::locale::~locale(&a17);
  int v19 = *(unsigned char **)(v17 - 112);
  if (v19)
  {
    int v20 = *(unsigned char **)(v17 - 104);
    if (v20 != v19) {
      *(void *)(v17 - 104) = &v20[(v19 - v20 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v19);
  }
  double v21 = *(unsigned char **)(v17 - 88);
  if (v21)
  {
    double v22 = *(unsigned char **)(v17 - 80);
    if (v22 != v21) {
      *(void *)(v17 - 8(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = &v22[(v21 - v22 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v21);
  }
  double v23 = *(unsigned char **)(v17 - 64);
  if (v23)
  {
    double v24 = *(unsigned char **)(v17 - 56);
    if (v24 != v23) {
      *(void *)(v17 - 56) = &v24[(v23 - v24 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v23);
  }
  _Unwind_Resume(a1);
}

void CPLogisticRegressionClassfier::CPLogisticRegressionClassfier(CPLogisticRegressionClassfier *this, CPMLSerialization *a2, CPMLTunableData *a3)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, a2, a3);
  *(void *)(v5 + 20(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = 0;
  *(void *)uint64_t v5 = &unk_26C510418;
  *(_OWORD *)(v5 + 24(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = 0u;
  uint64_t v6 = v5 + 240;
  *(void *)(v5 + 208) = 0;
  *(void *)(v5 + 216) = 0;
  uint64_t v7 = v5 + 256;
  uint64_t v8 = v5 + 272;
  uint64_t v9 = v5 + 288;
  *(_OWORD *)(v5 + 256) = 0u;
  *(_OWORD *)(v5 + 272) = 0u;
  *(_OWORD *)(v5 + 288) = 0u;
  (*((void (**)(CPMLSerialization *, uint64_t, const char *, uint64_t, void))a2->var0 + 13))(a2, v5 + 8, "version", 5, 0);
  unint64_t v10 = 0;
  (*((void (**)(CPMLSerialization *, unint64_t *, const char *, uint64_t, void))a2->var0 + 10))(a2, &v10, "min_predictors_length", 1, 0);
  std::valarray<double>::resize(v7, v10, 0.0);
  (*(void (**)(void, void, const char *, unint64_t, void))(**((void **)this + 11) + 96))(*((void *)this + 11), *((void *)this + 32), "min_predictors_", v10, 0);
  (*((void (**)(CPMLSerialization *, unint64_t *, const char *, uint64_t, void))a2->var0 + 10))(a2, &v10, "max_predictors_length", 1, 0);
  std::valarray<double>::resize(v8, v10, 0.0);
  (*(void (**)(void, void, const char *, unint64_t, void))(**((void **)this + 11) + 96))(*((void *)this + 11), *((void *)this + 34), "max_predictors_", v10, 0);
  (*((void (**)(CPMLSerialization *, unint64_t *, const char *, uint64_t, void))a2->var0 + 10))(a2, &v10, "range_predictors_length", 1, 0);
  std::valarray<double>::resize(v9, v10, 0.0);
  (*(void (**)(void, void, const char *, unint64_t, void))(**((void **)this + 11) + 96))(*((void *)this + 11), *((void *)this + 36), "range_predictors_", v10, 0);
  (*((void (**)(CPMLSerialization *, unint64_t *, const char *, uint64_t, void))a2->var0 + 10))(a2, &v10, "solution_length", 1, 0);
  std::valarray<double>::resize(v6, v10, 0.0);
  (*(void (**)(void, void, const char *, unint64_t, void))(**((void **)this + 11) + 96))(*((void *)this + 11), *((void *)this + 30), "solution_", v10, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 112, "totalDataCount", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 96, "featureVectorSpace", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 104, "resultCardinality", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 120, "continousFeatureCount", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 128, "discreteFeatureCount", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 144, "totalCols", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 136, "totalRows", 1, 0);
  CPLogisticRegressionClassfier::initializeLogisticRegressionMemory(this);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 184, "iterations", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 12))(a2, (char *)this + 176, "alpha", 1, 0);
  (*((void (**)(CPMLSerialization *, void, const char *, uint64_t, void))a2->var0 + 12))(a2, *((void *)this + 19), "theta", *((void *)this + 18) - 1, 0);
}

void sub_214326374(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::valarray<double>::~valarray(v6);
  std::valarray<double>::~valarray(v5);
  std::valarray<double>::~valarray(v4);
  std::valarray<double>::~valarray(v3);
  std::vector<std::vector<data_record_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  CPModelClose(v2);
  _Unwind_Resume(a1);
}

void CPLogisticRegressionClassfier::~CPLogisticRegressionClassfier(CPLogisticRegressionClassfier *this)
{
  *(void *)this = &unk_26C510418;
  if (*((void *)this + 17))
  {
    unint64_t v2 = 0;
    do
      free(*(void **)(*((void *)this + 21) + 8 * v2++));
    while (*((void *)this + 17) > v2);
  }
  free(*((void **)this + 21));
  free(*((void **)this + 19));
  free(*((void **)this + 20));
  uint64_t v3 = (unsigned char *)*((void *)this + 36);
  if (v3)
  {
    uint64_t v4 = (unsigned char *)*((void *)this + 37);
    if (v4 != v3) {
      *((void *)this + 37) = &v4[(v3 - v4 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v3);
    *((void *)this + 36) = 0;
    *((void *)this + 37) = 0;
  }
  uint64_t v5 = (unsigned char *)*((void *)this + 34);
  if (v5)
  {
    uint64_t v6 = (unsigned char *)*((void *)this + 35);
    if (v6 != v5) {
      *((void *)this + 35) = &v6[(v5 - v6 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v5);
    *((void *)this + 34) = 0;
    *((void *)this + 35) = 0;
  }
  uint64_t v7 = (unsigned char *)*((void *)this + 32);
  if (v7)
  {
    uint64_t v8 = (unsigned char *)*((void *)this + 33);
    if (v8 != v7) {
      *((void *)this + 33) = &v8[(v7 - v8 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v7);
    *((void *)this + 32) = 0;
    *((void *)this + 33) = 0;
  }
  uint64_t v9 = (unsigned char *)*((void *)this + 30);
  if (v9)
  {
    unint64_t v10 = (unsigned char *)*((void *)this + 31);
    if (v10 != v9) {
      *((void *)this + 31) = &v10[(v9 - v10 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v9);
    *((void *)this + 3(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = 0;
    *((void *)this + 31) = 0;
  }
  unsigned int v11 = (void **)((char *)this + 200);
  std::vector<std::vector<data_record_t>>::__destroy_vector::operator()[abi:ne180100](&v11);
  CPModelClose(this);
}

{
  uint64_t vars8;

  CPLogisticRegressionClassfier::~CPLogisticRegressionClassfier(this);

  JUMPOUT(0x21669DB80);
}

uint64_t CPLogisticRegressionClassfier::serialize(CPLogisticRegressionClassfier *this)
{
  uint64_t v2 = *((void *)this + 11);
  uint64_t v3 = (char *)this + 8;
  size_t v4 = strlen((const char *)this + 8);
  (*(void (**)(uint64_t, char *, const char *, size_t, void))(*(void *)v2 + 56))(v2, v3, "version", v4, 0);
  uint64_t v6 = (uint64_t)(*((void *)this + 33) - *((void *)this + 32)) >> 3;
  (*(void (**)(void, uint64_t *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), &v6, "min_predictors_length", 1, 0);
  (*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 32), "min_predictors_", v6, 0);
  uint64_t v6 = (uint64_t)(*((void *)this + 35) - *((void *)this + 34)) >> 3;
  (*(void (**)(void, uint64_t *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), &v6, "max_predictors_length", 1, 0);
  (*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 34), "max_predictors_", v6, 0);
  uint64_t v6 = (uint64_t)(*((void *)this + 37) - *((void *)this + 36)) >> 3;
  (*(void (**)(void, uint64_t *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), &v6, "range_predictors_length", 1, 0);
  (*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 36), "range_predictors_", v6, 0);
  uint64_t v6 = (uint64_t)(*((void *)this + 31) - *((void *)this + 30)) >> 3;
  (*(void (**)(void, uint64_t *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), &v6, "solution_length", 1, 0);
  (*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 30), "solution_", v6, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 112, "totalDataCount", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 96, "featureVectorSpace", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 104, "resultCardinality", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 120, "continousFeatureCount", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 128, "discreteFeatureCount", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 144, "totalCols", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 136, "totalRows", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 184, "iterations", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), (char *)this + 176, "alpha", 1, 0);
  (*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "theta", *((void *)this + 18) - 1, 0);
  return 0;
}

uint64_t CPLogisticRegressionClassfier::train(CPLogisticRegressionClassfier *this)
{
  return 0;
}

uint64_t CPLogisticRegressionClassfier::eval(uint64_t a1, CPMLFeatureVector *this)
{
  if (*(void *)(a1 + 144))
  {
    uint64_t RealVector = CPMLFeatureVector::getRealVector(this);
    *(_DWORD *)(a1 + 224) = 2;
    uint64_t v5 = *(uint64_t **)RealVector;
    unint64_t v6 = *(void *)(RealVector + 8) - *(void *)RealVector;
    unint64_t v7 = v6 << 29;
    double v23 = 0;
    unint64_t v24 = 0;
    if (v6 << 29)
    {
      if ((v7 & 0x8000000000000000) != 0) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v8 = (double *)operator new(v6 & 0x7FFFFFFFFLL);
      double v23 = v8;
      bzero(v8, v6 & 0x7FFFFFFFFLL);
      unint64_t v7 = (unint64_t)v8 + (v6 & 0x7FFFFFFFFLL);
      unint64_t v24 = v7;
    }
    else
    {
      uint64_t v8 = 0;
    }
    if ((int)(v6 >> 3) >= 1)
    {
      uint64_t v11 = (v6 >> 3);
      uint64_t v12 = v8;
      do
      {
        uint64_t v13 = *v5++;
        *(void *)v12++ = v13;
        --v11;
      }
      while (v11);
    }
    uint64_t v14 = v7 - (void)v8;
    if (v14)
    {
      uint64_t v15 = v14 >> 3;
      uint64_t v16 = *(double **)(a1 + 256);
      uint64_t v17 = *(double **)(a1 + 288);
      int v18 = v8;
      do
      {
        double v19 = *v16++;
        double v20 = *v18 - v19;
        double v21 = *v17++;
        *v18++ = v20 / v21;
        --v15;
      }
      while (v15);
    }
    int v22 = CPLogisticRegressionClassfier::Evaluate(a1, &v23);
    CPMLFeatureVector::setYHat((uint64_t)this, (double)v22);
    if (v8) {
      operator delete(v8);
    }
    return 1;
  }
  else
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)a1);
    CPMLLog::log(CPMLLog, CPML_LOG_DEBUG, "eval", "totalCols 0\n");
    return 0xFFFFFFFFLL;
  }
}

void sub_214326BC4(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CPLogisticRegressionClassfier::errorString(CPLogisticRegressionClassfier *this)
{
  return 0;
}

void CPLogisticRegressionClassfier::findGradient(CPLogisticRegressionClassfier *this, double *a2)
{
  uint64_t v4 = *((void *)this + 14);
  if (!v4)
  {
    uint64_t v22 = *((void *)this + 18);
    uint64_t v8 = v22 - 1;
    if (v22 == 1) {
      return;
    }
    goto LABEL_13;
  }
  uint64_t v5 = 0;
  uint64_t v6 = *((void *)this + 21);
  unint64_t v7 = (double *)*((void *)this + 19);
  uint64_t v8 = *((void *)this + 18) - 1;
  do
  {
    uint64_t v9 = *(double **)(v6 + 8 * v5);
    double v10 = 0.0;
    if (v8)
    {
      uint64_t v11 = *(double **)(v6 + 8 * v5);
      uint64_t v12 = v7;
      uint64_t v13 = v8;
      do
      {
        double v14 = *v11++;
        double v15 = v14;
        double v16 = *v12++;
        double v10 = v10 + v15 * v16;
        --v13;
      }
      while (v13);
    }
    double v17 = pow(3.14159265, -v10);
    if (v8)
    {
      double v18 = 1.0 / (v17 + 1.0) - v9[v8];
      uint64_t v19 = v8;
      double v20 = a2;
      do
      {
        double v21 = *v9++;
        *double v20 = *v20 + v21 * v18;
        ++v20;
        --v19;
      }
      while (v19);
    }
    ++v5;
  }
  while (v5 != v4);
  if (v8)
  {
LABEL_13:
    double v23 = 1.0 / (double)*((unint64_t *)this + 17);
    do
    {
      *a2 = *a2 * v23;
      ++a2;
      --v8;
    }
    while (v8);
  }
}

void CPLogisticRegressionClassfier::gradientDescent(CPLogisticRegressionClassfier *this)
{
  uint64_t v2 = (double *)malloc_type_calloc(*((void *)this + 18), 8uLL, 0x100004000313F17uLL);
  if (*((void *)this + 23))
  {
    unint64_t v3 = 0;
    do
    {
      CPLogisticRegressionClassfier::findGradient(this, v2);
      uint64_t v4 = *((void *)this + 18) - 1;
      if (*((void *)this + 18) != 1)
      {
        uint64_t v5 = (double *)*((void *)this + 19);
        uint64_t v6 = v2;
        do
        {
          double v7 = *v6++;
          *uint64_t v5 = *v5 + -1.0 / ((double)(int)v3 + 1.0) * *((double *)this + 22) * v7;
          ++v5;
          --v4;
        }
        while (v4);
      }
      ++v3;
    }
    while (*((void *)this + 23) > v3);
  }

  free(v2);
}

void CPLogisticRegressionClassfier::getAlgoSolution(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 240;
  std::valarray<double>::resize(a2, (uint64_t)(*(void *)(a1 + 248) - *(void *)(a1 + 240)) >> 3, 0.0);
  if (v4 != a2)
  {
    uint64_t v5 = *(unsigned char **)(a1 + 240);
    uint64_t v6 = *(unsigned char **)(a1 + 248);
    std::valarray<double>::__assign_range(a2, v5, v6);
  }
}

void *std::vector<data_record_t>::__construct_one_at_end[abi:ne180100]<data_record_t const&>(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  *(_DWORD *)uint64_t v3 = *(_DWORD *)a2;
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + 8) = 0;
  uint64_t result = std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>((void *)(v3 + 8), *(const void **)(a2 + 8), *(void *)(a2 + 16), (uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 3);
  *(void *)(a1 + 8) = v3 + 32;
  return result;
}

void sub_214326E9C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<data_record_t>::__push_back_slow_path<data_record_t const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 5;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 59) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 4 > v5) {
    unint64_t v5 = v8 >> 4;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0) {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  double v17 = a1 + 2;
  if (v9) {
    double v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<data_record_t>>(v7, v9);
  }
  else {
    double v10 = 0;
  }
  uint64_t v11 = &v10[32 * v4];
  v14[0] = v10;
  v14[1] = v11;
  double v15 = v11;
  double v16 = &v10[32 * v9];
  *(_DWORD *)uint64_t v11 = *(_DWORD *)a2;
  *((void *)v11 + 2) = 0;
  *((void *)v11 + 3) = 0;
  *((void *)v11 + 1) = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>((void *)v11 + 1, *(const void **)(a2 + 8), *(void *)(a2 + 16), (uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 3);
  v15 += 32;
  std::vector<data_record_t>::__swap_out_circular_buffer(a1, v14);
  uint64_t v12 = a1[1];
  std::__split_buffer<data_record_t>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_214326F90(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<data_record_t>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<data_record_t>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<data_record_t>,std::reverse_iterator<data_record_t*>,std::reverse_iterator<data_record_t*>,std::reverse_iterator<data_record_t*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<data_record_t>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<data_record_t>,std::reverse_iterator<data_record_t*>,std::reverse_iterator<data_record_t*>,std::reverse_iterator<data_record_t*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      int v8 = *(_DWORD *)(a3 - 32);
      a3 -= 32;
      *(_DWORD *)(v7 - 32) = v8;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      *(void *)(v7 - 24) = 0;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 + 8);
      *(void *)(v7 - 8) = *(void *)(a3 + 24);
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      *(void *)(a3 + 24) = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 32;
      *((void *)&v14 + 1) -= 32;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<data_record_t>,std::reverse_iterator<data_record_t*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<data_record_t>,std::reverse_iterator<data_record_t*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<data_record_t>,std::reverse_iterator<data_record_t*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<data_record_t>,std::reverse_iterator<data_record_t*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)(v1 + 8);
    if (v3)
    {
      *(void *)(v1 + 16) = v3;
      operator delete(v3);
    }
    v1 += 32;
  }
}

uint64_t std::__split_buffer<data_record_t>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<data_record_t>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    *(void *)(a1 + 16) = v2 - 32;
    uint64_t v5 = *(void **)(v2 - 24);
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 32;
    }
  }
}

void *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_214327274(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<double>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

CoreOptimization::gradient_t *CoreOptimization::gradient_t::gradient_t(CoreOptimization::gradient_t *this, int a2)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  std::valarray<double>::resize((uint64_t)this, a2, 0.0);
  return this;
}

void sub_214327308(_Unwind_Exception *a1)
{
  std::valarray<double>::~valarray(v1);
  _Unwind_Resume(a1);
}

uint64_t CoreOptimization::BFGS::BFGS(uint64_t a1, uint64_t **a2, long long *a3, int a4, double a5)
{
  *(_DWORD *)a1 = a4;
  uint64_t v9 = (void *)(a1 + 24);
  std::valarray<double>::valarray((void *)(a1 + 8), a2);
  std::valarray<double>::valarray(v9, a2);
  long long v10 = *a3;
  *(_OWORD *)(a1 + 56) = a3[1];
  *(_OWORD *)(a1 + 4(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = v10;
  *(double *)(a1 + 72) = a5;
  return a1;
}

void sub_214327394(_Unwind_Exception *a1)
{
  std::valarray<double>::~valarray(v1);
  _Unwind_Resume(a1);
}

void CoreOptimization::BFGS::~BFGS(CoreOptimization::BFGS *this)
{
  uint64_t v3 = (void *)((char *)this + 24);
  uint64_t v2 = (unsigned char *)*((void *)this + 3);
  if (v2)
  {
    uint64_t v4 = (unsigned char *)v3[1];
    if (v4 != v2) {
      *((void *)this + 4) = &v4[(v2 - v4 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v2);
    *uint64_t v3 = 0;
    v3[1] = 0;
  }
  uint64_t v5 = (unsigned char *)*((void *)this + 1);
  if (v5)
  {
    uint64_t v6 = (unsigned char *)*((void *)this + 2);
    if (v6 != v5) {
      *((void *)this + 2) = &v6[(v5 - v6 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
    operator delete(v5);
    *((void *)this + 1) = 0;
    *((void *)this + 2) = 0;
  }
}

void std::vector<std::vector<data_record_t>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    uint64_t v4 = (void **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        uint64_t v6 = v4;
        std::vector<data_record_t>::__destroy_vector::operator()[abi:ne180100](&v6);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::vector<std::vector<data_record_t>>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::vector<int>>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    size_t v5 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_214327538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void *std::vector<std::vector<data_record_t>>::__init_with_size[abi:ne180100]<std::vector<data_record_t>*,std::vector<data_record_t>*>(void *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<std::vector<int>>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<data_record_t>>,std::vector<data_record_t>*,std::vector<data_record_t>*,std::vector<data_record_t>*>((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_2143275B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::vector<data_record_t>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<data_record_t>>,std::vector<data_record_t>*,std::vector<data_record_t>*,std::vector<data_record_t>*>(uint64_t a1, uint64_t *a2, uint64_t *a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *uint64_t v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<data_record_t>::__init_with_size[abi:ne180100]<data_record_t*,data_record_t*>(v4, *v6, v6[1], (v6[1] - *v6) >> 5);
      uint64_t v4 = v11 + 3;
      v11 += 3;
      v6 += 3;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<data_record_t>>,std::vector<data_record_t>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_214327674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<data_record_t>>,std::vector<data_record_t>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<data_record_t>>,std::vector<data_record_t>*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<data_record_t>>,std::vector<data_record_t>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void ****)(a1 + 16);
  uint64_t v2 = **(void ****)(a1 + 8);
  while (v1 != v2)
  {
    v1 -= 3;
    uint64_t v3 = v1;
    std::vector<data_record_t>::__destroy_vector::operator()[abi:ne180100](&v3);
  }
}

void *std::vector<data_record_t>::__init_with_size[abi:ne180100]<data_record_t*,data_record_t*>(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<data_record_t>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = (void *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<data_record_t>,data_record_t*,data_record_t*,data_record_t*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_214327774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<data_record_t>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<data_record_t>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<data_record_t>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<data_record_t>,data_record_t*,data_record_t*,data_record_t*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *(_DWORD *)uint64_t v4 = *(_DWORD *)v6;
      *(void *)(v4 + 16) = 0;
      *(void *)(v4 + 24) = 0;
      *(void *)(v4 + 8) = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>((void *)(v4 + 8), *(const void **)(v6 + 8), *(void *)(v6 + 16), (uint64_t)(*(void *)(v6 + 16) - *(void *)(v6 + 8)) >> 3);
      uint64_t v4 = v11 + 32;
      v11 += 32;
      v6 += 32;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<data_record_t>,data_record_t*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_214327880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<data_record_t>,data_record_t*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<data_record_t>,data_record_t*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<data_record_t>,data_record_t*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)(v1 - 24);
    if (v3)
    {
      *(void *)(v1 - 16) = v3;
      operator delete(v3);
    }
    v1 -= 32;
  }
}

void std::vector<data_record_t>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<data_record_t>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<data_record_t>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32)
  {
    uint64_t v4 = *(void **)(i - 24);
    if (v4)
    {
      *(void *)(i - 16) = v4;
      operator delete(v4);
    }
  }
  a1[1] = v2;
}

void std::vector<std::vector<data_record_t>>::__assign_with_size[abi:ne180100]<std::vector<data_record_t>*,std::vector<data_record_t>*>(uint64_t a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v8 = a1 + 16;
  char v9 = *(void ***)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) < a4)
  {
    std::vector<std::vector<data_record_t>>::__vdeallocate((void ***)a1);
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0x5555555555555556 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3);
    if (v10 <= a4) {
      unint64_t v10 = a4;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v10;
    }
    std::vector<std::vector<int>>::__vallocate[abi:ne180100]((void *)a1, v11);
    char v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<data_record_t>>,std::vector<data_record_t>*,std::vector<data_record_t>*,std::vector<data_record_t>*>(v8, a2, a3, *(void **)(a1 + 8));
    goto LABEL_11;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3) < a4)
  {
    long long v13 = &a2[(uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3];
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<data_record_t> *,std::vector<data_record_t> *,std::vector<data_record_t> *>((uint64_t)&v17, a2, v13, (uint64_t *)v9);
    char v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<data_record_t>>,std::vector<data_record_t>*,std::vector<data_record_t>*,std::vector<data_record_t>*>(v8, v13, a3, *(void **)(a1 + 8));
LABEL_11:
    *(void *)(a1 + 8) = v12;
    return;
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<data_record_t> *,std::vector<data_record_t> *,std::vector<data_record_t> *>((uint64_t)&v18, a2, a3, (uint64_t *)v9);
  double v15 = v14;
  double v16 = *(void ***)(a1 + 8);
  if (v16 != v14)
  {
    do
    {
      v16 -= 3;
      uint64_t v19 = v16;
      std::vector<data_record_t>::__destroy_vector::operator()[abi:ne180100](&v19);
    }
    while (v16 != v15);
  }
  *(void *)(a1 + 8) = v15;
}

void sub_214327B2C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_214327B34(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void std::vector<std::vector<data_record_t>>::__vdeallocate(void ***a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v3 = a1[1];
    uint64_t v4 = *a1;
    if (v3 != v1)
    {
      do
      {
        v3 -= 3;
        size_t v5 = v3;
        std::vector<data_record_t>::__destroy_vector::operator()[abi:ne180100](&v5);
      }
      while (v3 != v1);
      uint64_t v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

uint64_t *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<data_record_t> *,std::vector<data_record_t> *,std::vector<data_record_t> *>(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  size_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if (v5 != a4) {
        std::vector<data_record_t>::__assign_with_size[abi:ne180100]<data_record_t*,data_record_t*>(a4, *v5, v5[1], (v5[1] - *v5) >> 5);
      }
      v5 += 3;
      a4 += 3;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void std::vector<data_record_t>::__assign_with_size[abi:ne180100]<data_record_t*,data_record_t*>(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = (uint64_t)(a1 + 2);
  uint64_t v9 = *a1;
  if (a4 > (a1[2] - *a1) >> 5)
  {
    std::vector<data_record_t>::__vdeallocate(a1);
    if (a4 >> 59) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = a1[2] - *a1;
    uint64_t v11 = v10 >> 4;
    if (v10 >> 4 <= a4) {
      uint64_t v11 = a4;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v12 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    std::vector<data_record_t>::__vallocate[abi:ne180100](a1, v12);
    uint64_t v13 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<data_record_t>,data_record_t*,data_record_t*,data_record_t*>(v8, a2, a3, a1[1]);
    goto LABEL_11;
  }
  unint64_t v14 = (a1[1] - v9) >> 5;
  if (v14 < a4)
  {
    uint64_t v15 = a2 + 32 * v14;
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<data_record_t *,data_record_t *,data_record_t *>((uint64_t)&v20, a2, v15, v9);
    uint64_t v13 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<data_record_t>,data_record_t*,data_record_t*,data_record_t*>(v8, v15, a3, a1[1]);
LABEL_11:
    a1[1] = v13;
    return;
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<data_record_t *,data_record_t *,data_record_t *>((uint64_t)&v21, a2, a3, v9);
  uint64_t v17 = v16;
  uint64_t v18 = a1[1];
  if (v18 != v16)
  {
    do
    {
      uint64_t v19 = *(void **)(v18 - 24);
      if (v19)
      {
        *(void *)(v18 - 16) = v19;
        operator delete(v19);
      }
      v18 -= 32;
    }
    while (v18 != v17);
  }
  a1[1] = v17;
}

void sub_214327D68(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_214327D70(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void std::vector<data_record_t>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<data_record_t>::__clear[abi:ne180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<data_record_t *,data_record_t *,data_record_t *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      *(_DWORD *)a4 = *(_DWORD *)v5;
      if (v5 != a4) {
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)(a4 + 8), *(char **)(v5 + 8), *(void *)(v5 + 16), (uint64_t)(*(void *)(v5 + 16) - *(void *)(v5 + 8)) >> 3);
      }
      v5 += 32;
      a4 += 32;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

char *std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 3)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      uint64_t v7[2] = 0;
    }
    if (a4 >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 2;
    if (v8 >> 2 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = std::vector<double>::__vallocate[abi:ne180100](v7, v11);
    uint64_t v13 = (char *)v7[1];
    unint64_t v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      uint64_t v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  unint64_t v12 = (void **)(result + 8);
  unint64_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 3;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    uint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    uint64_t v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *unint64_t v12 = &v9[v17];
  return result;
}

uint64_t std::valarray<double>::__assign_range(uint64_t a1, unsigned char *__src, unsigned char *a3)
{
  size_t v6 = a3 - __src;
  uint64_t v7 = (a3 - __src) >> 3;
  uint64_t v8 = *(unsigned char **)a1;
  uint64_t v9 = *(unsigned char **)(a1 + 8);
  if (v7 == (v9 - v8) >> 3)
  {
    if (a3 != __src) {
      memmove(v8, __src, a3 - __src);
    }
  }
  else
  {
    if (v8)
    {
      if (v9 != v8) {
        *(void *)(a1 + 8) = &v9[(v8 - v9 + 7) & 0xFFFFFFFFFFFFFFF8];
      }
      operator delete(v8);
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
    }
    if ((v6 & 0x8000000000000000) != 0) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    unint64_t v11 = (char *)operator new(v6);
    *(void *)a1 = v11;
    *(void *)(a1 + 8) = &v11[8 * v7];
    if (__src != a3) {
      memcpy(v11, __src, ((v6 - 8) & 0xFFFFFFFFFFFFFFF8) + 8);
    }
  }
  return a1;
}

uint64_t CPMLDelegate::evaluateCPMLAlgorithm(id *a1, CPMLFeatureVector *a2, uint64_t *a3, void *a4)
{
  id v8 = a1[1];
  id v9 = *a1;
  char v10 = objc_opt_respondsToSelector();
  if (v10)
  {
    unint64_t v11 = objc_opt_new();
    uint64_t v12 = *a3;
    if (a3[1] != *a3)
    {
      unint64_t v13 = 0;
      do
      {
        unint64_t v14 = (void *)[objc_alloc(NSNumber) initWithInt:*(unsigned int *)(v12 + 4 * v13)];
        [v11 addObject:v14];

        ++v13;
        uint64_t v12 = *a3;
      }
      while (v13 < (a3[1] - *a3) >> 2);
    }
    unint64_t v15 = CPMLconvertFV2Array(a2);
    uint64_t v16 = [v9 evaluateCPMLAlgorithm:v8 withFV:v15 boundedList:v11];
    [v16 doubleValue];
    *a4 = v17;
  }
  return v10 & 1;
}

void sub_214328124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CPMLDelegate::serializeCPMLAlgorithm(CPMLDelegate *this)
{
  uint64_t v2 = this->var1;
  uint64_t v3 = this->var0;
  char v4 = objc_opt_respondsToSelector();
  if (v4) {
    [v3 serializeCPMLAlgorithm:v2];
  }

  return v4 & 1;
}

void sub_2143281DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CPMLDelegate::deSerializeCPMLAlgorithm(CPMLDelegate *this)
{
  uint64_t v2 = this->var1;
  uint64_t v3 = this->var0;
  char v4 = objc_opt_respondsToSelector();
  if (v4) {
    [v3 serializeCPMLAlgorithm:v2];
  }

  return v4 & 1;
}

void sub_21432825C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CPMLDelegate::trainCPMLAlgorithm(CPMLDelegate *this, CPMLFeatureVector *a2)
{
  char v4 = this->var1;
  uint64_t v5 = this->var0;
  char v6 = objc_opt_respondsToSelector();
  if (v6)
  {
    uint64_t v7 = CPMLconvertFV2Array(a2);
    id v8 = (void *)[objc_alloc(NSNumber) initWithDouble:CPMLFeatureVector::getYHat(a2)];
    [v7 addObject:v8];
    [v5 trainCPMLAlgorithm:v4 withFV:v7];
  }
  return v6 & 1;
}

void sub_214328334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CPMLDelegate::updateCPMLAlgorithm(CPMLDelegate *this, CPMLFeatureVector *a2)
{
  char v4 = this->var1;
  uint64_t v5 = this->var0;
  char v6 = objc_opt_respondsToSelector();
  if (v6)
  {
    uint64_t v7 = CPMLconvertFV2Array(a2);
    id v8 = (void *)[objc_alloc(NSNumber) initWithDouble:CPMLFeatureVector::getYHat(a2)];
    [v7 addObject:v8];
    [v5 trainCPMLAlgorithm:v4 withFV:v7];
  }
  return v6 & 1;
}

void sub_214328428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CPMLAlgorithm::CPMLAlgorithm(CPMLAlgorithm *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  this->var0 = (void **)&unk_26C50F9F0;
  this->var6 = a4;
  this->size_t var3 = a2;
  this->var4 = 0;
  this->var8 = a3;
}

uint64_t CPMLAlgorithm::update(CPMLAlgorithm *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "update", "not implemented.");
  return 0xFFFFFFFFLL;
}

CPMLAlgorithm *CPMLAlgorithm::setDelegate(CPMLAlgorithm *this, CPMLDelegate *a2)
{
  this->var4 = a2;
  return this;
}

CPMLAlgorithm *CPMLAlgorithm::setDelegateEngine(CPMLAlgorithm *this, CPMLDelegateEngine *a2)
{
  this->var5 = a2;
  return this;
}

uint64_t CPLogCTypesV(void *a1, unint64_t a2, ...)
{
  va_start(va, a2);
  uint64_t v3 = a1;
  id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  va_copy(v19, va);
  if (!a2)
  {
LABEL_22:
    uint64_t v16 = [v3 logNSDictionary:v18];
    goto LABEL_25;
  }
  uint64_t v4 = 0;
  uint64_t v5 = (int *)a2;
  while (a2 < 2)
  {
LABEL_10:
    char v10 = va_arg(v19, int *);
    uint64_t v5 = v10;
    if (!v10) {
      goto LABEL_22;
    }
  }
  id v6 = objc_alloc_init(MEMORY[0x263F8C6D0]);
  uint64_t v7 = [v3 getColumnName:v4];
  switch([v3 getSchemaType:v4])
  {
    case 3u:
      uint64_t v8 = [objc_alloc(NSNumber) initWithInteger:*v5];
      goto LABEL_8;
    case 4u:
      uint64_t v8 = [objc_alloc(NSNumber) initWithDouble:*(double *)v5];
      goto LABEL_8;
    case 5u:
      uint64_t v8 = [[NSString alloc] initWithCString:v5 encoding:4];
LABEL_8:
      id v9 = (void *)v8;

      goto LABEL_9;
    case 7u:
      int v11 = *v5;
      int v12 = [v3 getVectorContent:v4];
      unint64_t v13 = v6;
      if (!v11)
      {
        id v9 = v6;
LABEL_9:
        [v18 setObject:v9 forKey:v7];
        ++v4;

        goto LABEL_10;
      }
      while (1)
      {
        unint64_t v14 = va_arg(v19, double *);
        if (v12 == 3)
        {
          uint64_t v15 = [objc_alloc(NSNumber) initWithInteger:*(int *)v14];
          goto LABEL_19;
        }
        if (v12 == 4)
        {
          uint64_t v15 = [objc_alloc(NSNumber) initWithDouble:*v14];
          goto LABEL_19;
        }
        if (v12 != 5) {
          break;
        }
        uint64_t v15 = [[NSString alloc] initWithCString:v14 encoding:4];
LABEL_19:
        id v9 = (void *)v15;

        unint64_t v13 = v9;
        if (!--v11) {
          goto LABEL_9;
        }
      }
      NSLog(&cfstr_SUnknownType.isa, "CPLogCTypesV");
LABEL_24:

      uint64_t v16 = 0xFFFFFFFFLL;
LABEL_25:

      return v16;
    default:
      NSLog(&cfstr_SNoSupport.isa, "CPLogCTypesV");
      goto LABEL_24;
  }
}

void sub_214328758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

CPMLDB *CPOpenDB(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5 = (void *)[[NSString alloc] initWithCString:a1 encoding:4];
  id v6 = (void *)[[NSString alloc] initWithCString:a2 encoding:4];
  uint64_t v7 = [[CPMLDB alloc] initWithDBName:v5 withPlistPath:v6 withWriteOptions:a3];

  return v7;
}

void sub_214328860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CPMLDB *CPOpenDBWithFile(char *a1, char *a2, char *a3, uint64_t a4)
{
  uint64_t v7 = (void *)[[NSString alloc] initWithCString:a1 encoding:4];
  uint64_t v8 = (void *)[[NSString alloc] initWithCString:a2 encoding:4];
  id v9 = (void *)[[NSString alloc] initWithCString:a3 encoding:4];
  char v10 = [[CPMLDB alloc] initWithDBName:v7 dataFromFile:v8 withPlistPath:v9 withWriteOptions:a4];

  return v10;
}

void sub_21432893C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214328B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214328C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214328D50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2143290F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214329330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_2143294D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2143295F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214329D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_214329FA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214329FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  char v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)CPMLDB;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

uint64_t callbackDBResponse(void *a1, int a2, char **a3, char **a4)
{
  return 0;
}

void sub_21432A2C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432A484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432A5E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432A750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432A8B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432AA38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, ...)
{
  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21432AD0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432B1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_21432B3A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432B4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_21432B59C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21432B6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_21432B77C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21432B988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_21432BA34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_21432BAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_21432BB9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_21432BC64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_21432BD1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_21432BDB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21432BE50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21432C0B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432C404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  _Unwind_Resume(a1);
}

void sub_21432C638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432C704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432C7CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432C894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432C9E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432CC3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432CD90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21432D0CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432D220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_21432D358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432D440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432D51C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432D6BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_21432DAD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432DC24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432DF00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21432DFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21432E0BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CPMLLIBSVMClassifier::establishParam(uint64_t this, CPMLTunableData *a2)
{
  uint64_t v2 = this;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a2)
  {
    this = CPMLTunableData::getNumberOfItems(a2);
    if ((int)this >= 1)
    {
      CPMLTunableData::tDataGetString(a2, "svm_type", v15, 0x10uLL);
      if (*(_DWORD *)v15 == 1448304451 && v15[4] == 67) {
        goto LABEL_23;
      }
      if (*(_DWORD *)v15 == 1398756686 && *(unsigned __int16 *)&v15[4] == 17238)
      {
        int v9 = 1;
      }
      else if (*(void *)v15 == 0x53414C435F454E4FLL && v15[8] == 83)
      {
        int v9 = 2;
      }
      else if (*(void *)v15 == 0x5F4E4F4C49535045 && *(void *)&v15[3] == 0x5256535F4E4F4C49)
      {
        int v9 = 3;
      }
      else
      {
        if (*(_DWORD *)v15 != 1398756686 || *(unsigned __int16 *)&v15[4] != 21078)
        {
LABEL_23:
          *(_DWORD *)(v2 + 16(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = 0;
          goto LABEL_30;
        }
        int v9 = 4;
      }
      *(_DWORD *)(v2 + 16(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = v9;
LABEL_30:
      CPMLTunableData::tDataGetString(a2, "kernel_type", v15, 0x10uLL);
      if (*(_DWORD *)v15 == 1162758476 && *(unsigned __int16 *)&v15[4] == 21057)
      {
        *(_DWORD *)(v2 + 164) = 0;
LABEL_53:
        CPMLTunableData::tDataGetInt(a2, "degree", (int *)(v2 + 168));
        CPMLTunableData::tDataGetDouble(a2, "gamma", (double *)(v2 + 176));
        CPMLTunableData::tDataGetDouble(a2, "coef0", (double *)(v2 + 184));
        CPMLTunableData::tDataGetDouble(a2, "nu", (double *)(v2 + 240));
        CPMLTunableData::tDataGetDouble(a2, "cache_size", (double *)(v2 + 192));
        CPMLTunableData::tDataGetDouble(a2, "C", (double *)(v2 + 208));
        CPMLTunableData::tDataGetDouble(a2, "eps", (double *)(v2 + 200));
        CPMLTunableData::tDataGetDouble(a2, "p", (double *)(v2 + 248));
        CPMLTunableData::tDataGetInt(a2, "shrinking", (int *)(v2 + 256));
        CPMLTunableData::tDataGetInt(a2, "probability", (int *)(v2 + 260));
        this = CPMLTunableData::tDataGetInt(a2, "cpu_count", &libsvm_cpu_count);
        goto LABEL_54;
      }
      if (*(_DWORD *)v15 == 1498173264)
      {
        int v14 = 1;
      }
      else
      {
        if (*(unsigned __int16 *)v15 != 16978 || v15[2] != 70)
        {
          if (*(_DWORD *)v15 == 1296517459 && *(_DWORD *)&v15[3] == 1145655117)
          {
            int v14 = 3;
            goto LABEL_52;
          }
          if (*(void *)v15 == 0x55504D4F43455250 && *(void *)&v15[3] == 0x44455455504D4F43)
          {
            int v14 = 4;
            goto LABEL_52;
          }
        }
        int v14 = 2;
      }
LABEL_52:
      *(_DWORD *)(v2 + 164) = v14;
      goto LABEL_53;
    }
  }
  *(void *)(v2 + 16(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = 0x200000000;
  *(_DWORD *)(v2 + 168) = 3;
  *(void *)(v2 + 176) = 0;
  *(void *)(v2 + 184) = 0;
  *(void *)(v2 + 208) = 0x3FF0000000000000;
  *(_OWORD *)(v2 + 192) = xmmword_2143544D0;
  *(_OWORD *)(v2 + 24(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = xmmword_2143544E0;
  *(void *)(v2 + 256) = 1;
LABEL_54:
  *(_DWORD *)(v2 + 216) = 0;
  *(void *)(v2 + 224) = 0;
  *(void *)(v2 + 232) = 0;
  return this;
}

void CPMLLIBSVMClassifier::CPMLLIBSVMClassifier(CPMLLIBSVMClassifier *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, a2, a3, a4);
  *(void *)uint64_t v7 = &unk_26C50FE80;
  strcpy((char *)(v7 + 8), "3.20.0");
  libsvm_cpu_count = 2;
  var0 = a2->var0;
  uint64_t v9 = *((int *)a2->var0 + 30);
  uint64_t v11 = *((int *)a2->var0 + 32);
  uint64_t v10 = *((int *)a2->var0 + 33);
  *(void *)(v7 + 96) = *((int *)a2->var0 + 31);
  *(void *)(v7 + 104) = v10;
  uint64_t v12 = *((void *)var0 + 4) - *((void *)var0 + 3);
  uint64_t v13 = *(void *)var0;
  uint64_t v14 = ((*((void *)var0 + 1) - *(void *)var0) >> 2);
  *(void *)(v7 + 128) = v14;
  *(void *)(v7 + 136) = v13;
  *(unsigned char *)(v7 + 296) = 0;
  uint64_t v15 = v12 >> 3;
  *(void *)(v7 + 112) = v9;
  *(void *)(v7 + 12(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = v15;
  LODWORD(var(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = *(_DWORD *)(*((void *)var0 + 9) + 4 * v11);
  BOOL v16 = var0 == 0;
  if (var0) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = v14;
  }
  uint64_t v18 = 120;
  if (v16) {
    uint64_t v18 = 128;
  }
  *(void *)(v7 + v18) = v17 - 1;
  CPMLLIBSVMClassifier::establishParam(v7, a4);
  uint64_t v19 = *((void *)this + 14);
  *((_DWORD *)this + 66) = v19;
  *((void *)this + 34) = malloc_type_calloc((int)v19, 8uLL, 0x100004000313F17uLL);
  *((void *)this + 35) = malloc_type_calloc(*((int *)this + 66), 8uLL, 0x2004093837F09uLL);
  CPMLCDB::getIterator();
}

void sub_21432E830(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPMLLIBSVMClassifier::CPMLLIBSVMClassifier(CPMLLIBSVMClassifier *this, CPMLSerialization *a2, CPMLTunableData *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, a2, a3);
  *(void *)uint64_t v5 = &unk_26C50FE80;
  *(unsigned char *)(v5 + 296) = 0;
  (*((void (**)(CPMLSerialization *, uint64_t, const char *, uint64_t, void))a2->var0 + 13))(a2, v5 + 8, "version", 5, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 112, "totalRows", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 96, "featureVectorSpace", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 104, "resultCardinality", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 120, "continousFeatureCount", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 128, "discreteFeatureCount", 1, 0);
  id v6 = malloc_type_calloc(1uLL, 0xB8uLL, 0x109004003BC950CuLL);
  *((void *)this + 36) = v6;
  *((unsigned char *)this + 296) = 0;
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**((void **)this + 11) + 72))(*((void *)this + 11), (uint64_t)v6 + 104, "model_nr_class", 1, 0);
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**((void **)this + 11) + 72))(*((void *)this + 11), *((void *)this + 36) + 108, "model_l", 1, 0);
  int v7 = (*(_DWORD *)(*((void *)this + 36) + 104) - 1) * *(_DWORD *)(*((void *)this + 36) + 104);
  size_t v8 = (uint64_t)(v7 + (v7 < 0)) >> 1;
  *(void *)(*((void *)this + 36) + 128) = malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
  (*(void (**)(void))(**((void **)this + 11) + 96))(*((void *)this + 11));
  *(void *)(*((void *)this + 36) + 16(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = malloc_type_calloc(*(int *)(*((void *)this + 36) + 104), 4uLL, 0x100004052888210uLL);
  (*(void (**)(void))(**((void **)this + 11) + 64))(*((void *)this + 11));
  int v21 = 0;
  (*(void (**)(void, int *, const char *, uint64_t, void))(**((void **)this + 11) + 64))(*((void *)this + 11), &v21, "testA", 1, 0);
  if (v21)
  {
    *(void *)(*((void *)this + 36) + 136) = malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
    (*(void (**)(void))(**((void **)this + 11) + 96))(*((void *)this + 11));
  }
  (*(void (**)(void, int *, const char *, uint64_t, void))(**((void **)this + 11) + 64))(*((void *)this + 11), &v21, "testB", 1, 0);
  if (v21)
  {
    *(void *)(*((void *)this + 36) + 144) = malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
    (*(void (**)(void))(**((void **)this + 11) + 96))(*((void *)this + 11));
  }
  *(void *)(*((void *)this + 36) + 168) = malloc_type_calloc(*(int *)(*((void *)this + 36) + 104), 4uLL, 0x100004052888210uLL);
  (*(void (**)(void))(**((void **)this + 11) + 72))(*((void *)this + 11));
  uint64_t v9 = malloc_type_calloc(*(int *)(*((void *)this + 36) + 104), 8uLL, 0x80040B8603338uLL);
  uint64_t v10 = *((void *)this + 36);
  *(void *)(v10 + 12(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = v9;
  if (*(int *)(v10 + 104) >= 2)
  {
    uint64_t v11 = 0;
    do
    {
      *(void *)(*(void *)(*((void *)this + 36) + 120) + 8 * v11++) = malloc_type_calloc(*(int *)(v10 + 108), 8uLL, 0x100004000313F17uLL);
      uint64_t v10 = *((void *)this + 36);
    }
    while (v11 < *(int *)(v10 + 104) - 1);
  }
  uint64_t v12 = malloc_type_calloc(*(int *)(v10 + 108), 8uLL, 0x2004093837F09uLL);
  uint64_t v13 = *((void *)this + 36);
  *(void *)(v13 + 112) = v12;
  if (*(int *)(v13 + 108) >= 1)
  {
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = (char *)malloc_type_calloc(*((void *)this + 12) + 1, 0x10uLL, 0x1000040F7F8B94BuLL);
      sprintf(v24, "model_sv_coef%d", v14);
      sprintf(v23, "p_index%d", v14);
      sprintf(v22, "p_value%d", v14);
      uint64_t v16 = *((void *)this + 36);
      if (*(int *)(v16 + 104) >= 2)
      {
        uint64_t v17 = 0;
        do
        {
          (*(void (**)(void, uint64_t, char *, uint64_t, uint64_t))(**((void **)this + 11) + 96))(*((void *)this + 11), *(void *)(*(void *)(v16 + 120) + 8 * v17) + 8 * v14, v24, 1, v17);
          ++v17;
          uint64_t v16 = *((void *)this + 36);
        }
        while (v17 < *(int *)(v16 + 104) - 1);
      }
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      do
      {
        char v20 = &v15[v18];
        (*(void (**)(void, char *, char *, uint64_t, uint64_t))(**((void **)this + 11) + 64))(*((void *)this + 11), &v15[v18], v23, 1, v19);
        (*(void (**)(void, char *, char *, uint64_t, uint64_t))(**((void **)this + 11) + 96))(*((void *)this + 11), &v15[v18 + 8], v22, 1, v19++);
        v18 += 16;
      }
      while (*(_DWORD *)v20 != -1);
      *(void *)(*(void *)(*((void *)this + 36) + 112) + 8 * v14++) = malloc_type_realloc(v15, v18 & 0xFFFFFFFF0, 0x1000040F7F8B94BuLL);
      uint64_t v13 = *((void *)this + 36);
    }
    while (v14 < *(int *)(v13 + 108));
  }
  *(_DWORD *)(v13 + 176) = 1;
  *((void *)this + 34) = 0;
  *((void *)this + 35) = 0;
}

void sub_21432F004(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPMLLIBSVMClassifier::CPMLLIBSVMClassifier(CPMLLIBSVMClassifier *this, int *a2, CPMLTunableData *a3)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, 0, a3);
  *(void *)uint64_t v4 = &unk_26C50FE80;
  strcpy((char *)(v4 + 8), "3.20.0");
  *(void *)(v4 + 288) = a2;
  *(unsigned char *)(v4 + 296) = 1;
  *(void *)(v4 + 104) = a2[26];
  *(void *)(v4 + 272) = 0;
  *(void *)(v4 + 28(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = 0;
}

void CPMLLIBSVMClassifier::~CPMLLIBSVMClassifier(CPMLLIBSVMClassifier *this)
{
  *(void *)this = &unk_26C50FE80;
  uint64_t v2 = (void *)*((void *)this + 34);
  if (v2) {
    free(v2);
  }
  *((void *)this + 34) = 0;
  uint64_t v3 = (void *)*((void *)this + 35);
  if (v3) {
    free(v3);
  }
  *((void *)this + 35) = 0;
  if (!*((unsigned char *)this + 296)) {
    svm_free_and_destroy_model((void **)this + 36);
  }

  CPModelClose(this);
}

{
  uint64_t vars8;

  CPMLLIBSVMClassifier::~CPMLLIBSVMClassifier(this);

  JUMPOUT(0x21669DB80);
}

uint64_t CPMLLIBSVMClassifier::serialize(CPMLLIBSVMClassifier *this)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)this + 11);
  uint64_t v3 = (char *)this + 8;
  size_t v4 = strlen((const char *)this + 8);
  (*(void (**)(uint64_t, char *, const char *, size_t, void))(*(void *)v2 + 56))(v2, v3, "version", v4, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 112, "totalRows", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 96, "featureVectorSpace", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 104, "resultCardinality", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 120, "continousFeatureCount", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 128, "discreteFeatureCount", 1, 0);
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**((void **)this + 11) + 24))(*((void *)this + 11), *((void *)this + 36) + 104, "model_nr_class", 1, 0);
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**((void **)this + 11) + 24))(*((void *)this + 11), *((void *)this + 36) + 108, "model_l", 1, 0);
  uint64_t v5 = *((void *)this + 36);
  uint64_t v6 = *(void *)(v5 + 128);
  LODWORD(v5) = (*(_DWORD *)(v5 + 104) - 1) * *(_DWORD *)(v5 + 104);
  (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), v6, "model_rho", (uint64_t)(int)(v5 + ((int)v5 < 0)) >> 1, 0);
  (*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 16))(*((void *)this + 11), *(void *)(*((void *)this + 36) + 160), "model_label", *(int *)(*((void *)this + 36) + 104), 0);
  if (*(void *)(*((void *)this + 36) + 136))
  {
    *(_DWORD *)char v20 = 1;
    (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 16))(*((void *)this + 11), v20, "testA", 1, 0);
    uint64_t v7 = *((void *)this + 36);
    uint64_t v8 = *(void *)(v7 + 136);
    LODWORD(v7) = (*(_DWORD *)(v7 + 104) - 1) * *(_DWORD *)(v7 + 104);
    (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), v8, "model_probA", (uint64_t)(int)(v7 + ((int)v7 < 0)) >> 1, 0);
  }
  else
  {
    *(_DWORD *)char v20 = 0;
    (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 16))(*((void *)this + 11), v20, "testA", 1, 0);
  }
  if (*(void *)(*((void *)this + 36) + 144))
  {
    *(_DWORD *)char v20 = 1;
    (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 16))(*((void *)this + 11), v20, "testB", 1, 0);
    uint64_t v9 = *((void *)this + 36);
    uint64_t v10 = *(void *)(v9 + 144);
    LODWORD(v9) = (*(_DWORD *)(v9 + 104) - 1) * *(_DWORD *)(v9 + 104);
    (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), v10, "model_probB", (uint64_t)(int)(v9 + ((int)v9 < 0)) >> 1, 0);
  }
  else
  {
    *(_DWORD *)char v20 = 0;
    (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 16))(*((void *)this + 11), v20, "testB", 1, 0);
  }
  (*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 24))(*((void *)this + 11), *(void *)(*((void *)this + 36) + 168), "model_nSV", *(int *)(*((void *)this + 36) + 104), 0);
  if (*(int *)(*((void *)this + 36) + 108) >= 1)
  {
    uint64_t v11 = 0;
    do
    {
      sprintf(v20, "model_sv_coef%d", v11);
      sprintf(v19, "p_index%d", v11);
      sprintf(v18, "p_value%d", v11);
      uint64_t v12 = *((void *)this + 36);
      if (*(int *)(v12 + 104) >= 2)
      {
        uint64_t v13 = 0;
        do
        {
          (*(void (**)(void, uint64_t, char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *(void *)(*(void *)(v12 + 120) + 8 * v13++) + 8 * v11, v20, 1, 0);
          uint64_t v12 = *((void *)this + 36);
        }
        while (v13 < *(int *)(v12 + 104) - 1);
      }
      uint64_t v14 = *(int **)(*(void *)(v12 + 112) + 8 * v11);
      for (int i = *v14; i != -1; int i = v16)
      {
        (*(void (**)(void, int *, char *, uint64_t, void))(**((void **)this + 11) + 16))(*((void *)this + 11), v14, v19, 1, 0);
        (*(void (**)(void, int *, char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), v14 + 2, v18, 1, 0);
        int v16 = v14[4];
        v14 += 4;
      }
      (*(void (**)(void, int *, char *, uint64_t, void))(**((void **)this + 11) + 16))(*((void *)this + 11), v14, v19, 1, 0);
      (*(void (**)(void, int *, char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), v14 + 2, v18, 1, 0);
      ++v11;
    }
    while (v11 < *(int *)(*((void *)this + 36) + 108));
  }
  return 0;
}

uint64_t CPMLLIBSVMClassifier::train(CPMLLIBSVMClassifier *this)
{
  uint64_t v2 = (int *)((char *)this + 264);
  uint64_t v3 = (long long *)((char *)this + 160);
  size_t v4 = svm_check_parameter((unsigned int *)this + 66, (uint64_t)this + 160);
  if (v4)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "ERROR: %s\n", v4);
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v6 = svm_train(v2, v3);
    uint64_t result = 0;
    *((void *)this + 36) = v6;
    *((unsigned char *)this + 296) = 0;
  }
  return result;
}

uint64_t CPMLLIBSVMClassifier::eval(uint64_t a1, CPMLFeatureVector *this)
{
  IntVector = (uint64_t *)CPMLFeatureVector::getIntVector(this);
  uint64_t RealVector = (double **)CPMLFeatureVector::getRealVector(this);
  uint64_t v6 = (char *)malloc_type_calloc(((IntVector[1] - *IntVector) >> 2) + RealVector[1] - *RealVector + 1, 0x10uLL, 0x1000040F7F8B94BuLL);
  uint64_t v7 = v6;
  uint64_t v8 = *IntVector;
  unint64_t v9 = IntVector[1] - *IntVector;
  unint64_t v10 = v9 >> 2;
  if ((int)(v9 >> 2) < 1)
  {
    int v12 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    int v12 = 0;
    uint64_t v13 = (v9 >> 2);
    do
    {
      int v14 = *(_DWORD *)(v8 + 4 * v11);
      if (v14)
      {
        double v15 = (double)v14;
        ++v11;
        int v16 = (double *)&v6[16 * v12];
        *(_DWORD *)int v16 = v11;
        v16[1] = v15;
        ++v12;
      }
      else
      {
        ++v11;
      }
    }
    while (v11 != v13);
  }
  uint64_t v17 = *RealVector;
  unint64_t v18 = (char *)RealVector[1] - (char *)*RealVector;
  if ((int)(v18 >> 3) >= 1)
  {
    int v19 = v10 + 1;
    uint64_t v20 = (v18 >> 3);
    do
    {
      double v21 = *v17;
      if (*v17 != 0.0)
      {
        uint64_t v22 = (double *)&v6[16 * v12];
        *(_DWORD *)uint64_t v22 = v19;
        v22[1] = v21;
        ++v12;
      }
      ++v17;
      ++v19;
      --v20;
    }
    while (v20);
  }
  double v23 = (double *)&v6[16 * v12];
  *(_DWORD *)double v23 = -1;
  v23[1] = nan("");
  unint64_t v24 = malloc_type_realloc(v7, 16 * (v12 + 1), 0x1000040F7F8B94BuLL);
  svm_predict(*(void *)(a1 + 288), (uint64_t)v24);
  double v26 = 1.0;
  if (v25 == -1.0) {
    double v26 = 0.0;
  }
  if (*(void *)(a1 + 104) == 2) {
    double v25 = v26;
  }
  CPMLFeatureVector::setYHat((uint64_t)this, v25);
  free(v24);
  return 0;
}

void CPMLLIBSVMClassifier::update(CPMLLIBSVMClassifier *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
}

uint64_t CPMLLIBSVMClassifier::errorString(CPMLLIBSVMClassifier *this)
{
  return 0;
}

uint64_t CPMLLIBSVMClassifier::requireRealOnly(CPMLLIBSVMClassifier *this)
{
  return 1;
}

void CPMLDBSerialization::CPMLDBSerialization(CPMLDBSerialization *this, sqlite3 *a2)
{
  CPMLSerialization::CPMLSerialization((CPMLSerialization *)this, a2);
  *(void *)uint64_t v3 = &unk_26C50FD60;
  *(void *)(v3 + 12(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = 0;
  *(void *)(v3 + 112) = v3 + 120;
  size_t v4 = (uint64_t **)(v3 + 112);
  *(void *)(v3 + 128) = 0;
  *(_DWORD *)(v3 + 96) = -1;
  *(void *)(v3 + 104) = 0;
  *(_OWORD *)(v3 + 4(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_OWORD *)(v3 + 72) = 0u;
  *(void *)(v3 + 88) = 0;
  ppStmt = 0;
  uint64_t v5 = sqlite3_mprintf("SELECT name FROM sqlite_master WHERE type = \"table\"");
  int v6 = strlen(v5);
  sqlite3_prepare_v2(*((sqlite3 **)this + 4), v5, v6, &ppStmt, 0);
  if (v5) {
    sqlite3_free(v5);
  }
  while (1)
  {
    uint64_t v7 = (CPMLLog *)sqlite3_step(ppStmt);
    if (v7 != 100) {
      break;
    }
    uint64_t v8 = (char *)sqlite3_column_text(ppStmt, 0);
    std::string::basic_string[abi:ne180100]<0>(__p, v8);
    uint64_t v13 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (const void **)__p, (uint64_t)&std::piecewise_construct, (long long **)&v13)+ 14) = 1;
    if (v11 < 0) {
      operator delete(__p[0]);
    }
  }
  if (v7 != 101)
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v7);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "CPMLDBSerialization", "Serializer: Error iterating rows\n");
  }
  sqlite3_finalize(ppStmt);
}

void sub_21432FC54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(v15, *(char **)(v14 + 120));
  CPMLSerialization::~CPMLSerialization((CPMLSerialization *)v14);
  _Unwind_Resume(a1);
}

void CPMLDBSerialization::~CPMLDBSerialization(CPMLDBSerialization *this)
{
  *(void *)this = &unk_26C50FD60;
  int v2 = *((_DWORD *)this + 24);
  if (v2 != -1)
  {
    close(v2);
    *((_DWORD *)this + 24) = -1;
  }
  uint64_t v3 = (void *)*((void *)this + 13);
  if (v3) {
    munmap(v3, *((int *)this + 25));
  }
  std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy((uint64_t)this + 112, *((char **)this + 15));

  CPMLSerialization::~CPMLSerialization((CPMLSerialization *)this);
}

{
  uint64_t vars8;

  CPMLDBSerialization::~CPMLDBSerialization(this);

  JUMPOUT(0x21669DB80);
}

void std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

uint64_t *std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, long long **a4)
{
  int v6 = (uint64_t **)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__find_equal<std::string>((uint64_t)a1, &v9, a2);
  uint64_t result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__insert_node_at(a1, v9, v6, v8);
    return v8;
  }
  return result;
}

void *std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__find_equal<std::string>(uint64_t a1, void *a2, const void **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = (void *)v4;
        uint64_t v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3)) {
        break;
      }
      uint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

void std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, long long **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  int v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v7 = (std::string *)(v6 + 32);
  uint64_t v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)v8, *((void *)v8 + 1));
  }
  else
  {
    long long v9 = *v8;
    *((void *)v6 + 6) = *((void *)v8 + 2);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v9;
  }
  *((_DWORD *)v6 + 14) = 0;
  *(unsigned char *)(a3 + 16) = 1;
}

void sub_21432FF8C(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    int v6 = a2;
  }
  else {
    int v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  size_t v5 = this;
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
    size_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      int v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            size_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            size_t v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *size_t v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            int v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *int v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), size_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *int v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        int v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *int v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *size_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,int>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0) {
      operator delete(__p[4]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void CPMLCreateGMMAnalysis()
{
}

void sub_2143303EC(_Unwind_Exception *a1)
{
  uint64_t v2 = v1;
  MEMORY[0x21669DB80](v2, 0xA1C4034F8F590);
  _Unwind_Resume(a1);
}

void CPMLGMMAnalysisHandler::CPMLGMMAnalysisHandler(CPMLGMMAnalysisHandler *this, CPMLAlgorithm *a2)
{
  CPMLAnalysisHandler::CPMLAnalysisHandler(this);
  *int v3 = &unk_26C50FF60;
  v3[1] = a2;
}

CPMLGMMAnalysisHandler *CPMLDestroyGMMAnalysis(CPMLGMMAnalysisHandler *result)
{
  if (result)
  {
    CPMLGMMAnalysisHandler::~CPMLGMMAnalysisHandler(result);
    JUMPOUT(0x21669DB80);
  }
  return result;
}

void CPMLGMMAnalysisHandler::~CPMLGMMAnalysisHandler(CPMLGMMAnalysisHandler *this)
{
  *(void *)this = &unk_26C50FF60;
  uint64_t v2 = *((void *)this + 1);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  CPModelClose(this);
}

void CPMLGMMAnalysisHandler::classify(CPMLGMMAnalysisHandler *this, int a2, double *a3)
{
}

void sub_214330608(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x1020C4087C48359);
  _Unwind_Resume(a1);
}

double CPMLGMMAnalysisHandler::regression(CPMLGMMAnalysisHandler *this, int a2, double *a3)
{
  return nan("");
}

uint64_t CPMLsql_callbackDBResponse(CPMLLog *a1, int a2, char **a3, char **a4)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(a1);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "CPMLsql_callbackDBResponse", "CB response3");
  return 0;
}

uint64_t CPMLsql_stepAndFinalize(sqlite3_stmt *a1)
{
  uint64_t v2 = sqlite3_step(a1);
  uint64_t v3 = v2;
  if (v2 != 101)
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)v2);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "CPMLsql_stepAndFinalize", "%s %d", "Error step", v3);
    uint64_t v3 = 0xFFFFFFFFLL;
  }
  sqlite3_finalize(a1);
  return v3;
}

uint64_t CPMLsql_dropTableCommand(sqlite3 *a1, char *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  strcpy(__s1, "DROP TABLE IF EXISTS ");
  strcat(__s1, a2);
  errmsg = 0;
  uint64_t result = sqlite3_exec(a1, __s1, (int (__cdecl *)(void *, int, char **, char **))CPMLsql_callbackDBResponse, a1, &errmsg);
  if (result)
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)result);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "CPMLsql_dropTableCommand", "SQL error: %s \n", errmsg);
    sqlite3_free(errmsg);
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t CPMLsql_getRowCountForTable(sqlite3 *a1, char *a2)
{
  ppStmt = 0;
  uint64_t v3 = sqlite3_mprintf("select count (*) from %q", a2);
  int v4 = strlen(v3);
  size_t v5 = (CPMLLog *)sqlite3_prepare_v2(a1, v3, v4, &ppStmt, 0);
  if (v5)
  {
    int v6 = (int)v5;
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v5);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "CPMLsql_getRowCountForTable", "%s %d \n", "prepare fail", v6);
  }
  int v8 = (CPMLLog *)sqlite3_step(ppStmt);
  if (v8 != 101)
  {
    int v9 = (int)v8;
    if (v8 == 100)
    {
      uint64_t v10 = sqlite3_column_int(ppStmt, 0);
      goto LABEL_8;
    }
    uint64_t v11 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v8);
    CPMLLog::log(v11, CPML_LOG_ERR, "CPMLsql_getRowCountForTable", "Error iterating rows %d\n", v9);
  }
  uint64_t v10 = 0;
LABEL_8:
  sqlite3_finalize(ppStmt);
  if (v3) {
    sqlite3_free(v3);
  }
  return v10;
}

uint64_t CPMLsql_createTable(sqlite3 *a1, char *a2, char *__s, char a4)
{
  ppStmt = 0;
  size_t v8 = strlen(__s);
  int v9 = (CPMLLog *)strlen(a2);
  if ((unint64_t)v9 + v8 < 0x101)
  {
    if ((a4 & 1) == 0)
    {
      uint64_t v12 = sqlite3_mprintf("DROP TABLE IF EXISTS %q;", a2);
      int v13 = strlen(v12);
      uint64_t v14 = (CPMLLog *)sqlite3_prepare_v2(a1, v12, v13, &ppStmt, 0);
      if (v14)
      {
        int v15 = (int)v14;
        CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v14);
        CPMLLog::log(CPMLLog, CPML_LOG_ERR, "CPMLsql_createTable", "%s %d \n", "prepare fail", v15);
      }
      CPMLsql_stepAndFinalize(ppStmt);
      if (v12) {
        sqlite3_free(v12);
      }
    }
    uint64_t v17 = sqlite3_mprintf("CREATE TABLE IF NOT EXISTS %q (%q, pKey INTEGER PRIMARY KEY);", a2, __s);
    int v18 = strlen(v17);
    int v19 = (CPMLLog *)sqlite3_prepare_v2(a1, v17, v18, &ppStmt, 0);
    if (v19)
    {
      int v20 = (int)v19;
      double v21 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v19);
      CPMLLog::log(v21, CPML_LOG_ERR, "CPMLsql_createTable", "%s %d \n", "prepare fail", v20);
    }
    unsigned int v22 = CPMLsql_stepAndFinalize(ppStmt);
    if (v22 == 101) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v22;
    }
    if (v17) {
      sqlite3_free(v17);
    }
  }
  else
  {
    uint64_t v10 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v9);
    CPMLLog::log(v10, CPML_LOG_ERR, "CPMLsql_createTable", "command too long.");
    return 0xFFFFFFFFLL;
  }
  return v11;
}

uint64_t CPMLsql_insertIntoTable(sqlite3 *a1, char *a2, char *__s, char *a4)
{
  ppStmt = 0;
  size_t v8 = strlen(__s);
  size_t v9 = strlen(a2) + v8;
  uint64_t v10 = (CPMLLog *)strlen(a4);
  if ((unint64_t)v10 + v9 < 0x201)
  {
    int v13 = sqlite3_mprintf("INSERT INTO %q (%q) values(%q);", a2, __s, a4);
    int v14 = strlen(v13);
    int v15 = (CPMLLog *)sqlite3_prepare_v2(a1, v13, v14, &ppStmt, 0);
    if (v15)
    {
      int v16 = (int)v15;
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v15);
      CPMLLog::log(CPMLLog, CPML_LOG_ERR, "CPMLsql_insertIntoTable", "%s %d \n", "prepare fail", v16);
    }
    uint64_t v12 = CPMLsql_stepAndFinalize(ppStmt);
    if (v13) {
      sqlite3_free(v13);
    }
  }
  else
  {
    uint64_t v11 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v10);
    CPMLLog::log(v11, CPML_LOG_ERR, "CPMLsql_insertIntoTable", "command too long.");
    return 0xFFFFFFFFLL;
  }
  return v12;
}

uint64_t CPMLsql_insertBlobIntoTable(sqlite3 *a1, char *a2, char *a3, char *a4, int a5, void *a6, int a7)
{
  ppStmt = 0;
  uint64_t v11 = sqlite3_mprintf("INSERT INTO %q (%q) values(%q);", a2, a3, a4);
  int v12 = strlen(v11);
  int v13 = (CPMLLog *)sqlite3_prepare_v2(a1, v11, v12, &ppStmt, 0);
  if (v13)
  {
    int v14 = (int)v13;
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v13);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "CPMLsql_insertBlobIntoTable", "%s %d \n", "prepare fail", v14);
  }
  sqlite3_bind_blob(ppStmt, a5, a6, a7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  uint64_t v16 = CPMLsql_stepAndFinalize(ppStmt);
  if (v11) {
    sqlite3_free(v11);
  }
  return v16;
}

uint64_t CPMLsql_cardinalityCount(sqlite3 *a1, char *a2, char *a3)
{
  ppStmt = 0;
  int v4 = sqlite3_mprintf("select count (DISTINCT %q) from %q;", a3, a2);
  int v5 = strlen(v4);
  int v6 = (CPMLLog *)sqlite3_prepare_v2(a1, v4, v5, &ppStmt, 0);
  if (v6)
  {
    int v7 = (int)v6;
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v6);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "CPMLsql_cardinalityCount", "%s %d \n", "prepare fail", v7);
  }
  size_t v9 = (CPMLLog *)sqlite3_step(ppStmt);
  if (v9 != 101)
  {
    int v10 = (int)v9;
    if (v9 == 100)
    {
      uint64_t v11 = sqlite3_column_int(ppStmt, 0);
      goto LABEL_8;
    }
    int v12 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v9);
    CPMLLog::log(v12, CPML_LOG_ERR, "CPMLsql_cardinalityCount", "Error iterating rows %d\n", v10);
  }
  uint64_t v11 = 0;
LABEL_8:
  sqlite3_finalize(ppStmt);
  if (v4) {
    sqlite3_free(v4);
  }
  return v11;
}

CPMLLog *CPMLsql_beginTransaction(sqlite3 *a1, unsigned int a2)
{
  errmsg = 0;
  if (a2 > 2) {
    return 0;
  }
  uint64_t v2 = (CPMLLog *)sqlite3_exec(a1, off_2642023D0[a2], (int (__cdecl *)(void *, int, char **, char **))CPMLsql_callbackDBResponse, 0, &errmsg);
  uint64_t v3 = v2;
  if (v2)
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v2);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "CPMLsql_beginTransaction", "SQL Begin TransactionError %s.", errmsg);
    sqlite3_free(errmsg);
  }
  return v3;
}

CPMLLog *CPMLsql_commitTransaction(sqlite3 *a1)
{
  errmsg = 0;
  uint64_t v1 = (CPMLLog *)sqlite3_exec(a1, "END TRANSACTION", (int (__cdecl *)(void *, int, char **, char **))CPMLsql_callbackDBResponse, 0, &errmsg);
  uint64_t v2 = v1;
  if (v1)
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v1);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "CPMLsql_commitTransaction", "SQL End TransactionError %s.", errmsg);
    sqlite3_free(errmsg);
  }
  return v2;
}

id CPMLconvertFV2Array(CPMLFeatureVector *a1)
{
  uint64_t v2 = objc_opt_new();
  IntVector = (uint64_t *)CPMLFeatureVector::getIntVector(a1);
  uint64_t v4 = *IntVector;
  if (IntVector[1] != *IntVector)
  {
    unint64_t v5 = 0;
    do
    {
      int v6 = (void *)[objc_alloc(NSNumber) initWithInt:*(unsigned int *)(v4 + 4 * v5)];
      [v2 addObject:v6];

      ++v5;
      uint64_t v4 = *IntVector;
    }
    while (v5 < (IntVector[1] - *IntVector) >> 2);
  }
  uint64_t RealVector = (uint64_t *)CPMLFeatureVector::getRealVector(a1);
  uint64_t v8 = *RealVector;
  if (RealVector[1] != *RealVector)
  {
    unint64_t v9 = 0;
    do
    {
      int v10 = (void *)[objc_alloc(NSNumber) initWithDouble:*(double *)(v8 + 8 * v9)];
      [v2 addObject:v10];

      ++v9;
      uint64_t v8 = *RealVector;
    }
    while (v9 < (RealVector[1] - *RealVector) >> 3);
  }

  return v2;
}

void sub_214330FB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CPMLAnalysisHandler::CPMLAnalysisHandler(CPMLAnalysisHandler *this)
{
  *(void *)this = &unk_26C50FD40;
}

uint64_t CPMLAnalysisClassify(uint64_t (***a1)(void))
{
  return (**a1)(a1);
}

uint64_t CPMLAnalysisRegressionPrediction(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void CPMLCreateLINEARSVMAnalysis()
{
}

void sub_2143310EC(_Unwind_Exception *a1)
{
  uint64_t v2 = v1;
  MEMORY[0x21669DB80](v2, 0xA1C4034F8F590);
  _Unwind_Resume(a1);
}

void CPMLLINEARSVMAnalysisHandler::CPMLLINEARSVMAnalysisHandler(CPMLLINEARSVMAnalysisHandler *this, CPMLAlgorithm *a2)
{
  CPMLAnalysisHandler::CPMLAnalysisHandler(this);
  *uint64_t v3 = &unk_26C510380;
  v3[1] = a2;
}

CPMLLINEARSVMAnalysisHandler *CPMLDestroyLINEARSVMAnalysis(CPMLLINEARSVMAnalysisHandler *result)
{
  if (result)
  {
    CPMLLINEARSVMAnalysisHandler::~CPMLLINEARSVMAnalysisHandler(result);
    JUMPOUT(0x21669DB80);
  }
  return result;
}

void CPMLLINEARSVMAnalysisHandler::~CPMLLINEARSVMAnalysisHandler(CPMLLINEARSVMAnalysisHandler *this)
{
  *(void *)this = &unk_26C510380;
  uint64_t v2 = *((void *)this + 1);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  CPModelClose(this);
}

void CPMLLINEARSVMAnalysisHandler::classify(CPMLLINEARSVMAnalysisHandler *this, int a2, double *a3)
{
}

void sub_214331308(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x1020C4087C48359);
  _Unwind_Resume(a1);
}

double CPMLLINEARSVMAnalysisHandler::regression(CPMLLINEARSVMAnalysisHandler *this, int a2, double *a3)
{
  return nan("");
}

void CPMLRemapper::CPMLRemapper(CPMLRemapper *this, sqlite3 *a2, CPMLStatistics *a3, char a4)
{
  *((unsigned char *)this + 2) = a4;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = a3;
  *(_WORD *)this = 0;
  operator new();
}

void sub_2143319F0(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x10C402FEFCB83);
  _Unwind_Resume(a1);
}

void CPMLRemapper::saveRemapper(CPMLRemapper *this)
{
  if (*(_DWORD *)(*((void *)this + 2) + 124))
  {
    unsigned int v2 = 0;
    do
    {
      errmsg = 0;
      uint64_t v3 = sqlite3_mprintf("INDEX%d ", v2);
      uint64_t v4 = sqlite3_mprintf("create TABLE %q(keyValue TEXT, indexValue INT, pKey INTEGER PRIMARY KEY);", v3);
      CPMLsql_dropTableCommand(*((sqlite3 **)this + 1), v3);
      unint64_t v5 = (CPMLLog *)sqlite3_exec(*((sqlite3 **)this + 1), v4, (int (__cdecl *)(void *, int, char **, char **))CPMLsql_callbackDBResponse, this, &errmsg);
      if (v5)
      {
        CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v5);
        CPMLLog::log(CPMLLog, CPML_LOG_ERR, "saveRemapper", "SQL error: %s \n", errmsg);
        sqlite3_free(errmsg);
      }
      if (v3) {
        sqlite3_free(v3);
      }
      if (v4) {
        sqlite3_free(v4);
      }
      ++v2;
    }
    while (v2 < *(_DWORD *)(*((void *)this + 2) + 124));
  }
}

void CPMLRemapper::~CPMLRemapper(CPMLRemapper *this)
{
  uint64_t v2 = *((void *)this + 3);
  if (v2)
  {
    uint64_t v3 = *(void **)v2;
    if (*(void *)v2)
    {
      *(void *)(v2 + 8) = v3;
      operator delete(v3);
    }
    MEMORY[0x21669DB80](v2, 0x10C402FEFCB83);
  }
  uint64_t v4 = *((void *)this + 4);
  if (v4)
  {
    unint64_t v5 = *(void **)v4;
    if (*(void *)v4)
    {
      *(void *)(v4 + 8) = v5;
      operator delete(v5);
    }
    MEMORY[0x21669DB80](v4, 0x10C402FEFCB83);
  }
}

double CPMLRemapper::normalizeColumn(CPMLRemapper *this, double result, int a3)
{
  uint64_t v3 = (void *)*((void *)this + 2);
  uint64_t v4 = *(int *)(v3[12] + 4 * a3);
  if (*(_DWORD *)(**((void **)this + 3) + 4 * v4))
  {
    double v5 = *(double *)(v3[24] + 8 * v4);
    if (v5 <= 0.0) {
      double v5 = 1.0;
    }
    return (result - *(double *)(v3[21] + 8 * v4)) / v5;
  }
  return result;
}

char *CPMLRemapper::unmap(CPMLRemapper *this, int a2, int a3)
{
  int v4 = *(_DWORD *)(*(void *)(*((void *)this + 2) + 96) + 4 * a3);
  ppStmt = 0;
  double v5 = sqlite3_mprintf("select keyValue from INDEX%d where indexValue = %d; ", v4, a2);
  int v6 = strlen(v5);
  int v7 = (CPMLLog *)sqlite3_prepare_v2(*((sqlite3 **)this + 1), v5, v6, &ppStmt, 0);
  if (v7)
  {
    int v8 = (int)v7;
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v7);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "unmap", " getKeyValueWith: DB NOT OK %d\n", v8);
  }
  int v10 = (CPMLLog *)sqlite3_step(ppStmt);
  if (v10 != 101)
  {
    int v11 = (int)v10;
    if (v10 == 100)
    {
      int v12 = (const char *)sqlite3_column_text(ppStmt, 0);
      goto LABEL_8;
    }
    int v13 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v10);
    CPMLLog::log(v13, CPML_LOG_ERR, "unmap", "getKeyValueWith: Error iterating rows %d\n", v11);
  }
  int v12 = "error";
LABEL_8:
  size_t v14 = strlen(v12) + 1;
  int v15 = (char *)malloc_type_malloc(v14, 0x100004077774924uLL);
  strlcpy(v15, v12, v14);
  sqlite3_finalize(ppStmt);
  if (v5) {
    sqlite3_free(v5);
  }
  return v15;
}

uint64_t CPMLRemapper::remap(CPMLRemapper *this, char *a2, int a3)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!*a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = *(int *)(*(void *)(*((void *)this + 2) + 96) + 4 * a3);
  ppStmt = 0;
  int v6 = sqlite3_mprintf("select indexValue from INDEX%d where keyValue='%q'; ", v5, a2);
  int v7 = strlen(v6);
  int v8 = (CPMLLog *)sqlite3_prepare_v2(*((sqlite3 **)this + 1), v6, v7, &ppStmt, 0);
  if (v8)
  {
    int v9 = (int)v8;
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v8);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "remap", "getIndexValueWith: DB NOT OK %d\n", v9);
  }
  int v11 = (CPMLLog *)sqlite3_step(ppStmt);
  if (v11 != 100)
  {
    int v12 = (int)v11;
    if (v11 != 101)
    {
      int v13 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v11);
      CPMLLog::log(v13, CPML_LOG_ERR, "remap", "getIndexValueWith: Error iterating rows %d\n", v12);
    }
    sqlite3_finalize(ppStmt);
    double v14 = -1.0;
LABEL_12:
    if (!*((unsigned char *)this + 2) || *(unsigned char *)this)
    {
      errmsg = 0;
      uint64_t v16 = sqlite3_mprintf("INDEX%d ", v5);
      uint64_t v17 = sqlite3_mprintf("insert into %q (keyValue, indexValue) VALUES('%q', %d);",
              v16,
              a2,
              *(unsigned int *)(**((void **)this + 4) + 4 * v5));
      int v18 = (CPMLLog *)sqlite3_exec(*((sqlite3 **)this + 1), v17, (int (__cdecl *)(void *, int, char **, char **))CPMLsql_callbackDBResponse, this, &errmsg);
      if (v18)
      {
        int v19 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v18);
        CPMLLog::log(v19, CPML_LOG_ERR, "remap", "SQL error: %s \n", errmsg);
        sqlite3_free(errmsg);
      }
      uint64_t v20 = **((void **)this + 4);
      int v21 = *(_DWORD *)(v20 + 4 * v5);
      *(_DWORD *)(v20 + 4 * v5) = v21 + 1;
      if (v16) {
        sqlite3_free(v16);
      }
      if (v17) {
        sqlite3_free(v17);
      }
      double v14 = (double)v21;
      goto LABEL_21;
    }
LABEL_26:
    if (*((unsigned char *)this + 1))
    {
      errmsg = 0;
      unsigned int v22 = sqlite3_mprintf("UPDATE cacheString SET keyValue='%q' WHERE indexValue=%d;", a2, (-10 - v5));
      double v23 = (CPMLLog *)sqlite3_exec(*((sqlite3 **)this + 1), v22, (int (__cdecl *)(void *, int, char **, char **))CPMLsql_callbackDBResponse, this, &errmsg);
      if (v23)
      {
        unint64_t v24 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v23);
        CPMLLog::log(v24, CPML_LOG_ERR, "remap", "SQL error: %s \n", errmsg);
        sqlite3_free(errmsg);
      }
      if (v22) {
        sqlite3_free(v22);
      }
      double v14 = (double)(-10 - (int)v5);
    }
    goto LABEL_21;
  }
  double v14 = sqlite3_column_double(ppStmt, 0);
  sqlite3_finalize(ppStmt);
  if (v14 < 0.0) {
    goto LABEL_12;
  }
  if (*((unsigned char *)this + 2) && !*(unsigned char *)this) {
    goto LABEL_26;
  }
LABEL_21:
  if (v6) {
    sqlite3_free(v6);
  }
  return (int)v14;
}

void CPMLDBSerialization::cp_createTable(CPMLDBSerialization *this, char *a2, char *a3)
{
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  if ((CPMLDBSerialization *)((char *)this + 120) == (CPMLDBSerialization *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::find<std::string>((uint64_t)this + 112, (const void **)__p))
  {
    int v8 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)this + 14, (const void **)__p, (uint64_t)&std::piecewise_construct, (long long **)&v8)+ 14) = 1;
    CPMLsql_createTable(*((sqlite3 **)this + 4), a2, a3, 0);
  }
  else if (*(_DWORD *)(std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::find<std::string>((uint64_t)this + 112, (const void **)__p)+ 56) != 1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "%s Corrupted match.\n", "cp_createTable");
  }
  if (v7 < 0) {
    operator delete(__p[0]);
  }
}

void sub_214332108(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CPMLDBSerialization::cp_insertIntoTable(sqlite3 **this, char *a2, char *a3, char *a4)
{
  return CPMLsql_insertIntoTable(this[4], a2, a3, a4);
}

uint64_t CPMLDBSerialization::cp_write(sqlite3 **this, int *a2, char *a3, unint64_t a4, char *a5)
{
  errmsg = 0;
  if (a5) {
    int v9 = a5;
  }
  else {
    int v9 = a3;
  }
  std::string::basic_string[abi:ne180100]<0>(&v21, v9);
  std::string::basic_string[abi:ne180100]<0>(__p, " INTEGER");
  if ((v20 & 0x80u) == 0) {
    int v10 = __p;
  }
  else {
    int v10 = (void **)__p[0];
  }
  if ((v20 & 0x80u) == 0) {
    std::string::size_type v11 = v20;
  }
  else {
    std::string::size_type v11 = (std::string::size_type)__p[1];
  }
  std::string::append(&v21, (const std::string::value_type *)v10, v11);
  if ((char)v20 < 0) {
    operator delete(__p[0]);
  }
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v12 = &v21;
  }
  else {
    int v12 = (std::string *)v21.__r_.__value_.__r.__words[0];
  }
  (*((void (**)(sqlite3 **, char *, std::string *))*this + 33))(this, a3, v12);
  if (a4)
  {
    uint64_t v13 = 0;
    int v14 = 1;
    while (1)
    {
      int v15 = sqlite3_mprintf("insert into %q (%q) VALUES(%d);", a3, v9, a2[v13]);
      uint64_t v16 = (CPMLLog *)sqlite3_exec(this[4], v15, (int (__cdecl *)(void *, int, char **, char **))callbackDBResponse2, this, &errmsg);
      if (v16) {
        break;
      }
      if (v15) {
        sqlite3_free(v15);
      }
      int v14 = ++v13 < a4;
      if (a4 == v13) {
        goto LABEL_21;
      }
    }
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v16);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_write", "cp_writeDefault: SQL error: %s \n", errmsg);
    sqlite3_free(errmsg);
    if (v15) {
      sqlite3_free(v15);
    }
  }
  else
  {
LABEL_21:
    int v14 = 0;
  }
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v21.__r_.__value_.__l.__data_);
  }
  return (v14 << 31 >> 31);
}

void sub_2143322FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t callbackDBResponse2(CPMLLog *a1, int a2, char **a3, char **a4)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(a1);
  CPMLLog::log(CPMLLog, CPML_LOG_DEBUG, "callbackDBResponse2", "CB response2");
  return 0;
}

uint64_t CPMLDBSerialization::cp_write(sqlite3 **this, unsigned int *a2, char *a3, unint64_t a4, char *a5)
{
  errmsg = 0;
  if (a5) {
    int v9 = a5;
  }
  else {
    int v9 = a3;
  }
  std::string::basic_string[abi:ne180100]<0>(&v21, v9);
  std::string::basic_string[abi:ne180100]<0>(__p, " INTEGER");
  if ((v20 & 0x80u) == 0) {
    int v10 = __p;
  }
  else {
    int v10 = (void **)__p[0];
  }
  if ((v20 & 0x80u) == 0) {
    std::string::size_type v11 = v20;
  }
  else {
    std::string::size_type v11 = (std::string::size_type)__p[1];
  }
  std::string::append(&v21, (const std::string::value_type *)v10, v11);
  if ((char)v20 < 0) {
    operator delete(__p[0]);
  }
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v12 = &v21;
  }
  else {
    int v12 = (std::string *)v21.__r_.__value_.__r.__words[0];
  }
  (*((void (**)(sqlite3 **, char *, std::string *))*this + 33))(this, a3, v12);
  if (a4)
  {
    uint64_t v13 = 0;
    int v14 = 1;
    while (1)
    {
      int v15 = sqlite3_mprintf("insert into %q (%q) VALUES(%u);", a3, v9, a2[v13]);
      uint64_t v16 = (CPMLLog *)sqlite3_exec(this[4], v15, (int (__cdecl *)(void *, int, char **, char **))callbackDBResponse2, this, &errmsg);
      if (v16) {
        break;
      }
      if (v15) {
        sqlite3_free(v15);
      }
      int v14 = ++v13 < a4;
      if (a4 == v13) {
        goto LABEL_21;
      }
    }
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v16);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_write", "cp_serialize_uintDefault: SQL error: %s \n", errmsg);
    sqlite3_free(errmsg);
    if (v15) {
      sqlite3_free(v15);
    }
  }
  else
  {
LABEL_21:
    int v14 = 0;
  }
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v21.__r_.__value_.__l.__data_);
  }
  return (v14 << 31 >> 31);
}

void sub_214332544(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CPMLDBSerialization::cp_write(sqlite3 **this, unint64_t *a2, char *a3, unint64_t a4, char *a5)
{
  errmsg = 0;
  if (a5) {
    int v9 = a5;
  }
  else {
    int v9 = a3;
  }
  std::string::basic_string[abi:ne180100]<0>(&v21, v9);
  std::string::basic_string[abi:ne180100]<0>(__p, " INTEGER");
  if ((v20 & 0x80u) == 0) {
    int v10 = __p;
  }
  else {
    int v10 = (void **)__p[0];
  }
  if ((v20 & 0x80u) == 0) {
    std::string::size_type v11 = v20;
  }
  else {
    std::string::size_type v11 = (std::string::size_type)__p[1];
  }
  std::string::append(&v21, (const std::string::value_type *)v10, v11);
  if ((char)v20 < 0) {
    operator delete(__p[0]);
  }
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v12 = &v21;
  }
  else {
    int v12 = (std::string *)v21.__r_.__value_.__r.__words[0];
  }
  (*((void (**)(sqlite3 **, char *, std::string *))*this + 33))(this, a3, v12);
  if (a4)
  {
    uint64_t v13 = 0;
    int v14 = 1;
    while (1)
    {
      int v15 = sqlite3_mprintf("insert into %q (%q) VALUES(%llu);", a3, v9, a2[v13]);
      uint64_t v16 = (CPMLLog *)sqlite3_exec(this[4], v15, (int (__cdecl *)(void *, int, char **, char **))callbackDBResponse2, this, &errmsg);
      if (v16) {
        break;
      }
      if (v15) {
        sqlite3_free(v15);
      }
      int v14 = ++v13 < a4;
      if (a4 == v13) {
        goto LABEL_21;
      }
    }
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v16);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_write", "cp_serialize_uint64_tDefault: SQL error: %s \n", errmsg);
    sqlite3_free(errmsg);
    if (v15) {
      sqlite3_free(v15);
    }
  }
  else
  {
LABEL_21:
    int v14 = 0;
  }
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v21.__r_.__value_.__l.__data_);
  }
  return (v14 << 31 >> 31);
}

void sub_214332750(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CPMLDBSerialization::cp_write(sqlite3 **this, float *a2, char *a3, unint64_t a4, char *a5)
{
  errmsg = 0;
  if (a5) {
    int v9 = a5;
  }
  else {
    int v9 = a3;
  }
  std::string::basic_string[abi:ne180100]<0>(&v23, v9);
  std::string::basic_string[abi:ne180100]<0>(__p, " REAL");
  if ((v22 & 0x80u) == 0) {
    int v10 = __p;
  }
  else {
    int v10 = (void **)__p[0];
  }
  if ((v22 & 0x80u) == 0) {
    std::string::size_type v11 = v22;
  }
  else {
    std::string::size_type v11 = (std::string::size_type)__p[1];
  }
  std::string::append(&v23, (const std::string::value_type *)v10, v11);
  if ((char)v22 < 0) {
    operator delete(__p[0]);
  }
  if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v12 = &v23;
  }
  else {
    int v12 = (std::string *)v23.__r_.__value_.__r.__words[0];
  }
  (*((void (**)(sqlite3 **, char *, std::string *))*this + 33))(this, a3, v12);
  if (a4)
  {
    uint64_t v13 = 0;
    int v14 = 1;
    while (1)
    {
      float v15 = a2[v13];
      uint64_t v16 = fabsf(v15) == INFINITY
          ? sqlite3_mprintf("insert into %q (%q) VALUES(NULL);", a3, v9)
          : sqlite3_mprintf("insert into %q (%q) VALUES(%f);", a3, v9, v15);
      uint64_t v17 = (char *)v16;
      int v18 = (CPMLLog *)sqlite3_exec(this[4], v16, (int (__cdecl *)(void *, int, char **, char **))callbackDBResponse2, this, &errmsg);
      if (v18) {
        break;
      }
      if (v17) {
        sqlite3_free(v17);
      }
      int v14 = ++v13 < a4;
      if (a4 == v13) {
        goto LABEL_24;
      }
    }
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v18);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_write", "cp_writeDefault: SQL error: %s \n", errmsg);
    sqlite3_free(errmsg);
    if (v17) {
      sqlite3_free(v17);
    }
  }
  else
  {
LABEL_24:
    int v14 = 0;
  }
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v23.__r_.__value_.__l.__data_);
  }
  return (v14 << 31 >> 31);
}

void sub_21433298C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CPMLDBSerialization::cp_write(sqlite3 **this, double *a2, char *a3, unint64_t a4, char *a5)
{
  errmsg = 0;
  if (a5) {
    int v9 = a5;
  }
  else {
    int v9 = a3;
  }
  std::string::basic_string[abi:ne180100]<0>(&v22, v9);
  std::string::basic_string[abi:ne180100]<0>(__p, " REAL");
  if ((v21 & 0x80u) == 0) {
    int v10 = __p;
  }
  else {
    int v10 = (void **)__p[0];
  }
  if ((v21 & 0x80u) == 0) {
    std::string::size_type v11 = v21;
  }
  else {
    std::string::size_type v11 = (std::string::size_type)__p[1];
  }
  std::string::append(&v22, (const std::string::value_type *)v10, v11);
  if ((char)v21 < 0) {
    operator delete(__p[0]);
  }
  if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v12 = &v22;
  }
  else {
    int v12 = (std::string *)v22.__r_.__value_.__r.__words[0];
  }
  (*((void (**)(sqlite3 **, char *, std::string *))*this + 33))(this, a3, v12);
  if (a4)
  {
    uint64_t v13 = 0;
    int v14 = 1;
    while (1)
    {
      float v15 = fabs(a2[v13]) == INFINITY
          ? sqlite3_mprintf("insert into %q (%q) VALUES(NULL);", a3, v9)
          : sqlite3_mprintf("insert into %q (%q) VALUES(%lf);", a3, v9, *(void *)&a2[v13]);
      uint64_t v16 = (char *)v15;
      uint64_t v17 = (CPMLLog *)sqlite3_exec(this[4], v15, (int (__cdecl *)(void *, int, char **, char **))callbackDBResponse2, this, &errmsg);
      if (v17) {
        break;
      }
      if (v16) {
        sqlite3_free(v16);
      }
      int v14 = ++v13 < a4;
      if (a4 == v13) {
        goto LABEL_24;
      }
    }
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v17);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_write", "cp_writeDefault: SQL error: %s \n", errmsg);
    sqlite3_free(errmsg);
    if (v16) {
      sqlite3_free(v16);
    }
  }
  else
  {
LABEL_24:
    int v14 = 0;
  }
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  return (v14 << 31 >> 31);
}

void sub_214332BC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CPMLDBSerialization::cp_write(sqlite3 **this, char *a2, const char *a3, uint64_t a4, const char *a5)
{
  errmsg[1] = *(char **)MEMORY[0x263EF8340];
  errmsg[0] = 0;
  size_t v8 = a4 + 1;
  MEMORY[0x270FA5388](this, a2);
  int v12 = (char *)v22 - ((v11 + 16) & 0xFFFFFFFFFFFFFFF0);
  if (v10) {
    uint64_t v13 = v10;
  }
  else {
    uint64_t v13 = v9;
  }
  std::string::basic_string[abi:ne180100]<0>(&v24, v13);
  std::string::basic_string[abi:ne180100]<0>(v22, " TEXT");
  if ((v23 & 0x80u) == 0) {
    int v14 = (const std::string::value_type *)v22;
  }
  else {
    int v14 = (const std::string::value_type *)v22[0];
  }
  if ((v23 & 0x80u) == 0) {
    std::string::size_type v15 = v23;
  }
  else {
    std::string::size_type v15 = (std::string::size_type)v22[1];
  }
  std::string::append(&v24, v14, v15);
  if ((char)v23 < 0) {
    operator delete(v22[0]);
  }
  if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v16 = &v24;
  }
  else {
    uint64_t v16 = (std::string *)v24.__r_.__value_.__r.__words[0];
  }
  (*((void (**)(sqlite3 **, const char *, std::string *))*this + 33))(this, a3, v16);
  strlcpy(v12, a2, v8);
  uint64_t v17 = sqlite3_mprintf("insert into %q (%q) VALUES('%q');", a3, v13, v12);
  int v18 = (CPMLLog *)sqlite3_exec(this[4], v17, (int (__cdecl *)(void *, int, char **, char **))callbackDBResponse2, this, errmsg);
  if (v18)
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v18);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_write", "cp_writeDefault: SQL error: %s \n", errmsg[0]);
    sqlite3_free(errmsg[0]);
    if (v17) {
      sqlite3_free(v17);
    }
    uint64_t v20 = 0xFFFFFFFFLL;
  }
  else
  {
    if (v17) {
      sqlite3_free(v17);
    }
    uint64_t v20 = 0;
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  return v20;
}

void sub_214332E1C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 - 105) < 0) {
    operator delete(*(void **)(v1 - 128));
  }
  if (*(char *)(v1 - 81) < 0) {
    operator delete(*(void **)(v1 - 104));
  }
  _Unwind_Resume(exception_object);
}

uint64_t CPMLDBSerialization::cp_doSerialization(CPMLDBSerialization *this)
{
  return 0;
}

uint64_t CPMLDBSerialization::reset(CPMLDBSerialization *this)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(this);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "reset", "%s unimplmented function.", "reset");
  return 0xFFFFFFFFLL;
}

uint64_t std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::find<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a1 + 8;
  do
  {
    BOOL v7 = std::less<std::string>::operator()[abi:ne180100](v5, (const void **)(v3 + 32), a2);
    size_t v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      size_t v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || std::less<std::string>::operator()[abi:ne180100](v5, a2, (const void **)(v6 + 32))) {
    return v2;
  }
  return v6;
}

void sub_214333C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _Unwind_Exception *exception_object)
{
  MEMORY[0x21669DB80](v16, 0x10A1C405A95AE37);

  _Unwind_Resume(a1);
}

void sub_214334010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2143340A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2143342FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2143343B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214334488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214334624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214334810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_214334900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_214334CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_214335260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21433577C(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x10B1C4066637EEELL);
  _Unwind_Resume(a1);
}

void sub_214335A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_214335C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  MEMORY[0x21669DB80](v19, 0x1090C40B6130435);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v20 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_214335CF4(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x20C40A759441BLL);
  _Unwind_Resume(a1);
}

void sub_214336168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  MEMORY[0x21669DB80](v10, 0x10A1C4021AD9D2ELL);

  _Unwind_Resume(a1);
}

void sub_214336288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  MEMORY[0x21669DB80](v10, 0x80C40803F642BLL);

  _Unwind_Resume(a1);
}

void CPMLOnlineSvm::CPMLOnlineSvm(CPMLOnlineSvm *this, CPMLSerialization *a2, CPMLTunableData *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, a2, a3);
  *(void *)uint64_t v5 = &unk_26C50FA68;
  *(_OWORD *)(v5 + 96) = 0u;
  *(_OWORD *)(v5 + 112) = 0u;
  *(_OWORD *)(v5 + 128) = 0u;
  *(_DWORD *)(v5 + 144) = 1;
  *(_DWORD *)(v5 + 152) = 2;
  *(_OWORD *)(v5 + 16(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = xmmword_214353E20;
  *(void *)(v5 + 176) = 0x186A000000001;
  *(_OWORD *)(v5 + 184) = xmmword_214353E30;
  *(_OWORD *)(v5 + 20(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = xmmword_214353E40;
  *(_OWORD *)(v5 + 232) = 0u;
  uint64_t v6 = (void *)(v5 + 312);
  BOOL v7 = (uint64_t *)(v5 + 336);
  *(_OWORD *)(v5 + 248) = 0u;
  *(void *)(v5 + 296) = 0;
  *(_OWORD *)(v5 + 264) = 0u;
  *(_OWORD *)(v5 + 28(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = 0u;
  *(_OWORD *)(v5 + 312) = 0u;
  *(_OWORD *)(v5 + 328) = 0u;
  *(_OWORD *)(v5 + 344) = 0u;
  *(_OWORD *)(v5 + 36(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = 0u;
  *(_OWORD *)(v5 + 376) = 0u;
  *(_OWORD *)(v5 + 392) = 0u;
  *(void *)(v5 + 448) = 0;
  *(_OWORD *)(v5 + 416) = 0u;
  *(_OWORD *)(v5 + 432) = 0u;
  *(_OWORD *)(v5 + 488) = 0u;
  *(_OWORD *)(v5 + 504) = 0u;
  *(_OWORD *)(v5 + 472) = 0u;
  (*((void (**)(CPMLSerialization *, uint64_t, const char *, uint64_t, void))a2->var0 + 13))(a2, v5 + 8, "version", 5, 0);
  uint64_t v13 = 0;
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 8))(a2, (char *)&v13 + 4, "num_feature", 1, 0);
  (*((void (**)(CPMLSerialization *, uint64_t *, const char *, uint64_t, void))a2->var0 + 8))(a2, &v13, "num_sv", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 12))(a2, (char *)this + 304, "bias_", 1, 0);
  std::vector<double>::resize((uint64_t)v6, (int)v13);
  (*((void (**)(CPMLSerialization *, void, const char *, void, void))a2->var0 + 12))(a2, *v6, "alphas_", (int)v13, 0);
  std::vector<std::valarray<double>>::resize(v7, (int)v13);
  if ((int)v13 >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      std::valarray<double>::resize(*v7 + v8, SHIDWORD(v13), 0.0);
      ++v9;
      v8 += 16;
    }
    while (v9 < (int)v13);
    if ((int)v13 >= 1)
    {
      uint64_t v10 = 0;
      do
      {
        sprintf(v14, "support_vectors_%d", v10);
        if (SHIDWORD(v13) >= 1)
        {
          uint64_t v11 = 0;
          uint64_t v12 = 0;
          do
          {
            (*((void (**)(CPMLSerialization *, uint64_t, char *, uint64_t, uint64_t))a2->var0 + 12))(a2, *(void *)(*v7 + 16 * v10) + v11, v14, 1, v12++);
            v11 += 8;
          }
          while (v12 < SHIDWORD(v13));
        }
        ++v10;
      }
      while (v10 < (int)v13);
    }
  }
  *((_DWORD *)this + 38) = 0;
  *((_OWORD *)this + 1(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = xmmword_214353E20;
}

void sub_2143366F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void **a14)
{
  std::valarray<double>::~valarray(v14 + 504);
  std::valarray<double>::~valarray(v14 + 488);
  std::valarray<double>::~valarray(v16);
  uint64_t v19 = *(void **)(v14 + 432);
  if (v19)
  {
    *(void *)(v14 + 44(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = v19;
    operator delete(v19);
  }
  std::valarray<double>::~valarray(v14 + 416);
  uint64_t v20 = *(void **)(v14 + 384);
  if (v20)
  {
    *(void *)(v14 + 392) = v20;
    operator delete(v20);
  }
  unsigned __int8 v21 = *(void **)(v14 + 360);
  if (v21)
  {
    *(void *)(v14 + 368) = v21;
    operator delete(v21);
  }
  std::vector<std::valarray<double>>::__destroy_vector::operator()[abi:ne180100](&a14);
  std::string v22 = *v15;
  if (*v15)
  {
    *(void *)(v14 + 32(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = v22;
    operator delete(v22);
  }
  a14 = (void **)(v14 + 280);
  std::vector<std::valarray<char>>::__destroy_vector::operator()[abi:ne180100](&a14);
  a14 = (void **)(v14 + 256);
  std::vector<std::valarray<double>>::__destroy_vector::operator()[abi:ne180100](&a14);
  unsigned __int8 v23 = *v17;
  if (*v17)
  {
    *(void *)(v14 + 24(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = v23;
    operator delete(v23);
  }
  if (*(void *)(v14 + 136))
  {
    if (*a10) {
      MEMORY[0x21669DB60](*a10, 0x1000C8000313F17);
    }
  }
  CPModelClose((void *)v14);
  _Unwind_Resume(a1);
}

void std::vector<std::valarray<double>>::resize(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = (v3 - *a1) >> 4;
  if (a2 <= v4)
  {
    if (a2 < v4)
    {
      uint64_t v6 = *a1 + 16 * a2;
      while (v3 != v6)
      {
        v3 -= 16;
        std::allocator<std::valarray<double>>::destroy[abi:ne180100]((uint64_t)(a1 + 2), v3);
      }
      a1[1] = v6;
    }
  }
  else
  {
    unint64_t v5 = a2 - v4;
    std::vector<std::valarray<double>>::__append(a1, v5);
  }
}

void std::vector<std::valarray<double>>::__append(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (a2 <= (v6 - v7) >> 4)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 16 * a2);
      v7 += 16 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - *a1;
    unint64_t v9 = a2 + (v8 >> 4);
    if (v9 >> 60) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = v5 - *a1;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    uint64_t v18 = v4;
    if (v12) {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::valarray<char>>>(v4, v12);
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = v13;
    uint64_t v15 = &v13[16 * v10];
    uint64_t v17 = &v13[16 * v12];
    bzero(v15, 16 * a2);
    uint64_t v16 = &v15[16 * a2];
    std::vector<std::valarray<double>>::__swap_out_circular_buffer(a1, &v14);
    std::__split_buffer<std::valarray<double>>::~__split_buffer(&v14);
  }
}

void sub_21433696C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::valarray<double>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void CPLinearRegressionClassfier::CPLinearRegressionClassfier(CPLinearRegressionClassfier *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, a2, a3, a4);
  *(void *)uint64_t v5 = &unk_26C510290;
  *(_DWORD *)(v5 + 104) = *((_DWORD *)a2->var0 + 31) - 1;
  *(_DWORD *)(v5 + 96) = 1;
  CPMLCDB::getIterator();
}

void sub_214336A00(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

pthread_mutex_t *CPLinearRegressionClassfier::initializeLinearRegressionMemory(CPLinearRegressionClassfier *this)
{
  int v2 = *((_DWORD *)this + 24);
  int v3 = *((_DWORD *)this + 26);
  if (v2 < 2)
  {
    int v15 = v3 + 1;
    *((_DWORD *)this + 25) = v15;
    *((void *)this + 15) = 0;
LABEL_11:
    *((void *)this + 14) = malloc_type_calloc(v15, 8uLL, 0x100004000313F17uLL);
    uint64_t result = (pthread_mutex_t *)malloc_type_calloc(*((int *)this + 25), 8uLL, 0x100004000313F17uLL);
    *((void *)this + 16) = result;
    return result;
  }
  int v4 = 0;
  int v5 = 0;
  double v6 = (double)v3;
  int v7 = v2 - 1;
  int v8 = v3 + 2;
  do
  {
    double v9 = lgamma((double)(v8 + v4));
    long double v10 = v9 - lgamma((double)(v4 + 3));
    long double v11 = lgamma(v6);
    v5 += (int)(exp(v10 - v11) + 0.5);
    ++v4;
  }
  while (v7 != v4);
  int v12 = *((_DWORD *)this + 26);
  *((_DWORD *)this + 25) = v5 + v12 + 1;
  uint64_t v13 = (uint64_t)malloc_type_calloc(v12 * v5, 4uLL, 0x100004052888210uLL);
  *((void *)this + 15) = v13;
  if (*((int *)this + 24) >= 2)
  {
    uint64_t v16 = (int *)v13;
    int v14 = 0;
    uint64_t v17 = *((unsigned int *)this + 26);
    int v18 = 1;
    do
    {
      uint64_t v13 = fillDegrees(v16, v17, v17, ++v18);
      uint64_t v17 = *((unsigned int *)this + 26);
      v16 += (int)v17 * (int)v13;
      v14 += v13;
    }
    while (v18 < *((_DWORD *)this + 24));
  }
  else
  {
    int v14 = 0;
  }
  if (v14 == v5)
  {
    int v15 = *((_DWORD *)this + 25);
    goto LABEL_11;
  }
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)v13);
  int v21 = CPML_LOG_ERR;

  return CPMLLog::log(CPMLLog, v21, "initializeLinearRegressionMemory", "PROGRAMMING ERROR. Computation of degree two coefficients has mismatch. Expect a crash.");
}

void CPLinearRegressionClassfier::CPLinearRegressionClassfier(CPLinearRegressionClassfier *this, CPMLSerialization *a2, CPMLTunableData *a3)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, a2, a3);
  *int v5 = &unk_26C510290;
  (*((void (**)(CPMLSerialization *, void *, const char *, uint64_t, void))a2->var0 + 8))(a2, v5 + 12, "maxDegree", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 8))(a2, (char *)this + 104, "numberInputFeatures", 1, 0);
  CPLinearRegressionClassfier::initializeLinearRegressionMemory(this);
  (*((void (**)(CPMLSerialization *, void, const char *, void, void))a2->var0 + 12))(a2, *((void *)this + 14), "coefficients", *((int *)this + 25), 0);
}

void sub_214336D08(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPLinearRegressionClassfier::~CPLinearRegressionClassfier(void **this)
{
  *this = &unk_26C510290;
  free(this[14]);
  free(this[16]);
  int v2 = this[15];
  if (v2) {
    free(v2);
  }

  CPModelClose(this);
}

{
  uint64_t vars8;

  CPLinearRegressionClassfier::~CPLinearRegressionClassfier(this);

  JUMPOUT(0x21669DB80);
}

uint64_t CPLinearRegressionClassfier::serialize(CPLinearRegressionClassfier *this)
{
  return 0;
}

uint64_t CPLinearRegressionClassfier::train(CPLinearRegressionClassfier *this)
{
  uint64_t v2 = *((unsigned int *)this + 25);
  int v35 = *((_DWORD *)this + 26);
  int v3 = *(_DWORD *)(**((void **)this + 6) + 120);
  int v4 = (long double *)malloc_type_calloc(v3 * (int)v2, 8uLL, 0x100004000313F17uLL);
  uint64_t v33 = malloc_type_calloc(v3, 8uLL, 0x100004000313F17uLL);
  int v5 = (char *)*((void *)this + 14);
  bzero(v5, 8 * (int)v2);
  int v6 = *((_DWORD *)this + 25);
  uint64_t v7 = (*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
  uint64_t v8 = 8 * (int)v2;
  if (v7)
  {
    double v9 = (CPMLFeatureVector *)v7;
    int v34 = v6 + ~v35;
    long double v10 = v4;
    do
    {
      uint64_t RealVector = (uint64_t *)CPMLFeatureVector::getRealVector(v9);
      *long double v10 = 1.0;
      uint64_t v12 = *RealVector;
      uint64_t v13 = RealVector[1];
      uint64_t v14 = v13 - *RealVector;
      if (v13 != *RealVector)
      {
        uint64_t v15 = 0;
        unint64_t v16 = v14 >> 3;
        if (v16 <= 1) {
          unint64_t v16 = 1;
        }
        do
        {
          v10[v15 + 1] = *(long double *)(v12 + 8 * v15);
          ++v15;
        }
        while (v16 != v15);
      }
      expandVector(*((int **)this + 15), v35, v34, v10 + 1, &v10[v35 + 1]);
      if ((int)v2 >= 1)
      {
        for (uint64_t i = 0; i != v2; ++i)
        {
          double v18 = v10[i];
          *(double *)&v5[i * 8] = *(double *)&v5[i * 8] + v18 * CPMLFeatureVector::getYHat(v9);
        }
      }
      long double v10 = (long double *)((char *)v10 + v8);
      double v9 = (CPMLFeatureVector *)(*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
    }
    while (v9);
  }
  uint64_t v19 = (__CLPK_doublereal *)malloc_type_calloc((v2 * v2), 8uLL, 0x100004000313F17uLL);
  uint64_t v20 = v19;
  if ((int)v2 >= 1)
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    unsigned __int8 v23 = v19;
    do
    {
      uint64_t v24 = v21 * 8;
      uint64_t v25 = v22;
      do
      {
        double v26 = 0.0;
        if (v3 >= 1)
        {
          int v27 = v3;
          double v28 = v4;
          do
          {
            double v26 = v26 + v28[v21] * *(long double *)((char *)v28 + v24);
            double v28 = (long double *)((char *)v28 + v8);
            --v27;
          }
          while (v27);
        }
        *v23++ = v26;
        ++v25;
        v24 += 8;
      }
      while ((int)v2 > (int)v25);
      ++v22;
      ++v21;
    }
    while (v22 != v2);
  }
  __CLPK_integer __info = 0;
  __CLPK_integer __ldb = v2;
  __CLPK_integer __nrhs = 1;
  uint64_t v29 = (CPMLLog *)dppsv_("L", &__ldb, &__nrhs, v19, (__CLPK_doublereal *)v5, &__ldb, &__info);
  if (__info)
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v29);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "train", "Linear regression training failed.");
    uint64_t v31 = __info;
  }
  else
  {
    uint64_t v31 = 0;
  }
  free(v4);
  free(v33);
  free(v20);
  return v31;
}

void expandVector(int *a1, int a2, int a3, long double *a4, double *a5)
{
  if (a3 >= 1)
  {
    int v9 = 0;
    uint64_t v10 = 4 * (a2 - 1) + 4;
    uint64_t v11 = a2;
    do
    {
      double v12 = 1.0;
      if (a2 >= 1)
      {
        uint64_t v13 = v11;
        uint64_t v14 = a4;
        uint64_t v15 = a1;
        do
        {
          if (*v15) {
            double v12 = v12 * pow(*v14, (double)*v15);
          }
          ++v15;
          ++v14;
          --v13;
        }
        while (v13);
        a1 = (int *)((char *)a1 + v10);
      }
      *a5++ = v12;
      ++v9;
    }
    while (v9 != a3);
  }
}

uint64_t CPLinearRegressionClassfier::eval(uint64_t a1, CPMLFeatureVector *this)
{
  uint64_t v4 = *(unsigned int *)(a1 + 100);
  uint64_t v5 = *(int *)(a1 + 104);
  IntVector = (void *)CPMLFeatureVector::getIntVector(this);
  uint64_t RealVector = (CPMLLog *)CPMLFeatureVector::getRealVector(this);
  if (IntVector[1] == *IntVector)
  {
    uint64_t v10 = *(uint64_t **)RealVector;
    if (v5 == (uint64_t)(*((void *)RealVector + 1) - *(void *)RealVector) >> 3)
    {
      uint64_t v11 = *(void *)(a1 + 128);
      if ((int)v5 >= 1)
      {
        uint64_t v12 = v5;
        uint64_t v13 = (void *)(v11 + 8);
        do
        {
          uint64_t v14 = *v10++;
          *v13++ = v14;
          --v12;
        }
        while (v12);
      }
      *(void *)uint64_t v11 = 0x3FF0000000000000;
      expandVector(*(int **)(a1 + 120), v5, v4 + ~v5, (long double *)(v11 + 8), (double *)(v11 + 8 * ((int)v5 + 1)));
      if ((int)v4 < 1)
      {
        double v16 = 0.0;
      }
      else
      {
        uint64_t v15 = *(double **)(a1 + 112);
        double v16 = 0.0;
        do
        {
          double v17 = *v15++;
          double v18 = v17;
          double v19 = *(double *)v11;
          v11 += 8;
          double v16 = v16 + v18 * v19;
          --v4;
        }
        while (v4);
      }
      CPMLFeatureVector::setYHat((uint64_t)this, v16);
      return 0;
    }
    else
    {
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(RealVector);
      CPMLLog::log(CPMLLog, CPML_LOG_ERR, "eval", "Feature count mismatch with training data in Linear Regression");
      return 2;
    }
  }
  else
  {
    uint64_t v8 = (pthread_mutex_t *)CPMLLog::getCPMLLog(RealVector);
    CPMLLog::log(v8, CPML_LOG_ERR, "eval", "Feature vector in Linear Regression predict should not have integer features.");
    return 1;
  }
}

uint64_t CPLinearRegressionClassfier::errorString(CPLinearRegressionClassfier *this)
{
  return 0;
}

uint64_t fillDegrees(int *a1, int a2, uint64_t a3, int a4)
{
  uint64_t v4 = a3;
  if (a3)
  {
    int v6 = a1;
    int v7 = a3 - 1;
    if (a3 == 1)
    {
      *a1 = a4;
    }
    else if (a4 < 0)
    {
      return 0;
    }
    else
    {
      int v9 = 0;
      LODWORD(v4) = 0;
      uint64_t v10 = 4 * a2;
      do
      {
        int v11 = fillDegrees(v6 + 1, a2, v7, a4 - v9);
        int v12 = v11;
        if (v11 >= 1)
        {
          do
          {
            int *v6 = v9;
            int v6 = (int *)((char *)v6 + v10);
            --v12;
          }
          while (v12);
        }
        uint64_t v4 = (v11 + v4);
      }
      while (a4 != v9++);
    }
  }
  return v4;
}

uint64_t CPLinearRegressionClassfier::requireRealOnly(CPLinearRegressionClassfier *this)
{
  return 1;
}

void CPMLNaiveBayesClassifierBase::CPMLNaiveBayesClassifierBase(CPMLNaiveBayesClassifierBase *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, a2, a3, a4);
  *(void *)uint64_t v5 = &unk_26C5103A0;
  *(_OWORD *)(v5 + 12(*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 14), "coefficients", *((int *)this + 25), 0) = 0u;
  *(_OWORD *)(v5 + 168) = 0u;
  *(_OWORD *)(v5 + 136) = 0u;
  *(_OWORD *)(v5 + 152) = 0u;
  *(_OWORD *)(v5 + 184) = 0u;
  *(_DWORD *)(v5 + 20(*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 14), "coefficients", *((int *)this + 25), 0) = 1065353216;
  *(_OWORD *)(v5 + 208) = 0u;
  *(_OWORD *)(v5 + 224) = 0u;
  *(_OWORD *)(v5 + 248) = 0u;
  *(_DWORD *)(v5 + 24(*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 14), "coefficients", *((int *)this + 25), 0) = 1065353216;
  *(_OWORD *)(v5 + 264) = 0u;
  *(_DWORD *)(v5 + 28(*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 14), "coefficients", *((int *)this + 25), 0) = 1065353216;
  *(_OWORD *)(v5 + 288) = 0u;
  *(_OWORD *)(v5 + 304) = 0u;
  *(_DWORD *)(v5 + 32(*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 14), "coefficients", *((int *)this + 25), 0) = 1065353216;
  *(_OWORD *)(v5 + 328) = 0u;
  *(_OWORD *)(v5 + 344) = 0u;
  *(_DWORD *)(v5 + 36(*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 14), "coefficients", *((int *)this + 25), 0) = 1065353216;
  *(_OWORD *)(v5 + 368) = 0u;
  *(_OWORD *)(v5 + 384) = 0u;
  *(_DWORD *)(v5 + 40(*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 14), "coefficients", *((int *)this + 25), 0) = 1065353216;
  *(_OWORD *)(v5 + 576) = 0u;
  strcpy((char *)(v5 + 8), "2.0.0");
  *(void *)(v5 + 112) = 0;
  var0 = a2->var0;
  *(void *)(v5 + 96) = *((int *)a2->var0 + 31);
  *(void *)(v5 + 104) = *((int *)var0 + 33);
  CPMLCDB::getIterator();
}

void sub_214337800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)(v12 + 46));
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table(v15);
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)(v12 + 36));
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table(v14);
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table(v13);
  std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>>>::~__hash_table(a11);
  double v17 = (void *)v12[18];
  if (v17)
  {
    v12[19] = v17;
    operator delete(v17);
  }
  double v18 = *a12;
  if (*a12)
  {
    v12[16] = v18;
    operator delete(v18);
  }
  CPModelClose(v12);
  _Unwind_Resume(a1);
}

void CPMLNaiveBayesClassifierBase::setTunableData(CPMLNaiveBayesClassifierBase *this, CPMLTunableData *a2)
{
  uint64_t v4 = (_OWORD *)((char *)this + 552);
  if ((int)CPMLTunableData::getNumberOfItems(a2) < 2)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *((_OWORD *)this + 33) = _Q0;
    *((_DWORD *)this + 13(*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 14), "coefficients", *((int *)this + 25), 0) = 1;
    *((void *)this + 68) = 0x3CD203AF9EE75616;
    *((_WORD *)this + 204) = 0;
    *uint64_t v4 = xmmword_214354580;
    *((void *)this + 64) = 20;
    strcpy((char *)this + 410, "defaultNBV3b");
  }
  else
  {
    CPMLTunableData::tDataGetInt(a2, "k", (int *)this + 128);
    CPMLTunableData::tDataGetInt(a2, "cacheLength", (int *)this + 138);
    CPMLTunableData::tDataGetInt(a2, "cacheAssocitivity", (int *)this + 139);
    CPMLTunableData::tDataGetDouble(a2, "decayRate", (double *)this + 66);
    CPMLTunableData::tDataGetDouble(a2, "smoothRate", (double *)this + 67);
    CPMLTunableData::tDataGetInt(a2, "smoothMode", (int *)this + 130);
    CPMLTunableData::tDataGetDouble(a2, "epsilonRate", (double *)this + 68);
    CPMLTunableData::tDataGetBool(a2, "enableLogging", (BOOL *)this + 409);
    CPMLTunableData::tDataGetString(a2, "logFilename", (char *)this + 410, 0x64uLL);
    CPMLTunableData::tDataGetBool(a2, "dataCollection", (BOOL *)this + 408);
    CPMLTunableData::tDataGetInt(a2, "nbAdatorVersion", (int *)this + 129);
    CPMLTunableData::tDataGetInt(a2, "maxAllowedUpdate", (int *)this + 140);
    uint64_t v5 = (_DWORD *)((char *)this + 564);
    CPMLTunableData::tDataGetInt(a2, "maxAllowedPredict", (int *)this + 141);
    if (!*((_DWORD *)this + 140)) {
      *((_DWORD *)this + 14(*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 14), "coefficients", *((int *)this + 25), 0) = 10;
    }
    if (!*v5) {
      *uint64_t v5 = 10;
    }
    if (!*((unsigned char *)this + 8)) {
      strcpy((char *)this + 8, "2.0.0");
    }
  }
  operator new();
}

void sub_214337C3C(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x10B1C40E26776D8);
  _Unwind_Resume(a1);
}

void CPMLNaiveBayesClassifierBase::CPMLNaiveBayesClassifierBase(CPMLNaiveBayesClassifierBase *this, CPMLStatistics *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, a3, a4);
  *(_OWORD *)(v6 + 12(*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 14), "coefficients", *((int *)this + 25), 0) = 0u;
  *(_OWORD *)(v6 + 168) = 0u;
  *(void *)uint64_t v6 = &unk_26C5103A0;
  *(_OWORD *)(v6 + 136) = 0u;
  *(_OWORD *)(v6 + 152) = 0u;
  *(_OWORD *)(v6 + 184) = 0u;
  *(_DWORD *)(v6 + 20(*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 14), "coefficients", *((int *)this + 25), 0) = 1065353216;
  *(_OWORD *)(v6 + 208) = 0u;
  uint64_t v9 = v6 + 208;
  *(_OWORD *)(v6 + 224) = 0u;
  *(_DWORD *)(v6 + 24(*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 14), "coefficients", *((int *)this + 25), 0) = 1065353216;
  *(_OWORD *)(v6 + 248) = 0u;
  uint64_t v8 = v6 + 248;
  *(_OWORD *)(v6 + 264) = 0u;
  *(_DWORD *)(v6 + 28(*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 14), "coefficients", *((int *)this + 25), 0) = 1065353216;
  *(_OWORD *)(v6 + 288) = 0u;
  *(_OWORD *)(v6 + 304) = 0u;
  *(_DWORD *)(v6 + 32(*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 14), "coefficients", *((int *)this + 25), 0) = 1065353216;
  *(_OWORD *)(v6 + 328) = 0u;
  *(_OWORD *)(v6 + 344) = 0u;
  uint64_t v7 = v6 + 328;
  *(_DWORD *)(v6 + 36(*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 14), "coefficients", *((int *)this + 25), 0) = 1065353216;
  *(_OWORD *)(v6 + 368) = 0u;
  *(_OWORD *)(v6 + 384) = 0u;
  *(_DWORD *)(v6 + 40(*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 14), "coefficients", *((int *)this + 25), 0) = 1065353216;
  *(void *)(v6 + 96) = *((int *)a2 + 31);
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v10 = v6 + 168;
  uint64_t v11 = v6 + 120;
  CPMLNaiveBayesClassifierBase::setTunableData((CPMLNaiveBayesClassifierBase *)v6, a4);
}

void sub_214338334(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)(v2 + 46));
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table(*(void *)(v1 + 8));
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)(v2 + 36));
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table(*(void *)(v1 + 16));
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table(*(void *)(v1 + 24));
  std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>>>::~__hash_table(*(void *)(v1 + 32));
  uint64_t v4 = (void *)v2[18];
  if (v4)
  {
    v2[19] = v4;
    operator delete(v4);
  }
  uint64_t v5 = **(void ***)(v1 + 40);
  if (v5)
  {
    v2[16] = v5;
    operator delete(v5);
  }
  CPModelClose(v2);
  _Unwind_Resume(a1);
}

void CPMLNaiveBayesClassifierBase::~CPMLNaiveBayesClassifierBase(CPMLNaiveBayesClassifierBase *this)
{
  *(void *)this = &unk_26C5103A0;
  uint64_t v2 = (CPMLLogger *)*((void *)this + 71);
  if (v2)
  {
    CPMLLogger::~CPMLLogger(v2);
    MEMORY[0x21669DB80]();
  }
  int v3 = (CPMLNaiveBayes *)*((void *)this + 72);
  if (v3)
  {
    CPMLNaiveBayes::~CPMLNaiveBayes(v3);
    MEMORY[0x21669DB80]();
  }
  uint64_t v4 = (CPMLNaiveBayesAdaptor *)*((void *)this + 73);
  if (v4)
  {
    CPMLNaiveBayesAdaptor::~CPMLNaiveBayesAdaptor(v4);
    MEMORY[0x21669DB80]();
  }
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)this + 368);
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)this + 328);
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)this + 288);
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)this + 248);
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)this + 208);
  std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>>>::~__hash_table((uint64_t)this + 168);
  uint64_t v5 = (void *)*((void *)this + 18);
  if (v5)
  {
    *((void *)this + 19) = v5;
    operator delete(v5);
  }
  uint64_t v6 = (void *)*((void *)this + 15);
  if (v6)
  {
    *((void *)this + 16) = v6;
    operator delete(v6);
  }

  CPModelClose(this);
}

{
  uint64_t vars8;

  CPMLNaiveBayesClassifierBase::~CPMLNaiveBayesClassifierBase(this);

  JUMPOUT(0x21669DB80);
}

uint64_t CPMLNaiveBayesClassifierBase::serialize(CPMLNaiveBayesClassifierBase *this)
{
  return 0;
}

uint64_t CPMLNaiveBayesClassifierBase::train(CPMLNaiveBayesClassifierBase *this)
{
  v87[6] = *(_DWORD **)MEMORY[0x263EF8340];
  uint64_t v2 = (*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
  if (!v2)
  {
LABEL_27:
    CPMLNaiveBayesClassifierBase::updateMean((double *)this);
    (*(void (**)(void))(**((void **)this + 10) + 40))(*((void *)this + 10));
    uint64_t v29 = (*(uint64_t (**)(void))(**((void **)this + 10) + 32))();
    uint64_t v30 = (CPMLFeatureVector *)v29;
    if (!v29)
    {
LABEL_52:
      CPMLNaiveBayesClassifierBase::updateVariance((double *)this);
      uint64_t v63 = sqlite3_mprintf("%lf", (double)*((unint64_t *)this + 14));
      (*(void (**)(void, const char *, const char *, char *))(**((void **)this + 11) + 136))(*((void *)this + 11), "rowCountY", "rowCountY", v63);
      if (v63) {
        sqlite3_free(v63);
      }
      for (uint64_t i = (uint64_t *)*((void *)this + 48); i; uint64_t i = (uint64_t *)*i)
      {
        double v65 = sqlite3_mprintf("%d,%lf", *((_DWORD *)i + 4), (double)*((int *)i + 5));
        (*(void (**)(void, const char *, const char *, char *))(**((void **)this + 11) + 136))(*((void *)this + 11), "yCount", "yMap,yCount", v65);
        if (v65) {
          sqlite3_free(v65);
        }
      }
      for (uint64_t j = (uint64_t **)*((void *)this + 23); j; uint64_t j = (uint64_t **)*j)
      {
        v87[0] = j[2];
        std::unordered_map<int,int>::unordered_map((uint64_t)&v87[1], (uint64_t)(j + 3));
        uint64_t v67 = v87[0];
        std::unordered_map<int,int>::unordered_map((uint64_t)&__p, (uint64_t)&v87[1]);
        sprintf((char *)v86, "xcol%d", (unint64_t)v67 > 0x1F);
        for (uint64_t k = v82; k; uint64_t k = (uint64_t *)*k)
        {
          unint64_t v69 = sqlite3_mprintf("%d,%d,%lf", *((_DWORD *)k + 4), v67, (double)*((int *)k + 5));
          (*(void (**)(void, int *, const char *, char *))(**((void **)this + 11) + 136))(*((void *)this + 11), v86, "xMap,yMap,xyCount", v69);
          if (v69) {
            sqlite3_free(v69);
          }
        }
        std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)&__p);
        std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)&v87[1]);
      }
      for (m = (double *)*((void *)this + 33); m; m = *(double **)m)
      {
        unint64_t v71 = *((void *)m + 2);
        double v72 = m[3];
        strcpy((char *)v87, "xcolRealMean");
        uint64_t v73 = sqlite3_mprintf("%d,%d,%lf", v71 >> 31, v71, v72);
        (*(void (**)(void, _DWORD **, const char *, char *))(**((void **)this + 11) + 136))(*((void *)this + 11), v87, "xMap,yMap,xyCount", v73);
        if (v73) {
          sqlite3_free(v73);
        }
      }
      for (n = (double *)*((void *)this + 43); n; n = *(double **)n)
      {
        unint64_t v75 = *((void *)n + 2);
        double v76 = n[3];
        strcpy((char *)v87, "xcolRealVariance");
        uint64_t v77 = sqlite3_mprintf("%d,%d,%lf", v75 >> 31, v75, v76);
        (*(void (**)(void, _DWORD **, const char *, char *))(**((void **)this + 11) + 136))(*((void *)this + 11), v87, "xMap,yMap,xyCount", v77);
        if (v77) {
          sqlite3_free(v77);
        }
      }
      return 0;
    }
    while (1)
    {
      memset(v87, 0, 24);
      CPMLNaiveBayesClassifierBase::getResponseValues(v29, (uint64_t)v87, v30);
      YVectorVector = (void *)CPMLFeatureVector::getYVectorVector(v30);
      if (YVectorVector[1] == *YVectorVector) {
        break;
      }
      std::locale v32 = v87[0];
      uint64_t v33 = v87[1];
      unint64_t v34 = v87[1] - v87[0];
      if (v34)
      {
        if (v34 == 1)
        {
          v86[0] = 0;
          v86[0] = *v87[0];
          std::string __p = v86;
          int v35 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)this + 368, v86, (uint64_t)&std::piecewise_construct, (_DWORD **)&__p);
          ++*((_DWORD *)v35 + 5);
        }
        else
        {
          unint64_t v48 = *((int *)this + 140);
          if (v34 > v48)
          {
            int64_t v49 = (((char *)v87[1] - (char *)v87[0]) << 30) - 0x100000000;
            do
            {
              --v33;
              unint64_t v34 = v49 >> 32;
              v49 -= 0x100000000;
            }
            while (v34 > v48);
            v87[1] = v33;
          }
          if (v34)
          {
            for (iuint64_t i = 0; ii != v34; ++ii)
            {
              uint64_t v51 = 0;
              unint64_t v52 = 0;
              int v53 = 0;
              int v54 = v87[0][ii];
              while (1)
              {
                XVectorVector = (void *)CPMLFeatureVector::getXVectorVector(v30);
                if (v52 >= (uint64_t)(XVectorVector[1] - *XVectorVector) >> 4) {
                  break;
                }
                uint64_t v56 = (void *)CPMLFeatureVector::getXVectorVector(v30);
                if (v52 >= (uint64_t)(v56[1] - *v56) >> 4) {
                  std::vector<VectorClass>::__throw_out_of_range[abi:ne180100]();
                }
                unint64_t v57 = (void **)(*v56 + v51);
                int v58 = v53 + (((*v57)[1] - **v57) >> 2);
                int v53 = v58 + CPMLNaiveBayesClassifierBase::processDataSetVariance((uint64_t)this, v57[1], v58, v54);
                ++v52;
                v51 += 16;
              }
              IntVector = (uint64_t *)CPMLFeatureVector::getIntVector(v30);
              uint64_t v61 = *IntVector;
              uint64_t v60 = IntVector[1];
              uint64_t RealVector = (void *)CPMLFeatureVector::getRealVector(v30);
              CPMLNaiveBayesClassifierBase::processDataSetVariance((uint64_t)this, RealVector, v53 + ((unint64_t)(v60 - v61) >> 2), v54);
            }
          }
        }
LABEL_48:
        std::locale v32 = v87[0];
      }
      if (v32)
      {
        v87[1] = v32;
        operator delete(v32);
      }
      uint64_t v29 = (*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
      uint64_t v30 = (CPMLFeatureVector *)v29;
      if (!v29) {
        goto LABEL_52;
      }
    }
    v86[0] = 0;
    v86[0] = *v87[0];
    std::string __p = v86;
    uint64_t v36 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)this + 368, v86, (uint64_t)&std::piecewise_construct, (_DWORD **)&__p);
    uint64_t v37 = 0;
    unint64_t v38 = 0;
    int v39 = 0;
    ++*((_DWORD *)v36 + 5);
    while (1)
    {
      double v40 = (void *)CPMLFeatureVector::getXVectorVector(v30);
      if (v38 >= (uint64_t)(v40[1] - *v40) >> 4) {
        break;
      }
      double v41 = (void *)CPMLFeatureVector::getXVectorVector(v30);
      if (v38 >= (uint64_t)(v41[1] - *v41) >> 4) {
        std::vector<VectorClass>::__throw_out_of_range[abi:ne180100]();
      }
      uint64_t v42 = (void **)(*v41 + v37);
      int v43 = v39 + (((*v42)[1] - **v42) >> 2);
      int v39 = v43 + CPMLNaiveBayesClassifierBase::processDataSetVariance((uint64_t)this, v42[1], v43, *v87[0]);
      ++v38;
      v37 += 16;
    }
    uint64_t v44 = (uint64_t *)CPMLFeatureVector::getIntVector(v30);
    uint64_t v46 = *v44;
    uint64_t v45 = v44[1];
    uint64_t v47 = (void *)CPMLFeatureVector::getRealVector(v30);
    CPMLNaiveBayesClassifierBase::processDataSetVariance((uint64_t)this, v47, v39 + ((unint64_t)(v45 - v46) >> 2), *v87[0]);
    goto LABEL_48;
  }
  int v3 = (CPMLFeatureVector *)v2;
  while (1)
  {
    uint64_t v4 = (CPMLLog *)CPMLFeatureVector::getXVectorVector(v3);
    if (*((void *)v4 + 1) != *(void *)v4) {
      break;
    }
    std::string __p = 0;
    uint64_t v81 = 0;
    unint64_t v82 = 0;
    CPMLNaiveBayesClassifierBase::getResponseValues((int)v4, (uint64_t)&__p, v3);
    uint64_t v5 = (void *)CPMLFeatureVector::getYVectorVector(v3);
    if (v5[1] == *v5)
    {
      v86[0] = 0;
      v86[0] = *(_DWORD *)__p;
      v87[0] = v86;
      uint64_t v11 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)this + 368, v86, (uint64_t)&std::piecewise_construct, v87);
      ++*((_DWORD *)v11 + 5);
      uint64_t v12 = (uint64_t *)CPMLFeatureVector::getXVectorVector(v3);
      int v13 = CPMLNaiveBayesClassifierBase::processVectorDataSet((uint64_t)this, v12, 0, v86[0]);
      uint64_t v14 = (uint64_t *)CPMLFeatureVector::getIntVector(v3);
      int v15 = CPMLNaiveBayesClassifierBase::processDiscreteDataSet((uint64_t)this, v14, v13, v86[0], 1);
      double v16 = (uint64_t *)CPMLFeatureVector::getRealVector(v3);
      CPMLNaiveBayesClassifierBase::processContinousDataSet((uint64_t)this, v16, v15, v86[0], 1);
    }
    else
    {
      uint64_t v6 = __p;
      uint64_t v7 = v81;
      unint64_t v8 = (v81 - (unsigned char *)__p) >> 2;
      if (!v8)
      {
        int v10 = 2;
        if (!__p) {
          goto LABEL_25;
        }
LABEL_24:
        uint64_t v81 = v6;
        operator delete(v6);
        goto LABEL_25;
      }
      if (v8 == 1)
      {
        v86[0] = 0;
        v86[0] = *(_DWORD *)__p;
        v87[0] = v86;
        uint64_t v9 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)this + 368, v86, (uint64_t)&std::piecewise_construct, v87);
        ++*((_DWORD *)v9 + 5);
        int v10 = 2;
        goto LABEL_23;
      }
      unint64_t v17 = *((int *)this + 140);
      if (v8 > v17)
      {
        uint64_t v18 = ((v81 - (unsigned char *)__p) << 30) - 0x100000000;
        do
        {
          v7 -= 4;
          unint64_t v8 = v18 >> 32;
          v18 -= 0x100000000;
        }
        while (v8 > v17);
        uint64_t v81 = v7;
      }
      if (v8)
      {
        for (juint64_t j = 0; jj != v8; ++jj)
        {
          int v85 = 0;
          int v85 = *((_DWORD *)__p + jj);
          v87[0] = &v85;
          uint64_t v20 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)this + 368, &v85, (uint64_t)&std::piecewise_construct, v87);
          uint64_t v21 = 0;
          ++*((_DWORD *)v20 + 5);
          do
          {
            int v84 = 0;
            int v84 = *((_DWORD *)__p + v21);
            if (jj != v21)
            {
              unint64_t v83 = v85;
              *(void *)uint64_t v86 = &v83;
              uint64_t v22 = std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)this + 168, &v83, (uint64_t)&std::piecewise_construct, (void **)v86);
              std::unordered_map<int,int>::unordered_map((uint64_t)v87, (uint64_t)(v22 + 3));
              *(void *)uint64_t v86 = &v84;
              unsigned __int8 v23 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v87, &v84, (uint64_t)&std::piecewise_construct, (_DWORD **)v86);
              ++*((_DWORD *)v23 + 5);
              std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)v87);
            }
            ++v21;
          }
          while (v8 != v21);
          uint64_t v24 = (uint64_t *)CPMLFeatureVector::getXVectorVector(v3);
          int v25 = CPMLNaiveBayesClassifierBase::processVectorDataSet((uint64_t)this, v24, 0, v85);
          double v26 = (uint64_t *)CPMLFeatureVector::getIntVector(v3);
          int v27 = CPMLNaiveBayesClassifierBase::processDiscreteDataSet((uint64_t)this, v26, v25, v85, 1);
          double v28 = (uint64_t *)CPMLFeatureVector::getRealVector(v3);
          CPMLNaiveBayesClassifierBase::processContinousDataSet((uint64_t)this, v28, v27, v85, 1);
        }
      }
    }
    int v10 = 0;
    ++*((void *)this + 14);
LABEL_23:
    uint64_t v6 = __p;
    if (__p) {
      goto LABEL_24;
    }
LABEL_25:
    if ((v10 | 2) != 2) {
      return 0xFFFFFFFFLL;
    }
    int v3 = (CPMLFeatureVector *)(*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
    if (!v3) {
      goto LABEL_27;
    }
  }
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v4);
  CPMLLog::log(CPMLLog, CPML_LOG_ERR, "train", "Does not support x vectors\n");
  return 0xFFFFFFFFLL;
}

void sub_214338FC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CPMLNaiveBayesClassifierBase::getResponseValues(int a1, uint64_t a2, CPMLFeatureVector *this)
{
  YVectorVector = (CPMLLog *)CPMLFeatureVector::getYVectorVector(this);
  uint64_t v6 = *(void *)YVectorVector;
  if (*((void *)YVectorVector + 1) == *(void *)YVectorVector)
  {
    int YHat = (int)CPMLFeatureVector::getYHat(this);
    unint64_t v25 = *(void *)(a2 + 16);
    double v26 = *(int **)(a2 + 8);
    if ((unint64_t)v26 >= v25)
    {
      uint64_t v31 = *(int **)a2;
      uint64_t v32 = ((uint64_t)v26 - *(void *)a2) >> 2;
      unint64_t v33 = v32 + 1;
      if ((unint64_t)(v32 + 1) >> 62) {
        goto LABEL_59;
      }
      uint64_t v34 = v25 - (void)v31;
      if (v34 >> 1 > v33) {
        unint64_t v33 = v34 >> 1;
      }
      if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v35 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v35 = v33;
      }
      if (v35)
      {
        uint64_t v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(a2 + 16, v35);
        uint64_t v31 = *(int **)a2;
        double v26 = *(int **)(a2 + 8);
      }
      else
      {
        uint64_t v36 = 0;
      }
      int v43 = (int *)&v36[4 * v32];
      uint64_t v44 = &v36[4 * v35];
      int *v43 = YHat;
      int v27 = v43 + 1;
      while (v26 != v31)
      {
        int v45 = *--v26;
        *--int v43 = v45;
      }
      *(void *)a2 = v43;
      *(void *)(a2 + 8) = v27;
      *(void *)(a2 + 16) = v44;
      if (v31) {
        operator delete(v31);
      }
    }
    else
    {
      *double v26 = YHat;
      int v27 = v26 + 1;
    }
    *(void *)(a2 + 8) = v27;
    return;
  }
  uint64_t v7 = *(void **)v6;
  uint64_t v8 = (*(void *)(*(void *)v6 + 8) - **(void **)v6) << 30;
  if (!v8)
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(YVectorVector);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "getResponseValues", "No response values in vector\n");
    unint64_t v29 = *(void *)(a2 + 16);
    uint64_t v30 = *(int **)(a2 + 8);
    if ((unint64_t)v30 < v29)
    {
      *uint64_t v30 = 0;
      *(void *)(a2 + 8) = v30 + 1;
      return;
    }
    uint64_t v37 = *(int **)a2;
    uint64_t v38 = ((uint64_t)v30 - *(void *)a2) >> 2;
    unint64_t v39 = v38 + 1;
    if (!((unint64_t)(v38 + 1) >> 62))
    {
      uint64_t v40 = v29 - (void)v37;
      if (v40 >> 1 > v39) {
        unint64_t v39 = v40 >> 1;
      }
      if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v41 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v41 = v39;
      }
      if (v41)
      {
        uint64_t v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(a2 + 16, v41);
        uint64_t v37 = *(int **)a2;
        uint64_t v30 = *(int **)(a2 + 8);
      }
      else
      {
        uint64_t v42 = 0;
      }
      uint64_t v46 = &v42[4 * v38];
      uint64_t v47 = &v42[4 * v41];
      *(_DWORD *)uint64_t v46 = 0;
      unint64_t v48 = v46 + 4;
      while (v30 != v37)
      {
        int v49 = *--v30;
        *((_DWORD *)v46 - 1) = v49;
        v46 -= 4;
      }
      *(void *)a2 = v46;
      *(void *)(a2 + 8) = v48;
      *(void *)(a2 + 16) = v47;
      if (v37) {
        operator delete(v37);
      }
      *(void *)(a2 + 8) = v48;
      return;
    }
LABEL_59:
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v9 = 0;
  unint64_t v10 = v8 >> 32;
  uint64_t v11 = (void *)(a2 + 16);
  if (v10 <= 1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v10;
  }
  int v13 = *(int **)(a2 + 8);
  do
  {
    int v14 = *(_DWORD *)(*v7 + 4 * v9);
    if ((unint64_t)v13 >= *v11)
    {
      double v16 = *(int **)a2;
      uint64_t v17 = ((uint64_t)v13 - *(void *)a2) >> 2;
      unint64_t v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 62) {
        goto LABEL_59;
      }
      uint64_t v19 = *v11 - (void)v16;
      if (v19 >> 1 > v18) {
        unint64_t v18 = v19 >> 1;
      }
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v18;
      }
      if (v20)
      {
        uint64_t v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(a2 + 16, v20);
        double v16 = *(int **)a2;
        int v13 = *(int **)(a2 + 8);
      }
      else
      {
        uint64_t v21 = 0;
      }
      uint64_t v22 = &v21[4 * v17];
      *(_DWORD *)uint64_t v22 = v14;
      int v15 = (int *)(v22 + 4);
      while (v13 != v16)
      {
        int v23 = *--v13;
        *((_DWORD *)v22 - 1) = v23;
        v22 -= 4;
      }
      *(void *)a2 = v22;
      *(void *)(a2 + 8) = v15;
      *(void *)(a2 + 16) = &v21[4 * v20];
      if (v16) {
        operator delete(v16);
      }
    }
    else
    {
      *int v13 = v14;
      int v15 = v13 + 1;
    }
    *(void *)(a2 + 8) = v15;
    ++v9;
    int v13 = v15;
  }
  while (v9 != v12);
}

uint64_t CPMLNaiveBayesClassifierBase::processVectorDataSet(uint64_t a1, uint64_t *a2, uint64_t a3, int a4)
{
  uint64_t v4 = *a2;
  if (a2[1] != *a2)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      unint64_t v10 = (uint64_t **)(v4 + v8);
      uint64_t v11 = v10[1];
      int v12 = CPMLNaiveBayesClassifierBase::processDiscreteDataSet(a1, *v10, a3, a4, 0);
      a3 = CPMLNaiveBayesClassifierBase::processContinousDataSet(a1, v11, v12, a4, 0);
      ++v9;
      uint64_t v4 = *a2;
      v8 += 16;
    }
    while (v9 < (a2[1] - *a2) >> 4);
  }
  return a3;
}

uint64_t CPMLNaiveBayesClassifierBase::processDiscreteDataSet(uint64_t a1, uint64_t *a2, int a3, int a4, int a5)
{
  uint64_t v7 = *a2;
  if (a2[1] == *a2)
  {
    LODWORD(v15) = 0;
  }
  else
  {
    unint64_t v10 = 0;
    uint64_t v11 = a1 + 168;
    do
    {
      int v20 = 0;
      int v20 = *(_DWORD *)(v7 + 4 * v10);
      if (a5) {
        int v12 = v10;
      }
      else {
        int v12 = 0;
      }
      unint64_t v19 = a4 | ((v12 + a3) << 31);
      uint64_t v21 = (int *)&v19;
      int v13 = std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v11, &v19, (uint64_t)&std::piecewise_construct, (void **)&v21);
      std::unordered_map<int,int>::unordered_map((uint64_t)v18, (uint64_t)(v13 + 3));
      uint64_t v21 = &v20;
      int v14 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v18, &v20, (uint64_t)&std::piecewise_construct, &v21);
      ++*((_DWORD *)v14 + 5);
      std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)v18);
      ++v10;
      uint64_t v7 = *a2;
      unint64_t v15 = (a2[1] - *a2) >> 2;
    }
    while (v15 > v10);
  }
  if (a5) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  return (v16 + a3);
}

void sub_2143394F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t CPMLNaiveBayesClassifierBase::processContinousDataSet(uint64_t a1, uint64_t *a2, int a3, int a4, int a5)
{
  uint64_t v7 = *a2;
  if (a2[1] == *a2)
  {
    LODWORD(v15) = 0;
  }
  else
  {
    unint64_t v10 = 0;
    uint64_t v11 = a1 + 208;
    do
    {
      double v12 = *(double *)(v7 + 8 * v10);
      if (a5) {
        int v13 = v10;
      }
      else {
        int v13 = 0;
      }
      unint64_t v18 = a4 | ((v13 + a3) << 31);
      unint64_t v19 = &v18;
      int v14 = (double *)std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v11, &v18, (uint64_t)&std::piecewise_construct, &v19);
      v14[3] = v12 + v14[3];
      ++v10;
      uint64_t v7 = *a2;
      unint64_t v15 = (a2[1] - *a2) >> 3;
    }
    while (v15 > v10);
  }
  if (a5) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  return (v16 + a3);
}

double *CPMLNaiveBayesClassifierBase::updateMean(double *this)
{
  uint64_t v1 = (double *)*((void *)this + 28);
  if (v1)
  {
    uint64_t v2 = (uint64_t)(this + 46);
    uint64_t v3 = (uint64_t)(this + 31);
    do
    {
      double v4 = v1[3];
      unint64_t v7 = *((void *)v1 + 2);
      int v6 = v7;
      uint64_t v8 = &v6;
      double v5 = (double)*((int *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v2, &v6, (uint64_t)&std::piecewise_construct, &v8)+ 5)/ v4;
      uint64_t v8 = (int *)&v7;
      this = (double *)std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v3, &v7, (uint64_t)&std::piecewise_construct, (void **)&v8);
      this[3] = v5;
      uint64_t v1 = *(double **)v1;
    }
    while (v1);
  }
  return this;
}

uint64_t CPMLNaiveBayesClassifierBase::processDataSetVariance(uint64_t a1, void *a2, int a3, int a4)
{
  if (a2[1] == *a2)
  {
    LODWORD(v13) = 0;
  }
  else
  {
    unint64_t v7 = 0;
    uint64_t v8 = a1 + 248;
    uint64_t v9 = a1 + 288;
    int v10 = a3 << 31;
    do
    {
      unint64_t v15 = v10 | a4;
      int v16 = &v15;
      double v11 = *(double *)(*a2 + 8 * v7)
          - *((double *)std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v8, &v15, (uint64_t)&std::piecewise_construct, &v16)+ 3);
      int v16 = &v15;
      double v12 = (double *)std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v9, &v15, (uint64_t)&std::piecewise_construct, &v16);
      void v12[3] = v12[3] + v11 * v11;
      ++v7;
      unint64_t v13 = (uint64_t)(a2[1] - *a2) >> 3;
      v10 += 0x80000000;
    }
    while (v13 > v7);
  }
  return (v13 + a3);
}

double *CPMLNaiveBayesClassifierBase::updateVariance(double *this)
{
  uint64_t v1 = (double *)*((void *)this + 38);
  if (v1)
  {
    uint64_t v2 = (uint64_t)(this + 46);
    uint64_t v3 = (uint64_t)(this + 41);
    do
    {
      double v4 = v1[3];
      unint64_t v7 = *((void *)v1 + 2);
      int v6 = v7;
      uint64_t v8 = &v6;
      double v5 = v4
         / ((double)*((int *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v2, &v6, (uint64_t)&std::piecewise_construct, &v8)+ 5)+ -1.0);
      uint64_t v8 = (int *)&v7;
      this = (double *)std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v3, &v7, (uint64_t)&std::piecewise_construct, (void **)&v8);
      this[3] = v5;
      uint64_t v1 = *(double **)v1;
    }
    while (v1);
  }
  return this;
}

uint64_t CPMLNaiveBayesClassifierBase::eval(uint64_t a1, CPMLFeatureVector *a2, uint64_t *a3)
{
  if (!*(void *)(a1 + 104)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v89 = 0;
  uint64_t v90 = 0;
  uint64_t v91 = 0;
  if (!a3 || (uint64_t v5 = *a3, a3[1] == *a3))
  {
    if (&v89 != (unsigned int **)(a1 + 144)) {
      std::vector<int>::__assign_with_size[abi:ne180100]<int *,int *>((char *)&v89, *(char **)(a1 + 144), *(void *)(a1 + 152), (uint64_t)(*(void *)(a1 + 152) - *(void *)(a1 + 144)) >> 2);
    }
  }
  else
  {
    int v6 = 0;
    unint64_t v7 = 0;
    do
    {
      if (v6 >= (unsigned int *)v91)
      {
        uint64_t v9 = v89;
        uint64_t v10 = v6 - v89;
        unint64_t v11 = v10 + 1;
        if ((unint64_t)(v10 + 1) >> 62) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v12 = v91 - (char *)v89;
        if ((v91 - (char *)v89) >> 1 > v11) {
          unint64_t v11 = v12 >> 1;
        }
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v13 = v11;
        }
        if (v13)
        {
          int v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v91, v13);
          uint64_t v9 = v89;
          int v6 = v90;
        }
        else
        {
          int v14 = 0;
        }
        unint64_t v15 = (unsigned int *)&v14[4 * v10];
        *unint64_t v15 = *(_DWORD *)(v5 + 4 * v7);
        uint64_t v8 = v15 + 1;
        while (v6 != v9)
        {
          unsigned int v16 = *--v6;
          *--unint64_t v15 = v16;
        }
        uint64_t v89 = v15;
        uint64_t v90 = v8;
        uint64_t v91 = &v14[4 * v13];
        if (v9) {
          operator delete(v9);
        }
      }
      else
      {
        unsigned int *v6 = *(_DWORD *)(v5 + 4 * v7);
        uint64_t v8 = v6 + 1;
      }
      uint64_t v90 = v8;
      ++v7;
      uint64_t v5 = *a3;
      int v6 = v8;
    }
    while (v7 < (a3[1] - *a3) >> 2);
  }
  uint64_t v86 = 0;
  uint64_t v87 = 0;
  unint64_t v88 = 0;
  __x[0] = -1;
  std::vector<int>::vector(&v85, 1uLL, __x);
  XVectorVector = (uint64_t *)CPMLFeatureVector::getXVectorVector(a2);
  uint64_t v18 = *XVectorVector;
  if (XVectorVector[1] != *XVectorVector)
  {
    uint64_t v19 = 0;
    unint64_t v20 = 0;
    uint64_t v21 = v87;
    do
    {
      uint64_t v22 = (uint64_t *)(v18 + v19);
      uint64_t v23 = *v22;
      uint64_t v24 = (void *)v22[1];
      if ((unint64_t)v21 >= v88)
      {
        uint64_t v21 = (void *)std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(&v86, v23);
      }
      else
      {
        *uint64_t v21 = 0;
        v21[1] = 0;
        v21[2] = 0;
        std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v21, *(const void **)v23, *(void *)(v23 + 8), (uint64_t)(*(void *)(v23 + 8) - *(void *)v23) >> 2);
        v21 += 3;
      }
      uint64_t v87 = v21;
      if (v24[1] != *v24)
      {
        if ((unint64_t)v21 >= v88)
        {
          uint64_t v21 = (void *)std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(&v86, (uint64_t)&v85);
        }
        else
        {
          *uint64_t v21 = 0;
          v21[1] = 0;
          v21[2] = 0;
          std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v21, v85.__begin_, (uint64_t)v85.__end_, v85.__end_ - v85.__begin_);
          v21 += 3;
        }
        uint64_t v87 = v21;
      }
      ++v20;
      uint64_t v18 = *XVectorVector;
      v19 += 16;
    }
    while (v20 < (XVectorVector[1] - *XVectorVector) >> 4);
  }
  IntVector = (void *)CPMLFeatureVector::getIntVector(a2);
  if (IntVector[1] != *IntVector)
  {
    unint64_t v26 = 0;
    do
    {
      memset(__x, 0, sizeof(__x));
      *(void *)&long long v83 = 0;
      int v27 = *(_DWORD *)(*IntVector + 4 * v26);
      unint64_t v29 = std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v83, 1uLL);
      uint64_t v30 = *(char **)__x;
      uint64_t v31 = *(char **)&__x[2];
      *unint64_t v29 = v27;
      uint64_t v32 = v29 + 1;
      unint64_t v33 = v29;
      while (v31 != v30)
      {
        int v34 = *((_DWORD *)v31 - 1);
        v31 -= 4;
        *--unint64_t v33 = v34;
      }
      *(void *)__x = v33;
      *(void *)&__x[2] = v29 + 1;
      *(void *)&long long v83 = &v29[v28];
      if (v30) {
        operator delete(v30);
      }
      *(void *)&__x[2] = v32;
      unint64_t v35 = v87;
      if ((unint64_t)v87 >= v88)
      {
        uint64_t v36 = std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(&v86, (uint64_t)__x);
      }
      else
      {
        void *v87 = 0;
        v35[1] = 0;
        v35[2] = 0;
        std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v35, *(const void **)__x, *(uint64_t *)&__x[2], (uint64_t)(*(void *)&__x[2] - *(void *)__x) >> 2);
        uint64_t v36 = (uint64_t)(v35 + 3);
      }
      uint64_t v87 = (void *)v36;
      if (*(void *)__x)
      {
        *(void *)&__x[2] = *(void *)__x;
        operator delete(*(void **)__x);
      }
      ++v26;
    }
    while (v26 < (uint64_t)(IntVector[1] - *IntVector) >> 2);
  }
  uint64_t RealVector = (void *)CPMLFeatureVector::getRealVector(a2);
  if (RealVector[1] != *RealVector)
  {
    uint64_t v37 = v87;
    if ((unint64_t)v87 >= v88)
    {
      uint64_t v38 = std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(&v86, (uint64_t)&v85);
    }
    else
    {
      void *v87 = 0;
      v37[1] = 0;
      v37[2] = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v37, v85.__begin_, (uint64_t)v85.__end_, v85.__end_ - v85.__begin_);
      uint64_t v38 = (uint64_t)(v37 + 3);
    }
    uint64_t v87 = (void *)v38;
  }
  uint64_t v72 = a1 + 120;
  CPMLNaiveBayes::predict(*(void (****)(void, uint64_t, void **, uint64_t, uint64_t))(a1 + 576), (uint64_t)&v86, &v89, *(unsigned int *)(a1 + 512), a1 + 120);
  uint64_t v73 = a1;
  uint64_t v74 = IntVector;
  *(_OWORD *)__x = 0u;
  long long v83 = 0u;
  int v84 = 1065353216;
  uint64_t v40 = v89;
  if (v90 != v89)
  {
    uint64_t v41 = 0;
    uint64_t v75 = a1 + 368;
    uint64_t v42 = a1 + 248;
    uint64_t v43 = a1 + 328;
    do
    {
      unsigned int v81 = 0;
      unsigned int v81 = v40[v41];
      *(void *)&long long v80 = &v81;
      int v44 = *((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v75, (int *)&v81, (uint64_t)&std::piecewise_construct, (_DWORD **)&v80)+ 5);
      int v45 = (uint64_t *)CPMLFeatureVector::getXVectorVector(a2);
      uint64_t v78 = v41;
      double v46 = (double)v44;
      uint64_t v48 = *v45;
      uint64_t v47 = v45[1];
      if (v47 == *v45)
      {
        int v50 = 0;
      }
      else
      {
        unint64_t v49 = 0;
        int v50 = 0;
        uint64_t v79 = v45;
        do
        {
          uint64_t v51 = (void *)(v48 + 16 * v49);
          unint64_t v52 = (void *)v51[1];
          v50 += (*(void *)(*v51 + 8) - *(void *)*v51) >> 2;
          if (v52[1] != *v52)
          {
            unint64_t v53 = 0;
            int v54 = v50 << 31;
            do
            {
              v92[0] = (_DWORD *)(int)(v81 | v54);
              double v55 = *(double *)(*v52 + 8 * v53);
              *(void *)&long long v80 = v92;
              double v56 = *((double *)std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v42, (unint64_t *)v92, (uint64_t)&std::piecewise_construct, (void **)&v80)+ 3);
              *(void *)&long long v80 = v92;
              double v57 = *((double *)std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v43, (unint64_t *)v92, (uint64_t)&std::piecewise_construct, (void **)&v80)+ 3);
              double v58 = 1.0;
              if (v57 != 0.0) {
                double v58 = exp(-((v55 - v56) * (v55 - v56)) / (v57 + v57)) / sqrt(v57 * 6.28318531);
              }
              double v46 = v46 * v58;
              ++v53;
              v54 += 0x80000000;
            }
            while (v53 < (uint64_t)(v52[1] - *v52) >> 3);
            uint64_t v48 = *v79;
            uint64_t v47 = v79[1];
            v50 += v53;
          }
          ++v49;
        }
        while (v49 < (v47 - v48) >> 4);
      }
      if (RealVector[1] != *RealVector)
      {
        unint64_t v59 = 0;
        unsigned int v60 = (v50 + ((v74[2] - *v74) >> 2)) << 31;
        do
        {
          v92[0] = (_DWORD *)(int)(v81 | v60);
          double v61 = *(double *)(*RealVector + 8 * v59);
          *(void *)&long long v80 = v92;
          double v62 = *((double *)std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v42, (unint64_t *)v92, (uint64_t)&std::piecewise_construct, (void **)&v80)+ 3);
          *(void *)&long long v80 = v92;
          double v63 = *((double *)std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v43, (unint64_t *)v92, (uint64_t)&std::piecewise_construct, (void **)&v80)+ 3);
          double v64 = 1.0;
          if (v63 != 0.0) {
            double v64 = exp(-((v61 - v62) * (v61 - v62)) / (v63 + v63)) / sqrt(v63 * 6.28318531);
          }
          double v46 = v46 * v64;
          ++v59;
          v60 += 0x80000000;
        }
        while (v59 < (uint64_t)(RealVector[1] - *RealVector) >> 3);
      }
      *(void *)&long long v80 = &v81;
      *((double *)std::__hash_table<std::__hash_value_type<int,double>,std::__unordered_map_hasher<int,std::__hash_value_type<int,double>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,double>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,double>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)__x, (int *)&v81, (uint64_t)&std::piecewise_construct, (_DWORD **)&v80)+ 3) = v46;
      uint64_t v41 = v78 + 1;
      uint64_t v40 = v89;
    }
    while (v78 + 1 < (unint64_t)(v90 - v89));
  }
  double v65 = *(char **)(v73 + 120);
  uint64_t v66 = *(char **)(v73 + 128);
  if (v66 == v65)
  {
    unint64_t v69 = (v66 - v65) >> 4;
    double v65 = *(char **)(v73 + 128);
  }
  else
  {
    uint64_t v67 = 0;
    unint64_t v68 = 0;
    do
    {
      long long v80 = *(_OWORD *)&v65[v67];
      v92[0] = (_DWORD *)&v80 + 2;
      std::__hash_table<std::__hash_value_type<int,double>,std::__unordered_map_hasher<int,std::__hash_value_type<int,double>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,double>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,double>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)__x, (int *)&v80 + 2, (uint64_t)&std::piecewise_construct, v92);
      ++v68;
      double v65 = *(char **)(v73 + 120);
      uint64_t v66 = *(char **)(v73 + 128);
      unint64_t v69 = (v66 - v65) >> 4;
      v67 += 16;
    }
    while (v69 > v68);
  }
  *(void *)&long long v80 = sortProbIndex;
  unint64_t v70 = 126 - 2 * __clz(v69);
  if (v66 == v65) {
    uint64_t v71 = 0;
  }
  else {
    uint64_t v71 = v70;
  }
  std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*,false>(v65, v66, (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))&v80, v71, 1);
  CPMLFeatureVector::setYHatProbList((uint64_t)a2, v72);
  *(void *)(v73 + 128) = *(void *)(v73 + 120);
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)__x);
  if (v85.__begin_)
  {
    v85.__end_ = v85.__begin_;
    operator delete(v85.__begin_);
  }
  *(void *)__x = &v86;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)__x);
  if (v89)
  {
    uint64_t v90 = v89;
    operator delete(v89);
  }
  return 0;
}

void sub_21433A008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,uint64_t a29,char a30,uint64_t a31)
{
  if (__p)
  {
    a28 = (uint64_t)__p;
    operator delete(__p);
  }
  a21 = &a30;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a21);
  unint64_t v33 = *(void **)(v31 - 176);
  if (v33)
  {
    *(void *)(v31 - 168) = v33;
    operator delete(v33);
  }
  _Unwind_Resume(a1);
}

void CPMLNaiveBayesClassifierBase::normalDistribution(CPMLNaiveBayesClassifierBase *this, double a2, double a3, double a4)
{
  if (a3 != 0.0) {
    exp(-((a4 - a2) * (a4 - a2)) / (a3 + a3));
  }
}

BOOL sortProbIndex(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(double *)&a1 < *(double *)&a3;
}

void CPMLNaiveBayesClassifierBase::update(CPMLNaiveBayesClassifierBase *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
}

void sub_21433A61C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, char *__p, char *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21)
{
  if (__p)
  {
    a15 = __p;
    operator delete(__p);
  }
  std::string __p = &a17;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  if (a20)
  {
    a21 = (uint64_t)a20;
    operator delete(a20);
  }
  _Unwind_Resume(a1);
}

uint64_t CPMLNaiveBayesClassifierBase::errorString(CPMLNaiveBayesClassifierBase *this)
{
  return 0;
}

uint64_t CPMLNaiveBayesClassifierBase::setDelegateEngine(CPMLNaiveBayesClassifierBase *this, CPMLDelegateEngine *a2)
{
  CPMLNaiveBayes::set_engine(*((void *)this + 72), a2);
  uint64_t v3 = *(uint64_t (**)(void))(**((void **)this + 73) + 56);

  return v3();
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264201F90, MEMORY[0x263F8C068]);
}

void sub_21433A76C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)(v2 + 3));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
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
      unint64_t v11 = (void *)*v10;
      if (*v10)
      {
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
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v13 = a1 + 16;
  int v14 = (char *)operator new(0x40uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(void *)int v14 = 0;
  *((void *)v14 + 1) = v7;
  *((void *)v14 + 2) = **a4;
  *(_OWORD *)(v14 + 4(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  char v25 = 1;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__rehash<true>(a1, v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *(void *)v24[0] = *v21;
    *uint64_t v21 = v24[0];
  }
  else
  {
    *(void *)v24[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v24[0];
    *(void *)(*(void *)a1 + 8 * v4) = v13;
    if (*(void *)v24[0])
    {
      unint64_t v22 = *(void *)(*(void *)v24[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8) {
          v22 %= v8;
        }
      }
      else
      {
        v22 &= v8 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v22) = v24[0];
    }
  }
  unint64_t v11 = (void *)v24[0];
  v24[0] = 0;
  ++*(void *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,void *>>>>::reset[abi:ne180100]((uint64_t)v24, 0);
  return v11;
}

void sub_21433AA8C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::unordered_map<int,int>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)v2 + 24);
    }
    operator delete(v2);
  }
}

uint64_t std::unordered_map<int,int>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (uint64_t i = *(int **)(a2 + 16); i; uint64_t i = *(int **)i)
    std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int const,int> const&>(a1, i + 4, (void *)i + 2);
  return a1;
}

void sub_21433AB5C(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int const,int> const&>(uint64_t a1, int *a2, void *a3)
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
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint8x8_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
              return v10;
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
  uint64_t v10 = operator new(0x18uLL);
  *uint64_t v10 = 0;
  v10[1] = v6;
  v10[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  unint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint64_t v10 = *v19;
LABEL_38:
    void *v19 = v10;
    goto LABEL_39;
  }
  *uint64_t v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    unint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_21433AD7C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::vector<VectorClass>::__throw_out_of_range[abi:ne180100]()
{
}

char *std::vector<int>::__assign_with_size[abi:ne180100]<int *,int *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint8x8_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *unint64_t v7 = 0;
      v7[1] = 0;
      uint64_t v7[2] = 0;
    }
    if (a4 >> 62) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = std::vector<int>::__vallocate[abi:ne180100](v7, v11);
    float v13 = (char *)v7[1];
    float v12 = (void **)(v7 + 1);
    uint8x8_t v9 = v13;
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
  float v12 = (void **)(result + 8);
  BOOL v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  unint64_t v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    uint8x8_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    uint64_t v18 = v9;
    unint64_t v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *float v12 = &v9[v17];
  return result;
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n, const std::vector<int>::value_type *__x)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<int>::__vallocate[abi:ne180100](this, __n);
    std::vector<int>::pointer end = this->__end_;
    unint64_t v7 = &end[__n];
    std::vector<int>::size_type v8 = 4 * __n;
    do
    {
      *end++ = *__x;
      v8 -= 4;
    }
    while (v8);
    this->__end_ = v7;
  }
  return this;
}

void sub_21433AF1C(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
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
    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7) {
            return i;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x20uLL);
  *uint64_t i = 0;
  i[1] = v7;
  i[2] = **a4;
  i[3] = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__rehash<true>(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  unint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *uint64_t i = *v20;
LABEL_38:
    *unint64_t v20 = i;
    goto LABEL_39;
  }
  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*i)
  {
    unint64_t v21 = *(void *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    unint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_21433B144(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<int,double>,std::__unordered_map_hasher<int,std::__hash_value_type<int,double>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,double>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,double>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
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
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  unint64_t v11 = operator new(0x20uLL);
  *unint64_t v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  void v11[3] = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__rehash<true>(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  unint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *unint64_t v11 = *v20;
LABEL_38:
    *unint64_t v20 = v11;
    goto LABEL_39;
  }
  *unint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    unint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_21433B368(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*,false>(char *a1, char *a2, uint64_t (**a3)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4, char a5)
{
LABEL_1:
  unint64_t v11 = a1;
LABEL_2:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    a1 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = a2 - v11;
    unint64_t v15 = (a2 - v11) >> 4;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          uint64_t v21 = *((void *)a2 - 2);
          uint64_t v22 = *((void *)a2 - 1);
          uint64_t v23 = a2 - 16;
          if ((*a3)(v21, v22, *(void *)v11, *((void *)v11 + 1)))
          {
            long long v25 = *(_OWORD *)v11;
            *(_OWORD *)unint64_t v11 = *(_OWORD *)v23;
            *(_OWORD *)uint64_t v23 = v25;
          }
          break;
        case 3uLL:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(v11, (void *)v11 + 2, (void *)a2 - 2, a3);
          break;
        case 4uLL:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(v11, (void *)v11 + 2, (void *)v11 + 4, (void *)a2 - 2, a3);
          break;
        case 5uLL:
          std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(v11, (void *)v11 + 2, (void *)v11 + 4, (void *)v11 + 6, (void *)a2 - 2, a3);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v14 <= 383) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*,ProbIndex*>(v11, a2, a2, a3);
      }
      return;
    }
    unint64_t v16 = v15 >> 1;
    unint64_t v17 = &v11[16 * (v15 >> 1)];
    if ((unint64_t)v14 >= 0x801)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(v11, &v11[16 * (v15 >> 1)], (void *)a2 - 2, a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>((void *)v11 + 2, (void *)v17 - 2, (void *)a2 - 4, a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>((void *)v11 + 4, &v11[16 * v16 + 16], (void *)a2 - 6, a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>((void *)v17 - 2, v17, &v11[16 * v16 + 16], a3);
      long long v24 = *(_OWORD *)v11;
      *(_OWORD *)unint64_t v11 = *(_OWORD *)v17;
      *(_OWORD *)unint64_t v17 = v24;
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(&v11[16 * (v15 >> 1)], v11, (void *)a2 - 2, a3);
      if (a5) {
        goto LABEL_13;
      }
    }
    if (((*a3)(*((void *)v11 - 2), *((void *)v11 - 1), *(void *)v11, *((void *)v11 + 1)) & 1) == 0)
    {
      unint64_t v11 = (char *)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ProbIndex *,BOOL (*&)(ProbIndex,ProbIndex)>(v11, a2, a3);
      goto LABEL_18;
    }
LABEL_13:
    size_t v18 = (char *)std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ProbIndex *,BOOL (*&)(ProbIndex,ProbIndex)>((uint64_t *)v11, (uint64_t *)a2, a3);
    if ((v19 & 1) == 0) {
      goto LABEL_16;
    }
    BOOL v20 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(v11, v18, a3);
    unint64_t v11 = v18 + 16;
    if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(v18 + 16, a2, a3))
    {
      a4 = -v13;
      a2 = v18;
      if (v20) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v12 = v13 + 1;
    if (!v20)
    {
LABEL_16:
      std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*,false>(a1, v18, a3, -v13, a5 & 1);
      unint64_t v11 = v18 + 16;
LABEL_18:
      a5 = 0;
      a4 = -v13;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>((uint64_t)v11, a2, a3);
  }
  else
  {
    std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>((uint64_t)v11, a2, a3);
  }
}

  unint64_t v11 = a1;
LABEL_2:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    a1 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = ((char *)a2 - (char *)v11) >> 4;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          uint64_t v22 = a2 - 1;
          uint64_t v23 = *((double *)a2 - 2);
          if (v23 > *v11 || v23 == *v11 && *((_DWORD *)a2 - 2) < *((_DWORD *)v11 + 2))
          {
            long long v25 = *(_OWORD *)v11;
            *(_OWORD *)unint64_t v11 = *v22;
            *uint64_t v22 = v25;
          }
          break;
        case 3uLL:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((long long *)v11, (long long *)v11 + 1, a2 - 1);
          break;
        case 4uLL:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((uint64_t)v11, (uint64_t)(v11 + 2), (uint64_t)(v11 + 4), (uint64_t)(a2 - 1));
          break;
        case 5uLL:
          std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((__n128 *)v11, (__n128 *)v11 + 1, (__n128 *)v11 + 2, (__n128 *)v11 + 3, (__n128 *)a2 - 1);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v14 <= 383) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != (double *)a2)
      {
        std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *,ProbIndex *>((uint64_t)v11, a2, a2, a3);
      }
      return;
    }
    unint64_t v16 = v15 >> 1;
    unint64_t v17 = (long long *)&v11[2 * (v15 >> 1)];
    if ((unint64_t)v14 >= 0x801)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((long long *)v11, (long long *)&v11[2 * (v15 >> 1)], a2 - 1);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((long long *)v11 + 1, v17 - 1, a2 - 2);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((long long *)v11 + 2, (long long *)&v11[2 * v16 + 2], a2 - 3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(v17 - 1, v17, (long long *)&v11[2 * v16 + 2]);
      long long v24 = *(_OWORD *)v11;
      *(_OWORD *)unint64_t v11 = *v17;
      *unint64_t v17 = v24;
      if (a5) {
        goto LABEL_15;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((long long *)&v11[2 * (v15 >> 1)], (long long *)v11, a2 - 1);
      if (a5) {
        goto LABEL_15;
      }
    }
    size_t v18 = *(v11 - 2);
    if (v18 <= *v11 && (v18 != *v11 || *((_DWORD *)v11 - 2) >= *((_DWORD *)v11 + 2)))
    {
      unint64_t v11 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ProbIndex *,CPMLNBCompareProbIndexDescending &>((uint64_t)v11, (unint64_t)a2);
      goto LABEL_20;
    }
LABEL_15:
    char v19 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ProbIndex *,CPMLNBCompareProbIndexDescending &>((uint64_t)v11, (unint64_t)a2);
    if ((v20 & 1) == 0) {
      goto LABEL_18;
    }
    uint64_t v21 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((uint64_t)v11, v19);
    unint64_t v11 = (double *)(v19 + 16);
    if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(v19 + 16, (uint64_t)a2))
    {
      a4 = -v13;
      a2 = (long long *)v19;
      if (v21) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v12 = v13 + 1;
    if (!v21)
    {
LABEL_18:
      std::__introsort<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *,false>(a1, v19, a3, -v13, a5 & 1);
      unint64_t v11 = (double *)(v19 + 16);
LABEL_20:
      a5 = 0;
      a4 = -v13;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(v11, (double *)a2);
  }
  else
  {
    std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(v11, (double *)a2);
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(uint64_t result, void *a2, uint64_t (**a3)(uint64_t, uint64_t, void, void))
{
  if ((void *)result != a2)
  {
    unint64_t v4 = (void *)result;
    char v5 = (void *)(result + 16);
    if ((void *)(result + 16) != a2)
    {
      uint64_t v7 = 0;
      unint64_t v8 = (void *)result;
      do
      {
        uint8x8_t v9 = v5;
        uint64_t result = (*a3)(v8[2], v8[3], *v8, v8[1]);
        if (result)
        {
          uint64_t v10 = *v9;
          uint64_t v11 = v8[3];
          uint64_t v12 = v7;
          while (1)
          {
            *(_OWORD *)((char *)v4 + v12 + 16) = *(_OWORD *)((char *)v4 + v12);
            if (!v12) {
              break;
            }
            uint64_t result = (*a3)(v10, v11, *(void *)((char *)v4 + v12 - 16), *(void *)((char *)v4 + v12 - 8));
            v12 -= 16;
            if ((result & 1) == 0)
            {
              uint64_t v13 = (void *)((char *)v4 + v12 + 16);
              goto LABEL_10;
            }
          }
          uint64_t v13 = v4;
LABEL_10:
          *uint64_t v13 = v10;
          v13[1] = v11;
        }
        char v5 = v9 + 2;
        v7 += 16;
        unint64_t v8 = v9;
      }
      while (v9 + 2 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(uint64_t result, void *a2, uint64_t (**a3)(uint64_t, uint64_t, void, void))
{
  if ((void *)result != a2)
  {
    unint64_t v4 = (void *)result;
    char v5 = (void *)(result + 16);
    if ((void *)(result + 16) != a2)
    {
      do
      {
        uint64_t v7 = v5;
        uint64_t result = (*a3)(v4[2], v4[3], *v4, v4[1]);
        if (result)
        {
          uint64_t v8 = *v7;
          uint64_t v9 = v4[3];
          uint64_t v10 = v7;
          do
          {
            uint64_t v11 = v10 - 1;
            *uint64_t v10 = *(v10 - 1);
            uint64_t result = (*a3)(v8, v9, *((void *)v10 - 4), *((void *)v10 - 3));
            uint64_t v10 = v11;
          }
          while ((result & 1) != 0);
          *uint64_t v11 = v8;
          v11[1] = v9;
        }
        char v5 = v7 + 2;
        unint64_t v4 = v7;
      }
      while (v7 + 2 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(void *a1, void *a2, void *a3, uint64_t (**a4)(void, void, void, void))
{
  char v8 = (*a4)(*a2, a2[1], *a1, a1[1]);
  uint64_t result = (*a4)(*a3, a3[1], *a2, a2[1]);
  if ((v8 & 1) == 0)
  {
    if (!result) {
      return result;
    }
    long long v11 = *(_OWORD *)a2;
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)a3 = v11;
    if (!(*a4)(*a2, a2[1], *a1, a1[1])) {
      return 1;
    }
    long long v12 = *(_OWORD *)a1;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)a2 = v12;
    return 2;
  }
  if (!result)
  {
    long long v13 = *(_OWORD *)a1;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)a2 = v13;
    if (!(*a4)(*a3, a3[1], *a2, a2[1])) {
      return 1;
    }
    long long v14 = *(_OWORD *)a2;
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)a3 = v14;
    return 2;
  }
  long long v10 = *(_OWORD *)a1;
  *(_OWORD *)a1 = *(_OWORD *)a3;
  *(_OWORD *)a3 = v10;
  return 1;
}

void *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ProbIndex *,BOOL (*&)(ProbIndex,ProbIndex)>(void *a1, _OWORD *a2, uint64_t (**a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  unint64_t v4 = a2;
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  if ((*a3)(*a1, v7, *((void *)a2 - 2), *((void *)a2 - 1)))
  {
    char v8 = a1;
    do
    {
      uint64_t v9 = v8[2];
      uint64_t v10 = v8[3];
      v8 += 2;
    }
    while (((*a3)(v6, v7, v9, v10) & 1) == 0);
  }
  else
  {
    long long v11 = a1 + 2;
    do
    {
      char v8 = v11;
      if (v11 >= (void *)v4) {
        break;
      }
      int v12 = (*a3)(v6, v7, *v11, v11[1]);
      long long v11 = v8 + 2;
    }
    while (!v12);
  }
  if (v8 < (void *)v4)
  {
    do
    {
      uint64_t v13 = *((void *)v4 - 2);
      uint64_t v14 = *((void *)v4-- - 1);
    }
    while (((*a3)(v6, v7, v13, v14) & 1) != 0);
  }
  while (v8 < (void *)v4)
  {
    long long v20 = *(_OWORD *)v8;
    *(_OWORD *)char v8 = *v4;
    *unint64_t v4 = v20;
    do
    {
      uint64_t v15 = v8[2];
      uint64_t v16 = v8[3];
      v8 += 2;
    }
    while (!(*a3)(v6, v7, v15, v16));
    do
    {
      uint64_t v17 = *((void *)v4 - 2);
      uint64_t v18 = *((void *)v4-- - 1);
    }
    while (((*a3)(v6, v7, v17, v18) & 1) != 0);
  }
  if (v8 - 2 != a1) {
    *(_OWORD *)a1 = *((_OWORD *)v8 - 1);
  }
  *(v8 - 2) = v6;
  *(v8 - 1) = v7;
  return v8;
}

uint64_t *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ProbIndex *,BOOL (*&)(ProbIndex,ProbIndex)>(uint64_t *a1, uint64_t *a2, uint64_t (**a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = 0;
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  do
  {
    char v9 = (*a3)(a1[v6 + 2], a1[v6 + 3], v7, v8);
    v6 += 2;
  }
  while ((v9 & 1) != 0);
  uint64_t v10 = &a1[v6];
  if (v6 == 2)
  {
    do
    {
      if (v10 >= a2) {
        break;
      }
      uint64_t v13 = *(a2 - 2);
      uint64_t v14 = *(a2 - 1);
      a2 -= 2;
    }
    while (((*a3)(v13, v14, v7, v8) & 1) == 0);
  }
  else
  {
    do
    {
      uint64_t v11 = *(a2 - 2);
      uint64_t v12 = *(a2 - 1);
      a2 -= 2;
    }
    while (!(*a3)(v11, v12, v7, v8));
  }
  uint64_t v15 = &a1[v6];
  if (v10 < a2)
  {
    uint64_t v16 = a2;
    do
    {
      long long v17 = *(_OWORD *)v15;
      *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
      *(_OWORD *)uint64_t v16 = v17;
      do
      {
        uint64_t v18 = v15[2];
        uint64_t v19 = v15[3];
        v15 += 2;
      }
      while (((*a3)(v18, v19, v7, v8) & 1) != 0);
      do
      {
        uint64_t v20 = *(v16 - 2);
        uint64_t v21 = *(v16 - 1);
        v16 -= 2;
      }
      while (!(*a3)(v20, v21, v7, v8));
    }
    while (v15 < v16);
  }
  uint64_t result = v15 - 2;
  if (v15 - 2 != a1) {
    *(_OWORD *)a1 = *(_OWORD *)result;
  }
  *(v15 - 2) = v7;
  *(v15 - 1) = v8;
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(char *a1, char *a2, uint64_t (**a3)(uint64_t, uint64_t, void, void))
{
  uint64_t v6 = (a2 - a1) >> 4;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v8 = a2 - 16;
      if ((*a3)(*((void *)a2 - 2), *((void *)a2 - 1), *(void *)a1, *((void *)a1 + 1)))
      {
        long long v9 = *(_OWORD *)a1;
        *(_OWORD *)a1 = *(_OWORD *)v8;
        *(_OWORD *)uint64_t v8 = v9;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(a1, (void *)a1 + 2, (void *)a2 - 2, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(a1, (void *)a1 + 2, (void *)a1 + 4, (void *)a2 - 2, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(a1, (void *)a1 + 2, (void *)a1 + 4, (void *)a1 + 6, (void *)a2 - 2, a3);
      return 1;
    default:
      uint64_t v10 = a1 + 32;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(a1, (void *)a1 + 2, (void *)a1 + 4, a3);
      uint64_t v11 = a1 + 48;
      if (a1 + 48 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    if ((*a3)(*(void *)v11, *((void *)v11 + 1), *(void *)v10, *((void *)v10 + 1)))
    {
      uint64_t v14 = *(void *)v11;
      uint64_t v15 = *((void *)v11 + 1);
      uint64_t v16 = v12;
      while (1)
      {
        long long v17 = &a1[v16];
        *(_OWORD *)&a1[v16 + 48] = *(_OWORD *)&a1[v16 + 32];
        if (v16 == -32) {
          break;
        }
        v16 -= 16;
        if (((*a3)(v14, v15, *((void *)v17 + 2), *((void *)v17 + 3)) & 1) == 0)
        {
          uint64_t v18 = &a1[v16 + 48];
          goto LABEL_12;
        }
      }
      uint64_t v18 = a1;
LABEL_12:
      *(void *)uint64_t v18 = v14;
      *((void *)v18 + 1) = v15;
      if (++v13 == 8) {
        return v11 + 16 == a2;
      }
    }
    uint64_t v10 = v11;
    v12 += 16;
    v11 += 16;
    if (v11 == a2) {
      return 1;
    }
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(void *a1, void *a2, void *a3, void *a4, uint64_t (**a5)(void, void, void, void))
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(a1, a2, a3, a5);
  if ((*a5)(*a4, a4[1], *a3, a3[1]))
  {
    long long v11 = *(_OWORD *)a3;
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_OWORD *)a4 = v11;
    if ((*a5)(*a3, a3[1], *a2, a2[1]))
    {
      long long v12 = *(_OWORD *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_OWORD *)a3 = v12;
      if ((*a5)(*a2, a2[1], *a1, a1[1]))
      {
        __n128 result = *(__n128 *)a1;
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(__n128 *)a2 = result;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t (**a6)(void, void, void, void))
{
  __n128 v12 = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(a1, a2, a3, a4, a6);
  if (((unsigned int (*)(void, void, void, void, __n128))*a6)(*a5, a5[1], *a4, a4[1], v12))
  {
    long long v14 = *(_OWORD *)a4;
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(_OWORD *)a5 = v14;
    if ((*a6)(*a4, a4[1], *a3, a3[1]))
    {
      long long v15 = *(_OWORD *)a3;
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(_OWORD *)a4 = v15;
      if ((*a6)(*a3, a3[1], *a2, a2[1]))
      {
        long long v16 = *(_OWORD *)a2;
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(_OWORD *)a3 = v16;
        if ((*a6)(*a2, a2[1], *a1, a1[1]))
        {
          __n128 result = *(__n128 *)a1;
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(__n128 *)a2 = result;
        }
      }
    }
  }
  return result;
}

char *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*,ProbIndex*>(char *a1, char *a2, char *a3, uint64_t (**a4)(void, void, uint64_t, uint64_t))
{
  if (a1 != a2)
  {
    uint64_t v8 = a2 - a1;
    uint64_t v9 = (a2 - a1) >> 4;
    if (a2 - a1 >= 17)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      __n128 v12 = &a1[16 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>((uint64_t)a1, (unsigned int (**)(void, void, void, void))a4, v9, v12);
        v12 -= 16;
        --v11;
      }
      while (v11);
    }
    int v13 = a2;
    if (a2 != a3)
    {
      long long v14 = a2;
      do
      {
        if ((*a4)(*(void *)v14, *((void *)v14 + 1), *(void *)a1, *((void *)a1 + 1)))
        {
          long long v15 = *(_OWORD *)v14;
          *(_OWORD *)long long v14 = *(_OWORD *)a1;
          *(_OWORD *)a1 = v15;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>((uint64_t)a1, (unsigned int (**)(void, void, void, void))a4, v9, a1);
        }
        v14 += 16;
      }
      while (v14 != a3);
      int v13 = a3;
    }
    if (v8 >= 17)
    {
      uint64_t v16 = (unint64_t)v8 >> 4;
      long long v17 = a2 - 16;
      do
      {
        long long v21 = *(_OWORD *)a1;
        uint64_t v18 = (char *)std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(a1, (unsigned int (**)(void, void, void, void))a4, v16);
        if (v17 == v18)
        {
          *(_OWORD *)uint64_t v18 = v21;
        }
        else
        {
          *(_OWORD *)uint64_t v18 = *(_OWORD *)v17;
          *(_OWORD *)long long v17 = v21;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>((uint64_t)a1, (uint64_t)(v18 + 16), a4, (v18 + 16 - a1) >> 4);
        }
        v17 -= 16;
      }
      while (v16-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(uint64_t result, unsigned int (**a2)(void, void, void, void), uint64_t a3, void *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    char v5 = a4;
    uint64_t v6 = result;
    int64_t v17 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - result) >> 4)
    {
      uint64_t v9 = ((uint64_t)a4 - result) >> 3;
      uint64_t v10 = v9 + 1;
      unint64_t v11 = (void *)(result + 16 * (v9 + 1));
      uint64_t v12 = v9 + 2;
      if (v9 + 2 < a3 && (*a2)(*v11, v11[1], v11[2], v11[3]))
      {
        v11 += 2;
        uint64_t v10 = v12;
      }
      __n128 result = ((uint64_t (*)(void, void, void, void))*a2)(*v11, v11[1], *v5, v5[1]);
      if ((result & 1) == 0)
      {
        uint64_t v13 = *v5;
        uint64_t v14 = v5[1];
        do
        {
          long long v15 = v11;
          *(_OWORD *)char v5 = *(_OWORD *)v11;
          if (v17 < v10) {
            break;
          }
          uint64_t v16 = (2 * v10) | 1;
          unint64_t v11 = (void *)(v6 + 16 * v16);
          if (2 * v10 + 2 < a3)
          {
            if ((*a2)(*v11, v11[1], v11[2], v11[3]))
            {
              v11 += 2;
              uint64_t v16 = 2 * v10 + 2;
            }
          }
          __n128 result = ((uint64_t (*)(void, void, uint64_t, uint64_t))*a2)(*v11, v11[1], v13, v14);
          char v5 = v15;
          uint64_t v10 = v16;
        }
        while (!result);
        *long long v15 = v13;
        v15[1] = v14;
      }
    }
  }
  return result;
}

_OWORD *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(_OWORD *a1, unsigned int (**a2)(void, void, void, void), uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    uint64_t v9 = &a1[v6 + 1];
    uint64_t v10 = (2 * v6) | 1;
    uint64_t v11 = 2 * v6 + 2;
    if (v11 < a3
      && (*a2)(*(void *)&a1[v6 + 1], *((void *)&a1[v6 + 1] + 1), *(void *)&a1[v6 + 2], *((void *)&a1[v6 + 2] + 1)))
    {
      ++v9;
      uint64_t v10 = v11;
    }
    *a1 = *v9;
    a1 = v9;
    uint64_t v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*>(uint64_t result, uint64_t a2, uint64_t (**a3)(void, void, uint64_t, uint64_t), uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    uint64_t v7 = result;
    unint64_t v8 = v4 >> 1;
    uint64_t v9 = (void *)(result + 16 * (v4 >> 1));
    uint64_t v10 = (_OWORD *)(a2 - 16);
    __n128 result = (*a3)(*v9, v9[1], *(void *)(a2 - 16), *(void *)(a2 - 8));
    if (result)
    {
      uint64_t v11 = *(void *)(a2 - 16);
      uint64_t v12 = *(void *)(a2 - 8);
      do
      {
        uint64_t v13 = v9;
        *uint64_t v10 = *(_OWORD *)v9;
        if (!v8) {
          break;
        }
        unint64_t v8 = (v8 - 1) >> 1;
        uint64_t v9 = (void *)(v7 + 16 * v8);
        __n128 result = (*a3)(*v9, v9[1], v11, v12);
        uint64_t v10 = v13;
      }
      while ((result & 1) != 0);
      *uint64_t v13 = v11;
      v13[1] = v12;
    }
  }
  return result;
}

void CPGMMClassfier::CPGMMClassfier(CPGMMClassfier *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, a2, a3, a4);
  *(void *)uint64_t v5 = &unk_26C50FAE0;
  *(unsigned char *)(v5 + 184) = 0;
  int v6 = *((_DWORD *)a2->var0 + 33);
  *(_DWORD *)(v5 + 96) = *((_DWORD *)a2->var0 + 31) - 1;
  *(_DWORD *)(v5 + 10(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = v6;
  *(_DWORD *)(v5 + 104) = 2;
  CPMLCDB::getIterator();
}

void sub_21433C45C(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void *CPGMMClassfier::initializeGMMMemory(CPGMMClassfier *this)
{
  *((void *)this + 15) = malloc_type_calloc(*((int *)this + 24), 8uLL, 0x100004000313F17uLL);
  *((void *)this + 16) = malloc_type_calloc((*((_DWORD *)this + 24) * *((_DWORD *)this + 24)), 8uLL, 0x100004000313F17uLL);
  *((void *)this + 17) = malloc_type_calloc(*((int *)this + 25) * (uint64_t)*((int *)this + 24) * *((int *)this + 26), 8uLL, 0x100004000313F17uLL);
  *((void *)this + 18) = malloc_type_calloc(*((int *)this + 24)* (uint64_t)*((int *)this + 24)* *((int *)this + 25)* *((int *)this + 26), 8uLL, 0x100004000313F17uLL);
  *((void *)this + 19) = malloc_type_calloc(*((int *)this + 26) * (uint64_t)*((int *)this + 25), 8uLL, 0x100004000313F17uLL);
  *((void *)this + 2(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = malloc_type_calloc(*((int *)this + 24), 8uLL, 0x100004000313F17uLL);
  *((void *)this + 21) = malloc_type_calloc(*((int *)this + 24), 8uLL, 0x100004000313F17uLL);
  __n128 result = malloc_type_calloc(*((int *)this + 24), 8uLL, 0x100004000313F17uLL);
  *((void *)this + 22) = result;
  return result;
}

void CPGMMClassfier::CPGMMClassfier(CPGMMClassfier *this, CPMLSerialization *a2, CPMLTunableData *a3)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, a2, a3);
  *(void *)uint64_t v5 = &unk_26C50FAE0;
  *(unsigned char *)(v5 + 184) = 0;
  (*((void (**)(CPMLSerialization *, uint64_t, const char *, uint64_t, void))a2->var0 + 8))(a2, v5 + 96, "featureVectorSpace", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 8))(a2, (char *)this + 100, "resultCardinality", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 8))(a2, (char *)this + 104, "numberClusters", 1, 0);
  CPGMMClassfier::initializeGMMMemory(this);
  (*((void (**)(CPMLSerialization *, void, const char *, void, void))a2->var0 + 12))(a2, *((void *)this + 15), "preMean", *((int *)this + 24), 0);
  (*((void (**)(CPMLSerialization *, void, const char *, void, void))a2->var0 + 12))(a2, *((void *)this + 16), "preWhiten", (*((_DWORD *)this + 24) * *((_DWORD *)this + 24)), 0);
  (*((void (**)(CPMLSerialization *, void, const char *, uint64_t, void))a2->var0 + 12))(a2, *((void *)this + 17), "means", *((int *)this + 25) * (uint64_t)*((int *)this + 24) * *((int *)this + 26), 0);
  (*((void (**)(CPMLSerialization *, void, const char *, uint64_t, void))a2->var0 + 12))(a2, *((void *)this + 18), "inverseCovariances", *((int *)this + 24) * (uint64_t)*((int *)this + 24) * *((int *)this + 25) * *((int *)this + 26), 0);
  (*((void (**)(CPMLSerialization *, void, const char *, uint64_t, void))a2->var0 + 12))(a2, *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0);
}

void sub_21433C81C(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPGMMClassfier::CPGMMClassfier(CPGMMClassfier *this, int a2, int a3, int *a4, double *a5, double *a6, double *a7, double *a8, double *a9, CPMLTunableData *a10)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, 0, a10);
  *(void *)uint64_t v18 = &unk_26C50FAE0;
  *(_DWORD *)(v18 + 96) = a2;
  *(_DWORD *)(v18 + 10(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = a3;
  *(_DWORD *)(v18 + 104) = -1;
  *(void *)(v18 + 112) = a4;
  *(void *)(v18 + 12(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = a5;
  *(void *)(v18 + 128) = a6;
  *(void *)(v18 + 136) = a7;
  *(void *)(v18 + 144) = a8;
  *(void *)(v18 + 152) = a9;
  *((unsigned char *)this + 184) = 1;
  *((void *)this + 2(*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 56))(*((void *)this + 11), (char *)this + 8, "version", 32, 0) = malloc_type_calloc(a2, 8uLL, 0x100004000313F17uLL);
  *((void *)this + 21) = malloc_type_calloc(*((int *)this + 24), 8uLL, 0x100004000313F17uLL);
  *((void *)this + 22) = malloc_type_calloc(*((int *)this + 24), 8uLL, 0x100004000313F17uLL);
}

{
  CPGMMClassfier::CPGMMClassfier(this, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

void sub_21433C940(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPGMMClassfier::~CPGMMClassfier(void **this)
{
  *this = &unk_26C50FAE0;
  if (!*((unsigned char *)this + 184))
  {
    free(this[15]);
    free(this[16]);
    free(this[17]);
    free(this[18]);
    free(this[19]);
  }
  free(this[20]);
  free(this[21]);
  free(this[22]);

  CPModelClose(this);
}

{
  uint64_t vars8;

  CPGMMClassfier::~CPGMMClassfier(this);

  JUMPOUT(0x21669DB80);
}

uint64_t CPGMMClassfier::serialize(CPGMMClassfier *this)
{
  return 0;
}

uint64_t CPGMMClassfier::train(void **this)
{
  uint64_t v1 = this;
  bzero(this[15], 8 * *((int *)this + 24));
  bzero(v1[16], 8 * *((int *)v1 + 24) * (uint64_t)*((int *)v1 + 24));
  uint64_t v2 = *((unsigned int *)v1 + 24);
  uint64_t v3 = (int)v2;
  uint64_t v4 = *((unsigned int *)v1 + 25);
  uint64_t v5 = (int *)malloc_type_calloc(*((int *)v1 + 25), 4uLL, 0x100004052888210uLL);
  bzero(v5, 4 * *((int *)v1 + 25));
  uint64_t v6 = (*(uint64_t (**)(void *))(*(void *)v1[10] + 32))(v1[10]);
  if (!v6)
  {
    int v8 = 0;
LABEL_14:
    if ((int)v4 >= 1)
    {
      uint64_t v20 = 0;
      while (v5[v20])
      {
        if (v4 == ++v20) {
          goto LABEL_18;
        }
      }
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(0);
      CPMLLog::log(CPMLLog, CPML_LOG_ERR, "train", "You must specify an exmaple for all classes: %d not found.\n", v20);
      free(v5);
      return 3;
    }
LABEL_18:
    int v21 = 3 * v2 - 1;
    unsigned int v229 = v2 * v2;
    if ((int)v2 * (int)v2 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = (v2 * v2);
    }
    if (!v8)
    {
      uint64_t v23 = (pthread_mutex_t *)CPMLLog::getCPMLLog(0);
      CPMLLog::log(v23, CPML_LOG_ERR, "train", "dataCount 0 \n");
      int v8 = 1;
    }
    long long v24 = (__CLPK_doublereal *)malloc_type_calloc(v22, 8uLL, 0x100004000313F17uLL);
    long long v25 = (__CLPK_doublereal *)malloc_type_calloc((int)v2, 8uLL, 0x100004000313F17uLL);
    uint64_t v232 = malloc_type_malloc(4 * ((int)v2 + 1), 0x100004052888210uLL);
    v218 = (char *)malloc_type_calloc(*((int *)v1 + 24) * (uint64_t)v8, 8uLL, 0x100004000313F17uLL);
    v217 = (double *)malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
    v212 = (int *)malloc_type_calloc(*((int *)v1 + 25), 4uLL, 0x100004052888210uLL);
    int *v212 = 0;
    if (*((int *)v1 + 25) > 1)
    {
      uint64_t v26 = 0;
      int v27 = 0;
      do
      {
        v27 += v5[v26];
        v212[v26 + 1] = v27;
        uint64_t v28 = v26 + 2;
        ++v26;
      }
      while (v28 < *((int *)v1 + 25));
    }
    (*(void (**)(void *))(*(void *)v1[10] + 40))(v1[10]);
    uint64_t v225 = 8 * (int)v2;
    if ((int)v2 >= 1)
    {
      double v29 = (double)v8;
      uint64_t v30 = (double *)v1[15];
      uint64_t v31 = v2;
      do
      {
        *uint64_t v30 = *v30 / v29;
        ++v30;
        --v31;
      }
      while (v31);
      uint64_t v32 = 0;
      int v34 = (double *)v1[15];
      unint64_t v33 = (double *)v1[16];
      do
      {
        uint64_t v35 = v2;
        uint64_t v36 = v34;
        uint64_t v37 = v33;
        do
        {
          double v38 = *v36++;
          *uint64_t v37 = (*v37 + -(v34[v32] * v38) * v29) / v29;
          ++v37;
          --v35;
        }
        while (v35);
        ++v32;
        unint64_t v33 = (double *)((char *)v33 + v225);
      }
      while (v32 != v2);
    }
    unint64_t v39 = (__CLPK_doublereal *)v1[16];
    __CLPK_integer __info = 0;
    __lwork[0] = 3 * v2 - 1;
    __CLPK_integer __lda = v2;
    dsyev_("V", "U", &__lda, v39, &__lda, v25, v24, __lwork, &__info);
    memcpy(v24, v39, 8 * v229);
    bzero(v39, 8 * v229);
    uint64_t v40 = v212;
    uint64_t v41 = 8 * (int)v2;
    if ((int)v2 >= 1)
    {
      uint64_t v42 = 0;
      uint64_t v43 = v24;
      do
      {
        double v44 = v25[v42];
        if (v44 > 0.0)
        {
          uint64_t v45 = 0;
          LODWORD(v46) = 0;
          double v47 = 1.0 / sqrt(v44);
          do
          {
            uint64_t v46 = (int)v46;
            uint64_t v48 = v43;
            uint64_t v49 = v2;
            do
            {
              double v50 = *v48++;
              v39[v46] = v39[v46] + v24[v45 + v42 * v2] * v50 * v47;
              ++v46;
              --v49;
            }
            while (v49);
            ++v45;
          }
          while (v45 != v2);
        }
        ++v42;
        v43 += v2;
      }
      while (v42 != v2);
    }
    uint64_t v51 = (*(uint64_t (**)(void *))(*(void *)v1[10] + 32))(v1[10]);
    if (v51)
    {
      unint64_t v52 = (CPMLFeatureVector *)v51;
      do
      {
        uint64_t RealVector = CPMLFeatureVector::getRealVector(v52);
        int YHat = (int)CPMLFeatureVector::getYHat(v52);
        uint64_t v55 = v212[YHat];
        int v56 = *((_DWORD *)v1 + 24);
        double v57 = *(double **)RealVector;
        uint64_t v58 = *(void *)(RealVector + 8) - *(void *)RealVector;
        if (v58)
        {
          unint64_t v59 = v58 >> 3;
          unsigned int v60 = (double *)v1[15];
          if (v59 <= 1) {
            unint64_t v59 = 1;
          }
          double v61 = v25;
          do
          {
            double v62 = *v57++;
            double v63 = v62;
            double v64 = *v60++;
            *v61++ = v63 - v64;
            --v59;
          }
          while (v59);
        }
        uint64_t v41 = 8 * (int)v2;
        if ((int)v2 >= 1)
        {
          uint64_t v65 = 0;
          int v66 = 0;
          uint64_t v67 = &v218[8 * v56 * (int)v55];
          unint64_t v68 = (char *)v1[16];
          do
          {
            unint64_t v69 = (double *)&v68[8 * v66];
            double v70 = 0.0;
            uint64_t v71 = v25;
            uint64_t v72 = v2;
            do
            {
              double v73 = *v69++;
              double v74 = v73;
              double v75 = *v71++;
              double v70 = v70 + v74 * v75;
              --v72;
            }
            while (v72);
            *(double *)&v67[8 * v65] = v70;
            v66 += v2;
            ++v65;
          }
          while (v65 != v2);
        }
        v217[v55] = (double)YHat;
        v212[YHat] = v55 + 1;
        unint64_t v52 = (CPMLFeatureVector *)(*(uint64_t (**)(void *))(*(void *)v1[10] + 32))(v1[10]);
      }
      while (v52);
    }
    v208 = v25;
    int *v212 = 0;
    if (*((int *)v1 + 25) > 1)
    {
      uint64_t v76 = 0;
      int v77 = 0;
      do
      {
        v77 += v5[v76];
        v212[v76 + 1] = v77;
        uint64_t v78 = v76 + 2;
        ++v76;
      }
      while (v78 < *((int *)v1 + 25));
    }
    size_t v221 = *((int *)v1 + 26);
    v227 = malloc_type_calloc(v221, 8uLL, 0x100004000313F17uLL);
    if (*((int *)v1 + 25) < 1)
    {
LABEL_191:
      free(v227);
      free(v24);
      free(v208);
      free(v218);
      free(v232);
      free(v217);
      free(v40);
      free(v5);
      return 0;
    }
    size_t v215 = v41 * v221;
    size_t v210 = v41 * v221 * (int)v2;
    double v79 = pow(6.28318531, (double)(int)v2);
    int v220 = 0;
    uint64_t v80 = 0;
    uint64_t v81 = 0;
    int v209 = v5;
    v211 = v1;
    while (1)
    {
      uint64_t v219 = v81;
      uint64_t v222 = (char *)v1[17];
      unint64_t v82 = &v222[8 * v81 * v3 * v221];
      uint64_t v214 = (char *)v1[18];
      long long v83 = (__CLPK_doublereal *)&v214[8 * (int)v221 * (int)v2 * (int)v81 * (int)v3];
      int v84 = (char *)v1[19] + 8 * v81 * v221;
      v223 = v82;
      bzero(v82, v215);
      v228 = v83;
      bzero(v83, v210);
      bzero(v84, 8 * v221);
      uint64_t v85 = v40[v219];
      uint64_t v216 = (int)v85 * (int)v2;
      uint64_t v86 = &v217[v85];
      uint64_t v87 = v5[v219];
      uint64_t v88 = v5[v219];
      int v224 = v86;
      int v213 = v5[v219];
      uint64_t v230 = v88;
      if ((int)v87 <= (int)v221)
      {
        if ((int)v88 >= 1)
        {
          for (uint64_t i = 0; i != v88; ++i)
            v86[i] = (double)(int)i;
        }
        uint64_t v107 = (int)v2;
        unint64_t v108 = v222;
        if ((int)v221 >= 1)
        {
          uint64_t v109 = 0;
          uint64_t v110 = &v222[v80];
          do
          {
            *((void *)v227 + v109) = 0;
            if ((int)v2 >= 1)
            {
              if (v109 >= v87) {
                int v111 = v87 - 1;
              }
              else {
                int v111 = v109;
              }
              uint64_t v112 = &v218[8 * v216 + 8 * v111 * (int)v2];
              uint64_t v113 = v110;
              uint64_t v114 = v2;
              do
              {
                uint64_t v115 = *(void *)v112;
                v112 += 8;
                *(void *)uint64_t v113 = v115;
                v113 += 8;
                --v114;
              }
              while (v114);
            }
            ++v109;
            v110 += v41;
          }
          while (v109 != v221);
        }
      }
      else
      {
        uint64_t v89 = (CPMLLog *)malloc_type_malloc(4 * v221, 0x100004052888210uLL);
        uint64_t v91 = v230;
        uint64_t v90 = v221;
        v226 = v89;
        if ((int)v221 >= 1)
        {
          int v92 = 0;
          unint64_t v93 = v89;
          uint64_t v94 = v227;
          uint64_t v95 = v221;
          do
          {
            *(_DWORD *)unint64_t v93 = 0;
            void *v94 = 0;
            if ((int)v2 >= 1)
            {
              bzero(&v223[8 * v92], 8 * v2);
              uint64_t v89 = v226;
              uint64_t v91 = v230;
              uint64_t v90 = v221;
            }
            v92 += v2;
            ++v94;
            unint64_t v93 = (CPMLLog *)((char *)v93 + 4);
            --v95;
          }
          while (v95);
        }
        if ((int)v91 < 1)
        {
          int v97 = 0;
          uint64_t v99 = v224;
          uint64_t v41 = 8 * (int)v2;
        }
        else
        {
          uint64_t v96 = 0;
          int v97 = 0;
          uint64_t v98 = (double *)&v218[8 * v216];
          uint64_t v99 = v224;
          do
          {
            unsigned int v100 = (int)v96 % (int)v221;
            v99[v96] = (double)((int)v96 % (int)v221);
            if ((v90 & 0x80000000) != 0)
            {
              uint64_t v105 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v89);
              CPMLLog::log(v105, CPML_LOG_ERR, "kmeans", "Data point assigned to nonexistant cluster: %d.\n", (int)v96 % (int)v221);
              uint64_t v89 = v226;
              uint64_t v91 = v230;
              uint64_t v90 = v221;
              uint64_t v99 = v224;
              int v97 = 1;
            }
            else
            {
              ++*((_DWORD *)v89 + v100);
              if ((int)v2 >= 1)
              {
                unint64_t v101 = &v222[8 * (int)(v100 * v2)];
                int v102 = v98;
                uint64_t v103 = v2;
                do
                {
                  double v104 = *v102++;
                  *(double *)&v101[v80] = v104 + *(double *)&v101[v80];
                  v101 += 8;
                  --v103;
                }
                while (v103);
              }
            }
            uint64_t v41 = 8 * (int)v2;
            ++v96;
            uint64_t v98 = (double *)((char *)v98 + v225);
          }
          while (v96 != v91);
        }
        if ((int)v90 < 1)
        {
          uint64_t v5 = v209;
        }
        else
        {
          uint64_t v116 = 0;
          unint64_t v117 = v222;
          uint64_t v5 = v209;
          do
          {
            int v118 = *((_DWORD *)v89 + v116);
            if (v118)
            {
              if ((int)v2 >= 1)
              {
                double v119 = 1.0 / (double)v118;
                double v120 = v117;
                uint64_t v121 = v2;
                do
                {
                  *(double *)&v120[v80] = v119 * *(double *)&v120[v80];
                  v120 += 8;
                  --v121;
                }
                while (v121);
              }
            }
            else
            {
              unint64_t v122 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v89);
              CPMLLog::log(v122, CPML_LOG_ERR, "kmeans", "Initialized cluster is empty.");
              uint64_t v89 = v226;
              uint64_t v91 = v230;
              uint64_t v90 = v221;
              uint64_t v99 = v224;
              int v97 = 1;
            }
            ++v116;
            v117 += v41;
          }
          while (v116 != v90);
        }
        uint64_t v107 = (int)v2;
        unint64_t v108 = v222;
        if (!v97 && (int)v91 >= 1)
        {
          uint64_t v123 = 0;
          unint64_t v124 = (double *)&v218[8 * v216];
          do
          {
            int v125 = (int)v99[v123];
            if ((int)v2 < 1)
            {
              double v127 = 0.0;
            }
            else
            {
              double v126 = &v222[8 * (int)v2 * v125];
              double v127 = 0.0;
              unint64_t v128 = v124;
              uint64_t v129 = v2;
              do
              {
                double v130 = *v128++;
                double v127 = v127 + (*(double *)&v126[v80] - v130) * (*(double *)&v126[v80] - v130);
                v126 += 8;
                --v129;
              }
              while (v129);
            }
            *((double *)v227 + v125) = v127 + *((double *)v227 + v125);
            ++v123;
            unint64_t v124 = (double *)((char *)v124 + v41);
          }
          while (v123 != v91);
          int v131 = 0;
          int v132 = 0;
          int v133 = 0;
          int v134 = 0;
          unint64_t v135 = &v218[8 * v216];
          do
          {
            int v136 = (int)v99[v132];
            int v137 = *((_DWORD *)v89 + v136);
            if (v137 >= 2)
            {
              if ((int)v2 < 1)
              {
                double v140 = 0.0;
              }
              else
              {
                int v138 = (double *)&v135[8 * v132 * (int)v2];
                long double v139 = &v222[8 * (int)v2 * v136];
                double v140 = 0.0;
                uint64_t v141 = v2;
                do
                {
                  double v142 = *v138++;
                  double v140 = v140 + (*(double *)&v139[v80] - v142) * (*(double *)&v139[v80] - v142);
                  v139 += 8;
                  --v141;
                }
                while (v141);
              }
              if ((int)v221 < 1)
              {
                double v144 = 1.79769313e308;
              }
              else
              {
                uint64_t v143 = 0;
                double v144 = 1.79769313e308;
                v145 = v222;
                do
                {
                  if (v143 != (int)v99[v132])
                  {
                    double v146 = 0.0;
                    if ((int)v2 >= 1)
                    {
                      uint64_t v147 = v145;
                      double v148 = (double *)&v135[8 * v132 * (int)v2];
                      uint64_t v149 = v2;
                      do
                      {
                        double v150 = *v148++;
                        double v146 = v146 + (*(double *)&v147[v80] - v150) * (*(double *)&v147[v80] - v150);
                        v147 += 8;
                        --v149;
                      }
                      while (v149);
                    }
                    double v151 = (double)*((int *)v89 + v143) / ((double)*((int *)v89 + v143) + 1.0) * v146;
                    if (v151 <= v144)
                    {
                      int v134 = v143;
                      int v133 = *((_DWORD *)v89 + v143);
                      double v144 = v151;
                    }
                  }
                  ++v143;
                  v145 += v41;
                }
                while (v143 != v90);
              }
              double v152 = (double)v137 + -1.0;
              double v153 = (double)v137 / v152 * v140;
              if (v144 >= v153)
              {
                ++v131;
              }
              else
              {
                *((double *)v227 + v136) = *((double *)v227 + v136) - v153;
                *((double *)v227 + v134) = v144 + *((double *)v227 + v134);
                if ((int)v2 >= 1)
                {
                  long double v154 = &v222[8 * v134 * (int)v2];
                  double v155 = &v222[8 * (int)v2 * v136];
                  double v156 = (double *)&v135[8 * v132 * (int)v2];
                  uint64_t v157 = v2;
                  do
                  {
                    double v158 = *v156++;
                    *(double *)&v155[v80] = 1.0 / v152 * -(v158 - (double)v137 * *(double *)&v155[v80]);
                    *(double *)&v154[v80] = 1.0 / ((double)v133 + 1.0) * (v158 + (double)v133 * *(double *)&v154[v80]);
                    v154 += 8;
                    v155 += 8;
                    --v157;
                  }
                  while (v157);
                }
                int v131 = 0;
                v99[v132] = (double)v134;
                *((_DWORD *)v89 + v136) = v137 - 1;
                ++*((_DWORD *)v89 + v134);
              }
            }
            if (v132 < (int)v91 - 1) {
              ++v132;
            }
            else {
              int v132 = 0;
            }
          }
          while (v131 < (int)v91);
        }
        free(v89);
      }
      bzero(v223, v215);
      if ((int)v230 >= 1)
      {
        uint64_t v159 = 0;
        int v160 = 0;
        do
        {
          int v161 = (int)v224[v159];
          *(double *)&v84[8 * v161] = *(double *)&v84[8 * v161] + 1.0;
          if ((int)v2 >= 1)
          {
            int v162 = v2 * v161;
            double v163 = (double *)&v218[8 * v216 + 8 * v160];
            double v164 = &v108[8 * v162];
            v160 += v2;
            uint64_t v165 = v2;
            do
            {
              double v166 = *v163++;
              *(double *)&v164[v80] = v166 + *(double *)&v164[v80];
              v164 += 8;
              --v165;
            }
            while (v165);
          }
          ++v159;
        }
        while (v159 != v230);
      }
      if ((int)v221 >= 1)
      {
        uint64_t v167 = 0;
        double v168 = v108;
        do
        {
          uint64_t v169 = v2;
          double v170 = v168;
          if ((int)v2 >= 1)
          {
            do
            {
              double v171 = *(double *)&v84[8 * v167];
              if (v171 > 0.0) {
                *(double *)&v170[v80] = *(double *)&v170[v80] / v171;
              }
              v170 += 8;
              --v169;
            }
            while (v169);
          }
          ++v167;
          v168 += v41;
        }
        while (v167 != v221);
      }
      uint64_t v172 = 8 * v220;
      if ((int)v230 >= 1)
      {
        uint64_t v173 = 0;
        double v174 = (double *)&v218[8 * v216];
        do
        {
          int v175 = (int)v224[v173];
          *(double *)&v84[8 * v175] = *(double *)&v84[8 * v175] + 1.0;
          if ((int)v2 >= 1)
          {
            long double v176 = &v108[8 * (int)v2 * v175];
            uint64_t v177 = v2;
            v178 = v174;
            do
            {
              double *v178 = *v178 - *(double *)&v176[v80];
              ++v178;
              v176 += 8;
              --v177;
            }
            while (v177);
            uint64_t v179 = 0;
            int v180 = 0;
            do
            {
              uint64_t v181 = 0;
              int v182 = v180;
              uint64_t v183 = (uint64_t)&v214[8 * (int)v2 * v175 * (int)v2 + 8 * v180 + v172];
              do
              {
                *(double *)(v183 + 8 * v181) = *(double *)(v183 + 8 * v181)
                                             + *(double *)&v218[8 * v216 + 8 * v179 + 8 * v173 * v107] * v174[v181];
                ++v181;
              }
              while (v2 != v181);
              ++v179;
              int v180 = v182 + v181;
            }
            while (v179 != v2);
          }
          ++v173;
          double v174 = (double *)((char *)v174 + v41);
        }
        while (v173 != v213);
      }
      __CLPK_integer v184 = v2 * v2;
      if ((int)v221 >= 1) {
        break;
      }
LABEL_190:
      uint64_t v81 = v219 + 1;
      uint64_t v1 = v211;
      uint64_t v40 = v212;
      v80 += 8 * (int)v2 * (uint64_t)(int)v221;
      v220 += v221 * v229;
      uint64_t v3 = (int)v2;
      uint64_t v41 = 8 * (int)v2;
      if (v219 + 1 >= *((int *)v211 + 25)) {
        goto LABEL_191;
      }
    }
    int v185 = 0;
    uint64_t v186 = 0;
    uint64_t v231 = &v214[v172];
    while (1)
    {
      uint64_t v187 = 8 * v185;
      uint64_t v188 = &v228[v184 * (int)v186];
      if (*(double *)&v84[8 * v186] <= (double)(int)v2)
      {
        if ((int)v2 >= 1)
        {
          int v192 = 0;
          LODWORD(v193) = 0;
          do
          {
            int v194 = 0;
            uint64_t v193 = (int)v193;
            do
            {
              if (v192 == v194) {
                double v195 = 1.0;
              }
              else {
                double v195 = 0.0;
              }
              *(double *)&v231[8 * v185 + 8 * v193++] = v195;
              ++v194;
            }
            while (v2 != v194);
            ++v192;
          }
          while (v192 != v2);
          goto LABEL_178;
        }
      }
      else if ((int)v2 >= 1)
      {
        int v189 = 0;
        int v190 = 0;
        do
        {
          uint64_t v191 = 0;
          do
          {
            *(double *)&v231[8 * v189 + 8 * v191 + v187] = *(double *)&v231[8 * v189 + 8 * v191 + v187]
                                                         / *(double *)&v84[8 * v186];
            ++v191;
          }
          while (v2 != v191);
          ++v190;
          v189 += v2;
        }
        while (v190 != v2);
LABEL_178:
        __CLPK_integer __info = v184;
        __lwork[0] = 0;
        __CLPK_integer __lda = v2;
        dgetrf_(&__lda, &__lda, v188, &__lda, (__CLPK_integer *)v232, __lwork);
        int v196 = 0;
        double v197 = 1.0;
        uint64_t v198 = v2;
        do
        {
          double v197 = v197 * v188[v196];
          v196 += v2 + 1;
          --v198;
        }
        while (v198);
        goto LABEL_182;
      }
      __CLPK_integer __info = v184;
      __lwork[0] = 0;
      __CLPK_integer __lda = v2;
      dgetrf_(&__lda, &__lda, &v228[v184 * (int)v186], &__lda, (__CLPK_integer *)v232, __lwork);
      double v197 = 1.0;
LABEL_182:
      uint64_t v199 = (CPMLLog *)dgetri_(&__lda, v188, &__lda, (__CLPK_integer *)v232, v24, &__info, __lwork);
      if (v197 == 0.0)
      {
        v200 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v199);
        CPMLLog::log(v200, CPML_LOG_ERR, "train", "Covariance matrix has determinant zero.");
      }
      *(double *)&v84[8 * v186] = *(double *)&v84[8 * v186] / (double)v5[v186] / sqrt(v79 * fabs(v197));
      __CLPK_integer v184 = v2 * v2;
      if ((int)v2 >= 1)
      {
        int v201 = 0;
        int v202 = 0;
        do
        {
          uint64_t v203 = 0;
          do
          {
            *(double *)&v231[8 * v201 + 8 * v203 + v187] = *(double *)&v231[8 * v201 + 8 * v203 + v187] * 0.5;
            ++v203;
          }
          while (v2 != v203);
          ++v202;
          v201 += v2;
        }
        while (v202 != v2);
      }
      ++v186;
      v185 += v229;
      if (v186 == v221) {
        goto LABEL_190;
      }
    }
  }
  uint64_t v7 = (CPMLFeatureVector *)v6;
  int v8 = 0;
  while (1)
  {
    uint64_t v9 = (double **)CPMLFeatureVector::getRealVector(v7);
    int v11 = (int)CPMLFeatureVector::getYHat(v7);
    if (v11 < 0 || (int)v4 <= v11)
    {
      v205 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v10);
      CPMLLog::log(v205, CPML_LOG_ERR, "train", "ERROR: Result cardinality does not match the response class number: !(0 <= %d < %d)", v11, v4);
      free(v5);
      return 1;
    }
    uint64_t v12 = *v9;
    if ((int)v2 != v9[1] - *v9) {
      break;
    }
    if ((int)v2 >= 1)
    {
      uint64_t v13 = 0;
      LODWORD(v14) = 0;
      long long v15 = (double *)v1[15];
      uint64_t v16 = (double *)v1[16];
      do
      {
        v15[v13] = v12[v13] + v15[v13];
        uint64_t v14 = (int)v14;
        uint64_t v17 = v2;
        uint64_t v18 = v12;
        do
        {
          double v19 = *v18++;
          v16[v14] = v16[v14] + v12[v13] * v19;
          ++v14;
          --v17;
        }
        while (v17);
        ++v13;
      }
      while (v13 != v2);
    }
    ++v5[v11];
    ++v8;
    uint64_t v7 = (CPMLFeatureVector *)(*(uint64_t (**)(void *))(*(void *)v1[10] + 32))(v1[10]);
    if (!v7) {
      goto LABEL_14;
    }
  }
  uint64_t v206 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v10);
  CPMLLog::log(v206, CPML_LOG_ERR, "train", "ERROR: Model dimension and feature dimension mismatch: %d != %d\n", (unint64_t)((char *)v9[1] - (char *)*v9) >> 3, v2);
  free(v5);
  return 2;
}

uint64_t CPGMMClassfier::eval(uint64_t a1, CPMLFeatureVector *this)
{
  uint64_t v2 = this;
  uint64_t v3 = (void *)a1;
  uint64_t v4 = *(unsigned int *)(a1 + 96);
  uint64_t v5 = *(unsigned int *)(a1 + 100);
  int v6 = *(_DWORD *)(a1 + 104);
  uint64_t v7 = *(void *)(a1 + 136);
  uint64_t v8 = *(void *)(a1 + 144);
  uint64_t v9 = *(double **)(a1 + 152);
  IntVector = (void *)CPMLFeatureVector::getIntVector(this);
  uint64_t RealVector = (CPMLLog *)CPMLFeatureVector::getRealVector(v2);
  if (IntVector[1] == *IntVector)
  {
    uint64_t v14 = *(void *)RealVector;
    uint64_t v15 = *((void *)RealVector + 1);
    uint64_t v16 = v15 - *(void *)RealVector;
    if (v15 == *(void *)RealVector)
    {
      uint64_t v20 = (double *)v3[21];
    }
    else
    {
      uint64_t v17 = 0;
      unint64_t v18 = v16 >> 3;
      uint64_t v19 = v3[15];
      uint64_t v20 = (double *)v3[21];
      if (v18 <= 1) {
        unint64_t v18 = 1;
      }
      do
      {
        v20[v17] = *(double *)(v14 + 8 * v17) - *(double *)(v19 + 8 * v17);
        ++v17;
      }
      while (v18 != v17);
    }
    uint64_t v21 = v3[20];
    if ((int)v4 >= 1)
    {
      uint64_t v22 = 0;
      int v23 = 0;
      uint64_t v24 = v3[16];
      do
      {
        long long v25 = (double *)(v24 + 8 * v23);
        double v26 = 0.0;
        int v27 = v20;
        uint64_t v28 = v4;
        do
        {
          double v29 = *v25++;
          double v30 = v29;
          double v31 = *v27++;
          double v26 = v26 + v30 * v31;
          --v28;
        }
        while (v28);
        *(double *)(v21 + 8 * v22) = v26;
        v23 += v4;
        ++v22;
      }
      while (v22 != v4);
    }
    if ((int)v5 < 1)
    {
      double v59 = -1.0;
    }
    else
    {
      unsigned int v60 = v2;
      uint64_t v61 = v5;
      uint64_t v32 = 0;
      double v33 = 0.0;
      int v34 = -1;
      int v35 = v6;
      uint64_t v36 = v9;
      double v62 = v3;
      do
      {
        int v37 = v35;
        if (v35 <= 0 && (int v37 = *(_DWORD *)(v3[14] + 4 * v32), v37 < 1))
        {
          double v40 = 0.0;
        }
        else
        {
          int v64 = v34;
          uint64_t v65 = v32;
          int v66 = v36;
          int v38 = 0;
          unint64_t v39 = (double *)v3[22];
          uint64_t v63 = (v37 - 1);
          double v40 = 0.0;
          int v67 = v37;
          do
          {
            double v41 = 0.0;
            if ((int)v4 >= 1)
            {
              for (uint64_t i = 0; i != v4; ++i)
                v20[i] = *(double *)(v21 + i * 8) - *(double *)(v7 + i * 8);
              uint64_t v43 = 0;
              int v44 = 0;
              do
              {
                uint64_t v45 = 8 * v44;
                double v46 = 0.0;
                double v47 = v20;
                uint64_t v48 = v4;
                do
                {
                  double v49 = *v47++;
                  double v46 = v46 + *(double *)(v8 + v45) * v49;
                  v45 += 8;
                  --v48;
                }
                while (v48);
                v39[v43] = v46;
                v44 += v4;
                ++v43;
              }
              while (v43 != v4);
              double v41 = 0.0;
              uint64_t v50 = v4;
              uint64_t v51 = v20;
              unint64_t v52 = v39;
              do
              {
                double v53 = *v51++;
                double v54 = v53;
                double v55 = *v52++;
                double v41 = v41 - v54 * v55;
                --v50;
              }
              while (v50);
            }
            double v56 = *v36++;
            double v40 = v40 + v56 * exp(v41);
            v7 += 8 * (int)v4;
            v8 += 8 * (v4 * v4);
            ++v38;
          }
          while (v38 != v67);
          uint64_t v32 = v65;
          uint64_t v36 = &v66[v63 + 1];
          uint64_t v5 = v61;
          uint64_t v3 = v62;
          int v35 = v6;
          int v34 = v64;
        }
        if (v40 > v33 || v34 < 0)
        {
          double v33 = v40;
          int v34 = v32;
        }
        ++v32;
      }
      while (v32 != v5);
      double v59 = (double)v34;
      uint64_t v2 = v60;
    }
    CPMLFeatureVector::setYHat((uint64_t)v2, v59);
    return 0;
  }
  else
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(RealVector);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "eval", "Feature vector in Gaussian mixture model predict should not have integer features.");
    return 1;
  }
}

uint64_t CPGMMClassfier::errorString(CPGMMClassfier *this)
{
  return 0;
}

uint64_t CPGMMClassfier::requireRealOnly(CPGMMClassfier *this)
{
  return 1;
}

BOOL CPMLDelegateEngineNaiveBayes::preProcessGetCountAndYCardinality(id *this, double *a2, double *a3)
{
  id v6 = this[1];
  id v7 = *this;
  BOOL v8 = (objc_opt_respondsToSelector() & 1) != 0
    && [v7 preProcessGetCountAndYCardinality:v6 count:a2 withCardY:a3] == 1;

  return v8;
}

void sub_21433F0E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL CPMLDelegateEngineNaiveBayes::preProcessGetCountY(id *this, double *a2, int a3)
{
  id v6 = this[1];
  id v7 = *this;
  BOOL v8 = (objc_opt_respondsToSelector() & 1) != 0 && [v7 preProcessGetCountY:v6 count:a2 withY:a3] == 1;

  return v8;
}

void sub_21433F188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL CPMLDelegateEngineNaiveBayes::preProcessGetCountXGivenYAndSetXCardinality(id *this, double *a2, int a3, int a4, int a5, double *a6)
{
  id v12 = this[1];
  id v13 = *this;
  BOOL v14 = (objc_opt_respondsToSelector() & 1) != 0
     && [v13 preProcessGetCountXGivenYAndSetXCardinality:v12 count:a2 withXCol:a3 withX:a4 withY:a5 withCardinalityX:a6] == 1;

  return v14;
}

void sub_21433F250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL CPMLDelegateEngineNaiveBayes::preProcessSetCount(id *this, double a2)
{
  id v4 = this[1];
  id v5 = *this;
  BOOL v6 = (objc_opt_respondsToSelector() & 1) != 0 && [v5 preProcessSetCount:v4 withNumberY:a2] == 1;

  return v6;
}

void sub_21433F2F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL CPMLDelegateEngineNaiveBayes::preProcessSetCountY(id *this, int a2, double a3)
{
  id v6 = this[1];
  id v7 = *this;
  BOOL v8 = (objc_opt_respondsToSelector() & 1) != 0
    && [v7 preProcessSetCountY:v6 withY:a2 withCount:a3] == 1;

  return v8;
}

void sub_21433F398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL CPMLDelegateEngineNaiveBayes::preProcessSetCountXGivenY(id *this, int a2, int a3, int a4, double a5)
{
  id v10 = this[1];
  id v11 = *this;
  BOOL v12 = (objc_opt_respondsToSelector() & 1) != 0
     && [v11 preProcessSetCountXGivenY:v10 withXCol:a2 withX:a3 withY:a4 withValue:a5] == 1;

  return v12;
}

void sub_21433F458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL CPMLDelegateEngineNaiveBayes::preProcessSetCardinalityXGivenY(id *this, int a2, int a3, double a4)
{
  id v8 = this[1];
  id v9 = *this;
  BOOL v10 = (objc_opt_respondsToSelector() & 1) != 0
     && [v9 preProcessSetCardinalityXGivenY:v8 withXCol:a2 withY:a3 cardinalityValue:a4] == 1;

  return v10;
}

void sub_21433F508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL CPMLDelegateEngineNaiveBayes::preProcessUpdateNaiveBayes(id *a1, uint64_t *a2, uint64_t a3)
{
  id v6 = a1[1];
  id v7 = *a1;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v17 = a3;
    unint64_t v18 = v7;
    id v8 = objc_opt_new();
    uint64_t v9 = *a2;
    if (a2[1] != *a2)
    {
      unint64_t v10 = 0;
      do
      {
        std::string __p = 0;
        uint64_t v20 = 0;
        uint64_t v21 = 0;
        std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, *(const void **)(v9 + 24 * v10), *(void *)(v9 + 24 * v10 + 8), (uint64_t)(*(void *)(v9 + 24 * v10 + 8) - *(void *)(v9 + 24 * v10)) >> 2);
        id v11 = objc_opt_new();
        if (v20 != __p)
        {
          unint64_t v12 = 0;
          do
          {
            id v13 = objc_alloc(NSNumber);
            BOOL v14 = (void *)[v13 initWithInt:*((unsigned int *)__p + v10)];
            [v11 addObject:v14];

            ++v12;
          }
          while (v12 < (v20 - (unsigned char *)__p) >> 2);
        }
        objc_msgSend(v8, "addObject:", v11, v17);

        if (__p)
        {
          uint64_t v20 = __p;
          operator delete(__p);
        }
        ++v10;
        uint64_t v9 = *a2;
      }
      while (0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3) > v10);
    }
    BOOL v15 = objc_msgSend(v18, "preProcessUpdateNaiveBayes:withRow:withY:", v6, v8, (int)v17, v17) == 1;

    id v7 = v18;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

void sub_21433F6BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *__p, uint64_t a13)
{
  _Unwind_Resume(a1);
}

BOOL CPMLDelegateEngineNaiveBayes::preProcessPredictSorted(id *a1, uint64_t *a2, void *a3)
{
  id v5 = a1[1];
  id v6 = *a1;
  if (objc_opt_respondsToSelector())
  {
    int v34 = v6;
    id v7 = objc_opt_new();
    uint64_t v8 = *a2;
    if (a2[1] != *a2)
    {
      unint64_t v9 = 0;
      do
      {
        std::string __p = 0;
        int v37 = 0;
        int v38 = 0;
        std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, *(const void **)(v8 + 24 * v9), *(void *)(v8 + 24 * v9 + 8), (uint64_t)(*(void *)(v8 + 24 * v9 + 8) - *(void *)(v8 + 24 * v9)) >> 2);
        unint64_t v10 = objc_opt_new();
        if (v37 != __p)
        {
          unint64_t v11 = 0;
          do
          {
            id v12 = objc_alloc(NSNumber);
            id v13 = (void *)[v12 initWithInt:*((unsigned int *)__p + v9)];
            [v10 addObject:v13];

            ++v11;
          }
          while (v11 < (v37 - (unsigned char *)__p) >> 2);
        }
        [v7 addObject:v10];

        if (__p)
        {
          int v37 = (char *)__p;
          operator delete(__p);
        }
        ++v9;
        uint64_t v8 = *a2;
      }
      while (0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3) > v9);
    }
    uint64_t v33 = [v34 preProcessPredictSorted:v5 withRow:v7];
    for (unint64_t i = 0; i < [v7 count]; ++i)
    {
      uint64_t v15 = *a3 + 24 * i;
      int v37 = 0;
      int v38 = 0;
      std::string __p = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, *(const void **)v15, *(void *)(v15 + 8), (uint64_t)(*(void *)(v15 + 8) - *(void *)v15) >> 2);
      uint64_t v16 = [v7 objectAtIndexedSubscript:i];
      for (unint64_t j = 0; j < [v16 count]; ++j)
      {
        unint64_t v18 = [v16 objectAtIndexedSubscript:i];
        int v19 = [v18 integerValue];
        int v20 = v19;
        uint64_t v21 = v37;
        if (v37 >= v38)
        {
          int v23 = (char *)__p;
          uint64_t v24 = (v37 - (unsigned char *)__p) >> 2;
          unint64_t v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62) {
            std::vector<double>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v26 = v38 - (unsigned char *)__p;
          if ((v38 - (unsigned char *)__p) >> 1 > v25) {
            unint64_t v25 = v26 >> 1;
          }
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v25;
          }
          if (v27)
          {
            uint64_t v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v38, v27);
            int v23 = (char *)__p;
            uint64_t v21 = v37;
          }
          else
          {
            uint64_t v28 = 0;
          }
          double v29 = &v28[4 * v24];
          *(_DWORD *)double v29 = v20;
          uint64_t v22 = v29 + 4;
          while (v21 != v23)
          {
            int v30 = *((_DWORD *)v21 - 1);
            v21 -= 4;
            *((_DWORD *)v29 - 1) = v30;
            v29 -= 4;
          }
          std::string __p = v29;
          int v37 = v22;
          int v38 = &v28[4 * v27];
          if (v23) {
            operator delete(v23);
          }
        }
        else
        {
          *(_DWORD *)int v37 = v19;
          uint64_t v22 = v21 + 4;
        }
        int v37 = v22;
      }
      if (__p)
      {
        int v37 = (char *)__p;
        operator delete(__p);
      }
    }
    BOOL v31 = v33 == 1;

    id v6 = v34;
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

void sub_21433FA20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, void *__p, uint64_t a15)
{
  _Unwind_Resume(a1);
}

void CPMLFeatureVector::CPMLFeatureVector(CPMLFeatureVector *this)
{
}

void CPMLFeatureVector::~CPMLFeatureVector(CPMLFeatureVector *this)
{
  *((void *)this + 6) = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v2 = *((void *)this + 1);
  if (v2)
  {
    uint64_t v3 = *(void **)v2;
    if (*(void *)v2)
    {
      *(void *)(v2 + 8) = v3;
      operator delete(v3);
    }
    MEMORY[0x21669DB80](v2, 0x10C402FEFCB83);
  }
  uint64_t v4 = *((void *)this + 2);
  if (v4)
  {
    id v5 = *(void **)v4;
    if (*(void *)v4)
    {
      *(void *)(v4 + 8) = v5;
      operator delete(v5);
    }
    MEMORY[0x21669DB80](v4, 0x80C40D6874129);
  }
  uint64_t v6 = *((void *)this + 3);
  if (*((void *)this + 4) != v6)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = *(void *)(v6 + v7);
      if (v9)
      {
        unint64_t v10 = *(void **)v9;
        if (*(void *)v9)
        {
          *(void *)(v9 + 8) = v10;
          operator delete(v10);
        }
        MEMORY[0x21669DB80](v9, 0x10C402FEFCB83);
      }
      uint64_t v11 = *(void *)(v6 + v7 + 8);
      if (v11)
      {
        id v12 = *(void **)v11;
        if (*(void *)v11)
        {
          *(void *)(v11 + 8) = v12;
          operator delete(v12);
        }
        MEMORY[0x21669DB80](v11, 0x80C40D6874129);
      }
      ++v8;
      uint64_t v6 = *((void *)this + 3);
      v7 += 16;
    }
    while (v8 < (*((void *)this + 4) - v6) >> 4);
  }
  id v13 = (char *)*((void *)this + 8);
  if (v13 != *((char **)this + 7))
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    id v13 = (char *)*((void *)this + 7);
    do
    {
      uint64_t v16 = *(void *)&v13[v14];
      if (v16)
      {
        uint64_t v17 = *(void **)v16;
        if (*(void *)v16)
        {
          *(void *)(v16 + 8) = v17;
          operator delete(v17);
        }
        MEMORY[0x21669DB80](v16, 0x10C402FEFCB83);
      }
      uint64_t v18 = *(void *)&v13[v14 + 8];
      if (v18)
      {
        int v19 = *(void **)v18;
        if (*(void *)v18)
        {
          *(void *)(v18 + 8) = v19;
          operator delete(v19);
        }
        MEMORY[0x21669DB80](v18, 0x80C40D6874129);
      }
      ++v15;
      id v13 = (char *)*((void *)this + 7);
      v14 += 16;
    }
    while (v15 < (uint64_t)(*((void *)this + 8) - (void)v13) >> 4);
  }
  int v20 = (void *)*((void *)this + 10);
  if (v20)
  {
    *((void *)this + 11) = v20;
    operator delete(v20);
    id v13 = (char *)*((void *)this + 7);
  }
  if (v13)
  {
    *((void *)this + 8) = v13;
    operator delete(v13);
  }
  uint64_t v21 = (void *)*((void *)this + 3);
  if (v21)
  {
    *((void *)this + 4) = v21;
    operator delete(v21);
  }
}

uint64_t CPMLFeatureVector::getIntVector(CPMLFeatureVector *this)
{
  return *((void *)this + 1);
}

uint64_t CPMLFeatureVector::getRealVector(CPMLFeatureVector *this)
{
  return *((void *)this + 2);
}

uint64_t CPMLFeatureVector::getXVectorVector(CPMLFeatureVector *this)
{
  return (uint64_t)this + 24;
}

uint64_t CPMLFeatureVector::getYVectorVector(CPMLFeatureVector *this)
{
  return (uint64_t)this + 56;
}

double CPMLFeatureVector::getYHat(CPMLFeatureVector *this)
{
  return *((double *)this + 6);
}

void CPMLFeatureVector::insertIntVClass(CPMLFeatureVector *this, int a2)
{
  uint64_t v3 = *((void *)this + 1);
  uint64_t v4 = *(_DWORD **)(v3 + 8);
  unint64_t v5 = *(void *)(v3 + 16);
  if ((unint64_t)v4 >= v5)
  {
    uint64_t v7 = *(_DWORD **)v3;
    uint64_t v8 = ((uint64_t)v4 - *(void *)v3) >> 2;
    unint64_t v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 62) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - (void)v7;
    if (v10 >> 1 > v9) {
      unint64_t v9 = v10 >> 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      id v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v3 + 16, v11);
      uint64_t v7 = *(_DWORD **)v3;
      uint64_t v4 = *(_DWORD **)(v3 + 8);
    }
    else
    {
      id v12 = 0;
    }
    id v13 = &v12[4 * v8];
    uint64_t v14 = &v12[4 * v11];
    *(_DWORD *)id v13 = a2;
    uint64_t v6 = v13 + 4;
    while (v4 != v7)
    {
      int v15 = *--v4;
      *((_DWORD *)v13 - 1) = v15;
      v13 -= 4;
    }
    *(void *)uint64_t v3 = v13;
    *(void *)(v3 + 8) = v6;
    *(void *)(v3 + 16) = v14;
    if (v7) {
      operator delete(v7);
    }
  }
  else
  {
    *uint64_t v4 = a2;
    uint64_t v6 = v4 + 1;
  }
  *(void *)(v3 + 8) = v6;
}

void CPMLFeatureVector::insertRealVClass(CPMLFeatureVector *this, double a2)
{
  uint64_t v3 = *((void *)this + 2);
  uint64_t v4 = *(double **)(v3 + 8);
  unint64_t v5 = *(void *)(v3 + 16);
  if ((unint64_t)v4 >= v5)
  {
    uint64_t v7 = *(double **)v3;
    uint64_t v8 = ((uint64_t)v4 - *(void *)v3) >> 3;
    unint64_t v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - (void)v7;
    if (v10 >> 2 > v9) {
      unint64_t v9 = v10 >> 2;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      id v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3 + 16, v11);
      uint64_t v7 = *(double **)v3;
      uint64_t v4 = *(double **)(v3 + 8);
    }
    else
    {
      id v12 = 0;
    }
    id v13 = (double *)&v12[8 * v8];
    uint64_t v14 = &v12[8 * v11];
    *id v13 = a2;
    uint64_t v6 = v13 + 1;
    while (v4 != v7)
    {
      uint64_t v15 = *((void *)v4-- - 1);
      *((void *)v13-- - 1) = v15;
    }
    *(void *)uint64_t v3 = v13;
    *(void *)(v3 + 8) = v6;
    *(void *)(v3 + 16) = v14;
    if (v7) {
      operator delete(v7);
    }
  }
  else
  {
    *uint64_t v4 = a2;
    uint64_t v6 = v4 + 1;
  }
  *(void *)(v3 + 8) = v6;
}

void *CPMLFeatureVector::insertRealVClass(CPMLFeatureVector *this, double a2, int a3)
{
  __n128 result = (void *)*((void *)this + 2);
  if (a3 >= (unint64_t)((uint64_t)(result[1] - *result) >> 3)) {
    std::vector<VectorClass>::__throw_out_of_range[abi:ne180100]();
  }
  *(double *)(*result + 8 * a3) = a2;
  return result;
}

void CPMLFeatureVector::insertIntToLastVVClass(CPMLFeatureVector *this, int a2)
{
  uint64_t v3 = *((void *)this + 4);
  if (v3 == *((void *)this + 3)) {
    operator new();
  }
  uint64_t v4 = *(void *)(v3 - 16);
  unint64_t v5 = *(_DWORD **)(v4 + 8);
  unint64_t v6 = *(void *)(v4 + 16);
  if ((unint64_t)v5 >= v6)
  {
    uint64_t v8 = *(_DWORD **)v4;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v4) >> 2;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v6 - (void)v8;
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
      id v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v4 + 16, v12);
      uint64_t v8 = *(_DWORD **)v4;
      unint64_t v5 = *(_DWORD **)(v4 + 8);
    }
    else
    {
      id v13 = 0;
    }
    uint64_t v14 = &v13[4 * v9];
    uint64_t v15 = &v13[4 * v12];
    *(_DWORD *)uint64_t v14 = a2;
    uint64_t v7 = v14 + 4;
    while (v5 != v8)
    {
      int v16 = *--v5;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }
    *(void *)uint64_t v4 = v14;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *unint64_t v5 = a2;
    uint64_t v7 = v5 + 1;
  }
  *(void *)(v4 + 8) = v7;
}

void sub_2143401A0(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

void CPMLFeatureVector::insertRealToLastVVClass(CPMLFeatureVector *this, double a2)
{
  uint64_t v3 = *((void *)this + 4);
  if (v3 == *((void *)this + 3)) {
    operator new();
  }
  uint64_t v4 = *(void *)(v3 - 8);
  unint64_t v5 = *(double **)(v4 + 8);
  unint64_t v6 = *(void *)(v4 + 16);
  if ((unint64_t)v5 >= v6)
  {
    uint64_t v8 = *(double **)v4;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v4) >> 3;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v6 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      id v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v4 + 16, v12);
      uint64_t v8 = *(double **)v4;
      unint64_t v5 = *(double **)(v4 + 8);
    }
    else
    {
      id v13 = 0;
    }
    uint64_t v14 = (double *)&v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    *uint64_t v14 = a2;
    uint64_t v7 = v14 + 1;
    while (v5 != v8)
    {
      uint64_t v16 = *((void *)v5-- - 1);
      *((void *)v14-- - 1) = v16;
    }
    *(void *)uint64_t v4 = v14;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *unint64_t v5 = a2;
    uint64_t v7 = v5 + 1;
  }
  *(void *)(v4 + 8) = v7;
}

void sub_214340408(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

void CPMLFeatureVector::insertNewVCIntoVVClass(CPMLFeatureVector *this)
{
}

void sub_2143405A8(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

void CPMLFeatureVector::insertIntVectorToVVClass()
{
}

void sub_214340710(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

void CPMLFeatureVector::insertRealVectorToVVClass()
{
}

void sub_214340878(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

void CPMLFeatureVector::insertYIntVClass(CPMLFeatureVector *this, int a2)
{
  uint64_t v3 = *((void *)this + 8);
  if (v3 == *((void *)this + 7)) {
    operator new();
  }
  uint64_t v4 = *(void *)(v3 - 16);
  unint64_t v5 = *(_DWORD **)(v4 + 8);
  unint64_t v6 = *(void *)(v4 + 16);
  if ((unint64_t)v5 >= v6)
  {
    uint64_t v8 = *(_DWORD **)v4;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v4) >> 2;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v6 - (void)v8;
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
      id v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v4 + 16, v12);
      uint64_t v8 = *(_DWORD **)v4;
      unint64_t v5 = *(_DWORD **)(v4 + 8);
    }
    else
    {
      id v13 = 0;
    }
    uint64_t v14 = &v13[4 * v9];
    uint64_t v15 = &v13[4 * v12];
    *(_DWORD *)uint64_t v14 = a2;
    uint64_t v7 = v14 + 4;
    while (v5 != v8)
    {
      int v16 = *--v5;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }
    *(void *)uint64_t v4 = v14;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *unint64_t v5 = a2;
    uint64_t v7 = v5 + 1;
  }
  *(void *)(v4 + 8) = v7;
}

void sub_214340AE0(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

void CPMLFeatureVector::insertYRealVClass(CPMLFeatureVector *this, double a2)
{
  uint64_t v3 = *((void *)this + 8);
  if (v3 == *((void *)this + 7)) {
    operator new();
  }
  uint64_t v4 = *(void *)(v3 - 8);
  unint64_t v5 = *(double **)(v4 + 8);
  unint64_t v6 = *(void *)(v4 + 16);
  if ((unint64_t)v5 >= v6)
  {
    uint64_t v8 = *(double **)v4;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v4) >> 3;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v6 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      id v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v4 + 16, v12);
      uint64_t v8 = *(double **)v4;
      unint64_t v5 = *(double **)(v4 + 8);
    }
    else
    {
      id v13 = 0;
    }
    uint64_t v14 = (double *)&v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    *uint64_t v14 = a2;
    uint64_t v7 = v14 + 1;
    while (v5 != v8)
    {
      uint64_t v16 = *((void *)v5-- - 1);
      *((void *)v14-- - 1) = v16;
    }
    *(void *)uint64_t v4 = v14;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *unint64_t v5 = a2;
    uint64_t v7 = v5 + 1;
  }
  *(void *)(v4 + 8) = v7;
}

void sub_214340D48(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

uint64_t CPMLFeatureVector::setYHat(uint64_t this, double a2)
{
  *(double *)(this + 48) = a2;
  return this;
}

char *CPMLFeatureVector::setYHatProbList(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 80);
  __n128 result = (char *)(a1 + 80);
  *((void *)result + 1) = v3;
  if (result != (char *)a2) {
    return std::vector<ProbIndex>::__assign_with_size[abi:ne180100]<ProbIndex*,ProbIndex*>(result, *(char **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 4);
  }
  return result;
}

_DWORD *CPMLFeatureVector::setYHatVectorPosition(_DWORD *this, int a2)
{
  *this = a2;
  return this;
}

void CPMLFeatureVector::resetAll(CPMLFeatureVector *this)
{
  uint64_t v2 = (void *)*((void *)this + 2);
  *(void *)(*((void *)this + 1) + 8) = **((void **)this + 1);
  v2[1] = *v2;
  *((void *)this + 4) = *((void *)this + 3);
  *((double *)this + 6) = nan("");
  *((void *)this + 8) = *((void *)this + 7);
}

pthread_mutex_t *CPMLFeatureVector::dumpVectorClass(CPMLLog *a1, void **a2)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(a1);
  uint64_t v4 = (CPMLLog *)CPMLLog::log(CPMLLog, CPML_LOG_DEBUG, "dumpVectorClass", "INT: ");
  if ((*a2)[1] != **a2)
  {
    unint64_t v5 = 0;
    do
    {
      unint64_t v6 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v4);
      uint64_t v4 = (CPMLLog *)CPMLLog::log(v6, CPML_LOG_DEBUG, "dumpVectorClass", "%d ", *(_DWORD *)(**a2 + 4 * v5++));
    }
    while (v5 < (uint64_t)((*a2)[1] - **a2) >> 2);
  }
  uint64_t v7 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v4);
  uint64_t v8 = (CPMLLog *)CPMLLog::log(v7, CPML_LOG_DEBUG, "dumpVectorClass", "\n ");
  uint64_t v9 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v8);
  unint64_t v10 = (CPMLLog *)CPMLLog::log(v9, CPML_LOG_DEBUG, "dumpVectorClass", "REAL: ");
  if (a2[1][1] != *a2[1])
  {
    unint64_t v11 = 0;
    do
    {
      unint64_t v12 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v10);
      unint64_t v10 = (CPMLLog *)CPMLLog::log(v12, CPML_LOG_DEBUG, "dumpVectorClass", "%f \n", *(double *)(*a2[1] + 8 * v11++));
    }
    while (v11 < (uint64_t)(a2[1][1] - *a2[1]) >> 3);
  }
  id v13 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v10);
  int v14 = CPML_LOG_DEBUG;

  return CPMLLog::log(v13, v14, "dumpVectorClass", "\n ");
}

CPMLLog *CPMLFeatureVector::dumpAll(CPMLFeatureVector *this)
{
  CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(this);
  uint64_t v3 = (CPMLLog *)CPMLLog::log(CPMLLog, CPML_LOG_DEBUG, "dumpAll", "-- DUMPALL--\n");
  uint64_t v4 = (CPMLLog *)CPMLFeatureVector::dumpVectorClass(v3, (void **)this + 1);
  unint64_t v5 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v4);
  unint64_t v6 = (CPMLLog *)CPMLLog::log(v5, CPML_LOG_DEBUG, "dumpAll", "yHat %lf \n", *((double *)this + 6));
  uint64_t v7 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v6);
  uint64_t v8 = (CPMLLog *)CPMLLog::log(v7, CPML_LOG_DEBUG, "dumpAll", "-- DUMP X VECTOR--\n");
  uint64_t v9 = *((void *)this + 3);
  if (*((void *)this + 4) != v9)
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    do
    {
      unint64_t v12 = (CPMLLog *)CPMLFeatureVector::dumpVectorClass(v8, (void **)(v9 + v10));
      id v13 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v12);
      uint64_t v8 = (CPMLLog *)CPMLLog::log(v13, CPML_LOG_DEBUG, "dumpAll", "\n");
      ++v11;
      uint64_t v9 = *((void *)this + 3);
      v10 += 16;
    }
    while (v11 < (*((void *)this + 4) - v9) >> 4);
  }
  int v14 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v8);
  __n128 result = (CPMLLog *)CPMLLog::log(v14, CPML_LOG_DEBUG, "dumpAll", "-- DUMP Y VECTOR--");
  uint64_t v16 = *((void *)this + 7);
  if (*((void *)this + 8) != v16)
  {
    uint64_t v17 = 0;
    unint64_t v18 = 0;
    do
    {
      int v19 = (CPMLLog *)CPMLFeatureVector::dumpVectorClass(result, (void **)(v16 + v17));
      int v20 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v19);
      __n128 result = (CPMLLog *)CPMLLog::log(v20, CPML_LOG_DEBUG, "dumpAll", "\n");
      ++v18;
      uint64_t v16 = *((void *)this + 7);
      v17 += 16;
    }
    while (v18 < (*((void *)this + 8) - v16) >> 4);
  }
  return result;
}

void CPMLFeatureVector::resizeRealVector(CPMLFeatureVector *this, int a2)
{
}

void VectorClass::VectorClass()
{
}

char *std::vector<ProbIndex>::__assign_with_size[abi:ne180100]<ProbIndex*,ProbIndex*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 4)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      uint64_t v7[2] = 0;
    }
    if (a4 >> 60) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
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
    __n128 result = std::vector<ProbIndex>::__vallocate[abi:ne180100](v7, v11);
    id v13 = (char *)v7[1];
    unint64_t v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      unint64_t v18 = v9;
      int v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  unint64_t v12 = (void **)(result + 8);
  int v14 = (unsigned char *)*((void *)result + 1);
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
    unint64_t v18 = v9;
    int v19 = v16;
LABEL_18:
    __n128 result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *unint64_t v12 = &v9[v17];
  return result;
}

char *std::vector<ProbIndex>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::valarray<char>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void CPMLNaiveBayesAdaptor::CPMLNaiveBayesAdaptor(CPMLNaiveBayesAdaptor *this, CPMLSerialization *a2)
{
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_DWORD *)this + 16) = 1065353216;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *((_DWORD *)this + 26) = 1065353216;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_DWORD *)this + 36) = 1065353216;
  *((void *)this + 21) = 0;
  *((void *)this + 22) = 0;
  *((void *)this + 19) = 0;
  *((void *)this + 2(*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0) = 0;
  *(void *)this = &unk_26C50FEF8;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
}

void CPMLNaiveBayesAdaptor::~CPMLNaiveBayesAdaptor(CPMLNaiveBayesAdaptor *this)
{
  *(void *)this = &unk_26C510070;
  uint64_t v2 = (void *)*((void *)this + 20);
  if (v2)
  {
    *((void *)this + 21) = v2;
    operator delete(v2);
  }
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)this + 112);
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)this + 72);
  std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::~__hash_table((uint64_t)this + 32);
}

double CPMLNaiveBayesAdaptor::get_count(CPMLNaiveBayesAdaptor *this, double *a2)
{
  uint64_t v4 = (id *)*((void *)this + 19);
  if (v4)
  {
    double v12 = -1.0;
    if (CPMLDelegateEngineNaiveBayes::preProcessGetCountAndYCardinality(v4, &v12, a2)) {
      return v12;
    }
  }
  unint64_t v6 = (char *)this + 16;
  if (*((double *)this + 2) <= 0.0 || (double v7 = *((double *)this + 3), v7 <= 0.0))
  {
    uint64_t v8 = sqlite3_mprintf("select rowCountY from rowCountY;");
    (*(void (**)(void, char *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), (char *)this + 16, v8);
    if (v8) {
      sqlite3_free(v8);
    }
    uint64_t v9 = sqlite3_mprintf("select count (DISTINCT yMap) from yCount;");
    uint64_t v10 = *((void *)this + 1);
    unint64_t v11 = (double *)((char *)this + 24);
    (*(void (**)(uint64_t, double *, char *))(*(void *)v10 + 224))(v10, v11, v9);
    if (v9) {
      sqlite3_free(v9);
    }
    double v7 = *v11;
  }
  *a2 = v7;
  return *(double *)v6;
}

void CPMLNaiveBayesAdaptor::get_cy(CPMLNaiveBayesAdaptor *this, int a2)
{
  int v20 = a2;
  double v19 = -1.0;
  uint64_t v3 = (id *)*((void *)this + 19);
  if (!v3 || !CPMLDelegateEngineNaiveBayes::preProcessGetCountY(v3, &v19, a2))
  {
    if (std::__hash_table<std::__hash_value_type<int,double>,std::__unordered_map_hasher<int,std::__hash_value_type<int,double>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,double>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,double>>>::find<int>((void *)this + 4, &v20))
    {
      uint64_t v21 = &v20;
      std::__hash_table<std::__hash_value_type<int,double>,std::__unordered_map_hasher<int,std::__hash_value_type<int,double>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,double>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,double>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)this + 32, &v20, (uint64_t)&std::piecewise_construct, &v21);
    }
    else
    {
      uint64_t v4 = sqlite3_mprintf("select yCount from yCount where yMap=%d;", v20);
      int v5 = (*(uint64_t (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v19, v4);
      if (v4) {
        sqlite3_free(v4);
      }
      double v6 = v19;
      if (fabs(v19) != INFINITY)
      {
        uint64_t v21 = &v20;
        *((double *)std::__hash_table<std::__hash_value_type<int,double>,std::__unordered_map_hasher<int,std::__hash_value_type<int,double>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,double>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,double>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)this + 32, &v20, (uint64_t)&std::piecewise_construct, &v21)+ 3) = v6;
        if (v5 != 101)
        {
          unint64_t v7 = *((void *)this + 22);
          uint64_t v8 = (char *)*((void *)this + 21);
          if ((unint64_t)v8 >= v7)
          {
            uint64_t v10 = (char *)*((void *)this + 20);
            uint64_t v11 = (v8 - v10) >> 2;
            if ((unint64_t)(v11 + 1) >> 62) {
              std::vector<double>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v12 = v7 - (void)v10;
            unint64_t v13 = (uint64_t)(v7 - (void)v10) >> 1;
            if (v13 <= v11 + 1) {
              unint64_t v13 = v11 + 1;
            }
            if (v12 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v14 = v13;
            }
            if (v14)
            {
              unint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 176, v14);
              uint64_t v10 = (char *)*((void *)this + 20);
              uint64_t v8 = (char *)*((void *)this + 21);
            }
            else
            {
              unint64_t v15 = 0;
            }
            uint64_t v16 = &v15[4 * v11];
            size_t v17 = &v15[4 * v14];
            *(_DWORD *)uint64_t v16 = v20;
            uint64_t v9 = v16 + 4;
            while (v8 != v10)
            {
              int v18 = *((_DWORD *)v8 - 1);
              v8 -= 4;
              *((_DWORD *)v16 - 1) = v18;
              v16 -= 4;
            }
            *((void *)this + 2(*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0) = v16;
            *((void *)this + 21) = v9;
            *((void *)this + 22) = v17;
            if (v10) {
              operator delete(v10);
            }
          }
          else
          {
            *(_DWORD *)uint64_t v8 = v20;
            uint64_t v9 = v8 + 4;
          }
          *((void *)this + 21) = v9;
        }
      }
    }
  }
}

double CPMLNaiveBayesAdaptor::get_cx_given_y(CPMLNaiveBayesAdaptor *this, int a2, int a3, int a4, double *a5)
{
  unint64_t v14 = 0xBFF0000000000000;
  double v15 = -1.0;
  uint64_t v10 = (id *)*((void *)this + 19);
  if (v10 && CPMLDelegateEngineNaiveBayes::preProcessGetCountXGivenYAndSetXCardinality(v10, &v15, a2, a3, a4, a5)) {
    return v15;
  }
  unint64_t v12 = sqlite3_mprintf("select xCardinality from xCardinality%d where yMap=%d;", a2, a4);
  (*(void (**)(void, unint64_t *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v14, v12);
  if (v12) {
    sqlite3_free(v12);
  }
  if (fabs(v15) == INFINITY) {
    goto LABEL_10;
  }
  *(void *)a5 = v14;
  unint64_t v13 = sqlite3_mprintf("select xyCount from xcol%d where (xMap==%d and yMap==%d);", a2, a3, a4);
  (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v15, v13);
  if (v13) {
    sqlite3_free(v13);
  }
  double result = v15;
  if (fabs(v15) == INFINITY)
  {
LABEL_10:
    *a5 = 0.0;
    return -2.0;
  }
  return result;
}

void CPMLNaiveBayesAdaptor::set_count(CPMLNaiveBayesAdaptor *this, double a2)
{
  uint64_t v4 = (id *)*((void *)this + 19);
  if (!v4 || !CPMLDelegateEngineNaiveBayes::preProcessSetCount(v4, a2))
  {
    double v8 = 1.0;
    int v5 = sqlite3_mprintf("select count(*) from rowCountY;");
    (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v8, v5);
    if (v5) {
      sqlite3_free(v5);
    }
    if (v8 == 0.0)
    {
      double v6 = sqlite3_mprintf("insert into rowCountY (rowCountY) VALUES(0.0);", v8);
      (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v8, v6);
      if (v6) {
        sqlite3_free(v6);
      }
    }
    unint64_t v7 = sqlite3_mprintf("update rowCountY set rowCountY=%lf;", a2);
    (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v8, v7);
    if (v7) {
      sqlite3_free(v7);
    }
    *((double *)this + 2) = a2;
  }
}

void CPMLNaiveBayesAdaptor::set_cy(CPMLNaiveBayesAdaptor *this, int a2, double a3)
{
  int v24 = a2;
  double v6 = (id *)*((void *)this + 19);
  if (!v6 || !CPMLDelegateEngineNaiveBayes::preProcessSetCountY(v6, a2, a3))
  {
    double v23 = 1.0;
    unint64_t v7 = sqlite3_mprintf("select count(*) from yCount where yMap=%d;", a2);
    (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v23, v7);
    if (v7) {
      sqlite3_free(v7);
    }
    if (v23 == 0.0)
    {
      double v8 = sqlite3_mprintf("insert into yCount (yMap, yCount) VALUES(%d, 0.0);", a2);
      (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v23, v8);
      if (v8) {
        sqlite3_free(v8);
      }
      unint64_t v9 = *((void *)this + 22);
      *((double *)this + 3) = *((double *)this + 3) + 1.0;
      uint64_t v10 = (int *)*((void *)this + 21);
      if ((unint64_t)v10 >= v9)
      {
        unint64_t v12 = (int *)*((void *)this + 20);
        uint64_t v13 = v10 - v12;
        if ((unint64_t)(v13 + 1) >> 62) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v14 = v9 - (void)v12;
        unint64_t v15 = (uint64_t)(v9 - (void)v12) >> 1;
        if (v15 <= v13 + 1) {
          unint64_t v15 = v13 + 1;
        }
        if (v14 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v16 = v15;
        }
        if (v16)
        {
          size_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 176, v16);
          unint64_t v12 = (int *)*((void *)this + 20);
          uint64_t v10 = (int *)*((void *)this + 21);
        }
        else
        {
          size_t v17 = 0;
        }
        int v18 = (int *)&v17[4 * v13];
        double v19 = &v17[4 * v16];
        *int v18 = a2;
        uint64_t v11 = v18 + 1;
        while (v10 != v12)
        {
          int v20 = *--v10;
          *--int v18 = v20;
        }
        *((void *)this + 2(*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0) = v18;
        *((void *)this + 21) = v11;
        *((void *)this + 22) = v19;
        if (v12) {
          operator delete(v12);
        }
      }
      else
      {
        *uint64_t v10 = a2;
        uint64_t v11 = v10 + 1;
      }
      *((void *)this + 21) = v11;
    }
    if (fabs(a3) == INFINITY) {
      uint64_t v21 = sqlite3_mprintf("update yCount set yCount=NULL where yMap=%d;");
    }
    else {
      uint64_t v21 = sqlite3_mprintf("update yCount set yCount=%lf where yMap=%d;");
    }
    uint64_t v22 = v21;
    unint64_t v25 = &v24;
    *((double *)std::__hash_table<std::__hash_value_type<int,double>,std::__unordered_map_hasher<int,std::__hash_value_type<int,double>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,double>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,double>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)this + 32, &v24, (uint64_t)&std::piecewise_construct, &v25)+ 3) = a3;
    (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v23, v22);
    if (v22) {
      sqlite3_free(v22);
    }
  }
}

void CPMLNaiveBayesAdaptor::set_cx_given_y(CPMLNaiveBayesAdaptor *this, int a2, uint64_t a3, unsigned int a4, double a5)
{
  uint64_t v10 = (id *)*((void *)this + 19);
  if (!v10 || !CPMLDelegateEngineNaiveBayes::preProcessSetCountXGivenY(v10, a2, a3, a4, a5))
  {
    unint64_t v16 = a4 | (unint64_t)(a3 << 32);
    double v17 = 1.0;
    uint64_t v11 = sqlite3_mprintf("select count(*) from xcol%d where (xMap=%d and yMap=%d);", a2, a3, a4);
    (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v17, v11);
    if (v11) {
      sqlite3_free(v11);
    }
    if (v17 == 0.0)
    {
      if (fabs(a5) == INFINITY) {
        unint64_t v12 = sqlite3_mprintf("insert into xcol%d (xMap, yMap, xyCount) VALUES(%d, %d, NULL);");
      }
      else {
        unint64_t v12 = sqlite3_mprintf("insert into xcol%d (xMap, yMap, xyCount) VALUES(%d, %d, %lf);");
      }
      unint64_t v14 = v12;
      (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v17, v12);
      if (v14) {
        sqlite3_free(v14);
      }
    }
    else
    {
      if (fabs(a5) == INFINITY) {
        uint64_t v13 = sqlite3_mprintf("update xcol%d set xyCount=NULL where (xMap=%d and yMap=%d);");
      }
      else {
        uint64_t v13 = sqlite3_mprintf("update xcol%d set xyCount=%lf where (xMap=%d and yMap=%d);");
      }
      unint64_t v15 = v13;
      (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v17, v13);
      if (v15) {
        sqlite3_free(v15);
      }
      int v18 = &v16;
      *((double *)std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)this + 72, &v16, (uint64_t)&std::piecewise_construct, &v18)+ 3) = a5;
    }
  }
}

void CPMLNaiveBayesAdaptor::set_cardinalityx_given_y(CPMLNaiveBayesAdaptor *this, int a2, int a3, double a4)
{
  double v8 = (id *)*((void *)this + 19);
  if (!v8 || !CPMLDelegateEngineNaiveBayes::preProcessSetCardinalityXGivenY(v8, a2, a3, a4))
  {
    double v14 = 1.0;
    unint64_t v9 = sqlite3_mprintf("select count(*) from xcol%d where yMap=%d;", a2, a3);
    (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v14, v9);
    if (v9) {
      sqlite3_free(v9);
    }
    if (v14 == 0.0)
    {
      if (fabs(a4) == INFINITY) {
        uint64_t v10 = sqlite3_mprintf("insert into xCardinality%d (yMap, xCardinality) VALUES(%d, NULL);");
      }
      else {
        uint64_t v10 = sqlite3_mprintf("insert into xCardinality%d (yMap, xCardinality) VALUES(%d, %lf);");
      }
      unint64_t v12 = v10;
      (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v14, v10);
      if (v12) {
LABEL_12:
      }
        sqlite3_free(v12);
    }
    else
    {
      if (fabs(a4) == INFINITY) {
        uint64_t v11 = sqlite3_mprintf("update xCardinality%d set xCardinality=NULL where yMap=%d;");
      }
      else {
        uint64_t v11 = sqlite3_mprintf("update xCardinality%d set xCardinality=%lf where yMap=%d;");
      }
      unint64_t v12 = v11;
      (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v14, v11);
      unint64_t v13 = a3;
      unint64_t v15 = &v13;
      *((double *)std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)this + 112, &v13, (uint64_t)&std::piecewise_construct, &v15)+ 3) = a4;
      if (v12) {
        goto LABEL_12;
      }
    }
  }
}

uint64_t CPMLNaiveBayesAdaptor::set_engine(uint64_t this, CPMLDelegateEngine *a2)
{
  *(void *)(this + 152) = a2;
  return this;
}

uint64_t *std::__hash_table<std::__hash_value_type<int,double>,std::__unordered_map_hasher<int,std::__hash_value_type<int,double>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,double>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,double>>>::find<int>(void *a1, int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  double v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (double result = *v6; result; double result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
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
    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (unint64_t i = *v10; i; unint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7) {
            return i;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }
  unint64_t i = operator new(0x20uLL);
  *unint64_t i = 0;
  i[1] = v7;
  i[2] = **a4;
  i[3] = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__rehash<true>(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  int v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *unint64_t i = *v20;
LABEL_38:
    *int v20 = i;
    goto LABEL_39;
  }
  *unint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*i)
  {
    unint64_t v21 = *(void *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    int v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_2143424D0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void CPMLNaiveBayes::CPMLNaiveBayes(CPMLNaiveBayes *this)
{
  *(void *)this = &unk_26C50FBD0;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 6) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)((char *)this + 8) = _Q0;
  *(_OWORD *)((char *)this + 24) = xmmword_214354600;
}

uint64_t CPMLNaiveBayes::set_decay_rate(uint64_t this, double a2)
{
  if (a2 <= 0.0) {
    CPMLNaiveBayes::set_decay_rate();
  }
  if (a2 > 1.0) {
    CPMLNaiveBayes::set_decay_rate();
  }
  *(double *)(this + 8) = a2;
  *(double *)(this + 16) = 1.0 / a2;
  return this;
}

uint64_t CPMLNaiveBayes::set_epsilon_rate(uint64_t this, double a2)
{
  if (a2 < 0.0) {
    CPMLNaiveBayes::set_epsilon_rate();
  }
  *(double *)(this + 24) = a2;
  return this;
}

uint64_t CPMLNaiveBayes::set_smooth_rate(uint64_t this, double a2)
{
  if (a2 < 0.0) {
    CPMLNaiveBayes::set_smooth_rate();
  }
  *(double *)(this + 32) = a2;
  return this;
}

void CPMLNaiveBayes::CPMLNaiveBayes(CPMLNaiveBayes *this, CPMLNaiveBayesDBAdaptor *a2)
{
  *(void *)this = &unk_26C50FBD0;
  if (!a2) {
    CPMLNaiveBayes::CPMLNaiveBayes();
  }
  *((void *)this + 7) = a2;
  *((void *)this + 8) = 0;
  *((void *)this + 6) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)((char *)this + 8) = _Q0;
  *(_OWORD *)((char *)this + 24) = xmmword_214354600;
  *((_DWORD *)this + 1(*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0) = 0;
}

uint64_t CPMLNaiveBayes::set_smooth_mode(uint64_t this, int a2)
{
  *(_DWORD *)(this + 4(*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0) = a2;
  return this;
}

void CPMLNaiveBayes::~CPMLNaiveBayes(CPMLNaiveBayes *this)
{
  *(void *)this = &unk_26C50FBD0;
  uint64_t v1 = *((void *)this + 6);
  if (v1)
  {
    int8x8_t v2 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v2;
      operator delete(v2);
    }
    MEMORY[0x21669DB80](v1, 0x20C40960023A9);
  }
}

uint64_t CPMLNaiveBayes::set_engine(uint64_t this, CPMLDelegateEngine *a2)
{
  *(void *)(this + 64) = a2;
  return this;
}

double CPMLNaiveBayes::get_nb_probability(CPMLNaiveBayes *a1, void *a2, uint64_t a3, double a4, double a5, double a6)
{
  if (a4 >= a6)
  {
    double v6 = a4;
    if ((int)(-1431655765 * ((uint64_t)(a2[1] - *a2) >> 3)) < 1) {
      return v6;
    }
    uint64_t v12 = 0;
    uint64_t v13 = -1431655765 * ((uint64_t)(a2[1] - *a2) >> 3);
    while (1)
    {
      uint64_t v14 = *a2 + 24 * v12;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      std::string __p = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, *(const void **)v14, *(void *)(v14 + 8), (uint64_t)(*(void *)(v14 + 8) - *(void *)v14) >> 2);
      BOOL v15 = v22;
      if (v22 == __p)
      {
        BOOL v19 = 0;
        if (!v22) {
          goto LABEL_13;
        }
      }
      else
      {
        unint64_t v16 = 0;
        BOOL v15 = __p;
        do
        {
          uint64_t v17 = *(unsigned int *)&v15[4 * v16];
          if (v17 != -1)
          {
            CPMLNaiveBayes::get_px_given_y(a1, v12, v17, a3, a5);
            double v6 = v6 * v18;
            BOOL v15 = __p;
          }
          BOOL v19 = v6 < a6;
          if (v6 < a6) {
            break;
          }
          ++v16;
        }
        while (v16 < (v22 - v15) >> 2);
        if (!v15) {
          goto LABEL_13;
        }
      }
      uint64_t v22 = v15;
      operator delete(v15);
LABEL_13:
      if (v19) {
        return 0.0;
      }
      if (++v12 == v13) {
        return v6;
      }
    }
  }
  return 0.0;
}

void sub_2143427D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CPMLNaiveBayes::get_px_given_y(CPMLNaiveBayes *this, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v6 = 0;
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t *))(**((void **)this + 7) + 16))(*((void *)this + 7), a2, a3, a4, &v6);
}

void CPMLNaiveBayes::sort_candidates(uint64_t a1, unsigned int **a2, uint64_t a3)
{
  std::vector<ProbIndex>::resize(a3, 0);
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  if (*a2 == v7)
  {
    uint64_t v13 = *(long long **)(a3 + 8);
  }
  else
  {
    do
    {
      unsigned int v8 = *v6;
      double v9 = (*(double (**)(void, void))(**(void **)(a1 + 56) + 8))(*(void *)(a1 + 56), *v6);
      double v10 = v9;
      unint64_t v11 = *(void *)(a3 + 8);
      unint64_t v12 = *(void *)(a3 + 16);
      if (v11 >= v12)
      {
        uint64_t v14 = (uint64_t)(v11 - *(void *)a3) >> 4;
        unint64_t v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 60) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v16 = v12 - *(void *)a3;
        if (v16 >> 3 > v15) {
          unint64_t v15 = v16 >> 3;
        }
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v17 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v17 = v15;
        }
        if (v17) {
          double v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::valarray<char>>>(a3 + 16, v17);
        }
        else {
          double v18 = 0;
        }
        BOOL v19 = &v18[16 * v14];
        *(double *)BOOL v19 = v10;
        *((_DWORD *)v19 + 2) = v8;
        *((_DWORD *)v19 + 3) = 0;
        unint64_t v21 = *(double **)a3;
        int v20 = *(double **)(a3 + 8);
        uint64_t v22 = v19;
        if (v20 != *(double **)a3)
        {
          do
          {
            *((_OWORD *)v22 - 1) = *((_OWORD *)v20 - 1);
            v22 -= 16;
            v20 -= 2;
          }
          while (v20 != v21);
          int v20 = *(double **)a3;
        }
        uint64_t v13 = (long long *)(v19 + 16);
        *(void *)a3 = v22;
        *(void *)(a3 + 8) = v19 + 16;
        *(void *)(a3 + 16) = &v18[16 * v17];
        if (v20) {
          operator delete(v20);
        }
      }
      else
      {
        *(double *)unint64_t v11 = v9;
        uint64_t v13 = (long long *)(v11 + 16);
        *(_DWORD *)(v11 + 8) = v8;
        *(_DWORD *)(v11 + 12) = 0;
      }
      *(void *)(a3 + 8) = v13;
      ++v6;
    }
    while (v6 != v7);
  }
  unint64_t v23 = 126 - 2 * __clz(((uint64_t)v13 - *(void *)a3) >> 4);
  if (v13 == *(long long **)a3) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = v23;
  }
  std::__introsort<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *,false>(*(double **)a3, v13, (uint64_t)&v25, v24, 1);
}

void std::vector<ProbIndex>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 16 * a2;
    }
  }
  else
  {
    std::vector<ProbIndex>::__append((void **)a1, a2 - v2);
  }
}

void CPMLNaiveBayes::set_candidates(uint64_t a1, unsigned int **a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (!v2) {
    operator new();
  }

  CPMLNaiveBayes::sort_candidates(a1, a2, v2);
}

void CPMLNaiveBayes::predict(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (**(void (***)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))a1)(a1, a2, v6, a3, a4);
  }
  else {
    std::vector<ProbIndex>::resize(a4, 0);
  }
}

void CPMLNaiveBayes::predict(void (***a1)(void, uint64_t, void **, uint64_t, uint64_t), uint64_t a2, unsigned int **a3, uint64_t a4, uint64_t a5)
{
  std::string __p = 0;
  double v10 = 0;
  uint64_t v11 = 0;
  CPMLNaiveBayes::sort_candidates((uint64_t)a1, a3, (uint64_t)&__p);
  (**a1)(a1, a2, &__p, a4, a5);
  if (__p)
  {
    double v10 = __p;
    operator delete(__p);
  }
}

void sub_214342BCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CPMLNaiveBayes::predict_sorted(uint64_t a1, uint64_t *a2, uint64_t *a3, int a4, void *a5)
{
  memset(v54, 0, sizeof(v54));
  double v9 = *(id **)(a1 + 64);
  if (v9)
  {
    if (CPMLDelegateEngineNaiveBayes::preProcessPredictSorted(v9, a2, v54)) {
      goto LABEL_67;
    }
  }
  else if (v54 != a2)
  {
    std::vector<std::vector<int>>::__assign_with_size[abi:ne180100]<std::vector<int>*,std::vector<int>*>((uint64_t)v54, *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
  }
  std::string __p = 0;
  unint64_t v52 = 0;
  v53[0] = 0;
  (***(void (****)(void))(a1 + 56))();
  uint64_t v11 = *a3;
  uint64_t v12 = a3[1];
  if (*a3 != v12)
  {
    double v13 = v10;
    double v14 = 0.0;
    do
    {
      double v15 = *(double *)v11;
      if (*(_DWORD *)(a1 + 40))
      {
        double v16 = 0.001;
        if (v15 != 0.0) {
          double v16 = v15 / v13;
        }
      }
      else
      {
        double v17 = 0.0;
        if (v15 == 0.0) {
          double v17 = 0.0 + 1.0;
        }
        double v16 = (v15 + *(double *)(a1 + 32)) / (v13 + (*(double *)(a1 + 32) + *(double *)(a1 + 24)) * v17);
      }
      double nb_probability = CPMLNaiveBayes::get_nb_probability((CPMLNaiveBayes *)a1, v54, *(unsigned int *)(v11 + 8), v16, v15, v14);
      double v19 = nb_probability;
      int v20 = *(_DWORD *)(v11 + 8);
      uint64_t v22 = __p;
      uint64_t v21 = (uint64_t)v52;
      uint64_t v23 = (char *)v52 - (unsigned char *)__p;
      unint64_t v24 = ((char *)v52 - (unsigned char *)__p) >> 4;
      if (v24 >= a4)
      {
        double v14 = *(double *)__p;
        if (nb_probability > *(double *)__p)
        {
          if (v23 >= 17)
          {
            long long v56 = *(_OWORD *)__p;
            std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((uint64_t)__p, (uint64_t)&v55, (unint64_t)v23 >> 4);
            unint64_t v27 = v52 - 2;
            if (v52 - 2 == v26)
            {
              *(_OWORD *)uint64_t v26 = v56;
            }
            else
            {
              *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
              *(_OWORD *)unint64_t v27 = v56;
              std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((uint64_t)v22, (uint64_t)(v26 + 2), (uint64_t)&v55, ((char *)(v26 + 2) - v22) >> 4);
            }
            uint64_t v21 = (uint64_t)v52;
          }
          unint64_t v52 = (double *)(v21 - 16);
          if ((unint64_t)(v21 - 16) >= v53[0])
          {
            uint64_t v32 = (v21 - 16 - (uint64_t)__p) >> 4;
            unint64_t v33 = v32 + 1;
            if ((unint64_t)(v32 + 1) >> 60) {
              std::vector<double>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v34 = v53[0] - (void)__p;
            if ((uint64_t)(v53[0] - (void)__p) >> 3 > v33) {
              unint64_t v33 = v34 >> 3;
            }
            if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v35 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v35 = v33;
            }
            if (v35) {
              uint64_t v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::valarray<char>>>((uint64_t)v53, v35);
            }
            else {
              uint64_t v36 = 0;
            }
            double v41 = (double *)&v36[16 * v32];
            double *v41 = v19;
            *((_DWORD *)v41 + 2) = v20;
            *((_DWORD *)v41 + 3) = 0;
            uint64_t v43 = (char *)__p;
            uint64_t v42 = (char *)v52;
            int v44 = v41;
            if (v52 != __p)
            {
              do
              {
                *((_OWORD *)v44 - 1) = *((_OWORD *)v42 - 1);
                v44 -= 2;
                v42 -= 16;
              }
              while (v42 != v43);
              uint64_t v42 = (char *)__p;
            }
            uint64_t v21 = (uint64_t)(v41 + 2);
            std::string __p = v44;
            unint64_t v52 = v41 + 2;
            v53[0] = &v36[16 * v35];
            if (v42) {
              operator delete(v42);
            }
          }
          else
          {
            *(double *)(v21 - 16) = v19;
            *(_DWORD *)(v21 - 8) = v20;
            *(_DWORD *)(v21 - 4) = 0;
          }
          unint64_t v52 = (double *)v21;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((uint64_t)__p, v21, (uint64_t)&v56, (v21 - (uint64_t)__p) >> 4);
          double v14 = v19;
        }
      }
      else if (nb_probability > *(double *)(a1 + 24))
      {
        if ((unint64_t)v52 >= v53[0])
        {
          unint64_t v28 = v24 + 1;
          if ((v24 + 1) >> 60) {
            std::vector<double>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v29 = v53[0] - (void)__p;
          if ((uint64_t)(v53[0] - (void)__p) >> 3 > v28) {
            unint64_t v28 = v29 >> 3;
          }
          if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v30 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v30 = v28;
          }
          if (v30) {
            BOOL v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::valarray<char>>>((uint64_t)v53, v30);
          }
          else {
            BOOL v31 = 0;
          }
          int v37 = (double *)&v31[16 * v24];
          *int v37 = v19;
          *((_DWORD *)v37 + 2) = v20;
          *((_DWORD *)v37 + 3) = 0;
          unint64_t v39 = (char *)__p;
          int v38 = (char *)v52;
          double v40 = v37;
          if (v52 != __p)
          {
            do
            {
              *((_OWORD *)v40 - 1) = *((_OWORD *)v38 - 1);
              v40 -= 2;
              v38 -= 16;
            }
            while (v38 != v39);
            int v38 = (char *)__p;
          }
          uint64_t v25 = (uint64_t)(v37 + 2);
          std::string __p = v40;
          unint64_t v52 = v37 + 2;
          v53[0] = &v31[16 * v30];
          if (v38) {
            operator delete(v38);
          }
        }
        else
        {
          *unint64_t v52 = nb_probability;
          uint64_t v25 = v21 + 16;
          *(_DWORD *)(v21 + 8) = v20;
          *(_DWORD *)(v21 + 12) = 0;
        }
        unint64_t v52 = (double *)v25;
        std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((uint64_t)__p, v25, (uint64_t)&v56, (v25 - (uint64_t)__p) >> 4);
      }
      v11 += 16;
    }
    while (v11 != v12);
  }
  std::vector<ProbIndex>::resize((uint64_t)a5, (int)(((char *)v52 - (unsigned char *)__p) >> 4));
  if ((int)((unint64_t)((char *)v52 - (unsigned char *)__p) >> 4) >= 1)
  {
    uint64_t v45 = ((unint64_t)((char *)v52 - (unsigned char *)__p) >> 4);
    uint64_t v46 = ((unint64_t)((char *)v52 - (unsigned char *)__p) >> 4 << 32) - 0x100000000;
    do
    {
      *(_OWORD *)(*a5 + (v46 >> 28)) = *(_OWORD *)__p;
      double v47 = __p;
      uint64_t v48 = v52;
      if ((char *)v52 - (unsigned char *)__p >= 17)
      {
        long long v56 = *(_OWORD *)__p;
        std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((uint64_t)__p, (uint64_t)&v55, (unint64_t)((char *)v52 - (unsigned char *)__p) >> 4);
        uint64_t v50 = v52 - 2;
        if (v52 - 2 == v49)
        {
          *(_OWORD *)double v49 = v56;
        }
        else
        {
          *(_OWORD *)double v49 = *(_OWORD *)v50;
          *(_OWORD *)uint64_t v50 = v56;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((uint64_t)v47, (uint64_t)(v49 + 2), (uint64_t)&v55, ((char *)(v49 + 2) - v47) >> 4);
        }
        uint64_t v48 = v52;
      }
      unint64_t v52 = v48 - 2;
      v46 -= 0x100000000;
      --v45;
    }
    while (v45);
  }
  if (__p)
  {
    unint64_t v52 = (double *)__p;
    operator delete(__p);
  }
LABEL_67:
  std::string __p = v54;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
}

void sub_2143430C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char *__p, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  std::string __p = &a15;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

uint64_t CPMLNaiveBayes::update(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *(id **)(a1 + 64);
  if (!v6 || (uint64_t result = CPMLDelegateEngineNaiveBayes::preProcessUpdateNaiveBayes(v6, a2, a3), (result & 1) == 0))
  {
    uint64_t v8 = *a2;
    if (a2[1] != *a2)
    {
      unint64_t v9 = 0;
      do
      {
        double v18 = 0;
        double v19 = 0;
        uint64_t v20 = 0;
        std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v18, *(const void **)(v8 + 24 * v9), *(void *)(v8 + 24 * v9 + 8), (uint64_t)(*(void *)(v8 + 24 * v9 + 8) - *(void *)(v8 + 24 * v9)) >> 2);
        double v10 = v19;
        if (v19 != v18)
        {
          unint64_t v11 = 0;
          double v10 = v18;
          do
          {
            double v17 = 0.0;
            double v12 = (*(double (**)(void, unint64_t, void, uint64_t, double *))(**(void **)(a1 + 56)
                                                                                                + 16))(*(void *)(a1 + 56), v9, v10[v11], a3, &v17);
            if (v12 == 0.0) {
              (*(void (**)(void, unint64_t, uint64_t, double))(**(void **)(a1 + 56) + 48))(*(void *)(a1 + 56), v9, a3, v17 + 1.0);
            }
            (*(void (**)(void, unint64_t, void, uint64_t, double))(**(void **)(a1 + 56) + 40))(*(void *)(a1 + 56), v9, v18[v11++], a3, v12 + *(double *)(a1 + 16));
            double v10 = v18;
          }
          while (v11 < v19 - v18);
        }
        if (v10)
        {
          double v19 = v10;
          operator delete(v10);
        }
        ++v9;
        uint64_t v8 = *a2;
      }
      while (0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3) > v9);
    }
    uint64_t v13 = *(void *)(a1 + 56);
    double v14 = (*(double (**)(uint64_t, uint64_t))(*(void *)v13 + 8))(v13, a3);
    (*(void (**)(uint64_t, uint64_t, double))(*(void *)v13 + 32))(v13, a3, v14 + *(double *)(a1 + 16));
    double v18 = 0;
    uint64_t v15 = *(void *)(a1 + 56);
    double v16 = (**(double (***)(uint64_t, void **))v15)(v15, (void **)&v18);
    return (*(uint64_t (**)(uint64_t, double))(*(void *)v15 + 24))(v15, v16 + *(double *)(a1 + 16));
  }
  return result;
}

void sub_2143433B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<ProbIndex>::__append(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 4)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 16 * a2);
      v7 += 16 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 4);
    if (v9 >> 60) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::valarray<char>>>(v4, v12);
    }
    else {
      uint64_t v13 = 0;
    }
    double v14 = &v13[16 * v10];
    uint64_t v15 = &v13[16 * v12];
    bzero(v14, 16 * a2);
    double v16 = &v14[16 * a2];
    double v18 = (char *)*a1;
    double v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v17 - 1);
        v14 -= 16;
        v17 -= 16;
      }
      while (v17 != v18);
      double v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

void std::__introsort<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *,false>(double *a1, long long *a2, uint64_t a3, uint64_t a4, char a5)
{
double *std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(double *result, double *a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 2;
    if (result + 2 != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = result;
      while (1)
      {
        char v5 = v4;
        uint64_t v4 = v2;
        double v6 = v5[2];
        if (v6 > *v5) {
          break;
        }
        if (v6 == *v5)
        {
          int v7 = *((_DWORD *)v5 + 6);
          if (v7 < *((_DWORD *)v5 + 2)) {
            goto LABEL_8;
          }
        }
LABEL_17:
        uint64_t v2 = v4 + 2;
        v3 += 16;
        if (v4 + 2 == a2) {
          return result;
        }
      }
      int v7 = *((_DWORD *)v5 + 6);
LABEL_8:
      int v8 = *((_DWORD *)v5 + 7);
      *(_OWORD *)uint64_t v4 = *(_OWORD *)v5;
      unint64_t v9 = result;
      if (v5 != result)
      {
        uint64_t v10 = v3;
        do
        {
          double v11 = *(double *)((char *)result + v10 - 16);
          if (v6 <= v11)
          {
            if (v6 != v11)
            {
              unint64_t v9 = v5;
              goto LABEL_16;
            }
            unint64_t v9 = (double *)((char *)result + v10);
            if (v7 >= *(_DWORD *)((char *)result + v10 - 8)) {
              goto LABEL_16;
            }
          }
          v5 -= 2;
          *(_OWORD *)((char *)result + v1(*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0) = *(_OWORD *)((char *)result + v10 - 16);
          v10 -= 16;
        }
        while (v10);
        unint64_t v9 = result;
      }
LABEL_16:
      *unint64_t v9 = v6;
      *((_DWORD *)v9 + 2) = v7;
      *((_DWORD *)v9 + 3) = v8;
      goto LABEL_17;
    }
  }
  return result;
}

double *std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(double *result, double *a2)
{
  if (result != a2)
  {
    while (1)
    {
      if (result + 2 == a2) {
        return result;
      }
      uint64_t v2 = result;
      result += 2;
      double v3 = v2[2];
      if (v3 <= *v2)
      {
        if (v3 == *v2)
        {
          int v4 = *((_DWORD *)v2 + 6);
          if (v4 < *((_DWORD *)v2 + 2)) {
            goto LABEL_7;
          }
        }
      }
      else
      {
        int v4 = *((_DWORD *)v2 + 6);
LABEL_7:
        int v5 = *((_DWORD *)v2 + 7);
        for (unint64_t i = result; ; i -= 2)
        {
          *(_OWORD *)unint64_t i = *((_OWORD *)i - 1);
          double v7 = *(i - 4);
          if (v3 <= v7 && (v3 != v7 || v4 >= *((_DWORD *)i - 6))) {
            break;
          }
        }
        *(i - 2) = v3;
        *((_DWORD *)i - 2) = v4;
        *((_DWORD *)i - 1) = v5;
      }
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(long long *a1, long long *a2, long long *a3)
{
  double v3 = *(double *)a2;
  if (*(double *)a2 > *(double *)a1 || *(double *)a2 == *(double *)a1 && *((_DWORD *)a2 + 2) < *((_DWORD *)a1 + 2))
  {
    if (*(double *)a3 > v3 || *(double *)a3 == v3 && *((_DWORD *)a3 + 2) < *((_DWORD *)a2 + 2))
    {
      long long v4 = *a1;
      *a1 = *a3;
      *a3 = v4;
      return 1;
    }
    long long v8 = *a1;
    *a1 = *a2;
    *a2 = v8;
    if (*(double *)a3 <= *(double *)a2
      && (*(double *)a3 != *(double *)a2 || *((_DWORD *)a3 + 2) >= *((_DWORD *)a2 + 2)))
    {
      return 1;
    }
    long long v9 = *a2;
    *a2 = *a3;
    *a3 = v9;
    return 2;
  }
  if (*(double *)a3 > v3 || *(double *)a3 == v3 && *((_DWORD *)a3 + 2) < *((_DWORD *)a2 + 2))
  {
    long long v6 = *a2;
    *a2 = *a3;
    *a3 = v6;
    if (*(double *)a2 <= *(double *)a1
      && (*(double *)a2 != *(double *)a1 || *((_DWORD *)a2 + 2) >= *((_DWORD *)a1 + 2)))
    {
      return 1;
    }
    long long v7 = *a1;
    *a1 = *a2;
    *a2 = v7;
    return 2;
  }
  return 0;
}

double *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ProbIndex *,CPMLNBCompareProbIndexDescending &>(uint64_t a1, unint64_t a2)
{
  double v2 = *(double *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  double v4 = *(double *)(a2 - 16);
  if (*(double *)a1 > v4 || *(double *)a1 == v4 && (int)v3 < *(_DWORD *)(a2 - 8))
  {
    int v5 = (double *)(a1 + 16);
    double v6 = *(double *)(a1 + 16);
    if (v2 <= v6)
    {
      do
      {
        if (v2 == v6 && (int)v3 < *((_DWORD *)v5 + 2)) {
          break;
        }
        double v7 = v5[2];
        v5 += 2;
        double v6 = v7;
      }
      while (v2 <= v7);
    }
  }
  else
  {
    int v5 = (double *)(a1 + 16);
    if (a1 + 16 < a2)
    {
      do
      {
        if (v2 > *v5 || v2 == *v5 && (int)v3 < *((_DWORD *)v5 + 2)) {
          break;
        }
        v5 += 2;
      }
      while ((unint64_t)v5 < a2);
    }
  }
  if ((unint64_t)v5 < a2)
  {
    for (a2 -= 16; v2 > v4 || v2 == v4 && (int)v3 < *(_DWORD *)(a2 + 8); a2 -= 16)
    {
      double v8 = *(double *)(a2 - 16);
      double v4 = v8;
    }
  }
  while ((unint64_t)v5 < a2)
  {
    long long v14 = *(_OWORD *)v5;
    *(_OWORD *)int v5 = *(_OWORD *)a2;
    *(_OWORD *)a2 = v14;
    do
    {
      double v9 = v5[2];
      v5 += 2;
      double v10 = v9;
    }
    while (v2 <= v9 && (v2 != v10 || (int)v3 >= *((_DWORD *)v5 + 2)));
    do
    {
      do
      {
        double v11 = *(double *)(a2 - 16);
        a2 -= 16;
        BOOL v12 = v2 == v11;
      }
      while (v2 > v11);
    }
    while (v12 && (int)v3 < *(_DWORD *)(a2 + 8));
  }
  if (v5 - 2 != (double *)a1) {
    *(_OWORD *)a1 = *((_OWORD *)v5 - 1);
  }
  *(v5 - 2) = v2;
  *((void *)v5 - 1) = v3;
  return v5;
}

unint64_t std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ProbIndex *,CPMLNBCompareProbIndexDescending &>(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = 0;
  double v3 = *(double *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  while (1)
  {
    double v5 = *(double *)(a1 + v2 + 16);
    if (v5 <= v3 && (v5 != v3 || *(_DWORD *)(a1 + v2 + 24) >= (int)v4)) {
      break;
    }
    v2 += 16;
  }
  unint64_t v6 = a1 + v2 + 16;
  if (v2)
  {
    do
    {
      double v7 = *(double *)(a2 - 16);
      a2 -= 16;
      double v8 = v7;
    }
    while (v7 <= v3 && (v8 != v3 || *(_DWORD *)(a2 + 8) >= (int)v4));
  }
  else
  {
LABEL_19:
    if (v6 < a2)
    {
      do
      {
        double v9 = *(double *)(a2 - 16);
        a2 -= 16;
        double v10 = v9;
        if (v9 > v3) {
          break;
        }
        if (v10 != v3) {
          goto LABEL_19;
        }
      }
      while (*(_DWORD *)(a2 + 8) >= (int)v4 && v6 < a2);
    }
  }
  unint64_t v12 = a1 + v2 + 16;
  if (v6 < a2)
  {
    unint64_t v13 = a2;
    do
    {
      long long v19 = *(_OWORD *)v12;
      *(_OWORD *)unint64_t v12 = *(_OWORD *)v13;
      *(_OWORD *)unint64_t v13 = v19;
      do
      {
        do
        {
          double v14 = *(double *)(v12 + 16);
          v12 += 16;
          BOOL v15 = v14 == v3;
        }
        while (v14 > v3);
      }
      while (v15 && *(_DWORD *)(v12 + 8) < (int)v4);
      do
      {
        double v16 = *(double *)(v13 - 16);
        v13 -= 16;
        double v17 = v16;
      }
      while (v16 <= v3 && (v17 != v3 || *(_DWORD *)(v13 + 8) >= (int)v4));
    }
    while (v12 < v13);
  }
  if (v12 - 16 != a1) {
    *(_OWORD *)a1 = *(_OWORD *)(v12 - 16);
  }
  *(double *)(v12 - 16) = v3;
  *(void *)(v12 - 8) = v4;
  return v12 - 16;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 4;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      unint64_t v6 = (long long *)(a2 - 16);
      double v7 = *(double *)(a2 - 16);
      if (v7 > *(double *)a1 || v7 == *(double *)a1 && *(_DWORD *)(a2 - 8) < *(_DWORD *)(a1 + 8))
      {
        long long v8 = *(_OWORD *)a1;
        *(_OWORD *)a1 = *v6;
        long long *v6 = v8;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((long long *)a1, (long long *)(a1 + 16), (long long *)(a2 - 16));
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(a1, a1 + 16, a1 + 32, a2 - 16);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((__n128 *)a1, (__n128 *)(a1 + 16), (__n128 *)(a1 + 32), (__n128 *)(a1 + 48), (__n128 *)(a2 - 16));
      return 1;
    default:
      uint64_t v9 = a1 + 32;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((long long *)a1, (long long *)(a1 + 16), (long long *)(a1 + 32));
      uint64_t v10 = a1 + 48;
      if (a1 + 48 == a2) {
        return 1;
      }
      uint64_t v11 = 0;
      int v12 = 0;
      break;
  }
  while (1)
  {
    double v13 = *(double *)v10;
    if (*(double *)v10 > *(double *)v9) {
      break;
    }
    if (*(double *)v10 == *(double *)v9)
    {
      int v14 = *(_DWORD *)(v10 + 8);
      if (v14 < *(_DWORD *)(v9 + 8)) {
        goto LABEL_12;
      }
    }
LABEL_22:
    uint64_t v9 = v10;
    v11 += 16;
    v10 += 16;
    if (v10 == a2) {
      return 1;
    }
  }
  int v14 = *(_DWORD *)(v10 + 8);
LABEL_12:
  int v15 = *(_DWORD *)(v10 + 12);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v9;
  uint64_t v16 = a1;
  if (v9 != a1)
  {
    uint64_t v17 = v11;
    while (1)
    {
      double v18 = *(double *)(a1 + v17 + 16);
      if (v13 <= v18)
      {
        if (v13 != v18)
        {
          uint64_t v16 = v9;
          goto LABEL_21;
        }
        if (v14 >= *(_DWORD *)(a1 + v17 + 24)) {
          break;
        }
      }
      v9 -= 16;
      *(_OWORD *)(a1 + v17 + 32) = *(_OWORD *)(a1 + v17 + 16);
      v17 -= 16;
      if (v17 == -32)
      {
        uint64_t v16 = a1;
        goto LABEL_21;
      }
    }
    uint64_t v16 = a1 + v17 + 32;
  }
LABEL_21:
  *(double *)uint64_t v16 = v13;
  *(_DWORD *)(v16 + 8) = v14;
  *(_DWORD *)(v16 + 12) = v15;
  if (++v12 != 8) {
    goto LABEL_22;
  }
  return v10 + 16 == a2;
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((long long *)a1, (long long *)a2, (long long *)a3);
  result.n128_u64[0] = *(void *)a4;
  if (*(double *)a4 > *(double *)a3 || *(double *)a4 == *(double *)a3 && *(_DWORD *)(a4 + 8) < *(_DWORD *)(a3 + 8))
  {
    __n128 result = *(__n128 *)a3;
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(__n128 *)a4 = result;
    result.n128_u64[0] = *(void *)a3;
    if (*(double *)a3 > *(double *)a2 || *(double *)a3 == *(double *)a2 && *(_DWORD *)(a3 + 8) < *(_DWORD *)(a2 + 8))
    {
      __n128 result = *(__n128 *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(__n128 *)a3 = result;
      result.n128_u64[0] = *(void *)a2;
      if (*(double *)a2 > *(double *)a1 || *(double *)a2 == *(double *)a1 && *(_DWORD *)(a2 + 8) < *(_DWORD *)(a1 + 8))
      {
        __n128 result = *(__n128 *)a1;
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(__n128 *)a2 = result;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5)
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4);
  result.n128_u64[0] = a5->n128_u64[0];
  if (a5->n128_f64[0] > a4->n128_f64[0]
    || a5->n128_f64[0] == a4->n128_f64[0] && (signed __int32)a5->n128_u32[2] < (signed __int32)a4->n128_u32[2])
  {
    __n128 result = *a4;
    *a4 = *a5;
    *a5 = result;
    result.n128_u64[0] = a4->n128_u64[0];
    if (a4->n128_f64[0] > a3->n128_f64[0]
      || a4->n128_f64[0] == a3->n128_f64[0] && (signed __int32)a4->n128_u32[2] < (signed __int32)a3->n128_u32[2])
    {
      __n128 result = *a3;
      *a3 = *a4;
      *a4 = result;
      result.n128_u64[0] = a3->n128_u64[0];
      if (a3->n128_f64[0] > a2->n128_f64[0]
        || a3->n128_f64[0] == a2->n128_f64[0] && (signed __int32)a3->n128_u32[2] < (signed __int32)a2->n128_u32[2])
      {
        __n128 result = *a2;
        *a2 = *a3;
        *a3 = result;
        result.n128_u64[0] = a2->n128_u64[0];
        if (a2->n128_f64[0] > a1->n128_f64[0]
          || a2->n128_f64[0] == a1->n128_f64[0] && (signed __int32)a2->n128_u32[2] < (signed __int32)a1->n128_u32[2])
        {
          __n128 result = *a1;
          *a1 = *a2;
          *a2 = result;
        }
      }
    }
  }
  return result;
}

long long *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *,ProbIndex *>(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  if ((long long *)a1 != a2)
  {
    uint64_t v8 = (uint64_t)a2 - a1;
    uint64_t v9 = ((uint64_t)a2 - a1) >> 4;
    if ((uint64_t)a2 - a1 >= 17)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = a1 + 16 * v10;
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(a1, a4, v9, v12);
        v12 -= 16;
        --v11;
      }
      while (v11);
    }
    double v13 = a2;
    if (a2 != a3)
    {
      int v14 = a2;
      do
      {
        if (*(double *)v14 > *(double *)a1
          || *(double *)v14 == *(double *)a1 && *((_DWORD *)v14 + 2) < *(_DWORD *)(a1 + 8))
        {
          long long v15 = *v14;
          *int v14 = *(_OWORD *)a1;
          *(_OWORD *)a1 = v15;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      double v13 = a3;
    }
    if (v8 >= 17)
    {
      uint64_t v16 = (unint64_t)v8 >> 4;
      uint64_t v17 = a2 - 1;
      do
      {
        long long v21 = *(_OWORD *)a1;
        std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(a1, a4, v16);
        if (v17 == v18)
        {
          *double v18 = v21;
        }
        else
        {
          *double v18 = *v17;
          *uint64_t v17 = v21;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(a1, (uint64_t)(v18 + 1), a4, ((uint64_t)v18 - a1 + 16) >> 4);
        }
        --v17;
      }
      while (v16-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 >= 2)
  {
    uint64_t v4 = a4 - result;
    int64_t v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= (a4 - result) >> 4)
    {
      uint64_t v6 = v4 >> 3;
      uint64_t v7 = (v4 >> 3) + 1;
      uint64_t v8 = result + 16 * v7;
      uint64_t v9 = v6 + 2;
      if (v9 < a3)
      {
        double v10 = *(double *)(v8 + 16);
        if (*(double *)v8 > v10 || *(double *)v8 == v10 && *(_DWORD *)(result + 16 * v7 + 8) < *(_DWORD *)(v8 + 24))
        {
          v8 += 16;
          uint64_t v7 = v9;
        }
      }
      double v11 = *(double *)a4;
      if (*(double *)v8 <= *(double *)a4)
      {
        if (*(double *)v8 == *(double *)a4)
        {
          int v12 = *(_DWORD *)(a4 + 8);
          if (*(_DWORD *)(v8 + 8) < v12) {
            return result;
          }
        }
        else
        {
          int v12 = *(_DWORD *)(a4 + 8);
        }
        int v13 = *(_DWORD *)(a4 + 12);
        *(_OWORD *)a4 = *(_OWORD *)v8;
        if (v5 >= v7)
        {
          while (1)
          {
            uint64_t v15 = 2 * v7;
            uint64_t v7 = (2 * v7) | 1;
            uint64_t v14 = result + 16 * v7;
            uint64_t v16 = v15 + 2;
            if (v16 < a3)
            {
              double v17 = *(double *)(v14 + 16);
              if (*(double *)v14 > v17
                || *(double *)v14 == v17 && *(_DWORD *)(result + 16 * v7 + 8) < *(_DWORD *)(v14 + 24))
              {
                v14 += 16;
                uint64_t v7 = v16;
              }
            }
            if (*(double *)v14 > v11 || *(double *)v14 == v11 && *(_DWORD *)(v14 + 8) < v12) {
              break;
            }
            *(_OWORD *)uint64_t v8 = *(_OWORD *)v14;
            uint64_t v8 = v14;
            if (v5 < v7) {
              goto LABEL_24;
            }
          }
        }
        uint64_t v14 = v8;
LABEL_24:
        *(double *)uint64_t v14 = v11;
        *(_DWORD *)(v14 + 8) = v12;
        *(_DWORD *)(v14 + 12) = v13;
      }
    }
  }
  return result;
}

__n128 std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - 2;
  if (a3 < 2) {
    uint64_t v4 = a3 - 1;
  }
  uint64_t v5 = v4 >> 1;
  do
  {
    uint64_t v6 = (_OWORD *)a1;
    uint64_t v7 = v3 + 1;
    a1 += 16 * (v3 + 1);
    uint64_t v8 = 2 * v3;
    uint64_t v3 = (2 * v3) | 1;
    uint64_t v9 = v8 + 2;
    if (v9 < a3)
    {
      double v10 = *(double *)(a1 + 16);
      if (*(double *)a1 > v10 || *(double *)a1 == v10 && SDWORD2(v6[v7]) < *(_DWORD *)(a1 + 24))
      {
        a1 += 16;
        uint64_t v3 = v9;
      }
    }
    __n128 result = *(__n128 *)a1;
    _OWORD *v6 = *(_OWORD *)a1;
  }
  while (v3 <= v5);
  return result;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,CPMLNBCompareProbIndexDescending &,ProbIndex *>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v5 = v4 >> 1;
    uint64_t v6 = (double *)(result + 16 * (v4 >> 1));
    double v7 = *(double *)(a2 - 16);
    if (*v6 <= v7)
    {
      if (*v6 != v7) {
        return result;
      }
      int v8 = *(_DWORD *)(a2 - 8);
      if (*(_DWORD *)(result + 16 * v5 + 8) >= v8) {
        return result;
      }
    }
    else
    {
      int v8 = *(_DWORD *)(a2 - 8);
    }
    int v9 = *(_DWORD *)(a2 - 4);
    *(_OWORD *)(a2 - 16) = *(_OWORD *)v6;
    if (v4 >= 2)
    {
      while (1)
      {
        unint64_t v11 = v5 - 1;
        unint64_t v5 = (v5 - 1) >> 1;
        double v10 = (double *)(result + 16 * v5);
        if (*v10 <= v7 && (*v10 != v7 || *(_DWORD *)(result + 16 * v5 + 8) >= v8)) {
          break;
        }
        *(_OWORD *)uint64_t v6 = *(_OWORD *)v10;
        uint64_t v6 = (double *)(result + 16 * v5);
        if (v11 <= 1) {
          goto LABEL_12;
        }
      }
    }
    double v10 = v6;
LABEL_12:
    *double v10 = v7;
    *((_DWORD *)v10 + 2) = v8;
    *((_DWORD *)v10 + 3) = v9;
  }
  return result;
}

void std::vector<std::vector<int>>::__assign_with_size[abi:ne180100]<std::vector<int>*,std::vector<int>*>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = a1 + 16;
  int v9 = *(char **)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) < a4)
  {
    std::vector<std::vector<int>>::__vdeallocate((uint64_t *)a1);
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0x5555555555555556 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3);
    if (v10 <= a4) {
      unint64_t v10 = a4;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v10;
    }
    std::vector<std::vector<int>>::__vallocate[abi:ne180100]((void *)a1, v11);
    int v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<int>>,std::vector<int>*,std::vector<int>*,std::vector<int>*>(v8, a2, a3, *(void **)(a1 + 8));
    goto LABEL_11;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3) < a4)
  {
    uint64_t v13 = a2 + 8 * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3);
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<int> *,std::vector<int> *,std::vector<int> *>((int)&v20, a2, v13, v9);
    int v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<int>>,std::vector<int>*,std::vector<int>*,std::vector<int>*>(v8, v13, a3, *(void **)(a1 + 8));
LABEL_11:
    *(void *)(a1 + 8) = v12;
    return;
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<int> *,std::vector<int> *,std::vector<int> *>((int)&v21, a2, a3, v9);
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(a1 + 8);
  if (v16 != v14)
  {
    uint64_t v17 = *(void *)(a1 + 8);
    do
    {
      long long v19 = *(void **)(v17 - 24);
      v17 -= 24;
      double v18 = v19;
      if (v19)
      {
        *(void *)(v16 - 16) = v18;
        operator delete(v18);
      }
      uint64_t v16 = v17;
    }
    while (v17 != v15);
  }
  *(void *)(a1 + 8) = v15;
}

void sub_214344768(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_214344770(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void std::vector<std::vector<int>>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<std::vector<int>>::__clear[abi:ne180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<int>>,std::vector<int>*,std::vector<int>*,std::vector<int>*>(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  unint64_t v4 = a4;
  unint64_t v10 = a4;
  unint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *unint64_t v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v4, *(const void **)v6, *(void *)(v6 + 8), (uint64_t)(*(void *)(v6 + 8) - *(void *)v6) >> 2);
      unint64_t v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::vector<int>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_214344854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::vector<int>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::vector<int>*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::vector<int>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  if (v1 != v2)
  {
    uint64_t v3 = **(void **)(a1 + 16);
    do
    {
      unint64_t v5 = *(void **)(v3 - 24);
      v3 -= 24;
      unint64_t v4 = v5;
      if (v5)
      {
        *(void *)(v1 - 16) = v4;
        operator delete(v4);
      }
      uint64_t v1 = v3;
    }
    while (v3 != v2);
  }
}

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<int> *,std::vector<int> *,std::vector<int> *>(int a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if ((char *)v5 != a4) {
        std::vector<int>::__assign_with_size[abi:ne180100]<int *,int *>(a4, *(char **)v5, *(void *)(v5 + 8), (uint64_t)(*(void *)(v5 + 8) - *(void *)v5) >> 2);
      }
      v5 += 24;
      a4 += 24;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void CPMLKMeans::CPMLKMeans(CPMLKMeans *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, a2, a3, a4);
  *uint64_t v5 = &unk_26C50F938;
  uint64_t v6 = *((int *)a2->var0 + 30);
  uint64_t v7 = *((int *)a2->var0 + 31);
  v5[16] = v7 + 1;
  v5[17] = v6;
  v5[15] = v7 + 2;
  v5[23] = 0;
  CPMLCDB::getIterator();
}

void sub_2143449EC(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void *CPMLKMeans::initializeKMeans(CPMLKMeans *this)
{
  uint64_t v2 = (CPMLTunableData *)*((void *)this + 9);
  if (v2)
  {
    if ((int)CPMLTunableData::getNumberOfItems(v2) < 1)
    {
      *((void *)this + 13) = 20;
      *((void *)this + 2(*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0) = 0x3F847AE147AE147BLL;
      *((_WORD *)this + 76) = 0;
      if (*((void *)this + 14) == -1) {
        *((void *)this + 14) = 2;
      }
    }
    else
    {
      CPMLTunableData::tDataGetUInt64(*((CPMLTunableData **)this + 9), "maxIterations", (unint64_t *)this + 13);
      CPMLTunableData::tDataGetUInt64(*((CPMLTunableData **)this + 9), "kValue", (unint64_t *)this + 14);
      CPMLTunableData::tDataGetDouble(*((CPMLTunableData **)this + 9), "minConvergeValue", (double *)this + 20);
      CPMLTunableData::tDataGetBool(*((CPMLTunableData **)this + 9), "useWeightedkMeans", (BOOL *)this + 152);
      CPMLTunableData::tDataGetBool(*((CPMLTunableData **)this + 9), "useRandomCluster", (BOOL *)this + 153);
    }
  }
  uint64_t v3 = malloc_type_calloc(*((void *)this + 17), 8 * *((void *)this + 15), 0x100004000313F17uLL);
  *((void *)this + 21) = v3;
  if (!v3) {
    return (void *)fprintf((FILE *)*MEMORY[0x263EF8348], "%s cannot initialize kMeansDataSet\n");
  }
  unint64_t v4 = malloc_type_calloc(*((void *)this + 14), 0x30uLL, 0x1080040ECFC1FCFuLL);
  *((void *)this + 22) = v4;
  if (!v4) {
    return (void *)fprintf((FILE *)*MEMORY[0x263EF8348], "%s cannot initialize centroidData\n");
  }
  uint64_t v5 = *((void *)this + 14);
  if (!v5) {
    goto LABEL_17;
  }
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  uint64_t v8 = (FILE **)MEMORY[0x263EF8348];
  do
  {
    *(void *)(*((void *)this + 22) + v6 + 32) = malloc_type_calloc(*((void *)this + 15), 8uLL, 0x100004000313F17uLL);
    char v9 = malloc_type_calloc(*((void *)this + 15), 8uLL, 0x100004000313F17uLL);
    uint64_t v10 = *((void *)this + 22) + v6;
    *(void *)(v10 + 4(*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0) = v9;
    if (*(void *)(v10 + 32))
    {
      if (v9) {
        goto LABEL_12;
      }
    }
    else
    {
      fprintf(*v8, "%s cannot initialize centroidData positionInSpace\n", "initializeKMeans");
      if (*(void *)(*((void *)this + 22) + v6 + 40)) {
        goto LABEL_12;
      }
    }
    fprintf(*v8, "%s cannot initialize centroidData nextPositionInSpace\n", "initializeKMeans");
LABEL_12:
    ++v7;
    unint64_t v11 = *((void *)this + 14);
    v6 += 48;
  }
  while (v7 < v11);
  uint64_t v5 = 8 * v11;
LABEL_17:
  unint64_t v13 = v5 + 8 * *((void *)this + 17) + 56;
  unint64_t v14 = v5 + *((void *)this + 16) * v5 + 40;
  *((void *)this + 12) = v14 + v13;
  __n128 result = malloc_type_calloc(1uLL, v14 + v13, 0x73BA11F4uLL);
  *((void *)this + 5) = result;
  void *result = v13 >> 3;
  result[1] = *((void *)this + 13);
  result[2] = *((void *)this + 14);
  result[3] = *((void *)this + 16);
  result[4] = *((void *)this + 17);
  result[5] = *((void *)this + 17) + 6;
  result[6] = 6;
  if (*((void *)this + 17))
  {
    unint64_t v15 = 0;
    do
      result[v15++ + 6] = -2;
    while (*((void *)this + 17) > v15);
  }
  unint64_t v16 = *((void *)this + 14);
  if (v16)
  {
    for (unint64_t i = 0; i < v16; ++i)
    {
      result[i + result[5]] = 0;
      unint64_t v16 = *((void *)this + 14);
    }
  }
  double v18 = &result[v13 >> 3];
  *(double *)double v18 = (double)(v14 >> 3);
  v18[1] = *((void *)this + 20);
  *((_OWORD *)v18 + 1) = xmmword_214354630;
  uint64_t v19 = *((void *)this + 16) * v16;
  *((double *)v18 + 4) = (double)(unint64_t)(v19 + 5);
  if (v19)
  {
    for (uint64_t j = 0; j != v19; ++j)
      v18[j + (unint64_t)*((double *)v18 + 3)] = 0xC010000000000000;
  }
  if (v16)
  {
    for (uint64_t k = 0; k != v16; ++k)
      v18[k + (unint64_t)*((double *)v18 + 4)] = 0xC014000000000000;
  }
  return result;
}

void CPMLKMeans::CPMLKMeans(CPMLKMeans *this, CPMLSerialization *a2, CPMLTunableData *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, a2, a3);
  *uint64_t v5 = &unk_26C50F938;
  (*((void (**)(CPMLSerialization *, void *, const char *, uint64_t, void))a2->var0 + 10))(a2, v5 + 16, "totalCols", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 136, "totalRows", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 112, "kValue", 1, 0);
  *((void *)this + 23) = 0;
  uint64_t v6 = *((void *)this + 16) + 1;
  *((void *)this + 14) = -1;
  *((void *)this + 15) = v6;
  CPMLKMeans::initializeKMeans(this);
  if (*((void *)this + 14))
  {
    unint64_t v7 = 0;
    uint64_t v8 = 32;
    do
    {
      uint64_t v9 = *(void *)(*((void *)this + 22) + v8);
      sprintf(v10, "centroid%lld", v7);
      (*((void (**)(CPMLSerialization *, uint64_t, char *, void, void))a2->var0 + 12))(a2, v9, v10, *((void *)this + 15), 0);
      ++v7;
      v8 += 48;
    }
    while (v7 < *((void *)this + 14));
  }
  (*(void (**)(void, void, const char *, void, void))(**((void **)this + 11) + 80))(*((void *)this + 11), *((void *)this + 5), "modelDataInt", **((void **)this + 5), 0);
  (*(void (**)(void))(**((void **)this + 11) + 96))(*((void *)this + 11));
}

void sub_214345004(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPMLKMeans::CPMLKMeans(CPMLKMeans *this, int a2, int a3, double **a4, int a5, int a6, double a7, int a8, CPMLTunableData *a9)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, 0, a9);
  *(void *)uint64_t v15 = &unk_26C50F938;
  *(void *)(v15 + 12(*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0) = a2 + 1;
  *(void *)(v15 + 128) = a2;
  *(void *)(v15 + 136) = a3;
  *(void *)(v15 + 104) = a6;
  *(void *)(v15 + 112) = a5;
  *(double *)(v15 + 16(*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0) = a7;
  *(unsigned char *)(v15 + 152) = a8 & 1;
  *(unsigned char *)(v15 + 153) = a8 < 0;
  CPMLKMeans::initializeKMeans((CPMLKMeans *)v15);
  operator new();
}

void sub_214345128(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v2, 0x10A1C40B2F27C95);
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPMLKMeans::~CPMLKMeans(CPMLKMeans *this)
{
  *(void *)this = &unk_26C50F938;
  uint64_t v2 = *((void *)this + 14);
  uint64_t v3 = (char *)*((void *)this + 22);
  if (v2)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      free(*(void **)&v3[v4 + 32]);
      uint64_t v6 = *((void *)this + 22) + v4;
      *(void *)(v6 + 32) = 0;
      free(*(void **)(v6 + 40));
      uint64_t v3 = (char *)*((void *)this + 22);
      *(void *)&v3[v4 + 40] = 0;
      ++v5;
      v4 += 48;
    }
    while (v5 < *((void *)this + 14));
  }
  free(v3);
  *((void *)this + 22) = 0;
  free(*((void **)this + 21));
  *((void *)this + 21) = 0;
  free(*((void **)this + 5));
  *((void *)this + 5) = 0;
  uint64_t v7 = *((void *)this + 23);
  if (v7)
  {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    *((void *)this + 23) = 0;
  }

  CPModelClose(this);
}

{
  uint64_t vars8;

  CPMLKMeans::~CPMLKMeans(this);

  JUMPOUT(0x21669DB80);
}

uint64_t CPMLKMeans::serialize(CPMLKMeans *this)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 128, "totalCols", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 136, "totalRows", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 112, "kValue", 1, 0);
  if (*((void *)this + 14))
  {
    unint64_t v2 = 0;
    uint64_t v3 = 32;
    do
    {
      uint64_t v4 = *(void *)(*((void *)this + 22) + v3);
      sprintf(v8, "centroid%lld", v2);
      (*(void (**)(void, uint64_t, char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), v4, v8, *((void *)this + 15), 0);
      ++v2;
      v3 += 48;
    }
    while (v2 < *((void *)this + 14));
  }
  unint64_t v5 = (double *)(*((void *)this + 5) + 8 * **((void **)this + 5));
  unint64_t v6 = (unint64_t)*v5;
  (*(void (**)(void))(**((void **)this + 11) + 32))(*((void *)this + 11));
  (*(void (**)(void, double *, const char *, unint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), v5, "modelDataReal", v6, 0);
  return 0;
}

uint64_t CPMLKMeans::train(CPMLKMeans *this)
{
  v84[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
  if (v2)
  {
    uint64_t v4 = (CPMLFeatureVector *)v2;
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      IntVector = (int **)CPMLFeatureVector::getIntVector(v4);
      uint64_t v8 = *IntVector;
      uint64_t v9 = (char *)IntVector[1] - (char *)*IntVector;
      if (v9)
      {
        unint64_t v10 = v9 >> 2;
        if (v10 <= 1) {
          unint64_t v10 = 1;
        }
        uint64_t v11 = (double *)(*((void *)this + 21) + *((void *)this + 15) * v5);
        do
        {
          int v12 = *v8++;
          *v11++ = (double)v12;
          --v10;
        }
        while (v10);
      }
      uint64_t RealVector = CPMLFeatureVector::getRealVector(v4);
      unint64_t v14 = *(uint64_t **)RealVector;
      uint64_t v15 = *(void *)(RealVector + 8) - *(void *)RealVector;
      if (v15)
      {
        unint64_t v16 = v15 >> 3;
        if (v16 <= 1) {
          unint64_t v16 = 1;
        }
        uint64_t v17 = (void *)(*((void *)this + 21)
                       + 8
                       * (*((void *)this + 15) * v6
                        + ((unint64_t)((char *)IntVector[1] - (char *)*IntVector) >> 2)));
        do
        {
          uint64_t v18 = *v14++;
          *v17++ = v18;
          --v16;
        }
        while (v16);
      }
      double YHat = CPMLFeatureVector::getYHat(v4);
      uint64_t v20 = *((void *)this + 15);
      uint64_t v21 = *(void *)(RealVector + 8) - *(void *)RealVector;
      uint64_t v22 = (char *)IntVector[1] - (char *)*IntVector;
      unint64_t v23 = v20 * v6 + (v21 >> 3) + (v22 >> 2);
      *(double *)(*((void *)this + 21) + 8 * v23) = YHat;
      if (v23 > *((void *)this + 17) * v20) {
        break;
      }
      ++v6;
      uint64_t v4 = (CPMLFeatureVector *)(*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
      v5 += 8;
      if (!v4) {
        goto LABEL_17;
      }
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "Index access beyond allocated. %d : %d : %d : %d\n", v6, *((void *)this + 16), v21 >> 3, v22 >> 2);
    return 0xFFFFFFFFLL;
  }
  unint64_t v6 = 0;
LABEL_17:
  if (*((void *)this + 14) > v6)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "kMeans %s cannot have more centroid than training rows\n", "train");
    return 0xFFFFFFFFLL;
  }
  MEMORY[0x270FA5388](0, v3);
  long long v25 = (char *)v84 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v26 = time(0);
  srand(v26);
  unint64_t v27 = *((void *)this + 14);
  if (v27)
  {
    for (unint64_t i = 0; i < v27; ++i)
    {
      if (*((unsigned char *)this + 153)) {
        unint64_t v29 = rand() % v6;
      }
      else {
        unint64_t v29 = v6 / v27 * i;
      }
      uint64_t v30 = *((void *)this + 16);
      uint64_t v31 = *((void *)this + 22);
      if (v30)
      {
        uint64_t v32 = v31 + 48 * i;
        unint64_t v33 = *(uint64_t **)(v32 + 32);
        uint64_t v34 = *(void **)(v32 + 40);
        unint64_t v35 = (uint64_t *)(*((void *)this + 21) + 8 * v29 * *((void *)this + 15));
        do
        {
          *v33++ = *v35;
          uint64_t v36 = *v35++;
          *v34++ = v36;
          --v30;
        }
        while (v30);
      }
      int v37 = (void *)(v31 + 48 * i);
      *int v37 = 0xBFF0000000000000;
      v37[3] = 0;
      *(void *)&v25[8 * i] = v29;
      unint64_t v27 = *((void *)this + 14);
      if (i && v27 < v6)
      {
        uint64_t v38 = 0;
        while (*(void *)&v25[8 * v38] != v29)
        {
          if (i == ++v38) {
            goto LABEL_34;
          }
        }
        --i;
      }
LABEL_34:
      ;
    }
  }
  unint64_t v39 = 0;
  double v40 = 0.0;
  do
  {
    if (v27)
    {
      uint64_t v41 = *((void *)this + 16);
      uint64_t v42 = (void **)(*((void *)this + 22) + 40);
      unint64_t v43 = v27;
      do
      {
        *(v42 - 4) = 0;
        *(v42 - 3) = 0;
        *(v42 - 2) = 0;
        if (v41) {
          bzero(*v42, 8 * v41);
        }
        v42 += 6;
        --v43;
      }
      while (v43);
    }
    unint64_t v44 = *((void *)this + 17);
    if (v44)
    {
      unint64_t v45 = 0;
      uint64_t v46 = *((void *)this + 21);
      uint64_t v47 = *((void *)this + 15);
      do
      {
        unint64_t NearestCentroid = CPMLKMeans::findNearestCentroid(this, (double *)(v46 + 8 * v47 * v45));
        uint64_t v47 = *((void *)this + 15);
        uint64_t v46 = *((void *)this + 21);
        uint64_t v49 = *((void *)this + 22);
        *(double *)(v46 + 8 * (*((void *)this + 16) + v47 * v45)) = (double)NearestCentroid;
        *(double *)(v49 + 48 * NearestCentroid + 24) = *(double *)(v49 + 48 * NearestCentroid + 24) + 1.0;
        ++v45;
        unint64_t v44 = *((void *)this + 17);
      }
      while (v44 > v45);
      unint64_t v27 = *((void *)this + 14);
    }
    if (v27)
    {
      uint64_t v50 = (double *)*((void *)this + 22);
      double v51 = 0.0;
      unint64_t v52 = v27;
      do
      {
        double v53 = v50[3];
        if (v53 == 0.0) {
          double v54 = *((double *)this + 20);
        }
        else {
          double v54 = v50[1] / v53;
        }
        *uint64_t v50 = v54;
        v50 += 6;
        double v51 = v51 + v54;
        --v52;
      }
      while (v52);
    }
    else
    {
      double v51 = 0.0;
    }
    double v55 = vabdd_f64(v40, v51);
    double v56 = *((double *)this + 20);
    if (v55 > v56 && ++v39 < *((void *)this + 13))
    {
      if (v27)
      {
        uint64_t v57 = 0;
        uint64_t v58 = *((void *)this + 16);
        do
        {
          if (v58)
          {
            uint64_t v59 = 0;
            uint64_t v60 = *((void *)this + 22) + 48 * v57;
            uint64_t v61 = (double *)(v60 + 24);
            double v62 = (void *)(v60 + 40);
            uint64_t v63 = (void *)(v60 + 32);
            do
            {
              if (*v61 != 0.0) {
                *(double *)(*v63 + 8 * v59) = *(double *)(*v62 + 8 * v59) / *v61;
              }
              ++v59;
            }
            while (v58 != v59);
          }
          ++v57;
        }
        while (v57 != v27);
        double v56 = *((double *)this + 20);
      }
    }
    if (v55 <= v56) {
      break;
    }
    double v40 = v51;
  }
  while (v39 < *((void *)this + 13));
  int v64 = (uint64_t *)*((void *)this + 5);
  if (v44)
  {
    unint64_t v65 = 0;
    uint64_t v66 = v64[5];
    int v67 = (FILE **)MEMORY[0x263EF8348];
    do
    {
      unint64_t v68 = (unint64_t)*(double *)(*((void *)this + 21)
                                        + 8 * (*((void *)this + 16) + *((void *)this + 15) * v65));
      if (*((void *)this + 14) <= v68)
      {
        fprintf(*v67, "%s Cluster value shouldn't be greater than kValue\n", "train");
      }
      else
      {
        uint64_t v69 = *((void *)this + 5);
        *(void *)(v69 + 8 * v65 + 48) = v68;
        ++*(void *)(v69 + 8 * (v66 + v68));
      }
      ++v65;
    }
    while (v65 < *((void *)this + 17));
    int v64 = (uint64_t *)*((void *)this + 5);
    unint64_t v27 = *((void *)this + 14);
  }
  uint64_t v70 = *v64;
  uint64_t v71 = (double *)&v64[*v64];
  v71[2] = CPMLKMeans::findTotss(this, *((double **)this + 21));
  if (v27)
  {
    uint64_t v72 = 0;
    double v73 = &v64[(unint64_t)v71[4] + v70];
    double v74 = (uint64_t *)(*((void *)this + 22) + 16);
    do
    {
      uint64_t v75 = *v74;
      v74 += 6;
      v73[v72++] = v75;
    }
    while (v27 != v72);
    uint64_t v76 = 0;
    uint64_t v77 = *((void *)this + 16);
    uint64_t v78 = &v64[(unint64_t)v71[3] + v70];
    do
    {
      if (v77)
      {
        double v79 = *(uint64_t **)(*((void *)this + 22) + 48 * v76 + 32);
        uint64_t v80 = v78;
        uint64_t v81 = v77;
        do
        {
          uint64_t v82 = *v79++;
          *v80++ = v82;
          --v81;
        }
        while (v81);
      }
      ++v76;
      v78 += v77;
    }
    while (v76 != v27);
  }
  return 0;
}

uint64_t CPMLKMeans::findNearestCentroid(CPMLKMeans *this, double *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((char *)this + 152);
  uint64_t v3 = *((void *)this + 16);
  uint64_t v4 = *((void *)this + 14);
  unint64_t v5 = v3 - v2;
  if (v3 == v2 || !v4)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "%s feature vector length %lld or kValue %lld\n", "findNearestCentroid", v5, v4);
    return 0;
  }
  else
  {
    v30[1] = v30;
    uint64_t v8 = MEMORY[0x270FA5388](this, a2);
    uint64_t v9 = (double *)((char *)v30 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v10 = *(void *)(v8 + 112);
    uint64_t v31 = *(void *)(v8 + 176);
    if (v10)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      int v13 = *((unsigned __int8 *)this + 152);
      double v14 = 1.79769313e308;
      double v15 = 1.79769313e308;
      do
      {
        unint64_t v16 = *(double **)(v31 + 48 * v11 + 32);
        memcpy((char *)v30 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), a2, 8 * v5);
        double v17 = 0.0;
        uint64_t v18 = a2;
        unint64_t v19 = v5;
        do
        {
          double v20 = *v18++;
          double v21 = v20;
          double v22 = *v16++;
          double v17 = v17 + (v21 - v22) * (v21 - v22);
          --v19;
        }
        while (v19);
        double v23 = sqrt(v17);
        if (v13) {
          double v23 = v23 * a2[*((void *)this + 16) - 1];
        }
        if (v23 < v15)
        {
          uint64_t v12 = v11;
          double v15 = v23;
          double v14 = v23 * v23;
        }
        ++v11;
      }
      while (v11 != v10);
    }
    else
    {
      uint64_t v12 = 0;
      double v15 = 1.79769313e308;
      double v14 = 1.79769313e308;
    }
    uint64_t v24 = *(double **)(v31 + 48 * v12 + 40);
    if (v5 <= 1) {
      uint64_t v25 = 1;
    }
    else {
      uint64_t v25 = v5;
    }
    do
    {
      double v26 = *v9++;
      double *v24 = v26 + *v24;
      ++v24;
      --v25;
    }
    while (v25);
    uint64_t v27 = v31 + 48 * v12;
    double v28 = v14 + *(double *)(v27 + 16);
    *(double *)(v27 + 8) = v15 + *(double *)(v27 + 8);
    *(double *)(v27 + 16) = v28;
  }
  return v12;
}

double CPMLKMeans::findTotss(CPMLKMeans *this, double *a2)
{
  v26[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *((void *)this + 16) - *((char *)this + 152);
  MEMORY[0x270FA5388](this, 8 * v4);
  uint64_t v7 = (double *)((char *)v26 - v6);
  if (v4) {
    bzero((char *)v26 - v6, v5);
  }
  unint64_t v8 = *((void *)this + 17);
  if (v8)
  {
    uint64_t v9 = 0;
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (v4)
      {
        uint64_t v11 = (double *)((char *)a2 + *((void *)this + 15) * v9);
        uint64_t v12 = v7;
        uint64_t v13 = v4;
        do
        {
          double v14 = *v11++;
          *uint64_t v12 = v14 + *v12;
          ++v12;
          --v13;
        }
        while (v13);
      }
      v9 += 8;
    }
  }
  if (v4)
  {
    double v15 = v7;
    uint64_t v16 = v4;
    do
    {
      *double v15 = *v15 / (double)v8;
      ++v15;
      --v16;
    }
    while (v16);
  }
  if (!v8) {
    return 0.0;
  }
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  double result = 0.0;
  do
  {
    if (v4)
    {
      double v20 = (double *)((char *)a2 + *((void *)this + 15) * v17);
      double v21 = v7;
      uint64_t v22 = v4;
      do
      {
        double v23 = *v20++;
        double v24 = v23;
        double v25 = *v21++;
        double result = result + (v24 - v25) * (v24 - v25);
        --v22;
      }
      while (v22);
    }
    ++v18;
    v17 += 8;
  }
  while (v18 != v8);
  return result;
}

uint64_t CPMLKMeans::eval(void *a1, CPMLFeatureVector *a2)
{
  uint64_t v4 = (double *)malloc_type_calloc(8 * a1[15], 1uLL, 0x30327CF8uLL);
  IntVector = (int **)CPMLFeatureVector::getIntVector(a2);
  uint64_t v6 = *IntVector;
  uint64_t v7 = (char *)IntVector[1] - (char *)*IntVector;
  if (v7)
  {
    unint64_t v8 = v7 >> 2;
    if (v8 <= 1) {
      unint64_t v8 = 1;
    }
    uint64_t v9 = v4;
    do
    {
      int v10 = *v6++;
      *v9++ = (double)v10;
      --v8;
    }
    while (v8);
  }
  uint64_t RealVector = CPMLFeatureVector::getRealVector(a2);
  uint64_t v12 = *(uint64_t **)RealVector;
  uint64_t v13 = *(void *)(RealVector + 8) - *(void *)RealVector;
  if (v13)
  {
    unint64_t v14 = v13 >> 3;
    if (v14 <= 1) {
      unint64_t v14 = 1;
    }
    double v15 = (void *)((char *)v4 + 2 * ((char *)IntVector[1] - (char *)*IntVector));
    do
    {
      uint64_t v16 = *v12++;
      *v15++ = v16;
      --v14;
    }
    while (v14);
  }
  uint64_t v17 = a1[14];
  if (v17)
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    double v20 = 1.79769313e308;
    do
    {
      if (a1[16])
      {
        double v21 = *(double **)(a1[22] + 48 * v18 + 32);
        double v22 = 0.0;
        uint64_t v23 = a1[16];
        double v24 = v4;
        do
        {
          double v25 = *v24++;
          double v26 = v25;
          double v27 = *v21++;
          double v22 = v22 + (v26 - v27) * (v26 - v27);
          --v23;
        }
        while (v23);
      }
      else
      {
        double v22 = 0.0;
      }
      double v28 = sqrt(v22);
      if (v28 < v20)
      {
        uint64_t v19 = v18;
        double v20 = v28;
      }
      ++v18;
    }
    while (v18 != v17);
    double v29 = (double)v19;
  }
  else
  {
    double v29 = 9.22337204e18;
  }
  CPMLFeatureVector::setYHat((uint64_t)a2, v29);
  free(v4);
  return 0;
}

void CPMLKMeans::update(CPMLKMeans *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
}

uint64_t CPMLKMeans::errorString(CPMLKMeans *this)
{
  return 0;
}

uint64_t CPMLKMeans::getModelData(CPMLKMeans *this)
{
  return *((void *)this + 5);
}

uint64_t CPMLKMeans::requireRealOnly(CPMLKMeans *this)
{
  return 1;
}

void CPMLCDB::CPMLCDB(CPMLCDB *this, sqlite3 *a2, sqlite3 *a3, CPMLTunableData *a4)
{
  this->var1 = a2;
  this->int var2 = a3;
  this->size_t var3 = 0;
  this->var4 = 0;
  this->var5 = a4;
}

void CPMLCDB::CPMLCDB(CPMLCDB *this, sqlite3 *a2, sqlite3 *a3, CPMLRemapper *a4, CPMLTunableData *a5)
{
  this->var1 = a2;
  this->int var2 = a3;
  this->size_t var3 = 0;
  this->var4 = a4;
  this->var5 = a5;
}

void CPMLCDB::~CPMLCDB(CPMLCDB *this)
{
  size_t var3 = this->var3;
  if (var3) {
    (*(void (**)(CPMLIterator *))(*(void *)var3 + 8))(var3);
  }
}

void CPMLCDB::getIterator()
{
}

void sub_2143460E0(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x10A1C4023273D81);
  _Unwind_Resume(a1);
}

uint64_t CPMLDBSerialization::cp_read(CPMLDBSerialization *this, int *a2, const char *a3, uint64_t a4, uint64_t a5)
{
  if (a5) {
    unint64_t v8 = sqlite3_mprintf("select * from %q where pkey=%d", a3, a5 + 1);
  }
  else {
    unint64_t v8 = sqlite3_mprintf("select * from %q", a3);
  }

  return CPMLDBSerialization::do_cp_read(this, a2, a4, v8);
}

uint64_t CPMLDBSerialization::do_cp_read(CPMLDBSerialization *this, int *a2, uint64_t a3, char *__s)
{
  unint64_t v8 = (sqlite3 *)*((void *)this + 4);
  int v9 = strlen(__s);
  int v10 = (sqlite3_stmt **)((char *)this + 40);
  sqlite3_prepare_v2(v8, __s, v9, v10, 0);
  if (__s) {
    sqlite3_free(__s);
  }
  if (a3)
  {
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = (CPMLLog *)sqlite3_step(*v10);
      if (v12 != 100) {
        break;
      }
      a2[v11++] = sqlite3_column_int(*v10, 0);
      if (a3 == v11) {
        goto LABEL_7;
      }
    }
    if (v12 == 101)
    {
      sqlite3_finalize(*v10);
      return v11;
    }
    else
    {
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v12);
      CPMLLog::log(CPMLLog, CPML_LOG_ERR, "do_cp_read", "Serializer: Error iterating rows\n");
      sqlite3_finalize(*v10);
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
LABEL_7:
    sqlite3_finalize(*v10);
  }
  return a3;
}

uint64_t CPMLDBSerialization::cp_update_int(CPMLDBSerialization *this, uint64_t a2, char *a3, char *a4, int a5)
{
  uint64_t v6 = sqlite3_mprintf("UPDATE %q SET %q=%d where pKey=%d", a3, a4, a2, (a5 + 1));
  uint64_t v7 = (sqlite3 *)*((void *)this + 4);
  int v8 = strlen(v6);
  int v9 = (sqlite3_stmt **)((char *)this + 40);
  sqlite3_prepare_v2(v7, v6, v8, v9, 0);
  if (v6) {
    sqlite3_free(v6);
  }
  int v10 = (CPMLLog *)sqlite3_step(*v9);
  if (v10 == 101)
  {
    uint64_t v11 = 0;
  }
  else
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v10);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_update_int", "Serializer: Error iterating rows\n");
    uint64_t v11 = 0xFFFFFFFFLL;
  }
  sqlite3_finalize(*v9);
  return v11;
}

uint64_t CPMLDBSerialization::cp_read(CPMLDBSerialization *this, unsigned int *a2, const char *a3, uint64_t a4, uint64_t a5)
{
  if (a5) {
    int v8 = sqlite3_mprintf("select * from %q where pkey=%d", a3, a5 + 1);
  }
  else {
    int v8 = sqlite3_mprintf("select * from %q", a3);
  }
  int v9 = v8;
  int v10 = (sqlite3 *)*((void *)this + 4);
  int v11 = strlen(v8);
  uint64_t v12 = (sqlite3_stmt **)((char *)this + 48);
  sqlite3_prepare_v2(v10, v9, v11, v12, 0);
  if (v9) {
    sqlite3_free(v9);
  }
  if (a4)
  {
    while (1)
    {
      uint64_t v13 = (CPMLLog *)sqlite3_step(*v12);
      if (v13 != 100) {
        break;
      }
      *a2++ = sqlite3_column_int(*v12, 0);
      if (!--a4) {
        goto LABEL_13;
      }
    }
    if (v13 == 101)
    {
      a4 = 0;
    }
    else
    {
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v13);
      CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_read", "Serializer: Error iterating rows\n");
      a4 = 0xFFFFFFFFLL;
    }
  }
LABEL_13:
  sqlite3_finalize(*v12);
  return a4;
}

uint64_t CPMLDBSerialization::cp_read(CPMLDBSerialization *this, sqlite3_int64 *a2, const char *a3, uint64_t a4, uint64_t a5)
{
  if (a5) {
    int v8 = sqlite3_mprintf("select * from %q where pkey=%d", a3, a5 + 1);
  }
  else {
    int v8 = sqlite3_mprintf("select * from %q", a3);
  }

  return CPMLDBSerialization::do_cp_read(this, a2, a4, v8);
}

uint64_t CPMLDBSerialization::do_cp_read(CPMLDBSerialization *this, sqlite3_int64 *a2, uint64_t a3, char *__s)
{
  int v8 = (sqlite3 *)*((void *)this + 4);
  int v9 = strlen(__s);
  int v10 = (sqlite3_stmt **)((char *)this + 56);
  sqlite3_prepare_v2(v8, __s, v9, v10, 0);
  if (__s) {
    sqlite3_free(__s);
  }
  if (a3)
  {
    while (1)
    {
      int v11 = (CPMLLog *)sqlite3_step(*v10);
      if (v11 != 100) {
        break;
      }
      *a2++ = sqlite3_column_int64(*v10, 0);
      if (!--a3) {
        goto LABEL_10;
      }
    }
    int v12 = (int)v11;
    if (v11 == 101)
    {
      a3 = 0;
      *a2 = 0;
    }
    else
    {
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v11);
      CPMLLog::log(CPMLLog, CPML_LOG_ERR, "do_cp_read", "cp_readDefault Error iterating rows %d\n", v12);
      a3 = 0xFFFFFFFFLL;
    }
  }
LABEL_10:
  sqlite3_finalize(*v10);
  return a3;
}

uint64_t CPMLDBSerialization::cp_multiQuery_uint64_t(CPMLDBSerialization *this, sqlite3_int64 *a2, uint64_t a3, const char *a4)
{
  uint64_t v7 = sqlite3_mprintf("%s", a4);

  return CPMLDBSerialization::do_cp_read(this, a2, a3, v7);
}

uint64_t CPMLDBSerialization::cp_query_uint64_t(CPMLDBSerialization *this, sqlite3_int64 *a2, uint64_t a3, char *a4, char *a5, int a6)
{
  int v9 = sqlite3_mprintf("select %q from %q where pKey BETWEEN %d AND %d", a5, a4, (a6 + 1), a3 + a6 + 1);

  return CPMLDBSerialization::do_cp_read(this, a2, a3, v9);
}

uint64_t CPMLDBSerialization::cp_update_uint64_t(CPMLDBSerialization *this, uint64_t a2, char *a3, char *a4, int a5)
{
  uint64_t v6 = sqlite3_mprintf("UPDATE %q SET %q=%ld where pKey=%d", a3, a4, a2, (a5 + 1));
  uint64_t v7 = (sqlite3 *)*((void *)this + 4);
  int v8 = strlen(v6);
  int v9 = (sqlite3_stmt **)((char *)this + 56);
  sqlite3_prepare_v2(v7, v6, v8, v9, 0);
  if (v6) {
    sqlite3_free(v6);
  }
  int v10 = (CPMLLog *)sqlite3_step(*v9);
  if (v10 == 101)
  {
    uint64_t v11 = 0;
  }
  else
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v10);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_update_uint64_t", "Serializer: Error iterating rows\n");
    uint64_t v11 = 0xFFFFFFFFLL;
  }
  sqlite3_finalize(*v9);
  return v11;
}

uint64_t CPMLDBSerialization::cp_read(CPMLDBSerialization *this, float *a2, const char *a3, uint64_t a4, uint64_t a5)
{
  if (a5) {
    int v8 = sqlite3_mprintf("select * from %q where pkey=%d", a3, a5 + 1);
  }
  else {
    int v8 = sqlite3_mprintf("select * from %q", a3);
  }
  int v9 = v8;
  int v10 = (sqlite3 *)*((void *)this + 4);
  int v11 = strlen(v8);
  int v12 = (sqlite3_stmt **)((char *)this + 64);
  sqlite3_prepare_v2(v10, v9, v11, v12, 0);
  if (v9) {
    sqlite3_free(v9);
  }
  if (a4)
  {
    while (1)
    {
      uint64_t v13 = (CPMLLog *)sqlite3_step(*v12);
      if (v13 != 100) {
        break;
      }
      if (sqlite3_column_type(*v12, 0) == 5) {
        float v14 = nanf("");
      }
      else {
        float v14 = sqlite3_column_double(*v12, 0);
      }
      *a2++ = v14;
      if (!--a4) {
        goto LABEL_16;
      }
    }
    if (v13 == 101)
    {
      a4 = 0;
    }
    else
    {
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v13);
      CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_read", "Serializer: Error iterating rows\n");
      a4 = 0xFFFFFFFFLL;
    }
  }
LABEL_16:
  sqlite3_finalize(*v12);
  return a4;
}

uint64_t CPMLDBSerialization::cp_read(CPMLDBSerialization *this, double *a2, const char *a3, uint64_t a4, uint64_t a5)
{
  if (a5) {
    int v8 = sqlite3_mprintf("select * from %q where pkey=%d", a3, a5 + 1);
  }
  else {
    int v8 = sqlite3_mprintf("select * from %q", a3);
  }

  return CPMLDBSerialization::do_cp_read(this, a2, a4, v8);
}

uint64_t CPMLDBSerialization::do_cp_read(CPMLDBSerialization *this, double *a2, uint64_t a3, char *__s)
{
  int v8 = (sqlite3 *)*((void *)this + 4);
  int v9 = strlen(__s);
  int v10 = (sqlite3_stmt **)((char *)this + 72);
  sqlite3_prepare_v2(v8, __s, v9, v10, 0);
  if (__s) {
    sqlite3_free(__s);
  }
  if (a3)
  {
    while (1)
    {
      int v11 = (CPMLLog *)sqlite3_step(*v10);
      if (v11 != 100) {
        break;
      }
      if (sqlite3_column_type(*v10, 0) == 5) {
        double v12 = nan("");
      }
      else {
        double v12 = sqlite3_column_double(*v10, 0);
      }
      *a2++ = v12;
      if (!--a3) {
        goto LABEL_13;
      }
    }
    if (v11 == 101)
    {
      a3 = 0;
    }
    else
    {
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v11);
      CPMLLog::log(CPMLLog, CPML_LOG_ERR, "do_cp_read", "Serializer: Error iterating rows\n");
      a3 = 0xFFFFFFFFLL;
    }
  }
LABEL_13:
  sqlite3_finalize(*v10);
  return a3;
}

uint64_t CPMLDBSerialization::cp_multiQuery_double(CPMLDBSerialization *this, double *a2, uint64_t a3, const char *a4)
{
  uint64_t v7 = sqlite3_mprintf("%s", a4);

  return CPMLDBSerialization::do_cp_read(this, a2, a3, v7);
}

uint64_t CPMLDBSerialization::cp_query_double(CPMLDBSerialization *this, double *a2, uint64_t a3, char *a4, char *a5, int a6)
{
  int v9 = sqlite3_mprintf("select %q from %q where pKey BETWEEN %d AND %d", a5, a4, (a6 + 1), a3 + a6 + 1);

  return CPMLDBSerialization::do_cp_read(this, a2, a3, v9);
}

uint64_t CPMLDBSerialization::cp_update_double(CPMLDBSerialization *this, double a2, char *a3, char *a4, int a5)
{
  uint64_t v6 = sqlite3_mprintf("UPDATE %q SET %q=%lf where pKey=%d", a3, a4, *(void *)&a2, (a5 + 1));
  uint64_t v7 = (sqlite3 *)*((void *)this + 4);
  int v8 = strlen(v6);
  int v9 = (sqlite3_stmt **)((char *)this + 72);
  sqlite3_prepare_v2(v7, v6, v8, v9, 0);
  if (v6) {
    sqlite3_free(v6);
  }
  int v10 = (CPMLLog *)sqlite3_step(*v9);
  if (v10 == 101)
  {
    uint64_t v11 = 0;
  }
  else
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v10);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_update_double", "Serializer: Error iterating rows\n");
    uint64_t v11 = 0xFFFFFFFFLL;
  }
  sqlite3_finalize(*v9);
  return v11;
}

uint64_t CPMLDBSerialization::cp_read(CPMLDBSerialization *this, char *a2, const char *a3, uint64_t a4, uint64_t a5)
{
  if (a5) {
    int v8 = sqlite3_mprintf("select * from %q where pkey=%d", a3, a5 + 1);
  }
  else {
    int v8 = sqlite3_mprintf("select * from %q", a3);
  }
  int v9 = *(uint64_t (**)(CPMLDBSerialization *, char *, uint64_t, char *))(*(void *)this + 184);

  return v9(this, a2, a4, v8);
}

uint64_t CPMLDBSerialization::cp_singleQuery_string(CPMLDBSerialization *this, char *a2, size_t a3, char *__s)
{
  uint64_t v6 = (sqlite3_stmt **)((char *)this + 80);
  if (!*((void *)this + 10))
  {
    int v8 = (sqlite3 *)*((void *)this + 4);
    int v9 = strlen(__s);
    sqlite3_prepare_v2(v8, __s, v9, v6, 0);
    if (__s) {
      sqlite3_free(__s);
    }
  }
  int v10 = (CPMLLog *)sqlite3_step(*v6);
  if (v10 == 100)
  {
    double v12 = sqlite3_column_text(*v6, 0);
    strlcpy(a2, (const char *)v12, a3);
    uint64_t v11 = 0;
  }
  else if (v10 == 101)
  {
    uint64_t v11 = 0;
    *a2 = 0;
  }
  else
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v10);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_singleQuery_string", "Serializer: Error iterating rows\n");
    uint64_t v11 = 0xFFFFFFFFLL;
  }
  sqlite3_finalize(*v6);
  char *v6 = 0;
  return v11;
}

uint64_t CPMLDBSerialization::cp_singleQuery_uint64_t(CPMLDBSerialization *this, sqlite3_int64 *a2, char *__s)
{
  uint64_t v6 = (sqlite3 *)*((void *)this + 4);
  int v7 = strlen(__s);
  int v8 = (sqlite3_stmt **)((char *)this + 88);
  sqlite3_prepare_v2(v6, __s, v7, (sqlite3_stmt **)this + 11, 0);
  int v9 = (CPMLLog *)sqlite3_step(*((sqlite3_stmt **)this + 11));
  if (v9 == 100)
  {
    if (sqlite3_column_type(*v8, 0) == 5) {
      sqlite3_int64 v11 = 0;
    }
    else {
      sqlite3_int64 v11 = sqlite3_column_int64(*v8, 0);
    }
    *a2 = v11;
    sqlite3_finalize(*v8);
    return 0;
  }
  else if (v9 == 101)
  {
    sqlite3_finalize(*v8);
    uint64_t result = 0;
    *a2 = 0;
  }
  else
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v9);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_singleQuery_uint64_t", "Serializer: Error iterating rows\n");
    sqlite3_finalize(*v8);
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t CPMLDBSerialization::cp_singleQuery_double(CPMLDBSerialization *this, double *a2, char *__s)
{
  uint64_t v6 = (sqlite3 *)*((void *)this + 4);
  int v7 = strlen(__s);
  int v8 = (sqlite3_stmt **)((char *)this + 88);
  sqlite3_prepare_v2(v6, __s, v7, (sqlite3_stmt **)this + 11, 0);
  int v9 = (CPMLLog *)sqlite3_step(*((sqlite3_stmt **)this + 11));
  if (v9 == 100)
  {
    if (sqlite3_column_type(*v8, 0) == 5) {
      double v12 = nan("");
    }
    else {
      double v12 = sqlite3_column_double(*v8, 0);
    }
    *a2 = v12;
    sqlite3_finalize(*v8);
    return 0;
  }
  else
  {
    int v10 = (int)v9;
    if (v9 == 101)
    {
      sqlite3_finalize(*v8);
      *a2 = 0.0;
      return 101;
    }
    else
    {
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v9);
      CPMLLog::log(CPMLLog, CPML_LOG_ERR, "cp_singleQuery_double", "Serializer: Error %d iterating rows: %s\n", v10, __s);
      sqlite3_finalize(*v8);
      return 0xFFFFFFFFLL;
    }
  }
}

void CPNaiveBayesClassifier::CPNaiveBayesClassifier(CPNaiveBayesClassifier *this, CPMLCDB *a2, CPMLSerialization *a3, CPMLTunableData *a4)
{
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, a2, a3, a4);
  *(void *)uint64_t v6 = &unk_26C50FF80;
  *(void *)(v6 + 192) = 0;
  *(void *)(v6 + 20(*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0) = 0;
  *(void *)(v6 + 208) = 0;
  strcpy((char *)(v6 + 8), "1.0.0");
  var0 = a2->var0;
  int v8 = *((_DWORD *)a2->var0 + 33);
  uint64_t v9 = *((int *)a2->var0 + 32);
  *(_DWORD *)(v6 + 96) = *((_DWORD *)a2->var0 + 31);
  *(_DWORD *)(v6 + 10(*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0) = v8;
  uint64_t v10 = *((void *)var0 + 4) - *((void *)var0 + 3);
  unint64_t v11 = *((void *)var0 + 1) - *(void *)var0;
  *(void *)(v6 + 176) = *(void *)var0;
  uint64_t v12 = v10 >> 3;
  *(void *)(v6 + 152) = 0;
  *(void *)(v6 + 16(*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0) = v12;
  unint64_t v13 = v11 >> 2;
  *(_DWORD *)(v6 + 168) = v13;
  if (*(_DWORD *)(*((void *)var0 + 9) + 4 * v9)) {
    *((void *)this + 2(*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0) = v12 - 1;
  }
  else {
    *((_DWORD *)this + 42) = v13 - 1;
  }
  CPMLCDB::getIterator();
}

void sub_2143471BC(_Unwind_Exception *a1)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    v1[25] = v4;
    operator delete(v4);
  }
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

size_t CPNaiveBayesClassifier::initializeNaiveBayesMemory(CPNaiveBayesClassifier *this)
{
  if ((int)CPMLTunableData::getNumberOfItems(*((CPMLTunableData **)this + 9)) < 1) {
    *((void *)this + 17) = 0x4008000000000000;
  }
  else {
    CPMLTunableData::tDataGetDouble(*((CPMLTunableData **)this + 9), "laplaceParameter", (double *)this + 17);
  }
  size_t result = (size_t)malloc_type_calloc(*((unsigned int *)this + 25), 8uLL, 0x100004000313F17uLL);
  *((void *)this + 18) = result;
  if (*((_DWORD *)this + 42))
  {
    size_t result = (size_t)malloc_type_calloc(*((unsigned int *)this + 25), 8uLL, 0x80040B8603338uLL);
    *((void *)this + 23) = result;
    if (*((_DWORD *)this + 25))
    {
      unint64_t v3 = 0;
      size_t result = *((unsigned int *)this + 42);
      do
      {
        *(void *)(*((void *)this + 23) + 8 * v3) = malloc_type_calloc(result, 8uLL, 0x10040436913F5uLL);
        if (*((_DWORD *)this + 42))
        {
          unint64_t v4 = 0;
          do
          {
            *(void *)(*(void *)(*((void *)this + 23) + 8 * v3) + 8 * v4) = malloc_type_calloc(*(int *)(*((void *)this + 22)+ 4 * v4), 8uLL, 0x100004000313F17uLL);
            ++v4;
            size_t result = *((unsigned int *)this + 42);
          }
          while (v4 < result);
        }
        else
        {
          size_t result = 0;
        }
        ++v3;
      }
      while (v3 < *((unsigned int *)this + 25));
    }
  }
  if (*((void *)this + 20))
  {
    unsigned int v5 = *((_DWORD *)this + 25);
    if (!v5)
    {
      *((_DWORD *)this + 25) = 2;
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog((CPMLLog *)result);
      CPMLLog::log(CPMLLog, CPML_LOG_DEBUG, "initializeNaiveBayesMemory", "resultCardinality 0\n");
      unsigned int v5 = *((_DWORD *)this + 25);
    }
    *((void *)this + 15) = malloc_type_calloc(v5, 8uLL, 0x80040B8603338uLL);
    *((void *)this + 16) = malloc_type_calloc(*((unsigned int *)this + 25), 8uLL, 0x80040B8603338uLL);
    *((void *)this + 13) = malloc_type_calloc(*((unsigned int *)this + 25), 8uLL, 0x80040B8603338uLL);
    size_t result = (size_t)malloc_type_calloc(*((unsigned int *)this + 25), 8uLL, 0x80040B8603338uLL);
    *((void *)this + 14) = result;
    if (*((_DWORD *)this + 25))
    {
      unint64_t v7 = 0;
      do
      {
        *(void *)(*((void *)this + 15) + 8 * v7) = malloc_type_calloc(*((unsigned int *)this + 24), 8uLL, 0x100004000313F17uLL);
        *(void *)(*((void *)this + 16) + 8 * v7) = malloc_type_calloc(*((unsigned int *)this + 24), 8uLL, 0x100004000313F17uLL);
        *(void *)(*((void *)this + 13) + 8 * v7) = malloc_type_calloc(*((unsigned int *)this + 24), 8uLL, 0x100004000313F17uLL);
        size_t result = (size_t)malloc_type_calloc(*((unsigned int *)this + 24), 8uLL, 0x100004000313F17uLL);
        *(void *)(*((void *)this + 14) + 8 * v7++) = result;
      }
      while (v7 < *((unsigned int *)this + 25));
    }
  }
  return result;
}

void CPNaiveBayesClassifier::CPNaiveBayesClassifier(CPNaiveBayesClassifier *this, CPMLSerialization *a2, CPMLTunableData *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  CPMLAlgorithm::CPMLAlgorithm((CPMLAlgorithm *)this, 0, a2, a3);
  *unsigned int v5 = &unk_26C50FF80;
  v5[24] = 0;
  v5[25] = 0;
  v5[26] = 0;
  (*((void (**)(CPMLSerialization *, void *, const char *, uint64_t, void))a2->var0 + 13))(a2, v5 + 1, "version", 5, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 152, "totalDataCount", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 9))(a2, (char *)this + 96, "featureVectorSpace", 1, 0);
  uint64_t v6 = (_DWORD *)((char *)this + 100);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 9))(a2, (char *)this + 100, "resultCardinality", 1, 0);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 10))(a2, (char *)this + 160, "continousFeatureCount", 1, 0);
  unint64_t v7 = (_DWORD *)((char *)this + 168);
  (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))a2->var0 + 9))(a2, (char *)this + 168, "discreteFeatureCount", 1, 0);
  size_t v8 = *((unsigned int *)this + 42);
  if (v8)
  {
    *((void *)this + 22) = malloc_type_calloc(v8, 4uLL, 0x100004052888210uLL);
    (*((void (**)(CPMLSerialization *))a2->var0 + 8))(a2);
  }
  CPNaiveBayesClassifier::initializeNaiveBayesMemory(this);
  unint64_t v9 = *v6;
  if (*v7)
  {
    if (!*v6) {
      goto LABEL_15;
    }
    unint64_t v10 = 0;
    LODWORD(v11) = 1;
    do
    {
      if (v11)
      {
        unint64_t v12 = 0;
        do
        {
          sprintf(v15, "discreteFeatureTable_%d_%d", v10, v12);
          (*((void (**)(CPMLSerialization *, void, char *, void, void))a2->var0 + 10))(a2, *(void *)(*(void *)(*((void *)this + 23) + 8 * v10) + 8 * v12), v15, *(int *)(*((void *)this + 22) + 4 * v12), 0);
          ++v12;
          unint64_t v11 = *v7;
        }
        while (v12 < v11);
        unint64_t v9 = *v6;
      }
      ++v10;
    }
    while (v10 < v9);
  }
  if (*((void *)this + 20) && v9)
  {
    for (unint64_t i = 0; i < v9; ++i)
    {
      sprintf(v15, "datasetMean%d", i);
      sprintf(v14, "datasetVariance%d", i);
      (*((void (**)(CPMLSerialization *, void, char *, void, void))a2->var0 + 12))(a2, *(void *)(*((void *)this + 13) + 8 * i), v15, *((unsigned int *)this + 24), 0);
      (*((void (**)(CPMLSerialization *, void, char *, void, void))a2->var0 + 12))(a2, *(void *)(*((void *)this + 14) + 8 * i), v14, *((unsigned int *)this + 24), 0);
      unint64_t v9 = *v6;
    }
  }
LABEL_15:
  (*((void (**)(CPMLSerialization *, void, const char *, unint64_t, void))a2->var0 + 10))(a2, *((void *)this + 18), "dist_datasetOutput", v9, 0);
}

void sub_2143478AC(_Unwind_Exception *a1)
{
  unint64_t v4 = *v2;
  if (*v2)
  {
    v1[25] = v4;
    operator delete(v4);
  }
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPNaiveBayesClassifier::~CPNaiveBayesClassifier(CPNaiveBayesClassifier *this)
{
  *(void *)this = &unk_26C50FF80;
  if (*((_DWORD *)this + 42))
  {
    if (*((_DWORD *)this + 25))
    {
      unint64_t v2 = 0;
      do
      {
        if (*((_DWORD *)this + 42))
        {
          unint64_t v3 = 0;
          do
            free(*(void **)(*(void *)(*((void *)this + 23) + 8 * v2) + 8 * v3++));
          while (v3 < *((unsigned int *)this + 42));
        }
        free(*(void **)(*((void *)this + 23) + 8 * v2++));
      }
      while (v2 < *((unsigned int *)this + 25));
    }
    free(*((void **)this + 23));
  }
  if (*((void *)this + 20))
  {
    if (*((_DWORD *)this + 25))
    {
      unint64_t v4 = 0;
      do
      {
        free(*(void **)(*((void *)this + 15) + 8 * v4));
        free(*(void **)(*((void *)this + 16) + 8 * v4));
        free(*(void **)(*((void *)this + 13) + 8 * v4));
        free(*(void **)(*((void *)this + 14) + 8 * v4++));
      }
      while (v4 < *((unsigned int *)this + 25));
    }
    free(*((void **)this + 15));
    free(*((void **)this + 16));
    free(*((void **)this + 13));
    free(*((void **)this + 14));
  }
  free(*((void **)this + 18));
  unsigned int v5 = (void *)*((void *)this + 24);
  if (v5)
  {
    *((void *)this + 25) = v5;
    operator delete(v5);
  }

  CPModelClose(this);
}

{
  uint64_t vars8;

  CPNaiveBayesClassifier::~CPNaiveBayesClassifier(this);

  JUMPOUT(0x21669DB80);
}

uint64_t CPNaiveBayesClassifier::serialize(CPNaiveBayesClassifier *this)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)this + 11);
  unint64_t v3 = (char *)this + 8;
  size_t v4 = strlen((const char *)this + 8);
  (*(void (**)(uint64_t, char *, const char *, size_t, void))(*(void *)v2 + 56))(v2, v3, "version", v4, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 152, "totalDataCount", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 24))(*((void *)this + 11), (char *)this + 96, "featureVectorSpace", 1, 0);
  unsigned int v5 = (unsigned int *)((char *)this + 100);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 24))(*((void *)this + 11), (char *)this + 100, "resultCardinality", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), (char *)this + 160, "continousFeatureCount", 1, 0);
  (*(void (**)(void, char *, const char *, uint64_t, void))(**((void **)this + 11) + 24))(*((void *)this + 11), (char *)this + 168, "discreteFeatureCount", 1, 0);
  uint64_t v6 = *((unsigned int *)this + 42);
  if (v6)
  {
    (*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 16))(*((void *)this + 11), *((void *)this + 22), "discreteCardinality", v6, 0);
    unint64_t v7 = *((unsigned int *)this + 25);
    if (!v7)
    {
      unint64_t v7 = 0;
      goto LABEL_17;
    }
    unint64_t v8 = 0;
    LODWORD(v9) = *((_DWORD *)this + 42);
    do
    {
      if (v9)
      {
        unint64_t v10 = 0;
        do
        {
          sprintf(v14, "discreteFeatureTable_%d_%d", v8, v10);
          (*(void (**)(void, void, char *, void, void))(**((void **)this + 11) + 32))(*((void *)this + 11), *(void *)(*(void *)(*((void *)this + 23) + 8 * v8) + 8 * v10), v14, *(int *)(*((void *)this + 22) + 4 * v10), 0);
          ++v10;
          unint64_t v9 = *((unsigned int *)this + 42);
        }
        while (v10 < v9);
        unint64_t v7 = *v5;
      }
      ++v8;
    }
    while (v8 < v7);
  }
  else
  {
    unint64_t v7 = *v5;
  }
  if (*((void *)this + 20) && v7)
  {
    for (unint64_t i = 0; i < v7; ++i)
    {
      sprintf(v14, "datasetMean%d", i);
      sprintf(v13, "datasetVariance%d", i);
      (*(void (**)(void, void, char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *(void *)(*((void *)this + 13) + 8 * i), v14, *((unsigned int *)this + 24), 0);
      (*(void (**)(void, void, char *, void, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *(void *)(*((void *)this + 14) + 8 * i), v13, *((unsigned int *)this + 24), 0);
      unint64_t v7 = *((unsigned int *)this + 25);
    }
  }
LABEL_17:
  (*(void (**)(void, void, const char *, unint64_t, void))(**((void **)this + 11) + 32))(*((void *)this + 11), *((void *)this + 18), "dist_datasetOutput", v7, 0);
  return 0;
}

uint64_t CPNaiveBayesClassifier::train(CPNaiveBayesClassifier *this)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
  if (v2)
  {
    unint64_t v3 = (CPMLFeatureVector *)v2;
    do
    {
      uint64_t YHat = (int)CPMLFeatureVector::getYHat(v3);
      ++*(void *)(*((void *)this + 18) + 8 * YHat);
      ++*((void *)this + 19);
      uint64_t IntVector = CPMLFeatureVector::getIntVector(v3);
      uint64_t v6 = *(int **)IntVector;
      uint64_t v7 = *(void *)(IntVector + 8) - *(void *)IntVector;
      if (v7)
      {
        unint64_t v8 = v7 >> 2;
        unint64_t v9 = *(uint64_t **)(*((void *)this + 23) + 8 * YHat);
        if (v8 <= 1) {
          unint64_t v8 = 1;
        }
        do
        {
          uint64_t v11 = *v6++;
          uint64_t v10 = v11;
          uint64_t v12 = *v9++;
          ++*(void *)(v12 + 8 * v10);
          --v8;
        }
        while (v8);
      }
      uint64_t RealVector = CPMLFeatureVector::getRealVector(v3);
      float v14 = *(double **)RealVector;
      uint64_t v15 = *(void *)(RealVector + 8) - *(void *)RealVector;
      if (v15)
      {
        unint64_t v16 = v15 >> 3;
        uint64_t v17 = *(double **)(*((void *)this + 15) + 8 * YHat);
        if (v16 <= 1) {
          unint64_t v16 = 1;
        }
        do
        {
          double v18 = *v14++;
          *uint64_t v17 = v18 + *v17;
          ++v17;
          --v16;
        }
        while (v16);
      }
      unint64_t v3 = (CPMLFeatureVector *)(*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
    }
    while (v3);
  }
  CPNaiveBayesClassifier::updateMean((uint64_t)this);
  (*(void (**)(void))(**((void **)this + 10) + 40))(*((void *)this + 10));
  uint64_t v19 = (*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
  if (v19)
  {
    double v20 = (CPMLFeatureVector *)v19;
    do
    {
      double v21 = CPMLFeatureVector::getYHat(v20);
      uint64_t v22 = CPMLFeatureVector::getRealVector(v20);
      uint64_t v23 = *(double **)v22;
      uint64_t v24 = *(void *)(v22 + 8);
      uint64_t v25 = v24 - *(void *)v22;
      if (v24 != *(void *)v22)
      {
        double v26 = *(double **)(*((void *)this + 13) + 8 * (int)v21);
        unint64_t v27 = v25 >> 3;
        double v28 = *(double **)(*((void *)this + 16) + 8 * (int)v21);
        if (v27 <= 1) {
          uint64_t v29 = 1;
        }
        else {
          uint64_t v29 = v27;
        }
        do
        {
          double v30 = *v26++;
          double v31 = v30;
          double v32 = *v23++;
          double *v28 = *v28 + (v32 - v31) * (v32 - v31);
          ++v28;
          --v29;
        }
        while (v29);
      }
      double v20 = (CPMLFeatureVector *)(*(uint64_t (**)(void))(**((void **)this + 10) + 32))(*((void *)this + 10));
    }
    while (v20);
  }
  CPNaiveBayesClassifier::updateVariance((uint64_t)this);
  return 0;
}

uint64_t CPNaiveBayesClassifier::updateMean(uint64_t this)
{
  uint64_t v1 = *(unsigned int *)(this + 100);
  if (v1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = *(void *)(this + 160);
    do
    {
      if (v3)
      {
        size_t v4 = *(double **)(*(void *)(this + 120) + 8 * v2);
        double v5 = (double)*(unint64_t *)(*(void *)(this + 144) + 8 * v2);
        uint64_t v6 = *(double **)(*(void *)(this + 104) + 8 * v2);
        uint64_t v7 = v3;
        do
        {
          double v8 = *v4++;
          *v6++ = v8 / v5;
          --v7;
        }
        while (v7);
      }
      ++v2;
    }
    while (v2 != v1);
  }
  return this;
}

uint64_t CPNaiveBayesClassifier::updateVariance(uint64_t this)
{
  uint64_t v1 = *(unsigned int *)(this + 100);
  if (v1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = *(void *)(this + 160);
    do
    {
      if (v3)
      {
        size_t v4 = *(double **)(*(void *)(this + 128) + 8 * v2);
        double v5 = (double)(unint64_t)(*(void *)(*(void *)(this + 144) + 8 * v2) - 1);
        uint64_t v6 = *(double **)(*(void *)(this + 112) + 8 * v2);
        uint64_t v7 = v3;
        do
        {
          double v8 = *v4++;
          *v6++ = v8 / v5;
          --v7;
        }
        while (v7);
      }
      ++v2;
    }
    while (v2 != v1);
  }
  return this;
}

uint64_t CPNaiveBayesClassifier::eval(uint64_t a1, CPMLFeatureVector *this)
{
  uint64_t IntVector = (uint64_t *)CPMLFeatureVector::getIntVector(this);
  uint64_t v61 = this;
  uint64_t RealVector = (void *)CPMLFeatureVector::getRealVector(this);
  uint64_t v6 = (double *)malloc_type_calloc(*(unsigned int *)(a1 + 100), 8uLL, 0x100004000313F17uLL);
  uint64_t v7 = v6;
  size_t v8 = *(unsigned int *)(a1 + 100);
  if (v8)
  {
    unint64_t v9 = *(unint64_t **)(a1 + 144);
    double v10 = (double)*(unint64_t *)(a1 + 152);
    uint64_t v11 = *(unsigned int *)(a1 + 100);
    uint64_t v12 = v6;
    do
    {
      unint64_t v13 = *v9++;
      *v12++ = log((double)v13 / v10);
      --v11;
    }
    while (v11);
    uint64_t v14 = *(void *)(a1 + 160);
    uint64_t v15 = *(unsigned int *)(a1 + 168);
    do
    {
      if (v14)
      {
        uint64_t v16 = 0;
        uint64_t v17 = *(void *)(*(void *)(a1 + 112) + 8 * v11);
        double v18 = v7[v11];
        do
        {
          double v19 = *(double *)(v17 + 8 * v16);
          long double v20 = 1.0;
          if (v19 != 0.0)
          {
            double v21 = *(double *)(*RealVector + 8 * v16)
                - *(double *)(*(void *)(*(void *)(a1 + 104) + 8 * v11) + 8 * v16);
            long double v20 = exp(-(v21 * v21) / (v19 + v19)) / sqrt(v19 * 6.28318531);
          }
          double v18 = v18 + log(v20);
          v7[v11] = v18;
          ++v16;
        }
        while (v14 != v16);
      }
      if (v15)
      {
        uint64_t v22 = 0;
        uint64_t v23 = *IntVector;
        do
        {
          uint64_t v24 = *(unsigned int *)(v23 + 4 * v22);
          if ((v24 & 0x80000000) != 0) {
            double v25 = 0.0;
          }
          else {
            double v25 = log((*(double *)(a1 + 136)+ (double)*(unint64_t *)(*(void *)(*(void *)(*(void *)(a1 + 184) + 8 * v11) + 8 * v22)+ 8 * v24))/ ((double)*(unint64_t *)(*(void *)(a1 + 144) + 8 * v11)+ *(double *)(a1 + 136) * (double)(unint64_t)*(int *)(*(void *)(a1 + 176) + 4 * v22)));
          }
          v7[v11] = v7[v11] + v25;
          ++v22;
        }
        while (v15 != v22);
      }
      ++v11;
    }
    while (v11 != v8);
  }
  else
  {
    size_t v8 = 0;
  }
  double v26 = (double *)malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
  uint64_t v27 = *(unsigned int *)(a1 + 100);
  if (v27)
  {
    for (uint64_t i = 0; i != v27; ++i)
    {
      double v29 = v7[i];
      double v30 = 0.0;
      uint64_t v31 = v27;
      double v32 = v7;
      do
      {
        double v33 = *v32++;
        double v30 = v30 + exp(v33 - v29);
        --v31;
      }
      while (v31);
      double v34 = 1.0 / v30;
      if (v30 <= 0.0) {
        double v34 = 1.0;
      }
      v26[i] = v34;
    }
    unint64_t v35 = v26;
    uint64_t v36 = v7;
    do
    {
      uint64_t v37 = *(void *)v35++;
      *(void *)v36++ = v37;
      --v27;
    }
    while (v27);
  }
  free(v26);
  if (*(_DWORD *)(a1 + 100))
  {
    unint64_t v38 = 0;
    int v39 = 0;
    double v40 = (void *)(a1 + 192);
    uint64_t v41 = (void *)(a1 + 208);
    uint64_t v42 = *(char **)(a1 + 200);
    double v43 = 0.0;
    do
    {
      double v44 = v7[v38];
      if (v44 > v43)
      {
        double v43 = v7[v38];
        int v39 = v38;
      }
      if ((unint64_t)v42 >= *v41)
      {
        uint64_t v45 = (uint64_t)&v42[-*v40] >> 4;
        if ((unint64_t)(v45 + 1) >> 60) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v46 = *v41 - *v40;
        uint64_t v47 = v46 >> 3;
        if (v46 >> 3 <= (unint64_t)(v45 + 1)) {
          uint64_t v47 = v45 + 1;
        }
        if ((unint64_t)v46 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v48 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v48 = v47;
        }
        if (v48) {
          uint64_t v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::valarray<char>>>(a1 + 208, v48);
        }
        else {
          uint64_t v49 = 0;
        }
        uint64_t v50 = &v49[16 * v45];
        *(double *)uint64_t v50 = v44;
        *((_DWORD *)v50 + 2) = v38;
        *((_DWORD *)v50 + 3) = 0;
        unint64_t v52 = *(char **)(a1 + 192);
        double v51 = *(char **)(a1 + 200);
        double v53 = v50;
        if (v51 != v52)
        {
          do
          {
            *((_OWORD *)v53 - 1) = *((_OWORD *)v51 - 1);
            v53 -= 16;
            v51 -= 16;
          }
          while (v51 != v52);
          double v51 = (char *)*v40;
        }
        uint64_t v42 = v50 + 16;
        *(void *)(a1 + 192) = v53;
        *(void *)(a1 + 20(*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0) = v50 + 16;
        *(void *)(a1 + 208) = &v49[16 * v48];
        if (v51) {
          operator delete(v51);
        }
      }
      else
      {
        *(double *)uint64_t v42 = v44;
        *((_DWORD *)v42 + 2) = v38;
        *((_DWORD *)v42 + 3) = 0;
        v42 += 16;
      }
      *(void *)(a1 + 20(*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0) = v42;
      ++v38;
    }
    while (v38 < *(unsigned int *)(a1 + 100));
    double v54 = (double)v39;
  }
  else
  {
    double v54 = 0.0;
  }
  free(v7);
  double v55 = *(char **)(a1 + 192);
  double v56 = *(char **)(a1 + 200);
  uint64_t v57 = (void *)(a1 + 192);
  unint64_t v58 = 126 - 2 * __clz((v56 - v55) >> 4);
  double v62 = sortProbIndexClassic;
  if (v56 == v55) {
    uint64_t v59 = 0;
  }
  else {
    uint64_t v59 = v58;
  }
  std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(ProbIndex,ProbIndex),ProbIndex*,false>(v55, v56, (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))&v62, v59, 1);
  CPMLFeatureVector::setYHat((uint64_t)v61, v54);
  CPMLFeatureVector::setYHatProbList((uint64_t)v61, (uint64_t)v57);
  v57[1] = *v57;
  return 0;
}

BOOL sortProbIndexClassic(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(double *)&a1 > *(double *)&a3;
}

uint64_t CPNaiveBayesClassifier::errorString(CPNaiveBayesClassifier *this)
{
  return 0;
}

void CPMLMemoryIterator::CPMLMemoryIterator(CPMLMemoryIterator *this, int a2, int a3, double **a4, CPMLTunableData *a5)
{
  CPMLIterator::CPMLIterator((CPMLIterator *)this);
  *(void *)uint64_t v5 = &unk_26C50FD00;
  *(_DWORD *)(v5 + 88) = 0;
  operator new();
}

void sub_2143485E8(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v2, 0x1020C4087C48359);
  CPMLIterator::~CPMLIterator(v1);
  _Unwind_Resume(a1);
}

void CPMLMemoryIterator::~CPMLMemoryIterator(CPMLIterator *this)
{
  *(void *)this = &unk_26C50FD00;
  uint64_t v2 = (CPMLFeatureVector *)*((void *)this + 13);
  if (v2)
  {
    CPMLFeatureVector::~CPMLFeatureVector(v2);
    MEMORY[0x21669DB80]();
  }
  *((void *)this + 13) = 0;

  CPMLIterator::~CPMLIterator(this);
}

{
  uint64_t vars8;

  CPMLMemoryIterator::~CPMLMemoryIterator(this);

  JUMPOUT(0x21669DB80);
}

uint64_t CPMLMemoryIterator::iterateAll(CPMLMemoryIterator *this)
{
  return 0;
}

uint64_t CPMLMemoryIterator::iterateFirst(CPMLMemoryIterator *this)
{
  if (!*((void *)this + 12) || *((_DWORD *)this + 22) == *((_DWORD *)this + 21)) {
    return 0;
  }
  CPMLFeatureVector::resetAll(*((CPMLFeatureVector **)this + 13));
  LODWORD(v3) = *((_DWORD *)this + 20);
  if ((int)v3 >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = (CPMLFeatureVector *)*((void *)this + 13);
      double v6 = *(double *)(*(void *)(*((void *)this + 12) + 8 * v4++) + 8 * *((int *)this + 22));
      if (v4 >= (int)v3) {
        CPMLFeatureVector::setYHat((uint64_t)v5, v6);
      }
      else {
        CPMLFeatureVector::insertRealVClass(v5, v6);
      }
      uint64_t v3 = *((int *)this + 20);
    }
    while (v4 < v3);
  }
  ++*((_DWORD *)this + 22);
  return *((void *)this + 13);
}

uint64_t CPMLMemoryIterator::iterateNext(CPMLMemoryIterator *this)
{
  return (*(uint64_t (**)(void))(*(void *)this + 24))();
}

uint64_t CPMLMemoryIterator::iterateReset(uint64_t this)
{
  *(_DWORD *)(this + 88) = 0;
  return this;
}

void CPMLNaiveBayesSuggestionsAdaptor::CPMLNaiveBayesSuggestionsAdaptor(CPMLNaiveBayesSuggestionsAdaptor *this, CPMLSerialization *a2)
{
  CPMLNaiveBayesAdaptor::CPMLNaiveBayesAdaptor(this, a2);
  *uint64_t v2 = &unk_26C5104F8;
}

double CPMLNaiveBayesSuggestionsAdaptor::get_cx_given_y(CPMLNaiveBayesSuggestionsAdaptor *this, int a2, unsigned int a3, int a4, double *a5)
{
  unint64_t v9 = (char *)this + 112;
  unint64_t v10 = a4;
  uint64_t v16 = (unint64_t *)a4;
  if (std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::find<unsigned long long>((void *)this + 14, (unint64_t *)&v16))
  {
    unint64_t v15 = v10;
    uint64_t v16 = &v15;
    uint64_t v11 = std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)v9, &v15, (uint64_t)&std::piecewise_construct, &v16)[3];
  }
  else
  {
    uint64_t v11 = 0;
  }
  *(void *)a5 = v11;
  unint64_t v15 = v10 | ((unint64_t)a3 << 32);
  uint64_t v12 = (void *)((char *)this + 72);
  unint64_t v13 = std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::find<unsigned long long>(v12, &v15);
  if (a3 == -1 || a4 == -1)
  {
    *a5 = 0.0;
  }
  else
  {
    if (v13)
    {
      uint64_t v16 = &v15;
      return *((double *)std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)v12, &v15, (uint64_t)&std::piecewise_construct, &v16)+ 3);
    }
    uint64_t v16 = &v15;
    std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)v12, &v15, (uint64_t)&std::piecewise_construct, &v16)[3] = 0;
  }
  return 0.0;
}

void CPMLNaiveBayesSuggestionsAdaptor::set_cx_given_y(CPMLNaiveBayesSuggestionsAdaptor *this, int a2, uint64_t a3, unsigned int a4, double a5)
{
}

void CPMLNaiveBayesSuggestionsAdaptor::set_cardinalityx_given_y(CPMLNaiveBayesSuggestionsAdaptor *this, int a2, int a3, double a4)
{
}

void CPMLNaiveBayesSuggestionsAdaptor::setCacheSize(CPMLNaiveBayesSuggestionsAdaptor *this, int a2, int a3)
{
  v41[1] = *(void **)MEMORY[0x263EF8340];
  CPMLNaiveBayesAdaptor::setCacheSize(this, a2, a3);
  double v40 = 0.0;
  double v6 = sqlite3_mprintf("select count(*) from xcol0;");
  (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v40, v6);
  sqlite3_free(v6);
  if (v40 > (double)(a3 * a2)) {
    double v40 = (double)(a3 * a2);
  }
  uint64_t v9 = MEMORY[0x270FA5388](v7, v8);
  uint64_t v11 = (char *)&v38 - v10;
  uint64_t v13 = MEMORY[0x270FA5388](v9, v12);
  unint64_t v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFF0);
  MEMORY[0x270FA5388](v13, v16);
  double v18 = (char *)&v38 - v17;
  double v19 = sqlite3_mprintf("select xMap from xcol0;");
  (*(void (**)(void, char *, void, char *))(**((void **)this + 1) + 208))(*((void *)this + 1), v11, (int)v40, v19);
  sqlite3_free(v19);
  long double v20 = sqlite3_mprintf("select yMap from xcol0;");
  (*(void (**)(void, char *, void, char *))(**((void **)this + 1) + 208))(*((void *)this + 1), v15, (int)v40, v20);
  sqlite3_free(v20);
  double v21 = sqlite3_mprintf("select xyCount from xcol0;");
  (*(void (**)(void, char *, void, char *))(**((void **)this + 1) + 216))(*((void *)this + 1), v18, (int)v40, v21);
  sqlite3_free(v21);
  if ((unint64_t)v40)
  {
    unint64_t v22 = 0;
    do
    {
      unint64_t v39 = *(unsigned int *)&v15[8 * v22] | (*(void *)&v11[8 * v22] << 32);
      uint64_t v23 = *(void *)&v18[8 * v22];
      v41[0] = &v39;
      std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)this + 72, &v39, (uint64_t)&std::piecewise_construct, v41)[3] = v23;
      ++v22;
    }
    while (v22 < (unint64_t)v40);
  }
  uint64_t v24 = sqlite3_mprintf("select count(*) from xCardinality0;");
  (*(void (**)(void, double *, char *))(**((void **)this + 1) + 224))(*((void *)this + 1), &v40, v24);
  sqlite3_free(v24);
  uint64_t v27 = MEMORY[0x270FA5388](v25, v26);
  double v29 = (uint64_t *)((char *)&v38 - ((v28 + 15) & 0xFFFFFFFF0));
  MEMORY[0x270FA5388](v27, v30);
  double v32 = (char *)&v38 - v31;
  double v33 = sqlite3_mprintf("select yMap from xCardinality0;");
  (*(void (**)(void, void *, void, char *))(**((void **)this + 1) + 208))(*((void *)this + 1), v29, (int)v40, v33);
  sqlite3_free(v33);
  double v34 = sqlite3_mprintf("select xCardinality from xCardinality0;");
  (*(void (**)(void, char *, void, char *))(**((void **)this + 1) + 216))(*((void *)this + 1), v32, (int)v40, v34);
  sqlite3_free(v34);
  if ((unint64_t)v40)
  {
    unint64_t v35 = 0;
    uint64_t v36 = (char *)this + 112;
    do
    {
      uint64_t v37 = *(void *)&v32[8 * v35];
      v41[0] = v29;
      std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)v36, v29, (uint64_t)&std::piecewise_construct, v41)[3] = v37;
      ++v35;
      ++v29;
    }
    while (v35 < (unint64_t)v40);
  }
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,double>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,double>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,double>>>::find<unsigned long long>(void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  double v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  size_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      size_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

uint64_t CPMLlinearSVM::TRON::info(uint64_t (**this)(char *), const char *a2, ...)
{
  va_start(va, a2);
  uint64_t v5 = *MEMORY[0x263EF8340];
  vsprintf(v4, a2, va);
  return this[3](v4);
}

uint64_t CPMLlinearSVM::TRON::TRON(uint64_t result, uint64_t a2, int a3, double a4)
{
  *(double *)size_t result = a4;
  *(_DWORD *)(result + 8) = a3;
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = default_print;
  return result;
}

uint64_t default_print(const char *a1)
{
  uint64_t v1 = (FILE **)MEMORY[0x263EF8358];
  fputs(a1, (FILE *)*MEMORY[0x263EF8358]);
  int8x8_t v2 = *v1;

  return fflush(v2);
}

void CPMLlinearSVM::TRON::tron(CPMLlinearSVM::TRON *this, double *a2)
{
  int n = (*(uint64_t (**)(void))(**((void **)this + 2) + 24))(*((void *)this + 2));
  double da = 1.0;
  int incx = 1;
  operator new[]();
}

void CPMLlinearSVM::TRON::trcg(CPMLlinearSVM::TRON *this, double a2, double *a3, double *a4, double *a5)
{
  int incx = 1;
  int n = (*(uint64_t (**)(void))(**((void **)this + 2) + 24))(*((void *)this + 2));
  double v5 = 1.0;
  operator new[]();
}

void CPMLlinearSVM::TRON::norm_inf(CPMLlinearSVM::TRON *this, int a2, double *a3)
{
  double v3 = fabs(*a3);
  if (a2 >= 2)
  {
    uint8x8_t v4 = a3 + 1;
    uint64_t v5 = a2 - 1;
    do
    {
      double v6 = *v4++;
      double v7 = fabs(v6);
      if (v7 >= v3) {
        double v3 = v7;
      }
      --v5;
    }
    while (v5);
  }
}

uint64_t CPMLlinearSVM::TRON::set_print_string(uint64_t this, void (*a2)(const char *))
{
  *(void *)(this + 24) = a2;
  return this;
}

void CPMLCreateKMEANSAnalysis()
{
}

void sub_214349D54(_Unwind_Exception *a1)
{
  uint64_t v2 = v1;
  MEMORY[0x21669DB80](v2, 0xB1C40B9B0C43ELL);
  _Unwind_Resume(a1);
}

CPMLKMeansAnalysisHandler *CPMLDestroyKMEANSAnalysis(CPMLKMeansAnalysisHandler *result)
{
  if (result)
  {
    CPMLKMeansAnalysisHandler::~CPMLKMeansAnalysisHandler(result);
    JUMPOUT(0x21669DB80);
  }
  return result;
}

uint64_t CPMLKMeansAnalysisHandler::cluster(CPMLKMeansAnalysisHandler *this, int **a2)
{
  uint64_t v3 = *((void *)this + 2);
  uint64_t v2 = (int *)*((void *)this + 3);
  uint64_t v4 = *(void *)(v3 + 32);
  if (!v2) {
    operator new[]();
  }
  *a2 = v2;
  return v4;
}

uint64_t CPMLKMeansAnalysisHandler::centers(CPMLKMeansAnalysisHandler *this, double **a2)
{
  uint64_t v2 = *((void *)this + 2);
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t v5 = (double *)*((void *)this + 4);
  if (!v5) {
    operator new[]();
  }
  *a2 = v5;
  return (v4 * v3);
}

double CPMLTotssKMeansAnalysis(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 16) + 8 * **(void **)(a1 + 16) + 16);
}

double CPMLKMeansAnalysisHandler::totss(CPMLKMeansAnalysisHandler *this)
{
  return *(double *)(*((void *)this + 2) + 8 * **((void **)this + 2) + 16);
}

uint64_t CPMLKMeansAnalysisHandler::withinss(CPMLKMeansAnalysisHandler *this, double **a2)
{
  uint64_t v2 = *(void *)(*((void *)this + 2) + 16);
  uint64_t v3 = (double *)*((void *)this + 5);
  if (!v3) {
    operator new[]();
  }
  *a2 = v3;
  return v2;
}

double CPMLKMeansAnalysisHandler::totalWithinss(CPMLKMeansAnalysisHandler *this)
{
  double v6 = 0;
  int v1 = CPMLKMeansAnalysisHandler::withinss(this, &v6);
  if (v1 < 1) {
    return 0.0;
  }
  uint64_t v2 = v6;
  uint64_t v3 = v1;
  double result = 0.0;
  do
  {
    double v5 = *v2++;
    double result = result + v5;
    --v3;
  }
  while (v3);
  return result;
}

double CPMLBetweenssKMeansAnalysis(CPMLKMeansAnalysisHandler *a1)
{
  double v1 = *(double *)(*((void *)a1 + 2) + 8 * **((void **)a1 + 2) + 16);
  return v1 - CPMLKMeansAnalysisHandler::totalWithinss(a1);
}

double CPMLKMeansAnalysisHandler::betweenss(CPMLKMeansAnalysisHandler *this)
{
  double v1 = *(double *)(*((void *)this + 2) + 8 * **((void **)this + 2) + 16);
  return v1 - CPMLKMeansAnalysisHandler::totalWithinss(this);
}

uint64_t CPMLKMeansAnalysisHandler::size(CPMLKMeansAnalysisHandler *this, int **a2)
{
  uint64_t v2 = *(void *)(*((void *)this + 2) + 16);
  uint64_t v3 = (int *)*((void *)this + 6);
  if (!v3) {
    operator new[]();
  }
  *a2 = v3;
  return v2;
}

double CPMLIterKMeansAnalysis(uint64_t a1)
{
  return (double)*(unint64_t *)(*(void *)(a1 + 16) + 8);
}

double CPMLKMeansAnalysisHandler::iter(CPMLKMeansAnalysisHandler *this)
{
  return (double)*(unint64_t *)(*((void *)this + 2) + 8);
}

void CPMLKMeansAnalysisHandler::CPMLKMeansAnalysisHandler(CPMLKMeansAnalysisHandler *this, CPMLAlgorithm *a2)
{
  CPMLAnalysisHandler::CPMLAnalysisHandler(this);
  *(_OWORD *)(v4 + 24) = 0u;
  *(_OWORD *)(v4 + 4(*(void (**)(void, void, const char *, uint64_t, void))(**((void **)this + 11) + 48))(*((void *)this + 11), *((void *)this + 19), "weights", *((int *)this + 26) * (uint64_t)*((int *)this + 25), 0) = 0u;
  *(void *)uint64_t v4 = &unk_26C510238;
  *(void *)(v4 + 8) = a2;
  *((void *)this + 2) = (*((uint64_t (**)(CPMLAlgorithm *))a2->var0 + 11))(a2);
}

void sub_21434A254(_Unwind_Exception *a1)
{
  CPModelClose(v1);
  _Unwind_Resume(a1);
}

void CPMLKMeansAnalysisHandler::~CPMLKMeansAnalysisHandler(CPMLKMeansAnalysisHandler *this)
{
  *(void *)this = &unk_26C510238;
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    MEMORY[0x21669DB80](v2, 0x1000C4052888210);
  }
  uint64_t v3 = *((void *)this + 4);
  if (v3) {
    MEMORY[0x21669DB80](v3, 0x1000C4000313F17);
  }
  uint64_t v4 = *((void *)this + 5);
  if (v4) {
    MEMORY[0x21669DB80](v4, 0x1000C4000313F17);
  }
  uint64_t v5 = *((void *)this + 6);
  if (v5) {
    MEMORY[0x21669DB80](v5, 0x1000C4052888210);
  }
  uint64_t v6 = *((void *)this + 1);
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }

  CPModelClose(this);
}

void CPMLKMeansAnalysisHandler::classify(CPMLKMeansAnalysisHandler *this, int a2, double *a3)
{
}

void sub_21434A42C(_Unwind_Exception *a1)
{
  MEMORY[0x21669DB80](v1, 0x1020C4087C48359);
  _Unwind_Resume(a1);
}

double CPMLKMeansAnalysisHandler::regression(CPMLKMeansAnalysisHandler *this, int a2, double *a3)
{
  return nan("");
}

void CPMLOnlineSvm::Update()
{
}

{
  __assert_rtn("operator()", "matrix-base-impl.h", 89, "col < this->_cols && \"col index exceeds matrix dimension\"");
}

void CPMLOnlineSvm::ChooseArgmaxI()
{
  __assert_rtn("ChooseArgmaxI", "online-svm.cpp", 98, "current_argmax != -1");
}

void CPLogisticRegressionClassfier::ComputeSingleGradient()
{
  __assert_rtn("ComputeSingleGradient", "CPLogisticRegression.c", 289, "responseLevel >= 0 && responseLevel <= numResponse-1");
}

{
  __assert_rtn("ComputeSingleGradient", "CPLogisticRegression.c", 290, "allBeta.size() == gradient.size()");
}

void CPLogisticRegressionClassfier::ObjectiveFunctionGradient()
{
  __assert_rtn("ObjectiveFunctionGradient", "CPLogisticRegression.c", 347, "g.v.size() == b.size()");
}

void CPLogisticRegressionClassfier::ComputeSingleHessian()
{
  __assert_rtn("ComputeSingleHessian", "CPLogisticRegression.c", 411, "allBeta.size()*allBeta.size() == hessian.size()");
}

void CPLogisticRegressionClassfier::Evaluate()
{
  __assert_rtn("Evaluate", "CPLogisticRegression.c", 577, "max_r != -1");
}

void CPMLNaiveBayes::set_decay_rate()
{
}

{
  __assert_rtn("set_decay_rate", "CPMLNaiveBayes.cpp", 79, "rate <= 1");
}

void CPMLNaiveBayes::set_epsilon_rate()
{
  __assert_rtn("set_epsilon_rate", "CPMLNaiveBayes.cpp", 94, "rate >= 0");
}

void CPMLNaiveBayes::set_smooth_rate()
{
  __assert_rtn("set_smooth_rate", "CPMLNaiveBayes.cpp", 87, "rate >= 0");
}

void CPMLNaiveBayes::CPMLNaiveBayes()
{
  __assert_rtn("CPMLNaiveBayes", "CPMLNaiveBayes.cpp", 61, "nullptr != idb");
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t CoreOptimization::BFGS::GetSolution(CoreOptimization::BFGS *this)
{
  return MEMORY[0x270F1B4F8](this);
}

uint64_t CoreOptimization::BFGS::Optimize(CoreOptimization::BFGS *this)
{
  return MEMORY[0x270F1B500](this);
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

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x270F98640]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x270F986E0]();
}

{
  return MEMORY[0x270F986F0]();
}

{
  return MEMORY[0x270F98708]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x270F98750]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B8]();
}

{
  return MEMORY[0x270F987C0]();
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x270F98878]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
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

uint64_t operator<<()
{
  return MEMORY[0x270F1B508]();
}

{
  return MEMORY[0x270F1B510]();
}

{
  return MEMORY[0x270F1B518]();
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int daxpy_(int *n, double *da, double *dx, int *incx, double *dy, int *incy)
{
  return MEMORY[0x270EDE4D0](n, da, dx, incx, dy, incy);
}

double ddot_(int *n, double *dx, int *incx, double *dy, int *incy)
{
  MEMORY[0x270EDE4E0](n, dx, incx, dy, incy);
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

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

double dnrm2_(int *n, double *x, int *incx)
{
  MEMORY[0x270EDE608](n, x, incx);
  return result;
}

int dppsv_(char *__uplo, __CLPK_integer *__n, __CLPK_integer *__nrhs, __CLPK_doublereal *__ap, __CLPK_doublereal *__b, __CLPK_integer *__ldb, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE660](__uplo, __n, __nrhs, __ap, __b, __ldb, __info);
}

int dscal_(int *n, double *da, double *dx, int *incx)
{
  return MEMORY[0x270EDE670](n, da, dx, incx);
}

int dsyev_(char *__jobz, char *__uplo, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__w, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE690](__jobz, __uplo, __n, __a, __lda, __w, __work, __lwork);
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x270ED9918](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x270ED9968](a1, *(void *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x270ED9A18](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

void free(void *a1)
{
}

int fscanf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9AB0](a1, a2);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int getc(FILE *a1)
{
  return MEMORY[0x270ED9BC0](a1);
}

long double lgamma(long double __x)
{
  MEMORY[0x270EDA048](__x);
  return result;
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

double nan(const char *a1)
{
  MEMORY[0x270EDA600](a1);
  return result;
}

float nanf(const char *a1)
{
  MEMORY[0x270EDA608](a1);
  return result;
}

long double nanl(const char *a1)
{
  MEMORY[0x270EDA610](a1);
  return result;
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF78](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF98](a1, *(void *)&a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

char *__cdecl setlocale(int a1, const char *a2)
{
  return (char *)MEMORY[0x270EDB408](*(void *)&a1, a2);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB530](a1, a2);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B490](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x270F9B4A0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x270F9B4A8](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x270F9B558](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x270F9B590](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B598](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5A0](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5D0](a1, *(void *)&iCol);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x270F9B668](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

void sqlite3_free(void *a1)
{
}

char *sqlite3_mprintf(const char *a1, ...)
{
  return (char *)MEMORY[0x270F9B6F8](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x270F9B708](filename, ppDb);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B730](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

void srand(unsigned int a1)
{
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB5A0](__s1, __s2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x270EDB6A8](a1, a2);
  return result;
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return (char *)MEMORY[0x270EDB6C8](__str, __sep);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

long double tanh(long double __x)
{
  MEMORY[0x270EDB820](__x);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

void vDSP_dotprD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Length __N)
{
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}

int vsprintf(char *a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBB28](a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}