@interface HFCharacteristicValueManager
+ (BOOL)_shouldTrackReadsCompleteForPerformanceTesting;
+ (NAIdentity)na_identity;
- (BOOL)hasCachedReadErrorForAccessory:(id)a3 passingTest:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNaturalLightingEnabledForProfile:(id)a3;
- (BOOL)isNaturalLightingSupportedForProfile:(id)a3;
- (BOOL)staticHomeDataModelHasInProgressWriteForCharacteristic:(id)a3;
- (HFCharacteristicOperationContextProviding)contextProvider;
- (HFCharacteristicReadLogger)readsCompleteLogger;
- (HFCharacteristicValueCacheManager)cacheManager;
- (HFCharacteristicValueManager)initWithValueReader:(id)a3 valueWriter:(id)a4;
- (HFCharacteristicValueReader)valueReader;
- (HFCharacteristicValueTransaction)openTransaction;
- (HFCharacteristicValueWriter)valueWriter;
- (NACancelationToken)inFlightReadCancelationToken;
- (NAFuture)firstReadCompleteFuture;
- (NSMutableArray)completionHandlersForReadTransactionsToExecuteOnNextRunLoop;
- (NSMutableArray)readTransactionsToExecuteOnNextRunLoop;
- (NSMutableArray)runningTransactions;
- (NSMutableDictionary)cachedExecutionErrorsKeyedByActionSetIdentifier;
- (NSMutableDictionary)cachedReadErrorsKeyedByCharacteristicIdentifier;
- (NSMutableDictionary)cachedWriteErrorsKeyedByCharacteristicIdentifier;
- (NSMutableDictionary)testingOverrideLoadingStates;
- (NSMutableSet)characteristicsWithCachedValues;
- (NSMutableSet)mutableAllReadCharacteristics;
- (NSRecursiveLock)transactionLock;
- (NSSet)allReadCharacteristics;
- (NSSet)characteristicsWithPendingReads;
- (NSSet)characteristicsWithPendingWrites;
- (id)_openTransactionCompletionFuture;
- (id)_overrideCachedValueForCharacteristic:(id)a3 value:(id)a4;
- (id)_transactionLock_characteristicsWithPendingWritesInTransacton:(id)a3 includeDirectWrites:(BOOL)a4 includeActionSets:(BOOL)a5 includeActions:(BOOL)a6;
- (id)cachedErrorForExecutionOfActionSet:(id)a3;
- (id)cachedErrorForWriteToCharacteristic:(id)a3;
- (id)cachedReadErrorForCharacteristic:(id)a3;
- (id)cachedValueForCharacteristic:(id)a3;
- (id)executeActionSet:(id)a3;
- (id)executeActions:(id)a3;
- (id)readValueForCharacteristic:(id)a3;
- (id)readValuesForCharacteristicTypes:(id)a3 inServices:(id)a4;
- (id)readValuesForCharacteristics:(id)a3;
- (id)readValuesForCharacteristicsPassingTest:(id)a3 inServices:(id)a4;
- (id)staticHomeDataModelCachedValueForCharacteristic:(id)a3;
- (id)writeNaturalLightEnabledState:(BOOL)a3 forProfile:(id)a4;
- (id)writeValue:(id)a3 forCharacteristic:(id)a4;
- (id)writeValuesForCharacteristics:(id)a3;
- (int64_t)_debug_totalNumberOfIssuedBatchReadRequests;
- (unint64_t)cachedLoadingStateForCharacteristics:(id)a3 actionSets:(id)a4;
- (unint64_t)hash;
- (unint64_t)loadingStateForCharacteristics:(id)a3 actionSets:(id)a4;
- (void)_beginReadsCompleteTrackingForCharacteristics:(id)a3 withLogger:(id)a4;
- (void)_endReadsCompleteTrackingForCharacteristic:(id)a3 withLogger:(id)a4 didRead:(BOOL)a5;
- (void)_transactionLock_executeActionSetTransaction:(id)a3 completionHandler:(id)a4;
- (void)_transactionLock_executeActionsTransaction:(id)a3 completionHandler:(id)a4;
- (void)_transactionLock_executeReadTransaction:(id)a3 completionHandler:(id)a4;
- (void)_transactionLock_executeWriteTransaction:(id)a3 completionHandler:(id)a4;
- (void)beginTransactionWithReason:(id)a3;
- (void)beginTransactionWithReason:(id)a3 readPolicy:(id)a4 logger:(id)a5;
- (void)cancelInFlightReadRequests;
- (void)clearOverrideLoadingStates;
- (void)commitTransactionWithReason:(id)a3;
- (void)executeActionSet:(id)a3 completionHandler:(id)a4;
- (void)fetchNaturalLightColorTemperatureForBrightness:(int64_t)a3 lightProfile:(id)a4 completion:(id)a5;
- (void)invalidateAllCachedErrors;
- (void)invalidateCachedErrorForCharacteristic:(id)a3;
- (void)invalidateCachedErrorForExecutionOfActionSet:(id)a3;
- (void)invalidateCachedValueForCharacteristic:(id)a3;
- (void)invalidateCachedValuesForAccessory:(id)a3;
- (void)setCacheManager:(id)a3;
- (void)setCachedExecutionErrorsKeyedByActionSetIdentifier:(id)a3;
- (void)setCachedReadError:(id)a3 forCharacteristic:(id)a4;
- (void)setCachedReadErrorsKeyedByCharacteristicIdentifier:(id)a3;
- (void)setCachedWriteError:(id)a3 forCharacteristic:(id)a4;
- (void)setCachedWriteErrorsKeyedByCharacteristicIdentifier:(id)a3;
- (void)setCharacteristicsWithCachedValues:(id)a3;
- (void)setCompletionHandlersForReadTransactionsToExecuteOnNextRunLoop:(id)a3;
- (void)setInFlightReadCancelationToken:(id)a3;
- (void)setMutableAllReadCharacteristics:(id)a3;
- (void)setOpenTransaction:(id)a3;
- (void)setOverrideLoadingState:(unint64_t)a3 forCharacteristic:(id)a4;
- (void)setReadTransactionsToExecuteOnNextRunLoop:(id)a3;
- (void)setReadsCompleteLogger:(id)a3;
- (void)setRunningTransactions:(id)a3;
- (void)setTestingOverrideLoadingStates:(id)a3;
- (void)setTransactionLock:(id)a3;
- (void)setValueReader:(id)a3;
- (void)setValueWriter:(id)a3;
- (void)set_debug_totalNumberOfIssuedBatchReadRequests:(int64_t)a3;
@end

@implementation HFCharacteristicValueManager

- (id)cachedValueForCharacteristic:(id)a3
{
  id v4 = a3;
  v5 = [(HFCharacteristicValueManager *)self transactionLock];
  [v5 lock];

  v6 = [(HFCharacteristicValueManager *)self cacheManager];
  v7 = [v6 cachedValueForCharacteristic:v4];

  if (!v7)
  {
    v8 = [(HFCharacteristicValueManager *)self characteristicsWithCachedValues];
    int v9 = [v8 containsObject:v4];

    if (v9)
    {
      v7 = [v4 value];
    }
    else
    {
      v7 = 0;
    }
  }
  uint64_t v10 = [(HFCharacteristicValueManager *)self _overrideCachedValueForCharacteristic:v4 value:v7];
  v11 = (void *)v10;
  if (v10) {
    v12 = (void *)v10;
  }
  else {
    v12 = v7;
  }
  id v13 = v12;

  if (+[HFHomeKitDispatcher synchronizesHomeDataModel])
  {
    v14 = [(HFCharacteristicValueManager *)self staticHomeDataModelCachedValueForCharacteristic:v4];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;

      id v13 = v16;
    }
  }
  v17 = [(HFCharacteristicValueManager *)self transactionLock];
  [v17 unlock];

  return v13;
}

void __80__HFCharacteristicValueManager_cachedLoadingStateForCharacteristics_actionSets___block_invoke_2(uint64_t a1, void *a2, BOOL *a3)
{
  id v5 = a2;
  v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(*(void *)(v7 + 8) + 24);
  if ((v8 & 1) == 0)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__HFCharacteristicValueManager_cachedLoadingStateForCharacteristics_actionSets___block_invoke_3;
    aBlock[3] = &unk_2640903F0;
    id v9 = v5;
    id v15 = v9;
    uint64_t v10 = _Block_copy(aBlock);
    v11 = [*(id *)(a1 + 32) cacheManager];
    LODWORD(v9) = [v11 containsTransactionsReadingCharacteristic:v9 filterBlock:v10];

    if (v9) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 1uLL;
    }

    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(*(void *)(v7 + 8) + 24);
  }
  if ((v8 & 2) == 0)
  {
    v12 = [*(id *)(a1 + 32) cacheManager];
    int v13 = [v12 containsTransactionsWritingCharacteristic:v6];

    uint64_t v7 = *(void *)(a1 + 40);
    if (v13)
    {
      *(void *)(*(void *)(v7 + 8) + 24) |= 2uLL;
      uint64_t v7 = *(void *)(a1 + 40);
    }
  }
  *a3 = (~*(_DWORD *)(*(void *)(v7 + 8) + 24) & 3) == 0;
}

- (HFCharacteristicValueCacheManager)cacheManager
{
  return self->_cacheManager;
}

- (id)cachedReadErrorForCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [(HFCharacteristicValueManager *)self transactionLock];
  [v5 lock];

  v6 = [(HFCharacteristicValueManager *)self cachedReadErrorsKeyedByCharacteristicIdentifier];
  uint64_t v7 = [v4 uniqueIdentifier];

  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  id v9 = [(HFCharacteristicValueManager *)self transactionLock];
  [v9 unlock];

  return v8;
}

- (NSMutableDictionary)cachedReadErrorsKeyedByCharacteristicIdentifier
{
  return self->_cachedReadErrorsKeyedByCharacteristicIdentifier;
}

- (unint64_t)cachedLoadingStateForCharacteristics:(id)a3 actionSets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v8 = [(HFCharacteristicValueManager *)self testingOverrideLoadingStates];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __80__HFCharacteristicValueManager_cachedLoadingStateForCharacteristics_actionSets___block_invoke;
    v16[3] = &unk_2640903C8;
    v16[4] = self;
    v16[5] = &v17;
    objc_msgSend(v6, "na_each:", v16);
  }
  uint64_t v10 = [(HFCharacteristicValueManager *)self transactionLock];
  [v10 lock];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__HFCharacteristicValueManager_cachedLoadingStateForCharacteristics_actionSets___block_invoke_2;
  v15[3] = &unk_264090418;
  v15[4] = self;
  v15[5] = &v17;
  [v6 enumerateObjectsUsingBlock:v15];
  if ((v18[3] & 2) == 0)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __80__HFCharacteristicValueManager_cachedLoadingStateForCharacteristics_actionSets___block_invoke_4;
    v14[3] = &unk_264090440;
    v14[4] = self;
    v14[5] = &v17;
    [v7 enumerateObjectsUsingBlock:v14];
  }
  v11 = [(HFCharacteristicValueManager *)self transactionLock];
  [v11 unlock];

  unint64_t v12 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v12;
}

- (NSRecursiveLock)transactionLock
{
  return self->_transactionLock;
}

- (NSMutableDictionary)testingOverrideLoadingStates
{
  return self->_testingOverrideLoadingStates;
}

- (NSMutableSet)characteristicsWithCachedValues
{
  return self->_characteristicsWithCachedValues;
}

- (id)_overrideCachedValueForCharacteristic:(id)a3 value:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 characteristicType];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F0BF68]];

  v11 = 0;
  if (v8 && v10)
  {
    if ([v8 intValue])
    {
      v11 = 0;
    }
    else
    {
      unint64_t v12 = [v7 service];
      int v13 = [v12 characteristics];
      v14 = objc_msgSend(v13, "na_firstObjectPassingTest:", &__block_literal_global_246);

      if (v14)
      {
        id v15 = [(HFCharacteristicValueManager *)self cachedValueForCharacteristic:v14];
        if (+[HFUtilities hasInternalDiagnostics])
        {
          id v16 = HFLogForCategory(0x39uLL);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = (objc_class *)objc_opt_class();
            v18 = NSStringFromClass(v17);
            uint64_t v19 = NSStringFromSelector(a2);
            uint64_t v20 = [v7 uniqueIdentifier];
            int v21 = [v15 BOOLValue];
            *(_DWORD *)buf = 138413314;
            v22 = @"Off";
            v35 = v18;
            __int16 v36 = 2112;
            if (v21) {
              v22 = @"On";
            }
            v37 = v19;
            __int16 v38 = 2112;
            id v39 = v8;
            __int16 v40 = 2112;
            v41 = v20;
            __int16 v42 = 2112;
            v43 = v22;
            _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@ brightness %@ (%@) associatedPowerCharacteristic powered on: %@", buf, 0x34u);
          }
        }
        if ([v15 BOOLValue])
        {
          v23 = HFLogForCategory(0x39uLL);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = (objc_class *)objc_opt_class();
            v31 = NSStringFromClass(v24);
            v30 = NSStringFromSelector(a2);
            v25 = [v7 uniqueIdentifier];
            v33 = [v7 service];
            v32 = objc_msgSend(v33, "hf_serviceNameComponents");
            v26 = [v32 composedString];
            v27 = [v7 service];
            v28 = [v27 uniqueIdentifier];
            *(_DWORD *)buf = 138413826;
            v35 = v31;
            __int16 v36 = 2112;
            v37 = v30;
            __int16 v38 = 2112;
            id v39 = v25;
            __int16 v40 = 2112;
            v41 = v26;
            __int16 v42 = 2112;
            v43 = v28;
            __int16 v44 = 2112;
            id v45 = v8;
            __int16 v46 = 2112;
            v47 = &unk_26C0F62A0;
            _os_log_impl(&dword_20B986000, v23, OS_LOG_TYPE_DEFAULT, "%@:%@ Overriding cached value for characteristic (%@) in service '%@' (%@) from %@ to %@", buf, 0x48u);
          }
          v11 = &unk_26C0F62A0;
        }
        else
        {
          v11 = 0;
        }
      }
      else
      {
        v11 = 0;
      }
    }
  }

  return v11;
}

- (NSSet)allReadCharacteristics
{
  v3 = [(HFCharacteristicValueManager *)self transactionLock];
  [v3 lock];

  id v4 = [(HFCharacteristicValueManager *)self mutableAllReadCharacteristics];
  id v5 = (void *)[v4 copy];

  id v6 = [(HFCharacteristicValueManager *)self transactionLock];
  [v6 unlock];

  return (NSSet *)v5;
}

- (NSMutableSet)mutableAllReadCharacteristics
{
  return self->_mutableAllReadCharacteristics;
}

- (BOOL)isNaturalLightingSupportedForProfile:(id)a3
{
  id v3 = a3;
  if (+[HFUtilities isRunningInStoreDemoMode]
    || +[HFUtilities isPressDemoModeEnabled])
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    id v5 = [v3 settings];
    BOOL v4 = [v5 supportedFeatures] & 1;
  }
  return v4;
}

- (id)readValuesForCharacteristics:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v17 = [(HFCharacteristicValueManager *)self openTransaction];

  if (!v17) {
    [(HFCharacteristicValueManager *)self beginTransactionWithReason:@"characteristicValueManagerBatchReadTransaction"];
  }
  uint64_t v19 = [MEMORY[0x263EFF9C0] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
    uint64_t v8 = MEMORY[0x263EF8330];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        int v10 = [(HFCharacteristicValueManager *)self readValueForCharacteristic:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        v23[0] = v8;
        v23[1] = 3221225472;
        v23[2] = __61__HFCharacteristicValueManager_readValuesForCharacteristics___block_invoke;
        v23[3] = &unk_2640908A0;
        v23[4] = self;
        v23[5] = a2;
        id v11 = (id)[v10 addFailureBlock:v23];
        [v19 addObject:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  objc_initWeak(&location, self);
  unint64_t v12 = (void *)MEMORY[0x263F58190];
  int v13 = [v19 allObjects];
  v14 = [v12 combineAllFutures:v13];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __61__HFCharacteristicValueManager_readValuesForCharacteristics___block_invoke_2;
  v20[3] = &unk_26408F468;
  objc_copyWeak(&v21, &location);
  id v15 = [v14 flatMap:v20];

  if (!v17) {
    [(HFCharacteristicValueManager *)self commitTransactionWithReason:@"characteristicValueManagerBatchReadTransaction"];
  }
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v15;
}

- (unint64_t)loadingStateForCharacteristics:(id)a3 actionSets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  uint64_t v8 = [(HFCharacteristicValueManager *)self testingOverrideLoadingStates];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __74__HFCharacteristicValueManager_loadingStateForCharacteristics_actionSets___block_invoke;
    v37[3] = &unk_2640903C8;
    v37[4] = self;
    v37[5] = &v38;
    objc_msgSend(v6, "na_each:", v37);
  }
  unint64_t v10 = [(HFCharacteristicValueManager *)self cachedLoadingStateForCharacteristics:v6 actionSets:v7];
  v39[3] |= v10;
  id v11 = [(HFCharacteristicValueManager *)self transactionLock];
  [v11 lock];

  uint64_t v12 = v39[3];
  if ((v12 & 1) == 0)
  {
    int v13 = [(HFCharacteristicValueManager *)self openTransaction];
    v14 = [v13 characteristicsToRead];
    int v15 = [v14 intersectsSet:v6];

    uint64_t v12 = v39[3];
    if (v15)
    {
      v12 |= 1uLL;
      v39[3] = v12;
    }
  }
  if ((v12 & 2) == 0)
  {
    id v16 = [(HFCharacteristicValueManager *)self openTransaction];
    uint64_t v17 = [v16 actionSetsToExecute];
    int v18 = [v17 intersectsSet:v7];

    uint64_t v12 = v39[3];
    if (v18)
    {
      v12 |= 2uLL;
      v39[3] = v12;
    }
  }
  if ((v12 & 2) == 0)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__HFCharacteristicValueManager_loadingStateForCharacteristics_actionSets___block_invoke_2;
    aBlock[3] = &unk_264090468;
    id v36 = v6;
    uint64_t v19 = _Block_copy(aBlock);
    uint64_t v20 = [(HFCharacteristicValueManager *)self openTransaction];
    id v21 = [v20 writeCharacteristicRequests];
    int v22 = objc_msgSend(v21, "na_any:", v19);

    if (v22) {
      v39[3] |= 2uLL;
    }

    uint64_t v12 = v39[3];
  }
  if ((v12 & 2) == 0)
  {
    uint64_t v30 = MEMORY[0x263EF8330];
    uint64_t v31 = 3221225472;
    v32 = __74__HFCharacteristicValueManager_loadingStateForCharacteristics_actionSets___block_invoke_3;
    v33 = &unk_264090490;
    id v34 = v6;
    v23 = _Block_copy(&v30);
    long long v24 = [(HFCharacteristicValueManager *)self openTransaction];
    long long v25 = [v24 actionsToExecute];
    int v26 = objc_msgSend(v25, "na_any:", v23);

    if (v26) {
      v39[3] |= 2uLL;
    }
  }
  if (+[HFHomeKitDispatcher synchronizesHomeDataModel]
    && [(HFCharacteristicValueManager *)self staticHomeDataModelHasInProgressWriteForCharacteristic:v6])
  {
    v39[3] |= 2uLL;
  }
  long long v27 = [(HFCharacteristicValueManager *)self transactionLock];
  [v27 unlock];

  unint64_t v28 = v39[3];
  _Block_object_dispose(&v38, 8);

  return v28;
}

