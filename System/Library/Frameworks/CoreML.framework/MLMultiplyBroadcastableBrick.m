@interface MLMultiplyBroadcastableBrick
- (BOOL)hasGPUSupport;
- (BOOL)shapeInfoNeeded;
- (MLMultiplyBroadcastableBrick)initWithParameters:(id)a3;
- (NSArray)inputRanks;
- (NSArray)inputShapes;
- (NSArray)outputRanks;
- (NSArray)outputShapes;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLMultiplyBroadcastableBrick

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
  id v38 = v6;
  id v39 = a4;
  v7 = [v6 objectAtIndexedSubscript:0];
  v8 = (const float *)[v7 rawPointer];

  v9 = [v6 objectAtIndexedSubscript:1];
  v10 = (const float *)[v9 rawPointer];

  v11 = [v39 objectAtIndexedSubscript:0];
  v12 = (float *)[v11 rawPointer];

  v13 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v44, [v13 unsignedIntegerValue]);

  v14 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:1];
  std::vector<unsigned long>::vector(&v42, [v14 unsignedIntegerValue]);

  v15 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v40, [v15 unsignedIntegerValue]);

  if (self->_shapeInfoNeeded)
  {
    v16 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v16, &v44);

    v17 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:1];
    EspressoBrickUtils::NSShape_to_VecShape(v17, &v42);
  }
  else
  {
    v18 = [v6 objectAtIndexedSubscript:0];
    v19 = [v18 shape];
    EspressoBrickUtils::EspressoShape_to_NDShape(v19, (uint64_t)&v44);

    v17 = [v6 objectAtIndexedSubscript:1];
    v20 = [v17 shape];
    EspressoBrickUtils::EspressoShape_to_NDShape(v20, (uint64_t)&v42);
  }
  TensorAlgebraUtils::broadcasted_shape((uint64_t)v44, (uint64_t)v45, (uint64_t)v42, (uint64_t)v43, (uint64_t)v40, (uint64_t)v41);
  v21 = v40;
  vDSP_Length v22 = 1;
  if (v40 != v41)
  {
    v23 = (uint64_t *)v40;
    do
    {
      uint64_t v24 = *v23++;
      v22 *= v24;
    }
    while (v23 != (uint64_t *)v41);
  }
  v25 = v44;
  size_t v26 = v45 - (unsigned char *)v44;
  BOOL v27 = v45 - (unsigned char *)v44 == 8 && *(void *)v44 == 1;
  v28 = v42;
  size_t v29 = v43 - (unsigned char *)v42;
  BOOL v30 = v43 - (unsigned char *)v42 == 8 && *(void *)v42 == 1;
  if (v27 || v30)
  {
    if (v27) {
      v31 = v10;
    }
    else {
      v31 = v8;
    }
    if (v27) {
      v32 = v8;
    }
    else {
      v32 = v10;
    }
    v34 = v38;
    v33 = v39;
    vDSP_vsmul(v31, 1, v32, v12, 1, v22);
    goto LABEL_55;
  }
  int64_t v35 = v41 - (unsigned char *)v40;
  if (v26 == v41 - (unsigned char *)v40)
  {
    int v36 = memcmp(v44, v40, v45 - (unsigned char *)v44);
    if (v29 == v26 && !v36)
    {
      if (!memcmp(v28, v21, v26))
      {
        v34 = v38;
        v33 = v39;
        vDSP_vmul(v8, 1, v10, 1, v12, 1, v22);
        goto LABEL_55;
      }
      goto LABEL_30;
    }
    if (!v36) {
      goto LABEL_30;
    }
  }
  if (v29 == v35 && !memcmp(v28, v21, v29))
  {
    v34 = v38;
    v33 = v39;
    std::vector<float>::vector(v59, v22);
    v56 = 0;
    v57 = 0;
    uint64_t v58 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v56, v40, (uint64_t)v41, (v41 - (unsigned char *)v40) >> 3);
    __p = 0;
    v54 = 0;
    uint64_t v55 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v44, (uint64_t)v45, (v45 - (unsigned char *)v44) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v56, (uint64_t)v8, (uint64_t *)&__p, (uint64_t)v59[0]);
    if (__p)
    {
      v54 = __p;
      operator delete(__p);
    }
    if (v56)
    {
      v57 = v56;
      operator delete(v56);
    }
    vDSP_vmul((const float *)v59[0], 1, v10, 1, v12, 1, v22);
    goto LABEL_53;
  }
  if (v26 != v35) {
    goto LABEL_31;
  }
LABEL_30:
  if (memcmp(v25, v21, v26) || v29 == v35 && !memcmp(v28, v21, v29))
  {
LABEL_31:
    v34 = v38;
    v33 = v39;
    std::vector<float>::vector(v59, v22);
    v56 = 0;
    v57 = 0;
    uint64_t v58 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v56, v40, (uint64_t)v41, (v41 - (unsigned char *)v40) >> 3);
    __p = 0;
    v54 = 0;
    uint64_t v55 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v44, (uint64_t)v45, (v45 - (unsigned char *)v44) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v56, (uint64_t)v8, (uint64_t *)&__p, (uint64_t)v59[0]);
    if (__p)
    {
      v54 = __p;
      operator delete(__p);
    }
    if (v56)
    {
      v57 = v56;
      operator delete(v56);
    }
    v37 = (const float *)v59[0];
    std::vector<float>::vector(__B, v22);
    v49 = 0;
    v50 = 0;
    uint64_t v51 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v49, v40, (uint64_t)v41, (v41 - (unsigned char *)v40) >> 3);
    v46 = 0;
    v47 = 0;
    uint64_t v48 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v46, v42, (uint64_t)v43, (v43 - (unsigned char *)v42) >> 3);
    BrickLayers::BroadcastTo((uint64_t *)&v49, (uint64_t)v10, (uint64_t *)&v46, (uint64_t)__B[0]);
    if (v46)
    {
      v47 = v46;
      operator delete(v46);
    }
    if (v49)
    {
      v50 = v49;
      operator delete(v49);
    }
    vDSP_vmul(v37, 1, __B[0], 1, v12, 1, v22);
    if (__B[0])
    {
      __B[1] = __B[0];
      operator delete(__B[0]);
    }
    goto LABEL_53;
  }
  v34 = v38;
  v33 = v39;
  std::vector<float>::vector(v59, v22);
  v56 = 0;
  v57 = 0;
  uint64_t v58 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v56, v40, (uint64_t)v41, (v41 - (unsigned char *)v40) >> 3);
  __p = 0;
  v54 = 0;
  uint64_t v55 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v42, (uint64_t)v43, (v43 - (unsigned char *)v42) >> 3);
  BrickLayers::BroadcastTo((uint64_t *)&v56, (uint64_t)v10, (uint64_t *)&__p, (uint64_t)v59[0]);
  if (__p)
  {
    v54 = __p;
    operator delete(__p);
  }
  if (v56)
  {
    v57 = v56;
    operator delete(v56);
  }
  vDSP_vmul(v8, 1, (const float *)v59[0], 1, v12, 1, v22);
LABEL_53:
  if (v59[0])
  {
    v59[1] = v59[0];
    operator delete(v59[0]);
  }
LABEL_55:
  if (v40)
  {
    v41 = v40;
    operator delete(v40);
  }
  if (v42)
  {
    v43 = v42;
    operator delete(v42);
  }
  if (v44)
  {
    v45 = v44;
    operator delete(v44);
  }
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (MLMultiplyBroadcastableBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MLMultiplyBroadcastableBrick;
  v5 = [(MLMultiplyBroadcastableBrick *)&v21 init];
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