@interface MLCComputeEngineCommon
+ (BOOL)doesActivationRequireInput:(id)a3 forInference:(BOOL)a4;
+ (BOOL)forwardSourceTensorToChildLayersFrom:(id)a3 stopGradientTensorList:(id)a4;
+ (BOOL)isResultTensorInStopGradientTensorList:(id)a3 resultTensor:(id)a4 forInference:(BOOL)a5;
+ (void)applyPatternMatcherForGraph:(id)a3 stopGradientTensorList:(id)a4 startAtLayerIndex:(unint64_t)a5 forInference:(BOOL)a6;
+ (void)updateLayersAndTensorsForComplexActivationFunction:(id)a3 inputTensor:(id)a4;
+ (void)updateTensorsForFusedPaddingAndConvolutionLayer:(id)a3 layerNext:(id)a4;
+ (void)updateTensorsForThreeFusedLayers:(id)a3 layerNext:(id)a4 layerNext2:(id)a5;
+ (void)updateTensorsForTwoFusedLayers:(id)a3 layerNext:(id)a4;
@end

@implementation MLCComputeEngineCommon

+ (BOOL)doesActivationRequireInput:(id)a3 forInference:(BOOL)a4
{
  id v5 = a3;
  objc_opt_class();
  BOOL v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && !a4)
  {
    v7 = [v5 descriptor];
    unsigned int v8 = [v7 activationType];
    if (v8 <= 0x14)
    {
      if (((1 << v8) & 0x10FBBD) != 0)
      {
        BOOL v6 = 0;
LABEL_6:

        goto LABEL_7;
      }
      if (((1 << v8) & 0x402) != 0)
      {
        [v7 a];
        BOOL v11 = v10 < 0.0;
        goto LABEL_12;
      }
      if (v8 == 17)
      {
        [v7 a];
        float v13 = v12;
        [v7 b];
        BOOL v11 = v13 < v14;
LABEL_12:
        BOOL v6 = v11;
        goto LABEL_6;
      }
    }
    BOOL v6 = 1;
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

+ (BOOL)isResultTensorInStopGradientTensorList:(id)a3 resultTensor:(id)a4 forInference:(BOOL)a5
{
  if (!a3 || a5) {
    return 0;
  }
  else {
    return [a3 containsObject:a4];
  }
}

+ (void)updateTensorsForFusedPaddingAndConvolutionLayer:(id)a3 layerNext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 sourceTensors];
  unsigned int v8 = [v7 objectAtIndexedSubscript:0];

  v9 = [v6 sourceTensors];
  [v9 setObject:v8 atIndexedSubscript:0];

  float v10 = [v8 childLayers];
  [v10 setObject:v6 atIndexedSubscript:0];

  BOOL v11 = [v5 sourceGradientTensors];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    float v13 = [v5 sourceGradientTensors];
    float v14 = [v13 objectAtIndexedSubscript:0];
    v15 = [v5 resultGradientTensors];
    [v15 setObject:v14 atIndexedSubscript:0];
  }
  [v5 setSkipLayer:1];
  v16 = [v6 deviceOps];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    v18 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    [v6 setDeviceOps:v18];
  }
  id v20 = v5;
  [v6 setPaddingPolicy:2];
  objc_msgSend(v6, "setPaddingSizeInX:", objc_msgSend(v20, "paddingLeft"));
  uint64_t v19 = [v20 paddingTop];

  [v6 setPaddingSizeInY:v19];
}

