@interface CIFaceMaskKernel
+ (BOOL)hasValidBuffers;
+ (BOOL)hasValidPipelines;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
+ (void)allocateBuffers:(id)a3;
+ (void)allocateBuffersIfNeeded:(id)a3;
+ (void)compilePipelines:(id)a3;
+ (void)compilePipelinesIfNeeded:(id)a3;
+ (void)releaseBuffers;
+ (void)releasePipelines;
@end

@implementation CIFaceMaskKernel

+ (BOOL)hasValidPipelines
{
  if (shaderCalc) {
    BOOL v2 = shaderApply == 0;
  }
  else {
    BOOL v2 = 1;
  }
  return !v2;
}

+ (void)compilePipelines:(id)a3
{
  id v9 = 0;
  v4 = objc_msgSend(a3, "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), 0);
  v5 = (void *)[v4 newFunctionWithName:@"CIFaceMask_calc"];
  shaderCalc = [a3 newComputePipelineStateWithFunction:v5 error:&v9];
  if (v9)
  {
    uint64_t v6 = [v9 localizedDescription];
    NSLog(&cfstr_FailedToInitia_0.isa, @"CIFaceMask_calc", v6, [v9 localizedFailureReason]);
  }

  v7 = (void *)[v4 newFunctionWithName:@"CIFaceMask_apply"];
  shaderApply = [a3 newComputePipelineStateWithFunction:v7 error:&v9];
  if (v9)
  {
    uint64_t v8 = [v9 localizedDescription];
    NSLog(&cfstr_FailedToInitia_0.isa, @"CIFaceMask_apply", v8, [v9 localizedFailureReason]);
  }
}

+ (void)releasePipelines
{
  if (shaderCalc) {

  }
  if (shaderApply) {
  shaderCalc = 0;
  }
  shaderApply = 0;
}

+ (void)compilePipelinesIfNeeded:(id)a3
{
  id v5 = (id)+[CIFaceMaskKernel compilePipelinesIfNeeded:]::targetedDevice;
  if ((id)+[CIFaceMaskKernel compilePipelinesIfNeeded:]::targetedDevice == a3)
  {
    if ([a1 hasValidPipelines]) {
      return;
    }
    id v5 = (id)+[CIFaceMaskKernel compilePipelinesIfNeeded:]::targetedDevice;
  }
  if (v5 != a3)
  {
    [a1 releasePipelines];
    +[CIFaceMaskKernel compilePipelinesIfNeeded:]::targetedDevice = (uint64_t)a3;
  }
  if (([a1 hasValidPipelines] & 1) == 0)
  {
    [a1 compilePipelines:a3];
  }
}

+ (BOOL)hasValidBuffers
{
  return applyParams != 0;
}

+ (void)allocateBuffers:(id)a3
{
  applyParams = [a3 newBufferWithLength:160 options:0];
}

+ (void)releaseBuffers
{
  if (applyParams) {

  }
  applyParams = 0;
}

+ (void)allocateBuffersIfNeeded:(id)a3
{
  id v5 = (id)+[CIFaceMaskKernel allocateBuffersIfNeeded:]::targetedDevice;
  if ((id)+[CIFaceMaskKernel allocateBuffersIfNeeded:]::targetedDevice == a3)
  {
    if ([a1 hasValidBuffers]) {
      return;
    }
    id v5 = (id)+[CIFaceMaskKernel allocateBuffersIfNeeded:]::targetedDevice;
  }
  if (v5 != a3)
  {
    [a1 releaseBuffers];
    +[CIFaceMaskKernel allocateBuffersIfNeeded:]::targetedDevice = (uint64_t)a3;
  }
  if (([a1 hasValidBuffers] & 1) == 0)
  {
    [a1 allocateBuffers:a3];
  }
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  v10 = (void *)[a5 metalCommandBuffer];
  uint64_t v11 = [v10 device];
  [a1 compilePipelinesIfNeeded:v11];
  [a1 allocateBuffersIfNeeded:v11];
  if (![a1 hasValidPipelines] || !objc_msgSend(a1, "hasValidBuffers")) {
    return 0;
  }
  v123[0] = 1022739087;
  if (a4)
  {
    v12 = (void *)[a4 objectForKey:@"face0CentreX"];
    float v13 = -1.0;
    LODWORD(v14) = -1.0;
    if (v12) {
      objc_msgSend(v12, "floatValue", v14);
    }
    LODWORD(v124) = LODWORD(v14);
    v15 = (void *)[a4 objectForKey:@"face0CentreY"];
    if (v15)
    {
      [v15 floatValue];
      float v13 = v16;
    }
    *(float *)&long long v125 = v13;
    v17 = (void *)[a4 objectForKey:@"face0LeftEyeX"];
    float v18 = -1.0;
    LODWORD(v19) = -1.0;
    if (v17) {
      objc_msgSend(v17, "floatValue", v19);
    }
    LODWORD(v126) = LODWORD(v19);
    v20 = (void *)[a4 objectForKey:@"face0LeftEyeY"];
    if (v20)
    {
      [v20 floatValue];
      float v18 = v21;
    }
    *(float *)&long long v127 = v18;
    v22 = (void *)[a4 objectForKey:@"face0RightEyeX"];
    float v23 = -1.0;
    LODWORD(v24) = -1.0;
    if (v22) {
      objc_msgSend(v22, "floatValue", v24);
    }
    LODWORD(v128) = LODWORD(v24);
    v25 = (void *)[a4 objectForKey:@"face0RightEyeY"];
    if (v25)
    {
      [v25 floatValue];
      float v23 = v26;
    }
    *(float *)&long long v129 = v23;
    v27 = (void *)[a4 objectForKey:@"face0ChinX"];
    float v28 = -1.0;
    LODWORD(v29) = -1.0;
    if (v27) {
      objc_msgSend(v27, "floatValue", v29);
    }
    LODWORD(v130) = LODWORD(v29);
    v30 = (void *)[a4 objectForKey:@"face0ChinY"];
    if (v30)
    {
      [v30 floatValue];
      float v28 = v31;
    }
    *(float *)&uint64_t v131 = v28;
    v32 = (void *)[a4 objectForKey:@"face1CentreX"];
    float v33 = -1.0;
    LODWORD(v34) = -1.0;
    if (v32) {
      objc_msgSend(v32, "floatValue", v34);
    }
    DWORD1(v124) = LODWORD(v34);
    v35 = (void *)[a4 objectForKey:@"face1CentreY"];
    if (v35)
    {
      [v35 floatValue];
      float v33 = v36;
    }
    *((float *)&v125 + 1) = v33;
    v37 = (void *)[a4 objectForKey:@"face1LeftEyeX"];
    float v38 = -1.0;
    LODWORD(v39) = -1.0;
    if (v37) {
      objc_msgSend(v37, "floatValue", v39);
    }
    DWORD1(v126) = LODWORD(v39);
    v40 = (void *)[a4 objectForKey:@"face1LeftEyeY"];
    if (v40)
    {
      [v40 floatValue];
      float v38 = v41;
    }
    *((float *)&v127 + 1) = v38;
    v42 = (void *)[a4 objectForKey:@"face1RightEyeX"];
    float v43 = -1.0;
    LODWORD(v44) = -1.0;
    if (v42) {
      objc_msgSend(v42, "floatValue", v44);
    }
    DWORD1(v128) = LODWORD(v44);
    v45 = (void *)[a4 objectForKey:@"face1RightEyeY"];
    if (v45)
    {
      [v45 floatValue];
      float v43 = v46;
    }
    *((float *)&v129 + 1) = v43;
    v47 = (void *)[a4 objectForKey:@"face1ChinX"];
    float v48 = -1.0;
    LODWORD(v49) = -1.0;
    if (v47) {
      objc_msgSend(v47, "floatValue", v49);
    }
    DWORD1(v130) = LODWORD(v49);
    v50 = (void *)[a4 objectForKey:@"face1ChinY"];
    if (v50)
    {
      [v50 floatValue];
      float v48 = v51;
    }
    *((float *)&v131 + 1) = v48;
    v52 = (void *)[a4 objectForKey:@"face2CentreX"];
    float v53 = -1.0;
    LODWORD(v54) = -1.0;
    if (v52) {
      objc_msgSend(v52, "floatValue", v54);
    }
    DWORD2(v124) = LODWORD(v54);
    v55 = (void *)[a4 objectForKey:@"face2CentreY"];
    if (v55)
    {
      [v55 floatValue];
      float v53 = v56;
    }
    *((float *)&v125 + 2) = v53;
    v57 = (void *)[a4 objectForKey:@"face2LeftEyeX"];
    float v58 = -1.0;
    LODWORD(v59) = -1.0;
    if (v57) {
      objc_msgSend(v57, "floatValue", v59);
    }
    DWORD2(v126) = LODWORD(v59);
    v60 = (void *)[a4 objectForKey:@"face2LeftEyeY"];
    if (v60)
    {
      [v60 floatValue];
      float v58 = v61;
    }
    *((float *)&v127 + 2) = v58;
    v62 = (void *)[a4 objectForKey:@"face2RightEyeX"];
    float v63 = -1.0;
    LODWORD(v64) = -1.0;
    if (v62) {
      objc_msgSend(v62, "floatValue", v64);
    }
    DWORD2(v128) = LODWORD(v64);
    v65 = (void *)[a4 objectForKey:@"face2RightEyeY"];
    if (v65)
    {
      [v65 floatValue];
      float v63 = v66;
    }
    *((float *)&v129 + 2) = v63;
    v67 = (void *)[a4 objectForKey:@"face2ChinX"];
    float v68 = -1.0;
    LODWORD(v69) = -1.0;
    if (v67) {
      objc_msgSend(v67, "floatValue", v69);
    }
    DWORD2(v130) = LODWORD(v69);
    v70 = (void *)[a4 objectForKey:@"face2ChinY"];
    if (v70)
    {
      [v70 floatValue];
      float v68 = v71;
    }
    int v132 = LODWORD(v68);
    v72 = (void *)[a4 objectForKey:@"face3CentreX"];
    float v73 = -1.0;
    LODWORD(v74) = -1.0;
    if (v72) {
      objc_msgSend(v72, "floatValue", v74);
    }
    HIDWORD(v124) = LODWORD(v74);
    v75 = (void *)[a4 objectForKey:@"face3CentreY"];
    if (v75)
    {
      [v75 floatValue];
      float v73 = v76;
    }
    *((float *)&v125 + 3) = v73;
    v77 = (void *)[a4 objectForKey:@"face3LeftEyeX"];
    float v78 = -1.0;
    LODWORD(v79) = -1.0;
    if (v77) {
      objc_msgSend(v77, "floatValue", v79);
    }
    HIDWORD(v126) = LODWORD(v79);
    v80 = (void *)[a4 objectForKey:@"face3LeftEyeY"];
    if (v80)
    {
      [v80 floatValue];
      float v78 = v81;
    }
    *((float *)&v127 + 3) = v78;
    v82 = (void *)[a4 objectForKey:@"face3RightEyeX"];
    float v83 = -1.0;
    LODWORD(v84) = -1.0;
    if (v82) {
      objc_msgSend(v82, "floatValue", v84);
    }
    HIDWORD(v128) = LODWORD(v84);
    v85 = (void *)[a4 objectForKey:@"face3RightEyeY"];
    if (v85)
    {
      [v85 floatValue];
      float v83 = v86;
    }
    *((float *)&v129 + 3) = v83;
    v87 = (void *)[a4 objectForKey:@"face3ChinX"];
    float v88 = -1.0;
    LODWORD(v89) = -1.0;
    if (v87) {
      objc_msgSend(v87, "floatValue", v89);
    }
    HIDWORD(v130) = LODWORD(v89);
    v90 = (void *)[a4 objectForKey:@"face3ChinY"];
    if (v90)
    {
      [v90 floatValue];
      float v88 = v91;
    }
  }
  else
  {
    __asm { FMOV            V0.2S, #-1.0 }
    uint64_t v131 = _D0;
    int v132 = -1082130432;
    __asm { FMOV            V0.4S, #-1.0 }
    long long v124 = _Q0;
    long long v125 = _Q0;
    long long v126 = _Q0;
    long long v127 = _Q0;
    long long v128 = _Q0;
    long long v129 = _Q0;
    float v88 = -1.0;
    long long v130 = _Q0;
  }
  float v133 = v88;
  long long v134 = xmmword_1939531E0;
  long long v135 = xmmword_1939531F0;
  uint64_t v136 = 0x3F0000003E4CCCCDLL;
  [a5 region];
  double v100 = v99;
  [a5 region];
  float v102 = v100 / v101;
  float v137 = v102;
  [a5 region];
  double v104 = v103;
  double v106 = v105;
  uint64_t v107 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "metalTexture");
  uint64_t v108 = [a5 metalTexture];
  v109 = (void *)[v10 computeCommandEncoder];
  [v109 setComputePipelineState:shaderCalc];
  [v109 setBytes:v123 length:192 atIndex:0];
  BOOL v92 = 1;
  [v109 setBuffer:0 offset:0 atIndex:1];
  [v109 setTexture:v107 atIndex:0];
  int64x2_t v121 = vdupq_n_s64(1uLL);
  uint64_t v122 = 1;
  int64x2_t v119 = v121;
  uint64_t v120 = 1;
  [v109 dispatchThreadgroups:&v121 threadsPerThreadgroup:&v119];
  uint64_t v118 = 0;
  uint64_t v110 = [(id)shaderApply maxTotalThreadsPerThreadgroup];
  mtlutl_ComputeThreadGroupParameters(v110, [(id)shaderApply threadExecutionWidth], (_DWORD *)&v118 + 1, &v118, v104, v106);
  uint64_t v112 = v118;
  uint64_t v111 = HIDWORD(v118);
  unint64_t v113 = (unint64_t)(v104 / (double)HIDWORD(v118));
  unint64_t v114 = (unint64_t)(v106 / (double)v118);
  [v109 setComputePipelineState:shaderApply];
  [v109 setBuffer:0 offset:0 atIndex:0];
  [v109 setTexture:v107 atIndex:0];
  [v109 setTexture:v108 atIndex:1];
  v117[0] = v113;
  v117[1] = v114;
  v117[2] = 1;
  v116[0] = v111;
  v116[1] = v112;
  v116[2] = 1;
  [v109 dispatchThreadgroups:v117 threadsPerThreadgroup:v116];
  [v109 endEncoding];
  [v10 addCompletedHandler:&__block_literal_global_335];
  return v92;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 261;
}

+ (int)outputFormat
{
  return 261;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

@end