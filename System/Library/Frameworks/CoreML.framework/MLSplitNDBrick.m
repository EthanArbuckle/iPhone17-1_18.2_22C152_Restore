@interface MLSplitNDBrick
- (BOOL)hasGPUSupport;
- (BOOL)shapeInfoNeeded;
- (MLSplitNDBrick)initWithParameters:(id)a3;
- (NSArray)inputRanks;
- (NSArray)inputShapes;
- (NSArray)outputRanks;
- (NSArray)outputShapes;
- (NSArray)splitSizes;
- (NSNumber)axis;
- (NSNumber)numSplits;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLSplitNDBrick

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputShapes, 0);
  objc_storeStrong((id *)&self->_inputShapes, 0);
  objc_storeStrong((id *)&self->_outputRanks, 0);
  objc_storeStrong((id *)&self->_inputRanks, 0);
  objc_storeStrong((id *)&self->_splitSizes, 0);
  objc_storeStrong((id *)&self->_numSplits, 0);

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

- (NSArray)splitSizes
{
  return self->_splitSizes;
}

- (NSNumber)numSplits
{
  return self->_numSplits;
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
  unint64_t v8 = [(NSArray *)self->_outputRanks count];
  std::vector<unsigned long>::vector(v57, [(NSNumber *)self->_numSplits unsignedIntegerValue]);
  EspressoBrickUtils::NSShape_to_VecShape(self->_splitSizes, v57);
  v9 = [v6 objectAtIndexedSubscript:0];
  [v9 rawPointer];

  v10 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v55, [v10 unsignedIntegerValue]);

  if (self->_shapeInfoNeeded)
  {
    v11 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v11, &v55);
  }
  else
  {
    v11 = [v6 objectAtIndexedSubscript:0];
    v12 = [v11 shape];
    EspressoBrickUtils::EspressoShape_to_NDShape(v12, (uint64_t)&v55);
  }
  v52 = 0;
  v53 = 0;
  uint64_t v54 = 0;
  id v45 = v6;
  if (v8)
  {
    std::vector<float *>::__vallocate[abi:ne180100](&v52, v8);
    v13 = (char *)v53;
    bzero(v53, 8 * v8);
    v14 = &v13[8 * v8];
    v53 = v14;
  }
  else
  {
    v14 = 0;
  }
  std::vector<std::vector<unsigned long>>::vector(&v50, v8);
  if (v8)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    v17 = v52;
    do
    {
      v18 = objc_msgSend(v7, "objectAtIndexedSubscript:", v16, v45);
      *(void *)&v17[8 * v16] = [v18 rawPointer];

      v19 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:v16];
      std::vector<unsigned long>::vector(&v60, [v19 unsignedIntegerValue]);

      if ((void ***)(v50 + v15) != &v60) {
        std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>((char *)(v50 + v15), (char *)v60, (uint64_t)v61, v61 - v60);
      }
      if (v60)
      {
        v61 = v60;
        operator delete(v60);
      }
      ++v16;
      v15 += 24;
    }
    while (v8 != v16);
  }
  uint64_t v20 = [(NSNumber *)self->_axis integerValue];
  v47 = 0;
  __dst = 0;
  uint64_t v49 = 0;
  v21 = v52;
  int64_t v22 = v14 - v52;
  if (v14 != v52)
  {
    std::vector<float *>::__vallocate[abi:ne180100](&v47, v22 >> 3);
    memmove(__dst, v21, v22);
  }
  BrickLayers::SplitNDShapeComputation((char *)v20, (uint64_t *)v57, (uint64_t)&v55, &v50);
  uint64_t v24 = v50;
  uint64_t v23 = v51;
  unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((v51 - v50) >> 3);
  v27 = v55;
  v26 = v56;
  __p[0] = 0;
  std::vector<unsigned long>::vector(&v60, v25, __p);
  uint64_t v58 = 0;
  std::vector<unsigned long>::vector(__p, v25, &v58);
  uint64_t v28 = ((v20 >> 63) & ((v26 - v27) >> 3)) + v20;
  if (v28 < 0 || v28 >= (v26 - v27) >> 3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19F3C1380](exception, "Invalid value of the argument 'axis'.");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  v29 = v56;
  unint64_t v30 = 1;
  if (v55 != v56)
  {
    v31 = (char *)v55;
    do
    {
      uint64_t v32 = *(void *)v31;
      v31 += 8;
      v30 *= v32;
    }
    while (v31 != v56);
  }
  if (v23 != v24)
  {
    uint64_t v33 = 0;
    v34 = (char *)v55 + 8 * (int)v28 + 8;
    v35 = v57[0];
    v36 = __p[0];
    if (v25 <= 1) {
      uint64_t v37 = 1;
    }
    else {
      uint64_t v37 = v25;
    }
    do
    {
      uint64_t v38 = v35[v33];
      if (v34 != v29)
      {
        v39 = v34;
        do
        {
          uint64_t v40 = *(void *)v39;
          v39 += 8;
          v38 *= v40;
        }
        while (v39 != v29);
      }
      v36[v33++] = v38;
    }
    while (v33 != v37);
  }
  if (v30)
  {
    unint64_t v41 = 0;
    if (v25 <= 1) {
      unint64_t v25 = 1;
    }
    do
    {
      if (v23 != v24)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          cblas_scopy_NEWLAPACK();
          uint64_t v43 = *((void *)__p[0] + i);
          v41 += v43;
          v60[i] = (char *)v60[i] + v43;
        }
      }
    }
    while (v41 < v30);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v60)
  {
    v61 = v60;
    operator delete(v60);
  }
  if (v47) {
    operator delete(v47);
  }
  v60 = (void **)&v50;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100](&v60);
  if (v21) {
    operator delete(v21);
  }
  if (v55)
  {
    v56 = (char *)v55;
    operator delete(v55);
  }
  if (v57[0])
  {
    v57[1] = v57[0];
    operator delete(v57[0]);
  }
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (MLSplitNDBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MLSplitNDBrick;
  v5 = [(MLSplitNDBrick *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"numSplits"];
    numSplits = v5->_numSplits;
    v5->_numSplits = (NSNumber *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"splitSizes"];
    splitSizes = v5->_splitSizes;
    v5->_splitSizes = (NSArray *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"axis"];
    axis = v5->_axis;
    v5->_axis = (NSNumber *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"inputRanks"];
    inputRanks = v5->_inputRanks;
    v5->_inputRanks = (NSArray *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"outputRanks"];
    outputRanks = v5->_outputRanks;
    v5->_outputRanks = (NSArray *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"inputShapes"];
    inputShapes = v5->_inputShapes;
    v5->_inputShapes = (NSArray *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"outputShapes"];
    outputShapes = v5->_outputShapes;
    v5->_outputShapes = (NSArray *)v18;

    unsigned int v20 = 0;
    v5->_shapeInfoNeeded = 0;
    while ([(NSArray *)v5->_inputRanks count] > v20)
    {
      v21 = [(NSArray *)v5->_inputRanks objectAtIndexedSubscript:v20];
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
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [(NSNumber *)self->_axis integerValue];
  unint64_t v10 = [(NSArray *)self->_outputRanks count];
  unint64_t v49 = [(NSNumber *)self->_numSplits unsignedIntegerValue];
  v11 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
  int64_t v12 = [v11 unsignedIntegerValue];

  v13 = (char *)((v12 & (v9 >> 63)) + v9);
  v47 = v6;
  id v48 = v8;
  if ((uint64_t)v13 < 0 || (uint64_t)v13 >= v12)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19F3C1380](exception, "SplitND layer: Invalid value of the argument 'axis'.");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  v46 = v7;
  std::vector<std::vector<unsigned long>>::vector(v53, v10);
  if (v10)
  {
    uint64_t v14 = 0;
    for (uint64_t i = 0; i != v10; ++i)
    {
      uint64_t v16 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:i];
      std::vector<unsigned long>::vector(&__p, [v16 unsignedIntegerValue]);

      if ((void **)(v53[0] + v14) != &__p) {
        std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>((char *)(v53[0] + v14), (char *)__p, (uint64_t)v52, (v52 - (unsigned char *)__p) >> 3);
      }
      if (__p)
      {
        v52 = __p;
        operator delete(__p);
      }
      v14 += 24;
    }
  }
  if (!self->_shapeInfoNeeded)
  {
    v17 = v48;
    std::vector<unsigned long>::vector(&__p, v12);
    std::vector<unsigned long>::vector(v50, v49);
    v21 = [v6 objectAtIndexedSubscript:0];
    EspressoBrickUtils::EspressoShape_to_NDShape(v21, (uint64_t)&__p);

    unint64_t v22 = *((void *)__p + (void)v13);
    if (![(NSArray *)self->_splitSizes count])
    {
      uint64_t v23 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      if (v49)
      {
        unint64_t v24 = 0;
        unint64_t v25 = v22 / v49;
        unint64_t v26 = v22 % v49;
        unint64_t v45 = v25 + 1;
        do
        {
          if (v24 >= v26)
          {
            uint64_t v27 = [NSNumber numberWithUnsignedLong:v25];
            id v6 = (id)v27;
          }
          else
          {
            uint64_t v27 = [NSNumber numberWithUnsignedLong:v45];
            v21 = (void *)v27;
          }
          objc_msgSend(v23, "setObject:atIndexedSubscript:", v27, v24, v45, v46);
          if (v24 >= v26) {
            uint64_t v28 = v6;
          }
          else {
            uint64_t v28 = v21;
          }

          ++v24;
        }
        while (v49 != v24);
      }
      v29 = (NSArray *)[v23 copy];
      splitSizes = self->_splitSizes;
      self->_splitSizes = v29;

      v17 = v48;
    }
    EspressoBrickUtils::NSShape_to_VecShape(self->_splitSizes, v50);
    BrickLayers::SplitNDShapeComputation(v13, (uint64_t *)v50, (uint64_t)&__p, v53);
    if (v50[0])
    {
      v50[1] = v50[0];
      operator delete(v50[0]);
    }
    if (__p)
    {
      v52 = __p;
      operator delete(__p);
    }
    goto LABEL_41;
  }
  v17 = v48;
  uint64_t v18 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:0];
  v19 = [v18 objectAtIndexedSubscript:v13];
  unint64_t v20 = [v19 unsignedIntegerValue];

  if ([(NSArray *)self->_splitSizes count])
  {
    if (!v10) {
      goto LABEL_44;
    }
    goto LABEL_39;
  }
  v31 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  if (v49)
  {
    unint64_t v32 = 0;
    unint64_t v33 = v20 % v49;
    do
    {
      if (v32 >= v33)
      {
        uint64_t v34 = [NSNumber numberWithUnsignedLong:v20 / v49];
        v13 = (char *)v34;
      }
      else
      {
        uint64_t v34 = [NSNumber numberWithUnsignedLong:v20 / v49 + 1];
        id v6 = (id)v34;
      }
      [v31 setObject:v34 atIndexedSubscript:v32];
      if (v32 >= v33) {
        v35 = v13;
      }
      else {
        v35 = (char *)v6;
      }

      ++v32;
    }
    while (v49 != v32);
  }
  v36 = (NSArray *)[v31 copy];
  uint64_t v37 = self->_splitSizes;
  self->_splitSizes = v36;

  v17 = v48;
  if (v10)
  {
LABEL_39:
    uint64_t v38 = 0;
    for (uint64_t j = 0; j != v10; ++j)
    {
      uint64_t v40 = [(NSArray *)self->_outputShapes objectAtIndexedSubscript:j];
      EspressoBrickUtils::NSShape_to_VecShape(v40, (void *)(v53[0] + v38));

      v38 += 24;
    }
LABEL_41:
    if (v10)
    {
      uint64_t v41 = 0;
      do
      {
        id v42 = objc_alloc_init(MEMORY[0x1E4F611E8]);
        EspressoBrickUtils::NDShape_to_EspressoShape((uint64_t **)(v53[0] + v41), v42);
        [v17 addObject:v42];

        v41 += 24;
        --v10;
      }
      while (v10);
    }
  }
LABEL_44:
  __p = v53;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  return v17;
}

@end