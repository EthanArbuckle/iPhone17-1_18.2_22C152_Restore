@interface HFTimeRangeCondition
+ (id)_primitiveTimePredicateClasses;
- (HFPrimitiveTimeCondition)endCondition;
- (HFPrimitiveTimeCondition)startCondition;
- (HFTimeRangeCondition)initWithPredicate:(id)a3;
- (HFTimeRangeCondition)initWithStartCondition:(id)a3 endCondition:(id)a4;
- (id)description;
- (unint64_t)timeConditionType;
@end

@implementation HFTimeRangeCondition

+ (id)_primitiveTimePredicateClasses
{
  if (_MergedGlobals_2_6 != -1) {
    dispatch_once(&_MergedGlobals_2_6, &__block_literal_global_9_11);
  }
  v2 = (void *)qword_26AB2EA68;
  return v2;
}

void __54__HFTimeRangeCondition__primitiveTimePredicateClasses__block_invoke_2()
{
  v4[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)qword_26AB2EA68;
  qword_26AB2EA68 = v2;
}

- (HFTimeRangeCondition)initWithPredicate:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)HFTimeRangeCondition;
  v5 = [(HFCondition *)&v51 initWithPredicate:v4];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_49:
      v37 = 0;
      goto LABEL_50;
    }
    id v6 = v4;
    v7 = [v6 subpredicates];
    uint64_t v8 = [v7 count];

    if (v8 != 2) {
      goto LABEL_48;
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v40 = v6;
    id obj = [v6 subpredicates];
    uint64_t v9 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v48;
      id v39 = v4;
LABEL_6:
      uint64_t v12 = 0;
      while (2)
      {
        if (*(void *)v48 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v47 + 1) + 8 * v12);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        v14 = [(id)objc_opt_class() _primitiveTimePredicateClasses];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v44;
LABEL_11:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v44 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = [objc_alloc(*(Class *)(*((void *)&v43 + 1) + 8 * v18)) initWithPredicate:v13];
            if (v19) {
              break;
            }
            if (v16 == ++v18)
            {
              uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:v52 count:16];
              if (v16) {
                goto LABEL_11;
              }
              goto LABEL_26;
            }
          }
          v20 = (void *)v19;

          if ([v20 comparisonType] == 2
            && (p_startCondition = (id *)&v5->_startCondition, !v5->_startCondition)
            || ![v20 comparisonType] && (p_startCondition = (id *)&v5->_endCondition, !v5->_endCondition))
          {
            objc_storeStrong(p_startCondition, v20);
          }

          if (++v12 != v10) {
            continue;
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
          id v4 = v39;
          if (v10) {
            goto LABEL_6;
          }
        }
        else
        {
LABEL_26:

          id v4 = v39;
        }
        break;
      }
    }

    startCondition = v5->_startCondition;
    id v6 = v40;
    if (!startCondition || !v5->_endCondition)
    {
LABEL_48:

      goto LABEL_49;
    }
    v23 = startCondition;
    v24 = &unk_26C144C08;
    int v25 = [(HFPrimitiveTimeCondition *)v23 conformsToProtocol:v24];
    if (v25) {
      v26 = v23;
    }
    else {
      v26 = 0;
    }
    v27 = v26;

    v28 = v5->_endCondition;
    v29 = &unk_26C144C08;
    if ([(HFPrimitiveTimeCondition *)v28 conformsToProtocol:v29]) {
      v30 = v28;
    }
    else {
      v30 = 0;
    }
    v31 = v30;

    v32 = v27;
    v33 = v31;
    v34 = v33;
    uint64_t v35 = 0;
    v42 = v33;
    if (v32 && v33) {
      uint64_t v35 = [(HFPrimitiveTimeCondition *)v32 compare:v33];
    }
    uint64_t v36 = [v40 compoundPredicateType];
    if (v36 == 2)
    {
      if (!v25 || !v34 || v35 == -1) {
        goto LABEL_47;
      }
    }
    else if (v36 != 1 || v35 == 1)
    {
LABEL_47:

      goto LABEL_48;
    }
  }
  v37 = v5;
LABEL_50:

  return v37;
}

uint64_t __42__HFTimeRangeCondition_initWithPredicate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2 && *(void *)(a1 + 40)) {
    return objc_msgSend(v2, "compare:");
  }
  else {
    return 0;
  }
}

