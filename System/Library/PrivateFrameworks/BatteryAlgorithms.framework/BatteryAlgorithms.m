void *ACAMAgingUpdator::ACAMAgingUpdator(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *result = a2;
  result[1] = a3;
  result[2] = a4;
  result[3] = a5;
  return result;
}

{
  *result = a2;
  result[1] = a3;
  result[2] = a4;
  result[3] = a5;
  return result;
}

void ACAMAgingUpdator::runOneStep(double **a1, double *a2, double *a3)
{
  v3 = *a1;
  double v4 = **a1;
  double v5 = (*a1)[1];
  double v7 = a2[5];
  double v6 = a2[6];
  a3[5] = (1.0 - v4) * v6;
  a3[6] = v4 * v6;
  a3[7] = (1.0 - v4) * v7;
  a3[8] = v4 * v7;
  ACAMAgingUpdator::updateStoichiometryLimits((ACAMAgingUpdator *)a1, a2[12] * a1[2][1], a2[7] * a1[2][2], a2[13] * a1[2][3], v5, v3[2], 0, a3, a3 + 1, a3 + 2, a3 + 3);
}

void ACAMAgingUpdator::updateStoichiometryLimits(ACAMAgingUpdator *this, double a2, double a3, double a4, double *a5, double *a6, double *a7, double *a8)
{
}

double ACAMAgingUpdator::updateQmax(ACAMAgingUpdator *this, double a2, double a3, double a4, double *a5)
{
  double result = vabdd_f64(a3, a2) * a4;
  *a5 = result;
  return result;
}

void ACAMAgingUpdator::updateStoichiometryLimits(ACAMAgingUpdator *this, double a2, double a3, double a4, double a5, double a6, BOOL a7, double *a8, double *a9, double *a10, double *a11)
{
}

uint64_t ACAMAgingUpdator::expandOCP(ACAMAgingUpdator *this, double a2, double a3, double a4, double *a5, double *a6, double *a7)
{
  uint64_t v13 = *((void *)this + 1);
  long long v14 = *(_OWORD *)(v13 + 120);
  v32[0] = *(_OWORD *)(v13 + 104);
  v32[1] = v14;
  long long v15 = *(_OWORD *)(v13 + 152);
  v31[0] = *(_OWORD *)(v13 + 136);
  v31[1] = v15;
  uint64_t v17 = *((void *)&v32[0] + 1);
  v16 = *(double **)&v32[0];
  v18 = (const void *)*((void *)&v14 + 1);
  uint64_t v19 = *((void *)&v31[0] + 1);
  v20 = *(double **)&v31[0];
  v21 = (const void *)*((void *)&v15 + 1);
  memcpy(a5, *(const void **)&v32[0], 8 * *((void *)&v32[0] + 1));
  memcpy(a6, v18, 8 * *((void *)&v32[0] + 1));
  uint64_t result = (uint64_t)memcpy(&a7[*((void *)&v32[0] + 1)], v21, 8 * *((void *)&v31[0] + 1));
  if (*((void *)&v31[0] + 1))
  {
    double v23 = -a3;
    v24 = &a6[*((void *)&v32[0] + 1)];
    v25 = &a5[*((void *)&v32[0] + 1)];
    do
    {
      double v26 = *v20++;
      uint64_t result = dataTable<double>::getValue((uint64_t *)v32, 1, (a4 + v23 * v26) / a2);
      *v25++ = (a4 + v23 * v26) / a2;
      *(void *)v24++ = v27;
      --v19;
    }
    while (v19);
  }
  if (v17)
  {
    double v28 = -a2;
    do
    {
      double v29 = *v16++;
      uint64_t result = dataTable<double>::getValue((uint64_t *)v31, 1, (a4 + v28 * v29) / a3);
      *(void *)a7++ = v30;
      --v17;
    }
    while (v17);
  }
  return result;
}

void ACAMAgingUpdator::mergeSort(ACAMAgingUpdator *this, const double *a2, const double *a3, const double *a4, unint64_t a5, uint64_t a6, double *a7, double *a8, double *a9, unint64_t *a10)
{
  unint64_t v10 = 0;
  unint64_t v11 = a6 + a5;
  unint64_t v12 = a5;
  unint64_t v13 = 0;
  if (a5 && v11 > a5)
  {
    unint64_t v13 = 0;
    unint64_t v10 = 0;
    unint64_t v12 = a5;
    do
    {
      double v14 = a2[v13];
      double v15 = a2[v12];
      double v16 = v15 + -0.0000001;
      double v17 = v15 + 0.0000001;
      if (v15 <= v14 && (v16 <= v14 ? (BOOL v18 = v17 < v14) : (BOOL v18 = 1), v18))
      {
        a7[v10] = v14;
        a8[v10] = a3[v13];
        a9[v10] = a4[v13];
        uint64_t v19 = 1;
      }
      else
      {
        a7[v10] = v15;
        a8[v10] = a3[v12];
        a9[v10] = a4[v12++];
        uint64_t v19 = v17 >= v14 && v16 <= v14;
      }
      v13 += v19;
      ++v10;
    }
    while (v13 < a5 && v12 < v11);
  }
  *a10 = v10;
  unint64_t v21 = a5 - v13;
  if (a5 > v13)
  {
    v22 = (double *)&a4[v13];
    double v23 = (double *)&a3[v13];
    v24 = (double *)&a2[v13];
    do
    {
      if (a7[v10 - 1] > *v24)
      {
        a7[v10] = *v24;
        a8[v10] = *v23;
        a9[v10++] = *v22;
        *a10 = v10;
      }
      ++v22;
      ++v23;
      ++v24;
      --v21;
    }
    while (v21);
  }
  if (v12 < v11)
  {
    v25 = (double *)&a4[v12];
    unint64_t v26 = a6 + a5 - v12;
    uint64_t v27 = (double *)&a3[v12];
    double v28 = (double *)&a2[v12];
    do
    {
      if (a7[v10 - 1] > *v28)
      {
        a7[v10] = *v28;
        a8[v10] = *v27;
        a9[v10++] = *v25;
        *a10 = v10;
      }
      ++v25;
      ++v27;
      ++v28;
      --v26;
    }
    while (v26);
  }
}

unint64_t dataTable<double>::getValue(uint64_t *a1, char a2, double a3)
{
  unint64_t result = sortedUniqueArray<double>::getIdx(a1, -1, -1, a3);
  unint64_t v6 = a1[1] - 1;
  if (a2)
  {
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (result <= v6) {
      unint64_t result = v7;
    }
    else {
      unint64_t result = a1[1] - 1;
    }
    goto LABEL_10;
  }
  if (result <= v6 && result)
  {
LABEL_10:
    if (*(double *)(*a1 + 8 * result) == *(double *)(*a1 + 8 * result - 8)) {
      return puts("dataTable<T>::interpolate: Division by zero");
    }
  }
  return result;
}

void ACAMAgingUpdator::getOCV(ACAMAgingUpdator *this, double a2, double a3, double a4, const double *a5, unint64_t a6, double *a7)
{
}

void ACAMAgingUpdator::getSOCTop(ACAMAgingUpdator *this, double a2, double a3, double a4, double a5, double *a6)
{
  unint64_t v6 = 0;
  v11[101] = *(double *)MEMORY[0x263EF8340];
  int64x2_t v7 = (int64x2_t)xmmword_248B6AA50;
  uint64x2_t v8 = (uint64x2_t)vdupq_n_s64(0x65uLL);
  int64x2_t v9 = vdupq_n_s64(2uLL);
  while (1)
  {
    if (vmovn_s64((int64x2_t)vcgtq_u64(v8, (uint64x2_t)v7)).u8[0]) {
      v11[v6] = (double)v6 * 0.01;
    }
    if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x65uLL), *(uint64x2_t *)&v7)).i32[1]) {
      v11[v6 + 1] = (double)(v6 + 1) * 0.01;
    }
    v6 += 2;
    int64x2_t v7 = vaddq_s64(v7, v9);
    if (v6 == 102) {
      ACAMAgingUpdator::getOCV(this, a2, a3, a4, v11, 0x65uLL, v10);
    }
  }
}

void ACAMAgingUpdator::getRawNCC(double **this, double a2, double a3, double a4, double a5, double a6, double a7, double *a8)
{
  v50[4] = *(double *)MEMORY[0x263EF8340];
  unint64_t v10 = *this;
  unint64_t v12 = this[2];
  unint64_t v11 = this[3];
  double v13 = (*this)[27];
  double v14 = (*this)[20];
  double v15 = (*this)[13];
  double v28 = (*this)[34];
  double v16 = (*this)[21];
  v47[0] = (uint64_t)(*this + 21);
  v47[1] = 3;
  BOOL v48 = v16 > v10[23];
  v49 = v10 + 24;
  dataTable<double>::getValueArrhenius(v47, 1, 25.0, 273.15);
  double v18 = v17;
  double v19 = v10[14];
  v44[0] = (uint64_t)(v10 + 14);
  v44[1] = 3;
  BOOL v45 = v19 > v10[16];
  v46 = v10 + 17;
  dataTable<double>::getValueArrhenius(v44, 1, 25.0, 273.15);
  double v21 = v20;
  v41[0] = (uint64_t)(v10 + 7);
  v41[1] = 3;
  BOOL v42 = v10[7] > v10[9];
  v43 = v10 + 10;
  dataTable<double>::getValueArrhenius(v41, 1, 25.0, 273.15);
  double v23 = v22;
  v38[0] = (uint64_t)(v10 + 28);
  v38[1] = 3;
  BOOL v39 = v10[28] > v10[30];
  v40 = v10 + 31;
  dataTable<double>::getValueArrhenius(v38, 1, 25.0, 273.15);
  v50[0] = (v13 * a2 + 1.0) * v18;
  v50[1] = v50[0];
  v50[2] = fmin((v14 * a2 + 1.0) * v21, 0.8);
  v50[3] = (v15 * a2 + 1.0) * v23;
  *(void *)&v35[1] = v10 + 3;
  *(void *)&v35[2] = 4;
  double v24 = v10[3];
  double v25 = v10[6];
  v37 = v50;
  BOOL v36 = v24 > v25;
  double v27 = a7 + v26 * -(v11[50] * *v12) * (v28 * a2 + 1.0);
  double v34 = 0.0;
  v35[0] = 0.0;
  double v33 = 0.0;
  ACAMAgingUpdator::updateStoichiometryLimits((ACAMAgingUpdator *)this, a4, a3, a5, 0.0, v27, 1, v35, &v34, v35, &v33);
}

void dataTable<double>::getValueArrhenius(uint64_t *a1, char a2, double a3, double a4)
{
  unint64_t Idx = sortedUniqueArray<double>::getIdx(a1, -1, -1, a3);
  unint64_t v9 = a1[1] - 1;
  if (a2)
  {
    if (Idx <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = Idx;
    }
    if (Idx <= v9) {
      unint64_t Idx = v10;
    }
    else {
      unint64_t Idx = a1[1] - 1;
    }
  }
  else if (Idx > v9 || !Idx)
  {
    return;
  }
  uint64_t v11 = 8 * Idx - 8;
  double v12 = *(double *)(*a1 + v11);
  double v13 = *(double *)(*a1 + 8 * Idx);
  uint64_t v14 = a1[3];
  double v15 = *(double *)(v14 + v11);
  if (v15 < 0.0)
  {
    double v16 = *(double *)(v14 + 8 * Idx);
    if (v16 < 0.0)
    {
      double v17 = log10(-v15);
      double v18 = -v16;
LABEL_16:
      double v19 = 1.0 / (v12 + a4);
      double v20 = 1.0 / (v13 + a4);
      double v21 = log10(v18);
      double v22 = 1.0 / (a3 + a4);
      if (v20 == v19) {
        puts("dataTable<T>::interpolate: Division by zero");
      }
      __exp10(v17 + (v21 - v17) / (v20 - v19) * (v22 - v19));
      return;
    }
  }
  double v18 = *(double *)(v14 + 8 * Idx);
  if (v15 > 0.0 && v18 > 0.0)
  {
    double v17 = log10(*(long double *)(v14 + v11));
    goto LABEL_16;
  }
  if (v13 == v12) {
    puts("dataTable<T>::interpolate: Division by zero");
  }
}

unint64_t getValueNanIfOutOfRange(unint64_t result, double a2)
{
  double v2 = **(double **)result;
  double v3 = *(double *)(*(void *)result + 8 * *(void *)(result + 8) - 8);
  if (*(unsigned char *)(result + 16))
  {
    if (v2 < a2 || v3 > a2) {
      return result;
    }
    return dataTable<double>::getValue((uint64_t *)result, 0, a2);
  }
  if (v2 <= a2 && v3 >= a2) {
    return dataTable<double>::getValue((uint64_t *)result, 0, a2);
  }
  return result;
}

void ACAMAgingUpdator::getResistance(uint64_t a1, int a2, void *a3, double a4, double a5, double a6)
{
  v68[2] = *MEMORY[0x263EF8340];
  double v12 = fabs(a4);
  unint64_t Idx = sortedUniqueArray<double>::getIdx((uint64_t *)(*(void *)(a1 + 8) + 168), -1, -1, a5);
  uint64_t v14 = *(uint64_t **)(a1 + 8);
  unint64_t v15 = v14[22] - 1;
  if (Idx < v15) {
    unint64_t v15 = Idx;
  }
  if (v15 <= 1) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v15;
  }
  uint64_t v17 = v16 - 1;
  uint64_t v18 = 28;
  if (a4 > 0.0) {
    uint64_t v18 = 25;
  }
  uint64_t v19 = 27;
  if (a4 > 0.0) {
    uint64_t v19 = 24;
  }
  uint64_t v20 = v14[v19];
  unint64_t v21 = v14[v18];
  if (!v21)
  {
    unint64_t v22 = 0;
LABEL_23:
    if (v22) {
      unint64_t v30 = v22 - 1;
    }
    else {
      unint64_t v30 = 0;
    }
    unint64_t v23 = v22;
    goto LABEL_27;
  }
  unint64_t v22 = 0;
  unint64_t v23 = v21 - 1;
  uint64_t v24 = 29;
  if (a4 > 0.0) {
    uint64_t v24 = 26;
  }
  int v25 = LOBYTE(v14[v24]);
  do
  {
    unint64_t v26 = v21 >> 1;
    unint64_t v27 = v22 + (v21 >> 1);
    double v28 = *(double *)(v20 + 8 * v27);
    BOOL v29 = v28 > v12;
    if (!v25) {
      BOOL v29 = v28 < v12;
    }
    v21 += ~(v21 >> 1);
    if (v29) {
      unint64_t v22 = v27 + 1;
    }
    else {
      unint64_t v21 = v26;
    }
  }
  while (v21);
  unint64_t v30 = v23;
  if (v22 <= v23) {
    goto LABEL_23;
  }
LABEL_27:
  v31 = v14 + 32;
  if (a2 == 1) {
    v31 = v14 + 33;
  }
  v32 = v14 + 30;
  double v33 = v14 + 31;
  if (a2 != 1) {
    double v33 = v32;
  }
  if (a4 <= 0.0) {
    double v33 = v31;
  }
  uint64_t v34 = *v33;
  uint64_t v35 = *(void *)(v34 + 8 * v16);
  BOOL v36 = (_OWORD *)(v35 + 32 * v23);
  long long v37 = v36[1];
  v65[0] = *v36;
  v65[1] = v37;
  v38 = (_OWORD *)(v35 + 32 * v30);
  long long v39 = v38[1];
  v64[0] = *v38;
  v64[1] = v39;
  uint64_t v40 = *(void *)(v34 + 8 * v17);
  v41 = (_OWORD *)(v40 + 32 * v23);
  long long v42 = v41[1];
  v63[0] = *v41;
  v63[1] = v42;
  v43 = (_OWORD *)(v40 + 32 * v30);
  long long v44 = v43[1];
  v62[0] = *v43;
  v62[1] = v44;
  dataTable<double>::getValue((uint64_t *)v65, 0, a6);
  double v46 = v45;
  dataTable<double>::getValue((uint64_t *)v64, 0, a6);
  double v48 = v47;
  dataTable<double>::getValue((uint64_t *)v63, 0, a6);
  double v50 = v49;
  dataTable<double>::getValue((uint64_t *)v62, 0, a6);
  if (v30 == v23)
  {
    double v52 = (v50 + v51) * 0.5;
    double v53 = (v46 + v48) * 0.5;
  }
  else
  {
    double v54 = *(double *)(v20 + 8 * v30);
    double v55 = *(double *)(v20 + 8 * v23) - v54;
    double v56 = v12 - v54;
    double v52 = v51 + (v50 - v51) * v56 / v55;
    double v53 = v48 + (v46 - v48) * v56 / v55;
  }
  uint64_t v57 = *(void *)(*(void *)(a1 + 8) + 168);
  double v66 = *(double *)(v57 + 8 * v17);
  double v67 = *(double *)(v57 + 8 * v16);
  *(double *)v68 = v52;
  *(double *)&v68[1] = v53;
  v59[0] = (uint64_t)&v66;
  v59[1] = 2;
  BOOL v60 = v66 > v67;
  v61 = v68;
  dataTable<double>::getValueArrhenius(v59, 1, a5, 273.15);
  *a3 = v58;
}

void ACAMAgingUpdator::getRawNCCVersion2(ACAMAgingUpdator *this, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double *a10)
{
  uint64_t v10 = (ACAMAgingUpdator *)MEMORY[0x270FA5388](this, a10, a2, a3, a4, a5, a6, a7, a8, a9);
  double v12 = v11;
  double v14 = v13;
  double v57 = v15;
  double v55 = v16;
  double v56 = v17;
  uint64_t v18 = v10;
  uint64_t v19 = 0;
  v77[305] = *(double *)MEMORY[0x263EF8340];
  uint64_t v20 = *(double **)v10;
  unint64_t v22 = (double *)*((void *)v10 + 2);
  uint64_t v21 = *((void *)v10 + 3);
  double v23 = *(double *)(*(void *)v10 + 304);
  double v24 = *(double *)(*(void *)v10 + 328);
  double v25 = *(double *)(*(void *)v10 + 352);
  float64x2_t v26 = (float64x2_t)vdupq_n_s64(0xBF6B4E81B4E81B4FLL);
  uint64x2_t v27 = (uint64x2_t)vdupq_n_s64(0x12DuLL);
  int64x2_t v28 = (int64x2_t)xmmword_248B6AA50;
  __asm { FMOV            V3.2D, #1.0 }
  int64x2_t v34 = vdupq_n_s64(2uLL);
  do
  {
    uint64_t v35 = v19 + 1;
    v36.i64[0] = v19;
    v36.i64[1] = v19 + 1;
    float64x2_t v37 = vmlaq_f64(_Q3, v26, vcvtq_f64_u64(v36));
    if (vmovn_s64((int64x2_t)vcgtq_u64(v27, (uint64x2_t)v28)).u8[0]) {
      v77[v19] = v37.f64[0];
    }
    if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x12DuLL), *(uint64x2_t *)&v28)).i32[1]) {
      v77[v19 + 1] = v37.f64[1];
    }
    int64x2_t v28 = vaddq_s64(v28, v34);
    v19 += 2;
  }
  while (v35 != 301);
  double v38 = v24 + v23 * (v12 + 1.0);
  double v39 = (1.0 - v38) / 0.00333333333 + 1.0;
  memcpy(v76, v20 + 54, sizeof(v76));
  for (uint64_t i = 101; i != 202; ++i)
    v76[i] = v76[i] - v25;
  double v41 = v23 + v24;
  v71[0] = (uint64_t)v76;
  v71[1] = 101;
  BOOL v72 = v76[0] > v76[100];
  v73 = &v76[101];
  memcpy(__dst, v20 + 54, sizeof(__dst));
  for (uint64_t j = 0; j != 101; ++j)
  {
    v43 = &__dst[j];
    double *v43 = v38 - v41 + __dst[j];
    v43[101] = __dst[j + 101] - v25;
  }
  unint64_t v44 = (unint64_t)v39;
  v68[0] = (uint64_t)__dst;
  v68[1] = 101;
  BOOL v69 = __dst[0] > __dst[100];
  v70 = &__dst[101];
  if ((unint64_t)v39)
  {
    uint64_t v45 = 0;
    do
    {
      dataTable<double>::getValue(v71, 1, v77[v45]);
      v74[v45++] = v46 + (v12 + 1.0) * v25;
    }
    while (v44 != v45);
    dataTable<double>::getValue(v68, 1, v77[v44]);
    double v48 = v47;
    if (v44 > 0x12C)
    {
LABEL_19:
      v64 = v77;
      uint64_t v65 = 301;
      BOOL v66 = v77[0] > v77[300];
      double v67 = v74;
      double v52 = v20[53];
      v61[0] = (uint64_t)(v20 + 47);
      v61[1] = 3;
      BOOL v62 = v20[47] > v20[49];
      v63 = v20 + 50;
      dataTable<double>::getValueArrhenius(v61, 1, 25.0, 273.15);
      double v54 = v53 * -(*(double *)(v21 + 400) * *v22);
      double v59 = 0.0;
      double v60 = 0.0;
      double v58 = 0.0;
      ACAMAgingUpdator::updateStoichiometryLimits(v18, v56, v55, v57, 0.0, v14 + v54 * (v52 * v12 + 1.0), 1, &v60, &v59, &v60, &v58);
    }
  }
  else
  {
    dataTable<double>::getValue(v68, 1, v77[0]);
    double v48 = v49;
  }
  unint64_t v50 = v44 - 1;
  do
  {
    dataTable<double>::getValue(v68, 1, v77[v44]);
    v74[v44++] = v74[v50] + v51 - v48;
  }
  while (v44 != 301);
  goto LABEL_19;
}

void ACAMAgingUpdator::getNCCAdjustment(ACAMAgingUpdator *this, double a2, double a3, double a4, double a5, double a6, double a7, double *a8)
{
  unint64_t v8 = 0;
  v13[101] = *(double *)MEMORY[0x263EF8340];
  int64x2_t v9 = (int64x2_t)xmmword_248B6AA50;
  uint64x2_t v10 = (uint64x2_t)vdupq_n_s64(0x65uLL);
  int64x2_t v11 = vdupq_n_s64(2uLL);
  while (1)
  {
    if (vmovn_s64((int64x2_t)vcgtq_u64(v10, (uint64x2_t)v9)).u8[0]) {
      v13[v8] = (double)v8 * 0.01;
    }
    if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x65uLL), *(uint64x2_t *)&v9)).i32[1]) {
      v13[v8 + 1] = (double)(v8 + 1) * 0.01;
    }
    v8 += 2;
    int64x2_t v9 = vaddq_s64(v9, v11);
    if (v8 == 102) {
      ACAMAgingUpdator::getOCV(this, a2, a3, a4, v13, 0x65uLL, v12);
    }
  }
}

uint64_t sortedUniqueArray<double>::getIdx(uint64_t *a1, uint64_t a2, uint64_t a3, double a4)
{
  if (a2 == -1) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = a2;
  }
  if (a3 == -1) {
    a3 = a1[1] - 1;
  }
  unint64_t v6 = a3 - result + 1;
  if (a3 - result != -1)
  {
    uint64_t v7 = *a1;
    int v8 = *((unsigned __int8 *)a1 + 16);
    do
    {
      unint64_t v9 = v6 >> 1;
      uint64_t v10 = result + (v6 >> 1);
      double v11 = *(double *)(v7 + 8 * v10);
      BOOL v12 = v11 > a4;
      if (!v8) {
        BOOL v12 = v11 < a4;
      }
      v6 += ~(v6 >> 1);
      if (v12) {
        uint64_t result = v10 + 1;
      }
      else {
        unint64_t v6 = v9;
      }
    }
    while (v6);
  }
  return result;
}

double ACAMAgingModel::trapezoid(ACAMAgingModel *this, double a2, double a3, double a4, double *a5, double a6)
{
  double result = *a5 + (a2 + a3) * 0.5 * a4 * a6;
  *a5 = result;
  return result;
}

double ACAMAgingModel::forwardEuler(ACAMAgingModel *this, double a2, double a3, double *a4, double a5)
{
  double result = *a4 + a2 * a3 * a5;
  *a4 = result;
  return result;
}

void *ACAMAgingModel::ACAMAgingModel(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *double result = a2;
  result[1] = a3;
  result[2] = a4;
  return result;
}

{
  *double result = a2;
  result[1] = a3;
  result[2] = a4;
  return result;
}

void ACAMAgingModel::runOneStep()
{
  uint64_t v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  long long v2 = 0u;
  long long v3 = 0u;
  long long v0 = 0u;
  long long v1 = 0u;
  ACAMAgingModel::calculateAgingRate();
}

