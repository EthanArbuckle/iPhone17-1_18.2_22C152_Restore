@interface MLErfActivationBrick
- (BOOL)hasGPUSupport;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (unint64_t)size;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLErfActivationBrick

- (unint64_t)size
{
  return self->_size;
}

- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4
{
  id v12 = a4;
  v6 = [a3 objectAtIndexedSubscript:0];
  v7 = (float *)[v6 rawPointer];

  v8 = [v12 objectAtIndexedSubscript:0];
  v9 = (float *)[v8 rawPointer];

  for (unint64_t i = self->_size; i; --i)
  {
    float v11 = *v7++;
    *v9++ = erff(v11);
  }
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v4 = a3;
  v5 = [v4 objectAtIndexedSubscript:0];
  int v6 = [v5 sequence];
  v7 = [v4 objectAtIndexedSubscript:0];
  int v8 = [v7 batch];
  v9 = [v4 objectAtIndexedSubscript:0];
  int v10 = [v9 channels];
  float v11 = [v4 objectAtIndexedSubscript:0];
  int v12 = [v11 height];
  v13 = [v4 objectAtIndexedSubscript:0];
  self->_size = (int)(v8 * v6 * v10 * v12 * [v13 width]);

  return v4;
}

@end