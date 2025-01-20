@interface MLCInferenceGraph
+ (MLCInferenceGraph)graphWithGraphObjects:(NSArray *)graphObjects;
- (BOOL)addInputs:(NSDictionary *)inputs;
- (BOOL)addInputs:(NSDictionary *)inputs lossLabels:(NSDictionary *)lossLabels lossLabelWeights:(NSDictionary *)lossLabelWeights;
- (BOOL)addInputs:(id)a3 lossLabels:(id)a4;
- (BOOL)addOutputs:(NSDictionary *)outputs;
- (BOOL)compileWithOptions:(MLCGraphCompilationOptions)options device:(MLCDevice *)device;
- (BOOL)compileWithOptions:(MLCGraphCompilationOptions)options device:(MLCDevice *)device inputTensors:(NSDictionary *)inputTensors inputTensorsData:(NSDictionary *)inputTensorsData;
- (BOOL)executeWithInputsData:(NSDictionary *)inputsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler;
- (BOOL)executeWithInputsData:(NSDictionary *)inputsData lossLabelsData:(NSDictionary *)lossLabelsData lossLabelWeightsData:(NSDictionary *)lossLabelWeightsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler;
- (BOOL)executeWithInputsData:(NSDictionary *)inputsData lossLabelsData:(NSDictionary *)lossLabelsData lossLabelWeightsData:(NSDictionary *)lossLabelWeightsData outputsData:(NSDictionary *)outputsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler;
- (BOOL)executeWithInputsData:(NSDictionary *)inputsData outputsData:(NSDictionary *)outputsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler;
- (BOOL)linkWithGraphs:(NSArray *)graphs;
- (BOOL)recompileWithOptions:(unint64_t)a3;
- (MLCInferenceGraph)initWithGraphObjects:(id)a3;
- (NSUInteger)deviceMemorySize;
- (id)concatenateWithSources:(id)a3 dimension:(unint64_t)a4;
- (id)description;
- (id)nodeWithLayer:(id)a3 source:(id)a4;
- (id)nodeWithLayer:(id)a3 sources:(id)a4;
- (id)reshapeWithShape:(id)a3 source:(id)a4;
- (id)resultTensorsForLayer:(id)a3;
- (id)sourceTensorsForLayer:(id)a3;
- (id)splitWithSource:(id)a3 splitCount:(unint64_t)a4 dimension:(unint64_t)a5;
- (id)splitWithSource:(id)a3 splitSectionLengths:(id)a4 dimension:(unint64_t)a5;
- (id)transposeWithDimensions:(id)a3 source:(id)a4;
- (unint64_t)inferenceNodeIndexInGraphLayerList;
- (unint64_t)inferenceNodeInit;
- (void)setInferenceNodeIndexInGraphLayerList:(unint64_t)a3;
- (void)setInferenceNodeInit:(unint64_t)a3;
@end

@implementation MLCInferenceGraph

+ (MLCInferenceGraph)graphWithGraphObjects:(NSArray *)graphObjects
{
  v4 = graphObjects;
  v5 = (void *)[objc_alloc((Class)a1) initWithGraphObjects:v4];

  return (MLCInferenceGraph *)v5;
}

- (MLCInferenceGraph)initWithGraphObjects:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MLCInferenceGraph;
  v3 = [(MLCGraph *)&v7 initWithGraphObjects:a3];
  v4 = v3;
  if (v3)
  {
    v3->_inferenceNodeInit = 0;
    v5 = [(MLCGraph *)v3 graphLayerList];
    v4->_inferenceNodeIndexInGraphLayerList = [v5 count];
  }
  return v4;
}

- (id)splitWithSource:(id)a3 splitCount:(unint64_t)a4 dimension:(unint64_t)a5
{
  id v8 = a3;
  v9 = +[MLCSplitLayer layerWithSplitCount:a4 dimension:a5];
  v10 = [(MLCGraph *)self nodeWithMultiOutputLayer:v9 source:v8 forTraining:0];

  return v10;
}

- (id)splitWithSource:(id)a3 splitSectionLengths:(id)a4 dimension:(unint64_t)a5
{
  id v8 = a3;
  v9 = +[MLCSplitLayer layerWithSplitSectionLengths:a4 dimension:a5];
  v10 = [(MLCGraph *)self nodeWithMultiOutputLayer:v9 source:v8 forTraining:0];

  return v10;
}

- (id)concatenateWithSources:(id)a3 dimension:(unint64_t)a4
{
  id v7 = a3;
  if ([v7 count])
  {
    if (a4 - 4 >= 0xFFFFFFFFFFFFFFFDLL)
    {
      if (![v7 count])
      {
LABEL_11:
        v11 = +[MLCConcatenationLayer layerWithDimension:a4];
        v12 = [(MLCInferenceGraph *)self nodeWithLayer:v11 sources:v7];

        goto LABEL_15;
      }
      uint64_t v9 = 0;
      while (1)
      {
        v10 = [v7 objectAtIndexedSubscript:v9];

        if (!v10) {
          break;
        }
        if (++v9 >= (unint64_t)[v7 count]) {
          goto LABEL_11;
        }
      }
      id v8 = +[MLCLog framework];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MLCInferenceGraph concatenateWithSources:dimension:](a2);
      }
    }
    else
    {
      id v8 = +[MLCLog framework];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MLCInferenceGraph concatenateWithSources:dimension:](a2);
      }
    }
  }
  else
  {
    id v8 = +[MLCLog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MLCInferenceGraph concatenateWithSources:dimension:](a2);
    }
  }

  v12 = 0;
LABEL_15:

  return v12;
}

- (id)reshapeWithShape:(id)a3 source:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = +[MLCReshapeLayer layerWithShape:a3];
  v11[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  uint64_t v9 = [(MLCInferenceGraph *)self nodeWithLayer:v7 sources:v8];

  return v9;
}

- (id)transposeWithDimensions:(id)a3 source:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = +[MLCTransposeLayer layerWithDimensions:a3];
  v11[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  uint64_t v9 = [(MLCInferenceGraph *)self nodeWithLayer:v7 sources:v8];

  return v9;
}

- (id)nodeWithLayer:(id)a3 source:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 arrayWithObjects:&v12 count:1];

  v10 = -[MLCInferenceGraph nodeWithLayer:sources:](self, "nodeWithLayer:sources:", v8, v9, v12, v13);

  return v10;
}

- (id)nodeWithLayer:(id)a3 sources:(id)a4
{
  id v6 = a3;
  id v7 = [(MLCGraph *)self nodeWithLayer:v6 sources:a4 forTraining:0];
  if (v7)
  {
    [v6 setCompileForInferenceOnly:1];
    if (![(MLCInferenceGraph *)self inferenceNodeInit])
    {
      [(MLCInferenceGraph *)self setInferenceNodeInit:1];
      id v8 = [(MLCGraph *)self graphLayerList];
      -[MLCInferenceGraph setInferenceNodeIndexInGraphLayerList:](self, "setInferenceNodeIndexInGraphLayerList:", [v8 count] - 1);
    }
  }

  return v7;
}

- (BOOL)recompileWithOptions:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (([(MLCGraph *)self compilerOptions] & 1) != 0
    || ([(MLCGraph *)self compilerOptions] & 2) != 0)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    unint64_t v6 = [(MLCGraph *)self compilerOptions];
    BOOL v7 = (v6 >> 2) & 1;
    if ((v6 & 4) != 0)
    {
      if ((v3 & 4) != 0)
      {
        v10 = +[MLCLog execution];
        os_signpost_id_t v8 = os_signpost_id_generate(v10);
      }
      else
      {
        os_signpost_id_t v8 = 0;
      }
      v11 = +[MLCLog execution];
      id v12 = v11;
      unint64_t v13 = v8 - 1;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RecompileInferenceGraph", "", buf, 2u);
      }
      os_signpost_id_t spid = v8;

      v14 = [(MLCGraph *)self device];
      v15 = [v14 computeEngine];
      v16 = [(MLCGraph *)self graphLayerList];
      objc_msgSend(v15, "fuseLayersForInferenceGraph:startAtLayerIndex:", v16, -[MLCInferenceGraph inferenceNodeIndexInGraphLayerList](self, "inferenceNodeIndexInGraphLayerList"));

      v17 = [(MLCGraph *)self graphLayerList];
      uint64_t v18 = [v17 count];

      if (v18)
      {
        unint64_t v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          v21 = [(MLCGraph *)self graphLayerList];
          v22 = [v21 objectAtIndexedSubscript:v19];

          if (([v22 skipLayer] & 1) == 0)
          {
            v23 = [v22 fusedLayers];
            if (![v23 count]) {
              goto LABEL_19;
            }
            int v24 = [v22 compileForInferenceOnly];

            if (v24) {
              break;
            }
          }
LABEL_20:

          ++v19;
          v28 = [(MLCGraph *)self graphLayerList];
          unint64_t v29 = [v28 count];

          if (v19 >= v29) {
            goto LABEL_23;
          }
        }
        ++v20;
        v23 = [v22 device];
        v25 = [v22 sourceTensors];
        v26 = [v22 resultTensors];
        v27 = [v26 objectAtIndexedSubscript:0];
        [v22 compileForDevice:v23 sourceTensors:v25 resultTensor:v27];

