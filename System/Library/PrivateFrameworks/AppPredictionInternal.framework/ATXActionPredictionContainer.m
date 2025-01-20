@interface ATXActionPredictionContainer
- (ATXActionPredictionContainer)initWithMinimalSlotResolutionParameters:(id)a3 score:(float)a4 actionKey:(id)a5;
- (ATXActionPredictionContainer)initWithScoredAction:(id)a3 slotSet:(id)a4 actionKey:(id)a5;
- (ATXActionPredictionContainer)initWithScoredAction:(id)a3 slotSet:(id)a4 minimalSlotResolutionParameters:(id)a5 score:(float)a6 actionKey:(id)a7 predictionItem:(ATXPredictionItem *)a8;
- (ATXPredictionItem)predictionItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToActionPredictionContainer:(id)a3;
- (NSString)actionKey;
- (float)score;
- (id).cxx_construct;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)scoredAction;
- (id)slotSet;
- (unint64_t)hash;
- (void)initializeScoredActionAndSlotSet;
- (void)setPredictionItem:(ATXPredictionItem *)a3;
- (void)setScore:(float)a3;
@end

@implementation ATXActionPredictionContainer

- (ATXActionPredictionContainer)initWithScoredAction:(id)a3 slotSet:(id)a4 minimalSlotResolutionParameters:(id)a5 score:(float)a6 actionKey:(id)a7 predictionItem:(ATXPredictionItem *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v25 = a5;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)ATXActionPredictionContainer;
  v17 = [(ATXActionPredictionContainer *)&v26 init];
  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F93B70]);
    v19 = [ATXGuardedActionPredictionContainerData alloc];
    *(float *)&double v20 = a6;
    v21 = [(ATXGuardedActionPredictionContainerData *)v19 initWithScoredAction:v14 slotSet:v15 score:v20];
    uint64_t v22 = [v18 initWithGuardedData:v21];
    lock = v17->_lock;
    v17->_lock = (_PASLock *)v22;

    objc_storeStrong((id *)&v17->_parameters, a5);
    objc_storeStrong((id *)&v17->_actionKey, a7);
    objc_storeStrong((id *)&v17->_predictionItem.key, a8->key);
    memcpy(&v17->_predictionItem.actionHash, &a8->actionHash, 0xCD2uLL);
  }

  return v17;
}

- (ATXActionPredictionContainer)initWithScoredAction:(id)a3 slotSet:(id)a4 actionKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 score];
  v14[0] = 0;
  float v15 = -31337.0;
  __int16 v16 = 0;
  for (uint64_t i = 16; i != 3284; i += 4)
    *(float *)((char *)v14 + i) = -31337.0;
  if (self)
  {
    v12 = -[ATXActionPredictionContainer initWithScoredAction:slotSet:minimalSlotResolutionParameters:score:actionKey:predictionItem:](self, "initWithScoredAction:slotSet:minimalSlotResolutionParameters:score:actionKey:predictionItem:", v8, v9, 0, v10, v14);
  }
  else
  {

    v12 = 0;
  }

  return v12;
}

- (ATXActionPredictionContainer)initWithMinimalSlotResolutionParameters:(id)a3 score:(float)a4 actionKey:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  HIDWORD(v10) = -1059153344;
  v13[0] = 0;
  float v14 = -31337.0;
  __int16 v15 = 0;
  for (uint64_t i = 16; i != 3284; i += 4)
    *(float *)((char *)v13 + i) = -31337.0;
  if (self)
  {
    *(float *)&double v10 = a4;
    self = [(ATXActionPredictionContainer *)self initWithScoredAction:0 slotSet:0 minimalSlotResolutionParameters:v8 score:v9 actionKey:v13 predictionItem:v10];
  }
  else
  {
  }
  return self;
}

- (void)setScore:(float)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__ATXActionPredictionContainer_setScore___block_invoke;
  v4[3] = &__block_descriptor_36_e49_v16__0__ATXGuardedActionPredictionContainerData_8l;
  float v5 = a3;
  [(_PASLock *)lock runWithLockAcquired:v4];
}

