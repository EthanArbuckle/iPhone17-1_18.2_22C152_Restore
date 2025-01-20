@interface VCPVideoFacePoseFilter
- (id).cxx_construct;
- (int)eulerAnglesToRotation:(float)a3[3] R:(float)a4[3][3];
- (int)filteringPose:(id *)a3;
- (int)kalmanFiltering:(float)a3[3] T:(float)a4[3];
- (int)rotationToEulerAngles:(float)a3[3][3] angles:(float)a4[3];
- (void)reset;
@end

@implementation VCPVideoFacePoseFilter

- (int)rotationToEulerAngles:(float)a3[3][3] angles:(float)a4[3]
{
  a4[2] = 0.0;
  *(void *)a4 = 0;
  float v6 = asinf((*a3)[6]);
  a4[1] = -v6;
  float v7 = cosf(v6);
  if (v7 == 0.0)
  {
    a4[2] = 0.0;
    float v9 = (*a3)[1];
    if ((*a3)[6] >= 0.0)
    {
      float v9 = -v9;
      float v10 = -(*a3)[5];
    }
    else
    {
      float v10 = (*a3)[5];
    }
    *a4 = atan2f(v9, v10);
  }
  else
  {
    float v8 = v7;
    *a4 = atan2f((*a3)[7] / v7, (*a3)[8] / v7);
    a4[2] = atan2f((*a3)[3] / v8, (*a3)[0] / v8);
  }
  return 0;
}

