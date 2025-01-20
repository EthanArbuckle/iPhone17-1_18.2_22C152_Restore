@interface _MLCANEPlistBuilder
+ (BOOL)createReshapeUnitsWithLayer:(id)a3 reshapeUnits:(id *)a4 reshapeResultTensors:(id *)a5;
+ (id)buildBiasParamsWithBiases:(id)a3;
+ (id)constantTensorWithShape:(id)a3 data:(id)a4 dataType:(int)a5 tensorLabel:(id)a6;
+ (id)createConstantTensorUnitWithTensor:(id)a3;
+ (id)createReshapeUnitWithSourceTensor:(id)a3 layer:(id)a4 resultShape:(id)a5;
+ (id)createUnitWithLayer:(id)a3 unitParams:(id)a4;
+ (int)createBroadcastUnitWithSourceTensor:(id)a3 targetShape:(id)a4 layer:(id)a5 broadcastUnit:(id *)a6 broadcastResultTensor:(id *)a7;
- (BOOL)addConstantTensor:(id)a3 toNetwork:(id)a4;
- (BOOL)addInputs:(id)a3 ofUnit:(id)a4 ofOperation:(id)a5 toProcedure:(id)a6 toNetwork:(id)a7;
- (BOOL)addOutputs:(id)a3 ofOperation:(id)a4 toProcedure:(id)a5 toNetwork:(id)a6;
- (BOOL)addScalesAndBiasesOfGocUnit:(id)a3 tensorWithBiases:(id)a4 tensorWithScales:(id)a5;
- (BOOL)addUnitsAndInputsAndOutpusOfLayer:(id)a3 toNetwork:(id)a4 toProcedure:(id)a5 operationName:(id)a6 liveInputs:(id)a7 liveOutputs:(id)a8;
- (BOOL)addWeightsOfConvolutionLayer:(id)a3;
- (BOOL)addWeightsOfFullyConnectedLayer:(id)a3 toNetwork:(id)a4;
- (BOOL)addWeightsOfLayer:(id)a3 toNetwork:(id)a4;
- (BOOL)addWeightsOfLayerNormalizationLayer:(id)a3 toNetwork:(id)a4;
- (BOOL)addWeightsOfNormalizationLayer:(id)a3;
- (BOOL)buildProcedureWithLayer:(id)a3;
- (BOOL)buildProcedureWithRootLayer:(id)a3 aneSubgraphLayerList:(id)a4 liveInputs:(id)a5 liveOutputs:(id)a6;
- (BOOL)queryAndAddConstantTensors:(id)a3 ofLayer:(id)a4 toNetwork:(id)a5;
- (NSMutableDictionary)plist;
- (NSMutableSet)weightTensorsWithDeviceMemory;
- (_MLCANEPlistBuilder)init;
- (_MLCANEWeightOps)weightOps;
- (void)releaseWeights;
- (void)unitBottomNamesWithSourceTensor:(id)a3 liveInputs:(id)a4 unitBottomNames:(id)a5 sourceTensorsToLiveUp:(id)a6;
@end

@implementation _MLCANEPlistBuilder

- (_MLCANEPlistBuilder)init
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)_MLCANEPlistBuilder;
  v2 = [(_MLCANEPlistBuilder *)&v14 init];
  if (v2)
  {
    v16[0] = kMLCCurrentANEIRVersion[0];
    v15[0] = @"Version";
    v15[1] = @"Networks";
    v3 = (void *)MEMORY[0x1E4F1CBF0];
    v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    v16[1] = v4;
    v15[2] = @"ProcedureList";
    v5 = (void *)[v3 mutableCopy];
    v16[2] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    uint64_t v7 = [v6 mutableCopy];
    plist = v2->_plist;
    v2->_plist = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    weightOps = v2->_weightOps;
    v2->_weightOps = (_MLCANEWeightOps *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    weightTensorsWithDeviceMemory = v2->_weightTensorsWithDeviceMemory;
    v2->_weightTensorsWithDeviceMemory = (NSMutableSet *)v11;
  }
  return v2;
}

+ (id)createUnitWithLayer:(id)a3 unitParams:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 objectForKeyedSubscript:kMLCANENetUnitType[0]];

  if (v8)
  {
    aSelector = a2;
    uint64_t v9 = [MEMORY[0x1E4F1CC08] mutableCopy];
    v52 = [v7 objectForKeyedSubscript:kMLCANENetUnitType[0]];
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:");
    v10 = (void *)[v7 mutableCopy];
    [v10 removeObjectForKey:kMLCANENetUnitType[0]];
    v50 = v10;
    v51 = (void *)[v10 copy];

    uint64_t v11 = [v6 label];
    v53 = v9;
    [v9 setObject:v11 forKeyedSubscript:@"Name"];

    v12 = (void *)MEMORY[0x1E4F1CBF0];
    v13 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    objc_super v14 = (void *)[v12 mutableCopy];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v15 = [v6 sourceTensors];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v61;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v61 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          v21 = [v20 descriptor];
          int v22 = [v21 dataType];

          uint64_t v23 = ANE_GetANECIRDataTypeWithMLCDataType(v22);
          if (!v23)
          {
            log = +[MLCLog framework];
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              v47 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 138412802;
              *(void *)&buf[4] = v47;
              __int16 v66 = 1024;
              int v67 = v22;
              __int16 v68 = 2112;
              v69 = v20;
              _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%@: unsupported data type=%d for source tensor=%@", buf, 0x1Cu);
            }
            v44 = 0;
LABEL_34:
            v39 = v52;
            v38 = v53;
            v42 = v50;
            v41 = v51;
            goto LABEL_35;
          }
          v24 = (void *)v23;
          [v13 addObject:v23];
          v25 = [v20 label];
          [v14 addObject:v25];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v60 objects:v70 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    [v53 setObject:v13 forKeyedSubscript:@"InputType"];
    [v53 setObject:v14 forKeyedSubscript:@"Bottom"];
    v26 = (void *)MEMORY[0x1E4F1CBF0];
    v15 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    log = [v26 mutableCopy];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    obuint64_t j = [v6 resultTensors];
    uint64_t v27 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v57;
      while (2)
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v57 != v29) {
            objc_enumerationMutation(obj);
          }
          v31 = *(void **)(*((void *)&v56 + 1) + 8 * j);
          v32 = [v31 descriptor];
          int v33 = [v32 dataType];

          uint64_t v34 = ANE_GetANECIRDataTypeWithMLCDataType(v33);
          if (!v34)
          {
            v45 = +[MLCLog framework];
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              v48 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 138412802;
              *(void *)&buf[4] = v48;
              __int16 v66 = 1024;
              int v67 = v33;
              __int16 v68 = 2112;
              v69 = v31;
              _os_log_error_impl(&dword_1DD0C9000, v45, OS_LOG_TYPE_ERROR, "%@: unsupported data type=%d for result tensor=%@", buf, 0x1Cu);
            }
            v44 = 0;
            goto LABEL_34;
          }
          v35 = (void *)v34;
          [v15 addObject:v34];
          *(void *)buf = 1;
          ANE_GetTensorFeatureChannelsWithOnePrepended(v31, (uint64_t *)buf);
          v36 = [NSNumber numberWithUnsignedInteger:*(void *)buf];
          [log addObject:v36];
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }

    v37 = [v15 objectAtIndexedSubscript:0];
    v38 = v53;
    [v53 setObject:v37 forKeyedSubscript:@"OutputType"];

    v39 = v52;
    if (([v52 isEqualToString:@"Broadcast"] & 1) == 0
      && ([v52 isEqualToString:@"Reshape"] & 1) == 0
      && ([v52 isEqualToString:@"InputView"] & 1) == 0)
    {
      v40 = [log objectAtIndexedSubscript:0];
      [v53 setObject:v40 forKeyedSubscript:@"OutputChannels"];
    }
    v41 = v51;
    v42 = v50;
    if ([v51 count])
    {
      v43 = (void *)[v51 mutableCopy];
      [v53 setObject:v43 forKeyedSubscript:@"Params"];
    }
    v44 = v53;
LABEL_35:
  }
  else
  {
    v38 = +[MLCLog framework];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:]();
    }
    v44 = 0;
    v41 = v7;
  }

  return v44;
}

+ (id)buildBiasParamsWithBiases:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CC08];
  id v6 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  id v7 = (void *)[v5 mutableCopy];
  v8 = [NSNumber numberWithBool:0];
  [v7 setObject:v8 forKeyedSubscript:@"BiasMutable"];

  uint64_t v9 = [v4 descriptor];

  v10 = ANE_GetANECIRDataTypeWithMLCDataType([v9 dataType]);
  uint64_t v11 = v10;
  if (!v10)
  {
    v12 = +[MLCLog framework];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[_MLCANEPlistBuilder buildBiasParamsWithBiases:]();
    }
    goto LABEL_8;
  }
  if (([v10 isEqualToString:@"UInt8"] & 1) != 0
    || [v11 isEqualToString:@"Int8"])
  {
    v12 = +[MLCLog framework];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[_MLCANEPlistBuilder buildBiasParamsWithBiases:](a2);
    }
LABEL_8:

    id v13 = 0;
    goto LABEL_9;
  }
  v15 = [v9 shape];
  uint64_t v16 = [v15 objectAtIndexedSubscript:1];
  uint64_t v17 = [v16 unsignedIntegerValue];

  uint64_t v18 = [NSNumber numberWithUnsignedInteger:v17];
  [v7 setObject:v18 forKeyedSubscript:@"BiasCount"];

  [v6 setObject:v7 forKeyedSubscript:@"BiasScaleGroupData"];
  [v6 setObject:@"GOC" forKeyedSubscript:kMLCANENetUnitType[0]];
  id v13 = v6;
LABEL_9:

  return v13;
}

