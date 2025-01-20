@interface CIGenericMetalProcessor
+ (BOOL)outputIsOpaque;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)skipFormatChecks;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (id)applyWithExtent:(CGRect)a3 inputs:(id)a4 arguments:(id)a5 error:(id *)a6;
+ (id)applyWithExtent:(CGRect)a3 shader:(id)a4 inputs:(id)a5 arguments:(id)a6 error:(id *)a7;
+ (id)applyWithExtent:(CGRect)a3 shader:(id)a4 inputs:(id)a5 className:(id)a6 arguments:(id)a7 error:(id *)a8;
+ (id)applyWithExtent:(CGRect)a3 shader:(id)a4 inputs:(id)a5 insetRects:(id)a6 arguments:(id)a7 error:(id *)a8;
+ (id)applyWithExtent:(CGRect)a3 shader:(id)a4 inputs:(id)a5 roiMethods:(id)a6 insetRects:(id)a7 scaleFactors:(id)a8 arguments:(id)a9 error:(id *)a10;
+ (id)applyWithExtent:(CGRect)a3 shader:(id)a4 inputs:(id)a5 scaleFactors:(id)a6 arguments:(id)a7 error:(id *)a8;
+ (id)logDescription:(id)a3;
+ (int)formatForInputAtIndex:(int)a3;
@end

@implementation CIGenericMetalProcessor

+ (id)logDescription:(id)a3
{
  v3 = NSString;
  uint64_t v4 = [a3 objectForKeyedSubscript:@"_shader"];
  v5 = @"nil";
  if (v4) {
    v5 = (__CFString *)v4;
  }
  return (id)[v3 stringWithFormat:@"CIGenericMetalProcessor-%@", v5];
}

+ (BOOL)skipFormatChecks
{
  return 1;
}

+ (id)applyWithExtent:(CGRect)a3 shader:(id)a4 inputs:(id)a5 roiMethods:(id)a6 insetRects:(id)a7 scaleFactors:(id)a8 arguments:(id)a9 error:(id *)a10
{
  if (a4)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    v19 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a9];
    [v19 setObject:a4 forKeyedSubscript:@"_shader"];
    if (a6) {
      [v19 setObject:a6 forKeyedSubscript:@"_roiMethods"];
    }
    if (a7) {
      [v19 setObject:a7 forKeyedSubscript:@"_insetRects"];
    }
    if (a8) {
      [v19 setObject:a8 forKeyedSubscript:@"_scaleFactors"];
    }
    v20 = objc_opt_class();
    return (id)objc_msgSend(v20, "applyWithExtent:inputs:arguments:error:", a5, v19, a10, x, y, width, height);
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

+ (id)applyWithExtent:(CGRect)a3 shader:(id)a4 inputs:(id)a5 insetRects:(id)a6 arguments:(id)a7 error:(id *)a8
{
  if (a4)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    v16 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a7];
    [v16 setObject:a4 forKeyedSubscript:@"_shader"];
    if (a6) {
      [v16 setObject:a6 forKeyedSubscript:@"_insetRects"];
    }
    v17 = objc_opt_class();
    return (id)objc_msgSend(v17, "applyWithExtent:inputs:arguments:error:", a5, v16, a8, x, y, width, height);
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

+ (id)applyWithExtent:(CGRect)a3 shader:(id)a4 inputs:(id)a5 scaleFactors:(id)a6 arguments:(id)a7 error:(id *)a8
{
  if (a4)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    v16 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a7];
    [v16 setObject:a4 forKeyedSubscript:@"_shader"];
    if (a6) {
      [v16 setObject:a6 forKeyedSubscript:@"_scaleFactors"];
    }
    v17 = objc_opt_class();
    return (id)objc_msgSend(v17, "applyWithExtent:inputs:arguments:error:", a5, v16, a8, x, y, width, height);
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

