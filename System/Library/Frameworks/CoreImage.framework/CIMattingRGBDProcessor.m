@interface CIMattingRGBDProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CIMattingRGBDProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  v9 = (void *)[a5 metalCommandBuffer];
  v10 = (void *)[v9 device];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__CIMattingRGBDProcessor_processWithInputs_arguments_output_error___block_invoke;
  block[3] = &unk_1E57710E0;
  block[4] = a1;
  block[5] = v10;
  if (processWithInputs_arguments_output_error__onceToken_0 != -1) {
    dispatch_once(&processWithInputs_arguments_output_error__onceToken_0, block);
  }
  if (processWithInputs_arguments_output_error__library
    && (void *)[(id)processWithInputs_arguments_output_error__library device] != v10)
  {
    processWithInputs_arguments_output_error__library = objc_msgSend(v10, "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), 0);
  }
  v11 = [XMattingSolver alloc];
  v12 = [(XMattingSolver *)v11 initWithDevice:v10 library:processWithInputs_arguments_output_error__library];
  int v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputRadius"), "intValue");
  int v14 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputSubsampling"), "intValue");
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputEPS"), "doubleValue");
  float v16 = v15;
  int v17 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputNumIterations"), "intValue");
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"fgThresholdValue"), "floatValue");
  int v19 = v18;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"bgThresholdValue"), "floatValue");
  int v21 = v20;
  int v22 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"erosionKernelSize"), "intValue");
  char v23 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"useDepthFilter"), "BOOLValue");
  int v24 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"resolutionMode"), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "region");
  unsigned int v26 = v25;
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "region");
  v32[0] = v26;
  v32[1] = v27;
  v32[2] = v13;
  v32[3] = v14;
  *(float *)&v32[4] = v16;
  v32[5] = v17;
  char v33 = v23;
  __int16 v34 = 0;
  char v35 = 0;
  int v36 = v19;
  int v37 = v21;
  int v38 = v22;
  int v39 = v24;
  if ([(XMattingSolver *)v12 allocateResources:v32])
  {
    NSLog(&cfstr_UnableToAlloca.isa);
    BOOL v28 = 0;
  }
  else
  {
    BOOL v28 = -[XMattingSolver enqueueSolveOn:constraints:colorGuide:extraGuide:inputTexture:outputTexture:](v12, "enqueueSolveOn:constraints:colorGuide:extraGuide:inputTexture:outputTexture:", [v9 commandQueue], 0, objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "metalTexture"), objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "metalTexture"), objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "metalTexture"), objc_msgSend(a5, "metalTexture")) == 0;
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __67__CIMattingRGBDProcessor_processWithInputs_arguments_output_error___block_invoke_2;
  v31[3] = &unk_1E5770F28;
  v31[4] = v12;
  [v9 addCompletedHandler:v31];
  return v28;
}

uint64_t __67__CIMattingRGBDProcessor_processWithInputs_arguments_output_error___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 40), "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), 0);
  processWithInputs_arguments_output_error__library = result;
  return result;
}

void __67__CIMattingRGBDProcessor_processWithInputs_arguments_output_error___block_invoke_2(uint64_t a1)
{
}

+ (int)formatForInputAtIndex:(int)a3
{
  if (a3 >= 3) {
    +[CIMattingRGBDProcessor formatForInputAtIndex:]();
  }
  return *off_1E5772620[a3];
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
  if (!objc_msgSend(a4, "objectForKeyedSubscript:", @"imageExtents", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height))+[CIMattingRGBDProcessor roiForInput:arguments:outputRect:](); {
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"imageExtents"), "count") <= (unint64_t)a3)
  }
    +[CIMattingRGBDProcessor roiForInput:arguments:outputRect:]();
  v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"imageExtents"), "objectAtIndexedSubscript:", a3);

  [v7 CGRectValue];
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

+ (void)formatForInputAtIndex:.cold.1()
{
}

+ (void)roiForInput:arguments:outputRect:.cold.1()
{
}

+ (void)roiForInput:arguments:outputRect:.cold.2()
{
}

@end