void ACAMAgingModel::calculateAgingRate()
{
}

BOOL ACAMAgingModel::checkDerivative(uint64_t a1, double *a2)
{
  BOOL result = 0;
  if (((void)a2[4] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    long long v2 = *(double **)(a1 + 16);
    if (fabs(a2[4]) <= v2[60] + -2.22044605e-16
      && ((void)a2[8] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && fabs(a2[8]) <= v2[61] + -2.22044605e-16
      && ((void)a2[9] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && fabs(a2[9]) <= v2[62] + -2.22044605e-16
      && ((void)a2[1] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && fabs(a2[1]) <= v2[63] + -2.22044605e-16
      && ((void)a2[3] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && fabs(a2[3]) <= v2[64] + -2.22044605e-16
      && ((void)a2[11] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && fabs(a2[11]) <= v2[65] + -2.22044605e-16
      && ((void)a2[12] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && fabs(a2[12]) <= v2[66] + -2.22044605e-16
      && (*(void *)a2 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && fabs(*a2) <= v2[67] + -2.22044605e-16)
    {
      return 1;
    }
  }
  return result;
}

__n128 ACAMAgingModel::updateAgingState(uint64_t *a1, uint64_t a2, double *a3, uint64_t a4, uint64_t a5, double *a6, double a7)
{
  uint64_t v14 = a1[2];
  ACAMAgingModel::updateCBPT(a7, (uint64_t)a1, a2, (uint64_t)a3, (double *)a4, (double *)a5, a6);
  a6[12] = a6[12] + (*(double *)(a4 + 64) + *(double *)(a5 + 64)) * 0.5 * a7;
  ACAMAgingModel::updateSEI((uint64_t)a1, a7, v15, a3, (double *)a4, (double *)a5, (uint64_t)a6);
  double v20 = *a6;
  double v21 = a6[1] + (*(double *)a4 + *(double *)a5) * 0.5 * a7;
  a6[1] = v21;
  uint64_t v22 = a1[2];
  double v23 = fmax(v21, *(double *)(v22 + 544));
  double v24 = v20 + (*(double *)(a4 + 8) + *(double *)(a5 + 8)) * 0.5 * a7;
  *a6 = v24;
  a6[1] = v23;
  *a6 = fmax(fmin(v24, *(double *)(v22 + 552)), 0.0);
  if (*(void *)(v14 + 464) == 2)
  {
    double v25 = a6[3] + (*(double *)(a4 + 24) + *(double *)(a5 + 24)) * 0.5 * a7;
    a6[3] = v25;
    a6[3] = fmax(fmin(v25, *(double *)(v22 + 552)), 0.0);
  }
  else
  {
    ACAMAgingModel::updateHardSwell(a1, a2, a7, v18, a4, v19, (uint64_t)a6);
  }
  ACAMAgingModel::updateImpedanceGrowth(a7, v16, v17, v18, a4, a5, (uint64_t)a6);
  long long v26 = *(_OWORD *)a4;
  long long v27 = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(a5 + 16) = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(a5 + 32) = v27;
  *(_OWORD *)a5 = v26;
  __n128 result = *(__n128 *)(a4 + 48);
  long long v29 = *(_OWORD *)(a4 + 64);
  long long v30 = *(_OWORD *)(a4 + 80);
  *(void *)(a5 + 96) = *(void *)(a4 + 96);
  *(_OWORD *)(a5 + 64) = v29;
  *(_OWORD *)(a5 + 80) = v30;
  *(__n128 *)(a5 + 48) = result;
  return result;
}

void ACAMAgingModel::calculateSEI()
{
}

void ACAMAgingModel::calculateCBPT()
{
}

void ACAMAgingModel::calculateAnodeCracking()
{
}

void ACAMAgingModel::calculateHardSwell()
{
}

void ACAMAgingModel::calculateHardSwellVersion2()
{
}

long double ACAMAgingModel::calculateGasSwell(uint64_t *a1, uint64_t a2, uint64_t a3, double *a4, double *a5)
{
  uint64_t v6 = *a1;
  double v7 = a4[1];
  double v24 = *a4;
  double v8 = *(double *)(a2 + 16) + 273.15;
  double v9 = *(double *)(a3 + 32);
  double v10 = *(double *)(a3 + 40);
  double v11 = v10 - *(double *)(*a1 + 568);
  long double v12 = exp(*(long double *)(*a1 + 576));
  long double v13 = atan(v11 * v12) + 1.57079633;
  double v14 = exp(*(long double *)(v6 + 584));
  long double v15 = exp(*(long double *)(v6 + 592)) + v13 * v14;
  long double v16 = v15 * exp(-*(double *)(v6 + 600) / v8) / -3600.0;
  double v17 = *(double *)(v6 + 632);
  double v18 = *(double *)(v6 + 672);
  double v19 = exp(*(double *)(v6 + 624) / v8 + *(double *)(v6 + 608) + v10 * *(double *)(v6 + 616) / v8);
  long double v20 = v19 / (exp(v8 * v17 * (v7 + v18)) + 1.0);
  double v21 = *(double *)(v6 + 664);
  double v22 = exp(*(double *)(v6 + 656) / v8 + *(double *)(v6 + 640) + v9 * *(double *)(v6 + 648) / v8);
  long double result = (v20 - (1.0 - exp(-(v21 * v24) / 100.0)) * v22) / 3600.0 * 100.0;
  *a5 = v16;
  a5[1] = result;
  return result;
}

void ACAMAgingModel::calculateImpedanceGrowth(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4 < 2) {
    operator new[]();
  }
  puts("Not yet implemented");
  exit(1);
}

double ACAMAgingModel::updateCBPT(double a1, uint64_t a2, uint64_t a3, uint64_t a4, double *a5, double *a6, double *a7)
{
  double v7 = a7[8];
  a7[7] = a7[7] + (a5[4] + a6[4]) * 0.5 * a1;
  a7[8] = v7 + (-a6[4] - a5[4]) * 0.5 * a1;
  double v8 = a7[10];
  a7[9] = a7[9] + (-a6[5] - a5[5]) * 0.5 * a1;
  a7[10] = v8 + (-a6[6] - a5[6]) * 0.5 * a1;
  double result = a7[11] + (-a6[7] - a5[7]) * 0.5 * a1;
  a7[11] = result;
  return result;
}

double ACAMAgingModel::updateAnodeCracking(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  double result = *(double *)(a7 + 96) + (*(double *)(a5 + 64) + *(double *)(a6 + 64)) * 0.5 * a1;
  *(double *)(a7 + 96) = result;
  return result;
}

double ACAMAgingModel::updateSEI(uint64_t a1, double a2, uint64_t a3, double *a4, double *a5, double *a6, uint64_t a7)
{
  double v7 = *(double **)(a1 + 8);
  double v8 = a5[9];
  double v9 = a6[9];
  double v10 = *(double *)(a7 + 104)
      + ((a5[4] + a6[4]) * 0.5 * a2 * (v7[2] / v7[3]) + 0.0) * ((a4[1] + a4[14]) * 0.5)
      + (v8 + v9) * 0.5 * a2
      + 0.0
      + ((a5[8] + a6[8]) * 0.5 * a2 * (v7[1] / v7[3]) + 0.0) * ((*a4 + a4[13]) * 0.5);
  double result = (-v9 - v8) * 0.5 * a2 + *(double *)(a7 + 112);
  *(double *)(a7 + 104) = v10;
  *(double *)(a7 + 112) = result;
  return result;
}

double ACAMAgingModel::updateGasSwell(uint64_t a1, double a2, uint64_t a3, uint64_t a4, double *a5, double *a6, double *a7)
{
  double v7 = *a7;
  double v8 = a7[1] + (*a5 + *a6) * 0.5 * a2;
  a7[1] = v8;
  uint64_t v9 = *(void *)(a1 + 16);
  double v10 = fmax(v8, *(double *)(v9 + 544));
  double v11 = v7 + (a5[1] + a6[1]) * 0.5 * a2;
  *a7 = v11;
  a7[1] = v10;
  double result = fmax(fmin(v11, *(double *)(v9 + 552)), 0.0);
  *a7 = result;
  return result;
}

double ACAMAgingModel::updateHardSwell(uint64_t *a1, uint64_t a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = *a1;
  uint64_t v12 = *a1 + 752;
  v17[0] = *a1 + 680;
  v17[1] = 3;
  BOOL v18 = *(double *)(v11 + 680) > *(double *)(v11 + 696);
  uint64_t v19 = v12;
  dataTable<double>::getValueArrhenius(v17, 1, *(double *)(a2 + 16), 273.15);
  double v14 = v13;
  long double v15 = exp(v13 * *(double *)(a7 + 24)) + *(double *)(a5 + 16) * a3;
  *(long double *)(a7 + 32) = v15;
  double result = fmax(fmin(log(v15) / v14, *(double *)(a1[2] + 552)), 0.0);
  *(double *)(a7 + 24) = result;
  return result;
}

double ACAMAgingModel::updateHardSwellVersion2(uint64_t a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  double v7 = *(double *)(a7 + 24) + (*(double *)(a5 + 24) + *(double *)(a6 + 24)) * 0.5 * a2;
  *(double *)(a7 + 24) = v7;
  double result = fmax(fmin(v7, *(double *)(*(void *)(a1 + 16) + 552)), 0.0);
  *(double *)(a7 + 24) = result;
  return result;
}

float64x2_t ACAMAgingModel::updateImpedanceGrowth(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  double v7 = *(double *)(a7 + 120);
  *(double *)(a7 + 128) = *(double *)(a7 + 128) + (*(double *)(a5 + 96) + *(double *)(a6 + 96)) * 0.5 * a1;
  float64_t v8 = *(double *)(a5 + 96);
  float64_t v9 = *(double *)(a6 + 96);
  *(double *)(a7 + 120) = v7 + (*(double *)(a5 + 88) + *(double *)(a6 + 88)) * 0.5 * a1;
  float64x2_t v10 = *(float64x2_t *)(a5 + 88);
  v10.f64[1] = v8;
  float64x2_t v11 = *(float64x2_t *)(a6 + 88);
  v11.f64[1] = v9;
  float64x2_t v12 = vaddq_f64(v10, v11);
  __asm { FMOV            V2.2D, #0.5 }
  float64x2_t result = vaddq_f64(*(float64x2_t *)(a7 + 40), vaddq_f64(vmulq_n_f64(vmulq_f64(v12, _Q2), a1), (float64x2_t)0));
  *(float64x2_t *)(a7 + 40) = result;
  return result;
}

double ACAMAgingModel::calculateSEIAtGridTemperature(double **this, double a2, double a3, double a4, double a5, int a6, double *a7)
{
  float64x2_t v12 = *this;
  double v13 = &(*this)[a6];
  double v22 = v13[10];
  double v23 = v13[13];
  double v14 = v13[4];
  double v15 = v13[7];
  double v16 = (*this)[3];
  double v17 = 1.0 / (exp(-((*this)[17] * (a2 - (*this)[16]))) + 1.0);
  double v18 = exp((a4 - v16) * (v15 / (*v13 + 273.15))) + v14 * fmax(a5, v12[18]);
  double v19 = a3 / *this[1];
  double v20 = 0.0;
  if (v19 > 0.0) {
    double v20 = -1.0;
  }
  double result = v22 * (v17 * (fabs(v19) * v20)) / v18 - v23 / v18;
  *a7 = result;
  return result;
}

long double ACAMAgingModel::calculateCBPTAtGridTemperature(double **this, double a2, long double a3, double a4, double a5, double a6, double a7, int a8, double *a9, double *a10, double *a11, long double *a12)
{
  double v18 = &(*this)[a8];
  double v37 = v18[28];
  double v38 = v18[25];
  double v36 = v18[31];
  double v19 = v18[34];
  double v20 = v18[37];
  double v21 = v18[40];
  double v22 = v18[22];
  long double v23 = (*this)[49];
  long double __y = (*this)[50];
  double v24 = v18[19] + 273.15;
  double v25 = pow(v18[43] * a6 + 1.0 - v18[46] * a7, (*this)[51]);
  double v26 = a4 - v22;
  double v27 = exp(v26 * (v19 / v24));
  double v28 = exp(v26 * (v20 / v24));
  double v29 = exp(v26 * (v21 / v24));
  double v30 = pow(fabs(a5 / *this[1]), v23);
  long double result = v28 * -(v36 * (pow(a3, __y) * v30));
  double v32 = -(v38 * v25) * v29;
  *a9 = v32 + result - v37 * v27;
  *a10 = v32;
  *a12 = result;
  *a11 = -(v37 * v27);
  return result;
}

void ACAMAgingModel::calculateAnodeCrackingAtGridTemperature(double **this, double a2, double a3, double a4, unsigned int a5, double *a6)
{
  float64x2_t v12 = *this;
  double v13 = &(*this)[a5];
  double v14 = v13[59];
  double v15 = exp(v13[53] * a3 + 1.0 + v13[62] * a3 * a3);
  double v16 = -v14 / v15;
  if (fabs(a2) >= this[2][1])
  {
    uint64_t v17 = (uint64_t)&v12[a5 + 52];
    if (a3 >= 0.650000095 || a3 <= 0.400000006) {
      double v20 = 1.0;
    }
    else {
      double v20 = *(double *)(v17 + 104);
    }
    double v18 = *(double *)(v17 + 32);
    double v16 = v16 - v20 * v18 * a4 * pow(fabs(a2 / *this[1]), v12[52]) / v15;
  }
  *a6 = v16;
}

long double ACAMAgingModel::IPBGasSwell(ACAMAgingModel *this, double a2, double a3, long double *a4)
{
  uint64_t v6 = *(void *)this;
  double v7 = a3 - *(double *)(*(void *)this + 568);
  long double v8 = exp(*(long double *)(*(void *)this + 576));
  long double v9 = atan(v7 * v8) + 1.57079633;
  double v10 = exp(*(long double *)(v6 + 584));
  long double v11 = exp(*(long double *)(v6 + 592)) + v9 * v10;
  long double result = v11 * exp(-*(double *)(v6 + 600) / a2);
  *a4 = result;
  return result;
}

void ACAMAgingModel::calculateHardSwellAtGridTemperature(ACAMAgingModel *this, double a2, double a3, unsigned int a4, double *a5)
{
  double v6 = 0.0;
  if (-*(double *)(*((void *)this + 2) + 8) <= a3)
  {
    uint64_t v7 = *(void *)this + 8 * a4;
    double v8 = *(double *)(v7 + 704);
    double v6 = v8 * exp(*(double *)(v7 + 728) * a2);
  }
  *a5 = v6;
}

double ACAMAgingModel::calculateHardSwellAtGridTemperatureVersion2(double **this, double a2, double a3, double a4, double a5, double a6, int a7, double *a8)
{
  long double v11 = &(*this)[a7];
  double v12 = v11[97] + 273.15;
  double v13 = (*this)[100];
  double v23 = v11[107];
  double v24 = v11[110];
  double v14 = v11[104];
  double v15 = v11[101];
  double v16 = (*this)[115];
  double v17 = 1.0 / (exp(-((*this)[114] * (a3 - (*this)[113]))) + 1.0);
  double v18 = exp((a4 - v13) * v14 / v12) + fmax(v16, a6 * a6) * v15;
  double v19 = a5 / *this[1];
  double v20 = 0.0;
  if (v19 > 0.0) {
    double v20 = 1.0;
  }
  double result = v24 / v18 + v23 * (fabs(v19) * (v17 * v20)) / v18;
  *a8 = result;
  return result;
}

double ACAMAgingModel::calculateImpedanceGrowthAtGridTemperature(double **a1, unsigned int a2, int a3, double *a4, double a5, double a6, double a7, double a8)
{
  long double v11 = *a1;
  uint64_t v12 = a2;
  uint64_t v13 = (uint64_t)(*a1 + 116);
  double v14 = (double *)(v13 + 8 * a2);
  double v15 = v14 + 3;
  double v16 = *a1 + 128;
  double v17 = v14 + 6;
  double v18 = v14 + 9;
  double v19 = *a1 + 129;
  double v20 = *a1 + 130;
  double v21 = *a1 + 131;
  double v22 = *a1 + 132;
  double v23 = v11 + 133;
  uint64_t v24 = (uint64_t)(v11 + 134);
  uint64_t v25 = (uint64_t)&v11[v12 + 134];
  double v26 = (double *)(v25 + 24);
  double v27 = v11 + 146;
  double v28 = (double *)(v25 + 48);
  double v29 = (double *)(v25 + 72);
  double v30 = v11 + 147;
  v31 = v11 + 148;
  double v32 = v11 + 149;
  double v33 = v11 + 150;
  int64x2_t v34 = v11 + 151;
  if (a3)
  {
    int64x2_t v34 = v23;
  }
  else
  {
    double v18 = v29;
    double v22 = v33;
    double v16 = v27;
    double v17 = v28;
  }
  if (!a3)
  {
    double v15 = v26;
    double v21 = v32;
    double v20 = v31;
    double v19 = v30;
    uint64_t v13 = v24;
  }
  double v35 = *v19;
  double v36 = *v20;
  double v37 = *v21;
  double v45 = *v17;
  double v38 = *v34;
  long double v39 = *v22;
  double v40 = *v18;
  double v41 = exp(*v15 / (*(double *)(v13 + 8 * v12) + 273.15) * (a6 - *v16));
  long double v42 = v35 / (exp(-(v36 * (a8 - v38))) + 1.0) + 1.0;
  long double v43 = pow(v37 * a8 + 1.0, v39);
  double result = v40 * (v41 * (v43 * v42)) + fabs(a7 / *a1[1]) * (v45 * (v41 * (v43 * v42))) * a5;
  *a4 = result;
  return result;
}

uint64_t ACAM::ACAM(uint64_t a1, const void *a2, ACAMPerformanceModelParameter *a3, const void *a4, const void *a5, uint64_t a6, const void *a7)
{
  *(unsigned char *)a1 = 0;
  uint64_t v13 = a1 + 8;
  memcpy((void *)(a1 + 8), a2, 0x4C0uLL);
  ACAMPerformanceModelParameter::ACAMPerformanceModelParameter((ACAMPerformanceModelParameter *)(a1 + 1224), a3);
  memcpy((void *)(a1 + 1560), a4, 0x14A0uLL);
  uint64_t v14 = *(void *)(a6 + 32);
  long long v15 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a1 + 6840) = *(_OWORD *)a6;
  *(_OWORD *)(a1 + 6856) = v15;
  *(void *)(a1 + 6872) = v14;
  memcpy((void *)(a1 + 6880), a7, 0x2E0uLL);
  memcpy((void *)(a1 + 7616), a5, 0x5010uLL);
  ACAMAgingModel::ACAMAgingModel((void *)(a1 + 28112), v13, a1 + 6840, a1 + 6880);
  ACAMPerformanceModel::ACAMPerformanceModel((void *)(a1 + 28136), a1 + 1224, a1 + 6840, a1 + 6880);
  ACAMAgingUpdator::ACAMAgingUpdator((void *)(a1 + 28160), a1 + 1560, a1 + 1224, a1 + 6840, a1 + 6880);
  *(void *)(a1 + 28936) = 0;
  *(void *)(a1 + 28984) = 0;
  *(void *)(a1 + 29000) = 0;
  *(void *)(a1 + 28992) = 0;
  *(void *)(a1 + 28952) = 0;
  *(void *)(a1 + 28968) = 0;
  *(void *)(a1 + 28960) = 0;
  *(_OWORD *)(a1 + 29024) = 0u;
  *(_OWORD *)(a1 + 29040) = 0u;
  *(_OWORD *)(a1 + 29056) = 0u;
  *(_OWORD *)(a1 + 29072) = 0u;
  *(_OWORD *)(a1 + 29088) = 0u;
  *(_OWORD *)(a1 + 29104) = 0u;
  return a1;
}

void sub_248B55C18(_Unwind_Exception *a1)
{
  ACAMPerformanceModelParameter::~ACAMPerformanceModelParameter(v1);
  _Unwind_Resume(a1);
}

void ACAMStatus::~ACAMStatus(void **this)
{
  if (*((char *)this + 95) < 0) {
    operator delete(this[9]);
  }
  if (*((char *)this + 55) < 0) {
    operator delete(this[4]);
  }
}

uint64_t ACAM::preInit(ACAM *this, const ACAMPersistentStates *a2, const ACAMStatus::SystemSignals *a3, BOOL *a4)
{
  *a4 = 0;
  __int16 v14 = 0;
  double v8 = (ACAM *)((char *)this + 28952);
  ACAMStatus::setFreshInitReason((uint64_t)this + 28952, 0);
  if (a2)
  {
    ACAMPersistentStates::restore(a2, this);
    ACAMStatus::setInitType((uint64_t)v8, 1);
    uint64_t v9 = *((void *)this + 860);
    if (v9) {
      BOOL v10 = v9 == *((void *)a2 + 99);
    }
    else {
      BOOL v10 = 0;
    }
    char v11 = !v10;
    HIBYTE(v14) = v11;
    LOBYTE(v14) = ACAM::checkAgingBoundViolation(this);
  }
  else
  {
    *a4 = 1;
  }
  ACAMStatus::setAlgoStatusBuffer((uint64_t)v8, (uint64_t)a3, &v14);
  if (ACAMStatus::initializationRequired(v8))
  {
    *a4 = 1;
    if (!a2)
    {
      int v12 = 2;
      return ACAMStatus::setFreshInitReason((uint64_t)v8, v12);
    }
    goto LABEL_18;
  }
  if (*a4) {
    int v12 = 2;
  }
  else {
    int v12 = 1;
  }
  if (*a4 && a2)
  {
LABEL_18:
    if ((_BYTE)v14)
    {
      int v12 = 5;
    }
    else if (HIBYTE(v14))
    {
      int v12 = 4;
    }
    else
    {
      int v12 = 3;
    }
  }
  return ACAMStatus::setFreshInitReason((uint64_t)v8, v12);
}

BOOL ACAM::checkAgingBoundViolation(ACAM *this)
{
  double v1 = *((double *)this + 3590);
  double v2 = *((double *)this + 944);
  double v3 = *((double *)this + 945);
  if (v2 == v3)
  {
    BOOL v4 = v1 == v2;
  }
  else if (v3 <= v2)
  {
    BOOL v4 = v1 < v2;
    if (v1 < v3) {
      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = v1 >= v2;
    if (v1 >= v3) {
      BOOL v4 = 0;
    }
  }
  double v5 = *((double *)this + 3585);
  double v6 = *((double *)this + 946);
  double v7 = *((double *)this + 947);
  if (v6 == v7)
  {
    BOOL v8 = v5 == v6;
  }
  else if (v7 <= v6)
  {
    BOOL v8 = v5 < v6;
    if (v5 < v7) {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = v5 >= v6;
    if (v5 >= v7) {
      BOOL v8 = 0;
    }
  }
  double v9 = *((double *)this + 3591);
  double v10 = *((double *)this + 948);
  double v11 = *((double *)this + 949);
  BOOL v12 = v9 < v10;
  if (v9 < v11) {
    BOOL v12 = 0;
  }
  BOOL v13 = v9 >= v10;
  if (v9 >= v11) {
    BOOL v13 = 0;
  }
  if (v11 > v10) {
    BOOL v12 = v13;
  }
  if (v10 == v11) {
    BOOL v12 = v9 == v10;
  }
  double v14 = *((double *)this + 3581);
  double v15 = *((double *)this + 950);
  double v16 = *((double *)this + 951);
  BOOL v17 = v14 < v15;
  if (v14 < v16) {
    BOOL v17 = 0;
  }
  BOOL v18 = v14 >= v15;
  if (v14 >= v16) {
    BOOL v18 = 0;
  }
  if (v16 > v15) {
    BOOL v17 = v18;
  }
  if (v15 == v16) {
    BOOL v17 = v14 == v15;
  }
  return !v4 || !v8 || !v12 || !v17;
}

uint64_t *ACAM::init(ACAM *this, const ACAMPersistentStates *a2)
{
  long long v4 = *(_OWORD *)a2;
  long long v5 = *((_OWORD *)a2 + 1);
  *((void *)this + 3538) = *((void *)a2 + 4);
  *((_OWORD *)this + 1768) = v5;
  *((_OWORD *)this + 1767) = v4;
  long long v6 = *(_OWORD *)a2;
  long long v7 = *((_OWORD *)a2 + 1);
  *((void *)this + 3533) = *((void *)a2 + 4);
  *(_OWORD *)((char *)this + 28248) = v7;
  *(_OWORD *)((char *)this + 28232) = v6;
  long long v8 = *(_OWORD *)((char *)a2 + 40);
  long long v9 = *(_OWORD *)((char *)a2 + 56);
  *((void *)this + 3528) = *((void *)a2 + 9);
  *((_OWORD *)this + 1763) = v9;
  *((_OWORD *)this + 1762) = v8;
  long long v11 = *((_OWORD *)a2 + 9);
  long long v10 = *((_OWORD *)a2 + 10);
  long long v12 = *((_OWORD *)a2 + 8);
  *((void *)this + 3577) = *((void *)a2 + 22);
  *(_OWORD *)((char *)this + 28584) = v11;
  *(_OWORD *)((char *)this + 28600) = v10;
  *(_OWORD *)((char *)this + 28568) = v12;
  long long v13 = *((_OWORD *)a2 + 5);
  long long v14 = *((_OWORD *)a2 + 7);
  *(_OWORD *)((char *)this + 28536) = *((_OWORD *)a2 + 6);
  *(_OWORD *)((char *)this + 28552) = v14;
  *(_OWORD *)((char *)this + 28520) = v13;
  long long v15 = *((_OWORD *)a2 + 5);
  long long v16 = *((_OWORD *)a2 + 6);
  *((_OWORD *)this + 1778) = *((_OWORD *)a2 + 7);
  *((_OWORD *)this + 1777) = v16;
  *((_OWORD *)this + 1776) = v15;
  long long v17 = *((_OWORD *)a2 + 8);
  long long v18 = *((_OWORD *)a2 + 9);
  long long v19 = *((_OWORD *)a2 + 10);
  *((void *)this + 3564) = *((void *)a2 + 22);
  *((_OWORD *)this + 1781) = v19;
  *((_OWORD *)this + 1780) = v18;
  *((_OWORD *)this + 1779) = v17;
  long long v20 = *(_OWORD *)((char *)a2 + 184);
  long long v21 = *(_OWORD *)((char *)a2 + 216);
  *(_OWORD *)((char *)this + 28328) = *(_OWORD *)((char *)a2 + 200);
  *(_OWORD *)((char *)this + 28344) = v21;
  *(_OWORD *)((char *)this + 28312) = v20;
  long long v22 = *(_OWORD *)((char *)a2 + 232);
  long long v23 = *(_OWORD *)((char *)a2 + 248);
  long long v24 = *(_OWORD *)((char *)a2 + 264);
  *((void *)this + 3551) = *((void *)a2 + 35);
  *(_OWORD *)((char *)this + 28376) = v23;
  *(_OWORD *)((char *)this + 28392) = v24;
  *(_OWORD *)((char *)this + 28360) = v22;
  *((_OWORD *)this + 1789) = *((_OWORD *)a2 + 18);
  long long v25 = *((_OWORD *)a2 + 19);
  long long v26 = *((_OWORD *)a2 + 20);
  long long v27 = *((_OWORD *)a2 + 21);
  *((_OWORD *)this + 1793) = *((_OWORD *)a2 + 22);
  *((_OWORD *)this + 1792) = v27;
  *((_OWORD *)this + 1791) = v26;
  *((_OWORD *)this + 1790) = v25;
  long long v28 = *((_OWORD *)a2 + 23);
  long long v29 = *((_OWORD *)a2 + 24);
  long long v30 = *((_OWORD *)a2 + 25);
  *((void *)this + 3594) = *((void *)a2 + 52);
  *((_OWORD *)this + 1796) = v30;
  *((_OWORD *)this + 1795) = v29;
  *((_OWORD *)this + 1794) = v28;
  *(_OWORD *)((char *)this + 28760) = *(_OWORD *)((char *)a2 + 424);
  long long v31 = *(_OWORD *)((char *)a2 + 440);
  long long v32 = *(_OWORD *)((char *)a2 + 456);
  long long v33 = *(_OWORD *)((char *)a2 + 472);
  *((void *)this + 3603) = *((void *)a2 + 61);
  *(_OWORD *)((char *)this + 28792) = v32;
  *(_OWORD *)((char *)this + 28808) = v33;
  *(_OWORD *)((char *)this + 28776) = v31;
  long long v35 = *((_OWORD *)a2 + 35);
  long long v34 = *((_OWORD *)a2 + 36);
  uint64_t v36 = *((void *)a2 + 74);
  *((_OWORD *)this + 1805) = *((_OWORD *)a2 + 34);
  *((void *)this + 3616) = v36;
  *((_OWORD *)this + 1807) = v34;
  *((_OWORD *)this + 1806) = v35;
  long long v37 = *((_OWORD *)a2 + 31);
  long long v38 = *((_OWORD *)a2 + 32);
  *((_OWORD *)this + 1804) = *((_OWORD *)a2 + 33);
  *((_OWORD *)this + 1803) = v38;
  *((_OWORD *)this + 1802) = v37;
  *(_OWORD *)((char *)this + 28936) = *(_OWORD *)((char *)a2 + 600);
  long long v39 = *(_OWORD *)((char *)a2 + 664);
  *((void *)this + 3621) = *((void *)a2 + 85);
  *(_OWORD *)((char *)this + 28952) = v39;
  *((_WORD *)this + 14488) = *((_WORD *)a2 + 344);
  std::string::operator=((std::string *)((char *)this + 28984), (const std::string *)a2 + 29);
  *((_OWORD *)this + 1813) = *((_OWORD *)a2 + 45);
  std::string::operator=((std::string *)((char *)this + 29024), (const std::string *)((char *)a2 + 736));
  long long v41 = *(_OWORD *)((char *)a2 + 632);
  long long v40 = *(_OWORD *)((char *)a2 + 648);
  *(_OWORD *)((char *)this + 29048) = *(_OWORD *)((char *)a2 + 616);
  *(_OWORD *)((char *)this + 29064) = v41;
  *(_OWORD *)((char *)this + 29080) = v40;
  *(unsigned char *)this = *((unsigned char *)a2 + 784);

  return simpleList<ACAMBatteryState>::operator=((uint64_t *)this + 3637, (void *)a2 + 95);
}

uint64_t *simpleList<ACAMBatteryState>::operator=(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  if (v4)
  {
    do
    {
      uint64_t v5 = *(void *)(v4 + 40);
      MEMORY[0x24C58C0C0]();
      uint64_t v4 = v5;
    }
    while (v5);
  }
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (*a2) {
    simpleList<ACAMBatteryState>::append((uint64_t)a1);
  }
  return a1;
}

void ACAM::init(ACAM *this, double a2, double a3, double a4)
{
  double v23 = a4;
  double v24 = a3;
  *((_OWORD *)this + 1789) = 0u;
  *((_OWORD *)this + 1790) = 0u;
  *((_OWORD *)this + 1791) = 0u;
  *((_OWORD *)this + 1792) = 0u;
  *((_OWORD *)this + 1793) = 0u;
  *((_OWORD *)this + 1794) = 0u;
  *((_OWORD *)this + 1795) = 0u;
  *((_OWORD *)this + 1796) = 0u;
  *((void *)this + 3594) = 0;
  uint64_t v22 = 21;
  v20[4] = (char *)this + 7616;
  uint64_t v21 = 11;
  v20[0] = &v22;
  v20[1] = &v21;
  v20[2] = &v24;
  v20[3] = &v23;
  ACAM::init(double,double,double)::$_0::operator()((uint64_t)v20, (uint64_t)this + 9632);
  *((void *)this + 3590) = v5;
  ACAM::init(double,double,double)::$_0::operator()((uint64_t)v20, (uint64_t)this + 11480);
  *((void *)this + 3585) = v6;
  ACAM::init(double,double,double)::$_0::operator()((uint64_t)v20, (uint64_t)this + 13328);
  *((void *)this + 3591) = v7;
  *((double *)this + 3586) = 1.0 - *((double *)this + 3585);
  ACAM::init(double,double,double)::$_0::operator()((uint64_t)v20, (uint64_t)this + 15176);
  *((void *)this + 3583) = v8;
  ACAM::init(double,double,double)::$_0::operator()((uint64_t)v20, (uint64_t)this + 17024);
  *((void *)this + 3584) = v9;
  ACAM::init(double,double,double)::$_0::operator()((uint64_t)v20, (uint64_t)this + 20720);
  *((void *)this + 3592) = v10;
  ACAM::init(double,double,double)::$_0::operator()((uint64_t)v20, (uint64_t)this + 24416);
  *((void *)this + 3578) = v11;
  ACAM::init(double,double,double)::$_0::operator()((uint64_t)v20, (uint64_t)this + 26264);
  *((void *)this + 3579) = v12;
  if (*((void *)this + 918) == 2)
  {
    ACAM::init(double,double,double)::$_0::operator()((uint64_t)v20, (uint64_t)this + 22568);
  }
  else
  {
    v17[0] = (uint64_t)this + 688;
    v17[1] = 3;
    BOOL v18 = *((double *)this + 86) > *((double *)this + 88);
    long long v19 = (char *)this + 760;
    dataTable<double>::getValueArrhenius(v17, 1, 25.0, 273.15);
    double v14 = v13;
    ACAM::init(double,double,double)::$_0::operator()((uint64_t)v20, (uint64_t)this + 18872);
    *((long double *)this + 3582) = v15;
    double v16 = log(v15) / v14;
  }
  *((double *)this + 3581) = v16;
  *((void *)this + 3603) = 0;
  *(_OWORD *)((char *)this + 28808) = 0u;
  *(_OWORD *)((char *)this + 28760) = 0u;
  *(_OWORD *)((char *)this + 28792) = 0u;
  *(_OWORD *)((char *)this + 28776) = 0u;
  ACAMAgingUpdator::updateStoichiometryLimits((ACAM *)((char *)this + 28160), *((double *)this + 3590) * *(double *)(*((void *)this + 3522) + 8), *((double *)this + 3585) * *(double *)(*((void *)this + 3522) + 16), *((double *)this + 3591) * *(double *)(*((void *)this + 3522) + 24), (double *)this + 3595, (double *)this + 3596, (double *)this + 3597, (double *)this + 3598);
}

unint64_t ACAM::init(double,double,double)::$_0::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0;
  uint64_t v41[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = *(double **)(a1 + 32);
  double v6 = **(double **)(a1 + 16);
  unint64_t v7 = 21;
  do
  {
    unint64_t v8 = v7 >> 1;
    uint64_t v9 = v4 + (v7 >> 1);
    double v10 = v5[v9];
    BOOL v11 = v10 > v6;
    if (*v5 <= v5[20]) {
      BOOL v11 = v10 < v6;
    }
    v7 += ~(v7 >> 1);
    if (v11) {
      uint64_t v4 = v9 + 1;
    }
    else {
      unint64_t v7 = v8;
    }
  }
  while (v7);
  if (v4)
  {
    uint64_t v12 = v4 - 1;
    if (v4 == **(void **)a1) {
      uint64_t v13 = v4 - 1;
    }
    else {
      uint64_t v13 = v4;
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  unint64_t v14 = **(void **)(a1 + 8);
  long double v15 = &v5[11 * v12];
  double v17 = v15[21];
  double v16 = v15 + 21;
  double v18 = v17;
  v36[0] = (uint64_t)v16;
  v36[1] = v14;
  unint64_t v19 = v14 - 1;
  double v20 = v16[v14 - 1];
  uint64_t v38 = a2 + 8 * v14 * v12;
  if (v14 > 1)
  {
    uint64_t v21 = v5;
  }
  else
  {
    puts("dataTable<T>::dataTable requires at least two elements[pointer constructor]");
    double v18 = *v16;
    double v20 = v16[v19];
    unint64_t v14 = **(void **)(a1 + 8);
    uint64_t v21 = *(double **)(a1 + 32);
    unint64_t v19 = v14 - 1;
  }
  BOOL v37 = v18 > v20;
  uint64_t v22 = &v21[11 * v13];
  double v24 = v22[21];
  double v23 = v22 + 21;
  double v25 = v24;
  v33[0] = (uint64_t)v23;
  v33[1] = v14;
  double v26 = v23[v19];
  uint64_t v35 = a2 + 8 * v14 * v13;
  if (v14 <= 1)
  {
    puts("dataTable<T>::dataTable requires at least two elements[pointer constructor]");
    double v25 = *v23;
    double v26 = v23[v19];
  }
  BOOL v34 = v25 > v26;
  if (v12 == v13) {
    return dataTable<double>::getValue(v36, 1, **(double **)(a1 + 24));
  }
  dataTable<double>::getValue(v36, 1, **(double **)(a1 + 24));
  v41[0] = v28;
  dataTable<double>::getValue(v33, 1, **(double **)(a1 + 24));
  v41[1] = v29;
  double v39 = v5[v12];
  double v40 = v5[v13];
  v30[0] = (uint64_t)&v39;
  v30[1] = 2;
  BOOL v31 = v39 > v40;
  long long v32 = v41;
  return dataTable<double>::getValue(v30, 1, **(double **)(a1 + 16));
}

void ACAM::init(ACAM *a1, double *a2)
{
}

void sub_248B57034(_Unwind_Exception *a1)
{
  if (SLOBYTE(STACK[0x76F]) < 0) {
    operator delete((void *)STACK[0x758]);
  }
  ACAMPersistentStates::~ACAMPersistentStates((ACAMPersistentStates *)&STACK[0x7C0]);
  _Unwind_Resume(a1);
}

void simpleList<ACAMPersistentStates>::append(uint64_t a1)
{
}

void ACAMPersistentStates::~ACAMPersistentStates(ACAMPersistentStates *this)
{
  double v2 = (void *)((char *)this + 760);
  uint64_t v3 = *((void *)this + 95);
  if (v3)
  {
    do
    {
      uint64_t v4 = *(void *)(v3 + 40);
      MEMORY[0x24C58C0C0]();
      uint64_t v3 = v4;
    }
    while (v4);
  }
  *double v2 = 0;
  v2[1] = 0;
  v2[2] = 0;
  if (*((char *)this + 759) < 0) {
    operator delete(*((void **)this + 92));
  }
  if (*((char *)this + 719) < 0) {
    operator delete(*((void **)this + 87));
  }
}

void simpleList<ACAMBatteryState>::append(uint64_t a1)
{
}

uint64_t simpleList<ACAMBatteryState>::remove(uint64_t *a1, uint64_t a2)
{
  uint64_t result = simpleList<ACAMBatteryState>::get(a1, a2);
  if (result)
  {
    uint64_t v5 = *(void *)(result + 40);
    uint64_t v4 = *(void *)(result + 48);
    if (v4) {
      *(void *)(v4 + 40) = v5;
    }
    if (v5) {
      *(void *)(v5 + 48) = v4;
    }
    if (result == *a1) {
      *a1 = v5;
    }
    if (result == a1[1]) {
      a1[1] = v4;
    }
    uint64_t result = MEMORY[0x24C58C0C0]();
    --a1[2];
  }
  return result;
}

void ACAM::updateDynamicConfiguration(double *a1, double a2, uint64_t a3, int a4, uint64_t a5)
{
  double v6 = a1 + 879;
  if (!a4) {
    double v6 = a1 + 878;
  }
  double v7 = *v6;
  *(double *)(a5 + 8) = a2;
  double v8 = a1[856] * a1[3590];
  double v9 = a1[857] * a1[3585];
  double v10 = a1[858] * a1[3591];
  double v11 = 0.0;
  ACAMAgingUpdator::getSOCTop((ACAMAgingUpdator *)(a1 + 3520), v8, v9, v10, a2 - v7, &v11);
}

uint64_t simpleList<ACAMBatteryState>::get(uint64_t *a1, uint64_t a2)
{
  uint64_t result = 0;
  uint64_t v4 = a1[2];
  if (v4 > a2 && -v4 <= a2)
  {
    if (a2 < 0)
    {
      uint64_t result = a1[1];
      if (a2 != -1)
      {
        uint64_t v7 = -2;
        if (a2 > -2) {
          uint64_t v7 = a2;
        }
        uint64_t v8 = v7 - a2 + 1;
        do
        {
          uint64_t result = *(void *)(result + 48);
          --v8;
        }
        while (v8);
      }
    }
    else
    {
      uint64_t result = *a1;
      if (a2)
      {
        unint64_t v6 = a2 + 1;
        do
        {
          uint64_t result = *(void *)(result + 40);
          --v6;
        }
        while (v6 > 1);
      }
    }
  }
  return result;
}

uint64_t ACAM::expandBatteryStates(uint64_t result, uint64_t a2, uint64_t a3, double a4, double a5)
{
  return result;
}

__n128 ACAM::runOneStep(uint64_t a1, uint64_t a2)
{
  if (!ACAMStatus::skipAlgoRunning((ACAMStatus *)(a1 + 28952)))
  {
    uint64_t v11 = *(void *)(a2 + 32);
    double v12 = *(double *)(a2 + 24) - *(double *)(a1 + 28936);
    uint64_t v13 = *(void *)(a2 + 16);
    *(_OWORD *)(a1 + 28192) = *(_OWORD *)a2;
    *(void *)(a1 + 28208) = v13;
    *(double *)(a1 + 28216) = v12;
    *(void *)(a1 + 28224) = v11;
    ACAMPerformanceModel::runOneStep((uint64_t **)(a1 + 28136), (double *)(a1 + 28192), a1 + 28760, a1 + 28312);
    unint64_t v14 = (double *)(a1 + 28416);
    if (*(double *)(a1 + 28424) == 0.0 && *v14 == 0.0)
    {
      long long v15 = *(_OWORD *)(a1 + 28392);
      *(_OWORD *)(a1 + 28480) = *(_OWORD *)(a1 + 28376);
      *(_OWORD *)(a1 + 28496) = v15;
      *(void *)(a1 + 28512) = *(void *)(a1 + 28408);
      long long v16 = *(_OWORD *)(a1 + 28328);
      *(_OWORD *)unint64_t v14 = *(_OWORD *)(a1 + 28312);
      *(_OWORD *)(a1 + 28432) = v16;
      long long v17 = *(_OWORD *)(a1 + 28360);
      *(_OWORD *)(a1 + 28448) = *(_OWORD *)(a1 + 28344);
      *(_OWORD *)(a1 + 28464) = v17;
    }
    ACAMAgingModel::runOneStep();
  }
  *(_OWORD *)(a1 + 28272) = *(_OWORD *)(a1 + 28232);
  *(_OWORD *)(a1 + 28288) = *(_OWORD *)(a1 + 28248);
  long long v4 = *(_OWORD *)(a1 + 28464);
  long long v5 = *(_OWORD *)(a1 + 28496);
  *(_OWORD *)(a1 + 28584) = *(_OWORD *)(a1 + 28480);
  *(_OWORD *)(a1 + 28600) = v5;
  long long v6 = *(_OWORD *)(a1 + 28432);
  *(_OWORD *)(a1 + 28520) = *(_OWORD *)(a1 + 28416);
  *(_OWORD *)(a1 + 28536) = v6;
  *(_OWORD *)(a1 + 28552) = *(_OWORD *)(a1 + 28448);
  *(_OWORD *)(a1 + 28568) = v4;
  *(_OWORD *)(a1 + 28248) = *(_OWORD *)(a1 + 28208);
  *(_OWORD *)(a1 + 28232) = *(_OWORD *)(a1 + 28192);
  long long v7 = *(_OWORD *)(a1 + 28312);
  *(_OWORD *)(a1 + 28432) = *(_OWORD *)(a1 + 28328);
  long long v8 = *(_OWORD *)(a1 + 28376);
  *(_OWORD *)(a1 + 28496) = *(_OWORD *)(a1 + 28392);
  *(_OWORD *)(a1 + 28480) = v8;
  long long v10 = *(_OWORD *)(a1 + 28344);
  __n128 result = *(__n128 *)(a1 + 28360);
  *(__n128 *)(a1 + 28464) = result;
  *(_OWORD *)(a1 + 28448) = v10;
  *(void *)(a1 + 28304) = *(void *)(a1 + 28264);
  *(void *)(a1 + 28616) = *(void *)(a1 + 28512);
  *(void *)(a1 + 28264) = *(void *)(a1 + 28224);
  *(void *)(a1 + 28512) = *(void *)(a1 + 28408);
  *(_OWORD *)(a1 + 28416) = v7;
  return result;
}

__n128 ACAM::updateStates(ACAM *this)
{
  *((_OWORD *)this + 1767) = *(_OWORD *)((char *)this + 28232);
  *((_OWORD *)this + 1768) = *(_OWORD *)((char *)this + 28248);
  long long v1 = *((_OWORD *)this + 1779);
  long long v2 = *((_OWORD *)this + 1781);
  *(_OWORD *)((char *)this + 28584) = *((_OWORD *)this + 1780);
  *(_OWORD *)((char *)this + 28600) = v2;
  long long v3 = *((_OWORD *)this + 1777);
  *(_OWORD *)((char *)this + 28520) = *((_OWORD *)this + 1776);
  *(_OWORD *)((char *)this + 28536) = v3;
  *(_OWORD *)((char *)this + 28552) = *((_OWORD *)this + 1778);
  *(_OWORD *)((char *)this + 28568) = v1;
  *(_OWORD *)((char *)this + 28248) = *((_OWORD *)this + 1763);
  *(_OWORD *)((char *)this + 28232) = *((_OWORD *)this + 1762);
  long long v4 = *(_OWORD *)((char *)this + 28312);
  *((_OWORD *)this + 1777) = *(_OWORD *)((char *)this + 28328);
  long long v5 = *(_OWORD *)((char *)this + 28376);
  *((_OWORD *)this + 1781) = *(_OWORD *)((char *)this + 28392);
  *((_OWORD *)this + 1780) = v5;
  long long v7 = *(_OWORD *)((char *)this + 28344);
  __n128 result = *(__n128 *)((char *)this + 28360);
  *((__n128 *)this + 1779) = result;
  *((_OWORD *)this + 1778) = v7;
  *((void *)this + 3538) = *((void *)this + 3533);
  *((void *)this + 3577) = *((void *)this + 3564);
  *((void *)this + 3533) = *((void *)this + 3528);
  *((void *)this + 3564) = *((void *)this + 3551);
  *((_OWORD *)this + 1776) = v4;
  return result;
}

unsigned char *ACAM::runOnce(unsigned char *result, uint64_t a2, uint64_t a3)
{
  long long v3 = result;
  if (!*result)
  {
    __n128 result = (unsigned char *)printf("Not yet initialized");
    if (!a3) {
      return result;
    }
LABEL_5:
    simpleList<ACAMBatteryState>::append((uint64_t)(v3 + 29096));
  }
  if (a3) {
    goto LABEL_5;
  }
  return result;
}

void sub_248B58054(_Unwind_Exception *a1)
{
  if (SLOBYTE(STACK[0x43F]) < 0) {
    operator delete((void *)STACK[0x428]);
  }
  ACAMPersistentStates::~ACAMPersistentStates((ACAMPersistentStates *)&STACK[0x490]);
  _Unwind_Resume(a1);
}

uint64_t ACAM::recordStatistics(uint64_t this)
{
  double v1 = *(double *)(this + 28224) - *(double *)(this + 28264);
  uint64_t v2 = -48;
  while (1)
  {
    uint64_t v3 = this + v2;
    if (v2 == -8) {
      double v4 = INFINITY;
    }
    else {
      double v4 = *(double *)(v3 + 7224);
    }
    double v5 = *(double *)(v3 + 7216);
    if (v5 == v4)
    {
      if (v1 == v5) {
        goto LABEL_22;
      }
      goto LABEL_20;
    }
    if (v4 <= v5) {
      break;
    }
    if (v1 >= v5 && v1 < v4) {
      goto LABEL_22;
    }
LABEL_20:
    v2 += 8;
    if (!v2) {
      return this;
    }
  }
  if (v1 >= v5 || v1 < v4) {
    goto LABEL_20;
  }
LABEL_22:
  ++*(void *)(this + v2 + 29096);
  return this;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  double v5 = this;
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
    long long v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    double v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26524ED40, MEMORY[0x263F8C060]);
}

void sub_248B58290(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

uint64_t ACAMStatus::computeAlgoStatus(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (!*(unsigned char *)a2) {
    return 2;
  }
  uint64_t v5 = *(unsigned __int8 *)(a1 + 95);
  int v6 = *(unsigned __int8 *)(a1 + 95);
  size_t v7 = *(void *)(a1 + 80);
  if ((v5 & 0x80u) == 0) {
    uint64_t v8 = *(unsigned __int8 *)(a1 + 95);
  }
  else {
    uint64_t v8 = *(void *)(a1 + 80);
  }
  uint64_t v9 = *(unsigned __int8 *)(a2 + 71);
  int v10 = (char)v9;
  if ((v9 & 0x80u) != 0) {
    uint64_t v9 = *(void *)(a2 + 56);
  }
  if (v8 != v9)
  {
LABEL_17:
    if ((v6 & 0x80) == 0)
    {
      if (!*(unsigned char *)(a1 + 95)) {
        return 0;
      }
      goto LABEL_22;
    }
LABEL_21:
    if (!v7) {
      return 0;
    }
LABEL_22:
    *(unsigned char *)(a1 + 25) = 1;
    std::string::operator=((std::string *)(a1 + 32), *(unsigned char *)(a1 + 56));
    return 0;
  }
  double v12 = (const void **)(a1 + 72);
  if (v10 >= 0) {
    uint64_t v13 = (unsigned __int8 *)(a2 + 48);
  }
  else {
    uint64_t v13 = *(unsigned __int8 **)(a2 + 48);
  }
  if ((v6 & 0x80) != 0)
  {
    if (memcmp(*v12, v13, v7)) {
      goto LABEL_21;
    }
  }
  else if (*(unsigned char *)(a1 + 95))
  {
    while (*(unsigned __int8 *)v12 == *v13)
    {
      double v12 = (const void **)((char *)v12 + 1);
      ++v13;
      if (!--v5) {
        goto LABEL_23;
      }
    }
    goto LABEL_17;
  }
LABEL_23:
  uint64_t v15 = *(void *)(a1 + 64);
  if (v15) {
    BOOL v16 = v15 == *(void *)(a2 + 40);
  }
  else {
    BOOL v16 = 0;
  }
  if (!v16 || a3[1] != 0 || *a3 != 0) {
    return 0;
  }
  if ((v6 & 0x80) != 0)
  {
    if (!v7) {
      return 0xFFFFFFFFLL;
    }
  }
  else if (!v6)
  {
    return 0xFFFFFFFFLL;
  }
  if (*(void *)(a1 + 56) > *(void *)(a2 + 32)) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t ACAMStatus::setAlgoStatusBuffer(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = ACAMStatus::computeAlgoStatus(a1, a2, a3);
  int v7 = result;
  *(_DWORD *)(a1 + 4) = result;
  int v8 = *(_DWORD *)a1;
  if (!(*(_DWORD *)a1 | result))
  {
    int v9 = 256;
    goto LABEL_23;
  }
  if (!v8)
  {
    if (result == 2) {
      int v9 = 1536;
    }
    else {
      int v9 = 3584;
    }
    BOOL v10 = result == 1;
    int v11 = 512;
    goto LABEL_12;
  }
  if (v8 == 2)
  {
    if (!result)
    {
      int v9 = 1792;
      goto LABEL_23;
    }
    if (result == 2)
    {
      int v9 = 2048;
      goto LABEL_23;
    }
LABEL_21:
    int v9 = 3584;
    goto LABEL_23;
  }
  if (v8 != 1) {
    goto LABEL_21;
  }
  if (result == 1)
  {
    int v9 = 768;
    goto LABEL_23;
  }
  if (result)
  {
    if (result == 2)
    {
      int v9 = 1536;
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a2 + 40);
  if (v12 | v13 && v12 != v13)
  {
    int v9 = 1024;
    goto LABEL_23;
  }
  uint64_t v14 = *(unsigned __int8 *)(a1 + 95);
  if ((v14 & 0x80u) == 0) {
    uint64_t v15 = *(unsigned __int8 *)(a1 + 95);
  }
  else {
    uint64_t v15 = *(void *)(a1 + 80);
  }
  uint64_t v16 = *(unsigned __int8 *)(a2 + 71);
  int v17 = (char)v16;
  if ((v16 & 0x80u) != 0) {
    uint64_t v16 = *(void *)(a2 + 56);
  }
  if (v15 != v16) {
    goto LABEL_45;
  }
  double v18 = (const void **)(a1 + 72);
  if (v17 >= 0) {
    unint64_t v19 = (unsigned __int8 *)(a2 + 48);
  }
  else {
    unint64_t v19 = *(unsigned __int8 **)(a2 + 48);
  }
  if ((v14 & 0x80) != 0)
  {
    uint64_t result = memcmp(*v18, v19, *(void *)(a1 + 80));
    if (result)
    {
LABEL_45:
      int v9 = 1280;
      goto LABEL_23;
    }
  }
  else if (*(unsigned char *)(a1 + 95))
  {
    while (*(unsigned __int8 *)v18 == *v19)
    {
      double v18 = (const void **)((char *)v18 + 1);
      ++v19;
      if (!--v14) {
        goto LABEL_46;
      }
    }
    goto LABEL_45;
  }
LABEL_46:
  if (*a3)
  {
    int v9 = 2304;
    goto LABEL_23;
  }
  BOOL v10 = a3[1] == 0;
  int v9 = 2560;
  int v11 = 3840;
LABEL_12:
  if (v10) {
    int v9 = v11;
  }
LABEL_23:
  if ((*(_DWORD *)(a1 + 12) & 0xF00) != v9)
  {
    *(_DWORD *)(a1 + 12) = (16 * *(_DWORD *)(a1 + 12)) & 0xFFFFF000 | *(_DWORD *)(a1 + 12) | v9;
    *(_DWORD *)a1 = v7;
    *(_WORD *)(a1 + 24) = *(_WORD *)a2;
    std::string::operator=((std::string *)(a1 + 32), (const std::string *)(a2 + 8));
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 32);
    return (uint64_t)std::string::operator=((std::string *)(a1 + 72), (const std::string *)(a2 + 48));
  }
  return result;
}

uint64_t ACAMStatus::setDataErrorStatus(uint64_t result, uint64_t a2, double *a3, double *a4, double *a5, double *a6)
{
  double v6 = a3[4] - *(double *)(a2 + 32);
  double v7 = *a5;
  if (v6 >= 0.0) {
    int v8 = (v6 > *a5) << 7;
  }
  else {
    int v8 = ((v6 > *a5) << 7) | 0x40;
  }
  *(_DWORD *)(result + 8) = 0;
  if (v6 > v7 || v6 < 0.0) {
    *(_DWORD *)(result + 8) = v8;
  }
  double v9 = *a3;
  if (*a3 < a5[2])
  {
    v8 |= 0x20u;
    *(_DWORD *)(result + 8) = v8;
  }
  if (v9 > a5[1])
  {
    v8 |= 0x10u;
    *(_DWORD *)(result + 8) = v8;
  }
  double v10 = a3[1];
  double v11 = a5[3];
  if (v10 > v11 * *a6 || v10 < *a6 * a5[4])
  {
    v8 |= 8u;
    *(_DWORD *)(result + 8) = v8;
  }
  if (v6 > 0.0 && fabs((a3[3] - *(double *)(a2 + 24)) / (v6 / 3600.0)) > fmax(fabs(v11), fabs(a5[4])))
  {
    v8 |= 8u;
    *(_DWORD *)(result + 8) = v8;
  }
  double v12 = a3[2];
  BOOL v13 = v12 > a5[5];
  if (v12 < a5[6]) {
    BOOL v13 = 1;
  }
  if (v13) {
    v8 |= 4u;
  }
  if (v6 > 31536000.0) {
    v8 |= 2u;
  }
  if (v13 || v6 > 31536000.0) {
    *(_DWORD *)(result + 8) = v8;
  }
  if (a4[12] < a5[7] || a4[7] < a5[8] || a4[13] < a5[9])
  {
    v8 |= 1u;
    *(_DWORD *)(result + 8) = v8;
  }
  *(_DWORD *)(result + 12) |= v8;
  return result;
}

uint64_t ACAMStatus::setInitType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 16) = a2;
  return result;
}

uint64_t ACAMStatus::setFreshInitReason(uint64_t result, int a2)
{
  *(_DWORD *)(result + 20) = a2;
  return result;
}

BOOL ACAMStatus::skipAlgoRunning(ACAMStatus *this)
{
  return (*((unsigned char *)this + 8) & 0x7F) != 0;
}

BOOL ACAMStatus::interpolationRequired(ACAMStatus *this)
{
  return *((unsigned __int8 *)this + 8) == 128;
}

BOOL ACAMStatus::initializationRequired(ACAMStatus *this)
{
  return *((_DWORD *)this + 1) == 0;
}

void ACAMPerformanceModelParameter::_assignMemory()
{
}

void *ACAMPerformanceModelParameter::_assignMemory(uint64_t *a1, uint64_t a2, int a3)
{
  uint64_t v4 = *a1;
  uint64_t result = a1 + 1;
  uint64_t v5 = result[a3];
  double v6 = (double *)(v4 + 8 * v5);
  unint64_t v7 = (unint64_t)(result[a3 + 1] - v5) >> 1;
  int v8 = &v6[v7];
  BOOL v9 = *v6 <= *(v8 - 1);
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v7;
  char v10 = !v9;
  *(unsigned char *)(a2 + 16) = v10;
  *(void *)(a2 + 24) = v8;
  return result;
}

{
  void *result;
  uint64_t v4;
  uint64_t v5;
  double *v6;
  uint64_t v7;

  uint64_t v4 = *a1;
  uint64_t result = a1 + 1;
  uint64_t v5 = result[a3];
  double v6 = (double *)(v4 + 8 * v5);
  unint64_t v7 = result[a3 + 1] - v5;
  LOBYTE(v5) = *v6 > v6[v7 - 1];
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = v5;
  return result;
}

void ACAMPerformanceModelParameter::_assignAddress(ACAMPerformanceModelParameter *this)
{
  uint64_t v1 = *(void *)this;
  uint64_t v2 = *((void *)this + 1);
  uint64_t v3 = (double *)(*(void *)this + 8 * v2);
  uint64_t v4 = *((void *)this + 2);
  uint64_t v5 = *((void *)this + 3);
  unint64_t v6 = (unint64_t)(v4 - v2) >> 1;
  unint64_t v7 = &v3[v6];
  BOOL v8 = *v3 > *(v7 - 1);
  *((void *)this + 13) = v3;
  *((void *)this + 14) = v6;
  *((unsigned char *)this + 120) = v8;
  BOOL v9 = (double *)(v1 + 8 * v4);
  unint64_t v10 = (unint64_t)(v5 - v4) >> 1;
  double v11 = &v9[v10];
  BOOL v12 = *v9 > *(v11 - 1);
  *((void *)this + 16) = v7;
  *((void *)this + 17) = v9;
  *((void *)this + 18) = v10;
  *((unsigned char *)this + 152) = v12;
  BOOL v13 = (double *)(v1 + 8 * v5);
  uint64_t v14 = *((void *)this + 4);
  uint64_t v15 = *((void *)this + 5);
  uint64_t v16 = v14 - v5;
  LOBYTE(v5) = *v13 > v13[v14 - v5 - 1];
  *((void *)this + 20) = v11;
  *((void *)this + 21) = v13;
  *((void *)this + 22) = v16;
  *((unsigned char *)this + 184) = v5;
  int v17 = (double *)(v1 + 8 * v14);
  uint64_t v18 = v15 - v14;
  LOBYTE(v14) = *v17 > v17[v15 - v14 - 1];
  *((void *)this + 24) = v17;
  *((void *)this + 25) = v18;
  *((unsigned char *)this + 208) = v14;
  unint64_t v19 = (double *)(v1 + 8 * v15);
  uint64_t v20 = *((void *)this + 6) - v15;
  LOBYTE(v14) = *v19 > v19[v20 - 1];
  *((void *)this + 27) = v19;
  *((void *)this + 28) = v20;
  *((unsigned char *)this + 232) = v14;
  uint64_t v21 = *((void *)this + 10);
  uint64_t v22 = *((void *)this + 11);
  double v23 = (double *)(v1 + 8 * v21);
  unint64_t v24 = (unint64_t)(v22 - v21) >> 1;
  double v25 = &v23[v24];
  LOBYTE(v15) = *v23 > *(v25 - 1);
  *((void *)this + 34) = v23;
  *((void *)this + 35) = v24;
  *((unsigned char *)this + 288) = v15;
  double v26 = (double *)(v1 + 8 * v22);
  unint64_t v27 = (unint64_t)(*((void *)this + 12) - v22) >> 1;
  uint64_t v28 = &v26[v27];
  LOBYTE(v23) = *v26 > *(v28 - 1);
  *((void *)this + 37) = v25;
  *((void *)this + 38) = v26;
  *((void *)this + 39) = v27;
  *((unsigned char *)this + 320) = (_BYTE)v23;
  *((void *)this + 41) = v28;
  ACAMPerformanceModelParameter::_assignMemory();
}

void *ACAMPerformanceModelParameter::_deepCopyFrom(uint64_t a1, uint64_t a2)
{
  memcpy(*(void **)(a1 + 104), *(const void **)(a2 + 104), 8 * *(void *)(a2 + 112));
  memcpy(*(void **)(a1 + 128), *(const void **)(a2 + 128), 8 * *(void *)(a2 + 112));
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  memcpy(*(void **)(a1 + 136), *(const void **)(a2 + 136), 8 * *(void *)(a2 + 144));
  memcpy(*(void **)(a1 + 160), *(const void **)(a2 + 160), 8 * *(void *)(a2 + 144));
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  memcpy(*(void **)(a1 + 168), *(const void **)(a2 + 168), 8 * *(void *)(a2 + 176));
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  memcpy(*(void **)(a1 + 192), *(const void **)(a2 + 192), 8 * *(void *)(a2 + 200));
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  memcpy(*(void **)(a1 + 216), *(const void **)(a2 + 216), 8 * *(void *)(a2 + 224));
  uint64_t v4 = *(void *)(a2 + 224);
  *(void *)(a1 + 224) = v4;
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  uint64_t v5 = *(void *)(a1 + 176);
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)(a1 + 200);
    do
    {
      if (v7)
      {
        uint64_t v8 = 16;
        uint64_t v9 = v7;
        do
        {
          uint64_t v10 = *(void *)(*(void *)(a1 + 240) + 8 * v6) + v8;
          uint64_t v11 = *(void *)(*(void *)(a2 + 240) + 8 * v6) + v8;
          memcpy(*(void **)(v10 - 16), *(const void **)(v11 - 16), 8 * *(void *)(v11 - 8));
          memcpy(*(void **)(v10 + 8), *(const void **)(v11 + 8), 8 * *(void *)(v11 - 8));
          *(void *)(v10 - 8) = *(void *)(v11 - 8);
          *(unsigned char *)uint64_t v10 = *(unsigned char *)v11;
          uint64_t v12 = *(void *)(*(void *)(a1 + 248) + 8 * v6) + v8;
          uint64_t v13 = *(void *)(*(void *)(a2 + 248) + 8 * v6) + v8;
          memcpy(*(void **)(v12 - 16), *(const void **)(v13 - 16), 8 * *(void *)(v13 - 8));
          memcpy(*(void **)(v12 + 8), *(const void **)(v13 + 8), 8 * *(void *)(v13 - 8));
          *(void *)(v12 - 8) = *(void *)(v13 - 8);
          *(unsigned char *)uint64_t v12 = *(unsigned char *)v13;
          v8 += 32;
          --v9;
        }
        while (v9);
      }
      if (v4)
      {
        uint64_t v14 = 16;
        uint64_t v15 = v4;
        do
        {
          uint64_t v16 = *(void *)(*(void *)(a1 + 256) + 8 * v6) + v14;
          uint64_t v17 = *(void *)(*(void *)(a2 + 256) + 8 * v6) + v14;
          memcpy(*(void **)(v16 - 16), *(const void **)(v17 - 16), 8 * *(void *)(v17 - 8));
          memcpy(*(void **)(v16 + 8), *(const void **)(v17 + 8), 8 * *(void *)(v17 - 8));
          *(void *)(v16 - 8) = *(void *)(v17 - 8);
          *(unsigned char *)uint64_t v16 = *(unsigned char *)v17;
          uint64_t v18 = *(void *)(*(void *)(a1 + 264) + 8 * v6) + v14;
          uint64_t v19 = *(void *)(*(void *)(a2 + 264) + 8 * v6) + v14;
          memcpy(*(void **)(v18 - 16), *(const void **)(v19 - 16), 8 * *(void *)(v19 - 8));
          memcpy(*(void **)(v18 + 8), *(const void **)(v19 + 8), 8 * *(void *)(v19 - 8));
          *(void *)(v18 - 8) = *(void *)(v19 - 8);
          *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
          v14 += 32;
          --v15;
        }
        while (v15);
      }
      ++v6;
    }
    while (v6 != v5);
  }
  memcpy(*(void **)(a1 + 272), *(const void **)(a2 + 272), 8 * *(void *)(a2 + 280));
  memcpy(*(void **)(a1 + 296), *(const void **)(a2 + 296), 8 * *(void *)(a2 + 280));
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  *(unsigned char *)(a1 + 288) = *(unsigned char *)(a2 + 288);
  memcpy(*(void **)(a1 + 304), *(const void **)(a2 + 304), 8 * *(void *)(a2 + 312));
  uint64_t result = memcpy(*(void **)(a1 + 328), *(const void **)(a2 + 328), 8 * *(void *)(a2 + 312));
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  *(unsigned char *)(a1 + 320) = *(unsigned char *)(a2 + 320);
  return result;
}

void ACAMPerformanceModelParameter::ACAMPerformanceModelParameter(ACAMPerformanceModelParameter *this, ACAMPerformanceModelParameter *a2)
{
  *(void *)this = 0;
  *((void *)this + 13) = 0;
  *((void *)this + 14) = 0;
  *((unsigned char *)this + 120) = 0;
  *((void *)this + 24) = 0;
  *((void *)this + 25) = 0;
  *((unsigned char *)this + 208) = 0;
  *((void *)this + 27) = 0;
  *((void *)this + 28) = 0;
  *((unsigned char *)this + 232) = 0;
  *((void *)this + 34) = 0;
  *((void *)this + 35) = 0;
  *((unsigned char *)this + 288) = 0;
  *((void *)this + 41) = 0;
  *((void *)this + 17) = 0;
  *((void *)this + 18) = 0;
  *((void *)this + 16) = 0;
  *((unsigned char *)this + 152) = 0;
  *((void *)this + 20) = 0;
  *((void *)this + 21) = 0;
  *((unsigned char *)this + 184) = 0;
  *((void *)this + 22) = 0;
  *((void *)this + 38) = 0;
  *((void *)this + 39) = 0;
  *((void *)this + 37) = 0;
  *((unsigned char *)this + 320) = 0;
  long long v2 = *(_OWORD *)((char *)a2 + 8);
  *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)this + 8) = v2;
  long long v3 = *(_OWORD *)((char *)a2 + 40);
  long long v4 = *(_OWORD *)((char *)a2 + 56);
  long long v5 = *(_OWORD *)((char *)a2 + 72);
  *(_OWORD *)((char *)this + 88) = *(_OWORD *)((char *)a2 + 88);
  *(_OWORD *)((char *)this + 72) = v5;
  *(_OWORD *)((char *)this + 56) = v4;
  *(_OWORD *)((char *)this + 40) = v3;
  operator new[]();
}

uint64_t ACAMPerformanceModelParameter::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    if (memcmp((const void *)(a1 + 8), (const void *)(a2 + 8), 0x60uLL)) {
      puts("_fieldOffset does not match");
    }
    ACAMPerformanceModelParameter::_deepCopyFrom(a1, a2);
  }
  return a1;
}

void ACAMPerformanceModelParameter::~ACAMPerformanceModelParameter(ACAMPerformanceModelParameter *this)
{
  uint64_t v2 = *((void *)this + 22);
  if (v2)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      uint64_t v4 = *(void *)(*((void *)this + 30) + 8 * i);
      if (v4) {
        MEMORY[0x24C58C0A0](v4 - 16, 0x10C0C803734C2A0);
      }
      uint64_t v5 = *(void *)(*((void *)this + 31) + 8 * i);
      if (v5) {
        MEMORY[0x24C58C0A0](v5 - 16, 0x10C0C803734C2A0);
      }
      uint64_t v6 = *(void *)(*((void *)this + 32) + 8 * i);
      if (v6) {
        MEMORY[0x24C58C0A0](v6 - 16, 0x10C0C803734C2A0);
      }
      uint64_t v7 = *(void *)(*((void *)this + 33) + 8 * i);
      if (v7) {
        MEMORY[0x24C58C0A0](v7 - 16, 0x10C0C803734C2A0);
      }
    }
  }
  uint64_t v8 = *((void *)this + 30);
  if (v8) {
    MEMORY[0x24C58C0A0](v8, 0x20C8093837F09);
  }
  uint64_t v9 = *((void *)this + 31);
  if (v9) {
    MEMORY[0x24C58C0A0](v9, 0x20C8093837F09);
  }
  uint64_t v10 = *((void *)this + 32);
  if (v10) {
    MEMORY[0x24C58C0A0](v10, 0x20C8093837F09);
  }
  uint64_t v11 = *((void *)this + 33);
  if (v11) {
    MEMORY[0x24C58C0A0](v11, 0x20C8093837F09);
  }
  if (*(void *)this) {
    MEMORY[0x24C58C0A0](*(void *)this, 0x1000C8000313F17);
  }
}

void *ACAMPerformanceModel::ACAMPerformanceModel(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *uint64_t result = a2;
  result[1] = a3;
  result[2] = a4;
  return result;
}

{
  *uint64_t result = a2;
  result[1] = a3;
  result[2] = a4;
  return result;
}

double ACAMPerformanceModel::runOneStep(uint64_t **a1, double *a2, uint64_t a3, uint64_t a4)
{
  double v8 = *(double *)a3;
  double v9 = *(double *)(a3 + 8);
  double v10 = *(double *)a3 + a2[3] * (v9 - *(double *)a3);
  if (v10 >= *(double *)a3) {
    double v8 = *(double *)a3 + a2[3] * (v9 - *(double *)a3);
  }
  if (v10 <= v9) {
    double v11 = v8;
  }
  else {
    double v11 = *(double *)(a3 + 8);
  }
  *(double *)a4 = v11;
  double v12 = *(double *)(a3 + 16);
  double v13 = *(double *)(a3 + 24);
  double v14 = v12 + a2[3] * (v13 - v12);
  if (v14 >= v13) {
    double v13 = v12 + a2[3] * (v13 - v12);
  }
  if (v14 <= v12) {
    double v15 = v13;
  }
  else {
    double v15 = *(double *)(a3 + 16);
  }
  *(double *)(a4 + 8) = v15;
  dataTable<double>::getValue(*a1 + 13, 1, v11);
  double v17 = v16;
  dataTable<double>::getValue(*a1 + 17, 1, *(double *)(a4 + 8));
  double v19 = v18;
  dataTable<double>::getValueArrhenius(*a1 + 34, 1, a2[2], 273.15);
  *(void *)(a4 + 64) = v20;
  dataTable<double>::getValueArrhenius(*a1 + 38, 1, a2[2], 273.15);
  *(void *)&long long v22 = v21;
  *(void *)(a4 + 56) = v21;
  double v23 = a2[1];
  double v24 = v23 / *(double *)(a3 + 32);
  *(double *)(a4 + 48) = v24;
  if (*((unsigned char *)a1[2] + 560))
  {
    if (v23 <= 0.0)
    {
      long long v22 = *(_OWORD *)(a4 + 64);
      float64x2_t v25 = *(float64x2_t *)(a3 + 56);
    }
    else
    {
      float64x2_t v25 = *(float64x2_t *)(a3 + 40);
    }
    float64x2_t v26 = vmulq_n_f64(v25, *(double *)&v22);
  }
  else
  {
    float64x2_t v26 = 0uLL;
  }
  float64x2_t v38 = v26;
  BOOL v27 = v23 > 0.0;
  double v41 = 0.0;
  double v42 = 0.0;
  double v39 = 0.0;
  double v40 = 0.0;
  ACAMPerformanceModel::getResistance(a1, 1, &v42, v24, a2[2], *(double *)(a4 + 8));
  ACAMPerformanceModel::getResistance(a1, 0, &v41, *(double *)(a4 + 48), a2[2], *(double *)a4);
  double v28 = dbl_248B6AAA0[v27];
  ACAMPerformanceModel::getResistance(a1, 1, &v40, v28, a2[2], *(double *)(a4 + 8));
  ACAMPerformanceModel::getResistance(a1, 0, &v39, v28, a2[2], *(double *)a4);
  double v29 = a2[1];
  double v30 = v42;
  double v31 = v38.f64[0] / v40;
  double v32 = v19 + v29 * v42 * (v38.f64[0] / v40 + 1.0);
  double v33 = v41;
  double v34 = v38.f64[1] / v39;
  uint64_t v35 = (double *)a1[2];
  *(double *)(a4 + 32) = fmin(fmax(v17 + -(v29 * v41) * (v38.f64[1] / v39 + 1.0), 0.0), v35[73]);
  *(double *)(a4 + 40) = fmax(fmin(v32, v35[2] + v35[71]), v35[72]);
  if (*(double *)(a4 + 24) < 0.0 || v29 * a2[6] <= 0.0 || fabs(v29) < v35[1]) {
    *(_OWORD *)(a4 + 16) = *(_OWORD *)a4;
  }
  double v36 = v30 * v31;
  *(double *)(a4 + 72) = v36;
  *(double *)(a4 + 80) = v33 * v34;
  double result = v30 + v36;
  *(double *)(a4 + 88) = result;
  *(double *)(a4 + 96) = v33 + v33 * v34;
  return result;
}

void ACAMPerformanceModel::convertSocToX(ACAMPerformanceModel *this, double a2, double a3, double a4, double *a5)
{
  double v5 = a3 + a2 * (a4 - a3);
  if (v5 >= a3) {
    a3 = v5;
  }
  if (v5 <= a4) {
    double v6 = a3;
  }
  else {
    double v6 = a4;
  }
  *a5 = v6;
}

void ACAMPerformanceModel::convertSocToY(ACAMPerformanceModel *this, double a2, double a3, double a4, double *a5)
{
  double v5 = a3 + a2 * (a4 - a3);
  if (v5 >= a4) {
    a4 = v5;
  }
  if (v5 <= a3) {
    double v6 = a4;
  }
  else {
    double v6 = a3;
  }
  *a5 = v6;
}

unint64_t ACAMPerformanceModel::convertXToOcpNeg(ACAMPerformanceModel *this, double a2, double *a3)
{
  unint64_t result = dataTable<double>::getValue((uint64_t *)(*(void *)this + 104), 1, a2);
  *(void *)a3 = v5;
  return result;
}

unint64_t ACAMPerformanceModel::convertYToOcpPos(ACAMPerformanceModel *this, double a2, double *a3)
{
  unint64_t result = dataTable<double>::getValue((uint64_t *)(*(void *)this + 136), 1, a2);
  *(void *)a3 = v5;
  return result;
}

void ACAMPerformanceModel::getResistance(uint64_t **a1, int a2, void *a3, double a4, double a5, double a6)
{
  uint64_t v68[2] = *MEMORY[0x263EF8340];
  double v12 = fabs(a4);
  unint64_t Idx = sortedUniqueArray<double>::getIdx(*a1 + 21, -1, -1, a5);
  double v14 = *a1;
  unint64_t v15 = (*a1)[22] - 1;
  if (Idx < v15) {
    unint64_t v15 = Idx;
  }
  if (v15 <= 1) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v15;
  }
  uint64_t v17 = v16 - 1;
  uint64_t v18 = 28;
  if (a4 > 0.0) {
    uint64_t v18 = 25;
  }
  uint64_t v19 = 27;
  if (a4 > 0.0) {
    uint64_t v19 = 24;
  }
  uint64_t v20 = v14[v19];
  unint64_t v21 = v14[v18];
  if (!v21)
  {
    unint64_t v22 = 0;
LABEL_23:
    if (v22) {
      unint64_t v30 = v22 - 1;
    }
    else {
      unint64_t v30 = 0;
    }
    unint64_t v23 = v22;
    goto LABEL_27;
  }
  unint64_t v22 = 0;
  unint64_t v23 = v21 - 1;
  uint64_t v24 = 29;
  if (a4 > 0.0) {
    uint64_t v24 = 26;
  }
  int v25 = LOBYTE(v14[v24]);
  do
  {
    unint64_t v26 = v21 >> 1;
    unint64_t v27 = v22 + (v21 >> 1);
    double v28 = *(double *)(v20 + 8 * v27);
    BOOL v29 = v28 > v12;
    if (!v25) {
      BOOL v29 = v28 < v12;
    }
    v21 += ~(v21 >> 1);
    if (v29) {
      unint64_t v22 = v27 + 1;
    }
    else {
      unint64_t v21 = v26;
    }
  }
  while (v21);
  unint64_t v30 = v23;
  if (v22 <= v23) {
    goto LABEL_23;
  }
LABEL_27:
  double v31 = v14 + 32;
  if (a2 == 1) {
    double v31 = v14 + 33;
  }
  double v32 = v14 + 30;
  double v33 = v14 + 31;
  if (a2 != 1) {
    double v33 = v32;
  }
  if (a4 <= 0.0) {
    double v33 = v31;
  }
  uint64_t v34 = *v33;
  uint64_t v35 = *(void *)(v34 + 8 * v16);
  double v36 = (_OWORD *)(v35 + 32 * v23);
  long long v37 = v36[1];
  v65[0] = *v36;
  v65[1] = v37;
  float64x2_t v38 = (_OWORD *)(v35 + 32 * v30);
  long long v39 = v38[1];
  v64[0] = *v38;
  v64[1] = v39;
  uint64_t v40 = *(void *)(v34 + 8 * v17);
  double v41 = (_OWORD *)(v40 + 32 * v23);
  long long v42 = v41[1];
  v63[0] = *v41;
  v63[1] = v42;
  long double v43 = (_OWORD *)(v40 + 32 * v30);
  long long v44 = v43[1];
  v62[0] = *v43;
  v62[1] = v44;
  dataTable<double>::getValue((uint64_t *)v65, 0, a6);
  double v46 = v45;
  dataTable<double>::getValue((uint64_t *)v64, 0, a6);
  double v48 = v47;
  dataTable<double>::getValue((uint64_t *)v63, 0, a6);
  double v50 = v49;
  dataTable<double>::getValue((uint64_t *)v62, 0, a6);
  if (v30 == v23)
  {
    double v52 = (v50 + v51) * 0.5;
    double v53 = (v46 + v48) * 0.5;
  }
  else
  {
    double v54 = *(double *)(v20 + 8 * v30);
    double v55 = *(double *)(v20 + 8 * v23) - v54;
    double v56 = v12 - v54;
    double v52 = v51 + (v50 - v51) * v56 / v55;
    double v53 = v48 + (v46 - v48) * v56 / v55;
  }
  uint64_t v57 = (*a1)[21];
  double v66 = *(double *)(v57 + 8 * v17);
  double v67 = *(double *)(v57 + 8 * v16);
  *(double *)v68 = v52;
  *(double *)&v68[1] = v53;
  v59[0] = (uint64_t)&v66;
  v59[1] = 2;
  BOOL v60 = v66 > v67;
  v61 = v68;
  dataTable<double>::getValueArrhenius(v59, 1, a5, 273.15);
  *a3 = v58;
}

float ACAMLogger::extractSBC(ACAMLogger *this, const ACAM *a2)
{
  return *((double *)this + 3543);
}

void ACAMLogger::Daily::getNCCp(ACAMLogger::Daily *this, const ACAM *a2, double *a3, double *a4)
{
  double v4 = *((double *)this + 3590) * *((double *)this + 856);
  double v5 = *((double *)this + 3585) * *((double *)this + 857);
  double v6 = *((double *)this + 3591) * *((double *)this + 858);
  if (*((void *)this + 913) != 2) {
    ACAMAgingUpdator::getRawNCC((double **)this + 3520, *((double *)this + 3583), v5, v4, v6, *((double *)this + 3599), *((double *)this + 911), (double *)a2);
  }
  ACAMAgingUpdator::getRawNCCVersion2((ACAMLogger::Daily *)((char *)this + 28160), v5, v4, v6, *((double *)this + 3599), *((double *)this + 911), *((double *)this + 3583), *((double *)this + 3595), *((double *)this + 3596), (double *)a2);
}

void ACAMLogger::extractDaily(ACAMLogger *this@<X0>, double *a2@<X3>, uint64_t a3@<X8>)
{
  float v4 = *((double *)this + 3590);
  *(float *)a3 = v4;
  v5.f64[0] = *((float64_t *)this + 3585);
  v5.f64[1] = *((float64_t *)this + 3591);
  *(float32x4_t *)(a3 + 4) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v5), *(float64x2_t *)((char *)this + 28760));
  uint64_t v6 = 0;
  double v7 = 0.0;
  ACAMLogger::Daily::getNCCp(this, (const ACAM *)&v6, &v7, a2);
}