+ (id)createReshapeUnitWithSourceTensor:(id)a3 layer:(id)a4 resultShape:(id)a5
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 count] == 4)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CC08] mutableCopy];
    [v11 setObject:@"Reshape" forKeyedSubscript:kMLCANENetUnitType[0]];
    v12 = NSNumber;
    id v13 = [v10 objectAtIndexedSubscript:0];
    objc_super v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "unsignedIntegerValue"));
    [v11 setObject:v14 forKeyedSubscript:@"ReshapedBatch"];

    v15 = NSNumber;
    uint64_t v16 = [v10 objectAtIndexedSubscript:1];
    uint64_t v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "unsignedIntegerValue"));
    [v11 setObject:v17 forKeyedSubscript:@"ReshapedChannel"];

    uint64_t v18 = NSNumber;
    v19 = [v10 objectAtIndexedSubscript:2];
    v20 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "unsignedIntegerValue"));
    [v11 setObject:v20 forKeyedSubscript:@"ReshapedHeight"];

    v21 = NSNumber;
    int v22 = [v10 objectAtIndexedSubscript:3];
    uint64_t v23 = objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "unsignedIntegerValue"));
    [v11 setObject:v23 forKeyedSubscript:@"ReshapedWidth"];

    v24 = +[_MLCANEPlistBuilder createUnitWithLayer:v9 unitParams:v11];
    v37[0] = v8;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    char v26 = ANE_ValidateReshapeUnit(v25, v24, 1);

    if (v26)
    {
      id v27 = v24;
    }
    else
    {
      uint64_t v28 = +[MLCLog framework];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v30 = NSStringFromSelector(a2);
        int v31 = 138412802;
        v32 = v30;
        __int16 v33 = 2112;
        uint64_t v34 = v24;
        __int16 v35 = 2112;
        id v36 = v9;
        _os_log_error_impl(&dword_1DD0C9000, v28, OS_LOG_TYPE_ERROR, "%@: the reshape unit=%@ of layer=%@ failed validation", (uint8_t *)&v31, 0x20u);
      }
      id v27 = 0;
    }
  }
  else
  {
    uint64_t v11 = +[MLCLog framework];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[_MLCANEPlistBuilder createReshapeUnitWithSourceTensor:layer:resultShape:](a2);
    }
    id v27 = 0;
  }

  return v27;
}

+ (BOOL)createReshapeUnitsWithLayer:(id)a3 reshapeUnits:(id *)a4 reshapeResultTensors:(id *)a5
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v34 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  __int16 v33 = (void *)[v6 mutableCopy];
  id v7 = [v5 sourceTensors];
  id v8 = [v7 objectAtIndexedSubscript:0];

  id v9 = [v8 descriptor];
  uint64_t v10 = [v9 dimensionCount];

  id v11 = v8;
  __int16 v35 = v5;
  v12 = [v5 resultTensors];
  id v13 = [v12 objectAtIndexedSubscript:0];

  uint64_t v30 = v10;
  unint64_t v14 = v10 - 1;
  char v15 = 1;
  uint64_t v16 = v11;
  while (v14 <= 2)
  {
    char v17 = v15;
    if (v15)
    {
      id v38 = 0;
      ANE_GetTensor4DShapeWithBatchFirst(v11, &v38);
      id v18 = v38;
    }
    else
    {
      id v37 = 0;
      ANE_GetTensor4DShapeWithBatchFirst(v13, &v37);
      id v19 = v37;
      v20 = [v11 descriptor];
      uint64_t v21 = +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v19, [v20 dataType]);

      id v36 = 0;
      ANE_GetTensor4DShapeWithOnePrepended(v13, &v36);
      id v18 = v36;

      uint64_t v16 = (void *)v21;
    }
    uint64_t v22 = +[_MLCANEPlistBuilder createReshapeUnitWithSourceTensor:v16 layer:v35 resultShape:v18];
    if (!v22)
    {
      uint64_t v28 = +[MLCLog framework];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        +[_MLCANEPlistBuilder createReshapeUnitsWithLayer:reshapeUnits:reshapeResultTensors:]();
      }

      BOOL v26 = 0;
      goto LABEL_15;
    }
    uint64_t v23 = (void *)v22;
    [v34 addObject:v22];
    v24 = [v11 descriptor];
    v25 = +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v18, [v24 dataType]);

    [v33 addObject:v25];
    char v15 = 0;
    if ((v17 & 1) == 0)
    {
      *a4 = (id)[v34 copy];
      *a5 = (id)[v33 copy];
      BOOL v26 = 1;
      goto LABEL_15;
    }
  }
  id v27 = +[MLCLog framework];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    +[_MLCANEPlistBuilder createReshapeUnitsWithLayer:reshapeUnits:reshapeResultTensors:](v30, v27);
  }

  BOOL v26 = 0;
  uint64_t v16 = v11;
LABEL_15:

  return v26;
}

+ (int)createBroadcastUnitWithSourceTensor:(id)a3 targetShape:(id)a4 layer:(id)a5 broadcastUnit:(id *)a6 broadcastResultTensor:(id *)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if ([v13 count] == 4)
  {
    id v49 = 0;
    ANE_GetTensor4DShapeWithOnePrepended(v12, &v49);
    id v15 = v49;
    v48 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    if ([v15 count])
    {
      v44 = a7;
      v45 = a6;
      v46 = v12;
      id v47 = v14;
      unint64_t v16 = 0;
      int v17 = 1;
      do
      {
        id v18 = [v15 objectAtIndexedSubscript:v16];
        unint64_t v19 = [v18 unsignedIntegerValue];

        v20 = [v13 objectAtIndexedSubscript:v16];
        unint64_t v21 = [v20 unsignedIntegerValue];

        if (v19 != 1 && v19 != v21)
        {
          __int16 v35 = +[MLCLog framework];
          id v12 = v46;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v40 = NSStringFromSelector(a2);
            v41 = [v46 descriptor];
            v42 = [v41 shape];
            *(_DWORD *)buf = 138412802;
            long long v56 = v40;
            __int16 v57 = 2112;
            long long v58 = v42;
            __int16 v59 = 2112;
            id v60 = v13;
            _os_log_error_impl(&dword_1DD0C9000, v35, OS_LOG_TYPE_ERROR, "%@: the shape of source tensor is not broadcastable to the target shape. source shape=%@, target shape=%@", buf, 0x20u);
          }
          id v32 = 0;
          id v25 = 0;
          int v17 = 0;
          id *v45 = 0;
          id *v44 = 0;
          goto LABEL_21;
        }
        if (v19 < v21)
        {
          uint64_t v22 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
          uint64_t v23 = ANE_GetANECIRDimension(v16);
          [v22 setObject:v23 forKeyedSubscript:@"Dimension"];
          v24 = [NSNumber numberWithUnsignedInteger:v21];
          [v22 setObject:v24 forKeyedSubscript:@"Size"];

          [v48 addObject:v22];
          int v17 = 2;
        }
        ++v16;
      }
      while (v16 < [v15 count]);
      if (v17 != 2)
      {
        id v32 = 0;
        id v25 = 0;
        id v12 = v46;
        goto LABEL_21;
      }
      v53[0] = kMLCANENetUnitType[0];
      v53[1] = @"BroadcastInfo";
      v54[0] = @"Broadcast";
      v54[1] = v48;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
      v43 = id v14 = v47;
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v47);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = v46;
      BOOL v26 = [v46 descriptor];
      uint64_t v27 = [v26 dataType];

      uint64_t v28 = ANE_GetANECIRDataTypeWithMLCDataType(v27);
      if (v28)
      {
        uint64_t v29 = [v46 label];
        v52 = v29;
        uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
        [v25 setObject:v30 forKeyedSubscript:@"Bottom"];

        v51 = v28;
        int v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
        [v25 setObject:v31 forKeyedSubscript:@"InputType"];

        [v25 setObject:v28 forKeyedSubscript:@"OutputType"];
        id v32 = +[MLCTensor tensorWithShape:v13 dataType:v27];
        v50 = v46;
        __int16 v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
        LOBYTE(v30) = ANE_ValidateBroadcastUnit(v33, v32, v25, 1);

        if (v30)
        {
          id v25 = v25;
          *a6 = v25;
          id v32 = v32;
          id *v44 = v32;

          int v17 = 2;
LABEL_21:
          id v14 = v47;
          goto LABEL_22;
        }
        id v37 = +[MLCLog framework];
        id v38 = v44;
        v39 = v43;
        id v14 = v47;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          +[_MLCANEPlistBuilder createBroadcastUnitWithSourceTensor:targetShape:layer:broadcastUnit:broadcastResultTensor:]();
        }
      }
      else
      {
        id v37 = +[MLCLog framework];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          +[_MLCANEPlistBuilder createBroadcastUnitWithSourceTensor:targetShape:layer:broadcastUnit:broadcastResultTensor:](a2);
        }
        id v32 = 0;
        id v38 = v44;
        v39 = v43;
      }

      id *v45 = 0;
      id *v38 = 0;

      int v17 = 2;
    }
    else
    {
      id v32 = 0;
      id v25 = 0;
      int v17 = 1;
    }
LABEL_22:
  }
  else
  {
    uint64_t v34 = +[MLCLog framework];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      +[_MLCANEPlistBuilder createBroadcastUnitWithSourceTensor:targetShape:layer:broadcastUnit:broadcastResultTensor:](a2);
    }

    int v17 = 0;
    *a6 = 0;
    *a7 = 0;
  }

  return v17;
}

