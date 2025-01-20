@interface MLSlidingWindowsBrick
- (BOOL)hasGPUSupport;
- (BOOL)shapeInfoNeeded;
- (MLSlidingWindowsBrick)initWithParameters:(id)a3;
- (NSArray)inputRanks;
- (NSArray)inputShapes;
- (NSArray)outputRanks;
- (NSArray)outputShapes;
- (NSNumber)axis;
- (NSNumber)size;
- (NSNumber)step;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLSlidingWindowsBrick

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputShapes, 0);
  objc_storeStrong((id *)&self->_inputShapes, 0);
  objc_storeStrong((id *)&self->_outputRanks, 0);
  objc_storeStrong((id *)&self->_inputRanks, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_step, 0);

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

- (NSNumber)size
{
  return self->_size;
}

- (NSNumber)step
{
  return self->_step;
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
  id v35 = a3;
  id v36 = a4;
  v6 = [v35 objectAtIndexedSubscript:0];
  uint64_t v40 = [v6 rawPointer];

  v7 = [v36 objectAtIndexedSubscript:0];
  uint64_t v39 = [v7 rawPointer];

  v8 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v46, [v8 unsignedIntegerValue]);

  v9 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v44, [v9 unsignedIntegerValue]);

  if (self->_shapeInfoNeeded)
  {
    v10 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v10, &v46);
  }
  else
  {
    v10 = [v35 objectAtIndexedSubscript:0];
    v11 = [v10 shape];
    EspressoBrickUtils::EspressoShape_to_NDShape(v11, (uint64_t)&v46);
  }
  uint64_t v12 = [(NSNumber *)self->_axis integerValue];
  uint64_t v13 = [(NSNumber *)self->_size integerValue];
  uint64_t v14 = [(NSNumber *)self->_step integerValue];
  BrickLayers::SlidingWindowsShapeComputation(v12, v13, v14, (uint64_t)v46, (uint64_t)v47, (uint64_t)v44, (uint64_t)v45);
  v42 = v46;
  v43 = v47;
  unint64_t v15 = ((unsigned char *)v47 - (unsigned char *)v46) >> 3;
  unint64_t v16 = ((v12 >> 63) & v15) + v12;
  uint64_t v17 = *((void *)v46 + v16);
  uint64_t v57 = 0;
  std::vector<unsigned long>::vector(&v55, v15);
  std::vector<unsigned long>::vector(&v53, v15);
  std::vector<unsigned long>::vector(&v51, v15 + 1);
  v18 = (uint64_t *)v44;
  unint64_t v19 = 1;
  while (v18 != v45)
  {
    uint64_t v20 = *v18++;
    v19 *= v20;
  }
  TensorAlgebraUtils::computeStrides((uint64_t)v46, (uint64_t)v47, (uint64_t)v55, (uint64_t)v56);
  if (v19)
  {
    unint64_t v21 = 0;
    uint64_t v22 = (v17 - v13) / v14;
    uint64_t v23 = v55[v16];
    uint64_t v24 = v23 * v14;
    uint64_t v25 = v23 * v13;
    if (v15 <= 1) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = v15;
    }
    uint64_t v41 = v22;
    unint64_t v37 = ((v12 >> 63) & v15) + v12;
    uint64_t v38 = v22 + 1;
    do
    {
      TensorAlgebraUtils::unravel_index(v21, (uint64_t)v44, (uint64_t)v45, (unint64_t *)v51, (uint64_t)v52);
      if (v43 != v42)
      {
        unint64_t v27 = 0;
        v28 = v51;
        v29 = v53;
        do
        {
          if (v27 >= v16) {
            uint64_t v30 = 0;
          }
          else {
            uint64_t v30 = v28[v27];
          }
          v29[v27++] = v30;
        }
        while (v26 != v27);
      }
      __p = 0;
      v49 = 0;
      uint64_t v50 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v55, (uint64_t)v56, (v56 - (unsigned char *)v55) >> 3);
      TensorAlgebraUtils::ravel_multi_index(v53, (uint64_t)v54, (uint64_t)v46, (uint64_t)v47, (uint64_t *)__p, &v57);
      if (__p)
      {
        v49 = __p;
        operator delete(__p);
      }
      if (v41 != -1)
      {
        uint64_t v31 = v57;
        uint64_t v32 = v40 + 4 * v57;
        uint64_t v33 = v38;
        unint64_t v34 = v39 + 4 * v21;
        do
        {
          cblas_scopy_NEWLAPACK();
          v31 += v24;
          v21 += v25;
          v32 += 4 * v24;
          v34 += 4 * v25;
          --v33;
        }
        while (v33);
        uint64_t v57 = v31;
        unint64_t v16 = v37;
      }
    }
    while (v21 < v19);
  }
  if (v51)
  {
    v52 = v51;
    operator delete(v51);
  }
  if (v53)
  {
    v54 = v53;
    operator delete(v53);
  }
  if (v55)
  {
    v56 = v55;
    operator delete(v55);
  }
  if (v44)
  {
    v45 = (uint64_t *)v44;
    operator delete(v44);
  }
  if (v46)
  {
    v47 = v46;
    operator delete(v46);
  }
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (MLSlidingWindowsBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MLSlidingWindowsBrick;
  v5 = [(MLSlidingWindowsBrick *)&v27 init];
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

    uint64_t v16 = [v4 objectForKeyedSubscript:@"size"];
    size = v5->_size;
    v5->_size = (NSNumber *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"step"];
    step = v5->_step;
    v5->_step = (NSNumber *)v18;

    unsigned int v20 = 0;
    v5->_shapeInfoNeeded = 0;
    while ([(NSArray *)v5->_inputRanks count] > v20)
    {
      unint64_t v21 = [(NSArray *)v5->_inputRanks objectAtIndexedSubscript:v20];
      uint64_t v22 = [v21 integerValue];

      if (v22 >= 6) {
        v5->_shapeInfoNeeded = 1;
      }
      ++v20;
    }
    for (unsigned int i = 0; [(NSArray *)v5->_outputRanks count] > i; ++i)
    {
      uint64_t v24 = [(NSArray *)v5->_outputRanks objectAtIndexedSubscript:i];
      uint64_t v25 = [v24 integerValue];

      if (v25 >= 6) {
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
  std::vector<unsigned long>::vector(&v18, [v8 unsignedIntegerValue]);

  if (self->_shapeInfoNeeded)
  {
    v9 = [(NSArray *)self->_outputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v9, &v18);
  }
  else
  {
    uint64_t v10 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
    std::vector<unsigned long>::vector(&__p, [v10 unsignedIntegerValue]);

    v11 = [v5 objectAtIndexedSubscript:0];
    EspressoBrickUtils::EspressoShape_to_NDShape(v11, (uint64_t)&__p);

    uint64_t v12 = [(NSNumber *)self->_axis integerValue];
    uint64_t v13 = [(NSNumber *)self->_size integerValue];
    uint64_t v14 = [(NSNumber *)self->_step integerValue];
    BrickLayers::SlidingWindowsShapeComputation(v12, v13, v14, (uint64_t)__p, (uint64_t)v17, (uint64_t)v18, (uint64_t)v19);
    if (__p)
    {
      uint64_t v17 = __p;
      operator delete(__p);
    }
  }
  EspressoBrickUtils::NDShape_to_EspressoShape((uint64_t **)&v18, v7);
  [v6 addObject:v7];
  if (v18)
  {
    unint64_t v19 = v18;
    operator delete(v18);
  }

  return v6;
}

@end