LABEL_19:
        goto LABEL_20;
      }
      uint64_t v20 = 0;
LABEL_23:
      v30 = +[MLCLog execution];
      uint64_t v9 = v30;
      if (v13 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v30))
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v34 = v20;
        _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v9, OS_SIGNPOST_INTERVAL_END, spid, "RecompileInferenceGraph", "%{public,name=LayersRecompiled}lu", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v9 = +[MLCLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[MLCTrainingGraph recompileWithOptions:](a2);
      }
    }
  }
  return v7;
}

- (BOOL)compileWithOptions:(MLCGraphCompilationOptions)options device:(MLCDevice *)device
{
  return [(MLCInferenceGraph *)self compileWithOptions:options device:device inputTensors:0 inputTensorsData:0];
}

- (BOOL)compileWithOptions:(MLCGraphCompilationOptions)options device:(MLCDevice *)device inputTensors:(NSDictionary *)inputTensors inputTensorsData:(NSDictionary *)inputTensorsData
{
  uint64_t v188 = *MEMORY[0x1E4F143B8];
  v10 = device;
  v11 = inputTensors;
  id v12 = inputTensorsData;
  v157 = self;
  if ([(MLCGraph *)self readyForExecution])
  {
    unint64_t v13 = +[MLCLog framework];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:](a2);
    }
    BOOL v14 = 1;
    goto LABEL_140;
  }
  if (!v11 || v12)
  {
    v15 = v10;
    uint64_t v16 = (uint64_t)v15;
    if ([(MLCDevice *)v15 type] == MLCDeviceTypeANE)
    {
      uint64_t v16 = +[MLCDevice cpuDevice];
    }
    v153 = v16;
    [(MLCGraph *)self setCompilerOptions:options];
    v17 = +[MLCLog execution];
    os_signpost_id_t v18 = os_signpost_id_generate(v17);

    unint64_t v19 = +[MLCLog execution];
    uint64_t v20 = v19;
    os_signpost_id_t spid = v18;
    unint64_t v149 = v18 - 1;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138543618;
      v183 = v22;
      __int16 v184 = 2050;
      MLCGraphCompilationOptions v185 = options;
      _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v20, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CompileWithOptions", "%{public,name=Device}@ %{public,name=Options}llu", buf, 0x16u);
    }
    SEL aSelector = a2;

    v23 = [(MLCGraph *)self graphLayerList];
    int v24 = [v23 objectAtIndexedSubscript:0];
    v25 = [v24 device];

    if (!v25) {
      [(MLCInferenceGraph *)v157 setInferenceNodeIndexInGraphLayerList:0];
    }
    if (v11 && v12)
    {
      long long v164 = 0u;
      long long v165 = 0u;
      long long v162 = 0u;
      long long v163 = 0u;
      v26 = v12;
      uint64_t v27 = [(NSDictionary *)v26 countByEnumeratingWithState:&v162 objects:v179 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v163;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v163 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = -[NSDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", *(void *)(*((void *)&v162 + 1) + 8 * i), aSelector);
            objc_msgSend(v31, "setComputeFlags:", objc_msgSend(v31, "computeFlags") | 2);
          }
          uint64_t v28 = [(NSDictionary *)v26 countByEnumeratingWithState:&v162 objects:v179 count:16];
        }
        while (v28);
      }

      [(MLCGraph *)v157 bindAndWriteData:v26 forInputs:v11 toDevice:v15 synchronous:1];
    }
    uint64_t v32 = [(MLCGraph *)v157 graphLayerList];
    v33 = +[MLCDeviceGraph deviceGraphWithLayers:v32 device:v15];
    v178 = v33;
    uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v178 count:1];

    uint64_t v35 = [(MLCDevice *)v15 computeEngine];
    LOBYTE(v32) = objc_opt_respondsToSelector();

    if (v32)
    {
      v36 = [(MLCDevice *)v15 computeEngine];
      uint64_t v37 = objc_msgSend(v36, "partitionInferenceGraph:startAtLayerIndex:aneDevice:secondaryDevice:", v157, -[MLCInferenceGraph inferenceNodeIndexInGraphLayerList](v157, "inferenceNodeIndexInGraphLayerList"), v15, v153);

      v155 = (void *)v37;
    }
    else
    {
      v155 = v34;
    }
    unint64_t v38 = [(MLCInferenceGraph *)v157 inferenceNodeIndexInGraphLayerList];
    v39 = [(MLCGraph *)v157 graphLayerList];
    unint64_t v40 = [v39 count];

    if (v38 < v40)
    {
      do
      {
        v41 = [(MLCGraph *)v157 graphLayerList];
        v42 = [v41 objectAtIndexedSubscript:v38];

        if (([v42 skipLayer] & 1) == 0)
        {
          [v42 setCompileForInferenceOnly:1];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(MLCGraph *)v157 linkRelatedTensorsForConcatLayer:v42 device:v15];
          }
        }

        ++v38;
        v43 = [(MLCGraph *)v157 graphLayerList];
        unint64_t v44 = [v43 count];
      }
      while (v38 < v44);
    }
    v154 = v15;
    v151 = v10;
    v152 = v12;
    v150 = v11;
    MLCGraphCompilationOptions v147 = (2 * (options & 1)) | options;
    if ((v147 & 6) == 0)
    {
      uint64_t v45 = [(MLCInferenceGraph *)v157 inferenceNodeIndexInGraphLayerList];
      v160 = v157;
      id v46 = v155;
      if ([v46 count] == 1) {
        uint64_t v47 = v45;
      }
      else {
        uint64_t v47 = 0;
      }
      v48 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      long long v174 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      long long v177 = 0u;
      id v49 = v46;
      uint64_t v50 = [v49 countByEnumeratingWithState:&v174 objects:buf count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v175;
        uint64_t v158 = *(void *)v175;
        uint64_t v159 = v47;
        do
        {
          uint64_t v53 = 0;
          uint64_t v161 = v51;
          do
          {
            if (*(void *)v175 != v52) {
              objc_enumerationMutation(v49);
            }
            v54 = *(void **)(*((void *)&v174 + 1) + 8 * v53);
            if ((unint64_t)[v49 count] >= 2)
            {
              v55 = (void *)MEMORY[0x1E4F1CAD0];
              v56 = [v54 graphLayerList];
              v57 = [v55 setWithArray:v56];

              long long v172 = 0u;
              long long v173 = 0u;
              long long v170 = 0u;
              long long v171 = 0u;
              v58 = [(MLCGraph *)v160 graphLayerList];
              uint64_t v59 = [v58 countByEnumeratingWithState:&v170 objects:v181 count:16];
              if (v59)
              {
                uint64_t v60 = v59;
                uint64_t v61 = *(void *)v171;
                do
                {
                  for (uint64_t j = 0; j != v60; ++j)
                  {
                    if (*(void *)v171 != v61) {
                      objc_enumerationMutation(v58);
                    }
                    v63 = *(void **)(*((void *)&v170 + 1) + 8 * j);
                    if (([v63 skipLayer] & 1) == 0
                      && ([v57 containsObject:v63] & 1) == 0)
                    {
                      [v48 addObject:v63];
                      [v63 setSkipLayer:1];
                    }
                  }
                  uint64_t v60 = [v58 countByEnumeratingWithState:&v170 objects:v181 count:16];
                }
                while (v60);
              }

              uint64_t v52 = v158;
              uint64_t v47 = v159;
              uint64_t v51 = v161;
            }
            v64 = [v54 device];
            v65 = [v64 computeEngine];
            v66 = [v54 graphLayerList];
            [v65 fuseLayersForInferenceGraph:v66 startAtLayerIndex:v47];

            if ((unint64_t)[v49 count] >= 2)
            {
              long long v168 = 0u;
              long long v169 = 0u;
              long long v166 = 0u;
              long long v167 = 0u;
              id v67 = v48;
              uint64_t v68 = [v67 countByEnumeratingWithState:&v166 objects:v180 count:16];
              if (v68)
              {
                uint64_t v69 = v68;
                uint64_t v70 = *(void *)v167;
                do
                {
                  for (uint64_t k = 0; k != v69; ++k)
                  {
                    if (*(void *)v167 != v70) {
                      objc_enumerationMutation(v67);
                    }
                    [*(id *)(*((void *)&v166 + 1) + 8 * k) setSkipLayer:0];
                  }
                  uint64_t v69 = [v67 countByEnumeratingWithState:&v166 objects:v180 count:16];
                }
                while (v69);
              }

              [v67 removeAllObjects];
            }
            ++v53;
          }
          while (v53 != v51);
          uint64_t v51 = [v49 countByEnumeratingWithState:&v174 objects:buf count:16];
        }
        while (v51);
      }
    }
    v72 = v157;
    unint64_t v73 = [(MLCInferenceGraph *)v157 inferenceNodeIndexInGraphLayerList];
    v74 = [(MLCGraph *)v157 graphLayerList];
    unint64_t v75 = [v74 count];

    v76 = v155;
    if (v73 < v75)
    {
      do
      {
        v77 = [(MLCGraph *)v72 graphLayerList];
        v78 = [v77 objectAtIndexedSubscript:v73];

        if (options) {
          [v78 setIsDebuggingEnabled:1];
        }
        if ([v78 skipLayer]) {
          goto LABEL_99;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v79 = [NSNumber numberWithUnsignedInteger:v73];
          v80 = [(MLCGraph *)v157 lstmLayerIndexList];
          v81 = [(MLCGraph *)v157 lstmLayerIndexList];
          objc_msgSend(v80, "setObject:atIndexedSubscript:", v79, objc_msgSend(v81, "count"));
        }
        if ([(MLCDevice *)v154 type])
        {
          v82 = [v78 deviceOps];
          uint64_t v83 = [v82 count];

          if (!v83)
          {
            v84 = [v78 resultTensors];
            uint64_t v85 = [v84 count];

            if (v85)
            {
              unint64_t v86 = 0;
              do
              {
                v87 = [v78 resultTensors];
                v88 = [v87 objectAtIndexedSubscript:v86];
                v89 = [v88 deviceMemory];
                uint64_t v90 = [v89 count];

                if (v90)
                {
                  v91 = [v78 resultTensors];
                  v92 = [v91 objectAtIndexedSubscript:v86];
                  v93 = [v92 deviceMemory];
                  [v93 removeAllObjects];
                }
                ++v86;
                v94 = [v78 resultTensors];
                unint64_t v95 = [v94 count];
              }
              while (v86 < v95);
            }
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v133 = +[MLCLog framework];
          unint64_t v13 = v153;
          v76 = v155;
          if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR)) {
            -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.5(aSelectora);
          }

          v134 = +[MLCLog execution];
          v135 = v134;
          v11 = v150;
          v10 = v151;
          if (v149 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v134))
          {
            *(_WORD *)buf = 0;
            goto LABEL_128;
          }
LABEL_129:

          goto LABEL_130;
        }
        v96 = [v78 deviceOps];
        uint64_t v97 = [v96 count];

        v76 = v155;
        if (v97)
        {
          v98 = [v78 device];
          char v99 = [v98 isEqual:v154];

          if ((v99 & 1) == 0)
          {
            v136 = +[MLCLog framework];
            if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR)) {
              -[MLCInferenceGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.5();
            }

            v137 = +[MLCLog execution];
            v135 = v137;
            v11 = v150;
            v10 = v151;
            unint64_t v13 = v153;
            if (v149 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v137))
            {
              *(_WORD *)buf = 0;
LABEL_128:
              _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v135, OS_SIGNPOST_INTERVAL_END, spid, "CompileWithOptions", "", buf, 2u);
            }
            goto LABEL_129;
          }
          [v78 setDevice:v154];
        }
        v100 = v154;
        if (v154)
        {
          p_super = &v100->super;
          if ([(MLCDevice *)v100 type] == MLCDeviceTypeANE)
          {
            v102 = v153;

            p_super = v102;
          }
          if (!v97)
          {
LABEL_91:
            [v78 setCompileForInferenceOnly:1];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            v104 = [v78 sourceTensors];
            v105 = [v78 resultTensors];
            v106 = v105;
            if (isKindOfClass)
            {
              int v107 = [v78 compileForDevice:p_super sourceTensors:v104 resultTensors:v105];

              if (!v107) {
                goto LABEL_131;
              }
            }
            else
            {
              v108 = [v105 objectAtIndexedSubscript:0];
              char v109 = [v78 compileForDevice:p_super sourceTensors:v104 resultTensor:v108];

              if ((v109 & 1) == 0)
              {
LABEL_131:
                v138 = +[MLCLog framework];
                if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR)) {
                  -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.6();
                }

                v139 = +[MLCLog execution];
                v140 = v139;
                v11 = v150;
                v10 = v151;
                v76 = v155;
                if (v149 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v139))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v140, OS_SIGNPOST_INTERVAL_END, spid, "CompileWithOptions", "", buf, 2u);
                }

                goto LABEL_137;
              }
            }
            v110 = [v78 resultTensors];
            uint64_t v111 = [v110 count];

            if (v111)
            {
              unint64_t v112 = 0;
              do
              {
                v113 = [v78 resultTensors];
                v114 = [v113 objectAtIndexedSubscript:v112];
                [v114 setDevice:p_super];

                ++v112;
                v115 = [v78 resultTensors];
                unint64_t v116 = [v115 count];
              }
              while (v112 < v116);
            }
          }
        }
        else
        {
          p_super = 0;
          if (!v97) {
            goto LABEL_91;
          }
        }

        v76 = v155;
