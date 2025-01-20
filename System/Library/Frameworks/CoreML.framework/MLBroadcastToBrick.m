@interface MLBroadcastToBrick
- (BOOL)hasGPUSupport;
- (BOOL)shapeInfoNeeded;
- (MLBroadcastToBrick)initWithParameters:(id)a3;
- (NSArray)inputRanks;
- (NSArray)inputShapes;
- (NSArray)outputRanks;
- (NSArray)outputShapes;
- (NSArray)targetShape;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLBroadcastToBrick

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputShapes, 0);
  objc_storeStrong((id *)&self->_inputShapes, 0);
  objc_storeStrong((id *)&self->_outputRanks, 0);
  objc_storeStrong((id *)&self->_inputRanks, 0);

  objc_storeStrong((id *)&self->_targetShape, 0);
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

- (NSArray)targetShape
{
  return self->_targetShape;
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
  uint64_t v9 = [v8 rawPointer];

  v10 = [v7 objectAtIndexedSubscript:0];
  uint64_t v11 = [v10 rawPointer];

  v12 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v23, [v12 unsignedIntegerValue]);

  std::vector<unsigned long>::vector(&v21, [(NSArray *)self->_targetShape count]);
  if (self->_shapeInfoNeeded)
  {
    v13 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v13, &v23);
  }
  else
  {
    v13 = [v6 objectAtIndexedSubscript:0];
    v14 = [v13 shape];
    EspressoBrickUtils::EspressoShape_to_NDShape(v14, (uint64_t)&v23);
  }
  EspressoBrickUtils::NSShape_to_VecShape(self->_targetShape, &v21);
  v18 = 0;
  v19 = 0;
  uint64_t v20 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v18, v21, (uint64_t)v22, (v22 - (unsigned char *)v21) >> 3);
  __p = 0;
  v16 = 0;
  uint64_t v17 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v23, (uint64_t)v24, (v24 - (unsigned char *)v23) >> 3);
  BrickLayers::BroadcastTo((uint64_t *)&v18, v9, (uint64_t *)&__p, v11);
  if (__p)
  {
    v16 = __p;
    operator delete(__p);
  }
  if (v18)
  {
    v19 = v18;
    operator delete(v18);
  }
  if (v21)
  {
    v22 = v21;
    operator delete(v21);
  }
  if (v23)
  {
    v24 = v23;
    operator delete(v23);
  }
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (MLBroadcastToBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MLBroadcastToBrick;
  v5 = [(MLBroadcastToBrick *)&v23 init];
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

    uint64_t v14 = [v4 objectForKeyedSubscript:@"targetShape"];
    targetShape = v5->_targetShape;
    v5->_targetShape = (NSArray *)v14;

    v5->_shapeInfoNeeded = 0;
    if ([(NSArray *)v5->_targetShape count] > 5) {
      v5->_shapeInfoNeeded = 1;
    }
    for (unsigned int i = 0; [(NSArray *)v5->_inputRanks count] > i; ++i)
    {
      uint64_t v17 = [(NSArray *)v5->_inputRanks objectAtIndexedSubscript:i];
      uint64_t v18 = [v17 integerValue];

      if (v18 >= 6) {
        v5->_shapeInfoNeeded = 1;
      }
    }
    for (unsigned int j = 0; [(NSArray *)v5->_outputRanks count] > j; ++j)
    {
      uint64_t v20 = [(NSArray *)v5->_outputRanks objectAtIndexedSubscript:j];
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
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F611E8]);
  id v7 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(__p, [v7 unsignedIntegerValue]);

  EspressoBrickUtils::NSShape_to_VecShape(self->_targetShape, __p);
  EspressoBrickUtils::NDShape_to_EspressoShape((uint64_t **)__p, v6);
  [v5 addObject:v6];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v5;
}

@end