@interface CPUDrainOperation
- (CPUDrainOperation)initWithMatrixLength:(id)a3 iterationDelay:(id)a4;
- (NSNumber)iterationDelay;
- (NSNumber)matrixLength;
- (void)cancel;
- (void)main;
- (void)setIterationDelay:(id)a3;
- (void)setMatrixLength:(id)a3;
- (void)thermalSGEMMEnergyObjC;
@end

@implementation CPUDrainOperation

- (CPUDrainOperation)initWithMatrixLength:(id)a3 iterationDelay:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPUDrainOperation;
  v9 = [(CPUDrainOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_matrixLength, a3);
    objc_storeStrong((id *)&v10->_iterationDelay, a4);
  }

  return v10;
}

- (void)main
{
  [(CPUDrainOperation *)self thermalSGEMMEnergyObjC];
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10000D100((uint64_t)self, v3);
  }
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)CPUDrainOperation;
  [(DrainOperation *)&v2 cancel];
}

- (void)thermalSGEMMEnergyObjC
{
  v3 = [(CPUDrainOperation *)self matrixLength];
  id v4 = [v3 unsignedLongValue];

  int v5 = detect_cpu();
  unsigned int PhysicalCPUs = GetPhysicalCPUs();
  BOOL v8 = PhysicalCPUs < 3 && (unint64_t)v4 > 0x800;
  if (v5 != -1829029944 && v5 != 747742334 && v5 != 933271106)
  {
    v9 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000D22C(v9);
    }

    printBestThermalInfo();
  }
  v10 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = PhysicalCPUs;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Number of threads: %d", buf, 8u);
  }

  v11 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SGEMM Iterations = infinity.", buf, 2u);
  }

  uint64_t v47 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  *(_OWORD *)buf = 0u;
  ConstructRandom((uint64_t *)buf, 0);
  if (v8) {
    int __ldb = 2048;
  }
  else {
    int __ldb = (int)v4;
  }
  unint64_t v13 = (__ldb * __ldb);
  v14 = (const float *)malloc_type_malloc(4 * v13, 0x100004052888210uLL);
  __B = (float *)malloc_type_malloc(4 * v13, 0x100004052888210uLL);
  v16 = (float *)malloc_type_malloc(4 * v13 * PhysicalCPUs, 0x100004052888210uLL);
  v17 = v16;
  if (v14 && __B && v16)
  {
    __C = v16;
    if (__ldb)
    {
      uint64_t v18 = 0;
      if (v13 <= 1) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = (__ldb * __ldb);
      }
      uint64_t v20 = 4 * v13;
      v21 = v16;
      do
      {
        v14[v18] = (float)(UniformFloat((uint64_t *)buf) * 2.0) + -1.0;
        __B[v18] = (float)(UniformFloat((uint64_t *)buf) * 2.0) + -1.0;
        if (PhysicalCPUs)
        {
          v22 = v21;
          uint64_t v23 = PhysicalCPUs;
          do
          {
            float *v22 = 0.0;
            v22 = (float *)((char *)v22 + v20);
            --v23;
          }
          while (v23);
        }
        ++v18;
        ++v21;
      }
      while (v18 != v19);
    }
    if ([(DrainOperation *)self isFinished])
    {
      v24 = __C;
    }
    else
    {
      do
      {
        cblas_sgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, __ldb, __ldb, __ldb, 1.0, v14, __ldb, __B, __ldb, 0.0, __C, __ldb);
        v26 = [(CPUDrainOperation *)self iterationDelay];
        id v27 = [v26 unsignedIntegerValue];

        if (v27)
        {
          v28 = [(CPUDrainOperation *)self iterationDelay];
          usleep(1000 * [v28 unsignedIntValue]);
        }
        [(DrainOperation *)self waitIfPaused];
      }
      while (![(DrainOperation *)self isFinished]);
      v24 = __C;
    }
    v17 = (float *)v14;
  }
  else
  {
    v25 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10000D198(v25);
    }

    v24 = (void *)v14;
  }
  free(v24);
  free(__B);
  free(v17);
}

- (NSNumber)matrixLength
{
  return self->_matrixLength;
}

- (void)setMatrixLength:(id)a3
{
}

- (NSNumber)iterationDelay
{
  return self->_iterationDelay;
}

- (void)setIterationDelay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterationDelay, 0);

  objc_storeStrong((id *)&self->_matrixLength, 0);
}

@end