LABEL_99:

        ++v73;
        v72 = v157;
        v117 = [(MLCGraph *)v157 graphLayerList];
        unint64_t v118 = [v117 count];
      }
      while (v73 < v118);
    }
    v119 = [(MLCDevice *)v154 computeEngine];
    char v120 = objc_opt_respondsToSelector();

    if ((v120 & 1) != 0
      && ([(MLCDevice *)v154 computeEngine],
          v121 = objc_claimAutoreleasedReturnValue(),
          char v122 = [v121 postProcessCompiledGraph:v72 compilerOptions:v147],
          v121,
          (v122 & 1) == 0))
    {
      v131 = +[MLCLog framework];
      v11 = v150;
      v10 = v151;
      if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
      {
        v142 = NSStringFromSelector(aSelectora);
        v143 = [(MLCDevice *)v154 computeEngine];
        v144 = [v143 description];
        *(_DWORD *)buf = 138412802;
        v183 = v142;
        __int16 v184 = 2112;
        MLCGraphCompilationOptions v185 = (MLCGraphCompilationOptions)v72;
        __int16 v186 = 2112;
        v187 = v144;
        _os_log_error_impl(&dword_1DD0C9000, v131, OS_LOG_TYPE_ERROR, "%@: failed to post process the compiled graph=%@ on device=%@", buf, 0x20u);

        v76 = v155;
      }

      v132 = +[MLCLog execution];
      v78 = v132;
      if (v149 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        unint64_t v13 = v153;
        if (os_signpost_enabled(v132))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v78, OS_SIGNPOST_INTERVAL_END, spid, "CompileWithOptions", "", buf, 2u);
        }
LABEL_130:
        BOOL v14 = 0;
        goto LABEL_139;
      }
LABEL_137:
      BOOL v14 = 0;
    }
    else
    {
      [(MLCGraph *)v72 setReadyForExecution:1];
      [(MLCGraph *)v72 setDevice:v154];
      [(MLCGraph *)v72 setAllocateDeviceMemoryForTensorsInGraph:[(MLCDevice *)v154 type] != MLCDeviceTypeANE];
      v123 = [(MLCDevice *)v154 computeEngine];
      char v124 = objc_opt_respondsToSelector();

      v11 = v150;
      v10 = v151;
      if (v124)
      {
        v125 = [(MLCDevice *)v154 computeEngine];
        v126 = [(MLCGraph *)v72 graphLayerList];
        [v125 allocateDeviceHeapForGraph:v126 forInference:1];
      }
      if (([(MLCGraph *)v72 compilerOptions] & 4) != 0
        || ![(MLCGraph *)v72 staticBatchSizeInGraph])
      {
        v127 = [(MLCDevice *)v154 computeEngine];
        char v128 = objc_opt_respondsToSelector();

        if (v128)
        {
          v129 = [(MLCDevice *)v154 computeEngine];
          [v129 selectDevicesWithBatchSize:1];
        }
      }
      v130 = +[MLCLog execution];
      v78 = v130;
      if (v149 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        unint64_t v13 = v153;
        if (os_signpost_enabled(v130))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v78, OS_SIGNPOST_INTERVAL_END, spid, "CompileWithOptions", "", buf, 2u);
        }
        BOOL v14 = 1;
        goto LABEL_139;
      }
      BOOL v14 = 1;
    }
    unint64_t v13 = v153;
LABEL_139:

    id v12 = v152;
    goto LABEL_140;
  }
  unint64_t v13 = +[MLCLog framework];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:](a2);
  }
  BOOL v14 = 0;
LABEL_140:

  return v14;
}

- (NSUInteger)deviceMemorySize
{
  char v3 = [(MLCGraph *)self graphLayerList];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  unint64_t v5 = 0;
  NSUInteger v6 = 0;
  do
  {
    BOOL v7 = [(MLCGraph *)self graphLayerList];
    os_signpost_id_t v8 = [v7 objectAtIndexedSubscript:v5];
    v6 += [v8 deviceMemorySizeForForward];

    ++v5;
    uint64_t v9 = [(MLCGraph *)self graphLayerList];
    unint64_t v10 = [v9 count];
  }
  while (v5 < v10);
  return v6;
}