+ (id)createConstantTensorUnitWithTensor:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  id v6 = [v4 label];
  [v5 setObject:v6 forKeyedSubscript:@"ConstantName"];

  id v7 = [v4 descriptor];
  int v8 = [v7 dataType];

  id v9 = ANE_GetANECIRDataTypeWithMLCDataType(v8);
  if (v9)
  {
    [v5 setObject:v9 forKeyedSubscript:@"ConstantType"];
    id v18 = 0;
    ANE_GetTensor4DShapeWithOnePrepended(v4, &v18);
    id v10 = v18;
    id v11 = [v10 objectAtIndexedSubscript:3];
    [v5 setObject:v11 forKeyedSubscript:@"ConstantWidth"];

    id v12 = [v10 objectAtIndexedSubscript:2];
    [v5 setObject:v12 forKeyedSubscript:@"ConstantHeight"];

    id v13 = [v10 objectAtIndexedSubscript:1];

    [v5 setObject:v13 forKeyedSubscript:@"ConstantChannels"];
    [v5 setObject:&unk_1F3876780 forKeyedSubscript:@"ConstantDepth"];
    [v5 setObject:&unk_1F3876780 forKeyedSubscript:@"ConstantInterleave"];
    id v14 = v5;
  }
  else
  {
    id v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v20 = v17;
      __int16 v21 = 1024;
      int v22 = v8;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_error_impl(&dword_1DD0C9000, v15, OS_LOG_TYPE_ERROR, "%@: unsupported data type=%d of tensor=%@", buf, 0x1Cu);
    }
    id v14 = 0;
  }

  return v14;
}

+ (id)constantTensorWithShape:(id)a3 data:(id)a4 dataType:(int)a5 tensorLabel:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v9 = a6;
  id v10 = +[MLCTensor tensorWithShape:a3 data:a4 dataType:v6];
  objc_msgSend(v10, "setComputeFlags:", objc_msgSend(v10, "computeFlags") | 2);
  id v11 = [v9 stringByAppendingString:@"_const"];

  [v10 setLabel:v11];

  return v10;
}

- (BOOL)addInputs:(id)a3 ofUnit:(id)a4 ofOperation:(id)a5 toProcedure:(id)a6 toNetwork:(id)a7
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v50 = a4;
  id v49 = a5;
  id v13 = a6;
  id v48 = a7;
  if ([v12 count])
  {
    aSelector = a2;
    v44 = v13;
    id v14 = [v13 objectForKeyedSubscript:@"InputList"];
    id v15 = (void *)[v14 mutableCopy];

    if (!v15) {
      id v15 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v45 = v12;
    id v16 = v12;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v53;
      id v46 = v16;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v53 != v19) {
            objc_enumerationMutation(v16);
          }
          __int16 v21 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          if (ANE_CanProgramANECConstantTensorUnit(v21))
          {
            [(_MLCANEPlistBuilder *)self addConstantTensor:v21 toNetwork:v48];
          }
          else
          {
            objc_msgSend(v21, "setComputeFlags:", objc_msgSend(v21, "computeFlags") | 4);
            int v22 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
            [v22 setObject:v49 forKeyedSubscript:@"OperationName"];
            __int16 v23 = [v50 objectForKeyedSubscript:@"Name"];
            [v22 setObject:v23 forKeyedSubscript:@"Name"];

            id v24 = [v21 label];
            [v22 setObject:v24 forKeyedSubscript:@"InputName"];

            uint64_t v25 = [v21 descriptor];
            uint64_t v26 = ANE_GetANECIRDataTypeWithMLCDataType([v25 dataType]);
            if (!v26)
            {
              v39 = +[MLCLog framework];
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                v41 = NSStringFromSelector(aSelector);
                int v42 = [v25 dataType];
                *(_DWORD *)buf = 138412802;
                __int16 v57 = v41;
                __int16 v58 = 1024;
                int v59 = v42;
                __int16 v60 = 2112;
                uint64_t v61 = v21;
                _os_log_error_impl(&dword_1DD0C9000, v39, OS_LOG_TYPE_ERROR, "%@: unsupported data type=%d for tensor=%@", buf, 0x1Cu);
              }
              BOOL v38 = 0;
              id v13 = v44;
              id v12 = v45;
              id v37 = v46;
              goto LABEL_20;
            }
            uint64_t v27 = (void *)v26;
            [v22 setObject:v26 forKeyedSubscript:@"InputType"];
            id v51 = 0;
            ANE_GetTensor4DShapeWithOnePrepended(v21, &v51);
            uint64_t v28 = v19;
            id v29 = v51;
            [v29 objectAtIndexedSubscript:3];
            int v31 = v30 = v15;
            [v22 setObject:v31 forKeyedSubscript:@"InputWidth"];

            id v32 = [v29 objectAtIndexedSubscript:2];
            [v22 setObject:v32 forKeyedSubscript:@"InputHeight"];

            [v22 setObject:&unk_1F3876780 forKeyedSubscript:@"InputDepth"];
            __int16 v33 = [v29 objectAtIndexedSubscript:1];
            [v22 setObject:v33 forKeyedSubscript:@"InputChannels"];

            id v15 = v30;
            uint64_t v34 = [v21 interleave];
            __int16 v35 = [NSNumber numberWithUnsignedInteger:v34];
            [v22 setObject:v35 forKeyedSubscript:@"InputInterleave"];

            id v36 = [v29 objectAtIndexedSubscript:0];

            uint64_t v19 = v28;
            [v22 setObject:v36 forKeyedSubscript:@"BatchSize"];

            [v30 addObject:v22];
            id v16 = v46;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v52 objects:v62 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    id v37 = (void *)[v15 copy];
    id v13 = v44;
    [v44 setObject:v37 forKeyedSubscript:@"InputList"];
    BOOL v38 = 1;
    id v12 = v45;
LABEL_20:
  }
  else
  {
    BOOL v38 = 1;
  }

  return v38;
}

- (BOOL)addOutputs:(id)a3 ofOperation:(id)a4 toProcedure:(id)a5 toNetwork:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v49 = a4;
  id v11 = a5;
  id v46 = a6;
  if ([v10 count])
  {
    aSelector = a2;
    id v12 = [v11 objectForKeyedSubscript:@"OutputList"];
    id v13 = (void *)[v12 mutableCopy];

    if (!v13) {
      id v13 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v14 = v10;
    uint64_t v48 = [v14 countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v48)
    {
      uint64_t v47 = *(void *)v52;
      *(void *)&long long v15 = 138412802;
      long long v40 = v15;
      id v42 = v11;
      id v43 = v10;
      obuint64_t j = v14;
      id v45 = v13;
      while (2)
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v52 != v47) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          objc_msgSend(v17, "setComputeFlags:", objc_msgSend(v17, "computeFlags", v40) | 4);
          uint64_t v18 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
          [v18 setObject:v49 forKeyedSubscript:@"OperationName"];
          uint64_t v19 = [v17 parentLayers];
          v20 = [v19 objectAtIndexedSubscript:0];

          if (!ANE_IsAneCompiledLayer(v20))
          {
            BOOL v38 = +[MLCLog framework];
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
              -[_MLCANEPlistBuilder addOutputs:ofOperation:toProcedure:toNetwork:]();
            }

LABEL_22:
            BOOL v37 = 0;
            id v11 = v42;
            id v10 = v43;
            id v36 = obj;
            id v13 = v45;
            goto LABEL_23;
          }
          __int16 v21 = [v20 deviceOps];
          int v22 = [v21 objectAtIndexedSubscript:0];
          __int16 v23 = [v22 units];

          id v50 = v23;
          id v24 = objc_msgSend(v23, "objectAtIndexedSubscript:", objc_msgSend(v23, "count") - 1);
          uint64_t v25 = [v24 objectForKeyedSubscript:@"Name"];

          uint64_t v26 = [v17 label];
          [v18 setObject:v25 forKeyedSubscript:@"Name"];
          [v18 setObject:v26 forKeyedSubscript:@"OutputName"];
          uint64_t v27 = [v17 descriptor];
          uint64_t v28 = ANE_GetANECIRDataTypeWithMLCDataType([v27 dataType]);
          if (v28)
          {
            [v18 setObject:v28 forKeyedSubscript:@"OutputType"];
            uint64_t v29 = [v17 interleave];
            uint64_t v30 = [NSNumber numberWithUnsignedInteger:v29];
            [v18 setObject:v30 forKeyedSubscript:@"OutputInterleave"];

            [v45 addObject:v18];
            int v31 = [MEMORY[0x1E4F1CC08] mutableCopy];
            [v31 setObject:v26 forKeyedSubscript:@"OutputName"];
            [v31 setObject:v25 forKeyedSubscript:@"Bottom"];
            [v31 setObject:v28 forKeyedSubscript:@"OutputType"];
            id v32 = [NSNumber numberWithUnsignedInteger:v29];
            [v31 setObject:v32 forKeyedSubscript:@"OutputInterleave"];

            id v33 = [v31 copy];
            [v46 setObject:v33 forKeyedSubscript:v26];
          }
          else
          {
            int v31 = +[MLCLog framework];
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              uint64_t v34 = NSStringFromSelector(aSelector);
              int v35 = [v27 dataType];
              *(_DWORD *)buf = v40;
              long long v56 = v34;
              __int16 v57 = 1024;
              int v58 = v35;
              __int16 v59 = 2112;
              __int16 v60 = v17;
              _os_log_error_impl(&dword_1DD0C9000, v31, OS_LOG_TYPE_ERROR, "%@: unsupported data type=%d for tensor=%@", buf, 0x1Cu);
            }
          }

          if (!v28) {
            goto LABEL_22;
          }
        }
        id v14 = obj;
        id v11 = v42;
        id v10 = v43;
        id v13 = v45;
        uint64_t v48 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
        if (v48) {
          continue;
        }
        break;
      }
    }

    id v36 = (void *)[v13 copy];
    [v11 setObject:v36 forKeyedSubscript:@"OutputList"];
    BOOL v37 = 1;
LABEL_23:
  }
  else
  {
    BOOL v37 = 1;
  }

  return v37;
}

