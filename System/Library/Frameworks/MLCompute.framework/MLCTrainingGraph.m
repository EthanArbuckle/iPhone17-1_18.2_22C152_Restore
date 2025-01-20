@interface MLCTrainingGraph
+ (MLCTrainingGraph)graphWithGraphObjects:(NSArray *)graphObjects lossLayer:(MLCLayer *)lossLayer optimizer:(MLCOptimizer *)optimizer;
- (BOOL)addInputs:(NSDictionary *)inputs lossLabels:(NSDictionary *)lossLabels;
- (BOOL)addInputs:(NSDictionary *)inputs lossLabels:(NSDictionary *)lossLabels lossLabelWeights:(NSDictionary *)lossLabelWeights;
- (BOOL)addOutputs:(NSDictionary *)outputs;
- (BOOL)allocateGradientTensorsForMultipleChildrenOfLayer:(id)a3 gradientTensorsAreTemporary:(BOOL)a4 device:(id)a5;
- (BOOL)allocateGradientTensorsForMultipleChildrenOfSplitLayer:(id)a3 tensor:(id)a4 gradientTensorsAreTemporary:(BOOL)a5 device:(id)a6;
- (BOOL)allocateOptimizerData;
- (BOOL)allocateOptimizerDataForGraph;
- (BOOL)allocateResultGradientTensors;
- (BOOL)allocateRootSourceGradientTensors:(id)a3;
- (BOOL)bindOptimizerData:(NSArray *)data deviceData:(NSArray *)deviceData withTensor:(MLCTensor *)tensor;
- (BOOL)checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:(id)a3 layer:(id)a4 device:(id)a5 isBetaTensor:(BOOL)a6;
- (BOOL)compileAndAllocateGradientTensorsForGraph:(BOOL)a3;
- (BOOL)compileOptimizer:(MLCOptimizer *)optimizer;
- (BOOL)compileWithOptions:(MLCGraphCompilationOptions)options device:(MLCDevice *)device;
- (BOOL)compileWithOptions:(MLCGraphCompilationOptions)options device:(MLCDevice *)device inputTensors:(NSDictionary *)inputTensors inputTensorsData:(NSDictionary *)inputTensorsData;
- (BOOL)executeForwardWithBatchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler;
- (BOOL)executeForwardWithBatchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options outputsData:(NSDictionary *)outputsData completionHandler:(MLCGraphCompletionHandler)completionHandler;
- (BOOL)executeGradientWithBatchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler;
- (BOOL)executeGradientWithBatchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options outputsData:(NSDictionary *)outputsData completionHandler:(MLCGraphCompletionHandler)completionHandler;
- (BOOL)executeOptimizerUpdateWithOptions:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler;
- (BOOL)executeWithInputsData:(NSDictionary *)inputsData lossLabelsData:(NSDictionary *)lossLabelsData lossLabelWeightsData:(NSDictionary *)lossLabelWeightsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler;
- (BOOL)executeWithInputsData:(NSDictionary *)inputsData lossLabelsData:(NSDictionary *)lossLabelsData lossLabelWeightsData:(NSDictionary *)lossLabelWeightsData outputsData:(NSDictionary *)outputsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler;
- (BOOL)isSourceTensorSharableWithResultGradientTensor:(id)a3 layer:(id)a4;
- (BOOL)linkWithGraphs:(NSArray *)graphs;
- (BOOL)recompileWithOptions:(unint64_t)a3;
- (BOOL)setTrainingTensorParameters:(NSArray *)parameters;
- (BOOL)stopGradientForTensors:(NSArray *)tensors;
- (BOOL)updateOptimizerTimeStep;
- (MLCLayer)dummyLayer;
- (MLCLayerCompiling)lossLayer;
- (MLCOptimizer)optimizer;
- (MLCTensor)allocateUserGradientForTensor:(MLCTensor *)tensor;
- (MLCTensor)gradientTensorForInput:(MLCTensor *)input;
- (MLCTrainingGraph)init;
- (MLCTrainingGraph)initWithGraphObjects:(id)a3 lossLayer:(id)a4 optimizer:(id)a5;
- (NSArray)resultGradientTensorsForLayer:(MLCLayer *)layer;
- (NSArray)sourceGradientTensorsForLayer:(MLCLayer *)layer;
- (NSData)gradientDataForParameter:(MLCTensor *)parameter layer:(MLCLayer *)layer;
- (NSMutableArray)lossLayersInTrainingGraph;
- (NSMutableArray)optimizerParameterList;
- (NSMutableArray)optimizerUpdateLayerList;
- (NSMutableArray)rootSourceGradientTensor;
- (NSMutableArray)stopGradientTensorList;
- (NSSet)optimizerUpdateDeviceList;
- (NSUInteger)deviceMemorySize;
- (id)description;
- (id)resultGradientTensorToUseByExecuteGradientForLayer:(id)a3 sourceIndex:(unint64_t)a4 incrementIntermediateIndex:(BOOL)a5;
- (id)resultGradientTensorsForLayer:(id)a3 summedGradientForInputTensors:(BOOL)a4;
- (id)resultTensorsForLayer:(id)a3;
- (id)sourceTensorsForLayer:(id)a3;
- (unint64_t)deviceMemorySizeWithDevice:(id)a3;
- (unint64_t)firstTrainableLayerIndex;
- (unint64_t)layerIndexToStoreSummedGradientsForTensor:(id)a3;
- (void)allocateGradientTensorsForLayersInGraph:(BOOL)a3;
- (void)dealloc;
- (void)executeForwardToLayerIndex:(unint64_t)a3 resultTensor:(id)a4 resultStateIsTemporary:(BOOL)a5 batchSize:(unint64_t)a6 forTraining:(BOOL)a7 executionOptions:(unint64_t)a8;
- (void)executeGradientFromLayerIndex:(unint64_t)a3 resultStateIsTemporary:(BOOL)a4 batchSize:(unint64_t)a5 executionOptions:(unint64_t)a6;
- (void)executeOptimizerUpdateWithExecutionOptions:(unint64_t)a3;
- (void)linkRelatedGradientTensorsForConcatLayer:(id)a3 device:(id)a4;
- (void)markLayersAsTrainable;
- (void)setAllocateOptimizerData:(BOOL)a3;
- (void)setAllocateResultGradientTensors:(BOOL)a3;
- (void)setFirstTrainableLayerIndex:(unint64_t)a3;
- (void)setLossLayer:(id)a3;
- (void)setLossLayersInTrainingGraph:(id)a3;
- (void)setOptimizer:(id)a3;
- (void)setOptimizerParameterList:(id)a3;
- (void)setOptimizerUpdateDeviceList:(id)a3;
- (void)setOptimizerUpdateLayerList:(id)a3;
- (void)setRootSourceGradientTensor:(id)a3;
- (void)setStopGradientTensorList:(id)a3;
- (void)setUpdateOptimizerTimeStep:(BOOL)a3;
- (void)sumAllRootSourceGradientTensors:(id)a3;
- (void)sumIntermediateGradientTensorsForLayer:(id)a3;
- (void)sumRootSourceGradientTensor:(id)a3 device:(id)a4;
- (void)synchronizeUpdates;
- (void)updateIsTrainableForLayerWithStopGradientTensor:(id)a3 checkChildLayers:(BOOL)a4;
- (void)updateTrainableLayerList:(BOOL)a3;
@end

@implementation MLCTrainingGraph

+ (MLCTrainingGraph)graphWithGraphObjects:(NSArray *)graphObjects lossLayer:(MLCLayer *)lossLayer optimizer:(MLCOptimizer *)optimizer
{
  v8 = optimizer;
  v9 = lossLayer;
  v10 = graphObjects;
  v11 = (void *)[objc_alloc((Class)a1) initWithGraphObjects:v10 lossLayer:v9 optimizer:v8];

  return (MLCTrainingGraph *)v11;
}

- (MLCTrainingGraph)init
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = [(MLCTrainingGraph *)self initWithGraphObjects:v4 lossLayer:0 optimizer:0];

  return v5;
}

- (MLCTrainingGraph)initWithGraphObjects:(id)a3 lossLayer:(id)a4 optimizer:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)MLCTrainingGraph;
  v11 = [(MLCGraph *)&v36 initWithGraphObjects:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_lossLayer, a4);
    objc_storeStrong((id *)&v12->_optimizer, a5);
    v13 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v14 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    optimizerUpdateLayerList = v12->_optimizerUpdateLayerList;
    v12->_optimizerUpdateLayerList = (NSMutableArray *)v14;

    uint64_t v16 = [v13 mutableCopy];
    optimizerParameterList = v12->_optimizerParameterList;
    v12->_optimizerParameterList = (NSMutableArray *)v16;

    uint64_t v18 = [v13 mutableCopy];
    lossLayersInTrainingGraph = v12->_lossLayersInTrainingGraph;
    v12->_lossLayersInTrainingGraph = (NSMutableArray *)v18;

    uint64_t v20 = [v13 mutableCopy];
    stopGradientTensorList = v12->_stopGradientTensorList;
    v12->_stopGradientTensorList = (NSMutableArray *)v20;

    uint64_t v22 = [v13 copy];
    optimizerUpdateDeviceList = v12->_optimizerUpdateDeviceList;
    v12->_optimizerUpdateDeviceList = (NSSet *)v22;

    v12->_firstTrainableLayerIndex = 0x7FFFFFFFLL;
    v12->_allocateResultGradientTensors = 1;
    v12->_allocateOptimizerData = 1;
    v12->_updateOptimizerTimeStep = 1;
    v24 = [[MLCLayer alloc] initWithLabel:@"Dummy"];
    dummyLayer = v12->_dummyLayer;
    v12->_dummyLayer = v24;

    if (v9)
    {
      v35.receiver = v12;
      v35.super_class = (Class)MLCTrainingGraph;
      v26 = [(MLCGraph *)&v35 graphLayerList];
      v34.receiver = v12;
      v34.super_class = (Class)MLCTrainingGraph;
      v27 = [(MLCGraph *)&v34 graphLayerList];
      v28 = objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v27, "count") - 1);
      v29 = [v28 resultTensors];
      v30 = [v29 objectAtIndexedSubscript:0];
      v33.receiver = v12;
      v33.super_class = (Class)MLCTrainingGraph;
      id v31 = [(MLCGraph *)&v33 nodeWithLayer:v9 source:v30];
    }
  }

  return v12;
}

- (void)dealloc
{
  [(NSMutableArray *)self->_optimizerUpdateLayerList removeAllObjects];
  [(NSMutableArray *)self->_optimizerParameterList removeAllObjects];
  [(NSMutableArray *)self->_rootSourceGradientTensor removeAllObjects];
  [(NSMutableArray *)self->_lossLayersInTrainingGraph removeAllObjects];
  [(NSMutableArray *)self->_stopGradientTensorList removeAllObjects];
  optimizer = self->_optimizer;
  self->_optimizer = 0;

  v4.receiver = self;
  v4.super_class = (Class)MLCTrainingGraph;
  [(MLCGraph *)&v4 dealloc];
}

- (BOOL)isSourceTensorSharableWithResultGradientTensor:(id)a3 layer:(id)a4
{
  id v6 = a3;
  if (([a4 isDebuggingEnabled] & 1) != 0
    || ([v6 childLayers],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8 != 1))
  {
    BOOL v15 = 0;
  }
  else
  {
    id v9 = [(MLCGraph *)self allOutputs];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      unint64_t v11 = 0;
      do
      {
        v12 = [(MLCGraph *)self allOutputs];
        v13 = [v12 allValues];
        id v14 = [v13 objectAtIndexedSubscript:v11];

        BOOL v15 = v14 != v6;
        if (v14 == v6) {
          break;
        }
        ++v11;
        uint64_t v16 = [(MLCGraph *)self allOutputs];
        unint64_t v17 = [v16 count];
      }
      while (v11 < v17);
    }
    else
    {
      BOOL v15 = 1;
    }
  }

  return v15;
}

- (BOOL)allocateRootSourceGradientTensors:(id)a3
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  [(MLCTrainingGraph *)self setRootSourceGradientTensor:v5];

  id v6 = [(MLCGraph *)self graphLayerList];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v49 = 0;
    unint64_t v8 = 0;
    do
    {
      id v9 = [(MLCGraph *)self graphLayerList];
      uint64_t v10 = [v9 objectAtIndexedSubscript:v8];

      if (([v10 skipLayer] & 1) == 0)
      {
        if ([v10 isTrainable])
        {
          unint64_t v11 = [v10 sourceTensors];
          uint64_t v12 = [v11 count];

          if (v12)
          {
            unint64_t v13 = 0;
            unint64_t v48 = v8;
            do
            {
              id v14 = [v10 sourceTensors];
              BOOL v15 = [v14 objectAtIndexedSubscript:v13];

              if (([v15 computeFlags] & 8) == 0)
              {
                uint64_t v16 = [v15 parentLayers];
                uint64_t v17 = [v16 count];

                if (!v17)
                {
                  uint64_t v18 = [v15 childLayers];
                  uint64_t v19 = [v18 count];

                  if (v19)
                  {
                    unint64_t v20 = 0;
                    uint64_t v21 = 0;
                    do
                    {
                      uint64_t v22 = [v15 childLayers];
                      v23 = [v22 objectAtIndexedSubscript:v20];
                      v21 += [v23 isGradientNeededForTensor:v15];

                      ++v20;
                      v24 = [v15 childLayers];
                      unint64_t v25 = [v24 count];
                    }
                    while (v20 < v25);
                  }
                  else
                  {
                    uint64_t v21 = 0;
                  }
                  uint64_t v26 = v21 - 1;
                  if (!v21) {
                    uint64_t v26 = 0;
                  }
                  unint64_t v27 = v26 + v21;
                  unint64_t v28 = [v15 rootSourceGradientTensorCount];
                  if (![v15 rootSourceGradientTensorIndexStart]
                    || v27 > [v15 rootSourceGradientTensorCount])
                  {
                    uint64_t v29 = [v15 rootSourceGradientTensorIndex];
                    uint64_t v30 = v29 - [v15 rootSourceGradientTensorIndexStart];
                    [v15 setRootSourceGradientTensorIndexStart:v49 + 1];
                    [v15 setRootSourceGradientTensorCount:v27];
                    objc_msgSend(v15, "setRootSourceGradientTensorIndex:", v30 + objc_msgSend(v15, "rootSourceGradientTensorIndexStart"));
                    for (; v28 < v27; ++v28)
                    {
                      id v31 = [v15 descriptor];
                      v32 = +[MLCTensor tensorWithDescriptor:v31];

                      [v32 setDevice:v4];
                      objc_super v33 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
                      objc_msgSend(v33, "setObject:atIndexedSubscript:", v32, objc_msgSend(v15, "rootSourceGradientTensorIndex") + v28 - 1);
                    }
                    unint64_t v8 = v48;
                    if (v27 > 1)
                    {
                      objc_super v34 = [v15 intermediateSumLayer];

                      if (!v34)
                      {
                        v47 = +[MLCArithmeticLayer layerWithOperation:0];
                        v46 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
                        v45 = objc_msgSend(v46, "objectAtIndexedSubscript:", objc_msgSend(v15, "rootSourceGradientTensorIndexStart") - 1);
                        v50[0] = v45;
                        v44 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
                        v43 = objc_msgSend(v44, "objectAtIndexedSubscript:", objc_msgSend(v15, "rootSourceGradientTensorIndexStart"));
                        v50[1] = v43;
                        objc_super v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
                        objc_super v36 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
                        v37 = objc_msgSend(v36, "objectAtIndexedSubscript:", objc_msgSend(v15, "rootSourceGradientTensorIndexStart") + 1);
                        [v47 compileForDevice:v4 sourceTensors:v35 resultTensor:v37];

                        [v15 setIntermediateSumLayer:v47];
                      }
                    }
                    v49 += v27;
                  }
                }
              }

              ++v13;
              v38 = [v10 sourceTensors];
              unint64_t v39 = [v38 count];
            }
            while (v13 < v39);
          }
        }
      }

      ++v8;
      v40 = [(MLCGraph *)self graphLayerList];
      unint64_t v41 = [v40 count];
    }
    while (v8 < v41);
  }

  return 1;
}

- (void)sumRootSourceGradientTensor:(id)a3 device:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  if ((unint64_t)[v31 rootSourceGradientTensorCount] >= 2)
  {
    uint64_t v7 = [v31 rootSourceGradientTensorIndex];
    uint64_t v8 = [v31 rootSourceGradientTensorIndexStart];
    unint64_t v9 = v8 - 1;
    uint64_t v28 = v8 - 2;
    if (v8 - 1 < (unint64_t)(v8 - 2 + [v31 rootSourceGradientTensorCount]))
    {
      uint64_t v10 = v7 - 1;
      id v27 = v6;
      do
      {
        unint64_t v11 = [v6 computeEngine];
        uint64_t v12 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
        unint64_t v13 = [v12 objectAtIndexedSubscript:v10];
        int v14 = [v11 needToAllocateDeviceMemoryForTensor:v13];

        if (v14)
        {
          BOOL v15 = [v6 computeEngine];
          uint64_t v16 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
          uint64_t v17 = [v16 objectAtIndexedSubscript:v10];
          [v15 allocateDeviceMemoryForTensor:v17];
        }
        uint64_t v18 = [v6 computeEngine];
        uint64_t v30 = [v31 intermediateSumLayer];
        uint64_t v19 = [v30 deviceOps];
        uint64_t v29 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
        unint64_t v20 = [v29 objectAtIndexedSubscript:v9];
        uint64_t v21 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
        uint64_t v22 = [v21 objectAtIndexedSubscript:v9 + 1];
        [(MLCTrainingGraph *)self rootSourceGradientTensor];
        v24 = v23 = self;
        unint64_t v25 = [v24 objectAtIndexedSubscript:v10];
        LOBYTE(v26) = 0;
        [v18 dispatchForwardLayer:v19 sourceTensor:v20 secondaryTensor:v22 tertiaryTensor:0 resultTensor:v25 resultStateIsTemporary:0 forTraining:v26];

        self = v23;
        id v6 = v27;

        ++v10;
        v9 += 2;
      }
      while (v9 < v28 + [v31 rootSourceGradientTensorCount]);
    }
  }
}

- (void)sumAllRootSourceGradientTensors:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(MLCGraph *)self compilerOptions] & 1) != 0
    || ([(MLCGraph *)self compilerOptions] & 8) != 0)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    unint64_t v13 = [(MLCGraph *)self allInputs];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * v17);
          uint64_t v19 = [(MLCGraph *)self allInputs];
          unint64_t v20 = [v19 objectForKeyedSubscript:v18];

          [(MLCTrainingGraph *)self sumRootSourceGradientTensor:v20 device:v4];
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }
  }
  else
  {
    v5 = [(MLCTrainingGraph *)self optimizerParameterList];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = [(MLCTrainingGraph *)self optimizerParameterList];
        unint64_t v9 = [v8 objectAtIndexedSubscript:v7];

        uint64_t v10 = [v9 tensor];
        [(MLCTrainingGraph *)self sumRootSourceGradientTensor:v10 device:v4];

        ++v7;
        unint64_t v11 = [(MLCTrainingGraph *)self optimizerParameterList];
        unint64_t v12 = [v11 count];
      }
      while (v7 < v12);
    }
  }
}

- (BOOL)allocateGradientTensorsForMultipleChildrenOfLayer:(id)a3 gradientTensorsAreTemporary:(BOOL)a4 device:(id)a5
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  unint64_t v8 = 0;
  unint64_t v9 = 0;
  while (1)
  {
    uint64_t v10 = [v6 resultTensors];
    unint64_t v11 = [v10 objectAtIndexedSubscript:0];
    unint64_t v12 = [v11 childLayers];
    unint64_t v13 = [v12 count];

    if (v8 >= v13) {
      break;
    }
    uint64_t v14 = [v6 resultTensors];
    uint64_t v15 = [v14 objectAtIndexedSubscript:0];
    uint64_t v16 = [v15 childLayers];
    uint64_t v17 = [v16 objectAtIndexedSubscript:v8];

    v9 += [v17 compileForInferenceOnly] ^ 1;
    ++v8;
  }
  if (v9 > 1)
  {
    uint64_t v18 = [v6 sourceGradientTensors];
    uint64_t v19 = [v18 objectAtIndexedSubscript:0];

    unint64_t v20 = 2 * v9 - 2;
    long long v21 = [v6 intermediateGradientTensors];
    uint64_t v22 = [v21 count];

    for (unint64_t i = v22 - (v22 != 0); i < v20; ++i)
    {
      long long v24 = [v19 descriptor];
      unint64_t v25 = +[MLCTensor tensorWithDescriptor:v24];
      uint64_t v26 = [v6 intermediateGradientTensors];
      [v26 setObject:v25 atIndexedSubscript:i];

      id v27 = [v6 intermediateGradientTensors];
      uint64_t v28 = [v27 objectAtIndexedSubscript:i];
      [v28 setDevice:v7];
    }
    uint64_t v29 = [v6 intermediateGradientTensors];
    [v29 setObject:v19 atIndexedSubscript:2 * v9 - 2];

    [v6 setZeroIntermediateGradientTensors:1];
    uint64_t v30 = [v6 intermediateSumLayer];

    if (!v30)
    {
      id v31 = +[MLCArithmeticLayer layerWithOperation:0];
      v32 = [v6 intermediateGradientTensors];
      objc_super v33 = [v32 objectAtIndexedSubscript:0];
      v38[0] = v33;
      objc_super v34 = [v6 intermediateGradientTensors];
      objc_super v35 = [v34 objectAtIndexedSubscript:1];
      v38[1] = v35;
      objc_super v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
      [v31 compileForDevice:v7 sourceTensors:v36 resultTensor:v19];

      [v6 setIntermediateSumLayer:v31];
    }
  }
  return v9 > 1;
}

- (BOOL)allocateGradientTensorsForMultipleChildrenOfSplitLayer:(id)a3 tensor:(id)a4 gradientTensorsAreTemporary:(BOOL)a5 device:(id)a6
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  unint64_t v11 = [v8 resultTensors];
  unint64_t v12 = [v11 count];

  unint64_t v13 = [v8 resultTensors];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    unint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = [v8 resultTensors];
      id v17 = [v16 objectAtIndexedSubscript:v15];

      if (v17 == v9) {
        break;
      }
      ++v15;
      uint64_t v18 = [v8 resultTensors];
      unint64_t v19 = [v18 count];

      if (v15 >= v19) {
        goto LABEL_7;
      }
    }
    unint64_t v12 = v15;
  }
LABEL_7:
  unint64_t v20 = [v8 resultTensors];
  unint64_t v21 = [v20 count];

  if (v12 < v21)
  {
    uint64_t v22 = [v8 sourceGradientTensors];
    long long v23 = [v22 objectAtIndexedSubscript:v12];

    long long v24 = [v8 intermediateGradientTensors];
    uint64_t v25 = [v24 count];

    uint64_t v26 = [v23 descriptor];
    id v27 = +[MLCTensor tensorWithDescriptor:v26];

    [v27 setDevice:v10];
    objc_msgSend(v27, "setSplitOffset:", objc_msgSend(v23, "splitOffset"));
    objc_msgSend(v27, "setSplitDimension:", objc_msgSend(v23, "splitDimension"));
    uint64_t v28 = [v8 intermediateGradientTensors];
    [v28 setObject:v27 atIndexedSubscript:v25];

    [v8 setZeroIntermediateGradientTensors:1];
    uint64_t v29 = [v8 intermediateSumLayer];

    if (!v29)
    {
      uint64_t v30 = +[MLCArithmeticLayer layerWithOperation:0];
      v33[0] = v23;
      v33[1] = v27;
      id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
      [v30 compileForDevice:v10 sourceTensors:v31 resultTensor:v27];

      [v8 setIntermediateSumLayer:v30];
    }
  }
  return v12 < v21;
}

- (void)sumIntermediateGradientTensorsForLayer:(id)a3
{
  id v73 = a3;
  if ([v73 intermediateGradientTensorIndex])
  {
    unint64_t v3 = 0;
    uint64_t v4 = 0;
    while (1)
    {
      v5 = [v73 resultTensors];
      id v6 = [v5 objectAtIndexedSubscript:0];
      id v7 = [v6 childLayers];
      unint64_t v8 = [v7 count];

      if (v3 >= v8) {
        break;
      }
      id v9 = [v73 resultTensors];
      id v10 = [v9 objectAtIndexedSubscript:0];
      unint64_t v11 = [v10 childLayers];
      unint64_t v12 = [v11 objectAtIndexedSubscript:v3];

      v4 += [v12 compileForInferenceOnly] ^ 1;
      ++v3;
    }
    char v13 = [v73 zeroIntermediateGradientTensors];
    uint64_t v14 = v73;
    if (v13)
    {
      [v73 setZeroIntermediateGradientTensors:0];
      uint64_t v14 = v73;
      if (v4)
      {
        uint64_t v15 = 0;
        while (1)
        {
          uint64_t v16 = [v14 device];
          id v17 = [v16 computeEngine];
          uint64_t v18 = [v73 intermediateGradientTensors];
          unint64_t v19 = [v18 objectAtIndexedSubscript:v15];
          char v20 = [v17 needToAllocateDeviceMemoryForTensor:v19];

          if (v20) {
            break;
          }
          ++v15;
          uint64_t v14 = v73;
          if (v4 == v15) {
            goto LABEL_16;
          }
        }
        unint64_t v21 = [v73 intermediateGradientTensors];
        uint64_t v22 = [v21 objectAtIndexedSubscript:v15];
        long long v23 = [v22 descriptor];
        long long v24 = malloc_type_calloc([v23 tensorAllocationSizeInBytes], 1uLL, 0x8014B21DuLL);

        uint64_t v25 = (void *)MEMORY[0x1E4F1C9B8];
        uint64_t v26 = [v73 intermediateGradientTensors];
        id v27 = [v26 objectAtIndexedSubscript:v15];
        uint64_t v28 = [v27 descriptor];
        uint64_t v29 = objc_msgSend(v25, "dataWithBytesNoCopy:length:freeWhenDone:", v24, objc_msgSend(v28, "tensorAllocationSizeInBytes"), 1);

        uint64_t v30 = v73;
        for (uint64_t i = 0; i != v4; ++i)
        {
          v32 = [v30 device];
          objc_super v33 = [v32 computeEngine];
          objc_super v34 = [v73 intermediateGradientTensors];
          objc_super v35 = [v34 objectAtIndexedSubscript:i];
          int v36 = [v33 needToAllocateDeviceMemoryForTensor:v35];

          if (v36)
          {
            v37 = [v73 device];
            v38 = [v37 computeEngine];
            unint64_t v39 = [v73 intermediateGradientTensors];
            v40 = [v39 objectAtIndexedSubscript:i];
            [v38 allocateDeviceMemoryForTensor:v40];

            unint64_t v41 = [v73 intermediateGradientTensors];
            v42 = [v41 objectAtIndexedSubscript:i];
            [v42 setData:v29];

            v43 = [v73 device];
            v44 = [v43 computeEngine];
            v45 = [v73 intermediateGradientTensors];
            v46 = [v45 objectAtIndexedSubscript:i];
            [v44 dispatchBroadcastTensor:v46];
          }
          uint64_t v30 = v73;
        }

        uint64_t v14 = v73;
      }
    }
LABEL_16:
    v47 = [v14 intermediateGradientTensors];
    uint64_t v48 = [v47 count];

    if (v48 != 1)
    {
      unint64_t v49 = 0;
      do
      {
        v50 = [v73 device];
        v51 = [v50 computeEngine];
        v52 = [v73 intermediateGradientTensors];
        v53 = [v52 objectAtIndexedSubscript:v4];
        int v54 = [v51 needToAllocateDeviceMemoryForTensor:v53];

        if (v54)
        {
          v55 = [v73 device];
          v56 = [v55 computeEngine];
          v57 = [v73 intermediateGradientTensors];
          v58 = [v57 objectAtIndexedSubscript:v4];
          [v56 allocateDeviceMemoryForTensor:v58];
        }
        v72 = [v73 device];
        v59 = [v72 computeEngine];
        v71 = [v73 intermediateSumLayer];
        v60 = [v71 deviceOps];
        v61 = [v73 intermediateGradientTensors];
        v62 = [v61 objectAtIndexedSubscript:v49];
        [v73 intermediateGradientTensors];
        v64 = uint64_t v63 = v4;
        v65 = [v64 objectAtIndexedSubscript:v49 + 1];
        v66 = [v73 intermediateGradientTensors];
        v67 = [v66 objectAtIndexedSubscript:v63];
        LOBYTE(v70) = 0;
        [v59 dispatchForwardLayer:v60 sourceTensor:v62 secondaryTensor:v65 tertiaryTensor:0 resultTensor:v67 resultStateIsTemporary:0 forTraining:v70];

        uint64_t v4 = v63 + 1;
        v68 = [v73 intermediateGradientTensors];
        unint64_t v69 = [v68 count] - 1;

        v49 += 2;
      }
      while (v49 < v69);
    }
  }
}