- (id)description
{
  char v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCGraph *)self graphLayerList];
  BOOL v7 = [v6 objectAtIndexedSubscript:0];
  v11.receiver = self;
  v11.super_class = (Class)MLCInferenceGraph;
  os_signpost_id_t v8 = [(MLCGraph *)&v11 description];
  uint64_t v9 = [v3 stringWithFormat:@"%@: { rootLayer=%@ : %@}", v5, v7, v8];

  return v9;
}

- (BOOL)addInputs:(NSDictionary *)inputs
{
  v4.receiver = self;
  v4.super_class = (Class)MLCInferenceGraph;
  return [(MLCGraph *)&v4 addInputs:inputs lossLabels:0 lossLabelWeights:0];
}

- (BOOL)addInputs:(id)a3 lossLabels:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MLCInferenceGraph;
  return [(MLCGraph *)&v5 addInputs:a3 lossLabels:a4 lossLabelWeights:0];
}

- (BOOL)addInputs:(NSDictionary *)inputs lossLabels:(NSDictionary *)lossLabels lossLabelWeights:(NSDictionary *)lossLabelWeights
{
  v6.receiver = self;
  v6.super_class = (Class)MLCInferenceGraph;
  return [(MLCGraph *)&v6 addInputs:inputs lossLabels:lossLabels lossLabelWeights:lossLabelWeights];
}

- (BOOL)addOutputs:(NSDictionary *)outputs
{
  v4.receiver = self;
  v4.super_class = (Class)MLCInferenceGraph;
  return [(MLCGraph *)&v4 addOutputs:outputs];
}

- (BOOL)executeWithInputsData:(NSDictionary *)inputsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  return [(MLCInferenceGraph *)self executeWithInputsData:inputsData lossLabelsData:0 lossLabelWeightsData:0 outputsData:0 batchSize:batchSize options:options completionHandler:completionHandler];
}

- (BOOL)executeWithInputsData:(NSDictionary *)inputsData outputsData:(NSDictionary *)outputsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  return [(MLCInferenceGraph *)self executeWithInputsData:inputsData lossLabelsData:0 lossLabelWeightsData:0 outputsData:outputsData batchSize:batchSize options:options completionHandler:completionHandler];
}

- (BOOL)executeWithInputsData:(NSDictionary *)inputsData lossLabelsData:(NSDictionary *)lossLabelsData lossLabelWeightsData:(NSDictionary *)lossLabelWeightsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  return [(MLCInferenceGraph *)self executeWithInputsData:inputsData lossLabelsData:lossLabelsData lossLabelWeightsData:lossLabelWeightsData outputsData:0 batchSize:batchSize options:options completionHandler:completionHandler];
}

- (BOOL)executeWithInputsData:(NSDictionary *)inputsData lossLabelsData:(NSDictionary *)lossLabelsData lossLabelWeightsData:(NSDictionary *)lossLabelWeightsData outputsData:(NSDictionary *)outputsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  uint64_t v355 = *MEMORY[0x1E4F143B8];
  v15 = inputsData;
  uint64_t v16 = lossLabelsData;
  MLCExecutionOptions v17 = options;
  os_signpost_id_t v18 = v16;
  unint64_t v19 = lossLabelWeightsData;
  uint64_t v20 = outputsData;
  v21 = completionHandler;
  CFAbsoluteTime Current = 0.0;
  if ((v17 & 4) != 0) {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  if (!v21 && (v17 & 2) == 0)
  {
    v23 = +[MLCLog framework];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[MLCInferenceGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:]0(a2);
    }
  }
  int v24 = [(MLCGraph *)self graphLayerList];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    v26 = [(MLCGraph *)self allInputs];

    if (!v26)
    {
      v33 = +[MLCLog framework];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:](a2);
      }

      v31 = NSStringFromSelector(a2);
      uint64_t v32 = @"No inputs compiled in graph";
      goto LABEL_35;
    }
    uint64_t v27 = [(MLCGraph *)self allLossLabels];

    if (!v27 && v18 && ![(NSDictionary *)v18 isEqualToDictionary:MEMORY[0x1E4F1CC08]])
    {
      uint64_t v35 = +[MLCLog framework];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:]0(a2);
      }

      v31 = NSStringFromSelector(a2);
      uint64_t v32 = @"No loss labels compiled in graph";
      goto LABEL_35;
    }
    uint64_t v28 = [(MLCGraph *)self allLossLabelWeights];

    if (!v28 && v19 && ![(NSDictionary *)v19 isEqualToDictionary:MEMORY[0x1E4F1CC08]])
    {
      v36 = +[MLCLog framework];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.9(a2);
      }

      v31 = NSStringFromSelector(a2);
      uint64_t v32 = @"No loss label weights compiled in graph";
      goto LABEL_35;
    }
    if (![(MLCGraph *)self readyForExecution])
    {
      uint64_t v34 = +[MLCLog framework];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.4(a2);
      }

      v31 = NSStringFromSelector(a2);
      uint64_t v32 = @"graph not ready for execution";
      goto LABEL_35;
    }
    BOOL v29 = [(MLCGraph *)self staticBatchSizeInGraph];
    if (batchSize && !v29)
    {
      v30 = +[MLCLog framework];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:](a2);
      }

      v31 = NSStringFromSelector(a2);
      uint64_t v32 = @"batchSize provided must be 0 since batch size changes in graph. we will use batch size specified with tensors for layers in graph";
      goto LABEL_35;
    }
    if (v20 && ![(MLCGraph *)self checkPageAlignmentAndSizeForOutputs:v20])
    {
      unint64_t v73 = +[MLCLog framework];
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
        -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:](a2);
      }

      v31 = NSStringFromSelector(a2);
      uint64_t v32 = @"Outputs buffers must be page aligned and a multiple of page size";
      goto LABEL_35;
    }
    MLCExecutionOptions v323 = v17;
    SEL aSelector = a2;
    v314 = v21;
    v327 = v20;
    v316 = v19;
    [(MLCGraph *)self updateLSTMLayersForVariableSequenceLengthInGraph:self withInputData:v15];
    unint64_t v40 = [(MLCGraph *)self graphLayerList];
    unint64_t v41 = [v40 count];

    v42 = [(MLCGraph *)self graphLayerList];
    uint64_t v43 = [v42 count];

    unint64_t v44 = 0;
    if (v43)
    {
      for (unint64_t i = 0; i != v43; ++i)
      {
        id v46 = [(MLCGraph *)self graphLayerList];
        uint64_t v47 = [v46 objectAtIndexedSubscript:i];
        int v48 = [v47 skipLayer];

        if (v44 <= i) {
          unint64_t v49 = i;
        }
        else {
          unint64_t v49 = v44;
        }
        if (v41 >= i) {
          unint64_t v50 = i;
        }
        else {
          unint64_t v50 = v41;
        }
        if (!v48)
        {
          unint64_t v41 = v50;
          unint64_t v44 = v49;
        }
      }
    }
    uint64_t v51 = [(MLCGraph *)self graphLayerList];
    uint64_t v52 = [v51 objectAtIndexedSubscript:v44];

    uint64_t v53 = [v52 resultTensors];
    v332 = [v53 objectAtIndexedSubscript:0];

    v324 = v52;
    v331 = self;
    v313 = v18;
    if (v327)
    {
      long long v345 = 0u;
      long long v346 = 0u;
      long long v343 = 0u;
      long long v344 = 0u;
      v54 = v327;
      uint64_t v55 = [(NSDictionary *)v54 countByEnumeratingWithState:&v343 objects:v354 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v344;
        while (2)
        {
          for (uint64_t j = 0; j != v56; ++j)
          {
            if (*(void *)v344 != v57) {
              objc_enumerationMutation(v54);
            }
            uint64_t v59 = *(void *)(*((void *)&v343 + 1) + 8 * j);
            uint64_t v60 = [(MLCGraph *)v331 allOutputs];
            uint64_t v61 = [v60 objectForKeyedSubscript:v59];

            if (v61 == v332)
            {
              v315 = [(NSDictionary *)v54 objectForKeyedSubscript:v59];

              v65 = [v324 resultTensors];
              v325 = [v65 objectAtIndexedSubscript:0];
              int v310 = 1;
              os_signpost_id_t v18 = v313;
              self = v331;
              goto LABEL_69;
            }
          }
          uint64_t v56 = [(NSDictionary *)v54 countByEnumeratingWithState:&v343 objects:v354 count:16];
          self = v331;
          if (v56) {
            continue;
          }
          break;
        }
      }

      os_signpost_id_t v18 = v313;
      uint64_t v52 = v324;
    }
    v62 = [v332 descriptor];
    v63 = malloc_type_malloc([v62 tensorAllocationSizeInBytes], 0x7B9C2814uLL);

    v64 = [v332 descriptor];
    v65 = +[MLCTensorData dataWithBytesNoCopy:length:freeWhenDone:](MLCTensorData, "dataWithBytesNoCopy:length:freeWhenDone:", v63, [v64 tensorAllocationSizeInBytes], 1);

    v66 = [v332 descriptor];
    id v67 = +[MLCTensor tensorWithDescriptor:v66 data:v65];
    [v67 setComputeFlags:1];
    uint64_t v68 = [v52 device];
    v325 = v67;
    [v67 setDevice:v68];

    uint64_t v69 = [v52 device];
    LODWORD(v67) = [v69 type];

    if (v67 == 3)
    {
      v329 = [v52 device];
      uint64_t v70 = [v329 computeEngine];
      v71 = [v52 resultTensors];
      v72 = [v71 objectAtIndexedSubscript:0];
      [v70 shareDeviceMemoryWithResultTensor:v325 sourceTensor:v72];
    }
    v315 = 0;
    int v310 = 0;