- (int)eulerAnglesToRotation:(float)a3[3] R:(float)a4[3][3]
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v22[1] = (void *)16;
  memptr[0] = 0;
  malloc_type_posix_memalign(memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  float v6 = (char *)memptr[0];
  v22[0] = memptr[0];
  v22[2] = (void *)0x300000003;
  *(void *)((char *)memptr[0] + 12) = 0;
  *(void *)(v6 + 4) = 0;
  *(void *)(v6 + 20) = 0;
  *(void *)(v6 + 28) = 0x3F80000000000000;
  *(_DWORD *)float v6 = 1065353216;
  *((_DWORD *)v6 + 4) = 1065353216;
  v21[1] = (void *)16;
  memptr[0] = 0;
  malloc_type_posix_memalign(memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  float v7 = (char *)memptr[0];
  v21[0] = memptr[0];
  v21[2] = (void *)0x300000003;
  *(void *)((char *)memptr[0] + 12) = 0;
  *(void *)(v7 + 4) = 0;
  *(void *)(v7 + 20) = 0;
  *(void *)(v7 + 28) = 0x3F80000000000000;
  *(_DWORD *)float v7 = 1065353216;
  *((_DWORD *)v7 + 4) = 1065353216;
  v19[1] = (void *)16;
  memptr[0] = 0;
  malloc_type_posix_memalign(memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  float v8 = (char *)memptr[0];
  v19[0] = memptr[0];
  uint64_t v20 = 0x300000003;
  *(void *)((char *)memptr[0] + 12) = 0;
  *(void *)(v8 + 4) = 0;
  *(void *)(v8 + 20) = 0;
  *(void *)(v8 + 28) = 0x3F80000000000000;
  *(_DWORD *)float v8 = 1065353216;
  *((_DWORD *)v8 + 4) = 1065353216;
  *((float *)v6 + 4) = cosf(*a3);
  *((float *)v6 + 7) = -sinf(*a3);
  *((float *)v6 + 5) = sinf(*a3);
  *((float *)v6 + 8) = cosf(*a3);
  *(float *)float v7 = cosf(a3[1]);
  *((float *)v7 + 6) = sinf(a3[1]);
  *((float *)v7 + 2) = -sinf(a3[1]);
  *((float *)v7 + 8) = cosf(a3[1]);
  *(float *)float v8 = cosf(a3[2]);
  *((float *)v8 + 3) = -sinf(a3[2]);
  *((float *)v8 + 1) = sinf(a3[2]);
  *((float *)v8 + 4) = cosf(a3[2]);
  v15[0] = v19;
  v15[1] = v21;
  v16[1] = (void *)16;
  memptr[0] = 0;
  malloc_type_posix_memalign(memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v16[0] = memptr[0];
  int v17 = v20;
  int v18 = 3;
  memptr[1] = v15;
  memptr[2] = v22;
  int v24 = 1065353216;
  cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>>,cva::Matrix<float,0u,0u,false>>((uint64_t)v16, (uint64_t)memptr);
  uint64_t v9 = 0;
  int v10 = v17;
  v11 = (float *)v16[0];
  do
  {
    unsigned int v12 = 0;
    for (uint64_t i = 0; i != 3; ++i)
    {
      (*a4)[i] = v11[v9 + v12];
      v12 += v10;
    }
    ++v9;
    ++a4;
  }
  while (v9 != 3);
  free(v11);
  free(v19[0]);
  free(v21[0]);
  free(v22[0]);
  return 0;
}

- (int)kalmanFiltering:(float)a3[3] T:(float)a4[3]
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  uint64_t v84 = *(void *)a4;
  int v85 = *((_DWORD *)a4 + 2);
  uint64_t v86 = *(void *)a3;
  int v87 = *((_DWORD *)a3 + 2);
  v82[1] = (void *)144;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x240uLL, 0x49090899uLL);
  float v7 = memptr;
  v82[0] = memptr;
  uint64_t v83 = 0xC0000000CLL;
  bzero(memptr, 0x240uLL);
  for (uint64_t i = 0; i != 156; i += 13)
    v7[i] = 1065353216;
  v7[36] = 1022739087;
  v7[114] = 1022739087;
  v7[49] = 1022739087;
  v7[127] = 1022739087;
  v7[62] = 1022739087;
  v7[140] = 1022739087;
  v80[1] = (void *)72;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x120uLL, 0x49090899uLL);
  uint64_t v9 = memptr;
  v80[0] = memptr;
  uint64_t v81 = 0xC00000006;
  *(_OWORD *)((char *)memptr + 20) = 0u;
  *(_OWORD *)((char *)v9 + 36) = 0u;
  *(_OWORD *)((char *)v9 + 52) = 0u;
  *(_OWORD *)((char *)v9 + 68) = 0u;
  *(_OWORD *)((char *)v9 + 84) = 0u;
  *(_OWORD *)((char *)v9 + 100) = 0u;
  *(_OWORD *)((char *)v9 + 116) = 0u;
  *(_OWORD *)((char *)v9 + 132) = 0u;
  *(_OWORD *)((char *)v9 + 148) = 0u;
  *(_OWORD *)((char *)v9 + 164) = 0u;
  *(_OWORD *)((char *)v9 + 180) = 0u;
  *(_OWORD *)((char *)v9 + 196) = 0u;
  *(_OWORD *)((char *)v9 + 212) = 0u;
  *(_OWORD *)((char *)v9 + 228) = 0u;
  *(_OWORD *)((char *)v9 + 244) = 0u;
  v9[17] = 0u;
  *(_OWORD *)((char *)v9 + 4) = 0u;
  *(_OWORD *)((char *)v9 + 260) = 0u;
  *(_DWORD *)uint64_t v9 = 1065353216;
  *((_DWORD *)v9 + 39) = 1065353216;
  *((_DWORD *)v9 + 7) = 1065353216;
  *((_DWORD *)v9 + 46) = 1065353216;
  *((_DWORD *)v9 + 14) = 1065353216;
  *((_DWORD *)v9 + 53) = 1065353216;
  if (!self->_previousStateIsValid)
  {
    self->_previousState.m_data[0] = *a4;
    self->_previousState.m_data[1] = a4[1];
    self->_previousState.m_data[2] = a4[2];
    self->_previousState.m_data[6] = *a3;
    self->_previousState.m_data[7] = a3[1];
    self->_previousState.m_data[8] = a3[2];
    bzero(&self->_previousCovar, 0x240uLL);
  }
  size_t v10 = (4 * v83 + 31) & 0x7FFFFFFE0;
  v77[1] = (void *)(v10 >> 2);
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, v10, 0x49090899uLL);
  v77[0] = memptr;
  int v78 = v83;
  int v79 = 1;
  v99 = (float *)v82;
  p_previousState = &self->_previousState;
  LODWORD(v101) = 1065353216;
  cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,12u,1u,false>>((uint64_t)v77, (uint64_t)&memptr);
  v76[1] = (void *)144;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x240uLL, 0x49090899uLL);
  v11 = (char *)memptr;
  v76[0] = memptr;
  v76[2] = (void *)0xC0000000CLL;
  bzero(memptr, 0x240uLL);
  for (uint64_t j = 0; j != 624; j += 52)
    *(_DWORD *)&v11[j] = 1065353216;
  v88 = v82;
  p_previousCovar = &self->_previousCovar;
  v105 = v82;
  size_t v13 = (4 * (v83 * v83) + 31) & 0x7FFFFFFE0;
  v99 = 0;
  p_previousState = (Matrix<float, 12U, 1U, false> *)(v13 >> 2);
  v93 = 0;
  malloc_type_posix_memalign(&v93, 0x20uLL, v13, 0x49090899uLL);
  v99 = (float *)v93;
  int v14 = *((_DWORD *)v105 + 4);
  LODWORD(v101) = *((_DWORD *)v88 + 4);
  HIDWORD(v101) = v14;
  v94 = (float *)&v88;
  v95 = &v105;
  int v96 = 1065353216;
  cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::Matrix<float,0u,0u,false>,cva::Matrix<float,12u,12u,false>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>((uint64_t)&v99, (uint64_t)&v93);
  v102 = v76;
  size_t v15 = (4 * (HIDWORD(v101) * v101) + 31) & 0x7FFFFFFE0;
  v74[1] = (void *)(v15 >> 2);
  v93 = 0;
  malloc_type_posix_memalign(&v93, 0x20uLL, v15, 0x49090899uLL);
  v16 = (float *)v93;
  v74[0] = v93;
  v75 = v101;
  uint64_t v17 = (HIDWORD(v101) * v101);
  if (v17)
  {
    int v18 = v99;
    v19 = (float **)*v102;
    uint64_t v20 = 4 * v17;
    do
    {
      float v21 = *v18++;
      float v22 = v21;
      float v23 = *(float *)v19;
      v19 = (float **)((char *)v19 + 4);
      *v16++ = v22 + v23;
      v20 -= 4;
    }
    while (v20);
  }
  free(v99);
  v73[1] = (void *)40;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0xA0uLL, 0x49090899uLL);
  uint64_t v24 = 0;
  uint64_t v25 = memptr;
  v73[0] = memptr;
  v73[2] = (void *)0x600000006;
  *((_OWORD *)memptr + 2) = 0u;
  v25[3] = 0u;
  v25[4] = 0u;
  v25[5] = 0u;
  v25[6] = 0u;
  v25[7] = 0u;
  v25[8] = 0u;
  *uint64_t v25 = 0u;
  v25[1] = 0u;
  do
  {
    *(_DWORD *)((char *)v25 + v24) = 1065353216;
    v24 += 28;
  }
  while (v24 != 168);
  v88 = v80;
  p_previousCovar = v74;
  v70[0] = v80;
  v105 = v73;
  uint64_t v106 = 0x40000000;
  size_t v26 = (4 * (v81 * v81) + 31) & 0x7FFFFFFE0;
  v99 = 0;
  p_previousState = (Matrix<float, 12U, 1U, false> *)(v26 >> 2);
  v93 = 0;
  malloc_type_posix_memalign(&v93, 0x20uLL, v26, 0x49090899uLL);
  v99 = (float *)v93;
  LODWORD(v101) = *((_DWORD *)v88 + 4);
  HIDWORD(v101) = v81;
  v94 = (float *)&v88;
  v95 = v70;
  int v96 = 1065353216;
  cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>((uint64_t)&v99, (uint64_t)&v93);
  v102 = &v105;
  size_t v27 = (4 * (HIDWORD(v101) * v101) + 31) & 0x7FFFFFFE0;
  v72[0] = 0;
  v72[1] = (void *)(v27 >> 2);
  v93 = 0;
  malloc_type_posix_memalign(&v93, 0x20uLL, v27, 0x49090899uLL);
  v28 = (float *)v93;
  v72[0] = v93;
  v72[2] = v101;
  uint64_t v29 = (HIDWORD(v101) * v101);
  if (v29)
  {
    v30 = v102;
    v31 = v99;
    v32 = *(float **)*v102;
    uint64_t v33 = 4 * v29;
    do
    {
      float v34 = *v31++;
      float v35 = v34;
      float v36 = *v32++;
      *v28++ = v35 + (float)(v36 * *((float *)v30 + 2));
      v33 -= 4;
    }
    while (v33);
  }
  free(v99);
  v37 = (_DWORD *)cva::SVD<cva::Matrix<float,0u,0u,false>,true>::SVD<cva::Matrix<float,0u,0u,false>>((uint64_t)&memptr, v72, 3, 0);
  if (v104)
  {
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(v37, &-[VCPVideoFacePoseFilter kalmanFiltering:T:]::kThreshold, (uint64_t)v70);
    v105 = v80;
    v88 = v74;
    p_previousCovar = &v105;
    size_t v38 = (4 * (v71 * v75) + 31) & 0x7FFFFFFE0;
    v67[1] = (void *)(v38 >> 2);
    v93 = 0;
    malloc_type_posix_memalign(&v93, 0x20uLL, v38, 0x49090899uLL);
    v67[0] = v93;
    unsigned int v68 = *((_DWORD *)v88 + 4);
    int v69 = v71;
    v94 = (float *)&v88;
    v95 = v70;
    int v96 = 1065353216;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>,cva::Matrix<float,0u,0u,false>>((uint64_t)v67, (uint64_t)&v93);
    v88 = &v84;
    p_previousCovar = 0;
    size_t v39 = (4 * (v79 * v81) + 31) & 0x7FFFFFFE0;
    v90 = (void **)(v39 >> 2);
    v105 = 0;
    malloc_type_posix_memalign(&v105, 0x20uLL, v39, 0x49090899uLL);
    p_previousCovar = v105;
    int v91 = v81;
    int v92 = v79;
    uint64_t v106 = (uint64_t)v80;
    v107 = v77;
    int v108 = 1065353216;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>>((uint64_t)&p_previousCovar, (uint64_t)&v105);
    v93 = v77;
    v94 = 0;
    size_t v40 = (4 * v68 + 31) & 0x7FFFFFFE0;
    v95 = (void **)(v40 >> 2);
    v105 = 0;
    malloc_type_posix_memalign(&v105, 0x20uLL, v40, 0x49090899uLL);
    v94 = (float *)v105;
    int v96 = v68;
    uint64_t v106 = (uint64_t)v67;
    v107 = &v88;
    int v108 = 1065353216;
    cva::assign<false,false,cva::Matrix<float,0u,1u,false>,cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::Matrix<float,6u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>>,cva::detail::SubOp>>((uint64_t)&v94, (uint64_t)&v105);
    size_t v41 = (4 * (*((_DWORD *)v93 + 5) * *((_DWORD *)v93 + 4)) + 31) & 0x7FFFFFFE0;
    v105 = 0;
    malloc_type_posix_memalign(&v105, 0x20uLL, v41, 0x49090899uLL);
    v42 = (char *)v105;
    uint64_t v43 = (*((_DWORD *)v93 + 5) * *((_DWORD *)v93 + 4));
    if (v43)
    {
      v44 = v94;
      v45 = *(float **)v93;
      uint64_t v46 = 4 * v43;
      v47 = (float *)v105;
      do
      {
        float v48 = *v45++;
        float v49 = v48;
        float v50 = *v44++;
        *v47++ = v49 + v50;
        v46 -= 4;
      }
      while (v46);
    }
    free(v94);
    free(p_previousCovar);
    v105 = v67;
    uint64_t v106 = (uint64_t)v80;
    size_t v51 = (4 * HIDWORD(v75) * v68 + 31) & 0x7FFFFFFE0;
    v93 = v74;
    v95 = (void **)(v51 >> 2);
    v88 = 0;
    malloc_type_posix_memalign(&v88, 0x20uLL, v51, 0x49090899uLL);
    v94 = (float *)v88;
    int v96 = v68;
    int v97 = HIDWORD(v75);
    p_previousCovar = &v105;
    v90 = v74;
    int v91 = 1065353216;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>>,cva::Matrix<float,0u,0u,false>>((uint64_t)&v94, (uint64_t)&v88);
    size_t v52 = (4 * (*((_DWORD *)v93 + 5) * *((_DWORD *)v93 + 4)) + 31) & 0x7FFFFFFE0;
    v88 = 0;
    malloc_type_posix_memalign(&v88, 0x20uLL, v52, 0x49090899uLL);
    v53 = (char *)v88;
    uint64_t v54 = (*((_DWORD *)v93 + 5) * *((_DWORD *)v93 + 4));
    if (v54)
    {
      v55 = v94;
      v56 = *(float **)v93;
      uint64_t v57 = 4 * v54;
      v58 = (float *)v88;
      do
      {
        float v59 = *v56++;
        float v60 = v59;
        float v61 = *v55++;
        *v58++ = v60 - v61;
        v57 -= 4;
      }
      while (v57);
    }
    free(v94);
    for (uint64_t k = 0; k != 3; ++k)
    {
      a4[k] = *(float *)&v42[k * 4];
      a3[k] = *(float *)&v42[k * 4 + 24];
    }
    for (uint64_t m = 0; m != 12; ++m)
      self->_previousState.m_data[m] = *(float *)&v42[m * 4];
    for (uint64_t n = 0; n != 144; ++n)
      self->_previousCovar.m_data[n] = *(float *)&v53[n * 4];
    self->_previousStateIsValid = 1;
    free(v53);
    free(v42);
    free(v67[0]);
    free(v70[0]);
    int v65 = 0;
  }
  else
  {
    int v65 = -18;
  }
  free(v103);
  free(v101);
  free(memptr);
  free(v72[0]);
  free(v73[0]);
  free(v74[0]);
  free(v76[0]);
  free(v77[0]);
  free(v80[0]);
  free(v82[0]);
  return v65;
}

