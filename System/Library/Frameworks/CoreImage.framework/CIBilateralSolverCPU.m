@interface CIBilateralSolverCPU
+ (void)_computeAx:(id)a3 A:(const float *)a4 Dn:(const float *)a5 lambda:(float)a6 x:(const float *)a7 output:(float *)a8;
- (BOOL)useTrilinearInterpolation;
- (CIBilateralSolverCPU)initWithWidth:(int)a3 height:(int)a4 maxVertices:(unint64_t)a5;
- (int)doSolveWithBilateralGridhash:(id)a3 reference:(__IOSurface *)a4 disparity:(__CVBuffer *)a5 confidence:(__CVBuffer *)a6 output:(__CVBuffer *)a7 lambda:(float)a8 maxIterations:(int)a9;
- (void)_doBistochastize:(id)a3 nIterations:(int)a4;
- (void)_doSolve:(id)a3 t:(const __CVBuffer *)a4 c:(const __CVBuffer *)a5 x:(float *)a6 lambda:(float)a7 pcgMaxIterations:(int)a8;
- (void)_pcg:(id)a3 A:(const float *)a4 lambda:(float)a5 b:(const float *)a6 x:(float *)a7 M:(const float *)a8 tol:(float)a9 maxIterations:(int)a10;
- (void)dealloc;
- (void)setUseTrilinearInterpolation:(BOOL)a3;
@end

@implementation CIBilateralSolverCPU

- (CIBilateralSolverCPU)initWithWidth:(int)a3 height:(int)a4 maxVertices:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CIBilateralSolverCPU;
  v8 = [(CIBilateralSolverCPU *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_useTrilinearInterpolation = 1;
    v8->_width = a3;
    v8->_height = a4;
    v8->_maxVertices = a5;
    size_t v10 = 4 * a5;
    v8->_Dn_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_Dm_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_A_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_b_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_x_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_M_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_Sc_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_q_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_r_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_d_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
  }
  return v9;
}

- (void)dealloc
{
  free(self->_Dn_buf);
  free(self->_Dm_buf);
  free(self->_A_buf);
  free(self->_b_buf);
  free(self->_x_buf);
  free(self->_M_buf);
  free(self->_Sc_buf);
  free(self->_q_buf);
  free(self->_r_buf);
  free(self->_d_buf);
  v3.receiver = self;
  v3.super_class = (Class)CIBilateralSolverCPU;
  [(CIBilateralSolverCPU *)&v3 dealloc];
}

- (int)doSolveWithBilateralGridhash:(id)a3 reference:(__IOSurface *)a4 disparity:(__CVBuffer *)a5 confidence:(__CVBuffer *)a6 output:(__CVBuffer *)a7 lambda:(float)a8 maxIterations:(int)a9
{
  uint64_t v9 = *(void *)&a9;
  id v16 = a3;
  [(CIBilateralSolverCPU *)self _doBistochastize:v16 nIterations:10];
  *(float *)&double v17 = a8;
  [(CIBilateralSolverCPU *)self _doSolve:v16 t:a5 c:a6 x:self->_x_buf lambda:v9 pcgMaxIterations:v17];
  if (self->_useTrilinearInterpolation) {
    objc_msgSend(v16, "slice_trilinear:pin:pout:", a4, self->_x_buf, a7);
  }
  else {
    [v16 slice:self->_x_buf outPixelBuffer:a7];
  }

  return 0;
}