uint64_t __80__HFCharacteristicValueManager_cachedLoadingStateForCharacteristics_actionSets___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 readFuturesKeyedByCharacteristicIdentifier];
  BOOL v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  id v5 = [v3 objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 isFinished] ^ 1;

  return v6;
}

- (id)readValueForCharacteristic:(id)a3
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    v72 = [MEMORY[0x263F08690] currentHandler];
    [v72 handleFailureInMethod:a2, self, @"HFCharacteristicValueManager.m", 375, @"Invalid parameter not satisfying: %@", @"characteristic != nil" object file lineNumber description];
  }
  id v5 = [(HFCharacteristicValueManager *)self transactionLock];
  [v5 lock];

  uint64_t v6 = [v4 uniqueIdentifier];
  id v7 = [(HFCharacteristicValueManager *)self openTransaction];
  uint64_t v8 = [v7 readPolicy];
  id v107 = 0;
  uint64_t v9 = [v8 evaluateWithCharacteristic:v4 traits:&v107];
  id v10 = v107;

  id v11 = [v10 allObjects];
  v83 = [v11 componentsJoinedByString:@", "];

  uint64_t v12 = [(HFCharacteristicValueManager *)self openTransaction];
  if (v12) {
    BOOL v13 = v9 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  int v14 = v13;

  if (!v14) {
    goto LABEL_15;
  }
  int v15 = [(HFCharacteristicValueManager *)self openTransaction];
  id v16 = [v15 logger];
  BOOL v17 = v16 == 0;

  if (v17)
  {
    v74 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      v75 = objc_msgSend(v4, "hf_prettyDescription");
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v83;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v75;
      _os_log_impl(&dword_20B986000, v74, OS_LOG_TYPE_DEBUG, "Skip read (%@): %@", buf, 0x16u);
    }
  }
  else
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    int v18 = [(HFCharacteristicValueManager *)self openTransaction];
    uint64_t v19 = [v18 logger];
    uint64_t v20 = [v19 loggerActivity];
    os_activity_scope_enter(v20, &state);

    id v21 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      int v22 = objc_msgSend(v4, "hf_prettyDescription");
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v83;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v22;
      _os_log_impl(&dword_20B986000, v21, OS_LOG_TYPE_DEBUG, "Skip read (%@): %@", buf, 0x16u);
    }
    os_activity_scope_leave(&state);
  }
  objc_initWeak((id *)buf, self);
  v23 = [(HFCharacteristicValueManager *)self openTransaction];
  long long v24 = [v23 commitFuture];
  v103[0] = MEMORY[0x263EF8330];
  v103[1] = 3221225472;
  v103[2] = __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke;
  v103[3] = &unk_2640904B8;
  objc_copyWeak(&v106, (id *)buf);
  id v104 = v4;
  id v105 = v10;
  long long v25 = [v24 flatMap:v103];

  objc_destroyWeak(&v106);
  objc_destroyWeak((id *)buf);
  if (!v25)
  {
LABEL_15:
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    int v26 = [(HFCharacteristicValueManager *)self runningTransactions];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v99 objects:v108 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v100;
LABEL_17:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v100 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = [*(id *)(*((void *)&v99 + 1) + 8 * v29) readFuturesKeyedByCharacteristicIdentifier];
        uint64_t v31 = [v30 objectForKeyedSubscript:v6];

        if (v31)
        {
          if (([v31 isFinished] & 1) == 0) {
            break;
          }
        }

        if (v27 == ++v29)
        {
          uint64_t v27 = [v26 countByEnumeratingWithState:&v99 objects:v108 count:16];
          if (v27) {
            goto LABEL_17;
          }
          goto LABEL_24;
        }
      }
      v32 = [(HFCharacteristicValueManager *)self openTransaction];
      v33 = [v32 logger];
      BOOL v34 = v33 == 0;

      if (v34)
      {
        v76 = HFLogForCategory(0x39uLL);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
        {
          v77 = objc_msgSend(v4, "hf_prettyDescription");
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v77;
          _os_log_impl(&dword_20B986000, v76, OS_LOG_TYPE_DEBUG, "Duplicate read in other running transaction: %@", buf, 0xCu);
        }
      }
      else
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        v35 = [(HFCharacteristicValueManager *)self openTransaction];
        id v36 = [v35 logger];
        v37 = [v36 loggerActivity];
        os_activity_scope_enter(v37, (os_activity_scope_state_t)buf);

        uint64_t v38 = HFLogForCategory(0x39uLL);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          id v39 = objc_msgSend(v4, "hf_prettyDescription");
          LODWORD(state.opaque[0]) = 138412290;
          *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v39;
          _os_log_impl(&dword_20B986000, v38, OS_LOG_TYPE_DEBUG, "Duplicate read in other running transaction: %@", (uint8_t *)&state, 0xCu);
        }
        os_activity_scope_leave((os_activity_scope_state_t)buf);
      }
      objc_initWeak((id *)buf, self);
      v95[0] = MEMORY[0x263EF8330];
      v95[1] = 3221225472;
      v95[2] = __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke_104;
      v95[3] = &unk_2640904E0;
      objc_copyWeak(&v98, (id *)buf);
      id v96 = v4;
      id v97 = v10;
      long long v25 = [v31 flatMap:v95];

      objc_destroyWeak(&v98);
      objc_destroyWeak((id *)buf);

      if (v25) {
        goto LABEL_45;
      }
    }
    else
    {
LABEL_24:
    }
    uint64_t v40 = [(HFCharacteristicValueManager *)self openTransaction];
    BOOL v41 = v40 == 0;

    if (v41) {
      goto LABEL_40;
    }
    __int16 v42 = [(HFCharacteristicValueManager *)self openTransaction];
    v43 = [v42 readFuturesKeyedByCharacteristicIdentifier];
    id v44 = [v43 objectForKeyedSubscript:v6];

    if (v44)
    {
      id v45 = [v42 characteristicsToRead];
      char v46 = [v45 containsObject:v4];

      if ((v46 & 1) == 0) {
        NSLog(&cfstr_InconsistentSt.isa);
      }
    }
    else
    {
      v47 = [(HFCharacteristicValueManager *)self openTransaction];
      uint64_t v48 = [v47 logger];
      BOOL v49 = v48 == 0;

      if (v49)
      {
        v80 = HFLogForCategory(0x39uLL);
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          v81 = objc_msgSend(v4, "hf_prettyDescription");
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v83;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v81;
          _os_log_impl(&dword_20B986000, v80, OS_LOG_TYPE_DEBUG, "New read request (%@): %@", buf, 0x16u);
        }
      }
      else
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        v50 = [(HFCharacteristicValueManager *)self openTransaction];
        v51 = [v50 logger];
        v52 = [v51 loggerActivity];
        os_activity_scope_enter(v52, &state);

        v53 = HFLogForCategory(0x39uLL);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          v54 = objc_msgSend(v4, "hf_prettyDescription");
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v83;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v54;
          _os_log_impl(&dword_20B986000, v53, OS_LOG_TYPE_DEBUG, "New read request (%@): %@", buf, 0x16u);
        }
        os_activity_scope_leave(&state);
      }
      id v44 = objc_alloc_init(MEMORY[0x263F58190]);
      v55 = [v42 readFuturesKeyedByCharacteristicIdentifier];
      [v55 setObject:v44 forKeyedSubscript:v6];
    }
    v56 = [v42 characteristicsToRead];
    [v56 addObject:v4];

    objc_initWeak((id *)buf, self);
    v91[0] = MEMORY[0x263EF8330];
    v91[1] = 3221225472;
    v91[2] = __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke_109;
    v91[3] = &unk_2640904E0;
    objc_copyWeak(&v94, (id *)buf);
    id v92 = v4;
    id v93 = v10;
    long long v25 = [v44 flatMap:v91];

    objc_destroyWeak(&v94);
    objc_destroyWeak((id *)buf);

    if (!v25)
    {
LABEL_40:
      [(HFCharacteristicValueManager *)self beginTransactionWithReason:@"characteristicValueManagerImplicitTransaction"];
      v57 = [(HFCharacteristicValueManager *)self openTransaction];
      v58 = [v57 logger];
      BOOL v59 = v58 == 0;

      if (v59)
      {
        v78 = HFLogForCategory(0x39uLL);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
        {
          v79 = objc_msgSend(v4, "hf_prettyDescription");
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v83;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v79;
          _os_log_impl(&dword_20B986000, v78, OS_LOG_TYPE_DEBUG, "Read request for implicit transaction (%@): %@", buf, 0x16u);
        }
      }
      else
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        v60 = [v57 logger];
        v61 = [v60 loggerActivity];
        os_activity_scope_enter(v61, &state);

        v62 = HFLogForCategory(0x39uLL);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          v63 = objc_msgSend(v4, "hf_prettyDescription");
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v83;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v63;
          _os_log_impl(&dword_20B986000, v62, OS_LOG_TYPE_DEBUG, "Read request for implicit transaction (%@): %@", buf, 0x16u);
        }
        os_activity_scope_leave(&state);
      }
      id v64 = objc_alloc_init(MEMORY[0x263F58190]);
      v65 = [v57 readFuturesKeyedByCharacteristicIdentifier];
      [v65 setObject:v64 forKeyedSubscript:v6];

      v66 = [v57 characteristicsToRead];
      [v66 addObject:v4];

      objc_initWeak((id *)buf, self);
      v87[0] = MEMORY[0x263EF8330];
      v87[1] = 3221225472;
      v87[2] = __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke_110;
      v87[3] = &unk_2640904E0;
      objc_copyWeak(&v90, (id *)buf);
      id v88 = v4;
      id v89 = v10;
      long long v25 = [v64 flatMap:v87];
      [(HFCharacteristicValueManager *)self commitTransactionWithReason:@"characteristicValueManagerImplicitTransaction"];

      objc_destroyWeak(&v90);
      objc_destroyWeak((id *)buf);
    }
  }
LABEL_45:
  v67 = [(HFCharacteristicValueManager *)self transactionLock];
  [v67 unlock];

  if (!v25)
  {
    v73 = [MEMORY[0x263F08690] currentHandler];
    [v73 handleFailureInMethod:a2 object:self file:@"HFCharacteristicValueManager.m" lineNumber:481 description:@"None of our cases were able to create a future for this request"];
  }
  v84[0] = MEMORY[0x263EF8330];
  v84[1] = 3221225472;
  v84[2] = __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke_2;
  v84[3] = &unk_264090508;
  v84[4] = self;
  id v85 = v4;
  id v86 = v10;
  id v68 = v10;
  id v69 = v4;
  v70 = [v25 recover:v84];

  return v70;
}

- (HFCharacteristicValueTransaction)openTransaction
{
  return self->_openTransaction;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_234 != -1) {
    dispatch_once(&_MergedGlobals_234, &__block_literal_global_243);
  }
  v2 = (void *)qword_26AB2EEC8;
  return (NAIdentity *)v2;
}

uint64_t __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_2_204(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F0E268] readRequestWithCharacteristic:a2];
}

- (BOOL)hasCachedReadErrorForAccessory:(id)a3 passingTest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HFCharacteristicValueManager *)self transactionLock];
  [v8 lock];

  uint64_t v9 = [v7 services];

  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  int v15 = __75__HFCharacteristicValueManager_hasCachedReadErrorForAccessory_passingTest___block_invoke;
  id v16 = &unk_264090850;
  BOOL v17 = self;
  id v18 = v6;
  id v10 = v6;
  LOBYTE(v6) = objc_msgSend(v9, "na_any:", &v13);

  id v11 = [(HFCharacteristicValueManager *)self transactionLock];
  [v11 unlock];

  return (char)v6;
}

uint64_t __75__HFCharacteristicValueManager_hasCachedReadErrorForAccessory_passingTest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) cachedReadErrorsKeyedByCharacteristicIdentifier];
  id v5 = [v3 uniqueIdentifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    if (*(void *)(a1 + 40))
    {
      id v7 = [*(id *)(a1 + 32) transactionLock];
      [v7 unlock];

      uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
      uint64_t v9 = [*(id *)(a1 + 32) transactionLock];
      [v9 lock];
    }
    else
    {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id __61__HFCharacteristicValueManager_readValuesForCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [HFCharacteristicBatchReadResponse alloc];
  id v5 = [MEMORY[0x263EFFA08] setWithArray:v3];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained contextProvider];
  uint64_t v8 = [(HFCharacteristicBatchReadResponse *)v4 initWithReadResponses:v5 contextProvider:v7];

  uint64_t v9 = [MEMORY[0x263F58190] futureWithResult:v8];

  return v9;
}

id __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unint64_t v4 = [WeakRetained cachedValueForCharacteristic:*(void *)(a1 + 32)];
  id v5 = objc_loadWeakRetained(v2);
  id v6 = [v5 cachedReadErrorForCharacteristic:*(void *)(a1 + 32)];

  if (!v6)
  {
    id v6 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 4);
  }
  id v7 = [[HFCharacteristicReadResponse alloc] initWithCharacteristic:*(void *)(a1 + 32) readTraits:*(void *)(a1 + 40) value:v4 error:v6];
  uint64_t v8 = [MEMORY[0x263F58190] futureWithResult:v7];

  return v8;
}

- (HFCharacteristicOperationContextProviding)contextProvider
{
  v2 = [(HFCharacteristicValueManager *)self valueReader];
  id v3 = objc_msgSend(v2, "hf_home");

  return (HFCharacteristicOperationContextProviding *)v3;
}

- (HFCharacteristicValueReader)valueReader
{
  return self->_valueReader;
}

- (void)beginTransactionWithReason:(id)a3 readPolicy:(id)a4 logger:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = (HFUpdateLogger *)a5;
  if (!v9)
  {
    BOOL v41 = [MEMORY[0x263F08690] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"HFCharacteristicValueManager.m", 349, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  uint64_t v12 = [(HFCharacteristicValueManager *)self transactionLock];
  [v12 lock];

  uint64_t v13 = [(HFCharacteristicValueManager *)self openTransaction];

  if (!v13)
  {
    long long v24 = objc_alloc_init(HFCharacteristicValueTransaction);
    [(HFCharacteristicValueManager *)self setOpenTransaction:v24];

    if (v11)
    {
      long long v25 = [(HFCharacteristicValueManager *)self openTransaction];
      int v26 = v25;
      uint64_t v27 = 1;
    }
    else
    {
      id v11 = [[HFUpdateLogger alloc] initWithTimeout:v9 description:15.0];
      long long v25 = [(HFCharacteristicValueManager *)self openTransaction];
      int v26 = v25;
      uint64_t v27 = 0;
    }
    [v25 setLoggerIsExternal:v27];

    uint64_t v28 = [(HFCharacteristicValueManager *)self openTransaction];
    [v28 setLogger:v11];

    uint64_t v29 = [(HFCharacteristicValueManager *)self openTransaction];
    uint64_t v30 = [v29 logger];

    if (v30)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      uint64_t v31 = [(HFCharacteristicValueManager *)self openTransaction];
      v32 = [v31 logger];
      v33 = [v32 loggerActivity];
      os_activity_scope_enter(v33, &state);

      BOOL v34 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v9;
        _os_log_impl(&dword_20B986000, v34, OS_LOG_TYPE_DEFAULT, "----- OPEN TRANSACTION (%@) -----", buf, 0xCu);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      v43 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v9;
        _os_log_impl(&dword_20B986000, v43, OS_LOG_TYPE_DEFAULT, "----- OPEN TRANSACTION (%@) -----", (uint8_t *)&state, 0xCu);
      }
    }
    v23 = [(HFCharacteristicValueManager *)self openTransaction];
    v35 = [v23 onFinishGroup];
    dispatch_group_enter(v35);

    goto LABEL_18;
  }
  uint64_t v14 = [(HFCharacteristicValueManager *)self openTransaction];
  int v15 = [v14 logger];

  if (v15)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    id v16 = [(HFCharacteristicValueManager *)self openTransaction];
    BOOL v17 = [v16 logger];
    id v18 = [v17 loggerActivity];
    os_activity_scope_enter(v18, &state);

    uint64_t v19 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v9;
      _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "Nest transaction (%@)", buf, 0xCu);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    __int16 v42 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v9;
      _os_log_impl(&dword_20B986000, v42, OS_LOG_TYPE_DEFAULT, "Nest transaction (%@)", (uint8_t *)&state, 0xCu);
    }
  }
  uint64_t v20 = [(HFCharacteristicValueManager *)self openTransaction];
  id v21 = [v20 clientReasonsStack];
  int v22 = [v21 containsObject:v9];

  if (v22)
  {
    v23 = [(HFCharacteristicValueManager *)self openTransaction];
    NSLog(&cfstr_TheOpenTransac.isa, v23, v9);
LABEL_18:
  }
  id v36 = [(HFCharacteristicValueManager *)self openTransaction];
  v37 = [v36 readPolicy];
  [v37 pushPolicy:v10];

  uint64_t v38 = [(HFCharacteristicValueManager *)self openTransaction];
  id v39 = [v38 clientReasonsStack];
  [v39 addObject:v9];

  uint64_t v40 = [(HFCharacteristicValueManager *)self transactionLock];
  [v40 unlock];
}

- (void)setOpenTransaction:(id)a3
{
}