void *__41__ATXActionPredictionContainer_setScore___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  result = *(void **)(a2 + 8);
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  if (result) {
    return (void *)[result setScore:a3];
  }
  *(_DWORD *)(a2 + 24) = LODWORD(a3);
  return result;
}

- (float)score
{
  uint64_t v6 = 0;
  v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__ATXActionPredictionContainer_score__block_invoke;
  v5[3] = &unk_1E68AF560;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__ATXActionPredictionContainer_score__block_invoke(uint64_t a1, void *a2)
{
  float v3 = a2;
  v4 = (void *)v3[1];
  if (v4)
  {
    v7 = v3;
    v4 = (void *)[v4 score];
    float v3 = v7;
  }
  else
  {
    int v5 = *((_DWORD *)v3 + 6);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  return MEMORY[0x1F41817F8](v4, v3);
}

- (void)initializeScoredActionAndSlotSet
{
  float v3 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  v4 = [(ATXMinimalSlotResolutionParameters *)self->_parameters actionAndSlotSet];
  int v5 = [v4 first];
  uint64_t v6 = [v4 second];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 parameters];
    int v9 = (void *)[v5 copyWithParameterWhitelist:v8];

    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v9 = v5;
  if (v5)
  {
LABEL_5:
    lock = self->_lock;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__ATXActionPredictionContainer_initializeScoredActionAndSlotSet__block_invoke;
    v11[3] = &unk_1E68AF588;
    id v12 = v9;
    id v13 = v7;
    [(_PASLock *)lock runWithLockAcquired:v11];
  }
LABEL_6:
}

void __64__ATXActionPredictionContainer_initializeScoredActionAndSlotSet__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F4B2B0]);
  LODWORD(v4) = *((_DWORD *)v7 + 6);
  uint64_t v5 = [v3 initWithPredictedItem:*(void *)(a1 + 32) score:v4];
  uint64_t v6 = (void *)*((void *)v7 + 1);
  *((void *)v7 + 1) = v5;

  objc_storeStrong((id *)v7 + 2, *(id *)(a1 + 40));
}

- (id)scoredAction
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__37;
  double v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__ATXActionPredictionContainer_scoredAction__block_invoke;
  v5[3] = &unk_1E68AF5B0;
  v5[4] = self;
  void v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__ATXActionPredictionContainer_scoredAction__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (void *)v3[1];
  uint64_t v5 = v3;
  if (!v4)
  {
    [*(id *)(a1 + 32) initializeScoredActionAndSlotSet];
    double v4 = (void *)v5[1];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
}

- (id)slotSet
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__37;
  double v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__ATXActionPredictionContainer_slotSet__block_invoke;
  v5[3] = &unk_1E68AF5B0;
  v5[4] = self;
  void v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__ATXActionPredictionContainer_slotSet__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (void *)v3[2];
  uint64_t v5 = v3;
  if (!v4)
  {
    [*(id *)(a1 + 32) initializeScoredActionAndSlotSet];
    double v4 = (void *)v5[2];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = +[ATXActionPredictionContainer allocWithZone:a3];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  objc_super v26 = __Block_byref_object_copy__37;
  v27 = __Block_byref_object_dispose__37;
  id v28 = 0;
  lock = self->_lock;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __45__ATXActionPredictionContainer_copyWithZone___block_invoke;
  v22[3] = &unk_1E68AF560;
  v22[4] = &v23;
  [(_PASLock *)lock runWithLockAcquired:v22];
  id v6 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  id v7 = (void *)[v6 copy];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  objc_super v26 = __Block_byref_object_copy__37;
  v27 = __Block_byref_object_dispose__37;
  id v28 = 0;
  uint64_t v8 = self->_lock;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __45__ATXActionPredictionContainer_copyWithZone___block_invoke_2;
  v21[3] = &unk_1E68AF560;
  v21[4] = &v23;
  [(_PASLock *)v8 runWithLockAcquired:v21];
  id v9 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  double v10 = (void *)[v9 copy];
  id v11 = (void *)[(ATXMinimalSlotResolutionParameters *)self->_parameters copy];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  LODWORD(v26) = 0;
  id v12 = self->_lock;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __45__ATXActionPredictionContainer_copyWithZone___block_invoke_3;
  v20[3] = &unk_1E68AF560;
  v20[4] = &v23;
  [(_PASLock *)v12 runWithLockAcquired:v20];
  int v13 = *((_DWORD *)v24 + 6);
  _Block_object_dispose(&v23, 8);
  actionKey = self->_actionKey;
  __int16 v15 = self->_predictionItem.key;
  id v18 = v15;
  memcpy(v19, &self->_predictionItem.actionHash, sizeof(v19));
  if (v4)
  {
    LODWORD(v16) = v13;
    double v4 = [(ATXActionPredictionContainer *)v4 initWithScoredAction:v7 slotSet:v10 minimalSlotResolutionParameters:v11 score:actionKey actionKey:&v18 predictionItem:v16];
  }
  else
  {
  }
  return v4;
}