- (void)_doBistochastize:(id)a3 nIterations:(int)a4
{
  id v21 = a3;
  int v6 = [v21 countVertices];
  objc_msgSend(v21, "splat_ones:", self->_Dm_buf);
  if (v6 >= 1) {
    memset_pattern16(self->_Dn_buf, &unk_19394C9C0, 4 * v6);
  }
  if (a4 >= 1)
  {
    int v7 = 1;
    do
    {
      [v21 blur:self->_Dn_buf pout:self->_q_buf];
      if (v6 >= 1)
      {
        uint64_t v8 = 0;
        q_buf = self->_q_buf;
        Dn_buf = self->_Dn_buf;
        do
        {
          float v11 = q_buf[v8];
          float v12 = 0.0;
          if (v11 > 0.0) {
            float v12 = sqrtf((float)(Dn_buf[v8] * self->_Dm_buf[v8]) / v11);
          }
          Dn_buf[v8++] = v12;
        }
        while (v6 != v8);
      }
    }
    while (v7++ != a4);
  }
  [v21 blur:self->_Dn_buf pout:self->_q_buf];
  if (v6 >= 1)
  {
    v14 = self->_q_buf;
    uint64_t v15 = v6;
    id v16 = self->_Dn_buf;
    Dm_buf = self->_Dm_buf;
    do
    {
      float v18 = *v16++;
      float v19 = v18;
      float v20 = *v14++;
      *Dm_buf++ = v19 * v20;
      --v15;
    }
    while (v15);
  }
}

- (void)_doSolve:(id)a3 t:(const __CVBuffer *)a4 c:(const __CVBuffer *)a5 x:(float *)a6 lambda:(float)a7 pcgMaxIterations:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  id v37 = a3;
  int v14 = [v37 countVertices];
  int v15 = [v37 countDims];
  if (v14 <= 0)
  {
    [v37 splat:a5 pout:self->_Sc_buf];
    objc_msgSend(v37, "splat_w_mul_x:inPixelBuffer:pout:", a5, a4, self->_b_buf);
  }
  else
  {
    Dn_buf = self->_Dn_buf;
    Dm_buf = self->_Dm_buf;
    A_buf = self->_A_buf;
    uint64_t v19 = v14;
    do
    {
      float v20 = *Dn_buf++;
      float v21 = v20;
      float v22 = v20 * (float)(2 * v15);
      float v23 = *Dm_buf++;
      *A_buf++ = v23 - (float)(v21 * v22);
      --v19;
    }
    while (v19);
    [v37 splat:a5 pout:self->_Sc_buf];
    v24 = self->_A_buf;
    M_buf = self->_M_buf;
    Sc_buf = self->_Sc_buf;
    LODWORD(v27) = 1.0;
    uint64_t v28 = v14;
    do
    {
      float v29 = *Sc_buf++;
      float v30 = v29 + (float)(a7 * *v24);
      *v24++ = v30;
      if (v30 >= 0.00001) {
        float v31 = 1.0 / v30;
      }
      else {
        float v31 = 100000.0;
      }
      *M_buf++ = v31;
      --v28;
    }
    while (v28);
    objc_msgSend(v37, "splat_w_mul_x:inPixelBuffer:pout:", a5, a4, self->_b_buf, v27);
    uint64_t v34 = 0;
    v35 = self->_Sc_buf;
    do
    {
      float v36 = v35[v34];
      if (v36 == 0.0) {
        double v32 = 0.0;
      }
      else {
        *(float *)&double v32 = self->_b_buf[v34] / v36;
      }
      a6[v34++] = *(float *)&v32;
    }
    while (v14 != v34);
  }
  LODWORD(v33) = 925353388;
  *(float *)&double v32 = a7;
  [(CIBilateralSolverCPU *)self _pcg:v37 A:self->_A_buf lambda:self->_b_buf b:a6 x:self->_M_buf M:v8 tol:v32 maxIterations:v33];
}

+ (void)_computeAx:(id)a3 A:(const float *)a4 Dn:(const float *)a5 lambda:(float)a6 x:(const float *)a7 output:(float *)a8
{
  id v13 = a3;
  int v14 = [v13 countVertices];
  if (v14 >= 1)
  {
    uint64_t v15 = 0;
    float v16 = -a6;
    uint64_t v17 = v14;
    do
    {
      float v18 = a4[v15] * a7[v15];
      int v22 = 0;
      uint64_t v19 = (int *)objc_msgSend(v13, "blur_indices:n_blur_indices:", v15, &v22);
      uint64_t v20 = v22;
      if (v22 >= 1)
      {
        do
        {
          int v21 = *v19++;
          float v18 = v18 + (float)(a7[v21] * (float)((float)(a5[v21] * a5[v15]) * v16));
          --v20;
        }
        while (v20);
      }
      a8[v15++] = v18;
    }
    while (v15 != v17);
  }
}