- (void)commitTransactionWithReason:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v40 = [MEMORY[0x263F08690] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"HFCharacteristicValueManager.m", 828, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  id v6 = [(HFCharacteristicValueManager *)self transactionLock];
  [v6 lock];

  id v7 = [(HFCharacteristicValueManager *)self openTransaction];
  if (!v7)
  {
    BOOL v41 = [MEMORY[0x263F08690] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"HFCharacteristicValueManager.m", 833, @"Invalid parameter not satisfying: %@", @"transaction" object file lineNumber description];
  }
  uint64_t v8 = [v7 clientReasonsStack];
  char v9 = [v8 containsObject:v5];

  if ((v9 & 1) == 0)
  {
    __int16 v42 = [MEMORY[0x263F08690] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"HFCharacteristicValueManager.m", 834, @"Attempt to commit transaction with unknown reason (not used in a call to -beginTransaction...): %@", v5 object file lineNumber description];
  }
  id v10 = [v7 clientReasonsStack];
  id v11 = [v10 lastObject];
  char v12 = [v11 isEqual:v5];

  if ((v12 & 1) == 0)
  {
    v43 = [MEMORY[0x263F08690] currentHandler];
    id v44 = [v7 clientReasonsStack];
    id v45 = [v44 lastObject];
    [v43 handleFailureInMethod:a2, self, @"HFCharacteristicValueManager.m", 835, @"Attempt to commit transactions with out-of-order reasons. The last call to -beginTransaction had a reason of %@, but the client attempted to commit the transaction with a reason (%@) that is further down the stack (i.e., begin(A) -> begin(B) -> commit(A).)", v45, v5 object file lineNumber description];
  }
  uint64_t v13 = [v7 clientReasonsStack];
  [v13 removeLastObject];

  uint64_t v14 = [v7 readPolicy];
  id v15 = (id)[v14 popPolicy];

  id v16 = [v7 clientReasonsStack];
  BOOL v17 = [v16 count] == 0;

  id v18 = [v7 logger];

  if (v17)
  {
    if (v18)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      long long v24 = [v7 logger];
      long long v25 = [v24 loggerActivity];
      os_activity_scope_enter(v25, (os_activity_scope_state_t)buf);

      int v26 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v5;
        _os_log_impl(&dword_20B986000, v26, OS_LOG_TYPE_DEFAULT, "----- COMMIT TRANSACTION (%@) -----", (uint8_t *)&state, 0xCu);
      }

      os_activity_scope_leave((os_activity_scope_state_t)buf);
    }
    else
    {
      uint64_t v48 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v5;
        _os_log_impl(&dword_20B986000, v48, OS_LOG_TYPE_DEFAULT, "----- COMMIT TRANSACTION (%@) -----", buf, 0xCu);
      }
    }
    uint64_t v27 = [(HFCharacteristicValueManager *)self runningTransactions];
    [v27 addObject:v7];

    uint64_t v28 = [(HFCharacteristicValueManager *)self cacheManager];
    [v28 transactionAdded:v7];

    [(HFCharacteristicValueManager *)self setOpenTransaction:0];
    v23 = [v7 commitFuture];
    uint64_t v29 = dispatch_group_create();
    objc_initWeak((id *)buf, self);
    dispatch_group_enter(v29);
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke;
    v64[3] = &unk_2640905E0;
    objc_copyWeak(&v67, (id *)buf);
    id v30 = v7;
    id v65 = v30;
    uint64_t v31 = v29;
    v66 = v31;
    [(HFCharacteristicValueManager *)self _transactionLock_executeWriteTransaction:v30 completionHandler:v64];
    dispatch_group_enter(v31);
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke_158;
    v60[3] = &unk_2640905E0;
    objc_copyWeak(&v63, (id *)buf);
    id v32 = v30;
    id v61 = v32;
    v33 = v31;
    v62 = v33;
    [(HFCharacteristicValueManager *)self _transactionLock_executeActionSetTransaction:v32 completionHandler:v60];
    dispatch_group_enter(v33);
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke_159;
    v56[3] = &unk_2640905E0;
    objc_copyWeak(&v59, (id *)buf);
    id v34 = v32;
    id v57 = v34;
    v35 = v33;
    v58 = v35;
    [(HFCharacteristicValueManager *)self _transactionLock_executeActionsTransaction:v34 completionHandler:v56];
    dispatch_group_enter(v35);
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke_160;
    v52[3] = &unk_2640905E0;
    objc_copyWeak(&v55, (id *)buf);
    id v36 = v34;
    id v53 = v36;
    v37 = v35;
    v54 = v37;
    [(HFCharacteristicValueManager *)self _transactionLock_executeReadTransaction:v36 completionHandler:v52];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke_161;
    block[3] = &unk_26408DB10;
    objc_copyWeak(&v51, (id *)buf);
    id v50 = v36;
    dispatch_group_notify(v37, MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v51);
    objc_destroyWeak(&v55);

    objc_destroyWeak(&v59);
    objc_destroyWeak(&v63);

    objc_destroyWeak(&v67);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v18)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      uint64_t v19 = [v7 logger];
      uint64_t v20 = [v19 loggerActivity];
      os_activity_scope_enter(v20, &state);

      id v21 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = [v7 clientReasonsStack];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v22;
        _os_log_impl(&dword_20B986000, v21, OS_LOG_TYPE_DEFAULT, "Commit nested transaction (%@). Remaining: %@", buf, 0x16u);
      }
      os_activity_scope_leave(&state);
    }
    else
    {
      char v46 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v47 = [v7 clientReasonsStack];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v47;
        _os_log_impl(&dword_20B986000, v46, OS_LOG_TYPE_DEFAULT, "Commit nested transaction (%@). Remaining: %@", buf, 0x16u);
      }
    }
    v23 = 0;
  }

  uint64_t v38 = [(HFCharacteristicValueManager *)self transactionLock];
  [v38 unlock];

  id v39 = NAEmptyResult();
  [v23 finishWithResult:v39];
}

void __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke_161(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained transactionLock];
  [v3 lock];

  unint64_t v4 = [*(id *)(a1 + 32) logger];

  if (v4)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    id v5 = [*(id *)(a1 + 32) logger];
    id v6 = [v5 loggerActivity];
    os_activity_scope_enter(v6, &state);

    id v7 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [WeakRetained runningTransactions];
      v19[0] = 67109120;
      v19[1] = [v8 count] - 1;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "All executions complete. Cleaning up. Remaining running transactions: %d", (uint8_t *)v19, 8u);
    }
    os_activity_scope_leave(&state);
  }
  else
  {
    BOOL v17 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [WeakRetained runningTransactions];
      LODWORD(state.opaque[0]) = 67109120;
      HIDWORD(state.opaque[0]) = [v18 count] - 1;
      _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "All executions complete. Cleaning up. Remaining running transactions: %d", (uint8_t *)&state, 8u);
    }
  }
  char v9 = [WeakRetained runningTransactions];
  [v9 removeObject:*(void *)(a1 + 32)];

  id v10 = [WeakRetained cacheManager];
  [v10 transactionRemoved:*(void *)(a1 + 32)];

  id v11 = [*(id *)(a1 + 32) onFinishGroup];
  char v12 = [WeakRetained runningTransactions];
  uint64_t v13 = [v12 count];

  if (!v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x263F58168]);
    [WeakRetained setInFlightReadCancelationToken:v14];
  }
  if (([*(id *)(a1 + 32) loggerIsExternal] & 1) == 0)
  {
    id v15 = [*(id *)(a1 + 32) logger];
    [v15 finish];
  }
  id v16 = [WeakRetained transactionLock];
  [v16 unlock];

  dispatch_group_leave(v11);
}

- (NSMutableArray)runningTransactions
{
  return self->_runningTransactions;
}

- (void)_transactionLock_executeWriteTransaction:(id)a3 completionHandler:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (!v6) {
    NSLog(&cfstr_NilTransaction.isa);
  }
  uint64_t v8 = [v6 writeCharacteristicRequests];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    objc_initWeak(&location, self);
    id v10 = [v6 logger];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      id v36 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = [(HFCharacteristicValueManager *)self valueWriter];
        uint64_t v38 = [v6 writeCharacteristicRequests];
        id v39 = objc_msgSend(v38, "hf_prettyDescription");
        *(_DWORD *)buf = 138412546;
        v56 = v37;
        __int16 v57 = 2112;
        v58 = v39;
        _os_log_impl(&dword_20B986000, v36, OS_LOG_TYPE_DEFAULT, "Start executing write with writer:%@. Characteristic requests:%@", buf, 0x16u);
      }
    }
    else
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      char v12 = [v6 logger];
      uint64_t v13 = [v12 loggerActivity];
      os_activity_scope_enter(v13, &state);

      id v14 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [(HFCharacteristicValueManager *)self valueWriter];
        id v16 = [v6 writeCharacteristicRequests];
        BOOL v17 = objc_msgSend(v16, "hf_prettyDescription");
        *(_DWORD *)buf = 138412546;
        v56 = v15;
        __int16 v57 = 2112;
        v58 = v17;
        _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Start executing write with writer:%@. Characteristic requests:%@", buf, 0x16u);
      }
      os_activity_scope_leave(&state);
    }
    id v18 = [(HFCharacteristicValueManager *)self transactionLock];
    [v18 lock];

    uint64_t v19 = [v6 writeCharacteristicRequests];
    uint64_t v20 = (void *)[v19 copy];

    uint64_t v21 = objc_msgSend(v20, "na_map:", &__block_literal_global_170);
    int v22 = [(HFCharacteristicValueManager *)self transactionLock];
    [v22 unlock];

    v23 = [(HFCharacteristicValueManager *)self valueWriter];
    long long v24 = objc_msgSend(v23, "hf_home");

    if (v24)
    {
      long long v25 = +[HFHomeKitDispatcher sharedDispatcher];
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_2;
      v50[3] = &unk_26408D8F0;
      id v51 = v24;
      id v52 = v21;
      [v25 dispatchHomeObserverMessage:v50 sender:0];
    }
    int v26 = (void *)MEMORY[0x263F0E250];
    uint64_t v27 = [v20 allObjects];
    uint64_t v28 = [v26 characteristicBatchRequestWithWriteRequests:v27];

    uint64_t v29 = [MEMORY[0x263EFF980] array];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_3;
    v47[3] = &unk_264090628;
    id v30 = v6;
    id v48 = v30;
    id v31 = v29;
    id v49 = v31;
    [v28 setProgressHandler:v47];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_176;
    v40[3] = &unk_2640906A0;
    objc_copyWeak(&v46, &location);
    id v41 = v30;
    id v32 = v31;
    id v42 = v32;
    id v33 = v20;
    id v43 = v33;
    id v34 = v24;
    id v44 = v34;
    id v45 = v7;
    [v28 setCompletionHandler:v40];
    v35 = [(HFCharacteristicValueManager *)self valueWriter];
    [v35 performBatchCharacteristicRequest:v28];

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

void __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained transactionLock];
  [v3 lock];

  unint64_t v4 = [*(id *)(a1 + 32) writeCharacteristicRequests];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) logger];

    if (v6)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      id v7 = [*(id *)(a1 + 32) logger];
      uint64_t v8 = [v7 loggerActivity];
      os_activity_scope_enter(v8, &state);

      uint64_t v9 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v12 = 0;
        _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Finished write execution", v12, 2u);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      BOOL v11 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(state.opaque[0]) = 0;
        _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Finished write execution", (uint8_t *)&state, 2u);
      }
    }
  }
  id v10 = [WeakRetained transactionLock];
  [v10 unlock];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_transactionLock_executeReadTransaction:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(void))a4;
  if (!v7) {
    NSLog(&cfstr_NilTransaction_0.isa);
  }
  uint64_t v9 = [v7 characteristicsToRead];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    BOOL v11 = [(HFCharacteristicValueManager *)self transactionLock];
    [v11 lock];

    char v12 = [(HFCharacteristicValueManager *)self readTransactionsToExecuteOnNextRunLoop];
    [v12 addObject:v7];

    uint64_t v13 = [(HFCharacteristicValueManager *)self completionHandlersForReadTransactionsToExecuteOnNextRunLoop];
    id v14 = (void *)[v8 copy];
    [v13 addObject:v14];

    id v15 = [(HFCharacteristicValueManager *)self readTransactionsToExecuteOnNextRunLoop];
    unint64_t v16 = [v15 count];

    BOOL v17 = [(HFCharacteristicValueManager *)self transactionLock];
    [v17 unlock];

    if (v16 <= 1)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke;
      block[3] = &unk_26408D8A0;
      void block[4] = self;
      SEL v20 = a2;
      id v19 = v7;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

void __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke_160(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained transactionLock];
  [v3 lock];

  unint64_t v4 = [*(id *)(a1 + 32) characteristicsToRead];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) logger];

    if (v6)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      id v7 = [*(id *)(a1 + 32) logger];
      uint64_t v8 = [v7 loggerActivity];
      os_activity_scope_enter(v8, &state);

      uint64_t v9 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v12 = 0;
        _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Finished read execution", v12, 2u);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      BOOL v11 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(state.opaque[0]) = 0;
        _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Finished read execution", (uint8_t *)&state, 2u);
      }
    }
  }
  uint64_t v10 = [WeakRetained transactionLock];
  [v10 unlock];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_transactionLock_executeActionsTransaction:(id)a3 completionHandler:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (!v6) {
    NSLog(&cfstr_NilTransaction_0.isa);
  }
  uint64_t v8 = [v6 actionsToExecute];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    objc_initWeak(&location, self);
    uint64_t v10 = [v6 logger];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      id v33 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = [(HFCharacteristicValueManager *)self valueWriter];
        v35 = [v6 actionsToExecute];
        id v36 = objc_msgSend(v35, "hf_prettyDescription");
        *(_DWORD *)buf = 138412546;
        id v50 = v34;
        __int16 v51 = 2112;
        id v52 = v36;
        _os_log_impl(&dword_20B986000, v33, OS_LOG_TYPE_DEFAULT, "Start executing actions with writer:%@. Action sets:%@", buf, 0x16u);
      }
    }
    else
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      char v12 = [v6 logger];
      uint64_t v13 = [v12 loggerActivity];
      os_activity_scope_enter(v13, &state);

      id v14 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [(HFCharacteristicValueManager *)self valueWriter];
        unint64_t v16 = [v6 actionsToExecute];
        BOOL v17 = objc_msgSend(v16, "hf_prettyDescription");
        *(_DWORD *)buf = 138412546;
        id v50 = v15;
        __int16 v51 = 2112;
        id v52 = v17;
        _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Start executing actions with writer:%@. Action sets:%@", buf, 0x16u);
      }
      os_activity_scope_leave(&state);
    }
    id v18 = [(HFCharacteristicValueManager *)self transactionLock];
    [v18 lock];

    id v19 = [(HFCharacteristicValueManager *)self _transactionLock_characteristicsWithPendingWritesInTransacton:v6 includeDirectWrites:0 includeActionSets:0 includeActions:1];
    SEL v20 = [(HFCharacteristicValueManager *)self transactionLock];
    [v20 unlock];

    uint64_t v21 = [(HFCharacteristicValueManager *)self valueWriter];
    int v22 = objc_msgSend(v21, "hf_home");

    if (v22)
    {
      v23 = +[HFHomeKitDispatcher sharedDispatcher];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __93__HFCharacteristicValueManager__transactionLock_executeActionsTransaction_completionHandler___block_invoke;
      v44[3] = &unk_26408D8F0;
      id v24 = v22;
      id v45 = v24;
      id v25 = v19;
      id v46 = v25;
      [v23 dispatchHomeObserverMessage:v44 sender:0];

      int v26 = [v6 actionsToExecute];
      uint64_t v27 = (void *)[v26 copy];

      uint64_t v28 = [(HFCharacteristicValueManager *)self valueWriter];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __93__HFCharacteristicValueManager__transactionLock_executeActionsTransaction_completionHandler___block_invoke_2;
      v37[3] = &unk_2640906A0;
      objc_copyWeak(&v43, &location);
      id v38 = v6;
      id v29 = v27;
      id v39 = v29;
      id v40 = v24;
      id v41 = v25;
      id v42 = v7;
      [v28 executeActions:v29 completionHandler:v37];

      objc_destroyWeak(&v43);
    }
    else
    {
      id v30 = [(HFCharacteristicValueManager *)self transactionLock];
      [v30 lock];

      id v31 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
      [v6 setActionsError:v31];

      id v32 = [(HFCharacteristicValueManager *)self transactionLock];
      [v32 unlock];

      if (v7) {
        v7[2](v7);
      }
    }

    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

void __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke_159(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained transactionLock];
  [v3 lock];

  unint64_t v4 = [*(id *)(a1 + 32) actionsToExecute];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) logger];

    if (v6)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      id v7 = [*(id *)(a1 + 32) logger];
      uint64_t v8 = [v7 loggerActivity];
      os_activity_scope_enter(v8, &state);

      uint64_t v9 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v12 = 0;
        _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Finished all action executions", v12, 2u);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      BOOL v11 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(state.opaque[0]) = 0;
        _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Finished all action executions", (uint8_t *)&state, 2u);
      }
    }
  }
  uint64_t v10 = [WeakRetained transactionLock];
  [v10 unlock];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_transactionLock_executeActionSetTransaction:(id)a3 completionHandler:(id)a4
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v44 = (void (**)(void))a4;
  if (!v5) {
    NSLog(&cfstr_NilTransaction_0.isa);
  }
  id v50 = v5;
  id v6 = [v5 actionSetsToExecute];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    objc_initWeak(&location, self);
    uint64_t v8 = [v50 logger];
    BOOL v9 = v8 == 0;

    if (v9)
    {
      id v38 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        id v39 = [(HFCharacteristicValueManager *)self valueWriter];
        id v40 = [v50 actionSetsToExecute];
        id v41 = objc_msgSend(v40, "hf_prettyDescription");
        *(_DWORD *)buf = 138412546;
        id v86 = v39;
        __int16 v87 = 2112;
        id v88 = v41;
        _os_log_impl(&dword_20B986000, v38, OS_LOG_TYPE_DEFAULT, "Start executing action sets with writer:%@. Action sets:%@", buf, 0x16u);
      }
    }
    else
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      uint64_t v10 = [v50 logger];
      BOOL v11 = [v10 loggerActivity];
      os_activity_scope_enter(v11, &state);

      char v12 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [(HFCharacteristicValueManager *)self valueWriter];
        id v14 = [v50 actionSetsToExecute];
        id v15 = objc_msgSend(v14, "hf_prettyDescription");
        *(_DWORD *)buf = 138412546;
        id v86 = v13;
        __int16 v87 = 2112;
        id v88 = v15;
        _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Start executing action sets with writer:%@. Action sets:%@", buf, 0x16u);
      }
      os_activity_scope_leave(&state);
    }
    unint64_t v16 = [(HFCharacteristicValueManager *)self transactionLock];
    [v16 lock];

    id v42 = [(HFCharacteristicValueManager *)self _transactionLock_characteristicsWithPendingWritesInTransacton:v50 includeDirectWrites:0 includeActionSets:1 includeActions:0];
    BOOL v17 = [(HFCharacteristicValueManager *)self transactionLock];
    [v17 unlock];

    id v18 = [(HFCharacteristicValueManager *)self valueWriter];
    id v43 = objc_msgSend(v18, "hf_home");

    if (v43)
    {
      id v19 = +[HFHomeKitDispatcher sharedDispatcher];
      v79[0] = MEMORY[0x263EF8330];
      v79[1] = 3221225472;
      v79[2] = __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke;
      v79[3] = &unk_26408D8F0;
      id v20 = v43;
      id v80 = v20;
      id v81 = v50;
      [v19 dispatchHomeObserverMessage:v79 sender:0];

      uint64_t v21 = +[HFHomeKitDispatcher sharedDispatcher];
      v76[0] = MEMORY[0x263EF8330];
      v76[1] = 3221225472;
      v76[2] = __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_2;
      v76[3] = &unk_26408D8F0;
      id v77 = v20;
      id v78 = v42;
      [v21 dispatchHomeObserverMessage:v76 sender:0];
    }
    int v22 = dispatch_group_create();
    id v48 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v47 = [MEMORY[0x263EFF9C0] set];
    id v46 = [MEMORY[0x263EFF9C0] set];
    v23 = [MEMORY[0x263EFF9C0] set];
    id v24 = [MEMORY[0x263EFF9C0] set];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v25 = [v50 actionSetsToExecute];
    id obj = (id)[v25 copy];

    uint64_t v26 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v73;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v73 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void *)(*((void *)&v72 + 1) + 8 * v28);
          dispatch_group_enter(v22);
          id v30 = [(HFCharacteristicValueManager *)self valueWriter];
          v62[0] = MEMORY[0x263EF8330];
          v62[1] = 3221225472;
          v62[2] = __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_3;
          v62[3] = &unk_2640907D8;
          objc_copyWeak(&v71, &location);
          id v63 = v50;
          uint64_t v64 = v29;
          id v65 = v48;
          id v66 = v46;
          id v67 = v24;
          id v68 = v47;
          id v69 = v23;
          uint64_t v70 = v22;
          [v30 executeActionSet:v29 completionHandler:v62];

          objc_destroyWeak(&v71);
          ++v28;
        }
        while (v26 != v28);
        uint64_t v26 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
      }
      while (v26);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_225;
    block[3] = &unk_264090800;
    objc_copyWeak(&v61, &location);
    id v52 = v50;
    id v53 = v48;
    v54 = self;
    id v55 = v23;
    id v56 = v43;
    id v57 = v24;
    id v58 = v47;
    id v59 = v46;
    v60 = v44;
    id v31 = v46;
    id v32 = v47;
    id v33 = v24;
    id v34 = v43;
    id v35 = v23;
    id v36 = v48;
    dispatch_group_notify(v22, MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v61);
    objc_destroyWeak(&location);
    v37 = v44;
  }
  else
  {
    v37 = v44;
    if (v44) {
      v44[2](v44);
    }
  }
}