+ (id)applyWithExtent:(CGRect)a3 shader:(id)a4 inputs:(id)a5 arguments:(id)a6 error:(id *)a7
{
  if (a4)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    v14 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a6];
    [v14 setObject:a4 forKeyedSubscript:@"_shader"];
    v15 = objc_opt_class();
    return (id)objc_msgSend(v15, "applyWithExtent:inputs:arguments:error:", a5, v14, a7, x, y, width, height);
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

+ (id)applyWithExtent:(CGRect)a3 shader:(id)a4 inputs:(id)a5 className:(id)a6 arguments:(id)a7 error:(id *)a8
{
  if (a4)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    v16 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a7];
    [v16 setObject:a4 forKeyedSubscript:@"_shader"];
    if (a6) {
      [v16 setObject:a6 forKeyedSubscript:@"_class"];
    }
    v17 = objc_opt_class();
    return (id)objc_msgSend(v17, "applyWithExtent:inputs:arguments:error:", a5, v16, a8, x, y, width, height);
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  v10 = (void *)[a5 metalCommandBuffer];
  v11 = (void *)[v10 device];
  id v79 = a4;
  uint64_t v12 = [a4 objectForKeyedSubscript:@"_shader"];
  if (!v12)
  {
    NSLog(&cfstr_ShaderNameNotS.isa);
    return 0;
  }
  uint64_t v13 = v12;
  if (processWithInputs_arguments_output_error__onceToken != -1) {
    dispatch_once(&processWithInputs_arguments_output_error__onceToken, &__block_literal_global_34);
  }
  v14 = (void *)processWithInputs_arguments_output_error__shaderDict;
  objc_sync_enter((id)processWithInputs_arguments_output_error__shaderDict);
  v15 = (void *)[(id)processWithInputs_arguments_output_error__shaderDict objectForKey:v13];
  id obj = (id)[(id)processWithInputs_arguments_output_error__reflectionDict objectForKey:v13];
  objc_sync_exit(v14);
  if (!v15)
  {
    v85[0] = 0;
    if (!v11)
    {
      v15 = 0;
      goto LABEL_5;
    }
    v66 = objc_msgSend(v11, "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), 0);
    v67 = (void *)[v66 newFunctionWithName:v13];
    v84[0] = 0;
    v15 = objc_msgSend((id)objc_msgSend(v66, "device"), "newComputePipelineStateWithFunction:options:reflection:error:", v67, 3, v84, v85);

    if (!v85[0] && v84[0] && v15)
    {
      v68 = (void *)processWithInputs_arguments_output_error__shaderDict;
      objc_sync_enter((id)processWithInputs_arguments_output_error__shaderDict);
      [(id)processWithInputs_arguments_output_error__shaderDict setObject:v15 forKeyedSubscript:v13];

      objc_sync_exit(v68);
      v69 = (void *)processWithInputs_arguments_output_error__reflectionDict;
      objc_sync_enter((id)processWithInputs_arguments_output_error__reflectionDict);
      if (v84[0])
      {
        uint64_t v70 = [v84[0] arguments];
        [(id)processWithInputs_arguments_output_error__reflectionDict setObject:v70 forKeyedSubscript:v13];
        id obj = (id)[v84[0] arguments];
      }
      objc_sync_exit(v69);

      goto LABEL_5;
    }
    uint64_t v71 = [v85[0] localizedDescription];
    NSLog(&cfstr_FailedToInitia_0.isa, v13, v71, [v85[0] localizedFailureReason]);
    if (v15) {

    }
    return 0;
  }
LABEL_5:
  BOOL v16 = 0;
  if (v15 && obj)
  {
    v80 = (void *)[v10 computeCommandEncoder];
    [v80 setComputePipelineState:v15];
    uint64_t v90 = 0;
    uint64_t v17 = [v15 maxTotalThreadsPerThreadgroup];
    unsigned int v18 = [v15 threadExecutionWidth];
    [a5 region];
    double v20 = v19;
    [a5 region];
    mtlutl_ComputeThreadGroupParameters(v17, v18, (_DWORD *)&v90 + 1, &v90, v20, v21);
    v76 = (void *)HIDWORD(v90);
    unint64_t v75 = v90;
    [a5 region];
    double v23 = v22;
    LODWORD(v6) = HIDWORD(v90);
    [a5 region];
    double v25 = v24;
    LODWORD(v7) = v90;
    v77 = (void **)malloc_type_calloc(8uLL, [obj count] + 1, 0xF2AF860FuLL);
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    uint64_t v26 = [obj countByEnumeratingWithState:&v86 objects:v91 count:16];
    if (v26)
    {
      unsigned int v78 = 0;
      unsigned int v81 = 0;
      uint64_t v27 = *(void *)v87;
      while (1)
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v87 != v27) {
            objc_enumerationMutation(obj);
          }
          v29 = *(void **)(*((void *)&v86 + 1) + 8 * v28);
          uint64_t v30 = [v29 type];
          if (v30 == 2)
          {
            if ([v29 access])
            {
              uint64_t v48 = [v29 access];
              id v49 = a5;
              if (v48 != 2)
              {
                NSLog(&cfstr_ReadWriteTextu.isa);
LABEL_62:
                BOOL v16 = 0;
                goto LABEL_63;
              }
            }
            else
            {
              id v49 = (id)[a3 objectAtIndexedSubscript:v78++];
            }
            uint64_t v53 = [v49 metalTexture];
            uint64_t v54 = [v29 index];
            if (!v53)
            {
              NSLog(&cfstr_CouldnTFindTex.isa, v54, [v29 name]);
              goto LABEL_62;
            }
            [v80 setTexture:v53 atIndex:v54];
          }
          else
          {
            if (v30) {
              goto LABEL_40;
            }
            uint64_t v31 = objc_msgSend(v79, "objectForKeyedSubscript:", objc_msgSend(v29, "name"));
            int v32 = objc_msgSend((id)objc_msgSend(v29, "name"), "isEqualToString:", @"_regions");
            if (v31) {
              char v33 = 1;
            }
            else {
              char v33 = v32;
            }
            if ((v33 & 1) == 0)
            {
              NSLog(&cfstr_CouldnTFindDat.isa, [v29 name]);
              goto LABEL_62;
            }
            if (v32)
            {
              uint64_t v34 = [a3 count];
              size_t v35 = 16 * (v34 + 1);
              v36 = (float *)malloc_type_malloc(v35, 0x2A52263uLL);
              v77[v81] = v36;
              [a5 region];
              ++v81;
              *(float *)&double v37 = v37;
              *(float *)&double v38 = v38;
              float *v36 = *(float *)&v37;
              v36[1] = *(float *)&v38;
              *(float *)&double v37 = v39;
              *(float *)&double v38 = v40;
              v36[2] = *(float *)&v37;
              v36[3] = *(float *)&v38;
              if ((unint64_t)(v34 + 1) >= 2)
              {
                uint64_t v41 = 0;
                v42 = v36 + 7;
                do
                {
                  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v41), "region");
                  *(float *)&double v43 = v43;
                  *(float *)&double v44 = v44;
                  *(v42 - 3) = *(float *)&v43;
                  *(v42 - 2) = *(float *)&v44;
                  float v46 = v45;
                  *(float *)&double v43 = v47;
                  *(v42 - 1) = v46;
                  float *v42 = *(float *)&v43;
                  ++v41;
                  v42 += 4;
                }
                while (v34 != v41);
              }
            }
            else
            {
              uint64_t v50 = self;
              v51 = (void *)unarchiveObjectOfClass(v50, v31);
              v52 = v51;
              if (v51)
              {
                v36 = (float *)[v51 bytes];
                size_t v35 = [v52 length];
              }
              else
              {
                uint64_t v55 = self;
                v56 = (void *)unarchiveObjectOfClass(v55, v31);
                if (v56)
                {
                  [v56 floatValue];
                  int v58 = v57;
                  v36 = (float *)malloc_type_malloc(4uLL, 0x20325DF8uLL);
                  *(_DWORD *)v36 = v58;
                  v77[v81++] = v36;
                  size_t v35 = 4;
                }
                else
                {
                  uint64_t v59 = self;
                  v60 = (void *)unarchiveObjectOfClass(v59, v31);
                  v61 = v60;
                  if (!v60)
                  {
                    NSLog(&cfstr_DonTKnowHowToD.isa, [v29 name]);
                    goto LABEL_62;
                  }
                  uint64_t v62 = [v60 count];
                  size_t v35 = 4 * v62;
                  v36 = (float *)malloc_type_malloc(4 * v62, 0x12F29AF0uLL);
                  v77[v81] = v36;
                  if (!v62)
                  {
                    ++v81;
                    goto LABEL_40;
                  }
                  ++v81;
                  for (uint64_t i = 0; i != v62; ++i)
                  {
                    [v61 valueAtIndex:i];
                    *(float *)&double v64 = v64;
                    v36[i] = *(float *)&v64;
                  }
                }
              }
            }
            if (v35 && v36) {
              objc_msgSend(v80, "setBytes:length:atIndex:", v36, v35, objc_msgSend(v29, "index"));
            }
          }
