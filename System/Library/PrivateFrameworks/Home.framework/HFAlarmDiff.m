@interface HFAlarmDiff
+ (id)generateAlarmDiffFromSet:(id)a3 toSet:(id)a4;
- (BOOL)inputWasEqual;
- (NSSet)addedAlarms;
- (NSSet)deletedAlarms;
- (NSSet)unmodifiedAlarms;
- (NSSet)updatedAlarms;
- (id)description;
- (void)setAddedAlarms:(id)a3;
- (void)setDeletedAlarms:(id)a3;
- (void)setUnmodifiedAlarms:(id)a3;
- (void)setUpdatedAlarms:(id)a3;
@end

@implementation HFAlarmDiff

+ (id)generateAlarmDiffFromSet:(id)a3 toSet:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v30 = a4;
  if (objc_msgSend(MEMORY[0x263F55D40], "hf_areAlarms:equalToAlarms:includeModificationDate:", v5))
  {
    v6 = objc_opt_new();
    [v6 setUnmodifiedAlarms:v5];
  }
  else
  {
    v7 = objc_opt_new();
    v31 = objc_opt_new();
    v28 = objc_opt_new();
    v8 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v27 = v5;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __46__HFAlarmDiff_generateAlarmDiffFromSet_toSet___block_invoke;
          v37[3] = &unk_264095EC8;
          v37[4] = v14;
          v15 = objc_msgSend(v30, "na_firstObjectPassingTest:", v37, v27);
          v16 = v7;
          if (v15)
          {
            if ([v15 isEqualIgnoringLastModifiedDate:v14]) {
              v16 = v8;
            }
            else {
              v16 = v31;
            }
          }
          [v16 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v11);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = v30;
    uint64_t v17 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 3221225472;
          aBlock[2] = __46__HFAlarmDiff_generateAlarmDiffFromSet_toSet___block_invoke_2;
          aBlock[3] = &unk_264095EC8;
          aBlock[4] = v21;
          v22 = _Block_copy(aBlock);
          char v23 = objc_msgSend(v7, "na_any:", v22);
          char v24 = objc_msgSend(v31, "na_any:", v22);
          char v25 = objc_msgSend(v8, "na_any:", v22);
          if ((v23 & 1) == 0 && (v24 & 1) == 0 && (v25 & 1) == 0) {
            [v28 addObject:v21];
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v18);
    }

    v6 = objc_opt_new();
    [v6 setAddedAlarms:v7];
    [v6 setDeletedAlarms:v28];
    [v6 setUpdatedAlarms:v31];
    [v6 setUnmodifiedAlarms:v8];

    id v5 = v27;
  }

  return v6;
}

uint64_t __46__HFAlarmDiff_generateAlarmDiffFromSet_toSet___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 alarmID];
  v4 = [*(id *)(a1 + 32) alarmID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __46__HFAlarmDiff_generateAlarmDiffFromSet_toSet___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 alarmID];
  v4 = [*(id *)(a1 + 32) alarmID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (BOOL)inputWasEqual
{
  v3 = [(HFAlarmDiff *)self addedAlarms];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = [(HFAlarmDiff *)self deletedAlarms];
    if ([v5 count])
    {
      BOOL v4 = 0;
    }
    else
    {
      v6 = [(HFAlarmDiff *)self updatedAlarms];
      BOOL v4 = [v6 count] == 0;
    }
  }

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  BOOL v4 = [(HFAlarmDiff *)self addedAlarms];
  uint64_t v5 = [v4 allObjects];
  [v3 appendArraySection:v5 withName:@"addedAlarms" skipIfEmpty:1 objectTransformer:0];

  v6 = [(HFAlarmDiff *)self deletedAlarms];
  v7 = [v6 allObjects];
  [v3 appendArraySection:v7 withName:@"deletedAlarms" skipIfEmpty:1 objectTransformer:0];

  v8 = [(HFAlarmDiff *)self updatedAlarms];
  id v9 = [v8 allObjects];
  [v3 appendArraySection:v9 withName:@"updatedAlarms" skipIfEmpty:1 objectTransformer:0];

  uint64_t v10 = [(HFAlarmDiff *)self unmodifiedAlarms];
  uint64_t v11 = [v10 allObjects];
  [v3 appendArraySection:v11 withName:@"unmodifiedAlarms" skipIfEmpty:1 objectTransformer:0];

  uint64_t v12 = [v3 build];

  return v12;
}

- (NSSet)updatedAlarms
{
  return self->_updatedAlarms;
}

- (void)setUpdatedAlarms:(id)a3
{
}

- (NSSet)addedAlarms
{
  return self->_addedAlarms;
}

- (void)setAddedAlarms:(id)a3
{
}

- (NSSet)deletedAlarms
{
  return self->_deletedAlarms;
}

- (void)setDeletedAlarms:(id)a3
{
}

- (NSSet)unmodifiedAlarms
{
  return self->_unmodifiedAlarms;
}

- (void)setUnmodifiedAlarms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmodifiedAlarms, 0);
  objc_storeStrong((id *)&self->_deletedAlarms, 0);
  objc_storeStrong((id *)&self->_addedAlarms, 0);
  objc_storeStrong((id *)&self->_updatedAlarms, 0);
}

@end