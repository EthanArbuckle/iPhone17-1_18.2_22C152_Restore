@interface MLExpBrick
- (BOOL)hasGPUSupport;
- (BOOL)withBase2;
- (MLExpBrick)initWithParameters:(id)a3;
- (NSArray)inputRanks;
- (NSArray)inputShapes;
- (NSArray)outputRanks;
- (NSArray)outputShapes;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLExpBrick

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

- (BOOL)withBase2
{
  return self->_withBase2;
}

- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v19 = 0;
  v8 = [v6 objectAtIndexedSubscript:0];
  v9 = (const float *)[v8 rawPointer];

  v10 = [v7 objectAtIndexedSubscript:0];
  v11 = (float *)[v10 rawPointer];

  std::vector<unsigned long>::vector(&__p, 5uLL);
  v12 = [v6 objectAtIndexedSubscript:0];
  v13 = [v12 shape];
  EspressoBrickUtils::EspressoShape_to_NDShape(v13, (uint64_t)&__p);

  v14 = (uint64_t *)__p;
  int v15 = 1;
  while (v14 != v18)
  {
    uint64_t v16 = *v14++;
    v15 *= v16;
  }
  int v19 = v15;
  if (self->_withBase2) {
    vvexp2f(v11, v9, &v19);
  }
  else {
    vvexpf(v11, v9, &v19);
  }
  if (__p)
  {
    v18 = (uint64_t *)__p;
    operator delete(__p);
  }
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (MLExpBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MLExpBrick;
  v5 = [(MLExpBrick *)&v16 init];
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

    v14 = [v4 objectForKeyedSubscript:@"withBase2"];
    v5->_withBase2 = [v14 BOOLValue];
  }
  return v5;
}

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v4 = a3;

  return v4;
}

@end