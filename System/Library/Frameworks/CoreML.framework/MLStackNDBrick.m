@interface MLStackNDBrick
- (BOOL)hasGPUSupport;
- (BOOL)shapeInfoNeeded;
- (MLStackNDBrick)initWithParameters:(id)a3;
- (NSArray)inputRanks;
- (NSArray)inputShapes;
- (NSArray)outputRanks;
- (NSArray)outputShapes;
- (NSNumber)axis;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLStackNDBrick

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
      std::vector<unsigned long>::vector(&v51, [v13 unsignedIntegerValue]);

      if (self->_shapeInfoNeeded)
      {
        v14 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:i];
        EspressoBrickUtils::NSShape_to_VecShape(v14, &v51);
      }
      else
      {
        v14 = [v6 objectAtIndexedSubscript:i];
        v15 = [v14 shape];
        EspressoBrickUtils::EspressoShape_to_NDShape(v15, (uint64_t)&v51);
      }
      if ((void ***)(v47 + v9) != &v51) {
        std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>((char *)(v47 + v9), (char *)v51, (uint64_t)v52, v52 - v51);
      }
      if (v51)
      {
        v52 = v51;
        operator delete(v51);
      }
      v9 += 24;
    }
  }
  v16 = [v7 objectAtIndexedSubscript:0];
  uint64_t v38 = [v16 rawPointer];

  v17 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v45, [v17 unsignedIntegerValue]);

  uint64_t v18 = [(NSNumber *)self->_axis integerValue];
  memset(v44, 0, sizeof(v44));
  std::vector<float const*>::__init_with_size[abi:ne180100]<float const**,float const**>(v44, v49, (uint64_t)v50, (v50 - (unsigned char *)v49) >> 3);
  v41 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  std::vector<std::vector<unsigned long>>::__init_with_size[abi:ne180100]<std::vector<unsigned long>*,std::vector<unsigned long>*>(&v41, v47, v48, 0xAAAAAAAAAAAAAAABLL * ((v48 - v47) >> 3));
  v51 = 0;
  v52 = 0;
  uint64_t v53 = 0;
  v36 = v7;
  v37 = v6;
  std::vector<std::vector<unsigned long>>::__init_with_size[abi:ne180100]<std::vector<unsigned long>*,std::vector<unsigned long>*>(&v51, (uint64_t)v41, v42, 0xAAAAAAAAAAAAAAABLL * ((v42 - (uint64_t)v41) >> 3));
  BrickLayers::StackNDShapeComputation(v18, (char ***)&v51, (char **)&v45);
  v54 = &v51;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v54);
  v40 = v41;
  v19 = (uint64_t *)v41[1];
  uint64_t v20 = ((uint64_t)v19 - *v41) >> 3;
  v21 = (uint64_t *)v45;
  if (v20 + 1 != ((char *)v46 - (unsigned char *)v45) >> 3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19F3C1380](exception, "StackND layer: Invalid rank of output tensor.");
    goto LABEL_37;
  }
  uint64_t v22 = ((v20 + 1) & (v18 >> 63)) + v18;
  if (v22 < 0 || v22 > v20)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19F3C1380](exception, "StackND layer: Invalid value of the argument 'axis'.");
LABEL_37:
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  unint64_t v23 = 1;
  while (v21 != v46)
  {
    uint64_t v24 = *v21++;
    v23 *= v24;
  }
  v25 = (uint64_t *)(*v41 + 8 * (int)v22);
  uint64_t v26 = 1;
  while (v25 != v19)
  {
    uint64_t v27 = *v25++;
    v26 *= v27;
  }
  __p = (char *)v44[0];
  if (v23)
  {
    unint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = v42;
    if ((unint64_t)((v42 - (uint64_t)v41) / 24) <= 1) {
      uint64_t v31 = 1;
    }
    else {
      uint64_t v31 = (v42 - (uint64_t)v41) / 24;
    }
    do
    {
      if ((void *)v30 != v40)
      {
        v32 = __p;
        uint64_t v33 = v38 + 4 * v28;
        uint64_t v34 = v31;
        do
        {
          cblas_scopy_NEWLAPACK();
          v28 += v26;
          v32 += 8;
          v33 += 4 * v26;
          --v34;
        }
        while (v34);
      }
      v29 += v26;
    }
    while (v28 < v23);
  }
  v51 = (void **)&v41;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100](&v51);
  if (__p) {
    operator delete(__p);
  }
  if (v45)
  {
    v46 = (uint64_t *)v45;
    operator delete(v45);
  }
  v51 = (void **)&v47;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100](&v51);
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

- (MLStackNDBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MLStackNDBrick;
  v5 = [(MLStackNDBrick *)&v23 init];
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
      uint64_t v20 = [(NSArray *)v5->_outputRanks objectAtIndexedSubscript:i];
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
  std::vector<unsigned long>::vector(v24, [v10 unsignedIntegerValue]);

  unint64_t v11 = [v6 count];
  if (self->_shapeInfoNeeded)
  {
    uint64_t v12 = [(NSArray *)self->_outputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v12, v24);
  }
  else
  {
    std::vector<std::vector<unsigned long>>::vector(&v22, v11);
    for (unsigned int i = 0; [v6 count] > (unint64_t)i; ++i)
    {
      uint64_t v14 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:i];
      std::vector<unsigned long>::vector(&__p, [v14 unsignedIntegerValue]);

      v15 = [v6 objectAtIndexedSubscript:i];
      EspressoBrickUtils::EspressoShape_to_NDShape(v15, (uint64_t)&__p);

      unsigned int v16 = (char *)(v22 + 24 * i);
      if (v16 != (char *)&__p) {
        std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(v16, (char *)__p, (uint64_t)v21, (v21 - (unsigned char *)__p) >> 3);
      }
      if (__p)
      {
        uint64_t v21 = __p;
        operator delete(__p);
      }
    }
    uint64_t v17 = [(NSNumber *)self->_axis integerValue];
    memset(v19, 0, sizeof(v19));
    std::vector<std::vector<unsigned long>>::__init_with_size[abi:ne180100]<std::vector<unsigned long>*,std::vector<unsigned long>*>(v19, v22, v23, 0xAAAAAAAAAAAAAAABLL * ((v23 - v22) >> 3));
    BrickLayers::StackNDShapeComputation(v17, v19, (char **)v24);
    __p = v19;
    std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    __p = &v22;
    std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  }
  EspressoBrickUtils::NDShape_to_EspressoShape((uint64_t **)v24, v9);
  [v8 addObject:v9];
  if (v24[0])
  {
    v24[1] = v24[0];
    operator delete(v24[0]);
  }

  return v8;
}

@end