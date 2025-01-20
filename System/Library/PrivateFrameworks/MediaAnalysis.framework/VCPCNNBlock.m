@interface VCPCNNBlock
- (BOOL)generateOutput;
- (BOOL)supportGPU;
- (BOOL)useGPU;
- (NSMutableArray)inputSize;
- (NSMutableArray)outputSize;
- (VCPCNNData)input;
- (VCPCNNData)output;
- (VCPCNNMetalContext)context;
- (int)constructBlock:(id)a3 context:(id)a4;
- (int)forward;
- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4;
- (void)setGenerateOutput:(BOOL)a3;
- (void)setInput:(id)a3;
- (void)setInputSize:(id)a3;
- (void)setOutput:(id)a3;
- (void)setOutputSize:(id)a3;
@end

@implementation VCPCNNBlock

- (int)constructBlock:(id)a3 context:(id)a4
{
  return -4;
}

- (int)forward
{
  return -4;
}

- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4
{
  return 0;
}

- (BOOL)supportGPU
{
  return 0;
}

- (BOOL)useGPU
{
  return 0;
}

- (NSMutableArray)inputSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputSize);
  return (NSMutableArray *)WeakRetained;
}

- (void)setInputSize:(id)a3
{
}

- (NSMutableArray)outputSize
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOutputSize:(id)a3
{
}

- (VCPCNNData)input
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_input);
  return (VCPCNNData *)WeakRetained;
}

- (void)setInput:(id)a3
{
}

- (VCPCNNData)output
{
  return (VCPCNNData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOutput:(id)a3
{
}

- (VCPCNNMetalContext)context
{
  return (VCPCNNMetalContext *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)generateOutput
{
  return self->_generateOutput;
}

- (void)setGenerateOutput:(BOOL)a3
{
  self->_generateOutput = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_destroyWeak((id *)&self->_input);
  objc_storeStrong((id *)&self->_outputSize, 0);
  objc_destroyWeak((id *)&self->_inputSize);
}

@end