LABEL_69:

    unsigned int v74 = v323;
    if ((v323 & 4) != 0)
    {
      *(CFAbsoluteTime *)buf = Current;
      *(void *)&buf[16] = 0;
      *(void *)&buf[8] = 0;
      v318 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:24];
      unint64_t v75 = +[MLCLog execution];
      os_signpost_id_t spid = os_signpost_id_generate(v75);
    }
    else
    {
      v318 = 0;
      os_signpost_id_t spid = 0;
    }
    if (v323)
    {
      unint64_t v91 = spid - 1;
LABEL_86:
      v92 = +[MLCLog execution];
      v93 = v92;
      unint64_t v308 = v91;
      if (v91 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v92))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v93, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ExecuteForward", "", buf, 2u);
      }

      v94 = [(MLCGraph *)self device];
      BOOL v95 = [v94 type] == 0;

      v96 = 0;
      os_signpost_id_t v97 = spid;
      if ((v95 & (v74 >> 4)) == 0) {
        os_signpost_id_t v97 = 0;
      }
      os_signpost_id_t v309 = v97;
      unint64_t v98 = 0x1E6CB4000uLL;
      if (v41 < v44 + 1)
      {
        char v99 = 0;
        unint64_t v100 = v97 - 1;
        unint64_t v330 = v44;
        v306 = v15;
        unint64_t v311 = v97 - 1;
        while (1)
        {
          v101 = [(MLCGraph *)self graphLayerList];
          v102 = [v101 objectAtIndexedSubscript:v41];

          v103 = [*(id *)(v98 + 1176) execution];
          v104 = v103;
          if (v100 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v103))
          {
            v105 = (objc_class *)objc_opt_class();
            NSStringFromClass(v105);
            id v106 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v107 = [v102 layerID];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v106;
            *(_WORD *)&buf[12] = 2050;
            *(void *)&buf[14] = v107;
            _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v104, OS_SIGNPOST_INTERVAL_BEGIN, v309, "ExecuteForward -- PerLayer", "%{public,name=MLCLayerType}@ %{public,name=LayerID}lu", buf, 0x16u);
          }
          if ([v102 skipLayer])
          {
            unint64_t v98 = 0x1E6CB4000uLL;
            v108 = +[MLCLog execution];
            char v109 = v108;
            if (v311 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v108))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v109, OS_SIGNPOST_INTERVAL_END, v309, "ExecuteForward -- PerLayer", "", buf, 2u);
            }
            goto LABEL_193;
          }
          if (v41 == v44)
          {
            v307 = v325;
          }
          else
          {
            v110 = [v102 resultTensors];
            v307 = [v110 objectAtIndexedSubscript:0];
          }
          v317 = [v102 device];

          uint64_t v111 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          unint64_t v112 = [v102 sourceTensors];
          uint64_t v113 = [v112 count];

          if (v113)
          {
            unint64_t v114 = 0;
            do
            {
              v115 = [v102 sourceTensors];
              unint64_t v116 = [v115 objectAtIndexedSubscript:v114];

              [v111 setObject:v116 atIndexedSubscript:v114];
              ++v114;
              v117 = [v102 sourceTensors];
              unint64_t v118 = [v117 count];
            }
            while (v114 < v118);
          }
          long long v341 = 0u;
          long long v342 = 0u;
          long long v339 = 0u;
          long long v340 = 0u;
          obuint64_t j = v111;
          uint64_t v119 = [obj countByEnumeratingWithState:&v339 objects:v353 count:16];
          if (v119)
          {
            uint64_t v120 = v119;
            uint64_t v121 = *(void *)v340;
            while (2)
            {
              for (uint64_t k = 0; k != v120; ++k)
              {
                if (*(void *)v340 != v121) {
                  objc_enumerationMutation(obj);
                }
                v123 = *(void **)(*((void *)&v339 + 1) + 8 * k);
                char v124 = [v123 device];
                v125 = [v102 device];

                if (v124 != v125)
                {
                  v126 = [v102 device];
                  v127 = [v126 computeEngine];
                  char v128 = [v123 device];
                  char v129 = [v127 transferTensor:v123 fromDevice:v128];

                  if ((v129 & 1) == 0)
                  {
                    id v334 = v102;
                    v268 = +[MLCLog framework];
                    if (os_log_type_enabled(v268, OS_LOG_TYPE_ERROR))
                    {
                      v296 = NSStringFromSelector(aSelector);
                      v297 = [v123 device];
                      v298 = [v102 device];
                      *(_DWORD *)buf = 138413058;
                      *(void *)&uint8_t buf[4] = v296;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v123;
                      *(_WORD *)&buf[22] = 2112;
                      v350 = v297;
                      __int16 v351 = 2112;
                      v352 = v298;
                      _os_log_error_impl(&dword_1DD0C9000, v268, OS_LOG_TYPE_ERROR, "%@: Unable to transfer data of a tensor = %@ from device = %@ to device = %@", buf, 0x2Au);
                    }
                    v269 = +[MLCLog execution];
                    v270 = v269;
                    v15 = v306;
                    os_signpost_id_t v18 = v313;
                    unint64_t v19 = v316;
                    if (v311 > 0xFFFFFFFFFFFFFFFDLL)
                    {
                      v272 = obj;
                      v273 = obj;
                      v21 = v314;
                      v252 = v324;
                      v264 = v325;
                      v271 = v307;
                    }
                    else
                    {
                      v21 = v314;
                      v252 = v324;
                      v264 = v325;
                      v271 = v307;
                      v272 = obj;
                      if (os_signpost_enabled(v269))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v270, OS_SIGNPOST_INTERVAL_END, v309, "ExecuteForward -- PerLayer", "", buf, 2u);
                      }
                      v273 = obj;
                    }
LABEL_285:

                    BOOL v38 = 0;
                    uint64_t v20 = v327;
                    goto LABEL_286;
                  }
                  v130 = [v102 device];
                  [v123 setDevice:v130];

                  unint64_t v44 = v330;
                }
              }
              uint64_t v120 = [obj countByEnumeratingWithState:&v339 objects:v353 count:16];
              if (v120) {
                continue;
              }
              break;
            }
          }

          long long v337 = 0u;
          long long v338 = 0u;
          long long v335 = 0u;
          long long v336 = 0u;
          v131 = [v102 resultTensors];
          uint64_t v132 = [v131 countByEnumeratingWithState:&v335 objects:v348 count:16];
          if (v132)
          {
            uint64_t v133 = v132;
            uint64_t v134 = *(void *)v336;
            id v319 = v131;
            while (2)
            {
              for (uint64_t m = 0; m != v133; ++m)
              {
                if (*(void *)v336 != v134) {
                  objc_enumerationMutation(v319);
                }
                v136 = *(void **)(*((void *)&v335 + 1) + 8 * m);
                v137 = [v136 device];
                [v102 device];
                v139 = v138 = v102;

                if (v137 != v139)
                {
                  v140 = [v138 device];
                  v141 = [v140 computeEngine];
                  char v142 = [v141 updateDeviceMemoryForTensor:v136];

                  if ((v142 & 1) == 0)
                  {
                    id v334 = v138;
                    v276 = +[MLCLog execution];
                    v270 = v276;
                    if (v311 > 0xFFFFFFFFFFFFFFFDLL)
                    {
                      v15 = v306;
                      v271 = v307;
                      os_signpost_id_t v18 = v313;
                      v21 = v314;
                      unint64_t v19 = v316;
                      v252 = v324;
                      v264 = v325;
                      v272 = obj;
                    }
                    else
                    {
                      v15 = v306;
                      v271 = v307;
                      os_signpost_id_t v18 = v313;
                      v21 = v314;
                      unint64_t v19 = v316;
                      v252 = v324;
                      v264 = v325;
                      v272 = obj;
                      if (os_signpost_enabled(v276))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v270, OS_SIGNPOST_INTERVAL_END, v309, "ExecuteForward -- PerLayer", "", buf, 2u);
                      }
                    }
                    v273 = v319;
                    goto LABEL_285;
                  }
                }
                v143 = [v138 device];
                [v136 setDevice:v143];

                v102 = v138;
              }
              v131 = v319;
              uint64_t v133 = [v319 countByEnumeratingWithState:&v335 objects:v348 count:16];
              if (v133) {
                continue;
              }
              break;
            }
          }

          [v102 setBatchSize:batchSize];
          v144 = [v317 computeEngine];
          char v145 = objc_opt_respondsToSelector();

          if (v145)
          {
            v146 = [v317 computeEngine];
            MLCGraphCompilationOptions v147 = [v102 deviceOps];
            [v146 dispatchForwardLayer:v147];

            v148 = +[MLCLog execution];
            unint64_t v149 = v148;
            v15 = v306;
            os_signpost_id_t v18 = v313;
            self = v331;
            if (v311 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v148))
            {
              v150 = (objc_class *)objc_opt_class();
              NSStringFromClass(v150);
              id v151 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v152 = [v102 layerID];
              [v102 label];
              v154 = v153 = v102;
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v151;
              *(_WORD *)&buf[12] = 2050;
              *(void *)&buf[14] = v152;
              *(_WORD *)&buf[22] = 2114;
              v350 = v154;
              _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v149, OS_SIGNPOST_INTERVAL_END, v309, "ExecuteForward -- PerLayer", "%{public,name=MLCLayerType}@ (%{public,name=LayerID}lu, \"%{public,name=MLCLayerName}@\")", buf, 0x20u);

              v102 = v153;
              unint64_t v44 = v330;
            }
            goto LABEL_190;
          }
          objc_opt_class();
          v15 = v306;
          os_signpost_id_t v18 = v313;
          self = v331;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if ([(MLCGraph *)v331 allocateDeviceMemoryForTensorsInGraph])
            {
              if ([v102 compileForInferenceOnly])
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  [(MLCGraph *)v331 allocateDeviceMemoryForTensor:v307 device:v317];
                  v160 = [v102 resultTensors];
                  unint64_t v161 = [v160 count];

                  if (v161 >= 2)
                  {
                    unint64_t v162 = 1;
                    do
                    {
                      long long v163 = [v102 resultTensors];
                      long long v164 = [v163 objectAtIndexedSubscript:v162];
                      [(MLCGraph *)v331 allocateDeviceMemoryForTensor:v164 device:v317];

                      ++v162;
                      long long v165 = [v102 resultTensors];
                      unint64_t v166 = [v165 count];
                    }
                    while (v162 < v166);
                  }
                }
              }
              [(MLCGraph *)v331 updateDeviceMemoryReadCountForTensor:v307];
              long long v167 = [v102 resultTensors];
              unint64_t v168 = [v167 count];

              if (v168 >= 2)
              {
                unint64_t v169 = 1;
                do
                {
                  long long v170 = [v102 resultTensors];
                  long long v171 = [v170 objectAtIndexedSubscript:v169];
                  [(MLCGraph *)v331 updateDeviceMemoryReadCountForTensor:v171];

                  ++v169;
                  long long v172 = [v102 resultTensors];
                  unint64_t v173 = [v172 count];
                }
                while (v169 < v173);
              }
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v320 = [v317 computeEngine];
              long long v174 = [v102 deviceOps];
              long long v175 = [obj objectAtIndexedSubscript:0];
              uint64_t v176 = 0;
              int v304 = [v102 binaryOperation];
              if (v304)
              {
                uint64_t v176 = [obj objectAtIndexedSubscript:1];
                v303 = (void *)v176;
              }
              if ([obj count] == 3)
              {
                [obj objectAtIndexedSubscript:2];
                v302 = v175;
                v178 = long long v177 = v174;
                LOBYTE(v299) = 0;
                v179 = v320;
                [v320 dispatchForwardLayer:v177 sourceTensor:v302 secondaryTensor:v176 tertiaryTensor:v178 resultTensor:v307 resultStateIsTemporary:0 forTraining:v299];

                long long v174 = v177;
                long long v175 = v302;
              }
              else
              {
                LOBYTE(v299) = 0;
                v179 = v320;
                [v320 dispatchForwardLayer:v174 sourceTensor:v175 secondaryTensor:v176 tertiaryTensor:0 resultTensor:v307 resultStateIsTemporary:0 forTraining:v299];
              }
              if (v304) {

              }
              goto LABEL_181;
            }
            objc_opt_class();
            v183 = obj;
            if (objc_opt_isKindOfClass())
            {
              id v321 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
              [v321 setObject:v307 atIndexedSubscript:0];
              __int16 v184 = [v102 sourceTensors];
              if ([v184 count] == 3)
              {

                goto LABEL_166;
              }
              MLCGraphCompilationOptions v185 = [v102 sourceTensors];
              uint64_t v186 = [v185 count];

              BOOL v187 = v186 == 4;
              v183 = obj;
              if (v187)
              {
LABEL_166:
                uint64_t v188 = [v102 sourceTensors];
                v189 = [v188 objectAtIndexedSubscript:1];
                [v183 setObject:v189 atIndexedSubscript:1];

                v190 = [v102 sourceTensors];
                v191 = [v190 objectAtIndexedSubscript:2];
                [v183 setObject:v191 atIndexedSubscript:2];
              }
              v192 = [v102 resultTensors];
              uint64_t v193 = [v192 count];

              if (v193 == 3)
              {
                v194 = [v102 resultTensors];
                v195 = [v194 objectAtIndexedSubscript:1];
                [v321 setObject:v195 atIndexedSubscript:1];

                v196 = [v102 resultTensors];
                v197 = [v196 objectAtIndexedSubscript:2];
                [v321 setObject:v197 atIndexedSubscript:2];
              }
              long long v174 = [v317 computeEngine];
              v198 = [v102 deviceOps];
              [v174 dispatchRNNForwardLayer:v198 sourceTensors:obj resultTensors:v321];

              v179 = v321;
LABEL_181:

LABEL_182:
              if (([v102 isDebuggingEnabled] & 1) == 0
                && [(MLCGraph *)self allocateDeviceMemoryForTensorsInGraph]
                && [obj count])
              {
                unint64_t v207 = 0;
                do
                {
                  v208 = [obj objectAtIndexedSubscript:v207];
                  [(MLCGraph *)self freeDeviceMemoryForTensorIfSafe:v208 device:v317];

                  ++v207;
                }
                while (v207 < [obj count]);
              }
              v209 = +[MLCLog execution];
              unint64_t v149 = v209;
              if (v311 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                char v99 = v317;
                char v109 = v307;
                if (os_signpost_enabled(v209))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v149, OS_SIGNPOST_INTERVAL_END, v309, "ExecuteForward -- PerLayer", "", buf, 2u);
                }
                goto LABEL_191;
              }
