@interface FIActivitySettingsController
- (BOOL)_commitValue:(id)a3 forPropertyKey:(id)a4 error:(id *)a5;
- (BOOL)_hasDirtyPropertyForPropertyKey:(id)a3;
- (BOOL)_logAndNilError:(id *)a3 operationDescription:(id)a4;
- (BOOL)commmitWithError:(id *)a3;
- (FIActivitySettingsController)init;
- (FIActivitySettingsController)initWithHealthStore:(id)a3;
- (HKQuantity)height;
- (HKQuantity)leanBodyMass;
- (HKQuantity)weight;
- (NSDate)dateOfBirth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)updateHandler;
- (int64_t)biologicalSex;
- (int64_t)wheelchairUse;
- (unint64_t)experienceType;
- (void)_setUncommitedValue:(id)a3 forPropertyKey:(id)a4;
- (void)leanBodyMass;
- (void)populateExistingCharacteristics;
- (void)setBiologicalSex:(int64_t)a3;
- (void)setDateOfBirth:(id)a3;
- (void)setHeight:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)setWeight:(id)a3;
- (void)setWheelchairUse:(int64_t)a3;
@end

@implementation FIActivitySettingsController

- (FIActivitySettingsController)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F0A410]);
  v4 = [(FIActivitySettingsController *)self initWithHealthStore:v3];

  return v4;
}

- (FIActivitySettingsController)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FIActivitySettingsController;
  v6 = [(FIActivitySettingsController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    uint64_t v8 = objc_opt_new();
    dirtyPropertiesMap = v7->_dirtyPropertiesMap;
    v7->_dirtyPropertiesMap = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (void)setDateOfBirth:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfBirth, a3);
  id v5 = a3;
  [(FIActivitySettingsController *)self _setUncommitedValue:v5 forPropertyKey:@"dateOfBirth"];
}

- (void)setHeight:(id)a3
{
  objc_storeStrong((id *)&self->_height, a3);
  id v5 = a3;
  [(FIActivitySettingsController *)self _setUncommitedValue:v5 forPropertyKey:@"height"];
}

- (void)setWeight:(id)a3
{
  objc_storeStrong((id *)&self->_weight, a3);
  id v5 = a3;
  [(FIActivitySettingsController *)self _setUncommitedValue:self->_weight forPropertyKey:@"weight"];
}

- (void)setBiologicalSex:(int64_t)a3
{
  self->_biologicalSex = a3;
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(FIActivitySettingsController *)self _setUncommitedValue:v4 forPropertyKey:@"biologicalSexObject"];
}

- (void)setWheelchairUse:(int64_t)a3
{
  self->_wheelchairUse = a3;
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(FIActivitySettingsController *)self _setUncommitedValue:v4 forPropertyKey:@"wheelchairUse"];
}

- (BOOL)_hasDirtyPropertyForPropertyKey:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_dirtyPropertiesMap objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_setUncommitedValue:(id)a3 forPropertyKey:(id)a4
{
  [(NSMutableDictionary *)self->_dirtyPropertiesMap setObject:a3 forKeyedSubscript:a4];
  id updateHandler = self->_updateHandler;
  if (updateHandler)
  {
    v6 = (void (*)(void))*((void *)updateHandler + 2);
    v6();
  }
}

- (BOOL)_commitValue:(id)a3 forPropertyKey:(id)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  _HKInitializeLogging();
  v9 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_21C74B000, v9, OS_LOG_TYPE_DEFAULT, "Storing property %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__4;
  v49 = __Block_byref_object_dispose__4;
  id v50 = 0;
  v44[0] = @"height";
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke;
  aBlock[3] = &unk_26441CD60;
  aBlock[4] = self;
  id v10 = v7;
  id v42 = v10;
  p_long long buf = &buf;
  objc_super v11 = _Block_copy(aBlock);
  v45[0] = v11;
  v44[1] = @"weight";
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke_2;
  v38[3] = &unk_26441CD60;
  v38[4] = self;
  id v12 = v10;
  id v39 = v12;
  v40 = &buf;
  v13 = _Block_copy(v38);
  v45[1] = v13;
  v44[2] = @"dateOfBirth";
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke_3;
  v34[3] = &unk_26441CD60;
  id v14 = v12;
  id v35 = v14;
  v36 = self;
  v37 = &buf;
  v15 = _Block_copy(v34);
  v45[2] = v15;
  v44[3] = @"biologicalSexObject";
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke_4;
  v30[3] = &unk_26441CD60;
  id v16 = v14;
  id v31 = v16;
  v32 = self;
  v33 = &buf;
  v17 = _Block_copy(v30);
  v45[3] = v17;
  v44[4] = @"wheelchairUse";
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke_5;
  v26[3] = &unk_26441CD60;
  id v18 = v16;
  id v27 = v18;
  v28 = self;
  v29 = &buf;
  v19 = _Block_copy(v26);
  v45[4] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:5];

  uint64_t v21 = [v20 objectForKeyedSubscript:v8];
  v22 = (void *)v21;
  if (!v21)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"No action defined for unknown property key %@", v8 format];
    goto LABEL_10;
  }
  (*(void (**)(uint64_t))(v21 + 16))(v21);
  if (!*(void *)(*((void *)&buf + 1) + 40))
  {
LABEL_10:
    BOOL v23 = 1;
    goto LABEL_11;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
    -[FIActivitySettingsController _commitValue:forPropertyKey:error:]();
  }
  BOOL v23 = 0;
  if (a5) {
    *a5 = *(id *)(*((void *)&buf + 1) + 40);
  }