void ACAMLogger::extractWeekly(ACAMLogger *this, const ACAM *a2)
{
  unint64_t v2 = 0;
  v7[101] = *(double *)MEMORY[0x263EF8340];
  int64x2_t v3 = (int64x2_t)xmmword_248B6AA50;
  uint64x2_t v4 = (uint64x2_t)vdupq_n_s64(0x65uLL);
  int64x2_t v5 = vdupq_n_s64(2uLL);
  while (1)
  {
    if (vmovn_s64((int64x2_t)vcgtq_u64(v4, (uint64x2_t)v3)).u8[0]) {
      v7[v2] = (double)v2 * 0.01;
    }
    if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x65uLL), *(uint64x2_t *)&v3)).i32[1]) {
      v7[v2 + 1] = (double)(v2 + 1) * 0.01;
    }
    v2 += 2;
    int64x2_t v3 = vaddq_s64(v3, v5);
    if (v2 == 102) {
      ACAMAgingUpdator::getOCV((ACAMLogger *)((char *)this + 28160), *((double *)this + 3590) * *((double *)this + 856), *((double *)this + 3585) * *((double *)this + 857), *((double *)this + 3591) * *((double *)this + 858), v7, 0x65uLL, v6);
    }
  }
}

uint64_t *ACAMPersistentStates::retrieve(ACAMPersistentStates *this, const ACAM *a2)
{
  long long v4 = *((_OWORD *)a2 + 1762);
  long long v5 = *((_OWORD *)a2 + 1763);
  *((void *)this + 9) = *((void *)a2 + 3528);
  *(_OWORD *)((char *)this + 56) = v5;
  *(_OWORD *)((char *)this + 40) = v4;
  long long v6 = *(_OWORD *)((char *)a2 + 28232);
  long long v7 = *(_OWORD *)((char *)a2 + 28248);
  *((void *)this + 4) = *((void *)a2 + 3533);
  *(_OWORD *)this = v6;
  *((_OWORD *)this + 1) = v7;
  long long v9 = *(_OWORD *)((char *)a2 + 28376);
  long long v8 = *(_OWORD *)((char *)a2 + 28392);
  uint64_t v10 = *((void *)a2 + 3551);
  *(_OWORD *)((char *)this + 232) = *(_OWORD *)((char *)a2 + 28360);
  *((void *)this + 35) = v10;
  *(_OWORD *)((char *)this + 264) = v8;
  *(_OWORD *)((char *)this + 248) = v9;
  long long v11 = *(_OWORD *)((char *)a2 + 28312);
  long long v12 = *(_OWORD *)((char *)a2 + 28328);
  *(_OWORD *)((char *)this + 216) = *(_OWORD *)((char *)a2 + 28344);
  *(_OWORD *)((char *)this + 200) = v12;
  *(_OWORD *)((char *)this + 184) = v11;
  long long v13 = *((_OWORD *)a2 + 1780);
  long long v14 = *((_OWORD *)a2 + 1781);
  long long v15 = *((_OWORD *)a2 + 1779);
  *((void *)this + 22) = *((void *)a2 + 3564);
  *((_OWORD *)this + 9) = v13;
  *((_OWORD *)this + 10) = v14;
  *((_OWORD *)this + 8) = v15;
  long long v16 = *((_OWORD *)a2 + 1776);
  long long v17 = *((_OWORD *)a2 + 1778);
  *((_OWORD *)this + 6) = *((_OWORD *)a2 + 1777);
  *((_OWORD *)this + 7) = v17;
  *((_OWORD *)this + 5) = v16;
  *((_OWORD *)this + 18) = *((_OWORD *)a2 + 1789);
  long long v18 = *((_OWORD *)a2 + 1790);
  long long v19 = *((_OWORD *)a2 + 1791);
  long long v20 = *((_OWORD *)a2 + 1793);
  *((_OWORD *)this + 21) = *((_OWORD *)a2 + 1792);
  *((_OWORD *)this + 22) = v20;
  *((_OWORD *)this + 19) = v18;
  *((_OWORD *)this + 20) = v19;
  long long v21 = *((_OWORD *)a2 + 1794);
  long long v22 = *((_OWORD *)a2 + 1795);
  long long v23 = *((_OWORD *)a2 + 1796);
  *((void *)this + 52) = *((void *)a2 + 3594);
  *((_OWORD *)this + 24) = v22;
  *((_OWORD *)this + 25) = v23;
  *((_OWORD *)this + 23) = v21;
  *(_OWORD *)((char *)this + 424) = *(_OWORD *)((char *)a2 + 28760);
  long long v24 = *(_OWORD *)((char *)a2 + 28776);
  long long v25 = *(_OWORD *)((char *)a2 + 28792);
  long long v26 = *(_OWORD *)((char *)a2 + 28808);
  *((void *)this + 61) = *((void *)a2 + 3603);
  *(_OWORD *)((char *)this + 456) = v25;
  *(_OWORD *)((char *)this + 472) = v26;
  *(_OWORD *)((char *)this + 440) = v24;
  long long v27 = *((_OWORD *)a2 + 1806);
  long long v28 = *((_OWORD *)a2 + 1807);
  long long v29 = *((_OWORD *)a2 + 1805);
  *((void *)this + 74) = *((void *)a2 + 3616);
  *((_OWORD *)this + 35) = v27;
  *((_OWORD *)this + 36) = v28;
  *((_OWORD *)this + 34) = v29;
  long long v30 = *((_OWORD *)a2 + 1802);
  long long v31 = *((_OWORD *)a2 + 1804);
  *((_OWORD *)this + 32) = *((_OWORD *)a2 + 1803);
  *((_OWORD *)this + 33) = v31;
  *((_OWORD *)this + 31) = v30;
  *(_OWORD *)((char *)this + 600) = *(_OWORD *)((char *)a2 + 28936);
  long long v32 = *(_OWORD *)((char *)a2 + 29048);
  long long v33 = *(_OWORD *)((char *)a2 + 29080);
  *(_OWORD *)((char *)this + 632) = *(_OWORD *)((char *)a2 + 29064);
  *(_OWORD *)((char *)this + 648) = v33;
  *(_OWORD *)((char *)this + 616) = v32;
  long long v34 = *(_OWORD *)((char *)a2 + 28952);
  *((void *)this + 85) = *((void *)a2 + 3621);
  *(_OWORD *)((char *)this + 664) = v34;
  *((_WORD *)this + 344) = *((_WORD *)a2 + 14488);
  std::string::operator=((std::string *)this + 29, (const std::string *)((char *)a2 + 28984));
  *((_OWORD *)this + 45) = *((_OWORD *)a2 + 1813);
  std::string::operator=((std::string *)((char *)this + 736), (const std::string *)((char *)a2 + 29024));
  *((unsigned char *)this + 784) = *(unsigned char *)a2;
  unint64_t result = simpleList<ACAMBatteryState>::operator=((uint64_t *)this + 95, (void *)a2 + 3637);
  *((void *)this + 99) = *((void *)a2 + 860);
  return result;
}

