@interface PFPFFBSProcessorGPU
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
@end

@implementation PFPFFBSProcessorGPU

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"fullROI"), "CGRectValue");
  double v9 = v8;
  double v11 = v10;
  int v12 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputMaxNumVertices"), "intValue");
  id v13 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputSigmaS"), "intValue");
  id v14 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputSigmaRLuma"), "intValue");
  id v15 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputSigmaRChroma"), "intValue");
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputLambda"), "floatValue");
  float v17 = v16;
  unsigned int v18 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputMaxNumIterations"), "intValue");
  if (v12 <= 1000) {
    sub_4BBD0();
  }
  if (!v13) {
    sub_4BBFC();
  }
  if (!v14) {
    sub_4BC28();
  }
  if (!v15) {
    sub_4BC54();
  }
  if (v17 == 0.0) {
    sub_4BC80();
  }
  if (!v18) {
    sub_4BCAC();
  }
  unsigned int v54 = v18;
  id v19 = [a3 objectAtIndexedSubscript:0];
  id v20 = [a3 objectAtIndexedSubscript:1];
  id v21 = [a3 objectAtIndexedSubscript:2];
  v22 = -[PFBilateralSolverGPU initWithWidth:height:maxVertices:commandBuffer:]([PFBilateralSolverGPU alloc], "initWithWidth:height:maxVertices:commandBuffer:", (unint64_t)v9, (unint64_t)v11, v12, [a5 metalCommandBuffer]);
  v23 = [[PFBilateralGridHash alloc] initWithWidth:(unint64_t)v9 height:(unint64_t)v11 maxHashTableSize:v12];
  id v24 = [v19 surface];
  [v19 region];
  if (-[PFBilateralGridHash createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:](v23, "createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:", v24, v13, v14, v15))
  {
    NSLog(@"Returning disparity image; unable to create 3D bilateral grid hash. Please file a radar.");
  }
  v25 = (__IOSurface *)[v19 surface];
  id v26 = objc_msgSend(objc_msgSend(a5, "metalCommandBuffer"), "device");
  size_t Width = IOSurfaceGetWidth(v25);
  v28 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:70 width:Width height:IOSurfaceGetHeight(v25) mipmapped:0];
  [(MTLTextureDescriptor *)v28 setUsage:23];
  id v29 = [v26 newTextureWithDescriptor:v28 iosurface:v25 plane:0];
  [v19 region];
  float64_t v52 = v30;
  [v19 region];
  v31.f64[0] = v52;
  v31.f64[1] = v32;
  int32x2_t v53 = vmovn_s64(vcvtq_s64_f64(vnegq_f64(v31)));
  [v20 region];
  float64_t v50 = v33;
  [v20 region];
  v34.f64[0] = v50;
  v34.f64[1] = v35;
  int32x2_t v51 = vmovn_s64(vcvtq_s64_f64(vnegq_f64(v34)));
  [v21 region];
  float64_t v48 = v36;
  [v21 region];
  v37.f64[0] = v48;
  v37.f64[1] = v38;
  int32x2_t v49 = vmovn_s64(vcvtq_s64_f64(vnegq_f64(v37)));
  [a5 region];
  float64_t v47 = v39;
  [a5 region];
  v40.f64[0] = v47;
  v40.f64[1] = v41;
  *(int32x2_t *)&v40.f64[0] = vmovn_s64(vcvtq_s64_f64(vnegq_f64(v40)));
  v56[1] = v53.i16[2];
  v56[0] = v53.i16[0];
  v56[3] = v51.i16[2];
  v56[2] = v51.i16[0];
  v56[5] = v49.i16[2];
  v56[4] = v49.i16[0];
  v56[7] = WORD2(v40.f64[0]);
  v56[6] = LOWORD(v40.f64[0]);
  id v42 = [v21 metalTexture];
  id v43 = [v20 metalTexture];
  id v44 = [a5 metalTexture];
  *(float *)&double v45 = v17;
  [(PFBilateralSolverGPU *)v22 doSolveWithBilateralGridhash:v23 reference:v29 disparity:v42 confidence:v43 output:v44 lambda:v54 maxIterations:v45 offsets:v56];

  return 1;
}

@end