- (void)unitBottomNamesWithSourceTensor:(id)a3 liveInputs:(id)a4 unitBottomNames:(id)a5 sourceTensorsToLiveUp:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v9 parentLayers];
  if (![v13 count])
  {

    goto LABEL_29;
  }
  char v14 = [v10 containsObject:v9];

  if (v14)
  {
LABEL_29:
    uint64_t v30 = [v9 label];
    [v11 addObject:v30];

    [v12 addObject:v9];
    goto LABEL_33;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v32 = v9;
  obuint64_t j = [v9 parentLayers];
  uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  id v16 = self;
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v37;
    id v34 = v12;
    while (2)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v36 + 1) + 8 * v19);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && !ANE_IsAneCompiledLayer(v20)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          __int16 v21 = [v20 sourceTensors];
          int v22 = [v21 objectAtIndexedSubscript:0];

          [(_MLCANEPlistBuilder *)v16 unitBottomNamesWithSourceTensor:v22 liveInputs:v10 unitBottomNames:v11 sourceTensorsToLiveUp:v12];
        }
        else
        {
          id v23 = v10;
          id v24 = v20;
          if (ANE_IsAneCompiledLayer(v24))
          {
            uint64_t v25 = [v24 deviceOps];
            uint64_t v26 = [v25 objectAtIndexedSubscript:0];
            uint64_t v27 = [v26 units];

            if (v27 && [v27 count])
            {
              uint64_t v28 = [v27 objectAtIndexedSubscript:[v27 count] - 1];
              int v22 = [v28 objectForKeyedSubscript:@"Name"];
            }
            else
            {
              uint64_t v29 = +[MLCLog framework];
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                id v42 = "lastUnitNameOfLayer";
                __int16 v43 = 2112;
                id v44 = v24;
                _os_log_error_impl(&dword_1DD0C9000, v29, OS_LOG_TYPE_ERROR, "%s: layer=%@ does not have any unit compiled", buf, 0x16u);
              }

              int v22 = 0;
            }
            id v16 = self;
          }
          else
          {
            uint64_t v27 = +[MLCLog framework];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              id v42 = "lastUnitNameOfLayer";
              __int16 v43 = 2112;
              id v44 = v24;
              _os_log_error_impl(&dword_1DD0C9000, v27, OS_LOG_TYPE_ERROR, "%s: layer=%@ is not compiled with ANE device", buf, 0x16u);
            }
            int v22 = 0;
          }

          if (!v22)
          {
            int v31 = +[MLCLog framework];
            id v10 = v23;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              -[_MLCANEPlistBuilder unitBottomNamesWithSourceTensor:liveInputs:unitBottomNames:sourceTensorsToLiveUp:]();
            }

            id v9 = v32;
            id v12 = v34;
            goto LABEL_33;
          }
          [v11 addObject:v22];
          id v10 = v23;
          id v12 = v34;
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  id v9 = v32;
LABEL_33:
}

- (BOOL)addUnitsAndInputsAndOutpusOfLayer:(id)a3 toNetwork:(id)a4 toProcedure:(id)a5 operationName:(id)a6 liveInputs:(id)a7 liveOutputs:(id)a8
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v74 = a7;
  id v18 = a8;
  if (ANE_IsAneCompiledLayer(v14))
  {
    uint64_t v19 = [v15 objectForKeyedSubscript:@"Units"];
    v20 = [v19 mutableCopy];

    if (!v20) {
      v20 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    }
    aSelector = a2;
    __int16 v21 = [v14 deviceOps];
    int v22 = [v21 objectAtIndexedSubscript:0];

    id v23 = [v22 units];
    uint64_t v71 = v23;
    if (!v23 || ![v23 count])
    {
      id v24 = +[MLCLog framework];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[_MLCANEPlistBuilder addUnitsAndInputsAndOutpusOfLayer:toNetwork:toProcedure:operationName:liveInputs:liveOutputs:]();
      }
      BOOL v55 = 0;
      goto LABEL_54;
    }
    v64 = v22;
    id v65 = v16;
    v69 = v15;
    v70 = v20;
    id v66 = v17;
    id v24 = [MEMORY[0x1E4F1CC08] mutableCopy];
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    uint64_t v25 = [v14 sourceTensors];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v83 objects:v97 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v84 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          int v31 = [v30 label];
          [v24 setObject:v30 forKeyedSubscript:v31];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v83 objects:v97 count:16];
      }
      while (v27);
    }

    id v32 = v71;
    if ([v71 count])
    {
      uint64_t v33 = 0;
      id v34 = (void *)MEMORY[0x1E4F1CBF0];
      id v63 = v14;
      while (1)
      {
        uint64_t v62 = v33;
        int v35 = [v32 objectAtIndexedSubscript:v33];
        os_log_t log = [v35 objectForKeyedSubscript:@"Name"];
        -[NSObject addObject:](v70, "addObject:");
        long long v36 = [v35 objectForKeyedSubscript:@"Bottom"];
        long long v37 = (void *)[v34 mutableCopy];
        v72 = (void *)[v34 mutableCopy];
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v38 = v36;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v79 objects:v96 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v80;
          while (2)
          {
            for (uint64_t j = 0; j != v40; ++j)
            {
              if (*(void *)v80 != v41) {
                objc_enumerationMutation(v38);
              }
              uint64_t v43 = *(void *)(*((void *)&v79 + 1) + 8 * j);
              id v44 = [v24 objectForKeyedSubscript:v43];
              if (v44)
              {
                uint64_t v45 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
                [(_MLCANEPlistBuilder *)self unitBottomNamesWithSourceTensor:v44 liveInputs:v74 unitBottomNames:v45 sourceTensorsToLiveUp:v72];
                if (![v45 count])
                {
                  long long v56 = +[MLCLog framework];
                  id v14 = v63;
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    __int16 v59 = NSStringFromSelector(aSelector);
                    *(_DWORD *)buf = 138412802;
                    v89 = v59;
                    __int16 v90 = 2112;
                    v91 = v35;
                    __int16 v92 = 2112;
                    id v93 = v63;
                    _os_log_error_impl(&dword_1DD0C9000, v56, OS_LOG_TYPE_ERROR, "%@: failed to get the unit bottom names for the unit=%@ of layer=%@", buf, 0x20u);
                  }
                  __int16 v57 = v38;
                  id v15 = v69;
                  goto LABEL_48;
                }
                [v37 addObjectsFromArray:v45];
              }
              else
              {
                [v37 addObject:v43];
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v79 objects:v96 count:16];
            if (v40) {
              continue;
            }
            break;
          }
        }

        id v46 = (void *)[v37 copy];
        [v35 setObject:v46 forKeyedSubscript:@"Bottom"];

        id v16 = v65;
        id v15 = v69;
        if (![(_MLCANEPlistBuilder *)self addInputs:v72 ofUnit:v35 ofOperation:v66 toProcedure:v65 toNetwork:v69])break; {
        [v69 setObject:v35 forKeyedSubscript:log];
        }

        uint64_t v33 = v62 + 1;
        id v32 = v71;
        unint64_t v47 = [v71 count];
        id v14 = v63;
        id v34 = (void *)MEMORY[0x1E4F1CBF0];
        if (v62 + 1 >= v47) {
          goto LABEL_28;
        }
      }
      __int16 v57 = +[MLCLog framework];
      id v14 = v63;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        __int16 v60 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138413058;
        v89 = v60;
        __int16 v90 = 2112;
        v91 = v72;
        __int16 v92 = 2112;
        id v93 = v35;
        __int16 v94 = 2112;
        id v95 = v63;
        _os_log_error_impl(&dword_1DD0C9000, v57, OS_LOG_TYPE_ERROR, "%@: failed to add live inputs=%@ of the unit=%@ of layer=%@", buf, 0x2Au);

LABEL_48:
        id v16 = v65;
      }

      BOOL v55 = 0;
      id v17 = v66;
    }
    else
    {
LABEL_28:
      id v48 = [v70 copy];
      [v69 setObject:v48 forKeyedSubscript:@"Units"];

      int v35 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v49 = [v14 resultTensors];
      uint64_t v50 = [v49 countByEnumeratingWithState:&v75 objects:v87 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v76;
        do
        {
          for (uint64_t k = 0; k != v51; ++k)
          {
            if (*(void *)v76 != v52) {
              objc_enumerationMutation(v49);
            }
            uint64_t v54 = *(void *)(*((void *)&v75 + 1) + 8 * k);
            if ([v18 containsObject:v54]) {
              [v35 addObject:v54];
            }
          }
          uint64_t v51 = [v49 countByEnumeratingWithState:&v75 objects:v87 count:16];
        }
        while (v51);
      }

      id v16 = v65;
      id v17 = v66;
      id v15 = v69;
      BOOL v55 = [(_MLCANEPlistBuilder *)self addOutputs:v35 ofOperation:v66 toProcedure:v65 toNetwork:v69];
      if (v55)
      {
        v20 = v70;
LABEL_53:

        int v22 = v64;
LABEL_54:

        goto LABEL_55;
      }
      os_log_t log = +[MLCLog framework];
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v61 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        v89 = v61;
        __int16 v90 = 2112;
        v91 = v35;
        __int16 v92 = 2112;
        id v93 = v14;
        _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%@: failed to add live outputs=%@ of layer=%@", buf, 0x20u);
      }
    }
    v20 = v70;

    goto LABEL_53;
  }
  v20 = +[MLCLog framework];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[_MLCANEPlistBuilder addOutputs:ofOperation:toProcedure:toNetwork:]();
  }
  BOOL v55 = 0;
LABEL_55:

  return v55;
}

