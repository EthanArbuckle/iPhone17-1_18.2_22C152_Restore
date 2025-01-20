@interface CICoreMLProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (id)logDescription:(id)a3;
+ (int)formatForInputAtIndex:(int)a3 arguments:(id)a4;
+ (int)outputFormatWithArguments:(id)a3;
@end

@implementation CICoreMLProcessor

+ (id)logDescription:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"logName"];
  if (v3)
  {
    v4 = (void *)v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v4 length]) {
        return (id)[NSString stringWithFormat:@"CICoreMLProcessor-%@", v4];
      }
    }
  }
  v6 = NSString;

  return (id)[v6 stringWithFormat:@"CICoreMLProcessor"];
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputWidths", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height), "objectAtIndex:", a3);
  v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputHeights"), "objectAtIndex:", a3);
  v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputChans"), "objectAtIndex:", a3);
  double v10 = (double)(int)[v7 intValue];
  int v11 = [v8 intValue];
  double v12 = (double)(int)([v9 intValue] * v11);
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = v10;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  v145 = 0;
  v139 = (void *)[a4 objectForKeyedSubscript:@"model"];
  uint64_t v121 = [a4 objectForKeyedSubscript:@"headName"];
  uint64_t v119 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v139, "modelDescription"), "outputDescriptionsByName"), "objectForKey:", v121), "type");
  int v115 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"softmax"), "BOOLValue");
  v125 = objc_alloc_init(CIMLFeatureProvider);
  v134 = (void *)[a4 objectForKeyedSubscript:@"inputWidths"];
  v132 = (void *)[a4 objectForKeyedSubscript:@"inputHeights"];
  v130 = (void *)[a4 objectForKeyedSubscript:@"inputChans"];
  v128 = (void *)[a4 objectForKeyedSubscript:@"inputFormats"];
  v7 = (void *)[a4 objectForKeyedSubscript:@"inputNames"];
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  uint64_t v137 = [v7 countByEnumeratingWithState:&v141 objects:v157 count:16];
  if (v137)
  {
    uint64_t v127 = *(void *)v142;
    do
    {
      for (uint64_t i = 0; i != v137; ++i)
      {
        if (*(void *)v142 != v127) {
          objc_enumerationMutation(v7);
        }
        uint64_t v9 = *(void *)(*((void *)&v141 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v139, "modelDescription"), "inputDescriptionsByName"), "objectForKey:", v9), "type");
        int v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v139, "modelDescription"), "inputDescriptionsByName"), "objectForKey:", v9);
        if (v11
          && (double v12 = objc_msgSend((id)objc_msgSend(v11, "multiArrayConstraint"), "shapeConstraint"),
              [v12 type] == 2))
        {
          int v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "enumeratedShapes"), "objectAtIndexedSubscript:", 0), "count");
        }
        else
        {
          int v13 = -1;
        }
        uint64_t v14 = [v7 indexOfObject:v9];
        double v15 = (void *)[a3 objectAtIndexedSubscript:v14];
        uint64_t v16 = objc_msgSend((id)objc_msgSend(v134, "objectAtIndexedSubscript:", v14), "unsignedLongValue");
        uint64_t v17 = objc_msgSend((id)objc_msgSend(v132, "objectAtIndexedSubscript:", v14), "unsignedLongValue");
        uint64_t v18 = objc_msgSend((id)objc_msgSend(v130, "objectAtIndexedSubscript:", v14), "intValue");
        OSType v19 = objc_msgSend((id)objc_msgSend(v128, "objectAtIndexedSubscript:", v14), "unsignedLongValue");
        if (v10 == 5)
        {
          CVPixelBufferRef v21 = copyProcessorInput(v15, 0x4C303068u);
          if (v13 == 3)
          {
            v156[0] = [NSNumber numberWithInt:v18];
            v156[1] = [NSNumber numberWithUnsignedLong:v17];
            v156[2] = [NSNumber numberWithUnsignedLong:v16];
            uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v156 count:3];
          }
          else
          {
            v155[0] = &unk_1EE4AA6A0;
            v155[1] = [NSNumber numberWithInt:v18];
            v155[2] = [NSNumber numberWithUnsignedLong:v17];
            v155[3] = [NSNumber numberWithUnsignedLong:v16];
            uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v155 count:4];
          }
          v23 = (void *)[objc_alloc((Class)getMLMultiArrayClass()) initWithPixelBuffer:v21 shape:v22];
          CFRelease(v21);
          [(CIMLFeatureProvider *)v125 addOject:v23 forName:v9];
        }
        else if (v10 == 4)
        {
          CVPixelBufferRef v20 = copyProcessorInput(v15, v19);
          [(CIMLFeatureProvider *)v125 addOject:v20 forName:v9];
          CFRelease(v20);
        }
      }
      uint64_t v137 = [v7 countByEnumeratingWithState:&v141 objects:v157 count:16];
    }
    while (v137);
  }
  if (v119 != 4) {
    goto LABEL_29;
  }
  shapeForLayer(v139, v121, 1);
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  [a5 region];
  v160.origin.x = 0.0;
  v160.origin.y = 0.0;
  v160.size.width = v25;
  v160.size.height = v27;
  if (!CGRectEqualToRect(v159, v160)) {
    goto LABEL_29;
  }
  v28 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v139, "modelDescription"), "outputDescriptionsByName"), "objectForKey:", v121);
  int v29 = v28 ? objc_msgSend((id)objc_msgSend(v28, "imageConstraint"), "pixelFormatType") : 0;
  v30 = (__CVBuffer *)[a5 pixelBuffer];
  v31 = v30;
  if (v30 && CVPixelBufferGetPixelFormatType(v30) == v29)
  {
    uint64_t v147 = 0;
    v148 = &v147;
    uint64_t v149 = 0x3052000000;
    v150 = __Block_byref_object_copy__2;
    v151 = __Block_byref_object_dispose__2;
    v32 = (objc_class *)getMLPredictionOptionsClass(void)::softClass;
    uint64_t v152 = getMLPredictionOptionsClass(void)::softClass;
    if (!getMLPredictionOptionsClass(void)::softClass)
    {
      v146[0] = MEMORY[0x1E4F143A8];
      v146[1] = 3221225472;
      v146[2] = ___ZL27getMLPredictionOptionsClassv_block_invoke;
      v146[3] = &unk_1E57710B8;
      v146[4] = &v147;
      ___ZL27getMLPredictionOptionsClassv_block_invoke((uint64_t)v146);
      v32 = (objc_class *)v148[5];
    }
    _Block_object_dispose(&v147, 8);
    id v33 = objc_alloc_init(v32);
    uint64_t v153 = v121;
    v154 = v31;
    objc_msgSend(v33, "setOutputBackings:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v154, &v153, 1));
  }
  else
  {
LABEL_29:
    id v33 = 0;
  }
  v34 = (void *)[v139 predictionFromFeatures:v125 options:v33 error:&v145];

  if (v145) {
    _ZF = 1;
  }
  else {
    _ZF = v34 == 0;
  }
  char v36 = !_ZF;
  BOOL v131 = v36;
  if (_ZF)
  {
    if (a6 && v145) {
      *a6 = v145;
    }
    v38 = ci_logger_api();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      +[CICoreMLProcessor processWithInputs:arguments:output:error:](v38);
    }
  }
  else
  {
    v37 = (void *)[v34 featureValueForName:v121];
    if ([v37 type] == 4)
    {
      [v37 imageBufferValue];
    }
    else if ([v37 type] == 5)
    {
      v39 = (void *)[v37 multiArrayValue];
      if ([v39 dataType] == 65600) {
        int v40 = v115;
      }
      else {
        int v40 = 0;
      }
      if (v40 == 1)
      {
        uint64_t v122 = [v39 dataPointer];
        v41 = (void *)[v39 shape];
        uint64_t v42 = [v41 count];
        int v138 = objc_msgSend((id)objc_msgSend(v41, "objectAtIndexedSubscript:", v42 - 3), "intValue");
        int v126 = objc_msgSend((id)objc_msgSend(v41, "objectAtIndexedSubscript:", v42 - 2), "intValue");
        int v43 = objc_msgSend((id)objc_msgSend(v41, "objectAtIndexedSubscript:", v42 - 1), "intValue");
        uint64_t v116 = [a5 baseAddress];
        unint64_t v44 = [a5 bytesPerRow];
        [a5 region];
        double v46 = v45;
        double v48 = v47;
        double v50 = v49;
        double v52 = v51;
        uint64_t v120 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v39, "strides"), "objectAtIndexedSubscript:", v42 - 3), "unsignedLongValue");
        uint64_t v118 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v39, "strides"), "objectAtIndexedSubscript:", v42 - 2), "unsignedLongValue");
        uint64_t v53 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v39, "strides"), "objectAtIndexedSubscript:", v42 - 1), "unsignedLongValue");
        [a5 region];
        double v55 = v54;
        uint64_t v56 = [a5 bytesPerRow];
        [a5 region];
        bzero((void *)[a5 baseAddress], v56 * ((int)v55 - 1) + 2 * (int)v57);
        v140 = (float *)malloc_type_calloc(v43 * v126, 4uLL, 0x100004052888210uLL);
        uint64_t v58 = 8 * v53;
        if (v126 >= 1)
        {
          uint64_t v114 = v53;
          unint64_t v124 = v44;
          uint64_t v135 = 0;
          uint64_t v59 = v43;
          uint64_t v133 = v122;
          int v129 = v43;
          do
          {
            if (v43 >= 1)
            {
              uint64_t v60 = 0;
              uint64_t v61 = v135 * v126;
              v62 = (long double *)v133;
              do
              {
                if (v138 >= 1)
                {
                  float v63 = v140[v60 + v61];
                  v64 = v62;
                  uint64_t v65 = v138;
                  do
                  {
                    float v66 = exp(*v64);
                    float v63 = v63 + v66;
                    v64 += v120;
                    --v65;
                  }
                  while (v65);
                  v140[v60 + v61] = v63;
                }
                ++v60;
                v62 = (long double *)((char *)v62 + v58);
              }
              while (v60 != v59);
            }
            v133 += 8 * v118;
            ++v135;
            int v43 = v129;
          }
          while (v135 != v126);
          uint64_t v67 = 0;
          v68 = v140;
          unint64_t v44 = v124;
          uint64_t v53 = v114;
          do
          {
            v69 = v68;
            uint64_t v70 = v59;
            if (v129 >= 1)
            {
              do
              {
                float *v69 = 1.0 / *v69;
                ++v69;
                --v70;
              }
              while (v70);
            }
            ++v67;
            v68 += v126;
          }
          while (v67 != v126);
        }
        if (v52 > 0.0)
        {
          int v71 = 0;
          int v72 = (int)v48;
          unint64_t v73 = v44 >> 1;
          uint64_t v74 = (int)v46;
          uint64_t v75 = 2 * v73;
          uint64_t v76 = v116;
          uint64_t v77 = v53 * v74;
          do
          {
            if (v50 > 0.0)
            {
              uint64_t v78 = 0;
              uint64_t v79 = v76;
              int v80 = (v71 + v72) % v126;
              v81 = &v140[v74 + v80 * v126];
              v82 = (long double *)(v122 + 8 * (v77 + v120 * ((v71 + v72) / v126) + v118 * v80));
              do
              {
                long double v83 = exp(*v82);
                uint64_t v76 = v79;
                _D0 = v83 * v81[v78];
                __asm { FCVT            H0, D0 }
                *(_WORD *)(v79 + 2 * v78++) = LOWORD(_D0);
                v82 = (long double *)((char *)v82 + v58);
              }
              while (v50 > (double)(int)v78);
            }
            ++v71;
            v76 += v75;
          }
          while (v52 > (double)v71);
        }
        free(v140);
      }
      else if ([v39 dataType] == 65600)
      {
        uint64_t v88 = [v39 dataPointer];
        v89 = (void *)[v39 shape];
        uint64_t v90 = [v89 count];
        int v91 = objc_msgSend((id)objc_msgSend(v89, "objectAtIndexedSubscript:", v90 - 2), "intValue");
        uint64_t v92 = [a5 baseAddress];
        unint64_t v93 = [a5 bytesPerRow];
        [a5 region];
        double v95 = v94;
        double v97 = v96;
        double v99 = v98;
        double v101 = v100;
        uint64_t v102 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v39, "strides"), "objectAtIndexedSubscript:", v90 - 3), "unsignedLongValue");
        uint64_t v103 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v39, "strides"), "objectAtIndexedSubscript:", v90 - 2), "unsignedLongValue");
        uint64_t v104 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v39, "strides"), "objectAtIndexedSubscript:", v90 - 1), "unsignedLongValue");
        [a5 region];
        double v106 = v105;
        uint64_t v107 = [a5 bytesPerRow];
        [a5 region];
        bzero((void *)[a5 baseAddress], v107 * ((int)v106 - 1) + 2 * (int)v108);
        if (v101 > 0.0)
        {
          int v109 = 0;
          do
          {
            if (v99 > 0.0)
            {
              uint64_t v110 = 0;
              v111 = (uint64_t *)(v88
                               + 8
                               * (v104 * (int)v95 + v102 * ((v109 + (int)v97) / v91) + v103 * ((v109 + (int)v97) % v91)));
              do
              {
                _D0 = *v111;
                __asm { FCVT            H0, D0 }
                *(_WORD *)(v92 + 2 * v110++) = _D0;
                v111 += v104;
              }
              while (v99 > (double)(int)v110);
            }
            ++v109;
            v92 += 2 * (v93 >> 1);
          }
          while (v101 > (double)v109);
        }
      }
      else if ([v39 dataType] == 65568)
      {
        fillMultiArrayFloatToRh<float>(a5, v39);
      }
      else if ([v39 dataType] == 65552)
      {
        _ZL23fillMultiArrayFloatToRhIDF16_EvPU33objcproto22CIImageProcessorOutput11objc_objectP12MLMultiArray(a5, v39);
      }
    }
  }
  return v131;
}

+ (int)formatForInputAtIndex:(int)a3 arguments:(id)a4
{
  v4 = (void *)[a4 objectForKeyedSubscript:@"inputCIFormat"];

  return [v4 intValue];
}

+ (int)outputFormatWithArguments:(id)a3
{
  uint64_t v3 = (void *)[a3 objectForKeyedSubscript:@"outputCIFormat"];

  return [v3 intValue];
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (void)processWithInputs:(os_log_t)log arguments:output:error:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136446210;
  v2 = "+[CICoreMLProcessor processWithInputs:arguments:output:error:]";
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "%{public}s prediction error", (uint8_t *)&v1, 0xCu);
}

@end