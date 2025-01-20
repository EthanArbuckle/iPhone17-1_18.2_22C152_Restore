@interface MLCGraph
+ (MLCGraph)graph;
+ (MLCGraph)graphWithGraphObjects:(id)a3;
- (BOOL)addInputs:(id)a3 lossLabels:(id)a4;
- (BOOL)addInputs:(id)a3 lossLabels:(id)a4 lossLabelWeights:(id)a5;
- (BOOL)addOutputs:(id)a3;
- (BOOL)allocateDeviceMemoryForTensorsInGraph;
- (BOOL)bindAndWriteData:(NSDictionary *)inputsData forInputs:(NSDictionary *)inputTensors toDevice:(MLCDevice *)device batchSize:(NSUInteger)batchSize synchronous:(BOOL)synchronous;
- (BOOL)bindAndWriteData:(NSDictionary *)inputsData forInputs:(NSDictionary *)inputTensors toDevice:(MLCDevice *)device synchronous:(BOOL)synchronous;
- (BOOL)bindAndWriteData:(id)a3 forInputs:(id)a4 toDevice:(id)a5 batchSize:(unint64_t)a6 synchronous:(BOOL)a7 skipWrite:(BOOL)a8;
- (BOOL)checkPageAlignmentAndSizeForOutputs:(id)a3;
- (BOOL)checksBeforeAddLayerInGraph:(id)a3 sources:(id)a4 forTraining:(BOOL)a5;
- (BOOL)dispatchReadsForMultipleTensorOutputs:(id)a3 finalTensorInGraph:(id)a4 finalResultTensor:(id)a5 batchSize:(unint64_t)a6;
- (BOOL)isLayerInGraphLayerList:(id)a3 graphLayerList:(id)a4;
- (BOOL)readyForExecution;
- (BOOL)recompileAfterLinking;
- (BOOL)staticBatchSizeInGraph;
- (MLCDevice)device;
- (MLCGraph)init;
- (MLCGraph)initWithGraphObjects:(id)a3;
- (MLCTensor)concatenateWithSources:(NSArray *)sources dimension:(NSUInteger)dimension;
- (MLCTensor)gatherWithDimension:(NSUInteger)dimension source:(MLCTensor *)source indices:(MLCTensor *)indices;
- (MLCTensor)nodeWithLayer:(MLCLayer *)layer source:(MLCTensor *)source;
- (MLCTensor)nodeWithLayer:(MLCLayer *)layer sources:(NSArray *)sources;
- (MLCTensor)nodeWithLayer:(MLCLayer *)layer sources:(NSArray *)sources disableUpdate:(BOOL)disableUpdate;
- (MLCTensor)nodeWithLayer:(MLCLayer *)layer sources:(NSArray *)sources lossLabels:(NSArray *)lossLabels;
- (MLCTensor)reshapeWithShape:(NSArray *)shape source:(MLCTensor *)source;
- (MLCTensor)scatterWithDimension:(NSUInteger)dimension source:(MLCTensor *)source indices:(MLCTensor *)indices copyFrom:(MLCTensor *)copyFrom reductionType:(MLCReductionType)reductionType;
- (MLCTensor)selectWithSources:(NSArray *)sources condition:(MLCTensor *)condition;
- (MLCTensor)transposeWithDimensions:(NSArray *)dimensions source:(MLCTensor *)source;
- (NSArray)graphObjects;
- (NSArray)layers;
- (NSArray)resultTensorsForLayer:(MLCLayer *)layer;
- (NSArray)sourceTensorsForLayer:(MLCLayer *)layer;
- (NSArray)splitWithSource:(MLCTensor *)source splitCount:(NSUInteger)splitCount dimension:(NSUInteger)dimension;
- (NSArray)splitWithSource:(MLCTensor *)source splitSectionLengths:(NSArray *)splitSectionLengths dimension:(NSUInteger)dimension;
- (NSDictionary)allInputs;
- (NSDictionary)allLossLabelWeights;
- (NSDictionary)allLossLabels;
- (NSDictionary)allOutputs;
- (NSMutableArray)freeResourceList;
- (NSMutableArray)graphLayerList;
- (NSMutableArray)lstmLayerIndexList;
- (NSMutableArray)rootLevelTensorNodes;
- (NSMutableDictionary)layerChildMap;
- (NSMutableDictionary)layerParentMap;
- (NSString)summarizedDOTDescription;
- (id)conditionalWithPredicate:(id)a3 trueBranch:(id)a4 falseBranch:(id)a5;
- (id)createGradientSourceTensorWith:(id)a3 source:(id)a4;
- (id)createLossGradientSourceTensorWith:(id)a3 source:(id)a4 batchSize:(id)a5;
- (id)createTensorWith:(id)a3 sources:(id)a4;
- (id)description;
- (id)nodeWithLayer:(id)a3 sources:(id)a4 forTraining:(BOOL)a5;
- (id)nodeWithMultiOutputLayer:(id)a3 source:(id)a4 forTraining:(BOOL)a5;
- (id)resultTensorsForLayer:(id)a3 graphLayerList:(id)a4;
- (id)sourceTensorsForLayer:(id)a3 graphLayerList:(id)a4;
- (unint64_t)compilerOptions;
- (unint64_t)nextLayerID;
- (void)addGraphNodes:(id)a3 withControlTreeNode:(id)a4;
- (void)allocateDeviceMemoryForTensor:(id)a3 device:(id)a4;
- (void)checkAndResetTensorsAssociatedWithLayer:(id)a3 sources:(id)a4;
- (void)createVariableLengthSequenceTensorsForLayer:(id)a3 withVariableSequenceLength:(id)a4;
- (void)dealloc;
- (void)enumerateInputsUsingBlock:(id)a3;
- (void)enumerateLayersUsingBlock:(id)a3;
- (void)enumerateOutputsUsingBlock:(id)a3;
- (void)flattenConditionalLayer:(id)a3;
- (void)freeDeviceMemoryForTensorIfSafe:(id)a3 device:(id)a4;
- (void)insertPhis:(id)a3;
- (void)linkRelatedTensorsForConcatLayer:(id)a3 device:(id)a4;
- (void)linkSourceTensorsWithLayer:(id)a3 sources:(id)a4;
- (void)setAllInputs:(id)a3;
- (void)setAllLossLabelWeights:(id)a3;
- (void)setAllLossLabels:(id)a3;
- (void)setAllOutputs:(id)a3;
- (void)setAllocateDeviceMemoryForTensorsInGraph:(BOOL)a3;
- (void)setCompilerOptions:(unint64_t)a3;
- (void)setDevice:(id)a3;
- (void)setFreeResourceList:(id)a3;
- (void)setGraphLayerList:(id)a3;
- (void)setLayerChildMap:(id)a3;
- (void)setLayerParentMap:(id)a3;
- (void)setLstmLayerIndexList:(id)a3;
- (void)setNextLayerID:(unint64_t)a3;
- (void)setReadyForExecution:(BOOL)a3;
- (void)setRecompileAfterLinking:(BOOL)a3;
- (void)setRootLevelTensorNodes:(id)a3;
- (void)setStaticBatchSizeInGraph:(BOOL)a3;
- (void)summarizedDOTDescription;
- (void)updateDeviceMemoryReadCountForGradientWithLayer:(id)a3 tensor:(id)a4 checkIfSourceNeeded:(BOOL)a5 checkIfResultNeeded:(BOOL)a6;
- (void)updateDeviceMemoryReadCountForTensor:(id)a3;
- (void)updateLSTMLayersForVariableSequenceLengthInGraph:(id)a3 withInputData:(id)a4;
- (void)updateOutputTensorsDeviceMemoryWithData:(id)a3;
- (void)writeAsyncToDevice:(id)a3 dataForTensors:(id)a4;
@end

@implementation MLCGraph

+ (MLCGraph)graphWithGraphObjects:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithGraphObjects:v4];

  return (MLCGraph *)v5;
}

- (MLCGraph)init
{
  return [(MLCGraph *)self initWithGraphObjects:MEMORY[0x1E4F1CBF0]];
}

+ (MLCGraph)graph
{
  v2 = objc_opt_new();

  return (MLCGraph *)v2;
}

- (MLCGraph)initWithGraphObjects:(id)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v96.receiver = self;
  v96.super_class = (Class)MLCGraph;
  v6 = [(MLCGraph *)&v96 init];
  v7 = v6;
  if (v6)
  {
    v6->_nextLayerID = 1;
    v8 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v9 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    graphLayerList = v7->_graphLayerList;
    v7->_graphLayerList = (NSMutableArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CC08];
    uint64_t v12 = [MEMORY[0x1E4F1CC08] mutableCopy];
    layerChildMap = v7->_layerChildMap;
    v7->_layerChildMap = (NSMutableDictionary *)v12;

    uint64_t v14 = [v11 mutableCopy];
    layerParentMap = v7->_layerParentMap;
    v7->_layerParentMap = (NSMutableDictionary *)v14;

    uint64_t v16 = [v8 mutableCopy];
    rootLevelTensorNodes = v7->_rootLevelTensorNodes;
    v7->_rootLevelTensorNodes = (NSMutableArray *)v16;

    objc_storeStrong((id *)&v7->_graphObjects, a3);
    v7->_readyForExecutiouint64_t n = 0;
    allInputs = v7->_allInputs;
    v7->_allInputs = 0;

    allOutputs = v7->_allOutputs;
    v7->_allOutputs = 0;

    allLossLabels = v7->_allLossLabels;
    v7->_allLossLabels = 0;

    allLossLabelWeights = v7->_allLossLabelWeights;
    v7->_allLossLabelWeights = 0;

    device = v7->_device;
    v7->_device = 0;

    *(_WORD *)&v7->_recompileAfterLinking = 256;
    v7->_compilerOptions = 0;
    uint64_t v23 = [v8 mutableCopy];
    lstmLayerIndexList = v7->_lstmLayerIndexList;
    v7->_lstmLayerIndexList = (NSMutableArray *)v23;

    unint64_t v71 = 1;
    v7->_allocateDeviceMemoryForTensorsInGraph = 1;
    uint64_t v25 = [v8 mutableCopy];
    freeResourceList = v7->_freeResourceList;
    v7->_freeResourceList = (NSMutableArray *)v25;

    if ([v5 count])
    {
      uint64_t v27 = 0;
      v70 = v5;
      unint64_t v71 = 1;
      v75 = v7;
      do
      {
        uint64_t v72 = v27;
        v28 = [v5 objectAtIndexedSubscript:v27];
        if ([v28 nextLayerID] > v71) {
          unint64_t v71 = [v28 nextLayerID];
        }
        char v29 = [v28 staticBatchSizeInGraph];
        if (v7->_staticBatchSizeInGraph) {
          BOOL v30 = v29;
        }
        else {
          BOOL v30 = 0;
        }
        v7->_staticBatchSizeInGraph = v30;
        v31 = [v28 graphLayerList];
        uint64_t v32 = [v31 count];

        if (v32)
        {
          unint64_t v33 = 0;
          do
          {
            v34 = [v28 graphLayerList];
            v35 = [v34 objectAtIndexedSubscript:v33];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [(MLCGraph *)v7 flattenConditionalLayer:v35];
            }
            else
            {
              v36 = [(MLCGraph *)v7 graphLayerList];
              [v36 addObject:v35];
            }
            ++v33;
            v37 = [v28 graphLayerList];
            unint64_t v38 = [v37 count];
          }
          while (v33 < v38);
        }
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        v39 = [v28 rootLevelTensorNodes];
        uint64_t v40 = [v39 countByEnumeratingWithState:&v92 objects:v101 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v93;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v93 != v42) {
                objc_enumerationMutation(v39);
              }
              [(NSMutableArray *)v7->_rootLevelTensorNodes addObject:*(void *)(*((void *)&v92 + 1) + 8 * i)];
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v92 objects:v101 count:16];
          }
          while (v41);
        }

        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        obuint64_t j = [v28 layerChildMap];
        uint64_t v44 = [obj countByEnumeratingWithState:&v88 objects:v100 count:16];
        v45 = v28;
        if (v44)
        {
          uint64_t v46 = v44;
          uint64_t v47 = *(void *)v89;
          do
          {
            for (uint64_t j = 0; j != v46; ++j)
            {
              if (*(void *)v89 != v47) {
                objc_enumerationMutation(obj);
              }
              uint64_t v49 = *(void *)(*((void *)&v88 + 1) + 8 * j);
              v50 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
              long long v84 = 0u;
              long long v85 = 0u;
              long long v86 = 0u;
              long long v87 = 0u;
              v51 = [v28 layerChildMap];
              v52 = [v51 objectForKeyedSubscript:v49];

              uint64_t v53 = [v52 countByEnumeratingWithState:&v84 objects:v99 count:16];
              if (v53)
              {
                uint64_t v54 = v53;
                uint64_t v55 = *(void *)v85;
                do
                {
                  for (uint64_t k = 0; k != v54; ++k)
                  {
                    if (*(void *)v85 != v55) {
                      objc_enumerationMutation(v52);
                    }
                    [v50 addObject:*(void *)(*((void *)&v84 + 1) + 8 * k)];
                  }
                  uint64_t v54 = [v52 countByEnumeratingWithState:&v84 objects:v99 count:16];
                }
                while (v54);
              }

              [(NSMutableDictionary *)v75->_layerChildMap setObject:v50 forKeyedSubscript:v49];
              v28 = v45;
            }
            uint64_t v46 = [obj countByEnumeratingWithState:&v88 objects:v100 count:16];
          }
          while (v46);
        }

        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        id obja = [v28 layerParentMap];
        uint64_t v57 = [obja countByEnumeratingWithState:&v80 objects:v98 count:16];
        if (v57)
        {
          uint64_t v58 = v57;
          uint64_t v59 = *(void *)v81;
          do
          {
            for (uint64_t m = 0; m != v58; ++m)
            {
              if (*(void *)v81 != v59) {
                objc_enumerationMutation(obja);
              }
              uint64_t v61 = *(void *)(*((void *)&v80 + 1) + 8 * m);
              v62 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
              long long v76 = 0u;
              long long v77 = 0u;
              long long v78 = 0u;
              long long v79 = 0u;
              v63 = [v28 layerParentMap];
              v64 = [v63 objectForKeyedSubscript:v61];

              uint64_t v65 = [v64 countByEnumeratingWithState:&v76 objects:v97 count:16];
              if (v65)
              {
                uint64_t v66 = v65;
                uint64_t v67 = *(void *)v77;
                do
                {
                  for (uint64_t n = 0; n != v66; ++n)
                  {
                    if (*(void *)v77 != v67) {
                      objc_enumerationMutation(v64);
                    }
                    [v62 addObject:*(void *)(*((void *)&v76 + 1) + 8 * n)];
                  }
                  uint64_t v66 = [v64 countByEnumeratingWithState:&v76 objects:v97 count:16];
                }
                while (v66);
              }

              [(NSMutableDictionary *)v75->_layerParentMap setObject:v62 forKeyedSubscript:v61];
              v28 = v45;
            }
            uint64_t v58 = [obja countByEnumeratingWithState:&v80 objects:v98 count:16];
          }
          while (v58);
        }

        uint64_t v27 = v72 + 1;
        id v5 = v70;
        v7 = v75;
      }
      while (v72 + 1 < (unint64_t)[v70 count]);
    }
    v7->_nextLayerID = v71;
  }

  return v7;
}