- (id)resultGradientTensorToUseByExecuteGradientForLayer:(id)a3 sourceIndex:(unint64_t)a4 incrementIntermediateIndex:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [v8 sourceTensors];
  id v10 = [v9 objectAtIndexedSubscript:a4];

  if (![v10 rootSourceGradientTensorIndex])
  {
    char v13 = [v8 sourceTensors];
    uint64_t v14 = [v13 objectAtIndexedSubscript:a4];
    uint64_t v15 = [v14 parentLayers];
    uint64_t v16 = [v15 objectAtIndexedSubscript:0];

    id v17 = [v16 intermediateGradientTensors];
    if ([v17 count])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        unint64_t v19 = [v16 intermediateGradientTensors];
        unint64_t v12 = objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v16, "intermediateGradientTensorIndex"));

        if (v5) {
          objc_msgSend(v16, "setIntermediateGradientTensorIndex:", objc_msgSend(v16, "intermediateGradientTensorIndex") + 1);
        }
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
    }
    char v20 = [v16 resultTensors];
    unint64_t v12 = (void *)[v20 count];

    if (v12)
    {
      unint64_t v21 = 0;
      unint64_t v12 = 0;
      do
      {
        uint64_t v22 = [v16 resultTensors];
        long long v23 = [v22 objectAtIndexedSubscript:v21];

        if (v23 == v10)
        {
          long long v24 = [v16 sourceGradientTensors];
          uint64_t v25 = [v24 objectAtIndexedSubscript:v21];

          unint64_t v12 = (void *)v25;
        }
        ++v21;
        uint64_t v26 = [v16 resultTensors];
        unint64_t v27 = [v26 count];
      }
      while (v21 < v27);
    }
    goto LABEL_15;
  }
  unint64_t v11 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
  unint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v10, "rootSourceGradientTensorIndex") - 1);

  if (v5 && (unint64_t)[v10 rootSourceGradientTensorCount] >= 2) {
    objc_msgSend(v10, "setRootSourceGradientTensorIndex:", objc_msgSend(v10, "rootSourceGradientTensorIndex") + 1);
  }
LABEL_16:

  return v12;
}

- (void)linkRelatedGradientTensorsForConcatLayer:(id)a3 device:(id)a4
{
  id v18 = a3;
  uint64_t v4 = [v18 dimension];
  BOOL v5 = [v18 sourceTensors];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      id v9 = [v18 resultGradientTensors];
      id v10 = [v9 objectAtIndexedSubscript:v8];

      [v10 setConcatOffset:v7];
      [v10 setConcatDimension:v4];
      unint64_t v11 = [v18 sourceTensors];
      unint64_t v12 = [v11 objectAtIndexedSubscript:v8];
      char v13 = [v12 descriptor];
      uint64_t v14 = [v13 shape];
      uint64_t v15 = [v14 objectAtIndexedSubscript:v4];
      v7 += [v15 unsignedIntegerValue];

      ++v8;
      uint64_t v16 = [v18 sourceTensors];
      unint64_t v17 = [v16 count];
    }
    while (v8 < v17);
  }
}

- (BOOL)setTrainingTensorParameters:(NSArray *)parameters
{
  BOOL v5 = parameters;
  uint64_t v6 = [(MLCTrainingGraph *)self optimizerParameterList];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = +[MLCLog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph setTrainingTensorParameters:](a2);
    }
LABEL_4:

    BOOL v9 = 0;
    goto LABEL_14;
  }
  if ([(NSArray *)v5 count])
  {
    uint64_t v10 = 0;
    while (1)
    {
      unint64_t v11 = [(NSArray *)v5 objectAtIndexedSubscript:v10];
      unint64_t v8 = [v11 tensor];

      unint64_t v12 = [v8 parentLayers];
      if ([v12 count]) {
        break;
      }
      char v13 = [v8 childLayers];
      [v13 count];

      if (++v10 >= [(NSArray *)v5 count]) {
        goto LABEL_9;
      }
    }

    unint64_t v19 = +[MLCLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph setTrainingTensorParameters:](a2);
    }

    goto LABEL_4;
  }
LABEL_9:
  uint64_t v14 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  [(MLCTrainingGraph *)self setOptimizerParameterList:v14];

  if (v5 && [(NSArray *)v5 count])
  {
    unint64_t v15 = 0;
    do
    {
      uint64_t v16 = [(NSArray *)v5 objectAtIndexedSubscript:v15];
      unint64_t v17 = [(MLCTrainingGraph *)self optimizerParameterList];
      [v17 setObject:v16 atIndexedSubscript:v15];

      ++v15;
    }
    while (v15 < [(NSArray *)v5 count]);
  }
  BOOL v9 = 1;
LABEL_14:

  return v9;
}

- (void)updateIsTrainableForLayerWithStopGradientTensor:(id)a3 checkChildLayers:(BOOL)a4
{
  BOOL v4 = a4;
  id v20 = a3;
  uint64_t v6 = [v20 parentLayers];
  uint64_t v7 = [v6 count];

  unint64_t v8 = v20;
  if (v7)
  {
    BOOL v9 = [v20 parentLayers];
    uint64_t v10 = [v9 objectAtIndexedSubscript:0];

    if ([v10 isTrainable])
    {
      if (!v4
        || ([v20 childLayers],
            unint64_t v11 = objc_claimAutoreleasedReturnValue(),
            unint64_t v12 = [v11 count],
            v11,
            v12 <= 1))
      {
        [v10 setIsTrainable:0];
        char v13 = [v10 sourceTensors];
        uint64_t v14 = [v13 count];

        if (v14)
        {
          unint64_t v15 = 0;
          do
          {
            uint64_t v16 = [v10 sourceTensors];
            unint64_t v17 = [v16 objectAtIndexedSubscript:v15];
            [(MLCTrainingGraph *)self updateIsTrainableForLayerWithStopGradientTensor:v17 checkChildLayers:1];

            ++v15;
            id v18 = [v10 sourceTensors];
            unint64_t v19 = [v18 count];
          }
          while (v15 < v19);
        }
      }
    }

    unint64_t v8 = v20;
  }
}

- (void)markLayersAsTrainable
{
  unint64_t v3 = [(MLCGraph *)self graphLayerList];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [(MLCGraph *)self graphLayerList];
      uint64_t v7 = [v6 objectAtIndexedSubscript:v5];

      if (([v7 compileForInferenceOnly] & 1) == 0) {
        [v7 setIsTrainable:1];
      }

      ++v5;
      unint64_t v8 = [(MLCGraph *)self graphLayerList];
      unint64_t v9 = [v8 count];
    }
    while (v5 < v9);
  }
}

- (void)updateTrainableLayerList:(BOOL)a3
{
  [(MLCTrainingGraph *)self markLayersAsTrainable];
  unint64_t v5 = [(MLCTrainingGraph *)self stopGradientTensorList];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      unint64_t v8 = [(MLCTrainingGraph *)self stopGradientTensorList];
      unint64_t v9 = [v8 objectAtIndexedSubscript:v7];
      [(MLCTrainingGraph *)self updateIsTrainableForLayerWithStopGradientTensor:v9 checkChildLayers:0];

      ++v7;
      uint64_t v10 = [(MLCTrainingGraph *)self stopGradientTensorList];
      unint64_t v11 = [v10 count];
    }
    while (v7 < v11);
  }
  if (([(MLCGraph *)self compilerOptions] & 1) != 0
    || ([(MLCGraph *)self compilerOptions] & 8) != 0)
  {
    [(MLCTrainingGraph *)self setFirstTrainableLayerIndex:0];
  }
  else
  {
    unint64_t v12 = [(MLCGraph *)self graphLayerList];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      unint64_t v14 = 0;
      while (1)
      {
        unint64_t v15 = [(MLCGraph *)self graphLayerList];
        id v22 = [v15 objectAtIndexedSubscript:v14];

        if (([v22 skipLayer] & 1) == 0)
        {
          if ([v22 isTrainable])
          {
            uint64_t v16 = [(MLCTrainingGraph *)self optimizerParameterList];
            uint64_t v17 = [v16 count];

            if (v17) {
              break;
            }
            if ([v22 isDebuggingEnabled]) {
              break;
            }
            if (a3) {
              break;
            }
            if ([v22 isUpdatable]) {
              break;
            }
            id v18 = [(MLCGraph *)self graphLayerList];
            unint64_t v19 = [v18 count] - 1;

            if (v14 >= v19) {
              break;
            }
          }
        }

        ++v14;
        id v20 = [(MLCGraph *)self graphLayerList];
        unint64_t v21 = [v20 count];

        if (v14 >= v21) {
          return;
        }
      }
      [(MLCTrainingGraph *)self setFirstTrainableLayerIndex:v14];
    }
  }
}

- (void)allocateGradientTensorsForLayersInGraph:(BOOL)a3
{
  if ([(MLCGraph *)self compilerOptions]) {
    LOBYTE(v5) = 1;
  }
  else {
    unint64_t v5 = ([(MLCGraph *)self compilerOptions] >> 3) & 1;
  }
  unint64_t v6 = [(MLCTrainingGraph *)self firstTrainableLayerIndex];
  unint64_t v7 = [(MLCGraph *)self graphLayerList];
  unint64_t v8 = [v7 count];

  if (v6 < v8)
  {
    char v39 = v5 | a3;
    while (1)
    {
      unint64_t v9 = [(MLCGraph *)self graphLayerList];
      uint64_t v10 = [v9 objectAtIndexedSubscript:v6];

      unint64_t v11 = [v10 device];
      if (([v10 skipLayer] & 1) == 0)
      {
        if ([v10 isTrainable])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
        }
      }
LABEL_26:

      ++v6;
      uint64_t v30 = [(MLCGraph *)self graphLayerList];
      unint64_t v31 = [v30 count];

      if (v6 >= v31) {
        goto LABEL_27;
      }
    }
    [v10 allocateGradientsForParameters];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [(MLCTrainingGraph *)self allocateGradientTensorsForMultipleChildrenOfLayer:v10 gradientTensorsAreTemporary:0 device:v11];
    }
    unint64_t v12 = [v10 sourceTensors];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      unint64_t v14 = 0;
      char v15 = 1;
      do
      {
        uint64_t v16 = [v10 sourceTensors];
        uint64_t v17 = [v16 objectAtIndexedSubscript:v14];
        char v18 = [v17 computeFlags];

        if ((v18 & 8) == 0)
        {
          unint64_t v19 = [(MLCTrainingGraph *)self resultGradientTensorToUseByExecuteGradientForLayer:v10 sourceIndex:v14 incrementIntermediateIndex:1];
          id v20 = [v10 resultGradientTensors];
          [v20 setObject:v19 atIndexedSubscript:v14];

          unint64_t v21 = [v10 sourceTensors];
          id v22 = [v21 objectAtIndexedSubscript:v14];
          long long v23 = [v22 parentLayers];
          uint64_t v24 = [v23 count];

          v15 &= v24 == 0;
        }
        ++v14;
        uint64_t v25 = [v10 sourceTensors];
        unint64_t v26 = [v25 count];
      }
      while (v14 < v26);
    }
    else
    {
      char v15 = 1;
    }
    if (!(v39 & 1 | ((v15 & 1) == 0)))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v27 = [v10 device];
        uint64_t v28 = [v27 computeEngine];
        uint64_t v29 = [v10 deviceOps];
        [v28 setConvolutionGradientComputeWeightsAndBiasOnly:v29];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_24;
        }
        unint64_t v27 = [v10 device];
        uint64_t v28 = [v27 computeEngine];
        uint64_t v29 = [v10 deviceOps];
        [v28 setFullyConnectedGradientComputeWeightsAndBiasOnly:v29];
      }
    }
LABEL_24:
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MLCTrainingGraph *)self linkRelatedGradientTensorsForConcatLayer:v10 device:v11];
    }
    goto LABEL_26;
  }
LABEL_27:
  unint64_t v32 = [(MLCTrainingGraph *)self firstTrainableLayerIndex];
  objc_super v33 = [(MLCGraph *)self graphLayerList];
  unint64_t v34 = [v33 count];

  if (v32 < v34)
  {
    do
    {
      objc_super v35 = [(MLCGraph *)self graphLayerList];
      int v36 = [v35 objectAtIndexedSubscript:v32];

      if ([v36 isTrainable])
      {
        if (([v36 skipLayer] & 1) == 0)
        {
          objc_opt_class();
          objc_opt_isKindOfClass();
        }
      }

      ++v32;
      v37 = [(MLCGraph *)self graphLayerList];
      unint64_t v38 = [v37 count];
    }
    while (v32 < v38);
  }
}

- (BOOL)compileOptimizer:(MLCOptimizer *)optimizer
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = optimizer;
  unint64_t v5 = [(MLCOptimizer *)v4 deviceOps];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = [(MLCOptimizer *)v4 device];
    unint64_t v8 = [(MLCGraph *)self device];

    if (v7 != v8)
    {
      unint64_t v9 = +[MLCLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[MLCTrainingGraph compileOptimizer:]();
      }
LABEL_16:

      BOOL v18 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v10 = [(MLCGraph *)self device];

    if (!v10)
    {
      unint64_t v9 = +[MLCLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[MLCTrainingGraph compileOptimizer:]();
      }
      goto LABEL_16;
    }
    unint64_t v11 = +[MLCLog execution];
    os_signpost_id_t v12 = os_signpost_id_generate(v11);

    uint64_t v13 = +[MLCLog execution];
    unint64_t v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      int v20 = 138543362;
      unint64_t v21 = v4;
      _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CompileOptimizer", "%{public,name=Optimizer}@ ", (uint8_t *)&v20, 0xCu);
    }

    char v15 = [(MLCGraph *)self device];
    [(MLCOptimizer *)v4 compileForDevice:v15];

    uint64_t v16 = +[MLCLog execution];
    uint64_t v17 = v16;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      LOWORD(v20) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v17, OS_SIGNPOST_INTERVAL_END, v12, "CompileOptimizer", "", (uint8_t *)&v20, 2u);
    }
  }
  [(MLCTrainingGraph *)self setOptimizer:v4];
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (BOOL)compileAndAllocateGradientTensorsForGraph:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MLCTrainingGraph *)self allocateResultGradientTensors])
  {
    unint64_t v5 = +[MLCLog execution];
    os_signpost_id_t v6 = os_signpost_id_generate(v5);

    unint64_t v7 = +[MLCLog execution];
    unint64_t v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CompileAndAllocateGradientTensors", "", buf, 2u);
    }

    unint64_t v9 = [(MLCGraph *)self device];
    [(MLCTrainingGraph *)self allocateRootSourceGradientTensors:v9];

    [(MLCTrainingGraph *)self allocateGradientTensorsForLayersInGraph:v3];
    [(MLCTrainingGraph *)self setAllocateResultGradientTensors:0];
    uint64_t v10 = +[MLCLog execution];
    unint64_t v11 = v10;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v11, OS_SIGNPOST_INTERVAL_END, v6, "CompileAndAllocateGradientTensors", "", v13, 2u);
    }
  }
  return 1;
}

- (BOOL)allocateOptimizerDataForGraph
{
  if ([(MLCTrainingGraph *)self allocateOptimizerData])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    [(MLCTrainingGraph *)self setOptimizerUpdateLayerList:v4];

    unint64_t v5 = (void *)[v3 mutableCopy];
    unint64_t v6 = [(MLCTrainingGraph *)self firstTrainableLayerIndex];
    unint64_t v7 = [(MLCGraph *)self graphLayerList];
    unint64_t v8 = [v7 count];

    if (v6 >= v8)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = 0;
      do
      {
        uint64_t v10 = [(MLCGraph *)self graphLayerList];
        unint64_t v11 = [v10 objectAtIndexedSubscript:v6];

        if ([v11 isUpdatable])
        {
          if ([v11 isTrainable])
          {
            os_signpost_id_t v12 = [(MLCTrainingGraph *)self optimizer];

            if (v12)
            {
              uint64_t v13 = [(MLCTrainingGraph *)self optimizer];
              [v11 allocateDataForOptimizer:v13];

              unint64_t v14 = [(MLCTrainingGraph *)self optimizerUpdateLayerList];
              [v14 addObject:v11];

              v9 += [v11 parametersCount];
              char v15 = [v11 device];
              [v5 addObject:v15];
            }
          }
        }

        ++v6;
        uint64_t v16 = [(MLCGraph *)self graphLayerList];
        unint64_t v17 = [v16 count];
      }
      while (v6 < v17);
    }
    BOOL v18 = [(MLCTrainingGraph *)self optimizerParameterList];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      unint64_t v20 = 0;
      do
      {
        unint64_t v21 = [(MLCTrainingGraph *)self optimizerParameterList];
        uint64_t v22 = [v21 objectAtIndexedSubscript:v20];

        long long v23 = [(MLCTrainingGraph *)self optimizer];
        uint64_t v24 = [(MLCGraph *)self device];
        [v22 allocateDataForOptimizer:v23 device:v24 isVector:0];

        uint64_t v25 = [v22 device];
        [v5 addObject:v25];

        ++v20;
        unint64_t v26 = [(MLCTrainingGraph *)self optimizerParameterList];
        unint64_t v27 = [v26 count];
      }
      while (v20 < v27);
      v9 += v20;
    }
    uint64_t v28 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    [(MLCTrainingGraph *)self setOptimizerUpdateDeviceList:v28];

    [(MLCTrainingGraph *)self setAllocateOptimizerData:0];
    if (v9)
    {
      uint64_t v29 = [(MLCTrainingGraph *)self optimizer];
      uint64_t v30 = [v29 device];
      unint64_t v31 = [v30 computeEngine];
      unint64_t v32 = [(MLCTrainingGraph *)self optimizer];
      [v31 allocateDeviceDataForGlobalNormClippingWithOptimizer:v32 updatableParameterCount:v9];
    }
  }
  return 1;
}

- (BOOL)bindOptimizerData:(NSArray *)data deviceData:(NSArray *)deviceData withTensor:(MLCTensor *)tensor
{
  unint64_t v8 = tensor;
  BOOL v9 = [(MLCTensor *)v8 bindOptimizerData:data deviceData:deviceData];
  if (v9)
  {
    uint64_t v10 = [(MLCTrainingGraph *)self optimizer];
    if (v10)
    {
      unint64_t v11 = (void *)v10;
      uint64_t v12 = [(MLCTrainingGraph *)self optimizer];
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        BOOL v14 = [(MLCTrainingGraph *)self allocateOptimizerData];

        if (v14) {
          goto LABEL_20;
        }
      }
      else
      {
      }
      if ([(MLCTensor *)v8 isLayerParameter])
      {
        char v15 = [(MLCTensor *)v8 childLayers];
        uint64_t v16 = [v15 count];

        if (v16)
        {
          unint64_t v17 = 0;
          do
          {
            BOOL v18 = [(MLCTensor *)v8 childLayers];
            uint64_t v19 = [v18 objectAtIndexedSubscript:v17];

            if ([v19 isUpdatable] && objc_msgSend(v19, "isTrainable"))
            {
              unint64_t v20 = [(MLCTrainingGraph *)self optimizer];
              [v19 allocateDataForOptimizer:v20];
            }
            ++v17;
            unint64_t v21 = [(MLCTensor *)v8 childLayers];
            unint64_t v22 = [v21 count];
          }
          while (v17 < v22);
        }
      }
      else
      {
        long long v23 = [(MLCTrainingGraph *)self optimizerParameterList];
        uint64_t v24 = [v23 count];

        if (v24)
        {
          unint64_t v25 = 0;
          do
          {
            unint64_t v26 = [(MLCTrainingGraph *)self optimizerParameterList];
            unint64_t v27 = [v26 objectAtIndexedSubscript:v25];

            uint64_t v28 = [v27 tensor];

            if (v28 == v8)
            {
              uint64_t v29 = [(MLCTrainingGraph *)self optimizer];
              uint64_t v30 = [(MLCGraph *)self device];
              [v27 allocateDataForOptimizer:v29 device:v30 isVector:0];
            }
            ++v25;
            unint64_t v31 = [(MLCTrainingGraph *)self optimizerParameterList];
            unint64_t v32 = [v31 count];
          }
          while (v25 < v32);
        }
      }
    }
  }
LABEL_20:

  return v9;
}

- (BOOL)recompileWithOptions:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (![(MLCGraph *)self recompileAfterLinking]
    || ([(MLCGraph *)self setRecompileAfterLinking:0],
        ([(MLCGraph *)self compilerOptions] & 1) != 0)
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
        unint64_t v11 = +[MLCLog execution];
        os_signpost_id_t v8 = os_signpost_id_generate(v11);
      }
      else
      {
        os_signpost_id_t v8 = 0;
      }
      uint64_t v12 = +[MLCLog execution];
      uint64_t v13 = v12;
      unint64_t v14 = v8 - 1;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RecompileTrainingGraph", "", buf, 2u);
      }
      os_signpost_id_t spid = v8;

      char v15 = [(MLCGraph *)self device];
      uint64_t v16 = [v15 computeEngine];
      unint64_t v17 = [(MLCGraph *)self graphLayerList];
      BOOL v18 = [(MLCTrainingGraph *)self stopGradientTensorList];
      [v16 fuseLayersForTrainingGraph:v17 stopGradientTensorList:v18];

      uint64_t v19 = [(MLCGraph *)self graphLayerList];
      uint64_t v20 = [v19 count];

      if (v20)
      {
        unint64_t v21 = 0;
        uint64_t v22 = 0;
        do
        {
          long long v23 = [(MLCGraph *)self graphLayerList];
          uint64_t v24 = [v23 objectAtIndexedSubscript:v21];

          unint64_t v25 = [v24 fusedLayers];
          uint64_t v26 = [v25 count];

          if (v26)
          {
            ++v22;
            unint64_t v27 = [v24 device];
            uint64_t v28 = [v24 sourceTensors];
            uint64_t v29 = [v24 resultTensors];
            uint64_t v30 = [v29 objectAtIndexedSubscript:0];
            [v24 compileForDevice:v27 sourceTensors:v28 resultTensor:v30];

            [v24 allocateGradientsForParameters];
            if (![(MLCTrainingGraph *)self allocateOptimizerData])
            {
              if ([v24 isUpdatable])
              {
                if ([v24 isTrainable])
                {
                  unint64_t v31 = [(MLCTrainingGraph *)self optimizer];

                  if (v31)
                  {
                    unint64_t v32 = [(MLCTrainingGraph *)self optimizer];
                    [v24 allocateDataForOptimizer:v32];
                  }
                }
              }
              objc_super v33 = [v24 fusedLayers];
              uint64_t v34 = [v33 count];

              if (v34)
              {
                unint64_t v35 = 0;
                do
                {
                  int v36 = [v24 fusedLayers];
                  v37 = [v36 objectAtIndexedSubscript:v35];

                  if ([v37 isUpdatable])
                  {
                    if ([v37 isTrainable])
                    {
                      unint64_t v38 = [(MLCTrainingGraph *)self optimizer];

                      if (v38)
                      {
                        char v39 = [(MLCTrainingGraph *)self optimizer];
                        [v37 allocateDataForOptimizer:v39];
                      }
                    }
                  }

                  ++v35;
                  v40 = [v24 fusedLayers];
                  unint64_t v41 = [v40 count];
                }
                while (v35 < v41);
              }
            }
          }

          ++v21;
          v42 = [(MLCGraph *)self graphLayerList];
          unint64_t v43 = [v42 count];
        }
        while (v21 < v43);
      }
      else
      {
        uint64_t v22 = 0;
      }
      v44 = [(MLCGraph *)self device];
      v45 = [v44 computeEngine];
      v46 = [(MLCGraph *)self graphLayerList];
      [v45 optimizeComputationForTrainingGraph:v46];

      v47 = +[MLCLog execution];
      uint64_t v10 = v47;
      if (v14 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v47))
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v50 = v22;
        _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v10, OS_SIGNPOST_INTERVAL_END, spid, "RecompileTrainingGraph", "%{public,name=LayersRecompiled}lu", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v10 = +[MLCLog framework];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MLCTrainingGraph recompileWithOptions:](a2);
      }
    }
  }
  return v7;
}

- (BOOL)compileWithOptions:(MLCGraphCompilationOptions)options device:(MLCDevice *)device
{
  return [(MLCTrainingGraph *)self compileWithOptions:options device:device inputTensors:0 inputTensorsData:0];
}

