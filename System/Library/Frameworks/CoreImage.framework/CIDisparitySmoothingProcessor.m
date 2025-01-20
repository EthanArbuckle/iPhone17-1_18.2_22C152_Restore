@interface CIDisparitySmoothingProcessor
+ (BOOL)hasValidPipelines;
+ (BOOL)outputIsOpaque;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
+ (void)compilePipelines:(id)a3;
+ (void)compilePipelinesIfNeeded:(id)a3;
+ (void)releasePipelines;
@end

@implementation CIDisparitySmoothingProcessor

+ (BOOL)hasValidPipelines
{
  return shaderDisparitySmoothing != 0;
}

+ (void)compilePipelines:(id)a3
{
  id v7 = 0;
  v4 = objc_msgSend(a3, "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), 0);
  v5 = (void *)[v4 newFunctionWithName:@"CIDisparitySmoothing"];
  shaderDisparitySmoothing = [a3 newComputePipelineStateWithFunction:v5 error:&v7];
  if (v7)
  {
    uint64_t v6 = [v7 localizedDescription];
    NSLog(&cfstr_FailedToInitia.isa, v6, [v7 localizedFailureReason]);
  }
}

+ (void)releasePipelines
{
  if (shaderDisparitySmoothing) {

  }
  shaderDisparitySmoothing = 0;
}

+ (void)compilePipelinesIfNeeded:(id)a3
{
  id v5 = (id)+[CIDisparitySmoothingProcessor compilePipelinesIfNeeded:]::targetedDevice;
  if ((id)+[CIDisparitySmoothingProcessor compilePipelinesIfNeeded:]::targetedDevice == a3)
  {
    if ([a1 hasValidPipelines]) {
      return;
    }
    id v5 = (id)+[CIDisparitySmoothingProcessor compilePipelinesIfNeeded:]::targetedDevice;
  }
  if (v5 != a3)
  {
    [a1 releasePipelines];
    +[CIDisparitySmoothingProcessor compilePipelinesIfNeeded:]::targetedDevice = (uint64_t)a3;
  }
  if (([a1 hasValidPipelines] & 1) == 0)
  {
    [a1 compilePipelines:a3];
  }
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  v9 = objc_msgSend(a5, "metalCommandBuffer", a3, a4);
  objc_msgSend(a1, "compilePipelinesIfNeeded:", objc_msgSend(v9, "device"));
  int v10 = [a1 hasValidPipelines];
  if (v10)
  {
    v11 = (void *)[a3 objectAtIndexedSubscript:0];
    uint64_t v12 = [v11 metalTexture];
    uint64_t v13 = [a5 metalTexture];
    [v11 region];
    unsigned int v15 = v14;
    [v11 region];
    LODWORD(v11) = v15 >> 1;
    unsigned int v17 = v16 >> 1;
    uint64_t v27 = 0;
    uint64_t v18 = [(id)shaderDisparitySmoothing maxTotalThreadsPerThreadgroup];
    mtlutl_ComputeThreadGroupParameters(v18, [(id)shaderDisparitySmoothing threadExecutionWidth], (_DWORD *)&v27 + 1, &v27, v11, v17);
    uint64_t v20 = v27;
    uint64_t v19 = HIDWORD(v27);
    uint64_t v21 = v11 / HIDWORD(v27);
    uint64_t v22 = v17 / v27;
    v23 = (void *)[v9 computeCommandEncoder];
    [v23 setComputePipelineState:shaderDisparitySmoothing];
    [v23 setTexture:v12 atIndex:0];
    [v23 setTexture:v13 atIndex:1];
    v26[0] = v21;
    v26[1] = v22;
    v26[2] = 1;
    v25[0] = v19;
    v25[1] = v20;
    v25[2] = 1;
    [v23 dispatchThreadgroups:v26 threadsPerThreadgroup:v25];
    [v23 endEncoding];
  }
  return v10;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  return CGRectInset(a5, -5.0, -5.0);
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 0;
}

+ (int)outputFormat
{
  return 2053;
}

+ (BOOL)outputIsOpaque
{
  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

@end