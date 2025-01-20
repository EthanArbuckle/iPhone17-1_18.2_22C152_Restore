@interface MLSubtractBroadcastableBrick
- (BOOL)hasGPUSupport;
- (BOOL)shapeInfoNeeded;
- (MLSubtractBroadcastableBrick)initWithParameters:(id)a3;
- (NSArray)inputRanks;
- (NSArray)inputShapes;
- (NSArray)outputRanks;
- (NSArray)outputShapes;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLSubtractBroadcastableBrick

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
  id v37 = v6;
  id v38 = a4;
  v7 = [v6 objectAtIndexedSubscript:0];
  v8 = (const float *)[v7 rawPointer];

  v9 = [v6 objectAtIndexedSubscript:1];
  v10 = (const float *)[v9 rawPointer];

  v11 = [v38 objectAtIndexedSubscript:0];
  v12 = (float *)[v11 rawPointer];

  v13 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v43, [v13 unsignedIntegerValue]);

  v14 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:1];
  std::vector<unsigned long>::vector(&v41, [v14 unsignedIntegerValue]);

  v15 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v39, [v15 unsignedIntegerValue]);

  if (self->_shapeInfoNeeded)
  {
    v16 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v16, &v43);

    v17 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:1];
    EspressoBrickUtils::NSShape_to_VecShape(v17, &v41);
  }
  else
  {
    v18 = [v6 objectAtIndexedSubscript:0];
    v19 = [v18 shape];
    EspressoBrickUtils::EspressoShape_to_NDShape(v19, (uint64_t)&v43);

    v17 = [v6 objectAtIndexedSubscript:1];
    v20 = [v17 shape];
    EspressoBrickUtils::EspressoShape_to_NDShape(v20, (uint64_t)&v41);
  }
  TensorAlgebraUtils::broadcasted_shape((uint64_t)v43, (uint64_t)v44, (uint64_t)v41, (uint64_t)v42, (uint64_t)v39, (uint64_t)v40);
  v21 = v39;
  vDSP_Length v22 = 1;
  if (v39 != v40)
  {
    v23 = (uint64_t *)v39;
    do
    {
      uint64_t v24 = *v23++;
      v22 *= v24;
    }
    while (v23 != (uint64_t *)v40);
  }
  v25 = v43;
  size_t v26 = v44 - (unsigned char *)v43;
  BOOL v27 = v44 - (unsigned char *)v43 == 8 && *(void *)v43 == 1;
  v28 = v41;
  size_t v29 = v42 - (unsigned char *)v41;
  BOOL v30 = v42 - (unsigned char *)v41 == 8 && *(void *)v41 == 1;
  if (v27 || v30)
  {
    v32 = v37;
    v31 = v38;
    if (v27)
    {
      LODWORD(__B[0]) = -1082130432;
      vDSP_vsmsa(v10, 1, (const float *)__B, v8, v12, 1, v22);
    }
    else
    {
      *(float *)__B = -*v10;
      vDSP_vsadd(v8, 1, (const float *)__B, v12, 1, v22);
    }
    goto LABEL_51;
  }
  int64_t v33 = v40 - (unsigned char *)v39;
  if (v26 == v40 - (unsigned char *)v39)
  {
    int v34 = memcmp(v43, v39, v44 - (unsigned char *)v43);
    if (v29 == v26 && !v34)
    {
      if (!memcmp(v28, v21, v26))
      {
        v32 = v37;
        v31 = v38;
        vDSP_vsub(v10, 1, v8, 1, v12, 1, v22);
        goto LABEL_51;
      }
      goto LABEL_26;
    }
    if (!v34) {
      goto LABEL_26;
    }
  }
  if (v29 == v33 && !memcmp(v28, v21, v29))
  {
    v32 = v37;
    v31 = v38;
    std::vector<float>::vector(__B, v22);
    v55 = 0;
    v56 = 0;
    uint64_t v57 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v55, v39, (uint64_t)v40, (v40 - (unsigned char *)v39) >> 3);
    __p = 0;
    v53 = 0;
    uint64_t v54 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v43, (uint64_t)v44, (v44 - (unsigned char *)v43) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v55, (uint64_t)v8, (uint64_t *)&__p, (uint64_t)__B[0]);
    if (__p)
    {
      v53 = __p;
      operator delete(__p);
    }
    if (v55)
    {
      v56 = v55;
      operator delete(v55);
    }
    vDSP_vsub(v10, 1, (const float *)__B[0], 1, v12, 1, v22);
    goto LABEL_49;
  }
  if (v26 != v33) {
    goto LABEL_27;
  }
LABEL_26:
  if (memcmp(v25, v21, v26) || v29 == v33 && !memcmp(v28, v21, v29))
  {
LABEL_27:
    v32 = v37;
    v31 = v38;
    std::vector<float>::vector(__B, v22);
    v55 = 0;
    v56 = 0;
    uint64_t v57 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v55, v39, (uint64_t)v40, (v40 - (unsigned char *)v39) >> 3);
    __p = 0;
    v53 = 0;
    uint64_t v54 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v43, (uint64_t)v44, (v44 - (unsigned char *)v43) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v55, (uint64_t)v8, (uint64_t *)&__p, (uint64_t)__B[0]);
    uint64_t v35 = (uint64_t)v10;
    if (__p)
    {
      v53 = __p;
      operator delete(__p);
    }
    if (v55)
    {
      v56 = v55;
      operator delete(v55);
    }
    v36 = (const float *)__B[0];
    std::vector<float>::vector(v51, v22);
    v48 = 0;
    v49 = 0;
    uint64_t v50 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v48, v39, (uint64_t)v40, (v40 - (unsigned char *)v39) >> 3);
    v45 = 0;
    v46 = 0;
    uint64_t v47 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v45, v41, (uint64_t)v42, (v42 - (unsigned char *)v41) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v48, v35, (uint64_t *)&v45, (uint64_t)v51[0]);
    if (v45)
    {
      v46 = v45;
      operator delete(v45);
    }
    if (v48)
    {
      v49 = v48;
      operator delete(v48);
    }
    vDSP_vsub(v51[0], 1, v36, 1, v12, 1, v22);
    if (v51[0])
    {
      v51[1] = v51[0];
      operator delete(v51[0]);
    }
    goto LABEL_49;
  }
  v32 = v37;
  v31 = v38;
  std::vector<float>::vector(__B, v22);
  v55 = 0;
  v56 = 0;
  uint64_t v57 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v55, v39, (uint64_t)v40, (v40 - (unsigned char *)v39) >> 3);
  __p = 0;
  v53 = 0;
  uint64_t v54 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v41, (uint64_t)v42, (v42 - (unsigned char *)v41) >> 3);
  BrickLayers::BroadcastTo((uint64_t *)&v55, (uint64_t)v10, (uint64_t *)&__p, (uint64_t)__B[0]);
  if (__p)
  {
    v53 = __p;
    operator delete(__p);
  }
  if (v55)
  {
    v56 = v55;
    operator delete(v55);
  }
  vDSP_vsub((const float *)__B[0], 1, v8, 1, v12, 1, v22);
LABEL_49:
  if (__B[0])
  {
    __B[1] = __B[0];
    operator delete(__B[0]);
  }
LABEL_51:
  if (v39)
  {
    v40 = v39;
    operator delete(v39);
  }
  if (v41)
  {
    v42 = v41;
    operator delete(v41);
  }
  if (v43)
  {
    v44 = v43;
    operator delete(v43);
  }
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (MLSubtractBroadcastableBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MLSubtractBroadcastableBrick;
  v5 = [(MLSubtractBroadcastableBrick *)&v21 init];
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