uint64_t *ACAMPersistentStates::restore(ACAMPersistentStates *this, ACAM *a2)
{
  return ACAM::init(a2, this);
}

char *createLogger(char *category)
{
  if (category)
  {
    category = (char *)os_log_create("com.apple.batteryalgorithms", category);
    uint64_t v1 = vars8;
  }
  return category;
}

id OnDeviceACAMUtility::createRuntimeOptions(OnDeviceACAMUtility *this)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
  if (!v1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    OnDeviceACAMUtility::createRuntimeOptions();
  }
  unint64_t v2 = [v1 objectForKey:@"batteryalgorithm"];
  int64x2_t v3 = v2;
  if (v2)
  {
    long long v4 = [v2 objectForKey:@"OnDeviceACAM"];
    if (v4)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v5 = [&unk_26FCCD7F0 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v15 != v6) {
              objc_enumerationMutation(&unk_26FCCD7F0);
            }
            uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
            long long v9 = [v4 objectForKey:v8];
            BOOL v10 = v9 == 0;

            if (v10)
            {
              long long v11 = [&unk_26FCCD7F0 objectForKeyedSubscript:v8];
              [v4 setObject:v11 forKeyedSubscript:v8];
            }
          }
          uint64_t v5 = [&unk_26FCCD7F0 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v5);
      }
      long long v12 = [NSDictionary dictionaryWithDictionary:v4];
    }
    else
    {
      long long v12 = &unk_26FCCD7F0;
    }
  }
  else
  {
    long long v12 = &unk_26FCCD7F0;
  }

  return v12;
}