LABEL_190:
              char v99 = v317;
              char v109 = v307;
              goto LABEL_191;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v179 = [v317 computeEngine];
              long long v174 = [v102 deviceOps];
              [v179 dispatchForwardMHALayer:v174 sourceTensors:obj resultTensor:v307 resultStateIsTemporary:0 forTraining:0];
              goto LABEL_181;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v179 = [v317 computeEngine];
              long long v174 = [v102 deviceOps];
              [v179 dispatchForwardMatMulLayer:v174 sourceTensors:obj resultTensor:v307];
LABEL_180:
              v15 = v306;
              os_signpost_id_t v18 = v313;
              unint64_t v44 = v330;
              self = v331;
              goto LABEL_181;
            }
            objc_opt_class();
            v199 = v102;
            if (objc_opt_isKindOfClass())
            {
              v200 = [v317 computeEngine];
              uint64_t v201 = [v102 deviceOps];
              v202 = [obj objectAtIndexedSubscript:0];
              [v200 dispatchForwardSliceLayer:v201 sourceTensor:v202 resultTensor:v307 forTraining:0];
LABEL_174:

              v179 = v200;
              long long v174 = (void *)v201;
              goto LABEL_180;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v203 = [v317 computeEngine];
              uint64_t v204 = [v102 deviceOps];
              v205 = [obj objectAtIndexedSubscript:0];
              v206 = [v102 resultTensors];
              [v203 dispatchForwardSplitLayer:v204 sourceTensor:v205 resultTensors:v206];
LABEL_179:

              v179 = v203;
              long long v174 = (void *)v204;
              goto LABEL_180;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v203 = [v317 computeEngine];
              uint64_t v204 = [v102 deviceOps];
              v205 = [v102 weights];
              v206 = [obj objectAtIndexedSubscript:0];
              [v203 dispatchForwardEmbeddingLayer:v204 weight:v205 sourceTensor:v206 resultTensor:v307];
              goto LABEL_179;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v210 = [v317 computeEngine];
              v211 = [v102 deviceOps];
              v212 = [obj objectAtIndexedSubscript:0];
              [v210 dispatchForwardReshapeLayer:v211 sourceTensor:v212 resultTensor:v307 resultStateIsTemporary:1 forTraining:0];

              v213 = [v307 sharedMemoryTensor];

              if (!v213)
              {
                v15 = v306;
                os_signpost_id_t v18 = v313;
                unint64_t v44 = v330;
                self = v331;
                v102 = v199;
                goto LABEL_182;
              }
              id v322 = [v307 sharedMemoryTensor];
              v305 = [v307 childLayers];
              uint64_t v214 = [v305 count];
              if (v214)
              {
                v301 = [v307 childLayers];
                uint64_t v215 = [v301 count];
              }
              else
              {
                uint64_t v215 = 1;
              }
              objc_msgSend(v322, "setReadCount:", objc_msgSend(v322, "readCount") + v215);
              if (v214) {

              }
LABEL_214:
              v15 = v306;
              os_signpost_id_t v18 = v313;
              unint64_t v44 = v330;
              self = v331;
              v102 = v199;
              v179 = v322;
              long long v174 = v305;
              goto LABEL_181;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v179 = [v317 computeEngine];
              long long v174 = [v102 deviceOps];
              [v179 dispatchForwardConcatLayer:v174 sourceTensors:obj resultTensor:v307];
              goto LABEL_180;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v216 = v102;
              id v217 = v102;
              v218 = [v317 computeEngine];
              v219 = [v217 deviceOps];
              v220 = [obj objectAtIndexedSubscript:0];
              uint64_t v221 = [v217 reductionType];
              v222 = [v217 dimensions];
              uint64_t v223 = v221;
              long long v174 = v218;
              [v218 dispatchForwardReduceLayer:v219 sourceTensor:v220 resultTensor:v307 reductionType:v223 reduceDimensions:v222 forTraining:0];

              v102 = v216;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v224 = v102;
                v305 = [v317 computeEngine];
                id v322 = v224;
                v225 = [v224 deviceOps];
                v226 = [obj objectAtIndexedSubscript:0];
                uint64_t v227 = [obj count];
                uint64_t v228 = 0;
                if (v227 == 2)
                {
                  uint64_t v228 = [obj objectAtIndexedSubscript:1];
                  v300 = (void *)v228;
                }
                objc_msgSend(v305, "dispatchForwardCompareLayer:sourceTensor:secondaryTensor:resultTensor:compareOp:forTraining:", v225, v226, v228, v307, objc_msgSend(v322, "operation"), 0);
                if (v227 == 2) {

                }
                goto LABEL_214;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v229 = v102;
                id v217 = v102;
                v230 = [v217 lossLabels];
                v231 = [v230 descriptor];
                v232 = [v231 stride];
                v233 = [v232 objectAtIndexedSubscript:0];
                unint64_t v234 = (unint64_t)[v233 unsignedIntegerValue] >> 2;

                v235 = [v317 computeEngine];
                v219 = [v217 deviceOps];
                v220 = [obj objectAtIndexedSubscript:0];
                v236 = [v217 lossLabels];
                v237 = [v217 weights];
                LOWORD(v299) = 0;
                objc_msgSend(v235, "dispatchForwardLossLayer:sourceTensor:labelsTensor:labelsTensorStride:weightsTensor:resultTensor:resultStateIsTemporary:forTraining:", v219, v220, v236, v234, v237, v307, v299);

                v102 = v229;
                long long v174 = v235;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v200 = [v317 computeEngine];
                  uint64_t v201 = [v102 deviceOps];
                  v202 = [obj objectAtIndexedSubscript:0];
                  [v200 dispatchForwardFullyConnectedLayer:v201 sourceTensor:v202 resultTensor:v307 forTraining:0];
                  goto LABEL_174;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v179 = [v317 computeEngine];
                    long long v174 = [v102 deviceOps];
                    [v179 dispatchForwardScatterLayer:v174 sourceTensors:obj resultTensor:v307 forTraining:0];
                    goto LABEL_180;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v179 = [v317 computeEngine];
                    long long v174 = [v102 deviceOps];
                    [v179 dispatchForwardGatherLayer:v174 sourceTensors:obj resultTensor:v307 forTraining:0];
                    goto LABEL_180;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v242 = [v102 fusedLayers];
                    if ([v242 count])
                    {
                      v243 = [v102 fusedLayers];
                      v244 = [v243 objectAtIndexedSubscript:0];
                      objc_opt_class();
                      char isKindOfClass = objc_opt_isKindOfClass();

                      if (isKindOfClass)
                      {
                        v179 = [v317 computeEngine];
                        v102 = v199;
                        long long v174 = [v199 deviceOps];
                        [v179 dispatchForwardFusedArithmeticLayerNormalizationLayer:v174 sourceTensors:obj resultTensor:v307 forTraining:0];
                        goto LABEL_180;
                      }
                    }
                    else
                    {
                    }
                  }
                  v200 = [v317 computeEngine];
                  v102 = v199;
                  uint64_t v201 = [v199 deviceOps];
                  v202 = [obj objectAtIndexedSubscript:0];
                  [v200 dispatchForwardLayer:v201 sourceTensor:v202 resultTensor:v307 resultStateIsTemporary:0 forTraining:0];
                  goto LABEL_174;
                }
                id v217 = [v317 computeEngine];
                v238 = v102;
                uint64_t v239 = [v102 deviceOps];
                v219 = [obj objectAtIndexedSubscript:0];
                v220 = [obj objectAtIndexedSubscript:1];
                v347[0] = v220;
                v240 = [obj objectAtIndexedSubscript:2];
                v347[1] = v240;
                v241 = [MEMORY[0x1E4F1C978] arrayWithObjects:v347 count:2];
                [v217 dispatchForwardSelectLayer:v239 conditionTensor:v219 sourceTensors:v241 resultTensor:v307 forTraining:0];

                v102 = v238;
                long long v174 = (void *)v239;
              }
            }

            v179 = v217;
            goto LABEL_180;
          }
          v155 = [v317 computeEngine];
          int v156 = objc_msgSend(v155, "needToAllocateDeviceMemoryForTensor:");

          if (v156) {
            break;
          }
          v180 = [v307 sharedMemoryTensor];

          if (!v180)
          {
            v157 = [v317 computeEngine];
            uint64_t v158 = [v102 deviceOps];
            [v157 dispatchForwardConcatLayer:v158 sourceTensors:obj resultTensor:v307];
            goto LABEL_148;
          }
