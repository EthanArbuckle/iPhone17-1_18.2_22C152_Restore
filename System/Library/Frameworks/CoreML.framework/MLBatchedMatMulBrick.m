@interface MLBatchedMatMulBrick
- (BOOL)hasGPUSupport;
- (BOOL)shapeInfoNeeded;
- (MLBatchedMatMulBrick)initWithParameters:(id)a3;
- (NSArray)inputRanks;
- (NSArray)inputShapes;
- (NSArray)outputRanks;
- (NSArray)outputShapes;
- (NSNumber)transposeA;
- (NSNumber)transposeB;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLBatchedMatMulBrick

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputShapes, 0);
  objc_storeStrong((id *)&self->_inputShapes, 0);
  objc_storeStrong((id *)&self->_outputRanks, 0);
  objc_storeStrong((id *)&self->_inputRanks, 0);
  objc_storeStrong((id *)&self->_transposeB, 0);

  objc_storeStrong((id *)&self->_transposeA, 0);
}

- (NSArray)outputShapes
{
  return self->_outputShapes;
}

- (NSArray)inputShapes
{
  return self->_inputShapes;
}

- (NSArray)outputRanks
{
  return self->_outputRanks;
}

- (NSArray)inputRanks
{
  return self->_inputRanks;
}

- (NSNumber)transposeB
{
  return self->_transposeB;
}

- (NSNumber)transposeA
{
  return self->_transposeA;
}

- (BOOL)shapeInfoNeeded
{
  return self->_shapeInfoNeeded;
}

- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectAtIndexedSubscript:0];
  [v8 rawPointer];

  v9 = [v6 objectAtIndexedSubscript:1];
  [v9 rawPointer];

  v10 = [v7 objectAtIndexedSubscript:0];
  [v10 rawPointer];

  v11 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v78, [v11 unsignedIntegerValue]);

  v12 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:1];
  std::vector<unsigned long>::vector(&v76, [v12 unsignedIntegerValue]);

  v13 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v74, [v13 unsignedIntegerValue]);

  if (self->_shapeInfoNeeded)
  {
    v14 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v14, &v78);

    v15 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:1];
    EspressoBrickUtils::NSShape_to_VecShape(v15, &v76);
  }
  else
  {
    v16 = [v6 objectAtIndexedSubscript:0];
    v17 = [v16 shape];
    EspressoBrickUtils::EspressoShape_to_NDShape(v17, (uint64_t)&v78);

    v15 = [v6 objectAtIndexedSubscript:1];
    v18 = [v15 shape];
    EspressoBrickUtils::EspressoShape_to_NDShape(v18, (uint64_t)&v76);
  }
  v71 = 0;
  v72 = 0;
  uint64_t v73 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v71, v78, (uint64_t)v79, (v79 - (unsigned char *)v78) >> 3);
  int v19 = [(NSNumber *)self->_transposeA BOOLValue];
  v68 = 0;
  v69 = 0;
  unint64_t v70 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v68, v76, (uint64_t)v77, (v77 - (unsigned char *)v76) >> 3);
  int v20 = [(NSNumber *)self->_transposeB BOOLValue];
  v102 = 0;
  uint64_t v103 = 0;
  v101 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v101, v71, (uint64_t)v72, (v72 - (unsigned char *)v71) >> 3);
  v98 = 0;
  v99 = 0;
  uint64_t v100 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v98, v68, (uint64_t)v69, (v69 - (unsigned char *)v68) >> 3);
  BrickLayers::BatchedMatMulShapeComputation(&v101, v19, &v98, v20, &v74);
  if (v98)
  {
    v99 = v98;
    operator delete(v98);
  }
  if (v101)
  {
    v102 = v101;
    operator delete(v101);
  }
  if (v72 - (unsigned char *)v71 == 8)
  {
    uint64_t v94 = 1;
    std::vector<unsigned long>::insert((uint64_t)&v71, (char *)v71, &v94);
  }
  v22 = (char *)v68;
  v21 = v69;
  unint64_t v23 = (v69 - (unsigned char *)v68) >> 3;
  if (v69 - (unsigned char *)v68 == 8)
  {
    if ((unint64_t)v69 >= v70)
    {
      uint64_t v24 = v70 - (void)v68;
      if ((uint64_t)(v70 - (void)v68) >> 2 <= v23 + 1) {
        uint64_t v25 = v23 + 1;
      }
      else {
        uint64_t v25 = v24 >> 2;
      }
      if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v26 = v25;
      }
      v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v70, v26);
      v28 = (char *)v68;
      v29 = v69;
      v30 = &v27[8 * v23];
      v32 = &v27[8 * v31];
      *(void *)v30 = 1;
      v21 = v30 + 8;
      while (v29 != v28)
      {
        uint64_t v33 = *((void *)v29 - 1);
        v29 -= 8;
        *((void *)v30 - 1) = v33;
        v30 -= 8;
      }
      v68 = v30;
      v69 = v21;
      unint64_t v70 = (unint64_t)v32;
      if (v28) {
        operator delete(v28);
      }
    }
    else
    {
      *(void *)v69 = 1;
      v21 += 8;
    }
    v69 = v21;
    v22 = (char *)v68;
    unint64_t v23 = (v21 - (unsigned char *)v68) >> 3;
  }
  v64 = v71;
  v65 = v72;
  uint64_t v34 = v72 - (unsigned char *)v71;
  v36 = v74;
  v35 = v75;
  uint64_t v37 = -2;
  if (v19) {
    uint64_t v38 = -1;
  }
  else {
    uint64_t v38 = -2;
  }
  uint64_t v67 = *((void *)v71 + v38 + (v34 >> 3));
  if (!v20) {
    uint64_t v37 = -1;
  }
  uint64_t v66 = *(void *)&v22[8 * v23 + 8 * v37];
  unint64_t v39 = v34 >> 3;
  uint64_t v96 = 0;
  uint64_t v97 = 0;
  std::vector<unsigned long>::vector(&v94, v34 >> 3);
  v61 = v7;
  std::vector<unsigned long>::vector(&v92, v23);
  std::vector<unsigned long>::vector(&v90, v39);
  std::vector<unsigned long>::vector(&v88, v23);
  unint64_t v40 = ((char *)v35 - v36) >> 3;
  std::vector<unsigned long>::vector(&v86, v40);
  v41 = (uint64_t *)v74;
  unint64_t v42 = 1;
  while (v41 != v75)
  {
    uint64_t v43 = *v41++;
    v42 *= v43;
  }
  TensorAlgebraUtils::computeStrides((uint64_t)v71, (uint64_t)v72, v94, v95);
  TensorAlgebraUtils::computeStrides((uint64_t)v68, (uint64_t)v69, (uint64_t)v92, (uint64_t)v93);
  if (v42)
  {
    unint64_t v44 = 0;
    unint64_t v45 = v39;
    unint64_t v46 = v40 - v39;
    unint64_t v47 = v40 - v23;
    if (v45 <= 1) {
      uint64_t v48 = 1;
    }
    else {
      uint64_t v48 = v45;
    }
    if (v23 <= 1) {
      uint64_t v49 = 1;
    }
    else {
      uint64_t v49 = v23;
    }
    uint64_t v62 = v49;
    uint64_t v63 = v48;
    do
    {
      TensorAlgebraUtils::unravel_index(v44, (uint64_t)v74, (uint64_t)v75, (unint64_t *)v86, (uint64_t)v87);
      v50 = (char *)v86;
      v51 = (char *)v86 + 8 * v46;
      if (v87 != v51)
      {
        memmove(v90, v51, v87 - v51);
        v50 = (char *)v86;
        v51 = v87;
      }
      v52 = &v50[8 * v47];
      if (v51 != v52) {
        memmove(v88, v52, v51 - v52);
      }
      if (v65 != v64)
      {
        v53 = (uint64_t *)v71;
        v54 = v90;
        uint64_t v55 = v63;
        do
        {
          uint64_t v56 = *v53++;
          if (v56 == 1) {
            void *v54 = 0;
          }
          ++v54;
          --v55;
        }
        while (v55);
      }
      if (v21 != v22)
      {
        v57 = (uint64_t *)v68;
        v58 = v88;
        uint64_t v59 = v62;
        do
        {
          uint64_t v60 = *v57++;
          if (v60 == 1) {
            void *v58 = 0;
          }
          ++v58;
          --v59;
        }
        while (v59);
      }
      __p = 0;
      v84 = 0;
      uint64_t v85 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, (const void *)v94, v95, (v95 - v94) >> 3);
      TensorAlgebraUtils::ravel_multi_index((uint64_t *)v90, v91, (uint64_t)v71, (uint64_t)v72, (uint64_t *)__p, &v97);
      if (__p)
      {
        v84 = __p;
        operator delete(__p);
      }
      v80 = 0;
      v81 = 0;
      uint64_t v82 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v80, v92, (uint64_t)v93, (v93 - (unsigned char *)v92) >> 3);
      TensorAlgebraUtils::ravel_multi_index((uint64_t *)v88, v89, (uint64_t)v68, (uint64_t)v69, (uint64_t *)v80, &v96);
      if (v80)
      {
        v81 = v80;
        operator delete(v80);
      }
      cblas_sgemm_NEWLAPACK();
      v44 += v66 * v67;
    }
    while (v44 < v42);
  }
  if (v86)
  {
    v87 = (char *)v86;
    operator delete(v86);
  }
  if (v88)
  {
    uint64_t v89 = (uint64_t)v88;
    operator delete(v88);
  }
  if (v90)
  {
    uint64_t v91 = (uint64_t)v90;
    operator delete(v90);
  }
  if (v92)
  {
    v93 = v92;
    operator delete(v92);
  }
  if (v94)
  {
    uint64_t v95 = v94;
    operator delete((void *)v94);
  }
  if (v68)
  {
    v69 = (char *)v68;
    operator delete(v68);
  }
  if (v71)
  {
    v72 = v71;
    operator delete(v71);
  }
  if (v74)
  {
    v75 = (uint64_t *)v74;
    operator delete(v74);
  }
  if (v76)
  {
    v77 = v76;
    operator delete(v76);
  }
  if (v78)
  {
    v79 = v78;
    operator delete(v78);
  }
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (MLBatchedMatMulBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MLBatchedMatMulBrick;
  v5 = [(MLBatchedMatMulBrick *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"inputRanks"];
    inputRanks = v5->_inputRanks;
    v5->_inputRanks = (NSArray *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"outputRanks"];
    outputRanks = v5->_outputRanks;
    v5->_outputRanks = (NSArray *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"inputShapes"];
    inputShapes = v5->_inputShapes;
    v5->_inputShapes = (NSArray *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"outputShapes"];
    outputShapes = v5->_outputShapes;
    v5->_outputShapes = (NSArray *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"transposeA"];
    transposeA = v5->_transposeA;
    v5->_transposeA = (NSNumber *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"transposeB"];
    transposeB = v5->_transposeB;
    v5->_transposeB = (NSNumber *)v16;

    unsigned int v18 = 0;
    v5->_shapeInfoNeeded = 0;
    while ([(NSArray *)v5->_inputRanks count] > v18)
    {
      int v19 = [(NSArray *)v5->_inputRanks objectAtIndexedSubscript:v18];
      uint64_t v20 = [v19 integerValue];

      if (v20 >= 6) {
        v5->_shapeInfoNeeded = 1;
      }
      ++v18;
    }
    for (unsigned int i = 0; [(NSArray *)v5->_outputRanks count] > i; ++i)
    {
      v22 = [(NSArray *)v5->_outputRanks objectAtIndexedSubscript:i];
      uint64_t v23 = [v22 integerValue];

      if (v23 >= 6) {
        v5->_shapeInfoNeeded = 1;
      }
    }
  }

  return v5;
}

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F611E8]);
  uint64_t v8 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(v25, [v8 unsignedIntegerValue]);

  if (self->_shapeInfoNeeded)
  {
    v9 = [(NSArray *)self->_outputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v9, v25);
  }
  else
  {
    uint64_t v10 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
    std::vector<unsigned long>::vector(&v23, [v10 unsignedIntegerValue]);

    v11 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:1];
    std::vector<unsigned long>::vector(&v21, [v11 unsignedIntegerValue]);

    uint64_t v12 = [v5 objectAtIndexedSubscript:0];
    EspressoBrickUtils::EspressoShape_to_NDShape(v12, (uint64_t)&v23);

    v13 = [v5 objectAtIndexedSubscript:1];
    EspressoBrickUtils::EspressoShape_to_NDShape(v13, (uint64_t)&v21);

    unsigned int v18 = 0;
    int v19 = 0;
    uint64_t v20 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v18, v23, (uint64_t)v24, (v24 - (unsigned char *)v23) >> 3);
    LODWORD(v13) = [(NSNumber *)self->_transposeA BOOLValue];
    __p = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v21, (uint64_t)v22, (v22 - (unsigned char *)v21) >> 3);
    BrickLayers::BatchedMatMulShapeComputation((char **)&v18, (int)v13, (char **)&__p, [(NSNumber *)self->_transposeB BOOLValue], v25);
    if (__p)
    {
      uint64_t v16 = __p;
      operator delete(__p);
    }
    if (v18)
    {
      int v19 = v18;
      operator delete(v18);
    }
    if (v21)
    {
      v22 = v21;
      operator delete(v21);
    }
    if (v23)
    {
      uint64_t v24 = v23;
      operator delete(v23);
    }
  }
  EspressoBrickUtils::NDShape_to_EspressoShape(v25, v7);
  [v6 addObject:v7];
  if (v25[0])
  {
    v25[1] = v25[0];
    operator delete(v25[0]);
  }

  return v6;
}

@end