void __45__ATXActionPredictionContainer_copyWithZone___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __45__ATXActionPredictionContainer_copyWithZone___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

float __45__ATXActionPredictionContainer_copyWithZone___block_invoke_3(uint64_t a1, uint64_t a2)
{
  float result = *(float *)(a2 + 24);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)copy
{
  id v3 = [ATXActionPredictionContainer alloc];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__37;
  objc_super v26 = __Block_byref_object_dispose__37;
  id v27 = 0;
  lock = self->_lock;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __36__ATXActionPredictionContainer_copy__block_invoke;
  v21[3] = &unk_1E68AF560;
  v21[4] = &v22;
  [(_PASLock *)lock runWithLockAcquired:v21];
  id v5 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  id v6 = (void *)[v5 copy];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__37;
  objc_super v26 = __Block_byref_object_dispose__37;
  id v27 = 0;
  id v7 = self->_lock;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __36__ATXActionPredictionContainer_copy__block_invoke_2;
  v20[3] = &unk_1E68AF560;
  v20[4] = &v22;
  [(_PASLock *)v7 runWithLockAcquired:v20];
  id v8 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  id v9 = (void *)[v8 copy];
  double v10 = (void *)[(ATXMinimalSlotResolutionParameters *)self->_parameters copy];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  LODWORD(v25) = 0;
  id v11 = self->_lock;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __36__ATXActionPredictionContainer_copy__block_invoke_3;
  v19[3] = &unk_1E68AF560;
  v19[4] = &v22;
  [(_PASLock *)v11 runWithLockAcquired:v19];
  int v12 = *((_DWORD *)v23 + 6);
  _Block_object_dispose(&v22, 8);
  actionKey = self->_actionKey;
  float v14 = self->_predictionItem.key;
  v17 = v14;
  memcpy(v18, &self->_predictionItem.actionHash, sizeof(v18));
  if (v3)
  {
    LODWORD(v15) = v12;
    id v3 = [(ATXActionPredictionContainer *)v3 initWithScoredAction:v6 slotSet:v9 minimalSlotResolutionParameters:v10 score:actionKey actionKey:&v17 predictionItem:v15];
  }
  else
  {
  }
  return v3;
}

void __36__ATXActionPredictionContainer_copy__block_invoke(uint64_t a1, uint64_t a2)
{
}

void __36__ATXActionPredictionContainer_copy__block_invoke_2(uint64_t a1, uint64_t a2)
{
}

