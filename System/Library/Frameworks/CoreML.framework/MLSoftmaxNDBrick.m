@interface MLSoftmaxNDBrick
- (BOOL)hasGPUSupport;
- (BOOL)shapeInfoNeeded;
- (MLSoftmaxNDBrick)initWithParameters:(id)a3;
- (NSArray)inputRanks;
- (NSArray)inputShapes;
- (NSArray)outputRanks;
- (NSArray)outputShapes;
- (NSNumber)axis;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLSoftmaxNDBrick

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
  v9 = (const float *)[v8 rawPointer];

  v10 = [v7 objectAtIndexedSubscript:0];
  v11 = (float *)[v10 rawPointer];

  v12 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v31, [v12 unsignedIntegerValue]);

  v13 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v29, [v13 unsignedIntegerValue]);

  if (self->_shapeInfoNeeded)
  {
    v14 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v14, &v31);
  }
  else
  {
    v14 = [v6 objectAtIndexedSubscript:0];
    v15 = [v14 shape];
    EspressoBrickUtils::EspressoShape_to_NDShape(v15, (uint64_t)&v31);
  }
  uint64_t v16 = [(NSNumber *)self->_axis integerValue];
  int64_t v17 = (v32 - (unsigned char *)v31) >> 3;
  if (v17 != ((char *)v30 - (unsigned char *)v29) >> 3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19F3C1380](exception, "Mismatch between ranks of input and output tensors.");
    goto LABEL_33;
  }
  uint64_t v18 = ((v16 >> 63) & ((v32 - (unsigned char *)v31) >> 3)) + v16;
  if (v18 < 0 || v18 >= v17)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19F3C1380](exception, "Invalid value of the argument 'axis'.");
LABEL_33:
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>((char *)&v29, (char *)v31, (uint64_t)v32, (v32 - (unsigned char *)v31) >> 3);
  std::vector<unsigned long>::vector(&v39, v17);
  std::vector<unsigned long>::vector(__p, v17);
  v19 = (uint64_t *)v29;
  unint64_t v20 = 1;
  while (v19 != v30)
  {
    uint64_t v21 = *v19++;
    v20 *= v21;
  }
  std::vector<float>::vector(v37, v20);
  std::vector<float>::vector(v36, v20);
  TensorAlgebraUtils::computeStrides((uint64_t)v31, (uint64_t)v32, (uint64_t)v39, v40);
  float __A = 0.0;
  int v35 = v20;
  float __C = 0.0;
  vDSP_maxv(v9, 1, &__C, v20);
  float __C = -__C;
  vDSP_vsadd(v9, 1, &__C, v36[0], 1, v20);
  vvexpf(v37[0], v36[0], &v35);
  if (v20)
  {
    unint64_t v22 = 0;
    v23 = v39;
    do
    {
      unint64_t v24 = v23[v18];
      if (v24)
      {
        unint64_t v25 = 0;
        unint64_t v26 = v22;
        do
        {
          vDSP_sve(&v37[0][v26], v24, &__A, *((void *)v31 + v18));
          vDSP_vfill(&__A, &v36[0][v26], v39[v18], *((void *)v31 + v18));
          ++v25;
          v23 = v39;
          unint64_t v24 = v39[v18];
          ++v26;
        }
        while (v25 < v24);
      }
      unint64_t v27 = v20;
      if (v18 > 0) {
        unint64_t v27 = v23[v18 - 1];
      }
      v22 += v27;
    }
    while (v22 < v20);
  }
  vvdivf(v11, v37[0], v36[0], &v35);
  if (v36[0])
  {
    v36[1] = v36[0];
    operator delete(v36[0]);
  }
  if (v37[0])
  {
    v37[1] = v37[0];
    operator delete(v37[0]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v39)
  {
    uint64_t v40 = (uint64_t)v39;
    operator delete(v39);
  }
  if (v29)
  {
    v30 = (uint64_t *)v29;
    operator delete(v29);
  }
  if (v31)
  {
    v32 = v31;
    operator delete(v31);
  }
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (MLSoftmaxNDBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MLSoftmaxNDBrick;
  v5 = [(MLSoftmaxNDBrick *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"inputRanks"];
    inputRanks = v5->_inputRanks;
    v5->_inputRanks = (NSArray *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"outputRanks"];
    outputRanks = v5->_outputRanks;
    v5->_outputRanks = (NSArray *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"outputShapes"];
    outputShapes = v5->_outputShapes;
    v5->_outputShapes = (NSArray *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"inputShapes"];
    inputShapes = v5->_inputShapes;
    v5->_inputShapes = (NSArray *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"axis"];
    axis = v5->_axis;
    v5->_axis = (NSNumber *)v14;

    unsigned int v16 = 0;
    v5->_shapeInfoNeeded = 0;
    while ([(NSArray *)v5->_inputRanks count] > v16)
    {
      int64_t v17 = [(NSArray *)v5->_inputRanks objectAtIndexedSubscript:v16];
      uint64_t v18 = [v17 integerValue];

      if (v18 >= 6) {
        v5->_shapeInfoNeeded = 1;
      }
      ++v16;
    }
    for (unsigned int i = 0; [(NSArray *)v5->_outputRanks count] > i; ++i)
    {
      unint64_t v20 = [(NSArray *)v5->_outputRanks objectAtIndexedSubscript:i];
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
  id v4 = a3;

  return v4;
}

@end