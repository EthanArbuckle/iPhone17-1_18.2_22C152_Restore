@interface MLGatherBrick
- (BOOL)hasGPUSupport;
- (BOOL)shapeInfoNeeded;
- (MLGatherBrick)initWithParameters:(id)a3;
- (NSArray)inputRanks;
- (NSArray)inputShapes;
- (NSArray)outputRanks;
- (NSArray)outputShapes;
- (NSNumber)axis;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLGatherBrick

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputShapes, 0);
  objc_storeStrong((id *)&self->_inputShapes, 0);
  objc_storeStrong((id *)&self->_outputRanks, 0);
  objc_storeStrong((id *)&self->_inputRanks, 0);

  objc_storeStrong((id *)&self->_axis, 0);
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

- (NSNumber)axis
{
  return self->_axis;
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
  v10 = (const float *)[v9 rawPointer];

  v11 = [v7 objectAtIndexedSubscript:0];
  uint64_t v47 = [v11 rawPointer];

  v12 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v55, [v12 unsignedIntegerValue]);

  v13 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:1];
  std::vector<unsigned long>::vector(&v53, [v13 unsignedIntegerValue]);

  v14 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v51, [v14 unsignedIntegerValue]);

  if (self->_shapeInfoNeeded)
  {
    v15 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v15, &v55);

    v16 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:1];
    EspressoBrickUtils::NSShape_to_VecShape(v16, &v53);
  }
  else
  {
    v17 = [v6 objectAtIndexedSubscript:0];
    v18 = [v17 shape];
    EspressoBrickUtils::EspressoShape_to_NDShape(v18, (uint64_t)&v55);

    v16 = [v6 objectAtIndexedSubscript:1];
    v19 = [v16 shape];
    EspressoBrickUtils::EspressoShape_to_NDShape(v19, (uint64_t)&v53);
  }
  v20 = (char *)v53;
  std::vector<int>::size_type v21 = 1;
  while (v20 != v54)
  {
    uint64_t v22 = *(void *)v20;
    v20 += 8;
    v21 *= v22;
  }
  std::vector<int>::vector(&v50, v21);
  vDSP_vfixr32(v10, 1, v50.__begin_, 1, v21);
  uint64_t v23 = [(NSNumber *)self->_axis integerValue];
  std::vector<int>::pointer begin = v50.__begin_;
  BrickLayers::GatherShapeComputation(v23, (uint64_t)&v55, (uint64_t)&v53, (uint64_t)&v51);
  int64_t v24 = (v56 - (unsigned char *)v55) >> 3;
  unint64_t v25 = v24 + ((v54 - (unsigned char *)v53) >> 3) - 1;
  if (v25 != (v52 - (unsigned char *)v51) >> 3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19F3C1380](exception, "Gather layer: Invalid rank of Output.");
    goto LABEL_51;
  }
  int64_t v26 = ((v23 >> 63) & ((v56 - (unsigned char *)v55) >> 3)) + v23;
  if (v26 < 0 || v26 >= v24)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19F3C1380](exception, "Gather layer: Invalid value of the argument 'axis'.");
