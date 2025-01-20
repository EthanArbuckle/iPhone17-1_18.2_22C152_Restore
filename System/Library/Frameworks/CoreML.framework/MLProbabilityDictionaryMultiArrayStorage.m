@interface MLProbabilityDictionaryMultiArrayStorage
- (MLProbabilityDictionaryMultiArrayStorage)initWithMultiArray:(id)a3;
- (id)probabilityAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)maxElementIndex;
@end

@implementation MLProbabilityDictionaryMultiArrayStorage

- (void).cxx_destruct
{
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)maxElementIndex
{
  unint64_t v3 = [(MLProbabilityDictionaryMultiArrayStorage *)self count];
  unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3)
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2020000000;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    multiArray = self->_multiArray;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__MLProbabilityDictionaryMultiArrayStorage_maxElementIndex__block_invoke;
    v7[3] = &unk_1E59A53B8;
    v7[4] = self;
    v7[5] = &v8;
    v7[6] = v3;
    [(MLMultiArray *)multiArray getBytesWithHandler:v7];
    unint64_t v4 = v9[3];
    _Block_object_dispose(&v8, 8);
  }
  return v4;
}

void __59__MLProbabilityDictionaryMultiArrayStorage_maxElementIndex__block_invoke(void *a1, uint64_t a2)
{
  unint64_t v4 = [MLMultiArrayBufferLayout alloc];
  v5 = [*(id *)(a1[4] + 8) shape];
  v6 = [*(id *)(a1[4] + 8) strides];
  v50 = [(MLMultiArrayBufferLayout *)v4 initWithShape:v5 strides:v6];

  if ([*(id *)(a1[4] + 8) dataType] == 65552)
  {
    uint64_t v7 = a1[6];
    uint64_t v8 = v50;
    if (v7 >= 1)
    {
      v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      LOWORD(v12) = 0;
      do
      {
        unint64_t v51 = 0;
        uint64_t v13 = -[MLMultiArrayBufferLayout offsetOfScalarAtIndex:contiguousScalars:](v9, "offsetOfScalarAtIndex:contiguousScalars:", v10, &v51, v50);
        v14 = (short float *)(a2 + 2 * v13);
        if (v51 >= 2)
        {
          v16 = v14 + 1;
          short float v17 = *v14;
          uint64_t v18 = 2 * v51 - 2;
          v15 = (short float *)(a2 + 2 * v13);
          v19 = v14 + 1;
          do
          {
            short float v20 = *v19++;
            short float v21 = v20;
            if (v17 < v20)
            {
              short float v17 = v21;
              v15 = v16;
            }
            v16 = v19;
            v18 -= 2;
          }
          while (v18);
        }
        else
        {
          v15 = (short float *)(a2 + 2 * v13);
        }
        uint64_t v22 = v15 - v14;
        if (*v15 > v12)
        {
          uint64_t v11 = v22;
          short float v12 = *v15;
        }
        v10 += v51;
      }
      while (v10 < v7);
      goto LABEL_40;
    }
LABEL_39:
    uint64_t v11 = 0;
    goto LABEL_40;
  }
  uint64_t v23 = [*(id *)(a1[4] + 8) dataType];
  uint64_t v24 = a1[6];
  v25 = v50;
  if (v23 == 65568)
  {
    if (v24 < 1) {
      goto LABEL_39;
    }
    uint64_t v26 = 0;
    uint64_t v11 = 0;
    float v27 = 1.1755e-38;
    do
    {
      unint64_t v51 = 0;
      uint64_t v28 = -[MLMultiArrayBufferLayout offsetOfScalarAtIndex:contiguousScalars:](v25, "offsetOfScalarAtIndex:contiguousScalars:", v26, &v51, v50);
      v29 = (float *)(a2 + 4 * v28);
      if (v51 >= 2)
      {
        v31 = v29 + 1;
        float v32 = *v29;
        uint64_t v33 = 4 * v51 - 4;
        v30 = (float *)(a2 + 4 * v28);
        v34 = v29 + 1;
        do
        {
          float v35 = *v34++;
          float v36 = v35;
          if (v32 < v35)
          {
            float v32 = v36;
            v30 = v31;
          }
          v31 = v34;
          v33 -= 4;
        }
        while (v33);
      }
      else
      {
        v30 = (float *)(a2 + 4 * v28);
      }
      uint64_t v37 = v30 - v29;
      if (*v30 > v27)
      {
        uint64_t v11 = v37;
        float v27 = *v30;
      }
      v26 += v51;
    }
    while (v26 < v24);
  }
  else
  {
    if (v24 < 1) {
      goto LABEL_39;
    }
    uint64_t v38 = 0;
    uint64_t v11 = 0;
    double v39 = 2.22507386e-308;
    do
    {
      unint64_t v51 = 0;
      uint64_t v40 = -[MLMultiArrayBufferLayout offsetOfScalarAtIndex:contiguousScalars:](v25, "offsetOfScalarAtIndex:contiguousScalars:", v38, &v51, v50);
      v41 = (double *)(a2 + 8 * v40);
      if (v51 >= 2)
      {
        v43 = v41 + 1;
        double v44 = *v41;
        uint64_t v45 = 8 * v51 - 8;
        v42 = (double *)(a2 + 8 * v40);
        v46 = v41 + 1;
        do
        {
          double v47 = *v46++;
          double v48 = v47;
          if (v44 < v47)
          {
            double v44 = v48;
            v42 = v43;
          }
          v43 = v46;
          v45 -= 8;
        }
        while (v45);
      }
      else
      {
        v42 = (double *)(a2 + 8 * v40);
      }
      uint64_t v49 = v42 - v41;
      if (*v42 > v39)
      {
        uint64_t v11 = v49;
        double v39 = *v42;
      }
      v38 += v51;
    }
    while (v38 < v24);
  }
LABEL_40:

  *(void *)(*(void *)(a1[5] + 8) + 24) = v11;
}

- (id)probabilityAtIndex:(unint64_t)a3
{
  if ([(MLProbabilityDictionaryMultiArrayStorage *)self count] <= a3) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"Probability index %tu is out of range because there are only %tu classes.", a3, -[MLProbabilityDictionaryMultiArrayStorage count](self, "count"));
  }
  multiArray = self->_multiArray;

  return [(MLMultiArray *)multiArray objectAtIndexedSubscript:a3];
}

- (MLProbabilityDictionaryMultiArrayStorage)initWithMultiArray:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MLProbabilityDictionaryMultiArrayStorage;
  v6 = [(MLProbabilityDictionaryMultiArrayStorage *)&v8 init];
  if (v6)
  {
    if ([v5 dataType] != 65552
      && [v5 dataType] != 65568
      && [v5 dataType] != 65600)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"class probability multiArray must use Float16, Float32 or Float64 scalars." format];
    }
    objc_storeStrong((id *)&v6->_multiArray, a3);
    v6->_count = [v5 count];
  }

  return v6;
}

@end