void sub_248B5A328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

const char *createLogger(char *category)
{
  if (category)
  {
    category = (char *)os_log_create("com.apple.batteryalgorithms", category);
    uint64_t v1 = vars8;
  }
  return category;
}

void sub_248B5AF3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *__p,uint64_t a41,uint64_t a42,void *a43,uint64_t a44)
{
  simpleList<ACAMPersistentStates>::clear(&a35);
  if (__p)
  {
    a41 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a43)
  {
    a44 = (uint64_t)a43;
    operator delete(a43);
  }

  _Unwind_Resume(a1);
}

uint64_t ACAMSerialization::Deserialization::setSMCKeyDataFromDictionary(double *a1, double *a2, void *a3)
{
  long long v37 = a1;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v4 = [&unk_26FCCD8A8 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v41;
    double v7 = 0.0;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v41 != v6) {
          objc_enumerationMutation(&unk_26FCCD8A8);
        }
        long long v9 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        BOOL v10 = objc_msgSend(v3, "objectForKeyedSubscript:", v9, v37);
        BOOL v11 = v10 == 0;

        if (v11) {
          goto LABEL_17;
        }
        if ([v9 isEqual:@"TimeAtHighSoc"])
        {
          id v12 = [v3 objectForKeyedSubscript:v9];
          long long v13 = (int *)[v12 bytes];
          unint64_t v14 = [v12 length];
          double v15 = 0.0;
          if (v14 >= 4)
          {
            unint64_t v16 = v14 >> 2;
            long long v17 = a2;
            do
            {
              int v18 = *v13++;
              double v19 = (double)v18;
              double v20 = *v17++;
              double v15 = v15 + v19 * v20;
              --v16;
            }
            while (v16);
          }

          double v7 = v15 / 100.0;
          uint64_t v21 = [NSNumber numberWithDouble:v7];
        }
        else
        {
          uint64_t v21 = [v3 objectForKeyedSubscript:v9];
        }
        long long v22 = (ACAMSerialization::Deserialization *)v21;
        long long v23 = [&unk_26FCCD8C0 objectAtIndex:v5];
        long long v24 = [&unk_26FCCD8D8 objectAtIndex:v5];
        BOOL isBetween = ACAMSerialization::Deserialization::isBetween(v22, v23, v24, v25);

        if (!isBetween) {
          goto LABEL_17;
        }
        ++v5;
      }
      uint64_t v4 = [&unk_26FCCD8A8 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v4) {
        continue;
      }
      break;
    }
    if (v7 < 0.0)
    {
LABEL_17:
      uint64_t v27 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    double v7 = 0.0;
  }
  double *v37 = v7;
  long long v28 = objc_msgSend(v3, "objectForKeyedSubscript:", @"CycleCount", v37);
  [v28 doubleValue];
  *(void *)(v38 + 8) = v29;

  long long v30 = [v3 objectForKeyedSubscript:@"TotalOperatingTime"];
  [v30 doubleValue];
  *(double *)(v38 + 16) = v31 * 3600.0;

  long long v32 = [MEMORY[0x263EFF910] date];
  [v32 timeIntervalSince1970];
  *(void *)(v38 + 24) = v33;

  long long v34 = [v3 objectForKeyedSubscript:@"VacVoltageLimit"];
  [v34 doubleValue];
  *(double *)(v38 + 32) = v35 / 1000.0;

  uint64_t v27 = 1;
LABEL_20:

  return v27;
}

void sub_248B5B4B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id OnDeviceACAMUtility::createDebugLogItem(OnDeviceACAMUtility *this, NSString *a2, objc_object *a3)
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = this;
  uint64_t v5 = a2;
  uint64_t v6 = [MEMORY[0x263EFF9D0] null];
  int v7 = [(NSString *)v5 isEqual:v6];

  if (v7)
  {
    double v15 = @"message";
    v16[0] = v4;
    uint64_t v8 = &v15;
    long long v9 = v16;
    uint64_t v10 = 1;
  }
  else
  {
    v13[0] = @"message";
    v13[1] = @"value";
    v14[0] = v4;
    v14[1] = v5;
    uint64_t v8 = (__CFString **)v13;
    long long v9 = v14;
    uint64_t v10 = 2;
  }
  BOOL v11 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:v10];

  return v11;
}

void sub_248B5B63C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void saveCurrentSnapshotIntoDebugBuffer(OnDeviceACAM *a1, NSString *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  v12[75] = 0;
  int v18 = 0;
  uint64_t v20 = 0;
  uint64_t v19 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v17 = 0;
  *(_OWORD *)__p = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  ACAMPersistentStates::retrieve((ACAMPersistentStates *)v12, (const ACAM *)[(OnDeviceACAM *)v3 model]);
  ACAMSerialization::Serialization::createDiskStateFromPersistentState((ACAMSerialization::Serialization *)v12, v5);
  uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v7 = [(OnDeviceACAM *)v3 debugLogBuffer];
  long long v9 = OnDeviceACAMUtility::createDebugLogItem((OnDeviceACAMUtility *)v4, v6, v8);
  [v7 addObject:v9];

  uint64_t v10 = *((void *)&v22 + 1);
  if (*((void *)&v22 + 1))
  {
    do
    {
      uint64_t v11 = *(void *)(v10 + 40);
      MEMORY[0x24C58C0C0]();
      uint64_t v10 = v11;
    }
    while (v11);
  }
  *((void *)&v22 + 1) = 0;
  long long v23 = 0uLL;
  if (SBYTE7(v22) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v20) < 0) {
    operator delete(v18);
  }
}

void sub_248B5B7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  long long v14 = v12;

  ACAMPersistentStates::~ACAMPersistentStates((ACAMPersistentStates *)&a9);
  _Unwind_Resume(a1);
}

void ACAMSerialization::Serialization::createBDCDailyFromACAM(ACAMSerialization::Serialization *this, const ACAM *a2, double a3, uint64_t a4, double *a5)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  ACAMLogger::extractDaily(this, a5, (uint64_t)v5);
}

void sub_248B5BC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

void std::vector<OBCData>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<OBCData>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<OBCData>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    long long v9 = &v6[16 * v8];
    uint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    id v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
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