void __60__HFCharacteristicValueManager_commitTransactionWithReason___block_invoke_158(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained transactionLock];
  [v3 lock];

  unint64_t v4 = [*(id *)(a1 + 32) actionSetsToExecute];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) logger];

    if (v6)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      uint64_t v7 = [*(id *)(a1 + 32) logger];
      uint64_t v8 = [v7 loggerActivity];
      os_activity_scope_enter(v8, &state);

      BOOL v9 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v12 = 0;
        _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Finished all action set executions", v12, 2u);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      BOOL v11 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(state.opaque[0]) = 0;
        _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Finished all action set executions", (uint8_t *)&state, 2u);
      }
    }
  }
  uint64_t v10 = [WeakRetained transactionLock];
  [v10 unlock];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (NSMutableArray)readTransactionsToExecuteOnNextRunLoop
{
  return self->_readTransactionsToExecuteOnNextRunLoop;
}

- (void)setInFlightReadCancelationToken:(id)a3
{
}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "set_debug_totalNumberOfIssuedBatchReadRequests:", objc_msgSend(*(id *)(a1 + 32), "_debug_totalNumberOfIssuedBatchReadRequests") + 1);
  id v3 = [*v2 transactionLock];
  [v3 lock];

  unint64_t v4 = [*v2 readTransactionsToExecuteOnNextRunLoop];
  uint64_t v5 = (void *)[v4 copy];

  id v6 = [*v2 completionHandlersForReadTransactionsToExecuteOnNextRunLoop];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [*v2 readTransactionsToExecuteOnNextRunLoop];
  [v8 removeAllObjects];

  BOOL v9 = [*v2 completionHandlersForReadTransactionsToExecuteOnNextRunLoop];
  [v9 removeAllObjects];

  if (![v5 count])
  {
    id v40 = [MEMORY[0x263F08690] currentHandler];
    [v40 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"HFCharacteristicValueManager.m" lineNumber:1125 description:@"Inconsistant state: readTransactionsToExecute should always be non-empty on the next run loop"];
  }
  uint64_t v10 = [v5 firstObject];
  BOOL v11 = [v10 logger];

  char v12 = [MEMORY[0x263EFFA08] setWithArray:v5];
  uint64_t v13 = objc_msgSend(v12, "na_map:", &__block_literal_global_199);
  id v14 = objc_msgSend(v13, "na_setByFlattening");

  id v15 = [*(id *)(a1 + 32) transactionLock];
  [v15 unlock];

  if (+[HFCharacteristicValueManager _shouldTrackReadsCompleteForPerformanceTesting])
  {
    unint64_t v16 = *(void **)(a1 + 32);
    BOOL v17 = [*(id *)(a1 + 40) logger];
    [v16 _beginReadsCompleteTrackingForCharacteristics:v14 withLogger:v17];
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (v11)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    id v18 = [v11 loggerActivity];
    os_activity_scope_enter(v18, &state);

    id v19 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [*(id *)(a1 + 32) valueReader];
      uint64_t v21 = objc_msgSend(v14, "hf_prettyDescription");
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "Start executing read with reader:%@. Characteristics to read:%@", buf, 0x16u);
    }
    os_activity_scope_leave(&state);
  }
  else
  {
    id v41 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      id v42 = [*(id *)(a1 + 32) valueReader];
      id v43 = objc_msgSend(v14, "hf_prettyDescription");
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v42;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v43;
      _os_log_impl(&dword_20B986000, v41, OS_LOG_TYPE_DEFAULT, "Start executing read with reader:%@. Characteristics to read:%@", buf, 0x16u);
    }
  }
  int v22 = [*(id *)(a1 + 32) valueReader];
  v23 = objc_msgSend(v22, "hf_home");
  objc_initWeak((id *)&state, v23);

  id WeakRetained = objc_loadWeakRetained((id *)&state);
  if (WeakRetained)
  {
    id v25 = +[HFHomeKitDispatcher sharedDispatcher];
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_201;
    v67[3] = &unk_2640906E8;
    objc_copyWeak(&v69, (id *)&state);
    id v68 = v14;
    [v25 dispatchHomeObserverMessage:v67 sender:0];

    objc_destroyWeak(&v69);
  }
  uint64_t v26 = [v14 allObjects];
  id v45 = objc_msgSend(v26, "na_map:", &__block_literal_global_207);

  uint64_t v27 = [MEMORY[0x263F0E250] characteristicBatchRequestWithReadRequests:v45];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v73 = 0;
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_3;
  v60[3] = &unk_264090760;
  objc_copyWeak(&v65, &location);
  uint64_t v64 = buf;
  id v28 = v11;
  id v61 = v28;
  id v62 = *(id *)(a1 + 40);
  id v29 = v5;
  id v63 = v29;
  objc_copyWeak(&v66, (id *)&state);
  [v27 setProgressHandler:v60];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_4;
  aBlock[3] = &unk_264090788;
  objc_copyWeak(&v58, &location);
  id v57 = buf;
  id v30 = v28;
  id v52 = v30;
  id v44 = v29;
  id v53 = v44;
  id v31 = v14;
  id v54 = v31;
  id v55 = *(id *)(a1 + 40);
  objc_copyWeak(&v59, (id *)&state);
  id v32 = v7;
  id v56 = v32;
  id v33 = _Block_copy(aBlock);
  [v27 setCompletionHandler:v33];
  id v34 = [*(id *)(a1 + 32) valueReader];
  [v34 performBatchCharacteristicRequest:v27];

  *(void *)(*(void *)&buf[8] + 24) = 1;
  id v35 = [*(id *)(a1 + 32) transactionLock];
  [v35 lock];

  id v36 = [*(id *)(a1 + 32) inFlightReadCancelationToken];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_2_222;
  v46[3] = &unk_2640907B0;
  objc_copyWeak(&v50, &location);
  id v49 = buf;
  id v37 = v30;
  id v47 = v37;
  id v38 = v33;
  id v48 = v38;
  [v36 addCancelationBlock:v46];

  id v39 = [*(id *)(a1 + 32) transactionLock];
  [v39 unlock];

  objc_destroyWeak(&v50);
  objc_destroyWeak(&v59);

  objc_destroyWeak(&v58);
  objc_destroyWeak(&v66);

  objc_destroyWeak(&v65);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak((id *)&state);
  objc_destroyWeak(&location);
}

- (NSMutableArray)completionHandlersForReadTransactionsToExecuteOnNextRunLoop
{
  return self->_completionHandlersForReadTransactionsToExecuteOnNextRunLoop;
}

- (void)set_debug_totalNumberOfIssuedBatchReadRequests:(int64_t)a3
{
  self->__debug_totalNumberOfIssuedBatchReadRequests = a3;
}

- (NACancelationToken)inFlightReadCancelationToken
{
  return self->_inFlightReadCancelationToken;
}

- (int64_t)_debug_totalNumberOfIssuedBatchReadRequests
{
  return self->__debug_totalNumberOfIssuedBatchReadRequests;
}

- (void)_beginReadsCompleteTrackingForCharacteristics:(id)a3 withLogger:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HFCharacteristicValueManager *)self readsCompleteLogger];

  if (!v8)
  {
    BOOL v9 = objc_alloc_init(HFCharacteristicReadLogger);
    [(HFCharacteristicValueManager *)self setReadsCompleteLogger:v9];
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  id v29 = __89__HFCharacteristicValueManager__beginReadsCompleteTrackingForCharacteristics_withLogger___block_invoke;
  id v30 = &unk_264090878;
  id v31 = self;
  id v10 = v7;
  id v32 = v10;
  objc_msgSend(v6, "na_each:", &v27);
  if (v10)
  {
    BOOL v11 = objc_msgSend(v10, "loggerActivity", 0, 0, v27, v28, v29, v30, v31);
    os_activity_scope_enter(v11, &v26);

    char v12 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(HFCharacteristicValueManager *)self readsCompleteLogger];
      uint64_t v14 = [v13 numberOfAccessoriesForTransportType:0];
      id v15 = [(HFCharacteristicValueManager *)self readsCompleteLogger];
      uint64_t v16 = [v15 numberOfAccessoriesForTransportType:1];
      BOOL v17 = [(HFCharacteristicValueManager *)self readsCompleteLogger];
      uint64_t v18 = [v17 numberOfAccessoriesForTransportType:2];
      *(_DWORD *)buf = 134218496;
      uint64_t v34 = v14;
      __int16 v35 = 2048;
      uint64_t v36 = v16;
      __int16 v37 = 2048;
      uint64_t v38 = v18;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Reads Complete Tracking: Beginning reads for %lu IP accessories, %lu BLE accessories, %lu other.", buf, 0x20u);
    }
    os_activity_scope_leave(&v26);
  }
  else
  {
    id v19 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [(HFCharacteristicValueManager *)self readsCompleteLogger];
      uint64_t v21 = [v20 numberOfAccessoriesForTransportType:0];
      int v22 = [(HFCharacteristicValueManager *)self readsCompleteLogger];
      uint64_t v23 = [v22 numberOfAccessoriesForTransportType:1];
      id v24 = [(HFCharacteristicValueManager *)self readsCompleteLogger];
      uint64_t v25 = [v24 numberOfAccessoriesForTransportType:2];
      *(_DWORD *)buf = 134218496;
      uint64_t v34 = v21;
      __int16 v35 = 2048;
      uint64_t v36 = v23;
      __int16 v37 = 2048;
      uint64_t v38 = v25;
      _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "Reads Complete Tracking: Beginning reads for %lu IP accessories, %lu BLE accessories, %lu other.", buf, 0x20u);
    }
  }
}

- (void)setReadsCompleteLogger:(id)a3
{
}

- (BOOL)isNaturalLightingEnabledForProfile:(id)a3
{
  id v3 = a3;
  if (+[HFUtilities isRunningInStoreDemoMode]
    || +[HFUtilities isPressDemoModeEnabled])
  {
    unint64_t v4 = objc_getAssociatedObject(v3, "HF_NaturalLightDemoMode");
    char v5 = [v4 BOOLValue];
  }
  else
  {
    unint64_t v4 = [v3 settings];
    char v5 = [v4 isNaturalLightingEnabled];
  }
  BOOL v6 = v5;

  return v6;
}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v59 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 1)
  {
    uint64_t v63 = a1;
    v60 = [MEMORY[0x263EFF9C0] set];
    id v61 = [MEMORY[0x263EFF9C0] set];
    id v3 = [WeakRetained transactionLock];
    [v3 lock];

    unint64_t v4 = *(void **)(v63 + 32);
    if (v4)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      char v5 = [v4 loggerActivity];
      os_activity_scope_enter(v5, &state);

      BOOL v6 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Received read responses:", buf, 2u);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      id v55 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(state.opaque[0]) = 0;
        _os_log_impl(&dword_20B986000, v55, OS_LOG_TYPE_DEFAULT, "Received read responses:", (uint8_t *)&state, 2u);
      }
    }
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v7 = v59;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v80 objects:v86 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v81;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v81 != v9) {
            objc_enumerationMutation(v7);
          }
          BOOL v11 = *(void **)(*((void *)&v80 + 1) + 8 * v10);
          char v12 = *(void **)(v63 + 32);
          if (v12)
          {
            state.opaque[0] = 0;
            state.opaque[1] = 0;
            uint64_t v13 = [v12 loggerActivity];
            os_activity_scope_enter(v13, &state);

            uint64_t v14 = HFLogForCategory(0x39uLL);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v11, "hf_prettyDescription");
              id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              id v88 = v15;
              _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "     %@", buf, 0xCu);
            }
            os_activity_scope_leave(&state);
          }
          else
          {
            uint64_t v16 = HFLogForCategory(0x39uLL);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v17 = objc_msgSend(v11, "hf_prettyDescription");
              LODWORD(state.opaque[0]) = 138412290;
              *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v17;
              _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "     %@", (uint8_t *)&state, 0xCu);
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v18 = [v7 countByEnumeratingWithState:&v80 objects:v86 count:16];
        uint64_t v8 = v18;
      }
      while (v18);
    }

    uint64_t v64 = [MEMORY[0x263EFF9A0] dictionary];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id obj = v7;
    uint64_t v19 = [obj countByEnumeratingWithState:&v76 objects:v85 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v77 != v20) {
            objc_enumerationMutation(obj);
          }
          int v22 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          uint64_t v23 = [v22 request];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            NSLog(&cfstr_RequestContain.isa, v23, v22);
          }
          objc_opt_class();
          id v24 = v23;
          if (objc_opt_isKindOfClass()) {
            uint64_t v25 = v24;
          }
          else {
            uint64_t v25 = 0;
          }
          id v26 = v25;

          uint64_t v27 = [v26 characteristic];

          if (v27)
          {
            if (+[HFCharacteristicValueManager _shouldTrackReadsCompleteForPerformanceTesting])
            {
              uint64_t v28 = [*(id *)(v63 + 40) logger];
              [WeakRetained _endReadsCompleteTrackingForCharacteristic:v27 withLogger:v28 didRead:1];
            }
            id v29 = [v22 error];

            if (v29)
            {
              [v61 addObject:v27];
              id v30 = [WeakRetained characteristicsWithCachedValues];
              [v30 removeObject:v27];

              id v31 = [v22 error];
              id v32 = [WeakRetained cachedReadErrorsKeyedByCharacteristicIdentifier];
              id v33 = [v27 uniqueIdentifier];
              [v32 setObject:v31 forKeyedSubscript:v33];
            }
            else
            {
              [v60 addObject:v27];
              uint64_t v34 = [WeakRetained mutableAllReadCharacteristics];
              [v34 addObject:v27];

              __int16 v35 = [WeakRetained characteristicsWithCachedValues];
              [v35 addObject:v27];

              uint64_t v36 = [WeakRetained cachedReadErrorsKeyedByCharacteristicIdentifier];
              __int16 v37 = [v27 uniqueIdentifier];
              [v36 removeObjectForKey:v37];

              id v31 = [WeakRetained cachedWriteErrorsKeyedByCharacteristicIdentifier];
              id v32 = [v27 uniqueIdentifier];
              [v31 removeObjectForKey:v32];
            }

            uint64_t v38 = [v27 uniqueIdentifier];
            [v64 setObject:v22 forKeyedSubscript:v38];
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v76 objects:v85 count:16];
      }
      while (v19);
    }

    uint64_t v39 = objc_msgSend(*(id *)(v63 + 48), "na_map:", &__block_literal_global_214);
    id v40 = [WeakRetained transactionLock];
    [v40 unlock];

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v41 = v39;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v72 objects:v84 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v73;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v73 != v43) {
            objc_enumerationMutation(v41);
          }
          id v45 = *(void **)(*((void *)&v72 + 1) + 8 * j);
          v70[0] = MEMORY[0x263EF8330];
          v70[1] = 3221225472;
          v70[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_2_215;
          v70[3] = &unk_264090710;
          id v71 = v64;
          [v45 enumerateKeysAndObjectsUsingBlock:v70];
        }
        uint64_t v42 = [v41 countByEnumeratingWithState:&v72 objects:v84 count:16];
      }
      while (v42);
    }

    id v46 = objc_loadWeakRetained((id *)(v63 + 72));
    if (!v46) {
      goto LABEL_59;
    }
    if ([v60 count])
    {
    }
    else
    {
      BOOL v53 = [v61 count] == 0;

      if (v53)
      {
LABEL_59:

        goto LABEL_60;
      }
    }
    id v54 = +[HFHomeKitDispatcher sharedDispatcher];
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_3_216;
    v66[3] = &unk_264090738;
    objc_copyWeak(&v69, (id *)(v63 + 72));
    id v67 = v60;
    id v68 = v61;
    [v54 dispatchHomeObserverMessage:v66 sender:0];

    objc_destroyWeak(&v69);
    goto LABEL_59;
  }
  uint64_t v47 = a1;
  id v48 = *(void **)(a1 + 32);
  if (v48)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    id v49 = [v48 loggerActivity];
    os_activity_scope_enter(v49, &state);

    id v50 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v51 = *(void *)(*(void *)(*(void *)(v47 + 56) + 8) + 24) - 1;
      if (v51 > 2) {
        id v52 = @"NotStarted";
      }
      else {
        id v52 = off_2640908E8[v51];
      }
      *(_DWORD *)buf = 138412290;
      id v88 = v52;
      _os_log_impl(&dword_20B986000, v50, OS_LOG_TYPE_DEFAULT, "Not processing characteristic read progressHandler because the batch request is not in flight. Current state: %@", buf, 0xCu);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    id v56 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v57 = *(void *)(*(void *)(*(void *)(v47 + 56) + 8) + 24) - 1;
      if (v57 > 2) {
        id v58 = @"NotStarted";
      }
      else {
        id v58 = off_2640908E8[v57];
      }
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v58;
      _os_log_impl(&dword_20B986000, v56, OS_LOG_TYPE_DEFAULT, "Not processing characteristic read progressHandler because the batch request is not in flight. Current state: %@", (uint8_t *)&state, 0xCu);
    }
  }
LABEL_60:
}

+ (BOOL)_shouldTrackReadsCompleteForPerformanceTesting
{
  return ([(id)*MEMORY[0x263F1D020] launchedToTest] & 1) != 0
      || HFPreferencesBooleanValueForKey(@"HFPreferencesReadsCompleteTrackingKey") == 2;
}

- (void)_endReadsCompleteTrackingForCharacteristic:(id)a3 withLogger:(id)a4 didRead:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v5)
  {
    if (v9)
    {
      BOOL v11 = objc_msgSend(v9, "loggerActivity", 0, 0);
      os_activity_scope_enter(v11, &v24);

      char v12 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [v8 service];
        uint64_t v14 = [v13 accessory];
        id v15 = [v14 name];
        *(_DWORD *)buf = 138412546;
        id v26 = v8;
        __int16 v27 = 2112;
        uint64_t v28 = v15;
        uint64_t v16 = "Reads Complete Tracking: Read characteristic %@ from %@";
LABEL_8:
        _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
    uint64_t v19 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v8 service];
      uint64_t v21 = [v20 accessory];
      int v22 = [v21 name];
      *(_DWORD *)buf = 138412546;
      id v26 = v8;
      __int16 v27 = 2112;
      uint64_t v28 = v22;
      uint64_t v23 = "Reads Complete Tracking: Read characteristic %@ from %@";
LABEL_15:
      _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!v9)
  {
    uint64_t v19 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v8 service];
      uint64_t v21 = [v20 accessory];
      int v22 = [v21 name];
      *(_DWORD *)buf = 138412546;
      id v26 = v8;
      __int16 v27 = 2112;
      uint64_t v28 = v22;
      uint64_t v23 = "Reads Complete Tracking: No read response for characteristic %@ from %@ (ignoring)";
      goto LABEL_15;
    }
LABEL_16:

    goto LABEL_10;
  }
  BOOL v17 = objc_msgSend(v9, "loggerActivity", 0, 0);
  os_activity_scope_enter(v17, &v24);

  char v12 = HFLogForCategory(0x39uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v8 service];
    uint64_t v14 = [v13 accessory];
    id v15 = [v14 name];
    *(_DWORD *)buf = 138412546;
    id v26 = v8;
    __int16 v27 = 2112;
    uint64_t v28 = v15;
    uint64_t v16 = "Reads Complete Tracking: No read response for characteristic %@ from %@ (ignoring)";
    goto LABEL_8;
  }
