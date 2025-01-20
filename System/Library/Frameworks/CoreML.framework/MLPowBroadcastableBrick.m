@interface MLPowBroadcastableBrick
- (BOOL)hasGPUSupport;
- (BOOL)shapeInfoNeeded;
- (MLPowBroadcastableBrick)initWithParameters:(id)a3;
- (NSArray)inputRanks;
- (NSArray)inputShapes;
- (NSArray)outputRanks;
- (NSArray)outputShapes;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLPowBroadcastableBrick

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputShapes, 0);
  objc_storeStrong((id *)&self->_inputShapes, 0);
  objc_storeStrong((id *)&self->_outputRanks, 0);

  objc_storeStrong((id *)&self->_inputRanks, 0);
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

  v10 = [v6 objectAtIndexedSubscript:1];
  v11 = (const float *)[v10 rawPointer];

  v12 = [v7 objectAtIndexedSubscript:0];
  v13 = (float *)[v12 rawPointer];

  v14 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v34, [v14 unsignedIntegerValue]);

  v15 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:1];
  std::vector<unsigned long>::vector(&v32, [v15 unsignedIntegerValue]);

  v16 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v30, [v16 unsignedIntegerValue]);

  if (self->_shapeInfoNeeded)
  {
    v17 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v17, &v34);

    v18 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:1];
    EspressoBrickUtils::NSShape_to_VecShape(v18, &v32);
  }
  else
  {
    v19 = [v6 objectAtIndexedSubscript:0];
    v20 = [v19 shape];
    EspressoBrickUtils::EspressoShape_to_NDShape(v20, (uint64_t)&v34);

    v18 = [v6 objectAtIndexedSubscript:1];
    v21 = [v18 shape];
    EspressoBrickUtils::EspressoShape_to_NDShape(v21, (uint64_t)&v32);
  }
  TensorAlgebraUtils::broadcasted_shape((uint64_t)v34, (uint64_t)v35, (uint64_t)v32, (uint64_t)v33, (uint64_t)v30, (uint64_t)v31);
  v22 = v30;
  unint64_t v23 = 1;
  if (v30 != v31)
  {
    v24 = (uint64_t *)v30;
    do
    {
      uint64_t v25 = *v24++;
      v23 *= v25;
    }
    while (v24 != (uint64_t *)v31);
  }
  v50[0] = v23;
  v26 = v34;
  size_t v27 = v35 - (unsigned char *)v34;
  size_t v28 = v31 - (unsigned char *)v30;
  if (v35 - (unsigned char *)v34 != v31 - (unsigned char *)v30) {
    goto LABEL_14;
  }
  if (!memcmp(v34, v30, v35 - (unsigned char *)v34) && v33 - (unsigned char *)v32 == v27 && !memcmp(v32, v22, v27))
  {
    vvpowf(v13, v11, v9, v50);
    goto LABEL_40;
  }
  if (memcmp(v26, v22, v27))
  {
LABEL_14:
    if (v33 - (unsigned char *)v32 == v28 && !memcmp(v32, v22, v28))
    {
      std::vector<float>::vector(v49, v23);
      v46 = 0;
      v47 = 0;
      uint64_t v48 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v46, v30, (uint64_t)v31, (v31 - (unsigned char *)v30) >> 3);
      __p = 0;
      v44 = 0;
      uint64_t v45 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v34, (uint64_t)v35, (v35 - (unsigned char *)v34) >> 3);
      BrickLayers::BroadcastTo((uint64_t *)&v46, (uint64_t)v9, (uint64_t *)&__p, (uint64_t)v49[0]);
      if (__p)
      {
        v44 = __p;
        operator delete(__p);
      }
      if (v46)
      {
        v47 = v46;
        operator delete(v46);
      }
      vvpowf(v13, v11, (const float *)v49[0], v50);
      goto LABEL_38;
    }
    if (v27 != v28) {
      goto LABEL_16;
    }
  }
  if (!memcmp(v26, v22, v27) && (v33 - (unsigned char *)v32 != v28 || memcmp(v32, v22, v28)))
  {
    std::vector<float>::vector(v49, v23);
    v46 = 0;
    v47 = 0;
    uint64_t v48 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v46, v30, (uint64_t)v31, (v31 - (unsigned char *)v30) >> 3);
    __p = 0;
    v44 = 0;
    uint64_t v45 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v32, (uint64_t)v33, (v33 - (unsigned char *)v32) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v46, (uint64_t)v11, (uint64_t *)&__p, (uint64_t)v49[0]);
    if (__p)
    {
      v44 = __p;
      operator delete(__p);
    }
    if (v46)
    {
      v47 = v46;
      operator delete(v46);
    }
    vvpowf(v13, (const float *)v49[0], v9, v50);
  }
  else
  {
LABEL_16:
    std::vector<float>::vector(v49, v23);
    v46 = 0;
    v47 = 0;
    uint64_t v48 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v46, v30, (uint64_t)v31, (v31 - (unsigned char *)v30) >> 3);
    __p = 0;
    v44 = 0;
    uint64_t v45 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v34, (uint64_t)v35, (v35 - (unsigned char *)v34) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v46, (uint64_t)v9, (uint64_t *)&__p, (uint64_t)v49[0]);
    if (__p)
    {
      v44 = __p;
      operator delete(__p);
    }
    if (v46)
    {
      v47 = v46;
      operator delete(v46);
    }
    v29 = (const float *)v49[0];
    std::vector<float>::vector(v42, v23);
    v39 = 0;
    v40 = 0;
    uint64_t v41 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v39, v30, (uint64_t)v31, (v31 - (unsigned char *)v30) >> 3);
    v36 = 0;
    v37 = 0;
    uint64_t v38 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v36, v32, (uint64_t)v33, (v33 - (unsigned char *)v32) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v39, (uint64_t)v11, (uint64_t *)&v36, (uint64_t)v42[0]);
    if (v36)
    {
      v37 = v36;
      operator delete(v36);
    }
    if (v39)
    {
      v40 = v39;
      operator delete(v39);
    }
    vvpowf(v13, v42[0], v29, v50);
    if (v42[0])
    {
      v42[1] = v42[0];
      operator delete(v42[0]);
    }
  }