- (int)filteringPose:(id *)a3
{
  uint64_t v5 = 0;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v6 = *((_OWORD *)a3 + 3);
  float v7 = v19;
  do
  {
    uint64_t v8 = 0;
    long long v16 = v6;
    int v9 = *(_DWORD *)((unint64_t)&v16 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
    do
    {
      *(_DWORD *)&v7[4 * v8] = *((_DWORD *)a3 + 4 * v8 + (v5 & 3));
      ++v8;
    }
    while (v8 != 3);
    v18[v5++] = v9;
    v7 += 12;
  }
  while (v5 != 3);
  int result = -[VCPVideoFacePoseFilter rotationToEulerAngles:angles:](self, "rotationToEulerAngles:angles:", v19, v17, v16);
  if (!result)
  {
    int result = [(VCPVideoFacePoseFilter *)self kalmanFiltering:v17 T:v18];
    if (!result)
    {
      int result = [(VCPVideoFacePoseFilter *)self eulerAnglesToRotation:v17 R:v19];
      if (!result)
      {
        uint64_t v11 = 0;
        *((_OWORD *)a3 + 2) = 0u;
        *((_OWORD *)a3 + 3) = 0u;
        *(_OWORD *)a3 = 0u;
        *((_OWORD *)a3 + 1) = 0u;
        unsigned int v12 = v19;
        do
        {
          uint64_t v13 = 0;
          int v14 = v18[v11];
          do
          {
            size_t v15 = (char *)a3 + 4 * v11;
            *(_DWORD *)&v15[16 * v13] = *(_DWORD *)&v12[4 * v13];
            *((_DWORD *)v15 + 12) = v14;
            ++v13;
          }
          while (v13 != 3);
          ++v11;
          v12 += 12;
        }
        while (v11 != 3);
        return 0;
      }
    }
  }
  return result;
}

- (void)reset
{
  self->_previousStateIsValid = 0;
}

- (id).cxx_construct
{
  return self;
}

@end