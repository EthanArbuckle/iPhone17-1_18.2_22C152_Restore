@interface MLClipBrick
- (BOOL)hasGPUSupport;
- (MLClipBrick)initWithParameters:(id)a3;
- (NSArray)inputRanks;
- (NSArray)inputShapes;
- (NSArray)outputRanks;
- (NSArray)outputShapes;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLClipBrick

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
  v7 = [v5 objectAtIndexedSubscript:0];
  v8 = (const float *)[v7 rawPointer];

  v9 = [v5 objectAtIndexedSubscript:1];
  v10 = (const float *)[v9 rawPointer];

  v11 = [v5 objectAtIndexedSubscript:2];
  v12 = (const float *)[v11 rawPointer];

  v13 = [v6 objectAtIndexedSubscript:0];
  v14 = (float *)[v13 rawPointer];

  std::vector<unsigned long>::vector(&__p, 5uLL);
  v15 = [v5 objectAtIndexedSubscript:0];
  v16 = [v15 shape];
  EspressoBrickUtils::EspressoShape_to_NDShape(v16, (uint64_t)&__p);

  v17 = (uint64_t *)__p;
  vDSP_Length v18 = 1;
  while (v17 != v21)
  {
    uint64_t v19 = *v17++;
    v18 *= v19;
  }
  vDSP_vclip(v8, 1, v10, v12, v14, 1, v18);
  if (__p)
  {
    v21 = (uint64_t *)__p;
    operator delete(__p);
  }
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (MLClipBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MLClipBrick;
  id v5 = [(MLClipBrick *)&v15 init];
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