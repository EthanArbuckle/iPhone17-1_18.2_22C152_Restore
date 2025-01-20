@interface MLTileBrick
- (BOOL)hasGPUSupport;
- (BOOL)shapeInfoNeeded;
- (MLTileBrick)initWithParameters:(id)a3;
- (NSArray)inputRanks;
- (NSArray)inputShapes;
- (NSArray)outputRanks;
- (NSArray)outputShapes;
- (NSArray)reps;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLTileBrick

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputShapes, 0);
  objc_storeStrong((id *)&self->_inputShapes, 0);
  objc_storeStrong((id *)&self->_outputRanks, 0);
  objc_storeStrong((id *)&self->_inputRanks, 0);

  objc_storeStrong((id *)&self->_reps, 0);
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

- (NSArray)reps
{
  return self->_reps;
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
  unint64_t v13 = [v12 unsignedIntegerValue];

  std::vector<unsigned long>::vector(v20, v13);
  EspressoBrickUtils::NSShape_to_VecShape(self->_reps, v20);
  v14 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(v19, [v14 unsignedIntegerValue]);

  v15 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(__p, [v15 unsignedIntegerValue]);

  if (self->_shapeInfoNeeded)
  {
    v16 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v16, v19);
  }
  else
  {
    v16 = [v6 objectAtIndexedSubscript:0];
    v17 = [v16 shape];
    EspressoBrickUtils::EspressoShape_to_NDShape(v17, (uint64_t)v19);
  }
  BrickLayers::Tile((uint64_t)v20, v9, (uint64_t **)v19, v11, (uint64_t *)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v19[0])
  {
    v19[1] = v19[0];
    operator delete(v19[0]);
  }
  if (v20[0])
  {
    v20[1] = v20[0];
    operator delete(v20[0]);
  }
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (MLTileBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MLTileBrick;
  v5 = [(MLTileBrick *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"reps"];
    reps = v5->_reps;
    v5->_reps = (NSArray *)v6;

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
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F611E8]);
  uint64_t v8 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(v18, [v8 unsignedIntegerValue]);

  if (self->_shapeInfoNeeded)
  {
    uint64_t v9 = [(NSArray *)self->_outputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v9, v18);
  }
  else
  {
    uint64_t v10 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
    unint64_t v11 = [v10 unsignedIntegerValue];

    std::vector<unsigned long>::vector(&v16, v11);
    std::vector<unsigned long>::vector(&__p, v11);
    uint64_t v12 = [v5 objectAtIndexedSubscript:0];
    EspressoBrickUtils::EspressoShape_to_NDShape(v12, (uint64_t)&v16);

    EspressoBrickUtils::NSShape_to_VecShape(self->_reps, &__p);
    BrickLayers::TileShapeComputation((uint64_t *)__p, (uint64_t)v15, (uint64_t *)v16, v17, (void *)v18[0]);
    if (__p)
    {
      v15 = __p;
      operator delete(__p);
    }
    if (v16)
    {
      v17 = v16;
      operator delete(v16);
    }
  }
  EspressoBrickUtils::NDShape_to_EspressoShape((uint64_t **)v18, v7);
  [v6 addObject:v7];
  if (v18[0])
  {
    v18[1] = v18[0];
    operator delete(v18[0]);
  }

  return v6;
}

@end