+ (void)updateLayersAndTensorsForComplexActivationFunction:(id)a3 inputTensor:(id)a4
{
  id v33 = a3;
  id v5 = a4;
  uint64_t v6 = [v33 count];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = 0;
    float v10 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      BOOL v11 = [v33 objectAtIndexedSubscript:v9];
      if (v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        uint64_t v12 = [v11 deviceOps];
        uint64_t v13 = [v12 count];

        if (v13)
        {
          float v14 = (void *)[v10 mutableCopy];
          [v11 setDeviceOps:v14];
        }
        [v11 setSkipLayer:1];
        [v11 setIsLastFusedLayer:0];
      }
      else
      {
        id v8 = v11;
      }

      ++v9;
    }
    while (v7 != v9);
    if (v8)
    {
      v15 = [v8 sourceTensors];
      [v15 setObject:v5 atIndexedSubscript:0];

      v16 = [v33 lastObject];
      uint64_t v17 = [v16 resultTensors];
      v18 = [v17 objectAtIndexedSubscript:0];
      uint64_t v19 = [v8 resultTensors];
      [v19 setObject:v18 atIndexedSubscript:0];

      id v20 = [v33 lastObject];
      [v20 setIsLastFusedLayer:1];

      v21 = [v33 lastObject];
      v22 = [v21 resultTensors];
      v23 = [v22 objectAtIndexedSubscript:0];
      v24 = [v23 parentLayers];
      [v24 setObject:v8 atIndexedSubscript:0];

      v25 = [v33 lastObject];
      v26 = [v25 sourceGradientTensors];
      uint64_t v27 = [v26 count];

      if (v27)
      {
        v28 = [v33 lastObject];
        v29 = [v28 sourceGradientTensors];
        v30 = [v29 objectAtIndexedSubscript:0];
        v31 = [v8 sourceGradientTensors];
        [v31 setObject:v30 atIndexedSubscript:0];
      }
      v32 = [v8 fusedLayers];
      [v32 addObjectsFromArray:v33];
    }
  }
}

+ (void)updateTensorsForTwoFusedLayers:(id)a3 layerNext:(id)a4
{
  id v19 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 resultTensors];
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];

  id v8 = [v19 resultTensors];
  [v8 setObject:v7 atIndexedSubscript:0];

  uint64_t v9 = [v7 parentLayers];
  [v9 setObject:v19 atIndexedSubscript:0];

  float v10 = [v19 sourceGradientTensors];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    uint64_t v12 = [v5 sourceGradientTensors];
    uint64_t v13 = [v12 objectAtIndexedSubscript:0];
    float v14 = [v19 sourceGradientTensors];
    [v14 setObject:v13 atIndexedSubscript:0];
  }
  v15 = [v19 fusedLayers];
  [v15 addObject:v5];

  [v5 setSkipLayer:1];
  [v5 setIsLastFusedLayer:1];
  v16 = [v19 deviceOps];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    v18 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    [v19 setDeviceOps:v18];
  }
}

+ (void)updateTensorsForThreeFusedLayers:(id)a3 layerNext:(id)a4 layerNext2:(id)a5
{
  id v23 = a3;
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [v7 resultTensors];
  float v10 = [v9 objectAtIndexedSubscript:0];

  uint64_t v11 = [v23 resultTensors];
  [v11 setObject:v10 atIndexedSubscript:0];

  uint64_t v12 = [v10 parentLayers];
  [v12 setObject:v23 atIndexedSubscript:0];

  uint64_t v13 = [v23 sourceGradientTensors];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    v15 = [v7 sourceGradientTensors];
    v16 = [v15 objectAtIndexedSubscript:0];
    uint64_t v17 = [v23 sourceGradientTensors];
    [v17 setObject:v16 atIndexedSubscript:0];
  }
  v18 = [v23 fusedLayers];
  [v18 addObject:v8];

  id v19 = [v23 fusedLayers];
  [v19 addObject:v7];

  [v8 setSkipLayer:1];
  [v7 setSkipLayer:1];
  [v7 setIsLastFusedLayer:1];
  id v20 = [v23 deviceOps];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    v22 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    [v23 setDeviceOps:v22];
  }
}