LABEL_9:

  os_activity_scope_leave(&v24);
LABEL_10:
  uint64_t v18 = [(HFCharacteristicValueManager *)self readsCompleteLogger];
  [v18 markCharacteristicAsRead:v8 withLogger:v10];
}

void __89__HFCharacteristicValueManager__beginReadsCompleteTrackingForCharacteristics_withLogger___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 readsCompleteLogger];
  [v5 addCharacteristic:v4 withUpdateLogger:*(void *)(a1 + 40)];
}

- (HFCharacteristicReadLogger)readsCompleteLogger
{
  return self->_readsCompleteLogger;
}

id __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke_104(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  BOOL v6 = [WeakRetained cachedValueForCharacteristic:*(void *)(a1 + 32)];

  id v7 = (void *)MEMORY[0x263F58190];
  id v8 = [[HFCharacteristicReadResponse alloc] initWithHomeKitResponse:v4 value:v6 readTraits:*(void *)(a1 + 40)];

  id v9 = [v7 futureWithResult:v8];

  return v9;
}

id __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke_109(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  BOOL v6 = [WeakRetained cachedValueForCharacteristic:*(void *)(a1 + 32)];

  id v7 = (void *)MEMORY[0x263F58190];
  id v8 = [[HFCharacteristicReadResponse alloc] initWithHomeKitResponse:v4 value:v6 readTraits:*(void *)(a1 + 40)];

  id v9 = [v7 futureWithResult:v8];

  return v9;
}

- (id)cachedErrorForWriteToCharacteristic:(id)a3
{
  id v4 = [a3 uniqueIdentifier];
  if (v4)
  {
    id v5 = [(HFCharacteristicValueManager *)self transactionLock];
    [v5 lock];

    BOOL v6 = [(HFCharacteristicValueManager *)self cachedWriteErrorsKeyedByCharacteristicIdentifier];
    id v7 = [v6 objectForKeyedSubscript:v4];

    id v8 = [(HFCharacteristicValueManager *)self transactionLock];
    [v8 unlock];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSMutableDictionary)cachedWriteErrorsKeyedByCharacteristicIdentifier
{
  return self->_cachedWriteErrorsKeyedByCharacteristicIdentifier;
}

uint64_t __75__HFCharacteristicValueManager_hasCachedReadErrorForAccessory_passingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristics];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__HFCharacteristicValueManager_hasCachedReadErrorForAccessory_passingTest___block_invoke_2;
  v7[3] = &unk_264090828;
  id v4 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v5 = objc_msgSend(v3, "na_any:", v7);

  return v5;
}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_2_215(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v5) {
    [v6 finishWithResult:v5];
  }
}

uint64_t __76__HFCharacteristicValueManager__overrideCachedValueForCharacteristic_value___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 characteristicType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0C328]];

  return v3;
}

uint64_t __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 characteristicsToRead];
}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  unint64_t v51 = WeakRetained;
  id v52 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == 1)
  {
    uint64_t v5 = WeakRetained;
    int v6 = [(__CFString *)v3 na_isCancelledError];
    uint64_t v7 = 2;
    if (!v6) {
      uint64_t v7 = 3;
    }
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v7;
    id v8 = [v5 transactionLock];
    [v8 lock];

    id v9 = *(void **)(a1 + 32);
    if (v9)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      uint64_t v10 = [v9 loggerActivity];
      os_activity_scope_enter(v10, &state);

      BOOL v11 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v79 = v3;
        _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Finished batch read with error: %@", buf, 0xCu);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      id v44 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v3;
        _os_log_impl(&dword_20B986000, v44, OS_LOG_TYPE_DEFAULT, "Finished batch read with error: %@", (uint8_t *)&state, 0xCu);
      }
    }
    char v12 = [MEMORY[0x263EFF980] array];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v71 objects:v77 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v72 != v15) {
            objc_enumerationMutation(v13);
          }
          BOOL v17 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          [v17 setOverallReadError:v52];
          uint64_t v18 = [v17 readFuturesKeyedByCharacteristicIdentifier];
          uint64_t v19 = (void *)[v18 copy];
          [v12 addObject:v19];

          uint64_t v20 = [MEMORY[0x263EFF9C0] set];
          [v17 setCharacteristicsToRead:v20];
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v71 objects:v77 count:16];
      }
      while (v14);
    }

    uint64_t v21 = [v51 transactionLock];
    [v21 unlock];

    id v50 = [MEMORY[0x263EFF9C0] set];
    if (v52)
    {
      int v22 = v52;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
      int v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v28 = v22;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = v12;
    uint64_t v29 = [obj countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v68 != v30) {
            objc_enumerationMutation(obj);
          }
          id v32 = *(void **)(*((void *)&v67 + 1) + 8 * j);
          v60[0] = MEMORY[0x263EF8330];
          v60[1] = 3221225472;
          v60[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_219;
          v60[3] = &unk_264090650;
          id v61 = *(id *)(a1 + 48);
          id v62 = v51;
          id v63 = *(id *)(a1 + 56);
          uint64_t v64 = v52;
          id v65 = v50;
          id v66 = v28;
          [v32 enumerateKeysAndObjectsUsingBlock:v60];
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v67 objects:v76 count:16];
      }
      while (v29);
    }

    id v33 = objc_loadWeakRetained((id *)(a1 + 88));
    if (v33)
    {
      BOOL v34 = [(__CFString *)v50 count] == 0;

      if (!v34)
      {
        __int16 v35 = *(void **)(a1 + 32);
        if (v35)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          uint64_t v36 = [v35 loggerActivity];
          os_activity_scope_enter(v36, &state);

          __int16 v37 = HFLogForCategory(0x39uLL);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            long long v79 = v50;
            _os_log_impl(&dword_20B986000, v37, OS_LOG_TYPE_ERROR, "Warning: did not get read responses for characteristics: %@", buf, 0xCu);
          }

          os_activity_scope_leave(&state);
        }
        else
        {
          id v48 = HFLogForCategory(0x39uLL);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            LODWORD(state.opaque[0]) = 138412290;
            *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v50;
            _os_log_impl(&dword_20B986000, v48, OS_LOG_TYPE_ERROR, "Warning: did not get read responses for characteristics: %@", (uint8_t *)&state, 0xCu);
          }
        }
        uint64_t v38 = +[HFHomeKitDispatcher sharedDispatcher];
        v57[0] = MEMORY[0x263EF8330];
        v57[1] = 3221225472;
        v57[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_221;
        v57[3] = &unk_2640906E8;
        objc_copyWeak(&v59, (id *)(a1 + 88));
        id v58 = v50;
        [v38 dispatchHomeObserverMessage:v57 sender:0];

        objc_destroyWeak(&v59);
      }
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v39 = *(id *)(a1 + 64);
    uint64_t v40 = [v39 countByEnumeratingWithState:&v53 objects:v75 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v54;
      do
      {
        for (uint64_t k = 0; k != v40; ++k)
        {
          if (*(void *)v54 != v41) {
            objc_enumerationMutation(v39);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v53 + 1) + 8 * k) + 16))();
        }
        uint64_t v40 = [v39 countByEnumeratingWithState:&v53 objects:v75 count:16];
      }
      while (v40);
    }

    uint64_t v43 = [v51 firstReadCompleteFuture];
    [v43 finishWithNoResult];
  }
  else
  {
    uint64_t v23 = *(void **)(a1 + 32);
    if (v23)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_state_s v24 = [v23 loggerActivity];
      os_activity_scope_enter(v24, &state);

      uint64_t v25 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) - 1;
        if (v26 > 2) {
          __int16 v27 = @"NotStarted";
        }
        else {
          __int16 v27 = off_2640908E8[v26];
        }
        *(_DWORD *)buf = 138412290;
        long long v79 = v27;
        _os_log_impl(&dword_20B986000, v25, OS_LOG_TYPE_DEFAULT, "Not processing characteristic read completion handler because the batch request is not in flight. Current state: %@", buf, 0xCu);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      id v45 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v46 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) - 1;
        if (v46 > 2) {
          uint64_t v47 = @"NotStarted";
        }
        else {
          uint64_t v47 = off_2640908E8[v46];
        }
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v47;
        _os_log_impl(&dword_20B986000, v45, OS_LOG_TYPE_DEFAULT, "Not processing characteristic read completion handler because the batch request is not in flight. Current state: %@", (uint8_t *)&state, 0xCu);
      }
    }
  }
}

- (NAFuture)firstReadCompleteFuture
{
  return self->_firstReadCompleteFuture;
}

- (id)readValuesForCharacteristicTypes:(id)a3 inServices:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__HFCharacteristicValueManager_readValuesForCharacteristicTypes_inServices___block_invoke;
  v10[3] = &unk_2640903A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(HFCharacteristicValueManager *)self readValuesForCharacteristicsPassingTest:v10 inServices:a4];

  return v8;
}

- (id)readValuesForCharacteristicsPassingTest:(id)a3 inServices:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v5 = (unsigned int (**)(id, void))a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF9C0] set];
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v6;
  uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v9;
        uint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v11 = [v10 characteristics];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v26 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              if (!v5 || v5[2](v5, *(void *)(*((void *)&v25 + 1) + 8 * i)))
              {
                [v7 addObject:v16];
                BOOL v17 = [v16 uniqueIdentifier];
                [v8 setObject:v10 forKeyedSubscript:v17];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v13);
        }

        uint64_t v9 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }

  uint64_t v18 = [(HFCharacteristicValueManager *)self readValuesForCharacteristics:v7];

  return v18;
}

uint64_t __76__HFCharacteristicValueManager_readValuesForCharacteristicTypes_inServices___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 characteristicType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (HFCharacteristicValueManager)initWithValueReader:(id)a3 valueWriter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HFCharacteristicValueManager;
  id v8 = [(HFCharacteristicValueManager *)&v25 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(HFCharacteristicValueManager *)v8 setValueReader:v6];
    [(HFCharacteristicValueManager *)v9 setValueWriter:v7];
    uint64_t v10 = [MEMORY[0x263EFF980] array];
    [(HFCharacteristicValueManager *)v9 setRunningTransactions:v10];

    id v11 = [MEMORY[0x263EFF980] array];
    [(HFCharacteristicValueManager *)v9 setReadTransactionsToExecuteOnNextRunLoop:v11];

    uint64_t v12 = [MEMORY[0x263EFF980] array];
    [(HFCharacteristicValueManager *)v9 setCompletionHandlersForReadTransactionsToExecuteOnNextRunLoop:v12];

    id v13 = objc_alloc_init(MEMORY[0x263F08AE0]);
    [(HFCharacteristicValueManager *)v9 setTransactionLock:v13];

    uint64_t v14 = [(HFCharacteristicValueManager *)v9 transactionLock];
    [v14 setName:@"com.apple.Home.valueManager.transactionLock"];

    uint64_t v15 = objc_alloc_init(HFCharacteristicValueCacheManager);
    [(HFCharacteristicValueManager *)v9 setCacheManager:v15];

    uint64_t v16 = [MEMORY[0x263EFF9C0] set];
    [(HFCharacteristicValueManager *)v9 setMutableAllReadCharacteristics:v16];

    BOOL v17 = [MEMORY[0x263EFF9C0] set];
    [(HFCharacteristicValueManager *)v9 setCharacteristicsWithCachedValues:v17];

    uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
    [(HFCharacteristicValueManager *)v9 setCachedReadErrorsKeyedByCharacteristicIdentifier:v18];

    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    [(HFCharacteristicValueManager *)v9 setCachedWriteErrorsKeyedByCharacteristicIdentifier:v19];

    uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
    [(HFCharacteristicValueManager *)v9 setCachedExecutionErrorsKeyedByActionSetIdentifier:v20];

    id v21 = objc_alloc_init(MEMORY[0x263F58168]);
    [(HFCharacteristicValueManager *)v9 setInFlightReadCancelationToken:v21];

    uint64_t v22 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
    firstReadCompleteFuture = v9->_firstReadCompleteFuture;
    v9->_firstReadCompleteFuture = v22;
  }
  return v9;
}

- (void)setValueWriter:(id)a3
{
}

- (void)setValueReader:(id)a3
{
}

- (void)setTransactionLock:(id)a3
{
}

- (void)setRunningTransactions:(id)a3
{
}

- (void)setReadTransactionsToExecuteOnNextRunLoop:(id)a3
{
}

- (void)setMutableAllReadCharacteristics:(id)a3
{
}

- (void)setCompletionHandlersForReadTransactionsToExecuteOnNextRunLoop:(id)a3
{
}

- (void)setCharacteristicsWithCachedValues:(id)a3
{
}

- (void)setCachedWriteErrorsKeyedByCharacteristicIdentifier:(id)a3
{
}

- (void)setCachedReadErrorsKeyedByCharacteristicIdentifier:(id)a3
{
}

- (void)setCachedExecutionErrorsKeyedByActionSetIdentifier:(id)a3
{
}

- (void)setCacheManager:(id)a3
{
}

- (id)cachedErrorForExecutionOfActionSet:(id)a3
{
  uint64_t v4 = [a3 uniqueIdentifier];
  if (v4)
  {
    uint64_t v5 = [(HFCharacteristicValueManager *)self transactionLock];
    [v5 lock];

    id v6 = [(HFCharacteristicValueManager *)self cachedExecutionErrorsKeyedByActionSetIdentifier];
    id v7 = [v6 objectForKeyedSubscript:v4];

    id v8 = [(HFCharacteristicValueManager *)self transactionLock];
    [v8 unlock];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSMutableDictionary)cachedExecutionErrorsKeyedByActionSetIdentifier
{
  return self->_cachedExecutionErrorsKeyedByActionSetIdentifier;
}

void __80__HFCharacteristicValueManager_cachedLoadingStateForCharacteristics_actionSets___block_invoke_4(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 cacheManager];
  int v8 = [v7 containsTransactionsExecutingActionSet:v6];

  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 2uLL;
    *a3 = 1;
  }
}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_219(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([v6 isFinished] & 1) == 0)
  {
    id v7 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_2_220;
    v19[3] = &unk_2640903A0;
    id v20 = v5;
    int v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", v19);
    if (v8)
    {
      if (+[HFCharacteristicValueManager _shouldTrackReadsCompleteForPerformanceTesting])
      {
        uint64_t v9 = *(void **)(a1 + 40);
        uint64_t v10 = [*(id *)(a1 + 48) logger];
        [v9 _endReadsCompleteTrackingForCharacteristic:v8 withLogger:v10 didRead:0];
      }
      id v11 = *(void **)(a1 + 56);
      if (!v11 || (objc_msgSend(v11, "na_isCancelledError") & 1) == 0)
      {
        uint64_t v12 = [*(id *)(a1 + 40) transactionLock];
        [v12 lock];

        id v13 = [*(id *)(a1 + 40) characteristicsWithCachedValues];
        [v13 removeObject:v8];

        uint64_t v14 = *(void **)(a1 + 56);
        uint64_t v15 = v14;
        if (!v14)
        {
          uint64_t v15 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 5);
        }
        uint64_t v16 = [*(id *)(a1 + 40) cachedReadErrorsKeyedByCharacteristicIdentifier];
        BOOL v17 = [v8 uniqueIdentifier];
        [v16 setObject:v15 forKeyedSubscript:v17];

        if (!v14) {
        [*(id *)(a1 + 64) addObject:v8];
        }
        uint64_t v18 = [*(id *)(a1 + 40) transactionLock];
        [v18 unlock];
      }
    }
    [v6 finishWithError:*(void *)(a1 + 72)];
  }
}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_3_216(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [v4 home:WeakRetained didReadValuesForCharacteristics:*(void *)(a1 + 32) failedCharacteristics:*(void *)(a1 + 40)];
  }
}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_201(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [v4 home:WeakRetained willReadValuesForCharacteristics:*(void *)(a1 + 32)];
  }
}

id __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_212(uint64_t a1, void *a2)
{
  v2 = [a2 readFuturesKeyedByCharacteristicIdentifier];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

uint64_t __43__HFCharacteristicValueManager_na_identity__block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x263F58198] buildPointerIdentity];
  uint64_t v1 = qword_26AB2EEC8;
  qword_26AB2EEC8 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)staticHomeDataModelCachedValueForCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = self;
  HFCharacteristicValueManager.staticHomeDataModelCachedValue(for:)(v4, (uint64_t)v13);

  uint64_t v6 = v14;
  if (v14)
  {
    id v7 = __swift_project_boxed_opaque_existential_1(v13, v14);
    uint64_t v8 = *(void *)(v6 - 8);
    MEMORY[0x270FA5388](v7);
    uint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    id v11 = (void *)sub_20BCE7FF0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

- (BOOL)staticHomeDataModelHasInProgressWriteForCharacteristic:(id)a3
{
  sub_20BA8B604();
  sub_20BA8B644();
  uint64_t v4 = sub_20BCE7940();
  id v5 = self;
  sub_20BA897B4(v4);
  char v7 = v6;

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (id)writeNaturalLightEnabledState:(BOOL)a3 forProfile:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (+[HFUtilities isRunningInStoreDemoMode]
    || +[HFUtilities isPressDemoModeEnabled])
  {
    char v6 = [NSNumber numberWithBool:v4];
    objc_setAssociatedObject(v5, "HF_NaturalLightDemoMode", v6, (void *)1);

    char v7 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67109378;
      HIDWORD(buf) = v4;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Updating natural light state IN DEMO MODE to %{BOOL}d for profile: %@", (uint8_t *)&buf, 0x12u);
    }

    objc_initWeak(&buf, v5);
    uint64_t v8 = +[HFHomeKitDispatcher sharedDispatcher];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __100__HFCharacteristicValueManager_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke;
    v16[3] = &unk_26408EA10;
    objc_copyWeak(&v17, &buf);
    [v8 dispatchLightObserverMessage:v16 sender:0];

    uint64_t v9 = [MEMORY[0x263F58190] futureWithNoResult];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&buf);
  }
  else if (v4)
  {
    objc_initWeak(&buf, v5);
    id v11 = (void *)MEMORY[0x263F58190];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __100__HFCharacteristicValueManager_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke_2;
    v12[3] = &unk_26408EA38;
    BOOL v15 = v4;
    id v13 = v5;
    objc_copyWeak(&v14, &buf);
    uint64_t v9 = [v11 futureWithBlock:v12];
    objc_destroyWeak(&v14);

    objc_destroyWeak(&buf);
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v9;
}

void __100__HFCharacteristicValueManager_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  BOOL v4 = [WeakRetained settings];
  [v3 lightProfile:WeakRetained didUpdateSettings:v4];
}

void __100__HFCharacteristicValueManager_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = HFLogForCategory(0x39uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 48);
    char v6 = *(void **)(a1 + 32);
    char v7 = [v6 settings];
    *(_DWORD *)id buf = 67109634;
    int v13 = v5;
    __int16 v14 = 2112;
    BOOL v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Updating natural light state to %{BOOL}d for profile: %@ %@", buf, 0x1Cu);
  }
  uint64_t v8 = *(void **)(a1 + 32);
  BOOL v9 = *(unsigned char *)(a1 + 48) != 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __100__HFCharacteristicValueManager_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke_72;
  v10[3] = &unk_26408D940;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  [v8 setNaturalLightingEnabled:v9 completionHandler:v10];
  [v3 finishWithNoResult];
  objc_destroyWeak(&v11);
}