- (void)dealloc
{
  v2 = self;
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_graphLayerList count])
  {
    uint64_t v3 = 0;
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
    while (1)
    {
      id v5 = [(NSMutableArray *)v2->_graphLayerList objectAtIndexedSubscript:v3];
      [v5 resetLayerID];
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      v6 = [v5 sourceTensors];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v96 objects:v102 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v97;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v97 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v96 + 1) + 8 * i);
            uint64_t v12 = [v11 childLayers];
            [v12 removeAllObjects];

            v13 = [v11 parentLayers];
            [v13 removeAllObjects];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v96 objects:v102 count:16];
        }
        while (v8);
      }

      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      uint64_t v14 = [v5 resultTensors];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v92 objects:v101 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v93;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v93 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v92 + 1) + 8 * j);
            v20 = [v19 childLayers];
            [v20 removeAllObjects];

            v21 = [v19 parentLayers];
            [v21 removeAllObjects];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v92 objects:v101 count:16];
        }
        while (v16);
      }

      v22 = [v5 intermediateGradientTensors];
      [v22 removeAllObjects];

      [v5 setIntermediateGradientTensorIndex:0];
      [v5 setIntermediateSumLayer:0];
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      uint64_t v23 = [v5 fusedLayers];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v88 objects:v100 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v89;
        do
        {
          for (uint64_t k = 0; k != v25; ++k)
          {
            if (*(void *)v89 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v88 + 1) + 8 * k);
            char v29 = (void *)[v4 mutableCopy];
            [v28 setDeviceOps:v29];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v88 objects:v100 count:16];
        }
        while (v25);
      }

      BOOL v30 = [v5 fusedLayers];
      if ([v30 count]) {
        int v31 = 1;
      }
      else {
        int v31 = [v5 skipLayer];
      }

      uint64_t v32 = [(MLCGraph *)v2 device];
      if (![v32 type]) {
        goto LABEL_30;
      }
      unint64_t v33 = [(MLCGraph *)v2 device];
      if ([v33 type] == 1) {
        break;
      }
      v73 = [(MLCGraph *)v2 device];
      if ([v73 type] == 2)
      {
        v74 = [(MLCGraph *)v2 device];
        [v74 gpuDevices];
        int v75 = v31;
        v77 = long long v76 = v2;
        uint64_t v86 = [v77 count];

        v2 = v76;
        int v31 = v75;

        if (v86) {
          goto LABEL_31;
        }
      }
      else
      {
      }
LABEL_54:
      [v5 setSkipLayer:0];
      [v5 setIsLastFusedLayer:0];
      if (v31)
      {
        long long v78 = [v5 sourceTensors];
        [v78 removeAllObjects];

        long long v79 = [v5 resultTensors];
        [v79 removeAllObjects];

        long long v80 = [v5 sourceGradientTensors];
        [v80 removeAllObjects];

        long long v81 = [v5 resultGradientTensors];
        [v81 removeAllObjects];

        long long v82 = [v5 fusedLayers];
        uint64_t v83 = [v82 count];

        if (v83)
        {
          long long v84 = [v5 fusedLayers];
          [v84 removeAllObjects];
        }
        long long v85 = (void *)[v4 mutableCopy];
        [v5 setDeviceOps:v85];
      }
      [v5 unlinkAssociatedTensors];

      if (++v3 >= (unint64_t)[(NSMutableArray *)v2->_graphLayerList count]) {
        goto LABEL_59;
      }
    }

LABEL_30:
LABEL_31:
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      int v31 = 1;
    }
    v34 = [v5 sourceTensors];
    uint64_t v35 = [v34 count];

    if (v35)
    {
      unint64_t v36 = 0;
      do
      {
        v37 = [v5 sourceTensors];
        unint64_t v38 = [v37 objectAtIndexedSubscript:v36];
        v39 = [v38 sharedMemoryTensor];

        if (v39)
        {
          uint64_t v40 = [v5 sourceTensors];
          uint64_t v41 = [v40 objectAtIndexedSubscript:v36];
          uint64_t v42 = [v41 deviceMemory];
          [v42 removeAllObjects];

          v43 = [v5 sourceTensors];
          uint64_t v44 = [v43 objectAtIndexedSubscript:v36];
          [v44 setSharedMemoryTensor:0];
        }
        ++v36;
        v45 = [v5 sourceTensors];
        unint64_t v46 = [v45 count];
      }
      while (v36 < v46);
    }
    uint64_t v47 = [v5 resultTensors];
    uint64_t v48 = [v47 count];

    if (v48)
    {
      unint64_t v49 = 0;
      do
      {
        v50 = [v5 resultTensors];
        v51 = [v50 objectAtIndexedSubscript:v49];
        v52 = [v51 sharedMemoryTensor];

        if (v52)
        {
          uint64_t v53 = [v5 resultTensors];
          uint64_t v54 = [v53 objectAtIndexedSubscript:v49];
          uint64_t v55 = [v54 deviceMemory];
          [v55 removeAllObjects];

          v56 = [v5 resultTensors];
          uint64_t v57 = [v56 objectAtIndexedSubscript:v49];
          [v57 setSharedMemoryTensor:0];
        }
        ++v49;
        uint64_t v58 = [v5 resultTensors];
        unint64_t v59 = [v58 count];
      }
      while (v49 < v59);
    }
    v60 = [v5 resultGradientTensors];
    uint64_t v61 = [v60 count];

    if (v61)
    {
      unint64_t v62 = 0;
      do
      {
        v63 = [v5 resultGradientTensors];
        v64 = [v63 objectAtIndexedSubscript:v62];
        uint64_t v65 = [v64 sharedMemoryTensor];

        if (v65)
        {
          uint64_t v66 = [v5 resultGradientTensors];
          uint64_t v67 = [v66 objectAtIndexedSubscript:v62];
          v68 = [v67 deviceMemory];
          [v68 removeAllObjects];

          v69 = [v5 resultGradientTensors];
          v70 = [v69 objectAtIndexedSubscript:v62];
          [v70 setSharedMemoryTensor:0];
        }
        ++v62;
        unint64_t v71 = [v5 resultGradientTensors];
        unint64_t v72 = [v71 count];
      }
      while (v62 < v72);
    }
    goto LABEL_54;
  }
LABEL_59:
  [(MLCGraph *)v2 addOutputs:0];
  v87.receiver = v2;
  v87.super_class = (Class)MLCGraph;
  [(MLCGraph *)&v87 dealloc];
}

- (id)createTensorWith:(id)a3 sources:(id)a4
{
  return (id)[a3 resultTensorFromSources:a4];
}

- (id)createGradientSourceTensorWith:(id)a3 source:(id)a4
{
  if (a4)
  {
    id v4 = objc_msgSend(a4, "descriptor", a3);
    id v5 = +[MLCTensor tensorWithDescriptor:v4];
  }
  else
  {
    uint64_t v7 = +[MLCLog framework];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MLCGraph createGradientSourceTensorWith:source:](a2);
    }

    id v5 = 0;
  }

  return v5;
}

- (id)createLossGradientSourceTensorWith:(id)a3 source:(id)a4 batchSize:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    v10 = [v7 descriptor];
    v11 = [v10 shape];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      unint64_t v13 = 0;
      do
      {
        uint64_t v14 = [v7 descriptor];
        uint64_t v15 = [v14 shape];
        uint64_t v16 = [v15 objectAtIndex:v13];

        if (v13) {
          id v17 = v16;
        }
        else {
          id v17 = v8;
        }
        [v9 setObject:v17 atIndexedSubscript:v13];

        ++v13;
        v18 = [v7 descriptor];
        v19 = [v18 shape];
        unint64_t v20 = [v19 count];
      }
      while (v13 < v20);
    }
    v21 = [v7 descriptor];
    v22 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v9, [v21 dataType]);

    uint64_t v23 = +[MLCTensor tensorWithDescriptor:v22];
  }
  else
  {
    uint64_t v24 = +[MLCLog framework];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MLCGraph createGradientSourceTensorWith:source:](a2);
    }

    uint64_t v23 = 0;
  }

  return v23;
}

- (void)checkAndResetTensorsAssociatedWithLayer:(id)a3 sources:(id)a4
{
  id v36 = a3;
  id v5 = a4;
  v6 = [v36 sourceTensors];
  uint64_t v7 = [v6 count];

  id v8 = [v36 sourceTensors];
  uint64_t v9 = [v8 count];

  if (!v9
    || ([v36 sourceTensors],
        v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        !v11))
  {
LABEL_6:
    if (v7) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  unint64_t v12 = 0;
  while (1)
  {
    unint64_t v13 = [v36 sourceTensors];
    uint64_t v14 = [v13 objectAtIndexedSubscript:v12];
    uint64_t v15 = [v5 objectAtIndexedSubscript:v12];

    if (v14 != v15) {
      break;
    }
    ++v12;
    uint64_t v16 = [v36 sourceTensors];
    unint64_t v17 = [v16 count];

    if (v12 >= v17) {
      goto LABEL_6;
    }
  }
  uint64_t v27 = [v36 sourceTensors];
  uint64_t v28 = [v27 count];

  if (v28)
  {
    unint64_t v29 = 0;
    do
    {
      BOOL v30 = [v36 sourceTensors];
      int v31 = [v30 objectAtIndexedSubscript:v29];
      uint64_t v32 = [v5 objectAtIndexedSubscript:v29];
      char v33 = [v31 doesShapeMatchWithTensor:v32];

      if ((v33 & 1) == 0) {
        goto LABEL_7;
      }
      ++v29;
      v34 = [v36 sourceTensors];
      unint64_t v35 = [v34 count];
    }
    while (v29 < v35);
  }
  if (!v7)
  {
LABEL_7:
    if ([v36 isUpdatable])
    {
      v18 = [v36 sourceTensors];
      uint64_t v19 = [v18 count];

      if (v19)
      {
        unint64_t v20 = [v36 device];
        v21 = [v20 computeEngine];
        [v21 synchronizeUpdatesForLayer:v36];
      }
    }
    v22 = [v36 sourceTensors];
    [v22 removeAllObjects];

    uint64_t v23 = [v36 resultTensors];
    [v23 removeAllObjects];

    uint64_t v24 = [v36 sourceGradientTensors];
    [v24 removeAllObjects];

    uint64_t v25 = [v36 resultGradientTensors];
    [v25 removeAllObjects];

    uint64_t v26 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    [v36 setDeviceOps:v26];
    goto LABEL_11;
  }
  uint64_t v26 = [v36 sourceTensors];
  [v26 removeAllObjects];
LABEL_11:

LABEL_12:
}

- (void)linkSourceTensorsWithLayer:(id)a3 sources:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(MLCGraph *)self nextLayerID];
  [(MLCGraph *)self setNextLayerID:v8 + 1];
  [v6 assignLayerID:v8];
  uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  v10 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v11 = [(MLCGraph *)self layerChildMap];
  unint64_t v12 = [v6 label];
  [v11 setObject:v10 forKeyedSubscript:v12];

  unint64_t v13 = (void *)[v9 mutableCopy];
  uint64_t v14 = [(MLCGraph *)self layerParentMap];
  uint64_t v15 = [v6 label];
  [v14 setObject:v13 forKeyedSubscript:v15];

  uint64_t v16 = [v6 sourceTensors];
  uint64_t v39 = [v16 count];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v7;
  uint64_t v40 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v40)
  {
    uint64_t v38 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v47 != v38) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v19 = [v18 childLayers];
        [v19 addObject:v6];

        if (!v39)
        {
          unint64_t v20 = [v6 sourceTensors];
          [v20 addObject:v18];
        }
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        uint64_t v41 = v18;
        v21 = [v18 parentLayers];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v43 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void **)(*((void *)&v42 + 1) + 8 * j);
              layerParentMap = self->_layerParentMap;
              uint64_t v28 = [v6 label];
              unint64_t v29 = [(NSMutableDictionary *)layerParentMap objectForKeyedSubscript:v28];

              BOOL v30 = [v26 label];
              [v29 addObject:v30];

              layerChildMap = self->_layerChildMap;
              uint64_t v32 = [v26 label];
              char v33 = [(NSMutableDictionary *)layerChildMap objectForKeyedSubscript:v32];

              v34 = [v6 label];
              [v33 addObject:v34];
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v23);
        }

        unint64_t v35 = [v41 parentLayers];
        uint64_t v36 = [v35 count];

        if (!v36) {
          [(NSMutableArray *)self->_rootLevelTensorNodes addObject:v41];
        }
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v40);
  }
}