- (BOOL)addConstantTensor:(id)a3 toNetwork:(id)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 label];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v11 = [(id)objc_opt_class() createConstantTensorUnitWithTensor:v6];
    if (!v11)
    {
      id v12 = +[MLCLog framework];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[_MLCANEPlistBuilder addConstantTensor:toNetwork:]();
      }
      BOOL v10 = 0;
      goto LABEL_25;
    }
    id v12 = [v6 deviceMemory];
    unint64_t v13 = [v6 deviceIndex];
    if ([v12 count] <= v13) {
      goto LABEL_16;
    }
    id v14 = [v12 objectAtIndexedSubscript:v13];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = [v12 objectAtIndexedSubscript:v13];
      if ([v15 count] == 2)
      {
        long long v36 = [v12 objectAtIndexedSubscript:v13];
        id v16 = [v36 objectAtIndexedSubscript:0];
        objc_opt_class();
        long long v37 = v16;
        if (objc_opt_isKindOfClass())
        {
          id v34 = [v12 objectAtIndexedSubscript:v13];
          id v17 = [v34 objectAtIndexedSubscript:1];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v18 = [v12 objectAtIndexedSubscript:v13];
            uint64_t v19 = [v18 objectAtIndexedSubscript:0];

            v20 = [v12 objectAtIndexedSubscript:v13];
            __int16 v21 = [v20 objectAtIndexedSubscript:1];

            int v22 = [(_MLCANEPlistBuilder *)self weightOps];
            uint64_t v23 = [v22 addWeightData:v21 hash:v19];

            id v24 = [(_MLCANEPlistBuilder *)self weightTensorsWithDeviceMemory];
            [v24 addObject:v6];
LABEL_17:

            BOOL v10 = v23 != -1;
            if (v23 == -1)
            {
              uint64_t v27 = +[MLCLog framework];
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                -[_MLCANEPlistBuilder addConstantTensor:toNetwork:]();
              }
            }
            else
            {
              [v11 setObject:&unk_1F3876798 forKeyedSubscript:@"ConstantByteOffset"];
              uint64_t v25 = [NSNumber numberWithUnsignedInteger:v23];
              [v11 setObject:v25 forKeyedSubscript:@"ConstantIndex"];

              uint64_t v26 = [v7 objectForKeyedSubscript:@"Constants"];
              uint64_t v27 = [v26 mutableCopy];

              uint64_t v28 = [v6 label];
              uint64_t v29 = (void *)v28;
              if (v27)
              {
                [v27 addObject:v28];
              }
              else
              {
                v38[0] = v28;
                uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
                uint64_t v27 = [v30 mutableCopy];
              }
              int v31 = [v6 label];
              [v7 setObject:v11 forKeyedSubscript:v31];

              id v32 = [v27 copy];
              [v7 setObject:v32 forKeyedSubscript:@"Constants"];
            }
LABEL_25:

            goto LABEL_26;
          }
LABEL_16:
          uint64_t v19 = [(_MLCANEPlistBuilder *)self weightOps];
          __int16 v21 = [v6 data];
          id v24 = [v6 descriptor];
          uint64_t v23 = objc_msgSend(v19, "addWeightData:weightDataType:", v21, objc_msgSend(v24, "dataType"));
          goto LABEL_17;
        }
      }
    }

    goto LABEL_16;
  }
  BOOL v10 = 1;
LABEL_26:

  return v10;
}

- (BOOL)queryAndAddConstantTensors:(id)a3 ofLayer:(id)a4 toNetwork:(id)a5
{
  aSelector = a2;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (ANE_IsAneCompiledLayer(v9))
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    obuint64_t j = v8;
    uint64_t v47 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (!v47)
    {
      BOOL v35 = 1;
      goto LABEL_43;
    }
    uint64_t v48 = *(void *)v56;
    id v11 = @"Bottom";
    id v44 = v8;
    id v45 = v10;
    id v46 = v9;
    uint64_t v43 = self;
LABEL_4:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v56 != v48) {
        objc_enumerationMutation(obj);
      }
      uint64_t v51 = v12;
      unint64_t v13 = *(void **)(*((void *)&v55 + 1) + 8 * v12);
      id v14 = [(_MLCANEPlistBuilder *)self weightOps];
      id v15 = [v14 queryConstantTensor:v13];

      if (!v15)
      {
        id v34 = +[MLCLog framework];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[_MLCANEPlistBuilder queryAndAddConstantTensors:ofLayer:toNetwork:]();
        }
        goto LABEL_41;
      }
      if (v15 != v13)
      {
        id v16 = [v9 deviceOps];
        id v17 = [v16 objectAtIndexedSubscript:0];
        id v18 = [v17 units];

        id v42 = v13;
        uint64_t v19 = [v13 label];
        uint64_t v50 = v15;
        v20 = [v15 label];
        __int16 v21 = v18;
        id v22 = v19;
        id v23 = v20;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v52 = v21;
        uint64_t v54 = [v21 countByEnumeratingWithState:&v59 objects:buf count:16];
        if (!v54)
        {

          id v34 = v21;
LABEL_38:
          long long v36 = +[MLCLog framework];
          id v15 = v50;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            long long v38 = NSStringFromSelector(aSelector);
            uint64_t v39 = [v42 label];
            uint64_t v40 = [v50 label];
            *(_DWORD *)buf = 138413058;
            id v65 = v38;
            __int16 v66 = 2112;
            int v67 = v39;
            __int16 v68 = 2112;
            v69 = v40;
            __int16 v70 = 2112;
            uint64_t v71 = v52;
            _os_log_error_impl(&dword_1DD0C9000, v36, OS_LOG_TYPE_ERROR, "%@: failed to replace unit bottom name %@ with %@ in units=%@", buf, 0x2Au);

            id v34 = v52;
          }

          id v10 = v45;
          id v9 = v46;
LABEL_41:

          goto LABEL_42;
        }
        char v24 = 0;
        uint64_t v53 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v54; ++i)
          {
            if (*(void *)v60 != v53) {
              objc_enumerationMutation(v52);
            }
            uint64_t v26 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            uint64_t v27 = [v26 objectForKeyedSubscript:v11];
            uint64_t v28 = (void *)[v27 mutableCopy];

            if ([v28 count])
            {
              uint64_t v29 = v11;
              unint64_t v30 = 0;
              char v31 = 0;
              do
              {
                id v32 = [v28 objectAtIndexedSubscript:v30];
                if ([v32 isEqualToString:v22])
                {
                  [v28 replaceObjectAtIndex:v30 withObject:v23];
                  char v31 = 1;
                  char v24 = 1;
                }

                ++v30;
              }
              while (v30 < [v28 count]);
              if (v31)
              {
                uint64_t v33 = (void *)[v28 copy];
                id v11 = v29;
                [v26 setObject:v33 forKeyedSubscript:v29];
              }
              else
              {
                id v11 = v29;
              }
            }
          }
          uint64_t v54 = [v52 countByEnumeratingWithState:&v59 objects:buf count:16];
        }
        while (v54);

        id v34 = v52;
        id v8 = v44;
        if ((v24 & 1) == 0) {
          goto LABEL_38;
        }

        id v10 = v45;
        id v9 = v46;
        id v15 = v50;
        self = v43;
      }
      if (![(_MLCANEPlistBuilder *)self addConstantTensor:v15 toNetwork:v10])
      {
        id v34 = +[MLCLog framework];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[_MLCANEPlistBuilder addConstantTensor:toNetwork:]();
        }
        goto LABEL_41;
      }

      uint64_t v12 = v51 + 1;
      if (v51 + 1 == v47)
      {
        BOOL v35 = 1;
        uint64_t v47 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
        if (v47) {
          goto LABEL_4;
        }
        goto LABEL_43;
      }
    }
  }
  obuint64_t j = +[MLCLog framework];
  if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
    -[_MLCANEPlistBuilder addOutputs:ofOperation:toProcedure:toNetwork:]();
  }
LABEL_42:
  BOOL v35 = 0;
LABEL_43:

  return v35;
}

