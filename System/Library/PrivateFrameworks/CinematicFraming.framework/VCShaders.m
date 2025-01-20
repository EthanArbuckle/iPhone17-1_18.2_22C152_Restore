@interface VCShaders
- (VCShaders)init;
- (VCShaders)initWithContext:(id)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
@end

@implementation VCShaders

- (VCShaders)init
{
  return 0;
}

- (VCShaders)initWithContext:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_context, a3);
  uint64_t v6 = 0;
  kernels = self->_kernels;
  char v8 = 1;
  while (1)
  {
    char v9 = v8;
    context = self->_context;
    v11 = [NSString stringWithUTF8String:VCPKernelNames[v6]];
    uint64_t v12 = [(FigMetalContext *)context computePipelineStateFor:v11 constants:0];
    v13 = kernels[v6];
    kernels[v6] = (MTLComputePipelineState *)v12;

    if (!kernels[v6]) {
      break;
    }
    char v8 = 0;
    uint64_t v6 = 1;
    if ((v9 & 1) == 0)
    {
      v14 = self;
      goto LABEL_6;
    }
  }
  v14 = 0;
LABEL_6:

  return v14;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  if (a3 <= 2)
  {
    v4 = self->_kernels[a3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  uint64_t v3 = 16;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end