void __100__HFCharacteristicValueManager_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke_72(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      *(_DWORD *)id buf = 138412546;
      id v10 = WeakRetained;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Error updating natural light state for profile %@. Error: %@", buf, 0x16u);
    }
  }
  char v6 = +[HFHomeKitDispatcher sharedDispatcher];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __100__HFCharacteristicValueManager_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke_73;
  v7[3] = &unk_26408EA10;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  [v6 dispatchLightObserverMessage:v7 sender:0];

  objc_destroyWeak(&v8);
}

void __100__HFCharacteristicValueManager_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke_73(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  BOOL v4 = [WeakRetained settings];
  [v3 lightProfile:WeakRetained didUpdateSettings:v4];
}

- (void)fetchNaturalLightColorTemperatureForBrightness:(int64_t)a3 lightProfile:(id)a4 completion:(id)a5
{
}

- (NSSet)characteristicsWithPendingReads
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = [(HFCharacteristicValueManager *)self transactionLock];
  [v3 lock];

  BOOL v4 = [MEMORY[0x263EFF9C0] set];
  int v5 = [(HFCharacteristicValueManager *)self runningTransactions];
  char v6 = (void *)[v5 mutableCopy];

  __int16 v19 = self;
  char v7 = [(HFCharacteristicValueManager *)self openTransaction];
  objc_msgSend(v6, "na_safeAddObject:", v7);

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        __int16 v14 = [v13 characteristicsToRead];

        if (v14)
        {
          BOOL v15 = [v13 characteristicsToRead];
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          v20[2] = __63__HFCharacteristicValueManager_characteristicsWithPendingReads__block_invoke;
          v20[3] = &unk_2640903A0;
          void v20[4] = v13;
          __int16 v16 = objc_msgSend(v15, "na_filter:", v20);
          [v4 unionSet:v16];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  id v17 = [(HFCharacteristicValueManager *)v19 transactionLock];
  [v17 unlock];

  return (NSSet *)v4;
}

uint64_t __63__HFCharacteristicValueManager_characteristicsWithPendingReads__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 readFuturesKeyedByCharacteristicIdentifier];
  int v5 = [v3 uniqueIdentifier];

  char v6 = [v4 objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 isFinished] ^ 1;

  return v7;
}

- (NSSet)characteristicsWithPendingWrites
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [(HFCharacteristicValueManager *)self transactionLock];
  [v3 lock];

  BOOL v4 = [MEMORY[0x263EFF9C0] set];
  int v5 = [(HFCharacteristicValueManager *)self runningTransactions];
  char v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [(HFCharacteristicValueManager *)self openTransaction];
  objc_msgSend(v6, "na_safeAddObject:", v7);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = -[HFCharacteristicValueManager _transactionLock_characteristicsWithPendingWritesInTransacton:includeDirectWrites:includeActionSets:includeActions:](self, "_transactionLock_characteristicsWithPendingWritesInTransacton:includeDirectWrites:includeActionSets:includeActions:", *(void *)(*((void *)&v16 + 1) + 8 * i), 1, 1, 1, (void)v16);
        [v4 unionSet:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  __int16 v14 = [(HFCharacteristicValueManager *)self transactionLock];
  [v14 unlock];

  return (NSSet *)v4;
}

void __80__HFCharacteristicValueManager_cachedLoadingStateForCharacteristics_actionSets___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 testingOverrideLoadingStates];
  char v6 = [v4 uniqueIdentifier];

  id v10 = [v5 objectForKeyedSubscript:v6];

  uint64_t v7 = v10;
  if (v10)
  {
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v9 = [v10 unsignedIntegerValue] | v8;
    uint64_t v7 = v10;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  }
}

void __74__HFCharacteristicValueManager_loadingStateForCharacteristics_actionSets___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 testingOverrideLoadingStates];
  char v6 = [v4 uniqueIdentifier];

  id v10 = [v5 objectForKeyedSubscript:v6];

  uint64_t v7 = v10;
  if (v10)
  {
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v9 = [v10 unsignedIntegerValue] | v8;
    uint64_t v7 = v10;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  }
}

uint64_t __74__HFCharacteristicValueManager_loadingStateForCharacteristics_actionSets___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristic];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __74__HFCharacteristicValueManager_loadingStateForCharacteristics_actionSets___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v6 characteristic];
    uint64_t v9 = [v7 containsObject:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_transactionLock_characteristicsWithPendingWritesInTransacton:(id)a3 includeDirectWrites:(BOOL)a4 includeActionSets:(BOOL)a5 includeActions:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = [MEMORY[0x263EFF9C0] set];
  if (v8)
  {
    uint64_t v11 = [v9 writeCharacteristicRequests];

    if (v11)
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v12 = [v9 writeCharacteristicRequests];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v46 != v15) {
              objc_enumerationMutation(v12);
            }
            long long v17 = [*(id *)(*((void *)&v45 + 1) + 8 * i) characteristic];
            objc_msgSend(v10, "na_safeAddObject:", v17);
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
        }
        while (v14);
      }
    }
  }
  if (v7)
  {
    long long v18 = [v9 actionSetsToExecute];

    if (v18)
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v19 = [v9 actionSetsToExecute];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v42 != v22) {
              objc_enumerationMutation(v19);
            }
            long long v24 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * j), "hf_affectedCharacteristics");
            if (v24) {
              [v10 unionSet:v24];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v50 count:16];
        }
        while (v21);
      }
    }
  }
  if (v6)
  {
    objc_super v25 = [v9 actionsToExecute];

    if (v25)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v26 = objc_msgSend(v9, "actionsToExecute", 0);
      uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v49 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v38;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v38 != v29) {
              objc_enumerationMutation(v26);
            }
            long long v31 = *(void **)(*((void *)&v37 + 1) + 8 * k);
            objc_opt_class();
            id v32 = v31;
            if (objc_opt_isKindOfClass()) {
              id v33 = v32;
            }
            else {
              id v33 = 0;
            }
            id v34 = v33;

            uint64_t v35 = [v34 characteristic];
            objc_msgSend(v10, "na_safeAddObject:", v35);
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v49 count:16];
        }
        while (v28);
      }
    }
  }

  return v10;
}

- (void)beginTransactionWithReason:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [(HFCharacteristicValueManager *)self beginTransactionWithReason:v4 readPolicy:v5 logger:0];
}

id __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke_110(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  BOOL v6 = [WeakRetained cachedValueForCharacteristic:*(void *)(a1 + 32)];

  BOOL v7 = (void *)MEMORY[0x263F58190];
  BOOL v8 = [[HFCharacteristicReadResponse alloc] initWithHomeKitResponse:v4 value:v6 readTraits:*(void *)(a1 + 40)];

  id v9 = [v7 futureWithResult:v8];

  return v9;
}

id __59__HFCharacteristicValueManager_readValueForCharacteristic___block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  BOOL v6 = [v3 cachedValueForCharacteristic:v4];
  BOOL v7 = (void *)MEMORY[0x263F58190];
  BOOL v8 = [[HFCharacteristicReadResponse alloc] initWithCharacteristic:a1[5] readTraits:a1[6] value:v6 error:v5];

  id v9 = [v7 futureWithResult:v8];

  return v9;
}

- (id)writeValue:(id)a3 forCharacteristic:(id)a4
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    long long v72 = [MEMORY[0x263F08690] currentHandler];
    [v72 handleFailureInMethod:a2, self, @"HFCharacteristicValueManager.m", 497, @"Invalid parameter not satisfying: %@", @"characteristic != nil" object file lineNumber description];
  }
  SEL v80 = a2;
  id v9 = [v8 uniqueIdentifier];
  id v10 = [(HFCharacteristicValueManager *)self transactionLock];
  [v10 lock];

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  uint64_t v11 = [(HFCharacteristicValueManager *)self runningTransactions];
  id v12 = [v11 reverseObjectEnumerator];

  long long v83 = self;
  id v84 = v7;
  id v85 = v9;
  uint64_t v86 = [v12 countByEnumeratingWithState:&v95 objects:v104 count:16];
  if (!v86)
  {
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v13 = *(void *)v96;
  uint64_t v81 = *(void *)v96;
  long long v82 = v12;
LABEL_5:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v96 != v13) {
      objc_enumerationMutation(v12);
    }
    uint64_t v15 = *(void **)(*((void *)&v95 + 1) + 8 * v14);
    long long v16 = [v15 writeFuturesKeyedByCharacteristicIdentifier];
    long long v17 = [v16 objectForKeyedSubscript:v9];

    if (!v17 || ([v17 isFinished] & 1) != 0) {
      goto LABEL_19;
    }
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v18 = [v15 writeCharacteristicRequests];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v91 objects:v103 count:16];
    if (v19) {
      break;
    }
LABEL_18:

    self = v83;
    id v7 = v84;
    id v9 = v85;
    uint64_t v13 = v81;
    id v12 = v82;
LABEL_19:

    if (++v14 == v86)
    {
      uint64_t v86 = [v12 countByEnumeratingWithState:&v95 objects:v104 count:16];
      if (v86) {
        goto LABEL_5;
      }
      goto LABEL_30;
    }
  }
  uint64_t v20 = v19;
  uint64_t v21 = *(void *)v92;
LABEL_12:
  uint64_t v22 = 0;
  while (1)
  {
    if (*(void *)v92 != v21) {
      objc_enumerationMutation(v18);
    }
    long long v23 = *(void **)(*((void *)&v91 + 1) + 8 * v22);
    long long v24 = [v23 characteristic];
    char v25 = [v24 isEqual:v8];

    if (v25) {
      break;
    }
    if (v20 == ++v22)
    {
      uint64_t v20 = [v18 countByEnumeratingWithState:&v91 objects:v103 count:16];
      if (v20) {
        goto LABEL_12;
      }
      goto LABEL_18;
    }
  }
  uint64_t v26 = [v23 value];
  id v7 = v84;
  char v27 = [v26 isEqual:v84];

  if ((v27 & 1) == 0)
  {

    id v12 = v82;
    self = v83;
    id v9 = v85;
    goto LABEL_30;
  }
  self = v83;
  uint64_t v28 = [(HFCharacteristicValueManager *)v83 openTransaction];
  uint64_t v29 = [v28 logger];

  if (v29)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    long long v30 = [(HFCharacteristicValueManager *)v83 openTransaction];
    long long v31 = [v30 logger];
    id v32 = [v31 loggerActivity];
    os_activity_scope_enter(v32, &state);

    id v33 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = objc_msgSend(v8, "hf_prettyDescription");
      *(_DWORD *)id buf = 138412290;
      long long v101 = v34;
      _os_log_impl(&dword_20B986000, v33, OS_LOG_TYPE_DEFAULT, "Duplicate write: %@", buf, 0xCu);
    }
    os_activity_scope_leave(&state);
  }
  else
  {
    long long v76 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      long long v77 = objc_msgSend(v8, "hf_prettyDescription");
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v77;
      _os_log_impl(&dword_20B986000, v76, OS_LOG_TYPE_DEFAULT, "Duplicate write: %@", (uint8_t *)&state, 0xCu);
    }
  }
  id v9 = v85;
  uint64_t v35 = [v17 flatMap:&__block_literal_global_46];

  if (v35) {
    goto LABEL_60;
  }
LABEL_31:
  uint64_t v36 = [(HFCharacteristicValueManager *)self openTransaction];

  if (!v36) {
    goto LABEL_55;
  }
  long long v37 = [(HFCharacteristicValueManager *)self openTransaction];
  long long v38 = [v37 writeFuturesKeyedByCharacteristicIdentifier];
  uint64_t v39 = [v38 objectForKeyedSubscript:v9];

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v40 = [v37 writeCharacteristicRequests];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v87 objects:v99 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v88;
    while (2)
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v88 != v42) {
          objc_enumerationMutation(v40);
        }
        long long v44 = *(void **)(*((void *)&v87 + 1) + 8 * i);
        long long v45 = [v44 characteristic];
        int v46 = [v45 isEqual:v8];

        if (v46)
        {
          uint64_t v41 = v44;
          goto LABEL_42;
        }
      }
      uint64_t v41 = [v40 countByEnumeratingWithState:&v87 objects:v99 count:16];
      if (v41) {
        continue;
      }
      break;
    }
LABEL_42:
    self = v83;
    id v7 = v84;
    id v9 = v85;
  }

  if (v39) {
    BOOL v47 = v41 == 0;
  }
  else {
    BOOL v47 = 1;
  }
  if (v47 && (v41 | v39) != 0) {
    NSLog(&cfstr_InconsistentSt_0.isa);
  }
  if (v41)
  {
    id v49 = [v37 writeCharacteristicRequests];
    [v49 removeObject:v41];

    if (!v39) {
      goto LABEL_53;
    }
  }
  else
  {
    id v65 = [(HFCharacteristicValueManager *)self openTransaction];
    id v66 = [v65 logger];

    if (v66)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      long long v67 = [(HFCharacteristicValueManager *)self openTransaction];
      long long v68 = [v67 logger];
      long long v69 = [v68 loggerActivity];
      os_activity_scope_enter(v69, &state);

      long long v70 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        long long v71 = objc_msgSend(v8, "hf_prettyDescription");
        *(_DWORD *)id buf = 138412290;
        long long v101 = v71;
        _os_log_impl(&dword_20B986000, v70, OS_LOG_TYPE_DEFAULT, "New write request: %@", buf, 0xCu);
      }
      os_activity_scope_leave(&state);
    }
    else
    {
      long long v78 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        long long v79 = objc_msgSend(v8, "hf_prettyDescription");
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v79;
        _os_log_impl(&dword_20B986000, v78, OS_LOG_TYPE_DEFAULT, "New write request: %@", (uint8_t *)&state, 0xCu);
      }
    }
    id v9 = v85;
    if (!v39)
    {
LABEL_53:
      uint64_t v39 = (uint64_t)objc_alloc_init(MEMORY[0x263F58190]);
      id v50 = [v37 writeFuturesKeyedByCharacteristicIdentifier];
      [v50 setObject:v39 forKeyedSubscript:v9];
    }
  }
  unint64_t v51 = [v37 writeCharacteristicRequests];
  uint64_t v52 = [MEMORY[0x263F0E2A8] writeRequestWithCharacteristic:v8 value:v7];
  [v51 addObject:v52];

  uint64_t v35 = [(id)v39 flatMap:&__block_literal_global_121_0];

  if (!v35)
  {
LABEL_55:
    [(HFCharacteristicValueManager *)self beginTransactionWithReason:@"characteristicValueManagerImplicitTransaction"];
    long long v53 = [(HFCharacteristicValueManager *)self openTransaction];
    long long v54 = [v53 logger];

    if (v54)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      long long v55 = [v53 logger];
      long long v56 = [v55 loggerActivity];
      os_activity_scope_enter(v56, &state);

      unint64_t v57 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        id v58 = objc_msgSend(v8, "hf_prettyDescription");
        *(_DWORD *)id buf = 138412290;
        long long v101 = v58;
        _os_log_impl(&dword_20B986000, v57, OS_LOG_TYPE_DEFAULT, "Write request for implicit transaction: %@", buf, 0xCu);
      }
      os_activity_scope_leave(&state);
    }
    else
    {
      long long v74 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        long long v75 = objc_msgSend(v8, "hf_prettyDescription");
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v75;
        _os_log_impl(&dword_20B986000, v74, OS_LOG_TYPE_DEFAULT, "Write request for implicit transaction: %@", (uint8_t *)&state, 0xCu);
      }
    }
    id v59 = [v53 writeCharacteristicRequests];
    v60 = [MEMORY[0x263F0E2A8] writeRequestWithCharacteristic:v8 value:v7];
    [v59 addObject:v60];

    id v61 = objc_alloc_init(MEMORY[0x263F58190]);
    id v62 = [v53 writeFuturesKeyedByCharacteristicIdentifier];
    [v62 setObject:v61 forKeyedSubscript:v9];

    uint64_t v35 = [v61 flatMap:&__block_literal_global_124];
    [(HFCharacteristicValueManager *)self commitTransactionWithReason:@"characteristicValueManagerImplicitTransaction"];
  }
LABEL_60:
  id v63 = [(HFCharacteristicValueManager *)self transactionLock];
  [v63 unlock];

  if (!v35)
  {
    long long v73 = [MEMORY[0x263F08690] currentHandler];
    [v73 handleFailureInMethod:v80 object:self file:@"HFCharacteristicValueManager.m" lineNumber:612 description:@"None of our cases were able to create a future for this request"];
  }
  return v35;
}

id __61__HFCharacteristicValueManager_writeValue_forCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 error];

  uint64_t v4 = (void *)MEMORY[0x263F58190];
  if (v3)
  {
    id v5 = [v2 error];
    BOOL v6 = [v4 futureWithError:v5];
  }
  else
  {
    BOOL v6 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v6;
}

id __61__HFCharacteristicValueManager_writeValue_forCharacteristic___block_invoke_119(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 error];

  uint64_t v4 = (void *)MEMORY[0x263F58190];
  if (v3)
  {
    id v5 = [v2 error];
    BOOL v6 = [v4 futureWithError:v5];
  }
  else
  {
    BOOL v6 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v6;
}

id __61__HFCharacteristicValueManager_writeValue_forCharacteristic___block_invoke_122(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 error];

  uint64_t v4 = (void *)MEMORY[0x263F58190];
  if (v3)
  {
    id v5 = [v2 error];
    BOOL v6 = [v4 futureWithError:v5];
  }
  else
  {
    BOOL v6 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v6;
}

- (void)executeActionSet:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(HFCharacteristicValueManager *)self executeActionSet:a3];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__HFCharacteristicValueManager_executeActionSet_completionHandler___block_invoke;
  v10[3] = &unk_264090550;
  id v11 = v6;
  id v8 = v6;
  id v9 = (id)[v7 addCompletionBlock:v10];
}