LABEL_11:

  _Block_object_dispose(&buf, 8);
  return v23;
}

void __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  v2 = *(void **)(a1[4] + 8);
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  [v2 _setHeightCharacteristicQuantity:v1 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
}

void __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke_2(void *a1)
{
  uint64_t v1 = a1[5];
  v2 = *(void **)(a1[4] + 8);
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  [v2 _setBodyMassCharacteristicQuantity:v1 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
}

void __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke_3(void *a1)
{
  v2 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_canonicalDateOfBirthDateComponentsWithDate:", a1[4]);
  uint64_t v3 = *(void **)(a1[5] + 8);
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  [v3 _setDateOfBirthComponents:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
}

void __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) integerValue];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  [v3 _setBiologicalSex:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
}

void __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) integerValue];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  [v3 _setWheelchairUse:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
}

- (void)populateExistingCharacteristics
{
  healthStore = self->_healthStore;
  id v37 = 0;
  uint64_t v4 = [(HKHealthStore *)healthStore dateOfBirthComponentsWithError:&v37];
  id v5 = v37;
  if (v4)
  {
    v6 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
    id v7 = [v6 dateFromComponents:v4];
    dateOfBirth = self->_dateOfBirth;
    self->_dateOfBirth = v7;
  }
  id v36 = v5;
  [(FIActivitySettingsController *)self _logAndNilError:&v36 operationDescription:@"fetch birth date"];
  id v9 = v36;

  id v10 = self->_healthStore;
  id v35 = v9;
  objc_super v11 = [(HKHealthStore *)v10 _heightCharacteristicQuantityWithError:&v35];
  id v12 = v35;

  height = self->_height;
  self->_height = v11;

  id v34 = v12;
  [(FIActivitySettingsController *)self _logAndNilError:&v34 operationDescription:@"fetch height"];
  id v14 = v34;

  v15 = self->_healthStore;
  id v33 = v14;
  id v16 = [(HKHealthStore *)v15 _bodyMassCharacteristicQuantityWithError:&v33];
  id v17 = v33;

  weight = self->_weight;
  self->_weight = v16;

  id v32 = v17;
  [(FIActivitySettingsController *)self _logAndNilError:&v32 operationDescription:@"fetch weight"];
  id v19 = v32;

  v20 = self->_healthStore;
  id v31 = v19;
  uint64_t v21 = [(HKHealthStore *)v20 biologicalSexWithError:&v31];
  id v22 = v31;

  self->_biologicalSex = [v21 biologicalSex];
  id v30 = v22;
  [(FIActivitySettingsController *)self _logAndNilError:&v30 operationDescription:@"fetch sex"];
  id v23 = v30;

  v24 = self->_healthStore;
  id v29 = v23;
  v25 = [(HKHealthStore *)v24 wheelchairUseWithError:&v29];
  id v26 = v29;

  self->_wheelchairUse = [v25 wheelchairUse];
  id v28 = v26;
  [(FIActivitySettingsController *)self _logAndNilError:&v28 operationDescription:@"fetch wheelchair use"];
  id v27 = v28;

  [(NSMutableDictionary *)self->_dirtyPropertiesMap removeAllObjects];
  if (!self->_wheelchairUse) {
    [(FIActivitySettingsController *)self setWheelchairUse:1];
  }
}