- (BOOL)checksBeforeAddLayerInGraph:(id)a3 sources:(id)a4 forTraining:(BOOL)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v9 resultTensors];
  uint64_t v12 = [v11 count];

  if (v12
    && ([(MLCGraph *)self graphLayerList],
        unint64_t v13 = objc_claimAutoreleasedReturnValue(),
        BOOL v14 = [(MLCGraph *)self isLayerInGraphLayerList:v9 graphLayerList:v13], v13, v14))
  {
    uint64_t v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCGraph checksBeforeAddLayerInGraph:sources:forTraining:].cold.4();
    }
  }
  else if ([v9 layerID])
  {
    uint64_t v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCGraph checksBeforeAddLayerInGraph:sources:forTraining:]();
    }
  }
  else if ([v10 count])
  {
    if ([v9 isSupportedShapeForTensorSources:v10])
    {
      if (a5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        BOOL v16 = 1;
        goto LABEL_9;
      }
      uint64_t v15 = +[MLCLog framework];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[MLCGraph checksBeforeAddLayerInGraph:sources:forTraining:](a2);
      }
    }
    else
    {
      uint64_t v15 = +[MLCLog framework];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v18 = NSStringFromSelector(a2);
        int v19 = 138412802;
        unint64_t v20 = v18;
        __int16 v21 = 2112;
        id v22 = v9;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_error_impl(&dword_1DD0C9000, v15, OS_LOG_TYPE_ERROR, "%@: layer (%@) does not support tensor shape used by sources (%@)", (uint8_t *)&v19, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCGraph checksBeforeAddLayerInGraph:sources:forTraining:]();
    }
  }

  BOOL v16 = 0;
LABEL_9:

  return v16;
}

- (NSArray)splitWithSource:(MLCTensor *)source splitCount:(NSUInteger)splitCount dimension:(NSUInteger)dimension
{
  unint64_t v8 = source;
  id v9 = +[MLCSplitLayer layerWithSplitCount:splitCount dimension:dimension];
  unint64_t v29 = v8;
  id v10 = [(MLCGraph *)self nodeWithMultiOutputLayer:v9 source:v8 forTraining:1];
  if (v10)
  {
    uint64_t v11 = [v9 sourceGradientTensors];
    uint64_t v12 = [v11 count];

    if (!v12)
    {
      if ([v10 count])
      {
        unint64_t v13 = 0;
        uint64_t v14 = 0;
        do
        {
          uint64_t v15 = [v10 objectAtIndexedSubscript:v13];
          BOOL v16 = [(MLCGraph *)self createGradientSourceTensorWith:v9 source:v15];
          unint64_t v17 = [v9 sourceGradientTensors];
          [v17 setObject:v16 atIndexedSubscript:v13];

          v18 = [v9 sourceGradientTensors];
          int v19 = [v18 objectAtIndexedSubscript:v13];
          [v19 setSplitOffset:v14];

          uint64_t v20 = [v9 dimension];
          __int16 v21 = [v9 sourceGradientTensors];
          id v22 = [v21 objectAtIndexedSubscript:v13];
          [v22 setSplitDimension:v20];

          __int16 v23 = [v9 sourceGradientTensors];
          id v24 = [v23 objectAtIndexedSubscript:v13];
          uint64_t v25 = [v24 descriptor];
          uint64_t v26 = [v25 shape];
          uint64_t v27 = objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v9, "dimension"));
          v14 += [v27 unsignedIntegerValue];

          ++v13;
        }
        while (v13 < [v10 count]);
      }
    }
  }

  return (NSArray *)v10;
}

- (NSArray)splitWithSource:(MLCTensor *)source splitSectionLengths:(NSArray *)splitSectionLengths dimension:(NSUInteger)dimension
{
  unint64_t v8 = source;
  id v9 = +[MLCSplitLayer layerWithSplitSectionLengths:splitSectionLengths dimension:dimension];
  unint64_t v29 = v8;
  id v10 = [(MLCGraph *)self nodeWithMultiOutputLayer:v9 source:v8 forTraining:1];
  if (v10)
  {
    uint64_t v11 = [v9 sourceGradientTensors];
    uint64_t v12 = [v11 count];

    if (!v12)
    {
      if ([v10 count])
      {
        unint64_t v13 = 0;
        uint64_t v14 = 0;
        do
        {
          uint64_t v15 = [v10 objectAtIndexedSubscript:v13];
          BOOL v16 = [(MLCGraph *)self createGradientSourceTensorWith:v9 source:v15];
          unint64_t v17 = [v9 sourceGradientTensors];
          [v17 setObject:v16 atIndexedSubscript:v13];

          v18 = [v9 sourceGradientTensors];
          int v19 = [v18 objectAtIndexedSubscript:v13];
          [v19 setSplitOffset:v14];

          uint64_t v20 = [v9 dimension];
          __int16 v21 = [v9 sourceGradientTensors];
          id v22 = [v21 objectAtIndexedSubscript:v13];
          [v22 setSplitDimension:v20];

          __int16 v23 = [v9 sourceGradientTensors];
          id v24 = [v23 objectAtIndexedSubscript:v13];
          uint64_t v25 = [v24 descriptor];
          uint64_t v26 = [v25 shape];
          uint64_t v27 = objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v9, "dimension"));
          v14 += [v27 unsignedIntegerValue];

          ++v13;
        }
        while (v13 < [v10 count]);
      }
    }
  }

  return (NSArray *)v10;
}

- (MLCTensor)concatenateWithSources:(NSArray *)sources dimension:(NSUInteger)dimension
{
  id v7 = sources;
  if ([(NSArray *)v7 count])
  {
    if (dimension <= 3)
    {
      if (![(NSArray *)v7 count])
      {
LABEL_11:
        uint64_t v11 = +[MLCConcatenationLayer layerWithDimension:dimension];
        uint64_t v12 = [(MLCGraph *)self nodeWithLayer:v11 sources:v7];

        goto LABEL_15;
      }
      uint64_t v9 = 0;
      while (1)
      {
        id v10 = [(NSArray *)v7 objectAtIndexedSubscript:v9];

        if (!v10) {
          break;
        }
        if (++v9 >= [(NSArray *)v7 count]) {
          goto LABEL_11;
        }
      }
      unint64_t v8 = +[MLCLog framework];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MLCGraph createGradientSourceTensorWith:source:](a2);
      }
    }
    else
    {
      unint64_t v8 = +[MLCLog framework];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MLCGraph concatenateWithSources:dimension:](a2);
      }
    }
  }
  else
  {
    unint64_t v8 = +[MLCLog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MLCGraph concatenateWithSources:dimension:](a2);
    }
  }

  uint64_t v12 = 0;
LABEL_15:

  return (MLCTensor *)v12;
}

- (MLCTensor)reshapeWithShape:(NSArray *)shape source:(MLCTensor *)source
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = source;
  id v7 = +[MLCReshapeLayer layerWithShape:shape];
  v11[0] = v6;
  unint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  uint64_t v9 = [(MLCGraph *)self nodeWithLayer:v7 sources:v8];

  return (MLCTensor *)v9;
}

- (MLCTensor)transposeWithDimensions:(NSArray *)dimensions source:(MLCTensor *)source
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = source;
  id v7 = +[MLCTransposeLayer layerWithDimensions:dimensions];
  v11[0] = v6;
  unint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  uint64_t v9 = [(MLCGraph *)self nodeWithLayer:v7 sources:v8];

  return (MLCTensor *)v9;
}

- (MLCTensor)selectWithSources:(NSArray *)sources condition:(MLCTensor *)condition
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v7 = sources;
  unint64_t v8 = condition;
  if ([(NSArray *)v7 count] == 2)
  {
    uint64_t v9 = +[MLCSelectionLayer layer];
    id v10 = -[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 0, v8);
    v15[1] = v10;
    uint64_t v11 = [(NSArray *)v7 objectAtIndexedSubscript:1];
    v15[2] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
    unint64_t v13 = [(MLCGraph *)self nodeWithLayer:v9 sources:v12];
  }
  else
  {
    uint64_t v9 = +[MLCLog framework];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MLCGraph selectWithSources:condition:](a2);
    }
    unint64_t v13 = 0;
  }

  return (MLCTensor *)v13;
}

- (MLCTensor)scatterWithDimension:(NSUInteger)dimension source:(MLCTensor *)source indices:(MLCTensor *)indices copyFrom:(MLCTensor *)copyFrom reductionType:(MLCReductionType)reductionType
{
  uint64_t v7 = *(void *)&reductionType;
  v19[3] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = copyFrom;
  unint64_t v13 = indices;
  uint64_t v14 = source;
  uint64_t v15 = +[MLCScatterLayer layerWithDimension:dimension reductionType:v7];
  v19[0] = v14;
  v19[1] = v13;
  v19[2] = v12;
  BOOL v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];

  unint64_t v17 = [(MLCGraph *)self nodeWithLayer:v15 sources:v16];

  return (MLCTensor *)v17;
}

- (MLCTensor)gatherWithDimension:(NSUInteger)dimension source:(MLCTensor *)source indices:(MLCTensor *)indices
{
  v14[2] = *MEMORY[0x1E4F143B8];
  unint64_t v8 = indices;
  uint64_t v9 = source;
  id v10 = +[MLCGatherLayer layerWithDimension:dimension];
  v14[0] = v9;
  v14[1] = v8;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];

  uint64_t v12 = [(MLCGraph *)self nodeWithLayer:v10 sources:v11];

  return (MLCTensor *)v12;
}

- (MLCTensor)nodeWithLayer:(MLCLayer *)layer source:(MLCTensor *)source
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = source;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v7 = source;
  unint64_t v8 = layer;
  uint64_t v9 = [v6 arrayWithObjects:&v12 count:1];

  id v10 = -[MLCGraph nodeWithLayer:sources:disableUpdate:](self, "nodeWithLayer:sources:disableUpdate:", v8, v9, 0, v12, v13);

  return (MLCTensor *)v10;
}

- (MLCTensor)nodeWithLayer:(MLCLayer *)layer sources:(NSArray *)sources lossLabels:(NSArray *)lossLabels
{
  unint64_t v8 = layer;
  uint64_t v9 = sources;
  id v10 = lossLabels;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = v8;
    uint64_t v12 = [(NSArray *)v10 objectAtIndexedSubscript:0];
    [(MLCLayer *)v11 setLossLabels:v12];

    uint64_t v13 = [(MLCGraph *)self nodeWithLayer:v11 sources:v9];
  }
  else
  {
    uint64_t v14 = +[MLCLog framework];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MLCGraph nodeWithLayer:sources:lossLabels:]();
    }

    uint64_t v13 = 0;
  }

  return (MLCTensor *)v13;
}

- (MLCTensor)nodeWithLayer:(MLCLayer *)layer sources:(NSArray *)sources
{
  return [(MLCGraph *)self nodeWithLayer:layer sources:sources disableUpdate:0];
}

- (MLCTensor)nodeWithLayer:(MLCLayer *)layer sources:(NSArray *)sources disableUpdate:(BOOL)disableUpdate
{
  BOOL v5 = disableUpdate;
  unint64_t v8 = layer;
  uint64_t v9 = [(MLCGraph *)self nodeWithLayer:v8 sources:sources forTraining:1];
  if (v9)
  {
    [(MLCLayer *)v8 setDisableUpdate:v5];
    if ([(MLCLayer *)v8 isUpdatable]) {
      [(MLCLayer *)v8 setIsUpdatable:[(MLCLayer *)v8 disableUpdate] ^ 1];
    }
    id v10 = [(MLCLayer *)v8 sourceGradientTensors];
    uint64_t v11 = [v10 count];

    if (!v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [v9 descriptor];
        uint64_t v13 = [v12 shape];
        uint64_t v14 = [v13 objectAtIndexedSubscript:0];
        uint64_t v15 = [(MLCGraph *)self createLossGradientSourceTensorWith:v8 source:v9 batchSize:v14];
        BOOL v16 = [(MLCLayer *)v8 sourceGradientTensors];
        [v16 setObject:v15 atIndexedSubscript:0];
      }
      else
      {
        uint64_t v12 = [(MLCGraph *)self createGradientSourceTensorWith:v8 source:v9];
        uint64_t v13 = [(MLCLayer *)v8 sourceGradientTensors];
        [v13 setObject:v12 atIndexedSubscript:0];
      }
    }
  }

  return (MLCTensor *)v9;
}