uint64_t ACAMSerialization::Deserialization::setOBCDataFromDictionary(uint64_t a1, void *a2)
{
  uint64_t v25 = a1;
  uint64_t v33[2] = *MEMORY[0x263EF8340];
  id v2 = a2;
  v33[0] = &unk_26FCCD868;
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSince1970];
  double v5 = v4 + 90000.0;

  id v6 = (id)[NSNumber numberWithDouble:v5];
  v33[1] = v6;
  uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v7 = [&unk_26FCCD8F0 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(&unk_26FCCD8F0);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v12 = objc_msgSend(v2, "objectForKeyedSubscript:", v11, v25);
        BOOL v13 = v12 == 0;

        if (v13) {
          goto LABEL_11;
        }
        long long v14 = [v2 objectForKeyedSubscript:v11];
        long long v15 = [&unk_26FCCD908 objectAtIndex:v8 + i];
        long long v16 = [v27 objectAtIndex:v8 + i];
        BOOL isBetween = ACAMSerialization::Deserialization::isBetween(v14, v15, v16, v17);

        if (!isBetween)
        {
LABEL_11:
          uint64_t v23 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [&unk_26FCCD8F0 countByEnumeratingWithState:&v28 objects:v32 count:16];
      v8 += i;
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v19 = objc_msgSend(v2, "objectForKeyedSubscript:", @"VacVoltageLimit", v25);
  [v19 doubleValue];
  *(double *)uint64_t v26 = v20 / 1000.0;

  uint64_t v21 = [v2 objectForKeyedSubscript:@"Timestamp"];
  [v21 doubleValue];
  *(void *)(v26 + 8) = v22;

  uint64_t v23 = 1;
LABEL_12:

  return v23;
}

void sub_248B5C124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void std::vector<SBCData>::reserve(void **a1, unint64_t a2)
{
  double v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xCCCCCCCCCCCCCCCDLL * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x666666666666667) {
      std::vector<OBCData>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 40;
    id v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SBCData>>(v3, a2);
    uint64_t v7 = &v6[40 * v5];
    uint64_t v9 = &v6[40 * v8];
    uint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    id v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 40);
        long long v14 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v14;
        *(_OWORD *)(v12 - 40) = v13;
        v12 -= 40;
        v10 -= 40;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
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

uint64_t ACAMSerialization::Deserialization::setSBCDataFromDictionary(uint64_t a1, void *a2)
{
  uint64_t v31 = a1;
  v39[5] = *MEMORY[0x263EF8340];
  id v2 = a2;
  v39[0] = &unk_26FCCD858;
  v39[1] = &unk_26FCCD858;
  v39[2] = &unk_26FCCD858;
  v39[3] = &unk_26FCCD888;
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSince1970];
  double v5 = v4 + 90000.0;

  id v6 = (id)[NSNumber numberWithDouble:v5];
  v39[4] = v6;
  uint64_t v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:5];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v7 = [&unk_26FCCD920 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(&unk_26FCCD920);
        }
        uint64_t v11 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        id v12 = objc_msgSend(v2, "objectForKeyedSubscript:", v11, v31);
        BOOL v13 = v12 == 0;

        if (v13) {
          goto LABEL_11;
        }
        long long v14 = [v2 objectForKeyedSubscript:v11];
        long long v15 = [&unk_26FCCD938 objectAtIndex:v8 + i];
        long long v16 = [v33 objectAtIndex:v8 + i];
        BOOL isBetween = ACAMSerialization::Deserialization::isBetween(v14, v15, v16, v17);

        if (!isBetween)
        {
LABEL_11:
          uint64_t v29 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [&unk_26FCCD920 countByEnumeratingWithState:&v34 objects:v38 count:16];
      v8 += i;
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v19 = objc_msgSend(v2, "objectForKeyedSubscript:", @"Voltage", v31);
  [v19 doubleValue];
  *(double *)uint64_t v32 = v20 / 1000.0;

  uint64_t v21 = [v2 objectForKeyedSubscript:@"Amperage"];
  [v21 doubleValue];
  *(double *)(v32 + 8) = v22 / 1000.0;

  uint64_t v23 = [v2 objectForKeyedSubscript:@"VirtualTemperature"];
  [v23 doubleValue];
  *(double *)(v32 + 16) = v24 / 100.0;

  uint64_t v25 = [v2 objectForKeyedSubscript:@"PresentDOD0"];
  [v25 doubleValue];
  *(double *)(v32 + 24) = v26 * -0.0000610351562 + 1.0;

  uint64_t v27 = [v2 objectForKeyedSubscript:@"Timestamp"];
  [v27 doubleValue];
  *(void *)(v32 + 32) = v28;

  uint64_t v29 = 1;
LABEL_12:

  return v29;
}

void sub_248B5C5D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t ACAMSerialization::Deserialization::setDailyDataFromDictionary(double *a1, NSString *a2, void *a3)
{
  long long v30 = a1;
  v38[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v38[0] = &unk_26FCCD838;
  v38[1] = &unk_26FCCD848;
  double v4 = [MEMORY[0x263EFF910] date];
  [v4 timeIntervalSince1970];
  double v6 = v5 + 90000.0;

  id v7 = (id)[NSNumber numberWithDouble:v6];
  uint64_t v38[2] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:3];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v9 = [&unk_26FCCD950 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v34;
    double v12 = 0.0;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(&unk_26FCCD950);
        }
        long long v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        long long v15 = objc_msgSend(v3, "objectForKeyedSubscript:", v14, v30);
        BOOL v16 = v15 == 0;

        if (v16) {
          goto LABEL_14;
        }
        if ([v14 isEqual:@"TimeAtHighSoc"])
        {
          uint64_t v17 = [v3 objectForKeyedSubscript:v14];
          double v12 = ACAMSerialization::convertTeqIntoScalar(v17, a2, v18);

          [NSNumber numberWithDouble:v12];
        }
        else
        {
          [v3 objectForKeyedSubscript:v14];
        }
        uint64_t v19 = (ACAMSerialization::Deserialization *)objc_claimAutoreleasedReturnValue();
        double v20 = [&unk_26FCCD968 objectAtIndex:v10 + i];
        uint64_t v21 = [v8 objectAtIndex:v10 + i];
        BOOL isBetween = ACAMSerialization::Deserialization::isBetween(v19, v20, v21, v22);

        if (!isBetween) {
          goto LABEL_14;
        }
      }
      uint64_t v9 = [&unk_26FCCD950 countByEnumeratingWithState:&v33 objects:v37 count:16];
      v10 += i;
      if (v9) {
        continue;
      }
      break;
    }
    if (v12 < 0.0)
    {
LABEL_14:
      uint64_t v24 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    double v12 = 0.0;
  }
  *long long v30 = v12;
  uint64_t v25 = objc_msgSend(v3, "objectForKeyedSubscript:", @"CycleCount", v30);
  [v25 doubleValue];
  *(void *)(v31 + 8) = v26;

  uint64_t v27 = [v3 objectForKeyedSubscript:@"Timestamp"];
  [v27 doubleValue];
  *(void *)(v31 + 16) = v28;

  uint64_t v24 = 1;
LABEL_17:

  return v24;
}

void sub_248B5C970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void saveSnapshotIntoDebugBuffer(OnDeviceACAM *a1, ACAMPersistentStates *a2, NSString *a3)
{
  uint64_t v11 = a1;
  double v5 = a3;
  ACAMSerialization::Serialization::createDiskStateFromPersistentState(a2, v6);
  id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [(OnDeviceACAM *)v11 debugLogBuffer];
  uint64_t v10 = OnDeviceACAMUtility::createDebugLogItem((OnDeviceACAMUtility *)v5, v7, v9);
  [v8 addObject:v10];
}

void sub_248B5CAA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v14 = v13;

  _Unwind_Resume(a1);
}

void sub_248B5E5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_objecta, uint64_t a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,uint64_t a29,ACAMPerformanceModelParameter *a30)
{
  ACAMUtility::ACAMParameterPack::~ACAMParameterPack(&a30);
  if (SLOBYTE(STACK[0x3C7]) < 0) {
    operator delete(*v32);
  }

  _Unwind_Resume(a1);
}

void ACAMSerialization::Deserialization::setPersistentStatesFromDictionary(ACAMSerialization::Deserialization *this, ACAMPersistentStates *a2, const NSDictionary *a3)
{
  uint64_t v193 = *MEMORY[0x263EF8340];
  v187 = a2;
  double v4 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.BatteryStatePrevious.V"];
  [v4 doubleValue];
  *(void *)this = v5;

  double v6 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.BatteryStatePrevious.I"];
  [v6 doubleValue];
  *((void *)this + 1) = v7;

  uint64_t v8 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.BatteryStatePrevious.T"];
  [v8 doubleValue];
  *((void *)this + 2) = v9;

  uint64_t v10 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.BatteryStatePrevious.SOC"];
  [v10 doubleValue];
  *((void *)this + 3) = v11;

  double v12 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.BatteryStatePrevious.t"];
  [v12 doubleValue];
  *((void *)this + 4) = v13;

  long long v14 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.BatteryStateCurrent.V"];
  [v14 doubleValue];
  *((void *)this + 5) = v15;

  BOOL v16 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.BatteryStateCurrent.I"];
  [v16 doubleValue];
  *((void *)this + 6) = v17;

  int v18 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.BatteryStateCurrent.T"];
  [v18 doubleValue];
  *((void *)this + 7) = v19;

  double v20 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.BatteryStateCurrent.SOC"];
  [v20 doubleValue];
  *((void *)this + 8) = v21;

  double v22 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.BatteryStateCurrent.t"];
  [v22 doubleValue];
  *((void *)this + 9) = v23;

  uint64_t v24 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStatePrevious.x"];
  [v24 doubleValue];
  *((void *)this + 10) = v25;

  uint64_t v26 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStatePrevious.y"];
  [v26 doubleValue];
  *((void *)this + 11) = v27;

  uint64_t v28 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStatePrevious.xLastExtreme"];
  [v28 doubleValue];
  *((void *)this + 12) = v29;

  long long v30 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStatePrevious.yLastExtreme"];
  [v30 doubleValue];
  *((void *)this + 13) = v31;

  uint64_t v32 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStatePrevious.potentialAnode"];
  [v32 doubleValue];
  *((void *)this + 14) = v33;

  long long v34 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStatePrevious.potentialCathode"];
  [v34 doubleValue];
  *((void *)this + 15) = v35;

  long long v36 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStatePrevious.cRate"];
  [v36 doubleValue];
  *((void *)this + 16) = v37;

  uint64_t v38 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStatePrevious.wRcFreshAtCurrentTemp"];
  [v38 doubleValue];
  *((void *)this + 17) = v39;

  long long v40 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStatePrevious.wRaFreshAtCurrentTemp"];
  [v40 doubleValue];
  *((void *)this + 18) = v41;

  long long v42 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStatePrevious.deltaResistancePos"];
  [v42 doubleValue];
  *((void *)this + 19) = v43;

  long long v44 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStatePrevious.deltaResistanceNeg"];
  [v44 doubleValue];
  *((void *)this + 20) = v45;

  double v46 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStatePrevious.resistancePos"];
  [v46 doubleValue];
  *((void *)this + 21) = v47;

  double v48 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStatePrevious.resistanceNeg"];
  [v48 doubleValue];
  *((void *)this + 22) = v49;

  double v50 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStateCurrent.x"];
  [v50 doubleValue];
  *((void *)this + 23) = v51;

  double v52 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStateCurrent.y"];
  [v52 doubleValue];
  *((void *)this + 24) = v53;

  double v54 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStateCurrent.xLastExtreme"];
  [v54 doubleValue];
  *((void *)this + 25) = v55;

  double v56 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStateCurrent.yLastExtreme"];
  [v56 doubleValue];
  *((void *)this + 26) = v57;

  uint64_t v58 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStateCurrent.potentialAnode"];
  [v58 doubleValue];
  *((void *)this + 27) = v59;

  BOOL v60 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStateCurrent.potentialCathode"];
  [v60 doubleValue];
  *((void *)this + 28) = v61;

  BOOL v62 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStateCurrent.cRate"];
  [v62 doubleValue];
  *((void *)this + 29) = v63;

  v64 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStateCurrent.wRcFreshAtCurrentTemp"];
  [v64 doubleValue];
  *((void *)this + 30) = v65;

  double v66 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStateCurrent.wRaFreshAtCurrentTemp"];
  [v66 doubleValue];
  *((void *)this + 31) = v67;

  v68 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStateCurrent.deltaResistancePos"];
  [v68 doubleValue];
  *((void *)this + 32) = v69;

  v70 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStateCurrent.deltaResistanceNeg"];
  [v70 doubleValue];
  *((void *)this + 33) = v71;

  BOOL v72 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStateCurrent.resistancePos"];
  [v72 doubleValue];
  *((void *)this + 34) = v73;

  v74 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ElectrodeStateCurrent.resistanceNeg"];
  [v74 doubleValue];
  *((void *)this + 35) = v75;

  v76 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AgingState.gasSwell"];
  [v76 doubleValue];
  *((void *)this + 36) = v77;

  v78 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AgingState.protectiveBuffer"];
  [v78 doubleValue];
  *((void *)this + 37) = v79;

  v80 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AgingState.timePassedOnset"];
  [v80 doubleValue];
  *((void *)this + 38) = v81;

  v82 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AgingState.hardSwell"];
  [v82 doubleValue];
  *((void *)this + 39) = v83;

  v84 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AgingState.expGammaHardSwell"];
  [v84 doubleValue];
  *((void *)this + 40) = v85;

  v86 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AgingState.wRaChangeRatio"];
  [v86 doubleValue];
  *((void *)this + 41) = v87;

  v88 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AgingState.wRcChangeRatio"];
  [v88 doubleValue];
  *((void *)this + 42) = v89;

  v90 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AgingState.Qp"];
  [v90 doubleValue];
  *((void *)this + 43) = v91;

  v92 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AgingState.QpLoss"];
  [v92 doubleValue];
  *((void *)this + 44) = v93;

  v94 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AgingState.QpPhaseLoss"];
  [v94 doubleValue];
  *((void *)this + 45) = v95;

  v96 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AgingState.QpAcidLoss"];
  [v96 doubleValue];
  *((void *)this + 46) = v97;

  v98 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AgingState.QpCrackLoss"];
  [v98 doubleValue];
  *((void *)this + 47) = v99;

  v100 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AgingState.Qn"];
  [v100 doubleValue];
  *((void *)this + 48) = v101;

  v102 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AgingState.QLi"];
  [v102 doubleValue];
  *((void *)this + 49) = v103;

  v104 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AgingState.integralJSEIdt"];
  [v104 doubleValue];
  *((void *)this + 50) = v105;

  v106 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AgingState.integralJWRadt"];
  [v106 doubleValue];
  *((void *)this + 51) = v107;

  v108 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AgingState.integralJWRcdt"];
  [v108 doubleValue];
  *((void *)this + 52) = v109;

  v110 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.UpdatorState.x0"];
  [v110 doubleValue];
  *((void *)this + 53) = v111;

  v112 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.UpdatorState.x100"];
  [v112 doubleValue];
  *((void *)this + 54) = v113;

  v114 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.UpdatorState.y0"];
  [v114 doubleValue];
  *((void *)this + 55) = v115;

  v116 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.UpdatorState.y100"];
  [v116 doubleValue];
  *((void *)this + 56) = v117;

  v118 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.UpdatorState.Qmax"];
  [v118 doubleValue];
  *((void *)this + 57) = v119;

  v120 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.UpdatorState.resistancePosChgRatio"];
  [v120 doubleValue];
  *((void *)this + 58) = v121;

  v122 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.UpdatorState.resistanceNegChgRatio"];
  [v122 doubleValue];
  *((void *)this + 59) = v123;

  v124 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.UpdatorState.resistancePosDcgRatio"];
  [v124 doubleValue];
  *((void *)this + 60) = v125;

  v126 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.UpdatorState.resistanceNegDcgRatio"];
  [v126 doubleValue];
  *((void *)this + 61) = v127;

  v128 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Derivative.dProtectiveBufferdt"];
  [v128 doubleValue];
  *((void *)this + 62) = v129;

  v130 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Derivative.dGasSwelldt"];
  [v130 doubleValue];
  *((void *)this + 63) = v131;

  v132 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Derivative.dExpGammaHardSwelldt"];
  [v132 doubleValue];
  *((void *)this + 64) = v133;

  v134 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Derivative.dHardSwelldt"];
  [v134 doubleValue];
  *((void *)this + 65) = v135;

  v136 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Derivative.dQpdt"];
  [v136 doubleValue];
  *((void *)this + 66) = v137;

  v138 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Derivative.dQpPhasedt"];
  [v138 doubleValue];
  *((void *)this + 67) = v139;

  v140 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Derivative.dQpAciddt"];
  [v140 doubleValue];
  *((void *)this + 68) = v141;

  v142 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Derivative.dQpCrackdt"];
  [v142 doubleValue];
  *((void *)this + 69) = v143;

  v144 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Derivative.dQndt"];
  [v144 doubleValue];
  *((void *)this + 70) = v145;

  v146 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Derivative.dQLidt"];
  [v146 doubleValue];
  *((void *)this + 71) = v147;

  v148 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Derivative.JSEI"];
  [v148 doubleValue];
  *((void *)this + 72) = v149;

  v150 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Derivative.dWRadt"];
  [v150 doubleValue];
  *((void *)this + 73) = v151;

  v152 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Derivative.dWRcdt"];
  [v152 doubleValue];
  *((void *)this + 74) = v153;

  v154 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.DynamicConfiguration.SOCBiasCorrection"];
  [v154 doubleValue];
  *((void *)this + 75) = v155;

  v156 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.DynamicConfiguration.voltageChargeLimit"];
  [v156 doubleValue];
  *((void *)this + 76) = v157;

  v158 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Statistics.sleepStatistics[0]"];
  *((void *)this + 77) = [v158 unsignedLongValue];

  v159 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Statistics.sleepStatistics[1]"];
  *((void *)this + 78) = [v159 unsignedLongValue];

  v160 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Statistics.sleepStatistics[2]"];
  *((void *)this + 79) = [v160 unsignedLongValue];

  v161 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Statistics.sleepStatistics[3]"];
  *((void *)this + 80) = [v161 unsignedLongValue];

  v162 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Statistics.sleepStatistics[4]"];
  *((void *)this + 81) = [v162 unsignedLongValue];

  v163 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Statistics.sleepStatistics[5]"];
  *((void *)this + 82) = [v163 unsignedLongValue];

  v164 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Status.mPreviousAlgoStatus"];
  *((_DWORD *)this + 166) = [v164 intValue];

  v165 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Status.mCurrentAlgoStatus"];
  *((_DWORD *)this + 167) = [v165 intValue];

  v166 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Status.mCurrentDataError"];
  *((_DWORD *)this + 168) = [v166 intValue];

  v167 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Status.mBuffer"];
  *((_DWORD *)this + 169) = [v167 intValue];

  v168 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Status.mInitType"];
  ACAMStatus::setInitType((uint64_t)this + 664, [v168 intValue]);

  v169 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Status.mFreshInitReason"];
  ACAMStatus::setFreshInitReason((uint64_t)this + 664, [v169 intValue]);

  v170 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Status.mSystemSignal.batteryAuthentication"];
  *((unsigned char *)this + 688) = [v170 BOOLValue];

  v171 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Status.mSystemSignal.batteryReplacement"];
  *((unsigned char *)this + 689) = [v171 BOOLValue];

  id v172 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Status.mSystemSignal.batteryReplacementDate"];
  std::string::basic_string[abi:ne180100](&__dst, (void *)[v172 UTF8String], objc_msgSend(v172, "lengthOfBytesUsingEncoding:", 4));

  v173 = (void **)((char *)this + 696);
  if (*((char *)this + 719) < 0) {
    operator delete(*v173);
  }
  *(_OWORD *)v173 = __dst;
  *((void *)this + 89) = v191;
  HIBYTE(v191) = 0;
  LOBYTE(__dst) = 0;

  v174 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Status.mSystemSignal.time"];
  *((void *)this + 90) = [v174 unsignedLongValue];

  v175 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Status.mSystemSignal.version"];
  [v175 doubleValue];
  *((void *)this + 91) = (unint64_t)v176;

  id v177 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.Status.mSystemSignal.batteryInfo"];
  std::string::basic_string[abi:ne180100](&__dst, (void *)[v177 UTF8String], objc_msgSend(v177, "lengthOfBytesUsingEncoding:", 4));

  v178 = (void **)((char *)this + 736);
  if (*((char *)this + 759) < 0) {
    operator delete(*v178);
  }
  *(_OWORD *)v178 = __dst;
  *((void *)this + 94) = v191;
  HIBYTE(v191) = 0;
  LOBYTE(__dst) = 0;

  v179 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.AlgorithmInitialized"];
  *((unsigned char *)this + 784) = [v179 BOOLValue];

  v180 = [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.ParameterVersion"];
  *((void *)this + 99) = [v180 unsignedLongValue];

  [(ACAMPersistentStates *)v187 objectForKeyedSubscript:@"persistentState.BatteryStateHistory"];
  memset(v189, 0, sizeof(v189));
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  if ([obj countByEnumeratingWithState:v189 objects:v192 count:16])
  {
    v181 = (void *)**((void **)&v189[0] + 1);
    v182 = [**((id **)&v189[0] + 1) objectForKeyedSubscript:@"V"];
    [v182 doubleValue];
    v183 = [v181 objectForKeyedSubscript:@"I"];
    [v183 doubleValue];
    v184 = [v181 objectForKeyedSubscript:@"T"];
    [v184 doubleValue];
    v185 = [v181 objectForKeyedSubscript:@"SOC"];
    [v185 doubleValue];
    v186 = [v181 objectForKeyedSubscript:@"t"];
    [v186 doubleValue];

    simpleList<ACAMBatteryState>::append((uint64_t)this + 760);
  }
}

void sub_248B5F85C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

uint64_t ACAMSerialization::Deserialization::setSystemSignalsFromDictionaries(ACAMSerialization::Deserialization *this, ACAMStatus::SystemSignals *a2, NSDictionary *a3, const NSDictionary *a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  double v6 = a2;
  uint64_t v7 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v8 = [&unk_26FCCD980 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v33;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v33 != v9) {
        objc_enumerationMutation(&unk_26FCCD980);
      }
      uint64_t v11 = [(ACAMStatus::SystemSignals *)v6 objectForKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * v10)];
      BOOL v12 = v11 == 0;

      if (v12) {
        goto LABEL_20;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [&unk_26FCCD980 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v13 = [&unk_26FCCD998 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v29;
LABEL_11:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v29 != v14) {
        objc_enumerationMutation(&unk_26FCCD998);
      }
      BOOL v16 = [(NSDictionary *)v7 objectForKeyedSubscript:*(void *)(*((void *)&v28 + 1) + 8 * v15)];
      BOOL v17 = v16 == 0;

      if (v17) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [&unk_26FCCD998 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v13) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_20:
    uint64_t v24 = 0;
    goto LABEL_21;
  }
LABEL_17:
  int v18 = [(NSDictionary *)v7 objectForKeyedSubscript:@"BatteryAuthPass"];
  *(unsigned char *)this = [v18 BOOLValue];

  *((unsigned char *)this + 1) = 0;
  MEMORY[0x24C58BFF0]((char *)this + 8, &unk_248B6E6C2);
  uint64_t v19 = [MEMORY[0x263EFF910] date];
  [v19 timeIntervalSince1970];
  *((void *)this + 4) = (unint64_t)v20;

  [&unk_26FCCD760 doubleValue];
  *((void *)this + 5) = (unint64_t)v21;
  id v22 = [(ACAMStatus::SystemSignals *)v6 objectForKeyedSubscript:@"Serial"];
  std::string::basic_string[abi:ne180100](&__dst, (void *)[v22 UTF8String], objc_msgSend(v22, "lengthOfBytesUsingEncoding:", 4));

  uint64_t v23 = (void **)((char *)this + 48);
  if (*((char *)this + 71) < 0) {
    operator delete(*v23);
  }
  *(_OWORD *)uint64_t v23 = __dst;
  *((void *)this + 8) = v27;
  HIBYTE(v27) = 0;
  LOBYTE(__dst) = 0;

  uint64_t v24 = 1;
LABEL_21:

  return v24;
}

void sub_248B5FD80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ACAMStatus::SystemSignals::~SystemSignals(void **this)
{
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

void sub_248B60118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

id ACAMSerialization::Serialization::createBDCSBCFromACAM(ACAMSerialization::Serialization *this, const ACAM *a2, double a3)
{
  v15[3] = *MEMORY[0x263EF8340];
  float SBC = ACAMLogger::extractSBC(this, a2);
  int v6 = v5;
  v14[0] = @"timeSinceLastSBC";
  uint64_t v7 = [NSNumber numberWithDouble:a3];
  v15[0] = v7;
  v14[1] = @"potentialAnode";
  *(float *)&double v8 = SBC;
  uint64_t v9 = [NSNumber numberWithFloat:v8];
  v15[1] = v9;
  void v14[2] = @"potentialCathode";
  LODWORD(v10) = v6;
  uint64_t v11 = [NSNumber numberWithFloat:v10];
  v15[2] = v11;
  BOOL v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

void sub_248B602D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ACAMSerialization::Serialization::createBDCWeeklyFromACAM(ACAMSerialization::Serialization *this, const ACAM *a2, double a3)
{
}

void sub_248B610DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _Unwind_Exception *exception_objecta, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41,void *a42,void *a43,void *a44,void *a45,void *a46,void *a47,void *a48,void *a49,void *a50,void *a51,void *a52,void *a53,void *a54,void *a55,void *a56,void *a57,void *a58,void *a59,void *a60,void *a61,void *a62,void *a63)
{
  _Unwind_Resume(a1);
}

void sub_248B62610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,uint64_t a41,uint64_t a42,void *a43,uint64_t a44,uint64_t a45,void *a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::~__hash_table((uint64_t)&a49);
  STACK[0x2A0] = (unint64_t)&a54;
  std::vector<std::vector<SmartBatteryData>>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x2A0]);

  _Unwind_Resume(a1);
}