- (BOOL)addWeightsOfConvolutionLayer:(id)a3
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E01B11E0]();
  id v7 = [v5 deviceOps];
  id v8 = [v7 objectAtIndexedSubscript:0];
  id v9 = [v8 units];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v10 = [v5 weights];
    id v11 = [v5 biases];
    uint64_t v12 = ANE_FindUnitWithType(@"Conv", v9);
    unint64_t v13 = v12;
    if (!v12)
    {
      id v14 = +[MLCLog framework];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:]();
      }
      BOOL v26 = 0;
      goto LABEL_43;
    }
    uint64_t v48 = a2;
    uint64_t v51 = v6;
    uint64_t v52 = v11;
    id v14 = [v12 objectForKeyedSubscript:@"Params"];
    id v15 = [v10 descriptor];
    uint64_t v16 = [v15 dataType];

    id v17 = [v10 deviceMemory];
    unint64_t v18 = [v17 count];
    unint64_t v19 = [v10 deviceIndex];

    if (v18 <= v19)
    {
      char v24 = [v10 data];
    }
    else
    {
      v20 = [v10 deviceMemory];
      __int16 v21 = objc_msgSend(v20, "objectAtIndexedSubscript:", -[NSObject deviceIndex](v10, "deviceIndex"));
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        char v24 = +[MLCLog framework];
        id v11 = v52;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:].cold.8();
        }
        BOOL v26 = 0;
        id v6 = v51;
        goto LABEL_42;
      }
      id v23 = [v10 deviceMemory];
      char v24 = objc_msgSend(v23, "objectAtIndexedSubscript:", -[NSObject deviceIndex](v10, "deviceIndex"));

      uint64_t v25 = [(_MLCANEPlistBuilder *)self weightTensorsWithDeviceMemory];
      [v25 addObject:v10];
    }
    id v54 = 0;
    uint64_t v55 = 0;
    id v53 = 0;
    int v27 = ANE_CompressSparseKernel(v24, v16, &v54, &v53, &v55, 0.000060976);
    id v50 = v54;
    id v49 = v53;
    if (v55)
    {
      if (v27)
      {
        [v14 setObject:@"Sparse" forKeyedSubscript:@"KernelMode"];
        uint64_t v28 = [NSNumber numberWithUnsignedInteger:v55];
        [v14 setObject:v28 forKeyedSubscript:@"KernelCoeffCount"];

        uint64_t v29 = [(_MLCANEPlistBuilder *)self weightOps];
        uint64_t v30 = [v29 addWeightData:v50 weightDataType:6];

        if (v30 == -1)
        {
          id v34 = +[MLCLog framework];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:](v48);
          }
        }
        else
        {
          char v31 = [(_MLCANEPlistBuilder *)self weightOps];
          uint64_t v32 = [v31 addWeightData:v49 weightDataType:v16];

          if (v32 != -1)
          {
            uint64_t v33 = [NSNumber numberWithUnsignedInteger:v30];
            [v14 setObject:v33 forKeyedSubscript:@"KernelMaskIndex"];

            [v14 setObject:&unk_1F3876798 forKeyedSubscript:@"KernelMaskByteOffset"];
            goto LABEL_25;
          }
          id v34 = +[MLCLog framework];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:].cold.4(v48);
          }
        }
      }
      else
      {
        [v14 setObject:@"Dense" forKeyedSubscript:@"KernelMode"];
        BOOL v35 = [(_MLCANEPlistBuilder *)self weightOps];
        uint64_t v32 = [v35 addWeightData:v24 weightDataType:v16];

        if (v32 != -1)
        {
LABEL_25:
          long long v36 = [NSNumber numberWithUnsignedInteger:v32];
          [v14 setObject:v36 forKeyedSubscript:@"KernelIndex"];

          [v14 setObject:&unk_1F3876798 forKeyedSubscript:@"KernelOffset"];
          id v11 = v52;
          if (!v52)
          {
            BOOL v26 = 1;
            id v6 = v51;
LABEL_41:

LABEL_42:
LABEL_43:

            goto LABEL_44;
          }
          id v34 = ANE_FindUnitWithType(@"GOC", v9);
          if (v34)
          {
            uint64_t v47 = [(_MLCANEPlistBuilder *)self weightOps];
            long long v37 = [v52 data];
            long long v38 = [v52 descriptor];
            uint64_t v39 = objc_msgSend(v47, "addWeightData:weightDataType:", v37, objc_msgSend(v38, "dataType"));

            uint64_t v40 = v39;
            if (v39 != -1)
            {
              uint64_t v41 = [v34 objectForKeyedSubscript:@"Params"];
              id v42 = [NSNumber numberWithUnsignedInteger:v40];
              uint64_t v43 = [v41 objectForKeyedSubscript:@"BiasScaleGroupData"];
              [v43 setObject:v42 forKeyedSubscript:@"BiasIndex"];

              id v44 = [v41 objectForKeyedSubscript:@"BiasScaleGroupData"];
              [v44 setObject:&unk_1F3876798 forKeyedSubscript:@"BiasOffset"];

              BOOL v26 = 1;
LABEL_39:
              id v6 = v51;
              id v11 = v52;
LABEL_40:

              goto LABEL_41;
            }
            id v45 = +[MLCLog framework];
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              id v11 = v52;
              -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:].cold.6();
              id v6 = v51;
            }
            else
            {
              id v6 = v51;
              id v11 = v52;
            }
          }
          else
          {
            id v45 = +[MLCLog framework];
            id v6 = v51;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
              -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:].cold.5();
            }
          }

          BOOL v26 = 0;
          goto LABEL_40;
        }
        id v34 = +[MLCLog framework];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:].cold.7();
        }
      }
    }
    else
    {
      id v34 = +[MLCLog framework];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        [(_MLCANEPlistBuilder *)(uint64_t)v10 addWeightsOfConvolutionLayer:0.000060976];
      }
    }
    BOOL v26 = 0;
    goto LABEL_39;
  }
  id v10 = +[MLCLog framework];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:].cold.9();
  }
  BOOL v26 = 0;
LABEL_44:

  return v26;
}

- (BOOL)addWeightsOfFullyConnectedLayer:(id)a3 toNetwork:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (ANE_IsAneCompiledLayer(v6))
  {
    id v8 = [v6 deviceOps];
    id v9 = [v8 objectAtIndexedSubscript:0];

    id v10 = [v9 constantTensors];
    BOOL v11 = [(_MLCANEPlistBuilder *)self queryAndAddConstantTensors:v10 ofLayer:v6 toNetwork:v7];
    if (v11)
    {
      [v10 removeAllObjects];
    }
    else
    {
      uint64_t v12 = +[MLCLog framework];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[_MLCANEPlistBuilder addWeightsOfFullyConnectedLayer:toNetwork:]();
      }
    }
  }
  else
  {
    id v9 = +[MLCLog framework];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_MLCANEPlistBuilder addOutputs:ofOperation:toProcedure:toNetwork:]();
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)addScalesAndBiasesOfGocUnit:(id)a3 tensorWithBiases:(id)a4 tensorWithScales:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = (void *)MEMORY[0x1E01B11E0]();
  uint64_t v12 = [v9 deviceMemory];
  unint64_t v13 = [v12 count];
  unint64_t v14 = [v9 deviceIndex];

  if (v13 <= v14)
  {
    uint64_t v16 = [v9 data];
  }
  else
  {
    id v15 = [v9 deviceMemory];
    uint64_t v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v9, "deviceIndex"));

    id v17 = [(_MLCANEPlistBuilder *)self weightTensorsWithDeviceMemory];
    [v17 addObject:v9];
  }
  unint64_t v18 = [(_MLCANEPlistBuilder *)self weightOps];
  unint64_t v19 = [v9 descriptor];
  uint64_t v20 = objc_msgSend(v18, "addWeightData:weightDataType:", v16, objc_msgSend(v19, "dataType"));

  if (v20 == -1)
  {
    uint64_t v25 = +[MLCLog framework];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[_MLCANEPlistBuilder addScalesAndBiasesOfGocUnit:tensorWithBiases:tensorWithScales:]();
    }
    goto LABEL_15;
  }
  __int16 v21 = [v10 deviceMemory];
  unint64_t v22 = [v21 count];
  unint64_t v23 = [v10 deviceIndex];

  if (v22 <= v23)
  {
    uint64_t v25 = [v10 data];
  }
  else
  {
    char v24 = [v10 deviceMemory];
    uint64_t v25 = objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v10, "deviceIndex"));

    BOOL v26 = [(_MLCANEPlistBuilder *)self weightTensorsWithDeviceMemory];
    [v26 addObject:v10];
  }
  int v27 = [(_MLCANEPlistBuilder *)self weightOps];
  uint64_t v28 = [v10 descriptor];
  uint64_t v29 = objc_msgSend(v27, "addWeightData:weightDataType:", v25, objc_msgSend(v28, "dataType"));

  if (v29 == -1)
  {
    long long v38 = +[MLCLog framework];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[_MLCANEPlistBuilder addScalesAndBiasesOfGocUnit:tensorWithBiases:tensorWithScales:]();
    }

LABEL_15:
    BOOL v37 = 0;
    goto LABEL_16;
  }
  uint64_t v30 = [v8 objectForKeyedSubscript:@"Params"];
  char v31 = [NSNumber numberWithUnsignedInteger:v20];
  [v30 objectForKeyedSubscript:@"BiasScaleGroupData"];
  uint64_t v32 = v40 = v11;
  [v32 setObject:v31 forKeyedSubscript:@"BiasIndex"];

  uint64_t v33 = [v30 objectForKeyedSubscript:@"BiasScaleGroupData"];
  [v33 setObject:&unk_1F3876798 forKeyedSubscript:@"BiasOffset"];

  id v34 = [NSNumber numberWithUnsignedInteger:v29];
  BOOL v35 = [v30 objectForKeyedSubscript:@"BiasScaleGroupData"];
  [v35 setObject:v34 forKeyedSubscript:@"ScaleIndex"];

  long long v36 = [v30 objectForKeyedSubscript:@"BiasScaleGroupData"];
  [v36 setObject:&unk_1F3876798 forKeyedSubscript:@"ScaleOffset"];

  BOOL v11 = v40;
  BOOL v37 = 1;
LABEL_16:

  return v37;
}

- (BOOL)addWeightsOfNormalizationLayer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 deviceOps];
  id v6 = [v5 objectAtIndexedSubscript:0];
  id v7 = [v6 units];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v4;
      uint64_t v15 = ANE_FindUnitWithType(@"GOC", v7);
      if (v15)
      {
        uint64_t v16 = (void *)v15;
        uint64_t v17 = [v14 mean];
        if (v17)
        {
          unint64_t v18 = (void *)v17;
          unint64_t v19 = [v14 variance];

          if (v19)
          {
            uint64_t v20 = [v14 mean];
            uint64_t v21 = [v14 variance];
LABEL_13:
            unint64_t v23 = (void *)v21;
            BOOL v13 = [(_MLCANEPlistBuilder *)self addScalesAndBiasesOfGocUnit:v16 tensorWithBiases:v20 tensorWithScales:v21];

            goto LABEL_22;
          }
        }
LABEL_12:
        uint64_t v20 = [v14 beta];
        uint64_t v21 = [v14 gamma];
        goto LABEL_13;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v25 = +[MLCLog framework];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:].cold.9();
        }

        goto LABEL_21;
      }
      id v14 = v4;
      uint64_t v22 = ANE_FindUnitWithType(@"GOC", v7);
      if (v22)
      {
        uint64_t v16 = (void *)v22;
        goto LABEL_12;
      }
    }

    BOOL v13 = 1;
    goto LABEL_22;
  }
  id v8 = v4;
  uint64_t v9 = ANE_FindUnitWithType(@"GOC", v7);
  if (!v9)
  {
    char v24 = +[MLCLog framework];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[_MLCANEPlistBuilder addWeightsOfNormalizationLayer:]();
    }

LABEL_21:
    BOOL v13 = 0;
    goto LABEL_22;
  }
  id v10 = (void *)v9;
  BOOL v11 = [v8 mean];
  uint64_t v12 = [v8 variance];
  BOOL v13 = [(_MLCANEPlistBuilder *)self addScalesAndBiasesOfGocUnit:v10 tensorWithBiases:v11 tensorWithScales:v12];

LABEL_22:
  return v13;
}