LABEL_149:
          unint64_t v98 = 0x1E6CB4000uLL;
          v181 = +[MLCLog execution];
          v182 = v181;
          if (v311 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v181))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v182, OS_SIGNPOST_INTERVAL_END, v309, "ExecuteForward -- PerLayer", "", buf, 2u);
          }

          char v99 = v317;
          if ([(MLCGraph *)v331 allocateDeviceMemoryForTensorsInGraph])
          {
            char v109 = v307;
            [(MLCGraph *)v331 updateDeviceMemoryReadCountForTensor:v307];
            unint64_t v149 = [obj objectAtIndexedSubscript:0];
            [(MLCGraph *)v331 freeDeviceMemoryForTensorIfSafe:v149 device:v317];
LABEL_191:

            unint64_t v98 = 0x1E6CB4000;
            goto LABEL_192;
          }
          char v109 = v307;
LABEL_192:

LABEL_193:
          v96 = v99;
          BOOL v187 = v41++ == v44;
          unint64_t v100 = v309 - 1;
          if (v187) {
            goto LABEL_232;
          }
        }
        v157 = [v317 computeEngine];
        uint64_t v158 = [v102 sourceTensors];
        uint64_t v159 = [v158 objectAtIndexedSubscript:0];
        [v157 shareDeviceMemoryWithResultTensor:v307 sourceTensor:v159];

LABEL_148:
        goto LABEL_149;
      }