float __36__ATXActionPredictionContainer_copy__block_invoke_3(uint64_t a1, uint64_t a2)
{
  float result = *(float *)(a2 + 24);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unint64_t)hash
{
  uint64_t v17 = 0;
  id v18 = (float *)&v17;
  uint64_t v19 = 0x3032000000;
  double v20 = __Block_byref_object_copy__37;
  v21 = __Block_byref_object_dispose__37;
  id v22 = 0;
  lock = self->_lock;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __36__ATXActionPredictionContainer_hash__block_invoke;
  v16[3] = &unk_1E68AF560;
  v16[4] = &v17;
  [(_PASLock *)lock runWithLockAcquired:v16];
  id v4 = *((id *)v18 + 5);
  _Block_object_dispose(&v17, 8);

  uint64_t v5 = [v4 hash];
  uint64_t v17 = 0;
  id v18 = (float *)&v17;
  uint64_t v19 = 0x3032000000;
  double v20 = __Block_byref_object_copy__37;
  v21 = __Block_byref_object_dispose__37;
  id v22 = 0;
  id v6 = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __36__ATXActionPredictionContainer_hash__block_invoke_2;
  v15[3] = &unk_1E68AF560;
  v15[4] = &v17;
  [(_PASLock *)v6 runWithLockAcquired:v15];
  id v7 = *((id *)v18 + 5);
  _Block_object_dispose(&v17, 8);

  uint64_t v8 = [v7 hash];
  unint64_t v9 = [(ATXMinimalSlotResolutionParameters *)self->_parameters hash];
  uint64_t v17 = 0;
  id v18 = (float *)&v17;
  uint64_t v19 = 0x2020000000;
  LODWORD(v20) = 0;
  double v10 = self->_lock;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __36__ATXActionPredictionContainer_hash__block_invoke_3;
  v14[3] = &unk_1E68AF560;
  v14[4] = &v17;
  [(_PASLock *)v10 runWithLockAcquired:v14];
  uint64_t v11 = v9 - (v8 - v5 + 32 * v5) + 32 * (v8 - v5 + 32 * v5);
  float v12 = v18[6];
  _Block_object_dispose(&v17, 8);
  return [(NSString *)self->_actionKey hash]
       - ((unint64_t)v12
        - v11
        + 32 * v11)
       + 32 * ((unint64_t)v12 - v11 + 32 * v11);
}

void __36__ATXActionPredictionContainer_hash__block_invoke(uint64_t a1, uint64_t a2)
{
}

void __36__ATXActionPredictionContainer_hash__block_invoke_2(uint64_t a1, uint64_t a2)
{
}

float __36__ATXActionPredictionContainer_hash__block_invoke_3(uint64_t a1, uint64_t a2)
{
  float result = *(float *)(a2 + 24);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXActionPredictionContainer *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXActionPredictionContainer *)self isEqualToActionPredictionContainer:v5];

  return v6;
}

