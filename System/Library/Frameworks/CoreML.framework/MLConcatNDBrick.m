@interface MLConcatNDBrick
- (BOOL)hasGPUSupport;
- (BOOL)shapeInfoNeeded;
- (MLConcatNDBrick)initWithParameters:(id)a3;
- (NSArray)inputRanks;
- (NSArray)inputShapes;
- (NSArray)outputRanks;
- (NSArray)outputShapes;
- (NSNumber)axis;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLConcatNDBrick

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
  unint64_t v8 = [v6 count];
  std::vector<float const*>::vector(&v49, v8);
  std::vector<std::vector<unsigned long>>::vector(&v47, v8);
  if (v8)
  {
    uint64_t v9 = 0;
    for (uint64_t i = 0; i != v8; ++i)
    {
      v11 = [v6 objectAtIndexedSubscript:i];
      uint64_t v12 = [v11 rawPointer];
      *((void *)v49 + i) = v12;

      v13 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:i];
      std::vector<unsigned long>::vector(&v53, [v13 unsignedIntegerValue]);

      if (self->_shapeInfoNeeded)
      {
        v14 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:i];
        EspressoBrickUtils::NSShape_to_VecShape(v14, &v53);
      }
      else
      {
        v14 = [v6 objectAtIndexedSubscript:i];
        v15 = [v14 shape];
        EspressoBrickUtils::EspressoShape_to_NDShape(v15, (uint64_t)&v53);
      }
      if ((void ***)(v47 + v9) != &v53) {
        std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>((char *)(v47 + v9), (char *)v53, (uint64_t)v54, v54 - v53);
      }
      if (v53)
      {
        v54 = v53;
        operator delete(v53);
      }
      v9 += 24;
    }
  }
  v16 = [v7 objectAtIndexedSubscript:0];
  [v16 rawPointer];

  v17 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v45, [v17 unsignedIntegerValue]);

  uint64_t v18 = [(NSNumber *)self->_axis integerValue];
  memset(v44, 0, sizeof(v44));
  std::vector<float const*>::__init_with_size[abi:ne180100]<float const**,float const**>(v44, v49, (uint64_t)v50, (v50 - (unsigned char *)v49) >> 3);
  v41 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  std::vector<std::vector<unsigned long>>::__init_with_size[abi:ne180100]<std::vector<unsigned long>*,std::vector<unsigned long>*>(&v41, v47, v48, 0xAAAAAAAAAAAAAAABLL * ((v48 - v47) >> 3));
  v53 = 0;
  v54 = 0;
  uint64_t v55 = 0;
  std::vector<std::vector<unsigned long>>::__init_with_size[abi:ne180100]<std::vector<unsigned long>*,std::vector<unsigned long>*>(&v53, (uint64_t)v41, v42, 0xAAAAAAAAAAAAAAABLL * ((v42 - (uint64_t)v41) >> 3));
  BrickLayers::ConcatNDShapeComputation(v18, (uint64_t *)v53, (uint64_t)v54, (uint64_t)v45, (uint64_t)v46);
  v52[0] = (void **)&v53;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100](v52);
  v20 = v41;
  uint64_t v19 = v42;
  unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((v42 - (uint64_t)v41) >> 3);
  std::vector<unsigned long>::vector(v52, v21);
  std::vector<unsigned long>::vector(__p, v21);
  v22 = v41;
  uint64_t v23 = v41[1] - *v41;
  uint64_t v24 = v23 >> 3;
  v25 = (uint64_t *)v45;
  if (v23 >> 3 != ((char *)v46 - (unsigned char *)v45) >> 3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19F3C1380](exception, "Mismatch between ranks of input and output tensors.");
    goto LABEL_45;
  }
  uint64_t v26 = ((v18 >> 63) & (v23 >> 3)) + v18;
  if (v26 < 0 || v26 >= v24)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19F3C1380](exception, "Invalid value of the argument 'axis'.");
