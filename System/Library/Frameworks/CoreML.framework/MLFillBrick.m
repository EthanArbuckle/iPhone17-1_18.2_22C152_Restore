@interface MLFillBrick
- (BOOL)hasGPUSupport;
- (MLFillBrick)initWithParameters:(id)a3;
- (NSArray)inputRanks;
- (NSArray)inputShapes;
- (NSArray)outputRanks;
- (NSArray)outputShapes;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLFillBrick

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

- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectAtIndexedSubscript:1];
  v8 = (const float *)[v7 rawPointer];

  v9 = [v6 objectAtIndexedSubscript:0];
  v10 = (float *)[v9 rawPointer];

  std::vector<unsigned long>::vector(&__p, 5uLL);
  v11 = [v5 objectAtIndexedSubscript:0];
  v12 = [v11 shape];
  EspressoBrickUtils::EspressoShape_to_NDShape(v12, (uint64_t)&__p);

  v13 = (uint64_t *)__p;
  vDSP_Length v14 = 1;
  while (v13 != v17)
  {
    uint64_t v15 = *v13++;
    v14 *= v15;
  }
  vDSP_vfill(v8, v10, 1, v14);
  if (__p)
  {
    v17 = (uint64_t *)__p;
    operator delete(__p);
  }
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (MLFillBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MLFillBrick;
  id v5 = [(MLFillBrick *)&v15 init];
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
  }
  return v5;
}

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [v4 objectAtIndexedSubscript:0];
  [v5 addObject:v6];

  return v5;
}

@end