uint64_t std::pair<std::string const,std::set<unsigned long>>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t ACAMSerialization::Deserialization::setSmartBatteryDataFromDictionary(uint64_t a1, void *a2)
{
  uint64_t v31 = a1;
  v39[5] = *MEMORY[0x263EF8340];
  id v2 = a2;
  v39[0] = &unk_26FCCD898;
  v39[1] = &unk_26FCCD858;
  v39[2] = &unk_26FCCD858;
  v39[3] = &unk_26FCCD888;
  id v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSince1970];
  double v5 = v4 + 90000.0;

  id v6 = (id)[NSNumber numberWithDouble:v5];
  v39[4] = v6;
  long long v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:5];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v7 = [&unk_26FCCD9B0 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(&unk_26FCCD9B0);
        }
        uint64_t v11 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        BOOL v12 = objc_msgSend(v2, "objectForKeyedSubscript:", v11, v31);
        BOOL v13 = v12 == 0;

        if (v13) {
          goto LABEL_11;
        }
        uint64_t v14 = [v2 objectForKeyedSubscript:v11];
        uint64_t v15 = [&unk_26FCCD9C8 objectAtIndex:v8 + i];
        BOOL v16 = [v33 objectAtIndex:v8 + i];
        BOOL isBetween = ACAMSerialization::Deserialization::isBetween(v14, v15, v16, v17);

        if (!isBetween)
        {
LABEL_11:
          uint64_t v29 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [&unk_26FCCD9B0 countByEnumeratingWithState:&v34 objects:v38 count:16];
      v8 += i;
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v19 = objc_msgSend(v2, "objectForKeyedSubscript:", @"Voltage", v31);
  [v19 doubleValue];
  *(double *)uint64_t v32 = v20 / 1000.0;

  double v21 = [v2 objectForKeyedSubscript:@"InstantAmperage"];
  [v21 doubleValue];
  *(double *)(v32 + 8) = v22 / 1000.0;

  uint64_t v23 = [v2 objectForKeyedSubscript:@"VirtualTemperature"];
  [v23 doubleValue];
  *(double *)(v32 + 16) = v24 / 100.0;

  uint64_t v25 = [v2 objectForKeyedSubscript:@"PresentDOD"];
  [v25 doubleValue];
  *(double *)(v32 + 24) = v26 * -0.0000610351562 + 1.0;

  uint64_t v27 = [v2 objectForKeyedSubscript:@"Timestamp"];
  [v27 doubleValue];
  *(void *)(v32 + 32) = v28;

  uint64_t v29 = 1;
LABEL_12:

  return v29;
}

void sub_248B62E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<SmartBatteryData>>::push_back[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(void **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - *a1) >> 3);
    unint64_t v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<OBCData>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 3);
    if (2 * v11 > v10) {
      unint64_t v10 = 2 * v11;
    }
    if (v11 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v10;
    }
    v16[4] = result;
    BOOL v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<SmartBatteryData>>>(result, v12);
    uint64_t v14 = &v13[24 * v9];
    v16[0] = v13;
    v16[1] = v14;
    v16[3] = &v13[24 * v15];
    *((void *)v14 + 1) = 0;
    *((void *)v14 + 2) = 0;
    *(void *)uint64_t v14 = 0;
    *(_OWORD *)uint64_t v14 = *(_OWORD *)a2;
    *((void *)v14 + 2) = *(void *)(a2 + 16);
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    void v16[2] = v14 + 24;
    std::vector<std::vector<SmartBatteryData>>::__swap_out_circular_buffer(a1, v16);
    uint64_t v8 = (void *)a1[1];
    uint64_t result = std::__split_buffer<std::vector<SmartBatteryData>>::~__split_buffer((uint64_t)v16);
  }
  else
  {
    *uint64_t v7 = 0;
    v7[1] = 0;
    v7[2] = 0;
    *(_OWORD *)uint64_t v7 = *(_OWORD *)a2;
    v7[2] = *(void *)(a2 + 16);
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    uint64_t v8 = v7 + 3;
    a1[1] = (uint64_t)(v7 + 3);
  }
  a1[1] = (uint64_t)v8;
  return result;
}

void sub_248B63060(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<SmartBatteryData>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_248B63470(_Unwind_Exception *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);

  ACAMPersistentStates::~ACAMPersistentStates((ACAMPersistentStates *)va);
  _Unwind_Resume(a1);
}

id ACAMSerialization::Serialization::createDiskStateFromPersistentState(ACAMSerialization::Serialization *this, const ACAMPersistentStates *a2)
{
  v212[5] = *MEMORY[0x263EF8340];
  uint64_t v111 = [MEMORY[0x263EFF980] array];
  for (uint64_t i = *((void *)this + 95); i; uint64_t i = *(void *)(i + 40))
  {
    v211[0] = @"V";
    double v4 = [NSNumber numberWithDouble:*(double *)i];
    v212[0] = v4;
    v211[1] = @"I";
    unint64_t v5 = [NSNumber numberWithDouble:*(double *)(i + 8)];
    v212[1] = v5;
    v211[2] = @"T";
    unint64_t v6 = [NSNumber numberWithDouble:*(double *)(i + 16)];
    v212[2] = v6;
    v211[3] = @"SOC";
    uint64_t v7 = [NSNumber numberWithDouble:*(double *)(i + 24)];
    v212[3] = v7;
    v211[4] = @"t";
    uint64_t v8 = [NSNumber numberWithDouble:*(double *)(i + 32)];
    v212[4] = v8;
    unint64_t v9 = [NSDictionary dictionaryWithObjects:v212 forKeys:v211 count:5];
    [v111 addObject:v9];
  }
  v112[0] = @"persistentState.BatteryStatePrevious.V";
  uint64_t v113 = [NSNumber numberWithDouble:*(double *)this];
  v112[1] = @"persistentState.BatteryStatePrevious.I";
  v108 = (void *)v113;
  uint64_t v114 = [NSNumber numberWithDouble:*((double *)this + 1)];
  v112[2] = @"persistentState.BatteryStatePrevious.T";
  uint64_t v107 = (void *)v114;
  uint64_t v115 = [NSNumber numberWithDouble:*((double *)this + 2)];
  v112[3] = @"persistentState.BatteryStatePrevious.SOC";
  v106 = (void *)v115;
  uint64_t v116 = [NSNumber numberWithDouble:*((double *)this + 3)];
  v112[4] = @"persistentState.BatteryStatePrevious.t";
  uint64_t v105 = (void *)v116;
  uint64_t v117 = [NSNumber numberWithDouble:*((double *)this + 4)];
  v112[5] = @"persistentState.BatteryStateCurrent.V";
  v104 = (void *)v117;
  uint64_t v118 = [NSNumber numberWithDouble:*((double *)this + 5)];
  v112[6] = @"persistentState.BatteryStateCurrent.I";
  uint64_t v103 = (void *)v118;
  v102 = [NSNumber numberWithDouble:*((double *)this + 6)];
  uint64_t v119 = v102;
  v112[7] = @"persistentState.BatteryStateCurrent.T";
  uint64_t v101 = [NSNumber numberWithDouble:*((double *)this + 7)];
  v120 = v101;
  v112[8] = @"persistentState.BatteryStateCurrent.SOC";
  v100 = [NSNumber numberWithDouble:*((double *)this + 8)];
  uint64_t v121 = v100;
  v112[9] = @"persistentState.BatteryStateCurrent.t";
  uint64_t v99 = [NSNumber numberWithDouble:*((double *)this + 9)];
  v122 = v99;
  v112[10] = @"persistentState.ElectrodeStatePrevious.x";
  v98 = [NSNumber numberWithDouble:*((double *)this + 10)];
  uint64_t v123 = v98;
  v112[11] = @"persistentState.ElectrodeStatePrevious.y";
  uint64_t v97 = [NSNumber numberWithDouble:*((double *)this + 11)];
  v124 = v97;
  v112[12] = @"persistentState.ElectrodeStatePrevious.xLastExtreme";
  v96 = [NSNumber numberWithDouble:*((double *)this + 12)];
  uint64_t v125 = v96;
  v112[13] = @"persistentState.ElectrodeStatePrevious.yLastExtreme";
  uint64_t v95 = [NSNumber numberWithDouble:*((double *)this + 13)];
  v126 = v95;
  v112[14] = @"persistentState.ElectrodeStatePrevious.potentialAnode";
  v94 = [NSNumber numberWithDouble:*((double *)this + 14)];
  uint64_t v127 = v94;
  v112[15] = @"persistentState.ElectrodeStatePrevious.potentialCathode";
  uint64_t v93 = [NSNumber numberWithDouble:*((double *)this + 15)];
  v128 = v93;
  v112[16] = @"persistentState.ElectrodeStatePrevious.cRate";
  v92 = [NSNumber numberWithDouble:*((double *)this + 16)];
  uint64_t v129 = v92;
  v112[17] = @"persistentState.ElectrodeStatePrevious.wRcFreshAtCurrentTemp";
  uint64_t v91 = [NSNumber numberWithDouble:*((double *)this + 17)];
  v130 = v91;
  v112[18] = @"persistentState.ElectrodeStatePrevious.wRaFreshAtCurrentTemp";
  v90 = [NSNumber numberWithDouble:*((double *)this + 18)];
  uint64_t v131 = v90;
  v112[19] = @"persistentState.ElectrodeStatePrevious.deltaResistancePos";
  uint64_t v89 = [NSNumber numberWithDouble:*((double *)this + 19)];
  v132 = v89;
  v112[20] = @"persistentState.ElectrodeStatePrevious.deltaResistanceNeg";
  v88 = [NSNumber numberWithDouble:*((double *)this + 20)];
  uint64_t v133 = v88;
  v112[21] = @"persistentState.ElectrodeStatePrevious.resistancePos";
  uint64_t v87 = [NSNumber numberWithDouble:*((double *)this + 21)];
  v134 = v87;
  v112[22] = @"persistentState.ElectrodeStatePrevious.resistanceNeg";
  v86 = [NSNumber numberWithDouble:*((double *)this + 22)];
  uint64_t v135 = v86;
  v112[23] = @"persistentState.ElectrodeStateCurrent.x";
  uint64_t v85 = [NSNumber numberWithDouble:*((double *)this + 23)];
  v136 = v85;
  v112[24] = @"persistentState.ElectrodeStateCurrent.y";
  v84 = [NSNumber numberWithDouble:*((double *)this + 24)];
  uint64_t v137 = v84;
  v112[25] = @"persistentState.ElectrodeStateCurrent.xLastExtreme";
  uint64_t v83 = [NSNumber numberWithDouble:*((double *)this + 25)];
  v138 = v83;
  v112[26] = @"persistentState.ElectrodeStateCurrent.yLastExtreme";
  v82 = [NSNumber numberWithDouble:*((double *)this + 26)];
  uint64_t v139 = v82;
  v112[27] = @"persistentState.ElectrodeStateCurrent.potentialAnode";
  uint64_t v81 = [NSNumber numberWithDouble:*((double *)this + 27)];
  v140 = v81;
  v112[28] = @"persistentState.ElectrodeStateCurrent.potentialCathode";
  v80 = [NSNumber numberWithDouble:*((double *)this + 28)];
  uint64_t v141 = v80;
  v112[29] = @"persistentState.ElectrodeStateCurrent.cRate";
  uint64_t v79 = [NSNumber numberWithDouble:*((double *)this + 29)];
  v142 = v79;
  v112[30] = @"persistentState.ElectrodeStateCurrent.wRcFreshAtCurrentTemp";
  v78 = [NSNumber numberWithDouble:*((double *)this + 30)];
  uint64_t v143 = v78;
  v112[31] = @"persistentState.ElectrodeStateCurrent.wRaFreshAtCurrentTemp";
  uint64_t v77 = [NSNumber numberWithDouble:*((double *)this + 31)];
  v144 = v77;
  v112[32] = @"persistentState.ElectrodeStateCurrent.deltaResistancePos";
  v76 = [NSNumber numberWithDouble:*((double *)this + 32)];
  uint64_t v145 = v76;
  v112[33] = @"persistentState.ElectrodeStateCurrent.deltaResistanceNeg";
  uint64_t v75 = [NSNumber numberWithDouble:*((double *)this + 33)];
  v146 = v75;
  v112[34] = @"persistentState.ElectrodeStateCurrent.resistancePos";
  v74 = [NSNumber numberWithDouble:*((double *)this + 34)];
  uint64_t v147 = v74;
  v112[35] = @"persistentState.ElectrodeStateCurrent.resistanceNeg";
  uint64_t v73 = [NSNumber numberWithDouble:*((double *)this + 35)];
  v148 = v73;
  v112[36] = @"persistentState.AgingState.gasSwell";
  BOOL v72 = [NSNumber numberWithDouble:*((double *)this + 36)];
  uint64_t v149 = v72;
  v112[37] = @"persistentState.AgingState.protectiveBuffer";
  uint64_t v71 = [NSNumber numberWithDouble:*((double *)this + 37)];
  v150 = v71;
  v112[38] = @"persistentState.AgingState.timePassedOnset";
  v70 = [NSNumber numberWithDouble:*((double *)this + 38)];
  uint64_t v151 = v70;
  v112[39] = @"persistentState.AgingState.hardSwell";
  uint64_t v69 = [NSNumber numberWithDouble:*((double *)this + 39)];
  v152 = v69;
  v112[40] = @"persistentState.AgingState.expGammaHardSwell";
  v68 = [NSNumber numberWithDouble:*((double *)this + 40)];
  uint64_t v153 = v68;
  v112[41] = @"persistentState.AgingState.wRaChangeRatio";
  uint64_t v67 = [NSNumber numberWithDouble:*((double *)this + 41)];
  v154 = v67;
  v112[42] = @"persistentState.AgingState.wRcChangeRatio";
  double v66 = [NSNumber numberWithDouble:*((double *)this + 42)];
  uint64_t v155 = v66;
  v112[43] = @"persistentState.AgingState.Qp";
  uint64_t v65 = [NSNumber numberWithDouble:*((double *)this + 43)];
  v156 = v65;
  v112[44] = @"persistentState.AgingState.QpLoss";
  v64 = [NSNumber numberWithDouble:*((double *)this + 44)];
  uint64_t v157 = v64;
  v112[45] = @"persistentState.AgingState.QpPhaseLoss";
  uint64_t v63 = [NSNumber numberWithDouble:*((double *)this + 45)];
  v158 = v63;
  v112[46] = @"persistentState.AgingState.QpAcidLoss";
  BOOL v62 = [NSNumber numberWithDouble:*((double *)this + 46)];
  v159 = v62;
  v112[47] = @"persistentState.AgingState.QpCrackLoss";
  uint64_t v61 = [NSNumber numberWithDouble:*((double *)this + 47)];
  v160 = v61;
  v112[48] = @"persistentState.AgingState.Qn";
  BOOL v60 = [NSNumber numberWithDouble:*((double *)this + 48)];
  v161 = v60;
  v112[49] = @"persistentState.AgingState.QLi";
  uint64_t v59 = [NSNumber numberWithDouble:*((double *)this + 49)];
  v162 = v59;
  v112[50] = @"persistentState.AgingState.integralJSEIdt";
  uint64_t v58 = [NSNumber numberWithDouble:*((double *)this + 50)];
  v163 = v58;
  v112[51] = @"persistentState.AgingState.integralJWRadt";
  uint64_t v57 = [NSNumber numberWithDouble:*((double *)this + 51)];
  v164 = v57;
  v112[52] = @"persistentState.AgingState.integralJWRcdt";
  double v56 = [NSNumber numberWithDouble:*((double *)this + 52)];
  v165 = v56;
  v112[53] = @"persistentState.UpdatorState.x0";
  uint64_t v55 = [NSNumber numberWithDouble:*((double *)this + 53)];
  v166 = v55;
  v112[54] = @"persistentState.UpdatorState.x100";
  double v54 = [NSNumber numberWithDouble:*((double *)this + 54)];
  v167 = v54;
  v112[55] = @"persistentState.UpdatorState.y0";
  uint64_t v53 = [NSNumber numberWithDouble:*((double *)this + 55)];
  v168 = v53;
  v112[56] = @"persistentState.UpdatorState.y100";
  v110 = [NSNumber numberWithDouble:*((double *)this + 56)];
  v169 = v110;
  v112[57] = @"persistentState.UpdatorState.Qmax";
  double v52 = [NSNumber numberWithDouble:*((double *)this + 57)];
  v170 = v52;
  v112[58] = @"persistentState.UpdatorState.resistancePosChgRatio";
  uint64_t v51 = [NSNumber numberWithDouble:*((double *)this + 58)];
  v171 = v51;
  v112[59] = @"persistentState.UpdatorState.resistanceNegChgRatio";
  double v50 = [NSNumber numberWithDouble:*((double *)this + 59)];
  id v172 = v50;
  v112[60] = @"persistentState.UpdatorState.resistancePosDcgRatio";
  uint64_t v49 = [NSNumber numberWithDouble:*((double *)this + 60)];
  v173 = v49;
  v112[61] = @"persistentState.UpdatorState.resistanceNegDcgRatio";
  double v48 = [NSNumber numberWithDouble:*((double *)this + 61)];
  v174 = v48;
  v112[62] = @"persistentState.Derivative.dProtectiveBufferdt";
  uint64_t v47 = [NSNumber numberWithDouble:*((double *)this + 62)];
  v175 = v47;
  v112[63] = @"persistentState.Derivative.dGasSwelldt";
  double v46 = [NSNumber numberWithDouble:*((double *)this + 63)];
  double v176 = v46;
  v112[64] = @"persistentState.Derivative.dExpGammaHardSwelldt";
  uint64_t v45 = [NSNumber numberWithDouble:*((double *)this + 64)];
  id v177 = v45;
  v112[65] = @"persistentState.Derivative.dHardSwelldt";
  long long v44 = [NSNumber numberWithDouble:*((double *)this + 65)];
  v178 = v44;
  v112[66] = @"persistentState.Derivative.dQpdt";
  uint64_t v43 = [NSNumber numberWithDouble:*((double *)this + 66)];
  v179 = v43;
  v112[67] = @"persistentState.Derivative.dQpPhasedt";
  long long v42 = [NSNumber numberWithDouble:*((double *)this + 67)];
  v180 = v42;
  v112[68] = @"persistentState.Derivative.dQpAciddt";
  uint64_t v41 = [NSNumber numberWithDouble:*((double *)this + 68)];
  v181 = v41;
  v112[69] = @"persistentState.Derivative.dQpCrackdt";
  long long v40 = [NSNumber numberWithDouble:*((double *)this + 69)];
  v182 = v40;
  v112[70] = @"persistentState.Derivative.dQndt";
  uint64_t v39 = [NSNumber numberWithDouble:*((double *)this + 70)];
  v183 = v39;
  v112[71] = @"persistentState.Derivative.dQLidt";
  uint64_t v38 = [NSNumber numberWithDouble:*((double *)this + 71)];
  v184 = v38;
  v112[72] = @"persistentState.Derivative.JSEI";
  long long v37 = [NSNumber numberWithDouble:*((double *)this + 72)];
  v185 = v37;
  v112[73] = @"persistentState.Derivative.dWRadt";
  long long v36 = [NSNumber numberWithDouble:*((double *)this + 73)];
  v186 = v36;
  v112[74] = @"persistentState.Derivative.dWRcdt";
  long long v35 = [NSNumber numberWithDouble:*((double *)this + 74)];
  v187 = v35;
  v112[75] = @"persistentState.DynamicConfiguration.SOCBiasCorrection";
  long long v34 = [NSNumber numberWithDouble:*((double *)this + 75)];
  v188 = v34;
  v112[76] = @"persistentState.DynamicConfiguration.voltageChargeLimit";
  long long v33 = [NSNumber numberWithDouble:*((double *)this + 76)];
  v189 = v33;
  v112[77] = @"persistentState.Statistics.sleepStatistics[0]";
  uint64_t v32 = [NSNumber numberWithUnsignedLong:*((void *)this + 77)];
  v190 = v32;
  v112[78] = @"persistentState.Statistics.sleepStatistics[1]";
  uint64_t v31 = [NSNumber numberWithUnsignedLong:*((void *)this + 78)];
  uint64_t v191 = v31;
  v112[79] = @"persistentState.Statistics.sleepStatistics[2]";
  long long v30 = [NSNumber numberWithUnsignedLong:*((void *)this + 79)];
  v192 = v30;
  v112[80] = @"persistentState.Statistics.sleepStatistics[3]";
  uint64_t v29 = [NSNumber numberWithUnsignedLong:*((void *)this + 80)];
  uint64_t v193 = v29;
  v112[81] = @"persistentState.Statistics.sleepStatistics[4]";
  uint64_t v28 = [NSNumber numberWithUnsignedLong:*((void *)this + 81)];
  v194 = v28;
  v112[82] = @"persistentState.Statistics.sleepStatistics[5]";
  uint64_t v27 = [NSNumber numberWithUnsignedLong:*((void *)this + 82)];
  v195 = v27;
  v112[83] = @"persistentState.Status.mPreviousAlgoStatus";
  double v26 = [NSNumber numberWithInteger:*((int *)this + 166)];
  v196 = v26;
  v112[84] = @"persistentState.Status.mCurrentAlgoStatus";
  uint64_t v25 = [NSNumber numberWithInteger:*((int *)this + 167)];
  v197 = v25;
  v112[85] = @"persistentState.Status.mCurrentDataError";
  double v24 = [NSNumber numberWithInteger:*((int *)this + 168)];
  v198 = v24;
  v112[86] = @"persistentState.Status.mBuffer";
  uint64_t v23 = [NSNumber numberWithInteger:*((int *)this + 169)];
  v199 = v23;
  v112[87] = @"persistentState.Status.mInitType";
  uint64_t v109 = [NSNumber numberWithInteger:*((unsigned int *)this + 170)];
  v200 = v109;
  v112[88] = @"persistentState.Status.mFreshInitReason";
  unint64_t v10 = [NSNumber numberWithInteger:*((unsigned int *)this + 171)];
  v201 = v10;
  v112[89] = @"persistentState.Status.mSystemSignal.batteryAuthentication";
  unint64_t v11 = [NSNumber numberWithBool:*((unsigned __int8 *)this + 688)];
  v202 = v11;
  v112[90] = @"persistentState.Status.mSystemSignal.batteryReplacement";
  unint64_t v12 = [NSNumber numberWithBool:*((unsigned __int8 *)this + 689)];
  v203 = v12;
  v112[91] = @"persistentState.Status.mSystemSignal.batteryReplacementDate";
  BOOL v13 = (void *)((char *)this + 696);
  if (*((char *)this + 719) < 0) {
    BOOL v13 = (void *)*v13;
  }
  uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, objc_msgSend(NSString, "defaultCStringEncoding"));
  v204 = v14;
  v112[92] = @"persistentState.Status.mSystemSignal.time";
  uint64_t v15 = [NSNumber numberWithUnsignedLong:*((void *)this + 90)];
  v205 = v15;
  v112[93] = @"persistentState.Status.mSystemSignal.version";
  BOOL v16 = [NSNumber numberWithUnsignedLong:*((void *)this + 91)];
  v206 = v16;
  v112[94] = @"persistentState.Status.mSystemSignal.batteryInfo";
  BOOL v17 = (void *)((char *)this + 736);
  if (*((char *)this + 759) < 0) {
    BOOL v17 = (void *)*v17;
  }
  int v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, objc_msgSend(NSString, "defaultCStringEncoding"));
  v207 = v18;
  v112[95] = @"persistentState.AlgorithmInitialized";
  uint64_t v19 = [NSNumber numberWithBool:*((unsigned __int8 *)this + 784)];
  v208 = v19;
  v112[96] = @"persistentState.ParameterVersion";
  double v20 = [NSNumber numberWithUnsignedLong:*((void *)this + 99)];
  v209 = v20;
  v112[97] = @"persistentState.BatteryStateHistory";
  v210 = v111;
  id v22 = [NSDictionary dictionaryWithObjects:&v113 forKeys:v112 count:98];

  return v22;
}

void sub_248B64864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41,void *a42,void *a43,void *a44,void *a45,void *a46,void *a47,void *a48,void *a49,void *a50,void *a51,void *a52,void *a53,void *a54,void *a55,void *a56,void *a57,void *a58,void *a59,void *a60,void *a61,void *a62,void *a63)
{
  _Unwind_Resume(a1);
}

id deep_copy_object(objc_object *a1)
{
  uint64_t v1 = [MEMORY[0x263F08910] archivedDataWithRootObject:a1];
  id v2 = [MEMORY[0x263F08928] unarchiveObjectWithData:v1];

  return v2;
}

void sub_248B64F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ACAMSerialization::Serialization::createCoreAnalyticsFromACAM(ACAMSerialization::Serialization *this, const ACAM *a2, uint64_t a3, double *a4)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  ACAMLogger::extractDaily(this, a4, (uint64_t)v4);
}