LABEL_38:
  if (v49[0])
  {
    v49[1] = v49[0];
    operator delete(v49[0]);
  }
LABEL_40:
  if (v30)
  {
    v31 = v30;
    operator delete(v30);
  }
  if (v32)
  {
    v33 = v32;
    operator delete(v32);
  }
  if (v34)
  {
    v35 = v34;
    operator delete(v34);
  }
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (MLPowBroadcastableBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MLPowBroadcastableBrick;
  v5 = [(MLPowBroadcastableBrick *)&v21 init];
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

    unsigned int v14 = 0;
    v5->_shapeInfoNeeded = 0;
    while ([(NSArray *)v5->_inputRanks count] > v14)
    {
      v15 = [(NSArray *)v5->_inputRanks objectAtIndexedSubscript:v14];
      uint64_t v16 = [v15 integerValue];

      if (v16 >= 6) {
        v5->_shapeInfoNeeded = 1;
      }
      ++v14;
    }
    for (unsigned int i = 0; [(NSArray *)v5->_outputRanks count] > i; ++i)
    {
      v18 = [(NSArray *)v5->_outputRanks objectAtIndexedSubscript:i];
      uint64_t v19 = [v18 integerValue];

      if (v19 >= 6) {
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
  std::vector<unsigned long>::vector(&v19, [v8 unsignedIntegerValue]);

  if (self->_shapeInfoNeeded)
  {
    v9 = [(NSArray *)self->_outputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v9, &v19);
  }
  else
  {
    uint64_t v10 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
    std::vector<unsigned long>::vector(&v17, [v10 unsignedIntegerValue]);

    v11 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:1];
    std::vector<unsigned long>::vector(&__p, [v11 unsignedIntegerValue]);

    uint64_t v12 = [v5 objectAtIndexedSubscript:0];
    EspressoBrickUtils::EspressoShape_to_NDShape(v12, (uint64_t)&v17);

    v13 = [v5 objectAtIndexedSubscript:1];
    EspressoBrickUtils::EspressoShape_to_NDShape(v13, (uint64_t)&__p);

    TensorAlgebraUtils::broadcasted_shape((uint64_t)v17, (uint64_t)v18, (uint64_t)__p, (uint64_t)v16, (uint64_t)v19, (uint64_t)v20);
    if (__p)
    {
      uint64_t v16 = __p;
      operator delete(__p);
    }
    if (v17)
    {
      v18 = v17;
      operator delete(v17);
    }
  }
  EspressoBrickUtils::NDShape_to_EspressoShape((uint64_t **)&v19, v7);
  [v6 addObject:v7];
  if (v19)
  {
    v20 = v19;
    operator delete(v19);
  }

  return v6;
}

@end