LABEL_51:
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  uint64_t v66 = 0;
  std::vector<unsigned long>::vector(&v64, (v56 - (unsigned char *)v55) >> 3);
  v60 = 0;
  std::vector<unsigned long>::vector(&v62, v24, &v60);
  __p = 0;
  std::vector<unsigned long>::vector(&v60, v25, &__p);
  v27 = (uint64_t *)v51;
  unint64_t v28 = 1;
  if (v51 != v52)
  {
    do
    {
      uint64_t v29 = *v27++;
      v28 *= v29;
    }
    while (v27 != (uint64_t *)v52);
  }
  v30 = (char *)v53;
  uint64_t v31 = 1;
  if (v53 == v54) {
    goto LABEL_15;
  }
  do
  {
    uint64_t v32 = *(void *)v30;
    v30 += 8;
    v31 *= v32;
  }
  while (v30 != v54);
  if (v31)
  {
LABEL_15:
    uint64_t v33 = 0;
    v34 = v55;
    uint64_t v35 = *((void *)v55 + v26);
    do
    {
      int v36 = begin[v33];
      if (v36 >= (int)v35 || v36 + v35 < 0)
      {
        v44 = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x19F3C1380](v44, "Gather layer: Invalid indices.");
        __cxa_throw(v44, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      ++v33;
    }
    while (v31 != v33);
    char v49 = 0;
  }
  else
  {
    char v49 = 1;
    v34 = v55;
  }
  v46 = v6;
  TensorAlgebraUtils::computeStrides((uint64_t)v34, (uint64_t)v56, (uint64_t)v64, (uint64_t)v65);
  if (v28)
  {
    unint64_t v37 = 0;
    uint64_t v38 = v64[v26];
    do
    {
      TensorAlgebraUtils::unravel_index(v37, (uint64_t)v51, (uint64_t)v52, v60, (uint64_t)v61);
      if (v26 << 32) {
        memmove(v62, v60, 8 * (int)v26);
      }
      if ((v49 & 1) == 0)
      {
        std::vector<int>::pointer v39 = begin;
        unint64_t v40 = v47 + 4 * v37;
        uint64_t v41 = v31;
        do
        {
          unsigned int v43 = *v39++;
          uint64_t v42 = v43;
          if ((v43 & 0x80000000) != 0) {
            uint64_t v42 = (int)(v42 + *((void *)v55 + v26));
          }
          *((void *)v62 + v26) = v42;
          v58 = 0;
          uint64_t v59 = 0;
          __p = 0;
          std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v64, (uint64_t)v65, (v65 - (unsigned char *)v64) >> 3);
          TensorAlgebraUtils::ravel_multi_index((uint64_t *)v62, v63, (uint64_t)v55, (uint64_t)v56, (uint64_t *)__p, &v66);
          if (__p)
          {
            v58 = __p;
            operator delete(__p);
          }
          cblas_scopy_NEWLAPACK();
          v37 += v38;
          v40 += 4 * v38;
          --v41;
        }
        while (v41);
      }
    }
    while (v37 < v28);
  }
  if (v60)
  {
    v61 = v60;
    operator delete(v60);
  }
  if (v62)
  {
    uint64_t v63 = (uint64_t)v62;
    operator delete(v62);
  }
  if (v64)
  {
    v65 = v64;
    operator delete(v64);
  }
  if (v50.__begin_)
  {
    v50.__end_ = v50.__begin_;
    operator delete(v50.__begin_);
  }
  if (v51)
  {
    v52 = v51;
    operator delete(v51);
  }
  if (v53)
  {
    v54 = (char *)v53;
    operator delete(v53);
  }
  if (v55)
  {
    v56 = v55;
    operator delete(v55);
  }
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (MLGatherBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MLGatherBrick;
  v5 = [(MLGatherBrick *)&v23 init];
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

    uint64_t v14 = [v4 objectForKeyedSubscript:@"axis"];
    axis = v5->_axis;
    v5->_axis = (NSNumber *)v14;

    unsigned int v16 = 0;
    v5->_shapeInfoNeeded = 0;
    while ([(NSArray *)v5->_inputRanks count] > v16)
    {
      v17 = [(NSArray *)v5->_inputRanks objectAtIndexedSubscript:v16];
      uint64_t v18 = [v17 integerValue];

      if (v18 >= 6) {
        v5->_shapeInfoNeeded = 1;
      }
      ++v16;
    }
    for (unsigned int i = 0; [(NSArray *)v5->_outputRanks count] > i; ++i)
    {
      v20 = [(NSArray *)v5->_outputRanks objectAtIndexedSubscript:i];
      uint64_t v21 = [v20 integerValue];

      if (v21 >= 6) {
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
  std::vector<unsigned long>::vector(v17, [v8 unsignedIntegerValue]);

  if (self->_shapeInfoNeeded)
  {
    v9 = [(NSArray *)self->_outputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v9, v17);
  }
  else
  {
    uint64_t v10 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
    std::vector<unsigned long>::vector(v16, [v10 unsignedIntegerValue]);

    v11 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:1];
    std::vector<unsigned long>::vector(__p, [v11 unsignedIntegerValue]);

    uint64_t v12 = [v5 objectAtIndexedSubscript:0];
    EspressoBrickUtils::EspressoShape_to_NDShape(v12, (uint64_t)v16);

    v13 = [v5 objectAtIndexedSubscript:1];
    EspressoBrickUtils::EspressoShape_to_NDShape(v13, (uint64_t)__p);

    BrickLayers::GatherShapeComputation([(NSNumber *)self->_axis integerValue], (uint64_t)v16, (uint64_t)__p, (uint64_t)v17);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v16[0])
    {
      v16[1] = v16[0];
      operator delete(v16[0]);
    }
  }
  EspressoBrickUtils::NDShape_to_EspressoShape((uint64_t **)v17, v7);
  [v6 addObject:v7];
  if (v17[0])
  {
    v17[1] = v17[0];
    operator delete(v17[0]);
  }

  return v6;
}

@end