LABEL_40:
          ++v28;
        }
        while (v28 != v26);
        uint64_t v65 = [obj countByEnumeratingWithState:&v86 objects:v91 count:16];
        uint64_t v26 = v65;
        if (!v65) {
          goto LABEL_55;
        }
      }
    }
    unsigned int v81 = 0;
LABEL_55:
    v85[0] = (id)(v23 / (double)v6);
    v85[1] = (id)(v25 / (double)v7);
    v85[2] = (id)1;
    v84[0] = v76;
    v84[1] = (id)v75;
    v84[2] = (id)1;
    [v80 dispatchThreadgroups:v85 threadsPerThreadgroup:v84];
    [v80 endEncoding];
    BOOL v16 = 1;
LABEL_63:
    if (v77)
    {
      if (v81)
      {
        uint64_t v72 = v81;
        v73 = v77;
        do
        {
          if (*v73) {
            free(*v73);
          }
          ++v73;
          --v72;
        }
        while (v72);
      }
      free(v77);
    }
  }
  return v16;
}

id __68__CIGenericMetalProcessor_processWithInputs_arguments_output_error___block_invoke()
{
  processWithInputs_arguments_output_error__shaderDict = (uint64_t)(id)[MEMORY[0x1E4F1CA60] dictionary];
  id result = (id)[MEMORY[0x1E4F1CA60] dictionary];
  processWithInputs_arguments_output_error__reflectionDict = (uint64_t)result;
  return result;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v6 = *(void *)&a3;
  double v7 = *MEMORY[0x1E4F1DB20];
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  uint64_t v11 = [a4 objectForKeyedSubscript:@"_roiMethods"];
  uint64_t v12 = [a4 objectForKeyedSubscript:@"_insetRects"];
  uint64_t v13 = [a4 objectForKeyedSubscript:@"_scaleFactors"];
  double v14 = v10;
  double v15 = v9;
  double v16 = v8;
  double rect = v7;
  if (!v11
    || (uint64_t v17 = self,
        v18 = objc_msgSend((id)unarchiveObjectOfClassAllowCommon(v17, v11), "objectAtIndexedSubscript:", (int)v6), v14 = v10, v15 = v9, double v16 = v8, rect = v7, (objc_msgSend(v18, "isEqualToString:", @"halfInput") & 1) != 0))
  {
LABEL_8:
    if (!v13) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if ([v18 isEqualToString:@"halfOutput"])
  {
    double rect = x * 0.5;
    double v16 = y * 0.5;
    double v15 = width * 0.5;
    double v14 = height * 0.5;
    if (!v13) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if ([v18 isEqualToString:@"doubleOutput"])
  {
    double rect = x + x;
    double v16 = y + y;
    double v15 = width + width;
    double v14 = height + height;
    goto LABEL_8;
  }
  int v48 = [v18 isEqualToString:@"identity"];
  if (v48) {
    double v14 = height;
  }
  else {
    double v14 = v10;
  }
  if (v48) {
    double v15 = width;
  }
  else {
    double v15 = v9;
  }
  if (v48) {
    double v16 = y;
  }
  else {
    double v16 = v8;
  }
  double v49 = x;
  if (!v48) {
    double v49 = v7;
  }
  double rect = v49;
  if (v13)
  {
LABEL_9:
    uint64_t v19 = self;
    double v20 = objc_msgSend((id)unarchiveObjectOfClassAllowCommon(v19, v13), "objectAtIndexedSubscript:", (int)v6);
    if (v20)
    {
      double v21 = v20;
      [v20 X];
      double rect = x * v22;
      [v21 Y];
      double v16 = y * v23;
      [v21 X];
      double v15 = width * v24;
      [v21 Y];
      double v14 = height * v25;
    }
  }
LABEL_11:
  if (v12)
  {
    uint64_t v26 = self;
    uint64_t v27 = objc_msgSend((id)unarchiveObjectOfClassAllowCommon(v26, v12), "objectAtIndexedSubscript:", (int)v6);
    [v27 X];
    CGFloat v28 = v15;
    CGFloat v29 = v16;
    CGFloat v31 = v30;
    [v27 Y];
    CGFloat v33 = v32;
    v55.origin.double x = rect;
    v55.origin.double y = v29;
    v55.size.double width = v28;
    v55.size.double height = v14;
    CGRect v56 = CGRectInset(v55, v31, v33);
    double rect = v56.origin.x;
    double v16 = v56.origin.y;
    double v15 = v56.size.width;
    double v14 = v56.size.height;
  }
  uint64_t v34 = (NSString *)[a4 objectForKeyedSubscript:@"_class"];
  if (v34 && (id v35 = objc_alloc_init(NSClassFromString(v34))) != 0)
  {
    v36 = v35;
    NSSelectorFromString(&cfstr_RoiforinputArg.isa);
    objc_opt_class();
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend((id)objc_opt_class(), "roiForInput:arguments:outputRect:", v6, a4, x, y, width, height);
      double rect = v37;
      double v16 = v38;
      double v15 = v39;
      double v14 = v40;
    }
    CGFloat v41 = v15;
    CGFloat v42 = v16;
  }
  else
  {
    CGFloat v41 = v15;
    CGFloat v42 = v16;
  }
  v57.origin.double x = rect;
  v57.origin.double y = v42;
  v57.size.double width = v41;
  v57.size.double height = v14;
  v59.origin.double x = v7;
  v59.origin.double y = v8;
  v59.size.double width = v9;
  v59.size.double height = v10;
  BOOL v43 = CGRectEqualToRect(v57, v59);
  if (v43) {
    double v44 = height;
  }
  else {
    double v44 = v14;
  }
  if (v43) {
    double v45 = width;
  }
  else {
    double v45 = v41;
  }
  if (v43) {
    double v46 = y;
  }
  else {
    double v46 = v42;
  }
  double v47 = x;
  if (!v43) {
    double v47 = rect;
  }
  result.size.double height = v44;
  result.size.double width = v45;
  result.origin.double y = v46;
  result.origin.double x = v47;
  return result;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 0;
}

+ (BOOL)outputIsOpaque
{
  return 0;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (id)applyWithExtent:(CGRect)a3 inputs:(id)a4 arguments:(id)a5 error:(id *)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a5, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v14 = [a5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(a5);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v19 = [a5 objectForKey:v18];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v19 = archivedDataWithRootObject(v19);
        }
        [v13 setObject:v19 forKeyedSubscript:v18];
      }
      uint64_t v15 = [a5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }
  v22.receiver = a1;
  v22.super_class = (Class)&OBJC_METACLASS___CIGenericMetalProcessor;
  return objc_msgSendSuper2(&v22, sel_applyWithExtent_inputs_arguments_error_, a4, v13, a6, x, y, width, height);
}

@end