- (HFTimeRangeCondition)initWithStartCondition:(id)a3 endCondition:(id)a4
{
  v32[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = &unk_26C144C08;
  if ([v7 conformsToProtocol:v8]) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  id v11 = v6;
  uint64_t v12 = &unk_26C144C08;
  if ([v11 conformsToProtocol:v12]) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  uint64_t v29 = MEMORY[0x263EF8330];
  v30 = v10;
  v31 = v14;
  id v15 = v10;
  id v16 = v14;
  uint64_t v17 = 0;
  if (v15) {
    BOOL v18 = v16 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18) {
    uint64_t v17 = [v15 compare:v16];
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = v17;
  if (v17 == 1) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = 1;
  }
  id v20 = objc_alloc(MEMORY[0x263F08730]);
  v21 = objc_msgSend(v7, "predicate", v27, 3221225472, __60__HFTimeRangeCondition_initWithStartCondition_endCondition___block_invoke_2, &__block_descriptor_40_e5_Q8__0l, v28, v29, 3221225472, __60__HFTimeRangeCondition_initWithStartCondition_endCondition___block_invoke, &unk_264091450);
  v32[0] = v21;
  v22 = [v11 predicate];
  v32[1] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
  v24 = (void *)[v20 initWithType:v19 subpredicates:v23];

  int v25 = [(HFTimeRangeCondition *)self initWithPredicate:v24];
  return v25;
}

uint64_t __60__HFTimeRangeCondition_initWithStartCondition_endCondition___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2 && *(void *)(a1 + 40)) {
    return objc_msgSend(v2, "compare:");
  }
  else {
    return 0;
  }
}

uint64_t __60__HFTimeRangeCondition_initWithStartCondition_endCondition___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32) == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFTimeRangeCondition *)self startCondition];
  id v5 = (id)[v3 appendObject:v4 withName:@"startCondition"];

  id v6 = [(HFTimeRangeCondition *)self endCondition];
  id v7 = (id)[v3 appendObject:v6 withName:@"endCondition"];

  uint64_t v8 = [v3 build];

  return v8;
}

- (unint64_t)timeConditionType
{
  v3 = [(HFTimeRangeCondition *)self startCondition];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_7;
  }
  id v4 = [(HFTimeRangeCondition *)self endCondition];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    id v6 = [(HFTimeRangeCondition *)self startCondition];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_18:

      goto LABEL_19;
    }
    id v14 = [(HFTimeRangeCondition *)self endCondition];
    objc_opt_class();
    char v15 = objc_opt_isKindOfClass();

    if ((v15 & 1) == 0) {
      goto LABEL_19;
    }
    id v6 = [(HFTimeRangeCondition *)self startCondition];
    id v7 = [(HFTimeRangeCondition *)self endCondition];
    if ([v6 isTimeOfDayCondition]
      && [v7 isTimeOfDayCondition])
    {

      return 2;
    }
LABEL_17:

    goto LABEL_18;
  }
  id v6 = [(HFTimeRangeCondition *)self startCondition];
  id v7 = [(HFTimeRangeCondition *)self endCondition];
  uint64_t v8 = [v6 significantEvent];
  uint64_t v9 = *MEMORY[0x263F0D908];
  if ([v8 isEqualToString:*MEMORY[0x263F0D908]])
  {
    id v10 = [v7 significantEvent];
    uint64_t v11 = *MEMORY[0x263F0D8F8];
    int v12 = [v10 isEqualToString:*MEMORY[0x263F0D8F8]];

    if (v12)
    {

      return 1;
    }
  }
  else
  {

    uint64_t v11 = *MEMORY[0x263F0D8F8];
  }
  id v16 = [v6 significantEvent];
  if (![v16 isEqualToString:v11])
  {

    goto LABEL_17;
  }
  uint64_t v17 = [v7 significantEvent];
  char v18 = [v17 isEqualToString:v9];

  if (v18) {
    return 0;
  }
LABEL_19:
  v19.receiver = self;
  v19.super_class = (Class)HFTimeRangeCondition;
  return [(HFTimeCondition *)&v19 timeConditionType];
}

- (HFPrimitiveTimeCondition)startCondition
{
  return self->_startCondition;
}

- (HFPrimitiveTimeCondition)endCondition
{
  return self->_endCondition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endCondition, 0);
  objc_storeStrong((id *)&self->_startCondition, 0);
}

@end