- (id)nodeWithLayer:(id)a3 sources:(id)a4 forTraining:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([(MLCGraph *)self checksBeforeAddLayerInGraph:v8 sources:v9 forTraining:v5])
  {
    [(MLCGraph *)self checkAndResetTensorsAssociatedWithLayer:v8 sources:v9];
    [(MLCGraph *)self linkSourceTensorsWithLayer:v8 sources:v9];
    [v8 linkAssociatedTensors];
    id v10 = [v8 resultTensors];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      uint64_t v12 = [v8 resultTensors];
      uint64_t v13 = [v12 objectAtIndexedSubscript:0];
    }
    else
    {
      uint64_t v13 = [(MLCGraph *)self createTensorWith:v8 sources:v9];
      uint64_t v12 = [v8 resultTensors];
      [v12 addObject:v13];
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v8;
      uint64_t v15 = [v14 descriptor];
      char v16 = [v15 resultMode];

      if (v16)
      {
        unint64_t v17 = [v14 resultTensors];
        uint64_t v18 = [v17 count];

        if (v18 == 1)
        {
          int v19 = [v14 resultStateTensorWithSources:v9];
          uint64_t v20 = [v14 resultTensors];
          __int16 v21 = [v19 objectAtIndexedSubscript:0];
          [v20 addObject:v21];

          id v22 = [v14 resultTensors];
          __int16 v23 = [v19 objectAtIndexedSubscript:1];
          [v22 addObject:v23];

          id v24 = [v19 objectAtIndexedSubscript:0];
          uint64_t v25 = [v24 parentLayers];
          [v25 addObject:v14];

          uint64_t v26 = [v19 objectAtIndexedSubscript:1];
          uint64_t v27 = [v26 parentLayers];
          [v27 addObject:v14];

          uint64_t v28 = [v14 resultStateTensorWithSources:v9];
          unint64_t v29 = [(MLCGraph *)self createGradientSourceTensorWith:v14 source:v13];
          BOOL v30 = [v14 sourceGradientTensors];
          [v30 setObject:v29 atIndexedSubscript:0];

          int v31 = [v14 sourceGradientTensors];
          uint64_t v32 = [v28 objectAtIndexedSubscript:0];
          [v31 addObject:v32];

          char v33 = [v14 sourceGradientTensors];
          v34 = [v28 objectAtIndexedSubscript:1];
          [v33 addObject:v34];
        }
        else
        {
          unint64_t v35 = [v14 resultTensors];
          uint64_t v36 = [v35 objectAtIndexedSubscript:1];
          v37 = [v36 parentLayers];
          [v37 addObject:v14];

          int v19 = [v14 resultTensors];
          uint64_t v28 = [v19 objectAtIndexedSubscript:2];
          char v33 = [v28 parentLayers];
          [v33 addObject:v14];
        }
      }
    }
    if (v13)
    {
      uint64_t v38 = [v13 parentLayers];
      [v38 addObject:v8];

      uint64_t v39 = [(MLCGraph *)self graphLayerList];
      [v39 addObject:v8];

      if ([(MLCGraph *)self staticBatchSizeInGraph]) {
        uint64_t v40 = [v8 isStaticBatchSize];
      }
      else {
        uint64_t v40 = 0;
      }
      [(MLCGraph *)self setStaticBatchSizeInGraph:v40];
      id v42 = v13;
    }
    else
    {
      uint64_t v41 = +[MLCLog framework];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[MLCGraph nodeWithLayer:sources:forTraining:]();
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)nodeWithMultiOutputLayer:(id)a3 source:(id)a4 forTraining:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v104 = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:1];
    BOOL v12 = [(MLCGraph *)self checksBeforeAddLayerInGraph:v9 sources:v11 forTraining:v5];

    if (!v12)
    {
      v60 = 0;
      goto LABEL_22;
    }
    id v103 = v10;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
    [(MLCGraph *)self checkAndResetTensorsAssociatedWithLayer:v9 sources:v13];

    id v102 = v10;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
    [(MLCGraph *)self linkSourceTensorsWithLayer:v9 sources:v14];

    id v99 = v9;
    uint64_t v15 = v9;
    uint64_t v16 = [v15 dimension];
    unint64_t v17 = [v10 descriptor];
    uint64_t v18 = [v17 shape];
    uint64_t v101 = v16;
    int v19 = [v18 objectAtIndexedSubscript:v16];
    unint64_t v20 = [v19 unsignedIntegerValue];

    __int16 v21 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    id v22 = [v10 descriptor];
    __int16 v23 = [v22 shape];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      unint64_t v25 = 0;
      do
      {
        uint64_t v26 = [v10 descriptor];
        uint64_t v27 = [v26 shape];
        uint64_t v28 = [v27 objectAtIndexedSubscript:v25];
        [v21 setObject:v28 atIndexedSubscript:v25];

        ++v25;
        unint64_t v29 = [v10 descriptor];
        BOOL v30 = [v29 shape];
        unint64_t v31 = [v30 count];
      }
      while (v25 < v31);
    }
    uint64_t v32 = [v15 resultTensors];
    uint64_t v33 = [v32 count];

    long long v98 = self;
    if (v33)
    {
      v34 = [v15 resultTensors];
      uint64_t v35 = [v34 count];

      if (v35)
      {
        unint64_t v36 = 0;
        do
        {
          v37 = [v15 resultTensors];
          uint64_t v38 = [v37 objectAtIndexedSubscript:v36];
          uint64_t v39 = [v38 parentLayers];
          [v39 addObject:v15];

          ++v36;
          uint64_t v40 = [v15 resultTensors];
          unint64_t v41 = [v40 count];
        }
        while (v36 < v41);
      }
    }
    else
    {
      unint64_t v62 = [v15 splitSectionLengths];

      if (v62)
      {
        v63 = [v15 splitSectionLengths];
        uint64_t v64 = [v63 count];

        if (v64)
        {
          unint64_t v65 = 0;
          unint64_t v66 = 0x1E6CB4000uLL;
          unint64_t v67 = 0x1E6CB4000uLL;
          id v96 = v10;
          long long v97 = v21;
          do
          {
            v68 = [v15 splitSectionLengths];
            v69 = [v68 objectAtIndexedSubscript:v65];
            [v21 setObject:v69 atIndexedSubscript:v101];

            v70 = *(void **)(v66 + 1448);
            unint64_t v71 = [v10 descriptor];
            uint64_t v72 = objc_msgSend(v70, "descriptorWithShape:dataType:", v21, objc_msgSend(v71, "dataType"));

            v100 = (void *)v72;
            v73 = [*(id *)(v67 + 1432) tensorWithDescriptor:v72];
            v74 = [v73 parentLayers];
            [v74 addObject:v15];

            int v75 = [v15 resultTensors];
            [v75 addObject:v73];

            long long v76 = [v15 splitSectionLengths];
            long long v77 = [v76 objectAtIndexedSubscript:v65];
            if (v20 <= [v77 unsignedIntegerValue])
            {
              unint64_t v20 = 0;
            }
            else
            {
              long long v78 = [v15 splitSectionLengths];
              [v78 objectAtIndexedSubscript:v65];
              unint64_t v79 = v67;
              v81 = unint64_t v80 = v66;
              v20 -= [v81 unsignedIntegerValue];

              unint64_t v66 = v80;
              unint64_t v67 = v79;
              id v10 = v96;

              __int16 v21 = v97;
            }

            if (!v20) {
              break;
            }
            ++v65;
            long long v82 = [v15 splitSectionLengths];
            unint64_t v83 = [v82 count];
          }
          while (v65 < v83);
        }
      }
      else
      {
        unint64_t v84 = [v15 splitCount];
        if (v84)
        {
          unint64_t v85 = v84;
          unint64_t v86 = (v20 + v84 - 1) / v84;
          do
          {
            if (v20 >= v86) {
              unint64_t v87 = v86;
            }
            else {
              unint64_t v87 = v20;
            }
            long long v88 = [NSNumber numberWithUnsignedInteger:v87];
            [v21 replaceObjectAtIndex:v101 withObject:v88];
            unint64_t v89 = v20;
            long long v90 = [v10 descriptor];
            long long v91 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v21, [v90 dataType]);

            long long v92 = +[MLCTensor tensorWithDescriptor:v91];
            long long v93 = [v92 parentLayers];
            [v93 addObject:v15];

            long long v94 = [v15 resultTensors];
            [v94 addObject:v92];

            if (v89 <= v86) {
              break;
            }
            unint64_t v20 = v89 >= v86 ? v89 - v86 : 0;
            --v85;
          }
          while (v85);
        }
      }
    }
    id v42 = [v15 resultTensors];
    uint64_t v43 = [v42 count];

    if (v43)
    {
      unint64_t v44 = 0;
      uint64_t v45 = 0;
      do
      {
        long long v46 = [v15 resultTensors];
        long long v47 = [v46 objectAtIndexedSubscript:v44];
        [v47 setSplitOffset:v45];

        uint64_t v48 = [v15 dimension];
        long long v49 = [v15 resultTensors];
        v50 = [v49 objectAtIndexedSubscript:v44];
        [v50 setSplitDimension:v48];

        v51 = [v15 resultTensors];
        uint64_t v52 = [v51 objectAtIndexedSubscript:v44];
        uint64_t v53 = [v52 descriptor];
        uint64_t v54 = [v53 shape];
        uint64_t v55 = objc_msgSend(v54, "objectAtIndexedSubscript:", -[NSObject dimension](v15, "dimension"));
        v45 += [v55 unsignedIntegerValue];

        ++v44;
        v56 = [v15 resultTensors];
        unint64_t v57 = [v56 count];
      }
      while (v44 < v57);
    }
    uint64_t v58 = [(MLCGraph *)v98 graphLayerList];
    [v58 addObject:v15];

    if ([(MLCGraph *)v98 staticBatchSizeInGraph]) {
      uint64_t v59 = [v15 isStaticBatchSize];
    }
    else {
      uint64_t v59 = 0;
    }
    id v9 = v99;
    [(MLCGraph *)v98 setStaticBatchSizeInGraph:v59];
    v60 = [v15 resultTensors];
  }
  else
  {
    uint64_t v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v95 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v106 = v95;
      __int16 v107 = 2112;
      id v108 = v9;
      __int16 v109 = 2112;
      id v110 = v10;
      _os_log_error_impl(&dword_1DD0C9000, v15, OS_LOG_TYPE_ERROR, "%@: layer (%@) does not support multiple result tensors (%@)", buf, 0x20u);
    }
    v60 = 0;
  }

LABEL_22:

  return v60;
}

- (BOOL)bindAndWriteData:(NSDictionary *)inputsData forInputs:(NSDictionary *)inputTensors toDevice:(MLCDevice *)device batchSize:(NSUInteger)batchSize synchronous:(BOOL)synchronous
{
  return [(MLCGraph *)self bindAndWriteData:inputsData forInputs:inputTensors toDevice:device batchSize:batchSize synchronous:synchronous skipWrite:0];
}

- (BOOL)bindAndWriteData:(NSDictionary *)inputsData forInputs:(NSDictionary *)inputTensors toDevice:(MLCDevice *)device synchronous:(BOOL)synchronous
{
  return [(MLCGraph *)self bindAndWriteData:inputsData forInputs:inputTensors toDevice:device batchSize:0 synchronous:synchronous skipWrite:0];
}

- (BOOL)bindAndWriteData:(id)a3 forInputs:(id)a4 toDevice:(id)a5 batchSize:(unint64_t)a6 synchronous:(BOOL)a7 skipWrite:(BOOL)a8
{
  BOOL v69 = a7;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v79 = a3;
  id v10 = a4;
  id v72 = a5;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  obuint64_t j = v10;
  uint64_t v75 = [v10 countByEnumeratingWithState:&v89 objects:v95 count:16];
  if (v75)
  {
    uint64_t v73 = *(void *)v90;
    do
    {
      for (uint64_t i = 0; i != v75; ++i)
      {
        if (*(void *)v90 != v73) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v89 + 1) + 8 * i);
        uint64_t v13 = [obj objectForKeyedSubscript:v12];
        id v14 = [v13 childLayers];
        uint64_t v15 = [v14 count];

        if (v15)
        {
          unint64_t v16 = 0;
          while (1)
          {
            unint64_t v17 = [v13 childLayers];
            uint64_t v18 = [v17 objectAtIndexedSubscript:v16];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass) {
              break;
            }
LABEL_19:
            ++v16;
            uint64_t v32 = [v13 childLayers];
            unint64_t v33 = [v32 count];

            if (v16 >= v33) {
              goto LABEL_20;
            }
          }
          unint64_t v20 = [v13 childLayers];
          __int16 v21 = [v20 objectAtIndexedSubscript:v16];

          id v22 = [v21 sourceTensors];
          if ([v22 count] == 2)
          {

            goto LABEL_12;
          }
          __int16 v23 = [v21 sourceTensors];
          uint64_t v24 = [v23 count];

          if (v24 == 4)
          {
LABEL_12:
            unint64_t v25 = [v21 sourceTensors];
            uint64_t v26 = [v25 count];
            uint64_t v27 = [v21 sourceTensors];
            uint64_t v28 = v27;
            if (v26 == 2) {
              uint64_t v29 = 1;
            }
            else {
              uint64_t v29 = 3;
            }
            BOOL v30 = [v27 objectAtIndexedSubscript:v29];

            if (v30 == v13)
            {
              unint64_t v31 = [v79 objectForKeyedSubscript:v12];
              [(MLCGraph *)self createVariableLengthSequenceTensorsForLayer:v21 withVariableSequenceLength:v31];
            }
          }

          goto LABEL_19;
        }
LABEL_20:
      }
      uint64_t v75 = [obj countByEnumeratingWithState:&v89 objects:v95 count:16];
    }
    while (v75);
  }
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v34 = v79;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v85 objects:v94 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v86;
    uint64_t v38 = v72;
    BOOL v39 = a8;
    unint64_t v40 = a6;
    id v74 = v34;
    uint64_t v76 = *(void *)v86;
    while (2)
    {
      uint64_t v41 = 0;
      uint64_t v80 = v36;
      do
      {
        if (*(void *)v86 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v42 = *(void *)(*((void *)&v85 + 1) + 8 * v41);
        uint64_t v43 = [v34 objectForKeyedSubscript:v42];
        unint64_t v44 = [obj objectForKeyedSubscript:v42];
        if (([v44 skipWritingToDevice] & 1) == 0)
        {
          if (!v44)
          {
            unint64_t v66 = [NSString stringWithFormat:@"input name=%@ missing from inputs specified at compile time allInputs=%@", v42, obj];
            unint64_t v67 = +[MLCLog framework];
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
              -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:]();
            }

            BOOL v65 = 0;
            goto LABEL_65;
          }
          id v45 = v38;
          if ([v45 type] == 3)
          {
            long long v83 = 0u;
            long long v84 = 0u;
            long long v81 = 0u;
            long long v82 = 0u;
            long long v46 = [v44 childLayers];
            uint64_t v47 = [v46 countByEnumeratingWithState:&v81 objects:v93 count:16];
            if (v47)
            {
              uint64_t v48 = v47;
              uint64_t v49 = *(void *)v82;
              while (2)
              {
                for (uint64_t j = 0; j != v48; ++j)
                {
                  if (*(void *)v82 != v49) {
                    objc_enumerationMutation(v46);
                  }
                  v51 = *(void **)(*((void *)&v81 + 1) + 8 * j);
                  uint64_t v52 = [v51 device];

                  if (v52)
                  {
                    uint64_t v53 = [v51 device];

                    id v45 = (id)v53;
                    goto LABEL_40;
                  }
                }
                uint64_t v48 = [v46 countByEnumeratingWithState:&v81 objects:v93 count:16];
                if (v48) {
                  continue;
                }
                break;
              }
LABEL_40:
              uint64_t v38 = v72;
              BOOL v39 = a8;
              unint64_t v40 = a6;
            }

            id v34 = v74;
          }
          uint64_t v54 = [v45 computeEngine];
          char v55 = objc_opt_respondsToSelector();

          if (v55)
          {
            uint64_t v56 = v40;
            if (!v40) {
              uint64_t v56 = [v44 calculateBatchSizeToUse:0];
            }
            unint64_t v57 = [v45 computeEngine];
            [v57 selectDevicesWithBatchSize:v56 calledfromBindAndWrite:1];
          }
          if ([v45 type])
          {
            uint64_t v58 = [v45 computeEngine];
            int v59 = [v58 needToAllocateDeviceMemoryForTensor:v44];

            if (v59) {
              [v44 allocateDeviceMemory:v45];
            }
          }
          else if (([v44 isLayerParameter] & 1) == 0)
          {
            v60 = [v43 data];
            [v44 setData:v60];

            uint64_t v61 = [v44 data];
            unint64_t v62 = [v44 deviceMemory];
            [v62 setObject:v61 atIndexedSubscript:0];
          }
          if (!v39)
          {
            uint64_t v63 = [v44 calculateBatchSizeToUse:v40];
            if ([v44 isLayerParameter])
            {
              [v44 bindAndWriteData:v43 toDevice:v45];
            }
            else
            {
              uint64_t v64 = [v43 data];
              [v44 setData:v64];

              if (v69) {
                [v44 writeTensorDataToAllDevices:v45 batchSize:v63];
              }
              else {
                [v44 dispatchWriteTensorDataToAllDevices:v45 batchSize:v63];
              }
            }
          }
          [v44 setDevice:v45];

          uint64_t v37 = v76;
          uint64_t v36 = v80;
        }

        ++v41;
      }
      while (v41 != v36);
      uint64_t v36 = [v34 countByEnumeratingWithState:&v85 objects:v94 count:16];
      if (v36) {
        continue;
      }
      break;
    }
    BOOL v65 = 1;
  }
  else
  {
    BOOL v65 = 1;
    uint64_t v38 = v72;
  }