- (BOOL)addWeightsOfLayerNormalizationLayer:(id)a3 toNetwork:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (ANE_IsAneCompiledLayer(v6))
  {
    id v8 = [v6 deviceOps];
    uint64_t v9 = [v8 objectAtIndexedSubscript:0];

    id v10 = [v9 constantTensors];
    BOOL v11 = [(_MLCANEPlistBuilder *)self queryAndAddConstantTensors:v10 ofLayer:v6 toNetwork:v7];
    if (v11)
    {
      [v10 removeAllObjects];
    }
    else
    {
      uint64_t v12 = +[MLCLog framework];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[_MLCANEPlistBuilder addWeightsOfFullyConnectedLayer:toNetwork:]();
      }
    }
  }
  else
  {
    uint64_t v9 = +[MLCLog framework];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_MLCANEPlistBuilder addOutputs:ofOperation:toProcedure:toNetwork:]();
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)addWeightsOfLayer:(id)a3 toNetwork:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [(_MLCANEPlistBuilder *)self addWeightsOfConvolutionLayer:v6];
LABEL_10:
    BOOL v14 = v8;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      BOOL v8 = [(_MLCANEPlistBuilder *)self addWeightsOfNormalizationLayer:v6];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v14 = 1;
        goto LABEL_13;
      }
      BOOL v8 = [(_MLCANEPlistBuilder *)self addWeightsOfLayerNormalizationLayer:v6 toNetwork:v7];
    }
    goto LABEL_10;
  }
  uint64_t v9 = [v6 deviceOps];
  id v10 = [v9 objectAtIndexedSubscript:0];
  BOOL v11 = [v10 units];

  uint64_t v12 = ANE_FindUnitWithType(@"Conv", v11);

  if (v12) {
    BOOL v13 = [(_MLCANEPlistBuilder *)self addWeightsOfConvolutionLayer:v6];
  }
  else {
    BOOL v13 = [(_MLCANEPlistBuilder *)self addWeightsOfFullyConnectedLayer:v6 toNetwork:v7];
  }
  BOOL v14 = v13;

LABEL_13:
  return v14;
}

- (BOOL)buildProcedureWithLayer:(id)a3
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!ANE_IsAneCompiledLayer(v4))
  {
    id v7 = +[MLCLog framework];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_MLCANEPlistBuilder buildProcedureWithLayer:].cold.4();
    }
    goto LABEL_7;
  }
  id v5 = [v4 fusedLayers];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = +[MLCLog framework];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_MLCANEPlistBuilder buildProcedureWithLayer:]();
    }
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_8;
  }
  id v10 = (void *)MEMORY[0x1E4F1CC08];
  id v7 = [MEMORY[0x1E4F1CC08] mutableCopy];
  BOOL v11 = NSString;
  uint64_t v12 = [v4 label];
  uint64_t v13 = [v11 stringWithFormat:@"%@%@", @"procedure_", v12];

  BOOL v14 = (void *)[v10 mutableCopy];
  uint64_t v15 = NSString;
  uint64_t v16 = [v4 label];
  uint64_t v17 = (void *)v13;
  unint64_t v18 = [v15 stringWithFormat:@"%@%@", @"network_", v16];

  [v7 setObject:v13 forKeyedSubscript:@"Name"];
  v44[0] = @"OperationName";
  v44[1] = @"NetworkName";
  v45[0] = @"op0";
  v45[1] = v18;
  uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
  uint64_t v43 = v42;
  unint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  [v7 setObject:v19 forKeyedSubscript:@"OperationList"];

  if ([(_MLCANEPlistBuilder *)self addWeightsOfLayer:v4 toNetwork:v14])
  {
    uint64_t v40 = (void *)v13;
    uint64_t v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = [v4 sourceTensors];
    uint64_t v22 = [v20 setWithArray:v21];

    unint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
    char v24 = [v4 resultTensors];
    uint64_t v25 = [v23 setWithArray:v24];

    uint64_t v41 = (void *)v25;
    BOOL v8 = [(_MLCANEPlistBuilder *)self addUnitsAndInputsAndOutpusOfLayer:v4 toNetwork:v14 toProcedure:v7 operationName:@"op0" liveInputs:v22 liveOutputs:v25];
    if (v8)
    {
      BOOL v26 = [(_MLCANEPlistBuilder *)self weightOps];
      int v27 = [v26 weightFiles];
      uint64_t v28 = [v27 count];

      if (v28)
      {
        uint64_t v29 = [(_MLCANEPlistBuilder *)self weightOps];
        uint64_t v30 = [v29 weightFiles];
        char v31 = (void *)[v30 copy];
        [v14 setObject:v31 forKeyedSubscript:@"Weights"];
      }
      uint64_t v32 = [(_MLCANEPlistBuilder *)self plist];
      uint64_t v33 = [v32 objectForKeyedSubscript:@"Networks"];

      [v33 addObject:v18];
      id v34 = [(_MLCANEPlistBuilder *)self plist];
      [v34 setObject:v14 forKeyedSubscript:v18];

      BOOL v35 = [(_MLCANEPlistBuilder *)self plist];
      long long v36 = [v35 objectForKeyedSubscript:@"ProcedureList"];

      [v36 addObject:v7];
      BOOL v37 = [v4 deviceOps];
      long long v38 = [v37 objectAtIndexedSubscript:0];

      uint64_t v17 = v40;
      [v38 setProcedureName:v40];
      objc_msgSend(v38, "setProcedureIndex:", objc_msgSend(v36, "count") - 1);
    }
    else
    {
      uint64_t v33 = +[MLCLog framework];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[_MLCANEPlistBuilder buildProcedureWithLayer:]();
      }
      uint64_t v17 = v40;
    }
    uint64_t v39 = (void *)v42;
  }
  else
  {
    uint64_t v22 = +[MLCLog framework];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[_MLCANEPlistBuilder buildProcedureWithLayer:]();
    }
    BOOL v8 = 0;
    uint64_t v39 = (void *)v42;
  }

LABEL_8:
  return v8;
}

- (BOOL)buildProcedureWithRootLayer:(id)a3 aneSubgraphLayerList:(id)a4 liveInputs:(id)a5 liveOutputs:(id)a6
{
  v88[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v70 = a5;
  id v68 = a6;
  if (!ANE_IsAneCompiledLayer(v9))
  {
    unint64_t v18 = +[MLCLog framework];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[_MLCANEPlistBuilder buildProcedureWithRootLayer:aneSubgraphLayerList:liveInputs:liveOutputs:]();
    }
    BOOL v27 = 0;
    goto LABEL_33;
  }
  BOOL v11 = (void *)MEMORY[0x1E4F1CC08];
  uint64_t v12 = [MEMORY[0x1E4F1CC08] mutableCopy];
  uint64_t v13 = NSString;
  BOOL v14 = [v9 label];
  uint64_t v15 = [v13 stringWithFormat:@"%@%@", @"procedure_", v14];

  __int16 v66 = (void *)[v11 mutableCopy];
  uint64_t v16 = NSString;
  long long v62 = v9;
  uint64_t v17 = [v9 label];
  unint64_t v18 = v12;
  uint64_t v19 = [v16 stringWithFormat:@"%@%@", @"network_", v17];

  long long v60 = (void *)v15;
  uint64_t v20 = v15;
  uint64_t v21 = (void *)v19;
  [v12 setObject:v20 forKeyedSubscript:@"Name"];
  v87[0] = @"OperationName";
  v87[1] = @"NetworkName";
  v88[0] = @"op0";
  v88[1] = v19;
  long long v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:2];
  long long v86 = v61;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
  [v12 setObject:v22 forKeyedSubscript:@"OperationList"];

  uint64_t v23 = [v10 count];
  char v24 = self;
  id v25 = v70;
  if (!v23)
  {
LABEL_26:
    id v45 = [(_MLCANEPlistBuilder *)v24 weightOps];
    id v46 = [v45 weightFiles];
    uint64_t v47 = v24;
    uint64_t v48 = [v46 count];

    id v44 = v66;
    if (v48)
    {
      id v49 = [(_MLCANEPlistBuilder *)v47 weightOps];
      id v50 = [v49 weightFiles];
      uint64_t v51 = (void *)[v50 copy];
      [v66 setObject:v51 forKeyedSubscript:@"Weights"];
    }
    uint64_t v52 = [(_MLCANEPlistBuilder *)v47 plist];
    uint64_t v29 = [v52 objectForKeyedSubscript:@"Networks"];

    [v29 addObject:v21];
    id v53 = [(_MLCANEPlistBuilder *)v47 plist];
    [v53 setObject:v66 forKeyedSubscript:v21];

    id v54 = [(_MLCANEPlistBuilder *)v47 plist];
    uint64_t v55 = [v54 objectForKeyedSubscript:@"ProcedureList"];

    [v55 addObject:v18];
    long long v56 = [v62 deviceOps];
    long long v57 = [v56 objectAtIndexedSubscript:0];

    long long v58 = v60;
    [v57 setProcedureName:v60];
    objc_msgSend(v57, "setProcedureIndex:", -[NSObject count](v55, "count") - 1);

    BOOL v27 = 1;
    goto LABEL_29;
  }
  unint64_t v26 = v23;
  BOOL v27 = 0;
  uint64_t v28 = 0;
  v64 = v12;
  id v65 = v10;
  id v63 = v21;
  uint64_t v69 = v23;
  while (1)
  {
    uint64_t v29 = [v10 objectAtIndexedSubscript:v28];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_25;
    }
    uint64_t v71 = v28;
    if (ANE_IsPaddingLayerAndNotCompiledForANE(v29))
    {
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      obuint64_t j = [v29 resultTensors];
      uint64_t v74 = [obj countByEnumeratingWithState:&v80 objects:v85 count:16];
      if (v74)
      {
        uint64_t v73 = *(void *)v81;
        do
        {
          uint64_t v30 = 0;
          do
          {
            if (*(void *)v81 != v73) {
              objc_enumerationMutation(obj);
            }
            uint64_t v75 = v30;
            char v31 = *(void **)(*((void *)&v80 + 1) + 8 * v30);
            long long v76 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            uint64_t v32 = [v31 childLayers];
            uint64_t v33 = [v32 countByEnumeratingWithState:&v76 objects:v84 count:16];
            if (v33)
            {
              uint64_t v34 = v33;
              uint64_t v35 = *(void *)v77;
              do
              {
                for (uint64_t i = 0; i != v34; ++i)
                {
                  if (*(void *)v77 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  BOOL v37 = [*(id *)(*((void *)&v76 + 1) + 8 * i) deviceOps];
                  long long v38 = [v37 objectAtIndexedSubscript:0];

                  objc_opt_class();
                  char isKindOfClass = objc_opt_isKindOfClass();
                  uint64_t v40 = @"Pooling";
                  if (isKindOfClass) {
                    uint64_t v40 = @"Conv";
                  }
                  uint64_t v41 = v40;
                  uint64_t v42 = [v38 units];
                  uint64_t v43 = ANE_FindUnitWithType(v41, v42);

                  ANE_ApplyPaddingSizes(v29, v43);
                }
                uint64_t v34 = [v32 countByEnumeratingWithState:&v76 objects:v84 count:16];
              }
              while (v34);
            }

            uint64_t v30 = v75 + 1;
          }
          while (v75 + 1 != v74);
          uint64_t v74 = [obj countByEnumeratingWithState:&v80 objects:v85 count:16];
        }
        while (v74);
      }

      unint64_t v18 = v64;
      id v10 = v65;
      unint64_t v26 = v69;
      id v25 = v70;
      uint64_t v21 = v63;
      char v24 = self;
      uint64_t v28 = v71;
      goto LABEL_25;
    }
    id v44 = v66;
    if (![(_MLCANEPlistBuilder *)v24 addWeightsOfLayer:v29 toNetwork:v66]) {
      break;
    }
    unint64_t v26 = v69;
    if (![(_MLCANEPlistBuilder *)v24 addUnitsAndInputsAndOutpusOfLayer:v29 toNetwork:v66 toProcedure:v18 operationName:@"op0" liveInputs:v25 liveOutputs:v68])
    {
      uint64_t v55 = +[MLCLog framework];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        -[_MLCANEPlistBuilder buildProcedureWithLayer:]();
      }
      long long v58 = v60;
      id v44 = v66;
      goto LABEL_29;
    }
