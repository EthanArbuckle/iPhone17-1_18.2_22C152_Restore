@interface ASTUILinearMatrixCalibrationStrategy
- (CGPoint)calibratedGazePointForGazePoint:(CGPoint)a3;
- (id)calibratedArrayForGazePoint:(CGPoint)a3;
- (id)learnCalibrationForPoints:(id)a3;
@end

@implementation ASTUILinearMatrixCalibrationStrategy

- (id)calibratedArrayForGazePoint:(CGPoint)a3
{
  v3 = objc_opt_new();
  return v3;
}

- (CGPoint)calibratedGazePointForGazePoint:(CGPoint)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  float x = a3.x;
  float y = a3.y;
  __A[0] = x;
  __A[1] = y;
  __A[2] = 1.0;
  v5 = -[ASTUILinearMatrixCalibrationStrategy calibratedArrayForGazePoint:](self, "calibratedArrayForGazePoint:");
  for (uint64_t i = 0; i != 6; ++i)
  {
    v7 = [v5 objectAtIndexedSubscript:i];
    [v7 floatValue];
    __B[i] = v8;
  }
  vDSP_mmul(__A, 1, __B, 1, __C, 1, 1uLL, 2uLL, 3uLL);
  float v9 = __C[0];
  float v10 = __C[1];

  double v11 = v9;
  double v12 = v10;
  result.float y = v12;
  result.float x = v11;
  return result;
}

- (id)learnCalibrationForPoints:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_0];
  v4 = [v3 allKeys];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __66__ASTUILinearMatrixCalibrationStrategy_learnCalibrationForPoints___block_invoke_2;
  v53[3] = &unk_26523EF08;
  id v43 = v3;
  id v54 = v43;
  v5 = objc_msgSend(v4, "ax_mappedArrayUsingBlock:", v53);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v50 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v49 + 1) + 8 * i) CGPointValue];
        double v13 = v12;
        v14 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v6 addObject:v14];

        v15 = [NSNumber numberWithDouble:v13];
        [v6 addObject:v15];

        [v6 addObject:&unk_26FC83D80];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v9);
  }

  uint64_t v16 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v17 = v4;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v46 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v45 + 1) + 8 * j) CGPointValue];
        double v23 = v22;
        v24 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v16 addObject:v24];

        v25 = [NSNumber numberWithDouble:v23];
        [v16 addObject:v25];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v19);
  }

  v42[1] = v42;
  v26 = (const float *)((char *)v42 - ((4 * [v6 count] + 15) & 0xFFFFFFFFFFFFFFF0));
  if ([v6 count])
  {
    unint64_t v27 = 0;
    do
    {
      v28 = [v6 objectAtIndexedSubscript:v27];
      [v28 floatValue];
      v26[v27] = v29;

      ++v27;
    }
    while ([v6 count] > v27);
  }
  v30 = (const float *)((char *)v42 - ((4 * [v16 count] + 15) & 0xFFFFFFFFFFFFFFF0));
  if ([v16 count])
  {
    unint64_t v31 = 0;
    do
    {
      v32 = [v16 objectAtIndexedSubscript:v31];
      [v32 floatValue];
      v30[v31] = v33;

      ++v31;
    }
    while ([v16 count] > v31);
  }
  v34 = (float *)((char *)v42 - ((4 * [v6 count] + 15) & 0xFFFFFFFFFFFFFFF0));
  vDSP_mtrans(v26, 1, v34, 1, 3uLL, [v7 count]);
  vDSP_mtrans(v30, 1, (float *)((char *)v42 - ((4 * [v16 count] + 15) & 0xFFFFFFFFFFFFFFF0)), 1, 2uLL, objc_msgSend(v17, "count"));
  vDSP_mmul(v34, 1, v26, 1, v57, 1, 3uLL, 3uLL, [v7 count]);
  vDSP_mmul(v34, 1, v30, 1, v56, 1, 3uLL, 2uLL, [v7 count]);
  uint64_t v44 = 3;
  v35 = (__CLPK_integer *)malloc_type_malloc(0xCuLL, 0x100004052888210uLL);
  v36 = (__CLPK_real *)malloc_type_malloc(0xCuLL, 0x100004052888210uLL);
  sgetrf_((__CLPK_integer *)&v44, (__CLPK_integer *)&v44, v57, (__CLPK_integer *)&v44, v35, (__CLPK_integer *)&v44 + 1);
  sgetri_((__CLPK_integer *)&v44, v57, (__CLPK_integer *)&v44, v35, v36, (__CLPK_integer *)&v44, (__CLPK_integer *)&v44 + 1);
  vDSP_mmul(v57, 1, v56, 1, v55, 1, 3uLL, 2uLL, 3uLL);
  v37 = [MEMORY[0x263EFF980] arrayWithCapacity:6];
  for (uint64_t k = 0; k != 6; ++k)
  {
    *(float *)&double v38 = v55[k];
    v40 = [NSNumber numberWithFloat:v38];
    [v37 addObject:v40];
  }
  return v37;
}

uint64_t __66__ASTUILinearMatrixCalibrationStrategy_learnCalibrationForPoints___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

@end