LABEL_65:

  return v65;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id v6 = [(MLCGraph *)self graphObjects];
  uint64_t v7 = [(MLCGraph *)self graphLayerList];
  id v8 = [(MLCGraph *)self allInputs];
  id v9 = [(MLCGraph *)self allOutputs];
  id v10 = [(MLCGraph *)self device];
  uint64_t v11 = [v3 stringWithFormat:@"%@: { graphObjects=%@ : graphLayerList=%@ : allInputs=%@ : allOutputs=%@ : device=%@}", v5, v6, v7, v8, v9, v10];

  return v11;
}

- (void)writeAsyncToDevice:(id)a3 dataForTensors:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  if ([v5 count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v11 computeEngine];
      id v8 = [v5 objectAtIndexedSubscript:v6];
      [v7 allocateDeviceMemoryForTensor:v8];

      id v9 = [v11 computeEngine];
      id v10 = [v5 objectAtIndexedSubscript:v6];
      [v9 broadcastTensor:v10];

      ++v6;
    }
    while (v6 < [v5 count]);
  }
}

- (void)createVariableLengthSequenceTensorsForLayer:(id)a3 withVariableSequenceLength:(id)a4
{
  id v36 = a3;
  id v5 = a4;
  unint64_t v6 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  unint64_t v7 = [v5 length];
  if (v7 >= 4)
  {
    uint64_t v8 = 0;
    unint64_t v9 = v7 >> 2;
    do
    {
      uint64_t v10 = [v5 bytes];
      id v11 = [NSNumber numberWithInt:*(unsigned int *)(v10 + 4 * v8)];
      [v6 addObject:v11];

      ++v8;
    }
    while (v9 != v8);
  }
  uint64_t v12 = [v36 sourceTensors];
  uint64_t v35 = [v12 objectAtIndexedSubscript:0];

  uint64_t v13 = [v35 descriptor];
  id v14 = [v13 shape];
  uint64_t v15 = [v35 descriptor];
  unint64_t v16 = +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](MLCTensorDescriptor, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", v14, v6, 1, [v15 dataType]);
  unint64_t v17 = [v36 sourceTensors];
  uint64_t v18 = [v17 objectAtIndexedSubscript:0];
  [v18 setDescriptor:v16];

  int v19 = [v36 resultTensors];
  unint64_t v20 = [v19 objectAtIndexedSubscript:0];

  __int16 v21 = [v20 descriptor];
  id v22 = [v21 shape];
  __int16 v23 = [v20 descriptor];
  uint64_t v24 = +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](MLCTensorDescriptor, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", v22, v6, 1, [v23 dataType]);
  unint64_t v25 = [v36 resultTensors];
  uint64_t v26 = [v25 objectAtIndexedSubscript:0];
  [v26 setDescriptor:v24];

  uint64_t v27 = [v36 sourceGradientTensors];
  uint64_t v28 = [v27 objectAtIndexedSubscript:0];

  uint64_t v29 = [v28 descriptor];
  BOOL v30 = [v29 shape];
  unint64_t v31 = [v28 descriptor];
  uint64_t v32 = +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](MLCTensorDescriptor, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", v30, v6, 1, [v31 dataType]);
  unint64_t v33 = [v36 sourceGradientTensors];
  id v34 = [v33 objectAtIndexedSubscript:0];
  [v34 setDescriptor:v32];
}

- (void)enumerateLayersUsingBlock:(id)a3
{
  unint64_t v17 = (void (**)(id, void *, void *, void *))a3;
  id v4 = [(MLCGraph *)self graphLayerList];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = [(MLCGraph *)self graphLayerList];
      uint64_t v8 = [v7 objectAtIndexedSubscript:v6];

      layerParentMap = self->_layerParentMap;
      uint64_t v10 = [v8 label];
      id v11 = [(NSMutableDictionary *)layerParentMap objectForKeyedSubscript:v10];
      layerChildMap = self->_layerChildMap;
      uint64_t v13 = [v8 label];
      id v14 = [(NSMutableDictionary *)layerChildMap objectForKeyedSubscript:v13];
      v17[2](v17, v8, v11, v14);

      ++v6;
      uint64_t v15 = [(MLCGraph *)self graphLayerList];
      unint64_t v16 = [v15 count];
    }
    while (v6 < v16);
  }
}

- (void)enumerateInputsUsingBlock:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, uint64_t, void *))a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_rootLevelTensorNodes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "descriptor", (void)v15);
        uint64_t v12 = [v10 label];
        uint64_t v13 = [v11 dataType];
        id v14 = [v11 shape];
        v4[2](v4, v12, v13, v14);
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)enumerateOutputsUsingBlock:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, uint64_t, void *))a3;
  uint64_t v5 = [(MLCGraph *)self graphLayerList];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v24 = self;
    do
    {
      uint64_t v8 = [(MLCGraph *)self graphLayerList];
      uint64_t v26 = v7;
      unint64_t v9 = [v8 objectAtIndexedSubscript:v7];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      unint64_t v25 = v9;
      uint64_t v10 = [v9 resultTensors];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v28 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            long long v16 = [v15 childLayers];
            uint64_t v17 = [v16 count];

            if (!v17)
            {
              long long v18 = [v15 descriptor];
              int v19 = [v15 label];
              uint64_t v20 = [v18 dataType];
              __int16 v21 = [v18 shape];
              v4[2](v4, v19, v20, v21);
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v12);
      }

      uint64_t v7 = v26 + 1;
      self = v24;
      id v22 = [(MLCGraph *)v24 graphLayerList];
      unint64_t v23 = [v22 count];
    }
    while (v26 + 1 < v23);
  }
}

- (BOOL)isLayerInGraphLayerList:(id)a3 graphLayerList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [v6 objectAtIndexedSubscript:v7];

      BOOL v9 = v8 == v5;
      if (v9) {
        break;
      }
      ++v7;
    }
    while (v7 < [v6 count]);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSArray)resultTensorsForLayer:(MLCLayer *)layer
{
  id v4 = layer;
  uint64_t v5 = [(MLCLayer *)v4 isDebuggingEnabled];
  [(MLCLayer *)v4 setIsDebuggingEnabled:0 isPrivate:1];
  id v6 = [(MLCGraph *)self graphLayerList];
  unint64_t v7 = [(MLCGraph *)self resultTensorsForLayer:v4 graphLayerList:v6];

  [(MLCLayer *)v4 setIsDebuggingEnabled:v5 isPrivate:1];

  return (NSArray *)v7;
}

- (NSArray)sourceTensorsForLayer:(MLCLayer *)layer
{
  id v4 = layer;
  uint64_t v5 = [(MLCGraph *)self graphLayerList];
  id v6 = [(MLCGraph *)self sourceTensorsForLayer:v4 graphLayerList:v5];

  return (NSArray *)v6;
}

- (id)resultTensorsForLayer:(id)a3 graphLayerList:(id)a4
{
  id v6 = a3;
  if (![(MLCGraph *)self isLayerInGraphLayerList:v6 graphLayerList:a4])
  {
    long long v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph resultGradientTensorsForLayer:summedGradientForInputTensors:]();
    }
    goto LABEL_13;
  }
  if ([v6 skipLayer] && (objc_msgSend(v6, "isLastFusedLayer") & 1) == 0)
  {
    long long v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCGraph resultTensorsForLayer:graphLayerList:]();
    }
LABEL_13:

    id v14 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_14;
  }
  if ([v6 isDebuggingEnabled])
  {
    unint64_t v7 = [v6 resultTensors];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      unint64_t v9 = 0;
      do
      {
        uint64_t v10 = [v6 resultTensors];
        uint64_t v11 = [v10 objectAtIndexedSubscript:v9];
        [v11 synchronizeData];

        ++v9;
        uint64_t v12 = [v6 resultTensors];
        unint64_t v13 = [v12 count];
      }
      while (v9 < v13);
    }
  }
  id v14 = [v6 resultTensors];
LABEL_14:

  return v14;
}

- (id)sourceTensorsForLayer:(id)a3 graphLayerList:(id)a4
{
  id v6 = a3;
  if ([(MLCGraph *)self isLayerInGraphLayerList:v6 graphLayerList:a4])
  {
    unint64_t v7 = [v6 sourceTensors];
  }
  else
  {
    uint64_t v8 = +[MLCLog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph resultGradientTensorsForLayer:summedGradientForInputTensors:]();
    }

    unint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (void)flattenConditionalLayer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 sourceTensors];
  id v6 = [v5 objectAtIndexedSubscript:0];

  unint64_t v7 = +[MLCControlTreeNode controlTreeNodeWithPredicate:v6 needToNegate:0];
  uint64_t v8 = [v4 trueBranch];
  [(MLCGraph *)self addGraphNodes:v8 withControlTreeNode:v7];

  id v10 = +[MLCControlTreeNode controlTreeNodeWithPredicate:v6 needToNegate:1];

  unint64_t v9 = [v4 falseBranch];
  [(MLCGraph *)self addGraphNodes:v9 withControlTreeNode:v10];

  [(MLCGraph *)self insertPhis:v4];
}

- (void)addGraphNodes:(id)a3 withControlTreeNode:(id)a4
{
  *(void *)&v23[20] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 graphLayerList];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v20 = v23;
    do
    {
      uint64_t v11 = objc_msgSend(v6, "graphLayerList", v20);
      uint64_t v12 = [v11 objectAtIndexedSubscript:v10];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v14 = +[MLCLog framework];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          [(MLCGraph *)v22 addGraphNodes:v20 withControlTreeNode:v14];
        }
      }
      long long v15 = [v6 graphLayerList];
      long long v16 = [v15 objectAtIndexedSubscript:v10];
      [v16 setConditionalTreeNode:v7];

      uint64_t v17 = [(MLCGraph *)self graphLayerList];
      long long v18 = [v6 graphLayerList];
      int v19 = [v18 objectAtIndexedSubscript:v10];
      [v17 addObject:v19];

      ++v10;
    }
    while (v9 != v10);
  }
}

- (void)insertPhis:(id)a3
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 trueBranch];
  id v6 = [v4 falseBranch];
  id v7 = [v5 graphLayerList];
  uint64_t v8 = [v7 count];

  uint64_t v9 = [v6 graphLayerList];
  uint64_t v10 = [v9 count];

  uint64_t v11 = [v4 sourceTensors];
  uint64_t v12 = [v11 objectAtIndexedSubscript:0];
  unint64_t v13 = v4;
  uint64_t v37 = +[MLCControlTreeNode controlTreeNodeWithPredicate:v12 needToNegate:0];

  id v14 = [v4 resultTensors];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    uint64_t v16 = 0;
    uint64_t v33 = v10 - 1;
    uint64_t v34 = v8 - 1;
    uint64_t v35 = self;
    id v36 = v5;
    do
    {
      uint64_t v17 = objc_msgSend(v5, "graphLayerList", v33);
      long long v18 = [v17 objectAtIndexedSubscript:v34];
      int v19 = [v18 resultTensors];
      uint64_t v20 = [v19 objectAtIndexedSubscript:0];

      __int16 v21 = [v6 graphLayerList];
      id v22 = [v21 objectAtIndexedSubscript:v33];
      [v22 resultTensors];
      v24 = uint64_t v23 = v15;
      unint64_t v25 = [v24 objectAtIndexedSubscript:0];

      v38[0] = v20;
      v38[1] = v25;
      uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
      long long v27 = [v13 resultTensors];
      [v27 objectAtIndexedSubscript:v16];
      long long v28 = v6;
      v30 = long long v29 = v13;
      unint64_t v31 = +[MLCPhiLayer layerWithControlTreeNode:v37 sources:v26 resultTensor:v30];

      unint64_t v13 = v29;
      id v6 = v28;

      uint64_t v32 = [(MLCGraph *)v35 graphLayerList];
      [v32 addObject:v31];

      uint64_t v5 = v36;
      uint64_t v15 = v23;

      ++v16;
    }
    while (v23 != v16);
  }
}

