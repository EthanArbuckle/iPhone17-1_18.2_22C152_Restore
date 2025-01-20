@interface CIFocalPlaneProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CIFocalPlaneProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  v10 = (void *)[a5 metalCommandBuffer];
  uint64_t v11 = [v10 device];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CIFocalPlaneProcessor_processWithInputs_arguments_output_error___block_invoke;
  block[3] = &unk_1E57710E0;
  block[4] = a1;
  block[5] = v11;
  if (+[CIFocalPlaneProcessor processWithInputs:arguments:output:error:]::onceToken != -1) {
    dispatch_once(&+[CIFocalPlaneProcessor processWithInputs:arguments:output:error:]::onceToken, block);
  }
  v12 = [XFocalPlane alloc];
  v13 = [(XFocalPlane *)v12 initWithDevice:v11 library:+[CIFocalPlaneProcessor processWithInputs:arguments:output:error:]::library];
  v14 = (void *)[a4 objectForKeyedSubscript:@"inputFocusRect"];
  [v14 X];
  float v16 = v15;
  [v14 Y];
  float v18 = v17;
  [v14 Z];
  float v20 = v19;
  [v14 W];
  float v22 = v21;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputZeroShiftPercentile"), "floatValue");
  int v24 = v23;
  *(float *)v69 = v16;
  *(float *)&v69[1] = v18;
  *(float *)&v69[2] = v20;
  *(float *)&v69[3] = v22;
  v69[4] = v23;
  [(XFocalPlane *)v13 setConfig:v69];
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputAlphaThreshold"), "floatValue");
  int v26 = v25;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputAmplitude"), "floatValue");
  int v28 = v27;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputExponent"), "floatValue");
  int v30 = v29;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputGamma"), "floatValue");
  int v32 = v31;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputMinFactor"), "floatValue");
  int v34 = v33;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputMaxFactor"), "floatValue");
  int v36 = v35;
  int v37 = [(XFocalPlane *)v13 allocateResources];
  if (!v37)
  {
    int v61 = v26;
    v38 = objc_msgSend((id)objc_msgSend(v10, "commandQueue"), "commandBuffer");
    v39 = (void *)[v38 blitCommandEncoder];
    [a5 region];
    double v41 = v40;
    objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "region");
    id v42 = a5;
    if (v41 >= v43) {
      id v42 = (id)[a3 objectAtIndexedSubscript:0];
    }
    [v42 region];
    unint64_t v45 = (unint64_t)v44;
    [a5 region];
    double v47 = v46;
    objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "region");
    id v48 = a5;
    if (v47 >= v49) {
      id v48 = (id)[a3 objectAtIndexedSubscript:0];
    }
    [v48 region];
    unint64_t v51 = (unint64_t)v50;
    uint64_t v52 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "metalTexture");
    objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "region");
    unint64_t v54 = (unint64_t)v53;
    objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "region");
    v68[0] = v54;
    v68[1] = (unint64_t)v55;
    v68[2] = 0;
    v67[0] = v45;
    v67[1] = v51;
    v67[2] = 1;
    uint64_t v56 = [a5 metalTexture];
    [a5 region];
    unint64_t v58 = (unint64_t)v57;
    [a5 region];
    v66[0] = v58;
    v66[1] = (unint64_t)v59;
    v66[2] = 0;
    [v39 copyFromTexture:v52 sourceSlice:0 sourceLevel:0 sourceOrigin:v68 sourceSize:v67 toTexture:v56 destinationSlice:0 destinationLevel:0 destinationOrigin:v66];
    [v39 endEncoding];
    [v38 commit];
    v63[0] = v24;
    v63[1] = v61;
    v63[2] = v28;
    v63[3] = v30;
    v63[4] = v32;
    v63[5] = v34;
    v63[6] = v36;
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    int v37 = -[XFocalPlane encodeDisparityRefinementPreprocessingOn:alphaTexture:inputDisparityTexture:outputDisparityTexture:configuration:](v13, "encodeDisparityRefinementPreprocessingOn:alphaTexture:inputDisparityTexture:outputDisparityTexture:configuration:", v10, objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "metalTexture"), objc_msgSend(a5, "metalTexture"), objc_msgSend(a5, "metalTexture"), v63);
  }
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __66__CIFocalPlaneProcessor_processWithInputs_arguments_output_error___block_invoke_2;
  v62[3] = &unk_1E5770F28;
  v62[4] = v13;
  [v10 addCompletedHandler:v62];
  return v37 == 0;
}

uint64_t __66__CIFocalPlaneProcessor_processWithInputs_arguments_output_error___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 40), "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), 0);
  +[CIFocalPlaneProcessor processWithInputs:arguments:output:error:]::library = result;
  return result;
}

void __66__CIFocalPlaneProcessor_processWithInputs_arguments_output_error___block_invoke_2(uint64_t a1)
{
}

+ (int)formatForInputAtIndex:(int)a3
{
  v3 = &kCIFormatRh;
  if (a3) {
    v3 = &kCIFormatR8;
  }
  return *v3;
}

+ (int)outputFormat
{
  return 2053;
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  v5 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"imageExtents", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height), "objectAtIndexedSubscript:", a3);

  [v5 CGRectValue];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

@end