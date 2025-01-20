@interface FIMutableTimeSliceGroup
+ (id)timeSliceGroupForQuantityTypes:(id)a3 startDate:(id)a4;
- (BOOL)allSlicesFinalized;
- (FIMutableTimeSliceGroup)initWithTimeSlices:(id)a3;
- (NSArray)slices;
- (void)commitAllSlicesToDate:(id)a3;
- (void)updateSlicesWithEndDate:(id)a3;
- (void)updateSlicesWithSample:(id)a3;
@end

@implementation FIMutableTimeSliceGroup

- (FIMutableTimeSliceGroup)initWithTimeSlices:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIMutableTimeSliceGroup;
  v6 = [(FIMutableTimeSliceGroup *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_slices, a3);
  }

  return v7;
}

+ (id)timeSliceGroupForQuantityTypes:(id)a3 startDate:(id)a4
{
  id v5 = a4;
  v6 = [a3 allObjects];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__FIMutableTimeSliceGroup_timeSliceGroupForQuantityTypes_startDate___block_invoke;
  v11[3] = &unk_26441CC88;
  id v12 = v5;
  id v7 = v5;
  v8 = objc_msgSend(v6, "fi_mapUsingBlock:", v11);

  objc_super v9 = [[FIMutableTimeSliceGroup alloc] initWithTimeSlices:v8];
  return v9;
}

FIQuantityTimeSlice *__68__FIMutableTimeSliceGroup_timeSliceGroupForQuantityTypes_startDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[FIQuantityTimeSlice alloc] initWithQuantityType:v3 startDate:*(void *)(a1 + 32)];

  return v4;
}

- (void)commitAllSlicesToDate:(id)a3
{
  id v4 = a3;
  slices = self->_slices;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__FIMutableTimeSliceGroup_commitAllSlicesToDate___block_invoke;
  v9[3] = &unk_26441CCB0;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSArray *)slices fi_mapUsingBlock:v9];
  v8 = self->_slices;
  self->_slices = v7;
}

uint64_t __49__FIMutableTimeSliceGroup_commitAllSlicesToDate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 committingUntilDate:*(void *)(a1 + 32)];
}

- (void)updateSlicesWithEndDate:(id)a3
{
  id v4 = a3;
  slices = self->_slices;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__FIMutableTimeSliceGroup_updateSlicesWithEndDate___block_invoke;
  v9[3] = &unk_26441CCB0;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSArray *)slices fi_mapUsingBlock:v9];
  v8 = self->_slices;
  self->_slices = v7;
}

uint64_t __51__FIMutableTimeSliceGroup_updateSlicesWithEndDate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 settingEndDate:*(void *)(a1 + 32)];
}

- (void)updateSlicesWithSample:(id)a3
{
  id v4 = a3;
  slices = self->_slices;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__FIMutableTimeSliceGroup_updateSlicesWithSample___block_invoke;
  v9[3] = &unk_26441CCB0;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSArray *)slices fi_mapUsingBlock:v9];
  v8 = self->_slices;
  self->_slices = v7;
}

id __50__FIMutableTimeSliceGroup_updateSlicesWithSample___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 quantityType];
  id v5 = [*(id *)(a1 + 32) quantityType];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    id v7 = *(id *)(a1 + 32);
    id v8 = v3;
    id v13 = 0;
    id v9 = [v8 addingSample:v7 error:&v13];
    id v10 = v13;
    if (v10)
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x263F09970];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v15 = v7;
        __int16 v16 = 2112;
        id v17 = v8;
        __int16 v18 = 2112;
        id v19 = v10;
        _os_log_error_impl(&dword_21C74B000, v11, OS_LOG_TYPE_ERROR, "Adding sample %@ to quantity slice %@ caused error: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v9 = v3;
  }

  return v9;
}

- (BOOL)allSlicesFinalized
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_slices;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "finalized", (void)v9))
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (NSArray)slices
{
  return self->_slices;
}

- (void).cxx_destruct
{
}

@end