- (id)conditionalWithPredicate:(id)a3 trueBranch:(id)a4 falseBranch:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = +[MLCConditionalLayer layerWithTrueBranch:v10 falseBranch:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    unint64_t v13 = +[MLCLog framework];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MLCGraph conditionalWithPredicate:trueBranch:falseBranch:](a2);
    }
  }
  id v14 = [v10 allOutputs];
  if ([v14 count])
  {
  }
  else
  {
    uint64_t v15 = [v11 allOutputs];
    uint64_t v16 = [v15 count];

    if (!v16) {
      goto LABEL_12;
    }
  }
  uint64_t v17 = +[MLCLog framework];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[MLCGraph conditionalWithPredicate:trueBranch:falseBranch:](a2);
  }

LABEL_12:
  long long v18 = [(MLCGraph *)self nodeWithLayer:v12 source:v9];
  v21[0] = v18;
  int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

  return v19;
}

- (NSArray)layers
{
  v2 = [(MLCGraph *)self graphLayerList];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (BOOL)checkPageAlignmentAndSizeForOutputs:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MLCGraph *)self device];
  int v6 = [v5 type];

  if (v6 == 1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(v7, "objectForKeyedSubscript:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
          NSUInteger v13 = [v12 length];
          if (NSRoundUpToMultipleOfPageSize(v13) != v13)
          {

LABEL_15:
            BOOL v16 = 0;
            goto LABEL_16;
          }
          uint64_t v14 = [v12 bytes];
          NSUInteger v15 = (NSPageSize() - 1) & v14;

          if (v15) {
            goto LABEL_15;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        BOOL v16 = 1;
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v16 = 1;
    }
LABEL_16:
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (void)updateOutputTensorsDeviceMemoryWithData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v4, "objectForKeyedSubscript:", v9, (void)v16);
        id v11 = [(MLCGraph *)self allOutputs];
        uint64_t v12 = [v11 objectForKeyedSubscript:v9];

        NSUInteger v13 = [v12 device];
        uint64_t v14 = (void *)MEMORY[0x1E01B11E0]();
        NSUInteger v15 = [v13 computeEngine];
        [v15 setDeviceMemoryForTensor:v12 data:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (BOOL)addInputs:(id)a3 lossLabels:(id)a4
{
  return [(MLCGraph *)self addInputs:a3 lossLabels:a4 lossLabelWeights:0];
}

- (BOOL)addInputs:(id)a3 lossLabels:(id)a4 lossLabelWeights:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(MLCGraph *)self setAllInputs:a3];
  [(MLCGraph *)self setAllLossLabels:v9];

  [(MLCGraph *)self setAllLossLabelWeights:v8];
  return 1;
}

- (BOOL)addOutputs:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v5 = [(MLCGraph *)self allOutputs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        id v11 = [(MLCGraph *)self allOutputs];
        uint64_t v12 = [v11 objectForKeyedSubscript:v10];

        objc_msgSend(v12, "setComputeFlags:", objc_msgSend(v12, "computeFlags") & 0xFFFFFFFELL);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v7);
  }

  if (!v4) {
    goto LABEL_24;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (!v14) {
    goto LABEL_23;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v31;
  while (2)
  {
    for (uint64_t j = 0; j != v15; ++j)
    {
      if (*(void *)v31 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8 * j);
      long long v19 = [v13 objectForKeyedSubscript:v18];
      if (!v19)
      {
        long long v27 = [NSString stringWithFormat:@"name=%@ in outputs=%@ specifies a nil tensor, outputs=", v18, v13];
        long long v28 = +[MLCLog framework];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:]();
        }

        BOOL v26 = 0;
        goto LABEL_28;
      }
      long long v20 = v19;
      if (([v19 computeFlags] & 1) == 0)
      {
        uint64_t v21 = [v20 parentLayers];
        if ([v21 count])
        {
        }
        else
        {
          id v22 = [v20 childLayers];
          uint64_t v23 = [v22 count];

          if (!v23) {
            goto LABEL_21;
          }
        }
        uint64_t v24 = [v20 sharedMemoryTensor];

        if (v24)
        {
          [v20 setSharedMemoryTensor:0];
          unint64_t v25 = [v20 deviceMemory];
          [v25 removeAllObjects];
        }
      }
LABEL_21:
      objc_msgSend(v20, "setComputeFlags:", objc_msgSend(v20, "computeFlags") | 1);
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v15) {
      continue;
    }
    break;
  }
LABEL_23:

LABEL_24:
  [(MLCGraph *)self setAllOutputs:v4];
  BOOL v26 = 1;
LABEL_28:

  return v26;
}

- (BOOL)dispatchReadsForMultipleTensorOutputs:(id)a3 finalTensorInGraph:(id)a4 finalResultTensor:(id)a5 batchSize:(unint64_t)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v34 = a5;
  if (v9)
  {
    long long v44 = 0uLL;
    long long v45 = 0uLL;
    long long v42 = 0uLL;
    long long v43 = 0uLL;
    uint64_t v11 = [v9 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v35 = *(void *)v43;
      long long v36 = v9;
      id v13 = self;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v9, "objectForKeyedSubscript:", v15, v34);
          long long v17 = [(MLCGraph *)self allOutputs];
          id v18 = [v17 objectForKeyedSubscript:v15];

          long long v19 = [v18 device];
          if (v10 && v18 == v10)
          {
            id v18 = v34;
          }
          uint64_t v20 = [v18 calculateBatchSizeToUse:a6];
          uint64_t v21 = [v19 computeEngine];
          id v22 = [v16 data];
          objc_msgSend(v21, "dispatchReadTensor:targetBuffer:batchSize:", v18, objc_msgSend(v22, "bytes"), v20);

          id v9 = v36;
          self = v13;
        }
        uint64_t v12 = [v36 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v12);
    }
  }
  else
  {
    long long v40 = 0uLL;
    long long v41 = 0uLL;
    long long v38 = 0uLL;
    long long v39 = 0uLL;
    uint64_t v23 = [(MLCGraph *)self allOutputs];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v39 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v38 + 1) + 8 * j);
          long long v29 = [(MLCGraph *)self allOutputs];
          long long v30 = [v29 objectForKeyedSubscript:v28];

          long long v31 = [v30 device];
          long long v32 = [v31 computeEngine];
          [v32 synchronizeTensor:v30];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v25);
    }
  }
  return 1;
}

- (void)linkRelatedTensorsForConcatLayer:(id)a3 device:(id)a4
{
  id v16 = a3;
  uint64_t v4 = [v16 dimension];
  uint64_t v5 = [v16 sourceTensors];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      id v9 = [v16 sourceTensors];
      id v10 = [v9 objectAtIndexedSubscript:v8];

      [v10 setConcatOffset:v7];
      [v10 setConcatDimension:v4];
      uint64_t v11 = [v10 descriptor];
      uint64_t v12 = [v11 shape];
      id v13 = [v12 objectAtIndexedSubscript:v4];
      v7 += [v13 unsignedIntegerValue];

      ++v8;
      uint64_t v14 = [v16 sourceTensors];
      unint64_t v15 = [v14 count];
    }
    while (v8 < v15);
  }
}