- (BOOL)compileWithOptions:(MLCGraphCompilationOptions)options device:(MLCDevice *)device inputTensors:(NSDictionary *)inputTensors inputTensorsData:(NSDictionary *)inputTensorsData
{
  uint64_t v179 = *MEMORY[0x1E4F143B8];
  unint64_t v11 = device;
  uint64_t v12 = inputTensors;
  uint64_t v13 = inputTensorsData;
  if ([(MLCDevice *)v11 type] == MLCDeviceTypeANE)
  {
    unint64_t v14 = +[MLCLog framework];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:](a2);
    }
    goto LABEL_4;
  }
  if ([(MLCGraph *)self readyForExecution])
  {
    unint64_t v14 = +[MLCLog framework];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:](a2);
    }
    BOOL v15 = 1;
    goto LABEL_109;
  }
  if (v12 && !v13)
  {
    unint64_t v14 = +[MLCLog framework];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:](a2);
    }
    goto LABEL_4;
  }
  uint64_t v16 = +[MLCLog execution];
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  BOOL v18 = +[MLCLog execution];
  uint64_t v19 = v18;
  os_signpost_id_t spid = v17;
  unint64_t v166 = v17 - 1;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    uint64_t v20 = (objc_class *)objc_opt_class();
    unint64_t v21 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138543618;
    v176 = v21;
    __int16 v177 = 2050;
    MLCGraphCompilationOptions v178 = options;
    _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "CompileWithOptions", "%{public,name=Device}@ %{public,name=Options}llu", buf, 0x16u);
  }
  uint64_t v22 = [(MLCGraph *)self graphLayerList];
  uint64_t v23 = [v22 count];

  v167 = v13;
  if (!v23)
  {
    char v168 = 0;
    goto LABEL_30;
  }
  MLCGraphCompilationOptions v24 = options;
  char v25 = 0;
  char v168 = 0;
  unint64_t v26 = 0;
  do
  {
    unint64_t v27 = [(MLCGraph *)self graphLayerList];
    uint64_t v28 = [v27 objectAtIndexedSubscript:v26];
    int v29 = [v28 compileForInferenceOnly];

    if (v29)
    {
      unint64_t v14 = +[MLCLog framework];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v161 = NSStringFromSelector(aSelector);
        v162 = [(MLCGraph *)self graphLayerList];
        v163 = [v162 objectAtIndexedSubscript:v26];
        *(_DWORD *)buf = 138412546;
        v176 = v161;
        __int16 v177 = 2112;
        MLCGraphCompilationOptions v178 = (MLCGraphCompilationOptions)v163;
        _os_log_error_impl(&dword_1DD0C9000, v14, OS_LOG_TYPE_ERROR, "%@: Compiling a layer (%@) in graph that has already been compiled with for inference.  Please compile training graph before creating and compiling associated inference graph", buf, 0x16u);
      }
      goto LABEL_107;
    }
    uint64_t v30 = [(MLCGraph *)self graphLayerList];
    unint64_t v31 = [v30 objectAtIndexedSubscript:v26];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_super v33 = [(MLCGraph *)self graphLayerList];
      uint64_t v34 = [v33 objectAtIndexedSubscript:v26];

      unint64_t v35 = [v34 descriptor];
      char v36 = [v35 scalesGradientByFrequency];

      if ([(MLCDevice *)v11 type] == MLCDeviceTypeAny || [(MLCDevice *)v11 type] == MLCDeviceTypeGPU) {
        char v168 = 1;
      }
      v25 |= v36;
    }
    ++v26;
    v37 = [(MLCGraph *)self graphLayerList];
    unint64_t v38 = [v37 count];
  }
  while (v26 < v38);
  uint64_t v13 = v167;
  if ((v25 & 1) == 0)
  {
    options = v24;
    if (v12) {
      goto LABEL_31;
    }
    goto LABEL_40;
  }
  options = v24;
  if ([(MLCDevice *)v11 type] != MLCDeviceTypeAny)
  {
LABEL_30:
    if (!v12) {
      goto LABEL_40;
    }
    goto LABEL_31;
  }
  [(MLCDevice *)v11 switchToCPUDevice];
  if (!v12) {
    goto LABEL_40;
  }
LABEL_31:
  if (v13)
  {
    long long v172 = 0u;
    long long v173 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    char v39 = v13;
    uint64_t v40 = [(NSDictionary *)v39 countByEnumeratingWithState:&v170 objects:v174 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v171;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v171 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = [(NSDictionary *)v12 objectForKeyedSubscript:*(void *)(*((void *)&v170 + 1) + 8 * i)];
          objc_msgSend(v44, "setComputeFlags:", objc_msgSend(v44, "computeFlags") | 2);
        }
        uint64_t v41 = [(NSDictionary *)v39 countByEnumeratingWithState:&v170 objects:v174 count:16];
      }
      while (v41);
    }

    [(MLCGraph *)self bindAndWriteData:v39 forInputs:v12 toDevice:v11 synchronous:1];
  }
LABEL_40:
  v45 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  [(MLCTrainingGraph *)self setLossLayersInTrainingGraph:v45];

  [(MLCGraph *)self setCompilerOptions:options];
  if (!((2 * (options & 1)) | options & 6))
  {
    v46 = [(MLCDevice *)v11 computeEngine];
    v47 = [(MLCGraph *)self graphLayerList];
    uint64_t v48 = [(MLCTrainingGraph *)self stopGradientTensorList];
    [v46 fuseLayersForTrainingGraph:v47 stopGradientTensorList:v48];
  }
  unint64_t v49 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  [(MLCGraph *)self setLstmLayerIndexList:v49];

  uint64_t v50 = [(MLCGraph *)self graphLayerList];
  uint64_t v51 = [v50 count];

  if (v51)
  {
    unint64_t v52 = 0;
    char v169 = options;
    do
    {
      v53 = [(MLCGraph *)self graphLayerList];
      int v54 = [v53 objectAtIndexedSubscript:v52];

      if (options) {
        [v54 setIsDebuggingEnabled:1];
      }
      if (([v54 skipLayer] & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v55 = [NSNumber numberWithUnsignedInteger:v52];
          v56 = [(MLCGraph *)self lstmLayerIndexList];
          v57 = [(MLCGraph *)self lstmLayerIndexList];
          objc_msgSend(v56, "setObject:atIndexedSubscript:", v55, objc_msgSend(v57, "count"));
        }
        if ([(MLCDevice *)v11 type])
        {
          v58 = [v54 deviceOps];
          uint64_t v59 = [v58 count];

          if (!v59)
          {
            v60 = [v54 resultTensors];
            uint64_t v61 = [v60 count];

            if (v61)
            {
              unint64_t v62 = 0;
              do
              {
                uint64_t v63 = [v54 resultTensors];
                v64 = [v63 objectAtIndexedSubscript:v62];
                v65 = [v64 deviceMemory];
                uint64_t v66 = [v65 count];

                if (v66)
                {
                  v67 = [v54 resultTensors];
                  v68 = [v67 objectAtIndexedSubscript:v62];
                  unint64_t v69 = [v68 deviceMemory];
                  [v69 removeAllObjects];
                }
                ++v62;
                uint64_t v70 = [v54 resultTensors];
                unint64_t v71 = [v70 count];
              }
              while (v62 < v71);
            }
            v72 = [v54 resultGradientTensors];
            uint64_t v73 = [v72 count];

            if (v73)
            {
              unint64_t v74 = 0;
              do
              {
                v75 = [v54 resultGradientTensors];
                v76 = [v75 objectAtIndexedSubscript:v74];
                v77 = [v76 deviceMemory];
                uint64_t v78 = [v77 count];

                if (v78)
                {
                  v79 = [v54 resultGradientTensors];
                  v80 = [v79 objectAtIndexedSubscript:v74];
                  v81 = [v80 deviceMemory];
                  [v81 removeAllObjects];
                }
                ++v74;
                v82 = [v54 resultGradientTensors];
                unint64_t v83 = [v82 count];
              }
              while (v74 < v83);
            }
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v84 = [v54 resultTensors];
          uint64_t v85 = [v84 count];

          if (v85)
          {
            v86 = [v54 resultTensors];
            v87 = [v86 objectAtIndexedSubscript:0];
            v88 = [v87 deviceMemory];
            [v88 removeAllObjects];
          }
        }
        objc_opt_class();
        LOBYTE(options) = v169;
        if (objc_opt_isKindOfClass()) {
          [(MLCGraph *)self linkRelatedTensorsForConcatLayer:v54 device:v11];
        }
      }

      ++v52;
      v89 = [(MLCGraph *)self graphLayerList];
      unint64_t v90 = [v89 count];
    }
    while (v52 < v90);
  }
  v91 = [(MLCGraph *)self graphLayerList];
  uint64_t v92 = [v91 count];

  if (!v92)
  {
LABEL_89:
    v125 = [(MLCTrainingGraph *)self lossLayersInTrainingGraph];
    uint64_t v126 = [v125 count];

    if (v126)
    {
      unint64_t v127 = 0;
      char v128 = 0;
      do
      {
        v129 = [(MLCTrainingGraph *)self lossLayersInTrainingGraph];
        v130 = [v129 objectAtIndexedSubscript:v127];
        objc_opt_class();
        char v131 = objc_opt_isKindOfClass();

        v128 |= v131;
        ++v127;
        v132 = [(MLCTrainingGraph *)self lossLayersInTrainingGraph];
        unint64_t v133 = [v132 count];
      }
      while (v127 < v133);
      if (v128)
      {
        v134 = [(MLCGraph *)self graphLayerList];
        v135 = [(MLCGraph *)self graphLayerList];
        v136 = objc_msgSend(v134, "objectAtIndexedSubscript:", objc_msgSend(v135, "count") - 1);
        objc_opt_class();
        char v137 = objc_opt_isKindOfClass();

        if ((v137 & 1) == 0)
        {
          v157 = +[MLCLog framework];
          if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR)) {
            -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.4(aSelector);
          }

          v158 = +[MLCLog execution];
          unint64_t v14 = v158;
          uint64_t v13 = v167;
          if (v166 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v158)) {
            goto LABEL_4;
          }
          *(_WORD *)buf = 0;
LABEL_128:
          _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v14, OS_SIGNPOST_INTERVAL_END, spid, "CompileWithOptions", "", buf, 2u);
          goto LABEL_4;
        }
      }
    }
    [(MLCGraph *)self setDevice:v11];
    if (([(MLCGraph *)self compilerOptions] >> 2) & 1 | v168 & 1
      || ![(MLCGraph *)self staticBatchSizeInGraph])
    {
      v138 = [(MLCDevice *)v11 computeEngine];
      char v139 = objc_opt_respondsToSelector();

      if (v139)
      {
        v140 = [(MLCDevice *)v11 computeEngine];
        [v140 selectDevicesWithBatchSize:1];
      }
    }
    v141 = [(MLCTrainingGraph *)self optimizer];

    if (!v141
      || ([(MLCTrainingGraph *)self optimizer],
          v142 = objc_claimAutoreleasedReturnValue(),
          BOOL v143 = [(MLCTrainingGraph *)self compileOptimizer:v142],
          v142,
          v143))
    {
      v144 = [(MLCDevice *)v11 computeEngine];
      char v145 = objc_opt_respondsToSelector();

      if (v145)
      {
        v146 = [(MLCDevice *)v11 computeEngine];
        v147 = [(MLCGraph *)self graphLayerList];
        [v146 allocateDeviceHeapForGraph:v147 forInference:0];
      }
      [(MLCTrainingGraph *)self markLayersAsTrainable];
      v148 = [(MLCGraph *)self device];
      v149 = [v148 computeEngine];
      v150 = [(MLCGraph *)self graphLayerList];
      [v149 optimizeComputationForTrainingGraph:v150];

      BOOL v15 = 1;
      [(MLCTrainingGraph *)self updateTrainableLayerList:1];
      [(MLCGraph *)self setReadyForExecution:1];
      [(MLCGraph *)self setAllocateDeviceMemoryForTensorsInGraph:[(MLCDevice *)v11 type] != MLCDeviceTypeANE];
      v151 = +[MLCLog execution];
      unint64_t v14 = v151;
      if (v166 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        uint64_t v13 = v167;
        if (os_signpost_enabled(v151))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v14, OS_SIGNPOST_INTERVAL_END, spid, "CompileWithOptions", "", buf, 2u);
        }
        goto LABEL_109;
      }
LABEL_108:
      uint64_t v13 = v167;
      goto LABEL_109;
    }
    v153 = +[MLCLog execution];
    unint64_t v14 = v153;
    if (v166 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v13 = v167;
      if (!os_signpost_enabled(v153)) {
        goto LABEL_4;
      }
      *(_WORD *)buf = 0;
      goto LABEL_128;
    }
LABEL_107:
    BOOL v15 = 0;
    goto LABEL_108;
  }
  unint64_t v93 = 0;
  unint64_t v94 = 0x1E6CB4000uLL;
  while (1)
  {
    v95 = [(MLCGraph *)self graphLayerList];
    unint64_t v14 = [v95 objectAtIndexedSubscript:v93];

    if (![v14 skipLayer]) {
      break;
    }
    [v14 setDevice:v11];
LABEL_88:

    ++v93;
    v123 = [(MLCGraph *)self graphLayerList];
    unint64_t v124 = [v123 count];

    if (v93 >= v124) {
      goto LABEL_89;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v154 = +[MLCLog framework];
    if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.5(aSelector);
    }
    uint64_t v13 = v167;
    goto LABEL_135;
  }
  v96 = [v14 deviceOps];
  uint64_t v97 = [v96 count];

  if (v97)
  {
    v98 = [v14 device];
    char v99 = [v98 isEqual:v11];

    if ((v99 & 1) == 0)
    {
      v159 = +[MLCLog framework];
      if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR)) {
        -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.7();
      }

      v160 = +[MLCLog execution];
      v154 = v160;
      uint64_t v13 = v167;
      if (v166 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v160))
      {
        *(_WORD *)buf = 0;
        goto LABEL_134;
      }
      goto LABEL_135;
    }
    [v14 setDevice:v11];
    goto LABEL_80;
  }
  if (![v14 isValidTrainingParameters]) {
    goto LABEL_118;
  }
  unint64_t v100 = v94;
  objc_opt_class();
  char v101 = objc_opt_isKindOfClass();
  v102 = [v14 sourceTensors];
  v103 = [v14 resultTensors];
  v104 = v103;
  if (v101)
  {
    char v105 = [v14 compileForDevice:v11 sourceTensors:v102 resultTensors:v103];

    unint64_t v94 = v100;
    if ((v105 & 1) == 0) {
      goto LABEL_118;
    }
    goto LABEL_80;
  }
  v106 = [v103 objectAtIndexedSubscript:0];
  char v107 = [v14 compileForDevice:v11 sourceTensors:v102 resultTensor:v106];

  unint64_t v94 = v100;
  if (v107)
  {
LABEL_80:
    v108 = [v14 resultTensors];
    uint64_t v109 = [v108 count];

    if (v109)
    {
      unint64_t v110 = 0;
      do
      {
        v111 = [v14 resultTensors];
        v112 = [v111 objectAtIndexedSubscript:v110];
        [v112 setDevice:v11];

        ++v110;
        v113 = [v14 resultTensors];
        unint64_t v114 = [v113 count];
      }
      while (v110 < v114);
    }
    v115 = [v14 sourceGradientTensors];
    uint64_t v116 = [v115 count];

    if (v116)
    {
      unint64_t v117 = 0;
      do
      {
        v118 = [v14 sourceGradientTensors];
        v119 = [v118 objectAtIndexedSubscript:v117];
        [v119 setDevice:v11];

        ++v117;
        v120 = [v14 sourceGradientTensors];
        unint64_t v121 = [v120 count];
      }
      while (v117 < v121);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v122 = [(MLCTrainingGraph *)self lossLayersInTrainingGraph];
      [v122 addObject:v14];
    }
    goto LABEL_88;
  }
LABEL_118:
  v155 = +[MLCLog framework];
  if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR)) {
    -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.6();
  }

  v156 = +[MLCLog execution];
  v154 = v156;
  uint64_t v13 = v167;
  if (v166 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v156))
  {
    *(_WORD *)buf = 0;
LABEL_134:
    _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v154, OS_SIGNPOST_INTERVAL_END, spid, "CompileWithOptions", "", buf, 2u);
  }
LABEL_135:

LABEL_4:
  BOOL v15 = 0;
LABEL_109:

  return v15;
}

- (BOOL)stopGradientForTensors:(NSArray *)tensors
{
  unint64_t v5 = tensors;
  if ([(MLCGraph *)self readyForExecution])
  {
    unint64_t v6 = +[MLCLog framework];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph stopGradientForTensors:](a2);
    }
LABEL_11:

    BOOL v11 = 0;
    goto LABEL_12;
  }
  if (![(MLCTrainingGraph *)self allocateResultGradientTensors])
  {
    unint64_t v6 = +[MLCLog framework];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph stopGradientForTensors:](a2);
    }
    goto LABEL_11;
  }
  BOOL v7 = [(MLCTrainingGraph *)self stopGradientTensorList];
  [v7 removeAllObjects];

  if ([(NSArray *)v5 count])
  {
    unint64_t v8 = 0;
    do
    {
      BOOL v9 = [(NSArray *)v5 objectAtIndexedSubscript:v8];
      uint64_t v10 = [(MLCTrainingGraph *)self stopGradientTensorList];
      [v10 setObject:v9 atIndexedSubscript:v8];

      ++v8;
    }
    while (v8 < [(NSArray *)v5 count]);
  }
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (NSUInteger)deviceMemorySize
{
  char v3 = [(MLCGraph *)self graphLayerList];
  uint64_t v4 = [v3 count];

  NSUInteger v5 = 0;
  if (v4)
  {
    unint64_t v6 = 0;
    do
    {
      BOOL v7 = [(MLCGraph *)self graphLayerList];
      unint64_t v8 = [v7 objectAtIndexedSubscript:v6];

      BOOL v9 = [(MLCTrainingGraph *)self optimizer];
      uint64_t v10 = [v8 device];
      v5 += [v8 deviceMemorySizeWithOptimizer:v9 device:v10];

      ++v6;
      BOOL v11 = [(MLCGraph *)self graphLayerList];
      unint64_t v12 = [v11 count];
    }
    while (v6 < v12);
  }
  uint64_t v13 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    unint64_t v15 = 0;
    do
    {
      uint64_t v16 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
      os_signpost_id_t v17 = [v16 objectAtIndexedSubscript:v15];
      BOOL v18 = [v17 device];

      uint64_t v19 = [v18 computeEngine];
      uint64_t v20 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
      unint64_t v21 = [v20 objectAtIndexedSubscript:v15];
      v5 += [v19 deviceMemorySizeForTensor:v21];

      ++v15;
      uint64_t v22 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
      unint64_t v23 = [v22 count];
    }
    while (v15 < v23);
  }
  return v5;
}

- (unint64_t)deviceMemorySizeWithDevice:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(MLCGraph *)self graphLayerList];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      BOOL v9 = [(MLCGraph *)self graphLayerList];
      uint64_t v10 = [v9 objectAtIndexedSubscript:v7];
      BOOL v11 = [(MLCTrainingGraph *)self optimizer];
      v8 += [v10 deviceMemorySizeWithOptimizer:v11 device:v4];

      ++v7;
      unint64_t v12 = [(MLCGraph *)self graphLayerList];
      unint64_t v13 = [v12 count];
    }
    while (v7 < v13);
  }
  else
  {
    unint64_t v8 = 0;
  }
  uint64_t v14 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    unint64_t v16 = 0;
    do
    {
      os_signpost_id_t v17 = [v4 computeEngine];
      BOOL v18 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
      uint64_t v19 = [v18 objectAtIndexedSubscript:v16];
      v8 += [v17 deviceMemorySizeForTensor:v19];

      ++v16;
      uint64_t v20 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
      unint64_t v21 = [v20 count];
    }
    while (v16 < v21);
  }

  return v8;
}

- (id)description
{
  char v3 = [(MLCGraph *)self allInputs];
  id v4 = [v3 allKeys];

  NSUInteger v5 = [(MLCGraph *)self allLossLabels];
  uint64_t v6 = [v5 allKeys];

  unint64_t v7 = [(MLCGraph *)self allLossLabelWeights];
  unint64_t v8 = [v7 allKeys];

  BOOL v9 = [(MLCGraph *)self allOutputs];
  uint64_t v10 = [v9 allKeys];

  BOOL v11 = NSString;
  unint64_t v12 = (objc_class *)objc_opt_class();
  unint64_t v13 = NSStringFromClass(v12);
  uint64_t v14 = [(MLCGraph *)self graphLayerList];
  uint64_t v15 = [v14 objectAtIndexedSubscript:0];
  unint64_t v16 = [(MLCTrainingGraph *)self optimizer];
  v20.receiver = self;
  v20.super_class = (Class)MLCTrainingGraph;
  os_signpost_id_t v17 = [(MLCGraph *)&v20 description];
  BOOL v18 = [v11 stringWithFormat:@"%@: { rootLayer=%@ : optimizer=%@ : inputs=%@ : losslabels=%@ : lossLabelWeights= %@ : outputs= %@ : %@ }", v13, v15, v16, v4, v6, v8, v10, v17];

  return v18;
}

- (BOOL)addInputs:(NSDictionary *)inputs lossLabels:(NSDictionary *)lossLabels
{
  v5.receiver = self;
  v5.super_class = (Class)MLCTrainingGraph;
  return [(MLCGraph *)&v5 addInputs:inputs lossLabels:lossLabels lossLabelWeights:0];
}

- (BOOL)addInputs:(NSDictionary *)inputs lossLabels:(NSDictionary *)lossLabels lossLabelWeights:(NSDictionary *)lossLabelWeights
{
  v6.receiver = self;
  v6.super_class = (Class)MLCTrainingGraph;
  return [(MLCGraph *)&v6 addInputs:inputs lossLabels:lossLabels lossLabelWeights:lossLabelWeights];
}

- (BOOL)addOutputs:(NSDictionary *)outputs
{
  v4.receiver = self;
  v4.super_class = (Class)MLCTrainingGraph;
  return [(MLCGraph *)&v4 addOutputs:outputs];
}

- (void)executeForwardToLayerIndex:(unint64_t)a3 resultTensor:(id)a4 resultStateIsTemporary:(BOOL)a5 batchSize:(unint64_t)a6 forTraining:(BOOL)a7 executionOptions:(unint64_t)a8
{
  unsigned int v8 = a8;
  BOOL v150 = a5;
  BOOL v151 = a7;
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  context = (void *)MEMORY[0x1E01B11E0]();
  if ((v8 & 4) != 0)
  {
    uint64_t v14 = +[MLCLog execution];
    os_signpost_id_t v13 = os_signpost_id_generate(v14);
  }
  else
  {
    os_signpost_id_t v13 = 0;
  }
  uint64_t v15 = +[MLCLog execution];
  unint64_t v16 = v15;
  unint64_t v147 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "ExecuteForward", "", buf, 2u);
  }

  os_signpost_id_t v17 = [(MLCGraph *)self device];
  BOOL v18 = [v17 type] == 0;

  os_signpost_id_t v146 = v13;
  if ((v18 & (v8 >> 4)) != 0) {
    os_signpost_id_t v19 = v13;
  }
  else {
    os_signpost_id_t v19 = 0;
  }
  os_signpost_id_t spid = v19;
  if (a3)
  {
    uint64_t v20 = 0;
    unint64_t v160 = v19 - 1;
    unint64_t v158 = a3 - 1;
    id v155 = v12;
    unint64_t v156 = a3;
    unint64_t v149 = a6;
    while (1)
    {
      unint64_t v21 = [(MLCGraph *)self graphLayerList];
      uint64_t v22 = [v21 objectAtIndexedSubscript:v20];

      unint64_t v23 = [v22 device];
      MLCGraphCompilationOptions v24 = +[MLCLog execution];
      char v25 = v24;
      if (v160 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        unint64_t v26 = (objc_class *)objc_opt_class();
        unint64_t v27 = NSStringFromClass(v26);
        uint64_t v28 = [v22 layerID];
        *(_DWORD *)buf = 138543618;
        v164 = v27;
        __int16 v165 = 2050;
        uint64_t v166 = v28;
        _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v25, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ExecuteForward -- PerLayer", "%{public,name=MLCLayerType}@ %{public,name=LayerID}lu", buf, 0x16u);
      }
      if (v12 && v20 == v158)
      {
        id v161 = v12;
      }
      else
      {
        int v29 = [v22 resultTensors];
        id v161 = [v29 objectAtIndexedSubscript:0];
      }
      if ([v22 skipLayer])
      {
        uint64_t v30 = +[MLCLog execution];
        unint64_t v31 = v30;
        if (v160 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v30)) {
          goto LABEL_67;
        }
        goto LABEL_66;
      }
      [v22 setBatchSize:a6];
      if ([(MLCGraph *)self allocateDeviceMemoryForTensorsInGraph])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [(MLCGraph *)self allocateDeviceMemoryForTensor:v161 device:v23];
          unint64_t v32 = [v22 resultTensors];
          unint64_t v33 = [v32 count];

          if (v33 >= 2)
          {
            unint64_t v34 = 1;
            do
            {
              unint64_t v35 = [v22 resultTensors];
              char v36 = [v35 objectAtIndexedSubscript:v34];
              [(MLCGraph *)self allocateDeviceMemoryForTensor:v36 device:v23];

              ++v34;
              v37 = [v22 resultTensors];
              unint64_t v38 = [v37 count];
            }
            while (v34 < v38);
          }
          [(MLCGraph *)self updateDeviceMemoryReadCountForTensor:v161];
          char v39 = [v22 resultTensors];
          unint64_t v40 = [v39 count];

          if (v40 >= 2)
          {
            unint64_t v41 = 1;
            do
            {
              uint64_t v42 = [v22 resultTensors];
              unint64_t v43 = [v42 objectAtIndexedSubscript:v41];
              [(MLCGraph *)self updateDeviceMemoryReadCountForTensor:v43];

              ++v41;
              v44 = [v22 resultTensors];
              unint64_t v45 = [v44 count];
            }
            while (v41 < v45);
          }
          if ([v22 isTrainable])
          {
            [(MLCGraph *)self updateDeviceMemoryReadCountForGradientWithLayer:v22 tensor:v161 checkIfSourceNeeded:0 checkIfResultNeeded:1];
            v46 = [v22 resultTensors];
            unint64_t v47 = [v46 count];

            if (v47 >= 2)
            {
              unint64_t v48 = 1;
              do
              {
                unint64_t v49 = [v22 resultTensors];
                uint64_t v50 = [v49 objectAtIndexedSubscript:v48];
                [(MLCGraph *)self updateDeviceMemoryReadCountForGradientWithLayer:v22 tensor:v50 checkIfSourceNeeded:0 checkIfResultNeeded:1];

                ++v48;
                uint64_t v51 = [v22 resultTensors];
                unint64_t v52 = [v51 count];
              }
              while (v48 < v52);
            }
            v53 = [v22 sourceTensors];
            uint64_t v54 = [v53 count];

            if (v54)
            {
              unint64_t v55 = 0;
              do
              {
                v56 = [v22 sourceTensors];
                v57 = [v56 objectAtIndexedSubscript:v55];
                [(MLCGraph *)self updateDeviceMemoryReadCountForGradientWithLayer:v22 tensor:v57 checkIfSourceNeeded:1 checkIfResultNeeded:0];

                ++v55;
                v58 = [v22 sourceTensors];
                unint64_t v59 = [v58 count];
              }
              while (v55 < v59);
            }
          }
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v60 = [v23 computeEngine];
        uint64_t v61 = [v22 deviceOps];
        unint64_t v62 = [v22 sourceTensors];
        v159 = v60;
        [v60 dispatchForwardConcatLayer:v61 sourceTensors:v62 resultTensor:v161];
        goto LABEL_57;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v23 computeEngine];
        uint64_t v63 = self;
        uint64_t v64 = v20;
        uint64_t v66 = v65 = v23;
        [v22 deviceOps];
        v68 = unint64_t v67 = a6;
        unint64_t v62 = [v22 sourceTensors];
        unint64_t v69 = [v62 objectAtIndexedSubscript:0];
        uint64_t v70 = [v22 resultTensors];
        v159 = (void *)v66;
        unint64_t v71 = (void *)v66;
        unint64_t v23 = v65;
        uint64_t v20 = v64;
        self = v63;
        [v71 dispatchForwardSplitLayer:v68 sourceTensor:v69 resultTensors:v70];

        uint64_t v61 = (void *)v68;
        a6 = v67;
        id v12 = v155;
        goto LABEL_42;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v159 = [v23 computeEngine];
        v152 = [v22 deviceOps];
        unint64_t v62 = [v22 sourceTensors];
        v72 = [v62 objectAtIndexedSubscript:0];
        int v73 = [v22 binaryOperation];
        uint64_t v74 = 0;
        if (v73)
        {
          char v145 = [v22 sourceTensors];
          uint64_t v74 = [v145 objectAtIndexedSubscript:1];
          v144 = (void *)v74;
        }
        v75 = [v22 sourceTensors];
        if ([v75 count] == 3)
        {
          [v22 sourceTensors];
          v76 = int v141 = v73;
          v77 = [v76 objectAtIndexedSubscript:2];
          LOBYTE(v137) = v151;
          [v159 dispatchForwardLayer:v152 sourceTensor:v72 secondaryTensor:v74 tertiaryTensor:v77 resultTensor:v161 resultStateIsTemporary:v150 forTraining:v137];

          id v12 = v155;
          int v73 = v141;
        }
        else
        {
          LOBYTE(v137) = v151;
          [v159 dispatchForwardLayer:v152 sourceTensor:v72 secondaryTensor:v74 tertiaryTensor:0 resultTensor:v161 resultStateIsTemporary:v150 forTraining:v137];
        }

        a6 = v149;
        if (v73)
        {
        }
        goto LABEL_56;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v78 = v22;
        v79 = [v78 lossLabels];
        v80 = [v79 descriptor];
        v81 = [v80 stride];
        v82 = [v81 objectAtIndexedSubscript:0];
        unint64_t v153 = (unint64_t)[v82 unsignedIntegerValue] >> 2;

        v159 = [v23 computeEngine];
        uint64_t v83 = [v78 deviceOps];
        unint64_t v62 = [v78 sourceTensors];
        v84 = [v62 objectAtIndexedSubscript:0];
        uint64_t v85 = [v78 lossLabels];
        v86 = [v78 weights];

        BYTE1(v137) = v151;
        LOBYTE(v137) = v150;
        objc_msgSend(v159, "dispatchForwardLossLayer:sourceTensor:labelsTensor:labelsTensorStride:weightsTensor:resultTensor:resultStateIsTemporary:forTraining:", v83, v84, v85, v153, v86, v161, v137);

        id v12 = v155;
        uint64_t v61 = (void *)v83;