LABEL_45:
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  unint64_t v27 = 1;
  while (v25 != v46)
  {
    uint64_t v28 = *v25++;
    v27 *= v28;
  }
  if ((void *)v19 != v20)
  {
    uint64_t v29 = 0;
    v30 = __p[0];
    if (v21 <= 1) {
      uint64_t v31 = 1;
    }
    else {
      uint64_t v31 = v21;
    }
    do
    {
      v32 = &v22[3 * v29];
      v33 = (int *)v32[1];
      v34 = (int *)(*v32 + 8 * (int)v26);
      unsigned int v35 = 1;
      while (v34 != v33)
      {
        int v36 = *v34;
        v34 += 2;
        v35 *= v36;
      }
      v30[v29++] = v35;
    }
    while (v29 != v31);
  }
  if (v27)
  {
    unint64_t v37 = 0;
    if (v21 <= 1) {
      unint64_t v21 = 1;
    }
    do
    {
      if ((void *)v19 != v20)
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          cblas_scopy_NEWLAPACK();
          uint64_t v39 = *((void *)__p[0] + j);
          v37 += v39;
          v52[0][j] = (char *)v52[0][j] + v39;
        }
      }
    }
    while (v37 < v27);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v52[0])
  {
    v52[1] = v52[0];
    operator delete(v52[0]);
  }
  v53 = (void **)&v41;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100](&v53);
  if (v44[0]) {
    operator delete(v44[0]);
  }
  if (v45)
  {
    v46 = (uint64_t *)v45;
    operator delete(v45);
  }
  v53 = (void **)&v47;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100](&v53);
  if (v49)
  {
    v50 = v49;
    operator delete(v49);
  }
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (MLConcatNDBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MLConcatNDBrick;
  v5 = [(MLConcatNDBrick *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"axis"];
    axis = v5->_axis;
    v5->_axis = (NSNumber *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"inputRanks"];
    inputRanks = v5->_inputRanks;
    v5->_inputRanks = (NSArray *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"outputRanks"];
    outputRanks = v5->_outputRanks;
    v5->_outputRanks = (NSArray *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"inputShapes"];
    inputShapes = v5->_inputShapes;
    v5->_inputShapes = (NSArray *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"outputShapes"];
    outputShapes = v5->_outputShapes;
    v5->_outputShapes = (NSArray *)v14;

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
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F611E8]);
  uint64_t v10 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v26, [v10 unsignedIntegerValue]);

  unint64_t v11 = [v6 count];
  if (self->_shapeInfoNeeded)
  {
    uint64_t v12 = [(NSArray *)self->_outputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v12, &v26);
  }
  else
  {
    std::vector<std::vector<unsigned long>>::vector(&v24, v11);
    for (unsigned int i = 0; [v6 count] > (unint64_t)i; ++i)
    {
      uint64_t v14 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:i];
      std::vector<unsigned long>::vector(&__p, [v14 unsignedIntegerValue]);

      v15 = [v6 objectAtIndexedSubscript:i];
      EspressoBrickUtils::EspressoShape_to_NDShape(v15, (uint64_t)&__p);

      unsigned int v16 = (char *)(v24 + 24 * i);
      if (v16 != (char *)&__p) {
        std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(v16, (char *)__p, (uint64_t)v23, (v23 - (unsigned char *)__p) >> 3);
      }
      if (__p)
      {
        objc_super v23 = __p;
        operator delete(__p);
      }
    }
    uint64_t v17 = [(NSNumber *)self->_axis integerValue];
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    std::vector<std::vector<unsigned long>>::__init_with_size[abi:ne180100]<std::vector<unsigned long>*,std::vector<unsigned long>*>(&v19, v24, v25, 0xAAAAAAAAAAAAAAABLL * ((v25 - v24) >> 3));
    BrickLayers::ConcatNDShapeComputation(v17, v19, v20, (uint64_t)v26, (uint64_t)v27);
    __p = &v19;
    std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    __p = &v24;
    std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  }
  EspressoBrickUtils::NDShape_to_EspressoShape((uint64_t **)&v26, v9);
  [v8 addObject:v9];
  if (v26)
  {
    unint64_t v27 = v26;
    operator delete(v26);
  }

  return v8;
}

@end