+ (BOOL)forwardSourceTensorToChildLayersFrom:(id)a3 stopGradientTensorList:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 sourceTensors];
  uint64_t v9 = [v8 count];

  if (v9 == 1)
  {
    float v10 = [v6 resultTensors];
    uint64_t v11 = [v10 count];

    if (v11 == 1)
    {
      uint64_t v12 = [v6 resultTensors];
      uint64_t v13 = [v12 lastObject];

      if ([v13 computeFlags])
      {
        v15 = +[MLCLog framework];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          +[MLCComputeEngineCommon forwardSourceTensorToChildLayersFrom:stopGradientTensorList:](a2);
        }
        BOOL v14 = 0;
        goto LABEL_51;
      }
      if (v7) {
        [MEMORY[0x1E4F1CAD0] setWithArray:v7];
      }
      else {
      v15 = [MEMORY[0x1E4F1CAD0] set];
      }
      if ([v15 containsObject:v13])
      {
        v16 = +[MLCLog framework];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          +[MLCComputeEngineCommon forwardSourceTensorToChildLayersFrom:stopGradientTensorList:](a2);
        }
        BOOL v14 = 0;
        goto LABEL_50;
      }
      v57 = v15;
      uint64_t v17 = [v6 sourceTensors];
      v16 = [v17 lastObject];

      v18 = [v16 parentLayers];
      if ([v18 count])
      {
        id v19 = [v16 parentLayers];
        id v20 = [v19 lastObject];
        [v20 sourceGradientTensors];
        v22 = id v21 = v6;
        unint64_t v23 = [v22 count];

        id v6 = v21;
        if (v23 >= 2)
        {
          obuint64_t j = +[MLCLog framework];
          if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
            +[MLCComputeEngineCommon forwardSourceTensorToChildLayersFrom:stopGradientTensorList:](a2);
          }
          BOOL v14 = 0;
          v15 = v57;
          goto LABEL_49;
        }
      }
      else
      {
      }
      v24 = [v13 childLayers];
      v25 = [v16 childLayers];
      uint64_t v26 = [v25 count];

      if (v26 >= 1)
      {
        unint64_t v27 = v26 + 1;
        do
        {
          v28 = [v16 childLayers];
          uint64_t v29 = [v28 count];

          if (!v29) {
            break;
          }
          v30 = [v16 childLayers];
          id v31 = [v30 objectAtIndexedSubscript:v27 - 2];

          if (v31 == v6)
          {
            v32 = [v16 childLayers];
            [v32 removeObjectAtIndex:v27 - 2];
          }
          --v27;
        }
        while (v27 > 1);
      }
      id v55 = v7;
      v56 = v6;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      obuint64_t j = v24;
      uint64_t v33 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v60 != v35) {
              objc_enumerationMutation(obj);
            }
            v37 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            v38 = objc_msgSend(v37, "sourceTensors", v55);
            uint64_t v39 = [v38 count];

            if (v39)
            {
              for (uint64_t j = 0; j != v39; ++j)
              {
                v41 = [v37 sourceTensors];
                v42 = [v41 objectAtIndexedSubscript:j];

                if (v42 == v13)
                {
                  v43 = [v37 sourceTensors];
                  [v43 setObject:v16 atIndexedSubscript:j];

                  v44 = [v16 childLayers];
                  [v44 addObject:v37];
                }
              }
            }
          }
          uint64_t v34 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
        }
        while (v34);
      }

      v45 = [v16 parentLayers];
      if ([v45 count])
      {
        id v6 = v56;
        v46 = [v56 sourceGradientTensors];
        uint64_t v47 = [v46 count];

        v15 = v57;
        if (!v47)
        {
LABEL_48:
          BOOL v14 = 1;
          id v7 = v55;
LABEL_49:

LABEL_50:
LABEL_51:

          goto LABEL_52;
        }
        v48 = [v16 parentLayers];
        v49 = [v48 lastObject];
        v50 = [v49 sourceGradientTensors];
        [v50 removeAllObjects];

        v45 = [v16 parentLayers];
        v51 = [v45 lastObject];
        v52 = [v51 sourceGradientTensors];
        v53 = [v56 sourceGradientTensors];
        [v52 addObjectsFromArray:v53];
      }
      else
      {
        id v6 = v56;
        v15 = v57;
      }

      goto LABEL_48;
    }
    uint64_t v13 = +[MLCLog framework];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[MLCComputeEngineCommon forwardSourceTensorToChildLayersFrom:stopGradientTensorList:].cold.4(a2);
    }
  }
  else
  {
    uint64_t v13 = +[MLCLog framework];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[MLCComputeEngineCommon forwardSourceTensorToChildLayersFrom:stopGradientTensorList:].cold.5(a2);
    }
  }
  BOOL v14 = 0;
LABEL_52:

  return v14;
}