- (void)_pcg:(id)a3 A:(const float *)a4 lambda:(float)a5 b:(const float *)a6 x:(float *)a7 M:(const float *)a8 tol:(float)a9 maxIterations:(int)a10
{
  id v62 = a3;
  int v18 = [v62 countVertices];
  *(float *)&double v19 = a5;
  +[CIBilateralSolverCPU _computeAx:v62 A:a4 Dn:self->_Dn_buf lambda:a7 x:self->_r_buf output:v19];
  if (v18 < 1)
  {
    float v24 = 0.0;
  }
  else
  {
    r_buf = self->_r_buf;
    d_buf = self->_d_buf;
    uint64_t v23 = v18;
    float v24 = 0.0;
    v25 = a8;
    do
    {
      float v26 = *a6++;
      float v27 = v26 - *r_buf;
      float v28 = *v25++;
      float v24 = v24 + (float)(v27 * (float)(v28 * v27));
      *r_buf++ = v27;
      *d_buf++ = v28 * v27;
      --v23;
    }
    while (v23);
  }
  if (a10 >= 1)
  {
    int v29 = 1;
    do
    {
      *(float *)&double v20 = a5;
      +[CIBilateralSolverCPU _computeAx:v62 A:a4 Dn:self->_Dn_buf lambda:self->_d_buf x:self->_q_buf output:v20];
      if (v18 < 1)
      {
        float v41 = 0.0;
      }
      else
      {
        float v30 = self->_d_buf;
        q_buf = self->_q_buf;
        float v32 = 0.0;
        uint64_t v33 = v18;
        do
        {
          float v34 = *v30++;
          float v35 = v34;
          float v36 = *q_buf++;
          float v32 = v32 + (float)(v35 * v36);
          --v33;
        }
        while (v33);
        float v37 = v24 / v32;
        v39 = self->_r_buf;
        v38 = self->_d_buf;
        v40 = self->_q_buf;
        float v41 = 0.0;
        uint64_t v42 = v18;
        v43 = a7;
        do
        {
          float v44 = *v38++;
          float v45 = *v43 + (float)(v37 * v44);
          float v46 = *v40++;
          float v47 = *v39 + (float)((float)-v37 * v46);
          *v43++ = v45;
          *v39++ = v47;
          float v41 = v41 + (float)(v47 * v47);
          --v42;
        }
        while (v42);
      }
      if (sqrtf(v41) < a9) {
        break;
      }
      if (v18 < 1)
      {
        double v20 = 0.0;
      }
      else
      {
        v48 = self->_r_buf;
        double v20 = 0.0;
        uint64_t v49 = v18;
        v50 = a8;
        do
        {
          float v51 = *v48++;
          float v52 = v51;
          float v53 = *v50++;
          *(float *)&double v20 = *(float *)&v20 + (float)(v52 * (float)(v52 * v53));
          --v49;
        }
        while (v49);
        v54 = self->_r_buf;
        v55 = self->_d_buf;
        uint64_t v56 = v18;
        v57 = a8;
        do
        {
          float v58 = *v57++;
          float v59 = v58;
          float v60 = *v54++;
          float *v55 = (float)(v59 * v60) + (float)((float)(*(float *)&v20 / v24) * *v55);
          ++v55;
          --v56;
        }
        while (v56);
      }
      float v24 = *(float *)&v20;
    }
    while (v29++ != a10);
  }
}

- (BOOL)useTrilinearInterpolation
{
  return self->_useTrilinearInterpolation;
}

- (void)setUseTrilinearInterpolation:(BOOL)a3
{
  self->_useTrilinearInterpolation = a3;
}

@end