- (NSString)summarizedDOTDescription
{
  uint64_t v255 = *MEMORY[0x1E4F143B8];
  if ([(MLCGraph *)self readyForExecution]
    && ([(MLCGraph *)self compilerOptions] & 3) == 0)
  {
    id v9 = +[MLCLog framework];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MLCGraph summarizedDOTDescription](a2);
    }
    id v10 = &stru_1F38596E0;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:MEMORY[0x1E4F1CBF0]];
    objc_opt_class();
    v192 = self;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = self;
      uint64_t v6 = [(MLCGraph *)v5 optimizer];

      if (v6)
      {
        uint64_t v7 = [(MLCGraph *)v5 optimizer];
        unint64_t v8 = (objc_class *)objc_opt_class();
        v185 = NSStringFromClass(v8);
      }
      else
      {
        v185 = 0;
      }
      uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v12 = [(MLCGraph *)v5 stopGradientTensorList];
      uint64_t v13 = [v11 setWithArray:v12];

      v195 = v13;
    }
    else
    {
      v195 = v4;
      v185 = 0;
    }
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    long long v242 = 0u;
    long long v243 = 0u;
    long long v244 = 0u;
    long long v245 = 0u;
    obuint64_t j = [(MLCGraph *)v192 layers];
    uint64_t v187 = [obj countByEnumeratingWithState:&v242 objects:v254 count:16];
    if (v187)
    {
      uint64_t v15 = 0;
      uint64_t v188 = *(void *)v243;
      v204 = v14;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v243 != v188)
          {
            uint64_t v17 = v16;
            objc_enumerationMutation(obj);
            uint64_t v16 = v17;
          }
          uint64_t v189 = v16;
          id v18 = *(void **)(*((void *)&v242 + 1) + 8 * v16);
          long long v238 = 0u;
          long long v239 = 0u;
          long long v240 = 0u;
          long long v241 = 0u;
          id v205 = [v18 sourceTensors];
          uint64_t v19 = [v205 countByEnumeratingWithState:&v238 objects:v253 count:16];
          v208 = v18;
          if (v19)
          {
            uint64_t v20 = v19;
            id v21 = *(id *)v239;
            id v196 = *(id *)v239;
            do
            {
              uint64_t v22 = 0;
              uint64_t v200 = v20;
              do
              {
                if (*(id *)v239 != v21) {
                  objc_enumerationMutation(v205);
                }
                uint64_t v23 = *(void **)(*((void *)&v238 + 1) + 8 * v22);
                uint64_t v24 = [v23 parentLayers];
                uint64_t v25 = [v24 count];

                if (!v25)
                {
                  uint64_t v26 = v15;
                  long long v27 = objc_msgSend(NSString, "stringWithFormat:", @"invisibleInput%lu [style = invis]", v15);
                  [v14 addObject:v27];

                  uint64_t v28 = [MEMORY[0x1E4F28E78] string];
                  long long v29 = [v23 label];
                  [v28 appendString:v29];

                  [v28 appendString:@" ["];
                  long long v30 = [v23 descriptor];
                  long long v31 = [v30 shape];
                  uint64_t v32 = [v31 count];

                  if (v32)
                  {
                    unint64_t v33 = 0;
                    unsigned int v34 = 1;
                    do
                    {
                      uint64_t v35 = [v23 descriptor];
                      long long v36 = [v35 shape];
                      long long v37 = [v36 objectAtIndexedSubscript:v33];
                      objc_msgSend(v28, "appendFormat:", @"%lu", objc_msgSend(v37, "unsignedLongValue"));

                      long long v38 = [v23 descriptor];
                      long long v39 = [v38 shape];
                      unint64_t v40 = [v39 count];

                      if (v40 > v34) {
                        [v28 appendString:@", "];
                      }
                      unint64_t v33 = v34;
                      long long v41 = [v23 descriptor];
                      long long v42 = [v41 shape];
                      unint64_t v43 = [v42 count];

                      ++v34;
                    }
                    while (v43 > v33);
                  }
                  [v28 appendString:@"]"];
                  uint64_t v44 = v26;
                  id v18 = v208;
                  long long v45 = [NSString stringWithFormat:@"invisibleInput%lu -> %lu [label=<<FONT POINT-SIZE=\"10\">%@</FONT>>]", v44, objc_msgSend(v208, "layerID"), v28];
                  [v14 addObject:v45];

                  uint64_t v15 = v44 + 1;
                  id v21 = v196;
                  uint64_t v20 = v200;
                }
                ++v22;
              }
              while (v22 != v20);
              uint64_t v20 = [v205 countByEnumeratingWithState:&v238 objects:v253 count:16];
            }
            while (v20);
          }

          if ([v18 isLastLayer])
          {
            long long v236 = 0u;
            long long v237 = 0u;
            long long v234 = 0u;
            long long v235 = 0u;
            id v197 = [v18 resultTensors];
            id v206 = (id)[v197 countByEnumeratingWithState:&v234 objects:v252 count:16];
            if (v206)
            {
              uint64_t v201 = *(void *)v235;
              do
              {
                for (uint64_t i = 0; i != v206; uint64_t i = (char *)i + 1)
                {
                  if (*(void *)v235 != v201) {
                    objc_enumerationMutation(v197);
                  }
                  uint64_t v47 = *(void **)(*((void *)&v234 + 1) + 8 * i);
                  uint64_t v48 = v15;
                  uint64_t v49 = objc_msgSend(NSString, "stringWithFormat:", @"invisibleOutput%lu [style = invis]", v15, v183);
                  [v14 addObject:v49];

                  v50 = [MEMORY[0x1E4F28E78] string];
                  v51 = [v47 label];
                  [v50 appendString:v51];

                  [v50 appendString:@" ["];
                  uint64_t v52 = [v47 descriptor];
                  uint64_t v53 = [v52 shape];
                  uint64_t v54 = [v53 count];

                  if (v54)
                  {
                    unint64_t v55 = 0;
                    unsigned int v56 = 1;
                    do
                    {
                      unint64_t v57 = [v47 descriptor];
                      uint64_t v58 = [v57 shape];
                      int v59 = [v58 objectAtIndexedSubscript:v55];
                      objc_msgSend(v50, "appendFormat:", @"%lu", objc_msgSend(v59, "unsignedLongValue"));

                      v60 = [v47 descriptor];
                      uint64_t v61 = [v60 shape];
                      unint64_t v62 = [v61 count];

                      if (v62 > v56) {
                        [v50 appendString:@", "];
                      }
                      unint64_t v55 = v56;
                      uint64_t v63 = [v47 descriptor];
                      uint64_t v64 = [v63 shape];
                      unint64_t v65 = [v64 count];

                      ++v56;
                    }
                    while (v65 > v55);
                  }
                  [v50 appendString:@"]"];
                  unint64_t v66 = [NSString stringWithFormat:@"%lu -> invisibleOutput%lu [label=<<FONT POINT-SIZE=\"10\">%@</FONT>>]", objc_msgSend(v208, "layerID"), v48, v50];
                  [v14 addObject:v66];

                  uint64_t v15 = v48 + 1;
                }
                id v206 = (id)[v197 countByEnumeratingWithState:&v234 objects:v252 count:16];
              }
              while (v206);
            }

            id v18 = v208;
          }
          uint64_t v190 = v15;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v67 = v18;
            v68 = [v67 lossLabels];
            if (v68)
            {
              BOOL v69 = v68;
              v70 = [v68 parentLayers];
              uint64_t v71 = [v70 count];

              if (!v71)
              {
LABEL_51:
                uint64_t v76 = objc_msgSend(NSString, "stringWithFormat:", @"invisibleLabel%lu [style = invis]", v190);
                [v14 addObject:v76];

                uint64_t v73 = [MEMORY[0x1E4F28E78] string];
                long long v77 = [v69 label];
                [v73 appendString:v77];

                [v73 appendString:@" ["];
                long long v78 = [v69 descriptor];
                id v79 = [v78 shape];
                uint64_t v80 = [v79 count];

                if (v80)
                {
                  unint64_t v81 = 0;
                  unsigned int v82 = 1;
                  do
                  {
                    long long v83 = [v69 descriptor];
                    long long v84 = [v83 shape];
                    long long v85 = [v84 objectAtIndexedSubscript:v81];
                    objc_msgSend(v73, "appendFormat:", @"%lu", objc_msgSend(v85, "unsignedLongValue"));

                    long long v86 = [v69 descriptor];
                    long long v87 = [v86 shape];
                    unint64_t v88 = [v87 count];

                    if (v88 > v82) {
                      [v73 appendString:@", "];
                    }
                    unint64_t v81 = v82;
                    long long v89 = [v69 descriptor];
                    long long v90 = [v89 shape];
                    unint64_t v91 = [v90 count];

                    ++v82;
                  }
                  while (v91 > v81);
                }
                [v73 appendString:@"]"];
                long long v92 = [NSString stringWithFormat:@"invisibleLabel%lu -> %lu [label=<<FONT POINT-SIZE=\"10\">%@</FONT>>]", v190, objc_msgSend(v67, "layerID"), v73];
                [v14 addObject:v92];

                ++v190;
                id v18 = v208;
                goto LABEL_58;
              }
            }
            else
            {
              id v72 = [(MLCGraph *)v192 allLossLabels];
              uint64_t v73 = [v72 allKeys];

              if ([v73 count])
              {
                id v74 = [v73 objectAtIndexedSubscript:0];
                uint64_t v75 = [(MLCGraph *)v192 allLossLabels];
                BOOL v69 = [v75 objectForKeyedSubscript:v74];

                uint64_t v14 = v204;
                goto LABEL_51;
              }
              BOOL v69 = 0;
              uint64_t v14 = v204;
LABEL_58:
            }
          }
          long long v93 = NSString;
          uint64_t v94 = [v18 layerID];
          long long v95 = [v18 summarizedDOTDescription];
          uint64_t v96 = [v93 stringWithFormat:@"%lu [fillcolor=\"lightblue\" label=%@]", v94, v95];
          [v14 addObject:v96];

          id v207 = [MEMORY[0x1E4F1CA80] set];
          long long v97 = [MEMORY[0x1E4F1CA60] dictionary];
          long long v98 = [MEMORY[0x1E4F1CA48] array];
          id v99 = [v18 fusedLayers];
          uint64_t v100 = [v99 count];

          if (v100)
          {
            uint64_t v101 = [v18 fusedLayers];
            [v98 addObjectsFromArray:v101];

            id v102 = v18;
            long long v230 = 0u;
            long long v231 = 0u;
            long long v232 = 0u;
            long long v233 = 0u;
            id v198 = v102;
            id v103 = [v102 fusedLayers];
            uint64_t v104 = [v103 countByEnumeratingWithState:&v230 objects:v251 count:16];
            if (v104)
            {
              uint64_t v105 = v104;
              uint64_t v106 = *(void *)v231;
              do
              {
                for (uint64_t j = 0; j != v105; ++j)
                {
                  if (*(void *)v231 != v106) {
                    objc_enumerationMutation(v103);
                  }
                  id v108 = *(void **)(*((void *)&v230 + 1) + 8 * j);
                  __int16 v109 = [v108 sourceTensors];
                  if ([v109 count] != 1) {
                    -[MLCGraph summarizedDOTDescription]();
                  }

                  id v110 = [v108 sourceTensors];
                  uint64_t v111 = [v110 objectAtIndexedSubscript:0];

                  if ([v195 containsObject:v111])
                  {
                    v112 = [v111 childLayers];
                    [v207 addObjectsFromArray:v112];
                  }
                  unint64_t v229 = 0;
                  char v113 = [v198 layerID];
                  uint64_t v183 = [v108 layerID];
                  hashCombine_9(&v229, v114, v115, v116, v117, v118, v119, v120, v113);
                  v121 = [NSNumber numberWithUnsignedInteger:v229];
                  [v97 setObject:v111 forKey:v121];
                }
                uint64_t v105 = [v103 countByEnumeratingWithState:&v230 objects:v251 count:16];
              }
              while (v105);
            }
          }
          else
          {
            long long v227 = 0u;
            long long v228 = 0u;
            long long v225 = 0u;
            long long v226 = 0u;
            id v198 = [v18 resultTensors];
            id v193 = (id)[v198 countByEnumeratingWithState:&v225 objects:v250 count:16];
            if (v193)
            {
              uint64_t v191 = *(void *)v226;
              v122 = v195;
              do
              {
                uint64_t v123 = 0;
                do
                {
                  if (*(void *)v226 != v191) {
                    objc_enumerationMutation(v198);
                  }
                  uint64_t v202 = v123;
                  v124 = *(void **)(*((void *)&v225 + 1) + 8 * v123);
                  if ([v122 containsObject:v124])
                  {
                    v125 = [v124 childLayers];
                    [v207 addObjectsFromArray:v125];
                  }
                  v126 = (void *)MEMORY[0x1E4F1CAD0];
                  v127 = [(MLCGraph *)v192 layers];
                  v128 = [v126 setWithArray:v127];

                  long long v223 = 0u;
                  long long v224 = 0u;
                  long long v221 = 0u;
                  long long v222 = 0u;
                  v129 = [v124 childLayers];
                  uint64_t v130 = [v129 countByEnumeratingWithState:&v221 objects:v249 count:16];
                  if (v130)
                  {
                    uint64_t v131 = v130;
                    uint64_t v132 = *(void *)v222;
                    do
                    {
                      for (uint64_t k = 0; k != v131; ++k)
                      {
                        if (*(void *)v222 != v132) {
                          objc_enumerationMutation(v129);
                        }
                        uint64_t v134 = *(void *)(*((void *)&v221 + 1) + 8 * k);
                        if ([v128 containsObject:v134]) {
                          [v98 addObject:v134];
                        }
                      }
                      uint64_t v131 = [v129 countByEnumeratingWithState:&v221 objects:v249 count:16];
                    }
                    while (v131);
                  }

                  long long v219 = 0u;
                  long long v220 = 0u;
                  long long v217 = 0u;
                  long long v218 = 0u;
                  v135 = [v124 childLayers];
                  uint64_t v136 = [v135 countByEnumeratingWithState:&v217 objects:v248 count:16];
                  if (v136)
                  {
                    uint64_t v137 = v136;
                    uint64_t v138 = *(void *)v218;
                    do
                    {
                      for (uint64_t m = 0; m != v137; ++m)
                      {
                        if (*(void *)v218 != v138) {
                          objc_enumerationMutation(v135);
                        }
                        v140 = *(void **)(*((void *)&v217 + 1) + 8 * m);
                        unint64_t v229 = 0;
                        char v141 = [v208 layerID];
                        uint64_t v183 = [v140 layerID];
                        hashCombine_9(&v229, v142, v143, v144, v145, v146, v147, v148, v141);
                        v149 = [NSNumber numberWithUnsignedInteger:v229];
                        [v97 setObject:v124 forKey:v149];
                      }
                      uint64_t v137 = [v135 countByEnumeratingWithState:&v217 objects:v248 count:16];
                    }
                    while (v137);
                  }

                  uint64_t v14 = v204;
                  uint64_t v123 = v202 + 1;
                  v122 = v195;
                }
                while ((id)(v202 + 1) != v193);
                id v193 = (id)[v198 countByEnumeratingWithState:&v225 objects:v250 count:16];
              }
              while (v193);
            }
          }

          long long v215 = 0u;
          long long v216 = 0u;
          long long v213 = 0u;
          long long v214 = 0u;
          id v194 = v98;
          uint64_t v203 = [v194 countByEnumeratingWithState:&v213 objects:v247 count:16];
          if (v203)
          {
            id v199 = *(id *)v214;
            do
            {
              for (uint64_t n = 0; n != v203; ++n)
              {
                if (*(id *)v214 != v199) {
                  objc_enumerationMutation(v194);
                }
                v151 = *(void **)(*((void *)&v213 + 1) + 8 * n);
                int v152 = [v207 containsObject:v151];
                v153 = @"solid";
                if (v152) {
                  v153 = @"dashed";
                }
                v154 = v153;
                v155 = NSString;
                uint64_t v156 = [v151 layerID];
                v157 = [v151 summarizedDOTDescription];
                v158 = [v155 stringWithFormat:@"%lu [fillcolor=\"lightblue\" label=%@]", v156, v157];
                [v14 addObject:v158];

                unint64_t v229 = 0;
                LOBYTE(v158) = [v208 layerID];
                uint64_t v184 = [v151 layerID];
                hashCombine_9(&v229, v159, v160, v161, v162, v163, v164, v165, (char)v158);
                v166 = [NSNumber numberWithUnsignedInteger:v229];
                v167 = [v97 objectForKey:v166];

                v168 = [v167 descriptor];
                v169 = [v168 shape];

                v170 = [MEMORY[0x1E4F28E78] string];
                v171 = [v167 label];
                [v170 appendString:v171];

                [v170 appendString:@"\n"];
                [v170 appendString:@" ["];
                if ([v169 count])
                {
                  unint64_t v172 = 0;
                  unsigned int v173 = 1;
                  do
                  {
                    v174 = [v169 objectAtIndexedSubscript:v172];
                    objc_msgSend(v170, "appendFormat:", @"%lu", objc_msgSend(v174, "unsignedLongValue"), v184);

                    if ([v169 count] > (unint64_t)v173) {
                      [v170 appendString:@", "];
                    }
                    unint64_t v172 = v173++;
                  }
                  while ([v169 count] > v172);
                }
                [v170 appendString:@"]"];
                v175 = [NSString stringWithFormat:@"%lu -> %lu [style=\"%@\" label=<<FONT POINT-SIZE=\"10\">%@</FONT>>]", objc_msgSend(v208, "layerID"), objc_msgSend(v151, "layerID"), v154, v170];
                uint64_t v14 = v204;
                [v204 addObject:v175];
              }
              uint64_t v203 = [v194 countByEnumeratingWithState:&v213 objects:v247 count:16];
            }
            while (v203);
          }

          uint64_t v15 = v190;
          uint64_t v16 = v189 + 1;
        }
        while (v189 + 1 != v187);
        uint64_t v187 = [obj countByEnumeratingWithState:&v242 objects:v254 count:16];
      }
      while (v187);
    }

    [MEMORY[0x1E4F28E78] stringWithString:@"digraph MLCGraph {\n node [style=filled];\n"];
    v176 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v10 = v176;
    if (v185) {
      -[__CFString appendFormat:](v176, "appendFormat:", @"subgraph G {\nnode [style=filled, fillcolor=\"#40e0d0\" shape=tripleoctagon];%@\n}\n",
    }
        v185);
    long long v211 = 0u;
    long long v212 = 0u;
    long long v209 = 0u;
    long long v210 = 0u;
    id v177 = v14;
    uint64_t v178 = [v177 countByEnumeratingWithState:&v209 objects:v246 count:16];
    if (v178)
    {
      uint64_t v179 = v178;
      uint64_t v180 = *(void *)v210;
      do
      {
        for (iuint64_t i = 0; ii != v179; ++ii)
        {
          if (*(void *)v210 != v180) {
            objc_enumerationMutation(v177);
          }
          -[__CFString appendFormat:](v10, "appendFormat:", @"\t%@;\n",
            *(void *)(*((void *)&v209 + 1) + 8 * ii),
            v183);
        }
        uint64_t v179 = [v177 countByEnumeratingWithState:&v209 objects:v246 count:16];
      }
      while (v179);
    }

    [(__CFString *)v10 appendFormat:@"}"];
    id v9 = v195;
  }

  return (NSString *)v10;
}

- (void)updateLSTMLayersForVariableSequenceLengthInGraph:(id)a3 withInputData:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v33 = a4;
  uint64_t v5 = [(MLCGraph *)self lstmLayerIndexList];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = [(MLCGraph *)self lstmLayerIndexList];
      id v9 = [v8 objectAtIndexedSubscript:v7];
      uint64_t v10 = [v9 unsignedIntegerValue];

      uint64_t v11 = [(MLCGraph *)self graphLayerList];
      uint64_t v12 = [v11 objectAtIndexedSubscript:v10];

      uint64_t v13 = [v12 sourceTensors];
      if ([v13 count] == 2) {
        break;
      }
      uint64_t v14 = [v12 sourceTensors];
      uint64_t v15 = [v14 count];

      if (v15 == 4) {
        goto LABEL_6;
      }