LABEL_232:
      v317 = v96;
      v246 = [*(id *)(v98 + 1176) execution];
      v247 = v246;
      if (v308 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v246))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v247, OS_SIGNPOST_INTERVAL_END, spid, "ExecuteForward", "", buf, 2u);
      }

      v248 = [v325 device];
      v249 = [v248 computeEngine];
      [v249 synchronizeTensor:v325];

      v250 = [v325 device];
      v251 = [v250 computeEngine];
      v252 = v324;
      v253 = [v324 resultTensors];
      v254 = [v253 objectAtIndexedSubscript:0];
      [v251 shareDeviceMemoryWithResultTensor:v254 sourceTensor:v325];

      unint64_t v19 = v316;
      uint64_t v20 = v327;
      if (v310)
      {
        v255 = v331;
        [(MLCGraph *)v331 dispatchReadsForMultipleTensorOutputs:v327 finalTensorInGraph:0 finalResultTensor:0 batchSize:batchSize];
        v21 = v314;
        MLCExecutionOptions v256 = v323;
        if (v314)
        {
          v257 = [v325 descriptor];
          id v334 = +[MLCTensor tensorWithDescriptor:v257 data:v315];
        }
        else
        {
          id v334 = 0;
        }
      }
      else
      {
        v274 = [v324 resultTensors];
        v275 = [v274 objectAtIndexedSubscript:0];
        [(MLCGraph *)v331 dispatchReadsForMultipleTensorOutputs:v327 finalTensorInGraph:v275 finalResultTensor:v325 batchSize:batchSize];

        v21 = v314;
        MLCExecutionOptions v256 = v323;
        if (v314) {
          id v334 = v325;
        }
        else {
          id v334 = 0;
        }
        v255 = v331;
      }
      if ((v256 & 2) != 0)
      {
        if ((executeWithInputsData_lossLabelsData_lossLabelWeightsData_outputsData_batchSize_options_completionHandler__warnedAlready_0 & 1) == 0)
        {
          v284 = +[MLCLog framework];
          if (os_log_type_enabled(v284, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(aSelector);
            id v285 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v285;
            _os_log_impl(&dword_1DD0C9000, v284, OS_LOG_TYPE_INFO, "%@: Synchronous Execution requested", buf, 0xCu);
          }
          executeWithInputsData_lossLabelsData_lossLabelWeightsData_outputsData_batchSize_options_completionHandler__warnedAlready_0 = 1;
          v21 = v314;
        }
        v286 = [(MLCGraph *)v255 device];
        v287 = [v286 computeEngine];
        [v287 commitAndWaitForCompletion:v21 enableProfiling:(v323 >> 2) & 1 graphExecutionTime:v318 graphResultTensor:v334];
      }
      else
      {
        uint64_t v288 = (v256 >> 2) & 1;
        v286 = [(MLCGraph *)v255 device];
        v287 = [v286 computeEngine];
        [v287 commitWithCompletionHandler:v21 enableProfiling:v288 graphExecutionTime:v318 graphResultTensor:v334];
      }

      [(MLCGraph *)v255 setAllocateDeviceMemoryForTensorsInGraph:0];
      v271 = [(MLCGraph *)v255 freeResourceList];
      [v271 removeAllObjects];
      BOOL v38 = 1;
      v264 = v325;
LABEL_286:

      uint64_t v37 = v317;
      goto LABEL_38;
    }
    v76 = +[MLCLog execution];
    v77 = v76;
    unint64_t v78 = spid - 1;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v77, OS_SIGNPOST_INTERVAL_BEGIN, spid, "BindData", "", buf, 2u);
    }
    uint64_t v79 = (v323 >> 1) & 1;

    v80 = [(MLCGraph *)self allInputs];
    v81 = [(MLCGraph *)self device];
    BOOL v82 = [(MLCGraph *)self bindAndWriteData:v15 forInputs:v80 toDevice:v81 batchSize:batchSize synchronous:v79 skipWrite:0];

    if (v82)
    {
      if (v18
        && ([(MLCGraph *)self allLossLabels],
            uint64_t v83 = objc_claimAutoreleasedReturnValue(),
            [(MLCGraph *)self device],
            v84 = objc_claimAutoreleasedReturnValue(),
            BOOL v85 = [(MLCGraph *)self bindAndWriteData:v18 forInputs:v83 toDevice:v84 batchSize:batchSize synchronous:v79 skipWrite:0], v84, v83, !v85))
      {
        v277 = NSString;
        v278 = [(MLCGraph *)self allLossLabels];
        uint64_t v279 = [v277 stringWithFormat:@"loss label name missing from loss labels specified at compile time allLossLabels=%@", v278];

        v280 = +[MLCLog framework];
        if (os_log_type_enabled(v280, OS_LOG_TYPE_ERROR)) {
          -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:]();
        }

        v281 = NSStringFromSelector(aSelector);
        id v334 = (id)v279;
        uint64_t v282 = +[MLCErrors invalidInputErrorForMethod:v281 description:v279];

        unint64_t v19 = v316;
        uint64_t v20 = v327;
        v21 = v314;
        v264 = v325;
        if (v314) {
          v314[2](v314, 0, (void *)v282, 0.0);
        }
        v265 = (void *)v282;
        v283 = +[MLCLog execution];
        v267 = v283;
        if (v78 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v283)) {
          goto LABEL_282;
        }
      }
      else
      {
        if (!v316
          || ([(MLCGraph *)self allLossLabelWeights],
              unint64_t v86 = objc_claimAutoreleasedReturnValue(),
              [(MLCGraph *)self device],
              v87 = objc_claimAutoreleasedReturnValue(),
              BOOL v88 = [(MLCGraph *)self bindAndWriteData:v316 forInputs:v86 toDevice:v87 batchSize:batchSize synchronous:v79 skipWrite:0], v87, v86, v88))
        {
          v89 = +[MLCLog execution];
          uint64_t v90 = v89;
          unint64_t v91 = spid - 1;
          if (v78 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v90, OS_SIGNPOST_INTERVAL_END, spid, "BindData", "", buf, 2u);
          }

          unsigned int v74 = v323;
          goto LABEL_86;
        }
        v289 = NSString;
        v290 = [(MLCGraph *)self allLossLabelWeights];
        uint64_t v291 = [v289 stringWithFormat:@"loss label weight name missing from loss label weights specified at compile time allLossLabelWeights=%@", v290];

        v292 = +[MLCLog framework];
        if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR)) {
          -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:]();
        }

        v293 = NSStringFromSelector(aSelector);
        id v334 = (id)v291;
        uint64_t v294 = +[MLCErrors invalidInputErrorForMethod:v293 description:v291];

        unint64_t v19 = v316;
        uint64_t v20 = v327;
        v21 = v314;
        v264 = v325;
        if (v314) {
          v314[2](v314, 0, (void *)v294, 0.0);
        }
        v265 = (void *)v294;
        v295 = +[MLCLog execution];
        v267 = v295;
        if (v78 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v295))
        {
LABEL_282:

          v317 = 0;
          BOOL v38 = 0;
          v252 = v324;
          v271 = v265;
          goto LABEL_286;
        }
      }
    }
    else
    {
      v258 = NSString;
      v259 = [(MLCGraph *)self allInputs];
      uint64_t v260 = [v258 stringWithFormat:@"input name missing from inputs specified at compile time allInputs=%@", v259];

      v261 = +[MLCLog framework];
      if (os_log_type_enabled(v261, OS_LOG_TYPE_ERROR)) {
        -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:]();
      }

      v262 = NSStringFromSelector(aSelector);
      id v334 = (id)v260;
      uint64_t v263 = +[MLCErrors invalidInputErrorForMethod:v262 description:v260];

      unint64_t v19 = v316;
      uint64_t v20 = v327;
      v21 = v314;
      v264 = v325;
      if (v314) {
        v314[2](v314, 0, (void *)v263, 0.0);
      }
      v265 = (void *)v263;
      v266 = +[MLCLog execution];
      v267 = v266;
      if (v78 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v266)) {
        goto LABEL_282;
      }
    }
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v334;
    _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v267, OS_SIGNPOST_INTERVAL_END, spid, "BindData", "%{public,name=Error}@", buf, 0xCu);
    goto LABEL_282;
  }
  v31 = NSStringFromSelector(a2);
  uint64_t v32 = @"Empty graph";
LABEL_35:
  uint64_t v37 = +[MLCErrors invalidStateErrorForMethod:v31 description:v32];

  if (v21) {
    v21[2](v21, 0, v37, 0.0);
  }
  BOOL v38 = 0;
LABEL_38:

  return v38;
}

- (BOOL)linkWithGraphs:(NSArray *)graphs
{
  return 1;
}

- (id)resultTensorsForLayer:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MLCGraph *)self graphLayerList];
  v8.receiver = self;
  v8.super_class = (Class)MLCInferenceGraph;
  objc_super v6 = [(MLCGraph *)&v8 resultTensorsForLayer:v4 graphLayerList:v5];

  return v6;
}

- (id)sourceTensorsForLayer:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MLCGraph *)self graphLayerList];
  v8.receiver = self;
  v8.super_class = (Class)MLCInferenceGraph;
  objc_super v6 = [(MLCGraph *)&v8 sourceTensorsForLayer:v4 graphLayerList:v5];

  return v6;
}

- (unint64_t)inferenceNodeInit
{
  return self->_inferenceNodeInit;
}

- (void)setInferenceNodeInit:(unint64_t)a3
{
  self->_inferenceNodeInit = a3;
}

- (unint64_t)inferenceNodeIndexInGraphLayerList
{
  return self->_inferenceNodeIndexInGraphLayerList;
}

- (void)setInferenceNodeIndexInGraphLayerList:(unint64_t)a3
{
  self->_inferenceNodeIndexInGraphLayerList = a3;
}

- (void)concatenateWithSources:(const char *)a1 dimension:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Number of sources must be > 0", v4, v5, v6, v7, v8);
}

- (void)concatenateWithSources:(const char *)a1 dimension:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: dimension must be a value between 1 and 4", v4, v5, v6, v7, v8);
}

- (void)concatenateWithSources:(const char *)a1 dimension:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: source tensor is nil", v4, v5, v6, v7, v8);
}

- (void)compileWithOptions:device:inputTensors:inputTensorsData:.cold.5()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromSelector(v2);
  uint64_t v4 = [v1 device];
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint8_t v8 = v1;
  __int16 v9 = 2112;
  unint64_t v10 = v4;
  _os_log_error_impl(&dword_1DD0C9000, v0, OS_LOG_TYPE_ERROR, "%@: Compiling a layer (%@) in graph that has already been compiled with another device(%@)", (uint8_t *)&v5, 0x20u);
}

- (void)executeWithInputsData:(const char *)a1 lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:.cold.10(const char *a1)
{
  NSStringFromSelector(a1);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);
}

@end