LABEL_50:

        goto LABEL_51;
      }
      objc_opt_class();
      a6 = v149;
      if (objc_opt_isKindOfClass())
      {
        v95 = [v23 computeEngine];
        uint64_t v61 = [v22 deviceOps];
        unint64_t v62 = [v22 sourceTensors];
        unint64_t v69 = [v22 resultTensors];
        v159 = v95;
        [v95 dispatchRNNForwardLayer:v61 sourceTensors:v62 resultTensors:v69 resultStateIsTemporary:v150 forTraining:v151];
        goto LABEL_42;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v96 = [v23 computeEngine];
        uint64_t v61 = [v22 deviceOps];
        unint64_t v62 = [v22 sourceTensors];
        v159 = v96;
        [v96 dispatchForwardMHALayer:v61 sourceTensors:v62 resultTensor:v161 resultStateIsTemporary:v150 forTraining:v151];
        goto LABEL_57;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v97 = [v23 computeEngine];
        uint64_t v61 = [v22 deviceOps];
        unint64_t v62 = [v22 sourceTensors];
        v159 = v97;
        [v97 dispatchForwardMatMulLayer:v61 sourceTensors:v62 resultTensor:v161];
        goto LABEL_57;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v98 = [v23 computeEngine];
        uint64_t v61 = [v22 deviceOps];
        unint64_t v62 = [v22 sourceTensors];
        unint64_t v69 = [v62 objectAtIndexedSubscript:0];
        v159 = v98;
        [v98 dispatchForwardSliceLayer:v61 sourceTensor:v69 resultTensor:v161 forTraining:v151];
LABEL_42:

LABEL_57:
        goto LABEL_58;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      char v99 = [v23 computeEngine];
      unint64_t v100 = [v22 deviceOps];
      char v101 = [v22 sourceTensors];
      v102 = [v101 objectAtIndexedSubscript:0];
      [v99 dispatchForwardReshapeLayer:v100 sourceTensor:v102 resultTensor:v161 resultStateIsTemporary:v150 forTraining:v151];

      v103 = [v161 sharedMemoryTensor];

      if (!v103)
      {
        id v12 = v155;
        goto LABEL_59;
      }
      v159 = [v161 sharedMemoryTensor];
      v104 = [v161 childLayers];
      uint64_t v105 = [v104 count];
      id v12 = v155;
      if (v105)
      {
        unint64_t v62 = [v161 childLayers];
        uint64_t v106 = [v62 count];
      }
      else
      {
        uint64_t v106 = 1;
        unint64_t v62 = v140;
      }
      objc_msgSend(v159, "setReadCount:", objc_msgSend(v159, "readCount") + v106);
      v140 = v62;
      uint64_t v61 = v104;
      a6 = v149;
      if (v105) {
        goto LABEL_57;
      }
LABEL_58:

LABEL_59:
      a3 = v156;
      if (([v22 isDebuggingEnabled] & 1) == 0)
      {
        if ([(MLCGraph *)self allocateDeviceMemoryForTensorsInGraph])
        {
          v87 = [v22 sourceTensors];
          uint64_t v88 = [v87 count];

          if (v88)
          {
            unint64_t v89 = 0;
            do
            {
              unint64_t v90 = [v22 sourceTensors];
              v91 = [v90 objectAtIndexedSubscript:v89];
              [(MLCGraph *)self freeDeviceMemoryForTensorIfSafe:v91 device:v23];

              ++v89;
              uint64_t v92 = [v22 sourceTensors];
              unint64_t v93 = [v92 count];
            }
            while (v89 < v93);
          }
        }
      }
      unint64_t v94 = +[MLCLog execution];
      unint64_t v31 = v94;
      if (v160 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v94)) {
        goto LABEL_67;
      }
LABEL_66:
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v31, OS_SIGNPOST_INTERVAL_END, spid, "ExecuteForward -- PerLayer", "", buf, 2u);
LABEL_67:

      if (++v20 == a3) {
        goto LABEL_115;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v159 = [v23 computeEngine];
      uint64_t v107 = [v22 deviceOps];
      unint64_t v62 = [v22 weights];
      v108 = [v22 sourceTensors];
      uint64_t v109 = [v108 objectAtIndexedSubscript:0];
      [v159 dispatchForwardEmbeddingLayer:v107 weight:v62 sourceTensor:v109 resultTensor:v161];

      uint64_t v61 = (void *)v107;
      goto LABEL_83;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v159 = [v23 computeEngine];
      uint64_t v61 = [v22 deviceOps];
      unint64_t v110 = [v22 sourceTensors];
      unint64_t v62 = v110;
      if (v151)
      {
        v108 = [v110 objectAtIndexedSubscript:0];
        [v159 dispatchForwardLayer:v61 sourceTensor:v108 resultTensor:v161 resultStateIsTemporary:v150 forTraining:1];
        goto LABEL_83;
      }
      [v159 dispatchForwardConcatLayer:v61 sourceTensors:v110 resultTensor:v161];
LABEL_51:
      a6 = v149;
      goto LABEL_57;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v111 = v22;
      v159 = [v23 computeEngine];
      uint64_t v112 = [v111 deviceOps];
      unint64_t v62 = [v111 sourceTensors];
      v84 = [v62 objectAtIndexedSubscript:0];
      uint64_t v113 = [v111 reductionType];
      unint64_t v114 = [v111 dimensions];

      uint64_t v115 = v113;
      uint64_t v61 = (void *)v112;
      [v159 dispatchForwardReduceLayer:v112 sourceTensor:v84 resultTensor:v161 reductionType:v115 reduceDimensions:v114 forTraining:1];

      id v12 = v155;
      goto LABEL_50;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v116 = v22;
      v152 = [v23 computeEngine];
      unint64_t v62 = [v116 deviceOps];
      unint64_t v117 = [v116 sourceTensors];
      v142 = [v117 objectAtIndexedSubscript:0];
      v159 = v116;
      v118 = [v116 sourceTensors];
      uint64_t v119 = [v118 count];
      uint64_t v120 = 0;
      if (v119 == 2)
      {
        char v139 = [v159 sourceTensors];
        uint64_t v120 = [v139 objectAtIndexedSubscript:1];
        v138 = (void *)v120;
      }
      objc_msgSend(v152, "dispatchForwardCompareLayer:sourceTensor:secondaryTensor:resultTensor:compareOp:forTraining:", v62, v142, v120, v161, objc_msgSend(v159, "operation"), v151);
      if (v119 == 2)
      {
      }
      a6 = v149;
LABEL_56:
      uint64_t v61 = v152;
      goto LABEL_57;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v121 = [v23 computeEngine];
      uint64_t v61 = [v22 deviceOps];
      unint64_t v62 = [v22 sourceTensors];
      v108 = [v62 objectAtIndexedSubscript:0];
      v159 = v121;
      [v121 dispatchForwardFullyConnectedLayer:v61 sourceTensor:v108 resultTensor:v161 forTraining:v151];
LABEL_83:

      goto LABEL_51;
    }
    objc_opt_class();
    a6 = v149;
    if (objc_opt_isKindOfClass())
    {
      v159 = [v23 computeEngine];
      uint64_t v61 = [v22 deviceOps];
      unint64_t v62 = [v22 sourceTensors];
      v122 = [v62 objectAtIndexedSubscript:0];
      v154 = [v22 sourceTensors];
      BOOL v143 = [v154 objectAtIndexedSubscript:1];
      v162[0] = v143;
      v123 = [v22 sourceTensors];
      unint64_t v124 = [v123 objectAtIndexedSubscript:2];
      v162[1] = v124;
      v125 = [MEMORY[0x1E4F1C978] arrayWithObjects:v162 count:2];
      [v159 dispatchForwardSelectLayer:v61 conditionTensor:v122 sourceTensors:v125 resultTensor:v161 forTraining:v151];

      a6 = v149;
      id v12 = v155;

      goto LABEL_57;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v126 = [v23 computeEngine];
      uint64_t v61 = [v22 deviceOps];
      unint64_t v62 = [v22 sourceTensors];
      v159 = v126;
      [v126 dispatchForwardScatterLayer:v61 sourceTensors:v62 resultTensor:v161 forTraining:v151];
      goto LABEL_57;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v127 = [v23 computeEngine];
      uint64_t v61 = [v22 deviceOps];
      unint64_t v62 = [v22 sourceTensors];
      v159 = v127;
      [v127 dispatchForwardGatherLayer:v61 sourceTensors:v62 resultTensor:v161 forTraining:v151];
      goto LABEL_57;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v128 = [v22 fusedLayers];
      if ([v128 count])
      {
        v129 = [v22 fusedLayers];
        v130 = [v129 objectAtIndexedSubscript:0];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        a6 = v149;
        if (isKindOfClass)
        {
          v132 = [v23 computeEngine];
          uint64_t v61 = [v22 deviceOps];
          unint64_t v62 = [v22 sourceTensors];
          v159 = v132;
          [v132 dispatchForwardFusedArithmeticLayerNormalizationLayer:v61 sourceTensors:v62 resultTensor:v161 forTraining:v151];
LABEL_114:
          id v12 = v155;
          goto LABEL_57;
        }
      }
      else
      {

        a6 = v149;
      }
    }
    unint64_t v133 = [v23 computeEngine];
    uint64_t v61 = [v22 deviceOps];
    unint64_t v62 = [v22 sourceTensors];
    v134 = [v62 objectAtIndexedSubscript:0];
    v159 = v133;
    [v133 dispatchForwardLayer:v61 sourceTensor:v134 resultTensor:v161 resultStateIsTemporary:v150 forTraining:v151];

    goto LABEL_114;
  }
LABEL_115:
  v135 = +[MLCLog execution];
  v136 = v135;
  if (v147 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v135))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v136, OS_SIGNPOST_INTERVAL_END, v146, "ExecuteForward", "", buf, 2u);
  }
}

- (void)executeGradientFromLayerIndex:(unint64_t)a3 resultStateIsTemporary:(BOOL)a4 batchSize:(unint64_t)a5 executionOptions:(unint64_t)a6
{
  unsigned int v6 = a6;
  BOOL v186 = a4;
  uint64_t v201 = *MEMORY[0x1E4F143B8];
  uint64_t v188 = MEMORY[0x1E01B11E0]();
  if ((v6 & 4) != 0)
  {
    id v12 = +[MLCLog execution];
    os_signpost_id_t v11 = os_signpost_id_generate(v12);
  }
  else
  {
    os_signpost_id_t v11 = 0;
  }
  os_signpost_id_t v13 = +[MLCLog execution];
  uint64_t v14 = v13;
  unint64_t v187 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "ExecuteGradient", "", buf, 2u);
  }

  uint64_t v15 = [(MLCGraph *)self device];
  BOOL v16 = [v15 type] == 0;

  if ((v16 & (v6 >> 4)) != 0) {
    os_signpost_id_t v17 = v11;
  }
  else {
    os_signpost_id_t v17 = 0;
  }
  os_signpost_id_t spid = v17;
  if ((int64_t)[(MLCTrainingGraph *)self firstTrainableLayerIndex] > (uint64_t)a3)
  {
LABEL_11:
    BOOL v18 = [(MLCGraph *)self graphLayerList];
    os_signpost_id_t v19 = [v18 objectAtIndexedSubscript:0];
    uint64_t v20 = [v19 device];
    [(MLCTrainingGraph *)self sumAllRootSourceGradientTensors:v20];

    unint64_t v21 = [(MLCTrainingGraph *)self firstTrainableLayerIndex];
    uint64_t v22 = [(MLCGraph *)self graphLayerList];
    unint64_t v23 = [v22 count];

    MLCGraphCompilationOptions v24 = (void *)v188;
    if (v21 < v23 && [(MLCTrainingGraph *)self firstTrainableLayerIndex])
    {
      unint64_t v25 = 0;
      do
      {
        unint64_t v26 = [(MLCGraph *)self graphLayerList];
        unint64_t v27 = [v26 objectAtIndexedSubscript:v25];

        if (([v27 skipLayer] & 1) == 0)
        {
          uint64_t v28 = [v27 device];
          int v29 = [v28 computeEngine];
          uint64_t v30 = [v27 deviceOps];
          [v29 incrementReadCountForGradientState:v30 increment:-1];
        }
        ++v25;
      }
      while (v25 < [(MLCTrainingGraph *)self firstTrainableLayerIndex]);
    }
    unint64_t v31 = +[MLCLog execution];
    unint64_t v32 = v31;
    if (v187 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v32, OS_SIGNPOST_INTERVAL_END, v11, "ExecuteGradient", "", buf, 2u);
    }

    [(MLCGraph *)self setAllocateDeviceMemoryForTensorsInGraph:0];
    id v33 = [(MLCGraph *)self freeResourceList];
    [v33 removeAllObjects];
    goto LABEL_21;
  }
  unint64_t v34 = spid - 1;
  os_signpost_id_t v189 = v11;
  unint64_t v190 = a5;
  unint64_t v192 = spid - 1;
  while (1)
  {
    unint64_t v35 = [(MLCGraph *)self graphLayerList];
    char v36 = [v35 objectAtIndexedSubscript:a3];

    v193 = [v36 device];
    v37 = +[MLCLog execution];
    unint64_t v38 = v37;
    if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      char v39 = (objc_class *)objc_opt_class();
      unint64_t v40 = NSStringFromClass(v39);
      uint64_t v41 = [v36 layerID];
      *(_DWORD *)buf = 138543618;
      v198 = v40;
      __int16 v199 = 2050;
      uint64_t v200 = v41;
      _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v38, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ExecuteGradient -- PerLayer", "%{public,name=MLCLayerType}@ %{public,name=LayerID}lu", buf, 0x16u);
    }
    [v36 setBatchSize:a5];
    uint64_t v42 = [v36 intermediateGradientTensors];
    uint64_t v43 = [v42 count];

    if (v43)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [(MLCTrainingGraph *)self sumIntermediateGradientTensorsForLayer:v36];
      }
    }
    if ([v36 skipLayer])
    {
      v44 = +[MLCLog execution];
      unint64_t v45 = v44;
      unint64_t v34 = spid - 1;
      if (v192 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v45, OS_SIGNPOST_INTERVAL_END, spid, "ExecuteGradient -- PerLayer", "", buf, 2u);
      }
      goto LABEL_49;
    }
    if (![v36 isTrainable] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v46 = [v36 device];
      unint64_t v47 = [v46 computeEngine];
      unint64_t v48 = [v36 deviceOps];
      [v47 incrementReadCountForGradientState:v48 increment:-1];

      unint64_t v49 = +[MLCLog execution];
      unint64_t v45 = v49;
      unint64_t v34 = spid - 1;
      if (v192 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v45, OS_SIGNPOST_INTERVAL_END, spid, "ExecuteGradient -- PerLayer", "", buf, 2u);
      }
      a5 = v190;
      goto LABEL_49;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v51 = [v36 resultGradientTensors];
    unint64_t v45 = [v51 objectAtIndexedSubscript:isKindOfClass & 1];

    unint64_t v52 = [v36 sourceGradientTensors];
    uint64_t v53 = [v52 count];

    if (v53) {
      break;
    }
LABEL_43:
    uint64_t v61 = [v36 device];
    unint64_t v62 = [v61 computeEngine];
    uint64_t v63 = [v36 deviceOps];
    [v62 incrementReadCountForGradientState:v63 increment:-1];

    uint64_t v64 = +[MLCLog execution];
    v65 = v64;
    unint64_t v34 = spid - 1;
    if (v192 > 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v189;
    }
    else
    {
      os_signpost_id_t v11 = v189;
      if (os_signpost_enabled(v64))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v65, OS_SIGNPOST_INTERVAL_END, spid, "ExecuteGradient -- PerLayer", "", buf, 2u);
      }
    }
    a5 = v190;
LABEL_48:

LABEL_49:
    if ((uint64_t)a3-- <= (int64_t)[(MLCTrainingGraph *)self firstTrainableLayerIndex]) {
      goto LABEL_11;
    }
  }
  unint64_t v54 = 0;
  while (1)
  {
    unint64_t v55 = [v193 computeEngine];
    v56 = [v36 sourceGradientTensors];
    v57 = [v56 objectAtIndexedSubscript:v54];
    char v58 = [v55 needToAllocateDeviceMemoryForTensor:v57];

    if ((v58 & 1) == 0) {
      break;
    }
    ++v54;
    unint64_t v59 = [v36 sourceGradientTensors];
    unint64_t v60 = [v59 count];

    if (v54 >= v60) {
      goto LABEL_43;
    }
  }
  unint64_t v67 = v193;
  if ([(MLCGraph *)self allocateDeviceMemoryForTensorsInGraph])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_59;
      }
      id v68 = v36;
      if (![v68 operation] || objc_msgSend(v68, "operation") == 1)
      {

        goto LABEL_62;
      }
      unint64_t v69 = [v68 sourceTensors];
      unint64_t v70 = [v69 count];

      if (v70 <= 2)
      {
LABEL_59:
        [(MLCGraph *)self allocateDeviceMemoryForTensor:v45 device:v193];
        unint64_t v71 = [v36 resultGradientTensors];
        uint64_t v72 = [v71 count];

        if (v72)
        {
          unint64_t v73 = 0;
          do
          {
            uint64_t v74 = [v36 resultGradientTensors];
            v75 = [v74 objectAtIndexedSubscript:v73];
            [(MLCGraph *)self allocateDeviceMemoryForTensor:v75 device:v193];

            ++v73;
            v76 = [v36 resultGradientTensors];
            unint64_t v77 = [v76 count];
          }
          while (v73 < v77);
        }
      }
    }
  }
LABEL_62:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v36 binaryOperation])
    {
      id v78 = [v36 resultGradientTensors];
      id v33 = [v78 objectAtIndexedSubscript:1];
    }
    else
    {
      id v33 = 0;
    }
    uint64_t v83 = [v36 sourceTensors];
    unint64_t v84 = [v83 count];

    if (v84 >= 3)
    {
      long long v171 = v45;
      v174 = a2;
      uint64_t v85 = [v36 fusedLayers];
      v86 = [v85 objectAtIndexedSubscript:0];

      long long v170 = v86;
      v87 = [v86 sourceTensors];
      uint64_t v88 = [v87 objectAtIndexedSubscript:0];
      unint64_t v89 = [v36 sourceTensors];
      unint64_t v90 = [v89 objectAtIndexedSubscript:2];

      v91 = [v193 computeEngine];
      char v169 = [v36 fusedLayers];
      char v168 = [v169 objectAtIndexedSubscript:0];
      v181 = [v168 deviceOps];
      uint64_t v92 = [v36 sourceGradientTensors];
      __int16 v177 = [v92 objectAtIndexedSubscript:0];
      if (v88 == v90)
      {
        unint64_t v93 = [v36 resultGradientTensors];
        unint64_t v94 = [v93 objectAtIndexedSubscript:2];
        v95 = [v36 sourceGradientTensors];
        v96 = v95;
        uint64_t v97 = 0;
      }
      else
      {
        unint64_t v93 = [v36 sourceGradientTensors];
        unint64_t v94 = [v93 objectAtIndexedSubscript:0];
        v95 = [v36 resultGradientTensors];
        v96 = v95;
        uint64_t v97 = 2;
      }
      char v128 = [v95 objectAtIndexedSubscript:v97];
      [v91 dispatchGradientLayer:v181 sourceGradientTensor:v177 resultGradientTensor:v94 secondaryResultGradientTensor:v128];

      unint64_t v67 = v193;
      unint64_t v45 = v171;
      a2 = v174;
    }
    v79 = [v67 computeEngine];
    v80 = [v36 deviceOps];
    v81 = [v36 sourceGradientTensors];
    v82 = [v81 objectAtIndexedSubscript:0];
    [v79 dispatchGradientLayer:v80 sourceGradientTensor:v82 resultGradientTensor:v45 secondaryResultGradientTensor:v33];
    goto LABEL_89;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = [v193 computeEngine];
    v79 = [v36 deviceOps];
    v80 = [v36 sourceGradientTensors];
    v81 = [v80 objectAtIndexedSubscript:0];
    v82 = [v36 resultGradientTensors];
    [v33 dispatchGradientConcatLayer:v79 sourceGradientTensor:v81 resultGradientTensors:v82];
LABEL_89:

LABEL_90:
    goto LABEL_91;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v172 = v45;
    v175 = a2;
    v98 = [v36 intermediateGradientTensors];
    uint64_t v99 = [v98 count];

    if (v99)
    {
      unint64_t v100 = 0;
      do
      {
        char v101 = [v36 intermediateGradientTensors];
        v102 = [v101 objectAtIndexedSubscript:v100];

        v103 = [v36 sourceGradientTensors];
        uint64_t v104 = [v103 count];

        if (v104)
        {
          unint64_t v105 = 0;
          while (1)
          {
            uint64_t v106 = [v36 sourceGradientTensors];
            uint64_t v107 = [v106 objectAtIndexedSubscript:v105];
            uint64_t v108 = [v107 splitOffset];
            uint64_t v109 = [v102 splitOffset];

            if (v108 == v109) {
              break;
            }
            ++v105;
            unint64_t v110 = [v36 sourceGradientTensors];
            unint64_t v111 = [v110 count];

            if (v105 >= v111) {
              goto LABEL_80;
            }
          }
          uint64_t v112 = [v193 computeEngine];
          v182 = [v36 intermediateSumLayer];
          uint64_t v113 = [v182 deviceOps];
          MLCGraphCompilationOptions v178 = [v36 sourceGradientTensors];
          unint64_t v114 = [v178 objectAtIndexedSubscript:v105];
          uint64_t v115 = [v36 sourceGradientTensors];
          id v116 = [v115 objectAtIndexedSubscript:v105];
          LOBYTE(v167) = 0;
          [v112 dispatchForwardLayer:v113 sourceTensor:v114 secondaryTensor:v102 tertiaryTensor:0 resultTensor:v116 resultStateIsTemporary:0 forTraining:v167];
        }
LABEL_80:

        ++v100;
        unint64_t v117 = [v36 intermediateGradientTensors];
        unint64_t v118 = [v117 count];
      }
      while (v100 < v118);
    }
    id v33 = [v193 computeEngine];
    v79 = [v36 deviceOps];
    v80 = [v36 sourceGradientTensors];
    unint64_t v45 = v172;
    [v33 dispatchGradientSplitLayer:v79 sourceGradientTensors:v80 resultGradientTensor:v172];
    goto LABEL_85;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v119 = v36;
    uint64_t v120 = [v119 lossLabels];
    [v120 descriptor];
    unint64_t v121 = v175 = a2;
    v122 = [v121 stride];
    v123 = [v122 objectAtIndexedSubscript:0];
    unint64_t v183 = (unint64_t)[v123 unsignedIntegerValue] >> 2;

    id v33 = [v193 computeEngine];
    uint64_t v179 = [v119 deviceOps];
    v80 = [v119 sourceGradientTensors];
    unint64_t v124 = [v80 objectAtIndexedSubscript:0];
    v125 = [v119 lossLabels];
    [v119 weights];
    v127 = uint64_t v126 = v45;

    [v33 dispatchGradientLossLayer:v179 sourceGradientTensor:v124 labelsTensor:v125 labelsTensorStride:v183 weightsTensor:v127 resultGradientTensor:v126];
    unint64_t v45 = v126;

    v79 = (void *)v179;
LABEL_84:

LABEL_85:
    a2 = v175;