+ (void)applyPatternMatcherForGraph:(id)a3 stopGradientTensorList:(id)a4 startAtLayerIndex:(unint64_t)a5 forInference:(BOOL)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v28 = a4;
  if ([v8 count] > a5)
  {
    *(void *)&long long v9 = 138412546;
    long long v26 = v9;
    do
    {
      float v10 = objc_msgSend(v8, "objectAtIndexedSubscript:", a5, v26);
      if (([v10 skipLayer] & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          if (![v11 paddingLeft]
            && ![v11 paddingRight]
            && ![v11 paddingTop]
            && ![v11 paddingBottom]
            && +[MLCComputeEngineCommon forwardSourceTensorToChildLayersFrom:v11 stopGradientTensorList:v28])
          {
            [v11 setSkipLayer:1];
            goto LABEL_27;
          }
        }
        id v11 = [v10 resultTensors];
        if ((unint64_t)[v11 count] > 1) {
          goto LABEL_27;
        }
        uint64_t v12 = [v10 resultTensors];
        uint64_t v13 = [v12 objectAtIndexedSubscript:0];
        BOOL v14 = [v13 childLayers];
        unint64_t v15 = [v14 count];

        if (v15 <= 1)
        {
          id v11 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
          uint64_t v31 = 0;
          id v16 = v28;
          if (+[MLCPatternMatcher canTransformToReLUNFromLayer:v10 stopGradientTensorList:v28 fusedLayers:v11 alpha:(char *)&v31 + 4 beta:&v31])
          {
            if ([v11 count] == 2 || objc_msgSend(v11, "count") == 3)
            {
              [v11 insertObject:v10 atIndex:0];
              uint64_t v17 = [v10 sourceTensors];
              v18 = [v17 objectAtIndexedSubscript:0];
              +[MLCComputeEngineCommon updateLayersAndTensorsForComplexActivationFunction:v11 inputTensor:v18];

              id v19 = 0;
              goto LABEL_26;
            }
            id v20 = +[MLCLog framework];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              id v21 = NSStringFromSelector(a2);
              *(_DWORD *)buf = v26;
              uint64_t v33 = v21;
              __int16 v34 = 2112;
              id v35 = v11;
              _os_log_impl(&dword_1DD0C9000, v20, OS_LOG_TYPE_INFO, "%@: cannot fuse layers = %@ to ReLUN", buf, 0x16u);
            }
            id v16 = v28;
          }
          v22 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];

          id v30 = 0;
          BOOL v23 = +[MLCPatternMatcher canTransformToHardSwishFromLayer:v10 stopGradientTensorList:v16 fusedLayers:v22 inputTensor:&v30];
          id v19 = v30;
          if (v23)
          {
            +[MLCComputeEngineCommon updateLayersAndTensorsForComplexActivationFunction:v22 inputTensor:v19];
            id v11 = v22;
          }
          else
          {
            id v11 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];

            id v29 = v19;
            BOOL v24 = +[MLCPatternMatcher canTransformToGELUFromLayer:v10 stopGradientTensorList:v16 fusedLayers:v11 inputTensor:&v29];
            id v25 = v29;

            if (v24) {
              +[MLCComputeEngineCommon updateLayersAndTensorsForComplexActivationFunction:v11 inputTensor:v25];
            }
            id v19 = v25;
          }
LABEL_26:

LABEL_27:
        }
      }

      ++a5;
    }
    while (a5 < [v8 count]);
  }
}

+ (void)forwardSourceTensorToChildLayersFrom:(const char *)a1 stopGradientTensorList:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: cannot simplify redundant layer = %@, because its result is in stop gradient list", v4, v5, v6, v7, v8);
}

+ (void)forwardSourceTensorToChildLayersFrom:(const char *)a1 stopGradientTensorList:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: currently this function doesn't support multiple source tensors to parent layer", v4, v5, v6, v7, 2u);
}

+ (void)forwardSourceTensorToChildLayersFrom:(const char *)a1 stopGradientTensorList:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: cannot simplify redundant layer = %@, because its result is liveout", v4, v5, v6, v7, v8);
}

+ (void)forwardSourceTensorToChildLayersFrom:(const char *)a1 stopGradientTensorList:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: currently this function doesn't support multiple outputs", v4, v5, v6, v7, 2u);
}

+ (void)forwardSourceTensorToChildLayersFrom:(const char *)a1 stopGradientTensorList:.cold.5(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: cannot forward multiple input tensors", v4, v5, v6, v7, 2u);
}

@end