- (BOOL)_logAndNilError:(id *)a3 operationDescription:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    BOOL v6 = *a3 == 0;
    if (*a3)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
        -[FIActivitySettingsController _logAndNilError:operationDescription:]();
      }
    }
    *a3 = 0;
  }
  else
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
      -[FIActivitySettingsController _logAndNilError:operationDescription:]((uint64_t)v5, v7);
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)commmitWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(NSMutableDictionary *)self->_dirtyPropertiesMap allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      uint64_t v10 = 0;
      objc_super v11 = v8;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        v13 = [(NSMutableDictionary *)self->_dirtyPropertiesMap objectForKeyedSubscript:v12];
        id v16 = v11;
        [(FIActivitySettingsController *)self _commitValue:v13 forPropertyKey:v12 error:&v16];
        id v8 = v16;

        if (a3 && v8)
        {
          id v8 = v8;
          *a3 = v8;

          BOOL v14 = 0;
          goto LABEL_14;
        }
        ++v10;
        objc_super v11 = v8;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v8 = 0;
  }

  [(NSMutableDictionary *)self->_dirtyPropertiesMap removeAllObjects];
  BOOL v14 = 1;
LABEL_14:

  return v14;
}

- (unint64_t)experienceType
{
  unint64_t result = FIExperienceTypeWithHealthStore(self->_healthStore);
  if (result <= 1) {
    return 1;
  }
  return result;
}

- (HKQuantity)leanBodyMass
{
  v26[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:*MEMORY[0x263F09E68]];
  uint64_t v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F09F88] ascending:0];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  id v6 = objc_alloc(MEMORY[0x263F0A6E0]);
  v26[0] = v4;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __44__FIActivitySettingsController_leanBodyMass__block_invoke;
  long long v17 = &unk_26441CD88;
  long long v19 = &v20;
  id v8 = v5;
  long long v18 = v8;
  uint64_t v9 = (void *)[v6 initWithSampleType:v3 predicate:0 limit:1 sortDescriptors:v7 resultsHandler:&v14];

  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v9, v14, v15, v16, v17);
  dispatch_time_t v10 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v8, v10))
  {
    _HKInitializeLogging();
    objc_super v11 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
      -[FIActivitySettingsController leanBodyMass](v11);
    }
  }
  id v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return (HKQuantity *)v12;
}

intptr_t __44__FIActivitySettingsController_leanBodyMass__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 lastObject];
  uint64_t v5 = [v4 quantity];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[FIActivitySettingsController alloc] initWithHealthStore:self->_healthStore];
  objc_storeStrong((id *)&v4->_dateOfBirth, self->_dateOfBirth);
  objc_storeStrong((id *)&v4->_height, self->_height);
  objc_storeStrong((id *)&v4->_weight, self->_weight);
  v4->_biologicalSex = self->_biologicalSex;
  v4->_wheelchairUse = self->_wheelchairUse;
  uint64_t v5 = [(NSMutableDictionary *)self->_dirtyPropertiesMap mutableCopy];
  dirtyPropertiesMap = v4->_dirtyPropertiesMap;
  v4->_dirtyPropertiesMap = (NSMutableDictionary *)v5;

  uint64_t v7 = _Block_copy(self->_updateHandler);
  id updateHandler = v4->_updateHandler;
  v4->_id updateHandler = v7;

  return v4;
}

- (NSDate)dateOfBirth
{
  return self->_dateOfBirth;
}

- (HKQuantity)height
{
  return self->_height;
}

- (HKQuantity)weight
{
  return self->_weight;
}

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (int64_t)wheelchairUse
{
  return self->_wheelchairUse;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_weight, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_dateOfBirth, 0);
  objc_storeStrong((id *)&self->_dirtyPropertiesMap, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)_commitValue:forPropertyKey:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_21C74B000, v0, v1, "[HealthSettings] Failed to store characteristic %@ with error %{public}@");
}

- (void)_logAndNilError:(uint64_t)a1 operationDescription:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C74B000, a2, OS_LOG_TYPE_ERROR, "[HealthSettings] Internal error: no error argument passed for operation %{public}@, assuming the worst", (uint8_t *)&v2, 0xCu);
}

- (void)_logAndNilError:operationDescription:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_21C74B000, v0, v1, "[HealthSettings] Failed operation: %{public}@ with error %{public}@");
}

- (void)leanBodyMass
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_21C74B000, log, OS_LOG_TYPE_ERROR, "[HealthSettings] Fetching lean body mass timed out", v1, 2u);
}

@end