LABEL_91:
    a5 = v190;
    goto LABEL_92;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = [v193 computeEngine];
    v79 = [v36 deviceOps];
    v80 = [v36 sourceGradientTensors];
    v81 = [v36 resultGradientTensors];
    [v33 dispatchRNNGradientLayer:v79 sourceGradientTensors:v80 resultGradientTensors:v81];
    goto LABEL_90;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = [v193 computeEngine];
    v79 = [v36 deviceOps];
    v80 = [v36 sourceGradientTensors];
    v81 = [v80 objectAtIndexedSubscript:0];
    v82 = [v36 resultGradientTensors];
    [v33 dispatchGradientMHALayer:v79 sourceGradientTensor:v81 resultGradientTensors:v82 resultStateIsTemporary:v186];
    goto LABEL_89;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = [v193 computeEngine];
    v79 = [v36 deviceOps];
    v80 = [v36 sourceGradientTensors];
    v81 = [v80 objectAtIndexedSubscript:0];
    v82 = [v36 resultGradientTensors];
    [v33 dispatchGradientMatMulLayer:v79 sourceGradientTensor:v81 resultGradientTensors:v82];
    goto LABEL_89;
  }
  objc_opt_class();
  a5 = v190;
  if (objc_opt_isKindOfClass())
  {
    id v33 = [v193 computeEngine];
    v79 = [v36 deviceOps];
    v80 = [v36 sourceGradientTensors];
    os_signpost_id_t v146 = [v80 objectAtIndexedSubscript:0];
    [v33 dispatchGradientSliceLayer:v79 sourceGradientTensor:v146 resultGradientTensor:v45];
LABEL_119:

LABEL_92:
    os_signpost_id_t v11 = v189;
    if (([v36 isDebuggingEnabled] & 1) == 0)
    {
      if ([(MLCGraph *)self allocateDeviceMemoryForTensorsInGraph])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v176 = a2;
          v129 = [v36 deviceOps];
          v130 = [v129 objectAtIndexedSubscript:0];

          if ([v130 sourceOfForwardNeededForGradient])
          {
            char v131 = [v36 sourceTensors];
            uint64_t v132 = [v131 count];

            if (v132)
            {
              unint64_t v133 = 0;
              do
              {
                v134 = [v36 sourceTensors];
                v135 = [v134 objectAtIndexedSubscript:v133];
                [(MLCGraph *)self freeDeviceMemoryForTensorIfSafe:v135 device:v193];

                ++v133;
                v136 = [v36 sourceTensors];
                unint64_t v137 = [v136 count];
              }
              while (v133 < v137);
            }
          }
          if ([v130 resultOfForwardNeededForGradient])
          {
            v138 = [v36 resultTensors];
            uint64_t v139 = [v138 count];

            if (v139)
            {
              unint64_t v140 = 0;
              do
              {
                int v141 = [v36 resultTensors];
                v142 = [v141 objectAtIndexedSubscript:v140];
                [(MLCGraph *)self freeDeviceMemoryForTensorIfSafe:v142 device:v193];

                ++v140;
                BOOL v143 = [v36 resultTensors];
                unint64_t v144 = [v143 count];
              }
              while (v140 < v144);
            }
          }

          a2 = v176;
          a5 = v190;
        }
      }
    }
    char v145 = +[MLCLog execution];
    v65 = v145;
    unint64_t v34 = spid - 1;
    if (v192 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v145))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v65, OS_SIGNPOST_INTERVAL_END, spid, "ExecuteGradient -- PerLayer", "", buf, 2u);
    }
    goto LABEL_48;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = [v193 computeEngine];
    v79 = [v36 deviceOps];
    v80 = [v36 sourceGradientTensors];
    os_signpost_id_t v146 = [v80 objectAtIndexedSubscript:0];
    [v33 dispatchGradientEmbeddingLayer:v79 sourceGradientTensor:v146];
    goto LABEL_119;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = [v193 computeEngine];
    v79 = [v36 deviceOps];
    v80 = [v36 sourceGradientTensors];
    os_signpost_id_t v146 = [v80 objectAtIndexedSubscript:0];
    [v33 dispatchGradientReshapeLayer:v79 sourceGradientTensor:v146 resultGradientTensor:v45];
    goto LABEL_119;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v33 = [v193 computeEngine];
      v79 = [v36 deviceOps];
      v80 = [v36 sourceGradientTensors];
      os_signpost_id_t v146 = [v80 objectAtIndexedSubscript:0];
      [v33 dispatchGradientFullyConnectedLayer:v79 sourceGradientTensor:v146 resultGradientTensor:v45 resultStateIsTemporary:v186];
      goto LABEL_119;
    }
    v175 = a2;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v33 = [v193 computeEngine];
      v79 = [v36 deviceOps];
      v80 = [v36 sourceTensors];
      unint64_t v124 = [v80 objectAtIndexedSubscript:0];
      v185 = [v36 sourceGradientTensors];
      BOOL v151 = [v185 objectAtIndexedSubscript:0];
      v196[0] = v45;
      v180 = [v36 resultGradientTensors];
      [v180 objectAtIndexedSubscript:2];
      v152 = long long v173 = v45;
      v196[1] = v152;
      unint64_t v153 = [MEMORY[0x1E4F1C978] arrayWithObjects:v196 count:2];
      [v33 dispatchGradientSelectLayer:v79 conditionTensor:v124 sourceGradientTensor:v151 resultGradientTensors:v153];

      unint64_t v45 = v173;
      goto LABEL_84;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v33 = [v193 computeEngine];
      v79 = [v36 deviceOps];
      v80 = [v36 sourceGradientTensors];
      v184 = [v80 objectAtIndexedSubscript:0];
      v195[0] = v184;
      v148 = [v36 sourceTensors];
      v154 = [v148 objectAtIndexedSubscript:1];
      v195[1] = v154;
      id v155 = [MEMORY[0x1E4F1C978] arrayWithObjects:v195 count:2];
      [v33 dispatchForwardGatherLayer:v79 sourceTensors:v155 resultTensor:v45 forTraining:1];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v156 = [v36 fusedLayers];
          if ([v156 count])
          {
            v157 = [v36 fusedLayers];
            unint64_t v158 = [v157 objectAtIndexedSubscript:0];
            objc_opt_class();
            char v159 = objc_opt_isKindOfClass();

            if (v159)
            {
              unint64_t v160 = [v193 computeEngine];
              id v161 = [v36 deviceOps];
              v162 = [v36 sourceGradientTensors];
              v163 = [v162 objectAtIndexedSubscript:0];
              [v160 dispatchGradientLayer:v161 sourceGradientTensor:v163 resultGradientTensor:v45];

              id v33 = [v193 computeEngine];
              v79 = [v36 resultGradientTensors];
              v80 = [v79 objectAtIndexedSubscript:1];
              [v33 shareDeviceMemoryWithResultTensor:v80 sourceTensor:v45];
              goto LABEL_85;
            }
          }
          else
          {
          }
        }
        id v33 = [v193 computeEngine];
        v79 = [v36 deviceOps];
        v80 = [v36 sourceGradientTensors];
        v164 = [v80 objectAtIndexedSubscript:0];
        [v33 dispatchGradientLayer:v79 sourceGradientTensor:v164 resultGradientTensor:v45];

        goto LABEL_85;
      }
      id v33 = [v193 computeEngine];
      v79 = [v36 deviceOps];
      v80 = [v36 sourceGradientTensors];
      v184 = [v80 objectAtIndexedSubscript:0];
      v194[0] = v184;
      v148 = [v36 sourceTensors];
      v154 = [v148 objectAtIndexedSubscript:1];
      v194[1] = v154;
      v194[2] = v45;
      id v155 = [MEMORY[0x1E4F1C978] arrayWithObjects:v194 count:3];
      [v33 dispatchForwardScatterLayer:v79 sourceTensors:v155 resultTensor:v45 forTraining:1];
    }

LABEL_124:
    goto LABEL_85;
  }
  v175 = a2;
  id v33 = v36;
  unsigned int v147 = [v33 reductionType];
  if (v147 > 9 || ((1 << v147) & 0x360) == 0)
  {
    v79 = [v193 computeEngine];
    v80 = [v33 deviceOps];
    v184 = [v33 sourceGradientTensors];
    v148 = [v184 objectAtIndexedSubscript:0];
    uint64_t v149 = [v33 reductionType];
    BOOL v150 = [v33 dimensions];
    [v79 dispatchGradientReduceLayer:v80 sourceGradientTensor:v148 resultGradientTensor:v45 reductionType:v149 reduceDimensions:v150];

    goto LABEL_124;
  }
  __int16 v165 = v45;
  MLCGraphCompilationOptions v24 = (void *)v188;
  uint64_t v166 = +[MLCLog framework];
  if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR)) {
    -[MLCTrainingGraph executeGradientFromLayerIndex:resultStateIsTemporary:batchSize:executionOptions:](a2);
  }

LABEL_21:
}

- (unint64_t)layerIndexToStoreSummedGradientsForTensor:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 childLayers];
  unint64_t v5 = [v4 count];

  unsigned int v6 = [v3 childLayers];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    while (1)
    {
      BOOL v9 = [v3 childLayers];
      uint64_t v10 = [v9 objectAtIndexedSubscript:v8];
      char v11 = [v10 isTrainable];

      if (v11) {
        break;
      }
      ++v8;
      id v12 = [v3 childLayers];
      unint64_t v13 = [v12 count];

      if (v8 >= v13) {
        goto LABEL_7;
      }
    }
    unint64_t v5 = v8;
  }
LABEL_7:

  return v5;
}

- (BOOL)checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:(id)a3 layer:(id)a4 device:(id)a5 isBetaTensor:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10) {
    goto LABEL_5;
  }
  unint64_t v13 = [v10 childLayers];
  unint64_t v14 = [v13 count];

  if (v14 < 2)
  {
    BOOL v18 = 0;
    goto LABEL_9;
  }
  unint64_t v15 = [(MLCTrainingGraph *)self layerIndexToStoreSummedGradientsForTensor:v10];
  BOOL v16 = [v10 childLayers];
  uint64_t v17 = [v16 count];
  BOOL v18 = v15 == v17;
  if (v15 == v17)
  {
LABEL_8:

    goto LABEL_9;
  }
  os_signpost_id_t v19 = [v10 childLayers];
  id v20 = [v19 objectAtIndexedSubscript:v15];

  if (v20 == v11)
  {
    BOOL v16 = [v12 computeEngine];
    [v16 sumSharedGradientsForNormalizationLayerTensorParameter:v10 layerIndexForSummedGradients:v15 isBetaTensor:v6];
    goto LABEL_8;
  }
LABEL_5:
  BOOL v18 = 1;
LABEL_9:

  return v18;
}

- (void)executeOptimizerUpdateWithExecutionOptions:(unint64_t)a3
{
  unsigned int v3 = a3;
  objc_super v4 = self;
  uint64_t v253 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (void *)MEMORY[0x1E01B11E0](self, a2);
  BOOL v6 = [(MLCTrainingGraph *)v4 optimizer];

  if (v6)
  {
    [(MLCTrainingGraph *)v4 allocateOptimizerDataForGraph];
    uint64_t v7 = [(MLCTrainingGraph *)v4 optimizer];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();

    unint64_t v8 = [(MLCTrainingGraph *)v4 optimizer];
    objc_opt_class();
    int v213 = objc_opt_isKindOfClass();

    unint64_t v9 = 0x1E6CB4000uLL;
    if ((v3 & 4) != 0)
    {
      id v11 = +[MLCLog execution];
      os_signpost_id_t v10 = os_signpost_id_generate(v11);
    }
    else
    {
      os_signpost_id_t v10 = 0;
    }
    v207 = v5;
    id v12 = +[MLCLog execution];
    unint64_t v13 = v12;
    unint64_t v218 = v10 - 1;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ExecuteOptimizerUpdate", "", buf, 2u);
    }

    unint64_t v14 = [(MLCGraph *)v4 device];
    BOOL v15 = [v14 type] == 0;

    os_signpost_id_t v212 = v10;
    if ((v15 & (v3 >> 4)) != 0) {
      os_signpost_id_t v16 = v10;
    }
    else {
      os_signpost_id_t v16 = 0;
    }
    uint64_t v17 = [(MLCTrainingGraph *)v4 optimizerUpdateLayerList];
    uint64_t v18 = [v17 count];

    v239 = v4;
    if (v18)
    {
      char obj = 0;
      os_signpost_id_t v19 = 0;
      os_signpost_id_t spid = v16;
      unint64_t v240 = v16 - 1;
      while (1)
      {
        id v20 = v19;
        unint64_t v21 = [(MLCTrainingGraph *)v4 optimizerUpdateLayerList];
        uint64_t v22 = v18 - 1;
        unint64_t v23 = [v21 objectAtIndexedSubscript:v18 - 1];

        os_signpost_id_t v19 = [v23 device];

        MLCGraphCompilationOptions v24 = [*(id *)(v9 + 1176) execution];
        unint64_t v25 = v24;
        if (v240 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
        {
          unint64_t v26 = (objc_class *)objc_opt_class();
          unint64_t v27 = NSStringFromClass(v26);
          uint64_t v28 = [v23 layerID];
          *(_DWORD *)buf = 138543618;
          uint64_t v250 = (uint64_t)v27;
          __int16 v251 = 2050;
          uint64_t v252 = v28;
          _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v25, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ExecuteOptimizerUpdate -- PerLayer", "%{public,name=MLCLayerType}@ %{public,name=LayerID}lu", buf, 0x16u);
        }
        int v29 = [(MLCTrainingGraph *)v4 optimizerUpdateLayerList];
        uint64_t v30 = [v29 count];

        if (v18 == v30)
        {
          unint64_t v31 = [v19 computeEngine];
          unint64_t v32 = [(MLCTrainingGraph *)v4 optimizer];
          id v33 = [v32 deviceOps];
          unint64_t v34 = [(MLCTrainingGraph *)v4 optimizer];
          [v34 learningRate];
          objc_msgSend(v31, "setOptimizerLearningRate:learningRate:", v33);

          char obj = 1;
        }
        if (isKindOfClass & 1) != 0 || (v213)
        {
          unint64_t v35 = [(MLCTrainingGraph *)v4 optimizer];
          char v36 = [v19 computeEngine];
          v37 = [(MLCTrainingGraph *)v4 optimizer];
          unint64_t v38 = [v37 deviceOps];
          objc_msgSend(v36, "setOptimizerTimeStep:timeStep:", v38, objc_msgSend(v35, "timeStep"));
        }
        objc_opt_class();
        uint64_t v242 = v22;
        if (objc_opt_isKindOfClass())
        {
          char v39 = v23;
          unint64_t v40 = [v39 weights];
          uint64_t v41 = [v39 biases];
          uint64_t v42 = [v40 childLayers];
          unint64_t v43 = [v42 count];

          if (v43 < 2) {
            goto LABEL_28;
          }
          uint64_t v44 = [(MLCTrainingGraph *)v4 layerIndexToStoreSummedGradientsForTensor:v40];
          unint64_t v45 = [v40 childLayers];
          if (v44 == [v45 count]) {
            goto LABEL_32;
          }
          [v40 childLayers];
          unint64_t v47 = v46 = v41;
          unint64_t v48 = [v47 objectAtIndexedSubscript:v44];

          uint64_t v41 = v46;
          BOOL v49 = v48 == v39;
          unint64_t v9 = 0x1E6CB4000;
          if (v49)
          {
            uint64_t v50 = [v19 computeEngine];
            [v50 sumSharedGradientsForConvolutionLayerTensorParameter:v40 layerIndexForSummedGradients:v44];

            if (v46)
            {
              uint64_t v51 = [v19 computeEngine];
              [v51 sumSharedGradientsForConvolutionLayerTensorParameter:v46 layerIndexForSummedGradients:v44];
            }
LABEL_28:
            [v19 computeEngine];
            v221 = v40;
            v228 = v19;
            unint64_t v52 = v234 = v23;
            uint64_t v53 = [v39 deviceOps];
            unint64_t v54 = [(MLCTrainingGraph *)v4 optimizer];
            [v54 deviceOps];
            v56 = unint64_t v55 = v4;
            v57 = [v39 weightsParameter];
            char v58 = [v39 biasesParameter];
            [(MLCTrainingGraph *)v55 optimizer];
            v60 = unint64_t v59 = v41;
            uint64_t v61 = [v60 oneStepOptimizerBuffers];
            v238 = (void *)v53;
            [v52 updateConvolutionLayer:v53 optimizer:v56 weightsParameter:v57 biasesParameter:v58 arrayOfParams:v61];

            unint64_t v62 = v59;
            unint64_t v9 = 0x1E6CB4000;

            uint64_t v63 = v54;
            uint64_t v64 = v52;
            os_signpost_id_t v19 = v228;
            unint64_t v23 = v234;
            v65 = v221;
            goto LABEL_47;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            v235 = v23;
            if (objc_opt_isKindOfClass())
            {
              char v39 = v23;
              unint64_t v69 = [v39 beta];
              BOOL v70 = [(MLCTrainingGraph *)v4 checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:v69 layer:v39 device:v19 isBetaTensor:1];

              unint64_t v71 = [v39 gamma];
              BOOL v72 = [(MLCTrainingGraph *)v4 checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:v71 layer:v39 device:v19 isBetaTensor:0];

              v65 = [v19 computeEngine];
              uint64_t v73 = [v39 deviceOps];
              uint64_t v74 = [(MLCTrainingGraph *)v4 optimizer];
              v238 = [v74 deviceOps];
              if (v70)
              {
                uint64_t v210 = 0;
                uint64_t v75 = v209;
              }
              else
              {
                uint64_t v75 = [v39 betaParameter];
                uint64_t v210 = v75;
              }
              v224 = (void *)v75;
              v231 = v74;
              BOOL v211 = v70;
              BOOL v100 = v72;
              if (v72)
              {
                uint64_t v101 = 0;
              }
              else
              {
                uint64_t v101 = [v39 gammaParameter];
                v208 = (void *)v101;
              }
              unint64_t v110 = [v39 mean];
              unint64_t v111 = [v39 variance];
              uint64_t v112 = [(MLCTrainingGraph *)v4 optimizer];
              uint64_t v113 = [v112 oneStepOptimizerBuffers];
              [v65 updateBatchNormalizationLayer:v73 optimizer:v238 betaParameter:v210 gammaParameter:v101 meanTensor:v110 varianceTensor:v111 arrayOfParams:v113];

              if (!v100) {
              uint64_t v63 = v224;
              }
              uint64_t v209 = (uint64_t)v224;
              objc_super v4 = v239;
              unint64_t v9 = 0x1E6CB4000;
              unint64_t v62 = (void *)v73;
              uint64_t v64 = v231;
              unint64_t v23 = v235;
              if (!v211) {
                goto LABEL_48;
              }
              goto LABEL_49;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              char v39 = v23;
              v76 = [v39 beta];
              BOOL v77 = [(MLCTrainingGraph *)v4 checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:v76 layer:v39 device:v19 isBetaTensor:1];

              id v78 = [v39 gamma];
              v79 = v4;
              BOOL v80 = [(MLCTrainingGraph *)v4 checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:v78 layer:v39 device:v19 isBetaTensor:0];

              v65 = [v19 computeEngine];
              uint64_t v81 = [v39 deviceOps];
              v229 = [(MLCTrainingGraph *)v79 optimizer];
              v238 = [v229 deviceOps];
              BOOL v222 = v77;
              if (v77)
              {
                uint64_t v82 = 0;
                uint64_t v83 = v206;
                if (!v80) {
                  goto LABEL_40;
                }
LABEL_68:
                uint64_t v84 = 0;
              }
              else
              {
                uint64_t v82 = [v39 betaParameter];
                uint64_t v83 = (void *)v82;
                if (v80) {
                  goto LABEL_68;
                }
LABEL_40:
                uint64_t v84 = [v39 gammaParameter];
                v205 = (void *)v84;
              }
              unint64_t v114 = [(MLCTrainingGraph *)v239 optimizer];
              uint64_t v115 = [v114 oneStepOptimizerBuffers];
              [v65 updateInstanceNormalizationLayer:v81 optimizer:v238 betaParameter:v82 gammaParameter:v84 arrayOfParams:v115];

              if (!v80) {
              uint64_t v63 = v83;
              }
              v206 = v83;
LABEL_88:
              objc_super v4 = v239;
              unint64_t v9 = 0x1E6CB4000;
              unint64_t v62 = (void *)v81;
              uint64_t v64 = v229;
              unint64_t v23 = v235;
              if (!v222) {
                goto LABEL_48;
              }
              goto LABEL_49;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              char v39 = v23;
              v102 = [v39 beta];
              BOOL v103 = [(MLCTrainingGraph *)v4 checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:v102 layer:v39 device:v19 isBetaTensor:1];

              uint64_t v104 = [v39 gamma];
              unint64_t v105 = v4;
              BOOL v106 = [(MLCTrainingGraph *)v4 checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:v104 layer:v39 device:v19 isBetaTensor:0];

              v65 = [v19 computeEngine];
              uint64_t v81 = [v39 deviceOps];
              v229 = [(MLCTrainingGraph *)v105 optimizer];
              v238 = [v229 deviceOps];
              BOOL v222 = v103;
              if (v103)
              {
                uint64_t v107 = 0;
                uint64_t v108 = v204;
                if (!v106) {
                  goto LABEL_61;
                }
LABEL_77:
                uint64_t v109 = 0;
              }
              else
              {
                uint64_t v107 = [v39 betaParameter];
                uint64_t v108 = (void *)v107;
                if (v106) {
                  goto LABEL_77;
                }
LABEL_61:
                uint64_t v109 = [v39 gammaParameter];
                v203 = (void *)v109;
              }
              unint64_t v124 = [(MLCTrainingGraph *)v239 optimizer];
              v125 = [v124 oneStepOptimizerBuffers];
              [v65 updateLayerNormalizationLayer:v81 optimizer:v238 betaParameter:v107 gammaParameter:v109 arrayOfParams:v125];

              if (!v106) {
              uint64_t v63 = v108;
              }
              v204 = v108;
              goto LABEL_88;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v126 = v23;
                char v39 = [v19 computeEngine];
                v65 = [v126 deviceOps];
                unint64_t v62 = [(MLCTrainingGraph *)v4 optimizer];
                uint64_t v64 = [v62 deviceOps];
                v238 = [v126 inputWeightsParameters];
                uint64_t v225 = [v126 hiddenWeightsParameters];
                [v126 biasesParameters];
                v56 = unint64_t v127 = v4;

                v232 = [(MLCTrainingGraph *)v127 optimizer];
                char v128 = [v232 oneStepOptimizerBuffers];
                uint64_t v63 = (void *)v225;
                [v39 updateRNNLayer:v65 optimizer:v64 inputWeightsParameter:v238 hiddenWeightsParameter:v225 biasesParameter:v56 arrayOfParams:v128];

                goto LABEL_47;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v39 = [v19 computeEngine];
                v65 = [v23 deviceOps];
                unint64_t v62 = [(MLCTrainingGraph *)v4 optimizer];
                uint64_t v64 = [v62 deviceOps];
                uint64_t v131 = [v23 weightsParameters];
                uint64_t v226 = [v23 biasesParameters];
                v56 = [(MLCTrainingGraph *)v4 optimizer];
                v95 = [v56 oneStepOptimizerBuffers];
                v238 = (void *)v131;
                uint64_t v132 = v131;
                uint64_t v63 = (void *)v226;
                [v39 updateMultiheadAttentionLayer:v65 optimizer:v64 weightsParameter:v132 biasesParameter:v226 arrayOfParams:v95];
                goto LABEL_46;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v39 = [v19 computeEngine];
                v65 = [v23 deviceOps];
                unint64_t v62 = [v23 weightsParameter];
                uint64_t v64 = [(MLCTrainingGraph *)v4 optimizer];
                uint64_t v133 = [v64 deviceOps];
                uint64_t v63 = [(MLCTrainingGraph *)v4 optimizer];
                v56 = [v63 oneStepOptimizerBuffers];
                v238 = (void *)v133;
                [v39 updateEmbeddingLayer:v65 weightsParameter:v62 optimizer:v133 arrayOfParams:v56];
                goto LABEL_47;
              }
              goto LABEL_50;
            }
            char v39 = v23;
            id v116 = [v39 beta];
            BOOL v117 = [(MLCTrainingGraph *)v4 checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:v116 layer:v39 device:v19 isBetaTensor:1];

            unint64_t v118 = [v39 gamma];
            id v119 = v4;
            BOOL v120 = [(MLCTrainingGraph *)v4 checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:v118 layer:v39 device:v19 isBetaTensor:0];

            v65 = [v19 computeEngine];
            uint64_t v81 = [v39 deviceOps];
            v229 = [(MLCTrainingGraph *)v119 optimizer];
            v238 = [v229 deviceOps];
            BOOL v222 = v117;
            if (v117)
            {
              uint64_t v121 = 0;
              v122 = v202;
              if (!v120) {
                goto LABEL_75;
              }
LABEL_84:
              uint64_t v123 = 0;
            }
            else
            {
              uint64_t v121 = [v39 betaParameter];
              v122 = (void *)v121;
              if (v120) {
                goto LABEL_84;
              }
LABEL_75:
              uint64_t v123 = [v39 gammaParameter];
              uint64_t v201 = (void *)v123;
            }
            v129 = [(MLCTrainingGraph *)v239 optimizer];
            v130 = [v129 oneStepOptimizerBuffers];
            [v65 updateGroupNormalizationLayer:v81 optimizer:v238 betaParameter:v121 gammaParameter:v123 arrayOfParams:v130];

            if (!v120) {
            uint64_t v63 = v122;
            }
            v202 = v122;
            goto LABEL_88;
          }
          char v39 = v23;
          unint64_t v40 = [v39 weights];
          uint64_t v41 = [v39 biases];
          uint64_t v66 = [v40 childLayers];
          unint64_t v67 = [v66 count];

          if (v67 < 2) {
            goto LABEL_45;
          }
          uint64_t v68 = [(MLCTrainingGraph *)v4 layerIndexToStoreSummedGradientsForTensor:v40];
          unint64_t v45 = [v40 childLayers];
          if (v68 == [v45 count])
          {
LABEL_32:

            goto LABEL_33;
          }
          [v40 childLayers];
          v86 = uint64_t v85 = v41;
          v87 = [v86 objectAtIndexedSubscript:v68];

          uint64_t v41 = v85;
          BOOL v49 = v87 == v39;
          unint64_t v9 = 0x1E6CB4000;
          if (v49)
          {
            uint64_t v88 = [v19 computeEngine];
            [v88 sumSharedGradientsForConvolutionLayerTensorParameter:v40 layerIndexForSummedGradients:v68];

            if (v85)
            {
              unint64_t v89 = [v19 computeEngine];
              [v89 sumSharedGradientsForConvolutionLayerTensorParameter:v85 layerIndexForSummedGradients:v68];
            }
LABEL_45:
            [v19 computeEngine];
            v223 = v40;
            v230 = v19;
            unint64_t v90 = v236 = v23;
            uint64_t v91 = [v39 deviceOps];
            uint64_t v92 = [(MLCTrainingGraph *)v4 optimizer];
            [v92 deviceOps];
            unint64_t v93 = v41;
            v56 = unint64_t v94 = v4;
            v95 = [v39 weightsParameter];
            v96 = [v39 biasesParameter];
            uint64_t v97 = [(MLCTrainingGraph *)v94 optimizer];
            v98 = [v97 oneStepOptimizerBuffers];
            v238 = (void *)v91;
            [v90 updateFullyConnectedLayer:v91 optimizer:v56 weightsParameter:v95 biasesParameter:v96 arrayOfParams:v98];

            unint64_t v9 = 0x1E6CB4000uLL;
            unint64_t v62 = v93;

            uint64_t v63 = v92;
            uint64_t v64 = v90;
            os_signpost_id_t v19 = v230;
            unint64_t v23 = v236;
            v65 = v223;
LABEL_46:

LABEL_47:
            objc_super v4 = v239;
LABEL_48:

LABEL_49:
            uint64_t v22 = v242;
LABEL_50:
            uint64_t v99 = [*(id *)(v9 + 1176) execution];
            char v39 = v99;
            if (v240 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v99))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v39, OS_SIGNPOST_INTERVAL_END, spid, "ExecuteOptimizerUpdate -- PerLayer", "", buf, 2u);
            }
            goto LABEL_53;
          }
        }