LABEL_25:

    BOOL v27 = ++v28 >= v26;
    if (v28 == v26) {
      goto LABEL_26;
    }
  }
  uint64_t v55 = +[MLCLog framework];
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
    -[_MLCANEPlistBuilder buildProcedureWithLayer:]();
  }
  long long v58 = v60;
LABEL_29:

  id v9 = v62;
LABEL_33:

  return v27;
}

- (void)releaseWeights
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E01B11E0](self, a2);
  id v4 = [(_MLCANEPlistBuilder *)self weightOps];
  [v4 reset];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(_MLCANEPlistBuilder *)self weightTensorsWithDeviceMemory];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) deviceMemory];
        [v10 removeAllObjects];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  BOOL v11 = [(_MLCANEPlistBuilder *)self weightTensorsWithDeviceMemory];
  [v11 removeAllObjects];
}

- (NSMutableDictionary)plist
{
  return self->_plist;
}

- (_MLCANEWeightOps)weightOps
{
  return self->_weightOps;
}

- (NSMutableSet)weightTensorsWithDeviceMemory
{
  return self->_weightTensorsWithDeviceMemory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightTensorsWithDeviceMemory, 0);
  objc_storeStrong((id *)&self->_weightOps, 0);

  objc_storeStrong((id *)&self->_plist, 0);
}

+ (void)createUnitWithLayer:unitParams:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_2_0();
  __int16 v6 = 2112;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  _os_log_error_impl(&dword_1DD0C9000, v0, OS_LOG_TYPE_ERROR, "%@: missing the key of %@ in %@", v5, 0x20u);
}

+ (void)buildBiasParamsWithBiases:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  SEL v2 = NSStringFromSelector(v1);
  [v0 dataType];
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v3, v4, "%@: unsupported data type=%d", v5, v6, v7, v8, 2u);
}

+ (void)buildBiasParamsWithBiases:(const char *)a1 .cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: 8-bit data type for biases is not supported on Apple Neural Engine", v4, v5, v6, v7, v8);
}

+ (void)createReshapeUnitWithSourceTensor:(const char *)a1 layer:resultShape:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: the result shape should be 4D", v4, v5, v6, v7, v8);
}

+ (void)createReshapeUnitsWithLayer:reshapeUnits:reshapeResultTensors:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1DD0C9000, v0, OS_LOG_TYPE_ERROR, "%s: failed to create the reshape unit for layer=%@", (uint8_t *)v1, 0x16u);
}

+ (void)createReshapeUnitsWithLayer:(uint64_t)a1 reshapeUnits:(NSObject *)a2 reshapeResultTensors:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "+[_MLCANEPlistBuilder createReshapeUnitsWithLayer:reshapeUnits:reshapeResultTensors:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%s: unsupported source shape count=%lu", (uint8_t *)&v2, 0x16u);
}

+ (void)createBroadcastUnitWithSourceTensor:(const char *)a1 targetShape:layer:broadcastUnit:broadcastResultTensor:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v2, v3, "%@: failed to get the ANEC IR data type from data type=%d", v4, v5, v6, v7, v8);
}

+ (void)createBroadcastUnitWithSourceTensor:targetShape:layer:broadcastUnit:broadcastResultTensor:.cold.2()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_9();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_1DD0C9000, v2, OS_LOG_TYPE_ERROR, "%s: the broadcast unit=%@ for layer=%@ failed validation", (uint8_t *)v3, 0x20u);
}

+ (void)createBroadcastUnitWithSourceTensor:(const char *)a1 targetShape:layer:broadcastUnit:broadcastResultTensor:.cold.3(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: target shape has to be 4 dimensions", v4, v5, v6, v7, v8);
}

- (void)addOutputs:ofOperation:toProcedure:toNetwork:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: layer=%@ is not compiled with ANE device", v4, v5, v6, v7, v8);
}

- (void)unitBottomNamesWithSourceTensor:liveInputs:unitBottomNames:sourceTensorsToLiveUp:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: cannot get the last unit name from layer=%@", v4, v5, v6, v7, v8);
}

- (void)addUnitsAndInputsAndOutpusOfLayer:toNetwork:toProcedure:operationName:liveInputs:liveOutputs:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: layer=%@ does not have any unit compiled", v4, v5, v6, v7, v8);
}

- (void)addConstantTensor:toNetwork:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to create the constant tensor unit for tensor=%@", v4, v5, v6, v7, v8);
}

- (void)addConstantTensor:toNetwork:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to add the data of the constant tensor=%@", v4, v5, v6, v7, v8);
}

- (void)queryAndAddConstantTensors:ofLayer:toNetwork:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to query constant tensor=%@", v4, v5, v6, v7, v8);
}

- (void)addWeightsOfConvolutionLayer:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: convolution unit is not found. layer=%@", v4, v5, v6, v7, v8);
}

- (void)addWeightsOfConvolutionLayer:(float)a3 .cold.2(uint64_t a1, NSObject *a2, float a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  uint64_t v4 = "-[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:]";
  __int16 v5 = 2048;
  double v6 = a3;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%s: the absolute values of all weights are below %.8f and considered to be all 0's. weight tensor=%@", (uint8_t *)&v3, 0x20u);
}

- (void)addWeightsOfConvolutionLayer:(const char *)a1 .cold.3(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: failed to add the mask of a sparse kernel", v4, v5, v6, v7, v8);
}

- (void)addWeightsOfConvolutionLayer:(const char *)a1 .cold.4(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: failed to add the non-zero values of a sparse kernel", v4, v5, v6, v7, v8);
}

- (void)addWeightsOfConvolutionLayer:.cold.5()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: GOC unit is not found. layer=%@", v4, v5, v6, v7, v8);
}

- (void)addWeightsOfConvolutionLayer:.cold.6()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to add the biases of tensor=%@", v4, v5, v6, v7, v8);
}

- (void)addWeightsOfConvolutionLayer:.cold.7()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to add the weights of tensor=%@", v4, v5, v6, v7, v8);
}

- (void)addWeightsOfConvolutionLayer:.cold.8()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: NSData not found in the device memory of weights=%@", v4, v5, v6, v7, v8);
}

- (void)addWeightsOfConvolutionLayer:.cold.9()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: unsupported layer=%@", v4, v5, v6, v7, v8);
}

- (void)addWeightsOfFullyConnectedLayer:toNetwork:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to add the constant tensors programmed for layer=%@", v4, v5, v6, v7, v8);
}

- (void)addScalesAndBiasesOfGocUnit:tensorWithBiases:tensorWithScales:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to add the computed biases of tensor=%@", v4, v5, v6, v7, v8);
}

- (void)addScalesAndBiasesOfGocUnit:tensorWithBiases:tensorWithScales:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to write the computed scales of tensor=%@", v4, v5, v6, v7, v8);
}

- (void)addWeightsOfNormalizationLayer:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: cannot find a GOC unit for batch normalization layer=%@", v4, v5, v6, v7, v8);
}

- (void)buildProcedureWithLayer:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to add units of layer=%@", v4, v5, v6, v7, v8);
}

- (void)buildProcedureWithLayer:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to add the weights, biases, or sacles of layer=%@", v4, v5, v6, v7, v8);
}

- (void)buildProcedureWithLayer:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: layer=%@ should not have fused layers", v4, v5, v6, v7, v8);
}

- (void)buildProcedureWithLayer:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: laye=%@ is not compiled with ANE device", v4, v5, v6, v7, v8);
}

- (void)buildProcedureWithRootLayer:aneSubgraphLayerList:liveInputs:liveOutputs:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: layer = %@ is not compiled for ANE device", v4, v5, v6, v7, v8);
}

@end