void sub_248B65244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_248B65614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::locale a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  _Unwind_Resume(a1);
}

void *std::endl[abi:ne180100]<char,std::char_traits<char>>(void *a1)
{
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
  id v2 = std::locale::use_facet(&v4, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

void sub_248B6578C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

BOOL ACAMSerialization::Deserialization::isBetween(ACAMSerialization::Deserialization *this, NSNumber *a2, NSNumber *a3, NSNumber *a4)
{
  uint64_t v6 = this;
  uint64_t v7 = a2;
  uint64_t v8 = a3;
  unint64_t v9 = [MEMORY[0x263EFF9D0] null];
  char v10 = [(ACAMSerialization::Deserialization *)v6 isEqual:v9];

  BOOL v12 = (v10 & 1) == 0
     && ([(ACAMSerialization::Deserialization *)v6 doubleValue],
         (v11 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
     && ([(ACAMSerialization::Deserialization *)v6 doubleValue],
         [(ACAMSerialization::Deserialization *)v6 compare:v7] != -1)
     && [(ACAMSerialization::Deserialization *)v6 compare:v8] != 1;

  return v12;
}

void sub_248B65A00(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

double ACAMSerialization::convertTeqIntoScalar(ACAMSerialization *this, NSString *a2, const double *a3)
{
  std::locale v4 = this;
  id v5 = objc_alloc_init(MEMORY[0x263EFF990]);
  unint64_t v6 = 0;
  __str[2] = 0;
  uint64_t v7 = 1;
  while (v6 < (unint64_t)[(ACAMSerialization *)v4 length] >> 1)
  {
    __str[0] = [(ACAMSerialization *)v4 characterAtIndex:v7 - 1];
    __str[1] = [(ACAMSerialization *)v4 characterAtIndex:v7];
    char v18 = 0;
    char v18 = strtol(__str, 0, 16);
    [v5 appendBytes:&v18 length:1];
    ++v6;
    v7 += 2;
  }
  id v8 = v5;
  unint64_t v9 = (int *)[v8 bytes];
  unint64_t v10 = [v8 length];
  double v11 = 0.0;
  if (v10 >= 4)
  {
    unint64_t v12 = v10 >> 2;
    do
    {
      int v13 = *v9++;
      double v14 = (double)v13;
      double v15 = *(double *)a2++;
      double v11 = v11 + v14 * v15;
      --v12;
    }
    while (v12);
  }
  double v16 = v11 / 100.0;

  return v16;
}

void sub_248B65B50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::string::basic_string[abi:ne180100](void *__dst, void *__src, size_t __len)
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
    unint64_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *long long __dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    unint64_t v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void __clang_call_terminate(void *a1)
{
}

void ACAMUtility::ACAMParameterPack::ACAMParameterPack(uint64_t a1, ACAMUtility *this, int a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = xmmword_248B6AAD0;
  *(_OWORD *)(a1 + 88) = unk_248B6ACA0;
  *(_OWORD *)(a1 + 104) = xmmword_248B6ACB0;
  *(void *)(a1 + 64) = 0x3FF4CCCCCCCCCCCDLL;
  *(_OWORD *)(a1 + 120) = unk_248B6ACC0;
  *(_OWORD *)(a1 + 136) = xmmword_248B6ACD0;
  *(_OWORD *)(a1 + 72) = xmmword_248B6AC90;
  *(_OWORD *)(a1 + 152) = xmmword_248B6AAE0;
  *(_OWORD *)(a1 + 168) = xmmword_248B6AAF0;
  *(int64x2_t *)(a1 + 184) = vdupq_n_s64(0x3F9999999999999AuLL);
  *(int64x2_t *)(a1 + 200) = vdupq_n_s64(6uLL);
  *(int64x2_t *)(a1 + 216) = vdupq_n_s64(0xAuLL);
  *(int64x2_t *)(a1 + 232) = vdupq_n_s64(0x3F76872B020C49BAuLL);
  *(_OWORD *)(a1 + 248) = xmmword_248B6AB00;
  *(void *)(a1 + 264) = 0x405E000000000000;
  *(_OWORD *)(a1 + 272) = xmmword_248B6AB10;
  *(_OWORD *)(a1 + 288) = xmmword_248B6AB20;
  *(_OWORD *)(a1 + 304) = xmmword_248B6AB30;
  *(void *)(a1 + 320) = 0x3FE6666666666666;
  *(_OWORD *)(a1 + 328) = xmmword_248B6ACE0;
  *(_OWORD *)(a1 + 344) = unk_248B6ACF0;
  *(_OWORD *)(a1 + 360) = xmmword_248B6AD00;
  *(void *)(a1 + 376) = 0x40AC200000000000;
  *(_OWORD *)(a1 + 384) = xmmword_248B6AB40;
  *(_OWORD *)(a1 + 400) = xmmword_248B6AB50;
  *(void *)(a1 + 416) = 1000;
  *(void *)(a1 + 424) = 0x3F50624DD2F1A9FCLL;
  *(_OWORD *)(a1 + 432) = xmmword_248B6AB60;
  *(_OWORD *)(a1 + 448) = xmmword_248B6AB70;
  int64x2_t v3 = vdupq_n_s64(1uLL);
  *(int64x2_t *)(a1 + 464) = v3;
  *(int64x2_t *)(a1 + 480) = v3;
  *(int64x2_t *)(a1 + 496) = v3;
  *(void *)(a1 + 512) = 1;
  *(void *)(a1 + 520) = 0x3EC77CF44765195FLL;
  *(_OWORD *)(a1 + 528) = xmmword_248B6AB80;
  *(_OWORD *)(a1 + 544) = xmmword_248B6AB90;
  *(int64x2_t *)(a1 + 560) = vdupq_n_s64(0x3EFD5C31593E5FB7uLL);
  *(_OWORD *)(a1 + 576) = xmmword_248B6ABA0;
  *(void *)(a1 + 592) = 0x4034000000000000;
  *(unsigned char *)(a1 + 600) = 1;
  *(_OWORD *)(a1 + 608) = xmmword_248B6ABB0;
  *(_OWORD *)(a1 + 624) = xmmword_248B6ABC0;
  *(_OWORD *)(a1 + 640) = xmmword_248B6ABD0;
  *(_OWORD *)(a1 + 656) = xmmword_248B6ABE0;
  *(_OWORD *)(a1 + 672) = xmmword_248B6ABF0;
  *(int64x2_t *)(a1 + 688) = vdupq_n_s64(0x3FE999999999999AuLL);
  *(_OWORD *)(a1 + 704) = xmmword_248B6AC00;
  *(_OWORD *)(a1 + 720) = xmmword_248B6AC10;
  *(_OWORD *)(a1 + 736) = xmmword_248B6AC10;
  *(_OWORD *)(a1 + 752) = xmmword_248B6AC10;
  *(void *)(a1 + 768) = 0x4034000000000000;
  if (*((char *)this + 23) < 0) {
    this = *(ACAMUtility **)this;
  }
  int v4 = ACAMUtility::string_hash(this, 0, a3);
  if (v4 > -1404478093)
  {
    if (v4 > -1404472590)
    {
      if (v4 > -911129380)
      {
        if (v4 == -911129379) {
          operator new();
        }
        if (v4 == 2072405230) {
          operator new();
        }
      }
      else
      {
        if (v4 == -1404472589) {
          operator new();
        }
        if (v4 == -911133867) {
          operator new();
        }
      }
    }
    else if (v4 > -1404476550)
    {
      if (v4 == -1404476549) {
        operator new();
      }
      if (v4 == -1404472622) {
        operator new();
      }
    }
    else
    {
      if (v4 == -1404478092) {
        operator new();
      }
      if (v4 == -1404476900) {
        operator new();
      }
    }
  }
  else if (v4 > -1546430196)
  {
    if (v4 > -1404482094)
    {
      if (v4 == -1404482093) {
        operator new();
      }
      if (v4 == -1404478187) {
        operator new();
      }
    }
    else
    {
      if (v4 == -1546430195) {
        operator new();
      }
      if (v4 == -1404482316) {
        operator new();
      }
    }
  }
  else if (v4 > -1546433661)
  {
    if (v4 == -1546433660) {
      operator new();
    }
    if (v4 == -1546433627) {
      operator new();
    }
  }
  else
  {
    if (v4 == -1546437851) {
      operator new();
    }
    if (v4 == -1546437566) {
      operator new();
    }
  }
  id v5 = std::operator<<[abi:ne180100]<std::char_traits<char>>(MEMORY[0x263F8C100], "Unrecognized Program\n");
  std::endl[abi:ne180100]<char,std::char_traits<char>>(v5);
  exit(1);
}

void sub_248B674F0(_Unwind_Exception *a1)
{
  MEMORY[0x24C58C0C0](v1, 0x10C0C407B3330CALL);
  _Unwind_Resume(a1);
}

uint64_t ACAMUtility::string_hash(ACAMUtility *this, const char *a2, int a3)
{
  if (*((unsigned char *)this + (int)a2)) {
    return (33 * ACAMUtility::string_hash(this, (const char *)(a2 + 1), a3)) ^ *((char *)this + (int)a2);
  }
  else {
    return 5381;
  }
}

void *std::operator<<[abi:ne180100]<std::char_traits<char>>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);

  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)__s, v4);
}

void ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(uint64_t a1, double *a2, double *a3, double *a4, double *a5, double *a6)
{
  *(unsigned char *)(a1 + 120) = 0;
  *(void *)(a1 + 192) = 0;
  *(void *)(a1 + 200) = 0;
  *(unsigned char *)(a1 + 208) = 0;
  *(void *)(a1 + 216) = 0;
  *(void *)(a1 + 224) = 0;
  *(unsigned char *)(a1 + 232) = 0;
  *(void *)(a1 + 272) = 0;
  *(void *)(a1 + 280) = 0;
  *(unsigned char *)(a1 + 288) = 0;
  *(void *)(a1 + 328) = 0;
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  *(unsigned char *)(a1 + 152) = 0;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 160) = 0;
  *(void *)(a1 + 168) = 0;
  *(unsigned char *)(a1 + 184) = 0;
  *(void *)(a1 + 176) = 0;
  *(void *)(a1 + 304) = 0;
  *(void *)(a1 + 312) = 0;
  *(void *)(a1 + 296) = 0;
  *(unsigned char *)(a1 + 320) = 0;
  *(_OWORD *)(a1 + 16) = xmmword_248B6AC20;
  *(_OWORD *)(a1 + 32) = xmmword_248B6AC30;
  *(_OWORD *)(a1 + 48) = xmmword_248B6AC40;
  *(_OWORD *)(a1 + 64) = xmmword_248B6AC50;
  *(_OWORD *)(a1 + 80) = xmmword_248B6AC60;
  *(void *)(a1 + 96) = 22981;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  BOOL v6 = *a2 > a2[200];
  *(void *)(a1 + 104) = a2;
  *(void *)(a1 + 112) = 201;
  *(unsigned char *)(a1 + 120) = v6;
  BOOL v7 = *a3 > a3[148];
  *(void *)(a1 + 128) = a2 + 201;
  *(void *)(a1 + 136) = a3;
  *(void *)(a1 + 144) = 149;
  *(unsigned char *)(a1 + 152) = v7;
  BOOL v8 = *a4 > a4[2];
  *(void *)(a1 + 160) = a3 + 149;
  *(void *)(a1 + 168) = a4;
  *(void *)(a1 + 176) = 3;
  *(unsigned char *)(a1 + 184) = v8;
  BOOL v9 = *a5 > a5[15];
  *(void *)(a1 + 192) = a5;
  *(void *)(a1 + 200) = 16;
  *(unsigned char *)(a1 + 208) = v9;
  BOOL v10 = *a6 > a6[1];
  *(void *)(a1 + 216) = a6;
  *(void *)(a1 + 224) = 2;
  *(unsigned char *)(a1 + 232) = v10;
  operator new[]();
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24C58C040](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      BOOL v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
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
  MEMORY[0x24C58C050](v13);
  return a1;
}

void sub_248B67BB4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x24C58C050](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x248B67B94);
}

void sub_248B67C08(_Unwind_Exception *a1)
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
      int v13 = v18 >= 0 ? __p : (void **)__p[0];
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

void sub_248B67D88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

void ACAMUtility::ACAMParameterPack::~ACAMParameterPack(ACAMPerformanceModelParameter **this)
{
  id v2 = *this;
  if (v2)
  {
    ACAMPerformanceModelParameter::~ACAMPerformanceModelParameter(v2);
    MEMORY[0x24C58C0C0]();
  }
  int64x2_t v3 = this[1];
  if (v3) {
    MEMORY[0x24C58C0C0](v3, 0x1000C403BB0EBA7);
  }
  size_t v4 = this[2];
  if (v4) {
    MEMORY[0x24C58C0C0](v4, 0x1000C4003173957);
  }
  id v5 = this[3];
  if (v5) {
    MEMORY[0x24C58C0C0](v5, 0x1000C400A747E1ELL);
  }
  uint64_t v6 = this[4];
  if (v6) {
    MEMORY[0x24C58C0C0](v6, 0x1000C40400E7B01);
  }
}

std::string *std::pair<std::string const,std::set<unsigned long>>::pair[abi:ne180100]<true,0>(std::string *this, long long *a2, uint64_t a3)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  std::set<unsigned long>::set[abi:ne180100]((uint64_t *)&this[1], a3);
  return this;
}

void sub_248B67F64(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::set<unsigned long>::set[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::set<unsigned long>::insert[abi:ne180100]<std::__tree_const_iterator<unsigned long,std::__tree_node<unsigned long,void *> *,long>>(a1, *(void **)a2, (void *)(a2 + 8));
  return a1;
}

void sub_248B67FC0(_Unwind_Exception *a1)
{
  std::__tree<unsigned long>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::set<unsigned long>::insert[abi:ne180100]<std::__tree_const_iterator<unsigned long,std::__tree_node<unsigned long,void *> *,long>>(uint64_t *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    size_t v4 = a2;
    long long v5 = (uint64_t **)result;
    uint64_t v6 = result + 1;
    do
    {
      uint64_t result = std::__tree<unsigned long>::__emplace_hint_unique_key_args<unsigned long,unsigned long const&>(v5, v6, v4 + 4, v4 + 4);
      size_t v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          size_t v8 = v7;
          size_t v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          size_t v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          size_t v4 = v8;
        }
        while (!v9);
      }
      size_t v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<unsigned long>::__emplace_hint_unique_key_args<unsigned long,unsigned long const&>(uint64_t **a1, void *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t v6 = (uint64_t **)std::__tree<unsigned long>::__find_equal<unsigned long>(a1, a2, &v11, &v10, a3);
  size_t v7 = *v6;
  if (!*v6)
  {
    size_t v8 = v6;
    size_t v7 = (uint64_t *)operator new(0x28uLL);
    v7[4] = *a4;
    std::__tree<unsigned long>::__insert_node_at(a1, v11, v8, v7);
  }
  return v7;
}

void *std::__tree<unsigned long>::__find_equal<unsigned long>(void *a1, void *a2, void *a3, void *a4, unint64_t *a5)
{
  long long v5 = a1 + 1;
  if (a1 + 1 == a2 || (unint64_t v6 = *a5, v7 = a2[4], *a5 < v7))
  {
    uint64_t v8 = *a2;
    if ((void *)*a1 == a2)
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
      BOOL v9 = (void *)*a2;
      do
      {
        uint64_t v10 = v9;
        BOOL v9 = (void *)v9[1];
      }
      while (v9);
    }
    else
    {
      int v13 = a2;
      do
      {
        uint64_t v10 = (void *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        int v13 = v10;
      }
      while (v14);
    }
    unint64_t v15 = *a5;
    if (v10[4] < *a5) {
      goto LABEL_17;
    }
    double v16 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          BOOL v17 = v16;
          unint64_t v18 = v16[4];
          if (v15 >= v18) {
            break;
          }
          double v16 = (void *)*v17;
          long long v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        long long v5 = v17 + 1;
        double v16 = (void *)v17[1];
      }
      while (v16);
    }
    else
    {
      BOOL v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    int64_t v12 = (void *)a2[1];
    do
    {
      a4 = v12;
      int64_t v12 = (void *)*v12;
    }
    while (v12);
  }
  else
  {
    uint64_t v19 = a2;
    do
    {
      a4 = (void *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      uint64_t v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    double v20 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          double v21 = v20;
          unint64_t v22 = v20[4];
          if (v6 >= v22) {
            break;
          }
          double v20 = (void *)*v21;
          long long v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        long long v5 = v21 + 1;
        double v20 = (void *)v21[1];
      }
      while (v20);
    }
    else
    {
      double v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

uint64_t *std::__tree<unsigned long>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  long long v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      id v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      int64x2_t v3 = (uint64_t *)v2[2];
      size_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), long long v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            BOOL v9 = (uint64_t **)a2[2];
          }
          else
          {
            BOOL v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int64x2_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *BOOL v9 = v2;
            v2[2] = (uint64_t)v9;
            int64x2_t v3 = v9[2];
            id v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), long long v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *id v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int64x2_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int64x2_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        id v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *id v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *long long v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::__tree<unsigned long>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<unsigned long>::destroy(a1, *a2);
    std::__tree<unsigned long>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t std::unordered_map<std::string,double>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 32 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,double> const&>(a1, a2, (uint64_t)a2);
      a2 += 32;
      v5 -= 32;
    }
    while (v5);
  }
  return a1;
}

void sub_248B6853C(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,double> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v7 = (void *)(a1 + 24);
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v10) {
        unint64_t v3 = v8 % v10;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }
    uint64_t v13 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10) {
              v15 %= v10;
            }
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__construct_node_hash<std::pair<std::string const,double> const&>(a1, v9, a3, (uint64_t)v25);
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
    std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__rehash<true>(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  unint64_t v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    void *v22 = v25[0];
  }
  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_248B687AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,double>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

double std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__construct_node_hash<std::pair<std::string const,double> const&>@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x30uLL);
  *(void *)(a4 + 8) = v7;
  *(void *)a4 = v8;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = (std::string *)(v8 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((void *)v8 + 4) = *(void *)(a3 + 16);
  }
  double result = *(double *)(a3 + 24);
  *((double *)v8 + 5) = result;
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_248B68860(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,double>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      unint64_t v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
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
      int v11 = (void *)*v7;
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
            *int v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            int v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          int v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    int v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,double>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__deallocate_node(int a1, void **__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      uint64_t v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26524ED48, MEMORY[0x263F8C068]);
}

void sub_248B6914C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::find<std::string>(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  int v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  int v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v6 == v13)
      {
        if (std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      int v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

uint64_t *std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v6 = a1 + 1;
  int8x8_t v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        unint64_t v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        int8x8_t v5 = *v8;
        unint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      int8x8_t v5 = v8[1];
      if (!v5)
      {
        unint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    unint64_t v8 = a1 + 1;
LABEL_10:
    int v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<unsigned long>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

void std::vector<OBCData>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<OBCData>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<SBCData>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(40 * a2);
}

void *simpleList<ACAMPersistentStates>::clear(void *result)
{
  uint64_t v1 = result;
  uint64_t v2 = *result;
  if (*result)
  {
    do
    {
      uint64_t v3 = *(void *)(v2 + 800);
      uint64_t v4 = *(void *)(v2 + 760);
      if (v4)
      {
        do
        {
          uint64_t v5 = *(void *)(v4 + 40);
          MEMORY[0x24C58C0C0]();
          uint64_t v4 = v5;
        }
        while (v5);
      }
      *(void *)(v2 + 760) = 0;
      *(void *)(v2 + 768) = 0;
      *(void *)(v2 + 776) = 0;
      if (*(char *)(v2 + 759) < 0) {
        operator delete(*(void **)(v2 + 736));
      }
      if (*(char *)(v2 + 719) < 0) {
        operator delete(*(void **)(v2 + 696));
      }
      uint64_t result = (void *)MEMORY[0x24C58C0C0](v2, 0x1032C40A1A9FC8BLL);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  *uint64_t v1 = 0;
  v1[1] = 0;
  v1[2] = 0;
  return result;
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
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::vector<std::vector<SmartBatteryData>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<SmartBatteryData>>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::vector<SmartBatteryData>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      unint64_t v6 = *(void **)(v4 - 24);
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

uint64_t std::unordered_map<std::string,std::set<unsigned long>>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 48 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::set<unsigned long>> const&>(a1, a2, (long long *)a2);
      a2 += 48;
      v5 -= 48;
    }
    while (v5);
  }
  return a1;
}

void sub_248B69664(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::set<unsigned long>> const&>(uint64_t a1, unsigned __int8 *a2, long long *a3)
{
  uint64_t v7 = (void *)(a1 + 24);
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v10) {
        unint64_t v3 = v8 % v10;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }
    unint64_t v13 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10) {
              v15 %= v10;
            }
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::__construct_node_hash<std::pair<std::string const,std::set<unsigned long>> const&>(a1, v9, a3, (uint64_t)v25);
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
    std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__rehash<true>(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  unint64_t v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    void *v22 = v25[0];
  }
  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v25[0];
  v25[0] = 0;
  ++*v7;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::set<unsigned long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::set<unsigned long>>,void *>>>>::reset[abi:ne180100]((uint64_t)v25, 0);
  return i;
}

void sub_248B698E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::set<unsigned long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::set<unsigned long>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::__construct_node_hash<std::pair<std::string const,std::set<unsigned long>> const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x40uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  uint64_t result = std::pair<std::string const,std::set<unsigned long>>::pair[abi:ne180100]((std::string *)(v8 + 16), a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_248B6995C(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::set<unsigned long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::set<unsigned long>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,std::set<unsigned long>>::pair[abi:ne180100](std::string *this, long long *a2)
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
  std::set<unsigned long>::set[abi:ne180100]((uint64_t *)&this[1], (uint64_t)a2 + 24);
  return this;
}

void sub_248B699D0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::set<unsigned long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::set<unsigned long>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::set<unsigned long>>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::set<unsigned long>>,0>(uint64_t a1)
{
  std::__tree<unsigned long>::destroy(a1 + 24, *(void **)(a1 + 32));
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      unint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::set<unsigned long>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::vector<std::vector<SmartBatteryData>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<SmartBatteryData>>,std::reverse_iterator<std::vector<SmartBatteryData>*>,std::reverse_iterator<std::vector<SmartBatteryData>*>,std::reverse_iterator<std::vector<SmartBatteryData>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<SmartBatteryData>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<SmartBatteryData>>,std::reverse_iterator<std::vector<SmartBatteryData>*>,std::reverse_iterator<std::vector<SmartBatteryData>*>,std::reverse_iterator<std::vector<SmartBatteryData>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
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
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<SmartBatteryData>>,std::reverse_iterator<std::vector<SmartBatteryData>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<SmartBatteryData>>,std::reverse_iterator<std::vector<SmartBatteryData>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<SmartBatteryData>>,std::reverse_iterator<std::vector<SmartBatteryData>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<SmartBatteryData>>,std::reverse_iterator<std::vector<SmartBatteryData>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    unint64_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<SmartBatteryData>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<SmartBatteryData>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
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

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::find<std::string>(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  unint64_t v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  uint8x8_t v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v13 == v6)
      {
        if (std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      uint8x8_t v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t std::unordered_map<std::string,BOOL>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 32 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,BOOL> const&>(a1, a2, (uint64_t)a2);
      a2 += 32;
      v5 -= 32;
    }
    while (v5);
  }
  return a1;
}

void sub_248B69EF8(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,BOOL> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint8x8_t v7 = (void *)(a1 + 24);
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v10) {
        unint64_t v3 = v8 % v10;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }
    unint64_t v13 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10) {
              v15 %= v10;
            }
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__construct_node_hash<std::pair<std::string const,BOOL> const&>(a1, v9, a3, (uint64_t)v25);
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
    std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__rehash<true>(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  unint64_t v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    void *v22 = v25[0];
  }
  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_248B6A168(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,double>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__construct_node_hash<std::pair<std::string const,BOOL> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x30uLL);
  *(void *)(a4 + 8) = v7;
  *(void *)a4 = v8;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = (std::string *)(v8 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((void *)v8 + 4) = *(void *)(a3 + 16);
  }
  v8[40] = *(unsigned char *)(a3 + 24);
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_248B6A21C(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,double>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void OnDeviceACAMUtility::createRuntimeOptions()
{
  *(_WORD *)long long v0 = 0;
  _os_log_error_impl(&dword_248B51000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to alloc defaults for OnDeviceACAM", v0, 2u);
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

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F98568](this, __c);
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

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x270EDA0B0](__x);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}