- (BOOL)isEqualToActionPredictionContainer:(id)a3
{
  id v4 = (char *)a3;
  uint64_t v35 = 0;
  v36 = (float *)&v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__37;
  v39 = __Block_byref_object_dispose__37;
  id v40 = 0;
  lock = self->_lock;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke;
  v34[3] = &unk_1E68AF560;
  v34[4] = &v35;
  [(_PASLock *)lock runWithLockAcquired:v34];
  id v6 = *((id *)v36 + 5);
  _Block_object_dispose(&v35, 8);

  uint64_t v35 = 0;
  v36 = (float *)&v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__37;
  v39 = __Block_byref_object_dispose__37;
  id v40 = 0;
  id v7 = (void *)*((void *)v4 + 1);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_2;
  v33[3] = &unk_1E68AF560;
  v33[4] = &v35;
  [v7 runWithLockAcquired:v33];
  id v8 = *((id *)v36 + 5);
  _Block_object_dispose(&v35, 8);

  if (v6 == v8 || ([v6 isEqual:v8] & 1) != 0)
  {
    uint64_t v35 = 0;
    v36 = (float *)&v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__37;
    v39 = __Block_byref_object_dispose__37;
    id v40 = 0;
    unint64_t v9 = self->_lock;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_3;
    v32[3] = &unk_1E68AF560;
    v32[4] = &v35;
    [(_PASLock *)v9 runWithLockAcquired:v32];
    id v10 = *((id *)v36 + 5);
    _Block_object_dispose(&v35, 8);

    uint64_t v35 = 0;
    v36 = (float *)&v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__37;
    v39 = __Block_byref_object_dispose__37;
    id v40 = 0;
    uint64_t v11 = (void *)*((void *)v4 + 1);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_4;
    v31[3] = &unk_1E68AF560;
    v31[4] = &v35;
    [v11 runWithLockAcquired:v31];
    id v12 = *((id *)v36 + 5);
    _Block_object_dispose(&v35, 8);

    if (v10 != v12 && ([v10 isEqual:v12] & 1) == 0) {
      goto LABEL_16;
    }
    int v13 = self->_parameters;
    float v14 = (ATXMinimalSlotResolutionParameters *)*((id *)v4 + 414);
    if (v13 == v14)
    {
    }
    else
    {
      double v15 = v14;
      BOOL v16 = [(ATXMinimalSlotResolutionParameters *)v13 isEqual:v14];

      if (!v16) {
        goto LABEL_16;
      }
    }
    uint64_t v35 = 0;
    v36 = (float *)&v35;
    uint64_t v37 = 0x2020000000;
    LODWORD(v38) = 0;
    id v18 = self->_lock;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_5;
    v30[3] = &unk_1E68AF560;
    v30[4] = &v35;
    [(_PASLock *)v18 runWithLockAcquired:v30];
    float v19 = v36[6];
    _Block_object_dispose(&v35, 8);
    uint64_t v35 = 0;
    v36 = (float *)&v35;
    uint64_t v37 = 0x2020000000;
    LODWORD(v38) = 0;
    double v20 = (void *)*((void *)v4 + 1);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_6;
    v29[3] = &unk_1E68AF560;
    v29[4] = &v35;
    [v20 runWithLockAcquired:v29];
    float v21 = v36[6];
    _Block_object_dispose(&v35, 8);
    if (v19 == v21)
    {
      id v22 = self->_actionKey;
      uint64_t v23 = (NSString *)*((id *)v4 + 415);
      if (v22 == v23)
      {
      }
      else
      {
        uint64_t v24 = v23;
        char v25 = [(NSString *)v22 isEqual:v23];

        if ((v25 & 1) == 0) {
          goto LABEL_16;
        }
      }
      if (!memcmp(self->_predictionItem.inputSignals, v4 + 32, 0xCC4uLL))
      {
        key = self->_predictionItem.key;
        uint64_t v28 = *((void *)v4 + 2);
        if ((!((unint64_t)key | v28) || key && v28 && -[NSString isEqualToString:](key, "isEqualToString:"))
          && self->_predictionItem.score == *((float *)v4 + 825))
        {
          BOOL v17 = 1;
          goto LABEL_17;
        }
      }
    }
LABEL_16:
    BOOL v17 = 0;
LABEL_17:

    goto LABEL_18;
  }
  BOOL v17 = 0;
LABEL_18:

  return v17;
}

void __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

void __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_3(uint64_t a1, uint64_t a2)
{
}

void __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_4(uint64_t a1, uint64_t a2)
{
}

float __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_5(uint64_t a1, uint64_t a2)
{
  float result = *(float *)(a2 + 24);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

float __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_6(uint64_t a1, uint64_t a2)
{
  float result = *(float *)(a2 + 24);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (ATXPredictionItem)predictionItem
{
  retstr->key = self->_predictionItem.key;
  return (ATXPredictionItem *)memcpy(&retstr->actionHash, &self->_predictionItem.actionHash, 0xCD2uLL);
}

- (void)setPredictionItem:(ATXPredictionItem *)a3
{
  objc_storeStrong((id *)&self->_predictionItem.key, a3->key);
  memcpy(&self->_predictionItem.actionHash, &a3->actionHash, 0xCD2uLL);
  key = a3->key;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(ATXActionPredictionContainer *)self actionKey];
  uint64_t v5 = [(ATXActionPredictionContainer *)self scoredAction];
  id v6 = objc_msgSend(v3, "initWithFormat:", @"ATXPredictionContainer Action Key: %@; Scored Action: %@",
                 v4,
                 v5);

  return v6;
}

- (NSString)actionKey
{
  return self->_actionKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionKey, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((float *)self + 825) = -31337.0;
  *((_WORD *)self + 1652) = 0;
  for (uint64_t i = 32; i != 3300; i += 4)
    *(float *)((char *)self + i) = -31337.0;
  return self;
}

@end