uint64_t __67__HFCharacteristicValueManager_executeActionSet_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (id)executeActionSet:(id)a3
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v52 = [MEMORY[0x263F08690] currentHandler];
    [v52 handleFailureInMethod:a2, self, @"HFCharacteristicValueManager.m", 628, @"Invalid parameter not satisfying: %@", @"actionSet != nil" object file lineNumber description];
  }
  SEL v60 = a2;
  id v6 = [(HFCharacteristicValueManager *)self transactionLock];
  [v6 lock];

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v7 = [(HFCharacteristicValueManager *)self runningTransactions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v72 objects:v79 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v73;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v73 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v72 + 1) + 8 * v11);
      uint64_t v13 = [v12 actionSetsToExecute];
      int v14 = [v13 containsObject:v5];

      if (v14) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v72 objects:v79 count:16];
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    uint64_t v15 = [(HFCharacteristicValueManager *)self openTransaction];
    long long v16 = [v15 logger];

    if (v16)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      long long v17 = [(HFCharacteristicValueManager *)self openTransaction];
      long long v18 = [v17 logger];
      uint64_t v19 = [v18 loggerActivity];
      os_activity_scope_enter(v19, &state);

      uint64_t v20 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = objc_msgSend(v5, "hf_prettyDescription");
        *(_DWORD *)id buf = 138412290;
        long long v77 = v21;
        _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "Duplicate action set execution request: %@", buf, 0xCu);
      }
      os_activity_scope_leave(&state);
    }
    else
    {
      long long v54 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        long long v55 = objc_msgSend(v5, "hf_prettyDescription");
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v55;
        _os_log_impl(&dword_20B986000, v54, OS_LOG_TYPE_DEFAULT, "Duplicate action set execution request: %@", (uint8_t *)&state, 0xCu);
      }
    }
    id v22 = objc_alloc_init(MEMORY[0x263F58190]);
    long long v23 = [v12 onFinishGroup];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__HFCharacteristicValueManager_executeActionSet___block_invoke;
    block[3] = &unk_26408D388;
    void block[4] = v12;
    id v70 = v5;
    id v24 = v22;
    id v71 = v24;
    dispatch_group_notify(v23, MEMORY[0x263EF83A0], block);

    if (v24) {
      goto LABEL_29;
    }
  }
  else
  {
LABEL_11:
  }
  char v25 = [(HFCharacteristicValueManager *)self openTransaction];

  if (!v25) {
    goto LABEL_24;
  }
  id v26 = objc_alloc_init(MEMORY[0x263F58190]);
  char v27 = [(HFCharacteristicValueManager *)self openTransaction];
  uint64_t v28 = [v27 actionSetsToExecute];
  char v29 = [v28 containsObject:v5];

  if ((v29 & 1) == 0)
  {
    long long v30 = [(HFCharacteristicValueManager *)self openTransaction];
    long long v31 = [v30 logger];

    if (v31)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      id v32 = [(HFCharacteristicValueManager *)self openTransaction];
      id v33 = [v32 logger];
      id v34 = [v33 loggerActivity];
      os_activity_scope_enter(v34, &state);

      uint64_t v35 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = objc_msgSend(v5, "hf_prettyDescription");
        *(_DWORD *)id buf = 138412290;
        long long v77 = v36;
        _os_log_impl(&dword_20B986000, v35, OS_LOG_TYPE_DEFAULT, "Execute action set request: %@", buf, 0xCu);
      }
      os_activity_scope_leave(&state);
    }
    else
    {
      id v58 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        id v59 = objc_msgSend(v5, "hf_prettyDescription");
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v59;
        _os_log_impl(&dword_20B986000, v58, OS_LOG_TYPE_DEFAULT, "Execute action set request: %@", (uint8_t *)&state, 0xCu);
      }
    }
  }
  long long v37 = [v27 actionSetsToExecute];
  [v37 addObject:v5];

  long long v38 = [v27 onFinishGroup];
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __49__HFCharacteristicValueManager_executeActionSet___block_invoke_130;
  v65[3] = &unk_26408D388;
  id v66 = v27;
  id v67 = v5;
  id v24 = v26;
  id v68 = v24;
  id v39 = v27;
  dispatch_group_notify(v38, MEMORY[0x263EF83A0], v65);

  if (!v24)
  {
LABEL_24:
    id v40 = objc_alloc_init(MEMORY[0x263F58190]);
    [(HFCharacteristicValueManager *)self beginTransactionWithReason:@"characteristicValueManagerImplicitTransaction"];
    uint64_t v41 = [(HFCharacteristicValueManager *)self openTransaction];
    uint64_t v42 = [v41 logger];

    if (v42)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      long long v43 = [v41 logger];
      long long v44 = [v43 loggerActivity];
      os_activity_scope_enter(v44, &state);

      long long v45 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        int v46 = objc_msgSend(v5, "hf_prettyDescription");
        *(_DWORD *)id buf = 138412290;
        long long v77 = v46;
        _os_log_impl(&dword_20B986000, v45, OS_LOG_TYPE_DEFAULT, "Execute action set request in implicit transaction: %@", buf, 0xCu);
      }
      os_activity_scope_leave(&state);
    }
    else
    {
      long long v56 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v57 = objc_msgSend(v5, "hf_prettyDescription");
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v57;
        _os_log_impl(&dword_20B986000, v56, OS_LOG_TYPE_DEFAULT, "Execute action set request in implicit transaction: %@", (uint8_t *)&state, 0xCu);
      }
    }
    BOOL v47 = [v41 actionSetsToExecute];
    [v47 addObject:v5];

    long long v48 = [v41 onFinishGroup];
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __49__HFCharacteristicValueManager_executeActionSet___block_invoke_131;
    v61[3] = &unk_26408D388;
    id v62 = v41;
    id v63 = v5;
    id v24 = v40;
    id v64 = v24;
    id v49 = v41;
    dispatch_group_notify(v48, MEMORY[0x263EF83A0], v61);

    [(HFCharacteristicValueManager *)self commitTransactionWithReason:@"characteristicValueManagerImplicitTransaction"];
  }
LABEL_29:
  id v50 = [(HFCharacteristicValueManager *)self transactionLock];
  [v50 unlock];

  if (!v24)
  {
    long long v53 = [MEMORY[0x263F08690] currentHandler];
    [v53 handleFailureInMethod:v60 object:self file:@"HFCharacteristicValueManager.m" lineNumber:695 description:@"None of our cases were able to create a future for this request"];
  }
  return v24;
}

void __49__HFCharacteristicValueManager_executeActionSet___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) executionErrorForActionSet:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 48);
  id v4 = (id)v2;
  if (v2) {
    [v3 finishWithError:v2];
  }
  else {
    [v3 finishWithNoResult];
  }
}

void __49__HFCharacteristicValueManager_executeActionSet___block_invoke_130(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) executionErrorForActionSet:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 48);
  id v4 = (id)v2;
  if (v2) {
    [v3 finishWithError:v2];
  }
  else {
    [v3 finishWithNoResult];
  }
}

void __49__HFCharacteristicValueManager_executeActionSet___block_invoke_131(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) executionErrorForActionSet:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 48);
  id v4 = (id)v2;
  if (v2) {
    [v3 finishWithError:v2];
  }
  else {
    [v3 finishWithNoResult];
  }
}

- (id)executeActions:(id)a3
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v59 = [MEMORY[0x263F08690] currentHandler];
    [v59 handleFailureInMethod:a2, self, @"HFCharacteristicValueManager.m", 702, @"Invalid parameter not satisfying: %@", @"actions != nil" object file lineNumber description];
  }
  id v5 = [(HFCharacteristicValueManager *)self transactionLock];
  [v5 lock];

  id v6 = [MEMORY[0x263EFF980] array];
  id v7 = (void *)[v4 mutableCopy];
  uint64_t v8 = &__unnamed_4;
  if ([v7 count])
  {
    id v65 = v4;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obj = [(HFCharacteristicValueManager *)self runningTransactions];
    uint64_t v69 = [obj countByEnumeratingWithState:&v80 objects:v87 count:16];
    if (v69)
    {
      uint64_t v68 = *(void *)v81;
      id v67 = v7;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v81 != v68) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v80 + 1) + 8 * v9);
          uint64_t v11 = [v10 actionsToExecute];
          id v12 = (void *)[v11 mutableCopy];

          uint64_t v13 = [v10 actionSetsToExecute];
          int v14 = objc_msgSend(v13, "na_flatMap:", &__block_literal_global_137);
          [v12 unionSet:v14];

          uint64_t v15 = [v10 writeCharacteristicRequests];
          long long v16 = objc_msgSend(v15, "na_map:", &__block_literal_global_140_0);
          [v12 unionSet:v16];

          v78[0] = MEMORY[0x263EF8330];
          v78[1] = 3221225472;
          v78[2] = __47__HFCharacteristicValueManager_executeActions___block_invoke_3;
          v78[3] = &unk_2640905B8;
          id v17 = v7;
          id v79 = v17;
          long long v18 = objc_msgSend(v12, "na_map:", v78);
          if ([v18 count])
          {
            uint64_t v19 = v6;
            uint64_t v20 = [(HFCharacteristicValueManager *)self openTransaction];
            uint64_t v21 = [v20 logger];

            if (v21)
            {
              state.opaque[0] = 0;
              state.opaque[1] = 0;
              id v22 = self;
              long long v23 = [(HFCharacteristicValueManager *)self openTransaction];
              id v24 = [v23 logger];
              char v25 = [v24 loggerActivity];
              os_activity_scope_enter(v25, &state);

              id v26 = HFLogForCategory(0x39uLL);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                char v27 = objc_msgSend(v65, "hf_prettyDescription");
                *(_DWORD *)id buf = 138412290;
                id v85 = v27;
                _os_log_impl(&dword_20B986000, v26, OS_LOG_TYPE_DEFAULT, "Overlapping actions execution request: %@", buf, 0xCu);
              }
              os_activity_scope_leave(&state);
            }
            else
            {
              id v22 = self;
              id v32 = HFLogForCategory(0x39uLL);
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                id v33 = objc_msgSend(v65, "hf_prettyDescription");
                LODWORD(state.opaque[0]) = 138412290;
                *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v33;
                _os_log_impl(&dword_20B986000, v32, OS_LOG_TYPE_DEFAULT, "Overlapping actions execution request: %@", (uint8_t *)&state, 0xCu);
              }
            }
            id v6 = v19;
            id v28 = objc_alloc_init(MEMORY[0x263F58190]);
            [v19 addObject:v28];
            [v17 minusSet:v18];
            char v29 = [v10 onFinishGroup];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __47__HFCharacteristicValueManager_executeActions___block_invoke_142;
            block[3] = &unk_26408D450;
            void block[4] = v10;
            id v77 = v28;
            id v30 = v28;
            dispatch_group_notify(v29, MEMORY[0x263EF83A0], block);

            uint64_t v31 = [v17 count];
            self = v22;
            id v7 = v67;
            if (!v31)
            {

              uint64_t v8 = &__unnamed_4;
              goto LABEL_23;
            }
          }

          ++v9;
        }
        while (v69 != v9);
        uint64_t v34 = [obj countByEnumeratingWithState:&v80 objects:v87 count:16];
        uint64_t v8 = (void *)&__unnamed_4;
        uint64_t v69 = v34;
      }
      while (v34);
    }
LABEL_23:

    id v4 = v65;
  }
  if ([v7 count])
  {
    uint64_t v35 = [(HFCharacteristicValueManager *)self openTransaction];

    if (v35)
    {
      id v36 = objc_alloc_init(MEMORY[0x263F58190]);
      [v6 addObject:v36];
      long long v37 = [(HFCharacteristicValueManager *)self openTransaction];
      long long v38 = [v37 actionsToExecute];
      [v38 minusSet:v7];

      id v39 = [v37 actionsToExecute];
      [v39 unionSet:v7];

      [v7 removeAllObjects];
      id v40 = [v37 onFinishGroup];
      v73[0] = MEMORY[0x263EF8330];
      v73[1] = v8[155];
      v73[2] = __47__HFCharacteristicValueManager_executeActions___block_invoke_2_143;
      v73[3] = &unk_26408D450;
      id v74 = v37;
      id v75 = v36;
      id v41 = v36;
      id v42 = v37;
      dispatch_group_notify(v40, MEMORY[0x263EF83A0], v73);
    }
  }
  if ([v7 count])
  {
    id v43 = objc_alloc_init(MEMORY[0x263F58190]);
    [v6 addObject:v43];
    [(HFCharacteristicValueManager *)self beginTransactionWithReason:@"characteristicValueManagerImplicitTransaction"];
    long long v44 = [(HFCharacteristicValueManager *)self openTransaction];
    long long v45 = [v44 logger];

    if (v45)
    {
      int v46 = self;
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      BOOL v47 = [v44 logger];
      long long v48 = [v47 loggerActivity];
      os_activity_scope_enter(v48, &state);

      id v49 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        id v50 = objc_msgSend(v7, "hf_prettyDescription");
        *(_DWORD *)id buf = 138412290;
        id v85 = v50;
        _os_log_impl(&dword_20B986000, v49, OS_LOG_TYPE_DEFAULT, "Execute actions request in implicit transaction: %@", buf, 0xCu);
      }
      os_activity_scope_leave(&state);
      self = v46;
    }
    else
    {
      id v61 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "hf_prettyDescription");
        id v63 = v62 = self;
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v63;
        _os_log_impl(&dword_20B986000, v61, OS_LOG_TYPE_DEFAULT, "Execute actions request in implicit transaction: %@", (uint8_t *)&state, 0xCu);

        self = v62;
      }
    }
    unint64_t v51 = [v44 actionsToExecute];
    [v51 unionSet:v7];

    [v7 removeAllObjects];
    uint64_t v52 = [v44 onFinishGroup];
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = v8[155];
    v70[2] = __47__HFCharacteristicValueManager_executeActions___block_invoke_144;
    v70[3] = &unk_26408D450;
    id v71 = v44;
    id v72 = v43;
    id v53 = v43;
    id v54 = v44;
    dispatch_group_notify(v52, MEMORY[0x263EF83A0], v70);

    [(HFCharacteristicValueManager *)self commitTransactionWithReason:@"characteristicValueManagerImplicitTransaction"];
  }
  long long v55 = [(HFCharacteristicValueManager *)self transactionLock];
  [v55 unlock];

  if (![v6 count])
  {
    SEL v60 = [MEMORY[0x263F08690] currentHandler];
    [v60 handleFailureInMethod:a2 object:self file:@"HFCharacteristicValueManager.m" lineNumber:819 description:@"None of our cases were able to create a future for this request"];
  }
  long long v56 = [MEMORY[0x263F58190] combineAllFutures:v6];
  unint64_t v57 = [v56 flatMap:&__block_literal_global_148];

  return v57;
}

uint64_t __47__HFCharacteristicValueManager_executeActions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 actions];
}

id __47__HFCharacteristicValueManager_executeActions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x263F0E290];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 characteristic];
  id v6 = [v3 value];

  id v7 = (void *)[v4 initWithCharacteristic:v5 targetValue:v6];
  return v7;
}

id __47__HFCharacteristicValueManager_executeActions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    objc_opt_class();
    id v4 = v3;
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    if (v6)
    {
      id v7 = *(void **)(a1 + 32);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __47__HFCharacteristicValueManager_executeActions___block_invoke_4;
      v15[3] = &unk_264090490;
      id v8 = v4;
      id v16 = v8;
      uint64_t v9 = objc_msgSend(v7, "na_firstObjectPassingTest:", v15);
      uint64_t v10 = [v6 targetValue];
      uint64_t v11 = [v9 targetValue];
      int v12 = [v10 isEqual:v11];

      if (v12) {
        id v13 = v8;
      }
      else {
        id v13 = 0;
      }
    }
    else
    {
      id v13 = v4;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

uint64_t __47__HFCharacteristicValueManager_executeActions___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqual:a2];
}

void __47__HFCharacteristicValueManager_executeActions___block_invoke_142(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) actionsError];
  id v3 = *(void **)(a1 + 40);
  id v4 = (id)v2;
  if (v2) {
    [v3 finishWithError:v2];
  }
  else {
    [v3 finishWithNoResult];
  }
}

void __47__HFCharacteristicValueManager_executeActions___block_invoke_2_143(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) actionsError];
  id v3 = *(void **)(a1 + 40);
  id v4 = (id)v2;
  if (v2) {
    [v3 finishWithError:v2];
  }
  else {
    [v3 finishWithNoResult];
  }
}

void __47__HFCharacteristicValueManager_executeActions___block_invoke_144(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) actionsError];
  id v3 = *(void **)(a1 + 40);
  id v4 = (id)v2;
  if (v2) {
    [v3 finishWithError:v2];
  }
  else {
    [v3 finishWithNoResult];
  }
}

uint64_t __47__HFCharacteristicValueManager_executeActions___block_invoke_2_145()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

- (id)_openTransactionCompletionFuture
{
  uint64_t v2 = [(HFCharacteristicValueManager *)self openTransaction];
  if (!v2) {
    NSLog(&cfstr_NoOpenTransact.isa);
  }
  id v3 = objc_alloc_init(MEMORY[0x263F58190]);
  id v4 = [v2 onFinishGroup];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__HFCharacteristicValueManager__openTransactionCompletionFuture__block_invoke;
  v10[3] = &unk_26408D450;
  id v5 = v3;
  id v11 = v5;
  int v12 = v2;
  id v6 = v2;
  dispatch_group_notify(v4, MEMORY[0x263EF83A0], v10);

  id v7 = v12;
  id v8 = v5;

  return v8;
}

uint64_t __64__HFCharacteristicValueManager__openTransactionCompletionFuture__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

uint64_t __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 characteristic];
}

void __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) willWriteValuesForCharacteristics:*(void *)(a1 + 40)];
  }
}

void __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) logger];

  if (v4)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    id v5 = [*(id *)(a1 + 32) logger];
    id v6 = [v5 loggerActivity];
    os_activity_scope_enter(v6, &state);

    id v7 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Finished partial write", buf, 2u);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    long long v23 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_log_impl(&dword_20B986000, v23, OS_LOG_TYPE_DEFAULT, "Finished partial write", (uint8_t *)&state, 2u);
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v26;
    *(void *)&long long v10 = 138412290;
    long long v24 = v10;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        int v14 = *(void **)(*((void *)&v25 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend(*(id *)(a1 + 32), "logger", v24, (void)v25);

        if (v15)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          id v16 = [*(id *)(a1 + 32) logger];
          id v17 = [v16 loggerActivity];
          os_activity_scope_enter(v17, &state);

          long long v18 = HFLogForCategory(0x39uLL);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = objc_msgSend(v14, "hf_prettyDescription");
            *(_DWORD *)id buf = v24;
            id v30 = v19;
            _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "     %@", buf, 0xCu);
          }
          os_activity_scope_leave(&state);
        }
        else
        {
          uint64_t v20 = HFLogForCategory(0x39uLL);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = objc_msgSend(v14, "hf_prettyDescription");
            LODWORD(state.opaque[0]) = v24;
            *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v21;
            _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "     %@", (uint8_t *)&state, 0xCu);
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v22 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
      uint64_t v11 = v22;
    }
    while (v22);
  }

  [*(id *)(a1 + 40) addObjectsFromArray:v8];
}