LABEL_19:

      ++v7;
      long long v31 = [(MLCGraph *)self lstmLayerIndexList];
      unint64_t v32 = [v31 count];

      if (v7 >= v32) {
        goto LABEL_20;
      }
    }

LABEL_6:
    unint64_t v34 = v7;
    uint64_t v16 = [v12 sourceTensors];
    uint64_t v17 = [v16 count];
    id v18 = [v12 sourceTensors];
    uint64_t v19 = v18;
    if (v17 == 2) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = 3;
    }
    id v21 = [v18 objectAtIndexedSubscript:v20];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v22 = v33;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v28 = [v21 label];
          int v29 = [v28 isEqualToString:v27];

          if (v29)
          {
            long long v30 = [v22 objectForKeyedSubscript:v27];
            [(MLCGraph *)self createVariableLengthSequenceTensorsForLayer:v12 withVariableSequenceLength:v30];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v24);
    }

    unint64_t v7 = v34;
    goto LABEL_19;
  }
LABEL_20:
}

- (void)allocateDeviceMemoryForTensor:(id)a3 device:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  unint64_t v7 = [v6 computeEngine];
  int v8 = [v7 needToAllocateDeviceMemoryForTensor:v31];

  if (v8)
  {
    if ([v31 computeFlags]) {
      goto LABEL_14;
    }
    id v9 = [v31 childLayers];
    uint64_t v10 = [v9 count];

    if (!v10) {
      goto LABEL_14;
    }
    uint64_t v11 = [v6 computeEngine];
    unint64_t v12 = [v11 deviceMemorySizeForTensor:v31];

    uint64_t v13 = [(MLCGraph *)self freeResourceList];
    unint64_t v14 = [v13 count];

    uint64_t v15 = [(MLCGraph *)self freeResourceList];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      unint64_t v17 = 0;
      unint64_t v18 = -1;
      while (1)
      {
        uint64_t v19 = [v6 computeEngine];
        uint64_t v20 = [(MLCGraph *)self freeResourceList];
        id v21 = [v20 objectAtIndexedSubscript:v17];
        unint64_t v22 = [v19 deviceMemorySizeForTensor:v21];

        if (v22 == v12) {
          break;
        }
        if (v22 > v12 && v18 > v22)
        {
          unint64_t v14 = v17;
          unint64_t v18 = v22;
        }
        ++v17;
        uint64_t v23 = [(MLCGraph *)self freeResourceList];
        unint64_t v24 = [v23 count];

        if (v17 >= v24) {
          goto LABEL_12;
        }
      }
      unint64_t v14 = v17;
    }
LABEL_12:
    uint64_t v25 = [(MLCGraph *)self freeResourceList];
    unint64_t v26 = [v25 count];

    if (v14 >= v26)
    {
LABEL_14:
      uint64_t v28 = [v6 computeEngine];
      [v28 allocateDeviceMemoryForTensor:v31];
    }
    else
    {
      uint64_t v27 = [(MLCGraph *)self freeResourceList];
      uint64_t v28 = [v27 objectAtIndexedSubscript:v14];

      int v29 = [v6 computeEngine];
      [v29 shareDeviceMemoryWithResultTensor:v31 sourceTensor:v28];

      long long v30 = [(MLCGraph *)self freeResourceList];
      [v30 removeObjectAtIndex:v14];
    }
  }
}

- (void)freeDeviceMemoryForTensorIfSafe:(id)a3 device:(id)a4
{
  id v5 = a3;
  id v6 = [v5 parentLayers];
  if (![v6 count])
  {

    goto LABEL_8;
  }
  char v7 = [v5 computeFlags];

  if (v7)
  {
LABEL_8:
    id v9 = v5;
    goto LABEL_9;
  }
  int v8 = [v5 sharedMemoryTensor];

  if (!v8)
  {
    id v9 = v5;
LABEL_11:
    if ([v9 readCount])
    {
      objc_msgSend(v9, "setReadCount:", objc_msgSend(v9, "readCount") - 1);
      if (![v9 readCount])
      {
        unint64_t v12 = [(MLCGraph *)self freeResourceList];
        [v12 addObject:v9];
      }
    }
    else
    {
      uint64_t v13 = [(MLCGraph *)self freeResourceList];
      uint64_t v14 = [v13 count];

      if (v14)
      {
        unint64_t v15 = 0;
        while (1)
        {
          uint64_t v16 = [(MLCGraph *)self freeResourceList];
          unint64_t v17 = [v16 objectAtIndexedSubscript:v15];

          if (v9 == v17) {
            break;
          }
          ++v15;
          unint64_t v18 = [(MLCGraph *)self freeResourceList];
          unint64_t v19 = [v18 count];

          if (v15 >= v19) {
            goto LABEL_19;
          }
        }
      }
      else
      {
LABEL_19:
        uint64_t v20 = [v9 childLayers];
        uint64_t v21 = [v20 count];

        if (v21)
        {
          unint64_t v22 = [NSString stringWithFormat:@"tensor=%@ not found in free list", v9];
          uint64_t v23 = +[MLCLog framework];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:]();
          }
        }
      }
    }
    goto LABEL_9;
  }
  id v9 = [v5 sharedMemoryTensor];

  uint64_t v10 = [v9 parentLayers];
  if (![v10 count])
  {

    goto LABEL_9;
  }
  char v11 = [v9 computeFlags];

  if ((v11 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_9:
}

- (void)updateDeviceMemoryReadCountForTensor:(id)a3
{
  id v7 = a3;
  uint64_t v3 = [v7 sharedMemoryTensor];

  if (v3)
  {
    uint64_t v4 = [v7 sharedMemoryTensor];
    id v5 = [v7 childLayers];
    objc_msgSend(v4, "setReadCount:", objc_msgSend(v4, "readCount") + objc_msgSend(v5, "count"));

    [v7 setReadCount:0];
  }
  else
  {
    id v6 = [v7 childLayers];
    objc_msgSend(v7, "setReadCount:", objc_msgSend(v6, "count"));

    id v7 = v6;
  }
}

- (void)updateDeviceMemoryReadCountForGradientWithLayer:(id)a3 tensor:(id)a4 checkIfSourceNeeded:(BOOL)a5 checkIfResultNeeded:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v22 = a3;
  id v9 = a4;
  if (v6)
  {
    uint64_t v10 = [v22 deviceOps];
    char v11 = [v10 objectAtIndexedSubscript:0];
    int v12 = [v11 resultOfForwardNeededForGradient];

    if (v12)
    {
      uint64_t v13 = [v9 sharedMemoryTensor];

      if (v13)
      {
        uint64_t v14 = [v9 sharedMemoryTensor];
        objc_msgSend(v14, "setReadCount:", objc_msgSend(v14, "readCount") + 1);

        uint64_t v15 = 0;
      }
      else
      {
        uint64_t v15 = [v9 readCount] + 1;
      }
      [v9 setReadCount:v15];
    }
  }
  if (v7)
  {
    uint64_t v16 = [v22 deviceOps];
    unint64_t v17 = [v16 objectAtIndexedSubscript:0];
    int v18 = [v17 sourceOfForwardNeededForGradient];

    if (v18)
    {
      unint64_t v19 = [v9 sharedMemoryTensor];

      if (v19)
      {
        uint64_t v20 = [v9 sharedMemoryTensor];
        objc_msgSend(v20, "setReadCount:", objc_msgSend(v20, "readCount") + 1);

        uint64_t v21 = 0;
      }
      else
      {
        uint64_t v21 = [v9 readCount] + 1;
      }
      [v9 setReadCount:v21];
    }
  }
}

- (MLCDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (BOOL)readyForExecution
{
  return self->_readyForExecution;
}

- (void)setReadyForExecution:(BOOL)a3
{
  self->_readyForExecutiouint64_t n = a3;
}

- (NSArray)graphObjects
{
  return self->_graphObjects;
}

- (unint64_t)nextLayerID
{
  return self->_nextLayerID;
}

- (void)setNextLayerID:(unint64_t)a3
{
  self->_nextLayerID = a3;
}

- (NSMutableArray)graphLayerList
{
  return self->_graphLayerList;
}

- (void)setGraphLayerList:(id)a3
{
}

- (NSMutableArray)rootLevelTensorNodes
{
  return self->_rootLevelTensorNodes;
}

- (void)setRootLevelTensorNodes:(id)a3
{
}

- (NSMutableDictionary)layerParentMap
{
  return self->_layerParentMap;
}

- (void)setLayerParentMap:(id)a3
{
}

- (NSMutableDictionary)layerChildMap
{
  return self->_layerChildMap;
}

- (void)setLayerChildMap:(id)a3
{
}

- (NSDictionary)allInputs
{
  return self->_allInputs;
}

- (void)setAllInputs:(id)a3
{
}

- (NSDictionary)allLossLabels
{
  return self->_allLossLabels;
}

- (void)setAllLossLabels:(id)a3
{
}

- (NSDictionary)allLossLabelWeights
{
  return self->_allLossLabelWeights;
}

- (void)setAllLossLabelWeights:(id)a3
{
}

- (NSDictionary)allOutputs
{
  return self->_allOutputs;
}

- (void)setAllOutputs:(id)a3
{
}

- (NSMutableArray)lstmLayerIndexList
{
  return self->_lstmLayerIndexList;
}

- (void)setLstmLayerIndexList:(id)a3
{
}

- (BOOL)recompileAfterLinking
{
  return self->_recompileAfterLinking;
}

- (void)setRecompileAfterLinking:(BOOL)a3
{
  self->_recompileAfterLinking = a3;
}

- (unint64_t)compilerOptions
{
  return self->_compilerOptions;
}

- (void)setCompilerOptions:(unint64_t)a3
{
  self->_compilerOptions = a3;
}

- (BOOL)staticBatchSizeInGraph
{
  return self->_staticBatchSizeInGraph;
}

- (void)setStaticBatchSizeInGraph:(BOOL)a3
{
  self->_staticBatchSizeInGraph = a3;
}

- (BOOL)allocateDeviceMemoryForTensorsInGraph
{
  return self->_allocateDeviceMemoryForTensorsInGraph;
}

- (void)setAllocateDeviceMemoryForTensorsInGraph:(BOOL)a3
{
  self->_allocateDeviceMemoryForTensorsInGraph = a3;
}

- (NSMutableArray)freeResourceList
{
  return self->_freeResourceList;
}

- (void)setFreeResourceList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freeResourceList, 0);
  objc_storeStrong((id *)&self->_lstmLayerIndexList, 0);
  objc_storeStrong((id *)&self->_allOutputs, 0);
  objc_storeStrong((id *)&self->_allLossLabelWeights, 0);
  objc_storeStrong((id *)&self->_allLossLabels, 0);
  objc_storeStrong((id *)&self->_allInputs, 0);
  objc_storeStrong((id *)&self->_layerChildMap, 0);
  objc_storeStrong((id *)&self->_layerParentMap, 0);
  objc_storeStrong((id *)&self->_rootLevelTensorNodes, 0);
  objc_storeStrong((id *)&self->_graphLayerList, 0);
  objc_storeStrong((id *)&self->_graphObjects, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)createGradientSourceTensorWith:(const char *)a1 source:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: source tensor is nil", v4, v5, v6, v7, v8);
}

- (void)checksBeforeAddLayerInGraph:sources:forTraining:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: layer (%@) has empty sources", v4, v5, v6, v7, v8);
}

- (void)checksBeforeAddLayerInGraph:(const char *)a1 sources:forTraining:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: YOLO loss layer can only be pass as loss layer when creating training graph", v4, v5, v6, v7, v8);
}

- (void)checksBeforeAddLayerInGraph:sources:forTraining:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromSelector(v2);
  int v4 = 138412802;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  __int16 v8 = 2048;
  uint64_t v9 = [v1 layerID];
  _os_log_error_impl(&dword_1DD0C9000, v0, OS_LOG_TYPE_ERROR, "%@: layer (%@) already has a layerID (%lu)", (uint8_t *)&v4, 0x20u);
}

- (void)checksBeforeAddLayerInGraph:sources:forTraining:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: layer (%@) being added twice to the graph", v4, v5, v6, v7, v8);
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

- (void)selectWithSources:(const char *)a1 condition:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Number of sources must be 2", v4, v5, v6, v7, v8);
}

- (void)nodeWithLayer:sources:lossLabels:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: layer (%@) is not a loss layer", v4, v5, v6, v7, v8);
}

- (void)nodeWithLayer:sources:forTraining:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: (%@) nil resultTensor", v4, v5, v6, v7, v8);
}

- (void)resultTensorsForLayer:graphLayerList:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: Layer (%@) has been fused", v4, v5, v6, v7, v8);
}

- (void)addGraphNodes:(void *)a3 withControlTreeNode:(NSObject *)a4 .cold.1(uint8_t *a1, SEL aSelector, void *a3, NSObject *a4)
{
  uint64_t v7 = NSStringFromSelector(aSelector);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1DD0C9000, a4, OS_LOG_TYPE_ERROR, "%@: Nested conditions are not yet supported ", a1, 0xCu);
}

- (void)conditionalWithPredicate:(const char *)a1 trueBranch:falseBranch:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Conditional layer doesn't support multiple outputs for now. ", v4, v5, v6, v7, v8);
}

- (void)conditionalWithPredicate:(const char *)a1 trueBranch:falseBranch:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Conditional layer must be added before call to -graphWithGraphObjects:lossLayer:optimizer or -graphWithGraphObjects:", v4, v5, v6, v7, v8);
}

- (void)summarizedDOTDescription
{
  __assert_rtn("-[MLCGraph summarizedDOTDescription]", "MLCGraph.m", 1347, "childLayer.sourceTensors.count == 1");
}

@end