LABEL_33:

        uint64_t v22 = v242;
LABEL_53:

        uint64_t v18 = v22;
        if (!v22) {
          goto LABEL_95;
        }
      }
    }
    os_signpost_id_t v19 = 0;
    char obj = 0;
LABEL_95:
    v134 = [(MLCTrainingGraph *)v4 optimizerParameterList];
    uint64_t v135 = [v134 count];

    if (v135)
    {
      unint64_t v136 = 0;
      char v137 = obj;
      do
      {
        v138 = [(MLCTrainingGraph *)v4 optimizerParameterList];
        uint64_t v139 = [v138 objectAtIndexedSubscript:v136];

        unint64_t v140 = [*(id *)(v9 + 1176) execution];
        int v141 = v140;
        if (v218 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v140))
        {
          v142 = [v139 tensor];
          uint64_t v143 = [v142 tensorID];
          unint64_t v144 = [v139 tensor];
          char v145 = [v144 label];
          *(_DWORD *)buf = 134349314;
          uint64_t v250 = v143;
          objc_super v4 = v239;
          __int16 v251 = 2114;
          uint64_t v252 = (uint64_t)v145;
          _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v141, OS_SIGNPOST_INTERVAL_BEGIN, v212, "TensorParameterOptimizerUpdate", "Tensor parameter (%{public,name=TensorID}lu, \"%{public,name=TensorLabel}@\")", buf, 0x16u);

          unint64_t v9 = 0x1E6CB4000;
        }

        os_signpost_id_t v146 = [v139 device];

        if ([v139 isUpdatable])
        {
          if ((v137 & 1) == 0)
          {
            unsigned int v147 = [v146 computeEngine];
            v148 = [(MLCTrainingGraph *)v4 optimizer];
            uint64_t v149 = [v148 deviceOps];
            BOOL v150 = [(MLCTrainingGraph *)v4 optimizer];
            [v150 learningRate];
            objc_msgSend(v147, "setOptimizerLearningRate:learningRate:", v149);
          }
          os_signpost_id_t spida = (os_signpost_id_t)v146;
          if (isKindOfClass & 1) != 0 || (v213)
          {
            BOOL v151 = [(MLCTrainingGraph *)v4 optimizer];
            v152 = [v146 computeEngine];
            unint64_t v153 = [(MLCTrainingGraph *)v4 optimizer];
            v154 = [v153 deviceOps];
            objc_msgSend(v152, "setOptimizerTimeStep:timeStep:", v154, objc_msgSend(v151, "timeStep"));

            objc_super v4 = v239;
            os_signpost_id_t v146 = (void *)spida;
          }
          id v155 = [v146 computeEngine];
          unint64_t v156 = [(MLCTrainingGraph *)v4 optimizer];
          v157 = [v156 deviceOps];
          [(MLCTrainingGraph *)v4 rootSourceGradientTensor];
          v159 = unint64_t v158 = v4;
          unint64_t v160 = [v139 tensor];
          id v161 = objc_msgSend(v159, "objectAtIndexedSubscript:", objc_msgSend(v160, "rootSourceGradientTensorIndex") - 1);
          v162 = [(MLCTrainingGraph *)v158 optimizer];
          v163 = [v162 oneStepOptimizerBuffers];
          [v155 updateTensorParameter:v139 optimizer:v157 gradient:v161 arrayOfParams:v163];

          unint64_t v9 = 0x1E6CB4000uLL;
          v164 = +[MLCLog execution];
          __int16 v165 = v164;
          if (v218 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v164))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v165, OS_SIGNPOST_INTERVAL_END, v212, "TensorParameterOptimizerUpdate", "", buf, 2u);
          }

          char v137 = 1;
          objc_super v4 = v239;
          os_signpost_id_t v146 = (void *)spida;
        }

        ++v136;
        uint64_t v166 = [(MLCTrainingGraph *)v4 optimizerParameterList];
        unint64_t v167 = [v166 count];

        os_signpost_id_t v19 = v146;
      }
      while (v136 < v167);
    }
    else
    {
      os_signpost_id_t v146 = v19;
    }
    char v168 = [(MLCTrainingGraph *)v4 optimizer];
    char v169 = [v168 oneStepOptimizerBuffers];

    if (v169)
    {
      os_signpost_id_t spidb = (os_signpost_id_t)v146;
      long long v246 = 0u;
      long long v247 = 0u;
      long long v244 = 0u;
      long long v245 = 0u;
      id obja = [(MLCTrainingGraph *)v4 optimizerUpdateDeviceList];
      uint64_t v233 = [obja countByEnumeratingWithState:&v244 objects:v248 count:16];
      if (!v233) {
        goto LABEL_135;
      }
      uint64_t v227 = *(void *)v245;
      while (1)
      {
        uint64_t v170 = 0;
        do
        {
          if (*(void *)v245 != v227) {
            objc_enumerationMutation(obja);
          }
          uint64_t v237 = v170;
          v241 = *(void **)(*((void *)&v244 + 1) + 8 * v170);
          long long v171 = [v241 computeEngine];
          long long v172 = [(MLCTrainingGraph *)v4 optimizer];
          long long v173 = [v172 deviceOps];
          v174 = [(MLCTrainingGraph *)v4 optimizer];
          v175 = [v174 oneStepOptimizerBuffers];
          [v171 updateAllParametersWithOptimizer:v173 arrayOfParameters:v175];

          v176 = [(MLCTrainingGraph *)v4 optimizerUpdateLayerList];
          uint64_t v177 = [v176 count];

          if (v177)
          {
            for (uint64_t i = v177 - 1; i != -1; --i)
            {
              uint64_t v179 = [(MLCTrainingGraph *)v4 optimizerUpdateLayerList];
              v180 = [v179 objectAtIndexedSubscript:i];

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v181 = v180;
                id v182 = [v241 computeEngine];
                unint64_t v183 = [v181 deviceOps];
                v184 = [(MLCTrainingGraph *)v4 optimizer];
                v185 = [v184 deviceOps];
                BOOL v186 = [v181 inputWeightsParameters];
                [v181 hiddenWeightsParameters];
                unint64_t v187 = v243 = v180;
                uint64_t v188 = [v181 biasesParameters];

                os_signpost_id_t v189 = [(MLCTrainingGraph *)v4 optimizer];
                unint64_t v190 = [v189 oneStepOptimizerBuffers];
                [v182 restoreRNNParamsWithDeviceOps:v183 optimizer:v185 inputWeightsParameter:v186 hiddenWeightsParameter:v187 biasesParameter:v188 arrayOfParams:v190];

                objc_super v4 = v239;
                v180 = v243;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_132;
                }
                v191 = [v241 computeEngine];
                char v192 = objc_opt_respondsToSelector();

                if ((v192 & 1) == 0) {
                  goto LABEL_132;
                }
                id v182 = v180;
                unint64_t v183 = [v182 weights];
                v193 = [v183 childLayers];
                unint64_t v194 = [v193 count];

                if (v194 >= 2)
                {
                  uint64_t v195 = [(MLCTrainingGraph *)v4 layerIndexToStoreSummedGradientsForTensor:v183];
                  v184 = [v183 childLayers];
                  if (v195 == [v184 count]) {
                    goto LABEL_124;
                  }
                  v196 = [v183 childLayers];
                  id v197 = [v196 objectAtIndexedSubscript:v195];

                  if (v197 != v182) {
                    goto LABEL_125;
                  }
                }
                v184 = [v241 computeEngine];
                v185 = [v182 deviceOps];
                [v184 restoreConvolutionParamsWithDeviceOps:v185];
              }

LABEL_124:
LABEL_125:

LABEL_132:
            }
          }
          uint64_t v170 = v237 + 1;
        }
        while (v237 + 1 != v233);
        uint64_t v233 = [obja countByEnumeratingWithState:&v244 objects:v248 count:16];
        if (!v233)
        {
LABEL_135:

          unint64_t v9 = 0x1E6CB4000uLL;
          os_signpost_id_t v146 = (void *)spidb;
          break;
        }
      }
    }
    if ([(MLCTrainingGraph *)v4 updateOptimizerTimeStep] && ((isKindOfClass | v213) & 1) != 0)
    {
      v198 = [(MLCTrainingGraph *)v4 optimizer];
      objc_msgSend(v198, "setTimeStep:", objc_msgSend(v198, "timeStep") + 1);
    }
    __int16 v199 = [*(id *)(v9 + 1176) execution];
    uint64_t v200 = v199;
    unint64_t v5 = v207;
    if (v218 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v199))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v200, OS_SIGNPOST_INTERVAL_END, v212, "ExecuteOptimizerUpdate", "", buf, 2u);
    }
  }
}

- (BOOL)executeForwardWithBatchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options outputsData:(NSDictionary *)outputsData completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  v44[3] = *MEMORY[0x1E4F143B8];
  id v11 = outputsData;
  id v12 = completionHandler;
  CFAbsoluteTime Current = 0.0;
  if ((options & 4) != 0) {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  [(MLCTrainingGraph *)self recompileWithOptions:options];
  if ((options & 2) == 0 && !v12)
  {
    unint64_t v14 = +[MLCLog framework];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.5(a2);
    }
  }
  BOOL v15 = [(MLCGraph *)self graphLayerList];
  uint64_t v16 = [v15 count];

  if (!v16)
  {
    unint64_t v21 = +[MLCLog framework];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:](a2);
    }

    os_signpost_id_t v19 = NSStringFromSelector(a2);
    id v20 = @"Empty graph";
    goto LABEL_21;
  }
  if (![(MLCGraph *)self readyForExecution])
  {
    uint64_t v22 = +[MLCLog framework];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.4(a2);
    }

    os_signpost_id_t v19 = NSStringFromSelector(a2);
    id v20 = @"graph not ready for execution";
    goto LABEL_21;
  }
  BOOL v17 = [(MLCGraph *)self staticBatchSizeInGraph];
  if (batchSize && !v17)
  {
    uint64_t v18 = +[MLCLog framework];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:](a2);
    }

    os_signpost_id_t v19 = NSStringFromSelector(a2);
    id v20 = @"batchSize provided must be 0 since batch size changes in graph. we will use batch size specified with tensors for layers in graph";
LABEL_21:
    unint64_t v23 = +[MLCErrors invalidStateErrorForMethod:v19 description:v20];

    if (v12) {
      v12[2](v12, 0, v23, 0.0);
    }
    BOOL v24 = 0;
    goto LABEL_24;
  }
  if (v11 && ![(MLCGraph *)self checkPageAlignmentAndSizeForOutputs:v11])
  {
    uint64_t v42 = +[MLCLog framework];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:](a2);
    }

    os_signpost_id_t v19 = NSStringFromSelector(a2);
    id v20 = @"Outputs buffers must be page aligned and a multiple of page size";
    goto LABEL_21;
  }
  unint64_t v26 = [(MLCGraph *)self graphLayerList];
  uint64_t v27 = [v26 objectAtIndexedSubscript:0];
  unint64_t v23 = [(id)v27 device];

  uint64_t v28 = [v23 computeEngine];
  LOBYTE(v27) = objc_opt_respondsToSelector();

  if (v27)
  {
    int v29 = [v23 computeEngine];
    [v29 selectDevicesWithBatchSize:batchSize calledfromBindAndWrite:0];
  }
  if ((options & 4) != 0)
  {
    *(CFAbsoluteTime *)uint64_t v44 = Current;
    v44[1] = 0;
    v44[2] = 0;
    uint64_t v43 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v44 length:24];
  }
  else
  {
    uint64_t v43 = 0;
  }
  uint64_t v30 = [(MLCGraph *)self graphLayerList];
  unint64_t v31 = [(MLCGraph *)self graphLayerList];
  unint64_t v32 = objc_msgSend(v30, "objectAtIndexedSubscript:", objc_msgSend(v31, "count") - 1);

  id v33 = [v32 resultTensors];
  unint64_t v34 = [v33 objectAtIndexedSubscript:0];

  unint64_t v35 = [(MLCGraph *)self graphLayerList];
  -[MLCTrainingGraph executeForwardToLayerIndex:resultTensor:resultStateIsTemporary:batchSize:forTraining:executionOptions:](self, "executeForwardToLayerIndex:resultTensor:resultStateIsTemporary:batchSize:forTraining:executionOptions:", [v35 count], v34, 0, batchSize, (options & 8) == 0, options);

  if (v34)
  {
    char v36 = [v32 device];
    v37 = [v36 computeEngine];
    [v37 synchronizeTensor:v34];
  }
  [(MLCGraph *)self dispatchReadsForMultipleTensorOutputs:v11 finalTensorInGraph:0 finalResultTensor:0 batchSize:batchSize];
  unint64_t v38 = [v23 computeEngine];
  char v39 = v38;
  MLCExecutionOptions v40 = (options >> 2) & 1;
  if ((options & 2) != 0)
  {
    uint64_t v41 = (void *)v43;
    [v38 commitAndWaitForCompletion:v12 enableProfiling:v40 graphExecutionTime:v43 graphResultTensor:0];
  }
  else
  {
    uint64_t v41 = (void *)v43;
    [v38 commitWithCompletionHandler:v12 enableProfiling:v40 graphExecutionTime:v43 graphResultTensor:0];
  }

  BOOL v24 = 1;
LABEL_24:

  return v24;
}

- (BOOL)executeForwardWithBatchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  return [(MLCTrainingGraph *)self executeForwardWithBatchSize:batchSize options:options outputsData:0 completionHandler:completionHandler];
}

- (BOOL)executeGradientWithBatchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options outputsData:(NSDictionary *)outputsData completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v11 = outputsData;
  id v12 = completionHandler;
  CFAbsoluteTime Current = 0.0;
  if ((options & 4) != 0) {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  if ((options & 2) == 0 && !v12)
  {
    unint64_t v14 = +[MLCLog framework];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.5(a2);
    }
  }
  BOOL v15 = [(MLCGraph *)self graphLayerList];
  uint64_t v16 = [v15 count];

  if (!v16)
  {
    unint64_t v21 = +[MLCLog framework];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:](a2);
    }

    os_signpost_id_t v19 = NSStringFromSelector(a2);
    id v20 = @"Empty graph";
    goto LABEL_21;
  }
  if (![(MLCGraph *)self readyForExecution])
  {
    uint64_t v22 = +[MLCLog framework];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.4(a2);
    }

    os_signpost_id_t v19 = NSStringFromSelector(a2);
    id v20 = @"graph not ready for execution";
    goto LABEL_21;
  }
  BOOL v17 = [(MLCGraph *)self staticBatchSizeInGraph];
  if (batchSize && !v17)
  {
    uint64_t v18 = +[MLCLog framework];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:](a2);
    }

    os_signpost_id_t v19 = NSStringFromSelector(a2);
    id v20 = @"batchSize provided must be 0 since batch size changes in graph. we will use batch size specified with tensors for layers in graph";
LABEL_21:
    unint64_t v23 = +[MLCErrors invalidStateErrorForMethod:v19 description:v20];

    if (v12) {
      v12[2](v12, 0, v23, 0.0);
    }
    BOOL v24 = 0;
    goto LABEL_24;
  }
  if (v11 && ![(MLCGraph *)self checkPageAlignmentAndSizeForOutputs:v11])
  {
    id v33 = +[MLCLog framework];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:](a2);
    }

    os_signpost_id_t v19 = NSStringFromSelector(a2);
    id v20 = @"Outputs buffers must be page aligned and a multiple of page size";
    goto LABEL_21;
  }
  unint64_t v26 = [(MLCGraph *)self graphLayerList];
  uint64_t v27 = [v26 objectAtIndexedSubscript:0];
  unint64_t v23 = [v27 device];

  uint64_t v28 = 0;
  if ((options & 4) != 0)
  {
    *(CFAbsoluteTime *)unint64_t v34 = Current;
    v34[1] = 0;
    v34[2] = 0;
    uint64_t v28 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v34 length:24];
  }
  [(MLCTrainingGraph *)self compileAndAllocateGradientTensorsForGraph:0];
  int v29 = [(MLCGraph *)self graphLayerList];
  -[MLCTrainingGraph executeGradientFromLayerIndex:resultStateIsTemporary:batchSize:executionOptions:](self, "executeGradientFromLayerIndex:resultStateIsTemporary:batchSize:executionOptions:", [v29 count] - 1, 0, batchSize, options);

  [(MLCGraph *)self dispatchReadsForMultipleTensorOutputs:v11 finalTensorInGraph:0 finalResultTensor:0 batchSize:batchSize];
  uint64_t v30 = [v23 computeEngine];
  unint64_t v31 = v30;
  MLCExecutionOptions v32 = (options >> 2) & 1;
  if ((options & 2) != 0) {
    [v30 commitAndWaitForCompletion:v12 enableProfiling:v32 graphExecutionTime:v28 graphResultTensor:0];
  }
  else {
    [v30 commitWithCompletionHandler:v12 enableProfiling:v32 graphExecutionTime:v28 graphResultTensor:0];
  }

  BOOL v24 = 1;
LABEL_24:

  return v24;
}

- (BOOL)executeGradientWithBatchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  return [(MLCTrainingGraph *)self executeGradientWithBatchSize:batchSize options:options outputsData:0 completionHandler:completionHandler];
}

- (BOOL)executeOptimizerUpdateWithOptions:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  v25[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = completionHandler;
  CFAbsoluteTime Current = 0.0;
  if ((options & 4) != 0) {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  if ((options & 2) == 0 && !v7)
  {
    unint64_t v9 = +[MLCLog framework];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.5(a2);
    }
  }
  os_signpost_id_t v10 = [(MLCGraph *)self graphLayerList];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    if ([(MLCGraph *)self readyForExecution])
    {
      if ((options & 4) != 0)
      {
        *(CFAbsoluteTime *)unint64_t v25 = Current;
        v25[1] = 0;
        v25[2] = 0;
        id v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v25 length:24];
      }
      else
      {
        id v12 = 0;
      }
      [(MLCTrainingGraph *)self executeOptimizerUpdateWithExecutionOptions:options];
      uint64_t v18 = [(MLCGraph *)self graphLayerList];
      os_signpost_id_t v19 = [v18 objectAtIndexedSubscript:0];
      id v20 = [v19 device];

      unint64_t v21 = [v20 computeEngine];
      uint64_t v22 = v21;
      MLCExecutionOptions v23 = (options >> 2) & 1;
      if ((options & 2) != 0) {
        [v21 commitAndWaitForCompletion:v7 enableProfiling:v23 graphExecutionTime:v12 graphResultTensor:0];
      }
      else {
        [v21 commitWithCompletionHandler:v7 enableProfiling:v23 graphExecutionTime:v12 graphResultTensor:0];
      }

      BOOL v17 = 1;
      goto LABEL_26;
    }
    uint64_t v16 = +[MLCLog framework];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.4(a2);
    }

    unint64_t v14 = NSStringFromSelector(a2);
    BOOL v15 = @"graph not ready for execution";
  }
  else
  {
    unint64_t v13 = +[MLCLog framework];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:](a2);
    }

    unint64_t v14 = NSStringFromSelector(a2);
    BOOL v15 = @"Empty graph";
  }
  id v12 = +[MLCErrors invalidStateErrorForMethod:v14 description:v15];

  if (v7) {
    v7[2](v7, 0, v12, 0.0);
  }
  BOOL v17 = 0;
LABEL_26:

  return v17;
}

- (BOOL)executeWithInputsData:(NSDictionary *)inputsData lossLabelsData:(NSDictionary *)lossLabelsData lossLabelWeightsData:(NSDictionary *)lossLabelWeightsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  return [(MLCTrainingGraph *)self executeWithInputsData:inputsData lossLabelsData:lossLabelsData lossLabelWeightsData:lossLabelWeightsData outputsData:0 batchSize:batchSize options:options completionHandler:completionHandler];
}

- (BOOL)executeWithInputsData:(NSDictionary *)inputsData lossLabelsData:(NSDictionary *)lossLabelsData lossLabelWeightsData:(NSDictionary *)lossLabelWeightsData outputsData:(NSDictionary *)outputsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  uint64_t v208 = *MEMORY[0x1E4F143B8];
  unint64_t v14 = inputsData;
  BOOL v15 = lossLabelsData;
  uint64_t v16 = lossLabelWeightsData;
  BOOL v17 = outputsData;
  uint64_t v18 = completionHandler;
  CFAbsoluteTime Current = 0.0;
  if ((options & 4) != 0) {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  if (!v18 && (options & 2) == 0)
  {
    id v20 = +[MLCLog framework];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.5(a2);
    }
  }
  unint64_t v21 = [(MLCGraph *)self graphLayerList];
  uint64_t v22 = [v21 count];

  if (!v22)
  {
    uint64_t v27 = v17;
    unint64_t v31 = +[MLCLog framework];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:](a2);
    }

    int v29 = NSStringFromSelector(a2);
    uint64_t v30 = @"Empty graph";
    goto LABEL_37;
  }
  MLCExecutionOptions v23 = [(MLCGraph *)self allInputs];

  if (!v23)
  {
    uint64_t v27 = v17;
    MLCExecutionOptions v32 = +[MLCLog framework];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:](a2);
    }

    int v29 = NSStringFromSelector(a2);
    uint64_t v30 = @"No inputs compiled in graph";
    goto LABEL_37;
  }
  BOOL v24 = [(MLCGraph *)self allLossLabels];

  if (!v24 && v15 && ![(NSDictionary *)v15 isEqualToDictionary:MEMORY[0x1E4F1CC08]])
  {
    uint64_t v27 = v17;
    unint64_t v34 = +[MLCLog framework];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:]0(a2);
    }

    int v29 = NSStringFromSelector(a2);
    uint64_t v30 = @"No loss labels compiled in graph";
    goto LABEL_37;
  }
  unint64_t v25 = [(MLCGraph *)self allLossLabelWeights];

  if (!v25 && v16 && ![(NSDictionary *)v16 isEqualToDictionary:MEMORY[0x1E4F1CC08]])
  {
    uint64_t v27 = v17;
    unint64_t v35 = +[MLCLog framework];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.9(a2);
    }

    int v29 = NSStringFromSelector(a2);
    uint64_t v30 = @"No loss label weights compiled in graph";
    goto LABEL_37;
  }
  if (![(MLCGraph *)self readyForExecution])
  {
    uint64_t v27 = v17;
    id v33 = +[MLCLog framework];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.4(a2);
    }

    int v29 = NSStringFromSelector(a2);
    uint64_t v30 = @"graph not ready for execution";
    goto LABEL_37;
  }
  BOOL v26 = [(MLCGraph *)self staticBatchSizeInGraph];
  if (!batchSize || v26)
  {
    if (v17 && ![(MLCGraph *)self checkPageAlignmentAndSizeForOutputs:v17])
    {
      uint64_t v27 = v17;
      uint64_t v83 = +[MLCLog framework];
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
        -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:](a2);
      }

      int v29 = NSStringFromSelector(a2);
      uint64_t v30 = @"Outputs buffers must be page aligned and a multiple of page size";
      goto LABEL_37;
    }
    unint64_t v194 = v16;
    __int16 v199 = v14;
    char v39 = [(MLCGraph *)self graphLayerList];
    MLCExecutionOptions v40 = [v39 objectAtIndexedSubscript:0];
    os_signpost_id_t v189 = [v40 device];

    uint64_t v41 = [(MLCGraph *)self graphLayerList];
    uint64_t v42 = [v41 count];

    uint64_t v43 = [(MLCGraph *)self graphLayerList];
    uint64_t v44 = [v43 count];

    while (v44-- >= 1)
    {
      v46 = [(MLCGraph *)self graphLayerList];
      unint64_t v47 = [v46 objectAtIndexedSubscript:v44];
      char v48 = [v47 skipLayer];

      if ((v48 & 1) == 0) {
        goto LABEL_48;
      }
    }
    uint64_t v44 = v42;