void __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_176(id *a1, void *a2)
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 9);
  id v5 = [WeakRetained transactionLock];
  [v5 lock];

  id v6 = [a1[4] logger];

  if (v6)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    id v7 = [a1[4] logger];
    id v8 = [v7 loggerActivity];
    os_activity_scope_enter(v8, &state);

    uint64_t v9 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138412290;
      id v75 = v3;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Finished write with error: %@.", buf, 0xCu);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    long long v44 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v3;
      _os_log_impl(&dword_20B986000, v44, OS_LOG_TYPE_DEFAULT, "Finished write with error: %@.", (uint8_t *)&state, 0xCu);
    }
  }
  int v46 = v3;
  [a1[4] setOverallWriteError:v3];
  long long v10 = [MEMORY[0x263EFF9C0] set];
  [a1[4] setWriteCharacteristicRequests:v10];

  uint64_t v11 = [a1[4] writeFuturesKeyedByCharacteristicIdentifier];
  long long v48 = (void *)[v11 copy];

  uint64_t v12 = [WeakRetained transactionLock];
  [v12 unlock];

  unint64_t v51 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v52 = [MEMORY[0x263EFF9C0] set];
  id v50 = [MEMORY[0x263EFF9C0] set];
  uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v49 = a1;
  id v14 = a1[5];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v68 objects:v73 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v69 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        uint64_t v20 = [v19 request];
        uint64_t v21 = [v20 characteristic];

        if (v21)
        {
          uint64_t v22 = [v19 error];

          long long v23 = v52;
          if (v22)
          {
            long long v24 = [v19 error];
            long long v25 = [v21 uniqueIdentifier];
            [v51 setObject:v24 forKeyedSubscript:v25];

            long long v23 = v50;
          }
          [v23 addObject:v21];
          long long v26 = [v21 uniqueIdentifier];
          [v13 setObject:v19 forKeyedSubscript:v26];
        }
        else
        {
          NSLog(&cfstr_WriteresponesI.isa, v19);
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v68 objects:v73 count:16];
    }
    while (v16);
  }

  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_180;
  v61[3] = &unk_264090650;
  id v45 = v13;
  id v62 = v45;
  id v63 = v49[4];
  id v47 = v46;
  id v64 = v47;
  id v27 = v51;
  id v65 = v27;
  id v66 = v49[6];
  id v28 = v50;
  id v67 = v28;
  [v48 enumerateKeysAndObjectsUsingBlock:v61];
  char v29 = [WeakRetained transactionLock];
  [v29 lock];

  id v30 = [WeakRetained cachedWriteErrorsKeyedByCharacteristicIdentifier];
  [v30 addEntriesFromDictionary:v27];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v31 = v52;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v57 objects:v72 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v58 != v34) {
          objc_enumerationMutation(v31);
        }
        id v36 = *(void **)(*((void *)&v57 + 1) + 8 * j);
        long long v37 = [WeakRetained cachedWriteErrorsKeyedByCharacteristicIdentifier];
        long long v38 = [v36 uniqueIdentifier];
        [v37 removeObjectForKey:v38];

        id v39 = [WeakRetained cachedReadErrorsKeyedByCharacteristicIdentifier];
        id v40 = [v36 uniqueIdentifier];
        [v39 removeObjectForKey:v40];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v57 objects:v72 count:16];
    }
    while (v33);
  }

  id v41 = [WeakRetained transactionLock];
  [v41 unlock];

  if (v49[7] && ([v31 count] || objc_msgSend(v28, "count")))
  {
    id v42 = +[HFHomeKitDispatcher sharedDispatcher];
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_2_186;
    v53[3] = &unk_264090678;
    id v54 = v49[7];
    id v55 = v31;
    id v56 = v28;
    [v42 dispatchHomeObserverMessage:v53 sender:0];
  }
  id v43 = (void (**)(void))v49[8];
  if (v43) {
    v43[2]();
  }
}

void __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_180(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (v7)
  {
    [v6 finishWithResult:v7];
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) logger];

    if (v8)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      uint64_t v9 = [*(id *)(a1 + 40) logger];
      long long v10 = [v9 loggerActivity];
      os_activity_scope_enter(v10, &state);

      uint64_t v11 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id buf = 138412290;
        id v26 = v5;
        _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_ERROR, "Warning: No error or response for write request characteristic: %@", buf, 0xCu);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      uint64_t v19 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v5;
        _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_ERROR, "Warning: No error or response for write request characteristic: %@", (uint8_t *)&state, 0xCu);
      }
    }
    uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    uint64_t v13 = *(void **)(a1 + 48);
    if (v13)
    {
      id v14 = v13;

      uint64_t v12 = v14;
    }
    [*(id *)(a1 + 56) setObject:v12 forKeyedSubscript:v5];
    uint64_t v15 = *(void **)(a1 + 64);
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_181;
    long long v23 = &unk_264090468;
    id v16 = v5;
    id v24 = v16;
    uint64_t v17 = objc_msgSend(v15, "na_firstObjectPassingTest:", &v20);
    long long v18 = [v17 characteristic];

    if (!v18) {
      NSLog(&cfstr_NoCharacterist.isa, v16, v20, v21, v22, v23);
    }
    [*(id *)(a1 + 72) addObject:v18];
    [v6 finishWithError:v12];
  }
}

uint64_t __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_181(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristic];
  id v4 = [v3 uniqueIdentifier];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

void __91__HFCharacteristicValueManager__transactionLock_executeWriteTransaction_completionHandler___block_invoke_2_186(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:a1[4] didWriteValuesForCharacteristics:a1[5] failedCharacteristics:a1[6]];
  }
}

uint64_t __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_2_220(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_221(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v4 = [MEMORY[0x263EFFA08] set];
    [v5 home:WeakRetained didReadValuesForCharacteristics:v4 failedCharacteristics:*(void *)(a1 + 32)];
  }
}

void __90__HFCharacteristicValueManager__transactionLock_executeReadTransaction_completionHandler___block_invoke_2_222(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 1)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      uint64_t v4 = [v3 loggerActivity];
      os_activity_scope_enter(v4, &state);

      id v5 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        id v10 = WeakRetained;
        _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Cancelling in-flight read transaction: %@", (uint8_t *)&v9, 0xCu);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      id v8 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)WeakRetained;
        _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Cancelling in-flight read transaction: %@", (uint8_t *)&state, 0xCu);
      }
    }
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 103);
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

void __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) actionSetsToExecute];
    [v5 home:v3 willExecuteActionSets:v4];
  }
}

void __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) willWriteValuesForCharacteristics:*(void *)(a1 + 40)];
  }
}

void __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  id v5 = [WeakRetained transactionLock];
  [v5 lock];

  uint64_t v6 = [*(id *)(a1 + 32) logger];

  if (v6)
  {
    id v7 = objc_msgSend(*(id *)(a1 + 32), "logger", 0, 0);
    id v8 = [v7 loggerActivity];
    os_activity_scope_enter(v8, &v20);

    int v9 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)id buf = 138412546;
      uint64_t v22 = v10;
      __int16 v23 = 2112;
      id v24 = v3;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Finished action set execution: %@. Error: %@", buf, 0x16u);
    }

    os_activity_scope_leave(&v20);
  }
  else
  {
    long long v18 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 40);
      *(_DWORD *)id buf = 138412546;
      uint64_t v22 = v19;
      __int16 v23 = 2112;
      id v24 = v3;
      _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "Finished action set execution: %@. Error: %@", buf, 0x16u);
    }
  }
  uint64_t v11 = [*(id *)(a1 + 32) actionSetsToExecute];
  [v11 removeObject:*(void *)(a1 + 40)];

  id v12 = objc_loadWeakRetained((id *)(a1 + 96));
  uint64_t v13 = [v12 transactionLock];
  [v13 unlock];

  id v14 = objc_msgSend(*(id *)(a1 + 40), "hf_affectedCharacteristics");
  if (!v14)
  {
    id v14 = [MEMORY[0x263EFFA08] set];
    if (v3) {
      goto LABEL_7;
    }
LABEL_9:
    [*(id *)(a1 + 72) unionSet:v14];
    uint64_t v17 = (id *)(a1 + 80);
    goto LABEL_10;
  }
  if (!v3) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v15 = *(void **)(a1 + 48);
  id v16 = [*(id *)(a1 + 40) uniqueIdentifier];
  [v15 setObject:v3 forKeyedSubscript:v16];

  [*(id *)(a1 + 56) unionSet:v14];
  uint64_t v17 = (id *)(a1 + 64);
LABEL_10:
  [*v17 addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 88));
}

uint64_t __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_225(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 104);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  uint64_t v4 = [WeakRetained transactionLock];
  [v4 lock];

  [*(id *)(a1 + 32) setActionSetErrorsKeyedByUUID:*(void *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 48) cachedExecutionErrorsKeyedByActionSetIdentifier];
  [v5 addEntriesFromDictionary:*(void *)(a1 + 40)];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
        id v12 = [*(id *)(a1 + 48) cachedExecutionErrorsKeyedByActionSetIdentifier];
        uint64_t v13 = [v11 uniqueIdentifier];
        [v12 removeObjectForKey:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v8);
  }

  id v14 = objc_loadWeakRetained(v2);
  uint64_t v15 = [v14 transactionLock];
  [v15 unlock];

  if (*(void *)(a1 + 64))
  {
    if ([*(id *)(a1 + 56) count] || objc_msgSend(*(id *)(a1 + 72), "count"))
    {
      uint64_t v19 = +[HFHomeKitDispatcher sharedDispatcher];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_2_226;
      v26[3] = &unk_264090678;
      id v27 = *(id *)(a1 + 64);
      id v28 = *(id *)(a1 + 56);
      id v29 = *(id *)(a1 + 72);
      [v19 dispatchHomeObserverMessage:v26 sender:0];
    }
    if (*(void *)(a1 + 64) && ([*(id *)(a1 + 80) count] || objc_msgSend(*(id *)(a1 + 88), "count")))
    {
      os_activity_scope_state_s v20 = +[HFHomeKitDispatcher sharedDispatcher];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_3_229;
      v22[3] = &unk_264090678;
      id v23 = *(id *)(a1 + 64);
      id v24 = *(id *)(a1 + 80);
      id v25 = *(id *)(a1 + 88);
      [v20 dispatchHomeObserverMessage:v22 sender:0];
    }
  }
  uint64_t result = *(void *)(a1 + 96);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, v16, v17, v18);
  }
  return result;
}

void __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_2_226(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:a1[4] didExecuteActionSets:a1[5] failedActionSets:a1[6]];
  }
}

void __95__HFCharacteristicValueManager__transactionLock_executeActionSetTransaction_completionHandler___block_invoke_3_229(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:a1[4] didWriteValuesForCharacteristics:a1[5] failedCharacteristics:a1[6]];
  }
}

void __93__HFCharacteristicValueManager__transactionLock_executeActionsTransaction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) willWriteValuesForCharacteristics:*(void *)(a1 + 40)];
  }
}

void __93__HFCharacteristicValueManager__transactionLock_executeActionsTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v5 = [WeakRetained transactionLock];
  [v5 lock];

  id v6 = [*(id *)(a1 + 32) logger];

  if (v6)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    uint64_t v7 = [*(id *)(a1 + 32) logger];
    uint64_t v8 = [v7 loggerActivity];
    os_activity_scope_enter(v8, &state);

    uint64_t v9 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)id buf = 138412546;
      uint64_t v29 = v10;
      __int16 v30 = 2112;
      id v31 = v3;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Finished actions execution: %@. Error: %@", buf, 0x16u);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    uint64_t v21 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 40);
      *(_DWORD *)id buf = 138412546;
      uint64_t v29 = v22;
      __int16 v30 = 2112;
      id v31 = v3;
      _os_log_impl(&dword_20B986000, v21, OS_LOG_TYPE_DEFAULT, "Finished actions execution: %@. Error: %@", buf, 0x16u);
    }
  }
  uint64_t v11 = [*(id *)(a1 + 32) actionsToExecute];
  [v11 minusSet:*(void *)(a1 + 40)];

  if (v3) {
    [*(id *)(a1 + 32) setActionsError:v3];
  }
  id v12 = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v13 = [v12 transactionLock];
  [v13 unlock];

  if (*(void *)(a1 + 48) && [*(id *)(a1 + 56) count])
  {
    if (v3)
    {
      id v14 = [MEMORY[0x263EFF9C0] set];
      id v15 = *(id *)(a1 + 56);
    }
    else
    {
      id v14 = *(id *)(a1 + 56);
      id v15 = [MEMORY[0x263EFF9C0] set];
    }
    uint64_t v16 = v15;
    uint64_t v17 = +[HFHomeKitDispatcher sharedDispatcher];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __93__HFCharacteristicValueManager__transactionLock_executeActionsTransaction_completionHandler___block_invoke_230;
    v23[3] = &unk_264090678;
    id v24 = *(id *)(a1 + 48);
    id v25 = v14;
    id v26 = v16;
    id v18 = v16;
    id v19 = v14;
    [v17 dispatchHomeObserverMessage:v23 sender:0];
  }
  uint64_t v20 = *(void *)(a1 + 64);
  if (v20) {
    (*(void (**)(void))(v20 + 16))();
  }
}

void __93__HFCharacteristicValueManager__transactionLock_executeActionsTransaction_completionHandler___block_invoke_230(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:a1[4] didWriteValuesForCharacteristics:a1[5] failedCharacteristics:a1[6]];
  }
}

- (void)invalidateCachedValueForCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [(HFCharacteristicValueManager *)self transactionLock];
  [v5 lock];

  id v6 = [(HFCharacteristicValueManager *)self characteristicsWithCachedValues];
  [v6 removeObject:v4];

  id v7 = [(HFCharacteristicValueManager *)self transactionLock];
  [v7 unlock];
}

- (void)invalidateCachedErrorForCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [(HFCharacteristicValueManager *)self transactionLock];
  [v5 lock];

  id v6 = [(HFCharacteristicValueManager *)self cachedReadErrorsKeyedByCharacteristicIdentifier];
  id v7 = [v4 uniqueIdentifier];
  [v6 removeObjectForKey:v7];

  uint64_t v8 = [(HFCharacteristicValueManager *)self cachedWriteErrorsKeyedByCharacteristicIdentifier];
  uint64_t v9 = [v4 uniqueIdentifier];

  [v8 removeObjectForKey:v9];
  id v10 = [(HFCharacteristicValueManager *)self transactionLock];
  [v10 unlock];
}

- (void)invalidateCachedValuesForAccessory:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HFCharacteristicValueManager *)self transactionLock];
  [v5 lock];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v19 = v4;
  id obj = [v4 services];
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v11 = [v10 characteristics];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v22;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * v15);
              uint64_t v17 = [(HFCharacteristicValueManager *)self characteristicsWithCachedValues];
              [v17 removeObject:v16];

              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  id v18 = [(HFCharacteristicValueManager *)self transactionLock];
  [v18 unlock];
}

- (void)invalidateCachedErrorForExecutionOfActionSet:(id)a3
{
  id v4 = a3;
  id v5 = [(HFCharacteristicValueManager *)self transactionLock];
  [v5 lock];

  uint64_t v6 = [(HFCharacteristicValueManager *)self cachedExecutionErrorsKeyedByActionSetIdentifier];
  uint64_t v7 = [v4 uniqueIdentifier];

  [v6 setObject:0 forKeyedSubscript:v7];
  id v8 = [(HFCharacteristicValueManager *)self transactionLock];
  [v8 unlock];
}

- (void)invalidateAllCachedErrors
{
  id v3 = [(HFCharacteristicValueManager *)self transactionLock];
  [v3 lock];

  id v4 = [(HFCharacteristicValueManager *)self cachedReadErrorsKeyedByCharacteristicIdentifier];
  [v4 removeAllObjects];

  id v5 = [(HFCharacteristicValueManager *)self cachedWriteErrorsKeyedByCharacteristicIdentifier];
  [v5 removeAllObjects];

  uint64_t v6 = [(HFCharacteristicValueManager *)self cachedExecutionErrorsKeyedByActionSetIdentifier];
  [v6 removeAllObjects];

  id v7 = [(HFCharacteristicValueManager *)self transactionLock];
  [v7 unlock];
}

- (void)cancelInFlightReadRequests
{
  id v3 = [(HFCharacteristicValueManager *)self transactionLock];
  [v3 lock];

  id v6 = [(HFCharacteristicValueManager *)self inFlightReadCancelationToken];
  id v4 = objc_alloc_init(MEMORY[0x263F58168]);
  [(HFCharacteristicValueManager *)self setInFlightReadCancelationToken:v4];

  id v5 = [(HFCharacteristicValueManager *)self transactionLock];
  [v5 unlock];

  [v6 cancel];
}

void __61__HFCharacteristicValueManager_readValuesForCharacteristics___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08690] currentHandler];
  [v2 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"HFCharacteristicValueManager.m", 1688, @"-[HFCharacteristicValueManager should never return a future that fails; it should always return a future that finishes with a HFCharacteristicReadResponse, with the error property set as needed" object file lineNumber description];
}

- (id)writeValuesForCharacteristics:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allCharacteristics];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    [(HFCharacteristicValueManager *)self beginTransactionWithReason:@"characteristicValueManagerBatchWriteTransaction"];
    id v7 = [v4 allCharacteristics];
    id v8 = [v7 allObjects];

    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __62__HFCharacteristicValueManager_writeValuesForCharacteristics___block_invoke;
    uint64_t v17 = &unk_2640908C8;
    id v18 = v4;
    id v19 = self;
    uint64_t v9 = objc_msgSend(v8, "na_map:", &v14);
    id v10 = (void *)MEMORY[0x263F58190];
    uint64_t v11 = objc_msgSend(MEMORY[0x263F581B8], "mainThreadScheduler", v14, v15, v16, v17);
    uint64_t v12 = [v10 combineAllFutures:v9 ignoringErrors:0 scheduler:v11];

    [(HFCharacteristicValueManager *)self commitTransactionWithReason:@"characteristicValueManagerBatchWriteTransaction"];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v12;
}

id __62__HFCharacteristicValueManager_writeValuesForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForCharacteristic:v4];
  uint64_t v6 = [*(id *)(a1 + 40) writeValue:v5 forCharacteristic:v4];

  return v6;
}

- (HFCharacteristicValueWriter)valueWriter
{
  return self->_valueWriter;
}

- (void)setTestingOverrideLoadingStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstReadCompleteFuture, 0);
  objc_storeStrong((id *)&self->_testingOverrideLoadingStates, 0);
  objc_storeStrong((id *)&self->_readsCompleteLogger, 0);
  objc_storeStrong((id *)&self->_inFlightReadCancelationToken, 0);
  objc_storeStrong((id *)&self->_cacheManager, 0);
  objc_storeStrong((id *)&self->_cachedExecutionErrorsKeyedByActionSetIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedWriteErrorsKeyedByCharacteristicIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedReadErrorsKeyedByCharacteristicIdentifier, 0);
  objc_storeStrong((id *)&self->_characteristicsWithCachedValues, 0);
  objc_storeStrong((id *)&self->_mutableAllReadCharacteristics, 0);
  objc_storeStrong((id *)&self->_transactionLock, 0);
  objc_storeStrong((id *)&self->_completionHandlersForReadTransactionsToExecuteOnNextRunLoop, 0);
  objc_storeStrong((id *)&self->_readTransactionsToExecuteOnNextRunLoop, 0);
  objc_storeStrong((id *)&self->_runningTransactions, 0);
  objc_storeStrong((id *)&self->_openTransaction, 0);
  objc_storeStrong((id *)&self->_valueWriter, 0);
  objc_storeStrong((id *)&self->_valueReader, 0);
}

- (void)setCachedReadError:(id)a3 forCharacteristic:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFCharacteristicValueManager *)self transactionLock];
  [v8 lock];

  uint64_t v9 = [(HFCharacteristicValueManager *)self cachedReadErrorsKeyedByCharacteristicIdentifier];
  id v10 = [v6 uniqueIdentifier];

  [v9 setObject:v7 forKey:v10];
  id v11 = [(HFCharacteristicValueManager *)self transactionLock];
  [v11 unlock];
}

- (void)setCachedWriteError:(id)a3 forCharacteristic:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFCharacteristicValueManager *)self transactionLock];
  [v8 lock];

  uint64_t v9 = [(HFCharacteristicValueManager *)self cachedWriteErrorsKeyedByCharacteristicIdentifier];
  id v10 = [v6 uniqueIdentifier];

  [v9 setObject:v7 forKey:v10];
  id v11 = [(HFCharacteristicValueManager *)self transactionLock];
  [v11 unlock];
}

- (void)setOverrideLoadingState:(unint64_t)a3 forCharacteristic:(id)a4
{
  id v6 = a4;
  id v7 = [(HFCharacteristicValueManager *)self testingOverrideLoadingStates];

  if (!v7)
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
    [(HFCharacteristicValueManager *)self setTestingOverrideLoadingStates:v8];
  }
  id v11 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v9 = [(HFCharacteristicValueManager *)self testingOverrideLoadingStates];
  id v10 = [v6 uniqueIdentifier];

  [v9 setObject:v11 forKeyedSubscript:v10];
}

- (void)clearOverrideLoadingStates
{
  id v2 = [(HFCharacteristicValueManager *)self testingOverrideLoadingStates];
  [v2 removeAllObjects];
}

@end