LABEL_48:
    BOOL v49 = [(MLCGraph *)self graphLayerList];
    uint64_t v50 = [v49 objectAtIndexedSubscript:v44];

    objc_opt_class();
    v203 = v50;
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v51 = [v50 resultTensors];
    unint64_t v52 = [v51 objectAtIndexedSubscript:0];

    uint64_t v53 = [v52 descriptor];
    unint64_t v54 = [v53 tensorAllocationSizeInBytes];
    unint64_t v55 = [v52 descriptor];
    unint64_t size = v54 / [v55 elementCount];

    uint64_t v200 = v52;
    v56 = [v52 descriptor];
    size_t v57 = [v56 elementCount];

    v193 = v15;
    if (isKindOfClass)
    {
      uint64_t v195 = [v203 resultTensors];
      char v58 = [v195 objectAtIndexedSubscript:0];
      unint64_t v59 = [v58 descriptor];
      unint64_t v60 = [v59 shape];
      uint64_t v61 = [v60 objectAtIndexedSubscript:0];
      uint64_t v191 = [v61 unsignedIntegerValue];

      if (v191 == 1)
      {
        v196 = [v203 sourceTensors];
        unint64_t v62 = [v196 objectAtIndexedSubscript:0];
        uint64_t v63 = [v62 descriptor];
        uint64_t v64 = [v63 shape];
        v65 = [v64 objectAtIndexedSubscript:0];
        v57 *= [v65 unsignedIntegerValue];
      }
    }
    uint64_t v66 = +[MLCTensorData dataWithBytesNoCopy:malloc_type_calloc(v57, size, 0x3E4CE1ACuLL) length:v57 * size freeWhenDone:1];
    unint64_t v190 = [v200 descriptor];
    char v192 = (void *)v66;
    unint64_t v67 = +[MLCTensor tensorWithDescriptor:data:](MLCTensor, "tensorWithDescriptor:data:");
    objc_msgSend(v67, "setMultiDeviceReductionType:", objc_msgSend(v200, "multiDeviceReductionType"));
    uint64_t v68 = [(MLCGraph *)self device];
    [v67 setDevice:v68];

    if ((options & 4) != 0)
    {
      long long buf = *(unint64_t *)&Current;
      uint64_t v207 = 0;
      uint64_t v69 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&buf length:24];
      BOOL v70 = +[MLCLog execution];
      os_signpost_id_t v71 = os_signpost_id_generate(v70);
    }
    else
    {
      uint64_t v69 = 0;
      os_signpost_id_t v71 = 0;
    }
    BOOL v72 = +[MLCLog execution];
    uint64_t v73 = v72;
    os_signpost_id_t spid = v71;
    unint64_t v74 = v71 - 1;
    sizea = v67;
    id v197 = (void *)v69;
    if (options)
    {
      if (v74 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v73, OS_SIGNPOST_INTERVAL_BEGIN, spid, "BindDataLSTMLayers", "", (uint8_t *)&buf, 2u);
      }

      [(MLCGraph *)self updateLSTMLayersForVariableSequenceLengthInGraph:self withInputData:v199];
      BOOL v80 = +[MLCLog execution];
      uint64_t v81 = v80;
      if (v74 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v80)) {
        goto LABEL_86;
      }
      LOWORD(buf) = 0;
      uint64_t v82 = "BindDataLSTMLayers";
      goto LABEL_67;
    }
    unint64_t v183 = v74;
    if (v74 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v73, OS_SIGNPOST_INTERVAL_BEGIN, spid, "BindData", "", (uint8_t *)&buf, 2u);
    }

    uint64_t v179 = [(MLCGraph *)self allInputs];
    uint64_t v75 = [(MLCGraph *)self graphLayerList];
    v76 = [v75 objectAtIndexedSubscript:0];
    BOOL v77 = [v76 device];
    MLCExecutionOptions v177 = (options >> 1) & 1;
    BOOL v78 = [(MLCGraph *)self bindAndWriteData:v199 forInputs:v179 toDevice:v77 batchSize:batchSize synchronous:v177 skipWrite:0];

    if (v78)
    {
      v79 = [v203 device];
      uint64_t v16 = v194;
      if ([v79 type] == 1)
      {
        objc_opt_class();
        char v180 = objc_opt_isKindOfClass();
      }
      else
      {
        char v180 = 0;
      }
      unint64_t v67 = sizea;

      if (!v193) {
        goto LABEL_140;
      }
      unint64_t v93 = [(MLCGraph *)self allLossLabels];
      unint64_t v94 = [(MLCGraph *)self graphLayerList];
      v95 = [v94 objectAtIndexedSubscript:0];
      v96 = [v95 device];
      BOOL v97 = [(MLCGraph *)self bindAndWriteData:v193 forInputs:v93 toDevice:v96 batchSize:batchSize synchronous:v177 skipWrite:v180 & 1];

      unint64_t v67 = sizea;
      uint64_t v16 = v194;

      unint64_t v74 = v183;
      if (!v97)
      {
        uint64_t v108 = NSString;
        uint64_t v109 = [(MLCGraph *)self allLossLabels];
        v86 = [v108 stringWithFormat:@"loss label name missing from loss labels specified at compile time allLossLabels=%@", v109];

        unint64_t v110 = +[MLCLog framework];
        if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
          -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:]();
        }
        uint64_t v88 = v17;

        unint64_t v111 = NSStringFromSelector(a2);
        unint64_t v90 = +[MLCErrors invalidInputErrorForMethod:v111 description:v86];

        unint64_t v14 = v199;
        char v36 = v189;
        if (v18) {
          v18[2](v18, 0, v90, 0.0);
        }
        uint64_t v112 = +[MLCLog execution];
        uint64_t v92 = v112;
        BOOL v15 = v193;
        if (v183 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v112)) {
          goto LABEL_113;
        }
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v86;
      }
      else
      {
LABEL_140:
        if (!v16) {
          goto LABEL_83;
        }
        v98 = v16;
        v174 = [(MLCGraph *)self allLossLabelWeights];
        uint64_t v99 = [(MLCGraph *)self graphLayerList];
        BOOL v100 = [v99 objectAtIndexedSubscript:0];
        uint64_t v101 = [v100 device];
        BOOL v181 = [(MLCGraph *)self bindAndWriteData:v98 forInputs:v174 toDevice:v101 batchSize:batchSize synchronous:v177 skipWrite:v180 & 1];

        unint64_t v67 = sizea;
        if (v181)
        {
LABEL_83:
          v102 = +[MLCLog execution];
          uint64_t v81 = v102;
          if (v74 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v102)) {
            goto LABEL_86;
          }
          LOWORD(buf) = 0;
          uint64_t v82 = "BindData";
LABEL_67:
          _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v81, OS_SIGNPOST_INTERVAL_END, spid, v82, "", (uint8_t *)&buf, 2u);
LABEL_86:

          if ((options & 8) != 0
            || ([(MLCTrainingGraph *)self compileAndAllocateGradientTensorsForGraph:0], (isKindOfClass & 1) == 0))
          {
            [(MLCTrainingGraph *)self executeForwardToLayerIndex:v44 + 1 resultTensor:v67 resultStateIsTemporary:1 batchSize:batchSize forTraining:(options & 8) == 0 executionOptions:options];
          }
          else
          {
            [(MLCTrainingGraph *)self executeForwardToLayerIndex:v44 resultTensor:0 resultStateIsTemporary:1 batchSize:batchSize forTraining:1 executionOptions:options];
            BOOL v103 = [(MLCGraph *)self allLossLabels];
            uint64_t v104 = [v103 allKeys];

            if ([v104 count])
            {
              unint64_t v105 = [v104 objectAtIndexedSubscript:0];
              BOOL v106 = [(MLCGraph *)self allLossLabels];
              uint64_t v107 = [v106 objectForKeyedSubscript:v105];
            }
            else
            {
              uint64_t v107 = 0;
            }
            uint64_t v113 = [(MLCGraph *)self allLossLabelWeights];
            unint64_t v114 = [v113 allKeys];

            if ([v114 count])
            {
              uint64_t v115 = [v114 objectAtIndexedSubscript:0];
              id v116 = [(MLCGraph *)self allLossLabelWeights];
              os_signpost_id_t spida = [v116 objectForKeyedSubscript:v115];
            }
            else
            {
              os_signpost_id_t spida = 0;
            }
            if (v107)
            {
              BOOL v117 = [(MLCGraph *)self graphLayerList];
              unint64_t v118 = [v117 objectAtIndexedSubscript:v44];

              id v119 = [v118 resultGradientTensors];
              v184 = [v119 objectAtIndexedSubscript:0];

              v175 = [v107 descriptor];
              long long v173 = [v175 shape];
              uint64_t v120 = [v173 count];
              uint64_t v121 = [v107 descriptor];
              MLCGraphCompilationOptions v178 = v114;
              id v182 = v104;
              v122 = v121;
              if (v120 == 1)
              {
                uint64_t v123 = [v121 shape];
                unint64_t v124 = [v123 objectAtIndexedSubscript:0];
                unint64_t v171 = [v124 unsignedIntegerValue];
              }
              else
              {
                uint64_t v123 = [v121 stride];
                unint64_t v124 = [v123 objectAtIndexedSubscript:0];
                unint64_t v171 = (unint64_t)[v124 unsignedIntegerValue] >> 2;
              }

              [v118 setBatchSize:batchSize];
              v176 = [v118 device];
              [v176 computeEngine];
              uint64_t v133 = v172 = v118;
              v134 = [v118 deviceOps];
              uint64_t v135 = [v118 sourceTensors];
              unint64_t v136 = [v135 objectAtIndexedSubscript:0];
              [v133 dispatchForwardAndGradientLossLayer:v134 sourceTensor:v136 labelsTensor:v107 labelsTensorStride:v171 weightsTensor:spida resultTensor:sizea resultGradientTensor:v184];

              unint64_t v114 = v178;
              uint64_t v104 = v182;
            }
          }
          char v137 = [(MLCGraph *)self graphLayerList];
          v138 = [v137 objectAtIndexedSubscript:v44];
          int v139 = [v138 isDebuggingEnabled];

          if (v139)
          {
            unint64_t v140 = [sizea deviceMemory];
            int v141 = [(MLCGraph *)self graphLayerList];
            v142 = [v141 objectAtIndexedSubscript:v44];
            uint64_t v143 = [v142 resultTensors];
            unint64_t v144 = [v143 objectAtIndexedSubscript:0];
            [v144 setDeviceMemory:v140];
          }
          char v145 = [(MLCGraph *)self graphLayerList];
          os_signpost_id_t v146 = [v145 objectAtIndexedSubscript:0];
          unsigned int v147 = [v146 device];
          v148 = [v147 computeEngine];
          os_signpost_id_t spidb = (options >> 2) & 1;
          [v148 commitWithProfiling:spidb graphExecutionTime:v197];

          if ((options & 8) == 0)
          {
            v185 = v17;
            uint64_t v149 = [(MLCTrainingGraph *)self optimizer];

            if (v149)
            {
              BOOL v150 = [(MLCTrainingGraph *)self optimizerUpdateLayerList];
              uint64_t v151 = [v150 count];

              if (v151)
              {
                unint64_t v152 = 0;
                do
                {
                  unint64_t v153 = [(MLCTrainingGraph *)self optimizerUpdateLayerList];
                  v154 = [v153 objectAtIndexedSubscript:v152];

                  id v155 = [v154 device];
                  unint64_t v156 = [v155 computeEngine];
                  v157 = [v154 deviceOps];
                  [v156 incrementReadCountForGradientState:v157 increment:1];

                  ++v152;
                  unint64_t v158 = [(MLCTrainingGraph *)self optimizerUpdateLayerList];
                  unint64_t v159 = [v158 count];
                }
                while (v152 < v159);
              }
            }
            uint64_t v160 = v44 - (isKindOfClass & 1);
            if (v160 >= 0) {
              [(MLCTrainingGraph *)self executeGradientFromLayerIndex:v160 resultStateIsTemporary:1 batchSize:batchSize executionOptions:options];
            }
            [(MLCTrainingGraph *)self executeOptimizerUpdateWithExecutionOptions:options];
            BOOL v17 = v185;
          }
          uint64_t v131 = sizea;
          if (sizea)
          {
            id v161 = [v203 device];
            v162 = [v161 computeEngine];
            [v162 synchronizeTensor:sizea];

            v163 = [v203 device];
            v164 = [v163 computeEngine];
            __int16 v165 = [v203 resultTensors];
            uint64_t v166 = [v165 objectAtIndexedSubscript:0];
            [v164 shareDeviceMemoryWithResultTensor:v166 sourceTensor:sizea];

            uint64_t v131 = sizea;
          }
          unint64_t v167 = [v203 resultTensors];
          char v168 = [v167 objectAtIndexedSubscript:0];
          [(MLCGraph *)self dispatchReadsForMultipleTensorOutputs:v17 finalTensorInGraph:v168 finalResultTensor:v131 batchSize:batchSize];

          unint64_t v14 = v199;
          if ((options & 2) != 0)
          {
            BOOL v15 = v193;
            char v36 = v189;
            if ((executeWithInputsData_lossLabelsData_lossLabelWeightsData_outputsData_batchSize_options_completionHandler__warnedAlready & 1) == 0)
            {
              char v169 = +[MLCLog framework];
              if (os_log_type_enabled(v169, OS_LOG_TYPE_INFO))
              {
                uint64_t v170 = NSStringFromSelector(a2);
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v170;
                _os_log_impl(&dword_1DD0C9000, v169, OS_LOG_TYPE_INFO, "%@: Synchronous Execution requested", (uint8_t *)&buf, 0xCu);

                BOOL v15 = v193;
              }

              executeWithInputsData_lossLabelsData_lossLabelWeightsData_outputsData_batchSize_options_completionHandler__warnedAlready = 1;
              uint64_t v131 = sizea;
            }
            v86 = [v189 computeEngine];
            uint64_t v132 = v197;
            [v86 commitAndWaitForCompletion:v18 enableProfiling:spidb graphExecutionTime:v197 graphResultTensor:v131];
            BOOL v37 = 1;
          }
          else
          {
            char v36 = v189;
            v86 = [v189 computeEngine];
            uint64_t v132 = v197;
            [v86 commitWithCompletionHandler:v18 enableProfiling:spidb graphExecutionTime:v197 graphResultTensor:v131];
            BOOL v37 = 1;
            BOOL v15 = v193;
          }
          uint64_t v16 = v194;
          goto LABEL_137;
        }
        unint64_t v125 = v74;
        id v126 = NSString;
        unint64_t v127 = [(MLCGraph *)self allLossLabelWeights];
        v86 = [v126 stringWithFormat:@"loss label weight name missing from loss label weights specified at compile time allLossLabelWeights=%@", v127];

        char v128 = +[MLCLog framework];
        if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR)) {
          -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:]();
        }
        uint64_t v88 = v17;

        v129 = NSStringFromSelector(a2);
        unint64_t v90 = +[MLCErrors invalidInputErrorForMethod:v129 description:v86];

        unint64_t v14 = v199;
        uint64_t v16 = v194;
        char v36 = v189;
        if (v18) {
          v18[2](v18, 0, v90, 0.0);
        }
        v130 = +[MLCLog execution];
        uint64_t v92 = v130;
        BOOL v15 = v193;
        if (v125 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v130))
        {
LABEL_113:

          BOOL v37 = 0;
          BOOL v17 = v88;
          uint64_t v131 = sizea;
          uint64_t v132 = v197;
LABEL_137:

          goto LABEL_40;
        }
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v86;
      }
    }
    else
    {
      uint64_t v84 = NSString;
      uint64_t v85 = [(MLCGraph *)self allInputs];
      v86 = [v84 stringWithFormat:@"input name missing from inputs specified at compile time allInputs=%@", v85];

      v87 = +[MLCLog framework];
      uint64_t v16 = v194;
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
        -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:]();
      }
      uint64_t v88 = v17;

      unint64_t v89 = NSStringFromSelector(a2);
      unint64_t v90 = +[MLCErrors invalidInputErrorForMethod:v89 description:v86];

      unint64_t v14 = v199;
      char v36 = v189;
      if (v18) {
        v18[2](v18, 0, v90, 0.0);
      }
      uint64_t v91 = +[MLCLog execution];
      uint64_t v92 = v91;
      BOOL v15 = v193;
      if (v183 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v91)) {
        goto LABEL_113;
      }
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v86;
    }
    _os_signpost_emit_with_name_impl(&dword_1DD0C9000, v92, OS_SIGNPOST_INTERVAL_END, spid, "BindData", "%{public,name=Error}@", (uint8_t *)&buf, 0xCu);
    goto LABEL_113;
  }
  uint64_t v27 = v17;
  uint64_t v28 = +[MLCLog framework];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:](a2);
  }

  int v29 = NSStringFromSelector(a2);
  uint64_t v30 = @"batchSize provided must be 0 since batch size changes in graph. we will use batch size specified with tensors for layers in graph";
LABEL_37:
  char v36 = +[MLCErrors invalidStateErrorForMethod:v29 description:v30];

  if (v18) {
    v18[2](v18, 0, v36, 0.0);
  }
  BOOL v37 = 0;
  BOOL v17 = v27;
LABEL_40:

  return v37;
}

- (id)resultGradientTensorsForLayer:(id)a3 summedGradientForInputTensors:(BOOL)a4
{
  BOOL v69 = a4;
  id v5 = a3;
  BOOL v6 = [(MLCGraph *)self graphLayerList];
  BOOL v7 = [(MLCGraph *)self isLayerInGraphLayerList:v5 graphLayerList:v6];

  if (!v7)
  {
    int v29 = +[MLCLog framework];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph resultGradientTensorsForLayer:summedGradientForInputTensors:]();
    }
    goto LABEL_18;
  }
  if (([v5 isTrainable] & 1) == 0)
  {
    int v29 = +[MLCLog framework];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph resultGradientTensorsForLayer:summedGradientForInputTensors:]();
    }
    goto LABEL_18;
  }
  if ([v5 skipLayer])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v8 = [v5 resultTensors];
      unint64_t v9 = [v8 objectAtIndexedSubscript:0];
      os_signpost_id_t v10 = [v9 parentLayers];
      id v11 = [v10 objectAtIndexedSubscript:0];

      id v12 = [v5 resultTensors];
      unint64_t v13 = [v12 objectAtIndexedSubscript:0];
      unint64_t v14 = v13;
      if (v11 != v5)
      {
        BOOL v15 = [v13 parentLayers];
        uint64_t v16 = [v15 objectAtIndexedSubscript:0];

        BOOL v17 = [v5 resultGradientTensors];
        uint64_t v18 = [v17 count];

        if (!v18)
        {
          os_signpost_id_t v19 = [v5 sourceTensors];
          id v20 = [v19 objectAtIndexedSubscript:0];
          unint64_t v21 = [v16 sourceTensors];
          uint64_t v22 = [v21 objectAtIndexedSubscript:2];

          if (v20 == v22)
          {
            char v36 = [v16 resultGradientTensors];
            BOOL v37 = [v36 objectAtIndexedSubscript:2];
            unint64_t v38 = [v5 resultGradientTensors];
            [v38 setObject:v37 atIndexedSubscript:0];

            BOOL v26 = [v16 sourceGradientTensors];
            uint64_t v27 = v26;
            uint64_t v28 = 0;
          }
          else
          {
            MLCExecutionOptions v23 = [v16 sourceGradientTensors];
            BOOL v24 = [v23 objectAtIndexedSubscript:0];
            unint64_t v25 = [v5 resultGradientTensors];
            [v25 setObject:v24 atIndexedSubscript:0];

            BOOL v26 = [v16 resultGradientTensors];
            uint64_t v27 = v26;
            uint64_t v28 = 2;
          }
          char v39 = [v26 objectAtIndexedSubscript:v28];
          MLCExecutionOptions v40 = [v5 resultGradientTensors];
          [v40 setObject:v39 atIndexedSubscript:1];
        }
        goto LABEL_25;
      }
      uint64_t v30 = [v13 childLayers];
      unint64_t v31 = [v30 objectAtIndexedSubscript:0];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        MLCExecutionOptions v32 = [v31 fusedLayers];
        id v33 = [v32 objectAtIndexedSubscript:0];

        if (v33 == v5)
        {
          uint64_t v16 = v5;
          id v5 = v31;
LABEL_25:

          goto LABEL_26;
        }
      }
    }
    int v29 = +[MLCLog framework];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph resultGradientTensorsForLayer:summedGradientForInputTensors:]();
    }
LABEL_18:

    unint64_t v34 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_19;
  }
LABEL_26:
  uint64_t v41 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v42 = [v5 sourceTensors];
  uint64_t v43 = [v42 count];

  if (v43)
  {
    unint64_t v44 = 0;
    uint64_t v45 = 0;
    do
    {
      v46 = [v5 sourceTensors];
      unint64_t v47 = [v46 objectAtIndexedSubscript:v44];
      char v48 = [v47 computeFlags];

      if ((v48 & 8) == 0)
      {
        BOOL v49 = [v5 sourceTensors];
        uint64_t v50 = [v49 objectAtIndexedSubscript:v44];
        uint64_t v51 = [v50 parentLayers];
        uint64_t v52 = [v51 count];

        if (v52 || !v69)
        {
          unint64_t v62 = [v5 resultGradientTensors];
          uint64_t v63 = [v62 count];

          if (!v63) {
            break;
          }
          unint64_t v59 = [v5 resultGradientTensors];
          unint64_t v60 = v59;
          uint64_t v61 = v44;
        }
        else
        {
          uint64_t v53 = [v5 sourceTensors];
          unint64_t v54 = [v53 objectAtIndexedSubscript:v44];
          uint64_t v55 = [v54 rootSourceGradientTensorIndexStart];
          v56 = [v5 sourceTensors];
          size_t v57 = [v56 objectAtIndexedSubscript:v44];
          uint64_t v58 = v55 + [v57 rootSourceGradientTensorCount] - 2;

          unint64_t v59 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
          unint64_t v60 = v59;
          uint64_t v61 = v58;
        }
        uint64_t v64 = [v59 objectAtIndexedSubscript:v61];
        [v41 setObject:v64 atIndexedSubscript:v45];

        ++v45;
      }
      ++v44;
      v65 = [v5 sourceTensors];
      unint64_t v66 = [v65 count];
    }
    while (v44 < v66);
  }
  if ([v41 count])
  {
    unint64_t v67 = 0;
    do
    {
      uint64_t v68 = [v41 objectAtIndexedSubscript:v67];
      if ([v5 isDebuggingEnabled]) {
        [v68 synchronizeData];
      }

      ++v67;
    }
    while (v67 < [v41 count]);
  }
  unint64_t v34 = (void *)[v41 copy];

LABEL_19:

  return v34;
}

- (MLCTensor)gradientTensorForInput:(MLCTensor *)input
{
  objc_super v4 = input;
  id v5 = [(MLCTensor *)v4 parentLayers];
  if ([v5 count])
  {
  }
  else
  {
    uint64_t v8 = [(MLCTensor *)v4 rootSourceGradientTensorIndexStart];

    if (v8)
    {
      uint64_t v9 = [(MLCTensor *)v4 rootSourceGradientTensorIndexStart];
      uint64_t v10 = v9 + [(MLCTensor *)v4 rootSourceGradientTensorCount] - 2;
      id v11 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
      BOOL v7 = [v11 objectAtIndexedSubscript:v10];

      goto LABEL_8;
    }
  }
  BOOL v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCTrainingGraph gradientTensorForInput:]();
  }

  BOOL v7 = 0;
LABEL_8:

  return (MLCTensor *)v7;
}

- (NSArray)resultGradientTensorsForLayer:(MLCLayer *)layer
{
  return (NSArray *)[(MLCTrainingGraph *)self resultGradientTensorsForLayer:layer summedGradientForInputTensors:0];
}

- (NSArray)sourceGradientTensorsForLayer:(MLCLayer *)layer
{
  objc_super v4 = layer;
  id v5 = [(MLCGraph *)self graphLayerList];
  LOBYTE(self) = [(MLCGraph *)self isLayerInGraphLayerList:v4 graphLayerList:v5];

  if (self)
  {
    BOOL v6 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    BOOL v7 = [(MLCLayer *)v4 sourceGradientTensors];
    uint64_t v8 = [v7 count];

    if (v8 == 1)
    {
      if ([(MLCLayer *)v4 skipLayer])
      {
        uint64_t v9 = [(MLCLayer *)v4 resultTensors];
        uint64_t v10 = [v9 objectAtIndexedSubscript:0];
        id v11 = [v10 parentLayers];
        id v12 = [v11 objectAtIndexedSubscript:0];
        unint64_t v13 = [v12 sourceGradientTensors];
        unint64_t v14 = [v13 objectAtIndexedSubscript:0];
        [v6 setObject:v14 atIndexedSubscript:0];
      }
      else
      {
        uint64_t v9 = [(MLCLayer *)v4 sourceGradientTensors];
        uint64_t v10 = [v9 objectAtIndexedSubscript:0];
        [v6 setObject:v10 atIndexedSubscript:0];
      }
    }
    else
    {
      BOOL v17 = [(MLCLayer *)v4 sourceGradientTensors];
      uint64_t v18 = [v17 count];

      if (v18)
      {
        unint64_t v19 = 0;
        do
        {
          id v20 = [(MLCLayer *)v4 sourceGradientTensors];
          unint64_t v21 = [v20 objectAtIndexedSubscript:v19];
          [v6 setObject:v21 atIndexedSubscript:v19];

          ++v19;
          uint64_t v22 = [(MLCLayer *)v4 sourceGradientTensors];
          unint64_t v23 = [v22 count];
        }
        while (v19 < v23);
      }
    }
    if ([v6 count])
    {
      unint64_t v24 = 0;
      do
      {
        unint64_t v25 = [v6 objectAtIndexedSubscript:v24];
        if ([(MLCLayer *)v4 isDebuggingEnabled]) {
          [v25 synchronizeData];
        }

        ++v24;
      }
      while (v24 < [v6 count]);
    }
    uint64_t v16 = (void *)[v6 copy];
  }
  else
  {
    BOOL v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph resultGradientTensorsForLayer:summedGradientForInputTensors:]();
    }

    uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v16;
}

- (id)resultTensorsForLayer:(id)a3
{
  id v4 = a3;
  id v5 = [(MLCGraph *)self graphLayerList];
  v8.receiver = self;
  v8.super_class = (Class)MLCTrainingGraph;
  BOOL v6 = [(MLCGraph *)&v8 resultTensorsForLayer:v4 graphLayerList:v5];

  return v6;
}

- (id)sourceTensorsForLayer:(id)a3
{
  id v4 = a3;
  id v5 = [(MLCGraph *)self graphLayerList];
  v8.receiver = self;
  v8.super_class = (Class)MLCTrainingGraph;
  BOOL v6 = [(MLCGraph *)&v8 sourceTensorsForLayer:v4 graphLayerList:v5];

  return v6;
}

- (MLCTensor)allocateUserGradientForTensor:(MLCTensor *)tensor
{
  id v5 = tensor;
  if (![(MLCGraph *)self readyForExecution])
  {
    unint64_t v21 = +[MLCLog framework];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph allocateUserGradientForTensor:](a2);
    }
    goto LABEL_14;
  }
  if (![(MLCTrainingGraph *)self allocateResultGradientTensors])
  {
    unint64_t v21 = +[MLCLog framework];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph allocateUserGradientForTensor:](a2);
    }
LABEL_14:

    uint64_t v22 = 0;
    goto LABEL_15;
  }
  BOOL v6 = [(MLCTensor *)v5 parentLayers];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    unint64_t v24 = [(MLCTensor *)v5 childLayers];
    unint64_t v25 = [(MLCTrainingGraph *)self dummyLayer];
    [v24 addObject:v25];

    BOOL v26 = [(MLCTensor *)v5 device];
    [(MLCTrainingGraph *)self allocateRootSourceGradientTensors:v26];

    uint64_t v27 = [(MLCTrainingGraph *)self rootSourceGradientTensor];
    uint64_t v22 = objc_msgSend(v27, "objectAtIndexedSubscript:", -[MLCTensor rootSourceGradientTensorIndex](v5, "rootSourceGradientTensorIndex") - 1);

    [(MLCTensor *)v5 setRootSourceGradientTensorIndex:[(MLCTensor *)v5 rootSourceGradientTensorIndex] + 1];
    goto LABEL_15;
  }
  objc_super v8 = [(MLCTensor *)v5 parentLayers];
  uint64_t v9 = [v8 objectAtIndexedSubscript:0];

  uint64_t v10 = [(MLCTensor *)v5 childLayers];
  id v11 = [(MLCTrainingGraph *)self dummyLayer];
  [v10 addObject:v11];

  id v12 = [(MLCTensor *)v5 childLayers];
  uint64_t v13 = [v12 count];

  if (v13 == 1)
  {
    unint64_t v14 = [v9 resultTensors];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      unint64_t v16 = 0;
      while (1)
      {
        BOOL v17 = [v9 resultTensors];
        uint64_t v18 = [v17 objectAtIndexedSubscript:v16];

        if (v18 == v5) {
          break;
        }
        ++v16;
        unint64_t v19 = [v9 resultTensors];
        unint64_t v20 = [v19 count];

        if (v16 >= v20) {
          goto LABEL_27;
        }
      }
LABEL_28:
      unint64_t v34 = [v9 sourceGradientTensors];
      uint64_t v30 = v34;
      uint64_t v33 = v16;
      goto LABEL_29;
    }
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v29 = [v9 device];
    if (isKindOfClass)
    {
      [(MLCTrainingGraph *)self allocateGradientTensorsForMultipleChildrenOfSplitLayer:v9 tensor:v5 gradientTensorsAreTemporary:0 device:v29];

      uint64_t v30 = [v9 intermediateGradientTensors];
      unint64_t v31 = [v9 intermediateGradientTensors];
      uint64_t v22 = objc_msgSend(v30, "objectAtIndexedSubscript:", objc_msgSend(v31, "count") - 1);

LABEL_30:
      goto LABEL_31;
    }
    BOOL v32 = [(MLCTrainingGraph *)self allocateGradientTensorsForMultipleChildrenOfLayer:v9 gradientTensorsAreTemporary:0 device:v29];

    if (v32)
    {
      objc_msgSend(v9, "setIntermediateGradientTensorIndex:", objc_msgSend(v9, "intermediateGradientTensorIndex") + 1);
      uint64_t v30 = [v9 intermediateGradientTensors];
      uint64_t v33 = [v9 intermediateGradientTensorIndex] - 1;
      unint64_t v34 = v30;
LABEL_29:
      uint64_t v22 = [v34 objectAtIndexedSubscript:v33];
      goto LABEL_30;
    }
    unint64_t v35 = [v9 resultTensors];
    uint64_t v36 = [v35 count];

    if (v36)
    {
      unint64_t v16 = 0;
      do
      {
        BOOL v37 = [v9 resultTensors];
        unint64_t v38 = [v37 objectAtIndexedSubscript:v16];

        if (v38 == v5) {
          goto LABEL_28;
        }
        ++v16;
        char v39 = [v9 resultTensors];
        unint64_t v40 = [v39 count];
      }
      while (v16 < v40);
    }
  }
LABEL_27:
  uint64_t v22 = 0;
LABEL_31:

LABEL_15:

  return (MLCTensor *)v22;
}

- (BOOL)linkWithGraphs:(NSArray *)graphs
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = graphs;
  if (([(MLCGraph *)self compilerOptions] & 4) == 0)
  {
    BOOL v6 = +[MLCLog framework];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = NSStringFromSelector(a2);
      int v24 = 138412546;
      unint64_t v25 = v7;
      __int16 v26 = 2112;
      uint64_t v27 = self;
      _os_log_impl(&dword_1DD0C9000, v6, OS_LOG_TYPE_INFO, "%@: Graph(=%@) is not compiled with MLCGraphCompilationOptionsLinkGraphs", (uint8_t *)&v24, 0x16u);
    }
    goto LABEL_26;
  }
  if (![(NSArray *)v5 count]) {
    goto LABEL_20;
  }
  if ([(NSArray *)v5 count])
  {
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = [(NSArray *)v5 objectAtIndexedSubscript:v8];
      char v10 = [v9 compilerOptions];

      if ((v10 & 4) == 0) {
        break;
      }
      if (++v8 >= [(NSArray *)v5 count]) {
        goto LABEL_9;
      }
    }
    BOOL v6 = +[MLCLog framework];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_26;
    }
    unint64_t v21 = NSStringFromSelector(a2);
    uint64_t v22 = [(NSArray *)v5 objectAtIndexedSubscript:v8];
    int v24 = 138412546;
    unint64_t v25 = v21;
    __int16 v26 = 2112;
    uint64_t v27 = v22;
    _os_log_impl(&dword_1DD0C9000, v6, OS_LOG_TYPE_INFO, "%@: Graph(=%@) is not compiled with MLCGraphCompilationOptionsLinkGraphs", (uint8_t *)&v24, 0x16u);

LABEL_25:
LABEL_26:

    BOOL v18 = 0;
    goto LABEL_27;
  }
LABEL_9:
  if ([(NSArray *)v5 count])
  {
    uint64_t v11 = 0;
    while (1)
    {
      id v12 = [(MLCGraph *)self device];
      uint64_t v13 = [(NSArray *)v5 objectAtIndexedSubscript:v11];
      unint64_t v14 = [v13 device];

      if (v12 != v14) {
        break;
      }
      if (++v11 >= [(NSArray *)v5 count]) {
        goto LABEL_13;
      }
    }
    BOOL v6 = +[MLCLog framework];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_26;
    }
    unint64_t v21 = NSStringFromSelector(a2);
    int v24 = 138412290;
    unint64_t v25 = v21;
    _os_log_impl(&dword_1DD0C9000, v6, OS_LOG_TYPE_INFO, "%@: Graphs with different devices cannot be linked", (uint8_t *)&v24, 0xCu);
    goto LABEL_25;
  }
LABEL_13:
  [(MLCGraph *)self setRecompileAfterLinking:1];
  if ([(NSArray *)v5 count])
  {
    unint64_t v15 = 0;
    do
    {
      unint64_t v16 = [(NSArray *)v5 objectAtIndexedSubscript:v15];
      [v16 setRecompileAfterLinking:1];

      ++v15;
    }
    while (v15 < [(NSArray *)v5 count]);
  }
  [(MLCTrainingGraph *)self compileAndAllocateGradientTensorsForGraph:0];
  if ([(NSArray *)v5 count])
  {
    unint64_t v17 = 0;
    BOOL v18 = 1;
    do
    {
      unint64_t v19 = [(NSArray *)v5 objectAtIndexedSubscript:v17];
      [v19 compileAndAllocateGradientTensorsForGraph:1];

      unint64_t v20 = [(NSArray *)v5 objectAtIndexedSubscript:v17];
      [v20 setUpdateOptimizerTimeStep:0];

      ++v17;
    }
    while (v17 < [(NSArray *)v5 count]);
  }
  else
  {
LABEL_20:
    BOOL v18 = 1;
  }
LABEL_27:

  return v18;
}

- (void)synchronizeUpdates
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = [(MLCGraph *)self device];
  id v5 = [(MLCTrainingGraph *)self optimizer];

  if (v5)
  {
    BOOL v6 = [(MLCTrainingGraph *)self optimizerUpdateLayerList];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      unint64_t v8 = 0;
      do
      {
        uint64_t v9 = [(MLCTrainingGraph *)self optimizerUpdateLayerList];
        char v10 = [v9 objectAtIndexedSubscript:v8];

        if ([v10 isUpdatable])
        {
          uint64_t v11 = [v4 computeEngine];
          [v11 synchronizeUpdatesForLayer:v10];
        }
        ++v8;
        id v12 = [(MLCTrainingGraph *)self optimizerUpdateLayerList];
        unint64_t v13 = [v12 count];
      }
      while (v8 < v13);
    }
    unint64_t v14 = [(MLCTrainingGraph *)self optimizerParameterList];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      unint64_t v16 = 0;
      do
      {
        unint64_t v17 = [(MLCTrainingGraph *)self optimizerParameterList];
        BOOL v18 = [v17 objectAtIndexedSubscript:v16];

        if ([v18 isUpdatable])
        {
          unint64_t v19 = [v4 computeEngine];
          unint64_t v20 = [v18 tensor];
          [v19 synchronizeOptimizerUpdatesForTensor:v20];
        }
        ++v16;
        unint64_t v21 = [(MLCTrainingGraph *)self optimizerParameterList];
        unint64_t v22 = [v21 count];
      }
      while (v16 < v22);
    }
    unint64_t v23 = [v4 computeEngine];
    [v23 commitAndWaitForCompletion:0];

    int v24 = [(MLCTrainingGraph *)self optimizerUpdateLayerList];
    uint64_t v25 = [v24 count];

    if (v25)
    {
      unint64_t v26 = 0;
      do
      {
        uint64_t v27 = [(MLCTrainingGraph *)self optimizerUpdateLayerList];
        uint64_t v28 = [v27 objectAtIndexedSubscript:v26];

        if ([v28 isUpdatable])
        {
          int v29 = [v4 computeEngine];
          [v29 convertUpdatesToTensorDataForLayer:v28];
        }
        ++v26;
        uint64_t v30 = [(MLCTrainingGraph *)self optimizerUpdateLayerList];
        unint64_t v31 = [v30 count];
      }
      while (v26 < v31);
    }
    BOOL v32 = [(MLCTrainingGraph *)self optimizerParameterList];
    uint64_t v33 = [v32 count];

    if (v33)
    {
      unint64_t v34 = 0;
      do
      {
        unint64_t v35 = [(MLCTrainingGraph *)self optimizerParameterList];
        uint64_t v36 = [v35 objectAtIndexedSubscript:v34];

        if ([v36 isUpdatable])
        {
          BOOL v37 = [v4 computeEngine];
          unint64_t v38 = [v36 tensor];
          [v37 convertUpdatesToTensorDataForTensorParameters:v38];
        }
        ++v34;
        char v39 = [(MLCTrainingGraph *)self optimizerParameterList];
        unint64_t v40 = [v39 count];
      }
      while (v34 < v40);
    }
  }
  else
  {
    uint64_t v41 = +[MLCLog framework];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      uint64_t v42 = NSStringFromSelector(a2);
      int v43 = 138412290;
      unint64_t v44 = v42;
      _os_log_impl(&dword_1DD0C9000, v41, OS_LOG_TYPE_INFO, "%@: No optimizer in graph to synchronize the update", (uint8_t *)&v43, 0xCu);
    }
  }
}

- (NSData)gradientDataForParameter:(MLCTensor *)parameter layer:(MLCLayer *)layer
{
  BOOL v6 = parameter;
  uint64_t v7 = layer;
  unint64_t v8 = [(MLCGraph *)self graphLayerList];
  LOBYTE(self) = [(MLCGraph *)self isLayerInGraphLayerList:v7 graphLayerList:v8];

  if ((self & 1) == 0)
  {
    BOOL v18 = +[MLCLog framework];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MLCTrainingGraph resultGradientTensorsForLayer:summedGradientForInputTensors:]();
    }

    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        unint64_t v20 = v7;
        unint64_t v21 = [(MLCLayer *)v20 beta];

        if (v21 == v6)
        {
          unint64_t v14 = [(MLCLayer *)v20 device];
          uint64_t v15 = [v14 computeEngine];
          unint64_t v16 = [(MLCLayer *)v20 deviceOps];
          uint64_t v17 = [v15 betaGradients:v16];
          goto LABEL_22;
        }
        unint64_t v22 = [(MLCLayer *)v20 gamma];

        if (v22 == v6)
        {
          unint64_t v14 = [(MLCLayer *)v20 device];
          uint64_t v15 = [v14 computeEngine];
          unint64_t v16 = [(MLCLayer *)v20 deviceOps];
          uint64_t v17 = [v15 gammaGradients:v16];
          goto LABEL_22;
        }
        goto LABEL_19;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v24 = v7;
        uint64_t v25 = [(MLCLayer *)v24 weights];

        if (v25 == v6)
        {
          unint64_t v26 = [(MLCLayer *)v24 descriptor];
          uint64_t v27 = [v26 embeddingCount];
          uint64_t v28 = [v27 unsignedIntegerValue];

          int v29 = [(MLCLayer *)v24 descriptor];
          uint64_t v30 = [v29 embeddingDimension];
          uint64_t v31 = [v30 unsignedIntegerValue];

          unint64_t v14 = [(MLCLayer *)v24 device];
          uint64_t v15 = [v14 computeEngine];
          unint64_t v16 = [(MLCLayer *)v24 deviceOps];
          uint64_t v17 = [v15 embeddingWeightsGradients:v16 embeddingCount:v28 embeddingDimension:v31];
          goto LABEL_22;
        }
        goto LABEL_19;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v32 = v7;
        uint64_t v33 = [(MLCLayer *)v32 weights];
        uint64_t v34 = [v33 count];

        if (v34)
        {
          unint64_t v35 = 0;
          while (1)
          {
            uint64_t v36 = [(MLCLayer *)v32 weights];
            BOOL v37 = [v36 objectAtIndexedSubscript:v35];

            BOOL v38 = v37 == v6;
            if (v37 == v6) {
              break;
            }
            ++v35;
            char v39 = [(MLCLayer *)v32 weights];
            unint64_t v40 = [v39 count];

            if (v35 >= v40) {
              goto LABEL_53;
            }
          }
        }
        else
        {
          BOOL v38 = 0;
LABEL_53:
          unint64_t v35 = 0;
        }
        v65 = [(MLCLayer *)v32 biases];
        uint64_t v66 = [v65 count];

        if (v66)
        {
          unint64_t v67 = 0;
          while (1)
          {
            uint64_t v68 = [(MLCLayer *)v32 biases];
            BOOL v69 = [v68 objectAtIndexedSubscript:v67];

            BOOL v70 = v69 == v6;
            if (v69 == v6) {
              break;
            }
            ++v67;
            os_signpost_id_t v71 = [(MLCLayer *)v32 biases];
            unint64_t v72 = [v71 count];

            if (v67 >= v72) {
              goto LABEL_61;
            }
          }
          unint64_t v35 = v67;
        }
        else
        {
          BOOL v70 = 0;
        }
LABEL_61:
        uint64_t v73 = [(MLCLayer *)v32 attentionBiases];
        uint64_t v74 = [v73 count];

        if (v74)
        {
          unint64_t v75 = 0;
          while (1)
          {
            v76 = [(MLCLayer *)v32 attentionBiases];
            BOOL v77 = [v76 objectAtIndexedSubscript:v75];

            BOOL v78 = v77 == v6;
            if (v77 == v6) {
              break;
            }
            ++v75;
            v79 = [(MLCLayer *)v32 attentionBiases];
            unint64_t v80 = [v79 count];

            if (v75 >= v80) {
              goto LABEL_68;
            }
          }
          unint64_t v35 = v75;
        }
        else
        {
          BOOL v78 = 0;
        }
LABEL_68:
        uint64_t v81 = [(MLCTensor *)v6 descriptor];
        uint64_t v82 = [v81 tensorAllocationSizeInBytes];

        if (v38)
        {
          unint64_t v14 = [(MLCLayer *)v32 device];
          uint64_t v15 = [v14 computeEngine];
          unint64_t v16 = [(MLCLayer *)v32 deviceOps];
          uint64_t v17 = [v15 mhaWeightGradient:v16 withSize:v82 index:v35];
          goto LABEL_22;
        }
        if (v70)
        {
          unint64_t v14 = [(MLCLayer *)v32 device];
          uint64_t v15 = [v14 computeEngine];
          unint64_t v16 = [(MLCLayer *)v32 deviceOps];
          uint64_t v17 = [v15 mhaBiasGradient:v16 withSize:v82 index:v35];
          goto LABEL_22;
        }
        if (v78)
        {
          unint64_t v14 = [(MLCLayer *)v32 device];
          uint64_t v15 = [v14 computeEngine];
          unint64_t v16 = [(MLCLayer *)v32 deviceOps];
          uint64_t v17 = [v15 mhaAttnBiasGradient:v16 withSize:v82 index:v35];
          goto LABEL_22;
        }
        goto LABEL_19;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v41 = v7;
        uint64_t v42 = [(MLCLayer *)v41 inputWeights];
        uint64_t v43 = [v42 count];

        if (v43)
        {
          unint64_t v44 = 0;
          while (1)
          {
            uint64_t v45 = [(MLCLayer *)v41 inputWeights];
            v46 = [v45 objectAtIndexedSubscript:v44];

            if (v46 == v6) {
              break;
            }
            ++v44;
            unint64_t v47 = [(MLCLayer *)v41 inputWeights];
            unint64_t v48 = [v47 count];

            if (v44 >= v48) {
              goto LABEL_41;
            }
          }
          unint64_t v14 = [(MLCLayer *)v41 device];
          uint64_t v15 = [v14 computeEngine];
          unint64_t v16 = [(MLCLayer *)v41 deviceOps];
          uint64_t v17 = [v15 lstmInputWeightGradient:v16 mlcWeightIndex:v44];
          goto LABEL_22;
        }
LABEL_41:
        BOOL v49 = [(MLCLayer *)v41 hiddenWeights];
        uint64_t v50 = [v49 count];

        if (v50)
        {
          unint64_t v51 = 0;
          while (1)
          {
            uint64_t v52 = [(MLCLayer *)v41 hiddenWeights];
            uint64_t v53 = [v52 objectAtIndexedSubscript:v51];

            if (v53 == v6) {
              break;
            }
            ++v51;
            unint64_t v54 = [(MLCLayer *)v41 hiddenWeights];
            unint64_t v55 = [v54 count];

            if (v51 >= v55) {
              goto LABEL_45;
            }
          }
          unint64_t v14 = [(MLCLayer *)v41 device];
          uint64_t v15 = [v14 computeEngine];
          unint64_t v16 = [(MLCLayer *)v41 deviceOps];
          uint64_t v17 = [v15 lstmHiddenWeightGradient:v16 mlcWeightIndex:v51];
          goto LABEL_22;
        }
LABEL_45:
        v56 = [(MLCLayer *)v41 biases];
        uint64_t v57 = [v56 count];

        if (v57)
        {
          unint64_t v58 = 0;
          char v59 = 0;
          unint64_t v60 = 0;
          do
          {
            uint64_t v61 = [(MLCLayer *)v41 biases];
            unint64_t v62 = [v61 objectAtIndexedSubscript:v58];

            if (v62 == v6) {
              unint64_t v60 = v58;
            }
            v59 |= v62 == v6;
            ++v58;
            uint64_t v63 = [(MLCLayer *)v41 biases];
            unint64_t v64 = [v63 count];
          }
          while (v58 < v64);
          if (v59)
          {
            unint64_t v14 = [(MLCLayer *)v41 device];
            uint64_t v15 = [v14 computeEngine];
            unint64_t v16 = [(MLCLayer *)v41 deviceOps];
            uint64_t v17 = [v15 lstmBiasGradient:v16 mlcBiasIndex:v60];
            goto LABEL_22;
          }
        }
        goto LABEL_19;
      }
LABEL_11:
      unint64_t v19 = 0;
      goto LABEL_24;
    }
  }
  uint64_t v9 = v7;
  char v10 = [(MLCLayer *)v9 weights];

  if (v10 == v6)
  {
    unint64_t v14 = [(MLCLayer *)v9 device];
    uint64_t v15 = [v14 computeEngine];
    unint64_t v16 = [(MLCLayer *)v9 deviceOps];
    uint64_t v17 = [v15 weightsGradients:v16];
    goto LABEL_22;
  }
  uint64_t v11 = [(MLCLayer *)v9 biases];
  if (v11)
  {
    id v12 = (void *)v11;
    unint64_t v13 = [(MLCLayer *)v9 biases];

    if (v13 == v6)
    {
      unint64_t v14 = [(MLCLayer *)v9 device];
      uint64_t v15 = [v14 computeEngine];
      unint64_t v16 = [(MLCLayer *)v9 deviceOps];
      uint64_t v17 = [v15 biasesGradients:v16];
LABEL_22:
      unint64_t v19 = (void *)v17;

      goto LABEL_23;
    }
  }
LABEL_19:
  unint64_t v19 = 0;
LABEL_23:

LABEL_24:

  return (NSData *)v19;
}

- (MLCOptimizer)optimizer
{
  return self->_optimizer;
}

- (void)setOptimizer:(id)a3
{
}

- (NSMutableArray)optimizerUpdateLayerList
{
  return self->_optimizerUpdateLayerList;
}

- (void)setOptimizerUpdateLayerList:(id)a3
{
}

- (NSMutableArray)optimizerParameterList
{
  return self->_optimizerParameterList;
}

- (void)setOptimizerParameterList:(id)a3
{
}

- (NSMutableArray)rootSourceGradientTensor
{
  return self->_rootSourceGradientTensor;
}

- (void)setRootSourceGradientTensor:(id)a3
{
}

- (NSMutableArray)lossLayersInTrainingGraph
{
  return self->_lossLayersInTrainingGraph;
}

- (void)setLossLayersInTrainingGraph:(id)a3
{
}

- (NSMutableArray)stopGradientTensorList
{
  return self->_stopGradientTensorList;
}

- (void)setStopGradientTensorList:(id)a3
{
}

- (MLCLayerCompiling)lossLayer
{
  return self->_lossLayer;
}

- (void)setLossLayer:(id)a3
{
}

- (MLCLayer)dummyLayer
{
  return self->_dummyLayer;
}

- (unint64_t)firstTrainableLayerIndex
{
  return self->_firstTrainableLayerIndex;
}

- (void)setFirstTrainableLayerIndex:(unint64_t)a3
{
  self->_firstTrainableLayerIndex = a3;
}

- (BOOL)allocateResultGradientTensors
{
  return self->_allocateResultGradientTensors;
}

- (void)setAllocateResultGradientTensors:(BOOL)a3
{
  self->_allocateResultGradientTensors = a3;
}

- (BOOL)allocateOptimizerData
{
  return self->_allocateOptimizerData;
}

- (void)setAllocateOptimizerData:(BOOL)a3
{
  self->_allocateOptimizerData = a3;
}

- (BOOL)updateOptimizerTimeStep
{
  return self->_updateOptimizerTimeStep;
}

- (void)setUpdateOptimizerTimeStep:(BOOL)a3
{
  self->_updateOptimizerTimeStep = a3;
}

- (NSSet)optimizerUpdateDeviceList
{
  return self->_optimizerUpdateDeviceList;
}

- (void)setOptimizerUpdateDeviceList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optimizerUpdateDeviceList, 0);
  objc_storeStrong((id *)&self->_dummyLayer, 0);
  objc_storeStrong((id *)&self->_lossLayer, 0);
  objc_storeStrong((id *)&self->_stopGradientTensorList, 0);
  objc_storeStrong((id *)&self->_lossLayersInTrainingGraph, 0);
  objc_storeStrong((id *)&self->_rootSourceGradientTensor, 0);
  objc_storeStrong((id *)&self->_optimizerParameterList, 0);
  objc_storeStrong((id *)&self->_optimizerUpdateLayerList, 0);

  objc_storeStrong((id *)&self->_optimizer, 0);
}

- (void)setTrainingTensorParameters:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: not an input tensor", v4, v5, v6, v7, v8);
}

- (void)setTrainingTensorParameters:(const char *)a1 .cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: parameter list has already been specified", v4, v5, v6, v7, v8);
}

- (void)compileOptimizer:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: Compiling an optimizer (%@) in graph that has not been compiled with", v4, v5, v6, v7, v8);
}

- (void)compileOptimizer:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v3 = [v0 device];
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_3_1(&dword_1DD0C9000, v4, v5, "%@: Compiling an optimizer (%@) in graph that has already been compiled with another device(%@)", v6, v7, v8, v9, v10);
}

- (void)recompileWithOptions:(const char *)a1 .cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: graph was not compiled with MLCGraphCompilationOptionsLinkGraphs", v4, v5, v6, v7, v8);
}

- (void)compileWithOptions:(const char *)a1 device:inputTensors:inputTensorsData:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: training graph is not supported on the Apple Neural Engine", v4, v5, v6, v7, v8);
}

- (void)compileWithOptions:(const char *)a1 device:inputTensors:inputTensorsData:.cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: graph has already been compiled", v4, v5, v6, v7, v8);
}

- (void)compileWithOptions:(const char *)a1 device:inputTensors:inputTensorsData:.cold.3(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: inputTensorsData must be specified if inputTensors is", v4, v5, v6, v7, v8);
}

- (void)compileWithOptions:(const char *)a1 device:inputTensors:inputTensorsData:.cold.4(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: YOLO loss layer must be the last layer", v4, v5, v6, v7, v8);
}

- (void)compileWithOptions:(const char *)a1 device:inputTensors:inputTensorsData:.cold.5(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Phi layer is not supported yet.", v4, v5, v6, v7, v8);
}

- (void)compileWithOptions:device:inputTensors:inputTensorsData:.cold.6()
{
  OUTLINED_FUNCTION_6_0();
  SEL v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: compilation failure for layer=%@", v4, v5, v6, v7, v8);
}

- (void)compileWithOptions:device:inputTensors:inputTensorsData:.cold.7()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v3 = [v0 device];
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_3_1(&dword_1DD0C9000, v4, v5, "%@: Compiling a layer (%@) in graph that has already been compiled with another device(%@)", v6, v7, v8, v9, v10);
}

- (void)stopGradientForTensors:(const char *)a1 .cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: stop gradient tensor list must be specified before training graph is compiled", v4, v5, v6, v7, v8);
}

- (void)stopGradientForTensors:(const char *)a1 .cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: gradient tensors have already been allocated, cannot change the stop gradient tensor list", v4, v5, v6, v7, v8);
}

- (void)executeGradientFromLayerIndex:(const char *)a1 resultStateIsTemporary:batchSize:executionOptions:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);
}

- (void)executeForwardWithBatchSize:(const char *)a1 options:outputsData:completionHandler:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);
}

- (void)executeForwardWithBatchSize:(const char *)a1 options:outputsData:completionHandler:.cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);
}

- (void)executeForwardWithBatchSize:(const char *)a1 options:outputsData:completionHandler:.cold.3(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);
}

- (void)executeForwardWithBatchSize:(const char *)a1 options:outputsData:completionHandler:.cold.4(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);
}

- (void)executeForwardWithBatchSize:(const char *)a1 options:outputsData:completionHandler:.cold.5(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);
}

- (void)executeWithInputsData:(const char *)a1 lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:.cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);
}

- (void)executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  SEL v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);
}

- (void)executeWithInputsData:(const char *)a1 lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:.cold.9(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);
}

- (void)executeWithInputsData:(const char *)a1 lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:.cold.10(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);
}

- (void)resultGradientTensorsForLayer:summedGradientForInputTensors:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  SEL v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: Layer (%@) is not trainable or has been fused", v4, v5, v6, v7, v8);
}

- (void)resultGradientTensorsForLayer:summedGradientForInputTensors:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  SEL v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: Layer (%@) is not trainable", v4, v5, v6, v7, v8);
}

- (void)resultGradientTensorsForLayer:summedGradientForInputTensors:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  SEL v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: Layer (%@) is not in graph", v4, v5, v6, v7, v8);
}

- (void)gradientTensorForInput:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  SEL v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: Tensor (%@) is not an input tensor", v4, v5, v6, v7, v8);
}

- (void)allocateUserGradientForTensor:(const char *)a1 .cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: This method must be called after linkWithOptions", v4, v5, v6, v7, v8);
}

- (void)allocateUserGradientForTensor:(const char *)a1 .cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: This method must be called after training graph has been compiled for execution", v4, v5, v6, v7, v8);
}

@end